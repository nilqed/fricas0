
(PUT '|OEXPR;retract;E%;1| '|SPADreplace| '(XLAM (|e|) |e|)) 

(SDEFUN |OEXPR;retract;E%;1| ((|e| (|Expression| (|Integer|))) (% (%))) |e|) 

(PUT '|OEXPR;coerce;%E;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |OEXPR;coerce;%E;2| ((|x| (%)) (% (|Expression| (|Integer|)))) |x|) 

(SDEFUN |OEXPR;retractIfCan;EU;3|
        ((|x| (|Expression| (|Integer|))) (% (|Union| % "failed")))
        (CONS 0 (SPADCALL |x| (QREFELT % 7)))) 

(SDEFUN |OEXPR;<;2%B;4| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|s| (|Union| (|Integer|) "failed")) (|di| (%)))
               (SEQ (LETT |di| (SPADCALL |y| |x| (QREFELT % 11)))
                    (EXIT
                     (COND
                      ((SPADCALL |di| (|spadConstant| % 12) (QREFELT % 15))
                       NIL)
                      (#1='T
                       (SEQ (LETT |s| (SPADCALL |di| (QREFELT % 18)))
                            (EXIT
                             (COND ((QEQCAR |s| 0) (EQL (QCDR |s|) 1))
                                   (#1#
                                    (|error| "can not determine sign"))))))))))) 

(DECLAIM (NOTINLINE |OrderedExpression;|)) 

(DEFUN |OrderedExpression;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OrderedExpression|))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OrderedExpression| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|Expression| (|Integer|)))
          %))) 

(DEFUN |OrderedExpression| ()
  (SPROG NIL
         (PROG (#1=#:G16)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OrderedExpression|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OrderedExpression|
                             (LIST
                              (CONS NIL (CONS 1 (|OrderedExpression;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|OrderedExpression|)))))))))) 

(MAKEPROP '|OrderedExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 24) '|Rep| |OEXPR;retract;E%;1|
              |OEXPR;coerce;%E;2| (|Union| % '"failed")
              |OEXPR;retractIfCan;EU;3| (0 . -) (6 . |Zero|) (10 . |Zero|)
              (|Boolean|) (14 . =) (|Union| 24 '"failed")
              (|ElementaryFunctionSign| 24 5) (20 . |sign|) |OEXPR;<;2%B;4|
              (|String|) (|OutputForm|) (|PositiveInteger|)
              (|NonNegativeInteger|) (|Integer|) (|Fraction| 24))
           '#(~= 25 |zero?| 31 |subtractIfCan| 36 |smaller?| 42 |sign| 48
              |sample| 53 |rightRecip| 57 |rightPower| 62 |retractIfCan| 74
              |retract| 79 |recip| 84 |positive?| 89 |plenaryPower| 94
              |opposite?| 100 |one?| 106 |negative?| 111 |min| 116 |max| 122
              |leftRecip| 128 |leftPower| 133 |latex| 145 |commutator| 150
              |coerce| 156 |characteristic| 176 |associator| 180
              |antiCommutator| 187 |annihilate?| 193 |abs| 199 ^ 204 |Zero| 216
              |One| 220 >= 224 > 230 = 236 <= 242 < 248 - 254 + 265 * 271)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|OrderedRing&| NIL |Algebra&| NIL NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |Module&| NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL |OrderedSet&|
                |AbelianSemiGroup&| |Magma&| NIL |SetCategory&|
                |RetractableFrom&| NIL |PartialOrder&| |BasicType&| NIL NIL)
             (CONS
              '#((|OrderedRing|) (|CharacteristicZero|) (|Algebra| 25) (|Ring|)
                 (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| 25) (|SemiRng|)
                 (|Module| 25) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|BiModule| 25 25) (|OrderedAbelianGroup|) (|LeftModule| $$)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| 25)
                 (|RightModule| 25) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|OrderedSet|) (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|SetCategory|) (|RetractableFrom| 5) (|CoercibleTo| 21)
                 (|PartialOrder|) (|BasicType|) (|unitsKnown|)
                 (|CoercibleTo| 5))
              (|makeByteWordVec2| 25
                                  '(2 0 0 0 0 11 0 0 0 12 0 6 0 13 2 0 14 0 0
                                    15 1 17 16 5 18 2 0 14 0 0 1 1 0 14 0 1 2 0
                                    9 0 0 1 2 0 14 0 0 1 1 0 24 0 1 0 0 0 1 1 0
                                    9 0 1 2 0 0 0 23 1 2 0 0 0 22 1 1 0 9 5 10
                                    1 0 0 5 7 1 0 9 0 1 1 0 14 0 1 2 0 0 0 22 1
                                    2 0 14 0 0 1 1 0 14 0 1 1 0 14 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 9 0 1 2 0 0 0 23 1 2 0
                                    0 0 22 1 1 0 20 0 1 2 0 0 0 0 1 1 0 21 0 1
                                    1 0 0 24 1 1 0 0 25 1 1 0 5 0 8 0 0 23 1 3
                                    0 0 0 0 0 1 2 0 0 0 0 1 2 0 14 0 0 1 1 0 0
                                    0 1 2 0 0 0 23 1 2 0 0 0 22 1 0 0 0 12 0 0
                                    0 1 2 0 14 0 0 1 2 0 14 0 0 1 2 0 14 0 0 15
                                    2 0 14 0 0 1 2 0 14 0 0 19 1 0 0 0 1 2 0 0
                                    0 0 11 2 0 0 0 0 1 2 0 0 22 0 1 2 0 0 23 0
                                    1 2 0 0 24 0 1 2 0 0 0 0 1 2 0 0 25 0 1 2 0
                                    0 0 25 1)))))
           '|lookupComplete|)) 
