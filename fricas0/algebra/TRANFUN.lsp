
(DECLAIM (NOTINLINE |TranscendentalFunctionCategory;|)) 

(DEFPARAMETER |TranscendentalFunctionCategory;AL| 'NIL) 

(DEFUN |TranscendentalFunctionCategory| ()
  (LET (#:G692)
    (COND (|TranscendentalFunctionCategory;AL|)
          (T
           (SETQ |TranscendentalFunctionCategory;AL|
                   (|TranscendentalFunctionCategory;|)))))) 

(DEFUN |TranscendentalFunctionCategory;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|TrigonometricFunctionCategory|)
                           (|ArcTrigonometricFunctionCategory|)
                           (|HyperbolicFunctionCategory|)
                           (|ArcHyperbolicFunctionCategory|)
                           (|ElementaryFunctionCategory|)
                           (|mkCategory| '(((|pi| ($)) T)) NIL 'NIL NIL))
                   |TranscendentalFunctionCategory|)
           (SETELT #1# 0 '(|TranscendentalFunctionCategory|))))) 

(MAKEPROP '|TranscendentalFunctionCategory| 'NILADIC T) 
