
(DECLAIM (NOTINLINE |IndexedTwoDimensionalArray;|)) 

(DEFUN |IndexedTwoDimensionalArray;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G4 NIL) (#2=#:G5 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|IndexedTwoDimensionalArray| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 33))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#1| '(|Comparable|))
                                         #2#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            (|HasCategory| |#1|
                                                           '(|Comparable|))
                                            (|HasCategory| |#1| '(|Hashable|))
                                            #2#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #2#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#1| '(|Comparable|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          #2#))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #2#))))))
    (|haddProp| |$ConstructorCache| '|IndexedTwoDimensionalArray|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 2048))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 4096))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 8192))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (|HasCategory| |#1| '(|Hashable|)) #2#)
     (|augmentPredVector| % 16384))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |IndexedTwoDimensionalArray| (&REST #1=#:G7)
  (SPROG NIL
         (PROG (#2=#:G8)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache| '|IndexedTwoDimensionalArray|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedTwoDimensionalArray;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|IndexedTwoDimensionalArray|)))))))))) 

(MAKEPROP '|IndexedTwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerIndexedTwoDimensionalArray| 6 (NRTEVAL (QREFELT % 7))
                                                 (NRTEVAL (QREFELT % 8)) 15 14)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|Boolean|)
              (|NonNegativeInteger|) (|Mapping| 6 6) (|List| 16) (|Integer|)
              (|IndexedOneDimensionalArray| 6 (NRTEVAL (QREFELT % 7)))
              (|IndexedOneDimensionalArray| 6 (NRTEVAL (QREFELT % 8)))
              (|List| 6) (|List| 13) (|Segment| 13) (|List| 18) (|List| %)
              (|PositiveInteger|) (|List| 20) (|List| 10) (|Mapping| 6 6 6)
              (|List| 26) (|Equation| 6) (|Mapping| 9 6) (|Mapping| 9 6 6)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 11 '(0 1 0 2 6 9 0 7 11 9 0 0 0))
                 (CONS
                  '#(|TwoDimensionalArrayCategory&| NIL |HomogeneousAggregate&|
                     |Hashable&| |SetCategory&| |Evalable&| |Aggregate&|
                     |BasicType&| NIL |InnerEvalable&| NIL NIL NIL)
                  (CONS
                   '#((|TwoDimensionalArrayCategory| 6
                                                     (|IndexedOneDimensionalArray|
                                                      6 8)
                                                     (|IndexedOneDimensionalArray|
                                                      6 7))
                      (|Comparable|) (|HomogeneousAggregate| 6) (|Hashable|)
                      (|SetCategory|) (|Evalable| 6) (|Aggregate|)
                      (|BasicType|) (|CoercibleTo| 29) (|InnerEvalable| 6 6)
                      (|shallowlyMutable|) (|finiteAggregate|) (|Type|))
                   (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
