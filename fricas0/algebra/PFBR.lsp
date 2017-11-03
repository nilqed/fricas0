
(SDEFUN |PFBR;gen_solv|
        ((|fl| |List| (|SparseUnivariatePolynomial| R))
         ($ |Mapping|
          (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed")
          (|SparseUnivariatePolynomial| R)))
        (SPROG NIL (CONS #'|PFBR;gen_solv!0| (VECTOR $ |fl|)))) 

(SDEFUN |PFBR;gen_solv!0| ((|pr| NIL) ($$ NIL))
        (PROG (|fl| $)
          (LETT |fl| (QREFELT $$ 1) . #1=(|PFBR;gen_solv|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |fl| |pr| (QREFELT $ 13)))))) 

(SDEFUN |PFBR;randomR;IR;2| ((|n| |Integer|) ($ R)) (SPADCALL (QREFELT $ 14))) 

(SDEFUN |PFBR;randomR;IR;3| ((|n| |Integer|) ($ R))
        (SPADCALL (- (RANDOM (+ (SPADCALL 2 |n| (QREFELT $ 18)) 1)) |n|)
                  (QREFELT $ 19))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;4|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S) (|v| |VarSet|)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPROG
         ((#1=#:G747 NIL) (|w| NIL) (#2=#:G746 NIL)
          (|ans|
           (|Union|
            (|List|
             (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| R)))
            "failed"))
          (|ppR|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| R)))
          (|lpolysR|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| R))))
          (#3=#:G745 NIL) (|u| NIL) (#4=#:G744 NIL))
         (SEQ
          (LETT |lpolysR|
                (PROGN
                 (LETT #4# NIL . #5=(|PFBR;bivariateSLPEBR;LSupVarSetU;4|))
                 (SEQ (LETT |u| NIL . #5#) (LETT #3# |lpolys| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS (SPADCALL (ELT $ 21) |u| (QREFELT $ 26))
                                    #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |ppR| (SPADCALL (ELT $ 21) |pp| (QREFELT $ 26)) . #5#)
          (LETT |ans| (SPADCALL |lpolysR| |ppR| (QREFELT $ 27)) . #5#)
          (EXIT
           (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (PROGN
                         (LETT #2# NIL . #5#)
                         (SEQ (LETT |w| NIL . #5#)
                              (LETT #1# (QCDR |ans|) . #5#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |w| (CAR #1#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL
                                        (CONS
                                         #'|PFBR;bivariateSLPEBR;LSupVarSetU;4!0|
                                         (VECTOR $ |v|))
                                        |w| (QREFELT $ 32))
                                       #2#)
                                      . #5#)))
                              (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;4!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;bivariateSLPEBR;LSupVarSetU;4|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 29)))))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;5|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S) (|v| |VarSet|)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPADCALL |lpolys| |pp| (QREFELT $ 37))) 

(SDEFUN |PFBR;chooseFSQViableSubstitutions|
        ((|lvpp| |List| |VarSet|) (|pp| |SparseUnivariatePolynomial| S)
         ($ |Record| (|:| |substnsField| (|List| R))
          (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
        (SPROG
         ((#1=#:G762 NIL) (|ppR| (|SparseUnivariatePolynomial| R))
          (|substns| (|List| R)) (#2=#:G764 NIL) (|v| NIL) (#3=#:G763 NIL)
          (|n| (|Integer|)))
         (SEQ (LETT |n| 1 . #4=(|PFBR;chooseFSQViableSubstitutions|))
              (SEQ
               (EXIT
                (SEQ G190 (COND ((NULL 'T) (GO G191)))
                     (SEQ
                      (LETT |n| (+ (SPADCALL 2 |n| (QREFELT $ 18)) 1) . #4#)
                      (LETT |substns|
                            (PROGN
                             (LETT #3# NIL . #4#)
                             (SEQ (LETT |v| NIL . #4#) (LETT #2# |lvpp| . #4#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |v| (CAR #2#) . #4#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS (SPADCALL |n| (QREFELT $ 16))
                                                #3#)
                                          . #4#)))
                                  (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            . #4#)
                      (EXIT
                       (COND
                        ((SPADCALL
                          (SPADCALL (SPADCALL |pp| (QREFELT $ 38)) |lvpp|
                                    |substns| (QREFELT $ 41))
                          (QREFELT $ 43))
                         "next")
                        ('T
                         (SEQ
                          (LETT |ppR|
                                (SPADCALL
                                 (CONS #'|PFBR;chooseFSQViableSubstitutions!0|
                                       (VECTOR $ |substns| |lvpp|))
                                 |pp| (QREFELT $ 47))
                                . #4#)
                          (EXIT
                           (COND
                            ((OR
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |ppR| (SPADCALL |ppR| (QREFELT $ 48))
                                          (QREFELT $ 49))
                                (QREFELT $ 51))
                               0 (QREFELT $ 52))
                              (NULL
                               (SPADCALL (SPADCALL |ppR| (QREFELT $ 53))
                                         (QREFELT $ 54))))
                             "next")
                            ('T
                             (PROGN
                              (LETT #1# |$NoValue| . #4#)
                              (GO #5=#:G759))))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #5# (EXIT #1#))
              (EXIT (CONS |substns| |ppR|))))) 

(SDEFUN |PFBR;chooseFSQViableSubstitutions!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lvpp| |substns| $)
          (LETT |lvpp| (QREFELT $$ 2)
                . #1=(|PFBR;chooseFSQViableSubstitutions|))
          (LETT |substns| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| |lvpp| |substns| (QREFELT $ 41))
                      (QREFELT $ 44)))))) 

(SDEFUN |PFBR;chooseSLPEViableSubstitutions|
        ((|lvpolys| |List| |VarSet|)
         (|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Record| (|:| |substnsField| (|List| R))
          (|:| |lpolysRField| (|List| (|SparseUnivariatePolynomial| R)))
          (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
        (SPROG
         ((|ppR| (|SparseUnivariatePolynomial| R)) (#1=#:G791 NIL)
          (|uu| #2=(|List| (|SparseUnivariatePolynomial| R))) (#3=#:G790 NIL)
          (#4=#:G778 NIL) (#5=#:G777 #6=(|Boolean|)) (#7=#:G779 #6#)
          (#8=#:G797 NIL) (|v| NIL) (|lpolysR| #2#) (#9=#:G796 NIL) (|u| NIL)
          (#10=#:G795 NIL) (#11=#:G768 NIL) (#12=#:G767 #13=(|Boolean|))
          (#14=#:G769 #13#) (#15=#:G794 NIL) (|substns| (|List| R))
          (#16=#:G793 NIL) (#17=#:G792 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| 1 . #18=(|PFBR;chooseSLPEViableSubstitutions|))
              (SEQ
               (EXIT
                (SEQ G190 (COND ((NULL 'T) (GO G191)))
                     (SEQ
                      (LETT |n| (+ (SPADCALL 2 |n| (QREFELT $ 18)) 1) . #18#)
                      (LETT |substns|
                            (PROGN
                             (LETT #17# NIL . #18#)
                             (SEQ (LETT |v| NIL . #18#)
                                  (LETT #16# |lvpolys| . #18#) G190
                                  (COND
                                   ((OR (ATOM #16#)
                                        (PROGN
                                         (LETT |v| (CAR #16#) . #18#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #17#
                                          (CONS (SPADCALL |n| (QREFELT $ 16))
                                                #17#)
                                          . #18#)))
                                  (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                                  (EXIT (NREVERSE #17#))))
                            . #18#)
                      (EXIT
                       (COND
                        ((OR
                          (SPADCALL
                           (SPADCALL (SPADCALL |pp| (QREFELT $ 38)) |lvpolys|
                                     |substns| (QREFELT $ 41))
                           (QREFELT $ 43))
                          (PROGN
                           (LETT #11# NIL . #18#)
                           (SEQ (LETT |u| NIL . #18#)
                                (LETT #15# |lpolys| . #18#) G190
                                (COND
                                 ((OR (ATOM #15#)
                                      (PROGN (LETT |u| (CAR #15#) . #18#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #14#
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |u| (QREFELT $ 38))
                                           |lvpolys| |substns| (QREFELT $ 41))
                                          (QREFELT $ 43))
                                         . #18#)
                                   (COND
                                    (#11#
                                     (LETT #12# (COND (#12# 'T) ('T #14#))
                                           . #18#))
                                    ('T
                                     (PROGN
                                      (LETT #12# #14# . #18#)
                                      (LETT #11# 'T . #18#)))))))
                                (LETT #15# (CDR #15#) . #18#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#11# #12#) ('T NIL))))
                         "next")
                        ('T
                         (SEQ
                          (LETT |lpolysR|
                                (PROGN
                                 (LETT #10# NIL . #18#)
                                 (SEQ (LETT |u| NIL . #18#)
                                      (LETT #9# |lpolys| . #18#) G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN
                                             (LETT |u| (CAR #9#) . #18#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #10#
                                              (CONS
                                               (SPADCALL
                                                (CONS
                                                 #'|PFBR;chooseSLPEViableSubstitutions!0|
                                                 (VECTOR $ |substns|
                                                         |lvpolys|))
                                                |u| (QREFELT $ 47))
                                               #10#)
                                              . #18#)))
                                      (LETT #9# (CDR #9#) . #18#) (GO G190)
                                      G191 (EXIT (NREVERSE #10#))))
                                . #18#)
                          (LETT |uu| |lpolysR| . #18#)
                          (SEQ
                           (EXIT
                            (SEQ G190
                                 (COND ((NULL (NULL (NULL |uu|))) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((PROGN
                                      (LETT #4# NIL . #18#)
                                      (SEQ (LETT |v| NIL . #18#)
                                           (LETT #8# (CDR |uu|) . #18#) G190
                                           (COND
                                            ((OR (ATOM #8#)
                                                 (PROGN
                                                  (LETT |v| (CAR #8#) . #18#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (PROGN
                                              (LETT #7#
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (|SPADfirst| |uu|) |v|
                                                       (QREFELT $ 49))
                                                      (QREFELT $ 51))
                                                     0 (QREFELT $ 52))
                                                    . #18#)
                                              (COND
                                               (#4#
                                                (LETT #5#
                                                      (COND (#5# 'T) ('T #7#))
                                                      . #18#))
                                               ('T
                                                (PROGN
                                                 (LETT #5# #7# . #18#)
                                                 (LETT #4# 'T . #18#)))))))
                                           (LETT #8# (CDR #8#) . #18#)
                                           (GO G190) G191 (EXIT NIL))
                                      (COND (#4# #5#) ('T NIL)))
                                     (PROGN
                                      (LETT #3# |$NoValue| . #18#)
                                      (GO #19=#:G781)))
                                    ('T (LETT |uu| (CDR |uu|) . #18#)))))
                                 NIL (GO G190) G191 (EXIT NIL)))
                           #19# (EXIT #3#))
                          (COND ((NULL (NULL |uu|)) (EXIT "next")))
                          (EXIT
                           (PROGN
                            (LETT #1# |$NoValue| . #18#)
                            (GO #20=#:G786))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #20# (EXIT #1#))
              (LETT |ppR|
                    (SPADCALL
                     (CONS #'|PFBR;chooseSLPEViableSubstitutions!1|
                           (VECTOR $ |substns| |lvpolys|))
                     |pp| (QREFELT $ 47))
                    . #18#)
              (EXIT (VECTOR |substns| |lpolysR| |ppR|))))) 

(SDEFUN |PFBR;chooseSLPEViableSubstitutions!1| ((|z1| NIL) ($$ NIL))
        (PROG (|lvpolys| |substns| $)
          (LETT |lvpolys| (QREFELT $$ 2)
                . #1=(|PFBR;chooseSLPEViableSubstitutions|))
          (LETT |substns| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| |lvpolys| |substns| (QREFELT $ 41))
                      (QREFELT $ 44)))))) 

(SDEFUN |PFBR;chooseSLPEViableSubstitutions!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lvpolys| |substns| $)
          (LETT |lvpolys| (QREFELT $$ 2)
                . #1=(|PFBR;chooseSLPEViableSubstitutions|))
          (LETT |substns| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| |lvpolys| |substns| (QREFELT $ 41))
                      (QREFELT $ 44)))))) 

(SDEFUN |PFBR;raise|
        ((|supR| |SparseUnivariatePolynomial| R)
         ($ |SparseUnivariatePolynomial| S))
        (SPADCALL (ELT $ 55) |supR| (QREFELT $ 58))) 

(SDEFUN |PFBR;lower|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| R))
        (SPADCALL (ELT $ 44) |pp| (QREFELT $ 47))) 

(SDEFUN |PFBR;SLPEBR|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|lvpolys| . #1=(|List| |VarSet|))
         (|pp| |SparseUnivariatePolynomial| S) (|lvpp| . #1#)
         ($ . #2=(|Union| (|List| (|SparseUnivariatePolynomial| S)) "failed")))
        (SPROG
         ((|ansR| (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed"))
          (|cVS|
           (|Record| (|:| |substnsField| (|List| R))
                     (|:| |lpolysRField|
                          (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
          (#3=#:G840 NIL) (|uu| NIL) (#4=#:G839 NIL) (#5=#:G828 NIL)
          (|ppR| (|SparseUnivariatePolynomial| R))
          (|lpolysR| (|List| (|SparseUnivariatePolynomial| R))) (#6=#:G838 NIL)
          (|u| NIL) (#7=#:G837 NIL) (#8=#:G836 NIL)
          (|pp1|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| S)))
          (#9=#:G835 NIL)
          (|ans|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| S))))
          (#10=#:G833 NIL) (|a| NIL) (#11=#:G834 NIL) (|a1| NIL)
          (#12=#:G832 NIL) (|d| (|NonNegativeInteger|)) (|ans1| #2#)
          (#13=#:G831 NIL) (|m| (|List| |VarSet|)) (#14=#:G830 NIL)
          (#15=#:G829 NIL) (|v| (|VarSet|)))
         (SEQ
          (EXIT
           (COND
            ((NULL
              (NULL
               (LETT |m| (SPADCALL |lvpp| |lvpolys| (QREFELT $ 59))
                     . #16=(|PFBR;SLPEBR|))))
             (SEQ (LETT |v| (|SPADfirst| |m|) . #16#)
                  (LETT |lvpp| (SPADCALL |v| |lvpp| (QREFELT $ 60)) . #16#)
                  (LETT |pp1|
                        (SPADCALL
                         (SPADCALL (CONS #'|PFBR;SLPEBR!0| (VECTOR $ |v|)) |pp|
                                   (QREFELT $ 65))
                         (QREFELT $ 67))
                        . #16#)
                  (LETT |ans|
                        (PROGN
                         (LETT #15# NIL . #16#)
                         (SEQ (LETT |u| NIL . #16#) (LETT #14# |lpolys| . #16#)
                              G190
                              (COND
                               ((OR (ATOM #14#)
                                    (PROGN (LETT |u| (CAR #14#) . #16#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #15# (CONS (|spadConstant| $ 68) #15#)
                                      . #16#)))
                              (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                              (EXIT (NREVERSE #15#))))
                        . #16#)
                  (SEQ (LETT |m| NIL . #16#)
                       (LETT #13# (NREVERSE (SPADCALL |pp1| (QREFELT $ 70)))
                             . #16#)
                       G190
                       (COND
                        ((OR (ATOM #13#)
                             (PROGN (LETT |m| (CAR #13#) . #16#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ans1|
                              (|PFBR;SLPEBR| |lpolys| |lvpolys|
                               (SPADCALL |m| (QREFELT $ 71)) |lvpp| $)
                              . #16#)
                        (EXIT
                         (COND
                          ((QEQCAR |ans1| 1)
                           (PROGN
                            (LETT #5# (CONS 1 "failed") . #16#)
                            (GO #17=#:G827)))
                          ('T
                           (SEQ (LETT |d| (SPADCALL |m| (QREFELT $ 72)) . #16#)
                                (EXIT
                                 (LETT |ans|
                                       (PROGN
                                        (LETT #12# NIL . #16#)
                                        (SEQ (LETT |a1| NIL . #16#)
                                             (LETT #11# (QCDR |ans1|) . #16#)
                                             (LETT |a| NIL . #16#)
                                             (LETT #10# |ans| . #16#) G190
                                             (COND
                                              ((OR (ATOM #10#)
                                                   (PROGN
                                                    (LETT |a| (CAR #10#)
                                                          . #16#)
                                                    NIL)
                                                   (ATOM #11#)
                                                   (PROGN
                                                    (LETT |a1| (CAR #11#)
                                                          . #16#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #12#
                                                     (CONS
                                                      (SPADCALL
                                                       (SPADCALL |a1| |d|
                                                                 (QREFELT $
                                                                          73))
                                                       |a| (QREFELT $ 74))
                                                      #12#)
                                                     . #16#)))
                                             (LETT #10#
                                                   (PROG1 (CDR #10#)
                                                     (LETT #11# (CDR #11#)
                                                           . #16#))
                                                   . #16#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #12#))))
                                       . #16#)))))))
                       (LETT #13# (CDR #13#) . #16#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS 0
                         (PROGN
                          (LETT #9# NIL . #16#)
                          (SEQ (LETT |pp1| NIL . #16#) (LETT #8# |ans| . #16#)
                               G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN (LETT |pp1| (CAR #8#) . #16#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #9#
                                       (CONS
                                        (SPADCALL
                                         (CONS #'|PFBR;SLPEBR!1|
                                               (VECTOR $ |v|))
                                         (SPADCALL |pp1| (QREFELT $ 67))
                                         (QREFELT $ 77))
                                        #9#)
                                       . #16#)))
                               (LETT #8# (CDR #8#) . #16#) (GO G190) G191
                               (EXIT (NREVERSE #9#))))))))
            ('T
             (COND
              ((NULL |lvpolys|)
               (SEQ
                (LETT |lpolysR|
                      (PROGN
                       (LETT #7# NIL . #16#)
                       (SEQ (LETT |u| NIL . #16#) (LETT #6# |lpolys| . #16#)
                            G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |u| (CAR #6#) . #16#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #7#
                                    (CONS
                                     (SPADCALL (ELT $ 44) |u| (QREFELT $ 47))
                                     #7#)
                                    . #16#)))
                            (LETT #6# (CDR #6#) . #16#) (GO G190) G191
                            (EXIT (NREVERSE #7#))))
                      . #16#)
                (LETT |ppR| (SPADCALL (ELT $ 44) |pp| (QREFELT $ 47)) . #16#)
                (LETT |ansR| (SPADCALL |lpolysR| |ppR| (QREFELT $ 13)) . #16#)
                (EXIT
                 (COND
                  ((QEQCAR |ansR| 1)
                   (PROGN (LETT #5# (CONS 1 "failed") . #16#) (GO #17#)))
                  (#18='T
                   (CONS 0
                         (PROGN
                          (LETT #4# NIL . #16#)
                          (SEQ (LETT |uu| NIL . #16#)
                               (LETT #3# (QCDR |ansR|) . #16#) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |uu| (CAR #3#) . #16#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS
                                        (SPADCALL (ELT $ 55) |uu|
                                                  (QREFELT $ 58))
                                        #4#)
                                       . #16#)))
                               (LETT #3# (CDR #3#) . #16#) (GO G190) G191
                               (EXIT (NREVERSE #4#))))))))))
              (#18#
               (SEQ
                (LETT |cVS|
                      (|PFBR;chooseSLPEViableSubstitutions| |lvpolys| |lpolys|
                       |pp| $)
                      . #16#)
                (LETT |ansR|
                      (SPADCALL (QVELT |cVS| 1) (QVELT |cVS| 2) (QREFELT $ 13))
                      . #16#)
                (EXIT
                 (COND ((QEQCAR |ansR| 1) (CONS 1 "failed"))
                       ((EQL (LENGTH |lvpolys|) 1)
                        (SPADCALL |lpolys| |pp| (|SPADfirst| |lvpolys|)
                                  (QREFELT $ 35)))
                       (#18# (SPADCALL |lpolys| |pp| (QREFELT $ 37)))))))))))
          #17# (EXIT #5#)))) 

(SDEFUN |PFBR;SLPEBR!1| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;SLPEBR|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 28)))))) 

(SDEFUN |PFBR;SLPEBR!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;SLPEBR|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 61)))))) 

(SDEFUN |PFBR;solveLinearPolynomialEquationByRecursion;LSupU;11|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPROG
         ((|lvpp| #1=(|List| |VarSet|)) (#2=#:G862 NIL) (|z| NIL)
          (#3=#:G861 NIL) (|lvpolys| #1#) (#4=#:G860 NIL) (#5=#:G859 NIL)
          (#6=#:G858 NIL) (|u| NIL) (#7=#:G857 NIL) (#8=#:G856 NIL)
          (#9=#:G855 NIL))
         (SEQ
          (COND
           ((SPADCALL |pp| (|spadConstant| $ 80) (QREFELT $ 81))
            (CONS 0
                  (PROGN
                   (LETT #9# NIL
                         . #10=(|PFBR;solveLinearPolynomialEquationByRecursion;LSupU;11|))
                   (SEQ (LETT |u| NIL . #10#) (LETT #8# |lpolys| . #10#) G190
                        (COND
                         ((OR (ATOM #8#)
                              (PROGN (LETT |u| (CAR #8#) . #10#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #9# (CONS (|spadConstant| $ 80) #9#) . #10#)))
                        (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                        (EXIT (NREVERSE #9#))))))
           ('T
            (SEQ
             (LETT |lvpolys|
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #7# NIL . #10#)
                      (SEQ (LETT |u| NIL . #10#) (LETT #6# |lpolys| . #10#)
                           G190
                           (COND
                            ((OR (ATOM #6#)
                                 (PROGN (LETT |u| (CAR #6#) . #10#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #7#
                                   (CONS
                                    (SPADCALL
                                     (PROGN
                                      (LETT #5# NIL . #10#)
                                      (SEQ (LETT |z| NIL . #10#)
                                           (LETT #4#
                                                 (SPADCALL |u| (QREFELT $ 83))
                                                 . #10#)
                                           G190
                                           (COND
                                            ((OR (ATOM #4#)
                                                 (PROGN
                                                  (LETT |z| (CAR #4#) . #10#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #5#
                                                   (CONS
                                                    (SPADCALL |z|
                                                              (QREFELT $ 84))
                                                    #5#)
                                                   . #10#)))
                                           (LETT #4# (CDR #4#) . #10#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #5#))))
                                     (QREFELT $ 85))
                                    #7#)
                                   . #10#)))
                           (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                           (EXIT (NREVERSE #7#))))
                     (QREFELT $ 85))
                    (QREFELT $ 86))
                   . #10#)
             (LETT |lvpp|
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #3# NIL . #10#)
                      (SEQ (LETT |z| NIL . #10#)
                           (LETT #2# (SPADCALL |pp| (QREFELT $ 83)) . #10#)
                           G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |z| (CAR #2#) . #10#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3# (CONS (SPADCALL |z| (QREFELT $ 84)) #3#)
                                   . #10#)))
                           (LETT #2# (CDR #2#) . #10#) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (QREFELT $ 85))
                    (QREFELT $ 86))
                   . #10#)
             (EXIT (|PFBR;SLPEBR| |lpolys| |lvpolys| |pp| |lvpp| $)))))))) 

(SDEFUN |PFBR;factorByRecursion;SupF;12|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G876 NIL) (|c| (S)) (|lv| (|List| |VarSet|)) (#2=#:G884 NIL)
          (|z| NIL) (#3=#:G883 NIL))
         (SEQ
          (LETT |lv|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #3# NIL . #4=(|PFBR;factorByRecursion;SupF;12|))
                   (SEQ (LETT |z| NIL . #4#)
                        (LETT #2# (SPADCALL |pp| (QREFELT $ 83)) . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |z| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3# (CONS (SPADCALL |z| (QREFELT $ 84)) #3#)
                                . #4#)))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #3#))))
                  (QREFELT $ 85))
                 (QREFELT $ 86))
                . #4#)
          (EXIT
           (COND
            ((NULL |lv|)
             (SPADCALL (CONS (|function| |PFBR;raise|) $)
                       (SPADCALL (|PFBR;lower| |pp| $) (QREFELT $ 89))
                       (QREFELT $ 94)))
            (#5='T
             (SEQ (LETT |c| (SPADCALL |pp| (QREFELT $ 95)) . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL |c| (QREFELT $ 96))
                     (SPADCALL (SPADCALL |pp| (QREFELT $ 98)) (ELT $ 99)
                               (QREFELT $ 102)))
                    (#5#
                     (SEQ
                      (LETT |pp|
                            (PROG2
                                (LETT #1# (SPADCALL |pp| |c| (QREFELT $ 104))
                                      . #4#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 9))
                                              (|Union|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 9))
                                               "failed")
                                              #1#))
                            . #4#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |pp| (QREFELT $ 98)) (ELT $ 99)
                                  (QREFELT $ 102))
                        (SPADCALL (ELT $ 105) (SPADCALL |c| (QREFELT $ 106))
                                  (QREFELT $ 109))
                        (QREFELT $ 110)))))))))))))) 

(SDEFUN |PFBR;factorSquareFreeByRecursion;SupF;13|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G930 NIL) (#2=#:G945 NIL) (|w| NIL) (#3=#:G944 NIL)
          (#4=#:G917 NIL) (|factors| (|List| (|SparseUnivariatePolynomial| S)))
          (#5=#:G892 NIL) (|lcppPow| (S)) (|lc| (S)) (#6=#:G943 NIL)
          (#7=#:G942 NIL)
          (|flu| (|Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
          (|llc| (|List| S)) (#8=#:G941 NIL) (|f1| NIL) (#9=#:G940 NIL)
          (|ppAdjust| (|SparseUnivariatePolynomial| S))
          (|fl2| (|List| (|SparseUnivariatePolynomial| R))) (#10=#:G905 NIL)
          (#11=#:G939 NIL) (#12=#:G938 NIL) (|lcppR| (R))
          (|fl1| (|List| (|SparseUnivariatePolynomial| R))) (#13=#:G937 NIL)
          (|u| NIL) (#14=#:G936 NIL) (|nfact| (|NonNegativeInteger|))
          (|factorsR| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|newppR| (|SparseUnivariatePolynomial| R))
          (|cVS|
           (|Record| (|:| |substnsField| (|List| R))
                     (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
          (|oldnfact| (|NonNegativeInteger|)) (|lcpp| (S)) (|lcu| (S))
          (|v_degs| (|List| (|NonNegativeInteger|))) (#15=#:G887 NIL)
          (#16=#:G886 #17=(|NonNegativeInteger|)) (#18=#:G888 #17#)
          (#19=#:G935 NIL) (|z| NIL) (#20=#:G934 NIL) (|v| NIL)
          (#21=#:G933 NIL) (|lv| (|List| |VarSet|)) (#22=#:G932 NIL)
          (#23=#:G931 NIL) (|cpp| (|List| S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |cpp| (SPADCALL |pp| (QREFELT $ 83))
                  . #24=(|PFBR;factorSquareFreeByRecursion;SupF;13|))
            (LETT |lv|
                  (SPADCALL
                   (SPADCALL
                    (PROGN
                     (LETT #23# NIL . #24#)
                     (SEQ (LETT |z| NIL . #24#) (LETT #22# |cpp| . #24#) G190
                          (COND
                           ((OR (ATOM #22#)
                                (PROGN (LETT |z| (CAR #22#) . #24#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #23#
                                  (CONS (SPADCALL |z| (QREFELT $ 84)) #23#)
                                  . #24#)))
                          (LETT #22# (CDR #22#) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #23#))))
                    (QREFELT $ 85))
                   (QREFELT $ 86))
                  . #24#)
            (LETT |v_degs|
                  (PROGN
                   (LETT #21# NIL . #24#)
                   (SEQ (LETT |v| NIL . #24#) (LETT #20# |lv| . #24#) G190
                        (COND
                         ((OR (ATOM #20#)
                              (PROGN (LETT |v| (CAR #20#) . #24#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #21#
                                (CONS
                                 (PROGN
                                  (LETT #15# NIL . #24#)
                                  (SEQ (LETT |z| NIL . #24#)
                                       (LETT #19# |cpp| . #24#) G190
                                       (COND
                                        ((OR (ATOM #19#)
                                             (PROGN
                                              (LETT |z| (CAR #19#) . #24#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (PROGN
                                          (LETT #18#
                                                (SPADCALL |z| |v|
                                                          (QREFELT $ 112))
                                                . #24#)
                                          (COND
                                           (#15#
                                            (LETT #16# (MAX #16# #18#) . #24#))
                                           ('T
                                            (PROGN
                                             (LETT #16# #18# . #24#)
                                             (LETT #15# 'T . #24#)))))))
                                       (LETT #19# (CDR #19#) . #24#) (GO G190)
                                       G191 (EXIT NIL))
                                  (COND (#15# #16#)
                                        ('T (|IdentityError| '|max|))))
                                 #21#)
                                . #24#)))
                        (LETT #20# (CDR #20#) . #24#) (GO G190) G191
                        (EXIT (NREVERSE #21#))))
                  . #24#)
            (EXIT
             (COND
              ((NULL |lv|)
               (SPADCALL (CONS (|function| |PFBR;raise|) $)
                         (SPADCALL (|PFBR;lower| |pp| $) (QREFELT $ 89))
                         (QREFELT $ 94)))
              ('T
               (SEQ (LETT |lcu| (|spadConstant| $ 113) . #24#)
                    (COND
                     ((SPADCALL
                       (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 38)) . #24#)
                       (QREFELT $ 96))
                      (SEQ (LETT |lcu| |lcpp| . #24#)
                           (LETT |pp|
                                 (PROG2
                                     (LETT #5#
                                           (SPADCALL |pp| |lcu|
                                                     (QREFELT $ 104))
                                           . #24#)
                                     (QCDR #5#)
                                   (|check_union2| (QEQCAR #5# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 9))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 9))
                                                    #25="failed")
                                                   #5#))
                                 . #24#)
                           (EXIT
                            (LETT |lcpp| (|spadConstant| $ 113) . #24#)))))
                    (LETT |oldnfact| (+ (SPADCALL |pp| (QREFELT $ 114)) 1)
                          . #24#)
                    (EXIT
                     (SEQ G190 (COND ((NULL 'T) (GO G191)))
                          (SEQ
                           (LETT |cVS|
                                 (|PFBR;chooseFSQViableSubstitutions| |lv| |pp|
                                  $)
                                 . #24#)
                           (LETT |newppR|
                                 (SPADCALL (QCDR |cVS|) (QREFELT $ 115))
                                 . #24#)
                           (LETT |factorsR| (SPADCALL |newppR| (QREFELT $ 116))
                                 . #24#)
                           (LETT |nfact| (SPADCALL |factorsR| (QREFELT $ 117))
                                 . #24#)
                           (EXIT
                            (COND
                             ((EQL |nfact| 1)
                              (PROGN
                               (LETT #1#
                                     (SPADCALL (SPADCALL |lcu| (QREFELT $ 105))
                                               (LIST
                                                (VECTOR (CONS 2 "irred") |pp|
                                                        1))
                                               (QREFELT $ 122))
                                     . #24#)
                               (GO #26=#:G929)))
                             ((SPADCALL |nfact| |oldnfact| (QREFELT $ 52))
                              "next")
                             ('T
                              (SEQ
                               (LETT |fl1|
                                     (PROGN
                                      (LETT #14# NIL . #24#)
                                      (SEQ (LETT |u| NIL . #24#)
                                           (LETT #13#
                                                 (SPADCALL |factorsR|
                                                           (QREFELT $ 125))
                                                 . #24#)
                                           G190
                                           (COND
                                            ((OR (ATOM #13#)
                                                 (PROGN
                                                  (LETT |u| (CAR #13#) . #24#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #14#
                                                   (CONS (QVELT |u| 1) #14#)
                                                   . #24#)))
                                           (LETT #13# (CDR #13#) . #24#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #14#))))
                                     . #24#)
                               (LETT |lcppR|
                                     (SPADCALL (QCDR |cVS|) (QREFELT $ 126))
                                     . #24#)
                               (LETT |fl2|
                                     (PROGN
                                      (LETT #12# NIL . #24#)
                                      (SEQ (LETT |f1| NIL . #24#)
                                           (LETT #11# |fl1| . #24#) G190
                                           (COND
                                            ((OR (ATOM #11#)
                                                 (PROGN
                                                  (LETT |f1| (CAR #11#) . #24#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #12#
                                                   (CONS
                                                    (SPADCALL
                                                     (PROG2
                                                         (LETT #10#
                                                               (SPADCALL
                                                                |lcppR|
                                                                (SPADCALL |f1|
                                                                          (QREFELT
                                                                           $
                                                                           126))
                                                                (QREFELT $
                                                                         127))
                                                               . #24#)
                                                         (QCDR #10#)
                                                       (|check_union2|
                                                        (QEQCAR #10# 0)
                                                        (QREFELT $ 6)
                                                        (|Union| (QREFELT $ 6)
                                                                 #27="failed")
                                                        #10#))
                                                     |f1| (QREFELT $ 128))
                                                    #12#)
                                                   . #24#)))
                                           (LETT #11# (CDR #11#) . #24#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #12#))))
                                     . #24#)
                               (LETT |ppAdjust|
                                     (SPADCALL
                                      (LETT |lcppPow|
                                            (SPADCALL |lcpp|
                                                      (LENGTH (CDR |fl2|))
                                                      (QREFELT $ 129))
                                            . #24#)
                                      |pp| (QREFELT $ 130))
                                     . #24#)
                               (LETT |llc|
                                     (PROGN
                                      (LETT #9# NIL . #24#)
                                      (SEQ (LETT |f1| NIL . #24#)
                                           (LETT #8# |fl2| . #24#) G190
                                           (COND
                                            ((OR (ATOM #8#)
                                                 (PROGN
                                                  (LETT |f1| (CAR #8#) . #24#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #9# (CONS |lcpp| #9#)
                                                   . #24#)))
                                           (LETT #8# (CDR #8#) . #24#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #9#))))
                                     . #24#)
                               (LETT |flu|
                                     (SPADCALL |ppAdjust| |lv| |fl2|
                                               (QCAR |cVS|) |llc| |v_degs|
                                               (CONS
                                                (|function| |PFBR;gen_solv|) $)
                                               (QREFELT $ 137))
                                     . #24#)
                               (EXIT
                                (COND ((QEQCAR |flu| 1) "next")
                                      ('T
                                       (SEQ
                                        (LETT |factors| (QCDR |flu|) . #24#)
                                        (LETT |factors|
                                              (PROGN
                                               (LETT #7# NIL . #24#)
                                               (SEQ (LETT |w| NIL . #24#)
                                                    (LETT #6# |factors| . #24#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #6#)
                                                          (PROGN
                                                           (LETT |w| (CAR #6#)
                                                                 . #24#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #7#
                                                            (CONS
                                                             (SEQ
                                                              (LETT |lc|
                                                                    (SPADCALL
                                                                     |w|
                                                                     (QREFELT $
                                                                              95))
                                                                    . #24#)
                                                              (LETT |lcppPow|
                                                                    (PROG2
                                                                        (LETT
                                                                         #4#
                                                                         (SPADCALL
                                                                          |lcppPow|
                                                                          |lc|
                                                                          (QREFELT
                                                                           $
                                                                           138))
                                                                         . #24#)
                                                                        (QCDR
                                                                         #4#)
                                                                      (|check_union2|
                                                                       (QEQCAR
                                                                        #4# 0)
                                                                       (QREFELT
                                                                        $ 9)
                                                                       (|Union|
                                                                        (QREFELT
                                                                         $ 9)
                                                                        #27#)
                                                                       #4#))
                                                                    . #24#)
                                                              (EXIT
                                                               (PROG2
                                                                   (LETT #5#
                                                                         (SPADCALL
                                                                          |w|
                                                                          |lc|
                                                                          (QREFELT
                                                                           $
                                                                           104))
                                                                         . #24#)
                                                                   (QCDR #5#)
                                                                 (|check_union2|
                                                                  (QEQCAR #5#
                                                                          0)
                                                                  (|SparseUnivariatePolynomial|
                                                                   (QREFELT $
                                                                            9))
                                                                  (|Union|
                                                                   (|SparseUnivariatePolynomial|
                                                                    (QREFELT $
                                                                             9))
                                                                   #25#)
                                                                  #5#))))
                                                             #7#)
                                                            . #24#)))
                                                    (LETT #6# (CDR #6#) . #24#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #7#))))
                                              . #24#)
                                        (COND
                                         ((NULL
                                           (SPADCALL |lcppPow| (QREFELT $ 96)))
                                          (EXIT
                                           (|error|
                                            "internal error in factorSquareFreeByRecursion"))))
                                        (EXIT
                                         (PROGN
                                          (LETT #1#
                                                (SPADCALL
                                                 (SPADCALL |lcu|
                                                           (SPADCALL
                                                            (PROG2
                                                                (LETT #4#
                                                                      (SPADCALL
                                                                       |lcppPow|
                                                                       (QREFELT
                                                                        $ 139))
                                                                      . #24#)
                                                                (QCDR #4#)
                                                              (|check_union2|
                                                               (QEQCAR #4# 0)
                                                               (QREFELT $ 9)
                                                               (|Union|
                                                                (QREFELT $ 9)
                                                                #27#)
                                                               #4#))
                                                            (QREFELT $ 105))
                                                           (QREFELT $ 130))
                                                 (PROGN
                                                  (LETT #3# NIL . #24#)
                                                  (SEQ (LETT |w| NIL . #24#)
                                                       (LETT #2# |factors|
                                                             . #24#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #2#)
                                                             (PROGN
                                                              (LETT |w|
                                                                    (CAR #2#)
                                                                    . #24#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #3#
                                                               (CONS
                                                                (VECTOR
                                                                 (CONS 2
                                                                       "irred")
                                                                 |w| 1)
                                                                #3#)
                                                               . #24#)))
                                                       (LETT #2# (CDR #2#)
                                                             . #24#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #3#))))
                                                 (QREFELT $ 122))
                                                . #24#)
                                          (GO #26#))))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #26# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |PolynomialFactorizationByRecursion;|)) 

(DEFUN |PolynomialFactorizationByRecursion| (&REST #1=#:G946)
  (SPROG NIL
         (PROG (#2=#:G947)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialFactorizationByRecursion|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialFactorizationByRecursion|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |PolynomialFactorizationByRecursion;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialFactorizationByRecursion|)))))))))) 

(DEFUN |PolynomialFactorizationByRecursion;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialFactorizationByRecursion|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$|
          (LIST '|PolynomialFactorizationByRecursion| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 140) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|PolynomialFactorizationByRecursion|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#1| '(|Finite|))
      (QSETREFV $ 16 (CONS (|dispatchFunction| |PFBR;randomR;IR;2|) $)))
     ('T (QSETREFV $ 16 (CONS (|dispatchFunction| |PFBR;randomR;IR;3|) $))))
    (COND
     ((|HasCategory| |#1| '(|FiniteFieldCategory|))
      (QSETREFV $ 35
                (CONS (|dispatchFunction| |PFBR;bivariateSLPEBR;LSupVarSetU;4|)
                      $)))
     ('T
      (QSETREFV $ 35
                (CONS (|dispatchFunction| |PFBR;bivariateSLPEBR;LSupVarSetU;5|)
                      $))))
    $))) 

(MAKEPROP '|PolynomialFactorizationByRecursion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Union| 11 '"failed") (|List| 12)
              (|SparseUnivariatePolynomial| $)
              (0 . |solveLinearPolynomialEquation|) (6 . |random|) (|Integer|)
              (10 . |randomR|) (|PositiveInteger|) (15 . *) (21 . |coerce|)
              (|SparseUnivariatePolynomial| 6) (26 . |univariate|)
              (|SparseUnivariatePolynomial| 20) (|Mapping| 20 9)
              (|SparseUnivariatePolynomial| 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 24 20 22)
              (31 . |map|) (37 . |solveLinearPolynomialEquation|)
              (43 . |multivariate|) (49 . |multivariate|) (|Mapping| 9 20)
              (|UnivariatePolynomialCategoryFunctions2| 20 22 9 24)
              (55 . |map|) (|Union| 34 '"failed") (|List| 24)
              (61 . |bivariateSLPEBR|)
              (|LinearPolynomialEquationByFractions| 9)
              (68 . |solveLinearPolynomialEquationByFractions|)
              (74 . |leadingCoefficient|) (|List| 8) (|List| 6) (79 . |eval|)
              (|Boolean|) (86 . |zero?|) (91 . |retract|) (|Mapping| 6 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 24 6 20) (96 . |map|)
              (102 . |differentiate|) (107 . |gcd|) (|NonNegativeInteger|)
              (113 . |degree|) (118 . >) (124 . |content|) (129 . |unit?|)
              (134 . |coerce|) (|Mapping| 9 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 20 9 24)
              (139 . |map|) (145 . |setDifference|) (151 . |remove|)
              (157 . |univariate|) (|SparseUnivariatePolynomial| 24)
              (|Mapping| 24 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 24 24 62)
              (163 . |map|) (|CommuteUnivariatePolynomialCategory| 9 24 62)
              (169 . |swap|) (174 . |Zero|) (|List| $) (178 . |monomials|)
              (183 . |leadingCoefficient|) (188 . |degree|) (193 . |monomial|)
              (199 . +) (|Mapping| 9 24)
              (|UnivariatePolynomialCategoryFunctions2| 24 62 9 24)
              (205 . |map|) (211 . |Zero|) (215 . |Zero|) (219 . |Zero|)
              (223 . =) (|List| 9) (229 . |coefficients|) (234 . |variables|)
              (239 . |concat|) (244 . |removeDuplicates!|)
              |PFBR;solveLinearPolynomialEquationByRecursion;LSupU;11|
              (|Factored| 12) (249 . |factorPolynomial|) (|Factored| 24)
              (|Mapping| 24 20) (|Factored| 20) (|FactoredFunctions2| 20 24)
              (254 . |map|) (260 . |content|) (265 . |unit?|) (|Factored| $)
              (270 . |squareFree|) |PFBR;factorSquareFreeByRecursion;SupF;13|
              (|Mapping| 90 24) (|FactoredFunctionUtilities| 24)
              (275 . |refine|) (|Union| $ '"failed") (281 . |exquo|)
              (287 . |coerce|) (292 . |factor|) (|Factored| 9)
              (|FactoredFunctions2| 9 24) (297 . |map|) (303 . |mergeFactors|)
              |PFBR;factorByRecursion;SupF;12| (309 . |degree|) (315 . |One|)
              (319 . |degree|) (324 . |primitivePart|)
              (329 . |factorSquareFreePolynomial|) (334 . |numberOfFactors|)
              (339 . |One|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 119) (|:| |fctr| 24) (|:| |xpnt| 15))
              (|List| 120) (343 . |makeFR|)
              (|Record| (|:| |flg| 119) (|:| |fctr| 20) (|:| |xpnt| 15))
              (|List| 123) (349 . |factorList|) (354 . |leadingCoefficient|)
              (359 . |exquo|) (365 . *) (371 . ^) (377 . *) (|List| 20)
              (|List| 50) (|Union| 131 '"failed") (|Mapping| 133 20)
              (|Mapping| 134 131) (|MultivariateLifting| 7 8 6 9)
              (383 . |lifting|) (394 . |exquo|) (400 . |recip|))
           '#(|solveLinearPolynomialEquationByRecursion| 405 |randomR| 411
              |factorSquareFreeByRecursion| 416 |factorByRecursion| 421
              |bivariateSLPEBR| 426)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 139
                                                 '(2 6 10 11 12 13 0 6 0 14 1 0
                                                   6 15 16 2 15 0 17 0 18 1 6 0
                                                   15 19 1 9 20 0 21 2 25 22 23
                                                   24 26 2 20 10 11 12 27 2 9 0
                                                   12 8 28 2 9 0 20 8 29 2 31
                                                   24 30 22 32 3 0 33 34 24 8
                                                   35 2 36 33 34 24 37 1 24 9 0
                                                   38 3 9 0 0 39 40 41 1 9 42 0
                                                   43 1 9 6 0 44 2 46 20 45 24
                                                   47 1 20 0 0 48 2 20 0 0 0 49
                                                   1 20 50 0 51 2 50 42 0 0 52
                                                   1 20 6 0 53 1 6 42 0 54 1 9
                                                   0 6 55 2 57 24 56 20 58 2 39
                                                   0 0 0 59 2 39 0 8 0 60 2 9
                                                   12 0 8 61 2 64 62 63 24 65 1
                                                   66 62 62 67 0 62 0 68 1 62
                                                   69 0 70 1 62 24 0 71 1 62 50
                                                   0 72 2 62 0 24 50 73 2 62 0
                                                   0 0 74 2 76 24 75 62 77 0 6
                                                   0 78 0 7 0 79 0 24 0 80 2 24
                                                   42 0 0 81 1 24 82 0 83 1 9
                                                   39 0 84 1 39 0 69 85 1 39 0
                                                   0 86 1 6 88 12 89 2 93 90 91
                                                   92 94 1 24 9 0 95 1 9 42 0
                                                   96 1 24 97 0 98 2 101 90 90
                                                   100 102 2 24 103 0 9 104 1
                                                   24 0 9 105 1 9 97 0 106 2
                                                   108 90 63 107 109 2 101 90
                                                   90 90 110 2 9 50 0 8 112 0 9
                                                   0 113 1 24 50 0 114 1 20 0 0
                                                   115 1 6 88 12 116 1 92 50 0
                                                   117 0 6 0 118 2 90 0 24 121
                                                   122 1 92 124 0 125 1 20 6 0
                                                   126 2 6 103 0 0 127 2 20 0 6
                                                   0 128 2 9 0 0 50 129 2 24 0
                                                   9 0 130 7 136 33 24 39 131
                                                   40 82 132 135 137 2 9 103 0
                                                   0 138 1 9 103 0 139 2 0 33
                                                   34 24 87 1 0 6 15 16 1 0 90
                                                   24 99 1 0 90 24 111 3 0 33
                                                   34 24 8 35)))))
           '|lookupComplete|)) 
