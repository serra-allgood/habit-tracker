#!/opt/homebrew/bin/guile \
-e main -s
!#

(use-modules  (ice-9 getopt-long)
              (srfi srfi-19))

(define habit-tracker-dir (string-append (passwd:dir (getpw (getlogin))) file-name-separator-string ".habit-tracker"))
(define make-habit-dir (lambda ()
  (begin
    (mkdir habit-tracker-dir)
    (display (string-append "Created habit-tracker directory at " habit-tracker-dir))
    (newline))))

(define (main args)
  (let* (
    (option-spec '(
      (help (single-char #\h) (value #f))
      (add  (single-char #\a) (value #t))
    ))
    (options (getopt-long args option-spec))
    (help-wanted (option-ref options 'help #f))
    (add-habit (option-ref options 'add #f))
    (display-help-message (lambda () (begin
      (display "\
habit-tracker [options]
-a, --add     Add a habit entry
-h, --help    Display this help message")
      (newline))))
  )
  (cond
    (help-wanted (display-help-message))
    ((not (string-null? add-habit))
      (begin
        (unless (file-exists? habit-tracker-dir) (make-habit-dir))
        (let* ((now (date->string (current-date) "~1"))
              (file-name (string-append habit-tracker-dir file-name-separator-string now))
              (port (open-file file-name "a")))
        (begin
          (display add-habit port)
          (newline port)
          (close port))
          (display (string-append add-habit " has been logged for " now))))
        (newline)))))
