
(SDEFUN |KAFILE;=;2%B;1| ((|f1| (%)) (|f2| (%)) (% (|Boolean|)))
        (SPADCALL (QVELT |f1| 0) (QVELT |f2| 0) (QREFELT % 11))) 

(SDEFUN |KAFILE;coerce;%Of;2| ((|f| (%)) (% (|OutputForm|)))
        (SPADCALL (QVELT |f| 0) (QREFELT % 14))) 

(SDEFUN |KAFILE;open;Fn%;3| ((|fname| (|FileName|)) (% (%)))
        (SPADCALL |fname| "either" (QREFELT % 17))) 

(SDEFUN |KAFILE;open;FnS%;4|
        ((|fname| (|FileName|)) (|mode| (|String|)) (% (%)))
        (COND
         ((EQUAL |mode| "either")
          (COND
           ((SPADCALL |fname| (QREFELT % 19))
            (SPADCALL |fname| "input" (QREFELT % 17)))
           (#1='T
            (SPADCALL (SPADCALL |fname| "output" (QREFELT % 17)) "input"
                      (QREFELT % 20)))))
         (#1#
          (VECTOR |fname| (SPADCALL |fname| |mode| (QREFELT % 22)) |mode| 0)))) 

(SDEFUN |KAFILE;reopen!;%S%;5| ((|f| (%)) (|mode| (|String|)) (% (%)))
        (SEQ (SPADCALL |f| (QREFELT % 23))
             (COND
              ((SPADCALL |mode| "closed" (QREFELT % 24))
               (SEQ
                (QSETVELT |f| 1 (SPADCALL (QVELT |f| 0) |mode| (QREFELT % 22)))
                (EXIT (QSETVELT |f| 2 |mode|)))))
             (EXIT |f|))) 

(SDEFUN |KAFILE;close!;2%;6| ((|f| (%)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "closed" (QREFELT % 24))
           (SEQ (SPADCALL (QVELT |f| 1) (QREFELT % 26))
                (EXIT (QSETVELT |f| 2 "closed")))))
         (EXIT |f|))) 

(SDEFUN |KAFILE;read!;%R;7|
        ((|f| (%)) (% (|Record| (|:| |key| (|String|)) (|:| |entry| |Entry|))))
        (SPROG ((|k| (|String|)) (|ks| (|List| (|String|))))
               (SEQ
                (COND
                 ((SPADCALL (QVELT |f| 2) "input" (QREFELT % 24))
                  (|error|
                   (LIST '|mathprint|
                         (LIST 'CONCAT
                               (SPADCALL "File not in read state"
                                         (QREFELT % 27))
                               (SPADCALL |f| (QREFELT % 15))))))
                 (#1='T
                  (SEQ (LETT |ks| (SPADCALL (QVELT |f| 1) (QREFELT % 29)))
                       (EXIT
                        (COND
                         ((< (LENGTH |ks|) (QVELT |f| 3))
                          (|error|
                           (LIST '|mathprint|
                                 (LIST 'CONCAT
                                       (SPADCALL
                                        "Attempt to read beyond end of file"
                                        (QREFELT % 27))
                                       (SPADCALL |f| (QREFELT % 15))))))
                         (#1#
                          (SEQ
                           (LETT |k|
                                 (SPADCALL |ks| (QVELT |f| 3) (QREFELT % 31)))
                           (QSETVELT |f| 3 (+ (QVELT |f| 3) 1))
                           (EXIT
                            (CONS |k|
                                  (SPADCALL (QVELT |f| 1) |k|
                                            (QREFELT % 33)))))))))))))) 

(SDEFUN |KAFILE;write!;%2R;8|
        ((|f| (%))
         (|pr| #1=(|Record| (|:| |key| (|String|)) (|:| |entry| |Entry|)))
         (% #1#))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "output" (QREFELT % 24))
           (|error|
            (LIST '|mathprint|
                  (LIST 'CONCAT
                        (SPADCALL "File not in write state" (QREFELT % 27))
                        (SPADCALL |f| (QREFELT % 15))))))
          ('T
           (SEQ (SPADCALL (QVELT |f| 1) (QCAR |pr|) (QCDR |pr|) (QREFELT % 36))
                (EXIT |pr|)))))) 

