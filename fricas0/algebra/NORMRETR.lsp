
(SDEFUN |NORMRETR;normFactors;ExtPL;1| ((|p| |ExtP|) ($ |List| |ExtP|))
        (SPROG
         ((|facs| (|List| |ExtP|)) (#1=#:G710 NIL) (#2=#:G711 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |facs| (LIST |p|) . #3=(|NORMRETR;normFactors;ExtPL;1|))
                (SEQ (LETT |i| 1 . #3#) (LETT #2# (- (QREFELT $ 10) 1) . #3#)
                     G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL
                          (LETT |p| (SPADCALL |p| (QREFELT $ 11)) . #3#) |facs|
                          (QREFELT $ 14))
                         (PROGN (LETT #1# |facs| . #3#) (GO #4=#:G709)))
                        ('T (LETT |facs| (CONS |p| |facs|) . #3#)))))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |facs|)))
          #4# (EXIT #1#)))) 

(SDEFUN |NORMRETR;Frobenius;2ExtP;2| ((|ff| |ExtP|) ($ |ExtP|))
        (SPROG ((|fft| (|ExtP|)))
               (SEQ
                (LETT |fft| (|spadConstant| $ 16)
                      . #1=(|NORMRETR;Frobenius;2ExtP;2|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |ff| (|spadConstant| $ 16) (QREFELT $ 17)))
                       (GO G191)))
                     (SEQ
                      (LETT |fft|
                            (SPADCALL |fft|
                                      (SPADCALL
                                       (SPADCALL (ELT $ 18)
                                                 (SPADCALL |ff| (QREFELT $ 19))
                                                 (QREFELT $ 21))
                                       (SPADCALL |ff| (QREFELT $ 23))
                                       (QREFELT $ 24))
                                      (QREFELT $ 25))
                            . #1#)
                      (EXIT (LETT |ff| (SPADCALL |ff| (QREFELT $ 26)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |fft|)))) 

(SDEFUN |NORMRETR;retractIfCan;ExtPU;3|
        ((|ff| |ExtP|)
         ($ |Union|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
          "failed"))
        (SPROG
         ((|fft|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|lc| (|SUEx|)) (|plc| (|SparseUnivariatePolynomial| F))
          (#1=#:G734 NIL) (|retlc| (|Union| F "failed")) (|lclc| (|ExtF|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fft| (|spadConstant| $ 28)
                  . #2=(|NORMRETR;retractIfCan;ExtPU;3|))
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |ff| (|spadConstant| $ 16) (QREFELT $ 17)))
                   (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |ff| (QREFELT $ 19)) . #2#)
                      (LETT |plc| (|spadConstant| $ 30) . #2#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL |lc| (|spadConstant| $ 31)
                                        (QREFELT $ 32)))
                             (GO G191)))
                           (SEQ
                            (LETT |lclc| (SPADCALL |lc| (QREFELT $ 33)) . #2#)
                            (LETT |retlc| (SPADCALL |lclc| (QREFELT $ 35))
                                  . #2#)
                            (EXIT
                             (COND
                              ((QEQCAR |retlc| 1)
                               (PROGN
                                (LETT #1# (CONS 1 "failed") . #2#)
                                (GO #3=#:G733)))
                              ('T
                               (SEQ
                                (LETT |plc|
                                      (SPADCALL |plc|
                                                (SPADCALL (QCDR |retlc|)
                                                          (SPADCALL |lc|
                                                                    (QREFELT $
                                                                             36))
                                                          (QREFELT $ 37))
                                                (QREFELT $ 38))
                                      . #2#)
                                (EXIT
                                 (LETT |lc| (SPADCALL |lc| (QREFELT $ 39))
                                       . #2#)))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |fft|
                            (SPADCALL |fft|
                                      (SPADCALL |plc|
                                                (SPADCALL |ff| (QREFELT $ 23))
                                                (QREFELT $ 40))
                                      (QREFELT $ 41))
                            . #2#)
                      (EXIT (LETT |ff| (SPADCALL |ff| (QREFELT $ 26)) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |fft|))))
          #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |NormRetractPackage;|)) 

(DEFUN |NormRetractPackage| (&REST #1=#:G735)
  (SPROG NIL
         (PROG (#2=#:G736)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|NormRetractPackage|)
                                               '|domainEqualList|)
                    . #3=(|NormRetractPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |NormRetractPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|NormRetractPackage|)))))))))) 

(DEFUN |NormRetractPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|NormRetractPackage|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|NormRetractPackage| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 44) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|NormRetractPackage|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|NormRetractPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              |NORMRETR;Frobenius;2ExtP;2| (|Boolean|) (|List| 9)
              (0 . |member?|) |NORMRETR;normFactors;ExtPL;1| (6 . |Zero|)
              (10 . ~=) (16 . |Frobenius|) (21 . |leadingCoefficient|)
              (|Mapping| 7 7) (26 . |map|) (|NonNegativeInteger|)
              (32 . |degree|) (37 . |monomial|) (43 . +) (49 . |reductum|)
              (|SparseUnivariatePolynomial| 29) (54 . |Zero|)
              (|SparseUnivariatePolynomial| 6) (58 . |Zero|) (62 . |Zero|)
              (66 . ~=) (72 . |leadingCoefficient|) (|Union| 6 '"failed")
              (77 . |retractIfCan|) (82 . |degree|) (87 . |monomial|) (93 . +)
              (99 . |reductum|) (104 . |monomial|) (110 . +)
              (|Union| 27 '"failed") |NORMRETR;retractIfCan;ExtPU;3|)
           '#(|retractIfCan| 116 |normFactors| 121 |Frobenius| 126) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 43
                                                 '(2 13 12 9 0 14 0 9 0 16 2 9
                                                   12 0 0 17 1 7 0 0 18 1 9 8 0
                                                   19 2 8 0 20 0 21 1 9 22 0 23
                                                   2 9 0 8 22 24 2 9 0 0 0 25 1
                                                   9 0 0 26 0 27 0 28 0 29 0 30
                                                   0 8 0 31 2 8 12 0 0 32 1 8 7
                                                   0 33 1 7 34 0 35 1 8 22 0 36
                                                   2 29 0 6 22 37 2 29 0 0 0 38
                                                   1 8 0 0 39 2 27 0 29 22 40 2
                                                   27 0 0 0 41 1 0 42 9 43 1 0
                                                   13 9 15 1 0 9 9 11)))))
           '|lookupComplete|)) 
