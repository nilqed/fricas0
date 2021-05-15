
(SDEFUN |TS;polynomial;$NniP;1|
        ((|s| $) (|n| |NonNegativeInteger|) ($ |Polynomial| |Coef|))
        (SPROG ((|sum| (|Polynomial| |Coef|)) (#1=#:G384 NIL) (|i| NIL))
               (SEQ (LETT |sum| (|spadConstant| $ 9))
                    (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                         (COND
                          ((OR (|greater_SI| |i| #1#)
                               (NULL (NULL (SPADCALL |s| (QREFELT $ 11)))))
                           (GO G191)))
                         (SEQ
                          (LETT |sum|
                                (SPADCALL |sum| (SPADCALL |s| (QREFELT $ 12))
                                          (QREFELT $ 13)))
                          (EXIT (LETT |s| (SPADCALL |s| (QREFELT $ 14)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |sum|)))) 

(DECLAIM (NOTINLINE |TaylorSeries;|)) 

(DEFUN |TaylorSeries| (#1=#:G393)
  (SPROG NIL
         (PROG (#2=#:G394)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TaylorSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|TaylorSeries;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TaylorSeries|)))))))))) 

(DEFUN |TaylorSeries;| (|#1|)
  (SPROG
   ((#1=#:G392 NIL) (|pv$| NIL) (#2=#:G391 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|TaylorSeries| DV$1))
    (LETT $ (GETREFV 35))
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
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|TaylorSeries| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 128))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 256))
    (AND
     (OR (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #1#)
     (|augmentPredVector| $ 512))
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
              (|List| 26) (|IndexedExponents| 20) (|Mapping| 6 6)
              (|PositiveInteger|) (|HashState|) (|String|) (|OutputForm|)
              (|SingleInteger|))
           '#(~= 25 |zero?| 31 |unitNormal| 36 |unitCanonical| 41 |unit?| 46
              |tanh| 51 |tan| 56 |subtractIfCan| 61 |sqrt| 67 |sinh| 72 |sin|
              77 |sech| 82 |sec| 87 |sample| 92 |rightRecip| 96 |rightPower|
              101 |reductum| 113 |recip| 118 |polynomial| 123 |pole?| 136 |pi|
              141 |order| 145 |opposite?| 158 |one?| 164 |nthRoot| 169
              |monomial?| 175 |monomial| 180 |map| 200 |log| 206 |leftRecip|
              211 |leftPower| 216 |leadingMonomial| 228 |leadingCoefficient|
              233 |latex| 238 |integrate| 243 |hashUpdate!| 256 |hash| 262
              |fintegrate| 267 |extend| 274 |exquo| 280 |exp| 286 |eval| 291
              |differentiate| 331 |degree| 357 |csch| 362 |csc| 367 |coth| 372
              |cot| 377 |cosh| 382 |cos| 387 |complete| 392 |commutator| 397
              |coerce| 403 |coefficient| 438 |charthRoot| 464 |characteristic|
              469 |atanh| 473 |atan| 478 |associator| 483 |associates?| 490
              |asinh| 496 |asin| 501 |asech| 506 |asec| 511 |antiCommutator|
              516 |annihilate?| 522 |acsch| 528 |acsc| 533 |acoth| 538 |acot|
              543 |acosh| 548 |acos| 553 ^ 558 |Zero| 582 |One| 586 D 590 = 616
              / 622 - 628 + 639 * 645)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 2 6 0 1 6 2 3 4 5 0 0 0 0 1 6 5 0 0 0 1
                                  0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 6 0 0
                                  0 0 0 0 1 1 1 1 1 1 6 2))
            (CONS
             '#(|MultivariateTaylorSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL NIL |PartialDifferentialRing&|
                |Algebra&| |Algebra&| |EntireRing&| NIL NIL |Algebra&| NIL
                |Rng&| NIL NIL |Module&| |Module&| |Module&| NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Magma&|
                |AbelianSemiGroup&| |Evalable&| |SetCategory&|
                |TranscendentalFunctionCategory&| NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL |BasicType&| NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL NIL)
             (CONS
              '#((|MultivariateTaylorSeriesCategory| 6 20)
                 (|PowerSeriesCategory| 6 28 20) (|AbelianMonoidRing| 6 28)
                 (|IntegralDomain|) (|CommutativeRing|)
                 (|PartialDifferentialRing| 20) (|Algebra| 22) (|Algebra| $$)
                 (|EntireRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6) (|Ring|) (|Rng|)
                 (|SemiRing|) (|SemiRng|) (|Module| 22) (|Module| $$)
                 (|Module| 6) (|BiModule| 6 6) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 22 22) (|LeftModule| 6)
                 (|RightModule| 6) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 22) (|RightModule| 22)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Magma|)
                 (|AbelianSemiGroup|) (|Evalable| $$) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|CommutativeStar|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| 20 $$)
                 (|VariablesCommuteWithCoefficients|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 33)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|TwoSidedRecip|) (|noZeroDivisors|))
              (|makeByteWordVec2| 34
                                  '(0 8 0 9 1 7 10 0 11 1 7 8 0 12 2 8 0 0 0 13
                                    1 7 0 0 14 2 0 10 0 0 1 1 0 10 0 1 1 9 17 0
                                    1 1 9 0 0 1 1 9 10 0 1 1 1 0 0 1 1 1 0 0 1
                                    2 0 18 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1
                                    1 1 0 0 1 1 1 0 0 1 0 0 0 1 1 0 18 0 1 2 0
                                    0 0 15 1 2 0 0 0 30 1 1 0 0 0 1 1 0 18 0 1
                                    3 0 8 0 15 15 1 2 0 8 0 15 16 1 0 10 0 1 0
                                    1 0 1 3 0 15 0 20 15 1 2 0 15 0 20 1 2 0 10
                                    0 0 1 1 0 10 0 1 2 1 0 0 21 1 1 0 10 0 1 3
                                    0 0 0 23 24 1 3 0 0 0 20 15 1 2 0 0 6 28 1
                                    2 0 0 29 0 1 1 1 0 0 1 1 0 18 0 1 2 0 0 0
                                    15 1 2 0 0 0 30 1 1 0 0 0 1 1 0 6 0 1 1 0
                                    32 0 1 3 1 0 0 20 6 1 2 1 0 0 20 1 2 0 31
                                    31 0 1 1 0 34 0 1 3 1 0 19 20 6 1 2 0 0 0
                                    15 1 2 9 18 0 0 1 1 1 0 0 1 3 0 0 0 25 25 1
                                    2 0 0 0 26 1 3 0 0 0 0 0 1 3 0 0 0 23 25 1
                                    2 0 0 0 27 1 3 0 0 0 20 0 1 3 0 0 0 23 24 1
                                    2 0 0 0 23 1 3 0 0 0 20 15 1 2 0 0 0 20 1 1
                                    0 28 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1
                                    0 0 1 1 1 0 0 1 1 1 0 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 1 8 0 6 1 1 10 0 0 1 1 1 0 22 1 1 0 0 8
                                    1 1 0 0 20 1 1 0 0 21 1 1 0 33 0 1 2 0 8 0
                                    15 1 3 0 0 0 23 24 1 3 0 0 0 20 15 1 2 0 6
                                    0 28 1 1 3 18 0 1 0 0 15 1 1 1 0 0 1 1 1 0
                                    0 1 3 0 0 0 0 0 1 2 9 10 0 0 1 1 1 0 0 1 1
                                    1 0 0 1 1 1 0 0 1 1 1 0 0 1 2 0 0 0 0 1 2 0
                                    10 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1
                                    0 0 1 1 1 0 0 1 1 1 0 0 1 2 1 0 0 22 1 2 1
                                    0 0 0 1 2 0 0 0 15 1 2 0 0 0 30 1 0 0 0 1 0
                                    0 0 1 3 0 0 0 23 24 1 2 0 0 0 23 1 3 0 0 0
                                    20 15 1 2 0 0 0 20 1 2 0 10 0 0 1 2 7 0 0 6
                                    1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 1 0 0
                                    22 1 2 1 0 22 0 1 2 0 0 0 6 1 2 0 0 6 0 1 2
                                    0 0 15 0 1 2 0 0 21 0 1 2 0 0 0 0 1 2 0 0
                                    30 0 1)))))
           '|lookupComplete|)) 
