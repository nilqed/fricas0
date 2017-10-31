
(DECLAIM (NOTINLINE |InnerFiniteField;|)) 

(DEFUN |InnerFiniteField| (&REST #1=#:G747)
  (SPROG NIL
         (PROG (#2=#:G748)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerFiniteField|)
                                               '|domainEqualList|)
                    . #3=(|InnerFiniteField|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerFiniteField;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerFiniteField|)))))))))) 

(DEFUN |InnerFiniteField;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G746 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|InnerFiniteField|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|InnerFiniteField| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 46) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|InnerPrimeField| |#1|)
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|InnerPrimeField| |#1|)
                                               '(|Finite|))
                                              . #2#)
                                        (OR
                                         (|HasCategory|
                                          (|InnerPrimeField| |#1|)
                                          '(|CharacteristicNonZero|))
                                         #1#)))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|InnerFiniteField| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|InnerFiniteField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FiniteFieldExtension| 26 7) (|local| |#1|)
              (|local| |#2|) (|Union| $ '"failed") (|Union| 11 '"failed")
              (|OnePointCompletion| 13) (|NonNegativeInteger|) (|List| $)
              (|PositiveInteger|) (|Boolean|) (|InputForm|)
              (|Union| 28 '"failed") (|Matrix| $) (|Table| 13 11) (|Integer|)
              (|Record| (|:| |factor| 19) (|:| |exponent| 19)) (|List| 20)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|SparseUnivariatePolynomial| 26) (|Union| 23 '"failed")
              (|SparseUnivariatePolynomial| $) (|InnerPrimeField| 6)
              (|Matrix| 26) (|Vector| $) (|Vector| 26) (|CardinalNumber|)
              (|Union| 26 '"failed") (|Fraction| 19) (|Factored| $)
              (|Union| 12 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 36 '#1#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 12) (|:| |generator| $))
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
              '#((|FiniteAlgebraicExtensionField| (|InnerPrimeField| 6))
                 (|ExtensionField| (|InnerPrimeField| 6))
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|VectorSpace| (|InnerPrimeField| 6))
                 (|Algebra| 32) (|LeftOreRing|) (|Algebra| $$)
                 (|Module| (|InnerPrimeField| 6)) (|Module| 32)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|)
                 (|BiModule| (|InnerPrimeField| 6) (|InnerPrimeField| 6))
                 (|BiModule| 32 32) (|BiModule| $$ $$) (|Ring|)
                 (|RightModule| (|InnerPrimeField| 6))
                 (|LeftModule| (|InnerPrimeField| 6)) (|RightModule| 32)
                 (|LeftModule| 32) (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|Finite|)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Comparable|)
                 (|StepThrough|) (|SetCategory|)
                 (|RetractableTo| (|InnerPrimeField| 6)) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 44)
                 (|ConvertibleTo| 15))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
