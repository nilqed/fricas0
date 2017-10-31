
(SDEFUN |SMPEXPR;log;2$;1| ((|p| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT $ 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 10))
                     (QREFELT $ 11)))
          ('T
           (SEQ
            (SPADCALL
             (SPADCALL "log p for p= " (SPADCALL |p| (QREFELT $ 13))
                       (QREFELT $ 14))
             (QREFELT $ 17))
            (EXIT
             (|error|
              "SUPTRAFUN: log only defined for elements of the coefficient ring"))))))) 

(SDEFUN |SMPEXPR;exp;2$;2| ((|p| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT $ 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 19))
                     (QREFELT $ 11)))
          ('T
           (SEQ
            (SPADCALL
             (SPADCALL "exp p for p= " (SPADCALL |p| (QREFELT $ 13))
                       (QREFELT $ 14))
             (QREFELT $ 17))
            (EXIT
             (|error|
              "SUPTRAFUN: exp only defined for elements of the coefficient ring"))))))) 

(SDEFUN |SMPEXPR;sin;2$;3| ((|p| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT $ 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 21))
                     (QREFELT $ 11)))
          ('T
           (SEQ
            (SPADCALL
             (SPADCALL "sin p for p= " (SPADCALL |p| (QREFELT $ 13))
                       (QREFELT $ 14))
             (QREFELT $ 17))
            (EXIT
             (|error|
              "SUPTRAFUN: sin only defined for elements of the coefficient ring"))))))) 

(SDEFUN |SMPEXPR;asin;2$;4| ((|p| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT $ 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 23))
                     (QREFELT $ 11)))
          ('T
           (SEQ
            (SPADCALL
             (SPADCALL "asin p for p= " (SPADCALL |p| (QREFELT $ 13))
                       (QREFELT $ 14))
             (QREFELT $ 17))
            (EXIT
             (|error|
              "SUPTRAFUN: asin only defined for elements of the coefficient ring"))))))) 

(SDEFUN |SMPEXPR;cos;2$;5| ((|p| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT $ 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 25))
                     (QREFELT $ 11)))
          ('T
           (SEQ
            (SPADCALL
             (SPADCALL "cos p for p= " (SPADCALL |p| (QREFELT $ 13))
                       (QREFELT $ 14))
             (QREFELT $ 17))
            (EXIT
             (|error|
              "SUPTRAFUN: cos only defined for elements of the coefficient ring"))))))) 

(SDEFUN |SMPEXPR;acos;2$;6| ((|p| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT $ 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 27))
                     (QREFELT $ 11)))
          ('T
           (SEQ
            (SPADCALL
             (SPADCALL "acos p for p= " (SPADCALL |p| (QREFELT $ 13))
                       (QREFELT $ 14))
             (QREFELT $ 17))
            (EXIT
             (|error|
              "SUPTRAFUN: acos only defined for elements of the coefficient ring"))))))) 

(DECLAIM (NOTINLINE |SparseMultivariatePolynomialExpressions;|)) 

