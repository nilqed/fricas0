
(DECLAIM (NOTINLINE |InnerTable;|)) 

(DEFUN |InnerTable;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G58 NIL) (#2=#:G57 NIL) (|pv$| NIL) (#3=#:G55 NIL) (#4=#:G56 NIL)
    (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|InnerTable| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 33))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|BasicType|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          '(|CoercibleTo| (|OutputForm|))))
                                        (|HasCategory| |#2| '(|BasicType|))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#2|)))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|SetCategory|)))
                                        (AND
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          (LIST '|Evalable|
                                                (LIST '|Record|
                                                      (LIST '|:| '|key|
                                                            (|devaluate| |#1|))
                                                      (LIST '|:| '|entry|
                                                            (|devaluate|
                                                             |#2|)))))
                                         #3#)
                                        (OR (|HasCategory| |#2| '(|BasicType|))
                                            #4#
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|BasicType|))
                                            #3#)
                                        (OR #4# #3#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         #4#
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          '(|CoercibleTo| (|OutputForm|)))
                                         #3#)
                                        (|HasCategory| |#2|
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|InnerTable| (LIST DV$1 DV$2 DV$3)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 5 |#3|)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (LETT #2# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 16384))
    (AND #2#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|OrderedSet|))
         (|augmentPredVector| % 32768))
    (AND #2#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|BasicType|))
         (|augmentPredVector| % 65536))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|BasicType|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 131072))
    (AND
     (OR #1# #4#
         (AND #2#
              (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                             '(|BasicType|)))
         #3#)
     (|augmentPredVector| % 262144))
    (AND (|HasCategory| |#2| '(|OrderedSet|)) #2#
         (|augmentPredVector| % 524288))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 1048576))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |InnerTable| (&REST #1=#:G59)
  (SPROG NIL
         (PROG (#2=#:G60)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerTable|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerTable;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|InnerTable|)))))))))) 

(MAKEPROP '|InnerTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#3|) (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Boolean|) (|NonNegativeInteger|)
              (|Record| (|:| |key| 6) (|:| |entry| 7)) (|Mapping| 11 11)
              (|List| 11) (|Union| 11 '"failed") (|Mapping| 9 11) (|List| 6)
              (|Union| 7 '"failed") (|List| 7) (|Mapping| 7 7)
              (|Mapping| 7 7 7) (|Mapping| 11 11 11) (|List| 23) (|Equation| 7)
              (|Equation| 11) (|List| 24) (|OutputForm|) (|String|)
              (|Mapping| 9 11 11) (|Mapping| 9 7 7) (|Mapping| 9 7) (|Void|)
              (|InputForm|))
           '#(~= 0 |table| 6 |swap!| 15 |size?| 22 |setelt!| 28 |select!| 35
              |select| 41 |search| 47 |sample| 53 |removeDuplicates| 57
              |remove!| 62 |remove| 80 |reduce| 92 |qsetelt!| 113 |qelt| 120
              |parts| 126 |more?| 136 |minIndex| 142 |min| 147 |members| 157
              |member?| 167 |maxIndex| 179 |max| 184 |map!| 206 |map| 218
              |less?| 237 |latex| 243 |keys| 248 |key?| 253 |inspect| 259
              |insert!| 264 |indices| 270 |index?| 275 |first| 281 |find| 286
              |fill!| 292 |extract!| 298 |every?| 303 |eval| 315 |eq?| 367
              |entry?| 373 |entries| 379 |empty?| 384 |empty| 389 |elt| 393
              |dictionary| 406 |count| 415 |copy| 439 |convert| 444 |construct|
              449 |coerce| 454 |any?| 459 = 471 |#| 477)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 12 8 10 0 0 13 11 8 1 10 0
                                  0 0 0))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |IndexedAggregate&|
                |Collection&| |HomogeneousAggregate&| |HomogeneousAggregate&|
                |SetCategory&| |Evalable&| |Evalable&| |Aggregate&|
                |EltableAggregate&| NIL |BasicType&| |InnerEvalable&| NIL
                |InnerEvalable&| NIL NIL NIL NIL)
             (CONS
              '#((|TableAggregate| 6 7) (|KeyedDictionary| 6 7)
                 (|Dictionary| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|BagAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|IndexedAggregate| 6 7)
                 (|Collection| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|HomogeneousAggregate| 7)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|SetCategory|) (|Evalable| 7)
                 (|Evalable| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Aggregate|) (|EltableAggregate| 6 7) (|CoercibleTo| 26)
                 (|BasicType|) (|InnerEvalable| 7 7) (|ConvertibleTo| 32)
                 (|InnerEvalable| (|Record| (|:| |key| 6) (|:| |entry| 7))
                                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|shallowlyMutable|) (|Type|) (|Eltable| 6 7)
                 (|finiteAggregate|))
              (|makeByteWordVec2| 32
                                  '(2 19 9 0 0 1 0 0 0 1 1 0 0 13 1 3 21 31 0 6
                                    6 1 2 0 9 0 10 1 3 0 7 0 6 7 1 2 15 0 15 0
                                    1 2 15 0 15 0 1 2 0 17 6 0 1 0 0 0 1 1 17 0
                                    0 1 2 0 17 6 0 1 2 17 0 11 0 1 2 15 0 15 0
                                    1 2 17 0 11 0 1 2 15 0 15 0 1 4 17 11 21 0
                                    11 11 1 3 15 11 21 0 11 1 2 15 11 21 0 1 3
                                    21 7 0 6 7 1 2 0 7 0 6 1 1 15 13 0 1 1 15
                                    18 0 1 2 0 9 0 10 1 1 4 6 0 1 1 20 7 0 1 1
                                    16 11 0 1 1 15 13 0 1 1 15 18 0 1 2 18 9 7
                                    0 1 2 17 9 11 0 1 1 4 6 0 1 1 20 7 0 1 1 16
                                    11 0 1 2 15 11 28 0 1 2 15 7 29 0 1 2 21 0
                                    12 0 1 2 21 0 19 0 1 2 0 0 12 0 1 2 0 0 19
                                    0 1 3 0 0 20 0 0 1 2 0 9 0 10 1 1 12 27 0 1
                                    1 0 16 0 1 2 0 9 6 0 1 1 0 11 0 1 2 0 0 11
                                    0 1 1 0 16 0 1 2 0 9 6 0 1 1 4 7 0 1 2 0 14
                                    15 0 1 2 21 0 0 7 1 1 0 11 0 1 2 15 9 15 0
                                    1 2 15 9 30 0 1 3 8 0 0 18 18 1 3 8 0 0 7 7
                                    1 2 8 0 0 22 1 2 8 0 0 23 1 2 10 0 0 24 1 2
                                    10 0 0 25 1 3 10 0 0 11 11 1 3 10 0 0 13 13
                                    1 2 0 9 0 0 1 2 18 9 7 0 1 1 0 18 0 1 1 0 9
                                    0 1 0 0 0 1 3 0 7 0 6 7 1 2 0 7 0 6 1 0 0 0
                                    1 1 0 0 13 1 2 18 10 7 0 1 2 17 10 11 0 1 2
                                    15 10 15 0 1 2 15 10 30 0 1 1 0 0 0 1 1 1
                                    32 0 1 1 0 0 13 1 1 5 26 0 1 2 15 9 15 0 1
                                    2 15 9 30 0 1 2 19 9 0 0 1 1 15 10 0 1)))))
           '|lookupComplete|)) 
