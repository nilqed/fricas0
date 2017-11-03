
(SDEFUN |PIT;split;PMR;1|
        ((|p| P) (|der| |Mapping| P P)
         ($ |Record| (|:| |normal| P) (|:| |special| P)))
        (SPROG
         ((|rec1| #1=(|Record| (|:| |normal| P) (|:| |special| P)))
          (#2=#:G697 NIL) (|pbar| (P)) (|gdif| (P)) (|gder| (P)) (|p1| (P))
          (|rec0| #1#) (|up1| (|SparseUnivariatePolynomial| P)) (|p0| (P))
          (|up| (|SparseUnivariatePolynomial| P)) (|v| (|Union| V "failed")))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 10)) . #3=(|PIT;split;PMR;1|))
              (EXIT
               (COND ((QEQCAR |v| 1) (CONS |p| (|spadConstant| $ 12)))
                     (#4='T
                      (SEQ
                       (LETT |up| (SPADCALL |p| (QCDR |v|) (QREFELT $ 14))
                             . #3#)
                       (LETT |p0| (SPADCALL |up| (QREFELT $ 16)) . #3#)
                       (LETT |up1|
                             (SPADCALL
                              (CONS #'|PIT;split;PMR;1!0|
                                    (VECTOR (QREFELT $ 8) $ |p0|))
                              |up| (QREFELT $ 20))
                             . #3#)
                       (LETT |rec0| (SPADCALL |p0| |der| (QREFELT $ 22)) . #3#)
                       (LETT |p1| (SPADCALL |up1| (QCDR |v|) (QREFELT $ 23))
                             . #3#)
                       (LETT |gder|
                             (SPADCALL |p1| (SPADCALL |p| |der|)
                                       (QREFELT $ 24))
                             . #3#)
                       (LETT |gdif|
                             (SPADCALL |p1|
                                       (SPADCALL |p1| (QCDR |v|)
                                                 (QREFELT $ 25))
                                       (QREFELT $ 24))
                             . #3#)
                       (LETT |pbar|
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL |gder| |gdif| (QREFELT $ 18))
                                       . #3#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0) (QREFELT $ 8)
                                               (|Union| (QREFELT $ 8)
                                                        #5="failed")
                                               #2#))
                             . #3#)
                       (EXIT
                        (COND
                         ((SPADCALL |pbar| (QREFELT $ 27))
                          (CONS (SPADCALL (QCAR |rec0|) |p1| (QREFELT $ 28))
                                (QCDR |rec0|)))
                         (#4#
                          (SEQ
                           (LETT |rec1|
                                 (SPADCALL
                                  (PROG2
                                      (LETT #2#
                                            (SPADCALL |p1| |pbar|
                                                      (QREFELT $ 18))
                                            . #3#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (QREFELT $ 8)
                                                    (|Union| (QREFELT $ 8) #5#)
                                                    #2#))
                                  |der| (QREFELT $ 22))
                                 . #3#)
                           (EXIT
                            (CONS
                             (SPADCALL (QCAR |rec0|) (QCAR |rec1|)
                                       (QREFELT $ 28))
                             (SPADCALL
                              (SPADCALL (QCDR |rec0|) |pbar| (QREFELT $ 28))
                              (QCDR |rec1|) (QREFELT $ 28))))))))))))))) 

(SDEFUN |PIT;split;PMR;1!0| ((|x| NIL) ($$ NIL))
        (PROG (|p0| $ P)
          (LETT |p0| (QREFELT $$ 2) . #1=(|PIT;split;PMR;1|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT P (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G697 NIL))
                   (PROG2 (LETT #2# (SPADCALL |x| |p0| (QREFELT $ 18)) NIL)
                       (QCDR #2#)
                     (|check_union2| (QEQCAR #2# 0) P (|Union| P "failed")
                                     #2#))))))) 

(DECLAIM (NOTINLINE |ParallelIntegrationTools;|)) 

(DEFUN |ParallelIntegrationTools| (&REST #1=#:G718)
  (SPROG NIL
         (PROG (#2=#:G719)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ParallelIntegrationTools|)
                                               '|domainEqualList|)
                    . #3=(|ParallelIntegrationTools|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ParallelIntegrationTools;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ParallelIntegrationTools|)))))))))) 

(DEFUN |ParallelIntegrationTools;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ParallelIntegrationTools|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|ParallelIntegrationTools| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 29) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ParallelIntegrationTools|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ParallelIntegrationTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Union| 7 '"failed") (0 . |mainVariable|)
              (5 . |One|) (9 . |One|) (|SparseUnivariatePolynomial| $)
              (13 . |univariate|) (|SparseUnivariatePolynomial| 8)
              (19 . |content|) (|Union| $ '"failed") (24 . |exquo|)
              (|Mapping| 8 8) (30 . |map|)
              (|Record| (|:| |normal| 8) (|:| |special| 8)) |PIT;split;PMR;1|
              (36 . |multivariate|) (42 . |gcd|) (48 . |differentiate|)
              (|Boolean|) (54 . |ground?|) (59 . *))
           '#(|split| 65) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(1 8 9 0 10 0 6 0 11 0 8 0 12
                                                   2 8 13 0 7 14 1 15 8 0 16 2
                                                   8 17 0 0 18 2 15 0 19 0 20 2
                                                   8 0 13 7 23 2 8 0 0 0 24 2 8
                                                   0 0 7 25 1 8 26 0 27 2 8 0 0
                                                   0 28 2 0 21 8 19 22)))))
           '|lookupComplete|)) 
