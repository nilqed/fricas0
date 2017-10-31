
(SDEFUN |MCMPLX;coerce;C$;1| ((|u| |Complex| (|Float|)) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 8)) (QREFELT $ 10))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 11)) (QREFELT $ 10))
                  (QREFELT $ 12))) 

(SDEFUN |MCMPLX;coerce;C$;2| ((|u| |Complex| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 16)) (QREFELT $ 17))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 18)) (QREFELT $ 17))
                  (QREFELT $ 12))) 

(SDEFUN |MCMPLX;coerce;C$;3| ((|u| |Complex| (|MachineInteger|)) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 23))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 24)) (QREFELT $ 23))
                  (QREFELT $ 12))) 

(SDEFUN |MCMPLX;coerce;C$;4| ((|u| |Complex| (|MachineFloat|)) ($ $))
        (SPADCALL (SPADCALL |u| (QREFELT $ 26)) (SPADCALL |u| (QREFELT $ 27))
                  (QREFELT $ 12))) 

(SDEFUN |MCMPLX;coerce;$C;5| ((|u| $) ($ |Complex| (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 29)) (QREFELT $ 30))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 31)) (QREFELT $ 30))
                  (QREFELT $ 32))) 

(DECLAIM (NOTINLINE |MachineComplex;|)) 

(DEFUN |MachineComplex| ()
  (SPROG NIL
         (PROG (#1=#:G777)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MachineComplex|)
                    . #2=(|MachineComplex|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MachineComplex|
                             (LIST (CONS NIL (CONS 1 (|MachineComplex;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|MachineComplex|)))))))))) 

