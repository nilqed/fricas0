
(DECLAIM (NOTINLINE |ModularAlgebraicGcd;|)) 

(DEFUN |ModularAlgebraicGcd| (&REST #1=#:G699)
  (SPROG NIL
         (PROG (#2=#:G700)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ModularAlgebraicGcd|)
                                               '|domainEqualList|)
                    . #3=(|ModularAlgebraicGcd|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ModularAlgebraicGcd;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ModularAlgebraicGcd|)))))))))) 

(DEFUN |ModularAlgebraicGcd;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ModularAlgebraicGcd|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|ModularAlgebraicGcd| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 13) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ModularAlgebraicGcd|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ModularAlgebraicGcd| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|ModularAlgebraicGcd2| 9 9 6 7 (|ModularEvaluation1|) 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              (|Polynomial| (|Integer|)) (|List| 9) (|List| 12) (|Symbol|))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#() (CONS '#() (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
