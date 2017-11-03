
(SDEFUN |ASTACK;#;$Nni;1| ((|s| $) ($ |NonNegativeInteger|))
        (SPADCALL |s| (QREFELT $ 9))) 

(SDEFUN |ASTACK;=;2$B;2| ((|s| $) (|t| $) ($ |Boolean|))
        (SPADCALL |s| |t| (QREFELT $ 12))) 

(SDEFUN |ASTACK;copy;2$;3| ((|s| $) ($ $)) (SPADCALL |s| (QREFELT $ 14))) 

(SDEFUN |ASTACK;coerce;$Of;4| ((|d| $) ($ |OutputForm|))
        (SPROG
         ((#1=#:G715 NIL) (|i| NIL) (#2=#:G714 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |d| (QREFELT $ 16)) (SPADCALL NIL (QREFELT $ 19)))
                ('T
                 (SEQ
                  (LETT |n| (SPADCALL |d| (QREFELT $ 10))
                        . #3=(|ASTACK;coerce;$Of;4|))
                  (EXIT
                   (SPADCALL
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL |d| (- |n| |i|) (QREFELT $ 21))
                                    (QREFELT $ 22))
                                   #2#)
                                  . #3#)))
                          (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 24))))))))) 

(SDEFUN |ASTACK;empty?;$B;5| ((|s| $) ($ |Boolean|))
        (SPADCALL |s| (QREFELT $ 26))) 

(SDEFUN |ASTACK;extract!;$S;6| ((|s| $) ($ S)) (SPADCALL |s| (QREFELT $ 27))) 

(SDEFUN |ASTACK;inspect;$S;7| ((|s| $) ($ S)) (SPADCALL |s| (QREFELT $ 29))) 

(SDEFUN |ASTACK;insert!;S2$;8| ((|e| S) (|s| $) ($ $))
        (SEQ (SPADCALL |e| |s| (QREFELT $ 31)) (EXIT |s|))) 

(SDEFUN |ASTACK;parts;$L;9| ((|s| $) ($ |List| S))
        (REVERSE (SPADCALL |s| (QREFELT $ 33)))) 

(SDEFUN |ASTACK;push!;S$S;10| ((|e| S) (|s| $) ($ S))
        (SEQ (SPADCALL |s| |e| (QREFELT $ 35)) (EXIT |e|))) 

(SDEFUN |ASTACK;pop!;$S;11| ((|s| $) ($ S))
        (SPROG ((|r| (S)) (|m| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |s| (QREFELT $ 16)) (|error| "empty stack")))
                (LETT |m| (SPADCALL |s| (QREFELT $ 36))
                      . #1=(|ASTACK;pop!;$S;11|))
                (LETT |r| (SPADCALL |s| |m| (QREFELT $ 21)) . #1#)
                (SPADCALL |s| |m| (QREFELT $ 37)) (EXIT |r|)))) 

