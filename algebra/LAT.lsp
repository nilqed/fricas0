
(DECLAIM (NOTINLINE |Lattice;|)) 

(DEFPARAMETER |Lattice;AL| 'NIL) 

(DEFUN |Lattice| ()
  (LET (#:G692)
    (COND (|Lattice;AL|) (T (SETQ |Lattice;AL| (|Lattice;|)))))) 

(DEFUN |Lattice;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1# (|Join| (|MeetSemilattice|) (|JoinSemilattice|))
                   |Lattice|)
           (SETELT #1# 0 '(|Lattice|))))) 

(MAKEPROP '|Lattice| 'NILADIC T) 
