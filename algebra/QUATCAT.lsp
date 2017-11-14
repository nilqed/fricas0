
(DEFPARAMETER |QuaternionCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |QuaternionCategory;|)) 

(DEFPARAMETER |QuaternionCategory;AL| 'NIL) 

(DEFUN |QuaternionCategory| (#1=#:G724)
  (LET (#2=#:G725)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |QuaternionCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |QuaternionCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|QuaternionCategory;| #1#)))
                       |QuaternionCategory;AL|))
      #2#)))) 

(DEFUN |QuaternionCategory;| (|t#1|)
  (SPROG ((#1=#:G723 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|QuaternionCategory;CAT|)
                                    ('T
                                     (LETT |QuaternionCategory;CAT|
                                           (|Join| (|Algebra| '|t#1|)
                                                   (|FullyRetractableTo|
                                                    '|t#1|)
                                                   (|DifferentialExtension|
                                                    '|t#1|)
                                                   (|FullyEvalableOver| '|t#1|)
                                                   (|FullyLinearlyExplicitOver|
                                                    '|t#1|)
                                                   (|mkCategory|
                                                    '(((|conjugate| ($ $)) T)
                                                      ((|imagI| (|t#1| $)) T)
                                                      ((|imagJ| (|t#1| $)) T)
                                                      ((|imagK| (|t#1| $)) T)
                                                      ((|norm| (|t#1| $)) T)
                                                      ((|quatern|
                                                        ($ |t#1| |t#1| |t#1|
                                                         |t#1|))
                                                       T)
                                                      ((|real| (|t#1| $)) T)
                                                      ((|abs| (|t#1| $))
                                                       (|has| |t#1|
                                                              (|RealNumberSystem|)))
                                                      ((|rational?|
                                                        ((|Boolean|) $))
                                                       (|has| |t#1|
                                                              (|IntegerNumberSystem|)))
                                                      ((|rational|
                                                        ((|Fraction|
                                                          (|Integer|))
                                                         $))
                                                       (|has| |t#1|
                                                              (|IntegerNumberSystem|)))
                                                      ((|rationalIfCan|
                                                        ((|Union|
                                                          (|Fraction|
                                                           (|Integer|))
                                                          "failed")
                                                         $))
                                                       (|has| |t#1|
                                                              (|IntegerNumberSystem|))))
                                                    '(((|EntireRing|)
                                                       (|has| |t#1|
                                                              (|EntireRing|)))
                                                      ((|OrderedSet|)
                                                       (|has| |t#1|
                                                              (|OrderedSet|)))
                                                      ((|DivisionRing|)
                                                       (|has| |t#1| (|Field|)))
                                                      ((|ConvertibleTo|
                                                        (|InputForm|))
                                                       (|has| |t#1|
                                                              (|ConvertibleTo|
                                                               (|InputForm|))))
                                                      ((|CharacteristicZero|)
                                                       (|has| |t#1|
                                                              (|CharacteristicZero|)))
                                                      ((|CharacteristicNonZero|)
                                                       (|has| |t#1|
                                                              (|CharacteristicNonZero|))))
                                                    '((|Fraction| (|Integer|))
                                                      (|Boolean|))
                                                    NIL))
                                           . #2=(|QuaternionCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|QuaternionCategory| (|devaluate| |t#1|)))))) 
