
(SDEFUN |COMPCAT-;characteristicPolynomial;SSup;1|
        ((|x| S) ($ |SparseUnivariatePolynomial| R))
        (SPROG ((|v| (|SparseUnivariatePolynomial| R)))
               (SEQ
                (LETT |v| (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 12))
                      |COMPCAT-;characteristicPolynomial;SSup;1|)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |v| 2 (QREFELT $ 14))
                            (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                      (SPADCALL |v| 1 (QREFELT $ 16))
                                      (QREFELT $ 17))
                            (QREFELT $ 18))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 19))
                            (SPADCALL |v| 0 (QREFELT $ 16)) (QREFELT $ 17))
                  (QREFELT $ 22)))))) 

(SDEFUN |COMPCAT-;myNextPrime| ((|x| S) (|n| |NonNegativeInteger|) ($ S))
        (SPROG ((|xr| (R)))
               (SEQ
                (LETT |xr|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 24))
                                (SPADCALL 4 (QREFELT $ 26)) (QREFELT $ 27))
                      . #1=(|COMPCAT-;myNextPrime|))
                (SEQ G190
                     (COND
                      ((NULL (NULL (SPADCALL |xr| (QREFELT $ 29)))) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |xr|
                             (SPADCALL |xr| (SPADCALL 4 (QREFELT $ 26))
                                       (QREFELT $ 27))
                             . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |xr| (|spadConstant| $ 21) (QREFELT $ 30)))))) 

(SDEFUN |COMPCAT-;solveLinearPolynomialEquation;LSupU;3|
        ((|lp| |List| (|SparseUnivariatePolynomial| S))
         (|p| |SparseUnivariatePolynomial| S)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPADCALL |lp| |p| (QREFELT $ 35))) 

(SDEFUN |COMPCAT-;normPolynomial|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| R))
        (SPADCALL (ELT $ 40)
                  (SPADCALL |pp| (SPADCALL (ELT $ 41) |pp| (QREFELT $ 43))
                            (QREFELT $ 44))
                  (QREFELT $ 47))) 

(SDEFUN |COMPCAT-;factorPolynomial;SupF;5|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL (SPADCALL |pp| (QREFELT $ 49)) (ELT $ 51) (QREFELT $ 55))) 

(SDEFUN |COMPCAT-;factorSquareFreePolynomial;SupF;6|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G803 NIL)
          (|lF|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|SparseUnivariatePolynomial| S))
                      (|:| |xpnt| (|Integer|)))))
          (|p2| (|SparseUnivariatePolynomial| S))
          (|p1| (|SparseUnivariatePolynomial| S)) (#2=#:G810 NIL) (|u| NIL)
          (|fR| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|pnorm| (|SparseUnivariatePolynomial| R)) (|k| (R)))
         (SEQ
          (LETT |pnorm| (|COMPCAT-;normPolynomial| |pp| $)
                . #3=(|COMPCAT-;factorSquareFreePolynomial;SupF;6|))
          (LETT |k| (|spadConstant| $ 21) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL |pnorm| (SPADCALL |pnorm| (QREFELT $ 57))
                              (QREFELT $ 58))
                    (QREFELT $ 59))
                   0 (QREFELT $ 60)))
                 (GO G191)))
               (SEQ
                (LETT |k| (SPADCALL |k| (|spadConstant| $ 9) (QREFELT $ 61))
                      . #3#)
                (EXIT
                 (LETT |pnorm|
                       (|COMPCAT-;normPolynomial|
                        (SPADCALL |pp|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 8) 1
                                             (QREFELT $ 62))
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 21) |k|
                                              (QREFELT $ 30))
                                    0 (QREFELT $ 62))
                                   (QREFELT $ 63))
                                  (QREFELT $ 64))
                        $)
                       . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |fR| (SPADCALL |pnorm| (QREFELT $ 65)) . #3#)
          (EXIT
           (COND
            ((EQL (SPADCALL |fR| (QREFELT $ 67)) 1)
             (SPADCALL (|spadConstant| $ 68)
                       (LIST (VECTOR (CONS 2 "irred") |pp| 1)) (QREFELT $ 72)))
            ('T
             (SEQ (LETT |lF| NIL . #3#)
                  (SEQ (LETT |u| NIL . #3#)
                       (LETT #2# (SPADCALL |fR| (QREFELT $ 75)) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |p1|
                              (SPADCALL (ELT $ 76) (QVELT |u| 1)
                                        (QREFELT $ 79))
                              . #3#)
                        (COND
                         ((NULL (SPADCALL |k| (QREFELT $ 80)))
                          (LETT |p1|
                                (SPADCALL |p1|
                                          (SPADCALL
                                           (SPADCALL (|spadConstant| $ 8) 1
                                                     (QREFELT $ 62))
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 21) |k|
                                                      (QREFELT $ 30))
                                            0 (QREFELT $ 62))
                                           (QREFELT $ 81))
                                          (QREFELT $ 64))
                                . #3#)))
                        (LETT |p2| (SPADCALL |p1| |pp| (QREFELT $ 82)) . #3#)
                        (LETT |lF| (CONS (VECTOR (CONS 2 "irred") |p2| 1) |lF|)
                              . #3#)
                        (EXIT
                         (LETT |pp|
                               (PROG2
                                   (LETT #1#
                                         (SPADCALL |pp| |p2| (QREFELT $ 84))
                                         . #3#)
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 6))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 6))
                                                  "failed")
                                                 #1#))
                               . #3#)))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |pp| |lF| (QREFELT $ 72)))))))))) 

(SDEFUN |COMPCAT-;factor;SF;7| ((|x| S) ($ |Factored| S))
        (SPROG
         ((|z| (|Factored| (|Complex| (|Integer|))))
          (|y| (|Complex| (|Integer|))))
         (SEQ
          (LETT |y|
                (SPADCALL
                 (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 86))
                 (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 86))
                 (QREFELT $ 89))
                . #1=(|COMPCAT-;factor;SF;7|))
          (LETT |z| (SPADCALL |y| (QREFELT $ 92)) . #1#)
          (EXIT
           (SPADCALL (CONS #'|COMPCAT-;factor;SF;7!0| $) |z| (QREFELT $ 98)))))) 

(SDEFUN |COMPCAT-;factor;SF;7!0| ((|f| NIL) ($ NIL))
        (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 93)) (QREFELT $ 26))
                  (SPADCALL (SPADCALL |f| (QREFELT $ 94)) (QREFELT $ 26))
                  (QREFELT $ 30))) 

(SDEFUN |COMPCAT-;squareFree;SF;8| ((|x| S) ($ |Factored| S))
        (SPADCALL |x| (QREFELT $ 100))) 

(SDEFUN |COMPCAT-;prime?;SB;9| ((|x| S) ($ |Boolean|))
        (SPROG ((|y| (|Complex| (|Integer|))))
               (SEQ
                (LETT |y|
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 86))
                       (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 86))
                       (QREFELT $ 89))
                      |COMPCAT-;prime?;SB;9|)
                (EXIT (SPADCALL |y| (QREFELT $ 102)))))) 

(PUT '|COMPCAT-;rank;Pi;10| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |COMPCAT-;rank;Pi;10| (($ |PositiveInteger|)) 2) 

(SDEFUN |COMPCAT-;discriminant;R;11| (($ R))
        (SPADCALL (SPADCALL 4 (QREFELT $ 26)) (QREFELT $ 105))) 

(SDEFUN |COMPCAT-;norm;SR;12| ((|x| S) ($ R))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 24)) 2 (QREFELT $ 107))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 87)) 2 (QREFELT $ 107))
                  (QREFELT $ 61))) 

(SDEFUN |COMPCAT-;trace;SR;13| ((|x| S) ($ R))
        (SPADCALL 2 (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 109))) 

(SDEFUN |COMPCAT-;imaginary;S;14| (($ S))
        (SPADCALL (|spadConstant| $ 21) (|spadConstant| $ 9) (QREFELT $ 30))) 

(SDEFUN |COMPCAT-;conjugate;2S;15| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 24))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 105))
                  (QREFELT $ 30))) 

(SDEFUN |COMPCAT-;characteristic;Nni;16| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 113))) 

(SDEFUN |COMPCAT-;map;M2S;17| ((|fn| |Mapping| R R) (|x| S) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 24)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT $ 87)) |fn|) (QREFELT $ 30))) 

(SDEFUN |COMPCAT-;=;2SB;18| ((|x| S) (|y| S) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 24)) (SPADCALL |y| (QREFELT $ 24))
                    (QREFELT $ 117))
          (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (SPADCALL |y| (QREFELT $ 87))
                    (QREFELT $ 117)))
         ('T NIL))) 

(SDEFUN |COMPCAT-;+;3S;19| ((|x| S) (|y| S) ($ S))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (SPADCALL |y| (QREFELT $ 24))
                   (QREFELT $ 61))
         (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (SPADCALL |y| (QREFELT $ 87))
                   (QREFELT $ 61))
         (QREFELT $ 30))) 

(SDEFUN |COMPCAT-;-;2S;20| ((|x| S) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 105))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 105))
                  (QREFELT $ 30))) 

(SDEFUN |COMPCAT-;*;R2S;21| ((|r| R) (|x| S) ($ S))
        (SPADCALL (SPADCALL |r| (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 121))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 121))
                  (QREFELT $ 30))) 

(SDEFUN |COMPCAT-;coordinates;SV;22| ((|x| S) ($ |Vector| R))
        (VECTOR (SPADCALL |x| (QREFELT $ 24)) (SPADCALL |x| (QREFELT $ 87)))) 

(SDEFUN |COMPCAT-;*;I2S;23| ((|n| |Integer|) (|x| S) ($ S))
        (SPADCALL (SPADCALL |n| (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 125))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 125))
                  (QREFELT $ 30))) 

(SDEFUN |COMPCAT-;differentiate;SMS;24| ((|x| S) (|d| |Mapping| R R) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 24)) |d|)
                  (SPADCALL (SPADCALL |x| (QREFELT $ 87)) |d|) (QREFELT $ 30))) 

