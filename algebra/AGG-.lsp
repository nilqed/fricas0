
(PUT '|AGG-;eq?;2SB;1| '|SPADreplace| 'EQ) 

(SDEFUN |AGG-;eq?;2SB;1| ((|a| S) (|b| S) ($ |Boolean|)) (EQ |a| |b|)) 

(SDEFUN |AGG-;sample;S;2| (($ S)) (SPADCALL (QREFELT $ 9))) 

(SDEFUN |AGG-;empty?;SB;3| ((|a| S) ($ |Boolean|))
        (EQL (SPADCALL |a| (QREFELT $ 12)) 0)) 

(SDEFUN |AGG-;less?;SNniB;4| ((|a| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (< (SPADCALL |a| (QREFELT $ 12)) |n|)) 

(SDEFUN |AGG-;more?;SNniB;5| ((|a| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPADCALL (SPADCALL |a| (QREFELT $ 12)) |n| (QREFELT $ 15))) 

(SDEFUN |AGG-;size?;SNniB;6| ((|a| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (EQL (SPADCALL |a| (QREFELT $ 12)) |n|)) 

(DECLAIM (NOTINLINE |Aggregate&;|)) 

(DEFUN |Aggregate&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Aggregate&|))
          (LETT |dv$| (LIST '|Aggregate&| DV$1) . #1#)
          (LETT $ (GETREFV 18) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|finiteAggregate|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 13 (CONS (|dispatchFunction| |AGG-;empty?;SB;3|) $))
             (QSETREFV $ 14 (CONS (|dispatchFunction| |AGG-;less?;SNniB;4|) $))
             (QSETREFV $ 16 (CONS (|dispatchFunction| |AGG-;more?;SNniB;5|) $))
             (QSETREFV $ 17
                       (CONS (|dispatchFunction| |AGG-;size?;SNniB;6|) $)))))
          $))) 

(MAKEPROP '|Aggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              |AGG-;eq?;2SB;1| (0 . |empty|) |AGG-;sample;S;2|
              (|NonNegativeInteger|) (4 . |#|) (9 . |empty?|) (14 . |less?|)
              (20 . >) (26 . |more?|) (32 . |size?|))
           '#(|size?| 38 |sample| 44 |more?| 48 |less?| 54 |eq?| 60 |empty?|
              66)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(0 6 0 9 1 6 11 0 12 1 0 7 0
                                                   13 2 0 7 0 11 14 2 11 7 0 0
                                                   15 2 0 7 0 11 16 2 0 7 0 11
                                                   17 2 0 7 0 11 17 0 0 0 10 2
                                                   0 7 0 11 16 2 0 7 0 11 14 2
                                                   0 7 0 0 8 1 0 7 0 13)))))
           '|lookupComplete|)) 
