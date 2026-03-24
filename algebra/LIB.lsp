
(SDEFUN |LIB;library;Fn%;1| ((|f| (|FileName|)) (% (%)))
        (SPADCALL |f| (QREFELT % 8))) 

(SDEFUN |LIB;elt;%SA;2| ((|f| (%)) (|v| (|Symbol|)) (% (|Any|)))
        (SPADCALL |f| (SPADCALL |v| (QREFELT % 12)) (QREFELT % 14))) 

(SDEFUN |LIB;setelt!;%S2A;3|
        ((|f| (%)) (|v| (|Symbol|)) (|val| (|Any|)) (% (|Any|)))
        (SPADCALL |f| (SPADCALL |v| (QREFELT % 12)) |val| (QREFELT % 16))) 

(DECLAIM (NOTINLINE |Library;|)) 

(DEFUN |Library;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G57 NIL) (#2=#:G56 NIL) (|pv$| NIL)
    (#3=#:G58 NIL) (#4=#:G59 NIL))
   (PROGN
    (LETT |dv$| '(|Library|))
    (LETT % (GETREFV 41))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|String|))
                                                   (|:| |entry| (|Any|)))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|String|))
                                                   (|:| |entry| (|Any|)))
                                         '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|String|))
                                                   (|:| |entry| (|Any|)))
                                         '(|BasicType|))
                                        (|HasCategory| (|String|)
                                                       '(|OrderedSet|))
                                        (OR
                                         (|HasCategory| (|Any|)
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|String|))
                                                    (|:| |entry| (|Any|)))
                                          '(|CoercibleTo| (|OutputForm|))))
                                        (|HasCategory| (|Any|) '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|Any|)
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| (|Any|)
                                                        '(|Evalable| (|Any|)))
                                         #1#)
                                        (LETT #2#
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|String|))
                                                         (|:| |entry| (|Any|)))
                                               '(|SetCategory|)))
                                        (AND
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|String|))
                                                    (|:| |entry| (|Any|)))
                                          '(|Evalable|
                                            (|Record| (|:| |key| (|String|))
                                                      (|:| |entry| (|Any|)))))
                                         #2#)
                                        (OR #1# #2#)
                                        (OR
                                         (|HasCategory| (|Any|)
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         #1#
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|String|))
                                                    (|:| |entry| (|Any|)))
                                          '(|CoercibleTo| (|OutputForm|)))
                                         #2#)
                                        (|HasCategory| (|Any|)
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|Library| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND (LETT #3# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 8192))
    (AND #3#
         (|HasCategory| (|Record| (|:| |key| (|String|)) (|:| |entry| (|Any|)))
                        '(|OrderedSet|))
         (|augmentPredVector| % 16384))
    (AND #3#
         (|HasCategory| (|Record| (|:| |key| (|String|)) (|:| |entry| (|Any|)))
                        '(|BasicType|))
         (|augmentPredVector| % 32768))
    (AND
     (LETT #4#
           (AND (|HasCategory| % '(|finiteAggregate|))
                (|HasCategory| (|Any|) '(|BasicType|))))
     (|augmentPredVector| % 65536))
    (AND
     (OR #4#
         (AND #3#
              (|HasCategory|
               (|Record| (|:| |key| (|String|)) (|:| |entry| (|Any|)))
               '(|BasicType|)))
         #1# #2#)
     (|augmentPredVector| % 131072))
    (AND #3# (|HasCategory| (|Any|) '(|OrderedSet|))
         (|augmentPredVector| % 262144))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 524288))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 6 (|KeyedAccessFile| (|Any|)))
    %))) 

(DEFUN |Library| ()
  (SPROG NIL
         (PROG (#1=#:G61)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Library|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Library|
                             (LIST (CONS NIL (CONS 1 (|Library;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Library|)))))))))) 

(MAKEPROP '|Library| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|KeyedAccessFile| 13) '|Rep| (|FileName|)
              (0 . |open|) |LIB;library;Fn%;1| (|String|) (|Symbol|)
              (5 . |string|) (|Any|) (10 . |elt|) |LIB;elt;%SA;2|
              (16 . |setelt!|) |LIB;setelt!;%S2A;3| (|Boolean|)
              (|NonNegativeInteger|) (|Record| (|:| |key| 10) (|:| |entry| 13))
              (|Mapping| 20 20) (|List| 20) (|Union| 20 '"failed")
              (|Mapping| 18 20) (|List| 10) (|Union| 13 '"failed") (|List| 13)
              (|Mapping| 13 13) (|Mapping| 13 13 13) (|Mapping| 20 20 20)
              (|Equation| 13) (|List| 31) (|Equation| 20) (|List| 33)
              (|OutputForm|) (|Mapping| 18 20 20) (|Mapping| 18 13 13)
              (|Mapping| 18 13) (|Void|) (|InputForm|))
           '#(~= 23 |table| 29 |swap!| 38 |size?| 45 |setelt!| 51 |select!| 65
              |select| 71 |search| 77 |sample| 83 |removeDuplicates| 87
              |remove!| 92 |remove| 110 |reduce| 122 |qsetelt!| 143 |qelt| 150
              |parts| 156 |pack!| 166 |more?| 171 |minIndex| 177 |min| 182
              |members| 192 |member?| 202 |maxIndex| 214 |max| 219 |map!| 241
              |map| 253 |library| 272 |less?| 277 |latex| 283 |keys| 288 |key?|
              293 |inspect| 299 |insert!| 304 |indices| 310 |index?| 315
              |first| 321 |find| 326 |fill!| 332 |extract!| 338 |every?| 343
              |eval| 355 |eq?| 407 |entry?| 413 |entries| 419 |empty?| 424
              |empty| 429 |elt| 433 |dictionary| 452 |count| 461 |copy| 485
              |convert| 490 |construct| 495 |coerce| 500 |close!| 505 |any?|
              510 = 522 |#| 528)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 0 0 0 11 8 10 0 0 12 11 8 1 10 0
                                  0 0))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |IndexedAggregate&|
                |Collection&| |HomogeneousAggregate&| |HomogeneousAggregate&|
                |SetCategory&| |Evalable&| |Evalable&| |Aggregate&|
                |EltableAggregate&| NIL |BasicType&| |InnerEvalable&| NIL
                |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|TableAggregate| 10 13) (|KeyedDictionary| 10 13)
                 (|Dictionary| 20) (|DictionaryOperations| 20)
                 (|BagAggregate| 20) (|IndexedAggregate| 10 13)
                 (|Collection| 20) (|HomogeneousAggregate| 13)
                 (|HomogeneousAggregate| 20) (|SetCategory|) (|Evalable| 13)
                 (|Evalable| 20) (|Aggregate|) (|EltableAggregate| 10 13)
                 (|CoercibleTo| 35) (|BasicType|) (|InnerEvalable| 13 13)
                 (|ConvertibleTo| 40) (|InnerEvalable| 20 20)
                 (|shallowlyMutable|) (|Type|) (|Eltable| 10 13))
              (|makeByteWordVec2| 40
                                  '(1 6 0 7 8 1 11 10 0 12 2 0 13 0 10 14 3 0
                                    13 0 10 13 16 2 18 18 0 0 1 1 0 0 22 1 0 0
                                    0 1 3 20 39 0 10 10 1 2 0 18 0 19 1 3 0 13
                                    0 10 13 16 3 0 13 0 11 13 17 2 14 0 24 0 1
                                    2 14 0 24 0 1 2 0 26 10 0 1 0 0 0 1 1 16 0
                                    0 1 2 0 26 10 0 1 2 16 0 20 0 1 2 14 0 24 0
                                    1 2 16 0 20 0 1 2 14 0 24 0 1 4 16 20 30 0
                                    20 20 1 2 14 20 30 0 1 3 14 20 30 0 20 1 3
                                    20 13 0 10 13 1 2 0 13 0 10 1 1 14 22 0 1 1
                                    14 27 0 1 1 0 0 0 1 2 0 18 0 19 1 1 4 10 0
                                    1 1 19 13 0 1 1 15 20 0 1 1 14 22 0 1 1 14
                                    27 0 1 2 17 18 13 0 1 2 16 18 20 0 1 1 4 10
                                    0 1 1 19 13 0 1 1 15 20 0 1 2 14 20 36 0 1
                                    2 14 13 37 0 1 2 20 0 21 0 1 2 20 0 28 0 1
                                    2 0 0 21 0 1 2 0 0 28 0 1 3 0 0 29 0 0 1 1
                                    0 0 7 9 2 0 18 0 19 1 1 11 10 0 1 1 0 25 0
                                    1 2 0 18 10 0 1 1 0 20 0 1 2 0 0 20 0 1 1 0
                                    25 0 1 2 0 18 10 0 1 1 4 13 0 1 2 0 23 24 0
                                    1 2 20 0 0 13 1 1 0 20 0 1 2 14 18 24 0 1 2
                                    14 18 38 0 1 3 8 0 0 27 27 1 2 8 0 0 31 1 3
                                    8 0 0 13 13 1 2 8 0 0 32 1 2 10 0 0 33 1 2
                                    10 0 0 34 1 3 10 0 0 22 22 1 3 10 0 0 20 20
                                    1 2 0 18 0 0 1 2 17 18 13 0 1 1 0 27 0 1 1
                                    0 18 0 1 0 0 0 1 3 0 13 0 10 13 1 2 0 13 0
                                    10 14 2 0 13 0 11 15 0 0 0 1 1 0 0 22 1 2
                                    17 19 13 0 1 2 16 19 20 0 1 2 14 19 24 0 1
                                    2 14 19 38 0 1 1 0 0 0 1 1 1 40 0 1 1 0 0
                                    22 1 1 5 35 0 1 1 0 0 0 1 2 14 18 24 0 1 2
                                    14 18 38 0 1 2 18 18 0 0 1 1 14 19 0 1)))))
           '|lookupComplete|)) 