(SDEFUN |COMPCAT-;definingPolynomial;Sup;25|
        (($ |SparseUnivariatePolynomial| R))
        (SPADCALL (SPADCALL (|spadConstant| $ 9) 2 (QREFELT $ 12))
                  (SPADCALL (|spadConstant| $ 9) 0 (QREFELT $ 12))
                  (QREFELT $ 22))) 

(SDEFUN |COMPCAT-;reduce;SupS;26|
        ((|pol| |SparseUnivariatePolynomial| R) ($ S))
        (SPROG ((|part| (|SparseUnivariatePolynomial| R)))
               (SEQ
                (LETT |part|
                      (QCDR
                       (SPADCALL |pol| (SPADCALL (QREFELT $ 129))
                                 (QREFELT $ 131)))
                      |COMPCAT-;reduce;SupS;26|)
                (EXIT
                 (SPADCALL (SPADCALL |part| 0 (QREFELT $ 132))
                           (SPADCALL |part| 1 (QREFELT $ 132))
                           (QREFELT $ 30)))))) 

(SDEFUN |COMPCAT-;lift;SSup;27| ((|x| S) ($ |SparseUnivariatePolynomial| R))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 24)) 0 (QREFELT $ 12))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 87)) 1 (QREFELT $ 12))
                  (QREFELT $ 22))) 

(SDEFUN |COMPCAT-;minimalPolynomial;SSup;28|
        ((|x| S) ($ |SparseUnivariatePolynomial| R))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 80))
          (SPADCALL (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 12))
                    (SPADCALL (SPADCALL |x| (QREFELT $ 24)) 0 (QREFELT $ 12))
                    (QREFELT $ 18)))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| $ 9) 2 (QREFELT $ 12))
                     (SPADCALL (SPADCALL |x| (QREFELT $ 15)) 1 (QREFELT $ 12))
                     (QREFELT $ 18))
           (SPADCALL (SPADCALL |x| (QREFELT $ 19)) 0 (QREFELT $ 12))
           (QREFELT $ 22))))) 

(SDEFUN |COMPCAT-;coordinates;SVV;29| ((|x| S) (|v| |Vector| S) ($ |Vector| R))
        (SPROG
         ((|ix| (R)) (|rx| (R)) (#1=#:G856 NIL) (|d| (|Union| R "failed"))
          (|ia| (R)) (|ib| (R)) (|rb| (R)) (|b| (S)) (|ra| (R)) (|a| (S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ra|
                  (SPADCALL
                   (LETT |a|
                         (SPADCALL |v| (SPADCALL |v| (QREFELT $ 137))
                                   (QREFELT $ 138))
                         . #2=(|COMPCAT-;coordinates;SVV;29|))
                   (QREFELT $ 24))
                  . #2#)
            (LETT |rb|
                  (SPADCALL
                   (LETT |b| (SPADCALL |v| (QVSIZE |v|) (QREFELT $ 138)) . #2#)
                   (QREFELT $ 24))
                  . #2#)
            (COND
             ((SPADCALL (QVSIZE |v|) 2 (QREFELT $ 139))
              (EXIT (|error| #3="coordinates: vector is not a basis")))
             ('T
              (SEQ
               (LETT |d|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL |ra|
                                 (LETT |ib| (SPADCALL |b| (QREFELT $ 87))
                                       . #2#)
                                 (QREFELT $ 121))
                       (SPADCALL
                        (LETT |ia| (SPADCALL |a| (QREFELT $ 87)) . #2#) |rb|
                        (QREFELT $ 121))
                       (QREFELT $ 27))
                      (QREFELT $ 140))
                     . #2#)
               (EXIT
                (COND
                 ((QEQCAR |d| 1)
                  (PROGN (LETT #1# (|error| #3#) . #2#) (GO #4=#:G854))))))))
            (LETT |rx| (SPADCALL |x| (QREFELT $ 24)) . #2#)
            (LETT |ix| (SPADCALL |x| (QREFELT $ 87)) . #2#)
            (EXIT
             (VECTOR
              (SPADCALL (QCDR |d|)
                        (SPADCALL (SPADCALL |rx| |ib| (QREFELT $ 121))
                                  (SPADCALL |ix| |rb| (QREFELT $ 121))
                                  (QREFELT $ 27))
                        (QREFELT $ 121))
              (SPADCALL (QCDR |d|)
                        (SPADCALL (SPADCALL |ra| |ix| (QREFELT $ 121))
                                  (SPADCALL |ia| |rx| (QREFELT $ 121))
                                  (QREFELT $ 27))
                        (QREFELT $ 121))))))
          #4# (EXIT #1#)))) 

(SDEFUN |COMPCAT-;coerce;SOf;30| ((|x| S) ($ |OutputForm|))
        (SPROG
         ((|ip| #1=(|OutputForm|)) (|outi| #1#) (|ie| (|OutputForm|)) (|i| (R))
          (|re| (|OutputForm|)) (|r| (R)))
         (SEQ
          (LETT |re|
                (SPADCALL
                 (LETT |r| (SPADCALL |x| (QREFELT $ 24))
                       . #2=(|COMPCAT-;coerce;SOf;30|))
                 (QREFELT $ 144))
                . #2#)
          (LETT |ie|
                (SPADCALL (LETT |i| (SPADCALL |x| (QREFELT $ 87)) . #2#)
                          (QREFELT $ 144))
                . #2#)
          (EXIT
           (COND ((SPADCALL |i| (QREFELT $ 80)) |re|)
                 (#3='T
                  (SEQ (LETT |outi| (SPADCALL '|%i| (QREFELT $ 146)) . #2#)
                       (LETT |ip|
                             (COND
                              ((SPADCALL |i| (|spadConstant| $ 9)
                                         (QREFELT $ 117))
                               |outi|)
                              ((SPADCALL (SPADCALL |i| (QREFELT $ 105))
                                         (|spadConstant| $ 9) (QREFELT $ 117))
                               (SPADCALL |outi| (QREFELT $ 147)))
                              (#3# (SPADCALL |ie| |outi| (QREFELT $ 148))))
                             . #2#)
                       (EXIT
                        (COND ((SPADCALL |r| (QREFELT $ 80)) |ip|)
                              (#3#
                               (SPADCALL |re| |ip| (QREFELT $ 149)))))))))))) 

(SDEFUN |COMPCAT-;retract;SR;31| ((|x| S) ($ R))
        (COND
         ((NULL (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 80)))
          (|error| "Imaginary part is nonzero. Cannot retract."))
         ('T (SPADCALL |x| (QREFELT $ 24))))) 

(SDEFUN |COMPCAT-;retractIfCan;SU;32| ((|x| S) ($ |Union| R "failed"))
        (COND
         ((NULL (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 80)))
          (CONS 1 "failed"))
         ('T (CONS 0 (SPADCALL |x| (QREFELT $ 24)))))) 

(SDEFUN |COMPCAT-;*;3S;33| ((|x| S) (|y| S) ($ S))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (SPADCALL |y| (QREFELT $ 24))
                    (QREFELT $ 121))
          (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (SPADCALL |y| (QREFELT $ 87))
                    (QREFELT $ 121))
          (QREFELT $ 27))
         (SPADCALL
          (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (SPADCALL |y| (QREFELT $ 24))
                    (QREFELT $ 121))
          (SPADCALL (SPADCALL |y| (QREFELT $ 87)) (SPADCALL |x| (QREFELT $ 24))
                    (QREFELT $ 121))
          (QREFELT $ 61))
         (QREFELT $ 30))) 

(SDEFUN |COMPCAT-;reducedSystem;MM;34| ((|m| |Matrix| S) ($ |Matrix| R))
        (SPADCALL (SPADCALL (ELT $ 24) |m| (QREFELT $ 158))
                  (SPADCALL (ELT $ 87) |m| (QREFELT $ 158)) (QREFELT $ 159))) 

(SDEFUN |COMPCAT-;reducedSystem;MVR;35|
        ((|m| |Matrix| S) (|v| |Vector| S)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPROG ((|rh| (|Matrix| R)))
               (SEQ
                (LETT |rh|
                      (SPADCALL (SPADCALL |v| (QREFELT $ 162)) (QREFELT $ 163))
                      |COMPCAT-;reducedSystem;MVR;35|)
                (EXIT
                 (CONS (SPADCALL |m| (QREFELT $ 163))
                       (SPADCALL |rh| 1 (QREFELT $ 164))))))) 

(SDEFUN |COMPCAT-;abs;2S;36| ((|x| S) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 167))
                  (QREFELT $ 76))) 

(SDEFUN |COMPCAT-;convert;SC;37| ((|x| S) ($ |Complex| (|DoubleFloat|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 170))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 170))
                  (QREFELT $ 172))) 

(SDEFUN |COMPCAT-;convert;SC;38| ((|x| S) ($ |Complex| (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 175))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 175))
                  (QREFELT $ 177))) 

(SDEFUN |COMPCAT-;convert;SIf;39| ((|x| S) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|complex| (QREFELT $ 180))
               (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 181))
               (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 181)))
         (QREFELT $ 183))) 

(SDEFUN |COMPCAT-;convert;SP;40| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 187))) 

(SDEFUN |COMPCAT-;convert;SP;41| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL |x| (QREFELT $ 191))) 

(SDEFUN |COMPCAT-;patternMatch;SP2Pmr;42|
        ((|x| S) (|p| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) S)
         ($ |PatternMatchResult| (|Integer|) S))
        (SPADCALL |x| |p| |l| (QREFELT $ 195))) 

(SDEFUN |COMPCAT-;patternMatch;SP2Pmr;43|
        ((|x| S) (|p| |Pattern| (|Float|))
         (|l| |PatternMatchResult| (|Float|) S)
         ($ |PatternMatchResult| (|Float|) S))
        (SPADCALL |x| |p| |l| (QREFELT $ 200))) 

(SDEFUN |COMPCAT-;smaller?;2SB;44| ((|x| S) (|y| S) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 24)) (SPADCALL |y| (QREFELT $ 24))
                    (QREFELT $ 117))
          (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (SPADCALL |y| (QREFELT $ 87))
                    (QREFELT $ 203)))
         ('T
          (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (SPADCALL |y| (QREFELT $ 24))
                    (QREFELT $ 203))))) 

(SDEFUN |COMPCAT-;rational?;SB;45| ((|x| S) ($ |Boolean|))
        (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 80))) 

(SDEFUN |COMPCAT-;rational;SF;46| ((|x| S) ($ |Fraction| (|Integer|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 80))
          (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 207)))
         ('T (|error| "Not a rational number")))) 

(SDEFUN |COMPCAT-;rationalIfCan;SU;47|
        ((|x| S) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 80))
          (CONS 0 (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 207))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |COMPCAT-;inv;2S;48| ((|x| S) ($ S))
        (SPROG ((|r| (R)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 80))
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 211))
                   (QREFELT $ 76)))
                 ('T
                  (SEQ
                   (LETT |r| (SPADCALL |x| (QREFELT $ 19))
                         |COMPCAT-;inv;2S;48|)
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL |x| (QREFELT $ 24)) |r|
                               (QREFELT $ 212))
                     (SPADCALL
                      (SPADCALL (SPADCALL |x| (QREFELT $ 87)) |r|
                                (QREFELT $ 212))
                      (QREFELT $ 105))
                     (QREFELT $ 30))))))))) 

(SDEFUN |COMPCAT-;exquo;SRU;49| ((|x| S) (|r| R) ($ |Union| S "failed"))
        (SPROG ((|r2| #1=(|Union| R "failed")) (|r1| #1#))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 9) (QREFELT $ 117))
                  (CONS 0 |x|))
                 (#2='T
                  (SEQ
                   (LETT |r1|
                         (SPADCALL (SPADCALL |x| (QREFELT $ 24)) |r|
                                   (QREFELT $ 214))
                         . #3=(|COMPCAT-;exquo;SRU;49|))
                   (EXIT
                    (COND ((QEQCAR |r1| 1) (CONS 1 "failed"))
                          (#2#
                           (SEQ
                            (LETT |r2|
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 87)) |r|
                                            (QREFELT $ 214))
                                  . #3#)
                            (EXIT
                             (COND ((QEQCAR |r2| 1) (CONS 1 "failed"))
                                   (#2#
                                    (CONS 0
                                          (SPADCALL (QCDR |r1|) (QCDR |r2|)
                                                    (QREFELT $
                                                             30)))))))))))))))) 

