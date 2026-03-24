
(DECLAIM (NOTINLINE |SortedExponentVector;|)) 

(DEFUN |SortedExponentVector;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G2796 NIL) (#2=#:G2795 NIL) (#3=#:G2794 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|SortedExponentVector|))
    (LETT % (GETREFV 25))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Integer|)
                                                       '(|Hashable|))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| (|Integer|)
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| (|Integer|)
                                                        '(|Evalable|
                                                          (|Integer|)))
                                         #2#)
                                        (OR #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|BasicType|))
                                         #1#
                                         (|HasCategory| (|Integer|)
                                                        '(|Hashable|))
                                         (|HasCategory| (|Integer|)
                                                        '(|OrderedSet|))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| (|Integer|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #3# #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|))
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|SortedExponentVector| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 4096))
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 8192))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|BasicType|))
         (|augmentPredVector| % 16384))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 32768))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| % 65536))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| % 131072))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|))))
     (|augmentPredVector| % 262144))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| % 524288))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #3#)
     (|augmentPredVector| % 1048576))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|Hashable|))
         (|augmentPredVector| % 2097152))
    (AND
     (OR
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|BasicType|)))
      (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|Hashable|)))
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|OrderedSet|)))
      #2#)
     (|augmentPredVector| % 4194304))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |SortedExponentVector| ()
  (SPROG NIL
         (PROG (#1=#:G2798)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SortedExponentVector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SortedExponentVector|
                             (LIST
                              (CONS NIL (CONS 1 (|SortedExponentVector;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|SortedExponentVector|)))))))))) 

(MAKEPROP '|SortedExponentVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|U32Vector|) (|Boolean|)
              (|NonNegativeInteger|) (|Mapping| 9 9) (|Integer|) (|List| 9)
              (|Union| 9 '"failed") (|Mapping| 6 9) (|UniversalSegment| 9)
              (|List| %) (|Mapping| 9 9 9) (|Mapping| 6 9 9) (|HashState|)
              (|SingleInteger|) (|Equation| 9) (|List| 19) (|OutputForm|)
              (|String|) (|Void|) (|InputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 1 0 0 6 0 2 9 8 0 0 3 10 1 12 8 0 0 0 0
                                  0))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL |LinearAggregate&|
                |OrderedSet&| |Collection&| |IndexedAggregate&| NIL
                |HomogeneousAggregate&| |Hashable&| |SetCategory&| |Evalable&|
                |EltableAggregate&| |Aggregate&| NIL |BasicType&|
                |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 9) (|FiniteLinearAggregate| 9)
                 (|LinearAggregate| 9) (|OrderedSet|) (|Collection| 9)
                 (|IndexedAggregate| 9 9) (|Comparable|)
                 (|HomogeneousAggregate| 9) (|Hashable|) (|SetCategory|)
                 (|Evalable| 9) (|EltableAggregate| 9 9) (|Aggregate|)
                 (|ConvertibleTo| 24) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 21) (|InnerEvalable| 9 9) (|Eltable| 9 9)
                 (|Type|) (|Eltable| 13 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
