
(DECLAIM (NOTINLINE |FiniteFieldExtension;|)) 

(DEFUN |FiniteFieldExtension;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (#1=#:G37 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 |#2|)
          (LETT |dv$| (LIST '|FiniteFieldExtension| DV$1 DV$2))
          (LETT % (GETREFV 49))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|Finite|)))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|CharacteristicNonZero|))
                                               #1#)
                                              (|HasCategory| |#1|
                                                             '(|Hashable|))
                                              (|HasCategory| |#1|
                                                             '(|Field|))))))
          (|haddProp| |$ConstructorCache| '|FiniteFieldExtension|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (AND #1# (|HasCategory| % '(|CharacteristicNonZero|))
               (|augmentPredVector| % 32))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FiniteFieldExtension| (&REST #1=#:G38)
  (SPROG NIL
         (PROG (#2=#:G39)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldExtension|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteFieldExtension;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteFieldExtension|)))))))))) 

(MAKEPROP '|FiniteFieldExtension| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldExtensionByPolynomial| 6
                                                  (NRTEVAL
                                                   (SPADCALL (QREFELT % 7)
                                                             (QREFELT % 11))))
              (|local| |#1|) (|local| |#2|) (|SparseUnivariatePolynomial| 6)
              (|PositiveInteger|) (|FiniteFieldPolynomialPackage| 6)
              (0 . |createIrreduciblePoly|) (|Boolean|) (|OutputForm|)
              (|String|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 20 '"failed")
              (|Record| (|:| |coef| 20) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 25 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|Fraction| 15) (|Union| 6 '"failed")
              (|OnePointCompletion| 9) (|Matrix| 6) (|Vector| 6) (|Vector| %)
              (|Union| 34 '#1="failed") (|Matrix| %) (|Union| 17 '"failed")
              (|InputForm|) (|Union| 8 '"failed")
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Table| 9 17) (|Record| (|:| |factor| 15) (|:| |exponent| 17))
              (|List| 42) (|Factored| 21) (|Union| 46 '#1#) (|List| 21)
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
              '#((|FiniteAlgebraicExtensionField| 6) (|FiniteFieldCategory|)
                 (|ExtensionField| 6) (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FramedAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|FiniteRankAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|Algebra| $$) (|EntireRing|)
                 (|Algebra| 29) (|Algebra| 6) (|Ring|) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 29)
                 (|NonAssociativeAlgebra| 6) (|SemiRng|) (|Module| $$)
                 (|Module| 29) (|Module| 6) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 29 29) (|BiModule| 6 6)
                 (|FramedModule| 6) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| $$) (|LeftModule| 29) (|RightModule| 29)
                 (|LeftModule| 6) (|RightModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Finite|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|StepThrough|) (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|Hashable|) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 6) (|ConvertibleTo| 38) (|CoercibleTo| 13)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| 6))
              (|makeByteWordVec2| 11 '(1 10 8 9 11)))))
           '|lookupIncomplete|)) 
