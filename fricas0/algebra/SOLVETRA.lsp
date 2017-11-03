
(SDEFUN |SOLVETRA;solve;EL;1|
        ((|oside| |Expression| R) ($ |List| (|Equation| (|Expression| R))))
        (SPROG ((|lv| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((SPADCALL |oside| (QREFELT $ 9))
                  (|error| "equation is always satisfied"))
                 (#1='T
                  (SEQ
                   (LETT |lv| (SPADCALL |oside| (QREFELT $ 11))
                         |SOLVETRA;solve;EL;1|)
                   (EXIT
                    (COND ((NULL |lv|) (|error| "inconsistent equation"))
                          ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 14))
                           (|error| "too many variables"))
                          (#1#
                           (SPADCALL |oside| (|SPADfirst| |lv|)
                                     (QREFELT $ 17))))))))))) 

(SDEFUN |SOLVETRA;solve;EL;2|
        ((|equ| |Equation| (|Expression| R))
         ($ |List| (|Equation| (|Expression| R))))
        (SPADCALL
         (SPADCALL (SPADCALL |equ| (QREFELT $ 20))
                   (SPADCALL |equ| (QREFELT $ 21)) (QREFELT $ 22))
         (QREFELT $ 18))) 

(SDEFUN |SOLVETRA;solve;ESL;3|
        ((|equ| |Equation| (|Expression| R)) (|x| |Symbol|)
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG ((|oneside| (|Expression| R)))
               (SEQ
                (LETT |oneside|
                      (SPADCALL (SPADCALL |equ| (QREFELT $ 20))
                                (SPADCALL |equ| (QREFELT $ 21)) (QREFELT $ 22))
                      |SOLVETRA;solve;ESL;3|)
                (EXIT (SPADCALL |oneside| |x| (QREFELT $ 17)))))) 

