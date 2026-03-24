
(PUT '|ODR;coerce;R%;1| '|SPADreplace| '(XLAM (|u|) |u|)) 

(SDEFUN |ODR;coerce;R%;1| ((|u| (R)) (% (%))) |u|) 

(PUT '|ODR;coerce;%R;2| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |ODR;coerce;%R;2| ((|p| (%)) (% (R))) |p|) 

(SDEFUN |ODR;differentiate;2%;3| ((|p| (%)) (% (%)))
        (SPADCALL |p| (QREFELT % 8) (QREFELT % 12))) 

(SDEFUN |ODR;/;3%;4| ((|p| (%)) (|q| (%)) (% (%)))
        (SPADCALL (SPADCALL |p| (QREFELT % 11)) (SPADCALL |q| (QREFELT % 11))
                  (QREFELT % 14))) 

(SDEFUN |ODR;^;%I%;5| ((|p| (%)) (|n| (|Integer|)) (% (%)))
        (SPADCALL (SPADCALL |p| (QREFELT % 11)) |n| (QREFELT % 17))) 

(SDEFUN |ODR;inv;2%;6| ((|p| (%)) (% (%)))
        (SPADCALL (SPADCALL |p| (QREFELT % 11)) (QREFELT % 19))) 

(DECLAIM (NOTINLINE |OrdinaryDifferentialRing;|)) 

(DEFUN |OrdinaryDifferentialRing;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 |#3|)
          (LETT |dv$| (LIST '|OrdinaryDifferentialRing| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 39))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|Field|))))))
          (|haddProp| |$ConstructorCache| '|OrdinaryDifferentialRing|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 5 |#2|)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 |#2|)
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 15 (CONS (|dispatchFunction| |ODR;/;3%;4|) %))
             (QSETREFV % 18 (CONS (|dispatchFunction| |ODR;^;%I%;5|) %))
             (QSETREFV % 20 (CONS (|dispatchFunction| |ODR;inv;2%;6|) %)))))
          %))) 

(DEFUN |OrdinaryDifferentialRing| (&REST #1=#:G21)
  (SPROG NIL
         (PROG (#2=#:G22)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|OrdinaryDifferentialRing|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |OrdinaryDifferentialRing;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrdinaryDifferentialRing|)))))))))) 

(MAKEPROP '|OrdinaryDifferentialRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#2|) (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| |ODR;coerce;R%;1| |ODR;coerce;%R;2|
              (0 . |differentiate|) |ODR;differentiate;2%;3| (6 . /) (12 . /)
              (|Integer|) (18 . ^) (24 . ^) (30 . |inv|) (35 . |inv|)
              (|Boolean|) (|OutputForm|) (|String|) (|PositiveInteger|)
              (|NonNegativeInteger|) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 29 '"failed")
              (|Record| (|:| |coef| 29) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 34 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|Fraction| 16))
           '#(~= 40 |zero?| 46 |unitNormal| 51 |unitCanonical| 56 |unit?| 61
              |subtractIfCan| 66 |squareFreePart| 72 |squareFree| 77
              |sizeLess?| 82 |sample| 88 |rightRecip| 92 |rightPower| 97 |rem|
              109 |recip| 115 |quo| 120 |principalIdeal| 126 |prime?| 131
              |plenaryPower| 136 |opposite?| 142 |one?| 148 |multiEuclidean|
              153 |leftRecip| 159 |leftPower| 164 |lcmCoef| 176 |lcm| 182
              |latex| 193 |inv| 198 |gcdPolynomial| 203 |gcd| 209 |factor| 220
              |extendedEuclidean| 225 |exquo| 238 |expressIdealMember| 244
              |euclideanSize| 250 |divide| 255 |differentiate| 261 |commutator|
              272 |coerce| 278 |characteristic| 308 |associator| 312
              |associates?| 319 |antiCommutator| 325 |annihilate?| 331 ^ 337
              |Zero| 355 |One| 359 D 363 = 374 / 380 - 386 + 397 * 403)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(1 1 1 1 1 1 1 1 1 1 1 1 0 0 1 1 0 0 1 1 0 1 0
                                  0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 1 1 0
                                  0 0))
            (CONS
             '#(|Field&| |EuclideanDomain&| |UniqueFactorizationDomain&| NIL
                |GcdDomain&| NIL |DivisionRing&| NIL NIL |Algebra&|
                |EntireRing&| |Algebra&| |DifferentialRing&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| |Rng&| NIL
                |Module&| |Module&| NIL NIL |NonAssociativeRing&| NIL NIL NIL
                NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| |AbelianMonoid&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |Magma&| NIL |SetCategory&| NIL NIL NIL NIL
                NIL |BasicType&| NIL)
             (CONS
              '#((|Field|) (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 38) (|EntireRing|) (|Algebra| $$)
                 (|DifferentialRing|) (|Ring|) (|NonAssociativeAlgebra| 38)
                 (|NonAssociativeAlgebra| $$) (|Rng|) (|SemiRing|)
                 (|Module| 38) (|Module| $$) (|SemiRng|) (|BiModule| 38 38)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|RightModule| 38)
                 (|LeftModule| 38) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|) (|Magma|)
                 (|CommutativeStar|) (|SetCategory|) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|CoercibleTo| 22) (|BasicType|) (|unitsKnown|))
              (|makeByteWordVec2| 38
                                  '(2 9 0 0 6 12 2 5 0 0 0 14 2 0 0 0 0 15 2 5
                                    0 0 16 17 2 0 0 0 16 18 1 5 0 0 19 1 0 0 0
                                    20 2 0 21 0 0 1 1 0 21 0 1 1 1 27 0 1 1 1 0
                                    0 1 1 1 21 0 1 2 0 26 0 0 1 1 1 0 0 1 1 1
                                    37 0 1 2 1 21 0 0 1 0 0 0 1 1 0 26 0 1 2 0
                                    0 0 25 1 2 0 0 0 24 1 2 1 0 0 0 1 1 0 26 0
                                    1 2 1 0 0 0 1 1 1 32 29 1 1 1 21 0 1 2 1 0
                                    0 24 1 2 0 21 0 0 1 1 0 21 0 1 2 1 31 29 0
                                    1 1 0 26 0 1 2 0 0 0 25 1 2 0 0 0 24 1 2 1
                                    28 0 0 1 2 1 0 0 0 1 1 1 0 29 1 1 0 23 0 1
                                    1 1 0 0 20 2 1 30 30 30 1 1 1 0 29 1 2 1 0
                                    0 0 1 1 1 37 0 1 3 1 35 0 0 0 1 2 1 36 0 0
                                    1 2 1 26 0 0 1 2 1 31 29 0 1 1 1 25 0 1 2 1
                                    33 0 0 1 2 0 0 0 25 1 1 0 0 0 13 2 0 0 0 0
                                    1 1 0 22 0 1 1 0 0 16 1 1 0 5 0 11 1 0 0 5
                                    10 1 1 0 0 1 1 1 0 38 1 0 0 25 1 3 0 0 0 0
                                    0 1 2 1 21 0 0 1 2 0 0 0 0 1 2 0 21 0 0 1 2
                                    0 0 0 25 1 2 0 0 0 24 1 2 1 0 0 16 18 0 0 0
                                    1 0 0 0 1 2 0 0 0 25 1 1 0 0 0 1 2 0 21 0 0
                                    1 2 1 0 0 0 15 2 0 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 24 0 1 2 0 0 25 0 1
                                    2 0 0 16 0 1 2 1 0 0 38 1 2 1 0 38 0 1)))))
           '|lookupComplete|)) 
