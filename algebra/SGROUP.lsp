
(DECLAIM (NOTINLINE |SemiGroup;|)) 

(DEFPARAMETER |SemiGroup;AL| 'NIL) 

(DEFUN |SemiGroup| ()
  (LET (#:G692)
    (COND (|SemiGroup;AL|) (T (SETQ |SemiGroup;AL| (|SemiGroup;|)))))) 

(DEFUN |SemiGroup;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1 (LETT #1# (|Join| (|Magma|)) |SemiGroup|)
           (SETELT #1# 0 '(|SemiGroup|))))) 

(MAKEPROP '|SemiGroup| 'NILADIC T) 
