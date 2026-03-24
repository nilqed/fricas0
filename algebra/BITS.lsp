
(SDEFUN |BITS;bits;NniB%;1|
        ((|n| (|NonNegativeInteger|)) (|b| (|Boolean|)) (% (%)))
        (SPADCALL |n| |b| (QREFELT % 8))) 

(DECLAIM (NOTINLINE |Bits;|)) 

(DEFUN |Bits;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL) (#1=#:G6 NIL))
         (PROGN
          (LETT |dv$| '(|Bits|))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| (|Boolean|)
                                                              '(|Evalable|
                                                                (|Boolean|)))
                                               (|HasCategory| (|Boolean|)
                                                              '(|SetCategory|)))
                                              (|HasCategory| (|Boolean|)
                                                             '(|Hashable|))
                                              (|HasCategory| (|Boolean|)
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| (|Boolean|)
                                                             '(|OrderedSet|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedSet|))
                                              (|HasCategory| (|Boolean|)
                                                             '(|BasicType|))))))
          (|haddProp| |$ConstructorCache| '|Bits| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 64))
          (AND (LETT #1# (|HasCategory| % '(|finiteAggregate|)))
               (|augmentPredVector| % 128))
          (AND #1# (|HasCategory| (|Boolean|) '(|Hashable|))
               (|augmentPredVector| % 256))
          (AND #1# (|HasCategory| % '(|shallowlyMutable|))
               (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| % 512))
          (AND #1# (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 1024))
          (AND #1# (|HasCategory| (|Boolean|) '(|BasicType|))
               (|augmentPredVector| % 2048))
          (AND #1# (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| % 4096))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |Bits| ()
  (SPROG NIL
         (PROG (#1=#:G8)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Bits|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Bits|
                             (LIST (CONS NIL (CONS 1 (|Bits;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Bits|)))))))))) 

(MAKEPROP '|Bits| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedBits| (NRTEVAL 1))
              (|NonNegativeInteger|) (|Boolean|) (0 . |new|)
              |BITS;bits;NniB%;1| (|String|) (|OutputForm|) (|Integer|)
              (|UniversalSegment| 12) (|Mapping| 7 7 7) (|List| %)
              (|Union| 7 '"failed") (|Mapping| 7 7) (|List| 7) (|List| 12)
              (|HashState|) (|SingleInteger|) (|Equation| 7) (|List| 22)
              (|Void|) (|InputForm|))
           '#(~= 6 ~ 12 |xor| 17 |true| 23 |trim| 27 |swap!| 33 |sorted?| 40
              |sort!| 51 |sort| 62 |smaller?| 73 |size?| 79 |setelt!| 85
              |select| 99 |sample| 105 |rightTrim| 109 |reverse!| 115 |reverse|
              120 |removeDuplicates| 125 |remove| 130 |reduce| 142 |qsetelt!|
              163 |qelt| 170 |position| 176 |parts| 195 |or| 200 |not| 206
              |nor| 211 |new| 217 |nand| 223 |more?| 229 |minIndex| 235 |min|
              240 |merge| 251 |members| 264 |member?| 269 |maxIndex| 275 |max|
              280 |map!| 297 |map| 303 |less?| 316 |leftTrim| 322 |latex| 328
              |insert| 333 |indices| 347 |index?| 352 |hashUpdate!| 358 |hash|
              364 |first| 369 |find| 380 |fill!| 386 |false| 392 |every?| 396
              |eval| 402 |eq?| 428 |entry?| 434 |entries| 440 |empty?| 445
              |empty| 450 |elt| 454 |delete| 473 |count| 485 |copyInto!| 497
              |copy| 504 |convert| 509 |construct| 514 |concat| 519 |coerce|
              542 |bits| 547 |any?| 553 |and| 559 |_\|_| 565 |\\/| 569 T$ 575
              >= 579 > 585 = 591 <= 597 < 603 |/\\| 609 |#| 615)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 0 0 0
                                  3 1 0 0 0 0 0 0 0 0))
            (CONS
             '#(|BitAggregate&| |Logic&| |OneDimensionalArrayAggregate&| NIL
                NIL NIL NIL |LinearAggregate&| NIL NIL NIL |IndexedAggregate&|
                |Collection&| |OrderedSet&| NIL NIL |HomogeneousAggregate&| NIL
                |Hashable&| |Evalable&| |SetCategory&| |Aggregate&|
                |EltableAggregate&| NIL |InnerEvalable&| NIL |PartialOrder&|
                |BasicType&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|BitAggregate|) (|Logic|) (|OneDimensionalArrayAggregate| 7)
                 (|BoundedDistributiveLattice|) (|FiniteLinearAggregate| 7)
                 (|BoundedLattice|) (|DistributiveLattice|)
                 (|LinearAggregate| 7) (|BoundedMeetSemilattice|)
                 (|BoundedJoinSemilattice|) (|Lattice|)
                 (|IndexedAggregate| 12 7) (|Collection| 7) (|OrderedSet|)
                 (|MeetSemilattice|) (|JoinSemilattice|)
                 (|HomogeneousAggregate| 7) (|Comparable|) (|Hashable|)
                 (|Evalable| 7) (|SetCategory|) (|Aggregate|)
                 (|EltableAggregate| 12 7) (|ConvertibleTo| 25)
                 (|InnerEvalable| 7 7) (|CoercibleTo| 11) (|PartialOrder|)
                 (|BasicType|) (|Type|) (|Eltable| 12 7) (|Eltable| 13 $$)
                 (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| 25
                                  '(2 0 0 6 7 8 2 0 7 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 0 0 0 1 2 12 0 0 7 1 3 7 24 0 12 12 1 1
                                    13 7 0 1 2 8 7 14 0 1 2 11 0 14 0 1 1 10 0
                                    0 1 1 13 0 0 1 2 8 0 14 0 1 2 0 7 0 0 1 2 0
                                    7 0 6 1 3 7 7 0 13 7 1 3 7 7 0 12 7 1 2 8 0
                                    17 0 1 0 0 0 1 2 12 0 0 7 1 1 11 0 0 1 1 8
                                    0 0 1 1 12 0 0 1 2 12 0 7 0 1 2 8 0 17 0 1
                                    4 12 7 14 0 7 7 1 2 8 7 14 0 1 3 8 7 14 0 7
                                    1 3 7 7 0 12 7 1 2 0 7 0 12 1 3 12 12 7 0
                                    12 1 2 12 12 7 0 1 2 8 12 17 0 1 1 8 18 0 1
                                    2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 6 7
                                    8 2 0 0 0 0 1 2 0 7 0 6 1 1 5 12 0 1 2 0 0
                                    0 0 1 1 13 7 0 1 2 13 0 0 0 1 3 8 0 14 0 0
                                    1 1 8 18 0 1 2 12 7 7 0 1 1 5 12 0 1 2 0 0
                                    0 0 1 1 13 7 0 1 2 8 7 14 0 1 2 7 0 17 0 1
                                    3 0 0 14 0 0 1 2 0 0 17 0 1 2 0 7 0 6 1 2
                                    12 0 0 7 1 1 0 10 0 1 3 0 0 0 0 12 1 3 0 0
                                    7 0 12 1 1 0 19 0 1 2 0 7 12 0 1 2 9 20 20
                                    0 1 1 9 21 0 1 2 0 0 0 6 1 1 5 7 0 1 2 0 16
                                    17 0 1 2 7 0 0 7 1 0 0 0 1 2 8 7 17 0 1 3 1
                                    0 0 7 7 1 3 1 0 0 18 18 1 2 1 0 0 22 1 2 1
                                    0 0 23 1 2 0 7 0 0 1 2 12 7 7 0 1 1 0 18 0
                                    1 1 0 7 0 1 0 0 0 1 2 0 0 0 13 1 3 0 7 0 12
                                    7 1 2 0 7 0 12 1 2 0 0 0 13 1 2 0 0 0 12 1
                                    2 12 6 7 0 1 2 8 6 17 0 1 3 11 0 0 0 12 1 1
                                    0 0 0 1 1 3 25 0 1 1 0 0 18 1 2 0 0 0 0 1 1
                                    0 0 15 1 2 0 0 7 0 1 2 0 0 0 7 1 1 0 11 0 1
                                    2 0 0 6 7 9 2 8 7 17 0 1 2 0 0 0 0 1 0 0 0
                                    1 2 0 0 0 0 1 0 0 0 1 2 0 7 0 0 1 2 0 7 0 0
                                    1 2 0 7 0 0 1 2 0 7 0 0 1 2 0 7 0 0 1 2 0 0
                                    0 0 1 1 8 6 0 1)))))
           '|lookupComplete|)) 
