(load "lisp/load-lisp.lisp")
(load "lisp/interp.lisp")
(in-package :boot)
(defvar $spadroot ".")
(defvar |$defaultMsgDatabaseName| "msgs/s2-us.msgs")
(defvar |$build_version| "Common Lisp")
(defvar |$build_date| "Fri Nov 3 16:25:22 CET 2017")


#+:ABCL
(defvar |$lisp_bin_filetype| "abcl")  ;;; abcl ~ fasl/fas

(defun gcmsg (x))

;;; init      
(|interpsysInitialization|)

(setq |$has_category_hash| (make-hash-table :test #'equal))
(setq |$operation_hash| (make-hash-table))


 (|compressOpen|)
 (|interpOpen|)
 (|categoryOpen|)
 (|operationOpen|)
 (|browseOpen|)


(let ((*debugger-hook*
            (lambda (condition previous-handler)
                (spad-system-error-handler condition))
       ))
     (handler-bind ((error #'spad-system-error-handler))
       (|spad|)))
