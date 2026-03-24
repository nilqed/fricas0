
(DECLAIM (NOTINLINE |FlexibleArray;|)) 

(DEFUN |FlexibleArray;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G7 NIL) (#2=#:G8 NIL) (#3=#:G9 NIL) (% NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|FlexibleArray| DV$1))
    (LETT % (GETREFV 27))
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
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|FlexibleArray| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 8192))
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 16384))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 32768))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 65536))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 131072))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 262144))
    (AND
     (OR (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 524288))
    (AND
     (OR (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|)))
         #2#)
     (|augmentPredVector| % 1048576))
    (AND
     (OR #1# (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 2097152))
    (AND (|HasCategory| |#1| '(|Hashable|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4194304))
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
     (|augmentPredVector| % 8388608))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |FlexibleArray| (#1=#:G10)
  (SPROG NIL
         (PROG (#2=#:G11)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FlexibleArray|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FlexibleArray;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FlexibleArray|)))))))))) 

(MAKEPROP '|FlexibleArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedFlexibleArray| 6 (NRTEVAL 1))
              (|local| |#1|) (|Boolean|) (|NonNegativeInteger|) (|Mapping| 6 6)
              (|Integer|) (|List| 6) (|List| 10) (|Union| 6 '"failed")
              (|Mapping| 7 6) (|UniversalSegment| 10) (|List| %)
              (|Mapping| 6 6 6) (|Mapping| 7 6 6) (|HashState|)
              (|SingleInteger|) (|Equation| 6) (|List| 21) (|OutputForm|)
              (|String|) (|Void|) (|InputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 1 0 0 7 0 2 10 9 0 0 3 11 1 13 9 0 0
                                  0 0 0))
            (CONS
             '#(|OneDimensionalArrayAggregate&| |ExtensibleLinearAggregate&|
                NIL |LinearAggregate&| |OrderedSet&| |Collection&|
                |IndexedAggregate&| NIL |HomogeneousAggregate&| |Hashable&|
                |SetCategory&| |Evalable&| |EltableAggregate&| |Aggregate&| NIL
                |BasicType&| |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL
                NIL NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|OrderedSet|) (|Collection| 6)
                 (|IndexedAggregate| 10 6) (|Comparable|)
                 (|HomogeneousAggregate| 6) (|Hashable|) (|SetCategory|)
                 (|Evalable| 6) (|EltableAggregate| 10 6) (|Aggregate|)
                 (|ConvertibleTo| 26) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 23) (|InnerEvalable| 6 6) (|Eltable| 10 6)
                 (|Type|) (|Eltable| 15 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
