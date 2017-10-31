
(DECLAIM (NOTINLINE |BoundedLattice;|)) 

(DEFPARAMETER |BoundedLattice;AL| 'NIL) 

(DEFUN |BoundedLattice| ()
  (LET (#:G692)
    (COND (|BoundedLattice;AL|)
          (T (SETQ |BoundedLattice;AL| (|BoundedLattice;|)))))) 

(DEFUN |BoundedLattice;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|BoundedMeetSemilattice|)
                           (|BoundedJoinSemilattice|))
                   |BoundedLattice|)
           (SETELT #1# 0 '(|BoundedLattice|))))) 

(MAKEPROP '|BoundedLattice| 'NILADIC T) 
