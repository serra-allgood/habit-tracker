(hall-description
  (name "habit-tracker")
  (prefix "guile")
  (version "0.1")
  (author "Serra Allgood")
  (email "")
  (copyright (2024))
  (synopsis "")
  (description "")
  (home-page "")
  (license gpl3+)
  (dependencies `())
  (skip ())
  (features
    ((guix #f)
     (use-guix-specs-for-dependencies #f)
     (native-language-support #f)
     (licensing #f)))
  (files (libraries
           ((scheme-file "habit-tracker")
            (directory
              "habit-tracker"
              ((scheme-file "hconfig")))))
         (tests ((directory "tests" ())))
         (programs ((directory "scripts" ())))
         (documentation
           ((org-file "README")
            (symlink "README" "README.org")
            (text-file "HACKING")
            (text-file "COPYING")
            (directory "doc" ((texi-file "habit-tracker")))))
         (infrastructure
           ((scheme-file "guix")
            (text-file ".gitignore")
            (scheme-file "hall")))))
