
(SDEFUN |PFR;copypf| ((|a| $) ($ $))
        (CONS (QCAR |a|) (SPADCALL (QCDR |a|) (QREFELT $ 10)))) 

(SDEFUN |PFR;LessThan|
        ((|s| |Record| (|:| |num| R) (|:| |den| (|Factored| R)))
         (|t| |Record| (|:| |num| R) (|:| |den| (|Factored| R))) ($ |Boolean|))
        (NULL (GGREATERP (QCDR |s|) (QCDR |t|)))) 

(SDEFUN |PFR;multiplyFracTerms|
        ((|s| |Record| (|:| |num| R) (|:| |den| (|Factored| R)))
         (|t| |Record| (|:| |num| R) (|:| |den| (|Factored| R))) ($ $))
        (SPROG
         ((|d| ($)) (|c| ($))
          (|coefs| (|Record| (|:| |coef1| R) (|:| |coef2| R)))
          (|i| (|Union| (|Record| (|:| |coef1| R) (|:| |coef2| R)) "failed")))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (QCDR |s|) 1 (QREFELT $ 14))
                      (SPADCALL (QCDR |t|) 1 (QREFELT $ 14)) (QREFELT $ 16))
            (|PFR;normalizeFracTerm|
             (CONS (SPADCALL (QCAR |s|) (QCAR |t|) (QREFELT $ 17))
                   (SPADCALL (QCDR |s|) (QCDR |t|) (QREFELT $ 18)))
             $))
           (#1='T
            (SEQ
             (LETT |i|
                   (SPADCALL (SPADCALL (QCDR |t|) (QREFELT $ 19))
                             (SPADCALL (QCDR |s|) (QREFELT $ 19))
                             (SPADCALL (QCAR |s|) (QCAR |t|) (QREFELT $ 17))
                             (QREFELT $ 22))
                   . #2=(|PFR;multiplyFracTerms|))
             (EXIT
              (COND ((QEQCAR |i| 1) (|error| "PartialFraction: not in ideal"))
                    (#1#
                     (SEQ (LETT |coefs| (QCDR |i|) . #2#)
                          (LETT |c| (|PFR;copypf| (|spadConstant| $ 23) $)
                                . #2#)
                          (COND
                           ((SPADCALL (QCDR |coefs|) (|spadConstant| $ 24)
                                      (QREFELT $ 25))
                            (LETT |c|
                                  (|PFR;normalizeFracTerm|
                                   (CONS (QCDR |coefs|) (QCDR |t|)) $)
                                  . #2#)))
                          (COND
                           ((SPADCALL (QCAR |coefs|) (|spadConstant| $ 24)
                                      (QREFELT $ 25))
                            (SEQ
                             (LETT |d|
                                   (|PFR;normalizeFracTerm|
                                    (CONS (QCAR |coefs|) (QCDR |s|)) $)
                                   . #2#)
                             (PROGN
                              (RPLACA |c|
                                      (SPADCALL (QCAR |c|) (QCAR |d|)
                                                (QREFELT $ 26)))
                              (QCAR |c|))
                             (EXIT
                              (COND
                               ((NULL (NULL (QCDR |d|)))
                                (PROGN
                                 (RPLACD |c|
                                         (SPADCALL (QCDR |d|) (QCDR |c|)
                                                   (QREFELT $ 27)))
                                 (QCDR |c|))))))))
                          (EXIT |c|))))))))))) 

(SDEFUN |PFR;normalizeFracTerm|
        ((|s| |Record| (|:| |num| R) (|:| |den| (|Factored| R))) ($ $))
        (SPROG
         ((|q| #1=(|Record| (|:| |quotient| R) (|:| |remainder| R)))
          (|expon| (|Integer|)) (|nexpon| (|Integer|)) (|f| (R)) (|qr| #1#))
         (SEQ
          (LETT |qr|
                (SPADCALL (QCAR |s|) (SPADCALL (QCDR |s|) (QREFELT $ 19))
                          (QREFELT $ 29))
                . #2=(|PFR;normalizeFracTerm|))
          (EXIT
           (COND
            ((SPADCALL (QCDR |qr|) (|spadConstant| $ 24) (QREFELT $ 16))
             (CONS (QCAR |qr|) NIL))
            (#3='T
             (SEQ (LETT |f| (SPADCALL (QCDR |s|) 1 (QREFELT $ 14)) . #2#)
                  (LETT |nexpon| (SPADCALL (QCDR |s|) 1 (QREFELT $ 30)) . #2#)
                  (LETT |expon| 0 . #2#)
                  (LETT |q| (SPADCALL (QCDR |qr|) |f| (QREFELT $ 29)) . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND
                           ((SPADCALL (QCDR |q|) (|spadConstant| $ 24)
                                      (QREFELT $ 16))
                            (< |expon| |nexpon|))
                           ('T NIL)))
                         (GO G191)))
                       (SEQ (LETT |expon| (+ |expon| 1) . #2#)
                            (PROGN (RPLACD |qr| (QCAR |q|)) (QCDR |qr|))
                            (EXIT
                             (LETT |q|
                                   (SPADCALL (QCDR |qr|) |f| (QREFELT $ 29))
                                   . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((EQL |expon| 0)
                     (CONS (QCAR |qr|) (LIST (CONS (QCDR |qr|) (QCDR |s|)))))
                    ((EQL |expon| |nexpon|)
                     (SPADCALL
                      (SPADCALL (QCAR |qr|) (QCDR |qr|) (QREFELT $ 26))
                      (QREFELT $ 32)))
                    (#3#
                     (CONS (QCAR |qr|)
                           (LIST
                            (CONS (QCDR |qr|)
                                  (SPADCALL |f| (- |nexpon| |expon|)
                                            (QREFELT $ 33))))))))))))))) 

(SDEFUN |PFR;partialFractionNormalized| ((|nm| R) (|dn| |Factored| R) ($ $))
        (SPROG
         ((|c| ($)) (|d| ($)) (#1=#:G786 NIL) (|i| NIL)
          (|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))))
         (SEQ
          (COND
           ((SPADCALL |nm| (|spadConstant| $ 24) (QREFELT $ 16))
            (|spadConstant| $ 23))
           ((SPADCALL |dn| (|spadConstant| $ 34) (QREFELT $ 35))
            (SPADCALL |nm| (QREFELT $ 32)))
           ('T
            (SEQ
             (LETT |qr|
                   (SPADCALL |nm| (SPADCALL |dn| (QREFELT $ 19))
                             (QREFELT $ 29))
                   . #2=(|PFR;partialFractionNormalized|))
             (LETT |c|
                   (CONS (|spadConstant| $ 24)
                         (LIST
                          (CONS (QCDR |qr|)
                                (SPADCALL (SPADCALL |dn| 1 (QREFELT $ 14))
                                          (SPADCALL |dn| 1 (QREFELT $ 30))
                                          (QREFELT $ 33)))))
                   . #2#)
             (SEQ (LETT |i| 2 . #2#)
                  (LETT #1# (SPADCALL |dn| (QREFELT $ 37)) . #2#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (LETT |d|
                         (CONS (|spadConstant| $ 24)
                               (LIST
                                (CONS (|spadConstant| $ 31)
                                      (SPADCALL
                                       (SPADCALL |dn| |i| (QREFELT $ 14))
                                       (SPADCALL |dn| |i| (QREFELT $ 30))
                                       (QREFELT $ 33)))))
                         . #2#)
                   (EXIT (LETT |c| (SPADCALL |c| |d| (QREFELT $ 38)) . #2#)))
                  (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL (SPADCALL (QCAR |qr|) (QREFELT $ 32)) |c|
                        (QREFELT $ 39))))))))) 

(SDEFUN |PFR;padicFraction;2$;6| ((|a| $) ($ $))
        (SPROG
         ((|d| (|Integer|)) (|sp| (|SparseUnivariatePolynomial| R))
          (|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R)))))
          (|f| (R)) (|e| (|Integer|)) (#1=#:G800 NIL) (|s| NIL) (|b| ($)))
         (SEQ
          (LETT |b| (SPADCALL |a| (QREFELT $ 40))
                . #2=(|PFR;padicFraction;2$;6|))
          (EXIT
           (COND ((NULL (QCDR |b|)) |b|)
                 ('T
                  (SEQ (LETT |l| NIL . #2#)
                       (SEQ (LETT |s| NIL . #2#) (LETT #1# (QCDR |b|) . #2#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |e| (SPADCALL (QCDR |s|) 1 (QREFELT $ 30))
                                   . #2#)
                             (EXIT
                              (COND
                               ((EQL |e| 1) (LETT |l| (CONS |s| |l|) . #2#))
                               ('T
                                (SEQ
                                 (LETT |f|
                                       (SPADCALL (QCDR |s|) 1 (QREFELT $ 14))
                                       . #2#)
                                 (LETT |d|
                                       (SPADCALL
                                        (LETT |sp|
                                              (SPADCALL |f| (QCAR |s|)
                                                        (QREFELT $ 42))
                                              . #2#)
                                        (QREFELT $ 43))
                                       . #2#)
                                 (EXIT
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (SPADCALL |sp| (|spadConstant| $ 44)
                                                    (QREFELT $ 45)))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |l|
                                              (CONS
                                               (CONS
                                                (SPADCALL |sp| (QREFELT $ 46))
                                                (SPADCALL |f| (- |e| |d|)
                                                          (QREFELT $ 33)))
                                               |l|)
                                              . #2#)
                                        (EXIT
                                         (LETT |d|
                                               (SPADCALL
                                                (LETT |sp|
                                                      (SPADCALL |sp|
                                                                (QREFELT $ 47))
                                                      . #2#)
                                                (QREFELT $ 43))
                                               . #2#)))
                                       NIL (GO G190) G191 (EXIT NIL))))))))
                            (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (CONS (QCAR |b|)
                              (SPADCALL (CONS (|function| |PFR;LessThan|) $)
                                        |l| (QREFELT $ 49))))))))))) 

(SDEFUN |PFR;compactFraction;2$;7| ((|a| $) ($ $))
        (SPROG
         ((|b| ($)) (|e| (|Integer|)) (|f| (R))
          (|s| (|Record| (|:| |num| R) (|:| |den| (|Factored| R))))
          (|bf| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R)))))
          (|bw| (R)) (#1=#:G806 NIL) (#2=#:G814 NIL) (|t| NIL)
          (|af| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R))))))
         (SEQ
          (COND ((SPADCALL 2 (LENGTH (QCDR |a|)) (QREFELT $ 51)) |a|)
                ('T
                 (SEQ
                  (LETT |af| (REVERSE (QCDR |a|))
                        . #3=(|PFR;compactFraction;2$;7|))
                  (LETT |bf| NIL . #3#) (LETT |bw| (QCAR |a|) . #3#)
                  (LETT |s|
                        (CONS (QCAR (|SPADfirst| |af|))
                              (QCDR (|SPADfirst| |af|)))
                        . #3#)
                  (LETT |f| (SPADCALL (QCDR |s|) 1 (QREFELT $ 14)) . #3#)
                  (LETT |e| (SPADCALL (QCDR |s|) 1 (QREFELT $ 30)) . #3#)
                  (SEQ (LETT |t| NIL . #3#) (LETT #2# (CDR |af|) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |f| (SPADCALL (QCDR |t|) 1 (QREFELT $ 14))
                                     (QREFELT $ 16))
                           (PROGN
                            (RPLACA |s|
                                    (SPADCALL (QCAR |s|)
                                              (SPADCALL (QCAR |t|)
                                                        (SPADCALL |f|
                                                                  (PROG1
                                                                      (LETT #1#
                                                                            (-
                                                                             |e|
                                                                             (SPADCALL
                                                                              (QCDR
                                                                               |t|)
                                                                              1
                                                                              (QREFELT
                                                                               $
                                                                               30)))
                                                                            . #3#)
                                                                    (|check_subtype2|
                                                                     (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                                  (QREFELT $
                                                                           52))
                                                        (QREFELT $ 17))
                                              (QREFELT $ 26)))
                            (QCAR |s|)))
                          ('T
                           (SEQ
                            (LETT |b| (|PFR;normalizeFracTerm| |s| $) . #3#)
                            (LETT |bw|
                                  (SPADCALL |bw| (QCAR |b|) (QREFELT $ 26))
                                  . #3#)
                            (COND
                             ((NULL (NULL (QCDR |b|)))
                              (LETT |bf| (CONS (|SPADfirst| (QCDR |b|)) |bf|)
                                    . #3#)))
                            (LETT |s| (CONS (QCAR |t|) (QCDR |t|)) . #3#)
                            (LETT |f| (SPADCALL (QCDR |s|) 1 (QREFELT $ 14))
                                  . #3#)
                            (EXIT
                             (LETT |e| (SPADCALL (QCDR |s|) 1 (QREFELT $ 30))
                                   . #3#)))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (LETT |b| (|PFR;normalizeFracTerm| |s| $) . #3#)
                  (EXIT
                   (CONS (SPADCALL |bw| (QCAR |b|) (QREFELT $ 26))
                         (SPADCALL (QCDR |b|) |bf| (QREFELT $ 27)))))))))) 

(SDEFUN |PFR;Zero;$;8| (($ $)) (CONS (|spadConstant| $ 24) NIL)) 

(SDEFUN |PFR;One;$;9| (($ $)) (CONS (|spadConstant| $ 31) NIL)) 

(SDEFUN |PFR;characteristic;Nni;10| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 53))) 

(PUT '|PFR;coerce;R$;11| '|SPADreplace| '(XLAM (|r|) (CONS |r| NIL))) 

(SDEFUN |PFR;coerce;R$;11| ((|r| R) ($ $)) (CONS |r| NIL)) 

(SDEFUN |PFR;coerce;I$;12| ((|n| |Integer|) ($ $))
        (CONS (SPADCALL |n| (QREFELT $ 55)) NIL)) 

(SDEFUN |PFR;coerce;$F;13| ((|a| $) ($ |Fraction| R))
        (SPROG ((|q| (|Fraction| R)) (#1=#:G832 NIL) (|s| NIL))
               (SEQ
                (LETT |q| (SPADCALL (QCAR |a|) (QREFELT $ 58))
                      . #2=(|PFR;coerce;$F;13|))
                (SEQ (LETT |s| NIL . #2#) (LETT #1# (QCDR |a|) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |q|
                             (SPADCALL |q|
                                       (SPADCALL (QCAR |s|)
                                                 (SPADCALL (QCDR |s|)
                                                           (QREFELT $ 19))
                                                 (QREFELT $ 59))
                                       (QREFELT $ 60))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |q|)))) 

(SDEFUN |PFR;coerce;F$;14| ((|q| |Fraction| (|Factored| R)) ($ $))
        (SPROG ((|r1| (R)) (|u| (R)) (#1=#:G835 NIL))
               (SEQ
                (LETT |u|
                      (PROG2
                          (LETT #1#
                                (SPADCALL
                                 (SPADCALL (SPADCALL |q| (QREFELT $ 63))
                                           (QREFELT $ 64))
                                 (QREFELT $ 66))
                                . #2=(|PFR;coerce;F$;14|))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                        (|Union| (QREFELT $ 6) "failed") #1#))
                      . #2#)
                (LETT |r1|
                      (SPADCALL |u|
                                (SPADCALL (SPADCALL |q| (QREFELT $ 67))
                                          (QREFELT $ 19))
                                (QREFELT $ 17))
                      . #2#)
                (EXIT
                 (|PFR;partialFractionNormalized| |r1|
                  (SPADCALL |u| (SPADCALL |q| (QREFELT $ 63)) (QREFELT $ 68))
                  $))))) 

(SDEFUN |PFR;exquo;2$U;15| ((|a| $) (|b| $) ($ |Union| $ "failed"))
        (SPROG ((|br| (|Fraction| R)))
               (SEQ
                (COND
                 ((SPADCALL |b| (|spadConstant| $ 23) (QREFELT $ 70))
                  (CONS 1 "failed"))
                 ((SPADCALL |b| (|spadConstant| $ 11) (QREFELT $ 70))
                  (CONS 0 |a|))
                 ('T
                  (SEQ
                   (LETT |br|
                         (SPADCALL (SPADCALL |b| (QREFELT $ 61))
                                   (QREFELT $ 71))
                         |PFR;exquo;2$U;15|)
                   (EXIT
                    (CONS 0
                          (SPADCALL |a|
                                    (SPADCALL (SPADCALL |br| (QREFELT $ 72))
                                              (SPADCALL
                                               (SPADCALL |br| (QREFELT $ 73))
                                               (QREFELT $ 74))
                                              (QREFELT $ 75))
                                    (QREFELT $ 38)))))))))) 

(SDEFUN |PFR;recip;$U;16| ((|a| $) ($ |Union| $ "failed"))
        (SPADCALL (|spadConstant| $ 11) |a| (QREFELT $ 76))) 

(SDEFUN |PFR;firstDenom;$F;17| ((|a| $) ($ |Factored| R))
        (COND ((NULL (QCDR |a|)) (|spadConstant| $ 34))
              ('T (QCDR (|SPADfirst| (QCDR |a|)))))) 

(SDEFUN |PFR;firstNumer;$R;18| ((|a| $) ($ R))
        (COND ((NULL (QCDR |a|)) (|spadConstant| $ 24))
              ('T (QCAR (|SPADfirst| (QCDR |a|)))))) 

(SDEFUN |PFR;numberOfFractionalTerms;$I;19| ((|a| $) ($ |Integer|))
        (LENGTH (QCDR |a|))) 

(SDEFUN |PFR;nthFractionalTerm;$I$;20| ((|a| $) (|n| |Integer|) ($ $))
        (SPROG
         ((|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R))))))
         (SEQ (LETT |l| (QCDR |a|) |PFR;nthFractionalTerm;$I$;20|)
              (COND
               ((OR (< |n| 1) (SPADCALL |n| (LENGTH |l|) (QREFELT $ 81)))
                (EXIT (|spadConstant| $ 23))))
              (EXIT
               (CONS (|spadConstant| $ 24)
                     (LIST (SPADCALL |l| |n| (QREFELT $ 82)))))))) 

(PUT '|PFR;wholePart;$R;21| '|SPADreplace| 'QCAR) 

(SDEFUN |PFR;wholePart;$R;21| ((|a| $) ($ R)) (QCAR |a|)) 

(SDEFUN |PFR;fractionalTerms;$L;22| ((|a| $) ($ |List| (|Fraction| R)))
        (SPROG
         ((#1=#:G879 NIL) (|x| NIL) (#2=#:G878 NIL)
          (|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R))))))
         (SEQ (LETT |l| (QCDR |a|) . #3=(|PFR;fractionalTerms;$L;22|))
              (EXIT
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |x| NIL . #3#) (LETT #1# |l| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (SPADCALL (QCAR |x|)
                                        (SPADCALL (QCDR |x|) (QREFELT $ 19))
                                        (QREFELT $ 59))
                              #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |PFR;partialFraction;RF$;23| ((|nm| R) (|dn| |Factored| R) ($ $))
        (SPROG ((|u| (R)) (#1=#:G881 NIL))
               (SEQ
                (COND
                 ((SPADCALL |nm| (|spadConstant| $ 24) (QREFELT $ 16))
                  (|spadConstant| $ 23))
                 ('T
                  (SEQ
                   (LETT |u| (SPADCALL |dn| (QREFELT $ 64))
                         . #2=(|PFR;partialFraction;RF$;23|))
                   (LETT |u|
                         (PROG2 (LETT #1# (SPADCALL |u| (QREFELT $ 66)) . #2#)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                           (|Union| (QREFELT $ 6) "failed")
                                           #1#))
                         . #2#)
                   (EXIT
                    (|PFR;partialFractionNormalized|
                     (SPADCALL |u| |nm| (QREFELT $ 17))
                     (SPADCALL |u| |dn| (QREFELT $ 68)) $)))))))) 

(SDEFUN |PFR;padicallyExpand;2RSup;24|
        ((|p| R) (|r| R) ($ |SparseUnivariatePolynomial| R))
        (SPROG ((|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))))
               (SEQ
                (LETT |qr| (SPADCALL |r| |p| (QREFELT $ 29))
                      |PFR;padicallyExpand;2RSup;24|)
                (EXIT
                 (COND
                  ((SPADCALL (QCAR |qr|) (|spadConstant| $ 24) (QREFELT $ 16))
                   (SPADCALL (QCDR |qr|) (QREFELT $ 87)))
                  ('T
                   (SPADCALL (SPADCALL (QCDR |qr|) (QREFELT $ 87))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 31) 1 (QREFELT $ 88))
                              (SPADCALL |p| (QCAR |qr|) (QREFELT $ 42))
                              (QREFELT $ 89))
                             (QREFELT $ 90)))))))) 

(SDEFUN |PFR;=;2$B;25| ((|a| $) (|b| $) ($ |Boolean|))
        (COND ((SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 25)) NIL)
              ((NULL (QCDR |a|))
               (COND
                ((NULL (QCDR |b|))
                 (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 16)))
                (#1='T NIL)))
              ((NULL (QCDR |b|)) NIL)
              (#1#
               (SPADCALL (SPADCALL |a| (QREFELT $ 61))
                         (SPADCALL |b| (QREFELT $ 61)) (QREFELT $ 91))))) 

(SDEFUN |PFR;-;2$;26| ((|a| $) ($ $))
        (SPROG
         ((|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R)))))
          (#1=#:G902 NIL) (|s| NIL))
         (SEQ (LETT |l| NIL . #2=(|PFR;-;2$;26|))
              (SEQ (LETT |s| NIL . #2#) (LETT #1# (REVERSE (QCDR |a|)) . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |l|
                           (CONS
                            (CONS (SPADCALL (QCAR |s|) (QREFELT $ 92))
                                  (QCDR |s|))
                            |l|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (SPADCALL (QCAR |a|) (QREFELT $ 92)) |l|))))) 

(SDEFUN |PFR;*;R2$;27| ((|r| R) (|a| $) ($ $))
        (SPROG ((#1=#:G912 NIL) (|c| ($)) (#2=#:G913 NIL) (|s| NIL) (|b| ($)))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 24) (QREFELT $ 16))
                  (|spadConstant| $ 23))
                 ((SPADCALL |r| (|spadConstant| $ 31) (QREFELT $ 16)) |a|)
                 ('T
                  (SEQ
                   (LETT |b|
                         (SPADCALL (SPADCALL |r| (QCAR |a|) (QREFELT $ 17))
                                   (QREFELT $ 32))
                         . #3=(|PFR;*;R2$;27|))
                   (SEQ (LETT |s| NIL . #3#)
                        (LETT #2# (REVERSE (QCDR |a|)) . #3#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |s| (CAR #2#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ
                           (LETT |c|
                                 (|PFR;normalizeFracTerm|
                                  (CONS
                                   (SPADCALL |r| (QCAR |s|) (QREFELT $ 17))
                                   (QCDR |s|))
                                  $)
                                 . #3#)
                           (PROGN
                            (RPLACA |b|
                                    (SPADCALL (QCAR |b|) (QCAR |c|)
                                              (QREFELT $ 26)))
                            (QCAR |b|))
                           (EXIT
                            (COND
                             ((NULL (NULL (QCDR |c|)))
                              (PROGN
                               (LETT #1#
                                     (PROGN
                                      (RPLACD |b|
                                              (SPADCALL (QCDR |c|) (QCDR |b|)
                                                        (QREFELT $ 27)))
                                      (QCDR |b|))
                                     . #3#)
                               (GO #4=#:G906)))))))
                         #4# (EXIT #1#))
                        (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                   (EXIT |b|))))))) 

(SDEFUN |PFR;*;I2$;28| ((|n| |Integer|) (|a| $) ($ $))
        (SPADCALL (SPADCALL |n| (QREFELT $ 55)) |a| (QREFELT $ 94))) 

(SDEFUN |PFR;+;3$;29| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (CONS (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 26))
               (SPADCALL (CONS (|function| |PFR;LessThan|) $)
                         (SPADCALL (QCDR |a|)
                                   (SPADCALL (QCDR |b|) (QREFELT $ 10))
                                   (QREFELT $ 27))
                         (QREFELT $ 49)))
         (QREFELT $ 40))) 

(SDEFUN |PFR;*;3$;30| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|c| ($)) (#1=#:G929 NIL) (|t| NIL) (#2=#:G928 NIL) (|s| NIL)
          (|af| ($)))
         (SEQ
          (COND ((NULL (QCDR |a|)) (SPADCALL (QCAR |a|) |b| (QREFELT $ 94)))
                ((NULL (QCDR |b|)) (SPADCALL (QCAR |b|) |a| (QREFELT $ 94)))
                ('T
                 (SEQ
                  (LETT |af| (CONS (|spadConstant| $ 24) (QCDR |a|))
                        . #3=(|PFR;*;3$;30|))
                  (LETT |c|
                        (SPADCALL (SPADCALL (QCAR |a|) |b| (QREFELT $ 94))
                                  (SPADCALL (QCAR |b|) |af| (QREFELT $ 94))
                                  (QREFELT $ 39))
                        . #3#)
                  (SEQ (LETT |s| NIL . #3#) (LETT #2# (QCDR |a|) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |t| NIL . #3#) (LETT #1# (QCDR |b|) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |c|
                                      (SPADCALL |c|
                                                (|PFR;multiplyFracTerms| |s|
                                                 |t| $)
                                                (QREFELT $ 39))
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT |c|))))))) 

(SDEFUN |PFR;coerce;$Of;31| ((|a| $) ($ |OutputForm|))
        (SPROG ((|l| (|List| (|OutputForm|))) (#1=#:G942 NIL) (|s| NIL))
               (SEQ
                (COND ((NULL (QCDR |a|)) (SPADCALL (QCAR |a|) (QREFELT $ 97)))
                      (#2='T
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |a|) (|spadConstant| $ 24)
                                    (QREFELT $ 16))
                          (LETT |l| NIL . #3=(|PFR;coerce;$Of;31|)))
                         (#2#
                          (LETT |l| (LIST (SPADCALL (QCAR |a|) (QREFELT $ 97)))
                                . #3#)))
                        (SEQ (LETT |s| NIL . #3#) (LETT #1# (QCDR |a|) . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (QCDR |s|) (|spadConstant| $ 34)
                                           (QREFELT $ 35))
                                 (LETT |l|
                                       (CONS
                                        (SPADCALL (QCAR |s|) (QREFELT $ 97))
                                        |l|)
                                       . #3#))
                                ('T
                                 (LETT |l|
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL (QCAR |s|) (QREFELT $ 97))
                                         (SPADCALL (QCDR |s|) (QREFELT $ 98))
                                         (QREFELT $ 99))
                                        |l|)
                                       . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND ((EQL (LENGTH |l|) 1) (|SPADfirst| |l|))
                               (#2#
                                (SPADCALL (ELT $ 100) (REVERSE |l|)
                                          (QREFELT $ 103))))))))))) 

(SDEFUN |PFR;partialFraction;F$;32| ((|f| |Fraction| R) ($ $))
        (SPADCALL (SPADCALL |f| (QREFELT $ 72))
                  (SPADCALL (SPADCALL |f| (QREFELT $ 73)) (QREFELT $ 106))
                  (QREFELT $ 75))) 

(DECLAIM (NOTINLINE |PartialFraction;|)) 

(DEFUN |PartialFraction| (#1=#:G951)
  (SPROG NIL
         (PROG (#2=#:G952)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PartialFraction|)
                                               '|domainEqualList|)
                    . #3=(|PartialFraction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|PartialFraction;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PartialFraction|)))))))))) 

(DEFUN |PartialFraction;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PartialFraction|))
          (LETT |dv$| (LIST '|PartialFraction| DV$1) . #1#)
          (LETT $ (GETREFV 120) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|UniqueFactorizationDomain|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|PartialFraction| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |whole| |#1|)
                              (|:| |fract|
                                   (|List|
                                    (|Record| (|:| |num| |#1|)
                                              (|:| |den|
                                                   (|Factored| |#1|)))))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 107
                      (CONS (|dispatchFunction| |PFR;partialFraction;F$;32|)
                            $))))
          $))) 

(MAKEPROP '|PartialFraction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Record| (|:| |num| 6) (|:| |den| 13)) (|List| 8) (0 . |copy|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PFR;One;$;9|) $))
              (|Integer|) (|Factored| 6) (5 . |nthFactor|) (|Boolean|) (11 . =)
              (17 . *) (23 . *) (29 . |expand|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 20 '#1="failed") (34 . |extendedEuclidean|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PFR;Zero;$;8|) $))
              (41 . |Zero|) (45 . ~=) (51 . +) (57 . |append|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (63 . |divide|)
              (69 . |nthExponent|) (75 . |One|) |PFR;coerce;R$;11|
              (79 . |nilFactor|) (85 . |One|) (89 . =) (|NonNegativeInteger|)
              (95 . |numberOfFactors|) |PFR;*;3$;30| |PFR;+;3$;29|
              |PFR;compactFraction;2$;7| (|SparseUnivariatePolynomial| 6)
              |PFR;padicallyExpand;2RSup;24| (100 . |degree|) (105 . |Zero|)
              (109 . ~=) (115 . |leadingCoefficient|) (120 . |reductum|)
              (|Mapping| 15 8 8) (125 . |sort|) |PFR;padicFraction;2$;6|
              (131 . >) (137 . ^) (143 . |characteristic|)
              |PFR;characteristic;Nni;10| (147 . |coerce|) |PFR;coerce;I$;12|
              (|Fraction| 6) (152 . |coerce|) (157 . /) (163 . +)
              |PFR;coerce;$F;13| (|Fraction| 13) (169 . |denom|) (174 . |unit|)
              (|Union| $ '"failed") (179 . |recip|) (184 . |numer|) (189 . *)
              |PFR;coerce;F$;14| |PFR;=;2$B;25| (195 . |inv|) (200 . |numer|)
              (205 . |denom|) (210 . |coerce|) |PFR;partialFraction;RF$;23|
              |PFR;exquo;2$U;15| |PFR;recip;$U;16| |PFR;firstDenom;$F;17|
              |PFR;firstNumer;$R;18| |PFR;numberOfFractionalTerms;$I;19|
              (215 . >) (221 . |elt|) |PFR;nthFractionalTerm;$I$;20|
              |PFR;wholePart;$R;21| (|List| 57) |PFR;fractionalTerms;$L;22|
              (227 . |coerce|) (232 . |monomial|) (238 . *) (244 . +) (250 . =)
              (256 . -) |PFR;-;2$;26| |PFR;*;R2$;27| |PFR;*;I2$;28|
              (|OutputForm|) (261 . |coerce|) (266 . |coerce|) (271 . /)
              (277 . +) (|Mapping| 96 96 96) (|List| 96) (283 . |reduce|)
              |PFR;coerce;$Of;31| (|Factored| $) (289 . |factor|)
              (294 . |partialFraction|) (|Fraction| 12) (|Union| 110 '#1#)
              (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef| 110) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 299 |zero?| 305 |wholePart| 310 |unitNormal| 315
              |unitCanonical| 320 |unit?| 325 |subtractIfCan| 330
              |squareFreePart| 336 |squareFree| 341 |sizeLess?| 346 |sample|
              352 |rightRecip| 356 |rightPower| 361 |rem| 373 |recip| 379 |quo|
              384 |principalIdeal| 390 |prime?| 395 |partialFraction| 400
              |padicallyExpand| 411 |padicFraction| 417 |opposite?| 422 |one?|
              428 |numberOfFractionalTerms| 433 |nthFractionalTerm| 438
              |multiEuclidean| 444 |leftRecip| 450 |leftPower| 455 |lcmCoef|
              467 |lcm| 473 |latex| 484 |inv| 489 |hashUpdate!| 494 |hash| 500
              |gcdPolynomial| 505 |gcd| 511 |fractionalTerms| 522 |firstNumer|
              527 |firstDenom| 532 |factor| 537 |extendedEuclidean| 542 |exquo|
              555 |expressIdealMember| 561 |euclideanSize| 567 |divide| 572
              |compactFraction| 578 |commutator| 583 |coerce| 589
              |characteristic| 624 |associator| 628 |associates?| 635
              |antiCommutator| 641 |annihilate?| 647 ^ 653 |Zero| 671 |One| 675
              = 679 / 685 - 691 + 702 * 708)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0))
            (CONS
             '#(|Field&| |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| NIL |DivisionRing&| NIL NIL |Algebra&| |Algebra&|
                |EntireRing&| |Algebra&| NIL |Rng&| NIL |Module&| |Module&|
                |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Magma&| |AbelianSemiGroup&| |SetCategory&| NIL NIL NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|Field|) (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 6) (|Algebra| 108) (|EntireRing|) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|SemiRing|) (|Module| 6) (|Module| 108)
                 (|Module| $$) (|SemiRng|) (|BiModule| 6 6)
                 (|BiModule| 108 108) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|RightModule| 6) (|LeftModule| 6) (|RightModule| 108)
                 (|LeftModule| 108) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 96))
              (|makeByteWordVec2| 119
                                  '(1 9 0 0 10 2 13 6 0 12 14 2 6 15 0 0 16 2 6
                                    0 0 0 17 2 13 0 0 0 18 1 13 6 0 19 3 6 21 0
                                    0 0 22 0 6 0 24 2 6 15 0 0 25 2 6 0 0 0 26
                                    2 9 0 0 0 27 2 6 28 0 0 29 2 13 12 0 12 30
                                    0 6 0 31 2 13 0 6 12 33 0 13 0 34 2 13 15 0
                                    0 35 1 13 36 0 37 1 41 36 0 43 0 41 0 44 2
                                    41 15 0 0 45 1 41 6 0 46 1 41 0 0 47 2 9 0
                                    48 0 49 2 36 15 0 0 51 2 6 0 0 36 52 0 6 36
                                    53 1 6 0 12 55 1 57 0 6 58 2 57 0 6 6 59 2
                                    57 0 0 0 60 1 62 13 0 63 1 13 6 0 64 1 6 65
                                    0 66 1 62 13 0 67 2 13 0 6 0 68 1 57 0 0 71
                                    1 57 6 0 72 1 57 6 0 73 1 13 0 6 74 2 12 15
                                    0 0 81 2 9 8 0 12 82 1 41 0 6 87 2 41 0 6
                                    36 88 2 41 0 0 0 89 2 41 0 0 0 90 2 57 15 0
                                    0 91 1 6 0 0 92 1 6 96 0 97 1 13 96 0 98 2
                                    96 0 0 0 99 2 96 0 0 0 100 2 102 96 101 0
                                    103 1 6 105 0 106 1 0 0 57 107 2 0 15 0 0 1
                                    1 0 15 0 1 1 0 6 0 84 1 0 115 0 1 1 0 0 0 1
                                    1 0 15 0 1 2 0 65 0 0 1 1 0 0 0 1 1 0 105 0
                                    1 2 0 15 0 0 1 0 0 0 1 1 0 65 0 1 2 0 0 0
                                    36 1 2 0 0 0 116 1 2 0 0 0 0 1 1 0 65 0 77
                                    2 0 0 0 0 1 1 0 112 110 1 1 0 15 0 1 1 1 0
                                    57 107 2 0 0 6 13 75 2 0 41 6 6 42 1 0 0 0
                                    50 2 0 15 0 0 1 1 0 15 0 1 1 0 12 0 80 2 0
                                    0 0 12 83 2 0 109 110 0 1 1 0 65 0 1 2 0 0
                                    0 36 1 2 0 0 0 116 1 2 0 114 0 0 1 1 0 0
                                    110 1 2 0 0 0 0 1 1 0 117 0 1 1 0 0 0 1 2 0
                                    119 119 0 1 1 0 118 0 1 2 0 113 113 113 1 2
                                    0 0 0 0 1 1 0 0 110 1 1 0 85 0 86 1 0 6 0
                                    79 1 0 13 0 78 1 0 105 0 1 3 0 21 0 0 0 1 2
                                    0 111 0 0 1 2 0 65 0 0 76 2 0 109 110 0 1 1
                                    0 36 0 1 2 0 28 0 0 1 1 0 0 0 40 2 0 0 0 0
                                    1 1 0 0 62 69 1 0 57 0 61 1 0 0 6 32 1 0 0
                                    108 1 1 0 0 0 1 1 0 0 12 56 1 0 96 0 104 0
                                    0 36 54 3 0 0 0 0 0 1 2 0 15 0 0 1 2 0 0 0
                                    0 1 2 0 15 0 0 1 2 0 0 0 12 1 2 0 0 0 36 1
                                    2 0 0 0 116 1 0 0 0 23 0 0 0 11 2 0 15 0 0
                                    70 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 93 2 0 0
                                    0 0 39 2 0 0 6 0 94 2 0 0 0 6 1 2 0 0 0 108
                                    1 2 0 0 108 0 1 2 0 0 36 0 1 2 0 0 12 0 95
                                    2 0 0 0 0 38 2 0 0 116 0 1)))))
           '|lookupComplete|)) 
