
(SDEFUN |INMODGCD;reduction;BPRBP;1| ((|u| BP) (|p| R) ($ BP))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 13)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|INMODGCD;reduction;BPRBP;1!0| (VECTOR $ |p|))
                       |u| (QREFELT $ 16)))))) 

(SDEFUN |INMODGCD;reduction;BPRBP;1!0| ((|r1| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 14)))))) 

(SDEFUN |INMODGCD;reduction;BPRBP;2| ((|u| BP) (|p| R) ($ BP))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 13)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|INMODGCD;reduction;BPRBP;2!0| (VECTOR $ |p|))
                       |u| (QREFELT $ 16)))))) 

(SDEFUN |INMODGCD;reduction;BPRBP;2!0| ((|r1| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 18)))))) 

(SDEFUN |INMODGCD;modularGcdPrimitive;LBP;3| ((|listf| |List| BP) ($ BP))
        (SPROG ((|g| (BP)) (#1=#:G432 NIL) (|f| NIL))
               (SEQ
                (COND ((NULL |listf|) (|spadConstant| $ 11))
                      ('T
                       (SEQ (LETT |g| (|SPADfirst| |listf|))
                            (SEQ (LETT |f| NIL) (LETT #1# (CDR |listf|)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |f| (CAR #1#)) NIL)
                                       (NULL
                                        (> (SPADCALL |g| (QREFELT $ 23)) 0)))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL (SPADCALL |f| (QREFELT $ 21)))
                                     (LETT |g|
                                           (|INMODGCD;modGcdPrimitive| |g| |f|
                                            $))))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |g|))))))) 

