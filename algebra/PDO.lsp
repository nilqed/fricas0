
(SDEFUN |PDO;adjoint;2%;1| ((|x| (%)) (% (%)))
        (SPROG
         ((|xu| (|Sup|)) (|res| (%)) (|sign| (%)) (|d| (|NonNegativeInteger|))
          (|v| (|Var|)) (#1=#:G9 NIL))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 15)) |x|)
                ('T
                 (SEQ
                  (LETT |v|
                        (PROG2 (LETT #1# (SPADCALL |x| (QREFELT % 17)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                          (|Union| (QREFELT % 7) "failed")
                                          #1#)))
                  (LETT |xu| (SPADCALL |x| |v| (QREFELT % 20)))
                  (LETT |res| (|spadConstant| % 21))
                  (LETT |xu| (SPADCALL (ELT % 22) |xu| (QREFELT % 24)))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |xu| (|spadConstant| % 26) (QREFELT % 27)))
                         (GO G191)))
                       (SEQ (LETT |d| (SPADCALL |xu| (QREFELT % 29)))
                            (LETT |sign|
                                  (COND
                                   ((ODDP |d|)
                                    (SPADCALL (|spadConstant| % 30)
                                              (QREFELT % 32)))
                                   ('T (|spadConstant| % 30))))
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL |sign|
                                                       (SPADCALL
                                                        (|spadConstant| % 30)
                                                        |v| |d| (QREFELT % 33))
                                                       (QREFELT % 34))
                                             (SPADCALL |xu| (QREFELT % 35))
                                             (QREFELT % 34))
                                            (QREFELT % 36)))
                            (EXIT (LETT |xu| (SPADCALL |xu| (QREFELT % 37)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))) 

(DECLAIM (NOTINLINE |PartialDifferentialOperator;|)) 

(DEFUN |PartialDifferentialOperator;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G40 NIL) (#2=#:G41 NIL) (#3=#:G43 NIL) (#4=#:G42 NIL)
    (#5=#:G44 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|PartialDifferentialOperator| DV$1 DV$2))
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
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|LeftOreRing|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #5# (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory|
                                         (|IndexedExponents| |#2|)
                                         '(|Comparable|))
                                        (|HasCategory| |#1| '(|Field|))
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
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
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
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #4# #5#) #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
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
                                         #1# #2#)
                                        (OR #5#
                                            (|HasCategory|
                                             (|IndexedExponents| |#2|)
                                             '(|Comparable|)))))))
    (|haddProp| |$ConstructorCache| '|PartialDifferentialOperator|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 536870912))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1073741824))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #1#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 68719476736))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 137438953472))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 274877906944))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 13 (|SparseUnivariatePolynomial| %))
    %))) 

(DEFUN |PartialDifferentialOperator| (&REST #1=#:G45)
  (SPROG NIL
         (PROG (#2=#:G46)
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

(MAKEPROP '|PartialDifferentialOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseMultivariateSkewPolynomial| 6 7 (NRTEVAL (ELT % 10))
                                                  (NRTEVAL (ELT % 12)))
              (|local| |#1|) (|local| |#2|) (|Automorphism| 6)
              (|PartialDifferentialOperatorHelper| 6 7) (0 . |id_map|)
              (|Mapping| 6 6) (5 . |diff_map|) '|Sup| (|Boolean|)
              (10 . |ground?|) (|Union| 7 '"failed") (15 . |mainVariable|)
              (|SparseUnivariatePolynomial| %)
              (|SparseMultivariatePolynomial| 6 7) (20 . |univariate|)
              (26 . |Zero|) |PDO;adjoint;2%;1| (|Mapping| $$ $$) (30 . |map|)
              (36 . |Zero|) (40 . |Zero|) (44 . ~=) (|NonNegativeInteger|)
              (50 . |degree|) (55 . |One|) (59 . |One|) (63 . -)
              (68 . |monomial|) (75 . *) (81 . |leadingCoefficient|) (86 . +)
              (92 . |reductum|) (|String|) (|OutputForm|) (|PositiveInteger|)
              (|Record| (|:| |k| 43) (|:| |c| 6)) (|List| 41)
              (|IndexedExponents| 7) (|List| %) (|List| 6) (|List| 43)
              (|Union| 6 '#1="failed") (|Mapping| 43 43) (|List| 28) (|List| 7)
              (|Integer|) (|Record| (|:| |mat| 55) (|:| |vec| (|Vector| 51)))
              (|Matrix| %) (|Vector| %) (|Matrix| 51) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 51) (|Mapping| 6 43) (|Union| 58 '#1#)
              (|Union| 51 '#1#)
              (|Record| (|:| |mat| 63) (|:| |vec| (|Vector| 6))) (|Matrix| 6))
           '#(~= 97 |zero?| 103 |variables| 108 |unitNormal| 113
              |unitCanonical| 118 |unit?| 123 |totalDegreeSorted| 128
              |totalDegree| 134 |support| 145 |subtractIfCan| 150 |smaller?|
              156 |sample| 162 |rightRecip| 166 |rightPower| 171 |retractIfCan|
              183 |retract| 198 |reductum| 213 |reducedSystem| 218 |recip| 240
              |primitivePart| 245 |primitiveMonomials| 250 |pomopo!| 255
              |plenaryPower| 263 |opposite?| 269 |one?| 275 |numberOfMonomials|
              280 |monomials| 285 |monomial?| 290 |monomial| 295
              |minimumDegree| 315 |mapExponents| 320 |map| 326 |mainVariable|
              332 |listOfTerms| 337 |linearExtend| 342 |leftRecip| 348
              |leftPower| 353 |leadingTerm| 365 |leadingSupport| 370
              |leadingMonomial| 375 |leadingCoefficient| 380 |latex| 385
              |ground?| 390 |ground| 395 |fmecg| 400 |exquo| 408 |degree| 420
              |content| 437 |constructOrdered| 442 |construct| 447 |commutator|
              452 |coerce| 458 |coefficients| 483 |coefficient| 488
              |charthRoot| 508 |characteristic| 513 |binomThmExpt| 517
              |associator| 524 |associates?| 531 |antiCommutator| 537
              |annihilate?| 543 |adjoint| 549 ^ 554 |Zero| 566 |One| 570 D 574
              = 579 / 585 - 591 + 602 * 608)
           'NIL
           (CONS
            (|makeByteWordVec2| 28
                                '(0 0 0 0 11 4 3 2 1 12 14 12 1 0 10 5 1 0 0 10
                                  22 10 1 0 0 0 12 22 1 1 0 0 0 0 0 13 14 14 25
                                  14 28 0 0 9 0 0 0 7 6 0 0 10 8 7 6 4 0 0 0))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| NIL |EntireRing&| NIL NIL |Algebra&| NIL
                NIL |Rng&| |NonAssociativeAlgebra&| |FreeModuleCategory&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&|
                NIL |NonAssociativeSemiRng&| NIL |AbelianSemiGroup&| |Magma&|
                |FullyRetractableTo&| |RetractableTo&| |RetractableTo&|
                |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|SolvableSkewPolynomialCategory| 6 (|IndexedExponents| 7))
                 (|EntireRing|) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|Algebra| 58) (|Ring|) (|SemiRing|)
                 (|Rng|) (|NonAssociativeAlgebra| 58)
                 (|FreeModuleCategory| 6 (|IndexedExponents| 7))
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 58)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 7))
                 (|SemiRng|) (|NonAssociativeRing|) (|LinearlyExplicitOver| 51)
                 (|LinearlyExplicitOver| 6) (|BiModule| 58 58)
                 (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 7))
                 (|NonAssociativeRng|) (|RightModule| 51) (|RightModule| 58)
                 (|LeftModule| 58) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|Comparable|) (|AbelianSemiGroup|)
                 (|Magma|) (|FullyRetractableTo| 6) (|RetractableTo| 51)
                 (|RetractableTo| 58) (|SetCategory|) (|RetractableTo| 6)
                 (|unitsKnown|) (|canonicalUnitNormal|) (|CoercibleFrom| 51)
                 (|CoercibleFrom| 58) (|noZeroDivisors|) (|CoercibleTo| 39)
                 (|BasicType|) (|CoercibleFrom| 6))
              (|makeByteWordVec2| 63
                                  '(1 9 8 7 10 1 9 11 7 12 1 0 14 0 15 1 0 16 0
                                    17 2 19 18 0 7 20 0 0 0 21 2 13 0 23 0 24 0
                                    6 0 25 0 13 0 26 2 13 14 0 0 27 1 13 28 0
                                    29 0 0 0 30 0 6 0 31 1 0 0 0 32 3 0 0 0 7
                                    28 33 2 0 0 0 0 34 1 13 2 0 35 2 0 0 0 0 36
                                    1 13 0 0 37 2 0 14 0 0 1 1 36 14 0 1 1 0 50
                                    0 1 1 33 57 0 1 1 33 0 0 1 1 33 14 0 1 2 0
                                    28 0 50 1 2 0 28 0 50 1 1 0 28 0 1 1 0 46 0
                                    1 2 35 56 0 0 1 2 9 14 0 0 1 0 36 0 1 1 37
                                    56 0 1 2 0 0 0 40 1 2 37 0 0 28 1 1 0 47 0
                                    1 1 6 60 0 1 1 7 61 0 1 1 0 6 0 1 1 6 58 0
                                    1 1 7 51 0 1 1 29 0 0 1 2 21 52 53 54 1 1
                                    21 55 53 1 2 10 62 53 54 1 1 10 63 53 1 1
                                    37 56 0 1 1 19 0 0 1 1 14 44 0 1 4 0 0 0 6
                                    43 0 1 2 30 0 0 40 1 2 36 14 0 0 1 1 37 14
                                    0 1 1 0 28 0 1 1 0 44 0 1 1 0 14 0 1 2 0 0
                                    6 43 1 3 0 0 0 7 28 33 3 0 0 0 50 49 1 1 0
                                    43 0 1 2 0 0 48 0 1 2 0 0 11 0 1 1 0 16 0
                                    17 1 0 42 0 1 2 5 6 59 0 1 1 37 56 0 1 2 0
                                    0 0 40 1 2 37 0 0 28 1 1 15 41 0 1 1 15 43
                                    0 1 1 29 0 0 1 1 29 6 0 1 1 0 38 0 1 1 0 14
                                    0 15 1 0 6 0 1 4 10 0 0 43 6 0 1 2 33 56 0
                                    0 1 2 4 56 0 6 1 1 0 43 0 1 2 0 28 0 7 1 2
                                    0 49 0 50 1 1 19 6 0 1 1 15 0 42 1 1 0 0 42
                                    1 2 39 0 0 0 1 1 0 39 0 1 1 0 0 6 1 1 31 0
                                    0 1 1 38 0 51 1 1 18 0 58 1 1 0 45 0 1 2 0
                                    6 0 43 1 3 0 0 0 7 28 1 3 0 0 0 50 49 1 1 2
                                    56 0 1 0 39 28 1 3 32 0 0 0 28 1 3 39 0 0 0
                                    0 1 2 33 14 0 0 1 2 0 0 0 0 1 2 39 14 0 0 1
                                    1 0 0 0 22 2 0 0 0 40 1 2 37 0 0 28 1 0 36
                                    0 21 0 37 0 30 1 0 0 7 1 2 0 14 0 0 1 2 16
                                    0 0 6 1 2 34 0 0 0 1 1 34 0 0 32 2 0 0 0 0
                                    36 2 0 0 40 0 1 2 0 0 0 0 34 2 0 0 0 6 1 2
                                    0 0 6 0 1 2 21 0 0 51 1 2 34 0 51 0 1 2 36
                                    0 28 0 1 2 1 0 58 0 1 2 1 0 0 58 1)))))
           '|lookupComplete|)) 
