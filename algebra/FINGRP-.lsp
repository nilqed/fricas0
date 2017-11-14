
(SDEFUN |FINGRP-;order;SI;1| ((|x| S) ($ |Integer|))
        (SPROG ((|y| (S)) (|k| (|Integer|)))
               (SEQ (LETT |k| 1 . #1=(|FINGRP-;order;SI;1|))
                    (LETT |y| |x| . #1#)
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |y| (QREFELT $ 8))))
                           (GO G191)))
                         (SEQ (LETT |k| (+ |k| 1) . #1#)
                              (EXIT
                               (LETT |y| (SPADCALL |y| |x| (QREFELT $ 10))
                                     . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |k|)))) 

(DECLAIM (NOTINLINE |FiniteGroup&;|)) 

(DEFUN |FiniteGroup&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteGroup&|))
          (LETT |dv$| (LIST '|FiniteGroup&| DV$1) . #1#)
          (LETT $ (GETREFV 13) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FiniteGroup&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (0 . |one?|)
              (5 . |One|) (9 . *) (|Integer|) |FINGRP-;order;SI;1|)
           '#(|order| 15) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 12
                                                 '(1 6 7 0 8 0 6 0 9 2 6 0 0 0
                                                   10 1 0 11 0 12)))))
           '|lookupComplete|)) 
