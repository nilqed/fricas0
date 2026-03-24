
(SDEFUN |OCT;Zero;%;1| ((% (%)))
        (CONS (|spadConstant| % 11) (|spadConstant| % 11))) 

(SDEFUN |OCT;One;%;2| ((% (%)))
        (CONS (|spadConstant| % 13) (|spadConstant| % 11))) 

(SDEFUN |OCT;real;%R;3| ((|x| (%)) (% (R)))
        (SPADCALL (QCAR |x|) (QREFELT % 15))) 

(SDEFUN |OCT;imagi;%R;4| ((|x| (%)) (% (R)))
        (SPADCALL (QCAR |x|) (QREFELT % 17))) 

(SDEFUN |OCT;imagj;%R;5| ((|x| (%)) (% (R)))
        (SPADCALL (QCAR |x|) (QREFELT % 19))) 

(SDEFUN |OCT;imagk;%R;6| ((|x| (%)) (% (R)))
        (SPADCALL (QCAR |x|) (QREFELT % 21))) 

(SDEFUN |OCT;imagE;%R;7| ((|x| (%)) (% (R)))
        (SPADCALL (QCDR |x|) (QREFELT % 15))) 

(SDEFUN |OCT;imagI;%R;8| ((|x| (%)) (% (R)))
        (SPADCALL (QCDR |x|) (QREFELT % 17))) 

(SDEFUN |OCT;imagJ;%R;9| ((|x| (%)) (% (R)))
        (SPADCALL (QCDR |x|) (QREFELT % 19))) 

(SDEFUN |OCT;imagK;%R;10| ((|x| (%)) (% (R)))
        (SPADCALL (QCDR |x|) (QREFELT % 21))) 

(SDEFUN |OCT;octon;8R%;11|
        ((|a| (R)) (|b| (R)) (|c| (R)) (|d| (R)) (|f| (R)) (|g| (R)) (|h| (R))
         (|i| (R)) (% (%)))
        (CONS (SPADCALL |a| |b| |c| |d| (QREFELT % 27))
              (SPADCALL |f| |g| |h| |i| (QREFELT % 27)))) 

