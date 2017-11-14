
(SDEFUN |BITS;bits;NniB$;1| ((|n| |NonNegativeInteger|) (|b| |Boolean|) ($ $))
        (SPADCALL |n| |b| (QREFELT $ 8))) 

(DECLAIM (NOTINLINE |Bits;|)) 

(DEFUN |Bits| ()
  (SPROG NIL
         (PROG (#1=#:G708)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Bits|) . #2=(|Bits|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Bits|
                             (LIST (CONS NIL (CONS 1 (|Bits;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Bits|)))))))))) 

(DEFUN |Bits;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL) (#1=#:G706 NIL))
         (PROGN
          (LETT |dv$| '(|Bits|) . #2=(|Bits|))
          (LETT $ (GETREFV 26) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
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
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| (|Boolean|)
                                                             '(|OrderedSet|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedSet|))
                                              (|HasCategory| (|Boolean|)
                                                             '(|BasicType|))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|Bits| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|shallowlyMutable|))
               (|augmentPredVector| $ 32))
          (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #2#)
               (|augmentPredVector| $ 64))
          (AND #1# (|HasCategory| $ '(|shallowlyMutable|))
               (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| $ 128))
          (AND #1# (|HasCategory| $ '(|shallowlyMutable|))
               (|augmentPredVector| $ 256))
          (AND #1# (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| $ 512))
          (AND #1# (|HasCategory| (|Boolean|) '(|BasicType|))
               (|augmentPredVector| $ 1024))
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|Bits| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedBits| (NRTEVAL 1))
              (|NonNegativeInteger|) (|Boolean|) (0 . |new|)
              |BITS;bits;NniB$;1| (|List| 11) (|Equation| 7) (|List| 7)
              (|Mapping| 7 7 7) (|Integer|) (|InputForm|) (|Mapping| 7 7)
              (|Void|) (|UniversalSegment| 14) (|List| 14)
              (|Union| 7 '"failed") (|List| $) (|HashState|) (|String|)
              (|OutputForm|) (|SingleInteger|))
           '#(~= 6 ~ 12 |xor| 17 |true| 23 |trim| 27 |swap!| 33 |sorted?| 40
              |sort!| 51 |sort| 62 |smaller?| 73 |size?| 79 |setelt!| 85
              |select| 99 |sample| 105 |rightTrim| 109 |reverse!| 115 |reverse|
              120 |removeDuplicates| 125 |remove| 130 |reduce| 142 |qsetelt!|
              163 |qelt| 170 |position| 176 |parts| 195 |or| 200 |not| 206
              |nor| 211 |new| 217 |nand| 223 |more?| 229 |minIndex| 235 |min|
              240 |merge| 246 |members| 259 |member?| 264 |maxIndex| 270 |max|
              275 |map!| 281 |map| 287 |less?| 300 |leftTrim| 306 |latex| 312
              |insert| 317 |indices| 331 |index?| 336 |hashUpdate!| 342 |hash|
              348 |first| 353 |find| 364 |fill!| 370 |false| 376 |every?| 380
              |eval| 386 |eq?| 412 |entry?| 418 |entries| 424 |empty?| 429
              |empty| 434 |elt| 438 |delete| 457 |count| 469 |copyInto!| 481
              |copy| 488 |convert| 493 |construct| 498 |concat| 503 |coerce|
              526 |bits| 531 |any?| 537 |and| 543 |_\|_| 549 |\\/| 553 T$ 559
              >= 563 > 569 = 575 <= 581 < 587 |/\\| 593 |#| 599)
           'NIL
           (CONS
            (|makeByteWordVec2| 2
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
                                  0 0 0 0 0 0 0 1 2))
            (CONS
             '#(|BitAggregate&| |OneDimensionalArrayAggregate&| |Logic&| NIL
                NIL |LinearAggregate&| NIL NIL |OrderedSet&| |Collection&|
                |IndexedAggregate&| NIL NIL NIL NIL |HomogeneousAggregate&| NIL
                NIL |EltableAggregate&| |Aggregate&| |SetCategory&| |Evalable&|
                NIL NIL NIL NIL NIL |BasicType&| |PartialOrder&| NIL
                |InnerEvalable&| NIL)
             (CONS
              '#((|BitAggregate|) (|OneDimensionalArrayAggregate| 7) (|Logic|)
                 (|FiniteLinearAggregate| 7) (|BoundedDistributiveLattice|)
                 (|LinearAggregate| 7) (|DistributiveLattice|)
                 (|BoundedLattice|) (|OrderedSet|) (|Collection| 7)
                 (|IndexedAggregate| 14 7) (|Lattice|)
                 (|BoundedJoinSemilattice|) (|BoundedMeetSemilattice|)
                 (|Comparable|) (|HomogeneousAggregate| 7) (|JoinSemilattice|)
                 (|MeetSemilattice|) (|EltableAggregate| 14 7) (|Aggregate|)
                 (|SetCategory|) (|Evalable| 7) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Eltable| 18 $$) (|Eltable| 14 7)
                 (|Type|) (|BasicType|) (|PartialOrder|) (|CoercibleTo| 24)
                 (|InnerEvalable| 7 7) (|ConvertibleTo| 15))
              (|makeByteWordVec2| 25
                                  '(2 0 0 6 7 8 2 0 7 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 0 0 0 1 2 11 0 0 7 1 3 6 17 0 14 14 1 1
                                    10 7 0 1 2 7 7 13 0 1 1 8 0 0 1 2 9 0 13 0
                                    1 1 10 0 0 1 2 7 0 13 0 1 2 0 7 0 0 1 2 0 7
                                    0 6 1 3 6 7 0 14 7 1 3 6 7 0 18 7 1 2 7 0
                                    16 0 1 0 0 0 1 2 11 0 0 7 1 1 9 0 0 1 1 7 0
                                    0 1 1 11 0 0 1 2 11 0 7 0 1 2 7 0 16 0 1 4
                                    11 7 13 0 7 7 1 2 7 7 13 0 1 3 7 7 13 0 7 1
                                    3 6 7 0 14 7 1 2 0 7 0 14 1 3 11 14 7 0 14
                                    1 2 11 14 7 0 1 2 7 14 16 0 1 1 7 12 0 1 2
                                    0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 6 7 8
                                    2 0 0 0 0 1 2 0 7 0 6 1 1 4 14 0 1 2 0 0 0
                                    0 1 2 10 0 0 0 1 3 7 0 13 0 0 1 1 7 12 0 1
                                    2 11 7 7 0 1 1 4 14 0 1 2 0 0 0 0 1 2 6 0
                                    16 0 1 2 0 0 16 0 1 3 0 0 13 0 0 1 2 0 7 0
                                    6 1 2 11 0 0 7 1 1 0 23 0 1 3 0 0 7 0 14 1
                                    3 0 0 0 0 14 1 1 0 19 0 1 2 0 7 14 0 1 2 0
                                    22 22 0 1 1 0 25 0 1 1 4 7 0 1 2 0 0 0 6 1
                                    2 0 20 16 0 1 2 6 0 0 7 1 0 0 0 1 2 7 7 16
                                    0 1 2 1 0 0 10 1 3 1 0 0 7 7 1 2 1 0 0 11 1
                                    3 1 0 0 12 12 1 2 0 7 0 0 1 2 11 7 7 0 1 1
                                    0 12 0 1 1 0 7 0 1 0 0 0 1 2 0 7 0 14 1 3 0
                                    7 0 14 7 1 2 0 0 0 18 1 2 0 0 0 18 1 2 0 0
                                    0 14 1 2 11 6 7 0 1 2 7 6 16 0 1 3 9 0 0 0
                                    14 1 1 0 0 0 1 1 2 15 0 1 1 0 0 12 1 2 0 0
                                    7 0 1 2 0 0 0 7 1 2 0 0 0 0 1 1 0 0 21 1 1
                                    0 24 0 1 2 0 0 6 7 9 2 7 7 16 0 1 2 0 0 0 0
                                    1 0 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 7 0 0 1 2
                                    0 7 0 0 1 2 0 7 0 0 1 2 0 7 0 0 1 2 0 7 0 0
                                    1 2 0 0 0 0 1 1 7 6 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Bits| 'NILADIC T) 
