
(DECLAIM (NOTINLINE |FinitelyGenerated;|)) 

(DEFPARAMETER |FinitelyGenerated;AL| 'NIL) 

(DEFUN |FinitelyGenerated| ()
  (LET (#:G692)
    (COND (|FinitelyGenerated;AL|)
          (T (SETQ |FinitelyGenerated;AL| (|FinitelyGenerated;|)))))) 

(DEFUN |FinitelyGenerated;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory| '(((|generators| ((|List| $))) T)) NIL
                                  '((|List| $)) NIL))
                   |FinitelyGenerated|)
           (SETELT #1# 0 '(|FinitelyGenerated|))))) 

(MAKEPROP '|FinitelyGenerated| 'NILADIC T) 
