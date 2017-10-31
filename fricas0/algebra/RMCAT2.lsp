
(SDEFUN |RMCAT2;map;MM1M2;1| ((|f| |Mapping| R2 R1) (|mat| M1) ($ M2))
        (SPROG
         ((#1=#:G701 NIL) (|j| NIL) (#2=#:G702 NIL) (|l| NIL) (#3=#:G699 NIL)
          (|i| NIL) (#4=#:G700 NIL) (|k| NIL) (|ans| (M2)))
         (SEQ
          (LETT |ans|
                (MAKE_MATRIX1 (QREFELT $ 6) (QREFELT $ 7)
                              (|spadConstant| $ 16))
                . #5=(|RMCAT2;map;MM1M2;1|))
          (SEQ (LETT |k| (SPADCALL |ans| (QREFELT $ 20)) . #5#)
               (LETT #4# (SPADCALL |ans| (QREFELT $ 21)) . #5#)
               (LETT |i| (SPADCALL |mat| (QREFELT $ 18)) . #5#)
               (LETT #3# (SPADCALL |mat| (QREFELT $ 19)) . #5#) G190
               (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| (SPADCALL |ans| (QREFELT $ 24)) . #5#)
                      (LETT #2# (SPADCALL |ans| (QREFELT $ 25)) . #5#)
                      (LETT |j| (SPADCALL |mat| (QREFELT $ 22)) . #5#)
                      (LETT #1# (SPADCALL |mat| (QREFELT $ 23)) . #5#) G190
                      (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |ans| |k| |l|
                                    (SPADCALL
                                     (SPADCALL |mat| |i| |j| (QREFELT $ 26))
                                     |f|)
                                    1 1)))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |RMCAT2;reduce;MM12R2;2|
        ((|f| |Mapping| R2 R1 R2) (|mat| M1) (|ident| R2) ($ R2))
        (SPROG ((|s| (R2)) (#1=#:G709 NIL) (|j| NIL) (#2=#:G708 NIL) (|i| NIL))
               (SEQ (LETT |s| |ident| . #3=(|RMCAT2;reduce;MM12R2;2|))
                    (SEQ (LETT |i| (SPADCALL |mat| (QREFELT $ 18)) . #3#)
                         (LETT #2# (SPADCALL |mat| (QREFELT $ 19)) . #3#) G190
                         (COND ((> |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ
                            (LETT |j| (SPADCALL |mat| (QREFELT $ 22)) . #3#)
                            (LETT #1# (SPADCALL |mat| (QREFELT $ 23)) . #3#)
                            G190 (COND ((> |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |s|
                                    (SPADCALL
                                     (SPADCALL |mat| |i| |j| (QREFELT $ 26))
                                     |s| |f|)
                                    . #3#)))
                            (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                            (EXIT NIL))))
                         (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT |s|)))) 

(DECLAIM (NOTINLINE |RectangularMatrixCategoryFunctions2;|)) 

(DEFUN |RectangularMatrixCategoryFunctions2| (&REST #1=#:G710)
  (SPROG NIL
         (PROG (#2=#:G711)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RectangularMatrixCategoryFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|RectangularMatrixCategoryFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |RectangularMatrixCategoryFunctions2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|RectangularMatrixCategoryFunctions2|)))))))))) 

(DEFUN |RectangularMatrixCategoryFunctions2;|
       (|#1| |#2| |#3| |#4| |#5| |#6| |#7| |#8| |#9| |#10|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$10 NIL) (DV$9 NIL) (DV$8 NIL)
    (DV$7 NIL) (DV$6 NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|RectangularMatrixCategoryFunctions2|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT DV$6 (|devaluate| |#6|) . #1#)
    (LETT DV$7 (|devaluate| |#7|) . #1#)
    (LETT DV$8 (|devaluate| |#8|) . #1#)
    (LETT DV$9 (|devaluate| |#9|) . #1#)
    (LETT DV$10 (|devaluate| |#10|) . #1#)
    (LETT |dv$|
          (LIST '|RectangularMatrixCategoryFunctions2| DV$1 DV$2 DV$3 DV$4 DV$5
                DV$6 DV$7 DV$8 DV$9 DV$10)
          . #1#)
    (LETT $ (GETREFV 31) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|RectangularMatrixCategoryFunctions2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7 DV$8 DV$9 DV$10)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (QSETREFV $ 11 |#6|)
    (QSETREFV $ 12 |#7|)
    (QSETREFV $ 13 |#8|)
    (QSETREFV $ 14 |#9|)
    (QSETREFV $ 15 |#10|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|RectangularMatrixCategoryFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|local| |#8|) (|local| |#9|) (|local| |#10|)
              (0 . |Zero|) (|Integer|) (4 . |minRowIndex|) (9 . |maxRowIndex|)
              (14 . |minRowIndex|) (19 . |maxRowIndex|) (24 . |minColIndex|)
              (29 . |maxColIndex|) (34 . |minColIndex|) (39 . |maxColIndex|)
              (44 . |qelt|) (|Mapping| 12 8) |RMCAT2;map;MM1M2;1|
              (|Mapping| 12 8 12) |RMCAT2;reduce;MM12R2;2|)
           '#(|reduce| 51 |map| 58) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 30
                                                 '(0 12 0 16 1 11 17 0 18 1 11
                                                   17 0 19 1 15 17 0 20 1 15 17
                                                   0 21 1 11 17 0 22 1 11 17 0
                                                   23 1 15 17 0 24 1 15 17 0 25
                                                   3 11 8 0 17 17 26 3 0 12 29
                                                   11 12 30 2 0 15 27 11
                                                   28)))))
           '|lookupComplete|)) 
