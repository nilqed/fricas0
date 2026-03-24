
(SDEFUN |DSMP;retractIfCan;%U;1|
        ((|p| (%)) (% (|Union| (|SparseMultivariatePolynomial| R S) "failed")))
        (COND
         ((ZEROP (SPADCALL |p| (QREFELT % 10)))
          (CONS 0
                (SPADCALL (CONS #'|DSMP;retractIfCan;%U;1!0| %) (ELT % 14) |p|
                          (QREFELT % 18))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |DSMP;retractIfCan;%U;1!0| ((|x| NIL) (% NIL))
        (SPADCALL (SPADCALL |x| (QREFELT % 11)) (QREFELT % 13))) 

(SDEFUN |DSMP;coerce;Smp%;2|
        ((|p| (|SparseMultivariatePolynomial| R S)) (% (%)))
        (SPADCALL (CONS #'|DSMP;coerce;Smp%;2!0| %) (ELT % 23) |p|
                  (QREFELT % 27))) 

(SDEFUN |DSMP;coerce;Smp%;2!0| ((|x| NIL) (% NIL))
        (SPADCALL (SPADCALL |x| (QREFELT % 21)) (QREFELT % 22))) 

(DECLAIM (NOTINLINE |DifferentialSparseMultivariatePolynomial;|)) 

(DEFUN |DifferentialSparseMultivariatePolynomial;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G63 NIL) (|pv$| NIL) (#2=#:G56 NIL) (#3=#:G57 NIL) (#4=#:G58 NIL)
    (#5=#:G59 NIL) (#6=#:G60 NIL) (#7=#:G61 NIL) (#8=#:G62 NIL) (% NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$|
          (LIST '|DifferentialSparseMultivariatePolynomial| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 84))
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
                                         (|HasCategory| |#3|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory| |#3|
                                                            '(|Hashable|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory|
                                         (|IndexedExponents| |#3|)
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
                                               (|HasCategory| |#3|
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
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #8#
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         #5#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#3|
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
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #8#
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         #4#)
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#3|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))))
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
                                          (|HasCategory| |#3|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#3|
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
                                          (|HasCategory| |#3|
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
                                          (|HasCategory| |#3|
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
                                          (|HasCategory| |#3|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory| |#3|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #8#
                                          (|HasCategory| |#3|
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
                                          (|HasCategory| |#3|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         #3#)
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#3|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))))
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
                                          (|HasCategory| |#3|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#3|
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
                                          (|HasCategory| |#3|
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
                                          (|HasCategory| |#3|
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
                                          (|HasCategory| |#3|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory| |#3|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #8#
                                          (|HasCategory| |#3|
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
                                          (|HasCategory| |#3|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|DifferentialSparseMultivariatePolynomial|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
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

(DEFUN |DifferentialSparseMultivariatePolynomial| (&REST #1=#:G64)
  (SPROG NIL
         (PROG (#2=#:G65)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DifferentialSparseMultivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |DifferentialSparseMultivariatePolynomial;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|DifferentialSparseMultivariatePolynomial|)))))))))) 

(MAKEPROP '|DifferentialSparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              (|NonNegativeInteger|) (0 . |order|) (5 . |retract|)
              (|SparseMultivariatePolynomial| 6 7) (10 . |coerce|)
              (15 . |coerce|) (|Mapping| 12 8) (|Mapping| 12 6)
              (|PolynomialCategoryLifting| 35 8 6 $$ 12) (20 . |map|)
              (|Union| 12 '"failed") |DSMP;retractIfCan;%U;1| (27 . |coerce|)
              (32 . |coerce|) (37 . |coerce|) (|Mapping| $$ 7) (|Mapping| $$ 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 7) 7 6 12 $$)
              (42 . |map|) |DSMP;coerce;Smp%;2| (|Boolean|) (|String|)
              (|OutputForm|) (|PositiveInteger|)
              (|Record| (|:| |k| 35) (|:| |c| 6)) (|List| 33)
              (|IndexedExponents| 8) (|Mapping| 6 6) (|List| %) (|List| 35)
              (|List| 6) (|Union| 6 '#1="failed") (|Mapping| 35 35) (|List| 9)
              (|List| 8) (|Union| 8 '"failed") (|SparseUnivariatePolynomial| 6)
              (|SparseUnivariatePolynomial| %) (|Union| 37 '#2="failed")
              (|Integer|) (|Union| % '"failed") (|Union| 7 '#1#)
              (|Mapping| % 9) (|List| 7) (|Union| 62 '#3="failed") (|Matrix| %)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 48) (|HashState|)
              (|SingleInteger|) (|Matrix| 48)
              (|Record| (|:| |mat| 60) (|:| |vec| (|Vector| 48))) (|Vector| %)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 48 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 48) (|Mapping| 6 35) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Symbol|) (|List| 70) (|Union| 73 '#3#) (|List| 46)
              (|Factored| 46) (|Union| 66 '#1#) (|Union| 48 '#1#) (|Matrix| 6)
              (|Record| (|:| |mat| 77) (|:| |vec| (|Vector| 6)))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |var| 8) (|:| |exponent| 9)) (|Union| 80 '#2#)
              (|List| 83) (|Equation| %))
           '#(|retractIfCan| 49 |order| 54 |coerce| 59) 'NIL
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
              '#((|DifferentialPolynomialCategory| 6 7 8
                                                   (|IndexedExponents| 8))
                 (|PolynomialCategory| 6 (|IndexedExponents| 8) 8)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 8) 8)
                 (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 8))
                 (|GcdDomain|) (|AbelianMonoidRing| 6 (|IndexedExponents| 8))
                 (|IntegralDomain|) (|LeftOreRing|) (|CommutativeRing|)
                 (|DifferentialExtension| 6) (|DifferentialRing|)
                 (|PartialDifferentialRing| 70) (|PartialDifferentialRing| 8)
                 (|EntireRing|) (|Algebra| $$) (|Algebra| 6)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 66) (|Ring|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 6) (|NonAssociativeAlgebra| 66)
                 (|FreeModuleCategory| 6 (|IndexedExponents| 8)) (|Rng|)
                 (|SemiRing|) (|Module| $$) (|FullyLinearlyExplicitOver| 6)
                 (|Module| 6) (|Module| 66)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 8))
                 (|SemiRng|) (|LinearlyExplicitOver| 48)
                 (|LinearlyExplicitOver| 6) (|BiModule| 66 66)
                 (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 8))
                 (|NonAssociativeRing|) (|RightModule| 48) (|RightModule| 66)
                 (|LeftModule| 66) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|PatternMatchable| 48)
                 (|PatternMatchable| (|Float|)) (|Comparable|)
                 (|AbelianSemiGroup|) (|FullyRetractableTo| 6) (|Magma|)
                 (|Evalable| $$) (|RetractableTo| 8) (|Hashable|)
                 (|CommutativeStar|) (|RetractableTo| 48) (|RetractableTo| 66)
                 (|SetCategory|) (|RetractableTo| 6) (|RetractableTo| 7)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 7))
                 (|InnerEvalable| 7 6) (|InnerEvalable| 7 $$)
                 (|InnerEvalable| $$ $$) (|CoercibleFrom| 8)
                 (|ConvertibleTo| 55) (|ConvertibleTo| 57) (|ConvertibleTo| 56)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|canonicalUnitNormal|)
                 (|CoercibleFrom| 48) (|CoercibleFrom| 66) (|CoercibleTo| 31)
                 (|BasicType|) (|CoercibleFrom| 6) (|InnerEvalable| 8 6)
                 (|InnerEvalable| 8 $$) (|VariablesCommuteWithCoefficients|)
                 (|unitsKnown|) (|CoercibleFrom| 7)
                 (|CoercibleFrom| (|SparseMultivariatePolynomial| 6 7)))
              (|makeByteWordVec2| 28
                                  '(1 0 9 0 10 1 8 7 0 11 1 12 0 7 13 1 12 0 6
                                    14 3 17 12 15 16 2 18 1 8 0 7 21 1 0 0 8 22
                                    1 0 0 6 23 3 26 2 24 25 12 27 1 0 19 0 20 1
                                    0 9 0 10 1 0 0 6 23 1 0 0 12 28 1 18 0 8
                                    22)))))
           '|lookupIncomplete|)) 
