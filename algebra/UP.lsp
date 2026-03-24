
(SDEFUN |UP;coerce;%Of;1| ((|p| (%)) (% (|OutputForm|)))
        (SPADCALL |p| (SPADCALL (QREFELT % 6) (QREFELT % 11)) (QREFELT % 12))) 

(SDEFUN |UP;coerce;V%;2| ((|v| (|Variable| |x|)) (% (%)))
        (SPADCALL (|spadConstant| % 15) 1 (QREFELT % 17))) 

(DECLAIM (NOTINLINE |UnivariatePolynomial;|)) 

(DEFUN |UnivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G62 NIL) (|pv$| NIL) (#2=#:G53 NIL) (#3=#:G55 NIL) (#4=#:G54 NIL)
    (#5=#:G56 NIL) (#6=#:G57 NIL) (#7=#:G58 NIL) (#8=#:G59 NIL) (#9=#:G60 NIL)
    (#10=#:G61 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|UnivariatePolynomial| DV$1 DV$2))
    (LETT % (GETREFV 77))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#2| '(|Comparable|))
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (AND (|HasCategory| |#2| '(|Hashable|))
                                             (|HasCategory|
                                              (|SingletonAsOrderedSet|)
                                              '(|Hashable|)))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|Field|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|)))
                                        (OR (|HasCategory| |#2| '(|Field|))
                                            #10#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #10#)
                                        (LETT #9#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|Field|)) #10#
                                         #9#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR (|HasCategory| |#2| '(|Field|))
                                            #10# #9#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #10# #9#)
                                        (|HasCategory| |#2| '(|StepThrough|))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2| '(|Field|)) #10#
                                         #9#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|Canonical|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #5#)
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #4#
                                              (|HasCategory| |#2| '(|Field|)))
                                         (AND #4# #10#) (AND #4# #9#)
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|UnivariatePolynomial| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 140737488355328))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 281474976710656))
    (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 562949953421312))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR (|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #10#
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #10# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#2| '(|AbelianMonoid|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|CommutativeRing|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 288230376151711744))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|SparseUnivariatePolynomial| |#2|))
    %))) 

(DEFUN |UnivariatePolynomial| (&REST #1=#:G63)
  (SPROG NIL
         (PROG (#2=#:G64)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |UnivariatePolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UnivariatePolynomial|)))))))))) 

(MAKEPROP '|UnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (|Symbol|) (|OutputForm|)
              (0 . |outputForm|) (5 . |outputForm|) |UP;coerce;%Of;1|
              (11 . |One|) (15 . |One|) (|NonNegativeInteger|)
              (19 . |monomial|) (|Variable| (NRTEVAL (QREFELT % 6)))
              |UP;coerce;V%;2| (|Boolean|) (|String|) (|PositiveInteger|)
              (|Record| (|:| |k| 16) (|:| |c| 7)) (|List| 23) (|Mapping| 7 7)
              (|List| 16) (|List| %) (|List| 7) (|Union| 7 '#1="failed")
              (|Mapping| 16 16) (|SingletonAsOrderedSet|) (|List| 31)
              (|Union| 31 '"failed") (|SparseUnivariatePolynomial| %)
              (|Union| 27 '#2="failed") (|Vector| 7) (|Union| % '#3="failed")
              (|Union| 48 '#4="failed") (|Matrix| %) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 45) (|SingleInteger|)
              (|HashState|) (|Integer|) (|Matrix| 45)
              (|Record| (|:| |mat| 46) (|:| |vec| (|Vector| 45))) (|Vector| %)
              (|List| 9) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 45 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 45) (|Mapping| 7 16) (|Fraction| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 56 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 27) (|:| |generator| %)) (|Factored| %)
              (|Record| (|:| |primePart| %) (|:| |commonPart| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 55 '#3#)
              (|Record| (|:| |coef| 7) (|:| |quotient| %) (|:| |remainder| %))
              (|Factored| 34) (|Union| 68 '#4#) (|List| 34) (|Union| 53 '#1#)
              (|Union| 45 '#1#) (|Record| (|:| |mat| 72) (|:| |vec| 36))
              (|Matrix| 7) (|Record| (|:| |var| 31) (|:| |exponent| 16))
              (|Union| 73 '#2#) (|Equation| %) (|List| 75))
           '#(~= 25 |zero?| 31 |vectorise| 36 |variables| 42 |unvectorise| 47
              |unmakeSUP| 52 |univariate| 57 |unitNormal| 68 |unitCanonical| 73
              |unit?| 78 |totalDegreeSorted| 83 |totalDegree| 89 |support| 100
              |subtractIfCan| 105 |subResultantGcd| 111 |squareFreePolynomial|
              117 |squareFreePart| 122 |squareFree| 127
              |solveLinearPolynomialEquation| 132 |smaller?| 138 |sizeLess?|
              144 |shiftRight| 150 |shiftLeft| 156 |separate| 162 |sample| 168
              |rightRecip| 172 |rightPower| 177 |retractIfCan| 189 |retract|
              209 |resultant| 229 |rem| 242 |reductum| 248 |reducedSystem| 253
              |recip| 275 |quo| 280 |pseudoRemainder| 286 |pseudoQuotient| 292
              |pseudoDivide| 298 |principalIdeal| 304 |primitivePart| 309
              |primitiveMonomials| 320 |prime?| 325 |pomopo!| 330
              |plenaryPower| 338 |patternMatch| 344 |order| 358 |opposite?| 364
              |one?| 370 |numberOfMonomials| 375 |nextItem| 380 |multivariate|
              385 |multiplyExponents| 397 |multiEuclidean| 403 |monomials| 409
              |monomial?| 414 |monomial| 419 |monicDivide| 439 |minimumDegree|
              452 |mapExponents| 469 |map| 475 |makeSUP| 481 |mainVariable| 486
              |listOfTerms| 491 |linearExtend| 496 |leftRecip| 502 |leftPower|
              507 |leadingTerm| 519 |leadingSupport| 524 |leadingMonomial| 529
              |leadingCoefficient| 534 |lcmCoef| 539 |lcm| 545 |latex| 556
              |karatsubaDivide| 561 |isTimes| 567 |isPlus| 572 |isExpt| 577
              |integrate| 582 |init| 587 |hashUpdate!| 591 |hash| 597 |ground?|
              602 |ground| 607 |gcdPolynomial| 612 |gcd| 618 |fmecg| 629
              |factorSquareFreePolynomial| 637 |factorPolynomial| 642 |factor|
              647 |extendedEuclidean| 652 |exquo| 665 |expressIdealMember| 677
              |eval| 683 |euclideanSize| 737 |elt| 742 |divideExponents| 772
              |divide| 778 |discriminant| 784 |differentiate| 795 |degree| 878
              |convert| 895 |content| 910 |constructOrdered| 921 |construct|
              926 |conditionP| 931 |composite| 936 |commutator| 948 |coerce|
              954 |coefficients| 989 |coefficient| 994 |charthRoot| 1014
              |characteristic| 1019 |binomThmExpt| 1023 |associator| 1030
              |associates?| 1037 |antiCommutator| 1043 |annihilate?| 1049 ^
              1055 |Zero| 1067 |One| 1071 D 1075 = 1151 / 1157 - 1163 + 1174 *
              1180)
           'NIL
           (CONS
            (|makeByteWordVec2| 47
                                '(0 0 14 10 0 14 10 0 18 0 22 4 17 21 4 25 19
                                  23 4 21 3 2 1 26 26 23 13 21 1 0 23 4 5 1 0 0
                                  41 4 4 1 0 0 0 26 41 1 1 0 0 0 0 0 15 13 13
                                  47 13 46 0 0 24 33 31 9 0 0 0 23 13 13 12 7 6
                                  0 0 27 20 16 23 14 13 13 11 37 35 8 7 6 4 0 0
                                  0 0 0 0 0 0))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| NIL |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL |DifferentialExtension&| NIL NIL |DifferentialRing&|
                |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |PartialDifferentialRing&| |Algebra&| NIL NIL |Algebra&| NIL
                |Rng&| |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Module&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| NIL |NonAssociativeSemiRng&|
                NIL NIL NIL NIL |AbelianSemiGroup&| |Magma&|
                |FullyRetractableTo&| NIL |RetractableTo&| |Evalable&|
                |Hashable&| |RetractableTo&| |RetractableTo&| |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL NIL NIL |InnerEvalable&| NIL
                NIL NIL NIL NIL NIL NIL NIL |BasicType&| NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 7)
                 (|PolynomialCategory| 7 16 31) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 7 16 31)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 7 16) (|GcdDomain|)
                 (|AbelianMonoidRing| 7 16) (|IntegralDomain|)
                 (|DifferentialExtension| 7) (|LeftOreRing|)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 9) (|EntireRing|) (|Algebra| $$)
                 (|PartialDifferentialRing| 31) (|Algebra| 7)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 53) (|Ring|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRing|) (|NonAssociativeAlgebra| 7)
                 (|NonAssociativeAlgebra| 53) (|FreeModuleCategory| 7 16)
                 (|Module| $$) (|FullyLinearlyExplicitOver| 7) (|Module| 7)
                 (|Module| 53) (|IndexedDirectProductCategory| 7 16)
                 (|SemiRng|) (|LinearlyExplicitOver| 45)
                 (|LinearlyExplicitOver| 7) (|NonAssociativeRing|)
                 (|BiModule| 53 53) (|BiModule| $$ $$) (|BiModule| 7 7)
                 (|IndexedProductCategory| 7 16) (|NonAssociativeRng|)
                 (|RightModule| 45) (|RightModule| 53) (|LeftModule| 53)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 7)
                 (|LeftModule| 7) (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|StepThrough|) (|PatternMatchable| 45)
                 (|PatternMatchable| (|Float|)) (|Comparable|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 7)
                 (|CommutativeStar|) (|RetractableTo| 31) (|Evalable| $$)
                 (|Hashable|) (|RetractableTo| 45) (|RetractableTo| 53)
                 (|SetCategory|) (|RetractableTo| 7) (|Canonical|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|additiveValuation|) (|CoercibleFrom| 31)
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 40)
                 (|ConvertibleTo| 42) (|ConvertibleTo| 41)
                 (|canonicalUnitNormal|) (|CoercibleFrom| 45)
                 (|CoercibleFrom| 53) (|unitsKnown|) (|CoercibleTo| 10)
                 (|BasicType|) (|CoercibleFrom| 7) (|InnerEvalable| 31 7)
                 (|InnerEvalable| 31 $$) (|VariablesCommuteWithCoefficients|)
                 (|Eltable| 7 7) (|Eltable| $$ $$))
              (|makeByteWordVec2| 76
                                  '(1 10 0 9 11 2 8 10 0 10 12 0 0 0 14 0 7 0
                                    15 2 0 0 7 16 17 2 0 20 0 0 1 1 57 20 0 1 2
                                    0 36 0 16 1 1 0 32 0 1 1 0 0 36 1 1 0 0 5 1
                                    1 0 5 0 1 2 0 34 0 31 1 1 51 52 0 1 1 51 0
                                    0 1 1 51 20 0 1 2 0 16 0 32 1 1 0 16 0 1 2
                                    0 16 0 32 1 1 0 26 0 1 2 58 37 0 0 1 2 20 0
                                    0 0 1 1 10 66 34 1 1 17 0 0 1 1 17 61 0 1 2
                                    10 67 68 34 1 2 9 20 0 0 1 2 14 20 0 0 1 2
                                    4 0 0 16 1 2 0 0 0 16 1 2 17 62 0 0 1 0 57
                                    0 1 1 55 37 0 1 2 0 0 0 22 1 2 55 0 0 16 1
                                    1 0 29 0 1 1 6 69 0 1 1 7 70 0 1 1 13 33 0
                                    1 1 0 7 0 1 1 6 53 0 1 1 7 45 0 1 1 13 31 0
                                    1 3 5 0 0 0 31 1 2 5 7 0 0 1 2 14 0 0 0 1 1
                                    28 0 0 1 1 40 46 39 1 2 40 47 39 48 1 2 4
                                    71 39 48 1 1 4 72 39 1 1 55 37 0 1 2 14 0 0
                                    0 1 2 4 0 0 0 1 2 20 0 0 0 1 2 20 65 0 0 1
                                    1 14 60 27 1 1 17 0 0 1 2 17 0 0 31 1 1 13
                                    27 0 1 1 10 20 0 1 4 0 0 0 7 16 0 1 2 52 0
                                    0 22 1 3 30 50 0 41 50 1 3 32 51 0 42 51 1
                                    2 20 16 0 0 1 2 57 20 0 0 1 1 55 20 0 1 1 0
                                    16 0 1 1 24 37 0 1 2 0 0 5 31 1 2 0 0 34 31
                                    1 2 0 0 0 16 1 2 14 35 27 0 1 1 0 27 0 1 1
                                    0 20 0 1 2 0 0 7 16 17 3 0 0 0 32 26 1 3 0
                                    0 0 31 16 1 3 4 59 0 0 31 1 2 4 59 0 0 1 1
                                    0 16 0 1 2 0 16 0 31 1 2 0 26 0 32 1 2 0 0
                                    30 0 1 2 0 0 25 0 1 1 0 5 0 1 1 0 33 0 1 1
                                    0 24 0 1 2 5 7 54 0 1 1 55 37 0 1 2 0 0 0
                                    22 1 2 55 0 0 16 1 1 28 23 0 1 1 28 16 0 1
                                    1 28 0 0 1 1 28 7 0 1 2 17 63 0 0 1 1 17 0
                                    27 1 2 17 0 0 0 1 1 0 21 0 1 2 4 59 0 16 1
                                    1 13 35 0 1 1 0 35 0 1 1 13 74 0 1 1 1 0 0
                                    1 0 24 0 1 2 12 44 44 0 1 1 12 43 0 1 1 0
                                    20 0 1 1 0 7 0 1 2 17 34 34 34 1 2 17 0 0 0
                                    1 1 17 0 27 1 4 4 0 0 16 7 0 1 1 10 66 34 1
                                    1 10 66 34 1 1 10 61 0 1 3 14 57 0 0 0 1 2
                                    14 58 0 0 1 2 51 37 0 0 1 2 16 37 0 7 1 2
                                    14 35 27 0 1 3 0 0 0 31 7 1 3 0 0 0 31 0 1
                                    3 0 0 0 32 28 1 3 0 0 0 32 27 1 2 13 0 0 75
                                    1 2 13 0 0 76 1 3 13 0 0 27 27 1 3 13 0 0 0
                                    0 1 1 14 16 0 1 2 0 0 0 0 1 2 0 7 0 7 1 2
                                    14 7 55 7 1 2 20 55 55 55 1 2 20 55 0 55 1
                                    2 0 37 0 16 1 2 14 59 0 0 1 2 5 0 0 31 1 1
                                    5 7 0 1 2 38 0 0 49 1 2 38 0 0 9 1 3 38 0 0
                                    49 26 1 3 38 0 0 9 16 1 3 4 0 0 32 26 1 2 4
                                    0 0 32 1 3 4 0 0 31 16 1 2 4 0 0 31 1 3 4 0
                                    0 25 0 1 2 4 0 0 25 1 3 4 0 0 25 16 1 2 4 0
                                    0 16 1 1 4 0 0 1 1 0 16 0 1 2 0 16 0 31 1 2
                                    0 26 0 32 1 1 11 40 0 1 1 34 41 0 1 1 36 42
                                    0 1 1 17 7 0 1 2 17 0 0 31 1 1 28 0 24 1 1
                                    0 0 24 1 1 49 38 39 1 2 20 37 0 0 1 2 20 64
                                    55 0 1 2 56 0 0 0 1 1 0 10 0 13 1 0 0 7 1 1
                                    0 0 18 19 1 53 0 0 1 1 54 0 45 1 1 29 0 53
                                    1 1 13 0 31 1 1 0 28 0 1 2 0 7 0 16 1 3 0 0
                                    0 31 16 1 3 0 0 0 32 26 1 1 50 37 0 1 0 56
                                    16 1 3 48 0 0 0 16 1 3 56 0 0 0 0 1 2 51 20
                                    0 0 1 2 0 0 0 0 1 2 56 20 0 0 1 2 0 0 0 22
                                    1 2 55 0 0 16 1 0 57 0 1 0 55 0 14 2 38 0 0
                                    49 1 2 38 0 0 9 1 3 38 0 0 9 16 1 3 38 0 0
                                    49 26 1 3 4 0 0 32 26 1 2 4 0 0 32 1 3 4 0
                                    0 31 16 1 2 4 0 0 31 1 3 4 0 0 25 16 1 2 4
                                    0 0 25 1 2 4 0 0 16 1 1 4 0 0 1 2 0 20 0 0
                                    1 2 14 0 0 7 1 1 59 0 0 1 2 59 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 22 0 1 2 0 0 0 0 1 2 0 0 7 0
                                    1 2 0 0 0 7 1 2 40 0 0 45 1 2 59 0 45 0 1 2
                                    57 0 16 0 1 2 1 0 0 53 1 2 1 0 53 0 1)))))
           '|lookupComplete|)) 
