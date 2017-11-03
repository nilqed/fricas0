
(DECLAIM (NOTINLINE |XPolynomial;|)) 

(DEFUN |XPolynomial| (#1=#:G713)
  (SPROG NIL
         (PROG (#2=#:G714)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|XPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|XPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|XPolynomial;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|XPolynomial|)))))))))) 

(DEFUN |XPolynomial;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|XPolynomial|))
          (LETT |dv$| (LIST '|XPolynomial| DV$1) . #1#)
          (LETT $ (GETREFV 25) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|noZeroDivisors|))
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|XPolynomial| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|XPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|XRecursivePolynomial| 15 6) (|local| |#1|)
              (|NonNegativeInteger|) (|XDistributedPolynomial| 15 6)
              (|Record| (|:| |k| 15) (|:| |c| $)) (|List| 9) (|FreeMonoid| 15)
              (|Mapping| 6 6) (|List| 15) (|Boolean|) (|Symbol|)
              (|Record| (|:| |k| 11) (|:| |c| 6)) (|Union| 11 '"failed")
              (|Integer|) (|Union| $ '"failed") (|PositiveInteger|) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 2
                                '(0 0 0 2 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 1))
            (CONS
             '#(NIL NIL NIL |Algebra&| NIL |Rng&| NIL NIL |Module&| NIL
                |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Magma&|
                |AbelianSemiGroup&| |SetCategory&| |RetractableTo&| NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|XPolynomialsCat| 15 6) (|XFreeAlgebra| 15 6) (|XAlgebra| 6)
                 (|Algebra| 6) (|Ring|) (|Rng|) (|SemiRing|) (|SemiRng|)
                 (|Module| 6) (|BiModule| 6 6) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|LeftModule| 6) (|RightModule| 6)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Magma|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|RetractableTo| 11)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 24)
                 (|noZeroDivisors|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
