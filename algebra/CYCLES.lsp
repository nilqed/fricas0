
(SDEFUN |CYCLES;trm|
        ((|pt| |Partition|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |pt| (QREFELT $ 8)) (QREFELT $ 10))
                   (QREFELT $ 11))
         |pt| (QREFELT $ 13))) 

(SDEFUN |CYCLES;list|
        ((|st| |Stream| (|List| (|Integer|))) ($ |List| (|List| (|Integer|))))
        (SPADCALL (SPADCALL |st| (QREFELT $ 15)) (QREFELT $ 17))) 

(SDEFUN |CYCLES;complete;ISp;3|
        ((|i| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G392 NIL)
          (#2=#:G391 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G393 #3#) (#5=#:G395 NIL) (|pt| NIL))
         (SEQ
          (COND ((EQL |i| 0) (|spadConstant| $ 19))
                ((< |i| 0) (|spadConstant| $ 18))
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |pt| NIL)
                       (LETT #5#
                             (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $))
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |pt| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (|CYCLES;trm| (SPADCALL |pt| (QREFELT $ 23))
                                 $))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;even?| ((|li| |List| (|Integer|)) ($ |Boolean|))
        (SPROG ((#1=#:G400 NIL) (|i| NIL) (#2=#:G399 NIL))
               (SEQ
                (EVENP
                 (LENGTH
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |i| NIL) (LETT #1# |li|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT (COND ((EVENP |i|) (LETT #2# (CONS |i| #2#))))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |CYCLES;alternating;ISp;5|
        ((|i| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G402 NIL)
          (#2=#:G401 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G403 #3#) (#5=#:G405 NIL) (|li| NIL))
         (SEQ
          (SPADCALL 2
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |li| NIL)
                          (LETT #5#
                                (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21))
                                 $))
                          G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |li| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((|CYCLES;even?| |li| $)
                              (PROGN
                               (LETT #4#
                                     (|CYCLES;trm|
                                      (SPADCALL |li| (QREFELT $ 23)) $))
                               (COND
                                (#1#
                                 (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24))))
                                ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 18))))
                    (QREFELT $ 27))))) 

(SDEFUN |CYCLES;elementary;ISp;6|
        ((|i| |Integer|)
         ($ . #1=(|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((#2=#:G407 NIL) (#3=#:G406 #1#) (#4=#:G408 #1#)
          (|spol| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#5=#:G411 NIL) (|pt| NIL))
         (SEQ
          (COND ((EQL |i| 0) (|spadConstant| $ 19))
                ((< |i| 0) (|spadConstant| $ 18))
                (#6='T
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |pt| NIL)
                       (LETT #5#
                             (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $))
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |pt| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SEQ
                                 (LETT |spol|
                                       (|CYCLES;trm|
                                        (SPADCALL |pt| (QREFELT $ 23)) $))
                                 (EXIT
                                  (COND ((|CYCLES;even?| |pt| $) |spol|)
                                        ('T
                                         (SPADCALL |spol| (QREFELT $ 29)))))))
                          (COND
                           (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT $ 24))))
                           ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;divisors| ((|n| |Integer|) ($ |List| (|Integer|)))
        (SPROG
         ((|c| (|List| (|Integer|))) (#1=#:G414 NIL)
          (#2=#:G413 #3=(|List| (|Integer|))) (#4=#:G415 #3#) (#5=#:G422 NIL)
          (|j| NIL) (#6=#:G421 NIL) (#7=#:G420 NIL) (|a| NIL)
          (|b|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |b| (SPADCALL (SPADCALL |n| (QREFELT $ 32)) (QREFELT $ 36)))
          (LETT |c|
                (CONS 1
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |a| NIL) (LETT #7# |b|) G190
                            (COND
                             ((OR (ATOM #7#) (PROGN (LETT |a| (CAR #7#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #4#
                                     (PROGN
                                      (LETT #6# NIL)
                                      (SEQ (LETT |j| 1)
                                           (LETT #5# (QVELT |a| 2)) G190
                                           (COND
                                            ((|greater_SI| |j| #5#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #6#
                                                   (CONS
                                                    (EXPT (QVELT |a| 1) |j|)
                                                    #6#))))
                                           (LETT |j| (|inc_SI| |j|)) (GO G190)
                                           G191 (EXIT (NREVERSE #6#)))))
                               (COND
                                (#1#
                                 (LETT #2# (SPADCALL #2# #4# (QREFELT $ 38))))
                                ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                            (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                       (COND (#1# #2#) (#8='T NIL)))))
          (EXIT (COND ((EQL (LENGTH |b|) 1) |c|) (#8# (CONS |n| |c|))))))) 

(SDEFUN |CYCLES;ss|
        ((|n| |Integer|) (|m| |Integer|)
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|li| (|List| (|Integer|))) (#1=#:G427 NIL) (|j| NIL)
          (#2=#:G426 NIL))
         (SEQ
          (LETT |li|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |j| 1) (LETT #1# |m|) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS |n| #2#))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT
           (SPADCALL (|spadConstant| $ 39) (SPADCALL |li| (QREFELT $ 23))
                     (QREFELT $ 13)))))) 

(SDEFUN |CYCLES;powerSum;ISp;9|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (|CYCLES;ss| |n| 1 $)) 

(SDEFUN |CYCLES;cyclic;ISp;10|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G430 NIL)
          (#2=#:G429 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G431 #3#) (#5=#:G433 NIL) (|i| NIL))
         (SEQ
          (COND ((EQL |n| 1) (SPADCALL 1 (QREFELT $ 40)))
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |i| NIL) (LETT #5# (|CYCLES;divisors| |n| $)) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL
                                 (SPADCALL (SPADCALL |i| (QREFELT $ 42)) |n|
                                           (QREFELT $ 43))
                                 (|CYCLES;ss| |i|
                                  (SPADCALL (SPADCALL |n| |i| (QREFELT $ 43))
                                            (QREFELT $ 44))
                                  $)
                                 (QREFELT $ 45)))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;dihedral;ISp;11|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|k| (|Integer|)))
               (SEQ (LETT |k| (QUOTIENT2 |n| 2))
                    (EXIT
                     (COND
                      ((ODDP |n|)
                       (SPADCALL
                        (SPADCALL (SPADCALL 1 2 (QREFELT $ 43))
                                  (SPADCALL |n| (QREFELT $ 46)) (QREFELT $ 45))
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT $ 43))
                                   (|CYCLES;ss| 2 |k| $) (QREFELT $ 45))
                         (SPADCALL 1 (QREFELT $ 40)) (QREFELT $ 47))
                        (QREFELT $ 24)))
                      ('T
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT $ 43))
                                   (SPADCALL |n| (QREFELT $ 46))
                                   (QREFELT $ 45))
                         (SPADCALL (SPADCALL 1 4 (QREFELT $ 43))
                                   (|CYCLES;ss| 2 |k| $) (QREFELT $ 45))
                         (QREFELT $ 24))
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 4 (QREFELT $ 43))
                                   (|CYCLES;ss| 2 (- |k| 1) $) (QREFELT $ 45))
                         (|CYCLES;ss| 1 2 $) (QREFELT $ 47))
                        (QREFELT $ 24)))))))) 

(SDEFUN |CYCLES;trm2|
        ((|li| |List| (|Integer|))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|prod| #1=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (|prod2| #1#) (|r1| #2=(|Integer|)) (|r0| #3=(|Integer|))
          (#4=#:G444 NIL) (|r| NIL)
          (|c| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (|k| (|Integer|)) (|ll1| #2#) (|ll0| #3#) (#5=#:G443 NIL) (|ll| NIL)
          (|xx| (|Fraction| (|Integer|)))
          (|lli| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |lli| (SPADCALL |li| (QREFELT $ 49)))
              (LETT |xx|
                    (SPADCALL 1
                              (SPADCALL (SPADCALL |li| (QREFELT $ 23))
                                        (QREFELT $ 8))
                              (QREFELT $ 43)))
              (LETT |prod| (|spadConstant| $ 19))
              (SEQ (LETT |ll| NIL) (LETT #5# |lli|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |ll| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ll0| (|SPADfirst| |ll|))
                        (LETT |ll1| (SPADCALL |ll| (QREFELT $ 50)))
                        (LETT |k| (QUOTIENT2 |ll0| 2))
                        (LETT |c|
                              (COND
                               ((ODDP |ll0|)
                                (|CYCLES;ss| |ll0| (* |ll1| |k|) $))
                               ('T
                                (SPADCALL (|CYCLES;ss| |k| |ll1| $)
                                          (|CYCLES;ss| |ll0|
                                           (* |ll1| (- |k| 1)) $)
                                          (QREFELT $ 47)))))
                        (LETT |c|
                              (SPADCALL |c|
                                        (|CYCLES;ss| |ll0|
                                         (* |ll0|
                                            (QUOTIENT2 (* |ll1| (- |ll1| 1))
                                                       2))
                                         $)
                                        (QREFELT $ 47)))
                        (LETT |prod2| (|spadConstant| $ 19))
                        (SEQ (LETT |r| NIL) (LETT #4# |lli|) G190
                             (COND
                              ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((< (|SPADfirst| |r|) |ll0|)
                                 (SEQ (LETT |r0| (|SPADfirst| |r|))
                                      (LETT |r1| (SPADCALL |r| (QREFELT $ 50)))
                                      (EXIT
                                       (LETT |prod2|
                                             (SPADCALL
                                              (|CYCLES;ss|
                                               (SPADCALL |r0| |ll0|
                                                         (QREFELT $ 51))
                                               (* (* (GCD |r0| |ll0|) |r1|)
                                                  |ll1|)
                                               $)
                                              |prod2| (QREFELT $ 47)))))))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |prod|
                               (SPADCALL (SPADCALL |c| |prod2| (QREFELT $ 47))
                                         |prod| (QREFELT $ 47)))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |xx| |prod| (QREFELT $ 45)))))) 

(SDEFUN |CYCLES;graphs;ISp;13|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G446 NIL)
          (#2=#:G445 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G447 #3#) (#5=#:G449 NIL) (|li| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |li| NIL)
                (LETT #5# (|CYCLES;list| (SPADCALL |n| (QREFELT $ 21)) $)) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |li| (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (|CYCLES;trm2| |li| $))
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 18))))))) 

(SDEFUN |CYCLES;cupp|
        ((|pt| |Partition|)
         (|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|dg| (|Partition|)))
               (SEQ
                (COND ((SPADCALL |spol| (QREFELT $ 54)) (|spadConstant| $ 18))
                      (#1='T
                       (SEQ (LETT |dg| (SPADCALL |spol| (QREFELT $ 55)))
                            (EXIT
                             (COND
                              ((SPADCALL |dg| |pt| (QREFELT $ 56))
                               (|spadConstant| $ 18))
                              ((SPADCALL |dg| |pt| (QREFELT $ 57))
                               (SPADCALL (SPADCALL |pt| (QREFELT $ 8))
                                         (SPADCALL
                                          (SPADCALL |spol| (QREFELT $ 58)) |dg|
                                          (QREFELT $ 13))
                                         (QREFELT $ 59)))
                              (#1#
                               (|CYCLES;cupp| |pt|
                                (SPADCALL |spol| (QREFELT $ 60)) $)))))))))) 

(SDEFUN |CYCLES;cup;3Sp;15|
        ((|spol1| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         (|spol2| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|p| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
               (SEQ
                (COND ((SPADCALL |spol1| (QREFELT $ 54)) (|spadConstant| $ 18))
                      ('T
                       (SEQ
                        (LETT |p|
                              (SPADCALL (SPADCALL |spol1| (QREFELT $ 58))
                                        (|CYCLES;cupp|
                                         (SPADCALL |spol1| (QREFELT $ 55))
                                         |spol2| $)
                                        (QREFELT $ 45)))
                        (EXIT
                         (SPADCALL |p|
                                   (SPADCALL (SPADCALL |spol1| (QREFELT $ 60))
                                             |spol2| (QREFELT $ 61))
                                   (QREFELT $ 24))))))))) 

(SDEFUN |CYCLES;eval;SpF;16|
        ((|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |Fraction| (|Integer|)))
        (COND ((SPADCALL |spol| (QREFELT $ 54)) (|spadConstant| $ 62))
              ('T
               (SPADCALL (SPADCALL |spol| (QREFELT $ 58))
                         (SPADCALL (SPADCALL |spol| (QREFELT $ 60))
                                   (QREFELT $ 63))
                         (QREFELT $ 64))))) 

(SDEFUN |CYCLES;cap;2SpF;17|
        ((|spol1| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         (|spol2| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL |spol1| |spol2| (QREFELT $ 61)) (QREFELT $ 63))) 

(SDEFUN |CYCLES;mtpol|
        ((|n| |Integer|)
         (|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|deg| (|Partition|)) (#1=#:G465 NIL) (|k| NIL) (#2=#:G464 NIL))
         (SEQ
          (COND ((SPADCALL |spol| (QREFELT $ 54)) (|spadConstant| $ 18))
                ('T
                 (SEQ
                  (LETT |deg|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |k| NIL)
                               (LETT #1#
                                     (SPADCALL (SPADCALL |spol| (QREFELT $ 55))
                                               (QREFELT $ 66)))
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |k| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ (EXIT (LETT #2# (CONS (* |n| |k|) #2#))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 23)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |spol| (QREFELT $ 58)) |deg|
                              (QREFELT $ 13))
                    (|CYCLES;mtpol| |n| (SPADCALL |spol| (QREFELT $ 60)) $)
                    (QREFELT $ 24))))))))) 

(SDEFUN |CYCLES;evspol|
        ((|fn2| |Mapping| (|SymmetricPolynomial| (|Fraction| (|Integer|)))
          (|Integer|))
         (|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|prod| #1=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#2=#:G467 NIL) (#3=#:G466 #1#) (#4=#:G468 #1#) (#5=#:G473 NIL)
          (|i| NIL) (|lc| (|Fraction| (|Integer|))))
         (SEQ
          (COND ((SPADCALL |spol| (QREFELT $ 54)) (|spadConstant| $ 18))
                (#6='T
                 (SEQ (LETT |lc| (SPADCALL |spol| (QREFELT $ 58)))
                      (LETT |prod|
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |i| NIL)
                                  (LETT #5#
                                        (SPADCALL
                                         (SPADCALL |spol| (QREFELT $ 55))
                                         (QREFELT $ 66)))
                                  G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN (LETT |i| (CAR #5#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #4# (SPADCALL |i| |fn2|))
                                     (COND
                                      (#2#
                                       (LETT #3#
                                             (SPADCALL #3# #4#
                                                       (QREFELT $ 47))))
                                      ('T
                                       (PROGN
                                        (LETT #3# #4#)
                                        (LETT #2# 'T)))))))
                                  (LETT #5# (CDR #5#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#2# #3#) (#6# (|spadConstant| $ 19)))))
                      (EXIT
                       (SPADCALL (SPADCALL |lc| |prod| (QREFELT $ 45))
                                 (|CYCLES;evspol| |fn2|
                                  (SPADCALL |spol| (QREFELT $ 60)) $)
                                 (QREFELT $ 24))))))))) 

(SDEFUN |CYCLES;wreath;3Sp;20|
        ((|spol1| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         (|spol2| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG NIL
               (|CYCLES;evspol|
                (CONS #'|CYCLES;wreath;3Sp;20!0| (VECTOR $ |spol2|)) |spol1|
                $))) 

(SDEFUN |CYCLES;wreath;3Sp;20!0| ((|x| NIL) ($$ NIL))
        (PROG (|spol2| $)
          (LETT |spol2| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|CYCLES;mtpol| |x| |spol2| $))))) 

(SDEFUN |CYCLES;hh|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (COND ((EQL |n| 0) (|spadConstant| $ 19))
              ((< |n| 0) (|spadConstant| $ 18))
              ('T (SPADCALL |n| (QREFELT $ 25))))) 

(SDEFUN |CYCLES;SFunction;LSp;22|
        ((|li| |List| (|Integer|))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|a| (|Matrix| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
          (#1=#:G484 NIL) (|k| NIL) (#2=#:G485 NIL) (|j| NIL) (#3=#:G483 NIL)
          (#4=#:G482 NIL) (|i| NIL) (#5=#:G481 NIL))
         (SEQ
          (LETT |a|
                (SPADCALL
                 (PROGN
                  (LETT #5# NIL)
                  (SEQ (LETT |i| 1) (LETT #4# (LENGTH |li|)) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #5#
                               (CONS
                                (PROGN
                                 (LETT #3# NIL)
                                 (SEQ (LETT |j| 1) (LETT #2# (LENGTH |li|))
                                      (LETT |k| NIL) (LETT #1# |li|) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN (LETT |k| (CAR #1#)) NIL)
                                            (|greater_SI| |j| #2#))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (|CYCLES;hh| (+ (- |k| |j|) |i|)
                                                $)
                                               #3#))))
                                      (LETT #1#
                                            (PROG1 (CDR #1#)
                                              (LETT |j| (|inc_SI| |j|))))
                                      (GO G190) G191 (EXIT (NREVERSE #3#))))
                                #5#))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                       (EXIT (NREVERSE #5#))))
                 (QREFELT $ 70)))
          (EXIT (SPADCALL |a| (QREFELT $ 71)))))) 

(SDEFUN |CYCLES;roundup|
        ((|li1| |List| (|Integer|)) (|li2| |List| (|Integer|))
         ($ |List| (|Integer|)))
        (COND
         ((> (LENGTH |li1|) (LENGTH |li2|))
          (|CYCLES;roundup| |li1| (SPADCALL |li2| 0 (QREFELT $ 73)) $))
         ('T |li2|))) 

(SDEFUN |CYCLES;skewSFunction;2LSp;24|
        ((|li1| |List| (|Integer|)) (|li2| |List| (|Integer|))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|a| (|Matrix| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
          (#1=#:G496 NIL) (|k| NIL) (#2=#:G497 NIL) (|j| NIL) (#3=#:G495 NIL)
          (#4=#:G494 NIL) (|i| NIL) (#5=#:G493 NIL))
         (SEQ
          (COND
           ((< (LENGTH |li1|) (LENGTH |li2|))
            (|error| "skewSFunction: partition1 does not include partition2"))
           ('T
            (SEQ (LETT |li2| (|CYCLES;roundup| |li1| |li2| $))
                 (LETT |a|
                       (SPADCALL
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |i| 1) (LETT #4# (LENGTH |li1|)) G190
                              (COND ((|greater_SI| |i| #4#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #5#
                                      (CONS
                                       (PROGN
                                        (LETT #3# NIL)
                                        (SEQ (LETT |j| 1)
                                             (LETT #2# (LENGTH |li1|))
                                             (LETT |k| NIL) (LETT #1# |li1|)
                                             G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |k| (CAR #1#))
                                                    NIL)
                                                   (|greater_SI| |j| #2#))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #3#
                                                     (CONS
                                                      (|CYCLES;hh|
                                                       (+
                                                        (-
                                                         (- |k|
                                                            (SPADCALL |li2| |i|
                                                                      (QREFELT
                                                                       $ 74)))
                                                         |j|)
                                                        |i|)
                                                       $)
                                                      #3#))))
                                             (LETT #1#
                                                   (PROG1 (CDR #1#)
                                                     (LETT |j|
                                                           (|inc_SI| |j|))))
                                             (GO G190) G191
                                             (EXIT (NREVERSE #3#))))
                                       #5#))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT (NREVERSE #5#))))
                        (QREFELT $ 70)))
                 (EXIT (SPADCALL |a| (QREFELT $ 71))))))))) 

(DECLAIM (NOTINLINE |CycleIndicators;|)) 

(DEFUN |CycleIndicators| ()
  (SPROG NIL
         (PROG (#1=#:G499)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CycleIndicators|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CycleIndicators|
                             (LIST (CONS NIL (CONS 1 (|CycleIndicators;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CycleIndicators|)))))))))) 

(DEFUN |CycleIndicators;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CycleIndicators|))
          (LETT $ (GETREFV 76))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CycleIndicators| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| (|SymmetricPolynomial| (|Fraction| (|Integer|)))
                           '(|CommutativeRing|))
            (PROGN
             (QSETREFV $ 72
                       (CONS (|dispatchFunction| |CYCLES;SFunction;LSp;22|) $))
             NIL
             (QSETREFV $ 75
                       (CONS
                        (|dispatchFunction| |CYCLES;skewSFunction;2LSp;24|)
                        $)))))
          $))) 

(MAKEPROP '|CycleIndicators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Partition|) (0 . |pdct|)
              (|Fraction| 6) (5 . |coerce|) (10 . |inv|)
              (|SymmetricPolynomial| 9) (15 . |monomial|) (|Stream| 22)
              (21 . |complete|) (|List| 22) (26 . |entries|) (31 . |Zero|)
              (35 . |One|) (|PartitionsAndPermutations|) (39 . |partitions|)
              (|List| 6) (44 . |partition|) (49 . +) |CYCLES;complete;ISp;3|
              (|PositiveInteger|) (55 . *) |CYCLES;alternating;ISp;5| (61 . -)
              |CYCLES;elementary;ISp;6| (|Factored| 6) (66 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 33) (|:| |factor| 6)
                        (|:| |exponent| (|NonNegativeInteger|)))
              (|List| 34) (71 . |factorList|) (76 . |One|) (80 . |append|)
              (86 . |One|) |CYCLES;powerSum;ISp;9|
              (|IntegerNumberTheoryFunctions|) (90 . |eulerPhi|) (95 . /)
              (101 . |numer|) (106 . *) |CYCLES;cyclic;ISp;10| (112 . *)
              |CYCLES;dihedral;ISp;11| (118 . |powers|) (123 . |second|)
              (128 . |lcm|) |CYCLES;graphs;ISp;13| (|Boolean|) (134 . |zero?|)
              (139 . |degree|) (144 . <) (150 . =) (156 . |leadingCoefficient|)
              (161 . *) (167 . |reductum|) |CYCLES;cup;3Sp;15| (172 . |Zero|)
              |CYCLES;eval;SpF;16| (176 . +) |CYCLES;cap;2SpF;17|
              (182 . |coerce|) |CYCLES;wreath;3Sp;20| (|List| (|List| 12))
              (|Matrix| 12) (187 . |matrix|) (192 . |determinant|)
              (197 . |SFunction|) (202 . |concat|) (208 . |elt|)
              (214 . |skewSFunction|))
           '#(|wreath| 220 |skewSFunction| 226 |powerSum| 232 |graphs| 237
              |eval| 242 |elementary| 247 |dihedral| 252 |cyclic| 257 |cup| 262
              |complete| 268 |cap| 273 |alternating| 279 |SFunction| 284)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|complete|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|powerSum|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|elementary|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|alternating|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|cyclic|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|dihedral|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|graphs|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|cap|
                                 ((|Fraction| (|Integer|))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))))
                                T)
                              '((|cup|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))))
                                T)
                              '((|eval|
                                 ((|Fraction| (|Integer|))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))))
                                T)
                              '((|wreath|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))))
                                T)
                              '((|SFunction|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|List| (|Integer|))))
                                T)
                              '((|skewSFunction|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|List| (|Integer|)) (|List| (|Integer|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 75
                                            '(1 7 6 0 8 1 9 0 6 10 1 9 0 0 11 2
                                              12 0 9 7 13 1 14 0 0 15 1 14 16 0
                                              17 0 12 0 18 0 12 0 19 1 20 14 6
                                              21 1 7 0 22 23 2 12 0 0 0 24 2 12
                                              0 26 0 27 1 12 0 0 29 1 31 0 6 32
                                              1 31 35 0 36 0 31 0 37 2 22 0 0 0
                                              38 0 9 0 39 1 41 6 6 42 2 9 0 6 6
                                              43 1 9 6 0 44 2 12 0 9 0 45 2 12
                                              0 0 0 47 1 7 16 22 49 1 22 6 0 50
                                              2 6 0 0 0 51 1 12 53 0 54 1 12 7
                                              0 55 2 7 53 0 0 56 2 7 53 0 0 57
                                              1 12 9 0 58 2 12 0 6 0 59 1 12 0
                                              0 60 0 9 0 62 2 9 0 0 0 64 1 7 22
                                              0 66 1 69 0 68 70 1 69 12 0 71 1
                                              0 12 22 72 2 22 0 0 6 73 2 22 6 0
                                              6 74 2 0 12 22 22 75 2 0 12 12 12
                                              67 2 0 12 22 22 75 1 0 12 6 40 1
                                              0 12 6 52 1 0 9 12 63 1 0 12 6 30
                                              1 0 12 6 48 1 0 12 6 46 2 0 12 12
                                              12 61 1 0 12 6 25 2 0 9 12 12 65
                                              1 0 12 6 28 1 0 12 22 72)))))
           '|lookupComplete|)) 

(MAKEPROP '|CycleIndicators| 'NILADIC T) 
