
(SDEFUN |PARTPERM;partitions;3IS;1|
        ((M |Integer|) (N |Integer|) (|n| |Integer|)
         ($ |Stream| (|List| (|Integer|))))
        (SPROG ((|c| (|Stream| (|List| (|Integer|)))))
               (SEQ
                (COND
                 ((ZEROP |n|)
                  (SPADCALL NIL (SPADCALL (QREFELT $ 7)) (QREFELT $ 9)))
                 ((OR (ZEROP M) (OR (ZEROP N) (< |n| 0)))
                  (SPADCALL (QREFELT $ 7)))
                 ('T
                  (SEQ
                   (LETT |c|
                         (SPADCALL
                          (CONS #'|PARTPERM;partitions;3IS;1!0| (VECTOR $ N))
                          (SPADCALL (- M 1) N (- |n| N) (QREFELT $ 12))
                          (QREFELT $ 14))
                         |PARTPERM;partitions;3IS;1|)
                   (EXIT
                    (SPADCALL |c| (SPADCALL M (- N 1) |n| (QREFELT $ 12))
                              (QREFELT $ 15))))))))) 

(SDEFUN |PARTPERM;partitions;3IS;1!0| ((|l1| NIL) ($$ NIL))
        (PROG (N $)
          (LETT N (QREFELT $$ 1) . #1=(|PARTPERM;partitions;3IS;1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL N |l1| (QREFELT $ 11)))))) 

(SDEFUN |PARTPERM;partitions;IS;2|
        ((|n| |Integer|) ($ |Stream| (|List| (|Integer|))))
        (SPADCALL |n| |n| |n| (QREFELT $ 12))) 

(SDEFUN |PARTPERM;partitions;2IS;3|
        ((M |Integer|) (N |Integer|) ($ |Stream| (|List| (|Integer|))))
        (SPROG
         ((|aaa| (|List| (|Stream| (|List| (|Integer|))))) (#1=#:G718 NIL)
          (|i| NIL) (#2=#:G717 NIL))
         (SEQ
          (LETT |aaa|
                (PROGN
                 (LETT #2# NIL . #3=(|PARTPERM;partitions;2IS;3|))
                 (SEQ (LETT |i| 0 . #3#) (LETT #1# (* M N) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL M N |i| (QREFELT $ 12)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (SPADCALL (SPADCALL |aaa| (QREFELT $ 19)) (QREFELT $ 21)))))) 

(SDEFUN |PARTPERM;nogreq|
        ((|n| |Integer|) (|x| |List| (|Integer|)) ($ |Integer|))
        (SPROG
         ((#1=#:G720 NIL) (#2=#:G719 #3=(|Integer|)) (#4=#:G721 #3#)
          (#5=#:G723 NIL) (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|PARTPERM;nogreq|))
           (SEQ (LETT |i| NIL . #6#) (LETT #5# |x| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((>= |i| |n|)
                    (PROGN
                     (LETT #4# 1 . #6#)
                     (COND (#1# (LETT #2# (+ #2# #4#) . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #6#)
                             (LETT #1# 'T . #6#)))))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T 0)))))) 

(SDEFUN |PARTPERM;conjugate;2L;5|
        ((|x| |List| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG ((#1=#:G728 NIL) (|i| NIL) (#2=#:G727 NIL))
               (SEQ
                (COND ((NULL |x|) NIL)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|PARTPERM;conjugate;2L;5|))
                        (SEQ (LETT |i| 1 . #3#)
                             (LETT #1# (|SPADfirst| |x|) . #3#) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (|PARTPERM;nogreq| |i| |x| $) #2#)
                                     . #3#)))
                             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |PARTPERM;conjugates;2S;6|
        ((|z| |Stream| (|List| (|Integer|))) ($ |Stream| (|List| (|Integer|))))
        (SPADCALL (ELT $ 23) |z| (QREFELT $ 14))) 

(SDEFUN |PARTPERM;shuffle;2LS;7|
        ((|x| |List| (|Integer|)) (|y| |List| (|Integer|))
         ($ |Stream| (|List| (|Integer|))))
        (SPROG NIL
               (COND
                ((NULL |x|)
                 (SPADCALL |y| (SPADCALL (QREFELT $ 7)) (QREFELT $ 9)))
                ((NULL |y|)
                 (SPADCALL |x| (SPADCALL (QREFELT $ 7)) (QREFELT $ 9)))
                ('T
                 (SPADCALL
                  (SPADCALL (CONS #'|PARTPERM;shuffle;2LS;7!0| (VECTOR $ |x|))
                            (SPADCALL (CDR |x|) |y| (QREFELT $ 26))
                            (QREFELT $ 14))
                  (SPADCALL (CONS #'|PARTPERM;shuffle;2LS;7!1| (VECTOR $ |y|))
                            (SPADCALL |x| (CDR |y|) (QREFELT $ 26))
                            (QREFELT $ 14))
                  (QREFELT $ 15)))))) 

(SDEFUN |PARTPERM;shuffle;2LS;7!1| ((|l1| NIL) ($$ NIL))
        (PROG (|y| $)
          (LETT |y| (QREFELT $$ 1) . #1=(|PARTPERM;shuffle;2LS;7|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |y| (QREFELT $ 25)) |l1| (QREFELT $ 11)))))) 

(SDEFUN |PARTPERM;shuffle;2LS;7!0| ((|l1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|PARTPERM;shuffle;2LS;7|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 25)) |l1| (QREFELT $ 11)))))) 

(SDEFUN |PARTPERM;shufflein;L2S;8|
        ((|x| |List| (|Integer|)) (|yy| |Stream| (|List| (|Integer|)))
         ($ |Stream| (|List| (|Integer|))))
        (SPROG NIL
               (SPADCALL
                (SPADCALL (CONS #'|PARTPERM;shufflein;L2S;8!0| (VECTOR $ |x|))
                          |yy| (QREFELT $ 29))
                (QREFELT $ 21)))) 

(SDEFUN |PARTPERM;shufflein;L2S;8!0| ((|l1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|PARTPERM;shufflein;L2S;8|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |l1| (QREFELT $ 26)))))) 

(SDEFUN |PARTPERM;rpt| ((|n| |Integer|) (|m| |Integer|) ($ |List| (|Integer|)))
        (SPROG ((#1=#:G752 NIL) (|i| NIL) (#2=#:G751 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|PARTPERM;rpt|))
                 (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS |m| #2#) . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |PARTPERM;zrpt|
        ((|x| |List| (|Integer|)) (|y| |List| (|Integer|))
         ($ |Stream| (|List| (|Integer|))))
        (SPADCALL (CONS (|function| |PARTPERM;rpt|) $)
                  (SPADCALL |x| (QREFELT $ 32)) (SPADCALL |y| (QREFELT $ 32))
                  (QREFELT $ 35))) 

(SDEFUN |PARTPERM;sequences;2LS;11|
        ((|x| |List| (|Integer|)) (|y| |List| (|Integer|))
         ($ |Stream| (|List| (|Integer|))))
        (SPADCALL (SPADCALL NIL (SPADCALL (QREFELT $ 7)) (QREFELT $ 9))
                  (ELT $ 30) (|PARTPERM;zrpt| |x| |y| $) (QREFELT $ 37))) 

(SDEFUN |PARTPERM;sequences;LS;12|
        ((|x| |List| (|Integer|)) ($ |Stream| (|List| (|Integer|))))
        (SPROG ((#1=#:G762 NIL) (|i| NIL) (#2=#:G761 NIL))
               (SEQ
                (SPADCALL |x|
                          (PROGN
                           (LETT #2# NIL . #3=(|PARTPERM;sequences;LS;12|))
                           (SEQ (LETT |i| 0 . #3#)
                                (LETT #1# (- (LENGTH |x|) 1) . #3#) G190
                                (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ (EXIT (LETT #2# (CONS |i| #2#) . #3#)))
                                (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 38))))) 

(SDEFUN |PARTPERM;permutations;IS;13|
        ((|n| |Integer|) ($ |Stream| (|List| (|Integer|))))
        (SPROG ((#1=#:G766 NIL) (|i| NIL) (#2=#:G765 NIL))
               (SEQ
                (SPADCALL (|PARTPERM;rpt| |n| 1 $)
                          (PROGN
                           (LETT #2# NIL . #3=(|PARTPERM;permutations;IS;13|))
                           (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
                                (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ (EXIT (LETT #2# (CONS |i| #2#) . #3#)))
                                (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 38))))) 

(DECLAIM (NOTINLINE |PartitionsAndPermutations;|)) 

(DEFUN |PartitionsAndPermutations| ()
  (SPROG NIL
         (PROG (#1=#:G768)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|PartitionsAndPermutations|)
                    . #2=(|PartitionsAndPermutations|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|PartitionsAndPermutations|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|PartitionsAndPermutations;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|PartitionsAndPermutations|)))))))))) 

(DEFUN |PartitionsAndPermutations;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|PartitionsAndPermutations|)
                . #1=(|PartitionsAndPermutations|))
          (LETT $ (GETREFV 41) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PartitionsAndPermutations| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PartitionsAndPermutations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Stream| 8) (0 . |empty|) (|List| 10)
              (4 . |concat|) (|Integer|) (10 . |concat|)
              |PARTPERM;partitions;3IS;1| (|Mapping| 8 8) (16 . |map|)
              (22 . |concat|) |PARTPERM;partitions;IS;2| (|List| 6)
              (|Stream| 6) (28 . |coerce|) (|StreamFunctions1| 8)
              (33 . |concat|) |PARTPERM;partitions;2IS;3|
              |PARTPERM;conjugate;2L;5| |PARTPERM;conjugates;2S;6|
              (38 . |first|) |PARTPERM;shuffle;2LS;7| (|Mapping| 6 8)
              (|StreamFunctions2| 8 6) (43 . |map|) |PARTPERM;shufflein;L2S;8|
              (|Stream| 10) (49 . |coerce|) (|Mapping| 8 10 10)
              (|StreamFunctions3| 10 10 8) (54 . |map|) (|Mapping| 6 8 6)
              (61 . |reduce|) |PARTPERM;sequences;2LS;11|
              |PARTPERM;sequences;LS;12| |PARTPERM;permutations;IS;13|)
           '#(|shufflein| 68 |shuffle| 74 |sequences| 80 |permutations| 91
              |partitions| 96 |conjugates| 114 |conjugate| 119)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 40
                                                 '(0 6 0 7 2 6 0 8 0 9 2 8 0 10
                                                   0 11 2 6 0 13 0 14 2 6 0 0 0
                                                   15 1 18 0 17 19 1 20 6 18 21
                                                   1 8 10 0 25 2 28 18 27 6 29
                                                   1 31 0 8 32 3 34 6 33 31 31
                                                   35 3 28 6 6 36 6 37 2 0 6 8
                                                   6 30 2 0 6 8 8 26 2 0 6 8 8
                                                   38 1 0 6 8 39 1 0 6 10 40 1
                                                   0 6 10 16 3 0 6 10 10 10 12
                                                   2 0 6 10 10 22 1 0 6 6 24 1
                                                   0 8 8 23)))))
           '|lookupComplete|)) 

(MAKEPROP '|PartitionsAndPermutations| 'NILADIC T) 
