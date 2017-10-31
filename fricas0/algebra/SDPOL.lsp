
(DECLAIM (NOTINLINE |SequentialDifferentialPolynomial;|)) 

(DEFUN |SequentialDifferentialPolynomial| (#1=#:G767)
  (SPROG NIL
         (PROG (#2=#:G768)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SequentialDifferentialPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|SequentialDifferentialPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SequentialDifferentialPolynomial;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SequentialDifferentialPolynomial|)))))))))) 

(DEFUN |SequentialDifferentialPolynomial;| (|#1|)
  (SPROG
   ((#1=#:G766 NIL) (|pv$| NIL) (#2=#:G759 NIL) (#3=#:G760 NIL) (#4=#:G761 NIL)
    (#5=#:G762 NIL) (#6=#:G763 NIL) (#7=#:G764 NIL) (#8=#:G765 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #9=(|SequentialDifferentialPolynomial|))
    (LETT |dv$| (LIST '|SequentialDifferentialPolynomial| DV$1) . #9#)
    (LETT $ (GETREFV 61) . #9#)
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
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #9#)
                                        (OR #8#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #8#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SequentialDifferentialVariable|
                                           (|Symbol|))
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
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
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #9#)
                                        (OR #7# #8#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #9#)
                                        (OR #7# #8# #6#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #8# #6#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #7# #8# #6#) (OR #8# #6#)
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #8# #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SequentialDifferentialVariable|
                                                 (|Symbol|))
                                                '(|PatternMatchable|
                                                  (|Float|))))
                                              . #9#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #8#
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         #5#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SequentialDifferentialVariable|
                                                 (|Symbol|))
                                                '(|PatternMatchable|
                                                  (|Integer|))))
                                              . #9#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #8#
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         #4#)
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SequentialDifferentialVariable|
                                                 (|Symbol|))
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|)))))
                                              . #9#)
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
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #8#
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #3#)
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SequentialDifferentialVariable|
                                                 (|Symbol|))
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|)))))
                                              . #9#)
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
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #8#
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #2#)))
                    . #9#))
    (|haddProp| |$ConstructorCache| '|SequentialDifferentialPolynomial|
                (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 274877906944))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #9#)
     (|augmentPredVector| $ 549755813888))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 1099511627776))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 2199023255552))
    (AND
     (OR #8# (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4398046511104))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|SequentialDifferentialPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|DifferentialSparseMultivariatePolynomial| 6 23 22)
              (|local| |#1|) (|Union| 13 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 36)
              (|Record| (|:| |mat| 14) (|:| |vec| (|Vector| 36))) (|Vector| $)
              (|Matrix| 36) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 36 $) (|Union| $ '#1#) (|Boolean|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 36) (|NonNegativeInteger|)
              (|SequentialDifferentialVariable| 23) (|Symbol|) (|List| 23)
              (|List| 6) (|List| $) (|Mapping| $ 21)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|Factored| $) (|List| 21)
              (|Factored| 29) (|Union| 34 '#1#) (|List| 29)
              (|Union| 20 '#2="failed") (|Integer|) (|Union| 36 '#2#)
              (|List| 22) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |mat| 41) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|IndexedExponents| 22) (|List| 44) (|Equation| $)
              (|Union| 22 '#2#) (|Union| 26 '#3="failed")
              (|Record| (|:| |var| 22) (|:| |exponent| 21)) (|Union| 47 '#3#)
              (|Union| 50 '#2#) (|SparseMultivariatePolynomial| 6 23)
              (|Union| 23 '#2#) (|Mapping| 6 6)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 42 42)
              (|Union| 6 '#2#) (|PositiveInteger|) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 38
                                '(0 0 0 10 0 10 0 13 27 0 1 23 8 29 12 1 2 3 23
                                  8 9 26 29 14 8 18 17 0 0 1 30 0 0 0 0 1 1 24
                                  0 0 0 0 0 0 0 0 7 32 34 0 0 16 0 0 0 0 0 0 0
                                  0 0 4 5 6 28 11 36 38 15 16 16 17 17))
            (CONS
             '#(|DifferentialPolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DifferentialExtension&| |Algebra&| |Algebra&|
                |FullyLinearlyExplicitOver&| |Algebra&| NIL |Module&| NIL NIL
                |Module&| NIL NIL NIL |Module&| |EntireRing&|
                |PartialDifferentialRing&| |PartialDifferentialRing&|
                |DifferentialRing&| |Ring&| NIL NIL NIL NIL |Rng&| NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL |Monoid&| NIL |AbelianMonoid&|
                |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL
                |FullyRetractableTo&| |SetCategory&| |Evalable&|
                |RetractableTo&| |RetractableTo&| NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |BasicType&| NIL
                |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL NIL
                |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&|)
             (CONS
              '#((|DifferentialPolynomialCategory| 6 23 22 42)
                 (|PolynomialCategory| 6 42 22)
                 (|MaybeSkewPolynomialCategory| 6 42 22)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 42) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 42) (|GcdDomain|) (|IntegralDomain|)
                 (|DifferentialExtension| 6) (|Algebra| 20) (|Algebra| 6)
                 (|FullyLinearlyExplicitOver| 6) (|Algebra| $$) (|LeftOreRing|)
                 (|Module| 20) (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|Module| 6) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 36) (|CommutativeRing|) (|Module| $$)
                 (|EntireRing|) (|PartialDifferentialRing| 22)
                 (|PartialDifferentialRing| 23) (|DifferentialRing|) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 20 20) (|BiModule| $$ $$)
                 (|LeftModule| $$) (|Rng|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 20) (|RightModule| 20) (|RightModule| $$)
                 (|AbelianGroup|) (|SemiRing|) (|CancellationAbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|AbelianMonoid|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 36)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Evalable| $$)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 23))
                 (|RetractableTo| 23) (|unitsKnown|)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 22 $$)
                 (|InnerEvalable| 22 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 60) (|RetractableTo| 20) (|RetractableTo| 36)
                 (|canonicalUnitNormal|) (|CommutativeStar|) (|noZeroDivisors|)
                 (|ConvertibleTo| 10) (|ConvertibleTo| 11) (|ConvertibleTo| 9)
                 (|RetractableTo| 22) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 23 $$) (|InnerEvalable| 23 6))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
