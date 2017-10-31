
(SDEFUN |MONOGEN-;convert;SUP;1| ((|x| S) ($ UP)) (SPADCALL |x| (QREFELT $ 9))) 

(SDEFUN |MONOGEN-;convert;UPS;2| ((|p| UP) ($ S)) (SPADCALL |p| (QREFELT $ 11))) 

(SDEFUN |MONOGEN-;generator;S;3| (($ S))
        (SPADCALL (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 16))
                  (QREFELT $ 11))) 

(SDEFUN |MONOGEN-;norm;SR;4| ((|x| S) ($ R))
        (SPADCALL (SPADCALL (QREFELT $ 18)) (SPADCALL |x| (QREFELT $ 9))
                  (QREFELT $ 19))) 

(SDEFUN |MONOGEN-;retract;SR;5| ((|x| S) ($ R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 9)) (QREFELT $ 21))) 

(SDEFUN |MONOGEN-;retractIfCan;SU;6| ((|x| S) ($ |Union| R "failed"))
        (SPADCALL (SPADCALL |x| (QREFELT $ 9)) (QREFELT $ 24))) 

(SDEFUN |MONOGEN-;basis;V;7| (($ |Vector| S))
        (SPROG ((#1=#:G720 NIL) (|i| NIL) (#2=#:G719 NIL) (#3=#:G716 NIL))
               (SEQ
                (PROGN
                 (LETT #2#
                       (GETREFV
                        (|inc_SI|
                         #4=(PROG1
                                (LETT #3# (- (SPADCALL (QREFELT $ 27)) 1)
                                      . #5=(|MONOGEN-;basis;V;7|))
                              (|check_subtype2| (>= #3# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #3#))))
                       . #5#)
                 (SEQ (LETT |i| 0 . #5#) (LETT #1# #4# . #5#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# |i|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 14) |i|
                                           (QREFELT $ 16))
                                 (QREFELT $ 11)))))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT NIL))
                 #2#)))) 

(SDEFUN |MONOGEN-;characteristicPolynomial;SUP;8| ((|x| S) ($ UP))
        (SPADCALL |x| (QREFELT $ 31))) 

(SDEFUN |MONOGEN-;size;Nni;9| (($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL (QREFELT $ 33)) (SPADCALL (QREFELT $ 27))
                  (QREFELT $ 34))) 

(SDEFUN |MONOGEN-;random;S;10| (($ S))
        (SPROG ((#1=#:G725 NIL) (#2=#:G727 NIL) (|i| NIL) (#3=#:G726 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #3# (GETREFV #4=(SPADCALL (QREFELT $ 27)))
                        . #5=(|MONOGEN-;random;S;10|))
                  (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#)
                       (LETT #1# 0 . #5#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (EXIT (SETELT #3# #1# (SPADCALL (QREFELT $ 36)))))
                       (LETT #1#
                             (PROG1 (|inc_SI| #1#)
                               (LETT |i| (|inc_SI| |i|) . #5#))
                             . #5#)
                       (GO G190) G191 (EXIT NIL))
                  #3#)
                 (QREFELT $ 38))))) 

(SDEFUN |MONOGEN-;reduce;FU;11| ((|x| |Fraction| UP) ($ |Union| S "failed"))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 41)) (QREFELT $ 11))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 42)) (QREFELT $ 11))
                  (QREFELT $ 44))) 

(SDEFUN |MONOGEN-;differentiate;SMS;12| ((|x| S) (|d| |Mapping| R R) ($ S))
        (SPROG ((|yprime| (S)) (|p| (UP)))
               (SEQ
                (LETT |p| (SPADCALL (QREFELT $ 18))
                      . #1=(|MONOGEN-;differentiate;SMS;12|))
                (LETT |yprime|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |d| |p| (QREFELT $ 47))
                                  (QREFELT $ 11))
                        (SPADCALL (SPADCALL |p| (QREFELT $ 48)) (QREFELT $ 11))
                        (QREFELT $ 49))
                       (QREFELT $ 50))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL |d| (SPADCALL |x| (QREFELT $ 9)) (QREFELT $ 47))
                   (QREFELT $ 11))
                  (SPADCALL |yprime|
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 9))
                                       (QREFELT $ 48))
                             (QREFELT $ 11))
                            (QREFELT $ 51))
                  (QREFELT $ 52)))))) 

(SDEFUN |MONOGEN-;derivationCoordinates;VMM;13|
        ((|b| |Vector| S) (|d| |Mapping| R R) ($ |Matrix| R))
        (SPROG NIL
               (SPADCALL
                (SPADCALL
                 (CONS #'|MONOGEN-;derivationCoordinates;VMM;13!0|
                       (VECTOR $ |d|))
                 |b| (QREFELT $ 57))
                |b| (QREFELT $ 59)))) 

(SDEFUN |MONOGEN-;derivationCoordinates;VMM;13!0| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1)
                . #1=(|MONOGEN-;derivationCoordinates;VMM;13|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 54)))))) 

