
(DECLAIM (NOTINLINE |CachableSet;|)) 

(DEFPARAMETER |CachableSet;AL| 'NIL) 

(DEFUN |CachableSet| ()
  (LET (#:G692)
    (COND (|CachableSet;AL|) (T (SETQ |CachableSet;AL| (|CachableSet;|)))))) 

(DEFUN |CachableSet;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory|
                            '(((|position| ((|NonNegativeInteger|) $)) T)
                              ((|setPosition|
                                ((|Void|) $ (|NonNegativeInteger|)))
                               T))
                            NIL '((|Void|) (|NonNegativeInteger|)) NIL))
                   |CachableSet|)
           (SETELT #1# 0 '(|CachableSet|))))) 

(MAKEPROP '|CachableSet| 'NILADIC T) 
