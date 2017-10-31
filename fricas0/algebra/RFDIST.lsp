
(SDEFUN |RFDIST;uniform01;F;1| (($ |Float|))
        (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 13)) (QREFELT $ 11))
                  (QREFELT $ 12) (QREFELT $ 14))) 

(SDEFUN |RFDIST;uniform;2FM;2|
        ((|a| |Float|) (|b| |Float|) ($ |Mapping| (|Float|)))
        (SPROG NIL (CONS #'|RFDIST;uniform;2FM;2!0| (VECTOR |b| $ |a|)))) 

(SDEFUN |RFDIST;uniform;2FM;2!0| (($$ NIL))
        (PROG (|a| $ |b|)
          (LETT |a| (QREFELT $$ 2) . #1=(|RFDIST;uniform;2FM;2|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |b| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |a|
                      (SPADCALL (SPADCALL (QREFELT $ 15))
                                (SPADCALL |b| |a| (QREFELT $ 16))
                                (QREFELT $ 17))
                      (QREFELT $ 18)))))) 

(SDEFUN |RFDIST;exponential1;F;3| (($ |Float|))
        (SPROG ((|u| (|Float|)))
               (SEQ
                (LETT |u| (|spadConstant| $ 21)
                      . #1=(|RFDIST;exponential1;F;3|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |u| (|spadConstant| $ 21) (QREFELT $ 23)))
                       (GO G191)))
                     (SEQ (EXIT (LETT |u| (SPADCALL (QREFELT $ 15)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL (SPADCALL |u| (QREFELT $ 24)) (QREFELT $ 25)))))) 

(SDEFUN |RFDIST;exponential;FM;4| ((|mean| |Float|) ($ |Mapping| (|Float|)))
        (SPROG NIL (CONS #'|RFDIST;exponential;FM;4!0| (VECTOR $ |mean|)))) 

(SDEFUN |RFDIST;exponential;FM;4!0| (($$ NIL))
        (PROG (|mean| $)
          (LETT |mean| (QREFELT $$ 1) . #1=(|RFDIST;exponential;FM;4|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (SPADCALL |mean| (SPADCALL (QREFELT $ 26)) (QREFELT $ 17)))))) 

(SDEFUN |RFDIST;normal01;F;5| (($ |Float|))
        (SPROG ((|s| (|Float|)) (|v2| #1=(|Float|)) (|v1| #1#))
               (SEQ
                (LETT |s| (SPADCALL 2 (QREFELT $ 11))
                      . #2=(|RFDIST;normal01;F;5|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |s| (|spadConstant| $ 10) (QREFELT $ 28)))
                       (GO G191)))
                     (SEQ
                      (LETT |v1|
                            (SPADCALL
                             (SPADCALL 2 (SPADCALL (QREFELT $ 15))
                                       (QREFELT $ 30))
                             (|spadConstant| $ 10) (QREFELT $ 16))
                            . #2#)
                      (LETT |v2|
                            (SPADCALL
                             (SPADCALL 2 (SPADCALL (QREFELT $ 15))
                                       (QREFELT $ 30))
                             (|spadConstant| $ 10) (QREFELT $ 16))
                            . #2#)
                      (EXIT
                       (LETT |s|
                             (SPADCALL (SPADCALL |v1| 2 (QREFELT $ 31))
                                       (SPADCALL |v2| 2 (QREFELT $ 31))
                                       (QREFELT $ 18))
                             . #2#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL |v1|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL 2 (SPADCALL |s| (QREFELT $ 24))
                                        (QREFELT $ 30))
                              |s| (QREFELT $ 14))
                             (QREFELT $ 25))
                            (QREFELT $ 32))
                           (QREFELT $ 17)))))) 

(SDEFUN |RFDIST;normal;2FM;6|
        ((|mean| |Float|) (|stdev| |Float|) ($ |Mapping| (|Float|)))
        (SPROG NIL (CONS #'|RFDIST;normal;2FM;6!0| (VECTOR $ |stdev| |mean|)))) 

(SDEFUN |RFDIST;normal;2FM;6!0| (($$ NIL))
        (PROG (|mean| |stdev| $)
          (LETT |mean| (QREFELT $$ 2) . #1=(|RFDIST;normal;2FM;6|))
          (LETT |stdev| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |mean|
                      (SPADCALL |stdev| (SPADCALL (QREFELT $ 33))
                                (QREFELT $ 17))
                      (QREFELT $ 18)))))) 

(SDEFUN |RFDIST;chiSquare1;NniF;7|
        ((|dgfree| |NonNegativeInteger|) ($ |Float|))
        (SPROG ((|x| (|Float|)) (#1=#:G717 NIL) (|i| NIL))
               (SEQ
                (LETT |x| (|spadConstant| $ 21)
                      . #2=(|RFDIST;chiSquare1;NniF;7|))
                (SEQ (LETT |i| 1 . #2#) (LETT #1# (QUOTIENT2 |dgfree| 2) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |x|
                             (SPADCALL |x|
                                       (SPADCALL 2 (SPADCALL (QREFELT $ 26))
                                                 (QREFELT $ 30))
                                       (QREFELT $ 18))
                             . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((ODDP |dgfree|)
                  (LETT |x|
                        (SPADCALL |x|
                                  (SPADCALL (SPADCALL (QREFELT $ 33)) 2
                                            (QREFELT $ 35))
                                  (QREFELT $ 18))
                        . #2#)))
                (EXIT |x|)))) 

(SDEFUN |RFDIST;chiSquare;NniM;8|
        ((|dgfree| |NonNegativeInteger|) ($ |Mapping| (|Float|)))
        (SPROG NIL (CONS #'|RFDIST;chiSquare;NniM;8!0| (VECTOR $ |dgfree|)))) 

(SDEFUN |RFDIST;chiSquare;NniM;8!0| (($$ NIL))
        (PROG (|dgfree| $)
          (LETT |dgfree| (QREFELT $$ 1) . #1=(|RFDIST;chiSquare;NniM;8|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |dgfree| (QREFELT $ 37)))))) 

(SDEFUN |RFDIST;Beta;2NniM;9|
        ((|dgfree1| |NonNegativeInteger|) (|dgfree2| |NonNegativeInteger|)
         ($ |Mapping| (|Float|)))
        (SPROG NIL
               (SEQ
                (CONS #'|RFDIST;Beta;2NniM;9!0|
                      (VECTOR |dgfree2| $ |dgfree1|))))) 

(SDEFUN |RFDIST;Beta;2NniM;9!0| (($$ NIL))
        (PROG (|dgfree1| $ |dgfree2|)
          (LETT |dgfree1| (QREFELT $$ 2) . #1=(|RFDIST;Beta;2NniM;9|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |dgfree2| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|y1| NIL) (|y2| NIL))
                   (SEQ (LETT |y1| (SPADCALL |dgfree1| (QREFELT $ 37)) NIL)
                        (LETT |y2| (SPADCALL |dgfree2| (QREFELT $ 37)) NIL)
                        (EXIT
                         (SPADCALL |y1| (SPADCALL |y1| |y2| (QREFELT $ 18))
                                   (QREFELT $ 14))))))))) 

(SDEFUN |RFDIST;F;2NniM;10|
        ((|dgfree1| |NonNegativeInteger|) (|dgfree2| |NonNegativeInteger|)
         ($ |Mapping| (|Float|)))
        (SPROG NIL
               (SEQ
                (CONS #'|RFDIST;F;2NniM;10!0| (VECTOR |dgfree2| $ |dgfree1|))))) 

(SDEFUN |RFDIST;F;2NniM;10!0| (($$ NIL))
        (PROG (|dgfree1| $ |dgfree2|)
          (LETT |dgfree1| (QREFELT $$ 2) . #1=(|RFDIST;F;2NniM;10|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |dgfree2| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|y1| NIL) (|y2| NIL))
                   (SEQ (LETT |y1| (SPADCALL |dgfree1| (QREFELT $ 37)) NIL)
                        (LETT |y2| (SPADCALL |dgfree2| (QREFELT $ 37)) NIL)
                        (EXIT
                         (SPADCALL (SPADCALL |dgfree2| |y1| (QREFELT $ 40))
                                   (SPADCALL |dgfree1| |y2| (QREFELT $ 40))
                                   (QREFELT $ 14))))))))) 

(SDEFUN |RFDIST;t;NniM;11|
        ((|dgfree| |NonNegativeInteger|) ($ |Mapping| (|Float|)))
        (SPROG NIL (SEQ (CONS #'|RFDIST;t;NniM;11!0| (VECTOR |dgfree| $))))) 

(SDEFUN |RFDIST;t;NniM;11!0| (($$ NIL))
        (PROG ($ |dgfree|)
          (LETT $ (QREFELT $$ 1) . #1=(|RFDIST;t;NniM;11|))
          (LETT |dgfree| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|n| NIL) (|d| NIL))
                   (SEQ (LETT |n| (SPADCALL (QREFELT $ 33)) NIL)
                        (LETT |d|
                              (SPADCALL (SPADCALL |dgfree| (QREFELT $ 37))
                                        (SPADCALL |dgfree| (QREFELT $ 11))
                                        (QREFELT $ 14))
                              NIL)
                        (EXIT
                         (SPADCALL |n| (SPADCALL |d| (QREFELT $ 32))
                                   (QREFELT $ 14))))))))) 

(DECLAIM (NOTINLINE |RandomFloatDistributions;|)) 

(DEFUN |RandomFloatDistributions| ()
  (SPROG NIL
         (PROG (#1=#:G736)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|RandomFloatDistributions|)
                    . #2=(|RandomFloatDistributions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|RandomFloatDistributions|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|RandomFloatDistributions;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|RandomFloatDistributions|)))))))))) 

(DEFUN |RandomFloatDistributions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|RandomFloatDistributions|)
                . #1=(|RandomFloatDistributions|))
          (LETT $ (GETREFV 43) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RandomFloatDistributions| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 12
                    (SPADCALL (- (SPADCALL (QREFELT $ 8)) 1) (QREFELT $ 11)))
          $))) 

(MAKEPROP '|RandomFloatDistributions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|RandomNumberSource|)
              (0 . |size|) (|Float|) (4 . |One|) (8 . |coerce|) '|rnmax|
              (13 . |randnum|) (17 . /) |RFDIST;uniform01;F;1| (23 . -)
              (29 . *) (35 . +) (|Mapping| 9) |RFDIST;uniform;2FM;2|
              (41 . |Zero|) (|Boolean|) (45 . =) (51 . |log|) (56 . -)
              |RFDIST;exponential1;F;3| |RFDIST;exponential;FM;4| (61 . >=)
              (|PositiveInteger|) (67 . *) (73 . ^) (79 . |sqrt|)
              |RFDIST;normal01;F;5| |RFDIST;normal;2FM;6| (84 . ^)
              (|NonNegativeInteger|) |RFDIST;chiSquare1;NniF;7|
              |RFDIST;chiSquare;NniM;8| |RFDIST;Beta;2NniM;9| (90 . *)
              |RFDIST;F;2NniM;10| |RFDIST;t;NniM;11|)
           '#(|uniform01| 96 |uniform| 100 |t| 106 |normal01| 111 |normal| 115
              |exponential1| 121 |exponential| 125 |chiSquare1| 130 |chiSquare|
              135 F 140 |Beta| 146)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 42
                                                 '(0 7 6 8 0 9 0 10 1 9 0 6 11
                                                   0 7 6 13 2 9 0 0 0 14 2 9 0
                                                   0 0 16 2 9 0 0 0 17 2 9 0 0
                                                   0 18 0 9 0 21 2 9 22 0 0 23
                                                   1 9 0 0 24 1 9 0 0 25 2 9 22
                                                   0 0 28 2 9 0 29 0 30 2 9 0 0
                                                   29 31 1 9 0 0 32 2 9 0 0 6
                                                   35 2 9 0 36 0 40 0 0 9 15 2
                                                   0 19 9 9 20 1 0 19 36 42 0 0
                                                   9 33 2 0 19 9 9 34 0 0 9 26
                                                   1 0 19 9 27 1 0 9 36 37 1 0
                                                   19 36 38 2 0 19 36 36 41 2 0
                                                   19 36 36 39)))))
           '|lookupComplete|)) 

(MAKEPROP '|RandomFloatDistributions| 'NILADIC T) 
