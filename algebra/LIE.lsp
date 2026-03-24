
(SDEFUN |LIE;*;3%;1| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL (SPADCALL |a| |b| (QREFELT % 9))
                  (SPADCALL |b| |a| (QREFELT % 9)) (QREFELT % 10))) 

(PUT '|LIE;coerce;%A;2| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |LIE;coerce;%A;2| ((|a| (%)) (% (A))) |a|) 

(PUT '|LIE;coerce;A%;3| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |LIE;coerce;A%;3| ((|a| (A)) (% (%))) |a|) 

(SDEFUN |LIE;^;%Pi%;4| ((|a| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (COND ((EQL |n| 1) |a|) ('T (|spadConstant| % 15)))) 

(DECLAIM (NOTINLINE |AssociatedLieAlgebra;|)) 

(DEFUN |AssociatedLieAlgebra;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|AssociatedLieAlgebra| DV$1 DV$2))
          (LETT % (GETREFV 38))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             (LIST
                                                              '|FramedNonAssociativeAlgebra|
                                                              (|devaluate|
                                                               |#1|)))
                                              (AND
                                               (|HasCategory| |#1| '(|Finite|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FramedNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|))))
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
                                               (|HasCategory| |#1|
                                                              '(|Hashable|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FramedNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|))))
                                              (OR
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|Finite|))
                                                (|HasCategory| |#2|
                                                               (LIST
                                                                '|FramedNonAssociativeAlgebra|
                                                                (|devaluate|
                                                                 |#1|))))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|Hashable|))
                                                (|HasCategory| |#2|
                                                               (LIST
                                                                '|FramedNonAssociativeAlgebra|
                                                                (|devaluate|
                                                                 |#1|)))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FramedNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|))))))))
          (|haddProp| |$ConstructorCache| '|AssociatedLieAlgebra|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 5 |#2|)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 |#2|)
          %))) 

(DEFUN |AssociatedLieAlgebra| (&REST #1=#:G13)
  (SPROG NIL
         (PROG (#2=#:G14)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AssociatedLieAlgebra|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AssociatedLieAlgebra;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AssociatedLieAlgebra|)))))))))) 

(MAKEPROP '|AssociatedLieAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#2|) (|local| |#1|) (|local| |#2|)
              '|Rep| (0 . *) (6 . -) |LIE;*;3%;1| |LIE;coerce;%A;2|
              |LIE;coerce;A%;3| (12 . |One|) (16 . |Zero|) (|PositiveInteger|)
              |LIE;^;%Pi%;4| (|Boolean|) (|String|) (|OutputForm|) (|Integer|)
              (|Union| % '"failed") (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| (|Polynomial| 6)) (|InputForm|)
              (|List| %) (|HashState|) (|SingleInteger|)
              (|SparseUnivariatePolynomial| 6) (|List| 37)
              (|Record| (|:| |particular| %) (|:| |basis| 26))
              (|Union| 31 '"failed") (|Vector| %) (|List| (|Polynomial| 6))
              (|Matrix| 6) (|Vector| 35) (|Vector| 6))
           '#(~= 20 |zero?| 26 |unit| 31 |subtractIfCan| 35
              |structuralConstants| 41 |someBasis| 50 |smaller?| 54 |size| 60
              |sample| 64 |rightUnits| 68 |rightUnit| 72 |rightTraceMatrix| 76
              |rightTrace| 85 |rightRegularRepresentation| 90 |rightRecip| 101
              |rightRankPolynomial| 106 |rightPower| 110 |rightNorm| 116
              |rightMinimalPolynomial| 121 |rightDiscriminant| 126
              |rightCharacteristicPolynomial| 135 |rightAlternative?| 140
              |represents| 144 |recip| 155 |rank| 160 |random| 164
              |powerAssociative?| 168 |plenaryPower| 172 |opposite?| 178
              |noncommutativeJordanAlgebra?| 184 |lookup| 188 |lieAlgebra?| 193
              |lieAdmissible?| 197 |leftUnits| 201 |leftUnit| 205
              |leftTraceMatrix| 209 |leftTrace| 218 |leftRegularRepresentation|
              223 |leftRecip| 234 |leftRankPolynomial| 239 |leftPower| 243
              |leftNorm| 249 |leftMinimalPolynomial| 254 |leftDiscriminant| 259
              |leftCharacteristicPolynomial| 268 |leftAlternative?| 273 |latex|
              277 |jordanAlgebra?| 282 |jordanAdmissible?| 286
              |jacobiIdentity?| 290 |index| 294 |hashUpdate!| 299 |hash| 305
              |flexible?| 310 |enumerate| 314 |elt| 318 |coordinates| 324
              |convert| 346 |conditionsForIdempotents| 361 |commutator| 370
              |commutative?| 376 |coerce| 380 |basis| 395
              |associatorDependence| 399 |associator| 403 |associative?| 410
              |apply| 414 |antiCommutator| 420 |antiCommutative?| 426
              |antiAssociative?| 430 |alternative?| 434 ^ 438 |Zero| 444 = 448
              - 454 + 465 * 471)
           'NIL
           (CONS
            (|makeByteWordVec2| 7
                                '(1 5 0 0 1 0 0 0 0 0 0 2 0 0 2 0 0 7 0 2 4 0 0
                                  0))
            (CONS
             '#(|FramedNonAssociativeAlgebra&|
                |FiniteRankNonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| |FramedModule&| NIL NIL NIL |NonAssociativeRng&|
                |AbelianGroup&| NIL |Finite&| |AbelianMonoid&|
                |NonAssociativeSemiRng&| NIL |Magma&| |AbelianSemiGroup&|
                |Hashable&| |SetCategory&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FramedNonAssociativeAlgebra| 6)
                 (|FiniteRankNonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 6) (|Module| 6) (|FramedModule| 6)
                 (|BiModule| 6 6) (|LeftModule| 6) (|RightModule| 6)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|Finite|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|Hashable|) (|SetCategory|)
                 (|ConvertibleTo| 25) (|unitsKnown|) (|CoercibleTo| 20)
                 (|BasicType|) (|CoercibleTo| 7))
              (|makeByteWordVec2| 37
                                  '(2 8 0 0 0 9 2 8 0 0 0 10 0 6 0 14 0 0 0 15
                                    2 0 18 0 0 1 1 0 18 0 1 0 4 22 1 2 0 22 0 0
                                    1 1 3 36 33 1 0 1 36 1 0 3 33 1 2 2 18 0 0
                                    1 0 2 23 1 0 0 0 1 0 4 32 1 0 4 22 1 1 3 35
                                    33 1 0 1 35 1 1 3 6 0 1 2 3 35 0 33 1 1 1
                                    35 0 1 1 4 22 0 1 0 8 24 1 2 0 0 0 16 1 1 3
                                    6 0 1 1 4 29 0 1 1 3 6 33 1 0 1 6 1 1 3 29
                                    0 1 0 3 18 1 2 3 0 37 33 1 1 1 0 37 1 1 4
                                    22 0 1 0 3 16 1 0 2 0 1 0 3 18 1 2 0 0 0 16
                                    1 2 0 18 0 0 1 0 3 18 1 1 2 16 0 1 0 3 18 1
                                    0 3 18 1 0 4 32 1 0 4 22 1 1 3 35 33 1 0 1
                                    35 1 1 3 6 0 1 2 3 35 0 33 1 1 1 35 0 1 1 4
                                    22 0 1 0 8 24 1 2 0 0 0 16 1 1 3 6 0 1 1 4
                                    29 0 1 1 3 6 33 1 0 1 6 1 1 3 29 0 1 0 3 18
                                    1 1 0 19 0 1 0 3 18 1 0 3 18 1 0 3 18 1 1 2
                                    0 16 1 2 6 27 27 0 1 1 6 28 0 1 0 3 18 1 0
                                    2 26 1 2 1 6 0 21 1 2 3 37 0 33 1 2 3 35 33
                                    33 1 1 1 35 33 1 1 1 37 0 1 1 2 25 0 1 1 1
                                    0 37 1 1 1 37 0 1 1 3 34 33 1 0 1 34 1 2 0
                                    0 0 0 1 0 3 18 1 1 0 20 0 1 1 0 5 0 12 1 0
                                    0 5 13 0 1 33 1 0 4 30 1 3 0 0 0 0 0 1 0 3
                                    18 1 2 1 0 35 0 1 2 0 0 0 0 1 0 3 18 1 0 3
                                    18 1 0 3 18 1 2 0 0 0 16 17 0 0 0 15 2 0 18
                                    0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 16 0 1 2 0 0 0 0 11 2 0 0 21 0 1 2 0 0 23
                                    0 1 2 0 0 6 0 1 2 0 0 0 6 1)))))
           '|lookupComplete|)) 
