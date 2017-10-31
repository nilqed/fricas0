
(SDEFUN |SYSSOLP;makeR2F| ((|r| R) ($ |Fraction| (|Polynomial| R)))
        (SPADCALL (SPADCALL |r| (QREFELT $ 8)) (QREFELT $ 10))) 

(SDEFUN |SYSSOLP;makeP2F|
        ((|p| |Polynomial| (|Fraction| (|Polynomial| R)))
         ($ |Fraction| (|Polynomial| R)))
        (SPROG ((#1=#:G727 NIL) (|v| NIL) (|lv| (|List| (|Symbol|))))
               (SEQ
                (LETT |lv| (SPADCALL |p| (QREFELT $ 13))
                      . #2=(|SYSSOLP;makeP2F|))
                (EXIT
                 (COND
                  ((SPADCALL |lv| NIL (QREFELT $ 15))
                   (SPADCALL |p| (QREFELT $ 16)))
                  ('T
                   (SEQ
                    (SEQ (LETT |v| NIL . #2#) (LETT #1# |lv| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |v| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |p| (SPADCALL |p| |v| (QREFELT $ 19)) . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |p| (QREFELT $ 16)))))))))) 

(SDEFUN |SYSSOLP;makeEq|
        ((|p| |Polynomial| (|Fraction| (|Polynomial| R)))
         (|lv| |List| (|Symbol|)) ($ |Equation| (|Fraction| (|Polynomial| R))))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| (|Polynomial| R)))
          (#1=#:G735 NIL) (#2=#:G736 NIL) (|x| NIL) (|lx| (|List| (|Symbol|)))
          (|np| (|Polynomial| R)) (|z| (|Symbol|)))
         (SEQ (LETT |z| (SPADCALL |lv| (QREFELT $ 20)) . #3=(|SYSSOLP;makeEq|))
              (LETT |np| (SPADCALL (|SYSSOLP;makeP2F| |p| $) (QREFELT $ 21))
                    . #3#)
              (LETT |lx| (SPADCALL |np| (QREFELT $ 22)) . #3#)
              (SEQ
               (EXIT
                (SEQ (LETT |x| NIL . #3#) (LETT #2# |lv| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| |lx| (QREFELT $ 23))
                         (PROGN (LETT #1# |$NoValue| . #3#) (GO #4=#:G731))))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL)))
               #4# (EXIT #1#))
              (LETT |up| (SPADCALL |np| |x| (QREFELT $ 25)) . #3#)
              (EXIT
               (COND
                ((EQL (SPADCALL |up| (QREFELT $ 28)) 1)
                 (SPADCALL
                  (SPADCALL (SPADCALL |x| (QREFELT $ 30)) (QREFELT $ 10))
                  (SPADCALL
                   (SPADCALL (SPADCALL |up| 0 (QREFELT $ 33))
                             (SPADCALL |up| (QREFELT $ 34)) (QREFELT $ 35))
                   (QREFELT $ 36))
                  (QREFELT $ 38)))
                ('T
                 (SPADCALL (SPADCALL |np| (QREFELT $ 10)) (|spadConstant| $ 32)
                           (QREFELT $ 38)))))))) 

(SDEFUN |SYSSOLP;varInF| ((|v| |Symbol|) ($ |Fraction| (|Polynomial| R)))
        (SPADCALL (SPADCALL |v| (QREFELT $ 30)) (QREFELT $ 10))) 

(SDEFUN |SYSSOLP;newInF| ((|n| |Integer|) ($ |Fraction| (|Polynomial| R)))
        (|SYSSOLP;varInF| (SPADCALL (QREFELT $ 39)) $)) 

(SDEFUN |SYSSOLP;testDegree|
        ((|f| |Polynomial| R) (|lv| |List| (|Symbol|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G747 NIL) (#2=#:G746 #3=(|Boolean|)) (#4=#:G748 #3#)
          (#5=#:G750 NIL) (|vv| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|SYSSOLP;testDegree|))
           (SEQ (LETT |vv| NIL . #6#) (LETT #5# |lv| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |vv| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (SPADCALL |f| |vv| (QREFELT $ 40)) 0
                                   (QREFELT $ 41))
                         . #6#)
                   (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#)) . #6#))
                         ('T
                          (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T NIL)))))) 

(SDEFUN |SYSSOLP;triangularSystems;LLL;7|
        ((|lf| |List| (|Fraction| (|Polynomial| R))) (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Polynomial| R))))
        (SPROG
         ((#1=#:G798 NIL) (|pf| NIL) (#2=#:G797 NIL) (#3=#:G796 NIL) (|pr| NIL)
          (#4=#:G795 NIL)
          (|parRes|
           (|List|
            (|List|
             (|DistributedMultivariatePolynomial| |lv| (|Polynomial| R)))))
          (#5=#:G772 NIL) (#6=#:G771 #7=(|Boolean|)) (#8=#:G773 #7#)
          (#9=#:G794 NIL) (|fq| NIL) (#10=#:G793 NIL) (#11=#:G792 NIL)
          (|gb|
           (CATEGORY |package|
            (SIGNATURE |credPol| (|dmp| |dmp| (|List| |dmp|)))
            (SIGNATURE |redPol| (|dmp| |dmp| (|List| |dmp|)))
            (SIGNATURE |gbasis|
             ((|List| |dmp|) (|List| |dmp|) (|Integer|) (|Integer|)))
            (SIGNATURE |critT|
             ((|Boolean|)
              (|Record|
               (|:| |lcmfij|
                    #12=(|DirectProduct| (|call| LENGTH |lv|)
                                         (|NonNegativeInteger|)))
               (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |dmp|)
               (|:| |polj| |dmp|))))
            (SIGNATURE |critM| ((|Boolean|) #12# #12#))
            (SIGNATURE |critB| ((|Boolean|) #12# #12# #12# #12#))
            (SIGNATURE |critBonD|
             ((|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              |dmp|
              (|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |critMTonD1|
             ((|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |critMonD1|
             ((|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              #12#
              (|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |redPo|
             ((|Record| (|:| |poly| |dmp|) (|:| |mult| (|Polynomial| R))) |dmp|
              (|List| |dmp|)))
            (SIGNATURE |hMonic| (|dmp| |dmp|))
            (SIGNATURE |updatF|
             ((|List|
               (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |pol| |dmp|)))
              |dmp| (|NonNegativeInteger|)
              (|List|
               (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |pol| |dmp|)))))
            (SIGNATURE |sPol|
             (|dmp|
              (|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))))
            (SIGNATURE |updatD|
             ((|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |minGbasis| ((|List| |dmp|) (|List| |dmp|)))
            (SIGNATURE |lepol| ((|Integer|) |dmp|))
            (SIGNATURE |prinshINFO| ((|Void|) |dmp|))
            (SIGNATURE |prindINFO|
             ((|Integer|)
              (|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              |dmp| |dmp| (|Integer|) (|Integer|) (|Integer|)))
            (SIGNATURE |fprindINFO|
             ((|Integer|)
              (|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              |dmp| |dmp| (|Integer|) (|Integer|) (|Integer|) (|Integer|)))
            (SIGNATURE |prinpolINFO| ((|Void|) (|List| |dmp|)))
            (SIGNATURE |prinb| ((|Void|) (|Integer|)))
            (SIGNATURE |critpOrder|
             ((|Boolean|)
              (|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              (|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))))
            (SIGNATURE |makeCrit|
             ((|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |pol| |dmp|))
              |dmp| (|NonNegativeInteger|)))
            (SIGNATURE |virtualDegree| ((|NonNegativeInteger|) |dmp|))))
          (|lp| (|List| |dmp|)) (#13=#:G791 NIL) (|f| NIL) (#14=#:G790 NIL)
          (|lq| (|List| |dmp|)) (|df| (|Polynomial| R)) (#15=#:G789 NIL)
          (#16=#:G788 NIL) (|lvv| (|List| OV)) (#17=#:G766 NIL)
          (#18=#:G787 NIL) (|vv| NIL) (#19=#:G786 NIL)
          (|push|
           (CATEGORY |package| (SIGNATURE |pushdown| (|dmp| |dmp| OV))
            (SIGNATURE |pushdown| (|dmp| |dmp| (|List| OV)))
            (SIGNATURE |pushup| (|dmp| |dmp| OV))
            (SIGNATURE |pushup| (|dmp| |dmp| (|List| OV)))
            (SIGNATURE |map|
             (|dmp| (|Mapping| |dmp| (|Polynomial| R)) |dmp|))))
          (DP
           (|DirectProductCategory| (|call| LENGTH |lv|)
                                    (|NonNegativeInteger|)))
          (OV
           (|Join| (|OrderedFinite|) (|ConvertibleTo| (|Symbol|))
                   (|ConvertibleTo| (|InputForm|))
                   (|ConvertibleTo| (|Pattern| (|Float|)))
                   (|ConvertibleTo| (|Pattern| (|Integer|)))
                   (CATEGORY |domain|
                    (SIGNATURE |variable| ((|Union| $ "failed") (|Symbol|))))))
          (|dmp|
           (|Join|
            (|PolynomialCategory| (|Polynomial| R)
                                  (|DirectProduct| (|#| |lv|)
                                                   (|NonNegativeInteger|))
                                  (|OrderedVariableList| |lv|))
            (CATEGORY |domain|
             (SIGNATURE |reorder| ($ $ (|List| (|Integer|)))))))
          (#20=#:G785 NIL) (|ff| NIL) (#21=#:G784 NIL)
          (|fp| (|Factored| (|Polynomial| R))) (|p| (|Polynomial| R)))
         (SEQ
          (COND ((OR (NULL |lv|) (NULL |lf|)) NIL)
                ((EQL (LENGTH |lf|) 1)
                 (SEQ
                  (LETT |p| (SPADCALL (|SPADfirst| |lf|) (QREFELT $ 21))
                        . #22=(|SYSSOLP;triangularSystems;LLL;7|))
                  (LETT |fp| (SPADCALL |p| (QREFELT $ 44)) . #22#)
                  (EXIT
                   (PROGN
                    (LETT #21# NIL . #22#)
                    (SEQ (LETT |ff| NIL . #22#)
                         (LETT #20# (SPADCALL |fp| (QREFELT $ 47)) . #22#) G190
                         (COND
                          ((OR (ATOM #20#)
                               (PROGN (LETT |ff| (CAR #20#) . #22#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|SYSSOLP;testDegree| (QCAR |ff|) |lv| $)
                             (LETT #21# (CONS (LIST (QCAR |ff|)) #21#)
                                   . #22#)))))
                         (LETT #20# (CDR #20#) . #22#) (GO G190) G191
                         (EXIT (NREVERSE #21#)))))))
                (#23='T
                 (SEQ
                  (LETT |dmp|
                        (|DistributedMultivariatePolynomial| |lv|
                                                             (|Polynomial|
                                                              (QREFELT $ 6)))
                        . #22#)
                  (LETT OV (|OrderedVariableList| |lv|) . #22#)
                  (LETT DP
                        (|DirectProduct| (LENGTH |lv|) (|NonNegativeInteger|))
                        . #22#)
                  (LETT |push| (|PushVariables| (QREFELT $ 6) DP OV |dmp|)
                        . #22#)
                  (LETT |lvv|
                        (PROGN
                         (LETT #19# NIL . #22#)
                         (SEQ (LETT |vv| NIL . #22#) (LETT #18# |lv| . #22#)
                              G190
                              (COND
                               ((OR (ATOM #18#)
                                    (PROGN (LETT |vv| (CAR #18#) . #22#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #19#
                                      (CONS
                                       (PROG2
                                           (LETT #17#
                                                 (SPADCALL |vv|
                                                           (|compiledLookupCheck|
                                                            '|variable|
                                                            (LIST
                                                             (LIST '|Union| '$
                                                                   '#24="failed")
                                                             (LIST '|Symbol|))
                                                            OV))
                                                 . #22#)
                                           (QCDR #17#)
                                         (|check_union2| (QEQCAR #17# 0) OV
                                                         (|Union| OV #24#)
                                                         #17#))
                                       #19#)
                                      . #22#)))
                              (LETT #18# (CDR #18#) . #22#) (GO G190) G191
                              (EXIT (NREVERSE #19#))))
                        . #22#)
                  (LETT |lq|
                        (PROGN
                         (LETT #16# NIL . #22#)
                         (SEQ (LETT |f| NIL . #22#) (LETT #15# |lf| . #22#)
                              G190
                              (COND
                               ((OR (ATOM #15#)
                                    (PROGN (LETT |f| (CAR #15#) . #22#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (LETT |df| (SPADCALL |f| (QREFELT $ 48))
                                         . #22#)
                                   (|spadConstant| $ 49) (QREFELT $ 50))
                                  (LETT #16#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |df|
                                                    (|compiledLookupCheck|
                                                     '|coerce|
                                                     (LIST '$
                                                           (LIST '|Polynomial|
                                                                 (|devaluate|
                                                                  (ELT $ 6))))
                                                     |dmp|))
                                          |lvv|
                                          (|compiledLookupCheck| '|pushup|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         OV)))
                                                                 |push|))
                                         #16#)
                                        . #22#)))))
                              (LETT #15# (CDR #15#) . #22#) (GO G190) G191
                              (EXIT (NREVERSE #16#))))
                        . #22#)
                  (LETT |lp|
                        (PROGN
                         (LETT #14# NIL . #22#)
                         (SEQ (LETT |f| NIL . #22#) (LETT #13# |lf| . #22#)
                              G190
                              (COND
                               ((OR (ATOM #13#)
                                    (PROGN (LETT |f| (CAR #13#) . #22#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #14#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL (SPADCALL |f| (QREFELT $ 21))
                                                  (|compiledLookupCheck|
                                                   '|coerce|
                                                   (LIST '$
                                                         (LIST '|Polynomial|
                                                               (|devaluate|
                                                                (ELT $ 6))))
                                                   |dmp|))
                                        |lvv|
                                        (|compiledLookupCheck| '|pushup|
                                                               (LIST
                                                                (|devaluate|
                                                                 |dmp|)
                                                                (|devaluate|
                                                                 |dmp|)
                                                                (LIST '|List|
                                                                      (|devaluate|
                                                                       OV)))
                                                               |push|))
                                       #14#)
                                      . #22#)))
                              (LETT #13# (CDR #13#) . #22#) (GO G190) G191
                              (EXIT (NREVERSE #14#))))
                        . #22#)
                  (LETT |parRes|
                        (SPADCALL |lp| |lvv|
                                  (|compiledLookupCheck| '|groebSolve|
                                                         (LIST
                                                          (LIST '|List|
                                                                (LIST '|List|
                                                                      (LIST
                                                                       '|DistributedMultivariatePolynomial|
                                                                       |lv|
                                                                       (LIST
                                                                        '|Polynomial|
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              6))))))
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|DistributedMultivariatePolynomial|
                                                                 |lv|
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT $
                                                                        6)))))
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|OrderedVariableList|
                                                                 |lv|)))
                                                         (|GroebnerSolve| |lv|
                                                                          (|Polynomial|
                                                                           (ELT
                                                                            $
                                                                            6))
                                                                          (ELT
                                                                           $
                                                                           6))))
                        . #22#)
                  (COND
                   ((SPADCALL |lq| NIL
                              (|compiledLookupCheck| '~=
                                                     (LIST (LIST '|Boolean|) '$
                                                           '$)
                                                     (|List| |dmp|)))
                    (SEQ
                     (LETT |gb|
                           (|GroebnerInternalPackage|
                            (|Polynomial| (QREFELT $ 6))
                            (|DirectProduct| (LENGTH |lv|)
                                             (|NonNegativeInteger|))
                            OV |dmp|)
                           . #22#)
                     (EXIT
                      (LETT |parRes|
                            (PROGN
                             (LETT #11# NIL . #22#)
                             (SEQ (LETT |pr| NIL . #22#)
                                  (LETT #10# |parRes| . #22#) G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN
                                         (LETT |pr| (CAR #10#) . #22#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((PROGN
                                       (LETT #5# NIL . #22#)
                                       (SEQ (LETT |fq| NIL . #22#)
                                            (LETT #9# |lq| . #22#) G190
                                            (COND
                                             ((OR (ATOM #9#)
                                                  (PROGN
                                                   (LETT |fq| (CAR #9#) . #22#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (PROGN
                                               (LETT #8#
                                                     (SPADCALL
                                                      (SPADCALL |fq| |pr|
                                                                (|compiledLookupCheck|
                                                                 '|redPol|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         |dmp|)))
                                                                 |gb|))
                                                      (SPADCALL
                                                       (|compiledLookupCheck|
                                                        '|Zero| (LIST '$)
                                                        |dmp|))
                                                      (|compiledLookupCheck|
                                                       '~=
                                                       (LIST (LIST '|Boolean|)
                                                             '$ '$)
                                                       |dmp|))
                                                     . #22#)
                                               (COND
                                                (#5#
                                                 (LETT #6#
                                                       (COND (#6# #8#)
                                                             ('T NIL))
                                                       . #22#))
                                                ('T
                                                 (PROGN
                                                  (LETT #6# #8# . #22#)
                                                  (LETT #5# 'T . #22#)))))))
                                            (LETT #9# (CDR #9#) . #22#)
                                            (GO G190) G191 (EXIT NIL))
                                       (COND (#5# #6#) (#23# 'T)))
                                      (LETT #11# (CONS |pr| #11#) . #22#)))))
                                  (LETT #10# (CDR #10#) . #22#) (GO G190) G191
                                  (EXIT (NREVERSE #11#))))
                            . #22#)))))
                  (EXIT
                   (PROGN
                    (LETT #4# NIL . #22#)
                    (SEQ (LETT |pr| NIL . #22#) (LETT #3# |parRes| . #22#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |pr| (CAR #3#) . #22#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (PROGN
                                   (LETT #2# NIL . #22#)
                                   (SEQ (LETT |pf| NIL . #22#)
                                        (LETT #1# |pr| . #22#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |pf| (CAR #1#) . #22#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |pf| |lvv|
                                                            (|compiledLookupCheck|
                                                             '|pushdown|
                                                             (LIST
                                                              (|devaluate|
                                                               |dmp|)
                                                              (|devaluate|
                                                               |dmp|)
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     OV)))
                                                             |push|))
                                                  (|compiledLookupCheck|
                                                   '|retract|
                                                   (LIST
                                                    (LIST '|Polynomial|
                                                          (|devaluate|
                                                           (ELT $ 6)))
                                                    '$)
                                                   |dmp|))
                                                 #2#)
                                                . #22#)))
                                        (LETT #1# (CDR #1#) . #22#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  #4#)
                                 . #22#)))
                         (LETT #3# (CDR #3#) . #22#) (GO G190) G191
                         (EXIT (NREVERSE #4#))))))))))) 

(SDEFUN |SYSSOLP;solve;FL;8|
        ((|pol| |Fraction| (|Polynomial| R))
         ($ |List| (|Equation| (|Fraction| (|Polynomial| R)))))
        (SPROG ((|lv| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((SPADCALL |pol| (QREFELT $ 54))
                  (|error| "equation is always satisfied"))
                 (#1='T
                  (SEQ
                   (LETT |lv|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |pol| (QREFELT $ 21))
                                     (QREFELT $ 22))
                           (SPADCALL (SPADCALL |pol| (QREFELT $ 48))
                                     (QREFELT $ 22))
                           (QREFELT $ 55))
                          (QREFELT $ 56))
                         |SYSSOLP;solve;FL;8|)
                   (EXIT
                    (COND ((NULL |lv|) (|error| "inconsistent equation"))
                          ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 41))
                           (|error| "too many variables"))
                          (#1#
                           (SPADCALL |pol| (|SPADfirst| |lv|)
                                     (QREFELT $ 58))))))))))) 

(SDEFUN |SYSSOLP;solve;EL;9|
        ((|eq| |Equation| (|Fraction| (|Polynomial| R)))
         ($ |List| (|Equation| (|Fraction| (|Polynomial| R)))))
        (SPROG
         ((|lv| (|List| (|Symbol|))) (|pol| (|Fraction| (|Polynomial| R))))
         (SEQ
          (LETT |pol|
                (SPADCALL (SPADCALL |eq| (QREFELT $ 60))
                          (SPADCALL |eq| (QREFELT $ 61)) (QREFELT $ 62))
                . #1=(|SYSSOLP;solve;EL;9|))
          (EXIT
           (COND
            ((SPADCALL |pol| (QREFELT $ 54))
             (|error| "equation is always satisfied"))
            (#2='T
             (SEQ
              (LETT |lv|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |pol| (QREFELT $ 21)) (QREFELT $ 22))
                      (SPADCALL (SPADCALL |pol| (QREFELT $ 48)) (QREFELT $ 22))
                      (QREFELT $ 55))
                     (QREFELT $ 56))
                    . #1#)
              (EXIT
               (COND ((NULL |lv|) (|error| "inconsistent equation"))
                     ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 41))
                      (|error| "too many variables"))
                     (#2#
                      (SPADCALL |pol| (|SPADfirst| |lv|)
                                (QREFELT $ 58)))))))))))) 

(SDEFUN |SYSSOLP;solve;ESL;10|
        ((|eq| |Equation| (|Fraction| (|Polynomial| R))) (|var| |Symbol|)
         ($ |List| (|Equation| (|Fraction| (|Polynomial| R)))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT $ 60))
                   (SPADCALL |eq| (QREFELT $ 61)) (QREFELT $ 62))
         |var| (QREFELT $ 58))) 

(SDEFUN |SYSSOLP;solve;FSL;11|
        ((|pol| |Fraction| (|Polynomial| R)) (|var| |Symbol|)
         ($ |List| (|Equation| (|Fraction| (|Polynomial| R)))))
        (SPROG
         ((#1=#:G822 NIL) (|ff| NIL) (#2=#:G821 NIL)
          (|fp| (|Factored| (|Polynomial| R))) (|p| (|Polynomial| R)))
         (SEQ
          (COND
           ((|HasCategory| (QREFELT $ 6) '(|GcdDomain|))
            (SEQ
             (LETT |p|
                   (SPADCALL (SPADCALL |pol| (QREFELT $ 21)) |var|
                             (QREFELT $ 65))
                   . #3=(|SYSSOLP;solve;FSL;11|))
             (LETT |fp| (SPADCALL |p| (QREFELT $ 44)) . #3#)
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |ff| NIL . #3#)
                    (LETT #1# (SPADCALL |fp| (QREFELT $ 47)) . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |ff| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (|SYSSOLP;makeEq|
                              (SPADCALL (CONS (|function| |SYSSOLP;makeR2F|) $)
                                        (QCAR |ff|) (QREFELT $ 68))
                              (LIST |var|) $)
                             #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#)))))))
           ('T NIL))))) 

(SDEFUN |SYSSOLP;makePolys|
        ((|l| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         ($ |List| (|Fraction| (|Polynomial| R))))
        (SPROG ((#1=#:G826 NIL) (|e| NIL) (#2=#:G825 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SYSSOLP;makePolys|))
                 (SEQ (LETT |e| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |e| (QREFELT $ 60))
                                         (SPADCALL |e| (QREFELT $ 61))
                                         (QREFELT $ 62))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SYSSOLP;linSolve|
        ((|lp| |List| (|Fraction| (|Polynomial| R))) (|lv| |List| (|Symbol|))
         ($ |Union| (|List| (|Equation| (|Fraction| (|Polynomial| R))))
          "failed"))
        (SPROG
         ((|eqs| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))
          (#1=#:G846 NIL) (|i| NIL) (#2=#:G845 NIL)
          (|sym| (|Fraction| (|Polynomial| R))) (#3=#:G844 NIL) (|p| NIL)
          (|zeron| (|Vector| (|Fraction| (|Polynomial| R))))
          (|rhs| (|Vector| (|Fraction| (|Polynomial| R)))) (#4=#:G833 NIL)
          (|rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Fraction| (|Polynomial| R))) "failed"))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Polynomial| R)))))))
          (|lr| (|List| (|Polynomial| R))) (#5=#:G843 NIL) (|f| NIL)
          (#6=#:G842 NIL))
         (SEQ
          (LETT |lr|
                (PROGN
                 (LETT #6# NIL . #7=(|SYSSOLP;linSolve|))
                 (SEQ (LETT |f| NIL . #7#) (LETT #5# |lp| . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (SPADCALL |f| (QREFELT $ 21)) #6#)
                              . #7#)))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (LETT |rec| (SPADCALL |lr| |lv| (QREFELT $ 73)) . #7#)
          (EXIT
           (COND ((QEQCAR (QCAR |rec|) 1) (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |rhs|
                         (PROG2 (LETT #4# (QCAR |rec|) . #7#)
                             (QCDR #4#)
                           (|check_union2| (QEQCAR #4# 0)
                                           (|Vector|
                                            (|Fraction|
                                             (|Polynomial| (QREFELT $ 6))))
                                           (|Union|
                                            (|Vector|
                                             (|Fraction|
                                              (|Polynomial| (QREFELT $ 6))))
                                            "failed")
                                           #4#))
                         . #7#)
                   (LETT |zeron| (SPADCALL (LENGTH |lv|) (QREFELT $ 75)) . #7#)
                   (SEQ (LETT |p| NIL . #7#) (LETT #3# (QCDR |rec|) . #7#) G190
                        (COND
                         ((OR (ATOM #3#)
                              (PROGN (LETT |p| (CAR #3#) . #7#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |p| |zeron| (QREFELT $ 76))
                            (SEQ (LETT |sym| (|SYSSOLP;newInF| 1 $) . #7#)
                                 (EXIT
                                  (SEQ (LETT |i| 1 . #7#)
                                       (LETT #2# (LENGTH |lv|) . #7#) G190
                                       (COND
                                        ((|greater_SI| |i| #2#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |rhs| |i|
                                                   (SPADCALL
                                                    (SPADCALL |rhs| |i|
                                                              (QREFELT $ 78))
                                                    (SPADCALL |sym|
                                                              (SPADCALL |p| |i|
                                                                        (QREFELT
                                                                         $ 78))
                                                              (QREFELT $ 79))
                                                    (QREFELT $ 80))
                                                   (QREFELT $ 81))))
                                       (LETT |i| (|inc_SI| |i|) . #7#)
                                       (GO G190) G191 (EXIT NIL))))))))
                        (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                   (LETT |eqs| NIL . #7#)
                   (SEQ (LETT |i| 1 . #7#) (LETT #1# (LENGTH |lv|) . #7#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |eqs|
                                (SPADCALL |eqs|
                                          (LIST
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |lv| |i|
                                                        (QREFELT $ 82))
                                              (QREFELT $ 30))
                                             (QREFELT $ 10))
                                            (SPADCALL |rhs| |i| (QREFELT $ 78))
                                            (QREFELT $ 83)))
                                          (QREFELT $ 84))
                                . #7#)))
                        (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT (CONS 0 |eqs|))))))))) 

(SDEFUN |SYSSOLP;solve;LL;14|
        ((|lr| |List| (|Fraction| (|Polynomial| R)))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((|lv| #1=(|List| (|Symbol|))) (#2=#:G848 NIL) (#3=#:G847 #1#)
          (#4=#:G849 #1#) (#5=#:G852 NIL) (|p| NIL))
         (SEQ
          (LETT |lv|
                (PROGN
                 (LETT #2# NIL . #6=(|SYSSOLP;solve;LL;14|))
                 (SEQ (LETT |p| NIL . #6#) (LETT #5# |lr| . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 21))
                                          (QREFELT $ 22))
                                (SPADCALL (SPADCALL |p| (QREFELT $ 48))
                                          (QREFELT $ 22))
                                (QREFELT $ 85))
                               . #6#)
                         (COND
                          (#2#
                           (LETT #3# (SPADCALL #3# #4# (QREFELT $ 85)) . #6#))
                          ('T
                           (PROGN
                            (LETT #3# #4# . #6#)
                            (LETT #2# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T (|IdentityError| '|setUnion|))))
                . #6#)
          (EXIT (SPADCALL |lr| |lv| (QREFELT $ 87)))))) 

(SDEFUN |SYSSOLP;solve;LL;15|
        ((|le| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((|lv| #1=(|List| (|Symbol|))) (#2=#:G854 NIL) (#3=#:G853 #1#)
          (#4=#:G855 #1#) (#5=#:G858 NIL) (|p| NIL)
          (|lr| (|List| (|Fraction| (|Polynomial| R)))))
         (SEQ
          (LETT |lr| (|SYSSOLP;makePolys| |le| $) . #6=(|SYSSOLP;solve;LL;15|))
          (LETT |lv|
                (PROGN
                 (LETT #2# NIL . #6#)
                 (SEQ (LETT |p| NIL . #6#) (LETT #5# |lr| . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 21))
                                          (QREFELT $ 22))
                                (SPADCALL (SPADCALL |p| (QREFELT $ 48))
                                          (QREFELT $ 22))
                                (QREFELT $ 85))
                               . #6#)
                         (COND
                          (#2#
                           (LETT #3# (SPADCALL #3# #4# (QREFELT $ 85)) . #6#))
                          ('T
                           (PROGN
                            (LETT #3# #4# . #6#)
                            (LETT #2# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T (|IdentityError| '|setUnion|))))
                . #6#)
          (EXIT (SPADCALL |lr| |lv| (QREFELT $ 87)))))) 

(SDEFUN |SYSSOLP;solve;LLL;16|
        ((|le| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPADCALL (|SYSSOLP;makePolys| |le| $) |lv| (QREFELT $ 87))) 

(SDEFUN |SYSSOLP;checkLinear|
        ((|lr| |List| (|Fraction| (|Polynomial| R))) (|vl| |List| (|Symbol|))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G867 NIL) (#2=#:G866 #3=(|Boolean|)) (#4=#:G868 #3#)
          (#5=#:G876 NIL) (|pol| NIL) (#6=#:G871 NIL) (#7=#:G862 NIL)
          (#8=#:G861 #9=(|Boolean|)) (#10=#:G863 #9#) (#11=#:G875 NIL)
          (|x| NIL) (#12=#:G874 NIL) (|f| NIL) (|ld| (|List| (|Polynomial| R)))
          (#13=#:G873 NIL) (#14=#:G872 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ld|
                  (PROGN
                   (LETT #14# NIL . #15=(|SYSSOLP;checkLinear|))
                   (SEQ (LETT |pol| NIL . #15#) (LETT #13# |lr| . #15#) G190
                        (COND
                         ((OR (ATOM #13#)
                              (PROGN (LETT |pol| (CAR #13#) . #15#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #14#
                                (CONS (SPADCALL |pol| (QREFELT $ 48)) #14#)
                                . #15#)))
                        (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                        (EXIT (NREVERSE #14#))))
                  . #15#)
            (SEQ (LETT |f| NIL . #15#) (LETT #12# |ld| . #15#) G190
                 (COND
                  ((OR (ATOM #12#) (PROGN (LETT |f| (CAR #12#) . #15#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((PROGN
                      (LETT #7# NIL . #15#)
                      (SEQ (LETT |x| NIL . #15#)
                           (LETT #11# (SPADCALL |f| (QREFELT $ 22)) . #15#)
                           G190
                           (COND
                            ((OR (ATOM #11#)
                                 (PROGN (LETT |x| (CAR #11#) . #15#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #10# (SPADCALL |x| |vl| (QREFELT $ 23))
                                    . #15#)
                              (COND
                               (#7#
                                (LETT #8# (COND (#8# 'T) ('T #10#)) . #15#))
                               ('T
                                (PROGN
                                 (LETT #8# #10# . #15#)
                                 (LETT #7# 'T . #15#)))))))
                           (LETT #11# (CDR #11#) . #15#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#7# #8#) ('T NIL)))
                     (PROGN (LETT #6# NIL . #15#) (GO #16=#:G870))))))
                 (LETT #12# (CDR #12#) . #15#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #1# NIL . #15#)
              (SEQ (LETT |pol| NIL . #15#) (LETT #5# |lr| . #15#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |pol| (CAR #5#) . #15#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #4#
                            (<
                             (SPADCALL (SPADCALL |pol| (QREFELT $ 21)) |vl|
                                       (QREFELT $ 91))
                             2)
                            . #15#)
                      (COND (#1# (LETT #2# (COND (#2# #4#) ('T NIL)) . #15#))
                            ('T
                             (PROGN
                              (LETT #2# #4# . #15#)
                              (LETT #1# 'T . #15#)))))))
                   (LETT #5# (CDR #5#) . #15#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) ('T 'T))))))
          #16# (EXIT #6#)))) 

(SDEFUN |SYSSOLP;solve;LLL;18|
        ((|lr| |List| (|Fraction| (|Polynomial| R))) (|vl| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((#1=#:G892 NIL) (|f| NIL) (#2=#:G891 NIL) (#3=#:G890 NIL) (|pr| NIL)
          (#4=#:G889 NIL) (|parRes| (|List| (|List| (|Polynomial| R))))
          (|eqns| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))
          (|rhs| (|Fraction| (|Polynomial| R)))
          (|lhs| (|Fraction| (|Polynomial| R))) (#5=#:G888 NIL) (|i| NIL)
          (|soln|
           (|Union| (|List| (|Equation| (|Fraction| (|Polynomial| R))))
                    "failed")))
         (SEQ
          (COND ((NULL |vl|) NIL)
                ((|SYSSOLP;checkLinear| |lr| |vl| $)
                 (SEQ
                  (LETT |soln| (|SYSSOLP;linSolve| |lr| |vl| $)
                        . #6=(|SYSSOLP;solve;LLL;18|))
                  (EXIT
                   (COND ((QEQCAR |soln| 1) NIL)
                         (#7='T
                          (SEQ (LETT |eqns| NIL . #6#)
                               (SEQ (LETT |i| 1 . #6#)
                                    (LETT #5# (LENGTH |vl|) . #6#) G190
                                    (COND ((|greater_SI| |i| #5#) (GO G191)))
                                    (SEQ
                                     (LETT |lhs|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |vl| |i| (QREFELT $ 82))
                                             (QREFELT $ 30))
                                            (QREFELT $ 10))
                                           . #6#)
                                     (LETT |rhs|
                                           (SPADCALL
                                            (SPADCALL (QCDR |soln|) |i|
                                                      (QREFELT $ 92))
                                            (QREFELT $ 61))
                                           . #6#)
                                     (EXIT
                                      (LETT |eqns|
                                            (SPADCALL |eqns|
                                                      (LIST
                                                       (SPADCALL |lhs| |rhs|
                                                                 (QREFELT $
                                                                          83)))
                                                      (QREFELT $ 84))
                                            . #6#)))
                                    (LETT |i| (|inc_SI| |i|) . #6#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT (LIST |eqns|))))))))
                ((|HasCategory| (QREFELT $ 6) '(|GcdDomain|))
                 (SEQ (LETT |parRes| (SPADCALL |lr| |vl| (QREFELT $ 53)) . #6#)
                      (EXIT
                       (PROGN
                        (LETT #4# NIL . #6#)
                        (SEQ (LETT |pr| NIL . #6#) (LETT #3# |parRes| . #6#)
                             G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |pr| (CAR #3#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #4#
                                     (CONS
                                      (PROGN
                                       (LETT #2# NIL . #6#)
                                       (SEQ (LETT |f| NIL . #6#)
                                            (LETT #1# |pr| . #6#) G190
                                            (COND
                                             ((OR (ATOM #1#)
                                                  (PROGN
                                                   (LETT |f| (CAR #1#) . #6#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (|SYSSOLP;makeEq|
                                                      (SPADCALL
                                                       (CONS
                                                        (|function|
                                                         |SYSSOLP;makeR2F|)
                                                        $)
                                                       |f| (QREFELT $ 68))
                                                      |vl| $)
                                                     #2#)
                                                    . #6#)))
                                            (LETT #1# (CDR #1#) . #6#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      #4#)
                                     . #6#)))
                             (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                             (EXIT (NREVERSE #4#)))))))
                (#7# (LIST NIL)))))) 

(DECLAIM (NOTINLINE |SystemSolvePackage;|)) 

(DEFUN |SystemSolvePackage| (#1=#:G893)
  (SPROG NIL
         (PROG (#2=#:G894)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SystemSolvePackage|)
                                               '|domainEqualList|)
                    . #3=(|SystemSolvePackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SystemSolvePackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SystemSolvePackage|)))))))))) 

(DEFUN |SystemSolvePackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SystemSolvePackage|))
          (LETT |dv$| (LIST '|SystemSolvePackage| DV$1) . #1#)
          (LETT $ (GETREFV 93) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SystemSolvePackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SystemSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Polynomial| 6)
              (0 . |coerce|) (|Fraction| 7) (5 . |coerce|) (|List| 17)
              (|Polynomial| 9) (10 . |variables|) (|Boolean|) (15 . =)
              (21 . |retract|) (|Symbol|)
              (|MPolyCatRationalFunctionFactorizer| (|IndexedExponents| 17) 17
                                                    6 12)
              (26 . |pushdown|) (32 . |last|) (37 . |numer|) (42 . |variables|)
              (47 . |member?|) (|SparseUnivariatePolynomial| $)
              (53 . |univariate|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (59 . |degree|) (64 . |One|)
              (68 . |coerce|) (73 . |Zero|) (77 . |Zero|) (81 . |coefficient|)
              (87 . |leadingCoefficient|) (92 . /) (98 . -) (|Equation| 9)
              (103 . |equation|) (109 . |new|) (113 . |degree|) (119 . >)
              (|Factored| 7)
              (|GeneralizedMultivariateFactorize| 17 (|IndexedExponents| 17) 6
                                                  6 7)
              (125 . |factor|) (|Record| (|:| |factor| 7) (|:| |exponent| 77))
              (|List| 45) (130 . |factors|) (135 . |denom|) (140 . |One|)
              (144 . ~=) (|List| 71) (|List| 9)
              |SYSSOLP;triangularSystems;LLL;7| (150 . |zero?|)
              (155 . |concat|) (161 . |removeDuplicates|) (|List| 37)
              |SYSSOLP;solve;FSL;11| |SYSSOLP;solve;FL;8| (166 . |lhs|)
              (171 . |rhs|) (176 . -) |SYSSOLP;solve;EL;9|
              |SYSSOLP;solve;ESL;10| (182 . |primitivePart|) (|Mapping| 9 6)
              (|PolynomialFunctions2| 6 9) (188 . |map|) (|Union| 74 '"failed")
              (|Record| (|:| |particular| 69) (|:| |basis| (|List| 74)))
              (|List| 7)
              (|LinearSystemPolynomialPackage| 6 (|IndexedExponents| 17) 17 7)
              (194 . |linSolve|) (|Vector| 9) (200 . |zero|) (205 . ~=)
              (|Integer|) (211 . |elt|) (217 . *) (223 . +) (229 . |setelt!|)
              (236 . |elt|) (242 . =) (248 . |append|) (254 . |setUnion|)
              (|List| 57) |SYSSOLP;solve;LLL;18| |SYSSOLP;solve;LL;14|
              |SYSSOLP;solve;LL;15| |SYSSOLP;solve;LLL;16|
              (260 . |totalDegree|) (266 . |elt|))
           '#(|triangularSystems| 272 |solve| 278) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 92
                                                 '(1 7 0 6 8 1 9 0 7 10 1 12 11
                                                   0 13 2 11 14 0 0 15 1 12 9 0
                                                   16 2 18 12 12 17 19 1 11 17
                                                   0 20 1 9 7 0 21 1 7 11 0 22
                                                   2 11 14 17 0 23 2 7 24 0 17
                                                   25 1 27 26 0 28 0 6 0 29 1 7
                                                   0 17 30 0 6 0 31 0 9 0 32 2
                                                   27 7 0 26 33 1 27 7 0 34 2 9
                                                   0 7 7 35 1 9 0 0 36 2 37 0 9
                                                   9 38 0 17 0 39 2 7 26 0 17
                                                   40 2 26 14 0 0 41 1 43 42 7
                                                   44 1 42 46 0 47 1 9 7 0 48 0
                                                   7 0 49 2 7 14 0 0 50 1 9 14
                                                   0 54 2 11 0 0 0 55 1 11 0 0
                                                   56 1 37 9 0 60 1 37 9 0 61 2
                                                   9 0 0 0 62 2 7 0 0 17 65 2
                                                   67 12 66 7 68 2 72 70 71 11
                                                   73 1 74 0 26 75 2 74 14 0 0
                                                   76 2 74 9 0 77 78 2 9 0 0 0
                                                   79 2 9 0 0 0 80 3 74 9 0 77
                                                   9 81 2 11 17 0 77 82 2 37 0
                                                   9 9 83 2 57 0 0 0 84 2 11 0
                                                   0 0 85 2 7 26 0 11 91 2 57
                                                   37 0 77 92 2 0 51 52 11 53 2
                                                   0 86 57 11 90 2 0 86 52 11
                                                   87 1 0 86 57 89 1 0 86 52 88
                                                   2 0 57 37 17 64 2 0 57 9 17
                                                   58 1 0 57 9 59 1 0 57 37
                                                   63)))))
           '|lookupComplete|)) 
