
(SDEFUN |JBX;coerce;JB$;1| ((|jv| JB) ($ $))
        (COND
         ((SPADCALL (SPADCALL |jv| (QREFELT $ 9)) '|Indep| (QREFELT $ 11))
          (|error| "Only functions of independent variables allowed"))
         ('T (SPADCALL |jv| (QREFELT $ 12))))) 

(SDEFUN |JBX;retractIfCan;JbeU;2|
        ((|p| |JetBundleExpression| JB) ($ |Union| $ "failed"))
        (SPROG ((#1=#:G728 NIL) (|jv| NIL) (#2=#:G727 NIL))
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

(DEFUN |JetBundleXExpression| (#1=#:G821)
  (SPROG NIL
         (PROG (#2=#:G822)
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
  (SPROG ((|pv$| NIL) (#1=#:G820 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|JetBundleXExpression|))
          (LETT |dv$| (LIST '|JetBundleXExpression| DV$1) . #2#)
          (LETT $ (GETREFV 94) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegralDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CommutativeRing|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|Ring|))
                                              (|HasCategory| (|Integer|)
                                                             '(|Group|))
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
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Integer|)))
                                              (LETT #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|RetractableTo|
                                                                     (|Integer|)))
                                                    . #2#)
                                              (OR
                                               (|HasCategory| (|Integer|)
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (AND #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|IntegralDomain|))))
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
                                                (|HasCategory| (|Integer|)
                                                               '(|PatternMatchable|
                                                                 (|Integer|))))
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
                                                #1#)
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|Group|)))
                                               (|HasCategory| (|Integer|)
                                                              '(|Ring|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| (|Integer|)
                                                             '(|SemiGroup|))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|JetBundleXExpression| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 65536))
          (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| $ 131072))
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
              |JBX;retractIfCan;JbeU;2| |JBX;retract;Jbe$;3| (|Fraction| 28)
              (|Union| 23 '#1="failed") (|Union| 32 '#2="failed")
              (|Record| (|:| |coef| 28) (|:| |var| 42)) (|Union| 26 '#2#)
              (|Integer|) (|List| 8) (|BasicOperator|) (|List| 30) (|List| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 28) (|List| 42)
              (|SparseMultivariatePolynomial| 28 42) (|Factored| $)
              (|Fraction| 40) (|Polynomial| 23) (|Fraction| 65) (|Kernel| $)
              (|Fraction| 63) (|Union| 43 '#1#)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 28 $)
              (|AlgebraicNumber|) (|Union| 47 '#1#) (|Matrix| 28) (|Matrix| $)
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 28))) (|Vector| $)
              (|Record| (|:| |var| 42) (|:| |exponent| 28)) (|Union| 53 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 28)) (|Union| 55 '#2#)
              (|List| 62) (|Mapping| $ 32) (|List| 58) (|Mapping| $ $)
              (|List| 60) (|NonNegativeInteger|) (|Polynomial| 28)
              (|Union| 63 '#1#) (|SparseUnivariatePolynomial| $)
              (|Expression| 28) (|SegmentBinding| $)
              (|Record| (|:| |coef| 32) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 71 '"failed")
              (|Polynomial| $) (|Union| 42 '#1#) (|List| 76) (|Equation| $)
              (|Union| 8 '#1#) (|Union| 28 '#1#)
              (|Union| '"failed" (|List| 57))
              (|Record| (|:| |Sys| 32) (|:| JM 81) (|:| |Depend| 79))
              (|SparseEchelonMatrix| 6 $)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 14)) (|PositiveInteger|)
              (|Record| (|:| |DSys| 32) (|:| |JVars| 85)) (|List| 14) (|Void|)
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
              357 |rootSum| 384 |rootOf| 391 |rightRecip| 418 |rightPower| 423
              |riemannZeta| 435 |retractIfCan| 440 |retract| 485 |rem| 530
              |reducedSystem| 536 |reduceMod| 547 |reduce| 553 |recip| 558
              |quo| 563 |product| 569 |principalIdeal| 581 |prime?| 586
              |polylog| 591 |polygamma| 597 |pi| 603 |permutation| 607
              |patternMatch| 613 |paren| 627 |orderDim| 637 |order| 644
              |opposite?| 649 |operators| 655 |operator| 660 |one?| 665 |odd?|
              670 |numerator| 675 |numer| 680 |numIndVar| 685 |numDepVar| 689
              |nthRoot| 693 |multiEuclidean| 699 |minPoly| 705 |meixnerM| 710
              |meijerG| 718 |map| 727 |mainKernel| 733 |lommelS2| 738
              |lommelS1| 745 |log| 752 |li| 757 |lerchPhi| 762 |legendreQ| 769
              |legendreP| 776 |leftRecip| 783 |leftPower| 788 |leadingDer| 800
              |lcmCoef| 805 |lcm| 811 |latex| 822 |lambertW| 827 |laguerreL|
              832 |kummerU| 839 |kummerM| 846 |kernels| 853 |kernel| 863
              |kelvinKer| 875 |kelvinKei| 881 |kelvinBer| 887 |kelvinBei| 893
              |jetVariables| 899 |jacobiZeta| 904 |jacobiTheta| 910 |jacobiSn|
              916 |jacobiP| 922 |jacobiMatrix| 930 |jacobiDn| 941 |jacobiCn|
              947 |isTimes| 953 |isPower| 958 |isPlus| 963 |isMult| 968
              |isExpt| 973 |is?| 990 |inv| 1002 |integral| 1007
              |hypergeometricF| 1019 |hermiteH| 1026 |height| 1032
              |hashUpdate!| 1037 |hash| 1043 |hankelH2| 1048 |hankelH1| 1054
              |ground?| 1060 |ground| 1065 |getNotation| 1070 |gcdPolynomial|
              1074 |gcd| 1080 |function| 1091 |fresnelS| 1097 |fresnelC| 1102
              |freeOf?| 1107 |formalDiff2| 1125 |formalDiff| 1139 |factorials|
              1157 |factorial| 1168 |factor| 1173 |extractSymbol| 1178
              |extendedEuclidean| 1183 |exquo| 1196 |expressIdealMember| 1202
              |exp| 1208 |even?| 1213 |eval| 1218 |euclideanSize| 1379 |erfi|
              1384 |erf| 1389 |elt| 1394 |ellipticPi| 1490 |ellipticK| 1497
              |ellipticF| 1502 |ellipticE| 1508 |divide| 1519 |distribute| 1525
              |dimension| 1536 |dilog| 1543 |digamma| 1548 |differentiate| 1553
              |denominator| 1585 |denom| 1590 |definingPolynomial| 1595
              |dSubst| 1600 |csch| 1607 |csc| 1612 |coth| 1617 |cot| 1622
              |cosh| 1627 |cos| 1632 |convert| 1637 |const?| 1657 |conjugate|
              1662 |commutator| 1673 |coerce| 1679 |class| 1754 |charthRoot|
              1759 |charlierC| 1764 |characteristic| 1771 |box| 1775 |binomial|
              1785 |besselY| 1791 |besselK| 1797 |besselJ| 1803 |besselI| 1809
              |belong?| 1815 |autoReduce| 1820 |atanh| 1825 |atan| 1830
              |associator| 1835 |associates?| 1842 |asinh| 1848 |asin| 1853
              |asech| 1858 |asec| 1863 |applyQuote| 1868 |antiCommutator| 1904
              |annihilate?| 1910 |angerJ| 1916 |algtower| 1922 |airyBiPrime|
              1932 |airyBi| 1937 |airyAiPrime| 1942 |airyAi| 1947 |acsch| 1952
              |acsc| 1957 |acoth| 1962 |acot| 1967 |acosh| 1972 |acos| 1977
              |abs| 1982 ^ 1987 |Zero| 2017 X 2021 U 2030 |Si| 2039 |Shi| 2044
              P 2049 |One| 2071 |Gamma| 2075 |Ei| 2086 D 2091 |Ci| 2117 |Chi|
              2122 |Beta| 2127 = 2133 / 2139 - 2151 + 2162 * 2168)
           'NIL
           (CONS
            (|makeByteWordVec2| 14
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 2 3 4
                                  14 0 0 0 0 0 0 2 0 0 0 2 0 0 0 0 0 2 2 0 6 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 10 11 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 13
                                  1 5 7 8 9 12))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |AlgebraicallyClosedField&|
                |FunctionSpace&| |Field&| |EuclideanDomain&|
                |JetBundleBaseFunctionCategory&| NIL
                |UniqueFactorizationDomain&| |JetBundleFunctionCategory&|
                |GcdDomain&| NIL |DivisionRing&| NIL NIL
                |FullyLinearlyExplicitOver&| |Algebra&|
                |PartialDifferentialRing&| |EntireRing&| |Algebra&| |Algebra&|
                NIL NIL NIL NIL |Rng&| NIL |Module&| |Module&| NIL |Module&|
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&| |Group&| NIL
                NIL NIL NIL |ExpressionSpace&| NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| NIL NIL |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL
                |TranscendentalFunctionCategory&| |FullyRetractableTo&| NIL
                |Evalable&| |SetCategory&| NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&|
                |RetractableTo&| NIL |RetractableTo&| NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL |RetractableTo&|)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 28)
                 (|AlgebraicallyClosedField|) (|FunctionSpace| 28) (|Field|)
                 (|EuclideanDomain|) (|JetBundleBaseFunctionCategory| 6)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|JetBundleFunctionCategory| 6) (|GcdDomain|)
                 (|IntegralDomain|) (|DivisionRing|) (|CommutativeRing|)
                 (|LeftOreRing|) (|FullyLinearlyExplicitOver| 28)
                 (|Algebra| 23) (|PartialDifferentialRing| 8) (|EntireRing|)
                 (|Algebra| $$) (|Algebra| 28) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|LinearlyExplicitOver| 28) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| 23) (|Module| $$) (|SemiRng|)
                 (|Module| 28) (|BiModule| 23 23) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|BiModule| 28 28) (|RightModule| 23)
                 (|LeftModule| 23) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|LeftModule| 28) (|RightModule| 28)
                 (|AbelianGroup|) (|Group|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|FullyPatternMatchable| 28) (|ExpressionSpace|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|LiouvillianFunctionCategory|) (|Comparable|) (|Magma|)
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
                 (|BasicType|) (|CoercibleTo| 93) (|RetractableTo| 23)
                 (|RetractableTo| 43) (|RetractableTo| 63) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 35)
                 (|RetractableTo| 47))
              (|makeByteWordVec2| 93
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 1 0 32 65 1 1 0 32 73 1 2 0 32 65 8 1
                                    1 0 32 0 1 2 0 32 0 8 1 1 0 0 65 1 1 0 0 73
                                    1 2 0 0 65 8 1 1 0 0 0 1 2 0 0 0 8 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 2 0 0 0 0 1 1 0 29 0 1 1 0 29
                                    32 1 2 1 41 0 42 1 1 0 88 0 1 1 0 0 0 1 1 0
                                    10 0 1 1 0 36 32 1 1 0 36 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 81 32 1 2 0 0 0 67 1 2 0 0 0 8 1
                                    2 0 20 0 0 1 2 0 0 0 76 1 2 0 0 0 75 1 3 0
                                    0 0 36 32 1 3 0 0 0 6 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 0 0 1 1 0 38 0 1 1 0 0 0 1 1 0 32
                                    32 1 2 0 20 0 6 1 2 0 10 0 0 1 2 0 10 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 2 0 80 32 81 1 1 0 0 0
                                    1 3 0 80 32 81 32 1 2 0 32 32 32 1 1 0 86 8
                                    1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0 32 65 1 1
                                    0 32 73 1 2 0 32 65 8 1 1 0 32 0 1 2 0 32 0
                                    8 1 3 0 0 0 65 8 1 1 0 0 73 1 2 0 0 65 8 1
                                    1 0 0 65 1 1 0 0 0 1 2 0 0 0 8 1 1 0 20 0 1
                                    2 0 0 0 62 1 2 0 0 0 83 1 1 0 0 0 1 1 13 24
                                    0 1 1 1 44 0 1 1 12 48 0 1 1 5 64 0 1 1 0
                                    20 5 21 1 0 74 0 1 1 0 77 0 1 1 0 78 0 1 1
                                    0 87 0 1 1 13 23 0 1 1 1 43 0 1 1 12 47 0 1
                                    1 5 63 0 1 1 0 0 5 22 1 0 42 0 1 1 0 8 0 1
                                    1 0 28 0 1 1 0 6 0 1 2 0 0 0 0 1 1 5 49 50
                                    1 2 5 51 50 52 1 2 0 32 32 32 1 1 0 0 0 1 1
                                    0 20 0 1 2 0 0 0 0 1 2 0 0 0 8 1 2 0 0 0 67
                                    1 1 0 68 32 1 1 0 10 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 0 0 0 1 2 0 0 0 0 1 3 10 45 0 34 45 1
                                    3 11 46 0 35 46 1 1 0 0 0 1 1 0 0 32 1 3 0
                                    62 32 81 62 1 1 0 62 0 1 2 0 10 0 0 1 1 0
                                    31 0 1 1 0 30 30 1 1 0 10 0 1 1 18 10 0 1 1
                                    0 0 0 1 1 5 37 0 1 0 0 83 1 0 0 83 1 2 0 0
                                    0 28 1 2 0 25 32 0 1 1 17 65 42 1 4 0 0 0 0
                                    0 0 1 5 18 0 32 32 32 32 0 1 2 0 0 60 42 1
                                    1 0 74 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 1 0 20 0 1 2 0 0 0 62 1 2 0 0
                                    0 83 1 1 0 6 0 1 2 0 89 0 0 1 2 0 0 0 0 1 1
                                    0 0 32 1 1 0 90 0 1 1 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 36 0 1 1 0
                                    36 32 1 2 0 0 30 0 1 2 0 0 30 32 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                    14 0 15 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    4 0 0 0 0 0 0 1 2 0 81 32 85 1 1 0 81 32 1
                                    2 0 0 0 0 1 2 0 0 0 0 1 1 16 25 0 1 1 5 56
                                    0 1 1 15 25 0 1 1 15 27 0 1 2 5 54 0 8 1 2
                                    5 54 0 30 1 1 16 54 0 1 2 0 10 0 30 1 2 0
                                    10 0 8 1 1 0 0 0 1 2 0 0 0 8 1 2 0 0 0 67 1
                                    3 18 0 32 32 0 1 2 0 0 0 0 1 1 0 62 0 1 2 0
                                    92 92 0 1 1 0 91 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 1 0 10 0 1 1 0 28 0 1 0 0 8 1 2 0 65 65
                                    65 1 2 0 0 0 0 1 1 0 0 32 1 2 0 0 8 32 1 1
                                    0 0 0 1 1 0 0 0 1 2 0 10 0 0 1 2 0 10 0 8 1
                                    2 0 10 0 6 1 3 0 82 0 83 81 1 3 0 84 32 83
                                    81 1 2 0 32 32 83 1 2 0 0 0 83 1 2 0 0 0 57
                                    1 1 0 0 0 1 2 0 0 0 8 1 1 0 0 0 1 1 0 38 0
                                    1 1 0 81 81 1 2 0 70 0 0 1 3 0 72 0 0 0 1 2
                                    0 20 0 0 1 2 0 25 32 0 1 1 0 0 0 1 1 18 10
                                    0 1 2 7 0 0 8 1 2 7 0 0 29 1 4 7 0 0 30 0 8
                                    1 1 7 0 0 1 4 7 0 0 31 32 8 1 4 5 0 0 29 57
                                    59 1 4 5 0 0 29 57 61 1 4 5 0 0 8 62 58 1 4
                                    5 0 0 8 62 60 1 3 0 0 0 36 32 1 3 0 0 0 42
                                    0 1 2 0 0 0 75 1 3 0 0 0 0 0 1 2 0 0 0 76 1
                                    3 0 0 0 32 32 1 3 0 0 0 29 59 1 3 0 0 0 29
                                    61 1 3 0 0 0 8 58 1 3 0 0 0 31 61 1 3 0 0 0
                                    8 60 1 3 0 0 0 31 59 1 3 0 0 0 30 60 1 3 0
                                    0 0 30 58 1 1 0 62 0 1 1 0 0 0 1 1 0 0 0 1
                                    3 0 0 30 0 0 1 2 0 0 30 0 1 4 0 0 30 0 0 0
                                    1 6 0 0 30 0 0 0 0 0 1 5 0 0 30 0 0 0 0 1 7
                                    0 0 30 0 0 0 0 0 0 1 9 0 0 30 0 0 0 0 0 0 0
                                    0 1 8 0 0 30 0 0 0 0 0 0 0 1 10 0 0 30 0 0
                                    0 0 0 0 0 0 0 1 2 0 0 30 32 1 3 0 0 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1
                                    2 0 69 0 0 1 2 0 0 0 0 1 1 0 0 0 1 3 0 62
                                    32 81 62 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 6 1
                                    3 0 0 0 29 57 1 2 0 0 0 29 1 3 0 0 0 8 62 1
                                    2 0 0 0 8 1 1 0 0 0 1 1 1 37 0 1 1 17 0 0 1
                                    3 0 0 0 6 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 7 33 0 1 1
                                    8 34 0 1 1 9 35 0 1 1 1 0 38 1 1 0 10 0 1 2
                                    6 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 1 0 39 1
                                    1 1 0 40 1 1 1 0 43 1 1 12 0 47 1 1 5 0 37
                                    1 1 5 0 63 1 1 0 66 0 1 1 0 0 66 1 1 0 0 23
                                    1 1 0 0 42 1 1 0 0 8 1 1 0 0 0 1 1 0 0 6 13
                                    1 0 0 28 1 1 0 93 0 1 1 0 62 0 1 1 3 20 0 1
                                    3 0 0 0 0 0 1 0 0 62 1 1 0 0 0 1 1 0 0 32 1
                                    2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 10 30 1 1 0 32 32 1 1 0
                                    0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 2 0 10 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0
                                    0 8 0 1 4 0 0 8 0 0 0 1 3 0 0 8 0 0 1 5 0 0
                                    8 0 0 0 0 1 2 0 0 8 32 1 2 0 0 0 0 1 2 0 10
                                    0 0 1 2 0 0 0 0 1 1 1 36 0 1 1 1 36 32 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 28
                                    1 2 0 0 0 23 1 2 0 0 0 62 1 2 0 0 0 83 1 0
                                    0 0 1 0 0 0 1 1 0 0 83 1 0 0 0 1 1 0 0 83 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 62 1 1 0 0 57 1 2
                                    0 0 83 62 1 2 0 0 83 57 1 0 0 0 1 2 0 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 29 57 1 3 0 0
                                    0 8 62 1 2 0 0 0 8 1 2 0 0 0 29 1 1 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 2 0 10 0 0 1 2 1 0 37
                                    37 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 2 2 0 0 28 1 2 0 0 0 23 1 2 0 0 23
                                    0 1 2 0 0 62 0 1 2 0 0 28 0 1 2 0 0 0 0 1 2
                                    0 0 83 0 1)))))
           '|lookupComplete|)) 
