
(PUT '|ARRAY2;qelt;%2IR;1| '|SPADreplace|
     '(XLAM (|m| |i| |j|) (QAREF2O |m| |i| |j| 1 1))) 

(SDEFUN |ARRAY2;qelt;%2IR;1| ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (% (R)))
        (QAREF2O |m| |i| |j| 1 1)) 

(PUT '|ARRAY2;qsetelt!;%2I2R;2| '|SPADreplace|
     '(XLAM (|m| |i| |j| |r|) (QSETAREF2O |m| |i| |j| |r| 1 1))) 

(SDEFUN |ARRAY2;qsetelt!;%2I2R;2|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (|r| (R)) (% (R)))
        (QSETAREF2O |m| |i| |j| |r| 1 1)) 

(DECLAIM (NOTINLINE |TwoDimensionalArray;|)) 

(DEFUN |TwoDimensionalArray;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G2232 NIL) (#2=#:G2233 NIL) (% NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|TwoDimensionalArray| DV$1))
    (LETT % (GETREFV 32))
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
    (|haddProp| |$ConstructorCache| '|TwoDimensionalArray| (LIST DV$1)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
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

(DEFUN |TwoDimensionalArray| (#1=#:G2235)
  (SPROG NIL
         (PROG (#2=#:G2236)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TwoDimensionalArray|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|TwoDimensionalArray;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TwoDimensionalArray|)))))))))) 

(MAKEPROP '|TwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerIndexedTwoDimensionalArray| 6 (NRTEVAL 1) (NRTEVAL 1) 14
                                                 14)
              (|local| |#1|) (|Integer|) |ARRAY2;qelt;%2IR;1|
              |ARRAY2;qsetelt!;%2I2R;2| (|Boolean|) (|NonNegativeInteger|)
              (|Mapping| 6 6) (|List| 15) (|OneDimensionalArray| 6) (|List| 6)
              (|List| 7) (|Segment| 7) (|List| 17) (|List| %)
              (|PositiveInteger|) (|List| 19) (|List| 11) (|Mapping| 6 6 6)
              (|List| 25) (|Equation| 6) (|Mapping| 10 6) (|Mapping| 10 6 6)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|))
           '#(|qsetelt!| 0 |qelt| 8) 'NIL
           (CONS (|makeByteWordVec2| 11 '(0 1 0 2 6 9 0 7 11 9 0 0 0))
                 (CONS
                  '#(|TwoDimensionalArrayCategory&| NIL |HomogeneousAggregate&|
                     |Hashable&| |SetCategory&| |Evalable&| |Aggregate&|
                     |BasicType&| NIL |InnerEvalable&| NIL NIL NIL)
                  (CONS
                   '#((|TwoDimensionalArrayCategory| 6
                                                     (|OneDimensionalArray| 6)
                                                     (|OneDimensionalArray| 6))
                      (|Comparable|) (|HomogeneousAggregate| 6) (|Hashable|)
                      (|SetCategory|) (|Evalable| 6) (|Aggregate|)
                      (|BasicType|) (|CoercibleTo| 28) (|InnerEvalable| 6 6)
                      (|shallowlyMutable|) (|finiteAggregate|) (|Type|))
                   (|makeByteWordVec2| 9 '(4 0 6 0 7 7 6 9 3 0 6 0 7 7 8)))))
           '|lookupIncomplete|)) 
