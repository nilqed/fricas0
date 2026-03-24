
(SDEFUN |STACK;=;2%B;1| ((|s| (%)) (|t| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |s| (QREFELT % 9)) (SPADCALL |t| (QREFELT % 9))
                  (QREFELT % 11))) 

(SDEFUN |STACK;parts;%L;2| ((|s| (%)) (% (|List| S)))
        (SPADCALL |s| (QREFELT % 9))) 

(SDEFUN |STACK;map;M2%;3| ((|f| (|Mapping| S S)) (|s| (%)) (% (%)))
        (SPADCALL (SPADCALL |f| (SPADCALL |s| (QREFELT % 9)) (QREFELT % 15))
                  (QREFELT % 16))) 

(SDEFUN |STACK;map!;M2%;4| ((|f| (|Mapping| S S)) (|s| (%)) (% (%)))
        (SEQ
         (SPADCALL |s|
                   (SPADCALL |f| (SPADCALL |s| (QREFELT % 9)) (QREFELT % 18))
                   (QREFELT % 19))
         (EXIT |s|))) 

(SDEFUN |STACK;copy;2%;5| ((|s| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT % 9)) (QREFELT % 21))
                  (QREFELT % 16))) 

(SDEFUN |STACK;#;%Nni;6| ((|s| (%)) (% (|NonNegativeInteger|)))
        (LENGTH (SPADCALL |s| (QREFELT % 9)))) 

(SDEFUN |STACK;pop!;%S;7| ((|s| (%)) (% (S)))
        (SPROG ((|e| (S)))
               (SEQ
                (COND ((SPADCALL |s| (QREFELT % 25)) (|error| "empty stack"))
                      ('T
                       (SEQ
                        (LETT |e| (|SPADfirst| (SPADCALL |s| (QREFELT % 9))))
                        (SPADCALL |s| (CDR (SPADCALL |s| (QREFELT % 9)))
                                  (QREFELT % 19))
                        (EXIT |e|))))))) 

(SDEFUN |STACK;extract!;%S;8| ((|s| (%)) (% (S))) (SPADCALL |s| (QREFELT % 26))) 

