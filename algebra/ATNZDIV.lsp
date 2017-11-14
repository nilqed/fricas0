
(DECLAIM (NOTINLINE |noZeroDivisors;|)) 

(DEFPARAMETER |noZeroDivisors;AL| 'NIL) 

(DEFUN |noZeroDivisors| ()
  (LET (#:G692)
    (COND (|noZeroDivisors;AL|)
          (T (SETQ |noZeroDivisors;AL| (|noZeroDivisors;|)))))) 

(DEFUN |noZeroDivisors;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |noZeroDivisors|)
           (SETELT #1# 0 '(|noZeroDivisors|))))) 

(MAKEPROP '|noZeroDivisors| 'NILADIC T) 
