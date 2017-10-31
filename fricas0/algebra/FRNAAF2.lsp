
(SDEFUN |FRNAAF2;map;MARAS;1| ((|fn| |Mapping| S R) (|u| AR) ($ AS))
        (SPROG
         ((#1=#:G698 NIL) (#2=#:G700 NIL) (|i| NIL) (#3=#:G699 NIL)
          (|ba| (|Vector| AS)) (|vs| (|Vector| S)) (|vr| (|Vector| R)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (QREFELT $ 11)) (SPADCALL (QREFELT $ 12))
                      (QREFELT $ 14))
            (|error| "map: ranks of algebras do not fit"))
           (#4='T
            (SEQ
             (LETT |vr| (SPADCALL |u| (QREFELT $ 16))
                   . #5=(|FRNAAF2;map;MARAS;1|))
             (LETT |vs| (SPADCALL |fn| |vr| (QREFELT $ 20)) . #5#)
             (EXIT
              (COND
               ((EQL (SPADCALL (QREFELT $ 11)) (SPADCALL (QREFELT $ 12)))
                (SPADCALL |vs| (QREFELT $ 21)))
               (#4#
                (SEQ (LETT |ba| (SPADCALL (QREFELT $ 23)) . #5#)
                     (EXIT
                      (SPADCALL |vs|
                                (PROGN
                                 (LETT #3#
                                       (GETREFV #6=(SPADCALL (QREFELT $ 11)))
                                       . #5#)
                                 (SEQ (LETT |i| 1 . #5#) (LETT #2# #6# . #5#)
                                      (LETT #1# 0 . #5#) G190
                                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SETELT #3# #1#
                                                (SPADCALL |ba| |i|
                                                          (QREFELT $ 26)))))
                                      (LETT #1#
                                            (PROG1 (|inc_SI| #1#)
                                              (LETT |i| (|inc_SI| |i|) . #5#))
                                            . #5#)
                                      (GO G190) G191 (EXIT NIL))
                                 #3#)
                                (QREFELT $ 27))))))))))))) 

(DECLAIM (NOTINLINE |FramedNonAssociativeAlgebraFunctions2;|)) 

(DEFUN |FramedNonAssociativeAlgebraFunctions2| (&REST #1=#:G701)
  (SPROG NIL
         (PROG (#2=#:G702)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FramedNonAssociativeAlgebraFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|FramedNonAssociativeAlgebraFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |FramedNonAssociativeAlgebraFunctions2;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FramedNonAssociativeAlgebraFunctions2|)))))))))) 

(DEFUN |FramedNonAssociativeAlgebraFunctions2;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|)
          . #1=(|FramedNonAssociativeAlgebraFunctions2|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$|
          (LIST '|FramedNonAssociativeAlgebraFunctions2| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 29) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|FramedNonAssociativeAlgebraFunctions2|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|FramedNonAssociativeAlgebraFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|PositiveInteger|) (0 . |rank|)
              (4 . |rank|) (|Boolean|) (8 . >) (|Vector| 7)
              (14 . |coordinates|) (|Vector| 9) (|Mapping| 9 7)
              (|VectorFunctions2| 7 9) (19 . |map|) (25 . |represents|)
              (|Vector| $) (30 . |basis|) (|Integer|) (|Vector| 8) (34 . |elt|)
              (40 . |represents|) |FRNAAF2;map;MARAS;1|)
           '#(|map| 46) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(0 6 10 11 0 8 10 12 2 10 13
                                                   0 0 14 1 6 15 0 16 2 19 17
                                                   18 15 20 1 8 0 17 21 0 8 22
                                                   23 2 25 8 0 24 26 2 8 0 17
                                                   22 27 2 0 8 18 6 28)))))
           '|lookupComplete|)) 
