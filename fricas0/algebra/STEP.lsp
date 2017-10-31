
(DECLAIM (NOTINLINE |StepThrough;|)) 

(DEFPARAMETER |StepThrough;AL| 'NIL) 

(DEFUN |StepThrough| ()
  (LET (#:G692)
    (COND (|StepThrough;AL|) (T (SETQ |StepThrough;AL| (|StepThrough;|)))))) 

(DEFUN |StepThrough;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory|
                            '(((|init| ($) |constant|) T)
                              ((|nextItem| ((|Union| $ "failed") $)) T))
                            NIL 'NIL NIL))
                   |StepThrough|)
           (SETELT #1# 0 '(|StepThrough|))))) 

(MAKEPROP '|StepThrough| 'NILADIC T) 
