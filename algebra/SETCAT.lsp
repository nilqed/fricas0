
(DECLAIM (NOTINLINE |SetCategory;|)) 

(DEFPARAMETER |SetCategory;AL| 'NIL) 

(DEFUN |SetCategory| ()
  (COND (|SetCategory;AL|) (T (SETQ |SetCategory;AL| (|SetCategory;|))))) 

(DEFUN |SetCategory;| ()
  (SPROG ((#1=#:G1 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(#2=#:G0) (LIST '(|OutputForm|))
                                   (|Join| (|BasicType|) (|CoercibleTo| '#2#)
                                           (|mkCategory|
                                            '(((|latex| ((|String|) %)) T)) NIL
                                            NIL NIL))))
           (SETELT #1# 0 '(|SetCategory|))))) 
