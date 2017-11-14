
(SDEFUN |LEXTRIPK;trueVariables|
        ((|lp| |List|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
         ($ |List| (|Symbol|)))
        (SPROG
         ((|truels| (|List| (|Symbol|))) (#1=#:G713 NIL) (#2=#:G726 NIL)
          (|s| NIL) (|lv| (|List| (|OrderedVariableList| |ls|))))
         (SEQ
          (LETT |lv| (SPADCALL (SPADCALL |lp| (QREFELT $ 10)) (QREFELT $ 12))
                . #3=(|LEXTRIPK;trueVariables|))
          (LETT |truels| NIL . #3#)
          (SEQ (LETT |s| NIL . #3#) (LETT #2# (QREFELT $ 7) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL
                    (PROG2 (LETT #1# (SPADCALL |s| (QREFELT $ 16)) . #3#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0)
                                      (|OrderedVariableList| (QREFELT $ 7))
                                      (|Union|
                                       (|OrderedVariableList| (QREFELT $ 7))
                                       "failed")
                                      #1#))
                    |lv| (QREFELT $ 18))
                   (LETT |truels| (CONS |s| |truels|) . #3#)))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (REVERSE |truels|))))) 

(SDEFUN |LEXTRIPK;zeroDimensional?;LB;2|
        ((|lp| |List|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
         ($ |Boolean|))
        (SPROG
         ((|lq1| (|List| (|Polynomial| R))) (#1=#:G734 NIL) (|p| NIL)
          (#2=#:G733 NIL)
          (|fglmpack|
           (CATEGORY |package|
            (SIGNATURE |zeroDimensional?|
             ((|Boolean|) (|List| (|Polynomial| R))))
            (SIGNATURE |fglmIfCan|
             ((|Union| (|List| (|Polynomial| R)) "failed")
              (|List| (|Polynomial| R))))
            (SIGNATURE |groebner|
             ((|List| (|Polynomial| R)) (|List| (|Polynomial| R))))))
          (|truels| (|List| (|Symbol|))))
         (SEQ
          (LETT |truels| (|LEXTRIPK;trueVariables| |lp| $)
                . #3=(|LEXTRIPK;zeroDimensional?;LB;2|))
          (LETT |fglmpack| (|FGLMIfCanPackage| (QREFELT $ 6) |truels|) . #3#)
          (LETT |lq1|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 21)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (SPADCALL |lq1|
                     (|compiledLookupCheck| '|zeroDimensional?|
                                            (LIST (LIST '|Boolean|)
                                                  (LIST '|List|
                                                        (LIST '|Polynomial|
                                                              (|devaluate|
                                                               (ELT $ 6)))))
                                            |fglmpack|)))))) 

(SDEFUN |LEXTRIPK;fglmIfCan;LU;3|
        ((|lp| |List|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
         ($ |Union|
          (|List|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
          "failed"))
        (SPROG
         ((#1=#:G753 NIL) (|q1| NIL) (#2=#:G752 NIL) (#3=#:G749 NIL)
          (|foo| (|Union| (|List| (|Polynomial| R)) #4="failed"))
          (|lq1| (|List| (|Polynomial| R))) (#5=#:G751 NIL) (|p| NIL)
          (#6=#:G750 NIL)
          (|fglmpack|
           (CATEGORY |package|
            (SIGNATURE |zeroDimensional?|
             ((|Boolean|) (|List| (|Polynomial| R))))
            (SIGNATURE |fglmIfCan|
             ((|Union| (|List| (|Polynomial| R)) "failed")
              (|List| (|Polynomial| R))))
            (SIGNATURE |groebner|
             ((|List| (|Polynomial| R)) (|List| (|Polynomial| R))))))
          (|truels| (|List| (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |truels| (|LEXTRIPK;trueVariables| |lp| $)
                  . #7=(|LEXTRIPK;fglmIfCan;LU;3|))
            (LETT |fglmpack| (|FGLMIfCanPackage| (QREFELT $ 6) |truels|) . #7#)
            (LETT |lq1|
                  (PROGN
                   (LETT #6# NIL . #7#)
                   (SEQ (LETT |p| NIL . #7#) (LETT #5# |lp| . #7#) G190
                        (COND
                         ((OR (ATOM #5#)
                              (PROGN (LETT |p| (CAR #5#) . #7#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #6# (CONS (SPADCALL |p| (QREFELT $ 21)) #6#)
                                . #7#)))
                        (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #6#))))
                  . #7#)
            (LETT |foo|
                  (SPADCALL |lq1|
                            (|compiledLookupCheck| '|fglmIfCan|
                                                   (LIST
                                                    (LIST '|Union|
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|Polynomial|
                                                                 (|devaluate|
                                                                  (ELT $ 6))))
                                                          '#4#)
                                                    (LIST '|List|
                                                          (LIST '|Polynomial|
                                                                (|devaluate|
                                                                 (ELT $ 6)))))
                                                   |fglmpack|))
                  . #7#)
            (EXIT
             (COND
              ((QEQCAR |foo| 1)
               (PROGN (LETT #3# (CONS 1 "failed") . #7#) (GO #8=#:G748)))
              ('T
               (SEQ
                (LETT |lp|
                      (PROGN
                       (LETT #2# NIL . #7#)
                       (SEQ (LETT |q1| NIL . #7#) (LETT #1# (QCDR |foo|) . #7#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |q1| (CAR #1#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |q1| (QREFELT $ 23)) #2#)
                                    . #7#)))
                            (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #7#)
                (EXIT (CONS 0 |lp|))))))))
          #8# (EXIT #3#)))) 

(SDEFUN |LEXTRIPK;groebner;2L;4|
        ((|lp| |List|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
         ($ |List|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|))))
        (SPROG
         ((#1=#:G761 NIL) (|q1| NIL) (#2=#:G760 NIL)
          (|lq1| (|List| (|Polynomial| R))) (#3=#:G759 NIL) (|p| NIL)
          (#4=#:G758 NIL)
          (|fglmpack|
           (CATEGORY |package|
            (SIGNATURE |zeroDimensional?|
             ((|Boolean|) (|List| (|Polynomial| R))))
            (SIGNATURE |fglmIfCan|
             ((|Union| (|List| (|Polynomial| R)) "failed")
              (|List| (|Polynomial| R))))
            (SIGNATURE |groebner|
             ((|List| (|Polynomial| R)) (|List| (|Polynomial| R))))))
          (|truels| (|List| (|Symbol|))))
         (SEQ
          (LETT |truels| (|LEXTRIPK;trueVariables| |lp| $)
                . #5=(|LEXTRIPK;groebner;2L;4|))
          (LETT |fglmpack| (|FGLMIfCanPackage| (QREFELT $ 6) |truels|) . #5#)
          (LETT |lq1|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |p| NIL . #5#) (LETT #3# |lp| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |p| (QREFELT $ 21)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |lq1|
                (SPADCALL |lq1|
                          (|compiledLookupCheck| '|groebner|
                                                 (LIST
                                                  (LIST '|List|
                                                        (LIST '|Polynomial|
                                                              (|devaluate|
                                                               (ELT $ 6))))
                                                  (LIST '|List|
                                                        (LIST '|Polynomial|
                                                              (|devaluate|
                                                               (ELT $ 6)))))
                                                 |fglmpack|))
                . #5#)
          (EXIT
           (LETT |lp|
                 (PROGN
                  (LETT #2# NIL . #5#)
                  (SEQ (LETT |q1| NIL . #5#) (LETT #1# |lq1| . #5#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |q1| (CAR #1#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |q1| (QREFELT $ 23)) #2#)
                               . #5#)))
                       (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 . #5#))))) 

(SDEFUN |LEXTRIPK;lexTriangular;LBL;5|
        ((|base| |List|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
         (|norm?| |Boolean|) ($ |List| (|RegularChain| R |ls|)))
        (SPROG
         ((|toSee|
           (|List|
            (|Record|
             (|:| |val|
                  #1=(|List|
                      (|NewSparseMultivariatePolynomial| R
                                                         (|OrderedVariableList|
                                                          |ls|))))
             (|:| |tower| (|RegularChain| R |ls|)))))
          (#2=#:G789 NIL) (|us| (|RegularChain| R |ls|))
          (|newlp|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls|))))
          (|lus| (|List| (|RegularChain| R |ls|)))
          (|newp|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
          (|b| (|Boolean|))
          (|lbwt|
           (|List|
            (|Record| (|:| |val| (|Boolean|))
                      (|:| |tower| (|RegularChain| R |ls|)))))
          (|bwt|
           (|Record| (|:| |val| (|Boolean|))
                     (|:| |tower| (|RegularChain| R |ls|))))
          (|v| (|OrderedVariableList| |ls|)) (|lp| #1#)
          (|p|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
          (|toSave| (|List| (|RegularChain| R |ls|)))
          (|ts| (|RegularChain| R |ls|))
          (|lpwt|
           (|Record|
            (|:| |val|
                 (|List|
                  (|NewSparseMultivariatePolynomial| R
                                                     (|OrderedVariableList|
                                                      |ls|))))
            (|:| |tower| (|RegularChain| R |ls|)))))
         (SEQ
          (LETT |base| (SPADCALL (ELT $ 27) |base| (QREFELT $ 29))
                . #3=(|LEXTRIPK;lexTriangular;LBL;5|))
          (LETT |base| (SPADCALL (ELT $ 30) |base| (QREFELT $ 32)) . #3#)
          (EXIT
           (COND ((SPADCALL (ELT $ 33) |base| (QREFELT $ 34)) NIL)
                 ('T
                  (SEQ (LETT |ts| (SPADCALL (QREFELT $ 36)) . #3#)
                       (LETT |toSee| (LIST (CONS |base| |ts|)) . #3#)
                       (LETT |toSave| NIL . #3#)
                       (SEQ G190
                            (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                            (SEQ (LETT |lpwt| (|SPADfirst| |toSee|) . #3#)
                                 (LETT |toSee| (CDR |toSee|) . #3#)
                                 (LETT |lp| (QCAR |lpwt|) . #3#)
                                 (LETT |ts| (QCDR |lpwt|) . #3#)
                                 (EXIT
                                  (COND
                                   ((NULL |lp|)
                                    (LETT |toSave| (CONS |ts| |toSave|) . #3#))
                                   ('T
                                    (SEQ (LETT |p| (|SPADfirst| |lp|) . #3#)
                                         (LETT |lp| (CDR |lp|) . #3#)
                                         (LETT |v|
                                               (SPADCALL |p| (QREFELT $ 37))
                                               . #3#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |v| |ts| (QREFELT $ 38))
                                            (|error|
                                             "lexTriangular$LEXTRIPK: should never happen !"))
                                           ('T
                                            (SEQ
                                             (COND
                                              (|norm?|
                                               (COND
                                                ((SPADCALL
                                                  (QVELT
                                                   (SPADCALL
                                                    (SPADCALL |p|
                                                              (QREFELT $ 39))
                                                    |ts| (QREFELT $ 41))
                                                   1)
                                                  (QREFELT $ 30))
                                                 (EXIT
                                                  (LETT |toSee|
                                                        (CONS (CONS |lp| |ts|)
                                                              |toSee|)
                                                        . #3#))))))
                                             (COND
                                              ((NULL |norm?|)
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |p|
                                                             (QREFELT $ 39))
                                                   |ts| (QREFELT $ 42))
                                                  (QREFELT $ 30))
                                                 (EXIT
                                                  (LETT |toSee|
                                                        (CONS (CONS |lp| |ts|)
                                                              |toSee|)
                                                        . #3#))))))
                                             (LETT |lbwt|
                                                   (SPADCALL
                                                    (SPADCALL |p|
                                                              (QREFELT $ 39))
                                                    |ts| (QREFELT $ 45))
                                                   . #3#)
                                             (EXIT
                                              (SEQ G190
                                                   (COND
                                                    ((NULL
                                                      (NULL (NULL |lbwt|)))
                                                     (GO G191)))
                                                   (SEQ
                                                    (LETT |bwt|
                                                          (|SPADfirst| |lbwt|)
                                                          . #3#)
                                                    (LETT |lbwt| (CDR |lbwt|)
                                                          . #3#)
                                                    (LETT |b| (QCAR |bwt|)
                                                          . #3#)
                                                    (LETT |us| (QCDR |bwt|)
                                                          . #3#)
                                                    (EXIT
                                                     (COND
                                                      (|b|
                                                       (SEQ
                                                        (COND
                                                         (|norm?|
                                                          (SEQ
                                                           (LETT |newp|
                                                                 (SPADCALL |p|
                                                                           |us|
                                                                           (QREFELT
                                                                            $
                                                                            47))
                                                                 . #3#)
                                                           (EXIT
                                                            (LETT |lus|
                                                                  (LIST
                                                                   (SPADCALL
                                                                    |newp| |us|
                                                                    (QREFELT $
                                                                             48)))
                                                                  . #3#))))
                                                         ('T
                                                          (SEQ
                                                           (LETT |newp| |p|
                                                                 . #3#)
                                                           (EXIT
                                                            (LETT |lus|
                                                                  (SPADCALL
                                                                   |newp| |us|
                                                                   (QREFELT $
                                                                            50))
                                                                  . #3#)))))
                                                        (LETT |newlp| |lp|
                                                              . #3#)
                                                        (SEQ G190
                                                             (COND
                                                              ((NULL
                                                                (COND
                                                                 ((NULL
                                                                   |newlp|)
                                                                  NIL)
                                                                 ('T
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (|SPADfirst|
                                                                     |newlp|)
                                                                    (QREFELT $
                                                                             37))
                                                                   |v|
                                                                   (QREFELT $
                                                                            51)))))
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (LETT |newlp|
                                                                     (CDR
                                                                      |newlp|)
                                                                     . #3#)))
                                                             NIL (GO G190) G191
                                                             (EXIT NIL))
                                                        (EXIT
                                                         (SEQ
                                                          (LETT |us| NIL . #3#)
                                                          (LETT #2# |lus|
                                                                . #3#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #2#)
                                                                (PROGN
                                                                 (LETT |us|
                                                                       (CAR
                                                                        #2#)
                                                                       . #3#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT |toSee|
                                                                  (CONS
                                                                   (CONS
                                                                    |newlp|
                                                                    |us|)
                                                                   |toSee|)
                                                                  . #3#)))
                                                          (LETT #2# (CDR #2#)
                                                                . #3#)
                                                          (GO G190) G191
                                                          (EXIT NIL)))))
                                                      ('T
                                                       (LETT |toSee|
                                                             (CONS
                                                              (CONS |lp| |us|)
                                                              |toSee|)
                                                             . #3#)))))
                                                   NIL (GO G190) G191
                                                   (EXIT NIL))))))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (SPADCALL |toSave| (QREFELT $ 54)))))))))) 

(SDEFUN |LEXTRIPK;zeroSetSplit;LBL;6|
        ((|lp| |List|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
         (|norm?| |Boolean|) ($ |List| (|RegularChain| R |ls|)))
        (SPROG
         ((|bar|
           (|Union|
            (|List|
             (|NewSparseMultivariatePolynomial| R
                                                (|OrderedVariableList| |ls|)))
            "failed")))
         (SEQ
          (LETT |bar| (SPADCALL |lp| (QREFELT $ 25))
                |LEXTRIPK;zeroSetSplit;LBL;6|)
          (EXIT
           (COND
            ((QEQCAR |bar| 1)
             (|error| "zeroSetSplit$LEXTRIPK: #1 not zero-dimensional"))
            ('T (SPADCALL (QCDR |bar|) |norm?| (QREFELT $ 55)))))))) 

(SDEFUN |LEXTRIPK;squareFreeLexTriangular;LBL;7|
        ((|base| |List|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
         (|norm?| |Boolean|)
         ($ |List|
          (|SquareFreeRegularTriangularSet| R
                                            (|IndexedExponents|
                                             (|OrderedVariableList| |ls|))
                                            (|OrderedVariableList| |ls|)
                                            (|NewSparseMultivariatePolynomial|
                                             R (|OrderedVariableList| |ls|)))))
        (SPROG
         ((|toSee|
           (|List|
            (|Record|
             (|:| |val|
                  #1=(|List|
                      (|NewSparseMultivariatePolynomial| R
                                                         (|OrderedVariableList|
                                                          |ls|))))
             (|:| |tower|
                  (|SquareFreeRegularTriangularSet| R
                                                    (|IndexedExponents|
                                                     (|OrderedVariableList|
                                                      |ls|))
                                                    (|OrderedVariableList|
                                                     |ls|)
                                                    (|NewSparseMultivariatePolynomial|
                                                     R
                                                     (|OrderedVariableList|
                                                      |ls|)))))))
          (#2=#:G821 NIL)
          (|us|
           (|SquareFreeRegularTriangularSet| R
                                             (|IndexedExponents|
                                              (|OrderedVariableList| |ls|))
                                             (|OrderedVariableList| |ls|)
                                             (|NewSparseMultivariatePolynomial|
                                              R (|OrderedVariableList| |ls|))))
          (|newlp|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls|))))
          (|lus|
           (|List|
            (|SquareFreeRegularTriangularSet| R
                                              (|IndexedExponents|
                                               (|OrderedVariableList| |ls|))
                                              (|OrderedVariableList| |ls|)
                                              (|NewSparseMultivariatePolynomial|
                                               R
                                               (|OrderedVariableList| |ls|)))))
          (|newp|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
          (|b| (|Boolean|))
          (|lbwt|
           (|List|
            (|Record| (|:| |val| (|Boolean|))
                      (|:| |tower|
                           (|SquareFreeRegularTriangularSet| R
                                                             (|IndexedExponents|
                                                              (|OrderedVariableList|
                                                               |ls|))
                                                             (|OrderedVariableList|
                                                              |ls|)
                                                             (|NewSparseMultivariatePolynomial|
                                                              R
                                                              (|OrderedVariableList|
                                                               |ls|)))))))
          (|bwt|
           (|Record| (|:| |val| (|Boolean|))
                     (|:| |tower|
                          (|SquareFreeRegularTriangularSet| R
                                                            (|IndexedExponents|
                                                             (|OrderedVariableList|
                                                              |ls|))
                                                            (|OrderedVariableList|
                                                             |ls|)
                                                            (|NewSparseMultivariatePolynomial|
                                                             R
                                                             (|OrderedVariableList|
                                                              |ls|))))))
          (|v| (|OrderedVariableList| |ls|)) (|lp| #1#)
          (|p|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
          (|toSave|
           (|List|
            (|SquareFreeRegularTriangularSet| R
                                              (|IndexedExponents|
                                               (|OrderedVariableList| |ls|))
                                              (|OrderedVariableList| |ls|)
                                              (|NewSparseMultivariatePolynomial|
                                               R
                                               (|OrderedVariableList| |ls|)))))
          (|ts|
           (|SquareFreeRegularTriangularSet| R
                                             (|IndexedExponents|
                                              (|OrderedVariableList| |ls|))
                                             (|OrderedVariableList| |ls|)
                                             (|NewSparseMultivariatePolynomial|
                                              R (|OrderedVariableList| |ls|))))
          (|lpwt|
           (|Record|
            (|:| |val|
                 (|List|
                  (|NewSparseMultivariatePolynomial| R
                                                     (|OrderedVariableList|
                                                      |ls|))))
            (|:| |tower|
                 (|SquareFreeRegularTriangularSet| R
                                                   (|IndexedExponents|
                                                    (|OrderedVariableList|
                                                     |ls|))
                                                   (|OrderedVariableList| |ls|)
                                                   (|NewSparseMultivariatePolynomial|
                                                    R
                                                    (|OrderedVariableList|
                                                     |ls|)))))))
         (SEQ
          (LETT |base| (SPADCALL (ELT $ 27) |base| (QREFELT $ 29))
                . #3=(|LEXTRIPK;squareFreeLexTriangular;LBL;7|))
          (LETT |base| (SPADCALL (ELT $ 30) |base| (QREFELT $ 32)) . #3#)
          (EXIT
           (COND ((SPADCALL (ELT $ 33) |base| (QREFELT $ 34)) NIL)
                 ('T
                  (SEQ (LETT |ts| (SPADCALL (QREFELT $ 58)) . #3#)
                       (LETT |toSee| (LIST (CONS |base| |ts|)) . #3#)
                       (LETT |toSave| NIL . #3#)
                       (SEQ G190
                            (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                            (SEQ (LETT |lpwt| (|SPADfirst| |toSee|) . #3#)
                                 (LETT |toSee| (CDR |toSee|) . #3#)
                                 (LETT |lp| (QCAR |lpwt|) . #3#)
                                 (LETT |ts| (QCDR |lpwt|) . #3#)
                                 (EXIT
                                  (COND
                                   ((NULL |lp|)
                                    (LETT |toSave| (CONS |ts| |toSave|) . #3#))
                                   ('T
                                    (SEQ (LETT |p| (|SPADfirst| |lp|) . #3#)
                                         (LETT |lp| (CDR |lp|) . #3#)
                                         (LETT |v|
                                               (SPADCALL |p| (QREFELT $ 37))
                                               . #3#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |v| |ts| (QREFELT $ 59))
                                            (|error|
                                             "lexTriangular$LEXTRIPK: should never happen !"))
                                           ('T
                                            (SEQ
                                             (COND
                                              (|norm?|
                                               (COND
                                                ((SPADCALL
                                                  (QVELT
                                                   (SPADCALL
                                                    (SPADCALL |p|
                                                              (QREFELT $ 39))
                                                    |ts| (QREFELT $ 60))
                                                   1)
                                                  (QREFELT $ 30))
                                                 (EXIT
                                                  (LETT |toSee|
                                                        (CONS (CONS |lp| |ts|)
                                                              |toSee|)
                                                        . #3#))))))
                                             (COND
                                              ((NULL |norm?|)
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |p|
                                                             (QREFELT $ 39))
                                                   |ts| (QREFELT $ 61))
                                                  (QREFELT $ 30))
                                                 (EXIT
                                                  (LETT |toSee|
                                                        (CONS (CONS |lp| |ts|)
                                                              |toSee|)
                                                        . #3#))))))
                                             (LETT |lbwt|
                                                   (SPADCALL
                                                    (SPADCALL |p|
                                                              (QREFELT $ 39))
                                                    |ts| (QREFELT $ 62))
                                                   . #3#)
                                             (EXIT
                                              (SEQ G190
                                                   (COND
                                                    ((NULL
                                                      (NULL (NULL |lbwt|)))
                                                     (GO G191)))
                                                   (SEQ
                                                    (LETT |bwt|
                                                          (|SPADfirst| |lbwt|)
                                                          . #3#)
                                                    (LETT |lbwt| (CDR |lbwt|)
                                                          . #3#)
                                                    (LETT |b| (QCAR |bwt|)
                                                          . #3#)
                                                    (LETT |us| (QCDR |bwt|)
                                                          . #3#)
                                                    (EXIT
                                                     (COND
                                                      (|b|
                                                       (SEQ
                                                        (COND
                                                         (|norm?|
                                                          (SEQ
                                                           (LETT |newp|
                                                                 (SPADCALL |p|
                                                                           |us|
                                                                           (QREFELT
                                                                            $
                                                                            64))
                                                                 . #3#)
                                                           (EXIT
                                                            (LETT |lus|
                                                                  (SPADCALL
                                                                   |newp| |us|
                                                                   (QREFELT $
                                                                            65))
                                                                  . #3#))))
                                                         ('T
                                                          (LETT |lus|
                                                                (SPADCALL |p|
                                                                          |us|
                                                                          (QREFELT
                                                                           $
                                                                           65))
                                                                . #3#)))
                                                        (LETT |newlp| |lp|
                                                              . #3#)
                                                        (SEQ G190
                                                             (COND
                                                              ((NULL
                                                                (COND
                                                                 ((NULL
                                                                   |newlp|)
                                                                  NIL)
                                                                 ('T
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (|SPADfirst|
                                                                     |newlp|)
                                                                    (QREFELT $
                                                                             37))
                                                                   |v|
                                                                   (QREFELT $
                                                                            51)))))
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (LETT |newlp|
                                                                     (CDR
                                                                      |newlp|)
                                                                     . #3#)))
                                                             NIL (GO G190) G191
                                                             (EXIT NIL))
                                                        (EXIT
                                                         (SEQ
                                                          (LETT |us| NIL . #3#)
                                                          (LETT #2# |lus|
                                                                . #3#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #2#)
                                                                (PROGN
                                                                 (LETT |us|
                                                                       (CAR
                                                                        #2#)
                                                                       . #3#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT |toSee|
                                                                  (CONS
                                                                   (CONS
                                                                    |newlp|
                                                                    |us|)
                                                                   |toSee|)
                                                                  . #3#)))
                                                          (LETT #2# (CDR #2#)
                                                                . #3#)
                                                          (GO G190) G191
                                                          (EXIT NIL)))))
                                                      ('T
                                                       (LETT |toSee|
                                                             (CONS
                                                              (CONS |lp| |us|)
                                                              |toSee|)
                                                             . #3#)))))
                                                   NIL (GO G190) G191
                                                   (EXIT NIL))))))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (SPADCALL |toSave| (QREFELT $ 68)))))))))) 

(SDEFUN |LEXTRIPK;zeroSetSplit;LBL;8|
        ((|lp| |List|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
         (|norm?| |Boolean|)
         ($ |List|
          (|SquareFreeRegularTriangularSet| R
                                            (|IndexedExponents|
                                             (|OrderedVariableList| |ls|))
                                            (|OrderedVariableList| |ls|)
                                            (|NewSparseMultivariatePolynomial|
                                             R (|OrderedVariableList| |ls|)))))
        (SPROG
         ((|bar|
           (|Union|
            (|List|
             (|NewSparseMultivariatePolynomial| R
                                                (|OrderedVariableList| |ls|)))
            "failed")))
         (SEQ
          (LETT |bar| (SPADCALL |lp| (QREFELT $ 25))
                |LEXTRIPK;zeroSetSplit;LBL;8|)
          (EXIT
           (COND
            ((QEQCAR |bar| 1)
             (|error| "zeroSetSplit$LEXTRIPK: #1 not zero-dimensional"))
            ('T (SPADCALL (QCDR |bar|) |norm?| (QREFELT $ 69)))))))) 

(DECLAIM (NOTINLINE |LexTriangularPackage;|)) 

(DEFUN |LexTriangularPackage| (&REST #1=#:G827)
  (SPROG NIL
         (PROG (#2=#:G828)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LexTriangularPackage|)
                                               '|domainEqualList|)
                    . #3=(|LexTriangularPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LexTriangularPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LexTriangularPackage|)))))))))) 

(DEFUN |LexTriangularPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LexTriangularPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LexTriangularPackage| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 71) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|LexTriangularPackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|LexTriangularPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 20)
              (|GeneralPolynomialSet| 6 (|IndexedExponents| 15) 15 20)
              (0 . |construct|) (|List| 15) (5 . |variables|)
              (|Union| $ '"failed") (|Symbol|)
              (|OrderedVariableList| (NRTEVAL (QREFELT $ 7))) (10 . |variable|)
              (|Boolean|) (15 . |member?|) (|Polynomial| 6)
              (|NewSparseMultivariatePolynomial| 6 15) (21 . |coerce|)
              |LEXTRIPK;zeroDimensional?;LB;2| (26 . |retract|)
              (|Union| 8 '"failed") |LEXTRIPK;fglmIfCan;LU;3|
              |LEXTRIPK;groebner;2L;4| (31 . |infRittWu?|) (|Mapping| 17 20 20)
              (37 . |sort|) (43 . |zero?|) (|Mapping| 17 20) (48 . |remove|)
              (54 . |ground?|) (59 . |any?|)
              (|RegularChain| 6 (NRTEVAL (QREFELT $ 7))) (65 . |empty|)
              (69 . |mvar|) (74 . |algebraic?|) (80 . |init|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 20) (|:| |den| 6))
              (85 . |remainder|) (91 . |initiallyReduce|)
              (|Record| (|:| |val| 17) (|:| |tower| $)) (|List| 43)
              (97 . |invertible?|)
              (|NormalizationPackage| 6 (|IndexedExponents| 15) 15 20 35)
              (103 . |normalizedAssociate|) (109 . |internalAugment|)
              (|List| $) (115 . |augment|) (121 . =) (|List| 35)
              (|QuasiComponentPackage| 6 (|IndexedExponents| 15) 15 20 35)
              (127 . |algebraicSort|) |LEXTRIPK;lexTriangular;LBL;5|
              |LEXTRIPK;zeroSetSplit;LBL;6|
              (|SquareFreeRegularTriangularSet| 6 (|IndexedExponents| 15) 15
                                                20)
              (132 . |empty|) (136 . |algebraic?|) (142 . |remainder|)
              (148 . |initiallyReduce|) (154 . |invertible?|)
              (|NormalizationPackage| 6 (|IndexedExponents| 15) 15 20 57)
              (160 . |normalizedAssociate|) (166 . |augment|) (|List| 57)
              (|QuasiComponentPackage| 6 (|IndexedExponents| 15) 15 20 57)
              (172 . |algebraicSort|) |LEXTRIPK;squareFreeLexTriangular;LBL;7|
              |LEXTRIPK;zeroSetSplit;LBL;8|)
           '#(|zeroSetSplit| 177 |zeroDimensional?| 189
              |squareFreeLexTriangular| 194 |lexTriangular| 200 |groebner| 206
              |fglmIfCan| 211)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 70
                                                 '(1 9 0 8 10 1 9 11 0 12 1 15
                                                   13 14 16 2 11 17 15 0 18 1
                                                   20 19 0 21 1 20 0 19 23 2 20
                                                   17 0 0 27 2 8 0 28 0 29 1 20
                                                   17 0 30 2 8 0 31 0 32 1 20
                                                   17 0 33 2 8 17 31 0 34 0 35
                                                   0 36 1 20 15 0 37 2 35 17 15
                                                   0 38 1 20 0 0 39 2 35 40 20
                                                   0 41 2 35 20 20 0 42 2 35 44
                                                   20 0 45 2 46 20 20 35 47 2
                                                   35 0 20 0 48 2 35 49 20 0 50
                                                   2 15 17 0 0 51 1 53 52 52 54
                                                   0 57 0 58 2 57 17 15 0 59 2
                                                   57 40 20 0 60 2 57 20 20 0
                                                   61 2 57 44 20 0 62 2 63 20
                                                   20 57 64 2 57 49 20 0 65 1
                                                   67 66 66 68 2 0 66 8 17 70 2
                                                   0 52 8 17 56 1 0 17 8 22 2 0
                                                   66 8 17 69 2 0 52 8 17 55 1
                                                   0 8 8 26 1 0 24 8 25)))))
           '|lookupComplete|)) 
