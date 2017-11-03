
(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator3;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator3| (&REST #1=#:G734)
  (SPROG NIL
         (PROG (#2=#:G735)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperator3|)
                                               '|domainEqualList|)
                    . #3=(|LinearOrdinaryDifferentialOperator3|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |LinearOrdinaryDifferentialOperator3;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperator3|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperator3;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G732 NIL) (#2=#:G733 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|LinearOrdinaryDifferentialOperator3|))
    (LETT DV$2 (|devaluate| |#2|) . #3#)
    (LETT DV$3 (|devaluate| |#3|) . #3#)
    (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator3| DV$1 DV$2 DV$3)
          . #3#)
    (LETT $ (GETREFV 42) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#3|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#3|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#3| '(|EntireRing|))
                                        (|HasCategory| |#3|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#3|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#3|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#3| '(|Comparable|))
                                        (|HasCategory| |#3| '(|Ring|))
                                        (|HasCategory| |#3|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (LETT #2#
                                              (|HasCategory| |#3|
                                                             '(|CommutativeRing|))
                                              . #3#)
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicZero|))
                                         #2#
                                         (|HasCategory| |#3| '(|EntireRing|))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (|HasCategory| |#3| '(|AbelianGroup|))
                                        (|HasCategory| |#3| '(|SemiRing|))
                                        (|HasCategory| |#3|
                                                       '(|IntegralDomain|))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#3| '(|GcdDomain|))
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (|HasCategory| |#3| '(|AbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|))
                                              . #3#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         #1#)
                                        (OR
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         #1#)
                                        (|HasCategory| |#3| '(|Field|))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator3|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND
     (OR (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8388608))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 16777216))
    (AND
     (OR (|HasCategory| |#3| '(|EntireRing|))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 33554432))
    (AND
     (OR (|HasCategory| |#3| '(|RetractableTo| (|Integer|)))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#3| '(|Ring|)))
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#3| '(|SemiRing|)))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#3| '(|Ring|)))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (|HasCategory| |#3| '(|AbelianMonoid|))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR #1# (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR (|HasCategory| |#3| '(|AbelianGroup|))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 2147483648))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator3| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|LinearOrdinaryDifferentialOperator| 8 (NRTEVAL (ELT $ 10)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              (|LinearOrdinaryDifferentialOperator3Aux| 6 7 8)
              (0 . |delta_deriv|)
              (|Record| (|:| |mat| 14) (|:| |vec| (|Vector| 15))) (|Matrix| $)
              (|Vector| $) (|Matrix| 15) (|Integer|) (|Boolean|)
              (|NonNegativeInteger|) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 15)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 20 '#1="failed") (|Union| 15 '#1#) (|Matrix| 8)
              (|Record| (|:| |mat| 26) (|:| |vec| (|Vector| 8))) (|List| $)
              (|List| 31) (|List| 17) (|SingletonAsOrderedSet|)
              (|Union| 31 '"failed") (|Mapping| 17 17) (|List| 8)
              (|Union| 8 '#1#) (|Mapping| 8 8) (|PositiveInteger|)
              (|HashState|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 22
                                '(0 0 0 0 0 9 1 2 3 4 9 10 11 12 12 14 0 1 11 0
                                  0 1 9 0 0 0 0 1 1 12 13 22 14 14 0 0 21 14 0
                                  0 8 0 0 0 0 0 0 4 5 6 7 9))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |FullyLinearlyExplicitOver&| |Algebra&|
                NIL NIL |EntireRing&| NIL NIL |Algebra&| NIL |Rng&| NIL NIL
                |Module&| |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL
                NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |Magma&| |AbelianSemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| NIL |RetractableTo&|
                |BasicType&| NIL NIL |RetractableTo&| |RetractableTo&| NIL NIL)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 8)
                 (|UnivariateSkewPolynomialCategory| 8)
                 (|MaybeSkewPolynomialCategory| 8 17 31)
                 (|FiniteAbelianMonoidRing| 8 17) (|AbelianMonoidRing| 8 17)
                 (|FullyLinearlyExplicitOver| 8) (|Algebra| 20)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|LinearlyExplicitOver| 8)
                 (|LinearlyExplicitOver| 15) (|Algebra| 8) (|Ring|) (|Rng|)
                 (|SemiRing|) (|SemiRng|) (|Module| 20) (|Module| 8)
                 (|BiModule| 8 8) (|BiModule| $$ $$) (|BiModule| 20 20)
                 (|NonAssociativeRing|) (|LeftModule| 8) (|RightModule| 8)
                 (|RightModule| $$) (|LeftModule| $$) (|LeftModule| 20)
                 (|RightModule| 20) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|Magma|)
                 (|AbelianSemiGroup|) (|Comparable|) (|FullyRetractableTo| 8)
                 (|SetCategory|) (|Eltable| 8 8) (|RetractableTo| 8)
                 (|BasicType|) (|CoercibleTo| 40) (|noZeroDivisors|)
                 (|RetractableTo| 20) (|RetractableTo| 15)
                 (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 10 '(1 9 8 8 10)))))
           '|lookupIncomplete|)) 
