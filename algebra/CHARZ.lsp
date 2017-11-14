
(DECLAIM (NOTINLINE |CharacteristicZero;|)) 

(DEFPARAMETER |CharacteristicZero;AL| 'NIL) 

(DEFUN |CharacteristicZero| ()
  (LET (#:G692)
    (COND (|CharacteristicZero;AL|)
          (T (SETQ |CharacteristicZero;AL| (|CharacteristicZero;|)))))) 

(DEFUN |CharacteristicZero;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1 (LETT #1# (|Join| (|Ring|)) |CharacteristicZero|)
           (SETELT #1# 0 '(|CharacteristicZero|))))) 

(MAKEPROP '|CharacteristicZero| 'NILADIC T) 
