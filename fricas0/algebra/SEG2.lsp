
(SDEFUN |SEG2;map;MSS;1|
        ((|f| |Mapping| S R) (|r| |Segment| R) ($ |Segment| S))
        (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 9)) |f|)
                  (SPADCALL (SPADCALL |r| (QREFELT $ 10)) |f|) (QREFELT $ 12))) 

(SDEFUN |SEG2;map;MSL;2| ((|f| |Mapping| S R) (|r| |Segment| R) ($ |List| S))
        (SPROG ((|l| (R)) (|lr| (|List| S)) (|inc| (R)) (|h| (R)))
               (SEQ (LETT |lr| NIL . #1=(|SEG2;map;MSL;2|))
                    (LETT |l| (SPADCALL |r| (QREFELT $ 9)) . #1#)
                    (LETT |h| (SPADCALL |r| (QREFELT $ 10)) . #1#)
                    (LETT |inc|
                          (SPADCALL (SPADCALL |r| (QREFELT $ 16))
                                    (QREFELT $ 17))
                          . #1#)
                    (COND
                     ((SPADCALL |inc| (|spadConstant| $ 18) (QREFELT $ 20))
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |l| |h| (QREFELT $ 21)))
                             (GO G191)))
                           (SEQ
                            (LETT |lr| (CONS (SPADCALL |l| |f|) |lr|) . #1#)
                            (EXIT
                             (LETT |l| (SPADCALL |l| |inc| (QREFELT $ 22))
                                   . #1#)))
                           NIL (GO G190) G191 (EXIT NIL)))
                     ('T
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |l| |h| (QREFELT $ 23)))
                             (GO G191)))
                           (SEQ
                            (LETT |lr| (CONS (SPADCALL |l| |f|) |lr|) . #1#)
                            (EXIT
                             (LETT |l| (SPADCALL |l| |inc| (QREFELT $ 22))
                                   . #1#)))
                           NIL (GO G190) G191 (EXIT NIL))))
                    (EXIT (NREVERSE |lr|))))) 

(DECLAIM (NOTINLINE |SegmentFunctions2;|)) 

(DEFUN |SegmentFunctions2| (&REST #1=#:G708)
  (SPROG NIL
         (PROG (#2=#:G709)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SegmentFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|SegmentFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SegmentFunctions2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SegmentFunctions2|)))))))))) 

(DEFUN |SegmentFunctions2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SegmentFunctions2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SegmentFunctions2| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 26) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|OrderedRing|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|SegmentFunctions2| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 25 (CONS (|dispatchFunction| |SEG2;map;MSL;2|) $))))
          $))) 

(MAKEPROP '|SegmentFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Segment| 6) (0 . |lo|) (5 . |hi|) (|Segment| 7) (10 . SEGMENT)
              (|Mapping| 7 6) |SEG2;map;MSS;1| (|Integer|) (16 . |incr|)
              (21 . |coerce|) (26 . |Zero|) (|Boolean|) (30 . >) (36 . <=)
              (42 . +) (48 . >=) (|List| 7) (54 . |map|))
           '#(|map| 60) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 25
                                                 '(1 8 6 0 9 1 8 6 0 10 2 11 0
                                                   7 7 12 1 8 15 0 16 1 6 0 15
                                                   17 0 6 0 18 2 6 19 0 0 20 2
                                                   6 19 0 0 21 2 6 0 0 0 22 2 6
                                                   19 0 0 23 2 0 24 13 8 25 2 1
                                                   24 13 8 25 2 0 11 13 8
                                                   14)))))
           '|lookupComplete|)) 
