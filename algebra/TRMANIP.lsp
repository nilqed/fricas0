
(SDEFUN |TRMANIP;expandTrigProducts;2F;1| ((|e| (F)) (% (F)))
        (SPADCALL (LIST (QREFELT % 29) (QREFELT % 30) (QREFELT % 31)) |e| 10
                  (QREFELT % 35))) 

(SDEFUN |TRMANIP;logArgs| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|sum| (F)) (|arg| (F))
          (|prod|
           (|Union|
            (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| F)))
            "failed"))
          (#1=#:G53 NIL) (|term| NIL))
         (SEQ (LETT |sum| (|spadConstant| % 37))
              (LETT |arg| (|spadConstant| % 38))
              (SEQ (LETT |term| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |term| '|log| (QREFELT % 40))
                       (LETT |arg|
                             (SPADCALL |arg|
                                       (SPADCALL
                                        (|SPADfirst|
                                         (SPADCALL
                                          (|SPADfirst|
                                           (SPADCALL |term| (QREFELT % 42)))
                                          (QREFELT % 45)))
                                        (QREFELT % 46))
                                       (QREFELT % 21))))
                      ('T
                       (SEQ (LETT |prod| (SPADCALL |term| (QREFELT % 49)))
                            (COND
                             ((QEQCAR |prod| 0)
                              (COND
                               ((SPADCALL (QCDR (QCDR |prod|)) '|log|
                                          (QREFELT % 50))
                                (EXIT
                                 (LETT |arg|
                                       (SPADCALL |arg|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|SPADfirst|
                                                    (SPADCALL
                                                     (QCDR (QCDR |prod|))
                                                     (QREFELT % 45)))
                                                   (QCAR (QCDR |prod|))
                                                   (QREFELT % 51))
                                                  (QREFELT % 46))
                                                 (QREFELT % 21))))))))
                            (EXIT
                             (LETT |sum|
                                   (SPADCALL |sum| |term|
                                             (QREFELT % 22)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |sum| (SPADCALL |arg| (QREFELT % 52))
                         (QREFELT % 22)))))) 

