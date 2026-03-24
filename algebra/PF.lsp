
(DECLAIM (NOTINLINE |PrimeField;|)) 

(DEFUN |PrimeField;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|PrimeField| DV$1))
          (LETT % (GETREFV 45))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PrimeField| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|CharacteristicNonZero|))
               (|augmentPredVector| % 1))
          (AND (|HasCategory| % '(|Field|)) (|augmentPredVector| % 2))
          (AND (|HasCategory| % '(|Finite|)) (|augmentPredVector| % 4))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 11 (SPADCALL |#1| (QREFELT % 10)))
          (COND ((QREFELT % 11))
                ('T (|error| "Argument to prime field must be a prime")))
          %))) 

(DEFUN |PrimeField| (#1=#:G35)
  (SPROG NIL
         (PROG (#2=#:G36)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PrimeField|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PrimeField;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|PrimeField|)))))))))) 

(MAKEPROP '|PrimeField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerPrimeField| (NRTEVAL (QREFELT % 6)))
              (|local| |#1|) (|Boolean|) (|Integer|) (|IntegerPrimesPackage| 8)
              (0 . |prime?|) '#:G0 (|OutputForm|) (|String|)
              (|PositiveInteger|) (|Union| % '"failed") (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|Record| (|:| |coef| 19) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %) (|Union| 19 '"failed")
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 25 '"failed")
              (|Factored| %) (|Fraction| 8) (|OnePointCompletion| 14)
              (|Union| 16 '"failed") (|SingleInteger|) (|HashState|)
              (|InputForm|) (|Union| 35 '#1="failed") (|List| 21)
              (|Factored| 21) (|Table| 14 16)
              (|Record| (|:| |factor| 8) (|:| |exponent| 16)) (|List| 38)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic") (|Matrix| %)
              (|Vector| %) (|Union| 42 '#1#) (|Union| 21 '"failed"))
           '#(~= 5 |zero?| 11 |unitNormal| 16 |unitCanonical| 21 |unit?| 26
              |transcendent?| 31 |transcendenceDegree| 36 |traceMatrix| 40
              |trace| 49 |tableForDiscreteLogarithm| 60 |subtractIfCan| 65
              |squareFreePolynomial| 71 |squareFreePart| 76 |squareFree| 81
              |sqrt| 86 |solveLinearPolynomialEquation| 91 |smaller?| 97
              |sizeLess?| 103 |size| 109 |sample| 113 |rightRecip| 117
              |rightPower| 122 |retractIfCan| 134 |retract| 139 |represents|
              144 |representationType| 155 |rem| 159 |regularRepresentation|
              165 |recip| 176 |rank| 181 |random| 185 |quo| 189
              |principalIdeal| 195 |primitiveElement| 200 |primitive?| 204
              |primeFrobenius| 209 |prime?| 220 |plenaryPower| 225 |order| 231
              |opposite?| 241 |one?| 247 |normalElement| 252 |normal?| 256
              |norm| 261 |nextItem| 272 |multiEuclidean| 277
              |minimalPolynomial| 283 |lookup| 294 |linearAssociatedOrder| 299
              |linearAssociatedLog| 304 |linearAssociatedExp| 315 |leftRecip|
              321 |leftPower| 326 |lcmCoef| 338 |lcm| 344 |latex| 355 |inv| 360
              |init| 365 |index| 369 |inGroundField?| 374 |hashUpdate!| 379
              |hash| 385 |generator| 390 |gcdPolynomial| 394 |gcd| 400
              |factorsOfCyclicGroupSize| 411 |factorSquareFreePolynomial| 415
              |factorPolynomial| 420 |factor| 425 |extensionDegree| 430
              |extendedEuclidean| 438 |exquo| 451 |expressIdealMember| 457
              |euclideanSize| 463 |enumerate| 468 |divide| 472 |discriminant|
              478 |discreteLog| 487 |differentiate| 498 |degree| 509
              |definingPolynomial| 519 |createPrimitiveElement| 523
              |createNormalElement| 527 |coordinates| 531 |convert| 553
              |conditionP| 573 |commutator| 578 |coerce| 584 |charthRoot| 604
              |characteristicPolynomial| 614 |characteristic| 619 |basis| 623
              |associator| 632 |associates?| 639 |antiCommutator| 645
              |annihilate?| 651 |algebraic?| 657 ^ 662 |Zero| 680 |One| 684
              |Frobenius| 688 D 699 = 710 / 716 - 722 + 733 * 739)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL
                |FramedAlgebra&| NIL |DivisionRing&| NIL |FiniteRankAlgebra&|
                |EntireRing&| |Algebra&| NIL |DifferentialRing&| |Algebra&| NIL
                NIL |NonAssociativeAlgebra&| |Rng&| |NonAssociativeAlgebra&|
                NIL |Module&| |Module&| |NonAssociativeRing&| NIL NIL
                |FramedModule&| NIL |NonAssociativeRng&| NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL |Finite&|
                |AbelianSemiGroup&| |Magma&| NIL NIL |SetCategory&| NIL
                |Hashable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL
                NIL NIL NIL NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| $$) (|ExtensionField| $$)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|FramedAlgebra| $$ (|SparseUnivariatePolynomial| $$))
                 (|LeftOreRing|) (|DivisionRing|) (|CommutativeRing|)
                 (|FiniteRankAlgebra| $$ (|SparseUnivariatePolynomial| $$))
                 (|EntireRing|) (|Algebra| 28) (|CharacteristicNonZero|)
                 (|DifferentialRing|) (|Algebra| $$) (|Ring|) (|SemiRing|)
                 (|NonAssociativeAlgebra| $$) (|Rng|)
                 (|NonAssociativeAlgebra| 28) (|SemiRng|) (|Module| $$)
                 (|Module| 28) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 28 28) (|FramedModule| $$) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 28)
                 (|RightModule| 28) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|Finite|)
                 (|AbelianSemiGroup|) (|Magma|) (|Comparable|) (|StepThrough|)
                 (|SetCategory|) (|CommutativeStar|) (|Hashable|)
                 (|RetractableTo| $$) (|CoercibleTo| 12) (|BasicType|)
                 (|unitsKnown|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|ConvertibleTo| 33) (|CoercibleFrom| $$) (|ConvertibleTo| 8)
                 (|Canonical|))
              (|makeByteWordVec2| 44
                                  '(1 9 7 8 10 2 0 7 0 0 1 1 0 7 0 1 1 0 17 0 1
                                    1 0 0 0 1 1 0 7 0 1 1 0 7 0 1 0 0 16 1 1 0
                                    41 42 1 0 0 41 1 1 0 0 0 1 2 3 0 0 14 1 1 0
                                    37 8 1 2 0 15 0 0 1 1 0 36 21 1 1 0 0 0 1 1
                                    0 27 0 1 1 0 0 0 1 2 0 34 35 21 1 2 0 7 0 0
                                    1 2 0 7 0 0 1 0 0 16 1 0 0 0 1 1 0 15 0 1 2
                                    0 0 0 14 1 2 0 0 0 16 1 1 0 15 0 1 1 0 0 0
                                    1 2 0 0 42 42 1 1 0 0 42 1 0 0 40 1 2 0 0 0
                                    0 1 2 0 41 0 42 1 1 0 41 0 1 1 0 15 0 1 0 0
                                    14 1 0 0 0 1 2 0 0 0 0 1 1 0 20 19 1 0 0 0
                                    1 1 0 7 0 1 1 0 0 0 1 2 0 0 0 16 1 1 0 7 0
                                    1 2 0 0 0 14 1 1 0 29 0 1 1 0 14 0 1 2 0 7
                                    0 0 1 1 0 7 0 1 0 3 0 1 1 3 7 0 1 1 0 0 0 1
                                    2 3 0 0 14 1 1 0 15 0 1 2 0 22 19 0 1 1 2
                                    21 0 1 2 3 21 0 14 1 1 0 14 0 1 1 3 21 0 1
                                    1 3 21 0 1 2 3 44 0 0 1 2 3 0 0 21 1 1 0 15
                                    0 1 2 0 0 0 14 1 2 0 0 0 16 1 2 0 18 0 0 1
                                    2 0 0 0 0 1 1 0 0 19 1 1 0 13 0 1 1 0 0 0 1
                                    0 0 0 1 1 0 0 14 1 1 0 7 0 1 2 0 32 32 0 1
                                    1 0 31 0 1 0 3 0 1 2 0 21 21 21 1 2 0 0 0 0
                                    1 1 0 0 19 1 0 0 39 1 1 0 36 21 1 1 0 36 21
                                    1 1 0 27 0 1 0 0 14 1 0 0 29 1 2 0 24 0 0 1
                                    3 0 26 0 0 0 1 2 0 15 0 0 1 2 0 22 19 0 1 1
                                    0 16 0 1 0 0 19 1 2 0 23 0 0 1 1 0 0 42 1 0
                                    0 0 1 2 0 30 0 0 1 1 0 16 0 1 2 0 0 0 16 1
                                    1 0 0 0 1 1 0 14 0 1 1 0 29 0 1 0 0 21 1 0
                                    0 0 1 0 3 0 1 2 0 42 0 42 1 2 0 41 42 42 1
                                    1 0 42 0 1 1 0 41 42 1 1 0 33 0 1 1 0 0 42
                                    1 1 0 42 0 1 1 0 8 0 1 1 1 43 41 1 2 0 0 0
                                    0 1 1 0 12 0 1 1 0 0 8 1 1 0 0 0 1 1 0 0 28
                                    1 1 0 15 0 1 1 0 0 0 1 1 0 21 0 1 0 0 16 1
                                    0 0 42 1 1 3 42 14 1 3 0 0 0 0 0 1 2 0 7 0
                                    0 1 2 0 0 0 0 1 2 0 7 0 0 1 1 0 7 0 1 2 0 0
                                    0 14 1 2 0 0 0 16 1 2 0 0 0 8 1 0 0 0 1 0 0
                                    0 1 2 3 0 0 16 1 1 3 0 0 1 2 0 0 0 16 1 1 0
                                    0 0 1 2 0 7 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1
                                    0 0 0 1 2 0 0 0 0 1 2 0 0 14 0 1 2 0 0 0 0
                                    1 2 0 0 8 0 1 2 0 0 16 0 1 2 0 0 28 0 1 2 0
                                    0 0 28 1)))))
           '|lookupComplete|)) 
