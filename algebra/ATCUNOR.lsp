
(DECLAIM (NOTINLINE |canonicalUnitNormal;|)) 

(DEFPARAMETER |canonicalUnitNormal;AL| 'NIL) 

(DEFUN |canonicalUnitNormal| ()
  (LET (#:G692)
    (COND (|canonicalUnitNormal;AL|)
          (T (SETQ |canonicalUnitNormal;AL| (|canonicalUnitNormal;|)))))) 

(DEFUN |canonicalUnitNormal;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |canonicalUnitNormal|)
           (SETELT #1# 0 '(|canonicalUnitNormal|))))) 

(MAKEPROP '|canonicalUnitNormal| 'NILADIC T) 