(SDEFUN |MONOGEN-;recip;SU;14| ((|x| S) ($ |Union| S "failed"))
        (SPROG
         ((|bc|
           (|Union| (|Record| (|:| |coef1| UP) (|:| |coef2| UP)) "failed")))
         (SEQ
          (LETT |bc|
                (SPADCALL (SPADCALL |x| (QREFELT $ 9))
                          (SPADCALL (QREFELT $ 18)) (|spadConstant| $ 61)
                          (QREFELT $ 64))
                |MONOGEN-;recip;SU;14|)
          (EXIT
           (COND ((QEQCAR |bc| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (SPADCALL (QCAR (QCDR |bc|)) (QREFELT $ 11))))))))) 

(DECLAIM (NOTINLINE |MonogenicAlgebra&;|)) 

(DEFUN |MonogenicAlgebra&| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|MonogenicAlgebra&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|MonogenicAlgebra&| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 74) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|FiniteFieldCategory|))
                                              (|HasCategory| |#2| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|Finite|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 35
                       (CONS (|dispatchFunction| |MONOGEN-;size;Nni;9|) $))
             (QSETREFV $ 39
                       (CONS (|dispatchFunction| |MONOGEN-;random;S;10|) $)))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 45
                       (CONS (|dispatchFunction| |MONOGEN-;reduce;FU;11|) $))
             (QSETREFV $ 53
                       (CONS
                        (|dispatchFunction| |MONOGEN-;differentiate;SMS;12|)
                        $))
             (QSETREFV $ 60
                       (CONS
                        (|dispatchFunction|
                         |MONOGEN-;derivationCoordinates;VMM;13|)
                        $))
             (QSETREFV $ 65
                       (CONS (|dispatchFunction| |MONOGEN-;recip;SU;14|) $)))))
          $))) 

(MAKEPROP '|MonogenicAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |lift|) |MONOGEN-;convert;SUP;1|
              (5 . |reduce|) |MONOGEN-;convert;UPS;2| (10 . |One|) (14 . |One|)
              (|NonNegativeInteger|) (18 . |monomial|) |MONOGEN-;generator;S;3|
              (24 . |definingPolynomial|) (28 . |resultant|)
              |MONOGEN-;norm;SR;4| (34 . |retract|) |MONOGEN-;retract;SR;5|
              (|Union| 7 '#1="failed") (39 . |retractIfCan|)
              |MONOGEN-;retractIfCan;SU;6| (|PositiveInteger|) (44 . |rank|)
              (|Vector| $) |MONOGEN-;basis;V;7|
              (|CharacteristicPolynomialInMonogenicalAlgebra| 7 8 6)
              (48 . |characteristicPolynomial|)
              |MONOGEN-;characteristicPolynomial;SUP;8| (53 . |size|) (57 . ^)
              (63 . |size|) (67 . |random|) (|Vector| 7) (71 . |represents|)
              (76 . |random|) (|Fraction| 8) (80 . |numer|) (85 . |denom|)
              (|Union| $ '"failed") (90 . |exquo|) (96 . |reduce|)
              (|Mapping| 7 7) (101 . |map|) (107 . |differentiate|) (112 . /)
              (118 . -) (123 . *) (129 . +) (135 . |differentiate|)
              (141 . |differentiate|) (|Mapping| 6 6) (|Vector| 6)
              (147 . |map|) (|Matrix| 7) (153 . |coordinates|)
              (159 . |derivationCoordinates|) (165 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 62 '"failed")
              (169 . |extendedEuclidean|) (176 . |recip|) (|InputForm|)
              (|Symbol|) (|List| 67) (|List| 15) (|Union| 72 '#1#)
              (|Union| 73 '#1#) (|Fraction| 73) (|Integer|))
           '#(|size| 181 |retractIfCan| 185 |retract| 190 |reduce| 195 |recip|
              200 |random| 205 |norm| 209 |generator| 214 |differentiate| 218
              |derivationCoordinates| 224 |convert| 230
              |characteristicPolynomial| 240 |basis| 245)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(1 6 8 0 9 1 6 0 8 11 0 6 0
                                                   13 0 7 0 14 2 8 0 7 15 16 0
                                                   6 8 18 2 8 7 0 0 19 1 8 7 0
                                                   21 1 8 23 0 24 0 6 26 27 1
                                                   30 8 6 31 0 7 15 33 2 15 0 0
                                                   26 34 0 0 15 35 0 7 0 36 1 6
                                                   0 37 38 0 0 0 39 1 40 8 0 41
                                                   1 40 8 0 42 2 6 43 0 0 44 1
                                                   0 43 40 45 2 8 0 46 0 47 1 8
                                                   0 0 48 2 6 0 0 0 49 1 6 0 0
                                                   50 2 6 0 0 0 51 2 6 0 0 0 52
                                                   2 0 0 0 46 53 2 6 0 0 46 54
                                                   2 56 0 55 0 57 2 6 58 28 28
                                                   59 2 0 58 28 46 60 0 8 0 61
                                                   3 8 63 0 0 0 64 1 0 43 0 65
                                                   0 0 15 35 1 0 23 0 25 1 0 7
                                                   0 22 1 0 43 40 45 1 0 43 0
                                                   65 0 0 0 39 1 0 7 0 20 0 0 0
                                                   17 2 0 0 0 46 53 2 0 58 28
                                                   46 60 1 0 0 8 12 1 0 8 0 10
                                                   1 0 8 0 32 0 0 28 29)))))
           '|lookupComplete|)) 
