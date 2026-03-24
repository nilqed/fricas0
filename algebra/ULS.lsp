
(SDEFUN |ULS;variable;%S;1| ((|x| (%)) (% (|Symbol|))) (QREFELT % 7)) 

(SDEFUN |ULS;center;%Coef;2| ((|x| (%)) (% (|Coef|))) (QREFELT % 8)) 

(SDEFUN |ULS;coerce;V%;3| ((|v| (|Variable| |var|)) (% (%)))
        (COND
         ((SPADCALL (QREFELT % 8) (QREFELT % 13))
          (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 17)))
         ('T
          (SPADCALL (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 17))
                    (SPADCALL (QREFELT % 8) 0 (QREFELT % 17)) (QREFELT % 20))))) 

(SDEFUN |ULS;differentiate;%V%;4| ((|x| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |x| (QREFELT % 23))) 

(SDEFUN |ULS;integrate;%V%;5| ((|x| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |x| (QREFELT % 25))) 

(DECLAIM (NOTINLINE |UnivariateLaurentSeries;|)) 

(DEFUN |UnivariateLaurentSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G63 NIL) (|pv$| NIL) (#2=#:G52 NIL) (#3=#:G53 NIL) (#4=#:G55 NIL)
    (#5=#:G56 NIL) (#6=#:G57 NIL) (#7=#:G58 NIL) (#8=#:G59 NIL) (#9=#:G61 NIL)
    (#10=#:G62 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|UnivariateLaurentSeries| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 79))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|RetractableTo| (|Symbol|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|ConvertibleTo|
                                                (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|RealConstant|)))
                                        (LETT #10#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|OrderedIntegralDomain|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|CharacteristicZero|)))
                                         #10#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|RetractableTo| (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|StepThrough|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              (LIST '|InnerEvalable|
                                                    '(|Symbol|)
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              (LIST '|Evalable|
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              (LIST '|Eltable|
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|))
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|LinearlyExplicitOver|
                                                (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Float|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Integer|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|PatternMatchable| (|Float|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|PatternMatchable|
                                                (|Integer|))))
                                        (|HasCategory| (|Integer|)
                                                       '(|Comparable|))
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #9#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #9# (|HasCategory| |#1| '(|Field|))
                                            #8#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #8#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|Comparable|)))
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|OrderedSet|))))
                                        (OR #10# #7#)
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|Comparable|)))
                                         #10# #7#)
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (LETT #6#
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|PolynomialFactorizationExplicit|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             #6#)
                                        (LETT #5#
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|CharacteristicNonZero|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #5#))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|IntegerNumberSystem|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|EuclideanDomain|)))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|)))))
                                        (OR #4#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Float|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Integer|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|ConvertibleTo|
                                                (|InputForm|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              (LIST '|Eltable|
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|))
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              (LIST '|Evalable|
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              (LIST '|InnerEvalable|
                                                    '(|Symbol|)
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|LinearlyExplicitOver|
                                                (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|PatternMatchable| (|Float|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|PatternMatchable|
                                                (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|RetractableTo| (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|RetractableTo| (|Symbol|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|Comparable|)))
                                            #10# #7#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             #6#)
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|RealConstant|)))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|StepThrough|))))
                                        (AND #4#
                                             (|HasSignature| |#1|
                                                             (LIST '|integrate|
                                                                   (LIST
                                                                    (|devaluate|
                                                                     |#1|)
                                                                    (|devaluate|
                                                                     |#1|)
                                                                    '(|Symbol|))))
                                             (|HasSignature| |#1|
                                                             (LIST '|variables|
                                                                   (LIST
                                                                    '(|List|
                                                                      (|Symbol|))
                                                                    (|devaluate|
                                                                     |#1|)))))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (OR (|HasCategory| |#1| '(|SemiRing|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasSignature| |#1|
                                                          (LIST '*
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Integer|)
                                                                 (|devaluate|
                                                                  |#1|)))))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|PartialDifferentialRing|
                                                 (|Symbol|)))))
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|DifferentialRing|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicNonZero|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicZero|))
                                            #9# (|HasCategory| |#1| '(|Field|))
                                            #8# #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (AND #4#
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|)))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))))))
    (|haddProp| |$ConstructorCache| '|UnivariateLaurentSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 9007199254740992))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|Field|))
                (|HasCategory| % '(|CharacteristicNonZero|))
                (|HasCategory| (|UnivariateTaylorSeries| |#1| |#2| |#3|)
                               '(|PolynomialFactorizationExplicit|))))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#
         (AND (|HasCategory| |#1| '(|Field|)) #5#))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #8# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR #4# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #8# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 576460752303423488))
    (AND
     (OR (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 1152921504606846976))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 2305843009213693952))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 4611686018427387904))
    (AND
     (OR #2# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 9223372036854775808))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 37)
      (QSETREFV % 26 (CONS (|dispatchFunction| |ULS;integrate;%V%;5|) %))))
    %))) 

