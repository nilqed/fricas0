
(SDEFUN |AN;convert;$If;1| ((|x| $) ($ |InputForm|))
        (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 10))) 

(DECLAIM (NOTINLINE |AlgebraicNumber;|)) 

(DEFUN |AlgebraicNumber| ()
  (SPROG NIL
         (PROG (#1=#:G770)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|AlgebraicNumber|)
                    . #2=(|AlgebraicNumber|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|AlgebraicNumber|
                             (LIST (CONS NIL (CONS 1 (|AlgebraicNumber;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|AlgebraicNumber|)))))))))) 

(DEFUN |AlgebraicNumber;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|AlgebraicNumber|) . #1=(|AlgebraicNumber|))
          (LETT $ (GETREFV 63) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|AlgebraicNumber| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 1))
          (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| $ 2))
          (AND (|HasCategory| $ '(|CharacteristicNonZero|))
               (|augmentPredVector| $ 4))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|InnerAlgebraicNumber|))
          $))) 

(MAKEPROP '|AlgebraicNumber| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerAlgebraicNumber|) '|Rep| (|InputForm|)
              (0 . |convert|) (|InputFormFunctions1| $$) (5 . |coerceToType|)
              |AN;convert;$If;1| (|Union| 28 '#1="failed") (|Matrix| $)
              (|Union| $ '#1#) (|Boolean|) (|SparseUnivariatePolynomial| $)
              (|Kernel| $) (|List| 17) (|SparseMultivariatePolynomial| 34 17)
              (|NonNegativeInteger|) (|Factored| 16) (|Complex| 29)
              (|Union| 24 '#1#) (|List| 16) (|Matrix| 33) (|DoubleFloat|)
              (|Record| (|:| |mat| 25) (|:| |vec| (|Vector| 33))) (|Vector| $)
              (|Float|) (|Record| (|:| |mat| 31) (|:| |vec| (|Vector| 34)))
              (|Matrix| 34) (|Union| 33 '#2="failed") (|Fraction| 34)
              (|Integer|) (|Union| 34 '#2#) (|PositiveInteger|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Union| 39 '"failed")
              (|Record| (|:| |coef| 39) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 44 '"failed")
              (|Factored| $) (|Polynomial| $) (|Symbol|) (|BasicOperator|)
              (|Mapping| $ 39) (|Mapping| $ $) (|List| 49) (|List| 50)
              (|List| 51) (|List| 48) (|Union| 17 '"failed") (|List| 58)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 10 |zerosOf| 16 |zeroOf| 32 |zero?| 48 |unitNormal| 53
              |unitCanonical| 58 |unit?| 63 |tower| 68 |subtractIfCan| 78
              |subst| 84 |squareFreePolynomial| 103 |squareFreePart| 108
              |squareFree| 113 |sqrt| 118 |solveLinearPolynomialEquation| 123
              |smaller?| 129 |sizeLess?| 135 |sample| 141 |rootsOf| 145
              |rootOf| 161 |rightRecip| 177 |rightPower| 182 |retractIfCan| 194
              |retract| 209 |rem| 224 |reducedSystem| 230 |reduce| 252 |recip|
              257 |quo| 262 |principalIdeal| 268 |prime?| 273 |paren| 278
              |opposite?| 288 |operators| 294 |operator| 299 |one?| 304 |odd?|
              309 |numer| 314 |nthRoot| 319 |norm| 325 |multiEuclidean| 349
              |minPoly| 355 |map| 360 |mainKernel| 366 |leftRecip| 371
              |leftPower| 376 |lcmCoef| 388 |lcm| 394 |latex| 405 |kernels| 410
              |kernel| 420 |is?| 432 |inv| 444 |height| 449 |hashUpdate!| 454
              |hash| 460 |gcdPolynomial| 465 |gcd| 471 |freeOf?| 482
              |factorSquareFreePolynomial| 494 |factorPolynomial| 499 |factor|
              504 |extendedEuclidean| 509 |exquo| 522 |expressIdealMember| 528
              |even?| 534 |eval| 539 |euclideanSize| 635 |elt| 640 |divide| 736
              |distribute| 742 |differentiate| 753 |denom| 764
              |definingPolynomial| 769 |convert| 774 |conditionP| 794
              |commutator| 799 |coerce| 805 |charthRoot| 835 |characteristic|
              840 |box| 844 |belong?| 854 |associator| 859 |associates?| 866
              |antiCommutator| 872 |annihilate?| 878 ^ 884 |Zero| 908 |One| 912
              D 916 = 927 / 933 - 939 + 950 * 956)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|AlgebraicallyClosedField&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL
                |DivisionRing&| NIL NIL |DifferentialRing&| NIL NIL NIL
                |Algebra&| |EntireRing&| |Algebra&| NIL NIL |Rng&| |Module&|
                |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |ExpressionSpace&| NIL |MagmaWithUnit&| |AbelianMonoid&|
                |NonAssociativeSemiRng&| NIL |Magma&| |AbelianSemiGroup&| NIL
                |SetCategory&| |Evalable&| NIL NIL NIL NIL |RetractableTo&|
                |RetractableTo&| |RadicalCategory&| NIL NIL NIL NIL NIL
                |BasicType&| |InnerEvalable&| |InnerEvalable&| |RetractableTo&|
                NIL)
             (CONS
              '#((|AlgebraicallyClosedField|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|DivisionRing|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DifferentialRing|)
                 (|CharacteristicZero|) (|LinearlyExplicitOver| 33)
                 (|LinearlyExplicitOver| 34) (|Algebra| 33) (|EntireRing|)
                 (|Algebra| $$) (|Ring|) (|SemiRing|) (|Rng|) (|Module| 33)
                 (|Module| $$) (|SemiRng|) (|BiModule| 33 33)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|RightModule| 33)
                 (|LeftModule| 33) (|LeftModule| $$) (|RightModule| $$)
                 (|NonAssociativeRng|) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|ExpressionSpace|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|Comparable|)
                 (|Magma|) (|AbelianSemiGroup|) (|RealConstant|)
                 (|SetCategory|) (|Evalable| $$) (|ConvertibleTo| 7)
                 (|ConvertibleTo| 22) (|ConvertibleTo| 29) (|ConvertibleTo| 26)
                 (|RetractableTo| 33) (|RetractableTo| 34) (|RadicalCategory|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| (|Kernel| $$) $$)
                 (|RetractableTo| (|Kernel| $$)) (|CoercibleTo| 62))
              (|makeByteWordVec2| 62
                                  '(1 6 7 0 8 1 9 7 7 10 2 0 15 0 0 1 1 0 39 16
                                    1 1 0 39 47 1 2 0 39 16 48 1 1 0 0 16 1 1 0
                                    0 47 1 2 0 0 16 48 1 1 0 15 0 1 1 0 37 0 1
                                    1 0 0 0 1 1 0 15 0 1 1 0 18 39 1 1 0 18 0 1
                                    2 0 14 0 0 1 3 0 0 0 18 39 1 2 0 0 0 57 1 2
                                    0 0 0 58 1 1 0 21 16 1 1 0 0 0 1 1 0 46 0 1
                                    1 0 0 0 1 2 0 23 24 16 1 2 0 15 0 0 1 2 0
                                    15 0 0 1 0 0 0 1 1 0 39 16 1 1 0 39 47 1 2
                                    0 39 16 48 1 1 0 0 16 1 1 0 0 47 1 2 0 0 16
                                    48 1 1 0 14 0 1 2 0 0 0 36 1 2 0 0 0 20 1 1
                                    0 32 0 1 1 0 35 0 1 1 0 56 0 1 1 0 33 0 1 1
                                    0 34 0 1 1 0 17 0 1 2 0 0 0 0 1 1 0 25 13 1
                                    2 0 27 13 28 1 2 0 30 13 28 1 1 0 31 13 1 1
                                    0 0 0 1 1 0 14 0 1 2 0 0 0 0 1 1 0 41 39 1
                                    1 0 15 0 1 1 0 0 0 1 1 0 0 39 1 2 0 15 0 0
                                    1 1 0 52 0 1 1 0 49 49 1 1 0 15 0 1 1 2 15
                                    0 1 1 0 19 0 1 2 0 0 0 34 1 2 0 0 0 17 1 2
                                    0 0 0 18 1 2 0 16 16 18 1 2 0 16 16 17 1 2
                                    0 40 39 0 1 1 1 16 17 1 2 0 0 51 17 1 1 0
                                    56 0 1 1 0 14 0 1 2 0 0 0 36 1 2 0 0 0 20 1
                                    2 0 38 0 0 1 1 0 0 39 1 2 0 0 0 0 1 1 0 59
                                    0 1 1 0 18 39 1 1 0 18 0 1 2 0 0 49 0 1 2 0
                                    0 49 39 1 2 0 15 0 48 1 2 0 15 0 49 1 1 0 0
                                    0 1 1 0 20 0 1 2 0 61 61 0 1 1 0 60 0 1 2 0
                                    16 16 16 1 1 0 0 39 1 2 0 0 0 0 1 2 0 15 0
                                    0 1 2 0 15 0 48 1 1 0 21 16 1 1 0 21 16 1 1
                                    0 46 0 1 2 0 43 0 0 1 3 0 45 0 0 0 1 2 0 14
                                    0 0 1 2 0 40 39 0 1 1 2 15 0 1 3 0 0 0 49
                                    50 1 3 0 0 0 49 51 1 3 0 0 0 52 53 1 3 0 0
                                    0 48 51 1 3 0 0 0 52 54 1 3 0 0 0 55 53 1 3
                                    0 0 0 48 50 1 3 0 0 0 55 54 1 3 0 0 0 0 0 1
                                    3 0 0 0 39 39 1 2 0 0 0 58 1 3 0 0 0 18 39
                                    1 2 0 0 0 57 1 3 0 0 0 17 0 1 1 0 20 0 1 2
                                    0 0 49 39 1 10 0 0 49 0 0 0 0 0 0 0 0 0 1 8
                                    0 0 49 0 0 0 0 0 0 0 1 9 0 0 49 0 0 0 0 0 0
                                    0 0 1 6 0 0 49 0 0 0 0 0 1 7 0 0 49 0 0 0 0
                                    0 0 1 5 0 0 49 0 0 0 0 1 3 0 0 49 0 0 1 4 0
                                    0 49 0 0 0 1 2 0 0 49 0 1 2 0 42 0 0 1 1 0
                                    0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 20 1 1
                                    0 19 0 1 1 1 0 0 1 1 0 7 0 11 1 0 22 0 1 1
                                    0 26 0 1 1 0 29 0 1 1 3 12 13 1 2 0 0 0 0 1
                                    1 0 0 19 1 1 0 0 34 1 1 0 0 0 1 1 0 0 33 1
                                    1 0 0 17 1 1 0 62 0 1 1 3 14 0 1 0 0 20 1 1
                                    0 0 39 1 1 0 0 0 1 1 0 15 49 1 3 0 0 0 0 0
                                    1 2 0 15 0 0 1 2 0 0 0 0 1 2 0 15 0 0 1 2 0
                                    0 0 36 1 2 0 0 0 20 1 2 0 0 0 34 1 2 0 0 0
                                    33 1 0 0 0 1 0 0 0 1 1 0 0 0 1 2 0 0 0 20 1
                                    2 0 15 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 36 0 1 2 0 0 0 0 1 2
                                    0 0 34 0 1 2 0 0 20 0 1 2 0 0 33 0 1 2 0 0
                                    0 33 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|AlgebraicNumber| 'NILADIC T) 