(SDEFUN |SOLVETRA;testZero?|
        ((|lside| |Expression| R) (|sol| |Equation| (|Expression| R))
         ($ |Boolean|))
        (SEQ
         (COND
          ((|HasCategory| (QREFELT $ 6)
                          (LIST '|QuotientFieldCategory| '(|Integer|)))
           (COND
            ((QEQCAR (SPADCALL (SPADCALL |sol| (QREFELT $ 21)) (QREFELT $ 26))
                     1)
             (EXIT 'T))))
          ((QEQCAR (SPADCALL (SPADCALL |sol| (QREFELT $ 21)) (QREFELT $ 28)) 1)
           (EXIT 'T)))
         (EXIT
          (COND
           ((SPADCALL
             (SPADCALL (SPADCALL |lside| |sol| (QREFELT $ 30)) (QREFELT $ 32))
             (QREFELT $ 9))
            'T)
           ('T NIL))))) 

(SDEFUN |SOLVETRA;solve;ESL;5|
        ((|lside| |Expression| R) (|x| |Symbol|)
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG ((#1=#:G818 NIL) (|sol| NIL) (#2=#:G817 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SOLVETRA;solve;ESL;5|))
                 (SEQ (LETT |sol| NIL . #3#)
                      (LETT #1# (|SOLVETRA;solveInner| |lside| |x| $) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |sol| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|SOLVETRA;testZero?| |lside| |sol| $)
                          (LETT #2# (CONS |sol| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SOLVETRA;solveInner|
        ((|lside| |Expression| R) (|x| |Symbol|)
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG
         ((#1=#:G875 NIL) (|sols| (|List| (|Equation| (|Expression| R))))
          (#2=#:G882 NIL) (|frec| NIL)
          (|lfacts|
           (|List|
            (|Record|
             (|:| |factor|
                  (|SparseMultivariatePolynomial| R
                                                  (|Kernel| (|Expression| R))))
             (|:| |exponent| (|Integer|)))))
          (|listofkernels| #3=(|List| (|Expression| R)))
          (|newlside| (|Expression| R))
          (|newlist| (|List| (|Equation| (|Expression| R)))) (#4=#:G881 NIL)
          (|j| NIL) (|secondsol| #5=(|List| (|Expression| R))) (#6=#:G861 NIL)
          (#7=#:G860 #5#) (#8=#:G862 #5#) (#9=#:G880 NIL) (|ff| NIL)
          (|lfatt|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |exponent| (|Integer|)))))
          (|f| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|elR| (|Expression| R)) (#10=#:G879 NIL) (|i| NIL) (#11=#:G853 NIL)
          (#12=#:G852 #13=(|List| (|Equation| (|Expression| R))))
          (#14=#:G854 #13#) (#15=#:G878 NIL) (|ri| NIL)
          (|bigX_back| (|Expression| R)) (#16=#:G848 NIL)
          (|r1| (|List| (|Expression| R)))
          (|finv| (|Union| (|Expression| R) #17="failed")) (#18=#:G877 NIL)
          (|lr| #5#) (#19=#:G837 NIL) (#20=#:G836 #5#) (#21=#:G838 #5#)
          (#22=#:G876 NIL) (|fatt| NIL) (|eq1| (|Expression| R))
          (|bigX| (|Expression| R)) (Y (|Expression| R)) (X (|Symbol|))
          (|ausgabe1| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lside| (|SOLVETRA;eliminateRoot| |lside| |x| $)
                  . #23=(|SOLVETRA;solveInner|))
            (LETT |ausgabe1| (|SOLVETRA;tableXkernels| |lside| |x| $) . #23#)
            (LETT X (SPADCALL (QREFELT $ 33)) . #23#)
            (LETT Y (SPADCALL (SPADCALL (QREFELT $ 33)) (QREFELT $ 34)) . #23#)
            (EXIT
             (COND
              ((EQL (LENGTH |ausgabe1|) 1)
               (SEQ (LETT |bigX| (|SPADfirst| |ausgabe1|) . #23#)
                    (LETT |eq1|
                          (SPADCALL |lside|
                                    (SPADCALL |bigX|
                                              (SPADCALL X (QREFELT $ 34))
                                              (QREFELT $ 35))
                                    (QREFELT $ 30))
                          . #23#)
                    (LETT |f|
                          (SPADCALL |eq1|
                                    (|SPADfirst|
                                     (SPADCALL (SPADCALL X (QREFELT $ 34))
                                               (QREFELT $ 38)))
                                    (QREFELT $ 41))
                          . #23#)
                    (LETT |lfatt|
                          (SPADCALL
                           (SPADCALL (SPADCALL |f| (QREFELT $ 44))
                                     (QREFELT $ 47))
                           (QREFELT $ 50))
                          . #23#)
                    (LETT |lr|
                          (PROGN
                           (LETT #19# NIL . #23#)
                           (SEQ (LETT |fatt| NIL . #23#)
                                (LETT #22# |lfatt| . #23#) G190
                                (COND
                                 ((OR (ATOM #22#)
                                      (PROGN
                                       (LETT |fatt| (CAR #22#) . #23#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #21#
                                         (SPADCALL (QCAR |fatt|) |x|
                                                   (QREFELT $ 53))
                                         . #23#)
                                   (COND
                                    (#19#
                                     (LETT #20#
                                           (SPADCALL #20# #21# (QREFELT $ 55))
                                           . #23#))
                                    ('T
                                     (PROGN
                                      (LETT #20# #21# . #23#)
                                      (LETT #19# 'T . #23#)))))))
                                (LETT #22# (CDR #22#) . #23#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#19# #20#) (#24='T NIL)))
                          . #23#)
                    (LETT |r1| NIL . #23#)
                    (SEQ (LETT |i| 1 . #23#) (LETT #18# (LENGTH |lr|) . #23#)
                         G190 (COND ((|greater_SI| |i| #18#) (GO G191)))
                         (SEQ
                          (LETT |finv|
                                (|SOLVETRA;funcinv| |bigX|
                                 (SPADCALL |lr| |i| (QREFELT $ 57)) $)
                                . #23#)
                          (EXIT
                           (COND
                            ((QEQCAR |finv| 0)
                             (LETT |r1| (CONS (QCDR |finv|) |r1|) . #23#)))))
                         (LETT |i| (|inc_SI| |i|) . #23#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |bigX_back|
                          (PROG2
                              (LETT #16# (|SOLVETRA;funcinv| |bigX| |bigX| $)
                                    . #23#)
                              (QCDR #16#)
                            (|check_union2| (QEQCAR #16# 0)
                                            (|Expression| (QREFELT $ 6))
                                            (|Union|
                                             (|Expression| (QREFELT $ 6)) #17#)
                                            #16#))
                          . #23#)
                    (COND
                     ((NULL (|SOLVETRA;testkernel| |bigX_back| |x| $))
                      (SEQ
                       (COND
                        ((SPADCALL |bigX| |bigX_back| (QREFELT $ 36))
                         (PROGN (LETT #1# NIL . #23#) (GO #25=#:G874))))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #11# NIL . #23#)
                                (SEQ (LETT |ri| NIL . #23#)
                                     (LETT #15# |r1| . #23#) G190
                                     (COND
                                      ((OR (ATOM #15#)
                                           (PROGN
                                            (LETT |ri| (CAR #15#) . #23#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #14#
                                              (SPADCALL
                                               (SPADCALL |bigX_back| |ri|
                                                         (QREFELT $ 22))
                                               |x| (QREFELT $ 17))
                                              . #23#)
                                        (COND
                                         (#11#
                                          (LETT #12#
                                                (SPADCALL #12# #14#
                                                          (QREFELT $ 58))
                                                . #23#))
                                         ('T
                                          (PROGN
                                           (LETT #12# #14# . #23#)
                                           (LETT #11# 'T . #23#)))))))
                                     (LETT #15# (CDR #15#) . #23#) (GO G190)
                                     G191 (EXIT NIL))
                                (COND (#11# #12#) (#24# NIL)))
                               . #23#)
                         (GO #25#))))))
                    (LETT |newlist| NIL . #23#)
                    (SEQ (LETT |i| 1 . #23#) (LETT #10# (LENGTH |r1|) . #23#)
                         G190 (COND ((|greater_SI| |i| #10#) (GO G191)))
                         (SEQ
                          (LETT |elR|
                                (|SOLVETRA;eliminateRoot|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |bigX_back|
                                             (SPADCALL |r1| |i| (QREFELT $ 57))
                                             (QREFELT $ 22))
                                   (QREFELT $ 60))
                                  (QREFELT $ 61))
                                 |x| $)
                                . #23#)
                          (LETT |f|
                                (SPADCALL |elR| (SPADCALL |x| (QREFELT $ 63))
                                          (QREFELT $ 41))
                                . #23#)
                          (LETT |lfatt|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 44))
                                           (QREFELT $ 47))
                                 (QREFELT $ 50))
                                . #23#)
                          (LETT |secondsol|
                                (PROGN
                                 (LETT #6# NIL . #23#)
                                 (SEQ (LETT |ff| NIL . #23#)
                                      (LETT #9# |lfatt| . #23#) G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN
                                             (LETT |ff| (CAR #9#) . #23#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #8#
                                               (SPADCALL (QCAR |ff|) |x|
                                                         (QREFELT $ 53))
                                               . #23#)
                                         (COND
                                          (#6#
                                           (LETT #7#
                                                 (SPADCALL #7# #8#
                                                           (QREFELT $ 55))
                                                 . #23#))
                                          ('T
                                           (PROGN
                                            (LETT #7# #8# . #23#)
                                            (LETT #6# 'T . #23#)))))))
                                      (LETT #9# (CDR #9#) . #23#) (GO G190)
                                      G191 (EXIT NIL))
                                 (COND (#6# #7#) ('T NIL)))
                                . #23#)
                          (EXIT
                           (SEQ (LETT |j| 1 . #23#)
                                (LETT #4# (LENGTH |secondsol|) . #23#) G190
                                (COND ((|greater_SI| |j| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |newlist|
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT $ 34))
                                          (SPADCALL
                                           (SPADCALL |secondsol| |j|
                                                     (QREFELT $ 57))
                                           (QREFELT $ 65))
                                          (QREFELT $ 35))
                                         |newlist|)
                                        . #23#)))
                                (LETT |j| (|inc_SI| |j|) . #23#) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|) . #23#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |newlist|)))
              (#24#
               (SEQ
                (LETT |newlside| (|SOLVETRA;tryToTrans| |lside| |x| $) . #23#)
                (LETT |listofkernels|
                      (|SOLVETRA;tableXkernels| |newlside| |x| $) . #23#)
                (EXIT
                 (COND
                  ((EQL (LENGTH |listofkernels|) 1)
                   (SPADCALL |newlside| |x| (QREFELT $ 17)))
                  (#24#
                   (SEQ
                    (LETT |lfacts|
                          (SPADCALL
                           (SPADCALL (SPADCALL |lside| (QREFELT $ 60))
                                     (QREFELT $ 69))
                           (QREFELT $ 72))
                          . #23#)
                    (EXIT
                     (COND
                      ((SPADCALL (LENGTH |lfacts|) 1 (QREFELT $ 14))
                       (SEQ (LETT |sols| NIL . #23#)
                            (SEQ (LETT |frec| NIL . #23#)
                                 (LETT #2# |lfacts| . #23#) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN
                                        (LETT |frec| (CAR #2#) . #23#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |sols|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL (QCAR |frec|)
                                                     (QREFELT $ 61))
                                           |x| (QREFELT $ 17))
                                          |sols| (QREFELT $ 58))
                                         . #23#)))
                                 (LETT #2# (CDR #2#) . #23#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |sols|)))
                      (#24#
                       (PROGN (LETT #1# NIL . #23#) (GO #25#)))))))))))))))
          #25# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;simplifyingLog| ((|f| |Expression| R) ($ |Expression| R))
        (SPROG
         ((|rec|
           (|Record| (|:| |var| (|Kernel| (|Expression| R)))
                     (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| (|Expression| R)))
                      (|:| |exponent| (|Integer|)))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL |f| '|exp| (QREFELT $ 75))
                . #1=(|SOLVETRA;simplifyingLog|))
          (EXIT
           (COND
            ((QEQCAR |u| 0)
             (SEQ (LETT |rec| (QCDR |u|) . #1#)
                  (EXIT
                   (SPADCALL (QCDR |rec|)
                             (|SPADfirst|
                              (SPADCALL (QCAR |rec|) (QREFELT $ 76)))
                             (QREFELT $ 77)))))
            ('T (SPADCALL |f| (QREFELT $ 78)))))))) 

(SDEFUN |SOLVETRA;testkernel|
        ((|var1| |Expression| R) (|y| |Symbol|) ($ |Boolean|))
        (SPROG ((|listvar1| (|List| (|Expression| R))))
               (SEQ
                (LETT |var1| (|SOLVETRA;eliminateRoot| |var1| |y| $)
                      . #1=(|SOLVETRA;testkernel|))
                (LETT |listvar1| (|SOLVETRA;tableXkernels| |var1| |y| $) . #1#)
                (EXIT
                 (COND
                  ((EQL (LENGTH |listvar1|) 1)
                   (COND
                    ((OR
                      (SPADCALL (SPADCALL |listvar1| 1 (QREFELT $ 57))
                                (SPADCALL |y| (QREFELT $ 34)) (QREFELT $ 36))
                      (EQL (LENGTH |listvar1|) 0))
                     'T)
                    ('T NIL)))
                  ((EQL (LENGTH |listvar1|) 0) 'T) ('T NIL)))))) 

(SDEFUN |SOLVETRA;solveRetract|
        ((|lexpr| |List| (|Expression| R)) (|lvar| |List| (|Symbol|))
         ($ |Union| (|List| (|List| (|Equation| (|Expression| R)))) "failed"))
        (SPROG
         ((|nlexpr| (|List| (|Fraction| (|Polynomial| R)))) (#1=#:G905 NIL)
          (|rf| (|Union| (|Fraction| (|Polynomial| R)) "failed"))
          (#2=#:G906 NIL) (|expr| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |nlexpr| NIL . #3=(|SOLVETRA;solveRetract|))
                (SEQ (LETT |expr| NIL . #3#) (LETT #2# |lexpr| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |expr| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |rf| (SPADCALL |expr| (QREFELT $ 82)) . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |rf| 1)
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #3#)
                              (GO #4=#:G904)))
                            ('T
                             (LETT |nlexpr| (CONS (QCDR |rf|) |nlexpr|)
                                   . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |nlexpr| |lvar| (QREFELT $ 86))))))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;tryToTrans|
        ((|lside| |Expression| R) (|x| |Symbol|) ($ |Expression| R))
        (SPROG
         ((|resultLside| #1=(|Expression| R)) (|numlside| (|Expression| R))
          (|listcnorm| #2=(|List| (|Expression| R)))
          (|cnormConvLside| (|Expression| R)) (|listConvLside| #2#)
          (|NormConvLside| (|Expression| R)) (|convLside| #1#))
         (SEQ
          (COND
           ((OR (|SOLVETRA;testTrig| |lside| |x| $)
                (|SOLVETRA;testHTrig| |lside| |x| $))
            (SEQ
             (LETT |convLside| (SPADCALL |lside| (QREFELT $ 88))
                   . #3=(|SOLVETRA;tryToTrans|))
             (LETT |resultLside| |convLside| . #3#)
             (LETT |listConvLside| (|SOLVETRA;tableXkernels| |convLside| |x| $)
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL (LENGTH |listConvLside|) 1 (QREFELT $ 14))
                (SEQ
                 (LETT |NormConvLside|
                       (SPADCALL |convLside| |x| (QREFELT $ 89)) . #3#)
                 (LETT |NormConvLside| |NormConvLside| . #3#)
                 (EXIT
                  (LETT |resultLside|
                        (|SOLVETRA;subsTan| |NormConvLside| |x| $)
                        . #3#))))))))
           ((|SOLVETRA;testLog| |lside| |x| $)
            (SEQ
             (LETT |numlside|
                   (SPADCALL (SPADCALL |lside| (QREFELT $ 60)) (QREFELT $ 61))
                   . #3#)
             (EXIT
              (LETT |resultLside| (|SOLVETRA;combineLog| |numlside| |x| $)
                    . #3#))))
           ('T
            (SEQ
             (LETT |NormConvLside| (SPADCALL |lside| |x| (QREFELT $ 89)) . #3#)
             (LETT |NormConvLside| |NormConvLside| . #3#)
             (LETT |resultLside| |NormConvLside| . #3#)
             (LETT |listConvLside|
                   (|SOLVETRA;tableXkernels| |NormConvLside| |x| $) . #3#)
             (EXIT
              (COND
               ((SPADCALL (LENGTH |listConvLside|) 1 (QREFELT $ 14))
                (SEQ
                 (LETT |cnormConvLside| (SPADCALL |lside| |x| (QREFELT $ 91))
                       . #3#)
                 (LETT |cnormConvLside| |cnormConvLside| . #3#)
                 (LETT |resultLside| |cnormConvLside| . #3#)
                 (LETT |listcnorm|
                       (|SOLVETRA;tableXkernels| |cnormConvLside| |x| $) . #3#)
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |listcnorm|) 1 (QREFELT $ 14))
                    (COND
                     ((|SOLVETRA;testLog| |cnormConvLside| |x| $)
                      (SEQ
                       (LETT |numlside|
                             (SPADCALL
                              (SPADCALL |cnormConvLside| (QREFELT $ 60))
                              (QREFELT $ 61))
                             . #3#)
                       (EXIT
                        (LETT |resultLside|
                              (|SOLVETRA;combineLog| |numlside| |x| $)
                              . #3#)))))))))))))))
          (EXIT |resultLside|)))) 

(SDEFUN |SOLVETRA;subsTan|
        ((|exprvar| |Expression| R) (|y| |Symbol|) ($ |Expression| R))
        (SPROG
         ((|resultnew| #1=(|Expression| R)) (|result1| (|Expression| R))
          (#2=#:G926 NIL)
          (|result|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|newH|
           #3=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (H (|Expression| R)) (|g| #3#) (|secondfun| (|Expression| R))
          (|f| #3#) (|fN| (|Expression| R)) (|fZ| #1#) (|test| (|Boolean|))
          (Y (|Expression| R)) (|varkern| (|Expression| R))
          (|listofkern| (|List| (|Expression| R))) (Z (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ (LETT Z (SPADCALL (QREFELT $ 33)) . #4=(|SOLVETRA;subsTan|))
                (LETT |listofkern| (|SOLVETRA;tableXkernels| |exprvar| |y| $)
                      . #4#)
                (LETT |varkern| (|SPADfirst| |listofkern|) . #4#)
                (LETT Y
                      (SPADCALL
                       (SPADCALL
                        (|SPADfirst|
                         (SPADCALL
                          (|SPADfirst| (SPADCALL |varkern| (QREFELT $ 38)))
                          (QREFELT $ 76)))
                        (QREFELT $ 60))
                       (QREFELT $ 61))
                      . #4#)
                (LETT |test|
                      (SPADCALL |varkern|
                                (SPADCALL
                                 (SPADCALL Y (SPADCALL 2 (QREFELT $ 92))
                                           (QREFELT $ 93))
                                 (QREFELT $ 94))
                                (QREFELT $ 36))
                      . #4#)
                (COND
                 ((EQL (LENGTH |listofkern|) 1)
                  (COND
                   ((NULL |test|)
                    (PROGN (LETT #2# |exprvar| . #4#) (GO #5=#:G925)))))
                 (#6='T (PROGN (LETT #2# |exprvar| . #4#) (GO #5#))))
                (LETT |fZ|
                      (SPADCALL |exprvar|
                                (SPADCALL |varkern| (SPADCALL Z (QREFELT $ 34))
                                          (QREFELT $ 35))
                                (QREFELT $ 30))
                      . #4#)
                (LETT |fN|
                      (SPADCALL (SPADCALL |fZ| (QREFELT $ 60)) (QREFELT $ 61))
                      . #4#)
                (LETT |f|
                      (SPADCALL |fN|
                                (|SPADfirst|
                                 (SPADCALL (SPADCALL Z (QREFELT $ 34))
                                           (QREFELT $ 38)))
                                (QREFELT $ 41))
                      . #4#)
                (LETT |secondfun|
                      (SPADCALL
                       (SPADCALL (SPADCALL 2 Y (QREFELT $ 96))
                                 (SPADCALL (SPADCALL Y 2 (QREFELT $ 97))
                                           (|spadConstant| $ 98)
                                           (QREFELT $ 22))
                                 (QREFELT $ 93))
                       (QREFELT $ 99))
                      . #4#)
                (LETT |g|
                      (SPADCALL |secondfun|
                                (|SPADfirst|
                                 (SPADCALL (SPADCALL |y| (QREFELT $ 34))
                                           (QREFELT $ 38)))
                                (QREFELT $ 41))
                      . #4#)
                (LETT H (SPADCALL (SPADCALL (QREFELT $ 33)) (QREFELT $ 34))
                      . #4#)
                (LETT |newH|
                      (SPADCALL H
                                (|SPADfirst|
                                 (SPADCALL (SPADCALL Z (QREFELT $ 34))
                                           (QREFELT $ 38)))
                                (QREFELT $ 41))
                      . #4#)
                (LETT |result| (SPADCALL |f| |g| |newH| (QREFELT $ 101)) . #4#)
                (EXIT
                 (COND
                  ((SPADCALL |result| |f| (QREFELT $ 102))
                   (PROGN (LETT #2# |exprvar| . #4#) (GO #5#)))
                  (#6#
                   (SEQ
                    (LETT |result1| (SPADCALL |result| H (QREFELT $ 104))
                          . #4#)
                    (EXIT
                     (LETT |resultnew|
                           (SPADCALL |result1|
                                     (SPADCALL H (SPADCALL Y (QREFELT $ 94))
                                               (QREFELT $ 35))
                                     (QREFELT $ 30))
                           . #4#))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |SOLVETRA;eliminateKernRoot|
        ((|var| |Expression| R) (|varkern| |Kernel| (|Expression| R))
         ($ |Expression| R))
        (SPROG
         ((|resultvar| (|Expression| R))
          (|var3| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#1=#:G937 NIL)
          (|var2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|var1| (|Expression| R)) (X (|Symbol|)))
         (SEQ
          (LETT X (SPADCALL (QREFELT $ 33))
                . #2=(|SOLVETRA;eliminateKernRoot|))
          (LETT |var1|
                (SPADCALL |var|
                          (SPADCALL (SPADCALL |varkern| (QREFELT $ 105))
                                    (SPADCALL X (QREFELT $ 34)) (QREFELT $ 35))
                          (QREFELT $ 30))
                . #2#)
          (LETT |var2|
                (SPADCALL
                 (SPADCALL |var1|
                           (|SPADfirst|
                            (SPADCALL (SPADCALL X (QREFELT $ 34))
                                      (QREFELT $ 38)))
                           (QREFELT $ 41))
                 (QREFELT $ 44))
                . #2#)
          (LETT |var3|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 98)
                           (PROG1
                               (LETT #1#
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |varkern| (QREFELT $ 76))
                                       (QREFELT $ 106))
                                      (QREFELT $ 107))
                                     . #2#)
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 108))
                 (SPADCALL (|SPADfirst| (SPADCALL |varkern| (QREFELT $ 76))) 0
                           (QREFELT $ 108))
                 (QREFELT $ 109))
                . #2#)
          (EXIT
           (LETT |resultvar| (SPADCALL |var2| |var3| (QREFELT $ 110)) . #2#))))) 

(SDEFUN |SOLVETRA;eliminateRoot|
        ((|var| . #1=(|Expression| R)) (|y| |Symbol|) ($ |Expression| R))
        (SPROG
         ((|var1| #1#) (#2=#:G946 NIL) (|i| NIL)
          (|varlistk1| (|List| (|Expression| R))))
         (SEQ (LETT |var1| |var| . #3=(|SOLVETRA;eliminateRoot|))
              (SEQ G190
                   (COND
                    ((NULL (|SOLVETRA;testRootk| |var1| |y| $)) (GO G191)))
                   (SEQ
                    (LETT |varlistk1| (|SOLVETRA;tableXkernels| |var1| |y| $)
                          . #3#)
                    (EXIT
                     (SEQ (LETT |i| NIL . #3#) (LETT #2# |varlistk1| . #3#)
                          G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |i| '|nthRoot| (QREFELT $ 111))
                              (LETT |var1|
                                    (|SOLVETRA;eliminateKernRoot| |var1|
                                     (|SPADfirst|
                                      (SPADCALL |i| (QREFELT $ 38)))
                                     $)
                                    . #3#)))))
                          (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |var1|)))) 

(SDEFUN |SOLVETRA;logsumtolog| ((|var| |Expression| R) ($ |Expression| R))
        (SPROG
         ((|var2| (|Expression| R)) (#1=#:G960 NIL) (|i| NIL)
          (|kernelofvar| (|List| (|Kernel| (|Expression| R))))
          (|newexpr| (|Expression| R)) (|exprlist| (|List| (|Expression| R)))
          (#2=#:G959 NIL) (|gcdcoeff| (|Expression| R))
          (|listforgcd| (|List| R)) (|exprcoeff| (R)) (#3=#:G958 NIL)
          (|listofexpr| (|Union| (|List| (|Expression| R)) "failed")))
         (SEQ
          (LETT |listofexpr| (SPADCALL |var| (QREFELT $ 113))
                . #4=(|SOLVETRA;logsumtolog|))
          (EXIT
           (COND ((QEQCAR |listofexpr| 1) |var|)
                 ('T
                  (SEQ (LETT |listofexpr| (CONS 0 (QCDR |listofexpr|)) . #4#)
                       (LETT |listforgcd| NIL . #4#)
                       (SEQ (LETT |i| NIL . #4#)
                            (LETT #3# (QCDR |listofexpr|) . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |exprcoeff|
                                   (SPADCALL (SPADCALL |i| (QREFELT $ 60))
                                             (QREFELT $ 114))
                                   . #4#)
                             (EXIT
                              (LETT |listforgcd|
                                    (CONS |exprcoeff| |listforgcd|) . #4#)))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |gcdcoeff|
                             (SPADCALL (SPADCALL |listforgcd| (QREFELT $ 115))
                                       (QREFELT $ 116))
                             . #4#)
                       (LETT |newexpr| (|spadConstant| $ 117) . #4#)
                       (SEQ (LETT |i| NIL . #4#)
                            (LETT #2# (QCDR |listofexpr|) . #4#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |i| (CAR #2#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |exprlist| (|SOLVETRA;splitExpr| |i| $)
                                   . #4#)
                             (EXIT
                              (LETT |newexpr|
                                    (SPADCALL |newexpr|
                                              (|SOLVETRA;logexpp|
                                               (SPADCALL |exprlist| 2
                                                         (QREFELT $ 57))
                                               (SPADCALL
                                                (SPADCALL |exprlist| 1
                                                          (QREFELT $ 57))
                                                |gcdcoeff| (QREFELT $ 93))
                                               $)
                                              (QREFELT $ 118))
                                    . #4#)))
                            (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |kernelofvar| (SPADCALL |newexpr| (QREFELT $ 38))
                             . #4#)
                       (LETT |var2| (|spadConstant| $ 98) . #4#)
                       (SEQ (LETT |i| NIL . #4#) (LETT #1# |kernelofvar| . #4#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |i| (CAR #1#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |var2|
                                    (SPADCALL |var2|
                                              (|SPADfirst|
                                               (SPADCALL |i| (QREFELT $ 76)))
                                              (QREFELT $ 119))
                                    . #4#)))
                            (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SPADCALL |gcdcoeff| (SPADCALL |var2| (QREFELT $ 78))
                                  (QREFELT $ 119)))))))))) 

(SDEFUN |SOLVETRA;testLog| ((|expr| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G967 NIL) (#2=#:G968 NIL) (|i| NIL)
          (|kernelofexpr| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ (LETT |testList| (LIST '|log|) . #3=(|SOLVETRA;testLog|))
                (LETT |kernelofexpr| (|SOLVETRA;tableXkernels| |expr| Z $)
                      . #3#)
                (COND
                 ((EQL (LENGTH |kernelofexpr|) 0)
                  (PROGN (LETT #1# NIL . #3#) (GO #4=#:G966))))
                (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofexpr| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                    (QREFELT $ 121))
                          |testList| (QREFELT $ 122))
                         (COND
                          ((NULL
                            (|SOLVETRA;testkernel|
                             (|SPADfirst|
                              (SPADCALL
                               (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                               (QREFELT $ 76)))
                             Z $))
                           (PROGN (LETT #1# NIL . #3#) (GO #4#)))))
                        ('T (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;splitExpr|
        ((|expr| . #1=(|Expression| R)) ($ |List| (|Expression| R)))
        (SPROG
         ((|listexpr| (|Union| (|List| (|Expression| R)) "failed"))
          (|exprwcoeff| #1#) (|lcoeff| (R)))
         (SEQ
          (LETT |lcoeff|
                (SPADCALL (SPADCALL |expr| (QREFELT $ 60)) (QREFELT $ 114))
                . #2=(|SOLVETRA;splitExpr|))
          (LETT |exprwcoeff| |expr| . #2#)
          (LETT |listexpr| (SPADCALL |exprwcoeff| (QREFELT $ 123)) . #2#)
          (EXIT
           (COND ((QEQCAR |listexpr| 1) (LIST (|spadConstant| $ 98) |expr|))
                 ('T
                  (SEQ
                   (LETT |listexpr|
                         (CONS 0
                               (SPADCALL (SPADCALL |lcoeff| (QREFELT $ 116))
                                         (QCDR |listexpr|) (QREFELT $ 124)))
                         . #2#)
                   (EXIT
                    (CONS (SPADCALL |lcoeff| (QREFELT $ 116))
                          (QCDR |listexpr|)))))))))) 

(SDEFUN |SOLVETRA;buildnexpr|
        ((|expr| |Expression| R) (Z |Symbol|) ($ |List| (|Expression| R)))
        (SPROG
         ((|ansmant| (|Expression| R)) (|anscoeff| (|Expression| R))
          (#1=#:G983 NIL) (|i| NIL) (|n2list| (|List| (|Expression| R)))
          (|nlist| (|List| (|Expression| R))))
         (SEQ
          (LETT |nlist| (|SOLVETRA;splitExpr| |expr| $)
                . #2=(|SOLVETRA;buildnexpr|))
          (LETT |n2list|
                (SPADCALL (SPADCALL |nlist| 1 (QREFELT $ 57)) |nlist|
                          (QREFELT $ 124))
                . #2#)
          (LETT |anscoeff| (|spadConstant| $ 98) . #2#)
          (LETT |ansmant| (|spadConstant| $ 117) . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |n2list| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |i| Z (QREFELT $ 126))
                   (LETT |anscoeff| (SPADCALL |i| |anscoeff| (QREFELT $ 119))
                         . #2#))
                  ('T (LETT |ansmant| |i| . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (LIST |anscoeff|
                 (SPADCALL |ansmant| (SPADCALL |nlist| 1 (QREFELT $ 57))
                           (QREFELT $ 119))))))) 

(SDEFUN |SOLVETRA;logexpp|
        ((|expr1| |Expression| R) (|expr2| |Expression| R) ($ |Expression| R))
        (SPADCALL
         (SPADCALL
          (|SPADfirst|
           (SPADCALL (|SPADfirst| (SPADCALL |expr1| (QREFELT $ 38)))
                     (QREFELT $ 76)))
          |expr2| (QREFELT $ 127))
         (QREFELT $ 78))) 

(SDEFUN |SOLVETRA;combineLog|
        ((|expr| |Expression| R) (Y |Symbol|) ($ |Expression| R))
        (SPROG
         ((|ansexpr| #1=(|Expression| R)) (#2=#:G1001 NIL) (|i| NIL)
          (|ans| #1#) (|exprr| (|List| (|Expression| R)))
          (|loopexpr| (|Expression| R))
          (|exprtable| (|Table| (|Expression| R) (|Expression| R))))
         (SEQ
          (LETT |exprtable| (SPADCALL (QREFELT $ 129))
                . #3=(|SOLVETRA;combineLog|))
          (EXIT
           (COND ((QEQCAR (SPADCALL |expr| (QREFELT $ 113)) 1) |expr|)
                 ('T
                  (SEQ (LETT |ans| (|spadConstant| $ 117) . #3#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL |expr| (|spadConstant| $ 117)
                                         (QREFELT $ 131)))
                              (GO G191)))
                            (SEQ
                             (LETT |loopexpr|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |expr| (QREFELT $ 60))
                                              (QREFELT $ 132))
                                    (QREFELT $ 61))
                                   . #3#)
                             (COND
                              ((|SOLVETRA;testLog| |loopexpr| Y $)
                               (COND
                                ((EQL
                                  (LENGTH
                                   (|SOLVETRA;tableXkernels| |loopexpr| Y $))
                                  1)
                                 (SEQ
                                  (LETT |exprr|
                                        (|SOLVETRA;buildnexpr| |loopexpr| Y $)
                                        . #3#)
                                  (COND
                                   ((QEQCAR
                                     (SPADCALL
                                      (SPADCALL |exprr| 1 (QREFELT $ 57))
                                      |exprtable| (QREFELT $ 134))
                                     1)
                                    (SPADCALL |exprtable|
                                              (SPADCALL |exprr| 1
                                                        (QREFELT $ 57))
                                              (|spadConstant| $ 117)
                                              (QREFELT $ 135))))
                                  (EXIT
                                   (SPADCALL |exprtable|
                                             (SPADCALL |exprr| 1
                                                       (QREFELT $ 57))
                                             (SPADCALL
                                              (SPADCALL |exprtable|
                                                        (SPADCALL |exprr| 1
                                                                  (QREFELT $
                                                                           57))
                                                        (QREFELT $ 136))
                                              (SPADCALL |exprr| 2
                                                        (QREFELT $ 57))
                                              (QREFELT $ 118))
                                             (QREFELT $ 135)))))
                                ('T
                                 (LETT |ans|
                                       (SPADCALL |ans| |loopexpr|
                                                 (QREFELT $ 118))
                                       . #3#))))
                              ('T
                               (LETT |ans|
                                     (SPADCALL |ans| |loopexpr|
                                               (QREFELT $ 118))
                                     . #3#)))
                             (EXIT
                              (LETT |expr|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |expr| (QREFELT $ 60))
                                               (QREFELT $ 137))
                                     (QREFELT $ 61))
                                    . #3#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |ansexpr| (|spadConstant| $ 117) . #3#)
                       (SEQ (LETT |i| NIL . #3#)
                            (LETT #2# (SPADCALL |exprtable| (QREFELT $ 138))
                                  . #3#)
                            G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |ansexpr|
                                    (SPADCALL |ansexpr|
                                              (SPADCALL
                                               (|SOLVETRA;logsumtolog|
                                                (SPADCALL |exprtable| |i|
                                                          (QREFELT $ 136))
                                                $)
                                               |i| (QREFELT $ 119))
                                              (QREFELT $ 118))
                                    . #3#)))
                            (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (LETT |ansexpr|
                              (SPADCALL |ansexpr| |ans| (QREFELT $ 118))
                              . #3#))))))))) 

(SDEFUN |SOLVETRA;testRootk|
        ((|varlistk| |Expression| R) (|y| |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G1007 NIL) (#2=#:G1008 NIL) (|i| NIL)
          (|kernelofeqnvar| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ (LETT |testList| (LIST '|nthRoot|) . #3=(|SOLVETRA;testRootk|))
                (LETT |kernelofeqnvar|
                      (|SOLVETRA;tableXkernels| |varlistk| |y| $) . #3#)
                (COND
                 ((EQL (LENGTH |kernelofeqnvar|) 0)
                  (PROGN (LETT #1# NIL . #3#) (GO #4=#:G1006))))
                (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofeqnvar| . #3#)
                     G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                    (QREFELT $ 121))
                          |testList| (QREFELT $ 122))
                         (PROGN (LETT #1# 'T . #3#) (GO #4#))))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT NIL)))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;tableXkernels|
        ((|evar| |Expression| R) (Z |Symbol|) ($ |List| (|Expression| R)))
        (SPROG
         ((|listkOfvar| (|List| (|Expression| R))) (#1=#:G1013 NIL) (|i| NIL)
          (|kOfvar| (|List| (|Kernel| (|Expression| R)))))
         (SEQ
          (LETT |kOfvar| (SPADCALL |evar| (QREFELT $ 38))
                . #2=(|SOLVETRA;tableXkernels|))
          (LETT |listkOfvar| NIL . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |kOfvar| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (SPADCALL (SPADCALL |i| (QREFELT $ 105)) Z
                              (QREFELT $ 126)))
                   (LETT |listkOfvar|
                         (CONS (SPADCALL |i| (QREFELT $ 105)) |listkOfvar|)
                         . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |listkOfvar|)))) 

(SDEFUN |SOLVETRA;testTrig|
        ((|eqnvar| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G1020 NIL) (#2=#:G1021 NIL) (|i| NIL)
          (|kernelofeqnvar| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |testList| (LIST '|sin| '|cos| '|tan| '|cot| '|sec| '|csc|)
                  . #3=(|SOLVETRA;testTrig|))
            (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z $)
                  . #3#)
            (COND
             ((EQL (LENGTH |kernelofeqnvar|) 0)
              (PROGN (LETT #1# NIL . #3#) (GO #4=#:G1019))))
            (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofeqnvar| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                (QREFELT $ 121))
                      |testList| (QREFELT $ 122))
                     (COND
                      ((NULL
                        (|SOLVETRA;testkernel|
                         (|SPADfirst|
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                    (QREFELT $ 76)))
                         Z $))
                       (PROGN (LETT #1# NIL . #3#) (GO #4#)))))
                    ('T (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;testHTrig|
        ((|eqnvar| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G1028 NIL) (#2=#:G1029 NIL) (|i| NIL)
          (|kernelofeqnvar| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |testList|
                  (LIST '|sinh| '|cosh| '|tanh| '|coth| '|sech| '|csch|)
                  . #3=(|SOLVETRA;testHTrig|))
            (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z $)
                  . #3#)
            (COND
             ((EQL (LENGTH |kernelofeqnvar|) 0)
              (PROGN (LETT #1# NIL . #3#) (GO #4=#:G1027))))
            (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofeqnvar| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                (QREFELT $ 121))
                      |testList| (QREFELT $ 122))
                     (COND
                      ((NULL
                        (|SOLVETRA;testkernel|
                         (|SPADfirst|
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                    (QREFELT $ 76)))
                         Z $))
                       (PROGN (LETT #1# NIL . #3#) (GO #4#)))))
                    ('T (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;makeInterval| ((|l| R) ($ |Complex| (|Interval| (|Float|))))
        (COND
         ((|HasCategory| (QREFELT $ 6)
                         (LIST '|ConvertibleTo| (LIST '|Complex| '(|Float|))))
          (SPADCALL (ELT $ 141) (SPADCALL |l| (QREFELT $ 143))
                    (QREFELT $ 147)))
         ('T (|error| "This should never happen")))) 

(SDEFUN |SOLVETRA;dropfun| ((|x| |Expression| R) ($ |Expression| R))
        (SPROG
         ((#1=#:G1045 NIL)
          (|k| (|Union| (|Kernel| (|Expression| R)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |k| (SPADCALL |x| (QREFELT $ 149))
                   . #2=(|SOLVETRA;dropfun|))
             (EXIT
              (COND
               ((OR (QEQCAR |k| 1) (NULL (SPADCALL (QCDR |k|) (QREFELT $ 76))))
                (PROGN
                 (LETT #1# (|spadConstant| $ 117) . #2#)
                 (GO #3=#:G1043))))))
            (EXIT (|SPADfirst| (SPADCALL (QCDR |k|) (QREFELT $ 76))))))
          #3# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;funcinv|
        ((|k| |Expression| R) (|l| |Expression| R)
         ($ |Union| (|Expression| R) "failed"))
        (SPROG
         ((|t| (|Expression| R)) (|fpi| (|Float|))
          (|im| (|Interval| (|Float|)))
          (|z| (|Union| (|Complex| (|Interval| (|Float|))) "failed"))
          (|ze| (|Expression| (|Complex| (|Interval| (|Float|))))))
         (SEQ
          (COND
           ((SPADCALL |k| '|sin| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| '|sin| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1='T (CONS 0 (SPADCALL |l| (QREFELT $ 150))))))
           ((SPADCALL |k| '|cos| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| '|cos| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 151))))))
           ((SPADCALL |k| '|tan| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| '|tan| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 152))))))
           ((SPADCALL |k| '|cot| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| '|cot| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 153))))))
           ((SPADCALL |k| '|sec| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 117) (QREFELT $ 36))
              (CONS 1 "failed"))
             ((SPADCALL |l| '|sec| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 154))))))
           ((SPADCALL |k| '|csc| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 117) (QREFELT $ 36))
              (CONS 1 "failed"))
             ((SPADCALL |l| '|csc| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 155))))))
           ((SPADCALL |k| '|sinh| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| '|sinh| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 156))))))
           ((SPADCALL |k| '|cosh| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| '|cosh| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 157))))))
           ((SPADCALL |k| '|tanh| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| '|tanh| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 158))))))
           ((SPADCALL |k| '|coth| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| '|coth| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 159))))))
           ((SPADCALL |k| '|sech| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| '|sech| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 160))))))
           ((SPADCALL |k| '|csch| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| '|csch| (QREFELT $ 111))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 161))))))
           ((SPADCALL |k| '|atan| (QREFELT $ 111))
            (CONS 0 (SPADCALL |l| (QREFELT $ 94))))
           ((SPADCALL |k| '|acot| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 117) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 162))))))
           ((SPADCALL |k| '|asin| (QREFELT $ 111))
            (CONS 0 (SPADCALL |l| (QREFELT $ 163))))
           ((SPADCALL |k| '|acos| (QREFELT $ 111))
            (CONS 0 (SPADCALL |l| (QREFELT $ 164))))
           ((SPADCALL |k| '|asec| (QREFELT $ 111))
            (CONS 0 (SPADCALL |l| (QREFELT $ 165))))
           ((SPADCALL |k| '|acsc| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 117) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 166))))))
           ((SPADCALL |k| '|asinh| (QREFELT $ 111))
            (CONS 0 (SPADCALL |l| (QREFELT $ 167))))
           ((SPADCALL |k| '|acosh| (QREFELT $ 111))
            (CONS 0 (SPADCALL |l| (QREFELT $ 168))))
           ((SPADCALL |k| '|atanh| (QREFELT $ 111))
            (CONS 0 (SPADCALL |l| (QREFELT $ 169))))
           ((SPADCALL |k| '|acoth| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 117) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 170))))))
           ((SPADCALL |k| '|asech| (QREFELT $ 111))
            (CONS 0 (SPADCALL |l| (QREFELT $ 171))))
           ((SPADCALL |k| '|acsch| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 117) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 172))))))
           ((SPADCALL |k| '|exp| (QREFELT $ 111))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 117) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (|SOLVETRA;simplifyingLog| |l| $)))))
           ((SPADCALL |k| '|log| (QREFELT $ 111))
            (COND
             ((|HasCategory| (QREFELT $ 6)
                             (LIST '|ConvertibleTo|
                                   (LIST '|Complex| '(|Float|))))
              (SEQ
               (LETT |ze|
                     (SPADCALL (CONS (|function| |SOLVETRA;makeInterval|) $)
                               |l| (QREFELT $ 176))
                     . #2=(|SOLVETRA;funcinv|))
               (LETT |z| (SPADCALL |ze| (QREFELT $ 178)) . #2#)
               (EXIT
                (COND ((QEQCAR |z| 1) (CONS 0 (SPADCALL |l| (QREFELT $ 179))))
                      (#1#
                       (SEQ
                        (LETT |im| (SPADCALL (QCDR |z|) (QREFELT $ 180)) . #2#)
                        (LETT |fpi| (SPADCALL (QREFELT $ 181)) . #2#)
                        (COND
                         ((SPADCALL (SPADCALL |fpi| (QREFELT $ 182))
                                    (SPADCALL |im| (QREFELT $ 183))
                                    (QREFELT $ 184))
                          (COND
                           ((SPADCALL (SPADCALL |im| (QREFELT $ 185)) |fpi|
                                      (QREFELT $ 186))
                            (EXIT (CONS 0 (SPADCALL |l| (QREFELT $ 179))))))))
                        (EXIT (CONS 1 "failed"))))))))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 179))))))
           ((SPADCALL |k| '|%power| (QREFELT $ 111))
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 32)) . #2#)
                 (EXIT
                  (COND
                   ((SPADCALL |t| (|spadConstant| $ 117) (QREFELT $ 36))
                    (CONS 1 "failed"))
                   (#1# (CONS 0 (SPADCALL |t| (QREFELT $ 78))))))))
           (#1# (CONS 0 |l|)))))) 

(SDEFUN |SOLVETRA;ker2Poly|
        ((|k| |Kernel| (|Expression| R)) (|lvar| |List| (|Symbol|))
         ($ |Polynomial| (|Expression| R)))
        (SPROG ((|nm| (|Symbol|)))
               (COND
                ((SPADCALL
                  (LETT |nm| (SPADCALL |k| (QREFELT $ 121))
                        |SOLVETRA;ker2Poly|)
                  |lvar| (QREFELT $ 122))
                 (SPADCALL |nm| (QREFELT $ 188)))
                ('T
                 (SPADCALL (SPADCALL |k| (QREFELT $ 105)) (QREFELT $ 189)))))) 

(SDEFUN |SOLVETRA;smp2Poly|
        ((|pol| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         (|lvar| |List| (|Symbol|)) ($ |Polynomial| (|Expression| R)))
        (SPROG NIL
               (SPADCALL (CONS #'|SOLVETRA;smp2Poly!0| (VECTOR $ |lvar|))
                         (CONS #'|SOLVETRA;smp2Poly!1| $) |pol|
                         (QREFELT $ 193)))) 

(SDEFUN |SOLVETRA;smp2Poly!1| ((|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |y| (QREFELT $ 116)) (QREFELT $ 189))) 

(SDEFUN |SOLVETRA;smp2Poly!0| ((|x| NIL) ($$ NIL))
        (PROG (|lvar| $)
          (LETT |lvar| (QREFELT $$ 1) . #1=(|SOLVETRA;smp2Poly|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SOLVETRA;ker2Poly| |x| |lvar| $))))) 

(SDEFUN |SOLVETRA;makeFracPoly|
        ((|expr| |Expression| R) (|lvar| |List| (|Symbol|))
         ($ |Fraction| (|Polynomial| (|Expression| R))))
        (SPADCALL
         (|SOLVETRA;smp2Poly| (SPADCALL |expr| (QREFELT $ 60)) |lvar| $)
         (|SOLVETRA;smp2Poly| (SPADCALL |expr| (QREFELT $ 194)) |lvar| $)
         (QREFELT $ 196))) 

(SDEFUN |SOLVETRA;makeREpol|
        ((|pol| |Polynomial| (|Expression| R)) ($ |Expression| R))
        (SPROG
         ((|lval| (|List| (|Expression| R))) (#1=#:G1111 NIL) (|v| NIL)
          (#2=#:G1110 NIL) (|lvar| (|List| (|Symbol|))))
         (SEQ
          (LETT |lvar| (SPADCALL |pol| (QREFELT $ 197))
                . #3=(|SOLVETRA;makeREpol|))
          (LETT |lval|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |v| NIL . #3#) (LETT #1# |lvar| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 34)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (SPADCALL (SPADCALL |pol| |lvar| |lval| (QREFELT $ 198))
                     (QREFELT $ 199)))))) 

(SDEFUN |SOLVETRA;makeRE|
        ((|frac| |Fraction| (|Polynomial| (|Expression| R)))
         ($ |Expression| R))
        (SPADCALL (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT $ 200)) $)
                  (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT $ 201)) $)
                  (QREFELT $ 93))) 

(SDEFUN |SOLVETRA;solve1Pol|
        ((|pol| |Polynomial| (|Expression| R)) (|var| |Symbol|)
         (|sol| |List| (|Equation| (|Expression| R)))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((#1=#:G1117 NIL) (|vsol| NIL) (#2=#:G1116 NIL)
          (|vsols| (|List| (|Equation| (|Expression| R))))
          (|repol| (|Expression| R)))
         (SEQ
          (LETT |repol|
                (SPADCALL (|SOLVETRA;makeREpol| |pol| $) |sol| (QREFELT $ 203))
                . #3=(|SOLVETRA;solve1Pol|))
          (LETT |vsols| (SPADCALL |repol| |var| (QREFELT $ 17)) . #3#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |vsol| NIL . #3#) (LETT #1# |vsols| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |vsol| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #2# (CONS (CONS |vsol| |sol|) #2#) . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SOLVETRA;solve1Sys|
        ((|plist| |List| (|Polynomial| (|Expression| R)))
         (|lvar| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((|sols| (|List| (|List| (|Equation| (|Expression| R)))))
          (#1=#:G1119 NIL)
          (#2=#:G1118 #3=(|List| (|List| (|Equation| (|Expression| R)))))
          (#4=#:G1120 #3#) (#5=#:G1126 NIL) (|sol| NIL) (#6=#:G1124 NIL)
          (|p| NIL) (#7=#:G1125 NIL) (|v| NIL) (|rlvar| (|List| (|Symbol|)))
          (|rplist| (|List| (|Polynomial| (|Expression| R)))))
         (SEQ (LETT |rplist| (REVERSE |plist|) . #8=(|SOLVETRA;solve1Sys|))
              (LETT |rlvar| (REVERSE |lvar|) . #8#)
              (LETT |sols| (SPADCALL NIL (QREFELT $ 204)) . #8#)
              (SEQ (LETT |v| NIL . #8#) (LETT #7# |rlvar| . #8#)
                   (LETT |p| NIL . #8#) (LETT #6# |rplist| . #8#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#) . #8#) NIL)
                         (ATOM #7#) (PROGN (LETT |v| (CAR #7#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |sols|
                           (PROGN
                            (LETT #1# NIL . #8#)
                            (SEQ (LETT |sol| NIL . #8#) (LETT #5# |sols| . #8#)
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN
                                        (LETT |sol| (CAR #5#) . #8#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (|SOLVETRA;solve1Pol| |p| |v| |sol|
                                           $)
                                          . #8#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #4# (QREFELT $ 205))
                                            . #8#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #4# . #8#)
                                       (LETT #1# 'T . #8#)))))))
                                 (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) ('T NIL)))
                           . #8#)))
                   (LETT #6# (PROG1 (CDR #6#) (LETT #7# (CDR #7#) . #8#))
                         . #8#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |sols|)))) 

(SDEFUN |SOLVETRA;frac_to_expr|
        ((|q| |Fraction|
          (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))
         ($ |Expression| R))
        (SPADCALL (SPADCALL |q| (QREFELT $ 207)) (SPADCALL |q| (QREFELT $ 208))
                  (QREFELT $ 209))) 

(SDEFUN |SOLVETRA;tryLinear|
        ((|lexpr| |List| (|Expression| R)) (|lvar| |List| (|Symbol|))
         ($ |Union| (|List| (|List| (|Equation| (|Expression| R)))) "failed"))
        (SPROG
         ((|eqs| (|List| (|Equation| (|Expression| R)))) (#1=#:G1192 NIL)
          (|i| NIL) (#2=#:G1191 NIL) (|sym| (|Expression| R)) (#3=#:G1190 NIL)
          (|p| NIL) (|zeron| (|Vector| (|Expression| R)))
          (|rhs| (|Vector| (|Expression| R))) (#4=#:G1163 NIL)
          (|sol|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Expression| R)) #5="failed"))
            (|:| |basis| (|List| (|Vector| (|Expression| R))))))
          (|vece| (|Vector| (|Expression| R))) (#6=#:G1189 NIL) (|q| NIL)
          (#7=#:G1188 NIL) (|mate| (|Matrix| (|Expression| R)))
          (#8=#:G1187 NIL) (#9=#:G1186 NIL) (#10=#:G1185 NIL) (|row| NIL)
          (#11=#:G1184 NIL)
          (|r|
           (|Record|
            (|:| |mat|
                 (|Matrix|
                  (|Fraction|
                   (|SparseMultivariatePolynomial| R
                                                   (|Kernel|
                                                    (|Expression| R))))))
            (|:| |vec|
                 (|Vector|
                  (|Fraction|
                   (|SparseMultivariatePolynomial| R
                                                   (|Kernel|
                                                    (|Expression| R))))))))
          (|ps|
           (|List|
            (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
          (#12=#:G1183 NIL) (|expr| NIL) (#13=#:G1182 NIL) (#14=#:G1174 NIL)
          (#15=#:G1181 NIL) (|ker| NIL)
          (|kers| (|List| (|Kernel| (|Expression| R))))
          (|llk| (|List| (|List| (|Kernel| (|Expression| R)))))
          (#16=#:G1180 NIL) (#17=#:G1179 NIL) (#18=#:G1133 NIL)
          (#19=#:G1132 #20=(|Boolean|)) (#21=#:G1134 #20#) (#22=#:G1178 NIL)
          (#23=#:G1130 NIL) (#24=#:G1129 #25=(|Boolean|)) (#26=#:G1131 #25#)
          (#27=#:G1177 NIL) (|lvk| (|List| (|Kernel| (|Expression| R))))
          (#28=#:G1176 NIL) (|v| NIL) (#29=#:G1175 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lvk|
                  (PROGN
                   (LETT #29# NIL . #30=(|SOLVETRA;tryLinear|))
                   (SEQ (LETT |v| NIL . #30#) (LETT #28# |lvar| . #30#) G190
                        (COND
                         ((OR (ATOM #28#)
                              (PROGN (LETT |v| (CAR #28#) . #30#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #29# (CONS (SPADCALL |v| (QREFELT $ 63)) #29#)
                                . #30#)))
                        (LETT #28# (CDR #28#) . #30#) (GO G190) G191
                        (EXIT (NREVERSE #29#))))
                  . #30#)
            (EXIT
             (COND
              ((OR
                (PROGN
                 (LETT #23# NIL . #30#)
                 (SEQ (LETT |expr| NIL . #30#) (LETT #27# |lexpr| . #30#) G190
                      (COND
                       ((OR (ATOM #27#)
                            (PROGN (LETT |expr| (CAR #27#) . #30#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #26#
                               (SPADCALL
                                (SPADCALL (SPADCALL |expr| (QREFELT $ 60))
                                          |lvk| (QREFELT $ 211))
                                1 (QREFELT $ 14))
                               . #30#)
                         (COND
                          (#23# (LETT #24# (COND (#24# 'T) ('T #26#)) . #30#))
                          ('T
                           (PROGN
                            (LETT #24# #26# . #30#)
                            (LETT #23# 'T . #30#)))))))
                      (LETT #27# (CDR #27#) . #30#) (GO G190) G191 (EXIT NIL))
                 (COND (#23# #24#) (#31='T NIL)))
                (PROGN
                 (LETT #18# NIL . #30#)
                 (SEQ (LETT |expr| NIL . #30#) (LETT #22# |lexpr| . #30#) G190
                      (COND
                       ((OR (ATOM #22#)
                            (PROGN (LETT |expr| (CAR #22#) . #30#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #21#
                               (NULL
                                (NULL
                                 (SPADCALL |lvk|
                                           (SPADCALL
                                            (SPADCALL |expr| (QREFELT $ 194))
                                            (QREFELT $ 212))
                                           (QREFELT $ 213))))
                               . #30#)
                         (COND
                          (#18# (LETT #19# (COND (#19# 'T) ('T #21#)) . #30#))
                          ('T
                           (PROGN
                            (LETT #19# #21# . #30#)
                            (LETT #18# 'T . #30#)))))))
                      (LETT #22# (CDR #22#) . #30#) (GO G190) G191 (EXIT NIL))
                 (COND (#18# #19#) (#31# NIL))))
               (CONS 1 "failed"))
              ('T
               (SEQ
                (LETT |llk|
                      (PROGN
                       (LETT #17# NIL . #30#)
                       (SEQ (LETT |expr| NIL . #30#) (LETT #16# |lexpr| . #30#)
                            G190
                            (COND
                             ((OR (ATOM #16#)
                                  (PROGN (LETT |expr| (CAR #16#) . #30#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #17#
                                    (CONS (SPADCALL |expr| (QREFELT $ 214))
                                          #17#)
                                    . #30#)))
                            (LETT #16# (CDR #16#) . #30#) (GO G190) G191
                            (EXIT (NREVERSE #17#))))
                      . #30#)
                (LETT |kers| (SPADCALL (ELT $ 216) |llk| (QREFELT $ 219))
                      . #30#)
                (SEQ (LETT |ker| NIL . #30#) (LETT #15# |kers| . #30#) G190
                     (COND
                      ((OR (ATOM #15#)
                           (PROGN (LETT |ker| (CAR #15#) . #30#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR (SPADCALL |ker| (QREFELT $ 221)) 0) "iterate")
                        ((NULL
                          (NULL
                           (SPADCALL |lvar|
                                     (SPADCALL (SPADCALL |ker| (QREFELT $ 105))
                                               (QREFELT $ 11))
                                     (QREFELT $ 222))))
                         (PROGN
                          (LETT #14# (CONS 1 "failed") . #30#)
                          (GO #32=#:G1173))))))
                     (LETT #15# (CDR #15#) . #30#) (GO G190) G191 (EXIT NIL))
                (LETT |ps|
                      (PROGN
                       (LETT #13# NIL . #30#)
                       (SEQ (LETT |expr| NIL . #30#) (LETT #12# |lexpr| . #30#)
                            G190
                            (COND
                             ((OR (ATOM #12#)
                                  (PROGN (LETT |expr| (CAR #12#) . #30#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #13#
                                    (CONS (SPADCALL |expr| (QREFELT $ 60))
                                          #13#)
                                    . #30#)))
                            (LETT #12# (CDR #12#) . #30#) (GO G190) G191
                            (EXIT (NREVERSE #13#))))
                      . #30#)
                (LETT |r| (SPADCALL |ps| |lvk| (QREFELT $ 226)) . #30#)
                (LETT |mate|
                      (SPADCALL
                       (PROGN
                        (LETT #11# NIL . #30#)
                        (SEQ (LETT |row| NIL . #30#)
                             (LETT #10# (SPADCALL (QCAR |r|) (QREFELT $ 229))
                                   . #30#)
                             G190
                             (COND
                              ((OR (ATOM #10#)
                                   (PROGN (LETT |row| (CAR #10#) . #30#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #11#
                                     (CONS
                                      (PROGN
                                       (LETT #9# NIL . #30#)
                                       (SEQ (LETT |q| NIL . #30#)
                                            (LETT #8# |row| . #30#) G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |q| (CAR #8#) . #30#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #9#
                                                    (CONS
                                                     (|SOLVETRA;frac_to_expr|
                                                      |q| $)
                                                     #9#)
                                                    . #30#)))
                                            (LETT #8# (CDR #8#) . #30#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #9#))))
                                      #11#)
                                     . #30#)))
                             (LETT #10# (CDR #10#) . #30#) (GO G190) G191
                             (EXIT (NREVERSE #11#))))
                       (QREFELT $ 232))
                      . #30#)
                (LETT |vece|
                      (SPADCALL
                       (PROGN
                        (LETT #7# NIL . #30#)
                        (SEQ (LETT |q| NIL . #30#)
                             (LETT #6# (SPADCALL (QCDR |r|) (QREFELT $ 235))
                                   . #30#)
                             G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |q| (CAR #6#) . #30#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (|SOLVETRA;frac_to_expr| |q| $) #7#)
                                     . #30#)))
                             (LETT #6# (CDR #6#) . #30#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       (QREFELT $ 237))
                      . #30#)
                (LETT |sol| (SPADCALL |mate| |vece| (QREFELT $ 241)) . #30#)
                (EXIT
                 (COND ((QEQCAR (QCAR |sol|) 1) (CONS 0 NIL))
                       (#31#
                        (SEQ
                         (LETT |rhs|
                               (PROG2 (LETT #4# (QCAR |sol|) . #30#)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|Vector|
                                                  (|Expression| (QREFELT $ 6)))
                                                 (|Union|
                                                  (|Vector|
                                                   (|Expression|
                                                    (QREFELT $ 6)))
                                                  #5#)
                                                 #4#))
                               . #30#)
                         (LETT |zeron|
                               (SPADCALL (LENGTH |lvar|) (QREFELT $ 242))
                               . #30#)
                         (SEQ (LETT |p| NIL . #30#)
                              (LETT #3# (QCDR |sol|) . #30#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |p| (CAR #3#) . #30#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |p| |zeron| (QREFELT $ 245))
                                  (SEQ
                                   (LETT |sym|
                                         (SPADCALL (SPADCALL (QREFELT $ 33))
                                                   (QREFELT $ 34))
                                         . #30#)
                                   (EXIT
                                    (SEQ (LETT |i| 1 . #30#)
                                         (LETT #2# (LENGTH |lvar|) . #30#) G190
                                         (COND
                                          ((|greater_SI| |i| #2#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SPADCALL |rhs| |i|
                                                     (SPADCALL
                                                      (SPADCALL |rhs| |i|
                                                                (QREFELT $
                                                                         246))
                                                      (SPADCALL |sym|
                                                                (SPADCALL |p|
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           246))
                                                                (QREFELT $
                                                                         119))
                                                      (QREFELT $ 118))
                                                     (QREFELT $ 247))))
                                         (LETT |i| (|inc_SI| |i|) . #30#)
                                         (GO G190) G191 (EXIT NIL))))))))
                              (LETT #3# (CDR #3#) . #30#) (GO G190) G191
                              (EXIT NIL))
                         (LETT |eqs| NIL . #30#)
                         (SEQ (LETT |i| 1 . #30#)
                              (LETT #1# (LENGTH |lvar|) . #30#) G190
                              (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |eqs|
                                      (SPADCALL |eqs|
                                                (LIST
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |lvar| |i|
                                                             (QREFELT $ 248))
                                                   (QREFELT $ 34))
                                                  (SPADCALL |rhs| |i|
                                                            (QREFELT $ 246))
                                                  (QREFELT $ 35)))
                                                (QREFELT $ 58))
                                      . #30#)))
                              (LETT |i| (|inc_SI| |i|) . #30#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS 0 (LIST |eqs|)))))))))))))
          #32# (EXIT #14#)))) 

(SDEFUN |SOLVETRA;solveList|
        ((|lexpr| |List| (|Expression| R)) (|lvar| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((|l| (|List| (|List| (|List| (|Equation| (|Expression| R))))))
          (#1=#:G1204 NIL) (|plist| NIL) (#2=#:G1203 NIL)
          (|trianglist| (|List| (|List| (|Polynomial| (|Expression| R)))))
          (|lfrac| (|List| (|Fraction| (|Polynomial| (|Expression| R)))))
          (#3=#:G1202 NIL) (|expr| NIL) (#4=#:G1201 NIL)
          (|ans1|
           (|Union| (|List| (|List| (|Equation| (|Expression| R)))) "failed")))
         (SEQ
          (LETT |ans1| (|SOLVETRA;solveRetract| |lexpr| |lvar| $)
                . #5=(|SOLVETRA;solveList|))
          (EXIT
           (COND
            ((QEQCAR |ans1| 1)
             (SEQ (LETT |ans1| (|SOLVETRA;tryLinear| |lexpr| |lvar| $) . #5#)
                  (EXIT
                   (COND
                    ((QEQCAR |ans1| 1)
                     (SEQ
                      (LETT |lfrac|
                            (PROGN
                             (LETT #4# NIL . #5#)
                             (SEQ (LETT |expr| NIL . #5#)
                                  (LETT #3# |lexpr| . #5#) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN
                                         (LETT |expr| (CAR #3#) . #5#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (|SOLVETRA;makeFracPoly| |expr|
                                            |lvar| $)
                                           #4#)
                                          . #5#)))
                                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                  (EXIT (NREVERSE #4#))))
                            . #5#)
                      (LETT |trianglist|
                            (SPADCALL |lfrac| |lvar| (QREFELT $ 252)) . #5#)
                      (LETT |l|
                            (PROGN
                             (LETT #2# NIL . #5#)
                             (SEQ (LETT |plist| NIL . #5#)
                                  (LETT #1# |trianglist| . #5#) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN
                                         (LETT |plist| (CAR #1#) . #5#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (|SOLVETRA;solve1Sys| |plist| |lvar|
                                            $)
                                           #2#)
                                          . #5#)))
                                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            . #5#)
                      (EXIT (SPADCALL (ELT $ 205) |l| NIL (QREFELT $ 255)))))
                    (#6='T (QCDR |ans1|))))))
            (#6# (QCDR |ans1|))))))) 

(SDEFUN |SOLVETRA;solve;LLL;37|
        ((|leqs| |List| (|Equation| (|Expression| R)))
         (|lvar| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((|lexpr| (|List| (|Expression| R))) (#1=#:G1209 NIL) (|eq| NIL)
          (#2=#:G1208 NIL))
         (SEQ
          (LETT |lexpr|
                (PROGN
                 (LETT #2# NIL . #3=(|SOLVETRA;solve;LLL;37|))
                 (SEQ (LETT |eq| NIL . #3#) (LETT #1# |leqs| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |eq| (QREFELT $ 20))
                                         (SPADCALL |eq| (QREFELT $ 21))
                                         (QREFELT $ 22))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (|SOLVETRA;solveList| |lexpr| |lvar| $))))) 

(DECLAIM (NOTINLINE |TransSolvePackage;|)) 

(DEFUN |TransSolvePackage| (#1=#:G1210)
  (SPROG NIL
         (PROG (#2=#:G1211)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TransSolvePackage|)
                                               '|domainEqualList|)
                    . #3=(|TransSolvePackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|TransSolvePackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TransSolvePackage|)))))))))) 

(DEFUN |TransSolvePackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TransSolvePackage|))
          (LETT |dv$| (LIST '|TransSolvePackage| DV$1) . #1#)
          (LETT $ (GETREFV 257) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TransSolvePackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TransSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (|Expression| 6) (0 . |zero?|) (|List| 16) (5 . |variables|)
              (10 . |One|) (|NonNegativeInteger|) (14 . >) (|List| 19)
              (|Symbol|) |SOLVETRA;solve;ESL;5| |SOLVETRA;solve;EL;1|
              (|Equation| 8) (20 . |lhs|) (25 . |rhs|) (30 . -)
              |SOLVETRA;solve;EL;2| |SOLVETRA;solve;ESL;3|
              (|Union| 56 '#1="failed") (36 . |retractIfCan|)
              (|Union| (|Fraction| 56) '#1#) (41 . |retractIfCan|)
              (|Equation| $) (46 . |eval|)
              (|ElementaryFunctionStructurePackage| 6 8) (52 . |normalize|)
              (57 . |new|) (61 . |coerce|) (66 . =) (72 . =) (|List| 40)
              (78 . |kernels|) (|Fraction| 52) (|Kernel| $) (83 . |univariate|)
              (|SparseUnivariatePolynomial| 8) (|Fraction| 42) (89 . |numer|)
              (|Factored| 42) (|ExpressionFactorPolynomial| 6 8)
              (94 . |factorPolynomial|)
              (|Record| (|:| |factor| 42) (|:| |exponent| 56)) (|List| 48)
              (99 . |factors|) (|List| $) (|SparseUnivariatePolynomial| $)
              (104 . |zerosOf|) (|List| 8) (110 . |append|) (|Integer|)
              (116 . |elt|) (122 . |append|)
              (|SparseMultivariatePolynomial| 6 40) (128 . |numer|)
              (133 . |coerce|) (|Kernel| 8) (138 . |kernel|)
              (|AlgebraicManipulations| 6 8) (143 . |rootSimp|) (|Factored| 67)
              (|SparseMultivariatePolynomial| 6 62)
              (|MultivariateFactorize| 62 (|IndexedExponents| 62) 6 67)
              (148 . |factor|) (|Record| (|:| |factor| 67) (|:| |exponent| 56))
              (|List| 70) (153 . |factors|)
              (|Record| (|:| |var| 40) (|:| |exponent| 56))
              (|Union| 73 '"failed") (158 . |isExpt|) (164 . |argument|)
              (169 . *) (175 . |log|) (|SparseUnivariatePolynomial| 6)
              (180 . |One|) (|Union| (|Fraction| (|Polynomial| 6)) '#1#)
              (184 . |retractIfCan|) (|List| 15)
              (|List| (|Fraction| (|Polynomial| 6))) (|RadicalSolvePackage| 6)
              (189 . |radicalSolve|) (|TranscendentalManipulations| 6 8)
              (195 . |simplify|) (200 . |normalize|)
              (|TrigonometricManipulations| 6 8) (206 . |complexNormalize|)
              (212 . |coerce|) (217 . /) (223 . |tan|) (|PositiveInteger|)
              (228 . *) (234 . ^) (240 . |One|) (244 . -)
              (|TransSolvePackageService| 6) (249 . |decomposeFunc|) (256 . =)
              (|Fraction| $) (262 . |elt|) (268 . |coerce|) (273 . |second|)
              (278 . |retract|) (283 . |monomial|) (289 . -)
              (295 . |resultant|) (301 . |is?|) (|Union| 51 '"failed")
              (307 . |isPlus|) (312 . |leadingCoefficient|) (317 . |gcd|)
              (322 . |coerce|) (327 . |Zero|) (331 . +) (337 . *)
              (343 . |Zero|) (347 . |name|) (352 . |member?|) (358 . |isTimes|)
              (363 . |remove!|) (369 . |One|) (373 . |freeOf?|) (379 . ^)
              (|Table| 8 8) (385 . |table|) (389 . |Zero|) (393 . ~=)
              (399 . |leadingMonomial|) (|Union| 8 '"failed") (404 . |search|)
              (410 . |setelt!|) (417 . |elt|) (423 . |reductum|) (428 . |keys|)
              (|Float|) (|Interval| 139) (433 . |interval|) (|Complex| 139)
              (438 . |convert|) (|Complex| 140) (|Mapping| 140 139)
              (|ComplexFunctions2| 139 140) (443 . |map|) (|Union| 40 '#1#)
              (449 . |retractIfCan|) (454 . |asin|) (459 . |acos|)
              (464 . |atan|) (469 . |acot|) (474 . |asec|) (479 . |acsc|)
              (484 . |asinh|) (489 . |acosh|) (494 . |atanh|) (499 . |acoth|)
              (504 . |asech|) (509 . |acsch|) (514 . |cot|) (519 . |sin|)
              (524 . |cos|) (529 . |sec|) (534 . |csc|) (539 . |sinh|)
              (544 . |cosh|) (549 . |tanh|) (554 . |coth|) (559 . |sech|)
              (564 . |csch|) (|Expression| 144) (|Mapping| 144 6)
              (|ExpressionFunctions2| 6 144) (569 . |map|) (|Union| 144 '#1#)
              (575 . |retractIfCan|) (580 . |exp|) (585 . |imag|) (590 . |pi|)
              (594 . -) (599 . |inf|) (604 . <) (610 . |sup|) (615 . <=)
              (|Polynomial| 8) (621 . |coerce|) (626 . |coerce|)
              (|Mapping| 187 62) (|Mapping| 187 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 62) 62 6 67 187)
              (631 . |map|) (638 . |denom|) (|Fraction| 187) (643 . /)
              (649 . |variables|) (654 . |eval|) (661 . |ground|)
              (666 . |numer|) (671 . |denom|) (|List| 29) (676 . |eval|)
              (682 . |list|) (687 . |append|) (|Fraction| 67) (693 . |numer|)
              (698 . |denom|) (703 . /) (|List| 62) (709 . |totalDegree|)
              (715 . |variables|) (720 . |setIntersection|) (726 . |tower|)
              (731 . |setUnion|) (737 . |setUnion|) (|Mapping| 210 210 210)
              (|List| 210) (743 . |reduce|) (|Union| 16 '"failed")
              (749 . |symbolIfCan|) (754 . |setIntersection|)
              (|Record| (|:| |mat| 228) (|:| |vec| 234)) (|List| 67)
              (|LinearSystemPolynomialPackage| 6 (|IndexedExponents| 62) 62 67)
              (760 . |intoMatrix|) (|List| 233) (|Matrix| 206)
              (766 . |listOfLists|) (|List| 54) (|Matrix| 8) (771 . |matrix|)
              (|List| 206) (|Vector| 206) (776 . |parts|) (|Vector| 8)
              (781 . |vector|) (|Union| 236 '"failed")
              (|Record| (|:| |particular| 238) (|:| |basis| (|List| 236)))
              (|LinearSystemMatrixPackage| 8 236 236 231) (786 . |solve|)
              (792 . |zero|) (|Vector| $) (797 . |basis|) (801 . ~=)
              (807 . |elt|) (813 . |setelt!|) (820 . |elt|)
              (|List| (|List| 187)) (|List| 195) (|SystemSolvePackage| 8)
              (826 . |triangularSystems|) (|Mapping| 83 83 83) (|List| 83)
              (832 . |reduce|) |SOLVETRA;solve;LLL;37|)
           '#(|solve| 839) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 256
                                                 '(1 8 7 0 9 1 8 10 0 11 0 6 0
                                                   12 2 13 7 0 0 14 1 19 8 0 20
                                                   1 19 8 0 21 2 8 0 0 0 22 1 8
                                                   25 0 26 1 8 27 0 28 2 8 0 0
                                                   29 30 1 31 8 8 32 0 16 0 33
                                                   1 8 0 16 34 2 19 0 8 8 35 2
                                                   8 7 0 0 36 1 8 37 0 38 2 8
                                                   39 0 40 41 1 43 42 0 44 1 46
                                                   45 42 47 1 45 49 0 50 2 8 51
                                                   52 16 53 2 54 0 0 0 55 2 54
                                                   8 0 56 57 2 15 0 0 0 58 1 8
                                                   59 0 60 1 8 0 59 61 1 62 0
                                                   16 63 1 64 8 8 65 1 68 66 67
                                                   69 1 66 71 0 72 2 8 74 0 16
                                                   75 1 62 54 0 76 2 8 0 56 0
                                                   77 1 8 0 0 78 0 79 0 80 1 8
                                                   81 0 82 2 85 83 84 10 86 1
                                                   87 8 8 88 2 31 8 8 16 89 2
                                                   90 8 8 16 91 1 8 0 56 92 2 8
                                                   0 0 0 93 1 8 0 0 94 2 8 0 95
                                                   0 96 2 8 0 0 95 97 0 8 0 98
                                                   1 8 0 0 99 3 100 43 43 43 43
                                                   101 2 43 7 0 0 102 2 42 8
                                                   103 8 104 1 8 0 40 105 1 54
                                                   8 0 106 1 8 56 0 107 2 42 0
                                                   8 13 108 2 42 0 0 0 109 2 42
                                                   8 0 0 110 2 8 7 0 16 111 1 8
                                                   112 0 113 1 67 6 0 114 1 6 0
                                                   51 115 1 8 0 6 116 0 8 0 117
                                                   2 8 0 0 0 118 2 8 0 0 0 119
                                                   0 6 0 120 1 62 16 0 121 2 10
                                                   7 16 0 122 1 8 112 0 123 2
                                                   54 0 8 0 124 0 56 0 125 2 8
                                                   7 0 16 126 2 8 0 0 0 127 0
                                                   128 0 129 0 79 0 130 2 8 7 0
                                                   0 131 1 67 0 0 132 2 128 133
                                                   8 0 134 3 128 8 0 8 8 135 2
                                                   128 8 0 8 136 1 67 0 0 137 1
                                                   128 54 0 138 1 140 0 139 141
                                                   1 6 142 0 143 2 146 144 145
                                                   142 147 1 8 148 0 149 1 8 0
                                                   0 150 1 8 0 0 151 1 8 0 0
                                                   152 1 8 0 0 153 1 8 0 0 154
                                                   1 8 0 0 155 1 8 0 0 156 1 8
                                                   0 0 157 1 8 0 0 158 1 8 0 0
                                                   159 1 8 0 0 160 1 8 0 0 161
                                                   1 8 0 0 162 1 8 0 0 163 1 8
                                                   0 0 164 1 8 0 0 165 1 8 0 0
                                                   166 1 8 0 0 167 1 8 0 0 168
                                                   1 8 0 0 169 1 8 0 0 170 1 8
                                                   0 0 171 1 8 0 0 172 2 175
                                                   173 174 8 176 1 173 177 0
                                                   178 1 8 0 0 179 1 144 140 0
                                                   180 0 139 0 181 1 139 0 0
                                                   182 1 140 139 0 183 2 139 7
                                                   0 0 184 1 140 139 0 185 2
                                                   139 7 0 0 186 1 187 0 16 188
                                                   1 187 0 8 189 3 192 187 190
                                                   191 67 193 1 8 59 0 194 2
                                                   195 0 187 187 196 1 187 10 0
                                                   197 3 187 0 0 10 54 198 1
                                                   187 8 0 199 1 195 187 0 200
                                                   1 195 187 0 201 2 8 0 0 202
                                                   203 1 83 0 15 204 2 83 0 0 0
                                                   205 1 206 67 0 207 1 206 67
                                                   0 208 2 8 0 59 59 209 2 67
                                                   13 0 210 211 1 67 210 0 212
                                                   2 210 0 0 0 213 1 8 37 0 214
                                                   2 15 0 0 0 215 2 210 0 0 0
                                                   216 2 218 210 217 0 219 1 62
                                                   220 0 221 2 10 0 0 0 222 2
                                                   225 223 224 210 226 1 228
                                                   227 0 229 1 231 0 230 232 1
                                                   234 233 0 235 1 236 0 54 237
                                                   2 240 239 231 236 241 1 236
                                                   0 13 242 0 144 243 244 2 236
                                                   7 0 0 245 2 236 8 0 56 246 3
                                                   236 8 0 56 8 247 2 10 16 0
                                                   56 248 2 251 249 250 10 252
                                                   3 254 83 253 0 83 255 1 0 15
                                                   19 23 1 0 15 8 18 2 0 15 19
                                                   16 24 2 0 83 15 10 256 2 0
                                                   15 8 16 17)))))
           '|lookupComplete|)) 
