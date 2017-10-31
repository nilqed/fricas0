
(SDEFUN |RNG-;annihilate?;2SB;1| ((|x| S) (|y| S) ($ |Boolean|))
        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 7)) (QREFELT $ 9))) 

(DECLAIM (NOTINLINE |Rng&;|)) 

(DEFUN |Rng&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Rng&|))
          (LETT |dv$| (LIST '|Rng&| DV$1) . #1#)
          (LETT $ (GETREFV 11) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|Rng&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . *) (|Boolean|)
              (6 . |zero?|) |RNG-;annihilate?;2SB;1|)
           '#(|annihilate?| 11) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10
                                                 '(2 6 0 0 0 7 1 6 8 0 9 2 0 8
                                                   0 0 10)))))
           '|lookupComplete|)) 
