
(SDEFUN |GSTBL;elt;%KeyEntry;1| ((|t| (%)) (|k| (|Key|)) (% (|Entry|)))
        (SPROG ((|u| (|Union| |Entry| "failed")))
               (SEQ (LETT |u| (SPADCALL |k| |t| (QREFELT % 12)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (QREFELT % 9)) ('T (QCDR |u|))))))) 

(SDEFUN |GSTBL;setelt!;%Key2Entry;2|
        ((|t| (%)) (|k| (|Key|)) (|e| (|Entry|)) (% (|Entry|)))
        (SEQ
         (COND
          ((SPADCALL |e| (QREFELT % 9) (QREFELT % 15))
           (SEQ (SPADCALL |k| |t| (QREFELT % 16)) (EXIT |e|)))
          ('T (SPADCALL |t| |k| |e| (QREFELT % 17)))))) 

(SDEFUN |GSTBL;search;Key%U;3|
        ((|k| (|Key|)) (|t| (%)) (% (|Union| |Entry| #1="failed")))
        (SPROG ((|u| (|Union| |Entry| #1#)))
               (SEQ (LETT |u| (SPADCALL |k| |t| (QREFELT % 12)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 0 (QREFELT % 9))) ('T |u|)))))) 

(DECLAIM (NOTINLINE |GeneralSparseTable;|)) 

(DEFUN |GeneralSparseTable;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((#1=#:G67 NIL) (#2=#:G66 NIL) (|pv$| NIL) (#3=#:G64 NIL) (#4=#:G65 NIL)
    (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 |#4|)
    (LETT |dv$| (LIST '|GeneralSparseTable| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 42))
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
    (|haddProp| |$ConstructorCache| '|GeneralSparseTable|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 5 |#3|)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (AND (LETT #2# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 8192))
    (AND #2#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|OrderedSet|))
         (|augmentPredVector| % 16384))
    (AND #2#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|BasicType|))
         (|augmentPredVector| % 32768))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|BasicType|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 65536))
    (AND
     (OR #1# #4#
         (AND #2#
              (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                             '(|BasicType|)))
         #3#)
     (|augmentPredVector| % 131072))
    (AND (|HasCategory| |#2| '(|OrderedSet|)) #2#
         (|augmentPredVector| % 262144))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 524288))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 |#3|)
    %))) 

(DEFUN |GeneralSparseTable| (&REST #1=#:G68)
  (SPROG NIL
         (PROG (#2=#:G69)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T T NIL))
                     (HGET |$ConstructorCache| '|GeneralSparseTable|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GeneralSparseTable;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GeneralSparseTable|)))))))))) 

(MAKEPROP '|GeneralSparseTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#3|) (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| (|Union| 7 '"failed")
              (0 . |search|) |GSTBL;elt;%KeyEntry;1| (|Boolean|) (6 . =)
              (12 . |remove!|) (18 . |setelt!|) |GSTBL;setelt!;%Key2Entry;2|
              |GSTBL;search;Key%U;3| (|NonNegativeInteger|)
              (|Record| (|:| |key| 6) (|:| |entry| 7)) (|Mapping| 21 21)
              (|List| 21) (|Union| 21 '"failed") (|Mapping| 14 21) (|List| 6)
              (|List| 7) (|Mapping| 7 7) (|Mapping| 7 7 7) (|Mapping| 21 21 21)
              (|List| 32) (|Equation| 7) (|Equation| 21) (|List| 33)
              (|OutputForm|) (|String|) (|Mapping| 14 21 21) (|Mapping| 14 7 7)
              (|Mapping| 14 7) (|Void|) (|InputForm|))
           '#(~= 25 |table| 31 |swap!| 40 |size?| 47 |setelt!| 53 |select!| 60
              |select| 66 |search| 72 |sample| 78 |removeDuplicates| 82
              |remove!| 87 |remove| 105 |reduce| 117 |qsetelt!| 138 |qelt| 145
              |parts| 151 |more?| 161 |minIndex| 167 |min| 172 |members| 182
              |member?| 192 |maxIndex| 204 |max| 209 |map!| 231 |map| 243
              |less?| 262 |latex| 268 |keys| 273 |key?| 278 |inspect| 284
              |insert!| 289 |indices| 295 |index?| 300 |first| 306 |find| 311
              |fill!| 317 |extract!| 323 |every?| 328 |eval| 340 |eq?| 392
              |entry?| 398 |entries| 404 |empty?| 409 |empty| 414 |elt| 418
              |dictionary| 431 |count| 440 |copy| 464 |convert| 469 |construct|
              474 |coerce| 479 |any?| 484 = 496 |#| 502)
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
                 (|Aggregate|) (|EltableAggregate| 6 7) (|CoercibleTo| 35)
                 (|BasicType|) (|InnerEvalable| 7 7) (|ConvertibleTo| 41)
                 (|InnerEvalable| (|Record| (|:| |key| 6) (|:| |entry| 7))
                                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|shallowlyMutable|) (|Type|) (|Eltable| 6 7))
              (|makeByteWordVec2| 41
                                  '(2 10 11 6 0 12 2 7 14 0 0 15 2 0 11 6 0 16
                                    3 10 7 0 6 7 17 2 18 14 0 0 1 0 0 0 1 1 0 0
                                    23 1 3 20 40 0 6 6 1 2 0 14 0 20 1 3 0 7 0
                                    6 7 18 2 14 0 25 0 1 2 14 0 25 0 1 2 0 11 6
                                    0 19 0 0 0 1 1 16 0 0 1 2 0 11 6 0 16 2 16
                                    0 21 0 1 2 14 0 25 0 1 2 16 0 21 0 1 2 14 0
                                    25 0 1 4 16 21 30 0 21 21 1 3 14 21 30 0 21
                                    1 2 14 21 30 0 1 3 20 7 0 6 7 1 2 0 7 0 6 1
                                    1 14 23 0 1 1 14 27 0 1 2 0 14 0 20 1 1 4 6
                                    0 1 1 19 7 0 1 1 15 21 0 1 1 14 23 0 1 1 14
                                    27 0 1 2 17 14 7 0 1 2 16 14 21 0 1 1 4 6 0
                                    1 1 19 7 0 1 1 15 21 0 1 2 14 21 37 0 1 2
                                    14 7 38 0 1 2 20 0 22 0 1 2 20 0 28 0 1 2 0
                                    0 22 0 1 2 0 0 28 0 1 3 0 0 29 0 0 1 2 0 14
                                    0 20 1 1 11 36 0 1 1 0 26 0 1 2 0 14 6 0 1
                                    1 0 21 0 1 2 0 0 21 0 1 1 0 26 0 1 2 0 14 6
                                    0 1 1 4 7 0 1 2 0 24 25 0 1 2 20 0 0 7 1 1
                                    0 21 0 1 2 14 14 25 0 1 2 14 14 39 0 1 3 8
                                    0 0 27 27 1 3 8 0 0 7 7 1 2 8 0 0 31 1 2 8
                                    0 0 32 1 2 10 0 0 33 1 2 10 0 0 34 1 3 10 0
                                    0 21 21 1 3 10 0 0 23 23 1 2 0 14 0 0 1 2
                                    17 14 7 0 1 1 0 27 0 1 1 0 14 0 1 0 0 0 1 3
                                    0 7 0 6 7 1 2 0 7 0 6 13 0 0 0 1 1 0 0 23 1
                                    2 17 20 7 0 1 2 16 20 21 0 1 2 14 20 25 0 1
                                    2 14 20 39 0 1 1 0 0 0 1 1 1 41 0 1 1 0 0
                                    23 1 1 5 35 0 1 2 14 14 25 0 1 2 14 14 39 0
                                    1 2 18 14 0 0 1 1 14 20 0 1)))))
           '|lookupComplete|)) 
