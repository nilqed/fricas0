
(SDEFUN |QUAT2;Zero;$;1| (($ $))
        (VECTOR (|spadConstant| $ 10) (|spadConstant| $ 10)
                (|spadConstant| $ 10) (|spadConstant| $ 10))) 

(SDEFUN |QUAT2;One;$;2| (($ $))
        (VECTOR (|spadConstant| $ 12) (|spadConstant| $ 10)
                (|spadConstant| $ 10) (|spadConstant| $ 10))) 

(PUT '|QUAT2;real;$R;3| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 0))) 

(SDEFUN |QUAT2;real;$R;3| ((|x| $) ($ R)) (QVELT |x| 0)) 

(PUT '|QUAT2;imagI;$R;4| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 1))) 

(SDEFUN |QUAT2;imagI;$R;4| ((|x| $) ($ R)) (QVELT |x| 1)) 

(PUT '|QUAT2;imagJ;$R;5| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 2))) 

(SDEFUN |QUAT2;imagJ;$R;5| ((|x| $) ($ R)) (QVELT |x| 2)) 

(PUT '|QUAT2;imagK;$R;6| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 3))) 

(SDEFUN |QUAT2;imagK;$R;6| ((|x| $) ($ R)) (QVELT |x| 3)) 

(PUT '|QUAT2;quatern;4R$;7| '|SPADreplace| 'VECTOR) 

(SDEFUN |QUAT2;quatern;4R$;7| ((|a| R) (|b| R) (|c| R) (|d| R) ($ $))
        (VECTOR |a| |b| |c| |d|)) 

(SDEFUN |QUAT2;*;3$;8| ((|x| $) (|y| $) ($ $))
        (VECTOR
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 0) (QREFELT $ 19))
                     (SPADCALL
                      (SPADCALL (QREFELT $ 7) (QVELT |x| 1) (QREFELT $ 19))
                      (QVELT |y| 1) (QREFELT $ 19))
                     (QREFELT $ 20))
           (SPADCALL (SPADCALL (QREFELT $ 8) (QVELT |x| 2) (QREFELT $ 19))
                     (QVELT |y| 2) (QREFELT $ 19))
           (QREFELT $ 20))
          (SPADCALL
           (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 19))
                     (QVELT |x| 3) (QREFELT $ 19))
           (QVELT |y| 3) (QREFELT $ 19))
          (QREFELT $ 21))
         (SPADCALL
          (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 1) (QREFELT $ 19))
                    (SPADCALL (QVELT |x| 1) (QVELT |y| 0) (QREFELT $ 19))
                    (QREFELT $ 20))
          (SPADCALL (QREFELT $ 8)
                    (SPADCALL
                     (SPADCALL (QVELT |x| 3) (QVELT |y| 2) (QREFELT $ 19))
                     (SPADCALL (QVELT |x| 2) (QVELT |y| 3) (QREFELT $ 19))
                     (QREFELT $ 21))
                    (QREFELT $ 19))
          (QREFELT $ 20))
         (SPADCALL
          (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 2) (QREFELT $ 19))
                    (SPADCALL (QVELT |x| 2) (QVELT |y| 0) (QREFELT $ 19))
                    (QREFELT $ 20))
          (SPADCALL (QREFELT $ 7)
                    (SPADCALL
                     (SPADCALL (QVELT |x| 1) (QVELT |y| 3) (QREFELT $ 19))
                     (SPADCALL (QVELT |x| 3) (QVELT |y| 1) (QREFELT $ 19))
                     (QREFELT $ 21))
                    (QREFELT $ 19))
          (QREFELT $ 20))
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 3) (QREFELT $ 19))
                     (SPADCALL (QVELT |x| 3) (QVELT |y| 0) (QREFELT $ 19))
                     (QREFELT $ 20))
           (SPADCALL (QVELT |x| 1) (QVELT |y| 2) (QREFELT $ 19))
           (QREFELT $ 20))
          (SPADCALL (QVELT |x| 2) (QVELT |y| 1) (QREFELT $ 19))
          (QREFELT $ 21)))) 

