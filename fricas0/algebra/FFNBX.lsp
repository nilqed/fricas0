
(DECLAIM (NOTINLINE |FiniteFieldNormalBasisExtension;|)) 

(DEFUN |FiniteFieldNormalBasisExtension| (&REST #1=#:G752)
  (SPROG NIL
         (PROG (#2=#:G753)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldNormalBasisExtension|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldNormalBasisExtension|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FiniteFieldNormalBasisExtension;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldNormalBasisExtension|)))))))))) 

(DEFUN |FiniteFieldNormalBasisExtension;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G751 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteFieldNormalBasisExtension|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|FiniteFieldNormalBasisExtension| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 50) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Finite|))
                                              . #2#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         #1#)))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|FiniteFieldNormalBasisExtension|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|FiniteFieldNormalBasisExtension| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldNormalBasisExtensionByPolynomial| 6
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT $ 7)
                                                               (QREFELT $
                                                                        12))))
              (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |value| 6) (|:| |index| 49)) (|Union| 27 30)
              (|PositiveInteger|) (|FiniteFieldFunctions| 6)
              (0 . |createLowComplexityNormalBasis|) (|OnePointCompletion| 10)
              (|Union| $ '"failed") (|Union| 16 '"failed")
              (|NonNegativeInteger|) (|List| $) (|InputForm|) (|Boolean|)
              (|Union| 33 '"failed") (|Matrix| $) (|Table| 10 16) (|Integer|)
              (|Record| (|:| |factor| 23) (|:| |exponent| 23)) (|List| 24)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|SparseUnivariatePolynomial| 6) (|Union| 27 '"failed")
              (|SparseUnivariatePolynomial| $) (|Vector| (|List| 8))
              (|Matrix| 6) (|Vector| 6) (|Vector| $) (|CardinalNumber|)
              (|Union| 6 '"failed") (|Fraction| 23) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 38 '#1="failed") (|Union| 17 '#1#)
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
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|VectorSpace| 6) (|Algebra| 36)
                 (|LeftOreRing|) (|Algebra| $$) (|Module| 6) (|Module| 36)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|BiModule| 6 6) (|BiModule| 36 36)
                 (|BiModule| $$ $$) (|Ring|) (|RightModule| 6) (|LeftModule| 6)
                 (|RightModule| 36) (|LeftModule| 36) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|Finite|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|SetCategory|) (|RetractableTo| 6) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 48)
                 (|ConvertibleTo| 18))
              (|makeByteWordVec2| 12 '(1 11 9 10 12)))))
           '|lookupIncomplete|)) 
