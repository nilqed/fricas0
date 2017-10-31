
(DECLAIM (NOTINLINE |Operator;|)) 

(DEFUN |Operator| (#1=#:G704)
  (SPROG NIL
         (PROG (#2=#:G705)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Operator|)
                                               '|domainEqualList|)
                    . #3=(|Operator|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Operator;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Operator|)))))))))) 

(DEFUN |Operator;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Operator|))
          (LETT |dv$| (LIST '|Operator| DV$1) . #1#)
          (LETT $ (GETREFV 21) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|Operator| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|Operator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|ModuleOperator| 6 6) (|local| |#1|)
              (|Union| $ '"failed") (|BasicOperator|) (|FreeGroup| 8)
              (|Integer|) (|Mapping| 6 6) (|Union| 8 '#1="failed")
              (|Union| 6 '#1#) (|NonNegativeInteger|) (|Boolean|)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(1 1 2 3 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0))
            (CONS
             '#(|Algebra&| |Module&| NIL NIL |Ring&| NIL |Rng&| NIL NIL NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |SetCategory&| NIL
                |RetractableTo&| |RetractableTo&| NIL |BasicType&| NIL)
             (CONS
              '#((|Algebra| 6) (|Module| 6) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Ring|) (|BiModule| 6 6) (|Rng|)
                 (|LeftModule| $$) (|LeftModule| 6) (|RightModule| 6)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|Eltable| 6 6)
                 (|RetractableTo| 8) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 20))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
