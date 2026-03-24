
(DECLAIM (NOTINLINE |InnerFiniteField;|)) 

(DEFUN |InnerFiniteField;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (#1=#:G37 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 |#2|)
          (LETT |dv$| (LIST '|InnerFiniteField| DV$1 DV$2))
          (LETT % (GETREFV 48))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|InnerPrimeField| |#1|)
                                               '(|CharacteristicZero|))
                                              (LETT #1#
                                                    (|HasCategory|
                                                     (|InnerPrimeField| |#1|)
                                                     '(|Finite|)))
                                              (OR
                                               (|HasCategory|
                                                (|InnerPrimeField| |#1|)
                                                '(|CharacteristicNonZero|))
                                               #1#)
                                              (|HasCategory|
                                               (|InnerPrimeField| |#1|)
                                               '(|Hashable|))
                                              (|HasCategory|
                                               (|InnerPrimeField| |#1|)
                                               '(|Field|))))))
          (|haddProp| |$ConstructorCache| '|InnerFiniteField| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (AND (|HasCategory| % '(|CharacteristicNonZero|)) #1#
               (|augmentPredVector| % 32))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |InnerFiniteField| (&REST #1=#:G38)
  (SPROG NIL
         (PROG (#2=#:G39)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL NIL))
                                               (HGET |$ConstructorCache|
                                                     '|InnerFiniteField|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerFiniteField;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerFiniteField|)))))))))) 

(MAKEPROP '|InnerFiniteField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldExtension| 28 (NRTEVAL (QREFELT % 7)))
              (|local| |#1|) (|local| |#2|) (|Boolean|) (|OutputForm|)
              (|String|) (|PositiveInteger|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 17 '"failed")
              (|Record| (|:| |coef| 17) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 22 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|Fraction| 12) (|Union| 28 '"failed")
              (|InnerPrimeField| (NRTEVAL (QREFELT % 6)))
              (|OnePointCompletion| 11) (|Matrix| 28) (|Vector| 28)
              (|Vector| %) (|SparseUnivariatePolynomial| 28)
              (|Union| 32 '#1="failed") (|Matrix| %) (|Union| 14 '"failed")
              (|InputForm|) (|Union| 33 '"failed")
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Table| 11 14) (|Record| (|:| |factor| 12) (|:| |exponent| 14))
              (|List| 41) (|Factored| 18) (|Union| 45 '#1#) (|List| 18)
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
              '#((|FiniteAlgebraicExtensionField| (|InnerPrimeField| 6))
                 (|FiniteFieldCategory|)
                 (|ExtensionField| (|InnerPrimeField| 6))
                 (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FramedAlgebra| (|InnerPrimeField| 6)
                                  (|SparseUnivariatePolynomial|
                                   (|InnerPrimeField| 6)))
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|FiniteRankAlgebra| (|InnerPrimeField| 6)
                                      (|SparseUnivariatePolynomial|
                                       (|InnerPrimeField| 6)))
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|Algebra| $$) (|EntireRing|)
                 (|Algebra| 26) (|Algebra| (|InnerPrimeField| 6)) (|Ring|)
                 (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 26)
                 (|NonAssociativeAlgebra| (|InnerPrimeField| 6)) (|SemiRng|)
                 (|Module| $$) (|Module| 26) (|Module| (|InnerPrimeField| 6))
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 26 26)
                 (|BiModule| (|InnerPrimeField| 6) (|InnerPrimeField| 6))
                 (|FramedModule| (|InnerPrimeField| 6)) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 26)
                 (|RightModule| 26) (|LeftModule| (|InnerPrimeField| 6))
                 (|RightModule| (|InnerPrimeField| 6)) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Finite|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|StepThrough|) (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|Hashable|) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| (|InnerPrimeField| 6)) (|ConvertibleTo| 37)
                 (|CoercibleTo| 9) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| (|InnerPrimeField| 6)))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