(DEFUN |UnivariateLaurentSeries| (&REST #1=#:G64)
  (SPROG NIL
         (PROG (#2=#:G65)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache| '|UnivariateLaurentSeries|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |UnivariateLaurentSeries;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UnivariateLaurentSeries|)))))))))) 

(MAKEPROP '|UnivariateLaurentSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|UnivariateLaurentSeriesConstructor| 6 36)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|Symbol|)
              |ULS;variable;%S;1| |ULS;center;%Coef;2| (|Boolean|)
              (0 . |zero?|) (5 . |One|) (9 . |One|) (|Integer|)
              (13 . |monomial|) (19 . |Zero|) (23 . |Zero|) (27 . +)
              (|Variable| (NRTEVAL (QREFELT % 7))) |ULS;coerce;V%;3|
              (33 . |differentiate|) |ULS;differentiate;%V%;4|
              (38 . |integrate|) (43 . |integrate|) (|String|) (|OutputForm|)
              (|PositiveInteger|) (|Record| (|:| |k| 16) (|:| |c| 6))
              (|List| 30) (|Mapping| 6 6) (|Stream| 30) (|Mapping| 6 16)
              (|Stream| 6)
              (|UnivariateTaylorSeries| 6 (NRTEVAL (QREFELT % 7))
                                        (NRTEVAL (QREFELT % 8)))
              (|Union| 36 '#1="failed") (|Union| 49 '#2="failed") (|Matrix| %)
              (|InputForm|) (|Pattern| 57) (|Pattern| 16) (|List| 44)
              (|Equation| 36) (|List| 36) (|List| 9) (|Matrix| 16)
              (|Record| (|:| |mat| 47) (|:| |vec| (|Vector| 16))) (|Vector| %)
              (|PatternMatchResult| 57 %) (|PatternMatchResult| 16 %)
              (|Factored| 53) (|SparseUnivariatePolynomial| %)
              (|Union| 55 '#2#) (|List| 53) (|DoubleFloat|) (|Float|)
              (|Union| 16 '#1#) (|Union| 60 '#1#) (|Fraction| 16)
              (|Union| 9 '#1#) (|Union| % '"failed") (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|List| 63) (|Factored| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 67 '#3="failed") (|Union| 70 '#3#) (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 70) (|:| |generator| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |mat| 76) (|:| |vec| (|Vector| 36))) (|Matrix| 36)
              (|Mapping| 36 36) (|Fraction| (|Polynomial| 6)))
           '#(|variable| 49 |monomial| 54 |integrate| 60 |differentiate| 71
              |coerce| 82 |center| 87 |Zero| 92 |One| 96 + 100)
           'NIL
           (CONS
            (|makeByteWordVec2| 53
                                '(0 2 0 2 0 32 2 0 2 2 0 6 2 0 25 2 6 24 2 2 44
                                  43 2 7 34 38 25 24 20 47 47 2 38 42 24 20 2 2
                                  38 24 20 0 13 2 2 6 38 46 0 0 0 13 2 47 2 6
                                  38 38 0 0 0 0 0 6 53 6 42 42 52 2 28 42 51 0
                                  0 17 16 2 9 29 0 0 2 11 8 8 5 3 24 38 0 0 2
                                  15 14 12 11 10 8 8 28 5 5 4 3 46 2 2 25 24 38
                                  38 38 38 38 38 1 0 0 0 0))
            (CONS
             '#(|UnivariateLaurentSeriesConstructorCategory&|
                |QuotientFieldCategory&| |UnivariateLaurentSeriesCategory&|
                |Field&| NIL |PolynomialFactorizationExplicit&|
                |EuclideanDomain&| |UnivariatePowerSeriesCategory&|
                |UniqueFactorizationDomain&| NIL |PowerSeriesCategory&| NIL
                |GcdDomain&| |AbelianMonoidRing&| NIL |DifferentialExtension&|
                |OrderedRing&| NIL |DivisionRing&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| |Algebra&| NIL NIL |Algebra&|
                |EntireRing&| |Algebra&| |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| |Module&|
                |Module&| NIL NIL NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL NIL |OrderedSet&|
                |MagmaWithUnit&| |AbelianMonoid&| NIL |NonAssociativeSemiRng&|
                NIL NIL |FullyEvalableOver&| NIL NIL |AbelianSemiGroup&|
                |Magma&| NIL |Evalable&| |RetractableTo&| |RetractableTo&| NIL
                |RetractableTo&| NIL |TranscendentalFunctionCategory&|
                |SetCategory&| |RetractableTo&| NIL NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL |PartialOrder&| NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |RadicalCategory&|
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|UnivariateLaurentSeriesConstructorCategory| 6
                                                               (|UnivariateTaylorSeries|
                                                                6 7 8))
                 (|QuotientFieldCategory| (|UnivariateTaylorSeries| 6 7 8))
                 (|UnivariateLaurentSeriesCategory| 6) (|Field|)
                 (|UnivariateSeriesWithRationalExponents| 6 16)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UnivariatePowerSeriesCategory| 6 16)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|PowerSeriesCategory| 6 16 (|SingletonAsOrderedSet|))
                 (|OrderedIntegralDomain|) (|GcdDomain|)
                 (|AbelianMonoidRing| 6 16) (|IntegralDomain|)
                 (|DifferentialExtension| (|UnivariateTaylorSeries| 6 7 8))
                 (|OrderedRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|LeftOreRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 9)
                 (|Algebra| (|UnivariateTaylorSeries| 6 7 8))
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 60) (|EntireRing|) (|Algebra| $$) (|Algebra| 6)
                 (|Ring|) (|Rng|)
                 (|NonAssociativeAlgebra| (|UnivariateTaylorSeries| 6 7 8))
                 (|NonAssociativeAlgebra| 60) (|SemiRing|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 6)
                 (|FullyLinearlyExplicitOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|Module| (|UnivariateTaylorSeries| 6 7 8)) (|Module| 60)
                 (|Module| $$) (|Module| 6) (|SemiRng|)
                 (|LinearlyExplicitOver| 16)
                 (|LinearlyExplicitOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|BiModule| (|UnivariateTaylorSeries| 6 7 8)
                             (|UnivariateTaylorSeries| 6 7 8))
                 (|OrderedAbelianGroup|) (|BiModule| 60 60)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 16) (|RightModule| 16)
                 (|RightModule| (|UnivariateTaylorSeries| 6 7 8))
                 (|NonAssociativeRng|)
                 (|LeftModule| (|UnivariateTaylorSeries| 6 7 8))
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 60)
                 (|LeftModule| 60) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|FullyPatternMatchable| (|UnivariateTaylorSeries| 6 7 8))
                 (|OrderedSet|) (|MagmaWithUnit|) (|AbelianMonoid|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|PatternMatchable| 16) (|PatternMatchable| 57)
                 (|FullyEvalableOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|StepThrough|) (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|Patternable| (|UnivariateTaylorSeries| 6 7 8))
                 (|Evalable| (|UnivariateTaylorSeries| 6 7 8))
                 (|RetractableTo| 16) (|RetractableTo| 60) (|RealConstant|)
                 (|RetractableTo| 9) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|) (|SetCategory|)
                 (|RetractableTo| (|UnivariateTaylorSeries| 6 7 8)) (|Type|)
                 (|ConvertibleTo| 42) (|ConvertibleTo| 41)
                 (|Eltable| (|UnivariateTaylorSeries| 6 7 8) $$)
                 (|InnerEvalable| (|UnivariateTaylorSeries| 6 7 8)
                                  (|UnivariateTaylorSeries| 6 7 8))
                 (|InnerEvalable| 9 (|UnivariateTaylorSeries| 6 7 8))
                 (|CoercibleFrom| 16) (|CoercibleFrom| 60) (|PartialOrder|)
                 (|ConvertibleTo| 57) (|ConvertibleTo| 56) (|ConvertibleTo| 40)
                 (|CoercibleFrom| 9) (|unitsKnown|) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|RadicalCategory|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|Eltable| $$ $$)
                 (|CoercibleTo| 28) (|BasicType|)
                 (|VariablesCommuteWithCoefficients|)
                 (|CoercibleFrom| (|UnivariateTaylorSeries| 6 7 8)))
              (|makeByteWordVec2| 62
                                  '(1 6 12 0 13 0 6 0 14 0 0 0 15 2 0 0 6 16 17
                                    0 6 0 18 0 0 0 19 2 0 0 0 0 20 1 0 0 0 23 1
                                    0 0 0 25 2 0 0 0 21 26 1 0 9 0 10 2 0 0 6
                                    16 17 1 37 0 0 25 2 37 0 0 21 26 2 0 0 0 21
                                    24 1 44 0 0 23 1 0 0 21 22 1 0 6 0 11 0 62
                                    0 19 0 60 0 15 2 0 0 0 0 20)))))
           '|lookupIncomplete|)) 
