
(SDEFUN |VSPACE-;/;ASA;1| ((|v| A) (|s| S) ($ A))
        (SPADCALL (SPADCALL |s| (QREFELT $ 8)) |v| (QREFELT $ 9))) 

(DECLAIM (NOTINLINE |VectorSpace&;|)) 

(DEFUN |VectorSpace&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|VectorSpace&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|VectorSpace&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 11) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|VectorSpace&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |inv|)
              (5 . *) |VSPACE-;/;ASA;1|)
           '#(/ 11) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10
                                                 '(1 7 0 0 8 2 6 0 7 0 9 2 0 0
                                                   0 7 10)))))
           '|lookupComplete|)) 
