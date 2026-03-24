
(DECLAIM (NOTINLINE |Hashable;|)) 

(DEFPARAMETER |Hashable;AL| 'NIL) 

(DEFUN |Hashable| ()
  (COND (|Hashable;AL|) (T (SETQ |Hashable;AL| (|Hashable;|))))) 

(DEFUN |Hashable;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|BasicType|)
                           (|mkCategory|
                            '(((|hash| ((|SingleInteger|) %)) T)
                              ((|hashUpdate!| ((|HashState|) (|HashState|) %))
                               T))
                            NIL NIL NIL)))
           (SETELT #1# 0 '(|Hashable|))))) 
