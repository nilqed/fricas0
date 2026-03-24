
(SDEFUN |DLIST;elt;%unique%;1| ((|x| (%)) (T3 ("unique")) (% (%)))
        (SPADCALL |x| (QREFELT % 7))) 

(SDEFUN |DLIST;elt;%sort%;2| ((|x| (%)) (T4 ("sort")) (% (%)))
        (SPADCALL |x| (QREFELT % 10))) 

(SDEFUN |DLIST;elt;%countNni;3|
        ((|x| (%)) (T5 ("count")) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 14))) 

(PUT '|DLIST;coerce;L%;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DLIST;coerce;L%;4| ((|x| (|List| S)) (% (%))) |x|) 

(PUT '|DLIST;coerce;%L;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DLIST;coerce;%L;5| ((|x| (%)) (% (|List| S))) |x|) 

(SDEFUN |DLIST;coerce;%Of;6| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 18)) (QREFELT % 20))) 

(SDEFUN |DLIST;datalist;L%;7| ((|x| (|List| S)) (% (%)))
        (SPADCALL |x| (QREFELT % 17))) 

(DECLAIM (NOTINLINE |DataList;|)) 

(DEFUN |DataList;| (|#1|)
  (SPROG
   ((#1=#:G17 NIL) (#2=#:G18 NIL) (#3=#:G20 NIL) (#4=#:G19 NIL) (|pv$| NIL)
    (#5=#:G14 NIL) (#6=#:G15 NIL) (#7=#:G16 NIL) (% NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|DataList| DV$1))
    (LETT % (GETREFV 44))
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
    (|haddProp| |$ConstructorCache| '|DataList| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
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

(DEFUN |DataList| (#1=#:G21)
  (SPROG NIL
         (PROG (#2=#:G22)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|DataList|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|DataList;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|DataList|)))))))))) 

(MAKEPROP '|DataList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 6) (|local| |#1|)
              (0 . |removeDuplicates|) '"unique" |DLIST;elt;%unique%;1|
              (5 . |sort|) '"sort" |DLIST;elt;%sort%;2| (|NonNegativeInteger|)
              (10 . |#|) '"count" |DLIST;elt;%countNni;3| |DLIST;coerce;L%;4|
              |DLIST;coerce;%L;5| (|OutputForm|) (15 . |coerce|)
              |DLIST;coerce;%Of;6| |DLIST;datalist;L%;7| (|Boolean|)
              (|Mapping| 6 6) (|List| %) '"value" (|Integer|) '"first" '"rest"
              '"last" (|UniversalSegment| 27) (|Mapping| 6 6 6)
              (|Union| 6 '"failed") (|Mapping| 23 6) (|List| 27)
              (|Mapping| 23 6 6) (|SingleInteger|) (|HashState|) (|List| 40)
              (|Equation| 6) (|String|) (|Void|) (|InputForm|))
           '#(~= 20 |value| 26 |trim| 31 |third| 37 |tail| 42 |swap!| 47
              |split!| 54 |sorted?| 60 |sort!| 71 |sort| 82 |smaller?| 93
              |size?| 99 |setvalue!| 105 |setrest!| 111 |setlast!| 117
              |setfirst!| 123 |setelt!| 129 |setchildren!| 171 |select!| 177
              |select| 183 |second| 189 |sample| 194 |rightTrim| 198 |reverse!|
              204 |reverse| 209 |rest| 214 |removeDuplicates!| 225
              |removeDuplicates| 230 |remove!| 235 |remove| 247 |reduce| 259
              |qsetrest!| 280 |qsetfirst!| 286 |qsetelt!| 292 |qelt| 299
              |possiblyInfinite?| 305 |position| 310 |parts| 329 |nodes| 334
              |node?| 339 |new| 345 |more?| 351 |minIndex| 357 |min| 362
              |merge!| 373 |merge| 386 |members| 399 |member?| 404 |maxIndex|
              410 |max| 415 |map!| 432 |map| 438 |list| 451 |less?| 456
              |leftTrim| 462 |leaves| 468 |leaf?| 473 |latex| 478 |last| 483
              |insert!| 494 |insert| 508 |indices| 522 |index?| 527
              |hashUpdate!| 533 |hash| 539 |first| 544 |find| 555 |fill!| 561
              |explicitlyFinite?| 567 |every?| 572 |eval| 578 |eq?| 604
              |entry?| 610 |entries| 616 |empty?| 621 |empty| 626 |elt| 630
              |distance| 691 |delete!| 697 |delete| 709 |datalist| 721
              |cyclic?| 726 |cycleTail| 731 |cycleSplit!| 736 |cycleLength| 741
              |cycleEntry| 746 |count| 751 |copyInto!| 763 |copy| 770 |convert|
              775 |construct| 780 |concat!| 785 |concat| 802 |coerce| 825
              |children| 840 |child?| 845 |any?| 851 >= 857 > 863 = 869 <= 875
              < 881 |#| 887)
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
                 (|OrderedSet|) (|Collection| 6) (|IndexedAggregate| 27 6)
                 (|RecursiveAggregate| 6) (|Comparable|)
                 (|HomogeneousAggregate| 6) (|Hashable|) (|SetCategory|)
                 (|Evalable| 6) (|EltableAggregate| 27 6) (|Aggregate|)
                 (|ConvertibleTo| 43) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 19) (|InnerEvalable| 6 6) (|Eltable| 27 6)
                 (|Type|) (|Eltable| 31 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| 43
                                  '(1 0 0 0 7 1 0 0 0 10 1 0 13 0 14 1 5 19 0
                                    20 2 21 23 0 0 1 1 0 6 0 1 2 20 0 0 6 1 1 0
                                    6 0 1 1 0 0 0 1 3 22 42 0 27 27 1 2 22 0 0
                                    13 1 1 16 23 0 1 2 14 23 36 0 1 2 24 0 36 0
                                    1 1 23 0 0 1 1 16 0 0 10 2 14 0 36 0 1 2 19
                                    23 0 0 1 2 0 23 0 13 1 2 22 6 0 6 1 2 22 0
                                    0 0 1 2 22 6 0 6 1 2 22 6 0 6 1 3 22 6 0 26
                                    6 1 3 22 6 0 28 6 1 3 22 0 0 29 0 1 3 22 6
                                    0 30 6 1 3 22 6 0 31 6 1 3 22 6 0 27 6 1 2
                                    22 0 0 25 1 2 0 0 34 0 1 2 14 0 34 0 1 1 0
                                    6 0 1 0 0 0 1 2 20 0 0 6 1 1 24 0 0 1 1 14
                                    0 0 1 1 0 0 0 1 2 0 0 0 13 1 1 4 0 0 1 1 20
                                    0 0 7 2 0 0 34 0 1 2 4 0 6 0 1 2 20 0 6 0 1
                                    2 14 0 34 0 1 4 20 6 32 0 6 6 1 2 14 6 32 0
                                    1 3 14 6 32 0 6 1 2 22 0 0 0 1 2 22 6 0 6 1
                                    3 22 6 0 27 6 1 2 0 6 0 27 1 1 0 23 0 1 3
                                    20 27 6 0 27 1 2 20 27 6 0 1 2 14 27 34 0 1
                                    1 14 5 0 1 1 0 25 0 1 2 4 23 0 0 1 2 0 0 13
                                    6 1 2 0 23 0 13 1 1 13 27 0 1 1 16 6 0 1 2
                                    16 0 0 0 1 3 0 0 36 0 0 1 2 1 0 0 0 1 2 16
                                    0 0 0 1 3 14 0 36 0 0 1 1 14 5 0 1 2 20 23
                                    6 0 1 1 13 27 0 1 1 16 6 0 1 2 16 0 0 0 1 2
                                    14 6 36 0 1 2 22 0 24 0 1 2 0 0 24 0 1 3 0
                                    0 32 0 0 1 1 0 0 6 1 2 0 23 0 13 1 2 20 0 0
                                    6 1 1 0 5 0 1 1 0 23 0 1 1 18 41 0 1 1 0 6
                                    0 1 2 0 0 0 13 1 3 0 0 0 0 27 1 3 0 0 6 0
                                    27 1 3 0 0 6 0 27 1 3 0 0 0 0 27 1 1 0 35 0
                                    1 2 0 23 27 0 1 2 15 38 38 0 1 1 15 37 0 1
                                    1 0 6 0 1 2 0 0 0 13 1 2 0 33 34 0 1 2 22 0
                                    0 6 1 1 0 23 0 1 2 14 23 34 0 1 2 8 0 0 39
                                    1 3 8 0 0 6 6 1 2 8 0 0 40 1 3 8 0 0 5 5 1
                                    2 0 23 0 0 1 2 20 23 6 0 1 1 0 5 0 1 1 0 23
                                    0 1 0 0 0 1 2 0 6 0 26 1 2 0 6 0 28 1 2 0 0
                                    0 29 1 2 0 6 0 30 1 2 0 0 0 31 1 2 0 6 0 27
                                    1 3 0 6 0 27 6 1 2 0 0 0 8 9 2 0 13 0 15 16
                                    2 0 0 0 11 12 2 0 27 0 0 1 2 0 0 0 27 1 2 0
                                    0 0 31 1 2 0 0 0 27 1 2 0 0 0 31 1 1 0 0 5
                                    22 1 0 23 0 1 1 0 0 0 1 1 22 0 0 1 1 0 13 0
                                    1 1 0 0 0 1 2 20 13 6 0 1 2 14 13 34 0 1 3
                                    24 0 0 0 27 1 1 0 0 0 1 1 3 43 0 1 1 0 0 5
                                    1 2 0 0 0 6 1 2 0 0 0 0 1 1 22 0 25 1 2 0 0
                                    6 0 1 2 0 0 0 0 1 2 0 0 0 6 1 1 0 0 25 1 1
                                    0 5 0 18 1 0 0 5 17 1 17 19 0 21 1 0 25 0 1
                                    2 4 23 0 0 1 2 14 23 34 0 1 2 16 23 0 0 1 2
                                    16 23 0 0 1 2 21 23 0 0 1 2 16 23 0 0 1 2
                                    16 23 0 0 1 1 14 13 0 14)))))
           '|lookupComplete|)) 
