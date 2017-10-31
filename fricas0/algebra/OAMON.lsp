
(DECLAIM (NOTINLINE |OrderedAbelianMonoid;|)) 

(DEFPARAMETER |OrderedAbelianMonoid;AL| 'NIL) 

(DEFUN |OrderedAbelianMonoid| ()
  (LET (#:G692)
    (COND (|OrderedAbelianMonoid;AL|)
          (T (SETQ |OrderedAbelianMonoid;AL| (|OrderedAbelianMonoid;|)))))) 

(DEFUN |OrderedAbelianMonoid;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1# (|Join| (|OrderedAbelianSemiGroup|) (|AbelianMonoid|))
                   |OrderedAbelianMonoid|)
           (SETELT #1# 0 '(|OrderedAbelianMonoid|))))) 

(MAKEPROP '|OrderedAbelianMonoid| 'NILADIC T) 
