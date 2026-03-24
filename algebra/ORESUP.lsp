
(SDEFUN |ORESUP;^;%Pi%;1| ((|x| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 11))) 

(SDEFUN |ORESUP;^;%Nni%;2| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND ((ZEROP |n|) (|spadConstant| % 13))
              ('T (SPADCALL |x| |n| (QREFELT % 11))))) 

(SDEFUN |ORESUP;*;3%;3| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 7) (QREFELT % 8) (QREFELT % 19))) 

(SDEFUN |ORESUP;*;%R%;4| ((|x| (%)) (|r| (R)) (% (%)))
        (SPADCALL |x| (SPADCALL |r| (|spadConstant| % 13) (QREFELT % 22))
                  (QREFELT % 7) (QREFELT % 8) (QREFELT % 19))) 

(SDEFUN |ORESUP;apply;%3R;5| ((|p| (%)) (|c| (R)) (|r| (R)) (% (R)))
        (SPADCALL |p| |c| |r| (QREFELT % 7) (QREFELT % 8) (QREFELT % 24))) 

(SDEFUN |ORESUP;monicLeftDivide;2%R;6|
        ((|a| (%)) (|b| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPADCALL |a| |b| (QREFELT % 7) (QREFELT % 27))) 

(SDEFUN |ORESUP;monicRightDivide;2%R;7|
        ((|a| (%)) (|b| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPADCALL |a| |b| (QREFELT % 7) (QREFELT % 30))) 

(SDEFUN |ORESUP;leftDivide;2%R;8|
        ((|a| (%)) (|b| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPADCALL |a| |b| (QREFELT % 7) (QREFELT % 32))) 

(SDEFUN |ORESUP;rightDivide;2%R;9|
        ((|a| (%)) (|b| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPADCALL |a| |b| (QREFELT % 7) (QREFELT % 34))) 

(DECLAIM (NOTINLINE |SparseUnivariateSkewPolynomial;|)) 

(DEFUN |SparseUnivariateSkewPolynomial;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G45 NIL) (#2=#:G47 NIL) (#3=#:G46 NIL) (% NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|SparseUnivariateSkewPolynomial| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 64))
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
                                        (|HasCategory| |#1| '(|EntireRing|))
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
                                        (OR
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
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
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
                                        (|HasCategory| |#1| '(|Field|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #2#
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
                                          #3#)
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
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
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|SparseUnivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 134217728))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 536870912))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (|HasCategory| |#1| '(|CommutativeRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|AbelianMonoid|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #1#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 68719476736))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 15)
      (PROGN
       (QSETREFV % 29
                 (CONS (|dispatchFunction| |ORESUP;monicLeftDivide;2%R;6|) %))
       (QSETREFV % 31
                 (CONS (|dispatchFunction| |ORESUP;monicRightDivide;2%R;7|)
                       %)))))
    (COND
     ((|testBitVector| |pv$| 18)
      (PROGN
       (QSETREFV % 33 (CONS (|dispatchFunction| |ORESUP;leftDivide;2%R;8|) %))
       (QSETREFV % 35
                 (CONS (|dispatchFunction| |ORESUP;rightDivide;2%R;9|) %)))))
    %))) 

