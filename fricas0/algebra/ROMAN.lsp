
(SDEFUN |ROMAN;roman;I$;1| ((|n| |Integer|) ($ $)) (SPADCALL |n| (QREFELT $ 6))) 

(SDEFUN |ROMAN;roman;S$;2| ((|sy| |Symbol|) ($ $))
        (SPADCALL |sy| (QREFELT $ 9))) 

(SDEFUN |ROMAN;convert;S$;3| ((|sy| |Symbol|) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |sy| (QREFELT $ 12)) (QREFELT $ 15))
                  (QREFELT $ 6))) 

(SDEFUN |ROMAN;coerce;$Of;4| ((|r| $) ($ |OutputForm|))
        (SPROG ((#1=#:G721 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |r| (QREFELT $ 16))
                      . #2=(|ROMAN;coerce;$Of;4|))
                (EXIT
                 (COND ((ZEROP |n|) (SPADCALL |n| (QREFELT $ 18)))
                       ((MINUSP |n|)
                        (SPADCALL
                         (SPADCALL (SPADCALL |r| (QREFELT $ 19))
                                   (QREFELT $ 20))
                         (QREFELT $ 21)))
                       ('T
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (PROG1 (LETT #1# |n| . #2#)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 22))
                          (QREFELT $ 23))
                         (QREFELT $ 24)))))))) 

(DECLAIM (NOTINLINE |RomanNumeral;|)) 

(DEFUN |RomanNumeral| ()
  (SPROG NIL
         (PROG (#1=#:G766)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|RomanNumeral|)
                    . #2=(|RomanNumeral|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|RomanNumeral|
                             (LIST (CONS NIL (CONS 1 (|RomanNumeral;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|RomanNumeral|)))))))))) 

