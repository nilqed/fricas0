
(DECLAIM (NOTINLINE |arbitraryExponent;|)) 

(DEFPARAMETER |arbitraryExponent;AL| 'NIL) 

(DEFUN |arbitraryExponent| ()
  (LET (#:G692)
    (COND (|arbitraryExponent;AL|)
          (T (SETQ |arbitraryExponent;AL| (|arbitraryExponent;|)))))) 

(DEFUN |arbitraryExponent;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |arbitraryExponent|)
           (SETELT #1# 0 '(|arbitraryExponent|))))) 

(MAKEPROP '|arbitraryExponent| 'NILADIC T) 
