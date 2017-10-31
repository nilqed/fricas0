
(SDEFUN |UPXS2;map;MUpsUps;1|
        ((|f| |Mapping| |Coef2| |Coef1|)
         (|ups| |UnivariatePuiseuxSeries| |Coef1| |var1| |cen1|)
         ($ |UnivariatePuiseuxSeries| |Coef2| |var2| |cen2|))
        (SPADCALL (SPADCALL |ups| (QREFELT $ 14))
                  (SPADCALL |f| (SPADCALL |ups| (QREFELT $ 16)) (QREFELT $ 20))
                  (QREFELT $ 22))) 

(DECLAIM (NOTINLINE |UnivariatePuiseuxSeriesFunctions2;|)) 

(DEFUN |UnivariatePuiseuxSeriesFunctions2| (&REST #1=#:G700)
  (SPROG NIL
         (PROG (#2=#:G701)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePuiseuxSeriesFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|UnivariatePuiseuxSeriesFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |UnivariatePuiseuxSeriesFunctions2;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariatePuiseuxSeriesFunctions2|)))))))))) 

(DEFUN |UnivariatePuiseuxSeriesFunctions2;| (|#1| |#2| |#3| |#4| |#5| |#6|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$6 NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|UnivariatePuiseuxSeriesFunctions2|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT DV$6 (|devaluate| |#6|) . #1#)
    (LETT |dv$|
          (LIST '|UnivariatePuiseuxSeriesFunctions2| DV$1 DV$2 DV$3 DV$4 DV$5
                DV$6)
          . #1#)
    (LETT $ (GETREFV 24) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|UnivariatePuiseuxSeriesFunctions2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (QSETREFV $ 11 |#6|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|UnivariatePuiseuxSeriesFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|Fraction| (|Integer|)) (|UnivariatePuiseuxSeries| 6 8 10)
              (0 . |rationalPower|) (|UnivariateLaurentSeries| 6 8 10)
              (5 . |laurentRep|) (|UnivariateLaurentSeries| 7 9 11)
              (|Mapping| 7 6)
              (|UnivariateLaurentSeriesFunctions2| 6 7 8 9 10 11) (10 . |map|)
              (|UnivariatePuiseuxSeries| 7 9 11) (16 . |puiseux|)
              |UPXS2;map;MUpsUps;1|)
           '#(|map| 22) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(1 13 12 0 14 1 13 15 0 16 2
                                                   19 17 18 15 20 2 21 0 12 17
                                                   22 2 0 21 18 13 23)))))
           '|lookupComplete|)) 
