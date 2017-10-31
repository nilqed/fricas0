
(SDEFUN |UP;coerce;$Of;1| ((|p| $) ($ |OutputForm|))
        (SPADCALL |p| (SPADCALL (QREFELT $ 6) (QREFELT $ 11)) (QREFELT $ 12))) 

(SDEFUN |UP;coerce;V$;2| ((|v| |Variable| |x|) ($ $))
        (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 17))) 

(DECLAIM (NOTINLINE |UnivariatePolynomial;|)) 

(DEFUN |UnivariatePolynomial| (&REST #1=#:G772)
  (SPROG NIL
         (PROG (#2=#:G773)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePolynomial|)
                                               '|domainEqualList|)
                    . #3=(|UnivariatePolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |UnivariatePolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UnivariatePolynomial|)))))))))) 

(DEFUN |UnivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G771 NIL) (|pv$| NIL) (#2=#:G761 NIL) (#3=#:G762 NIL) (#4=#:G763 NIL)
    (#5=#:G764 NIL) (#6=#:G765 NIL) (#7=#:G766 NIL) (#8=#:G767 NIL)
    (#9=#:G768 NIL) (#10=#:G769 NIL) (#11=#:G770 NIL) ($ NIL) (|dv$| NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #12=(|UnivariatePolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #12#)
    (LETT |dv$| (LIST '|UnivariatePolynomial| DV$1 DV$2) . #12#)
    (LETT $ (GETREFV 74) . #12#)
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
                                        (|HasCategory| |#2| '(|EntireRing|))
                                        (LETT #11#
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|))
                                              . #12#)
                                        (OR (|HasCategory| |#2| '(|Field|))
                                            #11#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #11#)
                                        (LETT #10#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              . #12#)
                                        (OR (|HasCategory| |#2| '(|Field|))
                                            #11# #10#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #11# #10#)
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
                                        (LETT #9#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Float|))))
                                              . #12#)
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
                                          #11#
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
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         #9#)
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Integer|))))
                                              . #12#)
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
                                          #11#
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
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|)))))
                                              . #12#)
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
                                          #11#
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
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|)))))
                                              . #12#)
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
                                          #11#
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
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #6#)
                                        (LETT #5#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              . #12#)
                                        (OR #5# (|HasCategory| |#2| '(|Field|))
                                            #11# #10#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #5#
                                            (|HasCategory| |#2|
                                                           '(|EntireRing|)))
                                        (OR #5# #11# #10#)
                                        (OR #5#
                                            (|HasCategory| |#2|
                                                           '(|EntireRing|))
                                            #11# #10#
                                            (|HasCategory| |#2| '(|Ring|)))
                                        (OR #5#
                                            (|HasCategory| |#2|
                                                           '(|EntireRing|))
                                            #11# #10#)
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
                                         #5#
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              . #12#)
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
                                         #4#
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|))
                                              . #12#)
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
                                         #4# #3#
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|))
                                              . #12#)
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
                                         #4# #2# #3#
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))))
                    . #12#))
    (|haddProp| |$ConstructorCache| '|UnivariatePolynomial| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 70368744177664))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #12#)
     (|augmentPredVector| $ 140737488355328))
    (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR #11#
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR #4# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 18014398509481984))
    (AND
     (OR #3# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 36028797018963968))
    (AND
     (OR #2# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 72057594037927936))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|SparseUnivariatePolynomial| |#2|))
    $))) 

(MAKEPROP '|UnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (|Symbol|) (|OutputForm|)
              (0 . |outputForm|) (5 . |outputForm|) |UP;coerce;$Of;1|
              (11 . |One|) (15 . |One|) (|NonNegativeInteger|)
              (19 . |monomial|) (|Variable| 6) |UP;coerce;V$;2|
              (|Union| 26 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 33)
              (|Record| (|:| |mat| 27) (|:| |vec| (|Vector| 33))) (|Vector| $)
              (|Matrix| 33) (|List| 9) (|List| 16)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 33 $)
              (|Union| $ '#1#) (|Integer|) (|Boolean|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 33) (|SingletonAsOrderedSet|)
              (|Record| (|:| |coef| 39) (|:| |generator| $)) (|List| $)
              (|Union| 39 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 42 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
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
              (|Equation| $) (|List| 62)
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
              |retractIfCan| 167 |retract| 187 |resultant| 207 |rem| 220
              |reductum| 226 |reducedSystem| 231 |recip| 253 |quo| 258
              |pseudoRemainder| 264 |pseudoQuotient| 270 |pseudoDivide| 276
              |principalIdeal| 282 |primitivePart| 287 |primitiveMonomials| 298
              |prime?| 303 |pomopo!| 308 |patternMatch| 316 |order| 330
              |opposite?| 336 |one?| 342 |numberOfMonomials| 347 |nextItem| 352
              |multivariate| 357 |multiplyExponents| 369 |multiEuclidean| 375
              |monomials| 381 |monomial?| 386 |monomial| 391 |monicDivide| 411
              |minimumDegree| 424 |mapExponents| 441 |map| 447 |makeSUP| 453
              |mainVariable| 458 |leadingMonomial| 463 |leadingCoefficient| 468
              |lcmCoef| 473 |lcm| 479 |latex| 490 |karatsubaDivide| 495
              |isTimes| 501 |isPlus| 506 |isExpt| 511 |integrate| 516 |init|
              521 |hashUpdate!| 525 |hash| 531 |ground?| 536 |ground| 541
              |gcdPolynomial| 546 |gcd| 552 |fmecg| 563
              |factorSquareFreePolynomial| 571 |factorPolynomial| 576 |factor|
              581 |extendedEuclidean| 586 |exquo| 599 |expressIdealMember| 611
              |eval| 617 |euclideanSize| 671 |elt| 676 |divideExponents| 706
              |divide| 712 |discriminant| 718 |differentiate| 729 |degree| 812
              |convert| 829 |content| 844 |conditionP| 855 |composite| 860
              |coerce| 872 |coefficients| 907 |coefficient| 912 |charthRoot|
              932 |characteristic| 937 |binomThmExpt| 941 |associates?| 948
              |annihilate?| 954 ^ 960 |Zero| 972 |One| 976 D 980 = 1056 / 1062
              - 1068 + 1079 * 1085)
           'NIL
           (CONS
            (|makeByteWordVec2| 46
                                '(0 0 0 10 13 0 10 13 0 16 19 1 34 4 20 15 4 1
                                  2 3 34 4 9 4 34 20 17 22 4 0 1 38 39 0 0 1 1
                                  35 37 39 42 12 44 0 12 46 0 0 8 26 28 21 0 0
                                  12 0 0 0 0 0 0 0 0 4 5 6 7 30 32 11 12 12 13
                                  36 14 18))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL |Algebra&| |Algebra&|
                |FullyLinearlyExplicitOver&| |Algebra&| NIL
                |DifferentialExtension&| |Module&| NIL NIL |Module&| NIL NIL
                |PartialDifferentialRing&| NIL |Module&| |EntireRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| |AbelianGroup&| NIL NIL
                NIL |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                NIL NIL NIL NIL |FullyRetractableTo&| |SetCategory&|
                |Evalable&| NIL NIL NIL |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| |BasicType&| NIL NIL |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |RetractableTo&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 7)
                 (|PolynomialCategory| 7 16 37)
                 (|MaybeSkewPolynomialCategory| 7 16 37)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 7 16) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 7 16)
                 (|GcdDomain|) (|IntegralDomain|) (|Algebra| 36) (|Algebra| 7)
                 (|FullyLinearlyExplicitOver| 7) (|Algebra| $$) (|LeftOreRing|)
                 (|DifferentialExtension| 7) (|Module| 36)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 7)
                 (|LinearlyExplicitOver| 7) (|LinearlyExplicitOver| 33)
                 (|PartialDifferentialRing| 37) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|PartialDifferentialRing| 9)
                 (|DifferentialRing|) (|BiModule| 7 7) (|BiModule| 36 36)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 7) (|RightModule| 7)
                 (|LeftModule| 36) (|RightModule| 36) (|RightModule| $$)
                 (|LeftModule| $$) (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 33) (|StepThrough|)
                 (|FullyRetractableTo| 7) (|SetCategory|) (|Evalable| $$)
                 (|Eltable| $$ $$) (|Eltable| 7 7)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 37 $$)
                 (|InnerEvalable| 37 7) (|RetractableTo| 7) (|BasicType|)
                 (|CoercibleTo| 10) (|unitsKnown|) (|RetractableTo| 36)
                 (|RetractableTo| 33) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 23) (|ConvertibleTo| 24) (|ConvertibleTo| 22)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 37)
                 (|additiveValuation|) (|CommutativeStar|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 73
                                  '(1 10 0 9 11 2 8 10 0 10 12 0 0 0 14 0 7 0
                                    15 2 0 0 7 16 17 2 0 34 0 0 1 1 57 34 0 1 2
                                    0 66 0 16 1 1 0 58 0 1 1 0 0 66 1 1 0 0 5 1
                                    1 0 5 0 1 2 0 47 0 37 1 1 50 35 0 1 1 50 0
                                    0 1 1 50 34 0 1 2 0 16 0 58 1 2 0 16 0 58 1
                                    1 0 16 0 1 2 56 32 0 0 1 2 18 0 0 0 1 1 10
                                    52 47 1 1 15 0 0 1 1 15 49 0 1 2 10 53 54
                                    47 1 2 8 34 0 0 1 2 13 34 0 0 1 2 4 0 0 16
                                    1 2 0 0 0 16 1 2 15 48 0 0 1 0 57 0 1 1 5
                                    55 0 1 1 6 56 0 1 1 12 61 0 1 1 0 69 0 1 1
                                    5 36 0 1 1 6 33 0 1 1 12 37 0 1 1 0 7 0 1 2
                                    33 7 0 0 1 3 33 0 0 0 37 1 2 13 0 0 0 1 1 0
                                    0 0 1 2 24 25 21 26 1 1 24 27 21 1 1 4 59
                                    21 1 2 4 60 21 26 1 1 53 32 0 1 2 13 0 0 0
                                    1 2 4 0 0 0 1 2 18 0 0 0 1 2 18 50 0 0 1 1
                                    13 38 39 1 2 15 0 0 37 1 1 15 0 0 1 1 12 39
                                    0 1 1 10 34 0 1 4 0 0 0 7 16 0 1 3 25 30 0
                                    23 30 1 3 27 31 0 24 31 1 2 18 16 0 0 1 2
                                    57 34 0 0 1 1 53 34 0 1 1 0 16 0 1 1 21 32
                                    0 1 2 0 0 5 37 1 2 0 0 47 37 1 2 0 0 0 16 1
                                    2 13 40 39 0 1 1 0 39 0 1 1 0 34 0 1 3 0 0
                                    0 37 16 1 3 0 0 0 58 29 1 2 0 0 7 16 17 2 4
                                    41 0 0 1 3 4 41 0 0 37 1 2 0 16 0 37 1 2 0
                                    29 0 58 1 1 0 16 0 1 2 0 0 68 0 1 2 0 0 57
                                    0 1 1 0 5 0 1 1 0 61 0 1 1 0 0 0 1 1 0 7 0
                                    1 2 15 46 0 0 1 2 15 0 0 0 1 1 15 0 39 1 1
                                    0 72 0 1 2 4 41 0 16 1 1 12 40 0 1 1 0 40 0
                                    1 1 12 65 0 1 1 1 0 0 1 0 21 0 1 2 0 71 71
                                    0 1 1 0 73 0 1 1 0 34 0 1 1 0 7 0 1 2 15 47
                                    47 47 1 1 15 0 39 1 2 15 0 0 0 1 4 4 0 0 16
                                    7 0 1 1 10 52 47 1 1 10 52 47 1 1 10 49 0 1
                                    3 13 43 0 0 0 1 2 13 44 0 0 1 2 50 32 0 0 1
                                    2 14 32 0 7 1 2 13 40 39 0 1 3 12 0 0 39 39
                                    1 2 12 0 0 62 1 3 12 0 0 0 0 1 2 12 0 0 63
                                    1 3 0 0 0 58 39 1 3 0 0 0 37 0 1 3 0 0 0 37
                                    7 1 3 0 0 0 58 67 1 1 13 16 0 1 2 13 7 45 7
                                    1 2 18 45 0 45 1 2 18 45 45 45 1 2 0 7 0 7
                                    1 2 0 0 0 0 1 2 0 32 0 16 1 2 13 41 0 0 1 1
                                    33 7 0 1 2 33 0 0 37 1 3 40 0 0 28 29 1 3
                                    40 0 0 9 16 1 2 40 0 0 9 1 2 40 0 0 28 1 1
                                    4 0 0 1 2 4 0 0 16 1 2 4 0 0 57 1 3 4 0 0
                                    57 16 1 3 4 0 0 57 0 1 2 4 0 0 58 1 2 4 0 0
                                    37 1 3 4 0 0 37 16 1 3 4 0 0 58 29 1 2 0 16
                                    0 37 1 2 0 29 0 58 1 1 0 16 0 1 1 11 22 0 1
                                    1 29 23 0 1 1 31 24 0 1 2 15 0 0 37 1 1 15
                                    7 0 1 1 48 20 21 1 2 18 51 45 0 1 2 18 32 0
                                    0 1 1 52 0 33 1 1 51 0 0 1 1 23 0 36 1 1 12
                                    0 37 1 1 0 0 18 19 1 0 0 7 1 1 0 10 0 13 1
                                    0 67 0 1 3 0 0 0 58 29 1 3 0 0 0 37 16 1 2
                                    0 7 0 16 1 1 49 32 0 1 0 54 16 1 3 47 0 0 0
                                    16 1 2 50 34 0 0 1 2 54 34 0 0 1 2 53 0 0
                                    16 1 2 0 0 0 70 1 0 57 0 1 0 53 0 14 3 40 0
                                    0 9 16 1 3 40 0 0 28 29 1 2 40 0 0 28 1 2
                                    40 0 0 9 1 1 4 0 0 1 2 4 0 0 16 1 2 4 0 0
                                    57 1 3 4 0 0 57 16 1 2 4 0 0 37 1 2 4 0 0
                                    58 1 3 4 0 0 58 29 1 3 4 0 0 37 16 1 2 0 34
                                    0 0 1 2 13 0 0 7 1 2 55 0 0 0 1 1 55 0 0 1
                                    2 0 0 0 0 1 2 55 0 33 0 1 2 57 0 16 0 1 2 1
                                    0 0 36 1 2 1 0 36 0 1 2 0 0 0 7 1 2 0 0 7 0
                                    1 2 0 0 0 0 1 2 0 0 70 0 1)))))
           '|lookupComplete|)) 
