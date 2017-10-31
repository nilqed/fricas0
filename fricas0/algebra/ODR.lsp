
(PUT '|ODR;coerce;R$;1| '|SPADreplace| '(XLAM (|u|) |u|)) 

(SDEFUN |ODR;coerce;R$;1| ((|u| R) ($ $)) |u|) 

(PUT '|ODR;coerce;$R;2| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |ODR;coerce;$R;2| ((|p| $) ($ R)) |p|) 

(SDEFUN |ODR;differentiate;2$;3| ((|p| $) ($ $))
        (SPADCALL |p| (QREFELT $ 8) (QREFELT $ 12))) 

(SDEFUN |ODR;/;3$;4| ((|p| $) (|q| $) ($ $))
        (SPADCALL (SPADCALL |p| (QREFELT $ 11)) (SPADCALL |q| (QREFELT $ 11))
                  (QREFELT $ 14))) 

(SDEFUN |ODR;^;$I$;5| ((|p| $) (|n| |Integer|) ($ $))
        (SPADCALL (SPADCALL |p| (QREFELT $ 11)) |n| (QREFELT $ 17))) 

(SDEFUN |ODR;inv;2$;6| ((|p| $) ($ $))
        (SPADCALL (SPADCALL |p| (QREFELT $ 11)) (QREFELT $ 19))) 

(DECLAIM (NOTINLINE |OrdinaryDifferentialRing;|)) 

(DEFUN |OrdinaryDifferentialRing| (&REST #1=#:G731)
  (SPROG NIL
         (PROG (#2=#:G732)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|OrdinaryDifferentialRing|)
                                               '|domainEqualList|)
                    . #3=(|OrdinaryDifferentialRing|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |OrdinaryDifferentialRing;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrdinaryDifferentialRing|)))))))))) 

(DEFUN |OrdinaryDifferentialRing;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|OrdinaryDifferentialRing|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|OrdinaryDifferentialRing| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 41) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2| '(|Field|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|OrdinaryDifferentialRing|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 5 |#2|)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 |#2|)
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 15 (CONS (|dispatchFunction| |ODR;/;3$;4|) $))
             (QSETREFV $ 18 (CONS (|dispatchFunction| |ODR;^;$I$;5|) $))
             (QSETREFV $ 20 (CONS (|dispatchFunction| |ODR;inv;2$;6|) $)))))
          $))) 

(MAKEPROP '|OrdinaryDifferentialRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#2|) (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| |ODR;coerce;R$;1| |ODR;coerce;$R;2|
              (0 . |differentiate|) |ODR;differentiate;2$;3| (6 . /) (12 . /)
              (|Integer|) (18 . ^) (24 . ^) (30 . |inv|) (35 . |inv|)
              (|Fraction| 16) (|Factored| $) (|Boolean|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 24 '#1="failed") (|Union| 27 '#1#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|NonNegativeInteger|)
              (|Record| (|:| |coef| 27) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Union| $ '"failed") (|PositiveInteger|) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 40 |zero?| 46 |unitNormal| 51 |unitCanonical| 56 |unit?| 61
              |subtractIfCan| 66 |squareFreePart| 72 |squareFree| 77
              |sizeLess?| 82 |sample| 88 |rem| 92 |recip| 98 |quo| 103
              |principalIdeal| 109 |prime?| 114 |opposite?| 119 |one?| 125
              |multiEuclidean| 130 |lcmCoef| 136 |lcm| 142 |latex| 153 |inv|
              158 |hashUpdate!| 163 |hash| 169 |gcdPolynomial| 174 |gcd| 180
              |factor| 191 |extendedEuclidean| 196 |exquo| 209
              |expressIdealMember| 215 |euclideanSize| 221 |divide| 226
              |differentiate| 232 |coerce| 243 |characteristic| 273
              |associates?| 277 |annihilate?| 283 ^ 289 |Zero| 307 |One| 311 D
              315 = 326 / 332 - 338 + 349 * 355)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(1 1 1 1 1 1 1 1 1 1 0 1 1 1 1 0 0 1 0 0 0 1 1
                                  0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1))
            (CONS
             '#(|Field&| |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| NIL |DivisionRing&| |Algebra&| NIL |Algebra&|
                |DifferentialRing&| |Module&| NIL |EntireRing&| |Module&| NIL
                |Ring&| NIL NIL |Rng&| NIL NIL NIL |AbelianGroup&| NIL NIL
                |Monoid&| NIL |AbelianMonoid&| |SemiGroup&| |AbelianSemiGroup&|
                |SetCategory&| NIL |BasicType&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|Field|) (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|Algebra| $$) (|LeftOreRing|) (|Algebra| 21)
                 (|DifferentialRing|) (|Module| $$) (|CommutativeRing|)
                 (|EntireRing|) (|Module| 21) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 21 21) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|LeftModule| 21) (|RightModule| 21)
                 (|AbelianGroup|) (|SemiRing|) (|CancellationAbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|AbelianMonoid|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 40) (|CommutativeStar|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|))
              (|makeByteWordVec2| 40
                                  '(2 9 0 0 6 12 2 5 0 0 0 14 2 0 0 0 0 15 2 5
                                    0 0 16 17 2 0 0 0 16 18 1 5 0 0 19 1 0 0 0
                                    20 2 0 23 0 0 1 1 0 23 0 1 1 1 34 0 1 1 1 0
                                    0 1 1 1 23 0 1 2 0 35 0 0 1 1 1 0 0 1 1 1
                                    22 0 1 2 1 23 0 0 1 0 0 0 1 2 1 0 0 0 1 1 0
                                    35 0 1 2 1 0 0 0 1 1 1 31 27 1 1 1 23 0 1 2
                                    0 23 0 0 1 1 0 23 0 1 2 1 26 27 0 1 2 1 33
                                    0 0 1 1 1 0 27 1 2 1 0 0 0 1 1 0 37 0 1 1 1
                                    0 0 20 2 0 39 39 0 1 1 0 38 0 1 2 1 32 32
                                    32 1 1 1 0 27 1 2 1 0 0 0 1 1 1 22 0 1 3 1
                                    25 0 0 0 1 2 1 28 0 0 1 2 1 35 0 0 1 2 1 26
                                    27 0 1 1 1 30 0 1 2 1 29 0 0 1 1 0 0 0 13 2
                                    0 0 0 30 1 1 1 0 21 1 1 1 0 0 1 1 0 0 5 10
                                    1 0 5 0 11 1 0 0 16 1 1 0 40 0 1 0 0 30 1 2
                                    1 23 0 0 1 2 0 23 0 0 1 2 1 0 0 16 18 2 0 0
                                    0 36 1 2 0 0 0 30 1 0 0 0 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 30 1 2 0 23 0 0 1 2 1 0 0 0 15 2
                                    0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 1 0 0 21
                                    1 2 1 0 21 0 1 2 0 0 30 0 1 2 0 0 16 0 1 2
                                    0 0 0 0 1 2 0 0 36 0 1 2 0 0 0 0 1)))))
           '|lookupComplete|)) 
