
(SDEFUN |UFPS1;hadamard;3Ufps;1|
        ((|f| |UnivariateFormalPowerSeries| |Coef|)
         (|g| |UnivariateFormalPowerSeries| |Coef|)
         ($ |UnivariateFormalPowerSeries| |Coef|))
        (SPADCALL
         (SPADCALL (ELT $ 7) (SPADCALL |f| (QREFELT $ 10))
                   (SPADCALL |g| (QREFELT $ 10)) (QREFELT $ 13))
         (QREFELT $ 14))) 

(DECLAIM (NOTINLINE |UnivariateFormalPowerSeriesFunctions;|)) 

(DEFUN |UnivariateFormalPowerSeriesFunctions| (#1=#:G691)
  (SPROG NIL
         (PROG (#2=#:G692)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateFormalPowerSeriesFunctions|)
                                               '|domainEqualList|)
                    . #3=(|UnivariateFormalPowerSeriesFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|UnivariateFormalPowerSeriesFunctions;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateFormalPowerSeriesFunctions|)))))))))) 

(DEFUN |UnivariateFormalPowerSeriesFunctions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|UnivariateFormalPowerSeriesFunctions|))
          (LETT |dv$| (LIST '|UnivariateFormalPowerSeriesFunctions| DV$1)
                . #1#)
          (LETT $ (GETREFV 16) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|UnivariateFormalPowerSeriesFunctions| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|UnivariateFormalPowerSeriesFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . *) (|Stream| 6)
              (|UnivariateFormalPowerSeries| 6) (6 . |coefficients|)
              (|Mapping| 6 6 6) (|StreamFunctions3| 6 6 6) (11 . |map|)
              (18 . |series|) |UFPS1;hadamard;3Ufps;1|)
           '#(|hadamard| 23) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 15
                                                 '(2 6 0 0 0 7 1 9 8 0 10 3 12
                                                   8 11 8 8 13 1 9 0 8 14 2 0 9
                                                   9 9 15)))))
           '|lookupComplete|)) 
