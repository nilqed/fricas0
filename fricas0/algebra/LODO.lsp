
(SDEFUN |LODO;coerce;$Of;1| ((|l| $) ($ |OutputForm|))
        (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 17))) 

(SDEFUN |LODO;elt;$2A;2| ((|p| $) (|a| A) ($ A))
        (SPADCALL |p| (|spadConstant| $ 20) |a| (QREFELT $ 21))) 

(SDEFUN |LODO;symmetricProduct;3$;3| ((|a| $) (|b| $) ($ $))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 25))) 

(SDEFUN |LODO;symmetricPower;$Nni$;4|
        ((|a| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |a| |n| (QREFELT $ 7) (QREFELT $ 28))) 

(SDEFUN |LODO;directSum;3$;5| ((|a| $) (|b| $) ($ $))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 30))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator| (&REST #1=#:G750)
  (SPROG NIL
         (PROG (#2=#:G751)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperator|)
                                               '|domainEqualList|)
                    . #3=(|LinearOrdinaryDifferentialOperator|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |LinearOrdinaryDifferentialOperator;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperator|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperator;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G746 NIL) (#2=#:G747 NIL) (#3=#:G748 NIL) (#4=#:G749 NIL)
    ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|LinearOrdinaryDifferentialOperator|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator| DV$1 DV$2) . #5#)
    (LETT $ (GETREFV 60) . #5#)
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
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|EntireRing|))
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
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #5#)
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
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
                                         #4#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|))
                                            (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #3# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #3# #1# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|Field|))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 268435456))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 536870912))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR #3# (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 17179869184))
    (AND
     (OR #2# (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 34359738368))
    (AND
     (OR #1# (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 68719476736))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 12
              (|SparseUnivariateSkewPolynomial| |#1| (|spadConstant| $ 11)
                                                |#2|))
    (QSETREFV $ 16 (SPADCALL 'D (QREFELT $ 15)))
    (COND
     ((|testBitVector| |pv$| 28)
      (PROGN
       (QSETREFV $ 26
                 (CONS (|dispatchFunction| |LODO;symmetricProduct;3$;3|) $))
       (QSETREFV $ 29
                 (CONS (|dispatchFunction| |LODO;symmetricPower;$Nni$;4|) $))
       (QSETREFV $ 31 (CONS (|dispatchFunction| |LODO;directSum;3$;5|) $)))))
    $))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseUnivariateSkewPolynomial| 6
                                                (NRTEVAL (|spadConstant| $ 11))
                                                7)
              (|local| |#1|) (|local| |#2|) (0 . |One|) (4 . |One|)
              (|Automorphism| 6) (8 . |One|) '|Rep| (|OutputForm|) (|Symbol|)
              (12 . |coerce|) '|outputD| (17 . |outputForm|)
              |LODO;coerce;$Of;1| (23 . |Zero|) (27 . |Zero|) (31 . |apply|)
              |LODO;elt;$2A;2| (|Mapping| 6 6)
              (|LinearOrdinaryDifferentialOperatorsOps| 6 $$)
              (38 . |symmetricProduct|) (45 . |symmetricProduct|)
              (|NonNegativeInteger|) (51 . |symmetricPower|)
              (58 . |symmetricPower|) (64 . |directSum|) (71 . |directSum|)
              (|Record| (|:| |mat| 35) (|:| |vec| (|Vector| 36))) (|Matrix| $)
              (|Vector| $) (|Matrix| 36) (|Integer|) (|Boolean|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 36)
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 40 '#1="failed") (|Union| 36 '#1#) (|Matrix| 6)
              (|Record| (|:| |mat| 46) (|:| |vec| (|Vector| 6))) (|List| $)
              (|List| 50) (|SingletonAsOrderedSet|) (|List| 27)
              (|Union| 50 '"failed") (|Mapping| 27 27) (|List| 6)
              (|Union| 6 '#1#) (|PositiveInteger|) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 77 |zero?| 83 |variables| 88 |unitNormal| 93 |unitCanonical|
              98 |unit?| 103 |totalDegreeSorted| 108 |totalDegree| 114
              |symmetricSquare| 125 |symmetricProduct| 130 |symmetricPower| 136
              |subtractIfCan| 142 |smaller?| 148 |sample| 154
              |right_ext_ext_GCD| 158 |rightRemainder| 164 |rightQuotient| 170
              |rightLcm| 176 |rightGcd| 182 |rightExtendedGcd| 188
              |rightExactQuotient| 194 |rightDivide| 200 |retractIfCan| 206
              |retract| 221 |reductum| 236 |reducedSystem| 241 |recip| 263
              |primitivePart| 268 |primitiveMonomials| 273 |pomopo!| 278
              |opposite?| 286 |one?| 292 |numberOfMonomials| 297 |monomials|
              302 |monomial?| 307 |monomial| 312 |monicRightDivide| 332
              |monicLeftDivide| 338 |minimumDegree| 344 |mapExponents| 349
              |map| 355 |mainVariable| 361 |leftRemainder| 366 |leftQuotient|
              372 |leftLcm| 378 |leftGcd| 384 |leftExtendedGcd| 390
              |leftExactQuotient| 396 |leftDivide| 402 |leadingMonomial| 408
              |leadingCoefficient| 413 |latex| 418 |hashUpdate!| 423 |hash| 429
              |ground?| 434 |ground| 439 |fmecg| 444 |exquo| 452 |elt| 464
              |directSum| 470 |degree| 476 |content| 493 |coerce| 498
              |coefficients| 523 |coefficient| 528 |charthRoot| 548
              |characteristic| 553 |binomThmExpt| 557 |associates?| 564 |apply|
              570 |annihilate?| 577 |adjoint| 583 ^ 588 |Zero| 600 |One| 604 D
              608 = 612 / 618 - 624 + 635 * 641)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 0 0 0 2 1 2 10 12 1 13 2 3 4 5 10 11 12 0
                                  1 14 16 0 0 1 1 15 16 18 23 25 17 0 27 17 0 0
                                  9 0 0 0 0 0 0 13 5 6 7 8 10))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| NIL |Algebra&| |Algebra&|
                |FullyLinearlyExplicitOver&| |Algebra&| |Module&| NIL |Module&|
                NIL NIL |EntireRing&| NIL NIL |Module&| NIL NIL NIL |Ring&| NIL
                NIL NIL NIL NIL |Rng&| NIL |AbelianGroup&| NIL NIL NIL
                |AbelianMonoid&| |Monoid&| |AbelianSemiGroup&| |SemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| NIL |RetractableTo&|
                |BasicType&| NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL
                NIL)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 6)
                 (|UnivariateSkewPolynomialCategory| 6)
                 (|MaybeSkewPolynomialCategory| 6 27 50)
                 (|FiniteAbelianMonoidRing| 6 27) (|AbelianMonoidRing| 6 27)
                 (|IntegralDomain|) (|Algebra| 40) (|Algebra| $$)
                 (|FullyLinearlyExplicitOver| 6) (|Algebra| 6) (|Module| 40)
                 (|CommutativeRing|) (|Module| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|EntireRing|)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 36)
                 (|Module| 6) (|BiModule| 6 6) (|BiModule| 40 40)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 40) (|RightModule| 40) (|RightModule| $$)
                 (|Rng|) (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|SemiRng|)
                 (|AbelianMonoid|) (|Monoid|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|Comparable|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|Eltable| 6 6) (|RetractableTo| 6)
                 (|BasicType|) (|CoercibleTo| 13) (|CommutativeStar|)
                 (|noZeroDivisors|) (|RetractableTo| 40) (|RetractableTo| 36)
                 (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 59
                                  '(0 0 0 8 0 6 0 9 0 10 0 11 1 14 13 0 15 2 12
                                    13 0 13 17 0 0 0 19 0 6 0 20 3 0 6 0 6 6 21
                                    3 24 2 2 2 23 25 2 0 0 0 0 26 3 24 2 2 27
                                    23 28 2 0 0 0 27 29 3 24 2 2 2 23 30 2 0 0
                                    0 0 31 2 0 37 0 0 1 1 37 37 0 1 1 0 49 0 1
                                    1 31 39 0 1 1 31 0 0 1 1 31 37 0 1 2 0 27 0
                                    49 1 1 0 27 0 1 2 0 27 0 49 1 1 28 0 0 1 2
                                    28 0 0 0 26 2 28 0 0 27 29 2 36 38 0 0 1 2
                                    9 37 0 0 1 0 37 0 1 2 28 41 0 0 1 2 28 0 0
                                    0 1 2 28 0 0 0 1 2 28 0 0 0 1 2 28 0 0 0 1
                                    2 28 42 0 0 1 2 28 38 0 0 1 2 28 43 0 0 1 1
                                    6 44 0 1 1 7 45 0 1 1 0 55 0 1 1 6 40 0 1 1
                                    7 36 0 1 1 0 6 0 1 1 0 0 0 1 2 21 32 33 34
                                    1 1 21 35 33 1 1 10 46 33 1 2 10 47 33 34 1
                                    1 33 38 0 1 1 20 0 0 1 1 17 48 0 1 4 0 0 0
                                    6 27 0 1 2 37 37 0 0 1 1 33 37 0 1 1 0 27 0
                                    1 1 0 48 0 1 1 0 37 0 1 3 0 0 0 50 27 1 3 0
                                    0 0 49 51 1 2 0 0 6 27 1 2 2 43 0 0 1 2 2
                                    43 0 0 1 1 0 27 0 1 2 0 0 53 0 1 2 0 0 23 0
                                    1 1 0 52 0 1 2 28 0 0 0 1 2 28 0 0 0 1 2 28
                                    0 0 0 1 2 28 0 0 0 1 2 28 42 0 0 1 2 28 38
                                    0 0 1 2 28 43 0 0 1 1 0 0 0 1 1 0 6 0 1 1 0
                                    58 0 1 2 0 57 57 0 1 1 0 59 0 1 1 0 37 0 1
                                    1 0 6 0 1 4 10 0 0 27 6 0 1 2 31 38 0 0 1 2
                                    5 38 0 6 1 2 0 6 0 6 22 2 28 0 0 0 31 2 0
                                    27 0 50 1 2 0 51 0 49 1 1 0 27 0 1 1 20 6 0
                                    1 1 29 0 0 1 1 32 0 36 1 1 19 0 40 1 1 0 0
                                    6 1 1 0 13 0 18 1 0 54 0 1 3 0 0 0 49 51 1
                                    3 0 0 0 50 27 1 2 0 6 0 27 1 1 3 38 0 1 0
                                    34 27 1 3 30 0 0 0 27 1 2 31 37 0 0 1 3 0 6
                                    0 6 6 21 2 34 37 0 0 1 1 0 0 0 1 2 33 0 0
                                    27 1 2 0 0 0 56 1 0 37 0 19 0 33 0 8 0 0 0
                                    1 2 0 37 0 0 1 2 28 0 0 6 1 1 35 0 0 1 2 35
                                    0 0 0 1 2 0 0 0 0 1 2 35 0 36 0 1 2 37 0 27
                                    0 1 2 1 0 40 0 1 2 1 0 0 40 1 2 0 0 6 0 1 2
                                    0 0 0 0 1 2 0 0 0 6 1 2 0 0 56 0 1)))))
           '|lookupComplete|)) 
