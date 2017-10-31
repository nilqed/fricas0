
(SDEFUN |NASRNG-;antiCommutator;3S;1| ((|x| S) (|y| S) ($ S))
        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 7))
                  (SPADCALL |y| |x| (QREFELT $ 7)) (QREFELT $ 8))) 

(DECLAIM (NOTINLINE |NonAssociativeSemiRng&;|)) 

(DEFUN |NonAssociativeSemiRng&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|NonAssociativeSemiRng&|))
          (LETT |dv$| (LIST '|NonAssociativeSemiRng&| DV$1) . #1#)
          (LETT $ (GETREFV 10) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|NonAssociativeSemiRng&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . *) (6 . +)
              |NASRNG-;antiCommutator;3S;1|)
           '#(|antiCommutator| 12) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 9
                                                 '(2 6 0 0 0 7 2 6 0 0 0 8 2 0
                                                   0 0 0 9)))))
           '|lookupComplete|)) 
