
(SDEFUN |UP;coerce;$Of;1| ((|p| $) ($ |OutputForm|))
        (SPADCALL |p| (SPADCALL (QREFELT $ 6) (QREFELT $ 11)) (QREFELT $ 12))) 

(SDEFUN |UP;coerce;V$;2| ((|v| |Variable| |x|) ($ $))
        (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 17))) 

(DECLAIM (NOTINLINE |UnivariatePolynomial;|)) 

(DEFUN |UnivariatePolynomial| (&REST #1=#:G435)
  (SPROG NIL
         (PROG (#2=#:G436)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
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

(DEFUN |UnivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G434 NIL) (|pv$| NIL) (#2=#:G426 NIL) (#3=#:G427 NIL) (#4=#:G428 NIL)
    (#5=#:G429 NIL) (#6=#:G430 NIL) (#7=#:G431 NIL) (#8=#:G432 NIL)
    (#9=#:G433 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|UnivariatePolynomial| DV$1 DV$2))
    (LETT $ (GETREFV 74))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
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
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|Field|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|EntireRing|))
                                        (LETT #9#
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|)))
                                        (OR (|HasCategory| |#2| '(|Field|)) #9#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #9#)
                                        (LETT #8#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                        (OR (|HasCategory| |#2| '(|Field|)) #9#
                                            #8#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
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
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #7#
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
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                          (|HasCategory| |#2| '(|Field|))
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
                                          #8#
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
                                         #7#)
                                        (LETT #6#
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
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                          (|HasCategory| |#2| '(|Field|))
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
                                          #8#
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
                                         #6#)
                                        (LETT #5#
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
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                          #8#
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
                                         #5#)
                                        (LETT #4#
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
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                          #8#
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
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                        (OR #3# (|HasCategory| |#2| '(|Field|))
                                            #9# #8#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #3# #9# #8#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         #3#
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2| '(|Field|)) #9#
                                         #8#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
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
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 2199023255552))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|))))
     (|augmentPredVector| $ 4398046511104))
    (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 8796093022208))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 17592186044416))
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #9#
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 35184372088832))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 70368744177664))
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianMonoid|))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR #2# (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 2251799813685248))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|SparseUnivariatePolynomial| |#2|))
    $))) 

