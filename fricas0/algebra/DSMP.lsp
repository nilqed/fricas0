
(SDEFUN |DSMP;retractIfCan;$U;1|
        ((|p| $) ($ |Union| (|SparseMultivariatePolynomial| R S) "failed"))
        (COND
         ((ZEROP (SPADCALL |p| (QREFELT $ 10)))
          (CONS 0
                (SPADCALL (CONS #'|DSMP;retractIfCan;$U;1!0| $) (ELT $ 14) |p|
                          (QREFELT $ 18))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |DSMP;retractIfCan;$U;1!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 13))) 

(SDEFUN |DSMP;coerce;Smp$;2| ((|p| |SparseMultivariatePolynomial| R S) ($ $))
        (SPADCALL (CONS #'|DSMP;coerce;Smp$;2!0| $) (ELT $ 23) |p|
                  (QREFELT $ 27))) 

(SDEFUN |DSMP;coerce;Smp$;2!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 21)) (QREFELT $ 22))) 

(DECLAIM (NOTINLINE |DifferentialSparseMultivariatePolynomial;|)) 

(DEFUN |DifferentialSparseMultivariatePolynomial| (&REST #1=#:G775)
  (SPROG NIL
         (PROG (#2=#:G776)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DifferentialSparseMultivariatePolynomial|)
                                               '|domainEqualList|)
                    . #3=(|DifferentialSparseMultivariatePolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |DifferentialSparseMultivariatePolynomial;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|DifferentialSparseMultivariatePolynomial|)))))))))) 

(DEFUN |DifferentialSparseMultivariatePolynomial;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G774 NIL) (|pv$| NIL) (#2=#:G767 NIL) (#3=#:G768 NIL) (#4=#:G769 NIL)
    (#5=#:G770 NIL) (#6=#:G771 NIL) (#7=#:G772 NIL) (#8=#:G773 NIL) ($ NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|)
          . #9=(|DifferentialSparseMultivariatePolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #9#)
    (LETT DV$3 (|devaluate| |#3|) . #9#)
    (LETT |dv$|
          (LIST '|DifferentialSparseMultivariatePolynomial| DV$1 DV$2 DV$3)
          . #9#)
    (LETT $ (GETREFV 80) . #9#)
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
                                         (|HasCategory| |#3|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
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
                                               (|HasCategory| |#3|
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
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                          (|HasCategory| |#3|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                                                 (|Float|)))))
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
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                                                 (|Integer|)))))
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
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                         #2#)))
                    . #9#))
    (|haddProp| |$ConstructorCache| '|DifferentialSparseMultivariatePolynomial|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
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

(MAKEPROP '|DifferentialSparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              (|NonNegativeInteger|) (0 . |order|) (5 . |retract|)
              (|SparseMultivariatePolynomial| 6 7) (10 . |coerce|)
              (15 . |coerce|) (|Mapping| 12 8) (|Mapping| 12 6)
              (|PolynomialCategoryLifting| 63 8 6 $$ 12) (20 . |map|)
              (|Union| 12 '"failed") |DSMP;retractIfCan;$U;1| (27 . |coerce|)
              (32 . |coerce|) (37 . |coerce|) (|Mapping| $$ 7) (|Mapping| $$ 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 7) 7 6 12 $$)
              (42 . |map|) |DSMP;coerce;Smp$;2| (|Union| 35 '#1="failed")
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 57)
              (|Record| (|:| |mat| 36) (|:| |vec| (|Vector| 57))) (|Vector| $)
              (|Matrix| 57) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 57 $) (|Union| $ '#1#) (|Boolean|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 57) (|List| 7) (|List| 6) (|List| $) (|Mapping| $ 9)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|Factored| $) (|List| 52)
              (|List| 9) (|Symbol|) (|Factored| 48) (|Union| 55 '#1#)
              (|List| 48) (|Union| 42 '#2="failed") (|Integer|)
              (|Union| 57 '#2#) (|List| 8)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |mat| 62) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|IndexedExponents| 8) (|List| 65) (|Equation| $)
              (|Union| 8 '#2#) (|Union| 45 '#3="failed")
              (|Record| (|:| |var| 8) (|:| |exponent| 9)) (|Union| 68 '#3#)
              (|Union| 7 '#2#) (|Mapping| 6 6) (|SparseUnivariatePolynomial| 6)
              (|Mapping| 63 63) (|Union| 6 '#2#) (|PositiveInteger|) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(|retractIfCan| 49 |order| 54 |coerce| 59) 'NIL
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
              '#((|DifferentialPolynomialCategory| 6 7 8
                                                   (|IndexedExponents| 8))
                 (|PolynomialCategory| 6 (|IndexedExponents| 8) 8)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 8) 8)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 8))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 8)) (|GcdDomain|)
                 (|IntegralDomain|) (|DifferentialExtension| 6) (|Algebra| 42)
                 (|Algebra| 6) (|FullyLinearlyExplicitOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Module| 42) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 57) (|CommutativeRing|) (|Module| $$)
                 (|EntireRing|) (|PartialDifferentialRing| 8)
                 (|PartialDifferentialRing| 52) (|DifferentialRing|) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 42 42) (|BiModule| $$ $$)
                 (|LeftModule| $$) (|Rng|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 42) (|RightModule| 42) (|RightModule| $$)
                 (|AbelianGroup|) (|SemiRing|) (|CancellationAbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|AbelianMonoid|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 57)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Evalable| $$)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 7))
                 (|RetractableTo| 7) (|unitsKnown|)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 8 $$)
                 (|InnerEvalable| 8 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 79) (|RetractableTo| 42) (|RetractableTo| 57)
                 (|canonicalUnitNormal|) (|CommutativeStar|) (|noZeroDivisors|)
                 (|ConvertibleTo| 32) (|ConvertibleTo| 33) (|ConvertibleTo| 31)
                 (|RetractableTo| 8) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 7 $$) (|InnerEvalable| 7 6))
              (|makeByteWordVec2| 28
                                  '(1 0 9 0 10 1 8 7 0 11 1 12 0 7 13 1 12 0 6
                                    14 3 17 12 15 16 2 18 1 8 0 7 21 1 0 0 8 22
                                    1 0 0 6 23 3 26 2 24 25 12 27 1 0 19 0 20 1
                                    0 9 0 10 1 16 0 8 22 1 0 0 12 28 1 0 0 6
                                    23)))))
           '|lookupIncomplete|)) 
