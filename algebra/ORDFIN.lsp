
(DECLAIM (NOTINLINE |OrderedFinite;|)) 

(DEFPARAMETER |OrderedFinite;AL| 'NIL) 

(DEFUN |OrderedFinite| ()
  (LET (#:G692)
    (COND (|OrderedFinite;AL|)
          (T (SETQ |OrderedFinite;AL| (|OrderedFinite;|)))))) 

(DEFUN |OrderedFinite;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1 (LETT #1# (|Join| (|OrderedSet|) (|Finite|)) |OrderedFinite|)
           (SETELT #1# 0 '(|OrderedFinite|))))) 

(MAKEPROP '|OrderedFinite| 'NILADIC T) 
