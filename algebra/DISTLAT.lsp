
(DECLAIM (NOTINLINE |DistributiveLattice;|)) 

(DEFPARAMETER |DistributiveLattice;AL| 'NIL) 

(DEFUN |DistributiveLattice| ()
  (LET (#:G692)
    (COND (|DistributiveLattice;AL|)
          (T (SETQ |DistributiveLattice;AL| (|DistributiveLattice;|)))))) 

(DEFUN |DistributiveLattice;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1 (LETT #1# (|Join| (|Lattice|)) |DistributiveLattice|)
           (SETELT #1# 0 '(|DistributiveLattice|))))) 

(MAKEPROP '|DistributiveLattice| 'NILADIC T) 
