
(SDEFUN |TS;polynomial;$NniP;1|
        ((|s| $) (|n| |NonNegativeInteger|) ($ |Polynomial| |Coef|))
        (SPROG ((|sum| (|Polynomial| |Coef|)) (#1=#:G705 NIL) (|i| NIL))
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

(DEFUN |TaylorSeries| (#1=#:G723)
  (SPROG NIL
         (PROG (#2=#:G724)
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
  (SPROG
   ((#1=#:G722 NIL) (|pv$| NIL) (#2=#:G721 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|TaylorSeries|))
    (LETT |dv$| (LIST '|TaylorSeries| DV$1) . #3#)
    (LETT $ (GETREFV 36) . #3#)
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
                                                             '(|CommutativeRing|))
                                              . #3#)
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|Field|))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|TaylorSeries| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 128))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           . #3#)
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
              (|List| 26) (|IndexedExponents| 20) (|Mapping| 6 6) (|List| 28)
              (|PositiveInteger|) (|HashState|) (|String|) (|OutputForm|)
              (|SingleInteger|))
           '#(~= 25 |zero?| 31 |variables| 36 |unitNormal| 41 |unitCanonical|
              46 |unit?| 51 |tanh| 56 |tan| 61 |subtractIfCan| 66 |sqrt| 72
              |sinh| 77 |sin| 82 |sech| 87 |sec| 92 |sample| 97 |rightRecip|
              101 |rightPower| 106 |reductum| 118 |recip| 123 |polynomial| 128
              |pole?| 141 |pi| 146 |order| 150 |opposite?| 163 |one?| 169
              |nthRoot| 174 |monomial?| 180 |monomial| 185 |map| 219 |log| 225
              |leftRecip| 230 |leftPower| 235 |leadingMonomial| 247
              |leadingCoefficient| 252 |latex| 257 |integrate| 262
              |hashUpdate!| 275 |hash| 281 |fintegrate| 286 |extend| 293
              |exquo| 299 |exp| 305 |eval| 310 |differentiate| 350 |degree| 376
              |csch| 381 |csc| 386 |coth| 391 |cot| 396 |cosh| 401 |cos| 406
              |complete| 411 |commutator| 416 |coerce| 422 |coefficient| 457
              |charthRoot| 483 |characteristic| 488 |atanh| 492 |atan| 497
              |associator| 502 |associates?| 509 |asinh| 515 |asin| 520 |asech|
              525 |asec| 530 |antiCommutator| 535 |annihilate?| 541 |acsch| 547
              |acsc| 552 |acoth| 557 |acot| 562 |acosh| 567 |acos| 572 ^ 577
              |Zero| 601 |One| 605 D 609 = 635 / 641 - 647 + 658 * 664)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 2 6 0 1 6 2 3 4 5 0 0 0 0 1 6 5 0 0 0 1
                                  0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0
                                  0 0 0 1 1 1 1 1 1 6 2))
            (CONS
             '#(|MultivariateTaylorSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL NIL |PartialDifferentialRing&|
                |Algebra&| |Algebra&| |EntireRing&| NIL NIL |Algebra&| NIL
                |Rng&| NIL NIL |Module&| |Module&| |Module&| NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Magma&|
                |AbelianSemiGroup&| |Evalable&| |SetCategory&|
                |TranscendentalFunctionCategory&| |InnerEvalable&|
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
                                    1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 0 0 0 1 1 0
                                    18 0 1 2 0 0 0 15 1 2 0 0 0 31 1 1 0 0 0 1
                                    1 0 18 0 1 2 0 8 0 15 16 3 0 8 0 15 15 1 1
                                    0 10 0 1 0 1 0 1 2 0 15 0 20 1 3 0 15 0 20
                                    15 1 2 0 10 0 0 1 1 0 10 0 1 2 1 0 0 21 1 1
                                    0 10 0 1 3 0 0 0 20 15 1 3 0 0 0 23 24 1 2
                                    0 0 6 28 1 3 0 0 0 23 30 1 3 0 0 0 20 28 1
                                    2 0 0 29 0 1 1 1 0 0 1 1 0 18 0 1 2 0 0 0
                                    15 1 2 0 0 0 31 1 1 0 0 0 1 1 0 6 0 1 1 0
                                    33 0 1 3 1 0 0 20 6 1 2 1 0 0 20 1 2 0 32
                                    32 0 1 1 0 35 0 1 3 1 0 19 20 6 1 2 0 0 0
                                    15 1 2 9 18 0 0 1 1 1 0 0 1 3 0 0 0 25 25 1
                                    2 0 0 0 26 1 3 0 0 0 0 0 1 3 0 0 0 23 25 1
                                    2 0 0 0 27 1 3 0 0 0 20 0 1 3 0 0 0 20 15 1
                                    3 0 0 0 23 24 1 2 0 0 0 20 1 2 0 0 0 23 1 1
                                    0 28 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1
                                    0 0 1 1 1 0 0 1 1 1 0 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 1 8 0 6 1 1 10 0 0 1 1 1 0 22 1 1 0 0 8
                                    1 1 0 0 20 1 1 0 0 21 1 1 0 34 0 1 2 0 8 0
                                    15 1 3 0 0 0 23 24 1 3 0 0 0 20 15 1 2 0 6
                                    0 28 1 1 3 18 0 1 0 0 15 1 1 1 0 0 1 1 1 0
                                    0 1 3 0 0 0 0 0 1 2 9 10 0 0 1 1 1 0 0 1 1
                                    1 0 0 1 1 1 0 0 1 1 1 0 0 1 2 0 0 0 0 1 2 0
                                    10 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1
                                    0 0 1 1 1 0 0 1 1 1 0 0 1 2 1 0 0 22 1 2 1
                                    0 0 0 1 2 0 0 0 15 1 2 0 0 0 31 1 0 0 0 1 0
                                    0 0 1 3 0 0 0 20 15 1 3 0 0 0 23 24 1 2 0 0
                                    0 20 1 2 0 0 0 23 1 2 0 10 0 0 1 2 7 0 0 6
                                    1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 1 0 0
                                    22 1 2 1 0 22 0 1 2 0 0 0 6 1 2 0 0 6 0 1 2
                                    0 0 15 0 1 2 0 0 21 0 1 2 0 0 0 0 1 2 0 0
                                    31 0 1)))))
           '|lookupComplete|)) 
