
(DECLAIM (NOTINLINE |RegularChain;|)) 

(DEFUN |RegularChain;| (|#1| |#2|)
  (SPROG ((#1=#:G31 NIL) (|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 |#2|)
          (LETT |dv$| (LIST '|RegularChain| DV$1 DV$2))
          (LETT % (GETREFV 41))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory|
                                                (|NewSparseMultivariatePolynomial|
                                                 |#1|
                                                 (|OrderedVariableList| |#2|))
                                                (LIST '|Evalable|
                                                      (LIST
                                                       '|NewSparseMultivariatePolynomial|
                                                       (|devaluate| |#1|)
                                                       (LIST
                                                        '|OrderedVariableList|
                                                        (|devaluate| |#2|)))))
                                               (|HasCategory|
                                                (|NewSparseMultivariatePolynomial|
                                                 |#1|
                                                 (|OrderedVariableList| |#2|))
                                                '(|SetCategory|)))
                                              (|HasCategory|
                                               (|NewSparseMultivariatePolynomial|
                                                |#1|
                                                (|OrderedVariableList| |#2|))
                                               '(|ConvertibleTo|
                                                 (|InputForm|)))
                                              (|HasCategory|
                                               (|NewSparseMultivariatePolynomial|
                                                |#1|
                                                (|OrderedVariableList| |#2|))
                                               '(|BasicType|))
                                              (|HasCategory|
                                               (|NewSparseMultivariatePolynomial|
                                                |#1|
                                                (|OrderedVariableList| |#2|))
                                               '(|OrderedSet|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory|
                                               (|OrderedVariableList| |#2|)
                                               '(|Finite|))))))
          (|haddProp| |$ConstructorCache| '|RegularChain| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (AND (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 64))
          (AND (LETT #1# (|HasCategory| % '(|finiteAggregate|)))
               (|augmentPredVector| % 128))
          (AND #1#
               (|HasCategory|
                (|NewSparseMultivariatePolynomial| |#1|
                                                   (|OrderedVariableList|
                                                    |#2|))
                '(|BasicType|))
               (|augmentPredVector| % 256))
          (AND #1#
               (|HasCategory|
                (|NewSparseMultivariatePolynomial| |#1|
                                                   (|OrderedVariableList|
                                                    |#2|))
                '(|OrderedSet|))
               (|augmentPredVector| % 512))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |RegularChain| (&REST #1=#:G32)
  (SPROG NIL
         (PROG (#2=#:G33)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|RegularChain|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RegularChain;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|RegularChain|)))))))))) 

(MAKEPROP '|RegularChain| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|RegularTriangularSet| 6 (|IndexedExponents| 17) 17 23)
              (|local| |#1|) (|local| |#2|) (|Boolean|) (|String|)
              (|OutputForm|) (|List| 23) (|Union| 23 '"failed")
              (|Mapping| 8 23) (|Mapping| 23 23) (|NonNegativeInteger|)
              (|Union| % '"failed")
              (|OrderedVariableList| (NRTEVAL (QREFELT % 7))) (|List| 17)
              (|Record| (|:| |under| %) (|:| |floor| %) (|:| |upper| %))
              (|Record| (|:| |bas| %) (|:| |top| 11)) (|Union| 20 '"failed")
              (|Mapping| 8 23 23) (|NewSparseMultivariatePolynomial| 6 17)
              (|Record| (|:| |close| 11) (|:| |open| 11)) (|Mapping| 8 23 11)
              (|Mapping| 23 23 23) (|List| %)
              (|Record| (|:| |close| %) (|:| |open| 11)) (|List| 28)
              (|Record| (|:| |val| 8) (|:| |tower| %)) (|List| 30)
              (|Union| 8 27) (|Record| (|:| |val| 23) (|:| |tower| %))
              (|List| 33) (|Union| 23 27) (|List| 37) (|Equation| 23)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 23) (|:| |den| 6))
              (|Record| (|:| |num| 23) (|:| |den| 6)) (|InputForm|))
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
              |parts| 251 |normalized?| 256 |mvar| 267 |more?| 272 |min| 278
              |members| 283 |member?| 288 |max| 294 |map!| 305 |map| 311
              |mainVariables| 317 |mainVariable?| 322 |less?| 328 |latex| 334
              |lastSubResultantElseSplit| 339 |lastSubResultant| 346 |last| 353
              |invertibleSet| 358 |invertibleElseSplit?| 364 |invertible?| 370
              |intersect| 382 |internalAugment| 406 |initials| 418
              |initiallyReduced?| 423 |initiallyReduce| 434 |infRittWu?| 440
              |iexactQuo| 446 |headRemainder| 452 |headReduced?| 458
              |headReduce| 469 |first| 475 |find| 480 |extendIfCan| 486
              |extend| 492 |every?| 522 |eval| 528 |eq?| 554 |empty?| 560
              |empty| 565 |degree| 569 |count| 574 |copy| 586 |convert| 591
              |construct| 596 |collectUpper| 601 |collectUnder| 607
              |collectQuasiMonic| 613 |collect| 618 |coerce| 624 |coHeight| 634
              |basicSet| 639 |autoReduced?| 652 |augment| 658 |any?| 682
              |algebraicVariables| 688 |algebraicCoefficients?| 693
              |algebraic?| 699 = 705 |#| 711)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 1 0 0 0 2 1 0 0 0 0 0 0))
                 (CONS
                  '#(|RegularTriangularSetCategory&| |TriangularSetCategory&|
                     |PolynomialSetCategory&| |Collection&|
                     |HomogeneousAggregate&| |Evalable&| |Aggregate&|
                     |RetractableFrom&| |SetCategory&| NIL |InnerEvalable&| NIL
                     NIL NIL NIL NIL |BasicType&|)
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
                      (|Evalable|
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7)))
                      (|Aggregate|)
                      (|RetractableFrom|
                       (|List|
                        (|NewSparseMultivariatePolynomial| 6
                                                           (|OrderedVariableList|
                                                            7))))
                      (|SetCategory|) (|ConvertibleTo| 40)
                      (|InnerEvalable|
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7))
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7)))
                      (|CoercibleTo| 10) (|Type|)
                      (|CoercibleTo|
                       (|List|
                        (|NewSparseMultivariatePolynomial| 6
                                                           (|OrderedVariableList|
                                                            7))))
                      (|finiteAggregate|) (|shallowlyMutable|) (|BasicType|))
                   (|makeByteWordVec2| 40
                                       '(2 0 8 0 0 1 1 0 29 11 1 1 0 27 11 1 2
                                         0 27 11 8 1 3 0 27 11 8 8 1 1 0 18 0 1
                                         1 0 8 0 1 1 5 8 0 1 2 0 8 23 0 1 1 0 8
                                         0 1 2 0 23 23 0 1 2 0 34 23 0 1 2 0 19
                                         0 17 1 2 0 8 0 15 1 2 0 12 0 17 1 2 8
                                         0 13 0 1 0 0 0 1 1 5 8 0 1 2 5 8 0 0 1
                                         2 5 8 0 0 1 1 5 8 0 1 4 0 11 11 0 26
                                         22 1 2 5 11 11 0 1 2 5 11 11 0 1 1 0
                                         16 11 1 1 0 0 11 1 1 0 16 0 1 2 0 23
                                         23 0 1 1 9 0 0 1 2 9 0 23 0 1 2 8 0 13
                                         0 1 2 5 38 23 0 1 3 0 8 23 0 22 1 2 0
                                         23 23 0 1 4 0 23 23 0 26 22 1 4 9 23
                                         26 0 23 23 1 2 8 23 26 0 1 3 8 23 26 0
                                         23 1 1 0 24 0 1 2 0 8 23 0 1 2 0 8 23
                                         0 1 2 0 8 23 0 1 1 0 8 0 1 1 8 11 0 1
                                         2 0 8 23 0 1 1 0 8 0 1 1 0 17 0 1 2 0
                                         8 0 15 1 1 10 23 0 1 1 8 11 0 1 2 9 8
                                         23 0 1 1 10 23 0 1 2 8 23 22 0 1 2 7 0
                                         14 0 1 2 0 0 14 0 1 1 0 18 0 1 2 0 8
                                         17 0 1 2 0 8 0 15 1 1 0 9 0 1 3 0 35
                                         23 23 0 1 3 0 34 23 23 0 1 1 0 12 0 1
                                         2 0 27 23 0 1 2 0 32 23 0 1 2 0 31 23
                                         0 1 2 0 8 23 0 1 2 0 27 23 0 1 2 0 27
                                         11 27 1 2 0 27 11 0 1 2 0 27 23 27 1 2
                                         0 0 23 0 1 2 0 0 11 0 1 1 0 11 0 1 2 0
                                         8 23 0 1 1 0 8 0 1 2 0 23 23 0 1 2 0 8
                                         0 0 1 2 5 6 6 6 1 2 5 39 23 0 1 2 0 8
                                         23 0 1 1 0 8 0 1 2 0 23 23 0 1 1 0 12
                                         0 1 2 0 12 13 0 1 2 0 16 0 23 1 2 0 0
                                         0 23 1 2 0 27 23 0 1 2 0 27 11 0 1 2 0
                                         27 23 27 1 2 0 27 11 27 1 2 8 8 13 0 1
                                         3 1 0 0 23 23 1 3 1 0 0 11 11 1 2 1 0
                                         0 36 1 2 1 0 0 37 1 2 0 8 0 0 1 1 0 8
                                         0 1 0 0 0 1 1 0 15 0 1 2 9 15 23 0 1 2
                                         8 15 13 0 1 1 0 0 0 1 1 2 40 0 1 1 0 0
                                         11 1 2 0 0 0 17 1 2 0 0 0 17 1 1 0 0 0
                                         1 2 0 0 0 17 1 1 0 10 0 1 1 0 11 0 1 1
                                         6 15 0 1 3 0 21 11 13 22 1 2 0 21 11
                                         22 1 2 0 8 0 25 1 2 0 27 23 0 1 2 0 27
                                         11 0 1 2 0 27 23 27 1 2 0 27 11 27 1 2
                                         8 8 13 0 1 1 0 18 0 1 2 0 8 23 0 1 2 0
                                         8 17 0 1 2 0 8 0 0 1 1 8 15 0 1)))))
           '|lookupComplete|)) 
