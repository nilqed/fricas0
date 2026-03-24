
(DECLAIM (NOTINLINE |BalancedPAdicInteger;|)) 

(DEFUN |BalancedPAdicInteger;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|BalancedPAdicInteger| DV$1))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BalancedPAdicInteger| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |BalancedPAdicInteger| (#1=#:G15)
  (SPROG NIL
         (PROG (#2=#:G16)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|BalancedPAdicInteger|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|BalancedPAdicInteger;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|BalancedPAdicInteger|)))))))))) 

(MAKEPROP '|BalancedPAdicInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerPAdicInteger| (NRTEVAL (QREFELT % 6)) (NRTEVAL 'NIL))
              (|local| |#1|) (|Boolean|) (|OutputForm|) (|String|)
              (|PositiveInteger|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 16 '"failed")
              (|Record| (|:| |coef| 16) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 22 '"failed")
              (|Stream| 11) (|SparseUnivariatePolynomial| 11))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(NIL |EuclideanDomain&| NIL |GcdDomain&| NIL NIL NIL |Algebra&|
                |EntireRing&| NIL NIL NIL |Rng&| |NonAssociativeAlgebra&| NIL
                |Module&| |NonAssociativeRing&| NIL NIL |NonAssociativeRng&|
                NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |Magma&| |SetCategory&| NIL NIL
                |BasicType&| NIL NIL NIL)
             (CONS
              '#((|PAdicIntegerCategory| 6) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|Algebra| $$)
                 (|EntireRing|) (|CharacteristicZero|) (|Ring|) (|SemiRing|)
                 (|Rng|) (|NonAssociativeAlgebra| $$) (|SemiRng|) (|Module| $$)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|) (|Magma|)
                 (|SetCategory|) (|CommutativeStar|) (|CoercibleTo| 8)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|noZeroDivisors|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
