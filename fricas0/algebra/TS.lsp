
(SDEFUN |TS;polynomial;$NniP;1|
        ((|s| $) (|n| |NonNegativeInteger|) ($ |Polynomial| |Coef|))
        (SPROG ((|sum| (|Polynomial| |Coef|)) (#1=#:G702 NIL) (|i| NIL))
               (SEQ
                (LETT |sum| (|spadConstant| $ 9)
                      . #2=(|TS;polynomial;$NniP;1|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# |n| . #2#) G190
                     (COND
                      ((OR (|greater_SI| |i| #1#)
                           (NULL (NULL (SPADCALL |s| (QREFELT $ 11)))))
                       (GO G191)))
                     (SEQ
                      (LETT |sum|
                            (SPADCALL |sum| (SPADCALL |s| (QREFELT $ 12))
                                      (QREFELT $ 13))
                            . #2#)
                      (EXIT (LETT |s| (SPADCALL |s| (QREFELT $ 14)) . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |sum|)))) 

(DECLAIM (NOTINLINE |TaylorSeries;|)) 

(DEFUN |TaylorSeries| (#1=#:G717)
  (SPROG NIL
         (PROG (#2=#:G718)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TaylorSeries|)
                                               '|domainEqualList|)
                    . #3=(|TaylorSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|TaylorSeries;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TaylorSeries|)))))))))) 

(DEFUN |TaylorSeries;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G716 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|TaylorSeries|))
          (LETT |dv$| (LIST '|TaylorSeries| DV$1) . #2#)
          (LETT $ (GETREFV 36) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|CommutativeRing|))
                                                    . #2#)
                                              (OR #1#
                                                  (|HasCategory| |#1|
                                                                 '(|IntegralDomain|)))
                                              (|HasCategory| |#1| '(|Field|))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|TaylorSeries| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND #1# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
               (|augmentPredVector| $ 128))
          (AND (|HasCategory| |#1| '(|IntegralDomain|))
               (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
               (|augmentPredVector| $ 256))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Stream| (|Polynomial| |#1|)))
          $))) 

(MAKEPROP '|TaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariateTaylorSeries| 6 20 8)
              (|local| |#1|) '|Rep| (|Polynomial| 6) (0 . |Zero|) (|Boolean|)
              (4 . |empty?|) (9 . |frst|) (14 . +) (20 . |rst|)
              (|NonNegativeInteger|) |TS;polynomial;$NniP;1|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Union| $ '"failed") (|Mapping| $) (|Symbol|) (|Integer|)
              (|Fraction| 21) (|List| 20) (|List| 15) (|List| $) (|Equation| $)
              (|List| 26) (|IndexedExponents| 20) (|Mapping| 6 6) (|List| 28)
              (|PositiveInteger|) (|HashState|) (|String|) (|OutputForm|)
              (|SingleInteger|))
           '#(~= 25 |zero?| 31 |variables| 36 |unitNormal| 41 |unitCanonical|
              46 |unit?| 51 |tanh| 56 |tan| 61 |subtractIfCan| 66 |sqrt| 72
              |sinh| 77 |sin| 82 |sech| 87 |sec| 92 |sample| 97 |reductum| 101
              |recip| 106 |polynomial| 111 |pole?| 124 |pi| 129 |order| 133
              |opposite?| 146 |one?| 152 |nthRoot| 157 |monomial?| 163
              |monomial| 168 |map| 202 |log| 208 |leadingMonomial| 213
              |leadingCoefficient| 218 |latex| 223 |integrate| 228
              |hashUpdate!| 241 |hash| 247 |fintegrate| 252 |extend| 259
              |exquo| 265 |exp| 271 |eval| 276 |differentiate| 316 |degree| 342
              |csch| 347 |csc| 352 |coth| 357 |cot| 362 |cosh| 367 |cos| 372
              |complete| 377 |coerce| 382 |coefficient| 417 |charthRoot| 443
              |characteristic| 448 |atanh| 452 |atan| 457 |associates?| 462
              |asinh| 468 |asin| 473 |asech| 478 |asec| 483 |annihilate?| 488
              |acsch| 494 |acsc| 499 |acoth| 504 |acot| 509 |acosh| 514 |acos|
              519 ^ 524 |Zero| 548 |One| 552 D 556 = 582 / 588 - 594 + 605 *
              611)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 2 1 2 5 0 1 6 2 2 3 4 5 0 0 1 6 0 0 0 0
                                  1 1 6 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 1 1
                                  1 1 1 6 2))
            (CONS
             '#(|MultivariateTaylorSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL |Algebra&| |Algebra&| |Algebra&|
                |PartialDifferentialRing&| |Module&| NIL |Module&|
                |EntireRing&| NIL NIL |Module&| |Ring&| NIL NIL NIL |Rng&| NIL
                NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| |Evalable&|
                |SetCategory&| |TranscendentalFunctionCategory&|
                |InnerEvalable&| |InnerEvalable&| NIL NIL |BasicType&| NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL NIL)
             (CONS
              '#((|MultivariateTaylorSeriesCategory| 6 20)
                 (|PowerSeriesCategory| 6 28 20) (|AbelianMonoidRing| 6 28)
                 (|IntegralDomain|) (|Algebra| 22) (|Algebra| $$) (|Algebra| 6)
                 (|PartialDifferentialRing| 20) (|Module| 22)
                 (|CommutativeRing|) (|Module| $$) (|EntireRing|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|Ring|) (|BiModule| 6 6) (|BiModule| 22 22)
                 (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| $$) (|LeftModule| 22) (|RightModule| 22)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Evalable| $$) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 20 $$) (|VariablesCommuteWithCoefficients|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 34)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|CommutativeStar|) (|noZeroDivisors|))
              (|makeByteWordVec2| 35
                                  '(0 8 0 9 1 7 10 0 11 1 7 8 0 12 2 8 0 0 0 13
                                    1 7 0 0 14 2 0 10 0 0 1 1 0 10 0 1 1 0 23 0
                                    1 1 9 17 0 1 1 9 0 0 1 1 9 10 0 1 1 1 0 0 1
                                    1 1 0 0 1 2 0 18 0 0 1 1 1 0 0 1 1 1 0 0 1
                                    1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 0 0 0 1 1 0 0
                                    0 1 1 0 18 0 1 3 0 8 0 15 15 1 2 0 8 0 15
                                    16 1 0 10 0 1 0 1 0 1 3 0 15 0 20 15 1 2 0
                                    15 0 20 1 2 0 10 0 0 1 1 0 10 0 1 2 1 0 0
                                    21 1 1 0 10 0 1 3 0 0 0 23 24 1 3 0 0 0 20
                                    15 1 2 0 0 6 28 1 3 0 0 0 20 28 1 3 0 0 0
                                    23 30 1 2 0 0 29 0 1 1 1 0 0 1 1 0 0 0 1 1
                                    0 6 0 1 1 0 33 0 1 3 1 0 0 20 6 1 2 1 0 0
                                    20 1 2 0 32 32 0 1 1 0 35 0 1 3 1 0 19 20 6
                                    1 2 0 0 0 15 1 2 9 18 0 0 1 1 1 0 0 1 3 0 0
                                    0 25 25 1 2 0 0 0 26 1 3 0 0 0 0 0 1 2 0 0
                                    0 27 1 3 0 0 0 20 0 1 3 0 0 0 23 25 1 3 0 0
                                    0 23 24 1 3 0 0 0 20 15 1 2 0 0 0 20 1 2 0
                                    0 0 23 1 1 0 28 0 1 1 1 0 0 1 1 1 0 0 1 1 1
                                    0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 0 0 0
                                    1 1 8 0 6 1 1 9 0 0 1 1 1 0 22 1 1 0 0 8 1
                                    1 0 0 20 1 1 0 0 21 1 1 0 34 0 1 2 0 8 0 15
                                    1 3 0 0 0 23 24 1 3 0 0 0 20 15 1 2 0 6 0
                                    28 1 1 3 18 0 1 0 0 15 1 1 1 0 0 1 1 1 0 0
                                    1 2 9 10 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0
                                    1 1 1 0 0 1 2 0 10 0 0 1 1 1 0 0 1 1 1 0 0
                                    1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 2
                                    1 0 0 22 1 2 1 0 0 0 1 2 0 0 0 15 1 2 0 0 0
                                    31 1 0 0 0 1 0 0 0 1 3 0 0 0 23 24 1 2 0 0
                                    0 23 1 3 0 0 0 20 15 1 2 0 0 0 20 1 2 0 10
                                    0 0 1 2 7 0 0 6 1 2 0 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 0 1 2 1 0 0 22 1 2 1 0 22 0 1 2 0 0 6 0
                                    1 2 0 0 0 6 1 2 0 0 0 0 1 2 0 0 21 0 1 2 0
                                    0 15 0 1 2 0 0 31 0 1)))))
           '|lookupComplete|)) 
