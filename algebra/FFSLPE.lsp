
(SDEFUN |FFSLPE;solveLinearPolynomialEquation;LFPPU;1|
        ((|lp| |List| FPP) (|p| FPP) ($ |Union| (|List| FPP) "failed"))
        (SPROG
         ((|answer| (|Union| (|List| FPP) "failed")) (#1=#:G712 NIL)
          (#2=#:G715 NIL) (|ans| (|Union| (|Vector| (|List| FPP)) #3="failed"))
          (|deg| #4=(|NonNegativeInteger|)) (#5=#:G709 NIL) (#6=#:G708 #4#)
          (#7=#:G710 #4#) (#8=#:G727 NIL) (|u| NIL))
         (SEQ
          (COND
           ((SPADCALL (QREFELT $ 9) |lp| (QREFELT $ 18))
            (SEQ
             (LETT |deg|
                   (PROGN
                    (LETT #5# NIL
                          . #9=(|FFSLPE;solveLinearPolynomialEquation;LFPPU;1|))
                    (SEQ (LETT |u| NIL . #9#) (LETT #8# |lp| . #9#) G190
                         (COND
                          ((OR (ATOM #8#)
                               (PROGN (LETT |u| (CAR #8#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #7# (SPADCALL |u| (QREFELT $ 19)) . #9#)
                            (COND (#5# (LETT #6# (+ #6# #7#) . #9#))
                                  ('T
                                   (PROGN
                                    (LETT #6# #7# . #9#)
                                    (LETT #5# 'T . #9#)))))))
                         (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
                    (COND (#5# #6#) ('T 0)))
                   . #9#)
             (LETT |ans| (CONS 1 "failed") . #9#)
             (SETELT $ 14
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 10) 1 (QREFELT $ 13))
                      (SPADCALL (|spadConstant| $ 10) 0 (QREFELT $ 13))
                      (QREFELT $ 20)))
             (SEQ G190 (COND ((NULL (QEQCAR |ans| 1)) (GO G191)))
                  (SEQ
                   (LETT |ans|
                         (SPADCALL |deg| (QREFELT $ 14) |lp| (QREFELT $ 23))
                         . #9#)
                   (EXIT
                    (COND
                     ((QEQCAR |ans| 1)
                      (SEQ
                       (SETELT $ 14
                               (PROG2
                                   (LETT #2#
                                         (SPADCALL (QREFELT $ 14)
                                                   (QREFELT $ 25))
                                         . #9#)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                                 (|Union| (QREFELT $ 7)
                                                          #10="failed")
                                                 #2#)))
                       (EXIT
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((SPADCALL
                                   (SPADCALL (QREFELT $ 14) (QREFELT $ 26)) 1
                                   (QREFELT $ 27))
                                  (NULL
                                   (SPADCALL (QREFELT $ 14) (QREFELT $ 29))))
                                 ('T NIL)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SETELT $ 14
                                       (PROG2
                                           (LETT #2#
                                                 (SPADCALL (QREFELT $ 14)
                                                           (QREFELT $ 25))
                                                 . #9#)
                                           (QCDR #2#)
                                         (|check_union2| (QEQCAR #2# 0)
                                                         (QREFELT $ 7)
                                                         (|Union| (QREFELT $ 7)
                                                                  #10#)
                                                         #2#)))))
                             NIL (GO G190) G191 (EXIT NIL))))))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT
              (SETELT $ 15
                      (PROG2 (LETT #1# |ans| . #9#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0)
                                        (|Vector| (|List| (QREFELT $ 8)))
                                        (|Union|
                                         (|Vector| (|List| (QREFELT $ 8))) #3#)
                                        #1#)))))))
          (LETT |answer|
                (SPADCALL |p| (QREFELT $ 14) (QREFELT $ 15) (QREFELT $ 32))
                . #9#)
          (EXIT |answer|)))) 

(DECLAIM (NOTINLINE |FiniteFieldSolveLinearPolynomialEquation;|)) 

(DEFUN |FiniteFieldSolveLinearPolynomialEquation| (&REST #1=#:G728)
  (SPROG NIL
         (PROG (#2=#:G729)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldSolveLinearPolynomialEquation|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldSolveLinearPolynomialEquation|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |FiniteFieldSolveLinearPolynomialEquation;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldSolveLinearPolynomialEquation|)))))))))) 

(DEFUN |FiniteFieldSolveLinearPolynomialEquation;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|FiniteFieldSolveLinearPolynomialEquation|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$|
                (LIST '|FiniteFieldSolveLinearPolynomialEquation| DV$1 DV$2
                      DV$3)
                . #1#)
          (LETT $ (GETREFV 34) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|FiniteFieldSolveLinearPolynomialEquation|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 NIL)
          (QSETREFV $ 14 (SPADCALL (|spadConstant| $ 10) 1 (QREFELT $ 13)))
          (QSETREFV $ 15 #())
          $))) 

(MAKEPROP '|FiniteFieldSolveLinearPolynomialEquation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|oldlp| (0 . |One|) (4 . |One|)
              (|NonNegativeInteger|) (8 . |monomial|) '|slpePrime| '|oldtable|
              (|Boolean|) (|List| 8) (14 . ~=) (20 . |degree|) (25 . +)
              (|Union| 31 '"failed") (|GenExEuclid| 7 8) (31 . |tablePow|)
              (|Union| $ '"failed") (38 . |nextItem|) (43 . |degree|) (48 . >)
              (|DistinctDegreeFactorize| 6 7) (54 . |irreducible?|)
              (|Union| 17 '"failed") (|Vector| 17) (59 . |solveid|)
              |FFSLPE;solveLinearPolynomialEquation;LFPPU;1|)
           '#(|solveLinearPolynomialEquation| 66) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 33
                                                 '(0 6 0 10 0 7 0 11 2 7 0 6 12
                                                   13 2 17 16 0 0 18 1 8 12 0
                                                   19 2 7 0 0 0 20 3 22 21 12 7
                                                   17 23 1 7 24 0 25 1 7 12 0
                                                   26 2 12 16 0 0 27 1 28 16 7
                                                   29 3 22 30 8 7 31 32 2 0 30
                                                   17 8 33)))))
           '|lookupComplete|)) 
