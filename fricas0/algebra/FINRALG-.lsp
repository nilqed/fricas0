
(SDEFUN |FINRALG-;discriminant;VR;1| ((|v| |Vector| S) ($ R))
        (SPADCALL (SPADCALL |v| (QREFELT $ 11)) (QREFELT $ 12))) 

(SDEFUN |FINRALG-;coordinates;2VM;2|
        ((|v| |Vector| S) (|b| |Vector| S) ($ |Matrix| R))
        (SPROG ((#1=#:G709 NIL) (|i| NIL) (|j| NIL) (|m| (|Matrix| R)))
               (SEQ
                (LETT |m|
                      (MAKE_MATRIX1 (QVSIZE |v|) (QVSIZE |b|)
                                    (|spadConstant| $ 14))
                      . #2=(|FINRALG-;coordinates;2VM;2|))
                (SEQ (LETT |j| 1 . #2#)
                     (LETT |i| (SPADCALL |v| (QREFELT $ 17)) . #2#)
                     (LETT #1# (QVSIZE |v|) . #2#) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |m| |j|
                                 (SPADCALL (QAREF1O |v| |i| 1) |b|
                                           (QREFELT $ 19))
                                 (QREFELT $ 20))))
                     (LETT |i|
                           (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#))
                           . #2#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |FINRALG-;represents;VVS;3| ((|v| |Vector| R) (|b| |Vector| S) ($ S))
        (SPROG
         ((#1=#:G711 NIL) (#2=#:G710 (S)) (#3=#:G712 (S)) (#4=#:G715 NIL)
          (|i| NIL) (|m| (|Integer|)))
         (SEQ
          (LETT |m| (- (SPADCALL |v| (QREFELT $ 22)) 1)
                . #5=(|FINRALG-;represents;VVS;3|))
          (EXIT
           (PROGN
            (LETT #1# NIL . #5#)
            (SEQ (LETT |i| 1 . #5#) (LETT #4# (SPADCALL (QREFELT $ 24)) . #5#)
                 G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3#
                          (SPADCALL (SPADCALL |v| (+ |i| |m|) (QREFELT $ 25))
                                    (SPADCALL |b| (+ |i| |m|) (QREFELT $ 26))
                                    (QREFELT $ 27))
                          . #5#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 28)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 29)))))))) 

(SDEFUN |FINRALG-;traceMatrix;VM;4| ((|v| |Vector| S) ($ |Matrix| R))
        (SPROG
         ((#1=#:G726 NIL) (|j| NIL) (#2=#:G725 NIL) (#3=#:G724 NIL) (|i| NIL)
          (#4=#:G723 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL . #5=(|FINRALG-;traceMatrix;VM;4|))
            (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 17)) . #5#)
                 (LETT #3# (QVSIZE |v|) . #5#) G190
                 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL . #5#)
                           (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 17)) . #5#)
                                (LETT #1# (QVSIZE |v|) . #5#) G190
                                (COND ((> |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |v| |i| (QREFELT $ 26))
                                           (SPADCALL |v| |j| (QREFELT $ 26))
                                           (QREFELT $ 31))
                                          (QREFELT $ 32))
                                         #2#)
                                        . #5#)))
                                (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#)
                         . #5#)))
                 (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #4#))))
           (QREFELT $ 34))))) 

(SDEFUN |FINRALG-;regularRepresentation;SVM;5|
        ((|x| S) (|b| |Vector| S) ($ |Matrix| R))
        (SPROG ((#1=#:G732 NIL) (|i| NIL) (#2=#:G731 NIL) (|m| (|Integer|)))
               (SEQ
                (LETT |m| (- (SPADCALL |b| (QREFELT $ 17)) 1)
                      . #3=(|FINRALG-;regularRepresentation;SVM;5|))
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |i| 1 . #3#)
                         (LETT #1# (SPADCALL (QREFELT $ 24)) . #3#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |x|
                                              (SPADCALL |b| (+ |i| |m|)
                                                        (QREFELT $ 26))
                                              (QREFELT $ 31))
                                    |b| (QREFELT $ 19))
                                   (QREFELT $ 37))
                                  #2#)
                                 . #3#)))
                         (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   (QREFELT $ 34))
                  (QREFELT $ 38)))))) 

(DECLAIM (NOTINLINE |FiniteRankAlgebra&;|)) 

(DEFUN |FiniteRankAlgebra&| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteRankAlgebra&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|FiniteRankAlgebra&| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 40) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#2| '(|Field|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FiniteRankAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Matrix| 7) (|Vector| $) (0 . |traceMatrix|)
              (5 . |determinant|) |FINRALG-;discriminant;VR;1| (10 . |Zero|)
              (|Integer|) (|Vector| 6) (14 . |minIndex|) (|Vector| 7)
              (19 . |coordinates|) (25 . |setRow!|)
              |FINRALG-;coordinates;2VM;2| (32 . |minIndex|)
              (|PositiveInteger|) (37 . |rank|) (41 . |elt|) (47 . |elt|)
              (53 . *) (59 . +) (65 . |Zero|) |FINRALG-;represents;VVS;3|
              (69 . *) (75 . |trace|) (|List| 36) (80 . |matrix|)
              |FINRALG-;traceMatrix;VM;4| (|List| 7) (85 . |parts|)
              (90 . |transpose|) |FINRALG-;regularRepresentation;SVM;5|)
           '#(|traceMatrix| 95 |represents| 100 |regularRepresentation| 106
              |discriminant| 112 |coordinates| 117)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 39
                                                 '(1 6 9 10 11 1 9 7 0 12 0 7 0
                                                   14 1 16 15 0 17 2 6 18 0 10
                                                   19 3 9 0 0 15 18 20 1 18 15
                                                   0 22 0 6 23 24 2 18 7 0 15
                                                   25 2 16 6 0 15 26 2 6 0 7 0
                                                   27 2 6 0 0 0 28 0 6 0 29 2 6
                                                   0 0 0 31 1 6 7 0 32 1 9 0 33
                                                   34 1 18 36 0 37 1 9 0 0 38 1
                                                   0 9 10 35 2 0 0 18 10 30 2 0
                                                   9 0 10 39 1 0 7 10 13 2 0 9
                                                   10 10 21)))))
           '|lookupComplete|)) 
