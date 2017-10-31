
(SDEFUN |FRAMALG-;convert;SV;1| ((|x| S) ($ |Vector| R))
        (SPADCALL |x| (QREFELT $ 10))) 

(SDEFUN |FRAMALG-;convert;VS;2| ((|v| |Vector| R) ($ S))
        (SPADCALL |v| (QREFELT $ 12))) 

(SDEFUN |FRAMALG-;traceMatrix;M;3| (($ |Matrix| R))
        (SPADCALL (SPADCALL (QREFELT $ 15)) (QREFELT $ 17))) 

(SDEFUN |FRAMALG-;discriminant;R;4| (($ R))
        (SPADCALL (SPADCALL (QREFELT $ 15)) (QREFELT $ 19))) 

(SDEFUN |FRAMALG-;regularRepresentation;SM;5| ((|x| S) ($ |Matrix| R))
        (SPADCALL |x| (SPADCALL (QREFELT $ 15)) (QREFELT $ 21))) 

(SDEFUN |FRAMALG-;coordinates;VM;6| ((|x| |Vector| S) ($ |Matrix| R))
        (SPADCALL |x| (SPADCALL (QREFELT $ 15)) (QREFELT $ 23))) 

(SDEFUN |FRAMALG-;represents;VS;7| ((|x| |Vector| R) ($ S))
        (SPADCALL |x| (SPADCALL (QREFELT $ 15)) (QREFELT $ 25))) 

