
(SDEFUN |ZDSOLVE;convert;NsmpNsmp;1|
        ((|q|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls|)))
         (%
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|))))
        (SPROG
         ((|q2|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (|lq2|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (|iq2|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (|v2| (|OrderedVariableList| |ls2|)) (#1=#:G29 NIL)
          (|d| (|NonNegativeInteger|)) (|v| (|OrderedVariableList| |ls|)))
         (SEQ
          (COND
           ((SPADCALL |q| (QREFELT % 22))
            (SPADCALL (SPADCALL |q| (QREFELT % 23)) (QREFELT % 24)))
           ('T
            (SEQ (LETT |q2| (|spadConstant| % 25))
                 (SEQ G190
                      (COND
                       ((NULL (NULL (SPADCALL |q| (QREFELT % 22)))) (GO G191)))
                      (SEQ (LETT |v| (SPADCALL |q| (QREFELT % 27)))
                           (LETT |d| (SPADCALL |q| (QREFELT % 29)))
                           (LETT |v2|
                                 (PROG2
                                     (LETT #1#
                                           (SPADCALL
                                            (SPADCALL |v| (QREFELT % 30))
                                            (QREFELT % 15)))
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0)
                                                   (|OrderedVariableList|
                                                    (QREFELT % 8))
                                                   (|Union|
                                                    (|OrderedVariableList|
                                                     (QREFELT % 8))
                                                    "failed")
                                                   #1#)))
                           (LETT |iq2|
                                 (SPADCALL (SPADCALL |q| (QREFELT % 31))
                                           (QREFELT % 32)))
                           (LETT |lq2| (SPADCALL |v2| (QREFELT % 18)))
                           (LETT |lq2| (SPADCALL |lq2| |d| (QREFELT % 33)))
                           (LETT |q2|
                                 (SPADCALL
                                  (SPADCALL |iq2| |lq2| (QREFELT % 34)) |q2|
                                  (QREFELT % 35)))
                           (EXIT (LETT |q| (SPADCALL |q| (QREFELT % 36)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SPADCALL |q2|
                            (SPADCALL (SPADCALL |q| (QREFELT % 23))
                                      (QREFELT % 24))
                            (QREFELT % 35))))))))) 

(SDEFUN |ZDSOLVE;squareFree;RcL;2|
        ((|ts| (|RegularChain| R |ls|))
         (%
          (|List|
           (|SquareFreeRegularTriangularSet| R
                                             (|IndexedExponents|
                                              (|OrderedVariableList| |ls2|))
                                             (|OrderedVariableList| |ls2|)
                                             (|NewSparseMultivariatePolynomial|
                                              R
                                              (|OrderedVariableList|
                                               |ls2|))))))
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
          (#1=#:G62 NIL) (#2=#:G61 NIL)
          (|newts|
           (|SquareFreeRegularTriangularSet| R
                                             (|IndexedExponents|
                                              (|OrderedVariableList| |ls2|))
                                             (|OrderedVariableList| |ls2|)
                                             (|NewSparseMultivariatePolynomial|
                                              R
                                              (|OrderedVariableList| |ls2|))))
          (|q|
           (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
          (|st|
           (|SquareFreeRegularTriangularSet| R
                                             (|IndexedExponents|
                                              (|OrderedVariableList| |ls2|))
                                             (|OrderedVariableList| |ls2|)
                                             (|NewSparseMultivariatePolynomial|
                                              R
                                              (|OrderedVariableList| |ls2|))))
          (#3=#:G60 NIL) (|sfqwt| NIL)
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
          (#4=#:G59 NIL) (|p| NIL) (#5=#:G58 NIL))
         (SEQ (LETT |st| (SPADCALL (LIST (QREFELT % 19)) (QREFELT % 39)))
              (LETT |lq|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |p| NIL)
                          (LETT #4# (SPADCALL |ts| (QREFELT % 42))) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS (SPADCALL |p| (QREFELT % 32)) #5#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |lq| (SPADCALL (ELT % 43) |lq| (QREFELT % 45)))
              (LETT |toSee| (LIST (CONS |lq| |st|))) (LETT |toSave| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                   (SEQ (LETT |lqwt| (|SPADfirst| |toSee|))
                        (LETT |toSee| (CDR |toSee|)) (LETT |lq| (QCAR |lqwt|))
                        (LETT |st| (QCDR |lqwt|))
                        (EXIT
                         (COND
                          ((NULL |lq|) (LETT |toSave| (CONS |st| |toSave|)))
                          ('T
                           (SEQ (LETT |q| (|SPADfirst| |lq|))
                                (LETT |lq| (CDR |lq|))
                                (LETT |lsfqwt|
                                      (SPADCALL |q| |st| (QREFELT % 48)))
                                (EXIT
                                 (SEQ (LETT |sfqwt| NIL) (LETT #3# |lsfqwt|)
                                      G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN
                                             (LETT |sfqwt| (CAR #3#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ (LETT |q| (QCAR |sfqwt|))
                                           (LETT |st| (QCDR |sfqwt|))
                                           (COND
                                            ((NULL
                                              (SPADCALL
                                               (SPADCALL |q| (QREFELT % 49))
                                               (QREFELT % 50)))
                                             (LETT |q|
                                                   (SPADCALL |q| |st|
                                                             (QREFELT % 52)))))
                                           (LETT |newts|
                                                 (SPADCALL |q| |st|
                                                           (QREFELT % 53)))
                                           (LETT |newlq|
                                                 (PROGN
                                                  (LETT #2# NIL)
                                                  (SEQ (LETT #1# |lq|) G190
                                                       (COND
                                                        ((OR (ATOM #1#)
                                                             (PROGN
                                                              (LETT |q|
                                                                    (CAR #1#))
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
                                                                            %
                                                                            55))
                                                                 1)
                                                                #2#))))
                                                       (LETT #1# (CDR #1#))
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #2#)))))
                                           (EXIT
                                            (LETT |toSee|
                                                  (CONS (CONS |newlq| |newts|)
                                                        |toSee|))))
                                      (LETT #3# (CDR #3#)) (GO G190) G191
                                      (EXIT NIL))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;triangSolve;L2BL;3|
        ((|lp| (|List| (|Polynomial| R))) (|info?| (|Boolean|))
         (|lextri?| (|Boolean|)) (% (|List| (|RegularChain| R |ls|))))
        (SPROG
         ((|lq|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls|))))
          (#1=#:G68 NIL) (|p| NIL) (#2=#:G67 NIL))
         (SEQ
          (LETT |lq|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |p| (QREFELT % 59)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT
           (COND (|lextri?| (SPADCALL |lq| NIL (QREFELT % 62)))
                 ('T (SPADCALL |lq| 'T |info?| (QREFELT % 64)))))))) 

(SDEFUN |ZDSOLVE;triangSolve;LBL;4|
        ((|lp| (|List| (|Polynomial| R))) (|info?| (|Boolean|))
         (% (|List| (|RegularChain| R |ls|))))
        (SPADCALL |lp| |info?| NIL (QREFELT % 66))) 

(SDEFUN |ZDSOLVE;triangSolve;LL;5|
        ((|lp| (|List| (|Polynomial| R))) (% (|List| (|RegularChain| R |ls|))))
        (SPADCALL |lp| NIL (QREFELT % 67))) 

(SDEFUN |ZDSOLVE;convert;SupSup;6|
        ((|u| (|SparseUnivariatePolynomial| R))
         (% (|SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R)))))
        (SPROG
         ((|uu| (|SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R)))))
         (SEQ
          (COND ((SPADCALL |u| (QREFELT % 70)) (|spadConstant| % 72))
                ((SPADCALL |u| (QREFELT % 73))
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT % 74)) (QREFELT % 76))
                   (QREFELT % 78))
                  (QREFELT % 79)))
                ('T
                 (SEQ (LETT |uu| (|spadConstant| % 72))
                      (SEQ G190
                           (COND
                            ((NULL (NULL (SPADCALL |u| (QREFELT % 73))))
                             (GO G191)))
                           (SEQ
                            (LETT |uu|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |u| (QREFELT % 80))
                                               (QREFELT % 76))
                                     (QREFELT % 78))
                                    (SPADCALL |u| (QREFELT % 81))
                                    (QREFELT % 82))
                                   |uu| (QREFELT % 83)))
                            (EXIT (LETT |u| (SPADCALL |u| (QREFELT % 84)))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (SPADCALL |uu|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |u| (QREFELT % 74))
                                             (QREFELT % 76))
                                   (QREFELT % 78))
                                  (QREFELT % 79))
                                 (QREFELT % 83))))))))) 

(SDEFUN |ZDSOLVE;coerceFromRtoRC|
        ((|r| (R)) (% (|RealClosure| (|Fraction| R))))
        (SPADCALL (SPADCALL |r| (QREFELT % 76)) (QREFELT % 78))) 

(SDEFUN |ZDSOLVE;convert;PP;8|
        ((|p| (|Polynomial| R))
         (% (|Polynomial| (|RealClosure| (|Fraction| R)))))
        (SPADCALL (CONS (|function| |ZDSOLVE;coerceFromRtoRC|) %) |p|
                  (QREFELT % 89))) 

(SDEFUN |ZDSOLVE;convert;NsmpP;9|
        ((|q2|
          (|NewSparseMultivariatePolynomial| R (|OrderedVariableList| |ls2|)))
         (% (|Polynomial| (|RealClosure| (|Fraction| R)))))
        (SPROG ((|p| (|Polynomial| R)))
               (SEQ (LETT |p| (SPADCALL |q2| (QREFELT % 91)))
                    (EXIT (SPADCALL |p| (QREFELT % 90)))))) 

(SDEFUN |ZDSOLVE;convert;SfrtsL;10|
        ((|sts|
          (|SquareFreeRegularTriangularSet| R
                                            (|IndexedExponents|
                                             (|OrderedVariableList| |ls2|))
                                            (|OrderedVariableList| |ls2|)
                                            (|NewSparseMultivariatePolynomial|
                                             R (|OrderedVariableList| |ls2|))))
         (%
          (|List|
           (|NewSparseMultivariatePolynomial| R
                                              (|OrderedVariableList| |ls2|)))))
        (SPROG
         ((|lq2|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList|
                                                |ls2|)))))
         (SEQ (LETT |lq2| (SPADCALL |sts| (QREFELT % 93)))
              (LETT |lq2| (SPADCALL (ELT % 43) |lq2| (QREFELT % 45)))
              (EXIT (CDR |lq2|))))) 

(SDEFUN |ZDSOLVE;realSolve;RcL;11|
        ((|ts| (|RegularChain| R |ls|))
         (% (|List| (|List| (|RealClosure| (|Fraction| R))))))
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
          (#2=#:G111 NIL) (|urcRoot| NIL)
          (|urcRoots| (|List| (|RealClosure| (|Fraction| R))))
          (|urc| (|SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R))))
          (|lv| (|List| (|Symbol|))) (#3=#:G99 NIL)
          (|qrc| (|Polynomial| (|RealClosure| (|Fraction| R)))) (#4=#:G109 NIL)
          (|r| NIL) (#5=#:G110 NIL) (|v| NIL) (|lq2| #1#)
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
          (#6=#:G108 NIL) (|sts| NIL) (#7=#:G107 NIL)
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
         (SEQ (LETT |lsts| (SPADCALL |ts| (QREFELT % 57))) (LETT |lr| NIL)
              (LETT |lv| NIL)
              (LETT |toSee|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |sts| NIL) (LETT #6# |lsts|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |sts| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (VECTOR |lr| |lv|
                                           (SPADCALL |sts| (QREFELT % 94)))
                                   #7#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |toSave| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                   (SEQ (LETT |wip| (|SPADfirst| |toSee|))
                        (LETT |toSee| (CDR |toSee|))
                        (LETT |lr| (QVELT |wip| 0)) (LETT |lv| (QVELT |wip| 1))
                        (LETT |lq2| (QVELT |wip| 2))
                        (COND
                         ((NULL |lq2|)
                          (COND
                           ((NULL (NULL |lr|))
                            (EXIT
                             (LETT |toSave|
                                   (CONS (REVERSE |lr|) |toSave|)))))))
                        (LETT |q2| (|SPADfirst| |lq2|))
                        (LETT |lq2| (CDR |lq2|))
                        (LETT |qrc| (SPADCALL |q2| (QREFELT % 92)))
                        (COND
                         ((NULL (NULL |lr|))
                          (SEQ (LETT |v| NIL) (LETT #5# (REVERSE |lv|))
                               (LETT |r| NIL) (LETT #4# (REVERSE |lr|)) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |r| (CAR #4#)) NIL)
                                     (ATOM #5#)
                                     (PROGN (LETT |v| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |qrc|
                                       (SPADCALL |qrc| |v| |r|
                                                 (QREFELT % 95)))))
                               (LETT #4#
                                     (PROG1 (CDR #4#) (LETT #5# (CDR #5#))))
                               (GO G190) G191 (EXIT NIL))))
                        (LETT |lv|
                              (CONS
                               (PROG2
                                   (LETT #3# (SPADCALL |qrc| (QREFELT % 97)))
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                                 (|Union| (|Symbol|) "failed")
                                                 #3#))
                               |lv|))
                        (LETT |urc| (SPADCALL |qrc| (QREFELT % 98)))
                        (LETT |urcRoots| (SPADCALL |urc| (QREFELT % 100)))
                        (EXIT
                         (SEQ (LETT |urcRoot| NIL) (LETT #2# |urcRoots|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |urcRoot| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |toSee|
                                      (CONS
                                       (VECTOR (CONS |urcRoot| |lr|) |lv|
                                               |lq2|)
                                       |toSee|))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;realSolve;L3BL;12|
        ((|lp| (|List| (|Polynomial| R))) (|info?| (|Boolean|))
         (|check?| (|Boolean|)) (|lextri?| (|Boolean|))
         (% (|List| (|List| (|RealClosure| (|Fraction| R))))))
        (SPROG
         ((#1=#:G142 NIL) (|prc| (|Polynomial| (|RealClosure| (|Fraction| R))))
          (#2=#:G153 NIL) (|rr| NIL) (#3=#:G154 NIL) (|symb| NIL)
          (#4=#:G152 NIL) (|realsol| NIL) (#5=#:G151 NIL) (|p| NIL)
          (|toSee|
           (|List|
            (|Record| (|:| |reals| (|List| (|RealClosure| (|Fraction| R))))
                      (|:| |vars| (|List| (|Symbol|)))
                      (|:| |pols|
                           #6=(|List|
                               (|NewSparseMultivariatePolynomial| R
                                                                  (|OrderedVariableList|
                                                                   |ls2|)))))))
          (#7=#:G150 NIL) (|urcRoot| NIL)
          (|urcRoots| (|List| (|RealClosure| (|Fraction| R))))
          (|urc| (|SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R))))
          (|lv| (|List| (|Symbol|))) (#8=#:G127 NIL)
          (|qrc| (|Polynomial| (|RealClosure| (|Fraction| R)))) (#9=#:G148 NIL)
          (|r| NIL) (#10=#:G149 NIL) (|v| NIL) (|lq2| #6#)
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
          (#11=#:G147 NIL) (|sts| NIL) (#12=#:G146 NIL)
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
          (#13=#:G145 NIL) (|ts| NIL) (|lts| (|List| (|RegularChain| R |ls|)))
          (|lq|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls|))))
          (#14=#:G144 NIL) (#15=#:G143 NIL))
         (SEQ
          (LETT |lq|
                (PROGN
                 (LETT #15# NIL)
                 (SEQ (LETT |p| NIL) (LETT #14# |lp|) G190
                      (COND
                       ((OR (ATOM #14#) (PROGN (LETT |p| (CAR #14#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #15# (CONS (SPADCALL |p| (QREFELT % 59)) #15#))))
                      (LETT #14# (CDR #14#)) (GO G190) G191
                      (EXIT (NREVERSE #15#)))))
          (COND (|lextri?| (LETT |lts| (SPADCALL |lq| NIL (QREFELT % 62))))
                ('T (LETT |lts| (SPADCALL |lq| 'T |info?| (QREFELT % 64)))))
          (LETT |lsts| NIL)
          (SEQ (LETT |ts| NIL) (LETT #13# |lts|) G190
               (COND
                ((OR (ATOM #13#) (PROGN (LETT |ts| (CAR #13#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |lsts|
                       (SPADCALL (SPADCALL |ts| (QREFELT % 57)) |lsts|
                                 (QREFELT % 103)))))
               (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
          (LETT |lsts| (SPADCALL |lsts| (QREFELT % 105))) (LETT |lr| NIL)
          (LETT |lv| NIL)
          (LETT |toSee|
                (PROGN
                 (LETT #12# NIL)
                 (SEQ (LETT |sts| NIL) (LETT #11# |lsts|) G190
                      (COND
                       ((OR (ATOM #11#) (PROGN (LETT |sts| (CAR #11#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #12#
                              (CONS
                               (VECTOR |lr| |lv|
                                       (SPADCALL |sts| (QREFELT % 94)))
                               #12#))))
                      (LETT #11# (CDR #11#)) (GO G190) G191
                      (EXIT (NREVERSE #12#)))))
          (LETT |toSave| NIL)
          (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
               (SEQ (LETT |wip| (|SPADfirst| |toSee|))
                    (LETT |toSee| (CDR |toSee|)) (LETT |lr| (QVELT |wip| 0))
                    (LETT |lv| (QVELT |wip| 1)) (LETT |lq2| (QVELT |wip| 2))
                    (COND
                     ((NULL |lq2|)
                      (COND
                       ((NULL (NULL |lr|))
                        (EXIT
                         (LETT |toSave| (CONS (REVERSE |lr|) |toSave|)))))))
                    (LETT |q2| (|SPADfirst| |lq2|)) (LETT |lq2| (CDR |lq2|))
                    (LETT |qrc| (SPADCALL |q2| (QREFELT % 92)))
                    (COND
                     ((NULL (NULL |lr|))
                      (SEQ (LETT |v| NIL) (LETT #10# (REVERSE |lv|))
                           (LETT |r| NIL) (LETT #9# (REVERSE |lr|)) G190
                           (COND
                            ((OR (ATOM #9#) (PROGN (LETT |r| (CAR #9#)) NIL)
                                 (ATOM #10#) (PROGN (LETT |v| (CAR #10#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |qrc|
                                   (SPADCALL |qrc| |v| |r| (QREFELT % 95)))))
                           (LETT #9# (PROG1 (CDR #9#) (LETT #10# (CDR #10#))))
                           (GO G190) G191 (EXIT NIL))))
                    (LETT |lv|
                          (CONS
                           (PROG2 (LETT #8# (SPADCALL |qrc| (QREFELT % 97)))
                               (QCDR #8#)
                             (|check_union2| (QEQCAR #8# 0) (|Symbol|)
                                             (|Union| (|Symbol|) "failed")
                                             #8#))
                           |lv|))
                    (LETT |urc| (SPADCALL |qrc| (QREFELT % 98)))
                    (LETT |urcRoots| (SPADCALL |urc| (QREFELT % 100)))
                    (EXIT
                     (SEQ (LETT |urcRoot| NIL) (LETT #7# |urcRoots|) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |urcRoot| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |toSee|
                                  (CONS
                                   (VECTOR (CONS |urcRoot| |lr|) |lv| |lq2|)
                                   |toSee|))))
                          (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           (|check?|
            (SEQ (LETT |p| NIL) (LETT #5# |lp|) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |realsol| NIL) (LETT #4# |toSave|) G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |realsol| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |prc| (SPADCALL |p| (QREFELT % 90)))
                               (SEQ (LETT |symb| NIL)
                                    (LETT #3# (REVERSE (QREFELT % 7)))
                                    (LETT |rr| NIL) (LETT #2# |realsol|) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |rr| (CAR #2#)) NIL)
                                          (ATOM #3#)
                                          (PROGN (LETT |symb| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |prc|
                                            (SPADCALL |prc| |symb| |rr|
                                                      (QREFELT % 95)))))
                                    (LETT #2#
                                          (PROG1 (CDR #2#)
                                            (LETT #3# (CDR #3#))))
                                    (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (COND
                                 ((NULL (SPADCALL |prc| (QREFELT % 106)))
                                  (PROGN
                                   (LETT #1#
                                         (|error|
                                          "realSolve$ZDSOLVE: bad result"))
                                   (GO #16=#:G137)))))))
                         #16# (EXIT #1#))
                        (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))))
          (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;realSolve;L2BL;13|
        ((|lp| (|List| (|Polynomial| R))) (|info?| (|Boolean|))
         (|check?| (|Boolean|))
         (% (|List| (|List| (|RealClosure| (|Fraction| R))))))
        (SPADCALL |lp| |info?| |check?| NIL (QREFELT % 107))) 

(SDEFUN |ZDSOLVE;realSolve;LBL;14|
        ((|lp| (|List| (|Polynomial| R))) (|info?| (|Boolean|))
         (% (|List| (|List| (|RealClosure| (|Fraction| R))))))
        (SPADCALL |lp| |info?| NIL NIL (QREFELT % 107))) 

(SDEFUN |ZDSOLVE;realSolve;LL;15|
        ((|lp| (|List| (|Polynomial| R)))
         (% (|List| (|List| (|RealClosure| (|Fraction| R))))))
        (SPADCALL |lp| NIL NIL NIL (QREFELT % 107))) 

(SDEFUN |ZDSOLVE;positiveSolve;RcL;16|
        ((|ts| (|RegularChain| R |ls|))
         (% (|List| (|List| (|RealClosure| (|Fraction| R))))))
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
          (#2=#:G182 NIL) (|urcRoot| NIL)
          (|urcRoots| (|List| (|RealClosure| (|Fraction| R))))
          (|urc| (|SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R))))
          (|lv| (|List| (|Symbol|))) (#3=#:G169 NIL)
          (|qrc| (|Polynomial| (|RealClosure| (|Fraction| R)))) (#4=#:G180 NIL)
          (|r| NIL) (#5=#:G181 NIL) (|v| NIL) (|lq2| #1#)
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
          (#6=#:G179 NIL) (|sts| NIL) (#7=#:G178 NIL)
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
         (SEQ (LETT |lsts| (SPADCALL |ts| (QREFELT % 57))) (LETT |lr| NIL)
              (LETT |lv| NIL)
              (LETT |toSee|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |sts| NIL) (LETT #6# |lsts|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |sts| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (VECTOR |lr| |lv|
                                           (SPADCALL |sts| (QREFELT % 94)))
                                   #7#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |toSave| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                   (SEQ (LETT |wip| (|SPADfirst| |toSee|))
                        (LETT |toSee| (CDR |toSee|))
                        (LETT |lr| (QVELT |wip| 0)) (LETT |lv| (QVELT |wip| 1))
                        (LETT |lq2| (QVELT |wip| 2))
                        (COND
                         ((NULL |lq2|)
                          (COND
                           ((NULL (NULL |lr|))
                            (EXIT
                             (LETT |toSave|
                                   (CONS (REVERSE |lr|) |toSave|)))))))
                        (LETT |q2| (|SPADfirst| |lq2|))
                        (LETT |lq2| (CDR |lq2|))
                        (LETT |qrc| (SPADCALL |q2| (QREFELT % 92)))
                        (COND
                         ((NULL (NULL |lr|))
                          (SEQ (LETT |v| NIL) (LETT #5# (REVERSE |lv|))
                               (LETT |r| NIL) (LETT #4# (REVERSE |lr|)) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |r| (CAR #4#)) NIL)
                                     (ATOM #5#)
                                     (PROGN (LETT |v| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |qrc|
                                       (SPADCALL |qrc| |v| |r|
                                                 (QREFELT % 95)))))
                               (LETT #4#
                                     (PROG1 (CDR #4#) (LETT #5# (CDR #5#))))
                               (GO G190) G191 (EXIT NIL))))
                        (LETT |lv|
                              (CONS
                               (PROG2
                                   (LETT #3# (SPADCALL |qrc| (QREFELT % 97)))
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                                 (|Union| (|Symbol|) "failed")
                                                 #3#))
                               |lv|))
                        (LETT |urc| (SPADCALL |qrc| (QREFELT % 98)))
                        (LETT |urcRoots| (SPADCALL |urc| (QREFELT % 100)))
                        (EXIT
                         (SEQ (LETT |urcRoot| NIL) (LETT #2# |urcRoots|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |urcRoot| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |urcRoot| (QREFELT % 111))
                                  (LETT |toSee|
                                        (CONS
                                         (VECTOR (CONS |urcRoot| |lr|) |lv|
                                                 |lq2|)
                                         |toSee|))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;positiveSolve;L2BL;17|
        ((|lp| (|List| (|Polynomial| R))) (|info?| (|Boolean|))
         (|lextri?| (|Boolean|))
         (% (|List| (|List| (|RealClosure| (|Fraction| R))))))
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
          (#2=#:G214 NIL) (|urcRoot| NIL)
          (|urcRoots| (|List| (|RealClosure| (|Fraction| R))))
          (|urc| (|SparseUnivariatePolynomial| (|RealClosure| (|Fraction| R))))
          (|lv| (|List| (|Symbol|))) (#3=#:G198 NIL)
          (|qrc| (|Polynomial| (|RealClosure| (|Fraction| R)))) (#4=#:G212 NIL)
          (|r| NIL) (#5=#:G213 NIL) (|v| NIL) (|lq2| #1#)
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
          (#6=#:G211 NIL) (|sts| NIL) (#7=#:G210 NIL)
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
          (#8=#:G209 NIL) (|ts| NIL) (|lts| (|List| (|RegularChain| R |ls|)))
          (|lq|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls|))))
          (#9=#:G208 NIL) (|p| NIL) (#10=#:G207 NIL))
         (SEQ
          (LETT |lq|
                (PROGN
                 (LETT #10# NIL)
                 (SEQ (LETT |p| NIL) (LETT #9# |lp|) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |p| (CAR #9#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10# (CONS (SPADCALL |p| (QREFELT % 59)) #10#))))
                      (LETT #9# (CDR #9#)) (GO G190) G191
                      (EXIT (NREVERSE #10#)))))
          (COND (|lextri?| (LETT |lts| (SPADCALL |lq| NIL (QREFELT % 62))))
                ('T (LETT |lts| (SPADCALL |lq| 'T |info?| (QREFELT % 64)))))
          (LETT |lsts| NIL)
          (SEQ (LETT |ts| NIL) (LETT #8# |lts|) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |ts| (CAR #8#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |lsts|
                       (SPADCALL (SPADCALL |ts| (QREFELT % 57)) |lsts|
                                 (QREFELT % 103)))))
               (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
          (LETT |lsts| (SPADCALL |lsts| (QREFELT % 105))) (LETT |lr| NIL)
          (LETT |lv| NIL)
          (LETT |toSee|
                (PROGN
                 (LETT #7# NIL)
                 (SEQ (LETT |sts| NIL) (LETT #6# |lsts|) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |sts| (CAR #6#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (VECTOR |lr| |lv|
                                       (SPADCALL |sts| (QREFELT % 94)))
                               #7#))))
                      (LETT #6# (CDR #6#)) (GO G190) G191
                      (EXIT (NREVERSE #7#)))))
          (LETT |toSave| NIL)
          (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
               (SEQ (LETT |wip| (|SPADfirst| |toSee|))
                    (LETT |toSee| (CDR |toSee|)) (LETT |lr| (QVELT |wip| 0))
                    (LETT |lv| (QVELT |wip| 1)) (LETT |lq2| (QVELT |wip| 2))
                    (COND
                     ((NULL |lq2|)
                      (COND
                       ((NULL (NULL |lr|))
                        (EXIT
                         (LETT |toSave| (CONS (REVERSE |lr|) |toSave|)))))))
                    (LETT |q2| (|SPADfirst| |lq2|)) (LETT |lq2| (CDR |lq2|))
                    (LETT |qrc| (SPADCALL |q2| (QREFELT % 92)))
                    (COND
                     ((NULL (NULL |lr|))
                      (SEQ (LETT |v| NIL) (LETT #5# (REVERSE |lv|))
                           (LETT |r| NIL) (LETT #4# (REVERSE |lr|)) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#)) NIL)
                                 (ATOM #5#) (PROGN (LETT |v| (CAR #5#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |qrc|
                                   (SPADCALL |qrc| |v| |r| (QREFELT % 95)))))
                           (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#))))
                           (GO G190) G191 (EXIT NIL))))
                    (LETT |lv|
                          (CONS
                           (PROG2 (LETT #3# (SPADCALL |qrc| (QREFELT % 97)))
                               (QCDR #3#)
                             (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                             (|Union| (|Symbol|) "failed")
                                             #3#))
                           |lv|))
                    (LETT |urc| (SPADCALL |qrc| (QREFELT % 98)))
                    (LETT |urcRoots| (SPADCALL |urc| (QREFELT % 100)))
                    (EXIT
                     (SEQ (LETT |urcRoot| NIL) (LETT #2# |urcRoots|) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |urcRoot| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |urcRoot| (QREFELT % 111))
                              (LETT |toSee|
                                    (CONS
                                     (VECTOR (CONS |urcRoot| |lr|) |lv| |lq2|)
                                     |toSee|))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;positiveSolve;LBL;18|
        ((|lp| (|List| (|Polynomial| R))) (|info?| (|Boolean|))
         (% (|List| (|List| (|RealClosure| (|Fraction| R))))))
        (SPADCALL |lp| |info?| NIL (QREFELT % 113))) 

(SDEFUN |ZDSOLVE;positiveSolve;LL;19|
        ((|lp| (|List| (|Polynomial| R)))
         (% (|List| (|List| (|RealClosure| (|Fraction| R))))))
        (SPADCALL |lp| NIL NIL (QREFELT % 113))) 

(SDEFUN |ZDSOLVE;univariateSolve;RcL;20|
        ((|ts| (|RegularChain| R |ls|))
         (%
          (|List|
           (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                     (|:| |coordinates| (|List| (|Polynomial| R)))))))
        (SPROG
         ((|toSave|
           (|List|
            (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                      (|:| |coordinates| (|List| (|Polynomial| R))))))
          (|lc| (|List| (|Polynomial| R))) (#1=#:G236 NIL) (|q2| NIL)
          (#2=#:G235 NIL) (|g| (|SparseUnivariatePolynomial| R))
          (#3=#:G221 NIL) (#4=#:G234 NIL) (|us| NIL)
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
          (#5=#:G233 NIL) (|st| NIL)
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
         (SEQ (LETT |toSee| (SPADCALL |ts| (QREFELT % 57))) (LETT |toSave| NIL)
              (SEQ (LETT |st| NIL) (LETT #5# |toSee|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |st| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |lus| (SPADCALL |st| 'T (QREFELT % 117)))
                        (EXIT
                         (SEQ (LETT |us| NIL) (LETT #4# |lus|) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |us| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |g|
                                     (SPADCALL
                                      (PROG2
                                          (LETT #3#
                                                (SPADCALL |us| (QREFELT % 16)
                                                          (QREFELT % 119)))
                                          (QCDR #3#)
                                        (|check_union2| (QEQCAR #3# 0)
                                                        (|NewSparseMultivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|OrderedVariableList|
                                                          (QREFELT % 8)))
                                                        (|Union|
                                                         (|NewSparseMultivariatePolynomial|
                                                          (QREFELT % 6)
                                                          (|OrderedVariableList|
                                                           (QREFELT % 8)))
                                                         "failed")
                                                        #3#))
                                      (QREFELT % 120)))
                               (LETT |lc|
                                     (PROGN
                                      (LETT #2# NIL)
                                      (SEQ (LETT |q2| NIL)
                                           (LETT #1#
                                                 (SPADCALL
                                                  (SPADCALL |us| (QREFELT % 16)
                                                            (QREFELT % 121))
                                                  (QREFELT % 93)))
                                           G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |q2| (CAR #1#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #2#
                                                   (CONS
                                                    (SPADCALL |q2|
                                                              (QREFELT % 122))
                                                    #2#))))
                                           (LETT #1# (CDR #1#)) (GO G190) G191
                                           (EXIT (NREVERSE #2#)))))
                               (EXIT
                                (LETT |toSave|
                                      (CONS (CONS |g| |lc|) |toSave|))))
                              (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;univariateSolve;L3BL;21|
        ((|lp| (|List| (|Polynomial| R))) (|info?| (|Boolean|))
         (|check?| (|Boolean|)) (|lextri?| (|Boolean|))
         (%
          (|List|
           (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                     (|:| |coordinates| (|List| (|Polynomial| R)))))))
        (SPROG
         ((|toSave|
           (|List|
            (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                      (|:| |coordinates| (|List| (|Polynomial| R))))))
          (|lc| (|List| (|Polynomial| R))) (#1=#:G281 NIL) (|q2| NIL)
          (#2=#:G280 NIL) (|g| (|SparseUnivariatePolynomial| R))
          (#3=#:G260 NIL) (#4=#:G270 NIL)
          (|rems|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls2|))))
          (#5=#:G279 NIL) (#6=#:G278 NIL) (#7=#:G277 NIL) (|us| NIL)
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
          (#8=#:G276 NIL) (|st| NIL)
          (|lq2|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls2|))))
          (#9=#:G275 NIL) (|p| NIL) (#10=#:G274 NIL)
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
          (#11=#:G273 NIL) (|ts| NIL) (|lts| (|List| (|RegularChain| R |ls|)))
          (|lq|
           (|List|
            (|NewSparseMultivariatePolynomial| R
                                               (|OrderedVariableList| |ls|))))
          (#12=#:G272 NIL) (#13=#:G271 NIL))
         (SEQ
          (LETT |lq|
                (PROGN
                 (LETT #13# NIL)
                 (SEQ (LETT |p| NIL) (LETT #12# |lp|) G190
                      (COND
                       ((OR (ATOM #12#) (PROGN (LETT |p| (CAR #12#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #13# (CONS (SPADCALL |p| (QREFELT % 59)) #13#))))
                      (LETT #12# (CDR #12#)) (GO G190) G191
                      (EXIT (NREVERSE #13#)))))
          (COND (|lextri?| (LETT |lts| (SPADCALL |lq| NIL (QREFELT % 62))))
                ('T (LETT |lts| (SPADCALL |lq| 'T |info?| (QREFELT % 64)))))
          (LETT |toSee| NIL)
          (SEQ (LETT |ts| NIL) (LETT #11# |lts|) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |ts| (CAR #11#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |toSee|
                       (SPADCALL (SPADCALL |ts| (QREFELT % 57)) |toSee|
                                 (QREFELT % 103)))))
               (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
          (LETT |toSee| (SPADCALL |toSee| (QREFELT % 105))) (LETT |toSave| NIL)
          (COND
           (|check?|
            (LETT |lq2|
                  (PROGN
                   (LETT #10# NIL)
                   (SEQ (LETT |p| NIL) (LETT #9# |lp|) G190
                        (COND
                         ((OR (ATOM #9#) (PROGN (LETT |p| (CAR #9#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #10#
                                (CONS (SPADCALL |p| (QREFELT % 126)) #10#))))
                        (LETT #9# (CDR #9#)) (GO G190) G191
                        (EXIT (NREVERSE #10#)))))))
          (SEQ (LETT |st| NIL) (LETT #8# |toSee|) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |st| (CAR #8#)) NIL)) (GO G191)))
               (SEQ (LETT |lus| (SPADCALL |st| 'T (QREFELT % 117)))
                    (EXIT
                     (SEQ (LETT |us| NIL) (LETT #7# |lus|) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |us| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (COND
                            (|check?|
                             (SEQ
                              (EXIT
                               (SEQ
                                (LETT |rems|
                                      (PROGN
                                       (LETT #6# NIL)
                                       (SEQ (LETT |q2| NIL) (LETT #5# |lq2|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |q2| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (SPADCALL |q2| |us|
                                                               (QREFELT % 127))
                                                     #6#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #6#)))))
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL (ELT % 130) |rems|
                                              (QREFELT % 132)))
                                   (PROGN
                                    (LETT #4#
                                          (SEQ
                                           (SPADCALL
                                            (SPADCALL |st| (QREFELT % 134))
                                            (QREFELT % 137))
                                           (SPADCALL "Has a bad RUR component:"
                                                     (QREFELT % 139))
                                           (SPADCALL
                                            (SPADCALL |us| (QREFELT % 134))
                                            (QREFELT % 137))
                                           (EXIT
                                            (|error|
                                             "univariateSolve$ZDSOLVE: bad RUR"))))
                                    (GO #14=#:G258)))))))
                              #14# (EXIT #4#))))
                           (LETT |g|
                                 (SPADCALL
                                  (PROG2
                                      (LETT #3#
                                            (SPADCALL |us| (QREFELT % 16)
                                                      (QREFELT % 119)))
                                      (QCDR #3#)
                                    (|check_union2| (QEQCAR #3# 0)
                                                    (|NewSparseMultivariatePolynomial|
                                                     (QREFELT % 6)
                                                     (|OrderedVariableList|
                                                      (QREFELT % 8)))
                                                    (|Union|
                                                     (|NewSparseMultivariatePolynomial|
                                                      (QREFELT % 6)
                                                      (|OrderedVariableList|
                                                       (QREFELT % 8)))
                                                     "failed")
                                                    #3#))
                                  (QREFELT % 120)))
                           (LETT |lc|
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |q2| NIL)
                                       (LETT #1#
                                             (SPADCALL
                                              (SPADCALL |us| (QREFELT % 16)
                                                        (QREFELT % 121))
                                              (QREFELT % 93)))
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |q2| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |q2| (QREFELT % 122))
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#)))))
                           (EXIT
                            (LETT |toSave| (CONS (CONS |g| |lc|) |toSave|))))
                          (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))))
               (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
          (EXIT |toSave|)))) 

(SDEFUN |ZDSOLVE;univariateSolve;L2BL;22|
        ((|lp| (|List| (|Polynomial| R))) (|info?| (|Boolean|))
         (|check?| (|Boolean|))
         (%
          (|List|
           (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                     (|:| |coordinates| (|List| (|Polynomial| R)))))))
        (SPADCALL |lp| |info?| |check?| NIL (QREFELT % 140))) 

(SDEFUN |ZDSOLVE;univariateSolve;LBL;23|
        ((|lp| (|List| (|Polynomial| R))) (|info?| (|Boolean|))
         (%
          (|List|
           (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                     (|:| |coordinates| (|List| (|Polynomial| R)))))))
        (SPADCALL |lp| |info?| NIL NIL (QREFELT % 140))) 

(SDEFUN |ZDSOLVE;univariateSolve;LL;24|
        ((|lp| (|List| (|Polynomial| R)))
         (%
          (|List|
           (|Record| (|:| |complexRoots| (|SparseUnivariatePolynomial| R))
                     (|:| |coordinates| (|List| (|Polynomial| R)))))))
        (SPADCALL |lp| NIL NIL NIL (QREFELT % 140))) 

(DECLAIM (NOTINLINE |ZeroDimensionalSolvePackage;|)) 

(DEFUN |ZeroDimensionalSolvePackage;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G29 NIL) (|pv$| NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|ZeroDimensionalSolvePackage| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 144))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|ZeroDimensionalSolvePackage|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 12 (SPADCALL |#3| (QREFELT % 11)))
    (QSETREFV % 16
              (PROG2 (LETT #1# (SPADCALL (QREFELT % 12) (QREFELT % 15)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) (|OrderedVariableList| |#3|)
                                (|Union| (|OrderedVariableList| |#3|) "failed")
                                #1#)))
    (QSETREFV % 19 (SPADCALL (QREFELT % 16) (QREFELT % 18)))
    %))) 

(DEFUN |ZeroDimensionalSolvePackage| (&REST #1=#:G288)
  (SPROG NIL
         (PROG (#2=#:G289)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache| '|ZeroDimensionalSolvePackage|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ZeroDimensionalSolvePackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ZeroDimensionalSolvePackage|)))))))))) 

(MAKEPROP '|ZeroDimensionalSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (|List| 9) (0 . |last|) '|news|
              (|Union| % '"failed")
              (|OrderedVariableList| (NRTEVAL (QREFELT % 8))) (5 . |variable|)
              '|newv| (|NewSparseMultivariatePolynomial| 6 14) (10 . |coerce|)
              '|newq| (|Boolean|) (|NewSparseMultivariatePolynomial| 6 26)
              (15 . |ground?|) (20 . |ground|) (25 . |coerce|) (30 . |Zero|)
              (|OrderedVariableList| (NRTEVAL (QREFELT % 7))) (34 . |mvar|)
              (|NonNegativeInteger|) (39 . |mdeg|) (44 . |convert|)
              (49 . |init|) |ZDSOLVE;convert;NsmpNsmp;1| (54 . ^) (60 . *)
              (66 . +) (72 . |tail|) (|List| 17)
              (|SquareFreeRegularTriangularSet| 6 (|IndexedExponents| 14) 14
                                                17)
              (77 . |construct|) (|List| 21)
              (|RegularChain| 6 (NRTEVAL (QREFELT % 7))) (82 . |parts|)
              (87 . |infRittWu?|) (|Mapping| 20 17 17) (93 . |sort|)
              (|Record| (|:| |val| 17) (|:| |tower| %)) (|List| 46)
              (99 . |squareFreePart|) (105 . |init|) (110 . |ground?|)
              (|NormalizationPackage| 6 (|IndexedExponents| 14) 14 17 38)
              (115 . |normalizedAssociate|) (121 . |internalAugment|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 17) (|:| |den| 6))
              (127 . |remainder|) (|List| 38) |ZDSOLVE;squareFree;RcL;2|
              (|Polynomial| 6) (133 . |convert|) (|List| 41)
              (|LexTriangularPackage| 6 (NRTEVAL (QREFELT % 7)))
              (138 . |zeroSetSplit|) (|List| %) (144 . |zeroSetSplit|)
              (|List| 58) |ZDSOLVE;triangSolve;L2BL;3|
              |ZDSOLVE;triangSolve;LBL;4| |ZDSOLVE;triangSolve;LL;5|
              (|SparseUnivariatePolynomial| 6) (151 . |zero?|)
              (|SparseUnivariatePolynomial| 77) (156 . |Zero|)
              (160 . |ground?|) (165 . |ground|) (|Fraction| 6)
              (170 . |coerce|) (|RealClosure| 75) (175 . |coerce|)
              (180 . |coerce|) (185 . |leadingCoefficient|) (190 . |degree|)
              (195 . |monomial|) (201 . +) (207 . |reductum|)
              |ZDSOLVE;convert;SupSup;6| (|Polynomial| 77) (|Mapping| 77 6)
              (|PolynomialFunctions2| 6 77) (212 . |map|)
              |ZDSOLVE;convert;PP;8| (218 . |coerce|) |ZDSOLVE;convert;NsmpP;9|
              (223 . |parts|) |ZDSOLVE;convert;SfrtsL;10| (228 . |eval|)
              (|Union| 9 '"failed") (235 . |mainVariable|) (240 . |univariate|)
              (|SparseUnivariatePolynomial| %) (245 . |allRootsOf|)
              (|List| (|List| 77)) |ZDSOLVE;realSolve;RcL;11| (250 . |concat|)
              (|SquareFreeQuasiComponentPackage| 6 (|IndexedExponents| 14) 14
                                                 17 38)
              (256 . |removeSuperfluousQuasiComponents|) (261 . |zero?|)
              |ZDSOLVE;realSolve;L3BL;12| |ZDSOLVE;realSolve;L2BL;13|
              |ZDSOLVE;realSolve;LBL;14| |ZDSOLVE;realSolve;LL;15|
              (266 . |positive?|) |ZDSOLVE;positiveSolve;RcL;16|
              |ZDSOLVE;positiveSolve;L2BL;17| |ZDSOLVE;positiveSolve;LBL;18|
              |ZDSOLVE;positiveSolve;LL;19|
              (|InternalRationalUnivariateRepresentationPackage| 6
                                                                 (|IndexedExponents|
                                                                  14)
                                                                 14 17 38)
              (271 . |rur|) (|Union| 17 '"failed") (277 . |select|)
              (283 . |univariate|) (288 . |collectUpper|) (294 . |convert|)
              (|Record| (|:| |complexRoots| 69) (|:| |coordinates| 65))
              (|List| 123) |ZDSOLVE;univariateSolve;RcL;20| (299 . |convert|)
              (304 . |removeZero|) (310 . |zero?|) (315 . |zero?|)
              (320 . |zero?|) (|Mapping| 20 17) (325 . |every?|) (|OutputForm|)
              (331 . |coerce|) (|Void|) (|OutputPackage|) (336 . |output|)
              (|String|) (341 . |output|) |ZDSOLVE;univariateSolve;L3BL;21|
              |ZDSOLVE;univariateSolve;L2BL;22|
              |ZDSOLVE;univariateSolve;LBL;23| |ZDSOLVE;univariateSolve;LL;24|)
           '#(|univariateSolve| 346 |triangSolve| 377 |squareFree| 395
              |realSolve| 400 |positiveSolve| 431 |convert| 454)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|triangSolve|
                                 ((|List| (|RegularChain| |#1| |#2|))
                                  (|List| (|Polynomial| |#1|)) (|Boolean|)
                                  (|Boolean|)))
                                T)
                              '((|triangSolve|
                                 ((|List| (|RegularChain| |#1| |#2|))
                                  (|List| (|Polynomial| |#1|)) (|Boolean|)))
                                T)
                              '((|triangSolve|
                                 ((|List| (|RegularChain| |#1| |#2|))
                                  (|List| (|Polynomial| |#1|))))
                                T)
                              '((|univariateSolve|
                                 ((|List|
                                   (|Record|
                                    (|:| |complexRoots|
                                         (|SparseUnivariatePolynomial| |#1|))
                                    (|:| |coordinates|
                                         (|List| (|Polynomial| |#1|)))))
                                  (|RegularChain| |#1| |#2|)))
                                T)
                              '((|univariateSolve|
                                 ((|List|
                                   (|Record|
                                    (|:| |complexRoots|
                                         (|SparseUnivariatePolynomial| |#1|))
                                    (|:| |coordinates|
                                         (|List| (|Polynomial| |#1|)))))
                                  (|List| (|Polynomial| |#1|)) (|Boolean|)
                                  (|Boolean|) (|Boolean|)))
                                T)
                              '((|univariateSolve|
                                 ((|List|
                                   (|Record|
                                    (|:| |complexRoots|
                                         (|SparseUnivariatePolynomial| |#1|))
                                    (|:| |coordinates|
                                         (|List| (|Polynomial| |#1|)))))
                                  (|List| (|Polynomial| |#1|)) (|Boolean|)
                                  (|Boolean|)))
                                T)
                              '((|univariateSolve|
                                 ((|List|
                                   (|Record|
                                    (|:| |complexRoots|
                                         (|SparseUnivariatePolynomial| |#1|))
                                    (|:| |coordinates|
                                         (|List| (|Polynomial| |#1|)))))
                                  (|List| (|Polynomial| |#1|)) (|Boolean|)))
                                T)
                              '((|univariateSolve|
                                 ((|List|
                                   (|Record|
                                    (|:| |complexRoots|
                                         (|SparseUnivariatePolynomial| |#1|))
                                    (|:| |coordinates|
                                         (|List| (|Polynomial| |#1|)))))
                                  (|List| (|Polynomial| |#1|))))
                                T)
                              '((|realSolve|
                                 ((|List|
                                   (|List| (|RealClosure| (|Fraction| |#1|))))
                                  (|RegularChain| |#1| |#2|)))
                                T)
                              '((|realSolve|
                                 ((|List|
                                   (|List| (|RealClosure| (|Fraction| |#1|))))
                                  (|List| (|Polynomial| |#1|)) (|Boolean|)
                                  (|Boolean|) (|Boolean|)))
                                T)
                              '((|realSolve|
                                 ((|List|
                                   (|List| (|RealClosure| (|Fraction| |#1|))))
                                  (|List| (|Polynomial| |#1|)) (|Boolean|)
                                  (|Boolean|)))
                                T)
                              '((|realSolve|
                                 ((|List|
                                   (|List| (|RealClosure| (|Fraction| |#1|))))
                                  (|List| (|Polynomial| |#1|)) (|Boolean|)))
                                T)
                              '((|realSolve|
                                 ((|List|
                                   (|List| (|RealClosure| (|Fraction| |#1|))))
                                  (|List| (|Polynomial| |#1|))))
                                T)
                              '((|positiveSolve|
                                 ((|List|
                                   (|List| (|RealClosure| (|Fraction| |#1|))))
                                  (|RegularChain| |#1| |#2|)))
                                T)
                              '((|positiveSolve|
                                 ((|List|
                                   (|List| (|RealClosure| (|Fraction| |#1|))))
                                  (|List| (|Polynomial| |#1|)) (|Boolean|)
                                  (|Boolean|)))
                                T)
                              '((|positiveSolve|
                                 ((|List|
                                   (|List| (|RealClosure| (|Fraction| |#1|))))
                                  (|List| (|Polynomial| |#1|)) (|Boolean|)))
                                T)
                              '((|positiveSolve|
                                 ((|List|
                                   (|List| (|RealClosure| (|Fraction| |#1|))))
                                  (|List| (|Polynomial| |#1|))))
                                T)
                              '((|squareFree|
                                 ((|List|
                                   (|SquareFreeRegularTriangularSet| |#1|
                                                                     (|IndexedExponents|
                                                                      (|OrderedVariableList|
                                                                       |#3|))
                                                                     (|OrderedVariableList|
                                                                      |#3|)
                                                                     (|NewSparseMultivariatePolynomial|
                                                                      |#1|
                                                                      (|OrderedVariableList|
                                                                       |#3|))))
                                  (|RegularChain| |#1| |#2|)))
                                T)
                              '((|convert|
                                 ((|NewSparseMultivariatePolynomial| |#1|
                                                                     (|OrderedVariableList|
                                                                      |#3|))
                                  (|NewSparseMultivariatePolynomial| |#1|
                                                                     (|OrderedVariableList|
                                                                      |#2|))))
                                T)
                              '((|convert|
                                 ((|Polynomial|
                                   (|RealClosure| (|Fraction| |#1|)))
                                  (|Polynomial| |#1|)))
                                T)
                              '((|convert|
                                 ((|Polynomial|
                                   (|RealClosure| (|Fraction| |#1|)))
                                  (|NewSparseMultivariatePolynomial| |#1|
                                                                     (|OrderedVariableList|
                                                                      |#3|))))
                                T)
                              '((|convert|
                                 ((|SparseUnivariatePolynomial|
                                   (|RealClosure| (|Fraction| |#1|)))
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|convert|
                                 ((|List|
                                   (|NewSparseMultivariatePolynomial| |#1|
                                                                      (|OrderedVariableList|
                                                                       |#3|)))
                                  (|SquareFreeRegularTriangularSet| |#1|
                                                                    (|IndexedExponents|
                                                                     (|OrderedVariableList|
                                                                      |#3|))
                                                                    (|OrderedVariableList|
                                                                     |#3|)
                                                                    (|NewSparseMultivariatePolynomial|
                                                                     |#1|
                                                                     (|OrderedVariableList|
                                                                      |#3|)))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 143
                                            '(1 10 9 0 11 1 14 13 9 15 1 17 0
                                              14 18 1 21 20 0 22 1 21 6 0 23 1
                                              17 0 6 24 0 17 0 25 1 21 26 0 27
                                              1 21 28 0 29 1 26 9 0 30 1 21 0 0
                                              31 2 17 0 0 28 33 2 17 0 0 0 34 2
                                              17 0 0 0 35 1 21 0 0 36 1 38 0 37
                                              39 1 41 40 0 42 2 17 20 0 0 43 2
                                              37 0 44 0 45 2 38 47 17 0 48 1 17
                                              0 0 49 1 17 20 0 50 2 51 17 17 38
                                              52 2 38 0 17 0 53 2 38 54 17 0 55
                                              1 21 0 58 59 2 61 60 40 20 62 3
                                              41 63 40 20 20 64 1 69 20 0 70 0
                                              71 0 72 1 69 20 0 73 1 69 6 0 74
                                              1 75 0 6 76 1 77 0 75 78 1 71 0
                                              77 79 1 69 6 0 80 1 69 28 0 81 2
                                              71 0 77 28 82 2 71 0 0 0 83 1 69
                                              0 0 84 2 88 86 87 58 89 1 17 58 0
                                              91 1 38 37 0 93 3 86 0 0 9 77 95
                                              1 86 96 0 97 1 86 71 0 98 1 77 63
                                              99 100 2 56 0 0 0 103 1 104 56 56
                                              105 1 86 20 0 106 1 77 20 0 111 2
                                              116 56 38 20 117 2 38 118 0 14
                                              119 1 17 69 0 120 2 38 0 0 14 121
                                              1 17 58 0 122 1 17 0 58 126 2 38
                                              17 17 0 127 1 58 20 0 128 1 21 20
                                              0 129 1 17 20 0 130 2 37 20 131 0
                                              132 1 38 133 0 134 1 136 135 133
                                              137 1 136 135 138 139 2 0 124 65
                                              20 142 1 0 124 65 143 3 0 124 65
                                              20 20 141 1 0 124 41 125 4 0 124
                                              65 20 20 20 140 1 0 60 65 68 3 0
                                              60 65 20 20 66 2 0 60 65 20 67 1
                                              0 56 41 57 1 0 101 65 110 2 0 101
                                              65 20 109 4 0 101 65 20 20 20 107
                                              3 0 101 65 20 20 108 1 0 101 41
                                              102 2 0 101 65 20 114 1 0 101 65
                                              115 3 0 101 65 20 20 113 1 0 101
                                              41 112 1 0 71 69 85 1 0 37 38 94
                                              1 0 86 17 92 1 0 17 21 32 1 0 86
                                              58 90)))))
           '|lookupComplete|)) 
