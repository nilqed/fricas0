
(SDEFUN |PINTERPA;LagrangeInterpolation;2LP;1|
        ((|lx| |List| F) (|ly| |List| F) ($ P))
        (SPROG
         ((|ip| (P)) (|xp| (F)) (|pp| (P)) (#1=#:G715 NIL) (|xj| NIL) (|j| NIL)
          (#2=#:G713 NIL) (|xi| NIL) (#3=#:G714 NIL) (|yi| NIL) (|i| NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |lx|) (LENGTH |ly|) (QREFELT $ 10))
            (|error| "Different number of points and values."))
           ('T
            (SEQ
             (LETT |ip| (|spadConstant| $ 11)
                   . #4=(|PINTERPA;LagrangeInterpolation;2LP;1|))
             (SEQ (LETT |i| 0 . #4#) (LETT |yi| NIL . #4#)
                  (LETT #3# |ly| . #4#) (LETT |xi| NIL . #4#)
                  (LETT #2# |lx| . #4#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |xi| (CAR #2#) . #4#) NIL)
                        (ATOM #3#) (PROGN (LETT |yi| (CAR #3#) . #4#) NIL))
                    (GO G191)))
                  (SEQ (LETT |pp| (|spadConstant| $ 12) . #4#)
                       (LETT |xp| (|spadConstant| $ 13) . #4#)
                       (SEQ (LETT |j| 0 . #4#) (LETT |xj| NIL . #4#)
                            (LETT #1# |lx| . #4#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |xj| (CAR #1#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |i| |j| (QREFELT $ 10))
                                (SEQ
                                 (LETT |pp|
                                       (SPADCALL |pp|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|spadConstant| $ 13) 1
                                                   (QREFELT $ 14))
                                                  (SPADCALL |xj| 0
                                                            (QREFELT $ 14))
                                                  (QREFELT $ 16))
                                                 (QREFELT $ 17))
                                       . #4#)
                                 (EXIT
                                  (LETT |xp|
                                        (SPADCALL |xp|
                                                  (SPADCALL |xi| |xj|
                                                            (QREFELT $ 18))
                                                  (QREFELT $ 19))
                                        . #4#)))))))
                            (LETT #1#
                                  (PROG1 (CDR #1#)
                                    (LETT |j| (|inc_SI| |j|) . #4#))
                                  . #4#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (LETT |ip|
                              (SPADCALL |ip|
                                        (SPADCALL
                                         (SPADCALL |yi| |xp| (QREFELT $ 20))
                                         |pp| (QREFELT $ 21))
                                        (QREFELT $ 22))
                              . #4#)))
                  (LETT #2#
                        (PROG1 (CDR #2#)
                          (LETT #3#
                                (PROG1 (CDR #3#)
                                  (LETT |i| (|inc_SI| |i|) . #4#))
                                . #4#))
                        . #4#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |ip|))))))) 

(DECLAIM (NOTINLINE |PolynomialInterpolationAlgorithms;|)) 

(DEFUN |PolynomialInterpolationAlgorithms| (&REST #1=#:G716)
  (SPROG NIL
         (PROG (#2=#:G717)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialInterpolationAlgorithms|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialInterpolationAlgorithms|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |PolynomialInterpolationAlgorithms;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialInterpolationAlgorithms|)))))))))) 

(DEFUN |PolynomialInterpolationAlgorithms;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|PolynomialInterpolationAlgorithms|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|PolynomialInterpolationAlgorithms| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 25) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PolynomialInterpolationAlgorithms|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PolynomialInterpolationAlgorithms| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (|NonNegativeInteger|) (0 . ~=) (6 . |Zero|) (10 . |One|)
              (14 . |One|) (18 . |monomial|) (24 . |Zero|) (28 . -) (34 . *)
              (40 . -) (46 . *) (52 . /) (58 . *) (64 . +) (|List| 6)
              |PINTERPA;LagrangeInterpolation;2LP;1|)
           '#(|LagrangeInterpolation| 70) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 24
                                                 '(2 9 8 0 0 10 0 7 0 11 0 7 0
                                                   12 0 6 0 13 2 7 0 6 9 14 0 6
                                                   0 15 2 7 0 0 0 16 2 7 0 0 0
                                                   17 2 6 0 0 0 18 2 6 0 0 0 19
                                                   2 6 0 0 0 20 2 7 0 6 0 21 2
                                                   7 0 0 0 22 2 0 7 23 23
                                                   24)))))
           '|lookupComplete|)) 
