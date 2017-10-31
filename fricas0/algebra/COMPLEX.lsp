
(SDEFUN |COMPLEX;writeOMComplex| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 10))
             (SPADCALL |dev| "complex1" "complex_cartesian" (QREFELT $ 12))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 14))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 14))
             (EXIT (SPADCALL |dev| (QREFELT $ 16))))) 

(SDEFUN |COMPLEX;OMwrite;Omd$BV;2|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))
             (|COMPLEX;writeOMComplex| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 18))))))) 

(SDEFUN |COMPLEX;Zero;$;3| (($ $))
        (CONS (|spadConstant| $ 22) (|spadConstant| $ 22))) 

(SDEFUN |COMPLEX;One;$;4| (($ $))
        (CONS (|spadConstant| $ 24) (|spadConstant| $ 22))) 

(SDEFUN |COMPLEX;zero?;$B;5| ((|x| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCAR |x|) (QREFELT $ 25))
          (SPADCALL (QCDR |x|) (QREFELT $ 25)))
         ('T NIL))) 

(SDEFUN |COMPLEX;one?;$B;6| ((|x| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCAR |x|) (|spadConstant| $ 24) (QREFELT $ 27))
          (SPADCALL (QCDR |x|) (QREFELT $ 25)))
         ('T NIL))) 

(SDEFUN |COMPLEX;coerce;R$;7| ((|r| R) ($ $)) (CONS |r| (|spadConstant| $ 22))) 

(PUT '|COMPLEX;complex;2R$;8| '|SPADreplace| 'CONS) 

(SDEFUN |COMPLEX;complex;2R$;8| ((|r| R) (|i| R) ($ $)) (CONS |r| |i|)) 

(PUT '|COMPLEX;real;$R;9| '|SPADreplace| 'QCAR) 

(SDEFUN |COMPLEX;real;$R;9| ((|x| $) ($ R)) (QCAR |x|)) 

(PUT '|COMPLEX;imag;$R;10| '|SPADreplace| 'QCDR) 

(SDEFUN |COMPLEX;imag;$R;10| ((|x| $) ($ R)) (QCDR |x|)) 

(SDEFUN |COMPLEX;+;3$;11| ((|x| $) (|y| $) ($ $))
        (CONS (|add_DF| (QCAR |x|) (QCAR |y|))
              (|add_DF| (QCDR |x|) (QCDR |y|)))) 

(SDEFUN |COMPLEX;-;3$;12| ((|x| $) (|y| $) ($ $))
        (CONS (|sub_DF| (QCAR |x|) (QCAR |y|))
              (|sub_DF| (QCDR |x|) (QCDR |y|)))) 

(SDEFUN |COMPLEX;*;3$;13| ((|x| $) (|y| $) ($ $))
        (CONS
         (|sub_DF| (|mul_DF| (QCAR |x|) (QCAR |y|))
                   (|mul_DF| (QCDR |x|) (QCDR |y|)))
         (|add_DF| (|mul_DF| (QCDR |x|) (QCAR |y|))
                   (|mul_DF| (QCDR |y|) (QCAR |x|))))) 

(SDEFUN |COMPLEX;+;3$;14| ((|x| $) (|y| $) ($ $))
        (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 34))
              (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 34)))) 

(SDEFUN |COMPLEX;-;3$;15| ((|x| $) (|y| $) ($ $))
        (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 35))
              (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 35)))) 

(SDEFUN |COMPLEX;*;3$;16| ((|x| $) (|y| $) ($ $))
        (CONS
         (SPADCALL (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 36))
                   (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 36))
                   (QREFELT $ 35))
         (SPADCALL (SPADCALL (QCDR |x|) (QCAR |y|) (QREFELT $ 36))
                   (SPADCALL (QCDR |y|) (QCAR |x|) (QREFELT $ 36))
                   (QREFELT $ 34)))) 

