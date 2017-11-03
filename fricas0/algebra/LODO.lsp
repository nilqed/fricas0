
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

(DEFUN |LinearOrdinaryDifferentialOperator| (&REST #1=#:G752)
  (SPROG NIL
         (PROG (#2=#:G753)
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
   ((|pv$| NIL) (#1=#:G750 NIL) (#2=#:G751 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|LinearOrdinaryDifferentialOperator|))
    (LETT DV$2 (|devaluate| |#2|) . #3#)
    (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator| DV$1 DV$2) . #3#)
    (LETT $ (GETREFV 60) . #3#)
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
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #3#)
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
                                         #2#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
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
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #3#)
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
                                         #1#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#)
                                        (|HasCategory| |#1| '(|Field|))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND
     (OR (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8388608))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 16777216))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 33554432))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR #1# (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 2147483648))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 12
              (|SparseUnivariateSkewPolynomial| |#1| (|spadConstant| $ 11)
                                                |#2|))
    (QSETREFV $ 16 (SPADCALL 'D (QREFELT $ 15)))
    (COND
     ((|testBitVector| |pv$| 23)
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
                                                (NRTEVAL (QREFELT $ 7)))
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
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 40 '#1="failed") (|Union| 36 '#1#) (|Matrix| 6)
              (|Record| (|:| |mat| 46) (|:| |vec| (|Vector| 6))) (|List| $)
              (|List| 51) (|List| 27) (|SingletonAsOrderedSet|)
              (|Union| 51 '"failed") (|Mapping| 27 27) (|List| 6)
              (|Union| 6 '#1#) (|PositiveInteger|) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 77 |zero?| 83 |variables| 88 |unitNormal| 93 |unitCanonical|
              98 |unit?| 103 |totalDegreeSorted| 108 |totalDegree| 114
              |symmetricSquare| 125 |symmetricProduct| 130 |symmetricPower| 136
              |subtractIfCan| 142 |smaller?| 148 |sample| 154
              |right_ext_ext_GCD| 158 |rightRemainder| 164 |rightRecip| 170
              |rightQuotient| 175 |rightPower| 181 |rightLcm| 193 |rightGcd|
              199 |rightExtendedGcd| 205 |rightExactQuotient| 211 |rightDivide|
              217 |retractIfCan| 223 |retract| 238 |reductum| 253
              |reducedSystem| 258 |recip| 280 |primitivePart| 285
              |primitiveMonomials| 290 |pomopo!| 295 |opposite?| 303 |one?| 309
              |numberOfMonomials| 314 |monomials| 319 |monomial?| 324
              |monomial| 329 |monicRightDivide| 349 |monicLeftDivide| 355
              |minimumDegree| 361 |mapExponents| 366 |map| 372 |mainVariable|
              378 |leftRemainder| 383 |leftRecip| 389 |leftQuotient| 394
              |leftPower| 400 |leftLcm| 412 |leftGcd| 418 |leftExtendedGcd| 424
              |leftExactQuotient| 430 |leftDivide| 436 |leadingMonomial| 442
              |leadingCoefficient| 447 |latex| 452 |hashUpdate!| 457 |hash| 463
              |ground?| 468 |ground| 473 |fmecg| 478 |exquo| 486 |elt| 498
              |directSum| 504 |degree| 510 |content| 527 |commutator| 532
              |coerce| 538 |coefficients| 563 |coefficient| 568 |charthRoot|
              588 |characteristic| 593 |binomThmExpt| 597 |associator| 604
              |associates?| 611 |apply| 617 |antiCommutator| 624 |annihilate?|
              630 |adjoint| 636 ^ 641 |Zero| 653 |One| 657 D 661 = 665 / 671 -
              677 + 688 * 694)
           'NIL
           (CONS
            (|makeByteWordVec2| 22
                                '(0 0 0 0 0 9 1 2 3 4 9 10 11 12 12 14 0 1 11 0
                                  0 1 9 0 0 0 0 1 1 12 13 22 14 14 0 0 21 14 0
                                  0 8 0 0 0 0 0 0 4 5 6 7 9))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |FullyLinearlyExplicitOver&| |Algebra&|
                NIL NIL |EntireRing&| NIL NIL |Algebra&| NIL |Rng&| NIL NIL
                |Module&| |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL
                NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |Magma&| |AbelianSemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| NIL |RetractableTo&|
                |BasicType&| NIL NIL |RetractableTo&| |RetractableTo&| NIL NIL)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 6)
                 (|UnivariateSkewPolynomialCategory| 6)
                 (|MaybeSkewPolynomialCategory| 6 27 51)
                 (|FiniteAbelianMonoidRing| 6 27) (|AbelianMonoidRing| 6 27)
                 (|FullyLinearlyExplicitOver| 6) (|Algebra| 40)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 36) (|Algebra| 6) (|Ring|) (|Rng|)
                 (|SemiRing|) (|SemiRng|) (|Module| 40) (|Module| 6)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 40 40)
                 (|NonAssociativeRing|) (|LeftModule| 6) (|RightModule| 6)
                 (|RightModule| $$) (|LeftModule| $$) (|LeftModule| 40)
                 (|RightModule| 40) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|Magma|)
                 (|AbelianSemiGroup|) (|Comparable|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|Eltable| 6 6) (|RetractableTo| 6)
                 (|BasicType|) (|CoercibleTo| 13) (|noZeroDivisors|)
                 (|RetractableTo| 40) (|RetractableTo| 36)
                 (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 59
                                  '(0 0 0 8 0 6 0 9 0 10 0 11 1 14 13 0 15 2 12
                                    13 0 13 17 0 0 0 19 0 6 0 20 3 0 6 0 6 6 21
                                    3 24 2 2 2 23 25 2 0 0 0 0 26 3 24 2 2 27
                                    23 28 2 0 0 0 27 29 3 24 2 2 2 23 30 2 0 0
                                    0 0 31 2 0 37 0 0 1 1 30 37 0 1 1 0 49 0 1
                                    1 26 39 0 1 1 26 0 0 1 1 26 37 0 1 2 0 27 0
                                    49 1 2 0 27 0 49 1 1 0 27 0 1 1 23 0 0 1 2
                                    23 0 0 0 26 2 23 0 0 27 29 2 31 38 0 0 1 2
                                    8 37 0 0 1 0 30 0 1 2 23 42 0 0 1 2 23 0 0
                                    0 1 1 28 38 0 1 2 23 0 0 0 1 2 28 0 0 27 1
                                    2 0 0 0 56 1 2 23 0 0 0 1 2 23 0 0 0 1 2 23
                                    41 0 0 1 2 23 38 0 0 1 2 23 43 0 0 1 1 5 44
                                    0 1 1 6 45 0 1 1 0 55 0 1 1 5 40 0 1 1 6 36
                                    0 1 1 0 6 0 1 1 0 0 0 1 2 18 32 33 34 1 1
                                    18 35 33 1 1 9 46 33 1 2 9 47 33 34 1 1 28
                                    38 0 1 1 17 0 0 1 1 14 48 0 1 4 0 0 0 6 27
                                    0 1 2 30 37 0 0 1 1 28 37 0 1 1 0 27 0 1 1
                                    0 48 0 1 1 0 37 0 1 3 0 0 0 49 50 1 3 0 0 0
                                    51 27 1 2 0 0 6 27 1 2 15 43 0 0 1 2 15 43
                                    0 0 1 1 0 27 0 1 2 0 0 53 0 1 2 0 0 23 0 1
                                    1 0 52 0 1 2 23 0 0 0 1 1 28 38 0 1 2 23 0
                                    0 0 1 2 28 0 0 27 1 2 0 0 0 56 1 2 23 0 0 0
                                    1 2 23 0 0 0 1 2 23 41 0 0 1 2 23 38 0 0 1
                                    2 23 43 0 0 1 1 0 0 0 1 1 0 6 0 1 1 0 58 0
                                    1 2 0 57 57 0 1 1 0 59 0 1 1 0 37 0 1 1 0 6
                                    0 1 4 9 0 0 27 6 0 1 2 26 38 0 0 1 2 4 38 0
                                    6 1 2 0 6 0 6 22 2 23 0 0 0 31 2 0 27 0 51
                                    1 2 0 50 0 49 1 1 0 27 0 1 1 17 6 0 1 2 29
                                    0 0 0 1 1 27 0 36 1 1 24 0 0 1 1 16 0 40 1
                                    1 0 0 6 1 1 0 13 0 18 1 0 54 0 1 3 0 0 0 51
                                    27 1 3 0 0 0 49 50 1 2 0 6 0 27 1 1 2 38 0
                                    1 0 29 27 1 3 25 0 0 0 27 1 3 29 0 0 0 0 1
                                    2 26 37 0 0 1 3 0 6 0 6 6 21 2 0 0 0 0 1 2
                                    29 37 0 0 1 1 0 0 0 1 2 28 0 0 27 1 2 0 0 0
                                    56 1 0 30 0 19 0 28 0 8 0 0 0 1 2 0 37 0 0
                                    1 2 23 0 0 6 1 1 32 0 0 1 2 32 0 0 0 1 2 0
                                    0 0 0 1 2 32 0 36 0 1 2 30 0 27 0 1 2 1 0 0
                                    40 1 2 1 0 40 0 1 2 0 0 6 0 1 2 0 0 0 6 1 2
                                    0 0 0 0 1 2 0 0 56 0 1)))))
           '|lookupComplete|)) 
