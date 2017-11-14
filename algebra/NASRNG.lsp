
(DECLAIM (NOTINLINE |NonAssociativeSemiRng;|)) 

(DEFPARAMETER |NonAssociativeSemiRng;AL| 'NIL) 

(DEFUN |NonAssociativeSemiRng| ()
  (LET (#:G692)
    (COND (|NonAssociativeSemiRng;AL|)
          (T (SETQ |NonAssociativeSemiRng;AL| (|NonAssociativeSemiRng;|)))))) 

(DEFUN |NonAssociativeSemiRng;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|AbelianSemiGroup|) (|Magma|)
                           (|mkCategory| '(((|antiCommutator| ($ $ $)) T)) NIL
                                         'NIL NIL))
                   |NonAssociativeSemiRng|)
           (SETELT #1# 0 '(|NonAssociativeSemiRng|))))) 

(MAKEPROP '|NonAssociativeSemiRng| 'NILADIC T) 
