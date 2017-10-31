
(SDEFUN |JBX;coerce;JB$;1| ((|jv| JB) ($ $))
        (COND
         ((SPADCALL (SPADCALL |jv| (QREFELT $ 9)) '|Indep| (QREFELT $ 11))
          (|error| "Only functions of independent variables allowed"))
         ('T (SPADCALL |jv| (QREFELT $ 12))))) 

(SDEFUN |JBX;retractIfCan;JbeU;2|
        ((|p| |JetBundleExpression| JB) ($ |Union| $ "failed"))
        (SPROG ((#1=#:G727 NIL) (|jv| NIL) (#2=#:G726 NIL))
               (SEQ
                (COND
                 ((SPADCALL (ELT $ 16)
                            (PROGN
                             (LETT #2# NIL . #3=(|JBX;retractIfCan;JbeU;2|))
                             (SEQ (LETT |jv| NIL . #3#)
                                  (LETT #1# (SPADCALL |p| (QREFELT $ 15))
                                        . #3#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN
                                         (LETT |jv| (CAR #1#) . #3#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (EQUAL (SPADCALL |jv| (QREFELT $ 9))
                                                  '|Indep|)
                                           #2#)
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            'T (QREFELT $ 19))
                  (CONS 0 |p|))
                 ('T (CONS 1 "failed")))))) 

(SDEFUN |JBX;retract;Jbe$;3| ((|p| |JetBundleExpression| JB) ($ $))
        (SPROG ((|px| (|Union| $ "failed")))
               (SEQ
                (LETT |px| (SPADCALL |p| (QREFELT $ 21)) |JBX;retract;Jbe$;3|)
                (EXIT
                 (COND
                  ((QEQCAR |px| 1)
                   (|error| "Only functions of independent variables allowed"))
                  ('T (QCDR |px|))))))) 

(DECLAIM (NOTINLINE |JetBundleXExpression;|)) 

(DEFUN |JetBundleXExpression| (#1=#:G814)
  (SPROG NIL
         (PROG (#2=#:G815)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleXExpression|)
                                               '|domainEqualList|)
                    . #3=(|JetBundleXExpression|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|JetBundleXExpression;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleXExpression|)))))))))) 

(DEFUN |JetBundleXExpression;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G812 NIL) (#2=#:G813 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|JetBundleXExpression|))
    (LETT |dv$| (LIST '|JetBundleXExpression| DV$1) . #3#)
    (LETT $ (GETREFV 92) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #2#
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegralDomain|))
                                              . #3#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#))
                                        (|HasCategory| (|Integer|)
                                                       '(|CommutativeRing|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|Integer|) '(|Ring|))
                                        (|HasCategory| (|Integer|) '(|Group|))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
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
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Integer|)))
                                              . #3#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|Group|)))
                                         (|HasCategory| (|Integer|) '(|Ring|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianSemiGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|JetBundleXExpression| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 32768))
    (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| $ 65536))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|JetBundleExpression| |#1|))
    $))) 

(MAKEPROP '|JetBundleXExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|JetBundleExpression| 6) (|local| |#1|)
              '|Rep| (|Symbol|) (0 . |type|) (|Boolean|) (5 . ~=)
              (11 . |coerce|) |JBX;coerce;JB$;1| (|List| 6)
              (16 . |jetVariables|) (21 . |and|) (|Mapping| 10 10 10)
              (|List| 10) (27 . |reduce|) (|Union| $ '"failed")
              |JBX;retractIfCan;JbeU;2| |JBX;retract;Jbe$;3|
              (|Union| 24 '#1="failed") (|Fraction| 28)
              (|Record| (|:| |coef| 28) (|:| |var| 41))
              (|Union| 25 '#2="failed") (|Union| 32 '#2#) (|Integer|)
              (|List| 8) (|BasicOperator|) (|List| 30) (|List| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 28) (|List| 41) (|Factored| $)
              (|SparseMultivariatePolynomial| 28 41) (|Polynomial| 24)
              (|Fraction| 63) (|Kernel| $) (|Fraction| 39) (|Fraction| 62)
              (|Union| 43 '#1#) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 28 $)
              (|Record| (|:| |mat| 50) (|:| |vec| (|Vector| 28))) (|Matrix| $)
              (|Vector| $) (|Matrix| 28)
              (|Record| (|:| |var| 41) (|:| |exponent| 28)) (|Union| 51 '#2#)
              (|List| 58) (|Mapping| $ $) (|List| 54)
              (|Record| (|:| |val| $) (|:| |exponent| 28)) (|Union| 56 '#2#)
              (|NonNegativeInteger|) (|Mapping| $ 32) (|List| 59)
              (|Union| 62 '#1#) (|Polynomial| 28)
              (|SparseUnivariatePolynomial| $) (|Expression| 28)
              (|SegmentBinding| $)
              (|Record| (|:| |coef| 32) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 69 '"failed")
              (|Polynomial| $) (|Union| 41 '#1#) (|List| 74) (|Equation| $)
              (|Union| 8 '#1#) (|Union| 28 '#1#)
              (|Union| '"failed" (|List| 53))
              (|Record| (|:| |Sys| 32) (|:| JM 79) (|:| |Depend| 77))
              (|SparseEchelonMatrix| 6 $)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 14)) (|PositiveInteger|)
              (|Record| (|:| |DSys| 32) (|:| |JVars| 83)) (|List| 14) (|Void|)
              (|Union| 6 '#1#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 34 |zerosOf| 40 |zeroOf| 67 |zero?| 94 |whittakerW| 99
              |whittakerM| 106 |weierstrassZeta| 113 |weierstrassSigma| 120
              |weierstrassPPrime| 127 |weierstrassPInverse| 134 |weierstrassP|
              141 |weberE| 148 |variables| 154 |univariate| 164 |unitNormal|
              170 |unitCanonical| 175 |unit?| 180 |tower| 185 |tanh| 195 |tan|
              200 |symbol| 205 |summation| 210 |subtractIfCan| 222 |subst| 228
              |struveL| 254 |struveH| 260 |squareFreePart| 266 |squareFree| 271
              |sqrt| 276 |sortLD| 281 |solveFor| 286 |smaller?| 292 |sizeLess?|
              298 |sinh| 304 |sin| 309 |simplify| 314 |simpOne| 320 |simpMod|
              325 |setNotation| 338 |sech| 343 |sec| 348 |sample| 353 |rootsOf|
              357 |rootSum| 384 |rootOf| 391 |riemannZeta| 418 |retractIfCan|
              423 |retract| 463 |rem| 503 |reducedSystem| 509 |reduceMod| 520
              |reduce| 526 |recip| 531 |quo| 536 |product| 542 |principalIdeal|
              554 |prime?| 559 |polylog| 564 |polygamma| 570 |pi| 576
              |permutation| 580 |patternMatch| 586 |paren| 600 |orderDim| 610
              |order| 617 |opposite?| 622 |operators| 628 |operator| 633 |one?|
              638 |odd?| 643 |numerator| 648 |numer| 653 |numIndVar| 658
              |numDepVar| 662 |nthRoot| 666 |multiEuclidean| 672 |minPoly| 678
              |meixnerM| 683 |meijerG| 691 |map| 700 |mainKernel| 706
              |lommelS2| 711 |lommelS1| 718 |log| 725 |li| 730 |lerchPhi| 735
              |legendreQ| 742 |legendreP| 749 |leadingDer| 756 |lcmCoef| 761
              |lcm| 767 |latex| 778 |lambertW| 783 |laguerreL| 788 |kummerU|
              795 |kummerM| 802 |kernels| 809 |kernel| 819 |kelvinKer| 831
              |kelvinKei| 837 |kelvinBer| 843 |kelvinBei| 849 |jetVariables|
              855 |jacobiZeta| 860 |jacobiTheta| 866 |jacobiSn| 872 |jacobiP|
              878 |jacobiMatrix| 886 |jacobiDn| 897 |jacobiCn| 903 |isTimes|
              909 |isPower| 914 |isPlus| 919 |isMult| 924 |isExpt| 929 |is?|
              946 |inv| 958 |integral| 963 |hypergeometricF| 975 |hermiteH| 982
              |height| 988 |hashUpdate!| 993 |hash| 999 |hankelH2| 1004
              |hankelH1| 1010 |ground?| 1016 |ground| 1021 |getNotation| 1026
              |gcdPolynomial| 1030 |gcd| 1036 |function| 1047 |fresnelS| 1053
              |fresnelC| 1058 |freeOf?| 1063 |formalDiff2| 1081 |formalDiff|
              1095 |factorials| 1113 |factorial| 1124 |factor| 1129
              |extractSymbol| 1134 |extendedEuclidean| 1139 |exquo| 1152
              |expressIdealMember| 1158 |exp| 1164 |even?| 1169 |eval| 1174
              |euclideanSize| 1335 |erfi| 1340 |erf| 1345 |elt| 1350
              |ellipticPi| 1446 |ellipticK| 1453 |ellipticF| 1458 |ellipticE|
              1464 |divide| 1475 |distribute| 1481 |dimension| 1492 |dilog|
              1499 |digamma| 1504 |differentiate| 1509 |denominator| 1541
              |denom| 1546 |definingPolynomial| 1551 |dSubst| 1556 |csch| 1563
              |csc| 1568 |coth| 1573 |cot| 1578 |cosh| 1583 |cos| 1588
              |convert| 1593 |const?| 1613 |conjugate| 1618 |commutator| 1624
              |coerce| 1630 |class| 1700 |charthRoot| 1705 |charlierC| 1710
              |characteristic| 1717 |box| 1721 |binomial| 1731 |besselY| 1737
              |besselK| 1743 |besselJ| 1749 |besselI| 1755 |belong?| 1761
              |autoReduce| 1766 |atanh| 1771 |atan| 1776 |associates?| 1781
              |asinh| 1787 |asin| 1792 |asech| 1797 |asec| 1802 |applyQuote|
              1807 |annihilate?| 1843 |angerJ| 1849 |algtower| 1855
              |airyBiPrime| 1865 |airyBi| 1870 |airyAiPrime| 1875 |airyAi| 1880
              |acsch| 1885 |acsc| 1890 |acoth| 1895 |acot| 1900 |acosh| 1905
              |acos| 1910 |abs| 1915 ^ 1920 |Zero| 1950 X 1954 U 1963 |Si| 1972
              |Shi| 1977 P 1982 |One| 2004 |Gamma| 2008 |Ei| 2019 D 2024 |Ci|
              2050 |Chi| 2055 |Beta| 2060 = 2066 / 2072 - 2084 + 2095 * 2101)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 6 0 0 0 0 0 3
                                  4 5 13 0 0 0 3 0 0 0 0 0 3 3 0 0 0 7 0 0 0 0
                                  0 0 0 0 0 11 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 6 8 9 10))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |AlgebraicallyClosedField&|
                |FunctionSpace&| |Field&| |EuclideanDomain&|
                |JetBundleBaseFunctionCategory&| NIL
                |UniqueFactorizationDomain&| |JetBundleFunctionCategory&|
                |GcdDomain&| |DivisionRing&| NIL |Algebra&| NIL |Algebra&|
                |Algebra&| |FullyLinearlyExplicitOver&| |Module&| NIL
                |PartialDifferentialRing&| |EntireRing&| |Module&| |Module&|
                NIL NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL |Rng&| NIL NIL NIL
                |AbelianGroup&| NIL NIL |Group&| NIL |ExpressionSpace&|
                |AbelianMonoid&| |Monoid&| NIL NIL NIL |SemiGroup&|
                |AbelianSemiGroup&| NIL NIL NIL
                |TranscendentalFunctionCategory&| |FullyRetractableTo&| NIL
                |Evalable&| |SetCategory&| NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&|
                |RetractableTo&| NIL |RetractableTo&| NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 28)
                 (|AlgebraicallyClosedField|) (|FunctionSpace| 28) (|Field|)
                 (|EuclideanDomain|) (|JetBundleBaseFunctionCategory| 6)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|JetBundleFunctionCategory| 6) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 24) (|LeftOreRing|)
                 (|Algebra| $$) (|Algebra| 28) (|FullyLinearlyExplicitOver| 28)
                 (|Module| 24) (|CommutativeRing|)
                 (|PartialDifferentialRing| 8) (|EntireRing|) (|Module| $$)
                 (|Module| 28) (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitOver| 28) (|BiModule| 24 24)
                 (|BiModule| $$ $$) (|Ring|) (|BiModule| 28 28)
                 (|RightModule| 24) (|LeftModule| 24) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|LeftModule| 28) (|RightModule| 28)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|Group|) (|FullyPatternMatchable| 28) (|ExpressionSpace|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|)
                 (|LiouvillianFunctionCategory|) (|Comparable|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 28) (|CombinatorialOpsCategory|)
                 (|TranscendentalFunctionCategory|) (|FullyRetractableTo| 28)
                 (|Patternable| 28) (|Evalable| $$) (|SetCategory|)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|RadicalCategory|)
                 (|RetractableTo| 28) (|Type|) (|RetractableTo| 8)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| (|Kernel| $$) $$)
                 (|RetractableTo| (|Kernel| $$)) (|RetractableTo| 6)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 91) (|RetractableTo| 24)
                 (|RetractableTo| 43) (|RetractableTo| 62) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 35))
              (|makeByteWordVec2| 91
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 1 0 32 71 1 1 0 32 63 1 2 0 32 63 8 1
                                    1 0 32 0 1 2 0 32 0 8 1 1 0 0 71 1 1 0 0 63
                                    1 2 0 0 63 8 1 1 0 0 0 1 2 0 0 0 8 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 2 0 0 0 0 1 1 0 29 0 1 1 0 29
                                    32 1 2 1 40 0 41 1 1 0 86 0 1 1 0 0 0 1 1 0
                                    10 0 1 1 0 36 32 1 1 0 36 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 79 32 1 2 0 0 0 8 1 2 0 0 0 65 1
                                    2 0 20 0 0 1 2 0 0 0 73 1 2 0 0 0 74 1 3 0
                                    0 0 36 32 1 3 0 0 0 6 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 0 0 1 1 0 37 0 1 1 0 0 0 1 1 0 32
                                    32 1 2 0 20 0 6 1 2 0 10 0 0 1 2 0 10 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 2 0 78 32 79 1 1 0 0 0
                                    1 2 0 32 32 32 1 3 0 78 32 79 32 1 1 0 84 8
                                    1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0 32 71 1 1
                                    0 32 63 1 2 0 32 63 8 1 1 0 32 0 1 2 0 32 0
                                    8 1 3 0 0 0 63 8 1 1 0 0 71 1 1 0 0 63 1 2
                                    0 0 63 8 1 1 0 0 0 1 2 0 0 0 8 1 1 0 0 0 1
                                    1 2 23 0 1 1 1 44 0 1 1 6 61 0 1 1 0 20 5
                                    21 1 0 72 0 1 1 0 75 0 1 1 0 76 0 1 1 0 85
                                    0 1 1 2 24 0 1 1 1 43 0 1 1 6 62 0 1 1 0 0
                                    5 22 1 0 41 0 1 1 0 8 0 1 1 0 28 0 1 1 0 6
                                    0 1 2 0 0 0 0 1 2 6 47 48 49 1 1 6 50 48 1
                                    2 0 32 32 32 1 1 0 0 0 1 1 0 20 0 1 2 0 0 0
                                    0 1 2 0 0 0 8 1 2 0 0 0 65 1 1 0 66 32 1 1
                                    0 10 0 1 2 0 0 0 0 1 2 0 0 0 0 1 0 0 0 1 2
                                    0 0 0 0 1 3 11 45 0 34 45 1 3 12 46 0 35 46
                                    1 1 0 0 32 1 1 0 0 0 1 3 0 58 32 79 58 1 1
                                    0 58 0 1 2 0 10 0 0 1 1 0 31 0 1 1 0 30 30
                                    1 1 0 10 0 1 1 17 10 0 1 1 0 0 0 1 1 6 38 0
                                    1 0 0 81 1 0 0 81 1 2 0 0 0 28 1 2 0 27 32
                                    0 1 1 16 63 41 1 4 0 0 0 0 0 0 1 5 17 0 32
                                    32 32 32 0 1 2 0 0 54 41 1 1 0 72 0 1 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3
                                    0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0
                                    6 0 1 2 0 87 0 0 1 1 0 0 32 1 2 0 0 0 0 1 1
                                    0 88 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0
                                    0 1 3 0 0 0 0 0 1 1 0 36 32 1 1 0 36 0 1 2
                                    0 0 30 0 1 2 0 0 30 32 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 14 0 15 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 4 0 0 0 0
                                    0 0 1 1 0 79 32 1 2 0 79 32 83 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 1 15 27 0 1 1 6 57 0 1 1 14
                                    27 0 1 1 14 26 0 1 2 6 52 0 30 1 2 6 52 0 8
                                    1 1 15 52 0 1 2 0 10 0 30 1 2 0 10 0 8 1 1
                                    0 0 0 1 2 0 0 0 65 1 2 0 0 0 8 1 3 17 0 32
                                    32 0 1 2 0 0 0 0 1 1 0 58 0 1 2 0 90 90 0 1
                                    1 0 89 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 10 0
                                    1 1 0 28 0 1 0 0 8 1 2 0 63 63 63 1 2 0 0 0
                                    0 1 1 0 0 32 1 2 0 0 8 32 1 1 0 0 0 1 1 0 0
                                    0 1 2 0 10 0 0 1 2 0 10 0 8 1 2 0 10 0 6 1
                                    3 0 80 0 81 79 1 3 0 82 32 81 79 1 2 0 32
                                    32 81 1 2 0 0 0 81 1 2 0 0 0 53 1 2 0 0 0 8
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 37 0 1 1 0 79 79
                                    1 2 0 68 0 0 1 3 0 70 0 0 0 1 2 0 20 0 0 1
                                    2 0 27 32 0 1 1 0 0 0 1 1 17 10 0 1 2 8 0 0
                                    8 1 1 8 0 0 1 2 8 0 0 29 1 4 8 0 0 30 0 8 1
                                    4 8 0 0 31 32 8 1 4 6 0 0 29 53 55 1 4 6 0
                                    0 8 58 59 1 4 6 0 0 29 53 60 1 4 6 0 0 8 58
                                    54 1 3 0 0 0 41 0 1 2 0 0 0 73 1 3 0 0 0 36
                                    32 1 2 0 0 0 74 1 3 0 0 0 32 32 1 3 0 0 0 0
                                    0 1 3 0 0 0 29 55 1 3 0 0 0 29 60 1 3 0 0 0
                                    8 54 1 3 0 0 0 8 59 1 3 0 0 0 31 55 1 3 0 0
                                    0 30 59 1 3 0 0 0 31 60 1 3 0 0 0 30 54 1 1
                                    0 58 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 30 0 1 4
                                    0 0 30 0 0 0 1 3 0 0 30 0 0 1 5 0 0 30 0 0
                                    0 0 1 7 0 0 30 0 0 0 0 0 0 1 6 0 0 30 0 0 0
                                    0 0 1 8 0 0 30 0 0 0 0 0 0 0 1 10 0 0 30 0
                                    0 0 0 0 0 0 0 0 1 9 0 0 30 0 0 0 0 0 0 0 0
                                    1 2 0 0 30 32 1 3 0 0 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 67 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 3 0 58 32 79 58 1 1 0
                                    0 0 1 1 0 0 0 1 2 0 0 0 6 1 3 0 0 0 29 53 1
                                    3 0 0 0 8 58 1 2 0 0 0 8 1 2 0 0 0 29 1 1 0
                                    0 0 1 1 1 38 0 1 1 16 0 0 1 3 0 0 0 6 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 8 33 0 1 1 9 34 0 1 1 10 35
                                    0 1 1 1 0 37 1 1 0 10 0 1 2 7 0 0 0 1 2 7 0
                                    0 0 1 1 1 0 39 1 1 1 0 42 1 1 1 0 43 1 1 6
                                    0 38 1 1 6 0 62 1 1 0 64 0 1 1 0 0 64 1 1 0
                                    0 24 1 1 0 0 41 1 1 0 0 8 1 1 0 0 6 13 1 0
                                    0 0 1 1 0 0 28 1 1 0 91 0 1 1 0 58 0 1 1 4
                                    20 0 1 3 0 0 0 0 0 1 0 0 58 1 1 0 0 0 1 1 0
                                    0 32 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 2 0 0 0 0 1 1 0 10 30 1 1 0 32
                                    32 1 1 0 0 0 1 1 0 0 0 1 2 0 10 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 8 0
                                    0 1 2 0 0 8 0 1 4 0 0 8 0 0 0 1 2 0 0 8 32
                                    1 5 0 0 8 0 0 0 0 1 2 0 10 0 0 1 2 0 0 0 0
                                    1 1 1 36 32 1 1 1 36 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 28 1 2 0 0 0 24 1 2
                                    0 0 0 58 1 2 0 0 0 81 1 0 0 0 1 0 0 0 1 1 0
                                    0 81 1 0 0 0 1 1 0 0 81 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 81 58 1 1 0 0 58 1 1 0 0 53 1 2 0 0
                                    81 53 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 3 0 0 0 8 58 1 3 0 0 0 29 53 1 2 0 0 0
                                    29 1 2 0 0 0 8 1 1 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 2 0 10 0 0 1 2 1 0 38 38 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 3 0 0
                                    28 1 2 0 0 0 24 1 2 0 0 24 0 1 2 0 0 0 0 1
                                    2 0 0 28 0 1 2 0 0 58 0 1 2 0 0 81 0 1)))))
           '|lookupComplete|)) 
