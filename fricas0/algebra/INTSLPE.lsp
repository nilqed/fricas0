
(SDEFUN |INTSLPE;solveLinearPolynomialEquation;LSupU;1|
        ((|lp| |List| (|SparseUnivariatePolynomial| (|Integer|)))
         (|p| |SparseUnivariatePolynomial| (|Integer|))
         ($ |Union| (|List| (|SparseUnivariatePolynomial| (|Integer|)))
          "failed"))
        (SPROG
         ((|answer|
           (|Union| (|List| (|SparseUnivariatePolynomial| (|Integer|)))
                    "failed"))
          (#1=#:G709 NIL)
          (|ans|
           (|Union|
            (|Vector| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
            #2="failed"))
          (|deg| #3=(|NonNegativeInteger|)) (#4=#:G706 NIL) (#5=#:G705 #3#)
          (#6=#:G707 #3#) (#7=#:G717 NIL) (|u| NIL))
         (SEQ
          (COND
           ((SPADCALL (QREFELT $ 6) |lp| (QREFELT $ 11))
            (SEQ
             (LETT |deg|
                   (PROGN
                    (LETT #4# NIL
                          . #8=(|INTSLPE;solveLinearPolynomialEquation;LSupU;1|))
                    (SEQ (LETT |u| NIL . #8#) (LETT #7# |lp| . #8#) G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |u| (CAR #7#) . #8#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #6# (SPADCALL |u| (QREFELT $ 14)) . #8#)
                            (COND (#4# (LETT #5# (+ #5# #6#) . #8#))
                                  ('T
                                   (PROGN
                                    (LETT #5# #6# . #8#)
                                    (LETT #4# 'T . #8#)))))))
                         (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
                    (COND (#4# #5#) ('T 0)))
                   . #8#)
             (LETT |ans| (CONS 1 "failed") . #8#) (SETELT $ 7 2147483647)
             (SEQ G190 (COND ((NULL (QEQCAR |ans| 1)) (GO G191)))
                  (SEQ
                   (LETT |ans|
                         (SPADCALL |deg| (QREFELT $ 7) |lp| (QREFELT $ 18))
                         . #8#)
                   (EXIT
                    (COND
                     ((QEQCAR |ans| 1)
                      (SETELT $ 7 (SPADCALL (QREFELT $ 7) (QREFELT $ 20)))))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT
              (SETELT $ 8
                      (PROG2 (LETT #1# |ans| . #8#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0)
                                        (|Vector|
                                         (|List|
                                          (|SparseUnivariatePolynomial|
                                           (|Integer|))))
                                        (|Union|
                                         (|Vector|
                                          (|List|
                                           (|SparseUnivariatePolynomial|
                                            (|Integer|))))
                                         #2#)
                                        #1#)))))))
          (LETT |answer|
                (SPADCALL |p| (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 23))
                . #8#)
          (EXIT |answer|)))) 

(DECLAIM (NOTINLINE |IntegerSolveLinearPolynomialEquation;|)) 

(DEFUN |IntegerSolveLinearPolynomialEquation| ()
  (SPROG NIL
         (PROG (#1=#:G719)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|IntegerSolveLinearPolynomialEquation|)
                    . #2=(|IntegerSolveLinearPolynomialEquation|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|IntegerSolveLinearPolynomialEquation|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|IntegerSolveLinearPolynomialEquation;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|IntegerSolveLinearPolynomialEquation|)))))))))) 

(DEFUN |IntegerSolveLinearPolynomialEquation;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|IntegerSolveLinearPolynomialEquation|)
                . #1=(|IntegerSolveLinearPolynomialEquation|))
          (LETT $ (GETREFV 25) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|IntegerSolveLinearPolynomialEquation| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 NIL)
          (QSETREFV $ 7 2)
          (QSETREFV $ 8 (MAKE-ARRAY 0))
          $))) 

(MAKEPROP '|IntegerSolveLinearPolynomialEquation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|oldlp| '|slpePrime| '|oldtable|
              (|Boolean|) (|List| 13) (0 . ~=) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 16) (6 . |degree|)
              (|Union| 22 '"failed") (|Integer|) (|GenExEuclid| 16 13)
              (11 . |tablePow|) (|IntegerPrimesPackage| 16) (18 . |prevPrime|)
              (|Union| 10 '"failed") (|Vector| 10) (23 . |solveid|)
              |INTSLPE;solveLinearPolynomialEquation;LSupU;1|)
           '#(|solveLinearPolynomialEquation| 30) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 24
                                                 '(2 10 9 0 0 11 1 13 12 0 14 3
                                                   17 15 12 16 10 18 1 19 16 16
                                                   20 3 17 21 13 16 22 23 2 0
                                                   21 10 13 24)))))
           '|lookupComplete|)) 

(MAKEPROP '|IntegerSolveLinearPolynomialEquation| 'NILADIC T) 