(SDEFUN |INMODGCD;modularGcd;LBP;4| ((|listf| |List| BP) ($ BP))
        (SPROG
         ((|ans| (BP)) (|minpol| (BP)) (#1=#:G438 NIL) (#2=#:G459 NIL)
          (|f| NIL) (#3=#:G460 NIL) (|cf| NIL) (#4=#:G458 NIL) (|contgcd| (R))
          (|listCont| (|List| R)) (#5=#:G457 NIL) (#6=#:G456 NIL)
          (|listdeg| (|List| (|NonNegativeInteger|))) (#7=#:G455 NIL)
          (#8=#:G454 NIL) (#9=#:G453 NIL) (#10=#:G452 NIL) (|minpol1| (BP))
          (|mdeg| #11=(|NonNegativeInteger|)) (#12=#:G435 NIL)
          (#13=#:G434 #11#) (#14=#:G436 #11#) (#15=#:G451 NIL))
         (SEQ
          (LETT |listf|
                (SPADCALL (|spadConstant| $ 11) |listf| (QREFELT $ 26)))
          (EXIT
           (COND ((NULL |listf|) (|spadConstant| $ 11))
                 ((EQL (LENGTH |listf|) 1) (|SPADfirst| |listf|))
                 (#16='T
                  (SEQ (LETT |minpol| (|spadConstant| $ 28))
                       (LETT |mdeg|
                             (PROGN
                              (LETT #12# NIL)
                              (SEQ (LETT |f| NIL) (LETT #15# |listf|) G190
                                   (COND
                                    ((OR (ATOM #15#)
                                         (PROGN (LETT |f| (CAR #15#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #14# (SPADCALL |f| (QREFELT $ 29)))
                                      (COND (#12# (LETT #13# (MIN #13# #14#)))
                                            ('T
                                             (PROGN
                                              (LETT #13# #14#)
                                              (LETT #12# 'T)))))))
                                   (LETT #15# (CDR #15#)) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#12# #13#)
                                    (#16# (|IdentityError| '|min|)))))
                       (COND
                        ((> |mdeg| 0)
                         (SEQ
                          (LETT |minpol1|
                                (SPADCALL (|spadConstant| $ 27) |mdeg|
                                          (QREFELT $ 30)))
                          (LETT |listf|
                                (PROGN
                                 (LETT #10# NIL)
                                 (SEQ (LETT |f| NIL) (LETT #9# |listf|) G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN (LETT |f| (CAR #9#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #10#
                                              (CONS
                                               (PROG2
                                                   (LETT #1#
                                                         (SPADCALL |f|
                                                                   |minpol1|
                                                                   (QREFELT $
                                                                            32)))
                                                   (QCDR #1#)
                                                 (|check_union2| (QEQCAR #1# 0)
                                                                 (QREFELT $ 7)
                                                                 (|Union|
                                                                  (QREFELT $ 7)
                                                                  #17="failed")
                                                                 #1#))
                                               #10#))))
                                      (LETT #9# (CDR #9#)) (GO G190) G191
                                      (EXIT (NREVERSE #10#)))))
                          (EXIT
                           (LETT |minpol|
                                 (SPADCALL |minpol| |minpol1|
                                           (QREFELT $ 33)))))))
                       (LETT |listdeg|
                             (PROGN
                              (LETT #8# NIL)
                              (SEQ (LETT |f| NIL) (LETT #7# |listf|) G190
                                   (COND
                                    ((OR (ATOM #7#)
                                         (PROGN (LETT |f| (CAR #7#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #8#
                                           (CONS (SPADCALL |f| (QREFELT $ 23))
                                                 #8#))))
                                   (LETT #7# (CDR #7#)) (GO G190) G191
                                   (EXIT (NREVERSE #8#)))))
                       (LETT |listCont|
                             (PROGN
                              (LETT #6# NIL)
                              (SEQ (LETT |f| NIL) (LETT #5# |listf|) G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN (LETT |f| (CAR #5#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #6#
                                           (CONS (SPADCALL |f| (QREFELT $ 34))
                                                 #6#))))
                                   (LETT #5# (CDR #5#)) (GO G190) G191
                                   (EXIT (NREVERSE #6#)))))
                       (LETT |contgcd| (SPADCALL |listCont| (QREFELT $ 36)))
                       (LETT |listf|
                             (PROGN
                              (LETT #4# NIL)
                              (SEQ (LETT |cf| NIL) (LETT #3# |listCont|)
                                   (LETT |f| NIL) (LETT #2# |listf|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |f| (CAR #2#)) NIL)
                                         (ATOM #3#)
                                         (PROGN (LETT |cf| (CAR #3#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL |f| |cf|
                                                                (QREFELT $
                                                                         37)))
                                                (QCDR #1#)
                                              (|check_union2| (QEQCAR #1# 0)
                                                              (QREFELT $ 7)
                                                              (|Union|
                                                               (QREFELT $ 7)
                                                               #17#)
                                                              #1#))
                                            #4#))))
                                   (LETT #2#
                                         (PROG1 (CDR #2#)
                                           (LETT #3# (CDR #3#))))
                                   (GO G190) G191 (EXIT (NREVERSE #4#)))))
                       (LETT |minpol|
                             (SPADCALL |contgcd| |minpol| (QREFELT $ 38)))
                       (LETT |ans|
                             (COND
                              ((SPADCALL (|spadConstant| $ 28) |listf|
                                         (QREFELT $ 39))
                               (|spadConstant| $ 28))
                              ((SPADCALL 1 |listdeg| (QREFELT $ 41))
                               (|INMODGCD;lincase| |listdeg| |listf| $))
                              (#16# (SPADCALL |listf| (QREFELT $ 25)))))
                       (EXIT (SPADCALL |minpol| |ans| (QREFELT $ 33)))))))))) 

(SDEFUN |INMODGCD;lincase|
        ((|listdeg| |List| (|NonNegativeInteger|)) (|listf| |List| BP) ($ BP))
        (SPROG
         ((#1=#:G470 NIL) (|f1| (|Union| BP "failed")) (#2=#:G471 NIL)
          (|f| NIL) (|g| (BP)) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL 1 |listdeg| (QREFELT $ 44)))
                (LETT |g| (SPADCALL |listf| |n| (QREFELT $ 45)))
                (SEQ (LETT |f| NIL) (LETT #2# |listf|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 32)))
                          (EXIT
                           (COND
                            ((QEQCAR |f1| 1)
                             (PROGN
                              (LETT #1# (|spadConstant| $ 28))
                              (GO #3=#:G469))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |g|)))
          #3# (EXIT #1#)))) 

(SDEFUN |INMODGCD;test| ((|f| BP) (|g| BP) (|d| BP) ($ |Boolean|))
        (SPROG ((|d0| (R)))
               (SEQ (LETT |d0| (SPADCALL |d| 0 (QREFELT $ 46)))
                    (EXIT
                     (COND
                      ((OR
                        (QEQCAR
                         (SPADCALL (SPADCALL |f| 0 (QREFELT $ 46)) |d0|
                                   (QREFELT $ 47))
                         1)
                        (OR
                         (QEQCAR
                          (SPADCALL (SPADCALL |g| 0 (QREFELT $ 46)) |d0|
                                    (QREFELT $ 47))
                          1)
                         (QEQCAR (SPADCALL |f| |d| (QREFELT $ 32)) 1)))
                       NIL)
                      ('T
                       (NULL (QEQCAR (SPADCALL |g| |d| (QREFELT $ 32)) 1)))))))) 

(SDEFUN |INMODGCD;modGcdPrimitive| ((|f| BP) (|g| BP) ($ BP))
        (SPROG
         ((#1=#:G504 NIL) (|result| (BP)) (|testdeg| #2=(|NonNegativeInteger|))
          (|soFar| (BP)) (|soFarModulus| (R)) (|correctionFactor| (R))
          (|ans| (BP)) (#3=#:G486 NIL) (|cont| (R)) (|correction| (BP))
          (|dp| (FP)) (|ldp| (FP)) (|lcdp| (R)) (|dgp| (|NonNegativeInteger|))
          (|gp| (FP)) (|fp| (FP)) (|prime| (R))
          (|bound| (|NonNegativeInteger|)) (|lcd| (R)) (|lcg| (R)) (|lcf| (R))
          (|dg| #2#) (|df| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |df| (SPADCALL |f| (QREFELT $ 23)))
                (LETT |dg| (SPADCALL |g| (QREFELT $ 23)))
                (LETT |lcf| (SPADCALL |f| (QREFELT $ 48)))
                (LETT |lcg| (SPADCALL |g| (QREFELT $ 48)))
                (LETT |lcd| (SPADCALL |lcf| |lcg| (QREFELT $ 49)))
                (LETT |prime| (QREFELT $ 8))
                (LETT |bound| (|INMODGCD;mbound| |f| |g| $))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |lcd| |prime| (QREFELT $ 18))
                                  (QREFELT $ 50)))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |prime|
                             (SPADCALL |prime| |bound| (QREFELT $ 9)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |soFar|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f| |prime| (QREFELT $ 51))
                                 (SPADCALL |g| |prime| (QREFELT $ 51))
                                 (QREFELT $ 52))
                       (QREFELT $ 53)))
                (LETT |testdeg| (SPADCALL |soFar| (QREFELT $ 23)))
                (EXIT
                 (COND
                  ((ZEROP |testdeg|)
                   (PROGN (LETT #1# (|spadConstant| $ 28)) (GO #4=#:G503)))
                  (#5='T
                   (SEQ
                    (LETT |ldp|
                          (SEQ (LETT |lcdp| (SPADCALL |soFar| (QREFELT $ 48)))
                               (EXIT
                                (COND
                                 ((SPADCALL |lcdp| (|spadConstant| $ 27)
                                            (QREFELT $ 13))
                                  (SPADCALL (SPADCALL |lcd| (QREFELT $ 54))
                                            |prime| (QREFELT $ 51)))
                                 (#5#
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (|INMODGCD;modInverse| |lcdp| |prime| $)
                                     |lcd| (QREFELT $ 55))
                                    (QREFELT $ 54))
                                   |prime| (QREFELT $ 51)))))))
                    (LETT |soFar|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |ldp| (QREFELT $ 53)) |soFar|
                                      (QREFELT $ 33))
                            |prime| (QREFELT $ 51))
                           (QREFELT $ 53)))
                    (LETT |soFarModulus| |prime|)
                    (EXIT
                     (SEQ G190 (COND ((NULL 'T) (GO G191)))
                          (SEQ
                           (LETT |prime|
                                 (SPADCALL |prime| |bound| (QREFELT $ 9)))
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |lcd| |prime| (QREFELT $ 18))
                                        (|spadConstant| $ 10) (QREFELT $ 13))
                              "next prime")
                             ('T
                              (SEQ
                               (LETT |fp|
                                     (SPADCALL |f| |prime| (QREFELT $ 51)))
                               (LETT |gp|
                                     (SPADCALL |g| |prime| (QREFELT $ 51)))
                               (LETT |dp| (SPADCALL |fp| |gp| (QREFELT $ 52)))
                               (LETT |dgp| (SPADCALL |dp| (QREFELT $ 56)))
                               (COND
                                ((EQL |dgp| 0)
                                 (PROGN
                                  (LETT #1# (|spadConstant| $ 28))
                                  (GO #4#))))
                               (COND
                                ((EQL |dgp| |dg|)
                                 (COND
                                  ((NULL
                                    (QEQCAR (SPADCALL |f| |g| (QREFELT $ 32))
                                            1))
                                   (PROGN (LETT #1# |g|) (GO #4#))))))
                               (COND
                                ((EQL |dgp| |df|)
                                 (COND
                                  ((NULL
                                    (QEQCAR (SPADCALL |g| |f| (QREFELT $ 32))
                                            1))
                                   (PROGN (LETT #1# |f|) (GO #4#))))))
                               (EXIT
                                (COND ((> |dgp| |testdeg|) "next prime")
                                      ('T
                                       (SEQ
                                        (LETT |ldp|
                                              (SEQ
                                               (LETT |lcdp|
                                                     (SPADCALL
                                                      (SPADCALL |dp|
                                                                (QREFELT $ 53))
                                                      (QREFELT $ 48)))
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |lcdp|
                                                            (|spadConstant| $
                                                                            27)
                                                            (QREFELT $ 13))
                                                  (SPADCALL
                                                   (SPADCALL |lcd|
                                                             (QREFELT $ 54))
                                                   |prime| (QREFELT $ 51)))
                                                 ('T
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (|INMODGCD;modInverse|
                                                      |lcdp| |prime| $)
                                                     |lcd| (QREFELT $ 55))
                                                    (QREFELT $ 54))
                                                   |prime| (QREFELT $ 51)))))))
                                        (LETT |dp|
                                              (SPADCALL |ldp| |dp|
                                                        (QREFELT $ 57)))
                                        (EXIT
                                         (COND
                                          ((EQL |dgp| |testdeg|)
                                           (SEQ
                                            (LETT |correction|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |dp|
                                                               (QREFELT $ 53))
                                                     |soFar| (QREFELT $ 58))
                                                    |prime| (QREFELT $ 51))
                                                   (QREFELT $ 53)))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |correction|
                                                         (QREFELT $ 21))
                                               (SEQ
                                                (LETT |ans|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL |lcd|
                                                                   (QREFELT $
                                                                            54))
                                                         |soFar|
                                                         (QREFELT $ 33))
                                                        |soFarModulus|
                                                        (QREFELT $ 51))
                                                       (QREFELT $ 53)))
                                                (LETT |cont|
                                                      (SPADCALL |ans|
                                                                (QREFELT $
                                                                         34)))
                                                (LETT |ans|
                                                      (PROG2
                                                          (LETT #3#
                                                                (SPADCALL |ans|
                                                                          |cont|
                                                                          (QREFELT
                                                                           $
                                                                           37)))
                                                          (QCDR #3#)
                                                        (|check_union2|
                                                         (QEQCAR #3# 0)
                                                         (QREFELT $ 7)
                                                         (|Union| (QREFELT $ 7)
                                                                  "failed")
                                                         #3#)))
                                                (EXIT
                                                 (COND
                                                  ((|INMODGCD;test| |f| |g|
                                                    |ans| $)
                                                   (PROGN
                                                    (LETT #1# |ans|)
                                                    (GO #4#)))
                                                  ('T
                                                   (LETT |soFarModulus|
                                                         (SPADCALL
                                                          |soFarModulus|
                                                          |prime|
                                                          (QREFELT $ 55))))))))
                                              ('T
                                               (SEQ
                                                (LETT |correctionFactor|
                                                      (|INMODGCD;modInverse|
                                                       (SPADCALL |soFarModulus|
                                                                 |prime|
                                                                 (QREFELT $
                                                                          18))
                                                       |prime| $))
                                                (LETT |soFar|
                                                      (SPADCALL |soFar|
                                                                (SPADCALL
                                                                 |soFarModulus|
                                                                 (SPADCALL
                                                                  |correctionFactor|
                                                                  |correction|
                                                                  (QREFELT $
                                                                           38))
                                                                 (QREFELT $
                                                                          38))
                                                                (QREFELT $
                                                                         59)))
                                                (LETT |soFarModulus|
                                                      (SPADCALL |soFarModulus|
                                                                |prime|
                                                                (QREFELT $
                                                                         55)))
                                                (EXIT
                                                 (LETT |soFar|
                                                       (SPADCALL
                                                        (SPADCALL |soFar|
                                                                  |soFarModulus|
                                                                  (QREFELT $
                                                                           51))
                                                        (QREFELT $ 53))))))))))
                                          ((< |dgp| |testdeg|)
                                           (SEQ (LETT |soFarModulus| |prime|)
                                                (LETT |soFar|
                                                      (SPADCALL |dp|
                                                                (QREFELT $
                                                                         53)))
                                                (EXIT (LETT |testdeg| |dgp|))))
                                          ((NULL (QREFELT $ 20))
                                           (COND
                                            ((>
                                              (SPADCALL |prime| (QREFELT $ 60))
                                              1)
                                             (SEQ
                                              (LETT |result|
                                                    (SPADCALL |dp|
                                                              (QREFELT $ 53)))
                                              (EXIT
                                               (COND
                                                ((|INMODGCD;test| |f| |g|
                                                  |result| $)
                                                 (PROGN
                                                  (LETT #1# |result|)
                                                  (GO #4#))))))))))))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |INMODGCD;merge| ((|p| R) (|q| R) ($ |Union| R "failed"))
        (COND ((SPADCALL |p| |q| (QREFELT $ 13)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 13))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| $ 10) (QREFELT $ 13))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |INMODGCD;modInverse| ((|c| R) (|p| R) ($ R))
        (SPROG ((#1=#:G511 NIL))
               (QCAR
                (PROG2
                    (LETT #1#
                          (SPADCALL |c| |p| (|spadConstant| $ 27)
                                    (QREFELT $ 63)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record| (|:| |coef1| (QREFELT $ 6))
                                            (|:| |coef2| (QREFELT $ 6)))
                                  (|Union|
                                   (|Record| (|:| |coef1| (QREFELT $ 6))
                                             (|:| |coef2| (QREFELT $ 6)))
                                   "failed")
                                  #1#))))) 

(SDEFUN |INMODGCD;exactquo| ((|u| BP) (|v| BP) (|p| R) ($ |Union| BP "failed"))
        (SPROG
         ((|r| (|Record| (|:| |quotient| BP) (|:| |remainder| BP)))
          (|invlcv| (R)))
         (SEQ
          (LETT |invlcv|
                (|INMODGCD;modInverse| (SPADCALL |v| (QREFELT $ 48)) |p| $))
          (LETT |r|
                (SPADCALL |u|
                          (SPADCALL (SPADCALL |invlcv| |v| (QREFELT $ 38)) |p|
                                    (QREFELT $ 17))
                          (QREFELT $ 65)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) |p| (QREFELT $ 17))
                       (|spadConstant| $ 11) (QREFELT $ 66))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL (SPADCALL |invlcv| (QCAR |r|) (QREFELT $ 38)) |p|
                             (QREFELT $ 17))))))))) 

(SDEFUN |INMODGCD;height| ((|f| BP) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G521 NIL) (#2=#:G520 #3=(|NonNegativeInteger|)) (#4=#:G522 #3#)
          (#5=#:G525 NIL) (|cc| NIL) (|degf| (|NonNegativeInteger|)))
         (SEQ (LETT |degf| (SPADCALL |f| (QREFELT $ 23)))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |cc| NIL) (LETT #5# (SPADCALL |f| (QREFELT $ 68)))
                     G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |cc| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #4# (SPADCALL |cc| (QREFELT $ 60)))
                        (COND (#1# (LETT #2# (MAX #2# #4#)))
                              ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) ('T (|IdentityError| '|max|)))))))) 

(SDEFUN |INMODGCD;mbound| ((|f| BP) (|g| BP) ($ |NonNegativeInteger|))
        (SPROG ((|hg| #1=(|NonNegativeInteger|)) (|hf| #1#))
               (SEQ (LETT |hf| (|INMODGCD;height| |f| $))
                    (LETT |hg| (|INMODGCD;height| |g| $))
                    (EXIT (* 2 (MIN |hf| |hg|)))))) 

(DECLAIM (NOTINLINE |InnerModularGcd;|)) 

(DEFUN |InnerModularGcd| (&REST #1=#:G528)
  (SPROG NIL
         (PROG (#2=#:G529)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerModularGcd|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerModularGcd;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerModularGcd|)))))))))) 

(DEFUN |InnerModularGcd;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|InnerModularGcd| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 69))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|InnerModularGcd|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#1| '(|IntegerNumberSystem|))
      (QSETREFV $ 17
                (CONS (|dispatchFunction| |INMODGCD;reduction;BPRBP;1|) $)))
     ('T
      (QSETREFV $ 17
                (CONS (|dispatchFunction| |INMODGCD;reduction;BPRBP;2|) $))))
    (QSETREFV $ 19
              (|EuclideanModularRing| |#1| |#2| |#1| (ELT $ 17)
                                      (CONS (|function| |INMODGCD;merge|) $)
                                      (CONS (|function| |INMODGCD;exactquo|)
                                            $)))
    (QSETREFV $ 20 (|HasCategory| |#1| '(|CharacteristicZero|)))
    $))) 

(MAKEPROP '|InnerModularGcd| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |Zero|) (4 . |Zero|)
              (|Boolean|) (8 . =) (14 . |symmetricRemainder|) (|Mapping| 6 6)
              (20 . |map|) (26 . |reduction|) (32 . |rem|) 'FP '|zeroChar|
              (38 . |zero?|) (|NonNegativeInteger|) (43 . |degree|) (|List| 7)
              |INMODGCD;modularGcdPrimitive;LBP;3| (48 . |remove!|)
              (54 . |One|) (58 . |One|) (62 . |minimumDegree|)
              (67 . |monomial|) (|Union| $ '"failed") (73 . |exquo|) (79 . *)
              (85 . |content|) (|List| $) (90 . |gcd|) (95 . |exquo|) (101 . *)
              (107 . |member?|) (|List| 22) (113 . |member?|)
              |INMODGCD;modularGcd;LBP;4| (|Integer|) (119 . |position|)
              (125 . |elt|) (131 . |coefficient|) (137 . |exquo|)
              (143 . |leadingCoefficient|) (148 . |gcd|) (154 . |zero?|)
              (159 . |reduce|) (165 . |gcd|) (171 . |coerce|) (176 . |coerce|)
              (181 . *) (187 . |euclideanSize|) (192 . *) (198 . -) (204 . +)
              (210 . |euclideanSize|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 61 '"failed")
              (215 . |extendedEuclidean|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (222 . |monicDivide|) (228 . ~=) (|List| 6)
              (234 . |coefficients|))
           '#(|reduction| 239 |modularGcdPrimitive| 245 |modularGcd| 250) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|modularGcdPrimitive| (|#2| (|List| |#2|))) T)
                              '((|modularGcd| (|#2| (|List| |#2|))) T)
                              '((|reduction| (|#2| |#2| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 68
                                            '(0 6 0 10 0 7 0 11 2 6 12 0 0 13 2
                                              6 0 0 0 14 2 7 0 15 0 16 2 0 7 7
                                              6 17 2 6 0 0 0 18 1 7 12 0 21 1 7
                                              22 0 23 2 24 0 7 0 26 0 6 0 27 0
                                              7 0 28 1 7 22 0 29 2 7 0 6 22 30
                                              2 7 31 0 0 32 2 7 0 0 0 33 1 7 6
                                              0 34 1 6 0 35 36 2 7 31 0 6 37 2
                                              7 0 6 0 38 2 24 12 7 0 39 2 40 12
                                              22 0 41 2 40 43 22 0 44 2 24 7 0
                                              43 45 2 7 6 0 22 46 2 6 31 0 0 47
                                              1 7 6 0 48 2 6 0 0 0 49 1 6 12 0
                                              50 2 19 0 7 6 51 2 19 0 0 0 52 1
                                              19 7 0 53 1 7 0 6 54 2 6 0 0 0 55
                                              1 19 22 0 56 2 19 0 0 0 57 2 7 0
                                              0 0 58 2 7 0 0 0 59 1 6 22 0 60 3
                                              6 62 0 0 0 63 2 7 64 0 0 65 2 7
                                              12 0 0 66 1 7 67 0 68 2 0 7 7 6
                                              17 1 0 7 24 25 1 0 7 24 42)))))
           '|lookupComplete|)) 
