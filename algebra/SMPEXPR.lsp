
(SDEFUN |SMPEXPR;log;2%;1| ((|p| (%)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT % 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT % 9)) (QREFELT % 10))
                     (QREFELT % 11)))
          ('T
           (SEQ
            (SPADCALL "log p for p=" (SPADCALL |p| (QREFELT % 13))
                      (QREFELT % 17))
            (EXIT
             (|error|
              "SUPTRAFUN: log only defined for elements of the coefficient ring"))))))) 

(SDEFUN |SMPEXPR;exp;2%;2| ((|p| (%)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT % 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT % 9)) (QREFELT % 19))
                     (QREFELT % 11)))
          ('T
           (SEQ
            (SPADCALL "exp p for p=" (SPADCALL |p| (QREFELT % 13))
                      (QREFELT % 17))
            (EXIT
             (|error|
              "SUPTRAFUN: exp only defined for elements of the coefficient ring"))))))) 

(SDEFUN |SMPEXPR;sin;2%;3| ((|p| (%)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT % 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT % 9)) (QREFELT % 21))
                     (QREFELT % 11)))
          ('T
           (SEQ
            (SPADCALL "sin p for p=" (SPADCALL |p| (QREFELT % 13))
                      (QREFELT % 17))
            (EXIT
             (|error|
              "SUPTRAFUN: sin only defined for elements of the coefficient ring"))))))) 

(SDEFUN |SMPEXPR;asin;2%;4| ((|p| (%)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT % 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT % 9)) (QREFELT % 23))
                     (QREFELT % 11)))
          ('T
           (SEQ
            (SPADCALL "asin p for p=" (SPADCALL |p| (QREFELT % 13))
                      (QREFELT % 17))
            (EXIT
             (|error|
              "SUPTRAFUN: asin only defined for elements of the coefficient ring"))))))) 

(SDEFUN |SMPEXPR;cos;2%;5| ((|p| (%)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT % 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT % 9)) (QREFELT % 25))
                     (QREFELT % 11)))
          ('T
           (SEQ
            (SPADCALL "cos p for p=" (SPADCALL |p| (QREFELT % 13))
                      (QREFELT % 17))
            (EXIT
             (|error|
              "SUPTRAFUN: cos only defined for elements of the coefficient ring"))))))) 

(SDEFUN |SMPEXPR;acos;2%;6| ((|p| (%)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL |p| (QREFELT % 8))
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT % 9)) (QREFELT % 27))
                     (QREFELT % 11)))
          ('T
           (SEQ
            (SPADCALL "acos p for p=" (SPADCALL |p| (QREFELT % 13))
                      (QREFELT % 17))
            (EXIT
             (|error|
              "SUPTRAFUN: acos only defined for elements of the coefficient ring"))))))) 

(DECLAIM (NOTINLINE |SparseMultivariatePolynomialExpressions;|)) 

(DEFUN |SparseMultivariatePolynomialExpressions;| (|#1|)
  (SPROG
   ((#1=#:G73 NIL) (|pv$| NIL) (#2=#:G64 NIL) (#3=#:G66 NIL) (#4=#:G65 NIL)
    (#5=#:G67 NIL) (#6=#:G68 NIL) (#7=#:G69 NIL) (#8=#:G70 NIL) (#9=#:G71 NIL)
    (#10=#:G72 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|SparseMultivariatePolynomialExpressions| DV$1))
    (LETT % (GETREFV 76))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                                       '(|CommutativeRing|))
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
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #10#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory| (|NonNegativeInteger|)
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory|
                                              (|NonNegativeInteger|)
                                              '(|Hashable|)))
                                        (|HasCategory| |#1|
                                                       '(|TranscendentalFunctionCategory|))
                                        (|HasCategory|
                                         (|IndexedExponents|
                                          (|NonNegativeInteger|))
                                         '(|Comparable|))
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
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10# #9#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #10# #9#
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
                                                  (|Float|)))))
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
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
                                                  (|Integer|)))))
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
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
                                                  (|Pattern| (|Float|))))))
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
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
                                                  (|Pattern| (|Integer|))))))
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
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
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #4# #10#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
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
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|SparseMultivariatePolynomialExpressions|
                (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 35184372088832))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 70368744177664))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 140737488355328))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #10#
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 562949953421312))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #10# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|AbelianMonoid|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 72057594037927936))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 20)
      (PROGN
       (QSETREFV % 18 (CONS (|dispatchFunction| |SMPEXPR;log;2%;1|) %))
       (QSETREFV % 20 (CONS (|dispatchFunction| |SMPEXPR;exp;2%;2|) %))
       (QSETREFV % 22 (CONS (|dispatchFunction| |SMPEXPR;sin;2%;3|) %))
       (QSETREFV % 24 (CONS (|dispatchFunction| |SMPEXPR;asin;2%;4|) %))
       (QSETREFV % 26 (CONS (|dispatchFunction| |SMPEXPR;cos;2%;5|) %))
       (QSETREFV % 28 (CONS (|dispatchFunction| |SMPEXPR;acos;2%;6|) %)))))
    %))) 

