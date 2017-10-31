
(SDEFUN |RCAGG-;elt;AvalueS;1| ((|x| A) (T1 "value") ($ S))
        (SPADCALL |x| (QREFELT $ 8))) 

(SDEFUN |RCAGG-;setelt!;Avalue2S;2| ((|x| A) (T2 "value") (|y| S) ($ S))
        (SPADCALL |x| |y| (QREFELT $ 11))) 

(SDEFUN |RCAGG-;child?;2AB;3| ((|x| A) (|l| A) ($ |Boolean|))
        (SPADCALL |x| (SPADCALL |l| (QREFELT $ 14)) (QREFELT $ 17))) 

(SDEFUN |RCAGG-;parts;AL;4| ((|x| A) ($ |List| S))
        (SPROG ((#1=#:G717 NIL) (|i| NIL) (#2=#:G716 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|RCAGG-;parts;AL;4|))
                 (SEQ (LETT |i| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 19)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 8)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(DECLAIM (NOTINLINE |RecursiveAggregate&;|)) 

(DEFUN |RecursiveAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RecursiveAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|RecursiveAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 22) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|shallowlyMutable|))
                                              (|HasCategory| |#2|
                                                             '(|BasicType|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 12
                      (CONS (|dispatchFunction| |RCAGG-;setelt!;Avalue2S;2|)
                            $))))
          (COND
           ((|HasCategory| |#1| '(|BasicType|))
            (COND
             ((|testBitVector| |pv$| 2)
              (QSETREFV $ 18
                        (CONS (|dispatchFunction| |RCAGG-;child?;2AB;3|)
                              $))))))
          (COND
           ((|HasCategory| |#1| '(|finiteAggregate|))
            (QSETREFV $ 21 (CONS (|dispatchFunction| |RCAGG-;parts;AL;4|) $))))
          $))) 

(MAKEPROP '|RecursiveAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |value|) '"value" |RCAGG-;elt;AvalueS;1| (5 . |setvalue!|)
              (11 . |setelt!|) (|List| $) (18 . |children|) (|Boolean|)
              (|List| 6) (23 . |member?|) (29 . |child?|) (35 . |nodes|)
              (|List| 7) (40 . |parts|))
           '#(|setelt!| 45 |parts| 52 |elt| 57 |child?| 63) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 21
                                                 '(1 6 7 0 8 2 6 7 0 7 11 3 0 7
                                                   0 9 7 12 1 6 13 0 14 2 16 15
                                                   6 0 17 2 0 15 0 0 18 1 6 13
                                                   0 19 1 0 20 0 21 3 0 7 0 9 7
                                                   12 1 0 20 0 21 2 0 7 0 9 10
                                                   2 0 15 0 0 18)))))
           '|lookupComplete|)) 
