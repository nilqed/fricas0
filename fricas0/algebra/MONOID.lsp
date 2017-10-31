
(DECLAIM (NOTINLINE |Monoid;|)) 

(DEFPARAMETER |Monoid;AL| 'NIL) 

(DEFUN |Monoid| ()
  (LET (#:G693)
    (COND (|Monoid;AL|) (T (SETQ |Monoid;AL| (|Monoid;|)))))) 

(DEFUN |Monoid;| ()
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SemiGroup|)
                           (|mkCategory|
                            '(((|One| ($) |constant|) T)
                              ((|sample| ($) |constant|) T)
                              ((|one?| ((|Boolean|) $)) T)
                              ((^ ($ $ (|NonNegativeInteger|))) T)
                              ((|recip| ((|Union| $ "failed") $)) T))
                            NIL '((|NonNegativeInteger|) (|Boolean|)) NIL))
                   |Monoid|)
           (SETELT #1# 0 '(|Monoid|))))) 

(MAKEPROP '|Monoid| 'NILADIC T) 
