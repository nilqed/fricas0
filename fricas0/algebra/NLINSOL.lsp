
(SDEFUN |NLINSOL;solveInField;LL;1|
        ((|l| |List| (|Polynomial| R))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((#1=#:G703 NIL) (#2=#:G702 #3=(|List| (|Symbol|))) (#4=#:G704 #3#)
          (#5=#:G709 NIL) (|p| NIL))
         (SEQ
          (SPADCALL |l|
                    (PROGN
                     (LETT #1# NIL . #6=(|NLINSOL;solveInField;LL;1|))
                     (SEQ (LETT |p| NIL . #6#) (LETT #5# |l| . #6#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |p| (CAR #5#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4# (SPADCALL |p| (QREFELT $ 9)) . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 10))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
                    (QREFELT $ 13))))) 

(SDEFUN |NLINSOL;solve;LL;2|
        ((|l| |List| (|Polynomial| R))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((#1=#:G711 NIL) (#2=#:G710 #3=(|List| (|Symbol|))) (#4=#:G712 #3#)
          (#5=#:G714 NIL) (|p| NIL))
         (SEQ
          (SPADCALL |l|
                    (PROGN
                     (LETT #1# NIL . #6=(|NLINSOL;solve;LL;2|))
                     (SEQ (LETT |p| NIL . #6#) (LETT #5# |l| . #6#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |p| (CAR #5#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4# (SPADCALL |p| (QREFELT $ 9)) . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 10))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
                    (QREFELT $ 15))))) 

(SDEFUN |NLINSOL;solve;LLL;3|
        ((|lp| |List| (|Polynomial| R)) (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG ((#1=#:G730 NIL) (|sol| NIL) (#2=#:G729 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|NLINSOL;solve;LLL;3|))
                  (SEQ (LETT |sol| NIL . #3#)
                       (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 13)) . #3#)
                       G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |sol| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|NLINSOL;expandSol| |sol| $) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 18))))) 

(SDEFUN |NLINSOL;addRoot|
        ((|eq| |Equation| (|Fraction| (|Polynomial| R)))
         (|l| |List| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG ((#1=#:G734 NIL) (|sol| NIL) (#2=#:G733 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|NLINSOL;addRoot|))
                 (SEQ (LETT |sol| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |sol| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #2# (CONS (CONS |eq| |sol|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |NLINSOL;evalSol|
        ((|ls| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         (|l| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         ($ |List| (|Equation| (|Fraction| (|Polynomial| R)))))
        (SPROG ((#1=#:G742 NIL) (|eq| NIL) (#2=#:G741 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|NLINSOL;evalSol|))
                 (SEQ (LETT |eq| NIL . #3#) (LETT #1# |ls| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |eq| (QREFELT $ 21))
                                         (SPADCALL
                                          (SPADCALL |eq| (QREFELT $ 22)) |l|
                                          (QREFELT $ 25))
                                         (QREFELT $ 26))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |NLINSOL;allRoots|
        ((|l| |List| (|Polynomial| R))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((#1=#:G752 NIL) (|a| NIL) (#2=#:G751 NIL)
          (|s| (|Fraction| (|Polynomial| R))) (#3=#:G744 NIL)
          (|p| (|Polynomial| R))
          (|z| (|List| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))))
         (SEQ
          (COND ((NULL |l|) (LIST NIL))
                ('T
                 (SEQ
                  (LETT |z| (|NLINSOL;allRoots| (CDR |l|) $)
                        . #4=(|NLINSOL;allRoots|))
                  (LETT |s|
                        (SPADCALL
                         (SPADCALL
                          (PROG2
                              (LETT #3#
                                    (SPADCALL
                                     (LETT |p| (|SPADfirst| |l|) . #4#)
                                     (QREFELT $ 28))
                                    . #4#)
                              (QCDR #3#)
                            (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                            (|Union| (|Symbol|) "failed") #3#))
                          (QREFELT $ 30))
                         (QREFELT $ 31))
                        . #4#)
                  (EXIT
                   (SPADCALL
                    (PROGN
                     (LETT #2# NIL . #4#)
                     (SEQ (LETT |a| NIL . #4#)
                          (LETT #1#
                                (SPADCALL (SPADCALL |p| (QREFELT $ 33))
                                          (QREFELT $ 35))
                                . #4#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |a| (CAR #1#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (|NLINSOL;addRoot|
                                    (SPADCALL |s|
                                              (SPADCALL
                                               (SPADCALL |a| (QREFELT $ 36))
                                               (QREFELT $ 31))
                                              (QREFELT $ 26))
                                    |z| $)
                                   #2#)
                                  . #4#)))
                          (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 18))))))))) 

(SDEFUN |NLINSOL;expandSol|
        ((|l| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((#1=#:G775 NIL) (|z| NIL) (#2=#:G774 NIL) (#3=#:G772 NIL)
          (|luniv| (|List| (|Polynomial| R))) (|r| (|Union| R "failed"))
          (|u| (|Union| (|Polynomial| R) "failed"))
          (|lsubs| #4=(|List| (|Equation| (|Fraction| (|Polynomial| R)))))
          (|lassign| #4#) (#5=#:G773 NIL) (|eq| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lassign| (LETT |lsubs| NIL . #6=(|NLINSOL;expandSol|))
                  . #6#)
            (LETT |luniv| NIL . #6#)
            (SEQ (LETT |eq| NIL . #6#) (LETT #5# |l| . #6#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |eq| (CAR #5#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((QEQCAR
                      (SPADCALL (SPADCALL |eq| (QREFELT $ 21)) (QREFELT $ 37))
                      0)
                     (COND
                      ((QEQCAR
                        (|NLINSOL;RIfCan| (SPADCALL |eq| (QREFELT $ 22)) $) 0)
                       (LETT |lassign| (CONS |eq| |lassign|) . #6#))
                      ('T (LETT |lsubs| (CONS |eq| |lsubs|) . #6#))))
                    ('T
                     (SEQ
                      (LETT |u|
                            (SPADCALL (SPADCALL |eq| (QREFELT $ 21))
                                      (QREFELT $ 39))
                            . #6#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 0)
                         (COND
                          ((EQL (LENGTH (SPADCALL (QCDR |u|) (QREFELT $ 9))) 1)
                           (SEQ
                            (LETT |r|
                                  (|NLINSOL;RIfCan|
                                   (SPADCALL |eq| (QREFELT $ 22)) $)
                                  . #6#)
                            (EXIT
                             (COND
                              ((QEQCAR |r| 0)
                               (LETT |luniv|
                                     (CONS
                                      (SPADCALL (QCDR |u|)
                                                (SPADCALL (QCDR |r|)
                                                          (QREFELT $ 36))
                                                (QREFELT $ 41))
                                      |luniv|)
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #3# (LIST |l|) . #6#)
                                (GO #7=#:G771)))))))
                          ('T (PROGN (LETT #3# (LIST |l|) . #6#) (GO #7#)))))
                        ('T
                         (PROGN (LETT #3# (LIST |l|) . #6#) (GO #7#))))))))))
                 (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND ((NULL |luniv|) (LIST |l|))
                   ('T
                    (PROGN
                     (LETT #2# NIL . #6#)
                     (SEQ (LETT |z| NIL . #6#)
                          (LETT #1# (|NLINSOL;allRoots| |luniv| $) . #6#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |z| (CAR #1#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL |z|
                                             (SPADCALL
                                              (|NLINSOL;evalSol| |lsubs| |z| $)
                                              |lassign| (QREFELT $ 42))
                                             (QREFELT $ 42))
                                   #2#)
                                  . #6#)))
                          (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))))))
          #7# (EXIT #3#)))) 

(SDEFUN |NLINSOL;RIfCan|
        ((|f| |Fraction| (|Polynomial| R)) ($ |Union| R "failed"))
        (SPROG ((#1=#:G783 NIL) (|d| #2=(|Union| R "failed")) (|n| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |n|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 43))
                                   (QREFELT $ 45))
                         . #3=(|NLINSOL;RIfCan|))
                   (EXIT
                    (COND
                     ((QEQCAR |n| 0)
                      (SEQ
                       (LETT |d|
                             (SPADCALL (SPADCALL |f| (QREFELT $ 46))
                                       (QREFELT $ 45))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |d| 0)
                          (PROGN
                           (LETT #1#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 47)))
                                 . #3#)
                           (GO #4=#:G781))))))))))
                  (EXIT (CONS 1 "failed"))))
                #4# (EXIT #1#)))) 

(SDEFUN |NLINSOL;solve;LL;9|
        ((|l| |List| (|Polynomial| R))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPADCALL |l| (QREFELT $ 14))) 

(SDEFUN |NLINSOL;solve;LLL;10|
        ((|lp| |List| (|Polynomial| R)) (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPADCALL |lp| |lv| (QREFELT $ 13))) 

(SDEFUN |NLINSOL;solveInField;LLL;11|
        ((|lp| |List| (|Polynomial| R)) (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPADCALL |lp| |lv| (QREFELT $ 49))) 

(SDEFUN |NLINSOL;solveInField;LLL;12|
        ((|lp| |List| (|Polynomial| R)) (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPADCALL |lp| |lv| (QREFELT $ 51))) 

(SDEFUN |NLINSOL;solveInField;LLL;13|
        ((|lp| |List| (|Polynomial| R)) (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG ((#1=#:G791 NIL) (|p| NIL) (#2=#:G790 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|NLINSOL;solveInField;LLL;13|))
                  (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 31)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |lv| (QREFELT $ 54))))) 

(DECLAIM (NOTINLINE |NonLinearSolvePackage;|)) 

(DEFUN |NonLinearSolvePackage| (#1=#:G792)
  (SPROG NIL
         (PROG (#2=#:G793)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NonLinearSolvePackage|)
                                               '|domainEqualList|)
                    . #3=(|NonLinearSolvePackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|NonLinearSolvePackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|NonLinearSolvePackage|)))))))))) 

(DEFUN |NonLinearSolvePackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|NonLinearSolvePackage|))
          (LETT |dv$| (LIST '|NonLinearSolvePackage| DV$1) . #1#)
          (LETT $ (GETREFV 55) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|NonLinearSolvePackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|AlgebraicallyClosedField|))
            (PROGN
             (QSETREFV $ 16 (CONS (|dispatchFunction| |NLINSOL;solve;LL;2|) $))
             (QSETREFV $ 15
                       (CONS (|dispatchFunction| |NLINSOL;solve;LLL;3|) $))))
           ('T
            (PROGN
             (QSETREFV $ 16 (CONS (|dispatchFunction| |NLINSOL;solve;LL;9|) $))
             (QSETREFV $ 15
                       (CONS (|dispatchFunction| |NLINSOL;solve;LLL;10|) $)))))
          (COND ((|domainEqual| |#1| (|Fraction| (|Integer|))))
                ((|HasCategory| |#1|
                                '(|RetractableTo| (|Fraction| (|Integer|))))
                 (QSETREFV $ 13
                           (CONS
                            (|dispatchFunction| |NLINSOL;solveInField;LLL;11|)
                            $))))
          (COND ((|domainEqual| |#1| (|Integer|)))
                ((|HasCategory| |#1|
                                '(|RetractableTo| (|Fraction| (|Integer|)))))
                ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
                 (QSETREFV $ 13
                           (CONS
                            (|dispatchFunction| |NLINSOL;solveInField;LLL;12|)
                            $))))
          (COND
           ((OR (|domainEqual| |#1| (|Integer|))
                (OR
                 (|HasCategory| |#1|
                                '(|RetractableTo| (|Fraction| (|Integer|))))
                 (|HasCategory| |#1| '(|RetractableTo| (|Integer|))))))
           ('T
            (QSETREFV $ 13
                      (CONS (|dispatchFunction| |NLINSOL;solveInField;LLL;13|)
                            $))))
          $))) 

(MAKEPROP '|NonLinearSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 29)
              (|Polynomial| 6) (0 . |variables|) (5 . |setUnion|) (|List| 23)
              (|List| 8) (11 . |solveInField|) |NLINSOL;solveInField;LL;1|
              (17 . |solve|) (23 . |solve|) (|List| $) (28 . |concat|)
              (|Fraction| 8) (|Equation| 19) (33 . |lhs|) (38 . |rhs|)
              (|List| 20) (|RationalFunction| 6) (43 . |eval|)
              (49 . |equation|) (|Union| 29 '"failed") (55 . |mainVariable|)
              (|Symbol|) (60 . |coerce|) (65 . |coerce|)
              (|SparseUnivariatePolynomial| 6) (70 . |univariate|)
              (|SparseUnivariatePolynomial| $) (75 . |zerosOf|) (80 . |coerce|)
              (85 . |retractIfCan|) (|Union| 8 '"failed") (90 . |retractIfCan|)
              (95 . |One|) (99 . -) (105 . |concat|) (111 . |numer|)
              (|Union| 6 '"failed") (116 . |retractIfCan|) (121 . |denom|)
              (126 . /) (|RetractSolvePackage| (|Fraction| (|Integer|)) 6)
              (132 . |solveRetract|) (|RetractSolvePackage| (|Integer|) 6)
              (138 . |solveRetract|) (|List| 19) (|SystemSolvePackage| 6)
              (144 . |solve|))
           '#(|solveInField| 150 |solve| 161) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 54
                                                 '(1 8 7 0 9 2 7 0 0 0 10 2 0
                                                   11 12 7 13 2 0 11 12 7 15 1
                                                   0 11 12 16 1 11 0 17 18 1 20
                                                   19 0 21 1 20 19 0 22 2 24 19
                                                   19 23 25 2 20 0 19 19 26 1 8
                                                   27 0 28 1 8 0 29 30 1 19 0 8
                                                   31 1 8 32 0 33 1 6 17 34 35
                                                   1 8 0 6 36 1 19 27 0 37 1 19
                                                   38 0 39 0 6 0 40 2 8 0 0 0
                                                   41 2 23 0 0 0 42 1 19 8 0 43
                                                   1 8 44 0 45 1 19 8 0 46 2 6
                                                   0 0 0 47 2 48 11 12 7 49 2
                                                   50 11 12 7 51 2 53 11 52 7
                                                   54 1 0 11 12 14 2 0 11 12 7
                                                   13 1 0 11 12 16 2 0 11 12 7
                                                   15)))))
           '|lookupComplete|)) 
