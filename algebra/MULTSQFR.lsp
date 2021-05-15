
(SDEFUN |MULTSQFR;nsqfree;SupLLR;1|
        ((|oldf| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |unitPart| P)
          (|:| |suPart|
               (|List|
                (|Record| (|:| |factor| (|SparseUnivariatePolynomial| P))
                          (|:| |exponent| (|NonNegativeInteger|)))))))
        (SPROG
         ((#1=#:G430 NIL)
          (|sqlead|
           (|List|
            (|Record| (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#2=#:G435 NIL)
          (|nsqlead|
           (|List|
            (|Record| (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|nff| (P)) (|lcr| (P)) (#3=#:G449 NIL) (|hh1| (P)) (#4=#:G433 NIL)
          (|h1| (|Union| P #5="failed")) (|unitsq| (P)) (#6=#:G451 NIL)
          (|lpfact| NIL) (|f0| #7=(|SparseUnivariatePolynomial| R))
          (|f| (|SparseUnivariatePolynomial| P))
          (|sqdec|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| P))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#8=#:G450 NIL)
          (|h| (|Union| (|SparseUnivariatePolynomial| P) #9="failed"))
          (|r1| (|SparseUnivariatePolynomial| P))
          (|result0| (|SparseUnivariatePolynomial| P))
          (|result|
           (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (#10=#:G423 NIL) (|ldeg| (|List| (|NonNegativeInteger|)))
          (|lcoef| (P)) (|d0| #11=(|SparseUnivariatePolynomial| R))
          (|d| #12=(|SparseUnivariatePolynomial| P)) (|#G12| #11#)
          (|#G11| #12#)
          (|npol| (|Record| (|:| |pol| #12#) (|:| |polval| #11#)))
          (|g0| #13=(|SparseUnivariatePolynomial| R))
          (|gg|
           (|Record| (|:| |unit| P) (|:| |canonical| P) (|:| |associate| P)))
          (#14=#:G416 NIL)
          (|lfact|
           #15=(|List|
                (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                          (|:| |exponent| (|NonNegativeInteger|)))))
          (|exp0| (|NonNegativeInteger|)) (|#G10| (|NonNegativeInteger|))
          (|#G9| #13#)
          (|pfact|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|sqlc| (|Factored| P)) (|leadpol| (|Boolean|)) (|lcf| (P))
          (|ctf| (R)) (|lval| #16=(|List| R))
          (|univPol|
           (|Record| (|:| |upol| #7#) (|:| |Lval| #16#) (|:| |Lfact| #15#)
                     (|:| |ctpol| R))))
         (SEQ
          (EXIT
           (SEQ (LETT |f| |oldf|)
                (LETT |univPol| (SPADCALL |f| |lvar| |ltry| (QREFELT $ 20)))
                (LETT |f0| (QVELT |univPol| 0))
                (EXIT
                 (COND
                  ((SPADCALL |f0| (|spadConstant| $ 22) (QREFELT $ 24))
                   (CONS (|spadConstant| $ 25) (LIST (CONS |f| 1))))
                  ('T
                   (SEQ (LETT |lfact| (QVELT |univPol| 2))
                        (LETT |lval| (QVELT |univPol| 1))
                        (LETT |ctf| (QVELT |univPol| 3)) (LETT |leadpol| NIL)
                        (LETT |sqdec| NIL) (LETT |exp0| 0)
                        (LETT |unitsq| (|spadConstant| $ 25))
                        (LETT |lcf| (SPADCALL |f| (QREFELT $ 27)))
                        (COND
                         ((SPADCALL |ctf| (|spadConstant| $ 26) (QREFELT $ 28))
                          (SEQ (LETT |f0| (SPADCALL |ctf| |f0| (QREFELT $ 29)))
                               (LETT |f|
                                     (SPADCALL (SPADCALL |ctf| (QREFELT $ 30))
                                               |f| (QREFELT $ 31)))
                               (EXIT
                                (LETT |lcf|
                                      (SPADCALL |ctf| |lcf|
                                                (QREFELT $ 32)))))))
                        (LETT |sqlead| NIL) (LETT |sqlc| (|spadConstant| $ 34))
                        (COND
                         ((SPADCALL |lcf| (|spadConstant| $ 25) (QREFELT $ 35))
                          (SEQ (LETT |leadpol| 'T)
                               (LETT |sqlc| (SPADCALL |lcf| (QREFELT $ 36)))
                               (LETT |unitsq|
                                     (SPADCALL |unitsq|
                                               (SPADCALL |sqlc| (QREFELT $ 37))
                                               (QREFELT $ 38)))
                               (EXIT
                                (LETT |sqlead|
                                      (SPADCALL |sqlc| (QREFELT $ 41)))))))
                        (LETT |lfact|
                              (SPADCALL
                               (CONS #'|MULTSQFR;nsqfree;SupLLR;1!0| $) |lfact|
                               (QREFELT $ 46)))
                        (SEQ G190
                             (COND
                              ((NULL (SPADCALL |lfact| NIL (QREFELT $ 47)))
                               (GO G191)))
                             (SEQ (LETT |pfact| (|SPADfirst| |lfact|))
                                  (PROGN
                                   (LETT |#G9| (QCAR |pfact|))
                                   (LETT |#G10| (QCDR |pfact|))
                                   (LETT |g0| |#G9|)
                                   (LETT |exp0| |#G10|))
                                  (LETT |lfact| (CDR |lfact|))
                                  (COND
                                   ((SPADCALL |lfact| NIL (QREFELT $ 48))
                                    (COND
                                     ((EQL |exp0| 1)
                                      (EXIT
                                       (SEQ
                                        (LETT |f|
                                              (PROG2
                                                  (LETT #14#
                                                        (SPADCALL |f|
                                                                  (SPADCALL
                                                                   |ctf|
                                                                   (QREFELT $
                                                                            30))
                                                                  (QREFELT $
                                                                           50)))
                                                  (QCDR #14#)
                                                (|check_union2| (QEQCAR #14# 0)
                                                                (|SparseUnivariatePolynomial|
                                                                 (QREFELT $ 9))
                                                                (|Union|
                                                                 (|SparseUnivariatePolynomial|
                                                                  (QREFELT $
                                                                           9))
                                                                 "failed")
                                                                #14#)))
                                        (LETT |gg|
                                              (SPADCALL
                                               (SPADCALL |f| (QREFELT $ 27))
                                               (QREFELT $ 52)))
                                        (LETT |sqdec|
                                              (CONS
                                               (CONS
                                                (SPADCALL (QVELT |gg| 2) |f|
                                                          (QREFELT $ 31))
                                                |exp0|)
                                               |sqdec|))
                                        (EXIT
                                         (PROGN
                                          (LETT #8#
                                                (CONS (QVELT |gg| 0) |sqdec|))
                                          (GO #17=#:G448)))))))))
                                  (COND
                                   ((SPADCALL |ctf| (|spadConstant| $ 26)
                                              (QREFELT $ 28))
                                    (LETT |g0|
                                          (SPADCALL |ctf| |g0|
                                                    (QREFELT $ 29)))))
                                  (LETT |npol|
                                        (SPADCALL |f| |f0| |exp0|
                                                  (QREFELT $ 54)))
                                  (PROGN
                                   (LETT |#G11| (QCAR |npol|))
                                   (LETT |#G12| (QCDR |npol|))
                                   (LETT |d| |#G11|)
                                   (LETT |d0| |#G12|))
                                  (COND
                                   (|leadpol|
                                    (LETT |lcoef|
                                          (SPADCALL |exp0| |unitsq| |sqlead|
                                                    (QREFELT $ 55))))
                                   ('T (LETT |lcoef| (|spadConstant| $ 25))))
                                  (LETT |ldeg|
                                        (SPADCALL |f| |lvar| |exp0|
                                                  (QREFELT $ 57)))
                                  (LETT |result|
                                        (SPADCALL |d| |g0|
                                                  (PROG2
                                                      (LETT #10#
                                                            (SPADCALL |d0| |g0|
                                                                      (QREFELT
                                                                       $ 58)))
                                                      (QCDR #10#)
                                                    (|check_union2|
                                                     (QEQCAR #10# 0)
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 8))
                                                     (|Union|
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 8))
                                                      #9#)
                                                     #10#))
                                                  |lcoef| |lvar| |ldeg| |lval|
                                                  (QREFELT $ 61)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |result| 1)
                                     (PROGN
                                      (LETT #8#
                                            (SPADCALL |oldf| |lvar| |ltry|
                                                      (QREFELT $ 64)))
                                      (GO #17#)))
                                    ('T
                                     (SEQ
                                      (LETT |result0|
                                            (SPADCALL (QCDR |result|) 1
                                                      (QREFELT $ 66)))
                                      (LETT |r1|
                                            (SPADCALL |result0| |exp0|
                                                      (QREFELT $ 67)))
                                      (SEQ
                                       (LETT |h|
                                             (SPADCALL |f| |r1|
                                                       (QREFELT $ 68)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |h| 1)
                                          (PROGN
                                           (LETT #8#
                                                 (SPADCALL |oldf| |lvar| NIL
                                                           (QREFELT $ 64)))
                                           (GO #17#))))))
                                      (LETT |sqdec|
                                            (CONS (CONS |result0| |exp0|)
                                                  |sqdec|))
                                      (LETT |f| (QCDR |h|))
                                      (LETT |f0|
                                            (SPADCALL (QCDR |h|) |lvar| |lval|
                                                      (QREFELT $ 70)))
                                      (LETT |lcr|
                                            (SPADCALL |result0|
                                                      (QREFELT $ 27)))
                                      (LETT |nsqlead| |sqlead|)
                                      (SEQ (LETT |lpfact| NIL)
                                           (LETT #6# |sqlead|) G190
                                           (COND
                                            ((OR (ATOM #6#)
                                                 (PROGN
                                                  (LETT |lpfact| (CAR #6#))
                                                  NIL)
                                                 (NULL
                                                  (SPADCALL |lcr|
                                                            (|spadConstant| $
                                                                            25)
                                                            (QREFELT $ 35))))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((SPADCALL |lcr| (QREFELT $ 71))
                                               (SEQ
                                                (LETT |unitsq|
                                                      (PROG2
                                                          (LETT #1#
                                                                (SPADCALL
                                                                 |unitsq| |lcr|
                                                                 (QREFELT $
                                                                          72)))
                                                          (QCDR #1#)
                                                        (|check_union2|
                                                         (QEQCAR #1# 0)
                                                         (QREFELT $ 9)
                                                         (|Union| (QREFELT $ 9)
                                                                  #5#)
                                                         #1#)))
                                                (EXIT
                                                 (LETT |lcr|
                                                       (|spadConstant| $
                                                                       25)))))
                                              ('T
                                               (SEQ
                                                (EXIT
                                                 (SEQ G190 NIL
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((< (QCDR |lpfact|)
                                                             |exp0|)
                                                          (PROGN
                                                           (LETT #3#
                                                                 |$NoValue|)
                                                           (GO #18=#:G440)))
                                                         ('T
                                                          (SEQ
                                                           (LETT |h1|
                                                                 (SPADCALL
                                                                  |lcr|
                                                                  (QCAR
                                                                   |lpfact|)
                                                                  (QREFELT $
                                                                           72)))
                                                           (EXIT
                                                            (COND
                                                             ((QEQCAR |h1| 0)
                                                              (SEQ
                                                               (LETT |lcr|
                                                                     (QCDR
                                                                      |h1|))
                                                               (EXIT
                                                                (PROGN
                                                                 (RPLACD
                                                                  |lpfact|
                                                                  (PROG1
                                                                      (LETT #4#
                                                                            (-
                                                                             (QCDR
                                                                              |lpfact|)
                                                                             |exp0|))
                                                                    (|check_subtype2|
                                                                     (>= #4# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #4#)))
                                                                 (QCDR
                                                                  |lpfact|)))))
                                                             ('T
                                                              (SEQ
                                                               (LETT |hh1|
                                                                     (SPADCALL
                                                                      |lcr|
                                                                      (QCAR
                                                                       |lpfact|)
                                                                      (QREFELT
                                                                       $ 73)))
                                                               (EXIT
                                                                (COND
                                                                 ((SPADCALL
                                                                   |hh1|
                                                                   (|spadConstant|
                                                                    $ 25)
                                                                   (QREFELT $
                                                                            74))
                                                                  (PROGN
                                                                   (LETT #3#
                                                                         |$NoValue|)
                                                                   (GO #18#)))
                                                                 ('T
                                                                  (SEQ
                                                                   (LETT |lcr|
                                                                         (PROG2
                                                                             (LETT
                                                                              #1#
                                                                              (SPADCALL
                                                                               |lcr|
                                                                               |hh1|
                                                                               (QREFELT
                                                                                $
                                                                                72)))
                                                                             (QCDR
                                                                              #1#)
                                                                           (|check_union2|
                                                                            (QEQCAR
                                                                             #1#
                                                                             0)
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            (|Union|
                                                                             (QREFELT
                                                                              $
                                                                              9)
                                                                             #5#)
                                                                            #1#)))
                                                                   (LETT |nff|
                                                                         (PROG2
                                                                             (LETT
                                                                              #1#
                                                                              (SPADCALL
                                                                               (QCAR
                                                                                |lpfact|)
                                                                               |hh1|
                                                                               (QREFELT
                                                                                $
                                                                                72)))
                                                                             (QCDR
                                                                              #1#)
                                                                           (|check_union2|
                                                                            (QEQCAR
                                                                             #1#
                                                                             0)
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            (|Union|
                                                                             (QREFELT
                                                                              $
                                                                              9)
                                                                             #5#)
                                                                            #1#)))
                                                                   (LETT
                                                                    |nsqlead|
                                                                    (CONS
                                                                     (CONS
                                                                      |nff|
                                                                      (QCDR
                                                                       |lpfact|))
                                                                     |nsqlead|))
                                                                   (PROGN
                                                                    (RPLACA
                                                                     |lpfact|
                                                                     |hh1|)
                                                                    (QCAR
                                                                     |lpfact|))
                                                                   (EXIT
                                                                    (PROGN
                                                                     (RPLACD
                                                                      |lpfact|
                                                                      (PROG1
                                                                          (LETT
                                                                           #2#
                                                                           (-
                                                                            (QCDR
                                                                             |lpfact|)
                                                                            |exp0|))
                                                                        (|check_subtype2|
                                                                         (>=
                                                                          #2#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         '(|Integer|)
                                                                         #2#)))
                                                                     (QCDR
                                                                      |lpfact|))))))))))))))))
                                                      NIL (GO G190) G191
                                                      (EXIT NIL)))
                                                #18# (EXIT #3#))))))
                                           (LETT #6# (CDR #6#)) (GO G190) G191
                                           (EXIT NIL))
                                      (EXIT (LETT |sqlead| |nsqlead|)))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (CONS
                          (PROG2
                              (LETT #1#
                                    (SPADCALL (SPADCALL |f| (QREFELT $ 77))
                                              |ctf| (QREFELT $ 78)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                            (|Union| (QREFELT $ 9) #5#) #1#))
                          |sqdec|))))))))
          #17# (EXIT #8#)))) 

(SDEFUN |MULTSQFR;nsqfree;SupLLR;1!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (QCDR |z1|) (QCDR |z2|) (QREFELT $ 43))) 

(SDEFUN |MULTSQFR;squareFree;SupF;2|
        ((|f| |SparseUnivariatePolynomial| P)
         ($ |Factored| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|lfs|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| P))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G489 NIL) (|fu| #2=(|Factored| P)) (#3=#:G488 NIL)
          (|partSq|
           (|Record| (|:| |unitPart| P)
                     (|:| |suPart|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| P))
                            (|:| |exponent| (|NonNegativeInteger|)))))))
          (#4=#:G487 NIL) (|ff| NIL) (#5=#:G486 NIL) (|lcSq| #2#)
          (#6=#:G471 NIL) (|lcf| (P)) (#7=#:G485 NIL) (#8=#:G484 NIL)
          (|usqfr| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|upol| (|SparseUnivariatePolynomial| R)) (|lvar| #9=(|List| OV))
          (#10=#:G462 NIL) (#11=#:G461 #9#) (#12=#:G463 #9#) (#13=#:G483 NIL)
          (|cf| NIL) (#14=#:G482 NIL) (#15=#:G481 NIL))
         (SEQ
          (COND
           ((EQL (SPADCALL |f| (QREFELT $ 79)) 0)
            (SEQ
             (LETT |fu|
                   (SPADCALL (SPADCALL |f| (QREFELT $ 77)) (QREFELT $ 36)))
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |fu| (QREFELT $ 37)) (QREFELT $ 80))
               (PROGN
                (LETT #15# NIL)
                (SEQ (LETT |ff| NIL) (LETT #14# (SPADCALL |fu| (QREFELT $ 84)))
                     G190
                     (COND
                      ((OR (ATOM #14#) (PROGN (LETT |ff| (CAR #14#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #15#
                             (CONS
                              (VECTOR (CONS 1 "sqfr")
                                      (SPADCALL (QVELT |ff| 1) (QREFELT $ 80))
                                      (QVELT |ff| 2))
                              #15#))))
                     (LETT #14# (CDR #14#)) (GO G190) G191
                     (EXIT (NREVERSE #15#))))
               (QREFELT $ 88)))))
           (#16='T
            (SEQ
             (LETT |lvar|
                   (PROGN
                    (LETT #10# NIL)
                    (SEQ (LETT |cf| NIL)
                         (LETT #13# (SPADCALL |f| (QREFELT $ 90))) G190
                         (COND
                          ((OR (ATOM #13#) (PROGN (LETT |cf| (CAR #13#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #12# (SPADCALL |cf| (QREFELT $ 91)))
                            (COND
                             (#10#
                              (LETT #11# (SPADCALL #11# #12# (QREFELT $ 92))))
                             ('T (PROGN (LETT #11# #12#) (LETT #10# 'T)))))))
                         (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
                    (COND (#10# #11#) (#16# (|IdentityError| '|setUnion|)))))
             (EXIT
              (COND
               ((NULL |lvar|)
                (SEQ (LETT |upol| (SPADCALL (ELT $ 93) |f| (QREFELT $ 96)))
                     (LETT |usqfr| (SPADCALL |upol| (QREFELT $ 98)))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (ELT $ 30) (SPADCALL |usqfr| (QREFELT $ 100))
                                 (QREFELT $ 103))
                       (PROGN
                        (LETT #8# NIL)
                        (SEQ (LETT |ff| NIL)
                             (LETT #7# (SPADCALL |usqfr| (QREFELT $ 106))) G190
                             (COND
                              ((OR (ATOM #7#)
                                   (PROGN (LETT |ff| (CAR #7#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #8#
                                     (CONS
                                      (VECTOR (CONS 1 "sqfr")
                                              (SPADCALL (ELT $ 30)
                                                        (QVELT |ff| 1)
                                                        (QREFELT $ 103))
                                              (QVELT |ff| 2))
                                      #8#))))
                             (LETT #7# (CDR #7#)) (GO G190) G191
                             (EXIT (NREVERSE #8#))))
                       (QREFELT $ 88)))))
               (#16#
                (SEQ (LETT |lcf| (SPADCALL |f| (QREFELT $ 107)))
                     (LETT |f|
                           (PROG2
                               (LETT #6# (SPADCALL |f| |lcf| (QREFELT $ 50)))
                               (QCDR #6#)
                             (|check_union2| (QEQCAR #6# 0)
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 9))
                                             (|Union|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 9))
                                              "failed")
                                             #6#)))
                     (LETT |lcSq| (SPADCALL |lcf| (QREFELT $ 36)))
                     (LETT |lfs|
                           (PROGN
                            (LETT #5# NIL)
                            (SEQ (LETT |ff| NIL)
                                 (LETT #4# (SPADCALL |lcSq| (QREFELT $ 84)))
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |ff| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #5#
                                         (CONS
                                          (VECTOR (CONS 1 "sqfr")
                                                  (SPADCALL (QVELT |ff| 1)
                                                            (QREFELT $ 80))
                                                  (QVELT |ff| 2))
                                          #5#))))
                                 (LETT #4# (CDR #4#)) (GO G190) G191
                                 (EXIT (NREVERSE #5#)))))
                     (LETT |partSq| (SPADCALL |f| |lvar| NIL (QREFELT $ 64)))
                     (LETT |lfs|
                           (SPADCALL
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |fu| NIL) (LETT #1# (QCDR |partSq|))
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |fu| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (VECTOR (CONS 1 "sqfr") (QCAR |fu|)
                                                   (QCDR |fu|))
                                           #3#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            |lfs| (QREFELT $ 108)))
                     (EXIT
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |lcSq| (QREFELT $ 37))
                                  (QCAR |partSq|) (QREFELT $ 38))
                        (QREFELT $ 80))
                       |lfs| (QREFELT $ 88))))))))))))) 

(SDEFUN |MULTSQFR;squareFree;PF;3| ((|f| P) ($ |Factored| P))
        (SPROG
         ((|sqlead| (|Factored| P))
          (|result1|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|nsqff|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G526 NIL) (|fu| NIL) (#2=#:G525 NIL)
          (|nsqfftot|
           (|Record| (|:| |unitPart| P)
                     (|:| |suPart|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| P))
                            (|:| |exponent| (|NonNegativeInteger|)))))))
          (#3=#:G511 NIL) (|lcont| (P)) (|f0| (|SparseUnivariatePolynomial| P))
          (|lvar| (|List| OV)) (|x| (OV)) (|i| (|Integer|)) (#4=#:G524 NIL)
          (|j| NIL) (|m| #5=(|NonNegativeInteger|)) (#6=#:G507 NIL)
          (#7=#:G506 #5#) (#8=#:G508 #5#) (#9=#:G523 NIL) (|ldeg| (|List| #5#))
          (|result| (|Factored| P)) (#10=#:G521 NIL) (#11=#:G500 NIL) (|p| (P))
          (|y| (OV)) (|n| (|NonNegativeInteger|)) (#12=#:G522 NIL) (|im| NIL)
          (|lmdeg| (|List| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |f| (QREFELT $ 71)) (SPADCALL |f| NIL (QREFELT $ 110)))
            (#13='T
             (SEQ (LETT |lvar| (SPADCALL |f| (QREFELT $ 91)))
                  (LETT |result1| NIL)
                  (LETT |lmdeg| (SPADCALL |f| |lvar| (QREFELT $ 111)))
                  (LETT |p| (|spadConstant| $ 25))
                  (SEQ (LETT |im| 1) (LETT #12# (LENGTH |lvar|)) G190
                       (COND ((|greater_SI| |im| #12#) (GO G191)))
                       (SEQ (LETT |n| (SPADCALL |lmdeg| |im| (QREFELT $ 112)))
                            (EXIT
                             (COND ((EQL |n| 0) "next im")
                                   ('T
                                    (SEQ
                                     (LETT |y|
                                           (SPADCALL |lvar| |im|
                                                     (QREFELT $ 115)))
                                     (LETT |p|
                                           (SPADCALL |p|
                                                     (SPADCALL
                                                      (|spadConstant| $ 25) |y|
                                                      |n| (QREFELT $ 116))
                                                     (QREFELT $ 38)))
                                     (EXIT
                                      (LETT |result1|
                                            (CONS
                                             (VECTOR (CONS 1 "sqfr")
                                                     (SPADCALL |y|
                                                               (QREFELT $ 117))
                                                     |n|)
                                             |result1|))))))))
                       (LETT |im| (|inc_SI| |im|)) (GO G190) G191 (EXIT NIL))
                  (COND
                   ((SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 35))
                    (SEQ
                     (LETT |f|
                           (PROG2 (LETT #11# (SPADCALL |f| |p| (QREFELT $ 72)))
                               (QCDR #11#)
                             (|check_union2| (QEQCAR #11# 0) (QREFELT $ 9)
                                             (|Union| (QREFELT $ 9) "failed")
                                             #11#)))
                     (COND
                      ((SPADCALL |f| (QREFELT $ 71))
                       (PROGN
                        (LETT #10# (SPADCALL |f| |result1| (QREFELT $ 110)))
                        (GO #14=#:G520))))
                     (EXIT (LETT |lvar| (SPADCALL |f| (QREFELT $ 91)))))))
                  (EXIT
                   (COND
                    ((EQL (LENGTH |lvar|) 1)
                     (SEQ
                      (LETT |result|
                            (SPADCALL |f| (|SPADfirst| |lvar|)
                                      (QREFELT $ 118)))
                      (EXIT
                       (SPADCALL (SPADCALL |result| (QREFELT $ 37))
                                 (SPADCALL |result1|
                                           (SPADCALL |result| (QREFELT $ 84))
                                           (QREFELT $ 119))
                                 (QREFELT $ 110)))))
                    (#13#
                     (SEQ (LETT |ldeg| (SPADCALL |f| |lvar| (QREFELT $ 120)))
                          (LETT |m|
                                (PROGN
                                 (LETT #6# NIL)
                                 (SEQ (LETT |j| NIL) (LETT #9# |ldeg|) G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN (LETT |j| (CAR #9#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL |j| 0 (QREFELT $ 121))
                                          (PROGN
                                           (LETT #8# |j|)
                                           (COND (#6# (LETT #7# (MIN #7# #8#)))
                                                 ('T
                                                  (PROGN
                                                   (LETT #7# #8#)
                                                   (LETT #6# 'T)))))))))
                                      (LETT #9# (CDR #9#)) (GO G190) G191
                                      (EXIT NIL))
                                 (COND (#6# #7#)
                                       (#13# (|IdentityError| '|min|)))))
                          (LETT |i| 1)
                          (SEQ (LETT |j| NIL) (LETT #4# |ldeg|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |j| (CAR #4#)) NIL)
                                     (NULL (> |j| |m|)))
                                 (GO G191)))
                               (SEQ (EXIT (LETT |i| (+ |i| 1))))
                               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                          (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 115)))
                          (LETT |lvar| (SPADCALL |lvar| |i| (QREFELT $ 122)))
                          (LETT |f0| (SPADCALL |f| |x| (QREFELT $ 124)))
                          (LETT |lcont| (SPADCALL |f0| (QREFELT $ 107)))
                          (LETT |nsqfftot|
                                (SPADCALL
                                 (PROG2
                                     (LETT #3#
                                           (SPADCALL |f0| |lcont|
                                                     (QREFELT $ 50)))
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 9))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 9))
                                                    "failed")
                                                   #3#))
                                 |lvar| NIL (QREFELT $ 64)))
                          (LETT |nsqff|
                                (PROGN
                                 (LETT #2# NIL)
                                 (SEQ (LETT |fu| NIL)
                                      (LETT #1# (QCDR |nsqfftot|)) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN (LETT |fu| (CAR #1#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (VECTOR (CONS 1 "sqfr")
                                                       (SPADCALL (QCAR |fu|)
                                                                 |x|
                                                                 (QREFELT $
                                                                          125))
                                                       (QCDR |fu|))
                                               #2#))))
                                      (LETT #1# (CDR #1#)) (GO G190) G191
                                      (EXIT (NREVERSE #2#)))))
                          (LETT |result1|
                                (SPADCALL |result1| |nsqff| (QREFELT $ 119)))
                          (EXIT
                           (COND
                            ((SPADCALL |lcont| (QREFELT $ 71))
                             (SPADCALL
                              (SPADCALL |lcont| (QCAR |nsqfftot|)
                                        (QREFELT $ 38))
                              |result1| (QREFELT $ 110)))
                            (#13#
                             (SEQ
                              (LETT |sqlead| (SPADCALL |lcont| (QREFELT $ 36)))
                              (EXIT
                               (SPADCALL
                                (SPADCALL (SPADCALL |sqlead| (QREFELT $ 37))
                                          (QCAR |nsqfftot|) (QREFELT $ 38))
                                (SPADCALL |result1|
                                          (SPADCALL |sqlead| (QREFELT $ 84))
                                          (QREFELT $ 119))
                                (QREFELT $ 110)))))))))))))))
          #14# (EXIT #10#)))) 

(SDEFUN |MULTSQFR;intChoose;SupLLR;4|
        ((|f| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |upol| (|SparseUnivariatePolynomial| R))
          (|:| |Lval| (|List| R))
          (|:| |Lfact|
               (|List|
                (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                          (|:| |exponent| (|NonNegativeInteger|)))))
          (|:| |ctpol| R)))
        (SPROG
         ((|d1| #1=(|Integer|)) (|lval1| (|List| R)) (|ctf1| (R))
          (|lfact1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|f1| (|SparseUnivariatePolynomial| R))
          (|try_n| (|NonNegativeInteger|)) (#2=#:G544 NIL) (|d0| #1#)
          (|lfact|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#3=#:G531 NIL) (|ctf| (R)) (|f0| (|SparseUnivariatePolynomial| R))
          (|lval| (|List| R)) (#4=#:G546 NIL) (|i| NIL) (#5=#:G545 NIL)
          (|range| (|Integer|)) (|nvr| (|NonNegativeInteger|))
          (|degf| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |degf| (SPADCALL |f| (QREFELT $ 79))) (LETT |try_n| 0)
                (LETT |nvr| (LENGTH |lvar|)) (LETT |range| 10)
                (LETT |lfact1| NIL) (LETT |lval1| NIL)
                (LETT |ctf1| (|spadConstant| $ 26))
                (LETT |f1| (|spadConstant| $ 22))
                (EXIT
                 (SEQ G190 (COND ((NULL (< |range| 10000000000)) (GO G191)))
                      (SEQ (LETT |range| (* 2 |range|))
                           (LETT |lval|
                                 (PROGN
                                  (LETT #5# NIL)
                                  (SEQ (LETT |i| 1) (LETT #4# |nvr|) G190
                                       (COND
                                        ((|greater_SI| |i| #4#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #5#
                                               (CONS
                                                (SPADCALL |range|
                                                          (QREFELT $ 126))
                                                #5#))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT (NREVERSE #5#)))))
                           (EXIT
                            (COND
                             ((SPADCALL |lval| |ltry| (QREFELT $ 127))
                              "new integer")
                             ('T
                              (SEQ (LETT |ltry| (CONS |lval| |ltry|))
                                   (LETT |f0|
                                         (SPADCALL |f| |lvar| |lval|
                                                   (QREFELT $ 70)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL (SPADCALL |f0| (QREFELT $ 128))
                                                |degf| (QREFELT $ 121))
                                      "new integer")
                                     ('T
                                      (SEQ
                                       (LETT |ctf|
                                             (SPADCALL |f0| (QREFELT $ 129)))
                                       (LETT |lfact|
                                             (SPADCALL
                                              (SPADCALL
                                               (PROG2
                                                   (LETT #3#
                                                         (SPADCALL |f0|
                                                                   (SPADCALL
                                                                    |ctf|
                                                                    (QREFELT $
                                                                             130))
                                                                   (QREFELT $
                                                                            58)))
                                                   (QCDR #3#)
                                                 (|check_union2| (QEQCAR #3# 0)
                                                                 (|SparseUnivariatePolynomial|
                                                                  (QREFELT $
                                                                           8))
                                                                 (|Union|
                                                                  (|SparseUnivariatePolynomial|
                                                                   (QREFELT $
                                                                            8))
                                                                  "failed")
                                                                 #3#))
                                               (QREFELT $ 98))
                                              (QREFELT $ 131)))
                                       (COND
                                        ((EQL (LENGTH |lfact|) 1)
                                         (COND
                                          ((EQL
                                            (QCDR
                                             (SPADCALL |lfact| 1
                                                       (QREFELT $ 132)))
                                            1)
                                           (PROGN
                                            (LETT #2#
                                                  (VECTOR (|spadConstant| $ 22)
                                                          |lval| |lfact|
                                                          (|spadConstant| $
                                                                          26)))
                                            (GO #6=#:G543))))))
                                       (LETT |d0|
                                             (SPADCALL |lfact|
                                                       (QREFELT $ 133)))
                                       (EXIT
                                        (COND
                                         ((EQL |try_n| 0)
                                          (SEQ (LETT |f1| |f0|)
                                               (LETT |lfact1| |lfact|)
                                               (LETT |ctf1| |ctf|)
                                               (LETT |lval1| |lval|)
                                               (LETT |d1| |d0|)
                                               (EXIT (LETT |try_n| 1))))
                                         ((EQL |d0| |d1|)
                                          (PROGN
                                           (LETT #2#
                                                 (VECTOR |f1| |lval1| |lfact1|
                                                         |ctf1|))
                                           (GO #6#)))
                                         ((< |d0| |d1|)
                                          (SEQ (LETT |try_n| 1)
                                               (LETT |f1| |f0|)
                                               (LETT |lfact1| |lfact|)
                                               (LETT |ctf1| |ctf|)
                                               (LETT |lval1| |lval|)
                                               (EXIT
                                                (LETT |d1| |d0|)))))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |MULTSQFR;coefChoose;IPLP;5|
        ((|exp| |Integer|) (|unitsq| P)
         (|sqlead| |List|
          (|Record| (|:| |factor| P) (|:| |exponent| (|NonNegativeInteger|))))
         ($ P))
        (SPROG
         ((|lcoef| (P)) (#1=#:G549 NIL) (|texp| (|NonNegativeInteger|))
          (#2=#:G554 NIL) (|term| NIL))
         (SEQ (LETT |lcoef| |unitsq|)
              (SEQ (LETT |term| NIL) (LETT #2# |sqlead|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |term| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |texp| (QCDR |term|))
                        (EXIT
                         (COND ((< |texp| |exp|) "next term")
                               ((EQL |texp| |exp|)
                                (LETT |lcoef|
                                      (SPADCALL |lcoef| (QCAR |term|)
                                                (QREFELT $ 38))))
                               ('T
                                (LETT |lcoef|
                                      (SPADCALL |lcoef|
                                                (SPADCALL (QCAR |term|)
                                                          (PROG1
                                                              (LETT #1#
                                                                    (QUOTIENT2
                                                                     |texp|
                                                                     |exp|))
                                                            (|check_subtype2|
                                                             (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                                          (QREFELT $ 134))
                                                (QREFELT $ 38)))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |lcoef|)))) 

(SDEFUN |MULTSQFR;consnewpol;SupSupIR;6|
        ((|g| |SparseUnivariatePolynomial| P)
         (|g0| |SparseUnivariatePolynomial| R) (|deg| |Integer|)
         ($ |Record| (|:| |pol| (|SparseUnivariatePolynomial| P))
          (|:| |polval| (|SparseUnivariatePolynomial| R))))
        (SEQ
         (COND ((EQL |deg| 1) (CONS |g| |g0|))
               ('T
                (SEQ (LETT |deg| (- |deg| 1))
                     (EXIT
                      (CONS (SPADCALL |g| |deg| (QREFELT $ 135))
                            (SPADCALL |g0| |deg| (QREFELT $ 136))))))))) 

(SDEFUN |MULTSQFR;lift;Sup2SupPLLLU;7|
        ((|ud| |SparseUnivariatePolynomial| P)
         (|g0| |SparseUnivariatePolynomial| R)
         (|g1| |SparseUnivariatePolynomial| R) (|lcoef| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|)) (|lval| |List| R)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
        (SPROG
         ((|p1| #1=(|SparseUnivariatePolynomial| P)) (|p0| #1#) (|#G60| #1#)
          (|#G59| #1#) (|#G58| #1#) (|#G57| #1#)
          (|plist|
           (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|leadlist| (|List| P)) (#2=#:G562 NIL) (|lcg0| (R))
          (|leadpol| (|Boolean|)) (|lcd| (P)))
         (SEQ (LETT |leadpol| NIL) (LETT |lcd| (SPADCALL |ud| (QREFELT $ 27)))
              (LETT |leadlist| NIL)
              (COND
               ((NULL (SPADCALL (SPADCALL |ud| (QREFELT $ 27)) (QREFELT $ 71)))
                (SEQ (LETT |leadpol| 'T)
                     (LETT |ud| (SPADCALL |lcoef| |ud| (QREFELT $ 31)))
                     (LETT |lcg0| (SPADCALL |g0| (QREFELT $ 137)))
                     (COND
                      ((SPADCALL |lcoef| (QREFELT $ 71))
                       (LETT |g0|
                             (SPADCALL
                              (PROG2
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL |lcoef| (QREFELT $ 138))
                                         |lcg0| (QREFELT $ 139)))
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0) (QREFELT $ 8)
                                                (|Union| (QREFELT $ 8)
                                                         #3="failed")
                                                #2#))
                              |g0| (QREFELT $ 29))))
                      (#4='T
                       (LETT |g0|
                             (SPADCALL
                              (PROG2
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lcoef| |lvar| |lval|
                                                    (QREFELT $ 140))
                                          (QREFELT $ 138))
                                         |lcg0| (QREFELT $ 139)))
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0) (QREFELT $ 8)
                                                (|Union| (QREFELT $ 8) #3#)
                                                #2#))
                              |g0| (QREFELT $ 29)))))
                     (LETT |g1| (SPADCALL |lcg0| |g1| (QREFELT $ 29)))
                     (EXIT (LETT |leadlist| (LIST |lcoef| |lcd|))))))
              (LETT |plist|
                    (SPADCALL |ud| |lvar| (LIST |g0| |g1|) |lval| |leadlist|
                              |ldeg| (QREFELT $ 14) (QREFELT $ 143)))
              (EXIT
               (COND ((QEQCAR |plist| 1) (CONS 1 "failed"))
                     (#4#
                      (SEQ
                       (PROGN
                        (LETT |#G57|
                              (SPADCALL (QCDR |plist|) 1 (QREFELT $ 66)))
                        (LETT |#G58|
                              (SPADCALL (QCDR |plist|) 2 (QREFELT $ 66)))
                        (LETT |p0| |#G57|)
                        (LETT |p1| |#G58|))
                       (COND
                        ((SPADCALL (SPADCALL |p0| |lvar| |lval| (QREFELT $ 70))
                                   |g0| (QREFELT $ 144))
                         (PROGN
                          (LETT |#G59| |p1|)
                          (LETT |#G60| |p0|)
                          (LETT |p0| |#G59|)
                          (LETT |p1| |#G60|))))
                       (EXIT
                        (CONS 0
                              (LIST (SPADCALL |p0| (QREFELT $ 145))
                                    (SPADCALL |p1| (QREFELT $ 145)))))))))))) 

(SDEFUN |MULTSQFR;univcase;POVF;8| ((|f| P) (|x| OV) ($ |Factored| P))
        (SPROG
         ((#1=#:G590 NIL) (|term| NIL) (#2=#:G589 NIL)
          (|result| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|uf| (|SparseUnivariatePolynomial| R)) (#3=#:G577 NIL) (|cf| (R)))
         (SEQ (LETT |uf| (SPADCALL |f| (QREFELT $ 146)))
              (LETT |cf| (SPADCALL |uf| (QREFELT $ 129)))
              (LETT |uf|
                    (PROG2 (LETT #3# (SPADCALL |uf| |cf| (QREFELT $ 147)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 8))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT $ 8))
                                       "failed")
                                      #3#)))
              (LETT |result| (SPADCALL |uf| (QREFELT $ 98)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL |cf| (SPADCALL |result| (QREFELT $ 100))
                           (QREFELT $ 29))
                 |x| (QREFELT $ 148))
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |term| NIL)
                      (LETT #1# (SPADCALL |result| (QREFELT $ 106))) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (VECTOR (CONS 1 "sqfr")
                                       (SPADCALL (QVELT |term| 1) |x|
                                                 (QREFELT $ 148))
                                       (QVELT |term| 2))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 110)))))) 

(SDEFUN |MULTSQFR;compdegd;LI;9|
        ((|lfact| |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                    (|:| |exponent| (|NonNegativeInteger|))))
         ($ |Integer|))
        (SPROG ((|ris| (|Integer|)) (#1=#:G595 NIL) (|pfact| NIL))
               (SEQ (LETT |ris| 0)
                    (SEQ (LETT |pfact| NIL) (LETT #1# |lfact|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |pfact| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ris|
                                 (+ |ris|
                                    (* (- (QCDR |pfact|) 1)
                                       (SPADCALL (QCAR |pfact|)
                                                 (QREFELT $ 128)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ris|)))) 

(SDEFUN |MULTSQFR;normDeriv2;SupISup;10|
        ((|f| |SparseUnivariatePolynomial| R) (|m| |Integer|)
         ($ |SparseUnivariatePolynomial| R))
        (SPROG
         ((|n| #1=(|Integer|)) (|ris| (|SparseUnivariatePolynomial| R))
          (#2=#:G598 NIL) (|n1| #1#) (|k| (|Integer|))
          (|#G1| (|NonNegativeInteger|)))
         (SEQ (LETT |#G1| (SPADCALL |f| (QREFELT $ 128))) (LETT |n1| |#G1|)
              (EXIT
               (COND ((< |#G1| |m|) (|spadConstant| $ 149))
                     ((EQL |n1| |m|)
                      (SPADCALL (SPADCALL |f| (QREFELT $ 137))
                                (QREFELT $ 130)))
                     ('T
                      (SEQ (LETT |k| (SPADCALL |n1| |m| (QREFELT $ 150)))
                           (LETT |ris| (|spadConstant| $ 149)) (LETT |n| |n1|)
                           (SEQ G190 (COND ((NULL (>= |n| |m|)) (GO G191)))
                                (SEQ
                                 (SEQ G190
                                      (COND ((NULL (> |n1| |n|)) (GO G191)))
                                      (SEQ
                                       (LETT |k|
                                             (QUOTIENT2 (* |k| (- |n1| |m|))
                                                        |n1|))
                                       (EXIT (LETT |n1| (- |n1| 1))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |ris|
                                       (SPADCALL |ris|
                                                 (SPADCALL
                                                  (SPADCALL |k|
                                                            (SPADCALL |f|
                                                                      (QREFELT
                                                                       $ 137))
                                                            (QREFELT $ 151))
                                                  (PROG1 (LETT #2# (- |n| |m|))
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT $ 152))
                                                 (QREFELT $ 153)))
                                 (LETT |f| (SPADCALL |f| (QREFELT $ 154)))
                                 (EXIT
                                  (LETT |n| (SPADCALL |f| (QREFELT $ 128)))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT |ris|)))))))) 

(SDEFUN |MULTSQFR;myDegree;SupLNniL;11|
        ((|f| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|exp| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G607 NIL) (|n| NIL) (#2=#:G606 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |n| NIL)
                      (LETT #1# (SPADCALL |f| |lvar| (QREFELT $ 155))) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QUOTIENT2 |n| |exp|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(DECLAIM (NOTINLINE |MultivariateSquareFree;|)) 

(DEFUN |MultivariateSquareFree| (&REST #1=#:G608)
  (SPROG NIL
         (PROG (#2=#:G609)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultivariateSquareFree|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultivariateSquareFree;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultivariateSquareFree|)))))))))) 

(DEFUN |MultivariateSquareFree;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|MultivariateSquareFree| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 156))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|MultivariateSquareFree|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 14
              (SPADCALL (SPADCALL (EXPT 2 26) (QREFELT $ 12)) (QREFELT $ 13)))
    $))) 

(MAKEPROP '|MultivariateSquareFree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|)
              (|IntegerPrimesPackage| 10) (0 . |prevPrime|) (5 . |coerce|)
              '|pmod| (|Record| (|:| |factor| 21) (|:| |exponent| 42))
              (|Record| (|:| |upol| 21) (|:| |Lval| 60) (|:| |Lfact| 45)
                        (|:| |ctpol| 8))
              (|SparseUnivariatePolynomial| 9) (|List| 7) (|List| 60)
              |MULTSQFR;intChoose;SupLLR;4| (|SparseUnivariatePolynomial| 8)
              (10 . |One|) (|Boolean|) (14 . =) (20 . |One|) (24 . |One|)
              (28 . |leadingCoefficient|) (33 . ~=) (39 . *) (45 . |coerce|)
              (50 . *) (56 . *) (|Factored| 9) (62 . |One|) (66 . ~=)
              |MULTSQFR;squareFree;PF;3| (72 . |unit|) (77 . *)
              (|Record| (|:| |factor| 9) (|:| |exponent| 42)) (|List| 39)
              (83 . |factors|) (|NonNegativeInteger|) (88 . >)
              (|Mapping| 23 15 15) (|List| 15) (94 . |sort|) (100 . ~=)
              (106 . =) (|Union| $ '"failed") (112 . |exquo|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (118 . |unitNormal|) (|Record| (|:| |pol| 17) (|:| |polval| 21))
              |MULTSQFR;consnewpol;SupSupIR;6| |MULTSQFR;coefChoose;IPLP;5|
              (|List| 42) |MULTSQFR;myDegree;SupLNniL;11| (123 . |exquo|)
              (|Union| 65 '#1="failed") (|List| 8)
              |MULTSQFR;lift;Sup2SupPLLLU;7|
              (|Record| (|:| |factor| 17) (|:| |exponent| 42))
              (|Record| (|:| |unitPart| 9) (|:| |suPart| (|List| 62)))
              |MULTSQFR;nsqfree;SupLLR;1| (|List| 17) (129 . |elt|) (135 . ^)
              (141 . |exquo|) (|FactoringUtilities| 6 7 8 9)
              (147 . |completeEval|) (154 . |ground?|) (159 . |exquo|)
              (165 . |gcd|) (171 . =) (|SingletonAsOrderedSet|)
              (177 . |retract|) (182 . |retract|) (187 . |exquo|)
              (193 . |degree|) (198 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 81) (|:| |factor| 9) (|:| |exponent| 42))
              (|List| 82) (203 . |factorList|)
              (|Record| (|:| |flag| 81) (|:| |factor| 17) (|:| |exponent| 42))
              (|List| 85) (|Factored| 17) (208 . |makeFR|) (|List| 9)
              (214 . |coefficients|) (219 . |variables|) (224 . |setUnion|)
              (230 . |ground|) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 17 8 21)
              (235 . |map|) (|Factored| $) (241 . |squareFree|) (|Factored| 21)
              (246 . |unit|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 21 9 17)
              (251 . |map|)
              (|Record| (|:| |flag| 81) (|:| |factor| 21) (|:| |exponent| 42))
              (|List| 104) (257 . |factorList|) (262 . |content|)
              (267 . |append|) |MULTSQFR;squareFree;SupF;2| (273 . |makeFR|)
              (279 . |minimumDegree|) (285 . |elt|) (291 . |Zero|)
              (295 . |Zero|) (299 . |elt|) (305 . |monomial|) (312 . |coerce|)
              |MULTSQFR;univcase;POVF;8| (317 . |append|) (323 . |degree|)
              (329 . ~=) (335 . |delete|) (|SparseUnivariatePolynomial| $)
              (341 . |univariate|) (347 . |multivariate|) (353 . |ran|)
              (358 . |member?|) (364 . |degree|) (369 . |content|)
              (374 . |coerce|) (379 . |factors|) (384 . |elt|)
              |MULTSQFR;compdegd;LI;9| (390 . ^) (396 . |normalDeriv|)
              |MULTSQFR;normDeriv2;SupISup;10| (402 . |leadingCoefficient|)
              (407 . |retract|) (412 . |exquo|) (418 . |eval|) (|List| 21)
              (|MultivariateLifting| 6 7 8 9) (425 . |lifting|) (436 . ~=)
              (442 . |primitivePart|) (447 . |univariate|) (452 . |exquo|)
              (458 . |multivariate|) (464 . |Zero|) (468 . |binomial|)
              (474 . *) (480 . |monomial|) (486 . +) (492 . |reductum|)
              (497 . |degree|))
           '#(|univcase| 503 |squareFree| 509 |nsqfree| 519 |normDeriv2| 526
              |myDegree| 532 |lift| 539 |intChoose| 550 |consnewpol| 557
              |compdegd| 564 |coefChoose| 569 |check| 576)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|squareFree| ((|Factored| |#4|) |#4|)) T)
                                   '((|squareFree|
                                      ((|Factored|
                                        (|SparseUnivariatePolynomial| |#4|))
                                       (|SparseUnivariatePolynomial| |#4|)))
                                     T)
                                   '((|compdegd|
                                      ((|Integer|)
                                       (|List|
                                        (|Record|
                                         (|:| |factor|
                                              (|SparseUnivariatePolynomial|
                                               |#3|))
                                         (|:| |exponent|
                                              (|NonNegativeInteger|))))))
                                     T)
                                   '((|univcase| ((|Factored| |#4|) |#4| |#2|))
                                     T)
                                   '((|consnewpol|
                                      ((|Record|
                                        (|:| |pol|
                                             (|SparseUnivariatePolynomial|
                                              |#4|))
                                        (|:| |polval|
                                             (|SparseUnivariatePolynomial|
                                              |#3|)))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|SparseUnivariatePolynomial| |#3|)
                                       (|Integer|)))
                                     T)
                                   '((|nsqfree|
                                      ((|Record| (|:| |unitPart| |#4|)
                                                 (|:| |suPart|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |factor|
                                                             (|SparseUnivariatePolynomial|
                                                              |#4|))
                                                        (|:| |exponent|
                                                             (|NonNegativeInteger|))))))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|List| |#2|) (|List| (|List| |#3|))))
                                     T)
                                   '((|intChoose|
                                      ((|Record|
                                        (|:| |upol|
                                             (|SparseUnivariatePolynomial|
                                              |#3|))
                                        (|:| |Lval| (|List| |#3|))
                                        (|:| |Lfact|
                                             (|List|
                                              (|Record|
                                               (|:| |factor|
                                                    (|SparseUnivariatePolynomial|
                                                     |#3|))
                                               (|:| |exponent|
                                                    (|NonNegativeInteger|)))))
                                        (|:| |ctpol| |#3|))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|List| |#2|) (|List| (|List| |#3|))))
                                     T)
                                   '((|coefChoose|
                                      (|#4| (|Integer|) |#4|
                                       (|List|
                                        (|Record| (|:| |factor| |#4|)
                                                  (|:| |exponent|
                                                       (|NonNegativeInteger|))))))
                                     T)
                                   '((|check|
                                      ((|Boolean|)
                                       (|List|
                                        (|Record|
                                         (|:| |factor|
                                              (|SparseUnivariatePolynomial|
                                               |#3|))
                                         (|:| |exponent|
                                              (|NonNegativeInteger|))))
                                       (|List|
                                        (|Record|
                                         (|:| |factor|
                                              (|SparseUnivariatePolynomial|
                                               |#3|))
                                         (|:| |exponent|
                                              (|NonNegativeInteger|))))))
                                     T)
                                   '((|lift|
                                      ((|Union|
                                        (|List|
                                         (|SparseUnivariatePolynomial| |#4|))
                                        #1#)
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|SparseUnivariatePolynomial| |#3|)
                                       (|SparseUnivariatePolynomial| |#3|) |#4|
                                       (|List| |#2|)
                                       (|List| (|NonNegativeInteger|))
                                       (|List| |#3|)))
                                     T)
                                   '((|myDegree|
                                      ((|List| (|NonNegativeInteger|))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|List| |#2|) (|NonNegativeInteger|)))
                                     T)
                                   '((|normDeriv2|
                                      ((|SparseUnivariatePolynomial| |#3|)
                                       (|SparseUnivariatePolynomial| |#3|)
                                       (|Integer|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 155
                                            '(1 11 10 10 12 1 8 0 10 13 0 21 0
                                              22 2 21 23 0 0 24 0 9 0 25 0 8 0
                                              26 1 17 9 0 27 2 8 23 0 0 28 2 21
                                              0 8 0 29 1 9 0 8 30 2 17 0 9 0 31
                                              2 9 0 8 0 32 0 33 0 34 2 9 23 0 0
                                              35 1 33 9 0 37 2 9 0 0 0 38 1 33
                                              40 0 41 2 42 23 0 0 43 2 45 0 44
                                              0 46 2 45 23 0 0 47 2 45 23 0 0
                                              48 2 17 49 0 9 50 1 9 51 0 52 2
                                              21 49 0 0 58 2 65 17 0 10 66 2 17
                                              0 0 42 67 2 17 49 0 0 68 3 69 21
                                              17 18 60 70 1 9 23 0 71 2 9 49 0
                                              0 72 2 9 0 0 0 73 2 9 23 0 0 74 1
                                              17 75 0 76 1 17 9 0 77 2 9 49 0 8
                                              78 1 17 42 0 79 1 17 0 9 80 1 33
                                              83 0 84 2 87 0 17 86 88 1 17 89 0
                                              90 1 9 18 0 91 2 18 0 0 0 92 1 9
                                              8 0 93 2 95 21 94 17 96 1 21 97 0
                                              98 1 99 21 0 100 2 102 17 101 21
                                              103 1 99 105 0 106 1 17 9 0 107 2
                                              86 0 0 0 108 2 33 0 9 83 110 2 9
                                              56 0 18 111 2 56 42 0 10 112 0 6
                                              0 113 0 8 0 114 2 18 7 0 10 115 3
                                              9 0 0 7 42 116 1 9 0 7 117 2 83 0
                                              0 0 119 2 9 56 0 18 120 2 42 23 0
                                              0 121 2 18 0 0 10 122 2 9 123 0 7
                                              124 2 9 0 123 7 125 1 69 8 10 126
                                              2 19 23 60 0 127 1 21 42 0 128 1
                                              21 8 0 129 1 21 0 8 130 1 99 45 0
                                              131 2 45 15 0 10 132 2 9 0 0 42
                                              134 2 69 17 17 10 135 1 21 8 0
                                              137 1 9 8 0 138 2 8 49 0 0 139 3
                                              9 0 0 18 60 140 7 142 59 17 18
                                              141 60 89 56 8 143 2 21 23 0 0
                                              144 1 17 0 0 145 1 9 21 0 146 2
                                              21 49 0 8 147 2 9 0 21 7 148 0 21
                                              0 149 2 10 0 0 0 150 2 8 0 10 0
                                              151 2 21 0 8 42 152 2 21 0 0 0
                                              153 1 21 0 0 154 2 69 56 17 18
                                              155 2 0 33 9 7 118 1 0 33 9 36 1
                                              0 87 17 109 3 0 63 17 18 19 64 2
                                              0 21 21 10 136 3 0 56 17 18 42 57
                                              7 0 59 17 21 21 9 18 56 60 61 3 0
                                              16 17 18 19 20 3 0 53 17 21 10 54
                                              1 0 10 45 133 3 0 9 10 9 40 55 2
                                              0 23 45 45 1)))))
           '|lookupComplete|)) 
