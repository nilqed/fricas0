
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
        (SPROG ((#1=#:G724 NIL) (|i| NIL) (#2=#:G723 NIL) (#3=#:G720 NIL))
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

(SDEFUN |MONOGEN-;reduce;FU;9| ((|x| |Fraction| UP) ($ |Union| S "failed"))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 34)) (QREFELT $ 11))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 35)) (QREFELT $ 11))
                  (QREFELT $ 37))) 

(SDEFUN |MONOGEN-;differentiate;SMS;10| ((|x| S) (|d| |Mapping| R R) ($ S))
        (SPROG ((|yprime| (S)) (|p| (UP)))
               (SEQ
                (LETT |p| (SPADCALL (QREFELT $ 18))
                      . #1=(|MONOGEN-;differentiate;SMS;10|))
                (LETT |yprime|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |d| |p| (QREFELT $ 40))
                                  (QREFELT $ 11))
                        (SPADCALL (SPADCALL |p| (QREFELT $ 41)) (QREFELT $ 11))
                        (QREFELT $ 42))
                       (QREFELT $ 43))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL |d| (SPADCALL |x| (QREFELT $ 9)) (QREFELT $ 40))
                   (QREFELT $ 11))
                  (SPADCALL |yprime|
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 9))
                                       (QREFELT $ 41))
                             (QREFELT $ 11))
                            (QREFELT $ 44))
                  (QREFELT $ 45)))))) 

(SDEFUN |MONOGEN-;derivationCoordinates;VMM;11|
        ((|b| |Vector| S) (|d| |Mapping| R R) ($ |Matrix| R))
        (SPROG NIL
               (SPADCALL
                (SPADCALL
                 (CONS #'|MONOGEN-;derivationCoordinates;VMM;11!0|
                       (VECTOR $ |d|))
                 |b| (QREFELT $ 50))
                |b| (QREFELT $ 52)))) 

(SDEFUN |MONOGEN-;derivationCoordinates;VMM;11!0| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1)
                . #1=(|MONOGEN-;derivationCoordinates;VMM;11|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 47)))))) 

(SDEFUN |MONOGEN-;recip;SU;12| ((|x| S) ($ |Union| S "failed"))
        (SPROG
         ((|bc|
           (|Union| (|Record| (|:| |coef1| UP) (|:| |coef2| UP)) "failed")))
         (SEQ
          (LETT |bc|
                (SPADCALL (SPADCALL |x| (QREFELT $ 9))
                          (SPADCALL (QREFELT $ 18)) (|spadConstant| $ 54)
                          (QREFELT $ 57))
                |MONOGEN-;recip;SU;12|)
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
          (LETT $ (GETREFV 68) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|FiniteFieldCategory|))
                                              (|HasCategory| |#2| '(|Field|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 38
                       (CONS (|dispatchFunction| |MONOGEN-;reduce;FU;9|) $))
             (QSETREFV $ 46
                       (CONS
                        (|dispatchFunction| |MONOGEN-;differentiate;SMS;10|)
                        $))
             (QSETREFV $ 53
                       (CONS
                        (|dispatchFunction|
                         |MONOGEN-;derivationCoordinates;VMM;11|)
                        $))
             (QSETREFV $ 58
                       (CONS (|dispatchFunction| |MONOGEN-;recip;SU;12|) $)))))
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
              |MONOGEN-;characteristicPolynomial;SUP;8| (|Fraction| 8)
              (53 . |numer|) (58 . |denom|) (|Union| $ '"failed")
              (63 . |exquo|) (69 . |reduce|) (|Mapping| 7 7) (74 . |map|)
              (80 . |differentiate|) (85 . /) (91 . -) (96 . *) (102 . +)
              (108 . |differentiate|) (114 . |differentiate|) (|Mapping| 6 6)
              (|Vector| 6) (120 . |map|) (|Matrix| 7) (126 . |coordinates|)
              (132 . |derivationCoordinates|) (138 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 55 '"failed")
              (142 . |extendedEuclidean|) (149 . |recip|) (|List| 61)
              (|List| 15) (|Symbol|) (|InputForm|) (|Fraction| 65)
              (|Union| 63 '#1#) (|Integer|) (|Union| 65 '#1#) (|Vector| 7))
           '#(|retractIfCan| 154 |retract| 159 |reduce| 164 |recip| 169 |norm|
              174 |generator| 179 |differentiate| 183 |derivationCoordinates|
              189 |convert| 195 |characteristicPolynomial| 205 |basis| 210)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 58
                                                 '(1 6 8 0 9 1 6 0 8 11 0 6 0
                                                   13 0 7 0 14 2 8 0 7 15 16 0
                                                   6 8 18 2 8 7 0 0 19 1 8 7 0
                                                   21 1 8 23 0 24 0 6 26 27 1
                                                   30 8 6 31 1 33 8 0 34 1 33 8
                                                   0 35 2 6 36 0 0 37 1 0 36 33
                                                   38 2 8 0 39 0 40 1 8 0 0 41
                                                   2 6 0 0 0 42 1 6 0 0 43 2 6
                                                   0 0 0 44 2 6 0 0 0 45 2 0 0
                                                   0 39 46 2 6 0 0 39 47 2 49 0
                                                   48 0 50 2 6 51 28 28 52 2 0
                                                   51 28 39 53 0 8 0 54 3 8 56
                                                   0 0 0 57 1 0 36 0 58 1 0 23
                                                   0 25 1 0 7 0 22 1 0 36 33 38
                                                   1 0 36 0 58 1 0 7 0 20 0 0 0
                                                   17 2 0 0 0 39 46 2 0 51 28
                                                   39 53 1 0 0 8 12 1 0 8 0 10
                                                   1 0 8 0 32 0 0 28 29)))))
           '|lookupComplete|)) 