(SDEFUN |STACK;top;%S;9| ((|s| (%)) (% (S)))
        (COND ((SPADCALL |s| (QREFELT % 25)) (|error| "empty stack"))
              ('T (|SPADfirst| (SPADCALL |s| (QREFELT % 9)))))) 

(SDEFUN |STACK;inspect;%S;10| ((|s| (%)) (% (S))) (SPADCALL |s| (QREFELT % 28))) 

(SDEFUN |STACK;push!;S%S;11| ((|e| (S)) (|s| (%)) (% (S)))
        (SEQ
         (SPADCALL |s| (CONS |e| (SPADCALL |s| (QREFELT % 9))) (QREFELT % 19))
         (EXIT |e|))) 

(SDEFUN |STACK;insert!;S2%;12| ((|e| (S)) (|s| (%)) (% (%)))
        (SEQ (SPADCALL |e| |s| (QREFELT % 30)) (EXIT |s|))) 

(SDEFUN |STACK;empty;%;13| ((% (%))) (SPADCALL NIL (QREFELT % 16))) 

(SDEFUN |STACK;empty?;%B;14| ((|s| (%)) (% (|Boolean|)))
        (NULL (SPADCALL |s| (QREFELT % 9)))) 

(SDEFUN |STACK;construct;L%;15| ((|s| (|List| S)) (% (%)))
        (SPADCALL (SPADCALL |s| (QREFELT % 21)) (QREFELT % 16))) 

(SDEFUN |STACK;stack;L%;16| ((|s| (|List| S)) (% (%)))
        (SPADCALL |s| (QREFELT % 33))) 

(SDEFUN |STACK;hashUpdate!;Hs%Hs;17|
        ((|st| #1=(|HashState|)) (|s| (%)) (% #1#))
        (SPADCALL |st| (SPADCALL |s| (QREFELT % 9)) (QREFELT % 36))) 

(DECLAIM (NOTINLINE |Stack;|)) 

(DEFUN |Stack;| (|#1|)
  (SPROG
   ((#1=#:G36 NIL) (|pv$| NIL) (#2=#:G33 NIL) (#3=#:G34 NIL) (#4=#:G35 NIL)
    (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Stack| DV$1))
    (LETT % (GETREFV 48))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #4#)
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #3#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #4#))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|)))
                                        (OR #2#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            #4#)))))
    (|haddProp| |$ConstructorCache| '|Stack| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 512))
    (AND (LETT #1# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 1024))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #1# (|augmentPredVector| % 2048))
    (AND #2# #1# (|augmentPredVector| % 4096))
    (AND (OR (AND #2# #1#) (|HasCategory| |#1| '(|Hashable|)) #4#)
         (|augmentPredVector| % 8192))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|Reference| (|List| |#1|)))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV % 37
                (CONS (|dispatchFunction| |STACK;hashUpdate!;Hs%Hs;17|) %))))
    %))) 

(DEFUN |Stack| (#1=#:G37)
  (SPROG NIL
         (PROG (#2=#:G38)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Stack|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Stack;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Stack|)))))))))) 

(MAKEPROP '|Stack| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (0 . |deref|) (|Boolean|) (5 . =) |STACK;=;2%B;1|
              |STACK;parts;%L;2| (|Mapping| 6 6) (11 . |map|) (17 . |ref|)
              |STACK;map;M2%;3| (22 . |map!|) (28 . |setref|)
              |STACK;map!;M2%;4| (34 . |copy|) |STACK;copy;2%;5|
              (|NonNegativeInteger|) |STACK;#;%Nni;6| |STACK;empty?;%B;14|
              |STACK;pop!;%S;7| |STACK;extract!;%S;8| |STACK;top;%S;9|
              |STACK;inspect;%S;10| |STACK;push!;S%S;11| |STACK;insert!;S2%;12|
              |STACK;empty;%;13| |STACK;construct;L%;15| |STACK;stack;L%;16|
              (|HashState|) (39 . |hashUpdate!|) (45 . |hashUpdate!|)
              (|Union| 6 '"failed") (|Mapping| 10 6) (|Mapping| 6 6 6)
              (|Equation| 6) (|List| 41) (|Mapping| 10 6 6) (|OutputForm|)
              (|InputForm|) (|SingleInteger|) (|String|))
           '#(~= 51 |top| 57 |stack| 62 |size?| 67 |select| 73 |sample| 79
              |removeDuplicates| 83 |remove| 88 |reduce| 100 |push!| 121 |pop!|
              127 |parts| 132 |more?| 137 |min| 143 |members| 148 |member?| 153
              |max| 159 |map!| 170 |map| 176 |less?| 182 |latex| 188 |inspect|
              193 |insert!| 198 |hashUpdate!| 204 |hash| 210 |find| 215
              |extract!| 221 |every?| 226 |eval| 232 |eq?| 258 |empty?| 264
              |empty| 269 |count| 273 |copy| 285 |convert| 290 |construct| 295
              |coerce| 300 |any?| 305 = 311 |#| 317)
           'NIL
           (CONS (|makeByteWordVec2| 9 '(0 0 0 0 4 1 2 0 9 3 7 2 0 0 0))
                 (CONS
                  '#(NIL |BagAggregate&| |Collection&| |HomogeneousAggregate&|
                     |Hashable&| |SetCategory&| |Evalable&| |Aggregate&|
                     |BasicType&| NIL NIL |InnerEvalable&| NIL NIL NIL)
                  (CONS
                   '#((|StackAggregate| 6) (|BagAggregate| 6) (|Collection| 6)
                      (|HomogeneousAggregate| 6) (|Hashable|) (|SetCategory|)
                      (|Evalable| 6) (|Aggregate|) (|BasicType|)
                      (|ConvertibleTo| 45) (|CoercibleTo| 44)
                      (|InnerEvalable| 6 6) (|shallowlyMutable|)
                      (|finiteAggregate|) (|Type|))
                   (|makeByteWordVec2| 47
                                       '(1 7 8 0 9 2 8 10 0 0 11 2 8 0 14 0 15
                                         1 7 0 8 16 2 8 0 14 0 18 2 7 8 0 8 19
                                         1 8 0 0 21 2 8 35 35 0 36 2 0 35 35 0
                                         37 2 14 10 0 0 1 1 0 6 0 28 1 0 0 8 34
                                         2 0 10 0 23 1 2 11 0 39 0 1 0 0 0 1 1
                                         13 0 0 1 2 13 0 6 0 1 2 11 0 39 0 1 4
                                         13 6 40 0 6 6 1 2 11 6 40 0 1 3 11 6
                                         40 0 6 1 2 0 6 6 0 30 1 0 6 0 26 1 11
                                         8 0 13 2 0 10 0 23 1 1 12 6 0 1 1 11 8
                                         0 1 2 13 10 6 0 1 1 12 6 0 1 2 11 6 43
                                         0 1 2 10 0 14 0 20 2 0 0 14 0 17 2 0
                                         10 0 23 1 1 1 47 0 1 1 0 6 0 29 2 0 0
                                         6 0 31 2 4 35 35 0 37 1 4 46 0 1 2 0
                                         38 39 0 1 1 0 6 0 27 2 11 10 39 0 1 2
                                         2 0 0 41 1 2 2 0 0 42 1 3 2 0 0 6 6 1
                                         3 2 0 0 8 8 1 2 0 10 0 0 1 1 0 10 0 25
                                         0 0 0 32 2 13 23 6 0 1 2 11 23 39 0 1
                                         1 0 0 0 22 1 3 45 0 1 1 0 0 8 33 1 6
                                         44 0 1 2 11 10 39 0 1 2 14 10 0 0 12 1
                                         11 23 0 24)))))
           '|lookupComplete|)) 
