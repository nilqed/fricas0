
(SDEFUN |POSETF;addDimensionToObjects|
        ((|a| |List| (|List| S)) (|newObj| S) ($ |List| (|List| S)))
        (SPROG
         ((|b| (|List| (|List| S))) (|x1| (|List| S)) (#1=#:G713 NIL)
          (|x| NIL))
         (SEQ (LETT |b| NIL . #2=(|POSETF;addDimensionToObjects|))
              (SEQ (LETT |x| NIL . #2#) (LETT #1# |a| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |x1| (SPADCALL |x| |newObj| (QREFELT $ 8)) . #2#)
                        (EXIT
                         (LETT |b| (SPADCALL |b| |x1| (QREFELT $ 10)) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |a| |b| (QREFELT $ 11)))))) 

(SDEFUN |POSETF;addDimensionToArrows|
        ((|a| |List| (|List| (|Boolean|))) ($ |List| (|List| (|Boolean|))))
        (SPROG
         ((|res| (|List| #1=(|List| (|Boolean|)))) (|fst| #2=(|Boolean|))
          (|thisRow| #1#) (|topRight| #2#) (#3=#:G728 NIL) (|y| NIL)
          (|yrepeat| NIL) (#4=#:G727 NIL) (|x| NIL) (|xrepeat| NIL))
         (SEQ (LETT |res| (LIST NIL) . #5=(|POSETF;addDimensionToArrows|))
              (LETT |fst| 'T . #5#)
              (SEQ (LETT |xrepeat| 1 . #5#) G190
                   (COND ((|greater_SI| |xrepeat| 2) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |x| NIL . #5#) (LETT #4# |a| . #5#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                            (GO G191)))
                          (SEQ (LETT |thisRow| NIL . #5#)
                               (SEQ (LETT |yrepeat| 1 . #5#) G190
                                    (COND
                                     ((|greater_SI| |yrepeat| 2) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ (LETT |y| NIL . #5#)
                                           (LETT #3# |x| . #5#) G190
                                           (COND
                                            ((OR (ATOM #3#)
                                                 (PROGN
                                                  (LETT |y| (CAR #3#) . #5#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |topRight|
                                                  (COND
                                                   ((EQL |xrepeat| 1)
                                                    (EQL |yrepeat| 2))
                                                   ('T NIL))
                                                  . #5#)
                                            (EXIT
                                             (LETT |thisRow|
                                                   (SPADCALL |thisRow|
                                                             (COND
                                                              (|topRight| NIL)
                                                              ('T |y|))
                                                             (QREFELT $ 14))
                                                   . #5#)))
                                           (LETT #3# (CDR #3#) . #5#) (GO G190)
                                           G191 (EXIT NIL))))
                                    (LETT |yrepeat| (|inc_SI| |yrepeat|) . #5#)
                                    (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (COND
                                 (|fst|
                                  (SEQ
                                   (LETT |res|
                                         (LIST
                                          (SPADCALL |thisRow| (QREFELT $ 15)))
                                         . #5#)
                                   (EXIT (LETT |fst| NIL . #5#))))
                                 ('T
                                  (LETT |res|
                                        (SPADCALL |res|
                                                  (SPADCALL |thisRow|
                                                            (QREFELT $ 15))
                                                  (QREFELT $ 17))
                                        . #5#)))))
                          (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |xrepeat| (|inc_SI| |xrepeat|) . #5#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |POSETF;powerset;LFbcpo;3|
        ((|objs| |List| S) ($ |FiniteBiCPO| (|List| S)))
        (SPROG
         ((|arrows| (|List| (|List| (|Boolean|)))) (|eles| (|List| (|List| S)))
          (#1=#:G733 NIL) (|x| NIL))
         (SEQ (LETT |eles| (LIST NIL) . #2=(|POSETF;powerset;LFbcpo;3|))
              (LETT |arrows| (LIST (LIST 'T)) . #2#)
              (SEQ (LETT |x| NIL . #2#) (LETT #1# |objs| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |eles| (|POSETF;addDimensionToObjects| |eles| |x| $)
                          . #2#)
                    (EXIT
                     (LETT |arrows| (|POSETF;addDimensionToArrows| |arrows| $)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |eles| |arrows| (QREFELT $ 19)))))) 

(SDEFUN |POSETF;completelyOrderedSet;LFbcpo;4|
        ((|objs| |List| S) ($ |FiniteBiCPO| S))
        (SPROG
         ((|arrows| (|List| (|List| (|Boolean|)))) (|row| (|List| (|Boolean|)))
          (|g| (|Boolean|)) (#1=#:G741 NIL) (|y| NIL) (#2=#:G740 NIL) (|x| NIL)
          (|dim| (|NonNegativeInteger|)))
         (SEQ
          (LETT |dim| (LENGTH |objs|)
                . #3=(|POSETF;completelyOrderedSet;LFbcpo;4|))
          (LETT |arrows| (LIST NIL) . #3#)
          (SEQ (LETT |x| 1 . #3#) (LETT #2# |dim| . #3#) G190
               (COND ((|greater_SI| |x| #2#) (GO G191)))
               (SEQ (LETT |row| NIL . #3#)
                    (SEQ (LETT |y| 1 . #3#) (LETT #1# |dim| . #3#) G190
                         (COND ((|greater_SI| |y| #1#) (GO G191)))
                         (SEQ
                          (LETT |g| (COND ((>= |x| |y|) 'T) ('T NIL)) . #3#)
                          (EXIT
                           (LETT |row| (SPADCALL |row| |g| (QREFELT $ 14))
                                 . #3#)))
                         (LETT |y| (|inc_SI| |y|) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (LETT |arrows| (SPADCALL |arrows| |row| (QREFELT $ 17))
                           . #3#)))
               (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |objs| |arrows| (QREFELT $ 22)))))) 

(SDEFUN |POSETF;posetN5;LFbcpo;5| ((|objs| |List| S) ($ |FiniteBiCPO| S))
        (SPADCALL |objs|
                  (LIST (LIST 'T 'T 'T 'T 'T) (LIST NIL 'T NIL NIL 'T)
                        (LIST NIL NIL 'T 'T 'T) (LIST NIL NIL NIL 'T 'T)
                        (LIST NIL NIL NIL NIL 'T))
                  (QREFELT $ 22))) 

(SDEFUN |POSETF;posetM5;LFbcpo;6| ((|objs| |List| S) ($ |FiniteBiCPO| S))
        (SPADCALL |objs|
                  (LIST (LIST 'T 'T 'T 'T 'T) (LIST NIL 'T NIL NIL 'T)
                        (LIST NIL NIL 'T NIL 'T) (LIST NIL NIL NIL 'T 'T)
                        (LIST NIL NIL NIL NIL 'T))
                  (QREFELT $ 22))) 

(SDEFUN |POSETF;posetO6;LFbcpo;7| ((|objs| |List| S) ($ |FiniteBiCPO| S))
        (SPADCALL |objs|
                  (LIST (LIST 'T 'T 'T 'T 'T 'T) (LIST NIL 'T 'T NIL NIL 'T)
                        (LIST NIL NIL 'T NIL NIL 'T)
                        (LIST NIL NIL NIL 'T 'T 'T)
                        (LIST NIL NIL NIL NIL 'T 'T)
                        (LIST NIL NIL NIL NIL NIL 'T))
                  (QREFELT $ 22))) 

(SDEFUN |POSETF;posetP6;LFbcpo;8| ((|objs| |List| S) ($ |FiniteBiCPO| S))
        (SPADCALL |objs|
                  (LIST (LIST 'T 'T 'T 'T 'T 'T) (LIST NIL 'T 'T NIL 'T 'T)
                        (LIST NIL NIL 'T NIL NIL 'T) (LIST NIL NIL 'T 'T 'T 'T)
                        (LIST NIL NIL NIL NIL 'T 'T)
                        (LIST NIL NIL NIL NIL NIL 'T))
                  (QREFELT $ 22))) 

(SDEFUN |POSETF;posetL7;LFbcpo;9| ((|objs| |List| S) ($ |FiniteBiCPO| S))
        (SPADCALL |objs|
                  (LIST (LIST 'T 'T 'T 'T 'T 'T 'T)
                        (LIST NIL 'T NIL 'T 'T NIL 'T)
                        (LIST NIL NIL 'T NIL 'T 'T 'T)
                        (LIST NIL NIL NIL 'T NIL NIL 'T)
                        (LIST NIL NIL NIL NIL 'T NIL 'T)
                        (LIST NIL NIL NIL NIL NIL 'T 'T)
                        (LIST NIL NIL NIL NIL NIL NIL 'T))
                  (QREFELT $ 22))) 

(DECLAIM (NOTINLINE |PosetFactory;|)) 

(DEFUN |PosetFactory| (#1=#:G757)
  (SPROG NIL
         (PROG (#2=#:G758)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PosetFactory|)
                                               '|domainEqualList|)
                    . #3=(|PosetFactory|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PosetFactory;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|PosetFactory|)))))))))) 

(DEFUN |PosetFactory;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PosetFactory|))
          (LETT |dv$| (LIST '|PosetFactory| DV$1) . #1#)
          (LETT $ (GETREFV 31) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PosetFactory| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PosetFactory| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 6) (0 . |concat|)
              (|List| 7) (6 . |concat|) (12 . |concat|) (|Boolean|) (|List| 12)
              (18 . |concat|) (24 . |copy|) (|List| 13) (29 . |concat|)
              (|FiniteBiCPO| 7) (35 . |finitePoset|) |POSETF;powerset;LFbcpo;3|
              (|FiniteBiCPO| 6) (41 . |finitePoset|)
              |POSETF;completelyOrderedSet;LFbcpo;4| (47 . |true|)
              (51 . |false|) |POSETF;posetN5;LFbcpo;5|
              |POSETF;posetM5;LFbcpo;6| |POSETF;posetO6;LFbcpo;7|
              |POSETF;posetP6;LFbcpo;8| |POSETF;posetL7;LFbcpo;9|)
           '#(|powerset| 55 |posetP6| 60 |posetO6| 65 |posetN5| 70 |posetM5| 75
              |posetL7| 80 |completelyOrderedSet| 85)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 30
                                                 '(2 7 0 0 6 8 2 9 0 0 7 10 2 9
                                                   0 0 0 11 2 13 0 0 12 14 1 13
                                                   0 0 15 2 16 0 0 13 17 2 18 0
                                                   9 16 19 2 21 0 7 16 22 0 12
                                                   0 24 0 12 0 25 1 0 18 7 20 1
                                                   0 21 7 29 1 0 21 7 28 1 0 21
                                                   7 26 1 0 21 7 27 1 0 21 7 30
                                                   1 0 21 7 23)))))
           '|lookupComplete|)) 
