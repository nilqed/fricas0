
(DECLAIM (NOTINLINE |canonicalUnitNormal;|)) 

(DEFPARAMETER |canonicalUnitNormal;AL| 'NIL) 

(DEFUN |canonicalUnitNormal| ()
  (COND (|canonicalUnitNormal;AL|)
        (T (SETQ |canonicalUnitNormal;AL| (|canonicalUnitNormal;|))))) 

(DEFUN |canonicalUnitNormal;| ()
  (SPROG ((#1=#:G378 NIL))
         (PROG1 (LETT #1# (|Join| (|mkCategory| NIL NIL NIL NIL)))
           (SETELT #1# 0 '(|canonicalUnitNormal|))))) 

(MAKEPROP '|canonicalUnitNormal| 'NILADIC T) 
