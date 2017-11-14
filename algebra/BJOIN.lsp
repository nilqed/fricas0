
(DECLAIM (NOTINLINE |BoundedJoinSemilattice;|)) 

(DEFPARAMETER |BoundedJoinSemilattice;AL| 'NIL) 

(DEFUN |BoundedJoinSemilattice| ()
  (LET (#:G692)
    (COND (|BoundedJoinSemilattice;AL|)
          (T (SETQ |BoundedJoinSemilattice;AL| (|BoundedJoinSemilattice;|)))))) 

(DEFUN |BoundedJoinSemilattice;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|JoinSemilattice|)
                           (|mkCategory| '(((|_\|_| ($) |constant|) T)) NIL
                                         'NIL NIL))
                   |BoundedJoinSemilattice|)
           (SETELT #1# 0 '(|BoundedJoinSemilattice|))))) 

(MAKEPROP '|BoundedJoinSemilattice| 'NILADIC T) 
