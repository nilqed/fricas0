
(SDEFUN |PMFS;patternMatch;FP2Pmr;1|
        ((|x| F) (|p| |Pattern| S) (|l| |PatternMatchResult| S F)
         ($ |PatternMatchResult| S F))
        (SPROG
         ((#1=#:G778 NIL)
          (|ex|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            #2="failed"))
          (|ep|
           (|Union|
            (|Record| (|:| |val| (|Pattern| S))
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (|uur|
           (|Record| (|:| |val| (|Pattern| S)) (|:| |exponent| (|Pattern| S))))
          (|uu|
           (|Union|
            (|Record| (|:| |val| (|Pattern| S)) (|:| |exponent| (|Pattern| S)))
            "failed"))
          (|u| (|Union| (|List| (|Pattern| S)) "failed"))
          (|lx| (|Union| (|List| F) #2#))
          (|uq| (|Record| (|:| |num| (|Pattern| S)) (|:| |den| (|Pattern| S))))
          (|q|
           (|Union|
            (|Record| (|:| |num| (|Pattern| S)) (|:| |den| (|Pattern| S)))
            "failed"))
          (|v| (|Union| (|Kernel| F) #3="failed")) (|r| (|Union| R #3#)))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT $ 11))
            (SPADCALL |p| |x| |l| (QREFELT $ 13)))
           (#4='T
            (SEQ
             (LETT |r| (SPADCALL |x| (QREFELT $ 15))
                   . #5=(|PMFS;patternMatch;FP2Pmr;1|))
             (EXIT
              (COND
               ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) |p| |l| (QREFELT $ 17)))
               (#4#
                (SEQ (LETT |v| (SPADCALL |x| (QREFELT $ 19)) . #5#)
                     (EXIT
                      (COND
                       ((QEQCAR |v| 0)
                        (SPADCALL (QCDR |v|) |p| |l| (QREFELT $ 22)))
                       (#4#
                        (SEQ (LETT |q| (SPADCALL |p| (QREFELT $ 25)) . #5#)
                             (EXIT
                              (COND
                               ((QEQCAR |q| 0)
                                (SEQ (LETT |uq| (QCDR |q|) . #5#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (LETT |l|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |x| (QREFELT $ 27))
                                                 (QREFELT $ 28))
                                                (QCAR |uq|) |l| (QREFELT $ 29))
                                               . #5#)
                                         (QREFELT $ 30))
                                        |l|)
                                       (#4#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT $ 31))
                                          (QREFELT $ 28))
                                         (QCDR |uq|) |l| (QREFELT $ 29)))))))
                               (#4#
                                (SEQ
                                 (LETT |u| (SPADCALL |p| (QREFELT $ 33)) . #5#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |u| 0)
                                    (SEQ
                                     (LETT |lx| (SPADCALL |x| (QREFELT $ 34))
                                           . #5#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR |lx| 0)
                                        (SPADCALL (QCDR |lx|) (QCDR |u|)
                                                  (CONS
                                                   #'|PMFS;patternMatch;FP2Pmr;1!0|
                                                   $)
                                                  |l| (ELT $ 29)
                                                  (QREFELT $ 42)))
                                       (#4#
                                        (SEQ
                                         (LETT |u|
                                               (SPADCALL (QCDR |u|)
                                                         (QREFELT $ 44))
                                               . #5#)
                                         (EXIT
                                          (COND
                                           ((QEQCAR |u| 0)
                                            (COND
                                             ((SPADCALL
                                               (LETT |l|
                                                     (SPADCALL
                                                      (|SPADfirst| (QCDR |u|))
                                                      (|spadConstant| $ 36) |l|
                                                      (QREFELT $ 13))
                                                     . #5#)
                                               (QREFELT $ 30))
                                              (SPADCALL (QREFELT $ 45)))
                                             (#4#
                                              (SPADCALL |x|
                                                        (SPADCALL (QCDR |u|)
                                                                  (QREFELT $
                                                                           46))
                                                        |l| (QREFELT $ 29)))))
                                           (#4#
                                            (SPADCALL (QREFELT $ 45)))))))))))
                                   (#4#
                                    (SEQ
                                     (LETT |u| (SPADCALL |p| (QREFELT $ 47))
                                           . #5#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR |u| 0)
                                        (SEQ
                                         (LETT |lx|
                                               (SPADCALL |x| (QREFELT $ 48))
                                               . #5#)
                                         (EXIT
                                          (COND
                                           ((QEQCAR |lx| 0)
                                            (SPADCALL (QCDR |lx|) (QCDR |u|)
                                                      |l| (ELT $ 29)
                                                      (QREFELT $ 49)))
                                           (#4#
                                            (SEQ
                                             (LETT |u|
                                                   (SPADCALL (QCDR |u|)
                                                             (QREFELT $ 44))
                                                   . #5#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |u| 0)
                                                (COND
                                                 ((SPADCALL
                                                   (LETT |l|
                                                         (SPADCALL
                                                          (|SPADfirst|
                                                           (QCDR |u|))
                                                          (|spadConstant| $ 50)
                                                          |l| (QREFELT $ 13))
                                                         . #5#)
                                                   (QREFELT $ 30))
                                                  (SPADCALL (QREFELT $ 45)))
                                                 (#4#
                                                  (SPADCALL |x|
                                                            (SPADCALL
                                                             (QCDR |u|)
                                                             (QREFELT $ 46))
                                                            |l|
                                                            (QREFELT $ 29)))))
                                               (#4#
                                                (SPADCALL
                                                 (QREFELT $ 45)))))))))))
                                       (#4#
                                        (SEQ
                                         (LETT |uu|
                                               (SPADCALL |p| (QREFELT $ 53))
                                               . #5#)
                                         (EXIT
                                          (COND
                                           ((QEQCAR |uu| 0)
                                            (SEQ (LETT |uur| (QCDR |uu|) . #5#)
                                                 (LETT |ex|
                                                       (SPADCALL |x|
                                                                 (QREFELT $
                                                                          56))
                                                       . #5#)
                                                 (EXIT
                                                  (COND
                                                   ((QEQCAR |ex| 0)
                                                    (COND
                                                     ((SPADCALL
                                                       (LETT |l|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QCDR
                                                                (QCDR |ex|))
                                                               (QREFELT $ 58))
                                                              (QCDR |uur|) |l|
                                                              (QREFELT $ 29))
                                                             . #5#)
                                                       (QREFELT $ 30))
                                                      (SPADCALL
                                                       (QREFELT $ 45)))
                                                     (#4#
                                                      (SPADCALL
                                                       (QCAR (QCDR |ex|))
                                                       (QCAR |uur|) |l|
                                                       (QREFELT $ 22)))))
                                                   ((SPADCALL (QCDR |uur|)
                                                              (QREFELT $ 59))
                                                    (COND
                                                     ((SPADCALL
                                                       (LETT |l|
                                                             (SPADCALL
                                                              (QCDR |uur|)
                                                              (|spadConstant| $
                                                                              50)
                                                              |l|
                                                              (QREFELT $ 13))
                                                             . #5#)
                                                       (QREFELT $ 30))
                                                      (SPADCALL
                                                       (QREFELT $ 45)))
                                                     (#4#
                                                      (SPADCALL |x|
                                                                (QCAR |uur|)
                                                                |l|
                                                                (QREFELT $
                                                                         29)))))
                                                   (#4#
                                                    (SPADCALL
                                                     (QREFELT $ 45)))))))
                                           (#4#
                                            (SEQ
                                             (EXIT
                                              (SEQ
                                               (SEQ
                                                (LETT |ep|
                                                      (SPADCALL |p|
                                                                (QREFELT $ 62))
                                                      . #5#)
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |ep| 0)
                                                   (SEQ
                                                    (LETT |ex|
                                                          (SPADCALL |x|
                                                                    (QREFELT $
                                                                             56))
                                                          . #5#)
                                                    (EXIT
                                                     (COND
                                                      ((QEQCAR |ex| 0)
                                                       (COND
                                                        ((EQL
                                                          (QCDR (QCDR |ex|))
                                                          (QCDR (QCDR |ep|)))
                                                         (PROGN
                                                          (LETT #1#
                                                                (SPADCALL
                                                                 (QCAR
                                                                  (QCDR |ex|))
                                                                 (QCAR
                                                                  (QCDR |ep|))
                                                                 |l|
                                                                 (QREFELT $
                                                                          22))
                                                                . #5#)
                                                          (GO
                                                           #6=#:G769))))))))))))
                                               (EXIT
                                                (SPADCALL (QREFELT $ 45)))))
                                             #6#
                                             (EXIT
                                              #1#))))))))))))))))))))))))))))))) 

(SDEFUN |PMFS;patternMatch;FP2Pmr;1!0| ((|l1| NIL) ($ NIL))
        (SPROG
         ((#1=#:G725 NIL) (#2=#:G724 NIL) (#3=#:G726 NIL) (#4=#:G728 NIL)
          (#5=#:G690 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL NIL)
           (SEQ (LETT #5# NIL NIL) (LETT #4# |l1| NIL) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) NIL) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3# #5# NIL)
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 35)) NIL))
                         ('T (PROGN (LETT #2# #3# NIL) (LETT #1# 'T NIL)))))))
                (LETT #4# (CDR #4#) NIL) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 36))))))) 

(DECLAIM (NOTINLINE |PatternMatchFunctionSpace;|)) 

(DEFUN |PatternMatchFunctionSpace| (&REST #1=#:G779)
  (SPROG NIL
         (PROG (#2=#:G780)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PatternMatchFunctionSpace|)
                                               '|domainEqualList|)
                    . #3=(|PatternMatchFunctionSpace|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PatternMatchFunctionSpace;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PatternMatchFunctionSpace|)))))))))) 

(DEFUN |PatternMatchFunctionSpace;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternMatchFunctionSpace|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|PatternMatchFunctionSpace| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 63) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PatternMatchFunctionSpace|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PatternMatchFunctionSpace| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Boolean|) (|Pattern| 6) (0 . |generic?|)
              (|PatternMatchResult| 6 8) (5 . |addMatch|)
              (|Union| 7 '#1="failed") (12 . |retractIfCan|)
              (|PatternMatchPushDown| 6 7 8) (17 . |patternMatch|)
              (|Union| (|Kernel| $) '#1#) (24 . |retractIfCan|) (|Kernel| 8)
              (|PatternMatchKernel| 6 8) (29 . |patternMatch|)
              (|Record| (|:| |num| $) (|:| |den| $)) (|Union| 23 '"failed")
              (36 . |isQuotient|)
              (|SparseMultivariatePolynomial| 7 (|Kernel| $)) (41 . |numer|)
              (46 . |coerce|) |PMFS;patternMatch;FP2Pmr;1| (51 . |failed?|)
              (56 . |denom|) (|Union| 43 '"failed") (61 . |isPlus|)
              (66 . |isPlus|) (71 . +) (77 . |Zero|) (|List| 8) (|List| 10)
              (|Mapping| 8 37) (|Mapping| 12 8 10 12)
              (|PatternMatchTools| 6 7 8) (81 . |patternMatch|) (|List| $)
              (90 . |optpair|) (95 . |failed|) (99 . |second|)
              (104 . |isTimes|) (109 . |isTimes|) (114 . |patternMatchTimes|)
              (122 . |One|) (|Record| (|:| |val| $) (|:| |exponent| $))
              (|Union| 51 '"failed") (126 . |isPower|)
              (|Record| (|:| |var| (|Kernel| $)) (|:| |exponent| 57))
              (|Union| 54 '"failed") (131 . |isExpt|) (|Integer|)
              (136 . |coerce|) (141 . |optional?|)
              (|Record| (|:| |val| $) (|:| |exponent| (|NonNegativeInteger|)))
              (|Union| 60 '"failed") (146 . |isExpt|))
           '#(|patternMatch| 151) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 62
                                                 '(1 10 9 0 11 3 12 0 10 8 0 13
                                                   1 8 14 0 15 3 16 12 7 10 12
                                                   17 1 8 18 0 19 3 21 12 20 10
                                                   12 22 1 10 24 0 25 1 8 26 0
                                                   27 1 8 0 26 28 1 12 9 0 30 1
                                                   8 26 0 31 1 10 32 0 33 1 8
                                                   32 0 34 2 8 0 0 0 35 0 8 0
                                                   36 5 41 12 37 38 39 12 40 42
                                                   1 10 32 43 44 0 12 0 45 1 38
                                                   10 0 46 1 10 32 0 47 1 8 32
                                                   0 48 4 41 12 37 38 12 40 49
                                                   0 8 0 50 1 10 52 0 53 1 8 55
                                                   0 56 1 8 0 57 58 1 10 9 0 59
                                                   1 10 61 0 62 3 0 12 8 10 12
                                                   29)))))
           '|lookupComplete|)) 
