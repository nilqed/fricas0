
(SDEFUN |POLY;coerce;$Of;1| ((|p| $) ($ |OutputForm|))
        (SPROG ((|a| (|Symbol|)) (#1=#:G701 NIL) (|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 8))
                      . #2=(|POLY;coerce;$Of;1|))
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 10)))
                       (#3='T
                        (SEQ
                         (LETT |a|
                               (COND
                                ((SPADCALL (QREFELT $ 13))
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 15))
                                           (QREFELT $ 17)))
                                (#3#
                                 (PROG2
                                     (LETT #1# (SPADCALL |p| (QREFELT $ 19))
                                           . #2#)
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                                   (|Union| (|Symbol|)
                                                            "failed")
                                                   #1#))))
                               . #2#)
                         (EXIT
                          (SPADCALL (SPADCALL |p| |a| (QREFELT $ 21))
                                    (SPADCALL |a| (QREFELT $ 22))
                                    (QREFELT $ 24)))))))))) 

(SDEFUN |POLY;integrate;$S$;2| ((|p| $) (|x| |Symbol|) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |p| |x| (QREFELT $ 21)) (QREFELT $ 26))
                  (SPADCALL |x| (QREFELT $ 27)) (QREFELT $ 28))) 

(DECLAIM (NOTINLINE |Polynomial;|)) 

(DEFUN |Polynomial| (#1=#:G778)
  (SPROG NIL
         (PROG (#2=#:G779)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Polynomial|)
                                               '|domainEqualList|)
                    . #3=(|Polynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Polynomial;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|Polynomial|)))))))))) 

(DEFUN |Polynomial;| (|#1|)
  (SPROG
   ((#1=#:G777 NIL) (|pv$| NIL) (#2=#:G769 NIL) (#3=#:G770 NIL) (#4=#:G771 NIL)
    (#5=#:G772 NIL) (#6=#:G773 NIL) (#7=#:G774 NIL) (#8=#:G775 NIL)
    (#9=#:G776 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #10=(|Polynomial|))
    (LETT |dv$| (LIST '|Polynomial| DV$1) . #10#)
    (LETT $ (GETREFV 71) . #10#)
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
                                         (|HasCategory| (|Symbol|)
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
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
                                               (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #9#
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #9#
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|Symbol|)
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
                                               (|HasCategory| (|Symbol|)
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|)))))
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
                                          (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #9#
                                          (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
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
                                               (|HasCategory| (|Symbol|)
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|)))))
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
                                          (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #9#
                                          (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
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
    (|haddProp| |$ConstructorCache| '|Polynomial| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 549755813888))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #10#)
     (|augmentPredVector| $ 1099511627776))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 2199023255552))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4398046511104))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #9#
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8796093022208))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 17592186044416))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 35184372088832))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 70368744177664))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR #2# (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 562949953421312))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV $ 29 (CONS (|dispatchFunction| |POLY;integrate;$S$;2|) $))))
    $))) 

(MAKEPROP '|Polynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 16)
              (|local| |#1|) (|Union| 6 '#1="failed") (0 . |retractIfCan|)
              (|OutputForm|) (5 . |coerce|) (|Boolean|)
              (|UserDefinedPartialOrdering| 16) (10 . |userOrdered?|)
              (|List| 16) (14 . |variables|) (|Symbol|) (19 . |largest|)
              (|Union| 16 '"failed") (24 . |mainVariable|)
              (|SparseUnivariatePolynomial| $) (29 . |univariate|)
              (35 . |coerce|) (|SparseUnivariatePolynomial| $$)
              (40 . |outputForm|) |POLY;coerce;$Of;1| (46 . |integrate|)
              (51 . |coerce|) (56 . |elt|) (62 . |integrate|)
              (|Union| 36 '#2="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 41)
              (|Record| (|:| |mat| 37) (|:| |vec| (|Vector| 41))) (|Vector| $)
              (|Matrix| 41) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 41 $) (|Union| $ '#2#) (|Integer|)
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 41)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Factored| $) (|Factored| 20) (|Union| 50 '#2#)
              (|List| 20) (|Union| 44 '#1#) (|Union| 41 '#1#) (|List| 42)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Matrix| 6)
              (|Record| (|:| |mat| 55) (|:| |vec| (|Vector| 6)))
              (|IndexedExponents| 16) (|Equation| $) (|List| 58)
              (|Record| (|:| |var| 16) (|:| |exponent| 42))
              (|Union| 60 '#3="failed") (|Union| 46 '#3#)
              (|SparseUnivariatePolynomial| 6) (|List| 6) (|Mapping| 57 57)
              (|Mapping| 6 6) (|PositiveInteger|) (|String|) (|SingleInteger|)
              (|HashState|))
           '#(|variables| 68 |univariate| 73 |retractIfCan| 79 |mainVariable|
              84 |integrate| 89 |coerce| 95)
           'NIL
           (CONS
            (|makeByteWordVec2| 39
                                '(0 0 10 0 10 0 15 25 4 24 14 1 2 3 22 4 9 26
                                  16 4 27 12 27 0 1 22 26 0 0 1 4 0 0 0 0 1 1
                                  27 11 39 12 12 0 0 38 12 0 0 8 29 31 0 0 12 0
                                  0 0 0 0 0 4 5 6 7 26 13 33 35 17 12 12))
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
                |FullyRetractableTo&| |SetCategory&| |Evalable&| NIL
                |InnerEvalable&| |InnerEvalable&| |RetractableTo&| |BasicType&|
                NIL NIL |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL
                NIL |InnerEvalable&| |RetractableTo&|)
             (CONS
              '#((|PolynomialCategory| 6 57 16)
                 (|MaybeSkewPolynomialCategory| 6 57 16)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 57) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 57) (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitOver| 6) (|CommutativeRing|)
                 (|LeftOreRing|) (|Algebra| 44) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 41)
                 (|Algebra| $$) (|EntireRing|) (|PartialDifferentialRing| 16)
                 (|Ring|) (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 44)
                 (|Module| 6) (|Module| $$) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|BiModule| 44 44) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 44) (|RightModule| 44) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 41) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|Evalable| $$)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 16 $$)
                 (|InnerEvalable| 16 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 9) (|unitsKnown|) (|RetractableTo| 44)
                 (|RetractableTo| 41) (|canonicalUnitNormal|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 32)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 16))
              (|makeByteWordVec2| 29
                                  '(1 0 7 0 8 1 6 9 0 10 0 12 11 13 1 0 14 0 15
                                    1 12 16 14 17 1 0 18 0 19 2 0 20 0 16 21 1
                                    16 9 0 22 2 23 9 0 9 24 1 23 0 0 26 1 0 0
                                    16 27 2 23 2 0 2 28 2 0 0 0 16 29 1 0 14 0
                                    15 2 0 20 0 16 21 1 0 7 0 8 1 0 18 0 19 2 1
                                    0 0 16 29 1 12 0 16 27 1 0 9 0 25)))))
           '|lookupIncomplete|)) 
