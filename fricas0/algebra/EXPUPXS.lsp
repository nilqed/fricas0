
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
            (SEQ
             (LETT |ordf| (SPADCALL |f| (QREFELT $ 16))
                   . #3=(|EXPUPXS;<;2$B;6|))
             (LETT |ordg| (SPADCALL |g| (QREFELT $ 16)) . #3#)
             (EXIT
              (COND ((SPADCALL |ordf| |ordg| (QREFELT $ 27)) 'T)
                    ((SPADCALL |ordf| |ordg| (QREFELT $ 28)) NIL)
                    (#2#
                     (SEQ
                      (LETT |fCoef| (SPADCALL |f| |ordf| (QREFELT $ 29)) . #3#)
                      (LETT |gCoef| (SPADCALL |g| |ordg| (QREFELT $ 29)) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |fCoef| |gCoef| (QREFELT $ 30))
                         (SPADCALL (SPADCALL |f| (QREFELT $ 31))
                                   (SPADCALL |g| (QREFELT $ 31))
                                   (QREFELT $ 32)))
                        (#2#
                         (SPADCALL |fCoef| |gCoef| (QREFELT $ 33))))))))))))))) 

(SDEFUN |EXPUPXS;coerce;$Of;7| ((|f| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL "%e" (QREFELT $ 36))
                  (SPADCALL (SPADCALL |f| (QREFELT $ 10)) (QREFELT $ 37))
                  (QREFELT $ 38))) 

