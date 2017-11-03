
(PUT '|LIST;nil;$;1| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LIST;nil;$;1| (($ $)) NIL) 

(PUT '|LIST;null;$B;2| '|SPADreplace| 'NULL) 

(SDEFUN |LIST;null;$B;2| ((|l| $) ($ |Boolean|)) (NULL |l|)) 

(PUT '|LIST;cons;S2$;3| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;cons;S2$;3| ((|s| S) (|l| $) ($ $)) (CONS |s| |l|)) 

(SDEFUN |LIST;append;3$;4| ((|l| $) (|t| $) ($ $))
        (SPADCALL |l| |t| (QREFELT $ 11))) 

(SDEFUN |LIST;tails;$L;5| ((|x| $) ($ |List| $))
        (SPROG ((#1=#:G2186 NIL) (|i| NIL) (#2=#:G2185 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|LIST;tails;$L;5|))
                 (SEQ (LETT |i| 0 . #3#) (LETT #1# (- (LENGTH |x|) 1) . #3#)
                      G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| |i| (QREFELT $ 14)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |LIST;writeOMList| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 19))
             (SPADCALL |dev| "list1" "list" (QREFELT $ 21))
             (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                  (SEQ (SPADCALL |dev| (|SPADfirst| |x|) NIL (QREFELT $ 22))
                       (EXIT (LETT |x| (CDR |x|) |LIST;writeOMList|)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |dev| (QREFELT $ 23))))) 

(SDEFUN |LIST;OMwrite;Omd$BV;7|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 24))))
             (|LIST;writeOMList| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 25))))))) 

(SDEFUN |LIST;setUnion;3$;8| ((|l1| $) (|l2| $) ($ $))
        (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 11)) (QREFELT $ 27))) 

