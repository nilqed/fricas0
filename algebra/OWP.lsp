
(DECLAIM (NOTINLINE |OrdinaryWeightedPolynomials;|)) 

(DEFUN |OrdinaryWeightedPolynomials;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$| (LIST '|OrdinaryWeightedPolynomials| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 19))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|OrdinaryWeightedPolynomials|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |OrdinaryWeightedPolynomials| (&REST #1=#:G3)
  (SPROG NIL
         (PROG (#2=#:G4)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL NIL))
                     (HGET |$ConstructorCache| '|OrdinaryWeightedPolynomials|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |OrdinaryWeightedPolynomials;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrdinaryWeightedPolynomials|)))))))))) 

(MAKEPROP '|OrdinaryWeightedPolynomials| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|WeightedPolynomials| 6 (|Symbol|)
                                     (|IndexedExponents| (|Symbol|)) 17
                                     (NRTEVAL (QREFELT % 7))
                                     (NRTEVAL (QREFELT % 8))
                                     (NRTEVAL (QREFELT % 9)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|Boolean|) (|OutputForm|) (|String|) (|PositiveInteger|)
              (|Integer|) (|Union| % '"failed") (|NonNegativeInteger|)
              (|Polynomial| 6) (|Void|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(1 0 1 0 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0))
            (CONS
             '#(|Algebra&| NIL |NonAssociativeAlgebra&| NIL |Rng&| |Module&|
                NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |Magma&| |SetCategory&| NIL |BasicType&|
                NIL)
             (CONS
              '#((|Algebra| 6) (|Ring|) (|NonAssociativeAlgebra| 6)
                 (|SemiRing|) (|Rng|) (|Module| 6) (|SemiRng|) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|RightModule| 6)
                 (|LeftModule| 6) (|LeftModule| $$) (|RightModule| $$)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|) (|Magma|)
                 (|SetCategory|) (|CoercibleTo| 11) (|BasicType|)
                 (|unitsKnown|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