(SDEFUN |FRAMALG-;coordinates;VM;8| ((|v| |Vector| S) ($ |Matrix| R))
        (SPROG ((#1=#:G715 NIL) (|i| NIL) (|j| NIL) (|m| (|Matrix| R)))
               (SEQ
                (LETT |m|
                      (MAKE_MATRIX1 (QVSIZE |v|) (SPADCALL (QREFELT $ 28))
                                    (|spadConstant| $ 29))
                      . #2=(|FRAMALG-;coordinates;VM;8|))
                (SEQ (LETT |j| 1 . #2#)
                     (LETT |i| (SPADCALL |v| (QREFELT $ 32)) . #2#)
                     (LETT #1# (QVSIZE |v|) . #2#) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |m| |j|
                                 (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 10))
                                 (QREFELT $ 33))))
                     (LETT |i|
                           (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#))
                           . #2#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |FRAMALG-;regularRepresentation;SM;9| ((|x| S) ($ |Matrix| R))
        (SPROG
         ((#1=#:G719 NIL) (|i| NIL) (|j| NIL) (|b| (|Vector| S))
          (|m| (|Matrix| R)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |m|
                (MAKE_MATRIX1
                 (LETT |n| (SPADCALL (QREFELT $ 28))
                       . #2=(|FRAMALG-;regularRepresentation;SM;9|))
                 |n| (|spadConstant| $ 29))
                . #2#)
          (LETT |b| (SPADCALL (QREFELT $ 15)) . #2#)
          (SEQ (LETT |j| 1 . #2#)
               (LETT |i| (SPADCALL |b| (QREFELT $ 32)) . #2#)
               (LETT #1# (QVSIZE |b|) . #2#) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |m| |j|
                           (SPADCALL
                            (SPADCALL |x| (QAREF1O |b| |i| 1) (QREFELT $ 34))
                            (QREFELT $ 10))
                           (QREFELT $ 33))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#))
                     . #2#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |m| (QREFELT $ 35)))))) 

(SDEFUN |FRAMALG-;characteristicPolynomial;SUP;10| ((|x| S) ($ UP))
        (SPROG
         ((|mat1| (|Matrix| UP)) (|mat0| (|Matrix| UP)) (|mat00| (|Matrix| R)))
         (SEQ
          (LETT |mat00| (SPADCALL |x| (QREFELT $ 36))
                . #1=(|FRAMALG-;characteristicPolynomial;SUP;10|))
          (LETT |mat0| (SPADCALL (ELT $ 37) |mat00| (QREFELT $ 41)) . #1#)
          (LETT |mat1|
                (SPADCALL (SPADCALL (QREFELT $ 28))
                          (SPADCALL (|spadConstant| $ 43) 1 (QREFELT $ 45))
                          (QREFELT $ 46))
                . #1#)
          (EXIT
           (SPADCALL (SPADCALL |mat1| |mat0| (QREFELT $ 47)) (QREFELT $ 48)))))) 

(SDEFUN |FRAMALG-;minimalPolynomial;SUP;11| ((|x| S) ($ UP))
        (SPROG
         ((#1=#:G733 NIL) (#2=#:G732 (UP)) (#3=#:G734 (UP)) (#4=#:G738 NIL)
          (|i| NIL) (|v| (|Vector| R)) (|y| (S)) (#5=#:G737 NIL)
          (|m| (|Matrix| R)) (|n| (|PositiveInteger|)))
         (SEQ
          (LETT |y| (|spadConstant| $ 42)
                . #6=(|FRAMALG-;minimalPolynomial;SUP;11|))
          (LETT |n| (SPADCALL (QREFELT $ 28)) . #6#)
          (LETT |m| (SPADCALL |n| (+ |n| 1) (QREFELT $ 50)) . #6#)
          (SEQ (LETT |i| 1 . #6#) (LETT #5# (+ |n| 1) . #6#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (SPADCALL |m| |i| (SPADCALL |y| (QREFELT $ 10)) (QREFELT $ 51))
                (EXIT (LETT |y| (SPADCALL |y| |x| (QREFELT $ 34)) . #6#)))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |v| (|SPADfirst| (SPADCALL |m| (QREFELT $ 53))) . #6#)
          (EXIT
           (PROGN
            (LETT #1# NIL . #6#)
            (SEQ (LETT |i| 0 . #6#) (LETT #4# (- (QVSIZE |v|) 1) . #6#) G190
                 (COND ((|greater_SI| |i| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3#
                          (SPADCALL (SPADCALL |v| (+ |i| 1) (QREFELT $ 54)) |i|
                                    (QREFELT $ 45))
                          . #6#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 55)) . #6#))
                     ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                 (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 56)))))))) 

(DECLAIM (NOTINLINE |FramedAlgebra&;|)) 

(DEFUN |FramedAlgebra&| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FramedAlgebra&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|FramedAlgebra&| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 58) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#3| '(|CommutativeRing|))
            (QSETREFV $ 49
                      (CONS
                       (|dispatchFunction|
                        |FRAMALG-;characteristicPolynomial;SUP;10|)
                       $))))
          (COND
           ((|HasCategory| |#2| '(|Field|))
            (PROGN
             (QSETREFV $ 57
                       (CONS
                        (|dispatchFunction|
                         |FRAMALG-;minimalPolynomial;SUP;11|)
                        $)))))
          $))) 

(MAKEPROP '|FramedAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Vector| 7) (0 . |coordinates|)
              |FRAMALG-;convert;SV;1| (5 . |represents|)
              |FRAMALG-;convert;VS;2| (|Vector| $) (10 . |basis|) (|Matrix| 7)
              (14 . |traceMatrix|) |FRAMALG-;traceMatrix;M;3|
              (19 . |discriminant|) |FRAMALG-;discriminant;R;4|
              (24 . |regularRepresentation|)
              |FRAMALG-;regularRepresentation;SM;9| (30 . |coordinates|)
              |FRAMALG-;coordinates;VM;8| (36 . |represents|)
              |FRAMALG-;represents;VS;7| (|PositiveInteger|) (42 . |rank|)
              (46 . |Zero|) (|Integer|) (|Vector| 6) (50 . |minIndex|)
              (55 . |setRow!|) (62 . *) (68 . |transpose|)
              (73 . |regularRepresentation|) (78 . |coerce|) (|Matrix| 8)
              (|Mapping| 8 7)
              (|MatrixCategoryFunctions2| 7 9 9 16 8 (|Vector| 8) (|Vector| 8)
                                          38)
              (83 . |map|) (89 . |One|) (93 . |One|) (|NonNegativeInteger|)
              (97 . |monomial|) (103 . |scalarMatrix|) (109 . -)
              (115 . |determinant|) (120 . |characteristicPolynomial|)
              (125 . |zero|) (131 . |setColumn!|) (|List| 9)
              (138 . |nullSpace|) (143 . |elt|) (149 . +) (155 . |Zero|)
              (159 . |minimalPolynomial|))
           '#(|traceMatrix| 164 |represents| 168 |regularRepresentation| 173
              |minimalPolynomial| 178 |discriminant| 183 |coordinates| 187
              |convert| 192 |characteristicPolynomial| 202)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 57
                                                 '(1 6 9 0 10 1 6 0 9 12 0 6 14
                                                   15 1 6 16 14 17 1 6 7 14 19
                                                   2 6 16 0 14 21 2 6 16 14 14
                                                   23 2 6 0 9 14 25 0 6 27 28 0
                                                   7 0 29 1 31 30 0 32 3 16 0 0
                                                   30 9 33 2 6 0 0 0 34 1 16 0
                                                   0 35 1 6 16 0 36 1 8 0 7 37
                                                   2 40 38 39 16 41 0 6 0 42 0
                                                   7 0 43 2 8 0 7 44 45 2 38 0
                                                   44 8 46 2 38 0 0 0 47 1 38 8
                                                   0 48 1 0 8 0 49 2 16 0 44 44
                                                   50 3 16 0 0 30 9 51 1 16 52
                                                   0 53 2 9 7 0 30 54 2 8 0 0 0
                                                   55 0 8 0 56 1 0 8 0 57 0 0
                                                   16 18 1 0 0 9 26 1 0 16 0 22
                                                   1 0 8 0 57 0 0 7 20 1 0 16
                                                   14 24 1 0 0 9 13 1 0 9 0 11
                                                   1 0 8 0 49)))))
           '|lookupComplete|)) 
