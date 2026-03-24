
(SDEFUN |MCMPLX;coerce;C%;1| ((|u| (|Complex| (|Float|))) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 8)) (QREFELT % 10))
                  (SPADCALL (SPADCALL |u| (QREFELT % 11)) (QREFELT % 10))
                  (QREFELT % 12))) 

(SDEFUN |MCMPLX;coerce;C%;2| ((|u| (|Complex| (|Integer|))) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 16)) (QREFELT % 17))
                  (SPADCALL (SPADCALL |u| (QREFELT % 18)) (QREFELT % 17))
                  (QREFELT % 12))) 

(SDEFUN |MCMPLX;coerce;C%;3| ((|u| (|Complex| (|MachineInteger|))) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 22)) (QREFELT % 23))
                  (SPADCALL (SPADCALL |u| (QREFELT % 24)) (QREFELT % 23))
                  (QREFELT % 12))) 

(SDEFUN |MCMPLX;coerce;C%;4| ((|u| (|Complex| (|MachineFloat|))) (% (%)))
        (SPADCALL (SPADCALL |u| (QREFELT % 26)) (SPADCALL |u| (QREFELT % 27))
                  (QREFELT % 12))) 

(SDEFUN |MCMPLX;coerce;%C;5| ((|u| (%)) (% (|Complex| (|Float|))))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 29)) (QREFELT % 30))
                  (SPADCALL (SPADCALL |u| (QREFELT % 31)) (QREFELT % 30))
                  (QREFELT % 32))) 

(DECLAIM (NOTINLINE |MachineComplex;|)) 

