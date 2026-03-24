
(SDEFUN |JBX;coerce;JB%;1| ((|jv| (JB)) (% (%)))
        (COND
         ((SPADCALL (SPADCALL |jv| (QREFELT % 9)) '|Indep| (QREFELT % 11))
          (|error| "Only functions of independent variables allowed"))
         ('T (SPADCALL |jv| (QREFELT % 12))))) 

(SDEFUN |JBX;retractIfCan;JbeU;2|
        ((|p| (|JetBundleExpression| JB)) (% (|Union| % "failed")))
        (SPROG ((#1=#:G19 NIL) (|jv| NIL) (#2=#:G18 NIL))
               (SEQ
                (COND
                 ((SPADCALL (ELT % 16)
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |jv| NIL)
                                  (LETT #1# (SPADCALL |p| (QREFELT % 15))) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |jv| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (EQUAL (SPADCALL |jv| (QREFELT % 9))
                                                  '|Indep|)
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            'T (QREFELT % 19))
                  (CONS 0 |p|))
                 ('T (CONS 1 "failed")))))) 

(SDEFUN |JBX;retract;Jbe%;3| ((|p| (|JetBundleExpression| JB)) (% (%)))
        (SPROG ((|px| (|Union| % "failed")))
               (SEQ (LETT |px| (SPADCALL |p| (QREFELT % 21)))
                    (EXIT
                     (COND
                      ((QEQCAR |px| 1)
                       (|error|
                        "Only functions of independent variables allowed"))
                      ('T (QCDR |px|))))))) 

(DECLAIM (NOTINLINE |JetBundleXExpression;|)) 

(DEFUN |JetBundleXExpression;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G84 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|JetBundleXExpression| DV$1))
          (LETT % (GETREFV 92))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
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
                                                                     (|Integer|))))
                                              (OR
                                               (|HasCategory| (|Integer|)
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (AND #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|IntegralDomain|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| (|Integer|)
                                                             '(|SemiGroup|))))))
          (|haddProp| |$ConstructorCache| '|JetBundleXExpression| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|Ring|)) (|augmentPredVector| % 32768))
          (AND (|HasCategory| % '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| % 65536))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (|JetBundleExpression| |#1|))
          %))) 

(DEFUN |JetBundleXExpression| (#1=#:G85)
  (SPROG NIL
         (PROG (#2=#:G86)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleXExpression|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|JetBundleXExpression;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleXExpression|)))))))))) 

(MAKEPROP '|JetBundleXExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|JetBundleExpression| 6) (|local| |#1|)
              '|Rep| (|Symbol|) (0 . |type|) (|Boolean|) (5 . ~=)
              (11 . |coerce|) |JBX;coerce;JB%;1| (|List| 6)
              (16 . |jetVariables|) (21 . |and|) (|Mapping| 10 10 10)
              (|List| 10) (27 . |reduce|) (|Union| % '"failed")
              |JBX;retractIfCan;JbeU;2| |JBX;retract;Jbe%;3| (|String|)
              (|OutputForm|) (|PositiveInteger|) (|Integer|)
              (|NonNegativeInteger|) (|List| 8) (|List| 27)
              (|SparseUnivariatePolynomial| %) (|List| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| 6 '#1="failed") (|Void|) (|SparseEchelonMatrix| 6 %)
              (|List| 14) (|Record| (|:| |DPhi| %) (|:| |JVars| 14))
              (|Record| (|:| |DSys| 31) (|:| |JVars| 37))
              (|Union| '"failed" (|List| 29))
              (|Record| (|:| |Sys| 31) (|:| JM 36) (|:| |Depend| 40))
              (|Union| 26 '#1#) (|Union| 8 '#1#) (|BasicOperator|)
              (|Mapping| % %) (|Mapping| % 31) (|List| 44) (|List| 45)
              (|List| 46) (|Kernel| %) (|List| 50) (|Union| 50 '"failed")
              (|Equation| %) (|List| 53) (|Polynomial| %) (|Fraction| 26)
              (|Factored| %) (|Union| 31 '#2="failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 59 '#2#)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 31) (|:| |generator| %))
              (|SegmentBinding| %) (|Expression| 26) (|Union| 56 '#1#)
              (|Record| (|:| |coef| 26) (|:| |var| 50))
              (|Union| 67 '#3="failed") (|InputForm|) (|Pattern| (|Float|))
              (|Pattern| 26) (|Fraction| 82) (|Union| 72 '#1#) (|Fraction| 30)
              (|Fraction| 77) (|SparseMultivariatePolynomial| 26 50)
              (|Polynomial| 56) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 26 %) (|Union| 81 '#1#) (|AlgebraicNumber|)
              (|Polynomial| 26) (|Union| 82 '#1#)
              (|Record| (|:| |val| %) (|:| |exponent| 26)) (|Union| 84 '#3#)
              (|Record| (|:| |var| 50) (|:| |exponent| 26)) (|Union| 86 '#3#)
              (|Matrix| 26) (|Matrix| %)
              (|Record| (|:| |mat| 88) (|:| |vec| (|Vector| 26))) (|Vector| %))
           '#(~= 34 |zerosOf| 40 |zeroOf| 67 |zero?| 94 |wilsonW| 99
              |whittakerW| 109 |whittakerM| 116 |weierstrassZeta| 123
              |weierstrassSigma| 130 |weierstrassPPrime| 137
              |weierstrassPInverse| 144 |weierstrassP| 151 |weberE| 158
              |variables| 164 |univariate| 174 |unitStep| 180 |unitNormal| 185
              |unitCanonical| 190 |unit?| 195 |tower| 200 |tanh| 210 |tan| 215
              |symbol| 220 |summation| 225 |subtractIfCan| 237 |subst| 243
              |struveL| 269 |struveH| 275 |squareFreePart| 281 |squareFree| 286
              |sqrt| 291 |sortLD| 296 |solveFor| 301 |smaller?| 307 |sizeLess?|
              313 |sinh| 319 |sin| 324 |simplify| 329 |simpOne| 335 |simpMod|
              340 |sign| 353 |setNotation| 358 |sech| 363 |sec| 368 |sample|
              373 |rootsOf| 377 |rootSum| 404 |rootOf| 411 |rightRecip| 438
              |rightPower| 443 |riemannZeta| 455 |retractIfCan| 460 |retract|
              505 |rem| 550 |reducedSystem| 556 |reduceMod| 567 |reduce| 573
              |recip| 578 |racahR| 583 |quo| 593 |product| 599 |principalIdeal|
              611 |prime?| 616 |polylog| 621 |polygamma| 627 |plenaryPower| 633
              |pi| 639 |permutation| 643 |patternMatch| 649 |paren| 663
              |orderDim| 668 |order| 675 |opposite?| 680 |operators| 686
              |operator| 691 |one?| 696 |odd?| 701 |numerator| 706 |numer| 711
              |numIndVar| 716 |numDepVar| 720 |nthRoot| 724 |multiEuclidean|
              730 |minPoly| 736 |meixnerP| 741 |meixnerM| 749 |meijerG| 757
              |map| 766 |mainKernel| 772 |lommelS2| 777 |lommelS1| 784 |log|
              791 |li| 796 |lerchPhi| 801 |legendreQ| 808 |legendreP| 815
              |leftRecip| 822 |leftPower| 827 |leadingDer| 839 |lcmCoef| 844
              |lcm| 850 |latex| 861 |lambertW| 866 |laguerreL| 871 |kummerU|
              878 |kummerM| 885 |krawtchoukK| 892 |kernels| 900 |kernel| 910
              |kelvinKer| 922 |kelvinKei| 928 |kelvinBer| 934 |kelvinBei| 940
              |jetVariables| 946 |jacobiZeta| 951 |jacobiTheta| 957 |jacobiSn|
              963 |jacobiP| 969 |jacobiMatrix| 977 |jacobiDn| 988 |jacobiCn|
              994 |isTimes| 1000 |isPower| 1005 |isPlus| 1010 |isMult| 1015
              |isExpt| 1020 |is?| 1037 |inv| 1049 |integral| 1054
              |hypergeometricF| 1066 |hermiteH| 1073 |height| 1079 |hankelH2|
              1084 |hankelH1| 1090 |hahn_p| 1096 |hahnS| 1105 |hahnR| 1114
              |hahnQ| 1123 |ground?| 1132 |ground| 1137 |getNotation| 1142
              |gcdPolynomial| 1146 |gcd| 1152 |function| 1163 |fresnelS| 1169
              |fresnelC| 1174 |freeOf?| 1179 |fractionPart| 1197 |formalDiff2|
              1202 |formalDiff| 1216 |floor| 1234 |factorials| 1239 |factorial|
              1250 |factor| 1255 |extractSymbol| 1260 |extendedEuclidean| 1265
              |exquo| 1278 |expressIdealMember| 1284 |exp| 1290 |even?| 1295
              |eval| 1300 |euclideanSize| 1444 |erfi| 1449 |erf| 1454 |elt|
              1459 |ellipticPi| 1555 |ellipticK| 1562 |ellipticF| 1567
              |ellipticE| 1573 |divide| 1584 |distribute| 1590 |diracDelta|
              1601 |dimension| 1606 |dilog| 1613 |digamma| 1618 |differentiate|
              1623 |denominator| 1655 |denom| 1660 |definingPolynomial| 1665
              |dSubst| 1670 |csch| 1677 |csc| 1682 |coth| 1687 |cot| 1692
              |cosh| 1697 |cos| 1702 |convert| 1707 |const?| 1727 |conjugate|
              1732 |commutator| 1743 |coerce| 1749 |class| 1824 |charthRoot|
              1829 |charlierC| 1834 |characteristic| 1841 |ceiling| 1845 |box|
              1850 |binomial| 1855 |besselY| 1861 |besselK| 1867 |besselJ| 1873
              |besselI| 1879 |belong?| 1885 |autoReduce| 1890 |atanh| 1895
              |atan| 1900 |associator| 1905 |associates?| 1912 |asinh| 1918
              |asin| 1923 |asech| 1928 |asec| 1933 |applyQuote| 1938
              |antiCommutator| 1974 |annihilate?| 1980 |angerJ| 1986 |algtower|
              1992 |airyBiPrime| 2002 |airyBi| 2007 |airyAiPrime| 2012 |airyAi|
              2017 |acsch| 2022 |acsc| 2027 |acoth| 2032 |acot| 2037 |acosh|
              2042 |acos| 2047 |abs| 2052 ^ 2057 |Zero| 2087 X 2091 U 2100 |Si|
              2109 |Shi| 2114 P 2119 |One| 2141 |Gamma| 2145 |Ei| 2156 D 2161
              |Ci| 2187 |Chi| 2192 |Beta| 2197 = 2210 / 2216 - 2228 + 2239 *
              2245)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 3 2 0 0 0 0 0
                                  2 0 0 0 0 5 2 0 0 0 5 2 0 0 0 5 2 0 0 0 0 0 6
                                  0 0 0 0 0 0 0 0 0 0 0 11 10 0 0 0 0 0 12 5 1
                                  13 0 0 0 0 0 0 0 0 0 0 12 9 8 7 5 1 13 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| NIL |FunctionSpace2&|
                |AlgebraicallyClosedField&| |Field&|
                |JetBundleBaseFunctionCategory&| |EuclideanDomain&|
                |JetBundleFunctionCategory&| |UniqueFactorizationDomain&| NIL
                |GcdDomain&| NIL NIL NIL |DivisionRing&| NIL NIL |Algebra&|
                |Algebra&| |EntireRing&| |PartialDifferentialRing&| |Algebra&|
                NIL |NonAssociativeAlgebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |FullyLinearlyExplicitOver&| |Module&| NIL |Module&| |Module&|
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL |Group&| |AbelianGroup&| NIL
                NIL NIL NIL |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL |ExpressionSpace2&| NIL NIL NIL
                |AbelianSemiGroup&| |Magma&| NIL |FullyRetractableTo&| NIL
                |RetractableTo&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&| |SetCategory&| NIL |RetractableTo&|
                |RetractableTo&| |Evalable&| |RetractableTo&| NIL
                |RetractableTo&| |TranscendentalFunctionCategory&| NIL NIL NIL
                NIL NIL NIL NIL NIL NIL |BasicType&| NIL NIL NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL NIL
                |RadicalCategory&| |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 26) (|FunctionSpace| 26)
                 (|FunctionSpace2| 26 (|Kernel| $$))
                 (|AlgebraicallyClosedField|) (|Field|)
                 (|JetBundleBaseFunctionCategory| 6) (|EuclideanDomain|)
                 (|JetBundleFunctionCategory| 6) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 26) (|Algebra| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 8) (|Algebra| 56) (|Ring|)
                 (|NonAssociativeAlgebra| 26) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 56)
                 (|FullyLinearlyExplicitOver| 26) (|Module| 26) (|SemiRng|)
                 (|Module| $$) (|Module| 56) (|LinearlyExplicitOver| 26)
                 (|BiModule| 26 26) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 56 56) (|RightModule| 26) (|LeftModule| 26)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|LeftModule| 56) (|RightModule| 56) (|Group|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|ExpressionSpace|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|ExpressionSpace2| (|Kernel| $$))
                 (|FullyPatternMatchable| 26) (|PatternMatchable| 26)
                 (|PatternMatchable| (|Float|)) (|AbelianSemiGroup|) (|Magma|)
                 (|Comparable|) (|FullyRetractableTo| 26)
                 (|LiouvillianFunctionCategory|) (|RetractableTo| 81)
                 (|RetractableTo| 82) (|RetractableTo| 72) (|RetractableTo| 56)
                 (|SetCategory|) (|CommutativeStar|) (|RetractableTo| 6)
                 (|RetractableTo| (|Kernel| $$)) (|Evalable| $$)
                 (|RetractableTo| 8) (|Patternable| 26) (|RetractableTo| 26)
                 (|TranscendentalFunctionCategory|)
                 (|CombinatorialOpsCategory|) (|CoercibleFrom| 81)
                 (|ConvertibleTo| 71) (|ConvertibleTo| 70) (|ConvertibleTo| 69)
                 (|CoercibleFrom| 82) (|CoercibleFrom| 72) (|CoercibleFrom| 56)
                 (|CoercibleTo| 24) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|CoercibleFrom| 6)
                 (|CoercibleFrom| (|Kernel| $$))
                 (|InnerEvalable| (|Kernel| $$) $$) (|InnerEvalable| $$ $$)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|CoercibleFrom| 8) (|Type|) (|CoercibleFrom| 26)
                 (|RadicalCategory|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|PrimitiveFunctionCategory|) (|SpecialFunctionCategory|))
              (|makeByteWordVec2| 91
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 2 0 31 0 8 1 1 0 31 0 1 1 0 31 30 1 2
                                    0 31 30 8 1 1 0 31 55 1 2 0 0 0 8 1 1 0 0 0
                                    1 1 0 0 30 1 2 0 0 30 8 1 1 0 0 55 1 1 0 10
                                    0 1 6 0 0 0 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0
                                    0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 2 0 0 0 0
                                    1 1 0 28 31 1 1 0 28 0 1 2 1 74 0 50 1 1 0
                                    0 0 1 1 0 33 0 1 1 0 0 0 1 1 0 10 0 1 1 0
                                    51 31 1 1 0 51 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    36 31 1 2 0 0 0 64 1 2 0 0 0 8 1 2 0 20 0 0
                                    1 3 0 0 0 6 0 1 3 0 0 0 51 31 1 2 0 0 0 53
                                    1 2 0 0 0 54 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                    0 0 1 1 0 57 0 1 1 0 0 0 1 1 0 31 31 1 2 0
                                    20 0 6 1 2 0 10 0 0 1 2 0 10 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 2 0 41 31 36 1 1 0 0 0 1 2 0 31
                                    31 31 1 3 0 41 31 36 31 1 1 0 0 0 1 1 0 35
                                    8 1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 2 0 31 0 8
                                    1 1 0 31 0 1 1 0 31 30 1 2 0 31 30 8 1 1 0
                                    31 55 1 3 0 0 0 30 8 1 2 0 0 0 8 1 1 0 0 0
                                    1 1 0 0 30 1 2 0 0 30 8 1 1 0 0 55 1 1 0 20
                                    0 1 2 0 0 0 25 1 2 0 0 0 27 1 1 0 0 0 1 1 0
                                    34 0 1 1 0 42 0 1 1 0 43 0 1 1 0 52 0 1 1 0
                                    20 5 21 1 13 66 0 1 1 1 73 0 1 1 12 80 0 1
                                    1 5 83 0 1 1 0 6 0 1 1 0 26 0 1 1 0 8 0 1 1
                                    0 50 0 1 1 0 0 5 22 1 13 56 0 1 1 1 72 0 1
                                    1 12 81 0 1 1 5 82 0 1 2 0 0 0 0 1 1 5 88
                                    89 1 2 5 90 89 91 1 2 0 31 31 31 1 1 0 0 0
                                    1 1 0 20 0 1 6 0 0 0 0 0 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 8 1 2 0 0 0 64 1 1 0 63 31 1 1 0
                                    10 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 25 1
                                    0 0 0 1 2 0 0 0 0 1 3 10 78 0 70 78 1 3 11
                                    79 0 71 79 1 1 0 0 0 1 3 0 27 31 36 27 1 1
                                    0 27 0 1 2 0 10 0 0 1 1 0 47 0 1 1 0 44 44
                                    1 1 0 10 0 1 1 17 10 0 1 1 0 0 0 1 1 5 76 0
                                    1 0 0 25 1 0 0 25 1 2 0 0 0 26 1 2 0 58 31
                                    0 1 1 16 30 50 1 4 0 0 0 0 0 0 1 4 0 0 0 0
                                    0 0 1 5 17 0 31 31 31 31 0 1 2 0 0 45 50 1
                                    1 0 52 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 1 0 20 0 1 2 0 0 0 25 1 2 0 0
                                    0 27 1 1 0 6 0 1 2 0 32 0 0 1 1 0 0 31 1 2
                                    0 0 0 0 1 1 0 23 0 1 1 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 4 0 0 0 0 0 0
                                    1 1 0 51 0 1 1 0 51 31 1 2 0 0 44 0 1 2 0 0
                                    44 31 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 14 0 15 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 4 0 0 0 0 0 0 1 1 0 36 31 1
                                    2 0 36 31 37 1 2 0 0 0 0 1 2 0 0 0 0 1 1 15
                                    58 0 1 1 5 85 0 1 1 14 58 0 1 1 14 68 0 1 2
                                    5 87 0 8 1 2 5 87 0 44 1 1 15 87 0 1 2 0 10
                                    0 8 1 2 0 10 0 44 1 1 0 0 0 1 2 0 0 0 8 1 2
                                    0 0 0 64 1 3 17 0 31 31 0 1 2 0 0 0 0 1 1 0
                                    27 0 1 2 0 0 0 0 1 2 0 0 0 0 1 5 0 0 0 0 0
                                    0 0 1 5 0 0 0 0 0 0 0 1 5 0 0 0 0 0 0 0 1 5
                                    0 0 0 0 0 0 0 1 1 0 10 0 1 1 0 26 0 1 0 0 8
                                    1 2 0 30 30 30 1 1 0 0 31 1 2 0 0 0 0 1 2 0
                                    0 8 31 1 1 0 0 0 1 1 0 0 0 1 2 0 10 0 6 1 2
                                    0 10 0 0 1 2 0 10 0 8 1 1 0 0 0 1 3 0 38 0
                                    25 36 1 3 0 39 31 25 36 1 2 0 0 0 25 1 2 0
                                    0 0 29 1 2 0 31 31 25 1 1 0 0 0 1 2 0 0 0 8
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 57 0 1 1 0 36 36
                                    1 3 0 60 0 0 0 1 2 0 61 0 0 1 2 0 20 0 0 1
                                    2 0 58 31 0 1 1 0 0 0 1 1 17 10 0 1 3 0 0 0
                                    44 45 1 3 0 0 0 44 46 1 3 0 0 0 47 48 1 3 0
                                    0 0 47 49 1 3 0 0 0 8 45 1 3 0 0 0 28 49 1
                                    3 0 0 0 8 46 1 3 0 0 0 28 48 1 3 0 0 0 31
                                    31 1 2 0 0 0 53 1 3 0 0 0 0 0 1 2 0 0 0 54
                                    1 3 0 0 0 50 0 1 3 0 0 0 51 31 1 4 7 0 0 47
                                    31 8 1 4 7 0 0 44 0 8 1 4 5 0 0 8 27 46 1 4
                                    5 0 0 8 27 45 1 4 5 0 0 28 29 49 1 4 5 0 0
                                    28 29 48 1 1 0 27 0 1 1 0 0 0 1 1 0 0 0 1 2
                                    0 0 44 31 1 9 0 0 44 0 0 0 0 0 0 0 0 1 10 0
                                    0 44 0 0 0 0 0 0 0 0 0 1 8 0 0 44 0 0 0 0 0
                                    0 0 1 6 0 0 44 0 0 0 0 0 1 7 0 0 44 0 0 0 0
                                    0 0 1 5 0 0 44 0 0 0 0 1 3 0 0 44 0 0 1 4 0
                                    0 44 0 0 0 1 2 0 0 44 0 1 3 0 0 0 0 0 1 1 0
                                    0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0
                                    62 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3
                                    0 27 31 36 27 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    8 1 3 0 0 0 8 27 1 2 0 0 0 28 1 3 0 0 0 28
                                    29 1 2 0 0 0 6 1 1 0 0 0 1 1 1 76 0 1 1 16
                                    0 0 1 3 0 0 0 6 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 7 69
                                    0 1 1 8 70 0 1 1 9 71 0 1 1 1 0 57 1 1 0 10
                                    0 1 1 0 0 0 1 2 6 0 0 0 1 2 0 0 0 0 1 1 0
                                    24 0 1 1 0 0 26 1 1 0 0 0 1 1 0 0 6 13 1 0
                                    0 8 1 1 0 0 50 1 1 0 0 56 1 1 0 65 0 1 1 0
                                    0 65 1 1 1 0 72 1 1 1 0 75 1 1 1 0 77 1 1
                                    12 0 81 1 1 5 0 82 1 1 5 0 76 1 1 0 27 0 1
                                    1 3 20 0 1 3 0 0 0 0 0 1 0 0 27 1 1 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 10 44 1 1 0
                                    31 31 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 2
                                    0 10 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 5 0 0 8 0 0 0 0 1 2 0 0 8 31 1 4 0
                                    0 8 0 0 0 1 2 0 0 8 0 1 3 0 0 8 0 0 1 2 0 0
                                    0 0 1 2 0 10 0 0 1 2 0 0 0 0 1 1 1 51 31 1
                                    1 1 51 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    25 1 2 0 0 0 27 1 2 0 0 0 56 1 2 0 0 0 26 1
                                    2 0 0 0 0 1 0 0 0 1 1 0 0 25 1 0 0 0 1 1 0
                                    0 25 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 25
                                    29 1 1 0 0 29 1 2 0 0 25 27 1 1 0 0 27 1 0
                                    0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 28 1 2 0 0 0 8 1 3 0 0 0 8 27 1 3 0 0 0
                                    28 29 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 3 0
                                    0 0 0 0 1 2 0 10 0 0 1 2 0 0 0 0 1 2 1 0 76
                                    76 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 25 0 1 2 0 0 0 0 1 2 0 0 26 0 1 2 0 0 27
                                    0 1 2 0 0 0 56 1 2 0 0 56 0 1 2 5 0 0 26
                                    1)))))
           '|lookupComplete|)) 
