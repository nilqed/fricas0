
(SDEFUN |ORESUP;^;$Pi$;1| ((|x| $) (|n| |PositiveInteger|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 11))) 

(SDEFUN |ORESUP;^;$Nni$;2| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (COND ((ZEROP |n|) (|spadConstant| $ 13))
              ('T (SPADCALL |x| |n| (QREFELT $ 11))))) 

(SDEFUN |ORESUP;*;3$;3| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 19))) 

(SDEFUN |ORESUP;*;$R$;4| ((|x| $) (|r| R) ($ $))
        (SPADCALL |x| (SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 22))
                  (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 19))) 

(SDEFUN |ORESUP;apply;$3R;5| ((|p| $) (|c| R) (|r| R) ($ R))
        (SPADCALL |p| |c| |r| (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 24))) 

(SDEFUN |ORESUP;monicLeftDivide;2$R;6|
        ((|a| $) (|b| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 27))) 

(SDEFUN |ORESUP;monicRightDivide;2$R;7|
        ((|a| $) (|b| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 30))) 

(SDEFUN |ORESUP;leftDivide;2$R;8|
        ((|a| $) (|b| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 32))) 

(SDEFUN |ORESUP;rightDivide;2$R;9|
        ((|a| $) (|b| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 34))) 

(DECLAIM (NOTINLINE |SparseUnivariateSkewPolynomial;|)) 