(DECLAIM (NOTINLINE |ExponentialOfUnivariatePuiseuxSeries;|)) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries| (&REST #1=#:G763)
  (SPROG NIL
         (PROG (#2=#:G764)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExponentialOfUnivariatePuiseuxSeries|)
                                               '|domainEqualList|)
                    . #3=(|ExponentialOfUnivariatePuiseuxSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |ExponentialOfUnivariatePuiseuxSeries;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ExponentialOfUnivariatePuiseuxSeries|)))))))))) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G756 NIL) (#2=#:G757 NIL) (#3=#:G758 NIL) (#4=#:G759 NIL)
    (#5=#:G761 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|)
          . #6=(|ExponentialOfUnivariatePuiseuxSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #6#)
    (LETT DV$3 (|devaluate| |#3|) . #6#)
    (LETT |dv$| (LIST '|ExponentialOfUnivariatePuiseuxSeries| DV$1 DV$2 DV$3)
          . #6#)
    (LETT $ (GETREFV 65) . #6#)
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
                                                             '(|CommutativeRing|))
                                              . #6#)
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
                                                             '(|IntegralDomain|))
                                              . #6#)
                                        (OR #5# (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              . #6#)
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
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #6#)
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
                                                             '(|AbelianGroup|))
                                              . #6#)
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
                                                                    |#1|)))))))
                    . #6#))
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
              (|Symbol|) (|List| 43) (|NonNegativeInteger|) (|Integer|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Union| 48 '"failed")
              (|Record| (|:| |coef| 48) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 54 '"failed")
              (|Factored| $) (|Stream| 6) (|PositiveInteger|) (|List| 61)
              (|List| 13) (|SingletonAsOrderedSet|) (|Mapping| 6 6)
              (|SingleInteger|) (|HashState|))
           '#(~= 87 |zero?| 93 |variables| 98 |variable| 103 |unitNormal| 108
              |unitCanonical| 113 |unit?| 118 |truncate| 123 |terms| 136 |tanh|
              141 |tan| 146 |subtractIfCan| 151 |squareFreePart| 157
              |squareFree| 162 |sqrt| 167 |smaller?| 172 |sizeLess?| 178 |sinh|
              184 |sin| 189 |series| 194 |sech| 200 |sec| 205 |sample| 210
              |rightRecip| 214 |rightPower| 219 |rem| 231 |reductum| 237
              |recip| 242 |quo| 247 |principalIdeal| 253 |prime?| 258 |pole?|
              263 |pi| 268 |order| 272 |opposite?| 283 |one?| 289 |nthRoot| 294
              |multiplyExponents| 300 |multiEuclidean| 312 |monomial?| 318
              |monomial| 323 |min| 343 |max| 349 |map| 355 |log| 361
              |leftRecip| 366 |leftPower| 371 |leadingMonomial| 383
              |leadingCoefficient| 388 |lcmCoef| 393 |lcm| 399 |latex| 410
              |inv| 415 |integrate| 420 |hashUpdate!| 431 |hash| 437
              |gcdPolynomial| 442 |gcd| 448 |factor| 459 |extendedEuclidean|
              464 |extend| 477 |exquo| 483 |expressIdealMember| 489
              |exponentialOrder| 495 |exponential| 500 |exponent| 505 |exp| 510
              |eval| 515 |euclideanSize| 521 |elt| 526 |divide| 538
              |differentiate| 544 |degree| 581 |csch| 586 |csc| 591 |coth| 596
              |cot| 601 |cosh| 606 |cos| 611 |complete| 616 |commutator| 621
              |coerce| 627 |coefficient| 652 |charthRoot| 658 |characteristic|
              663 |center| 667 |atanh| 672 |atan| 677 |associator| 682
              |associates?| 689 |asinh| 695 |asin| 700 |asech| 705 |asec| 710
              |approximate| 715 |antiCommutator| 721 |annihilate?| 727 |acsch|
              733 |acsc| 738 |acoth| 743 |acot| 748 |acosh| 753 |acos| 758 ^
              763 |Zero| 793 |One| 797 D 801 >= 838 > 844 = 850 <= 856 < 862 /
              868 - 880 + 891 * 897)
           'NIL
           (CONS
            (|makeByteWordVec2| 24
                                '(0 6 0 6 0 6 6 0 6 15 6 14 6 1 2 9 4 3 14 15 7
                                  20 17 20 0 9 14 7 0 0 19 7 0 0 0 0 20 7 7 0
                                  24 0 23 17 17 0 0 0 0 17 0 0 0 0 7 0 0 0 0 5
                                  19 14 15 6 6 7 7 7 7 7 7))
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
                |SetCategory&| |TranscendentalFunctionCategory&|
                |PartialOrder&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 13) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 13 61) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 13)
                 (|GcdDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|CommutativeRing|) (|DivisionRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6)
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
                 (|AbelianSemiGroup|) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|PartialOrder|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 35) (|Eltable| $$ $$) (|unitsKnown|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 64
                                  '(1 0 0 0 10 0 13 0 14 2 0 13 0 13 15 1 0 18
                                    0 19 1 18 0 0 20 1 18 21 0 22 2 21 23 0 0
                                    25 2 13 23 0 0 27 2 13 23 0 0 28 2 0 6 0 13
                                    29 2 6 23 0 0 30 1 0 0 0 31 2 6 23 0 0 33 1
                                    35 0 34 36 1 9 35 0 37 2 35 0 0 0 38 2 0 23
                                    0 0 1 1 0 23 0 24 1 0 59 0 1 1 0 41 0 1 1
                                    26 46 0 1 1 26 0 0 1 1 26 23 0 1 3 0 0 0 13
                                    13 1 2 0 0 0 13 1 1 0 18 0 19 1 7 0 0 1 1 7
                                    0 0 1 2 30 45 0 0 1 1 6 0 0 1 1 6 56 0 1 1
                                    7 0 0 1 2 0 23 0 0 1 2 6 23 0 0 1 1 7 0 0 1
                                    1 7 0 0 1 2 0 0 43 18 1 1 7 0 0 1 1 7 0 0 1
                                    0 0 0 1 1 28 45 0 1 2 28 0 0 43 1 2 0 0 0
                                    58 1 2 6 0 0 0 1 1 0 0 0 31 1 28 45 0 1 2 6
                                    0 0 0 1 1 6 51 48 1 1 6 23 0 1 1 0 23 0 1 0
                                    7 0 1 2 0 13 0 13 15 1 0 13 0 1 2 0 23 0 0
                                    1 1 28 23 0 1 2 7 0 0 44 1 2 0 0 0 13 1 2 0
                                    0 0 58 1 2 6 50 48 0 1 1 0 23 0 1 3 0 0 0
                                    59 60 1 3 0 0 0 61 13 1 2 0 0 6 13 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 62 0 1 1 7 0 0 1 1
                                    28 45 0 1 2 28 0 0 43 1 2 0 0 0 58 1 1 0 0
                                    0 1 1 0 6 0 1 2 6 47 0 0 1 1 6 0 48 1 2 6 0
                                    0 0 1 1 0 34 0 1 1 6 0 0 1 2 12 0 0 41 1 1
                                    7 0 0 1 2 0 64 64 0 1 1 0 63 0 1 2 6 49 49
                                    49 1 1 6 0 48 1 2 6 0 0 0 1 1 6 56 0 1 2 6
                                    53 0 0 1 3 6 55 0 0 0 1 2 0 0 0 13 1 2 26
                                    45 0 0 1 2 6 50 48 0 1 1 0 13 0 16 1 0 0 5
                                    11 1 0 5 0 12 1 7 0 0 1 2 10 57 0 6 1 1 6
                                    43 0 1 2 5 0 0 0 1 2 0 6 0 13 1 2 6 52 0 0
                                    1 2 4 0 0 40 1 2 4 0 0 41 1 3 4 0 0 40 42 1
                                    3 4 0 0 41 43 1 1 3 0 0 1 2 3 0 0 43 1 1 0
                                    13 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0
                                    0 1 1 7 0 0 1 1 7 0 0 1 1 0 0 0 10 2 29 0 0
                                    0 1 1 25 0 6 1 1 27 0 0 1 1 29 0 44 1 1 7 0
                                    13 1 1 0 35 0 39 2 0 6 0 13 29 1 1 45 0 1 0
                                    29 43 1 1 0 6 0 1 1 7 0 0 1 1 7 0 0 1 3 29
                                    0 0 0 0 1 2 26 23 0 0 1 1 7 0 0 1 1 7 0 0 1
                                    1 7 0 0 1 1 7 0 0 1 2 11 6 0 13 1 2 0 0 0 0
                                    1 2 29 23 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0
                                    1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 2 28 0 0 43
                                    1 2 7 0 0 13 1 2 7 0 0 0 1 2 6 0 0 44 1 2 0
                                    0 0 58 1 0 0 0 1 0 28 0 1 2 4 0 0 41 1 3 4
                                    0 0 41 43 1 2 4 0 0 40 1 3 4 0 0 40 42 1 1
                                    3 0 0 1 2 3 0 0 43 1 2 0 23 0 0 1 2 0 23 0
                                    0 1 2 0 23 0 0 26 2 0 23 0 0 1 2 0 23 0 0
                                    32 2 6 0 0 0 1 2 6 0 0 6 1 1 31 0 0 1 2 31
                                    0 0 0 1 2 0 0 0 0 1 2 31 0 44 0 1 2 7 0 13
                                    0 1 2 7 0 0 13 1 2 0 0 43 0 1 2 0 0 0 6 1 2
                                    0 0 6 0 1 2 0 0 0 0 1 2 0 0 58 0 1)))))
           '|lookupComplete|)) 