(DEFUN |RomanNumeral;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|RomanNumeral|) . #1=(|RomanNumeral|))
          (LETT $ (GETREFV 53) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RomanNumeral| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RomanNumeral| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) (0 . |coerce|) |ROMAN;roman;I$;1|
              (|Symbol|) |ROMAN;convert;S$;3| |ROMAN;roman;S$;2| (|String|)
              (5 . |string|) (|PositiveInteger|) (|NumberFormats|)
              (10 . |ScanRoman|) (15 . |convert|) (|OutputForm|)
              (20 . |coerce|) (25 . -) |ROMAN;coerce;$Of;4| (30 . -)
              (35 . |FormatRoman|) (40 . |coerce|) (45 . |coerce|)
              (|Union| 27 '"failed") (|Boolean|) (|Fraction| 5)
              (|Union| $ '"failed") (|DoubleFloat|) (|Float|)
              (|PatternMatchResult| 5 $) (|Pattern| 5) (|Matrix| 5)
              (|Matrix| $) (|InputForm|)
              (|Record| (|:| |mat| 33) (|:| |vec| (|Vector| 5))) (|Vector| $)
              (|Union| 5 '"failed") (|NonNegativeInteger|)
              (|Record| (|:| |coef| 41) (|:| |generator| $)) (|List| $)
              (|Union| 41 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 44 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|SingleInteger|))
           '#(~= 50 |zero?| 56 |unitNormal| 61 |unitCanonical| 66 |unit?| 71
              |symmetricRemainder| 76 |subtractIfCan| 82 |submod| 88
              |squareFreePart| 95 |squareFree| 100 |smaller?| 105 |sizeLess?|
              111 |sign| 117 |shift| 122 |sample| 128 |roman| 132
              |retractIfCan| 142 |retract| 147 |rem| 152 |reducedSystem| 158
              |recip| 169 |rationalIfCan| 174 |rational?| 179 |rational| 184
              |random| 189 |quo| 194 |principalIdeal| 200 |prime?| 205 |powmod|
              210 |positiveRemainder| 217 |positive?| 223 |permutation| 228
              |patternMatch| 234 |opposite?| 241 |one?| 247 |odd?| 252
              |nextItem| 257 |negative?| 262 |multiEuclidean| 267 |mulmod| 273
              |min| 280 |max| 286 |mask| 292 |length| 297 |lcmCoef| 302 |lcm|
              308 |latex| 319 |invmod| 324 |init| 330 |inc| 334 |hashUpdate!|
              339 |hash| 345 |gcdPolynomial| 350 |gcd| 356 |factorial| 367
              |factor| 372 |extendedEuclidean| 377 |exquo| 390
              |expressIdealMember| 396 |even?| 402 |euclideanSize| 407 |divide|
              412 |differentiate| 418 |dec| 429 |copy| 434 |convert| 439
              |coerce| 469 |characteristic| 489 |bit?| 493 |binomial| 499
              |base| 505 |associates?| 509 |annihilate?| 515 |addmod| 521 |abs|
              528 ^ 533 |Zero| 545 |One| 549 D 553 >= 564 > 570 = 576 <= 582 <
              588 - 594 + 605 * 611)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL |Algebra&| NIL |DifferentialRing&| NIL NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL |Rng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&| NIL
                |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |RetractableTo&| NIL |PartialOrder&| NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|LeftOreRing|) (|Algebra| $$)
                 (|LinearlyExplicitOver| 5) (|DifferentialRing|)
                 (|CharacteristicZero|) (|CommutativeRing|) (|EntireRing|)
                 (|Module| $$) (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|Ring|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|StepThrough|) (|PatternMatchable| 5)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|RealConstant|) (|SetCategory|) (|canonicalsClosed|)
                 (|Canonical|) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 30)
                 (|ConvertibleTo| 29) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 32) (|ConvertibleTo| 35) (|RetractableTo| 5)
                 (|ConvertibleTo| 5) (|PartialOrder|) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 17))
              (|makeByteWordVec2| 52
                                  '(1 0 0 5 6 1 8 11 0 12 1 14 13 11 15 1 0 5 0
                                    16 1 5 17 0 18 1 0 0 0 19 1 17 0 0 21 1 14
                                    11 13 22 1 8 0 11 23 1 8 17 0 24 2 0 26 0 0
                                    1 1 0 26 0 1 1 0 50 0 1 1 0 0 0 1 1 0 26 0
                                    1 2 0 0 0 0 1 2 0 28 0 0 1 3 0 0 0 0 0 1 1
                                    0 0 0 1 1 0 47 0 1 2 0 26 0 0 1 2 0 26 0 0
                                    1 1 0 5 0 1 2 0 0 0 0 1 0 0 0 1 1 0 0 5 7 1
                                    0 0 8 10 1 0 38 0 1 1 0 5 0 1 2 0 0 0 0 1 1
                                    0 33 34 1 2 0 36 34 37 1 1 0 28 0 1 1 0 25
                                    0 1 1 0 26 0 1 1 0 27 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 1 0 40 41 1 1 0 26 0 1 3 0 0 0 0 0 1 2
                                    0 0 0 0 1 1 0 26 0 1 2 0 0 0 0 1 3 0 31 0
                                    32 31 1 2 0 26 0 0 1 1 0 26 0 1 1 0 26 0 1
                                    1 0 28 0 1 1 0 26 0 1 2 0 42 41 0 1 3 0 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 2 0 49 0 0 1 1 0 0 41 1 2 0 0 0 0 1 1
                                    0 11 0 1 2 0 0 0 0 1 0 0 0 1 1 0 0 0 1 2 0
                                    51 51 0 1 1 0 52 0 1 2 0 48 48 48 1 1 0 0
                                    41 1 2 0 0 0 0 1 1 0 0 0 1 1 0 47 0 1 3 0
                                    45 0 0 0 1 2 0 46 0 0 1 2 0 28 0 0 1 2 0 42
                                    41 0 1 1 0 26 0 1 1 0 39 0 1 2 0 43 0 0 1 1
                                    0 0 0 1 2 0 0 0 39 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 8 9 1 0 29 0 1 1 0 30 0 1 1 0 32 0 1 1
                                    0 35 0 1 1 0 5 0 16 1 0 0 5 6 1 0 0 0 1 1 0
                                    0 5 6 1 0 17 0 20 0 0 39 1 2 0 26 0 0 1 2 0
                                    0 0 0 1 0 0 0 1 2 0 26 0 0 1 2 0 26 0 0 1 3
                                    0 0 0 0 0 1 1 0 0 0 1 2 0 0 0 39 1 2 0 0 0
                                    13 1 0 0 0 1 0 0 0 1 1 0 0 0 1 2 0 0 0 39 1
                                    2 0 26 0 0 1 2 0 26 0 0 1 2 0 26 0 0 1 2 0
                                    26 0 0 1 2 0 26 0 0 1 1 0 0 0 19 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 5 0 1 2 0 0 0 0 1 2 0 0
                                    39 0 1 2 0 0 13 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|RomanNumeral| 'NILADIC T) 
