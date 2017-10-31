
(SDEFUN |PMINS;patternMatch;IP2Pmr;1|
        ((|x| I) (|p| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) I)
         ($ |PatternMatchResult| (|Integer|) I))
        (COND
         ((SPADCALL |p| (QREFELT $ 9)) (SPADCALL |p| |x| |l| (QREFELT $ 11)))
         ('T (|PMINS;patternMatchInner| |x| |p| |l| $)))) 

(SDEFUN |PMINS;patternMatchRestricted|
        ((|x| I) (|p| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) I) (|y| I)
         ($ |PatternMatchResult| (|Integer|) I))
        (COND
         ((SPADCALL |p| (QREFELT $ 9))
          (SPADCALL |p| |x| |l| |y| (QREFELT $ 13)))
         ('T (|PMINS;patternMatchInner| |x| |p| |l| $)))) 

(SDEFUN |PMINS;patternMatchSumProd|
        ((|x| I) (|lp| |List| (|Pattern| (|Integer|)))
         (|l| |PatternMatchResult| (|Integer|) I)
         (|invOp| |Mapping| #1=(|Union| I "failed") I I) (|ident| I)
         ($ |PatternMatchResult| (|Integer|) I))
        (SPROG
         ((|y| #1#) (|r| (|Union| (|Integer|) "failed"))
          (|p2| (|Pattern| (|Integer|))) (|p1| (|Pattern| (|Integer|))))
         (SEQ
          (COND
           ((EQL (LENGTH |lp|) 2)
            (SEQ
             (LETT |p2| (SPADCALL |lp| (QREFELT $ 15))
                   . #2=(|PMINS;patternMatchSumProd|))
             (SEQ
              (LETT |r|
                    (SPADCALL (LETT |p1| (|SPADfirst| |lp|) . #2#)
                              (QREFELT $ 17))
                    . #2#)
              (EXIT
               (COND
                ((QEQCAR |r| 1)
                 (SEQ (LETT |p1| |p2| . #2#)
                      (EXIT (LETT |p2| (|SPADfirst| |lp|) . #2#)))))))
             (LETT |r| (SPADCALL |p1| (QREFELT $ 17)) . #2#)
             (EXIT
              (COND ((QEQCAR |r| 1) (SPADCALL (QREFELT $ 18)))
                    (#3='T
                     (SEQ
                      (LETT |y|
                            (SPADCALL |x| (SPADCALL (QCDR |r|) (QREFELT $ 20))
                                      |invOp|)
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |y| 1) (SPADCALL (QREFELT $ 18)))
                             (#3#
                              (|PMINS;patternMatchRestricted| (QCDR |y|) |p2|
                               |l| |ident| $))))))))))
           (#3# (SPADCALL (QREFELT $ 18))))))) 

(SDEFUN |PMINS;patternMatchInner|
        ((|x| I) (|p| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) I)
         ($ |PatternMatchResult| (|Integer|) I))
        (SPROG
         ((|r| (|Union| (|Integer|) "failed")) (#1=#:G762 NIL)
          (|v| (|Union| I "failed"))
          (|uvr|
           (|Record| (|:| |num| (|Pattern| (|Integer|)))
                     (|:| |den| (|Pattern| (|Integer|)))))
          (|uv|
           (|Union|
            (|Record| (|:| |num| (|Pattern| (|Integer|)))
                      (|:| |den| (|Pattern| (|Integer|))))
            "failed"))
          (|w| (|Union| (|List| (|Pattern| (|Integer|))) "failed"))
          (|pr|
           (|Record| (|:| |base| I) (|:| |exponent| (|NonNegativeInteger|))))
          (|uur|
           (|Record| (|:| |val| (|Pattern| (|Integer|)))
                     (|:| |exponent| (|Pattern| (|Integer|)))))
          (|uu|
           (|Union|
            (|Record| (|:| |val| (|Pattern| (|Integer|)))
                      (|:| |exponent| (|Pattern| (|Integer|))))
            "failed"))
          (|ur|
           (|Record| (|:| |val| (|Pattern| (|Integer|)))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|u|
           (|Union|
            (|Record| (|:| |val| (|Pattern| (|Integer|)))
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT $ 21))
            (SEQ
             (LETT |r| (SPADCALL |p| (QREFELT $ 17))
                   . #2=(|PMINS;patternMatchInner|))
             (EXIT
              (COND
               ((QEQCAR |r| 0)
                (COND ((EQL (SPADCALL |x| (QREFELT $ 22)) (QCDR |r|)) |l|)
                      (#3='T (SPADCALL (QREFELT $ 18)))))
               (#3# (SPADCALL (QREFELT $ 18)))))))
           (#3#
            (SEQ (LETT |u| (SPADCALL |p| (QREFELT $ 25)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |u| 0)
                    (SEQ (LETT |ur| (QCDR |u|) . #2#)
                         (LETT |v| (SPADCALL |x| (QCDR |ur|) (QREFELT $ 29))
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |v| 1) (SPADCALL (QREFELT $ 18)))
                                (#3#
                                 (|PMINS;patternMatchRestricted| (QCDR |v|)
                                  (QCAR |ur|) |l| (|spadConstant| $ 30) $))))))
                   (#3#
                    (SEQ (LETT |uu| (SPADCALL |p| (QREFELT $ 33)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |uu| 0)
                            (SEQ (LETT |uur| (QCDR |uu|) . #2#)
                                 (LETT |pr| (SPADCALL |x| (QREFELT $ 35))
                                       . #2#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL
                                     (LETT |l|
                                           (|PMINS;patternMatchRestricted|
                                            (SPADCALL (QCDR |pr|)
                                                      (QREFELT $ 20))
                                            (QCDR |uur|) |l|
                                            (|spadConstant| $ 30) $)
                                           . #2#)
                                     (QREFELT $ 36))
                                    (SPADCALL (QREFELT $ 18)))
                                   (#3#
                                    (|PMINS;patternMatchRestricted| (QCAR |pr|)
                                     (QCAR |uur|) |l| (|spadConstant| $ 30)
                                     $))))))
                           (#3#
                            (SEQ (LETT |w| (SPADCALL |p| (QREFELT $ 39)) . #2#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |w| 0)
                                    (|PMINS;patternMatchSumProd| |x| (QCDR |w|)
                                     |l| (ELT $ 41) (|spadConstant| $ 30) $))
                                   (#3#
                                    (SEQ
                                     (LETT |w| (SPADCALL |p| (QREFELT $ 42))
                                           . #2#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR |w| 0)
                                        (|PMINS;patternMatchSumProd| |x|
                                         (QCDR |w|) |l|
                                         (CONS #'|PMINS;patternMatchInner!0| $)
                                         (|spadConstant| $ 44) $))
                                       (#3#
                                        (SEQ
                                         (LETT |uv|
                                               (SPADCALL |p| (QREFELT $ 47))
                                               . #2#)
                                         (EXIT
                                          (COND
                                           ((QEQCAR |uv| 0)
                                            (SEQ
                                             (EXIT
                                              (SEQ
                                               (LETT |uvr| (QCDR |uv|) . #2#)
                                               (SEQ
                                                (LETT |r|
                                                      (SPADCALL (QCAR |uvr|)
                                                                (QREFELT $ 17))
                                                      . #2#)
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |r| 0)
                                                   (SEQ
                                                    (LETT |v|
                                                          (SPADCALL
                                                           (SPADCALL (QCDR |r|)
                                                                     (QREFELT $
                                                                              20))
                                                           |x| (QREFELT $ 41))
                                                          . #2#)
                                                    (EXIT
                                                     (COND
                                                      ((QEQCAR |v| 0)
                                                       (PROGN
                                                        (LETT #1#
                                                              (|PMINS;patternMatchRestricted|
                                                               (QCDR |v|)
                                                               (QCDR |uvr|) |l|
                                                               (|spadConstant|
                                                                $ 30)
                                                               $)
                                                              . #2#)
                                                        (GO #4=#:G754))))))))))
                                               (LETT |r|
                                                     (SPADCALL (QCDR |uvr|)
                                                               (QREFELT $ 17))
                                                     . #2#)
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |r| 0)
                                                  (SPADCALL
                                                   (SPADCALL (QCDR |r|) |x|
                                                             (QREFELT $ 48))
                                                   (QCAR |uvr|) |l|
                                                   (QREFELT $ 12)))
                                                 (#3#
                                                  (SPADCALL
                                                   (QREFELT $ 18)))))))
                                             #4# (EXIT #1#)))
                                           (#3#
                                            (SPADCALL
                                             (QREFELT $
                                                      18))))))))))))))))))))))))))) 

(SDEFUN |PMINS;patternMatchInner!0| ((|i1| NIL) (|i2| NIL) ($ NIL))
        (CONS 0 (SPADCALL |i1| |i2| (QREFELT $ 43)))) 

(DECLAIM (NOTINLINE |PatternMatchIntegerNumberSystem;|)) 

(DEFUN |PatternMatchIntegerNumberSystem| (#1=#:G763)
  (SPROG NIL
         (PROG (#2=#:G764)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PatternMatchIntegerNumberSystem|)
                                               '|domainEqualList|)
                    . #3=(|PatternMatchIntegerNumberSystem|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|PatternMatchIntegerNumberSystem;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PatternMatchIntegerNumberSystem|)))))))))) 

(DEFUN |PatternMatchIntegerNumberSystem;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|PatternMatchIntegerNumberSystem|))
          (LETT |dv$| (LIST '|PatternMatchIntegerNumberSystem| DV$1) . #1#)
          (LETT $ (GETREFV 49) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PatternMatchIntegerNumberSystem|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PatternMatchIntegerNumberSystem| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (|Pattern| 19)
              (0 . |generic?|) (|PatternMatchResult| 19 6) (5 . |addMatch|)
              |PMINS;patternMatch;IP2Pmr;1| (12 . |addMatchRestricted|)
              (|List| 8) (20 . |last|) (|Union| 19 '"failed")
              (25 . |retractIfCan|) (30 . |failed|) (|Integer|) (34 . |coerce|)
              (39 . |constant?|) (44 . |convert|)
              (|Record| (|:| |val| $) (|:| |exponent| 27))
              (|Union| 23 '"failed") (49 . |isExpt|) (|Union| 6 '"failed")
              (|NonNegativeInteger|) (|IntegerRoots| 6) (54 . |perfectNthRoot|)
              (60 . |One|) (|Record| (|:| |val| $) (|:| |exponent| $))
              (|Union| 31 '"failed") (64 . |isPower|)
              (|Record| (|:| |base| 6) (|:| |exponent| 27))
              (69 . |perfectNthRoot|) (74 . |failed?|) (79 . |base|)
              (|Union| (|List| $) '"failed") (83 . |isTimes|)
              (|Union| $ '"failed") (88 . |exquo|) (94 . |isPlus|) (99 . -)
              (105 . |Zero|) (|Record| (|:| |num| $) (|:| |den| $))
              (|Union| 45 '"failed") (109 . |isQuotient|) (114 . *))
           '#(|patternMatch| 120) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 48
                                                 '(1 8 7 0 9 3 10 0 8 6 0 11 4
                                                   10 0 8 6 0 6 13 1 14 8 0 15
                                                   1 8 16 0 17 0 10 0 18 1 6 0
                                                   19 20 1 8 7 0 21 1 6 19 0 22
                                                   1 8 24 0 25 2 28 26 6 27 29
                                                   0 6 0 30 1 8 32 0 33 1 28 34
                                                   6 35 1 10 7 0 36 0 6 0 37 1
                                                   8 38 0 39 2 6 40 0 0 41 1 8
                                                   38 0 42 2 6 0 0 0 43 0 6 0
                                                   44 1 8 46 0 47 2 6 0 19 0 48
                                                   3 0 10 6 8 10 12)))))
           '|lookupComplete|)) 
