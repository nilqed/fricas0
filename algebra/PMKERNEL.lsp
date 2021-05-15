
(SDEFUN |PMKERNEL;patternMatchArg|
        ((|ls| |List| E) (|lp| |List| (|Pattern| S))
         (|l| |PatternMatchResult| S E) ($ |PatternMatchResult| S E))
        (SPROG
         ((#1=#:G400 NIL) (#2=#:G402 NIL) (#3=#:G405 NIL) (|p| NIL)
          (#4=#:G406 NIL) (|s| NIL) (#5=#:G401 NIL) (#6=#:G403 NIL)
          (#7=#:G404 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LENGTH |ls|) (LENGTH |lp|) (QREFELT $ 10))
             (SPADCALL (QREFELT $ 12)))
            ('T
             (SEQ
              (SEQ
               (EXIT
                (SEQ (LETT |s| NIL) (LETT #7# |ls|) (LETT |p| NIL)
                     (LETT #6# |lp|) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#)) NIL)
                           (ATOM #7#) (PROGN (LETT |s| (CAR #7#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |p| (QREFELT $ 14))
                         (COND
                          ((SPADCALL
                            (LETT |l| (SPADCALL |p| |s| |l| (QREFELT $ 15)))
                            (QREFELT $ 16))
                           (PROGN
                            (LETT #5#
                                  (PROGN
                                   (LETT #2# (SPADCALL (QREFELT $ 12)))
                                   (GO #8=#:G399)))
                            (GO #9=#:G393))))))))
                     (LETT #6# (PROG1 (CDR #6#) (LETT #7# (CDR #7#))))
                     (GO G190) G191 (EXIT NIL)))
               #9# (EXIT #5#))
              (SEQ
               (EXIT
                (SEQ (LETT |s| NIL) (LETT #4# |ls|) (LETT |p| NIL)
                     (LETT #3# |lp|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL)
                           (ATOM #4#) (PROGN (LETT |s| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |p| (QREFELT $ 14)))
                         (COND
                          ((SPADCALL
                            (LETT |l| (SPADCALL |s| |p| |l| (QREFELT $ 18)))
                            (QREFELT $ 16))
                           (PROGN
                            (LETT #1#
                                  (PROGN
                                   (LETT #2# (SPADCALL (QREFELT $ 12)))
                                   (GO #8#)))
                            (GO #10=#:G396))))))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                     (GO G190) G191 (EXIT NIL)))
               #10# (EXIT #1#))
              (EXIT |l|)))))
          #8# (EXIT #2#)))) 

(SDEFUN |PMKERNEL;patternMatchInner|
        ((|s| |Kernel| E) (|p| |Pattern| S) (|l| |PatternMatchResult| S E)
         ($ |Union| (|PatternMatchResult| S E) "failed"))
        (SPROG
         ((#1=#:G425 NIL) (|w| (|Union| (|Symbol|) "failed"))
          (|v| (|Union| (|Symbol|) "failed"))
          (|ur|
           (|Record| (|:| |op| (|BasicOperator|))
                     (|:| |arg| (|List| (|Pattern| S)))))
          (|u|
           (|Union|
            (|Record| (|:| |op| (|BasicOperator|))
                      (|:| |arg| (|List| (|Pattern| S))))
            "failed")))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT $ 14))
            (CONS 0
                  (SPADCALL |p| (SPADCALL |s| (QREFELT $ 20)) |l|
                            (QREFELT $ 15))))
           (#2='T
            (SEQ (LETT |u| (SPADCALL |p| (QREFELT $ 23)))
                 (EXIT
                  (COND
                   ((QEQCAR |u| 0)
                    (SEQ (LETT |ur| (QCDR |u|))
                         (EXIT
                          (COND
                           ((SPADCALL (QCAR |ur|) (SPADCALL |s| (QREFELT $ 26))
                                      (QREFELT $ 27))
                            (CONS 0
                                  (|PMKERNEL;patternMatchArg|
                                   (SPADCALL |s| (QREFELT $ 29)) (QCDR |ur|)
                                   |l| $)))
                           (#2# (CONS 0 (SPADCALL (QREFELT $ 12))))))))
                   ((SPADCALL |p| (QREFELT $ 30))
                    (SEQ
                     (EXIT
                      (SEQ
                       (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 32)))
                            (EXIT
                             (COND
                              ((QEQCAR |v| 0)
                               (SEQ (LETT |w| (SPADCALL |s| (QREFELT $ 33)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |w| 0)
                                       (COND
                                        ((EQUAL (QCDR |v|) (QCDR |w|))
                                         (PROGN
                                          (LETT #1# (CONS 0 |l|))
                                          (GO #3=#:G420))))))))))))
                       (EXIT (CONS 0 (SPADCALL (QREFELT $ 12))))))
                     #3# (EXIT #1#)))
                   (#2# (CONS 1 "failed")))))))))) 

(SDEFUN |PMKERNEL;patternMatchOpt|
        ((|x| E) (|lp| |List| (|Pattern| S)) (|l| |PatternMatchResult| S E)
         (|id| E) ($ |PatternMatchResult| S E))
        (SPROG ((|u| (|Union| (|List| (|Pattern| S)) "failed")))
               (SEQ (LETT |u| (SPADCALL |lp| (QREFELT $ 36)))
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (COND
                        ((SPADCALL
                          (LETT |l|
                                (SPADCALL (|SPADfirst| (QCDR |u|)) |id| |l|
                                          (QREFELT $ 15)))
                          (QREFELT $ 16))
                         (SPADCALL (QREFELT $ 12)))
                        (#1='T
                         (SPADCALL |x| (SPADCALL (QCDR |u|) (QREFELT $ 38)) |l|
                                   (QREFELT $ 18)))))
                      (#1# (SPADCALL (QREFELT $ 12)))))))) 

(SDEFUN |PMKERNEL;patternMatchMonoid|
        ((|s| |Kernel| E) (|p| |Pattern| S) (|l| |PatternMatchResult| S E)
         ($ |Union| (|PatternMatchResult| S E) "failed"))
        (SPROG
         ((|w| (|Union| (|List| (|Pattern| S)) "failed")) (#1=#:G454 NIL)
          (|r| (|Union| E "failed")) (|arg| (|List| E))
          (|op| (|BasicOperator|))
          (|vr|
           (|Record| (|:| |val| (|Pattern| S)) (|:| |exponent| (|Pattern| S))))
          (|v|
           (|Union|
            (|Record| (|:| |val| (|Pattern| S)) (|:| |exponent| (|Pattern| S)))
            "failed"))
          (|u| (|Union| (|PatternMatchResult| S E) "failed")))
         (SEQ (LETT |u| (|PMKERNEL;patternMatchInner| |s| |p| |l| $))
              (EXIT
               (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                     (#2='T
                      (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 41)))
                           (EXIT
                            (COND
                             ((QEQCAR |v| 0)
                              (SEQ (LETT |vr| (QCDR |v|))
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (LETT |op|
                                             (SPADCALL |s| (QREFELT $ 26)))
                                       '|%power| (QREFELT $ 43))
                                      (CONS 0
                                            (|PMKERNEL;patternMatchArg|
                                             (SPADCALL |s| (QREFELT $ 29))
                                             (LIST (QCAR |vr|) (QCDR |vr|)) |l|
                                             $)))
                                     (#2#
                                      (SEQ
                                       (EXIT
                                        (SEQ
                                         (COND
                                          ((SPADCALL |op| '|nthRoot|
                                                     (QREFELT $ 43))
                                           (SEQ
                                            (LETT |r|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (LETT |arg|
                                                          (SPADCALL |s|
                                                                    (QREFELT $
                                                                             29)))
                                                    (QREFELT $ 44))
                                                   (QREFELT $ 46)))
                                            (EXIT
                                             (COND
                                              ((QEQCAR |r| 0)
                                               (PROGN
                                                (LETT #1#
                                                      (CONS 0
                                                            (|PMKERNEL;patternMatchArg|
                                                             (LIST
                                                              (|SPADfirst|
                                                               |arg|)
                                                              (QCDR |r|))
                                                             (LIST (QCAR |vr|)
                                                                   (QCDR |vr|))
                                                             |l| $)))
                                                (GO #3=#:G445))))))))
                                         (EXIT
                                          (COND
                                           ((SPADCALL (QCDR |vr|)
                                                      (QREFELT $ 47))
                                            (COND
                                             ((SPADCALL
                                               (LETT |l|
                                                     (SPADCALL (QCDR |vr|)
                                                               (|spadConstant|
                                                                $ 48)
                                                               |l|
                                                               (QREFELT $ 15)))
                                               (QREFELT $ 16))
                                              (CONS 0
                                                    (SPADCALL (QREFELT $ 12))))
                                             (#2#
                                              (CONS 0
                                                    (SPADCALL
                                                     (SPADCALL |s|
                                                               (QREFELT $ 20))
                                                     (QCAR |vr|) |l|
                                                     (QREFELT $ 18))))))
                                           (#2#
                                            (CONS 0
                                                  (SPADCALL
                                                   (QREFELT $ 12))))))))
                                       #3# (EXIT #1#)))))))
                             (#2#
                              (SEQ (LETT |w| (SPADCALL |p| (QREFELT $ 49)))
                                   (EXIT
                                    (COND
                                     ((QEQCAR |w| 0)
                                      (CONS 0
                                            (|PMKERNEL;patternMatchOpt|
                                             (SPADCALL |s| (QREFELT $ 20))
                                             (QCDR |w|) |l|
                                             (|spadConstant| $ 48) $)))
                                     (#2# (CONS 1 "failed"))))))))))))))) 

(SDEFUN |PMKERNEL;patternMatch;KP2Pmr;5|
        ((|s| |Kernel| E) (|p| |Pattern| S) (|l| |PatternMatchResult| S E)
         ($ |PatternMatchResult| S E))
        (SPROG
         ((|w| (|Union| (|List| (|Pattern| S)) "failed"))
          (|u| (|Union| (|PatternMatchResult| S E) "failed")))
         (SEQ (LETT |u| (|PMKERNEL;patternMatchMonoid| |s| |p| |l| $))
              (EXIT
               (COND ((QEQCAR |u| 0) (QCDR |u|))
                     (#1='T
                      (SEQ (LETT |w| (SPADCALL |p| (QREFELT $ 50)))
                           (EXIT
                            (COND
                             ((QEQCAR |w| 0)
                              (|PMKERNEL;patternMatchOpt|
                               (SPADCALL |s| (QREFELT $ 20)) (QCDR |w|) |l|
                               (|spadConstant| $ 51) $))
                             (#1# (SPADCALL (QREFELT $ 12)))))))))))) 

(SDEFUN |PMKERNEL;patternMatch;KP2Pmr;6|
        ((|s| |Kernel| E) (|p| |Pattern| S) (|l| |PatternMatchResult| S E)
         ($ |PatternMatchResult| S E))
        (SPROG ((|u| (|Union| (|PatternMatchResult| S E) "failed")))
               (SEQ (LETT |u| (|PMKERNEL;patternMatchMonoid| |s| |p| |l| $))
                    (EXIT
                     (COND ((QEQCAR |u| 0) (QCDR |u|))
                           ('T (SPADCALL (QREFELT $ 12)))))))) 

(SDEFUN |PMKERNEL;patternMatch;KP2Pmr;7|
        ((|s| |Kernel| E) (|p| |Pattern| S) (|l| |PatternMatchResult| S E)
         ($ |PatternMatchResult| S E))
        (SPROG ((|u| (|Union| (|PatternMatchResult| S E) "failed")))
               (SEQ (LETT |u| (|PMKERNEL;patternMatchInner| |s| |p| |l| $))
                    (EXIT
                     (COND ((QEQCAR |u| 0) (QCDR |u|))
                           ('T (SPADCALL (QREFELT $ 12)))))))) 

(DECLAIM (NOTINLINE |PatternMatchKernel;|)) 

(DEFUN |PatternMatchKernel| (&REST #1=#:G474)
  (SPROG NIL
         (PROG (#2=#:G475)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PatternMatchKernel|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PatternMatchKernel;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PatternMatchKernel|)))))))))) 

(DEFUN |PatternMatchKernel;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|PatternMatchKernel| DV$1 DV$2))
          (LETT $ (GETREFV 53))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PatternMatchKernel|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#2| '(|Monoid|))
            (PROGN
             (COND
              ((|HasCategory| |#2| '(|AbelianMonoid|))
               (QSETREFV $ 52
                         (CONS
                          (|dispatchFunction| |PMKERNEL;patternMatch;KP2Pmr;5|)
                          $)))
              ('T
               (QSETREFV $ 52
                         (CONS
                          (|dispatchFunction| |PMKERNEL;patternMatch;KP2Pmr;6|)
                          $))))))
           ('T
            (QSETREFV $ 52
                      (CONS
                       (|dispatchFunction| |PMKERNEL;patternMatch;KP2Pmr;7|)
                       $))))
          $))) 

(MAKEPROP '|PatternMatchKernel| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (|NonNegativeInteger|) (0 . ~=) (|PatternMatchResult| 6 7)
              (6 . |failed|) (|Pattern| 6) (10 . |generic?|) (15 . |addMatch|)
              (22 . |failed?|) (|PatternMatchResult| 6 $) (27 . |patternMatch|)
              (|Kernel| $) (34 . |coerce|)
              (|Record| (|:| |op| 24) (|:| |arg| 35)) (|Union| 21 '"failed")
              (39 . |isOp|) (|BasicOperator|) (|Kernel| 7) (44 . |operator|)
              (49 . =) (|List| 7) (55 . |argument|) (60 . |constant?|)
              (|Union| 42 '"failed") (65 . |retractIfCan|) (70 . |symbolIfCan|)
              (|Union| 35 '"failed") (|List| $) (75 . |optpair|) (|List| 13)
              (80 . |second|) (|Record| (|:| |val| $) (|:| |exponent| $))
              (|Union| 39 '"failed") (85 . |isPower|) (|Symbol|) (90 . |is?|)
              (96 . |second|) (|Union| $ '"failed") (101 . |recip|)
              (106 . |optional?|) (111 . |One|) (115 . |isTimes|)
              (120 . |isPlus|) (125 . |Zero|) (129 . |patternMatch|))
           '#(|patternMatch| 136) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|patternMatch|
                                 ((|PatternMatchResult| |#1| |#2|)
                                  (|Kernel| |#2|) (|Pattern| |#1|)
                                  (|PatternMatchResult| |#1| |#2|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 52
                                            '(2 9 8 0 0 10 0 11 0 12 1 13 8 0
                                              14 3 11 0 13 7 0 15 1 11 8 0 16 3
                                              7 17 0 13 17 18 1 7 0 19 20 1 13
                                              22 0 23 1 25 24 0 26 2 24 8 0 0
                                              27 1 25 28 0 29 1 13 8 0 30 1 13
                                              31 0 32 1 25 31 0 33 1 13 34 35
                                              36 1 37 13 0 38 1 13 40 0 41 2 24
                                              8 0 42 43 1 28 7 0 44 1 7 45 0 46
                                              1 13 8 0 47 0 7 0 48 1 13 34 0 49
                                              1 13 34 0 50 0 7 0 51 3 0 11 25
                                              13 11 52 3 0 11 25 13 11 52)))))
           '|lookupComplete|)) 