(SDEFUN |COMPCAT-;exquo;2SU;50| ((|x| S) (|y| S) ($ |Union| S "failed"))
        (COND
         ((SPADCALL (SPADCALL |y| (QREFELT $ 87)) (QREFELT $ 80))
          (SPADCALL |x| (SPADCALL |y| (QREFELT $ 24)) (QREFELT $ 216)))
         ('T
          (SPADCALL
           (SPADCALL |x| (SPADCALL |y| (QREFELT $ 41)) (QREFELT $ 217))
           (SPADCALL |y| (QREFELT $ 19)) (QREFELT $ 216))))) 

(SDEFUN |COMPCAT-;recip;SU;51| ((|x| S) ($ |Union| S "failed"))
        (SPADCALL (|spadConstant| $ 8) |x| (QREFELT $ 219))) 

(SDEFUN |COMPCAT-;unitNormal;SR;52|
        ((|x| S)
         ($ |Record| (|:| |unit| S) (|:| |canonical| S) (|:| |associate| S)))
        (SPROG
         ((|c|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R)))
          (|u| (|Union| S "failed")))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 221))
            (VECTOR (|spadConstant| $ 8) |x| (|spadConstant| $ 8)))
           (#1='T
            (SEQ
             (LETT |u| (SPADCALL |x| (QREFELT $ 222))
                   . #2=(|COMPCAT-;unitNormal;SR;52|))
             (EXIT
              (COND
               ((QEQCAR |u| 0) (VECTOR |x| (|spadConstant| $ 8) (QCDR |u|)))
               ((SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 80))
                (SEQ
                 (LETT |c|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 224))
                       . #2#)
                 (EXIT
                  (VECTOR
                   (SPADCALL (|spadConstant| $ 21) (QVELT |c| 0)
                             (QREFELT $ 30))
                   (SPADCALL
                    (SPADCALL (QVELT |c| 2) (SPADCALL |x| (QREFELT $ 87))
                              (QREFELT $ 121))
                    (QREFELT $ 76))
                   (SPADCALL (|spadConstant| $ 21)
                             (SPADCALL (QVELT |c| 2) (QREFELT $ 105))
                             (QREFELT $ 30))))))
               (#1#
                (SEQ
                 (LETT |c|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 224))
                       . #2#)
                 (LETT |x| (SPADCALL (QVELT |c| 2) |x| (QREFELT $ 225)) . #2#)
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 87))
                              (|spadConstant| $ 21) (QREFELT $ 226))
                    (SEQ
                     (LETT |x|
                           (SPADCALL
                            (SPADCALL (SPADCALL |x| (QREFELT $ 87))
                                      (QREFELT $ 105))
                            (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 30))
                           . #2#)
                     (EXIT
                      (VECTOR
                       (SPADCALL
                        (SPADCALL (QVELT |c| 0) (SPADCALL (QREFELT $ 227))
                                  (QREFELT $ 225))
                        (QREFELT $ 228))
                       |x|
                       (SPADCALL (QVELT |c| 2) (SPADCALL (QREFELT $ 227))
                                 (QREFELT $ 225))))))
                   (#1#
                    (VECTOR (SPADCALL (QVELT |c| 0) (QREFELT $ 76)) |x|
                            (SPADCALL (QVELT |c| 2)
                                      (QREFELT $ 76)))))))))))))))) 

(SDEFUN |COMPCAT-;unitNormal;SR;53|
        ((|x| S)
         ($ |Record| (|:| |unit| S) (|:| |canonical| S) (|:| |associate| S)))
        (SPROG
         ((|c|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R)))
          (|u| (|Union| S "failed")))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 221))
            (VECTOR (|spadConstant| $ 8) |x| (|spadConstant| $ 8)))
           (#1='T
            (SEQ
             (LETT |u| (SPADCALL |x| (QREFELT $ 222))
                   . #2=(|COMPCAT-;unitNormal;SR;53|))
             (EXIT
              (COND
               ((QEQCAR |u| 0) (VECTOR |x| (|spadConstant| $ 8) (QCDR |u|)))
               ((SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 80))
                (SEQ
                 (LETT |c|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 224))
                       . #2#)
                 (EXIT
                  (VECTOR
                   (SPADCALL (|spadConstant| $ 21) (QVELT |c| 0)
                             (QREFELT $ 30))
                   (SPADCALL
                    (SPADCALL (QVELT |c| 2) (SPADCALL |x| (QREFELT $ 87))
                              (QREFELT $ 121))
                    (QREFELT $ 76))
                   (SPADCALL (|spadConstant| $ 21)
                             (SPADCALL (QVELT |c| 2) (QREFELT $ 105))
                             (QREFELT $ 30))))))
               (#1#
                (SEQ
                 (LETT |c|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 224))
                       . #2#)
                 (LETT |x| (SPADCALL (QVELT |c| 2) |x| (QREFELT $ 225)) . #2#)
                 (EXIT
                  (VECTOR (SPADCALL (QVELT |c| 0) (QREFELT $ 76)) |x|
                          (SPADCALL (QVELT |c| 2) (QREFELT $ 76)))))))))))))) 

(SDEFUN |COMPCAT-;euclideanSize;SNni;54| ((|x| S) ($ |NonNegativeInteger|))
        (MAX (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 230))
             (SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 230)))) 

(SDEFUN |COMPCAT-;euclideanSize;SNni;55| ((|x| S) ($ |NonNegativeInteger|))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 24)) 2 (QREFELT $ 107))
                   (SPADCALL (SPADCALL |x| (QREFELT $ 87)) 2 (QREFELT $ 107))
                   (QREFELT $ 61))
         (QREFELT $ 230))) 

