
(DECLAIM (NOTINLINE |SemiRng;|)) 

(DEFPARAMETER |SemiRng;AL| 'NIL) 

(DEFUN |SemiRng| ()
  (LET (#:G692)
    (COND (|SemiRng;AL|) (T (SETQ |SemiRng;AL| (|SemiRng;|)))))) 

(DEFUN |SemiRng;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|NonAssociativeSemiRng|) (|BiModule| '$ '$)
                           (|SemiGroup|))
                   |SemiRng|)
           (SETELT #1# 0 '(|SemiRng|))))) 

(MAKEPROP '|SemiRng| 'NILADIC T) 
