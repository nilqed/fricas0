
(SDEFUN |ODEINT;diff;SM;1| ((|x| |Symbol|) ($ |Mapping| F F))
        (SPROG NIL (CONS #'|ODEINT;diff;SM;1!0| (VECTOR $ |x|)))) 

(SDEFUN |ODEINT;diff;SM;1!0| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|ODEINT;diff;SM;1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| |x| (QREFELT $ 9)))))) 

(SDEFUN |ODEINT;int;FSF;2| ((|f| F) (|x| |Symbol|) ($ F))
        (SPROG ((|u| (|Union| F (|List| F))))
               (SEQ
                (LETT |u| (SPADCALL |f| |x| (QREFELT $ 14)) |ODEINT;int;FSF;2|)
                (EXIT
                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                       ('T (|SPADfirst| (QCDR |u|)))))))) 

(SDEFUN |ODEINT;mkprod|
        ((|l| |List|
          (|Record| (|:| |coef| (|Fraction| (|Integer|))) (|:| |logand| F)))
         ($ F))
        (SPROG
         ((#1=#:G729 NIL) (#2=#:G728 (F)) (#3=#:G730 (F)) (#4=#:G735 NIL)
          (|r| NIL)
          (|ll|
           (|List|
            (|Record| (|:| |coef| (|Fraction| (|Integer|))) (|:| |logand| F))))
          (|d| (|Integer|))
          (|rec|
           (|Record| (|:| |coef| (|Fraction| (|Integer|))) (|:| |logand| F))))
         (SEQ
          (COND ((NULL |l|) (|spadConstant| $ 16))
                (#5='T
                 (SEQ (LETT |rec| (|SPADfirst| |l|) . #6=(|ODEINT;mkprod|))
                      (LETT |d| (SPADCALL (QCAR |rec|) (QREFELT $ 19)) . #6#)
                      (LETT |ll|
                            (SPADCALL (CONS #'|ODEINT;mkprod!0| (VECTOR |d| $))
                                      |l| (QREFELT $ 25))
                            . #6#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (PROGN
                          (LETT #1# NIL . #6#)
                          (SEQ (LETT |r| NIL . #6#) (LETT #4# |ll| . #6#) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |r| (CAR #4#) . #6#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #3#
                                        (SPADCALL (QCDR |r|)
                                                  (SPADCALL (QCAR |r|)
                                                            (QREFELT $ 26))
                                                  (QREFELT $ 27))
                                        . #6#)
                                  (COND
                                   (#1#
                                    (LETT #2# (SPADCALL #2# #3# (QREFELT $ 28))
                                          . #6#))
                                   ('T
                                    (PROGN
                                     (LETT #2# #3# . #6#)
                                     (LETT #1# 'T . #6#)))))))
                               (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#1# #2#) (#5# (|spadConstant| $ 16))))
                         |d| (QREFELT $ 29))
                        (|ODEINT;mkprod| (SPADCALL |l| |ll| (QREFELT $ 30)) $)
                        (QREFELT $ 28))))))))) 

(SDEFUN |ODEINT;mkprod!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |d|)
          (LETT $ (QREFELT $$ 1) . #1=(|ODEINT;mkprod|))
          (LETT |d| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL (QCAR |z1|) (QREFELT $ 19)) |d|
                      (QREFELT $ 21)))))) 

(SDEFUN |ODEINT;expint;FSF;4| ((|f| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((|exponent| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|lrec|
           (|List|
            (|Record| (|:| |coef| (|Fraction| (|Integer|))) (|:| |logand| F))))
          (|w|
           (|Union|
            (|Record| (|:| |coef| (|Fraction| (|Integer|))) (|:| |logand| F))
            "failed"))
          (#1=#:G755 NIL) (|term| NIL)
          (|l| (|List| #2=(|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|v|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F)))
                    "failed"))
          (|na| #2#) (|da| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|u| (|Union| F "failed")) (|a| (F)))
         (SEQ
          (LETT |a| (SPADCALL |f| |x| (QREFELT $ 15))
                . #3=(|ODEINT;expint;FSF;4|))
          (LETT |u|
                (SPADCALL (SPADCALL |a| (QREFELT $ 32)) |a| |x| (QREFELT $ 36))
                . #3#)
          (EXIT
           (COND ((QEQCAR |u| 0) (QCDR |u|))
                 (#4='T
                  (SEQ (LETT |da| (SPADCALL |a| (QREFELT $ 38)) . #3#)
                       (LETT |l|
                             (SEQ
                              (LETT |v|
                                    (SPADCALL
                                     (LETT |na| (SPADCALL |a| (QREFELT $ 39))
                                           . #3#)
                                     (QREFELT $ 42))
                                    . #3#)
                              (EXIT
                               (COND ((QEQCAR |v| 0) (QCDR |v|))
                                     (#4# (LIST |na|)))))
                             . #3#)
                       (LETT |exponent| (|spadConstant| $ 43) . #3#)
                       (LETT |lrec| NIL . #3#)
                       (SEQ (LETT |term| NIL . #3#) (LETT #1# |l| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |term| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |w|
                                   (|ODEINT;isQlog|
                                    (SPADCALL |term| |da| (QREFELT $ 44)) $)
                                   . #3#)
                             (EXIT
                              (COND
                               ((QEQCAR |w| 0)
                                (LETT |lrec| (CONS (QCDR |w|) |lrec|) . #3#))
                               ('T
                                (LETT |exponent|
                                      (SPADCALL |exponent| |term|
                                                (QREFELT $ 45))
                                      . #3#)))))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SPADCALL (|ODEINT;mkprod| |lrec| $)
                                  (SPADCALL
                                   (SPADCALL |exponent| |da| (QREFELT $ 44))
                                   (QREFELT $ 46))
                                  (QREFELT $ 28)))))))))) 

(SDEFUN |ODEINT;isQ|
        ((|l| |List| F) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG
         ((|prod| (|Fraction| (|Integer|))) (#1=#:G763 NIL)
          (|u| (|Union| (|Fraction| (|Integer|)) "failed")) (#2=#:G764 NIL)
          (|x| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |prod| (|spadConstant| $ 48) . #3=(|ODEINT;isQ|))
                (SEQ (LETT |x| NIL . #3#) (LETT #2# |l| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 50)) . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |u| 1)
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #3#)
                              (GO #4=#:G762)))
                            ('T
                             (LETT |prod|
                                   (SPADCALL |prod| (QCDR |u|) (QREFELT $ 51))
                                   . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |prod|))))
          #4# (EXIT #1#)))) 

(SDEFUN |ODEINT;isQlog|
        ((|f| F)
         ($ |Union|
          (|Record| (|:| |coef| (|Fraction| (|Integer|))) (|:| |logand| F))
          "failed"))
        (SPROG
         ((#1=#:G786 NIL) (#2=#:G785 NIL)
          (|u| (|Union| (|Fraction| (|Integer|)) "failed")) (|l| (|List| F))
          (|v| (|Union| (|List| F) "failed")))
         (SEQ
          (COND
           ((SPADCALL |f| '|log| (QREFELT $ 52))
            (CONS 0
                  (CONS (|spadConstant| $ 48)
                        (|SPADfirst|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 55))
                                   (QREFELT $ 58))))))
           ('T
            (SEQ
             (EXIT
              (SEQ
               (SEQ
                (LETT |v| (SPADCALL |f| (QREFELT $ 59)) . #3=(|ODEINT;isQlog|))
                (EXIT
                 (COND
                  ((QEQCAR |v| 0)
                   (COND
                    ((SPADCALL (LENGTH (LETT |l| (QCDR |v|) . #3#)) 3
                               (QREFELT $ 61))
                     (PROGN
                      (LETT #1#
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |l|
                                     (NREVERSE
                                      (SPADCALL (ELT $ 62) |l| (QREFELT $ 64)))
                                     . #3#)
                               (COND
                                ((SPADCALL (|SPADfirst| |l|) '|log|
                                           (QREFELT $ 52))
                                 (SEQ
                                  (LETT |u| (|ODEINT;isQ| (CDR |l|) $) . #3#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |u| 0)
                                     (PROGN
                                      (LETT #2#
                                            (CONS 0
                                                  (CONS (QCDR |u|)
                                                        (|SPADfirst|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (|SPADfirst| |l|)
                                                           (QREFELT $ 55))
                                                          (QREFELT $ 58)))))
                                            . #3#)
                                      (GO #4=#:G779))))))))
                               (EXIT (CONS 1 "failed"))))
                             #4# (EXIT #2#))
                            . #3#)
                      (GO #5=#:G782))))))))
               (EXIT (CONS 1 "failed"))))
             #5# (EXIT #1#))))))) 

(DECLAIM (NOTINLINE |ODEIntegration;|)) 

(DEFUN |ODEIntegration| (&REST #1=#:G787)
  (SPROG NIL
         (PROG (#2=#:G788)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ODEIntegration|)
                                               '|domainEqualList|)
                    . #3=(|ODEIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ODEIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ODEIntegration|)))))))))) 

(DEFUN |ODEIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ODEIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ODEIntegration| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 65) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ODEIntegration| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ODEIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |differentiate|) (|Mapping| 7 7) |ODEINT;diff;SM;1|
              (|Union| 7 56) (|FunctionSpaceIntegration| 6 7) (6 . |integrate|)
              |ODEINT;int;FSF;2| (12 . |One|) (|Integer|) (|Fraction| 17)
              (16 . |denom|) (|Boolean|) (21 . =)
              (|Record| (|:| |coef| 18) (|:| |logand| 7)) (|Mapping| 20 22)
              (|List| 22) (27 . |select|) (33 . |numer|) (38 . ^) (44 . *)
              (50 . |nthRoot|) (56 . |setDifference|) (|List| 54)
              (62 . |tower|) (|Union| 7 '"failed") (|List| 57)
              (|ElementaryFunctionStructurePackage| 6 7)
              (67 . |validExponential|) (|SparseMultivariatePolynomial| 6 54)
              (74 . |denom|) (79 . |numer|) (|Union| (|List| $) '"failed")
              (|SparseMultivariatePolynomial| 6 57) (84 . |isPlus|)
              (89 . |Zero|) (93 . /) (99 . +) (105 . |exp|)
              |ODEINT;expint;FSF;4| (110 . |One|) (|Union| 18 '"failed")
              (114 . |retractIfCan|) (119 . *) (125 . |is?|) (131 . |One|)
              (|Kernel| $) (135 . |retract|) (|List| 7) (|Kernel| 7)
              (140 . |argument|) (145 . |isTimes|) (|NonNegativeInteger|)
              (150 . <=) (156 . |smaller?|) (|Mapping| 20 7 7) (162 . |sort!|))
           '#(|int| 168 |expint| 174 |diff| 180) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 64
                                                 '(2 7 0 0 8 9 2 13 12 7 8 14 0
                                                   7 0 16 1 18 17 0 19 2 17 20
                                                   0 0 21 2 24 0 23 0 25 1 18
                                                   17 0 26 2 7 0 0 17 27 2 7 0
                                                   0 0 28 2 7 0 0 17 29 2 24 0
                                                   0 0 30 1 7 31 0 32 3 35 33
                                                   34 7 8 36 1 7 37 0 38 1 7 37
                                                   0 39 1 41 40 0 42 0 41 0 43
                                                   2 7 0 37 37 44 2 41 0 0 0 45
                                                   1 7 0 0 46 0 18 0 48 1 7 49
                                                   0 50 2 18 0 0 0 51 2 7 20 0
                                                   8 52 0 6 0 53 1 7 54 0 55 1
                                                   57 56 0 58 1 7 40 0 59 2 60
                                                   20 0 0 61 2 7 20 0 0 62 2 56
                                                   0 63 0 64 2 0 7 7 8 15 2 0 7
                                                   7 8 47 1 0 10 8 11)))))
           '|lookupComplete|)) 