(SDEFUN |LIST;setIntersection;3$;9| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|u| ($)))
               (SEQ (LETT |u| NIL . #1=(|LIST;setIntersection;3$;9|))
                    (LETT |l1| (SPADCALL |l1| (QREFELT $ 27)) . #1#)
                    (SEQ G190 (COND ((NULL (NULL (NULL |l1|))) (GO G191)))
                         (SEQ
                          (COND
                           ((SPADCALL (|SPADfirst| |l1|) |l2| (QREFELT $ 29))
                            (LETT |u|
                                  (SPADCALL (|SPADfirst| |l1|) |u|
                                            (QREFELT $ 10))
                                  . #1#)))
                          (EXIT (LETT |l1| (CDR |l1|) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |u|)))) 

(SDEFUN |LIST;setDifference;3$;10| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|lu| ($)) (|l11| (S)))
               (SEQ
                (LETT |l1| (SPADCALL |l1| (QREFELT $ 27))
                      . #1=(|LIST;setDifference;3$;10|))
                (EXIT
                 (COND ((NULL |l2|) |l1|)
                       ('T
                        (SEQ (LETT |lu| NIL . #1#)
                             (SEQ G190
                                  (COND ((NULL (NULL (NULL |l1|))) (GO G191)))
                                  (SEQ
                                   (LETT |l11| (SPADCALL |l1| 1 (QREFELT $ 32))
                                         . #1#)
                                   (COND
                                    ((NULL
                                      (SPADCALL |l11| |l2| (QREFELT $ 29)))
                                     (LETT |lu| (CONS |l11| |lu|) . #1#)))
                                   (EXIT (LETT |l1| (CDR |l1|) . #1#)))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT |lu|)))))))) 

(SDEFUN |LIST;map!;M2$;11| ((|f| |Mapping| S S) (|l| $) ($ $))
        (SPROG ((|y| ($)))
               (SEQ (LETT |y| |l| . #1=(|LIST;map!;M2$;11|))
                    (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                         (SEQ
                          (SPADCALL |l| (SPADCALL (|SPADfirst| |l|) |f|)
                                    (QREFELT $ 34))
                          (EXIT (LETT |l| (CDR |l|) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |y|)))) 

(SDEFUN |LIST;convert;$If;12| ((|x| $) ($ |InputForm|))
        (SPROG ((#1=#:G2227 NIL) (|a| NIL) (#2=#:G2226 NIL))
               (SEQ
                (SPADCALL
                 (CONS (SPADCALL '|construct| (QREFELT $ 39))
                       (PROGN
                        (LETT #2# NIL . #3=(|LIST;convert;$If;12|))
                        (SEQ (LETT |a| NIL . #3#) (LETT #1# |x| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |a| (QREFELT $ 40)) #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))
                 (QREFELT $ 41))))) 

(DECLAIM (NOTINLINE |List;|)) 

(DEFUN |List| (#1=#:G2241)
  (SPROG NIL
         (PROG (#2=#:G2242)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|List|)
                                               '|domainEqualList|)
                    . #3=(|List|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|List;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|List|)))))))))) 

(DEFUN |List;| (|#1|)
  (SPROG
   ((#1=#:G2237 NIL) (#2=#:G2238 NIL) (#3=#:G2240 NIL) (#4=#:G2239 NIL)
    (|pv$| NIL) (#5=#:G2234 NIL) (#6=#:G2235 NIL) (#7=#:G2236 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #8=(|List|))
    (LETT |dv$| (LIST '|List| DV$1) . #8#)
    (LETT $ (GETREFV 59) . #8#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|OpenMath|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|))
                                              . #8#)
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #8#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #6#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #8#)
                                        (OR #5# #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))
                    . #8#))
    (|haddProp| |$ConstructorCache| '|List| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)) . #8#)
         (|augmentPredVector| $ 8192))
    (AND
     (LETT #3#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #8#)
     (|augmentPredVector| $ 16384))
    (AND (OR #5# (AND #7# #4#) #3#) (|augmentPredVector| $ 32768))
    (AND (OR (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 65536))
    (AND (OR (AND #7# #4#) #3#) (|augmentPredVector| $ 131072))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #8#)
     (|augmentPredVector| $ 262144))
    (AND (OR #2# (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 524288))
    (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)) . #8#)
         (|augmentPredVector| $ 1048576))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #4# #1#
         (|augmentPredVector| $ 2097152))
    (AND #4# #1# (|augmentPredVector| $ 4194304))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 26 (CONS (|dispatchFunction| |LIST;OMwrite;Omd$BV;7|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 28 (CONS (|dispatchFunction| |LIST;setUnion;3$;8|) $))
       (QSETREFV $ 30
                 (CONS (|dispatchFunction| |LIST;setIntersection;3$;9|) $))
       (QSETREFV $ 33
                 (CONS (|dispatchFunction| |LIST;setDifference;3$;10|) $)))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 42 (CONS (|dispatchFunction| |LIST;convert;$If;12|) $))))
    $))) 

(MAKEPROP '|List| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedList| 6 (NRTEVAL 1)) (|local| |#1|)
              |LIST;nil;$;1| (|Boolean|) |LIST;null;$B;2| |LIST;cons;S2$;3|
              (0 . |concat|) |LIST;append;3$;4| (|NonNegativeInteger|)
              (6 . |rest|) (|List| $) |LIST;tails;$L;5| (|Void|)
              (|OpenMathDevice|) (12 . |OMputApp|) (|String|)
              (17 . |OMputSymbol|) (24 . |OMwrite|) (31 . |OMputEndApp|)
              (36 . |OMputObject|) (41 . |OMputEndObject|) (46 . |OMwrite|)
              (53 . |removeDuplicates|) (58 . |setUnion|) (64 . |member?|)
              (70 . |setIntersection|) (|Integer|) (76 . |elt|)
              (82 . |setDifference|) (88 . |setfirst!|) (|Mapping| 6 6)
              |LIST;map!;M2$;11| (|Symbol|) (|InputForm|) (94 . |convert|)
              (99 . |convert|) (104 . |convert|) (109 . |convert|)
              (|Mapping| 8 6 6) (|Mapping| 6 6 6) (|List| 6) (|Equation| 6)
              (|List| 46) (|OutputForm|) (|SingleInteger|) (|HashState|)
              (|Mapping| 8 6) (|UniversalSegment| 31) '"last" '"rest" '"first"
              '"value" (|List| 31) (|Union| 6 '"failed"))
           '#(|tails| 114 |setfirst!| 119 |setUnion| 125 |setIntersection| 131
              |setDifference| 137 |rest| 143 |removeDuplicates| 149 |null| 154
              |nil| 159 |member?| 163 |map!| 169 |elt| 175 |convert| 181 |cons|
              186 |concat| 192 |append| 198 |OMwrite| 204)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 0 0 0 1 0 6 0 0 8 10 0 0 0 0 0 8
                                  9 12 1 2 3))
            (CONS
             '#(|ListAggregate&| |StreamAggregate&|
                |ExtensibleLinearAggregate&| NIL |UnaryRecursiveAggregate&|
                |LinearAggregate&| |RecursiveAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&| NIL
                NIL NIL NIL NIL |InnerEvalable&| |BasicType&| NIL
                |PartialOrder&| NIL |OpenMath&|)
             (CONS
              '#((|ListAggregate| 6) (|StreamAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 31 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 31 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Eltable| 52 $$) (|Type|)
                 (|Eltable| 31 6) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 48) (|PartialOrder|) (|ConvertibleTo| 38)
                 (|OpenMath|))
              (|makeByteWordVec2| 42
                                  '(2 0 0 0 0 11 2 0 0 0 13 14 1 18 17 0 19 3
                                    18 17 0 20 20 21 3 6 17 18 0 8 22 1 18 17 0
                                    23 1 18 17 0 24 1 18 17 0 25 3 0 17 18 0 8
                                    26 1 0 0 0 27 2 0 0 0 0 28 2 0 8 6 0 29 2 0
                                    0 0 0 30 2 0 6 0 31 32 2 0 0 0 0 33 2 0 6 0
                                    6 34 1 38 0 37 39 1 6 38 0 40 1 38 0 15 41
                                    1 0 38 0 42 1 0 15 0 16 2 21 6 0 6 34 2 4 0
                                    0 0 28 2 4 0 0 0 30 2 4 0 0 0 33 2 0 0 0 13
                                    14 1 19 0 0 27 1 0 8 0 9 0 0 0 7 2 19 8 6 0
                                    29 2 21 0 35 0 36 2 0 6 0 31 32 1 2 38 0 42
                                    2 0 0 6 0 10 2 0 0 0 0 11 2 0 0 0 0 12 3 3
                                    17 18 0 8 26)))))
           '|lookupIncomplete|)) 
