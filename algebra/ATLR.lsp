
(DECLAIM (NOTINLINE |lazyRepresentation;|)) 

(DEFPARAMETER |lazyRepresentation;AL| 'NIL) 

(DEFUN |lazyRepresentation| ()
  (LET (#:G692)
    (COND (|lazyRepresentation;AL|)
          (T (SETQ |lazyRepresentation;AL| (|lazyRepresentation;|)))))) 

(DEFUN |lazyRepresentation;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |lazyRepresentation|)
           (SETELT #1# 0 '(|lazyRepresentation|))))) 

(MAKEPROP '|lazyRepresentation| 'NILADIC T) 
