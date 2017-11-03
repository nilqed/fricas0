
(SDEFUN |TENSPO2;linearExtend;MTpM2;1|
        ((|f| |Mapping| M2 (|List| B)) (|x| |TensorPower| |n| R B M1) ($ M2))
        (SPROG ((|res| (M2)) (#1=#:G705 NIL) (|t| NIL))
               (SEQ
                (LETT |res| (|spadConstant| $ 11)
                      . #2=(|TENSPO2;linearExtend;MTpM2;1|))
                (SEQ (LETT |t| NIL . #2#)
                     (LETT #1# (SPADCALL |x| (QREFELT $ 15)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res|
                             (SPADCALL |res|
                                       (SPADCALL (QCDR |t|)
                                                 (SPADCALL
                                                  (SPADCALL (QCAR |t|)
                                                            (QREFELT $ 18))
                                                  |f|)
                                                 (QREFELT $ 19))
                                       (QREFELT $ 20))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))) 

(DECLAIM (NOTINLINE |TensorPowerFunctions2;|)) 

(DEFUN |TensorPowerFunctions2| (&REST #1=#:G706)
  (SPROG NIL
         (PROG (#2=#:G707)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TensorPowerFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|TensorPowerFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TensorPowerFunctions2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TensorPowerFunctions2|)))))))))) 

(DEFUN |TensorPowerFunctions2;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|TensorPowerFunctions2|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|TensorPowerFunctions2| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 23) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|TensorPowerFunctions2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|TensorPowerFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |Zero|)
              (|Record| (|:| |k| 17) (|:| |c| 7)) (|List| 12)
              (|TensorPower| (NRTEVAL (QREFELT $ 6)) 7 8 9) (4 . |listOfTerms|)
              (|List| 8) (|Vector| 8) (9 . |parts|) (14 . *) (20 . +)
              (|Mapping| 10 16) |TENSPO2;linearExtend;MTpM2;1|)
           '#(|linearExtend| 26) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 22
                                                 '(0 10 0 11 1 14 13 0 15 1 17
                                                   16 0 18 2 10 0 7 0 19 2 10 0
                                                   0 0 20 2 0 10 21 14 22)))))
           '|lookupComplete|)) 