(DEFUN |MachineComplex;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G775 NIL) (#2=#:G774 NIL) (#3=#:G773 NIL)
    (#4=#:G772 NIL) (#5=#:G771 NIL) (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|MachineComplex|) . #6=(|MachineComplex|))
    (LETT $ (GETREFV 90) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|FiniteFieldCategory|))
                                        (LETT #1#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|Field|))
                                              . #6#)
                                        (OR #1#
                                            (|HasCategory| (|MachineFloat|)
                                                           '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|Finite|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|EuclideanDomain|))
                                        (LETT #2#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|TranscendentalFunctionCategory|))
                                              . #6#)
                                        (AND
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|RadicalCategory|))
                                         #2#)
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|arbitraryPrecision|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|RealConstant|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (OR
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|EuclideanDomain|))
                                         #1#
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|additiveValuation|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|multiplicativeValuation|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|DifferentialRing|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|InnerEvalable|
                                                         (|Symbol|)
                                                         (|MachineFloat|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|Evalable|
                                                         (|MachineFloat|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|Eltable|
                                                         (|MachineFloat|)
                                                         (|MachineFloat|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (OR
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #1#)
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|PolynomialFactorizationExplicit|))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| (|MachineFloat|)
                                                              '(|EuclideanDomain|))
                                               (|HasCategory| (|MachineFloat|)
                                                              '(|PolynomialFactorizationExplicit|)))
                                              . #6#)
                                        (OR #3#
                                            (AND #1#
                                                 (|HasCategory|
                                                  (|MachineFloat|)
                                                  '(|PolynomialFactorizationExplicit|)))
                                            (AND
                                             (|HasCategory| (|MachineFloat|)
                                                            '(|FiniteFieldCategory|))
                                             (|HasCategory| (|MachineFloat|)
                                                            '(|PolynomialFactorizationExplicit|))))
                                        (LETT #4#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|IntegerNumberSystem|))
                                              . #6#)
                                        (OR #3# #1#
                                            (AND
                                             (|HasCategory| (|MachineFloat|)
                                                            '(|FiniteFieldCategory|))
                                             (|HasCategory| (|MachineFloat|)
                                                            '(|PolynomialFactorizationExplicit|)))
                                            #4#)
                                        (OR
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|EuclideanDomain|))
                                         #1#
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|FiniteFieldCategory|))
                                         #4#)
                                        (OR #3# #1# #4#)
                                        (LETT #5#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|RealNumberSystem|))
                                              . #6#)
                                        (AND #5# #2#)
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|IntegralDomain|))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|MachineComplex| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND
     (OR
      (AND (|HasCategory| $ '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|EuclideanDomain|))
           (|HasCategory| (|MachineFloat|)
                          '(|PolynomialFactorizationExplicit|)))
      (|HasCategory| (|MachineFloat|) '(|CharacteristicNonZero|)))
     (|augmentPredVector| $ 137438953472))
    (AND
     (OR
      (AND (|HasCategory| $ '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|EuclideanDomain|))
           (|HasCategory| (|MachineFloat|)
                          '(|PolynomialFactorizationExplicit|)))
      (|HasCategory| (|MachineFloat|) '(|FiniteFieldCategory|)))
     (|augmentPredVector| $ 274877906944))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|MachineComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Complex| 9) (|Float|) (|Complex| 6)
              (0 . |real|) (|MachineFloat|) (5 . |coerce|) (10 . |imag|)
              (15 . |complex|) |MCMPLX;coerce;C$;1| (|Integer|) (|Complex| 14)
              (21 . |real|) (26 . |coerce|) (31 . |imag|) |MCMPLX;coerce;C$;2|
              (|MachineInteger|) (|Complex| 20) (36 . |real|) (41 . |coerce|)
              (46 . |imag|) |MCMPLX;coerce;C$;3| (51 . |real|) (56 . |imag|)
              |MCMPLX;coerce;C$;4| (61 . |real|) (66 . |coerce|) (71 . |imag|)
              (76 . |complex|) |MCMPLX;coerce;$C;5| (|Factored| 35)
              (|SparseUnivariatePolynomial| $) (|Union| 37 '#1="failed")
              (|List| 35) (|Fraction| 14) (|Record| (|:| |r| 9) (|:| |phi| 9))
              (|Factored| $) (|Boolean|) (|Union| $ '"failed")
              (|Union| 62 '#1#) (|Matrix| $) (|InputForm|) (|Pattern| 6)
              (|Pattern| 14) (|NonNegativeInteger|) (|Union| 50 '#2="failed")
              (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 52 '#2#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 50) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 9) (|List| 59) (|Equation| 9)
              (|SparseUnivariatePolynomial| 9) (|Matrix| 9) (|Vector| $)
              (|Mapping| 9 9) (|Fraction| 60) (|PositiveInteger|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Table| 65 48) (|Record| (|:| |factor| 14) (|:| |exponent| 14))
              (|List| 68) (|OnePointCompletion| 65) (|Union| 48 '"failed")
              (|Symbol|) (|List| 72) (|Union| 38 '"failed")
              (|Record| (|:| |mat| 76) (|:| |vec| (|Vector| 14))) (|Matrix| 14)
              (|List| 48) (|PatternMatchResult| 6 $)
              (|PatternMatchResult| 14 $) (|Complex| (|DoubleFloat|))
              (|Vector| 9) (|Union| 9 '#3="failed")
              (|Record| (|:| |mat| 61) (|:| |vec| 81)) (|Union| 14 '#3#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#(~= 82 |zero?| 88 |unitNormal| 93 |unitCanonical| 98 |unit?| 103
              |traceMatrix| 108 |trace| 117 |tanh| 122 |tan| 127
              |tableForDiscreteLogarithm| 132 |subtractIfCan| 137
              |squareFreePolynomial| 143 |squareFreePart| 148 |squareFree| 153
              |sqrt| 158 |solveLinearPolynomialEquation| 163 |smaller?| 169
              |sizeLess?| 175 |size| 181 |sinh| 185 |sin| 190 |sech| 195 |sec|
              200 |sample| 205 |retractIfCan| 209 |retract| 224 |represents|
              239 |representationType| 250 |rem| 254 |regularRepresentation|
              260 |reducedSystem| 271 |reduce| 293 |recip| 303 |real| 308
              |rationalIfCan| 313 |rational?| 318 |rational| 323 |rank| 328
              |random| 332 |quo| 336 |principalIdeal| 342 |primitiveElement|
              347 |primitive?| 351 |primeFrobenius| 356 |prime?| 367
              |polarCoordinates| 372 |pi| 377 |patternMatch| 381 |order| 395
              |opposite?| 405 |one?| 411 |nthRoot| 416 |norm| 422 |nextItem|
              427 |multiEuclidean| 432 |minimalPolynomial| 438 |min| 443 |max|
              449 |map| 455 |lookup| 461 |log| 466 |lift| 471 |lcmCoef| 476
              |lcm| 482 |latex| 493 |inv| 498 |init| 503 |index| 507
              |imaginary| 512 |imag| 516 |hashUpdate!| 521 |hash| 527
              |generator| 532 |gcdPolynomial| 536 |gcd| 542
              |factorsOfCyclicGroupSize| 553 |factorSquareFreePolynomial| 557
              |factorPolynomial| 562 |factor| 567 |extendedEuclidean| 572
              |exquo| 585 |expressIdealMember| 597 |exp| 603 |eval| 608
              |euclideanSize| 648 |enumerate| 653 |elt| 657 |divide| 663
              |discriminant| 669 |discreteLog| 678 |differentiate| 689
              |derivationCoordinates| 739 |definingPolynomial| 745 |csch| 749
              |csc| 754 |createPrimitiveElement| 759 |coth| 763 |cot| 768
              |cosh| 773 |cos| 778 |coordinates| 783 |convert| 805 |conjugate|
              850 |conditionP| 855 |complex| 860 |coerce| 866 |charthRoot| 921
              |characteristicPolynomial| 931 |characteristic| 936 |basis| 940
              |atanh| 944 |atan| 949 |associates?| 954 |asinh| 960 |asin| 965
              |asech| 970 |asec| 975 |argument| 980 |annihilate?| 985 |acsch|
              991 |acsc| 996 |acoth| 1001 |acot| 1006 |acosh| 1011 |acos| 1016
              |abs| 1021 ^ 1026 |Zero| 1056 |One| 1060 D 1064 >= 1114 > 1120 =
              1126 <= 1132 < 1138 / 1144 - 1150 + 1161 * 1167)
           'NIL
           (CONS
            (|makeByteWordVec2| 33
                                '(0 0 2 2 4 30 15 32 15 0 0 33 0 0 3 0 0 0 0 3
                                  9 0 0 0 0 0 1 3 5 8 18 19 0 0 0 3 0 0 0 0 0 3
                                  3 0 0 0 0 0 0 0 0 6 0 0 0 0 2 23 24 0 0 0 10
                                  21 0 0 0 0 0 0 0 0 0 0 3 3 7 11 10 10 10 10
                                  10 12 13 13 14 16 17 20 21 22 25 26))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |FramedAlgebra&|
                |GcdDomain&| NIL |FiniteRankAlgebra&| |DivisionRing&|
                |DifferentialExtension&| |FullyLinearlyExplicitOver&|
                |Algebra&| |Algebra&| |Algebra&| NIL NIL NIL |Module&|
                |EntireRing&| |Module&| NIL |Module&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL |Ring&|
                NIL NIL NIL NIL |Rng&| NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |OrderedSet&| |AbelianMonoid&| |Monoid&| NIL |Finite&|
                |FullyEvalableOver&| NIL |SemiGroup&| |AbelianSemiGroup&| NIL
                NIL NIL NIL |FullyRetractableTo&| |SetCategory&|
                |TranscendentalFunctionCategory&| |Evalable&| NIL
                |RetractableTo&| NIL |RetractableTo&| |PartialOrder&| NIL NIL
                NIL |BasicType&| NIL NIL NIL |RetractableTo&|
                |RadicalCategory&| |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL NIL |InnerEvalable&| |InnerEvalable&| NIL
                NIL NIL)
             (CONS
              '#((|ComplexCategory| 9) (|MonogenicAlgebra| 9 60)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|FortranMachineTypeCategory|)
                 (|FramedAlgebra| 9 60) (|GcdDomain|) (|IntegralDomain|)
                 (|FiniteRankAlgebra| 9 60) (|DivisionRing|)
                 (|DifferentialExtension| 9) (|FullyLinearlyExplicitOver| 9)
                 (|Algebra| 9) (|Algebra| $$) (|Algebra| 38) (|LeftOreRing|)
                 (|CommutativeRing|) (|LinearlyExplicitOver| 9) (|Module| 9)
                 (|EntireRing|) (|Module| $$) (|CharacteristicZero|)
                 (|Module| 38) (|CharacteristicNonZero|)
                 (|LinearlyExplicitOver| 14) (|PartialDifferentialRing| 72)
                 (|DifferentialRing|) (|BiModule| 9 9) (|BiModule| $$ $$)
                 (|Ring|) (|BiModule| 38 38) (|RightModule| 9) (|LeftModule| 9)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$) (|LeftModule| 38)
                 (|RightModule| 38) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|FullyPatternMatchable| 9) (|OrderedSet|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|Finite|) (|FullyEvalableOver| 9)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|StepThrough|) (|PatternMatchable| 6) (|PatternMatchable| 14)
                 (|Patternable| 9) (|FullyRetractableTo| 9) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|Evalable| 9) (|Type|)
                 (|RetractableTo| 9) (|ConvertibleTo| 60) (|RetractableTo| 14)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 88)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|RetractableTo| 38) (|RadicalCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|arbitraryPrecision|)
                 (|ConvertibleTo| 7) (|ConvertibleTo| 80) (|ConvertibleTo| 45)
                 (|additiveValuation|) (|multiplicativeValuation|)
                 (|InnerEvalable| 72 9) (|InnerEvalable| 9 9) (|Eltable| 9 $$)
                 (|ConvertibleTo| 46) (|ConvertibleTo| 47))
              (|makeByteWordVec2| 89
                                  '(1 7 6 0 8 1 9 0 6 10 1 7 6 0 11 2 0 0 9 9
                                    12 1 15 14 0 16 1 9 0 14 17 1 15 14 0 18 1
                                    21 20 0 22 1 9 0 20 23 1 21 20 0 24 1 5 9 0
                                    26 1 5 9 0 27 1 0 9 0 29 1 9 6 0 30 1 0 9 0
                                    31 2 7 0 6 6 32 2 0 41 0 0 1 1 0 41 0 1 1 0
                                    85 0 1 1 0 0 0 1 1 0 41 0 1 1 0 61 62 1 0 0
                                    61 1 1 0 9 0 1 1 10 0 0 1 1 10 0 0 1 1 2 67
                                    14 1 2 0 42 0 0 1 1 29 34 35 1 1 34 0 0 1 1
                                    34 40 0 1 1 11 0 0 1 2 29 36 37 35 1 2 0 41
                                    0 0 1 2 9 41 0 0 1 0 6 48 1 1 10 0 0 1 1 10
                                    0 0 1 1 10 0 0 1 1 10 0 0 1 0 0 0 1 1 7 74
                                    0 1 1 0 82 0 1 1 0 84 0 1 1 7 38 0 1 1 0 9
                                    0 1 1 0 14 0 1 2 0 0 81 62 1 1 0 0 81 1 0 2
                                    66 1 2 9 0 0 0 1 2 0 61 0 62 1 1 0 61 0 1 2
                                    8 75 44 62 1 1 8 76 44 1 1 0 61 44 1 2 0 83
                                    44 62 1 1 3 42 64 1 1 0 0 60 1 1 0 42 0 1 1
                                    0 9 0 29 1 31 74 0 1 1 31 41 0 1 1 31 38 0
                                    1 0 0 65 1 0 6 0 1 2 9 0 0 0 1 1 9 55 50 1
                                    0 2 0 1 1 2 41 0 1 2 2 0 0 48 1 1 2 0 0 1 1
                                    34 41 0 1 1 36 39 0 1 0 10 0 1 3 23 78 0 46
                                    78 1 3 24 79 0 47 79 1 1 2 65 0 1 1 2 70 0
                                    1 2 0 41 0 0 1 1 0 41 0 1 2 11 0 0 14 1 1 0
                                    9 0 1 1 2 42 0 1 2 9 49 50 0 1 1 3 60 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 0 0 63 0 1 1 6 65 0
                                    1 1 10 0 0 1 1 0 60 0 1 2 9 56 0 0 1 1 9 0
                                    50 1 2 9 0 0 0 1 1 0 87 0 1 1 3 0 0 1 0 2 0
                                    1 1 6 0 65 1 0 0 0 1 1 0 9 0 31 2 0 86 86 0
                                    1 1 0 89 0 1 0 0 0 1 2 9 35 35 35 1 1 9 0
                                    50 1 2 9 0 0 0 1 0 2 69 1 1 29 34 35 1 1 29
                                    34 35 1 1 34 40 0 1 2 9 51 0 0 1 3 9 53 0 0
                                    0 1 2 37 42 0 9 1 2 0 42 0 0 1 2 9 49 50 0
                                    1 1 10 0 0 1 3 21 0 0 9 9 1 3 21 0 0 57 57
                                    1 2 21 0 0 58 1 2 21 0 0 59 1 3 20 0 0 72 9
                                    1 3 20 0 0 73 57 1 1 9 48 0 1 0 6 50 1 2 22
                                    0 0 9 1 2 9 54 0 0 1 1 0 9 62 1 0 0 9 1 1 2
                                    48 0 1 2 2 71 0 0 1 1 19 0 0 1 2 19 0 0 48
                                    1 2 18 0 0 73 1 2 18 0 0 72 1 3 18 0 0 73
                                    77 1 3 18 0 0 72 48 1 2 0 0 0 63 1 3 0 0 0
                                    63 48 1 2 3 61 62 63 1 0 0 60 1 1 10 0 0 1
                                    1 10 0 0 1 0 2 0 1 1 10 0 0 1 1 10 0 0 1 1
                                    10 0 0 1 1 10 0 0 1 2 0 81 0 62 1 2 0 61 62
                                    62 1 1 0 61 62 1 1 0 81 0 1 1 14 45 0 1 1
                                    25 46 0 1 1 26 47 0 1 1 13 7 0 1 1 13 80 0
                                    1 1 0 81 0 1 1 0 0 81 1 1 0 60 0 1 1 0 0 60
                                    1 1 0 0 0 1 1 39 43 44 1 2 0 0 9 9 12 1 27
                                    0 38 1 1 0 7 0 33 1 0 0 5 28 1 0 0 21 25 1
                                    0 0 15 19 1 0 0 7 13 1 0 0 9 1 1 0 0 14 1 1
                                    0 0 0 1 1 0 0 14 1 1 0 88 0 1 1 38 42 0 1 1
                                    2 0 0 1 1 0 60 0 1 0 0 48 1 0 0 62 1 1 10 0
                                    0 1 1 10 0 0 1 2 0 41 0 0 1 1 10 0 0 1 1 10
                                    0 0 1 1 10 0 0 1 1 10 0 0 1 1 10 9 0 1 2 0
                                    41 0 0 1 1 10 0 0 1 1 10 0 0 1 1 10 0 0 1 1
                                    10 0 0 1 1 10 0 0 1 1 10 0 0 1 1 35 0 0 1 2
                                    11 0 0 38 1 2 3 0 0 14 1 2 10 0 0 0 1 2 0 0
                                    0 48 1 2 0 0 0 65 1 0 0 0 1 0 0 0 1 1 19 0
                                    0 1 2 19 0 0 48 1 2 18 0 0 73 1 2 18 0 0 72
                                    1 3 18 0 0 72 48 1 3 18 0 0 73 77 1 3 0 0 0
                                    63 48 1 2 0 0 0 63 1 2 0 41 0 0 1 2 0 41 0
                                    0 1 2 0 41 0 0 1 2 0 41 0 0 1 2 0 41 0 0 1
                                    2 3 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 2 3 0 0 38 1 2 3 0 38 0 1 2 0 0 0 9 1 2 0
                                    0 9 0 1 2 0 0 14 0 1 2 0 0 0 0 1 2 0 0 48 0
                                    1 2 0 0 65 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineComplex| 'NILADIC T) 
