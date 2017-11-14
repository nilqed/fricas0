
(DEFPARAMETER |ExtensionField;CAT| 'NIL) 

(DECLAIM (NOTINLINE |ExtensionField;|)) 

(DEFPARAMETER |ExtensionField;AL| 'NIL) 

(DEFUN |ExtensionField| (#1=#:G692)
  (LET (#2=#:G693)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |ExtensionField;AL|)) (CDR #2#))
     (T
      (SETQ |ExtensionField;AL|
              (|cons5| (CONS #3# (SETQ #2# (|ExtensionField;| #1#)))
                       |ExtensionField;AL|))
      #2#)))) 

(DEFUN |ExtensionField;| (|t#1|)
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|ExtensionField;CAT|)
                                    ('T
                                     (LETT |ExtensionField;CAT|
                                           (|Join| (|Field|)
                                                   (|RetractableTo| '|t#1|)
                                                   (|VectorSpace| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|algebraic?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|transcendent?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|inGroundField?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|degree|
                                                        ((|OnePointCompletion|
                                                          (|PositiveInteger|))
                                                         $))
                                                       T)
                                                      ((|extensionDegree|
                                                        ((|OnePointCompletion|
                                                          (|PositiveInteger|))))
                                                       T)
                                                      ((|transcendenceDegree|
                                                        ((|NonNegativeInteger|)))
                                                       T)
                                                      ((|Frobenius| ($ $))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|Frobenius|
                                                        ($ $
                                                         (|NonNegativeInteger|)))
                                                       (|has| |t#1|
                                                              (|Finite|))))
                                                    '(((|CharacteristicZero|)
                                                       (|has| |t#1|
                                                              (|CharacteristicZero|)))
                                                      ((|FieldOfPrimeCharacteristic|)
                                                       (|has| |t#1|
                                                              (|CharacteristicNonZero|)))
                                                      ((|FieldOfPrimeCharacteristic|)
                                                       (|has| |t#1|
                                                              (|Finite|))))
                                                    '((|NonNegativeInteger|)
                                                      (|OnePointCompletion|
                                                       (|PositiveInteger|))
                                                      (|Boolean|))
                                                    NIL))
                                           . #2=(|ExtensionField|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|ExtensionField| (|devaluate| |t#1|)))))) 
