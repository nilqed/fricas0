
(SDEFUN |INMODGCD;reduction;BPRBP;1| ((|u| BP) (|p| R) ($ BP))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 13)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|INMODGCD;reduction;BPRBP;1!0| (VECTOR $ |p|))
                       |u| (QREFELT $ 16)))))) 

(SDEFUN |INMODGCD;reduction;BPRBP;1!0| ((|r1| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1) . #1=(|INMODGCD;reduction;BPRBP;1|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (LETT |p| (QREFELT $$ 1) . #1=(|INMODGCD;reduction;BPRBP;2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 18)))))) 

(SDEFUN |INMODGCD;modularGcdPrimitive;LBP;3| ((|listf| |List| BP) ($ BP))
        (SPROG ((|g| (BP)) (#1=#:G756 NIL) (|f| NIL))
               (SEQ
                (COND ((NULL |listf|) (|spadConstant| $ 11))
                      ('T
                       (SEQ
                        (LETT |g| (|SPADfirst| |listf|)
                              . #2=(|INMODGCD;modularGcdPrimitive;LBP;3|))
                        (SEQ (LETT |f| NIL . #2#)
                             (LETT #1# (CDR |listf|) . #2#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |f| (CAR #1#) . #2#) NIL)
                                   (NULL
                                    (SPADCALL (SPADCALL |g| (QREFELT $ 23)) 0
                                              (QREFELT $ 24))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |f| (QREFELT $ 21)))
                                 (LETT |g|
                                       (|INMODGCD;modGcdPrimitive| |g| |f| $)
                                       . #2#)))))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |g|))))))) 

(SDEFUN |INMODGCD;modularGcd;LBP;4| ((|listf| |List| BP) ($ BP))
        (SPROG
         ((|ans| (BP)) (|minpol| (BP)) (#1=#:G762 NIL) (#2=#:G783 NIL)
          (|f| NIL) (#3=#:G784 NIL) (|cf| NIL) (#4=#:G782 NIL) (|contgcd| (R))
          (|listCont| (|List| R)) (#5=#:G781 NIL) (#6=#:G780 NIL)
          (|listdeg| (|List| (|NonNegativeInteger|))) (#7=#:G779 NIL)
          (#8=#:G778 NIL) (#9=#:G777 NIL) (#10=#:G776 NIL) (|minpol1| (BP))
          (|mdeg| #11=(|NonNegativeInteger|)) (#12=#:G759 NIL)
          (#13=#:G758 #11#) (#14=#:G760 #11#) (#15=#:G775 NIL))
         (SEQ
          (LETT |listf| (SPADCALL (|spadConstant| $ 11) |listf| (QREFELT $ 27))
                . #16=(|INMODGCD;modularGcd;LBP;4|))
          (EXIT
           (COND ((NULL |listf|) (|spadConstant| $ 11))
                 ((EQL (LENGTH |listf|) 1) (|SPADfirst| |listf|))
                 (#17='T
                  (SEQ (LETT |minpol| (|spadConstant| $ 29) . #16#)
                       (LETT |mdeg|
                             (PROGN
                              (LETT #12# NIL . #16#)
                              (SEQ (LETT |f| NIL . #16#)
                                   (LETT #15# |listf| . #16#) G190
                                   (COND
                                    ((OR (ATOM #15#)
                                         (PROGN
                                          (LETT |f| (CAR #15#) . #16#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #14# (SPADCALL |f| (QREFELT $ 30))
                                            . #16#)
                                      (COND
                                       (#12#
                                        (LETT #13# (MIN #13# #14#) . #16#))
                                       ('T
                                        (PROGN
                                         (LETT #13# #14# . #16#)
                                         (LETT #12# 'T . #16#)))))))
                                   (LETT #15# (CDR #15#) . #16#) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#12# #13#)
                                    (#17# (|IdentityError| '|min|))))
                             . #16#)
                       (COND
                        ((SPADCALL |mdeg| 0 (QREFELT $ 24))
                         (SEQ
                          (LETT |minpol1|
                                (SPADCALL (|spadConstant| $ 28) |mdeg|
                                          (QREFELT $ 31))
                                . #16#)
                          (LETT |listf|
                                (PROGN
                                 (LETT #10# NIL . #16#)
                                 (SEQ (LETT |f| NIL . #16#)
                                      (LETT #9# |listf| . #16#) G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN
                                             (LETT |f| (CAR #9#) . #16#)
                                             NIL))
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
                                                                            33))
                                                         . #16#)
                                                   (QCDR #1#)
                                                 (|check_union2| (QEQCAR #1# 0)
                                                                 (QREFELT $ 7)
                                                                 (|Union|
                                                                  (QREFELT $ 7)
                                                                  #18="failed")
                                                                 #1#))
                                               #10#)
                                              . #16#)))
                                      (LETT #9# (CDR #9#) . #16#) (GO G190)
                                      G191 (EXIT (NREVERSE #10#))))
                                . #16#)
                          (EXIT
                           (LETT |minpol|
                                 (SPADCALL |minpol| |minpol1| (QREFELT $ 34))
                                 . #16#)))))
                       (LETT |listdeg|
                             (PROGN
                              (LETT #8# NIL . #16#)
                              (SEQ (LETT |f| NIL . #16#)
                                   (LETT #7# |listf| . #16#) G190
                                   (COND
                                    ((OR (ATOM #7#)
                                         (PROGN
                                          (LETT |f| (CAR #7#) . #16#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #8#
                                           (CONS (SPADCALL |f| (QREFELT $ 23))
                                                 #8#)
                                           . #16#)))
                                   (LETT #7# (CDR #7#) . #16#) (GO G190) G191
                                   (EXIT (NREVERSE #8#))))
                             . #16#)
                       (LETT |listCont|
                             (PROGN
                              (LETT #6# NIL . #16#)
                              (SEQ (LETT |f| NIL . #16#)
                                   (LETT #5# |listf| . #16#) G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN
                                          (LETT |f| (CAR #5#) . #16#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #6#
                                           (CONS (SPADCALL |f| (QREFELT $ 35))
                                                 #6#)
                                           . #16#)))
                                   (LETT #5# (CDR #5#) . #16#) (GO G190) G191
                                   (EXIT (NREVERSE #6#))))
                             . #16#)
                       (LETT |contgcd| (SPADCALL |listCont| (QREFELT $ 37))
                             . #16#)
                       (LETT |listf|
                             (PROGN
                              (LETT #4# NIL . #16#)
                              (SEQ (LETT |cf| NIL . #16#)
                                   (LETT #3# |listCont| . #16#)
                                   (LETT |f| NIL . #16#)
                                   (LETT #2# |listf| . #16#) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |f| (CAR #2#) . #16#)
                                          NIL)
                                         (ATOM #3#)
                                         (PROGN
                                          (LETT |cf| (CAR #3#) . #16#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL |f| |cf|
                                                                (QREFELT $ 38))
                                                      . #16#)
                                                (QCDR #1#)
                                              (|check_union2| (QEQCAR #1# 0)
                                                              (QREFELT $ 7)
                                                              (|Union|
                                                               (QREFELT $ 7)
                                                               #18#)
                                                              #1#))
                                            #4#)
                                           . #16#)))
                                   (LETT #2#
                                         (PROG1 (CDR #2#)
                                           (LETT #3# (CDR #3#) . #16#))
                                         . #16#)
                                   (GO G190) G191 (EXIT (NREVERSE #4#))))
                             . #16#)
                       (LETT |minpol|
                             (SPADCALL |contgcd| |minpol| (QREFELT $ 39))
                             . #16#)
                       (LETT |ans|
                             (COND
                              ((SPADCALL (|spadConstant| $ 29) |listf|
                                         (QREFELT $ 40))
                               (|spadConstant| $ 29))
                              ((SPADCALL 1 |listdeg| (QREFELT $ 42))
                               (|INMODGCD;lincase| |listdeg| |listf| $))
                              (#17# (SPADCALL |listf| (QREFELT $ 26))))
                             . #16#)
                       (EXIT (SPADCALL |minpol| |ans| (QREFELT $ 34)))))))))) 

(SDEFUN |INMODGCD;lincase|
        ((|listdeg| |List| (|NonNegativeInteger|)) (|listf| |List| BP) ($ BP))
        (SPROG
         ((#1=#:G802 NIL) (|f1| (|Union| BP "failed")) (#2=#:G803 NIL)
          (|f| NIL) (|g| (BP)) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL 1 |listdeg| (QREFELT $ 45))
                  . #3=(|INMODGCD;lincase|))
            (LETT |g| (SPADCALL |listf| |n| (QREFELT $ 46)) . #3#)
            (SEQ (LETT |f| NIL . #3#) (LETT #2# |listf| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 33)) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |f1| 1)
                         (PROGN
                          (LETT #1# (|spadConstant| $ 29) . #3#)
                          (GO #4=#:G801))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT |g|)))
          #4# (EXIT #1#)))) 

(SDEFUN |INMODGCD;test| ((|f| BP) (|g| BP) (|d| BP) ($ |Boolean|))
        (SPROG ((|d0| (R)))
               (SEQ (LETT |d0| (SPADCALL |d| 0 (QREFELT $ 47)) |INMODGCD;test|)
                    (EXIT
                     (COND
                      ((OR
                        (QEQCAR
                         (SPADCALL (SPADCALL |f| 0 (QREFELT $ 47)) |d0|
                                   (QREFELT $ 48))
                         1)
                        (OR
                         (QEQCAR
                          (SPADCALL (SPADCALL |g| 0 (QREFELT $ 47)) |d0|
                                    (QREFELT $ 48))
                          1)
                         (QEQCAR (SPADCALL |f| |d| (QREFELT $ 33)) 1)))
                       NIL)
                      ('T
                       (NULL (QEQCAR (SPADCALL |g| |d| (QREFELT $ 33)) 1)))))))) 

(SDEFUN |INMODGCD;modGcdPrimitive| ((|f| BP) (|g| BP) ($ BP))
        (SPROG
         ((#1=#:G841 NIL) (|result| (BP)) (|testdeg| #2=(|NonNegativeInteger|))
          (|soFar| (BP)) (|soFarModulus| (R)) (|correctionFactor| (R))
          (|ans| (BP)) (#3=#:G823 NIL) (|cont| (R)) (|correction| (BP))
          (|dp| (FP)) (|ldp| (FP)) (|lcdp| (R)) (|dgp| (|NonNegativeInteger|))
          (|gp| (FP)) (|fp| (FP)) (|prime| (R))
          (|bound| (|NonNegativeInteger|)) (|lcd| (R)) (|lcg| (R)) (|lcf| (R))
          (|dg| #2#) (|df| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |df| (SPADCALL |f| (QREFELT $ 23))
                  . #4=(|INMODGCD;modGcdPrimitive|))
            (LETT |dg| (SPADCALL |g| (QREFELT $ 23)) . #4#)
            (LETT |lcf| (SPADCALL |f| (QREFELT $ 49)) . #4#)
            (LETT |lcg| (SPADCALL |g| (QREFELT $ 49)) . #4#)
            (LETT |lcd| (SPADCALL |lcf| |lcg| (QREFELT $ 50)) . #4#)
            (LETT |prime| (QREFELT $ 8) . #4#)
            (LETT |bound| (|INMODGCD;mbound| |f| |g| $) . #4#)
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL (SPADCALL |lcd| |prime| (QREFELT $ 18))
                              (QREFELT $ 51)))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |prime| (SPADCALL |prime| |bound| (QREFELT $ 9))
                         . #4#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |soFar|
                  (SPADCALL
                   (SPADCALL (SPADCALL |f| |prime| (QREFELT $ 52))
                             (SPADCALL |g| |prime| (QREFELT $ 52))
                             (QREFELT $ 53))
                   (QREFELT $ 54))
                  . #4#)
            (LETT |testdeg| (SPADCALL |soFar| (QREFELT $ 23)) . #4#)
            (EXIT
             (COND
              ((ZEROP |testdeg|)
               (PROGN (LETT #1# (|spadConstant| $ 29) . #4#) (GO #5=#:G840)))
              (#6='T
               (SEQ
                (LETT |ldp|
                      (SEQ
                       (LETT |lcdp| (SPADCALL |soFar| (QREFELT $ 49)) . #4#)
                       (EXIT
                        (COND
                         ((SPADCALL |lcdp| (|spadConstant| $ 28)
                                    (QREFELT $ 13))
                          (SPADCALL (SPADCALL |lcd| (QREFELT $ 55)) |prime|
                                    (QREFELT $ 52)))
                         (#6#
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|INMODGCD;modInverse| |lcdp| |prime| $)
                                      |lcd| (QREFELT $ 56))
                            (QREFELT $ 55))
                           |prime| (QREFELT $ 52))))))
                      . #4#)
                (LETT |soFar|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |ldp| (QREFELT $ 54)) |soFar|
                                  (QREFELT $ 34))
                        |prime| (QREFELT $ 52))
                       (QREFELT $ 54))
                      . #4#)
                (LETT |soFarModulus| |prime| . #4#)
                (EXIT
                 (SEQ G190 (COND ((NULL 'T) (GO G191)))
                      (SEQ
                       (LETT |prime| (SPADCALL |prime| |bound| (QREFELT $ 9))
                             . #4#)
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lcd| |prime| (QREFELT $ 18))
                                    (|spadConstant| $ 10) (QREFELT $ 13))
                          "next prime")
                         ('T
                          (SEQ
                           (LETT |fp| (SPADCALL |f| |prime| (QREFELT $ 52))
                                 . #4#)
                           (LETT |gp| (SPADCALL |g| |prime| (QREFELT $ 52))
                                 . #4#)
                           (LETT |dp| (SPADCALL |fp| |gp| (QREFELT $ 53))
                                 . #4#)
                           (LETT |dgp| (SPADCALL |dp| (QREFELT $ 57)) . #4#)
                           (COND
                            ((EQL |dgp| 0)
                             (PROGN
                              (LETT #1# (|spadConstant| $ 29) . #4#)
                              (GO #5#))))
                           (COND
                            ((EQL |dgp| |dg|)
                             (COND
                              ((NULL
                                (QEQCAR (SPADCALL |f| |g| (QREFELT $ 33)) 1))
                               (PROGN (LETT #1# |g| . #4#) (GO #5#))))))
                           (COND
                            ((EQL |dgp| |df|)
                             (COND
                              ((NULL
                                (QEQCAR (SPADCALL |g| |f| (QREFELT $ 33)) 1))
                               (PROGN (LETT #1# |f| . #4#) (GO #5#))))))
                           (EXIT
                            (COND
                             ((SPADCALL |dgp| |testdeg| (QREFELT $ 24))
                              "next prime")
                             ('T
                              (SEQ
                               (LETT |ldp|
                                     (SEQ
                                      (LETT |lcdp|
                                            (SPADCALL
                                             (SPADCALL |dp| (QREFELT $ 54))
                                             (QREFELT $ 49))
                                            . #4#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL |lcdp| (|spadConstant| $ 28)
                                                   (QREFELT $ 13))
                                         (SPADCALL
                                          (SPADCALL |lcd| (QREFELT $ 55))
                                          |prime| (QREFELT $ 52)))
                                        ('T
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (|INMODGCD;modInverse| |lcdp|
                                             |prime| $)
                                            |lcd| (QREFELT $ 56))
                                           (QREFELT $ 55))
                                          |prime| (QREFELT $ 52))))))
                                     . #4#)
                               (LETT |dp| (SPADCALL |ldp| |dp| (QREFELT $ 58))
                                     . #4#)
                               (EXIT
                                (COND
                                 ((EQL |dgp| |testdeg|)
                                  (SEQ
                                   (LETT |correction|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |dp| (QREFELT $ 54))
                                            |soFar| (QREFELT $ 59))
                                           |prime| (QREFELT $ 52))
                                          (QREFELT $ 54))
                                         . #4#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |correction| (QREFELT $ 21))
                                      (SEQ
                                       (LETT |ans|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |lcd| (QREFELT $ 55))
                                                |soFar| (QREFELT $ 34))
                                               |soFarModulus| (QREFELT $ 52))
                                              (QREFELT $ 54))
                                             . #4#)
                                       (LETT |cont|
                                             (SPADCALL |ans| (QREFELT $ 35))
                                             . #4#)
                                       (LETT |ans|
                                             (PROG2
                                                 (LETT #3#
                                                       (SPADCALL |ans| |cont|
                                                                 (QREFELT $
                                                                          38))
                                                       . #4#)
                                                 (QCDR #3#)
                                               (|check_union2| (QEQCAR #3# 0)
                                                               (QREFELT $ 7)
                                                               (|Union|
                                                                (QREFELT $ 7)
                                                                "failed")
                                                               #3#))
                                             . #4#)
                                       (EXIT
                                        (COND
                                         ((|INMODGCD;test| |f| |g| |ans| $)
                                          (PROGN
                                           (LETT #1# |ans| . #4#)
                                           (GO #5#)))
                                         ('T
                                          (LETT |soFarModulus|
                                                (SPADCALL |soFarModulus|
                                                          |prime|
                                                          (QREFELT $ 56))
                                                . #4#))))))
                                     ('T
                                      (SEQ
                                       (LETT |correctionFactor|
                                             (|INMODGCD;modInverse|
                                              (SPADCALL |soFarModulus| |prime|
                                                        (QREFELT $ 18))
                                              |prime| $)
                                             . #4#)
                                       (LETT |soFar|
                                             (SPADCALL |soFar|
                                                       (SPADCALL |soFarModulus|
                                                                 (SPADCALL
                                                                  |correctionFactor|
                                                                  |correction|
                                                                  (QREFELT $
                                                                           39))
                                                                 (QREFELT $
                                                                          39))
                                                       (QREFELT $ 60))
                                             . #4#)
                                       (LETT |soFarModulus|
                                             (SPADCALL |soFarModulus| |prime|
                                                       (QREFELT $ 56))
                                             . #4#)
                                       (EXIT
                                        (LETT |soFar|
                                              (SPADCALL
                                               (SPADCALL |soFar| |soFarModulus|
                                                         (QREFELT $ 52))
                                               (QREFELT $ 54))
                                              . #4#))))))))
                                 ((< |dgp| |testdeg|)
                                  (SEQ (LETT |soFarModulus| |prime| . #4#)
                                       (LETT |soFar|
                                             (SPADCALL |dp| (QREFELT $ 54))
                                             . #4#)
                                       (EXIT (LETT |testdeg| |dgp| . #4#))))
                                 ((NULL (QREFELT $ 20))
                                  (COND
                                   ((SPADCALL (SPADCALL |prime| (QREFELT $ 61))
                                              1 (QREFELT $ 24))
                                    (SEQ
                                     (LETT |result|
                                           (SPADCALL |dp| (QREFELT $ 54))
                                           . #4#)
                                     (EXIT
                                      (COND
                                       ((|INMODGCD;test| |f| |g| |result| $)
                                        (PROGN
                                         (LETT #1# |result| . #4#)
                                         (GO #5#))))))))))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |INMODGCD;merge| ((|p| R) (|q| R) ($ |Union| R "failed"))
        (COND ((SPADCALL |p| |q| (QREFELT $ 13)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 13))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| $ 10) (QREFELT $ 13))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |INMODGCD;modInverse| ((|c| R) (|p| R) ($ R))
        (SPROG ((#1=#:G848 NIL))
               (QCAR
                (PROG2
                    (LETT #1#
                          (SPADCALL |c| |p| (|spadConstant| $ 28)
                                    (QREFELT $ 64))
                          |INMODGCD;modInverse|)
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
                (|INMODGCD;modInverse| (SPADCALL |v| (QREFELT $ 49)) |p| $)
                . #1=(|INMODGCD;exactquo|))
          (LETT |r|
                (SPADCALL |u|
                          (SPADCALL (SPADCALL |invlcv| |v| (QREFELT $ 39)) |p|
                                    (QREFELT $ 17))
                          (QREFELT $ 66))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) |p| (QREFELT $ 17))
                       (|spadConstant| $ 11) (QREFELT $ 67))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL (SPADCALL |invlcv| (QCAR |r|) (QREFELT $ 39)) |p|
                             (QREFELT $ 17))))))))) 

(SDEFUN |INMODGCD;height| ((|f| BP) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G858 NIL) (#2=#:G857 #3=(|NonNegativeInteger|)) (#4=#:G859 #3#)
          (#5=#:G862 NIL) (|cc| NIL) (|degf| (|NonNegativeInteger|)))
         (SEQ
          (LETT |degf| (SPADCALL |f| (QREFELT $ 23)) . #6=(|INMODGCD;height|))
          (EXIT
           (PROGN
            (LETT #1# NIL . #6#)
            (SEQ (LETT |cc| NIL . #6#)
                 (LETT #5# (SPADCALL |f| (QREFELT $ 69)) . #6#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |cc| (CAR #5#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4# (SPADCALL |cc| (QREFELT $ 61)) . #6#)
                    (COND (#1# (LETT #2# (MAX #2# #4#) . #6#))
                          ('T
                           (PROGN
                            (LETT #2# #4# . #6#)
                            (LETT #1# 'T . #6#)))))))
                 (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|IdentityError| '|max|)))))))) 

(SDEFUN |INMODGCD;mbound| ((|f| BP) (|g| BP) ($ |NonNegativeInteger|))
        (SPROG ((|hg| #1=(|NonNegativeInteger|)) (|hf| #1#))
               (SEQ
                (LETT |hf| (|INMODGCD;height| |f| $) . #2=(|INMODGCD;mbound|))
                (LETT |hg| (|INMODGCD;height| |g| $) . #2#)
                (EXIT (SPADCALL 2 (MIN |hf| |hg|) (QREFELT $ 71)))))) 

(DECLAIM (NOTINLINE |InnerModularGcd;|)) 

(DEFUN |InnerModularGcd| (&REST #1=#:G865)
  (SPROG NIL
         (PROG (#2=#:G866)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerModularGcd|)
                                               '|domainEqualList|)
                    . #3=(|InnerModularGcd|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerModularGcd;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerModularGcd|)))))))))) 

(DEFUN |InnerModularGcd;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerModularGcd|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|InnerModularGcd| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 72) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
              (38 . |zero?|) (|NonNegativeInteger|) (43 . |degree|) (48 . >)
              (|List| 7) |INMODGCD;modularGcdPrimitive;LBP;3| (54 . |remove!|)
              (60 . |One|) (64 . |One|) (68 . |minimumDegree|)
              (73 . |monomial|) (|Union| $ '"failed") (79 . |exquo|) (85 . *)
              (91 . |content|) (|List| $) (96 . |gcd|) (101 . |exquo|)
              (107 . *) (113 . |member?|) (|List| 22) (119 . |member?|)
              |INMODGCD;modularGcd;LBP;4| (|Integer|) (125 . |position|)
              (131 . |elt|) (137 . |coefficient|) (143 . |exquo|)
              (149 . |leadingCoefficient|) (154 . |gcd|) (160 . |zero?|)
              (165 . |reduce|) (171 . |gcd|) (177 . |coerce|) (182 . |coerce|)
              (187 . *) (193 . |euclideanSize|) (198 . *) (204 . -) (210 . +)
              (216 . |euclideanSize|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 62 '"failed")
              (221 . |extendedEuclidean|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (228 . |monicDivide|) (234 . ~=) (|List| 6)
              (240 . |coefficients|) (|PositiveInteger|) (245 . *))
           '#(|reduction| 251 |modularGcdPrimitive| 257 |modularGcd| 262) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 71
                                                 '(0 6 0 10 0 7 0 11 2 6 12 0 0
                                                   13 2 6 0 0 0 14 2 7 0 15 0
                                                   16 2 0 7 7 6 17 2 6 0 0 0 18
                                                   1 7 12 0 21 1 7 22 0 23 2 22
                                                   12 0 0 24 2 25 0 7 0 27 0 6
                                                   0 28 0 7 0 29 1 7 22 0 30 2
                                                   7 0 6 22 31 2 7 32 0 0 33 2
                                                   7 0 0 0 34 1 7 6 0 35 1 6 0
                                                   36 37 2 7 32 0 6 38 2 7 0 6
                                                   0 39 2 25 12 7 0 40 2 41 12
                                                   22 0 42 2 41 44 22 0 45 2 25
                                                   7 0 44 46 2 7 6 0 22 47 2 6
                                                   32 0 0 48 1 7 6 0 49 2 6 0 0
                                                   0 50 1 6 12 0 51 2 19 0 7 6
                                                   52 2 19 0 0 0 53 1 19 7 0 54
                                                   1 7 0 6 55 2 6 0 0 0 56 1 19
                                                   22 0 57 2 19 0 0 0 58 2 7 0
                                                   0 0 59 2 7 0 0 0 60 1 6 22 0
                                                   61 3 6 63 0 0 0 64 2 7 65 0
                                                   0 66 2 7 12 0 0 67 1 7 68 0
                                                   69 2 22 0 70 0 71 2 0 7 7 6
                                                   17 1 0 7 25 26 1 0 7 25
                                                   43)))))
           '|lookupComplete|)) 
