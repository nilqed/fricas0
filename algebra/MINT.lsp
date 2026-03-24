
(SDEFUN |MINT;maxint;Pi;1| ((% (|PositiveInteger|))) (QREFELT % 6)) 

(SDEFUN |MINT;maxint;2Pi;2|
        ((|new| (|PositiveInteger|)) (% (|PositiveInteger|)))
        (SPROG ((|old| (|PositiveInteger|)))
               (SEQ (LETT |old| (QREFELT % 6)) (SETELT % 6 |new|)
                    (EXIT |old|)))) 

(SDEFUN |MINT;coerce;EE;3|
        ((|u| (|Expression| (|Integer|))) (% (|Expression| %)))
        (SPADCALL (ELT % 10) |u| (QREFELT % 15))) 

(SDEFUN |MINT;coerce;I%;4| ((|u| (|Integer|)) (% (%)))
        (SPROG ((|message| (|String|)))
               (SEQ
                (COND
                 ((> (ABS |u|) (QREFELT % 6))
                  (SEQ
                   (LETT |message|
                         (SPADCALL
                          (LIST (STRINGIMAGE |u|) "  > MAXINT("
                                (STRINGIMAGE (QREFELT % 6)) ")")
                          (QREFELT % 20)))
                   (EXIT (|error| |message|))))
                 ('T |u|))))) 

(PUT '|MINT;retract;%I;5| '|SPADreplace| '(XLAM (|u|) |u|)) 

(SDEFUN |MINT;retract;%I;5| ((|u| (%)) (% (|Integer|))) |u|) 

(PUT '|MINT;retractIfCan;%U;6| '|SPADreplace| '(XLAM (|u|) (CONS 0 |u|))) 

(SDEFUN |MINT;retractIfCan;%U;6| ((|u| (%)) (% (|Union| (|Integer|) "failed")))
        (CONS 0 |u|)) 

(DECLAIM (NOTINLINE |MachineInteger;|)) 

(DEFUN |MachineInteger;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MachineInteger|))
          (LETT % (GETREFV 45))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|MachineInteger| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (EXPT 2 32))
          %))) 

(DEFUN |MachineInteger| ()
  (SPROG NIL
         (PROG (#1=#:G36)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MachineInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MachineInteger|
                             (LIST (CONS NIL (CONS 1 (|MachineInteger;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|MachineInteger|)))))))))) 

