
(SDEFUN |CYCLES;trm|
        ((|pt| (|Partition|))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |pt| (QREFELT % 8)) (QREFELT % 10))
                   (QREFELT % 11))
         |pt| (QREFELT % 13))) 

(SDEFUN |CYCLES;list|
        ((|st| (|Stream| (|List| (|Integer|))))
         (% (|List| (|List| (|Integer|)))))
        (SPADCALL (SPADCALL |st| (QREFELT % 15)) (QREFELT % 17))) 

(SDEFUN |CYCLES;sorted_partitions|
        ((|i| (|Integer|)) (% (|List| (|Partition|))))
        (SPROG
         ((|lp| (|List| (|Partition|))) (|lli| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |lli| (|CYCLES;list| (SPADCALL |i| (QREFELT % 19)) %))
              (LETT |lp| (SPADCALL (ELT % 21) |lli| (QREFELT % 25)))
              (EXIT (SPADCALL (REVERSE |lp|) (QREFELT % 26)))))) 

(SDEFUN |CYCLES;complete;ISp;4|
        ((|i| (|Integer|))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((#1=#:G17 NIL)
          (#2=#:G16 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G18 #3#) (#5=#:G20 NIL) (|pt| NIL))
         (SEQ
          (COND ((EQL |i| 0) (|spadConstant| % 30))
                ((< |i| 0) (|spadConstant| % 31))
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |pt| NIL)
                       (LETT #5# (|CYCLES;sorted_partitions| |i| %)) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |pt| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (|CYCLES;trm| |pt| %))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 32))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|spadConstant| % 31))))))))) 

(SDEFUN |CYCLES;even?| ((|li| (|List| #1=(|Integer|))) (% (|Boolean|)))
        (SPROG ((|le| (|List| #1#)) (#2=#:G26 NIL) (|i| NIL) (#3=#:G25 NIL))
               (SEQ
                (LETT |le|
                      (PROGN
                       (LETT #3# NIL)
                       (SEQ (LETT |i| NIL) (LETT #2# |li|) G190
                            (COND
                             ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND ((EVENP |i|) (LETT #3# (CONS |i| #3#))))))
                            (LETT #2# (CDR #2#)) (GO G190) G191
                            (EXIT (NREVERSE #3#)))))
                (EXIT (EVENP (LENGTH |le|)))))) 

(SDEFUN |CYCLES;alternating;ISp;6|
        ((|i| (|Integer|))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((#1=#:G28 NIL)
          (#2=#:G27 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G29 #3#) (#5=#:G31 NIL) (|pt| NIL))
         (SEQ
          (SPADCALL 2
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |pt| NIL)
                          (LETT #5# (|CYCLES;sorted_partitions| |i| %)) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |pt| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((|CYCLES;even?| (SPADCALL |pt| (QREFELT % 34)) %)
                              (PROGN
                               (LETT #4# (|CYCLES;trm| |pt| %))
                               (COND
                                (#1#
                                 (LETT #2# (SPADCALL #2# #4# (QREFELT % 32))))
                                ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| % 31))))
                    (QREFELT % 36))))) 

(SDEFUN |CYCLES;elementary;ISp;7|
        ((|i| (|Integer|))
         (% #1=(|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((#2=#:G33 NIL) (#3=#:G32 #1#) (#4=#:G34 #1#)
          (|spol| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#5=#:G37 NIL) (|pt| NIL))
         (SEQ
          (COND ((EQL |i| 0) (|spadConstant| % 30))
                ((< |i| 0) (|spadConstant| % 31))
                (#6='T
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |pt| NIL)
                       (LETT #5# (|CYCLES;sorted_partitions| |i| %)) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |pt| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SEQ (LETT |spol| (|CYCLES;trm| |pt| %))
                                     (EXIT
                                      (COND
                                       ((|CYCLES;even?|
                                         (SPADCALL |pt| (QREFELT % 34)) %)
                                        |spol|)
                                       ('T
                                        (SPADCALL |spol| (QREFELT % 38)))))))
                          (COND
                           (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT % 32))))
                           ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) (#6# (|spadConstant| % 31))))))))) 

(SDEFUN |CYCLES;divisors| ((|n| (|Integer|)) (% (|List| (|Integer|))))
        (SPROG
         ((|c| (|List| (|Integer|))) (#1=#:G40 NIL)
          (#2=#:G39 #3=(|List| (|Integer|))) (#4=#:G41 #3#) (#5=#:G49 NIL)
          (|j| NIL) (#6=#:G48 NIL) (#7=#:G47 NIL) (|a| NIL)
          (|b|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |b| (SPADCALL (SPADCALL |n| (QREFELT % 41)) (QREFELT % 45)))
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
                                 (LETT #2# (SPADCALL #2# #4# (QREFELT % 48))))
                                ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                            (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                       (COND (#1# #2#) (#8='T NIL)))))
          (EXIT (COND ((EQL (LENGTH |b|) 1) |c|) (#8# (CONS |n| |c|))))))) 

(SDEFUN |CYCLES;ss|
        ((|n| (|Integer|)) (|m| (|Integer|))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((|li| (|List| (|Integer|))) (#1=#:G55 NIL) (|j| NIL) (#2=#:G54 NIL))
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
           (SPADCALL (|spadConstant| % 47) (SPADCALL |li| (QREFELT % 21))
                     (QREFELT % 13)))))) 

(SDEFUN |CYCLES;powerSum;ISp;10|
        ((|n| (|Integer|))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (|CYCLES;ss| |n| 1 %)) 

(SDEFUN |CYCLES;cyclic;ISp;11|
        ((|n| (|Integer|))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((#1=#:G58 NIL)
          (#2=#:G57 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G59 #3#) (#5=#:G61 NIL) (|i| NIL))
         (SEQ
          (COND ((EQL |n| 1) (SPADCALL 1 (QREFELT % 49)))
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |i| NIL) (LETT #5# (|CYCLES;divisors| |n| %)) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL
                                 (SPADCALL (SPADCALL |i| (QREFELT % 51)) |n|
                                           (QREFELT % 52))
                                 (|CYCLES;ss| |i|
                                  (SPADCALL (SPADCALL |n| |i| (QREFELT % 52))
                                            (QREFELT % 53))
                                  %)
                                 (QREFELT % 54)))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 32))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|spadConstant| % 31))))))))) 

(SDEFUN |CYCLES;dihedral;ISp;12|
        ((|n| (|Integer|))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG ((|k| (|Integer|)))
               (SEQ (LETT |k| (QUOTIENT2 |n| 2))
                    (EXIT
                     (COND
                      ((ODDP |n|)
                       (SPADCALL
                        (SPADCALL (SPADCALL 1 2 (QREFELT % 52))
                                  (SPADCALL |n| (QREFELT % 55)) (QREFELT % 54))
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT % 52))
                                   (|CYCLES;ss| 2 |k| %) (QREFELT % 54))
                         (SPADCALL 1 (QREFELT % 49)) (QREFELT % 56))
                        (QREFELT % 32)))
                      ('T
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT % 52))
                                   (SPADCALL |n| (QREFELT % 55))
                                   (QREFELT % 54))
                         (SPADCALL (SPADCALL 1 4 (QREFELT % 52))
                                   (|CYCLES;ss| 2 |k| %) (QREFELT % 54))
                         (QREFELT % 32))
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 4 (QREFELT % 52))
                                   (|CYCLES;ss| 2 (- |k| 1) %) (QREFELT % 54))
                         (|CYCLES;ss| 1 2 %) (QREFELT % 56))
                        (QREFELT % 32)))))))) 

(SDEFUN |CYCLES;trm2|
        ((|li| (|List| (|Integer|)))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((|prod| #1=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (|prod2| #1#) (|pp1| (|Integer|)) (|r1| #2=(|Integer|))
          (|r0| #3=(|Integer|)) (#4=#:G74 NIL) (|r| NIL)
          (|c| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (|qq1| #5=(|Integer|)) (|k| #5#) (|ll1| #2#) (|ll0| #3#)
          (#6=#:G73 NIL) (|ll| NIL) (|xx| (|Fraction| (|Integer|)))
          (|lli| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |lli| (SPADCALL |li| (QREFELT % 58)))
              (LETT |xx|
                    (SPADCALL 1
                              (SPADCALL (SPADCALL |li| (QREFELT % 21))
                                        (QREFELT % 8))
                              (QREFELT % 52)))
              (LETT |prod| (|spadConstant| % 30))
              (SEQ (LETT |ll| NIL) (LETT #6# |lli|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |ll| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ll0| (|SPADfirst| |ll|))
                        (LETT |ll1| (SPADCALL |ll| (QREFELT % 59)))
                        (LETT |k| (QUOTIENT2 |ll0| 2))
                        (LETT |c|
                              (COND
                               ((ODDP |ll0|)
                                (|CYCLES;ss| |ll0| (* |ll1| |k|) %))
                               ('T
                                (SPADCALL (|CYCLES;ss| |k| |ll1| %)
                                          (|CYCLES;ss| |ll0|
                                           (* |ll1| (- |k| 1)) %)
                                          (QREFELT % 56)))))
                        (LETT |qq1| (QUOTIENT2 (* |ll1| (- |ll1| 1)) 2))
                        (LETT |c|
                              (SPADCALL |c|
                                        (|CYCLES;ss| |ll0| (* |ll0| |qq1|) %)
                                        (QREFELT % 56)))
                        (LETT |prod2| (|spadConstant| % 30))
                        (SEQ (LETT |r| NIL) (LETT #4# |lli|) G190
                             (COND
                              ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((< (|SPADfirst| |r|) |ll0|)
                                 (SEQ (LETT |r0| (|SPADfirst| |r|))
                                      (LETT |r1| (SPADCALL |r| (QREFELT % 59)))
                                      (LETT |pp1|
                                            (* (* (GCD |r0| |ll0|) |r1|)
                                               |ll1|))
                                      (EXIT
                                       (LETT |prod2|
                                             (SPADCALL
                                              (|CYCLES;ss|
                                               (SPADCALL |r0| |ll0|
                                                         (QREFELT % 60))
                                               |pp1| %)
                                              |prod2| (QREFELT % 56)))))))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |prod|
                               (SPADCALL (SPADCALL |c| |prod2| (QREFELT % 56))
                                         |prod| (QREFELT % 56)))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |xx| |prod| (QREFELT % 54)))))) 

(SDEFUN |CYCLES;graphs;ISp;14|
        ((|n| (|Integer|))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((#1=#:G76 NIL)
          (#2=#:G75 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G77 #3#) (#5=#:G79 NIL) (|li| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |li| NIL)
                (LETT #5# (|CYCLES;list| (SPADCALL |n| (QREFELT % 19)) %)) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |li| (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (|CYCLES;trm2| |li| %))
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 32))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 31))))))) 

(SDEFUN |CYCLES;cupp|
        ((|pt| (|Partition|))
         (|spol| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG ((|dg| (|Partition|)))
               (SEQ
                (COND ((SPADCALL |spol| (QREFELT % 63)) (|spadConstant| % 31))
                      (#1='T
                       (SEQ (LETT |dg| (SPADCALL |spol| (QREFELT % 64)))
                            (EXIT
                             (COND
                              ((SPADCALL |dg| |pt| (QREFELT % 65))
                               (|spadConstant| % 31))
                              ((SPADCALL |dg| |pt| (QREFELT % 66))
                               (SPADCALL (SPADCALL |pt| (QREFELT % 8))
                                         (SPADCALL
                                          (SPADCALL |spol| (QREFELT % 67)) |dg|
                                          (QREFELT % 13))
                                         (QREFELT % 68)))
                              (#1#
                               (|CYCLES;cupp| |pt|
                                (SPADCALL |spol| (QREFELT % 69)) %)))))))))) 

(SDEFUN |CYCLES;cup;3Sp;16|
        ((|spol1| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
         (|spol2| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG ((|p| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
               (SEQ
                (COND ((SPADCALL |spol1| (QREFELT % 63)) (|spadConstant| % 31))
                      ('T
                       (SEQ
                        (LETT |p|
                              (SPADCALL (SPADCALL |spol1| (QREFELT % 67))
                                        (|CYCLES;cupp|
                                         (SPADCALL |spol1| (QREFELT % 64))
                                         |spol2| %)
                                        (QREFELT % 54)))
                        (EXIT
                         (SPADCALL |p|
                                   (SPADCALL (SPADCALL |spol1| (QREFELT % 69))
                                             |spol2| (QREFELT % 70))
                                   (QREFELT % 32))))))))) 

(SDEFUN |CYCLES;eval;SpF;17|
        ((|spol| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
         (% (|Fraction| (|Integer|))))
        (COND ((SPADCALL |spol| (QREFELT % 63)) (|spadConstant| % 29))
              ('T
               (SPADCALL (SPADCALL |spol| (QREFELT % 67))
                         (SPADCALL (SPADCALL |spol| (QREFELT % 69))
                                   (QREFELT % 71))
                         (QREFELT % 72))))) 

(SDEFUN |CYCLES;cap;2SpF;18|
        ((|spol1| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
         (|spol2| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
         (% (|Fraction| (|Integer|))))
        (SPADCALL (SPADCALL |spol1| |spol2| (QREFELT % 70)) (QREFELT % 71))) 

(SDEFUN |CYCLES;mtpol|
        ((|n| (|Integer|))
         (|spol| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG ((|deg| (|Partition|)) (#1=#:G95 NIL) (|k| NIL) (#2=#:G94 NIL))
               (SEQ
                (COND ((SPADCALL |spol| (QREFELT % 63)) (|spadConstant| % 31))
                      ('T
                       (SEQ
                        (LETT |deg|
                              (SPADCALL
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |k| NIL)
                                     (LETT #1#
                                           (SPADCALL
                                            (SPADCALL |spol| (QREFELT % 64))
                                            (QREFELT % 34)))
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |k| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT (LETT #2# (CONS (* |n| |k|) #2#))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               (QREFELT % 21)))
                        (EXIT
                         (SPADCALL
                          (SPADCALL (SPADCALL |spol| (QREFELT % 67)) |deg|
                                    (QREFELT % 13))
                          (|CYCLES;mtpol| |n| (SPADCALL |spol| (QREFELT % 69))
                           %)
                          (QREFELT % 32))))))))) 

(SDEFUN |CYCLES;evspol|
        ((|fn2|
          (|Mapping| (|SymmetricPolynomial| (|Fraction| (|Integer|)))
                     (|Integer|)))
         (|spol| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((|prod| #1=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#2=#:G97 NIL) (#3=#:G96 #1#) (#4=#:G98 #1#) (#5=#:G103 NIL)
          (|i| NIL) (|lc| (|Fraction| (|Integer|))))
         (SEQ
          (COND ((SPADCALL |spol| (QREFELT % 63)) (|spadConstant| % 31))
                (#6='T
                 (SEQ (LETT |lc| (SPADCALL |spol| (QREFELT % 67)))
                      (LETT |prod|
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |i| NIL)
                                  (LETT #5#
                                        (SPADCALL
                                         (SPADCALL |spol| (QREFELT % 64))
                                         (QREFELT % 34)))
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
                                                       (QREFELT % 56))))
                                      ('T
                                       (PROGN
                                        (LETT #3# #4#)
                                        (LETT #2# 'T)))))))
                                  (LETT #5# (CDR #5#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#2# #3#) (#6# (|spadConstant| % 30)))))
                      (EXIT
                       (SPADCALL (SPADCALL |lc| |prod| (QREFELT % 54))
                                 (|CYCLES;evspol| |fn2|
                                  (SPADCALL |spol| (QREFELT % 69)) %)
                                 (QREFELT % 32))))))))) 

(SDEFUN |CYCLES;wreath;3Sp;21|
        ((|spol1| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
         (|spol2| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG NIL
               (|CYCLES;evspol|
                (CONS #'|CYCLES;wreath;3Sp;21!0| (VECTOR % |spol2|)) |spol1|
                %))) 

(SDEFUN |CYCLES;wreath;3Sp;21!0| ((|x| NIL) ($$ NIL))
        (PROG (|spol2| %)
          (LETT |spol2| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|CYCLES;mtpol| |x| |spol2| %))))) 

(SDEFUN |CYCLES;hh|
        ((|n| (|Integer|))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (COND ((EQL |n| 0) (|spadConstant| % 30))
              ((< |n| 0) (|spadConstant| % 31))
              ('T (SPADCALL |n| (QREFELT % 33))))) 

(SDEFUN |CYCLES;SFunction;LSp;23|
        ((|li| (|List| (|Integer|)))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((|a| (|Matrix| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
          (#1=#:G116 NIL) (|k| NIL) (#2=#:G117 NIL) (|j| NIL) (#3=#:G115 NIL)
          (#4=#:G114 NIL) (|i| NIL) (#5=#:G113 NIL))
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
                                                %)
                                               #3#))))
                                      (LETT #1#
                                            (PROG1 (CDR #1#)
                                              (LETT |j| (|inc_SI| |j|))))
                                      (GO G190) G191 (EXIT (NREVERSE #3#))))
                                #5#))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                       (EXIT (NREVERSE #5#))))
                 (QREFELT % 77)))
          (EXIT (SPADCALL |a| (QREFELT % 78)))))) 

(SDEFUN |CYCLES;roundup|
        ((|li1| (|List| (|Integer|))) (|li2| (|List| (|Integer|)))
         (% (|List| (|Integer|))))
        (COND
         ((> (LENGTH |li1|) (LENGTH |li2|))
          (|CYCLES;roundup| |li1| (SPADCALL |li2| 0 (QREFELT % 80)) %))
         ('T |li2|))) 

(SDEFUN |CYCLES;skewSFunction;2LSp;25|
        ((|li1| (|List| (|Integer|))) (|li2| (|List| (|Integer|)))
         (% (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((|a| (|Matrix| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
          (#1=#:G130 NIL) (|k| NIL) (#2=#:G131 NIL) (|j| NIL) (#3=#:G129 NIL)
          (#4=#:G128 NIL) (|i| NIL) (#5=#:G127 NIL))
         (SEQ
          (COND
           ((< (LENGTH |li1|) (LENGTH |li2|))
            (|error| "skewSFunction: partition1 does not include partition2"))
           ('T
            (SEQ (LETT |li2| (|CYCLES;roundup| |li1| |li2| %))
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
                                                                       % 81)))
                                                         |j|)
                                                        |i|)
                                                       %)
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
                        (QREFELT % 77)))
                 (EXIT (SPADCALL |a| (QREFELT % 78))))))))) 

(DECLAIM (NOTINLINE |CycleIndicators;|)) 

(DEFUN |CycleIndicators;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CycleIndicators|))
          (LETT % (GETREFV 83))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CycleIndicators| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasCategory| (|SymmetricPolynomial| (|Fraction| (|Integer|)))
                           '(|CommutativeRing|))
            (PROGN
             (QSETREFV % 79
                       (CONS (|dispatchFunction| |CYCLES;SFunction;LSp;23|) %))
             NIL
             (QSETREFV % 82
                       (CONS
                        (|dispatchFunction| |CYCLES;skewSFunction;2LSp;25|)
                        %)))))
          %))) 

(DEFUN |CycleIndicators| ()
  (SPROG NIL
         (PROG (#1=#:G133)
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

(MAKEPROP '|CycleIndicators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Partition|) (0 . |pdct|)
              (|Fraction| 6) (5 . |coerce|) (10 . |inv|)
              (|SymmetricPolynomial| 9) (15 . |monomial|) (|Stream| 20)
              (21 . |complete|) (|List| 20) (26 . |entries|)
              (|PartitionsAndPermutations|) (31 . |partitions|) (|List| 6)
              (36 . |partition|) (|List| 7) (|Mapping| 7 20)
              (|ListFunctions2| 20 7) (41 . |map|) (47 . |sort|) (|Factored| 6)
              (52 . |Zero|) (56 . |Zero|) (60 . |One|) (64 . |Zero|) (68 . +)
              |CYCLES;complete;ISp;4| (74 . |coerce|) (|PositiveInteger|)
              (79 . *) |CYCLES;alternating;ISp;6| (85 . -)
              |CYCLES;elementary;ISp;7| (|Factored| %) (90 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 42) (|:| |factor| 6)
                        (|:| |exponent| (|NonNegativeInteger|)))
              (|List| 43) (95 . |factorList|) (100 . |One|) (104 . |One|)
              (108 . |append|) |CYCLES;powerSum;ISp;10|
              (|IntegerNumberTheoryFunctions|) (114 . |eulerPhi|) (119 . /)
              (125 . |numer|) (130 . *) |CYCLES;cyclic;ISp;11| (136 . *)
              |CYCLES;dihedral;ISp;12| (142 . |powers|) (147 . |second|)
              (152 . |lcm|) |CYCLES;graphs;ISp;14| (|Boolean|) (158 . |zero?|)
              (163 . |degree|) (168 . <) (174 . =) (180 . |leadingCoefficient|)
              (185 . *) (191 . |reductum|) |CYCLES;cup;3Sp;16|
              |CYCLES;eval;SpF;17| (196 . +) |CYCLES;cap;2SpF;18|
              |CYCLES;wreath;3Sp;21| (|List| (|List| 12)) (|Matrix| 12)
              (202 . |matrix|) (207 . |determinant|) (212 . |SFunction|)
              (217 . |concat|) (223 . |elt|) (229 . |skewSFunction|))
           '#(|wreath| 235 |skewSFunction| 241 |powerSum| 247 |graphs| 252
              |eval| 257 |elementary| 262 |dihedral| 267 |cyclic| 272 |cup| 277
              |complete| 283 |cap| 288 |alternating| 294 |SFunction| 299)
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
                        (|makeByteWordVec2| 82
                                            '(1 7 6 0 8 1 9 0 6 10 1 9 0 0 11 2
                                              12 0 9 7 13 1 14 0 0 15 1 14 16 0
                                              17 1 18 14 6 19 1 7 0 20 21 2 24
                                              22 23 16 25 1 22 0 0 26 0 27 0 28
                                              0 9 0 29 0 12 0 30 0 12 0 31 2 12
                                              0 0 0 32 1 7 20 0 34 2 12 0 35 0
                                              36 1 12 0 0 38 1 6 40 0 41 1 27
                                              44 0 45 0 27 0 46 0 9 0 47 2 20 0
                                              0 0 48 1 50 6 6 51 2 9 0 6 6 52 1
                                              9 6 0 53 2 12 0 9 0 54 2 12 0 0 0
                                              56 1 7 16 20 58 1 20 6 0 59 2 6 0
                                              0 0 60 1 12 62 0 63 1 12 7 0 64 2
                                              7 62 0 0 65 2 7 62 0 0 66 1 12 9
                                              0 67 2 12 0 6 0 68 1 12 0 0 69 2
                                              9 0 0 0 72 1 76 0 75 77 1 76 12 0
                                              78 1 0 12 20 79 2 20 0 0 6 80 2
                                              20 6 0 6 81 2 0 12 20 20 82 2 0
                                              12 12 12 74 2 0 12 20 20 82 1 0
                                              12 6 49 1 0 12 6 61 1 0 9 12 71 1
                                              0 12 6 39 1 0 12 6 57 1 0 12 6 55
                                              2 0 12 12 12 70 1 0 12 6 33 2 0 9
                                              12 12 73 1 0 12 6 37 1 0 12 20
                                              79)))))
           '|lookupComplete|)) 