(DECLAIM (NOTINLINE |GeneralQuaternion;|)) 

(DEFUN |GeneralQuaternion| (&REST #1=#:G728)
  (SPROG NIL
         (PROG (#2=#:G729)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralQuaternion|)
                                               '|domainEqualList|)
                    . #3=(|GeneralQuaternion|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GeneralQuaternion;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GeneralQuaternion|)))))))))) 

(DEFUN |GeneralQuaternion;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G727 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|GeneralQuaternion|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT DV$3 (|devaluate| |#3|) . #2#)
    (LETT |dv$| (LIST '|GeneralQuaternion| DV$1 DV$2 DV$3) . #2#)
    (LETT $ (GETREFV 51) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
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
                                                             '(|EntireRing|))
                                              . #2#)
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
                                         (|HasCategory| |#1| '(|Field|)))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|GeneralQuaternion| (LIST DV$1 DV$2 DV$3)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9
              (|Record| (|:| |r| |#1|) (|:| |i| |#1|) (|:| |j| |#1|)
                        (|:| |k| |#1|)))
    $))) 

(MAKEPROP '|GeneralQuaternion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |QUAT2;Zero;$;1|) $))
              (4 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |QUAT2;One;$;2|) $))
              |QUAT2;real;$R;3| |QUAT2;imagI;$R;4| |QUAT2;imagJ;$R;5|
              |QUAT2;imagK;$R;6| |QUAT2;quatern;4R$;7| (8 . *) (14 . +)
              (20 . -) |QUAT2;*;3$;8| (|Fraction| 32) (|Union| $ '"failed")
              (|InputForm|) (|NonNegativeInteger|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Boolean|) (|List| 30) (|Equation| 6) (|List| 6) (|Integer|)
              (|List| 34) (|Symbol|) (|Union| 23 '"failed") (|Matrix| 32)
              (|Matrix| $) (|Record| (|:| |mat| 36) (|:| |vec| (|Vector| 32)))
              (|Vector| $) (|List| 26) (|Union| 32 '#1="failed") (|Matrix| 6)
              (|Record| (|:| |mat| 42) (|:| |vec| (|Vector| 6)))
              (|Mapping| 6 6) (|Union| 6 '#1#) (|PositiveInteger|) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 26 |zero?| 32 |unitNormal| 37 |unitCanonical| 42 |unit?| 47
              |subtractIfCan| 52 |smaller?| 58 |sample| 64 |retractIfCan| 68
              |retract| 83 |reducedSystem| 98 |recip| 120 |real| 125
              |rationalIfCan| 130 |rational?| 135 |rational| 140 |quatern| 145
              |opposite?| 153 |one?| 159 |norm| 164 |min| 169 |max| 175 |map|
              181 |latex| 187 |inv| 192 |imagK| 197 |imagJ| 202 |imagI| 207
              |hashUpdate!| 212 |hash| 218 |exquo| 223 |eval| 229 |elt| 269
              |differentiate| 275 |convert| 325 |conjugate| 330 |coerce| 335
              |charthRoot| 355 |characteristic| 360 |associates?| 364
              |annihilate?| 370 |abs| 376 ^ 381 |Zero| 399 |One| 403 D 407 >=
              457 > 463 = 469 <= 475 < 481 - 487 + 498 * 504)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(0 4 0 0 0 4 0 0 1 2 6 4 10 11 15 0 0 5 4 0 0
                                  0 0 5 4 4 0 0 0 0 0 0 7 0 0 0 7 0 0 13 0 0 0
                                  0 3 5 7 8 9 12 13 14))
            (CONS
             '#(|QuaternionCategory&| |DivisionRing&| |Algebra&|
                |FullyLinearlyExplicitOver&| |DifferentialExtension&|
                |Algebra&| NIL |Module&| NIL NIL |EntireRing&| |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL |Ring&| NIL
                NIL NIL |Rng&| NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |OrderedSet&|
                |FullyEvalableOver&| |SemiGroup&| |AbelianSemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| |Evalable&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL |PartialOrder&|
                |RetractableTo&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| NIL)
             (CONS
              '#((|QuaternionCategory| 6) (|DivisionRing|) (|Algebra| 6)
                 (|FullyLinearlyExplicitOver| 6) (|DifferentialExtension| 6)
                 (|Algebra| 23) (|LinearlyExplicitOver| 6) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|Module| 23) (|PartialDifferentialRing| 34)
                 (|DifferentialRing|) (|LinearlyExplicitOver| 32) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 23 23) (|Rng|)
                 (|RightModule| 6) (|LeftModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 23) (|RightModule| 23)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|OrderedSet|)
                 (|FullyEvalableOver| 6) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Comparable|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|Evalable| 6) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 50) (|ConvertibleTo| 25)
                 (|noZeroDivisors|) (|PartialOrder|) (|RetractableTo| 23)
                 (|RetractableTo| 32) (|InnerEvalable| 34 6)
                 (|InnerEvalable| 6 6) (|Eltable| 6 $$))
              (|makeByteWordVec2| 50
                                  '(0 6 0 10 0 6 0 12 2 6 0 0 0 19 2 6 0 0 0 20
                                    2 6 0 0 0 21 2 0 28 0 0 1 1 0 28 0 1 1 5 27
                                    0 1 1 5 0 0 1 1 5 28 0 1 2 0 24 0 0 1 2 7
                                    28 0 0 1 0 0 0 1 1 8 35 0 1 1 9 41 0 1 1 0
                                    45 0 1 1 8 23 0 1 1 9 32 0 1 1 0 6 0 1 1 15
                                    36 37 1 2 15 38 37 39 1 1 0 42 37 1 2 0 43
                                    37 39 1 1 0 24 0 1 1 0 6 0 14 1 17 35 0 1 1
                                    17 28 0 1 1 17 23 0 1 4 0 0 6 6 6 6 18 2 0
                                    28 0 0 1 1 0 28 0 1 1 0 6 0 1 2 7 0 0 0 1 2
                                    7 0 0 0 1 2 0 0 44 0 1 1 0 47 0 1 1 4 0 0 1
                                    1 0 6 0 17 1 0 6 0 16 1 0 6 0 15 2 0 49 49
                                    0 1 1 0 48 0 1 2 5 24 0 0 1 2 13 0 0 29 1 3
                                    13 0 0 6 6 1 2 13 0 0 30 1 3 13 0 0 31 31 1
                                    3 12 0 0 33 31 1 3 12 0 0 34 6 1 2 14 0 0 6
                                    1 2 11 0 0 26 1 1 11 0 0 1 3 10 0 0 33 40 1
                                    3 10 0 0 34 26 1 2 10 0 0 34 1 2 10 0 0 33
                                    1 2 0 0 0 44 1 3 0 0 0 44 26 1 1 3 25 0 1 1
                                    0 0 0 1 1 18 0 23 1 1 0 0 6 1 1 0 0 32 1 1
                                    0 50 0 1 1 1 24 0 1 0 0 26 1 2 5 28 0 0 1 2
                                    0 28 0 0 1 1 16 6 0 1 2 4 0 0 32 1 2 0 0 0
                                    26 1 2 0 0 0 46 1 0 0 0 11 0 0 0 13 2 11 0
                                    0 26 1 1 11 0 0 1 3 10 0 0 34 26 1 3 10 0 0
                                    33 40 1 2 10 0 0 33 1 2 10 0 0 34 1 3 0 0 0
                                    44 26 1 2 0 0 0 44 1 2 7 28 0 0 1 2 7 28 0
                                    0 1 2 0 28 0 0 1 2 7 28 0 0 1 2 7 28 0 0 1
                                    2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 4 0 23
                                    0 1 2 4 0 0 23 1 2 0 0 6 0 1 2 0 0 0 6 1 2
                                    0 0 0 0 22 2 0 0 32 0 1 2 0 0 26 0 1 2 0 0
                                    46 0 1)))))
           '|lookupComplete|)) 
