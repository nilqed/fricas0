
(DECLAIM (NOTINLINE |FiniteFieldCyclicGroup;|)) 

(DEFUN |FiniteFieldCyclicGroup;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (#1=#:G37 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 |#2|)
          (LETT |dv$| (LIST '|FiniteFieldCyclicGroup| DV$1 DV$2))
          (LETT % (GETREFV 51))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|PrimeField| |#1|)
                                               '(|CharacteristicZero|))
                                              (LETT #1#
                                                    (|HasCategory|
                                                     (|PrimeField| |#1|)
                                                     '(|Finite|)))
                                              (OR
                                               (|HasCategory|
                                                (|PrimeField| |#1|)
                                                '(|CharacteristicNonZero|))
                                               #1#)
                                              (|HasCategory|
                                               (|PrimeField| |#1|)
                                               '(|Hashable|))
                                              (|HasCategory|
                                               (|PrimeField| |#1|)
                                               '(|Field|))))))
          (|haddProp| |$ConstructorCache| '|FiniteFieldCyclicGroup|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (AND (|HasCategory| % '(|CharacteristicNonZero|)) #1#
               (|augmentPredVector| % 32))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FiniteFieldCyclicGroup| (&REST #1=#:G38)
  (SPROG NIL
         (PROG (#2=#:G39)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL NIL))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldCyclicGroup|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteFieldCyclicGroup;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteFieldCyclicGroup|)))))))))) 

(MAKEPROP '|FiniteFieldCyclicGroup| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldCyclicGroupExtensionByPolynomial| 31
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT % 7)
                                                               (QREFELT %
                                                                        11))))
              (|local| |#1|) (|local| |#2|) (|SparseUnivariatePolynomial| 31)
              (|PositiveInteger|) (|FiniteFieldPolynomialPackage| 31)
              (0 . |createPrimitivePoly|) (|Boolean|) (|OutputForm|) (|String|)
              (|Integer|) (|Union| % '"failed") (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 20 '"failed")
              (|Record| (|:| |coef| 20) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 25 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|Fraction| 15) (|Union| 31 '"failed")
              (|PrimeField| (NRTEVAL (QREFELT % 6))) (|OnePointCompletion| 9)
              (|Matrix| 31) (|Vector| 31) (|Vector| %) (|PrimitiveArray| 50)
              (|Union| 35 '#1="failed") (|Matrix| %) (|Union| 17 '"failed")
              (|InputForm|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Union| 8 '"failed")
              (|Record| (|:| |factor| 15) (|:| |exponent| 17)) (|List| 43)
              (|Table| 9 17) (|Factored| 21) (|Union| 48 '#1#) (|List| 21)
              (|HashState|) (|SingleInteger|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 2 0 3 0 2 0 0 0 0 0 0 0 0 0 0 2 1 3 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 2 0 0 0 0 2 2 0 0 4 0 0 0 2 0 0 0 0 0 0
                                  0 0))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |FiniteFieldCategory&|
                |ExtensionField&| |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL
                |FramedAlgebra&| NIL NIL |DivisionRing&| |FiniteRankAlgebra&|
                |DifferentialRing&| NIL NIL |Algebra&| |EntireRing&| |Algebra&|
                |Algebra&| NIL NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| NIL |Module&|
                |Module&| |Module&| |NonAssociativeRing&| NIL NIL NIL
                |FramedModule&| NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |Finite&| |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL NIL
                |AbelianSemiGroup&| |Magma&| |Hashable&| |SetCategory&| NIL
                |RetractableTo&| NIL NIL |BasicType&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| (|PrimeField| 6))
                 (|FiniteFieldCategory|) (|ExtensionField| (|PrimeField| 6))
                 (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FramedAlgebra| (|PrimeField| 6)
                                  (|SparseUnivariatePolynomial|
                                   (|PrimeField| 6)))
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|FiniteRankAlgebra| (|PrimeField| 6)
                                      (|SparseUnivariatePolynomial|
                                       (|PrimeField| 6)))
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|Algebra| $$) (|EntireRing|)
                 (|Algebra| 29) (|Algebra| (|PrimeField| 6)) (|Ring|)
                 (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 29)
                 (|NonAssociativeAlgebra| (|PrimeField| 6)) (|SemiRng|)
                 (|Module| $$) (|Module| 29) (|Module| (|PrimeField| 6))
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 29 29)
                 (|BiModule| (|PrimeField| 6) (|PrimeField| 6))
                 (|FramedModule| (|PrimeField| 6)) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 29)
                 (|RightModule| 29) (|LeftModule| (|PrimeField| 6))
                 (|RightModule| (|PrimeField| 6)) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Finite|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|StepThrough|) (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|Hashable|) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| (|PrimeField| 6)) (|ConvertibleTo| 40)
                 (|CoercibleTo| 13) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| (|PrimeField| 6)))
              (|makeByteWordVec2| 11 '(1 10 8 9 11)))))
           '|lookupIncomplete|)) 
