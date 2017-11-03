
(SDEFUN |ZDSOLVE;convert;NsmpNsmp;1|
        ((|q| |NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|))
         ($ |NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
        (SPROG
         ((|q2|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (|lq2|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (|iq2|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (|v2| (|OrderedVariableList| |ls2|)) (#1=#:G732 NIL)
          (|d| (|NonNegativeInteger|)) (|v| (|OrderedVariableList| |ls|)))
         (SEQ
          (COND
           ((SPADCALL |q| (QREFELT $ 22))
            (SPADCALL (SPADCALL |q| (QREFELT $ 23)) (QREFELT $ 24)))
           ('T
            (SEQ
             (LETT |q2| (|spadConstant| $ 25)
                   . #2=(|ZDSOLVE;convert;NsmpNsmp;1|))
             (SEQ G190
                  (COND
                   ((NULL (NULL (SPADCALL |q| (QREFELT $ 22)))) (GO G191)))
                  (SEQ (LETT |v| (SPADCALL |q| (QREFELT $ 27)) . #2#)
                       (LETT |d| (SPADCALL |q| (QREFELT $ 29)) . #2#)
                       (LETT |v2|
                             (PROG2
                                 (LETT #1#
                                       (SPADCALL (SPADCALL |v| (QREFELT $ 30))
                                                 (QREFELT $ 15))
                                       . #2#)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0)
                                               (|OrderedVariableList|
                                                (QREFELT $ 8))
                                               (|Union|
                                                (|OrderedVariableList|
                                                 (QREFELT $ 8))
                                                "failed")
                                               #1#))
                             . #2#)
                       (LETT |iq2|
                             (SPADCALL (SPADCALL |q| (QREFELT $ 31))
                                       (QREFELT $ 32))
                             . #2#)
                       (LETT |lq2| (SPADCALL |v2| (QREFELT $ 18)) . #2#)
                       (LETT |lq2| (SPADCALL |lq2| |d| (QREFELT $ 33)) . #2#)
                       (LETT |q2|
                             (SPADCALL (SPADCALL |iq2| |lq2| (QREFELT $ 34))
                                       |q2| (QREFELT $ 35))
                             . #2#)
                       (EXIT (LETT |q| (SPADCALL |q| (QREFELT $ 36)) . #2#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL |q2|
                        (SPADCALL (SPADCALL |q| (QREFELT $ 23)) (QREFELT $ 24))
                        (QREFELT $ 35))))))))) 

(SDEFUN |ZDSOLVE;squareFree;RcL;2|
        ((|ts| |RegularChain| R |ls|)
         ($ |List|
          (|SquareFreeRegularTriangularSet| R
                                            (|IndexedExponents|
                                             (|OrderedVariableList| |ls2|))
                                            (|OrderedVariableList| |ls2|)
                                            (|NewSparseMultivariatePolynomial|
                                             R
                                             (|OrderedVariableList| |ls2|)))))
        (SPROG
         ((|toSee|
           (|List|
            (|Record|
             (|:| |val|
                  (|List|
                   (|NewSparseMultivariatePolynomial| R
                                                      (|OrderedVariableList|
                                                       |ls2|))))
             (|:| |tower|
                  (|SquareFreeRegularTriangularSet| R
                                                    (|IndexedExponents|
                                                     (|OrderedVariableList|
                                                      |ls2|))
                                                    (|OrderedVariableList|
                                                     |ls2|)
                                                    (|NewSparseMultivariatePolynomial|
                                                     R
                                                     (|OrderedVariableList|
                                                      |ls2|)))))))
          (|newlq|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls2|))))
          (#1=#:G765 NIL)
          (|q|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (#2=#:G764 NIL)
          (|newts|
           (|SquareFreeRegularTriangularSet| R
                                             (|IndexedExponents|
                                              (|OrderedVariableList| |ls2|))
                                             (|OrderedVariableList| |ls2|)
                                             (|NewSparseMultivariatePolynomial|
                                              R
                                              (|OrderedVariableList| |ls2|))))
          (|st|
           (|SquareFreeRegularTriangularSet| R
                                             (|IndexedExponents|
                                              (|OrderedVariableList| |ls2|))
                                             (|OrderedVariableList| |ls2|)
                                             (|NewSparseMultivariatePolynomial|
                                              R
                                              (|OrderedVariableList| |ls2|))))
          (#3=#:G763 NIL) (|sfqwt| NIL)
          (|lsfqwt|
           (|List|
            (|Record|
             (|:| |val|
                  (|NewSparseMultivariatePolynomial| R
                                                     (|OrderedVariableList|
                                                      |ls2|)))
             (|:| |tower|
                  (|SquareFreeRegularTriangularSet| R
                                                    (|IndexedExponents|
                                                     (|OrderedVariableList|
                                                      |ls2|))
                                                    (|OrderedVariableList|
                                                     |ls2|)
                                                    (|NewSparseMultivariatePolynomial|
                                                     R
                                                     (|OrderedVariableList|
                                                      |ls2|)))))))
          (|lq|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls2|))))
          (|toSave|
           (|List|
            (|SquareFreeRegularTriangularSet| R
                                              (|IndexedExponents|
                                               (|OrderedVariableList| |ls2|))
                                              (|OrderedVariableList| |ls2|)
                                              (|NewSparseMultivariatePolynomial|
                                               R
                                               (|OrderedVariableList|
                                                |ls2|)))))
          (|lqwt|
           (|Record|
            (|:| |val|
                 (|List|
                  (|NewSparseMultivariatePolynomial| R
                                                     (|OrderedVariableList|
                                                      |ls2|))))
            (|:| |tower|
                 (|SquareFreeRegularTriangularSet| R
                                                   (|IndexedExponents|
                                                    (|OrderedVariableList|
                                                     |ls2|))
                                                   (|OrderedVariableList|
                                                    |ls2|)
                                                   (|NewSparseMultivariatePolynomial|
                                                    R
                                                    (|OrderedVariableList|
                                                     |ls2|))))))
          (#4=#:G762 NIL) (|f| NIL)
          (|lf|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls2|))))
          (#5=#:G761 NIL) (|p| NIL) (#6=#:G760 NIL) (|irred?| (|Boolean|)))
         (SEQ (LETT |irred?| NIL . #7=(|ZDSOLVE;squareFree;RcL;2|))
              (LETT |st| (SPADCALL (LIST (QREFELT $ 19)) (QREFELT $ 39)) . #7#)
              (LETT |lq|
                    (PROGN
                     (LETT #6# NIL . #7#)
                     (SEQ (LETT |p| NIL . #7#)
                          (LETT #5# (SPADCALL |ts| (QREFELT $ 42)) . #7#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |p| (CAR #5#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6# (CONS (SPADCALL |p| (QREFELT $ 32)) #6#)
                                  . #7#)))
                          (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #7#)
              (LETT |lq| (SPADCALL (ELT $ 43) |lq| (QREFELT $ 45)) . #7#)
              (LETT |toSee| NIL . #7#)
              (COND
               (|irred?|
                (SEQ
                 (LETT |lf| (SPADCALL (LIST (|SPADfirst| |lq|)) (QREFELT $ 47))
                       . #7#)
                 (LETT |lq| (CDR |lq|) . #7#)
                 (EXIT
                  (SEQ (LETT |f| NIL . #7#) (LETT #4# |lf| . #7#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |toSee|
                               (CONS (CONS (CONS |f| |lq|) |st|) |toSee|)
                               . #7#)))
                       (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL)))))
               ('T (LETT |toSee| (LIST (CONS |lq| |st|)) . #7#)))
              (LETT |toSave| NIL . #7#)
              (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                   (SEQ (LETT |lqwt| (|SPADfirst| |toSee|) . #7#)
                        (LETT |toSee| (CDR |toSee|) . #7#)
                        (LETT |lq| (QCAR |lqwt|) . #7#)
                        (LETT |st| (QCDR |lqwt|) . #7#)
                        (EXIT
                         (COND
                          ((NULL |lq|)
                           (LETT |toSave| (CONS |st| |toSave|) . #7#))
                          ('T
                           (SEQ (LETT |q| (|SPADfirst| |lq|) . #7#)
                                (LETT |lq| (CDR |lq|) . #7#)
                                (LETT |lsfqwt|
                                      (SPADCALL |q| |st| (QREFELT $ 50)) . #7#)
                                (EXIT
                                 (SEQ (LETT |sfqwt| NIL . #7#)
                                      (LETT #3# |lsfqwt| . #7#) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN
                                             (LETT |sfqwt| (CAR #3#) . #7#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ (LETT |q| (QCAR |sfqwt|) . #7#)
                                           (LETT |st| (QCDR |sfqwt|) . #7#)
                                           (COND
                                            ((NULL
                                              (SPADCALL
                                               (SPADCALL |q| (QREFELT $ 51))
                                               (QREFELT $ 52)))
                                             (LETT |q|
                                                   (SPADCALL |q| |st|
                                                             (QREFELT $ 54))
                                                   . #7#)))
                                           (LETT |newts|
                                                 (SPADCALL |q| |st|
                                                           (QREFELT $ 55))
                                                 . #7#)
                                           (LETT |newlq|
                                                 (PROGN
                                                  (LETT #2# NIL . #7#)
                                                  (SEQ (LETT |q| NIL . #7#)
                                                       (LETT #1# |lq| . #7#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #1#)
                                                             (PROGN
                                                              (LETT |q|
                                                                    (CAR #1#)
                                                                    . #7#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #2#
                                                               (CONS
                                                                (QVELT
                                                                 (SPADCALL |q|
                                                                           |newts|
                                                                           (QREFELT
                                                                            $
                                                                            57))
                                                                 1)
                                                                #2#)
                                                               . #7#)))
                                                       (LETT #1# (CDR #1#)
                                                             . #7#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #2#))))
                                                 . #7#)
                                           (EXIT
                                            (LETT |toSee|
                                                  (CONS (CONS |newlq| |newts|)
                                                        |toSee|)
                                                  . #7#)))
                                      (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                                      (EXIT NIL))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;triangSolve;L2BL;3|
        ((|lp| |List| (|Polynomial| R)) (|info?| |Boolean|)
         (|lextri?| |Boolean|) ($ |List| (|RegularChain| R |ls|)))
        (SPROG
         ((|lq|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls|))))
          (#1=#:G773 NIL) (|p| NIL) (#2=#:G772 NIL))
         (SEQ
          (LETT |lq|
                (PROGN
                 (LETT #2# NIL . #3=(|ZDSOLVE;triangSolve;L2BL;3|))
                 (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 61)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND (|lextri?| (SPADCALL |lq| NIL (QREFELT $ 64)))
                 ('T (SPADCALL |lq| 'T |info?| (QREFELT $ 66)))))))) 

(SDEFUN |ZDSOLVE;triangSolve;LBL;4|
        ((|lp| |List| (|Polynomial| R)) (|info?| |Boolean|)
         ($ |List| (|RegularChain| R |ls|)))
        (SPADCALL |lp| |info?| NIL (QREFELT $ 68))) 

(SDEFUN |ZDSOLVE;triangSolve;LL;5|
        ((|lp| |List| (|Polynomial| R)) ($ |List| (|RegularChain| R |ls|)))
        (SPADCALL |lp| NIL (QREFELT $ 69))) 

(SDEFUN |ZDSOLVE;convert;SupSup;6|
        ((|u| |SparseUnivariatePolynomial| R)
         ($ |SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R))))
        (SPROG
         ((|uu| (|SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R)))))
         (SEQ
          (COND ((SPADCALL |u| (QREFELT $ 72)) (|spadConstant| $ 74))
                ((SPADCALL |u| (QREFELT $ 75))
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 76)) (QREFELT $ 78))
                   (QREFELT $ 80))
                  (QREFELT $ 81)))
                ('T
                 (SEQ
                  (LETT |uu| (|spadConstant| $ 74)
                        . #1=(|ZDSOLVE;convert;SupSup;6|))
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |u| (QREFELT $ 75))))
                         (GO G191)))
                       (SEQ
                        (LETT |uu|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |u| (QREFELT $ 82))
                                           (QREFELT $ 78))
                                 (QREFELT $ 80))
                                (SPADCALL |u| (QREFELT $ 83)) (QREFELT $ 84))
                               |uu| (QREFELT $ 85))
                              . #1#)
                        (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 86)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL |uu|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |u| (QREFELT $ 76))
                                         (QREFELT $ 78))
                               (QREFELT $ 80))
                              (QREFELT $ 81))
                             (QREFELT $ 85))))))))) 

(SDEFUN |ZDSOLVE;coerceFromRtoRC| ((|r| R) ($ |RealClosure| (|Fraction| R)))
        (SPADCALL (SPADCALL |r| (QREFELT $ 78)) (QREFELT $ 80))) 

(SDEFUN |ZDSOLVE;convert;PP;8|
        ((|p| |Polynomial| R) ($ |Polynomial| (|RealClosure| (|Fraction| R))))
        (SPADCALL (CONS (|function| |ZDSOLVE;coerceFromRtoRC|) $) |p|
                  (QREFELT $ 91))) 

(SDEFUN |ZDSOLVE;convert;NsmpP;9|
        ((|q2| |NewSparseMultivariatePolynomial| R
          (|OrderedVariableList| |ls2|))
         ($ |Polynomial| (|RealClosure| (|Fraction| R))))
        (SPROG ((|p| (|Polynomial| R)))
               (SEQ
                (LETT |p| (SPADCALL |q2| (QREFELT $ 93))
                      |ZDSOLVE;convert;NsmpP;9|)
                (EXIT (SPADCALL |p| (QREFELT $ 92)))))) 

(SDEFUN |ZDSOLVE;convert;SfrtsL;10|
        ((|sts| |SquareFreeRegularTriangularSet| R
          (|IndexedExponents| (|OrderedVariableList| |ls2|))
          (|OrderedVariableList| |ls2|)
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
         ($ |List|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|))))
        (SPROG
         ((|lq2|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList|
                                                |ls2|)))))
         (SEQ
          (LETT |lq2| (SPADCALL |sts| (QREFELT $ 95))
                . #1=(|ZDSOLVE;convert;SfrtsL;10|))
          (LETT |lq2| (SPADCALL (ELT $ 43) |lq2| (QREFELT $ 45)) . #1#)
          (EXIT (CDR |lq2|))))) 

(SDEFUN |ZDSOLVE;realSolve;RcL;11|
        ((|ts| |RegularChain| R |ls|)
         ($ |List| (|List| (|RealClosure| (|Fraction| R)))))
        (SPROG
         ((|toSee|
           (|List|
            (|Record| (|:| |reals| (|List| (|RealClosure| (|Fraction| R))))
                      (|:| |vars| (|List| (|Symbol|)))
                      (|:| |pols|
                           #1=(|List|
                               (|NewSparseMultivariatePolynomial| R
                                                                  (|OrderedVariableList|
                                                                   |ls2|)))))))
          (#2=#:G819 NIL) (|urcRoot| NIL)
          (|urcRoots| (|List| (|RealClosure| (|Fraction| R))))
          (|urc| (|SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R))))
          (|lv| (|List| (|Symbol|))) (#3=#:G808 NIL)
          (|qrc| (|Polynomial| (|RealClosure| (|Fraction| R)))) (#4=#:G817 NIL)
          (|r| NIL) (#5=#:G818 NIL) (|v| NIL) (|lq2| #1#)
          (|q2|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (|toSave| (|List| (|List| (|RealClosure| (|Fraction| R)))))
          (|lr| (|List| (|RealClosure| (|Fraction| R))))
          (|wip|
           (|Record| (|:| |reals| (|List| (|RealClosure| (|Fraction| R))))
                     (|:| |vars| (|List| (|Symbol|)))
                     (|:| |pols|
                          (|List|
                           (|NewSparseMultivariatePolynomial| R
                                                              (|OrderedVariableList|
                                                               |ls2|))))))
          (#6=#:G816 NIL) (|sts| NIL) (#7=#:G815 NIL)
          (|lsts|
           (|List|
            (|SquareFreeRegularTriangularSet| R
                                              (|IndexedExponents|
                                               (|OrderedVariableList| |ls2|))
                                              (|OrderedVariableList| |ls2|)
                                              (|NewSparseMultivariatePolynomial|
                                               R
                                               (|OrderedVariableList|
                                                |ls2|))))))
         (SEQ
          (LETT |lsts| (SPADCALL |ts| (QREFELT $ 59))
                . #8=(|ZDSOLVE;realSolve;RcL;11|))
          (LETT |lr| NIL . #8#) (LETT |lv| NIL . #8#)
          (LETT |toSee|
                (PROGN
                 (LETT #7# NIL . #8#)
                 (SEQ (LETT |sts| NIL . #8#) (LETT #6# |lsts| . #8#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |sts| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (VECTOR |lr| |lv|
                                       (SPADCALL |sts| (QREFELT $ 96)))
                               #7#)
                              . #8#)))
                      (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #8#)
          (LETT |toSave| NIL . #8#)
          (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
               (SEQ (LETT |wip| (|SPADfirst| |toSee|) . #8#)
                    (LETT |toSee| (CDR |toSee|) . #8#)
                    (LETT |lr| (QVELT |wip| 0) . #8#)
                    (LETT |lv| (QVELT |wip| 1) . #8#)
                    (LETT |lq2| (QVELT |wip| 2) . #8#)
                    (COND
                     ((NULL |lq2|)
                      (COND
                       ((NULL (NULL |lr|))
                        (EXIT
                         (LETT |toSave| (CONS (REVERSE |lr|) |toSave|)
                               . #8#))))))
                    (LETT |q2| (|SPADfirst| |lq2|) . #8#)
                    (LETT |lq2| (CDR |lq2|) . #8#)
                    (LETT |qrc| (SPADCALL |q2| (QREFELT $ 94)) . #8#)
                    (COND
                     ((NULL (NULL |lr|))
                      (SEQ (LETT |v| NIL . #8#) (LETT #5# (REVERSE |lv|) . #8#)
                           (LETT |r| NIL . #8#) (LETT #4# (REVERSE |lr|) . #8#)
                           G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |r| (CAR #4#) . #8#) NIL)
                                 (ATOM #5#)
                                 (PROGN (LETT |v| (CAR #5#) . #8#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |qrc|
                                   (SPADCALL |qrc| |v| |r| (QREFELT $ 97))
                                   . #8#)))
                           (LETT #4#
                                 (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #8#))
                                 . #8#)
                           (GO G190) G191 (EXIT NIL))))
                    (LETT |lv|
                          (CONS
                           (PROG2
                               (LETT #3# (SPADCALL |qrc| (QREFELT $ 99)) . #8#)
                               (QCDR #3#)
                             (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                             (|Union| (|Symbol|) "failed")
                                             #3#))
                           |lv|)
                          . #8#)
                    (LETT |urc| (SPADCALL |qrc| (QREFELT $ 100)) . #8#)
                    (LETT |urcRoots| (SPADCALL |urc| (QREFELT $ 102)) . #8#)
                    (EXIT
                     (SEQ (LETT |urcRoot| NIL . #8#)
                          (LETT #2# |urcRoots| . #8#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |urcRoot| (CAR #2#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |toSee|
                                  (CONS
                                   (VECTOR (CONS |urcRoot| |lr|) |lv| |lq2|)
                                   |toSee|)
                                  . #8#)))
                          (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;realSolve;L3BL;12|
        ((|lp| |List| (|Polynomial| R)) (|info?| |Boolean|)
         (|check?| |Boolean|) (|lextri?| |Boolean|)
         ($ |List| (|List| (|RealClosure| (|Fraction| R)))))
        (SPROG
         ((#1=#:G849 NIL) (|prc| (|Polynomial| (|RealClosure| (|Fraction| R))))
          (#2=#:G860 NIL) (|rr| NIL) (#3=#:G861 NIL) (|symb| NIL)
          (#4=#:G859 NIL) (|realsol| NIL) (#5=#:G858 NIL) (|p| NIL)
          (|toSee|
           (|List|
            (|Record| (|:| |reals| (|List| (|RealClosure| (|Fraction| R))))
                      (|:| |vars| (|List| (|Symbol|)))
                      (|:| |pols|
                           #6=(|List|
                               (|NewSparseMultivariatePolynomial| R
                                                                  (|OrderedVariableList|
                                                                   |ls2|)))))))
          (#7=#:G857 NIL) (|urcRoot| NIL)
          (|urcRoots| (|List| (|RealClosure| (|Fraction| R))))
          (|urc| (|SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R))))
          (|lv| (|List| (|Symbol|))) (#8=#:G838 NIL)
          (|qrc| (|Polynomial| (|RealClosure| (|Fraction| R)))) (#9=#:G855 NIL)
          (|r| NIL) (#10=#:G856 NIL) (|v| NIL) (|lq2| #6#)
          (|q2|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (|toSave| (|List| (|List| (|RealClosure| (|Fraction| R)))))
          (|lr| (|List| (|RealClosure| (|Fraction| R))))
          (|wip|
           (|Record| (|:| |reals| (|List| (|RealClosure| (|Fraction| R))))
                     (|:| |vars| (|List| (|Symbol|)))
                     (|:| |pols|
                          (|List|
                           (|NewSparseMultivariatePolynomial| R
                                                              (|OrderedVariableList|
                                                               |ls2|))))))
          (#11=#:G854 NIL) (|sts| NIL) (#12=#:G853 NIL)
          (|lsts|
           (|List|
            (|SquareFreeRegularTriangularSet| R
                                              (|IndexedExponents|
                                               (|OrderedVariableList| |ls2|))
                                              (|OrderedVariableList| |ls2|)
                                              (|NewSparseMultivariatePolynomial|
                                               R
                                               (|OrderedVariableList|
                                                |ls2|)))))
          (#13=#:G852 NIL) (|ts| NIL) (|lts| (|List| (|RegularChain| R |ls|)))
          (|lq|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls|))))
          (#14=#:G851 NIL) (#15=#:G850 NIL))
         (SEQ
          (LETT |lq|
                (PROGN
                 (LETT #15# NIL . #16=(|ZDSOLVE;realSolve;L3BL;12|))
                 (SEQ (LETT |p| NIL . #16#) (LETT #14# |lp| . #16#) G190
                      (COND
                       ((OR (ATOM #14#)
                            (PROGN (LETT |p| (CAR #14#) . #16#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #15# (CONS (SPADCALL |p| (QREFELT $ 61)) #15#)
                              . #16#)))
                      (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                      (EXIT (NREVERSE #15#))))
                . #16#)
          (COND
           (|lextri?| (LETT |lts| (SPADCALL |lq| NIL (QREFELT $ 64)) . #16#))
           ('T (LETT |lts| (SPADCALL |lq| 'T |info?| (QREFELT $ 66)) . #16#)))
          (LETT |lsts| NIL . #16#)
          (SEQ (LETT |ts| NIL . #16#) (LETT #13# |lts| . #16#) G190
               (COND
                ((OR (ATOM #13#) (PROGN (LETT |ts| (CAR #13#) . #16#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |lsts|
                       (SPADCALL (SPADCALL |ts| (QREFELT $ 59)) |lsts|
                                 (QREFELT $ 105))
                       . #16#)))
               (LETT #13# (CDR #13#) . #16#) (GO G190) G191 (EXIT NIL))
          (LETT |lsts| (SPADCALL |lsts| (QREFELT $ 107)) . #16#)
          (LETT |lr| NIL . #16#) (LETT |lv| NIL . #16#)
          (LETT |toSee|
                (PROGN
                 (LETT #12# NIL . #16#)
                 (SEQ (LETT |sts| NIL . #16#) (LETT #11# |lsts| . #16#) G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |sts| (CAR #11#) . #16#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #12#
                              (CONS
                               (VECTOR |lr| |lv|
                                       (SPADCALL |sts| (QREFELT $ 96)))
                               #12#)
                              . #16#)))
                      (LETT #11# (CDR #11#) . #16#) (GO G190) G191
                      (EXIT (NREVERSE #12#))))
                . #16#)
          (LETT |toSave| NIL . #16#)
          (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
               (SEQ (LETT |wip| (|SPADfirst| |toSee|) . #16#)
                    (LETT |toSee| (CDR |toSee|) . #16#)
                    (LETT |lr| (QVELT |wip| 0) . #16#)
                    (LETT |lv| (QVELT |wip| 1) . #16#)
                    (LETT |lq2| (QVELT |wip| 2) . #16#)
                    (COND
                     ((NULL |lq2|)
                      (COND
                       ((NULL (NULL |lr|))
                        (EXIT
                         (LETT |toSave| (CONS (REVERSE |lr|) |toSave|)
                               . #16#))))))
                    (LETT |q2| (|SPADfirst| |lq2|) . #16#)
                    (LETT |lq2| (CDR |lq2|) . #16#)
                    (LETT |qrc| (SPADCALL |q2| (QREFELT $ 94)) . #16#)
                    (COND
                     ((NULL (NULL |lr|))
                      (SEQ (LETT |v| NIL . #16#)
                           (LETT #10# (REVERSE |lv|) . #16#)
                           (LETT |r| NIL . #16#)
                           (LETT #9# (REVERSE |lr|) . #16#) G190
                           (COND
                            ((OR (ATOM #9#)
                                 (PROGN (LETT |r| (CAR #9#) . #16#) NIL)
                                 (ATOM #10#)
                                 (PROGN (LETT |v| (CAR #10#) . #16#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |qrc|
                                   (SPADCALL |qrc| |v| |r| (QREFELT $ 97))
                                   . #16#)))
                           (LETT #9#
                                 (PROG1 (CDR #9#)
                                   (LETT #10# (CDR #10#) . #16#))
                                 . #16#)
                           (GO G190) G191 (EXIT NIL))))
                    (LETT |lv|
                          (CONS
                           (PROG2
                               (LETT #8# (SPADCALL |qrc| (QREFELT $ 99))
                                     . #16#)
                               (QCDR #8#)
                             (|check_union2| (QEQCAR #8# 0) (|Symbol|)
                                             (|Union| (|Symbol|) "failed")
                                             #8#))
                           |lv|)
                          . #16#)
                    (LETT |urc| (SPADCALL |qrc| (QREFELT $ 100)) . #16#)
                    (LETT |urcRoots| (SPADCALL |urc| (QREFELT $ 102)) . #16#)
                    (EXIT
                     (SEQ (LETT |urcRoot| NIL . #16#)
                          (LETT #7# |urcRoots| . #16#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |urcRoot| (CAR #7#) . #16#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |toSee|
                                  (CONS
                                   (VECTOR (CONS |urcRoot| |lr|) |lv| |lq2|)
                                   |toSee|)
                                  . #16#)))
                          (LETT #7# (CDR #7#) . #16#) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           (|check?|
            (SEQ (LETT |p| NIL . #16#) (LETT #5# |lp| . #16#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #16#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |realsol| NIL . #16#) (LETT #4# |toSave| . #16#)
                        G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |realsol| (CAR #4#) . #16#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ
                           (LETT |prc| (SPADCALL |p| (QREFELT $ 92)) . #16#)
                           (SEQ (LETT |symb| NIL . #16#)
                                (LETT #3# (REVERSE (QREFELT $ 7)) . #16#)
                                (LETT |rr| NIL . #16#)
                                (LETT #2# |realsol| . #16#) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |rr| (CAR #2#) . #16#) NIL)
                                      (ATOM #3#)
                                      (PROGN
                                       (LETT |symb| (CAR #3#) . #16#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |prc|
                                        (SPADCALL |prc| |symb| |rr|
                                                  (QREFELT $ 97))
                                        . #16#)))
                                (LETT #2#
                                      (PROG1 (CDR #2#)
                                        (LETT #3# (CDR #3#) . #16#))
                                      . #16#)
                                (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (COND
                             ((NULL (SPADCALL |prc| (QREFELT $ 108)))
                              (PROGN
                               (LETT #1#
                                     (|error| "realSolve$ZDSOLVE: bad result")
                                     . #16#)
                               (GO #17=#:G844)))))))
                         #17# (EXIT #1#))
                        (LETT #4# (CDR #4#) . #16#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT #5# (CDR #5#) . #16#) (GO G190) G191 (EXIT NIL))))
          (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;realSolve;L2BL;13|
        ((|lp| |List| (|Polynomial| R)) (|info?| |Boolean|)
         (|check?| |Boolean|)
         ($ |List| (|List| (|RealClosure| (|Fraction| R)))))
        (SPADCALL |lp| |info?| |check?| NIL (QREFELT $ 109))) 

(SDEFUN |ZDSOLVE;realSolve;LBL;14|
        ((|lp| |List| (|Polynomial| R)) (|info?| |Boolean|)
         ($ |List| (|List| (|RealClosure| (|Fraction| R)))))
        (SPADCALL |lp| |info?| NIL NIL (QREFELT $ 109))) 

(SDEFUN |ZDSOLVE;realSolve;LL;15|
        ((|lp| |List| (|Polynomial| R))
         ($ |List| (|List| (|RealClosure| (|Fraction| R)))))
        (SPADCALL |lp| NIL NIL NIL (QREFELT $ 109))) 

(SDEFUN |ZDSOLVE;positiveSolve;RcL;16|
        ((|ts| |RegularChain| R |ls|)
         ($ |List| (|List| (|RealClosure| (|Fraction| R)))))
        (SPROG
         ((|toSee|
           (|List|
            (|Record| (|:| |reals| (|List| (|RealClosure| (|Fraction| R))))
                      (|:| |vars| (|List| (|Symbol|)))
                      (|:| |pols|
                           #1=(|List|
                               (|NewSparseMultivariatePolynomial| R
                                                                  (|OrderedVariableList|
                                                                   |ls2|)))))))
          (#2=#:G885 NIL) (|urcRoot| NIL)
          (|urcRoots| (|List| (|RealClosure| (|Fraction| R))))
          (|urc| (|SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R))))
          (|lv| (|List| (|Symbol|))) (#3=#:G873 NIL)
          (|qrc| (|Polynomial| (|RealClosure| (|Fraction| R)))) (#4=#:G883 NIL)
          (|r| NIL) (#5=#:G884 NIL) (|v| NIL) (|lq2| #1#)
          (|q2|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (|toSave| (|List| (|List| (|RealClosure| (|Fraction| R)))))
          (|lr| (|List| (|RealClosure| (|Fraction| R))))
          (|wip|
           (|Record| (|:| |reals| (|List| (|RealClosure| (|Fraction| R))))
                     (|:| |vars| (|List| (|Symbol|)))
                     (|:| |pols|
                          (|List|
                           (|NewSparseMultivariatePolynomial| R
                                                              (|OrderedVariableList|
                                                               |ls2|))))))
          (#6=#:G882 NIL) (|sts| NIL) (#7=#:G881 NIL)
          (|lsts|
           (|List|
            (|SquareFreeRegularTriangularSet| R
                                              (|IndexedExponents|
                                               (|OrderedVariableList| |ls2|))
                                              (|OrderedVariableList| |ls2|)
                                              (|NewSparseMultivariatePolynomial|
                                               R
                                               (|OrderedVariableList|
                                                |ls2|))))))
         (SEQ
          (LETT |lsts| (SPADCALL |ts| (QREFELT $ 59))
                . #8=(|ZDSOLVE;positiveSolve;RcL;16|))
          (LETT |lr| NIL . #8#) (LETT |lv| NIL . #8#)
          (LETT |toSee|
                (PROGN
                 (LETT #7# NIL . #8#)
                 (SEQ (LETT |sts| NIL . #8#) (LETT #6# |lsts| . #8#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |sts| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (VECTOR |lr| |lv|
                                       (SPADCALL |sts| (QREFELT $ 96)))
                               #7#)
                              . #8#)))
                      (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #8#)
          (LETT |toSave| NIL . #8#)
          (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
               (SEQ (LETT |wip| (|SPADfirst| |toSee|) . #8#)
                    (LETT |toSee| (CDR |toSee|) . #8#)
                    (LETT |lr| (QVELT |wip| 0) . #8#)
                    (LETT |lv| (QVELT |wip| 1) . #8#)
                    (LETT |lq2| (QVELT |wip| 2) . #8#)
                    (COND
                     ((NULL |lq2|)
                      (COND
                       ((NULL (NULL |lr|))
                        (EXIT
                         (LETT |toSave| (CONS (REVERSE |lr|) |toSave|)
                               . #8#))))))
                    (LETT |q2| (|SPADfirst| |lq2|) . #8#)
                    (LETT |lq2| (CDR |lq2|) . #8#)
                    (LETT |qrc| (SPADCALL |q2| (QREFELT $ 94)) . #8#)
                    (COND
                     ((NULL (NULL |lr|))
                      (SEQ (LETT |v| NIL . #8#) (LETT #5# (REVERSE |lv|) . #8#)
                           (LETT |r| NIL . #8#) (LETT #4# (REVERSE |lr|) . #8#)
                           G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |r| (CAR #4#) . #8#) NIL)
                                 (ATOM #5#)
                                 (PROGN (LETT |v| (CAR #5#) . #8#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |qrc|
                                   (SPADCALL |qrc| |v| |r| (QREFELT $ 97))
                                   . #8#)))
                           (LETT #4#
                                 (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #8#))
                                 . #8#)
                           (GO G190) G191 (EXIT NIL))))
                    (LETT |lv|
                          (CONS
                           (PROG2
                               (LETT #3# (SPADCALL |qrc| (QREFELT $ 99)) . #8#)
                               (QCDR #3#)
                             (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                             (|Union| (|Symbol|) "failed")
                                             #3#))
                           |lv|)
                          . #8#)
                    (LETT |urc| (SPADCALL |qrc| (QREFELT $ 100)) . #8#)
                    (LETT |urcRoots| (SPADCALL |urc| (QREFELT $ 102)) . #8#)
                    (EXIT
                     (SEQ (LETT |urcRoot| NIL . #8#)
                          (LETT #2# |urcRoots| . #8#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |urcRoot| (CAR #2#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |urcRoot| (QREFELT $ 113))
                              (LETT |toSee|
                                    (CONS
                                     (VECTOR (CONS |urcRoot| |lr|) |lv| |lq2|)
                                     |toSee|)
                                    . #8#)))))
                          (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;positiveSolve;L2BL;17|
        ((|lp| |List| (|Polynomial| R)) (|info?| |Boolean|)
         (|lextri?| |Boolean|)
         ($ |List| (|List| (|RealClosure| (|Fraction| R)))))
        (SPROG
         ((|toSee|
           (|List|
            (|Record| (|:| |reals| (|List| (|RealClosure| (|Fraction| R))))
                      (|:| |vars| (|List| (|Symbol|)))
                      (|:| |pols|
                           #1=(|List|
                               (|NewSparseMultivariatePolynomial| R
                                                                  (|OrderedVariableList|
                                                                   |ls2|)))))))
          (#2=#:G911 NIL) (|urcRoot| NIL)
          (|urcRoots| (|List| (|RealClosure| (|Fraction| R))))
          (|urc| (|SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R))))
          (|lv| (|List| (|Symbol|))) (#3=#:G896 NIL)
          (|qrc| (|Polynomial| (|RealClosure| (|Fraction| R)))) (#4=#:G909 NIL)
          (|r| NIL) (#5=#:G910 NIL) (|v| NIL) (|lq2| #1#)
          (|q2|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (|toSave| (|List| (|List| (|RealClosure| (|Fraction| R)))))
          (|lr| (|List| (|RealClosure| (|Fraction| R))))
          (|wip|
           (|Record| (|:| |reals| (|List| (|RealClosure| (|Fraction| R))))
                     (|:| |vars| (|List| (|Symbol|)))
                     (|:| |pols|
                          (|List|
                           (|NewSparseMultivariatePolynomial| R
                                                              (|OrderedVariableList|
                                                               |ls2|))))))
          (#6=#:G908 NIL) (|sts| NIL) (#7=#:G907 NIL)
          (|lsts|
           (|List|
            (|SquareFreeRegularTriangularSet| R
                                              (|IndexedExponents|
                                               (|OrderedVariableList| |ls2|))
                                              (|OrderedVariableList| |ls2|)
                                              (|NewSparseMultivariatePolynomial|
                                               R
                                               (|OrderedVariableList|
                                                |ls2|)))))
          (#8=#:G906 NIL) (|ts| NIL) (|lts| (|List| (|RegularChain| R |ls|)))
          (|lq|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls|))))
          (#9=#:G905 NIL) (|p| NIL) (#10=#:G904 NIL))
         (SEQ
          (LETT |lq|
                (PROGN
                 (LETT #10# NIL . #11=(|ZDSOLVE;positiveSolve;L2BL;17|))
                 (SEQ (LETT |p| NIL . #11#) (LETT #9# |lp| . #11#) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |p| (CAR #9#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10# (CONS (SPADCALL |p| (QREFELT $ 61)) #10#)
                              . #11#)))
                      (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #11#)
          (COND
           (|lextri?| (LETT |lts| (SPADCALL |lq| NIL (QREFELT $ 64)) . #11#))
           ('T (LETT |lts| (SPADCALL |lq| 'T |info?| (QREFELT $ 66)) . #11#)))
          (LETT |lsts| NIL . #11#)
          (SEQ (LETT |ts| NIL . #11#) (LETT #8# |lts| . #11#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |ts| (CAR #8#) . #11#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |lsts|
                       (SPADCALL (SPADCALL |ts| (QREFELT $ 59)) |lsts|
                                 (QREFELT $ 105))
                       . #11#)))
               (LETT #8# (CDR #8#) . #11#) (GO G190) G191 (EXIT NIL))
          (LETT |lsts| (SPADCALL |lsts| (QREFELT $ 107)) . #11#)
          (LETT |lr| NIL . #11#) (LETT |lv| NIL . #11#)
          (LETT |toSee|
                (PROGN
                 (LETT #7# NIL . #11#)
                 (SEQ (LETT |sts| NIL . #11#) (LETT #6# |lsts| . #11#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |sts| (CAR #6#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (VECTOR |lr| |lv|
                                       (SPADCALL |sts| (QREFELT $ 96)))
                               #7#)
                              . #11#)))
                      (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #11#)
          (LETT |toSave| NIL . #11#)
          (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
               (SEQ (LETT |wip| (|SPADfirst| |toSee|) . #11#)
                    (LETT |toSee| (CDR |toSee|) . #11#)
                    (LETT |lr| (QVELT |wip| 0) . #11#)
                    (LETT |lv| (QVELT |wip| 1) . #11#)
                    (LETT |lq2| (QVELT |wip| 2) . #11#)
                    (COND
                     ((NULL |lq2|)
                      (COND
                       ((NULL (NULL |lr|))
                        (EXIT
                         (LETT |toSave| (CONS (REVERSE |lr|) |toSave|)
                               . #11#))))))
                    (LETT |q2| (|SPADfirst| |lq2|) . #11#)
                    (LETT |lq2| (CDR |lq2|) . #11#)
                    (LETT |qrc| (SPADCALL |q2| (QREFELT $ 94)) . #11#)
                    (COND
                     ((NULL (NULL |lr|))
                      (SEQ (LETT |v| NIL . #11#)
                           (LETT #5# (REVERSE |lv|) . #11#)
                           (LETT |r| NIL . #11#)
                           (LETT #4# (REVERSE |lr|) . #11#) G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |r| (CAR #4#) . #11#) NIL)
                                 (ATOM #5#)
                                 (PROGN (LETT |v| (CAR #5#) . #11#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |qrc|
                                   (SPADCALL |qrc| |v| |r| (QREFELT $ 97))
                                   . #11#)))
                           (LETT #4#
                                 (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #11#))
                                 . #11#)
                           (GO G190) G191 (EXIT NIL))))
                    (LETT |lv|
                          (CONS
                           (PROG2
                               (LETT #3# (SPADCALL |qrc| (QREFELT $ 99))
                                     . #11#)
                               (QCDR #3#)
                             (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                             (|Union| (|Symbol|) "failed")
                                             #3#))
                           |lv|)
                          . #11#)
                    (LETT |urc| (SPADCALL |qrc| (QREFELT $ 100)) . #11#)
                    (LETT |urcRoots| (SPADCALL |urc| (QREFELT $ 102)) . #11#)
                    (EXIT
                     (SEQ (LETT |urcRoot| NIL . #11#)
                          (LETT #2# |urcRoots| . #11#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |urcRoot| (CAR #2#) . #11#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |urcRoot| (QREFELT $ 113))
                              (LETT |toSee|
                                    (CONS
                                     (VECTOR (CONS |urcRoot| |lr|) |lv| |lq2|)
                                     |toSee|)
                                    . #11#)))))
                          (LETT #2# (CDR #2#) . #11#) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;positiveSolve;LBL;18|
        ((|lp| |List| (|Polynomial| R)) (|info?| |Boolean|)
         ($ |List| (|List| (|RealClosure| (|Fraction| R)))))
        (SPADCALL |lp| |info?| NIL (QREFELT $ 115))) 

(SDEFUN |ZDSOLVE;positiveSolve;LL;19|
        ((|lp| |List| (|Polynomial| R))
         ($ |List| (|List| (|RealClosure| (|Fraction| R)))))
        (SPADCALL |lp| NIL NIL (QREFELT $ 115))) 

(SDEFUN |ZDSOLVE;univariateSolve;RcL;20|
        ((|ts| |RegularChain| R |ls|)
         ($ |List|
          (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                    (|:| |coordinates| (|List| (|Polynomial| R))))))
        (SPROG
         ((|toSave|
           (|List|
            (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                      (|:| |coordinates| (|List| (|Polynomial| R))))))
          (|lc| (|List| (|Polynomial| R))) (#1=#:G930 NIL) (|q2| NIL)
          (#2=#:G929 NIL) (|g| (|SparseUnivariatePolynomial| R))
          (#3=#:G916 NIL) (#4=#:G928 NIL) (|us| NIL)
          (|lus|
           (|List|
            (|SquareFreeRegularTriangularSet| R
                                              (|IndexedExponents|
                                               (|OrderedVariableList| |ls2|))
                                              (|OrderedVariableList| |ls2|)
                                              (|NewSparseMultivariatePolynomial|
                                               R
                                               (|OrderedVariableList|
                                                |ls2|)))))
          (#5=#:G927 NIL) (|st| NIL)
          (|toSee|
           (|List|
            (|SquareFreeRegularTriangularSet| R
                                              (|IndexedExponents|
                                               (|OrderedVariableList| |ls2|))
                                              (|OrderedVariableList| |ls2|)
                                              (|NewSparseMultivariatePolynomial|
                                               R
                                               (|OrderedVariableList|
                                                |ls2|))))))
         (SEQ
          (LETT |toSee| (SPADCALL |ts| (QREFELT $ 59))
                . #6=(|ZDSOLVE;univariateSolve;RcL;20|))
          (LETT |toSave| NIL . #6#)
          (SEQ (LETT |st| NIL . #6#) (LETT #5# |toSee| . #6#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |st| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ (LETT |lus| (SPADCALL |st| 'T (QREFELT $ 119)) . #6#)
                    (EXIT
                     (SEQ (LETT |us| NIL . #6#) (LETT #4# |lus| . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |us| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |g|
                                 (SPADCALL
                                  (PROG2
                                      (LETT #3#
                                            (SPADCALL |us| (QREFELT $ 16)
                                                      (QREFELT $ 121))
                                            . #6#)
                                      (QCDR #3#)
                                    (|check_union2| (QEQCAR #3# 0)
                                                    (|NewSparseMultivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|OrderedVariableList|
                                                      (QREFELT $ 8)))
                                                    (|Union|
                                                     (|NewSparseMultivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|OrderedVariableList|
                                                       (QREFELT $ 8)))
                                                     "failed")
                                                    #3#))
                                  (QREFELT $ 122))
                                 . #6#)
                           (LETT |lc|
                                 (PROGN
                                  (LETT #2# NIL . #6#)
                                  (SEQ (LETT |q2| NIL . #6#)
                                       (LETT #1#
                                             (SPADCALL
                                              (SPADCALL |us| (QREFELT $ 16)
                                                        (QREFELT $ 123))
                                              (QREFELT $ 95))
                                             . #6#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |q2| (CAR #1#) . #6#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |q2| (QREFELT $ 124))
                                                #2#)
                                               . #6#)))
                                       (LETT #1# (CDR #1#) . #6#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 . #6#)
                           (EXIT
                            (LETT |toSave| (CONS (CONS |g| |lc|) |toSave|)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;univariateSolve;L3BL;21|
        ((|lp| |List| (|Polynomial| R)) (|info?| |Boolean|)
         (|check?| |Boolean|) (|lextri?| |Boolean|)
         ($ |List|
          (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                    (|:| |coordinates| (|List| (|Polynomial| R))))))
        (SPROG
         ((|toSave|
           (|List|
            (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                      (|:| |coordinates| (|List| (|Polynomial| R))))))
          (|lc| (|List| (|Polynomial| R))) (#1=#:G968 NIL) (|q2| NIL)
          (#2=#:G967 NIL) (|g| (|SparseUnivariatePolynomial| R))
          (#3=#:G948 NIL) (#4=#:G957 NIL)
          (|rems|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls2|))))
          (#5=#:G966 NIL) (#6=#:G965 NIL) (#7=#:G964 NIL) (|us| NIL)
          (|lus|
           (|List|
            (|SquareFreeRegularTriangularSet| R
                                              (|IndexedExponents|
                                               (|OrderedVariableList| |ls2|))
                                              (|OrderedVariableList| |ls2|)
                                              (|NewSparseMultivariatePolynomial|
                                               R
                                               (|OrderedVariableList|
                                                |ls2|)))))
          (#8=#:G963 NIL) (|st| NIL)
          (|lq2|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls2|))))
          (#9=#:G962 NIL) (|p| NIL) (#10=#:G961 NIL)
          (|toSee|
           (|List|
            (|SquareFreeRegularTriangularSet| R
                                              (|IndexedExponents|
                                               (|OrderedVariableList| |ls2|))
                                              (|OrderedVariableList| |ls2|)
                                              (|NewSparseMultivariatePolynomial|
                                               R
                                               (|OrderedVariableList|
                                                |ls2|)))))
          (#11=#:G960 NIL) (|ts| NIL) (|lts| (|List| (|RegularChain| R |ls|)))
          (|lq|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls|))))
          (#12=#:G959 NIL) (#13=#:G958 NIL))
         (SEQ
          (LETT |lq|
                (PROGN
                 (LETT #13# NIL . #14=(|ZDSOLVE;univariateSolve;L3BL;21|))
                 (SEQ (LETT |p| NIL . #14#) (LETT #12# |lp| . #14#) G190
                      (COND
                       ((OR (ATOM #12#)
                            (PROGN (LETT |p| (CAR #12#) . #14#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #13# (CONS (SPADCALL |p| (QREFELT $ 61)) #13#)
                              . #14#)))
                      (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                      (EXIT (NREVERSE #13#))))
                . #14#)
          (COND
           (|lextri?| (LETT |lts| (SPADCALL |lq| NIL (QREFELT $ 64)) . #14#))
           ('T (LETT |lts| (SPADCALL |lq| 'T |info?| (QREFELT $ 66)) . #14#)))
          (LETT |toSee| NIL . #14#)
          (SEQ (LETT |ts| NIL . #14#) (LETT #11# |lts| . #14#) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |ts| (CAR #11#) . #14#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |toSee|
                       (SPADCALL (SPADCALL |ts| (QREFELT $ 59)) |toSee|
                                 (QREFELT $ 105))
                       . #14#)))
               (LETT #11# (CDR #11#) . #14#) (GO G190) G191 (EXIT NIL))
          (LETT |toSee| (SPADCALL |toSee| (QREFELT $ 107)) . #14#)
          (LETT |toSave| NIL . #14#)
          (COND
           (|check?|
            (LETT |lq2|
                  (PROGN
                   (LETT #10# NIL . #14#)
                   (SEQ (LETT |p| NIL . #14#) (LETT #9# |lp| . #14#) G190
                        (COND
                         ((OR (ATOM #9#)
                              (PROGN (LETT |p| (CAR #9#) . #14#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #10# (CONS (SPADCALL |p| (QREFELT $ 128)) #10#)
                                . #14#)))
                        (LETT #9# (CDR #9#) . #14#) (GO G190) G191
                        (EXIT (NREVERSE #10#))))
                  . #14#)))
          (SEQ (LETT |st| NIL . #14#) (LETT #8# |toSee| . #14#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |st| (CAR #8#) . #14#) NIL))
                 (GO G191)))
               (SEQ (LETT |lus| (SPADCALL |st| 'T (QREFELT $ 119)) . #14#)
                    (EXIT
                     (SEQ (LETT |us| NIL . #14#) (LETT #7# |lus| . #14#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |us| (CAR #7#) . #14#) NIL))
                            (GO G191)))
                          (SEQ
                           (COND
                            (|check?|
                             (SEQ
                              (EXIT
                               (SEQ
                                (LETT |rems|
                                      (PROGN
                                       (LETT #6# NIL . #14#)
                                       (SEQ (LETT |q2| NIL . #14#)
                                            (LETT #5# |lq2| . #14#) G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |q2| (CAR #5#) . #14#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (SPADCALL |q2| |us|
                                                               (QREFELT $ 129))
                                                     #6#)
                                                    . #14#)))
                                            (LETT #5# (CDR #5#) . #14#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #6#))))
                                      . #14#)
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL (ELT $ 132) |rems|
                                              (QREFELT $ 134)))
                                   (PROGN
                                    (LETT #4#
                                          (SEQ
                                           (SPADCALL
                                            (SPADCALL |st| (QREFELT $ 136))
                                            (QREFELT $ 139))
                                           (SPADCALL "Has a bad RUR component:"
                                                     (QREFELT $ 141))
                                           (SPADCALL
                                            (SPADCALL |us| (QREFELT $ 136))
                                            (QREFELT $ 139))
                                           (EXIT
                                            (|error|
                                             "univariateSolve$ZDSOLVE: bad RUR")))
                                          . #14#)
                                    (GO #15=#:G946)))))))
                              #15# (EXIT #4#))))
                           (LETT |g|
                                 (SPADCALL
                                  (PROG2
                                      (LETT #3#
                                            (SPADCALL |us| (QREFELT $ 16)
                                                      (QREFELT $ 121))
                                            . #14#)
                                      (QCDR #3#)
                                    (|check_union2| (QEQCAR #3# 0)
                                                    (|NewSparseMultivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|OrderedVariableList|
                                                      (QREFELT $ 8)))
                                                    (|Union|
                                                     (|NewSparseMultivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|OrderedVariableList|
                                                       (QREFELT $ 8)))
                                                     "failed")
                                                    #3#))
                                  (QREFELT $ 122))
                                 . #14#)
                           (LETT |lc|
                                 (PROGN
                                  (LETT #2# NIL . #14#)
                                  (SEQ (LETT |q2| NIL . #14#)
                                       (LETT #1#
                                             (SPADCALL
                                              (SPADCALL |us| (QREFELT $ 16)
                                                        (QREFELT $ 123))
                                              (QREFELT $ 95))
                                             . #14#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |q2| (CAR #1#) . #14#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |q2| (QREFELT $ 124))
                                                #2#)
                                               . #14#)))
                                       (LETT #1# (CDR #1#) . #14#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 . #14#)
                           (EXIT
                            (LETT |toSave| (CONS (CONS |g| |lc|) |toSave|)
                                  . #14#)))
                          (LETT #7# (CDR #7#) . #14#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #8# (CDR #8#) . #14#) (GO G190) G191 (EXIT NIL))
          (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;univariateSolve;L2BL;22|
        ((|lp| |List| (|Polynomial| R)) (|info?| |Boolean|)
         (|check?| |Boolean|)
         ($ |List|
          (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                    (|:| |coordinates| (|List| (|Polynomial| R))))))
        (SPADCALL |lp| |info?| |check?| NIL (QREFELT $ 142))) 

(SDEFUN |ZDSOLVE;univariateSolve;LBL;23|
        ((|lp| |List| (|Polynomial| R)) (|info?| |Boolean|)
         ($ |List|
          (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                    (|:| |coordinates| (|List| (|Polynomial| R))))))
        (SPADCALL |lp| |info?| NIL NIL (QREFELT $ 142))) 

(SDEFUN |ZDSOLVE;univariateSolve;LL;24|
        ((|lp| |List| (|Polynomial| R))
         ($ |List|
          (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                    (|:| |coordinates| (|List| (|Polynomial| R))))))
        (SPADCALL |lp| NIL NIL NIL (QREFELT $ 142))) 

(DECLAIM (NOTINLINE |ZeroDimensionalSolvePackage;|)) 

(DEFUN |ZeroDimensionalSolvePackage| (&REST #1=#:G975)
  (SPROG NIL
         (PROG (#2=#:G976)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ZeroDimensionalSolvePackage|)
                                               '|domainEqualList|)
                    . #3=(|ZeroDimensionalSolvePackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ZeroDimensionalSolvePackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ZeroDimensionalSolvePackage|)))))))))) 

(DEFUN |ZeroDimensionalSolvePackage;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G732 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|ZeroDimensionalSolvePackage|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT DV$3 (|devaluate| |#3|) . #2#)
    (LETT |dv$| (LIST '|ZeroDimensionalSolvePackage| DV$1 DV$2 DV$3) . #2#)
    (LETT $ (GETREFV 146) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #2#))
    (|haddProp| |$ConstructorCache| '|ZeroDimensionalSolvePackage|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 12 (SPADCALL |#3| (QREFELT $ 11)))
    (QSETREFV $ 16
              (PROG2 (LETT #1# (SPADCALL (QREFELT $ 12) (QREFELT $ 15)) . #2#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) (|OrderedVariableList| |#3|)
                                (|Union| (|OrderedVariableList| |#3|) "failed")
                                #1#)))
    (QSETREFV $ 19 (SPADCALL (QREFELT $ 16) (QREFELT $ 18)))
    $))) 

(MAKEPROP '|ZeroDimensionalSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (|List| 9) (0 . |last|) '|news|
              (|Union| $ '"failed")
              (|OrderedVariableList| (NRTEVAL (QREFELT $ 8))) (5 . |variable|)
              '|newv| (|NewSparseMultivariatePolynomial| 6 14) (10 . |coerce|)
              '|newq| (|Boolean|) (|NewSparseMultivariatePolynomial| 6 26)
              (15 . |ground?|) (20 . |ground|) (25 . |coerce|) (30 . |Zero|)
              (|OrderedVariableList| (NRTEVAL (QREFELT $ 7))) (34 . |mvar|)
              (|NonNegativeInteger|) (39 . |mdeg|) (44 . |convert|)
              (49 . |init|) |ZDSOLVE;convert;NsmpNsmp;1| (54 . ^) (60 . *)
              (66 . +) (72 . |tail|) (|List| 17)
              (|SquareFreeRegularTriangularSet| 6 (|IndexedExponents| 14) 14
                                                17)
              (77 . |construct|) (|List| 21)
              (|RegularChain| 6 (NRTEVAL (QREFELT $ 7))) (82 . |parts|)
              (87 . |infRittWu?|) (|Mapping| 20 17 17) (93 . |sort|)
              (|PolynomialSetUtilitiesPackage| 6 (|IndexedExponents| 14) 14 17)
              (99 . |irreducibleFactors|)
              (|Record| (|:| |val| 17) (|:| |tower| $)) (|List| 48)
              (104 . |squareFreePart|) (110 . |init|) (115 . |ground?|)
              (|NormalizationPackage| 6 (|IndexedExponents| 14) 14 17 38)
              (120 . |normalizedAssociate|) (126 . |internalAugment|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 17) (|:| |den| 6))
              (132 . |remainder|) (|List| 38) |ZDSOLVE;squareFree;RcL;2|
              (|Polynomial| 6) (138 . |convert|) (|List| 41)
              (|LexTriangularPackage| 6 (NRTEVAL (QREFELT $ 7)))
              (143 . |zeroSetSplit|) (|List| $) (149 . |zeroSetSplit|)
              (|List| 60) |ZDSOLVE;triangSolve;L2BL;3|
              |ZDSOLVE;triangSolve;LBL;4| |ZDSOLVE;triangSolve;LL;5|
              (|SparseUnivariatePolynomial| 6) (156 . |zero?|)
              (|SparseUnivariatePolynomial| 79) (161 . |Zero|)
              (165 . |ground?|) (170 . |ground|) (|Fraction| 6)
              (175 . |coerce|) (|RealClosure| 77) (180 . |coerce|)
              (185 . |coerce|) (190 . |leadingCoefficient|) (195 . |degree|)
              (200 . |monomial|) (206 . +) (212 . |reductum|)
              |ZDSOLVE;convert;SupSup;6| (|Polynomial| 79) (|Mapping| 79 6)
              (|PolynomialFunctions2| 6 79) (217 . |map|)
              |ZDSOLVE;convert;PP;8| (223 . |coerce|) |ZDSOLVE;convert;NsmpP;9|
              (228 . |parts|) |ZDSOLVE;convert;SfrtsL;10| (233 . |eval|)
              (|Union| 9 '"failed") (240 . |mainVariable|) (245 . |univariate|)
              (|SparseUnivariatePolynomial| $) (250 . |allRootsOf|)
              (|List| (|List| 79)) |ZDSOLVE;realSolve;RcL;11| (255 . |concat|)
              (|SquareFreeQuasiComponentPackage| 6 (|IndexedExponents| 14) 14
                                                 17 38)
              (261 . |removeSuperfluousQuasiComponents|) (266 . |zero?|)
              |ZDSOLVE;realSolve;L3BL;12| |ZDSOLVE;realSolve;L2BL;13|
              |ZDSOLVE;realSolve;LBL;14| |ZDSOLVE;realSolve;LL;15|
              (271 . |positive?|) |ZDSOLVE;positiveSolve;RcL;16|
              |ZDSOLVE;positiveSolve;L2BL;17| |ZDSOLVE;positiveSolve;LBL;18|
              |ZDSOLVE;positiveSolve;LL;19|
              (|InternalRationalUnivariateRepresentationPackage| 6
                                                                 (|IndexedExponents|
                                                                  14)
                                                                 14 17 38)
              (276 . |rur|) (|Union| 17 '"failed") (282 . |select|)
              (288 . |univariate|) (293 . |collectUpper|) (299 . |convert|)
              (|Record| (|:| |complexRoots| 71) (|:| |coordinates| 67))
              (|List| 125) |ZDSOLVE;univariateSolve;RcL;20| (304 . |convert|)
              (309 . |removeZero|) (315 . |zero?|) (320 . |zero?|)
              (325 . |zero?|) (|Mapping| 20 17) (330 . |every?|) (|OutputForm|)
              (336 . |coerce|) (|Void|) (|OutputPackage|) (341 . |output|)
              (|String|) (346 . |output|) |ZDSOLVE;univariateSolve;L3BL;21|
              |ZDSOLVE;univariateSolve;L2BL;22|
              |ZDSOLVE;univariateSolve;LBL;23| |ZDSOLVE;univariateSolve;LL;24|)
           '#(|univariateSolve| 351 |triangSolve| 382 |squareFree| 400
              |realSolve| 405 |positiveSolve| 436 |convert| 459)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 145
                                                 '(1 10 9 0 11 1 14 13 9 15 1
                                                   17 0 14 18 1 21 20 0 22 1 21
                                                   6 0 23 1 17 0 6 24 0 17 0 25
                                                   1 21 26 0 27 1 21 28 0 29 1
                                                   26 9 0 30 1 21 0 0 31 2 17 0
                                                   0 28 33 2 17 0 0 0 34 2 17 0
                                                   0 0 35 1 21 0 0 36 1 38 0 37
                                                   39 1 41 40 0 42 2 17 20 0 0
                                                   43 2 37 0 44 0 45 1 46 37 37
                                                   47 2 38 49 17 0 50 1 17 0 0
                                                   51 1 17 20 0 52 2 53 17 17
                                                   38 54 2 38 0 17 0 55 2 38 56
                                                   17 0 57 1 21 0 60 61 2 63 62
                                                   40 20 64 3 41 65 40 20 20 66
                                                   1 71 20 0 72 0 73 0 74 1 71
                                                   20 0 75 1 71 6 0 76 1 77 0 6
                                                   78 1 79 0 77 80 1 73 0 79 81
                                                   1 71 6 0 82 1 71 28 0 83 2
                                                   73 0 79 28 84 2 73 0 0 0 85
                                                   1 71 0 0 86 2 90 88 89 60 91
                                                   1 17 60 0 93 1 38 37 0 95 3
                                                   88 0 0 9 79 97 1 88 98 0 99
                                                   1 88 73 0 100 1 79 65 101
                                                   102 2 58 0 0 0 105 1 106 58
                                                   58 107 1 88 20 0 108 1 79 20
                                                   0 113 2 118 58 38 20 119 2
                                                   38 120 0 14 121 1 17 71 0
                                                   122 2 38 0 0 14 123 1 17 60
                                                   0 124 1 17 0 60 128 2 38 17
                                                   17 0 129 1 60 20 0 130 1 21
                                                   20 0 131 1 17 20 0 132 2 37
                                                   20 133 0 134 1 38 135 0 136
                                                   1 138 137 135 139 1 138 137
                                                   140 141 4 0 126 67 20 20 20
                                                   142 1 0 126 41 127 3 0 126
                                                   67 20 20 143 1 0 126 67 145
                                                   2 0 126 67 20 144 2 0 62 67
                                                   20 69 3 0 62 67 20 20 68 1 0
                                                   62 67 70 1 0 58 41 59 1 0
                                                   103 41 104 3 0 103 67 20 20
                                                   110 4 0 103 67 20 20 20 109
                                                   2 0 103 67 20 111 1 0 103 67
                                                   112 1 0 103 41 114 3 0 103
                                                   67 20 20 115 1 0 103 67 117
                                                   2 0 103 67 20 116 1 0 88 60
                                                   92 1 0 17 21 32 1 0 88 17 94
                                                   1 0 37 38 96 1 0 73 71
                                                   87)))))
           '|lookupComplete|)) 
