
(SDEFUN |DISTEX;gaussianDistribution;RD;1| ((|a| R) ($ |Distribution| R))
        (SPROG ((|cumu| (|Stream| R)))
               (SEQ
                (LETT |cumu|
                      (SPADCALL
                       (SPADCALL (LIST (|spadConstant| $ 7) |a|)
                                 (QREFELT $ 10))
                       (SPADCALL (LIST (|spadConstant| $ 7)) (QREFELT $ 13))
                       (QREFELT $ 14))
                      |DISTEX;gaussianDistribution;RD;1|)
                (EXIT
                 (SPADCALL (SPADCALL |cumu| (QREFELT $ 16)) (QREFELT $ 17)))))) 

(SDEFUN |DISTEX;poissonDistribution;RD;2| ((|a| R) ($ |Distribution| R))
        (SPROG ((|cumu| (|Stream| R)))
               (SEQ
                (LETT |cumu| (SPADCALL (LIST |a|) (QREFELT $ 13))
                      |DISTEX;poissonDistribution;RD;2|)
                (EXIT
                 (SPADCALL (SPADCALL |cumu| (QREFELT $ 16)) (QREFELT $ 17)))))) 

(SDEFUN |DISTEX;wignerDistribution;RD;3| ((|a| R) ($ |Distribution| R))
        (SPROG ((|cumu| (|Stream| R)))
               (SEQ
                (LETT |cumu|
                      (SPADCALL
                       (SPADCALL (LIST (|spadConstant| $ 7) |a|)
                                 (QREFELT $ 10))
                       (SPADCALL (LIST (|spadConstant| $ 7)) (QREFELT $ 13))
                       (QREFELT $ 14))
                      |DISTEX;wignerDistribution;RD;3|)
                (EXIT
                 (SPADCALL (SPADCALL |cumu| (QREFELT $ 16)) (QREFELT $ 20)))))) 

(SDEFUN |DISTEX;freePoissonDistribution;RD;4| ((|a| R) ($ |Distribution| R))
        (SPROG ((|cumu| (|Stream| R)))
               (SEQ
                (LETT |cumu| (SPADCALL (LIST |a|) (QREFELT $ 13))
                      |DISTEX;freePoissonDistribution;RD;4|)
                (EXIT
                 (SPADCALL (SPADCALL |cumu| (QREFELT $ 16)) (QREFELT $ 20)))))) 

(SDEFUN |DISTEX;bernoulliDistribution01;RD;5| ((|a| R) ($ |Distribution| R))
        (SPROG ((|mom| (|Stream| R)))
               (SEQ
                (LETT |mom| (SPADCALL (LIST |a|) (QREFELT $ 13))
                      |DISTEX;bernoulliDistribution01;RD;5|)
                (EXIT
                 (SPADCALL (SPADCALL |mom| (QREFELT $ 16)) (QREFELT $ 23)))))) 

(SDEFUN |DISTEX;arcsineDistribution;RD;6| ((|a| R) ($ |Distribution| R))
        (SPROG
         ((|mgf| (|Stream| R)) (#1=#:G710 NIL)
          (|half| (|Fraction| (|Integer|))))
         (SEQ
          (LETT |mgf|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL 2 (QREFELT $ 26))
                            (SPADCALL |a| 2 (QREFELT $ 28)) (QREFELT $ 29))
                  (QREFELT $ 30))
                 (SPADCALL (LIST (|spadConstant| $ 7)) (QREFELT $ 13))
                 (QREFELT $ 31))
                . #2=(|DISTEX;arcsineDistribution;RD;6|))
          (LETT |mgf| (SPADCALL (|spadConstant| $ 7) |mgf| (QREFELT $ 31))
                . #2#)
          (LETT |half| (SPADCALL 1 2 (QREFELT $ 34)) . #2#)
          (LETT |mgf|
                (SPADCALL |half|
                          (SPADCALL (|spadConstant| $ 32) |mgf| (QREFELT $ 31))
                          (QREFELT $ 36))
                . #2#)
          (LETT |mgf|
                (PROG2 (LETT #1# (SPADCALL |mgf| (QREFELT $ 38)) . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6))
                                  (|Union| (|Stream| (QREFELT $ 6)) "failed")
                                  #1#))
                . #2#)
          (EXIT
           (SPADCALL (SPADCALL (SPADCALL |mgf| (QREFELT $ 39)) (QREFELT $ 16))
                     (QREFELT $ 23)))))) 

(DECLAIM (NOTINLINE |DistributionPackage;|)) 

(DEFUN |DistributionPackage| (#1=#:G714)
  (SPROG NIL
         (PROG (#2=#:G715)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|DistributionPackage|)
                                               '|domainEqualList|)
                    . #3=(|DistributionPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|DistributionPackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|DistributionPackage|)))))))))) 

(DEFUN |DistributionPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DistributionPackage|))
          (LETT |dv$| (LIST '|DistributionPackage| DV$1) . #1#)
          (LETT $ (GETREFV 41) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|DistributionPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 40
                       (CONS
                        (|dispatchFunction| |DISTEX;arcsineDistribution;RD;6|)
                        $)))))
          $))) 

(MAKEPROP '|DistributionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|) (|List| 6)
              (|Stream| 6) (4 . |construct|) (|Distribution| 6) (9 . |Zero|)
              (13 . |repeating|) (18 . |concat|) (|Sequence| 6)
              (24 . |sequence|) (29 . |distributionByClassicalCumulants|)
              |DISTEX;gaussianDistribution;RD;1|
              |DISTEX;poissonDistribution;RD;2|
              (34 . |distributionByFreeCumulants|)
              |DISTEX;wignerDistribution;RD;3|
              |DISTEX;freePoissonDistribution;RD;4|
              (39 . |distributionByMoments|)
              |DISTEX;bernoulliDistribution01;RD;5| (|Integer|) (44 . |coerce|)
              (|PositiveInteger|) (49 . ^) (55 . *) (61 . -) (66 . |cons|)
              (72 . |One|) (|Fraction| 25) (76 . /)
              (|StreamTaylorSeriesOperations| 6) (82 . |powern|)
              (|Union| 9 '"failed") (88 . |recip|) (93 . |rest|)
              (98 . |arcsineDistribution|))
           '#(|wignerDistribution| 103 |poissonDistribution| 108
              |gaussianDistribution| 113 |freePoissonDistribution| 118
              |bernoulliDistribution01| 123 |arcsineDistribution| 128)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 40
                                                 '(0 6 0 7 1 9 0 8 10 0 11 0 12
                                                   1 9 0 8 13 2 9 0 0 0 14 1 15
                                                   0 9 16 1 11 0 15 17 1 11 0
                                                   15 20 1 11 0 15 23 1 6 0 25
                                                   26 2 6 0 0 27 28 2 6 0 0 0
                                                   29 1 6 0 0 30 2 9 0 6 0 31 0
                                                   6 0 32 2 33 0 25 25 34 2 35
                                                   9 33 9 36 1 35 37 9 38 1 9 0
                                                   0 39 1 0 11 6 40 1 0 11 6 21
                                                   1 0 11 6 19 1 0 11 6 18 1 0
                                                   11 6 22 1 0 11 6 24 1 1 11 6
                                                   40)))))
           '|lookupComplete|)) 
