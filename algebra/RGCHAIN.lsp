
(DECLAIM (NOTINLINE |RegularChain;|)) 

(DEFUN |RegularChain| (&REST #1=#:G730)
  (SPROG NIL
         (PROG (#2=#:G731)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RegularChain|)
                                               '|domainEqualList|)
                    . #3=(|RegularChain|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RegularChain;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|RegularChain|)))))))))) 

(DEFUN |RegularChain;| (|#1| |#2|)
  (SPROG
   ((#1=#:G729 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|RegularChain|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|RegularChain| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 43) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory|
                                          (|NewSparseMultivariatePolynomial|
                                           |#1| (|OrderedVariableList| |#2|))
                                          (LIST '|Evalable|
                                                (LIST
                                                 '|NewSparseMultivariatePolynomial|
                                                 (|devaluate| |#1|)
                                                 (LIST '|OrderedVariableList|
                                                       (|devaluate| |#2|)))))
                                         (|HasCategory|
                                          (|NewSparseMultivariatePolynomial|
                                           |#1| (|OrderedVariableList| |#2|))
                                          '(|SetCategory|)))
                                        (|HasCategory|
                                         (|NewSparseMultivariatePolynomial|
                                          |#1| (|OrderedVariableList| |#2|))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory|
                                         (|NewSparseMultivariatePolynomial|
                                          |#1| (|OrderedVariableList| |#2|))
                                         '(|BasicType|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory|
                                         (|OrderedVariableList| |#2|)
                                         '(|Finite|))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|RegularChain| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 32))
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #2#)
         (|augmentPredVector| $ 64))
    (AND #1#
         (|HasCategory|
          (|NewSparseMultivariatePolynomial| |#1| (|OrderedVariableList| |#2|))
          '(|BasicType|))
         (|augmentPredVector| $ 128))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|RegularChain| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|RegularTriangularSet| 6 (|IndexedExponents| 29) 29 11)
              (|local| |#1|) (|local| |#2|) (|Equation| 11) (|List| 8)
              (|List| 11) (|NewSparseMultivariatePolynomial| 6 29) (|Boolean|)
              (|NonNegativeInteger|) (|Mapping| 11 11 11) (|InputForm|)
              (|Mapping| 12 11) (|Mapping| 11 11)
              (|Record| (|:| |num| 11) (|:| |den| 6))
              (|Record| (|:| |rnum| 6) (|:| |polnum| 11) (|:| |den| 6))
              (|List| $) (|Record| (|:| |val| 11) (|:| |tower| $)) (|List| 21)
              (|Union| 11 20) (|Union| 12 20)
              (|Record| (|:| |val| 12) (|:| |tower| $)) (|List| 25)
              (|Union| $ '#1="failed") (|Union| 11 '#1#)
              (|OrderedVariableList| (NRTEVAL (QREFELT $ 7))) (|List| 29)
              (|Record| (|:| |close| $) (|:| |open| 10)) (|List| 31)
              (|Mapping| 12 11 11) (|Mapping| 12 11 10)
              (|Record| (|:| |close| 10) (|:| |open| 10))
              (|Record| (|:| |bas| $) (|:| |top| 10)) (|Union| 36 '#1#)
              (|Record| (|:| |under| $) (|:| |floor| $) (|:| |upper| $))
              (|HashState|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#(~= 0 |zeroSetSplitIntoTriangularSystems| 6 |zeroSetSplit| 11
              |variables| 29 |trivialIdeal?| 34 |triangular?| 39
              |stronglyReduced?| 44 |stronglyReduce| 55 |squareFreePart| 61
              |sort| 67 |size?| 73 |select| 79 |sample| 91 |roughUnitIdeal?| 95
              |roughSubIdeal?| 100 |roughEqualIdeals?| 106 |roughBase?| 112
              |rewriteSetWithReduction| 117 |rewriteIdealWithRemainder| 125
              |rewriteIdealWithHeadRemainder| 131 |retractIfCan| 137 |retract|
              142 |rest| 147 |removeZero| 152 |removeDuplicates| 158 |remove|
              163 |remainder| 175 |reduced?| 181 |reduceByQuasiMonic| 188
              |reduce| 194 |quasiComponent| 223 |purelyTranscendental?| 228
              |purelyAlgebraicLeadingMonomial?| 234 |purelyAlgebraic?| 240
              |parts| 251 |normalized?| 256 |mvar| 267 |more?| 272 |members|
              278 |member?| 283 |map!| 289 |map| 295 |mainVariables| 301
              |mainVariable?| 306 |less?| 312 |latex| 318
              |lastSubResultantElseSplit| 323 |lastSubResultant| 330 |last| 337
              |invertibleSet| 342 |invertibleElseSplit?| 348 |invertible?| 354
              |intersect| 366 |internalAugment| 390 |initials| 402
              |initiallyReduced?| 407 |initiallyReduce| 418 |infRittWu?| 424
              |iexactQuo| 430 |headRemainder| 436 |headReduced?| 442
              |headReduce| 453 |hashUpdate!| 459 |hash| 465 |first| 470 |find|
              475 |extendIfCan| 481 |extend| 487 |every?| 517 |eval| 523 |eq?|
              549 |empty?| 555 |empty| 560 |degree| 564 |count| 569 |copy| 581
              |convert| 586 |construct| 591 |collectUpper| 596 |collectUnder|
              602 |collectQuasiMonic| 608 |collect| 613 |coerce| 619 |coHeight|
              629 |basicSet| 634 |autoReduced?| 647 |augment| 653 |any?| 677
              |algebraicVariables| 683 |algebraicCoefficients?| 688
              |algebraic?| 694 = 700 |#| 706)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 2))
                 (CONS
                  '#(|RegularTriangularSetCategory&| |TriangularSetCategory&|
                     |PolynomialSetCategory&| |Collection&|
                     |HomogeneousAggregate&| |SetCategory&| |Aggregate&|
                     |Evalable&| |BasicType&| NIL NIL |RetractableFrom&| NIL
                     NIL NIL |InnerEvalable&| NIL)
                  (CONS
                   '#((|RegularTriangularSetCategory| 6
                                                      (|IndexedExponents|
                                                       (|OrderedVariableList|
                                                        7))
                                                      (|OrderedVariableList| 7)
                                                      (|NewSparseMultivariatePolynomial|
                                                       6
                                                       (|OrderedVariableList|
                                                        7)))
                      (|TriangularSetCategory| 6
                                               (|IndexedExponents|
                                                (|OrderedVariableList| 7))
                                               (|OrderedVariableList| 7)
                                               (|NewSparseMultivariatePolynomial|
                                                6 (|OrderedVariableList| 7)))
                      (|PolynomialSetCategory| 6
                                               (|IndexedExponents|
                                                (|OrderedVariableList| 7))
                                               (|OrderedVariableList| 7)
                                               (|NewSparseMultivariatePolynomial|
                                                6 (|OrderedVariableList| 7)))
                      (|Collection|
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7)))
                      (|HomogeneousAggregate|
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7)))
                      (|SetCategory|) (|Aggregate|)
                      (|Evalable|
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7)))
                      (|BasicType|) (|shallowlyMutable|) (|finiteAggregate|)
                      (|RetractableFrom|
                       (|List|
                        (|NewSparseMultivariatePolynomial| 6
                                                           (|OrderedVariableList|
                                                            7))))
                      (|CoercibleTo|
                       (|List|
                        (|NewSparseMultivariatePolynomial| 6
                                                           (|OrderedVariableList|
                                                            7))))
                      (|Type|) (|CoercibleTo| 41)
                      (|InnerEvalable|
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7))
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7)))
                      (|ConvertibleTo| 15))
                   (|makeByteWordVec2| 42
                                       '(2 0 12 0 0 1 1 0 32 10 1 3 0 20 10 12
                                         12 1 2 0 20 10 12 1 1 0 20 10 1 1 0 30
                                         0 1 1 0 12 0 1 1 4 12 0 1 1 0 12 0 1 2
                                         0 12 11 0 1 2 0 11 11 0 1 2 0 22 11 0
                                         1 2 0 38 0 29 1 2 0 12 0 13 1 2 7 0 16
                                         0 1 2 0 28 0 29 1 0 0 0 1 1 4 12 0 1 2
                                         4 12 0 0 1 2 4 12 0 0 1 1 4 12 0 1 4 0
                                         10 10 0 14 33 1 2 4 10 10 0 1 2 4 10
                                         10 0 1 1 0 27 10 1 1 0 0 10 1 1 0 27 0
                                         1 2 0 11 11 0 1 1 8 0 0 1 2 8 0 11 0 1
                                         2 7 0 16 0 1 2 4 19 11 0 1 3 0 12 11 0
                                         33 1 2 0 11 11 0 1 4 8 11 14 0 11 11 1
                                         3 7 11 14 0 11 1 2 7 11 14 0 1 4 0 11
                                         11 0 14 33 1 1 0 35 0 1 2 0 12 11 0 1
                                         2 0 12 11 0 1 1 0 12 0 1 2 0 12 11 0 1
                                         1 7 10 0 1 1 0 12 0 1 2 0 12 11 0 1 1
                                         0 29 0 1 2 0 12 0 13 1 1 7 10 0 1 2 8
                                         12 11 0 1 2 6 0 17 0 1 2 0 0 17 0 1 1
                                         0 30 0 1 2 0 12 29 0 1 2 0 12 0 13 1 1
                                         0 40 0 1 3 0 23 11 11 0 1 3 0 22 11 11
                                         0 1 1 0 28 0 1 2 0 20 11 0 1 2 0 24 11
                                         0 1 2 0 12 11 0 1 2 0 26 11 0 1 2 0 20
                                         11 20 1 2 0 20 10 0 1 2 0 20 10 20 1 2
                                         0 20 11 0 1 2 0 0 10 0 1 2 0 0 11 0 1
                                         1 0 10 0 1 1 0 12 0 1 2 0 12 11 0 1 2
                                         0 11 11 0 1 2 0 12 0 0 1 2 4 6 6 6 1 2
                                         4 18 11 0 1 1 0 12 0 1 2 0 12 11 0 1 2
                                         0 11 11 0 1 2 0 39 39 0 1 1 0 42 0 1 1
                                         0 28 0 1 2 0 28 16 0 1 2 0 27 0 11 1 2
                                         0 20 10 20 1 2 0 20 11 20 1 2 0 20 10
                                         0 1 2 0 20 11 0 1 2 0 0 0 11 1 2 7 12
                                         16 0 1 2 1 0 0 8 1 2 1 0 0 9 1 3 1 0 0
                                         10 10 1 3 1 0 0 11 11 1 2 0 12 0 0 1 1
                                         0 12 0 1 0 0 0 1 1 0 13 0 1 2 8 13 11
                                         0 1 2 7 13 16 0 1 1 0 0 0 1 1 2 15 0 1
                                         1 0 0 10 1 2 0 0 0 29 1 2 0 0 0 29 1 1
                                         0 0 0 1 2 0 0 0 29 1 1 0 10 0 1 1 0 41
                                         0 1 1 5 13 0 1 2 0 37 10 33 1 3 0 37
                                         10 16 33 1 2 0 12 0 34 1 2 0 20 10 20
                                         1 2 0 20 11 20 1 2 0 20 10 0 1 2 0 20
                                         11 0 1 2 7 12 16 0 1 1 0 30 0 1 2 0 12
                                         11 0 1 2 0 12 29 0 1 2 0 12 0 0 1 1 7
                                         13 0 1)))))
           '|lookupComplete|)) 
