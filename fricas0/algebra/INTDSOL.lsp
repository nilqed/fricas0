
(SDEFUN |INTDSOL;integrate_sols;LMR;1|
        ((|l| L)
         (|rat_solve| |Mapping|
          #1=(|Record| (|:| |particular| (|Union| F #2="failed"))
                       (|:| |basis| (|List| F)))
          L F)
         ($ |Record| (|:| |ltilde| L) (|:| |r| (|Union| L "failed"))))
        (SPROG ((|rt| (L)) (#3=#:G694 NIL) (|rec| #1#) (|a| (L)))
               (SEQ
                (LETT |a| (SPADCALL |l| (QREFELT $ 8))
                      . #4=(|INTDSOL;integrate_sols;LMR;1|))
                (LETT |rec| (SPADCALL |a| (|spadConstant| $ 9) |rat_solve|)
                      . #4#)
                (EXIT
                 (COND
                  ((QEQCAR (QCAR |rec|) 1)
                   (CONS
                    (SPADCALL |l|
                              (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 12))
                              (QREFELT $ 13))
                    (CONS 1 "failed")))
                  ('T
                   (SEQ
                    (LETT |rt|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 10)
                                     (SPADCALL
                                      (PROG2 (LETT #3# (QCAR |rec|) . #4#)
                                          (QCDR #3#)
                                        (|check_union2| (QEQCAR #3# 0)
                                                        (QREFELT $ 6)
                                                        (|Union| (QREFELT $ 6)
                                                                 #2#)
                                                        #3#))
                                      |l| (QREFELT $ 14))
                                     (QREFELT $ 15))
                           (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 12))
                           (QREFELT $ 16))
                          . #4#)
                    (EXIT
                     (CONS
                      (SPADCALL (|spadConstant| $ 10)
                                (SPADCALL |rt|
                                          (SPADCALL (|spadConstant| $ 9) 1
                                                    (QREFELT $ 12))
                                          (QREFELT $ 13))
                                (QREFELT $ 15))
                      (CONS 0 |rt|)))))))))) 

(DECLAIM (NOTINLINE |IntegrateSolutions;|)) 

(DEFUN |IntegrateSolutions| (&REST #1=#:G713)
  (SPROG NIL
         (PROG (#2=#:G714)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IntegrateSolutions|)
                                               '|domainEqualList|)
                    . #3=(|IntegrateSolutions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IntegrateSolutions;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IntegrateSolutions|)))))))))) 

(DEFUN |IntegrateSolutions;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegrateSolutions|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|IntegrateSolutions| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 23) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|IntegrateSolutions|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|IntegrateSolutions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |adjoint|) (5 . |One|) (9 . |One|) (|NonNegativeInteger|)
              (13 . |monomial|) (19 . *) (25 . *) (31 . -)
              (37 . |leftQuotient|) (|Union| 7 '"failed")
              (|Record| (|:| |ltilde| 7) (|:| |r| 17)) (|Union| 6 '"failed")
              (|Record| (|:| |particular| 19) (|:| |basis| (|List| 6)))
              (|Mapping| 20 7 6) |INTDSOL;integrate_sols;LMR;1|)
           '#(|integrate_sols| 43) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 22
                                                 '(1 7 0 0 8 0 6 0 9 0 7 0 10 2
                                                   7 0 6 11 12 2 7 0 0 0 13 2 7
                                                   0 6 0 14 2 7 0 0 0 15 2 7 0
                                                   0 0 16 2 0 18 7 21 22)))))
           '|lookupComplete|)) 
