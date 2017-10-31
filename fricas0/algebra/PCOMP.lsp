
(SDEFUN |PCOMP;compose;3UP;1| ((|g| UP) (|h| UP) ($ UP))
        (SPROG ((|r| (UP)))
               (SEQ
                (LETT |r| (|spadConstant| $ 8) . #1=(|PCOMP;compose;3UP;1|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |g| (|spadConstant| $ 8) (QREFELT $ 11)))
                       (GO G191)))
                     (SEQ
                      (LETT |r|
                            (SPADCALL
                             (SPADCALL (SPADCALL |g| (QREFELT $ 12))
                                       (SPADCALL |h|
                                                 (SPADCALL |g| (QREFELT $ 14))
                                                 (QREFELT $ 15))
                                       (QREFELT $ 16))
                             |r| (QREFELT $ 17))
                            . #1#)
                      (EXIT (LETT |g| (SPADCALL |g| (QREFELT $ 18)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |r|)))) 

(DECLAIM (NOTINLINE |PolynomialComposition;|)) 

(DEFUN |PolynomialComposition| (&REST #1=#:G696)
  (SPROG NIL
         (PROG (#2=#:G697)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialComposition|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialComposition|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialComposition;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PolynomialComposition|)))))))))) 

(DEFUN |PolynomialComposition;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialComposition|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|PolynomialComposition| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 20) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PolynomialComposition|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PolynomialComposition| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|) (|Boolean|) (8 . ~=)
              (14 . |leadingCoefficient|) (|NonNegativeInteger|)
              (19 . |degree|) (24 . ^) (30 . *) (36 . +) (42 . |reductum|)
              |PCOMP;compose;3UP;1|)
           '#(|compose| 47) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(0 6 0 8 0 7 0 9 2 6 10 0 0
                                                   11 1 6 7 0 12 1 6 13 0 14 2
                                                   6 0 0 13 15 2 6 0 7 0 16 2 6
                                                   0 0 0 17 1 6 0 0 18 2 0 6 6
                                                   6 19)))))
           '|lookupComplete|)) 
