
(DECLAIM (NOTINLINE |PrimeField;|)) 

(DEFUN |PrimeField| (#1=#:G754)
  (SPROG NIL
         (PROG (#2=#:G755)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PrimeField|)
                                               '|domainEqualList|)
                    . #3=(|PrimeField|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PrimeField;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|PrimeField|)))))))))) 

(DEFUN |PrimeField;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PrimeField|))
          (LETT |dv$| (LIST '|PrimeField| DV$1) . #1#)
          (LETT $ (GETREFV 46) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PrimeField| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND (|HasCategory| $ '(|CharacteristicNonZero|))
               (|augmentPredVector| $ 1))
          (AND (|HasCategory| $ '(|Finite|)) (|augmentPredVector| $ 2))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL |#1| (QREFELT $ 10)))
          (COND ((QREFELT $ 11))
                ('T (|error| "Argument to prime field must be a prime")))
          $))) 

(MAKEPROP '|PrimeField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerPrimeField| (NRTEVAL (QREFELT $ 6)))
              (|local| |#1|) (|Boolean|) (|Integer|) (|IntegerPrimesPackage| 8)
              (0 . |prime?|) '#:G690 (|Union| 21 '#1="failed") (|Matrix| $)
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| $)
              (|PositiveInteger|) (|Union| 15 '"failed") (|Union| $ '"failed")
              (|CardinalNumber|) (|OnePointCompletion| 16) (|Vector| $)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |factor| 8) (|:| |exponent| 8)) (|List| 23)
              (|Table| 16 14) (|Factored| 15) (|Union| 28 '#1#) (|List| 15)
              (|InputForm|) (|List| $) (|Union| 14 '"failed") (|Fraction| 8)
              (|Factored| $) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 34 '#2="failed") (|Union| 30 '#2#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 30) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |FiniteFieldCategory&|
                |ExtensionField&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL NIL
                |DivisionRing&| NIL |DifferentialRing&| NIL |Algebra&|
                |EntireRing&| |Algebra&| NIL |VectorSpace&| |Rng&| NIL
                |Module&| |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL
                NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL
                |Finite&| NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| NIL NIL |Magma&| |AbelianSemiGroup&|
                |SetCategory&| NIL |RetractableTo&| NIL NIL NIL NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| $$) (|FiniteFieldCategory|)
                 (|ExtensionField| $$) (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|EuclideanDomain|) (|PolynomialFactorizationExplicit|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|CommutativeRing|)
                 (|DivisionRing|) (|LeftOreRing|) (|DifferentialRing|)
                 (|CharacteristicNonZero|) (|Algebra| 32) (|EntireRing|)
                 (|Algebra| $$) (|Ring|) (|VectorSpace| $$) (|Rng|)
                 (|SemiRing|) (|Module| $$) (|Module| 32) (|SemiRng|)
                 (|BiModule| $$ $$) (|BiModule| 32 32) (|NonAssociativeRing|)
                 (|LeftModule| $$) (|RightModule| 32) (|LeftModule| 32)
                 (|NonAssociativeRng|) (|RightModule| $$) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|Finite|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|StepThrough|) (|Comparable|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|ConvertibleTo| 8) (|RetractableTo| $$)
                 (|ConvertibleTo| 29) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 45))
              (|makeByteWordVec2| 10 '(1 9 7 8 10)))))
           '|lookupIncomplete|)) 
