
(SDEFUN |PDO;adjoint;2$;1| ((|x| $) ($ $))
        (SPROG
         ((|xu| (|Sup|)) (|res| ($)) (|sign| ($)) (|d| (|NonNegativeInteger|))
          (|v| (|Var|)) (#1=#:G387 NIL))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 15)) |x|)
                ('T
                 (SEQ
                  (LETT |v|
                        (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 17)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                          (|Union| (QREFELT $ 7) "failed")
                                          #1#)))
                  (LETT |xu| (SPADCALL |x| |v| (QREFELT $ 20)))
                  (LETT |res| (|spadConstant| $ 21))
                  (LETT |xu| (SPADCALL (ELT $ 22) |xu| (QREFELT $ 24)))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |xu| (|spadConstant| $ 26) (QREFELT $ 27)))
                         (GO G191)))
                       (SEQ (LETT |d| (SPADCALL |xu| (QREFELT $ 29)))
                            (LETT |sign|
                                  (COND
                                   ((ODDP |d|)
                                    (SPADCALL (|spadConstant| $ 30)
                                              (QREFELT $ 32)))
                                   ('T (|spadConstant| $ 30))))
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL |sign|
                                                       (SPADCALL
                                                        (|spadConstant| $ 30)
                                                        |v| |d| (QREFELT $ 33))
                                                       (QREFELT $ 34))
                                             (SPADCALL |xu| (QREFELT $ 35))
                                             (QREFELT $ 34))
                                            (QREFELT $ 36)))
                            (EXIT (LETT |xu| (SPADCALL |xu| (QREFELT $ 37)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))) 

(DECLAIM (NOTINLINE |PartialDifferentialOperator;|)) 

(DEFUN |PartialDifferentialOperator| (&REST #1=#:G415)
  (SPROG NIL
         (PROG (#2=#:G416)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PartialDifferentialOperator|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |PartialDifferentialOperator;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PartialDifferentialOperator|)))))))))) 

(DEFUN |PartialDifferentialOperator;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G412 NIL) (#2=#:G413 NIL) (#3=#:G414 NIL) ($ NIL)
    (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|PartialDifferentialOperator| DV$1 DV$2))
    (LETT $ (GETREFV 62))
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
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|LeftOreRing|)))
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
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #3# (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
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
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|)))
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
                                         #1# #2#)))))
    (|haddProp| |$ConstructorCache| '|PartialDifferentialOperator|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 16777216))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 33554432))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR #2#
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR #1#
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 4294967296))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 13 (|SparseUnivariatePolynomial| $))
    $))) 

