
(DECLAIM (NOTINLINE |OrderedIntegralDomain;|)) 

(DEFPARAMETER |OrderedIntegralDomain;AL| 'NIL) 

(DEFUN |OrderedIntegralDomain| ()
  (LET (#:G692)
    (COND (|OrderedIntegralDomain;AL|)
          (T (SETQ |OrderedIntegralDomain;AL| (|OrderedIntegralDomain;|)))))) 

(DEFUN |OrderedIntegralDomain;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1# (|Join| (|IntegralDomain|) (|OrderedRing|))
                   |OrderedIntegralDomain|)
           (SETELT #1# 0 '(|OrderedIntegralDomain|))))) 

(MAKEPROP '|OrderedIntegralDomain| 'NILADIC T) 
