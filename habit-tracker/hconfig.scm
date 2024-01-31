(define-module
  (habit-tracker hconfig)
  #:use-module
  (srfi srfi-26)
  #:export
  (%version
    %author
    %license
    %copyright
    %gettext-domain
    G_
    N_
    init-nls
    init-locale))

(define %version "0.1")

(define %author "Serra Allgood")

(define %license 'gpl3+)

(define %copyright '(2024))

(define %gettext-domain "guile-habit-tracker")

(define G_ identity)

(define N_ identity)

(define (init-nls) "Dummy as no NLS is used" #t)

(define (init-locale)
  "Dummy as no NLS is used"
  #t)