(SDEFUN |COMPLEX;exquo;2$U;17| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (COND
         ((SPADCALL (QCDR |y|) (QREFELT $ 25))
          (SPADCALL |x| (QCAR |y|) (QREFELT $ 38)))
         ('T
          (SPADCALL (SPADCALL |x| (SPADCALL |y| (QREFELT $ 39)) (QREFELT $ 33))
                    (SPADCALL |y| (QREFELT $ 40)) (QREFELT $ 38))))) 

(DECLAIM (NOTINLINE |Complex;|)) 

(DEFUN |Complex| (#1=#:G3188)
  (SPROG NIL
         (PROG (#2=#:G3189)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Complex|)
                                               '|domainEqualList|)
                    . #3=(|Complex|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Complex;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Complex|)))))))))) 

(DEFUN |Complex;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G3184 NIL) (#2=#:G3185 NIL) (#3=#:G3186 NIL)
    (#4=#:G3187 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|Complex|))
    (LETT |dv$| (LIST '|Complex| DV$1) . #5#)
    (LETT $ (GETREFV 97) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1|
                                                       '(|FiniteFieldCategory|))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Field|))
                                              . #5#)
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|FiniteFieldCategory|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1| '(|Finite|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|EuclideanDomain|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|TranscendentalFunctionCategory|))
                                              . #5#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RadicalCategory|))
                                         #3#)
                                        (|HasCategory| |#1|
                                                       '(|arbitraryPrecision|))
                                        (|HasCategory| |#1| '(|RealConstant|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|EuclideanDomain|))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|)))
                                        (|HasCategory| |#1|
                                                       '(|additiveValuation|))
                                        (|HasCategory| |#1|
                                                       '(|multiplicativeValuation|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|EuclideanDomain|))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#1|
                                                       (LIST '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Evalable|
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Eltable|
                                                             (|devaluate| |#1|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#1| '(|OpenMath|))
                                        (|HasCategory| |#1|
                                                       '(|RealNumberSystem|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RealNumberSystem|))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|EuclideanDomain|))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|EuclideanDomain|))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|))
                                         #2#)
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (LETT #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|EuclideanDomain|))
                                               (|HasCategory| |#1|
                                                              '(|PolynomialFactorizationExplicit|)))
                                              . #5#)
                                        (OR #1#
                                            (AND #4#
                                                 (|HasCategory| |#1|
                                                                '(|PolynomialFactorizationExplicit|)))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|FiniteFieldCategory|))
                                             (|HasCategory| |#1|
                                                            '(|PolynomialFactorizationExplicit|))))
                                        (OR #1# #4#
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|FiniteFieldCategory|))
                                             (|HasCategory| |#1|
                                                            '(|PolynomialFactorizationExplicit|)))
                                            #2#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #4#)
                                        (OR #1# #4# #2#)
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|Complex| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|EuclideanDomain|))
           (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
           (|HasCategory| $ '(|CharacteristicNonZero|)))
      (|HasCategory| |#1| '(|FiniteFieldCategory|)))
     (|augmentPredVector| $ 8796093022208))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#1| '(|EuclideanDomain|))
              (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
              (|HasCategory| $ '(|CharacteristicNonZero|))))
     (|augmentPredVector| $ 17592186044416))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Record| (|:| |real| |#1|) (|:| |imag| |#1|)))
    (COND
     ((|testBitVector| |pv$| 31)
      (PROGN
       (QSETREFV $ 20
                 (CONS (|dispatchFunction| |COMPLEX;OMwrite;Omd$BV;2|) $)))))
    (COND
     ((|domainEqual| |#1| (|DoubleFloat|))
      (PROGN
       (QSETREFV $ 31 (CONS (|dispatchFunction| |COMPLEX;+;3$;11|) $))
       (QSETREFV $ 32 (CONS (|dispatchFunction| |COMPLEX;-;3$;12|) $))
       (QSETREFV $ 33 (CONS (|dispatchFunction| |COMPLEX;*;3$;13|) $))))
     ('T
      (PROGN
       (QSETREFV $ 31 (CONS (|dispatchFunction| |COMPLEX;+;3$;14|) $))
       (QSETREFV $ 32 (CONS (|dispatchFunction| |COMPLEX;-;3$;15|) $))
       (QSETREFV $ 33 (CONS (|dispatchFunction| |COMPLEX;*;3$;16|) $)))))
    (COND
     ((|testBitVector| |pv$| 10)
      (QSETREFV $ 41 (CONS (|dispatchFunction| |COMPLEX;exquo;2$U;17|) $))))
    $))) 

(MAKEPROP '|Complex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Void|)
              (|OpenMathDevice|) (0 . |OMputApp|) (|String|)
              (5 . |OMputSymbol|) |COMPLEX;real;$R;9| (12 . |OMwrite|)
              |COMPLEX;imag;$R;10| (18 . |OMputEndApp|) (23 . |OMputObject|)
              (28 . |OMputEndObject|) (|Boolean|) (33 . |OMwrite|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |COMPLEX;Zero;$;3|) $))
              (40 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |COMPLEX;One;$;4|) $))
              (44 . |One|) (48 . |zero?|) |COMPLEX;zero?;$B;5| (53 . =)
              |COMPLEX;one?;$B;6| |COMPLEX;coerce;R$;7| |COMPLEX;complex;2R$;8|
              (59 . +) (65 . -) (71 . *) (77 . +) (83 . -) (89 . *)
              (|Union| $ '#1="failed") (95 . |exquo|) (101 . |conjugate|)
              (106 . |norm|) (111 . |exquo|) (|Factored| 43)
              (|SparseUnivariatePolynomial| $) (|Union| 45 '#2="failed")
              (|List| 43) (|Integer|) (|Fraction| 46)
              (|Record| (|:| |r| 6) (|:| |phi| 6)) (|Union| 69 '#2#)
              (|Matrix| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 46)
              (|NonNegativeInteger|)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 58) (|:| |generator| $))
              (|Union| 58 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 63 '"failed")
              (|List| 66) (|Equation| 6) (|List| 6) (|Matrix| 6) (|Vector| $)
              (|Mapping| 6 6) (|Fraction| 72) (|SparseUnivariatePolynomial| 6)
              (|PositiveInteger|) (|OnePointCompletion| 73)
              (|Union| 56 '"failed")
              (|Record| (|:| |factor| 46) (|:| |exponent| 46)) (|List| 76)
              (|Table| 73 56)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic") (|Symbol|)
              (|List| 80) (|Union| 47 '#1#)
              (|Record| (|:| |mat| 84) (|:| |vec| (|Vector| 46))) (|Matrix| 46)
              (|List| 56) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 46 $) (|Complex| (|Float|))
              (|Complex| (|DoubleFloat|)) (|Union| 46 '#3="failed")
              (|Record| (|:| |mat| 68) (|:| |vec| 93)) (|Union| 6 '#3#)
              (|Vector| 6) (|HashState|) (|OutputForm|) (|SingleInteger|))
           '#(~= 117 |zero?| 123 |unitNormal| 128 |unitCanonical| 133 |unit?|
              138 |traceMatrix| 143 |trace| 152 |tanh| 157 |tan| 162
              |tableForDiscreteLogarithm| 167 |subtractIfCan| 172
              |squareFreePolynomial| 178 |squareFreePart| 183 |squareFree| 188
              |sqrt| 193 |solveLinearPolynomialEquation| 198 |smaller?| 204
              |sizeLess?| 210 |size| 216 |sinh| 220 |sin| 225 |sech| 230 |sec|
              235 |sample| 240 |retractIfCan| 244 |retract| 259 |represents|
              274 |representationType| 285 |rem| 289 |regularRepresentation|
              295 |reducedSystem| 306 |reduce| 328 |recip| 338 |real| 343
              |rationalIfCan| 348 |rational?| 353 |rational| 358 |rank| 363
              |random| 367 |quo| 371 |principalIdeal| 377 |primitiveElement|
              382 |primitive?| 386 |primeFrobenius| 391 |prime?| 402
              |polarCoordinates| 407 |pi| 412 |patternMatch| 416 |order| 430
              |opposite?| 440 |one?| 446 |nthRoot| 451 |norm| 457 |nextItem|
              462 |multiEuclidean| 467 |minimalPolynomial| 473 |map| 478
              |lookup| 484 |log| 489 |lift| 494 |lcmCoef| 499 |lcm| 505 |latex|
              516 |inv| 521 |init| 526 |index| 530 |imaginary| 535 |imag| 539
              |hashUpdate!| 544 |hash| 550 |generator| 555 |gcdPolynomial| 559
              |gcd| 565 |factorsOfCyclicGroupSize| 576
              |factorSquareFreePolynomial| 580 |factorPolynomial| 585 |factor|
              590 |extendedEuclidean| 595 |exquo| 608 |expressIdealMember| 620
              |exp| 626 |eval| 631 |euclideanSize| 671 |enumerate| 676 |elt|
              680 |divide| 686 |discriminant| 692 |discreteLog| 701
              |differentiate| 712 |derivationCoordinates| 762
              |definingPolynomial| 768 |csch| 772 |csc| 777
              |createPrimitiveElement| 782 |coth| 786 |cot| 791 |cosh| 796
              |cos| 801 |coordinates| 806 |convert| 828 |conjugate| 873
              |conditionP| 878 |complex| 883 |coerce| 889 |charthRoot| 914
              |characteristicPolynomial| 924 |characteristic| 929 |basis| 933
              |atanh| 937 |atan| 942 |associates?| 947 |asinh| 953 |asin| 958
              |asech| 963 |asec| 968 |argument| 973 |annihilate?| 978 |acsch|
              984 |acsc| 989 |acoth| 994 |acot| 999 |acosh| 1004 |acos| 1009
              |abs| 1014 ^ 1019 |Zero| 1049 |One| 1053 |OMwrite| 1057 D 1081 =
              1131 / 1137 - 1143 + 1154 * 1160)
           'NIL
           (CONS
            (|makeByteWordVec2| 40
                                '(0 0 2 2 4 39 17 40 17 0 36 0 3 35 0 0 0 3 10
                                  11 0 0 0 1 3 5 9 10 20 22 23 0 0 0 3 0 0 0 0
                                  0 3 3 0 0 0 0 0 0 0 6 0 0 0 2 21 27 28 0 0 0
                                  12 25 0 0 0 0 0 0 0 3 3 7 8 10 13 12 12 12 12
                                  12 14 15 15 16 18 19 24 25 26 29 30 31))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |FramedAlgebra&| |GcdDomain&|
                |FiniteRankAlgebra&| |DivisionRing&| NIL |Algebra&|
                |DifferentialExtension&| |FullyLinearlyExplicitOver&|
                |Algebra&| |Algebra&| NIL NIL NIL |Module&| NIL |Module&| NIL
                NIL |Module&| |EntireRing&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Ring&| NIL NIL NIL NIL |Rng&| NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&| |Monoid&|
                NIL |Finite&| |FullyEvalableOver&| |SemiGroup&|
                |AbelianSemiGroup&| NIL NIL NIL NIL NIL |FullyRetractableTo&|
                |SetCategory&| |TranscendentalFunctionCategory&| |Evalable&|
                NIL |RetractableTo&| NIL NIL NIL |BasicType&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL |RadicalCategory&|
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL NIL |InnerEvalable&| |InnerEvalable&| NIL
                NIL NIL |OpenMath&|)
             (CONS
              '#((|ComplexCategory| 6)
                 (|MonogenicAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|)
                 (|FramedAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|GcdDomain|)
                 (|FiniteRankAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|DivisionRing|) (|IntegralDomain|) (|Algebra| 6)
                 (|DifferentialExtension| 6) (|FullyLinearlyExplicitOver| 6)
                 (|Algebra| 47) (|Algebra| $$) (|LeftOreRing|)
                 (|LinearlyExplicitOver| 6) (|CommutativeRing|) (|Module| 6)
                 (|CharacteristicZero|) (|Module| 47) (|CharacteristicNonZero|)
                 (|LinearlyExplicitOver| 46) (|Module| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 80) (|DifferentialRing|)
                 (|BiModule| $$ $$) (|Ring|) (|BiModule| 6 6)
                 (|BiModule| 47 47) (|LeftModule| $$) (|RightModule| $$)
                 (|Rng|) (|RightModule| 6) (|LeftModule| 6) (|LeftModule| 47)
                 (|RightModule| 47) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|FullyPatternMatchable| 6) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|Finite|) (|FullyEvalableOver| 6) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|StepThrough|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 46)
                 (|Patternable| 6) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|Evalable| 6) (|Type|)
                 (|RetractableTo| 6)
                 (|ConvertibleTo| (|SparseUnivariatePolynomial| 6))
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 95) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| 47) (|RetractableTo| 46)
                 (|noZeroDivisors|) (|RadicalCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|arbitraryPrecision|)
                 (|ConvertibleTo| 88) (|ConvertibleTo| 89) (|ConvertibleTo| 53)
                 (|additiveValuation|) (|multiplicativeValuation|)
                 (|InnerEvalable| 80 6) (|InnerEvalable| 6 6) (|Eltable| 6 $$)
                 (|ConvertibleTo| 54) (|ConvertibleTo| 55) (|OpenMath|))
              (|makeByteWordVec2| 96
                                  '(1 9 8 0 10 3 9 8 0 11 11 12 2 6 8 9 0 14 1
                                    9 8 0 16 1 9 8 0 17 1 9 8 0 18 3 0 8 9 0 19
                                    20 0 6 0 22 0 6 0 24 1 6 19 0 25 2 6 19 0 0
                                    27 2 0 0 0 0 31 2 0 0 0 0 32 2 0 0 0 0 33 2
                                    6 0 0 0 34 2 6 0 0 0 35 2 6 0 0 0 36 2 0 37
                                    0 6 38 1 0 0 0 39 1 0 6 0 40 2 0 37 0 0 41
                                    2 0 19 0 0 1 1 0 19 0 26 1 43 52 0 1 1 43 0
                                    0 1 1 43 19 0 1 0 0 68 1 1 0 68 69 1 1 0 6
                                    0 1 1 12 0 0 1 1 12 0 0 1 1 2 78 46 1 2 0
                                    37 0 0 1 1 38 42 43 1 1 42 0 0 1 1 42 51 0
                                    1 1 13 0 0 1 2 38 44 45 43 1 2 21 19 0 0 1
                                    2 11 19 0 0 1 0 6 56 1 1 12 0 0 1 1 12 0 0
                                    1 1 12 0 0 1 1 12 0 0 1 0 0 0 1 1 7 82 0 1
                                    1 8 90 0 1 1 0 92 0 1 1 7 47 0 1 1 8 46 0 1
                                    1 0 6 0 1 1 0 0 93 1 2 0 0 93 69 1 0 2 79 1
                                    2 11 0 0 0 1 1 0 68 0 1 2 0 68 0 69 1 2 9
                                    83 50 69 1 1 9 84 50 1 2 0 91 50 69 1 1 0
                                    68 50 1 1 3 37 71 1 1 0 0 72 1 1 0 37 0 1 1
                                    0 6 0 13 1 34 82 0 1 1 34 19 0 1 1 34 47 0
                                    1 0 0 73 1 0 6 0 1 2 11 0 0 0 1 1 11 59 58
                                    1 0 2 0 1 1 2 19 0 1 1 2 0 0 1 2 2 0 0 56 1
                                    1 42 19 0 1 1 33 48 0 1 0 12 0 1 3 27 86 0
                                    54 86 1 3 28 87 0 55 87 1 1 2 74 0 1 1 2 73
                                    0 1 2 0 19 0 0 1 1 0 19 0 28 2 13 0 0 46 1
                                    1 0 6 0 40 1 2 37 0 1 2 11 60 58 0 1 1 3 72
                                    0 1 2 0 0 70 0 1 1 6 73 0 1 1 12 0 0 1 1 0
                                    72 0 1 2 11 57 0 0 1 2 11 0 0 0 1 1 11 0 58
                                    1 1 0 11 0 1 1 3 0 0 1 0 2 0 1 1 6 0 73 1 0
                                    0 0 1 1 0 6 0 15 2 0 94 94 0 1 1 0 96 0 1 0
                                    0 0 1 2 11 43 43 43 1 2 11 0 0 0 1 1 11 0
                                    58 1 0 2 77 1 1 38 42 43 1 1 38 42 43 1 1
                                    42 51 0 1 2 11 62 0 0 1 3 11 64 0 0 0 1 2
                                    43 37 0 0 41 2 10 37 0 6 38 2 11 60 58 0 1
                                    1 12 0 0 1 2 25 0 0 65 1 2 25 0 0 66 1 3 25
                                    0 0 67 67 1 3 25 0 0 6 6 1 3 24 0 0 80 6 1
                                    3 24 0 0 81 67 1 1 11 56 0 1 0 6 58 1 2 26
                                    0 0 6 1 2 11 61 0 0 1 0 0 6 1 1 0 6 69 1 2
                                    2 75 0 0 1 1 2 56 0 1 2 23 0 0 56 1 1 23 0
                                    0 1 3 22 0 0 81 85 1 3 22 0 0 80 56 1 2 22
                                    0 0 80 1 2 22 0 0 81 1 3 0 0 0 70 56 1 2 0
                                    0 0 70 1 2 3 68 69 70 1 0 0 72 1 1 12 0 0 1
                                    1 12 0 0 1 0 2 0 1 1 12 0 0 1 1 12 0 0 1 1
                                    12 0 0 1 1 12 0 0 1 1 0 68 69 1 1 0 93 0 1
                                    2 0 93 0 69 1 2 0 68 69 69 1 1 16 53 0 1 1
                                    29 54 0 1 1 30 55 0 1 1 15 88 0 1 1 15 89 0
                                    1 1 0 0 72 1 1 0 72 0 1 1 0 0 93 1 1 0 93 0
                                    1 1 0 0 0 39 1 44 49 50 1 2 0 0 6 6 30 1 43
                                    0 0 1 1 41 0 47 1 1 0 0 6 29 1 0 0 46 1 1 0
                                    95 0 1 1 45 37 0 1 1 2 0 0 1 1 0 72 0 1 0 0
                                    56 1 0 0 69 1 1 12 0 0 1 1 12 0 0 1 2 43 19
                                    0 0 1 1 12 0 0 1 1 12 0 0 1 1 12 0 0 1 1 12
                                    0 0 1 1 12 6 0 1 2 0 19 0 0 1 1 12 0 0 1 1
                                    12 0 0 1 1 12 0 0 1 1 12 0 0 1 1 12 0 0 1 1
                                    12 0 0 1 1 32 0 0 1 2 13 0 0 47 1 2 3 0 0
                                    46 1 2 12 0 0 0 1 2 0 0 0 56 1 2 0 0 0 73 1
                                    0 0 0 21 0 0 0 23 1 31 11 0 1 2 31 8 9 0 1
                                    2 31 11 0 19 1 3 31 8 9 0 19 20 2 23 0 0 56
                                    1 1 23 0 0 1 3 22 0 0 80 56 1 3 22 0 0 81
                                    85 1 2 22 0 0 81 1 2 22 0 0 80 1 3 0 0 0 70
                                    56 1 2 0 0 0 70 1 2 0 19 0 0 1 2 3 0 0 0 1
                                    2 0 0 0 0 32 1 0 0 0 1 2 0 0 0 0 31 2 3 0 0
                                    47 1 2 3 0 47 0 1 2 0 0 0 6 1 2 0 0 6 0 1 2
                                    0 0 0 0 33 2 0 0 46 0 1 2 0 0 56 0 1 2 0 0
                                    73 0 1)))))
           '|lookupComplete|)) 