(DEFUN |SparseMultivariatePolynomialExpressions| (#1=#:G74)
  (SPROG NIL
         (PROG (#2=#:G75)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SparseMultivariatePolynomialExpressions|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SparseMultivariatePolynomialExpressions;| #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariatePolynomialExpressions|)))))))))) 

(MAKEPROP '|SparseMultivariatePolynomialExpressions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 37)
              (|local| |#1|) (|Boolean|) (0 . |ground?|) (5 . |ground|)
              (10 . |log|) (15 . |coerce|) (|OutputForm|) (20 . |coerce|)
              (|Void|) (|String|) (|OutputPackage|) (25 . |output|)
              (31 . |log|) (36 . |exp|) (41 . |exp|) (46 . |sin|) (51 . |sin|)
              (56 . |asin|) (61 . |asin|) (66 . |cos|) (71 . |cos|)
              (76 . |acos|) (81 . |acos|) (|PositiveInteger|)
              (|Record| (|:| |k| 33) (|:| |c| 6)) (|List| 30) (|Mapping| 6 6)
              (|IndexedExponents| 37) (|List| 33) (|List| %) (|List| 6)
              (|NonNegativeInteger|) (|Union| 6 '#1="failed") (|Mapping| 33 33)
              (|List| 37) (|Union| 37 '"failed")
              (|SparseUnivariatePolynomial| %) (|SparseUnivariatePolynomial| 6)
              (|Union| 35 '#2="failed") (|Union| 55 '#3="failed") (|Matrix| %)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 52) (|HashState|)
              (|SingleInteger|) (|Integer|) (|Matrix| 52)
              (|Record| (|:| |mat| 53) (|:| |vec| (|Vector| 52))) (|Vector| %)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 52 %)
              (|Union| % '#3#)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 52) (|Mapping| 6 33) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Factored| 42) (|Union| 66 '#3#) (|List| 42) (|Union| 60 '#1#)
              (|Union| 52 '#1#)
              (|Record| (|:| |mat| 70) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |var| 37) (|:| |exponent| 37)) (|Union| 72 '#2#)
              (|List| 75) (|Equation| %))
           '#(|sin| 86 |log| 91 |ground?| 96 |ground| 101 |exp| 106 |cos| 111
              |coerce| 116 |asin| 126 |acos| 131)
           'NIL
           (CONS
            (|makeByteWordVec2| 45
                                '(0 10 0 10 0 16 0 26 14 25 4 17 27 15 3 2 1 28
                                  28 27 12 15 1 0 27 4 5 1 0 0 39 4 4 1 0 0 0
                                  28 39 1 1 0 0 0 0 0 11 12 12 45 12 44 0 0 32
                                  30 9 0 0 0 20 12 12 19 27 7 6 0 0 20 20 20 20
                                  20 12 12 18 36 34 13 27 8 7 6 4 0 0 0 0 0 0))
            (CONS
             '#(|PolynomialCategory&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL NIL NIL |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |Algebra&| NIL NIL |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Module&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| NIL |NonAssociativeSemiRng&|
                NIL NIL NIL |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&|
                |TranscendentalFunctionCategory&| |RetractableTo&| |Evalable&|
                |Hashable&| NIL |RetractableTo&| |RetractableTo&|
                |SetCategory&| |RetractableTo&| |ElementaryFunctionCategory&|
                NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL |InnerEvalable&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |BasicType&| NIL
                |InnerEvalable&| |InnerEvalable&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 33 37)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 33 37)
                 (|UniqueFactorizationDomain|) (|FiniteAbelianMonoidRing| 6 33)
                 (|GcdDomain|) (|AbelianMonoidRing| 6 33) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|)
                 (|PartialDifferentialRing| 37) (|EntireRing|) (|Algebra| $$)
                 (|Algebra| 6) (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 60) (|Ring|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRing|) (|NonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 60) (|FreeModuleCategory| 6 33)
                 (|Module| $$) (|FullyLinearlyExplicitOver| 6) (|Module| 6)
                 (|Module| 60) (|IndexedDirectProductCategory| 6 33)
                 (|SemiRng|) (|LinearlyExplicitOver| 52)
                 (|LinearlyExplicitOver| 6) (|NonAssociativeRing|)
                 (|BiModule| 60 60) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 33) (|NonAssociativeRng|)
                 (|RightModule| 52) (|RightModule| 60) (|LeftModule| 60)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|PatternMatchable| 52) (|PatternMatchable| (|Float|))
                 (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 6) (|TranscendentalFunctionCategory|)
                 (|RetractableTo| 37) (|Evalable| $$) (|Hashable|)
                 (|CommutativeStar|) (|RetractableTo| 52) (|RetractableTo| 60)
                 (|SetCategory|) (|RetractableTo| 6)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|CoercibleFrom| 37)
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 47)
                 (|ConvertibleTo| 49) (|ConvertibleTo| 48) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|canonicalUnitNormal|) (|CoercibleFrom| 52)
                 (|CoercibleFrom| 60) (|unitsKnown|) (|CoercibleTo| 12)
                 (|BasicType|) (|CoercibleFrom| 6) (|InnerEvalable| 37 6)
                 (|InnerEvalable| 37 $$) (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| 28
                                  '(1 0 7 0 8 1 0 6 0 9 1 6 0 0 10 1 0 0 6 11 1
                                    0 12 0 13 2 16 14 15 12 17 1 0 0 0 18 1 6 0
                                    0 19 1 0 0 0 20 1 6 0 0 21 1 0 0 0 22 1 6 0
                                    0 23 1 0 0 0 24 1 6 0 0 25 1 0 0 0 26 1 6 0
                                    0 27 1 0 0 0 28 1 20 0 0 22 1 20 0 0 18 1 0
                                    7 0 8 1 0 6 0 9 1 20 0 0 20 1 20 0 0 26 1 0
                                    12 0 13 1 0 0 6 11 1 20 0 0 24 1 20 0 0
                                    28)))))
           '|lookupIncomplete|)) 
