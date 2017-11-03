
(SDEFUN |OREUP;coerce;V$;1| ((|v| |Variable| |x|) ($ $))
        (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 16))) 

(SDEFUN |OREUP;coerce;$Of;2| ((|p| $) ($ |OutputForm|))
        (SPADCALL |p| (SPADCALL (QREFELT $ 6) (QREFELT $ 21)) (QREFELT $ 22))) 

(DECLAIM (NOTINLINE |UnivariateSkewPolynomial;|)) 

(DEFUN |UnivariateSkewPolynomial| (&REST #1=#:G738)
  (SPROG NIL
         (PROG (#2=#:G739)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateSkewPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|UnivariateSkewPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |UnivariateSkewPolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateSkewPolynomial|)))))))))) 

(DEFUN |UnivariateSkewPolynomial;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G736 NIL) (#2=#:G737 NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL)
    (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|UnivariateSkewPolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #3#)
    (LETT DV$3 (|devaluate| |#3|) . #3#)
    (LETT DV$4 (|devaluate| |#4|) . #3#)
    (LETT |dv$| (LIST '|UnivariateSkewPolynomial| DV$1 DV$2 DV$3 DV$4) . #3#)
    (LETT $ (GETREFV 53) . #3#)
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
                                        (|HasCategory| |#2| '(|EntireRing|))
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
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              . #3#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         #2#
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2|
                                                       '(|IntegralDomain|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#2| '(|GcdDomain|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|Field|))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|))
                                              . #3#)
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
                                         #1#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #1#)))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|UnivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND
     (OR (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8388608))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 16777216))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 33554432))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianMonoid|))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR #1# (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 2147483648))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (|SparseUnivariateSkewPolynomial| |#2| |#3| |#4|))
    $))) 

(MAKEPROP '|UnivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseUnivariateSkewPolynomial| 7 (NRTEVAL (QREFELT $ 8))
                                                (NRTEVAL (QREFELT $ 9)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Automorphism| 7) (0 . |One|) (4 . |One|) (8 . |One|)
              (|NonNegativeInteger|) (12 . |monomial|)
              (|Variable| (NRTEVAL (QREFELT $ 6))) |OREUP;coerce;V$;1|
              (|Symbol|) (|OutputForm|) (18 . |outputForm|) (23 . |outputForm|)
              |OREUP;coerce;$Of;2|
              (|Record| (|:| |mat| 27) (|:| |vec| (|Vector| 28))) (|Matrix| $)
              (|Vector| $) (|Matrix| 28) (|Integer|) (|Boolean|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 28)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 32 '#1="failed") (|Union| 28 '#1#) (|Matrix| 7)
              (|Record| (|:| |mat| 38) (|:| |vec| (|Vector| 7))) (|List| $)
              (|List| 42) (|SingletonAsOrderedSet|) (|List| 15)
              (|Union| 42 '"failed") (|Mapping| 15 15) (|List| 7)
              (|Union| 7 '#1#) (|Mapping| 7 7) (|PositiveInteger|)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 29 |zero?| 35 |variables| 40 |unitNormal| 45 |unitCanonical|
              50 |unit?| 55 |totalDegreeSorted| 60 |totalDegree| 66
              |subtractIfCan| 77 |smaller?| 83 |sample| 89 |right_ext_ext_GCD|
              93 |rightRemainder| 99 |rightRecip| 105 |rightQuotient| 110
              |rightPower| 116 |rightLcm| 128 |rightGcd| 134 |rightExtendedGcd|
              140 |rightExactQuotient| 146 |rightDivide| 152 |retractIfCan| 158
              |retract| 173 |reductum| 188 |reducedSystem| 193 |recip| 215
              |primitivePart| 220 |primitiveMonomials| 225 |pomopo!| 230
              |opposite?| 238 |one?| 244 |numberOfMonomials| 249 |monomials|
              254 |monomial?| 259 |monomial| 264 |monicRightDivide| 284
              |monicLeftDivide| 290 |minimumDegree| 296 |mapExponents| 301
              |map| 307 |mainVariable| 313 |leftRemainder| 318 |leftRecip| 324
              |leftQuotient| 329 |leftPower| 335 |leftLcm| 347 |leftGcd| 353
              |leftExtendedGcd| 359 |leftExactQuotient| 365 |leftDivide| 371
              |leadingMonomial| 377 |leadingCoefficient| 382 |latex| 387
              |hashUpdate!| 392 |hash| 398 |ground?| 403 |ground| 408 |fmecg|
              413 |exquo| 421 |degree| 433 |content| 450 |commutator| 455
              |coerce| 461 |coefficients| 491 |coefficient| 496 |charthRoot|
              516 |characteristic| 521 |binomThmExpt| 525 |associator| 532
              |associates?| 539 |apply| 545 |antiCommutator| 552 |annihilate?|
              558 ^ 564 |Zero| 576 |One| 580 = 584 / 590 - 596 + 607 * 613)
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
              '#((|UnivariateSkewPolynomialCategory| 7)
                 (|MaybeSkewPolynomialCategory| 7 15 42)
                 (|FiniteAbelianMonoidRing| 7 15) (|AbelianMonoidRing| 7 15)
                 (|FullyLinearlyExplicitOver| 7) (|Algebra| 32)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|LinearlyExplicitOver| 7)
                 (|LinearlyExplicitOver| 28) (|Algebra| 7) (|Ring|) (|Rng|)
                 (|SemiRing|) (|SemiRng|) (|Module| 32) (|Module| 7)
                 (|BiModule| 7 7) (|BiModule| $$ $$) (|BiModule| 32 32)
                 (|NonAssociativeRing|) (|LeftModule| 7) (|RightModule| 7)
                 (|RightModule| $$) (|LeftModule| $$) (|LeftModule| 32)
                 (|RightModule| 32) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|Magma|)
                 (|AbelianSemiGroup|) (|Comparable|) (|FullyRetractableTo| 7)
                 (|SetCategory|) (|RetractableTo| 7) (|BasicType|)
                 (|CoercibleTo| 20) (|noZeroDivisors|) (|RetractableTo| 32)
                 (|RetractableTo| 28) (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 52
                                  '(0 11 0 12 0 0 0 13 0 7 0 14 2 0 0 7 15 16 1
                                    20 0 19 21 2 10 20 0 20 22 2 0 29 0 0 1 1
                                    30 29 0 1 1 0 41 0 1 1 26 31 0 1 1 26 0 0 1
                                    1 26 29 0 1 2 0 15 0 41 1 1 0 15 0 1 2 0 15
                                    0 41 1 2 31 30 0 0 1 2 8 29 0 0 1 0 30 0 1
                                    2 19 34 0 0 1 2 19 0 0 0 1 1 28 30 0 1 2 19
                                    0 0 0 1 2 28 0 0 15 1 2 0 0 0 49 1 2 19 0 0
                                    0 1 2 19 0 0 0 1 2 19 33 0 0 1 2 19 30 0 0
                                    1 2 19 35 0 0 1 1 5 36 0 1 1 6 37 0 1 1 0
                                    47 0 1 1 5 32 0 1 1 6 28 0 1 1 0 7 0 1 1 0
                                    0 0 1 2 18 24 25 26 1 1 18 27 25 1 1 9 38
                                    25 1 2 9 39 25 26 1 1 28 30 0 1 1 17 0 0 1
                                    1 14 40 0 1 4 0 0 0 7 15 0 1 2 30 29 0 0 1
                                    1 28 29 0 1 1 0 15 0 1 1 0 40 0 1 1 0 29 0
                                    1 3 0 0 0 42 15 1 3 0 0 0 41 43 1 2 0 0 7
                                    15 16 2 15 35 0 0 1 2 15 35 0 0 1 1 0 15 0
                                    1 2 0 0 45 0 1 2 0 0 48 0 1 1 0 44 0 1 2 19
                                    0 0 0 1 1 28 30 0 1 2 19 0 0 0 1 2 28 0 0
                                    15 1 2 0 0 0 49 1 2 19 0 0 0 1 2 19 0 0 0 1
                                    2 19 33 0 0 1 2 19 30 0 0 1 2 19 35 0 0 1 1
                                    0 0 0 1 1 0 7 0 1 1 0 51 0 1 2 0 50 50 0 1
                                    1 0 52 0 1 1 0 29 0 1 1 0 7 0 1 4 9 0 0 15
                                    7 0 1 2 26 30 0 0 1 2 4 30 0 7 1 2 0 43 0
                                    41 1 2 0 15 0 42 1 1 0 15 0 1 1 17 7 0 1 2
                                    29 0 0 0 1 1 27 0 28 1 1 24 0 0 1 1 16 0 32
                                    1 1 0 0 17 18 1 0 0 7 1 1 0 20 0 23 1 0 46
                                    0 1 3 0 0 0 41 43 1 3 0 0 0 42 15 1 2 0 7 0
                                    15 1 1 2 30 0 1 0 29 15 1 3 25 0 0 0 15 1 3
                                    29 0 0 0 0 1 2 26 29 0 0 1 3 0 7 0 7 7 1 2
                                    0 0 0 0 1 2 29 29 0 0 1 2 28 0 0 15 1 2 0 0
                                    0 49 1 0 30 0 1 0 28 0 13 2 0 29 0 0 1 2 19
                                    0 0 7 1 2 32 0 0 0 1 1 32 0 0 1 2 0 0 0 0 1
                                    2 32 0 28 0 1 2 30 0 15 0 1 2 1 0 0 32 1 2
                                    1 0 32 0 1 2 0 0 7 0 1 2 0 0 0 7 1 2 0 0 0
                                    0 1 2 0 0 49 0 1)))))
           '|lookupComplete|)) 
