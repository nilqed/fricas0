
(SDEFUN |DLP;shanksDiscLogAlgorithm;2MNniU;1|
        ((|logbase| M) (|c| M) (|p| |NonNegativeInteger|)
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG
         ((|a| (M)) (|disclog| (|Integer|)) (|found| (|Boolean|))
          (|rho| (|Union| (|NonNegativeInteger|) "failed")) (#1=#:G400 NIL)
          (|i| NIL) (|b| (M)) (|end| (|Integer|)) (#2=#:G399 NIL)
          (#3=#:G387 NIL)
          (|exptable| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|n| (|Integer|)) (|l| (|Integer|)) (#4=#:G398 NIL)
          (|limit| (|Integer|)))
         (SEQ (LETT |limit| 30)
              (EXIT
               (COND
                ((< |p| |limit|)
                 (SEQ (LETT |a| (|spadConstant| $ 7)) (LETT |disclog| 0)
                      (LETT |found| NIL)
                      (SEQ (LETT |i| 0) (LETT #4# (- |p| 1)) G190
                           (COND
                            ((OR (|greater_SI| |i| #4#) (NULL (NULL |found|)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |a| |c| (QREFELT $ 9))
                               (SEQ (LETT |disclog| |i|)
                                    (EXIT (LETT |found| 'T))))
                              ('T
                               (LETT |a|
                                     (SPADCALL |a| |logbase|
                                               (QREFELT $ 10)))))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND (|found| (CONS 0 |disclog|))
                             (#5='T
                              (SEQ
                               (SPADCALL
                                "discreteLog: second argument not in cyclic group generated by first argument"
                                (QREFELT $ 14))
                               (EXIT (CONS 1 "failed"))))))))
                (#5#
                 (SEQ (LETT |l| (INTEGER-LENGTH |p|))
                      (COND
                       ((ODDP |l|) (LETT |n| (ASH |p| (- (QUOTIENT2 |l| 2)))))
                       (#5# (LETT |n| (ASH 1 (QUOTIENT2 |l| 2)))))
                      (LETT |a| (|spadConstant| $ 7))
                      (LETT |exptable| (SPADCALL (QREFELT $ 16)))
                      (SEQ (LETT |i| 0)
                           (LETT #2#
                                 (PROG1 (LETT #3# (- |n| 1))
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#)))
                           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (SPADCALL (CONS (SPADCALL |a| (QREFELT $ 18)) |i|)
                                      |exptable| (QREFELT $ 20))
                            (EXIT
                             (LETT |a|
                                   (SPADCALL |a| |logbase| (QREFELT $ 10)))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (LETT |found| NIL) (LETT |end| (QUOTIENT2 (- |p| 1) |n|))
                      (LETT |disclog| 0) (LETT |a| |c|)
                      (LETT |b| (SPADCALL |logbase| (- |n|) (QREFELT $ 22)))
                      (SEQ (LETT |i| 0) (LETT #1# |end|) G190
                           (COND
                            ((OR (|greater_SI| |i| #1#) (NULL (NULL |found|)))
                             (GO G191)))
                           (SEQ
                            (LETT |rho|
                                  (SPADCALL (SPADCALL |a| (QREFELT $ 18))
                                            |exptable| (QREFELT $ 24)))
                            (EXIT
                             (COND
                              ((QEQCAR |rho| 0)
                               (SEQ (LETT |found| 'T)
                                    (EXIT
                                     (LETT |disclog|
                                           (+ (* |n| |i|) (QCDR |rho|))))))
                              ('T
                               (LETT |a| (SPADCALL |a| |b| (QREFELT $ 10)))))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND (|found| (CONS 0 |disclog|))
                             (#5#
                              (SEQ
                               (SPADCALL
                                "discreteLog: second argument not in cyclic group generated by first argument"
                                (QREFELT $ 14))
                               (EXIT (CONS 1 "failed"))))))))))))) 

(DECLAIM (NOTINLINE |DiscreteLogarithmPackage;|)) 

(DEFUN |DiscreteLogarithmPackage| (#1=#:G401)
  (SPROG NIL
         (PROG (#2=#:G402)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|DiscreteLogarithmPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|DiscreteLogarithmPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|DiscreteLogarithmPackage|)))))))))) 

(DEFUN |DiscreteLogarithmPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|DiscreteLogarithmPackage| DV$1))
          (LETT $ (GETREFV 27))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DiscreteLogarithmPackage|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|DiscreteLogarithmPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (|Boolean|)
              (4 . =) (10 . *) (|Void|) (|String|) (|OutputForm|)
              (16 . |messagePrint|) (|Table| 17 25) (21 . |table|)
              (|PositiveInteger|) (25 . |lookup|)
              (|Record| (|:| |key| 17) (|:| |entry| 25)) (30 . |insert!|)
              (|Integer|) (36 . ^) (|Union| 25 '"failed") (42 . |search|)
              (|NonNegativeInteger|) |DLP;shanksDiscLogAlgorithm;2MNniU;1|)
           '#(|shanksDiscLogAlgorithm| 48) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|shanksDiscLogAlgorithm|
                                 ((|Union| (|NonNegativeInteger|) "failed")
                                  |#1| |#1| (|NonNegativeInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 26
                                            '(0 6 0 7 2 6 8 0 0 9 2 6 0 0 0 10
                                              1 13 11 12 14 0 15 0 16 1 6 17 0
                                              18 2 15 0 19 0 20 2 6 0 0 21 22 2
                                              15 23 17 0 24 3 0 23 6 6 25
                                              26)))))
           '|lookupComplete|)) 
