
(SDEFUN |FM2;linearExtend;MM1M2;1| ((|f| |Mapping| M2 S) (|x| M1) ($ M2))
        (SPROG ((|res| (M2)) (#1=#:G703 NIL) (|t| NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 11)) (|spadConstant| $ 12))
                      ('T
                       (SEQ
                        (LETT |res| (|spadConstant| $ 12)
                              . #2=(|FM2;linearExtend;MM1M2;1|))
                        (SEQ (LETT |t| NIL . #2#)
                             (LETT #1# (SPADCALL |x| (QREFELT $ 15)) . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |res|
                                     (SPADCALL |res|
                                               (SPADCALL (QCDR |t|)
                                                         (SPADCALL (QCAR |t|)
                                                                   |f|)
                                                         (QREFELT $ 16))
                                               (QREFELT $ 17))
                                     . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(DECLAIM (NOTINLINE |FreeModuleFunctions2;|)) 

(DEFUN |FreeModuleFunctions2| (&REST #1=#:G704)
  (SPROG NIL
         (PROG (#2=#:G705)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FreeModuleFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|FreeModuleFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FreeModuleFunctions2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FreeModuleFunctions2|)))))))))) 

(DEFUN |FreeModuleFunctions2;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|FreeModuleFunctions2|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|FreeModuleFunctions2| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 20) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|FreeModuleFunctions2|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|FreeModuleFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Boolean|) (0 . |zero?|)
              (5 . |Zero|) (|Record| (|:| |k| 7) (|:| |c| 6)) (|List| 13)
              (9 . |listOfTerms|) (14 . *) (20 . +) (|Mapping| 9 7)
              |FM2;linearExtend;MM1M2;1|)
           '#(|linearExtend| 26) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(1 8 10 0 11 0 9 0 12 1 8 14
                                                   0 15 2 9 0 6 0 16 2 9 0 0 0
                                                   17 2 0 9 18 8 19)))))
           '|lookupComplete|)) 
