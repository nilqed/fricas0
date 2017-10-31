
(DECLAIM (NOTINLINE |FiniteFieldCyclicGroup;|)) 

(DEFUN |FiniteFieldCyclicGroup| (&REST #1=#:G747)
  (SPROG NIL
         (PROG (#2=#:G748)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldCyclicGroup|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldCyclicGroup|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteFieldCyclicGroup;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteFieldCyclicGroup|)))))))))) 

(DEFUN |FiniteFieldCyclicGroup;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G746 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteFieldCyclicGroup|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|FiniteFieldCyclicGroup| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 49) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|PrimeField| |#1|)
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|PrimeField| |#1|) '(|Finite|))
                                              . #2#)
                                        (OR
                                         (|HasCategory| (|PrimeField| |#1|)
                                                        '(|CharacteristicNonZero|))
                                         #1#)))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|FiniteFieldCyclicGroup| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|FiniteFieldCyclicGroup| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldCyclicGroupExtensionByPolynomial| 29
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT $ 7)
                                                               (QREFELT $
                                                                        11))))
              (|local| |#1|) (|local| |#2|) (|SparseUnivariatePolynomial| 29)
              (|PositiveInteger|) (|FiniteFieldPolynomialPackage| 29)
              (0 . |createPrimitivePoly|) (|OnePointCompletion| 9)
              (|Union| $ '"failed") (|Union| 15 '"failed")
              (|NonNegativeInteger|) (|List| $) (|InputForm|) (|Boolean|)
              (|Union| 31 '"failed") (|Matrix| $) (|Table| 9 15) (|Integer|)
              (|Record| (|:| |factor| 22) (|:| |exponent| 22)) (|List| 23)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Union| 8 '"failed") (|SparseUnivariatePolynomial| $)
              (|PrimitiveArray| 48) (|PrimeField| 6) (|Matrix| 29) (|Vector| $)
              (|Vector| 29) (|CardinalNumber|) (|Union| 29 '"failed")
              (|Fraction| 22) (|Factored| $) (|Union| 16 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 39 '#1#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 16) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 1 2
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 2 2 0
                                  0 0 0 0 0 0 0 0 2))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |VectorSpace&| |Algebra&| NIL
                |Algebra&| |Module&| |Module&| NIL |EntireRing&| |Module&| NIL
                NIL |DifferentialRing&| NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL
                |Rng&| NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&|
                NIL |Finite&| |SemiGroup&| |AbelianSemiGroup&| NIL NIL
                |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| (|PrimeField| 6))
                 (|ExtensionField| (|PrimeField| 6)) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|VectorSpace| (|PrimeField| 6)) (|Algebra| 35)
                 (|LeftOreRing|) (|Algebra| $$) (|Module| (|PrimeField| 6))
                 (|Module| 35) (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|)
                 (|BiModule| (|PrimeField| 6) (|PrimeField| 6))
                 (|BiModule| 35 35) (|BiModule| $$ $$) (|Ring|)
                 (|RightModule| (|PrimeField| 6))
                 (|LeftModule| (|PrimeField| 6)) (|RightModule| 35)
                 (|LeftModule| 35) (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|Finite|)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Comparable|)
                 (|StepThrough|) (|SetCategory|)
                 (|RetractableTo| (|PrimeField| 6)) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 47)
                 (|ConvertibleTo| 17))
              (|makeByteWordVec2| 11 '(1 10 8 9 11)))))
           '|lookupIncomplete|)) 
