
(DECLAIM (NOTINLINE |NonAssociativeRing;|)) 

(DEFPARAMETER |NonAssociativeRing;AL| 'NIL) 

(DEFUN |NonAssociativeRing| ()
  (LET (#:G692)
    (COND (|NonAssociativeRing;AL|)
          (T (SETQ |NonAssociativeRing;AL| (|NonAssociativeRing;|)))))) 

(DEFUN |NonAssociativeRing;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|NonAssociativeRng|) (|NonAssociativeSemiRing|)
                           (|mkCategory|
                            '(((|characteristic| ((|NonNegativeInteger|))) T)
                              ((|coerce| ($ (|Integer|))) T))
                            NIL '((|Integer|) (|NonNegativeInteger|)) NIL))
                   |NonAssociativeRing|)
           (SETELT #1# 0 '(|NonAssociativeRing|))))) 

(MAKEPROP '|NonAssociativeRing| 'NILADIC T) 
