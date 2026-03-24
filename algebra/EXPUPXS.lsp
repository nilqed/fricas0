
(SDEFUN |EXPUPXS;exponential;Ups%;1|
        ((|f| (|UnivariatePuiseuxSeries| FE |var| |cen|)) (% (%)))
        (SPADCALL |f| (QREFELT % 10))) 

(PUT '|EXPUPXS;exponent;%Ups;2| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |EXPUPXS;exponent;%Ups;2|
        ((|f| (%)) (% (|UnivariatePuiseuxSeries| FE |var| |cen|))) |f|) 

(SDEFUN |EXPUPXS;exponentialOrder;%F;3|
        ((|f| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL (SPADCALL |f| (QREFELT % 12)) (|spadConstant| % 14)
                  (QREFELT % 15))) 

(SDEFUN |EXPUPXS;zero?;%B;4| ((|f| (%)) (% (|Boolean|)))
        (NULL
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT % 19)) (QREFELT % 20))
                   (QREFELT % 22)))) 

(SDEFUN |EXPUPXS;=;2%B;5| ((|f| (%)) (|g| (%)) (% (|Boolean|)))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT % 19)) (QREFELT % 20))
                   (QREFELT % 22))
         (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT % 19)) (QREFELT % 20))
                   (QREFELT % 22))
         (QREFELT % 25))) 

