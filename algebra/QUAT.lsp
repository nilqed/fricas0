
(DECLAIM (NOTINLINE |Quaternion;|)) 

(DEFUN |Quaternion;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G16 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Quaternion| DV$1))
          (LETT % (GETREFV 36))
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
                                                  (|HasCategory| |#1|
                                                                 '(|Field|)))
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))
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
                                               (|HasCategory| |#1|
                                                              '(|Field|)))))))
          (|haddProp| |$ConstructorCache| '|Quaternion| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |Quaternion| (#1=#:G17)
  (SPROG NIL
         (PROG (#2=#:G18)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Quaternion|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Quaternion;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|Quaternion|)))))))))) 

(MAKEPROP '|Quaternion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|GeneralQuaternion| 6
                                   (NRTEVAL
                                    (SPADCALL (|spadConstant| % 8)
                                              (QREFELT % 9)))
                                   (NRTEVAL
                                    (SPADCALL (|spadConstant| % 8)
                                              (QREFELT % 9))))
              (|local| |#1|) (0 . |One|) (4 . |One|) (8 . -) (|Boolean|)
              (|String|) (|OutputForm|) (|PositiveInteger|) (|Integer|)
              (|Union| % '"failed") (|NonNegativeInteger|)
              (|Union| 6 '#1="failed") (|Mapping| 6 6)
              (|Record| (|:| |mat| 22) (|:| |vec| (|Vector| 6))) (|Matrix| %)
              (|Vector| %) (|Matrix| 6) (|Fraction| 14) (|InputForm|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|List| 6) (|Equation| 6) (|List| 27) (|Symbol|) (|List| 29)
              (|Union| 23 '"failed")
              (|Record| (|:| |mat| 33) (|:| |vec| (|Vector| 14))) (|Matrix| 14)
              (|List| 16) (|Union| 14 '#1#))
           '#(|One| 13) 'NIL
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
                 (|PartialDifferentialRing| 29) (|Algebra| 23) (|EntireRing|)
                 (|CharacteristicZero|) (|CharacteristicNonZero|) (|Algebra| 6)
                 (|Ring|) (|NonAssociativeAlgebra| 23) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|Rng|) (|Module| 23) (|SemiRng|)
                 (|Module| 6) (|FullyLinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 14) (|BiModule| 23 23)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 6 6)
                 (|LinearlyExplicitOver| 6) (|RightModule| 14)
                 (|RightModule| 23) (|LeftModule| 23) (|LeftModule| $$)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| 6)
                 (|RightModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|OrderedSet|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 6) (|FullyEvalableOver| 6)
                 (|Evalable| 6) (|RetractableTo| 14) (|RetractableTo| 23)
                 (|SetCategory|) (|RetractableTo| 6) (|Eltable| 6 $$)
                 (|InnerEvalable| 6 6) (|InnerEvalable| 29 6)
                 (|CoercibleFrom| 14) (|CoercibleFrom| 23) (|PartialOrder|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|ConvertibleTo| 24)
                 (|CoercibleTo| 12) (|BasicType|) (|unitsKnown|)
                 (|CoercibleFrom| 6))
              (|makeByteWordVec2| 9 '(0 0 0 7 0 6 0 8 1 6 0 0 9 0 0 0 7)))))
           '|lookupIncomplete|)) 
