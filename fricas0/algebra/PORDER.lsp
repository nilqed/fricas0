
(DECLAIM (NOTINLINE |PartialOrder;|)) 

(DEFPARAMETER |PartialOrder;AL| 'NIL) 

(DEFUN |PartialOrder| ()
  (LET (#:G692)
    (COND (|PartialOrder;AL|) (T (SETQ |PartialOrder;AL| (|PartialOrder;|)))))) 

(DEFUN |PartialOrder;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((< ((|Boolean|) $ $)) T) ((> ((|Boolean|) $ $)) T)
                       ((>= ((|Boolean|) $ $)) T) ((<= ((|Boolean|) $ $)) T))
                     NIL '((|Boolean|)) NIL))
                   |PartialOrder|)
           (SETELT #1# 0 '(|PartialOrder|))))) 

(MAKEPROP '|PartialOrder| 'NILADIC T) 
