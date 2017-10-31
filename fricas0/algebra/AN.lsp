
(SDEFUN |AN;convert;$If;1| ((|x| $) ($ |InputForm|))
        (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 10))) 

(DECLAIM (NOTINLINE |AlgebraicNumber;|)) 

(DEFUN |AlgebraicNumber| ()
  (SPROG NIL
         (PROG (#1=#:G763)
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
              |AN;convert;$If;1| (|Union| $ '#1="failed") (|Union| 26 '#1#)
              (|Matrix| $) (|Boolean|) (|SparseUnivariatePolynomial| $)
              (|Kernel| $) (|List| 17) (|SparseMultivariatePolynomial| 35 17)
              (|NonNegativeInteger|) (|Factored| 16) (|Complex| 30)
              (|Union| 24 '#1#) (|List| 16)
              (|Record| (|:| |mat| 27) (|:| |vec| (|Vector| 31))) (|Vector| $)
              (|Matrix| 31) (|DoubleFloat|) (|Matrix| 35) (|Float|)
              (|Fraction| 35)
              (|Record| (|:| |mat| 29) (|:| |vec| (|Vector| 35)))
              (|Union| 31 '#2="failed") (|Union| 35 '#2#) (|Integer|)
              (|PositiveInteger|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 39) (|:| |generator| $))
              (|Union| 39 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 44 '"failed")
              (|Factored| $) (|Polynomial| $) (|Symbol|) (|BasicOperator|)
              (|Mapping| $ $) (|Mapping| $ 39) (|List| 49) (|List| 50)
              (|List| 51) (|List| 48) (|Union| 17 '"failed") (|List| 58)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 10 |zerosOf| 16 |zeroOf| 32 |zero?| 48 |unitNormal| 53
              |unitCanonical| 58 |unit?| 63 |tower| 68 |subtractIfCan| 78
              |subst| 84 |squareFreePolynomial| 103 |squareFreePart| 108
              |squareFree| 113 |sqrt| 118 |solveLinearPolynomialEquation| 123
              |smaller?| 129 |sizeLess?| 135 |sample| 141 |rootsOf| 145
              |rootOf| 161 |retractIfCan| 177 |retract| 192 |rem| 207
              |reducedSystem| 213 |reduce| 235 |recip| 240 |quo| 245
              |principalIdeal| 251 |prime?| 256 |paren| 261 |opposite?| 271
              |operators| 277 |operator| 282 |one?| 287 |odd?| 292 |numer| 297
              |nthRoot| 302 |norm| 308 |multiEuclidean| 332 |minPoly| 338 |map|
              343 |mainKernel| 349 |lcmCoef| 354 |lcm| 360 |latex| 371
              |kernels| 376 |kernel| 386 |is?| 398 |inv| 410 |height| 415
              |hashUpdate!| 420 |hash| 426 |gcdPolynomial| 431 |gcd| 437
              |freeOf?| 448 |factorSquareFreePolynomial| 460 |factorPolynomial|
              465 |factor| 470 |extendedEuclidean| 475 |exquo| 488
              |expressIdealMember| 494 |even?| 500 |eval| 505 |euclideanSize|
              601 |elt| 606 |divide| 702 |distribute| 708 |differentiate| 719
              |denom| 730 |definingPolynomial| 735 |convert| 740 |conditionP|
              760 |coerce| 765 |charthRoot| 795 |characteristic| 800 |box| 804
              |belong?| 814 |associates?| 819 |annihilate?| 825 ^ 831 |Zero|
              855 |One| 859 D 863 = 874 / 880 - 886 + 897 * 903)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|AlgebraicallyClosedField&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| |DivisionRing&|
                NIL |Algebra&| NIL |Algebra&| |DifferentialRing&| NIL NIL NIL
                |Module&| |EntireRing&| |Module&| NIL NIL NIL |Ring&| NIL NIL
                NIL NIL |Rng&| |AbelianGroup&| NIL NIL |ExpressionSpace&|
                |Monoid&| NIL |AbelianMonoid&| NIL |SemiGroup&|
                |AbelianSemiGroup&| NIL |SetCategory&| |Evalable&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| |RadicalCategory&| NIL
                NIL NIL NIL NIL |BasicType&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| NIL)
             (CONS
              '#((|AlgebraicallyClosedField|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| 31) (|LeftOreRing|) (|Algebra| $$)
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|LinearlyExplicitOver| 31) (|LinearlyExplicitOver| 35)
                 (|Module| 31) (|EntireRing|) (|Module| $$) (|CommutativeRing|)
                 (|BiModule| 31 31) (|BiModule| $$ $$) (|Ring|)
                 (|RightModule| 31) (|LeftModule| 31) (|LeftModule| $$)
                 (|RightModule| $$) (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|ExpressionSpace|) (|Monoid|)
                 (|SemiRng|) (|AbelianMonoid|) (|Comparable|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|RealConstant|) (|SetCategory|)
                 (|Evalable| $$) (|ConvertibleTo| 7) (|ConvertibleTo| 22)
                 (|ConvertibleTo| 30) (|ConvertibleTo| 28) (|RetractableTo| 31)
                 (|RetractableTo| 35) (|RadicalCategory|) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| (|Kernel| $$) $$)
                 (|RetractableTo| (|Kernel| $$)) (|CoercibleTo| 62))
              (|makeByteWordVec2| 62
                                  '(1 6 7 0 8 1 9 7 7 10 2 0 15 0 0 1 1 0 39 47
                                    1 2 0 39 16 48 1 1 0 39 16 1 1 0 0 47 1 1 0
                                    0 16 1 2 0 0 16 48 1 1 0 15 0 1 1 0 37 0 1
                                    1 0 0 0 1 1 0 15 0 1 1 0 18 39 1 1 0 18 0 1
                                    2 0 12 0 0 1 3 0 0 0 18 39 1 2 0 0 0 57 1 2
                                    0 0 0 58 1 1 0 21 16 1 1 0 0 0 1 1 0 46 0 1
                                    1 0 0 0 1 2 0 23 24 16 1 2 0 15 0 0 1 2 0
                                    15 0 0 1 0 0 0 1 1 0 39 16 1 1 0 39 47 1 2
                                    0 39 16 48 1 1 0 0 16 1 1 0 0 47 1 2 0 0 16
                                    48 1 1 0 33 0 1 1 0 34 0 1 1 0 56 0 1 1 0
                                    31 0 1 1 0 35 0 1 1 0 17 0 1 2 0 0 0 0 1 2
                                    0 25 14 26 1 1 0 27 14 1 1 0 29 14 1 2 0 32
                                    14 26 1 1 0 0 0 1 1 0 12 0 1 2 0 0 0 0 1 1
                                    0 40 39 1 1 0 15 0 1 1 0 0 39 1 1 0 0 0 1 2
                                    0 15 0 0 1 1 0 52 0 1 1 0 49 49 1 1 0 15 0
                                    1 1 2 15 0 1 1 0 19 0 1 2 0 0 0 35 1 2 0 0
                                    0 17 1 2 0 0 0 18 1 2 0 16 16 18 1 2 0 16
                                    16 17 1 2 0 41 39 0 1 1 1 16 17 1 2 0 0 50
                                    17 1 1 0 56 0 1 2 0 38 0 0 1 2 0 0 0 0 1 1
                                    0 0 39 1 1 0 59 0 1 1 0 18 39 1 1 0 18 0 1
                                    2 0 0 49 39 1 2 0 0 49 0 1 2 0 15 0 48 1 2
                                    0 15 0 49 1 1 0 0 0 1 1 0 20 0 1 2 0 61 61
                                    0 1 1 0 60 0 1 2 0 16 16 16 1 2 0 0 0 0 1 1
                                    0 0 39 1 2 0 15 0 48 1 2 0 15 0 0 1 1 0 21
                                    16 1 1 0 21 16 1 1 0 46 0 1 2 0 43 0 0 1 3
                                    0 45 0 0 0 1 2 0 12 0 0 1 2 0 41 39 0 1 1 2
                                    15 0 1 3 0 0 0 49 50 1 3 0 0 0 49 51 1 3 0
                                    0 0 52 53 1 3 0 0 0 52 54 1 3 0 0 0 48 51 1
                                    3 0 0 0 48 50 1 3 0 0 0 55 54 1 3 0 0 0 55
                                    53 1 3 0 0 0 39 39 1 2 0 0 0 58 1 3 0 0 0 0
                                    0 1 2 0 0 0 57 1 3 0 0 0 17 0 1 3 0 0 0 18
                                    39 1 1 0 20 0 1 2 0 0 49 39 1 9 0 0 49 0 0
                                    0 0 0 0 0 0 1 10 0 0 49 0 0 0 0 0 0 0 0 0 1
                                    8 0 0 49 0 0 0 0 0 0 0 1 6 0 0 49 0 0 0 0 0
                                    1 7 0 0 49 0 0 0 0 0 0 1 4 0 0 49 0 0 0 1 5
                                    0 0 49 0 0 0 0 1 3 0 0 49 0 0 1 2 0 0 49 0
                                    1 2 0 42 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 20 1 1 0 19 0 1 1 1 0 0 1 1 0 7
                                    0 11 1 0 22 0 1 1 0 28 0 1 1 0 30 0 1 1 3
                                    13 14 1 1 0 0 19 1 1 0 0 35 1 1 0 0 0 1 1 0
                                    0 31 1 1 0 0 17 1 1 0 62 0 1 1 3 12 0 1 0 0
                                    20 1 1 0 0 39 1 1 0 0 0 1 1 0 15 49 1 2 0
                                    15 0 0 1 2 0 15 0 0 1 2 0 0 0 36 1 2 0 0 0
                                    20 1 2 0 0 0 35 1 2 0 0 0 31 1 0 0 0 1 0 0
                                    0 1 1 0 0 0 1 2 0 0 0 20 1 2 0 15 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 36 0 1 2 0 0 20 0 1 2 0 0 0 0 1 2 0 0
                                    35 0 1 2 0 0 31 0 1 2 0 0 0 31 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|AlgebraicNumber| 'NILADIC T) 
