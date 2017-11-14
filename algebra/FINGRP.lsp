
(DECLAIM (NOTINLINE |FiniteGroup;|)) 

(DEFPARAMETER |FiniteGroup;AL| 'NIL) 

(DEFUN |FiniteGroup| ()
  (LET (#:G693)
    (COND (|FiniteGroup;AL|) (T (SETQ |FiniteGroup;AL| (|FiniteGroup;|)))))) 

(DEFUN |FiniteGroup;| ()
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|Group|) (|Finite|)
                           (|mkCategory| '(((|order| ((|Integer|) $)) T)) NIL
                                         '((|Integer|)) NIL))
                   |FiniteGroup|)
           (SETELT #1# 0 '(|FiniteGroup|))))) 

(MAKEPROP '|FiniteGroup| 'NILADIC T) 