(SDEFUN |COMPCAT-;rem;3S;56| ((|x| S) (|y| S) ($ S))
        (SPROG ((|yr| (R)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |y| (QREFELT $ 87)) (QREFELT $ 80))
                  (SEQ
                   (LETT |yr| (SPADCALL |y| (QREFELT $ 24))
                         |COMPCAT-;rem;3S;56|)
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL |x| (QREFELT $ 24)) |yr|
                               (QREFELT $ 232))
                     (SPADCALL (SPADCALL |x| (QREFELT $ 87)) |yr|
                               (QREFELT $ 232))
                     (QREFELT $ 30)))))
                 ('T (QCDR (SPADCALL |x| |y| (QREFELT $ 233)))))))) 

(SDEFUN |COMPCAT-;quo;3S;57| ((|x| S) (|y| S) ($ S))
        (SPROG ((|xi| (R)) (|xr| (R)) (|yr| (R)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |y| (QREFELT $ 87)) (QREFELT $ 80))
                  (SEQ
                   (LETT |yr| (SPADCALL |y| (QREFELT $ 24))
                         . #1=(|COMPCAT-;quo;3S;57|))
                   (LETT |xr| (SPADCALL |x| (QREFELT $ 24)) . #1#)
                   (LETT |xi| (SPADCALL |x| (QREFELT $ 87)) . #1#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |xr| (SPADCALL |xr| |yr| (QREFELT $ 232))
                                (QREFELT $ 27))
                      |yr| (QREFELT $ 235))
                     (SPADCALL
                      (SPADCALL |xi| (SPADCALL |xi| |yr| (QREFELT $ 232))
                                (QREFELT $ 27))
                      |yr| (QREFELT $ 235))
                     (QREFELT $ 30)))))
                 ('T (QCAR (SPADCALL |x| |y| (QREFELT $ 233)))))))) 

(SDEFUN |COMPCAT-;rem;3S;58| ((|x| S) (|y| S) ($ S))
        (SPROG ((|yr| (R)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |y| (QREFELT $ 87)) (QREFELT $ 80))
                  (SEQ
                   (LETT |yr| (SPADCALL |y| (QREFELT $ 24))
                         |COMPCAT-;rem;3S;58|)
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL |x| (QREFELT $ 24)) |yr|
                               (QREFELT $ 237))
                     (SPADCALL (SPADCALL |x| (QREFELT $ 87)) |yr|
                               (QREFELT $ 237))
                     (QREFELT $ 30)))))
                 ('T (QCDR (SPADCALL |x| |y| (QREFELT $ 233)))))))) 

(SDEFUN |COMPCAT-;quo;3S;59| ((|x| S) (|y| S) ($ S))
        (COND
         ((SPADCALL (SPADCALL |y| (QREFELT $ 87)) (QREFELT $ 80))
          (SPADCALL
           (SPADCALL (SPADCALL |x| (QREFELT $ 24))
                     (SPADCALL |y| (QREFELT $ 24)) (QREFELT $ 235))
           (SPADCALL (SPADCALL |x| (QREFELT $ 87))
                     (SPADCALL |y| (QREFELT $ 24)) (QREFELT $ 235))
           (QREFELT $ 30)))
         ('T (QCAR (SPADCALL |x| |y| (QREFELT $ 233)))))) 

(SDEFUN |COMPCAT-;divide;2SR;60|
        ((|x| S) (|y| S) ($ |Record| (|:| |quotient| S) (|:| |remainder| S)))
        (SPROG
         ((#1=#:G990 NIL) (|y1| (S)) (|b| (R)) (|x2| (R)) (|a| (R)) (|x1| (R))
          (|xx| (S)) (|r| (R)))
         (SEQ
          (LETT |r| (SPADCALL |y| (QREFELT $ 19))
                . #2=(|COMPCAT-;divide;2SR;60|))
          (LETT |y1| (SPADCALL |y| (QREFELT $ 41)) . #2#)
          (LETT |xx| (SPADCALL |x| |y1| (QREFELT $ 217)) . #2#)
          (LETT |x1|
                (SPADCALL (SPADCALL |xx| (QREFELT $ 24)) |r| (QREFELT $ 237))
                . #2#)
          (LETT |a| |x1| . #2#)
          (COND
           ((SPADCALL |x1| (|spadConstant| $ 21) (QREFELT $ 238))
            (COND
             ((SPADCALL |r| (SPADCALL 2 |x1| (QREFELT $ 109)) (QREFELT $ 239))
              (SEQ (LETT |a| (SPADCALL |x1| |r| (QREFELT $ 27)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |x1| |a| (QREFELT $ 239))
                      (LETT |a| (SPADCALL |x1| |r| (QREFELT $ 61))
                            . #2#)))))))))
          (LETT |x2|
                (SPADCALL (SPADCALL |xx| (QREFELT $ 87)) |r| (QREFELT $ 237))
                . #2#)
          (LETT |b| |x2| . #2#)
          (COND
           ((SPADCALL |x2| (|spadConstant| $ 21) (QREFELT $ 238))
            (COND
             ((SPADCALL |r| (SPADCALL 2 |x2| (QREFELT $ 109)) (QREFELT $ 239))
              (SEQ (LETT |b| (SPADCALL |x2| |r| (QREFELT $ 27)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |x2| |b| (QREFELT $ 239))
                      (LETT |b| (SPADCALL |x2| |r| (QREFELT $ 61))
                            . #2#)))))))))
          (LETT |y1|
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL |a| |b| (QREFELT $ 30)) |y1|
                                    (QREFELT $ 219))
                          . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                  (|Union| (QREFELT $ 6) #3="failed") #1#))
                . #2#)
          (EXIT
           (CONS
            (PROG2
                (LETT #1#
                      (SPADCALL (SPADCALL |x| |y1| (QREFELT $ 240)) |y|
                                (QREFELT $ 219))
                      . #2#)
                (QCDR #1#)
              (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                              (|Union| (QREFELT $ 6) #3#) #1#))
            |y1|))))) 

(SDEFUN |COMPCAT-;atan2loc| ((|x| R) (|y| R) ($ R))
        (SPROG ((|theta| (R)) (#1=#:G995 NIL) (|pi2| (R)) (|pi1| (R)))
               (SEQ
                (LETT |pi1| (SPADCALL (QREFELT $ 243))
                      . #2=(|COMPCAT-;atan2loc|))
                (LETT |pi2| (SPADCALL |pi1| (QREFELT $ 242) (QREFELT $ 121))
                      . #2#)
                (EXIT
                 (COND
                  ((SPADCALL |x| (|spadConstant| $ 21) (QREFELT $ 117))
                   (COND
                    ((SPADCALL |y| (|spadConstant| $ 21) (QREFELT $ 244))
                     |pi2|)
                    (#3='T (SPADCALL |pi2| (QREFELT $ 105)))))
                  (#3#
                   (SEQ
                    (LETT |theta|
                          (SPADCALL
                           (SPADCALL |y|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |x| (QREFELT $ 140))
                                               . #2#)
                                         (QCDR #1#)
                                       (|check_union2| (QEQCAR #1# 0)
                                                       (QREFELT $ 7)
                                                       (|Union| (QREFELT $ 7)
                                                                "failed")
                                                       #1#))
                                     (QREFELT $ 121))
                           (QREFELT $ 245))
                          . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |x| (|spadConstant| $ 21) (QREFELT $ 244))
                       |theta|)
                      ((SPADCALL |y| (|spadConstant| $ 21) (QREFELT $ 244))
                       (SPADCALL |theta| |pi1| (QREFELT $ 61)))
                      (#3# (SPADCALL |theta| |pi1| (QREFELT $ 27)))))))))))) 

(SDEFUN |COMPCAT-;argument;SR;62| ((|x| S) ($ R))
        (|COMPCAT-;atan2loc| (SPADCALL |x| (QREFELT $ 24))
         (SPADCALL |x| (QREFELT $ 87)) $)) 

(SDEFUN |COMPCAT-;argument;SR;63| ((|x| S) ($ R))
        (SPROG ((#1=#:G995 NIL) (|x1| (R)) (|n1| (R)))
               (SEQ
                (LETT |n1|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 167))
                      . #2=(|COMPCAT-;argument;SR;63|))
                (LETT |x1|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 24)) |n1|
                                (QREFELT $ 61))
                      . #2#)
                (EXIT
                 (SPADCALL (SPADCALL 2 (QREFELT $ 26))
                           (SPADCALL
                            (SPADCALL (SPADCALL |x| (QREFELT $ 87))
                                      (PROG2
                                          (LETT #1#
                                                (SPADCALL |x1| (QREFELT $ 140))
                                                . #2#)
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (QREFELT $ 7)
                                                        (|Union| (QREFELT $ 7)
                                                                 "failed")
                                                        #1#))
                                      (QREFELT $ 121))
                            (QREFELT $ 245))
                           (QREFELT $ 121)))))) 

(SDEFUN |COMPCAT-;argument;SR;64| ((|x| S) ($ R))
        (SPROG ((#1=#:G995 NIL) (|x1| (R)) (|n1| (R)))
               (SEQ
                (LETT |n1|
                      (SPADCALL
                       (SPADCALL (QREFELT $ 242)
                                 (SPADCALL (SPADCALL |x| (QREFELT $ 19))
                                           (QREFELT $ 247))
                                 (QREFELT $ 121))
                       (QREFELT $ 248))
                      . #2=(|COMPCAT-;argument;SR;64|))
                (LETT |x1|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 24)) |n1|
                                (QREFELT $ 61))
                      . #2#)
                (EXIT
                 (SPADCALL (SPADCALL 2 (QREFELT $ 26))
                           (SPADCALL
                            (SPADCALL (SPADCALL |x| (QREFELT $ 87))
                                      (PROG2
                                          (LETT #1#
                                                (SPADCALL |x1| (QREFELT $ 140))
                                                . #2#)
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (QREFELT $ 7)
                                                        (|Union| (QREFELT $ 7)
                                                                 "failed")
                                                        #1#))
                                      (QREFELT $ 121))
                            (QREFELT $ 245))
                           (QREFELT $ 121)))))) 

(SDEFUN |COMPCAT-;pi;S;65| (($ S))
        (SPADCALL (SPADCALL (QREFELT $ 243)) (QREFELT $ 76))) 

(SDEFUN |COMPCAT-;exp;2S;66| ((|x| S) ($ S)) (|c_to_s| (EXP (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;log;2S;67| ((|x| S) ($ S)) (|c_to_s| (LOG (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;sin;2S;68| ((|x| S) ($ S)) (|c_to_s| (SIN (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;cos;2S;69| ((|x| S) ($ S)) (|c_to_s| (COS (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;tan;2S;70| ((|x| S) ($ S)) (|c_to_s| (TAN (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;asin;2S;71| ((|x| S) ($ S)) (|c_to_s| (ASIN (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;acos;2S;72| ((|x| S) ($ S)) (|c_to_s| (ACOS (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;atan;2S;73| ((|x| S) ($ S)) (|c_to_s| (ATAN (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;sinh;2S;74| ((|x| S) ($ S)) (|c_to_s| (SINH (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;cosh;2S;75| ((|x| S) ($ S)) (|c_to_s| (COSH (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;tanh;2S;76| ((|x| S) ($ S)) (|c_to_s| (TANH (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;asinh;2S;77| ((|x| S) ($ S))
        (|c_to_s| (ASINH (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;acosh;2S;78| ((|x| S) ($ S))
        (|c_to_s| (ACOSH (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;atanh;2S;79| ((|x| S) ($ S))
        (|c_to_s| (ATANH (|s_to_c| |x|)))) 

(SDEFUN |COMPCAT-;atan;2S;80| ((|x| S) ($ S))
        (SPROG ((|ix| (S)))
               (SEQ
                (LETT |ix|
                      (SPADCALL (SPADCALL (QREFELT $ 227)) |x| (QREFELT $ 217))
                      |COMPCAT-;atan;2S;80|)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT $ 227)) (QREFELT $ 242)
                             (QREFELT $ 264))
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 8) |ix| (QREFELT $ 265))
                     (QREFELT $ 266))
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 8) |ix| (QREFELT $ 240))
                     (QREFELT $ 266))
                    (QREFELT $ 240))
                   (QREFELT $ 217))
                  (QREFELT $ 228)))))) 

(SDEFUN |COMPCAT-;log;2S;81| ((|x| S) ($ S))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 247))
                   (QREFELT $ 242) (QREFELT $ 121))
         (SPADCALL |x| (QREFELT $ 267)) (QREFELT $ 30))) 

(SDEFUN |COMPCAT-;exp;2S;82| ((|x| S) ($ S))
        (SPROG ((|e| (R)))
               (SEQ
                (LETT |e|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 248))
                      |COMPCAT-;exp;2S;82|)
                (EXIT
                 (SPADCALL
                  (SPADCALL |e|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 87))
                                      (QREFELT $ 268))
                            (QREFELT $ 121))
                  (SPADCALL |e|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 87))
                                      (QREFELT $ 269))
                            (QREFELT $ 121))
                  (QREFELT $ 30)))))) 

(SDEFUN |COMPCAT-;cos;2S;83| ((|x| S) ($ S))
        (SPROG ((#1=#:G1026 NIL) (|e| (S)))
               (SEQ
                (LETT |e|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT $ 227)) |x|
                                 (QREFELT $ 217))
                       (QREFELT $ 270))
                      . #2=(|COMPCAT-;cos;2S;83|))
                (EXIT
                 (SPADCALL (QREFELT $ 242)
                           (SPADCALL |e|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |e| (QREFELT $ 222))
                                               . #2#)
                                         (QCDR #1#)
                                       (|check_union2| (QEQCAR #1# 0)
                                                       (QREFELT $ 6)
                                                       (|Union| (QREFELT $ 6)
                                                                "failed")
                                                       #1#))
                                     (QREFELT $ 265))
                           (QREFELT $ 225)))))) 

(SDEFUN |COMPCAT-;sin;2S;84| ((|x| S) ($ S))
        (SPROG ((#1=#:G1031 NIL) (|e| (S)))
               (SEQ
                (LETT |e|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT $ 227)) |x|
                                 (QREFELT $ 217))
                       (QREFELT $ 270))
                      . #2=(|COMPCAT-;sin;2S;84|))
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT $ 227)) (QREFELT $ 242)
                             (QREFELT $ 264))
                   (SPADCALL |e|
                             (PROG2
                                 (LETT #1# (SPADCALL |e| (QREFELT $ 222))
                                       . #2#)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                               (|Union| (QREFELT $ 6) "failed")
                                               #1#))
                             (QREFELT $ 240))
                   (QREFELT $ 217))
                  (QREFELT $ 228)))))) 

(SDEFUN |COMPCAT-;asin;2S;85| ((|x| S) ($ S))
        (SPADCALL
         (SPADCALL (SPADCALL (QREFELT $ 227))
                   (SPADCALL
                    (SPADCALL (SPADCALL (QREFELT $ 227)) |x| (QREFELT $ 217))
                    (QREFELT $ 271))
                   (QREFELT $ 217))
         (QREFELT $ 228))) 

(SDEFUN |COMPCAT-;acos;2S;86| ((|x| S) ($ S))
        (SPADCALL
         (SPADCALL (SPADCALL (QREFELT $ 227))
                   (SPADCALL
                    (SPADCALL |x|
                              (SPADCALL (SPADCALL (QREFELT $ 227))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 8)
                                                   (SPADCALL |x| 2
                                                             (QREFELT $ 272))
                                                   (QREFELT $ 240))
                                         (QREFELT $ 273))
                                        (QREFELT $ 217))
                              (QREFELT $ 265))
                    (QREFELT $ 266))
                   (QREFELT $ 217))
         (QREFELT $ 228))) 

(SDEFUN |COMPCAT-;acos;2S;87| ((|x| S) ($ S))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT $ 243)) (QREFELT $ 242) (QREFELT $ 121))
          (QREFELT $ 76))
         (SPADCALL |x| (QREFELT $ 274)) (QREFELT $ 240))) 

(SDEFUN |COMPCAT-;polarCoordinates;SR;88|
        ((|x| S) ($ |Record| (|:| |r| R) (|:| |phi| R)))
        (SPROG ((|t| (R)))
               (CONS (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 167))
                     (COND
                      ((SPADCALL
                        (LETT |t| (SPADCALL |x| (QREFELT $ 267))
                              |COMPCAT-;polarCoordinates;SR;88|)
                        (QREFELT $ 275))
                       (SPADCALL |t|
                                 (SPADCALL 2 (SPADCALL (QREFELT $ 243))
                                           (QREFELT $ 109))
                                 (QREFELT $ 61)))
                      ('T |t|))))) 

(SDEFUN |COMPCAT-;^;SFS;89| ((|x| S) (|q| |Fraction| (|Integer|)) ($ S))
        (SPROG ((|tx| (R)) (|ax| (R)) (|rx| (R)))
               (SEQ
                (COND
                 ((SPADCALL |q| (QREFELT $ 278))
                  (COND
                   ((SPADCALL |x| (QREFELT $ 221))
                    (|error| "0 ^ 0 is undefined"))
                   (#1='T (|spadConstant| $ 8))))
                 ((SPADCALL |x| (QREFELT $ 221)) (|spadConstant| $ 20))
                 (#1#
                  (SEQ
                   (LETT |rx| (SPADCALL |x| (QREFELT $ 24))
                         . #2=(|COMPCAT-;^;SFS;89|))
                   (COND
                    ((SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 80))
                     (COND
                      ((SPADCALL |rx| (QREFELT $ 279))
                       (EXIT
                        (SPADCALL (SPADCALL |rx| |q| (QREFELT $ 280))
                                  (QREFELT $ 76)))))))
                   (COND
                    ((SPADCALL (SPADCALL |x| (QREFELT $ 87)) (QREFELT $ 80))
                     (COND
                      ((EQL (SPADCALL |q| (QREFELT $ 281)) 2)
                       (EXIT
                        (SPADCALL (|spadConstant| $ 21)
                                  (SPADCALL (SPADCALL |rx| (QREFELT $ 105)) |q|
                                            (QREFELT $ 280))
                                  (QREFELT $ 30)))))))
                   (LETT |ax|
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT $ 19))
                                    (QREFELT $ 167))
                          |q| (QREFELT $ 280))
                         . #2#)
                   (LETT |tx|
                         (SPADCALL (SPADCALL |q| (QREFELT $ 282))
                                   (SPADCALL |x| (QREFELT $ 267))
                                   (QREFELT $ 121))
                         . #2#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL |ax| (SPADCALL |tx| (QREFELT $ 268))
                               (QREFELT $ 121))
                     (SPADCALL |ax| (SPADCALL |tx| (QREFELT $ 269))
                               (QREFELT $ 121))
                     (QREFELT $ 30))))))))) 

(SDEFUN |COMPCAT-;^;SFS;90| ((|x| S) (|q| |Fraction| (|Integer|)) ($ S))
        (SPROG ((|e| (R)) (|t| (R)) (#1=#:G995 NIL) (|i| (R)) (|r| (R)))
               (SEQ
                (COND
                 ((SPADCALL |q| (QREFELT $ 278))
                  (COND
                   ((SPADCALL |x| (QREFELT $ 221))
                    (|error| "0 ^ 0 is undefined"))
                   (#2='T (|spadConstant| $ 8))))
                 (#2#
                  (SEQ
                   (LETT |r| (SPADCALL |x| (QREFELT $ 24))
                         . #3=(|COMPCAT-;^;SFS;90|))
                   (EXIT
                    (COND
                     ((SPADCALL (LETT |i| (SPADCALL |x| (QREFELT $ 87)) . #3#)
                                (QREFELT $ 80))
                      (SPADCALL (SPADCALL |r| |q| (QREFELT $ 280))
                                (QREFELT $ 76)))
                     (#2#
                      (SEQ
                       (LETT |t|
                             (SPADCALL
                              (SPADCALL (SPADCALL |q| (QREFELT $ 284))
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |q|
                                                              (QREFELT $ 281))
                                                    (QREFELT $ 26))
                                                   (QREFELT $ 140))
                                                  . #3#)
                                            (QCDR #1#)
                                          (|check_union2| (QEQCAR #1# 0)
                                                          (QREFELT $ 7)
                                                          (|Union|
                                                           (QREFELT $ 7)
                                                           "failed")
                                                          #1#))
                                        (QREFELT $ 125))
                              (SPADCALL |x| (QREFELT $ 267)) (QREFELT $ 121))
                             . #3#)
                       (LETT |e|
                             (SPADCALL (SPADCALL |x| (QREFELT $ 19))
                                       (SPADCALL |q|
                                                 (SPADCALL 2 (QREFELT $ 285))
                                                 (QREFELT $ 286))
                                       (QREFELT $ 280))
                             . #3#)
                       (EXIT
                        (SPADCALL
                         (SPADCALL |e| (SPADCALL |t| (QREFELT $ 268))
                                   (QREFELT $ 121))
                         (SPADCALL |e| (SPADCALL |t| (QREFELT $ 269))
                                   (QREFELT $ 121))
                         (QREFELT $ 30))))))))))))) 

(SDEFUN |COMPCAT-;^;3S;91| ((|x| S) (|y| S) ($ S))
        (SPROG ((|yr| (R)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 20) (QREFELT $ 287))
                  (SEQ
                   (LETT |yr| (SPADCALL |y| (QREFELT $ 24)) |COMPCAT-;^;3S;91|)
                   (EXIT
                    (COND
                     ((SPADCALL (|spadConstant| $ 21) |yr| (QREFELT $ 226))
                      (|spadConstant| $ 20))
                     (#1='T (|error| "x^y with x = 0 and real(y) <= 0"))))))
                 (#1#
                  (SPADCALL
                   (SPADCALL |y| (SPADCALL |x| (QREFELT $ 266))
                             (QREFELT $ 217))
                   (QREFELT $ 270))))))) 

(SDEFUN |COMPCAT-;^;3S;92| ((|x| S) (|y| S) ($ S))
        (SPROG ((|yr| (R)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 20) (QREFELT $ 287))
                  (SEQ
                   (LETT |yr| (SPADCALL |y| (QREFELT $ 24)) |COMPCAT-;^;3S;92|)
                   (EXIT
                    (COND ((|less_DF| 0.0 |yr|) (|spadConstant| $ 20))
                          (#1='T
                           (|error| "x^y with x = 0 and real(y) <= 0"))))))
                 (#1#
                  (SPADCALL
                   (SPADCALL |y| (SPADCALL |x| (QREFELT $ 266))
                             (QREFELT $ 217))
                   (QREFELT $ 270))))))) 

(DECLAIM (NOTINLINE |ComplexCategory&;|)) 

(DEFUN |ComplexCategory&| (|#1| |#2|)
  (SPROG
   ((#1=#:G995 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|ComplexCategory&|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|ComplexCategory&| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 295) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#2|
                                                       '(|IntegerNumberSystem|))
                                        (|HasCategory| |#2|
                                                       '(|RadicalCategory|))
                                        (|HasCategory| |#2|
                                                       '(|TranscendentalFunctionCategory|))
                                        (|HasCategory| |#2|
                                                       '(|arbitraryPrecision|))
                                        (|HasCategory| |#2|
                                                       '(|RealNumberSystem|))
                                        (|HasCategory| |#2| '(|RealConstant|))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#2| '(|Field|))
                                        (|HasCategory| |#2|
                                                       '(|additiveValuation|))
                                        (|HasCategory| |#2|
                                                       '(|multiplicativeValuation|))
                                        (|HasCategory| |#2|
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| |#2|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#2| '(|Comparable|))))
                    . #2#))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (COND
       ((|testBitVector| |pv$| 14)
        (PROGN
         (COND
          ((|testBitVector| |pv$| 2)
           (PROGN
            (QSETREFV $ 39
                      (CONS
                       (|dispatchFunction|
                        |COMPCAT-;solveLinearPolynomialEquation;LSupU;3|)
                       $)))))
         NIL
         (QSETREFV $ 56
                   (CONS
                    (|dispatchFunction| |COMPCAT-;factorPolynomial;SupF;5|) $))
         (QSETREFV $ 85
                   (CONS
                    (|dispatchFunction|
                     |COMPCAT-;factorSquareFreePolynomial;SupF;6|)
                    $)))))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 99 (CONS (|dispatchFunction| |COMPCAT-;factor;SF;7|) $))
       (QSETREFV $ 101
                 (CONS (|dispatchFunction| |COMPCAT-;squareFree;SF;8|) $))
       (QSETREFV $ 103 (CONS (|dispatchFunction| |COMPCAT-;prime?;SB;9|) $)))))
    (COND
     ((|testBitVector| |pv$| 6)
      (QSETREFV $ 168 (CONS (|dispatchFunction| |COMPCAT-;abs;2S;36|) $))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 173 (CONS (|dispatchFunction| |COMPCAT-;convert;SC;37|) $))
       (QSETREFV $ 178
                 (CONS (|dispatchFunction| |COMPCAT-;convert;SC;38|) $)))))
    (COND
     ((|testBitVector| |pv$| 10)
      (QSETREFV $ 184
                (CONS (|dispatchFunction| |COMPCAT-;convert;SIf;39|) $))))
    (COND
     ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Integer|))))
      (QSETREFV $ 188 (CONS (|dispatchFunction| |COMPCAT-;convert;SP;40|) $))))
    (COND
     ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Float|))))
      (QSETREFV $ 192 (CONS (|dispatchFunction| |COMPCAT-;convert;SP;41|) $))))
    (COND
     ((|HasCategory| |#2| '(|PatternMatchable| (|Integer|)))
      (QSETREFV $ 197
                (CONS (|dispatchFunction| |COMPCAT-;patternMatch;SP2Pmr;42|)
                      $))))
    (COND
     ((|HasCategory| |#2| '(|PatternMatchable| (|Float|)))
      (QSETREFV $ 202
                (CONS (|dispatchFunction| |COMPCAT-;patternMatch;SP2Pmr;43|)
                      $))))
    (COND
     ((|testBitVector| |pv$| 16)
      (QSETREFV $ 204
                (CONS (|dispatchFunction| |COMPCAT-;smaller?;2SB;44|) $))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 205
                 (CONS (|dispatchFunction| |COMPCAT-;rational?;SB;45|) $))
       (QSETREFV $ 208 (CONS (|dispatchFunction| |COMPCAT-;rational;SF;46|) $))
       (QSETREFV $ 210
                 (CONS (|dispatchFunction| |COMPCAT-;rationalIfCan;SU;47|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 213 (CONS (|dispatchFunction| |COMPCAT-;inv;2S;48|) $))))
    (COND
     ((|testBitVector| |pv$| 15)
      (PROGN
       (QSETREFV $ 215 (CONS (|dispatchFunction| |COMPCAT-;exquo;SRU;49|) $))
       (QSETREFV $ 218 (CONS (|dispatchFunction| |COMPCAT-;exquo;2SU;50|) $))
       (QSETREFV $ 220 (CONS (|dispatchFunction| |COMPCAT-;recip;SU;51|) $))
       (COND
        ((|HasCategory| |#2| '(|OrderedRing|))
         (QSETREFV $ 229
                   (CONS (|dispatchFunction| |COMPCAT-;unitNormal;SR;52|) $)))
        ('T
         (QSETREFV $ 229
                   (CONS (|dispatchFunction| |COMPCAT-;unitNormal;SR;53|)
                         $)))))))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (COND
        ((|testBitVector| |pv$| 12)
         (QSETREFV $ 231
                   (CONS (|dispatchFunction| |COMPCAT-;euclideanSize;SNni;54|)
                         $)))
        ('T
         (QSETREFV $ 231
                   (CONS (|dispatchFunction| |COMPCAT-;euclideanSize;SNni;55|)
                         $))))
       (COND
        ((|testBitVector| |pv$| 2)
         (PROGN
          (QSETREFV $ 234 (CONS (|dispatchFunction| |COMPCAT-;rem;3S;56|) $))
          (QSETREFV $ 236 (CONS (|dispatchFunction| |COMPCAT-;quo;3S;57|) $))))
        ('T
         (PROGN
          (QSETREFV $ 234 (CONS (|dispatchFunction| |COMPCAT-;rem;3S;58|) $))
          (QSETREFV $ 236
                    (CONS (|dispatchFunction| |COMPCAT-;quo;3S;59|) $)))))
       (QSETREFV $ 241
                 (CONS (|dispatchFunction| |COMPCAT-;divide;2SR;60|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 242
                 (PROG2
                     (LETT #1#
                           (SPADCALL (SPADCALL 2 (QREFELT $ 26))
                                     (QREFELT $ 140))
                           . #2#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| "failed")
                                   #1#)))
       (COND
        ((|testBitVector| |pv$| 6)
         (PROGN
          (QSETREFV $ 246
                    (CONS (|dispatchFunction| |COMPCAT-;argument;SR;62|) $))))
        ((|testBitVector| |pv$| 3)
         (QSETREFV $ 246
                   (CONS (|dispatchFunction| |COMPCAT-;argument;SR;63|) $)))
        ('T
         (QSETREFV $ 246
                   (CONS (|dispatchFunction| |COMPCAT-;argument;SR;64|) $))))
       (QSETREFV $ 249 (CONS (|dispatchFunction| |COMPCAT-;pi;S;65|) $))
       (COND
        ((|domainEqual| |#2| (|DoubleFloat|))
         (PROGN
          (QSETREFV $ 250 (CONS (|dispatchFunction| |COMPCAT-;exp;2S;66|) $))
          (QSETREFV $ 251 (CONS (|dispatchFunction| |COMPCAT-;log;2S;67|) $))
          (QSETREFV $ 252 (CONS (|dispatchFunction| |COMPCAT-;sin;2S;68|) $))
          (QSETREFV $ 253 (CONS (|dispatchFunction| |COMPCAT-;cos;2S;69|) $))
          (QSETREFV $ 254 (CONS (|dispatchFunction| |COMPCAT-;tan;2S;70|) $))
          (QSETREFV $ 255 (CONS (|dispatchFunction| |COMPCAT-;asin;2S;71|) $))
          (QSETREFV $ 256 (CONS (|dispatchFunction| |COMPCAT-;acos;2S;72|) $))
          (QSETREFV $ 257 (CONS (|dispatchFunction| |COMPCAT-;atan;2S;73|) $))
          (QSETREFV $ 258 (CONS (|dispatchFunction| |COMPCAT-;sinh;2S;74|) $))
          (QSETREFV $ 259 (CONS (|dispatchFunction| |COMPCAT-;cosh;2S;75|) $))
          (QSETREFV $ 260 (CONS (|dispatchFunction| |COMPCAT-;tanh;2S;76|) $))
          (QSETREFV $ 261 (CONS (|dispatchFunction| |COMPCAT-;asinh;2S;77|) $))
          (QSETREFV $ 262 (CONS (|dispatchFunction| |COMPCAT-;acosh;2S;78|) $))
          (QSETREFV $ 263
                    (CONS (|dispatchFunction| |COMPCAT-;atanh;2S;79|) $))))
        ('T
         (PROGN
          (QSETREFV $ 257 (CONS (|dispatchFunction| |COMPCAT-;atan;2S;80|) $))
          (QSETREFV $ 251 (CONS (|dispatchFunction| |COMPCAT-;log;2S;81|) $))
          (QSETREFV $ 250 (CONS (|dispatchFunction| |COMPCAT-;exp;2S;82|) $))
          (QSETREFV $ 253 (CONS (|dispatchFunction| |COMPCAT-;cos;2S;83|) $))
          (QSETREFV $ 252 (CONS (|dispatchFunction| |COMPCAT-;sin;2S;84|) $))
          (QSETREFV $ 255 (CONS (|dispatchFunction| |COMPCAT-;asin;2S;85|) $))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 256
                      (CONS (|dispatchFunction| |COMPCAT-;acos;2S;86|) $)))
           ('T
            (QSETREFV $ 256
                      (CONS (|dispatchFunction| |COMPCAT-;acos;2S;87|) $)))))))
       (COND
        ((|testBitVector| |pv$| 6)
         (PROGN
          (QSETREFV $ 277
                    (CONS
                     (|dispatchFunction| |COMPCAT-;polarCoordinates;SR;88|) $))
          (QSETREFV $ 283 (CONS (|dispatchFunction| |COMPCAT-;^;SFS;89|) $))))
        ((|testBitVector| |pv$| 3)
         (QSETREFV $ 283
                   (CONS (|dispatchFunction| |COMPCAT-;^;SFS;90|) $)))))))
    (COND
     ((|domainEqual| |#2| (|Float|))
      (COND
       ((|HasSignature| |#2|
                        (LIST '<
                              (LIST '(|Boolean|) (|devaluate| |#2|)
                                    (|devaluate| |#2|))))
        (QSETREFV $ 288 (CONS (|dispatchFunction| |COMPCAT-;^;3S;91|) $)))))
     ((|domainEqual| |#2| (|DoubleFloat|))
      (COND
       ((|HasSignature| |#2|
                        (LIST '<
                              (LIST '(|Boolean|) (|devaluate| |#2|)
                                    (|devaluate| |#2|))))
        (QSETREFV $ 288 (CONS (|dispatchFunction| |COMPCAT-;^;3S;92|) $))))))
    $))) 

(MAKEPROP '|ComplexCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (8 . |monomial|)
              (|PositiveInteger|) (14 . ^) (20 . |trace|) (25 . ^) (31 . *)
              (37 . -) (43 . |norm|) (48 . |Zero|) (52 . |Zero|) (56 . +)
              |COMPCAT-;characteristicPolynomial;SSup;1| (62 . |real|)
              (|Integer|) (67 . |coerce|) (72 . -) (|Boolean|) (78 . |prime?|)
              (83 . |complex|) (|Union| 32 '"failed") (|List| 33)
              (|SparseUnivariatePolynomial| 6)
              (|ComplexIntegerSolveLinearPolynomialEquation| 7 6)
              (89 . |solveLinearPolynomialEquation|) (|Union| 37 '"failed")
              (|List| 38) (|SparseUnivariatePolynomial| $)
              (95 . |solveLinearPolynomialEquation|) (101 . |retract|)
              (106 . |conjugate|) (|Mapping| 6 6) (111 . |map|) (117 . *)
              (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 33 7 11)
              (123 . |map|) (|Factored| $) (129 . |squareFree|) (|Factored| 38)
              (134 . |factorSquareFreePolynomial|) (|Factored| 33)
              (|Mapping| 52 33) (|FactoredFunctionUtilities| 33)
              (139 . |refine|) (145 . |factorPolynomial|)
              (150 . |differentiate|) (155 . |gcd|) (161 . |degree|) (166 . >)
              (172 . +) (178 . |monomial|) (184 . -) (190 . |elt|)
              (196 . |factorSquareFreePolynomial|) (|Factored| 11)
              (201 . |numberOfFactors|) (206 . |One|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 69) (|:| |fctr| 33) (|:| |xpnt| 25))
              (|List| 70) (210 . |makeFR|)
              (|Record| (|:| |flg| 69) (|:| |fctr| 11) (|:| |xpnt| 25))
              (|List| 73) (216 . |factorList|) (221 . |coerce|) (|Mapping| 6 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 11 6 33)
              (226 . |map|) (232 . |zero?|) (237 . +) (243 . |gcd|)
              (|Union| $ '"failed") (249 . |exquo|)
              (255 . |factorSquareFreePolynomial|) (260 . |convert|)
              (265 . |imag|) (|Complex| 25) (270 . |complex|) (|Factored| 88)
              (|GaussianFactorizationPackage|) (276 . |factor|) (281 . |real|)
              (286 . |imag|) (|Factored| 6) (|Mapping| 6 88)
              (|FactoredFunctions2| 88 6) (291 . |map|) (297 . |factor|)
              (302 . |factor|) (307 . |squareFree|) (312 . |prime?|)
              (317 . |prime?|) |COMPCAT-;rank;Pi;10| (322 . -)
              |COMPCAT-;discriminant;R;11| (327 . ^) |COMPCAT-;norm;SR;12|
              (333 . *) |COMPCAT-;trace;SR;13| |COMPCAT-;imaginary;S;14|
              |COMPCAT-;conjugate;2S;15| (339 . |characteristic|)
              |COMPCAT-;characteristic;Nni;16| (|Mapping| 7 7)
              |COMPCAT-;map;M2S;17| (343 . =) |COMPCAT-;=;2SB;18|
              |COMPCAT-;+;3S;19| |COMPCAT-;-;2S;20| (349 . *)
              |COMPCAT-;*;R2S;21| (|Vector| 7) |COMPCAT-;coordinates;SV;22|
              (355 . *) |COMPCAT-;*;I2S;23| |COMPCAT-;differentiate;SMS;24|
              |COMPCAT-;definingPolynomial;Sup;25| (361 . |definingPolynomial|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (365 . |monicDivide|) (371 . |coefficient|)
              |COMPCAT-;reduce;SupS;26| |COMPCAT-;lift;SSup;27|
              |COMPCAT-;minimalPolynomial;SSup;28| (|Vector| 6)
              (377 . |minIndex|) (382 . |elt|) (388 . ~=) (394 . |recip|)
              (|Vector| $) |COMPCAT-;coordinates;SVV;29| (|OutputForm|)
              (399 . |coerce|) (|Symbol|) (404 . |coerce|) (409 . -) (414 . *)
              (420 . +) |COMPCAT-;coerce;SOf;30| |COMPCAT-;retract;SR;31|
              (|Union| 7 '"failed") |COMPCAT-;retractIfCan;SU;32|
              |COMPCAT-;*;3S;33| (|Matrix| 7) (|Matrix| 6)
              (|MatrixCategoryFunctions2| 6 136 136 156 7 123 123 155)
              (426 . |map|) (432 . |vertConcat|) (|Matrix| $)
              |COMPCAT-;reducedSystem;MM;34| (438 . |coerce|)
              (443 . |reducedSystem|) (448 . |column|)
              (|Record| (|:| |mat| 155) (|:| |vec| 123))
              |COMPCAT-;reducedSystem;MVR;35| (454 . |sqrt|) (459 . |abs|)
              (|DoubleFloat|) (464 . |convert|) (|Complex| 169)
              (469 . |complex|) (475 . |convert|) (|Float|) (480 . |convert|)
              (|Complex| 174) (485 . |complex|) (491 . |convert|) (|InputForm|)
              (496 . |convert|) (501 . |convert|) (|List| $) (506 . |convert|)
              (511 . |convert|) (|Pattern| 25) (|ComplexPattern| 25 7 6)
              (516 . |convert|) (521 . |convert|) (|Pattern| 174)
              (|ComplexPattern| 174 7 6) (526 . |convert|) (531 . |convert|)
              (|PatternMatchResult| 25 6) (|ComplexPatternMatch| 25 7 6)
              (536 . |patternMatch|) (|PatternMatchResult| 25 $)
              (543 . |patternMatch|) (|PatternMatchResult| 174 6)
              (|ComplexPatternMatch| 174 7 6) (550 . |patternMatch|)
              (|PatternMatchResult| 174 $) (557 . |patternMatch|)
              (564 . |smaller?|) (570 . |smaller?|) (576 . |rational?|)
              (|Fraction| 25) (581 . |rational|) (586 . |rational|)
              (|Union| 206 '"failed") (591 . |rationalIfCan|) (596 . |inv|)
              (601 . /) (607 . |inv|) (612 . |exquo|) (618 . |exquo|)
              (624 . |exquo|) (630 . *) (636 . |exquo|) (642 . |exquo|)
              (648 . |recip|) (653 . |zero?|) (658 . |recip|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (663 . |unitNormal|) (668 . *) (674 . <) (680 . |imaginary|)
              (684 . -) (689 . |unitNormal|) (694 . |euclideanSize|)
              (699 . |euclideanSize|) (704 . |symmetricRemainder|)
              (710 . |divide|) (716 . |rem|) (722 . |quo|) (728 . |quo|)
              (734 . |rem|) (740 . ~=) (746 . |sizeLess?|) (752 . -)
              (758 . |divide|) '|half| (764 . |pi|) (768 . >=) (774 . |atan|)
              (779 . |argument|) (784 . |log|) (789 . |exp|) (794 . |pi|)
              (798 . |exp|) (803 . |log|) (808 . |sin|) (813 . |cos|)
              (818 . |tan|) (823 . |asin|) (828 . |acos|) (833 . |atan|)
              (838 . |sinh|) (843 . |cosh|) (848 . |tanh|) (853 . |asinh|)
              (858 . |acosh|) (863 . |atanh|) (868 . *) (874 . +) (880 . |log|)
              (885 . |argument|) (890 . |cos|) (895 . |sin|) (900 . |exp|)
              (905 . |asinh|) (910 . ^) (916 . |sqrt|) (921 . |asin|)
              (926 . |negative?|) (|Record| (|:| |r| 7) (|:| |phi| 7))
              (931 . |polarCoordinates|) (936 . |zero?|) (941 . |positive?|)
              (946 . ^) (952 . |denom|) (957 . |coerce|) (962 . ^)
              (968 . |numer|) (973 . |coerce|) (978 . /) (984 . =) (990 . ^)
              (|List| 145) (|List| 10) (|Fraction| 11)
              (|Record| (|:| |mat| 293) (|:| |vec| (|Vector| 25)))
              (|Matrix| 25) (|Union| 25 '"failed"))
           '#(|unitNormal| 996 |trace| 1001 |tanh| 1006 |tan| 1011 |squareFree|
              1016 |solveLinearPolynomialEquation| 1021 |smaller?| 1027 |sinh|
              1033 |sin| 1038 |retractIfCan| 1043 |retract| 1048 |rem| 1053
              |reducedSystem| 1059 |reduce| 1070 |recip| 1075 |rationalIfCan|
              1080 |rational?| 1085 |rational| 1090 |rank| 1095 |quo| 1099
              |prime?| 1105 |polarCoordinates| 1110 |pi| 1115 |patternMatch|
              1119 |norm| 1133 |minimalPolynomial| 1138 |map| 1143 |log| 1149
              |lift| 1154 |inv| 1159 |imaginary| 1164
              |factorSquareFreePolynomial| 1168 |factorPolynomial| 1173
              |factor| 1178 |exquo| 1183 |exp| 1195 |euclideanSize| 1200
              |divide| 1205 |discriminant| 1211 |differentiate| 1215
              |definingPolynomial| 1221 |cosh| 1225 |cos| 1230 |coordinates|
              1235 |convert| 1246 |conjugate| 1271 |coerce| 1276
              |characteristicPolynomial| 1281 |characteristic| 1286 |atanh|
              1290 |atan| 1295 |asinh| 1300 |asin| 1305 |argument| 1310 |acosh|
              1315 |acos| 1320 |abs| 1325 ^ 1330 = 1342 - 1348 + 1353 * 1359)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 288
                                                 '(0 6 0 8 0 7 0 9 2 11 0 7 10
                                                   12 2 11 0 0 13 14 1 6 7 0 15
                                                   2 11 0 0 10 16 2 11 0 7 0 17
                                                   2 11 0 0 0 18 1 6 7 0 19 0 6
                                                   0 20 0 7 0 21 2 11 0 0 0 22
                                                   1 6 7 0 24 1 7 0 25 26 2 7 0
                                                   0 0 27 1 7 28 0 29 2 6 0 7 7
                                                   30 2 34 31 32 33 35 2 0 36
                                                   37 38 39 1 6 7 0 40 1 6 0 0
                                                   41 2 33 0 42 0 43 2 33 0 0 0
                                                   44 2 46 11 45 33 47 1 33 48
                                                   0 49 1 6 50 38 51 2 54 52 52
                                                   53 55 1 0 50 38 56 1 11 0 0
                                                   57 2 11 0 0 0 58 1 11 10 0
                                                   59 2 25 28 0 0 60 2 7 0 0 0
                                                   61 2 33 0 6 10 62 2 33 0 0 0
                                                   63 2 33 0 0 0 64 1 7 50 38
                                                   65 1 66 10 0 67 0 33 0 68 2
                                                   52 0 33 71 72 1 66 74 0 75 1
                                                   6 0 7 76 2 78 33 77 11 79 1
                                                   7 28 0 80 2 33 0 0 0 81 2 33
                                                   0 0 0 82 2 33 83 0 0 84 1 0
                                                   50 38 85 1 7 25 0 86 1 6 7 0
                                                   87 2 88 0 25 25 89 1 91 90
                                                   88 92 1 88 25 0 93 1 88 25 0
                                                   94 2 97 95 96 90 98 1 0 48 0
                                                   99 1 6 48 0 100 1 0 48 0 101
                                                   1 91 28 88 102 1 0 28 0 103
                                                   1 7 0 0 105 2 7 0 0 13 107 2
                                                   7 0 13 0 109 0 7 10 113 2 7
                                                   28 0 0 117 2 7 0 0 0 121 2 7
                                                   0 25 0 125 0 6 11 129 2 11
                                                   130 0 0 131 2 11 7 0 10 132
                                                   1 136 25 0 137 2 136 6 0 25
                                                   138 2 25 28 0 0 139 1 7 83 0
                                                   140 1 7 143 0 144 1 145 143
                                                   0 146 1 143 0 0 147 2 143 0
                                                   0 0 148 2 143 0 0 0 149 2
                                                   157 155 45 156 158 2 155 0 0
                                                   0 159 1 156 0 136 162 1 6
                                                   155 160 163 2 155 123 0 25
                                                   164 1 7 0 0 167 1 0 0 0 168
                                                   1 7 169 0 170 2 171 0 169
                                                   169 172 1 0 171 0 173 1 7
                                                   174 0 175 2 176 0 174 174
                                                   177 1 0 176 0 178 1 179 0
                                                   145 180 1 7 179 0 181 1 179
                                                   0 182 183 1 0 179 0 184 1
                                                   186 185 6 187 1 0 185 0 188
                                                   1 190 189 6 191 1 0 189 0
                                                   192 3 194 193 6 185 193 195
                                                   3 0 196 0 185 196 197 3 199
                                                   198 6 189 198 200 3 0 201 0
                                                   189 201 202 2 7 28 0 0 203 2
                                                   0 28 0 0 204 1 0 28 0 205 1
                                                   7 206 0 207 1 0 206 0 208 1
                                                   0 209 0 210 1 7 0 0 211 2 7
                                                   0 0 0 212 1 0 0 0 213 2 7 83
                                                   0 0 214 2 0 83 0 7 215 2 6
                                                   83 0 7 216 2 6 0 0 0 217 2 0
                                                   83 0 0 218 2 6 83 0 0 219 1
                                                   0 83 0 220 1 6 28 0 221 1 6
                                                   83 0 222 1 7 223 0 224 2 6 0
                                                   7 0 225 2 7 28 0 0 226 0 6 0
                                                   227 1 6 0 0 228 1 0 223 0
                                                   229 1 7 10 0 230 1 0 10 0
                                                   231 2 7 0 0 0 232 2 6 130 0
                                                   0 233 2 0 0 0 0 234 2 7 0 0
                                                   0 235 2 0 0 0 0 236 2 7 0 0
                                                   0 237 2 7 28 0 0 238 2 7 28
                                                   0 0 239 2 6 0 0 0 240 2 0
                                                   130 0 0 241 0 7 0 243 2 7 28
                                                   0 0 244 1 7 0 0 245 1 0 7 0
                                                   246 1 7 0 0 247 1 7 0 0 248
                                                   0 0 0 249 1 0 0 0 250 1 0 0
                                                   0 251 1 0 0 0 252 1 0 0 0
                                                   253 1 0 0 0 254 1 0 0 0 255
                                                   1 0 0 0 256 1 0 0 0 257 1 0
                                                   0 0 258 1 0 0 0 259 1 0 0 0
                                                   260 1 0 0 0 261 1 0 0 0 262
                                                   1 0 0 0 263 2 6 0 0 7 264 2
                                                   6 0 0 0 265 1 6 0 0 266 1 6
                                                   7 0 267 1 7 0 0 268 1 7 0 0
                                                   269 1 6 0 0 270 1 6 0 0 271
                                                   2 6 0 0 13 272 1 6 0 0 273 1
                                                   6 0 0 274 1 7 28 0 275 1 0
                                                   276 0 277 1 206 28 0 278 1 7
                                                   28 0 279 2 7 0 0 206 280 1
                                                   206 25 0 281 1 7 0 206 282 2
                                                   0 0 0 206 283 1 206 25 0 284
                                                   1 206 0 25 285 2 206 0 0 0
                                                   286 2 6 28 0 0 287 2 0 0 0 0
                                                   288 1 0 223 0 229 1 0 7 0
                                                   110 1 0 0 0 260 1 0 0 0 254
                                                   1 0 48 0 101 2 0 36 37 38 39
                                                   2 0 28 0 0 204 1 0 0 0 258 1
                                                   0 0 0 252 1 0 152 0 153 1 0
                                                   7 0 151 2 0 0 0 0 234 1 0
                                                   155 160 161 2 0 165 160 141
                                                   166 1 0 0 11 133 1 0 83 0
                                                   220 1 0 209 0 210 1 0 28 0
                                                   205 1 0 206 0 208 0 0 13 104
                                                   2 0 0 0 0 236 1 0 28 0 103 1
                                                   0 276 0 277 0 0 0 249 3 0
                                                   201 0 189 201 202 3 0 196 0
                                                   185 196 197 1 0 7 0 108 1 0
                                                   11 0 135 2 0 0 115 0 116 1 0
                                                   0 0 251 1 0 11 0 134 1 0 0 0
                                                   213 0 0 0 111 1 0 50 38 85 1
                                                   0 50 38 56 1 0 48 0 99 2 0
                                                   83 0 0 218 2 0 83 0 7 215 1
                                                   0 0 0 250 1 0 10 0 231 2 0
                                                   130 0 0 241 0 0 7 106 2 0 0
                                                   0 115 127 0 0 11 128 1 0 0 0
                                                   259 1 0 0 0 253 1 0 123 0
                                                   124 2 0 123 0 141 142 1 0
                                                   179 0 184 1 0 171 0 173 1 0
                                                   176 0 178 1 0 185 0 188 1 0
                                                   189 0 192 1 0 0 0 112 1 0
                                                   143 0 150 1 0 11 0 23 0 0 10
                                                   114 1 0 0 0 263 1 0 0 0 257
                                                   1 0 0 0 261 1 0 0 0 255 1 0
                                                   7 0 246 1 0 0 0 262 1 0 0 0
                                                   256 1 0 0 0 168 2 0 0 0 0
                                                   288 2 0 0 0 206 283 2 0 28 0
                                                   0 118 1 0 0 0 120 2 0 0 0 0
                                                   119 2 0 0 7 0 122 2 0 0 25 0
                                                   126 2 0 0 0 0 154)))))
           '|lookupComplete|)) 
