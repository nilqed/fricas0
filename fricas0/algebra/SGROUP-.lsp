
(SDEFUN |SGROUP-;^;SPiS;1| ((|x| S) (|n| |PositiveInteger|) ($ S))
        (SPADCALL |x| |n| (QREFELT $ 9))) 

(DECLAIM (NOTINLINE |SemiGroup&;|)) 

(DEFUN |SemiGroup&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SemiGroup&|))
          (LETT |dv$| (LIST '|SemiGroup&| DV$1) . #1#)
          (LETT $ (GETREFV 11) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SemiGroup&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|PositiveInteger|)
              (|RepeatedSquaring| 6) (0 . |expt|) |SGROUP-;^;SPiS;1|)
           '#(^ 6) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10
                                                 '(2 8 6 6 7 9 2 0 0 0 7
                                                   10)))))
           '|lookupComplete|)) 
