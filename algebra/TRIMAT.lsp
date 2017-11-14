
(SDEFUN |TRIMAT;UpTriBddDenomInv;MRM;1| ((A M) (|denom| R) ($ M))
        (SPROG
         ((#1=#:G697 NIL) (#2=#:G708 NIL) (#3=#:G707 (R)) (#4=#:G709 (R))
          (#5=#:G718 NIL) (|k| NIL) (#6=#:G717 NIL) (|j| NIL) (#7=#:G716 NIL)
          (|i| NIL) (#8=#:G714 NIL) (#9=#:G715 NIL) (|offset| (|Integer|))
          (AI (M)))
         (SEQ
          (LETT AI
                (SPADCALL (SPADCALL A (QREFELT $ 11))
                          (SPADCALL A (QREFELT $ 11)) (QREFELT $ 12))
                . #10=(|TRIMAT;UpTriBddDenomInv;MRM;1|))
          (LETT |offset|
                (- (SPADCALL AI (QREFELT $ 14)) (SPADCALL AI (QREFELT $ 15)))
                . #10#)
          (SEQ (LETT |j| (SPADCALL AI (QREFELT $ 14)) . #10#)
               (LETT #9# (SPADCALL AI (QREFELT $ 17)) . #10#)
               (LETT |i| (SPADCALL AI (QREFELT $ 15)) . #10#)
               (LETT #8# (SPADCALL AI (QREFELT $ 16)) . #10#) G190
               (COND ((OR (> |i| #8#) (> |j| #9#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL AI |i| |j|
                           (PROG2
                               (LETT #1#
                                     (SPADCALL |denom|
                                               (SPADCALL A |i| |j|
                                                         (QREFELT $ 18))
                                               (QREFELT $ 20))
                                     . #10#)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                             (|Union| (QREFELT $ 6)
                                                      #11="failed")
                                             #1#))
                           (QREFELT $ 21))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #10#)) . #10#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| (SPADCALL AI (QREFELT $ 15)) . #10#)
               (LETT #7# (SPADCALL AI (QREFELT $ 16)) . #10#) G190
               (COND ((> |i| #7#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (+ (+ |offset| |i|) 1) . #10#)
                      (LETT #6# (SPADCALL AI (QREFELT $ 17)) . #10#) G190
                      (COND ((> |j| #6#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL AI |i| |j|
                                  (SPADCALL
                                   (PROG2
                                       (LETT #1#
                                             (SPADCALL
                                              (PROGN
                                               (LETT #2# NIL . #10#)
                                               (SEQ
                                                (LETT |k| (+ |i| |offset|)
                                                      . #10#)
                                                (LETT #5# (- |j| 1) . #10#)
                                                G190
                                                (COND ((> |k| #5#) (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #4#
                                                         (SPADCALL
                                                          (SPADCALL AI |i| |k|
                                                                    (QREFELT $
                                                                             18))
                                                          (SPADCALL A
                                                                    (- |k|
                                                                       |offset|)
                                                                    |j|
                                                                    (QREFELT $
                                                                             18))
                                                          (QREFELT $ 23))
                                                         . #10#)
                                                   (COND
                                                    (#2#
                                                     (LETT #3#
                                                           (SPADCALL #3# #4#
                                                                     (QREFELT $
                                                                              24))
                                                           . #10#))
                                                    ('T
                                                     (PROGN
                                                      (LETT #3# #4# . #10#)
                                                      (LETT #2# 'T
                                                            . #10#)))))))
                                                (LETT |k| (+ |k| 1) . #10#)
                                                (GO G190) G191 (EXIT NIL))
                                               (COND (#2# #3#)
                                                     ('T
                                                      (|spadConstant| $ 25))))
                                              (SPADCALL A (- |j| |offset|) |j|
                                                        (QREFELT $ 18))
                                              (QREFELT $ 20))
                                             . #10#)
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (QREFELT $ 6)
                                                     (|Union| (QREFELT $ 6)
                                                              #11#)
                                                     #1#))
                                   (QREFELT $ 26))
                                  (QREFELT $ 21))))
                      (LETT |j| (+ |j| 1) . #10#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #10#) (GO G190) G191 (EXIT NIL))
          (EXIT AI)))) 

(SDEFUN |TRIMAT;LowTriBddDenomInv;MRM;2| ((A M) (|denom| R) ($ M))
        (SPROG
         ((#1=#:G720 NIL) (#2=#:G730 NIL) (#3=#:G729 (R)) (#4=#:G731 (R))
          (#5=#:G740 NIL) (|k| NIL) (#6=#:G739 NIL) (|j| NIL) (#7=#:G738 NIL)
          (|i| NIL) (#8=#:G736 NIL) (#9=#:G737 NIL) (|offset| (|Integer|))
          (AI (M)))
         (SEQ
          (LETT AI
                (SPADCALL (SPADCALL A (QREFELT $ 11))
                          (SPADCALL A (QREFELT $ 11)) (QREFELT $ 12))
                . #10=(|TRIMAT;LowTriBddDenomInv;MRM;2|))
          (LETT |offset|
                (- (SPADCALL AI (QREFELT $ 14)) (SPADCALL AI (QREFELT $ 15)))
                . #10#)
          (SEQ (LETT |j| (SPADCALL AI (QREFELT $ 14)) . #10#)
               (LETT #9# (SPADCALL AI (QREFELT $ 17)) . #10#)
               (LETT |i| (SPADCALL AI (QREFELT $ 15)) . #10#)
               (LETT #8# (SPADCALL AI (QREFELT $ 16)) . #10#) G190
               (COND ((OR (> |i| #8#) (> |j| #9#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL AI |i| |j|
                           (PROG2
                               (LETT #1#
                                     (SPADCALL |denom|
                                               (SPADCALL A |i| |j|
                                                         (QREFELT $ 18))
                                               (QREFELT $ 20))
                                     . #10#)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                             (|Union| (QREFELT $ 6)
                                                      #11="failed")
                                             #1#))
                           (QREFELT $ 21))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #10#)) . #10#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| (SPADCALL AI (QREFELT $ 14)) . #10#)
               (LETT #7# (SPADCALL AI (QREFELT $ 17)) . #10#) G190
               (COND ((> |i| #7#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (+ (- |i| |offset|) 1) . #10#)
                      (LETT #6# (SPADCALL AI (QREFELT $ 16)) . #10#) G190
                      (COND ((> |j| #6#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL AI |j| |i|
                                  (SPADCALL
                                   (PROG2
                                       (LETT #1#
                                             (SPADCALL
                                              (PROGN
                                               (LETT #2# NIL . #10#)
                                               (SEQ
                                                (LETT |k| (- |i| |offset|)
                                                      . #10#)
                                                (LETT #5# (- |j| 1) . #10#)
                                                G190
                                                (COND ((> |k| #5#) (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #4#
                                                         (SPADCALL
                                                          (SPADCALL A |j|
                                                                    (+ |k|
                                                                       |offset|)
                                                                    (QREFELT $
                                                                             18))
                                                          (SPADCALL AI |k| |i|
                                                                    (QREFELT $
                                                                             18))
                                                          (QREFELT $ 23))
                                                         . #10#)
                                                   (COND
                                                    (#2#
                                                     (LETT #3#
                                                           (SPADCALL #3# #4#
                                                                     (QREFELT $
                                                                              24))
                                                           . #10#))
                                                    ('T
                                                     (PROGN
                                                      (LETT #3# #4# . #10#)
                                                      (LETT #2# 'T
                                                            . #10#)))))))
                                                (LETT |k| (+ |k| 1) . #10#)
                                                (GO G190) G191 (EXIT NIL))
                                               (COND (#2# #3#)
                                                     ('T
                                                      (|spadConstant| $ 25))))
                                              (SPADCALL A |j| (+ |j| |offset|)
                                                        (QREFELT $ 18))
                                              (QREFELT $ 20))
                                             . #10#)
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (QREFELT $ 6)
                                                     (|Union| (QREFELT $ 6)
                                                              #11#)
                                                     #1#))
                                   (QREFELT $ 26))
                                  (QREFELT $ 21))))
                      (LETT |j| (+ |j| 1) . #10#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #10#) (GO G190) G191 (EXIT NIL))
          (EXIT AI)))) 

(DECLAIM (NOTINLINE |TriangularMatrixOperations;|)) 

(DEFUN |TriangularMatrixOperations| (&REST #1=#:G741)
  (SPROG NIL
         (PROG (#2=#:G742)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TriangularMatrixOperations|)
                                               '|domainEqualList|)
                    . #3=(|TriangularMatrixOperations|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TriangularMatrixOperations;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TriangularMatrixOperations|)))))))))) 

(DEFUN |TriangularMatrixOperations;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|TriangularMatrixOperations|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|TriangularMatrixOperations| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 29) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|TriangularMatrixOperations|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|TriangularMatrixOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|NonNegativeInteger|)
              (0 . |nrows|) (5 . |zero|) (|Integer|) (11 . |minColIndex|)
              (16 . |minRowIndex|) (21 . |maxRowIndex|) (26 . |maxColIndex|)
              (31 . |qelt|) (|Union| $ '"failed") (38 . |exquo|)
              (44 . |qsetelt!|) (52 . |One|) (56 . *) (62 . +) (68 . |Zero|)
              (72 . -) |TRIMAT;UpTriBddDenomInv;MRM;1|
              |TRIMAT;LowTriBddDenomInv;MRM;2|)
           '#(|UpTriBddDenomInv| 77 |LowTriBddDenomInv| 83) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(1 9 10 0 11 2 9 0 10 10 12 1
                                                   9 13 0 14 1 9 13 0 15 1 9 13
                                                   0 16 1 9 13 0 17 3 9 6 0 13
                                                   13 18 2 6 19 0 0 20 4 9 6 0
                                                   13 13 6 21 0 6 0 22 2 6 0 0
                                                   0 23 2 6 0 0 0 24 0 6 0 25 1
                                                   6 0 0 26 2 0 9 9 6 27 2 0 9
                                                   9 6 28)))))
           '|lookupComplete|)) 
