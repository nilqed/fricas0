
(SDEFUN |INNMFACT;convertPUP|
        ((|lfg| |Record| (|:| |contp| R)
          (|:| |factors|
               (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|))))))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                          (|:| |pow| (|Integer|)))))))
        (SPROG ((#1=#:G735 NIL) (|lff| NIL) (#2=#:G734 NIL))
               (SEQ
                (CONS (QCAR |lfg|)
                      (PROGN
                       (LETT #2# NIL . #3=(|INNMFACT;convertPUP|))
                       (SEQ (LETT |lff| NIL . #3#)
                            (LETT #1# (QCDR |lfg|) . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |lff| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (CONS
                                      (SPADCALL (QCAR |lff|) (QREFELT $ 18))
                                      (QCDR |lff|))
                                     #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |INNMFACT;supFactor|
        ((|um| |SparseUnivariatePolynomial| P)
         (|ufactor| |Mapping| #1=(|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                          (|:| |pow| (|Integer|)))))))
        (SPROG
         ((#2=#:G794 NIL) (|uum1| (R)) (|lcfacs| (R)) (#3=#:G789 NIL)
          (#4=#:G788 (R)) (#5=#:G790 (R)) (#6=#:G792 NIL) (#7=#:G812 NIL)
          (|f| NIL)
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                      (|:| |pow| (|Integer|)))))
          (|auxfl|
           (|List|
            #8=(|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                         (|:| |pow| (|Integer|)))))
          (#9=#:G811 NIL) (|lfp| NIL) (#10=#:G810 NIL)
          (|lf| (|List| (|SparseUnivariatePolynomial| P)))
          (|ldeg| (|List| #11=(|NonNegativeInteger|))) (#12=#:G778 NIL)
          (#13=#:G777 #11#) (#14=#:G779 #11#) (#15=#:G809 NIL) (|fc| NIL)
          (#16=#:G808 NIL) (|xx| NIL) (#17=#:G807 NIL) (|coefs| (|List| P))
          (#18=#:G806 NIL) (|lff| NIL) (#19=#:G805 NIL) (|lcont| (P))
          (|lfg|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))))
          (|ffexp| #20=(|Integer|))
          (|ffactor| #21=(|SparseUnivariatePolynomial| P)) (#22=#:G804 NIL)
          (|fact| NIL)
          (|sqqfact|
           (|List| (|Record| (|:| |factor| #21#) (|:| |exponent| #20#))))
          (|flead| (|Record| (|:| |contp| R) (|:| |factors| (|List| #8#))))
          (|sqfacs| (|Factored| (|SparseUnivariatePolynomial| P)))
          (|uum|
           (|Record| (|:| |unit| (|SparseUnivariatePolynomial| P))
                     (|:| |canonical| (|SparseUnivariatePolynomial| P))
                     (|:| |associate| (|SparseUnivariatePolynomial| P))))
          (#23=#:G800 NIL) (#24=#:G761 NIL)
          (|f1| (|SparseUnivariatePolynomial| P))
          (|mdeg| (|NonNegativeInteger|)) (#25=#:G803 NIL) (|ff| NIL)
          (#26=#:G802 NIL) (|lfact| #1#)
          (|umv| (|SparseUnivariatePolynomial| R)) (|lvar| #27=(|List| OV))
          (#28=#:G748 NIL) (#29=#:G747 #27#) (#30=#:G749 #27#) (#31=#:G801 NIL)
          (|cf| NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |um| (QREFELT $ 20))
             (|INNMFACT;convertPUP|
              (|INNMFACT;mFactor| (SPADCALL |um| (QREFELT $ 21)) |ufactor| $)
              $))
            (#32='T
             (SEQ
              (LETT |lvar|
                    (PROGN
                     (LETT #28# NIL . #33=(|INNMFACT;supFactor|))
                     (SEQ (LETT |cf| NIL . #33#)
                          (LETT #31# (SPADCALL |um| (QREFELT $ 23)) . #33#)
                          G190
                          (COND
                           ((OR (ATOM #31#)
                                (PROGN (LETT |cf| (CAR #31#) . #33#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #30# (SPADCALL |cf| (QREFELT $ 25)) . #33#)
                             (COND
                              (#28#
                               (LETT #29# (SPADCALL #29# #30# (QREFELT $ 26))
                                     . #33#))
                              ('T
                               (PROGN
                                (LETT #29# #30# . #33#)
                                (LETT #28# 'T . #33#)))))))
                          (LETT #31# (CDR #31#) . #33#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#28# #29#) (#32# (|IdentityError| '|setUnion|))))
                    . #33#)
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ
                  (LETT |umv| (SPADCALL (ELT $ 27) |um| (QREFELT $ 31)) . #33#)
                  (LETT |lfact| (SPADCALL |umv| |ufactor|) . #33#)
                  (EXIT
                   (CONS
                    (SPADCALL (SPADCALL |lfact| (QREFELT $ 33)) (QREFELT $ 34))
                    (PROGN
                     (LETT #26# NIL . #33#)
                     (SEQ (LETT |ff| NIL . #33#)
                          (LETT #25# (SPADCALL |lfact| (QREFELT $ 37)) . #33#)
                          G190
                          (COND
                           ((OR (ATOM #25#)
                                (PROGN (LETT |ff| (CAR #25#) . #33#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #26#
                                  (CONS
                                   (CONS
                                    (SPADCALL (ELT $ 38) (QCAR |ff|)
                                              (QREFELT $ 41))
                                    (QCDR |ff|))
                                   #26#)
                                  . #33#)))
                          (LETT #25# (CDR #25#) . #33#) (GO G190) G191
                          (EXIT (NREVERSE #26#))))))))
                (#32#
                 (SEQ (LETT |flead| (CONS (|spadConstant| $ 43) NIL) . #33#)
                      (LETT |factorlist| NIL . #33#)
                      (LETT |mdeg| (SPADCALL |um| (QREFELT $ 45)) . #33#)
                      (COND
                       ((SPADCALL |mdeg| 0 (QREFELT $ 46))
                        (SEQ
                         (LETT |f1|
                               (SPADCALL (|spadConstant| $ 48) |mdeg|
                                         (QREFELT $ 49))
                               . #33#)
                         (LETT |um|
                               (PROG2
                                   (LETT #24#
                                         (SPADCALL |um| |f1| (QREFELT $ 51))
                                         . #33#)
                                   (QCDR #24#)
                                 (|check_union2| (QEQCAR #24# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 9))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 9))
                                                  "failed")
                                                 #24#))
                               . #33#)
                         (LETT |factorlist|
                               (CONS
                                (CONS
                                 (SPADCALL (|spadConstant| $ 48) 1
                                           (QREFELT $ 49))
                                 |mdeg|)
                                |factorlist|)
                               . #33#)
                         (EXIT
                          (COND
                           ((EQL (SPADCALL |um| (QREFELT $ 52)) 0)
                            (PROGN
                             (LETT #23#
                                   (SEQ
                                    (LETT |lfg|
                                          (|INNMFACT;convertPUP|
                                           (|INNMFACT;mFactor|
                                            (SPADCALL |um| (QREFELT $ 21))
                                            |ufactor| $)
                                           $)
                                          . #33#)
                                    (EXIT
                                     (CONS (QCAR |lfg|)
                                           (SPADCALL |factorlist| (QCDR |lfg|)
                                                     (QREFELT $ 55)))))
                                   . #33#)
                             (GO #34=#:G799))))))))
                      (LETT |uum| (SPADCALL |um| (QREFELT $ 57)) . #33#)
                      (LETT |um| (QVELT |uum| 1) . #33#)
                      (LETT |sqfacs| (SPADCALL |um| (QREFELT $ 60)) . #33#)
                      (LETT |lcont|
                            (SPADCALL
                             (SPADCALL (QVELT |uum| 0)
                                       (SPADCALL |sqfacs| (QREFELT $ 61))
                                       (QREFELT $ 62))
                             (QREFELT $ 21))
                            . #33#)
                      (LETT |flead|
                            (|INNMFACT;convertPUP|
                             (|INNMFACT;mFactor| |lcont| |ufactor| $) $)
                            . #33#)
                      (LETT |factorlist|
                            (SPADCALL (QCDR |flead|) |factorlist|
                                      (QREFELT $ 55))
                            . #33#)
                      (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT $ 65))
                            . #33#)
                      (SEQ (LETT |fact| NIL . #33#)
                           (LETT #22# |sqqfact| . #33#) G190
                           (COND
                            ((OR (ATOM #22#)
                                 (PROGN (LETT |fact| (CAR #22#) . #33#) NIL))
                             (GO G191)))
                           (SEQ (LETT |ffactor| (QCAR |fact|) . #33#)
                                (LETT |ffexp| (QCDR |fact|) . #33#)
                                (EXIT
                                 (COND
                                  ((ZEROP (SPADCALL |ffactor| (QREFELT $ 52)))
                                   (SEQ
                                    (LETT |lfg|
                                          (|INNMFACT;mFactor|
                                           (SPADCALL |ffactor| (QREFELT $ 21))
                                           |ufactor| $)
                                          . #33#)
                                    (LETT |lcont|
                                          (SPADCALL (QCAR |lfg|) |lcont|
                                                    (QREFELT $ 66))
                                          . #33#)
                                    (EXIT
                                     (LETT |factorlist|
                                           (SPADCALL |factorlist|
                                                     (PROGN
                                                      (LETT #19# NIL . #33#)
                                                      (SEQ
                                                       (LETT |lff| NIL . #33#)
                                                       (LETT #18# (QCDR |lfg|)
                                                             . #33#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #18#)
                                                             (PROGN
                                                              (LETT |lff|
                                                                    (CAR #18#)
                                                                    . #33#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #19#
                                                               (CONS
                                                                (CONS
                                                                 (SPADCALL
                                                                  (QCAR |lff|)
                                                                  (QREFELT $
                                                                           18))
                                                                 (*
                                                                  (QCDR |lff|)
                                                                  |ffexp|))
                                                                #19#)
                                                               . #33#)))
                                                       (LETT #18# (CDR #18#)
                                                             . #33#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #19#))))
                                                     (QREFELT $ 55))
                                           . #33#))))
                                  ('T
                                   (SEQ
                                    (LETT |coefs|
                                          (SPADCALL |ffactor| (QREFELT $ 23))
                                          . #33#)
                                    (LETT |ldeg|
                                          (PROGN
                                           (LETT #17# NIL . #33#)
                                           (SEQ (LETT |xx| NIL . #33#)
                                                (LETT #16# |lvar| . #33#) G190
                                                (COND
                                                 ((OR (ATOM #16#)
                                                      (PROGN
                                                       (LETT |xx| (CAR #16#)
                                                             . #33#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #17#
                                                        (CONS
                                                         (PROGN
                                                          (LETT #12# NIL
                                                                . #33#)
                                                          (SEQ
                                                           (LETT |fc| NIL
                                                                 . #33#)
                                                           (LETT #15# |coefs|
                                                                 . #33#)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #15#)
                                                                 (PROGN
                                                                  (LETT |fc|
                                                                        (CAR
                                                                         #15#)
                                                                        . #33#)
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (PROGN
                                                              (LETT #14#
                                                                    (SPADCALL
                                                                     |fc| |xx|
                                                                     (QREFELT $
                                                                              67))
                                                                    . #33#)
                                                              (COND
                                                               (#12#
                                                                (LETT #13#
                                                                      (MAX #13#
                                                                           #14#)
                                                                      . #33#))
                                                               ('T
                                                                (PROGN
                                                                 (LETT #13#
                                                                       #14#
                                                                       . #33#)
                                                                 (LETT #12# 'T
                                                                       . #33#)))))))
                                                           (LETT #15#
                                                                 (CDR #15#)
                                                                 . #33#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                          (COND (#12# #13#)
                                                                ('T
                                                                 (|IdentityError|
                                                                  '|max|))))
                                                         #17#)
                                                        . #33#)))
                                                (LETT #16# (CDR #16#) . #33#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #17#))))
                                          . #33#)
                                    (LETT |lf|
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL |ffactor|
                                                       (QREFELT $ 68))
                                             (QREFELT $ 69))
                                            (|INNMFACT;mfconst| |ffactor|
                                             |lvar| |ldeg| |ufactor| $))
                                           ('T
                                            (|INNMFACT;mfpol| |ffactor| |lvar|
                                             |ldeg| |ufactor| $)))
                                          . #33#)
                                    (LETT |auxfl|
                                          (PROGN
                                           (LETT #10# NIL . #33#)
                                           (SEQ (LETT |lfp| NIL . #33#)
                                                (LETT #9# |lf| . #33#) G190
                                                (COND
                                                 ((OR (ATOM #9#)
                                                      (PROGN
                                                       (LETT |lfp| (CAR #9#)
                                                             . #33#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #10#
                                                        (CONS
                                                         (CONS |lfp| |ffexp|)
                                                         #10#)
                                                        . #33#)))
                                                (LETT #9# (CDR #9#) . #33#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #10#))))
                                          . #33#)
                                    (EXIT
                                     (LETT |factorlist|
                                           (SPADCALL |factorlist| |auxfl|
                                                     (QREFELT $ 55))
                                           . #33#)))))))
                           (LETT #22# (CDR #22#) . #33#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |lcfacs|
                            (PROGN
                             (LETT #3# NIL . #33#)
                             (SEQ (LETT |f| NIL . #33#)
                                  (LETT #7# |factorlist| . #33#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |f| (CAR #7#) . #33#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #5#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QCAR |f|)
                                                       (QREFELT $ 68))
                                             (QREFELT $ 70))
                                            (PROG1 (LETT #6# (QCDR |f|) . #33#)
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))
                                            (QREFELT $ 71))
                                           . #33#)
                                     (COND
                                      (#3#
                                       (LETT #4#
                                             (SPADCALL #4# #5# (QREFELT $ 72))
                                             . #33#))
                                      ('T
                                       (PROGN
                                        (LETT #4# #5# . #33#)
                                        (LETT #3# 'T . #33#)))))))
                                  (LETT #7# (CDR #7#) . #33#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#3# #4#) (#32# (|spadConstant| $ 47))))
                            . #33#)
                      (LETT |uum1|
                            (SPADCALL (SPADCALL (QVELT |uum| 0) (QREFELT $ 73))
                                      (QREFELT $ 74))
                            . #33#)
                      (EXIT
                       (CONS
                        (SPADCALL |uum1|
                                  (PROG2
                                      (LETT #2#
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |um| (QREFELT $ 68))
                                              (QREFELT $ 70))
                                             |lcfacs| (QREFELT $ 75))
                                            . #33#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (QREFELT $ 8)
                                                    (|Union| (QREFELT $ 8)
                                                             "failed")
                                                    #2#))
                                  (QREFELT $ 72))
                        |factorlist|))))))))))
          #34# (EXIT #23#)))) 

(SDEFUN |INNMFACT;factor;SupMF;3|
        ((|um| |SparseUnivariatePolynomial| P)
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Factored| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((#1=#:G816 NIL)
          (#2=#:G815 #3=(|Factored| (|SparseUnivariatePolynomial| P)))
          (#4=#:G817 #3#) (#5=#:G821 NIL) (|u| NIL)
          (|flist|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr| (|SparseUnivariatePolynomial| P))
                            (|:| |pow| (|Integer|))))))))
         (SEQ
          (LETT |flist| (|INNMFACT;supFactor| |um| |ufactor| $)
                . #6=(|INNMFACT;factor;SupMF;3|))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 38)) (QREFELT $ 18))
            (PROGN
             (LETT #1# NIL . #6#)
             (SEQ (LETT |u| NIL . #6#) (LETT #5# (QCDR |flist|) . #6#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (SPADCALL (QCAR |u|) (QCDR |u|) (QREFELT $ 76))
                           . #6#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 77)) . #6#))
                      ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                  (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T (|spadConstant| $ 78))))
            (QREFELT $ 79)))))) 

(SDEFUN |INNMFACT;varChoose|
        ((|m| P) (|lvar| |List| OV) (|ldeg| |List| #1=(|NonNegativeInteger|))
         ($ |Record| (|:| |npol| (|SparseUnivariatePolynomial| P))
          (|:| |nvar| (|List| OV))
          (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|x| (OV)) (|i| (|Integer|)) (|k| #1#) (#2=#:G824 NIL)
          (#3=#:G823 #1#) (#4=#:G825 #1#) (#5=#:G837 NIL) (|d| NIL))
         (SEQ
          (LETT |k|
                (PROGN
                 (LETT #2# NIL . #6=(|INNMFACT;varChoose|))
                 (SEQ (LETT |d| NIL . #6#) (LETT #5# |ldeg| . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |d| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# |d| . #6#)
                         (COND (#2# (LETT #3# (MIN #3# #4#) . #6#))
                               ('T
                                (PROGN
                                 (LETT #3# #4# . #6#)
                                 (LETT #2# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) (#7='T (|IdentityError| '|min|))))
                . #6#)
          (EXIT
           (COND
            ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 67)))
             (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 83)) |lvar|
                     |ldeg|))
            (#7#
             (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT $ 85)) . #6#)
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 86)) . #6#)
                  (LETT |ldeg| (CONS |k| (SPADCALL |ldeg| |i| (QREFELT $ 87)))
                        . #6#)
                  (LETT |lvar| (CONS |x| (SPADCALL |lvar| |i| (QREFELT $ 88)))
                        . #6#)
                  (EXIT
                   (VECTOR (SPADCALL |m| |x| (QREFELT $ 83)) |lvar|
                           |ldeg|))))))))) 

(SDEFUN |INNMFACT;localNorm|
        ((|lum| |List| (|SparseUnivariatePolynomial| R)) ($ . #1=(|Integer|)))
        (SPROG
         ((#2=#:G843 NIL) (#3=#:G842 #1#) (#4=#:G844 #1#) (#5=#:G847 NIL)
          (#6=#:G846 #1#) (#7=#:G848 #1#) (|cc| (R)) (#8=#:G852 NIL) (|i| NIL)
          (#9=#:G851 NIL) (|ff| NIL) (#10=#:G840 NIL) (#11=#:G839 #1#)
          (#12=#:G841 #1#) (#13=#:G850 NIL))
         (SEQ
          (COND
           ((|domainEqual| (QREFELT $ 8) (|AlgebraicNumber|))
            (PROGN
             (LETT #10# NIL . #14=(|INNMFACT;localNorm|))
             (SEQ (LETT |ff| NIL . #14#) (LETT #13# |lum| . #14#) G190
                  (COND
                   ((OR (ATOM #13#) (PROGN (LETT |ff| (CAR #13#) . #14#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #12# (SPADCALL |ff| (QREFELT $ 89)) . #14#)
                     (COND (#10# (LETT #11# (MAX #11# #12#) . #14#))
                           ('T
                            (PROGN
                             (LETT #11# #12# . #14#)
                             (LETT #10# 'T . #14#)))))))
                  (LETT #13# (CDR #13#) . #14#) (GO G190) G191 (EXIT NIL))
             (COND (#10# #11#) (#15='T (|IdentityError| '|max|)))))
           (#15#
            (PROGN
             (LETT #2# NIL . #14#)
             (SEQ (LETT |ff| NIL . #14#) (LETT #9# |lum| . #14#) G190
                  (COND
                   ((OR (ATOM #9#) (PROGN (LETT |ff| (CAR #9#) . #14#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (PROGN
                            (LETT #5# NIL . #14#)
                            (SEQ (LETT |i| 0 . #14#)
                                 (LETT #8# (SPADCALL |ff| (QREFELT $ 90))
                                       . #14#)
                                 G190 (COND ((|greater_SI| |i| #8#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (LETT |cc|
                                            (SPADCALL |ff| |i| (QREFELT $ 91))
                                            . #14#)
                                      (|spadConstant| $ 43) (QREFELT $ 92))
                                     (PROGN
                                      (LETT #7# (SPADCALL |cc| (QREFELT $ 93))
                                            . #14#)
                                      (COND (#5# (LETT #6# (+ #6# #7#) . #14#))
                                            ('T
                                             (PROGN
                                              (LETT #6# #7# . #14#)
                                              (LETT #5# 'T . #14#)))))))))
                                 (LETT |i| (|inc_SI| |i|) . #14#) (GO G190)
                                 G191 (EXIT NIL))
                            (COND (#5# #6#) ('T 0)))
                           . #14#)
                     (COND (#2# (LETT #3# (MAX #3# #4#) . #14#))
                           ('T
                            (PROGN
                             (LETT #3# #4# . #14#)
                             (LETT #2# 'T . #14#)))))))
                  (LETT #9# (CDR #9#) . #14#) (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#15# (|IdentityError| '|max|))))))))) 

(SDEFUN |INNMFACT;intChoose|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV) (|clc| R)
         (|plist| |List| P) (|ltry| |List| (|List| R))
         (|ufactor| |Mapping| #1=(|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Union|
          (|Record| (|:| |inval| (|List| (|List| R)))
                    (|:| |unvfact| (|List| (|SparseUnivariatePolynomial| R)))
                    (|:| |lu| R) (|:| |complead| (|List| R)))
          "failed"))
        (SPROG
         ((|nfatt| (|NonNegativeInteger|)) (|int| #2=(|List| R))
          (|leadcomp| #2#) (|lffc| (R))
          (|unifact| (|List| (|SparseUnivariatePolynomial| R))) (#3=#:G914 NIL)
          (|uf| NIL) (#4=#:G913 NIL) (|leadtest| (|Boolean|)) (#5=#:G912 NIL)
          (#6=#:G911 NIL) (#7=#:G896 NIL) (#8=#:G910 NIL) (#9=#:G909 NIL)
          (#10=#:G908 NIL) (#11=#:G907 NIL) (#12=#:G906 NIL) (|ff| NIL)
          (#13=#:G905 NIL) (#14=#:G904 NIL) (#15=#:G903 NIL)
          (|nf| (|NonNegativeInteger|)) (|lffc1| (R))
          (|lunivf|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|Integer|)))))
          (|luniv| #1#) (|range| (|NonNegativeInteger|))
          (|newm| (|SparseUnivariatePolynomial| R)) (#16=#:G868 NIL)
          (#17=#:G862 NIL) (#18=#:G861 #19=(|Boolean|)) (#20=#:G863 #19#)
          (#21=#:G902 NIL) (|epl| NIL) (|leadcomp1| #2#) (#22=#:G901 NIL)
          (|pol| NIL) (#23=#:G900 NIL) (|lval| (|List| R)) (#24=#:G899 NIL)
          (|i| NIL) (#25=#:G898 NIL) (#26=#:G897 NIL)
          (|newunifact| (|List| (|SparseUnivariatePolynomial| R)))
          (|testp| (|Boolean|)) (|ctf1| (R)) (|nvar1| (|NonNegativeInteger|))
          (|degum| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |degum| (SPADCALL |um| (QREFELT $ 52))
                  . #27=(|INNMFACT;intChoose|))
            (LETT |nvar1| (LENGTH |lvar|) . #27#) (LETT |range| 5 . #27#)
            (LETT |ctf1| (|spadConstant| $ 47) . #27#)
            (LETT |testp| (NULL (NULL |plist|)) . #27#)
            (LETT |leadcomp| (LETT |leadcomp1| NIL . #27#) . #27#)
            (LETT |nfatt| (+ |degum| 1) . #27#)
            (LETT |lffc| (|spadConstant| $ 47) . #27#)
            (LETT |lffc1| |lffc| . #27#) (LETT |newunifact| NIL . #27#)
            (LETT |leadtest| 'T . #27#) (LETT |int| NIL . #27#)
            (SEQ
             (EXIT
              (SEQ G190 (COND ((NULL 'T) (GO G191)))
                   (SEQ
                    (COND
                     (|testp|
                      (COND
                       ((SPADCALL (LENGTH |ltry|) 10 (QREFELT $ 46))
                        (EXIT
                         (PROGN
                          (LETT #26# (CONS 1 "failed") . #27#)
                          (GO #28=#:G895)))))))
                    (LETT |lval|
                          (PROGN
                           (LETT #25# NIL . #27#)
                           (SEQ (LETT |i| 1 . #27#) (LETT #24# |nvar1| . #27#)
                                G190 (COND ((|greater_SI| |i| #24#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #25#
                                        (CONS (SPADCALL |range| (QREFELT $ 95))
                                              #25#)
                                        . #27#)))
                                (LETT |i| (|inc_SI| |i|) . #27#) (GO G190) G191
                                (EXIT (NREVERSE #25#))))
                          . #27#)
                    (EXIT
                     (COND
                      ((SPADCALL |lval| |ltry| (QREFELT $ 98))
                       (LETT |range| (SPADCALL 2 |range| (QREFELT $ 99))
                             . #27#))
                      ('T
                       (SEQ (LETT |ltry| (CONS |lval| |ltry|) . #27#)
                            (LETT |leadcomp1|
                                  (PROGN
                                   (LETT #23# NIL . #27#)
                                   (SEQ (LETT |pol| NIL . #27#)
                                        (LETT #22# |plist| . #27#) G190
                                        (COND
                                         ((OR (ATOM #22#)
                                              (PROGN
                                               (LETT |pol| (CAR #22#) . #27#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #23#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |pol| |lvar| |lval|
                                                            (QREFELT $ 100))
                                                  (QREFELT $ 74))
                                                 #23#)
                                                . #27#)))
                                        (LETT #22# (CDR #22#) . #27#) (GO G190)
                                        G191 (EXIT (NREVERSE #23#))))
                                  . #27#)
                            (COND
                             (|testp|
                              (COND
                               ((PROGN
                                 (LETT #17# NIL . #27#)
                                 (SEQ (LETT |epl| NIL . #27#)
                                      (LETT #21# |leadcomp1| . #27#) G190
                                      (COND
                                       ((OR (ATOM #21#)
                                            (PROGN
                                             (LETT |epl| (CAR #21#) . #27#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #20#
                                               (SPADCALL |epl| (QREFELT $ 101))
                                               . #27#)
                                         (COND
                                          (#17#
                                           (LETT #18#
                                                 (COND (#18# 'T) ('T #20#))
                                                 . #27#))
                                          ('T
                                           (PROGN
                                            (LETT #18# #20# . #27#)
                                            (LETT #17# 'T . #27#)))))))
                                      (LETT #21# (CDR #21#) . #27#) (GO G190)
                                      G191 (EXIT NIL))
                                 (COND (#17# #18#) ('T NIL)))
                                (EXIT
                                 (LETT |range|
                                       (SPADCALL 2 |range| (QREFELT $ 99))
                                       . #27#))))))
                            (LETT |newm|
                                  (SPADCALL |um| |lvar| |lval| (QREFELT $ 102))
                                  . #27#)
                            (COND
                             ((OR
                               (SPADCALL |degum|
                                         (SPADCALL |newm| (QREFELT $ 90))
                                         (QREFELT $ 103))
                               (SPADCALL (SPADCALL |newm| (QREFELT $ 104)) 0
                                         (QREFELT $ 103)))
                              (EXIT
                               (LETT |range|
                                     (SPADCALL 2 |range| (QREFELT $ 99))
                                     . #27#))))
                            (LETT |lffc1| (SPADCALL |newm| (QREFELT $ 105))
                                  . #27#)
                            (LETT |newm|
                                  (PROG2
                                      (LETT #16#
                                            (SPADCALL |newm| |lffc1|
                                                      (QREFELT $ 106))
                                            . #27#)
                                      (QCDR #16#)
                                    (|check_union2| (QEQCAR #16# 0)
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 8))
                                                    (|Union|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 8))
                                                     "failed")
                                                    #16#))
                                  . #27#)
                            (COND
                             (|testp|
                              (COND
                               (|leadtest|
                                (COND
                                 ((NULL
                                   (SPADCALL
                                    (SPADCALL |lffc1| |clc| (QREFELT $ 72))
                                    (LENGTH |plist|) |leadcomp1|
                                    (QREFELT $ 108)))
                                  (EXIT
                                   (LETT |range|
                                         (SPADCALL 2 |range| (QREFELT $ 99))
                                         . #27#))))))))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (LIST |newm|
                                        (SPADCALL |newm| (QREFELT $ 109)))
                                  (QREFELT $ 111))
                                 (QREFELT $ 90))
                                0 (QREFELT $ 103))
                               (LETT |range|
                                     (SPADCALL 2 |range| (QREFELT $ 99))
                                     . #27#))
                              ('T
                               (SEQ
                                (LETT |luniv| (SPADCALL |newm| |ufactor|)
                                      . #27#)
                                (LETT |lunivf|
                                      (SPADCALL |luniv| (QREFELT $ 37)) . #27#)
                                (LETT |lffc1|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |luniv| (QREFELT $ 33))
                                        (QREFELT $ 34))
                                       |lffc1| (QREFELT $ 72))
                                      . #27#)
                                (LETT |nf| (LENGTH |lunivf|) . #27#)
                                (COND
                                 ((OR (EQL |nf| 0)
                                      (SPADCALL |nf| |nfatt| (QREFELT $ 46)))
                                  (EXIT "next values")))
                                (COND
                                 ((EQL |nf| 1)
                                  (SEQ (LETT |unifact| (LIST |newm|) . #27#)
                                       (EXIT
                                        (PROGN
                                         (LETT #7# |$NoValue| . #27#)
                                         (GO #29=#:G893))))))
                                (EXIT
                                 (COND
                                  ((EQL |nfatt| |nf|)
                                   (SEQ
                                    (COND
                                     (|leadtest|
                                      (SEQ
                                       (LETT |unifact|
                                             (PROGN
                                              (LETT #15# NIL . #27#)
                                              (SEQ (LETT |uf| NIL . #27#)
                                                   (LETT #14# |lunivf| . #27#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #14#)
                                                         (PROGN
                                                          (LETT |uf| (CAR #14#)
                                                                . #27#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #15#
                                                           (CONS (QCAR |uf|)
                                                                 #15#)
                                                           . #27#)))
                                                   (LETT #14# (CDR #14#)
                                                         . #27#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #15#))))
                                             . #27#)
                                       (LETT |int| |lval| . #27#)
                                       (LETT |lffc| |lffc1| . #27#)
                                       (EXIT
                                        (COND
                                         (|testp|
                                          (LETT |leadcomp| |leadcomp1|
                                                . #27#))))))
                                     ((SPADCALL
                                       (|INNMFACT;localNorm| |unifact| $)
                                       (|INNMFACT;localNorm|
                                        (PROGN
                                         (LETT #13# NIL . #27#)
                                         (SEQ (LETT |ff| NIL . #27#)
                                              (LETT #12# |lunivf| . #27#) G190
                                              (COND
                                               ((OR (ATOM #12#)
                                                    (PROGN
                                                     (LETT |ff| (CAR #12#)
                                                           . #27#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #13#
                                                      (CONS (QCAR |ff|) #13#)
                                                      . #27#)))
                                              (LETT #12# (CDR #12#) . #27#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #13#))))
                                        $)
                                       (QREFELT $ 112))
                                      (COND
                                       (|testp|
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |lffc1| |clc|
                                                     (QREFELT $ 72))
                                           (LENGTH |plist|) |leadcomp1|
                                           (QREFELT $ 108))
                                          (SEQ
                                           (LETT |unifact|
                                                 (PROGN
                                                  (LETT #11# NIL . #27#)
                                                  (SEQ (LETT |uf| NIL . #27#)
                                                       (LETT #10# |lunivf|
                                                             . #27#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #10#)
                                                             (PROGN
                                                              (LETT |uf|
                                                                    (CAR #10#)
                                                                    . #27#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #11#
                                                               (CONS
                                                                (QCAR |uf|)
                                                                #11#)
                                                               . #27#)))
                                                       (LETT #10# (CDR #10#)
                                                             . #27#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #11#))))
                                                 . #27#)
                                           (LETT |int| |lval| . #27#)
                                           (LETT |lffc| |lffc1| . #27#)
                                           (EXIT
                                            (COND
                                             (|testp|
                                              (LETT |leadcomp| |leadcomp1|
                                                    . #27#))))))))
                                       ('T
                                        (SEQ
                                         (LETT |unifact|
                                               (PROGN
                                                (LETT #9# NIL . #27#)
                                                (SEQ (LETT |uf| NIL . #27#)
                                                     (LETT #8# |lunivf| . #27#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #8#)
                                                           (PROGN
                                                            (LETT |uf|
                                                                  (CAR #8#)
                                                                  . #27#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #9#
                                                             (CONS (QCAR |uf|)
                                                                   #9#)
                                                             . #27#)))
                                                     (LETT #8# (CDR #8#)
                                                           . #27#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #9#))))
                                               . #27#)
                                         (LETT |int| |lval| . #27#)
                                         (LETT |lffc| |lffc1| . #27#)
                                         (EXIT
                                          (COND
                                           (|testp|
                                            (LETT |leadcomp| |leadcomp1|
                                                  . #27#)))))))))
                                    (EXIT
                                     (PROGN
                                      (LETT #7# |$NoValue| . #27#)
                                      (GO #29#)))))
                                  ((SPADCALL |nfatt| |degum| (QREFELT $ 46))
                                   (SEQ
                                    (LETT |unifact|
                                          (PROGN
                                           (LETT #6# NIL . #27#)
                                           (SEQ (LETT |uf| NIL . #27#)
                                                (LETT #5# |lunivf| . #27#) G190
                                                (COND
                                                 ((OR (ATOM #5#)
                                                      (PROGN
                                                       (LETT |uf| (CAR #5#)
                                                             . #27#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #6#
                                                        (CONS (QCAR |uf|) #6#)
                                                        . #27#)))
                                                (LETT #5# (CDR #5#) . #27#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #6#))))
                                          . #27#)
                                    (LETT |lffc| |lffc1| . #27#)
                                    (COND
                                     (|testp|
                                      (LETT |leadcomp| |leadcomp1| . #27#)))
                                    (LETT |int| |lval| . #27#)
                                    (LETT |leadtest| NIL . #27#)
                                    (EXIT (LETT |nfatt| |nf| . #27#))))
                                  ((SPADCALL |nfatt| |nf| (QREFELT $ 46))
                                   (SEQ
                                    (COND
                                     (|testp|
                                      (LETT |leadtest|
                                            (NULL
                                             (SPADCALL
                                              (SPADCALL |lffc| |clc|
                                                        (QREFELT $ 72))
                                              (LENGTH |plist|) |leadcomp|
                                              (QREFELT $ 108)))
                                            . #27#))
                                     ('T (LETT |leadtest| NIL . #27#)))
                                    (COND
                                     ((NULL |leadtest|)
                                      (SEQ
                                       (LETT |unifact|
                                             (PROGN
                                              (LETT #4# NIL . #27#)
                                              (SEQ (LETT |uf| NIL . #27#)
                                                   (LETT #3# |lunivf| . #27#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #3#)
                                                         (PROGN
                                                          (LETT |uf| (CAR #3#)
                                                                . #27#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #4#
                                                           (CONS (QCAR |uf|)
                                                                 #4#)
                                                           . #27#)))
                                                   (LETT #3# (CDR #3#) . #27#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #4#))))
                                             . #27#)
                                       (LETT |lffc| |lffc1| . #27#)
                                       (COND
                                        (|testp|
                                         (LETT |leadcomp| |leadcomp1| . #27#)))
                                       (EXIT (LETT |int| |lval| . #27#)))))
                                    (EXIT
                                     (LETT |nfatt| |nf| . #27#)))))))))))))))
                   NIL (GO G190) G191 (EXIT NIL)))
             #29# (EXIT #7#))
            (EXIT
             (CONS 0
                   (VECTOR (CONS |int| |ltry|) |unifact| |lffc| |leadcomp|)))))
          #28# (EXIT #26#)))) 

(SDEFUN |INNMFACT;simplify|
        ((|m| P) (|lvar| |List| OV) (|lmdeg| |List| (|NonNegativeInteger|))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))))
        (SPROG
         ((|flead|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))))
          (#1=#:G921 NIL)
          (|factorlist|
           (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))
          (|pol1| (P)) (|i| (|NonNegativeInteger|)) (#2=#:G928 NIL) (|x| NIL))
         (SEQ (LETT |factorlist| NIL . #3=(|INNMFACT;simplify|))
              (LETT |pol1| (|spadConstant| $ 48) . #3#)
              (SEQ (LETT |x| NIL . #3#) (LETT #2# |lvar| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |i|
                          (SPADCALL |lmdeg|
                                    (SPADCALL |x| |lvar| (QREFELT $ 113))
                                    (QREFELT $ 114))
                          . #3#)
                    (EXIT
                     (COND ((EQL |i| 0) "next value")
                           ('T
                            (SEQ
                             (LETT |pol1|
                                   (SPADCALL |pol1|
                                             (SPADCALL (|spadConstant| $ 48)
                                                       |x| |i| (QREFELT $ 115))
                                             (QREFELT $ 116))
                                   . #3#)
                             (EXIT
                              (LETT |factorlist|
                                    (CONS
                                     (CONS (SPADCALL |x| (QREFELT $ 117)) |i|)
                                     |factorlist|)
                                    . #3#)))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (PROG2
                        (LETT #1# (SPADCALL |m| |pol1| (QREFELT $ 118)) . #3#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                      (|Union| (QREFELT $ 9) "failed") #1#))
                    . #3#)
              (EXIT
               (COND
                ((SPADCALL |m| (QREFELT $ 69))
                 (CONS (SPADCALL |m| (QREFELT $ 74)) |factorlist|))
                ('T
                 (SEQ (LETT |flead| (|INNMFACT;mFactor| |m| |ufactor| $) . #3#)
                      (PROGN
                       (RPLACD |flead|
                               (SPADCALL |factorlist| (QCDR |flead|)
                                         (QREFELT $ 121)))
                       (QCDR |flead|))
                      (EXIT |flead|)))))))) 

(SDEFUN |INNMFACT;intfact|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         (|tleadpol| |Record| (|:| |contp| R)
          (|:| |factors|
               (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|))))))
         (|ltry| |List| (|List| R))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |List| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|factfin| (|List| (|SparseUnivariatePolynomial| P)))
          (#1=#:G1138 NIL) (|ff| NIL) (#2=#:G1137 NIL)
          (|ffin| (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|umd| (|SparseUnivariatePolynomial| P)) (#3=#:G1119 NIL)
          (|unifact| (|List| (|SparseUnivariatePolynomial| R)))
          (#4=#:G1136 NIL) (|unif| NIL) (#5=#:G1135 NIL) (|dd| (R))
          (|lpol| (|List| P))
          (|dist|
           (|Record| (|:| |polfac| (|List| P)) (|:| |correct| R)
                     (|:| |corrfact|
                          (|List| (|SparseUnivariatePolynomial| R)))))
          (#6=#:G1132 NIL)
          (|distf|
           (|Union|
            (|Record| (|:| |polfac| (|List| P)) (|:| |correct| R)
                      (|:| |corrfact|
                           (|List| (|SparseUnivariatePolynomial| R))))
            "failed"))
          (|leadval| (|List| R)) (|lval| (|List| R))
          (|nfact| (|NonNegativeInteger|))
          (|vfchoo|
           (|Record| (|:| |inval| (|List| (|List| R)))
                     (|:| |unvfact| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |lu| R) (|:| |complead| (|List| R))))
          (#7=#:G855 NIL)
          (|check|
           (|Union|
            (|Record| (|:| |inval| (|List| (|List| R)))
                      (|:| |unvfact| (|List| (|SparseUnivariatePolynomial| R)))
                      (|:| |lu| R) (|:| |complead| (|List| R)))
            #8="failed"))
          (|leadpol| (|List| P)) (#9=#:G1134 NIL) (#10=#:G1133 NIL)
          (|polcase| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |polcase| (NULL (NULL (QCDR |tleadpol|)))
                  . #11=(|INNMFACT;intfact|))
            (LETT |vfchoo|
                  (COND
                   (|polcase|
                    (SEQ
                     (LETT |leadpol|
                           (PROGN
                            (LETT #10# NIL . #11#)
                            (SEQ (LETT |ff| NIL . #11#)
                                 (LETT #9# (QCDR |tleadpol|) . #11#) G190
                                 (COND
                                  ((OR (ATOM #9#)
                                       (PROGN
                                        (LETT |ff| (CAR #9#) . #11#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #10# (CONS (QCAR |ff|) #10#) . #11#)))
                                 (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                                 (EXIT (NREVERSE #10#))))
                           . #11#)
                     (LETT |check|
                           (|INNMFACT;intChoose| |um| |lvar| (QCAR |tleadpol|)
                            |leadpol| |ltry| |ufactor| $)
                           . #11#)
                     (EXIT
                      (COND
                       ((QEQCAR |check| 1)
                        (PROGN
                         (LETT #6#
                               (|INNMFACT;monicMfpol| |um| |lvar| |ldeg|
                                |ufactor| $)
                               . #11#)
                         (GO #12=#:G1131)))
                       (#13='T (QCDR |check|))))))
                   (#13#
                    (PROG2
                        (LETT #7#
                              (|INNMFACT;intChoose| |um| |lvar|
                               (|spadConstant| $ 47) NIL NIL |ufactor| $)
                              . #11#)
                        (QCDR #7#)
                      (|check_union2| (QEQCAR #7# 0)
                                      (|Record|
                                       (|:| |inval|
                                            (|List| (|List| (QREFELT $ 8))))
                                       (|:| |unvfact|
                                            (|List|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 8))))
                                       (|:| |lu| (QREFELT $ 8))
                                       (|:| |complead| (|List| (QREFELT $ 8))))
                                      (|Union|
                                       (|Record|
                                        (|:| |inval|
                                             (|List| (|List| (QREFELT $ 8))))
                                        (|:| |unvfact|
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 8))))
                                        (|:| |lu| (QREFELT $ 8))
                                        (|:| |complead|
                                             (|List| (QREFELT $ 8))))
                                       #8#)
                                      #7#))))
                  . #11#)
            (LETT |unifact| (QVELT |vfchoo| 1) . #11#)
            (LETT |nfact| (LENGTH |unifact|) . #11#)
            (EXIT
             (COND ((EQL |nfact| 1) (LIST |um|))
                   (#13#
                    (SEQ (LETT |ltry| (QVELT |vfchoo| 0) . #11#)
                         (LETT |lval| (|SPADfirst| |ltry|) . #11#)
                         (LETT |dd| (QVELT |vfchoo| 2) . #11#)
                         (LETT |leadval| NIL . #11#) (LETT |lpol| NIL . #11#)
                         (COND
                          (|polcase|
                           (SEQ (LETT |leadval| (QVELT |vfchoo| 3) . #11#)
                                (LETT |distf|
                                      (SPADCALL (QVELT |vfchoo| 2) |unifact|
                                                |tleadpol| |leadval| |lvar|
                                                |lval| (QREFELT $ 126))
                                      . #11#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |distf| 1)
                                   (PROGN
                                    (LETT #6#
                                          (|INNMFACT;intfact| |um| |lvar|
                                           |ldeg| |tleadpol| |ltry| |ufactor|
                                           $)
                                          . #11#)
                                    (GO #12#)))
                                  (#13#
                                   (SEQ (LETT |dist| (QCDR |distf|) . #11#)
                                        (LETT |lpol| (QVELT |dist| 0) . #11#)
                                        (LETT |dd| (QVELT |dist| 1) . #11#)
                                        (EXIT
                                         (LETT |unifact| (QVELT |dist| 2)
                                               . #11#)))))))))
                         (COND
                          ((SPADCALL |dd| (|spadConstant| $ 47) (QREFELT $ 92))
                           (SEQ
                            (LETT |unifact|
                                  (PROGN
                                   (LETT #5# NIL . #11#)
                                   (SEQ (LETT |unif| NIL . #11#)
                                        (LETT #4# |unifact| . #11#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |unif| (CAR #4#) . #11#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |dd| |unif|
                                                           (QREFELT $ 127))
                                                 #5#)
                                                . #11#)))
                                        (LETT #4# (CDR #4#) . #11#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  . #11#)
                            (EXIT
                             (LETT |umd|
                                   (SPADCALL
                                    (SPADCALL
                                     (QVELT (SPADCALL |dd| (QREFELT $ 128)) 0)
                                     (SPADCALL
                                      (SPADCALL |dd|
                                                (PROG1
                                                    (LETT #3# (- |nfact| 1)
                                                          . #11#)
                                                  (|check_subtype2| (>= #3# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #3#))
                                                (QREFELT $ 71))
                                      (QREFELT $ 38))
                                     (QREFELT $ 66))
                                    |um| (QREFELT $ 129))
                                   . #11#))))
                          (#13# (LETT |umd| |um| . #11#)))
                         (LETT |ffin|
                               (SPADCALL |umd| |lvar| |unifact| |lval| |lpol|
                                         |ldeg| (QREFELT $ 16) (QREFELT $ 132))
                               . #11#)
                         (EXIT
                          (COND
                           ((QEQCAR |ffin| 1)
                            (|INNMFACT;intfact| |um| |lvar| |ldeg| |tleadpol|
                             |ltry| |ufactor| $))
                           (#13#
                            (SEQ (LETT |factfin| (QCDR |ffin|) . #11#)
                                 (COND
                                  ((SPADCALL |dd| (|spadConstant| $ 47)
                                             (QREFELT $ 92))
                                   (LETT |factfin|
                                         (PROGN
                                          (LETT #2# NIL . #11#)
                                          (SEQ (LETT |ff| NIL . #11#)
                                               (LETT #1# |factfin| . #11#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |ff| (CAR #1#)
                                                            . #11#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (SPADCALL |ff|
                                                                  (QREFELT $
                                                                           133))
                                                        #2#)
                                                       . #11#)))
                                               (LETT #1# (CDR #1#) . #11#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#))))
                                         . #11#)))
                                 (EXIT |factfin|)))))))))))
          #12# (EXIT #6#)))) 

(SDEFUN |INNMFACT;mfconst|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |List| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((#1=#:G1150 NIL) (|uf| NIL) (#2=#:G1149 NIL)
          (|lum|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|Integer|)))))
          (|factfin| (|List| (|SparseUnivariatePolynomial| P))))
         (SEQ (LETT |factfin| NIL . #3=(|INNMFACT;mfconst|))
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ
                  (LETT |lum|
                        (SPADCALL
                         (SPADCALL (SPADCALL (ELT $ 27) |um| (QREFELT $ 31))
                                   |ufactor|)
                         (QREFELT $ 37))
                        . #3#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |uf| NIL . #3#) (LETT #1# |lum| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |uf| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL (ELT $ 38) (QCAR |uf|)
                                            (QREFELT $ 41))
                                  #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))
                ('T
                 (|INNMFACT;intfact| |um| |lvar| |ldeg|
                  (CONS (|spadConstant| $ 43) NIL) NIL |ufactor| $))))))) 

(SDEFUN |INNMFACT;monicize|
        ((|um| |SparseUnivariatePolynomial| P) (|c| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|ans| (|SparseUnivariatePolynomial| P)) (|prod| (P))
          (#1=#:G1153 NIL) (|n| #2=(|NonNegativeInteger|)) (|lc| (P)) (|i| #2#)
          (#3=#:G1151 NIL))
         (SEQ
          (LETT |n| (SPADCALL |um| (QREFELT $ 52)) . #4=(|INNMFACT;monicize|))
          (LETT |ans| (SPADCALL (|spadConstant| $ 48) |n| (QREFELT $ 49))
                . #4#)
          (LETT |n|
                (PROG1 (LETT #3# (- |n| 1) . #4#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #4#)
          (LETT |prod| (|spadConstant| $ 48) . #4#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |um| (SPADCALL |um| (QREFELT $ 134)) . #4#)
                            (|spadConstant| $ 135) (QREFELT $ 136)))
                 (GO G191)))
               (SEQ (LETT |i| (SPADCALL |um| (QREFELT $ 52)) . #4#)
                    (LETT |lc| (SPADCALL |um| (QREFELT $ 68)) . #4#)
                    (LETT |prod|
                          (SPADCALL |prod|
                                    (SPADCALL |c|
                                              (PROG1
                                                  (LETT #1#
                                                        (- |n|
                                                           (LETT |n| |i|
                                                                 . #4#))
                                                        . #4#)
                                                (|check_subtype2| (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #1#))
                                              (QREFELT $ 137))
                                    (QREFELT $ 116))
                          . #4#)
                    (EXIT
                     (LETT |ans|
                           (SPADCALL |ans|
                                     (SPADCALL
                                      (SPADCALL |prod| |lc| (QREFELT $ 116))
                                      |i| (QREFELT $ 49))
                                     (QREFELT $ 138))
                           . #4#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |INNMFACT;unmonicize|
        ((|m| |SparseUnivariatePolynomial| P) (|c| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPADCALL
         (SPADCALL |m| (SPADCALL |c| 1 (QREFELT $ 49)) (QREFELT $ 139))
         (QREFELT $ 133))) 

(SDEFUN |INNMFACT;monicMfpol|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |List| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|nldeg| (|List| (|NonNegativeInteger|)))
          (|monpol| (|SparseUnivariatePolynomial| P)) (|l| (P)))
         (SEQ
          (LETT |l| (SPADCALL |um| (QREFELT $ 68))
                . #1=(|INNMFACT;monicMfpol|))
          (LETT |monpol| (|INNMFACT;monicize| |um| |l| $) . #1#)
          (LETT |nldeg| (SPADCALL |monpol| |lvar| (QREFELT $ 140)) . #1#)
          (EXIT
           (SPADCALL (CONS #'|INNMFACT;monicMfpol!0| (VECTOR $ |l|))
                     (|INNMFACT;mfconst| |monpol| |lvar| |nldeg| |ufactor| $)
                     (QREFELT $ 143)))))) 

(SDEFUN |INNMFACT;monicMfpol!0| ((|z1| NIL) ($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1) . #1=(|INNMFACT;monicMfpol|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INNMFACT;unmonicize| |z1| |l| $))))) 

(SDEFUN |INNMFACT;mfpol|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |List| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|tleadpol|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P)
                                     (|:| |pow| (|Integer|))))))))
         (SEQ
          (COND
           ((|HasCategory| (QREFELT $ 8) '(|Field|))
            (|INNMFACT;monicMfpol| |um| |lvar| |ldeg| |ufactor| $))
           ('T
            (SEQ
             (LETT |tleadpol|
                   (|INNMFACT;mFactor| (SPADCALL |um| (QREFELT $ 68)) |ufactor|
                    $)
                   |INNMFACT;mfpol|)
             (EXIT
              (|INNMFACT;intfact| |um| |lvar| |ldeg| |tleadpol| NIL |ufactor|
               $)))))))) 

(SDEFUN |INNMFACT;mFactor|
        ((|m| P)
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))))
        (SPROG
         ((#1=#:G1216 NIL) (|lcfacs| (R)) (#2=#:G1211 NIL) (#3=#:G1210 (R))
          (#4=#:G1212 (R)) (#5=#:G1214 NIL) (#6=#:G1228 NIL) (|f| NIL)
          (|factorlist|
           (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))
          (|auxfl|
           (|List| #7=(|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))
          (#8=#:G1227 NIL) (|lfp| NIL) (#9=#:G1226 NIL)
          (|lf| (|List| (|SparseUnivariatePolynomial| P)))
          (|um| (|SparseUnivariatePolynomial| P))
          (|ldeg| (|List| (|NonNegativeInteger|))) (#10=#:G1225 NIL)
          (|lcterm| NIL) (|ffactor| (P)) (#11=#:G1193 NIL) (|pc| (P))
          (|lvar| (|List| OV)) (|x| (OV))
          (|varch|
           (|Record| (|:| |npol| (|SparseUnivariatePolynomial| P))
                     (|:| |nvar| (|List| OV))
                     (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
          (#12=#:G1224 NIL) (#13=#:G1181 NIL) (|lcont| (P))
          (|ffexp| #14=(|Integer|)) (#15=#:G1223 NIL) (|fact| NIL)
          (|sqqfact|
           (|List| (|Record| (|:| |factor| P) (|:| |exponent| #14#))))
          (|flead| (|Record| (|:| |contp| R) (|:| |factors| (|List| #7#))))
          (|sqfacs| (|Factored| P)) (#16=#:G1170 NIL)
          (#17=#:G1169 #18=(|Boolean|)) (#19=#:G1171 #18#) (#20=#:G1222 NIL)
          (|n| NIL) (|lmdeg| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL |m| (QREFELT $ 69))
            (CONS (SPADCALL |m| (QREFELT $ 74)) NIL))
           (#21='T
            (SEQ
             (LETT |lvar| (SPADCALL |m| (QREFELT $ 25))
                   . #22=(|INNMFACT;mFactor|))
             (LETT |flead| (CONS (|spadConstant| $ 43) NIL) . #22#)
             (LETT |factorlist| NIL . #22#)
             (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT $ 144)) . #22#)
             (EXIT
              (COND
               ((PROGN
                 (LETT #16# NIL . #22#)
                 (SEQ (LETT |n| NIL . #22#) (LETT #20# |lmdeg| . #22#) G190
                      (COND
                       ((OR (ATOM #20#)
                            (PROGN (LETT |n| (CAR #20#) . #22#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #19# (SPADCALL |n| 0 (QREFELT $ 46)) . #22#)
                         (COND
                          (#16# (LETT #17# (COND (#17# 'T) ('T #19#)) . #22#))
                          ('T
                           (PROGN
                            (LETT #17# #19# . #22#)
                            (LETT #16# 'T . #22#)))))))
                      (LETT #20# (CDR #20#) . #22#) (GO G190) G191 (EXIT NIL))
                 (COND (#16# #17#) (#21# NIL)))
                (|INNMFACT;simplify| |m| |lvar| |lmdeg| |ufactor| $))
               (#21#
                (SEQ (LETT |sqfacs| (SPADCALL |m| (QREFELT $ 146)) . #22#)
                     (LETT |lcont| (SPADCALL |sqfacs| (QREFELT $ 148)) . #22#)
                     (COND
                      ((SPADCALL |lcont| (QREFELT $ 69))
                       (PROGN
                        (RPLACA |flead| (SPADCALL |lcont| (QREFELT $ 74)))
                        (QCAR |flead|)))
                      (#21#
                       (LETT |flead| (|INNMFACT;mFactor| |lcont| |ufactor| $)
                             . #22#)))
                     (LETT |factorlist| (QCDR |flead|) . #22#)
                     (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT $ 151))
                           . #22#)
                     (SEQ (LETT |fact| NIL . #22#) (LETT #15# |sqqfact| . #22#)
                          G190
                          (COND
                           ((OR (ATOM #15#)
                                (PROGN (LETT |fact| (CAR #15#) . #22#) NIL))
                            (GO G191)))
                          (SEQ (LETT |ffactor| (QCAR |fact|) . #22#)
                               (LETT |ffexp| (QCDR |fact|) . #22#)
                               (LETT |lvar| (SPADCALL |ffactor| (QREFELT $ 25))
                                     . #22#)
                               (LETT |x| (|SPADfirst| |lvar|) . #22#)
                               (LETT |ldeg|
                                     (SPADCALL |ffactor| |lvar|
                                               (QREFELT $ 152))
                                     . #22#)
                               (EXIT
                                (COND
                                 ((SPADCALL 1 |ldeg| (QREFELT $ 154))
                                  (SEQ
                                   (LETT |x|
                                         (SPADCALL |lvar|
                                                   (SPADCALL 1 |ldeg|
                                                             (QREFELT $ 85))
                                                   (QREFELT $ 86))
                                         . #22#)
                                   (LETT |lcont|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |ffactor| |x|
                                                     (QREFELT $ 83))
                                           (QREFELT $ 23))
                                          (QREFELT $ 155))
                                         . #22#)
                                   (LETT |ffactor|
                                         (PROG2
                                             (LETT #13#
                                                   (SPADCALL |ffactor| |lcont|
                                                             (QREFELT $ 118))
                                                   . #22#)
                                             (QCDR #13#)
                                           (|check_union2| (QEQCAR #13# 0)
                                                           (QREFELT $ 9)
                                                           (|Union|
                                                            (QREFELT $ 9)
                                                            #23="failed")
                                                           #13#))
                                         . #22#)
                                   (LETT |factorlist|
                                         (CONS (CONS |ffactor| |ffexp|)
                                               |factorlist|)
                                         . #22#)
                                   (EXIT
                                    (SEQ (LETT |lcterm| NIL . #22#)
                                         (LETT #12#
                                               (QCDR
                                                (|INNMFACT;mFactor| |lcont|
                                                 |ufactor| $))
                                               . #22#)
                                         G190
                                         (COND
                                          ((OR (ATOM #12#)
                                               (PROGN
                                                (LETT |lcterm| (CAR #12#)
                                                      . #22#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |factorlist|
                                                 (CONS
                                                  (CONS (QCAR |lcterm|)
                                                        (* (QCDR |lcterm|)
                                                           |ffexp|))
                                                  |factorlist|)
                                                 . #22#)))
                                         (LETT #12# (CDR #12#) . #22#)
                                         (GO G190) G191 (EXIT NIL)))))
                                 ('T
                                  (SEQ
                                   (LETT |varch|
                                         (|INNMFACT;varChoose| |ffactor| |lvar|
                                          |ldeg| $)
                                         . #22#)
                                   (LETT |um| (QVELT |varch| 0) . #22#)
                                   (LETT |x| (|SPADfirst| |lvar|) . #22#)
                                   (LETT |ldeg| (CDR |ldeg|) . #22#)
                                   (LETT |lvar| (CDR |lvar|) . #22#)
                                   (COND
                                    ((SPADCALL (|SPADfirst| (QVELT |varch| 1))
                                               |x| (QREFELT $ 156))
                                     (SEQ
                                      (LETT |lvar| (QVELT |varch| 1) . #22#)
                                      (LETT |x| (|SPADfirst| |lvar|) . #22#)
                                      (EXIT
                                       (LETT |lvar| (CDR |lvar|) . #22#)))))
                                   (LETT |pc|
                                         (SPADCALL
                                          (SPADCALL |um| (QREFELT $ 23))
                                          (QREFELT $ 155))
                                         . #22#)
                                   (COND
                                    ((SPADCALL |pc| (|spadConstant| $ 48)
                                               (QREFELT $ 157))
                                     (SEQ
                                      (LETT |um|
                                            (PROG2
                                                (LETT #11#
                                                      (SPADCALL |um| |pc|
                                                                (QREFELT $
                                                                         158))
                                                      . #22#)
                                                (QCDR #11#)
                                              (|check_union2| (QEQCAR #11# 0)
                                                              (|SparseUnivariatePolynomial|
                                                               (QREFELT $ 9))
                                                              (|Union|
                                                               (|SparseUnivariatePolynomial|
                                                                (QREFELT $ 9))
                                                               "failed")
                                                              #11#))
                                            . #22#)
                                      (LETT |ffactor|
                                            (SPADCALL |um| |x| (QREFELT $ 159))
                                            . #22#)
                                      (EXIT
                                       (SEQ (LETT |lcterm| NIL . #22#)
                                            (LETT #10#
                                                  (QCDR
                                                   (|INNMFACT;mFactor| |pc|
                                                    |ufactor| $))
                                                  . #22#)
                                            G190
                                            (COND
                                             ((OR (ATOM #10#)
                                                  (PROGN
                                                   (LETT |lcterm| (CAR #10#)
                                                         . #22#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |factorlist|
                                                    (CONS
                                                     (CONS (QCAR |lcterm|)
                                                           (* (QCDR |lcterm|)
                                                              |ffexp|))
                                                     |factorlist|)
                                                    . #22#)))
                                            (LETT #10# (CDR #10#) . #22#)
                                            (GO G190) G191 (EXIT NIL))))))
                                   (LETT |ldeg|
                                         (SPADCALL |ffactor| |lvar|
                                                   (QREFELT $ 152))
                                         . #22#)
                                   (LETT |um| (SPADCALL |um| (QREFELT $ 160))
                                         . #22#)
                                   (COND
                                    ((SPADCALL (SPADCALL |um| (QREFELT $ 68))
                                               (QREFELT $ 69))
                                     (LETT |lf|
                                           (|INNMFACT;mfconst| |um| |lvar|
                                            |ldeg| |ufactor| $)
                                           . #22#))
                                    ('T
                                     (LETT |lf|
                                           (|INNMFACT;mfpol| |um| |lvar| |ldeg|
                                            |ufactor| $)
                                           . #22#)))
                                   (LETT |auxfl|
                                         (PROGN
                                          (LETT #9# NIL . #22#)
                                          (SEQ (LETT |lfp| NIL . #22#)
                                               (LETT #8# |lf| . #22#) G190
                                               (COND
                                                ((OR (ATOM #8#)
                                                     (PROGN
                                                      (LETT |lfp| (CAR #8#)
                                                            . #22#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #9#
                                                       (CONS
                                                        (CONS
                                                         (SPADCALL
                                                          (SPADCALL |lfp| |x|
                                                                    (QREFELT $
                                                                             159))
                                                          (QREFELT $ 161))
                                                         |ffexp|)
                                                        #9#)
                                                       . #22#)))
                                               (LETT #8# (CDR #8#) . #22#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #9#))))
                                         . #22#)
                                   (EXIT
                                    (LETT |factorlist|
                                          (SPADCALL |factorlist| |auxfl|
                                                    (QREFELT $ 121))
                                          . #22#)))))))
                          (LETT #15# (CDR #15#) . #22#) (GO G190) G191
                          (EXIT NIL))
                     (LETT |lcfacs|
                           (PROGN
                            (LETT #2# NIL . #22#)
                            (SEQ (LETT |f| NIL . #22#)
                                 (LETT #6# |factorlist| . #22#) G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN (LETT |f| (CAR #6#) . #22#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (SPADCALL
                                           (SPADCALL (QCAR |f|) (QREFELT $ 70))
                                           (PROG1 (LETT #5# (QCDR |f|) . #22#)
                                             (|check_subtype2| (>= #5# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #5#))
                                           (QREFELT $ 71))
                                          . #22#)
                                    (COND
                                     (#2#
                                      (LETT #3#
                                            (SPADCALL #3# #4# (QREFELT $ 72))
                                            . #22#))
                                     ('T
                                      (PROGN
                                       (LETT #3# #4# . #22#)
                                       (LETT #2# 'T . #22#)))))))
                                 (LETT #6# (CDR #6#) . #22#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#2# #3#) (#21# (|spadConstant| $ 47))))
                           . #22#)
                     (EXIT
                      (CONS
                       (PROG2
                           (LETT #1#
                                 (SPADCALL (SPADCALL |m| (QREFELT $ 70))
                                           |lcfacs| (QREFELT $ 75))
                                 . #22#)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 8)
                                         (|Union| (QREFELT $ 8) #23#) #1#))
                       |factorlist|)))))))))))) 

(SDEFUN |INNMFACT;factor;PMF;15|
        ((|m| P)
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Factored| P))
        (SPROG
         ((#1=#:G1232 NIL) (#2=#:G1231 #3=(|Factored| P)) (#4=#:G1233 #3#)
          (#5=#:G1236 NIL) (|u| NIL)
          (|flist|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P)
                                     (|:| |pow| (|Integer|))))))))
         (SEQ
          (LETT |flist| (|INNMFACT;mFactor| |m| |ufactor| $)
                . #6=(|INNMFACT;factor;PMF;15|))
          (EXIT
           (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 38))
                     (PROGN
                      (LETT #1# NIL . #6#)
                      (SEQ (LETT |u| NIL . #6#) (LETT #5# (QCDR |flist|) . #6#)
                           G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (SPADCALL (QCAR |u|) (QCDR |u|)
                                              (QREFELT $ 162))
                                    . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #4# (QREFELT $ 163))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 164))))
                     (QREFELT $ 165)))))) 

(DECLAIM (NOTINLINE |InnerMultFact;|)) 

(DEFUN |InnerMultFact| (&REST #1=#:G1237)
  (SPROG NIL
         (PROG (#2=#:G1238)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerMultFact|)
                                               '|domainEqualList|)
                    . #3=(|InnerMultFact|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerMultFact;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|InnerMultFact|)))))))))) 

(DEFUN |InnerMultFact;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerMultFact|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|InnerMultFact| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 167) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|InnerMultFact| (LIST DV$1 DV$2 DV$3 DV$4)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 16
              (SPADCALL (SPADCALL (EXPT 2 26) (QREFELT $ 14)) (QREFELT $ 15)))
    $))) 

(MAKEPROP '|InnerMultFact| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|PositiveInteger|) (0 . ^)
              (|Integer|) (|IntegerPrimesPackage| 12) (6 . |prevPrime|)
              (11 . |coerce|) '|pmod| (|SparseUnivariatePolynomial| 9)
              (16 . |coerce|) (|Boolean|) (21 . |ground?|) (26 . |ground|)
              (|List| 9) (31 . |coefficients|) (|List| 6) (36 . |variables|)
              (41 . |setUnion|) (47 . |ground|)
              (|SparseUnivariatePolynomial| 8) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 17 8 28) (52 . |map|)
              (|Factored| 28) (58 . |unit|) (63 . |retract|)
              (|Record| (|:| |factor| 28) (|:| |exponent| 12)) (|List| 35)
              (68 . |factors|) (73 . |coerce|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 28 9 17) (78 . |map|)
              (84 . |Zero|) (88 . |Zero|) (|NonNegativeInteger|)
              (92 . |minimumDegree|) (97 . >) (103 . |One|) (107 . |One|)
              (111 . |monomial|) (|Union| $ '"failed") (117 . |exquo|)
              (123 . |degree|) (|Record| (|:| |irr| 17) (|:| |pow| 12))
              (|List| 53) (128 . |append|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (134 . |unitNormal|) (|Factored| 17)
              (|MultivariateSquareFree| 7 6 8 9) (139 . |squareFree|)
              (144 . |unit|) (149 . *)
              (|Record| (|:| |factor| 17) (|:| |exponent| 12)) (|List| 63)
              (155 . |factors|) (160 . *) (166 . |degree|)
              (172 . |leadingCoefficient|) (177 . |ground?|)
              (182 . |leadingCoefficient|) (187 . ^) (193 . *)
              (199 . |retract|) (204 . |retract|) (209 . |exquo|)
              (215 . |primeFactor|) (221 . *) (227 . |One|) (231 . *)
              (|Mapping| 32 28) |INNMFACT;factor;SupMF;3|
              (|SparseUnivariatePolynomial| $) (237 . |univariate|) (|List| 44)
              (243 . |position|) (249 . |elt|) (255 . |delete|)
              (261 . |delete|) (267 . |numberOfMonomials|) (272 . |degree|)
              (277 . |coefficient|) (283 . ~=) (289 . |euclideanSize|)
              (|FactoringUtilities| 7 6 8 9) (294 . |ran|) (|List| 8)
              (|List| 96) (299 . |member?|) (305 . *) (311 . |eval|)
              (318 . |unit?|) (323 . |completeEval|) (330 . ~=)
              (336 . |minimumDegree|) (341 . |content|) (346 . |exquo|)
              (|LeadingCoefDetermination| 6 7 8 9) (352 . |polCase|)
              (359 . |differentiate|) (|List| $) (364 . |gcd|) (369 . >)
              (375 . |position|) (381 . |elt|) (387 . |monomial|) (394 . *)
              (400 . |coerce|) (405 . |exquo|)
              (|Record| (|:| |irr| 9) (|:| |pow| 12)) (|List| 119)
              (411 . |append|)
              (|Record| (|:| |polfac| 22) (|:| |correct| 8)
                        (|:| |corrfact| 124))
              (|Union| 122 '"failed") (|List| 28)
              (|Record| (|:| |contp| 8) (|:| |factors| 120)) (417 . |distFact|)
              (427 . *) (433 . |unitNormal|) (438 . *) (|Union| 142 '"failed")
              (|MultivariateLifting| 7 6 8 9) (444 . |lifting|)
              (455 . |primitivePart|) (460 . |reductum|) (465 . |Zero|)
              (469 . ~=) (475 . ^) (481 . +) (487 . |elt|) (493 . |degree|)
              (|Mapping| 17 17) (|List| 17) (499 . |map|)
              (505 . |minimumDegree|) (|Factored| $) (511 . |squareFree|)
              (|Factored| 9) (516 . |unit|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 12)) (|List| 149)
              (521 . |factors|) (526 . |degree|) (532 . |One|)
              (536 . |member?|) (542 . |gcd|) (547 . ~=) (553 . ~=)
              (559 . |exquo|) (565 . |multivariate|) (571 . |unitCanonical|)
              (576 . |unitCanonical|) (581 . |primeFactor|) (587 . *)
              (593 . |One|) (597 . *) |INNMFACT;factor;PMF;15|)
           '#(|factor| 603) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 166
                                                 '(2 10 0 0 10 11 1 13 12 12 14
                                                   1 8 0 12 15 1 17 0 9 18 1 17
                                                   19 0 20 1 17 9 0 21 1 17 22
                                                   0 23 1 9 24 0 25 2 24 0 0 0
                                                   26 1 9 8 0 27 2 30 28 29 17
                                                   31 1 32 28 0 33 1 28 8 0 34
                                                   1 32 36 0 37 1 9 0 8 38 2 40
                                                   17 39 28 41 0 7 0 42 0 8 0
                                                   43 1 17 44 0 45 2 44 19 0 0
                                                   46 0 8 0 47 0 9 0 48 2 17 0
                                                   9 44 49 2 17 50 0 0 51 1 17
                                                   44 0 52 2 54 0 0 0 55 1 17
                                                   56 0 57 1 59 58 17 60 1 58
                                                   17 0 61 2 17 0 0 0 62 1 58
                                                   64 0 65 2 9 0 8 0 66 2 9 44
                                                   0 6 67 1 17 9 0 68 1 9 19 0
                                                   69 1 9 8 0 70 2 8 0 0 44 71
                                                   2 8 0 0 0 72 1 17 9 0 73 1 9
                                                   8 0 74 2 8 50 0 0 75 2 58 0
                                                   17 12 76 2 58 0 0 0 77 0 58
                                                   0 78 2 58 0 17 0 79 2 9 82 0
                                                   6 83 2 84 12 44 0 85 2 24 6
                                                   0 12 86 2 84 0 0 12 87 2 24
                                                   0 0 12 88 1 28 44 0 89 1 28
                                                   44 0 90 2 28 8 0 44 91 2 8
                                                   19 0 0 92 1 8 44 0 93 1 94 8
                                                   12 95 2 97 19 96 0 98 2 44 0
                                                   10 0 99 3 9 0 0 24 96 100 1
                                                   8 19 0 101 3 94 28 17 24 96
                                                   102 2 44 19 0 0 103 1 28 44
                                                   0 104 1 28 8 0 105 2 28 50 0
                                                   8 106 3 107 19 8 44 96 108 1
                                                   28 0 0 109 1 28 0 110 111 2
                                                   12 19 0 0 112 2 24 12 6 0
                                                   113 2 84 44 0 12 114 3 9 0 0
                                                   6 44 115 2 9 0 0 0 116 1 9 0
                                                   6 117 2 9 50 0 0 118 2 120 0
                                                   0 0 121 6 107 123 8 124 125
                                                   96 24 96 126 2 28 0 8 0 127
                                                   1 8 56 0 128 2 17 0 9 0 129
                                                   7 131 130 17 24 124 96 22 84
                                                   8 132 1 17 0 0 133 1 17 0 0
                                                   134 0 17 0 135 2 17 19 0 0
                                                   136 2 9 0 0 44 137 2 17 0 0
                                                   0 138 2 17 0 0 0 139 2 94 84
                                                   17 24 140 2 142 0 141 0 143
                                                   2 9 84 0 24 144 1 9 145 0
                                                   146 1 147 9 0 148 1 147 150
                                                   0 151 2 9 84 0 24 152 0 17 0
                                                   153 2 84 19 44 0 154 1 9 0
                                                   110 155 2 6 19 0 0 156 2 9
                                                   19 0 0 157 2 17 50 0 9 158 2
                                                   9 0 82 6 159 1 17 0 0 160 1
                                                   9 0 0 161 2 147 0 9 12 162 2
                                                   147 0 0 0 163 0 147 0 164 2
                                                   147 0 9 0 165 2 0 58 17 80
                                                   81 2 0 147 9 80 166)))))
           '|lookupComplete|)) 
