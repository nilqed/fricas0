
(SDEFUN |ODECONST;constDsolve;LFSR;1|
        ((|op| (L)) (|g| (F)) (|x| (|Symbol|))
         (% (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))))
        (SPROG ((#1=#:G7 NIL) (|b| (|List| F)))
               (SEQ
                (LETT |b|
                      (|ODECONST;homoBasis| |op| (SPADCALL |x| (QREFELT % 10))
                       %))
                (EXIT
                 (CONS
                  (PROG2
                      (LETT #1#
                            (SPADCALL |op| |g| |b|
                                      (CONS #'|ODECONST;constDsolve;LFSR;1!0|
                                            (VECTOR % |x|))
                                      (QREFELT % 17)))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                    (|Union| (QREFELT % 7) "failed") #1#))
                  |b|))))) 

(SDEFUN |ODECONST;constDsolve;LFSR;1!0| ((|f1| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| |x| (QREFELT % 12)))))) 

(SDEFUN |ODECONST;homoBasis| ((|op| (L)) (|x| (F)) (% (|List| F)))
        (SPROG
         ((|b| (|List| F)) (#1=#:G20 NIL) (|ff| NIL)
          (|fp| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |p| (|spadConstant| % 21))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |op| (|spadConstant| % 23) (QREFELT % 25)))
                     (GO G191)))
                   (SEQ
                    (LETT |p|
                          (SPADCALL |p|
                                    (SPADCALL (SPADCALL |op| (QREFELT % 26))
                                              (SPADCALL |op| (QREFELT % 28))
                                              (QREFELT % 29))
                                    (QREFELT % 30)))
                    (EXIT (LETT |op| (SPADCALL |op| (QREFELT % 31)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |b| NIL) (LETT |fp| (SPADCALL |p| (QREFELT % 34)))
              (SEQ (LETT |ff| NIL) (LETT #1# (SPADCALL |fp| (QREFELT % 38)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ff| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |b|
                           (SPADCALL |b|
                                     (|ODECONST;basisSol| (QVELT |ff| 1)
                                      (- (QVELT |ff| 2) 1) |x| %)
                                     (QREFELT % 39)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |b|)))) 

(SDEFUN |ODECONST;basisSol|
        ((|p| (|SparseUnivariatePolynomial| F)) (|n| (|Integer|)) (|x| (F))
         (% (|List| F)))
        (SPROG
         ((|xn| (F)) (|l| (|List| F)) (#1=#:G33 NIL) (|f| NIL) (#2=#:G32 NIL)
          (#3=#:G31 NIL) (|i| NIL) (|ll| (|List| F)))
         (SEQ (LETT |l| (|ODECONST;basisSqfr| |p| |x| %))
              (EXIT
               (COND ((ZEROP |n|) |l|)
                     ('T
                      (SEQ (LETT |ll| (SPADCALL |l| (QREFELT % 40)))
                           (LETT |xn| |x|)
                           (SEQ (LETT |i| 1) (LETT #3# |n|) G190
                                (COND ((|greater_SI| |i| #3#) (GO G191)))
                                (SEQ
                                 (LETT |l|
                                       (SPADCALL |l|
                                                 (PROGN
                                                  (LETT #2# NIL)
                                                  (SEQ (LETT |f| NIL)
                                                       (LETT #1# |ll|) G190
                                                       (COND
                                                        ((OR (ATOM #1#)
                                                             (PROGN
                                                              (LETT |f|
                                                                    (CAR #1#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #2#
                                                               (CONS
                                                                (SPADCALL |xn|
                                                                          |f|
                                                                          (QREFELT
                                                                           %
                                                                           41))
                                                                #2#))))
                                                       (LETT #1# (CDR #1#))
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #2#))))
                                                 (QREFELT % 39)))
                                 (EXIT
                                  (LETT |xn|
                                        (SPADCALL |x| |xn| (QREFELT % 41)))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |l|)))))))) 

(SDEFUN |ODECONST;basisSqfr|
        ((|p| (|SparseUnivariatePolynomial| F)) (|x| (F)) (% (|List| F)))
        (SPROG
         ((#1=#:G39 NIL) (|a| NIL) (#2=#:G38 NIL) (|d| (|NonNegativeInteger|)))
         (SEQ (LETT |d| (SPADCALL |p| (QREFELT % 42)))
              (EXIT
               (COND
                ((EQL |d| 1)
                 (LIST
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |p| 0 (QREFELT % 45)) |x|
                               (QREFELT % 41))
                     (SPADCALL |p| (QREFELT % 46)) (QREFELT % 47))
                    (QREFELT % 48))
                   (QREFELT % 49))))
                ((EQL |d| 2) (|ODECONST;quadSol| |p| |x| %))
                ('T
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |a| NIL) (LETT #1# (SPADCALL |p| (QREFELT % 52)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |a| |x| (QREFELT % 41))
                                          (QREFELT % 49))
                                #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |ODECONST;quadSol|
        ((|p| (|SparseUnivariatePolynomial| F)) (|x| (F)) (% (|List| F)))
        (SPROG
         ((#1=#:G52 NIL) (#2=#:G51 NIL) (#3=#:G50 NIL) (|i| (F)) (|r| (F))
          (|y| (F)) (|u| (|Union| (|Integer|) "failed")) (|delta| (F))
          (|c| (F)) (|a| (F)) (|b| (F)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |u|
                   (SPADCALL
                    (LETT |delta|
                          (SPADCALL
                           (SPADCALL (LETT |b| (SPADCALL |p| 1 (QREFELT % 45)))
                                     2 (QREFELT % 54))
                           (SPADCALL
                            (SPADCALL 4
                                      (LETT |a| (SPADCALL |p| (QREFELT % 46)))
                                      (QREFELT % 55))
                            (LETT |c| (SPADCALL |p| 0 (QREFELT % 45)))
                            (QREFELT % 41))
                           (QREFELT % 56)))
                    (QREFELT % 59)))
             (EXIT
              (COND
               ((QEQCAR |u| 0)
                (COND
                 ((MINUSP (QCDR |u|))
                  (PROGN
                   (LETT #3#
                         (SEQ
                          (LETT |y|
                                (SPADCALL |x| (SPADCALL 2 |a| (QREFELT % 55))
                                          (QREFELT % 47)))
                          (LETT |r|
                                (SPADCALL (SPADCALL |b| |y| (QREFELT % 41))
                                          (QREFELT % 48)))
                          (LETT |i|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |delta| (QREFELT % 48))
                                            (QREFELT % 60))
                                  (QREFELT % 62))
                                 |y| (QREFELT % 41)))
                          (EXIT
                           (LIST
                            (SPADCALL (SPADCALL |r| (QREFELT % 49))
                                      (SPADCALL |i| (QREFELT % 63))
                                      (QREFELT % 41))
                            (SPADCALL (SPADCALL |r| (QREFELT % 49))
                                      (SPADCALL |i| (QREFELT % 64))
                                      (QREFELT % 41))))))
                   (GO #4=#:G48))))))))
            (EXIT
             (PROGN
              (LETT #2# NIL)
              (SEQ (LETT #1# (SPADCALL |p| (QREFELT % 65))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2#
                           (CONS
                            (SPADCALL (SPADCALL |a| |x| (QREFELT % 41))
                                      (QREFELT % 49))
                            #2#))))
                   (LETT #1# (CDR #1#)) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))
          #4# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |ConstantLODE;|)) 

(DEFUN |ConstantLODE;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|ConstantLODE| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 66))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ConstantLODE| (LIST DV$1 DV$2 DV$3)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ConstantLODE| (&REST #1=#:G53)
  (SPROG NIL
         (PROG (#2=#:G54)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ConstantLODE|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ConstantLODE;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ConstantLODE|)))))))))) 

(MAKEPROP '|ConstantLODE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (0 . |coerce|) (|ODEIntegration| 6 7)
              (5 . |int|) (|Union| 7 '"failed") (|List| 7) (|Mapping| 7 7)
              (|ODETools| 7 8) (11 . |particularSolution|)
              (|Record| (|:| |particular| 7) (|:| |basis| 14))
              |ODECONST;constDsolve;LFSR;1| (|SparseUnivariatePolynomial| 7)
              (19 . |Zero|) (23 . |Zero|) (27 . |Zero|) (|Boolean|) (31 . ~=)
              (37 . |leadingCoefficient|) (|NonNegativeInteger|)
              (42 . |degree|) (47 . |monomial|) (53 . +) (59 . |reductum|)
              (|Factored| 20) (|ExpressionFactorPolynomial| 6 7)
              (64 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 35) (|:| |factor| 20) (|:| |exponent| 27))
              (|List| 36) (69 . |factorList|) (74 . |concat!|) (80 . |copy|)
              (85 . *) (91 . |degree|) (96 . |One|) (100 . |One|)
              (104 . |coefficient|) (110 . |leadingCoefficient|) (115 . /)
              (121 . -) (126 . |exp|) (|List| %)
              (|SparseUnivariatePolynomial| %) (131 . |rootsOf|)
              (|PositiveInteger|) (136 . ^) (142 . *) (148 . -)
              (|Union| (|Integer|) '"failed") (|ElementaryFunctionSign| 6 7)
              (154 . |sign|) (159 . |sqrt|) (|AlgebraicManipulations| 6 7)
              (164 . |rootSimp|) (169 . |cos|) (174 . |sin|) (179 . |zerosOf|))
           '#(|constDsolve| 184) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|constDsolve|
                                 ((|Record| (|:| |particular| |#2|)
                                            (|:| |basis| (|List| |#2|)))
                                  |#3| |#2| (|Symbol|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 65
                                            '(1 7 0 9 10 2 11 7 7 9 12 4 16 13
                                              8 7 14 15 17 0 20 0 21 0 6 0 22 0
                                              8 0 23 2 8 24 0 0 25 1 8 7 0 26 1
                                              8 27 0 28 2 20 0 7 27 29 2 20 0 0
                                              0 30 1 8 0 0 31 1 33 32 20 34 1
                                              32 37 0 38 2 14 0 0 0 39 1 14 0 0
                                              40 2 7 0 0 0 41 1 20 27 0 42 0 6
                                              0 43 0 7 0 44 2 20 7 0 27 45 1 20
                                              7 0 46 2 7 0 0 0 47 1 7 0 0 48 1
                                              7 0 0 49 1 7 50 51 52 2 7 0 0 53
                                              54 2 7 0 53 0 55 2 7 0 0 0 56 1
                                              58 57 7 59 1 7 0 0 60 1 61 7 7 62
                                              1 7 0 0 63 1 7 0 0 64 1 7 50 51
                                              65 3 0 18 8 7 9 19)))))
           '|lookupComplete|)) 
