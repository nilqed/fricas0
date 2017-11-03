
(SDEFUN |RCAGG-;elt;AvalueS;1| ((|x| A) (T1 "value") ($ S))
        (SPADCALL |x| (QREFELT $ 8))) 

(SDEFUN |RCAGG-;leaves;AL;2| ((|x| A) ($ |List| S))
        (SPROG ((#1=#:G728 NIL) (|y| NIL) (#2=#:G727 NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 12)) NIL)
                      ((SPADCALL |x| (QREFELT $ 13))
                       (LIST (SPADCALL |x| (QREFELT $ 8))))
                      ('T
                       (SPADCALL
                        (PROGN
                         (LETT #2# NIL . #3=(|RCAGG-;leaves;AL;2|))
                         (SEQ (LETT |y| NIL . #3#)
                              (LETT #1# (SPADCALL |x| (QREFELT $ 15)) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |y| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |y| (QREFELT $ 17)) #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 18))))))) 

(SDEFUN |RCAGG-;setelt!;Avalue2S;3| ((|x| A) (T5 "value") (|y| S) ($ S))
        (SPADCALL |x| |y| (QREFELT $ 20))) 

(SDEFUN |RCAGG-;child?;2AB;4| ((|x| A) (|l| A) ($ |Boolean|))
        (SPADCALL |x| (SPADCALL |l| (QREFELT $ 15)) (QREFELT $ 23))) 

(SDEFUN |RCAGG-;parts;AL;5| ((|x| A) ($ |List| S))
        (SPROG ((#1=#:G734 NIL) (|i| NIL) (#2=#:G733 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|RCAGG-;parts;AL;5|))
                 (SEQ (LETT |i| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 25)) . #3#) G190
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
          (LETT $ (GETREFV 27) . #1#)
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
            (QSETREFV $ 21
                      (CONS (|dispatchFunction| |RCAGG-;setelt!;Avalue2S;3|)
                            $))))
          (COND
           ((|HasCategory| |#1| '(|BasicType|))
            (COND
             ((|testBitVector| |pv$| 2)
              (QSETREFV $ 24
                        (CONS (|dispatchFunction| |RCAGG-;child?;2AB;4|)
                              $))))))
          (COND
           ((|HasCategory| |#1| '(|finiteAggregate|))
            (QSETREFV $ 26 (CONS (|dispatchFunction| |RCAGG-;parts;AL;5|) $))))
          $))) 

(MAKEPROP '|RecursiveAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |value|) '"value" |RCAGG-;elt;AvalueS;1| (|Boolean|)
              (5 . |empty?|) (10 . |leaf?|) (|List| $) (15 . |children|)
              (|List| 7) (20 . |leaves|) (25 . |concat|) |RCAGG-;leaves;AL;2|
              (30 . |setvalue!|) (36 . |setelt!|) (|List| 6) (43 . |member?|)
              (49 . |child?|) (55 . |nodes|) (60 . |parts|))
           '#(|setelt!| 65 |parts| 72 |leaves| 77 |elt| 82 |child?| 88) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 26
                                                 '(1 6 7 0 8 1 6 11 0 12 1 6 11
                                                   0 13 1 6 14 0 15 1 6 16 0 17
                                                   1 16 0 14 18 2 6 7 0 7 20 3
                                                   0 7 0 9 7 21 2 22 11 6 0 23
                                                   2 0 11 0 0 24 1 6 14 0 25 1
                                                   0 16 0 26 3 0 7 0 9 7 21 1 0
                                                   16 0 26 1 0 16 0 19 2 0 7 0
                                                   9 10 2 0 11 0 0 24)))))
           '|lookupComplete|)) 
