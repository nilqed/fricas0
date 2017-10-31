
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

(DEFUN |SparseUnivariateSkewPolynomial| (&REST #1=#:G746)
  (SPROG NIL
         (PROG (#2=#:G747)
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
   ((|pv$| NIL) (#1=#:G742 NIL) (#2=#:G743 NIL) (#3=#:G744 NIL) (#4=#:G745 NIL)
    ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|SparseUnivariateSkewPolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT DV$3 (|devaluate| |#3|) . #5#)
    (LETT |dv$| (LIST '|SparseUnivariateSkewPolynomial| DV$1 DV$2 DV$3) . #5#)
    (LETT $ (GETREFV 63) . #5#)
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
                                        (|HasCategory| |#1| '(|Field|))
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
                                         (|HasCategory| |#1| '(|Ring|)))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|SparseUnivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
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
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 29
                 (CONS (|dispatchFunction| |ORESUP;monicLeftDivide;2$R;6|) $))
       (QSETREFV $ 31
                 (CONS (|dispatchFunction| |ORESUP;monicRightDivide;2$R;7|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 22)
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
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Union| 44 '#1="failed") (|Union| 40 '#1#)
              (|Record| (|:| |mat| 50) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|List| $) (|OutputForm|) (|List| 56) (|List| 14)
              (|Union| 56 '"failed") (|SingletonAsOrderedSet|)
              (|Mapping| 14 14) (|List| 6) (|Union| 6 '#1#) (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 89 |zero?| 95 |variables| 100 |unitNormal| 105 |unitCanonical|
              110 |unit?| 115 |totalDegreeSorted| 120 |totalDegree| 126
              |subtractIfCan| 137 |smaller?| 143 |sample| 149
              |right_ext_ext_GCD| 153 |rightRemainder| 159 |rightQuotient| 165
              |rightLcm| 171 |rightGcd| 177 |rightExtendedGcd| 183
              |rightExactQuotient| 189 |rightDivide| 195 |retractIfCan| 201
              |retract| 216 |reductum| 231 |reducedSystem| 236 |recip| 258
              |primitivePart| 263 |primitiveMonomials| 268 |pomopo!| 273
              |outputForm| 281 |opposite?| 287 |one?| 293 |numberOfMonomials|
              298 |monomials| 303 |monomial?| 308 |monomial| 313
              |monicRightDivide| 333 |monicLeftDivide| 339 |minimumDegree| 345
              |mapExponents| 350 |map| 356 |mainVariable| 362 |leftRemainder|
              367 |leftQuotient| 373 |leftLcm| 379 |leftGcd| 385
              |leftExtendedGcd| 391 |leftExactQuotient| 397 |leftDivide| 403
              |leadingMonomial| 409 |leadingCoefficient| 414 |latex| 419
              |hashUpdate!| 424 |hash| 430 |ground?| 435 |ground| 440 |fmecg|
              445 |exquo| 453 |degree| 465 |content| 482 |coerce| 487
              |coefficients| 512 |coefficient| 517 |charthRoot| 537
              |characteristic| 542 |binomThmExpt| 546 |associates?| 553 |apply|
              559 |annihilate?| 566 ^ 572 |Zero| 584 |One| 588 = 592 / 598 -
              604 + 615 * 621)
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
              '#((|UnivariateSkewPolynomialCategory| 6)
                 (|MaybeSkewPolynomialCategory| 6 14 56)
                 (|FiniteAbelianMonoidRing| 6 14) (|AbelianMonoidRing| 6 14)
                 (|IntegralDomain|) (|Algebra| 44) (|Algebra| $$)
                 (|FullyLinearlyExplicitOver| 6) (|Algebra| 6) (|Module| 44)
                 (|CommutativeRing|) (|Module| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|EntireRing|)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 40)
                 (|Module| 6) (|BiModule| 6 6) (|BiModule| 44 44)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 44) (|RightModule| 44) (|RightModule| $$)
                 (|Rng|) (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|SemiRng|)
                 (|AbelianMonoid|) (|Monoid|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|Comparable|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 52) (|CommutativeStar|) (|noZeroDivisors|)
                 (|RetractableTo| 44) (|RetractableTo| 40)
                 (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 62
                                  '(2 10 2 2 9 11 0 0 0 13 4 18 2 2 2 16 17 19
                                    0 16 0 21 2 0 0 6 0 22 5 18 6 2 6 6 16 17
                                    24 3 18 26 2 2 16 27 2 0 28 0 0 29 3 18 26
                                    2 2 16 30 2 0 28 0 0 31 3 18 26 2 2 16 32 2
                                    0 28 0 0 33 3 18 26 2 2 16 34 2 0 28 0 0 35
                                    2 0 41 0 0 1 1 37 41 0 1 1 0 53 0 1 1 31 43
                                    0 1 1 31 0 0 1 1 31 41 0 1 2 0 14 0 53 1 2
                                    0 14 0 53 1 1 0 14 0 1 2 36 42 0 0 1 2 9 41
                                    0 0 1 0 37 0 1 2 22 45 0 0 1 2 22 0 0 0 1 2
                                    22 0 0 0 1 2 22 0 0 0 1 2 22 0 0 0 1 2 22
                                    46 0 0 1 2 22 42 0 0 1 2 22 28 0 0 35 1 6
                                    47 0 1 1 7 48 0 1 1 0 59 0 1 1 6 44 0 1 1 7
                                    40 0 1 1 0 6 0 1 1 0 0 0 1 2 21 36 37 38 1
                                    1 21 39 37 1 2 10 49 37 38 1 1 10 50 37 1 1
                                    33 42 0 1 1 20 0 0 1 1 17 51 0 1 4 0 0 0 6
                                    14 0 1 2 0 52 0 52 1 2 37 41 0 0 1 1 33 41
                                    0 1 1 0 14 0 1 1 0 51 0 1 1 0 41 0 1 3 0 0
                                    0 53 54 1 3 0 0 0 56 14 1 2 0 0 6 14 1 2 2
                                    28 0 0 31 2 2 28 0 0 29 1 0 14 0 1 2 0 0 57
                                    0 1 2 0 0 17 0 1 1 0 55 0 1 2 22 0 0 0 1 2
                                    22 0 0 0 1 2 22 0 0 0 1 2 22 0 0 0 1 2 22
                                    46 0 0 1 2 22 42 0 0 1 2 22 28 0 0 33 1 0 0
                                    0 1 1 0 6 0 1 1 0 61 0 1 2 0 60 60 0 1 1 0
                                    62 0 1 1 0 41 0 1 1 0 6 0 1 4 10 0 0 14 6 0
                                    1 2 31 42 0 0 1 2 5 42 0 6 1 2 0 14 0 56 1
                                    2 0 54 0 53 1 1 0 14 0 1 1 20 6 0 1 1 29 0
                                    0 1 1 32 0 40 1 1 19 0 44 1 1 0 0 6 1 1 0
                                    52 0 1 1 0 58 0 1 3 0 0 0 53 54 1 3 0 0 0
                                    56 14 1 2 0 6 0 14 1 1 3 42 0 1 0 34 14 1 3
                                    30 0 0 0 14 1 2 31 41 0 0 1 3 0 6 0 6 6 25
                                    2 34 41 0 0 1 2 33 0 0 14 15 2 0 0 0 9 12 0
                                    37 0 1 0 33 0 13 2 0 41 0 0 1 2 22 0 0 6 1
                                    2 35 0 0 0 1 1 35 0 0 1 2 0 0 0 0 1 2 35 0
                                    40 0 1 2 37 0 14 0 1 2 1 0 0 44 1 2 1 0 44
                                    0 1 2 0 0 0 6 23 2 0 0 6 0 22 2 0 0 0 0 20
                                    2 0 0 9 0 1)))))
           '|lookupComplete|)) 
