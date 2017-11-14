
(SDEFUN |RDEAUX;multi_SPDE;2SupLIMU;1|
        ((|a| |SparseUnivariatePolynomial| F)
         (|b| |SparseUnivariatePolynomial| F)
         (|lc| |List| (|SparseUnivariatePolynomial| F)) (|d| |Integer|)
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Union|
          (|List|
           (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (|Record| (|:| |ans| (|List| (|SparseUnivariatePolynomial| F)))
                    (|:| |acoeff| (|SparseUnivariatePolynomial| F))
                    (|:| |eegen| (|SparseUnivariatePolynomial| F))
                    (|:| |bpar| (|SparseUnivariatePolynomial| F))
                    (|:| |lcpar| (|List| (|SparseUnivariatePolynomial| F)))
                    (|:| |dpar| (|Integer|)))))
        (SPROG
         ((#1=#:G743 NIL) (|s1| NIL) (#2=#:G744 NIL)
          (|r| #3=(|SparseUnivariatePolynomial| F)) (#4=#:G742 NIL)
          (#5=#:G740 NIL) (|s2| NIL) (#6=#:G741 NIL) (#7=#:G739 NIL)
          (|dres|
           (|Record| (|:| |ans| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |acoeff| (|SparseUnivariatePolynomial| F))
                     (|:| |eegen| (|SparseUnivariatePolynomial| F))
                     (|:| |bpar| (|SparseUnivariatePolynomial| F))
                     (|:| |lcpar| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |dpar| (|Integer|))))
          (|res1|
           (|Union|
            (|List|
             (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                       (|:| |remainder| (|SparseUnivariatePolynomial| F))))
            (|Record| (|:| |ans| (|List| (|SparseUnivariatePolynomial| F)))
                      (|:| |acoeff| (|SparseUnivariatePolynomial| F))
                      (|:| |eegen| (|SparseUnivariatePolynomial| F))
                      (|:| |bpar| (|SparseUnivariatePolynomial| F))
                      (|:| |lcpar| (|List| (|SparseUnivariatePolynomial| F)))
                      (|:| |dpar| (|Integer|)))))
          (|lr| (|List| (|SparseUnivariatePolynomial| F)))
          (|lnc| (|List| (|SparseUnivariatePolynomial| F)))
          (|nc| (|SparseUnivariatePolynomial| F))
          (|qr|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| #3#)))
          (|cc2| #8=(|SparseUnivariatePolynomial| F)) (|cc1| #8#)
          (#9=#:G738 NIL) (|c| NIL) (#10=#:G737 NIL) (#11=#:G736 NIL)
          (|ee|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))
                     (|:| |generator| (|SparseUnivariatePolynomial| F))))
          (#12=#:G735 NIL) (#13=#:G734 NIL) (#14=#:G733 NIL) (#15=#:G732 NIL))
         (SEQ
          (COND
           ((< |d| 0)
            (CONS 0
                  (PROGN
                   (LETT #15# NIL . #16=(|RDEAUX;multi_SPDE;2SupLIMU;1|))
                   (SEQ (LETT |c| NIL . #16#) (LETT #14# |lc| . #16#) G190
                        (COND
                         ((OR (ATOM #14#)
                              (PROGN (LETT |c| (CAR #14#) . #16#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #15#
                                (CONS (CONS (|spadConstant| $ 9) |c|) #15#)
                                . #16#)))
                        (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                        (EXIT (NREVERSE #15#))))))
           ((SPADCALL (ELT $ 11) |lc| (QREFELT $ 14))
            (CONS 0
                  (PROGN
                   (LETT #13# NIL . #16#)
                   (SEQ (LETT |c| NIL . #16#) (LETT #12# |lc| . #16#) G190
                        (COND
                         ((OR (ATOM #12#)
                              (PROGN (LETT |c| (CAR #12#) . #16#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #13#
                                (CONS
                                 (CONS (|spadConstant| $ 9)
                                       (|spadConstant| $ 9))
                                 #13#)
                                . #16#)))
                        (LETT #12# (CDR #12#) . #16#) (GO G190) G191
                        (EXIT (NREVERSE #13#))))))
           (#17='T
            (SEQ (LETT |ee| (SPADCALL |a| |b| (QREFELT $ 16)) . #16#)
                 (EXIT
                  (COND
                   ((SPADCALL (QVELT |ee| 2) (|spadConstant| $ 17)
                              (QREFELT $ 18))
                    (CONS 1
                          (VECTOR
                           (PROGN
                            (LETT #11# NIL . #16#)
                            (SEQ (LETT |c| NIL . #16#) (LETT #10# |lc| . #16#)
                                 G190
                                 (COND
                                  ((OR (ATOM #10#)
                                       (PROGN
                                        (LETT |c| (CAR #10#) . #16#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #11# (CONS (|spadConstant| $ 9) #11#)
                                         . #16#)))
                                 (LETT #10# (CDR #10#) . #16#) (GO G190) G191
                                 (EXIT (NREVERSE #11#))))
                           (|spadConstant| $ 17) (QVELT |ee| 2) |b| |lc| |d|)))
                   (#17#
                    (SEQ (LETT |lr| NIL . #16#) (LETT |lnc| NIL . #16#)
                         (SEQ (LETT |c| NIL . #16#) (LETT #9# |lc| . #16#) G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |c| (CAR #9#) . #16#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |cc1|
                                     (SPADCALL (QVELT |ee| 0) |c|
                                               (QREFELT $ 19))
                                     . #16#)
                               (LETT |cc2|
                                     (SPADCALL (QVELT |ee| 1) |c|
                                               (QREFELT $ 19))
                                     . #16#)
                               (LETT |qr| (SPADCALL |cc2| |a| (QREFELT $ 21))
                                     . #16#)
                               (LETT |r| (QCDR |qr|) . #16#)
                               (LETT |nc|
                                     (SPADCALL
                                      (SPADCALL |cc1|
                                                (SPADCALL |b| (QCAR |qr|)
                                                          (QREFELT $ 19))
                                                (QREFELT $ 22))
                                      (SPADCALL |r| |der|) (QREFELT $ 23))
                                     . #16#)
                               (LETT |lnc| (CONS |nc| |lnc|) . #16#)
                               (EXIT (LETT |lr| (CONS |r| |lr|) . #16#)))
                              (LETT #9# (CDR #9#) . #16#) (GO G190) G191
                              (EXIT NIL))
                         (LETT |lr| (NREVERSE |lr|) . #16#)
                         (LETT |res1|
                               (SPADCALL |a|
                                         (SPADCALL |b| (SPADCALL |a| |der|)
                                                   (QREFELT $ 22))
                                         (NREVERSE |lnc|)
                                         (- |d| (SPADCALL |a| (QREFELT $ 25)))
                                         |der| (QREFELT $ 31))
                               . #16#)
                         (EXIT
                          (COND
                           ((QEQCAR |res1| 1)
                            (SEQ (LETT |dres| (QCDR |res1|) . #16#)
                                 (EXIT
                                  (CONS 1
                                        (VECTOR
                                         (PROGN
                                          (LETT #7# NIL . #16#)
                                          (SEQ (LETT |r| NIL . #16#)
                                               (LETT #6# |lr| . #16#)
                                               (LETT |s2| NIL . #16#)
                                               (LETT #5# (QVELT |dres| 0)
                                                     . #16#)
                                               G190
                                               (COND
                                                ((OR (ATOM #5#)
                                                     (PROGN
                                                      (LETT |s2| (CAR #5#)
                                                            . #16#)
                                                      NIL)
                                                     (ATOM #6#)
                                                     (PROGN
                                                      (LETT |r| (CAR #6#)
                                                            . #16#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #7#
                                                       (CONS
                                                        (SPADCALL
                                                         (SPADCALL |a| |s2|
                                                                   (QREFELT $
                                                                            19))
                                                         |r| (QREFELT $ 22))
                                                        #7#)
                                                       . #16#)))
                                               (LETT #5#
                                                     (PROG1 (CDR #5#)
                                                       (LETT #6# (CDR #6#)
                                                             . #16#))
                                                     . #16#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #7#))))
                                         (SPADCALL |a| (QVELT |dres| 1)
                                                   (QREFELT $ 19))
                                         (QVELT |dres| 2) (QVELT |dres| 3)
                                         (QVELT |dres| 4) (QVELT |dres| 5))))))
                           (#17#
                            (CONS 0
                                  (PROGN
                                   (LETT #4# NIL . #16#)
                                   (SEQ (LETT |r| NIL . #16#)
                                        (LETT #2# |lr| . #16#)
                                        (LETT |s1| NIL . #16#)
                                        (LETT #1# (QCDR |res1|) . #16#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |s1| (CAR #1#) . #16#)
                                               NIL)
                                              (ATOM #2#)
                                              (PROGN
                                               (LETT |r| (CAR #2#) . #16#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #4#
                                                (CONS
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |a| (QCAR |s1|)
                                                             (QREFELT $ 19))
                                                   |r| (QREFELT $ 22))
                                                  (QCDR |s1|))
                                                 #4#)
                                                . #16#)))
                                        (LETT #1#
                                              (PROG1 (CDR #1#)
                                                (LETT #2# (CDR #2#) . #16#))
                                              . #16#)
                                        (GO G190) G191
                                        (EXIT (NREVERSE #4#)))))))))))))))))) 

(SDEFUN |RDEAUX;SPDE1;2SupMR;2|
        ((|b| |SparseUnivariatePolynomial| F)
         (|c| |SparseUnivariatePolynomial| F)
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
          (|:| |remainder| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| F))
          (|qq| (|SparseUnivariatePolynomial| F)) (#1=#:G746 NIL)
          (#2=#:G752 NIL) (|n| (|Integer|)) (|lb| (F)) (|db| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |q| (|spadConstant| $ 9) . #3=(|RDEAUX;SPDE1;2SupMR;2|))
                (LETT |db| (SPADCALL |b| (QREFELT $ 25)) . #3#)
                (LETT |lb| (SPADCALL |b| (QREFELT $ 32)) . #3#)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |c| (|spadConstant| $ 9) (QREFELT $ 18)))
                       (GO G191)))
                     (SEQ
                      (LETT |n| (- (SPADCALL |c| (QREFELT $ 25)) |db|) . #3#)
                      (EXIT
                       (COND
                        ((< |n| 0)
                         (PROGN
                          (LETT #2# (CONS |q| |c|) . #3#)
                          (GO #4=#:G751)))
                        ('T
                         (SEQ
                          (LETT |qq|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |c| (QREFELT $ 32)) |lb|
                                           (QREFELT $ 33))
                                 (PROG1 (LETT #1# |n| . #3#)
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 (QREFELT $ 34))
                                . #3#)
                          (LETT |c|
                                (SPADCALL
                                 (SPADCALL |c|
                                           (SPADCALL |b| |qq| (QREFELT $ 19))
                                           (QREFELT $ 23))
                                 (SPADCALL |qq| |der|) (QREFELT $ 23))
                                . #3#)
                          (EXIT
                           (LETT |q| (SPADCALL |q| |qq| (QREFELT $ 22))
                                 . #3#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS |q| (|spadConstant| $ 9)))))
          #4# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |RDEaux;|)) 

(DEFUN |RDEaux| (#1=#:G753)
  (SPROG NIL
         (PROG (#2=#:G754)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RDEaux|)
                                               '|domainEqualList|)
                    . #3=(|RDEaux|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|RDEaux;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|RDEaux|)))))))))) 

(DEFUN |RDEaux;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RDEaux|))
          (LETT |dv$| (LIST '|RDEaux| DV$1) . #1#)
          (LETT $ (GETREFV 36) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RDEaux| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RDEaux| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|)
              (|SparseUnivariatePolynomial| 6) (4 . |Zero|) (|Boolean|)
              (8 . |zero?|) (|Mapping| 10 8) (|List| 8) (13 . |every?|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (19 . |extendedEuclidean|) (25 . |One|) (29 . ~=) (35 . *)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (41 . |divide|)
              (47 . +) (53 . -) (|NonNegativeInteger|) (59 . |degree|)
              (|Record| (|:| |ans| 8) (|:| |remainder| 8))
              (|Record| (|:| |ans| 13) (|:| |acoeff| 8) (|:| |eegen| 8)
                        (|:| |bpar| 8) (|:| |lcpar| 13) (|:| |dpar| 29))
              (|Union| (|List| 26) 27) (|Integer|) (|Mapping| 8 8)
              |RDEAUX;multi_SPDE;2SupLIMU;1| (64 . |leadingCoefficient|)
              (69 . /) (75 . |monomial|) |RDEAUX;SPDE1;2SupMR;2|)
           '#(|multi_SPDE| 81 SPDE1 90) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 35
                                                 '(0 6 0 7 0 8 0 9 1 8 10 0 11
                                                   2 13 10 12 0 14 2 8 15 0 0
                                                   16 0 8 0 17 2 8 10 0 0 18 2
                                                   8 0 0 0 19 2 8 20 0 0 21 2 8
                                                   0 0 0 22 2 8 0 0 0 23 1 8 24
                                                   0 25 1 8 6 0 32 2 6 0 0 0 33
                                                   2 8 0 6 24 34 5 0 28 8 8 13
                                                   29 30 31 3 0 26 8 8 30
                                                   35)))))
           '|lookupComplete|)) 
