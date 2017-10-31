
(SDEFUN |JORDAN;*;3$;1| ((|a| $) (|b| $) ($ $))
        (COND
         ((SPADCALL (QREFELT $ 11) (QREFELT $ 16))
          (|error|
           "constructor must no be called with Ring of characteristic 2"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |a| |b| (QREFELT $ 17))
                     (SPADCALL |b| |a| (QREFELT $ 17)) (QREFELT $ 18))
           (QREFELT $ 14) (QREFELT $ 19))))) 

(PUT '|JORDAN;coerce;$A;2| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |JORDAN;coerce;$A;2| ((|a| $) ($ A)) |a|) 

(PUT '|JORDAN;coerce;A$;3| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |JORDAN;coerce;A$;3| ((|a| A) ($ $)) |a|) 

(PUT '|JORDAN;^;$Pi$;4| '|SPADreplace| '(XLAM (|a| |n|) |a|)) 

(SDEFUN |JORDAN;^;$Pi$;4| ((|a| $) (|n| |PositiveInteger|) ($ $)) |a|) 

(DECLAIM (NOTINLINE |AssociatedJordanAlgebra;|)) 

(DEFUN |AssociatedJordanAlgebra| (&REST #1=#:G716)
  (SPROG NIL
         (PROG (#2=#:G717)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AssociatedJordanAlgebra|)
                                               '|domainEqualList|)
                    . #3=(|AssociatedJordanAlgebra|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AssociatedJordanAlgebra;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AssociatedJordanAlgebra|)))))))))) 

(DEFUN |AssociatedJordanAlgebra;| (|#1| |#2|)
  (SPROG
   ((#1=#:G692 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|AssociatedJordanAlgebra|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|AssociatedJordanAlgebra| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 41) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       (LIST
                                                        '|FramedNonAssociativeAlgebra|
                                                        (|devaluate| |#1|)))
                                        (|HasCategory| |#2|
                                                       (LIST
                                                        '|FiniteRankNonAssociativeAlgebra|
                                                        (|devaluate| |#1|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#2|
                                                         (LIST
                                                          '|FiniteRankNonAssociativeAlgebra|
                                                          (|devaluate| |#1|))))
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
                                                         (|devaluate| |#1|)))
                                         (|HasCategory| |#2|
                                                        (LIST
                                                         '|FramedNonAssociativeAlgebra|
                                                         (|devaluate| |#1|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST
                                                             '|FramedNonAssociativeAlgebra|
                                                             (|devaluate|
                                                              |#1|))))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|AssociatedJordanAlgebra| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 5 |#2|)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 |#2|)
    (QSETREFV $ 11
              (SPADCALL (|spadConstant| $ 9) (|spadConstant| $ 9)
                        (QREFELT $ 10)))
    (QSETREFV $ 14
              (PROG2
                  (LETT #1# #3=(SPADCALL (QREFELT $ 11) (QREFELT $ 13)) . #2#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) #3# (|Union| #3# "failed")
                                #1#)))
    $))) 

(MAKEPROP '|AssociatedJordanAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#2|) (|local| |#1|) (|local| |#2|)
              '|Rep| (0 . |One|) (4 . +) '|two| (|Union| $ '"failed")
              (10 . |recip|) '|oneHalf| (|Boolean|) (15 . |zero?|) (20 . *)
              (26 . +) (32 . *) |JORDAN;*;3$;1| |JORDAN;coerce;$A;2|
              |JORDAN;coerce;A$;3| (|PositiveInteger|) |JORDAN;^;$Pi$;4|
              (|SparseUnivariatePolynomial| (|Polynomial| 6))
              (|Record| (|:| |particular| $) (|:| |basis| (|List| $)))
              (|Union| 26 '"failed") (|SparseUnivariatePolynomial| 6)
              (|List| 32) (|Matrix| 6) (|Vector| $) (|Vector| 6) (|Vector| 30)
              (|List| (|Polynomial| 6)) (|Integer|) (|NonNegativeInteger|)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 38 |zero?| 44 |unit| 49 |subtractIfCan| 53
              |structuralConstants| 59 |someBasis| 68 |sample| 72 |rightUnits|
              76 |rightUnit| 80 |rightTraceMatrix| 84 |rightTrace| 93
              |rightRegularRepresentation| 98 |rightRecip| 109
              |rightRankPolynomial| 114 |rightPower| 118 |rightNorm| 124
              |rightMinimalPolynomial| 129 |rightDiscriminant| 134
              |rightCharacteristicPolynomial| 143 |rightAlternative?| 148
              |represents| 152 |recip| 163 |rank| 168 |powerAssociative?| 172
              |plenaryPower| 176 |opposite?| 182 |noncommutativeJordanAlgebra?|
              188 |lieAlgebra?| 192 |lieAdmissible?| 196 |leftUnits| 200
              |leftUnit| 204 |leftTraceMatrix| 208 |leftTrace| 217
              |leftRegularRepresentation| 222 |leftRecip| 233
              |leftRankPolynomial| 238 |leftPower| 242 |leftNorm| 248
              |leftMinimalPolynomial| 253 |leftDiscriminant| 258
              |leftCharacteristicPolynomial| 267 |leftAlternative?| 272 |latex|
              276 |jordanAlgebra?| 281 |jordanAdmissible?| 285
              |jacobiIdentity?| 289 |hashUpdate!| 293 |hash| 299 |flexible?|
              304 |elt| 308 |coordinates| 314 |convert| 336
              |conditionsForIdempotents| 346 |commutator| 355 |commutative?|
              361 |coerce| 365 |basis| 380 |associatorDependence| 384
              |associator| 388 |associative?| 395 |apply| 399 |antiCommutator|
              405 |antiCommutative?| 411 |antiAssociative?| 415 |alternative?|
              419 ^ 423 |Zero| 429 = 433 - 439 + 450 * 456)
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
                 (|CoercibleTo| 7) (|BasicType|) (|CoercibleTo| 40)
                 (|unitsKnown|))
              (|makeByteWordVec2| 40
                                  '(0 6 0 9 2 6 0 0 0 10 1 6 12 0 13 1 6 15 0
                                    16 2 8 0 0 0 17 2 8 0 0 0 18 2 0 0 0 6 19 2
                                    0 15 0 0 1 1 0 15 0 1 0 3 12 1 2 0 12 0 0 1
                                    1 2 33 31 1 0 1 33 1 0 2 31 1 0 0 0 1 0 3
                                    27 1 0 3 12 1 1 2 30 31 1 0 1 30 1 1 2 6 0
                                    1 2 2 30 0 31 1 1 1 30 0 1 1 3 12 0 1 0 5
                                    25 1 2 0 0 0 23 1 1 2 6 0 1 1 3 28 0 1 1 2
                                    6 31 1 0 1 6 1 1 2 28 0 1 0 2 15 1 2 2 0 32
                                    31 1 1 1 0 32 1 1 3 12 0 1 0 2 23 1 0 2 15
                                    1 2 0 0 0 23 1 2 0 15 0 0 1 0 2 15 1 0 2 15
                                    1 0 2 15 1 0 3 27 1 0 3 12 1 1 2 30 31 1 0
                                    1 30 1 1 2 6 0 1 2 2 30 0 31 1 1 1 30 0 1 1
                                    3 12 0 1 0 5 25 1 2 0 0 0 23 1 1 2 6 0 1 1
                                    3 28 0 1 1 2 6 31 1 0 1 6 1 1 2 28 0 1 0 2
                                    15 1 1 0 37 0 1 0 2 15 1 0 2 15 1 0 2 15 1
                                    2 0 39 39 0 1 1 0 38 0 1 0 2 15 1 2 1 6 0
                                    35 1 2 2 32 0 31 1 2 2 30 31 31 1 1 1 30 31
                                    1 1 1 32 0 1 1 1 0 32 1 1 1 32 0 1 1 2 34
                                    31 1 0 1 34 1 2 0 0 0 0 1 0 2 15 1 1 0 0 5
                                    22 1 0 5 0 21 1 0 40 0 1 0 1 31 1 0 3 29 1
                                    3 0 0 0 0 0 1 0 2 15 1 2 1 0 30 0 1 2 0 0 0
                                    0 1 0 2 15 1 0 2 15 1 0 2 15 1 2 0 0 0 23
                                    24 0 0 0 1 2 0 15 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 6 0 1 2 0 0 0 6 19 2 0
                                    0 36 0 1 2 0 0 35 0 1 2 0 0 0 0 20 2 0 0 23
                                    0 1)))))
           '|lookupComplete|)) 
