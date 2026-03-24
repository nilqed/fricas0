
(PUT '|VECTOR;qelt;%IR;1| '|SPADreplace| '(XLAM (|x| |i|) (QAREF1O |x| |i| 1))) 

(SDEFUN |VECTOR;qelt;%IR;1| ((|x| (%)) (|i| (|Integer|)) (% (R)))
        (QAREF1O |x| |i| 1)) 

(PUT '|VECTOR;qsetelt!;%I2R;2| '|SPADreplace|
     '(XLAM (|x| |i| |s|) (QSETAREF1O |x| |i| |s| 1))) 

(SDEFUN |VECTOR;qsetelt!;%I2R;2|
        ((|x| (%)) (|i| (|Integer|)) (|s| (R)) (% (R)))
        (QSETAREF1O |x| |i| |s| 1)) 

(SDEFUN |VECTOR;vector;L%;3| ((|l| (|List| R)) (% (%)))
        (SPADCALL |l| (QREFELT % 11))) 

(SDEFUN |VECTOR;convert;%If;4| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL
         (LIST (SPADCALL '|vector| (QREFELT % 15))
               (SPADCALL (SPADCALL |x| (QREFELT % 16)) (QREFELT % 17)))
         (QREFELT % 19))) 

(DECLAIM (NOTINLINE |Vector;|)) 

(DEFUN |Vector;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G2083 NIL) (#2=#:G2084 NIL) (#3=#:G2085 NIL) (% NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Vector| DV$1))
    (LETT % (GETREFV 38))
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
    (|haddProp| |$ConstructorCache| '|Vector| (LIST DV$1) (CONS 1 %))
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
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV % 20 (CONS (|dispatchFunction| |VECTOR;convert;%If;4|) %))))
    %))) 

(DEFUN |Vector| (#1=#:G2086)
  (SPROG NIL
         (PROG (#2=#:G2087)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Vector|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Vector;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Vector|)))))))))) 

(MAKEPROP '|Vector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedVector| 6 (NRTEVAL 1))
              (|local| |#1|) (|Integer|) |VECTOR;qelt;%IR;1|
              |VECTOR;qsetelt!;%I2R;2| (|List| 6) (0 . |construct|)
              |VECTOR;vector;L%;3| (|Symbol|) (|InputForm|) (5 . |convert|)
              (10 . |parts|) (15 . |convert|) (|List| %) (20 . |convert|)
              (25 . |convert|) (|Boolean|) (|NonNegativeInteger|)
              (|Mapping| 6 6) (|List| 7) (|Union| 6 '"failed") (|Mapping| 21 6)
              (|UniversalSegment| 7) (|Mapping| 6 6 6) (|Mapping| 21 6 6)
              (|HashState|) (|SingleInteger|) (|Equation| 6) (|List| 32)
              (|OutputForm|) (|String|) (|Void|) (|Matrix| 6))
           '#(|vector| 30 |qsetelt!| 35 |qelt| 42 |parts| 48 |convert| 53
              |construct| 58)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 1 0 0 7 0 2 10 9 0 0 3 11 1 13 9 0 0
                                  0 0 0))
            (CONS
             '#(|VectorCategory&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |OrderedSet&| |Collection&|
                |IndexedAggregate&| NIL |HomogeneousAggregate&| |Hashable&|
                |SetCategory&| |Evalable&| |EltableAggregate&| |Aggregate&| NIL
                |BasicType&| |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL
                NIL NIL)
             (CONS
              '#((|VectorCategory| 6) (|OneDimensionalArrayAggregate| 6)
                 (|FiniteLinearAggregate| 6) (|LinearAggregate| 6)
                 (|OrderedSet|) (|Collection| 6) (|IndexedAggregate| 7 6)
                 (|Comparable|) (|HomogeneousAggregate| 6) (|Hashable|)
                 (|SetCategory|) (|Evalable| 6) (|EltableAggregate| 7 6)
                 (|Aggregate|) (|ConvertibleTo| 14) (|BasicType|)
                 (|PartialOrder|) (|CoercibleTo| 34) (|InnerEvalable| 6 6)
                 (|Eltable| 7 6) (|Type|) (|Eltable| 27 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| 22
                                  '(1 0 0 10 11 1 14 0 13 15 1 0 10 0 16 1 10
                                    14 0 17 1 14 0 18 19 1 0 14 0 20 1 0 0 10
                                    12 3 21 6 0 7 6 9 2 0 6 0 7 8 1 22 10 0 16
                                    1 3 14 0 20 1 0 0 10 11)))))
           '|lookupIncomplete|)) 
