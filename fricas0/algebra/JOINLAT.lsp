
(DECLAIM (NOTINLINE |JoinSemilattice;|)) 

(DEFPARAMETER |JoinSemilattice;AL| 'NIL) 

(DEFUN |JoinSemilattice| ()
  (LET (#:G692)
    (COND (|JoinSemilattice;AL|)
          (T (SETQ |JoinSemilattice;AL| (|JoinSemilattice;|)))))) 

(DEFUN |JoinSemilattice;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory| '(((|\\/| ($ $ $)) T)) NIL 'NIL NIL))
                   |JoinSemilattice|)
           (SETELT #1# 0 '(|JoinSemilattice|))))) 

(MAKEPROP '|JoinSemilattice| 'NILADIC T) 
