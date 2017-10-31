
(SDEFUN |PARPC2;map;MPpcPpc;1|
        ((|f| |Mapping| CF2 CF1) (|c| |ParametricPlaneCurve| CF1)
         ($ |ParametricPlaneCurve| CF2))
        (SPADCALL (SPADCALL (SPADCALL |c| 1 (QREFELT $ 10)) |f|)
                  (SPADCALL (SPADCALL |c| 2 (QREFELT $ 10)) |f|)
                  (QREFELT $ 12))) 

(DECLAIM (NOTINLINE |ParametricPlaneCurveFunctions2;|)) 

(DEFUN |ParametricPlaneCurveFunctions2| (&REST #1=#:G694)
  (SPROG NIL
         (PROG (#2=#:G695)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ParametricPlaneCurveFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|ParametricPlaneCurveFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ParametricPlaneCurveFunctions2;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ParametricPlaneCurveFunctions2|)))))))))) 

(DEFUN |ParametricPlaneCurveFunctions2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|ParametricPlaneCurveFunctions2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ParametricPlaneCurveFunctions2| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 15) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ParametricPlaneCurveFunctions2|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ParametricPlaneCurveFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (|ParametricPlaneCurve| 6)
              (0 . |coordinate|) (|ParametricPlaneCurve| 7) (6 . |curve|)
              (|Mapping| 7 6) |PARPC2;map;MPpcPpc;1|)
           '#(|map| 12) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 14
                                                 '(2 9 6 0 8 10 2 11 0 7 7 12 2
                                                   0 11 13 9 14)))))
           '|lookupComplete|)) 