(MAKEPROP '|MachineInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) 'MAXINT (|PositiveInteger|)
              |MINT;maxint;Pi;1| |MINT;maxint;2Pi;2| |MINT;coerce;I%;4|
              (|Expression| $$) (|Mapping| $$ 5) (|Expression| 5)
              (|ExpressionFunctions2| 5 $$) (0 . |map|) (|Expression| %)
              |MINT;coerce;EE;3| (|List| %) (|String|) (6 . |concat|)
              |MINT;retract;%I;5| (|Union| 5 '"failed")
              |MINT;retractIfCan;%U;6| (|Boolean|) (|OutputForm|)
              (|Union| % '"failed") (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| 30 '"failed") (|Fraction| 5) (|Float|) (|DoubleFloat|)
              (|Pattern| 5) (|PatternMatchResult| 5 %) (|InputForm|)
              (|Record| (|:| |coef| 18) (|:| |generator| %))
              (|Union| 18 '"failed")
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 40 '"failed")
              (|Factored| %) (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %)))
           '#(~= 11 |zero?| 17 |unitNormal| 22 |unitCanonical| 27 |unit?| 32
              |symmetricRemainder| 37 |subtractIfCan| 43 |submod| 49
              |squareFreePart| 56 |squareFree| 61 |smaller?| 66 |sizeLess?| 72
              |sign| 78 |shift| 83 |sample| 89 |rightRecip| 93 |rightPower| 98
              |retractIfCan| 110 |retract| 115 |rem| 120 |recip| 126
              |rationalIfCan| 131 |rational?| 136 |rational| 141 |random| 146
              |quo| 151 |principalIdeal| 157 |prime?| 162 |powmod| 167
              |positiveRemainder| 174 |positive?| 180 |plenaryPower| 185
              |permutation| 191 |patternMatch| 197 |opposite?| 204 |one?| 210
              |odd?| 215 |nextItem| 220 |negative?| 225 |multiEuclidean| 230
              |mulmod| 236 |min| 243 |maxint| 249 |max| 258 |mask| 264 |length|
              269 |leftRecip| 274 |leftPower| 279 |lcmCoef| 291 |lcm| 297
              |latex| 308 |invmod| 313 |init| 319 |inc| 323 |gcdPolynomial| 328
              |gcd| 334 |factorial| 345 |factor| 350 |extendedEuclidean| 355
              |exquo| 368 |expressIdealMember| 374 |even?| 380 |euclideanSize|
              385 |divide| 390 |differentiate| 396 |dec| 407 |copy| 412
              |convert| 417 |commutator| 442 |coerce| 448 |characteristic| 468
              |bit?| 472 |binomial| 478 |base| 484 |associator| 488
              |associates?| 495 |antiCommutator| 501 |annihilate?| 507 |addmod|
              513 |abs| 520 ^ 525 |Zero| 537 |One| 541 D 545 >= 556 > 562 = 568
              <= 574 < 580 - 586 + 597 * 603)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL NIL NIL NIL
                NIL |OrderedRing&| |Algebra&| |EntireRing&| NIL
                |DifferentialRing&| NIL NIL |Rng&| |NonAssociativeAlgebra&| NIL
                |Module&| |NonAssociativeRing&| NIL NIL NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                NIL |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&|
                NIL |OrderedSet&| |AbelianSemiGroup&| |Magma&| NIL NIL NIL
                |SetCategory&| NIL |RetractableTo&| NIL NIL |BasicType&| NIL
                NIL NIL |PartialOrder&| NIL NIL NIL NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|OrderedIntegralDomain|)
                 (|FortranMachineTypeCategory|) (|IntegralDomain|)
                 (|CommutativeRing|) (|LeftOreRing|) (|OrderedRing|)
                 (|Algebra| $$) (|EntireRing|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|Ring|) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|SemiRng|) (|Module| $$)
                 (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|OrderedAbelianGroup|) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|OrderedSet|) (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|PatternMatchable| 5) (|StepThrough|) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| 5) (|RealConstant|)
                 (|CoercibleTo| 25) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|PartialOrder|)
                 (|CoercibleFrom| 5) (|ConvertibleTo| 5) (|ConvertibleTo| 35)
                 (|ConvertibleTo| 33) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 32) (|ConvertibleTo| 31)
                 (|canonicalUnitNormal|) (|multiplicativeValuation|))
              (|makeByteWordVec2| 44
                                  '(2 14 11 12 13 15 1 19 0 18 20 2 0 24 0 0 1
                                    1 0 24 0 1 1 0 28 0 1 1 0 0 0 1 1 0 24 0 1
                                    2 0 0 0 0 1 2 0 26 0 0 1 3 0 0 0 0 0 1 1 0
                                    0 0 1 1 0 42 0 1 2 0 24 0 0 1 2 0 24 0 0 1
                                    1 0 5 0 1 2 0 0 0 0 1 0 0 0 1 1 0 26 0 1 2
                                    0 0 0 7 1 2 0 0 0 27 1 1 0 22 0 23 1 0 5 0
                                    21 2 0 0 0 0 1 1 0 26 0 1 1 0 29 0 1 1 0 24
                                    0 1 1 0 30 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 36
                                    18 1 1 0 24 0 1 3 0 0 0 0 0 1 2 0 0 0 0 1 1
                                    0 24 0 1 2 0 0 0 7 1 2 0 0 0 0 1 3 0 34 0
                                    33 34 1 2 0 24 0 0 1 1 0 24 0 1 1 0 24 0 1
                                    1 0 26 0 1 1 0 24 0 1 2 0 37 18 0 1 3 0 0 0
                                    0 0 1 2 0 0 0 0 1 0 0 7 8 1 0 7 7 9 2 0 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 26 0 1 2 0 0 0
                                    7 1 2 0 0 0 27 1 2 0 44 0 0 1 1 0 0 18 1 2
                                    0 0 0 0 1 1 0 19 0 1 2 0 0 0 0 1 0 0 0 1 1
                                    0 0 0 1 2 0 43 43 43 1 1 0 0 18 1 2 0 0 0 0
                                    1 1 0 0 0 1 1 0 42 0 1 2 0 39 0 0 1 3 0 41
                                    0 0 0 1 2 0 26 0 0 1 2 0 37 18 0 1 1 0 24 0
                                    1 1 0 27 0 1 2 0 38 0 0 1 1 0 0 0 1 2 0 0 0
                                    27 1 1 0 0 0 1 1 0 0 0 1 1 0 31 0 1 1 0 32
                                    0 1 1 0 33 0 1 1 0 5 0 1 1 0 35 0 1 2 0 0 0
                                    0 1 1 0 25 0 1 1 0 0 5 10 1 0 0 0 1 1 0 16
                                    13 17 0 0 27 1 2 0 24 0 0 1 2 0 0 0 0 1 0 0
                                    0 1 3 0 0 0 0 0 1 2 0 24 0 0 1 2 0 0 0 0 1
                                    2 0 24 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 7 1 2 0 0 0 27 1 0 0 0 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 27 1 2 0 24 0 0 1 2 0 24 0 0 1 2
                                    0 24 0 0 1 2 0 24 0 0 1 2 0 24 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 7 0 1 2 0
                                    0 0 0 1 2 0 0 5 0 1 2 0 0 27 0 1)))))
           '|lookupComplete|)) 
