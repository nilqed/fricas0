
(PUT '|IARRAY1;#;%Nni;1| '|SPADreplace| 'QVSIZE) 

(SDEFUN |IARRAY1;#;%Nni;1| ((|x| (%)) (% (|NonNegativeInteger|))) (QVSIZE |x|)) 

(SDEFUN |IARRAY1;fill!;%S%;2| ((|x| (%)) (|s| (S)) (% (%)))
        (SPROG ((#1=#:G881 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (QVMAXINDEX |x|)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (QSETVELT |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |IARRAY1;minIndex;%I;3| ((|x| (%)) (% (|Integer|))) (QREFELT % 7)) 

(PUT '|IARRAY1;empty;%;4| '|SPADreplace| '(XLAM NIL (MAKE-ARRAY 0))) 

(SDEFUN |IARRAY1;empty;%;4| ((% (%))) (MAKE-ARRAY 0)) 

(PUT '|IARRAY1;new;NniS%;5| '|SPADreplace| 'MAKEARR1) 

(SDEFUN |IARRAY1;new;NniS%;5| ((|n| (|NonNegativeInteger|)) (|s| (S)) (% (%)))
        (MAKEARR1 |n| |s|)) 

(SDEFUN |IARRAY1;map!;M2%;6| ((|f| (|Mapping| S S)) (|s1| (%)) (% (%)))
        (SPROG ((#1=#:G891 NIL) (|i| NIL) (|n| (|Integer|)))
               (SEQ (LETT |n| (QVMAXINDEX |s1|))
                    (EXIT
                     (COND ((< |n| 0) |s1|)
                           ('T
                            (SEQ
                             (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (QSETVELT |s1| |i|
                                              (SPADCALL (QAREF1 |s1| |i|)
                                                        |f|))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT |s1|)))))))) 

(SDEFUN |IARRAY1;map;M2%;7| ((|f| (|Mapping| S S)) (|s1| (%)) (% (%)))
        (SPROG ((#1=#:G897 NIL) (|i| NIL) (|ss2| (%)) (|n| (|Integer|)))
               (SEQ (LETT |n| (QVMAXINDEX |s1|))
                    (EXIT
                     (COND ((< |n| 0) |s1|)
                           ('T
                            (SEQ (LETT |ss2| (MAKE-ARRAY (+ |n| 1)))
                                 (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (QSETVELT |ss2| |i|
                                                  (SPADCALL (QAREF1 |s1| |i|)
                                                            |f|))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT |ss2|)))))))) 

(SDEFUN |IARRAY1;map;M3%;8|
        ((|f| (|Mapping| S S S)) (|a| (%)) (|b| (%)) (% (%)))
        (SPROG ((#1=#:G904 NIL) (|i| NIL) (|c| (%)) (|maxind| (|Integer|)))
               (SEQ (LETT |maxind| (MIN (QVMAXINDEX |a|) (QVMAXINDEX |b|)))
                    (EXIT
                     (COND ((< |maxind| 0) (SPADCALL (QREFELT % 13)))
                           ('T
                            (SEQ (LETT |c| (MAKE-ARRAY (+ |maxind| 1)))
                                 (SEQ (LETT |i| 0) (LETT #1# |maxind|) G190
                                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (QSETVELT |c| |i|
                                                  (SPADCALL (QAREF1 |a| |i|)
                                                            (QAREF1 |b| |i|)
                                                            |f|))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT |c|)))))))) 

(SDEFUN |IARRAY1;hashUpdate!;Hs%Hs;9|
        ((|s| (|HashState|)) (|x| (%)) (% (|HashState|)))
        (SPROG ((#1=#:G909 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (QVMAXINDEX |x|)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |s|
                             (SPADCALL |s| (QAREF1 |x| |i|) (QREFELT % 21)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(PUT '|IARRAY1;qelt;%IS;10| '|SPADreplace| 'QAREF1) 

(SDEFUN |IARRAY1;qelt;%IS;10| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (QAREF1 |x| |i|)) 

(PUT '|IARRAY1;qsetelt!;%I2S;11| '|SPADreplace| 'QSETVELT) 

(SDEFUN |IARRAY1;qsetelt!;%I2S;11|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S))) (QSETVELT |x| |i| |s|)) 

(SDEFUN |IARRAY1;elt;%IS;12| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (COND
         ((OR (MINUSP |i|) (> |i| (SPADCALL |x| (QREFELT % 26))))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| (QREFELT % 24))))) 

(SDEFUN |IARRAY1;setelt!;%I2S;13|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S)))
        (COND
         ((OR (MINUSP |i|) (> |i| (SPADCALL |x| (QREFELT % 26))))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| |s| (QREFELT % 25))))) 

(PUT '|IARRAY1;maxIndex;%I;14| '|SPADreplace| 'QVSIZE) 

(SDEFUN |IARRAY1;maxIndex;%I;14| ((|x| (%)) (% (|Integer|))) (QVSIZE |x|)) 

(SDEFUN |IARRAY1;qelt;%IS;15| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (QAREF1 |x| (- |i| 1))) 

(SDEFUN |IARRAY1;qsetelt!;%I2S;16|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S)))
        (QSETVELT |x| (- |i| 1) |s|)) 

(SDEFUN |IARRAY1;elt;%IS;17| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (COND
         ((OR (|less_SI| |i| 1) (|less_SI| (QVSIZE |x|) |i|))
          (|error| "index out of range"))
         ('T (QAREF1 |x| (- |i| 1))))) 

(SDEFUN |IARRAY1;setelt!;%I2S;18|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S)))
        (COND
         ((OR (|less_SI| |i| 1) (|less_SI| (QVSIZE |x|) |i|))
          (|error| "index out of range"))
         ('T (QSETVELT |x| (- |i| 1) |s|)))) 

(SDEFUN |IARRAY1;qelt;%IS;19| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (QAREF1 |x| (- |i| (QREFELT % 7)))) 

(SDEFUN |IARRAY1;qsetelt!;%I2S;20|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S)))
        (QSETVELT |x| (- |i| (QREFELT % 7)) |s|)) 

(SDEFUN |IARRAY1;elt;%IS;21| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (COND
         ((OR (< |i| (QREFELT % 7)) (> |i| (SPADCALL |x| (QREFELT % 26))))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| (QREFELT % 24))))) 

(SDEFUN |IARRAY1;setelt!;%I2S;22|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S)))
        (COND
         ((OR (< |i| (QREFELT % 7)) (> |i| (SPADCALL |x| (QREFELT % 26))))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| |s| (QREFELT % 25))))) 

(DECLAIM (NOTINLINE |IndexedOneDimensionalArray;|)) 

(DEFUN |IndexedOneDimensionalArray;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G944 NIL) (#2=#:G945 NIL) (#3=#:G946 NIL) (% NIL)
    (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT |dv$| (LIST '|IndexedOneDimensionalArray| DV$1 DV$2))
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
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|IndexedOneDimensionalArray|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
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
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV % 22
                (CONS (|dispatchFunction| |IARRAY1;hashUpdate!;Hs%Hs;9|) %))))
    (QSETREFV % 23 (ZEROP |#2|))
    (COND
     ((QREFELT % 23)
      (PROGN
       (QSETREFV % 24 (CONS (|dispatchFunction| |IARRAY1;qelt;%IS;10|) %))
       (QSETREFV % 25 (CONS (|dispatchFunction| |IARRAY1;qsetelt!;%I2S;11|) %))
       (QSETREFV % 27 (CONS (|dispatchFunction| |IARRAY1;elt;%IS;12|) %))
       (QSETREFV % 28
                 (CONS (|dispatchFunction| |IARRAY1;setelt!;%I2S;13|) %))))
     ((EQL |#2| 1)
      (PROGN
       (QSETREFV % 26 (CONS (|dispatchFunction| |IARRAY1;maxIndex;%I;14|) %))
       (QSETREFV % 24 (CONS (|dispatchFunction| |IARRAY1;qelt;%IS;15|) %))
       (QSETREFV % 25 (CONS (|dispatchFunction| |IARRAY1;qsetelt!;%I2S;16|) %))
       (QSETREFV % 27 (CONS (|dispatchFunction| |IARRAY1;elt;%IS;17|) %))
       (QSETREFV % 28
                 (CONS (|dispatchFunction| |IARRAY1;setelt!;%I2S;18|) %))))
     ('T
      (PROGN
       (QSETREFV % 24 (CONS (|dispatchFunction| |IARRAY1;qelt;%IS;19|) %))
       (QSETREFV % 25 (CONS (|dispatchFunction| |IARRAY1;qsetelt!;%I2S;20|) %))
       (QSETREFV % 27 (CONS (|dispatchFunction| |IARRAY1;elt;%IS;21|) %))
       (QSETREFV % 28
                 (CONS (|dispatchFunction| |IARRAY1;setelt!;%I2S;22|) %)))))
    %))) 

(DEFUN |IndexedOneDimensionalArray| (&REST #1=#:G947)
  (SPROG NIL
         (PROG (#2=#:G948)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedOneDimensionalArray|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedOneDimensionalArray;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|IndexedOneDimensionalArray|)))))))))) 

(MAKEPROP '|IndexedOneDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) |IARRAY1;#;%Nni;1| |IARRAY1;fill!;%S%;2|
              (|Integer|) |IARRAY1;minIndex;%I;3| |IARRAY1;empty;%;4|
              |IARRAY1;new;NniS%;5| (|Mapping| 6 6) |IARRAY1;map!;M2%;6|
              |IARRAY1;map;M2%;7| (|Mapping| 6 6 6) |IARRAY1;map;M3%;8|
              (|HashState|) (0 . |hashUpdate!|) (6 . |hashUpdate!|) '#:G875
              (12 . |qelt|) (18 . |qsetelt!|) (25 . |maxIndex|) (30 . |elt|)
              (36 . |setelt!|) (|Boolean|) (|List| 6) (|List| 11)
              (|Union| 6 '"failed") (|Mapping| 29 6) (|UniversalSegment| 11)
              (|List| %) (|Mapping| 29 6 6) (|SingleInteger|) (|Equation| 6)
              (|List| 38) (|OutputForm|) (|String|) (|Void|) (|InputForm|))
           '#(~= 43 |trim| 49 |swap!| 55 |sorted?| 62 |sort!| 73 |sort| 84
              |smaller?| 95 |size?| 101 |setelt!| 107 |select| 121 |sample| 127
              |rightTrim| 131 |reverse!| 137 |reverse| 142 |removeDuplicates|
              147 |remove| 152 |reduce| 164 |qsetelt!| 185 |qelt| 192
              |position| 198 |parts| 217 |new| 222 |more?| 228 |minIndex| 234
              |min| 239 |merge| 250 |members| 263 |member?| 268 |maxIndex| 274
              |max| 279 |map!| 296 |map| 302 |less?| 315 |leftTrim| 321 |latex|
              327 |insert| 332 |indices| 346 |index?| 351 |hashUpdate!| 357
              |hash| 363 |first| 368 |find| 379 |fill!| 385 |every?| 391 |eval|
              397 |eq?| 423 |entry?| 429 |entries| 435 |empty?| 440 |empty| 445
              |elt| 449 |delete| 468 |count| 480 |copyInto!| 492 |copy| 499
              |convert| 504 |construct| 509 |concat| 514 |coerce| 537 |any?|
              542 >= 548 > 554 = 560 <= 566 < 572 |#| 578)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 1 0 0 7 0 2 10 9 0 0 3 11 1 13 9 0 0 0
                                  0 0))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL |LinearAggregate&|
                |OrderedSet&| |Collection&| |IndexedAggregate&| NIL
                |HomogeneousAggregate&| |Hashable&| |SetCategory&| |Evalable&|
                |EltableAggregate&| |Aggregate&| NIL |BasicType&|
                |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|OrderedSet|) (|Collection| 6)
                 (|IndexedAggregate| 11 6) (|Comparable|)
                 (|HomogeneousAggregate| 6) (|Hashable|) (|SetCategory|)
                 (|Evalable| 6) (|EltableAggregate| 11 6) (|Aggregate|)
                 (|ConvertibleTo| 43) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 40) (|InnerEvalable| 6 6) (|Eltable| 11 6)
                 (|Type|) (|Eltable| 34 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| 43
                                  '(2 6 20 20 0 21 2 0 20 20 0 22 2 0 6 0 11 24
                                    3 0 6 0 11 6 25 1 0 11 0 26 2 0 6 0 11 27 3
                                    0 6 0 11 6 28 2 24 29 0 0 1 2 16 0 0 6 1 3
                                    14 42 0 11 11 1 1 19 29 0 1 2 15 29 36 0 1
                                    2 17 0 36 0 1 1 18 0 0 1 1 19 0 0 1 2 15 0
                                    36 0 1 2 20 29 0 0 1 2 0 29 0 8 1 3 14 6 0
                                    11 6 28 3 14 6 0 34 6 1 2 15 0 33 0 1 0 0 0
                                    1 2 16 0 0 6 1 1 17 0 0 1 1 15 0 0 1 1 16 0
                                    0 1 2 16 0 6 0 1 2 15 0 33 0 1 4 16 6 18 0
                                    6 6 1 3 15 6 18 0 6 1 2 15 6 18 0 1 3 14 6
                                    0 11 6 25 2 0 6 0 11 24 3 16 11 6 0 11 1 2
                                    16 11 6 0 1 2 15 11 33 0 1 1 15 30 0 1 2 0
                                    0 8 6 14 2 0 29 0 8 1 1 4 11 0 12 1 19 6 0
                                    1 2 19 0 0 0 1 2 19 0 0 0 1 3 15 0 36 0 0 1
                                    1 15 30 0 1 2 16 29 6 0 1 1 4 11 0 26 1 19
                                    6 0 1 2 19 0 0 0 1 2 15 6 36 0 1 2 14 0 15
                                    0 16 2 0 0 15 0 17 3 0 0 18 0 0 19 2 0 29 0
                                    8 1 2 16 0 0 6 1 1 21 41 0 1 3 0 0 6 0 11 1
                                    3 0 0 0 0 11 1 1 0 31 0 1 2 0 29 11 0 1 2
                                    23 20 20 0 22 1 23 37 0 1 2 0 0 0 8 1 1 4 6
                                    0 1 2 0 32 33 0 1 2 14 0 0 6 10 2 15 29 33
                                    0 1 2 9 0 0 38 1 2 9 0 0 39 1 3 9 0 0 30 30
                                    1 3 9 0 0 6 6 1 2 0 29 0 0 1 2 16 29 6 0 1
                                    1 0 30 0 1 1 0 29 0 1 0 0 0 13 3 0 6 0 11 6
                                    1 2 0 6 0 11 27 2 0 0 0 34 1 2 0 0 0 11 1 2
                                    0 0 0 34 1 2 16 8 6 0 1 2 15 8 33 0 1 3 17
                                    0 0 0 11 1 1 0 0 0 1 1 3 43 0 1 1 0 0 30 1
                                    2 0 0 0 6 1 2 0 0 0 0 1 2 0 0 6 0 1 1 0 0
                                    35 1 1 22 40 0 1 2 15 29 33 0 1 2 19 29 0 0
                                    1 2 19 29 0 0 1 2 24 29 0 0 1 2 19 29 0 0 1
                                    2 19 29 0 0 1 1 15 8 0 9)))))
           '|lookupComplete|)) 
