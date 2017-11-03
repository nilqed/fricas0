
(SDEFUN |IBPTOOLS;mapUnivariate;MSupR;1|
        ((|f| |Mapping| K L) (|poly| |SparseUnivariatePolynomial| L) ($ R))
        (SPROG ((|ans| (R)))
               (SEQ
                (LETT |ans| (|spadConstant| $ 10)
                      . #1=(|IBPTOOLS;mapUnivariate;MSupR;1|))
                (SEQ G190
                     (COND
                      ((NULL (NULL (SPADCALL |poly| (QREFELT $ 13))))
                       (GO G191)))
                     (SEQ
                      (LETT |ans|
                            (SPADCALL |ans|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |poly| (QREFELT $ 14)) |f|)
                                       (SPADCALL |poly| (QREFELT $ 16))
                                       (QREFELT $ 17))
                                      (QREFELT $ 18))
                            . #1#)
                      (EXIT
                       (LETT |poly| (SPADCALL |poly| (QREFELT $ 19)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))) 

(SDEFUN |IBPTOOLS;mapUnivariate;MRSup;2|
        ((|f| |Mapping| L K) (|poly| R) ($ |SparseUnivariatePolynomial| L))
        (SPROG ((|ans| (|SparseUnivariatePolynomial| L)))
               (SEQ
                (LETT |ans| (|spadConstant| $ 22)
                      . #1=(|IBPTOOLS;mapUnivariate;MRSup;2|))
                (SEQ G190
                     (COND
                      ((NULL (NULL (SPADCALL |poly| (QREFELT $ 23))))
                       (GO G191)))
                     (SEQ
                      (LETT |ans|
                            (SPADCALL |ans|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |poly| (QREFELT $ 24)) |f|)
                                       (SPADCALL |poly| (QREFELT $ 25))
                                       (QREFELT $ 26))
                                      (QREFELT $ 27))
                            . #1#)
                      (EXIT
                       (LETT |poly| (SPADCALL |poly| (QREFELT $ 28)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))) 

(SDEFUN |IBPTOOLS;mapUnivariateIfCan;MSupU;3|
        ((|f| |Mapping| #1=(|Union| K "failed") L)
         (|poly| |SparseUnivariatePolynomial| L) ($ |Union| R "failed"))
        (SPROG ((|ans| (R)) (#2=#:G730 NIL) (|lc| #1#))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |ans| (|spadConstant| $ 10)
                        . #3=(|IBPTOOLS;mapUnivariateIfCan;MSupU;3|))
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |poly| (QREFELT $ 13))))
                         (GO G191)))
                       (SEQ
                        (LETT |lc|
                              (SPADCALL (SPADCALL |poly| (QREFELT $ 14)) |f|)
                              . #3#)
                        (EXIT
                         (COND
                          ((QEQCAR |lc| 1)
                           (PROGN
                            (LETT #2# (CONS 1 "failed") . #3#)
                            (GO #4=#:G729)))
                          ('T
                           (SEQ
                            (LETT |ans|
                                  (SPADCALL |ans|
                                            (SPADCALL (QCDR |lc|)
                                                      (SPADCALL |poly|
                                                                (QREFELT $ 16))
                                                      (QREFELT $ 17))
                                            (QREFELT $ 18))
                                  . #3#)
                            (EXIT
                             (LETT |poly| (SPADCALL |poly| (QREFELT $ 19))
                                   . #3#)))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 |ans|))))
                #4# (EXIT #2#)))) 

(SDEFUN |IBPTOOLS;mapMatrixIfCan;MMU;4|
        ((|f| |Mapping| (|Union| K "failed") L)
         (|mat| |Matrix| (|SparseUnivariatePolynomial| L))
         ($ |Union| (|Matrix| R) "failed"))
        (SPROG
         ((#1=#:G752 NIL) (|poly| (|Union| R "failed")) (#2=#:G754 NIL)
          (|j| NIL) (#3=#:G753 NIL) (|i| NIL) (|matOut| (|Matrix| R))
          (|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |m| (ANROWS |mat|) . #4=(|IBPTOOLS;mapMatrixIfCan;MMU;4|))
            (LETT |n| (ANCOLS |mat|) . #4#)
            (LETT |matOut| (MAKE_MATRIX1 |m| |n| (|spadConstant| $ 10)) . #4#)
            (SEQ (LETT |i| 1 . #4#) (LETT #3# |m| . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1 . #4#) (LETT #2# |n| . #4#) G190
                        (COND ((|greater_SI| |j| #2#) (GO G191)))
                        (SEQ
                         (LETT |poly|
                               (SPADCALL |f| (QAREF2O |mat| |i| |j| 1 1)
                                         (QREFELT $ 34))
                               . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |poly| 1)
                            (PROGN
                             (LETT #1# (CONS 1 "failed") . #4#)
                             (GO #5=#:G751)))
                           ('T
                            (QSETAREF2O |matOut| |i| |j| (QCDR |poly|) 1 1)))))
                        (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |matOut|))))
          #5# (EXIT #1#)))) 

(SDEFUN |IBPTOOLS;mapBivariate;MUPSup;5|
        ((|f| |Mapping| L K) (|poly| UP)
         ($ |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| L)))
        (SPROG
         ((|ans|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| L))))
         (SEQ
          (LETT |ans| (|spadConstant| $ 40)
                . #1=(|IBPTOOLS;mapBivariate;MUPSup;5|))
          (SEQ G190
               (COND
                ((NULL (NULL (SPADCALL |poly| (QREFELT $ 41)))) (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL
                                 (SPADCALL |f| (SPADCALL |poly| (QREFELT $ 42))
                                           (QREFELT $ 30))
                                 (SPADCALL |poly| (QREFELT $ 43))
                                 (QREFELT $ 44))
                                (QREFELT $ 45))
                      . #1#)
                (EXIT (LETT |poly| (SPADCALL |poly| (QREFELT $ 46)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(DECLAIM (NOTINLINE |IntegralBasisPolynomialTools;|)) 

(DEFUN |IntegralBasisPolynomialTools| (&REST #1=#:G761)
  (SPROG NIL
         (PROG (#2=#:G762)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IntegralBasisPolynomialTools|)
                                               '|domainEqualList|)
                    . #3=(|IntegralBasisPolynomialTools|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |IntegralBasisPolynomialTools;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|IntegralBasisPolynomialTools|)))))))))) 

(DEFUN |IntegralBasisPolynomialTools;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegralBasisPolynomialTools|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|IntegralBasisPolynomialTools| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 48) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|IntegralBasisPolynomialTools|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|IntegralBasisPolynomialTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |Zero|) (|Boolean|)
              (|SparseUnivariatePolynomial| 9) (4 . |zero?|)
              (9 . |leadingCoefficient|) (|NonNegativeInteger|) (14 . |degree|)
              (19 . |monomial|) (25 . +) (31 . |reductum|) (|Mapping| 6 9)
              |IBPTOOLS;mapUnivariate;MSupR;1| (36 . |Zero|) (40 . |zero?|)
              (45 . |leadingCoefficient|) (50 . |degree|) (55 . |monomial|)
              (61 . +) (67 . |reductum|) (|Mapping| 9 6)
              |IBPTOOLS;mapUnivariate;MRSup;2| (|Union| 7 '"failed")
              (|Union| 6 '"failed") (|Mapping| 32 9)
              |IBPTOOLS;mapUnivariateIfCan;MSupU;3| (72 . |Zero|)
              (|Union| (|Matrix| 7) '"failed") (|Matrix| 12)
              |IBPTOOLS;mapMatrixIfCan;MMU;4| (|SparseUnivariatePolynomial| 12)
              (76 . |Zero|) (80 . |zero?|) (85 . |leadingCoefficient|)
              (90 . |degree|) (95 . |monomial|) (101 . +) (107 . |reductum|)
              |IBPTOOLS;mapBivariate;MUPSup;5|)
           '#(|mapUnivariateIfCan| 112 |mapUnivariate| 118 |mapMatrixIfCan| 130
              |mapBivariate| 136)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 47
                                                 '(0 7 0 10 1 12 11 0 13 1 12 9
                                                   0 14 1 12 15 0 16 2 7 0 6 15
                                                   17 2 7 0 0 0 18 1 12 0 0 19
                                                   0 12 0 22 1 7 11 0 23 1 7 6
                                                   0 24 1 7 15 0 25 2 12 0 9 15
                                                   26 2 12 0 0 0 27 1 7 0 0 28
                                                   0 6 0 35 0 39 0 40 1 8 11 0
                                                   41 1 8 7 0 42 1 8 15 0 43 2
                                                   39 0 12 15 44 2 39 0 0 0 45
                                                   1 8 0 0 46 2 0 31 33 12 34 2
                                                   0 12 29 7 30 2 0 7 20 12 21
                                                   2 0 36 33 37 38 2 0 39 29 8
                                                   47)))))
           '|lookupComplete|)) 
