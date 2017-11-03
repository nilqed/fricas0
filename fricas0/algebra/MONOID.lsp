
(DECLAIM (NOTINLINE |Monoid;|)) 

(DEFPARAMETER |Monoid;AL| 'NIL) 

(DEFUN |Monoid| ()
  (LET (#:G692)
    (COND (|Monoid;AL|) (T (SETQ |Monoid;AL| (|Monoid;|)))))) 

(DEFUN |Monoid;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1 (LETT #1# (|Join| (|SemiGroup|) (|MagmaWithUnit|)) |Monoid|)
           (SETELT #1# 0 '(|Monoid|))))) 

(MAKEPROP '|Monoid| 'NILADIC T) 
