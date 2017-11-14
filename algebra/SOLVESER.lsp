
(SDEFUN |SOLVESER;unvectorise;VFIF;1|
        ((|vect| |Vector| (|Expression| R))
         (|var| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|n| |Integer|)
         ($ |Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
        (SPROG
         ((|polyvar|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (#1=#:G720 NIL)
          (|vecti|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (#2=#:G725 NIL) (|i| NIL) (Z (|Symbol|)))
         (SEQ
          (LETT Z (SPADCALL (QREFELT $ 8))
                . #3=(|SOLVESER;unvectorise;VFIF;1|))
          (LETT |polyvar| (|spadConstant| $ 10) . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (+ |n| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |vecti|
                      (SPADCALL (SPADCALL |vect| |i| (QREFELT $ 17))
                                (|SPADfirst|
                                 (SPADCALL (SPADCALL Z (QREFELT $ 18))
                                           (QREFELT $ 20)))
                                (QREFELT $ 23))
                      . #3#)
                (EXIT
                 (LETT |polyvar|
                       (SPADCALL |polyvar|
                                 (SPADCALL |vecti|
                                           (SPADCALL |var|
                                                     (PROG1
                                                         (LETT #1#
                                                               (+ (- |n| |i|)
                                                                  1)
                                                               . #3#)
                                                       (|check_subtype2|
                                                        (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                                     (QREFELT $ 24))
                                           (QREFELT $ 25))
                                 (QREFELT $ 26))
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |polyvar|)))) 

(SDEFUN |SOLVESER;decomposeFunc;4F;2|
        ((|exprf| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|exprg| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|newH| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         ($ |Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
        (SPROG
         ((|newF| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (#1=#:G735 NIL)
          (|newF2|
           (|Union| (|SparseUnivariatePolynomial| (|Expression| R)) "failed"))
          (|newF1|
           (|Union| (|SparseUnivariatePolynomial| (|Expression| R)) "failed"))
          (|m| (|Integer|)) (N (|Union| (|NonNegativeInteger|) "failed"))
          (|degG| #2=(|NonNegativeInteger|)) (|degF| #2#)
          (|g2| #3=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|g1| #4=(|SparseUnivariatePolynomial| (|Expression| R))) (|f2| #3#)
          (|f1| #4#) (X (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT X (SPADCALL (QREFELT $ 8))
                  . #5=(|SOLVESER;decomposeFunc;4F;2|))
            (LETT |f1| (SPADCALL |exprf| (QREFELT $ 29)) . #5#)
            (LETT |f2| (SPADCALL |exprf| (QREFELT $ 30)) . #5#)
            (LETT |g1| (SPADCALL |exprg| (QREFELT $ 29)) . #5#)
            (LETT |g2| (SPADCALL |exprg| (QREFELT $ 30)) . #5#)
            (LETT |degF|
                  (MAX
                   (SPADCALL (SPADCALL |exprf| (QREFELT $ 29)) (QREFELT $ 32))
                   (SPADCALL (SPADCALL |exprf| (QREFELT $ 30)) (QREFELT $ 32)))
                  . #5#)
            (LETT |degG|
                  (MAX (SPADCALL |g1| (QREFELT $ 32))
                       (SPADCALL |g2| (QREFELT $ 32)))
                  . #5#)
            (LETT N (SPADCALL |degF| |degG| (QREFELT $ 34)) . #5#)
            (EXIT
             (COND
              ((QEQCAR N 1) (PROGN (LETT #1# |exprf| . #5#) (GO #6=#:G734)))
              (#7='T
               (SEQ (LETT |m| (QCDR N) . #5#)
                    (LETT |newF1|
                          (|SOLVESER;subsSolve| |f1| |degF| |g1| |g2| |m|
                           |newH| $)
                          . #5#)
                    (COND
                     ((SPADCALL |f2| (|spadConstant| $ 35) (QREFELT $ 37))
                      (LETT |newF2| (CONS 0 (|spadConstant| $ 35)) . #5#))
                     (#7#
                      (LETT |newF2|
                            (|SOLVESER;subsSolve| |f2| |degF| |g1| |g2| |m|
                             |newH| $)
                            . #5#)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |newF1| 1) (QEQCAR |newF2| 1))
                       (PROGN (LETT #1# |exprf| . #5#) (GO #6#)))
                      ('T
                       (LETT |newF|
                             (SPADCALL (QCDR |newF1|) (QCDR |newF2|)
                                       (QREFELT $ 38))
                             . #5#))))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |SOLVESER;subsSolve|
        ((F |SparseUnivariatePolynomial| (|Expression| R))
         (|DegF| |NonNegativeInteger|)
         (G1 |SparseUnivariatePolynomial| (|Expression| R))
         (G2 |SparseUnivariatePolynomial| (|Expression| R)) (M |Integer|)
         (HH |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         ($ |Union| (|SparseUnivariatePolynomial| (|Expression| R)) "failed"))
        (SPROG
         ((|resul| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|solvevarlist| (|Vector| (|Expression| R))) (#1=#:G791 NIL)
          (#2=#:G796 NIL)
          (|solvar|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Expression| R)) #3="failed"))
            (|:| |basis| (|List| (|Vector| (|Expression| R))))))
          (|coeffma| (|Matrix| (|Expression| R)))
          (|vec| (|Vector| (|Expression| R)))
          (|coeffmat| (|Matrix| (|Expression| R))) (#4=#:G787 NIL)
          (#5=#:G797 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |coeffmat|
                  (MAKE_MATRIX1 (+ |DegF| 1) 1 (|spadConstant| $ 40))
                  . #6=(|SOLVESER;subsSolve|))
            (SEQ (LETT |i| 0 . #6#) (LETT #5# M . #6#) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |coeffmat|
                         (SPADCALL |coeffmat|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL G1
                                                (PROG1
                                                    (LETT #4# (- M |i|) . #6#)
                                                  (|check_subtype2| (>= #4# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #4#))
                                                (QREFELT $ 41))
                                      (SPADCALL G2 |i| (QREFELT $ 41))
                                      (QREFELT $ 42))
                                     (+ |DegF| 1) (QREFELT $ 43))
                                    (QREFELT $ 45))
                                   (QREFELT $ 46))
                         . #6#)))
                 (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
            (LETT |vec| (SPADCALL F (+ |DegF| 1) (QREFELT $ 43)) . #6#)
            (LETT |coeffma|
                  (SPADCALL |coeffmat| 1 (+ |DegF| 1) 2 (+ M 2) (QREFELT $ 47))
                  . #6#)
            (LETT |solvar| (SPADCALL |coeffma| |vec| (QREFELT $ 51)) . #6#)
            (EXIT
             (COND
              ((QEQCAR (QCAR |solvar|) 1)
               (PROGN (LETT #2# (CONS 1 "failed") . #6#) (GO #7=#:G795)))
              ('T
               (SEQ
                (LETT |solvevarlist|
                      (PROG2 (LETT #1# (QCAR |solvar|) . #6#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0)
                                        (|Vector| (|Expression| (QREFELT $ 6)))
                                        (|Union|
                                         (|Vector|
                                          (|Expression| (QREFELT $ 6)))
                                         #3#)
                                        #1#))
                      . #6#)
                (LETT |resul|
                      (SPADCALL (SPADCALL |solvevarlist| HH M (QREFELT $ 27))
                                (QREFELT $ 29))
                      . #6#)
                (EXIT (CONS 0 |resul|))))))))
          #7# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |TransSolvePackageService;|)) 

(DEFUN |TransSolvePackageService| (#1=#:G798)
  (SPROG NIL
         (PROG (#2=#:G799)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TransSolvePackageService|)
                                               '|domainEqualList|)
                    . #3=(|TransSolvePackageService|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|TransSolvePackageService;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TransSolvePackageService|)))))))))) 

(DEFUN |TransSolvePackageService;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TransSolvePackageService|))
          (LETT |dv$| (LIST '|TransSolvePackageService| DV$1) . #1#)
          (LETT $ (GETREFV 52) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TransSolvePackageService|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TransSolvePackageService| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|) (0 . |new|)
              (|Fraction| 28) (4 . |Zero|) (8 . |One|)
              (|SparseUnivariatePolynomial| 6) (12 . |One|) (|Expression| 6)
              (|Integer|) (|Vector| 14) (16 . |elt|) (22 . |coerce|)
              (|List| 22) (27 . |kernels|)
              (|Fraction| (|SparseUnivariatePolynomial| $)) (|Kernel| $)
              (32 . |univariate|) (38 . ^) (44 . *) (50 . +)
              |SOLVESER;unvectorise;VFIF;1| (|SparseUnivariatePolynomial| 14)
              (56 . |numer|) (61 . |denom|) (|NonNegativeInteger|)
              (66 . |degree|) (|Union| $ '"failed") (71 . |exquo|) (77 . |One|)
              (|Boolean|) (81 . =) (87 . /) |SOLVESER;decomposeFunc;4F;2|
              (93 . |Zero|) (97 . ^) (103 . *) (109 . |vectorise|)
              (|Matrix| 14) (115 . |coerce|) (120 . |horizConcat|)
              (126 . |subMatrix|) (|Union| 16 '"failed")
              (|Record| (|:| |particular| 48) (|:| |basis| (|List| 16)))
              (|LinearSystemMatrixPackage| 14 16 16 44) (135 . |solve|))
           '#(|unvectorise| 141 |decomposeFunc| 148) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(0 7 0 8 0 9 0 10 0 6 0 11 0
                                                   12 0 13 2 16 14 0 15 17 1 14
                                                   0 7 18 1 14 19 0 20 2 14 21
                                                   0 22 23 2 9 0 0 15 24 2 9 0
                                                   0 0 25 2 9 0 0 0 26 1 9 28 0
                                                   29 1 9 28 0 30 1 28 31 0 32
                                                   2 31 33 0 0 34 0 28 0 35 2
                                                   28 36 0 0 37 2 9 0 28 28 38
                                                   0 14 0 40 2 28 0 0 31 41 2
                                                   28 0 0 0 42 2 28 16 0 31 43
                                                   1 44 0 16 45 2 44 0 0 0 46 5
                                                   44 0 0 15 15 15 15 47 2 50
                                                   49 44 16 51 3 0 9 16 9 15 27
                                                   3 0 9 9 9 9 39)))))
           '|lookupComplete|)) 
