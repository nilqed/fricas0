
(DECLAIM (NOTINLINE |SetCategory;|)) 

(DEFPARAMETER |SetCategory;AL| 'NIL) 

(DEFUN |SetCategory| ()
  (LET (#:G693)
    (COND (|SetCategory;AL|) (T (SETQ |SetCategory;AL| (|SetCategory;|)))))) 

(DEFUN |SetCategory;| ()
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(#2=#:G690) (LIST '(|OutputForm|)))
                              (|Join| (|BasicType|) (|CoercibleTo| '#2#)
                                      (|mkCategory|
                                       '(((|hash| ((|SingleInteger|) $)) T)
                                         ((|hashUpdate!|
                                           ((|HashState|) (|HashState|) $))
                                          T)
                                         ((|latex| ((|String|) $)) T))
                                       NIL
                                       '((|String|) (|HashState|)
                                         (|SingleInteger|))
                                       NIL)))
                   |SetCategory|)
           (SETELT #1# 0 '(|SetCategory|))))) 

(MAKEPROP '|SetCategory| 'NILADIC T) 
