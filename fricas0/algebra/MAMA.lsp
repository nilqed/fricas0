
(SDEFUN |MAMA;element;M2IM;1| ((A M) (|r| |Integer|) (|c| |Integer|) ($ M))
        (SPADCALL A |r| |r| |c| |c| (QREFELT $ 11))) 

(SDEFUN |MAMA;rowMatrix;MIM;2| ((A M) (|r| |Integer|) ($ M))
        (SPADCALL A |r| |r| (SPADCALL A (QREFELT $ 13))
                  (SPADCALL A (QREFELT $ 14)) (QREFELT $ 11))) 

(SDEFUN |MAMA;rows;MLM;3| ((A M) (|lst| |List| (|Integer|)) ($ M))
        (SPROG ((|ls| (|List| (|Integer|))) (|nc| (|NonNegativeInteger|)))
               (SEQ
                (LETT |nc| (SPADCALL A (QREFELT $ 17))
                      . #1=(|MAMA;rows;MLM;3|))
                (EXIT
                 (COND
                  ((EQL |nc| 0) (SPADCALL (LENGTH |lst|) |nc| (QREFELT $ 18)))
                  ('T
                   (SEQ
                    (LETT |ls|
                          (SPADCALL
                           (SPADCALL (SPADCALL A (QREFELT $ 13))
                                     (SPADCALL A (QREFELT $ 14))
                                     (QREFELT $ 20))
                           (QREFELT $ 22))
                          . #1#)
                    (EXIT (SPADCALL A |lst| |ls| (QREFELT $ 23)))))))))) 

(SDEFUN |MAMA;rows;MSM;4| ((A M) (|si| |Segment| (|Integer|)) ($ M))
        (SPADCALL A (SPADCALL |si| (QREFELT $ 22)) (QREFELT $ 24))) 

(SDEFUN |MAMA;columnMatrix;MIM;5| ((A M) (|c| |Integer|) ($ M))
        (SPADCALL A (SPADCALL A (QREFELT $ 26)) (SPADCALL A (QREFELT $ 27)) |c|
                  |c| (QREFELT $ 11))) 

(SDEFUN |MAMA;columns;MLM;6| ((A M) (|lst| |List| (|Integer|)) ($ M))
        (SPROG ((|ls| (|List| (|Integer|))) (|nr| (|NonNegativeInteger|)))
               (SEQ
                (LETT |nr| (SPADCALL A (QREFELT $ 29))
                      . #1=(|MAMA;columns;MLM;6|))
                (EXIT
                 (COND
                  ((EQL |nr| 0) (SPADCALL |nr| (LENGTH |lst|) (QREFELT $ 18)))
                  ('T
                   (SEQ
                    (LETT |ls|
                          (SPADCALL
                           (SPADCALL (SPADCALL A (QREFELT $ 26))
                                     (SPADCALL A (QREFELT $ 27))
                                     (QREFELT $ 20))
                           (QREFELT $ 22))
                          . #1#)
                    (EXIT (SPADCALL A |ls| |lst| (QREFELT $ 23)))))))))) 

(SDEFUN |MAMA;columns;MSM;7| ((A M) (|si| |Segment| (|Integer|)) ($ M))
        (SPADCALL A (SPADCALL |si| (QREFELT $ 22)) (QREFELT $ 30))) 

(SDEFUN |MAMA;fill_diagonal|
        ((B M) (A M) (|nr| |NonNegativeInteger|) (|nc| |NonNegativeInteger|)
         (|n| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G721 NIL) (|i| NIL) (|sc| (|Integer|)) (|sr| (|Integer|))
          (|dl| (|Integer|)))
         (SEQ
          (COND
           ((SPADCALL |n| (- |nc| 1) (QREFELT $ 33))
            (|error| "requested diagonal out of range"))
           (#2='T
            (SEQ
             (COND
              ((< |n| 0)
               (COND
                ((SPADCALL (ABS |n|) (- |nr| 1) (QREFELT $ 33))
                 (EXIT (|error| "requested diagonal out of range"))))))
             (COND
              ((>= |n| 0)
               (SEQ
                (LETT |dl| (MIN (- |nc| |n|) |nr|) . #3=(|MAMA;fill_diagonal|))
                (LETT |sr| (SPADCALL A (QREFELT $ 26)) . #3#)
                (EXIT (LETT |sc| (+ (SPADCALL A (QREFELT $ 13)) |n|) . #3#))))
              (#2#
               (SEQ (LETT |dl| (MIN |nc| (- |nr| (ABS |n|))) . #3#)
                    (LETT |sr| (+ (SPADCALL A (QREFELT $ 26)) (ABS |n|)) . #3#)
                    (EXIT (LETT |sc| (SPADCALL A (QREFELT $ 13)) . #3#)))))
             (EXIT
              (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |dl| 1) . #3#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL B (+ |sr| |i|) (+ |sc| |i|)
                               (SPADCALL A (+ |sr| |i|) (+ |sc| |i|)
                                         (QREFELT $ 34))
                               (QREFELT $ 35))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                   (EXIT NIL))))))))) 

(SDEFUN |MAMA;diagonalMatrix;MIM;9| ((A M) (|n| |Integer|) ($ M))
        (SPROG
         ((B (M)) (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nr| (SPADCALL A (QREFELT $ 29))
                . #1=(|MAMA;diagonalMatrix;MIM;9|))
          (LETT |nc| (SPADCALL A (QREFELT $ 17)) . #1#)
          (LETT B (SPADCALL |nr| |nc| (|spadConstant| $ 36) (QREFELT $ 37))
                . #1#)
          (|MAMA;fill_diagonal| B A |nr| |nc| |n| $) (EXIT B)))) 

(SDEFUN |MAMA;diagonalMatrix;2M;10| ((A M) ($ M)) (SPADCALL A 0 (QREFELT $ 38))) 

(SDEFUN |MAMA;bandMatrix;MLM;11| ((A M) (|ln| |List| (|Integer|)) ($ M))
        (SPROG
         ((#1=#:G728 NIL) (|n| NIL) (B (M)) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nr| (SPADCALL A (QREFELT $ 29))
                . #2=(|MAMA;bandMatrix;MLM;11|))
          (LETT |nc| (SPADCALL A (QREFELT $ 17)) . #2#)
          (LETT B (SPADCALL |nr| |nc| (|spadConstant| $ 36) (QREFELT $ 37))
                . #2#)
          (SEQ (LETT |n| NIL . #2#) (LETT #1# |ln| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (EXIT (|MAMA;fill_diagonal| B A |nr| |nc| |n| $)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT B)))) 

(SDEFUN |MAMA;bandMatrix;MSM;12| ((A M) (|si| |Segment| (|Integer|)) ($ M))
        (SPADCALL A (SPADCALL |si| (QREFELT $ 22)) (QREFELT $ 40))) 

(SDEFUN |MAMA;subMatrix;M2LM;13|
        ((A M) (|lr| |List| (|Integer|)) (|lc| |List| (|Integer|)) ($ M))
        (SPROG
         ((#1=#:G736 NIL) (|j| NIL) (#2=#:G737 NIL) (|jj| NIL) (#3=#:G734 NIL)
          (|i| NIL) (#4=#:G735 NIL) (|ii| NIL) (|res| (M)) (|minC| (|Integer|))
          (|minR| (|Integer|)) (|m| #5=(|NonNegativeInteger|)) (|n| #5#))
         (SEQ (LETT |n| (LENGTH |lr|) . #6=(|MAMA;subMatrix;M2LM;13|))
              (LETT |m| (LENGTH |lc|) . #6#)
              (LETT |minR| (SPADCALL A (QREFELT $ 26)) . #6#)
              (LETT |minC| (SPADCALL A (QREFELT $ 13)) . #6#)
              (LETT |res| (SPADCALL |n| |m| (QREFELT $ 18)) . #6#)
              (SEQ (LETT |ii| NIL . #6#) (LETT #4# |lr| . #6#)
                   (LETT |i| 1 . #6#) (LETT #3# |n| . #6#) G190
                   (COND
                    ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                         (PROGN (LETT |ii| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |jj| NIL . #6#) (LETT #2# |lc| . #6#)
                          (LETT |j| 1 . #6#) (LETT #1# |m| . #6#) G190
                          (COND
                           ((OR (|greater_SI| |j| #1#) (ATOM #2#)
                                (PROGN (LETT |jj| (CAR #2#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |res| (+ (- |minR| 1) |i|)
                                      (+ (- |minC| 1) |j|)
                                      (SPADCALL A |ii| |jj| (QREFELT $ 42))
                                      (QREFELT $ 35))))
                          (LETT |j|
                                (PROG1 (|inc_SI| |j|)
                                  (LETT #2# (CDR #2#) . #6#))
                                . #6#)
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MAMA;subMatrix;M2SM;14|
        ((A M) (|sr| |Segment| (|Integer|)) (|sc| |Segment| (|Integer|)) ($ M))
        (SPADCALL A (SPADCALL |sr| (QREFELT $ 43))
                  (SPADCALL |sr| (QREFELT $ 44)) (SPADCALL |sc| (QREFELT $ 43))
                  (SPADCALL |sc| (QREFELT $ 44)) (QREFELT $ 11))) 

(SDEFUN |MAMA;blockSplit;MLPiL;15|
        ((A M) (|lr| |List| (|NonNegativeInteger|)) (|nc| |PositiveInteger|)
         ($ |List| (|List| M)))
        (SPROG ((#1=#:G742 NIL) (X NIL) (#2=#:G741 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MAMA;blockSplit;MLPiL;15|))
                 (SEQ (LETT X NIL . #3#)
                      (LETT #1# (SPADCALL A |lr| (QREFELT $ 48)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL X |nc| (QREFELT $ 50)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MAMA;blockSplit;MPiLL;16|
        ((A M) (|nr| |PositiveInteger|) (|lc| |List| (|NonNegativeInteger|))
         ($ |List| (|List| M)))
        (SPROG ((#1=#:G746 NIL) (X NIL) (#2=#:G745 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MAMA;blockSplit;MPiLL;16|))
                 (SEQ (LETT X NIL . #3#)
                      (LETT #1# (SPADCALL A |nr| (QREFELT $ 53)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL X |lc| (QREFELT $ 54)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(DECLAIM (NOTINLINE |MatrixManipulation;|)) 

(DEFUN |MatrixManipulation| (&REST #1=#:G747)
  (SPROG NIL
         (PROG (#2=#:G748)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MatrixManipulation|)
                                               '|domainEqualList|)
                    . #3=(|MatrixManipulation|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MatrixManipulation;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MatrixManipulation|)))))))))) 

(DEFUN |MatrixManipulation;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|MatrixManipulation|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|MatrixManipulation| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 56) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|AbelianMonoid|))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|MatrixManipulation|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 38
                 (CONS (|dispatchFunction| |MAMA;diagonalMatrix;MIM;9|) $))
       (QSETREFV $ 39
                 (CONS (|dispatchFunction| |MAMA;diagonalMatrix;2M;10|) $))
       (QSETREFV $ 40 (CONS (|dispatchFunction| |MAMA;bandMatrix;MLM;11|) $))
       (QSETREFV $ 41
                 (CONS (|dispatchFunction| |MAMA;bandMatrix;MSM;12|) $)))))
    $))) 

(MAKEPROP '|MatrixManipulation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |subMatrix|)
              |MAMA;element;M2IM;1| (9 . |minColIndex|) (14 . |maxColIndex|)
              |MAMA;rowMatrix;MIM;2| (|NonNegativeInteger|) (19 . |ncols|)
              (24 . |qnew|) (|Segment| 10) (30 . SEGMENT) (|List| 10)
              (36 . |expand|) |MAMA;subMatrix;M2LM;13| |MAMA;rows;MLM;3|
              |MAMA;rows;MSM;4| (41 . |minRowIndex|) (46 . |maxRowIndex|)
              |MAMA;columnMatrix;MIM;5| (51 . |nrows|) |MAMA;columns;MLM;6|
              |MAMA;columns;MSM;7| (|Boolean|) (56 . >) (62 . |elt|)
              (69 . |qsetelt!|) (77 . |Zero|) (81 . |new|)
              (88 . |diagonalMatrix|) (94 . |diagonalMatrix|)
              (99 . |bandMatrix|) (105 . |bandMatrix|) (111 . |qelt|)
              (118 . |low|) (123 . |high|) |MAMA;subMatrix;M2SM;14| (|List| $)
              (|List| 16) (128 . |vertSplit|) (|PositiveInteger|)
              (134 . |horizSplit|) (|List| (|List| 9))
              |MAMA;blockSplit;MLPiL;15| (140 . |vertSplit|)
              (146 . |horizSplit|) |MAMA;blockSplit;MPiLL;16|)
           '#(|subMatrix| 152 |rows| 166 |rowMatrix| 178 |element| 184
              |diagonalMatrix| 191 |columns| 202 |columnMatrix| 214
              |blockSplit| 220 |bandMatrix| 234)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(5 9 0 0 10 10 10 10 11 1 9
                                                   10 0 13 1 9 10 0 14 1 9 16 0
                                                   17 2 9 0 16 16 18 2 19 0 10
                                                   10 20 1 19 21 0 22 1 9 10 0
                                                   26 1 9 10 0 27 1 9 16 0 29 2
                                                   10 32 0 0 33 3 9 6 0 10 10
                                                   34 4 9 6 0 10 10 6 35 0 6 0
                                                   36 3 9 0 16 16 6 37 2 0 9 9
                                                   10 38 1 0 9 9 39 2 0 9 9 21
                                                   40 2 0 9 9 19 41 3 9 6 0 10
                                                   10 42 1 19 10 0 43 1 19 10 0
                                                   44 2 9 46 0 47 48 2 9 46 0
                                                   49 50 2 9 46 0 49 53 2 9 46
                                                   0 47 54 3 0 9 9 19 19 45 3 0
                                                   9 9 21 21 23 2 0 9 9 21 24 2
                                                   0 9 9 19 25 2 0 9 9 10 15 3
                                                   0 9 9 10 10 12 1 1 9 9 39 2
                                                   1 9 9 10 38 2 0 9 9 19 31 2
                                                   0 9 9 21 30 2 0 9 9 10 28 3
                                                   0 51 9 49 47 55 3 0 51 9 47
                                                   49 52 2 1 9 9 19 41 2 1 9 9
                                                   21 40)))))
           '|lookupComplete|)) 
