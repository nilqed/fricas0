
(SDEFUN |LODO3AUX;delta_deriv;2R;1| ((|x| R) ($ R))
        (SPADCALL (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 11))
                  (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 13))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator3Aux;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator3Aux| (&REST #1=#:G695)
  (SPROG NIL
         (PROG (#2=#:G696)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperator3Aux|)
                                               '|domainEqualList|)
                    . #3=(|LinearOrdinaryDifferentialOperator3Aux|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |LinearOrdinaryDifferentialOperator3Aux;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperator3Aux|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperator3Aux;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|LinearOrdinaryDifferentialOperator3Aux|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$|
                (LIST '|LinearOrdinaryDifferentialOperator3Aux| DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 15) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|LinearOrdinaryDifferentialOperator3Aux|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator3Aux| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |One|) (|NonNegativeInteger|)
              (4 . |monomial|) (10 . |differentiate|) (15 . *)
              |LODO3AUX;delta_deriv;2R;1|)
           '#(|delta_deriv| 21) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 14
                                                 '(0 6 0 9 2 7 0 6 10 11 1 8 0
                                                   0 12 2 8 0 7 0 13 1 0 8 8
                                                   14)))))
           '|lookupComplete|)) 
