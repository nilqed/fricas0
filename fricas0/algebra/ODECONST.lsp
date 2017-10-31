
(SDEFUN |ODECONST;constDsolve;LFSR;1|
        ((|op| L) (|g| F) (|x| |Symbol|)
         ($ |Record| (|:| |particular| F) (|:| |basis| (|List| F))))
        (SPROG ((#1=#:G703 NIL) (|b| (|List| F)))
               (SEQ
                (LETT |b|
                      (|ODECONST;homoBasis| |op| (SPADCALL |x| (QREFELT $ 10))
                       $)
                      . #2=(|ODECONST;constDsolve;LFSR;1|))
                (EXIT
                 (CONS
                  (PROG2
                      (LETT #1#
                            (SPADCALL |op| |g| |b|
                                      (CONS #'|ODECONST;constDsolve;LFSR;1!0|
                                            (VECTOR $ |x|))
                                      (QREFELT $ 17))
                            . #2#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                    (|Union| (QREFELT $ 7) "failed") #1#))
                  |b|))))) 

(SDEFUN |ODECONST;constDsolve;LFSR;1!0| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|ODECONST;constDsolve;LFSR;1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| |x| (QREFELT $ 12)))))) 

(SDEFUN |ODECONST;homoBasis| ((|op| L) (|x| F) ($ |List| F))
        (SPROG
         ((|b| (|List| F)) (#1=#:G730 NIL) (|ff| NIL)
          (|fp| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |p| (|spadConstant| $ 21) . #2=(|ODECONST;homoBasis|))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |op| (|spadConstant| $ 24) (QREFELT $ 26)))
                     (GO G191)))
                   (SEQ
                    (LETT |p|
                          (SPADCALL |p|
                                    (SPADCALL (SPADCALL |op| (QREFELT $ 27))
                                              (SPADCALL |op| (QREFELT $ 29))
                                              (QREFELT $ 30))
                                    (QREFELT $ 31))
                          . #2#)
                    (EXIT (LETT |op| (SPADCALL |op| (QREFELT $ 32)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |b| NIL . #2#)
              (LETT |fp| (SPADCALL |p| (QREFELT $ 35)) . #2#)
              (SEQ (LETT |ff| NIL . #2#)
                   (LETT #1# (SPADCALL |fp| (QREFELT $ 38)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ff| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |b|
                           (SPADCALL |b|
                                     (|ODECONST;basisSol| (QCAR |ff|)
                                      (- (QCDR |ff|) 1) |x| $)
                                     (QREFELT $ 39))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |b|)))) 

(SDEFUN |ODECONST;basisSol|
        ((|p| |SparseUnivariatePolynomial| F) (|n| |Integer|) (|x| F)
         ($ |List| F))
        (SPROG
         ((|xn| (F)) (|l| (|List| F)) (#1=#:G740 NIL) (|f| NIL) (#2=#:G739 NIL)
          (#3=#:G738 NIL) (|i| NIL) (|ll| (|List| F)))
         (SEQ
          (LETT |l| (|ODECONST;basisSqfr| |p| |x| $)
                . #4=(|ODECONST;basisSol|))
          (EXIT
           (COND ((ZEROP |n|) |l|)
                 ('T
                  (SEQ (LETT |ll| (SPADCALL |l| (QREFELT $ 40)) . #4#)
                       (LETT |xn| |x| . #4#)
                       (SEQ (LETT |i| 1 . #4#) (LETT #3# |n| . #4#) G190
                            (COND ((|greater_SI| |i| #3#) (GO G191)))
                            (SEQ
                             (LETT |l|
                                   (SPADCALL |l|
                                             (PROGN
                                              (LETT #2# NIL . #4#)
                                              (SEQ (LETT |f| NIL . #4#)
                                                   (LETT #1# |ll| . #4#) G190
                                                   (COND
                                                    ((OR (ATOM #1#)
                                                         (PROGN
                                                          (LETT |f| (CAR #1#)
                                                                . #4#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #2#
                                                           (CONS
                                                            (SPADCALL |xn| |f|
                                                                      (QREFELT
                                                                       $ 41))
                                                            #2#)
                                                           . #4#)))
                                                   (LETT #1# (CDR #1#) . #4#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #2#))))
                                             (QREFELT $ 39))
                                   . #4#)
                             (EXIT
                              (LETT |xn| (SPADCALL |x| |xn| (QREFELT $ 41))
                                    . #4#)))
                            (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |l|)))))))) 

(SDEFUN |ODECONST;basisSqfr|
        ((|p| |SparseUnivariatePolynomial| F) (|x| F) ($ |List| F))
        (SPROG
         ((#1=#:G745 NIL) (|a| NIL) (#2=#:G744 NIL)
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |d| (SPADCALL |p| (QREFELT $ 42)) . #3=(|ODECONST;basisSqfr|))
          (EXIT
           (COND
            ((EQL |d| 1)
             (LIST
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| 0 (QREFELT $ 45)) |x| (QREFELT $ 41))
                 (SPADCALL |p| (QREFELT $ 46)) (QREFELT $ 47))
                (QREFELT $ 48))
               (QREFELT $ 49))))
            ((EQL |d| 2) (|ODECONST;quadSol| |p| |x| $))
            ('T
             (PROGN
              (LETT #2# NIL . #3#)
              (SEQ (LETT |a| NIL . #3#)
                   (LETT #1# (SPADCALL |p| (QREFELT $ 52)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2#
                           (CONS
                            (SPADCALL (SPADCALL |a| |x| (QREFELT $ 41))
                                      (QREFELT $ 49))
                            #2#)
                           . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |ODECONST;quadSol|
        ((|p| |SparseUnivariatePolynomial| F) (|x| F) ($ |List| F))
        (SPROG
         ((#1=#:G757 NIL) (|a| (F)) (#2=#:G756 NIL) (#3=#:G755 NIL) (|i| (F))
          (|r| (F)) (|y| (F)) (|u| (|Union| (|Integer|) "failed"))
          (|delta| (F)) (|c| (F)) (|b| (F)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |u|
                   (SPADCALL
                    (LETT |delta|
                          (SPADCALL
                           (SPADCALL
                            (LETT |b| (SPADCALL |p| 1 (QREFELT $ 45))
                                  . #4=(|ODECONST;quadSol|))
                            2 (QREFELT $ 54))
                           (SPADCALL
                            (SPADCALL 4
                                      (LETT |a| (SPADCALL |p| (QREFELT $ 46))
                                            . #4#)
                                      (QREFELT $ 55))
                            (LETT |c| (SPADCALL |p| 0 (QREFELT $ 45)) . #4#)
                            (QREFELT $ 41))
                           (QREFELT $ 56))
                          . #4#)
                    (QREFELT $ 59))
                   . #4#)
             (EXIT
              (COND
               ((QEQCAR |u| 0)
                (COND
                 ((MINUSP (QCDR |u|))
                  (PROGN
                   (LETT #3#
                         (SEQ
                          (LETT |y|
                                (SPADCALL |x| (SPADCALL 2 |a| (QREFELT $ 55))
                                          (QREFELT $ 47))
                                . #4#)
                          (LETT |r|
                                (SPADCALL (SPADCALL |b| |y| (QREFELT $ 41))
                                          (QREFELT $ 48))
                                . #4#)
                          (LETT |i|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |delta| (QREFELT $ 48))
                                            (QREFELT $ 60))
                                  (QREFELT $ 62))
                                 |y| (QREFELT $ 41))
                                . #4#)
                          (EXIT
                           (LIST
                            (SPADCALL (SPADCALL |r| (QREFELT $ 49))
                                      (SPADCALL |i| (QREFELT $ 63))
                                      (QREFELT $ 41))
                            (SPADCALL (SPADCALL |r| (QREFELT $ 49))
                                      (SPADCALL |i| (QREFELT $ 64))
                                      (QREFELT $ 41)))))
                         . #4#)
                   (GO #5=#:G753))))))))
            (EXIT
             (PROGN
              (LETT #2# NIL . #4#)
              (SEQ (LETT |a| NIL . #4#)
                   (LETT #1# (SPADCALL |p| (QREFELT $ 65)) . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2#
                           (CONS
                            (SPADCALL (SPADCALL |a| |x| (QREFELT $ 41))
                                      (QREFELT $ 49))
                            #2#)
                           . #4#)))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))
          #5# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |ConstantLODE;|)) 

(DEFUN |ConstantLODE| (&REST #1=#:G758)
  (SPROG NIL
         (PROG (#2=#:G759)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ConstantLODE|)
                                               '|domainEqualList|)
                    . #3=(|ConstantLODE|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ConstantLODE;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ConstantLODE|)))))))))) 

(DEFUN |ConstantLODE;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ConstantLODE|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|ConstantLODE| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 66) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ConstantLODE| (LIST DV$1 DV$2 DV$3)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ConstantLODE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (0 . |coerce|) (|ODEIntegration| 6 7)
              (5 . |int|) (|Union| 7 '"failed") (|List| 7) (|Mapping| 7 7)
              (|ODETools| 7 8) (11 . |particularSolution|)
              (|Record| (|:| |particular| 7) (|:| |basis| 14))
              |ODECONST;constDsolve;LFSR;1| (|SparseUnivariatePolynomial| 7)
              (19 . |Zero|) (23 . |Zero|) (27 . |Zero|) (31 . |Zero|)
              (|Boolean|) (35 . ~=) (41 . |leadingCoefficient|)
              (|NonNegativeInteger|) (46 . |degree|) (51 . |monomial|) (57 . +)
              (63 . |reductum|) (|Factored| 20)
              (|ExpressionFactorPolynomial| 6 7) (68 . |factorPolynomial|)
              (|Record| (|:| |factor| 20) (|:| |exponent| (|Integer|)))
              (|List| 36) (73 . |factors|) (78 . |concat!|) (84 . |copy|)
              (89 . *) (95 . |degree|) (100 . |One|) (104 . |One|)
              (108 . |coefficient|) (114 . |leadingCoefficient|) (119 . /)
              (125 . -) (130 . |exp|) (|List| $)
              (|SparseUnivariatePolynomial| $) (135 . |rootsOf|)
              (|PositiveInteger|) (140 . ^) (146 . *) (152 . -)
              (|Union| (|Integer|) '"failed") (|ElementaryFunctionSign| 6 7)
              (158 . |sign|) (163 . |sqrt|) (|AlgebraicManipulations| 6 7)
              (168 . |rootSimp|) (173 . |cos|) (178 . |sin|) (183 . |zerosOf|))
           '#(|constDsolve| 188) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(1 7 0 9 10 2 11 7 7 9 12 4
                                                   16 13 8 7 14 15 17 0 20 0 21
                                                   0 6 0 22 0 7 0 23 0 8 0 24 2
                                                   8 25 0 0 26 1 8 7 0 27 1 8
                                                   28 0 29 2 20 0 7 28 30 2 20
                                                   0 0 0 31 1 8 0 0 32 1 34 33
                                                   20 35 1 33 37 0 38 2 14 0 0
                                                   0 39 1 14 0 0 40 2 7 0 0 0
                                                   41 1 20 28 0 42 0 6 0 43 0 7
                                                   0 44 2 20 7 0 28 45 1 20 7 0
                                                   46 2 7 0 0 0 47 1 7 0 0 48 1
                                                   7 0 0 49 1 7 50 51 52 2 7 0
                                                   0 53 54 2 7 0 53 0 55 2 7 0
                                                   0 0 56 1 58 57 7 59 1 7 0 0
                                                   60 1 61 7 7 62 1 7 0 0 63 1
                                                   7 0 0 64 1 7 50 51 65 3 0 18
                                                   8 7 9 19)))))
           '|lookupComplete|)) 
