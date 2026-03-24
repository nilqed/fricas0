
(SDEFUN |POINT;point;L%;1| ((|l| (|List| R)) (% (%)))
        (SPROG ((#1=#:G6 NIL) (|x| NIL) (|i| NIL) (|pt| (%)))
               (SEQ (LETT |pt| (SPADCALL (LENGTH |l|) 'R (QREFELT % 8)))
                    (SEQ (LETT |i| (SPADCALL |pt| (QREFELT % 10)))
                         (LETT |x| NIL) (LETT #1# |l|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ (EXIT (SPADCALL |pt| |i| |x| (QREFELT % 11))))
                         (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1))))
                         (GO G190) G191 (EXIT NIL))
                    (EXIT |pt|)))) 

(SDEFUN |POINT;dimension;%Pi;2| ((|p| (%)) (% (|PositiveInteger|)))
        (SPROG ((#1=#:G7 NIL))
               (PROG1 (LETT #1# (SPADCALL |p| (QREFELT % 14)))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |POINT;convert;L%;3| ((|l| (|List| R)) (% (%)))
        (SPADCALL |l| (QREFELT % 13))) 

(SDEFUN |POINT;cross;3%;4| ((|p0| (%)) (|p1| (%)) (% (%)))
        (COND
         ((OR (SPADCALL (SPADCALL |p0| (QREFELT % 14)) 3 (QREFELT % 19))
              (SPADCALL (SPADCALL |p1| (QREFELT % 14)) 3 (QREFELT % 19)))
          (|error| "Arguments to cross must be three dimensional"))
         ('T
          (SPADCALL
           (LIST
            (SPADCALL
             (SPADCALL (SPADCALL |p0| 2 (QREFELT % 20))
                       (SPADCALL |p1| 3 (QREFELT % 20)) (QREFELT % 21))
             (SPADCALL (SPADCALL |p1| 2 (QREFELT % 20))
                       (SPADCALL |p0| 3 (QREFELT % 20)) (QREFELT % 21))
             (QREFELT % 22))
            (SPADCALL
             (SPADCALL (SPADCALL |p1| 1 (QREFELT % 20))
                       (SPADCALL |p0| 3 (QREFELT % 20)) (QREFELT % 21))
             (SPADCALL (SPADCALL |p0| 1 (QREFELT % 20))
                       (SPADCALL |p1| 3 (QREFELT % 20)) (QREFELT % 21))
             (QREFELT % 22))
            (SPADCALL
             (SPADCALL (SPADCALL |p0| 1 (QREFELT % 20))
                       (SPADCALL |p1| 2 (QREFELT % 20)) (QREFELT % 21))
             (SPADCALL (SPADCALL |p1| 1 (QREFELT % 20))
                       (SPADCALL |p0| 2 (QREFELT % 20)) (QREFELT % 21))
             (QREFELT % 22)))
           (QREFELT % 13))))) 

(SDEFUN |POINT;extend;%L%;5| ((|p| (%)) (|l| (|List| R)) (% (%)))
        (SPADCALL |p| (SPADCALL |l| (QREFELT % 13)) (QREFELT % 25))) 

(DECLAIM (NOTINLINE |Point;|)) 

(DEFUN |Point;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G22 NIL) (#2=#:G23 NIL) (#3=#:G24 NIL) (% NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Point| DV$1))
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
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #2#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #3#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #1# #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (|HasCategory| |#1|
                                                       '(|AbelianSemiGroup|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiGroup|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1| '(|SemiRng|)))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RadicalCategory|))
                                         (|HasCategory| |#1| '(|Ring|)))))))
    (|haddProp| |$ConstructorCache| '|Point| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 1048576))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2097152))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4194304))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 8388608))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 16777216))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 33554432))
    (AND
     (OR (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 67108864))
    (AND
     (OR (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|)))
         #2#)
     (|augmentPredVector| % 134217728))
    (AND
     (OR #1# (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 268435456))
    (AND (|HasCategory| |#1| '(|Hashable|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 536870912))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (AND #3# (|HasCategory| % '(|finiteAggregate|)))
      (AND (|HasCategory| |#1| '(|Hashable|))
           (|HasCategory| % '(|finiteAggregate|)))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| % '(|finiteAggregate|)))
      #2#)
     (|augmentPredVector| % 1073741824))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |Point| (#1=#:G25)
  (SPROG NIL
         (PROG (#2=#:G26)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Point|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Point;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Point|)))))))))) 

(MAKEPROP '|Point| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Vector| 6) (|local| |#1|)
              (|NonNegativeInteger|) (0 . |new|) (|Integer|) (6 . |minIndex|)
              (11 . |setelt!|) (|List| 6) |POINT;point;L%;1| (18 . |#|)
              (|PositiveInteger|) |POINT;dimension;%Pi;2| |POINT;convert;L%;3|
              (|Boolean|) (23 . ~=) (29 . |elt|) (35 . *) (41 . -) (47 . |One|)
              |POINT;cross;3%;4| (51 . |concat|) |POINT;extend;%L%;5|
              (|Mapping| 6 6) (|List| 9) (|Union| 6 '"failed") (|Mapping| 18 6)
              (|UniversalSegment| 9) (|Mapping| 6 6 6) (|List| %)
              (|Mapping| 18 6 6) (|SingleInteger|) (|HashState|) (|Equation| 6)
              (|List| 37) (|OutputForm|) (|String|) (|Void|) (|InputForm|)
              (|Matrix| 6))
           '#(~= 57 |zero?| 63 |zero| 68 |trim| 73 |swap!| 79 |sorted?| 86
              |sort!| 97 |sort| 108 |smaller?| 119 |size?| 125 |setelt!| 131
              |select| 145 |sample| 151 |rightTrim| 155 |reverse!| 161
              |reverse| 166 |removeDuplicates| 171 |remove| 176 |reduce| 188
              |qsetelt!| 209 |qelt| 216 |position| 222 |point| 241 |parts| 246
              |outerProduct| 251 |new| 257 |more?| 263 |minIndex| 269 |min| 274
              |merge| 285 |members| 298 |member?| 303 |maxIndex| 309 |max| 314
              |map!| 331 |map| 337 |less?| 350 |length| 356 |leftTrim| 361
              |latex| 367 |insert| 372 |indices| 386 |index?| 391 |hashUpdate!|
              397 |hash| 403 |first| 408 |find| 419 |fill!| 425 |extend| 431
              |every?| 437 |eval| 443 |eq?| 469 |entry?| 475 |entries| 481
              |empty?| 486 |empty| 491 |elt| 495 |dot| 514 |dimension| 520
              |delete| 525 |cross| 537 |count| 543 |copyInto!| 555 |copy| 562
              |convert| 567 |construct| 577 |concat| 582 |coerce| 605 |any?|
              610 >= 616 > 622 = 628 <= 634 < 640 - 646 + 657 * 663 |#| 681)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 1 0 0 7 0 2 10 9 0 0 3 11 1 13 9 0
                                  0 0 0 0))
            (CONS
             '#(NIL |VectorCategory&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |OrderedSet&| |Collection&|
                |IndexedAggregate&| NIL |HomogeneousAggregate&| |Hashable&|
                |SetCategory&| |Evalable&| |EltableAggregate&| |Aggregate&| NIL
                |BasicType&| |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL
                NIL NIL)
             (CONS
              '#((|PointCategory| 6) (|VectorCategory| 6)
                 (|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|OrderedSet|) (|Collection| 6)
                 (|IndexedAggregate| 9 6) (|Comparable|)
                 (|HomogeneousAggregate| 6) (|Hashable|) (|SetCategory|)
                 (|Evalable| 6) (|EltableAggregate| 9 6) (|Aggregate|)
                 (|ConvertibleTo| 42) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 39) (|InnerEvalable| 6 6) (|Eltable| 9 6)
                 (|Type|) (|Eltable| 31 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| 43
                                  '(2 0 0 7 6 8 1 0 9 0 10 3 0 6 0 9 6 11 1 0 7
                                    0 14 2 7 18 0 0 19 2 0 6 0 9 20 2 6 0 0 0
                                    21 2 6 0 0 0 22 0 6 0 23 2 0 0 0 0 25 2 31
                                    18 0 0 1 1 15 18 0 1 1 15 0 7 1 2 23 0 0 6
                                    1 3 21 41 0 9 9 1 1 26 18 0 1 2 22 18 34 0
                                    1 2 24 0 34 0 1 1 25 0 0 1 1 26 0 0 1 2 22
                                    0 34 0 1 2 27 18 0 0 1 2 0 18 0 7 1 3 21 6
                                    0 9 6 11 3 21 6 0 31 6 1 2 22 0 30 0 1 0 0
                                    0 1 2 23 0 0 6 1 1 24 0 0 1 1 22 0 0 1 1 23
                                    0 0 1 2 23 0 6 0 1 2 22 0 30 0 1 4 23 6 32
                                    0 6 6 1 2 22 6 32 0 1 3 22 6 32 0 6 1 3 21
                                    6 0 9 6 1 2 0 6 0 9 1 2 23 9 6 0 1 3 23 9 6
                                    0 9 1 2 22 9 30 0 1 1 0 0 12 13 1 22 12 0 1
                                    2 19 43 0 0 1 2 0 0 7 6 8 2 0 18 0 7 1 1 4
                                    9 0 10 1 26 6 0 1 2 26 0 0 0 1 2 26 0 0 0 1
                                    3 22 0 34 0 0 1 1 22 12 0 1 2 23 18 6 0 1 1
                                    4 9 0 1 1 26 6 0 1 2 26 0 0 0 1 2 22 6 34 0
                                    1 2 21 0 27 0 1 2 0 0 27 0 1 3 0 0 32 0 0 1
                                    2 0 18 0 7 1 1 20 6 0 1 2 23 0 0 6 1 1 28
                                    40 0 1 3 0 0 6 0 9 1 3 0 0 0 0 9 1 1 0 28 0
                                    1 2 0 18 9 0 1 2 30 36 36 0 1 1 30 35 0 1 2
                                    0 0 0 7 1 1 4 6 0 1 2 0 29 30 0 1 2 21 0 0
                                    6 1 2 0 0 0 12 26 2 22 18 30 0 1 2 9 0 0 37
                                    1 2 9 0 0 38 1 3 9 0 0 6 6 1 3 9 0 0 12 12
                                    1 2 0 18 0 0 1 2 23 18 6 0 1 1 0 12 0 1 1 0
                                    18 0 1 0 0 0 1 3 0 6 0 9 6 1 2 0 6 0 9 20 2
                                    0 0 0 31 1 2 18 6 0 0 1 1 0 15 0 16 2 0 0 0
                                    31 1 2 0 0 0 9 1 2 0 0 0 0 24 2 23 7 6 0 1
                                    2 22 7 30 0 1 3 24 0 0 0 9 1 1 0 0 0 1 1 0
                                    0 12 17 1 3 42 0 1 1 0 0 12 1 2 0 0 6 0 1 2
                                    0 0 0 6 1 2 0 0 0 0 25 1 0 0 33 1 1 29 39 0
                                    1 2 22 18 30 0 1 2 26 18 0 0 1 2 26 18 0 0
                                    1 2 31 18 0 0 1 2 26 18 0 0 1 2 26 18 0 0 1
                                    2 16 0 0 0 1 1 16 0 0 1 2 14 0 0 0 1 2 16 0
                                    9 0 1 2 17 0 6 0 1 2 17 0 0 6 1 1 22 7 0
                                    14)))))
           '|lookupComplete|)) 
