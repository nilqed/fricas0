
(PUT '|LIST;nil;$;1| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LIST;nil;$;1| (($ $)) NIL) 

(PUT '|LIST;null;$B;2| '|SPADreplace| 'NULL) 

(SDEFUN |LIST;null;$B;2| ((|l| $) ($ |Boolean|)) (NULL |l|)) 

(PUT '|LIST;cons;S2$;3| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;cons;S2$;3| ((|s| S) (|l| $) ($ $)) (CONS |s| |l|)) 

(SDEFUN |LIST;append;3$;4| ((|l| $) (|t| $) ($ $))
        (SPADCALL |l| |t| (QREFELT $ 11))) 

(SDEFUN |LIST;writeOMList| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 15))
             (SPADCALL |dev| "list1" "list" (QREFELT $ 17))
             (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                  (SEQ (SPADCALL |dev| (|SPADfirst| |x|) NIL (QREFELT $ 18))
                       (EXIT (LETT |x| (CDR |x|) |LIST;writeOMList|)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |dev| (QREFELT $ 19))))) 

(SDEFUN |LIST;OMwrite;Omd$BV;6|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 20))))
             (|LIST;writeOMList| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 21))))))) 

(SDEFUN |LIST;setUnion;3$;7| ((|l1| $) (|l2| $) ($ $))
        (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 11)) (QREFELT $ 23))) 

(SDEFUN |LIST;setIntersection;3$;8| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|u| ($)))
               (SEQ (LETT |u| NIL . #1=(|LIST;setIntersection;3$;8|))
                    (LETT |l1| (SPADCALL |l1| (QREFELT $ 23)) . #1#)
                    (SEQ G190 (COND ((NULL (NULL (NULL |l1|))) (GO G191)))
                         (SEQ
                          (COND
                           ((SPADCALL (|SPADfirst| |l1|) |l2| (QREFELT $ 25))
                            (LETT |u|
                                  (SPADCALL (|SPADfirst| |l1|) |u|
                                            (QREFELT $ 10))
                                  . #1#)))
                          (EXIT (LETT |l1| (CDR |l1|) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |u|)))) 

(SDEFUN |LIST;setDifference;3$;9| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|lu| ($)) (|l11| (S)))
               (SEQ
                (LETT |l1| (SPADCALL |l1| (QREFELT $ 23))
                      . #1=(|LIST;setDifference;3$;9|))
                (LETT |lu| NIL . #1#)
                (SEQ G190 (COND ((NULL (NULL (NULL |l1|))) (GO G191)))
                     (SEQ (LETT |l11| (SPADCALL |l1| 1 (QREFELT $ 28)) . #1#)
                          (COND
                           ((NULL (SPADCALL |l11| |l2| (QREFELT $ 25)))
                            (LETT |lu| (CONS |l11| |lu|) . #1#)))
                          (EXIT (LETT |l1| (CDR |l1|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |lu|)))) 

(SDEFUN |LIST;convert;$If;10| ((|x| $) ($ |InputForm|))
        (SPROG ((#1=#:G2229 NIL) (|a| NIL) (#2=#:G2228 NIL))
               (SEQ
                (SPADCALL
                 (CONS (SPADCALL '|construct| (QREFELT $ 32))
                       (PROGN
                        (LETT #2# NIL . #3=(|LIST;convert;$If;10|))
                        (SEQ (LETT |a| NIL . #3#) (LETT #1# |x| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |a| (QREFELT $ 33)) #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))
                 (QREFELT $ 35))))) 

(DECLAIM (NOTINLINE |List;|)) 

(DEFUN |List| (#1=#:G2244)
  (SPROG NIL
         (PROG (#2=#:G2245)
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
   ((#1=#:G2240 NIL) (#2=#:G2241 NIL) (#3=#:G2243 NIL) (#4=#:G2242 NIL)
    (|pv$| NIL) (#5=#:G2237 NIL) (#6=#:G2238 NIL) (#7=#:G2239 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #8=(|List|))
    (LETT |dv$| (LIST '|List| DV$1) . #8#)
    (LETT $ (GETREFV 55) . #8#)
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
       (QSETREFV $ 22 (CONS (|dispatchFunction| |LIST;OMwrite;Omd$BV;6|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 24 (CONS (|dispatchFunction| |LIST;setUnion;3$;7|) $))
       (QSETREFV $ 26
                 (CONS (|dispatchFunction| |LIST;setIntersection;3$;8|) $))
       (QSETREFV $ 29
                 (CONS (|dispatchFunction| |LIST;setDifference;3$;9|) $)))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 36 (CONS (|dispatchFunction| |LIST;convert;$If;10|) $))))
    $))) 

(MAKEPROP '|List| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedList| 6 (NRTEVAL 1)) (|local| |#1|)
              |LIST;nil;$;1| (|Boolean|) |LIST;null;$B;2| |LIST;cons;S2$;3|
              (0 . |concat|) |LIST;append;3$;4| (|Void|) (|OpenMathDevice|)
              (6 . |OMputApp|) (|String|) (11 . |OMputSymbol|) (18 . |OMwrite|)
              (25 . |OMputEndApp|) (30 . |OMputObject|) (35 . |OMputEndObject|)
              (40 . |OMwrite|) (47 . |removeDuplicates|) (52 . |setUnion|)
              (58 . |member?|) (64 . |setIntersection|) (|Integer|)
              (70 . |elt|) (76 . |setDifference|) (|Symbol|) (|InputForm|)
              (82 . |convert|) (87 . |convert|) (|List| $) (92 . |convert|)
              (97 . |convert|) (|Mapping| 8 6 6) (|Mapping| 6 6 6)
              (|NonNegativeInteger|) (|List| 6) (|Equation| 6) (|List| 41)
              (|OutputForm|) (|SingleInteger|) (|HashState|) (|Mapping| 8 6)
              (|UniversalSegment| 27) '"last" '"rest" '"first" '"value"
              (|Mapping| 6 6) (|List| 27) (|Union| 6 '"failed"))
           '#(|setUnion| 102 |setIntersection| 108 |setDifference| 114
              |removeDuplicates| 120 |null| 125 |nil| 130 |member?| 134 |elt|
              140 |convert| 146 |cons| 151 |concat| 157 |append| 163 |OMwrite|
              169)
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
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 27 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 27 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Eltable| 47 $$) (|Type|)
                 (|Eltable| 27 6) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 43) (|PartialOrder|) (|ConvertibleTo| 31)
                 (|OpenMath|))
              (|makeByteWordVec2| 36
                                  '(2 0 0 0 0 11 1 14 13 0 15 3 14 13 0 16 16
                                    17 3 6 13 14 0 8 18 1 14 13 0 19 1 14 13 0
                                    20 1 14 13 0 21 3 0 13 14 0 8 22 1 0 0 0 23
                                    2 0 0 0 0 24 2 0 8 6 0 25 2 0 0 0 0 26 2 0
                                    6 0 27 28 2 0 0 0 0 29 1 31 0 30 32 1 6 31
                                    0 33 1 31 0 34 35 1 0 31 0 36 2 4 0 0 0 24
                                    2 4 0 0 0 26 2 4 0 0 0 29 1 19 0 0 23 1 0 8
                                    0 9 0 0 0 7 2 19 8 6 0 25 2 0 6 0 27 28 1 2
                                    31 0 36 2 0 0 6 0 10 2 0 0 0 0 11 2 0 0 0 0
                                    12 3 3 13 14 0 8 22)))))
           '|lookupIncomplete|)) 
