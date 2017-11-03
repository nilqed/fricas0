
(DECLAIM (NOTINLINE |OrdinaryWeightedPolynomials;|)) 

(DEFUN |OrdinaryWeightedPolynomials| (&REST #1=#:G707)
  (SPROG NIL
         (PROG (#2=#:G708)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|OrdinaryWeightedPolynomials|)
                                               '|domainEqualList|)
                    . #3=(|OrdinaryWeightedPolynomials|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |OrdinaryWeightedPolynomials;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrdinaryWeightedPolynomials|)))))))))) 

(DEFUN |OrdinaryWeightedPolynomials;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|OrdinaryWeightedPolynomials|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|OrdinaryWeightedPolynomials| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 21) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1| '(|Field|))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|OrdinaryWeightedPolynomials|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|OrdinaryWeightedPolynomials| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|WeightedPolynomials| 6 (|Symbol|)
                                     (|IndexedExponents| (|Symbol|)) 13
                                     (NRTEVAL (QREFELT $ 7))
                                     (NRTEVAL (QREFELT $ 8))
                                     (NRTEVAL (QREFELT $ 9)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|Union| $ '"failed") (|Void|) (|NonNegativeInteger|)
              (|Polynomial| 6) (|Integer|) (|Boolean|) (|PositiveInteger|)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(1 0 0 0 0 1 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0))
            (CONS
             '#(|Algebra&| NIL |Rng&| NIL NIL |Module&| |NonAssociativeRing&|
                NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL |AbelianGroup&|
                NIL NIL NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |Magma&| |AbelianSemiGroup&| |SetCategory&|
                NIL |BasicType&| NIL)
             (CONS
              '#((|Algebra| 6) (|Ring|) (|Rng|) (|SemiRing|) (|SemiRng|)
                 (|Module| 6) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 6) (|RightModule| 6)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Magma|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 20))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
