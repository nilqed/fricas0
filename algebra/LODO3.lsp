
(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator3;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator3;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G30 NIL) (#2=#:G32 NIL) (#3=#:G31 NIL) (% NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator3| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 43))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                                       '(|CommutativeRing|))
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
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#3| '(|EntireRing|))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (|HasCategory| |#3| '(|AbelianGroup|))
                                        (|HasCategory| |#3| '(|SemiRing|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
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
                                        (LETT #3#
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #3#)
                                         (AND #3#
                                              (|HasCategory| |#3|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #3#
                                              (|HasCategory| |#3|
                                                             '(|CharacteristicZero|)))
                                         (AND #3#
                                              (|HasCategory| |#3|
                                                             '(|CommutativeRing|)))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#3| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #1#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|)))
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
                                        (|HasCategory| |#3| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator3|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 134217728))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 268435456))
    (AND
     (OR (|HasCategory| |#3| '(|EntireRing|))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 536870912))
    (AND
     (OR (|HasCategory| |#3| '(|Algebra| (|Fraction| (|Integer|))))
         (|HasCategory| |#3| '(|CommutativeRing|))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#3| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#3| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#3| '(|Ring|)))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#3| '(|SemiRing|)))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#3| '(|Ring|)))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR
      (AND #3# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#3| '(|AbelianMonoid|))
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR
      (AND #3# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#3| '(|AbelianGroup|))
           (|HasCategory| |#3| '(|CommutativeRing|)))
      (AND (|HasCategory| |#3| '(|AbelianGroup|))
           (|HasCategory| |#3| '(|Ring|)))
      #1#
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND #3# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#3| '(|AbelianGroup|))
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 68719476736))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |LinearOrdinaryDifferentialOperator3| (&REST #1=#:G33)
  (SPROG NIL
         (PROG (#2=#:G34)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperator3|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |LinearOrdinaryDifferentialOperator3;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperator3|)))))))))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator3| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|LinearOrdinaryDifferentialOperator| 8 (NRTEVAL (ELT % 10)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              (|LinearOrdinaryDifferentialOperator3Aux| 6 7 8)
              (0 . |delta_deriv|) (|Boolean|) (|String|) (|OutputForm|)
              (|PositiveInteger|) (|Record| (|:| |k| 17) (|:| |c| 8))
              (|List| 15) (|NonNegativeInteger|) (|Mapping| 8 8) (|List| %)
              (|List| 8) (|List| 17) (|Union| 8 '#1="failed") (|Mapping| 17 17)
              (|List| 25) (|SingletonAsOrderedSet|) (|Union| 25 '"failed")
              (|Matrix| 29) (|Matrix| %) (|Integer|)
              (|Record| (|:| |mat| 27) (|:| |vec| (|Vector| 29))) (|Vector| %)
              (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 29) (|Mapping| 8 17)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |generator| %) (|:| |coef1| %) (|:| |coef2| %)
                        (|:| |coefu| %) (|:| |coefv| %))
              (|Union| 34 '#1#) (|Union| 29 '#1#)
              (|Record| (|:| |mat| 42) (|:| |vec| (|Vector| 8))) (|Matrix| 8))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 0 0 0 5 4 3 2 1 11 5 13 11 1 0 10 5 1 0 0
                                  10 20 10 1 0 0 0 11 20 1 1 0 0 0 0 0 12 13 13
                                  26 13 25 0 0 9 0 0 0 7 6 0 0 10 8 7 6 4 0 0 0
                                  0))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |Algebra&| |EntireRing&| NIL NIL
                |Algebra&| NIL |NonAssociativeAlgebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&|
                NIL |NonAssociativeSemiRng&| NIL |AbelianSemiGroup&| |Magma&|
                |FullyRetractableTo&| |RetractableTo&| |RetractableTo&|
                |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 8)
                 (|UnivariateSkewPolynomialCategory| 8)
                 (|MaybeSkewPolynomialCategory| 8 17 25)
                 (|FiniteAbelianMonoidRing| 8 17) (|AbelianMonoidRing| 8 17)
                 (|Algebra| 8) (|EntireRing|) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|Algebra| 34) (|Ring|)
                 (|NonAssociativeAlgebra| 8) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 34) (|FreeModuleCategory| 8 17)
                 (|FullyLinearlyExplicitOver| 8) (|Module| 8) (|Module| 34)
                 (|IndexedDirectProductCategory| 8 17) (|SemiRng|)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 29)
                 (|LinearlyExplicitOver| 8) (|BiModule| 34 34)
                 (|BiModule| $$ $$) (|BiModule| 8 8)
                 (|IndexedProductCategory| 8 17) (|NonAssociativeRng|)
                 (|RightModule| 29) (|RightModule| 34) (|LeftModule| 34)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 8)
                 (|LeftModule| 8) (|AbelianProductCategory| 8) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 8) (|RetractableTo| 29)
                 (|RetractableTo| 34) (|SetCategory|) (|RetractableTo| 8)
                 (|unitsKnown|) (|canonicalUnitNormal|) (|CoercibleFrom| 29)
                 (|CoercibleFrom| 34) (|noZeroDivisors|) (|CoercibleTo| 13)
                 (|BasicType|) (|CoercibleFrom| 8) (|Eltable| 8 8))
              (|makeByteWordVec2| 10 '(1 9 8 8 10)))))
           '|lookupIncomplete|)) 
