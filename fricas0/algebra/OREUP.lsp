
(SDEFUN |OREUP;coerce;V$;1| ((|v| |Variable| |x|) ($ $))
        (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 16))) 

(SDEFUN |OREUP;coerce;$Of;2| ((|p| $) ($ |OutputForm|))
        (SPADCALL |p| (SPADCALL (QREFELT $ 6) (QREFELT $ 21)) (QREFELT $ 22))) 

(DECLAIM (NOTINLINE |UnivariateSkewPolynomial;|)) 

(DEFUN |UnivariateSkewPolynomial| (&REST #1=#:G735)
  (SPROG NIL
         (PROG (#2=#:G736)
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
   ((|pv$| NIL) (#1=#:G731 NIL) (#2=#:G732 NIL) (#3=#:G733 NIL) (#4=#:G734 NIL)
    ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|UnivariateSkewPolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT DV$3 (|devaluate| |#3|) . #5#)
    (LETT DV$4 (|devaluate| |#4|) . #5#)
    (LETT |dv$| (LIST '|UnivariateSkewPolynomial| DV$1 DV$2 DV$3 DV$4) . #5#)
    (LETT $ (GETREFV 53) . #5#)
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
                                                       '(|IntegralDomain|))
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
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              . #5#)
                                        (OR #4#
                                            (|HasCategory| |#2|
                                                           '(|IntegralDomain|)))
                                        (OR #4#
                                            (|HasCategory| |#2|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#2|
                                                           '(|IntegralDomain|)))
                                        (OR #4#
                                            (|HasCategory| |#2|
                                                           '(|EntireRing|)))
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
                                         #4#
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (OR #4#
                                            (|HasCategory| |#2|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#2|
                                                           '(|IntegralDomain|))
                                            (|HasCategory| |#2| '(|Ring|)))
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
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #3#
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #3# #2#
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #3# #1# #2#
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#2| '(|Ring|)))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|UnivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND (|HasCategory| |#2| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 268435456))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 536870912))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR #3# (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 17179869184))
    (AND
     (OR #2# (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 34359738368))
    (AND
     (OR #1# (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 68719476736))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (|SparseUnivariateSkewPolynomial| |#2| |#3| |#4|))
    $))) 

(MAKEPROP '|UnivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariateSkewPolynomial| 7 8 9)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Automorphism| 7) (0 . |One|) (4 . |One|) (8 . |One|)
              (|NonNegativeInteger|) (12 . |monomial|) (|Variable| 6)
              |OREUP;coerce;V$;1| (|Symbol|) (|OutputForm|) (18 . |outputForm|)
              (23 . |outputForm|) |OREUP;coerce;$Of;2|
              (|Record| (|:| |mat| 27) (|:| |vec| (|Vector| 28))) (|Matrix| $)
              (|Vector| $) (|Matrix| 28) (|Integer|) (|Boolean|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 28)
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 32 '#1="failed") (|Union| 28 '#1#)
              (|Record| (|:| |mat| 39) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|List| $) (|List| 44) (|List| 15) (|Union| 44 '"failed")
              (|SingletonAsOrderedSet|) (|Mapping| 15 15) (|List| 7)
              (|Union| 7 '#1#) (|Mapping| 7 7) (|PositiveInteger|)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 29 |zero?| 35 |variables| 40 |unitNormal| 45 |unitCanonical|
              50 |unit?| 55 |totalDegreeSorted| 60 |totalDegree| 66
              |subtractIfCan| 77 |smaller?| 83 |sample| 89 |right_ext_ext_GCD|
              93 |rightRemainder| 99 |rightQuotient| 105 |rightLcm| 111
              |rightGcd| 117 |rightExtendedGcd| 123 |rightExactQuotient| 129
              |rightDivide| 135 |retractIfCan| 141 |retract| 156 |reductum| 171
              |reducedSystem| 176 |recip| 198 |primitivePart| 203
              |primitiveMonomials| 208 |pomopo!| 213 |opposite?| 221 |one?| 227
              |numberOfMonomials| 232 |monomials| 237 |monomial?| 242
              |monomial| 247 |monicRightDivide| 267 |monicLeftDivide| 273
              |minimumDegree| 279 |mapExponents| 284 |map| 290 |mainVariable|
              296 |leftRemainder| 301 |leftQuotient| 307 |leftLcm| 313
              |leftGcd| 319 |leftExtendedGcd| 325 |leftExactQuotient| 331
              |leftDivide| 337 |leadingMonomial| 343 |leadingCoefficient| 348
              |latex| 353 |hashUpdate!| 358 |hash| 364 |ground?| 369 |ground|
              374 |fmecg| 379 |exquo| 387 |degree| 399 |content| 416 |coerce|
              421 |coefficients| 451 |coefficient| 456 |charthRoot| 476
              |characteristic| 481 |binomThmExpt| 485 |associates?| 492 |apply|
              498 |annihilate?| 505 ^ 511 |Zero| 523 |One| 527 = 531 / 537 -
              543 + 554 * 560)
           'NIL
           (CONS
            (|makeByteWordVec2| 28
                                '(0 0 0 0 2 1 2 10 12 1 13 2 3 4 5 10 11 12 0 1
                                  14 16 0 0 1 1 15 16 18 24 26 17 0 28 17 0 0 9
                                  0 0 0 0 0 13 5 6 7 8 10))
            (CONS
             '#(|UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| NIL |Algebra&| |Algebra&|
                |FullyLinearlyExplicitOver&| |Algebra&| |Module&| NIL |Module&|
                NIL NIL |EntireRing&| NIL NIL |Module&| NIL NIL NIL |Ring&| NIL
                NIL NIL NIL NIL |Rng&| NIL |AbelianGroup&| NIL NIL NIL
                |AbelianMonoid&| |Monoid&| |AbelianSemiGroup&| |SemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| |RetractableTo&|
                |BasicType&| NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL
                NIL)
             (CONS
              '#((|UnivariateSkewPolynomialCategory| 7)
                 (|MaybeSkewPolynomialCategory| 7 15 44)
                 (|FiniteAbelianMonoidRing| 7 15) (|AbelianMonoidRing| 7 15)
                 (|IntegralDomain|) (|Algebra| 32) (|Algebra| $$)
                 (|FullyLinearlyExplicitOver| 7) (|Algebra| 7) (|Module| 32)
                 (|CommutativeRing|) (|Module| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|EntireRing|)
                 (|LinearlyExplicitOver| 7) (|LinearlyExplicitOver| 28)
                 (|Module| 7) (|BiModule| 7 7) (|BiModule| 32 32)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 7) (|RightModule| 7)
                 (|LeftModule| 32) (|RightModule| 32) (|RightModule| $$)
                 (|Rng|) (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|SemiRng|)
                 (|AbelianMonoid|) (|Monoid|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|Comparable|) (|FullyRetractableTo| 7)
                 (|SetCategory|) (|RetractableTo| 7) (|BasicType|)
                 (|CoercibleTo| 20) (|CommutativeStar|) (|noZeroDivisors|)
                 (|RetractableTo| 32) (|RetractableTo| 28)
                 (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 52
                                  '(0 11 0 12 0 0 0 13 0 7 0 14 2 0 0 7 15 16 1
                                    20 0 19 21 2 10 20 0 20 22 2 0 29 0 0 1 1
                                    37 29 0 1 1 0 41 0 1 1 31 31 0 1 1 31 0 0 1
                                    1 31 29 0 1 2 0 15 0 41 1 2 0 15 0 41 1 1 0
                                    15 0 1 2 36 30 0 0 1 2 9 29 0 0 1 0 37 0 1
                                    2 22 33 0 0 1 2 22 0 0 0 1 2 22 0 0 0 1 2
                                    22 0 0 0 1 2 22 0 0 0 1 2 22 34 0 0 1 2 22
                                    30 0 0 1 2 22 35 0 0 1 1 6 36 0 1 1 7 37 0
                                    1 1 0 47 0 1 1 6 32 0 1 1 7 28 0 1 1 0 7 0
                                    1 1 0 0 0 1 2 21 24 25 26 1 1 21 27 25 1 2
                                    10 38 25 26 1 1 10 39 25 1 1 33 30 0 1 1 20
                                    0 0 1 1 17 40 0 1 4 0 0 0 7 15 0 1 2 37 29
                                    0 0 1 1 33 29 0 1 1 0 15 0 1 1 0 40 0 1 1 0
                                    29 0 1 3 0 0 0 41 42 1 3 0 0 0 44 15 1 2 0
                                    0 7 15 16 2 2 35 0 0 1 2 2 35 0 0 1 1 0 15
                                    0 1 2 0 0 45 0 1 2 0 0 48 0 1 1 0 43 0 1 2
                                    22 0 0 0 1 2 22 0 0 0 1 2 22 0 0 0 1 2 22 0
                                    0 0 1 2 22 34 0 0 1 2 22 30 0 0 1 2 22 35 0
                                    0 1 1 0 0 0 1 1 0 7 0 1 1 0 51 0 1 2 0 50
                                    50 0 1 1 0 52 0 1 1 0 29 0 1 1 0 7 0 1 4 10
                                    0 0 15 7 0 1 2 31 30 0 0 1 2 5 30 0 7 1 2 0
                                    15 0 44 1 2 0 42 0 41 1 1 0 15 0 1 1 20 7 0
                                    1 1 29 0 0 1 1 32 0 28 1 1 19 0 32 1 1 0 0
                                    17 18 1 0 0 7 1 1 0 20 0 23 1 0 46 0 1 3 0
                                    0 0 41 42 1 3 0 0 0 44 15 1 2 0 7 0 15 1 1
                                    3 30 0 1 0 34 15 1 3 30 0 0 0 15 1 2 31 29
                                    0 0 1 3 0 7 0 7 7 1 2 34 29 0 0 1 2 33 0 0
                                    15 1 2 0 0 0 49 1 0 37 0 1 0 33 0 13 2 0 29
                                    0 0 1 2 22 0 0 7 1 2 35 0 0 0 1 1 35 0 0 1
                                    2 0 0 0 0 1 2 35 0 28 0 1 2 37 0 15 0 1 2 1
                                    0 0 32 1 2 1 0 32 0 1 2 0 0 0 7 1 2 0 0 7 0
                                    1 2 0 0 0 0 1 2 0 0 49 0 1)))))
           '|lookupComplete|)) 