(SDEFUN |ASTACK;top;$S;12| ((|s| $) ($ S))
        (COND ((SPADCALL |s| (QREFELT $ 16)) (|error| "empty stack"))
              ('T (SPADCALL |s| (SPADCALL |s| (QREFELT $ 36)) (QREFELT $ 21))))) 

(SDEFUN |ASTACK;construct;L$;13| ((|l| |List| S) ($ $))
        (SPADCALL (REVERSE |l|) (QREFELT $ 38))) 

(SDEFUN |ASTACK;arrayStack;L$;14| ((|l| |List| S) ($ $))
        (SPADCALL |l| (QREFELT $ 39))) 

(SDEFUN |ASTACK;empty;$;15| (($ $)) (SPADCALL (QREFELT $ 41))) 

(SDEFUN |ASTACK;map;M2$;16| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SPADCALL |f| |s| (QREFELT $ 44))) 

(SDEFUN |ASTACK;map!;M2$;17| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SPADCALL |f| |s| (QREFELT $ 46))) 

(SDEFUN |ASTACK;hashUpdate!;Hs$Hs;18|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (SPADCALL |hs| |s| (QREFELT $ 49))) 

(DECLAIM (NOTINLINE |ArrayStack;|)) 

(DEFUN |ArrayStack| (#1=#:G746)
  (SPROG NIL
         (PROG (#2=#:G747)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ArrayStack|)
                                               '|domainEqualList|)
                    . #3=(|ArrayStack|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|ArrayStack;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ArrayStack|)))))))))) 

(DEFUN |ArrayStack;| (|#1|)
  (SPROG
   ((#1=#:G745 NIL) (|pv$| NIL) (#2=#:G742 NIL) (#3=#:G743 NIL) (#4=#:G744 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|ArrayStack|))
    (LETT |dv$| (LIST '|ArrayStack| DV$1) . #5#)
    (LETT $ (GETREFV 59) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #5#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #4#)
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              . #5#)
                                        (OR #3# #4#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #5#)
                                        (OR #2#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #4#))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|ArrayStack| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 128))
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 256))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #5#)
     (|augmentPredVector| $ 512))
    (AND (OR #1# #4#) (|augmentPredVector| $ 1024))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|IndexedFlexibleArray| |#1| 0))
    $))) 

(MAKEPROP '|ArrayStack| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) (0 . |#|) |ASTACK;#;$Nni;1| (|Boolean|)
              (5 . =) |ASTACK;=;2$B;2| (11 . |copy|) |ASTACK;copy;2$;3|
              |ASTACK;empty?;$B;5| (|OutputForm|) (|List| 6) (16 . |coerce|)
              (|Integer|) (21 . |elt|) (27 . |coerce|) (|List| 17)
              (32 . |coerce|) |ASTACK;coerce;$Of;4| (37 . |empty?|)
              |ASTACK;pop!;$S;11| |ASTACK;extract!;$S;6| |ASTACK;top;$S;12|
              |ASTACK;inspect;$S;7| |ASTACK;push!;S$S;10|
              |ASTACK;insert!;S2$;8| (42 . |parts|) |ASTACK;parts;$L;9|
              (47 . |concat!|) (53 . |maxIndex|) (58 . |delete!|)
              (64 . |construct|) |ASTACK;construct;L$;13|
              |ASTACK;arrayStack;L$;14| (69 . |empty|) |ASTACK;empty;$;15|
              (|Mapping| 6 6) (73 . |map|) |ASTACK;map;M2$;16| (79 . |map!|)
              |ASTACK;map!;M2$;17| (|HashState|) (85 . |hashUpdate!|)
              |ASTACK;hashUpdate!;Hs$Hs;18| (|Mapping| 6 6 6) (|List| 53)
              (|Equation| 6) (|Mapping| 11 6) (|InputForm|) (|SingleInteger|)
              (|String|) (|Union| 6 '"failed"))
           '#(~= 91 |top| 97 |size?| 102 |select| 108 |sample| 114
              |removeDuplicates| 118 |remove| 123 |reduce| 135 |push!| 156
              |pop!| 162 |parts| 167 |more?| 172 |members| 178 |member?| 183
              |map!| 189 |map| 195 |less?| 201 |latex| 207 |inspect| 212
              |insert!| 217 |hashUpdate!| 223 |hash| 229 |find| 234 |extract!|
              240 |every?| 245 |eval| 251 |eq?| 277 |empty?| 283 |empty| 288
              |count| 292 |copy| 304 |convert| 309 |construct| 314 |coerce| 319
              |arrayStack| 324 |any?| 329 = 335 |#| 341)
           'NIL
           (CONS (|makeByteWordVec2| 7 '(0 0 0 0 0 2 1 0 0 0 2 5 7 3))
                 (CONS
                  '#(NIL |BagAggregate&| |Collection&| |HomogeneousAggregate&|
                     |Aggregate&| |Evalable&| |SetCategory&| NIL NIL NIL
                     |InnerEvalable&| |BasicType&| NIL NIL)
                  (CONS
                   '#((|StackAggregate| 6) (|BagAggregate| 6) (|Collection| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 17) (|ConvertibleTo| 55))
                   (|makeByteWordVec2| 58
                                       '(1 7 8 0 9 2 7 11 0 0 12 1 7 0 0 14 1
                                         18 17 0 19 2 7 6 0 20 21 1 6 17 0 22 1
                                         23 17 0 24 1 7 11 0 26 1 7 18 0 33 2 7
                                         0 0 6 35 1 7 20 0 36 2 7 0 0 20 37 1 7
                                         0 18 38 0 7 0 41 2 7 0 43 0 44 2 7 0
                                         43 0 46 2 7 48 48 0 49 2 11 11 0 0 1 1
                                         0 6 0 29 2 0 11 0 8 1 2 9 0 54 0 1 0 0
                                         0 1 1 10 0 0 1 2 10 0 6 0 1 2 9 0 54 0
                                         1 4 10 6 51 0 6 6 1 3 9 6 51 0 6 1 2 9
                                         6 51 0 1 2 0 6 6 0 31 1 0 6 0 27 1 9
                                         18 0 34 2 0 11 0 8 1 1 9 18 0 1 2 10
                                         11 6 0 1 2 8 0 43 0 47 2 0 0 43 0 45 2
                                         0 11 0 8 1 1 1 57 0 1 1 0 6 0 30 2 0 0
                                         6 0 32 2 1 48 48 0 50 1 1 56 0 1 2 0
                                         58 54 0 1 1 0 6 0 28 2 9 11 54 0 1 3 2
                                         0 0 18 18 1 3 2 0 0 6 6 1 2 2 0 0 52 1
                                         2 2 0 0 53 1 2 0 11 0 0 1 1 0 11 0 16
                                         0 0 0 42 2 10 8 6 0 1 2 9 8 54 0 1 1 0
                                         0 0 15 1 3 55 0 1 1 0 0 18 39 1 6 17 0
                                         25 1 0 0 18 40 2 9 11 54 0 1 2 11 11 0
                                         0 13 1 9 8 0 10)))))
           '|lookupComplete|)) 
