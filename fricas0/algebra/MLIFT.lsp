
(SDEFUN |MLIFT;corrPoly;SupLLLLMU;1|
        ((|m| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|fval| |List| R) (|ld| |List| (|NonNegativeInteger|))
         (|flist| |List| (|SparseUnivariatePolynomial| P))
         (|bsolv| |Mapping|
          (|Union| (|List| (|SparseUnivariatePolynomial| R)) #1="failed")
          (|SparseUnivariatePolynomial| R))
         ($ |Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
        (SPROG
         ((|diff| (|SparseUnivariatePolynomial| P)) (#2=#:G770 NIL)
          (#3=#:G769 #4=(|SparseUnivariatePolynomial| P)) (#5=#:G771 #4#)
          (#6=#:G790 NIL) (|i| NIL)
          (|lcoef| (|List| (|SparseUnivariatePolynomial| P))) (#7=#:G789 NIL)
          (#8=#:G788 NIL) (|beta| (|List| (|SparseUnivariatePolynomial| P)))
          (#9=#:G778 NIL)
          (|fbeta|
           #10=(|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|ddiff| #11=(|SparseUnivariatePolynomial| P))
          (|pol| (|SparseUnivariatePolynomial| P)) (#12=#:G787 NIL) (|l| NIL)
          (#13=#:G740 NIL) (#14=#:G739 #4#) (#15=#:G741 #4#) (#16=#:G786 NIL)
          (|polc| (|SparseUnivariatePolynomial| P))
          (|listcong| (|List| (|SparseUnivariatePolynomial| P)))
          (#17=#:G728 NIL) (#18=#:G727 #19=(|SparseUnivariatePolynomial| P))
          (#20=#:G729 #19#) (#21=#:G785 NIL) (#22=#:G784 NIL) (#23=#:G783 NIL)
          (|flcoef| #10#) (|um| #11#)
          (|listpolv| (|List| (|SparseUnivariatePolynomial| P)))
          (#24=#:G782 NIL) (|f1| NIL) (#25=#:G781 NIL) (|y| (OV)) (|a| (P))
          (|np| (|NonNegativeInteger|)) (|deg1| (|NonNegativeInteger|))
          (#26=#:G780 NIL) (|mp| NIL) (#27=#:G779 NIL)
          (|lp| (|Union| (|List| (|SparseUnivariatePolynomial| R)) #1#)))
         (SEQ
          (EXIT
           (COND
            ((EQL (LENGTH |lvar|) 0)
             (SEQ
              (LETT |lp|
                    (SPADCALL (SPADCALL (ELT $ 10) |m| (QREFELT $ 15)) |bsolv|)
                    . #28=(|MLIFT;corrPoly;SupLLLLMU;1|))
              (COND
               ((QEQCAR |lp| 1)
                (PROGN (LETT #9# (CONS 1 "failed") . #28#) (GO #29=#:G777))))
              (EXIT
               (LETT |lcoef|
                     (CONS 0
                           (PROGN
                            (LETT #27# NIL . #28#)
                            (SEQ (LETT |mp| NIL . #28#)
                                 (LETT #26# (QCDR |lp|) . #28#) G190
                                 (COND
                                  ((OR (ATOM #26#)
                                       (PROGN
                                        (LETT |mp| (CAR #26#) . #28#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #27#
                                         (CONS
                                          (SPADCALL (ELT $ 16) |mp|
                                                    (QREFELT $ 19))
                                          #27#)
                                         . #28#)))
                                 (LETT #26# (CDR #26#) . #28#) (GO G190) G191
                                 (EXIT (NREVERSE #27#)))))
                     . #28#))))
            (#30='T
             (SEQ (LETT |deg1| (|SPADfirst| |ld|) . #28#)
                  (LETT |np| (LENGTH |flist|) . #28#)
                  (LETT |a| (SPADCALL (|SPADfirst| |fval|) (QREFELT $ 16))
                        . #28#)
                  (LETT |y| (|SPADfirst| |lvar|) . #28#)
                  (LETT |lvar| (CDR |lvar|) . #28#)
                  (LETT |listpolv|
                        (PROGN
                         (LETT #25# NIL . #28#)
                         (SEQ (LETT |f1| NIL . #28#) (LETT #24# |flist| . #28#)
                              G190
                              (COND
                               ((OR (ATOM #24#)
                                    (PROGN (LETT |f1| (CAR #24#) . #28#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #25#
                                      (CONS
                                       (SPADCALL
                                        (CONS #'|MLIFT;corrPoly;SupLLLLMU;1!0|
                                              (VECTOR $ |a| |y|))
                                        |f1| (QREFELT $ 22))
                                       #25#)
                                      . #28#)))
                              (LETT #24# (CDR #24#) . #28#) (GO G190) G191
                              (EXIT (NREVERSE #25#))))
                        . #28#)
                  (LETT |um|
                        (SPADCALL
                         (CONS #'|MLIFT;corrPoly;SupLLLLMU;1!1|
                               (VECTOR $ |a| |y|))
                         |m| (QREFELT $ 22))
                        . #28#)
                  (LETT |flcoef|
                        (SPADCALL |um| |lvar| (CDR |fval|) (CDR |ld|)
                                  |listpolv| |bsolv| (QREFELT $ 30))
                        . #28#)
                  (COND
                   ((QEQCAR |flcoef| 1)
                    (PROGN (LETT #9# (CONS 1 "failed") . #28#) (GO #29#)))
                   (#30# (LETT |lcoef| (QCDR |flcoef|) . #28#)))
                  (LETT |listcong|
                        (PROGN
                         (LETT #23# NIL . #28#)
                         (SEQ (LETT |l| 1 . #28#) (LETT #22# |np| . #28#) G190
                              (COND ((|greater_SI| |l| #22#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #23#
                                      (CONS
                                       (PROGN
                                        (LETT #17# NIL . #28#)
                                        (SEQ (LETT |i| 1 . #28#)
                                             (LETT #21# |np| . #28#) G190
                                             (COND
                                              ((|greater_SI| |i| #21#)
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((SPADCALL |i| |l|
                                                           (QREFELT $ 33))
                                                 (PROGN
                                                  (LETT #20#
                                                        (SPADCALL |flist| |i|
                                                                  (QREFELT $
                                                                           35))
                                                        . #28#)
                                                  (COND
                                                   (#17#
                                                    (LETT #18#
                                                          (SPADCALL #18# #20#
                                                                    (QREFELT $
                                                                             36))
                                                          . #28#))
                                                   ('T
                                                    (PROGN
                                                     (LETT #18# #20# . #28#)
                                                     (LETT #17# 'T
                                                           . #28#)))))))))
                                             (LETT |i| (|inc_SI| |i|) . #28#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#17# #18#)
                                              ('T (|spadConstant| $ 37))))
                                       #23#)
                                      . #28#)))
                              (LETT |l| (|inc_SI| |l|) . #28#) (GO G190) G191
                              (EXIT (NREVERSE #23#))))
                        . #28#)
                  (LETT |polc|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 39) |y| 1 (QREFELT $ 40))
                          |a| (QREFELT $ 41))
                         (QREFELT $ 42))
                        . #28#)
                  (LETT |pol| (|spadConstant| $ 37) . #28#)
                  (LETT |diff|
                        (SPADCALL |m|
                                  (PROGN
                                   (LETT #13# NIL . #28#)
                                   (SEQ (LETT |i| 1 . #28#)
                                        (LETT #16# |np| . #28#) G190
                                        (COND
                                         ((|greater_SI| |i| #16#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #15#
                                                 (SPADCALL
                                                  (SPADCALL |lcoef| |i|
                                                            (QREFELT $ 35))
                                                  (SPADCALL |listcong| |i|
                                                            (QREFELT $ 35))
                                                  (QREFELT $ 36))
                                                 . #28#)
                                           (COND
                                            (#13#
                                             (LETT #14#
                                                   (SPADCALL #14# #15#
                                                             (QREFELT $ 43))
                                                   . #28#))
                                            ('T
                                             (PROGN
                                              (LETT #14# #15# . #28#)
                                              (LETT #13# 'T . #28#)))))))
                                        (LETT |i| (|inc_SI| |i|) . #28#)
                                        (GO G190) G191 (EXIT NIL))
                                   (COND (#13# #14#)
                                         (#30# (|spadConstant| $ 44))))
                                  (QREFELT $ 45))
                        . #28#)
                  (SEQ (LETT |l| 1 . #28#) (LETT #12# |deg1| . #28#) G190
                       (COND ((|greater_SI| |l| #12#) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL |diff| (|spadConstant| $ 44)
                                    (QREFELT $ 48))
                          (PROGN
                           (LETT #9# (CONS 0 |lcoef|) . #28#)
                           (GO #29#))))
                        (LETT |pol| (SPADCALL |pol| |polc| (QREFELT $ 36))
                              . #28#)
                        (LETT |ddiff|
                              (SPADCALL
                               (CONS #'|MLIFT;corrPoly;SupLLLLMU;1!2|
                                     (VECTOR |a| $ |y| |l|))
                               |diff| (QREFELT $ 22))
                              . #28#)
                        (EXIT
                         (COND
                          ((SPADCALL |ddiff| (|spadConstant| $ 44)
                                     (QREFELT $ 48))
                           "next l")
                          ('T
                           (SEQ
                            (LETT |fbeta|
                                  (SPADCALL |ddiff| |lvar| (CDR |fval|)
                                            (CDR |ld|) |listpolv| |bsolv|
                                            (QREFELT $ 30))
                                  . #28#)
                            (COND
                             ((QEQCAR |fbeta| 1)
                              (PROGN
                               (LETT #9# (CONS 1 "failed") . #28#)
                               (GO #29#)))
                             ('T (LETT |beta| (QCDR |fbeta|) . #28#)))
                            (LETT |lcoef|
                                  (PROGN
                                   (LETT #8# NIL . #28#)
                                   (SEQ (LETT |i| 1 . #28#)
                                        (LETT #7# |np| . #28#) G190
                                        (COND
                                         ((|greater_SI| |i| #7#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #8#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |lcoef| |i|
                                                            (QREFELT $ 35))
                                                  (SPADCALL
                                                   (SPADCALL |beta| |i|
                                                             (QREFELT $ 35))
                                                   |pol| (QREFELT $ 36))
                                                  (QREFELT $ 43))
                                                 #8#)
                                                . #28#)))
                                        (LETT |i| (|inc_SI| |i|) . #28#)
                                        (GO G190) G191 (EXIT (NREVERSE #8#))))
                                  . #28#)
                            (EXIT
                             (LETT |diff|
                                   (SPADCALL |diff|
                                             (SPADCALL
                                              (PROGN
                                               (LETT #2# NIL . #28#)
                                               (SEQ (LETT |i| 1 . #28#)
                                                    (LETT #6# |np| . #28#) G190
                                                    (COND
                                                     ((|greater_SI| |i| #6#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #5#
                                                             (SPADCALL
                                                              (SPADCALL
                                                               |listcong| |i|
                                                               (QREFELT $ 35))
                                                              (SPADCALL |beta|
                                                                        |i|
                                                                        (QREFELT
                                                                         $ 35))
                                                              (QREFELT $ 36))
                                                             . #28#)
                                                       (COND
                                                        (#2#
                                                         (LETT #3#
                                                               (SPADCALL #3#
                                                                         #5#
                                                                         (QREFELT
                                                                          $
                                                                          43))
                                                               . #28#))
                                                        ('T
                                                         (PROGN
                                                          (LETT #3# #5# . #28#)
                                                          (LETT #2# 'T
                                                                . #28#)))))))
                                                    (LETT |i| (|inc_SI| |i|)
                                                          . #28#)
                                                    (GO G190) G191 (EXIT NIL))
                                               (COND (#2# #3#)
                                                     ('T
                                                      (|spadConstant| $ 44))))
                                              |pol| (QREFELT $ 36))
                                             (QREFELT $ 45))
                                   . #28#)))))))
                       (LETT |l| (|inc_SI| |l|) . #28#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (CONS 0 |lcoef|))))))
          #29# (EXIT #9#)))) 

(SDEFUN |MLIFT;corrPoly;SupLLLLMU;1!2| ((|p1| NIL) ($$ NIL))
        (PROG (|l| |y| $ |a|)
          (LETT |l| (QREFELT $$ 3) . #1=(|MLIFT;corrPoly;SupLLLLMU;1|))
          (LETT |y| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |a| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|MLIFT;normalDerivM| |p1| |l| |y| $) |y| |a|
                      (QREFELT $ 20)))))) 

(SDEFUN |MLIFT;corrPoly;SupLLLLMU;1!1| ((|p1| NIL) ($$ NIL))
        (PROG (|y| |a| $)
          (LETT |y| (QREFELT $$ 2) . #1=(|MLIFT;corrPoly;SupLLLLMU;1|))
          (LETT |a| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |p1| |y| |a| (QREFELT $ 20)))))) 

(SDEFUN |MLIFT;corrPoly;SupLLLLMU;1!0| ((|p1| NIL) ($$ NIL))
        (PROG (|y| |a| $)
          (LETT |y| (QREFELT $$ 2) . #1=(|MLIFT;corrPoly;SupLLLLMU;1|))
          (LETT |a| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |p1| |y| |a| (QREFELT $ 20)))))) 

(SDEFUN |MLIFT;lifting1|
        ((|m| |SparseUnivariatePolynomial| P) (|lvar| . #1=(|List| OV))
         (|plist| |List| #2=(|SparseUnivariatePolynomial| P))
         (|vlist| |List| R) (|tlist| . #3=(|List| P))
         (|coeflist|
          . #4=(|List|
                (|List|
                 (|Record| (|:| |expt| (|NonNegativeInteger|))
                           (|:| |pcoef| P)))))
         (|listdeg| |List| (|NonNegativeInteger|))
         (|bsolv| |Mapping|
          (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed")
          (|SparseUnivariatePolynomial| R))
         ($ |Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
        (SPROG
         ((#5=#:G823 NIL) (|idegj| (|Integer|)) (#6=#:G842 NIL) (|term| NIL)
          (#7=#:G840 NIL) (#8=#:G841 NIL) (|alpha| NIL) (#9=#:G839 NIL)
          (|lalpha| #10=(|List| (|SparseUnivariatePolynomial| P)))
          (|flalpha|
           (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|mc| (|SparseUnivariatePolynomial| P)) (#11=#:G822 NIL)
          (#12=#:G805 NIL) (#13=#:G804 #2#) (#14=#:G806 #2#) (#15=#:G838 NIL)
          (|pol| (P)) (#16=#:G837 NIL) (|k| NIL) (|polc| (P))
          (|mj| (|SparseUnivariatePolynomial| P)) (#17=#:G835 NIL) (|tpol| NIL)
          (#18=#:G836 NIL) (|clist| NIL) (#19=#:G834 NIL) (#20=#:G832 NIL)
          (|p| NIL) (#21=#:G833 NIL) (|lcp| NIL) (#22=#:G831 NIL)
          (|clv|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (|tlv| (|List| P)) (|#G41| #4#) (|#G40| #3#) (#23=#:G830 NIL)
          (#24=#:G829 NIL) (#25=#:G828 NIL) (#26=#:G827 NIL) (#27=#:G826 NIL)
          (#28=#:G825 NIL) (|subsval| (|List| R)) (|subsvar| (|List| OV))
          (|ldeg| (|List| (|NonNegativeInteger|)))
          (|degj| (|NonNegativeInteger|)) (|v| (R)) (|conglist| #10#)
          (|li| #1#) (|x| (OV)) (#29=#:G824 NIL) (|j| NIL)
          (|testp| (|Boolean|)) (|nvar| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |conglist| NIL . #30=(|MLIFT;lifting1|))
                (LETT |nvar| (LENGTH |lvar|) . #30#)
                (LETT |testp| (NULL (NULL |tlist|)) . #30#)
                (LETT |lalpha| NIL . #30#) (LETT |tlv| NIL . #30#)
                (LETT |subsvar| NIL . #30#) (LETT |subsval| NIL . #30#)
                (LETT |li| |lvar| . #30#) (LETT |ldeg| NIL . #30#)
                (LETT |clv| NIL . #30#)
                (SEQ (LETT |j| 1 . #30#) (LETT #29# |nvar| . #30#) G190
                     (COND ((|greater_SI| |j| #29#) (GO G191)))
                     (SEQ (LETT |x| (|SPADfirst| |li|) . #30#)
                          (LETT |li| (CDR |li|) . #30#)
                          (LETT |conglist| |plist| . #30#)
                          (LETT |v| (|SPADfirst| |vlist|) . #30#)
                          (LETT |vlist| (CDR |vlist|) . #30#)
                          (LETT |degj| (SPADCALL |listdeg| |j| (QREFELT $ 49))
                                . #30#)
                          (LETT |ldeg| (CONS |degj| |ldeg|) . #30#)
                          (LETT |subsvar| (CONS |x| |subsvar|) . #30#)
                          (LETT |subsval| (CONS |v| |subsval|) . #30#)
                          (COND
                           (|testp|
                            (SEQ
                             (COND
                              ((< |j| |nvar|)
                               (SEQ
                                (LETT |tlv|
                                      (PROGN
                                       (LETT #28# NIL . #30#)
                                       (SEQ (LETT |p| NIL . #30#)
                                            (LETT #27# |tlist| . #30#) G190
                                            (COND
                                             ((OR (ATOM #27#)
                                                  (PROGN
                                                   (LETT |p| (CAR #27#) . #30#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #28#
                                                    (CONS
                                                     (SPADCALL |p| |li| |vlist|
                                                               (QREFELT $ 50))
                                                     #28#)
                                                    . #30#)))
                                            (LETT #27# (CDR #27#) . #30#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #28#))))
                                      . #30#)
                                (EXIT
                                 (LETT |clv|
                                       (PROGN
                                        (LETT #26# NIL . #30#)
                                        (SEQ (LETT |clist| NIL . #30#)
                                             (LETT #25# |coeflist| . #30#) G190
                                             (COND
                                              ((OR (ATOM #25#)
                                                   (PROGN
                                                    (LETT |clist| (CAR #25#)
                                                          . #30#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #26#
                                                     (CONS
                                                      (PROGN
                                                       (LETT #24# NIL . #30#)
                                                       (SEQ
                                                        (LETT |term| NIL
                                                              . #30#)
                                                        (LETT #23# |clist|
                                                              . #30#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #23#)
                                                              (PROGN
                                                               (LETT |term|
                                                                     (CAR #23#)
                                                                     . #30#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (LETT #24#
                                                                (CONS
                                                                 (CONS
                                                                  (QCAR |term|)
                                                                  (SPADCALL
                                                                   (QCDR
                                                                    |term|)
                                                                   |li| |vlist|
                                                                   (QREFELT $
                                                                            50)))
                                                                 #24#)
                                                                . #30#)))
                                                        (LETT #23# (CDR #23#)
                                                              . #30#)
                                                        (GO G190) G191
                                                        (EXIT
                                                         (NREVERSE #24#))))
                                                      #26#)
                                                     . #30#)))
                                             (LETT #25# (CDR #25#) . #30#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #26#))))
                                       . #30#))))
                              ('T
                               (PROGN
                                (LETT |#G40| |tlist| . #30#)
                                (LETT |#G41| |coeflist| . #30#)
                                (LETT |tlv| |#G40| . #30#)
                                (LETT |clv| |#G41| . #30#))))
                             (LETT |plist|
                                   (PROGN
                                    (LETT #22# NIL . #30#)
                                    (SEQ (LETT |lcp| NIL . #30#)
                                         (LETT #21# |tlv| . #30#)
                                         (LETT |p| NIL . #30#)
                                         (LETT #20# |plist| . #30#) G190
                                         (COND
                                          ((OR (ATOM #20#)
                                               (PROGN
                                                (LETT |p| (CAR #20#) . #30#)
                                                NIL)
                                               (ATOM #21#)
                                               (PROGN
                                                (LETT |lcp| (CAR #21#) . #30#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #22#
                                                 (CONS
                                                  (|MLIFT;subslead| |p| |lcp|
                                                   $)
                                                  #22#)
                                                 . #30#)))
                                         (LETT #20#
                                               (PROG1 (CDR #20#)
                                                 (LETT #21# (CDR #21#) . #30#))
                                               . #30#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #22#))))
                                   . #30#)
                             (EXIT
                              (COND
                               ((NULL (NULL |coeflist|))
                                (LETT |plist|
                                      (PROGN
                                       (LETT #19# NIL . #30#)
                                       (SEQ (LETT |clist| NIL . #30#)
                                            (LETT #18# |clv| . #30#)
                                            (LETT |tpol| NIL . #30#)
                                            (LETT #17# |plist| . #30#) G190
                                            (COND
                                             ((OR (ATOM #17#)
                                                  (PROGN
                                                   (LETT |tpol| (CAR #17#)
                                                         . #30#)
                                                   NIL)
                                                  (ATOM #18#)
                                                  (PROGN
                                                   (LETT |clist| (CAR #18#)
                                                         . #30#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #19#
                                                    (CONS
                                                     (|MLIFT;subscoef| |tpol|
                                                      |clist| $)
                                                     #19#)
                                                    . #30#)))
                                            (LETT #17#
                                                  (PROG1 (CDR #17#)
                                                    (LETT #18# (CDR #18#)
                                                          . #30#))
                                                  . #30#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #19#))))
                                      . #30#)))))))
                          (LETT |mj|
                                (SPADCALL
                                 (CONS #'|MLIFT;lifting1!0|
                                       (VECTOR $ |vlist| |li|))
                                 |m| (QREFELT $ 22))
                                . #30#)
                          (LETT |polc|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 51))
                                          (SPADCALL |v| (QREFELT $ 16))
                                          (QREFELT $ 41))
                                . #30#)
                          (LETT |pol| (|spadConstant| $ 39) . #30#)
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1 . #30#) (LETT #16# |degj| . #30#)
                                 G190
                                 (COND ((|greater_SI| |k| #16#) (GO G191)))
                                 (SEQ
                                  (LETT |pol|
                                        (SPADCALL |pol| |polc| (QREFELT $ 52))
                                        . #30#)
                                  (LETT |mc|
                                        (SPADCALL
                                         (PROGN
                                          (LETT #12# NIL . #30#)
                                          (SEQ (LETT |term| NIL . #30#)
                                               (LETT #15# |plist| . #30#) G190
                                               (COND
                                                ((OR (ATOM #15#)
                                                     (PROGN
                                                      (LETT |term| (CAR #15#)
                                                            . #30#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (PROGN
                                                  (LETT #14# |term| . #30#)
                                                  (COND
                                                   (#12#
                                                    (LETT #13#
                                                          (SPADCALL #13# #14#
                                                                    (QREFELT $
                                                                             36))
                                                          . #30#))
                                                   ('T
                                                    (PROGN
                                                     (LETT #13# #14# . #30#)
                                                     (LETT #12# 'T
                                                           . #30#)))))))
                                               (LETT #15# (CDR #15#) . #30#)
                                               (GO G190) G191 (EXIT NIL))
                                          (COND (#12# #13#)
                                                ('T (|spadConstant| $ 37))))
                                         |mj| (QREFELT $ 45))
                                        . #30#)
                                  (COND
                                   ((SPADCALL |mc| (|spadConstant| $ 44)
                                              (QREFELT $ 48))
                                    (PROGN
                                     (LETT #11# |$NoValue| . #30#)
                                     (GO #31=#:G816))))
                                  (LETT |mc|
                                        (SPADCALL
                                         (CONS #'|MLIFT;lifting1!1|
                                               (VECTOR $ |x| |k|))
                                         |mc| (QREFELT $ 22))
                                        . #30#)
                                  (LETT |mc|
                                        (SPADCALL
                                         (CONS #'|MLIFT;lifting1!2|
                                               (VECTOR $ |v| |x|))
                                         |mc| (QREFELT $ 22))
                                        . #30#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL |mc| (|spadConstant| $ 44)
                                               (QREFELT $ 48))
                                     "next k")
                                    ('T
                                     (SEQ
                                      (LETT |flalpha|
                                            (SPADCALL |mc| (CDR |subsvar|)
                                                      (CDR |subsval|)
                                                      (CDR |ldeg|) |conglist|
                                                      |bsolv| (QREFELT $ 30))
                                            . #30#)
                                      (COND
                                       ((QEQCAR |flalpha| 1)
                                        (PROGN
                                         (LETT #5# (CONS 1 "failed") . #30#)
                                         (GO #32=#:G821)))
                                       ('T
                                        (LETT |lalpha| (QCDR |flalpha|)
                                              . #30#)))
                                      (EXIT
                                       (LETT |plist|
                                             (PROGN
                                              (LETT #9# NIL . #30#)
                                              (SEQ (LETT |alpha| NIL . #30#)
                                                   (LETT #8# |lalpha| . #30#)
                                                   (LETT |term| NIL . #30#)
                                                   (LETT #7# |plist| . #30#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #7#)
                                                         (PROGN
                                                          (LETT |term|
                                                                (CAR #7#)
                                                                . #30#)
                                                          NIL)
                                                         (ATOM #8#)
                                                         (PROGN
                                                          (LETT |alpha|
                                                                (CAR #8#)
                                                                . #30#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #9#
                                                           (CONS
                                                            (SPADCALL |term|
                                                                      (SPADCALL
                                                                       |alpha|
                                                                       |pol|
                                                                       (QREFELT
                                                                        $ 53))
                                                                      (QREFELT
                                                                       $ 45))
                                                            #9#)
                                                           . #30#)))
                                                   (LETT #7#
                                                         (PROG1 (CDR #7#)
                                                           (LETT #8# (CDR #8#)
                                                                 . #30#))
                                                         . #30#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #9#))))
                                             . #30#)))))))
                                 (LETT |k| (|inc_SI| |k|) . #30#) (GO G190)
                                 G191 (EXIT NIL)))
                           #31# (EXIT #11#))
                          (LETT |idegj| (|MLIFT;maxDegree| |m| |x| $) . #30#)
                          (SEQ (LETT |term| NIL . #30#)
                               (LETT #6# |plist| . #30#) G190
                               (COND
                                ((OR (ATOM #6#)
                                     (PROGN
                                      (LETT |term| (CAR #6#) . #30#)
                                      NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |idegj|
                                       (- |idegj|
                                          (|MLIFT;maxDegree| |term| |x| $))
                                       . #30#)))
                               (LETT #6# (CDR #6#) . #30#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            ((< |idegj| 0)
                             (PROGN
                              (LETT #5# (CONS 1 "failed") . #30#)
                              (GO #32#))))))
                     (LETT |j| (|inc_SI| |j|) . #30#) (GO G190) G191
                     (EXIT NIL))
                (EXIT (CONS 0 |plist|))))
          #32# (EXIT #5#)))) 

(SDEFUN |MLIFT;lifting1!2| ((|p1| NIL) ($$ NIL))
        (PROG (|x| |v| $)
          (LETT |x| (QREFELT $$ 2) . #1=(|MLIFT;lifting1|))
          (LETT |v| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (SPADCALL |p1| (LIST |x|) (LIST |v|) (QREFELT $ 50)))))) 

(SDEFUN |MLIFT;lifting1!1| ((|p1| NIL) ($$ NIL))
        (PROG (|k| |x| $)
          (LETT |k| (QREFELT $$ 2) . #1=(|MLIFT;lifting1|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MLIFT;normalDerivM| |p1| |k| |x| $))))) 

(SDEFUN |MLIFT;lifting1!0| ((|p1| NIL) ($$ NIL))
        (PROG (|li| |vlist| $)
          (LETT |li| (QREFELT $$ 2) . #1=(|MLIFT;lifting1|))
          (LETT |vlist| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |p1| |li| |vlist| (QREFELT $ 50)))))) 

(SDEFUN |MLIFT;maxDegree|
        ((|um| |SparseUnivariatePolynomial| P) (|x| OV)
         ($ |NonNegativeInteger|))
        (SPROG ((|ans| (|NonNegativeInteger|)))
               (SEQ (LETT |ans| 0 . #1=(|MLIFT;maxDegree|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |um| (|spadConstant| $ 44)
                                      (QREFELT $ 54)))
                           (GO G191)))
                         (SEQ
                          (LETT |ans|
                                (MAX |ans|
                                     (SPADCALL (SPADCALL |um| (QREFELT $ 55))
                                               |x| (QREFELT $ 56)))
                                . #1#)
                          (EXIT
                           (LETT |um| (SPADCALL |um| (QREFELT $ 57)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |MLIFT;lifting;SupLLLLLMU;4|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|plist| |List| (|SparseUnivariatePolynomial| R)) (|vlist| |List| R)
         (|tlist| |List| P) (|listdeg| |List| (|NonNegativeInteger|))
         (|gen_solv| |Mapping|
          (|Mapping|
           (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed")
           (|SparseUnivariatePolynomial| R))
          (|List| (|SparseUnivariatePolynomial| R)))
         ($ |Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
        (SPROG
         ((#1=#:G873 NIL)
          (|ffl| (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|coeflist|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (#2=#:G861 NIL) (#3=#:G858 NIL)
          (#4=#:G857 #5=(|SparseUnivariatePolynomial| P)) (#6=#:G859 #5#)
          (#7=#:G878 NIL) (|pol| NIL)
          (|nplist| (|List| (|SparseUnivariatePolynomial| P))) (#8=#:G877 NIL)
          (|pp| NIL) (#9=#:G876 NIL)
          (|listdet| (|List| (|SparseUnivariatePolynomial| P)))
          (|ldcoef|
           (|Record| (|:| |deter| (|List| (|SparseUnivariatePolynomial| P)))
                     (|:| |dterm|
                          (|List|
                           (|List|
                            (|Record| (|:| |expt| (|NonNegativeInteger|))
                                      (|:| |pcoef| P)))))
                     (|:| |nfacts| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |nlead| (|List| P))))
          (#10=#:G875 NIL) (#11=#:G874 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |nplist|
                  (PROGN
                   (LETT #11# NIL . #12=(|MLIFT;lifting;SupLLLLLMU;4|))
                   (SEQ (LETT |pp| NIL . #12#) (LETT #10# |plist| . #12#) G190
                        (COND
                         ((OR (ATOM #10#)
                              (PROGN (LETT |pp| (CAR #10#) . #12#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #11#
                                (CONS (SPADCALL (ELT $ 16) |pp| (QREFELT $ 19))
                                      #11#)
                                . #12#)))
                        (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                        (EXIT (NREVERSE #11#))))
                  . #12#)
            (LETT |listdet| NIL . #12#) (LETT |coeflist| NIL . #12#)
            (COND
             ((NULL (NULL |tlist|))
              (SEQ
               (LETT |ldcoef| (SPADCALL |um| |plist| |tlist| (QREFELT $ 63))
                     . #12#)
               (EXIT
                (COND
                 ((NULL (NULL (LETT |listdet| (QVELT |ldcoef| 0) . #12#)))
                  (SEQ
                   (COND
                    ((EQL (LENGTH |listdet|) (LENGTH |plist|))
                     (PROGN
                      (LETT #1# (CONS 0 |listdet|) . #12#)
                      (GO #13=#:G872))))
                   (LETT |plist| (QVELT |ldcoef| 2) . #12#)
                   (LETT |nplist|
                         (PROGN
                          (LETT #9# NIL . #12#)
                          (SEQ (LETT |pp| NIL . #12#) (LETT #8# |plist| . #12#)
                               G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN (LETT |pp| (CAR #8#) . #12#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #9#
                                       (CONS
                                        (SPADCALL (ELT $ 16) |pp|
                                                  (QREFELT $ 19))
                                        #9#)
                                       . #12#)))
                               (LETT #8# (CDR #8#) . #12#) (GO G190) G191
                               (EXIT (NREVERSE #9#))))
                         . #12#)
                   (LETT |um|
                         (PROG2
                             (LETT #2#
                                   (SPADCALL |um|
                                             (PROGN
                                              (LETT #3# NIL . #12#)
                                              (SEQ (LETT |pol| NIL . #12#)
                                                   (LETT #7# |listdet| . #12#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #7#)
                                                         (PROGN
                                                          (LETT |pol| (CAR #7#)
                                                                . #12#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #6# |pol| . #12#)
                                                      (COND
                                                       (#3#
                                                        (LETT #4#
                                                              (SPADCALL #4# #6#
                                                                        (QREFELT
                                                                         $ 36))
                                                              . #12#))
                                                       ('T
                                                        (PROGN
                                                         (LETT #4# #6# . #12#)
                                                         (LETT #3# 'T
                                                               . #12#)))))))
                                                   (LETT #7# (CDR #7#) . #12#)
                                                   (GO G190) G191 (EXIT NIL))
                                              (COND (#3# #4#)
                                                    ('T
                                                     (|spadConstant| $ 37))))
                                             (QREFELT $ 65))
                                   . #12#)
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 9))
                                           (|Union|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 9))
                                            "failed")
                                           #2#))
                         . #12#)
                   (LETT |tlist| (QVELT |ldcoef| 3) . #12#)
                   (EXIT (LETT |coeflist| (QVELT |ldcoef| 1) . #12#)))))))))
            (LETT |ffl|
                  (|MLIFT;lifting1| |um| |lvar| |nplist| |vlist| |tlist|
                   |coeflist| |listdeg| (SPADCALL |plist| |gen_solv|) $)
                  . #12#)
            (COND
             ((QEQCAR |ffl| 1)
              (PROGN (LETT #1# (CONS 1 "failed") . #12#) (GO #13#))))
            (EXIT (CONS 0 (SPADCALL |listdet| (QCDR |ffl|) (QREFELT $ 66))))))
          #13# (EXIT #1#)))) 

(SDEFUN |MLIFT;gen_solv|
        ((|plist| |List| (|SparseUnivariatePolynomial| R)) (|pmod| R)
         ($ |Mapping|
          (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed")
          (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|table| (|Vector| (|List| (|SparseUnivariatePolynomial| R))))
          (|tab|
           (|Union| (|Vector| (|List| (|SparseUnivariatePolynomial| R)))
                    "failed"))
          (|du| (|NonNegativeInteger|))
          (|ldeg| (|List| (|NonNegativeInteger|))) (#1=#:G898 NIL) (|p| NIL)
          (#2=#:G897 NIL))
         (SEQ
          (LETT |ldeg|
                (PROGN
                 (LETT #2# NIL . #3=(|MLIFT;gen_solv|))
                 (SEQ (LETT |p| NIL . #3#) (LETT #1# |plist| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 69)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |du| (SPADCALL (ELT $ 71) |ldeg| (QREFELT $ 73)) . #3#)
          (LETT |tab| (SPADCALL |du| |pmod| |plist| (QREFELT $ 76)) . #3#)
          (EXIT
           (COND
            ((QEQCAR |tab| 1) (|error| "Table construction failed in MLIFT"))
            ('T
             (SEQ (LETT |table| (QCDR |tab|) . #3#)
                  (EXIT
                   (CONS #'|MLIFT;gen_solv!0| (VECTOR $ |table| |pmod|)))))))))) 

(SDEFUN |MLIFT;gen_solv!0| ((|b| NIL) ($$ NIL))
        (PROG (|pmod| |table| $)
          (LETT |pmod| (QREFELT $$ 2) . #1=(|MLIFT;gen_solv|))
          (LETT |table| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |b| |pmod| |table| (QREFELT $ 78)))))) 

(SDEFUN |MLIFT;lifting;SupLLLLLRU;6|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|plist| |List| (|SparseUnivariatePolynomial| R)) (|vlist| |List| R)
         (|tlist| |List| P) (|listdeg| |List| (|NonNegativeInteger|))
         (|pmod| R)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
        (SPROG NIL
               (SPADCALL |um| |lvar| |plist| |vlist| |tlist| |listdeg|
                         (CONS #'|MLIFT;lifting;SupLLLLLRU;6!0|
                               (VECTOR $ |pmod|))
                         (QREFELT $ 68)))) 

(SDEFUN |MLIFT;lifting;SupLLLLLRU;6!0| ((|lb| NIL) ($$ NIL))
        (PROG (|pmod| $)
          (LETT |pmod| (QREFELT $$ 1) . #1=(|MLIFT;lifting;SupLLLLLRU;6|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MLIFT;gen_solv| |lb| |pmod| $))))) 

(SDEFUN |MLIFT;normalDerivM| ((|g| P) (|m| |Integer|) (|x| OV) ($ P))
        (SPADCALL (|MLIFT;normalDeriv| (SPADCALL |g| |x| (QREFELT $ 81)) |m| $)
                  |x| (QREFELT $ 82))) 

(SDEFUN |MLIFT;normalDeriv|
        ((|f| |SparseUnivariatePolynomial| P) (|m| |Integer|)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|n| #1=(|Integer|)) (|ris| (|SparseUnivariatePolynomial| P))
          (#2=#:G912 NIL) (|n1| #1#) (|k| (|Integer|))
          (|#G1| (|NonNegativeInteger|)))
         (SEQ
          (LETT |#G1| (SPADCALL |f| (QREFELT $ 83)) . #3=(|MLIFT;normalDeriv|))
          (LETT |n1| |#G1| . #3#)
          (EXIT
           (COND ((< |#G1| |m|) (|spadConstant| $ 44))
                 ((EQL |n1| |m|)
                  (SPADCALL (SPADCALL |f| (QREFELT $ 55)) (QREFELT $ 42)))
                 ('T
                  (SEQ (LETT |k| (SPADCALL |n1| |m| (QREFELT $ 85)) . #3#)
                       (LETT |ris| (|spadConstant| $ 44) . #3#)
                       (LETT |n| |n1| . #3#)
                       (SEQ G190 (COND ((NULL (>= |n| |m|)) (GO G191)))
                            (SEQ
                             (SEQ G190
                                  (COND
                                   ((NULL (SPADCALL |n1| |n| (QREFELT $ 86)))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |k|
                                         (QUOTIENT2 (* |k| (- |n1| |m|)) |n1|)
                                         . #3#)
                                   (EXIT (LETT |n1| (- |n1| 1) . #3#)))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (LETT |ris|
                                   (SPADCALL |ris|
                                             (SPADCALL
                                              (SPADCALL |k|
                                                        (SPADCALL |f|
                                                                  (QREFELT $
                                                                           55))
                                                        (QREFELT $ 87))
                                              (PROG1
                                                  (LETT #2# (- |n| |m|) . #3#)
                                                (|check_subtype2| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #2#))
                                              (QREFELT $ 88))
                                             (QREFELT $ 43))
                                   . #3#)
                             (LETT |f| (SPADCALL |f| (QREFELT $ 57)) . #3#)
                             (EXIT
                              (LETT |n| (SPADCALL |f| (QREFELT $ 83)) . #3#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |ris|)))))))) 

(SDEFUN |MLIFT;subslead|
        ((|m| |SparseUnivariatePolynomial| P) (|pol| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG ((|dm| (|NonNegativeInteger|)))
               (SEQ (LETT |dm| (SPADCALL |m| (QREFELT $ 83)) |MLIFT;subslead|)
                    (EXIT
                     (SPADCALL (SPADCALL |pol| |dm| (QREFELT $ 88))
                               (SPADCALL |m| (QREFELT $ 57)) (QREFELT $ 43)))))) 

(SDEFUN |MLIFT;subscoef|
        ((|um| |SparseUnivariatePolynomial| P)
         (|lterm| |List|
          (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|new| (|SparseUnivariatePolynomial| P)) (|i| (|NonNegativeInteger|))
          (#1=#:G921 NIL) (|k| NIL) (|dm| (|NonNegativeInteger|)))
         (SEQ
          (LETT |dm| (SPADCALL |um| (QREFELT $ 83)) . #2=(|MLIFT;subscoef|))
          (LETT |new|
                (SPADCALL (SPADCALL |um| (QREFELT $ 55)) |dm| (QREFELT $ 88))
                . #2#)
          (SEQ (LETT |k| (- |dm| 1) . #2#) G190 (COND ((< |k| 0) (GO G191)))
               (SEQ
                (LETT |i|
                      (PROG1 (LETT #1# |k| . #2#)
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#))
                      . #2#)
                (COND
                 ((OR (NULL |lterm|)
                      (SPADCALL (QCAR (|SPADfirst| |lterm|)) |i|
                                (QREFELT $ 33)))
                  (EXIT
                   (LETT |new|
                         (SPADCALL |new|
                                   (SPADCALL (SPADCALL |um| |i| (QREFELT $ 89))
                                             |i| (QREFELT $ 88))
                                   (QREFELT $ 43))
                         . #2#))))
                (LETT |new|
                      (SPADCALL |new|
                                (SPADCALL (QCDR (|SPADfirst| |lterm|)) |i|
                                          (QREFELT $ 88))
                                (QREFELT $ 43))
                      . #2#)
                (EXIT (LETT |lterm| (CDR |lterm|) . #2#)))
               (LETT |k| (+ |k| -1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |new|)))) 

(DECLAIM (NOTINLINE |MultivariateLifting;|)) 

(DEFUN |MultivariateLifting| (&REST #1=#:G928)
  (SPROG NIL
         (PROG (#2=#:G929)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultivariateLifting|)
                                               '|domainEqualList|)
                    . #3=(|MultivariateLifting|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultivariateLifting;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultivariateLifting|)))))))))) 

(DEFUN |MultivariateLifting;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|MultivariateLifting|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|MultivariateLifting| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 90) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|EuclideanDomain|))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|MultivariateLifting|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 79
                 (CONS (|dispatchFunction| |MLIFT;lifting;SupLLLLLRU;6|) $)))))
    $))) 

(MAKEPROP '|MultivariateLifting| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |ground|)
              (|SparseUnivariatePolynomial| 8) (|Mapping| 8 9)
              (|SparseUnivariatePolynomial| 9)
              (|SparseUnivariatePolynomialFunctions2| 9 8) (5 . |map|)
              (11 . |coerce|) (|Mapping| 9 8)
              (|SparseUnivariatePolynomialFunctions2| 8 9) (16 . |map|)
              (22 . |eval|) (|Mapping| 9 9) (29 . |map|) (|Union| 27 '"failed")
              (|List| 7) (|List| 8) (|List| 32) (|List| 13)
              (|Union| 60 '"failed") (|Mapping| 28 11)
              |MLIFT;corrPoly;SupLLLLMU;1| (|Boolean|) (|NonNegativeInteger|)
              (35 . ~=) (|Integer|) (41 . |elt|) (47 . *) (53 . |One|)
              (57 . |One|) (61 . |One|) (65 . |monomial|) (72 . -)
              (78 . |coerce|) (83 . +) (89 . |Zero|) (93 . -) (99 . |Zero|)
              (103 . |Zero|) (107 . =) (113 . |elt|) (119 . |eval|)
              (126 . |coerce|) (131 . *) (137 . *) (143 . ~=)
              (149 . |leadingCoefficient|) (154 . |degree|) (160 . |reductum|)
              (|Record| (|:| |expt| 32) (|:| |pcoef| 9))
              (|Record| (|:| |deter| 27) (|:| |dterm| (|List| (|List| 58)))
                        (|:| |nfacts| 60) (|:| |nlead| 61))
              (|List| 11) (|List| 9) (|NPCoef| 11 6 7 8 9) (165 . |npcoef|)
              (|Union| $ '"failed") (172 . |exquo|) (178 . |append|)
              (|Mapping| 29 60) |MLIFT;lifting;SupLLLLLMU;4| (184 . |degree|)
              (189 . +) (195 . +) (|Mapping| 32 32 32) (201 . |reduce|)
              (|Union| 77 '"failed") (|GenExEuclid| 8 11) (207 . |tablePow|)
              (|Vector| 60) (214 . |solveid|) (221 . |lifting|)
              (|SparseUnivariatePolynomial| $) (232 . |univariate|)
              (238 . |multivariate|) (244 . |degree|)
              (|IntegerCombinatoricFunctions| 34) (249 . |binomial|) (255 . >)
              (261 . *) (267 . |monomial|) (273 . |coefficient|))
           '#(|lifting| 279 |corrPoly| 301) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 89
                                                 '(1 9 8 0 10 2 14 11 12 13 15
                                                   1 9 0 8 16 2 18 13 17 11 19
                                                   3 9 0 0 7 0 20 2 13 0 21 0
                                                   22 2 32 31 0 0 33 2 27 13 0
                                                   34 35 2 13 0 0 0 36 0 13 0
                                                   37 0 8 0 38 0 9 0 39 3 9 0 0
                                                   7 32 40 2 9 0 0 0 41 1 13 0
                                                   9 42 2 13 0 0 0 43 0 13 0 44
                                                   2 13 0 0 0 45 0 6 0 46 0 8 0
                                                   47 2 13 31 0 0 48 2 26 32 0
                                                   34 49 3 9 0 0 24 25 50 1 9 0
                                                   7 51 2 9 0 0 0 52 2 13 0 0 9
                                                   53 2 13 31 0 0 54 1 13 9 0
                                                   55 2 9 32 0 7 56 1 13 0 0 57
                                                   3 62 59 13 60 61 63 2 13 64
                                                   0 0 65 2 27 0 0 0 66 1 11 32
                                                   0 69 2 11 0 0 0 70 2 32 0 0
                                                   0 71 2 26 32 72 0 73 3 75 74
                                                   32 8 60 76 3 75 28 11 8 77
                                                   78 7 0 23 13 24 60 25 61 26
                                                   8 79 2 9 80 0 7 81 2 9 0 80
                                                   7 82 1 13 32 0 83 2 84 34 34
                                                   34 85 2 34 31 0 0 86 2 9 0
                                                   34 0 87 2 13 0 9 32 88 2 13
                                                   9 0 32 89 7 1 23 13 24 60 25
                                                   61 26 8 79 7 0 23 13 24 60
                                                   25 61 26 67 68 6 0 23 13 24
                                                   25 26 27 29 30)))))
           '|lookupComplete|)) 
