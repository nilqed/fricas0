
(SDEFUN |DEFINTRF;integrate;FSbU;1|
        ((|f| |Fraction| (|Polynomial| R))
         (|s| |SegmentBinding| (|OrderedCompletion| (|Expression| R)))
         ($ |Union| (|:| |f1| (|OrderedCompletion| (|Expression| R)))
          (|:| |f2| (|List| (|OrderedCompletion| (|Expression| R))))
          (|:| |fail| "failed") (|:| |pole| "potentialPole")))
        (|DEFINTRF;int| |f| (SPADCALL |s| (QREFELT $ 9))
         (SPADCALL (SPADCALL |s| (QREFELT $ 11)) (QREFELT $ 13))
         (SPADCALL (SPADCALL |s| (QREFELT $ 11)) (QREFELT $ 14)) NIL $)) 

(SDEFUN |DEFINTRF;nopole|
        ((|f| |Fraction| (|Polynomial| R)) (|x| |Symbol|)
         (|a| |OrderedCompletion| (|Expression| R))
         (|b| |OrderedCompletion| (|Expression| R))
         ($ |Union| (|:| |f1| (|OrderedCompletion| (|Expression| R)))
          (|:| |f2| (|List| (|OrderedCompletion| (|Expression| R))))
          (|:| |fail| #1="failed") (|:| |pole| "potentialPole")))
        (SPROG
         ((|ans| (|List| (|OrderedCompletion| (|Expression| R))))
          (#2=#:G733 NIL)
          (|v| (|Union| (|OrderedCompletion| (|Expression| R)) "failed"))
          (#3=#:G734 NIL) (|g| NIL)
          (|u| (|Union| (|Expression| R) (|List| (|Expression| R))))
          (|k| (|Kernel| (|Expression| R))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |k| (SPADCALL |x| (QREFELT $ 19)) . #4=(|DEFINTRF;nopole|))
            (LETT |u| (SPADCALL |f| |x| (QREFELT $ 22)) . #4#)
            (EXIT
             (COND
              ((QEQCAR |u| 0)
               (SEQ
                (LETT |v| (SPADCALL |k| (QCDR |u|) |a| |b| 'T (QREFELT $ 27))
                      . #4#)
                (EXIT
                 (COND ((QEQCAR |v| 1) (CONS 2 #1#))
                       (#5='T (CONS 0 (QCDR |v|)))))))
              (#5#
               (SEQ (LETT |ans| NIL . #4#)
                    (SEQ (LETT |g| NIL . #4#) (LETT #3# (QCDR |u|) . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |g| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |v|
                                (SPADCALL |k| |g| |a| |b| 'T (QREFELT $ 27))
                                . #4#)
                          (EXIT
                           (COND
                            ((QEQCAR |v| 1)
                             (PROGN
                              (LETT #2# (CONS 2 #1#) . #4#)
                              (GO #6=#:G732)))
                            ('T
                             (LETT |ans|
                                   (SPADCALL |ans| (LIST (QCDR |v|))
                                             (QREFELT $ 29))
                                   . #4#)))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS 1 |ans|))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |DEFINTRF;integrate;FSbU;3|
        ((|f| |Fraction| (|Polynomial| R))
         (|s| |SegmentBinding|
          (|OrderedCompletion| (|Fraction| (|Polynomial| R))))
         ($ |Union| (|:| |f1| (|OrderedCompletion| (|Expression| R)))
          (|:| |f2| (|List| (|OrderedCompletion| (|Expression| R))))
          (|:| |fail| "failed") (|:| |pole| "potentialPole")))
        (|DEFINTRF;int| |f| (SPADCALL |s| (QREFELT $ 31))
         (SPADCALL (ELT $ 32)
                   (SPADCALL (SPADCALL |s| (QREFELT $ 34)) (QREFELT $ 36))
                   (QREFELT $ 39))
         (SPADCALL (ELT $ 32)
                   (SPADCALL (SPADCALL |s| (QREFELT $ 34)) (QREFELT $ 40))
                   (QREFELT $ 39))
         NIL $)) 

(SDEFUN |DEFINTRF;integrate;FSbSU;4|
        ((|f| |Fraction| (|Polynomial| R))
         (|s| |SegmentBinding|
          (|OrderedCompletion| (|Fraction| (|Polynomial| R))))
         (|str| |String|)
         ($ |Union| (|:| |f1| (|OrderedCompletion| (|Expression| R)))
          (|:| |f2| (|List| (|OrderedCompletion| (|Expression| R))))
          (|:| |fail| "failed") (|:| |pole| "potentialPole")))
        (|DEFINTRF;int| |f| (SPADCALL |s| (QREFELT $ 31))
         (SPADCALL (ELT $ 32)
                   (SPADCALL (SPADCALL |s| (QREFELT $ 34)) (QREFELT $ 36))
                   (QREFELT $ 39))
         (SPADCALL (ELT $ 32)
                   (SPADCALL (SPADCALL |s| (QREFELT $ 34)) (QREFELT $ 40))
                   (QREFELT $ 39))
         (SPADCALL |str| (QREFELT $ 43)) $)) 

(SDEFUN |DEFINTRF;integrate;FSbSU;5|
        ((|f| |Fraction| (|Polynomial| R))
         (|s| |SegmentBinding| (|OrderedCompletion| (|Expression| R)))
         (|str| |String|)
         ($ |Union| (|:| |f1| (|OrderedCompletion| (|Expression| R)))
          (|:| |f2| (|List| (|OrderedCompletion| (|Expression| R))))
          (|:| |fail| "failed") (|:| |pole| "potentialPole")))
        (|DEFINTRF;int| |f| (SPADCALL |s| (QREFELT $ 9))
         (SPADCALL (SPADCALL |s| (QREFELT $ 11)) (QREFELT $ 13))
         (SPADCALL (SPADCALL |s| (QREFELT $ 11)) (QREFELT $ 14))
         (SPADCALL |str| (QREFELT $ 43)) $)) 

(SDEFUN |DEFINTRF;int|
        ((|f| |Fraction| (|Polynomial| R)) (|x| |Symbol|)
         (|a| |OrderedCompletion| (|Expression| R))
         (|b| |OrderedCompletion| (|Expression| R)) (|ignor?| |Boolean|)
         ($ |Union| (|:| |f1| (|OrderedCompletion| (|Expression| R)))
          (|:| |f2| (|List| (|OrderedCompletion| (|Expression| R))))
          (|:| |fail| "failed") (|:| |pole| #1="potentialPole")))
        (SPROG ((|z| (|Union| (|Boolean|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |a| |b| (QREFELT $ 46))
                  (CONS 0 (|spadConstant| $ 47)))
                 (#2='T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 49)) |x| |a| |b| 'T
                                   (QREFELT $ 51))
                         |DEFINTRF;int|)
                   (EXIT
                    (COND
                     ((QEQCAR |z| 1)
                      (COND (|ignor?| (|DEFINTRF;nopole| |f| |x| |a| |b| $))
                            (#2# (CONS 3 #1#))))
                     ((QCDR |z|)
                      (|error| "integrate: pole in path of integration"))
                     (#2# (|DEFINTRF;nopole| |f| |x| |a| |b| $)))))))))) 

(DECLAIM (NOTINLINE |RationalFunctionDefiniteIntegration;|)) 

(DEFUN |RationalFunctionDefiniteIntegration| (#1=#:G759)
  (SPROG NIL
         (PROG (#2=#:G760)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RationalFunctionDefiniteIntegration|)
                                               '|domainEqualList|)
                    . #3=(|RationalFunctionDefiniteIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RationalFunctionDefiniteIntegration;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|RationalFunctionDefiniteIntegration|)))))))))) 

(DEFUN |RationalFunctionDefiniteIntegration;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|RationalFunctionDefiniteIntegration|))
          (LETT |dv$| (LIST '|RationalFunctionDefiniteIntegration| DV$1) . #1#)
          (LETT $ (GETREFV 52) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|RationalFunctionDefiniteIntegration| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RationalFunctionDefiniteIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              (|SegmentBinding| 12) (0 . |variable|) (|Segment| 12)
              (5 . |segment|) (|OrderedCompletion| 24) (10 . |lo|) (15 . |hi|)
              (|Union| (|:| |f1| 12) (|:| |f2| 28) (|:| |fail| '"failed")
                       (|:| |pole| '"potentialPole"))
              (|Fraction| 48) |DEFINTRF;integrate;FSbU;1| (|Kernel| 24)
              (20 . |kernel|) (|Union| 24 (|List| 24))
              (|IntegrationResultRFToFunction| 6) (25 . |integrate|)
              (|Union| 12 '"failed") (|Expression| 6) (|Boolean|)
              (|DefiniteIntegrationTools| 6 24) (31 . |computeInt|) (|List| 12)
              (40 . |concat!|) (|SegmentBinding| 35) (46 . |variable|)
              (51 . |coerce|) (|Segment| 35) (56 . |segment|)
              (|OrderedCompletion| 16) (61 . |lo|) (|Mapping| 24 16)
              (|OrderedCompletionFunctions2| 16 24) (66 . |map|) (72 . |hi|)
              |DEFINTRF;integrate;FSbU;3| (|String|) (77 . |ignore?|)
              |DEFINTRF;integrate;FSbSU;4| |DEFINTRF;integrate;FSbSU;5|
              (82 . =) (88 . |Zero|) (|Polynomial| 6) (92 . |denom|)
              (|Union| 25 '"failed") (97 . |checkForZero|))
           '#(|integrate| 106) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(1 8 7 0 9 1 8 10 0 11 1 10
                                                   12 0 13 1 10 12 0 14 1 18 0
                                                   7 19 2 21 20 16 7 22 5 26 23
                                                   18 24 12 12 25 27 2 28 0 0 0
                                                   29 1 30 7 0 31 1 24 0 16 32
                                                   1 30 33 0 34 1 33 35 0 36 2
                                                   38 12 37 35 39 1 33 35 0 40
                                                   1 26 25 42 43 2 12 25 0 0 46
                                                   0 12 0 47 1 16 48 0 49 5 26
                                                   50 48 7 12 12 25 51 3 0 15
                                                   16 8 42 45 2 0 15 16 8 17 3
                                                   0 15 16 30 42 44 2 0 15 16
                                                   30 41)))))
           '|lookupComplete|)) 
