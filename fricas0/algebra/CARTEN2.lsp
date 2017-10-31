
(SDEFUN |CARTEN2;reshape;LCtCt;1|
        ((|l| |List| T$) (|s| |CartesianTensor| |minix| |dim| S)
         ($ |CartesianTensor| |minix| |dim| T$))
        (SPADCALL |l| (QREFELT $ 12))) 

(SDEFUN |CARTEN2;map;MCtCt;2|
        ((|f| |Mapping| T$ S) (|s| |CartesianTensor| |minix| |dim| S)
         ($ |CartesianTensor| |minix| |dim| T$))
        (SPROG ((#1=#:G701 NIL) (|e| NIL) (#2=#:G700 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|CARTEN2;map;MCtCt;2|))
                  (SEQ (LETT |e| NIL . #3#)
                       (LETT #1# (SPADCALL |s| (QREFELT $ 16)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT (LETT #2# (CONS (SPADCALL |e| |f|) #2#) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 12))))) 

(DECLAIM (NOTINLINE |CartesianTensorFunctions2;|)) 

(DEFUN |CartesianTensorFunctions2| (&REST #1=#:G702)
  (SPROG NIL
         (PROG (#2=#:G703)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|CartesianTensorFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|CartesianTensorFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |CartesianTensorFunctions2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|CartesianTensorFunctions2|)))))))))) 

(DEFUN |CartesianTensorFunctions2;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|CartesianTensorFunctions2|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|CartesianTensorFunctions2| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 19) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|CartesianTensorFunctions2|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|CartesianTensorFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|List| 9)
              (|CartesianTensor| 6 7 9) (0 . |unravel|)
              (|CartesianTensor| 6 7 8) |CARTEN2;reshape;LCtCt;1| (|List| 8)
              (5 . |ravel|) (|Mapping| 9 8) |CARTEN2;map;MCtCt;2|)
           '#(|reshape| 10 |map| 16) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(1 11 0 10 12 1 13 15 0 16 2
                                                   0 11 10 13 14 2 0 11 17 13
                                                   18)))))
           '|lookupComplete|)) 
