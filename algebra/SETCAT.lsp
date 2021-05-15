
(DECLAIM (NOTINLINE |SetCategory;|)) 

(DEFPARAMETER |SetCategory;AL| 'NIL) 

(DEFUN |SetCategory| ()
  (COND (|SetCategory;AL|) (T (SETQ |SetCategory;AL| (|SetCategory;|))))) 

(DEFUN |SetCategory;| ()
  (SPROG ((#1=#:G379 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(#2=#:G378) (LIST '(|OutputForm|)))
                              (|Join| (|BasicType|) (|CoercibleTo| '#2#)
                                      (|mkCategory|
                                       '(((|hash| ((|SingleInteger|) $)) T)
                                         ((|hashUpdate!|
                                           ((|HashState|) (|HashState|) $))
                                          T)
                                         ((|latex| ((|String|) $)) T))
                                       NIL NIL NIL))))
           (SETELT #1# 0 '(|SetCategory|))))) 

(MAKEPROP '|SetCategory| 'NILADIC T) 
