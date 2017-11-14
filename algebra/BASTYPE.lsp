
(DECLAIM (NOTINLINE |BasicType;|)) 

(DEFPARAMETER |BasicType;AL| 'NIL) 

(DEFUN |BasicType| ()
  (LET (#:G692)
    (COND (|BasicType;AL|) (T (SETQ |BasicType;AL| (|BasicType;|)))))) 

(DEFUN |BasicType;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((= ((|Boolean|) $ $)) T) ((~= ((|Boolean|) $ $)) T))
                     NIL '((|Boolean|)) NIL))
                   |BasicType|)
           (SETELT #1# 0 '(|BasicType|))))) 

(MAKEPROP '|BasicType| 'NILADIC T) 
