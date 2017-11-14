
(DECLAIM (NOTINLINE |AbelianMonoid;|)) 

(DEFPARAMETER |AbelianMonoid;AL| 'NIL) 

(DEFUN |AbelianMonoid| ()
  (LET (#:G693)
    (COND (|AbelianMonoid;AL|)
          (T (SETQ |AbelianMonoid;AL| (|AbelianMonoid;|)))))) 

(DEFUN |AbelianMonoid;| ()
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|AbelianSemiGroup|)
                           (|mkCategory|
                            '(((|Zero| ($) |constant|) T)
                              ((|sample| ($) |constant|) T)
                              ((|zero?| ((|Boolean|) $)) T)
                              ((* ($ (|NonNegativeInteger|) $)) T)
                              ((|opposite?| ((|Boolean|) $ $)) T))
                            NIL '((|Boolean|) (|NonNegativeInteger|)) NIL))
                   |AbelianMonoid|)
           (SETELT #1# 0 '(|AbelianMonoid|))))) 

(MAKEPROP '|AbelianMonoid| 'NILADIC T) 
