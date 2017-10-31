
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
        (SPADCALL "%e" (SPADCALL (SPADCALL |f| (QREFELT $ 10)) (QREFELT $ 35))
                  (QREFELT $ 36))) 

(DECLAIM (NOTINLINE |ExponentialOfUnivariatePuiseuxSeries;|)) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries| (&REST #1=#:G759)
  (SPROG NIL
         (PROG (#2=#:G760)
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
   ((|pv$| NIL) (#1=#:G751 NIL) (#2=#:G752 NIL) (#3=#:G753 NIL) (#4=#:G754 NIL)
    (#5=#:G755 NIL) (#6=#:G757 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|)
          . #7=(|ExponentialOfUnivariatePuiseuxSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #7#)
    (LETT DV$3 (|devaluate| |#3|) . #7#)
    (LETT |dv$| (LIST '|ExponentialOfUnivariatePuiseuxSeries| DV$1 DV$2 DV$3)
          . #7#)
    (LETT $ (GETREFV 64) . #7#)
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
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #7#)
                                        (OR #6#
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
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #7#)
                                        (OR #6# (|HasCategory| |#1| '(|Field|))
                                            #5#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #5#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              . #7#)
                                        (OR #4#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #7#)
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
                                        (OR #6# (|HasCategory| |#1| '(|Field|))
                                            #5# #3#
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
                                         #6# (|HasCategory| |#1| '(|Field|))
                                         #5# #3#
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
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #7#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #6# (|HasCategory| |#1| '(|Field|))
                                         #5# #3#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #7#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #2# #1#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #6# (|HasCategory| |#1| '(|Field|))
                                         #5# #3#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))))
                    . #7#))
    (|haddProp| |$ConstructorCache| '|ExponentialOfUnivariatePuiseuxSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 33554432))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #4#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR #2# (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR #1# (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
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
           '#(NIL NIL NIL NIL NIL (|UnivariatePuiseuxSeries| 6 7 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep|
              (0 . |complete|) |EXPUPXS;exponential;Ups$;1|
              |EXPUPXS;exponent;$Ups;2| (|Fraction| 42) (5 . |Zero|)
              (9 . |order|) |EXPUPXS;exponentialOrder;$F;3|
              (|Record| (|:| |k| 13) (|:| |c| 6)) (|Stream| 17) (15 . |terms|)
              (20 . |complete|) (|List| 17) (25 . |entries|) (|Boolean|)
              |EXPUPXS;zero?;$B;4| (30 . =) |EXPUPXS;=;2$B;5| (36 . >) (42 . <)
              (48 . |coefficient|) (54 . =) (60 . |reductum|) |EXPUPXS;<;2$B;6|
              (65 . |smaller?|) (|OutputForm|) (71 . |coerce|) (76 . ^)
              |EXPUPXS;coerce;$Of;7| (|List| 39) (|Symbol|) (|List| 41)
              (|NonNegativeInteger|) (|Integer|) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 46) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $) (|Union| 46 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 52 '"failed")
              (|Factored| $) (|Stream| 6) (|PositiveInteger|) (|List| 59)
              (|List| 13) (|SingletonAsOrderedSet|) (|Mapping| 6 6) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 82 |zero?| 88 |variables| 93 |variable| 98 |unitNormal| 103
              |unitCanonical| 108 |unit?| 113 |truncate| 118 |terms| 131 |tanh|
              136 |tan| 141 |subtractIfCan| 146 |squareFreePart| 152
              |squareFree| 157 |sqrt| 162 |smaller?| 167 |sizeLess?| 173 |sinh|
              179 |sin| 184 |series| 189 |sech| 195 |sec| 200 |sample| 205
              |rem| 209 |reductum| 215 |recip| 220 |quo| 225 |principalIdeal|
              231 |prime?| 236 |pole?| 241 |pi| 246 |order| 250 |opposite?| 261
              |one?| 267 |nthRoot| 272 |multiplyExponents| 278 |multiEuclidean|
              290 |monomial?| 296 |monomial| 301 |min| 321 |max| 327 |map| 333
              |log| 339 |leadingMonomial| 344 |leadingCoefficient| 349
              |lcmCoef| 354 |lcm| 360 |latex| 371 |inv| 376 |integrate| 381
              |hashUpdate!| 392 |hash| 398 |gcdPolynomial| 403 |gcd| 409
              |factor| 420 |extendedEuclidean| 425 |extend| 438 |exquo| 444
              |expressIdealMember| 450 |exponentialOrder| 456 |exponential| 461
              |exponent| 466 |exp| 471 |eval| 476 |euclideanSize| 482 |elt| 487
              |divide| 499 |differentiate| 505 |degree| 542 |csch| 547 |csc|
              552 |coth| 557 |cot| 562 |cosh| 567 |cos| 572 |complete| 577
              |coerce| 582 |coefficient| 607 |charthRoot| 613 |characteristic|
              618 |center| 622 |atanh| 627 |atan| 632 |associates?| 637 |asinh|
              643 |asin| 648 |asech| 653 |asec| 658 |approximate| 663
              |annihilate?| 669 |acsch| 675 |acsc| 680 |acoth| 685 |acot| 690
              |acosh| 695 |acos| 700 ^ 705 |Zero| 735 |One| 739 D 743 >= 780 >
              786 = 792 <= 798 < 804 / 810 - 822 + 833 * 839)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 6 0 6 0 6 6 0 6 15 6 9 15 6 7 1 2 9 4 3 15
                                  14 15 7 0 14 21 7 0 0 14 20 21 7 7 0 23 0 17
                                  25 0 0 0 17 0 0 0 0 7 0 0 0 0 5 19 14 15 6 6
                                  7 7 7 7 7 7))
            (CONS
             '#(NIL |Field&| |UnivariatePowerSeriesCategory&|
                |EuclideanDomain&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DivisionRing&| |Algebra&| |Algebra&| NIL |Algebra&| NIL
                NIL |Module&| |PartialDifferentialRing&| |DifferentialRing&|
                |Module&| NIL |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL
                NIL NIL NIL |Rng&| NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                |AbelianMonoid&| |OrderedSet&| |Monoid&| NIL
                |AbelianSemiGroup&| |SemiGroup&| |SetCategory&|
                |TranscendentalFunctionCategory&| |PartialOrder&| NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 13) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 13 59) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 13)
                 (|GcdDomain|) (|IntegralDomain|) (|DivisionRing|)
                 (|Algebra| 6) (|Algebra| $$) (|LeftOreRing|) (|Algebra| 13)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 39) (|DifferentialRing|)
                 (|Module| $$) (|CommutativeRing|) (|EntireRing|) (|Module| 13)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 13 13) (|LeftModule| 6) (|RightModule| 6)
                 (|RightModule| $$) (|LeftModule| $$) (|Rng|) (|LeftModule| 13)
                 (|RightModule| 13) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|AbelianMonoid|)
                 (|OrderedSet|) (|Monoid|) (|Comparable|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|PartialOrder|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 34) (|Eltable| $$ $$) (|unitsKnown|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 63
                                  '(1 0 0 0 10 0 13 0 14 2 0 13 0 13 15 1 0 18
                                    0 19 1 18 0 0 20 1 18 21 0 22 2 21 23 0 0
                                    25 2 13 23 0 0 27 2 13 23 0 0 28 2 0 6 0 13
                                    29 2 6 23 0 0 30 1 0 0 0 31 2 6 23 0 0 33 1
                                    9 34 0 35 2 34 0 0 0 36 2 0 23 0 0 1 1 0 23
                                    0 24 1 0 57 0 1 1 0 39 0 1 1 27 44 0 1 1 27
                                    0 0 1 1 27 23 0 1 2 0 0 0 13 1 3 0 0 0 13
                                    13 1 1 0 18 0 19 1 7 0 0 1 1 7 0 0 1 2 31
                                    43 0 0 1 1 6 0 0 1 1 6 54 0 1 1 7 0 0 1 2 0
                                    23 0 0 1 2 6 23 0 0 1 1 7 0 0 1 1 7 0 0 1 2
                                    0 0 41 18 1 1 7 0 0 1 1 7 0 0 1 0 0 0 1 2 6
                                    0 0 0 1 1 0 0 0 31 1 28 43 0 1 2 6 0 0 0 1
                                    1 6 47 46 1 1 6 23 0 1 1 0 23 0 1 0 7 0 1 1
                                    0 13 0 1 2 0 13 0 13 15 2 0 23 0 0 1 1 28
                                    23 0 1 2 7 0 0 42 1 2 0 0 0 13 1 2 0 0 0 56
                                    1 2 6 49 46 0 1 1 0 23 0 1 3 0 0 0 57 58 1
                                    3 0 0 0 59 13 1 2 0 0 6 13 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 2 0 0 60 0 1 1 7 0 0 1 1 0 0 0 1
                                    1 0 6 0 1 2 6 45 0 0 1 1 6 0 46 1 2 6 0 0 0
                                    1 1 0 61 0 1 1 6 0 0 1 2 12 0 0 39 1 1 7 0
                                    0 1 2 0 63 63 0 1 1 0 62 0 1 2 6 48 48 48 1
                                    2 6 0 0 0 1 1 6 0 46 1 1 6 54 0 1 2 6 51 0
                                    0 1 3 6 53 0 0 0 1 2 0 0 0 13 1 2 27 43 0 0
                                    1 2 6 49 46 0 1 1 0 13 0 16 1 0 0 5 11 1 0
                                    5 0 12 1 7 0 0 1 2 10 55 0 6 1 1 6 41 0 1 2
                                    5 0 0 0 1 2 0 6 0 13 1 2 6 50 0 0 1 2 4 0 0
                                    38 1 2 4 0 0 39 1 3 4 0 0 38 40 1 3 4 0 0
                                    39 41 1 1 3 0 0 1 2 3 0 0 41 1 1 0 13 0 1 1
                                    7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0
                                    0 1 1 7 0 0 1 1 0 0 0 10 1 26 0 6 1 1 29 0
                                    42 1 1 27 0 0 1 1 7 0 13 1 1 0 34 0 37 2 0
                                    6 0 13 29 1 1 43 0 1 0 29 41 1 1 0 6 0 1 1
                                    7 0 0 1 1 7 0 0 1 2 27 23 0 0 1 1 7 0 0 1 1
                                    7 0 0 1 1 7 0 0 1 1 7 0 0 1 2 11 6 0 13 1 2
                                    29 23 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1
                                    7 0 0 1 1 7 0 0 1 1 7 0 0 1 2 28 0 0 41 1 2
                                    7 0 0 13 1 2 7 0 0 0 1 2 6 0 0 42 1 2 0 0 0
                                    56 1 0 0 0 1 0 28 0 1 2 4 0 0 38 1 2 4 0 0
                                    39 1 3 4 0 0 38 40 1 3 4 0 0 39 41 1 1 3 0
                                    0 1 2 3 0 0 41 1 2 0 23 0 0 1 2 0 23 0 0 1
                                    2 0 23 0 0 26 2 0 23 0 0 1 2 0 23 0 0 32 2
                                    6 0 0 0 1 2 6 0 0 6 1 2 30 0 0 0 1 1 30 0 0
                                    1 2 0 0 0 0 1 2 30 0 42 0 1 2 7 0 0 13 1 2
                                    7 0 13 0 1 2 0 0 41 0 1 2 0 0 0 6 1 2 0 0 6
                                    0 1 2 0 0 0 0 1 2 0 0 56 0 1)))))
           '|lookupComplete|)) 
