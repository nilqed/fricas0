;;; FriCAS0, Tue Oct 31 21:55:28 CET 2017
(load "interp.lisp")
(in-package :boot)
(defvar $spadroot ".")
(defvar |$defaultMsgDatabaseName| "msgs/s2-us.msgs")
(defvar |$build_version| "COMMON-LISP")
(defvar |$build_date| "Tue Oct 31 21:55:28 CET 2017")
 
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
