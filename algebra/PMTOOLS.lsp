
(SDEFUN |PMTOOLS;negConstant| ((|l| |List| P) ($ |Union| P "failed"))
        (SPROG
         ((#1=#:G423 NIL) (#2=#:G424 NIL) (|r| (|Union| R "failed"))
          (#3=#:G425 NIL) (|x| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |x| NIL) (LETT #3# |l|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 15)))
                        (EXIT
                         (COND
                          ((QEQCAR |r| 0)
                           (COND
                            ((SPADCALL (QCDR |r|) (|spadConstant| $ 16)
                                       (QREFELT $ 19))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (CONS 0 |x|))
                                     (GO #4=#:G422)))
                              (GO #5=#:G420))))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
             #5# (EXIT #1#))
            (EXIT (CONS 1 "failed"))))
          #4# (EXIT #2#)))) 

(SDEFUN |PMTOOLS;tryToMatch|
        ((|lp| |List| (|Pattern| S))
         (|rc| |Record| (|:| |res| (|PatternMatchResult| S P))
          (|:| |s| (|List| P)))
         (|ident| P)
         (|pmatch| |Mapping| (|PatternMatchResult| S P) P (|Pattern| S)
                   (|PatternMatchResult| S P))
         ($ |Union|
          #1=(|Record| (|:| |res| #2=(|PatternMatchResult| S P))
                       (|:| |s| #3=(|List| P)))
          "failed"))
        (SPROG
         ((|ls| #3#) (#4=#:G437 NIL) (|l| #2#) (|rec| #1#) (#5=#:G438 NIL)
          (|p| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rec| (CONS (LETT |l| (QCAR |rc|)) (LETT |ls| (QCDR |rc|))))
            (SEQ (LETT |p| NIL) (LETT #5# |lp|) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#)) NIL)) (GO G191)))
                 (SEQ
                  (LETT |rec|
                        (|PMTOOLS;findMatch| |p| |ls| |l| |ident| |pmatch| $))
                  (EXIT
                   (COND
                    ((SPADCALL (LETT |l| (QCAR |rec|)) (QREFELT $ 21))
                     (PROGN (LETT #4# (CONS 1 "failed")) (GO #6=#:G436)))
                    ('T (LETT |ls| (QCDR |rec|))))))
                 (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |rec|))))
          #6# (EXIT #4#)))) 

(SDEFUN |PMTOOLS;patternMatchTimes;LLPmrMPmr;3|
        ((|ls| |List| P) (|lp| |List| (|Pattern| S))
         (|l| |PatternMatchResult| S P)
         (|pmatch| |Mapping| (|PatternMatchResult| S P) P (|Pattern| S)
                   (|PatternMatchResult| S P))
         ($ |PatternMatchResult| S P))
        (SPROG ((|u| (|Union| P "failed")))
               (SEQ
                (COND
                 ((SPADCALL (QREFELT $ 13) |lp| (QREFELT $ 23))
                  (SEQ (LETT |u| (|PMTOOLS;negConstant| |ls| $))
                       (EXIT
                        (COND ((QEQCAR |u| 1) (SPADCALL (QREFELT $ 24)))
                              (#1='T
                               (SEQ
                                (COND
                                 ((SPADCALL (QCDR |u|)
                                            (SPADCALL (|spadConstant| $ 9)
                                                      (QREFELT $ 10))
                                            (QREFELT $ 25))
                                  (LETT |ls|
                                        (CONS
                                         (SPADCALL (QCDR |u|) (QREFELT $ 10))
                                         |ls|))))
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL (QCDR |u|) |ls| (QREFELT $ 27))
                                  (SPADCALL (QREFELT $ 13) |lp| (QREFELT $ 28))
                                  (CONS
                                   #'|PMTOOLS;patternMatchTimes;LLPmrMPmr;3!0|
                                   $)
                                  |l| |pmatch| (QREFELT $ 32)))))))))
                 (#1#
                  (SPADCALL |ls| |lp|
                            (CONS #'|PMTOOLS;patternMatchTimes;LLPmrMPmr;3!1|
                                  $)
                            |l| |pmatch| (QREFELT $ 32))))))) 

(SDEFUN |PMTOOLS;patternMatchTimes;LLPmrMPmr;3!1| ((|l1| NIL) ($ NIL))
        (SPROG
         ((#1=#:G454 NIL) (#2=#:G453 NIL) (#3=#:G455 NIL) (#4=#:G457 NIL)
          (#5=#:G379 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT #5# NIL) (LETT #4# |l1|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3# #5#)
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 9))))))) 

(SDEFUN |PMTOOLS;patternMatchTimes;LLPmrMPmr;3!0| ((|l1| NIL) ($ NIL))
        (SPROG
         ((#1=#:G444 NIL) (#2=#:G443 NIL) (#3=#:G445 NIL) (#4=#:G447 NIL)
          (#5=#:G378 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT #5# NIL) (LETT #4# |l1|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3# #5#)
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 9))))))) 

(SDEFUN |PMTOOLS;findMatch|
        ((|p| |Pattern| S) (|ls| |List| P) (|l| |PatternMatchResult| S P)
         (|ident| P)
         (|pmatch| |Mapping| (|PatternMatchResult| S P) P (|Pattern| S)
                   (|PatternMatchResult| S P))
         ($ |Record| (|:| |res| (|PatternMatchResult| S P))
          (|:| |s| (|List| P))))
        (SPROG
         ((|l1| (|PatternMatchResult| S P)) (|t| (P)) (#1=#:G473 NIL) (|x| NIL)
          (#2=#:G472 NIL) (|bad| (|List| P)))
         (SEQ
          (LETT |bad|
                (COND
                 ((SPADCALL |p| (QREFELT $ 34))
                  (SPADCALL (SPADCALL |p| (QREFELT $ 36)) |ls| (QREFELT $ 37)))
                 (#3='T NIL)))
          (LETT |l1| (SPADCALL (QREFELT $ 24)))
          (SEQ (LETT |x| NIL) (LETT #2# (SPADCALL |ls| |bad| (QREFELT $ 38)))
               G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL)
                     (NULL
                      (SEQ (LETT |t| |x|)
                           (EXIT
                            (SPADCALL
                             (LETT |l1| (SPADCALL |x| |p| |l| |pmatch|))
                             (QREFELT $ 21))))))
                 (GO G191)))
               (SEQ (EXIT (|spadConstant| $ 16))) (LETT #2# (CDR #2#))
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((SPADCALL |l1| (QREFELT $ 21))
             (SEQ
              (SEQ (LETT |x| NIL) (LETT #1# |bad|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL)
                         (NULL
                          (SEQ (LETT |t| |x|)
                               (EXIT
                                (SPADCALL
                                 (LETT |l1| (SPADCALL |x| |p| |l| |pmatch|))
                                 (QREFELT $ 21))))))
                     (GO G191)))
                   (SEQ (EXIT (|spadConstant| $ 16))) (LETT #1# (CDR #1#))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((SPADCALL |l1| (QREFELT $ 21))
                 (CONS (SPADCALL |p| |ident| |l| |ident| (QREFELT $ 39)) |ls|))
                (#3# (CONS |l1| (SPADCALL |t| |ls| (QREFELT $ 27))))))))
            (#3# (CONS |l1| (SPADCALL |t| |ls| (QREFELT $ 27))))))))) 

(SDEFUN |PMTOOLS;preprocessList|
        ((|pattern| |Pattern| S) (|ls| |List| P) (|l| |PatternMatchResult| S P)
         ($ |Union| (|List| P) "failed"))
        (SPROG ((|u| (|Union| P "failed")))
               (SEQ
                (COND
                 ((SPADCALL |pattern| (QREFELT $ 34))
                  (SEQ (LETT |u| (SPADCALL |pattern| |l| (QREFELT $ 41)))
                       (EXIT
                        (COND
                         ((QEQCAR |u| 0)
                          (COND
                           ((SPADCALL (QCDR |u|) |ls| (QREFELT $ 42))
                            (CONS 0 (LIST (QCDR |u|))))
                           (#1='T (CONS 1 "failed"))))
                         (#1# (CONS 0 NIL))))))
                 (#1# (CONS 0 NIL)))))) 

(SDEFUN |PMTOOLS;filterMatchedPatterns|
        ((|lp| |List| (|Pattern| S)) (|ls| |List| P)
         (|l| |PatternMatchResult| S P)
         ($ |Union|
          (|Record| (|:| |pat| (|List| (|Pattern| S))) (|:| |s| (|List| P)))
          "failed"))
        (SPROG
         ((#1=#:G497 NIL) (|rc| (|Union| (|List| P) "failed")) (#2=#:G498 NIL)
          (|p| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |p| NIL) (LETT #2# |lp|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL)) (GO G191)))
                 (SEQ (LETT |rc| (|PMTOOLS;preprocessList| |p| |ls| |l| $))
                      (EXIT
                       (COND
                        ((QEQCAR |rc| 1)
                         (PROGN (LETT #1# (CONS 1 "failed")) (GO #3=#:G496)))
                        ((NULL (NULL (QCDR |rc|)))
                         (SEQ (LETT |lp| (SPADCALL |p| |lp| (QREFELT $ 28)))
                              (EXIT
                               (LETT |ls|
                                     (SPADCALL (|SPADfirst| (QCDR |rc|)) |ls|
                                               (QREFELT $ 27)))))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (CONS |lp| |ls|)))))
          #3# (EXIT #1#)))) 

(SDEFUN |PMTOOLS;selBestGen|
        ((|l| |List| (|Pattern| S)) ($ |List| (|Pattern| S)))
        (SPROG
         ((#1=#:G503 NIL) (#2=#:G504 NIL) (|ans| (|List| (|Pattern| S)))
          (#3=#:G505 NIL) (|p| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| NIL)
                (SEQ (LETT |p| NIL) (LETT #3# |l|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |p| (QREFELT $ 34))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |ans| (LIST |p|))
                                (EXIT
                                 (COND
                                  ((NULL (SPADCALL |p| (QREFELT $ 43)))
                                   (PROGN
                                    (LETT #1#
                                          (PROGN
                                           (LETT #2# |ans|)
                                           (GO #4=#:G502)))
                                    (GO #5=#:G499)))))))
                          #5# (EXIT #1#))))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))
          #4# (EXIT #2#)))) 

(SDEFUN |PMTOOLS;patternMatch;LLMPmrMPmr;8|
        ((|ls| |List| P) (|lp| |List| (|Pattern| S))
         (|op| |Mapping| P (|List| P)) (|l| |PatternMatchResult| S P)
         (|pmatch| |Mapping| (|PatternMatchResult| S P) P (|Pattern| S)
                   (|PatternMatchResult| S P))
         ($ |PatternMatchResult| S P))
        (SPROG
         ((|rec|
           (|Record| (|:| |res| (|PatternMatchResult| S P))
                     (|:| |s| (|List| P))))
          (|u|
           (|Union|
            (|Record| (|:| |res| (|PatternMatchResult| S P))
                      (|:| |s| (|List| P)))
            "failed"))
          (|rc|
           (|Union|
            (|Record| (|:| |pat| (|List| (|Pattern| S))) (|:| |s| (|List| P)))
            "failed"))
          (|l4| #1=(|List| (|Pattern| S))) (|l3| (|List| (|Pattern| S)))
          (|l2| #1#) (|l1| #1#) (|lpm| #1#) (#2=#:G596 NIL) (|ident| (P)))
         (SEQ
          (EXIT
           (SEQ (LETT |ident| (SPADCALL NIL |op|))
                (LETT |rc| (|PMTOOLS;filterMatchedPatterns| |lp| |ls| |l| $))
                (EXIT
                 (COND
                  ((QEQCAR |rc| 1)
                   (PROGN (LETT #2# (SPADCALL (QREFELT $ 24))) (GO #3=#:G595)))
                  (#4='T
                   (SEQ (LETT |lp| (QCAR (QCDR |rc|)))
                        (LETT |ls| (QCDR (QCDR |rc|)))
                        (EXIT
                         (COND ((NULL |lp|) |l|)
                               ((>
                                 (LENGTH
                                  (LETT |lpm|
                                        (SPADCALL (ELT $ 44) |lp|
                                                  (QREFELT $ 46))))
                                 1)
                                (|error|
                                 "More than one optional pattern in sum/product"))
                               ((< (+ (LENGTH |ls|) (LENGTH |lpm|))
                                   (LENGTH |lp|))
                                (SPADCALL (QREFELT $ 24)))
                               (#4#
                                (SEQ
                                 (COND
                                  ((NULL (NULL |lpm|))
                                   (COND
                                    ((EQL (+ (LENGTH |ls|) 1) (LENGTH |lp|))
                                     (SEQ
                                      (LETT |lp|
                                            (SPADCALL (|SPADfirst| |lpm|) |lp|
                                                      (QREFELT $ 28)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL
                                          (LETT |l|
                                                (SPADCALL (|SPADfirst| |lpm|)
                                                          |ident| |l|
                                                          (QREFELT $ 48)))
                                          (QREFELT $ 21))
                                         (PROGN
                                          (LETT #2# |l|)
                                          (GO #3#))))))))))
                                 (EXIT
                                  (COND
                                   ((>
                                     (LENGTH
                                      (LETT |lpm|
                                            (SPADCALL (ELT $ 49) |lp|
                                                      (QREFELT $ 46))))
                                     1)
                                    (|error|
                                     "More than one expandable pattern in sum/product"))
                                   (#4#
                                    (SEQ
                                     (COND
                                      ((> (LENGTH |ls|) (LENGTH |lp|))
                                       (COND
                                        ((NULL |lpm|)
                                         (COND
                                          ((NULL
                                            (LETT |lpm|
                                                  (|PMTOOLS;selBestGen| |lp|
                                                   $)))
                                           (EXIT
                                            (SPADCALL (QREFELT $ 24)))))))))
                                     (COND
                                      ((NULL (NULL |lpm|))
                                       (LETT |lp|
                                             (SPADCALL (|SPADfirst| |lpm|) |lp|
                                                       (QREFELT $ 28)))))
                                     (LETT |l1|
                                           (SPADCALL (ELT $ 50) |lp|
                                                     (QREFELT $ 46)))
                                     (LETT |l2|
                                           (SPADCALL
                                            (CONS
                                             #'|PMTOOLS;patternMatch;LLMPmrMPmr;8!0|
                                             $)
                                            |lp| (QREFELT $ 46)))
                                     (LETT |l3|
                                           (SPADCALL
                                            (CONS
                                             #'|PMTOOLS;patternMatch;LLMPmrMPmr;8!1|
                                             $)
                                            (SPADCALL
                                             (CONS
                                              #'|PMTOOLS;patternMatch;LLMPmrMPmr;8!2|
                                              $)
                                             |lp| (QREFELT $ 46))
                                            (QREFELT $ 55)))
                                     (LETT |l4|
                                           (SPADCALL
                                            (CONS
                                             #'|PMTOOLS;patternMatch;LLMPmrMPmr;8!3|
                                             $)
                                            |lp| (QREFELT $ 46)))
                                     (LETT |rec| (CONS |l| |ls|))
                                     (LETT |u|
                                           (|PMTOOLS;tryToMatch| |l1| |rec|
                                            |ident| |pmatch| $))
                                     (EXIT
                                      (COND
                                       ((QEQCAR |u| 1)
                                        (SPADCALL (QREFELT $ 24)))
                                       (#4#
                                        (SEQ
                                         (LETT |u|
                                               (|PMTOOLS;tryToMatch| |l2|
                                                (QCDR |u|) |ident| |pmatch| $))
                                         (EXIT
                                          (COND
                                           ((QEQCAR |u| 1)
                                            (SPADCALL (QREFELT $ 24)))
                                           (#4#
                                            (SEQ
                                             (LETT |u|
                                                   (|PMTOOLS;tryToMatch| |l3|
                                                    (QCDR |u|) |ident| |pmatch|
                                                    $))
                                             (EXIT
                                              (COND
                                               ((QEQCAR |u| 1)
                                                (SPADCALL (QREFELT $ 24)))
                                               (#4#
                                                (SEQ (LETT |rec| (QCDR |u|))
                                                     (LETT |rc|
                                                           (|PMTOOLS;filterMatchedPatterns|
                                                            |l4| (QCDR |rec|)
                                                            (QCAR |rec|) $))
                                                     (EXIT
                                                      (COND
                                                       ((QEQCAR |rc| 1)
                                                        (SPADCALL
                                                         (QREFELT $ 24)))
                                                       (#4#
                                                        (SEQ
                                                         (LETT |rec|
                                                               (CONS
                                                                (QCAR |rec|)
                                                                (QCDR
                                                                 (QCDR |rc|))))
                                                         (LETT |u|
                                                               (|PMTOOLS;tryToMatch|
                                                                (QCAR
                                                                 (QCDR |rc|))
                                                                |rec| |ident|
                                                                |pmatch| $))
                                                         (EXIT
                                                          (COND
                                                           ((QEQCAR |u| 1)
                                                            (SPADCALL
                                                             (QREFELT $ 24)))
                                                           (#4#
                                                            (SEQ
                                                             (LETT |rec|
                                                                   (QCDR |u|))
                                                             (LETT |l|
                                                                   (QCAR
                                                                    |rec|))
                                                             (LETT |ls|
                                                                   (QCDR
                                                                    |rec|))
                                                             (EXIT
                                                              (COND
                                                               ((NULL |lpm|)
                                                                (COND
                                                                 ((NULL |ls|)
                                                                  |l|)
                                                                 (#4#
                                                                  (SPADCALL
                                                                   (QREFELT $
                                                                            24)))))
                                                               (#4#
                                                                (SPADCALL
                                                                 (|SPADfirst|
                                                                  |lpm|)
                                                                 (SPADCALL |ls|
                                                                           |op|)
                                                                 |l|
                                                                 (QREFELT $
                                                                          48)))))))))))))))))))))))))))))))))))))))
          #3# (EXIT #2#)))) 

(SDEFUN |PMTOOLS;patternMatch;LLMPmrMPmr;8!3| ((|p1| NIL) ($ NIL))
        (COND
         ((SPADCALL |p1| (QREFELT $ 34))
          (COND ((SPADCALL |p1| (QREFELT $ 43)) NIL)
                ('T (NULL (SPADCALL |p1| (QREFELT $ 50))))))
         ('T NIL))) 

(SDEFUN |PMTOOLS;patternMatch;LLMPmrMPmr;8!2| ((|p1| NIL) ($ NIL))
        (COND
         ((OR (SPADCALL |p1| (QREFELT $ 43)) (SPADCALL |p1| (QREFELT $ 34)))
          NIL)
         ('T (NULL (SPADCALL |p1| (QREFELT $ 50)))))) 

(SDEFUN |PMTOOLS;patternMatch;LLMPmrMPmr;8!1| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 52)) (SPADCALL |z2| (QREFELT $ 52))
                  (QREFELT $ 53))) 

(SDEFUN |PMTOOLS;patternMatch;LLMPmrMPmr;8!0| ((|p1| NIL) ($ NIL))
        (COND
         ((SPADCALL |p1| (QREFELT $ 43)) (NULL (SPADCALL |p1| (QREFELT $ 50))))
         ('T NIL))) 

(DECLAIM (NOTINLINE |PatternMatchTools;|)) 

(DEFUN |PatternMatchTools| (&REST #1=#:G597)
  (SPROG NIL
         (PROG (#2=#:G598)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PatternMatchTools|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PatternMatchTools;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PatternMatchTools|)))))))))) 

(DEFUN |PatternMatchTools;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|PatternMatchTools| DV$1 DV$2 DV$3))
          (LETT $ (GETREFV 56))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PatternMatchTools|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 13
                    (SPADCALL (SPADCALL (|spadConstant| $ 9) (QREFELT $ 10))
                              (QREFELT $ 12)))
          $))) 

(MAKEPROP '|PatternMatchTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |One|) (4 . -) (|Pattern| 6) (9 . |convert|)
              '|mn1| (|Union| 7 '"failed") (14 . |retractIfCan|) (19 . |Zero|)
              (23 . |Zero|) (|Boolean|) (27 . |smaller?|)
              (|PatternMatchResult| 6 8) (33 . |failed?|) (|List| 11)
              (38 . |member?|) (44 . |failed|) (48 . ~=) (|List| 8)
              (54 . |remove|) (60 . |remove|) (66 . *) (|Mapping| 8 26)
              (|Mapping| 20 8 11 20) |PMTOOLS;patternMatch;LLMPmrMPmr;8|
              |PMTOOLS;patternMatchTimes;LLPmrMPmr;3| (72 . |generic?|)
              (|PatternFunctions1| 6 8) (77 . |badValues|)
              (82 . |setIntersection|) (88 . |setDifference|)
              (94 . |addMatchRestricted|) (|Union| 8 '"failed")
              (102 . |getMatch|) (108 . |member?|) (114 . |hasPredicate?|)
              (119 . |optional?|) (|Mapping| 18 11) (124 . |select|)
              (130 . |One|) (134 . |addMatch|) (141 . |multiple?|)
              (146 . |constant?|) (|NonNegativeInteger|) (151 . |depth|)
              (156 . >) (|Mapping| 18 11 11) (162 . |sort!|))
           '#(|patternMatchTimes| 168 |patternMatch| 176) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|patternMatch|
                                 ((|PatternMatchResult| |#1| |#3|)
                                  (|List| |#3|) (|List| (|Pattern| |#1|))
                                  (|Mapping| |#3| (|List| |#3|))
                                  (|PatternMatchResult| |#1| |#3|)
                                  (|Mapping| (|PatternMatchResult| |#1| |#3|)
                                             |#3| (|Pattern| |#1|)
                                             (|PatternMatchResult| |#1|
                                                                   |#3|))))
                                T)
                              '((|patternMatchTimes|
                                 ((|PatternMatchResult| |#1| |#3|)
                                  (|List| |#3|) (|List| (|Pattern| |#1|))
                                  (|PatternMatchResult| |#1| |#3|)
                                  (|Mapping| (|PatternMatchResult| |#1| |#3|)
                                             |#3| (|Pattern| |#1|)
                                             (|PatternMatchResult| |#1|
                                                                   |#3|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 55
                                            '(0 8 0 9 1 8 0 0 10 1 8 11 0 12 1
                                              8 14 0 15 0 7 0 16 0 8 0 17 2 7
                                              18 0 0 19 1 20 18 0 21 2 22 18 11
                                              0 23 0 20 0 24 2 8 18 0 0 25 2 26
                                              0 8 0 27 2 22 0 11 0 28 2 8 0 0 0
                                              29 1 11 18 0 34 1 35 26 11 36 2
                                              26 0 0 0 37 2 26 0 0 0 38 4 20 0
                                              11 8 0 8 39 2 20 40 11 0 41 2 26
                                              18 8 0 42 1 11 18 0 43 1 11 18 0
                                              44 2 22 0 45 0 46 0 7 0 47 3 20 0
                                              11 8 0 48 1 11 18 0 49 1 11 18 0
                                              50 1 11 51 0 52 2 51 18 0 0 53 2
                                              22 0 54 0 55 4 0 20 26 22 20 31
                                              33 5 0 20 26 22 30 20 31 32)))))
           '|lookupComplete|)) 
