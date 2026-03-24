
(SDEFUN |QUAT2;Zero;%;1| ((% (%)))
        (VECTOR (|spadConstant| % 10) (|spadConstant| % 10)
                (|spadConstant| % 10) (|spadConstant| % 10))) 

(SDEFUN |QUAT2;One;%;2| ((% (%)))
        (VECTOR (|spadConstant| % 12) (|spadConstant| % 10)
                (|spadConstant| % 10) (|spadConstant| % 10))) 

(PUT '|QUAT2;real;%R;3| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 0))) 

(SDEFUN |QUAT2;real;%R;3| ((|x| (%)) (% (R))) (QVELT |x| 0)) 

(PUT '|QUAT2;imagI;%R;4| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 1))) 

(SDEFUN |QUAT2;imagI;%R;4| ((|x| (%)) (% (R))) (QVELT |x| 1)) 

(PUT '|QUAT2;imagJ;%R;5| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 2))) 

(SDEFUN |QUAT2;imagJ;%R;5| ((|x| (%)) (% (R))) (QVELT |x| 2)) 

(PUT '|QUAT2;imagK;%R;6| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 3))) 

(SDEFUN |QUAT2;imagK;%R;6| ((|x| (%)) (% (R))) (QVELT |x| 3)) 

(PUT '|QUAT2;quatern;4R%;7| '|SPADreplace| 'VECTOR) 

(SDEFUN |QUAT2;quatern;4R%;7| ((|a| (R)) (|b| (R)) (|c| (R)) (|d| (R)) (% (%)))
        (VECTOR |a| |b| |c| |d|)) 

(SDEFUN |QUAT2;*;3%;8| ((|x| (%)) (|y| (%)) (% (%)))
        (VECTOR
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 0) (QREFELT % 19))
                     (SPADCALL
                      (SPADCALL (QREFELT % 7) (QVELT |x| 1) (QREFELT % 19))
                      (QVELT |y| 1) (QREFELT % 19))
                     (QREFELT % 20))
           (SPADCALL (SPADCALL (QREFELT % 8) (QVELT |x| 2) (QREFELT % 19))
                     (QVELT |y| 2) (QREFELT % 19))
           (QREFELT % 20))
          (SPADCALL
           (SPADCALL (SPADCALL (QREFELT % 7) (QREFELT % 8) (QREFELT % 19))
                     (QVELT |x| 3) (QREFELT % 19))
           (QVELT |y| 3) (QREFELT % 19))
          (QREFELT % 21))
         (SPADCALL
          (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 1) (QREFELT % 19))
                    (SPADCALL (QVELT |x| 1) (QVELT |y| 0) (QREFELT % 19))
                    (QREFELT % 20))
          (SPADCALL (QREFELT % 8)
                    (SPADCALL
                     (SPADCALL (QVELT |x| 3) (QVELT |y| 2) (QREFELT % 19))
                     (SPADCALL (QVELT |x| 2) (QVELT |y| 3) (QREFELT % 19))
                     (QREFELT % 21))
                    (QREFELT % 19))
          (QREFELT % 20))
         (SPADCALL
          (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 2) (QREFELT % 19))
                    (SPADCALL (QVELT |x| 2) (QVELT |y| 0) (QREFELT % 19))
                    (QREFELT % 20))
          (SPADCALL (QREFELT % 7)
                    (SPADCALL
                     (SPADCALL (QVELT |x| 1) (QVELT |y| 3) (QREFELT % 19))
                     (SPADCALL (QVELT |x| 3) (QVELT |y| 1) (QREFELT % 19))
                     (QREFELT % 21))
                    (QREFELT % 19))
          (QREFELT % 20))
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 3) (QREFELT % 19))
                     (SPADCALL (QVELT |x| 3) (QVELT |y| 0) (QREFELT % 19))
                     (QREFELT % 20))
           (SPADCALL (QVELT |x| 1) (QVELT |y| 2) (QREFELT % 19))
           (QREFELT % 20))
          (SPADCALL (QVELT |x| 2) (QVELT |y| 1) (QREFELT % 19))
          (QREFELT % 21)))) 

(DECLAIM (NOTINLINE |GeneralQuaternion;|)) 

