
(SDEFUN |EXPUPXS;exponential;Ups$;1|
        ((|f| |UnivariatePuiseuxSeries| FE |var| |cen|) ($ $))
        (SPADCALL |f| (QREFELT $ 10))) 

(PUT '|EXPUPXS;exponent;$Ups;2| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |EXPUPXS;exponent;$Ups;2|
        ((|f| $) ($ |UnivariatePuiseuxSeries| FE |var| |cen|)) |f|) 

(SDEFUN |EXPUPXS;exponentialOrder;$F;3| ((|f| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (|spadConstant| $ 14)
                  (QREFELT $ 15))) 

(SDEFUN |EXPUPXS;zero?;$B;4| ((|f| $) ($ |Boolean|))
        (NULL
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 20))
                   (QREFELT $ 22)))) 

(SDEFUN |EXPUPXS;=;2$B;5| ((|f| $) (|g| $) ($ |Boolean|))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 20))
                   (QREFELT $ 22))
         (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 19)) (QREFELT $ 20))
                   (QREFELT $ 22))
         (QREFELT $ 25))) 

(SDEFUN |EXPUPXS;<;2$B;6| ((|f| $) (|g| $) ($ |Boolean|))
        (SPROG
         ((|gCoef| (FE)) (|fCoef| (FE)) (|ordg| #1=(|Fraction| (|Integer|)))
          (|ordf| #1#))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT $ 24)) (NULL (SPADCALL |g| (QREFELT $ 24))))
           ((SPADCALL |g| (QREFELT $ 24)) NIL)
           (#2='T
            (SEQ (LETT |ordf| (SPADCALL |f| (QREFELT $ 16)))
                 (LETT |ordg| (SPADCALL |g| (QREFELT $ 16)))
                 (EXIT
                  (COND ((SPADCALL |ordf| |ordg| (QREFELT $ 27)) 'T)
                        ((SPADCALL |ordf| |ordg| (QREFELT $ 28)) NIL)
                        (#2#
                         (SEQ
                          (LETT |fCoef| (SPADCALL |f| |ordf| (QREFELT $ 29)))
                          (LETT |gCoef| (SPADCALL |g| |ordg| (QREFELT $ 29)))
                          (EXIT
                           (COND
                            ((SPADCALL |fCoef| |gCoef| (QREFELT $ 30))
                             (SPADCALL (SPADCALL |f| (QREFELT $ 31))
                                       (SPADCALL |g| (QREFELT $ 31))
                                       (QREFELT $ 32)))
                            (#2#
                             (SPADCALL |fCoef| |gCoef|
                                       (QREFELT $ 33))))))))))))))) 

(SDEFUN |EXPUPXS;coerce;$Of;7| ((|f| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL "%e" (QREFELT $ 36))
                  (SPADCALL (SPADCALL |f| (QREFELT $ 10)) (QREFELT $ 37))
                  (QREFELT $ 38))) 

(DECLAIM (NOTINLINE |ExponentialOfUnivariatePuiseuxSeries;|)) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries| (&REST #1=#:G420)
  (SPROG NIL
         (PROG (#2=#:G421)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExponentialOfUnivariatePuiseuxSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |ExponentialOfUnivariatePuiseuxSeries;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ExponentialOfUnivariatePuiseuxSeries|)))))))))) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G413 NIL) (#2=#:G414 NIL) (#3=#:G415 NIL) (#4=#:G416 NIL)
    (#5=#:G418 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|ExponentialOfUnivariatePuiseuxSeries| DV$1 DV$2 DV$3))
    (LETT $ (GETREFV 62))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|))
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #5#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|)))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|)))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|AlgebraicallyClosedFunctionSpace|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PrimitiveFunctionCategory|))
                                          (|HasCategory| |#1|
                                                         '(|TranscendentalFunctionCategory|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasSignature| |#1|
                                                          (LIST '|integrate|
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Symbol|))))
                                          (|HasSignature| |#1|
                                                          (LIST '|variables|
                                                                (LIST
                                                                 '(|List|
                                                                   (|Symbol|))
                                                                 (|devaluate|
                                                                  |#1|))))))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #5# (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5# (|HasCategory| |#1| '(|Field|))
                                         #4# #2#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))))))
    (|haddProp| |$ConstructorCache| '|ExponentialOfUnivariatePuiseuxSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 16777216))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 33554432))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR #1# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1073741824))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|UnivariatePuiseuxSeries| |#1| |#2| |#3|))
    $))) 

(MAKEPROP '|ExponentialOfUnivariatePuiseuxSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|UnivariatePuiseuxSeries| 6 (NRTEVAL (QREFELT $ 7))
                                         (NRTEVAL (QREFELT $ 8)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep|
              (0 . |complete|) |EXPUPXS;exponential;Ups$;1|
              |EXPUPXS;exponent;$Ups;2| (|Fraction| 44) (5 . |Zero|)
              (9 . |order|) |EXPUPXS;exponentialOrder;$F;3|
              (|Record| (|:| |k| 13) (|:| |c| 6)) (|Stream| 17) (15 . |terms|)
              (20 . |complete|) (|List| 17) (25 . |entries|) (|Boolean|)
              |EXPUPXS;zero?;$B;4| (30 . =) |EXPUPXS;=;2$B;5| (36 . >) (42 . <)
              (48 . |coefficient|) (54 . =) (60 . |reductum|) |EXPUPXS;<;2$B;6|
              (65 . |smaller?|) (|String|) (|OutputForm|) (71 . |message|)
              (76 . |coerce|) (81 . ^) |EXPUPXS;coerce;$Of;7| (|List| 41)
              (|Symbol|) (|NonNegativeInteger|) (|List| 42) (|Integer|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 48) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $) (|Union| 48 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 54 '"failed")
              (|Factored| $) (|Stream| 6) (|PositiveInteger|) (|Mapping| 6 6)
              (|SingleInteger|) (|HashState|))
           '#(~= 87 |zero?| 93 |variable| 98 |unitNormal| 103 |unitCanonical|
              108 |unit?| 113 |truncate| 118 |terms| 131 |tanh| 136 |tan| 141
              |subtractIfCan| 146 |squareFreePart| 152 |squareFree| 157 |sqrt|
              162 |smaller?| 167 |sizeLess?| 173 |sinh| 179 |sin| 184 |series|
              189 |sech| 195 |sec| 200 |sample| 205 |rightRecip| 209
              |rightPower| 214 |rem| 226 |reductum| 232 |recip| 237 |quo| 242
              |principalIdeal| 248 |prime?| 253 |pole?| 258 |pi| 263 |order|
              267 |opposite?| 278 |one?| 284 |nthRoot| 289 |multiplyExponents|
              295 |multiEuclidean| 307 |monomial?| 313 |monomial| 318 |min| 324
              |max| 330 |map| 336 |log| 342 |leftRecip| 347 |leftPower| 352
              |leadingMonomial| 364 |leadingCoefficient| 369 |lcmCoef| 374
              |lcm| 380 |latex| 391 |inv| 396 |integrate| 401 |hashUpdate!| 412
              |hash| 418 |gcdPolynomial| 423 |gcd| 429 |factor| 440
              |extendedEuclidean| 445 |extend| 458 |exquo| 464
              |expressIdealMember| 470 |exponentialOrder| 476 |exponential| 481
              |exponent| 486 |exp| 491 |eval| 496 |euclideanSize| 502 |elt| 507
              |divide| 519 |differentiate| 525 |degree| 562 |csch| 567 |csc|
              572 |coth| 577 |cot| 582 |cosh| 587 |cos| 592 |complete| 597
              |commutator| 602 |coerce| 608 |coefficient| 633 |charthRoot| 639
              |characteristic| 644 |center| 648 |atanh| 653 |atan| 658
              |associator| 663 |associates?| 670 |asinh| 676 |asin| 681 |asech|
              686 |asec| 691 |approximate| 696 |antiCommutator| 702
              |annihilate?| 708 |acsch| 714 |acsc| 719 |acoth| 724 |acot| 729
              |acosh| 734 |acos| 739 ^ 744 |Zero| 774 |One| 778 D 782 >= 819 >
              825 = 831 <= 837 < 843 / 849 - 861 + 872 * 878)
           'NIL
           (CONS
            (|makeByteWordVec2| 24
                                '(0 6 0 6 0 6 6 0 6 15 6 14 6 1 2 9 4 3 14 15 7
                                  20 17 20 0 9 14 7 0 0 19 7 0 0 0 0 20 7 7 0
                                  24 0 23 17 17 0 0 0 0 17 0 0 0 0 14 7 0 0 0 0
                                  5 19 14 15 6 6 7 7 7 7 7 7))
            (CONS
             '#(NIL |Field&| |UnivariatePowerSeriesCategory&|
                |EuclideanDomain&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL NIL NIL |DivisionRing&| NIL NIL |Algebra&|
                |PartialDifferentialRing&| |DifferentialRing&| |Algebra&|
                |EntireRing&| |Algebra&| NIL NIL |Rng&| NIL |Module&| |Module&|
                |Module&| NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                NIL |NonAssociativeSemiRng&| |AbelianMonoid&| |OrderedSet&| NIL
                |MagmaWithUnit&| NIL |Magma&| |AbelianSemiGroup&|
                |SetCategory&| NIL |TranscendentalFunctionCategory&|
                |PartialOrder&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 13) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 13 (|SingletonAsOrderedSet|))
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 13) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 6)
                 (|PartialDifferentialRing| 41) (|DifferentialRing|)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 13) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 6) (|Module| $$)
                 (|Module| 13) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|BiModule| 13 13) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| 13) (|RightModule| 13)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|OrderedSet|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|) (|PartialOrder|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 35) (|Eltable| $$ $$) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 61
                                  '(1 0 0 0 10 0 13 0 14 2 0 13 0 13 15 1 0 18
                                    0 19 1 18 0 0 20 1 18 21 0 22 2 21 23 0 0
                                    25 2 13 23 0 0 27 2 13 23 0 0 28 2 0 6 0 13
                                    29 2 6 23 0 0 30 1 0 0 0 31 2 6 23 0 0 33 1
                                    35 0 34 36 1 9 35 0 37 2 35 0 0 0 38 2 0 23
                                    0 0 1 1 0 23 0 24 1 0 41 0 1 1 26 46 0 1 1
                                    26 0 0 1 1 26 23 0 1 3 0 0 0 13 13 1 2 0 0
                                    0 13 1 1 0 18 0 19 1 7 0 0 1 1 7 0 0 1 2 30
                                    45 0 0 1 1 6 0 0 1 1 6 56 0 1 1 7 0 0 1 2 0
                                    23 0 0 1 2 6 23 0 0 1 1 7 0 0 1 1 7 0 0 1 2
                                    0 0 42 18 1 1 7 0 0 1 1 7 0 0 1 0 0 0 1 1
                                    28 45 0 1 2 28 0 0 42 1 2 0 0 0 58 1 2 6 0
                                    0 0 1 1 0 0 0 31 1 28 45 0 1 2 6 0 0 0 1 1
                                    6 49 48 1 1 6 23 0 1 1 0 23 0 1 0 7 0 1 2 0
                                    13 0 13 15 1 0 13 0 1 2 0 23 0 0 1 1 28 23
                                    0 1 2 7 0 0 44 1 2 0 0 0 13 1 2 0 0 0 58 1
                                    2 6 51 48 0 1 1 0 23 0 1 2 0 0 6 13 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 59 0 1 1 7 0 0 1 1
                                    28 45 0 1 2 28 0 0 42 1 2 0 0 0 58 1 1 0 0
                                    0 1 1 0 6 0 1 2 6 47 0 0 1 2 6 0 0 0 1 1 6
                                    0 48 1 1 0 34 0 1 1 6 0 0 1 2 12 0 0 41 1 1
                                    7 0 0 1 2 0 61 61 0 1 1 0 60 0 1 2 6 50 50
                                    50 1 2 6 0 0 0 1 1 6 0 48 1 1 6 56 0 1 2 6
                                    53 0 0 1 3 6 55 0 0 0 1 2 0 0 0 13 1 2 26
                                    45 0 0 1 2 6 51 48 0 1 1 0 13 0 16 1 0 0 5
                                    11 1 0 5 0 12 1 7 0 0 1 2 10 57 0 6 1 1 6
                                    42 0 1 2 5 0 0 0 1 2 0 6 0 13 1 2 6 52 0 0
                                    1 2 4 0 0 40 1 2 4 0 0 41 1 3 4 0 0 41 42 1
                                    3 4 0 0 40 43 1 1 3 0 0 1 2 3 0 0 42 1 1 0
                                    13 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0
                                    0 1 1 7 0 0 1 1 7 0 0 1 1 0 0 0 10 2 29 0 0
                                    0 1 1 25 0 6 1 1 27 0 0 1 1 29 0 44 1 1 7 0
                                    13 1 1 0 35 0 39 2 0 6 0 13 29 1 1 45 0 1 0
                                    29 42 1 1 0 6 0 1 1 7 0 0 1 1 7 0 0 1 3 29
                                    0 0 0 0 1 2 26 23 0 0 1 1 7 0 0 1 1 7 0 0 1
                                    1 7 0 0 1 1 7 0 0 1 2 11 6 0 13 1 2 0 0 0 0
                                    1 2 29 23 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0
                                    1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 2 28 0 0 42
                                    1 2 7 0 0 13 1 2 7 0 0 0 1 2 6 0 0 44 1 2 0
                                    0 0 58 1 0 0 0 1 0 28 0 1 2 4 0 0 41 1 3 4
                                    0 0 41 42 1 2 4 0 0 40 1 3 4 0 0 40 43 1 1
                                    3 0 0 1 2 3 0 0 42 1 2 0 23 0 0 1 2 0 23 0
                                    0 1 2 0 23 0 0 26 2 0 23 0 0 1 2 0 23 0 0
                                    32 2 6 0 0 0 1 2 6 0 0 6 1 1 31 0 0 1 2 31
                                    0 0 0 1 2 0 0 0 0 1 2 31 0 44 0 1 2 7 0 0
                                    13 1 2 7 0 13 0 1 2 0 0 42 0 1 2 0 0 0 6 1
                                    2 0 0 6 0 1 2 0 0 0 0 1 2 0 0 58 0 1)))))
           '|lookupComplete|)) 
