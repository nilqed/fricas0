
(SDEFUN |VECTOR2;scan;MVBV;1|
        ((|f| |Mapping| B A B) (|v| |Vector| A) (|b| B) ($ |Vector| B))
        (SPADCALL |f| |v| |b| (QREFELT $ 12))) 

(SDEFUN |VECTOR2;reduce;MV2B;2|
        ((|f| |Mapping| B A B) (|v| |Vector| A) (|b| B) ($ B))
        (SPADCALL |f| |v| |b| (QREFELT $ 14))) 

(SDEFUN |VECTOR2;map;MVV;3|
        ((|f| |Mapping| B A) (|v| |Vector| A) ($ |Vector| B))
        (SPADCALL |f| |v| (QREFELT $ 17))) 

(SDEFUN |VECTOR2;map;MVU;4|
        ((|f| |Mapping| (|Union| B #1="failed") A) (|a| |Vector| A)
         ($ |Union| (|Vector| B) "failed"))
        (SPROG
         ((|res| (|List| B)) (#2=#:G708 NIL) (#3=#:G725 NIL)
          (|r| (|Union| B #1#)) (#4=#:G726 NIL) (|u| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| NIL . #5=(|VECTOR2;map;MVU;4|))
                (SEQ (LETT |u| NIL . #5#)
                     (LETT #4# (SPADCALL |a| (QREFELT $ 20)) . #5#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |u| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ (LETT |r| (SPADCALL |u| |f|) . #5#)
                          (EXIT
                           (COND
                            ((SPADCALL |r| (CONS 1 "failed") (QREFELT $ 23))
                             (PROGN
                              (LETT #3# (CONS 1 "failed") . #5#)
                              (GO #6=#:G724)))
                            ('T
                             (LETT |res|
                                   (CONS
                                    (PROG2 (LETT #2# |r| . #5#)
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 0)
                                                      (QREFELT $ 7)
                                                      (|Union| (QREFELT $ 7)
                                                               #1#)
                                                      #2#))
                                    |res|)
                                   . #5#)))))
                     (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL (NREVERSE |res|) (QREFELT $ 25))))))
          #6# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |VectorFunctions2;|)) 

(DEFUN |VectorFunctions2| (&REST #1=#:G727)
  (SPROG NIL
         (PROG (#2=#:G728)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|VectorFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|VectorFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |VectorFunctions2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|VectorFunctions2|)))))))))) 

(DEFUN |VectorFunctions2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|VectorFunctions2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|VectorFunctions2| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 29) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|VectorFunctions2| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|VectorFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Vector| 7) (|Mapping| 7 6 7) (|Vector| 6)
              (|FiniteLinearAggregateFunctions2| 6 10 7 8) (0 . |scan|)
              |VECTOR2;scan;MVBV;1| (7 . |reduce|) |VECTOR2;reduce;MV2B;2|
              (|Mapping| 7 6) (14 . |map|) |VECTOR2;map;MVV;3| (|List| 6)
              (20 . |entries|) (|Boolean|) (|Union| 7 '"failed") (25 . =)
              (|List| 7) (31 . |vector|) (|Union| 8 '"failed") (|Mapping| 22 6)
              |VECTOR2;map;MVU;4|)
           '#(|scan| 36 |reduce| 43 |map| 50) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(3 11 8 9 10 7 12 3 11 7 9 10
                                                   7 14 2 11 8 16 10 17 1 10 19
                                                   0 20 2 22 21 0 0 23 1 8 0 24
                                                   25 3 0 8 9 10 7 13 3 0 7 9
                                                   10 7 15 2 0 26 27 10 28 2 0
                                                   8 16 10 18)))))
           '|lookupComplete|)) 
