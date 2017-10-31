
(DECLAIM (NOTINLINE |Logic;|)) 

(DEFPARAMETER |Logic;AL| 'NIL) 

(DEFUN |Logic| ()
  (LET (#:G692)
    (COND (|Logic;AL|) (T (SETQ |Logic;AL| (|Logic;|)))))) 

(DEFUN |Logic;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|BoundedDistributiveLattice|)
                           (|mkCategory| '(((~ ($ $)) T)) NIL 'NIL NIL))
                   |Logic|)
           (SETELT #1# 0 '(|Logic|))))) 

(MAKEPROP '|Logic| 'NILADIC T) 
