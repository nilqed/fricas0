
(SDEFUN |SMPEXPR;log;2$;1| ((|p| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT $ 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 10))
                     (QREFELT $ 11)))
          ('T
           (SEQ
            (SPADCALL "log p for p=" (SPADCALL |p| (QREFELT $ 13))
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
            (SPADCALL "exp p for p=" (SPADCALL |p| (QREFELT $ 13))
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
            (SPADCALL "sin p for p=" (SPADCALL |p| (QREFELT $ 13))
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
            (SPADCALL "asin p for p=" (SPADCALL |p| (QREFELT $ 13))
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
            (SPADCALL "cos p for p=" (SPADCALL |p| (QREFELT $ 13))
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
            (SPADCALL "acos p for p=" (SPADCALL |p| (QREFELT $ 13))
                      (QREFELT $ 17))
            (EXIT
             (|error|
              "SUPTRAFUN: acos only defined for elements of the coefficient ring"))))))) 

(DECLAIM (NOTINLINE |SparseMultivariatePolynomialExpressions;|)) 

(DEFUN |SparseMultivariatePolynomialExpressions| (#1=#:G789)
  (SPROG NIL
         (PROG (#2=#:G790)
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
   ((#1=#:G788 NIL) (|pv$| NIL) (#2=#:G780 NIL) (#3=#:G781 NIL) (#4=#:G782 NIL)
    (#5=#:G783 NIL) (#6=#:G784 NIL) (#7=#:G785 NIL) (#8=#:G786 NIL)
    (#9=#:G787 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|)
          . #10=(|SparseMultivariatePolynomialExpressions|))
    (LETT |dv$| (LIST '|SparseMultivariatePolynomialExpressions| DV$1) . #10#)
    (LETT $ (GETREFV 72) . #10#)
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
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #10#)
                                        (OR #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #9#)
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
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #10#)
                                        (OR #8# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #10#)
                                        (OR #8# #9# #7#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #9# #7#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #8# #9# #7#)
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
                                         #8#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #9# #7#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|NonNegativeInteger|)
                                                '(|PatternMatchable|
                                                  (|Float|))))
                                              . #10#)
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
                                          #9#
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
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|NonNegativeInteger|)
                                                '(|PatternMatchable|
                                                  (|Integer|))))
                                              . #10#)
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
                                          #9#
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
                                         #5#)
                                        (LETT #4#
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
                                              . #10#)
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
                                          #9#
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
                                         #4#)
                                        (LETT #3#
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
                                              . #10#)
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
                                          #9#
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
                                         #3#)
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #10#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)))
                    . #10#))
    (|haddProp| |$ConstructorCache| '|SparseMultivariatePolynomialExpressions|
                (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 1099511627776))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #10#)
     (|augmentPredVector| $ 2199023255552))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 4398046511104))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8796093022208))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #9#
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 17592186044416))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 35184372088832))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 70368744177664))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR #2# (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 1125899906842624))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 18)
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
              (|Void|) (|String|) (|OutputPackage|) (25 . |output|)
              (31 . |log|) (36 . |exp|) (41 . |exp|) (46 . |sin|) (51 . |sin|)
              (56 . |asin|) (61 . |asin|) (66 . |cos|) (71 . |cos|)
              (76 . |acos|) (81 . |acos|) (|Union| 35 '#1="failed")
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
              (|IndexedExponents| 41) (|Union| 41 '#2#) (|Equation| $)
              (|List| 59) (|Record| (|:| |var| 41) (|:| |exponent| 41))
              (|Union| 61 '#3="failed") (|Union| 45 '#3#)
              (|SparseUnivariatePolynomial| 6) (|List| 6) (|Mapping| 57 57)
              (|Union| 6 '#2#) (|Mapping| 6 6) (|PositiveInteger|)
              (|SingleInteger|) (|HashState|))
           '#(|sin| 86 |log| 91 |ground?| 96 |ground| 101 |exp| 106 |cos| 111
              |coerce| 116 |asin| 126 |acos| 131)
           'NIL
           (CONS
            (|makeByteWordVec2| 40
                                '(0 0 10 0 10 0 15 26 4 25 14 1 2 3 23 4 9 27
                                  16 4 28 12 28 0 1 23 27 0 0 1 4 0 0 0 0 1 1
                                  28 11 40 12 12 0 0 39 12 0 0 8 30 32 0 0 12
                                  18 0 0 0 0 0 0 4 5 6 7 27 13 34 36 17 12 12
                                  18 18 18 18 18))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitOver&| NIL NIL |Algebra&| NIL NIL
                |Algebra&| NIL NIL |Algebra&| |EntireRing&|
                |PartialDifferentialRing&| NIL NIL |Rng&| NIL |Module&|
                |Module&| |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL
                NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |Magma&| |AbelianSemiGroup&| NIL NIL NIL
                |FullyRetractableTo&| |SetCategory&| |Evalable&|
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
                 (|FullyLinearlyExplicitOver| 6) (|CommutativeRing|)
                 (|LeftOreRing|) (|Algebra| 43) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 40)
                 (|Algebra| $$) (|EntireRing|) (|PartialDifferentialRing| 41)
                 (|Ring|) (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 43)
                 (|Module| 6) (|Module| $$) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|BiModule| 43 43) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 43) (|RightModule| 43) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
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
                                    0 12 0 13 2 16 14 15 12 17 1 0 0 0 18 1 6 0
                                    0 19 1 0 0 0 20 1 6 0 0 21 1 0 0 0 22 1 6 0
                                    0 23 1 0 0 0 24 1 6 0 0 25 1 0 0 0 26 1 6 0
                                    0 27 1 0 0 0 28 1 18 0 0 22 1 18 0 0 18 1 0
                                    7 0 8 1 0 6 0 9 1 18 0 0 20 1 18 0 0 26 1 0
                                    0 6 11 1 0 12 0 13 1 18 0 0 24 1 18 0 0
                                    28)))))
           '|lookupIncomplete|)) 
