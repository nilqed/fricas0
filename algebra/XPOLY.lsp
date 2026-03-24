
(DECLAIM (NOTINLINE |XPolynomial;|)) 

(DEFUN |XPolynomial;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G15 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|XPolynomial| DV$1))
          (LETT % (GETREFV 29))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1|
                                                             '(|noZeroDivisors|))
                                              (LETT #1#
                                                    (|HasCategory|
                                                     (|FreeMonoid| (|Symbol|))
                                                     '(|Comparable|)))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               #1#)))))
          (|haddProp| |$ConstructorCache| '|XPolynomial| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |XPolynomial| (#1=#:G16)
  (SPROG NIL
         (PROG (#2=#:G17)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|XPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|XPolynomial;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|XPolynomial|)))))))))) 

(MAKEPROP '|XPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|XRecursivePolynomial| 17 6) (|local| |#1|)
              (|Boolean|) (|OutputForm|) (|String|) (|PositiveInteger|)
              (|Integer|) (|Union| % '"failed") (|NonNegativeInteger|)
              (|FreeMonoid| 17) (|Union| 6 '#1="failed") (|Union| 14 '#1#)
              (|Symbol|) (|Record| (|:| |k| 14) (|:| |c| 6)) (|List| 17)
              (|Mapping| 6 6) (|List| %) (|List| 6) (|List| 14) (|List| 18)
              (|XDistributedPolynomial| 17 6)
              (|Record| (|:| |k| 17) (|:| |c| %)) (|List| 26) (|Mapping| 6 14))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 4 0 0 0 0 0 2 0 0 0 0 0))
            (CONS
             '#(NIL NIL NIL |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |FreeModuleCategory&| |Rng&| |Module&| NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL
                |AbelianSemiGroup&| |Magma&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL |BasicType&| NIL NIL NIL)
             (CONS
              '#((|XPolynomialsCat| 17 6) (|XFreeAlgebra| 17 6) (|XAlgebra| 6)
                 (|Algebra| 6) (|Ring|) (|NonAssociativeAlgebra| 6)
                 (|SemiRing|) (|FreeModuleCategory| 6 14) (|Rng|) (|Module| 6)
                 (|SemiRng|) (|IndexedDirectProductCategory| 6 14)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 14) (|LeftModule| $$)
                 (|RightModule| $$) (|NonAssociativeRng|) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|Comparable|)
                 (|AbelianSemiGroup|) (|Magma|) (|SetCategory|)
                 (|RetractableTo| 6) (|RetractableTo| 14) (|noZeroDivisors|)
                 (|CoercibleTo| 8) (|BasicType|) (|unitsKnown|)
                 (|CoercibleFrom| 6) (|CoercibleFrom| 14))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
