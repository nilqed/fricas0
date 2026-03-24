
(SDEFUN |DECIMAL;decimal;F%;1| ((|r| (|Fraction| (|Integer|))) (% (%)))
        (SPADCALL |r| (QREFELT % 7))) 

(PUT '|DECIMAL;coerce;%Re;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DECIMAL;coerce;%Re;2| ((|x| (%)) (% (|RadixExpansion| 10))) |x|) 

(DECLAIM (NOTINLINE |DecimalExpansion;|)) 

(DEFUN |DecimalExpansion;| ()
  (SPROG ((|dv$| NIL) (% NIL) (#1=#:G34 NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DecimalExpansion|))
          (LETT % (GETREFV 53))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| (|Integer|)
                                                             '(|PolynomialFactorizationExplicit|))
                                              (|HasCategory| (|Integer|)
                                                             '(|RetractableTo|
                                                               (|Symbol|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|RealConstant|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedIntegralDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedSet|))
                                              (OR
                                               (|HasCategory| (|Integer|)
                                                              '(|OrderedIntegralDomain|))
                                               (|HasCategory| (|Integer|)
                                                              '(|OrderedSet|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|StepThrough|))
                                              (|HasCategory| (|Integer|)
                                                             '(|InnerEvalable|
                                                               (|Symbol|)
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|Evalable|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|Eltable|
                                                               (|Integer|)
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|DifferentialRing|))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Float|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Integer|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Float|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|EuclideanDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegerNumberSystem|))
                                              (LETT #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|Comparable|)))
                                              (OR #1#
                                                  (|HasCategory| (|Integer|)
                                                                 '(|OrderedIntegralDomain|))
                                                  (|HasCategory| (|Integer|)
                                                                 '(|OrderedSet|)))))))
          (|haddProp| |$ConstructorCache| '|DecimalExpansion| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|CharacteristicNonZero|))
               (|HasCategory| (|Integer|) '(|PolynomialFactorizationExplicit|))
               (|augmentPredVector| % 33554432))
          (AND
           (OR
            (AND (|HasCategory| % '(|CharacteristicNonZero|))
                 (|HasCategory| (|Integer|)
                                '(|PolynomialFactorizationExplicit|)))
            (|HasCategory| (|Integer|) '(|CharacteristicNonZero|)))
           (|augmentPredVector| % 67108864))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |DecimalExpansion| ()
  (SPROG NIL
         (PROG (#1=#:G36)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DecimalExpansion|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DecimalExpansion|
                             (LIST (CONS NIL (CONS 1 (|DecimalExpansion;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|DecimalExpansion|)))))))))) 

(MAKEPROP '|DecimalExpansion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|RadixExpansion| '10) (|Fraction| 14)
              (0 . |coerce|) |DECIMAL;decimal;F%;1| |DECIMAL;coerce;%Re;2|
              (|Boolean|) (|OutputForm|) (|String|) (|PositiveInteger|)
              (|Integer|) (|Union| % '"failed") (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 19 '"failed")
              (|Record| (|:| |coef| 19) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 24 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|Union| 14 '#1="failed") (|Mapping| 14 14)
              (|Record| (|:| |mat| 33) (|:| |vec| (|Vector| 14))) (|Matrix| %)
              (|Vector| %) (|Matrix| 14) (|Union| 32 '#2="failed")
              (|InputForm|) (|Pattern| 49) (|Pattern| 14) (|List| 14)
              (|Equation| 14) (|List| 39) (|Symbol|) (|List| 41) (|List| 16)
              (|PatternMatchResult| 49 %) (|PatternMatchResult| 14 %)
              (|Union| 47 '#2#) (|List| 20) (|Factored| 20) (|Float|)
              (|DoubleFloat|) (|Union| 6 '#1#) (|Union| 41 '#1#))
           '#(~= 5 |zero?| 11 |wholePart| 16 |unitNormal| 21 |unitCanonical| 26
              |unit?| 31 |subtractIfCan| 36 |squareFreePolynomial| 42
              |squareFreePart| 47 |squareFree| 52
              |solveLinearPolynomialEquation| 57 |smaller?| 63 |sizeLess?| 69
              |sign| 75 |sample| 80 |rightRecip| 84 |rightPower| 89
              |retractIfCan| 101 |retract| 121 |rem| 141 |reducedSystem| 147
              |recip| 169 |quo| 174 |principalIdeal| 180 |prime?| 185
              |positive?| 190 |plenaryPower| 195 |patternMatch| 201 |opposite?|
              215 |one?| 221 |numerator| 226 |numer| 231 |nextItem| 236
              |negative?| 241 |multiEuclidean| 246 |min| 252 |max| 258 |map|
              264 |leftRecip| 270 |leftPower| 275 |lcmCoef| 287 |lcm| 293
              |latex| 304 |inv| 309 |init| 314 |gcdPolynomial| 318 |gcd| 324
              |fractionPart| 335 |floor| 345 |factorSquareFreePolynomial| 350
              |factorPolynomial| 355 |factor| 360 |extendedEuclidean| 365
              |exquo| 378 |expressIdealMember| 384 |eval| 390 |euclideanSize|
              430 |elt| 435 |divide| 441 |differentiate| 447 |denominator| 497
              |denom| 502 |decimal| 507 |convert| 512 |conditionP| 537
              |commutator| 542 |coerce| 548 |charthRoot| 583 |characteristic|
              588 |ceiling| 592 |associator| 597 |associates?| 604
              |antiCommutator| 610 |annihilate?| 616 |abs| 622 ^ 627 |Zero| 645
              |One| 649 D 653 >= 703 > 709 = 715 <= 721 < 727 / 733 - 745 + 756
              * 762)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 0 0 0 7 0 0 7 0 0 0 0 16 15 4 3 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 7 0 0 0 0 0 7 0 0 0 0 0
                                  0 0 7 0 7 0 0 0 9 0 0 0 0 0 20 19 11 25 0 0 0
                                  13 10 6 2 0 0 0 0 18 17 14 13 12 10 8 6 6 5 2
                                  0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|QuotientFieldCategory&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL NIL |DivisionRing&| |DifferentialExtension&|
                |DifferentialRing&| |PartialDifferentialRing&| NIL NIL
                |Algebra&| |EntireRing&| |Algebra&| |Algebra&| NIL NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |Module&| |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL NIL NIL NIL
                NIL |AbelianSemiGroup&| |Magma&| |FullyEvalableOver&|
                |Evalable&| |RetractableTo&| NIL |RetractableTo&|
                |SetCategory&| NIL |RetractableTo&| NIL NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL |PartialOrder&| NIL NIL
                NIL NIL NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 14) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|LeftOreRing|) (|CommutativeRing|)
                 (|DivisionRing|) (|DifferentialExtension| 14)
                 (|DifferentialRing|) (|PartialDifferentialRing| 41)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 6) (|Algebra| 14)
                 (|Ring|) (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 6) (|NonAssociativeAlgebra| 14)
                 (|SemiRng|) (|Module| $$) (|Module| 6) (|Module| 14)
                 (|FullyLinearlyExplicitOver| 14) (|OrderedAbelianGroup|)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|BiModule| 14 14) (|LinearlyExplicitOver| 14)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 6)
                 (|RightModule| 6) (|LeftModule| 14) (|RightModule| 14)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|OrderedSet|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|FullyPatternMatchable| 14)
                 (|PatternMatchable| 14) (|PatternMatchable| 49)
                 (|StepThrough|) (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyEvalableOver| 14) (|Evalable| 14) (|RetractableTo| 6)
                 (|RealConstant|) (|RetractableTo| 41) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| 14) (|Patternable| 14)
                 (|ConvertibleTo| 37) (|ConvertibleTo| 36) (|Eltable| 14 $$)
                 (|InnerEvalable| 14 14) (|InnerEvalable| 41 14)
                 (|CoercibleFrom| 6) (|PartialOrder|) (|ConvertibleTo| 49)
                 (|ConvertibleTo| 50) (|ConvertibleTo| 35) (|CoercibleFrom| 41)
                 (|CoercibleTo| 11) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| 14) (|Type|))
              (|makeByteWordVec2| 52
                                  '(1 0 0 6 7 2 0 10 0 0 1 1 0 10 0 1 1 22 14 0
                                    1 1 0 17 0 1 1 0 0 0 1 1 0 10 0 1 2 0 15 0
                                    0 1 1 1 48 20 1 1 0 0 0 1 1 0 27 0 1 2 1 46
                                    47 20 1 2 24 10 0 0 1 2 0 10 0 0 1 1 7 14 0
                                    1 0 0 0 1 1 0 15 0 1 2 0 0 0 13 1 2 0 0 0
                                    16 1 1 0 28 0 1 1 10 51 0 1 1 10 28 0 1 1 2
                                    52 0 1 1 0 14 0 1 1 10 6 0 1 1 10 14 0 1 1
                                    2 41 0 1 2 0 0 0 0 1 2 0 30 31 32 1 1 0 33
                                    31 1 1 21 33 31 1 2 21 30 31 32 1 1 0 15 0
                                    1 2 0 0 0 0 1 1 0 22 19 1 1 0 10 0 1 1 7 10
                                    0 1 2 0 0 0 13 1 3 19 44 0 36 44 1 3 20 45
                                    0 37 45 1 2 0 10 0 0 1 1 0 10 0 1 1 0 0 0 1
                                    1 0 14 0 1 1 11 15 0 1 1 7 10 0 1 2 0 21 19
                                    0 1 2 8 0 0 0 1 2 8 0 0 0 1 2 0 0 29 0 1 1
                                    0 15 0 1 2 0 0 0 13 1 2 0 0 0 16 1 2 0 18 0
                                    0 1 2 0 0 0 0 1 1 0 0 19 1 1 0 12 0 1 1 0 0
                                    0 1 0 11 0 1 2 0 20 20 20 1 2 0 0 0 0 1 1 0
                                    0 19 1 1 0 6 0 1 1 22 0 0 1 1 23 14 0 1 1 1
                                    48 20 1 1 1 48 20 1 1 0 27 0 1 3 0 25 0 0 0
                                    1 2 0 26 0 0 1 2 0 15 0 0 1 2 0 21 19 0 1 3
                                    13 0 0 38 38 1 2 13 0 0 39 1 3 13 0 0 14 14
                                    1 2 13 0 0 40 1 3 12 0 0 41 14 1 3 12 0 0
                                    42 38 1 1 0 16 0 1 2 14 0 0 14 1 2 0 23 0 0
                                    1 3 0 0 0 29 16 1 2 0 0 0 29 1 1 16 0 0 1 2
                                    16 0 0 16 1 2 15 0 0 42 1 2 15 0 0 41 1 3
                                    15 0 0 41 16 1 3 15 0 0 42 43 1 1 0 0 0 1 1
                                    0 14 0 1 1 0 0 6 8 1 5 35 0 1 1 17 36 0 1 1
                                    18 37 0 1 1 6 49 0 1 1 6 50 0 1 1 26 34 31
                                    1 2 0 0 0 0 1 1 0 11 0 1 1 0 0 14 1 1 0 0 0
                                    1 1 0 0 6 7 1 0 5 0 9 1 0 6 0 1 1 2 0 41 1
                                    1 27 15 0 1 0 0 16 1 1 23 14 0 1 3 0 0 0 0
                                    0 1 2 0 10 0 0 1 2 0 0 0 0 1 2 0 10 0 0 1 1
                                    7 0 0 1 2 0 0 0 13 1 2 0 0 0 16 1 2 0 0 0
                                    14 1 0 0 0 1 0 0 0 1 3 0 0 0 29 16 1 2 0 0
                                    0 29 1 1 16 0 0 1 2 16 0 0 16 1 2 15 0 0 41
                                    1 3 15 0 0 41 16 1 2 15 0 0 42 1 3 15 0 0
                                    42 43 1 2 8 10 0 0 1 2 8 10 0 0 1 2 0 10 0
                                    0 1 2 8 10 0 0 1 2 8 10 0 0 1 2 0 0 0 0 1 2
                                    0 0 14 14 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 13 0 1 2 0 0 0 0 1 2 0 0 14 0 1 2 0
                                    0 16 0 1 2 0 0 0 6 1 2 0 0 6 0 1 2 0 0 0 14
                                    1 2 21 0 0 14 1)))))
           '|lookupComplete|)) 
