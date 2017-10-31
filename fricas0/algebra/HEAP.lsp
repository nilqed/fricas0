
(SDEFUN |HEAP;empty;$;1| (($ $)) (SPADCALL (QREFELT $ 8))) 

(SDEFUN |HEAP;heap;L$;2| ((|l| |List| S) ($ $)) (SPADCALL |l| (QREFELT $ 11))) 

(SDEFUN |HEAP;siftUp| ((|r| $) (|i| |Integer|) (|n| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G709 NIL) (|j| #2=(|Integer|)) (|k| #2#) (|t| (S)))
               (SEQ
                (LETT |t| (SPADCALL |r| |i| (QREFELT $ 14))
                      . #3=(|HEAP;siftUp|))
                (EXIT
                 (SEQ
                  (EXIT
                   (SEQ G190
                        (COND
                         ((NULL
                           (<
                            (LETT |j| (+ (SPADCALL 2 |i| (QREFELT $ 16)) 1)
                                  . #3#)
                            |n|))
                          (GO G191)))
                        (SEQ
                         (SEQ (LETT |k| (+ |j| 1) . #3#)
                              (EXIT
                               (COND
                                ((< |k| |n|)
                                 (COND
                                  ((SPADCALL (SPADCALL |r| |j| (QREFELT $ 14))
                                             (SPADCALL |r| |k| (QREFELT $ 14))
                                             (QREFELT $ 18))
                                   (LETT |j| |k| . #3#)))))))
                         (EXIT
                          (COND
                           ((SPADCALL |t| (SPADCALL |r| |j| (QREFELT $ 14))
                                      (QREFELT $ 18))
                            (SEQ
                             (SPADCALL |r| |i|
                                       (SPADCALL |r| |j| (QREFELT $ 14))
                                       (QREFELT $ 19))
                             (SPADCALL |r| |j| |t| (QREFELT $ 19))
                             (EXIT (LETT |i| |j| . #3#))))
                           ('T
                            (PROGN
                             (LETT #1# |$NoValue| . #3#)
                             (GO #4=#:G706))))))
                        NIL (GO G190) G191 (EXIT NIL)))
                  #4# (EXIT #1#)))))) 

(SDEFUN |HEAP;extract!;$S;4| ((|r| $) ($ S))
        (SPROG ((|t| (S)) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |r| (QREFELT $ 21))
                      . #1=(|HEAP;extract!;$S;4|))
                (EXIT
                 (COND ((EQL |n| 0) (|error| "empty heap"))
                       (#2='T
                        (SEQ (LETT |t| (SPADCALL |r| 0 (QREFELT $ 14)) . #1#)
                             (SPADCALL |r| 0
                                       (SPADCALL |r| (- |n| 1) (QREFELT $ 14))
                                       (QREFELT $ 19))
                             (SPADCALL |r| (- |n| 1) (QREFELT $ 22))
                             (EXIT
                              (COND ((EQL |n| 1) |t|)
                                    (#2#
                                     (SEQ (|HEAP;siftUp| |r| 0 (- |n| 1) $)
                                          (EXIT |t|)))))))))))) 

(SDEFUN |HEAP;insert!;S2$;5| ((|x| S) (|r| $) ($ $))
        (SPROG ((|j| (|Integer|)) (#1=#:G719 NIL) (|i| (|Integer|)))
               (SEQ
                (LETT |j| (SPADCALL |r| (QREFELT $ 21))
                      . #2=(|HEAP;insert!;S2$;5|))
                (LETT |r|
                      (SPADCALL |r|
                                (SPADCALL |x| (SPADCALL (QREFELT $ 8))
                                          (QREFELT $ 24))
                                (QREFELT $ 25))
                      . #2#)
                (SEQ
                 (EXIT
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL |j| 0 (QREFELT $ 26))) (GO G191)))
                       (SEQ (LETT |i| (QUOTIENT2 (- |j| 1) 2) . #2#)
                            (COND
                             ((SPADCALL (SPADCALL |r| |i| (QREFELT $ 14)) |x|
                                        (QREFELT $ 27))
                              (PROGN
                               (LETT #1# |$NoValue| . #2#)
                               (GO #3=#:G716))))
                            (SPADCALL |r| |j| (SPADCALL |r| |i| (QREFELT $ 14))
                                      (QREFELT $ 19))
                            (EXIT (LETT |j| |i| . #2#)))
                       NIL (GO G190) G191 (EXIT NIL)))
                 #3# (EXIT #1#))
                (SPADCALL |r| |j| |x| (QREFELT $ 19)) (EXIT |r|)))) 

(SDEFUN |HEAP;max;$S;6| ((|r| $) ($ S))
        (COND ((EQL (SPADCALL |r| (QREFELT $ 21)) 0) (|error| "empty heap"))
              ('T (SPADCALL |r| 0 (QREFELT $ 14))))) 

(SDEFUN |HEAP;inspect;$S;7| ((|r| $) ($ S)) (SPADCALL |r| (QREFELT $ 29))) 

(SDEFUN |HEAP;makeHeap| ((|r| $) ($ $))
        (SPROG ((|k| NIL) (|n| (|NonNegativeInteger|)))
               (SEQ
                (LETT |n| (SPADCALL |r| (QREFELT $ 21)) . #1=(|HEAP;makeHeap|))
                (SEQ (LETT |k| (- (QUOTIENT2 |n| 2) 1) . #1#) G190
                     (COND ((< |k| 0) (GO G191)))
                     (SEQ (EXIT (|HEAP;siftUp| |r| |k| |n| $)))
                     (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT |r|)))) 

(SDEFUN |HEAP;construct;L$;9| ((|l| |List| S) ($ $))
        (|HEAP;makeHeap| (SPADCALL |l| (QREFELT $ 31)) $)) 

(SDEFUN |HEAP;merge;3$;10| ((|a| $) (|b| $) ($ $))
        (|HEAP;makeHeap| (SPADCALL |a| |b| (QREFELT $ 32)) $)) 

(SDEFUN |HEAP;merge!;3$;11| ((|a| $) (|b| $) ($ $))
        (|HEAP;makeHeap| (SPADCALL |a| |b| (QREFELT $ 25)) $)) 

(DECLAIM (NOTINLINE |Heap;|)) 

(DEFUN |Heap| (#1=#:G740)
  (SPROG NIL
         (PROG (#2=#:G741)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Heap|)
                                               '|domainEqualList|)
                    . #3=(|Heap|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Heap;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Heap|)))))))))) 

(DEFUN |Heap;| (|#1|)
  (SPROG
   ((#1=#:G739 NIL) (|pv$| NIL) (#2=#:G736 NIL) (#3=#:G737 NIL) (#4=#:G738 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|Heap|))
    (LETT |dv$| (LIST '|Heap| DV$1) . #5#)
    (LETT $ (GETREFV 46) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #5#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #4#)
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              . #5#)
                                        (OR #3# #4#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #5#)
                                        (OR #2#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #4#))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|Heap| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 128))
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 256))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #5#)
     (|augmentPredVector| $ 512))
    (AND (OR #1# #4#) (|augmentPredVector| $ 1024))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|IndexedFlexibleArray| |#1| 0))
    $))) 

(MAKEPROP '|Heap| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedFlexibleArray| 6 (NRTEVAL 0))
              (|local| |#1|) '|Rep| (0 . |empty|) |HEAP;empty;$;1| (|List| 6)
              |HEAP;construct;L$;9| |HEAP;heap;L$;2| (|Integer|) (4 . |elt|)
              (|PositiveInteger|) (10 . *) (|Boolean|) (16 . <)
              (22 . |setelt!|) (|NonNegativeInteger|) (29 . |#|)
              (34 . |delete!|) |HEAP;extract!;$S;4| (40 . |concat|)
              (46 . |concat!|) (52 . >) (58 . >=) |HEAP;insert!;S2$;5|
              |HEAP;max;$S;6| |HEAP;inspect;$S;7| (64 . |construct|)
              (69 . |concat|) |HEAP;merge;3$;10| |HEAP;merge!;3$;11|
              (|Mapping| 6 6 6) (|List| 37) (|Equation| 6) (|Mapping| 17 6)
              (|Mapping| 6 6) (|OutputForm|) (|InputForm|) (|HashState|)
              (|SingleInteger|) (|String|) (|Union| 6 '"failed"))
           '#(~= 75 |size?| 81 |select| 87 |sample| 93 |removeDuplicates| 97
              |remove| 102 |reduce| 114 |parts| 135 |more?| 140 |merge!| 146
              |merge| 152 |members| 158 |member?| 163 |max| 169 |map!| 174
              |map| 180 |less?| 186 |latex| 192 |inspect| 197 |insert!| 202
              |heap| 208 |hashUpdate!| 213 |hash| 219 |find| 224 |extract!| 230
              |every?| 235 |eval| 241 |eq?| 267 |empty?| 273 |empty| 278
              |count| 282 |copy| 294 |convert| 299 |construct| 304 |coerce| 309
              |any?| 314 = 320 |#| 326)
           'NIL
           (CONS (|makeByteWordVec2| 7 '(0 0 0 0 0 2 1 0 0 0 2 5 7 3))
                 (CONS
                  '#(NIL |BagAggregate&| |Collection&| |HomogeneousAggregate&|
                     |Aggregate&| |Evalable&| |SetCategory&| NIL NIL NIL
                     |InnerEvalable&| |BasicType&| NIL NIL)
                  (CONS
                   '#((|PriorityQueueAggregate| 6) (|BagAggregate| 6)
                      (|Collection| 6) (|HomogeneousAggregate| 6) (|Aggregate|)
                      (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 40)
                      (|ConvertibleTo| 41))
                   (|makeByteWordVec2| 45
                                       '(0 7 0 8 2 7 6 0 13 14 2 13 0 15 0 16 2
                                         6 17 0 0 18 3 7 6 0 13 6 19 1 0 20 0
                                         21 2 7 0 0 13 22 2 7 0 6 0 24 2 7 0 0
                                         0 25 2 13 17 0 0 26 2 6 17 0 0 27 1 7
                                         0 10 31 2 7 0 0 0 32 2 11 17 0 0 1 2 0
                                         17 0 20 1 2 9 0 38 0 1 0 0 0 1 1 10 0
                                         0 1 2 10 0 6 0 1 2 9 0 38 0 1 4 10 6
                                         35 0 6 6 1 3 9 6 35 0 6 1 2 9 6 35 0 1
                                         1 9 10 0 1 2 0 17 0 20 1 2 0 0 0 0 34
                                         2 0 0 0 0 33 1 9 10 0 1 2 10 17 6 0 1
                                         1 0 6 0 29 2 8 0 39 0 1 2 0 0 39 0 1 2
                                         0 17 0 20 1 1 1 44 0 1 1 0 6 0 30 2 0
                                         0 6 0 28 1 0 0 10 12 2 1 42 42 0 1 1 1
                                         43 0 1 2 0 45 38 0 1 1 0 6 0 23 2 9 17
                                         38 0 1 3 2 0 0 10 10 1 3 2 0 0 6 6 1 2
                                         2 0 0 36 1 2 2 0 0 37 1 2 0 17 0 0 1 1
                                         0 17 0 1 0 0 0 9 2 10 20 6 0 1 2 9 20
                                         38 0 1 1 0 0 0 1 1 3 41 0 1 1 0 0 10
                                         11 1 6 40 0 1 2 9 17 38 0 1 2 11 17 0
                                         0 1 1 9 20 0 21)))))
           '|lookupComplete|)) 
