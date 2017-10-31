
(DECLAIM (NOTINLINE |AbelianSemiGroup;|)) 

(DEFPARAMETER |AbelianSemiGroup;AL| 'NIL) 

(DEFUN |AbelianSemiGroup| ()
  (LET (#:G692)
    (COND (|AbelianSemiGroup;AL|)
          (T (SETQ |AbelianSemiGroup;AL| (|AbelianSemiGroup;|)))))) 

(DEFUN |AbelianSemiGroup;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory|
                            '(((+ ($ $ $)) T)
                              ((* ($ (|PositiveInteger|) $)) T))
                            NIL '((|PositiveInteger|)) NIL))
                   |AbelianSemiGroup|)
           (SETELT #1# 0 '(|AbelianSemiGroup|))))) 

(MAKEPROP '|AbelianSemiGroup| 'NILADIC T) 
