
(SDEFUN |UPDECOMP;rightFactorIfCan;UPNniRU;1|
        ((|p| UP) (|dq| |NonNegativeInteger|) (|lcq| R)
         ($ |Union| UP "failed"))
        (SPROG
         ((|q| (UP)) (#1=#:G705 NIL) (#2=#:G721 NIL)
          (|cquo| (|Union| R "failed")) (|c| (R)) (#3=#:G723 NIL) (|i| NIL)
          (#4=#:G722 NIL) (|k| NIL) (|lcp| (R)) (|s| (|NonNegativeInteger|))
          (|n| (|NonNegativeInteger|))
          (|nc| (|Union| (|NonNegativeInteger|) #5="failed"))
          (|dp| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dp| (SPADCALL |p| (QREFELT $ 9))
                  . #6=(|UPDECOMP;rightFactorIfCan;UPNniRU;1|))
            (EXIT
             (COND
              ((SPADCALL |lcq| (QREFELT $ 11))
               (|error|
                "rightFactorIfCan: leading coefficient may not be zero"))
              ((OR (ZEROP |dp|) (ZEROP |dq|)) (CONS 1 "failed"))
              ('T
               (SEQ (LETT |nc| (SPADCALL |dp| |dq| (QREFELT $ 13)) . #6#)
                    (EXIT
                     (COND ((QEQCAR |nc| 1) (CONS 1 "failed"))
                           ('T
                            (SEQ (LETT |n| (QCDR |nc|) . #6#)
                                 (LETT |s|
                                       (PROG2
                                           (LETT #1#
                                                 (SPADCALL |dq| 1
                                                           (QREFELT $ 16))
                                                 . #6#)
                                           (QCDR #1#)
                                         (|check_union2| (QEQCAR #1# 0)
                                                         (|NonNegativeInteger|)
                                                         (|Union|
                                                          (|NonNegativeInteger|)
                                                          #5#)
                                                         #1#))
                                       . #6#)
                                 (LETT |lcp| (SPADCALL |p| (QREFELT $ 17))
                                       . #6#)
                                 (LETT |q| (SPADCALL |lcq| |dq| (QREFELT $ 18))
                                       . #6#)
                                 (SEQ (LETT |k| 1 . #6#) (LETT #4# |s| . #6#)
                                      G190
                                      (COND ((|greater_SI| |k| #4#) (GO G191)))
                                      (SEQ
                                       (LETT |c| (|spadConstant| $ 19) . #6#)
                                       (SEQ (LETT |i| 0 . #6#)
                                            (LETT #3#
                                                  (PROG2
                                                      (LETT #1#
                                                            (SPADCALL |k| 1
                                                                      (QREFELT
                                                                       $ 16))
                                                            . #6#)
                                                      (QCDR #1#)
                                                    (|check_union2|
                                                     (QEQCAR #1# 0)
                                                     (|NonNegativeInteger|)
                                                     (|Union|
                                                      (|NonNegativeInteger|)
                                                      #5#)
                                                     #1#))
                                                  . #6#)
                                            G190
                                            (COND
                                             ((|greater_SI| |i| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |c|
                                                    (SPADCALL |c|
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL |k|
                                                                           (QREFELT
                                                                            $
                                                                            21))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |n|
                                                                    (QREFELT $
                                                                             21))
                                                                   (|spadConstant|
                                                                    $ 14)
                                                                   (QREFELT $
                                                                            22))
                                                                  (SPADCALL |i|
                                                                            (QREFELT
                                                                             $
                                                                             21))
                                                                  (QREFELT $
                                                                           23))
                                                                 (QREFELT $
                                                                          24))
                                                                (SPADCALL |q|
                                                                          (PROG2
                                                                              (LETT
                                                                               #1#
                                                                               (SPADCALL
                                                                                |dq|
                                                                                |i|
                                                                                (QREFELT
                                                                                 $
                                                                                 16))
                                                                               . #6#)
                                                                              (QCDR
                                                                               #1#)
                                                                            (|check_union2|
                                                                             (QEQCAR
                                                                              #1#
                                                                              0)
                                                                             (|NonNegativeInteger|)
                                                                             (|Union|
                                                                              (|NonNegativeInteger|)
                                                                              #5#)
                                                                             #1#))
                                                                          (QREFELT
                                                                           $
                                                                           25))
                                                                (QREFELT $ 23))
                                                               (SPADCALL |p|
                                                                         (PROG2
                                                                             (LETT
                                                                              #1#
                                                                              (SPADCALL
                                                                               (+
                                                                                |dp|
                                                                                |i|)
                                                                               |k|
                                                                               (QREFELT
                                                                                $
                                                                                16))
                                                                              . #6#)
                                                                             (QCDR
                                                                              #1#)
                                                                           (|check_union2|
                                                                            (QEQCAR
                                                                             #1#
                                                                             0)
                                                                            (|NonNegativeInteger|)
                                                                            (|Union|
                                                                             (|NonNegativeInteger|)
                                                                             #5#)
                                                                            #1#))
                                                                         (QREFELT
                                                                          $
                                                                          25))
                                                               (QREFELT $ 23))
                                                              (QREFELT $ 22))
                                                    . #6#)))
                                            (LETT |i| (|inc_SI| |i|) . #6#)
                                            (GO G190) G191 (EXIT NIL))
                                       (LETT |cquo|
                                             (SPADCALL |c|
                                                       (SPADCALL
                                                        (SPADCALL (* |k| |n|)
                                                                  (QREFELT $
                                                                           21))
                                                        |lcp| (QREFELT $ 23))
                                                       (QREFELT $ 26))
                                             . #6#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |cquo| 1)
                                          (PROGN
                                           (LETT #2# (CONS 1 "failed") . #6#)
                                           (GO #7=#:G720)))
                                         ('T
                                          (LETT |q|
                                                (SPADCALL |q|
                                                          (SPADCALL
                                                           (QCDR |cquo|)
                                                           (PROG2
                                                               (LETT #1#
                                                                     (SPADCALL
                                                                      |dq| |k|
                                                                      (QREFELT
                                                                       $ 16))
                                                                     . #6#)
                                                               (QCDR #1#)
                                                             (|check_union2|
                                                              (QEQCAR #1# 0)
                                                              (|NonNegativeInteger|)
                                                              (|Union|
                                                               (|NonNegativeInteger|)
                                                               #5#)
                                                              #1#))
                                                           (QREFELT $ 18))
                                                          (QREFELT $ 27))
                                                . #6#)))))
                                      (LETT |k| (|inc_SI| |k|) . #6#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT (CONS 0 |q|))))))))))))
          #7# (EXIT #2#)))) 

(SDEFUN |UPDECOMP;monicRightFactorIfCan;UPNniU;2|
        ((|p| UP) (|dq| |NonNegativeInteger|) ($ |Union| UP "failed"))
        (SPADCALL |p| |dq| (|spadConstant| $ 14) (QREFELT $ 29))) 

(SDEFUN |UPDECOMP;leftFactorIfCan;2UPU;3|
        ((|f| UP) (|h| UP) ($ |Union| UP "failed"))
        (SPROG
         ((|g| (UP)) (#1=#:G743 NIL) (|r| (UP))
          (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|qrf|
           (|Union| (|Record| (|:| |quotient| UP) (|:| |remainder| UP))
                    "failed"))
          (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g| (|spadConstant| $ 31)
                  . #2=(|UPDECOMP;leftFactorIfCan;2UPU;3|))
            (EXIT
             (COND ((ZEROP (SPADCALL |h| (QREFELT $ 9))) (CONS 1 "failed"))
                   ('T
                    (SEQ
                     (SEQ (LETT |i| 0 . #2#) G190
                          (COND
                           ((NULL (NULL (SPADCALL |f| (QREFELT $ 32))))
                            (GO G191)))
                          (SEQ
                           (LETT |qrf| (SPADCALL |f| |h| (QREFELT $ 36)) . #2#)
                           (EXIT
                            (COND
                             ((QEQCAR |qrf| 1)
                              (PROGN
                               (LETT #1# (CONS 1 "failed") . #2#)
                               (GO #3=#:G742)))
                             ('T
                              (SEQ (LETT |qr| (QCDR |qrf|) . #2#)
                                   (LETT |r| (QCDR |qr|) . #2#)
                                   (COND
                                    ((NULL (SPADCALL |r| (QREFELT $ 37)))
                                     (EXIT
                                      (PROGN
                                       (LETT #1# (CONS 1 "failed") . #2#)
                                       (GO #3#)))))
                                   (LETT |g|
                                         (SPADCALL |g|
                                                   (SPADCALL
                                                    (SPADCALL |r|
                                                              (QREFELT $ 38))
                                                    |i| (QREFELT $ 18))
                                                   (QREFELT $ 27))
                                         . #2#)
                                   (EXIT (LETT |f| (QCAR |qr|) . #2#)))))))
                          (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT (CONS 0 |g|))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |UPDECOMP;monicDecomposeIfCan;UPU;4|
        ((|f| UP)
         ($ |Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
        (SPROG
         ((#1=#:G764 NIL) (|g| (|Union| UP "failed"))
          (|h| (|Union| UP "failed")) (#2=#:G765 NIL) (#3=#:G749 NIL)
          (|dh| NIL) (|df| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |df| (SPADCALL |f| (QREFELT $ 9))
                  . #4=(|UPDECOMP;monicDecomposeIfCan;UPU;4|))
            (EXIT
             (COND ((ZEROP |df|) (CONS 1 "failed"))
                   ('T
                    (SEQ
                     (SEQ (LETT |dh| 2 . #4#)
                          (LETT #2#
                                (PROG2
                                    (LETT #3# (SPADCALL |df| 1 (QREFELT $ 16))
                                          . #4#)
                                    (QCDR #3#)
                                  (|check_union2| (QEQCAR #3# 0)
                                                  (|NonNegativeInteger|)
                                                  (|Union|
                                                   (|NonNegativeInteger|)
                                                   "failed")
                                                  #3#))
                                . #4#)
                          G190 (COND ((|greater_SI| |dh| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((ZEROP (REM |df| |dh|))
                              (SEQ
                               (LETT |h| (SPADCALL |f| |dh| (QREFELT $ 30))
                                     . #4#)
                               (EXIT
                                (COND
                                 ((QEQCAR |h| 0)
                                  (SEQ
                                   (LETT |g|
                                         (SPADCALL |f| (QCDR |h|)
                                                   (QREFELT $ 39))
                                         . #4#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |g| 0)
                                      (PROGN
                                       (LETT #1#
                                             (CONS 0
                                                   (CONS (QCDR |g|)
                                                         (QCDR |h|)))
                                             . #4#)
                                       (GO #5=#:G763))))))))))))))
                          (LETT |dh| (|inc_SI| |dh|) . #4#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT (CONS 1 "failed"))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |UPDECOMP;monicCompleteDecompose;UPL;5| ((|f| UP) ($ |List| UP))
        (SPROG
         ((|lr| (|Record| (|:| |left| UP) (|:| |right| UP)))
          (|cf|
           (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed")))
         (SEQ
          (LETT |cf| (SPADCALL |f| (QREFELT $ 42))
                . #1=(|UPDECOMP;monicCompleteDecompose;UPL;5|))
          (EXIT
           (COND ((QEQCAR |cf| 1) (LIST |f|))
                 ('T
                  (SEQ (LETT |lr| (QCDR |cf|) . #1#)
                       (EXIT
                        (SPADCALL (SPADCALL (QCAR |lr|) (QREFELT $ 44))
                                  (LIST (QCDR |lr|)) (QREFELT $ 45)))))))))) 

(DECLAIM (NOTINLINE |UnivariatePolynomialDecompositionPackage;|)) 

(DEFUN |UnivariatePolynomialDecompositionPackage| (&REST #1=#:G777)
  (SPROG NIL
         (PROG (#2=#:G778)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePolynomialDecompositionPackage|)
                                               '|domainEqualList|)
                    . #3=(|UnivariatePolynomialDecompositionPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |UnivariatePolynomialDecompositionPackage;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariatePolynomialDecompositionPackage|)))))))))) 

(DEFUN |UnivariatePolynomialDecompositionPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|UnivariatePolynomialDecompositionPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$|
                (LIST '|UnivariatePolynomialDecompositionPackage| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 46) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|UnivariatePolynomialDecompositionPackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|UnivariatePolynomialDecompositionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |degree|) (|Boolean|) (5 . |zero?|)
              (|Union| $ '"failed") (10 . |exquo|) (16 . |One|) (20 . |One|)
              (24 . |subtractIfCan|) (30 . |leadingCoefficient|)
              (35 . |monomial|) (41 . |Zero|) (|Integer|) (45 . |coerce|)
              (50 . +) (56 . *) (62 . -) (68 . |coefficient|) (74 . |exquo|)
              (80 . +) (|Union| 7 '"failed")
              |UPDECOMP;rightFactorIfCan;UPNniRU;1|
              |UPDECOMP;monicRightFactorIfCan;UPNniU;2| (86 . |Zero|)
              (90 . |zero?|) (|Record| (|:| |quotient| 7) (|:| |remainder| 7))
              (|Union| 33 '"failed")
              (|UnivariatePolynomialDivisionPackage| 6 7) (95 . |divideIfCan|)
              (101 . |ground?|) (106 . |ground|)
              |UPDECOMP;leftFactorIfCan;2UPU;3|
              (|Record| (|:| |left| 7) (|:| |right| 7)) (|Union| 40 '"failed")
              |UPDECOMP;monicDecomposeIfCan;UPU;4| (|List| 7)
              |UPDECOMP;monicCompleteDecompose;UPL;5| (111 . |append|))
           '#(|rightFactorIfCan| 117 |monicRightFactorIfCan| 124
              |monicDecomposeIfCan| 130 |monicCompleteDecompose| 135
              |leftFactorIfCan| 140)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(1 7 8 0 9 1 6 10 0 11 2 8 12
                                                   0 0 13 0 6 0 14 0 7 0 15 2 8
                                                   12 0 0 16 1 7 6 0 17 2 7 0 6
                                                   8 18 0 6 0 19 1 6 0 20 21 2
                                                   6 0 0 0 22 2 6 0 0 0 23 2 6
                                                   0 0 0 24 2 7 6 0 8 25 2 6 12
                                                   0 0 26 2 7 0 0 0 27 0 7 0 31
                                                   1 7 10 0 32 2 35 34 7 7 36 1
                                                   7 10 0 37 1 7 6 0 38 2 43 0
                                                   0 0 45 3 0 28 7 8 6 29 2 0
                                                   28 7 8 30 1 0 41 7 42 1 0 43
                                                   7 44 2 0 28 7 7 39)))))
           '|lookupComplete|)) 
