
(DECLAIM (NOTINLINE |Comparable;|)) 

(DEFPARAMETER |Comparable;AL| 'NIL) 

(DEFUN |Comparable| ()
  (LET (#:G692)
    (COND (|Comparable;AL|) (T (SETQ |Comparable;AL| (|Comparable;|)))))) 

(DEFUN |Comparable;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory| '(((|smaller?| ((|Boolean|) $ $)) T))
                                         NIL '((|Boolean|)) NIL))
                   |Comparable|)
           (SETELT #1# 0 '(|Comparable|))))) 

(MAKEPROP '|Comparable| 'NILADIC T) 