(DEFUN |SparseUnivariateSkewPolynomial| (&REST #1=#:G48)
  (SPROG NIL
         (PROG (#2=#:G49)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache|
                           '|SparseUnivariateSkewPolynomial|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseUnivariateSkewPolynomial;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariateSkewPolynomial|)))))))))) 

(MAKEPROP '|SparseUnivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|PositiveInteger|)
              (|RepeatedSquaring| $$) (0 . |expt|) |ORESUP;^;%Pi%;1|
              (6 . |One|) (|NonNegativeInteger|) |ORESUP;^;%Nni%;2|
              (|Automorphism| 6) (|Mapping| 6 6)
              (|UnivariateSkewPolynomialCategoryOps| 6 $$) (10 . |times|)
              |ORESUP;*;3%;3| (18 . |One|) (22 . *) |ORESUP;*;%R%;4|
              (28 . |apply|) |ORESUP;apply;%3R;5|
              (|Record| (|:| |quotient| $$) (|:| |remainder| $$))
              (37 . |monicLeftDivide|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (44 . |monicLeftDivide|) (50 . |monicRightDivide|)
              (57 . |monicRightDivide|) (63 . |leftDivide|) (70 . |leftDivide|)
              (76 . |rightDivide|) (83 . |rightDivide|) (|Boolean|) (|String|)
              (|OutputForm|) (|Record| (|:| |k| 14) (|:| |c| 6)) (|List| 39)
              (|List| %) (|List| 6) (|List| 14) (|Union| 6 '#1="failed")
              (|Mapping| 14 14) (|SingletonAsOrderedSet|) (|List| 46)
              (|Union| 46 '"failed") (|Integer|)
              (|Record| (|:| |mat| 53) (|:| |vec| (|Vector| 49))) (|Matrix| %)
              (|Vector| %) (|Matrix| 49) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 49) (|Mapping| 6 14)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |generator| %) (|:| |coef1| %) (|:| |coef2| %)
                        (|:| |coefu| %) (|:| |coefv| %))
              (|Union| 56 '#1#) (|Union| 49 '#1#)
              (|Record| (|:| |mat| 63) (|:| |vec| (|Vector| 6))) (|Matrix| 6))
           '#(~= 89 |zero?| 95 |variables| 100 |unitNormal| 105 |unitCanonical|
              110 |unit?| 115 |totalDegreeSorted| 120 |totalDegree| 126
              |support| 137 |subtractIfCan| 142 |smaller?| 148 |sample| 154
              |right_ext_ext_GCD| 158 |rightRemainder| 164 |rightRecip| 170
              |rightQuotient| 175 |rightPower| 181 |rightLcm| 193 |rightGcd|
              199 |rightExtendedGcd| 205 |rightExactQuotient| 211 |rightDivide|
              217 |retractIfCan| 223 |retract| 238 |reductum| 253
              |reducedSystem| 258 |recip| 280 |primitivePart| 285
              |primitiveMonomials| 290 |pomopo!| 295 |plenaryPower| 303
              |outputForm| 309 |opposite?| 315 |one?| 321 |numberOfMonomials|
              326 |monomials| 331 |monomial?| 336 |monomial| 341
              |monicRightDivide| 361 |monicLeftDivide| 367 |minimumDegree| 373
              |mapExponents| 378 |map| 384 |mainVariable| 390 |listOfTerms| 395
              |linearExtend| 400 |leftRemainder| 406 |leftRecip| 412
              |leftQuotient| 417 |leftPower| 423 |leftLcm| 435 |leftGcd| 441
              |leftExtendedGcd| 447 |leftExactQuotient| 453 |leftDivide| 459
              |leadingTerm| 465 |leadingSupport| 470 |leadingMonomial| 475
              |leadingCoefficient| 480 |latex| 485 |ground?| 490 |ground| 495
              |fmecg| 500 |exquo| 508 |degree| 520 |content| 537
              |constructOrdered| 542 |construct| 547 |commutator| 552 |coerce|
              558 |coefficients| 583 |coefficient| 588 |charthRoot| 608
              |characteristic| 613 |binomThmExpt| 617 |associator| 624
              |associates?| 631 |apply| 637 |antiCommutator| 644 |annihilate?|
              650 ^ 656 |Zero| 668 |One| 672 = 676 / 682 - 688 + 699 * 705)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 0 0 5 4 3 2 1 11 5 13 11 1 0 10 5 1 0 0
                                  10 21 10 1 0 0 0 11 21 1 1 0 0 0 0 0 12 13 13
                                  27 13 26 0 0 9 0 0 0 7 6 0 0 10 8 7 6 4 0 0
                                  0))
            (CONS
             '#(|UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |Algebra&| |EntireRing&| NIL NIL
                |Algebra&| NIL |NonAssociativeAlgebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&|
                NIL |NonAssociativeSemiRng&| NIL |AbelianSemiGroup&| |Magma&|
                |FullyRetractableTo&| |RetractableTo&| |RetractableTo&|
                |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|UnivariateSkewPolynomialCategory| 6)
                 (|MaybeSkewPolynomialCategory| 6 14 46)
                 (|FiniteAbelianMonoidRing| 6 14) (|AbelianMonoidRing| 6 14)
                 (|Algebra| 6) (|EntireRing|) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|Algebra| 56) (|Ring|)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 56) (|FreeModuleCategory| 6 14)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 56)
                 (|IndexedDirectProductCategory| 6 14) (|SemiRng|)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 49)
                 (|LinearlyExplicitOver| 6) (|BiModule| 56 56)
                 (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 14) (|NonAssociativeRng|)
                 (|RightModule| 49) (|RightModule| 56) (|LeftModule| 56)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 6) (|RetractableTo| 49)
                 (|RetractableTo| 56) (|SetCategory|) (|RetractableTo| 6)
                 (|unitsKnown|) (|canonicalUnitNormal|) (|CoercibleFrom| 49)
                 (|CoercibleFrom| 56) (|noZeroDivisors|) (|CoercibleTo| 38)
                 (|BasicType|) (|CoercibleFrom| 6))
              (|makeByteWordVec2| 63
                                  '(2 10 2 2 9 11 0 0 0 13 4 18 2 2 2 16 17 19
                                    0 16 0 21 2 0 0 6 0 22 5 18 6 2 6 6 16 17
                                    24 3 18 26 2 2 16 27 2 0 28 0 0 29 3 18 26
                                    2 2 16 30 2 0 28 0 0 31 3 18 26 2 2 16 32 2
                                    0 28 0 0 33 3 18 26 2 2 16 34 2 0 28 0 0 35
                                    2 0 36 0 0 1 1 35 36 0 1 1 0 47 0 1 1 30 55
                                    0 1 1 30 0 0 1 1 30 36 0 1 2 0 14 0 47 1 1
                                    0 14 0 1 2 0 14 0 47 1 1 0 43 0 1 2 36 54 0
                                    0 1 2 9 36 0 0 1 0 35 0 1 2 18 59 0 0 1 2
                                    18 0 0 0 1 1 33 54 0 1 2 18 0 0 0 1 2 0 0 0
                                    9 1 2 33 0 0 14 1 2 18 0 0 0 1 2 18 0 0 0 1
                                    2 18 58 0 0 1 2 18 54 0 0 1 2 18 28 0 0 35
                                    1 0 44 0 1 1 6 60 0 1 1 7 61 0 1 1 0 6 0 1
                                    1 6 56 0 1 1 7 49 0 1 1 14 0 0 1 2 20 50 51
                                    52 1 1 20 53 51 1 2 10 62 51 52 1 1 10 63
                                    51 1 1 33 54 0 1 1 17 0 0 1 1 13 41 0 1 4 0
                                    0 0 6 14 0 1 2 31 0 0 9 1 2 0 38 0 38 1 2
                                    35 36 0 0 1 1 33 36 0 1 1 0 14 0 1 1 0 41 0
                                    1 1 0 36 0 1 2 0 0 6 14 1 3 0 0 0 46 14 1 3
                                    0 0 0 47 43 1 2 15 28 0 0 31 2 15 28 0 0 29
                                    1 0 14 0 1 2 0 0 45 0 1 2 0 0 17 0 1 1 0 48
                                    0 1 1 0 40 0 1 2 5 6 57 0 1 2 18 0 0 0 1 1
                                    33 54 0 1 2 18 0 0 0 1 2 0 0 0 9 1 2 33 0 0
                                    14 1 2 18 0 0 0 1 2 18 0 0 0 1 2 18 58 0 0
                                    1 2 18 54 0 0 1 2 18 28 0 0 33 1 14 39 0 1
                                    1 14 14 0 1 1 14 0 0 1 1 14 6 0 1 1 0 37 0
                                    1 1 0 36 0 1 1 0 6 0 1 4 10 0 0 14 6 0 1 2
                                    30 54 0 0 1 2 4 54 0 6 1 1 0 14 0 1 2 0 14
                                    0 46 1 2 0 43 0 47 1 1 17 6 0 1 1 14 0 40 1
                                    1 0 0 40 1 2 34 0 0 0 1 1 0 38 0 1 1 0 0 6
                                    1 1 28 0 0 1 1 32 0 49 1 1 16 0 56 1 1 0 42
                                    0 1 2 0 6 0 14 1 3 0 0 0 47 43 1 3 0 0 0 46
                                    14 1 1 2 54 0 1 0 34 14 1 3 29 0 0 0 14 1 3
                                    34 0 0 0 0 1 2 30 36 0 0 1 3 0 6 0 6 6 25 2
                                    0 0 0 0 1 2 34 36 0 0 1 2 0 0 0 9 12 2 33 0
                                    0 14 15 0 35 0 1 0 33 0 13 2 0 36 0 0 1 2
                                    18 0 0 6 1 1 37 0 0 1 2 37 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 9 0 1 2 0 0 0 0 20 2 0 0 0 6 23 2
                                    0 0 6 0 22 2 20 0 0 49 1 2 37 0 49 0 1 2 35
                                    0 14 0 1 2 1 0 0 56 1 2 1 0 56 0 1)))))
           '|lookupComplete|)) 
