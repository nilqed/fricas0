
(DECLAIM (NOTINLINE |MagmaWithUnit;|)) 

(DEFPARAMETER |MagmaWithUnit;AL| 'NIL) 

(DEFUN |MagmaWithUnit| ()
  (LET (#:G695)
    (COND (|MagmaWithUnit;AL|)
          (T (SETQ |MagmaWithUnit;AL| (|MagmaWithUnit;|)))))) 

(DEFUN |MagmaWithUnit;| ()
  (SPROG ((#1=#:G693 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|Magma|)
                           (|mkCategory|
                            '(((|One| ($) |constant|) T)
                              ((|sample| ($) |constant|) T)
                              ((|one?| ((|Boolean|) $)) T)
                              ((|rightPower| ($ $ (|NonNegativeInteger|))) T)
                              ((|leftPower| ($ $ (|NonNegativeInteger|))) T)
                              ((^ ($ $ (|NonNegativeInteger|))) T)
                              ((|recip| ((|Union| $ "failed") $)) T)
                              ((|leftRecip| ((|Union| $ "failed") $)) T)
                              ((|rightRecip| ((|Union| $ "failed") $)) T))
                            NIL '((|NonNegativeInteger|) (|Boolean|)) NIL))
                   |MagmaWithUnit|)
           (SETELT #1# 0 '(|MagmaWithUnit|))))) 

(MAKEPROP '|MagmaWithUnit| 'NILADIC T) 
