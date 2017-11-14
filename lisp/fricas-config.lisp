(in-package "FRICAS-LISP")
(defparameter algebra-optimization (quote nil))
(if (not (member :fricas_has_remove_directory  *features*))  (push :fricas_has_remove_directory *features*))
