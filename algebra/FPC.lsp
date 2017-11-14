
(DECLAIM (NOTINLINE |FieldOfPrimeCharacteristic;|)) 

(DEFPARAMETER |FieldOfPrimeCharacteristic;AL| 'NIL) 

(DEFUN |FieldOfPrimeCharacteristic| ()
  (LET (#:G692)
    (COND (|FieldOfPrimeCharacteristic;AL|)
          (T
           (SETQ |FieldOfPrimeCharacteristic;AL|
                   (|FieldOfPrimeCharacteristic;|)))))) 

(DEFUN |FieldOfPrimeCharacteristic;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|Field|) (|CharacteristicNonZero|)
                           (|mkCategory|
                            '(((|order|
                                ((|OnePointCompletion| (|PositiveInteger|)) $))
                               T)
                              ((|discreteLog|
                                ((|Union| (|NonNegativeInteger|) "failed") $
                                 $))
                               T)
                              ((|primeFrobenius| ($ $)) T)
                              ((|primeFrobenius| ($ $ (|NonNegativeInteger|)))
                               T))
                            NIL
                            '((|NonNegativeInteger|)
                              (|OnePointCompletion| (|PositiveInteger|)))
                            NIL))
                   |FieldOfPrimeCharacteristic|)
           (SETELT #1# 0 '(|FieldOfPrimeCharacteristic|))))) 

(MAKEPROP '|FieldOfPrimeCharacteristic| 'NILADIC T) 
