;;; This file is loaded by bootstrap.scm when Impromptu loads.
;;; See the comment there.

(macro (comment args) ())               ; (comment (ignored stuff))

;; Holds the list of previously required files. See require below.
(define *required-files* ())

;; Loads each argument as a Lisp file using load-my-file. Each file is
;; loaded only if it has not been loaded before.
(define require
  (lambda args
    (for-each
     (lambda (arg)
       (if (member arg *required-files*)
           #t
           (begin
             (load-my-file arg)
             (set! *required-files* (cons arg *required-files*)))))
     args)))
