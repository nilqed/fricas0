
(SDEFUN |FGLMICPK;zeroDim?|
        ((|lq2| |List| (|HomogeneousDistributedMultivariatePolynomial| |ls| R))
         ($ |Boolean|))
        (SPROG
         ((|lv| (|List| (|OrderedVariableList| |ls|)))
          (|x| (|OrderedVariableList| |ls|)) (#1=#:G709 NIL)
          (|m| (|HomogeneousDistributedMultivariatePolynomial| |ls| R))
          (#2=#:G722 NIL) (|q2| NIL) (#3=#:G721 NIL) (|s| NIL) (#4=#:G720 NIL))
         (SEQ
          (LETT |lq2| (SPADCALL |lq2| (QREFELT $ 10))
                . #5=(|FGLMICPK;zeroDim?|))
          (EXIT
           (COND
            ((OR (NULL |lq2|) (< (LENGTH |lq2|) (LENGTH (QREFELT $ 7)))) NIL)
            ('T
             (SEQ
              (LETT |lv|
                    (PROGN
                     (LETT #4# NIL . #5#)
                     (SEQ (LETT |s| NIL . #5#) (LETT #3# (QREFELT $ 7) . #5#)
                          G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |s| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (PROG2
                                       (LETT #1# (SPADCALL |s| (QREFELT $ 14))
                                             . #5#)
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (|OrderedVariableList|
                                                      (QREFELT $ 7))
                                                     (|Union|
                                                      (|OrderedVariableList|
                                                       (QREFELT $ 7))
                                                      #6="failed")
                                                     #1#))
                                   #4#)
                                  . #5#)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #5#)
              (SEQ (LETT |q2| NIL . #5#) (LETT #2# |lq2| . #5#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |q2| (CAR #2#) . #5#) NIL)
                         (NULL (NULL (NULL |lv|))))
                     (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |q2| (QREFELT $ 16)) . #5#)
                        (LETT |x|
                              (PROG2
                                  (LETT #1# (SPADCALL |m| (QREFELT $ 18))
                                        . #5#)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0)
                                                (|OrderedVariableList|
                                                 (QREFELT $ 7))
                                                (|Union|
                                                 (|OrderedVariableList|
                                                  (QREFELT $ 7))
                                                 #6#)
                                                #1#))
                              . #5#)
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |m| |x| (QREFELT $ 20))
                                      (QREFELT $ 22))
                            (QREFELT $ 24))
                           (LETT |lv| (SPADCALL |x| |lv| (QREFELT $ 26))
                                 . #5#)))))
                   (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (NULL |lv|))))))))) 

(SDEFUN |FGLMICPK;zeroDimensional?;LB;2|
        ((|lq1| |List| (|Polynomial| R)) ($ |Boolean|))
        (SPROG
         ((|lq2|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |ls| R)))
          (#1=#:G730 NIL) (|q1| NIL) (#2=#:G729 NIL))
         (SEQ
          (LETT |lq2|
                (PROGN
                 (LETT #2# NIL . #3=(|FGLMICPK;zeroDimensional?;LB;2|))
                 (SEQ (LETT |q1| NIL . #3#) (LETT #1# |lq1| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |q1| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |q1| (QREFELT $ 29)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (|FGLMICPK;zeroDim?| |lq2| $))))) 

(SDEFUN |FGLMICPK;fglmIfCan;LU;3|
        ((|lq1| |List| (|Polynomial| R))
         ($ |Union| (|List| (|Polynomial| R)) "failed"))
        (SPROG
         ((#1=#:G746 NIL) (|q3| NIL) (#2=#:G745 NIL)
          (|lq3| (|List| (|DistributedMultivariatePolynomial| |ls| R)))
          (|lq2|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |ls| R)))
          (#3=#:G744 NIL) (|q1| NIL) (#4=#:G743 NIL))
         (SEQ
          (LETT |lq2|
                (PROGN
                 (LETT #4# NIL . #5=(|FGLMICPK;fglmIfCan;LU;3|))
                 (SEQ (LETT |q1| NIL . #5#) (LETT #3# |lq1| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |q1| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |q1| (QREFELT $ 29)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |lq2| (SPADCALL |lq2| (QREFELT $ 10)) . #5#)
          (COND
           ((NULL (|FGLMICPK;zeroDim?| |lq2| $)) (EXIT (CONS 1 "failed"))))
          (LETT |lq3| (SPADCALL |lq2| (QREFELT $ 34)) . #5#)
          (LETT |lq1|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |q3| NIL . #5#) (LETT #1# |lq3| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |q3| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |q3| (QREFELT $ 36)) #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (EXIT (CONS 0 |lq1|))))) 

(SDEFUN |FGLMICPK;groebner;2L;4|
        ((|lq1| |List| (|Polynomial| R)) ($ |List| (|Polynomial| R)))
        (SPROG
         ((#1=#:G763 NIL) (|q3| NIL) (#2=#:G762 NIL)
          (|lq3| (|List| (|DistributedMultivariatePolynomial| |ls| R)))
          (#3=#:G761 NIL) (#4=#:G760 NIL) (#5=#:G759 NIL) (|q1| NIL)
          (#6=#:G758 NIL)
          (|lq2|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |ls| R)))
          (#7=#:G757 NIL) (#8=#:G756 NIL))
         (SEQ
          (LETT |lq2|
                (PROGN
                 (LETT #8# NIL . #9=(|FGLMICPK;groebner;2L;4|))
                 (SEQ (LETT |q1| NIL . #9#) (LETT #7# |lq1| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |q1| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8# (CONS (SPADCALL |q1| (QREFELT $ 29)) #8#)
                              . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (LETT |lq2| (SPADCALL |lq2| (QREFELT $ 10)) . #9#)
          (COND
           ((NULL (|FGLMICPK;zeroDim?| |lq2| $))
            (EXIT
             (SEQ
              (LETT |lq3|
                    (PROGN
                     (LETT #6# NIL . #9#)
                     (SEQ (LETT |q1| NIL . #9#) (LETT #5# |lq1| . #9#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |q1| (CAR #5#) . #9#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6# (CONS (SPADCALL |q1| (QREFELT $ 39)) #6#)
                                  . #9#)))
                          (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #9#)
              (LETT |lq3| (SPADCALL |lq3| (QREFELT $ 41)) . #9#)
              (EXIT
               (PROGN
                (LETT #4# NIL . #9#)
                (SEQ (LETT |q3| NIL . #9#) (LETT #3# |lq3| . #9#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |q3| (CAR #3#) . #9#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #4# (CONS (SPADCALL |q3| (QREFELT $ 36)) #4#)
                             . #9#)))
                     (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                     (EXIT (NREVERSE #4#)))))))))
          (LETT |lq3| (SPADCALL |lq2| (QREFELT $ 34)) . #9#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #9#)
            (SEQ (LETT |q3| NIL . #9#) (LETT #1# |lq3| . #9#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |q3| (CAR #1#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |q3| (QREFELT $ 36)) #2#) . #9#)))
                 (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |FGLMIfCanPackage;|)) 

(DEFUN |FGLMIfCanPackage| (&REST #1=#:G764)
  (SPROG NIL
         (PROG (#2=#:G765)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FGLMIfCanPackage|)
                                               '|domainEqualList|)
                    . #3=(|FGLMIfCanPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FGLMIfCanPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FGLMIfCanPackage|)))))))))) 

(DEFUN |FGLMIfCanPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FGLMIfCanPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FGLMIfCanPackage| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 43) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FGLMIfCanPackage| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FGLMIfCanPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 15)
              (|GroebnerPackage| 6
                                 (|HomogeneousDirectProduct|
                                  (NRTEVAL (LENGTH (QREFELT $ 7)))
                                  (|NonNegativeInteger|))
                                 13 15)
              (0 . |groebner|) (|Union| $ '"failed") (|Symbol|)
              (|OrderedVariableList| 7) (5 . |variable|)
              (|HomogeneousDistributedMultivariatePolynomial| 7 6)
              (10 . |leadingMonomial|) (|Union| 13 '"failed")
              (15 . |mainVariable|) (|SparseUnivariatePolynomial| $)
              (20 . |univariate|) (|SparseUnivariatePolynomial| 15)
              (26 . |leadingCoefficient|) (|Boolean|) (31 . |ground?|)
              (|List| 13) (36 . |remove|) (|Polynomial| 6) (|PolToPol| 7 6)
              (42 . |pToHdmp|) (|List| 27) |FGLMICPK;zeroDimensional?;LB;2|
              (|List| 35) (|LinGroebnerPackage| 7 6) (47 . |totolex|)
              (|DistributedMultivariatePolynomial| 7 6) (52 . |dmpToP|)
              (|Union| 30 '"failed") |FGLMICPK;fglmIfCan;LU;3| (57 . |pToDmp|)
              (|GroebnerPackage| 6
                                 (|DirectProduct|
                                  (NRTEVAL (LENGTH (QREFELT $ 7)))
                                  (|NonNegativeInteger|))
                                 13 35)
              (62 . |groebner|) |FGLMICPK;groebner;2L;4|)
           '#(|zeroDimensional?| 67 |groebner| 72 |fglmIfCan| 77) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 42
                                                 '(1 9 8 8 10 1 13 11 12 14 1
                                                   15 0 0 16 1 15 17 0 18 2 15
                                                   19 0 13 20 1 21 15 0 22 1 15
                                                   23 0 24 2 25 0 13 0 26 1 28
                                                   15 27 29 1 33 32 8 34 1 28
                                                   27 35 36 1 28 35 27 39 1 40
                                                   32 32 41 1 0 23 30 31 1 0 30
                                                   30 42 1 0 37 30 38)))))
           '|lookupComplete|)) 
