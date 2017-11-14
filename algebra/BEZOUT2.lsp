
(DECLAIM (NOTINLINE |BezoutMatrixWrapper;|)) 

(DEFUN |BezoutMatrixWrapper| (&REST #1=#:G695)
  (SPROG NIL
         (PROG (#2=#:G696)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|BezoutMatrixWrapper|)
                                               '|domainEqualList|)
                    . #3=(|BezoutMatrixWrapper|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |BezoutMatrixWrapper;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|BezoutMatrixWrapper|)))))))))) 

(DEFUN |BezoutMatrixWrapper;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|BezoutMatrixWrapper|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|BezoutMatrixWrapper| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 11) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|BezoutMatrixWrapper|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|BezoutMatrixWrapper| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|BezoutMatrix| 6 7 9 (|Vector| 6) (|Vector| 6)) (|local| |#1|)
              (|local| |#2|) (|IndexedVector| 7 '0) (|Matrix| 6)
              (|NonNegativeInteger|))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#() (CONS '#() (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