(MAKEPROP '|UnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (|Symbol|) (|OutputForm|)
              (0 . |outputForm|) (5 . |outputForm|) |UP;coerce;$Of;1|
              (11 . |One|) (15 . |One|) (|NonNegativeInteger|)
              (19 . |monomial|) (|Variable| (NRTEVAL (QREFELT $ 6)))
              |UP;coerce;V$;2| (|Union| 26 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 33)
              (|Record| (|:| |mat| 27) (|:| |vec| (|Vector| 33))) (|Vector| $)
              (|Matrix| 33) (|List| 9) (|List| 16)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 33 $)
              (|Union| $ '#1#) (|Integer|) (|Boolean|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 33) (|SingletonAsOrderedSet|) (|Union| 39 '"failed")
              (|List| $) (|Record| (|:| |coef| 39) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 43 '"failed")
              (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Factored| $)
              (|Record| (|:| |coef| 7) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 45 '"failed") (|Factored| 47) (|Union| 54 '#1#)
              (|List| 47) (|Union| 36 '#2="failed") (|Union| 33 '#2#)
              (|Mapping| 7 7) (|List| 37) (|Matrix| 7)
              (|Record| (|:| |mat| 59) (|:| |vec| 66)) (|Union| 37 '#2#)
              (|List| 63) (|Equation| $)
              (|Record| (|:| |var| 37) (|:| |exponent| 16))
              (|Union| 64 '"failed") (|Vector| 7) (|List| 7) (|Mapping| 16 16)
              (|Union| 7 '#2#) (|PositiveInteger|) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 25 |zero?| 31 |vectorise| 36 |variables| 42 |unvectorise| 47
              |unmakeSUP| 52 |univariate| 57 |unitNormal| 68 |unitCanonical| 73
              |unit?| 78 |totalDegreeSorted| 83 |totalDegree| 89
              |subtractIfCan| 100 |subResultantGcd| 106 |squareFreePolynomial|
              112 |squareFreePart| 117 |squareFree| 122
              |solveLinearPolynomialEquation| 127 |smaller?| 133 |sizeLess?|
              139 |shiftRight| 145 |shiftLeft| 151 |separate| 157 |sample| 163
              |rightRecip| 167 |rightPower| 172 |retractIfCan| 184 |retract|
              204 |resultant| 224 |rem| 237 |reductum| 243 |reducedSystem| 248
              |recip| 270 |quo| 275 |pseudoRemainder| 281 |pseudoQuotient| 287
              |pseudoDivide| 293 |principalIdeal| 299 |primitivePart| 304
              |primitiveMonomials| 315 |prime?| 320 |pomopo!| 325
              |patternMatch| 333 |order| 347 |opposite?| 353 |one?| 359
              |numberOfMonomials| 364 |nextItem| 369 |multivariate| 374
              |multiplyExponents| 386 |multiEuclidean| 392 |monomials| 398
              |monomial?| 403 |monomial| 408 |monicDivide| 428 |minimumDegree|
              441 |mapExponents| 458 |map| 464 |makeSUP| 470 |mainVariable| 475
              |leftRecip| 480 |leftPower| 485 |leadingMonomial| 497
              |leadingCoefficient| 502 |lcmCoef| 507 |lcm| 513 |latex| 524
              |karatsubaDivide| 529 |isTimes| 535 |isPlus| 540 |isExpt| 545
              |integrate| 550 |init| 555 |hashUpdate!| 559 |hash| 565 |ground?|
              570 |ground| 575 |gcdPolynomial| 580 |gcd| 586 |fmecg| 597
              |factorSquareFreePolynomial| 605 |factorPolynomial| 610 |factor|
              615 |extendedEuclidean| 620 |exquo| 633 |expressIdealMember| 645
              |eval| 651 |euclideanSize| 705 |elt| 710 |divideExponents| 740
              |divide| 746 |discriminant| 752 |differentiate| 763 |degree| 846
              |convert| 863 |content| 878 |conditionP| 889 |composite| 894
              |commutator| 906 |coerce| 912 |coefficients| 947 |coefficient|
              952 |charthRoot| 972 |characteristic| 977 |binomThmExpt| 981
              |associator| 988 |associates?| 995 |antiCommutator| 1001
              |annihilate?| 1007 ^ 1013 |Zero| 1025 |One| 1029 D 1033 = 1109 /
              1115 - 1121 + 1132 * 1138)
           'NIL
           (CONS
            (|makeByteWordVec2| 41
                                '(0 0 0 10 13 0 10 13 0 17 20 4 34 16 4 1 2 3
                                  34 4 9 4 35 18 22 4 36 12 36 0 1 34 35 0 0 1
                                  4 0 0 0 0 1 1 36 14 41 12 12 0 0 40 12 0 0 8
                                  26 28 21 0 0 12 35 0 0 0 0 0 0 0 0 4 5 6 7 30
                                  32 11 12 12 13 35 15 19))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL
                |FullyLinearlyExplicitOver&| NIL NIL |DifferentialExtension&|
                |Algebra&| NIL NIL |Algebra&| NIL NIL
                |PartialDifferentialRing&| |Algebra&| |EntireRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL |Rng&|
                NIL |Module&| |Module&| |Module&| NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |Magma&| |AbelianSemiGroup&| NIL NIL NIL NIL
                |FullyRetractableTo&| |SetCategory&| |Evalable&| NIL NIL NIL
                NIL |InnerEvalable&| |InnerEvalable&| |RetractableTo&|
                |BasicType&| NIL NIL |RetractableTo&| |RetractableTo&| NIL NIL
                NIL NIL |InnerEvalable&| |RetractableTo&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 7)
                 (|PolynomialCategory| 7 16 37)
                 (|MaybeSkewPolynomialCategory| 7 16 37)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 7 16) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 7 16)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitOver| 7) (|CommutativeRing|)
                 (|LeftOreRing|) (|DifferentialExtension| 7) (|Algebra| 36)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 7)
                 (|LinearlyExplicitOver| 7) (|LinearlyExplicitOver| 33)
                 (|PartialDifferentialRing| 37) (|Algebra| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 9) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 36) (|Module| 7)
                 (|Module| $$) (|BiModule| 7 7) (|BiModule| $$ $$)
                 (|BiModule| 36 36) (|NonAssociativeRing|) (|LeftModule| 7)
                 (|RightModule| 7) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 36) (|RightModule| 36) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 33) (|StepThrough|)
                 (|FullyRetractableTo| 7) (|SetCategory|) (|Evalable| $$)
                 (|CommutativeStar|) (|Eltable| $$ $$) (|Eltable| 7 7)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 37 $$)
                 (|InnerEvalable| 37 7) (|RetractableTo| 7) (|BasicType|)
                 (|CoercibleTo| 10) (|unitsKnown|) (|RetractableTo| 36)
                 (|RetractableTo| 33) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 23) (|ConvertibleTo| 24) (|ConvertibleTo| 22)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 37)
                 (|additiveValuation|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 73
                                  '(1 10 0 9 11 2 8 10 0 10 12 0 0 0 14 0 7 0
                                    15 2 0 0 7 16 17 2 0 34 0 0 1 1 50 34 0 1 2
                                    0 66 0 16 1 1 0 58 0 1 1 0 0 66 1 1 0 0 5 1
                                    1 0 5 0 1 2 0 47 0 37 1 1 45 35 0 1 1 45 0
                                    0 1 1 45 34 0 1 2 0 16 0 58 1 2 0 16 0 58 1
                                    1 0 16 0 1 2 51 32 0 0 1 2 19 0 0 0 1 1 10
                                    52 47 1 1 16 0 0 1 1 16 49 0 1 2 10 53 54
                                    47 1 2 8 34 0 0 1 2 13 34 0 0 1 2 4 0 0 16
                                    1 2 0 0 0 16 1 2 16 48 0 0 1 0 50 0 1 1 48
                                    32 0 1 2 48 0 0 16 1 2 0 0 0 70 1 1 5 55 0
                                    1 1 6 56 0 1 1 12 61 0 1 1 0 69 0 1 1 5 36
                                    0 1 1 6 33 0 1 1 12 37 0 1 1 0 7 0 1 2 33 7
                                    0 0 1 3 33 0 0 0 37 1 2 13 0 0 0 1 1 0 0 0
                                    1 2 24 25 21 26 1 1 24 27 21 1 1 4 59 21 1
                                    2 4 60 21 26 1 1 48 32 0 1 2 13 0 0 0 1 2 4
                                    0 0 0 1 2 19 0 0 0 1 2 19 50 0 0 1 1 13 40
                                    39 1 2 16 0 0 37 1 1 16 0 0 1 1 12 39 0 1 1
                                    10 34 0 1 4 0 0 0 7 16 0 1 3 25 30 0 23 30
                                    1 3 27 31 0 24 31 1 2 19 16 0 0 1 2 50 34 0
                                    0 1 1 48 34 0 1 1 0 16 0 1 1 21 32 0 1 2 0
                                    0 5 37 1 2 0 0 47 37 1 2 0 0 0 16 1 2 13 38
                                    39 0 1 1 0 39 0 1 1 0 34 0 1 3 0 0 0 58 29
                                    1 3 0 0 0 37 16 1 2 0 0 7 16 17 2 4 41 0 0
                                    1 3 4 41 0 0 37 1 2 0 16 0 37 1 2 0 29 0 58
                                    1 1 0 16 0 1 2 0 0 68 0 1 2 0 0 57 0 1 1 0
                                    5 0 1 1 0 61 0 1 1 48 32 0 1 2 48 0 0 16 1
                                    2 0 0 0 70 1 1 0 0 0 1 1 0 7 0 1 2 16 46 0
                                    0 1 1 16 0 39 1 2 16 0 0 0 1 1 0 72 0 1 2 4
                                    41 0 16 1 1 12 38 0 1 1 0 38 0 1 1 12 65 0
                                    1 1 1 0 0 1 0 21 0 1 2 0 71 71 0 1 1 0 73 0
                                    1 1 0 34 0 1 1 0 7 0 1 2 16 47 47 47 1 2 16
                                    0 0 0 1 1 16 0 39 1 4 4 0 0 16 7 0 1 1 10
                                    52 47 1 1 10 52 47 1 1 10 49 0 1 2 13 42 0
                                    0 1 3 13 44 0 0 0 1 2 45 32 0 0 1 2 15 32 0
                                    7 1 2 13 38 39 0 1 3 12 0 0 39 39 1 3 12 0
                                    0 0 0 1 2 12 0 0 62 1 2 12 0 0 63 1 3 0 0 0
                                    58 39 1 3 0 0 0 37 0 1 3 0 0 0 37 7 1 3 0 0
                                    0 58 67 1 1 13 16 0 1 2 13 7 45 7 1 2 19 45
                                    0 45 1 2 19 45 45 45 1 2 0 0 0 0 1 2 0 7 0
                                    7 1 2 0 32 0 16 1 2 13 41 0 0 1 1 33 7 0 1
                                    2 33 0 0 37 1 3 37 0 0 9 16 1 3 37 0 0 28
                                    29 1 2 37 0 0 28 1 2 37 0 0 9 1 1 4 0 0 1 2
                                    4 0 0 16 1 2 4 0 0 57 1 3 4 0 0 57 16 1 3 4
                                    0 0 57 0 1 2 4 0 0 58 1 2 4 0 0 37 1 3 4 0
                                    0 58 29 1 3 4 0 0 37 16 1 2 0 29 0 58 1 2 0
                                    16 0 37 1 1 0 16 0 1 1 11 22 0 1 1 29 23 0
                                    1 1 31 24 0 1 2 16 0 0 37 1 1 16 7 0 1 1 43
                                    20 21 1 2 19 32 0 0 1 2 19 51 45 0 1 2 49 0
                                    0 0 1 1 46 0 0 1 1 47 0 33 1 1 23 0 36 1 1
                                    12 0 37 1 1 0 0 18 19 1 0 0 7 1 1 0 10 0 13
                                    1 0 67 0 1 3 0 0 0 37 16 1 3 0 0 0 58 29 1
                                    2 0 7 0 16 1 1 44 32 0 1 0 49 16 1 3 42 0 0
                                    0 16 1 3 49 0 0 0 0 1 2 45 34 0 0 1 2 0 0 0
                                    0 1 2 49 34 0 0 1 2 48 0 0 16 1 2 0 0 0 70
                                    1 0 50 0 1 0 48 0 14 3 37 0 0 28 29 1 2 37
                                    0 0 28 1 3 37 0 0 9 16 1 2 37 0 0 9 1 1 4 0
                                    0 1 2 4 0 0 16 1 3 4 0 0 57 16 1 2 4 0 0 57
                                    1 2 4 0 0 37 1 3 4 0 0 37 16 1 2 4 0 0 58 1
                                    3 4 0 0 58 29 1 2 0 34 0 0 1 2 13 0 0 7 1 2
                                    52 0 0 0 1 1 52 0 0 1 2 0 0 0 0 1 2 52 0 33
                                    0 1 2 50 0 16 0 1 2 1 0 0 36 1 2 1 0 36 0 1
                                    2 0 0 0 7 1 2 0 0 7 0 1 2 0 0 0 0 1 2 0 0
                                    70 0 1)))))
           '|lookupComplete|)) 
