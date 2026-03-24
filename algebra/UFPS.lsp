
(DECLAIM (NOTINLINE |UnivariateFormalPowerSeries;|)) 

(DEFUN |UnivariateFormalPowerSeries;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G13 NIL) (#2=#:G14 NIL) (#3=#:G15 NIL) (#4=#:G18 NIL)
    (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|UnivariateFormalPowerSeries| DV$1))
    (LETT % (GETREFV 29))
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
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|NonNegativeInteger|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|SemiGroup|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|NonNegativeInteger|))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #2#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|integrate|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|variables|
                                                               (LIST
                                                                '(|List|
                                                                  (|Symbol|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|UnivariateFormalPowerSeries| (LIST DV$1)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 33554432))
    (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 67108864))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 134217728))
    (AND
     (OR (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 268435456))
    (AND
     (OR (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 536870912))
    (AND
     (OR (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR #1# (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 8589934592))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |UnivariateFormalPowerSeries| (#1=#:G19)
  (SPROG NIL
         (PROG (#2=#:G20)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateFormalPowerSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|UnivariateFormalPowerSeries;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateFormalPowerSeries|)))))))))) 

(MAKEPROP '|UnivariateFormalPowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|UnivariateTaylorSeries| 6 (NRTEVAL '|x|)
                                        (NRTEVAL (|spadConstant| % 7)))
              (|local| |#1|) (0 . |Zero|) (|Boolean|) (|OutputForm|) (|String|)
              (|PositiveInteger|) (|Record| (|:| |k| 14) (|:| |c| 6))
              (|List| 12) (|NonNegativeInteger|) (|Mapping| 6 6) (|Stream| 12)
              (|Symbol|) (|Stream| 6) (|Polynomial| 6) (|Mapping| 6 23)
              (|UnivariatePolynomial| (NRTEVAL '|x|) 6)
              (|Variable| (NRTEVAL '|x|)) (|Integer|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| % '"failed") (|List| 17) (|List| 14) (|Fraction| 23))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 23
                                '(0 0 0 0 0 2 6 7 8 5 4 3 2 6 1 17 17 14 5 6 1
                                  5 6 1 0 16 1 0 0 0 17 1 1 0 0 0 0 0 23 14 14
                                  22 14 21 0 0 0 0 1 6 0 1 1 1 1 1 1 9 16 2 6 0
                                  0 0))
            (CONS
             '#(|UnivariateTaylorSeriesCategory&| NIL
                |UnivariatePowerSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL NIL |DifferentialRing&|
                |PartialDifferentialRing&| |Algebra&| NIL NIL |EntireRing&|
                |Algebra&| |Algebra&| NIL |Rng&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| |Module&|
                |Module&| |Module&| NIL |NonAssociativeRing&| NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&|
                NIL |NonAssociativeSemiRng&| |AbelianSemiGroup&| |Magma&|
                |TranscendentalFunctionCategory&| NIL |SetCategory&|
                |RadicalCategory&| |ElementaryFunctionCategory&| NIL
                |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|UnivariateTaylorSeriesCategory| 6)
                 (|UnivariateSeriesWithRationalExponents| 6 14)
                 (|UnivariatePowerSeriesCategory| 6 14)
                 (|PowerSeriesCategory| 6 14 (|SingletonAsOrderedSet|))
                 (|AbelianMonoidRing| 6 14) (|IntegralDomain|)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 17) (|Algebra| 6)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|EntireRing|) (|Algebra| $$) (|Algebra| 28) (|Ring|) (|Rng|)
                 (|SemiRing|) (|NonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 28)
                 (|Module| 6) (|Module| $$) (|Module| 28) (|SemiRng|)
                 (|NonAssociativeRing|) (|BiModule| 28 28) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|IndexedProductCategory| 6 14)
                 (|NonAssociativeRng|) (|RightModule| 28) (|LeftModule| 28)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|AbelianSemiGroup|) (|Magma|)
                 (|TranscendentalFunctionCategory|) (|CommutativeStar|)
                 (|SetCategory|) (|RadicalCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|Eltable| $$ $$)
                 (|unitsKnown|) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|CoercibleTo| 9) (|BasicType|)
                 (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| 7 '(0 6 0 7)))))
           '|lookupIncomplete|)) 
