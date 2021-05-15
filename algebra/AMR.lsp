
(DEFPARAMETER |AbelianMonoidRing;CAT| 'NIL) 

(DECLAIM (NOTINLINE |AbelianMonoidRing;|)) 

(DEFPARAMETER |AbelianMonoidRing;AL| 'NIL) 

(DEFUN |AbelianMonoidRing| (|t#1| |t#2|)
  (LET (#1=#:G382 (#2=#:G383 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |AbelianMonoidRing;AL|)) (CDR #1#))
          (T
           (SETQ |AbelianMonoidRing;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (APPLY #'|AbelianMonoidRing;| #2#)))
                    |AbelianMonoidRing;AL|))
           #1#)))) 

(DEFUN |AbelianMonoidRing;| (|t#1| |t#2|)
  (SPROG ((#1=#:G381 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (COND (|AbelianMonoidRing;CAT|)
                                    ('T
                                     (LETT |AbelianMonoidRing;CAT|
                                           (|Join| (|SemiRng|)
                                                   (|BiModule| '|t#1| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|leadingCoefficient|
                                                        (|t#1| $))
                                                       T)
                                                      ((|leadingMonomial|
                                                        ($ $))
                                                       T)
                                                      ((|degree| (|t#2| $)) T)
                                                      ((|map|
                                                        ($
                                                         (|Mapping| |t#1|
                                                                    |t#1|)
                                                         $))
                                                       T)
                                                      ((|monomial?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|monomial|
                                                        ($ |t#1| |t#2|))
                                                       T)
                                                      ((|reductum| ($ $)) T)
                                                      ((|coefficient|
                                                        (|t#1| $ |t#2|))
                                                       T)
                                                      ((/ ($ $ |t#1|))
                                                       (|has| |t#1|
                                                              (|Field|))))
                                                    '(((|CancellationAbelianMonoid|)
                                                       (|has| |t#1|
                                                              (|CancellationAbelianMonoid|)))
                                                      ((|SemiRing|)
                                                       (|has| |t#1|
                                                              (|SemiRing|)))
                                                      ((|Ring|)
                                                       (|has| |t#1| (|Ring|)))
                                                      ((|CommutativeRing|)
                                                       (AND
                                                        (|has| |t#1|
                                                               (|CommutativeRing|))
                                                        (|has| $
                                                               (|VariablesCommuteWithCoefficients|))))
                                                      ((|Algebra| |t#1|)
                                                       (AND
                                                        (|has| |t#1|
                                                               (|CommutativeRing|))
                                                        (|has| $
                                                               (|VariablesCommuteWithCoefficients|))))
                                                      ((|CharacteristicZero|)
                                                       (|has| |t#1|
                                                              (|CharacteristicZero|)))
                                                      ((|CharacteristicNonZero|)
                                                       (|has| |t#1|
                                                              (|CharacteristicNonZero|)))
                                                      ((|IntegralDomain|)
                                                       (AND
                                                        (|has| |t#1|
                                                               (|IntegralDomain|))
                                                        (|has| $
                                                               (|VariablesCommuteWithCoefficients|))))
                                                      ((|Algebra|
                                                        (|Fraction|
                                                         (|Integer|)))
                                                       (|has| |t#1|
                                                              (|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))))
                                                    NIL NIL)))))))
           (SETELT #1# 0 (LIST '|AbelianMonoidRing| |t#1| |t#2|))))) 