(MAKEPROP '|PartialDifferentialOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseMultivariateSkewPolynomial| 6 7 (NRTEVAL (ELT $ 10))
                                                  (NRTEVAL (ELT $ 12)))
              (|local| |#1|) (|local| |#2|) (|Automorphism| 6)
              (|PartialDifferentialOperatorHelper| 6 7) (0 . |id_map|)
              (|Mapping| 6 6) (5 . |diff_map|) '|Sup| (|Boolean|)
              (10 . |ground?|) (|Union| 7 '"failed") (15 . |mainVariable|)
              (|SparseUnivariatePolynomial| $)
              (|SparseMultivariatePolynomial| 6 7) (20 . |univariate|)
              (26 . |Zero|) |PDO;adjoint;2$;1| (|Mapping| $$ $$) (30 . |map|)
              (36 . |Zero|) (40 . |Zero|) (44 . ~=) (|NonNegativeInteger|)
              (50 . |degree|) (55 . |One|) (59 . |One|) (63 . -)
              (68 . |monomial|) (75 . *) (81 . |leadingCoefficient|) (86 . +)
              (92 . |reductum|)
              (|Record| (|:| |mat| 41) (|:| |vec| (|Vector| 42))) (|Matrix| $)
              (|Vector| $) (|Matrix| 42) (|Integer|) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 42) (|Union| 45 '#1="failed") (|Union| 42 '#1#)
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|IndexedExponents| 7) (|List| $) (|List| 7) (|List| 28)
              (|Mapping| 50 50) (|List| 6) (|Union| 6 '#1#) (|PositiveInteger|)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 97 |zero?| 103 |variables| 108 |unitNormal| 113
              |unitCanonical| 118 |unit?| 123 |totalDegreeSorted| 128
              |totalDegree| 134 |subtractIfCan| 145 |smaller?| 151 |sample| 157
              |rightRecip| 161 |rightPower| 166 |retractIfCan| 178 |retract|
              193 |reductum| 208 |reducedSystem| 213 |recip| 235
              |primitivePart| 240 |primitiveMonomials| 245 |pomopo!| 250
              |opposite?| 258 |one?| 264 |numberOfMonomials| 269 |monomials|
              274 |monomial?| 279 |monomial| 284 |minimumDegree| 304
              |mapExponents| 309 |map| 315 |mainVariable| 321 |leftRecip| 326
              |leftPower| 331 |leadingMonomial| 343 |leadingCoefficient| 348
              |latex| 353 |hashUpdate!| 358 |hash| 364 |ground?| 369 |ground|
              374 |fmecg| 379 |exquo| 387 |degree| 399 |content| 416
              |commutator| 421 |coerce| 427 |coefficients| 452 |coefficient|
              457 |charthRoot| 477 |characteristic| 482 |binomThmExpt| 486
              |associator| 493 |associates?| 500 |antiCommutator| 506
              |annihilate?| 512 |adjoint| 518 ^ 523 |Zero| 535 |One| 539 D 543
              = 548 / 554 - 560 + 571 * 577)
           'NIL
           (CONS
            (|makeByteWordVec2| 24
                                '(0 0 0 0 9 1 2 3 4 9 10 11 12 12 14 0 1 0 0 1
                                  9 0 0 0 0 1 1 12 13 22 14 14 0 0 24 14 0 0 8
                                  0 0 0 0 0 4 5 6 7 9))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |FullyLinearlyExplicitOver&| |Algebra&|
                NIL NIL |EntireRing&| NIL NIL NIL NIL |Rng&| NIL NIL |Module&|
                NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |Magma&| |AbelianSemiGroup&| NIL |FullyRetractableTo&|
                |SetCategory&| |RetractableTo&| |BasicType&| NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|FullyLinearlyExplicitOver| 6) (|Algebra| 45)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 42)
                 (|SolvableSkewPolynomialCategory| 6 (|IndexedExponents| 7))
                 (|Ring|) (|Rng|) (|SemiRing|) (|SemiRng|) (|Module| 45)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 45 45)
                 (|NonAssociativeRing|) (|LeftModule| 6) (|RightModule| 6)
                 (|RightModule| $$) (|LeftModule| $$) (|LeftModule| 45)
                 (|RightModule| 45) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|Magma|)
                 (|AbelianSemiGroup|) (|Comparable|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 61) (|noZeroDivisors|) (|RetractableTo| 45)
                 (|RetractableTo| 42) (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 61
                                  '(1 9 8 7 10 1 9 11 7 12 1 0 14 0 15 1 0 16 0
                                    17 2 19 18 0 7 20 0 0 0 21 2 13 0 23 0 24 0
                                    6 0 25 0 13 0 26 2 13 14 0 0 27 1 13 28 0
                                    29 0 0 0 30 0 6 0 31 1 0 0 0 32 3 0 0 0 7
                                    28 33 2 0 0 0 0 34 1 13 2 0 35 2 0 0 0 0 36
                                    1 13 0 0 37 2 0 14 0 0 1 1 30 14 0 1 1 0 52
                                    0 1 1 27 44 0 1 1 27 0 0 1 1 27 14 0 1 2 0
                                    28 0 52 1 2 0 28 0 52 1 1 0 28 0 1 2 29 43
                                    0 0 1 2 8 14 0 0 1 0 30 0 1 1 31 43 0 1 2
                                    31 0 0 28 1 2 0 0 0 57 1 1 5 46 0 1 1 6 47
                                    0 1 1 0 56 0 1 1 5 45 0 1 1 6 42 0 1 1 0 6
                                    0 1 1 0 0 0 1 2 20 38 39 40 1 1 20 41 39 1
                                    2 9 48 39 40 1 1 9 49 39 1 1 31 43 0 1 1 19
                                    0 0 1 1 14 51 0 1 4 0 0 0 6 50 0 1 2 30 14
                                    0 0 1 1 31 14 0 1 1 0 28 0 1 1 0 51 0 1 1 0
                                    14 0 1 3 0 0 0 52 53 1 3 0 0 0 7 28 33 2 0
                                    0 6 50 1 1 0 50 0 1 2 0 0 54 0 1 2 0 0 11 0
                                    1 1 0 16 0 17 1 31 43 0 1 2 31 0 0 28 1 2 0
                                    0 0 57 1 1 0 0 0 1 1 0 6 0 1 1 0 58 0 1 2 0
                                    60 60 0 1 1 0 59 0 1 1 0 14 0 15 1 0 6 0 1
                                    4 9 0 0 50 6 0 1 2 27 43 0 0 1 2 4 43 0 6 1
                                    2 0 53 0 52 1 2 0 28 0 7 1 1 0 50 0 1 1 19
                                    6 0 1 2 33 0 0 0 1 1 32 0 42 1 1 25 0 0 1 1
                                    18 0 45 1 1 0 0 6 1 1 0 61 0 1 1 0 55 0 1 3
                                    0 0 0 52 53 1 3 0 0 0 7 28 1 2 0 6 0 50 1 1
                                    2 43 0 1 0 33 28 1 3 26 0 0 0 28 1 3 33 0 0
                                    0 0 1 2 27 14 0 0 1 2 0 0 0 0 1 2 33 14 0 0
                                    1 1 0 0 0 22 2 31 0 0 28 1 2 0 0 0 57 1 0
                                    30 0 21 0 31 0 30 1 0 0 7 1 2 0 14 0 0 1 2
                                    15 0 0 6 1 2 28 0 0 0 1 1 28 0 0 32 2 0 0 0
                                    0 36 2 28 0 42 0 1 2 30 0 28 0 1 2 1 0 45 0
                                    1 2 1 0 0 45 1 2 0 0 6 0 1 2 0 0 0 6 1 2 0
                                    0 0 0 34 2 0 0 57 0 1)))))
           '|lookupComplete|)) 