(SDEFUN |TRMANIP;simplifyLog;2F;3| ((|e| (F)) (% (F)))
        (SPADCALL (|TRMANIP;simplifyLog1| (SPADCALL |e| (QREFELT % 53)) %)
                  (|TRMANIP;simplifyLog1| (SPADCALL |e| (QREFELT % 54)) %)
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;simplifyLog1| ((|e| (F)) (% (F)))
        (SPROG
         ((#1=#:G93 NIL) (#2=#:G92 (F)) (#3=#:G94 (F)) (#4=#:G105 NIL)
          (#5=#:G1 NIL) (|terms| (|List| F)) (|foundLog| (|Boolean|))
          (#6=#:G85 NIL) (#7=#:G84 (F)) (#8=#:G86 (F)) (#9=#:G104 NIL)
          (#10=#:G0 NIL) (|args| (|List| F)) (|i| (|NonNegativeInteger|))
          (|nterms| (|List| F)) (|exprs| (|List| F)) (#11=#:G103 NIL)
          (|term| NIL) (#12=#:G102 NIL) (#13=#:G101 NIL) (#14=#:G100 NIL)
          (|u| NIL) (#15=#:G99 NIL) (|kers| (|List| (|Kernel| F)))
          (|expt|
           (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|)))
                    #16="failed"))
          (|termList| (|Union| (|List| F) #16#))
          (|prod|
           (|Union|
            (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| F)))
            #16#)))
         (SEQ
          (COND ((SPADCALL |e| '|log| (QREFELT % 55)) |e|)
                (#17='T
                 (SEQ (LETT |prod| (SPADCALL |e| (QREFELT % 49)))
                      (COND
                       ((QEQCAR |prod| 0)
                        (COND
                         ((SPADCALL (QCDR (QCDR |prod|)) (QREFELT % 14)
                                    (QREFELT % 56))
                          (EXIT
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (|SPADfirst|
                               (SPADCALL (QCDR (QCDR |prod|)) (QREFELT % 45)))
                              (QCAR (QCDR |prod|)) (QREFELT % 51))
                             (QREFELT % 46))
                            (QREFELT % 52)))))))
                      (LETT |termList| (SPADCALL |e| (QREFELT % 58)))
                      (EXIT
                       (COND
                        ((QEQCAR |termList| 1)
                         (SEQ (LETT |terms| (SPADCALL |e| (QREFELT % 59)))
                              (EXIT
                               (COND
                                ((QEQCAR |terms| 1)
                                 (SEQ
                                  (LETT |expt| (SPADCALL |e| (QREFELT % 62)))
                                  (COND
                                   ((QEQCAR |expt| 0)
                                    (COND
                                     ((NULL (EQL (QCDR (QCDR |expt|)) 1))
                                      (EXIT
                                       (SPADCALL
                                        (SPADCALL (QCAR (QCDR |expt|))
                                                  (QREFELT % 46))
                                        (QCDR (QCDR |expt|))
                                        (QREFELT % 51)))))))
                                  (LETT |kers| (SPADCALL |e| (QREFELT % 42)))
                                  (COND
                                   ((NULL (EQL (LENGTH |kers|) 1)) (EXIT |e|)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL (|SPADfirst| |kers|)
                                              (QREFELT % 63))
                                    (PROGN
                                     (LETT #15# NIL)
                                     (SEQ (LETT |u| NIL)
                                          (LETT #14#
                                                (SPADCALL (|SPADfirst| |kers|)
                                                          (QREFELT % 45)))
                                          G190
                                          (COND
                                           ((OR (ATOM #14#)
                                                (PROGN
                                                 (LETT |u| (CAR #14#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #15#
                                                  (CONS
                                                   (SPADCALL |u|
                                                             (QREFELT % 46))
                                                   #15#))))
                                          (LETT #14# (CDR #14#)) (GO G190) G191
                                          (EXIT (NREVERSE #15#))))
                                    (QREFELT % 65)))))
                                (#17# (|TRMANIP;logArgs| (QCDR |terms|) %))))))
                        (#17#
                         (SEQ
                          (LETT |terms|
                                (PROGN
                                 (LETT #13# NIL)
                                 (SEQ (LETT |term| NIL)
                                      (LETT #12# (QCDR |termList|)) G190
                                      (COND
                                       ((OR (ATOM #12#)
                                            (PROGN
                                             (LETT |term| (CAR #12#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #13#
                                              (CONS
                                               (SPADCALL |term| (QREFELT % 46))
                                               #13#))))
                                      (LETT #12# (CDR #12#)) (GO G190) G191
                                      (EXIT (NREVERSE #13#)))))
                          (LETT |exprs| NIL) (LETT |nterms| NIL)
                          (SEQ (LETT |term| NIL) (LETT #11# |terms|) G190
                               (COND
                                ((OR (ATOM #11#)
                                     (PROGN (LETT |term| (CAR #11#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((QEQCAR (SPADCALL |term| (QREFELT % 67)) 0)
                                   (LETT |exprs| (CONS |term| |exprs|)))
                                  ('T
                                   (LETT |nterms| (CONS |term| |nterms|))))))
                               (LETT #11# (CDR #11#)) (GO G190) G191
                               (EXIT NIL))
                          (LETT |terms| |nterms|)
                          (COND
                           ((NULL (NULL |exprs|))
                            (SEQ (LETT |foundLog| NIL) (LETT |i| 0)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND (|foundLog| NIL)
                                               ('T (< |i| (LENGTH |terms|)))))
                                        (GO G191)))
                                      (SEQ (LETT |i| (+ |i| 1))
                                           (EXIT
                                            (COND
                                             ((SPADCALL
                                               (SPADCALL |terms| |i|
                                                         (QREFELT % 69))
                                               '|log| (QREFELT % 40))
                                              (SEQ
                                               (LETT |args|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |terms| |i|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 71))
                                                      (QREFELT % 45)))
                                               (SPADCALL |terms| |i|
                                                         (SPADCALL
                                                          (|TRMANIP;simplifyLog1|
                                                           (SPADCALL
                                                            (|SPADfirst|
                                                             |args|)
                                                            (PROGN
                                                             (LETT #6# NIL)
                                                             (SEQ
                                                              (LETT #10# NIL)
                                                              (LETT #9#
                                                                    |exprs|)
                                                              G190
                                                              (COND
                                                               ((OR (ATOM #9#)
                                                                    (PROGN
                                                                     (LETT #10#
                                                                           (CAR
                                                                            #9#))
                                                                     NIL))
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (PROGN
                                                                 (LETT #8#
                                                                       #10#)
                                                                 (COND
                                                                  (#6#
                                                                   (LETT #7#
                                                                         (SPADCALL
                                                                          #7#
                                                                          #8#
                                                                          (QREFELT
                                                                           %
                                                                           21))))
                                                                  ('T
                                                                   (PROGN
                                                                    (LETT #7#
                                                                          #8#)
                                                                    (LETT #6#
                                                                          'T)))))))
                                                              (LETT #9#
                                                                    (CDR #9#))
                                                              (GO G190) G191
                                                              (EXIT NIL))
                                                             (COND (#6# #7#)
                                                                   ('T
                                                                    (|spadConstant|
                                                                     % 38))))
                                                            (QREFELT % 72))
                                                           %)
                                                          (QREFELT % 52))
                                                         (QREFELT % 73))
                                               (EXIT (LETT |foundLog| 'T)))))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT
                                  (COND
                                   ((NULL |foundLog|)
                                    (LETT |terms|
                                          (SPADCALL |exprs| |terms|
                                                    (QREFELT % 74)))))))))
                          (EXIT
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT #5# NIL) (LETT #4# |terms|) G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT #5# (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3# #5#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #3# (QREFELT % 21))))
                                     ('T
                                      (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                                 (LETT #4# (CDR #4#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#)
                                  (#17# (|spadConstant| % 38))))))))))))))) 

(SDEFUN |TRMANIP;simplify;2F;5| ((|x| (F)) (% (F)))
        (SPADCALL (|TRMANIP;simplify0| |x| %) (QREFELT % 76))) 

(SDEFUN |TRMANIP;simplify;2F;6| ((|x| (F)) (% (F))) (|TRMANIP;simplify0| |x| %)) 

(SDEFUN |TRMANIP;expandpow| ((|k| (|Kernel| F)) (|f| (|Mapping| F F)) (% (F)))
        (SPROG ((|de| (F)) (|ne| (F)) (|b| (F)) (|a| (F)) (|arg| (|List| F)))
               (SEQ
                (LETT |a|
                      (SPADCALL
                       (|SPADfirst| (LETT |arg| (SPADCALL |k| (QREFELT % 45))))
                       |f|))
                (LETT |b| (SPADCALL (SPADCALL |arg| (QREFELT % 78)) |f|))
                (LETT |ne|
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT % 80))
                                  (|spadConstant| % 82) (QREFELT % 83))
                        (|spadConstant| % 38))
                       (#1='T
                        (SPADCALL
                         (SPADCALL (SPADCALL |a| (QREFELT % 80))
                                   (QREFELT % 84))
                         |b| (QREFELT % 72)))))
                (LETT |de|
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT % 85))
                                  (|spadConstant| % 82) (QREFELT % 83))
                        (|spadConstant| % 38))
                       (#1#
                        (SPADCALL
                         (SPADCALL (SPADCALL |a| (QREFELT % 85))
                                   (QREFELT % 84))
                         (SPADCALL |b| (QREFELT % 86)) (QREFELT % 72)))))
                (EXIT (SPADCALL |ne| |de| (QREFELT % 21)))))) 

(SDEFUN |TRMANIP;termexp|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPROG
         ((|res| (F)) (#1=#:G139 NIL) (|item| NIL)
          (|l|
           (|List|
            (|Record| (|:| |degree| (|NonNegativeInteger|)) (|:| |f| F)
                      (|:| |base| F) (|:| |expt| F))))
          (#2=#:G135 NIL)
          (|lnew|
           (|List|
            (|Record| (|:| |degree| (|NonNegativeInteger|)) (|:| |f| F)
                      (|:| |base| F) (|:| |expt| F))))
          (|coef| (F)) (|f| (F)) (|expt| (F)) (|base| (F)) (#3=#:G138 NIL)
          (|u| NIL) (#4=#:G137 NIL) (|d| (|NonNegativeInteger|))
          (|args| (|List| F)) (#5=#:G136 NIL) (|k| NIL)
          (|lk| (|List| (|Kernel| F))))
         (SEQ (LETT |lk| (SPADCALL |p| (QREFELT % 88)))
              (EXIT
               (COND ((NULL |lk|) (SPADCALL |p| (QREFELT % 84)))
                     ('T
                      (SEQ (LETT |l| NIL)
                           (SEQ (LETT |k| NIL) (LETT #5# |lk|) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |k| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |d| (SPADCALL |p| |k| (QREFELT % 90)))
                                 (LETT |args| (SPADCALL |k| (QREFELT % 45)))
                                 (COND
                                  ((SPADCALL |k| (QREFELT % 13) (QREFELT % 56))
                                   (SEQ
                                    (LETT |base|
                                          (SPADCALL (|spadConstant| % 38)
                                                    (QREFELT % 91)))
                                    (LETT |expt|
                                          (SPADCALL
                                           (SPADCALL |d| (|SPADfirst| |args|)
                                                     (QREFELT % 92))
                                           (QREFELT % 93)))
                                    (LETT |d| 1)
                                    (EXIT
                                     (LETT |f|
                                           (SPADCALL |expt| (QREFELT % 91))))))
                                  ((SPADCALL |k| '|%power| (QREFELT % 50))
                                   (SEQ
                                    (LETT |base|
                                          (SPADCALL (|SPADfirst| |args|)
                                                    (QREFELT % 93)))
                                    (LETT |expt|
                                          (SPADCALL
                                           (SPADCALL |d|
                                                     (SPADCALL |args|
                                                               (QREFELT % 78))
                                                     (QREFELT % 92))
                                           (QREFELT % 93)))
                                    (LETT |d| 1)
                                    (EXIT
                                     (LETT |f|
                                           (SPADCALL |base| |expt|
                                                     (QREFELT % 72))))))
                                  ('T
                                   (SEQ
                                    (LETT |base|
                                          (SPADCALL
                                           (SPADCALL |k| (QREFELT % 63))
                                           (PROGN
                                            (LETT #4# NIL)
                                            (SEQ (LETT |u| NIL)
                                                 (LETT #3# |args|) G190
                                                 (COND
                                                  ((OR (ATOM #3#)
                                                       (PROGN
                                                        (LETT |u| (CAR #3#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #4#
                                                         (CONS
                                                          (SPADCALL |u|
                                                                    (QREFELT %
                                                                             93))
                                                          #4#))))
                                                 (LETT #3# (CDR #3#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #4#))))
                                           (QREFELT % 94)))
                                    (LETT |expt| (|spadConstant| % 38))
                                    (EXIT (LETT |f| |base|)))))
                                 (EXIT
                                  (LETT |l|
                                        (CONS (VECTOR |d| |f| |base| |expt|)
                                              |l|))))
                                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                           (LETT |coef|
                                 (SPADCALL (SPADCALL |p| (QREFELT % 95))
                                           (QREFELT % 96)))
                           (LETT |l|
                                 (CONS
                                  (VECTOR 1 |coef| |coef|
                                          (|spadConstant| % 38))
                                  |l|))
                           (LETT |l| (|TRMANIP;powersimp| |l| %))
                           (SEQ
                            (EXIT
                             (SEQ G190 NIL
                                  (SEQ
                                   (LETT |lnew| (|TRMANIP;powersimp| |l| %))
                                   (EXIT
                                    (COND
                                     ((EQL (LENGTH |l|) (LENGTH |lnew|))
                                      (PROGN (LETT #2# 1) (GO #6=#:G129)))
                                     ('T (LETT |l| |lnew|)))))
                                  NIL (GO G190) G191 (EXIT NIL)))
                            #6# (EXIT #2#))
                           (LETT |res| (|spadConstant| % 38))
                           (SEQ (LETT |item| NIL) (LETT #1# |lnew|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |item| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |res|
                                        (SPADCALL |res|
                                                  (SPADCALL (QVELT |item| 1)
                                                            (QVELT |item| 0)
                                                            (QREFELT % 51))
                                                  (QREFELT % 21)))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |TRMANIP;expandPower;2F;9| ((|f| (F)) (% (F)))
        (SPROG
         ((#1=#:G147 NIL) (|k| NIL) (#2=#:G146 NIL)
          (|l| (|List| (|Kernel| F))))
         (SEQ
          (LETT |l|
                (SPADCALL (CONS #'|TRMANIP;expandPower;2F;9!0| %)
                          (SPADCALL |f| (QREFELT % 42)) (QREFELT % 98)))
          (EXIT
           (SPADCALL |f| |l|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |k| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (|TRMANIP;expandpow| |k| (ELT % 99) %)
                                         #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT % 100)))))) 

(SDEFUN |TRMANIP;expandPower;2F;9!0| ((|z1| NIL) (% NIL))
        (SPADCALL |z1| '|%power| (QREFELT % 50))) 

(SDEFUN |TRMANIP;powersimp|
        ((|l|
          (|List|
           (|Record| (|:| |degree| (|NonNegativeInteger|)) (|:| |f| F)
                     (|:| |base| F) (|:| |expt| F))))
         (%
          (|List|
           (|Record| (|:| |degree| (|NonNegativeInteger|)) (|:| |f| F)
                     (|:| |base| F) (|:| |expt| F)))))
        (SPROG ((|lbase| (|List| F)) (#1=#:G156 NIL) (|x| NIL) (#2=#:G155 NIL))
               (SEQ
                (LETT |lbase|
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |x| NIL) (LETT #1# |l|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL (QVELT |x| 3) (QREFELT % 101)))
                                 (LETT #2# (CONS (QVELT |x| 2) #2#))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT % 102)))
                (LETT |lbase|
                      (SPADCALL (CONS #'|TRMANIP;powersimp!0| %) |lbase|
                                (QREFELT % 106)))
                (EXIT (|TRMANIP;powersimpAux| |l| |lbase| %))))) 

(SDEFUN |TRMANIP;powersimp!0| ((|a| NIL) (|b| NIL) (% NIL))
        (SPADCALL (SPADCALL |a| (QREFELT % 103)) (SPADCALL |b| (QREFELT % 103))
                  (QREFELT % 104))) 

(SDEFUN |TRMANIP;powersimpAux|
        ((|l|
          (|List|
           (|Record| (|:| |degree| (|NonNegativeInteger|)) (|:| |f| F)
                     (|:| |base| F) (|:| |expt| F))))
         (|lbase| (|List| F))
         (%
          (|List|
           (|Record| (|:| |degree| (|NonNegativeInteger|)) (|:| |f| F)
                     (|:| |base| F) (|:| |expt| F)))))
        (SPROG
         ((|expt| (F))
          (|lrest|
           (|List|
            (|Record| (|:| |degree| (|NonNegativeInteger|)) (|:| |f| F)
                      (|:| |base| F) (|:| |expt| F))))
          (#1=#:G165 NIL) (|item| NIL) (|base| (F)))
         (SEQ
          (COND ((NULL |lbase|) |l|)
                ('T
                 (SEQ (LETT |base| (|SPADfirst| |lbase|))
                      (LETT |expt| (|spadConstant| % 37)) (LETT |lrest| NIL)
                      (SEQ (LETT |item| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |item| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QVELT |item| 2) |base|
                                         (QREFELT % 107))
                               (LETT |expt|
                                     (SPADCALL |expt|
                                               (SPADCALL (QVELT |item| 0)
                                                         (QVELT |item| 3)
                                                         (QREFELT % 108))
                                               (QREFELT % 22))))
                              ((SPADCALL (QVELT |item| 1) |base|
                                         (QREFELT % 107))
                               (LETT |expt|
                                     (SPADCALL |expt|
                                               (SPADCALL (QVELT |item| 0)
                                                         (QREFELT % 25))
                                               (QREFELT % 22))))
                              ((SPADCALL
                                (SPADCALL (QVELT |item| 1) (QVELT |item| 0)
                                          (QREFELT % 51))
                                |base| (QREFELT % 107))
                               (LETT |expt|
                                     (SPADCALL |expt| (|spadConstant| % 38)
                                               (QREFELT % 22))))
                              ('T (LETT |lrest| (CONS |item| |lrest|))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |expt| (SPADCALL |expt| (QREFELT % 93)))
                      (EXIT
                       (CONS
                        (VECTOR 1 (SPADCALL |base| |expt| (QREFELT % 72))
                                |base| |expt|)
                        (|TRMANIP;powersimpAux| |lrest| (CDR |lbase|) %))))))))) 

(SDEFUN |TRMANIP;t2t| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 20)) (SPADCALL |x| (QREFELT % 19))
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;c2t| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 19)) (SPADCALL |x| (QREFELT % 20))
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;c2s| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 20)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;s2c| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 19)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;s2c2| ((|x| (F)) (% (F)))
        (SPADCALL (|spadConstant| % 38)
                  (SPADCALL (SPADCALL |x| (QREFELT % 19)) 2 (QREFELT % 51))
                  (QREFELT % 23))) 

(SDEFUN |TRMANIP;th2th| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 110)) (SPADCALL |x| (QREFELT % 111))
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;ch2th| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 111)) (SPADCALL |x| (QREFELT % 110))
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;ch2sh| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 110)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;sh2ch| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 111)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;sh2ch2| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 111)) 2 (QREFELT % 51))
                  (|spadConstant| % 38) (QREFELT % 23))) 

(SDEFUN |TRMANIP;ueval|
        ((|x| (F)) (|s| (|Symbol|)) (|f| (|Mapping| F F)) (% (F)))
        (SPADCALL |x| |s| |f| (QREFELT % 113))) 

(SDEFUN |TRMANIP;ueval2|
        ((|x| (F)) (|s| (|Symbol|)) (|f| (|Mapping| F F)) (% (F)))
        (SPADCALL |x| |s| 2 |f| (QREFELT % 114))) 

(SDEFUN |TRMANIP;cos2sec;2F;24| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|cos| (CONS #'|TRMANIP;cos2sec;2F;24!0| %) %)) 

(SDEFUN |TRMANIP;cos2sec;2F;24!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 115)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;sin2csc;2F;25| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|sin| (CONS #'|TRMANIP;sin2csc;2F;25!0| %) %)) 

(SDEFUN |TRMANIP;sin2csc;2F;25!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 117)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;csc2sin;2F;26| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|csc| (CONS (|function| |TRMANIP;c2s|) %) %)) 

(SDEFUN |TRMANIP;sec2cos;2F;27| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|sec| (CONS (|function| |TRMANIP;s2c|) %) %)) 

(SDEFUN |TRMANIP;tan2cot;2F;28| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|tan| (CONS #'|TRMANIP;tan2cot;2F;28!0| %) %)) 

(SDEFUN |TRMANIP;tan2cot;2F;28!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 121)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;cot2tan;2F;29| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|cot| (CONS #'|TRMANIP;cot2tan;2F;29!0| %) %)) 

(SDEFUN |TRMANIP;cot2tan;2F;29!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 123)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;tan2trig;2F;30| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|tan| (CONS (|function| |TRMANIP;t2t|) %) %)) 

(SDEFUN |TRMANIP;cot2trig;2F;31| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|cot| (CONS (|function| |TRMANIP;c2t|) %) %)) 

(SDEFUN |TRMANIP;cosh2sech;2F;32| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|cosh| (CONS #'|TRMANIP;cosh2sech;2F;32!0| %) %)) 

(SDEFUN |TRMANIP;cosh2sech;2F;32!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 127)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;sinh2csch;2F;33| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|sinh| (CONS #'|TRMANIP;sinh2csch;2F;33!0| %) %)) 

(SDEFUN |TRMANIP;sinh2csch;2F;33!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 129)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;csch2sinh;2F;34| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|csch| (CONS (|function| |TRMANIP;ch2sh|) %) %)) 

(SDEFUN |TRMANIP;sech2cosh;2F;35| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|sech| (CONS (|function| |TRMANIP;sh2ch|) %) %)) 

(SDEFUN |TRMANIP;tanh2coth;2F;36| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|tanh| (CONS #'|TRMANIP;tanh2coth;2F;36!0| %) %)) 

(SDEFUN |TRMANIP;tanh2coth;2F;36!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 133)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;coth2tanh;2F;37| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|coth| (CONS #'|TRMANIP;coth2tanh;2F;37!0| %) %)) 

(SDEFUN |TRMANIP;coth2tanh;2F;37!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 135)) (QREFELT % 109))) 

(SDEFUN |TRMANIP;tanh2trigh;2F;38| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|tanh| (CONS (|function| |TRMANIP;th2th|) %) %)) 

(SDEFUN |TRMANIP;coth2trigh;2F;39| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|coth| (CONS (|function| |TRMANIP;ch2th|) %) %)) 

(SDEFUN |TRMANIP;removeCosSq;2F;40| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval2| |x| '|cos| (CONS #'|TRMANIP;removeCosSq;2F;40!0| %)
         %)) 

(SDEFUN |TRMANIP;removeCosSq;2F;40!0| ((|z1| NIL) (% NIL))
        (SPADCALL (|spadConstant| % 38)
                  (SPADCALL (SPADCALL |z1| (QREFELT % 20)) 2 (QREFELT % 51))
                  (QREFELT % 23))) 

(SDEFUN |TRMANIP;removeSinSq;2F;41| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval2| |x| '|sin| (CONS (|function| |TRMANIP;s2c2|) %) %)) 

(SDEFUN |TRMANIP;removeCoshSq;2F;42| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval2| |x| '|cosh| (CONS #'|TRMANIP;removeCoshSq;2F;42!0| %)
         %)) 

(SDEFUN |TRMANIP;removeCoshSq;2F;42!0| ((|z1| NIL) (% NIL))
        (SPADCALL (|spadConstant| % 38)
                  (SPADCALL (SPADCALL |z1| (QREFELT % 110)) 2 (QREFELT % 51))
                  (QREFELT % 22))) 

(SDEFUN |TRMANIP;removeSinhSq;2F;43| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval2| |x| '|sinh| (CONS (|function| |TRMANIP;sh2ch2|) %) %)) 

(SDEFUN |TRMANIP;expandLog;2F;44| ((|x| (F)) (% (F)))
        (SPADCALL (|TRMANIP;smplog| (SPADCALL |x| (QREFELT % 80)) %)
                  (|TRMANIP;smplog| (SPADCALL |x| (QREFELT % 85)) %)
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;expand;2F;45| ((|x| (F)) (% (F)))
        (SPADCALL (|TRMANIP;smpexpand| (SPADCALL |x| (QREFELT % 80)) %)
                  (|TRMANIP;smpexpand| (SPADCALL |x| (QREFELT % 85)) %)
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;smpexpand|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPADCALL (CONS (|function| |TRMANIP;kerexpand|) %) (ELT % 96) |p|
                  (QREFELT % 148))) 

(SDEFUN |TRMANIP;smplog|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPADCALL (CONS (|function| |TRMANIP;logexpand|) %) (ELT % 96) |p|
                  (QREFELT % 148))) 

(SDEFUN |TRMANIP;smp2htrigs|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPADCALL (CONS #'|TRMANIP;smp2htrigs!0| %) (ELT % 96) |p|
                  (QREFELT % 148))) 

(SDEFUN |TRMANIP;smp2htrigs!0| ((|k1| NIL) (% NIL))
        (SPADCALL (SPADCALL |k1| (QREFELT % 149)) (QREFELT % 150))) 

(SDEFUN |TRMANIP;simplifyExp;2F;49| ((|x| (F)) (% (F)))
        (SPROG
         ((#1=#:G246 NIL)
          (|term| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#2=#:G250 NIL) (|k1| NIL) (#3=#:G247 NIL) (#4=#:G249 NIL)
          (|h| (|NonNegativeInteger|)) (|args| (|List| F))
          (|op| (|BasicOperator|)) (#5=#:G248 NIL) (|k2| NIL)
          (|lk2| #6=(|List| (|Kernel| F))) (|lk1| #6#)
          (|q| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (|f| (F)))
         (SEQ
          (LETT |f|
                (SPADCALL (|TRMANIP;smpexp| (SPADCALL |x| (QREFELT % 80)) %)
                          (|TRMANIP;smpexp| (SPADCALL |x| (QREFELT % 85)) %)
                          (QREFELT % 26)))
          (LETT |p| (SPADCALL |f| (QREFELT % 80)))
          (LETT |q| (SPADCALL |f| (QREFELT % 85)))
          (COND
           ((SPADCALL |p| (QREFELT % 151))
            (COND ((NULL (SPADCALL |q| (QREFELT % 151))) (EXIT |f|))))
           ('T (EXIT |f|)))
          (LETT |lk1| (SPADCALL |p| (QREFELT % 88)))
          (LETT |lk2| (SPADCALL |q| (QREFELT % 88)))
          (LETT |term| (|spadConstant| % 82))
          (SEQ (LETT |k2| NIL) (LETT #5# |lk2|) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |k2| (CAR #5#)) NIL)) (GO G191)))
               (SEQ (LETT |op| (SPADCALL |k2| (QREFELT % 63)))
                    (LETT |args| (SPADCALL |k2| (QREFELT % 45)))
                    (LETT |h| (SPADCALL |k2| (QREFELT % 152)))
                    (COND
                     ((SPADCALL |op| (QREFELT % 13) (QREFELT % 153))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k1| NIL) (LETT #4# |lk1|) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |k1| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |k1| (QREFELT % 13) (QREFELT % 56))
                                 (SEQ
                                  (LETT |term|
                                        (SPADCALL |term|
                                                  (SPADCALL
                                                   (SPADCALL |op|
                                                             (LIST
                                                              (SPADCALL
                                                               (SPADCALL |args|
                                                                         1
                                                                         (QREFELT
                                                                          %
                                                                          69))
                                                               (QREFELT % 86)))
                                                             |h|
                                                             (QREFELT % 154))
                                                   (QREFELT % 155))
                                                  (QREFELT % 156)))
                                  (EXIT
                                   (PROGN (LETT #3# 1) (GO #7=#:G236))))))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
                       #7# (EXIT #3#))))
                    (EXIT
                     (COND
                      ((SPADCALL |op| '|%power| (QREFELT % 157))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |k1| NIL) (LETT #2# |lk1|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |k1| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |k1| '|%power| (QREFELT % 50))
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |args| 1 (QREFELT % 69))
                                     (|SPADfirst|
                                      (SPADCALL |k1| (QREFELT % 45)))
                                     (QREFELT % 107))
                                    (SEQ
                                     (LETT |term|
                                           (SPADCALL |term|
                                                     (SPADCALL
                                                      (SPADCALL |op|
                                                                (LIST
                                                                 (SPADCALL
                                                                  |args| 1
                                                                  (QREFELT %
                                                                           69))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |args| 2
                                                                   (QREFELT %
                                                                            69))
                                                                  (QREFELT %
                                                                           86)))
                                                                |h|
                                                                (QREFELT %
                                                                         154))
                                                      (QREFELT % 155))
                                                     (QREFELT % 156)))
                                     (EXIT
                                      (PROGN
                                       (LETT #1# 1)
                                       (GO #8=#:G241))))))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))
                        #8# (EXIT #1#))))))
               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (|TRMANIP;termexp| (SPADCALL |p| |term| (QREFELT % 156)) %)
            (|TRMANIP;termexp| (SPADCALL |q| |term| (QREFELT % 156)) %)
            (QREFELT % 26)))))) 

(SDEFUN |TRMANIP;htrigs;2F;50| ((|f| (F)) (% (F)))
        (SPROG
         ((|g1| (F)) (|b| (|Integer|)) (|g2| (F)) (|a| (F))
          (|den|
           #1=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|num| #1#) (|arg| (|List| F)) (#2=#:G261 NIL) (|x| NIL)
          (#3=#:G260 NIL) (|op| (|BasicOperator|)) (|k| (|Kernel| F))
          (|m| (|Union| (|Kernel| F) "failed")))
         (SEQ (LETT |m| (SPADCALL |f| (QREFELT % 159)))
              (EXIT
               (COND ((QEQCAR |m| 1) |f|)
                     (#4='T
                      (SEQ
                       (LETT |op|
                             (SPADCALL (LETT |k| (QCDR |m|)) (QREFELT % 63)))
                       (LETT |arg|
                             (PROGN
                              (LETT #3# NIL)
                              (SEQ (LETT |x| NIL)
                                   (LETT #2# (SPADCALL |k| (QREFELT % 45)))
                                   G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |x| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #3#
                                           (CONS (SPADCALL |x| (QREFELT % 150))
                                                 #3#))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #3#)))))
                       (LETT |num|
                             (SPADCALL (SPADCALL |f| (QREFELT % 80)) |k|
                                       (QREFELT % 161)))
                       (LETT |den|
                             (SPADCALL (SPADCALL |f| (QREFELT % 85)) |k|
                                       (QREFELT % 161)))
                       (EXIT
                        (COND
                         ((SPADCALL |op| (QREFELT % 13) (QREFELT % 153))
                          (SEQ
                           (LETT |g1|
                                 (SPADCALL
                                  (SPADCALL (LETT |a| (|SPADfirst| |arg|))
                                            (QREFELT % 111))
                                  (SPADCALL |a| (QREFELT % 110))
                                  (QREFELT % 22)))
                           (LETT |g2|
                                 (SPADCALL (SPADCALL |a| (QREFELT % 111))
                                           (SPADCALL |a| (QREFELT % 110))
                                           (QREFELT % 23)))
                           (EXIT
                            (SPADCALL
                             (|TRMANIP;supexp| |num| |g1| |g2|
                              (LETT |b|
                                    (QUOTIENT2 (SPADCALL |num| (QREFELT % 163))
                                               2))
                              %)
                             (|TRMANIP;supexp| |den| |g1| |g2| |b| %)
                             (QREFELT % 26)))))
                         (#4#
                          (SPADCALL
                           (|TRMANIP;sup2htrigs| |num|
                            (LETT |g1| (SPADCALL |op| |arg| (QREFELT % 65))) %)
                           (|TRMANIP;sup2htrigs| |den| |g1| %)
                           (QREFELT % 26)))))))))))) 

(SDEFUN |TRMANIP;supexp|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (|f1| (F)) (|f2| (F)) (|bse| (|Integer|)) (% (F)))
        (SPROG ((|ans| (F)) (|d| (|Integer|)) (|g| (F)))
               (SEQ (LETT |ans| (|spadConstant| % 37))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| % 165)
                                      (QREFELT % 166)))
                           (GO G191)))
                         (SEQ
                          (LETT |g|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |p| (QREFELT % 167))
                                           (QREFELT % 84))
                                 (QREFELT % 150)))
                          (SEQ
                           (LETT |d| (- (SPADCALL |p| (QREFELT % 163)) |bse|))
                           (EXIT
                            (COND
                             ((>= |d| 0)
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f1| |d|
                                                                  (QREFELT %
                                                                           51))
                                                        (QREFELT % 21))
                                              (QREFELT % 22))))
                             ('T
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f2| (- |d|)
                                                                  (QREFELT %
                                                                           51))
                                                        (QREFELT % 21))
                                              (QREFELT % 22)))))))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 168)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |TRMANIP;sup2htrigs|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (|f| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (CONS (|function| |TRMANIP;smp2htrigs|) %) |p|
                   (QREFELT % 172))
         |f| (QREFELT % 173))) 

(SDEFUN |TRMANIP;exlog|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPROG
         ((#1=#:G273 NIL) (#2=#:G272 (F)) (#3=#:G274 (F)) (#4=#:G276 NIL)
          (|r| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |r| NIL)
                (LETT #4#
                      (SPADCALL (SPADCALL |p| (QREFELT % 175))
                                (QREFELT % 180)))
                G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCAR |r|)
                                   (SPADCALL
                                    (SPADCALL (QCDR |r|) (QREFELT % 84))
                                    (QREFELT % 52))
                                   (QREFELT % 108)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 22))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 37))))))) 

(SDEFUN |TRMANIP;logexpand| ((|k| (|Kernel| F)) (% (F)))
        (SPROG
         ((#1=#:G283 NIL) (#2=#:G282 NIL) (|x| (F)) (|op| (|BasicOperator|)))
         (SEQ
          (COND
           ((SPADCALL (LETT |op| (SPADCALL |k| (QREFELT % 63)))
                      (QREFELT % 181))
            (SPADCALL |k| (QREFELT % 149)))
           ((SPADCALL |op| '|log| (QREFELT % 157))
            (SPADCALL
             (|TRMANIP;exlog|
              (SPADCALL
               (LETT |x|
                     (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT % 45)))
                               (QREFELT % 143)))
               (QREFELT % 80))
              %)
             (|TRMANIP;exlog| (SPADCALL |x| (QREFELT % 85)) %) (QREFELT % 23)))
           ('T
            (SPADCALL |op|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT #1# (SPADCALL |k| (QREFELT % 45))) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |x| (QREFELT % 143))
                                          #2#))))
                            (LETT #1# (CDR #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT % 65))))))) 

(SDEFUN |TRMANIP;kerexpand| ((|k| (|Kernel| F)) (% (F)))
        (SPROG
         ((#1=#:G306 NIL) (#2=#:G305 NIL) (#3=#:G304 NIL) (#4=#:G303 NIL)
          (|ctb| (F)) (|cta| (F)) (|tb| (F)) (|ta| (F)) (|a| (F)) (|b| (F))
          (|den| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| F))) (|x| (F))
          (|arg| (F)) (|op| (|BasicOperator|)))
         (SEQ
          (COND
           ((SPADCALL (LETT |op| (SPADCALL |k| (QREFELT % 63)))
                      (QREFELT % 181))
            (SPADCALL |k| (QREFELT % 149)))
           ((SPADCALL |op| '|%power| (QREFELT % 157))
            (|TRMANIP;expandpow| |k| (ELT % 144) %))
           (#5='T
            (SEQ (LETT |arg| (|SPADfirst| (SPADCALL |k| (QREFELT % 45))))
                 (EXIT
                  (COND
                   ((SPADCALL |op| '|sec| (QREFELT % 157))
                    (SPADCALL
                     (SPADCALL (SPADCALL |arg| (QREFELT % 19)) (QREFELT % 144))
                     (QREFELT % 109)))
                   ((SPADCALL |op| '|csc| (QREFELT % 157))
                    (SPADCALL
                     (SPADCALL (SPADCALL |arg| (QREFELT % 20)) (QREFELT % 144))
                     (QREFELT % 109)))
                   ((SPADCALL |op| '|log| (QREFELT % 157))
                    (SPADCALL
                     (|TRMANIP;exlog|
                      (SPADCALL (LETT |x| (SPADCALL |arg| (QREFELT % 144)))
                                (QREFELT % 80))
                      %)
                     (|TRMANIP;exlog| (SPADCALL |x| (QREFELT % 85)) %)
                     (QREFELT % 23)))
                   (#5#
                    (SEQ (LETT |num| (SPADCALL |arg| (QREFELT % 80)))
                         (LETT |den| (SPADCALL |arg| (QREFELT % 85)))
                         (EXIT
                          (COND
                           ((SPADCALL
                             (LETT |b|
                                   (SPADCALL (SPADCALL |num| (QREFELT % 182))
                                             |den| (QREFELT % 183)))
                             (|spadConstant| % 37) (QREFELT % 184))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (SPADCALL |num| (QREFELT % 185))
                                             |den| (QREFELT % 183)))
                             (EXIT
                              (COND
                               ((SPADCALL |op| '|exp| (QREFELT % 157))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |a| (QREFELT % 144))
                                           (QREFELT % 91))
                                 (SPADCALL (SPADCALL |b| (QREFELT % 91))
                                           (QREFELT % 144))
                                 (QREFELT % 21)))
                               ((SPADCALL |op| '|sin| (QREFELT % 157))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT % 144))
                                            (QREFELT % 20))
                                  (SPADCALL (SPADCALL |b| (QREFELT % 19))
                                            (QREFELT % 144))
                                  (QREFELT % 21))
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT % 144))
                                            (QREFELT % 19))
                                  (SPADCALL (SPADCALL |b| (QREFELT % 20))
                                            (QREFELT % 144))
                                  (QREFELT % 21))
                                 (QREFELT % 22)))
                               ((SPADCALL |op| '|cos| (QREFELT % 157))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT % 144))
                                            (QREFELT % 19))
                                  (SPADCALL (SPADCALL |b| (QREFELT % 19))
                                            (QREFELT % 144))
                                  (QREFELT % 21))
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT % 144))
                                            (QREFELT % 20))
                                  (SPADCALL (SPADCALL |b| (QREFELT % 20))
                                            (QREFELT % 144))
                                  (QREFELT % 21))
                                 (QREFELT % 23)))
                               ((SPADCALL |op| '|tan| (QREFELT % 157))
                                (SEQ
                                 (LETT |ta|
                                       (SPADCALL (SPADCALL |a| (QREFELT % 144))
                                                 (QREFELT % 123)))
                                 (LETT |tb|
                                       (SPADCALL (SPADCALL |b| (QREFELT % 123))
                                                 (QREFELT % 144)))
                                 (EXIT
                                  (SPADCALL (SPADCALL |ta| |tb| (QREFELT % 22))
                                            (SPADCALL (|spadConstant| % 38)
                                                      (SPADCALL |ta| |tb|
                                                                (QREFELT % 21))
                                                      (QREFELT % 23))
                                            (QREFELT % 26)))))
                               ((SPADCALL |op| '|cot| (QREFELT % 157))
                                (SEQ
                                 (LETT |cta|
                                       (SPADCALL (SPADCALL |a| (QREFELT % 144))
                                                 (QREFELT % 121)))
                                 (LETT |ctb|
                                       (SPADCALL (SPADCALL |b| (QREFELT % 121))
                                                 (QREFELT % 144)))
                                 (EXIT
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |cta| |ctb| (QREFELT % 21))
                                    (|spadConstant| % 38) (QREFELT % 23))
                                   (SPADCALL |ctb| |cta| (QREFELT % 22))
                                   (QREFELT % 26)))))
                               (#5#
                                (SPADCALL |op|
                                          (PROGN
                                           (LETT #4# NIL)
                                           (SEQ
                                            (LETT #3#
                                                  (SPADCALL |k|
                                                            (QREFELT % 45)))
                                            G190
                                            (COND
                                             ((OR (ATOM #3#)
                                                  (PROGN
                                                   (LETT |x| (CAR #3#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |x|
                                                               (QREFELT % 144))
                                                     #4#))))
                                            (LETT #3# (CDR #3#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                          (QREFELT % 65)))))))
                           (#5#
                            (SPADCALL |op|
                                      (PROGN
                                       (LETT #2# NIL)
                                       (SEQ
                                        (LETT #1#
                                              (SPADCALL |k| (QREFELT % 45)))
                                        G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN (LETT |x| (CAR #1#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL |x| (QREFELT % 144))
                                                 #2#))))
                                        (LETT #1# (CDR #1#)) (GO G190) G191
                                        (EXIT (NREVERSE #2#))))
                                      (QREFELT % 65))))))))))))))) 

(SDEFUN |TRMANIP;smpexp|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPROG ((|ans| (F)))
               (SEQ (LETT |ans| (|spadConstant| % 37))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| % 186)
                                      (QREFELT % 187)))
                           (GO G191)))
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (|TRMANIP;termexp|
                                           (SPADCALL |p| (QREFELT % 185)) %)
                                          (QREFELT % 22)))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 182)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |TRMANIP;simplify0| ((|x| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL |x|
                    (LIST '|tan| '|cot| '|sec| '|csc| '|tanh| '|coth| '|sech|
                          '|csch|)
                    (LIST (CONS (|function| |TRMANIP;t2t|) %)
                          (CONS (|function| |TRMANIP;c2t|) %)
                          (CONS (|function| |TRMANIP;s2c|) %)
                          (CONS (|function| |TRMANIP;c2s|) %)
                          (CONS (|function| |TRMANIP;th2th|) %)
                          (CONS (|function| |TRMANIP;ch2th|) %)
                          (CONS (|function| |TRMANIP;sh2ch|) %)
                          (CONS (|function| |TRMANIP;ch2sh|) %))
                    (QREFELT % 190))
          (LIST '|sin| '|sinh|) (LIST 2 2)
          (LIST (CONS (|function| |TRMANIP;s2c2|) %)
                (CONS (|function| |TRMANIP;sh2ch2|) %))
          (QREFELT % 192))
         (QREFELT % 93))) 

(DECLAIM (NOTINLINE |TranscendentalManipulations;|)) 

(DEFUN |TranscendentalManipulations;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|TranscendentalManipulations| DV$1 DV$2))
          (LETT % (GETREFV 193))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST
                                                               '|ConvertibleTo|
                                                               (LIST '|Pattern|
                                                                     (|devaluate|
                                                                      |#1|))))
                                               (|HasCategory| |#1|
                                                              (LIST
                                                               '|PatternMatchable|
                                                               (|devaluate|
                                                                |#1|)))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|ConvertibleTo|
                                                               (LIST '|Pattern|
                                                                     (|devaluate|
                                                                      |#1|))))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|PatternMatchable|
                                                               (|devaluate|
                                                                |#1|))))))))
          (|haddProp| |$ConstructorCache| '|TranscendentalManipulations|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 13
                    (SPADCALL (SPADCALL '|exp| (QREFELT % 11)) (QREFELT % 12)))
          (QSETREFV % 14
                    (SPADCALL (SPADCALL '|log| (QREFELT % 11)) (QREFELT % 12)))
          (COND
           ((|HasCategory| |#1| (LIST '|PatternMatchable| (|devaluate| |#1|)))
            (COND
             ((|HasCategory| |#1|
                             (LIST '|ConvertibleTo|
                                   (LIST '|Pattern| (|devaluate| |#1|))))
              (COND
               ((|HasCategory| |#2|
                               (LIST '|ConvertibleTo|
                                     (LIST '|Pattern| (|devaluate| |#1|))))
                (COND
                 ((|HasCategory| |#2|
                                 (LIST '|PatternMatchable| (|devaluate| |#1|)))
                  (PROGN
                   (QSETREFV % 17
                             (SPADCALL (SPADCALL (QREFELT % 15))
                                       (QREFELT % 16)))
                   (QSETREFV % 18
                             (SPADCALL (SPADCALL (QREFELT % 15))
                                       (QREFELT % 16)))
                   (QSETREFV % 29
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT % 17) (QREFELT % 19))
                               (SPADCALL (QREFELT % 18) (QREFELT % 20))
                               (QREFELT % 21))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 22))
                                 (QREFELT % 20))
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 23))
                                 (QREFELT % 20))
                                (QREFELT % 23))
                               (SPADCALL 2 (QREFELT % 25)) (QREFELT % 26))
                              (QREFELT % 28)))
                   (QSETREFV % 30
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT % 17) (QREFELT % 20))
                               (SPADCALL (QREFELT % 18) (QREFELT % 20))
                               (QREFELT % 21))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 23))
                                 (QREFELT % 19))
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 22))
                                 (QREFELT % 19))
                                (QREFELT % 23))
                               (SPADCALL 2 (QREFELT % 25)) (QREFELT % 26))
                              (QREFELT % 28)))
                   (QSETREFV % 31
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT % 17) (QREFELT % 19))
                               (SPADCALL (QREFELT % 18) (QREFELT % 19))
                               (QREFELT % 21))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 23))
                                 (QREFELT % 19))
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 22))
                                 (QREFELT % 19))
                                (QREFELT % 22))
                               (SPADCALL 2 (QREFELT % 25)) (QREFELT % 26))
                              (QREFELT % 28)))
                   (QSETREFV % 36
                             (CONS
                              (|dispatchFunction|
                               |TRMANIP;expandTrigProducts;2F;1|)
                              %)))))))))))
          (COND
           ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
            (QSETREFV % 77
                      (CONS (|dispatchFunction| |TRMANIP;simplify;2F;5|) %)))
           ('T
            (QSETREFV % 77
                      (CONS (|dispatchFunction| |TRMANIP;simplify;2F;6|) %))))
          %))) 

(DEFUN |TranscendentalManipulations| (&REST #1=#:G347)
  (SPROG NIL
         (PROG (#2=#:G348)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TranscendentalManipulations|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |TranscendentalManipulations;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TranscendentalManipulations|)))))))))) 

(MAKEPROP '|TranscendentalManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              (5 . |operator|) '|opexp| '|oplog| (10 . |new|) (14 . |coerce|)
              'XX 'YY (19 . |cos|) (24 . |sin|) (29 . *) (35 . +) (41 . -)
              (|Integer|) (47 . |coerce|) (52 . /) (|RewriteRule| 6 6 7)
              (58 . |rule|) '|sinCosRule| '|sinSinRule| '|cosCosRule|
              (|List| 27) (|PositiveInteger|) (|ApplyRules| 6 6 7)
              (64 . |applyRules|) (71 . |expandTrigProducts|) (76 . |Zero|)
              (80 . |One|) (|Boolean|) (84 . |is?|) (|List| 70)
              (90 . |kernels|) (|List| 7) (|Kernel| 7) (95 . |argument|)
              |TRMANIP;simplifyLog;2F;3|
              (|Record| (|:| |coef| 24) (|:| |var| 70))
              (|Union| 47 '#1="failed") (100 . |isMult|) (105 . |is?|)
              (111 . ^) (117 . |log|) (122 . |numerator|) (127 . |denominator|)
              (132 . |freeOf?|) (138 . |is?|) (|Union| 64 '#1#)
              (144 . |isTimes|) (149 . |isPlus|)
              (|Record| (|:| |val| %) (|:| |exponent| 24)) (|Union| 60 '#1#)
              (154 . |isPower|) (159 . |operator|) (|List| %) (164 . |elt|)
              (|Union| (|Fraction| (|Polynomial| 6)) '"failed")
              (170 . |retractIfCan|) (175 . |One|) (179 . |elt|) (|Kernel| %)
              (185 . |retract|) (190 . ^) (196 . |setelt!|) (203 . |append|)
              (|AlgebraicManipulations| 6 7) (209 . |rootProduct|)
              (214 . |simplify|) (219 . |second|)
              (|SparseMultivariatePolynomial| 6 70) (224 . |numer|)
              (|SparseMultivariatePolynomial| 6 44) (229 . |One|) (233 . =)
              (239 . |coerce|) (244 . |denom|) (249 . -) (|List| 44)
              (254 . |variables|) (|NonNegativeInteger|) (259 . |degree|)
              (265 . |exp|) (270 . *) |TRMANIP;simplifyExp;2F;49|
              (276 . |kernel|) (282 . |leadingCoefficient|) (287 . |coerce|)
              (|Mapping| 39 44) (292 . |select|) |TRMANIP;expandPower;2F;9|
              (298 . |eval|) (305 . |one?|) (310 . |removeDuplicates!|)
              (315 . |height|) (320 . >=) (|Mapping| 39 7 7) (326 . |sort!|)
              (332 . =) (338 . *) (344 . |inv|) (349 . |sinh|) (354 . |cosh|)
              (|Mapping| % %) (359 . |eval|) (366 . |eval|) (374 . |sec|)
              |TRMANIP;cos2sec;2F;24| (379 . |csc|) |TRMANIP;sin2csc;2F;25|
              |TRMANIP;csc2sin;2F;26| |TRMANIP;sec2cos;2F;27| (384 . |cot|)
              |TRMANIP;tan2cot;2F;28| (389 . |tan|) |TRMANIP;cot2tan;2F;29|
              |TRMANIP;tan2trig;2F;30| |TRMANIP;cot2trig;2F;31| (394 . |sech|)
              |TRMANIP;cosh2sech;2F;32| (399 . |csch|)
              |TRMANIP;sinh2csch;2F;33| |TRMANIP;csch2sinh;2F;34|
              |TRMANIP;sech2cosh;2F;35| (404 . |coth|)
              |TRMANIP;tanh2coth;2F;36| (409 . |tanh|)
              |TRMANIP;coth2tanh;2F;37| |TRMANIP;tanh2trigh;2F;38|
              |TRMANIP;coth2trigh;2F;39| |TRMANIP;removeCosSq;2F;40|
              |TRMANIP;removeSinSq;2F;41| |TRMANIP;removeCoshSq;2F;42|
              |TRMANIP;removeSinhSq;2F;43| |TRMANIP;expandLog;2F;44|
              |TRMANIP;expand;2F;45| (|Mapping| 7 44) (|Mapping| 7 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 44) 44 6 81 7)
              (414 . |map|) (421 . |coerce|) |TRMANIP;htrigs;2F;50|
              (426 . |monomial?|) (431 . |height|) (436 . =) (442 . |kernel|)
              (449 . |coerce|) (454 . *) (460 . |is?|) (|Union| 70 '"failed")
              (466 . |mainKernel|) (|SparseUnivariatePolynomial| %)
              (471 . |univariate|) (|SparseUnivariatePolynomial| 81)
              (477 . |degree|) (482 . |Zero|) (486 . |Zero|) (490 . ~=)
              (496 . |leadingCoefficient|) (501 . |reductum|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 81)
              (|SparseUnivariatePolynomialFunctions2| 81 7) (506 . |map|)
              (512 . |elt|) (|Factored| %) (518 . |squareFree|)
              (|Record| (|:| |coef| 89) (|:| |logand| 81)) (|List| 176)
              (|Factored| 81) (|FactoredFunctions| 81) (523 . |log|)
              (528 . |nullary?|) (533 . |reductum|) (538 . /) (544 . ~=)
              (550 . |leadingMonomial|) (555 . |Zero|) (559 . ~=) (|List| 9)
              (|List| 112) (565 . |eval|) (|List| 89) (572 . |eval|))
           '#(|tanh2trigh| 580 |tanh2coth| 585 |tan2trig| 590 |tan2cot| 595
              |sinh2csch| 600 |sin2csc| 605 |simplifyLog| 610 |simplifyExp| 615
              |simplify| 620 |sech2cosh| 625 |sec2cos| 630 |removeSinhSq| 635
              |removeSinSq| 640 |removeCoshSq| 645 |removeCosSq| 650 |htrigs|
              655 |expandTrigProducts| 660 |expandPower| 665 |expandLog| 670
              |expand| 675 |csch2sinh| 680 |csc2sin| 685 |coth2trigh| 690
              |coth2tanh| 695 |cot2trig| 700 |cot2tan| 705 |cosh2sech| 710
              |cos2sec| 715)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|expand| (|#2| |#2|)) T)
                                   '((|simplify| (|#2| |#2|)) T)
                                   '((|htrigs| (|#2| |#2|)) T)
                                   '((|simplifyExp| (|#2| |#2|)) T)
                                   '((|simplifyLog| (|#2| |#2|)) T)
                                   '((|expandPower| (|#2| |#2|)) T)
                                   '((|expandLog| (|#2| |#2|)) T)
                                   '((|cos2sec| (|#2| |#2|)) T)
                                   '((|cosh2sech| (|#2| |#2|)) T)
                                   '((|cot2trig| (|#2| |#2|)) T)
                                   '((|coth2trigh| (|#2| |#2|)) T)
                                   '((|csc2sin| (|#2| |#2|)) T)
                                   '((|csch2sinh| (|#2| |#2|)) T)
                                   '((|sec2cos| (|#2| |#2|)) T)
                                   '((|sech2cosh| (|#2| |#2|)) T)
                                   '((|sin2csc| (|#2| |#2|)) T)
                                   '((|sinh2csch| (|#2| |#2|)) T)
                                   '((|tan2trig| (|#2| |#2|)) T)
                                   '((|tanh2trigh| (|#2| |#2|)) T)
                                   '((|tan2cot| (|#2| |#2|)) T)
                                   '((|tanh2coth| (|#2| |#2|)) T)
                                   '((|cot2tan| (|#2| |#2|)) T)
                                   '((|coth2tanh| (|#2| |#2|)) T)
                                   '((|removeCosSq| (|#2| |#2|)) T)
                                   '((|removeSinSq| (|#2| |#2|)) T)
                                   '((|removeCoshSq| (|#2| |#2|)) T)
                                   '((|removeSinhSq| (|#2| |#2|)) T)
                                   '((|expandTrigProducts| (|#2| |#2|))
                                     (AND (|has| 7 (|PatternMatchable| 6))
                                          (|has| 7
                                                 (|ConvertibleTo|
                                                  (|Pattern| 6)))
                                          (|has| 6
                                                 (|ConvertibleTo|
                                                  (|Pattern| 6)))
                                          (|has| 6 (|PatternMatchable| 6)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 192
                                            '(1 10 8 9 11 1 7 8 8 12 0 9 0 15 1
                                              7 0 9 16 1 7 0 0 19 1 7 0 0 20 2
                                              7 0 0 0 21 2 7 0 0 0 22 2 7 0 0 0
                                              23 1 7 0 24 25 2 7 0 0 0 26 2 27
                                              0 7 7 28 3 34 7 32 7 33 35 1 0 7
                                              7 36 0 7 0 37 0 7 0 38 2 7 39 0 9
                                              40 1 7 41 0 42 1 44 43 0 45 1 7
                                              48 0 49 2 44 39 0 9 50 2 7 0 0 24
                                              51 1 7 0 0 52 1 7 0 0 53 1 7 0 0
                                              54 2 7 39 0 9 55 2 44 39 0 8 56 1
                                              7 57 0 58 1 7 57 0 59 1 7 61 0 62
                                              1 44 8 0 63 2 7 0 8 64 65 1 7 66
                                              0 67 0 6 0 68 2 43 7 0 24 69 1 7
                                              70 0 71 2 7 0 0 0 72 3 43 7 0 24
                                              7 73 2 43 0 0 0 74 1 75 7 7 76 1
                                              0 7 7 77 1 43 7 0 78 1 7 79 0 80
                                              0 81 0 82 2 81 39 0 0 83 1 7 0 79
                                              84 1 7 79 0 85 1 7 0 0 86 1 81 87
                                              0 88 2 81 89 0 44 90 1 7 0 0 91 2
                                              7 0 89 0 92 2 7 0 8 64 94 1 81 6
                                              0 95 1 7 0 6 96 2 87 0 97 0 98 3
                                              7 0 0 41 64 100 1 7 39 0 101 1 43
                                              0 0 102 1 7 89 0 103 2 89 39 0 0
                                              104 2 43 0 105 0 106 2 7 39 0 0
                                              107 2 7 0 24 0 108 1 7 0 0 109 1
                                              7 0 0 110 1 7 0 0 111 3 7 0 0 9
                                              112 113 4 7 0 0 9 89 112 114 1 7
                                              0 0 115 1 7 0 0 117 1 7 0 0 121 1
                                              7 0 0 123 1 7 0 0 127 1 7 0 0 129
                                              1 7 0 0 133 1 7 0 0 135 3 147 7
                                              145 146 81 148 1 7 0 70 149 1 81
                                              39 0 151 1 44 89 0 152 2 8 39 0 0
                                              153 3 44 0 8 43 89 154 1 81 0 44
                                              155 2 81 0 0 0 156 2 8 39 0 9 157
                                              1 7 158 0 159 2 81 160 0 44 161 1
                                              162 89 0 163 0 6 0 164 0 162 0
                                              165 2 162 39 0 0 166 1 162 81 0
                                              167 1 162 0 0 168 2 171 169 170
                                              162 172 2 169 7 0 7 173 1 81 174
                                              0 175 1 179 177 178 180 1 8 39 0
                                              181 1 81 0 0 182 2 7 0 79 79 183
                                              2 7 39 0 0 184 1 81 0 0 185 0 81
                                              0 186 2 81 39 0 0 187 3 7 0 0 188
                                              189 190 4 7 0 0 188 191 189 192 1
                                              0 7 7 137 1 0 7 7 134 1 0 7 7 125
                                              1 0 7 7 122 1 0 7 7 130 1 0 7 7
                                              118 1 0 7 7 46 1 0 7 7 93 1 0 7 7
                                              77 1 0 7 7 132 1 0 7 7 120 1 0 7
                                              7 142 1 0 7 7 140 1 0 7 7 141 1 0
                                              7 7 139 1 0 7 7 150 1 1 7 7 36 1
                                              0 7 7 99 1 0 7 7 143 1 0 7 7 144
                                              1 0 7 7 131 1 0 7 7 119 1 0 7 7
                                              138 1 0 7 7 136 1 0 7 7 126 1 0 7
                                              7 124 1 0 7 7 128 1 0 7 7
                                              116)))))
           '|lookupComplete|)) 
