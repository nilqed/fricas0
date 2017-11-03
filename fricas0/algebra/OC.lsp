
(DEFPARAMETER |OctonionCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |OctonionCategory;|)) 

(DEFPARAMETER |OctonionCategory;AL| 'NIL) 

(DEFUN |OctonionCategory| (#1=#:G757)
  (LET (#2=#:G758)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |OctonionCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |OctonionCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|OctonionCategory;| #1#)))
                       |OctonionCategory;AL|))
      #2#)))) 

(DEFUN |OctonionCategory;| (|t#1|)
  (SPROG ((#1=#:G756 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|OctonionCategory;CAT|)
                                    ('T
                                     (LETT |OctonionCategory;CAT|
                                           (|Join|
                                            (|FramedNonAssociativeAlgebra|
                                             '|t#1|)
                                            (|FullyRetractableTo| '|t#1|)
                                            (|FullyEvalableOver| '|t#1|)
                                            (|mkCategory|
                                             '(((|conjugate| ($ $)) T)
                                               ((|real| (|t#1| $)) T)
                                               ((|imagi| (|t#1| $)) T)
                                               ((|imagj| (|t#1| $)) T)
                                               ((|imagk| (|t#1| $)) T)
                                               ((|imagE| (|t#1| $)) T)
                                               ((|imagI| (|t#1| $)) T)
                                               ((|imagJ| (|t#1| $)) T)
                                               ((|imagK| (|t#1| $)) T)
                                               ((|norm| (|t#1| $)) T)
                                               ((|octon|
                                                 ($ |t#1| |t#1| |t#1| |t#1|
                                                  |t#1| |t#1| |t#1| |t#1|))
                                                T)
                                               ((|abs| (|t#1| $))
                                                (|has| |t#1|
                                                       (|RealNumberSystem|)))
                                               ((|rational?| ((|Boolean|) $))
                                                (|has| |t#1|
                                                       (|IntegerNumberSystem|)))
                                               ((|rational|
                                                 ((|Fraction| (|Integer|)) $))
                                                (|has| |t#1|
                                                       (|IntegerNumberSystem|)))
                                               ((|rationalIfCan|
                                                 ((|Union|
                                                   (|Fraction| (|Integer|))
                                                   "failed")
                                                  $))
                                                (|has| |t#1|
                                                       (|IntegerNumberSystem|)))
                                               ((|inv| ($ $))
                                                (|has| |t#1| (|Field|))))
                                             '(((|OrderedSet|)
                                                (|has| |t#1| (|OrderedSet|)))
                                               ((|ConvertibleTo| (|InputForm|))
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
                                           . #2=(|OctonionCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|OctonionCategory| (|devaluate| |t#1|)))))) 
