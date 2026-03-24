
(DECLAIM (NOTINLINE |PAdicRational;|)) 

(DEFUN |PAdicRational;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G36 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|PAdicRational| DV$1))
          (LETT % (GETREFV 56))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|PolynomialFactorizationExplicit|))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|RetractableTo| (|Symbol|)))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|CharacteristicNonZero|))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|CharacteristicZero|))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|ConvertibleTo|
                                                 (|InputForm|)))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|RealConstant|))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|OrderedIntegralDomain|))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|OrderedSet|))
                                              (OR
                                               (|HasCategory|
                                                (|PAdicInteger| |#1|)
                                                '(|OrderedIntegralDomain|))
                                               (|HasCategory|
                                                (|PAdicInteger| |#1|)
                                                '(|OrderedSet|)))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|RetractableTo| (|Integer|)))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|StepThrough|))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               (LIST '|InnerEvalable|
                                                     '(|Symbol|)
                                                     (LIST '|PAdicInteger|
                                                           (|devaluate|
                                                            |#1|))))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               (LIST '|Evalable|
                                                     (LIST '|PAdicInteger|
                                                           (|devaluate|
                                                            |#1|))))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               (LIST '|Eltable|
                                                     (LIST '|PAdicInteger|
                                                           (|devaluate| |#1|))
                                                     (LIST '|PAdicInteger|
                                                           (|devaluate|
                                                            |#1|))))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|PartialDifferentialRing|
                                                 (|Symbol|)))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|DifferentialRing|))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|LinearlyExplicitOver|
                                                 (|Integer|)))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|ConvertibleTo|
                                                 (|Pattern| (|Float|))))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|ConvertibleTo|
                                                 (|Pattern| (|Integer|))))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|PatternMatchable| (|Float|)))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|PatternMatchable|
                                                 (|Integer|)))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|EuclideanDomain|))
                                              (|HasCategory|
                                               (|PAdicInteger| |#1|)
                                               '(|IntegerNumberSystem|))
                                              (LETT #1#
                                                    (|HasCategory|
                                                     (|PAdicInteger| |#1|)
                                                     '(|Comparable|)))
                                              (OR #1#
                                                  (|HasCategory|
                                                   (|PAdicInteger| |#1|)
                                                   '(|OrderedIntegralDomain|))
                                                  (|HasCategory|
                                                   (|PAdicInteger| |#1|)
                                                   '(|OrderedSet|)))))))
          (|haddProp| |$ConstructorCache| '|PAdicRational| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|CharacteristicNonZero|))
               (|HasCategory| (|PAdicInteger| |#1|)
                              '(|PolynomialFactorizationExplicit|))
               (|augmentPredVector| % 33554432))
          (AND
           (OR
            (AND (|HasCategory| % '(|CharacteristicNonZero|))
                 (|HasCategory| (|PAdicInteger| |#1|)
                                '(|PolynomialFactorizationExplicit|)))
            (|HasCategory| (|PAdicInteger| |#1|) '(|CharacteristicNonZero|)))
           (|augmentPredVector| % 67108864))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |PAdicRational| (#1=#:G37)
  (SPROG NIL
         (PROG (#2=#:G38)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PAdicRational|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PAdicRational;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|PAdicRational|)))))))))) 

(MAKEPROP '|PAdicRational| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|PAdicRationalConstructor| (NRTEVAL (QREFELT % 6)) 26)
              (|local| |#1|) (|Boolean|) (|OutputForm|) (|String|)
              (|PositiveInteger|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 16 '"failed")
              (|Record| (|:| |coef| 16) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 21 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|Fraction| 11)
              (|PAdicInteger| (NRTEVAL (QREFELT % 6)))
              (|Union| 26 '#1="failed") (|Mapping| 26 26)
              (|Record| (|:| |mat| 32) (|:| |vec| (|Vector| 26))) (|Matrix| %)
              (|Vector| %) (|Matrix| 26) (|ContinuedFraction| 25)
              (|Union| 31 '#2="failed") (|InputForm|) (|Pattern| 51)
              (|Pattern| 11) (|List| 26) (|Equation| 26) (|List| 39) (|Symbol|)
              (|List| 41) (|Matrix| 11)
              (|Record| (|:| |mat| 43) (|:| |vec| (|Vector| 11))) (|List| 13)
              (|PatternMatchResult| 51 %) (|PatternMatchResult| 11 %)
              (|Union| 49 '#2#) (|List| 17) (|Factored| 17) (|Float|)
              (|DoubleFloat|) (|Union| 25 '#1#) (|Union| 11 '#1#)
              (|Union| 41 '#1#))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 0 0 0 7 0 0 7 0 0 0 0 16 15 4 3 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 17 7 0 0 0 0 0 17 7 0 0
                                  0 0 0 0 0 7 0 7 0 0 0 9 0 0 0 0 0 21 20 11 25
                                  0 0 0 13 10 10 6 2 0 0 0 0 19 18 14 13 12 10
                                  10 8 6 6 5 2 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|QuotientFieldCategory&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL NIL |DivisionRing&| |DifferentialExtension&|
                |DifferentialRing&| |PartialDifferentialRing&| NIL NIL
                |Algebra&| |EntireRing&| |Algebra&| |Algebra&| NIL NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |Module&| |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL NIL |NonAssociativeRing&| NIL
                NIL NIL NIL NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&|
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                NIL NIL NIL NIL NIL |AbelianSemiGroup&| |Magma&|
                |FullyEvalableOver&| |Evalable&| |RetractableTo&|
                |RetractableTo&| NIL |RetractableTo&| |SetCategory&| NIL
                |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL |PartialOrder&| NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| (|PAdicInteger| 6)) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|LeftOreRing|) (|CommutativeRing|)
                 (|DivisionRing|) (|DifferentialExtension| (|PAdicInteger| 6))
                 (|DifferentialRing|) (|PartialDifferentialRing| 41)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 25)
                 (|Algebra| (|PAdicInteger| 6)) (|Ring|) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 25)
                 (|NonAssociativeAlgebra| (|PAdicInteger| 6)) (|SemiRng|)
                 (|Module| $$) (|Module| 25) (|Module| (|PAdicInteger| 6))
                 (|FullyLinearlyExplicitOver| (|PAdicInteger| 6))
                 (|LinearlyExplicitOver| 11) (|OrderedAbelianGroup|)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 25 25)
                 (|BiModule| (|PAdicInteger| 6) (|PAdicInteger| 6))
                 (|LinearlyExplicitOver| (|PAdicInteger| 6)) (|RightModule| 11)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 25)
                 (|RightModule| 25) (|LeftModule| (|PAdicInteger| 6))
                 (|RightModule| (|PAdicInteger| 6)) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|OrderedSet|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|FullyPatternMatchable| (|PAdicInteger| 6))
                 (|PatternMatchable| 11) (|PatternMatchable| 51)
                 (|StepThrough|) (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyEvalableOver| (|PAdicInteger| 6))
                 (|Evalable| (|PAdicInteger| 6)) (|RetractableTo| 11)
                 (|RetractableTo| 25) (|RealConstant|) (|RetractableTo| 41)
                 (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| (|PAdicInteger| 6))
                 (|Patternable| (|PAdicInteger| 6)) (|ConvertibleTo| 37)
                 (|ConvertibleTo| 36) (|Eltable| (|PAdicInteger| 6) $$)
                 (|InnerEvalable| (|PAdicInteger| 6) (|PAdicInteger| 6))
                 (|InnerEvalable| 41 (|PAdicInteger| 6)) (|CoercibleFrom| 11)
                 (|CoercibleFrom| 25) (|PartialOrder|) (|ConvertibleTo| 51)
                 (|ConvertibleTo| 52) (|ConvertibleTo| 35) (|CoercibleFrom| 41)
                 (|CoercibleTo| 8) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| (|PAdicInteger| 6))
                 (|Type|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
