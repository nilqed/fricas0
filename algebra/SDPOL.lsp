
(DECLAIM (NOTINLINE |SequentialDifferentialPolynomial;|)) 

(DEFUN |SequentialDifferentialPolynomial;| (|#1|)
  (SPROG
   ((#1=#:G54 NIL) (|pv$| NIL) (#2=#:G47 NIL) (#3=#:G48 NIL) (#4=#:G49 NIL)
    (#5=#:G50 NIL) (#6=#:G51 NIL) (#7=#:G52 NIL) (#8=#:G53 NIL) (% NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|SequentialDifferentialPolynomial| DV$1))
    (LETT % (GETREFV 65))
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
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #8#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
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
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory|
                                              (|SequentialDifferentialVariable|
                                               (|Symbol|))
                                              '(|Hashable|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory|
                                         (|IndexedExponents|
                                          (|SequentialDifferentialVariable|
                                           (|Symbol|)))
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
                                        (LETT #7#
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
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|)))
                                         #7#)
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #8# #6#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #8# #6#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
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
                                                         '(|CommutativeRing|))
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
                                                         '(|CommutativeRing|))
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
                                                         '(|CommutativeRing|))
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
                                                         '(|CommutativeRing|))
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
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|SequentialDifferentialPolynomial|
                (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 137438953472))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 274877906944))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 549755813888))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1099511627776))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #8# (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2199023255552))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #8# (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4398046511104))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |SequentialDifferentialPolynomial| (#1=#:G55)
  (SPROG NIL
         (PROG (#2=#:G56)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SequentialDifferentialPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SequentialDifferentialPolynomial;| #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SequentialDifferentialPolynomial|)))))))))) 

(MAKEPROP '|SequentialDifferentialPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|DifferentialSparseMultivariatePolynomial| 6 30 21)
              (|local| |#1|) (|Boolean|) (|String|) (|OutputForm|)
              (|PositiveInteger|) (|Record| (|:| |k| 13) (|:| |c| 6))
              (|List| 11) (|IndexedExponents| 21) (|Mapping| 6 6) (|List| %)
              (|List| 13) (|List| 6) (|NonNegativeInteger|)
              (|Union| 6 '#1="failed") (|Mapping| 13 13)
              (|SequentialDifferentialVariable| 30) (|List| 18) (|List| 21)
              (|Union| 21 '"failed") (|SparseUnivariatePolynomial| 6)
              (|SparseUnivariatePolynomial| %) (|Union| 15 '#2="failed")
              (|Integer|) (|Union| % '"failed") (|Symbol|) (|Union| 30 '#1#)
              (|Mapping| % 18) (|List| 30) (|Union| 35 '#1#)
              (|SparseMultivariatePolynomial| 6 30) (|Union| 45 '#3="failed")
              (|Matrix| %) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 28)
              (|HashState|) (|SingleInteger|) (|Matrix| 28)
              (|Record| (|:| |mat| 43) (|:| |vec| (|Vector| 28))) (|Vector| %)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 28 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 28) (|Mapping| 6 13) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 54 '#3#) (|List| 26) (|Factored| 26) (|Union| 49 '#1#)
              (|Union| 28 '#1#) (|Matrix| 6)
              (|Record| (|:| |mat| 58) (|:| |vec| (|Vector| 6)))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |var| 21) (|:| |exponent| 18)) (|Union| 61 '#2#)
              (|List| 64) (|Equation| %))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 37
                                '(0 0 10 0 10 0 14 0 28 12 27 0 19 20 9 15 29
                                  13 3 2 1 0 29 13 1 0 0 0 29 9 4 1 0 0 25 9 1
                                  0 0 0 0 25 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33
                                  31 8 0 0 0 18 18 17 29 6 5 0 0 0 0 19 19 18
                                  18 16 37 35 11 29 7 6 5 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|DifferentialPolynomialCategory&| |PolynomialCategory&|
                |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL NIL NIL |DifferentialExtension&| |DifferentialRing&|
                |PartialDifferentialRing&| |PartialDifferentialRing&|
                |EntireRing&| |Algebra&| |Algebra&| NIL NIL |Algebra&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Rng&| NIL
                |Module&| |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL
                NIL NIL NIL NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL
                NIL NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL
                NIL NIL |NonAssociativeSemiRng&| |AbelianMonoid&|
                |MagmaWithUnit&| NIL NIL NIL NIL |AbelianSemiGroup&|
                |FullyRetractableTo&| |Magma&| |Evalable&| |RetractableTo&|
                |Hashable&| NIL |RetractableTo&| |RetractableTo&|
                |SetCategory&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |BasicType&| NIL |InnerEvalable&| |InnerEvalable&| NIL NIL NIL
                NIL)
             (CONS
              '#((|DifferentialPolynomialCategory| 6 30 21 13)
                 (|PolynomialCategory| 6 13 21)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 13 21)
                 (|UniqueFactorizationDomain|) (|FiniteAbelianMonoidRing| 6 13)
                 (|GcdDomain|) (|AbelianMonoidRing| 6 13) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|)
                 (|DifferentialExtension| 6) (|DifferentialRing|)
                 (|PartialDifferentialRing| 30) (|PartialDifferentialRing| 21)
                 (|EntireRing|) (|Algebra| $$) (|Algebra| 6)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 49) (|Ring|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 6) (|NonAssociativeAlgebra| 49)
                 (|FreeModuleCategory| 6 13) (|Rng|) (|SemiRing|) (|Module| $$)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 49)
                 (|IndexedDirectProductCategory| 6 13) (|SemiRng|)
                 (|LinearlyExplicitOver| 28) (|LinearlyExplicitOver| 6)
                 (|BiModule| 49 49) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 13) (|NonAssociativeRing|)
                 (|RightModule| 28) (|RightModule| 49) (|LeftModule| 49)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianProductCategory| 6)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|PatternMatchable| 28)
                 (|PatternMatchable| (|Float|)) (|Comparable|)
                 (|AbelianSemiGroup|) (|FullyRetractableTo| 6) (|Magma|)
                 (|Evalable| $$) (|RetractableTo| 21) (|Hashable|)
                 (|CommutativeStar|) (|RetractableTo| 28) (|RetractableTo| 49)
                 (|SetCategory|) (|RetractableTo| 6) (|RetractableTo| 30)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 30))
                 (|InnerEvalable| 30 6) (|InnerEvalable| 30 $$)
                 (|InnerEvalable| $$ $$) (|CoercibleFrom| 21)
                 (|ConvertibleTo| 38) (|ConvertibleTo| 40) (|ConvertibleTo| 39)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|canonicalUnitNormal|)
                 (|CoercibleFrom| 28) (|CoercibleFrom| 49) (|CoercibleTo| 9)
                 (|BasicType|) (|CoercibleFrom| 6) (|InnerEvalable| 21 6)
                 (|InnerEvalable| 21 $$) (|VariablesCommuteWithCoefficients|)
                 (|unitsKnown|) (|CoercibleFrom| 30)
                 (|CoercibleFrom| (|SparseMultivariatePolynomial| 6 30)))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
