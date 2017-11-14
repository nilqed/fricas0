
(DECLAIM (NOTINLINE |IntegralDomain;|)) 

(DEFPARAMETER |IntegralDomain;AL| 'NIL) 

(DEFUN |IntegralDomain| ()
  (LET (#:G692)
    (COND (|IntegralDomain;AL|)
          (T (SETQ |IntegralDomain;AL| (|IntegralDomain;|)))))) 

(DEFUN |IntegralDomain;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|CommutativeRing|) (|Algebra| '$) (|EntireRing|))
                   |IntegralDomain|)
           (SETELT #1# 0 '(|IntegralDomain|))))) 

(MAKEPROP '|IntegralDomain| 'NILADIC T) 
