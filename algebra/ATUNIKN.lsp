
(DECLAIM (NOTINLINE |unitsKnown;|)) 

(DEFPARAMETER |unitsKnown;AL| 'NIL) 

(DEFUN |unitsKnown| ()
  (LET (#:G692)
    (COND (|unitsKnown;AL|) (T (SETQ |unitsKnown;AL| (|unitsKnown;|)))))) 

(DEFUN |unitsKnown;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |unitsKnown|)
           (SETELT #1# 0 '(|unitsKnown|))))) 

(MAKEPROP '|unitsKnown| 'NILADIC T) 
