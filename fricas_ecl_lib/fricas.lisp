;;; FriCAS0, Sa, 11. Nov 2017 20:30:14
(load "interp/libfricas.fas")  ;;; interp
(load "interp/exposed.lsp")
;(load "load-algebra.lisp")
(in-package :boot)
(defvar $spadroot ".")
(defvar |$defaultMsgDatabaseName| "msgs/s2-us.msgs")
(defvar |$build_version| "COMMON-LISP ECL")
(defvar |$build_date| "Sa, 11. Nov 2017 20:30:14")
 
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
