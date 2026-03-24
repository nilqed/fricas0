(load "lisp/load-lisp.lisp")
(load "lisp/interp.lisp")
(in-package :boot)
(setq |$spadroot| ".")
(defvar |$defaultMsgDatabaseName| "msgs/s2-us.msgs")
(defvar |$build_version| "Common Lisp - 1.3.12")
(defvar |$build_date| "Wed Jun 4 2025")
(defvar |$lisp_id_string| (concatenate 'string (lisp-implementation-type) " " (lisp-implementation-version)))


#+:ABCL
(defvar |$lisp_bin_filetype| "abcl")  ;;; abcl ~ fasl/fas

#+:SBCL
(fricas-lisp::set-initial-parameters) ;; this is skipped in fricas-lisp.lisp, why?

(defun gcmsg (x))

(setq load-type "load-ondemand")

(defun |load_quietly| (f)
  (handler-bind ((warning #'muffle-warning))
    (let ((lsp-file (CONCAT (string-right-trim |$lisp_bin_filetype| f) "lsp")))
      (cond
        ((and (boundp 'load-type) (equal load-type "load-ondemand"))
         (load (if (probe-file f) f lsp-file)))
        ((and (boundp 'load-type) (equal load-type "compile-ondemand"))
         (load (if (probe-file f) f (compile-file lsp-file))))
        (t (load f))
        ))))

;;; init
(|interpsysInitialization| t)

(setq |$has_category_hash| (make-hash-table :test #'equal))
(setq |$operation_hash| (make-hash-table))


 (|open_interp_db| t)
 (|open_category_db| t)
 (|open_operation_db| t)
 (|open_browse_db| t)


(let ((*debugger-hook*
            (lambda (condition previous-handler)
                (|spad_system_error_handler| condition))
       ))
     (handler-bind ((error #'|spad_system_error_handler|))
       (|spad|)))