(DEFUN |MachineComplex;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G53 NIL) (#2=#:G52 NIL) (#3=#:G51 NIL)
    (#4=#:G50 NIL) (#5=#:G49 NIL) (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|MachineComplex|))
    (LETT % (GETREFV 90))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|FiniteFieldCategory|))
                                        (LETT #1#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|Field|)))
                                        (OR #1#
                                            (|HasCategory| (|MachineFloat|)
                                                           '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|Finite|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|Hashable|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (LETT #2#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|TranscendentalFunctionCategory|)))
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
                                        (LETT #3#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|IntegerNumberSystem|)))
                                        (OR #1#
                                            (|HasCategory| (|MachineFloat|)
                                                           '(|FiniteFieldCategory|))
                                            #3#)
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
                                        (OR #1# #3#)
                                        (OR
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #1#)
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|EuclideanDomain|))
                                        (LETT #4#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|EuclideanDomain|))
                                          #4#)
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|FiniteFieldCategory|)))
                                        (OR
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|EuclideanDomain|))
                                          #4#)
                                         #1#
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|FiniteFieldCategory|))
                                         #3#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|EuclideanDomain|))
                                          #4#)
                                         #1# #3#)
                                        (LETT #5#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|RealNumberSystem|)))
                                        (AND #5# #2#)
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|IntegralDomain|))))))
    (|haddProp| |$ConstructorCache| '|MachineComplex| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND
     (OR
      (AND (|HasCategory| % '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|EuclideanDomain|)) #4#)
      (|HasCategory| (|MachineFloat|) '(|CharacteristicNonZero|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND (|HasCategory| % '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|EuclideanDomain|)) #4#)
      (AND (|HasCategory| % '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|FiniteFieldCategory|))))
     (|augmentPredVector| % 68719476736))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |MachineComplex| ()
  (SPROG NIL
         (PROG (#1=#:G55)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MachineComplex|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MachineComplex|
                             (LIST (CONS NIL (CONS 1 (|MachineComplex;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|MachineComplex|)))))))))) 

(MAKEPROP '|MachineComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Complex| 9) (|Float|) (|Complex| 6)
              (0 . |real|) (|MachineFloat|) (5 . |coerce|) (10 . |imag|)
              (15 . |complex|) |MCMPLX;coerce;C%;1| (|Integer|) (|Complex| 14)
              (21 . |real|) (26 . |coerce|) (31 . |imag|) |MCMPLX;coerce;C%;2|
              (|MachineInteger|) (|Complex| 20) (36 . |real|) (41 . |coerce|)
              (46 . |imag|) |MCMPLX;coerce;C%;3| (51 . |real|) (56 . |imag|)
              |MCMPLX;coerce;C%;4| (61 . |real|) (66 . |coerce|) (71 . |imag|)
              (76 . |complex|) |MCMPLX;coerce;%C;5| (|Boolean|) (|String|)
              (|OutputForm|) (|PositiveInteger|) (|Union| % '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| 14 '#1="failed") (|Mapping| 9 9)
              (|SparseUnivariatePolynomial| 9) (|Matrix| 9) (|Matrix| %)
              (|Record| (|:| |mat| 44) (|:| |vec| 49)) (|Vector| %)
              (|Union| 9 '#1#) (|Vector| 9) (|Fraction| 14)
              (|Record| (|:| |r| 9) (|:| |phi| 9)) (|Union| 47 '#2="failed")
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %) (|Factored| %)
              (|Factored| 55) (|Union| 59 '#2#) (|List| 55)
              (|Union| 54 '"failed")
              (|Record| (|:| |coef| 54) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 63 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|InputForm|) (|Pattern| 6) (|Pattern| 14) (|Equation| 9)
              (|List| 69) (|List| 9) (|Fraction| 43) (|Union| 39 '"failed")
              (|OnePointCompletion| 37) (|Table| 37 39)
              (|Record| (|:| |factor| 14) (|:| |exponent| 39)) (|List| 76)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|HashState|) (|SingleInteger|) (|List| 82) (|Symbol|)
              (|Union| 50 '"failed")
              (|Record| (|:| |mat| 85) (|:| |vec| (|Vector| 14))) (|Matrix| 14)
              (|List| 39) (|PatternMatchResult| 6 %)
              (|PatternMatchResult| 14 %) (|Complex| (|DoubleFloat|)))
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
              |prime?| 384 |polarCoordinates| 389 |plenaryPower| 394 |pi| 400
              |patternMatch| 404 |order| 418 |opposite?| 428 |one?| 434
              |nthRoot| 439 |norm| 445 |nextItem| 450 |multiEuclidean| 455
              |minimalPolynomial| 461 |min| 466 |max| 472 |map| 478 |lookup|
              484 |log| 489 |lift| 494 |leftRecip| 499 |leftPower| 504
              |lcmCoef| 516 |lcm| 522 |latex| 533 |inv| 538 |init| 543 |index|
              547 |imaginary| 552 |imag| 556 |hashUpdate!| 561 |hash| 567
              |generator| 572 |gcdPolynomial| 576 |gcd| 582
              |factorsOfCyclicGroupSize| 593 |factorSquareFreePolynomial| 597
              |factorPolynomial| 602 |factor| 607 |extendedEuclidean| 612
              |exquo| 625 |expressIdealMember| 637 |exp| 643 |eval| 648
              |euclideanSize| 688 |enumerate| 693 |elt| 697 |divide| 703
              |discriminant| 709 |discreteLog| 718 |differentiate| 729
              |derivationCoordinates| 779 |definingPolynomial| 785 |csch| 789
              |csc| 794 |createPrimitiveElement| 799 |coth| 803 |cot| 808
              |cosh| 813 |cos| 818 |coordinates| 823 |convert| 845 |conjugate|
              890 |conditionP| 895 |complex| 900 |commutator| 906 |coerce| 912
              |charthRoot| 962 |characteristicPolynomial| 972 |characteristic|
              977 |basis| 981 |atanh| 985 |atan| 990 |associator| 995
              |associates?| 1002 |asinh| 1008 |asin| 1013 |asech| 1018 |asec|
              1023 |argument| 1028 |antiCommutator| 1033 |annihilate?| 1039
              |acsch| 1045 |acsc| 1050 |acoth| 1055 |acot| 1060 |acosh| 1065
              |acos| 1070 |abs| 1075 ^ 1080 |Zero| 1110 |One| 1114 D 1118 >=
              1168 > 1174 = 1180 <= 1186 < 1192 / 1198 - 1204 + 1215 * 1221)
           'NIL
           (CONS
            (|makeByteWordVec2| 32
                                '(0 0 2 2 4 16 30 16 31 31 0 0 0 32 3 0 0 0 18
                                  17 5 3 1 0 0 0 0 3 0 0 0 0 3 0 0 0 0 9 3 0 0
                                  0 0 0 9 3 3 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0
                                  23 22 2 0 0 0 0 0 20 10 8 7 0 0 0 0 0 25 24
                                  21 20 19 15 14 13 13 12 10 10 10 10 10 11 8 3
                                  3 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |FramedAlgebra&|
                NIL NIL |DivisionRing&| |FiniteRankAlgebra&|
                |DifferentialExtension&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| NIL |Algebra&| NIL |Algebra&|
                |EntireRing&| |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |Rng&| |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| NIL |Module&| |Module&| |FullyLinearlyExplicitOver&|
                NIL NIL |NonAssociativeRing&| NIL NIL |FramedModule&| NIL NIL
                NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&|
                NIL NIL NIL |Finite&| |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL |OrderedSet&| NIL NIL NIL NIL
                |AbelianSemiGroup&| |Magma&| NIL |FullyRetractableTo&|
                |FullyEvalableOver&| |Evalable&|
                |TranscendentalFunctionCategory&| |RetractableTo&| |Hashable&|
                |SetCategory&| NIL |RetractableTo&| |RetractableTo&| NIL NIL
                NIL NIL |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&| NIL NIL NIL
                NIL |BasicType&| NIL NIL NIL |PartialOrder&| NIL NIL NIL NIL)
             (CONS
              '#((|ComplexCategory| 9) (|MonogenicAlgebra| 9 43)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|FortranMachineTypeCategory|) (|FramedAlgebra| 9 43)
                 (|IntegralDomain|) (|LeftOreRing|) (|DivisionRing|)
                 (|FiniteRankAlgebra| 9 43) (|DifferentialExtension| 9)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 82) (|CharacteristicNonZero|)
                 (|Algebra| 50) (|CharacteristicZero|) (|Algebra| $$)
                 (|EntireRing|) (|Algebra| 9) (|Ring|)
                 (|NonAssociativeAlgebra| 50) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 9)
                 (|Module| 50) (|SemiRng|) (|Module| $$) (|Module| 9)
                 (|FullyLinearlyExplicitOver| 9) (|LinearlyExplicitOver| 14)
                 (|BiModule| 50 50) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 9 9) (|FramedModule| 9) (|LinearlyExplicitOver| 9)
                 (|RightModule| 14) (|RightModule| 50) (|LeftModule| 50)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|LeftModule| 9) (|RightModule| 9) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Finite|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|OrderedSet|) (|FullyPatternMatchable| 9)
                 (|PatternMatchable| 14) (|PatternMatchable| 6) (|StepThrough|)
                 (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|FullyRetractableTo| 9) (|FullyEvalableOver| 9)
                 (|Evalable| 9) (|TranscendentalFunctionCategory|)
                 (|RetractableTo| 50) (|Hashable|) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| 14) (|RetractableTo| 9)
                 (|Patternable| 9) (|ConvertibleTo| 68) (|ConvertibleTo| 67)
                 (|Eltable| 9 $$) (|InnerEvalable| 9 9) (|InnerEvalable| 82 9)
                 (|multiplicativeValuation|) (|ConvertibleTo| 66)
                 (|ConvertibleTo| 89) (|ConvertibleTo| 7)
                 (|arbitraryPrecision|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|RadicalCategory|)
                 (|CoercibleFrom| 50) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|CoercibleTo| 36) (|BasicType|)
                 (|unitsKnown|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|PartialOrder|) (|CoercibleFrom| 14) (|ConvertibleTo| 43)
                 (|CoercibleFrom| 9) (|Type|))
              (|makeByteWordVec2| 89
                                  '(1 7 6 0 8 1 9 0 6 10 1 7 6 0 11 2 0 0 9 9
                                    12 1 15 14 0 16 1 9 0 14 17 1 15 14 0 18 1
                                    21 20 0 22 1 9 0 20 23 1 21 20 0 24 1 5 9 0
                                    26 1 5 9 0 27 1 0 9 0 29 1 9 6 0 30 1 0 9 0
                                    31 2 7 0 6 6 32 2 0 34 0 0 1 1 0 34 0 1 1 0
                                    40 0 1 1 0 0 0 1 1 0 34 0 1 0 0 44 1 1 0 44
                                    47 1 1 0 9 0 1 1 10 0 0 1 1 10 0 0 1 1 2 75
                                    14 1 2 0 38 0 0 1 1 30 57 55 1 1 32 0 0 1 1
                                    32 56 0 1 1 11 0 0 1 2 30 58 59 55 1 2 0 34
                                    0 0 1 2 26 34 0 0 1 0 6 39 1 1 10 0 0 1 1
                                    10 0 0 1 1 10 0 0 1 1 10 0 0 1 0 0 0 1 1 0
                                    38 0 1 2 0 0 0 37 1 2 0 0 0 39 1 1 0 41 0 1
                                    1 0 48 0 1 1 8 83 0 1 1 0 14 0 1 1 0 9 0 1
                                    1 8 50 0 1 1 0 0 49 1 2 0 0 49 47 1 0 2 78
                                    1 2 26 0 0 0 1 1 0 44 0 1 2 0 44 0 47 1 1 0
                                    44 45 1 2 0 46 45 47 1 2 9 84 45 47 1 1 9
                                    85 45 1 1 0 0 43 1 1 3 38 72 1 1 0 38 0 1 1
                                    0 9 0 29 1 15 83 0 1 1 15 34 0 1 1 15 50 0
                                    1 0 0 37 1 0 6 0 1 2 26 0 0 0 1 1 26 61 54
                                    1 0 2 0 1 1 2 34 0 1 2 2 0 0 39 1 1 2 0 0 1
                                    1 32 34 0 1 1 34 51 0 1 2 0 0 0 37 1 0 10 0
                                    1 3 22 87 0 67 87 1 3 23 88 0 68 88 1 1 2
                                    74 0 1 1 2 37 0 1 2 0 34 0 0 1 1 0 34 0 1 2
                                    11 0 0 14 1 1 0 9 0 1 1 2 38 0 1 2 26 60 54
                                    0 1 1 3 43 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 42 0 1 1 6 37 0 1 1 10 0 0 1 1 0 43 0 1 1
                                    0 38 0 1 2 0 0 0 37 1 2 0 0 0 39 1 2 32 53
                                    0 0 1 1 32 0 54 1 2 32 0 0 0 1 1 0 35 0 1 1
                                    3 0 0 1 0 2 0 1 1 6 0 37 1 0 0 0 1 1 0 9 0
                                    31 2 7 79 79 0 1 1 7 80 0 1 0 0 0 1 2 32 55
                                    55 55 1 1 32 0 54 1 2 32 0 0 0 1 0 2 77 1 1
                                    30 57 55 1 1 30 57 55 1 1 32 56 0 1 3 26 64
                                    0 0 0 1 2 26 65 0 0 1 2 0 38 0 0 1 2 35 38
                                    0 9 1 2 26 60 54 0 1 1 10 0 0 1 2 20 0 0 69
                                    1 2 20 0 0 70 1 3 20 0 0 9 9 1 3 20 0 0 71
                                    71 1 3 19 0 0 81 71 1 3 19 0 0 82 9 1 1 26
                                    39 0 1 0 6 54 1 2 21 0 0 9 1 2 26 62 0 0 1
                                    0 0 9 1 1 0 9 47 1 2 2 73 0 0 1 1 2 39 0 1
                                    3 0 0 0 42 39 1 2 0 0 0 42 1 2 18 0 0 39 1
                                    1 18 0 0 1 3 17 0 0 81 86 1 2 17 0 0 81 1 3
                                    17 0 0 82 39 1 2 17 0 0 82 1 2 3 44 47 42 1
                                    0 0 43 1 1 10 0 0 1 1 10 0 0 1 0 2 0 1 1 10
                                    0 0 1 1 10 0 0 1 1 10 0 0 1 1 10 0 0 1 1 0
                                    49 0 1 1 0 44 47 1 2 0 44 47 47 1 2 0 49 0
                                    47 1 1 0 0 43 1 1 0 43 0 1 1 0 49 0 1 1 0 0
                                    49 1 1 14 66 0 1 1 24 67 0 1 1 25 68 0 1 1
                                    13 89 0 1 1 13 7 0 1 1 0 0 0 1 1 37 52 45 1
                                    2 0 0 9 9 12 2 0 0 0 0 1 1 0 36 0 1 1 0 0
                                    14 1 1 0 0 0 1 1 0 0 9 1 1 0 0 7 13 1 0 0
                                    15 19 1 0 0 21 25 1 0 0 5 28 1 0 7 0 33 1
                                    27 0 50 1 1 36 38 0 1 1 2 0 0 1 1 0 43 0 1
                                    0 0 39 1 0 0 47 1 1 10 0 0 1 1 10 0 0 1 3 0
                                    0 0 0 0 1 2 0 34 0 0 1 1 10 0 0 1 1 10 0 0
                                    1 1 10 0 0 1 1 10 0 0 1 1 10 9 0 1 2 0 0 0
                                    0 1 2 0 34 0 0 1 1 10 0 0 1 1 10 0 0 1 1 10
                                    0 0 1 1 10 0 0 1 1 10 0 0 1 1 10 0 0 1 1 33
                                    0 0 1 2 0 0 0 37 1 2 0 0 0 39 1 2 11 0 0 50
                                    1 2 3 0 0 14 1 2 10 0 0 0 1 0 0 0 1 0 0 0 1
                                    3 0 0 0 42 39 1 2 0 0 0 42 1 2 18 0 0 39 1
                                    1 18 0 0 1 3 17 0 0 81 86 1 2 17 0 0 81 1 3
                                    17 0 0 82 39 1 2 17 0 0 82 1 2 0 34 0 0 1 2
                                    0 34 0 0 1 2 0 34 0 0 1 2 0 34 0 0 1 2 0 34
                                    0 0 1 2 3 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 37 0 1 2 0 0 0 0 1 2 0 0 14 0
                                    1 2 0 0 39 0 1 2 0 0 0 9 1 2 0 0 9 0 1 2 3
                                    0 50 0 1 2 3 0 0 50 1 2 9 0 0 14 1)))))
           '|lookupComplete|)) 
