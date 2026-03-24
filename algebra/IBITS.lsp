
(SDEFUN |IBITS;minIndex;%I;1| ((|u| (%)) (% (|Integer|))) (QREFELT % 6)) 

(SDEFUN |IBITS;range| ((|v| (%)) (|i| (|Integer|)) (% (|Integer|)))
        (SEQ
         (COND
          ((>= |i| 0)
           (COND ((< |i| (SPADCALL |v| (QREFELT % 10))) (EXIT |i|)))))
         (EXIT (|error| "Index out of range")))) 

(SDEFUN |IBITS;coerce;%Of;3| ((|v| (%)) (% (|OutputForm|)))
        (SPROG
         ((#1=#:G16 NIL) (|i| NIL) (|j| NIL) (|s| (|String|))
          (|f| #2=(|Character|)) (|t| #2#))
         (SEQ (LETT |t| (|STR_to_CHAR| "1")) (LETT |f| (|STR_to_CHAR| "0"))
              (LETT |s|
                    (|make_string_code| (SPADCALL |v| (QREFELT % 10))
                                        (SPADCALL (QREFELT % 12))))
              (SEQ (LETT |j| (QREFELT % 6))
                   (LETT |i| (SPADCALL |s| (QREFELT % 14)))
                   (LETT #1# (SPADCALL |s| (QREFELT % 15))) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |s| |i|
                               (COND ((SPADCALL |v| |j| (QREFELT % 17)) |t|)
                                     ('T |f|))
                               (QREFELT % 18))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (SPADCALL |s| (QREFELT % 20)))))) 

(SDEFUN |IBITS;new;NniB%;4|
        ((|n| (|NonNegativeInteger|)) (|b| (|Boolean|)) (% (%)))
        (|make_BVEC| |n| (|bool_to_bit| |b|))) 

(PUT '|IBITS;empty;%;5| '|SPADreplace| '(XLAM NIL (|make_BVEC| 0 0))) 

(SDEFUN |IBITS;empty;%;5| ((% (%))) (|make_BVEC| 0 0)) 

(PUT '|IBITS;copy;2%;6| '|SPADreplace| '|copy_BVEC|) 

(SDEFUN |IBITS;copy;2%;6| ((|v| (%)) (% (%))) (|copy_BVEC| |v|)) 

(PUT '|IBITS;#;%Nni;7| '|SPADreplace| '|size_BVEC|) 

(SDEFUN |IBITS;#;%Nni;7| ((|v| (%)) (% (|NonNegativeInteger|)))
        (|size_BVEC| |v|)) 

(PUT '|IBITS;=;2%B;8| '|SPADreplace| '|equal_BVEC|) 

(SDEFUN |IBITS;=;2%B;8| ((|v| (%)) (|u| (%)) (% (|Boolean|)))
        (|equal_BVEC| |v| |u|)) 

(PUT '|IBITS;<;2%B;9| '|SPADreplace| '(XLAM (|v| |u|) (|greater_BVEC| |u| |v|))) 

(SDEFUN |IBITS;<;2%B;9| ((|v| (%)) (|u| (%)) (% (|Boolean|)))
        (|greater_BVEC| |u| |v|)) 

(SDEFUN |IBITS;and;3%;10| ((|u| (%)) (|v| (%)) (% (%)))
        (COND
         ((EQL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10)))
          (|and_BVEC| |v| |u|))
         ('T (SPADCALL (ELT % 27) |v| |u| (QREFELT % 29))))) 

(SDEFUN |IBITS;or;3%;11| ((|u| (%)) (|v| (%)) (% (%)))
        (COND
         ((EQL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10)))
          (|or_BVEC| |v| |u|))
         ('T (SPADCALL (ELT % 31) |v| |u| (QREFELT % 29))))) 

(SDEFUN |IBITS;xor;3%;12| ((|v| (%)) (|u| (%)) (% (%)))
        (COND
         ((EQL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10)))
          (|xor_BVEC| |v| |u|))
         ('T (SPADCALL (ELT % 33) |v| |u| (QREFELT % 29))))) 

(SDEFUN |IBITS;setelt!;%I2B;13|
        ((|v| (%)) (|i| (|Integer|)) (|f| #1=(|Boolean|)) (% #1#))
        (SETELT_BVEC |v| (|IBITS;range| |v| (- |i| (QREFELT % 6)) %)
                     (|bool_to_bit| |f|))) 

(SDEFUN |IBITS;elt;%IB;14| ((|v| (%)) (|i| (|Integer|)) (% (|Boolean|)))
        (|bit_to_bool|
         (ELT_BVEC |v| (|IBITS;range| |v| (- |i| (QREFELT % 6)) %)))) 

(PUT '|IBITS;Not;2%;15| '|SPADreplace| '|not_BVEC|) 

(SDEFUN |IBITS;Not;2%;15| ((|v| (%)) (% (%))) (|not_BVEC| |v|)) 

(SDEFUN |IBITS;And;3%;16| ((|u| (%)) (|v| (%)) (% (%)))
        (COND
         ((EQL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10)))
          (|and_BVEC| |v| |u|))
         ('T (SPADCALL (ELT % 27) |v| |u| (QREFELT % 29))))) 

(SDEFUN |IBITS;Or;3%;17| ((|u| (%)) (|v| (%)) (% (%)))
        (COND
         ((EQL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10)))
          (|or_BVEC| |v| |u|))
         ('T (SPADCALL (ELT % 31) |v| |u| (QREFELT % 29))))) 

(DECLAIM (NOTINLINE |IndexedBits;|)) 

(DEFUN |IndexedBits;| (|#1|)
  (SPROG ((#1=#:G50 NIL) (|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|IndexedBits| DV$1))
          (LETT % (GETREFV 51))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
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
                                                             '(|Hashable|))
                                              (|HasCategory| (|Boolean|)
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| (|Boolean|)
                                                             '(|OrderedSet|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedSet|))
                                              (|HasCategory| (|Boolean|)
                                                             '(|BasicType|))))))
          (|haddProp| |$ConstructorCache| '|IndexedBits| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 64))
          (AND (LETT #1# (|HasCategory| % '(|finiteAggregate|)))
               (|augmentPredVector| % 128))
          (AND #1# (|HasCategory| (|Boolean|) '(|Hashable|))
               (|augmentPredVector| % 256))
          (AND #1# (|HasCategory| % '(|shallowlyMutable|))
               (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| % 512))
          (AND #1# (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 1024))
          (AND #1# (|HasCategory| (|Boolean|) '(|BasicType|))
               (|augmentPredVector| % 2048))
          (AND #1# (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| % 4096))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |IndexedBits| (#1=#:G51)
  (SPROG NIL
         (PROG (#2=#:G52)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedBits|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IndexedBits;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedBits|)))))))))) 

(MAKEPROP '|IndexedBits| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              |IBITS;minIndex;%I;1| (|NonNegativeInteger|) |IBITS;#;%Nni;7|
              (|Character|) (0 . |space|) (|String|) (4 . |minIndex|)
              (9 . |maxIndex|) (|Boolean|) |IBITS;elt;%IB;14| (14 . |setelt!|)
              (|OutputForm|) (21 . |coerce|) |IBITS;coerce;%Of;3|
              |IBITS;new;NniB%;4| |IBITS;empty;%;5| |IBITS;copy;2%;6|
              |IBITS;=;2%B;8| |IBITS;<;2%B;9| (26 . |and|) (|Mapping| 16 16 16)
              (32 . |map|) |IBITS;and;3%;10| (39 . |or|) |IBITS;or;3%;11|
              (45 . |xor|) |IBITS;xor;3%;12| |IBITS;setelt!;%I2B;13|
              |IBITS;Not;2%;15| |IBITS;And;3%;16| |IBITS;Or;3%;17|
              (|UniversalSegment| 7) (|List| %) (|List| 16)
              (|Union| 16 '"failed") (|Mapping| 16 16) (|List| 7) (|HashState|)
              (|SingleInteger|) (|Equation| 16) (|List| 47) (|Void|)
              (|InputForm|))
           '#(~= 51 ~ 57 |xor| 62 |true| 68 |trim| 72 |swap!| 78 |sorted?| 85
              |sort!| 96 |sort| 107 |smaller?| 118 |size?| 124 |setelt!| 130
              |select| 144 |sample| 150 |rightTrim| 154 |reverse!| 160
              |reverse| 165 |removeDuplicates| 170 |remove| 175 |reduce| 187
              |qsetelt!| 208 |qelt| 215 |position| 221 |parts| 240 |or| 245
              |not| 251 |nor| 256 |new| 262 |nand| 268 |more?| 274 |minIndex|
              280 |min| 285 |merge| 296 |members| 309 |member?| 314 |maxIndex|
              320 |max| 325 |map!| 342 |map| 348 |less?| 361 |leftTrim| 367
              |latex| 373 |insert| 378 |indices| 392 |index?| 397 |hashUpdate!|
              403 |hash| 409 |first| 414 |find| 425 |fill!| 431 |false| 437
              |every?| 441 |eval| 447 |eq?| 473 |entry?| 479 |entries| 485
              |empty?| 490 |empty| 495 |elt| 499 |delete| 518 |count| 530
              |copyInto!| 542 |copy| 549 |convert| 554 |construct| 559 |concat|
              564 |coerce| 587 |any?| 592 |and| 598 |_\|_| 604 |\\/| 608 T$ 614
              |Or| 618 |Not| 624 |And| 629 >= 635 > 641 = 647 <= 653 < 659
              |/\\| 665 |#| 671)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 0 0 0
                                  3 1 0 0 0 0 0 0 0 0))
            (CONS
             '#(|BitAggregate&| |Logic&| |OneDimensionalArrayAggregate&| NIL
                NIL NIL NIL |LinearAggregate&| NIL NIL NIL |IndexedAggregate&|
                |Collection&| |OrderedSet&| NIL NIL |HomogeneousAggregate&| NIL
                |Hashable&| |Evalable&| |SetCategory&| |Aggregate&|
                |EltableAggregate&| NIL |InnerEvalable&| NIL |PartialOrder&|
                |BasicType&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|BitAggregate|) (|Logic|) (|OneDimensionalArrayAggregate| 16)
                 (|BoundedDistributiveLattice|) (|FiniteLinearAggregate| 16)
                 (|BoundedLattice|) (|DistributiveLattice|)
                 (|LinearAggregate| 16) (|BoundedMeetSemilattice|)
                 (|BoundedJoinSemilattice|) (|Lattice|)
                 (|IndexedAggregate| 7 16) (|Collection| 16) (|OrderedSet|)
                 (|MeetSemilattice|) (|JoinSemilattice|)
                 (|HomogeneousAggregate| 16) (|Comparable|) (|Hashable|)
                 (|Evalable| 16) (|SetCategory|) (|Aggregate|)
                 (|EltableAggregate| 7 16) (|ConvertibleTo| 50)
                 (|InnerEvalable| 16 16) (|CoercibleTo| 19) (|PartialOrder|)
                 (|BasicType|) (|Type|) (|Eltable| 7 16) (|Eltable| 39 $$)
                 (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| 50
                                  '(0 11 0 12 1 13 7 0 14 1 13 7 0 15 3 13 11 0
                                    7 11 18 1 13 19 0 20 2 16 0 0 0 27 3 0 0 28
                                    0 0 29 2 16 0 0 0 31 2 16 0 0 0 33 2 0 16 0
                                    0 1 1 0 0 0 1 2 0 0 0 0 34 0 0 0 1 2 12 0 0
                                    16 1 3 7 49 0 7 7 1 1 13 16 0 1 2 8 16 28 0
                                    1 2 11 0 28 0 1 1 10 0 0 1 1 13 0 0 1 2 8 0
                                    28 0 1 2 0 16 0 0 1 2 0 16 0 9 1 3 7 16 0
                                    39 16 1 3 7 16 0 7 16 35 2 8 0 43 0 1 0 0 0
                                    1 2 12 0 0 16 1 1 11 0 0 1 1 8 0 0 1 1 12 0
                                    0 1 2 12 0 16 0 1 2 8 0 43 0 1 4 12 16 28 0
                                    16 16 1 2 8 16 28 0 1 3 8 16 28 0 16 1 3 7
                                    16 0 7 16 1 2 0 16 0 7 1 3 12 7 16 0 7 1 2
                                    12 7 16 0 1 2 8 7 43 0 1 1 8 41 0 1 2 0 0 0
                                    0 32 1 0 0 0 1 2 0 0 0 0 1 2 0 0 9 16 22 2
                                    0 0 0 0 1 2 0 16 0 9 1 1 5 7 0 8 2 0 0 0 0
                                    1 1 13 16 0 1 2 13 0 0 0 1 3 8 0 28 0 0 1 1
                                    8 41 0 1 2 12 16 16 0 1 1 5 7 0 1 2 0 0 0 0
                                    1 1 13 16 0 1 2 8 16 28 0 1 2 7 0 43 0 1 3
                                    0 0 28 0 0 29 2 0 0 43 0 1 2 0 16 0 9 1 2
                                    12 0 0 16 1 1 0 13 0 1 3 0 0 16 0 7 1 3 0 0
                                    0 0 7 1 1 0 44 0 1 2 0 16 7 0 1 2 9 45 45 0
                                    1 1 9 46 0 1 2 0 0 0 9 1 1 5 16 0 1 2 0 42
                                    43 0 1 2 7 0 0 16 1 0 0 0 1 2 8 16 43 0 1 3
                                    1 0 0 41 41 1 2 1 0 0 47 1 3 1 0 0 16 16 1
                                    2 1 0 0 48 1 2 0 16 0 0 1 2 12 16 16 0 1 1
                                    0 41 0 1 1 0 16 0 1 0 0 0 23 2 0 0 0 39 1 2
                                    0 16 0 7 17 3 0 16 0 7 16 1 2 0 0 0 7 1 2 0
                                    0 0 39 1 2 12 9 16 0 1 2 8 9 43 0 1 3 11 0
                                    0 0 7 1 1 0 0 0 24 1 3 50 0 1 1 0 0 41 1 1
                                    0 0 40 1 2 0 0 16 0 1 2 0 0 0 0 1 2 0 0 0
                                    16 1 1 0 19 0 21 2 8 16 43 0 1 2 0 0 0 0 30
                                    0 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 0 0 0 38 1
                                    0 0 0 36 2 0 0 0 0 37 2 0 16 0 0 1 2 0 16 0
                                    0 1 2 0 16 0 0 25 2 0 16 0 0 1 2 0 16 0 0
                                    26 2 0 0 0 0 1 1 8 9 0 10)))))
           '|lookupComplete|)) 
