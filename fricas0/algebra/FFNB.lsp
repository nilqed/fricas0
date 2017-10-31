
(DECLAIM (NOTINLINE |FiniteFieldNormalBasis;|)) 

(DEFUN |FiniteFieldNormalBasis| (&REST #1=#:G752)
  (SPROG NIL
         (PROG (#2=#:G753)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldNormalBasis|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldNormalBasis|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteFieldNormalBasis;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteFieldNormalBasis|)))))))))) 

(DEFUN |FiniteFieldNormalBasis;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G751 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteFieldNormalBasis|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|FiniteFieldNormalBasis| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 51) . #2#)
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
    (|haddProp| |$ConstructorCache| '|FiniteFieldNormalBasis| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|FiniteFieldNormalBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldNormalBasisExtensionByPolynomial| 32
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT $ 7)
                                                               (QREFELT $
                                                                        12))))
              (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |value| 32) (|:| |index| 50)) (|Union| 27 30)
              (|PositiveInteger|) (|FiniteFieldFunctions| 32)
              (0 . |createLowComplexityNormalBasis|) (|OnePointCompletion| 10)
              (|Union| $ '"failed") (|Union| 16 '"failed")
              (|NonNegativeInteger|) (|List| $) (|InputForm|) (|Boolean|)
              (|Union| 34 '"failed") (|Matrix| $) (|Table| 10 16) (|Integer|)
              (|Record| (|:| |factor| 23) (|:| |exponent| 23)) (|List| 24)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|SparseUnivariatePolynomial| 32) (|Union| 27 '"failed")
              (|SparseUnivariatePolynomial| $) (|Vector| (|List| 8))
              (|Matrix| 32) (|PrimeField| 6) (|Vector| 32) (|Vector| $)
              (|CardinalNumber|) (|Union| 32 '"failed") (|Fraction| 23)
              (|Factored| $) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 39 '#1="failed") (|Union| 17 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 17) (|:| |generator| $))
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
                 (|VectorSpace| (|PrimeField| 6)) (|Algebra| 37)
                 (|LeftOreRing|) (|Algebra| $$) (|Module| (|PrimeField| 6))
                 (|Module| 37) (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|)
                 (|BiModule| (|PrimeField| 6) (|PrimeField| 6))
                 (|BiModule| 37 37) (|BiModule| $$ $$) (|Ring|)
                 (|RightModule| (|PrimeField| 6))
                 (|LeftModule| (|PrimeField| 6)) (|RightModule| 37)
                 (|LeftModule| 37) (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|Finite|)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Comparable|)
                 (|StepThrough|) (|SetCategory|)
                 (|RetractableTo| (|PrimeField| 6)) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 49)
                 (|ConvertibleTo| 18))
              (|makeByteWordVec2| 12 '(1 11 9 10 12)))))
           '|lookupIncomplete|)) 
