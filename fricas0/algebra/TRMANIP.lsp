
(SDEFUN |TRMANIP;expandTrigProducts;2F;1| ((|e| F) ($ F))
        (SPADCALL (LIST (QREFELT $ 23) (QREFELT $ 24) (QREFELT $ 25)) |e| 10
                  (QREFELT $ 29))) 

(SDEFUN |TRMANIP;logArgs| ((|l| |List| F) ($ F))
        (SPROG
         ((|sum| (F)) (|arg| (F))
          (|prod|
           (|Union|
            (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| F)))
            "failed"))
          (#1=#:G755 NIL) (|term| NIL))
         (SEQ (LETT |sum| (|spadConstant| $ 31) . #2=(|TRMANIP;logArgs|))
              (LETT |arg| (|spadConstant| $ 32) . #2#)
              (SEQ (LETT |term| NIL . #2#) (LETT #1# |l| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |term| '|log| (QREFELT $ 34))
                       (LETT |arg|
                             (SPADCALL |arg|
                                       (SPADCALL
                                        (|SPADfirst|
                                         (SPADCALL
                                          (|SPADfirst|
                                           (SPADCALL |term| (QREFELT $ 36)))
                                          (QREFELT $ 39)))
                                        (QREFELT $ 40))
                                       (QREFELT $ 15))
                             . #2#))
                      ('T
                       (SEQ
                        (LETT |prod| (SPADCALL |term| (QREFELT $ 43)) . #2#)
                        (COND
                         ((QEQCAR |prod| 0)
                          (COND
                           ((SPADCALL (QCDR (QCDR |prod|)) '|log|
                                      (QREFELT $ 44))
                            (EXIT
                             (LETT |arg|
                                   (SPADCALL |arg|
                                             (SPADCALL
                                              (SPADCALL
                                               (|SPADfirst|
                                                (SPADCALL (QCDR (QCDR |prod|))
                                                          (QREFELT $ 39)))
                                               (QCAR (QCDR |prod|))
                                               (QREFELT $ 45))
                                              (QREFELT $ 40))
                                             (QREFELT $ 15))
                                   . #2#))))))
                        (EXIT
                         (LETT |sum| (SPADCALL |sum| |term| (QREFELT $ 16))
                               . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |sum| (SPADCALL |arg| (QREFELT $ 46))
                         (QREFELT $ 16)))))) 

(SDEFUN |TRMANIP;simplifyLog;2F;3| ((|e| F) ($ F))
        (SPADCALL (|TRMANIP;simplifyLog1| (SPADCALL |e| (QREFELT $ 47)) $)
                  (|TRMANIP;simplifyLog1| (SPADCALL |e| (QREFELT $ 48)) $)
                  (QREFELT $ 20))) 

(SDEFUN |TRMANIP;simplifyLog1| ((|e| F) ($ F))
        (SPROG
         ((#1=#:G797 NIL) (#2=#:G796 (F)) (#3=#:G798 (F)) (#4=#:G809 NIL)
          (#5=#:G691 NIL) (|terms| (|List| F)) (|foundLog| (|Boolean|))
          (#6=#:G789 NIL) (#7=#:G788 (F)) (#8=#:G790 (F)) (#9=#:G808 NIL)
          (#10=#:G690 NIL) (|args| (|List| F)) (|i| (|NonNegativeInteger|))
          (|nterms| (|List| F)) (|exprs| (|List| F)) (#11=#:G807 NIL)
          (|term| NIL) (#12=#:G806 NIL) (#13=#:G805 NIL) (#14=#:G804 NIL)
          (|u| NIL) (#15=#:G803 NIL) (|kers| (|List| (|Kernel| F)))
          (|expt|
           (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|)))
                    #16="failed"))
          (|termList| (|Union| (|List| F) #16#))
          (|prod|
           (|Union|
            (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| F)))
            #16#)))
         (SEQ
          (COND ((SPADCALL |e| '|log| (QREFELT $ 49)) |e|)
                (#17='T
                 (SEQ
                  (LETT |prod| (SPADCALL |e| (QREFELT $ 43))
                        . #18=(|TRMANIP;simplifyLog1|))
                  (COND
                   ((QEQCAR |prod| 0)
                    (COND
                     ((SPADCALL (QCDR (QCDR |prod|)) '|log| (QREFELT $ 44))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (|SPADfirst|
                           (SPADCALL (QCDR (QCDR |prod|)) (QREFELT $ 39)))
                          (QCAR (QCDR |prod|)) (QREFELT $ 45))
                         (QREFELT $ 40))
                        (QREFELT $ 46)))))))
                  (LETT |termList| (SPADCALL |e| (QREFELT $ 51)) . #18#)
                  (EXIT
                   (COND
                    ((QEQCAR |termList| 1)
                     (SEQ (LETT |terms| (SPADCALL |e| (QREFELT $ 52)) . #18#)
                          (EXIT
                           (COND
                            ((QEQCAR |terms| 1)
                             (SEQ
                              (LETT |expt| (SPADCALL |e| (QREFELT $ 55))
                                    . #18#)
                              (COND
                               ((QEQCAR |expt| 0)
                                (COND
                                 ((NULL (EQL (QCDR (QCDR |expt|)) 1))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL (QCAR (QCDR |expt|))
                                              (QREFELT $ 40))
                                    (QCDR (QCDR |expt|)) (QREFELT $ 45)))))))
                              (LETT |kers| (SPADCALL |e| (QREFELT $ 36))
                                    . #18#)
                              (COND
                               ((NULL (EQL (LENGTH |kers|) 1)) (EXIT |e|)))
                              (EXIT
                               (SPADCALL
                                (SPADCALL (|SPADfirst| |kers|) (QREFELT $ 57))
                                (PROGN
                                 (LETT #15# NIL . #18#)
                                 (SEQ (LETT |u| NIL . #18#)
                                      (LETT #14#
                                            (SPADCALL (|SPADfirst| |kers|)
                                                      (QREFELT $ 39))
                                            . #18#)
                                      G190
                                      (COND
                                       ((OR (ATOM #14#)
                                            (PROGN
                                             (LETT |u| (CAR #14#) . #18#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #15#
                                              (CONS
                                               (SPADCALL |u| (QREFELT $ 40))
                                               #15#)
                                              . #18#)))
                                      (LETT #14# (CDR #14#) . #18#) (GO G190)
                                      G191 (EXIT (NREVERSE #15#))))
                                (QREFELT $ 59)))))
                            (#17# (|TRMANIP;logArgs| (QCDR |terms|) $))))))
                    (#17#
                     (SEQ
                      (LETT |terms|
                            (PROGN
                             (LETT #13# NIL . #18#)
                             (SEQ (LETT |term| NIL . #18#)
                                  (LETT #12# (QCDR |termList|) . #18#) G190
                                  (COND
                                   ((OR (ATOM #12#)
                                        (PROGN
                                         (LETT |term| (CAR #12#) . #18#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #13#
                                          (CONS
                                           (SPADCALL |term| (QREFELT $ 40))
                                           #13#)
                                          . #18#)))
                                  (LETT #12# (CDR #12#) . #18#) (GO G190) G191
                                  (EXIT (NREVERSE #13#))))
                            . #18#)
                      (LETT |exprs| NIL . #18#) (LETT |nterms| NIL . #18#)
                      (SEQ (LETT |term| NIL . #18#) (LETT #11# |terms| . #18#)
                           G190
                           (COND
                            ((OR (ATOM #11#)
                                 (PROGN (LETT |term| (CAR #11#) . #18#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((QEQCAR (SPADCALL |term| (QREFELT $ 61)) 0)
                               (LETT |exprs| (CONS |term| |exprs|) . #18#))
                              ('T
                               (LETT |nterms| (CONS |term| |nterms|)
                                     . #18#)))))
                           (LETT #11# (CDR #11#) . #18#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |terms| |nterms| . #18#)
                      (COND
                       ((NULL (NULL |exprs|))
                        (SEQ (LETT |foundLog| NIL . #18#) (LETT |i| 0 . #18#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND (|foundLog| NIL)
                                           ('T (< |i| (LENGTH |terms|)))))
                                    (GO G191)))
                                  (SEQ (LETT |i| (+ |i| 1) . #18#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |terms| |i|
                                                     (QREFELT $ 63))
                                           '|log| (QREFELT $ 34))
                                          (SEQ
                                           (LETT |args|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |terms| |i|
                                                             (QREFELT $ 63))
                                                   (QREFELT $ 65))
                                                  (QREFELT $ 39))
                                                 . #18#)
                                           (SPADCALL |terms| |i|
                                                     (SPADCALL
                                                      (|TRMANIP;simplifyLog1|
                                                       (SPADCALL
                                                        (|SPADfirst| |args|)
                                                        (PROGN
                                                         (LETT #6# NIL . #18#)
                                                         (SEQ
                                                          (LETT #10# NIL
                                                                . #18#)
                                                          (LETT #9# |exprs|
                                                                . #18#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #9#)
                                                                (PROGN
                                                                 (LETT #10#
                                                                       (CAR
                                                                        #9#)
                                                                       . #18#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (PROGN
                                                             (LETT #8# #10#
                                                                   . #18#)
                                                             (COND
                                                              (#6#
                                                               (LETT #7#
                                                                     (SPADCALL
                                                                      #7# #8#
                                                                      (QREFELT
                                                                       $ 15))
                                                                     . #18#))
                                                              ('T
                                                               (PROGN
                                                                (LETT #7# #8#
                                                                      . #18#)
                                                                (LETT #6# 'T
                                                                      . #18#)))))))
                                                          (LETT #9# (CDR #9#)
                                                                . #18#)
                                                          (GO G190) G191
                                                          (EXIT NIL))
                                                         (COND (#6# #7#)
                                                               ('T
                                                                (|spadConstant|
                                                                 $ 32))))
                                                        (QREFELT $ 66))
                                                       $)
                                                      (QREFELT $ 46))
                                                     (QREFELT $ 67))
                                           (EXIT
                                            (LETT |foundLog| 'T . #18#)))))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (COND
                               ((NULL |foundLog|)
                                (LETT |terms|
                                      (SPADCALL |exprs| |terms| (QREFELT $ 68))
                                      . #18#)))))))
                      (EXIT
                       (PROGN
                        (LETT #1# NIL . #18#)
                        (SEQ (LETT #5# NIL . #18#) (LETT #4# |terms| . #18#)
                             G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT #5# (CAR #4#) . #18#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #3# #5# . #18#)
                                (COND
                                 (#1#
                                  (LETT #2# (SPADCALL #2# #3# (QREFELT $ 15))
                                        . #18#))
                                 ('T
                                  (PROGN
                                   (LETT #2# #3# . #18#)
                                   (LETT #1# 'T . #18#)))))))
                             (LETT #4# (CDR #4#) . #18#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#1# #2#)
                              (#17# (|spadConstant| $ 32))))))))))))))) 

(SDEFUN |TRMANIP;simplify;2F;5| ((|x| F) ($ F))
        (SPADCALL (|TRMANIP;simplify0| |x| $) (QREFELT $ 70))) 

(SDEFUN |TRMANIP;simplify;2F;6| ((|x| F) ($ F)) (|TRMANIP;simplify0| |x| $)) 

(SDEFUN |TRMANIP;expandpow| ((|k| |Kernel| F) ($ F))
        (SPROG ((|de| (F)) (|ne| (F)) (|b| (F)) (|a| (F)) (|arg| (|List| F)))
               (SEQ
                (LETT |a|
                      (SPADCALL
                       (|SPADfirst|
                        (LETT |arg| (SPADCALL |k| (QREFELT $ 39))
                              . #1=(|TRMANIP;expandpow|)))
                       (QREFELT $ 72))
                      . #1#)
                (LETT |b|
                      (SPADCALL (SPADCALL |arg| (QREFELT $ 73)) (QREFELT $ 72))
                      . #1#)
                (LETT |ne|
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT $ 75))
                                  (|spadConstant| $ 77) (QREFELT $ 78))
                        (|spadConstant| $ 32))
                       (#2='T
                        (SPADCALL
                         (SPADCALL (SPADCALL |a| (QREFELT $ 75))
                                   (QREFELT $ 79))
                         |b| (QREFELT $ 66))))
                      . #1#)
                (LETT |de|
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT $ 80))
                                  (|spadConstant| $ 77) (QREFELT $ 78))
                        (|spadConstant| $ 32))
                       (#2#
                        (SPADCALL
                         (SPADCALL (SPADCALL |a| (QREFELT $ 80))
                                   (QREFELT $ 79))
                         (SPADCALL |b| (QREFELT $ 81)) (QREFELT $ 66))))
                      . #1#)
                (EXIT (SPADCALL |ne| |de| (QREFELT $ 15)))))) 

(SDEFUN |TRMANIP;termexp|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPROG
         ((|coef| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#1=#:G831 NIL) (|u| NIL) (#2=#:G830 NIL) (|exponent| (F))
          (|d| (|NonNegativeInteger|)) (#3=#:G829 NIL) (|k| NIL)
          (|lpow| (|List| (|Kernel| F))) (|lk| (|List| (|Kernel| F))))
         (SEQ (LETT |exponent| (|spadConstant| $ 31) . #4=(|TRMANIP;termexp|))
              (LETT |coef|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 82)) (QREFELT $ 83))
                    . #4#)
              (LETT |lpow|
                    (SPADCALL (CONS #'|TRMANIP;termexp!0| $)
                              (LETT |lk| (SPADCALL |p| (QREFELT $ 85)) . #4#)
                              (QREFELT $ 87))
                    . #4#)
              (SEQ (LETT |k| NIL . #4#) (LETT #3# |lk| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |d| (SPADCALL |p| |k| (QREFELT $ 89)) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |k| '|exp| (QREFELT $ 44))
                           (LETT |exponent|
                                 (SPADCALL |exponent|
                                           (SPADCALL |d|
                                                     (|SPADfirst|
                                                      (SPADCALL |k|
                                                                (QREFELT $
                                                                         39)))
                                                     (QREFELT $ 90))
                                           (QREFELT $ 16))
                                 . #4#))
                          ((NULL (SPADCALL |k| '|%power| (QREFELT $ 44)))
                           (LETT |coef|
                                 (SPADCALL |coef|
                                           (SPADCALL (|spadConstant| $ 77)
                                                     (SPADCALL
                                                      (SPADCALL |k|
                                                                (QREFELT $ 57))
                                                      (PROGN
                                                       (LETT #2# NIL . #4#)
                                                       (SEQ
                                                        (LETT |u| NIL . #4#)
                                                        (LETT #1#
                                                              (SPADCALL |k|
                                                                        (QREFELT
                                                                         $ 39))
                                                              . #4#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #1#)
                                                              (PROGN
                                                               (LETT |u|
                                                                     (CAR #1#)
                                                                     . #4#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (LETT #2#
                                                                (CONS
                                                                 (SPADCALL |u|
                                                                           (QREFELT
                                                                            $
                                                                            91))
                                                                 #2#)
                                                                . #4#)))
                                                        (LETT #1# (CDR #1#)
                                                              . #4#)
                                                        (GO G190) G191
                                                        (EXIT (NREVERSE #2#))))
                                                      (SPADCALL |k|
                                                                (QREFELT $ 92))
                                                      (QREFELT $ 93))
                                                     |d| (QREFELT $ 94))
                                           (QREFELT $ 95))
                                 . #4#)))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |coef| (QREFELT $ 79))
                          (SPADCALL |exponent| (QREFELT $ 96)) (QREFELT $ 15))
                (|TRMANIP;powersimp| |p| |lpow| $) (QREFELT $ 15)))))) 

(SDEFUN |TRMANIP;termexp!0| ((|z1| NIL) ($ NIL))
        (SPADCALL |z1| '|%power| (QREFELT $ 44))) 

(SDEFUN |TRMANIP;expandPower;2F;9| ((|f| F) ($ F))
        (SPROG
         ((#1=#:G837 NIL) (|k| NIL) (#2=#:G836 NIL)
          (|l| (|List| (|Kernel| F))))
         (SEQ
          (LETT |l|
                (SPADCALL (CONS #'|TRMANIP;expandPower;2F;9!0| $)
                          (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 87))
                . #3=(|TRMANIP;expandPower;2F;9|))
          (EXIT
           (SPADCALL |f| |l|
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |k| NIL . #3#) (LETT #1# |l| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2# (CONS (|TRMANIP;expandpow| |k| $) #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 97)))))) 

(SDEFUN |TRMANIP;expandPower;2F;9!0| ((|z1| NIL) ($ NIL))
        (SPADCALL |z1| '|%power| (QREFELT $ 44))) 

(SDEFUN |TRMANIP;powersimp|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         (|l| |List| (|Kernel| F)) ($ F))
        (SPROG
         ((|exponent| (F)) (#1=#:G852 NIL) (|k0| NIL)
          (|lk| (|List| (|Kernel| F))) (|a| (F)) (|arg| (|List| F))
          (|k| (|Kernel| F)))
         (SEQ
          (COND ((NULL |l|) (|spadConstant| $ 32))
                (#2='T
                 (SEQ (LETT |k| (|SPADfirst| |l|) . #3=(|TRMANIP;powersimp|))
                      (LETT |a|
                            (|SPADfirst|
                             (LETT |arg| (SPADCALL |k| (QREFELT $ 39)) . #3#))
                            . #3#)
                      (LETT |exponent|
                            (SPADCALL (SPADCALL |p| |k| (QREFELT $ 89))
                                      (SPADCALL |arg| (QREFELT $ 73))
                                      (QREFELT $ 98))
                            . #3#)
                      (EXIT
                       (COND
                        ((NULL
                          (LETT |lk|
                                (SPADCALL
                                 (CONS #'|TRMANIP;powersimp!0| (VECTOR $ |a|))
                                 (CDR |l|) (QREFELT $ 87))
                                . #3#))
                         (SPADCALL (SPADCALL |a| |exponent| (QREFELT $ 66))
                                   (|TRMANIP;powersimp| |p| (CDR |l|) $)
                                   (QREFELT $ 15)))
                        (#2#
                         (SEQ
                          (SEQ (LETT |k0| NIL . #3#) (LETT #1# |lk| . #3#) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |k0| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |exponent|
                                       (SPADCALL |exponent|
                                                 (SPADCALL
                                                  (SPADCALL |p| |k0|
                                                            (QREFELT $ 89))
                                                  (SPADCALL
                                                   (SPADCALL |k0|
                                                             (QREFELT $ 39))
                                                   (QREFELT $ 73))
                                                  (QREFELT $ 98))
                                                 (QREFELT $ 16))
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (SPADCALL (SPADCALL |a| |exponent| (QREFELT $ 66))
                                     (|TRMANIP;powersimp| |p|
                                      (SPADCALL (CDR |l|) |lk| (QREFELT $ 101))
                                      $)
                                     (QREFELT $ 15))))))))))))) 

(SDEFUN |TRMANIP;powersimp!0| ((|z1| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1) . #1=(|TRMANIP;powersimp|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |a|
                      (SPADCALL (SPADCALL |z1| (QREFELT $ 39)) (QREFELT $ 99))
                      (QREFELT $ 100)))))) 

(SDEFUN |TRMANIP;t2t| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (SPADCALL |x| (QREFELT $ 13))
                  (QREFELT $ 20))) 

(SDEFUN |TRMANIP;c2t| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (SPADCALL |x| (QREFELT $ 14))
                  (QREFELT $ 20))) 

(SDEFUN |TRMANIP;c2s| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;s2c| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;s2c2| ((|x| F) ($ F))
        (SPADCALL (|spadConstant| $ 32)
                  (SPADCALL (SPADCALL |x| (QREFELT $ 13)) 2 (QREFELT $ 45))
                  (QREFELT $ 17))) 

(SDEFUN |TRMANIP;th2th| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 103)) (SPADCALL |x| (QREFELT $ 104))
                  (QREFELT $ 20))) 

(SDEFUN |TRMANIP;ch2th| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 104)) (SPADCALL |x| (QREFELT $ 103))
                  (QREFELT $ 20))) 

(SDEFUN |TRMANIP;ch2sh| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 103)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;sh2ch| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 104)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;sh2ch2| ((|x| F) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 104)) 2 (QREFELT $ 45))
                  (|spadConstant| $ 32) (QREFELT $ 17))) 

(SDEFUN |TRMANIP;ueval| ((|x| F) (|s| |Symbol|) (|f| |Mapping| F F) ($ F))
        (SPADCALL |x| |s| |f| (QREFELT $ 106))) 

(SDEFUN |TRMANIP;ueval2| ((|x| F) (|s| |Symbol|) (|f| |Mapping| F F) ($ F))
        (SPADCALL |x| |s| 2 |f| (QREFELT $ 107))) 

(SDEFUN |TRMANIP;cos2sec;2F;23| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|cos| (CONS #'|TRMANIP;cos2sec;2F;23!0| $) $)) 

(SDEFUN |TRMANIP;cos2sec;2F;23!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 108)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;sin2csc;2F;24| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|sin| (CONS #'|TRMANIP;sin2csc;2F;24!0| $) $)) 

(SDEFUN |TRMANIP;sin2csc;2F;24!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 110)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;csc2sin;2F;25| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|csc| (CONS (|function| |TRMANIP;c2s|) $) $)) 

(SDEFUN |TRMANIP;sec2cos;2F;26| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|sec| (CONS (|function| |TRMANIP;s2c|) $) $)) 

(SDEFUN |TRMANIP;tan2cot;2F;27| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|tan| (CONS #'|TRMANIP;tan2cot;2F;27!0| $) $)) 

(SDEFUN |TRMANIP;tan2cot;2F;27!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 114)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;cot2tan;2F;28| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|cot| (CONS #'|TRMANIP;cot2tan;2F;28!0| $) $)) 

(SDEFUN |TRMANIP;cot2tan;2F;28!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 116)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;tan2trig;2F;29| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|tan| (CONS (|function| |TRMANIP;t2t|) $) $)) 

(SDEFUN |TRMANIP;cot2trig;2F;30| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|cot| (CONS (|function| |TRMANIP;c2t|) $) $)) 

(SDEFUN |TRMANIP;cosh2sech;2F;31| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|cosh| (CONS #'|TRMANIP;cosh2sech;2F;31!0| $) $)) 

(SDEFUN |TRMANIP;cosh2sech;2F;31!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 120)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;sinh2csch;2F;32| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|sinh| (CONS #'|TRMANIP;sinh2csch;2F;32!0| $) $)) 

(SDEFUN |TRMANIP;sinh2csch;2F;32!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 122)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;csch2sinh;2F;33| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|csch| (CONS (|function| |TRMANIP;ch2sh|) $) $)) 

(SDEFUN |TRMANIP;sech2cosh;2F;34| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|sech| (CONS (|function| |TRMANIP;sh2ch|) $) $)) 

(SDEFUN |TRMANIP;tanh2coth;2F;35| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|tanh| (CONS #'|TRMANIP;tanh2coth;2F;35!0| $) $)) 

(SDEFUN |TRMANIP;tanh2coth;2F;35!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 126)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;coth2tanh;2F;36| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|coth| (CONS #'|TRMANIP;coth2tanh;2F;36!0| $) $)) 

(SDEFUN |TRMANIP;coth2tanh;2F;36!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 128)) (QREFELT $ 102))) 

(SDEFUN |TRMANIP;tanh2trigh;2F;37| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|tanh| (CONS (|function| |TRMANIP;th2th|) $) $)) 

(SDEFUN |TRMANIP;coth2trigh;2F;38| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|coth| (CONS (|function| |TRMANIP;ch2th|) $) $)) 

(SDEFUN |TRMANIP;removeCosSq;2F;39| ((|x| F) ($ F))
        (|TRMANIP;ueval2| |x| '|cos| (CONS #'|TRMANIP;removeCosSq;2F;39!0| $)
         $)) 

(SDEFUN |TRMANIP;removeCosSq;2F;39!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (|spadConstant| $ 32)
                  (SPADCALL (SPADCALL |z1| (QREFELT $ 14)) 2 (QREFELT $ 45))
                  (QREFELT $ 17))) 

(SDEFUN |TRMANIP;removeSinSq;2F;40| ((|x| F) ($ F))
        (|TRMANIP;ueval2| |x| '|sin| (CONS (|function| |TRMANIP;s2c2|) $) $)) 

(SDEFUN |TRMANIP;removeCoshSq;2F;41| ((|x| F) ($ F))
        (|TRMANIP;ueval2| |x| '|cosh| (CONS #'|TRMANIP;removeCoshSq;2F;41!0| $)
         $)) 

(SDEFUN |TRMANIP;removeCoshSq;2F;41!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (|spadConstant| $ 32)
                  (SPADCALL (SPADCALL |z1| (QREFELT $ 103)) 2 (QREFELT $ 45))
                  (QREFELT $ 16))) 

(SDEFUN |TRMANIP;removeSinhSq;2F;42| ((|x| F) ($ F))
        (|TRMANIP;ueval2| |x| '|sinh| (CONS (|function| |TRMANIP;sh2ch2|) $) $)) 

(SDEFUN |TRMANIP;expandLog;2F;43| ((|x| F) ($ F))
        (SPADCALL (|TRMANIP;smplog| (SPADCALL |x| (QREFELT $ 75)) $)
                  (|TRMANIP;smplog| (SPADCALL |x| (QREFELT $ 80)) $)
                  (QREFELT $ 20))) 

(SDEFUN |TRMANIP;simplifyExp;2F;44| ((|x| F) ($ F))
        (SPADCALL (|TRMANIP;smpexp| (SPADCALL |x| (QREFELT $ 75)) $)
                  (|TRMANIP;smpexp| (SPADCALL |x| (QREFELT $ 80)) $)
                  (QREFELT $ 20))) 

(SDEFUN |TRMANIP;expand;2F;45| ((|x| F) ($ F))
        (SPADCALL (|TRMANIP;smpexpand| (SPADCALL |x| (QREFELT $ 75)) $)
                  (|TRMANIP;smpexpand| (SPADCALL |x| (QREFELT $ 80)) $)
                  (QREFELT $ 20))) 

(SDEFUN |TRMANIP;smpexpand|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPADCALL (CONS (|function| |TRMANIP;kerexpand|) $) (ELT $ 138) |p|
                  (QREFELT $ 142))) 

(SDEFUN |TRMANIP;smplog|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPADCALL (CONS (|function| |TRMANIP;logexpand|) $) (ELT $ 138) |p|
                  (QREFELT $ 142))) 

(SDEFUN |TRMANIP;smp2htrigs|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPADCALL (CONS #'|TRMANIP;smp2htrigs!0| $) (ELT $ 138) |p|
                  (QREFELT $ 142))) 

(SDEFUN |TRMANIP;smp2htrigs!0| ((|k1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |k1| (QREFELT $ 143)) (QREFELT $ 144))) 

(SDEFUN |TRMANIP;htrigs;2F;49| ((|f| F) ($ F))
        (SPROG
         ((|g1| (F)) (|b| (|Integer|)) (|g2| (F)) (|a| (F))
          (|den|
           #1=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|num| #1#) (|arg| (|List| F)) (#2=#:G927 NIL) (|x| NIL)
          (#3=#:G926 NIL) (|op| (|BasicOperator|)) (|k| (|Kernel| F))
          (|m| (|Union| (|Kernel| F) "failed")))
         (SEQ
          (LETT |m| (SPADCALL |f| (QREFELT $ 146))
                . #4=(|TRMANIP;htrigs;2F;49|))
          (EXIT
           (COND ((QEQCAR |m| 1) |f|)
                 (#5='T
                  (SEQ
                   (LETT |op|
                         (SPADCALL (LETT |k| (QCDR |m|) . #4#) (QREFELT $ 57))
                         . #4#)
                   (LETT |arg|
                         (PROGN
                          (LETT #3# NIL . #4#)
                          (SEQ (LETT |x| NIL . #4#)
                               (LETT #2# (SPADCALL |k| (QREFELT $ 39)) . #4#)
                               G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #3#
                                       (CONS (SPADCALL |x| (QREFELT $ 144))
                                             #3#)
                                       . #4#)))
                               (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                               (EXIT (NREVERSE #3#))))
                         . #4#)
                   (LETT |num|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 75)) |k|
                                   (QREFELT $ 148))
                         . #4#)
                   (LETT |den|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 80)) |k|
                                   (QREFELT $ 148))
                         . #4#)
                   (EXIT
                    (COND
                     ((SPADCALL |op| '|exp| (QREFELT $ 149))
                      (SEQ
                       (LETT |g1|
                             (SPADCALL
                              (SPADCALL (LETT |a| (|SPADfirst| |arg|) . #4#)
                                        (QREFELT $ 104))
                              (SPADCALL |a| (QREFELT $ 103)) (QREFELT $ 16))
                             . #4#)
                       (LETT |g2|
                             (SPADCALL (SPADCALL |a| (QREFELT $ 104))
                                       (SPADCALL |a| (QREFELT $ 103))
                                       (QREFELT $ 17))
                             . #4#)
                       (EXIT
                        (SPADCALL
                         (|TRMANIP;supexp| |num| |g1| |g2|
                          (LETT |b|
                                (QUOTIENT2 (SPADCALL |num| (QREFELT $ 151)) 2)
                                . #4#)
                          $)
                         (|TRMANIP;supexp| |den| |g1| |g2| |b| $)
                         (QREFELT $ 20)))))
                     (#5#
                      (SPADCALL
                       (|TRMANIP;sup2htrigs| |num|
                        (LETT |g1| (SPADCALL |op| |arg| (QREFELT $ 152)) . #4#)
                        $)
                       (|TRMANIP;sup2htrigs| |den| |g1| $)
                       (QREFELT $ 20)))))))))))) 

(SDEFUN |TRMANIP;supexp|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|f1| F) (|f2| F) (|bse| |Integer|) ($ F))
        (SPROG ((|ans| (F)) (|d| (|Integer|)) (|g| (F)))
               (SEQ (LETT |ans| (|spadConstant| $ 31) . #1=(|TRMANIP;supexp|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| $ 154)
                                      (QREFELT $ 155)))
                           (GO G191)))
                         (SEQ
                          (LETT |g|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 156))
                                           (QREFELT $ 79))
                                 (QREFELT $ 144))
                                . #1#)
                          (SEQ
                           (LETT |d| (- (SPADCALL |p| (QREFELT $ 151)) |bse|)
                                 . #1#)
                           (EXIT
                            (COND
                             ((>= |d| 0)
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f1| |d|
                                                                  (QREFELT $
                                                                           45))
                                                        (QREFELT $ 15))
                                              (QREFELT $ 16))
                                    . #1#))
                             ('T
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f2| (- |d|)
                                                                  (QREFELT $
                                                                           45))
                                                        (QREFELT $ 15))
                                              (QREFELT $ 16))
                                    . #1#)))))
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 157)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |TRMANIP;sup2htrigs|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|f| F) ($ F))
        (SPADCALL
         (SPADCALL (CONS (|function| |TRMANIP;smp2htrigs|) $) |p|
                   (QREFELT $ 161))
         |f| (QREFELT $ 162))) 

(SDEFUN |TRMANIP;exlog|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPROG
         ((#1=#:G947 NIL) (#2=#:G946 (F)) (#3=#:G948 (F)) (#4=#:G950 NIL)
          (|r| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|TRMANIP;exlog|))
           (SEQ (LETT |r| NIL . #5#)
                (LETT #4#
                      (SPADCALL (SPADCALL |p| (QREFELT $ 164)) (QREFELT $ 169))
                      . #5#)
                G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCAR |r|)
                                   (SPADCALL
                                    (SPADCALL (QCDR |r|) (QREFELT $ 79))
                                    (QREFELT $ 46))
                                   (QREFELT $ 98))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 16)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 31))))))) 

(SDEFUN |TRMANIP;logexpand| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((#1=#:G956 NIL) (|x| (F)) (#2=#:G955 NIL) (|op| (|BasicOperator|)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |op| (SPADCALL |k| (QREFELT $ 57))
                   . #3=(|TRMANIP;logexpand|))
             (QREFELT $ 170))
            (SPADCALL |k| (QREFELT $ 143)))
           ((SPADCALL |op| '|log| (QREFELT $ 149))
            (SPADCALL
             (|TRMANIP;exlog|
              (SPADCALL
               (LETT |x|
                     (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 39)))
                               (QREFELT $ 136))
                     . #3#)
               (QREFELT $ 75))
              $)
             (|TRMANIP;exlog| (SPADCALL |x| (QREFELT $ 80)) $) (QREFELT $ 17)))
           ('T
            (SPADCALL |op|
                      (PROGN
                       (LETT #2# NIL . #3#)
                       (SEQ (LETT |x| NIL . #3#)
                            (LETT #1# (SPADCALL |k| (QREFELT $ 39)) . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |x| (QREFELT $ 136)) #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT $ 152))))))) 

(SDEFUN |TRMANIP;kerexpand| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((#1=#:G976 NIL) (|x| (F)) (#2=#:G975 NIL) (#3=#:G974 NIL)
          (#4=#:G973 NIL) (|ctb| (F)) (|cta| (F)) (|tb| (F)) (|ta| (F))
          (|a| (F)) (|b| (F))
          (|den| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| F))) (|arg| (F))
          (|op| (|BasicOperator|)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |op| (SPADCALL |k| (QREFELT $ 57))
                   . #5=(|TRMANIP;kerexpand|))
             (QREFELT $ 170))
            (SPADCALL |k| (QREFELT $ 143)))
           ((SPADCALL |op| '|%power| (QREFELT $ 149))
            (|TRMANIP;expandpow| |k| $))
           (#6='T
            (SEQ (LETT |arg| (|SPADfirst| (SPADCALL |k| (QREFELT $ 39))) . #5#)
                 (EXIT
                  (COND
                   ((SPADCALL |op| '|sec| (QREFELT $ 149))
                    (SPADCALL
                     (SPADCALL (SPADCALL |arg| (QREFELT $ 13)) (QREFELT $ 137))
                     (QREFELT $ 102)))
                   ((SPADCALL |op| '|csc| (QREFELT $ 149))
                    (SPADCALL
                     (SPADCALL (SPADCALL |arg| (QREFELT $ 14)) (QREFELT $ 137))
                     (QREFELT $ 102)))
                   ((SPADCALL |op| '|log| (QREFELT $ 149))
                    (SPADCALL
                     (|TRMANIP;exlog|
                      (SPADCALL
                       (LETT |x| (SPADCALL |arg| (QREFELT $ 137)) . #5#)
                       (QREFELT $ 75))
                      $)
                     (|TRMANIP;exlog| (SPADCALL |x| (QREFELT $ 80)) $)
                     (QREFELT $ 17)))
                   (#6#
                    (SEQ (LETT |num| (SPADCALL |arg| (QREFELT $ 75)) . #5#)
                         (LETT |den| (SPADCALL |arg| (QREFELT $ 80)) . #5#)
                         (EXIT
                          (COND
                           ((SPADCALL
                             (LETT |b|
                                   (SPADCALL (SPADCALL |num| (QREFELT $ 171))
                                             |den| (QREFELT $ 172))
                                   . #5#)
                             (|spadConstant| $ 31) (QREFELT $ 173))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (SPADCALL |num| (QREFELT $ 174))
                                             |den| (QREFELT $ 172))
                                   . #5#)
                             (EXIT
                              (COND
                               ((SPADCALL |op| '|exp| (QREFELT $ 149))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |a| (QREFELT $ 137))
                                           (QREFELT $ 96))
                                 (SPADCALL (SPADCALL |b| (QREFELT $ 96))
                                           (QREFELT $ 137))
                                 (QREFELT $ 15)))
                               ((SPADCALL |op| '|sin| (QREFELT $ 149))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT $ 137))
                                            (QREFELT $ 14))
                                  (SPADCALL (SPADCALL |b| (QREFELT $ 13))
                                            (QREFELT $ 137))
                                  (QREFELT $ 15))
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT $ 137))
                                            (QREFELT $ 13))
                                  (SPADCALL (SPADCALL |b| (QREFELT $ 14))
                                            (QREFELT $ 137))
                                  (QREFELT $ 15))
                                 (QREFELT $ 16)))
                               ((SPADCALL |op| '|cos| (QREFELT $ 149))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT $ 137))
                                            (QREFELT $ 13))
                                  (SPADCALL (SPADCALL |b| (QREFELT $ 13))
                                            (QREFELT $ 137))
                                  (QREFELT $ 15))
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT $ 137))
                                            (QREFELT $ 14))
                                  (SPADCALL (SPADCALL |b| (QREFELT $ 14))
                                            (QREFELT $ 137))
                                  (QREFELT $ 15))
                                 (QREFELT $ 17)))
                               ((SPADCALL |op| '|tan| (QREFELT $ 149))
                                (SEQ
                                 (LETT |ta|
                                       (SPADCALL (SPADCALL |a| (QREFELT $ 137))
                                                 (QREFELT $ 116))
                                       . #5#)
                                 (LETT |tb|
                                       (SPADCALL (SPADCALL |b| (QREFELT $ 116))
                                                 (QREFELT $ 137))
                                       . #5#)
                                 (EXIT
                                  (SPADCALL (SPADCALL |ta| |tb| (QREFELT $ 16))
                                            (SPADCALL (|spadConstant| $ 32)
                                                      (SPADCALL |ta| |tb|
                                                                (QREFELT $ 15))
                                                      (QREFELT $ 17))
                                            (QREFELT $ 20)))))
                               ((SPADCALL |op| '|cot| (QREFELT $ 149))
                                (SEQ
                                 (LETT |cta|
                                       (SPADCALL (SPADCALL |a| (QREFELT $ 137))
                                                 (QREFELT $ 114))
                                       . #5#)
                                 (LETT |ctb|
                                       (SPADCALL (SPADCALL |b| (QREFELT $ 114))
                                                 (QREFELT $ 137))
                                       . #5#)
                                 (EXIT
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |cta| |ctb| (QREFELT $ 15))
                                    (|spadConstant| $ 32) (QREFELT $ 17))
                                   (SPADCALL |ctb| |cta| (QREFELT $ 16))
                                   (QREFELT $ 20)))))
                               (#6#
                                (SPADCALL |op|
                                          (PROGN
                                           (LETT #4# NIL . #5#)
                                           (SEQ (LETT |x| NIL . #5#)
                                                (LETT #3#
                                                      (SPADCALL |k|
                                                                (QREFELT $ 39))
                                                      . #5#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #3#)
                                                      (PROGN
                                                       (LETT |x| (CAR #3#)
                                                             . #5#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #4#
                                                        (CONS
                                                         (SPADCALL |x|
                                                                   (QREFELT $
                                                                            137))
                                                         #4#)
                                                        . #5#)))
                                                (LETT #3# (CDR #3#) . #5#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #4#))))
                                          (QREFELT $ 152)))))))
                           (#6#
                            (SPADCALL |op|
                                      (PROGN
                                       (LETT #2# NIL . #5#)
                                       (SEQ (LETT |x| NIL . #5#)
                                            (LETT #1#
                                                  (SPADCALL |k| (QREFELT $ 39))
                                                  . #5#)
                                            G190
                                            (COND
                                             ((OR (ATOM #1#)
                                                  (PROGN
                                                   (LETT |x| (CAR #1#) . #5#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (SPADCALL |x|
                                                               (QREFELT $ 137))
                                                     #2#)
                                                    . #5#)))
                                            (LETT #1# (CDR #1#) . #5#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      (QREFELT $ 152))))))))))))))) 

(SDEFUN |TRMANIP;smpexp|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPROG ((|ans| (F)))
               (SEQ (LETT |ans| (|spadConstant| $ 31) . #1=(|TRMANIP;smpexp|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| $ 175)
                                      (QREFELT $ 176)))
                           (GO G191)))
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (|TRMANIP;termexp|
                                           (SPADCALL |p| (QREFELT $ 174)) $)
                                          (QREFELT $ 16))
                                . #1#)
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 171)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |TRMANIP;simplify0| ((|x| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL |x|
                    (LIST '|tan| '|cot| '|sec| '|csc| '|tanh| '|coth| '|sech|
                          '|csch|)
                    (LIST (CONS (|function| |TRMANIP;t2t|) $)
                          (CONS (|function| |TRMANIP;c2t|) $)
                          (CONS (|function| |TRMANIP;s2c|) $)
                          (CONS (|function| |TRMANIP;c2s|) $)
                          (CONS (|function| |TRMANIP;th2th|) $)
                          (CONS (|function| |TRMANIP;ch2th|) $)
                          (CONS (|function| |TRMANIP;sh2ch|) $)
                          (CONS (|function| |TRMANIP;ch2sh|) $))
                    (QREFELT $ 179))
          (LIST '|sin| '|sinh|) (LIST 2 2)
          (LIST (CONS (|function| |TRMANIP;s2c2|) $)
                (CONS (|function| |TRMANIP;sh2ch2|) $))
          (QREFELT $ 181))
         (QREFELT $ 91))) 

(DECLAIM (NOTINLINE |TranscendentalManipulations;|)) 

(DEFUN |TranscendentalManipulations| (&REST #1=#:G1015)
  (SPROG NIL
         (PROG (#2=#:G1016)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TranscendentalManipulations|)
                                               '|domainEqualList|)
                    . #3=(|TranscendentalManipulations|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |TranscendentalManipulations;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TranscendentalManipulations|)))))))))) 

(DEFUN |TranscendentalManipulations;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TranscendentalManipulations|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|TranscendentalManipulations| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 182) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
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
                                                                |#1|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|TranscendentalManipulations|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
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
                   (QSETREFV $ 11
                             (SPADCALL (SPADCALL (QREFELT $ 9))
                                       (QREFELT $ 10)))
                   (QSETREFV $ 12
                             (SPADCALL (SPADCALL (QREFELT $ 9))
                                       (QREFELT $ 10)))
                   (QSETREFV $ 23
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT $ 11) (QREFELT $ 13))
                               (SPADCALL (QREFELT $ 12) (QREFELT $ 14))
                               (QREFELT $ 15))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                           (QREFELT $ 16))
                                 (QREFELT $ 14))
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                           (QREFELT $ 17))
                                 (QREFELT $ 14))
                                (QREFELT $ 17))
                               (SPADCALL 2 (QREFELT $ 19)) (QREFELT $ 20))
                              (QREFELT $ 22)))
                   (QSETREFV $ 24
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT $ 11) (QREFELT $ 14))
                               (SPADCALL (QREFELT $ 12) (QREFELT $ 14))
                               (QREFELT $ 15))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                           (QREFELT $ 17))
                                 (QREFELT $ 13))
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                           (QREFELT $ 16))
                                 (QREFELT $ 13))
                                (QREFELT $ 17))
                               (SPADCALL 2 (QREFELT $ 19)) (QREFELT $ 20))
                              (QREFELT $ 22)))
                   (QSETREFV $ 25
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT $ 11) (QREFELT $ 13))
                               (SPADCALL (QREFELT $ 12) (QREFELT $ 13))
                               (QREFELT $ 15))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                           (QREFELT $ 17))
                                 (QREFELT $ 13))
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                           (QREFELT $ 16))
                                 (QREFELT $ 13))
                                (QREFELT $ 16))
                               (SPADCALL 2 (QREFELT $ 19)) (QREFELT $ 20))
                              (QREFELT $ 22)))
                   (QSETREFV $ 30
                             (CONS
                              (|dispatchFunction|
                               |TRMANIP;expandTrigProducts;2F;1|)
                              $)))))))))))
          (COND
           ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
            (QSETREFV $ 71
                      (CONS (|dispatchFunction| |TRMANIP;simplify;2F;5|) $)))
           ('T
            (QSETREFV $ 71
                      (CONS (|dispatchFunction| |TRMANIP;simplify;2F;6|) $))))
          $))) 

(MAKEPROP '|TranscendentalManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) (4 . |coerce|) 'XX 'YY (9 . |cos|) (14 . |sin|)
              (19 . *) (25 . +) (31 . -) (|Integer|) (37 . |coerce|) (42 . /)
              (|RewriteRule| 6 6 7) (48 . |rule|) '|sinCosRule| '|sinSinRule|
              '|cosCosRule| (|List| 21) (|PositiveInteger|)
              (|ApplyRules| 6 6 7) (54 . |applyRules|)
              (61 . |expandTrigProducts|) (66 . |Zero|) (70 . |One|)
              (|Boolean|) (74 . |is?|) (|List| 64) (80 . |kernels|) (|List| 7)
              (|Kernel| 7) (85 . |argument|) |TRMANIP;simplifyLog;2F;3|
              (|Record| (|:| |coef| 18) (|:| |var| 64))
              (|Union| 41 '#1="failed") (90 . |isMult|) (95 . |is?|) (101 . ^)
              (107 . |log|) (112 . |numerator|) (117 . |denominator|)
              (122 . |freeOf?|) (|Union| 58 '#1#) (128 . |isTimes|)
              (133 . |isPlus|) (|Record| (|:| |val| $) (|:| |exponent| 18))
              (|Union| 53 '#1#) (138 . |isPower|) (|BasicOperator|)
              (143 . |operator|) (|List| $) (148 . |kernel|)
              (|Union| (|Fraction| (|Polynomial| 6)) '"failed")
              (154 . |retractIfCan|) (159 . |One|) (163 . |elt|) (|Kernel| $)
              (169 . |retract|) (174 . ^) (180 . |setelt!|) (187 . |append|)
              (|AlgebraicManipulations| 6 7) (193 . |rootProduct|)
              (198 . |simplify|) |TRMANIP;expandPower;2F;9| (203 . |second|)
              (|SparseMultivariatePolynomial| 6 64) (208 . |numer|)
              (|SparseMultivariatePolynomial| 6 38) (213 . |One|) (217 . =)
              (223 . |coerce|) (228 . |denom|) (233 . -)
              (238 . |leadingCoefficient|) (243 . |coerce|) (|List| 38)
              (248 . |variables|) (|Mapping| 33 38) (253 . |select|)
              (|NonNegativeInteger|) (259 . |degree|) (265 . *)
              |TRMANIP;simplifyExp;2F;44| (271 . |height|) (276 . |kernel|)
              (283 . |monomial|) (290 . *) (296 . |exp|) (301 . |eval|)
              (308 . *) (314 . |first|) (319 . =) (325 . |setDifference|)
              (331 . |inv|) (336 . |sinh|) (341 . |cosh|) (|Mapping| $ $)
              (346 . |eval|) (353 . |eval|) (361 . |sec|)
              |TRMANIP;cos2sec;2F;23| (366 . |csc|) |TRMANIP;sin2csc;2F;24|
              |TRMANIP;csc2sin;2F;25| |TRMANIP;sec2cos;2F;26| (371 . |cot|)
              |TRMANIP;tan2cot;2F;27| (376 . |tan|) |TRMANIP;cot2tan;2F;28|
              |TRMANIP;tan2trig;2F;29| |TRMANIP;cot2trig;2F;30| (381 . |sech|)
              |TRMANIP;cosh2sech;2F;31| (386 . |csch|)
              |TRMANIP;sinh2csch;2F;32| |TRMANIP;csch2sinh;2F;33|
              |TRMANIP;sech2cosh;2F;34| (391 . |coth|)
              |TRMANIP;tanh2coth;2F;35| (396 . |tanh|)
              |TRMANIP;coth2tanh;2F;36| |TRMANIP;tanh2trigh;2F;37|
              |TRMANIP;coth2trigh;2F;38| |TRMANIP;removeCosSq;2F;39|
              |TRMANIP;removeSinSq;2F;40| |TRMANIP;removeCoshSq;2F;41|
              |TRMANIP;removeSinhSq;2F;42| |TRMANIP;expandLog;2F;43|
              |TRMANIP;expand;2F;45| (401 . |coerce|) (|Mapping| 7 38)
              (|Mapping| 7 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 38) 38 6 76 7)
              (406 . |map|) (413 . |coerce|) |TRMANIP;htrigs;2F;49|
              (|Union| 64 '"failed") (418 . |mainKernel|)
              (|SparseUnivariatePolynomial| $) (423 . |univariate|)
              (429 . |is?|) (|SparseUnivariatePolynomial| 76) (435 . |degree|)
              (440 . |elt|) (446 . |Zero|) (450 . |Zero|) (454 . ~=)
              (460 . |leadingCoefficient|) (465 . |reductum|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 76)
              (|SparseUnivariatePolynomialFunctions2| 76 7) (470 . |map|)
              (476 . |elt|) (|Factored| $) (482 . |squareFree|)
              (|Record| (|:| |coef| 88) (|:| |logand| 76)) (|List| 165)
              (|Factored| 76) (|FactoredFunctions| 76) (487 . |log|)
              (492 . |nullary?|) (497 . |reductum|) (502 . /) (508 . ~=)
              (514 . |leadingMonomial|) (519 . |Zero|) (523 . ~=) (|List| 8)
              (|List| 105) (529 . |eval|) (|List| 88) (536 . |eval|))
           '#(|tanh2trigh| 544 |tanh2coth| 549 |tan2trig| 554 |tan2cot| 559
              |sinh2csch| 564 |sin2csc| 569 |simplifyLog| 574 |simplifyExp| 579
              |simplify| 584 |sech2cosh| 589 |sec2cos| 594 |removeSinhSq| 599
              |removeSinSq| 604 |removeCoshSq| 609 |removeCosSq| 614 |htrigs|
              619 |expandTrigProducts| 624 |expandPower| 629 |expandLog| 634
              |expand| 639 |csch2sinh| 644 |csc2sin| 649 |coth2trigh| 654
              |coth2tanh| 659 |cot2trig| 664 |cot2tan| 669 |cosh2sech| 674
              |cos2sec| 679)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 181
                                                 '(0 8 0 9 1 7 0 8 10 1 7 0 0
                                                   13 1 7 0 0 14 2 7 0 0 0 15 2
                                                   7 0 0 0 16 2 7 0 0 0 17 1 7
                                                   0 18 19 2 7 0 0 0 20 2 21 0
                                                   7 7 22 3 28 7 26 7 27 29 1 0
                                                   7 7 30 0 7 0 31 0 7 0 32 2 7
                                                   33 0 8 34 1 7 35 0 36 1 38
                                                   37 0 39 1 7 42 0 43 2 38 33
                                                   0 8 44 2 7 0 0 18 45 1 7 0 0
                                                   46 1 7 0 0 47 1 7 0 0 48 2 7
                                                   33 0 8 49 1 7 50 0 51 1 7 50
                                                   0 52 1 7 54 0 55 1 38 56 0
                                                   57 2 7 0 56 58 59 1 7 60 0
                                                   61 0 6 0 62 2 37 7 0 18 63 1
                                                   7 64 0 65 2 7 0 0 0 66 3 37
                                                   7 0 18 7 67 2 37 0 0 0 68 1
                                                   69 7 7 70 1 0 7 7 71 1 37 7
                                                   0 73 1 7 74 0 75 0 76 0 77 2
                                                   76 33 0 0 78 1 7 0 74 79 1 7
                                                   74 0 80 1 7 0 0 81 1 76 6 0
                                                   82 1 76 0 6 83 1 76 84 0 85
                                                   2 84 0 86 0 87 2 76 88 0 38
                                                   89 2 7 0 88 0 90 1 38 88 0
                                                   92 3 38 0 56 37 88 93 3 76 0
                                                   0 38 88 94 2 76 0 0 0 95 1 7
                                                   0 0 96 3 7 0 0 35 58 97 2 7
                                                   0 18 0 98 1 37 7 0 99 2 7 33
                                                   0 0 100 2 84 0 0 0 101 1 7 0
                                                   0 102 1 7 0 0 103 1 7 0 0
                                                   104 3 7 0 0 8 105 106 4 7 0
                                                   0 8 88 105 107 1 7 0 0 108 1
                                                   7 0 0 110 1 7 0 0 114 1 7 0
                                                   0 116 1 7 0 0 120 1 7 0 0
                                                   122 1 7 0 0 126 1 7 0 0 128
                                                   1 7 0 6 138 3 141 7 139 140
                                                   76 142 1 7 0 64 143 1 7 145
                                                   0 146 2 76 147 0 38 148 2 56
                                                   33 0 8 149 1 150 88 0 151 2
                                                   7 0 56 58 152 0 6 0 153 0
                                                   150 0 154 2 150 33 0 0 155 1
                                                   150 76 0 156 1 150 0 0 157 2
                                                   160 158 159 150 161 2 158 7
                                                   0 7 162 1 76 163 0 164 1 168
                                                   166 167 169 1 56 33 0 170 1
                                                   76 0 0 171 2 7 0 74 74 172 2
                                                   7 33 0 0 173 1 76 0 0 174 0
                                                   76 0 175 2 76 33 0 0 176 3 7
                                                   0 0 177 178 179 4 7 0 0 177
                                                   180 178 181 1 0 7 7 130 1 0
                                                   7 7 127 1 0 7 7 118 1 0 7 7
                                                   115 1 0 7 7 123 1 0 7 7 111
                                                   1 0 7 7 40 1 0 7 7 91 1 0 7
                                                   7 71 1 0 7 7 125 1 0 7 7 113
                                                   1 0 7 7 135 1 0 7 7 133 1 0
                                                   7 7 134 1 0 7 7 132 1 0 7 7
                                                   144 1 1 7 7 30 1 0 7 7 72 1
                                                   0 7 7 136 1 0 7 7 137 1 0 7
                                                   7 124 1 0 7 7 112 1 0 7 7
                                                   131 1 0 7 7 129 1 0 7 7 119
                                                   1 0 7 7 117 1 0 7 7 121 1 0
                                                   7 7 109)))))
           '|lookupComplete|)) 