(PUT '|KAFILE;name;%Fn;9| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 0))) 

(SDEFUN |KAFILE;name;%Fn;9| ((|f| (%)) (% (|FileName|))) (QVELT |f| 0)) 

(PUT '|KAFILE;iomode;%S;10| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 2))) 

(SDEFUN |KAFILE;iomode;%S;10| ((|f| (%)) (% (|String|))) (QVELT |f| 2)) 

(SDEFUN |KAFILE;empty;%;11| ((% (%)))
        (SPROG ((|fn| (|FileName|)))
               (SEQ (LETT |fn| (SPADCALL "" "kaf" "sdata" (QREFELT % 40)))
                    (EXIT (SPADCALL |fn| (QREFELT % 18)))))) 

(SDEFUN |KAFILE;keys;%L;12| ((|f| (%)) (% (|List| (|String|))))
        (SEQ (SPADCALL |f| "input" (QREFELT % 20))
             (EXIT (SPADCALL (QVELT |f| 1) (QREFELT % 29))))) 

(SDEFUN |KAFILE;#;%Nni;13| ((|f| (%)) (% (|NonNegativeInteger|)))
        (LENGTH (SPADCALL |f| (QREFELT % 42)))) 

(SDEFUN |KAFILE;elt;%SEntry;14| ((|f| (%)) (|k| (|String|)) (% (|Entry|)))
        (SEQ (SPADCALL |f| "input" (QREFELT % 20))
             (EXIT (SPADCALL (QVELT |f| 1) |k| (QREFELT % 33))))) 

(SDEFUN |KAFILE;setelt!;%S2Entry;15|
        ((|f| (%)) (|k| (|String|)) (|e| (|Entry|)) (% (|Entry|)))
        (SEQ (SPADCALL |f| "output" (QREFELT % 20))
             (UNWIND-PROTECT (SPADCALL |f| (CONS |k| |e|) (QREFELT % 37))
               (SPADCALL |f| (QREFELT % 23)))
             (SPADCALL |f| (QREFELT % 23)) (EXIT |e|))) 

(SDEFUN |KAFILE;search;S%U;16|
        ((|k| (|String|)) (|f| (%)) (% (|Union| |Entry| "failed")))
        (SEQ
         (COND
          ((NULL (SPADCALL |k| (SPADCALL |f| (QREFELT % 42)) (QREFELT % 47)))
           (CONS 1 "failed"))
          ('T
           (SEQ (SPADCALL |f| "input" (QREFELT % 20))
                (EXIT (CONS 0 (SPADCALL (QVELT |f| 1) |k| (QREFELT % 33))))))))) 

(SDEFUN |KAFILE;remove!;S%U;17|
        ((|k| (|String|)) (|f| (%)) (% (|Union| |Entry| #1="failed")))
        (SPROG ((|result| (|Union| |Entry| #1#)))
               (SEQ (LETT |result| (SPADCALL |k| |f| (QREFELT % 49)))
                    (EXIT
                     (COND ((QEQCAR |result| 1) |result|)
                           ('T
                            (SEQ (SPADCALL |f| "output" (QREFELT % 20))
                                 (SPADCALL (QVELT |f| 1) |k| (QREFELT % 50))
                                 (SPADCALL |f| (QREFELT % 23))
                                 (EXIT |result|)))))))) 

(SDEFUN |KAFILE;pack!;2%;18| ((|f| (%)) (% (%)))
        (SEQ (SPADCALL |f| (QREFELT % 23)) (EXIT |f|))) 

(DECLAIM (NOTINLINE |KeyedAccessFile;|)) 

(DEFUN |KeyedAccessFile;| (|#1|)
  (SPROG ((#1=#:G116 NIL) (|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|KeyedAccessFile| DV$1))
          (LETT % (GETREFV 69))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory|
                                                (|Record|
                                                 (|:| |key| (|String|))
                                                 (|:| |entry| |#1|))
                                                (LIST '|Evalable|
                                                      (LIST '|Record|
                                                            '(|:| |key|
                                                                  (|String|))
                                                            (LIST '|:| '|entry|
                                                                  (|devaluate|
                                                                   |#1|)))))
                                               (|HasCategory|
                                                (|Record|
                                                 (|:| |key| (|String|))
                                                 (|:| |entry| |#1|))
                                                '(|SetCategory|)))
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|String|))
                                                         (|:| |entry| |#1|))
                                               '(|ConvertibleTo|
                                                 (|InputForm|)))
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               (|HasCategory| |#1|
                                                              '(|SetCategory|)))
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              (|HasCategory| (|String|)
                                                             '(|OrderedSet|))
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|String|))
                                                         (|:| |entry| |#1|))
                                               '(|BasicType|))
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|String|))
                                                         (|:| |entry| |#1|))
                                               '(|OrderedSet|))))))
          (|haddProp| |$ConstructorCache| '|KeyedAccessFile| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 256))
          (AND (LETT #1# (|HasCategory| % '(|finiteAggregate|)))
               (|augmentPredVector| % 512))
          (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
               (|augmentPredVector| % 1024))
          (AND (|HasCategory| |#1| '(|BasicType|)) #1#
               (|augmentPredVector| % 2048))
          (AND #1#
               (|HasCategory|
                (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
                '(|BasicType|))
               (|augmentPredVector| % 4096))
          (AND #1#
               (|HasCategory|
                (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
                '(|OrderedSet|))
               (|augmentPredVector| % 8192))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |car| (|SExpression|))
                              (|:| |cdr| (|SExpression|))))
          (QSETREFV % 8
                    (|Record| (|:| |fileName| (|FileName|))
                              (|:| |fileState| (|BasicKeyedAccessFile|))
                              (|:| |fileIOmode| (|String|))
                              (|:| |rpos| (|Integer|))))
          %))) 

(DEFUN |KeyedAccessFile| (#1=#:G117)
  (SPROG NIL
         (PROG (#2=#:G118)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|KeyedAccessFile|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|KeyedAccessFile;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|KeyedAccessFile|)))))))))) 

(MAKEPROP '|KeyedAccessFile| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Cons| '|Rep| (|Boolean|)
              (|FileName|) (0 . =) |KAFILE;=;2%B;1| (|OutputForm|)
              (6 . |coerce|) |KAFILE;coerce;%Of;2| (|String|)
              |KAFILE;open;FnS%;4| |KAFILE;open;Fn%;3| (11 . |exists?|)
              |KAFILE;reopen!;%S%;5| (|BasicKeyedAccessFile|) (16 . |open|)
              |KAFILE;close!;2%;6| (22 . ~=) (|Void|) (28 . |close!|)
              (33 . |coerce|) (|List| 16) (38 . |keys|) (|Integer|)
              (43 . |elt|) (|None|) (49 . |read|)
              (|Record| (|:| |key| 16) (|:| |entry| 6)) |KAFILE;read!;%R;7|
              (55 . |write!|) |KAFILE;write!;%2R;8| |KAFILE;name;%Fn;9|
              |KAFILE;iomode;%S;10| (62 . |new|) |KAFILE;empty;%;11|
              |KAFILE;keys;%L;12| (|NonNegativeInteger|) |KAFILE;#;%Nni;13|
              |KAFILE;elt;%SEntry;14| |KAFILE;setelt!;%S2Entry;15|
              (69 . |member?|) (|Union| 6 '"failed") |KAFILE;search;S%U;16|
              (75 . |remove!|) |KAFILE;remove!;S%U;17| |KAFILE;pack!;2%;18|
              (|Mapping| 6 6 6) (|List| 34) (|Mapping| 6 6) (|List| 6)
              (|Union| 34 '"failed") (|Mapping| 9 34) (|Mapping| 34 34)
              (|Mapping| 34 34 34) (|List| 62) (|Equation| 6) (|Equation| 34)
              (|List| 63) (|Mapping| 9 6) (|Mapping| 9 6 6) (|Mapping| 9 34 34)
              (|InputForm|))
           '#(~= 81 |write!| 87 |table| 93 |swap!| 102 |size?| 109 |setelt!|
              115 |select!| 122 |select| 128 |search| 134 |sample| 140
              |reopen!| 144 |removeDuplicates| 150 |remove!| 155 |remove| 173
              |reduce| 185 |read!| 206 |qsetelt!| 211 |qelt| 218 |parts| 224
              |pack!| 234 |open| 239 |name| 250 |more?| 255 |minIndex| 261
              |min| 266 |members| 276 |member?| 286 |maxIndex| 298 |max| 303
              |map!| 325 |map| 337 |less?| 356 |latex| 362 |keys| 367 |key?|
              372 |iomode| 378 |inspect| 383 |insert!| 388 |indices| 394
              |index?| 399 |flush| 405 |first| 410 |find| 415 |fill!| 421
              |extract!| 427 |every?| 432 |eval| 444 |eq?| 496 |entry?| 502
              |entries| 508 |empty?| 513 |empty| 518 |elt| 522 |dictionary| 535
              |count| 544 |copy| 568 |convert| 573 |construct| 578 |coerce| 583
              |close!| 588 |any?| 593 = 605 |#| 611)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 0 0 0 0 0 0 0 0 3 1 0 0 0 3 2 1 0 0 0 0 0
                                  0))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |Collection&|
                |IndexedAggregate&| |HomogeneousAggregate&|
                |HomogeneousAggregate&| NIL |Evalable&| |Evalable&|
                |Aggregate&| |EltableAggregate&| |SetCategory&|
                |InnerEvalable&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL
                |BasicType&|)
             (CONS
              '#((|TableAggregate| 16 6) (|KeyedDictionary| 16 6)
                 (|Dictionary| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|BagAggregate| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|Collection| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|IndexedAggregate| 16 6)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|HomogeneousAggregate| 6)
                 (|FileCategory| 10 (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|Evalable| 6)
                 (|Evalable| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|Aggregate|) (|EltableAggregate| 16 6) (|SetCategory|)
                 (|InnerEvalable| 6 6) (|ConvertibleTo| 68)
                 (|InnerEvalable| (|Record| (|:| |key| 16) (|:| |entry| 6))
                                  (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|CoercibleTo| 13) (|Type|) (|shallowlyMutable|)
                 (|Eltable| 16 6) (|finiteAggregate|) (|BasicType|))
              (|makeByteWordVec2| 68
                                  '(2 10 9 0 0 11 1 10 13 0 14 1 10 9 0 19 2 21
                                    0 10 16 22 2 16 9 0 0 24 1 21 25 0 26 1 16
                                    13 0 27 1 21 28 0 29 2 28 16 0 30 31 2 21
                                    32 0 16 33 3 21 25 0 16 32 36 3 10 0 16 16
                                    16 40 2 28 9 16 0 47 2 21 25 0 16 50 2 0 9
                                    0 0 1 2 0 34 0 34 37 1 0 0 54 1 0 0 0 1 3 9
                                    25 0 16 16 1 2 0 9 0 43 1 3 0 6 0 16 6 46 2
                                    10 0 58 0 1 2 10 0 58 0 1 2 0 48 16 0 49 0
                                    0 0 1 2 0 0 0 16 20 1 13 0 0 1 2 0 48 16 0
                                    51 2 13 0 34 0 1 2 10 0 58 0 1 2 13 0 34 0
                                    1 2 10 0 58 0 1 4 13 34 60 0 34 34 1 3 10
                                    34 60 0 34 1 2 10 34 60 0 1 1 0 34 0 35 3 9
                                    6 0 16 6 1 2 0 6 0 16 1 1 10 56 0 1 1 10 54
                                    0 1 1 0 0 0 52 1 0 0 10 18 2 0 0 10 16 17 1
                                    0 10 0 38 2 0 9 0 43 1 1 6 16 0 1 1 11 6 0
                                    1 1 14 34 0 1 1 10 56 0 1 1 10 54 0 1 2 12
                                    9 6 0 1 2 13 9 34 0 1 1 6 16 0 1 1 11 6 0 1
                                    1 14 34 0 1 2 10 6 66 0 1 2 10 34 67 0 1 2
                                    9 0 55 0 1 2 9 0 59 0 1 3 0 0 53 0 0 1 2 0
                                    0 55 0 1 2 0 0 59 0 1 2 0 9 0 43 1 1 0 16 0
                                    1 1 0 28 0 42 2 0 9 16 0 1 1 0 16 0 39 1 0
                                    34 0 1 2 0 0 34 0 1 1 0 28 0 1 2 0 9 16 0 1
                                    1 0 25 0 1 1 6 6 0 1 2 0 57 58 0 1 2 9 0 0
                                    6 1 1 0 34 0 1 2 10 9 65 0 1 2 10 9 58 0 1
                                    2 3 0 0 61 1 3 3 0 0 6 6 1 2 3 0 0 62 1 3 3
                                    0 0 56 56 1 3 1 0 0 34 34 1 3 1 0 0 54 54 1
                                    2 1 0 0 63 1 2 1 0 0 64 1 2 0 9 0 0 1 2 12
                                    9 6 0 1 1 0 56 0 1 1 0 9 0 1 0 0 0 41 3 0 6
                                    0 16 6 1 2 0 6 0 16 45 0 0 0 1 1 0 0 54 1 2
                                    12 43 6 0 1 2 13 43 34 0 1 2 10 43 65 0 1 2
                                    10 43 58 0 1 1 0 0 0 1 1 2 68 0 1 1 0 0 54
                                    1 1 0 13 0 15 1 0 0 0 23 2 10 9 65 0 1 2 10
                                    9 58 0 1 2 0 9 0 0 12 1 10 43 0 44)))))
           '|lookupComplete|)) 
