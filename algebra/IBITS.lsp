
(SDEFUN |IBITS;minIndex;$I;1| ((|u| $) ($ |Integer|)) (QREFELT $ 6)) 

(SDEFUN |IBITS;range| ((|v| $) (|i| |Integer|) ($ |Integer|))
        (SEQ
         (COND
          ((>= |i| 0)
           (COND ((< |i| (SPADCALL |v| (QREFELT $ 10))) (EXIT |i|)))))
         (EXIT (|error| "Index out of range")))) 

(SDEFUN |IBITS;coerce;$Of;3| ((|v| $) ($ |OutputForm|))
        (SPROG
         ((#1=#:G711 NIL) (|i| NIL) (|j| NIL) (|s| (|String|))
          (|f| #2=(|Character|)) (|t| #2#))
         (SEQ (LETT |t| (|STR_to_CHAR| "1") . #3=(|IBITS;coerce;$Of;3|))
              (LETT |f| (|STR_to_CHAR| "0") . #3#)
              (LETT |s|
                    (|make_full_CVEC| (SPADCALL |v| (QREFELT $ 10))
                                      (STR_ELT "   " 0))
                    . #3#)
              (SEQ (LETT |j| (QREFELT $ 6) . #3#)
                   (LETT |i| (SPADCALL |s| (QREFELT $ 12)) . #3#)
                   (LETT #1# (SPADCALL |s| (QREFELT $ 13)) . #3#) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |s| |i|
                               (COND ((SPADCALL |v| |j| (QREFELT $ 15)) |t|)
                                     ('T |f|))
                               (QREFELT $ 17))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |s| (QREFELT $ 19)))))) 

(SDEFUN |IBITS;new;NniB$;4| ((|n| |NonNegativeInteger|) (|b| |Boolean|) ($ $))
        (|make_BVEC| |n| (|bool_to_bit| |b|))) 

(PUT '|IBITS;empty;$;5| '|SPADreplace| '(XLAM NIL (|make_BVEC| 0 0))) 

(SDEFUN |IBITS;empty;$;5| (($ $)) (|make_BVEC| 0 0)) 

(PUT '|IBITS;copy;2$;6| '|SPADreplace| '|copy_BVEC|) 

(SDEFUN |IBITS;copy;2$;6| ((|v| $) ($ $)) (|copy_BVEC| |v|)) 

(PUT '|IBITS;#;$Nni;7| '|SPADreplace| '|size_BVEC|) 

(SDEFUN |IBITS;#;$Nni;7| ((|v| $) ($ |NonNegativeInteger|)) (|size_BVEC| |v|)) 

(PUT '|IBITS;=;2$B;8| '|SPADreplace| '|equal_BVEC|) 

(SDEFUN |IBITS;=;2$B;8| ((|v| $) (|u| $) ($ |Boolean|)) (|equal_BVEC| |v| |u|)) 

(PUT '|IBITS;<;2$B;9| '|SPADreplace| '(XLAM (|v| |u|) (|greater_BVEC| |u| |v|))) 

(SDEFUN |IBITS;<;2$B;9| ((|v| $) (|u| $) ($ |Boolean|))
        (|greater_BVEC| |u| |v|)) 

(SDEFUN |IBITS;and;3$;10| ((|u| $) (|v| $) ($ $))
        (COND
         ((EQL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10)))
          (|and_BVEC| |v| |u|))
         ('T (SPADCALL (ELT $ 26) |v| |u| (QREFELT $ 28))))) 

(SDEFUN |IBITS;or;3$;11| ((|u| $) (|v| $) ($ $))
        (COND
         ((EQL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10)))
          (|or_BVEC| |v| |u|))
         ('T (SPADCALL (ELT $ 30) |v| |u| (QREFELT $ 28))))) 

(SDEFUN |IBITS;xor;3$;12| ((|v| $) (|u| $) ($ $))
        (COND
         ((EQL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10)))
          (|xor_BVEC| |v| |u|))
         ('T (SPADCALL (ELT $ 32) |v| |u| (QREFELT $ 28))))) 

(SDEFUN |IBITS;setelt!;$I2B;13|
        ((|v| $) (|i| |Integer|) (|f| . #1=(|Boolean|)) ($ . #1#))
        (SETELT_BVEC |v| (|IBITS;range| |v| (- |i| (QREFELT $ 6)) $)
                     (|bool_to_bit| |f|))) 

(SDEFUN |IBITS;elt;$IB;14| ((|v| $) (|i| |Integer|) ($ |Boolean|))
        (|bit_to_bool|
         (ELT_BVEC |v| (|IBITS;range| |v| (- |i| (QREFELT $ 6)) $)))) 

(PUT '|IBITS;Not;2$;15| '|SPADreplace| '|not_BVEC|) 

(SDEFUN |IBITS;Not;2$;15| ((|v| $) ($ $)) (|not_BVEC| |v|)) 

(SDEFUN |IBITS;And;3$;16| ((|u| $) (|v| $) ($ $))
        (COND
         ((EQL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10)))
          (|and_BVEC| |v| |u|))
         ('T (SPADCALL (ELT $ 26) |v| |u| (QREFELT $ 28))))) 

(SDEFUN |IBITS;Or;3$;17| ((|u| $) (|v| $) ($ $))
        (COND
         ((EQL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10)))
          (|or_BVEC| |v| |u|))
         ('T (SPADCALL (ELT $ 30) |v| |u| (QREFELT $ 28))))) 

(DECLAIM (NOTINLINE |IndexedBits;|)) 

(DEFUN |IndexedBits| (#1=#:G750)
  (SPROG NIL
         (PROG (#2=#:G751)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedBits|)
                                               '|domainEqualList|)
                    . #3=(|IndexedBits|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IndexedBits;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedBits|)))))))))) 

(DEFUN |IndexedBits;| (|#1|)
  (SPROG ((#1=#:G749 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|IndexedBits|))
          (LETT |dv$| (LIST '|IndexedBits| DV$1) . #2#)
          (LETT $ (GETREFV 50) . #2#)
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
          (|haddProp| |$ConstructorCache| '|IndexedBits| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
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

(MAKEPROP '|IndexedBits| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              |IBITS;minIndex;$I;1| (|NonNegativeInteger|) |IBITS;#;$Nni;7|
              (|String|) (0 . |minIndex|) (5 . |maxIndex|) (|Boolean|)
              |IBITS;elt;$IB;14| (|Character|) (10 . |setelt!|) (|OutputForm|)
              (17 . |coerce|) |IBITS;coerce;$Of;3| |IBITS;new;NniB$;4|
              |IBITS;empty;$;5| |IBITS;copy;2$;6| |IBITS;=;2$B;8|
              |IBITS;<;2$B;9| (22 . |and|) (|Mapping| 14 14 14) (28 . |map|)
              |IBITS;and;3$;10| (35 . |or|) |IBITS;or;3$;11| (41 . |xor|)
              |IBITS;xor;3$;12| |IBITS;setelt!;$I2B;13| |IBITS;Not;2$;15|
              |IBITS;And;3$;16| |IBITS;Or;3$;17| (|Equation| 14) (|List| 38)
              (|List| 14) (|InputForm|) (|Mapping| 14 14) (|Void|)
              (|UniversalSegment| 7) (|List| 7) (|Union| 14 '"failed")
              (|List| $) (|HashState|) (|SingleInteger|))
           '#(~= 47 ~ 53 |xor| 58 |true| 64 |trim| 68 |swap!| 74 |sorted?| 81
              |sort!| 92 |sort| 103 |smaller?| 114 |size?| 120 |setelt!| 126
              |select| 140 |sample| 146 |rightTrim| 150 |reverse!| 156
              |reverse| 161 |removeDuplicates| 166 |remove| 171 |reduce| 183
              |qsetelt!| 204 |qelt| 211 |position| 217 |parts| 236 |or| 241
              |not| 247 |nor| 252 |new| 258 |nand| 264 |more?| 270 |minIndex|
              276 |min| 281 |merge| 287 |members| 300 |member?| 305 |maxIndex|
              311 |max| 316 |map!| 322 |map| 328 |less?| 341 |leftTrim| 347
              |latex| 353 |insert| 358 |indices| 372 |index?| 377 |hashUpdate!|
              383 |hash| 389 |first| 394 |find| 405 |fill!| 411 |false| 417
              |every?| 421 |eval| 427 |eq?| 453 |entry?| 459 |entries| 465
              |empty?| 470 |empty| 475 |elt| 479 |delete| 498 |count| 510
              |copyInto!| 522 |copy| 529 |convert| 534 |construct| 539 |concat|
              544 |coerce| 567 |any?| 572 |and| 578 |_\|_| 584 |\\/| 588 T$ 594
              |Or| 598 |Not| 604 |And| 609 >= 615 > 621 = 627 <= 633 < 639
              |/\\| 645 |#| 651)
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
              '#((|BitAggregate|) (|OneDimensionalArrayAggregate| 14) (|Logic|)
                 (|FiniteLinearAggregate| 14) (|BoundedDistributiveLattice|)
                 (|LinearAggregate| 14) (|DistributiveLattice|)
                 (|BoundedLattice|) (|OrderedSet|) (|Collection| 14)
                 (|IndexedAggregate| 7 14) (|Lattice|)
                 (|BoundedJoinSemilattice|) (|BoundedMeetSemilattice|)
                 (|Comparable|) (|HomogeneousAggregate| 14) (|JoinSemilattice|)
                 (|MeetSemilattice|) (|EltableAggregate| 7 14) (|Aggregate|)
                 (|SetCategory|) (|Evalable| 14) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Eltable| 44 $$) (|Eltable| 7 14)
                 (|Type|) (|BasicType|) (|PartialOrder|) (|CoercibleTo| 18)
                 (|InnerEvalable| 14 14) (|ConvertibleTo| 41))
              (|makeByteWordVec2| 49
                                  '(1 11 7 0 12 1 11 7 0 13 3 11 16 0 7 16 17 1
                                    11 18 0 19 2 14 0 0 0 26 3 0 0 27 0 0 28 2
                                    14 0 0 0 30 2 14 0 0 0 32 2 0 14 0 0 1 1 0
                                    0 0 1 2 0 0 0 0 33 0 0 0 1 2 11 0 0 14 1 3
                                    6 43 0 7 7 1 1 10 14 0 1 2 7 14 27 0 1 1 8
                                    0 0 1 2 9 0 27 0 1 1 10 0 0 1 2 7 0 27 0 1
                                    2 0 14 0 0 1 2 0 14 0 9 1 3 6 14 0 7 14 34
                                    3 6 14 0 44 14 1 2 7 0 42 0 1 0 0 0 1 2 11
                                    0 0 14 1 1 9 0 0 1 1 7 0 0 1 1 11 0 0 1 2
                                    11 0 14 0 1 2 7 0 42 0 1 4 11 14 27 0 14 14
                                    1 3 7 14 27 0 14 1 2 7 14 27 0 1 3 6 14 0 7
                                    14 1 2 0 14 0 7 1 2 11 7 14 0 1 3 11 7 14 0
                                    7 1 2 7 7 42 0 1 1 7 40 0 1 2 0 0 0 0 31 1
                                    0 0 0 1 2 0 0 0 0 1 2 0 0 9 14 21 2 0 0 0 0
                                    1 2 0 14 0 9 1 1 4 7 0 8 2 0 0 0 0 1 2 10 0
                                    0 0 1 3 7 0 27 0 0 1 1 7 40 0 1 2 11 14 14
                                    0 1 1 4 7 0 1 2 0 0 0 0 1 2 6 0 42 0 1 2 0
                                    0 42 0 1 3 0 0 27 0 0 28 2 0 14 0 9 1 2 11
                                    0 0 14 1 1 0 11 0 1 3 0 0 14 0 7 1 3 0 0 0
                                    0 7 1 1 0 45 0 1 2 0 14 7 0 1 2 0 48 48 0 1
                                    1 0 49 0 1 1 4 14 0 1 2 0 0 0 9 1 2 0 46 42
                                    0 1 2 6 0 0 14 1 0 0 0 1 2 7 14 42 0 1 2 1
                                    0 0 38 1 2 1 0 0 39 1 3 1 0 0 14 14 1 3 1 0
                                    0 40 40 1 2 0 14 0 0 1 2 11 14 14 0 1 1 0
                                    40 0 1 1 0 14 0 1 0 0 0 22 3 0 14 0 7 14 1
                                    2 0 14 0 7 15 2 0 0 0 44 1 2 0 0 0 7 1 2 0
                                    0 0 44 1 2 11 9 14 0 1 2 7 9 42 0 1 3 9 0 0
                                    0 7 1 1 0 0 0 23 1 2 41 0 1 1 0 0 40 1 2 0
                                    0 0 14 1 2 0 0 14 0 1 1 0 0 47 1 2 0 0 0 0
                                    1 1 0 18 0 20 2 7 14 42 0 1 2 0 0 0 0 29 0
                                    0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 0 0 0 37 1 0
                                    0 0 35 2 0 0 0 0 36 2 0 14 0 0 1 2 0 14 0 0
                                    1 2 0 14 0 0 24 2 0 14 0 0 1 2 0 14 0 0 25
                                    2 0 0 0 0 1 1 7 9 0 10)))))
           '|lookupComplete|)) 
