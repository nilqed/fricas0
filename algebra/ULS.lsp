
(SDEFUN |ULS;variable;$S;1| ((|x| $) ($ |Symbol|)) (QREFELT $ 7)) 

(SDEFUN |ULS;center;$Coef;2| ((|x| $) ($ |Coef|)) (QREFELT $ 8)) 

(SDEFUN |ULS;coerce;V$;3| ((|v| |Variable| |var|) ($ $))
        (COND
         ((SPADCALL (QREFELT $ 8) (QREFELT $ 13))
          (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 17)))
         ('T
          (SPADCALL (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 17))
                    (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 17)) (QREFELT $ 20))))) 

(SDEFUN |ULS;differentiate;$V$;4| ((|x| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |x| (QREFELT $ 23))) 

(SDEFUN |ULS;integrate;$V$;5| ((|x| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |x| (QREFELT $ 25))) 

(DECLAIM (NOTINLINE |UnivariateLaurentSeries;|)) 

(DEFUN |UnivariateLaurentSeries| (&REST #1=#:G437)
  (SPROG NIL
         (PROG (#2=#:G438)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateLaurentSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |UnivariateLaurentSeries;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UnivariateLaurentSeries|)))))))))) 

(DEFUN |UnivariateLaurentSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G436 NIL) (|pv$| NIL) (#2=#:G425 NIL) (#3=#:G426 NIL) (#4=#:G427 NIL)
    (#5=#:G429 NIL) (#6=#:G430 NIL) (#7=#:G431 NIL) (#8=#:G432 NIL)
    (#9=#:G434 NIL) (#10=#:G435 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|UnivariateLaurentSeries| DV$1 DV$2 DV$3))
    (LETT $ (GETREFV 80))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
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
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR #4#
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
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR #3#
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
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|)))))
                                        (OR #2#
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
                                        (OR
                                         (AND #2#
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|)))
                                         #3#
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
                                                           '(|CharacteristicNonZero|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicZero|))
                                            #9# (|HasCategory| |#1| '(|Field|))
                                            #8# #4#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (AND #2#
                                              (|HasCategory| |#1|
                                                             '(|AlgebraicallyClosedFunctionSpace|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|PrimitiveFunctionCategory|))
                                              (|HasCategory| |#1|
                                                             '(|TranscendentalFunctionCategory|)))
                                         (AND #2#
                                              (|HasSignature| |#1|
                                                              (LIST
                                                               '|integrate|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|))))
                                              (|HasSignature| |#1|
                                                              (LIST
                                                               '|variables|
                                                               (LIST
                                                                '(|List|
                                                                  (|Symbol|))
                                                                (|devaluate|
                                                                 |#1|))))))))))
    (|haddProp| |$ConstructorCache| '|UnivariateLaurentSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 4503599627370496))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|Field|))
                (|HasCategory| $ '(|CharacteristicNonZero|))
                (|HasCategory| (|UnivariateTaylorSeries| |#1| |#2| |#3|)
                               '(|PolynomialFactorizationExplicit|))))
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#
         (AND (|HasCategory| |#1| '(|Field|)) #5#))
     (|augmentPredVector| $ 18014398509481984))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 36028797018963968))
    (AND
     (OR (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 72057594037927936))
    (AND
     (OR (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 144115188075855872))
    (AND
     (OR (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #4#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 288230376151711744))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 576460752303423488))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1152921504606846976))
    (AND
     (OR #3# (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2305843009213693952))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 48)
      (QSETREFV $ 26 (CONS (|dispatchFunction| |ULS;integrate;$V$;5|) $))))
    $))) 

(MAKEPROP '|UnivariateLaurentSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|UnivariateLaurentSeriesConstructor| 6 32)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|Symbol|)
              |ULS;variable;$S;1| |ULS;center;$Coef;2| (|Boolean|)
              (0 . |zero?|) (5 . |One|) (9 . |One|) (|Integer|)
              (13 . |monomial|) (19 . |Zero|) (23 . |Zero|) (27 . +)
              (|Variable| (NRTEVAL (QREFELT $ 7))) |ULS;coerce;V$;3|
              (33 . |differentiate|) |ULS;differentiate;$V$;4|
              (38 . |integrate|) (43 . |integrate|) (|Union| 39 '#1="failed")
              (|Matrix| $) (|InputForm|) (|Pattern| 46) (|Pattern| 16)
              (|UnivariateTaylorSeries| 6 (NRTEVAL (QREFELT $ 7))
                                        (NRTEVAL (QREFELT $ 8)))
              (|List| 32) (|Equation| 32) (|List| 34) (|List| 9) (|Matrix| 16)
              (|Record| (|:| |mat| 37) (|:| |vec| (|Vector| 16))) (|Vector| $)
              (|PatternMatchResult| 46 $) (|PatternMatchResult| 16 $)
              (|Union| 43 '#1#) (|List| 44) (|SparseUnivariatePolynomial| $)
              (|Factored| 44) (|Float|) (|DoubleFloat|)
              (|Union| 49 '#2="failed") (|Fraction| 16) (|Union| 16 '#2#)
              (|Union| 9 '#2#) (|Union| $ '"failed") (|NonNegativeInteger|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|List| 53) (|Mapping| 32 32)
              (|Record| (|:| |mat| 58) (|:| |vec| (|Vector| 32))) (|Matrix| 32)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 60) (|:| |generator| $))
              (|Union| 60 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 65 '"failed")
              (|Factored| $) (|Fraction| (|Polynomial| 6)) (|Stream| 6)
              (|Union| 32 '"failed") (|Mapping| 6 16)
              (|Record| (|:| |k| 16) (|:| |c| 6)) (|Stream| 72)
              (|PositiveInteger|) (|Mapping| 6 6) (|HashState|) (|String|)
              (|OutputForm|) (|SingleInteger|))
           '#(|variable| 49 |monomial| 54 |integrate| 60 |differentiate| 71
              |coerce| 82 |center| 87 |Zero| 92 |One| 96 + 100)
           'NIL
           (CONS
            (|makeByteWordVec2| 51
                                '(0 0 2 2 0 2 31 0 2 2 0 2 6 24 2 2 23 6 2 2 19
                                  23 24 49 33 7 2 39 40 2 13 51 38 51 0 19 23
                                  49 2 0 0 42 49 6 2 0 0 0 0 49 49 6 2 2 51 47
                                  6 46 38 38 6 0 0 50 38 27 2 0 0 28 9 2 16 17
                                  0 23 49 5 11 2 0 0 0 0 1 23 24 2 2 49 49 49
                                  49 49 49 42 3 4 5 5 27 8 8 10 11 12 14 15 2))
            (CONS
             '#(|UnivariateLaurentSeriesConstructorCategory&|
                |UnivariateLaurentSeriesCategory&| |QuotientFieldCategory&|
                |Field&| |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL NIL NIL |DivisionRing&| NIL |OrderedRing&|
                |DifferentialExtension&| |FullyLinearlyExplicitOver&|
                |Algebra&| |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |Algebra&| |PartialDifferentialRing&| |DifferentialRing&| NIL
                NIL NIL NIL |Rng&| NIL |Module&| |Module&| |Module&| |Module&|
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL
                NIL NIL NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |OrderedSet&| NIL |Magma&| |AbelianSemiGroup&|
                NIL NIL |FullyEvalableOver&| NIL NIL |SetCategory&| NIL
                |TranscendentalFunctionCategory&| NIL |Evalable&| NIL
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL |RetractableTo&| NIL NIL NIL
                |PartialOrder&| |RetractableTo&| |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariateLaurentSeriesConstructorCategory| 6
                                                               (|UnivariateTaylorSeries|
                                                                6 7 8))
                 (|UnivariateLaurentSeriesCategory| 6)
                 (|QuotientFieldCategory| (|UnivariateTaylorSeries| 6 7 8))
                 (|Field|) (|UnivariatePowerSeriesCategory| 6 16)
                 (|EuclideanDomain|) (|PolynomialFactorizationExplicit|)
                 (|PowerSeriesCategory| 6 16 (|SingletonAsOrderedSet|))
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 16) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|DivisionRing|) (|CommutativeRing|) (|OrderedRing|)
                 (|DifferentialExtension| (|UnivariateTaylorSeries| 6 7 8))
                 (|FullyLinearlyExplicitOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|Algebra| 6) (|Algebra| $$) (|EntireRing|) (|Algebra| 49)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|Algebra| (|UnivariateTaylorSeries| 6 7 8))
                 (|PartialDifferentialRing| 9) (|DifferentialRing|)
                 (|LinearlyExplicitOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|LinearlyExplicitOver| 16) (|Ring|) (|SemiRing|) (|Rng|)
                 (|SemiRng|) (|Module| 6) (|Module| $$) (|Module| 49)
                 (|Module| (|UnivariateTaylorSeries| 6 7 8)) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 49 49)
                 (|OrderedAbelianGroup|)
                 (|BiModule| (|UnivariateTaylorSeries| 6 7 8)
                             (|UnivariateTaylorSeries| 6 7 8))
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 49) (|RightModule| 49)
                 (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| (|UnivariateTaylorSeries| 6 7 8))
                 (|RightModule| (|UnivariateTaylorSeries| 6 7 8))
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|OrderedAbelianSemiGroup|) (|NonAssociativeSemiRng|)
                 (|SemiGroup|) (|AbelianMonoid|) (|MagmaWithUnit|)
                 (|OrderedSet|)
                 (|FullyPatternMatchable| (|UnivariateTaylorSeries| 6 7 8))
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|FullyEvalableOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|PatternMatchable| 46) (|PatternMatchable| 16)
                 (|SetCategory|) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|) (|RealConstant|)
                 (|Evalable| (|UnivariateTaylorSeries| 6 7 8))
                 (|Patternable| (|UnivariateTaylorSeries| 6 7 8))
                 (|RetractableTo| (|UnivariateTaylorSeries| 6 7 8))
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 78) (|Eltable| $$ $$) (|TwoSidedRecip|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|unitsKnown|) (|RetractableTo| 9) (|ConvertibleTo| 29)
                 (|ConvertibleTo| 47) (|ConvertibleTo| 46) (|PartialOrder|)
                 (|RetractableTo| 49) (|RetractableTo| 16)
                 (|InnerEvalable| 9 (|UnivariateTaylorSeries| 6 7 8))
                 (|InnerEvalable| (|UnivariateTaylorSeries| 6 7 8)
                                  (|UnivariateTaylorSeries| 6 7 8))
                 (|Eltable| (|UnivariateTaylorSeries| 6 7 8) $$)
                 (|ConvertibleTo| 30) (|ConvertibleTo| 31) (|Type|))
              (|makeByteWordVec2| 60
                                  '(1 6 12 0 13 0 6 0 14 0 0 0 15 2 0 0 6 16 17
                                    0 6 0 18 0 0 0 19 2 0 0 0 0 20 1 0 0 0 23 1
                                    0 0 0 25 2 0 0 0 21 26 1 0 9 0 10 2 0 0 6
                                    16 17 2 48 0 0 21 26 1 48 0 0 25 1 40 0 0
                                    23 2 0 0 0 21 24 1 0 0 21 22 1 0 6 0 11 0
                                    60 0 19 0 58 0 15 2 0 0 0 0 20)))))
           '|lookupIncomplete|)) 
