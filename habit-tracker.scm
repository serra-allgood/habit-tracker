#!/opt/homebrew/bin/guile \
-e main -s
!#

(use-modules  (ice-9 getopt-long)
              (ice-9 textual-ports)
              (srfi srfi-19))

(define habit-tracker-dir (string-append (passwd:dir (getpw (getlogin))) file-name-separator-string ".habit-tracker"))

(define (main args)
  (let* (
    (option-spec '(
      (help (single-char #\h) (value #f))
      (add  (single-char #\a) (value #t))
    ))
    (options (getopt-long args option-spec))
    (help-wanted (option-ref options 'help #f))
    (add-habit (option-ref options 'add #f))
  )
  (if help-wanted
    (begin
      (display "\
habit-tracker [options]
-a, --add     Add a habit entry
-h, --help    Display this help message")
      (newline))
    (begin
      (if (not (file-exists? habit-tracker-dir))
        (begin
          (mkdir habit-tracker-dir)
          (display (string-append "Created habit-tracker directory at " habit-tracker-dir))
          (newline)))
      (if (not (string-null? add-habit))
        (let* (
          (now (date->string (current-date) "~1"))
          (file-name (string-append habit-tracker-dir file-name-separator-string now))
        )
        (begin
          (call-with-output-file file-name
            (lambda (port) (put-string port (string-append add-habit "\n")))
          ))
          (display (string-append add-habit " has been logged for " now))
        )
      )
      (newline)
    )
  )
))