(DEFUN |GeneralQuaternion;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G26 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|GeneralQuaternion| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 49))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|Field|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|)))
                                        (OR #1#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#1|
                                                       (LIST '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Evalable|
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Eltable|
                                                             (|devaluate| |#1|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|RealNumberSystem|))
                                        (|HasCategory| |#1|
                                                       '(|IntegerNumberSystem|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|Field|)))))))
    (|haddProp| |$ConstructorCache| '|GeneralQuaternion| (LIST DV$1 DV$2 DV$3)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9
              (|Record| (|:| |r| |#1|) (|:| |i| |#1|) (|:| |j| |#1|)
                        (|:| |k| |#1|)))
    %))) 

(DEFUN |GeneralQuaternion| (&REST #1=#:G27)
  (SPROG NIL
         (PROG (#2=#:G28)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache| '|GeneralQuaternion|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GeneralQuaternion;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GeneralQuaternion|)))))))))) 

(MAKEPROP '|GeneralQuaternion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |QUAT2;Zero;%;1|) %))
              (4 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |QUAT2;One;%;2|) %))
              |QUAT2;real;%R;3| |QUAT2;imagI;%R;4| |QUAT2;imagJ;%R;5|
              |QUAT2;imagK;%R;6| |QUAT2;quatern;4R%;7| (8 . *) (14 . +)
              (20 . -) |QUAT2;*;3%;8| (|Boolean|) (|String|) (|OutputForm|)
              (|PositiveInteger|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|) (|Union| 6 '#1="failed") (|Mapping| 6 6)
              (|Record| (|:| |mat| 35) (|:| |vec| (|Vector| 6))) (|Matrix| %)
              (|Vector| %) (|Matrix| 6) (|Fraction| 27) (|InputForm|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|List| 6) (|Equation| 6) (|List| 40) (|Symbol|) (|List| 42)
              (|Union| 36 '"failed")
              (|Record| (|:| |mat| 46) (|:| |vec| (|Vector| 27))) (|Matrix| 27)
              (|List| 29) (|Union| 27 '#1#))
           '#(~= 26 |zero?| 32 |unitNormal| 37 |unitCanonical| 42 |unit?| 47
              |subtractIfCan| 52 |smaller?| 58 |sample| 64 |rightRecip| 68
              |rightPower| 73 |retractIfCan| 85 |retract| 100 |reducedSystem|
              115 |recip| 137 |real| 142 |rationalIfCan| 147 |rational?| 152
              |rational| 157 |quatern| 162 |plenaryPower| 170 |opposite?| 176
              |one?| 182 |norm| 187 |min| 192 |max| 198 |map| 204 |leftRecip|
              210 |leftPower| 215 |latex| 227 |inv| 232 |imagK| 237 |imagJ| 242
              |imagI| 247 |exquo| 252 |eval| 258 |elt| 298 |differentiate| 304
              |convert| 354 |conjugate| 359 |commutator| 364 |coerce| 370
              |charthRoot| 390 |characteristic| 395 |associator| 399
              |associates?| 406 |antiCommutator| 412 |annihilate?| 418 |abs|
              424 ^ 429 |Zero| 447 |One| 451 D 455 >= 505 > 511 = 517 <= 523 <
              529 - 535 + 546 * 552)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(0 4 0 11 10 4 6 2 1 0 0 4 0 0 0 4 0 0 0 15 4
                                  0 0 0 0 15 4 4 0 0 0 0 0 0 0 0 0 7 0 0 0 0 7
                                  0 0 0 0 13 9 8 0 0 14 13 12 9 8 7 4 5 3 0 0 0
                                  0))
            (CONS
             '#(|QuaternionCategory&| |DivisionRing&| |DifferentialExtension&|
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&|
                |EntireRing&| NIL NIL |Algebra&| NIL |NonAssociativeAlgebra&|
                NIL |NonAssociativeAlgebra&| |Rng&| |Module&| NIL |Module&|
                |FullyLinearlyExplicitOver&| NIL NIL NIL |NonAssociativeRing&|
                NIL NIL NIL NIL NIL NIL NIL |NonAssociativeRng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL
                |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&|
                |FullyEvalableOver&| |Evalable&| |RetractableTo&|
                |RetractableTo&| |SetCategory&| |RetractableTo&| NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL |PartialOrder&| NIL
                NIL NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|QuaternionCategory| 6) (|DivisionRing|)
                 (|DifferentialExtension| 6) (|DifferentialRing|)
                 (|PartialDifferentialRing| 42) (|Algebra| 36) (|EntireRing|)
                 (|CharacteristicZero|) (|CharacteristicNonZero|) (|Algebra| 6)
                 (|Ring|) (|NonAssociativeAlgebra| 36) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|Rng|) (|Module| 36) (|SemiRng|)
                 (|Module| 6) (|FullyLinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 27) (|BiModule| 36 36)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 6 6)
                 (|LinearlyExplicitOver| 6) (|RightModule| 27)
                 (|RightModule| 36) (|LeftModule| 36) (|LeftModule| $$)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| 6)
                 (|RightModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|OrderedSet|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 6) (|FullyEvalableOver| 6)
                 (|Evalable| 6) (|RetractableTo| 27) (|RetractableTo| 36)
                 (|SetCategory|) (|RetractableTo| 6) (|Eltable| 6 $$)
                 (|InnerEvalable| 6 6) (|InnerEvalable| 42 6)
                 (|CoercibleFrom| 27) (|CoercibleFrom| 36) (|PartialOrder|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|ConvertibleTo| 37)
                 (|CoercibleTo| 25) (|BasicType|) (|unitsKnown|)
                 (|CoercibleFrom| 6))
              (|makeByteWordVec2| 48
                                  '(0 6 0 10 0 6 0 12 2 6 0 0 0 19 2 6 0 0 0 20
                                    2 6 0 0 0 21 2 0 23 0 0 1 1 0 23 0 1 1 5 38
                                    0 1 1 5 0 0 1 1 5 23 0 1 2 0 28 0 0 1 2 7
                                    23 0 0 1 0 0 0 1 1 0 28 0 1 2 0 0 0 26 1 2
                                    0 0 0 29 1 1 0 30 0 1 1 8 44 0 1 1 9 48 0 1
                                    1 0 6 0 1 1 8 36 0 1 1 9 27 0 1 2 0 32 33
                                    34 1 1 0 35 33 1 2 15 45 33 34 1 1 15 46 33
                                    1 1 0 28 0 1 1 0 6 0 14 1 17 44 0 1 1 17 23
                                    0 1 1 17 36 0 1 4 0 0 6 6 6 6 18 2 0 0 0 26
                                    1 2 0 23 0 0 1 1 0 23 0 1 1 0 6 0 1 2 7 0 0
                                    0 1 2 7 0 0 0 1 2 0 0 31 0 1 1 0 28 0 1 2 0
                                    0 0 26 1 2 0 0 0 29 1 1 0 24 0 1 1 4 0 0 1
                                    1 0 6 0 17 1 0 6 0 16 1 0 6 0 15 2 5 28 0 0
                                    1 3 13 0 0 39 39 1 2 13 0 0 40 1 3 13 0 0 6
                                    6 1 2 13 0 0 41 1 3 12 0 0 42 6 1 3 12 0 0
                                    43 39 1 2 14 0 0 6 1 3 0 0 0 31 29 1 2 0 0
                                    0 31 1 1 11 0 0 1 2 11 0 0 29 1 2 10 0 0 42
                                    1 3 10 0 0 42 29 1 2 10 0 0 43 1 3 10 0 0
                                    43 47 1 1 3 37 0 1 1 0 0 0 1 2 0 0 0 0 1 1
                                    0 25 0 1 1 0 0 27 1 1 0 0 6 1 1 18 0 36 1 1
                                    1 28 0 1 0 0 29 1 3 0 0 0 0 0 1 2 5 23 0 0
                                    1 2 0 0 0 0 1 2 0 23 0 0 1 1 16 6 0 1 2 0 0
                                    0 26 1 2 0 0 0 29 1 2 4 0 0 27 1 0 0 0 11 0
                                    0 0 13 2 0 0 0 31 1 3 0 0 0 31 29 1 1 11 0
                                    0 1 2 11 0 0 29 1 2 10 0 0 43 1 2 10 0 0 42
                                    1 3 10 0 0 43 47 1 3 10 0 0 42 29 1 2 7 23
                                    0 0 1 2 7 23 0 0 1 2 0 23 0 0 1 2 7 23 0 0
                                    1 2 7 23 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 26 0 1 2 0 0 0 0 22 2 0 0 27 0
                                    1 2 0 0 29 0 1 2 0 0 6 0 1 2 0 0 0 6 1 2 4
                                    0 0 36 1 2 4 0 36 0 1 2 15 0 0 27 1)))))
           '|lookupComplete|)) 
