
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
         ((#1=#:G716 NIL)
          (#2=#:G715 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G717 #3#) (#5=#:G719 NIL) (|pt| NIL))
         (SEQ
          (COND ((EQL |i| 0) (|spadConstant| $ 19))
                ((< |i| 0) (|spadConstant| $ 18))
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|CYCLES;complete;ISp;3|))
                  (SEQ (LETT |pt| NIL . #7#)
                       (LETT #5#
                             (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $)
                             . #7#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |pt| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (|CYCLES;trm| (SPADCALL |pt| (QREFELT $ 23)) $)
                                . #7#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24)) . #7#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #7#)
                             (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;even?| ((|li| |List| (|Integer|)) ($ |Boolean|))
        (SPROG ((#1=#:G728 NIL) (|i| NIL) (#2=#:G727 NIL))
               (SEQ
                (SPADCALL
                 (LENGTH
                  (PROGN
                   (LETT #2# NIL . #3=(|CYCLES;even?|))
                   (SEQ (LETT |i| NIL . #3#) (LETT #1# |li| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |i| (QREFELT $ 27))
                            (LETT #2# (CONS |i| #2#) . #3#)))))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))
                 (QREFELT $ 27))))) 

(SDEFUN |CYCLES;alternating;ISp;5|
        ((|i| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G732 NIL)
          (#2=#:G731 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G733 #3#) (#5=#:G735 NIL) (|li| NIL))
         (SEQ
          (SPADCALL 2
                    (PROGN
                     (LETT #1# NIL . #6=(|CYCLES;alternating;ISp;5|))
                     (SEQ (LETT |li| NIL . #6#)
                          (LETT #5#
                                (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $)
                                . #6#)
                          G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |li| (CAR #5#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((|CYCLES;even?| |li| $)
                              (PROGN
                               (LETT #4#
                                     (|CYCLES;trm|
                                      (SPADCALL |li| (QREFELT $ 23)) $)
                                     . #6#)
                               (COND
                                (#1#
                                 (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24))
                                       . #6#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #6#)
                                  (LETT #1# 'T . #6#)))))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 18))))
                    (QREFELT $ 29))))) 

(SDEFUN |CYCLES;elementary;ISp;6|
        ((|i| |Integer|)
         ($ . #1=(|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((#2=#:G737 NIL) (#3=#:G736 #1#) (#4=#:G738 #1#)
          (|spol| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#5=#:G741 NIL) (|pt| NIL))
         (SEQ
          (COND ((EQL |i| 0) (|spadConstant| $ 19))
                ((< |i| 0) (|spadConstant| $ 18))
                (#6='T
                 (PROGN
                  (LETT #2# NIL . #7=(|CYCLES;elementary;ISp;6|))
                  (SEQ (LETT |pt| NIL . #7#)
                       (LETT #5#
                             (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $)
                             . #7#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |pt| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SEQ
                                 (LETT |spol|
                                       (|CYCLES;trm|
                                        (SPADCALL |pt| (QREFELT $ 23)) $)
                                       . #7#)
                                 (EXIT
                                  (COND ((|CYCLES;even?| |pt| $) |spol|)
                                        ('T
                                         (SPADCALL |spol| (QREFELT $ 31))))))
                                . #7#)
                          (COND
                           (#2#
                            (LETT #3# (SPADCALL #3# #4# (QREFELT $ 24)) . #7#))
                           ('T
                            (PROGN
                             (LETT #3# #4# . #7#)
                             (LETT #2# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;divisors| ((|n| |Integer|) ($ |List| (|Integer|)))
        (SPROG
         ((|c| (|List| (|Integer|))) (#1=#:G753 NIL)
          (#2=#:G752 #3=(|List| (|Integer|))) (#4=#:G754 #3#) (#5=#:G763 NIL)
          (|j| NIL) (#6=#:G762 NIL) (#7=#:G761 NIL) (|a| NIL)
          (|b|
           (|List|
            (|Record| (|:| |factor| (|Integer|))
                      (|:| |exponent| (|Integer|))))))
         (SEQ
          (LETT |b| (SPADCALL (SPADCALL |n| (QREFELT $ 34)) (QREFELT $ 37))
                . #8=(|CYCLES;divisors|))
          (LETT |c|
                (CONS 1
                      (PROGN
                       (LETT #1# NIL . #8#)
                       (SEQ (LETT |a| NIL . #8#) (LETT #7# |b| . #8#) G190
                            (COND
                             ((OR (ATOM #7#)
                                  (PROGN (LETT |a| (CAR #7#) . #8#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #4#
                                     (PROGN
                                      (LETT #6# NIL . #8#)
                                      (SEQ (LETT |j| 1 . #8#)
                                           (LETT #5# (QCDR |a|) . #8#) G190
                                           (COND
                                            ((|greater_SI| |j| #5#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #6#
                                                   (CONS (EXPT (QCAR |a|) |j|)
                                                         #6#)
                                                   . #8#)))
                                           (LETT |j| (|inc_SI| |j|) . #8#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #6#))))
                                     . #8#)
                               (COND
                                (#1#
                                 (LETT #2# (SPADCALL #2# #4# (QREFELT $ 39))
                                       . #8#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #8#)
                                  (LETT #1# 'T . #8#)))))))
                            (LETT #7# (CDR #7#) . #8#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#1# #2#) (#9='T NIL))))
                . #8#)
          (EXIT (COND ((EQL (LENGTH |b|) 1) |c|) (#9# (CONS |n| |c|))))))) 

(SDEFUN |CYCLES;ss|
        ((|n| |Integer|) (|m| |Integer|)
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|li| (|List| (|Integer|))) (#1=#:G768 NIL) (|j| NIL)
          (#2=#:G767 NIL))
         (SEQ
          (LETT |li|
                (PROGN
                 (LETT #2# NIL . #3=(|CYCLES;ss|))
                 (SEQ (LETT |j| 1 . #3#) (LETT #1# |m| . #3#) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS |n| #2#) . #3#)))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (SPADCALL (|spadConstant| $ 40) (SPADCALL |li| (QREFELT $ 23))
                     (QREFELT $ 13)))))) 

(SDEFUN |CYCLES;powerSum;ISp;9|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (|CYCLES;ss| |n| 1 $)) 

(SDEFUN |CYCLES;cyclic;ISp;10|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G771 NIL)
          (#2=#:G770 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G772 #3#) (#5=#:G774 NIL) (|i| NIL))
         (SEQ
          (COND ((EQL |n| 1) (SPADCALL 1 (QREFELT $ 41)))
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|CYCLES;cyclic;ISp;10|))
                  (SEQ (LETT |i| NIL . #7#)
                       (LETT #5# (|CYCLES;divisors| |n| $) . #7#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL
                                 (SPADCALL (SPADCALL |i| (QREFELT $ 43)) |n|
                                           (QREFELT $ 44))
                                 (|CYCLES;ss| |i|
                                  (SPADCALL (SPADCALL |n| |i| (QREFELT $ 44))
                                            (QREFELT $ 45))
                                  $)
                                 (QREFELT $ 46))
                                . #7#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24)) . #7#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #7#)
                             (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;dihedral;ISp;11|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|k| (|Integer|)))
               (SEQ (LETT |k| (QUOTIENT2 |n| 2) |CYCLES;dihedral;ISp;11|)
                    (EXIT
                     (COND
                      ((ODDP |n|)
                       (SPADCALL
                        (SPADCALL (SPADCALL 1 2 (QREFELT $ 44))
                                  (SPADCALL |n| (QREFELT $ 47)) (QREFELT $ 46))
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT $ 44))
                                   (|CYCLES;ss| 2 |k| $) (QREFELT $ 46))
                         (SPADCALL 1 (QREFELT $ 41)) (QREFELT $ 48))
                        (QREFELT $ 24)))
                      ('T
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT $ 44))
                                   (SPADCALL |n| (QREFELT $ 47))
                                   (QREFELT $ 46))
                         (SPADCALL (SPADCALL 1 4 (QREFELT $ 44))
                                   (|CYCLES;ss| 2 |k| $) (QREFELT $ 46))
                         (QREFELT $ 24))
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 4 (QREFELT $ 44))
                                   (|CYCLES;ss| 2 (- |k| 1) $) (QREFELT $ 46))
                         (|CYCLES;ss| 1 2 $) (QREFELT $ 48))
                        (QREFELT $ 24)))))))) 

(SDEFUN |CYCLES;trm2|
        ((|li| |List| (|Integer|))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|prod| #1=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (|prod2| #1#) (|r1| #2=(|Integer|)) (|r0| #3=(|Integer|))
          (#4=#:G787 NIL) (|r| NIL)
          (|c| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (|k| (|Integer|)) (|ll1| #2#) (|ll0| #3#) (#5=#:G786 NIL) (|ll| NIL)
          (|xx| (|Fraction| (|Integer|)))
          (|lli| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |lli| (SPADCALL |li| (QREFELT $ 50)) . #6=(|CYCLES;trm2|))
              (LETT |xx|
                    (SPADCALL 1
                              (SPADCALL (SPADCALL |li| (QREFELT $ 23))
                                        (QREFELT $ 8))
                              (QREFELT $ 44))
                    . #6#)
              (LETT |prod| (|spadConstant| $ 19) . #6#)
              (SEQ (LETT |ll| NIL . #6#) (LETT #5# |lli| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |ll| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ll0| (|SPADfirst| |ll|) . #6#)
                        (LETT |ll1| (SPADCALL |ll| (QREFELT $ 51)) . #6#)
                        (LETT |k| (QUOTIENT2 |ll0| 2) . #6#)
                        (LETT |c|
                              (COND
                               ((ODDP |ll0|)
                                (|CYCLES;ss| |ll0| (* |ll1| |k|) $))
                               ('T
                                (SPADCALL (|CYCLES;ss| |k| |ll1| $)
                                          (|CYCLES;ss| |ll0|
                                           (* |ll1| (- |k| 1)) $)
                                          (QREFELT $ 48))))
                              . #6#)
                        (LETT |c|
                              (SPADCALL |c|
                                        (|CYCLES;ss| |ll0|
                                         (* |ll0|
                                            (QUOTIENT2 (* |ll1| (- |ll1| 1))
                                                       2))
                                         $)
                                        (QREFELT $ 48))
                              . #6#)
                        (LETT |prod2| (|spadConstant| $ 19) . #6#)
                        (SEQ (LETT |r| NIL . #6#) (LETT #4# |lli| . #6#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |r| (CAR #4#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((< (|SPADfirst| |r|) |ll0|)
                                 (SEQ (LETT |r0| (|SPADfirst| |r|) . #6#)
                                      (LETT |r1| (SPADCALL |r| (QREFELT $ 51))
                                            . #6#)
                                      (EXIT
                                       (LETT |prod2|
                                             (SPADCALL
                                              (|CYCLES;ss|
                                               (SPADCALL |r0| |ll0|
                                                         (QREFELT $ 52))
                                               (* (* (GCD |r0| |ll0|) |r1|)
                                                  |ll1|)
                                               $)
                                              |prod2| (QREFELT $ 48))
                                             . #6#)))))))
                             (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |prod|
                               (SPADCALL (SPADCALL |c| |prod2| (QREFELT $ 48))
                                         |prod| (QREFELT $ 48))
                               . #6#)))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |xx| |prod| (QREFELT $ 46)))))) 

(SDEFUN |CYCLES;graphs;ISp;13|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G789 NIL)
          (#2=#:G788 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G790 #3#) (#5=#:G792 NIL) (|li| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|CYCLES;graphs;ISp;13|))
           (SEQ (LETT |li| NIL . #6#)
                (LETT #5# (|CYCLES;list| (SPADCALL |n| (QREFELT $ 21)) $)
                      . #6#)
                G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |li| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (|CYCLES;trm2| |li| $) . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 18))))))) 

(SDEFUN |CYCLES;cupp|
        ((|pt| |Partition|)
         (|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|dg| (|Partition|)))
               (SEQ
                (COND ((SPADCALL |spol| (QREFELT $ 54)) (|spadConstant| $ 18))
                      (#1='T
                       (SEQ
                        (LETT |dg| (SPADCALL |spol| (QREFELT $ 55))
                              |CYCLES;cupp|)
                        (EXIT
                         (COND
                          ((SPADCALL |dg| |pt| (QREFELT $ 56))
                           (|spadConstant| $ 18))
                          ((SPADCALL |dg| |pt| (QREFELT $ 57))
                           (SPADCALL (SPADCALL |pt| (QREFELT $ 8))
                                     (SPADCALL (SPADCALL |spol| (QREFELT $ 58))
                                               |dg| (QREFELT $ 13))
                                     (QREFELT $ 59)))
                          (#1#
                           (|CYCLES;cupp| |pt| (SPADCALL |spol| (QREFELT $ 60))
                            $)))))))))) 

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
                                        (QREFELT $ 46))
                              |CYCLES;cup;3Sp;15|)
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
         ((|deg| (|Partition|)) (#1=#:G808 NIL) (|k| NIL) (#2=#:G807 NIL))
         (SEQ
          (COND ((SPADCALL |spol| (QREFELT $ 54)) (|spadConstant| $ 18))
                ('T
                 (SEQ
                  (LETT |deg|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL . #3=(|CYCLES;mtpol|))
                          (SEQ (LETT |k| NIL . #3#)
                               (LETT #1#
                                     (SPADCALL (SPADCALL |spol| (QREFELT $ 55))
                                               (QREFELT $ 66))
                                     . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT (LETT #2# (CONS (* |n| |k|) #2#) . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 23))
                        . #3#)
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
          (#2=#:G810 NIL) (#3=#:G809 #1#) (#4=#:G811 #1#) (#5=#:G816 NIL)
          (|i| NIL) (|lc| (|Fraction| (|Integer|))))
         (SEQ
          (COND ((SPADCALL |spol| (QREFELT $ 54)) (|spadConstant| $ 18))
                (#6='T
                 (SEQ
                  (LETT |lc| (SPADCALL |spol| (QREFELT $ 58))
                        . #7=(|CYCLES;evspol|))
                  (LETT |prod|
                        (PROGN
                         (LETT #2# NIL . #7#)
                         (SEQ (LETT |i| NIL . #7#)
                              (LETT #5#
                                    (SPADCALL (SPADCALL |spol| (QREFELT $ 55))
                                              (QREFELT $ 66))
                                    . #7#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |i| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# (SPADCALL |i| |fn2|) . #7#)
                                 (COND
                                  (#2#
                                   (LETT #3# (SPADCALL #3# #4# (QREFELT $ 48))
                                         . #7#))
                                  ('T
                                   (PROGN
                                    (LETT #3# #4# . #7#)
                                    (LETT #2# 'T . #7#)))))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#6# (|spadConstant| $ 19))))
                        . #7#)
                  (EXIT
                   (SPADCALL (SPADCALL |lc| |prod| (QREFELT $ 46))
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
          (LETT |spol2| (QREFELT $$ 1) . #1=(|CYCLES;wreath;3Sp;20|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (#1=#:G828 NIL) (|k| NIL) (#2=#:G829 NIL) (|j| NIL) (#3=#:G827 NIL)
          (#4=#:G826 NIL) (|i| NIL) (#5=#:G825 NIL))
         (SEQ
          (LETT |a|
                (SPADCALL
                 (PROGN
                  (LETT #5# NIL . #6=(|CYCLES;SFunction;LSp;22|))
                  (SEQ (LETT |i| 1 . #6#) (LETT #4# (LENGTH |li|) . #6#) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #5#
                               (CONS
                                (PROGN
                                 (LETT #3# NIL . #6#)
                                 (SEQ (LETT |j| 1 . #6#)
                                      (LETT #2# (LENGTH |li|) . #6#)
                                      (LETT |k| NIL . #6#)
                                      (LETT #1# |li| . #6#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |k| (CAR #1#) . #6#)
                                             NIL)
                                            (|greater_SI| |j| #2#))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (|CYCLES;hh| (+ (- |k| |j|) |i|)
                                                $)
                                               #3#)
                                              . #6#)))
                                      (LETT #1#
                                            (PROG1 (CDR #1#)
                                              (LETT |j| (|inc_SI| |j|) . #6#))
                                            . #6#)
                                      (GO G190) G191 (EXIT (NREVERSE #3#))))
                                #5#)
                               . #6#)))
                       (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                       (EXIT (NREVERSE #5#))))
                 (QREFELT $ 70))
                . #6#)
          (EXIT (SPADCALL |a| (QREFELT $ 71)))))) 

(SDEFUN |CYCLES;roundup|
        ((|li1| |List| (|Integer|)) (|li2| |List| (|Integer|))
         ($ |List| (|Integer|)))
        (COND
         ((SPADCALL (LENGTH |li1|) (LENGTH |li2|) (QREFELT $ 73))
          (|CYCLES;roundup| |li1| (SPADCALL |li2| 0 (QREFELT $ 74)) $))
         ('T |li2|))) 

(SDEFUN |CYCLES;skewSFunction;2LSp;24|
        ((|li1| |List| (|Integer|)) (|li2| |List| (|Integer|))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|a| (|Matrix| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
          (#1=#:G848 NIL) (|k| NIL) (#2=#:G849 NIL) (|j| NIL) (#3=#:G847 NIL)
          (#4=#:G846 NIL) (|i| NIL) (#5=#:G845 NIL))
         (SEQ
          (COND
           ((< (LENGTH |li1|) (LENGTH |li2|))
            (|error| "skewSFunction: partition1 does not include partition2"))
           ('T
            (SEQ
             (LETT |li2| (|CYCLES;roundup| |li1| |li2| $)
                   . #6=(|CYCLES;skewSFunction;2LSp;24|))
             (LETT |a|
                   (SPADCALL
                    (PROGN
                     (LETT #5# NIL . #6#)
                     (SEQ (LETT |i| 1 . #6#) (LETT #4# (LENGTH |li1|) . #6#)
                          G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (PROGN
                                    (LETT #3# NIL . #6#)
                                    (SEQ (LETT |j| 1 . #6#)
                                         (LETT #2# (LENGTH |li1|) . #6#)
                                         (LETT |k| NIL . #6#)
                                         (LETT #1# |li1| . #6#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |k| (CAR #1#) . #6#)
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
                                                                  (QREFELT $
                                                                           75)))
                                                     |j|)
                                                    |i|)
                                                   $)
                                                  #3#)
                                                 . #6#)))
                                         (LETT #1#
                                               (PROG1 (CDR #1#)
                                                 (LETT |j| (|inc_SI| |j|)
                                                       . #6#))
                                               . #6#)
                                         (GO G190) G191 (EXIT (NREVERSE #3#))))
                                   #5#)
                                  . #6#)))
                          (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    (QREFELT $ 70))
                   . #6#)
             (EXIT (SPADCALL |a| (QREFELT $ 71))))))))) 

(DECLAIM (NOTINLINE |CycleIndicators;|)) 

(DEFUN |CycleIndicators| ()
  (SPROG NIL
         (PROG (#1=#:G851)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CycleIndicators|)
                    . #2=(|CycleIndicators|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CycleIndicators|
                             (LIST (CONS NIL (CONS 1 (|CycleIndicators;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CycleIndicators|)))))))))) 

(DEFUN |CycleIndicators;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CycleIndicators|) . #1=(|CycleIndicators|))
          (LETT $ (GETREFV 77) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
             (QSETREFV $ 76
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
              (|Boolean|) (55 . |even?|) (|PositiveInteger|) (60 . *)
              |CYCLES;alternating;ISp;5| (66 . -) |CYCLES;elementary;ISp;6|
              (|Factored| 6) (71 . |coerce|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 6)) (|List| 35)
              (76 . |factors|) (81 . |One|) (85 . |append|) (91 . |One|)
              |CYCLES;powerSum;ISp;9| (|IntegerNumberTheoryFunctions|)
              (95 . |eulerPhi|) (100 . /) (106 . |numer|) (111 . *)
              |CYCLES;cyclic;ISp;10| (117 . *) |CYCLES;dihedral;ISp;11|
              (123 . |powers|) (128 . |second|) (133 . |lcm|)
              |CYCLES;graphs;ISp;13| (139 . |zero?|) (144 . |degree|) (149 . <)
              (155 . =) (161 . |leadingCoefficient|) (166 . *)
              (172 . |reductum|) |CYCLES;cup;3Sp;15| (177 . |Zero|)
              |CYCLES;eval;SpF;16| (181 . +) |CYCLES;cap;2SpF;17|
              (187 . |coerce|) |CYCLES;wreath;3Sp;20| (|List| (|List| 12))
              (|Matrix| 12) (192 . |matrix|) (197 . |determinant|)
              (202 . |SFunction|) (207 . >) (213 . |concat|) (219 . |elt|)
              (225 . |skewSFunction|))
           '#(|wreath| 231 |skewSFunction| 237 |powerSum| 243 |graphs| 248
              |eval| 253 |elementary| 258 |dihedral| 263 |cyclic| 268 |cup| 273
              |complete| 279 |cap| 284 |alternating| 290 |SFunction| 295)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 76
                                                 '(1 7 6 0 8 1 9 0 6 10 1 9 0 0
                                                   11 2 12 0 9 7 13 1 14 0 0 15
                                                   1 14 16 0 17 0 12 0 18 0 12
                                                   0 19 1 20 14 6 21 1 7 0 22
                                                   23 2 12 0 0 0 24 1 6 26 0 27
                                                   2 12 0 28 0 29 1 12 0 0 31 1
                                                   33 0 6 34 1 33 36 0 37 0 33
                                                   0 38 2 22 0 0 0 39 0 9 0 40
                                                   1 42 6 6 43 2 9 0 6 6 44 1 9
                                                   6 0 45 2 12 0 9 0 46 2 12 0
                                                   0 0 48 1 7 16 22 50 1 22 6 0
                                                   51 2 6 0 0 0 52 1 12 26 0 54
                                                   1 12 7 0 55 2 7 26 0 0 56 2
                                                   7 26 0 0 57 1 12 9 0 58 2 12
                                                   0 6 0 59 1 12 0 0 60 0 9 0
                                                   62 2 9 0 0 0 64 1 7 22 0 66
                                                   1 69 0 68 70 1 69 12 0 71 1
                                                   0 12 22 72 2 6 26 0 0 73 2
                                                   22 0 0 6 74 2 22 6 0 6 75 2
                                                   0 12 22 22 76 2 0 12 12 12
                                                   67 2 0 12 22 22 76 1 0 12 6
                                                   41 1 0 12 6 53 1 0 9 12 63 1
                                                   0 12 6 32 1 0 12 6 49 1 0 12
                                                   6 47 2 0 12 12 12 61 1 0 12
                                                   6 25 2 0 9 12 12 65 1 0 12 6
                                                   30 1 0 12 22 72)))))
           '|lookupComplete|)) 

(MAKEPROP '|CycleIndicators| 'NILADIC T) 
