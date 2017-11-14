;;; This file contains portablity and support routines which abstract away
;;; differences between Lisp dialects.

(in-package "FRICAS-LISP")


(defun set-initial-parameters()
    (setf *print-circle* t)
    (setf *compile-print* nil)
    (setf *read-default-float-format* 'double-float))


(eval-when (:execute :load-toplevel)
    (set-initial-parameters))


(defun save-core (core-image)
     (save-core-restart core-image nil))

;; Load Lisp files (any LOADable file), given as a list of file names.
;; The file names are strings, as approrpriate for LOAD.
(defun load-lisp-files (files)
  (mapcar #'(lambda (f) (load f)) files))
             
             
;;; How to exit Lisp process
(defun exit-with-status (s) (ext::exit :status s))
(defun quit() (exit-with-status 0))

;;; Making (linking) program
(defun make-program (core-image lisp-files)
    (load-lisp-files lisp-files)
    (save-core core-image))


;;; Deleting files ignoring errors
(defun |maybe_delete_file| (file)
    (ignore-errors (delete-file file)))


;;; get CWD //kfp <--new
(defun getcwd ()
    "Get the current working directory as per POSIX getcwd(3), as a pathname object"
      (truename *default-pathname-defaults*))


;;; Chdir function
(defun chdir (x)
    "Change current directory, as per POSIX chdir(2), to a given pathname object"
    (if (eq x nil)
      (truename *default-pathname-defaults*)
      (setf *default-pathname-defaults* (truename x))))
        

;;; Environment access
(defun |getEnv| (var-name)
 (ext:getenv var-name)
  )

;;; Command-line arguments
(defun |getCLArgs| ()
  ext:*command-line-argument-list* )

;;; Silent loading of files
(defun |load_quietly| (f)
    ;;; (format *error-output* "entred load_quietly ~&")
    (handler-bind ((warning #'muffle-warning))
                  (load f))
    ;;; (format *error-output* "finished load_quietly ~&")
)

(defun |quiet_load_alien|(s)
    #+:sbcl
    (handler-bind ((style-warning #'muffle-warning))
          (sb-alien::load-shared-object s))
    #+:openmcl
    (ccl::open-shared-library s)
    #+:lispworks
    (fli:register-module s)
)

;;; -------------------------------------------------------
;;;
;;; FriCAS FFI macros
;;;

(eval-when (:compile-toplevel :load-toplevel :execute)

(defvar *c-type-to-ffi*)
(defun c-type-to-ffi (c-type)
   (let ((pp (assoc c-type *c-type-to-ffi*)))
        (if pp (nth 1 pp) (break))))

)



#+(and :clisp :ffi)
(eval-when (:compile-toplevel :load-toplevel :execute)

(setf *c-type-to-ffi* '(
    (int ffi:int)
    (c-string  ffi:c-string)
    (double ffi:double-float)
))

(defun c-args-to-clisp (arguments)
   (mapcar (lambda (x) (list (nth 0 x) (c-type-to-ffi (nth 1 x)))) arguments))

(defun clisp-foreign-call (name c-name return-type arguments)
    (let ((clisp-args (c-args-to-clisp arguments))
          (clisp-ret (c-type-to-ffi return-type)))
     `(eval (quote (ffi:def-call-out ,name
          ;;; (:library "./libspad.so")
          (:name ,c-name)
          (:arguments ,@clisp-args)
          (:return-type ,clisp-ret)
          (:language :stdc))))
     ))

(defmacro fricas-foreign-call (name c-name return-type &rest arguments)
     (clisp-foreign-call name c-name return-type arguments))

)



;;;
;;; Foreign routines
;;;

(defmacro foreign-defs (&rest arguments)
    #-:clisp `(progn ,@arguments)
    #+(and :clisp :ffi) `(defun clisp-init-foreign-calls () ,@arguments)
)

(foreign-defs

#-:ABCL
(fricas-foreign-call |writeablep| "writeablep" int
        (filename c-string))

#+:fricas_has_remove_directory
(fricas-foreign-call |remove_directory| "remove_directory" int
        (dir_name c-string))

#-:ABCL
(fricas-foreign-call |openServer| "open_server" int
        (server_name c-string))
#-:ABCL
(fricas-foreign-call |sockGetInt| "sock_get_int" int
        (purpose int))

#-:ABCL
(fricas-foreign-call |sockSendInt| "sock_send_int" int
        (purpose int)
        (val int))


#-:ABCL
(fricas-foreign-call |sockGetFloat| "sock_get_float" double
        (purpose int))

#-:ABCL
(fricas-foreign-call |sockSendFloat| "sock_send_float" int
       (purpose int)
       (num double))

;;; (fricas-foreign-call |sockSendString| "sock_send_string" int
;;;       (purpose int)
;;;       (str c-string))

#-:ABCL
(fricas-foreign-call sock_send_string_len "sock_send_string_len" int
       (purpose int)
       (str c-string)
       (len int))

#-:ABCL
(defun |sockSendString| (purpose str)
     (sock_send_string_len purpose str (length str)))

#-:ABCL
(fricas-foreign-call |serverSwitch| "server_switch" int)

#-:ABCL
(fricas-foreign-call |sockSendSignal| "sock_send_signal" int
       (purpose int)
       (sig int))


#+(and :clisp :ffi)
(eval '(FFI:DEF-CALL-OUT sock_get_string_buf
    (:NAME "sock_get_string_buf")
    (:arguments (purpose ffi:int)
    (buf (FFI:C-POINTER (FFI:C-ARRAY FFI::char 10000)))
    (len ffi:int))
    (:return-type ffi:int)
    (:language :stdc)))

)

#+(and :clisp :ffi)
(defun |sockGetStringFrom| (purpose)
    (let ((buf nil))
        (FFI:WITH-C-VAR (tmp-buf '(FFI:C-ARRAY
                                   FFI::char 10000))
            (sock_get_string_buf purpose (FFI:C-VAR-ADDRESS tmp-buf) 10000)
            (prog ((len2 10000))
                (dotimes (i 10000)
                    (if (eql 0 (FFI:ELEMENT tmp-buf i))
                        (progn
                            (setf len2 i)
                            (go nn1))))
              nn1
                (setf buf (make-string len2))
                (dotimes (i len2)
                    (setf (aref buf i)
                          (code-char (FFI:ELEMENT tmp-buf i)))))
        )
        buf
    )
)


;;; -------------------------------------------------------
;;; File and directory support
;;; First version contributed by Juergen Weiss.


(defun trim-directory-name (name)
    (if (char= (char name (1- (length name))) #\/)
        (setf name (subseq name 0 (1- (length name)))))
    name)

(defun pad-directory-name (name)
   (if (char= (char name (1- (length name))) #\/)
       name
       (concatenate 'string name "/")))


;;; Make directory
;;; Note that the trailing slash here is important. 
;;; Without it (specifying "/path/name"), this would 
;;; create /path, on the assumption that you wanted 
;;; to later create a regular file called name 
;;; See also: hyperspec entry for ensure-directories-exist.  
(defun makedir (fname)
    (ENSURE-DIRECTORIES-EXIST 
        (pad-directory-name fname) :verbose 'T))
;(ext::run-shell-command 
;(concatenate 'string "mkdir " fname)))


;;;
(defun file-kind (filename)
    (let* ((fname (trim-directory-name (namestring filename)))
                   (dname (pad-directory-name fname)))
             (if (ignore-errors (truename dname))
                 1
                 (if (ignore-errors (truename fname))
                     0
                    -1))))                                                                                      
          

#+(or :ecl :GCL :sbcl :clisp :openmcl :abcl)
(defun get-current-directory ()
    (trim-directory-name (namestring (truename ""))))

(defun |fricas_probe_file| (file)
    (let* ((fname (trim-directory-name (namestring file)))
               (dname (pad-directory-name fname)))
                 (or (ignore-errors (truename dname))
                     (ignore-errors (truename fname)))))

(defun relative-to-absolute (name)
    (let ((ns (namestring name)))
         (if (and (consp (pathname-directory name))
                  (eq (car (pathname-directory name))
                      #-:GCL :absolute #+:GCL :root))
             ns
             (concatenate 'string (get-current-directory)  "/" ns))))



;;; Saner version of compile-file
(defun fricas_compile_file (f output-file)
    (compile-file f :output-file (relative-to-absolute output-file)))

(defun fricas_compile_fasl (f output-file)
    (fricas_compile_file f output-file))

(defmacro DEFCONST (name value)
   `(defconstant ,name (if (boundp ',name) (symbol-value ',name) ,value)))


(defmacro MEMQ (a b) `(member ,a ,b :test #'eq))

(defun |handle_input_file|(fn fun args)
    (with-open-file (stream fn :direction :input
       :if-does-not-exist nil)
       (APPLY fun (cons stream args))))

(defun |handle_output_file|(fn fun args)
    (with-open-file (stream fn :direction :output
       :if-exists :supersede)
       (APPLY fun (cons stream args))))

(in-package "BOOT")

;;; Macros used in Boot code

(defmacro IFCAR (x)
  (if (atom x)
      `(and (consp ,x) (qcar ,x))
    (let ((xx (gensym)))
      `(let ((,xx ,x))
         (and (consp ,xx) (qcar ,xx))))))

(defmacro IFCDR (x)
  (if (atom x)
      `(and (consp ,x) (qcdr ,x))
    (let ((xx (gensym)))
      `(let ((,xx ,x))
         (and (consp ,xx) (qcdr ,xx))))))

(defmacro |function| (name) `(FUNCTION ,name))

(defmacro |replaceString| (result part start)
    `(replace ,result ,part :start1 ,start))

(defmacro |elapsedUserTime| () '(get-internal-run-time))

(defmacro |elapsedGcTime| () '0)

(defmacro |char| (arg)
  (cond ((stringp arg) (character arg))
        ((integerp arg) (code-char arg))
        ((and (consp arg) (eq (car arg) 'quote)) (character (cadr arg)))
        (t `(character ,arg))))

(defmacro add1 (x) `(1+ ,x))

(defmacro assq (a b)
 `(assoc ,a ,b :test #'eq))

(defmacro fetchchar (x i)
 `(char ,x ,i))

(defmacro fixp (x)
 `(integerp ,x))

(defmacro identp (x)
 (if (atom x)
  `(and ,x (symbolp ,x))
   (let ((xx (gensym)))
    `(let ((,xx ,x))
      (and ,xx (symbolp ,xx))))))

(defmacro LASTNODE (l)
 `(last ,l))

(defmacro makestring (a) a)

(defmacro maxindex (x)
 `(the fixnum (1- (the fixnum (length ,x)))))

(defmacro refvecp (v) `(simple-vector-p ,v))

(defmacro sintp (n)
 `(typep ,n 'fixnum))

(defmacro stringlength (x)
 `(length (the string ,x)))

(defmacro subrp (x)
 `(compiled-function-p ,x))

(defmacro vecp (v) `(simple-vector-p ,v))

;;; The following defines syntax of Spad identifiers

(defmacro |startsId?| (x)
    `(or (alpha-char-p ,x) (member ,x '(#\? #\% #\!) :test #'char=)))

(defmacro |idChar?| (x)
    `(or (alphanumericp ,x) (member ,x '(#\? #\% #\' #\!) :test #'char=)))

(in-package "BOOTTRAN")

(defmacro |doInBoottranPackage| (expr)
    `(let ((*PACKAGE* (find-package "BOOTTRAN")))
         ,expr))