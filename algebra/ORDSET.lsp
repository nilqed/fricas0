
(DECLAIM (NOTINLINE |OrderedSet;|)) 

(DEFPARAMETER |OrderedSet;AL| 'NIL) 

(DEFUN |OrderedSet| ()
  (LET (#:G692)
    (COND (|OrderedSet;AL|) (T (SETQ |OrderedSet;AL| (|OrderedSet;|)))))) 

(DEFUN |OrderedSet;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|Comparable|) (|PartialOrder|)
                           (|mkCategory|
                            '(((|max| ($ $ $)) T) ((|min| ($ $ $)) T)) NIL 'NIL
                            NIL))
                   |OrderedSet|)
           (SETELT #1# 0 '(|OrderedSet|))))) 

(MAKEPROP '|OrderedSet| 'NILADIC T) 