(DEFUN |SparseMultivariatePolynomialExpressions| (#1=#:G786)
  (SPROG NIL
         (PROG (#2=#:G787)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SparseMultivariatePolynomialExpressions|)
                                               '|domainEqualList|)
                    . #3=(|SparseMultivariatePolynomialExpressions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SparseMultivariatePolynomialExpressions;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariatePolynomialExpressions|)))))))))) 

(DEFUN |SparseMultivariatePolynomialExpressions;| (|#1|)
  (SPROG
   ((#1=#:G785 NIL) (|pv$| NIL) (#2=#:G775 NIL) (#3=#:G776 NIL) (#4=#:G777 NIL)
    (#5=#:G778 NIL) (#6=#:G779 NIL) (#7=#:G780 NIL) (#8=#:G781 NIL)
    (#9=#:G782 NIL) (#10=#:G783 NIL) (#11=#:G784 NIL) ($ NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|)
          . #12=(|SparseMultivariatePolynomialExpressions|))
    (LETT |dv$| (LIST '|SparseMultivariatePolynomialExpressions| DV$1) . #12#)
    (LETT $ (GETREFV 73) . #12#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #11#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #12#)
                                        (OR #11#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory| (|NonNegativeInteger|)
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (|HasCategory| |#1|
                                                       '(|TranscendentalFunctionCategory|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #12#)
                                        (OR #10# #11#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #12#)
                                        (OR #10# #11# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #11# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #10# #11# #9#) (OR #11# #9#)
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #11# #9#
                                            (|HasCategory| |#1| '(|Ring|)))
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #11# #9#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|NonNegativeInteger|)
                                                '(|PatternMatchable|
                                                  (|Float|))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #11#
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|NonNegativeInteger|)
                                                '(|PatternMatchable|
                                                  (|Integer|))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #11#
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|NonNegativeInteger|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|)))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #11#
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|NonNegativeInteger|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|)))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #11#
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         #5#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #4# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #4# #2# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))))
                    . #12#))
    (|haddProp| |$ConstructorCache| '|SparseMultivariatePolynomialExpressions|
                (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 35184372088832))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #12#)
     (|augmentPredVector| $ 70368744177664))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 140737488355328))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR #11#
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR #4# (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR #3# (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 18014398509481984))
    (AND
     (OR #2# (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 36028797018963968))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 17)
      (PROGN
       (QSETREFV $ 18 (CONS (|dispatchFunction| |SMPEXPR;log;2$;1|) $))
       (QSETREFV $ 20 (CONS (|dispatchFunction| |SMPEXPR;exp;2$;2|) $))
       (QSETREFV $ 22 (CONS (|dispatchFunction| |SMPEXPR;sin;2$;3|) $))
       (QSETREFV $ 24 (CONS (|dispatchFunction| |SMPEXPR;asin;2$;4|) $))
       (QSETREFV $ 26 (CONS (|dispatchFunction| |SMPEXPR;cos;2$;5|) $))
       (QSETREFV $ 28 (CONS (|dispatchFunction| |SMPEXPR;acos;2$;6|) $)))))
    $))) 

(MAKEPROP '|SparseMultivariatePolynomialExpressions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 41)
              (|local| |#1|) (|Boolean|) (0 . |ground?|) (5 . |ground|)
              (10 . |log|) (15 . |coerce|) (|OutputForm|) (20 . |coerce|)
              (25 . |hconcat|) (|Void|) (|OutputPackage|) (31 . |output|)
              (36 . |log|) (41 . |exp|) (46 . |exp|) (51 . |sin|) (56 . |sin|)
              (61 . |asin|) (66 . |asin|) (71 . |cos|) (76 . |cos|)
              (81 . |acos|) (86 . |acos|) (|Union| 35 '#1="failed")
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 40)
              (|Record| (|:| |mat| 36) (|:| |vec| (|Vector| 40))) (|Vector| $)
              (|Matrix| 40) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 40 $) (|Union| $ '#1#) (|Integer|)
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 40)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Factored| 46) (|Union| 50 '#1#) (|List| 46)
              (|Union| 43 '#2="failed") (|Union| 40 '#2#) (|List| 41)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Matrix| 6)
              (|Record| (|:| |mat| 55) (|:| |vec| (|Vector| 6)))
              (|IndexedExponents| 41) (|Union| 41 '#2#) (|List| 60)
              (|Equation| $) (|Union| 45 '#3="failed")
              (|Record| (|:| |var| 41) (|:| |exponent| 41)) (|Union| 62 '#3#)
              (|SparseUnivariatePolynomial| 6) (|List| 6) (|Mapping| 57 57)
              (|Union| 6 '#2#) (|Mapping| 6 6) (|PositiveInteger|) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(|sin| 91 |log| 96 |ground?| 101 |ground| 106 |exp| 111 |cos| 116
              |coerce| 121 |asin| 131 |acos| 136)
           'NIL
           (CONS
            (|makeByteWordVec2| 45
                                '(0 0 10 0 10 0 14 26 1 22 4 28 13 1 2 3 22 4 9
                                  25 28 15 4 0 1 30 31 0 0 1 1 23 29 31 41 11
                                  43 0 11 45 0 0 8 33 35 0 0 11 17 0 0 0 0 0 0
                                  4 5 6 7 27 12 37 39 16 11 11 17 17 17 17 17))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |Algebra&| |Algebra&| |FullyLinearlyExplicitOver&|
                |Algebra&| NIL |Module&| NIL NIL |Module&| NIL NIL NIL
                |Module&| |EntireRing&| |PartialDifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| |AbelianGroup&| NIL NIL
                NIL |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                NIL NIL NIL |FullyRetractableTo&| |SetCategory&| |Evalable&|
                |TranscendentalFunctionCategory&| NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |BasicType&| NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL NIL
                |InnerEvalable&| |RetractableTo&|
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL
                |ElementaryFunctionCategory&|)
             (CONS
              '#((|PolynomialCategory| 6 57 41)
                 (|MaybeSkewPolynomialCategory| 6 57 41)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 57) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 57) (|GcdDomain|) (|IntegralDomain|)
                 (|Algebra| 43) (|Algebra| 6) (|FullyLinearlyExplicitOver| 6)
                 (|Algebra| $$) (|LeftOreRing|) (|Module| 43)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 40)
                 (|CommutativeRing|) (|Module| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 41) (|BiModule| 6 6)
                 (|BiModule| 43 43) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| 6) (|RightModule| 6) (|LeftModule| 43)
                 (|RightModule| 43) (|RightModule| $$) (|LeftModule| $$)
                 (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 40) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|Evalable| $$)
                 (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 41 $$)
                 (|InnerEvalable| 41 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 12) (|unitsKnown|) (|RetractableTo| 43)
                 (|RetractableTo| 40) (|canonicalUnitNormal|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|ConvertibleTo| 32)
                 (|ConvertibleTo| 33) (|ConvertibleTo| 31)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 41)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|))
              (|makeByteWordVec2| 28
                                  '(1 0 7 0 8 1 0 6 0 9 1 6 0 0 10 1 0 0 6 11 1
                                    0 12 0 13 2 12 0 0 0 14 1 16 15 12 17 1 0 0
                                    0 18 1 6 0 0 19 1 0 0 0 20 1 6 0 0 21 1 0 0
                                    0 22 1 6 0 0 23 1 0 0 0 24 1 6 0 0 25 1 0 0
                                    0 26 1 6 0 0 27 1 0 0 0 28 1 17 0 0 22 1 17
                                    0 0 18 1 0 7 0 8 1 0 6 0 9 1 17 0 0 20 1 17
                                    0 0 26 1 0 0 6 11 1 0 12 0 13 1 17 0 0 24 1
                                    17 0 0 28)))))
           '|lookupIncomplete|)) 
