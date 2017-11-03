
(SDEFUN |FRMOD-;convert;SV;1| ((|x| S) ($ |Vector| R))
        (SPADCALL |x| (QREFELT $ 9))) 

(SDEFUN |FRMOD-;convert;VS;2| ((|v| |Vector| R) ($ S))
        (SPADCALL |v| (QREFELT $ 11))) 

(SDEFUN |FRMOD-;coordinates;VM;3| ((|v| |Vector| S) ($ |Matrix| R))
        (SPROG ((#1=#:G713 NIL) (|i| NIL) (|j| NIL) (|m| (|Matrix| R)))
               (SEQ
                (LETT |m|
                      (MAKE_MATRIX1 (QVSIZE |v|) (SPADCALL (QREFELT $ 14))
                                    (|spadConstant| $ 15))
                      . #2=(|FRMOD-;coordinates;VM;3|))
                (SEQ (LETT |j| 1 . #2#)
                     (LETT |i| (SPADCALL |v| (QREFELT $ 18)) . #2#)
                     (LETT #1# (QVSIZE |v|) . #2#) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |m| |j|
                                 (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 9))
                                 (QREFELT $ 20))))
                     (LETT |i|
                           (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#))
                           . #2#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |FRMOD-;index;PiS;4| ((|i| |PositiveInteger|) ($ S))
        (SPROG
         ((|l| (|List| R)) (|i1| #1=(|Integer|)) (|ii| (|Integer|))
          (|#G11|
           (|Record| (|:| |quotient| (|Integer|)) (|:| |remainder| #1#)))
          (#2=#:G724 NIL) (|j| NIL) (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (SPADCALL (QREFELT $ 24)) . #3=(|FRMOD-;index;PiS;4|))
              (LETT |l| NIL . #3#) (LETT |ii| (- |i| 1) . #3#)
              (SEQ (LETT |j| 1 . #3#)
                   (LETT #2# (SPADCALL (QREFELT $ 14)) . #3#) G190
                   (COND ((|greater_SI| |j| #2#) (GO G191)))
                   (SEQ
                    (PROGN
                     (LETT |#G11| (DIVIDE2 |ii| |m|) . #3#)
                     (LETT |ii| (QCAR |#G11|) . #3#)
                     (LETT |i1| (QCDR |#G11|) . #3#)
                     |#G11|)
                    (EXIT
                     (LETT |l| (CONS (SPADCALL (+ |i1| 1) (QREFELT $ 25)) |l|)
                           . #3#)))
                   (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (SPADCALL |l| (QREFELT $ 27)) (QREFELT $ 11)))))) 

(SDEFUN |FRMOD-;lookup;SPi;5| ((|x| S) ($ |PositiveInteger|))
        (SPROG
         ((|res| (|Integer|)) (#1=#:G728 NIL) (|i| NIL)
          (|m| (|NonNegativeInteger|)) (|v| (|Vector| R)))
         (SEQ
          (LETT |v| (SPADCALL |x| (QREFELT $ 9)) . #2=(|FRMOD-;lookup;SPi;5|))
          (LETT |res| 0 . #2#) (LETT |m| (SPADCALL (QREFELT $ 24)) . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (SPADCALL (QREFELT $ 14)) . #2#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (-
                        (+ (SPADCALL |m| |res| (QREFELT $ 29))
                           (SPADCALL (SPADCALL |v| |i| (QREFELT $ 30))
                                     (QREFELT $ 31)))
                        1)
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (+ |res| 1))))) 

(SDEFUN |FRMOD-;size;Nni;6| (($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL (QREFELT $ 24)) (SPADCALL (QREFELT $ 14))
                  (QREFELT $ 33))) 

(SDEFUN |FRMOD-;random;S;7| (($ S))
        (SPROG ((#1=#:G732 NIL) (#2=#:G734 NIL) (|i| NIL) (#3=#:G733 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #3# (GETREFV #4=(SPADCALL (QREFELT $ 14)))
                        . #5=(|FRMOD-;random;S;7|))
                  (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#)
                       (LETT #1# 0 . #5#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (EXIT (SETELT #3# #1# (SPADCALL (QREFELT $ 35)))))
                       (LETT #1#
                             (PROG1 (|inc_SI| #1#)
                               (LETT |i| (|inc_SI| |i|) . #5#))
                             . #5#)
                       (GO G190) G191 (EXIT NIL))
                  #3#)
                 (QREFELT $ 11))))) 

(DECLAIM (NOTINLINE |FramedModule&;|)) 

(DEFUN |FramedModule&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FramedModule&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FramedModule&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 38) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|Finite|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 28 (CONS (|dispatchFunction| |FRMOD-;index;PiS;4|) $))
             (QSETREFV $ 32
                       (CONS (|dispatchFunction| |FRMOD-;lookup;SPi;5|) $))
             (QSETREFV $ 34 (CONS (|dispatchFunction| |FRMOD-;size;Nni;6|) $))
             (QSETREFV $ 36
                       (CONS (|dispatchFunction| |FRMOD-;random;S;7|) $)))))
          $))) 

(MAKEPROP '|FramedModule&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Vector| 7) (0 . |coordinates|) |FRMOD-;convert;SV;1|
              (5 . |represents|) |FRMOD-;convert;VS;2| (|PositiveInteger|)
              (10 . |rank|) (14 . |Zero|) (|Integer|) (|Vector| 6)
              (18 . |minIndex|) (|Matrix| 7) (23 . |setRow!|) (|Vector| $)
              |FRMOD-;coordinates;VM;3| (|NonNegativeInteger|) (30 . |size|)
              (34 . |index|) (|List| 7) (39 . |vector|) (44 . |index|) (49 . *)
              (55 . |elt|) (61 . |lookup|) (66 . |lookup|) (71 . ^)
              (77 . |size|) (81 . |random|) (85 . |random|) (|InputForm|))
           '#(|size| 89 |random| 93 |lookup| 97 |index| 102 |coordinates| 107
              |convert| 112)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 36
                                                 '(1 6 8 0 9 1 6 0 8 11 0 6 13
                                                   14 0 7 0 15 1 17 16 0 18 3
                                                   19 0 0 16 8 20 0 7 23 24 1 7
                                                   0 13 25 1 8 0 26 27 1 0 0 13
                                                   28 2 16 0 23 0 29 2 8 7 0 16
                                                   30 1 7 13 0 31 1 0 13 0 32 2
                                                   23 0 0 13 33 0 0 23 34 0 7 0
                                                   35 0 0 0 36 0 0 23 34 0 0 0
                                                   36 1 0 13 0 32 1 0 0 13 28 1
                                                   0 19 21 22 1 0 0 8 12 1 0 8
                                                   0 10)))))
           '|lookupComplete|)) 
