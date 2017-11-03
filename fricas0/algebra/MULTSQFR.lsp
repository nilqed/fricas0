
(SDEFUN |MULTSQFR;nsqfree;SupLLR;1|
        ((|oldf| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |unitPart| P)
          (|:| |suPart|
               (|List|
                (|Record| (|:| |factor| (|SparseUnivariatePolynomial| P))
                          (|:| |exponent| (|Integer|)))))))
        (SPROG
         ((#1=#:G782 NIL) (|lcr| (P)) (|h1| (|Union| P #2="failed"))
          (|unitsq| (P)) (#3=#:G797 NIL) (|lpfact| NIL)
          (|f0| #4=(|SparseUnivariatePolynomial| R))
          (|f| (|SparseUnivariatePolynomial| P))
          (|sqdec|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| P))
                      (|:| |exponent| (|Integer|)))))
          (#5=#:G796 NIL)
          (|h| (|Union| (|SparseUnivariatePolynomial| P) #6="failed"))
          (|r1| (|SparseUnivariatePolynomial| P)) (#7=#:G779 NIL)
          (|result0| (|SparseUnivariatePolynomial| P))
          (|result|
           (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (#8=#:G765 NIL) (|ldeg| (|List| (|NonNegativeInteger|)))
          (#9=#:G763 NIL) (|lcoef| (P))
          (|d0| #10=(|SparseUnivariatePolynomial| R))
          (|d| #11=(|SparseUnivariatePolynomial| P)) (|#G12| #10#)
          (|#G11| #11#)
          (|npol| (|Record| (|:| |pol| #11#) (|:| |polval| #10#)))
          (|g0| #12=(|SparseUnivariatePolynomial| R))
          (|gg|
           (|Record| (|:| |unit| P) (|:| |canonical| P) (|:| |associate| P)))
          (#13=#:G752 NIL)
          (|lfact|
           #14=(|List|
                (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                          (|:| |exponent| (|Integer|)))))
          (|exp0| (|Integer|)) (|#G10| (|Integer|)) (|#G9| #12#)
          (|pfact|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                     (|:| |exponent| (|Integer|))))
          (|sqlead|
           (|List| (|Record| (|:| |factor| P) (|:| |exponent| (|Integer|)))))
          (|sqlc| (|Factored| P)) (|leadpol| (|Boolean|)) (|lcf| (P))
          (|ctf| (R)) (|lval| #15=(|List| R))
          (|univPol|
           (|Record| (|:| |upol| #4#) (|:| |Lval| #15#) (|:| |Lfact| #14#)
                     (|:| |ctpol| R))))
         (SEQ
          (EXIT
           (SEQ (LETT |f| |oldf| . #16=(|MULTSQFR;nsqfree;SupLLR;1|))
                (LETT |univPol| (SPADCALL |f| |lvar| |ltry| (QREFELT $ 22))
                      . #16#)
                (LETT |f0| (QVELT |univPol| 0) . #16#)
                (EXIT
                 (COND
                  ((SPADCALL |f0| (|spadConstant| $ 24) (QREFELT $ 26))
                   (CONS (|spadConstant| $ 27) (LIST (CONS |f| 1))))
                  ('T
                   (SEQ (LETT |lfact| (QVELT |univPol| 2) . #16#)
                        (LETT |lval| (QVELT |univPol| 1) . #16#)
                        (LETT |ctf| (QVELT |univPol| 3) . #16#)
                        (LETT |leadpol| NIL . #16#) (LETT |sqdec| NIL . #16#)
                        (LETT |exp0| 0 . #16#)
                        (LETT |unitsq| (|spadConstant| $ 27) . #16#)
                        (LETT |lcf| (SPADCALL |f| (QREFELT $ 29)) . #16#)
                        (COND
                         ((SPADCALL |ctf| (|spadConstant| $ 28) (QREFELT $ 30))
                          (SEQ
                           (LETT |f0| (SPADCALL |ctf| |f0| (QREFELT $ 31))
                                 . #16#)
                           (LETT |f|
                                 (SPADCALL (SPADCALL |ctf| (QREFELT $ 32)) |f|
                                           (QREFELT $ 33))
                                 . #16#)
                           (EXIT
                            (LETT |lcf| (SPADCALL |ctf| |lcf| (QREFELT $ 34))
                                  . #16#)))))
                        (LETT |sqlead| NIL . #16#)
                        (LETT |sqlc| (|spadConstant| $ 36) . #16#)
                        (COND
                         ((SPADCALL |lcf| (|spadConstant| $ 27) (QREFELT $ 37))
                          (SEQ (LETT |leadpol| 'T . #16#)
                               (LETT |sqlc| (SPADCALL |lcf| (QREFELT $ 38))
                                     . #16#)
                               (LETT |unitsq|
                                     (SPADCALL |unitsq|
                                               (SPADCALL |sqlc| (QREFELT $ 39))
                                               (QREFELT $ 40))
                                     . #16#)
                               (EXIT
                                (LETT |sqlead| (SPADCALL |sqlc| (QREFELT $ 43))
                                      . #16#)))))
                        (LETT |lfact|
                              (SPADCALL
                               (CONS #'|MULTSQFR;nsqfree;SupLLR;1!0| $) |lfact|
                               (QREFELT $ 47))
                              . #16#)
                        (SEQ G190
                             (COND
                              ((NULL (SPADCALL |lfact| NIL (QREFELT $ 48)))
                               (GO G191)))
                             (SEQ (LETT |pfact| (|SPADfirst| |lfact|) . #16#)
                                  (PROGN
                                   (LETT |#G9| (QCAR |pfact|) . #16#)
                                   (LETT |#G10| (QCDR |pfact|) . #16#)
                                   (LETT |g0| |#G9| . #16#)
                                   (LETT |exp0| |#G10| . #16#))
                                  (LETT |lfact| (CDR |lfact|) . #16#)
                                  (COND
                                   ((SPADCALL |lfact| NIL (QREFELT $ 49))
                                    (COND
                                     ((EQL |exp0| 1)
                                      (EXIT
                                       (SEQ
                                        (LETT |f|
                                              (PROG2
                                                  (LETT #13#
                                                        (SPADCALL |f|
                                                                  (SPADCALL
                                                                   |ctf|
                                                                   (QREFELT $
                                                                            32))
                                                                  (QREFELT $
                                                                           51))
                                                        . #16#)
                                                  (QCDR #13#)
                                                (|check_union2| (QEQCAR #13# 0)
                                                                (|SparseUnivariatePolynomial|
                                                                 (QREFELT $ 9))
                                                                (|Union|
                                                                 (|SparseUnivariatePolynomial|
                                                                  (QREFELT $
                                                                           9))
                                                                 "failed")
                                                                #13#))
                                              . #16#)
                                        (LETT |gg|
                                              (SPADCALL
                                               (SPADCALL |f| (QREFELT $ 29))
                                               (QREFELT $ 53))
                                              . #16#)
                                        (LETT |sqdec|
                                              (CONS
                                               (CONS
                                                (SPADCALL (QVELT |gg| 2) |f|
                                                          (QREFELT $ 33))
                                                |exp0|)
                                               |sqdec|)
                                              . #16#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5#
                                                (CONS (QVELT |gg| 0) |sqdec|)
                                                . #16#)
                                          (GO #17=#:G795)))))))))
                                  (COND
                                   ((SPADCALL |ctf| (|spadConstant| $ 28)
                                              (QREFELT $ 30))
                                    (LETT |g0|
                                          (SPADCALL |ctf| |g0| (QREFELT $ 31))
                                          . #16#)))
                                  (LETT |npol|
                                        (SPADCALL |f| |f0| |exp0|
                                                  (QREFELT $ 55))
                                        . #16#)
                                  (PROGN
                                   (LETT |#G11| (QCAR |npol|) . #16#)
                                   (LETT |#G12| (QCDR |npol|) . #16#)
                                   (LETT |d| |#G11| . #16#)
                                   (LETT |d0| |#G12| . #16#))
                                  (COND
                                   (|leadpol|
                                    (LETT |lcoef|
                                          (SPADCALL |exp0| |sqlc|
                                                    (QREFELT $ 56))
                                          . #16#))
                                   ('T
                                    (LETT |lcoef| (|spadConstant| $ 27)
                                          . #16#)))
                                  (LETT |ldeg|
                                        (SPADCALL |f| |lvar|
                                                  (PROG1
                                                      (LETT #9# |exp0| . #16#)
                                                    (|check_subtype2|
                                                     (>= #9# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #9#))
                                                  (QREFELT $ 59))
                                        . #16#)
                                  (LETT |result|
                                        (SPADCALL |d| |g0|
                                                  (PROG2
                                                      (LETT #8#
                                                            (SPADCALL |d0| |g0|
                                                                      (QREFELT
                                                                       $ 60))
                                                            . #16#)
                                                      (QCDR #8#)
                                                    (|check_union2|
                                                     (QEQCAR #8# 0)
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 8))
                                                     (|Union|
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 8))
                                                      #6#)
                                                     #8#))
                                                  |lcoef| |lvar| |ldeg| |lval|
                                                  (QREFELT $ 63))
                                        . #16#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |result| 1)
                                     (PROGN
                                      (LETT #5#
                                            (SPADCALL |oldf| |lvar| |ltry|
                                                      (QREFELT $ 66))
                                            . #16#)
                                      (GO #17#)))
                                    ('T
                                     (SEQ
                                      (LETT |result0|
                                            (SPADCALL (QCDR |result|) 1
                                                      (QREFELT $ 68))
                                            . #16#)
                                      (LETT |r1|
                                            (SPADCALL |result0|
                                                      (PROG1
                                                          (LETT #7# |exp0|
                                                                . #16#)
                                                        (|check_subtype2|
                                                         (>= #7# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #7#))
                                                      (QREFELT $ 69))
                                            . #16#)
                                      (SEQ
                                       (LETT |h|
                                             (SPADCALL |f| |r1| (QREFELT $ 70))
                                             . #16#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |h| 1)
                                          (PROGN
                                           (LETT #5#
                                                 (SPADCALL |oldf| |lvar| NIL
                                                           (QREFELT $ 66))
                                                 . #16#)
                                           (GO #17#))))))
                                      (LETT |sqdec|
                                            (CONS (CONS |result0| |exp0|)
                                                  |sqdec|)
                                            . #16#)
                                      (LETT |f| (QCDR |h|) . #16#)
                                      (LETT |f0|
                                            (SPADCALL (QCDR |h|) |lvar| |lval|
                                                      (QREFELT $ 72))
                                            . #16#)
                                      (LETT |lcr|
                                            (SPADCALL |result0| (QREFELT $ 29))
                                            . #16#)
                                      (EXIT
                                       (COND
                                        (|leadpol|
                                         (COND
                                          ((SPADCALL |lcr|
                                                     (|spadConstant| $ 27)
                                                     (QREFELT $ 37))
                                           (SEQ (LETT |lpfact| NIL . #16#)
                                                (LETT #3# |sqlead| . #16#) G190
                                                (COND
                                                 ((OR (ATOM #3#)
                                                      (PROGN
                                                       (LETT |lpfact| (CAR #3#)
                                                             . #16#)
                                                       NIL)
                                                      (NULL
                                                       (SPADCALL |lcr|
                                                                 (|spadConstant|
                                                                  $ 27)
                                                                 (QREFELT $
                                                                          37))))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |lcr|
                                                              (QREFELT $ 73))
                                                    (SEQ
                                                     (LETT |unitsq|
                                                           (PROG2
                                                               (LETT #1#
                                                                     (SPADCALL
                                                                      |unitsq|
                                                                      |lcr|
                                                                      (QREFELT
                                                                       $ 74))
                                                                     . #16#)
                                                               (QCDR #1#)
                                                             (|check_union2|
                                                              (QEQCAR #1# 0)
                                                              (QREFELT $ 9)
                                                              (|Union|
                                                               (QREFELT $ 9)
                                                               #2#)
                                                              #1#))
                                                           . #16#)
                                                     (EXIT
                                                      (LETT |lcr|
                                                            (|spadConstant| $
                                                                            27)
                                                            . #16#))))
                                                   ('T
                                                    (SEQ
                                                     (LETT |h1|
                                                           (SPADCALL |lcr|
                                                                     (QCAR
                                                                      |lpfact|)
                                                                     (QREFELT $
                                                                              74))
                                                           . #16#)
                                                     (EXIT
                                                      (COND
                                                       ((QEQCAR |h1| 1) "next")
                                                       ('T
                                                        (SEQ
                                                         (LETT |lcr|
                                                               (QCDR |h1|)
                                                               . #16#)
                                                         (EXIT
                                                          (PROGN
                                                           (RPLACD |lpfact|
                                                                   (-
                                                                    (QCDR
                                                                     |lpfact|)
                                                                    |exp0|))
                                                           (QCDR
                                                            |lpfact|))))))))))))
                                                (LETT #3# (CDR #3#) . #16#)
                                                (GO G190) G191
                                                (EXIT NIL))))))))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (CONS
                          (PROG2
                              (LETT #1#
                                    (SPADCALL (SPADCALL |f| (QREFELT $ 77))
                                              |ctf| (QREFELT $ 78))
                                    . #16#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                            (|Union| (QREFELT $ 9) #2#) #1#))
                          |sqdec|))))))))
          #17# (EXIT #5#)))) 

(SDEFUN |MULTSQFR;nsqfree;SupLLR;1!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (QCDR |z1|) (QCDR |z2|) (QREFELT $ 44))) 

(SDEFUN |MULTSQFR;squareFree;SupF;2|
        ((|f| |SparseUnivariatePolynomial| P)
         ($ |Factored| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|lfs|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|SparseUnivariatePolynomial| P))
                      (|:| |xpnt| (|Integer|)))))
          (#1=#:G835 NIL) (|fu| #2=(|Factored| P)) (#3=#:G834 NIL)
          (|partSq|
           (|Record| (|:| |unitPart| P)
                     (|:| |suPart|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| P))
                            (|:| |exponent| (|Integer|)))))))
          (#4=#:G833 NIL) (|ff| NIL) (#5=#:G832 NIL) (|lcSq| #2#)
          (#6=#:G817 NIL) (|lcf| (P)) (#7=#:G831 NIL) (#8=#:G830 NIL)
          (|usqfr| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|upol| (|SparseUnivariatePolynomial| R)) (|lvar| #9=(|List| OV))
          (#10=#:G808 NIL) (#11=#:G807 #9#) (#12=#:G809 #9#) (#13=#:G829 NIL)
          (|cf| NIL) (#14=#:G828 NIL) (#15=#:G827 NIL))
         (SEQ
          (COND
           ((EQL (SPADCALL |f| (QREFELT $ 79)) 0)
            (SEQ
             (LETT |fu| (SPADCALL (SPADCALL |f| (QREFELT $ 77)) (QREFELT $ 38))
                   . #16=(|MULTSQFR;squareFree;SupF;2|))
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |fu| (QREFELT $ 39)) (QREFELT $ 80))
               (PROGN
                (LETT #15# NIL . #16#)
                (SEQ (LETT |ff| NIL . #16#)
                     (LETT #14# (SPADCALL |fu| (QREFELT $ 84)) . #16#) G190
                     (COND
                      ((OR (ATOM #14#)
                           (PROGN (LETT |ff| (CAR #14#) . #16#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #15#
                             (CONS
                              (VECTOR (CONS 1 "sqfr")
                                      (SPADCALL (QVELT |ff| 1) (QREFELT $ 80))
                                      (QVELT |ff| 2))
                              #15#)
                             . #16#)))
                     (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                     (EXIT (NREVERSE #15#))))
               (QREFELT $ 88)))))
           (#17='T
            (SEQ
             (LETT |lvar|
                   (PROGN
                    (LETT #10# NIL . #16#)
                    (SEQ (LETT |cf| NIL . #16#)
                         (LETT #13# (SPADCALL |f| (QREFELT $ 90)) . #16#) G190
                         (COND
                          ((OR (ATOM #13#)
                               (PROGN (LETT |cf| (CAR #13#) . #16#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #12# (SPADCALL |cf| (QREFELT $ 91)) . #16#)
                            (COND
                             (#10#
                              (LETT #11# (SPADCALL #11# #12# (QREFELT $ 92))
                                    . #16#))
                             ('T
                              (PROGN
                               (LETT #11# #12# . #16#)
                               (LETT #10# 'T . #16#)))))))
                         (LETT #13# (CDR #13#) . #16#) (GO G190) G191
                         (EXIT NIL))
                    (COND (#10# #11#) (#17# (|IdentityError| '|setUnion|))))
                   . #16#)
             (EXIT
              (COND
               ((NULL |lvar|)
                (SEQ
                 (LETT |upol| (SPADCALL (ELT $ 93) |f| (QREFELT $ 96)) . #16#)
                 (LETT |usqfr| (SPADCALL |upol| (QREFELT $ 98)) . #16#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (ELT $ 32) (SPADCALL |usqfr| (QREFELT $ 100))
                             (QREFELT $ 103))
                   (PROGN
                    (LETT #8# NIL . #16#)
                    (SEQ (LETT |ff| NIL . #16#)
                         (LETT #7# (SPADCALL |usqfr| (QREFELT $ 106)) . #16#)
                         G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |ff| (CAR #7#) . #16#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #8#
                                 (CONS
                                  (VECTOR (CONS 1 "sqfr")
                                          (SPADCALL (ELT $ 32) (QVELT |ff| 1)
                                                    (QREFELT $ 103))
                                          (QVELT |ff| 2))
                                  #8#)
                                 . #16#)))
                         (LETT #7# (CDR #7#) . #16#) (GO G190) G191
                         (EXIT (NREVERSE #8#))))
                   (QREFELT $ 88)))))
               (#17#
                (SEQ (LETT |lcf| (SPADCALL |f| (QREFELT $ 107)) . #16#)
                     (LETT |f|
                           (PROG2
                               (LETT #6# (SPADCALL |f| |lcf| (QREFELT $ 51))
                                     . #16#)
                               (QCDR #6#)
                             (|check_union2| (QEQCAR #6# 0)
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 9))
                                             (|Union|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 9))
                                              "failed")
                                             #6#))
                           . #16#)
                     (LETT |lcSq| (SPADCALL |lcf| (QREFELT $ 38)) . #16#)
                     (LETT |lfs|
                           (PROGN
                            (LETT #5# NIL . #16#)
                            (SEQ (LETT |ff| NIL . #16#)
                                 (LETT #4# (SPADCALL |lcSq| (QREFELT $ 84))
                                       . #16#)
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN
                                        (LETT |ff| (CAR #4#) . #16#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #5#
                                         (CONS
                                          (VECTOR (CONS 1 "sqfr")
                                                  (SPADCALL (QVELT |ff| 1)
                                                            (QREFELT $ 80))
                                                  (QVELT |ff| 2))
                                          #5#)
                                         . #16#)))
                                 (LETT #4# (CDR #4#) . #16#) (GO G190) G191
                                 (EXIT (NREVERSE #5#))))
                           . #16#)
                     (LETT |partSq| (SPADCALL |f| |lvar| NIL (QREFELT $ 66))
                           . #16#)
                     (LETT |lfs|
                           (SPADCALL
                            (PROGN
                             (LETT #3# NIL . #16#)
                             (SEQ (LETT |fu| NIL . #16#)
                                  (LETT #1# (QCDR |partSq|) . #16#) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN
                                         (LETT |fu| (CAR #1#) . #16#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (VECTOR (CONS 1 "sqfr") (QCAR |fu|)
                                                   (QCDR |fu|))
                                           #3#)
                                          . #16#)))
                                  (LETT #1# (CDR #1#) . #16#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            |lfs| (QREFELT $ 108))
                           . #16#)
                     (EXIT
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |lcSq| (QREFELT $ 39))
                                  (QCAR |partSq|) (QREFELT $ 40))
                        (QREFELT $ 80))
                       |lfs| (QREFELT $ 88))))))))))))) 

(SDEFUN |MULTSQFR;squareFree;PF;3| ((|f| P) ($ |Factored| P))
        (SPROG
         ((|sqlead| (|Factored| P))
          (|result1|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| P) (|:| |xpnt| (|Integer|)))))
          (|nsqff|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| P) (|:| |xpnt| (|Integer|)))))
          (#1=#:G874 NIL) (|fu| NIL) (#2=#:G873 NIL)
          (|nsqfftot|
           (|Record| (|:| |unitPart| P)
                     (|:| |suPart|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| P))
                            (|:| |exponent| (|Integer|)))))))
          (#3=#:G859 NIL) (|lcont| (P)) (|f0| (|SparseUnivariatePolynomial| P))
          (|lvar| (|List| OV)) (|x| (OV)) (|i| (|Integer|)) (#4=#:G872 NIL)
          (|j| NIL) (|m| #5=(|NonNegativeInteger|)) (#6=#:G855 NIL)
          (#7=#:G854 #5#) (#8=#:G856 #5#) (#9=#:G871 NIL) (|ldeg| (|List| #5#))
          (|result| (|Factored| P)) (#10=#:G869 NIL) (#11=#:G848 NIL) (|p| (P))
          (|y| (OV)) (|n| (|NonNegativeInteger|)) (#12=#:G870 NIL) (|im| NIL)
          (|lmdeg| (|List| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |f| (QREFELT $ 73)) (SPADCALL |f| NIL (QREFELT $ 110)))
            (#13='T
             (SEQ
              (LETT |lvar| (SPADCALL |f| (QREFELT $ 91))
                    . #14=(|MULTSQFR;squareFree;PF;3|))
              (LETT |result1| NIL . #14#)
              (LETT |lmdeg| (SPADCALL |f| |lvar| (QREFELT $ 111)) . #14#)
              (LETT |p| (|spadConstant| $ 27) . #14#)
              (SEQ (LETT |im| 1 . #14#) (LETT #12# (LENGTH |lvar|) . #14#) G190
                   (COND ((|greater_SI| |im| #12#) (GO G191)))
                   (SEQ
                    (LETT |n| (SPADCALL |lmdeg| |im| (QREFELT $ 112)) . #14#)
                    (EXIT
                     (COND ((EQL |n| 0) "next im")
                           ('T
                            (SEQ
                             (LETT |y| (SPADCALL |lvar| |im| (QREFELT $ 115))
                                   . #14#)
                             (LETT |p|
                                   (SPADCALL |p|
                                             (SPADCALL (|spadConstant| $ 27)
                                                       |y| |n| (QREFELT $ 116))
                                             (QREFELT $ 40))
                                   . #14#)
                             (EXIT
                              (LETT |result1|
                                    (CONS
                                     (VECTOR (CONS 1 "sqfr")
                                             (SPADCALL |y| (QREFELT $ 117))
                                             |n|)
                                     |result1|)
                                    . #14#)))))))
                   (LETT |im| (|inc_SI| |im|) . #14#) (GO G190) G191
                   (EXIT NIL))
              (COND
               ((SPADCALL |p| (|spadConstant| $ 27) (QREFELT $ 37))
                (SEQ
                 (LETT |f|
                       (PROG2
                           (LETT #11# (SPADCALL |f| |p| (QREFELT $ 74)) . #14#)
                           (QCDR #11#)
                         (|check_union2| (QEQCAR #11# 0) (QREFELT $ 9)
                                         (|Union| (QREFELT $ 9) "failed")
                                         #11#))
                       . #14#)
                 (COND
                  ((SPADCALL |f| (QREFELT $ 73))
                   (PROGN
                    (LETT #10# (SPADCALL |f| |result1| (QREFELT $ 110)) . #14#)
                    (GO #15=#:G868))))
                 (EXIT (LETT |lvar| (SPADCALL |f| (QREFELT $ 91)) . #14#)))))
              (EXIT
               (COND
                ((EQL (LENGTH |lvar|) 1)
                 (SEQ
                  (LETT |result|
                        (SPADCALL |f| (|SPADfirst| |lvar|) (QREFELT $ 118))
                        . #14#)
                  (EXIT
                   (SPADCALL (SPADCALL |result| (QREFELT $ 39))
                             (SPADCALL |result1|
                                       (SPADCALL |result| (QREFELT $ 84))
                                       (QREFELT $ 119))
                             (QREFELT $ 110)))))
                (#13#
                 (SEQ
                  (LETT |ldeg| (SPADCALL |f| |lvar| (QREFELT $ 120)) . #14#)
                  (LETT |m|
                        (PROGN
                         (LETT #6# NIL . #14#)
                         (SEQ (LETT |j| NIL . #14#) (LETT #9# |ldeg| . #14#)
                              G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |j| (CAR #9#) . #14#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |j| 0 (QREFELT $ 121))
                                  (PROGN
                                   (LETT #8# |j| . #14#)
                                   (COND (#6# (LETT #7# (MIN #7# #8#) . #14#))
                                         ('T
                                          (PROGN
                                           (LETT #7# #8# . #14#)
                                           (LETT #6# 'T . #14#)))))))))
                              (LETT #9# (CDR #9#) . #14#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#6# #7#) (#13# (|IdentityError| '|min|))))
                        . #14#)
                  (LETT |i| 1 . #14#)
                  (SEQ (LETT |j| NIL . #14#) (LETT #4# |ldeg| . #14#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #14#) NIL)
                             (NULL (SPADCALL |j| |m| (QREFELT $ 122))))
                         (GO G191)))
                       (SEQ (EXIT (LETT |i| (+ |i| 1) . #14#)))
                       (LETT #4# (CDR #4#) . #14#) (GO G190) G191 (EXIT NIL))
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 115)) . #14#)
                  (LETT |lvar| (SPADCALL |lvar| |i| (QREFELT $ 123)) . #14#)
                  (LETT |f0| (SPADCALL |f| |x| (QREFELT $ 125)) . #14#)
                  (LETT |lcont| (SPADCALL |f0| (QREFELT $ 107)) . #14#)
                  (LETT |nsqfftot|
                        (SPADCALL
                         (PROG2
                             (LETT #3# (SPADCALL |f0| |lcont| (QREFELT $ 51))
                                   . #14#)
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 0)
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 9))
                                           (|Union|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 9))
                                            "failed")
                                           #3#))
                         |lvar| NIL (QREFELT $ 66))
                        . #14#)
                  (LETT |nsqff|
                        (PROGN
                         (LETT #2# NIL . #14#)
                         (SEQ (LETT |fu| NIL . #14#)
                              (LETT #1# (QCDR |nsqfftot|) . #14#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |fu| (CAR #1#) . #14#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (VECTOR (CONS 1 "sqfr")
                                               (SPADCALL (QCAR |fu|) |x|
                                                         (QREFELT $ 126))
                                               (QCDR |fu|))
                                       #2#)
                                      . #14#)))
                              (LETT #1# (CDR #1#) . #14#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #14#)
                  (LETT |result1| (SPADCALL |result1| |nsqff| (QREFELT $ 119))
                        . #14#)
                  (EXIT
                   (COND
                    ((SPADCALL |lcont| (QREFELT $ 73))
                     (SPADCALL
                      (SPADCALL |lcont| (QCAR |nsqfftot|) (QREFELT $ 40))
                      |result1| (QREFELT $ 110)))
                    (#13#
                     (SEQ
                      (LETT |sqlead| (SPADCALL |lcont| (QREFELT $ 38)) . #14#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |sqlead| (QREFELT $ 39))
                                  (QCAR |nsqfftot|) (QREFELT $ 40))
                        (SPADCALL |result1| (SPADCALL |sqlead| (QREFELT $ 84))
                                  (QREFELT $ 119))
                        (QREFELT $ 110)))))))))))))))
          #15# (EXIT #10#)))) 

(SDEFUN |MULTSQFR;intChoose;SupLLR;4|
        ((|f| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |upol| (|SparseUnivariatePolynomial| R))
          (|:| |Lval| (|List| R))
          (|:| |Lfact|
               (|List|
                (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                          (|:| |exponent| (|Integer|)))))
          (|:| |ctpol| R)))
        (SPROG
         ((|d1| #1=(|Integer|)) (|lval1| (|List| R)) (|ctf1| (R))
          (|lfact1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|Integer|)))))
          (|f1| (|SparseUnivariatePolynomial| R))
          (|try_n| (|NonNegativeInteger|)) (#2=#:G892 NIL) (|d0| #1#)
          (|lfact|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|Integer|)))))
          (#3=#:G879 NIL) (|ctf| (R)) (|f0| (|SparseUnivariatePolynomial| R))
          (|lval| (|List| R)) (#4=#:G894 NIL) (|i| NIL) (#5=#:G893 NIL)
          (|range| (|Integer|)) (|nvr| (|NonNegativeInteger|))
          (|degf| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |degf| (SPADCALL |f| (QREFELT $ 79))
                  . #6=(|MULTSQFR;intChoose;SupLLR;4|))
            (LETT |try_n| 0 . #6#) (LETT |nvr| (LENGTH |lvar|) . #6#)
            (LETT |range| 10 . #6#) (LETT |lfact1| NIL . #6#)
            (LETT |lval1| NIL . #6#) (LETT |ctf1| (|spadConstant| $ 28) . #6#)
            (LETT |f1| (|spadConstant| $ 24) . #6#)
            (EXIT
             (SEQ G190 (COND ((NULL (< |range| 10000000000)) (GO G191)))
                  (SEQ
                   (LETT |range| (SPADCALL 2 |range| (QREFELT $ 127)) . #6#)
                   (LETT |lval|
                         (PROGN
                          (LETT #5# NIL . #6#)
                          (SEQ (LETT |i| 1 . #6#) (LETT #4# |nvr| . #6#) G190
                               (COND ((|greater_SI| |i| #4#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #5#
                                       (CONS (SPADCALL |range| (QREFELT $ 128))
                                             #5#)
                                       . #6#)))
                               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                               (EXIT (NREVERSE #5#))))
                         . #6#)
                   (EXIT
                    (COND
                     ((SPADCALL |lval| |ltry| (QREFELT $ 129)) "new integer")
                     ('T
                      (SEQ (LETT |ltry| (CONS |lval| |ltry|) . #6#)
                           (LETT |f0|
                                 (SPADCALL |f| |lvar| |lval| (QREFELT $ 72))
                                 . #6#)
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |f0| (QREFELT $ 130)) |degf|
                                        (QREFELT $ 121))
                              "new integer")
                             ('T
                              (SEQ
                               (LETT |ctf| (SPADCALL |f0| (QREFELT $ 131))
                                     . #6#)
                               (LETT |lfact|
                                     (SPADCALL
                                      (SPADCALL
                                       (PROG2
                                           (LETT #3#
                                                 (SPADCALL |f0|
                                                           (SPADCALL |ctf|
                                                                     (QREFELT $
                                                                              132))
                                                           (QREFELT $ 60))
                                                 . #6#)
                                           (QCDR #3#)
                                         (|check_union2| (QEQCAR #3# 0)
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 8))
                                                         (|Union|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 8))
                                                          "failed")
                                                         #3#))
                                       (QREFELT $ 98))
                                      (QREFELT $ 133))
                                     . #6#)
                               (COND
                                ((EQL (LENGTH |lfact|) 1)
                                 (COND
                                  ((EQL
                                    (QCDR (SPADCALL |lfact| 1 (QREFELT $ 134)))
                                    1)
                                   (PROGN
                                    (LETT #2#
                                          (VECTOR (|spadConstant| $ 24) |lval|
                                                  |lfact|
                                                  (|spadConstant| $ 28))
                                          . #6#)
                                    (GO #7=#:G891))))))
                               (LETT |d0| (SPADCALL |lfact| (QREFELT $ 135))
                                     . #6#)
                               (EXIT
                                (COND
                                 ((EQL |try_n| 0)
                                  (SEQ (LETT |f1| |f0| . #6#)
                                       (LETT |lfact1| |lfact| . #6#)
                                       (LETT |ctf1| |ctf| . #6#)
                                       (LETT |lval1| |lval| . #6#)
                                       (LETT |d1| |d0| . #6#)
                                       (EXIT (LETT |try_n| 1 . #6#))))
                                 ((EQL |d0| |d1|)
                                  (PROGN
                                   (LETT #2#
                                         (VECTOR |f1| |lval1| |lfact1| |ctf1|)
                                         . #6#)
                                   (GO #7#)))
                                 ((< |d0| |d1|)
                                  (SEQ (LETT |try_n| 1 . #6#)
                                       (LETT |f1| |f0| . #6#)
                                       (LETT |lfact1| |lfact| . #6#)
                                       (LETT |ctf1| |ctf| . #6#)
                                       (LETT |lval1| |lval| . #6#)
                                       (EXIT
                                        (LETT |d1| |d0| . #6#)))))))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #2#)))) 

(SDEFUN |MULTSQFR;coefChoose;IFP;5|
        ((|exp| |Integer|) (|sqlead| |Factored| P) ($ P))
        (SPROG
         ((|lcoef| (P)) (#1=#:G897 NIL) (|texp| (|Integer|)) (#2=#:G902 NIL)
          (|term| NIL))
         (SEQ
          (LETT |lcoef| (SPADCALL |sqlead| (QREFELT $ 39))
                . #3=(|MULTSQFR;coefChoose;IFP;5|))
          (SEQ (LETT |term| NIL . #3#)
               (LETT #2# (SPADCALL |sqlead| (QREFELT $ 43)) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |term| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |texp| (QCDR |term|) . #3#)
                    (EXIT
                     (COND ((< |texp| |exp|) "next term")
                           ((EQL |texp| |exp|)
                            (LETT |lcoef|
                                  (SPADCALL |lcoef| (QCAR |term|)
                                            (QREFELT $ 40))
                                  . #3#))
                           ('T
                            (LETT |lcoef|
                                  (SPADCALL |lcoef|
                                            (SPADCALL (QCAR |term|)
                                                      (PROG1
                                                          (LETT #1#
                                                                (QUOTIENT2
                                                                 |texp| |exp|)
                                                                . #3#)
                                                        (|check_subtype2|
                                                         (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                                      (QREFELT $ 136))
                                            (QREFELT $ 40))
                                  . #3#)))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |lcoef|)))) 

(SDEFUN |MULTSQFR;consnewpol;SupSupIR;6|
        ((|g| |SparseUnivariatePolynomial| P)
         (|g0| |SparseUnivariatePolynomial| R) (|deg| |Integer|)
         ($ |Record| (|:| |pol| (|SparseUnivariatePolynomial| P))
          (|:| |polval| (|SparseUnivariatePolynomial| R))))
        (SEQ
         (COND ((EQL |deg| 1) (CONS |g| |g0|))
               ('T
                (SEQ (LETT |deg| (- |deg| 1) |MULTSQFR;consnewpol;SupSupIR;6|)
                     (EXIT
                      (CONS (SPADCALL |g| |deg| (QREFELT $ 137))
                            (SPADCALL |g0| |deg| (QREFELT $ 138))))))))) 

(SDEFUN |MULTSQFR;lift;Sup2SupPLLLU;7|
        ((|ud| |SparseUnivariatePolynomial| P)
         (|g0| |SparseUnivariatePolynomial| R)
         (|g1| |SparseUnivariatePolynomial| R) (|lcoef| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|)) (|lval| |List| R)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
        (SPROG
         ((|p1| #1=(|SparseUnivariatePolynomial| P)) (|p0| #1#) (|#G54| #1#)
          (|#G53| #1#) (|#G52| #1#) (|#G51| #1#)
          (|plist|
           (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|leadlist| (|List| P)) (|lcg0| (R)) (|leadpol| (|Boolean|))
          (|lcd| (P)))
         (SEQ (LETT |leadpol| NIL . #2=(|MULTSQFR;lift;Sup2SupPLLLU;7|))
              (LETT |lcd| (SPADCALL |ud| (QREFELT $ 29)) . #2#)
              (LETT |leadlist| NIL . #2#)
              (COND
               ((NULL (SPADCALL (SPADCALL |ud| (QREFELT $ 29)) (QREFELT $ 73)))
                (SEQ (LETT |leadpol| 'T . #2#)
                     (LETT |ud| (SPADCALL |lcoef| |ud| (QREFELT $ 33)) . #2#)
                     (LETT |lcg0| (SPADCALL |g0| (QREFELT $ 139)) . #2#)
                     (COND
                      ((SPADCALL |lcoef| (QREFELT $ 73))
                       (LETT |g0|
                             (SPADCALL
                              (SPADCALL (SPADCALL |lcoef| (QREFELT $ 140))
                                        |lcg0| (QREFELT $ 141))
                              |g0| (QREFELT $ 31))
                             . #2#))
                      (#3='T
                       (LETT |g0|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |lcoef| |lvar| |lval|
                                          (QREFELT $ 142))
                                (QREFELT $ 140))
                               |lcg0| (QREFELT $ 141))
                              |g0| (QREFELT $ 31))
                             . #2#)))
                     (LETT |g1| (SPADCALL |lcg0| |g1| (QREFELT $ 31)) . #2#)
                     (EXIT (LETT |leadlist| (LIST |lcoef| |lcd|) . #2#)))))
              (LETT |plist|
                    (SPADCALL |ud| |lvar| (LIST |g0| |g1|) |lval| |leadlist|
                              |ldeg| (QREFELT $ 16) (QREFELT $ 145))
                    . #2#)
              (EXIT
               (COND ((QEQCAR |plist| 1) (CONS 1 "failed"))
                     (#3#
                      (SEQ
                       (PROGN
                        (LETT |#G51| (SPADCALL (QCDR |plist|) 1 (QREFELT $ 68))
                              . #2#)
                        (LETT |#G52| (SPADCALL (QCDR |plist|) 2 (QREFELT $ 68))
                              . #2#)
                        (LETT |p0| |#G51| . #2#)
                        (LETT |p1| |#G52| . #2#))
                       (COND
                        ((SPADCALL (SPADCALL |p0| |lvar| |lval| (QREFELT $ 72))
                                   |g0| (QREFELT $ 146))
                         (PROGN
                          (LETT |#G53| |p1| . #2#)
                          (LETT |#G54| |p0| . #2#)
                          (LETT |p0| |#G53| . #2#)
                          (LETT |p1| |#G54| . #2#))))
                       (EXIT
                        (CONS 0
                              (LIST (SPADCALL |p0| (QREFELT $ 147))
                                    (SPADCALL |p1| (QREFELT $ 147)))))))))))) 

(SDEFUN |MULTSQFR;univcase;POVF;8| ((|f| P) (|x| OV) ($ |Factored| P))
        (SPROG
         ((#1=#:G935 NIL) (|term| NIL) (#2=#:G934 NIL)
          (|result| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|uf| (|SparseUnivariatePolynomial| R)) (#3=#:G922 NIL) (|cf| (R)))
         (SEQ
          (LETT |uf| (SPADCALL |f| (QREFELT $ 148))
                . #4=(|MULTSQFR;univcase;POVF;8|))
          (LETT |cf| (SPADCALL |uf| (QREFELT $ 131)) . #4#)
          (LETT |uf|
                (PROG2 (LETT #3# (SPADCALL |uf| |cf| (QREFELT $ 149)) . #4#)
                    (QCDR #3#)
                  (|check_union2| (QEQCAR #3# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 8))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 8))
                                   "failed")
                                  #3#))
                . #4#)
          (LETT |result| (SPADCALL |uf| (QREFELT $ 98)) . #4#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL |cf| (SPADCALL |result| (QREFELT $ 100)) (QREFELT $ 31))
             |x| (QREFELT $ 150))
            (PROGN
             (LETT #2# NIL . #4#)
             (SEQ (LETT |term| NIL . #4#)
                  (LETT #1# (SPADCALL |result| (QREFELT $ 133)) . #4#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (VECTOR (CONS 1 "sqfr")
                                   (SPADCALL (QCAR |term|) |x| (QREFELT $ 150))
                                   (QCDR |term|))
                           #2#)
                          . #4#)))
                  (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            (QREFELT $ 110)))))) 

(SDEFUN |MULTSQFR;compdegd;LI;9|
        ((|lfact| |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                    (|:| |exponent| (|Integer|))))
         ($ |Integer|))
        (SPROG ((|ris| (|Integer|)) (#1=#:G940 NIL) (|pfact| NIL))
               (SEQ (LETT |ris| 0 . #2=(|MULTSQFR;compdegd;LI;9|))
                    (SEQ (LETT |pfact| NIL . #2#) (LETT #1# |lfact| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |pfact| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ris|
                                 (+ |ris|
                                    (* (- (QCDR |pfact|) 1)
                                       (SPADCALL (QCAR |pfact|)
                                                 (QREFELT $ 130))))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |ris|)))) 

(SDEFUN |MULTSQFR;normDeriv2;SupISup;10|
        ((|f| |SparseUnivariatePolynomial| R) (|m| |Integer|)
         ($ |SparseUnivariatePolynomial| R))
        (SPROG
         ((|n| #1=(|Integer|)) (|ris| (|SparseUnivariatePolynomial| R))
          (#2=#:G943 NIL) (|n1| #1#) (|k| (|Integer|))
          (|#G1| (|NonNegativeInteger|)))
         (SEQ
          (LETT |#G1| (SPADCALL |f| (QREFELT $ 130))
                . #3=(|MULTSQFR;normDeriv2;SupISup;10|))
          (LETT |n1| |#G1| . #3#)
          (EXIT
           (COND ((< |#G1| |m|) (|spadConstant| $ 151))
                 ((EQL |n1| |m|)
                  (SPADCALL (SPADCALL |f| (QREFELT $ 139)) (QREFELT $ 132)))
                 ('T
                  (SEQ (LETT |k| (SPADCALL |n1| |m| (QREFELT $ 152)) . #3#)
                       (LETT |ris| (|spadConstant| $ 151) . #3#)
                       (LETT |n| |n1| . #3#)
                       (SEQ G190 (COND ((NULL (>= |n| |m|)) (GO G191)))
                            (SEQ
                             (SEQ G190
                                  (COND
                                   ((NULL (SPADCALL |n1| |n| (QREFELT $ 44)))
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
                                                                           139))
                                                        (QREFELT $ 153))
                                              (PROG1
                                                  (LETT #2# (- |n| |m|) . #3#)
                                                (|check_subtype2| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #2#))
                                              (QREFELT $ 154))
                                             (QREFELT $ 155))
                                   . #3#)
                             (LETT |f| (SPADCALL |f| (QREFELT $ 156)) . #3#)
                             (EXIT
                              (LETT |n| (SPADCALL |f| (QREFELT $ 130)) . #3#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |ris|)))))))) 

(SDEFUN |MULTSQFR;myDegree;SupLNniL;11|
        ((|f| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|exp| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G952 NIL) (|n| NIL) (#2=#:G951 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MULTSQFR;myDegree;SupLNniL;11|))
                 (SEQ (LETT |n| NIL . #3#)
                      (LETT #1# (SPADCALL |f| |lvar| (QREFELT $ 157)) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (QUOTIENT2 |n| |exp|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(DECLAIM (NOTINLINE |MultivariateSquareFree;|)) 

(DEFUN |MultivariateSquareFree| (&REST #1=#:G953)
  (SPROG NIL
         (PROG (#2=#:G954)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultivariateSquareFree|)
                                               '|domainEqualList|)
                    . #3=(|MultivariateSquareFree|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultivariateSquareFree;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultivariateSquareFree|)))))))))) 

(DEFUN |MultivariateSquareFree;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|MultivariateSquareFree|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|MultivariateSquareFree| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 158) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|MultivariateSquareFree|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 16
              (SPADCALL (SPADCALL (EXPT 2 26) (QREFELT $ 14)) (QREFELT $ 15)))
    $))) 

(MAKEPROP '|MultivariateSquareFree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|PositiveInteger|) (0 . ^)
              (|Integer|) (|IntegerPrimesPackage| 12) (6 . |prevPrime|)
              (11 . |coerce|) '|pmod|
              (|Record| (|:| |factor| 23) (|:| |exponent| 12))
              (|Record| (|:| |upol| 23) (|:| |Lval| 62) (|:| |Lfact| 46)
                        (|:| |ctpol| 8))
              (|SparseUnivariatePolynomial| 9) (|List| 7) (|List| 62)
              |MULTSQFR;intChoose;SupLLR;4| (|SparseUnivariatePolynomial| 8)
              (16 . |One|) (|Boolean|) (20 . =) (26 . |One|) (30 . |One|)
              (34 . |leadingCoefficient|) (39 . ~=) (45 . *) (51 . |coerce|)
              (56 . *) (62 . *) (|Factored| 9) (68 . |One|) (72 . ~=)
              |MULTSQFR;squareFree;PF;3| (78 . |unit|) (83 . *)
              (|Record| (|:| |factor| 9) (|:| |exponent| 12)) (|List| 41)
              (89 . |factors|) (94 . >) (|Mapping| 25 17 17) (|List| 17)
              (100 . |sort|) (106 . ~=) (112 . =) (|Union| $ '"failed")
              (118 . |exquo|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (124 . |unitNormal|) (|Record| (|:| |pol| 19) (|:| |polval| 23))
              |MULTSQFR;consnewpol;SupSupIR;6| |MULTSQFR;coefChoose;IFP;5|
              (|List| 58) (|NonNegativeInteger|)
              |MULTSQFR;myDegree;SupLNniL;11| (129 . |exquo|)
              (|Union| 67 '"failed") (|List| 8) |MULTSQFR;lift;Sup2SupPLLLU;7|
              (|Record| (|:| |factor| 19) (|:| |exponent| 12))
              (|Record| (|:| |unitPart| 9) (|:| |suPart| (|List| 64)))
              |MULTSQFR;nsqfree;SupLLR;1| (|List| 19) (135 . |elt|) (141 . ^)
              (147 . |exquo|) (|FactoringUtilities| 6 7 8 9)
              (153 . |completeEval|) (160 . |ground?|) (165 . |exquo|)
              (|SingletonAsOrderedSet|) (171 . |retract|) (176 . |retract|)
              (181 . |exquo|) (187 . |degree|) (192 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 81) (|:| |fctr| 9) (|:| |xpnt| 12))
              (|List| 82) (197 . |factorList|)
              (|Record| (|:| |flg| 81) (|:| |fctr| 19) (|:| |xpnt| 12))
              (|List| 85) (|Factored| 19) (202 . |makeFR|) (|List| 9)
              (208 . |coefficients|) (213 . |variables|) (218 . |setUnion|)
              (224 . |ground|) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 19 8 23)
              (229 . |map|) (|Factored| $) (235 . |squareFree|) (|Factored| 23)
              (240 . |unit|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 23 9 19)
              (245 . |map|)
              (|Record| (|:| |flg| 81) (|:| |fctr| 23) (|:| |xpnt| 12))
              (|List| 104) (251 . |factorList|) (256 . |content|)
              (261 . |append|) |MULTSQFR;squareFree;SupF;2| (267 . |makeFR|)
              (273 . |minimumDegree|) (279 . |elt|) (285 . |Zero|)
              (289 . |Zero|) (293 . |elt|) (299 . |monomial|) (306 . |coerce|)
              |MULTSQFR;univcase;POVF;8| (311 . |append|) (317 . |degree|)
              (323 . ~=) (329 . >) (335 . |delete|)
              (|SparseUnivariatePolynomial| $) (341 . |univariate|)
              (347 . |multivariate|) (353 . *) (359 . |ran|) (364 . |member?|)
              (370 . |degree|) (375 . |content|) (380 . |coerce|)
              (385 . |factors|) (390 . |elt|) |MULTSQFR;compdegd;LI;9|
              (396 . ^) (402 . |normalDeriv|) |MULTSQFR;normDeriv2;SupISup;10|
              (408 . |leadingCoefficient|) (413 . |retract|) (418 . |quo|)
              (424 . |eval|) (|List| 23) (|MultivariateLifting| 6 7 8 9)
              (431 . |lifting|) (442 . ~=) (448 . |primitivePart|)
              (453 . |univariate|) (458 . |exquo|) (464 . |multivariate|)
              (470 . |Zero|) (474 . |binomial|) (480 . *) (486 . |monomial|)
              (492 . +) (498 . |reductum|) (503 . |degree|))
           '#(|univcase| 509 |squareFreePrim| 515 |squareFree| 520 |nsqfree|
              530 |normDeriv2| 537 |myDegree| 543 |lift| 550 |intChoose| 561
              |consnewpol| 568 |compdegd| 575 |coefChoose| 580 |check| 586)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 157
                                                 '(2 10 0 0 10 11 1 13 12 12 14
                                                   1 8 0 12 15 0 23 0 24 2 23
                                                   25 0 0 26 0 9 0 27 0 8 0 28
                                                   1 19 9 0 29 2 8 25 0 0 30 2
                                                   23 0 8 0 31 1 9 0 8 32 2 19
                                                   0 9 0 33 2 9 0 8 0 34 0 35 0
                                                   36 2 9 25 0 0 37 1 35 9 0 39
                                                   2 9 0 0 0 40 1 35 42 0 43 2
                                                   12 25 0 0 44 2 46 0 45 0 47
                                                   2 46 25 0 0 48 2 46 25 0 0
                                                   49 2 19 50 0 9 51 1 9 52 0
                                                   53 2 23 50 0 0 60 2 67 19 0
                                                   12 68 2 19 0 0 58 69 2 19 50
                                                   0 0 70 3 71 23 19 20 62 72 1
                                                   9 25 0 73 2 9 50 0 0 74 1 19
                                                   75 0 76 1 19 9 0 77 2 9 50 0
                                                   8 78 1 19 58 0 79 1 19 0 9
                                                   80 1 35 83 0 84 2 87 0 19 86
                                                   88 1 19 89 0 90 1 9 20 0 91
                                                   2 20 0 0 0 92 1 9 8 0 93 2
                                                   95 23 94 19 96 1 23 97 0 98
                                                   1 99 23 0 100 2 102 19 101
                                                   23 103 1 99 105 0 106 1 19 9
                                                   0 107 2 86 0 0 0 108 2 35 0
                                                   9 83 110 2 9 57 0 20 111 2
                                                   57 58 0 12 112 0 6 0 113 0 8
                                                   0 114 2 20 7 0 12 115 3 9 0
                                                   0 7 58 116 1 9 0 7 117 2 83
                                                   0 0 0 119 2 9 57 0 20 120 2
                                                   58 25 0 0 121 2 58 25 0 0
                                                   122 2 20 0 0 12 123 2 9 124
                                                   0 7 125 2 9 0 124 7 126 2 12
                                                   0 10 0 127 1 71 8 12 128 2
                                                   21 25 62 0 129 1 23 58 0 130
                                                   1 23 8 0 131 1 23 0 8 132 1
                                                   99 46 0 133 2 46 17 0 12 134
                                                   2 9 0 0 58 136 2 71 19 19 12
                                                   137 1 23 8 0 139 1 9 8 0 140
                                                   2 8 0 0 0 141 3 9 0 0 20 62
                                                   142 7 144 61 19 20 143 62 89
                                                   57 8 145 2 23 25 0 0 146 1
                                                   19 0 0 147 1 9 23 0 148 2 23
                                                   50 0 8 149 2 9 0 23 7 150 0
                                                   23 0 151 2 12 0 0 0 152 2 8
                                                   0 12 0 153 2 23 0 8 58 154 2
                                                   23 0 0 0 155 1 23 0 0 156 2
                                                   71 57 19 20 157 2 0 35 9 7
                                                   118 1 0 35 9 1 1 0 35 9 38 1
                                                   0 87 19 109 3 0 65 19 20 21
                                                   66 2 0 23 23 12 138 3 0 57
                                                   19 20 58 59 7 0 61 19 23 23
                                                   9 20 57 62 63 3 0 18 19 20
                                                   21 22 3 0 54 19 23 12 55 1 0
                                                   12 46 135 2 0 9 12 35 56 2 0
                                                   25 46 46 1)))))
           '|lookupComplete|)) 
