
(DECLAIM (NOTINLINE |StringTable;|)) 

(DEFUN |StringTable;| (|#1|)
  (SPROG
   ((#1=#:G58 NIL) (#2=#:G57 NIL) (|pv$| NIL) (#3=#:G55 NIL) (#4=#:G56 NIL)
    (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|StringTable| DV$1))
    (LETT % (GETREFV 31))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|String|))
                                                   (|:| |entry| |#1|))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|String|))
                                                   (|:| |entry| |#1|))
                                         '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|String|))
                                                   (|:| |entry| |#1|))
                                         '(|BasicType|))
                                        (|HasCategory| (|String|)
                                                       '(|OrderedSet|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|String|))
                                                    (|:| |entry| |#1|))
                                          '(|CoercibleTo| (|OutputForm|))))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|String|))
                                                         (|:| |entry| |#1|))
                                               '(|SetCategory|)))
                                        (AND
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|String|))
                                                    (|:| |entry| |#1|))
                                          (LIST '|Evalable|
                                                (LIST '|Record|
                                                      '(|:| |key| (|String|))
                                                      (LIST '|:| '|entry|
                                                            (|devaluate|
                                                             |#1|)))))
                                         #3#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #4#
                                            (|HasCategory|
                                             (|Record| (|:| |key| (|String|))
                                                       (|:| |entry| |#1|))
                                             '(|BasicType|))
                                            #3#)
                                        (OR #4# #3#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         #4#
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|String|))
                                                    (|:| |entry| |#1|))
                                          '(|CoercibleTo| (|OutputForm|)))
                                         #3#)
                                        (|HasCategory| |#1|
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|StringTable| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (LETT #2# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 16384))
    (AND #2#
         (|HasCategory| (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
                        '(|OrderedSet|))
         (|augmentPredVector| % 32768))
    (AND #2#
         (|HasCategory| (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
                        '(|BasicType|))
         (|augmentPredVector| % 65536))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 131072))
    (AND
     (OR #1# #4#
         (AND #2#
              (|HasCategory|
               (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
               '(|BasicType|)))
         #3#)
     (|augmentPredVector| % 262144))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #2#
         (|augmentPredVector| % 524288))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 1048576))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |StringTable| (#1=#:G59)
  (SPROG NIL
         (PROG (#2=#:G60)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|StringTable|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|StringTable;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|StringTable|)))))))))) 

(MAKEPROP '|StringTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|HashTable| 14 6 '"EQUAL") (|local| |#1|)
              (|Boolean|) (|NonNegativeInteger|)
              (|Record| (|:| |key| 14) (|:| |entry| 6)) (|Mapping| 9 9)
              (|List| 9) (|Union| 9 '"failed") (|Mapping| 7 9) (|String|)
              (|List| 14) (|Union| 6 '"failed") (|List| 6) (|Mapping| 6 6)
              (|Mapping| 6 6 6) (|Mapping| 9 9 9) (|List| 22) (|Equation| 6)
              (|Equation| 9) (|List| 23) (|OutputForm|) (|Mapping| 7 9 9)
              (|Mapping| 7 6 6) (|Mapping| 7 6) (|Void|) (|InputForm|))
           '#() 'NIL
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
              '#((|TableAggregate| 14 6) (|KeyedDictionary| 14 6)
                 (|Dictionary| (|Record| (|:| |key| 14) (|:| |entry| 6)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 14) (|:| |entry| 6)))
                 (|BagAggregate| (|Record| (|:| |key| 14) (|:| |entry| 6)))
                 (|IndexedAggregate| 14 6)
                 (|Collection| (|Record| (|:| |key| 14) (|:| |entry| 6)))
                 (|HomogeneousAggregate| 6)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 14) (|:| |entry| 6)))
                 (|SetCategory|) (|Evalable| 6)
                 (|Evalable| (|Record| (|:| |key| 14) (|:| |entry| 6)))
                 (|Aggregate|) (|EltableAggregate| 14 6) (|CoercibleTo| 25)
                 (|BasicType|) (|InnerEvalable| 6 6) (|ConvertibleTo| 30)
                 (|InnerEvalable| (|Record| (|:| |key| 14) (|:| |entry| 6))
                                  (|Record| (|:| |key| 14) (|:| |entry| 6)))
                 (|shallowlyMutable|) (|Type|) (|Eltable| 14 6)
                 (|finiteAggregate|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
