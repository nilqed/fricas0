
(SDEFUN |LODO2;elt;%2M;1| ((|p| (%)) (|m| (M)) (% (M)))
        (SPADCALL |p| (ELT % 9) |m| (QREFELT % 12))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator2;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator2;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G32 NIL) (#2=#:G34 NIL) (#3=#:G33 NIL) (% NIL)
    (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator2| DV$1 DV$2))
    (LETT % (GETREFV 46))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #3#)
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #1#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#)
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator2|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 134217728))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 536870912))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (|HasCategory| |#1| '(|CommutativeRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|AbelianMonoid|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #1#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 68719476736))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |LinearOrdinaryDifferentialOperator2| (&REST #1=#:G35)
  (SPROG NIL
         (PROG (#2=#:G36)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperator2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |LinearOrdinaryDifferentialOperator2;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperator2|)))))))))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|LinearOrdinaryDifferentialOperator| 6 (NRTEVAL (ELT % 8)))
              (|local| |#1|) (|local| |#2|) (0 . |differentiate|)
              (5 . |differentiate|) (|Mapping| 7 7)
              (|ApplyUnivariateSkewPolynomial| 6 7 $$) (10 . |apply|)
              |LODO2;elt;%2M;1| (|Boolean|) (|String|) (|OutputForm|)
              (|PositiveInteger|) (|Record| (|:| |k| 20) (|:| |c| 6))
              (|List| 18) (|NonNegativeInteger|) (|Mapping| 6 6) (|List| %)
              (|List| 6) (|List| 20) (|Union| 6 '#1="failed") (|Mapping| 20 20)
              (|List| 28) (|SingletonAsOrderedSet|) (|Union| 28 '"failed")
              (|Matrix| 32) (|Matrix| %) (|Integer|)
              (|Record| (|:| |mat| 30) (|:| |vec| (|Vector| 32))) (|Vector| %)
              (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 32) (|Mapping| 6 20)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |generator| %) (|:| |coef1| %) (|:| |coef2| %)
                        (|:| |coefu| %) (|:| |coefv| %))
              (|Union| 37 '#1#) (|Union| 32 '#1#)
              (|Record| (|:| |mat| 45) (|:| |vec| (|Vector| 6))) (|Matrix| 6))
           '#(|elt| 17) 'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 0 0 0 5 4 3 2 1 11 5 13 11 1 0 10 5 1 0 0
                                  10 20 10 1 0 0 0 11 20 1 1 0 0 0 0 0 12 13 13
                                  26 13 25 0 0 9 0 0 0 7 6 0 0 10 8 7 6 4 0 0 0
                                  0 0))
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
                |BasicType&| NIL NIL NIL)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 6)
                 (|UnivariateSkewPolynomialCategory| 6)
                 (|MaybeSkewPolynomialCategory| 6 20 28)
                 (|FiniteAbelianMonoidRing| 6 20) (|AbelianMonoidRing| 6 20)
                 (|Algebra| 6) (|EntireRing|) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|Algebra| 37) (|Ring|)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 37) (|FreeModuleCategory| 6 20)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 37)
                 (|IndexedDirectProductCategory| 6 20) (|SemiRng|)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 32)
                 (|LinearlyExplicitOver| 6) (|BiModule| 37 37)
                 (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 20) (|NonAssociativeRng|)
                 (|RightModule| 32) (|RightModule| 37) (|LeftModule| 37)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 6) (|RetractableTo| 32)
                 (|RetractableTo| 37) (|SetCategory|) (|RetractableTo| 6)
                 (|unitsKnown|) (|canonicalUnitNormal|) (|CoercibleFrom| 32)
                 (|CoercibleFrom| 37) (|noZeroDivisors|) (|CoercibleTo| 16)
                 (|BasicType|) (|CoercibleFrom| 6) (|Eltable| 6 6)
                 (|Eltable| 7 7))
              (|makeByteWordVec2| 13
                                  '(1 6 0 0 8 1 7 0 0 9 3 11 7 2 10 7 12 2 0 7
                                    0 7 13)))))
           '|lookupIncomplete|)) 