(DEFUN |SparseUnivariateSkewPolynomial| (&REST #1=#:G749)
  (SPROG NIL
         (PROG (#2=#:G750)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseUnivariateSkewPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|SparseUnivariateSkewPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseUnivariateSkewPolynomial;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariateSkewPolynomial|)))))))))) 

(DEFUN |SparseUnivariateSkewPolynomial;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G747 NIL) (#2=#:G748 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|SparseUnivariateSkewPolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #3#)
    (LETT DV$3 (|devaluate| |#3|) . #3#)
    (LETT |dv$| (LIST '|SparseUnivariateSkewPolynomial| DV$1 DV$2 DV$3) . #3#)
    (LETT $ (GETREFV 63) . #3#)
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
                                        (|HasCategory| |#1| '(|Field|))
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
                                         #1#)))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|SparseUnivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
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
    (COND
     ((|testBitVector| |pv$| 15)
      (PROGN
       (QSETREFV $ 29
                 (CONS (|dispatchFunction| |ORESUP;monicLeftDivide;2$R;6|) $))
       (QSETREFV $ 31
                 (CONS (|dispatchFunction| |ORESUP;monicRightDivide;2$R;7|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 19)
      (PROGN
       (QSETREFV $ 33 (CONS (|dispatchFunction| |ORESUP;leftDivide;2$R;8|) $))
       (QSETREFV $ 35
                 (CONS (|dispatchFunction| |ORESUP;rightDivide;2$R;9|) $)))))
    $))) 

(MAKEPROP '|SparseUnivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|PositiveInteger|)
              (|RepeatedSquaring| $$) (0 . |expt|) |ORESUP;^;$Pi$;1|
              (6 . |One|) (|NonNegativeInteger|) |ORESUP;^;$Nni$;2|
              (|Automorphism| 6) (|Mapping| 6 6)
              (|UnivariateSkewPolynomialCategoryOps| 6 $$) (10 . |times|)
              |ORESUP;*;3$;3| (18 . |One|) (22 . *) |ORESUP;*;$R$;4|
              (28 . |apply|) |ORESUP;apply;$3R;5|
              (|Record| (|:| |quotient| $$) (|:| |remainder| $$))
              (37 . |monicLeftDivide|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (44 . |monicLeftDivide|) (50 . |monicRightDivide|)
              (57 . |monicRightDivide|) (63 . |leftDivide|) (70 . |leftDivide|)
              (76 . |rightDivide|) (83 . |rightDivide|)
              (|Record| (|:| |mat| 39) (|:| |vec| (|Vector| 40))) (|Matrix| $)
              (|Vector| $) (|Matrix| 40) (|Integer|) (|Boolean|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 40)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (|Union| 44 '#1="failed") (|Union| 40 '#1#) (|Matrix| 6)
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 6))) (|List| $)
              (|OutputForm|) (|List| 54) (|SingletonAsOrderedSet|) (|List| 14)
              (|Union| 54 '"failed") (|Mapping| 14 14) (|List| 6)
              (|Union| 6 '#1#) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 89 |zero?| 95 |variables| 100 |unitNormal| 105 |unitCanonical|
              110 |unit?| 115 |totalDegreeSorted| 120 |totalDegree| 126
              |subtractIfCan| 137 |smaller?| 143 |sample| 149
              |right_ext_ext_GCD| 153 |rightRemainder| 159 |rightRecip| 165
              |rightQuotient| 170 |rightPower| 176 |rightLcm| 188 |rightGcd|
              194 |rightExtendedGcd| 200 |rightExactQuotient| 206 |rightDivide|
              212 |retractIfCan| 218 |retract| 233 |reductum| 248
              |reducedSystem| 253 |recip| 275 |primitivePart| 280
              |primitiveMonomials| 285 |pomopo!| 290 |outputForm| 298
              |opposite?| 304 |one?| 310 |numberOfMonomials| 315 |monomials|
              320 |monomial?| 325 |monomial| 330 |monicRightDivide| 350
              |monicLeftDivide| 356 |minimumDegree| 362 |mapExponents| 367
              |map| 373 |mainVariable| 379 |leftRemainder| 384 |leftRecip| 390
              |leftQuotient| 395 |leftPower| 401 |leftLcm| 413 |leftGcd| 419
              |leftExtendedGcd| 425 |leftExactQuotient| 431 |leftDivide| 437
              |leadingMonomial| 443 |leadingCoefficient| 448 |latex| 453
              |hashUpdate!| 458 |hash| 464 |ground?| 469 |ground| 474 |fmecg|
              479 |exquo| 487 |degree| 499 |content| 516 |commutator| 521
              |coerce| 527 |coefficients| 552 |coefficient| 557 |charthRoot|
              577 |characteristic| 582 |binomThmExpt| 586 |associator| 593
              |associates?| 600 |apply| 606 |antiCommutator| 613 |annihilate?|
              619 ^ 625 |Zero| 637 |One| 641 = 645 / 651 - 657 + 668 * 674)
           'NIL
           (CONS
            (|makeByteWordVec2| 23
                                '(0 0 0 0 9 1 2 3 4 9 10 11 12 12 14 0 1 11 0 0
                                  1 9 0 0 0 0 1 1 12 13 23 14 14 0 0 22 14 0 0
                                  8 0 0 0 0 0 4 5 6 7 9))
            (CONS
             '#(|UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |FullyLinearlyExplicitOver&| |Algebra&|
                NIL NIL |EntireRing&| NIL NIL |Algebra&| NIL |Rng&| NIL NIL
                |Module&| |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL
                NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |Magma&| |AbelianSemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| |RetractableTo&|
                |BasicType&| NIL NIL |RetractableTo&| |RetractableTo&| NIL NIL)
             (CONS
              '#((|UnivariateSkewPolynomialCategory| 6)
                 (|MaybeSkewPolynomialCategory| 6 14 54)
                 (|FiniteAbelianMonoidRing| 6 14) (|AbelianMonoidRing| 6 14)
                 (|FullyLinearlyExplicitOver| 6) (|Algebra| 44)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 40) (|Algebra| 6) (|Ring|) (|Rng|)
                 (|SemiRing|) (|SemiRng|) (|Module| 44) (|Module| 6)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 44 44)
                 (|NonAssociativeRing|) (|LeftModule| 6) (|RightModule| 6)
                 (|RightModule| $$) (|LeftModule| $$) (|LeftModule| 44)
                 (|RightModule| 44) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|Magma|)
                 (|AbelianSemiGroup|) (|Comparable|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 52) (|noZeroDivisors|) (|RetractableTo| 44)
                 (|RetractableTo| 40) (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 62
                                  '(2 10 2 2 9 11 0 0 0 13 4 18 2 2 2 16 17 19
                                    0 16 0 21 2 0 0 6 0 22 5 18 6 2 6 6 16 17
                                    24 3 18 26 2 2 16 27 2 0 28 0 0 29 3 18 26
                                    2 2 16 30 2 0 28 0 0 31 3 18 26 2 2 16 32 2
                                    0 28 0 0 33 3 18 26 2 2 16 34 2 0 28 0 0 35
                                    2 0 41 0 0 1 1 30 41 0 1 1 0 53 0 1 1 26 43
                                    0 1 1 26 0 0 1 1 26 41 0 1 2 0 14 0 53 1 1
                                    0 14 0 1 2 0 14 0 53 1 2 31 42 0 0 1 2 8 41
                                    0 0 1 0 30 0 1 2 19 46 0 0 1 2 19 0 0 0 1 1
                                    28 42 0 1 2 19 0 0 0 1 2 28 0 0 14 1 2 0 0
                                    0 9 1 2 19 0 0 0 1 2 19 0 0 0 1 2 19 45 0 0
                                    1 2 19 42 0 0 1 2 19 28 0 0 35 1 5 47 0 1 1
                                    6 48 0 1 1 0 59 0 1 1 5 44 0 1 1 6 40 0 1 1
                                    0 6 0 1 1 0 0 0 1 2 18 36 37 38 1 1 18 39
                                    37 1 1 9 49 37 1 2 9 50 37 38 1 1 28 42 0 1
                                    1 17 0 0 1 1 14 51 0 1 4 0 0 0 6 14 0 1 2 0
                                    52 0 52 1 2 30 41 0 0 1 1 28 41 0 1 1 0 14
                                    0 1 1 0 51 0 1 1 0 41 0 1 3 0 0 0 54 14 1 3
                                    0 0 0 53 55 1 2 0 0 6 14 1 2 15 28 0 0 31 2
                                    15 28 0 0 29 1 0 14 0 1 2 0 0 57 0 1 2 0 0
                                    17 0 1 1 0 56 0 1 2 19 0 0 0 1 1 28 42 0 1
                                    2 19 0 0 0 1 2 28 0 0 14 1 2 0 0 0 9 1 2 19
                                    0 0 0 1 2 19 0 0 0 1 2 19 45 0 0 1 2 19 42
                                    0 0 1 2 19 28 0 0 33 1 0 0 0 1 1 0 6 0 1 1
                                    0 61 0 1 2 0 60 60 0 1 1 0 62 0 1 1 0 41 0
                                    1 1 0 6 0 1 4 9 0 0 14 6 0 1 2 26 42 0 0 1
                                    2 4 42 0 6 1 2 0 55 0 53 1 2 0 14 0 54 1 1
                                    0 14 0 1 1 17 6 0 1 2 29 0 0 0 1 1 27 0 40
                                    1 1 24 0 0 1 1 16 0 44 1 1 0 0 6 1 1 0 52 0
                                    1 1 0 58 0 1 3 0 0 0 53 55 1 3 0 0 0 54 14
                                    1 2 0 6 0 14 1 1 2 42 0 1 0 29 14 1 3 25 0
                                    0 0 14 1 3 29 0 0 0 0 1 2 26 41 0 0 1 3 0 6
                                    0 6 6 25 2 0 0 0 0 1 2 29 41 0 0 1 2 28 0 0
                                    14 15 2 0 0 0 9 12 0 30 0 1 0 28 0 13 2 0
                                    41 0 0 1 2 19 0 0 6 1 2 32 0 0 0 1 1 32 0 0
                                    1 2 0 0 0 0 1 2 32 0 40 0 1 2 30 0 14 0 1 2
                                    1 0 0 44 1 2 1 0 44 0 1 2 0 0 6 0 22 2 0 0
                                    0 6 23 2 0 0 0 0 20 2 0 0 9 0 1)))))
           '|lookupComplete|)) 
