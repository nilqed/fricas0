
(SDEFUN |LIE;*;3$;1| ((|a| $) (|b| $) ($ $))
        (SPADCALL (SPADCALL |a| |b| (QREFELT $ 9))
                  (SPADCALL |b| |a| (QREFELT $ 9)) (QREFELT $ 10))) 

(PUT '|LIE;coerce;$A;2| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |LIE;coerce;$A;2| ((|a| $) ($ A)) |a|) 

(PUT '|LIE;coerce;A$;3| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |LIE;coerce;A$;3| ((|a| A) ($ $)) |a|) 

(SDEFUN |LIE;^;$Pi$;4| ((|a| $) (|n| |PositiveInteger|) ($ $))
        (COND ((EQL |n| 1) |a|) ('T (|spadConstant| $ 15)))) 

(DECLAIM (NOTINLINE |AssociatedLieAlgebra;|)) 

(DEFUN |AssociatedLieAlgebra| (&REST #1=#:G714)
  (SPROG NIL
         (PROG (#2=#:G715)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AssociatedLieAlgebra|)
                                               '|domainEqualList|)
                    . #3=(|AssociatedLieAlgebra|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AssociatedLieAlgebra;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AssociatedLieAlgebra|)))))))))) 

(DEFUN |AssociatedLieAlgebra;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|AssociatedLieAlgebra|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|AssociatedLieAlgebra| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 36) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             (LIST
                                                              '|FramedNonAssociativeAlgebra|
                                                              (|devaluate|
                                                               |#1|)))
                                              (|HasCategory| |#2|
                                                             (LIST
                                                              '|FiniteRankNonAssociativeAlgebra|
                                                              (|devaluate|
                                                               |#1|)))
                                              (OR
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                (|HasCategory| |#2|
                                                               (LIST
                                                                '|FiniteRankNonAssociativeAlgebra|
                                                                (|devaluate|
                                                                 |#1|))))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                (|HasCategory| |#2|
                                                               (LIST
                                                                '|FramedNonAssociativeAlgebra|
                                                                (|devaluate|
                                                                 |#1|)))))
                                              (OR
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FiniteRankNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|)))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FramedNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FramedNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|AssociatedLieAlgebra|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 5 |#2|)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 |#2|)
          $))) 

(MAKEPROP '|AssociatedLieAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#2|) (|local| |#1|) (|local| |#2|)
              '|Rep| (0 . *) (6 . -) |LIE;*;3$;1| |LIE;coerce;$A;2|
              |LIE;coerce;A$;3| (12 . |One|) (16 . |Zero|) (|PositiveInteger|)
              |LIE;^;$Pi$;4| (|SparseUnivariatePolynomial| (|Polynomial| 6))
              (|Union| $ '#1="failed")
              (|Record| (|:| |particular| $) (|:| |basis| (|List| $)))
              (|Union| 20 '#1#) (|SparseUnivariatePolynomial| 6) (|List| 27)
              (|Boolean|) (|Matrix| 6) (|Vector| $) (|Vector| 6) (|Vector| 25)
              (|List| (|Polynomial| 6)) (|Integer|) (|NonNegativeInteger|)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 20 |zero?| 26 |unit| 31 |subtractIfCan| 35
              |structuralConstants| 41 |someBasis| 50 |sample| 54 |rightUnits|
              58 |rightUnit| 62 |rightTraceMatrix| 66 |rightTrace| 75
              |rightRegularRepresentation| 80 |rightRecip| 91
              |rightRankPolynomial| 96 |rightPower| 100 |rightNorm| 106
              |rightMinimalPolynomial| 111 |rightDiscriminant| 116
              |rightCharacteristicPolynomial| 125 |rightAlternative?| 130
              |represents| 134 |recip| 145 |rank| 150 |powerAssociative?| 154
              |plenaryPower| 158 |opposite?| 164 |noncommutativeJordanAlgebra?|
              170 |lieAlgebra?| 174 |lieAdmissible?| 178 |leftUnits| 182
              |leftUnit| 186 |leftTraceMatrix| 190 |leftTrace| 199
              |leftRegularRepresentation| 204 |leftRecip| 215
              |leftRankPolynomial| 220 |leftPower| 224 |leftNorm| 230
              |leftMinimalPolynomial| 235 |leftDiscriminant| 240
              |leftCharacteristicPolynomial| 249 |leftAlternative?| 254 |latex|
              258 |jordanAlgebra?| 263 |jordanAdmissible?| 267
              |jacobiIdentity?| 271 |hashUpdate!| 275 |hash| 281 |flexible?|
              286 |elt| 290 |coordinates| 296 |convert| 318
              |conditionsForIdempotents| 328 |commutator| 337 |commutative?|
              343 |coerce| 347 |basis| 362 |associatorDependence| 366
              |associator| 370 |associative?| 377 |apply| 381 |antiCommutator|
              387 |antiCommutative?| 393 |antiAssociative?| 397 |alternative?|
              401 ^ 405 |Zero| 411 = 415 - 421 + 432 * 438)
           'NIL
           (CONS
            (|makeByteWordVec2| 4 '(1 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3))
            (CONS
             '#(|FramedNonAssociativeAlgebra&|
                |FiniteRankNonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| NIL |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL
                |NonAssociativeSemiRng&| |AbelianMonoid&| |AbelianSemiGroup&|
                |Magma&| |SetCategory&| NIL |BasicType&| NIL NIL)
             (CONS
              '#((|FramedNonAssociativeAlgebra| 6)
                 (|FiniteRankNonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 6) (|Module| 6) (|BiModule| 6 6)
                 (|NonAssociativeRng|) (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|AbelianSemiGroup|) (|Magma|) (|SetCategory|)
                 (|CoercibleTo| 7) (|BasicType|) (|CoercibleTo| 35)
                 (|unitsKnown|))
              (|makeByteWordVec2| 35
                                  '(2 8 0 0 0 9 2 8 0 0 0 10 0 6 0 14 0 0 0 15
                                    2 0 24 0 0 1 1 0 24 0 1 0 3 19 1 2 0 19 0 0
                                    1 1 2 28 26 1 0 1 28 1 0 2 26 1 0 0 0 1 0 3
                                    21 1 0 3 19 1 1 2 25 26 1 0 1 25 1 1 2 6 0
                                    1 2 2 25 0 26 1 1 1 25 0 1 1 3 19 0 1 0 5
                                    18 1 2 0 0 0 16 1 1 2 6 0 1 1 3 22 0 1 1 2
                                    6 26 1 0 1 6 1 1 2 22 0 1 0 2 24 1 2 2 0 27
                                    26 1 1 1 0 27 1 1 3 19 0 1 0 2 16 1 0 2 24
                                    1 2 0 0 0 16 1 2 0 24 0 0 1 0 2 24 1 0 2 24
                                    1 0 2 24 1 0 3 21 1 0 3 19 1 1 2 25 26 1 0
                                    1 25 1 1 2 6 0 1 2 2 25 0 26 1 1 1 25 0 1 1
                                    3 19 0 1 0 5 18 1 2 0 0 0 16 1 1 2 6 0 1 1
                                    3 22 0 1 1 2 6 26 1 0 1 6 1 1 2 22 0 1 0 2
                                    24 1 1 0 32 0 1 0 2 24 1 0 2 24 1 0 2 24 1
                                    2 0 34 34 0 1 1 0 33 0 1 0 2 24 1 2 1 6 0
                                    30 1 2 2 27 0 26 1 2 2 25 26 26 1 1 1 25 26
                                    1 1 1 27 0 1 1 1 0 27 1 1 1 27 0 1 1 2 29
                                    26 1 0 1 29 1 2 0 0 0 0 1 0 2 24 1 1 0 0 5
                                    13 1 0 5 0 12 1 0 35 0 1 0 1 26 1 0 3 23 1
                                    3 0 0 0 0 0 1 0 2 24 1 2 1 0 25 0 1 2 0 0 0
                                    0 1 0 2 24 1 0 2 24 1 0 2 24 1 2 0 0 0 16
                                    17 0 0 0 15 2 0 24 0 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 6 0 1 2 0 0 0 6 1 2 0
                                    0 31 0 1 2 0 0 30 0 1 2 0 0 0 0 11 2 0 0 16
                                    0 1)))))
           '|lookupComplete|)) 