(PUT '|OCT;octon;2Q%;12| '|SPADreplace| 'CONS) 

(SDEFUN |OCT;octon;2Q%;12|
        ((|p| (|Quaternion| R)) (|q| (|Quaternion| R)) (% (%))) (CONS |p| |q|)) 

(SDEFUN |OCT;coerce;Q%;13| ((|q| (|Quaternion| R)) (% (%)))
        (CONS |q| (|spadConstant| % 11))) 

(SDEFUN |OCT;retract;%Q;14| ((|x| (%)) (% (|Quaternion| R)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |x| (QREFELT % 23)) (QREFELT % 32))
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT % 24)) (QREFELT % 32))
             (COND
              ((SPADCALL (SPADCALL |x| (QREFELT % 25)) (QREFELT % 32))
               (COND
                ((NULL (SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 32)))
                 (EXIT
                  (|error| #1="Cannot retract octonion to quaternion.")))))
              (#2='T (EXIT (|error| #1#)))))
            (#2# (EXIT (|error| #1#)))))
          (#2# (EXIT (|error| #1#))))
         (EXIT
          (SPADCALL (SPADCALL |x| (QREFELT % 16)) (SPADCALL |x| (QREFELT % 18))
                    (SPADCALL |x| (QREFELT % 20)) (SPADCALL |x| (QREFELT % 22))
                    (QREFELT % 27))))) 

(SDEFUN |OCT;retractIfCan;%U;15|
        ((|x| (%)) (% (|Union| (|Quaternion| R) "failed")))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |x| (QREFELT % 23)) (QREFELT % 32))
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT % 24)) (QREFELT % 32))
             (COND
              ((SPADCALL (SPADCALL |x| (QREFELT % 25)) (QREFELT % 32))
               (COND
                ((NULL (SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 32)))
                 (EXIT (CONS 1 #1="failed")))))
              (#2='T (EXIT (CONS 1 #1#)))))
            (#2# (EXIT (CONS 1 #1#)))))
          (#2# (EXIT (CONS 1 #1#))))
         (EXIT
          (CONS 0
                (SPADCALL (SPADCALL |x| (QREFELT % 16))
                          (SPADCALL |x| (QREFELT % 18))
                          (SPADCALL |x| (QREFELT % 20))
                          (SPADCALL |x| (QREFELT % 22)) (QREFELT % 27)))))) 

(SDEFUN |OCT;*;3%;16| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS
         (SPADCALL (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 36))
                   (SPADCALL (SPADCALL (QCDR |y|) (QREFELT % 37)) (QCDR |x|)
                             (QREFELT % 36))
                   (QREFELT % 38))
         (SPADCALL (SPADCALL (QCDR |y|) (QCAR |x|) (QREFELT % 36))
                   (SPADCALL (QCDR |x|) (SPADCALL (QCAR |y|) (QREFELT % 37))
                             (QREFELT % 36))
                   (QREFELT % 39)))) 

(DECLAIM (NOTINLINE |Octonion;|)) 

(DEFUN |Octonion;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G69 NIL) (#2=#:G70 NIL) (#3=#:G71 NIL) (% NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Octonion| DV$1))
    (LETT % (GETREFV 71))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory| |#1| '(|Finite|))
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicNonZero|))
                                             (LETT #3#
                                                   (|HasCategory| |#1|
                                                                  '(|CharacteristicZero|)))
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              #3#)
                                             (|HasCategory| |#1|
                                                            '(|ConvertibleTo|
                                                              (|InputForm|)))
                                             (LETT #2#
                                                   (|HasCategory| |#1|
                                                                  '(|OrderedSet|)))
                                             (OR
                                              (|HasCategory| |#1| '(|Finite|))
                                              #2#)
                                             (|HasCategory| |#1|
                                                            (LIST
                                                             '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#1|)))
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             (|HasCategory| |#1|
                                                            (LIST '|Eltable|
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  (|devaluate|
                                                                   |#1|)))
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory|
                                               (|Quaternion| |#1|)
                                               '(|RetractableTo|
                                                 (|Fraction| (|Integer|)))))
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory|
                                               (|Quaternion| |#1|)
                                               '(|RetractableTo| (|Integer|))))
                                             (LETT #1#
                                                   (|HasCategory| |#1|
                                                                  '(|IntegralDomain|)))
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              #3# #1#)
                                             (|HasCategory| |#1|
                                                            '(|RealNumberSystem|))
                                             (|HasCategory| |#1|
                                                            '(|IntegerNumberSystem|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              #3#
                                              (|HasCategory|
                                               (|Quaternion| |#1|)
                                               '(|RetractableTo|
                                                 (|Integer|))))))))
    (|haddProp| |$ConstructorCache| '|Octonion| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7
              (|Record| (|:| |e| (|Quaternion| |#1|))
                        (|:| E (|Quaternion| |#1|))))
    %))) 

(DEFUN |Octonion| (#1=#:G72)
  (SPROG NIL
         (PROG (#2=#:G73)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Octonion|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Octonion;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Octonion|)))))))))) 

(MAKEPROP '|Octonion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |OCT;Zero;%;1|) %))
              (0 . |Zero|) (|Quaternion| 6) (4 . |Zero|) (8 . |One|)
              (12 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |OCT;One;%;2|) %))
              (16 . |real|) |OCT;real;%R;3| (21 . |imagI|) |OCT;imagi;%R;4|
              (26 . |imagJ|) |OCT;imagj;%R;5| (31 . |imagK|) |OCT;imagk;%R;6|
              |OCT;imagE;%R;7| |OCT;imagI;%R;8| |OCT;imagJ;%R;9|
              |OCT;imagK;%R;10| (36 . |quatern|) |OCT;octon;8R%;11|
              |OCT;octon;2Q%;12| |OCT;coerce;Q%;13| (|Boolean|) (44 . |zero?|)
              |OCT;retract;%Q;14| (|Union| 10 '"failed")
              |OCT;retractIfCan;%U;15| (49 . *) (55 . |conjugate|) (60 . -)
              (66 . +) |OCT;*;3%;16| (|OutputForm|) (|String|)
              (|PositiveInteger|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|) (|Vector| %) (|List| (|Polynomial| 6))
              (|Matrix| 6) (|Vector| 49) (|Vector| 6)
              (|SparseUnivariatePolynomial| 6) (|Union| 6 '#1="failed")
              (|Mapping| 6 6) (|Fraction| 44) (|Union| 55 '#1#)
              (|Union| 44 '#1#) (|InputForm|) (|List| 6) (|List| 61)
              (|Equation| 6) (|SparseUnivariatePolynomial| (|Polynomial| 6))
              (|List| %) (|HashState|) (|SingleInteger|) (|Symbol|) (|List| 66)
              (|List| 51) (|Record| (|:| |particular| %) (|:| |basis| 63))
              (|Union| 69 '"failed"))
           '#(~= 72 |zero?| 78 |unit| 83 |subtractIfCan| 87
              |structuralConstants| 93 |someBasis| 102 |smaller?| 106 |size|
              112 |sample| 116 |rightUnits| 120 |rightUnit| 124
              |rightTraceMatrix| 128 |rightTrace| 137
              |rightRegularRepresentation| 142 |rightRecip| 153
              |rightRankPolynomial| 158 |rightPower| 162 |rightNorm| 174
              |rightMinimalPolynomial| 179 |rightDiscriminant| 184
              |rightCharacteristicPolynomial| 193 |rightAlternative?| 198
              |retractIfCan| 202 |retract| 222 |represents| 242 |recip| 253
              |real| 258 |rationalIfCan| 263 |rational?| 268 |rational| 273
              |rank| 278 |random| 282 |powerAssociative?| 286 |plenaryPower|
              290 |opposite?| 296 |one?| 302 |octon| 307 |norm| 325
              |noncommutativeJordanAlgebra?| 330 |min| 334 |max| 340 |map| 346
              |lookup| 352 |lieAlgebra?| 357 |lieAdmissible?| 361 |leftUnits|
              365 |leftUnit| 369 |leftTraceMatrix| 373 |leftTrace| 382
              |leftRegularRepresentation| 387 |leftRecip| 398
              |leftRankPolynomial| 403 |leftPower| 407 |leftNorm| 419
              |leftMinimalPolynomial| 424 |leftDiscriminant| 429
              |leftCharacteristicPolynomial| 438 |leftAlternative?| 443 |latex|
              447 |jordanAlgebra?| 452 |jordanAdmissible?| 456
              |jacobiIdentity?| 460 |inv| 464 |index| 469 |imagk| 474 |imagj|
              479 |imagi| 484 |imagK| 489 |imagJ| 494 |imagI| 499 |imagE| 504
              |hashUpdate!| 509 |hash| 515 |flexible?| 520 |eval| 524
              |enumerate| 564 |elt| 568 |coordinates| 580 |convert| 602
              |conjugate| 617 |conditionsForIdempotents| 622 |commutator| 631
              |commutative?| 637 |coerce| 641 |charthRoot| 666 |characteristic|
              671 |basis| 675 |associatorDependence| 679 |associator| 683
              |associative?| 690 |apply| 694 |antiCommutator| 700
              |antiCommutative?| 706 |antiAssociative?| 710 |annihilate?| 714
              |alternative?| 720 |abs| 724 ^ 729 |Zero| 741 |One| 745 >= 749 >
              755 = 761 <= 767 < 773 - 779 + 790 * 796)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(0 4 3 0 5 0 5 5 0 5 0 5 5 0 0 5 5 0 0 0 0 5 5
                                  0 7 5 5 2 0 0 8 0 0 0 0 0 13 12 10 1 0 0 0 13
                                  12 11 10 9 7 6 15 0 0 0 0))
            (CONS
             '#(|OctonionCategory&| NIL NIL |FramedNonAssociativeAlgebra&| NIL
                |FiniteRankNonAssociativeAlgebra&| |Rng&| NIL
                |NonAssociativeAlgebra&| NIL |Module&| |NonAssociativeRing&|
                NIL NIL |FramedModule&| NIL NIL NIL NIL |NonAssociativeRng&|
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| NIL |MagmaWithUnit&|
                |Finite&| |AbelianMonoid&| |NonAssociativeSemiRng&| NIL
                |Magma&| |AbelianSemiGroup&| |FullyRetractableTo&|
                |FullyEvalableOver&| |FullyRetractableTo&| |RetractableTo&|
                |RetractableTo&| |Evalable&| |Hashable&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| |PartialOrder&| NIL NIL NIL |BasicType&| NIL
                NIL)
             (CONS
              '#((|OctonionCategory| 6) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|FramedNonAssociativeAlgebra| 6)
                 (|Ring|) (|FiniteRankNonAssociativeAlgebra| 6) (|Rng|)
                 (|SemiRing|) (|NonAssociativeAlgebra| 6) (|SemiRng|)
                 (|Module| 6) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|FramedModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 6) (|RightModule| 6)
                 (|NonAssociativeRng|) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|) (|Finite|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|Comparable|)
                 (|Magma|) (|AbelianSemiGroup|) (|FullyRetractableTo| 6)
                 (|FullyEvalableOver| 6)
                 (|FullyRetractableTo| (|Quaternion| 6)) (|RetractableTo| 44)
                 (|RetractableTo| 55) (|Evalable| 6) (|Hashable|)
                 (|SetCategory|) (|RetractableTo| 6)
                 (|RetractableTo| (|Quaternion| 6)) (|CoercibleFrom| 44)
                 (|CoercibleFrom| 55) (|Eltable| 6 $$) (|InnerEvalable| 6 6)
                 (|InnerEvalable| 66 6) (|PartialOrder|) (|ConvertibleTo| 58)
                 (|unitsKnown|) (|CoercibleTo| 41) (|BasicType|)
                 (|CoercibleFrom| 6) (|CoercibleFrom| (|Quaternion| 6)))
              (|makeByteWordVec2| 70
                                  '(0 6 0 9 0 10 0 11 0 6 0 12 0 10 0 13 1 10 6
                                    0 15 1 10 6 0 17 1 10 6 0 19 1 10 6 0 21 4
                                    10 0 6 6 6 6 27 1 6 31 0 32 2 10 0 0 0 36 1
                                    10 0 0 37 2 10 0 0 0 38 2 10 0 0 0 39 2 0
                                    31 0 0 1 1 0 31 0 1 0 14 45 1 2 0 45 0 0 1
                                    1 0 50 47 1 0 0 50 1 0 0 47 1 2 8 31 0 0 1
                                    0 2 46 1 0 0 0 1 0 14 70 1 0 14 45 1 1 0 49
                                    47 1 0 0 49 1 1 0 6 0 1 2 0 49 0 47 1 1 0
                                    49 0 1 1 15 45 0 1 0 18 62 1 2 0 0 0 43 1 2
                                    5 0 0 46 1 1 0 6 0 1 1 14 52 0 1 1 0 6 47 1
                                    0 0 6 1 1 0 52 0 1 0 0 31 1 1 0 53 0 1 1 0
                                    34 0 35 1 12 56 0 1 1 13 57 0 1 1 0 6 0 1 1
                                    0 10 0 33 1 12 55 0 1 1 13 44 0 1 2 0 0 51
                                    47 1 1 0 0 51 1 1 15 45 0 1 1 0 6 0 16 1 17
                                    56 0 1 1 17 31 0 1 1 17 55 0 1 0 0 43 1 0 2
                                    0 1 0 0 31 1 2 0 0 0 43 1 2 0 31 0 0 1 1 5
                                    31 0 1 8 0 0 6 6 6 6 6 6 6 6 28 2 0 0 10 10
                                    29 1 0 6 0 1 0 0 31 1 2 7 0 0 0 1 2 7 0 0 0
                                    1 2 0 0 54 0 1 1 2 43 0 1 0 0 31 1 0 0 31 1
                                    0 14 70 1 0 14 45 1 1 0 49 47 1 0 0 49 1 1
                                    0 6 0 1 2 0 49 0 47 1 1 0 49 0 1 1 15 45 0
                                    1 0 18 62 1 2 0 0 0 43 1 2 5 0 0 46 1 1 0 6
                                    0 1 1 14 52 0 1 1 0 6 47 1 0 0 6 1 1 0 52 0
                                    1 0 0 31 1 1 0 42 0 1 0 0 31 1 0 0 31 1 0 0
                                    31 1 1 18 0 0 1 1 2 0 43 1 1 0 6 0 22 1 0 6
                                    0 20 1 0 6 0 18 1 0 6 0 26 1 0 6 0 25 1 0 6
                                    0 24 1 0 6 0 23 2 1 64 64 0 1 1 1 65 0 1 0
                                    0 31 1 3 10 0 0 6 6 1 3 10 0 0 59 59 1 2 10
                                    0 0 60 1 2 10 0 0 61 1 3 9 0 0 66 6 1 3 9 0
                                    0 67 59 1 0 2 63 1 2 0 6 0 44 1 2 11 0 0 6
                                    1 2 0 49 47 47 1 2 0 51 0 47 1 1 0 51 0 1 1
                                    0 49 47 1 1 0 51 0 1 1 0 0 51 1 1 6 58 0 1
                                    1 0 0 0 1 1 0 48 47 1 0 0 48 1 2 0 0 0 0 1
                                    0 0 31 1 1 0 41 0 1 1 0 0 6 1 1 0 0 10 30 1
                                    19 0 44 1 1 12 0 55 1 1 3 45 0 1 0 5 46 1 0
                                    0 47 1 0 14 68 1 3 0 0 0 0 0 1 0 0 31 1 2 0
                                    0 49 0 1 2 0 0 0 0 1 0 0 31 1 0 0 31 1 2 5
                                    31 0 0 1 0 0 31 1 1 16 6 0 1 2 0 0 0 43 1 2
                                    5 0 0 46 1 0 0 0 8 0 5 0 14 2 7 31 0 0 1 2
                                    7 31 0 0 1 2 0 31 0 0 1 2 7 31 0 0 1 2 7 31
                                    0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 43 0 1 2 0 0 0 0 40 2 0 0 44 0 1 2 0 0 46
                                    0 1 2 0 0 6 0 1 2 0 0 0 6 1)))))
           '|lookupComplete|)) 
