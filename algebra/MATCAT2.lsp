
(SDEFUN |MATCAT2;map;MM1M2;1| ((|f| |Mapping| R2 R1) (|m| M1) ($ M2))
        (SPROG
         ((#1=#:G703 NIL) (|j| NIL) (#2=#:G704 NIL) (|l| NIL) (#3=#:G701 NIL)
          (|i| NIL) (#4=#:G702 NIL) (|k| NIL) (|ans| (M2)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT $ 15))
                          (SPADCALL |m| (QREFELT $ 16)) (|spadConstant| $ 17)
                          (QREFELT $ 18))
                . #5=(|MATCAT2;map;MM1M2;1|))
          (SEQ (LETT |k| (SPADCALL |ans| (QREFELT $ 22)) . #5#)
               (LETT #4# (SPADCALL |ans| (QREFELT $ 23)) . #5#)
               (LETT |i| (SPADCALL |m| (QREFELT $ 20)) . #5#)
               (LETT #3# (SPADCALL |m| (QREFELT $ 21)) . #5#) G190
               (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| (SPADCALL |ans| (QREFELT $ 26)) . #5#)
                      (LETT #2# (SPADCALL |ans| (QREFELT $ 27)) . #5#)
                      (LETT |j| (SPADCALL |m| (QREFELT $ 24)) . #5#)
                      (LETT #1# (SPADCALL |m| (QREFELT $ 25)) . #5#) G190
                      (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |k| |l|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| (QREFELT $ 28)) |f|)
                                  (QREFELT $ 29))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |MATCAT2;map;MM1U;2|
        ((|f| |Mapping| (|Union| R2 "failed") R1) (|m| M1)
         ($ |Union| M2 "failed"))
        (SPROG
         ((#1=#:G709 NIL) (#2=#:G723 NIL) (|r| (|Union| R2 #3="failed"))
          (#4=#:G726 NIL) (|j| NIL) (#5=#:G727 NIL) (|l| NIL) (#6=#:G724 NIL)
          (|i| NIL) (#7=#:G725 NIL) (|k| NIL) (|ans| (M2)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ans|
                  (SPADCALL (SPADCALL |m| (QREFELT $ 15))
                            (SPADCALL |m| (QREFELT $ 16)) (|spadConstant| $ 17)
                            (QREFELT $ 18))
                  . #8=(|MATCAT2;map;MM1U;2|))
            (SEQ (LETT |k| (SPADCALL |ans| (QREFELT $ 22)) . #8#)
                 (LETT #7# (SPADCALL |ans| (QREFELT $ 23)) . #8#)
                 (LETT |i| (SPADCALL |m| (QREFELT $ 20)) . #8#)
                 (LETT #6# (SPADCALL |m| (QREFELT $ 21)) . #8#) G190
                 (COND ((OR (> |i| #6#) (> |k| #7#)) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |l| (SPADCALL |ans| (QREFELT $ 26)) . #8#)
                        (LETT #5# (SPADCALL |ans| (QREFELT $ 27)) . #8#)
                        (LETT |j| (SPADCALL |m| (QREFELT $ 24)) . #8#)
                        (LETT #4# (SPADCALL |m| (QREFELT $ 25)) . #8#) G190
                        (COND ((OR (> |j| #4#) (> |l| #5#)) (GO G191)))
                        (SEQ
                         (LETT |r|
                               (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 28))
                                         |f|)
                               . #8#)
                         (EXIT
                          (COND
                           ((SPADCALL |r| (CONS 1 "failed") (QREFELT $ 34))
                            (PROGN
                             (LETT #2# (CONS 1 "failed") . #8#)
                             (GO #9=#:G722)))
                           ('T
                            (SPADCALL |ans| |k| |l|
                                      (PROG2 (LETT #1# |r| . #8#)
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (QREFELT $ 10)
                                                        (|Union| (QREFELT $ 10)
                                                                 #3#)
                                                        #1#))
                                      (QREFELT $ 29))))))
                        (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #8#))
                              . #8#)
                        (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #8#)) . #8#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ans|))))
          #9# (EXIT #2#)))) 

(SDEFUN |MATCAT2;reduce;MM12R2;3|
        ((|f| |Mapping| R2 R1 R2) (|m| M1) (|ident| R2) ($ R2))
        (SPROG ((|s| (R2)) (#1=#:G734 NIL) (|j| NIL) (#2=#:G733 NIL) (|i| NIL))
               (SEQ (LETT |s| |ident| . #3=(|MATCAT2;reduce;MM12R2;3|))
                    (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 20)) . #3#)
                         (LETT #2# (SPADCALL |m| (QREFELT $ 21)) . #3#) G190
                         (COND ((> |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 24)) . #3#)
                                (LETT #1# (SPADCALL |m| (QREFELT $ 25)) . #3#)
                                G190 (COND ((> |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |s|
                                        (SPADCALL
                                         (SPADCALL |m| |i| |j| (QREFELT $ 28))
                                         |s| |f|)
                                        . #3#)))
                                (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT |s|)))) 

(DECLAIM (NOTINLINE |MatrixCategoryFunctions2;|)) 

(DEFUN |MatrixCategoryFunctions2| (&REST #1=#:G735)
  (SPROG NIL
         (PROG (#2=#:G736)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MatrixCategoryFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|MatrixCategoryFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MatrixCategoryFunctions2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|MatrixCategoryFunctions2|)))))))))) 

(DEFUN |MatrixCategoryFunctions2;| (|#1| |#2| |#3| |#4| |#5| |#6| |#7| |#8|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$8 NIL) (DV$7 NIL) (DV$6 NIL) (DV$5 NIL)
    (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|MatrixCategoryFunctions2|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT DV$6 (|devaluate| |#6|) . #1#)
    (LETT DV$7 (|devaluate| |#7|) . #1#)
    (LETT DV$8 (|devaluate| |#8|) . #1#)
    (LETT |dv$|
          (LIST '|MatrixCategoryFunctions2| DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7
                DV$8)
          . #1#)
    (LETT $ (GETREFV 40) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|MatrixCategoryFunctions2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7 DV$8) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (QSETREFV $ 11 |#6|)
    (QSETREFV $ 12 |#7|)
    (QSETREFV $ 13 |#8|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|MatrixCategoryFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|local| |#8|) (|NonNegativeInteger|)
              (0 . |nrows|) (5 . |ncols|) (10 . |Zero|) (14 . |new|)
              (|Integer|) (21 . |minRowIndex|) (26 . |maxRowIndex|)
              (31 . |minRowIndex|) (36 . |maxRowIndex|) (41 . |minColIndex|)
              (46 . |maxColIndex|) (51 . |minColIndex|) (56 . |maxColIndex|)
              (61 . |qelt|) (68 . |qsetelt!|) (|Mapping| 10 6)
              |MATCAT2;map;MM1M2;1| (|Boolean|) (|Union| 10 '"failed") (76 . =)
              (|Union| 13 '"failed") (|Mapping| 33 6) |MATCAT2;map;MM1U;2|
              (|Mapping| 10 6 10) |MATCAT2;reduce;MM12R2;3|)
           '#(|reduce| 82 |map| 89) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 39
                                                 '(1 9 14 0 15 1 9 14 0 16 0 10
                                                   0 17 3 13 0 14 14 10 18 1 9
                                                   19 0 20 1 9 19 0 21 1 13 19
                                                   0 22 1 13 19 0 23 1 9 19 0
                                                   24 1 9 19 0 25 1 13 19 0 26
                                                   1 13 19 0 27 3 9 6 0 19 19
                                                   28 4 13 10 0 19 19 10 29 2
                                                   33 32 0 0 34 3 0 10 38 9 10
                                                   39 2 0 13 30 9 31 2 0 35 36
                                                   9 37)))))
           '|lookupComplete|)) 
