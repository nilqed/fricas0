
(DECLAIM (NOTINLINE |BalancedPAdicInteger;|)) 

(DEFUN |BalancedPAdicInteger| (#1=#:G714)
  (SPROG NIL
         (PROG (#2=#:G715)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|BalancedPAdicInteger|)
                                               '|domainEqualList|)
                    . #3=(|BalancedPAdicInteger|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|BalancedPAdicInteger;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|BalancedPAdicInteger|)))))))))) 

(DEFUN |BalancedPAdicInteger;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|BalancedPAdicInteger|))
          (LETT |dv$| (LIST '|BalancedPAdicInteger| DV$1) . #1#)
          (LETT $ (GETREFV 28) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|BalancedPAdicInteger| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|BalancedPAdicInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerPAdicInteger| 6 (NRTEVAL 'NIL))
              (|local| |#1|) (|SparseUnivariatePolynomial| 8) (|Integer|)
              (|Stream| 8) (|NonNegativeInteger|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 11 '#1="failed") (|Union| 14 '#1#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Boolean|)
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 14) (|:| |generator| $))
              (|Union| $ '"failed")
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|PositiveInteger|) (|HashState|) (|String|) (|OutputForm|)
              (|SingleInteger|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0))
            (CONS
             '#(NIL |EuclideanDomain&| NIL |GcdDomain&| NIL NIL |Algebra&| NIL
                NIL |EntireRing&| |Module&| NIL |Ring&| NIL |Rng&| NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |SetCategory&| NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|PAdicIntegerCategory| 6) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|Algebra| $$) (|CommutativeRing|)
                 (|CharacteristicZero|) (|EntireRing|) (|Module| $$)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 26))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
