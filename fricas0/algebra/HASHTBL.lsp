
(PUT '|HASHTBL;keys;$L;1| '|SPADreplace| 'HKEYS) 

(SDEFUN |HASHTBL;keys;$L;1| ((|t| $) ($ |List| |Key|)) (HKEYS |t|)) 

(PUT '|HASHTBL;#;$Nni;2| '|SPADreplace| 'HCOUNT) 

(SDEFUN |HASHTBL;#;$Nni;2| ((|t| $) ($ |NonNegativeInteger|)) (HCOUNT |t|)) 

(PUT '|HASHTBL;setelt!;$Key2Entry;3| '|SPADreplace| 'HPUT) 

(SDEFUN |HASHTBL;setelt!;$Key2Entry;3|
        ((|t| $) (|k| |Key|) (|e| |Entry|) ($ |Entry|)) (HPUT |t| |k| |e|)) 

(SDEFUN |HASHTBL;remove!;Key$U;4|
        ((|k| |Key|) (|t| $) ($ |Union| |Entry| "failed"))
        (SPROG ((|r| (|None|)))
               (SEQ
                (LETT |r| (HGET2 |t| |k| (QREFELT $ 9))
                      |HASHTBL;remove!;Key$U;4|)
                (COND
                 ((NULL (EQ |r| (QREFELT $ 9)))
                  (EXIT (SEQ (HREM |t| |k|) (EXIT (CONS 0 |r|))))))
                (EXIT (CONS 1 "failed"))))) 

(SDEFUN |HASHTBL;empty;$;5| (($ $)) (MAKE-HASHTABLE (INTERN (QREFELT $ 8)))) 

(SDEFUN |HASHTBL;search;Key$U;6|
        ((|k| |Key|) (|t| $) ($ |Union| |Entry| "failed"))
        (SPROG ((|r| (|None|)))
               (SEQ
                (LETT |r| (HGET2 |t| |k| (QREFELT $ 9))
                      |HASHTBL;search;Key$U;6|)
                (COND ((NULL (EQ |r| (QREFELT $ 9))) (EXIT (CONS 0 |r|))))
                (EXIT (CONS 1 "failed"))))) 

(DECLAIM (NOTINLINE |HashTable;|)) 

(DEFUN |HashTable| (&REST #1=#:G769)
  (SPROG NIL
         (PROG (#2=#:G770)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|HashTable|)
                                               '|domainEqualList|)
                    . #3=(|HashTable|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |HashTable;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|HashTable|)))))))))) 

(DEFUN |HashTable;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G768 NIL) (#2=#:G767 NIL) (|pv$| NIL) (#3=#:G765 NIL) (#4=#:G766 NIL)
    ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|HashTable|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT DV$3 (|devaluate| |#3|) . #5#)
    (LETT |dv$| (LIST '|HashTable| DV$1 DV$2 DV$3) . #5#)
    (LETT $ (GETREFV 40) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
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
                                                             '(|SetCategory|))
                                              . #5#)
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
                                               '(|SetCategory|))
                                              . #5#)
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
                                         #3#)))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|HashTable| (LIST DV$1 DV$2 DV$3)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (LETT #2# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
         (|augmentPredVector| $ 4096))
    (AND #2#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|BasicType|))
         (|augmentPredVector| $ 8192))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #5#)
     (|augmentPredVector| $ 16384))
    (AND
     (OR #1# #4#
         (AND #2#
              (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                             '(|BasicType|)))
         #3#)
     (|augmentPredVector| $ 32768))
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 65536))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (GENSYM))
    $))) 

(MAKEPROP '|HashTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|failMsg| (|List| 6) |HASHTBL;keys;$L;1|
              (|NonNegativeInteger|) |HASHTBL;#;$Nni;2|
              |HASHTBL;setelt!;$Key2Entry;3| (|Union| 7 '"failed")
              |HASHTBL;remove!;Key$U;4| |HASHTBL;empty;$;5|
              |HASHTBL;search;Key$U;6| (|Record| (|:| |key| 6) (|:| |entry| 7))
              (|List| 19) (|List| 22) (|Equation| 19) (|Mapping| 19 19 19)
              (|Boolean|) (|Equation| 7) (|List| 25) (|List| 7) (|OutputForm|)
              (|String|) (|SingleInteger|) (|HashState|) (|InputForm|)
              (|Mapping| 24 7) (|Mapping| 24 19) (|Mapping| 7 7) (|Void|)
              (|Mapping| 19 19) (|Mapping| 7 7 7) (|Union| 19 '"failed"))
           '#(~= 0 |table| 6 |swap!| 15 |size?| 22 |setelt!| 28 |select!| 35
              |select| 41 |search| 47 |sample| 53 |removeDuplicates| 57
              |remove!| 62 |remove| 80 |reduce| 92 |qsetelt!| 113 |qelt| 120
              |parts| 126 |more?| 136 |minIndex| 142 |members| 147 |member?|
              157 |maxIndex| 169 |map!| 174 |map| 186 |less?| 205 |latex| 211
              |keys| 216 |key?| 221 |inspect| 227 |insert!| 232 |indices| 238
              |index?| 243 |hashUpdate!| 249 |hash| 255 |first| 260 |find| 265
              |fill!| 271 |extract!| 277 |every?| 282 |eval| 294 |eq?| 346
              |entry?| 352 |entries| 358 |empty?| 363 |empty| 368 |elt| 372
              |dictionary| 385 |count| 394 |copy| 418 |convert| 423 |construct|
              428 |coerce| 433 |any?| 438 = 450 |#| 456)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 0 0 0 0 0 9 7 11 0 0 0 0 9 1 7 10
                                  12))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |Collection&|
                |IndexedAggregate&| |HomogeneousAggregate&|
                |HomogeneousAggregate&| |EltableAggregate&| |Aggregate&|
                |Evalable&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL |InnerEvalable&| |BasicType&| NIL)
             (CONS
              '#((|TableAggregate| 6 7) (|KeyedDictionary| 6 7)
                 (|Dictionary| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|BagAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Collection| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|IndexedAggregate| 6 7)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|HomogeneousAggregate| 7) (|EltableAggregate| 6 7)
                 (|Aggregate|)
                 (|Evalable| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Evalable| 7) (|SetCategory|) (|finiteAggregate|)
                 (|Eltable| 6 7) (|Type|) (|shallowlyMutable|)
                 (|InnerEvalable| (|Record| (|:| |key| 6) (|:| |entry| 7))
                                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ConvertibleTo| 32) (|InnerEvalable| 7 7) (|BasicType|)
                 (|CoercibleTo| 28))
              (|makeByteWordVec2| 39
                                  '(2 16 24 0 0 1 1 0 0 20 1 0 0 0 1 3 17 36 0
                                    6 6 1 2 0 24 0 12 1 3 0 7 0 6 7 14 2 13 0
                                    34 0 1 2 13 0 34 0 1 2 0 15 6 0 18 0 0 0 1
                                    1 14 0 0 1 2 14 0 19 0 1 2 13 0 34 0 1 2 0
                                    15 6 0 16 2 14 0 19 0 1 2 13 0 34 0 1 4 14
                                    19 23 0 19 19 1 3 13 19 23 0 19 1 2 13 19
                                    23 0 1 3 17 7 0 6 7 1 2 0 7 0 6 1 1 13 27 0
                                    1 1 13 20 0 1 2 0 24 0 12 1 1 3 6 0 1 1 13
                                    27 0 1 1 13 20 0 1 2 14 24 19 0 1 2 15 24 7
                                    0 1 1 3 6 0 1 2 17 0 35 0 1 2 17 0 37 0 1 3
                                    0 0 38 0 0 1 2 0 0 35 0 1 2 0 0 37 0 1 2 0
                                    24 0 12 1 1 11 29 0 1 1 0 10 0 11 2 0 24 6
                                    0 1 1 0 19 0 1 2 0 0 19 0 1 1 0 10 0 1 2 0
                                    24 6 0 1 2 11 31 31 0 1 1 11 30 0 1 1 3 7 0
                                    1 2 0 39 34 0 1 2 17 0 0 7 1 1 0 19 0 1 2
                                    13 24 33 0 1 2 13 24 34 0 1 3 9 0 0 19 19 1
                                    3 9 0 0 20 20 1 2 9 0 0 21 1 2 9 0 0 22 1 2
                                    7 0 0 25 1 2 7 0 0 26 1 3 7 0 0 27 27 1 3 7
                                    0 0 7 7 1 2 0 24 0 0 1 2 15 24 7 0 1 1 0 27
                                    0 1 1 0 24 0 1 0 0 0 17 2 0 7 0 6 1 3 0 7 0
                                    6 7 1 0 0 0 1 1 0 0 20 1 2 14 12 19 0 1 2
                                    15 12 7 0 1 2 13 12 33 0 1 2 13 12 34 0 1 1
                                    0 0 0 1 1 1 32 0 1 1 0 0 20 1 1 4 28 0 1 2
                                    13 24 33 0 1 2 13 24 34 0 1 2 16 24 0 0 1 1
                                    13 12 0 13)))))
           '|lookupComplete|)) 
