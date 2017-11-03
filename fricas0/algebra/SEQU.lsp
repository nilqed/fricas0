
(PUT '|SEQU;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SEQU;rep| ((|x| $) ($ |Rep|)) |x|) 

(PUT '|SEQU;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |SEQU;per| ((|r| |Rep|) ($ $)) |r|) 

(SDEFUN |SEQU;Zero;$;3| (($ $))
        (|SEQU;per| (SPADCALL (LIST (|spadConstant| $ 8)) (QREFELT $ 10)) $)) 

(SDEFUN |SEQU;elt;$IR;4| ((|mm| $) (|n| |Integer|) ($ R))
        (COND ((< |n| 1) (|error| "no such element"))
              ('T (SPADCALL (|SEQU;rep| |mm| $) |n| (QREFELT $ 14))))) 

(SDEFUN |SEQU;apply;$PR;5| ((|mm| $) (|pi| |Partition|) ($ R))
        (SPROG
         ((#1=#:G715 NIL) (|k| NIL) (#2=#:G714 NIL)
          (|pil| (|List| (|Integer|))))
         (SEQ
          (LETT |pil| (SPADCALL |pi| (QREFELT $ 18)) . #3=(|SEQU;apply;$PR;5|))
          (EXIT
           (SPADCALL (ELT $ 19)
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |k| NIL . #3#) (LETT #1# |pil| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |mm| |k| (QREFELT $ 15))
                                         #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 21)))))) 

(SDEFUN |SEQU;cons;R2$;6| ((|r| R) (|s| $) ($ $))
        (|SEQU;per| (SPADCALL |r| (|SEQU;rep| |s| $) (QREFELT $ 23)) $)) 

(SDEFUN |SEQU;+;3$;7| ((|x| $) (|y| $) ($ $))
        (|SEQU;per|
         (SPADCALL (ELT $ 25) (|SEQU;rep| |x| $) (|SEQU;rep| |y| $)
                   (QREFELT $ 26))
         $)) 

(SDEFUN |SEQU;-;2$;8| ((|x| $) ($ $))
        (|SEQU;per| (SPADCALL (ELT $ 28) (|SEQU;rep| |x| $) (QREFELT $ 30)) $)) 

(SDEFUN |SEQU;multiply| ((|x| $) (|y| $) ($ $))
        (|SEQU;per|
         (SPADCALL (ELT $ 19) (|SEQU;rep| |x| $) (|SEQU;rep| |y| $)
                   (QREFELT $ 26))
         $)) 

(SDEFUN |SEQU;*;R2$;10| ((|x| R) (|y| $) ($ $))
        (SPROG NIL
               (|SEQU;per|
                (SPADCALL (CONS #'|SEQU;*;R2$;10!0| (VECTOR $ |x|))
                          (|SEQU;rep| |y| $) (QREFELT $ 30))
                $))) 

(SDEFUN |SEQU;*;R2$;10!0| ((|t| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|SEQU;*;R2$;10|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |t| (QREFELT $ 19)))))) 

(SDEFUN |SEQU;=;2$B;11| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL (|SEQU;rep| |x| $) (|SEQU;rep| |y| $) (QREFELT $ 34))) 

(SDEFUN |SEQU;coerce;S$;12| ((|x| |Stream| R) ($ $)) (|SEQU;per| |x| $)) 

(SDEFUN |SEQU;sequence;S$;13| ((|x| |Stream| R) ($ $)) (|SEQU;per| |x| $)) 

(SDEFUN |SEQU;stream;$S;14| ((|x| $) ($ |Stream| R)) (|SEQU;rep| |x| $)) 

(SDEFUN |SEQU;first;$Nni$;15| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (|SEQU;per| (SPADCALL (|SEQU;rep| |x| $) |n| (QREFELT $ 39)) $)) 

(SDEFUN |SEQU;firstn;$NniL;16|
        ((|x| $) (|n| |NonNegativeInteger|) ($ |List| R))
        (SPADCALL
         (SPADCALL (SPADCALL (|SEQU;rep| |x| $) |n| (QREFELT $ 39))
                   (QREFELT $ 41))
         (QREFELT $ 42))) 

(SDEFUN |SEQU;sequence;MR$;17| ((|f| |Mapping| R R) (|r| R) ($ $))
        (|SEQU;per| (SPADCALL |f| |r| (QREFELT $ 44)) $)) 

(SDEFUN |SEQU;coerce;$Of;18| ((|mm| $) ($ |OutputForm|))
        (SPADCALL (|SEQU;rep| |mm| $) (QREFELT $ 47))) 

(SDEFUN |SEQU;dilate;R2$;19| ((|a| R) (|mm| $) ($ $))
        (SPROG ((|apow| ($)))
               (SEQ
                (LETT |apow|
                      (SPADCALL (CONS #'|SEQU;dilate;R2$;19!0| (VECTOR $ |a|))
                                |a| (QREFELT $ 45))
                      |SEQU;dilate;R2$;19|)
                (EXIT (|SEQU;multiply| |apow| |mm| $))))) 

(SDEFUN |SEQU;dilate;R2$;19!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1) . #1=(|SEQU;dilate;R2$;19|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |a| (QREFELT $ 19)))))) 

(DECLAIM (NOTINLINE |Sequence;|)) 

(DEFUN |Sequence| (#1=#:G750)
  (SPROG NIL
         (PROG (#2=#:G751)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Sequence|)
                                               '|domainEqualList|)
                    . #3=(|Sequence|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Sequence;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Sequence|)))))))))) 

(DEFUN |Sequence;| (|#1|)
  (SPROG
   ((#1=#:G747 NIL) (#2=#:G749 NIL) (#3=#:G748 NIL) (|pv$| NIL) (#4=#:G746 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|Sequence|))
    (LETT |dv$| (LIST '|Sequence| DV$1) . #5#)
    (LETT $ (GETREFV 68) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         (|HasCategory| |#1| '(|SetCategory|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #4#)))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|Sequence| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (LETT #3# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
         (|augmentPredVector| $ 512))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #5#)
     (|augmentPredVector| $ 1024))
    (AND (OR (AND (|HasCategory| |#1| '(|Comparable|)) #3#) #2#)
         (|augmentPredVector| $ 2048))
    (AND (|HasCategory| |#1| '(|BasicType|)) #3# (|augmentPredVector| $ 4096))
    (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)) . #5#)
         (|augmentPredVector| $ 8192))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #3# #1#
         (|augmentPredVector| $ 16384))
    (AND #3# #1# (|augmentPredVector| $ 32768))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Stream| |#1|))
    $))) 

(MAKEPROP '|Sequence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Stream| 6) (|local| |#1|) '|Rep|
              (0 . |Zero|) (|List| 6) (4 . |repeating|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SEQU;Zero;$;3|) $))
              (9 . |One|) (|Integer|) (13 . |elt|) |SEQU;elt;$IR;4| (|List| 13)
              (|Partition|) (19 . |convert|) (24 . *) (|Mapping| 6 6 6)
              (30 . |reduce|) |SEQU;apply;$PR;5| (36 . |cons|)
              |SEQU;cons;R2$;6| (42 . +) (48 . |map|) |SEQU;+;3$;7| (55 . -)
              (|Mapping| 6 6) (60 . |map|) |SEQU;-;2$;8| |SEQU;*;R2$;10|
              (|Boolean|) |SEQU;=;2$B;11| |SEQU;coerce;S$;12|
              |SEQU;sequence;S$;13| |SEQU;stream;$S;14| (|NonNegativeInteger|)
              (66 . |first|) |SEQU;first;$Nni$;15| (72 . |complete|)
              (77 . |entries|) |SEQU;firstn;$NniL;16| (82 . |stream|)
              |SEQU;sequence;MR$;17| (|OutputForm|) (88 . |coerce|)
              |SEQU;coerce;$Of;18| |SEQU;dilate;R2$;19| (|Mapping| 33 6 6)
              (|List| 52) (|Equation| 6) (|Mapping| 33 6) (|Void|)
              (|UniversalSegment| 13) '"last" '"rest" '"first" '"value"
              (|List| $) (|Union| $ '"failed") (|InputForm|) (|SingleInteger|)
              (|String|) (|HashState|) (|PositiveInteger|)
              (|Union| 6 '"failed"))
           '#(~= 93 |zero?| 99 |value| 104 |trim| 109 |third| 115 |tail| 120
              |swap!| 125 |subtractIfCan| 132 |stream| 138 |split!| 143
              |sorted?| 149 |sort!| 160 |sort| 171 |smaller?| 182 |size?| 188
              |setvalue!| 194 |setrest!| 200 |setlast!| 206 |setfirst!| 212
              |setelt!| 218 |setchildren!| 260 |sequence| 266 |select| 277
              |second| 283 |sample| 288 |rst| 292 |rightTrim| 297 |reverse!|
              303 |reverse| 308 |rest| 313 |removeDuplicates| 324 |remove| 329
              |reduce| 341 |qsetrest!| 362 |qsetfirst!| 368 |qsetelt!| 374
              |qelt| 381 |possiblyInfinite?| 387 |position| 392 |parts| 411
              |opposite?| 416 |numberOfComputedEntries| 422 |nodes| 427 |node?|
              432 |new| 438 |more?| 444 |minIndex| 450 |min| 455 |merge| 461
              |members| 474 |member?| 479 |maxIndex| 485 |max| 490 |map!| 496
              |map| 502 |less?| 515 |leftTrim| 521 |leaves| 527 |leaf?| 532
              |lazyEvaluate| 537 |lazy?| 542 |latex| 547 |last| 552 |insert|
              563 |indices| 577 |index?| 582 |hashUpdate!| 588 |hash| 594
              |frst| 599 |firstn| 604 |first| 610 |find| 621 |fill!| 627
              |extend| 633 |explicitlyFinite?| 639 |explicitlyEmpty?| 644
              |explicitEntries?| 649 |every?| 654 |eval| 660 |eq?| 686 |entry?|
              692 |entries| 698 |empty?| 703 |empty| 708 |elt| 712 |distance|
              755 |dilate| 761 |delete| 767 |cyclic?| 779 |cycleTail| 784
              |cycleSplit!| 789 |cycleLength| 794 |cycleEntry| 799 |count| 804
              |copyInto!| 816 |copy| 823 |convert| 828 |construct| 833 |cons|
              838 |concat!| 844 |concat| 856 |complete| 879 |coerce| 884
              |children| 894 |child?| 899 |apply| 905 |any?| 911 |Zero| 917 >=
              921 > 927 = 933 <= 939 < 945 - 951 + 962 * 968 |#| 998)
           'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 0 0 0 0 0 0 3 0 0 3 0 0 0 9 0 0 0 0 0 1 0 0
                                  0 0 0 1 2))
            (CONS
             '#(NIL |Module&| NIL |LazyStreamAggregate&| NIL NIL
                |StreamAggregate&| |AbelianGroup&| |UnaryRecursiveAggregate&|
                |LinearAggregate&| NIL |RecursiveAggregate&| |Collection&|
                |IndexedAggregate&| |AbelianMonoid&| |AbelianSemiGroup&|
                |HomogeneousAggregate&| |SetCategory&| |EltableAggregate&|
                |Aggregate&| |Evalable&| NIL |BasicType&| NIL NIL NIL
                |InnerEvalable&| NIL)
             (CONS
              '#((|SequenceCategory| 6) (|Module| 6) (|BiModule| 6 6)
                 (|LazyStreamAggregate| 6) (|RightModule| 6) (|LeftModule| 6)
                 (|StreamAggregate| 6) (|AbelianGroup|)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|CancellationAbelianMonoid|) (|RecursiveAggregate| 6)
                 (|Collection| 6) (|IndexedAggregate| 13 6) (|AbelianMonoid|)
                 (|AbelianSemiGroup|) (|HomogeneousAggregate| 6)
                 (|SetCategory|) (|EltableAggregate| 13 6) (|Aggregate|)
                 (|Evalable| 6) (|CoercibleTo| 46) (|BasicType|)
                 (|Eltable| 55 $$) (|Eltable| 13 6) (|Type|)
                 (|InnerEvalable| 6 6) (|ConvertibleTo| 62))
              (|makeByteWordVec2| 67
                                  '(0 6 0 8 1 7 0 9 10 0 6 0 12 2 7 6 0 13 14 1
                                    17 16 0 18 2 6 0 0 0 19 2 9 6 20 0 21 2 7 0
                                    6 0 23 2 6 0 0 0 25 3 0 0 20 0 0 26 1 6 0 0
                                    28 2 0 0 29 0 30 2 7 0 0 38 39 1 0 0 0 41 1
                                    0 9 0 42 2 7 0 29 6 44 1 7 46 0 47 2 0 33 0
                                    0 1 1 8 33 0 1 1 0 6 0 1 2 13 0 0 6 1 1 0 6
                                    0 1 1 0 0 0 1 3 14 54 0 13 13 1 2 3 61 0 0
                                    1 1 0 5 0 37 2 14 0 0 38 1 1 11 33 0 1 2 10
                                    33 50 0 1 1 15 0 0 1 2 16 0 50 0 1 1 11 0 0
                                    1 2 10 0 50 0 1 2 12 33 0 0 1 2 0 33 0 38 1
                                    2 14 6 0 6 1 2 14 0 0 0 1 2 14 6 0 6 1 2 14
                                    6 0 6 1 3 14 6 0 13 6 1 3 14 6 0 55 6 1 3
                                    14 6 0 56 6 1 3 14 0 0 57 0 1 3 14 6 0 58 6
                                    1 3 14 6 0 59 6 1 2 14 0 0 60 1 2 0 0 29 6
                                    45 1 0 0 5 36 2 0 0 53 0 1 1 0 6 0 1 0 0 0
                                    1 1 0 0 0 1 2 13 0 0 6 1 1 16 0 0 1 1 10 0
                                    0 1 2 0 0 0 38 1 1 0 0 0 1 1 13 0 0 1 2 13
                                    0 6 0 1 2 0 0 53 0 1 4 13 6 20 0 6 6 1 3 10
                                    6 20 0 6 1 2 10 6 20 0 1 2 14 0 0 0 1 2 14
                                    6 0 6 1 3 14 6 0 13 6 1 2 0 6 0 13 1 1 0 33
                                    0 1 2 13 13 6 0 1 3 13 13 6 0 13 1 2 10 13
                                    53 0 1 1 10 9 0 1 2 8 33 0 0 1 1 0 38 0 1 1
                                    0 60 0 1 2 4 33 0 0 1 2 0 0 38 6 1 2 0 33 0
                                    38 1 1 7 13 0 1 2 11 0 0 0 1 2 11 0 0 0 1 3
                                    10 0 50 0 0 1 1 10 9 0 1 2 13 33 6 0 1 1 7
                                    13 0 1 2 11 0 0 0 1 2 14 0 29 0 1 3 0 0 20
                                    0 0 26 2 0 0 29 0 30 2 0 33 0 38 1 2 13 0 0
                                    6 1 1 0 9 0 1 1 0 33 0 1 1 0 0 0 1 1 0 33 0
                                    1 1 0 64 0 1 2 0 0 0 38 1 1 0 6 0 1 3 0 0 0
                                    0 13 1 3 0 0 6 0 13 1 1 0 16 0 1 2 0 33 13
                                    0 1 2 0 65 65 0 1 1 0 63 0 1 1 0 6 0 1 2 0
                                    9 0 38 43 2 0 0 0 38 40 1 0 6 0 1 2 0 67 53
                                    0 1 2 14 0 0 6 1 2 0 0 0 13 1 1 0 33 0 1 1
                                    0 33 0 1 1 0 33 0 1 2 10 33 53 0 1 3 1 0 0
                                    6 6 1 3 1 0 0 9 9 1 2 1 0 0 51 1 2 1 0 0 52
                                    1 2 0 33 0 0 1 2 13 33 6 0 1 1 0 9 0 42 1 0
                                    33 0 1 0 0 0 1 2 0 6 0 13 15 3 0 6 0 13 6 1
                                    2 0 0 0 55 1 2 0 6 0 56 1 2 0 0 0 57 1 2 0
                                    6 0 58 1 2 0 6 0 59 1 2 0 13 0 0 1 2 0 0 6
                                    0 49 2 0 0 0 13 1 2 0 0 0 55 1 1 0 33 0 1 1
                                    0 0 0 1 1 14 0 0 1 1 0 38 0 1 1 0 0 0 1 2
                                    13 38 6 0 1 2 10 38 53 0 1 3 16 0 0 0 13 1
                                    1 0 0 0 1 1 2 62 0 1 1 0 0 9 1 2 0 0 6 0 24
                                    2 14 0 0 6 1 2 14 0 0 0 1 1 0 0 60 1 2 0 0
                                    0 6 1 2 0 0 0 0 1 2 0 0 6 0 1 1 0 0 0 41 1
                                    0 0 5 35 1 0 46 0 48 1 0 60 0 1 2 4 33 0 0
                                    1 2 0 6 0 17 22 2 10 33 53 0 1 0 8 0 11 2
                                    11 33 0 0 1 2 11 33 0 0 1 2 0 33 0 0 34 2
                                    11 33 0 0 1 2 11 33 0 0 1 2 3 0 0 0 1 1 3 0
                                    0 31 2 0 0 0 0 27 2 3 0 13 0 1 2 8 0 38 0 1
                                    2 0 0 66 0 1 2 0 0 6 0 32 2 0 0 0 6 1 1 10
                                    38 0 1)))))
           '|lookupComplete|)) 