(SDEFUN |EXPUPXS;<;2%B;6| ((|f| (%)) (|g| (%)) (% (|Boolean|)))
        (SPROG
         ((|gCoef| (FE)) (|fCoef| (FE)) (|ordg| #1=(|Fraction| (|Integer|)))
          (|ordf| #1#))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT % 24)) (NULL (SPADCALL |g| (QREFELT % 24))))
           ((SPADCALL |g| (QREFELT % 24)) NIL)
           (#2='T
            (SEQ (LETT |ordf| (SPADCALL |f| (QREFELT % 16)))
                 (LETT |ordg| (SPADCALL |g| (QREFELT % 16)))
                 (EXIT
                  (COND ((SPADCALL |ordf| |ordg| (QREFELT % 27)) 'T)
                        ((SPADCALL |ordf| |ordg| (QREFELT % 28)) NIL)
                        (#2#
                         (SEQ
                          (LETT |fCoef| (SPADCALL |f| |ordf| (QREFELT % 29)))
                          (LETT |gCoef| (SPADCALL |g| |ordg| (QREFELT % 29)))
                          (EXIT
                           (COND
                            ((SPADCALL |fCoef| |gCoef| (QREFELT % 30))
                             (SPADCALL (SPADCALL |f| (QREFELT % 31))
                                       (SPADCALL |g| (QREFELT % 31))
                                       (QREFELT % 32)))
                            (#2#
                             (SPADCALL |fCoef| |gCoef|
                                       (QREFELT % 33))))))))))))))) 

(SDEFUN |EXPUPXS;coerce;%Of;7| ((|f| (%)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL "%e" (QREFELT % 36))
                  (SPADCALL (SPADCALL |f| (QREFELT % 10)) (QREFELT % 37))
                  (QREFELT % 38))) 

(DECLAIM (NOTINLINE |ExponentialOfUnivariatePuiseuxSeries;|)) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G35 NIL) (#2=#:G36 NIL) (#3=#:G37 NIL) (#4=#:G38 NIL)
    (#5=#:G40 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|ExponentialOfUnivariatePuiseuxSeries| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 60))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|Comparable|))
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
                                                                 |#1|)))))
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
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 33554432))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 67108864))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 134217728))
    (AND
     (OR (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 268435456))
    (AND
     (OR (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 536870912))
    (AND
     (OR (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR #1# (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 4294967296))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|UnivariatePuiseuxSeries| |#1| |#2| |#3|))
    %))) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries| (&REST #1=#:G42)
  (SPROG NIL
         (PROG (#2=#:G43)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
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

(MAKEPROP '|ExponentialOfUnivariatePuiseuxSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|UnivariatePuiseuxSeries| 6 (NRTEVAL (QREFELT % 7))
                                         (NRTEVAL (QREFELT % 8)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep|
              (0 . |complete|) |EXPUPXS;exponential;Ups%;1|
              |EXPUPXS;exponent;%Ups;2| (|Fraction| 46) (5 . |Zero|)
              (9 . |order|) |EXPUPXS;exponentialOrder;%F;3|
              (|Record| (|:| |k| 13) (|:| |c| 6)) (|Stream| 17) (15 . |terms|)
              (20 . |complete|) (|List| 17) (25 . |entries|) (|Boolean|)
              |EXPUPXS;zero?;%B;4| (30 . =) |EXPUPXS;=;2%B;5| (36 . >) (42 . <)
              (48 . |coefficient|) (54 . =) (60 . |reductum|) |EXPUPXS;<;2%B;6|
              (65 . |smaller?|) (|String|) (|OutputForm|) (71 . |message|)
              (76 . |coerce|) (81 . ^) |EXPUPXS;coerce;%Of;7|
              (|PositiveInteger|) (|Mapping| 6 6) (|Symbol|)
              (|NonNegativeInteger|) (|List| 42) (|List| 43) (|Integer|)
              (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Factored| %) (|Union| 51 '#1="failed") (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 53 '#1#)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 51) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Stream| 6))
           '#(~= 87 |zero?| 93 |variable| 98 |unitNormal| 103 |unitCanonical|
              108 |unit?| 113 |truncate| 118 |terms| 131 |tanh| 136 |tan| 141
              |subtractIfCan| 146 |squareFreePart| 152 |squareFree| 157 |sqrt|
              162 |smaller?| 167 |sizeLess?| 173 |sinh| 179 |sin| 184 |series|
              189 |sech| 195 |sec| 200 |sample| 205 |rightRecip| 209
              |rightPower| 214 |rem| 226 |reductum| 232 |recip| 237 |quo| 242
              |principalIdeal| 248 |prime?| 253 |pole?| 258 |plenaryPower| 263
              |pi| 269 |order| 273 |opposite?| 284 |one?| 290 |nthRoot| 295
              |multiplyExponents| 301 |multiEuclidean| 313 |monomial?| 319
              |monomial| 324 |min| 330 |max| 336 |map| 342 |log| 348
              |leftRecip| 353 |leftPower| 358 |leadingTerm| 370
              |leadingSupport| 375 |leadingMonomial| 380 |leadingCoefficient|
              385 |lcmCoef| 390 |lcm| 396 |latex| 407 |inv| 412 |integrate| 417
              |gcdPolynomial| 428 |gcd| 434 |factor| 445 |extendedEuclidean|
              450 |extend| 463 |exquo| 469 |expressIdealMember| 475
              |exponentialOrder| 481 |exponential| 486 |exponent| 491 |exp| 496
              |eval| 501 |euclideanSize| 507 |elt| 512 |divide| 524
              |differentiate| 530 |degree| 567 |csch| 572 |csc| 577 |coth| 582
              |cot| 587 |cosh| 592 |cos| 597 |constructOrdered| 602 |construct|
              607 |complete| 612 |commutator| 617 |coerce| 623 |coefficient|
              648 |charthRoot| 654 |characteristic| 659 |center| 663 |atanh|
              668 |atan| 673 |associator| 678 |associates?| 685 |asinh| 691
              |asin| 696 |asech| 701 |asec| 706 |approximate| 711
              |antiCommutator| 717 |annihilate?| 723 |acsch| 729 |acsc| 734
              |acoth| 739 |acot| 744 |acosh| 749 |acos| 754 ^ 759 |Zero| 789
              |One| 793 D 797 >= 834 > 840 = 846 <= 852 < 858 / 864 - 876 + 887
              * 893)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 7 0 7 0 7 7 0 7 0 16 7 15 7 6 16 15 3 4 10
                                  2 1 21 6 21 15 18 10 6 15 10 0 6 20 0 0 0 6 6
                                  21 0 0 0 0 0 25 0 18 18 24 0 18 0 0 0 0 0 0 0
                                  15 6 0 7 7 16 15 20 6 6 6 6 6 6 5 0 0 0 0))
            (CONS
             '#(NIL |Field&| NIL |EuclideanDomain&|
                |UnivariatePowerSeriesCategory&| |UniqueFactorizationDomain&|
                NIL |PowerSeriesCategory&| |GcdDomain&| |AbelianMonoidRing&|
                NIL |DivisionRing&| NIL NIL |Algebra&| |EntireRing&| |Algebra&|
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&| NIL
                NIL NIL |NonAssociativeAlgebra&| |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&| |Module&|
                |Module&| |Module&| NIL NIL |NonAssociativeRing&| NIL NIL NIL
                NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL NIL |MagmaWithUnit&| NIL
                |OrderedSet&| |AbelianMonoid&| |NonAssociativeSemiRng&|
                |AbelianSemiGroup&| |Magma&| NIL NIL
                |TranscendentalFunctionCategory&| |SetCategory&| NIL NIL NIL
                NIL NIL |RadicalCategory&| |ElementaryFunctionCategory&| NIL
                |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL |BasicType&| NIL
                |PartialOrder&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariateSeriesWithRationalExponents| 6 13)
                 (|EuclideanDomain|) (|UnivariatePowerSeriesCategory| 6 13)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|PowerSeriesCategory| 6 13 (|SingletonAsOrderedSet|))
                 (|GcdDomain|) (|AbelianMonoidRing| 6 13) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 13) (|EntireRing|) (|Algebra| $$)
                 (|DifferentialRing|) (|PartialDifferentialRing| 42)
                 (|Algebra| 6) (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Ring|) (|NonAssociativeAlgebra| 13) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|Module| 13) (|Module| $$)
                 (|Module| 6) (|SemiRng|) (|BiModule| 13 13)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 13) (|RightModule| 13)
                 (|LeftModule| 13) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|RightModule| $$) (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|OrderedSet|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|CommutativeStar|) (|TranscendentalFunctionCategory|)
                 (|SetCategory|) (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|RadicalCategory|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|Eltable| $$ $$)
                 (|CoercibleTo| 35) (|BasicType|)
                 (|VariablesCommuteWithCoefficients|) (|PartialOrder|))
              (|makeByteWordVec2| 59
                                  '(1 0 0 0 10 0 13 0 14 2 0 13 0 13 15 1 0 18
                                    0 19 1 18 0 0 20 1 18 21 0 22 2 21 23 0 0
                                    25 2 13 23 0 0 27 2 13 23 0 0 28 2 0 6 0 13
                                    29 2 6 23 0 0 30 1 0 0 0 31 2 6 23 0 0 33 1
                                    35 0 34 36 1 9 35 0 37 2 35 0 0 0 38 2 0 23
                                    0 0 1 1 0 23 0 24 1 0 42 0 1 1 27 48 0 1 1
                                    27 0 0 1 1 27 23 0 1 3 0 0 0 13 13 1 2 0 0
                                    0 13 1 1 0 18 0 19 1 6 0 0 1 1 6 0 0 1 2 32
                                    47 0 0 1 1 7 0 0 1 1 7 49 0 1 1 6 0 0 1 2 0
                                    23 0 0 1 2 7 23 0 0 1 1 6 0 0 1 1 6 0 0 1 2
                                    0 0 43 18 1 1 6 0 0 1 1 6 0 0 1 0 0 0 1 1
                                    30 47 0 1 2 0 0 0 40 1 2 30 0 0 43 1 2 7 0
                                    0 0 1 1 8 0 0 31 1 30 47 0 1 2 7 0 0 0 1 1
                                    7 56 51 1 1 7 23 0 1 1 0 23 0 1 2 28 0 0 40
                                    1 0 6 0 1 2 0 13 0 13 15 1 0 13 0 1 2 0 23
                                    0 0 1 1 30 23 0 1 2 6 0 0 46 1 2 0 0 0 40 1
                                    2 0 0 0 13 1 2 7 50 51 0 1 1 0 23 0 1 2 0 0
                                    6 13 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 41 0 1
                                    1 6 0 0 1 1 30 47 0 1 2 0 0 0 40 1 2 30 0 0
                                    43 1 1 8 17 0 1 1 8 13 0 1 1 0 0 0 1 1 0 6
                                    0 1 2 7 58 0 0 1 2 7 0 0 0 1 1 7 0 51 1 1 0
                                    34 0 1 1 7 0 0 1 2 13 0 0 42 1 1 6 0 0 1 2
                                    7 57 57 57 1 2 7 0 0 0 1 1 7 0 51 1 1 7 49
                                    0 1 2 7 52 0 0 1 3 7 54 0 0 0 1 2 0 0 0 13
                                    1 2 27 47 0 0 1 2 7 50 51 0 1 1 0 13 0 16 1
                                    0 0 5 11 1 0 5 0 12 1 6 0 0 1 2 11 59 0 6 1
                                    1 7 43 0 1 2 0 6 0 13 1 2 5 0 0 0 1 2 7 55
                                    0 0 1 3 4 0 0 44 45 1 2 4 0 0 44 1 3 4 0 0
                                    42 43 1 2 4 0 0 42 1 2 3 0 0 43 1 1 3 0 0 1
                                    1 0 13 0 1 1 6 0 0 1 1 6 0 0 1 1 6 0 0 1 1
                                    6 0 0 1 1 6 0 0 1 1 6 0 0 1 1 8 0 21 1 1 0
                                    0 21 1 1 0 0 0 10 2 31 0 0 0 1 1 0 35 0 39
                                    1 26 0 6 1 1 29 0 0 1 1 31 0 46 1 1 6 0 13
                                    1 2 0 6 0 13 29 1 1 47 0 1 0 31 43 1 1 0 6
                                    0 1 1 6 0 0 1 1 6 0 0 1 3 31 0 0 0 0 1 2 27
                                    23 0 0 1 1 6 0 0 1 1 6 0 0 1 1 6 0 0 1 1 6
                                    0 0 1 2 12 6 0 13 1 2 0 0 0 0 1 2 31 23 0 0
                                    1 1 6 0 0 1 1 6 0 0 1 1 6 0 0 1 1 6 0 0 1 1
                                    6 0 0 1 1 6 0 0 1 2 0 0 0 40 1 2 30 0 0 43
                                    1 2 6 0 0 0 1 2 6 0 0 13 1 2 7 0 0 46 1 0 0
                                    0 1 0 30 0 1 3 4 0 0 42 43 1 3 4 0 0 44 45
                                    1 2 4 0 0 42 1 2 4 0 0 44 1 2 3 0 0 43 1 1
                                    3 0 0 1 2 0 23 0 0 1 2 0 23 0 0 1 2 0 23 0
                                    0 26 2 0 23 0 0 1 2 0 23 0 0 32 2 7 0 0 6 1
                                    2 7 0 0 0 1 1 33 0 0 1 2 33 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 40 0 1 2 0 0 0 0 1 2 0 0 0 6 1 2
                                    0 0 6 0 1 2 0 0 43 0 1 2 33 0 46 0 1 2 6 0
                                    0 13 1 2 6 0 13 0 1)))))
           '|lookupComplete|)) 
