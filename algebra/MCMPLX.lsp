
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
         (PROG (#1=#:G784)
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
   ((|dv$| NIL) ($ NIL) (#1=#:G782 NIL) (#2=#:G781 NIL) (#3=#:G780 NIL)
    (#4=#:G779 NIL) (#5=#:G778 NIL) (|pv$| NIL))
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
                                        (LETT #3#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|PolynomialFactorizationExplicit|))
                                              . #6#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|EuclideanDomain|))
                                          #3#)
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|FiniteFieldCategory|)))
                                        (LETT #4#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|IntegerNumberSystem|))
                                              . #6#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|EuclideanDomain|))
                                          #3#)
                                         #1#
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|FiniteFieldCategory|))
                                         #4#)
                                        (OR
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|EuclideanDomain|))
                                         #1#
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|FiniteFieldCategory|))
                                         #4#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|EuclideanDomain|))
                                          #3#)
                                         #1# #4#)
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
           (|HasCategory| (|MachineFloat|) '(|EuclideanDomain|)) #3#)
      (|HasCategory| (|MachineFloat|) '(|CharacteristicNonZero|)))
     (|augmentPredVector| $ 68719476736))
    (AND
     (OR
      (AND (|HasCategory| $ '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|EuclideanDomain|)) #3#)
      (AND (|HasCategory| $ '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|FiniteFieldCategory|))))
     (|augmentPredVector| $ 137438953472))
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
              (76 . |complex|) |MCMPLX;coerce;$C;5| (|Fraction| 14)
              (|Record| (|:| |r| 9) (|:| |phi| 9)) (|Boolean|) (|Factored| $)
              (|Union| 39 '#1="failed") (|List| 40)
              (|SparseUnivariatePolynomial| $) (|Factored| 40)
              (|Union| 62 '#1#) (|Matrix| $) (|Union| $ '"failed")
              (|InputForm|) (|Pattern| 6) (|Pattern| 14) (|NonNegativeInteger|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 49 '#2="failed") (|Union| 52 '#2#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 52) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 9) (|Equation| 9) (|List| 58)
              (|SparseUnivariatePolynomial| 9) (|Matrix| 9) (|Vector| $)
              (|Mapping| 9 9) (|Fraction| 60) (|PositiveInteger|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Table| 65 48) (|Record| (|:| |factor| 14) (|:| |exponent| 14))
              (|List| 68) (|OnePointCompletion| 65) (|Union| 48 '"failed")
              (|Symbol|) (|List| 72) (|Union| 34 '"failed") (|Matrix| 14)
              (|Record| (|:| |mat| 75) (|:| |vec| (|Vector| 14))) (|List| 48)
              (|PatternMatchResult| 6 $) (|PatternMatchResult| 14 $)
              (|Complex| (|DoubleFloat|)) (|Vector| 9) (|Union| 9 '#3="failed")
              (|Record| (|:| |mat| 61) (|:| |vec| 81)) (|Union| 14 '#3#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#(~= 82 |zero?| 88 |unitNormal| 93 |unitCanonical| 98 |unit?| 103
              |traceMatrix| 108 |trace| 117 |tanh| 122 |tan| 127
              |tableForDiscreteLogarithm| 132 |subtractIfCan| 137
              |squareFreePolynomial| 143 |squareFreePart| 148 |squareFree| 153
              |sqrt| 158 |solveLinearPolynomialEquation| 163 |smaller?| 169
              |sizeLess?| 175 |size| 181 |sinh| 185 |sin| 190 |sech| 195 |sec|
              200 |sample| 205 |rightRecip| 209 |rightPower| 214 |retractIfCan|
              226 |retract| 241 |represents| 256 |representationType| 267 |rem|
              271 |regularRepresentation| 277 |reducedSystem| 288 |reduce| 310
              |recip| 320 |real| 325 |rationalIfCan| 330 |rational?| 335
              |rational| 340 |rank| 345 |random| 349 |quo| 353 |principalIdeal|
              359 |primitiveElement| 364 |primitive?| 368 |primeFrobenius| 373
              |prime?| 384 |polarCoordinates| 389 |pi| 394 |patternMatch| 398
              |order| 412 |opposite?| 422 |one?| 428 |nthRoot| 433 |norm| 439
              |nextItem| 444 |multiEuclidean| 449 |minimalPolynomial| 455 |min|
              460 |max| 466 |map| 472 |lookup| 478 |log| 483 |lift| 488
              |leftRecip| 493 |leftPower| 498 |lcmCoef| 510 |lcm| 516 |latex|
              527 |inv| 532 |init| 537 |index| 541 |imaginary| 546 |imag| 550
              |hashUpdate!| 555 |hash| 561 |generator| 566 |gcdPolynomial| 570
              |gcd| 576 |factorsOfCyclicGroupSize| 587
              |factorSquareFreePolynomial| 591 |factorPolynomial| 596 |factor|
              601 |extendedEuclidean| 606 |exquo| 619 |expressIdealMember| 631
              |exp| 637 |eval| 642 |euclideanSize| 682 |enumerate| 687 |elt|
              691 |divide| 697 |discriminant| 703 |discreteLog| 712
              |differentiate| 723 |derivationCoordinates| 773
              |definingPolynomial| 779 |csch| 783 |csc| 788
              |createPrimitiveElement| 793 |coth| 797 |cot| 802 |cosh| 807
              |cos| 812 |coordinates| 817 |convert| 839 |conjugate| 884
              |conditionP| 889 |complex| 894 |commutator| 900 |coerce| 906
              |charthRoot| 956 |characteristicPolynomial| 966 |characteristic|
              971 |basis| 975 |atanh| 979 |atan| 984 |associator| 989
              |associates?| 996 |asinh| 1002 |asin| 1007 |asech| 1012 |asec|
              1017 |argument| 1022 |antiCommutator| 1027 |annihilate?| 1033
              |acsch| 1039 |acsc| 1044 |acoth| 1049 |acot| 1054 |acosh| 1059
              |acos| 1064 |abs| 1069 ^ 1074 |Zero| 1104 |One| 1108 D 1112 >=
              1162 > 1168 = 1174 <= 1180 < 1186 / 1192 - 1198 + 1209 * 1215)
           'NIL
           (CONS
            (|makeByteWordVec2| 32
                                '(0 0 2 2 4 29 15 31 15 0 32 0 0 0 0 0 0 3 9 0
                                  0 0 0 1 3 5 8 18 19 0 0 0 0 0 0 3 0 0 0 0 3 0
                                  0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 6 0 0 0 0 2
                                  23 24 0 0 0 10 21 0 0 0 0 0 0 0 0 0 0 3 3 7
                                  11 10 10 10 10 10 12 13 13 14 16 17 20 21 22
                                  25 26))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |FramedAlgebra&| NIL |DifferentialExtension&|
                |FullyLinearlyExplicitOver&| |FiniteRankAlgebra&|
                |DivisionRing&| NIL NIL |Algebra&| |EntireRing&| |Algebra&| NIL
                |Algebra&| NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Rng&| NIL |Module&| |Module&| NIL
                |Module&| |FramedModule&| NIL NIL |NonAssociativeRing&| NIL NIL
                NIL NIL |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&| NIL
                NIL NIL NIL |OrderedSet&| NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Finite&|
                |FullyEvalableOver&| NIL |Magma&| |AbelianSemiGroup&| NIL NIL
                NIL NIL |FullyRetractableTo&| |SetCategory&|
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
                 (|GcdDomain|) (|IntegralDomain|) (|FramedAlgebra| 9 60)
                 (|CommutativeRing|) (|DifferentialExtension| 9)
                 (|FullyLinearlyExplicitOver| 9) (|FiniteRankAlgebra| 9 60)
                 (|DivisionRing|) (|LeftOreRing|) (|LinearlyExplicitOver| 9)
                 (|Algebra| 9) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicZero|) (|Algebra| 34)
                 (|CharacteristicNonZero|) (|LinearlyExplicitOver| 14)
                 (|PartialDifferentialRing| 72) (|DifferentialRing|) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| 9) (|Module| $$) (|SemiRng|)
                 (|Module| 34) (|FramedModule| 9) (|BiModule| 9 9)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 34 34)
                 (|RightModule| 9) (|LeftModule| 9) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| 34)
                 (|RightModule| 34) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|FullyPatternMatchable| 9) (|OrderedSet|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|Finite|) (|FullyEvalableOver| 9) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|StepThrough|) (|PatternMatchable| 6)
                 (|PatternMatchable| 14) (|Patternable| 9)
                 (|FullyRetractableTo| 9) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|Evalable| 9) (|Type|)
                 (|RetractableTo| 9) (|ConvertibleTo| 60) (|RetractableTo| 14)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 88)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|RetractableTo| 34) (|RadicalCategory|)
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
                                    31 2 7 0 6 6 32 2 0 36 0 0 1 1 0 36 0 1 1 0
                                    85 0 1 1 0 0 0 1 1 0 36 0 1 1 0 61 62 1 0 0
                                    61 1 1 0 9 0 1 1 10 0 0 1 1 10 0 0 1 1 2 67
                                    14 1 2 0 44 0 0 1 1 29 41 40 1 1 33 0 0 1 1
                                    33 37 0 1 1 11 0 0 1 2 29 38 39 40 1 2 0 36
                                    0 0 1 2 9 36 0 0 1 0 6 48 1 1 10 0 0 1 1 10
                                    0 0 1 1 10 0 0 1 1 10 0 0 1 0 0 0 1 1 0 44
                                    0 1 2 0 0 0 48 1 2 0 0 0 65 1 1 7 74 0 1 1
                                    0 82 0 1 1 0 84 0 1 1 7 34 0 1 1 0 9 0 1 1
                                    0 14 0 1 2 0 0 81 62 1 1 0 0 81 1 0 2 66 1
                                    2 9 0 0 0 1 2 0 61 0 62 1 1 0 61 0 1 1 8 75
                                    43 1 2 8 76 43 62 1 1 0 61 43 1 2 0 83 43
                                    62 1 1 3 44 64 1 1 0 0 60 1 1 0 44 0 1 1 0
                                    9 0 29 1 30 74 0 1 1 30 36 0 1 1 30 34 0 1
                                    0 0 65 1 0 6 0 1 2 9 0 0 0 1 1 9 55 52 1 0
                                    2 0 1 1 2 36 0 1 2 2 0 0 48 1 1 2 0 0 1 1
                                    33 36 0 1 1 35 35 0 1 0 10 0 1 3 23 78 0 46
                                    78 1 3 24 79 0 47 79 1 1 2 65 0 1 1 2 70 0
                                    1 2 0 36 0 0 1 1 0 36 0 1 2 11 0 0 14 1 1 0
                                    9 0 1 1 2 44 0 1 2 9 51 52 0 1 1 3 60 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 0 0 63 0 1 1 6 65 0
                                    1 1 10 0 0 1 1 0 60 0 1 1 0 44 0 1 2 0 0 0
                                    48 1 2 0 0 0 65 1 2 9 56 0 0 1 1 9 0 52 1 2
                                    9 0 0 0 1 1 0 87 0 1 1 3 0 0 1 0 2 0 1 1 6
                                    0 65 1 0 0 0 1 1 0 9 0 31 2 0 86 86 0 1 1 0
                                    89 0 1 0 0 0 1 2 9 40 40 40 1 1 9 0 52 1 2
                                    9 0 0 0 1 0 2 69 1 1 29 41 40 1 1 29 41 40
                                    1 1 33 37 0 1 3 9 50 0 0 0 1 2 9 53 0 0 1 2
                                    36 44 0 9 1 2 0 44 0 0 1 2 9 51 52 0 1 1 10
                                    0 0 1 3 21 0 0 57 57 1 2 21 0 0 58 1 3 21 0
                                    0 9 9 1 2 21 0 0 59 1 3 20 0 0 72 9 1 3 20
                                    0 0 73 57 1 1 9 48 0 1 0 6 52 1 2 22 0 0 9
                                    1 2 9 54 0 0 1 1 0 9 62 1 0 0 9 1 1 2 48 0
                                    1 2 2 71 0 0 1 1 19 0 0 1 2 19 0 0 48 1 2
                                    18 0 0 73 1 2 18 0 0 72 1 3 18 0 0 72 48 1
                                    3 18 0 0 73 77 1 2 0 0 0 63 1 3 0 0 0 63 48
                                    1 2 3 61 62 63 1 0 0 60 1 1 10 0 0 1 1 10 0
                                    0 1 0 2 0 1 1 10 0 0 1 1 10 0 0 1 1 10 0 0
                                    1 1 10 0 0 1 2 0 81 0 62 1 2 0 61 62 62 1 1
                                    0 61 62 1 1 0 81 0 1 1 14 45 0 1 1 25 46 0
                                    1 1 26 47 0 1 1 13 80 0 1 1 13 7 0 1 1 0 0
                                    81 1 1 0 81 0 1 1 0 60 0 1 1 0 0 60 1 1 0 0
                                    0 1 1 38 42 43 1 2 0 0 9 9 12 2 0 0 0 0 1 1
                                    27 0 34 1 1 0 7 0 33 1 0 0 5 28 1 0 0 21 25
                                    1 0 0 15 19 1 0 0 7 13 1 0 0 9 1 1 0 0 14 1
                                    1 0 0 0 1 1 0 88 0 1 1 37 44 0 1 1 2 0 0 1
                                    1 0 60 0 1 0 0 48 1 0 0 62 1 1 10 0 0 1 1
                                    10 0 0 1 3 0 0 0 0 0 1 2 0 36 0 0 1 1 10 0
                                    0 1 1 10 0 0 1 1 10 0 0 1 1 10 0 0 1 1 10 9
                                    0 1 2 0 0 0 0 1 2 0 36 0 0 1 1 10 0 0 1 1
                                    10 0 0 1 1 10 0 0 1 1 10 0 0 1 1 10 0 0 1 1
                                    10 0 0 1 1 34 0 0 1 2 11 0 0 34 1 2 3 0 0
                                    14 1 2 10 0 0 0 1 2 0 0 0 48 1 2 0 0 0 65 1
                                    0 0 0 1 0 0 0 1 1 19 0 0 1 2 19 0 0 48 1 2
                                    18 0 0 72 1 3 18 0 0 72 48 1 2 18 0 0 73 1
                                    3 18 0 0 73 77 1 3 0 0 0 63 48 1 2 0 0 0 63
                                    1 2 0 36 0 0 1 2 0 36 0 0 1 2 0 36 0 0 1 2
                                    0 36 0 0 1 2 0 36 0 0 1 2 3 0 0 0 1 2 0 0 0
                                    0 1 1 0 0 0 1 2 0 0 0 0 1 2 3 0 34 0 1 2 3
                                    0 0 34 1 2 0 0 0 9 1 2 0 0 9 0 1 2 0 0 48 0
                                    1 2 0 0 14 0 1 2 0 0 0 0 1 2 0 0 65 0
                                    1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineComplex| 'NILADIC T) 
