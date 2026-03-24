
(SDEFUN |ILIST;minIndex;%I;1| ((|x| (%)) (% (|Integer|))) (QREFELT % 7)) 

(SDEFUN |ILIST;maxIndex;%I;2| ((|x| (%)) (% (|Integer|)))
        (- (+ (QREFELT % 7) (SPADCALL |x| (QREFELT % 11))) 1)) 

(DECLAIM (NOTINLINE |IndexedList;|)) 

(DEFUN |IndexedList;| (|#1| |#2|)
  (SPROG
   ((#1=#:G12 NIL) (#2=#:G13 NIL) (#3=#:G15 NIL) (#4=#:G14 NIL) (|pv$| NIL)
    (#5=#:G9 NIL) (#6=#:G10 NIL) (#7=#:G11 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT |dv$| (LIST '|IndexedList| DV$1 DV$2))
    (LETT % (GETREFV 34))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #6#)
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #7#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #5# #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|IndexedList| (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (LETT #4# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 8192))
    (AND (|HasCategory| |#1| '(|Hashable|)) #4# (|augmentPredVector| % 16384))
    (AND
     (LETT #3#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 32768))
    (AND (OR #5# (AND #7# #4#) #3#) (|augmentPredVector| % 65536))
    (AND (OR (AND #7# #4#) #3# #6#) (|augmentPredVector| % 131072))
    (AND (OR (AND #7# #4#) #3#) (|augmentPredVector| % 262144))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 524288))
    (AND
     (OR #2# (AND #7# #4#) (AND (|HasCategory| |#1| '(|Hashable|)) #4#) #3#
         #6#)
     (|augmentPredVector| % 1048576))
    (AND (LETT #1# (|HasCategory| % '(|shallowlyMutable|)))
         (|augmentPredVector| % 2097152))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #4# #1#
         (|augmentPredVector| % 4194304))
    (AND #4# #1# (|augmentPredVector| % 8388608))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |IndexedList| (&REST #1=#:G16)
  (SPROG NIL
         (PROG (#2=#:G17)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedList|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedList;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedList|)))))))))) 

(MAKEPROP '|IndexedList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 6) (|local| |#1|) (|local| |#2|)
              (|Integer|) |ILIST;minIndex;%I;1| (|NonNegativeInteger|)
              (0 . |#|) |ILIST;maxIndex;%I;2| (|Boolean|) (|Mapping| 6 6)
              (|List| %) '"value" '"first" '"rest" '"last"
              (|UniversalSegment| 8) (|Mapping| 6 6 6) (|Union| 6 '"failed")
              (|Mapping| 13 6) (|List| 8) (|Mapping| 13 6 6) (|HashState|)
              (|SingleInteger|) (|Equation| 6) (|List| 28) (|OutputForm|)
              (|String|) (|Void|) (|InputForm|))
           '#(~= 5 |value| 11 |trim| 16 |third| 22 |tail| 27 |swap!| 32
              |split!| 39 |sorted?| 45 |sort!| 56 |sort| 67 |smaller?| 78
              |size?| 84 |setvalue!| 90 |setrest!| 96 |setlast!| 102
              |setfirst!| 108 |setelt!| 114 |setchildren!| 156 |select!| 162
              |select| 168 |second| 174 |sample| 179 |rightTrim| 183 |reverse!|
              189 |reverse| 194 |rest| 199 |removeDuplicates!| 210
              |removeDuplicates| 215 |remove!| 220 |remove| 232 |reduce| 244
              |qsetrest!| 265 |qsetfirst!| 271 |qsetelt!| 277 |qelt| 284
              |possiblyInfinite?| 290 |position| 295 |parts| 314 |nodes| 319
              |node?| 324 |new| 330 |more?| 336 |minIndex| 342 |min| 347
              |merge!| 358 |merge| 371 |members| 384 |member?| 389 |maxIndex|
              395 |max| 400 |map!| 417 |map| 423 |list| 436 |less?| 441
              |leftTrim| 447 |leaves| 453 |leaf?| 458 |latex| 463 |last| 468
              |insert!| 479 |insert| 493 |indices| 507 |index?| 512
              |hashUpdate!| 518 |hash| 524 |first| 529 |find| 540 |fill!| 546
              |explicitlyFinite?| 552 |every?| 557 |eval| 563 |eq?| 589
              |entry?| 595 |entries| 601 |empty?| 606 |empty| 611 |elt| 615
              |distance| 658 |delete!| 664 |delete| 676 |cyclic?| 688
              |cycleTail| 693 |cycleSplit!| 698 |cycleLength| 703 |cycleEntry|
              708 |count| 713 |copyInto!| 725 |copy| 732 |convert| 737
              |construct| 742 |concat!| 747 |concat| 764 |coerce| 787
              |children| 792 |child?| 797 |any?| 803 >= 809 > 815 = 821 <= 827
              < 833 |#| 839)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 1 0 0 0 6 0 2 9 8 0 0 3 10 1 12 8
                                  0 0 0 0 0))
            (CONS
             '#(|ListAggregate&| NIL |ExtensibleLinearAggregate&|
                |StreamAggregate&| |LinearAggregate&|
                |UnaryRecursiveAggregate&| |OrderedSet&| |Collection&|
                |IndexedAggregate&| |RecursiveAggregate&| NIL
                |HomogeneousAggregate&| |Hashable&| |SetCategory&| |Evalable&|
                |EltableAggregate&| |Aggregate&| NIL |BasicType&|
                |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|ListAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|StreamAggregate| 6)
                 (|LinearAggregate| 6) (|UnaryRecursiveAggregate| 6)
                 (|OrderedSet|) (|Collection| 6) (|IndexedAggregate| 8 6)
                 (|RecursiveAggregate| 6) (|Comparable|)
                 (|HomogeneousAggregate| 6) (|Hashable|) (|SetCategory|)
                 (|Evalable| 6) (|EltableAggregate| 8 6) (|Aggregate|)
                 (|ConvertibleTo| 33) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 30) (|InnerEvalable| 6 6) (|Eltable| 8 6)
                 (|Type|) (|Eltable| 20 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| 33
                                  '(1 0 10 0 11 2 21 13 0 0 1 1 0 6 0 1 2 20 0
                                    0 6 1 1 0 6 0 1 1 0 0 0 1 3 22 32 0 8 8 1 2
                                    22 0 0 10 1 1 16 13 0 1 2 14 13 25 0 1 2 24
                                    0 25 0 1 1 23 0 0 1 1 16 0 0 1 2 14 0 25 0
                                    1 2 19 13 0 0 1 2 0 13 0 10 1 2 22 6 0 6 1
                                    2 22 0 0 0 1 2 22 6 0 6 1 2 22 6 0 6 1 3 22
                                    6 0 16 6 1 3 22 6 0 17 6 1 3 22 0 0 18 0 1
                                    3 22 6 0 19 6 1 3 22 6 0 20 6 1 3 22 6 0 8
                                    6 1 2 22 0 0 15 1 2 0 0 23 0 1 2 14 0 23 0
                                    1 1 0 6 0 1 0 0 0 1 2 20 0 0 6 1 1 24 0 0 1
                                    1 14 0 0 1 1 0 0 0 1 2 0 0 0 10 1 1 4 0 0 1
                                    1 20 0 0 1 2 0 0 23 0 1 2 4 0 6 0 1 2 20 0
                                    6 0 1 2 14 0 23 0 1 4 20 6 21 0 6 6 1 3 14
                                    6 21 0 6 1 2 14 6 21 0 1 2 22 0 0 0 1 2 22
                                    6 0 6 1 3 22 6 0 8 6 1 2 0 6 0 8 1 1 0 13 0
                                    1 3 20 8 6 0 8 1 2 20 8 6 0 1 2 14 8 23 0 1
                                    1 14 5 0 1 1 0 15 0 1 2 4 13 0 0 1 2 0 0 10
                                    6 1 2 0 13 0 10 1 1 13 8 0 9 1 16 6 0 1 2
                                    16 0 0 0 1 3 0 0 25 0 0 1 2 1 0 0 0 1 2 16
                                    0 0 0 1 3 14 0 25 0 0 1 1 14 5 0 1 2 20 13
                                    6 0 1 1 13 8 0 12 1 16 6 0 1 2 16 0 0 0 1 2
                                    14 6 25 0 1 2 22 0 14 0 1 2 0 0 14 0 1 3 0
                                    0 21 0 0 1 1 0 0 6 1 2 0 13 0 10 1 2 20 0 0
                                    6 1 1 0 5 0 1 1 0 13 0 1 1 18 31 0 1 1 0 6
                                    0 1 2 0 0 0 10 1 3 0 0 0 0 8 1 3 0 0 6 0 8
                                    1 3 0 0 6 0 8 1 3 0 0 0 0 8 1 1 0 24 0 1 2
                                    0 13 8 0 1 2 15 26 26 0 1 1 15 27 0 1 1 0 6
                                    0 1 2 0 0 0 10 1 2 0 22 23 0 1 2 22 0 0 6 1
                                    1 0 13 0 1 2 14 13 23 0 1 2 8 0 0 28 1 2 8
                                    0 0 29 1 3 8 0 0 5 5 1 3 8 0 0 6 6 1 2 0 13
                                    0 0 1 2 20 13 6 0 1 1 0 5 0 1 1 0 13 0 1 0
                                    0 0 1 2 0 6 0 16 1 2 0 6 0 17 1 2 0 0 0 18
                                    1 2 0 6 0 19 1 2 0 0 0 20 1 3 0 6 0 8 6 1 2
                                    0 6 0 8 1 2 0 8 0 0 1 2 0 0 0 20 1 2 0 0 0
                                    8 1 2 0 0 0 8 1 2 0 0 0 20 1 1 0 13 0 1 1 0
                                    0 0 1 1 22 0 0 1 1 0 10 0 1 1 0 0 0 1 2 20
                                    10 6 0 1 2 14 10 23 0 1 3 24 0 0 0 8 1 1 0
                                    0 0 1 1 3 33 0 1 1 0 0 5 1 2 0 0 0 0 1 2 0
                                    0 0 6 1 1 22 0 15 1 2 0 0 0 0 1 2 0 0 6 0 1
                                    2 0 0 0 6 1 1 0 0 15 1 1 17 30 0 1 1 0 15 0
                                    1 2 4 13 0 0 1 2 14 13 23 0 1 2 16 13 0 0 1
                                    2 16 13 0 0 1 2 21 13 0 0 1 2 16 13 0 0 1 2
                                    16 13 0 0 1 1 14 10 0 11)))))
           '|lookupComplete|)) 
