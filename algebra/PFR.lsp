
(SDEFUN |PFR;copypf| ((|a| (%)) (% (%)))
        (CONS (QCAR |a|) (SPADCALL (QCDR |a|) (QREFELT % 10)))) 

(SDEFUN |PFR;compare|
        ((|s|
          (|Record| (|:| |num| R) (|:| |d_fact| R)
                    (|:| |d_exp| (|NonNegativeInteger|))))
         (|t|
          (|Record| (|:| |num| R) (|:| |d_fact| R)
                    (|:| |d_exp| (|NonNegativeInteger|))))
         (% (|Boolean|)))
        (COND
         ((SPADCALL (QVELT |s| 1) (QVELT |t| 1) (QREFELT % 12))
          (< (QVELT |s| 2) (QVELT |t| 2)))
         ('T (SPADCALL (QVELT |s| 1) (QVELT |t| 1) (QREFELT % 13))))) 

(SDEFUN |PFR;group_terms;2L;3|
        ((|l|
          (|List|
           (|Record| (|:| |num| R) (|:| |d_fact| R)
                     (|:| |d_exp| (|NonNegativeInteger|)))))
         (%
          (|List|
           (|Record| (|:| |num| R) (|:| |d_fact| R)
                     (|:| |d_exp| (|NonNegativeInteger|))))))
        (SPADCALL (CONS (|function| |PFR;compare|) %) |l| (QREFELT % 15))) 

(SDEFUN |PFR;exp_compare|
        ((|s|
          (|Record| (|:| |num| R) (|:| |d_fact| R)
                    (|:| |d_exp| (|NonNegativeInteger|))))
         (|t|
          (|Record| (|:| |num| R) (|:| |d_fact| R)
                    (|:| |d_exp| (|NonNegativeInteger|))))
         (% (|Boolean|)))
        (> (QVELT |s| 2) (QVELT |t| 2))) 

(SDEFUN |PFR;group_terms;2L;5|
        ((|l|
          (|List|
           (|Record| (|:| |num| R) (|:| |d_fact| R)
                     (|:| |d_exp| (|NonNegativeInteger|)))))
         (%
          (|List|
           (|Record| (|:| |num| R) (|:| |d_fact| R)
                     (|:| |d_exp| (|NonNegativeInteger|))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |num| R) (|:| |d_fact| R)
                      (|:| |d_exp| (|NonNegativeInteger|)))))
          (|el0|
           (|List|
            (|Record| (|:| |num| R) (|:| |d_fact| R)
                      (|:| |d_exp| (|NonNegativeInteger|)))))
          (#1=#:G65 NIL) (|t| NIL) (#2=#:G64 NIL) (#3=#:G63 NIL) (#4=#:G62 NIL)
          (|f0| (R))
          (|t0|
           (|Record| (|:| |num| R) (|:| |d_fact| R)
                     (|:| |d_exp| (|NonNegativeInteger|)))))
         (SEQ (LETT |res| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                   (SEQ (LETT |t0| (|SPADfirst| |l|))
                        (LETT |f0| (QVELT |t0| 1))
                        (LETT |el0|
                              (PROGN
                               (LETT #4# NIL)
                               (SEQ (LETT |t| NIL) (LETT #3# |l|) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |t| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QVELT |t| 1) |f0|
                                                  (QREFELT % 12))
                                        (LETT #4# (CONS |t| #4#))))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT (NREVERSE #4#)))))
                        (LETT |l|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |t| NIL) (LETT #1# |l|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |t| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QVELT |t| 1) |f0|
                                                  (QREFELT % 17))
                                        (LETT #2# (CONS |t| #2#))))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#)))))
                        (LETT |el0|
                              (SPADCALL (CONS (|function| |PFR;exp_compare|) %)
                                        |el0| (QREFELT % 15)))
                        (EXIT
                         (LETT |res| (SPADCALL |el0| |res| (QREFELT % 18)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |PFR;multiplyFracTerms|
        ((|s|
          (|Record| (|:| |num| R) (|:| |d_fact| R)
                    (|:| |d_exp| #1=(|NonNegativeInteger|))))
         (|t|
          (|Record| (|:| |num| R) (|:| |d_fact| R)
                    (|:| |d_exp| (|NonNegativeInteger|))))
         (% (%)))
        (SPROG
         ((|d| (%)) (|c| (%))
          (|coefs| (|Record| (|:| |coef1| R) (|:| |coef2| R)))
          (|i| (|Union| (|Record| (|:| |coef1| R) (|:| |coef2| R)) "failed"))
          (|te| #1#) (|tf| (R)) (|se| #1#) (|sf| (R)))
         (SEQ (LETT |sf| (QVELT |s| 1)) (LETT |se| (QVELT |s| 2))
              (LETT |tf| (QVELT |t| 1)) (LETT |te| (QVELT |t| 2))
              (EXIT
               (COND
                ((SPADCALL |sf| |tf| (QREFELT % 12))
                 (|PFR;normalizeFracTerm|
                  (VECTOR (SPADCALL (QVELT |s| 0) (QVELT |t| 0) (QREFELT % 19))
                          |sf| (+ |se| |te|))
                  %))
                (#2='T
                 (SEQ
                  (LETT |i|
                        (SPADCALL (SPADCALL |tf| |te| (QREFELT % 21))
                                  (SPADCALL |sf| |se| (QREFELT % 21))
                                  (SPADCALL (QVELT |s| 0) (QVELT |t| 0)
                                            (QREFELT % 19))
                                  (QREFELT % 24)))
                  (EXIT
                   (COND
                    ((QEQCAR |i| 1) (|error| "PartialFraction: not in ideal"))
                    (#2#
                     (SEQ (LETT |coefs| (QCDR |i|))
                          (LETT |c| (|PFR;copypf| (|spadConstant| % 25) %))
                          (COND
                           ((SPADCALL (QCDR |coefs|) (|spadConstant| % 26)
                                      (QREFELT % 17))
                            (LETT |c|
                                  (|PFR;normalizeFracTerm|
                                   (VECTOR (QCDR |coefs|) |tf| |te|) %))))
                          (COND
                           ((SPADCALL (QCAR |coefs|) (|spadConstant| % 26)
                                      (QREFELT % 17))
                            (SEQ
                             (LETT |d|
                                   (|PFR;normalizeFracTerm|
                                    (VECTOR (QCAR |coefs|) |sf| |se|) %))
                             (PROGN
                              (RPLACA |c|
                                      (SPADCALL (QCAR |c|) (QCAR |d|)
                                                (QREFELT % 27)))
                              (QCAR |c|))
                             (EXIT
                              (COND
                               ((NULL (NULL (QCDR |d|)))
                                (PROGN
                                 (RPLACD |c|
                                         (SPADCALL (QCDR |d|) (QCDR |c|)
                                                   (QREFELT % 28)))
                                 (QCDR |c|))))))))
                          (EXIT |c|)))))))))))) 

(SDEFUN |PFR;normalizeFracTerm|
        ((|s|
          (|Record| (|:| |num| R) (|:| |d_fact| R)
                    (|:| |d_exp| #1=(|NonNegativeInteger|))))
         (% (%)))
        (SPROG
         ((#2=#:G87 NIL)
          (|q| #3=(|Record| (|:| |quotient| R) (|:| |remainder| R)))
          (|c_exp| (|NonNegativeInteger|)) (|o_exp| #1#) (|f| (R)) (|qr| #3#))
         (SEQ
          (LETT |qr|
                (SPADCALL (QVELT |s| 0)
                          (SPADCALL (QVELT |s| 1) (QVELT |s| 2) (QREFELT % 21))
                          (QREFELT % 30)))
          (EXIT
           (COND
            ((SPADCALL (QCDR |qr|) (|spadConstant| % 26) (QREFELT % 12))
             (CONS (QCAR |qr|) NIL))
            (#4='T
             (SEQ (LETT |f| (QVELT |s| 1)) (LETT |o_exp| (QVELT |s| 2))
                  (LETT |c_exp| 0)
                  (LETT |q| (SPADCALL (QCDR |qr|) |f| (QREFELT % 30)))
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND
                           ((SPADCALL (QCDR |q|) (|spadConstant| % 26)
                                      (QREFELT % 12))
                            (< |c_exp| |o_exp|))
                           ('T NIL)))
                         (GO G191)))
                       (SEQ (LETT |c_exp| (+ |c_exp| 1))
                            (PROGN (RPLACD |qr| (QCAR |q|)) (QCDR |qr|))
                            (EXIT
                             (LETT |q|
                                   (SPADCALL (QCDR |qr|) |f| (QREFELT % 30)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((EQL |c_exp| |o_exp|)
                     (SPADCALL
                      (SPADCALL (QCAR |qr|) (QCDR |qr|) (QREFELT % 27))
                      (QREFELT % 33)))
                    (#4#
                     (CONS (QCAR |qr|)
                           (LIST
                            (VECTOR (QCDR |qr|) |f|
                                    (PROG1 (LETT #2# (- |o_exp| |c_exp|))
                                      (|check_subtype2| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|)
                                                        #2#))))))))))))))) 

(SDEFUN |PFR;normalize_terms|
        ((|wp| (R))
         (|l|
          (|List|
           (|Record| (|:| |num| R) (|:| |d_fact| R)
                     (|:| |d_exp| (|NonNegativeInteger|)))))
         (% (%)))
        (SPROG
         ((|frl|
           (|List|
            (|Record| (|:| |num| R) (|:| |d_fact| R)
                      (|:| |d_exp| (|NonNegativeInteger|)))))
          (#1=#:G105 NIL) (|pn| NIL) (|pl| (|List| %)) (#2=#:G104 NIL)
          (|el| NIL) (#3=#:G103 NIL))
         (SEQ
          (LETT |pl|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |el| NIL) (LETT #2# |l|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |el| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS (|PFR;normalizeFracTerm| |el| %) #3#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (LETT |frl| NIL)
          (SEQ (LETT |pn| NIL) (LETT #1# |pl|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |pn| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |wp| (SPADCALL |wp| (QCAR |pn|) (QREFELT % 27)))
                    (EXIT
                     (COND
                      ((NULL (NULL (QCDR |pn|)))
                       (LETT |frl| (CONS (|SPADfirst| (QCDR |pn|)) |frl|))))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (LETT |frl|
                (COND
                 ((QREFELT % 34) (SPADCALL (NREVERSE |frl|) (QREFELT % 16)))
                 ('T (NREVERSE |frl|))))
          (EXIT (CONS |wp| |frl|))))) 

(SDEFUN |PFR;partialFractionNormalized|
        ((|nm| (R)) (|dn| (|Factored| R)) (% (%)))
        (SPROG
         ((#1=#:G123 NIL) (|nn| NIL) (#2=#:G124 NIL) (|i| NIL) (#3=#:G122 NIL)
          (|nu| (|Union| (|List| R) "failed")) (|dens| (|List| R))
          (#4=#:G121 NIL) (#5=#:G120 NIL)
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((SPADCALL |nm| (|spadConstant| % 26) (QREFELT % 12))
            (|spadConstant| % 25))
           ((SPADCALL |dn| (|spadConstant| % 36) (QREFELT % 37))
            (SPADCALL |nm| (QREFELT % 33)))
           (#6='T
            (SEQ (LETT |fl| (SPADCALL |dn| (QREFELT % 41)))
                 (LETT |dens|
                       (PROGN
                        (LETT #5# NIL)
                        (SEQ (LETT |i| NIL) (LETT #4# |fl|) G190
                             (COND
                              ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS
                                      (SPADCALL (QVELT |i| 1) (QVELT |i| 2)
                                                (QREFELT % 21))
                                      #5#))))
                             (LETT #4# (CDR #4#)) (GO G190) G191
                             (EXIT (NREVERSE #5#)))))
                 (LETT |nu| (SPADCALL |dens| |nm| (QREFELT % 44)))
                 (EXIT
                  (COND
                   ((QEQCAR |nu| 1)
                    (|error|
                     "partialFractionNormalized: multiEuclidean failed"))
                   (#6#
                    (|PFR;normalize_terms| (|spadConstant| % 26)
                     (PROGN
                      (LETT #3# NIL)
                      (SEQ (LETT |i| NIL) (LETT #2# |fl|) (LETT |nn| NIL)
                           (LETT #1# (QCDR |nu|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |nn| (CAR #1#)) NIL)
                                 (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3#
                                   (CONS
                                    (VECTOR |nn| (QVELT |i| 1) (QVELT |i| 2))
                                    #3#))))
                           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT (NREVERSE #3#))))
                     %)))))))))) 

(SDEFUN |PFR;padicFraction;2%;10| ((|a| (%)) (% (%)))
        (SPROG
         ((|d| #1=(|Integer|)) (|sp| (|SparseUnivariatePolynomial| R))
          (|l|
           (|List|
            (|Record| (|:| |num| R) (|:| |d_fact| R)
                      (|:| |d_exp| (|NonNegativeInteger|)))))
          (#2=#:G128 NIL) (|f| (R)) (|e| #1#) (#3=#:G137 NIL) (|s| NIL)
          (|b| (%)))
         (SEQ (LETT |b| (SPADCALL |a| (QREFELT % 45)))
              (EXIT
               (COND ((NULL (QCDR |b|)) |b|)
                     ('T
                      (SEQ (LETT |l| NIL)
                           (SEQ (LETT |s| NIL) (LETT #3# (QCDR |b|)) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |s| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |e| (QVELT |s| 2))
                                     (EXIT
                                      (COND
                                       ((EQL |e| 1) (LETT |l| (CONS |s| |l|)))
                                       ('T
                                        (SEQ (LETT |f| (QVELT |s| 1))
                                             (LETT |d|
                                                   (SPADCALL
                                                    (LETT |sp|
                                                          (SPADCALL |f|
                                                                    (QVELT |s|
                                                                           0)
                                                                    (QREFELT %
                                                                             47)))
                                                    (QREFELT % 48)))
                                             (EXIT
                                              (SEQ G190
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL |sp|
                                                                (|spadConstant|
                                                                 % 49)
                                                                (QREFELT %
                                                                         50)))
                                                     (GO G191)))
                                                   (SEQ
                                                    (LETT |l|
                                                          (CONS
                                                           (VECTOR
                                                            (SPADCALL |sp|
                                                                      (QREFELT
                                                                       % 51))
                                                            |f|
                                                            (PROG1
                                                                (LETT #2#
                                                                      (- |e|
                                                                         |d|))
                                                              (|check_subtype2|
                                                               (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#)))
                                                           |l|))
                                                    (EXIT
                                                     (LETT |d|
                                                           (SPADCALL
                                                            (LETT |sp|
                                                                  (SPADCALL
                                                                   |sp|
                                                                   (QREFELT %
                                                                            52)))
                                                            (QREFELT % 48)))))
                                                   NIL (GO G190) G191
                                                   (EXIT NIL))))))))
                                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (CONS (QCAR |b|)
                                  (SPADCALL |l| (QREFELT % 16))))))))))) 

(SDEFUN |PFR;compactFraction;2%;11| ((|a| (%)) (% (%)))
        (SPROG
         ((|b| (%))
          (|s|
           (|Record| (|:| |num| R) (|:| |d_fact| R)
                     (|:| |d_exp| #1=(|NonNegativeInteger|))))
          (|e| #1#) (|f| (R))
          (|bf|
           (|List|
            (|Record| (|:| |num| R) (|:| |d_fact| R)
                      (|:| |d_exp| (|NonNegativeInteger|)))))
          (|bw| (R)) (#2=#:G145 NIL) (#3=#:G153 NIL) (|t| NIL)
          (|af|
           (|List|
            (|Record| (|:| |num| R) (|:| |d_fact| R)
                      (|:| |d_exp| (|NonNegativeInteger|))))))
         (SEQ
          (COND ((> 2 (LENGTH (QCDR |a|))) |a|)
                ('T
                 (SEQ (LETT |af| (REVERSE (QCDR |a|))) (LETT |bf| NIL)
                      (LETT |bw| (QCAR |a|))
                      (LETT |f| (QVELT (|SPADfirst| |af|) 1))
                      (LETT |e| (QVELT (|SPADfirst| |af|) 2))
                      (LETT |s| (VECTOR (QVELT (|SPADfirst| |af|) 0) |f| |e|))
                      (SEQ (LETT |t| NIL) (LETT #3# (CDR |af|)) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |f| (QVELT |t| 1) (QREFELT % 12))
                               (QSETVELT |s| 0
                                         (SPADCALL (QVELT |s| 0)
                                                   (SPADCALL (QVELT |t| 0)
                                                             (SPADCALL |f|
                                                                       (PROG1
                                                                           (LETT
                                                                            #2#
                                                                            (-
                                                                             |e|
                                                                             (QVELT
                                                                              |t|
                                                                              2)))
                                                                         (|check_subtype2|
                                                                          (>=
                                                                           #2#
                                                                           0)
                                                                          '(|NonNegativeInteger|)
                                                                          '(|Integer|)
                                                                          #2#))
                                                                       (QREFELT
                                                                        % 21))
                                                             (QREFELT % 19))
                                                   (QREFELT % 27))))
                              ('T
                               (SEQ (LETT |b| (|PFR;normalizeFracTerm| |s| %))
                                    (LETT |bw|
                                          (SPADCALL |bw| (QCAR |b|)
                                                    (QREFELT % 27)))
                                    (COND
                                     ((NULL (NULL (QCDR |b|)))
                                      (LETT |bf|
                                            (CONS (|SPADfirst| (QCDR |b|))
                                                  |bf|))))
                                    (LETT |f| (QVELT |t| 1))
                                    (LETT |e| (QVELT |t| 2))
                                    (EXIT
                                     (LETT |s|
                                           (VECTOR (QVELT |t| 0) |f|
                                                   |e|))))))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (LETT |b| (|PFR;normalizeFracTerm| |s| %))
                      (EXIT
                       (CONS (SPADCALL |bw| (QCAR |b|) (QREFELT % 27))
                             (SPADCALL (QCDR |b|) |bf| (QREFELT % 28)))))))))) 

(SDEFUN |PFR;Zero;%;12| ((% (%))) (CONS (|spadConstant| % 26) NIL)) 

(SDEFUN |PFR;One;%;13| ((% (%))) (CONS (|spadConstant| % 32) NIL)) 

(SDEFUN |PFR;characteristic;Nni;14| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 54))) 

(PUT '|PFR;coerce;R%;15| '|SPADreplace| '(XLAM (|r|) (CONS |r| NIL))) 

(SDEFUN |PFR;coerce;R%;15| ((|r| (R)) (% (%))) (CONS |r| NIL)) 

(SDEFUN |PFR;coerce;I%;16| ((|n| (|Integer|)) (% (%)))
        (CONS (SPADCALL |n| (QREFELT % 57)) NIL)) 

(SDEFUN |PFR;coerce;%F;17| ((|a| (%)) (% (|Fraction| R)))
        (SPROG ((|q| (|Fraction| R)) (#1=#:G168 NIL) (|s| NIL))
               (SEQ (LETT |q| (SPADCALL (QCAR |a|) (QREFELT % 60)))
                    (SEQ (LETT |s| NIL) (LETT #1# (QCDR |a|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |q|
                                 (SPADCALL |q|
                                           (SPADCALL (QVELT |s| 0)
                                                     (SPADCALL (QVELT |s| 1)
                                                               (QVELT |s| 2)
                                                               (QREFELT % 21))
                                                     (QREFELT % 61))
                                           (QREFELT % 62)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |q|)))) 

(SDEFUN |PFR;coerce;F%;18| ((|q| (|Fraction| (|Factored| R))) (% (%)))
        (SPROG ((|r1| (R)) (|u| (R)) (#1=#:G171 NIL))
               (SEQ
                (LETT |u|
                      (PROG2
                          (LETT #1#
                                (SPADCALL
                                 (SPADCALL (SPADCALL |q| (QREFELT % 65))
                                           (QREFELT % 66))
                                 (QREFELT % 68)))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                        (|Union| (QREFELT % 6) "failed") #1#)))
                (LETT |r1|
                      (SPADCALL |u|
                                (SPADCALL (SPADCALL |q| (QREFELT % 69))
                                          (QREFELT % 70))
                                (QREFELT % 19)))
                (EXIT
                 (|PFR;partialFractionNormalized| |r1|
                  (SPADCALL |u| (SPADCALL |q| (QREFELT % 65)) (QREFELT % 71))
                  %))))) 

(SDEFUN |PFR;exquo;2%U;19| ((|a| (%)) (|b| (%)) (% (|Union| % "failed")))
        (SPROG ((|br| (|Fraction| R)))
               (SEQ
                (COND
                 ((SPADCALL |b| (|spadConstant| % 25) (QREFELT % 73))
                  (CONS 1 "failed"))
                 ((SPADCALL |b| (|spadConstant| % 31) (QREFELT % 73))
                  (CONS 0 |a|))
                 ('T
                  (SEQ
                   (LETT |br|
                         (SPADCALL (SPADCALL |b| (QREFELT % 63))
                                   (QREFELT % 74)))
                   (EXIT
                    (CONS 0
                          (SPADCALL |a|
                                    (SPADCALL (SPADCALL |br| (QREFELT % 75))
                                              (SPADCALL
                                               (SPADCALL |br| (QREFELT % 76))
                                               (QREFELT % 77))
                                              (QREFELT % 78))
                                    (QREFELT % 79)))))))))) 

(SDEFUN |PFR;recip;%U;20| ((|a| (%)) (% (|Union| % "failed")))
        (SPADCALL (|spadConstant| % 31) |a| (QREFELT % 80))) 

(SDEFUN |PFR;numberOfFractionalTerms;%I;21| ((|a| (%)) (% (|Integer|)))
        (LENGTH (QCDR |a|))) 

(PUT '|PFR;wholePart;%R;22| '|SPADreplace| 'QCAR) 

(SDEFUN |PFR;wholePart;%R;22| ((|a| (%)) (% (R))) (QCAR |a|)) 

(PUT '|PFR;fractionalTerms;%L;23| '|SPADreplace| 'QCDR) 

(SDEFUN |PFR;fractionalTerms;%L;23|
        ((|a| (%))
         (%
          (|List|
           (|Record| (|:| |num| R) (|:| |d_fact| R)
                     (|:| |d_exp| (|NonNegativeInteger|))))))
        (QCDR |a|)) 

(SDEFUN |PFR;partialFraction;RF%;24| ((|nm| (R)) (|dn| (|Factored| R)) (% (%)))
        (SPROG ((|u| (R)) (#1=#:G193 NIL))
               (SEQ
                (COND
                 ((SPADCALL |nm| (|spadConstant| % 26) (QREFELT % 12))
                  (|spadConstant| % 25))
                 ('T
                  (SEQ (LETT |u| (SPADCALL |dn| (QREFELT % 66)))
                       (LETT |u|
                             (PROG2 (LETT #1# (SPADCALL |u| (QREFELT % 68)))
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                               (|Union| (QREFELT % 6) "failed")
                                               #1#)))
                       (EXIT
                        (|PFR;partialFractionNormalized|
                         (SPADCALL |u| |nm| (QREFELT % 19))
                         (SPADCALL |u| |dn| (QREFELT % 71)) %)))))))) 

(SDEFUN |PFR;padicallyExpand;2RSup;25|
        ((|p| (R)) (|r| (R)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG ((|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))))
               (SEQ (LETT |qr| (SPADCALL |r| |p| (QREFELT % 30)))
                    (EXIT
                     (COND
                      ((SPADCALL (QCAR |qr|) (|spadConstant| % 26)
                                 (QREFELT % 12))
                       (SPADCALL (QCDR |qr|) (QREFELT % 85)))
                      ('T
                       (SPADCALL (SPADCALL (QCDR |qr|) (QREFELT % 85))
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 32) 1
                                            (QREFELT % 86))
                                  (SPADCALL |p| (QCAR |qr|) (QREFELT % 47))
                                  (QREFELT % 87))
                                 (QREFELT % 88)))))))) 

(SDEFUN |PFR;=;2%B;26| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (COND
         ((NULL (QCDR |a|))
          (COND
           ((NULL (QCDR |b|)) (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT % 12)))
           (#1='T NIL)))
         ((NULL (QCDR |b|)) NIL)
         (#1#
          (SPADCALL (SPADCALL |a| (QREFELT % 63)) (SPADCALL |b| (QREFELT % 63))
                    (QREFELT % 89))))) 

(SDEFUN |PFR;-;2%;27| ((|a| (%)) (% (%)))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |num| R) (|:| |d_fact| R)
                      (|:| |d_exp| (|NonNegativeInteger|)))))
          (#1=#:G214 NIL) (|s| NIL))
         (SEQ (LETT |l| NIL)
              (SEQ (LETT |s| NIL) (LETT #1# (REVERSE (QCDR |a|))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |l|
                           (CONS
                            (VECTOR (SPADCALL (QVELT |s| 0) (QREFELT % 90))
                                    (QVELT |s| 1) (QVELT |s| 2))
                            |l|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (SPADCALL (QCAR |a|) (QREFELT % 90)) |l|))))) 

(SDEFUN |PFR;*;R2%;28| ((|r| (R)) (|a| (%)) (% (%)))
        (SPROG ((#1=#:G222 NIL) (|s| NIL) (#2=#:G221 NIL))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| % 26) (QREFELT % 12))
                  (|spadConstant| % 25))
                 ((SPADCALL |r| (|spadConstant| % 32) (QREFELT % 12)) |a|)
                 ('T
                  (|PFR;normalize_terms|
                   (SPADCALL |r| (QCAR |a|) (QREFELT % 19))
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |s| NIL) (LETT #1# (QCDR |a|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (VECTOR
                                   (SPADCALL |r| (QVELT |s| 0) (QREFELT % 19))
                                   (QVELT |s| 1) (QVELT |s| 2))
                                  #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   %)))))) 

(SDEFUN |PFR;*;I2%;29| ((|n| (|Integer|)) (|a| (%)) (% (%)))
        (SPADCALL (SPADCALL |n| (QREFELT % 57)) |a| (QREFELT % 92))) 

(SDEFUN |PFR;+;3%;30| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (CONS (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT % 27))
               (SPADCALL
                (SPADCALL (QCDR |a|) (SPADCALL (QCDR |b|) (QREFELT % 10))
                          (QREFELT % 28))
                (QREFELT % 16)))
         (QREFELT % 45))) 

(SDEFUN |PFR;*;3%;31| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((|c| (%)) (#1=#:G237 NIL) (|t| NIL) (#2=#:G236 NIL) (|s| NIL)
          (|af| (%)))
         (SEQ
          (COND ((NULL (QCDR |a|)) (SPADCALL (QCAR |a|) |b| (QREFELT % 92)))
                ((NULL (QCDR |b|)) (SPADCALL (QCAR |b|) |a| (QREFELT % 92)))
                ('T
                 (SEQ (LETT |af| (CONS (|spadConstant| % 26) (QCDR |a|)))
                      (LETT |c|
                            (SPADCALL (SPADCALL (QCAR |a|) |b| (QREFELT % 92))
                                      (SPADCALL (QCAR |b|) |af| (QREFELT % 92))
                                      (QREFELT % 94)))
                      (SEQ (LETT |s| NIL) (LETT #2# (QCDR |a|)) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |t| NIL) (LETT #1# (QCDR |b|)) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |t| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |c|
                                          (SPADCALL |c|
                                                    (|PFR;multiplyFracTerms|
                                                     |s| |t| %)
                                                    (QREFELT % 94)))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |c|))))))) 

(SDEFUN |PFR;coerce;%Of;32| ((|a| (%)) (% (|OutputForm|)))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|den| (|OutputForm|)) (#1=#:G252 NIL)
          (|s| NIL))
         (SEQ
          (COND ((NULL (QCDR |a|)) (SPADCALL (QCAR |a|) (QREFELT % 96)))
                (#2='T
                 (SEQ
                  (COND
                   ((SPADCALL (QCAR |a|) (|spadConstant| % 26) (QREFELT % 12))
                    (LETT |l| NIL))
                   (#2#
                    (LETT |l| (LIST (SPADCALL (QCAR |a|) (QREFELT % 96))))))
                  (SEQ (LETT |s| NIL) (LETT #1# (QCDR |a|)) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |den|
                              (COND
                               ((EQL (QVELT |s| 2) 1)
                                (SPADCALL (QVELT |s| 1) (QREFELT % 96)))
                               ('T
                                (SPADCALL
                                 (SPADCALL (QVELT |s| 1) (QREFELT % 96))
                                 (SPADCALL (QVELT |s| 2) (QREFELT % 97))
                                 (QREFELT % 98)))))
                        (EXIT
                         (LETT |l|
                               (CONS
                                (SPADCALL
                                 (SPADCALL (QVELT |s| 0) (QREFELT % 96)) |den|
                                 (QREFELT % 99))
                                |l|))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL (LENGTH |l|) 1) (|SPADfirst| |l|))
                         (#2#
                          (SPADCALL (ELT % 100) (REVERSE |l|)
                                    (QREFELT % 103))))))))))) 

(SDEFUN |PFR;partialFraction;F%;33| ((|f| (|Fraction| R)) (% (%)))
        (SPADCALL (SPADCALL |f| (QREFELT % 75))
                  (SPADCALL (SPADCALL |f| (QREFELT % 76)) (QREFELT % 106))
                  (QREFELT % 78))) 

(DECLAIM (NOTINLINE |PartialFraction;|)) 

(DEFUN |PartialFraction;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|PartialFraction| DV$1))
          (LETT % (GETREFV 116))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|UniqueFactorizationDomain|))))))
          (|haddProp| |$ConstructorCache| '|PartialFraction| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |whole| |#1|)
                              (|:| |fract|
                                   (|List|
                                    (|Record| (|:| |num| |#1|)
                                              (|:| |d_fact| |#1|)
                                              (|:| |d_exp|
                                                   (|NonNegativeInteger|)))))))
          (COND
           ((|HasCategory| |#1| '(|OrderedSet|))
            (PROGN
             (QSETREFV % 16
                       (CONS (|dispatchFunction| |PFR;group_terms;2L;3|) %))))
           ('T
            (PROGN
             (QSETREFV % 16
                       (CONS (|dispatchFunction| |PFR;group_terms;2L;5|) %)))))
          (QSETREFV % 34 (|HasCategory| |#1| '(|OrderedSet|)))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 107
                      (CONS (|dispatchFunction| |PFR;partialFraction;F%;33|)
                            %))))
          %))) 

(DEFUN |PartialFraction| (#1=#:G258)
  (SPROG NIL
         (PROG (#2=#:G259)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PartialFraction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PartialFraction;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PartialFraction|)))))))))) 

(MAKEPROP '|PartialFraction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Record| (|:| |num| 6) (|:| |d_fact| 6) (|:| |d_exp| 20))
              (|List| 8) (0 . |copy|) (|Boolean|) (5 . =) (11 . <)
              (|Mapping| 11 8 8) (17 . |sort|) (23 . |group_terms|) (28 . ~=)
              (34 . |concat|) (40 . *) (|NonNegativeInteger|) (46 . ^)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 22 '#1="failed") (52 . |extendedEuclidean|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PFR;Zero;%;12|) %))
              (59 . |Zero|) (63 . +) (69 . |append|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %)) (75 . |divide|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PFR;One;%;13|) %))
              (81 . |One|) |PFR;coerce;R%;15| '|ordered_R?| (|Factored| 6)
              (85 . |One|) (89 . =) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 38) (|:| |factor| 6) (|:| |exponent| 20))
              (|List| 39) (95 . |factorList|) (|Union| 43 '#1#) (|List| %)
              (100 . |multiEuclidean|) |PFR;compactFraction;2%;11|
              (|SparseUnivariatePolynomial| 6) |PFR;padicallyExpand;2RSup;25|
              (106 . |degree|) (111 . |Zero|) (115 . ~=)
              (121 . |leadingCoefficient|) (126 . |reductum|)
              |PFR;padicFraction;2%;10| (131 . |characteristic|)
              |PFR;characteristic;Nni;14| (|Integer|) (135 . |coerce|)
              |PFR;coerce;I%;16| (|Fraction| 6) (140 . |coerce|) (145 . /)
              (151 . +) |PFR;coerce;%F;17| (|Fraction| 35) (157 . |denom|)
              (162 . |unit|) (|Union| % '"failed") (167 . |recip|)
              (172 . |numer|) (177 . |expand|) (182 . *) |PFR;coerce;F%;18|
              |PFR;=;2%B;26| (188 . |inv|) (193 . |numer|) (198 . |denom|)
              (203 . |coerce|) |PFR;partialFraction;RF%;24| |PFR;*;3%;31|
              |PFR;exquo;2%U;19| |PFR;recip;%U;20|
              |PFR;numberOfFractionalTerms;%I;21| |PFR;wholePart;%R;22|
              |PFR;fractionalTerms;%L;23| (208 . |coerce|) (213 . |monomial|)
              (219 . *) (225 . +) (231 . =) (237 . -) |PFR;-;2%;27|
              |PFR;*;R2%;28| |PFR;*;I2%;29| |PFR;+;3%;30| (|OutputForm|)
              (242 . |coerce|) (247 . |coerce|) (252 . ^) (258 . /) (264 . +)
              (|Mapping| 95 95 95) (|List| 95) (270 . |reduce|)
              |PFR;coerce;%Of;32| (|Factored| %) (276 . |factor|)
              (281 . |partialFraction|) (|String|) (|PositiveInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |coef| 43) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Fraction| 56))
           '#(~= 286 |zero?| 292 |wholePart| 297 |unitNormal| 302
              |unitCanonical| 307 |unit?| 312 |subtractIfCan| 317
              |squareFreePart| 323 |squareFree| 328 |sizeLess?| 333 |sample|
              339 |rightRecip| 343 |rightPower| 348 |rem| 360 |recip| 366 |quo|
              371 |principalIdeal| 377 |prime?| 382 |plenaryPower| 387
              |partialFraction| 393 |padicallyExpand| 404 |padicFraction| 410
              |opposite?| 415 |one?| 421 |numberOfFractionalTerms| 426
              |multiEuclidean| 431 |leftRecip| 437 |leftPower| 442 |lcmCoef|
              454 |lcm| 460 |latex| 471 |inv| 476 |group_terms| 481
              |gcdPolynomial| 486 |gcd| 492 |fractionalTerms| 503 |factor| 508
              |extendedEuclidean| 513 |exquo| 526 |expressIdealMember| 532
              |euclideanSize| 538 |divide| 543 |compactFraction| 549
              |commutator| 554 |coerce| 560 |characteristic| 595 |associator|
              599 |associates?| 606 |antiCommutator| 612 |annihilate?| 618 ^
              624 |Zero| 642 |One| 646 = 650 / 656 - 662 + 673 * 679)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0))
            (CONS
             '#(|Field&| |EuclideanDomain&| |UniqueFactorizationDomain&| NIL
                |GcdDomain&| NIL NIL NIL |DivisionRing&| |Algebra&|
                |EntireRing&| |Algebra&| |Algebra&| NIL NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |Module&| |Module&| |Module&|
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |Magma&| |SetCategory&| NIL NIL
                |BasicType&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|Field|) (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 115) (|Algebra| 6)
                 (|Ring|) (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 115) (|NonAssociativeAlgebra| 6)
                 (|SemiRng|) (|Module| $$) (|Module| 115) (|Module| 6)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 115 115)
                 (|BiModule| 6 6) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| $$) (|LeftModule| 115) (|RightModule| 115)
                 (|LeftModule| 6) (|RightModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|) (|Magma|)
                 (|SetCategory|) (|CommutativeStar|) (|CoercibleTo| 95)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|))
              (|makeByteWordVec2| 115
                                  '(1 9 0 0 10 2 6 11 0 0 12 2 6 11 0 0 13 2 9
                                    0 14 0 15 1 0 9 9 16 2 6 11 0 0 17 2 9 0 0
                                    0 18 2 6 0 0 0 19 2 6 0 0 20 21 3 6 23 0 0
                                    0 24 0 6 0 26 2 6 0 0 0 27 2 9 0 0 0 28 2 6
                                    29 0 0 30 0 6 0 32 0 35 0 36 2 35 11 0 0 37
                                    1 35 40 0 41 2 6 42 43 0 44 1 46 20 0 48 0
                                    46 0 49 2 46 11 0 0 50 1 46 6 0 51 1 46 0 0
                                    52 0 6 20 54 1 6 0 56 57 1 59 0 6 60 2 59 0
                                    6 6 61 2 59 0 0 0 62 1 64 35 0 65 1 35 6 0
                                    66 1 6 67 0 68 1 64 35 0 69 1 35 6 0 70 2
                                    35 0 6 0 71 1 59 0 0 74 1 59 6 0 75 1 59 6
                                    0 76 1 35 0 6 77 1 46 0 6 85 2 46 0 6 20 86
                                    2 46 0 0 0 87 2 46 0 0 0 88 2 59 11 0 0 89
                                    1 6 0 0 90 1 6 95 0 96 1 20 95 0 97 2 95 0
                                    0 0 98 2 95 0 0 0 99 2 95 0 0 0 100 2 102
                                    95 101 0 103 1 6 105 0 106 1 0 0 59 107 2 0
                                    11 0 0 1 1 0 11 0 1 1 0 6 0 83 1 0 110 0 1
                                    1 0 0 0 1 1 0 11 0 1 2 0 67 0 0 1 1 0 0 0 1
                                    1 0 105 0 1 2 0 11 0 0 1 0 0 0 1 1 0 67 0 1
                                    2 0 0 0 109 1 2 0 0 0 20 1 2 0 0 0 0 1 1 0
                                    67 0 81 2 0 0 0 0 1 1 0 112 43 1 1 0 11 0 1
                                    2 0 0 0 109 1 2 0 0 6 35 78 1 1 0 59 107 2
                                    0 46 6 6 47 1 0 0 0 53 2 0 11 0 0 1 1 0 11
                                    0 1 1 0 56 0 82 2 0 42 43 0 1 1 0 67 0 1 2
                                    0 0 0 109 1 2 0 0 0 20 1 2 0 111 0 0 1 1 0
                                    0 43 1 2 0 0 0 0 1 1 0 108 0 1 1 0 0 0 1 1
                                    0 9 9 16 2 0 113 113 113 1 2 0 0 0 0 1 1 0
                                    0 43 1 1 0 9 0 84 1 0 105 0 1 3 0 23 0 0 0
                                    1 2 0 114 0 0 1 2 0 67 0 0 80 2 0 42 43 0 1
                                    1 0 20 0 1 2 0 29 0 0 1 1 0 0 0 45 2 0 0 0
                                    0 1 1 0 95 0 104 1 0 0 56 58 1 0 0 0 1 1 0
                                    0 115 1 1 0 0 6 33 1 0 59 0 63 1 0 0 64 72
                                    0 0 20 55 3 0 0 0 0 0 1 2 0 11 0 0 1 2 0 0
                                    0 0 1 2 0 11 0 0 1 2 0 0 0 109 1 2 0 0 0 20
                                    1 2 0 0 0 56 1 0 0 0 25 0 0 0 31 2 0 11 0 0
                                    73 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 91 2 0 0
                                    0 0 94 2 0 0 109 0 1 2 0 0 0 0 79 2 0 0 56
                                    0 93 2 0 0 20 0 1 2 0 0 115 0 1 2 0 0 0 115
                                    1 2 0 0 0 6 1 2 0 0 6 0 92)))))
           '|lookupComplete|)) 
