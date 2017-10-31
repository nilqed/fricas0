
(SDEFUN |SEQU2;map;MSS;1|
        ((|f| |Mapping| R2 R1) (|x| |Sequence| R1) ($ |Sequence| R2))
        (SPADCALL (SPADCALL |f| (SPADCALL |x| (QREFELT $ 10)) (QREFELT $ 14))
                  (QREFELT $ 16))) 

(DECLAIM (NOTINLINE |SequenceFunctions2;|)) 

(DEFUN |SequenceFunctions2| (&REST #1=#:G692)
  (SPROG NIL
         (PROG (#2=#:G693)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SequenceFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|SequenceFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SequenceFunctions2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SequenceFunctions2|)))))))))) 

(DEFUN |SequenceFunctions2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SequenceFunctions2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SequenceFunctions2| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 18) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SequenceFunctions2|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SequenceFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Stream| 6) (|Sequence| 6) (0 . |stream|) (|Stream| 7)
              (|Mapping| 7 6) (|StreamFunctions2| 6 7) (5 . |map|)
              (|Sequence| 7) (11 . |sequence|) |SEQU2;map;MSS;1|)
           '#(|map| 16) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(1 9 8 0 10 2 13 11 12 8 14 1
                                                   15 0 11 16 2 0 15 12 9
                                                   17)))))
           '|lookupComplete|)) 
