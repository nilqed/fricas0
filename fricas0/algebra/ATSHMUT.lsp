
(DECLAIM (NOTINLINE |shallowlyMutable;|)) 

(DEFPARAMETER |shallowlyMutable;AL| 'NIL) 

(DEFUN |shallowlyMutable| ()
  (LET (#:G692)
    (COND (|shallowlyMutable;AL|)
          (T (SETQ |shallowlyMutable;AL| (|shallowlyMutable;|)))))) 

(DEFUN |shallowlyMutable;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |shallowlyMutable|)
           (SETELT #1# 0 '(|shallowlyMutable|))))) 

(MAKEPROP '|shallowlyMutable| 'NILADIC T) 
