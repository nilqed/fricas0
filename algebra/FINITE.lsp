
(DECLAIM (NOTINLINE |Finite;|)) 

(DEFPARAMETER |Finite;AL| 'NIL) 

(DEFUN |Finite| ()
  (LET (#:G693)
    (COND (|Finite;AL|) (T (SETQ |Finite;AL| (|Finite;|)))))) 

(DEFUN |Finite;| ()
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(#2=#:G690) (LIST '(|InputForm|)))
                              (|Join| (|SetCategory|) (|ConvertibleTo| '#2#)
                                      (|Comparable|)
                                      (|mkCategory|
                                       '(((|size| ((|NonNegativeInteger|))) T)
                                         ((|index| ($ (|PositiveInteger|))) T)
                                         ((|lookup| ((|PositiveInteger|) $)) T)
                                         ((|random| ($)) T)
                                         ((|enumerate| ((|List| $))) T))
                                       NIL
                                       '((|List| $) (|PositiveInteger|)
                                         (|NonNegativeInteger|))
                                       NIL)))
                   |Finite|)
           (SETELT #1# 0 '(|Finite|))))) 

(MAKEPROP '|Finite| 'NILADIC T) 
