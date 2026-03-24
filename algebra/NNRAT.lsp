
(SDEFUN |NNRAT;sup;3%;1| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 10))) 

(SDEFUN |NNRAT;inf;3%;2| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 12))) 

(SDEFUN |NNRAT;subtractIfCan;2%U;3|
        ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG ((|c| (|Fraction| (|Integer|))))
               (SEQ (LETT |c| (SPADCALL |x| |y| (QREFELT % 14)))
                    (EXIT
                     (COND
                      ((SPADCALL |c| (|spadConstant| % 7) (QREFELT % 15))
                       (CONS 1 "failed"))
                      ('T (CONS 0 |c|))))))) 

(DECLAIM (NOTINLINE |NonNegativeRational;|)) 

(DEFUN |NonNegativeRational;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NonNegativeRational|))
          (LETT % (GETREFV 24))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|NonNegativeRational| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|AbelianGroup|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |NonNegativeRational| ()
  (SPROG NIL
         (PROG (#1=#:G11)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|NonNegativeRational|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|NonNegativeRational|
                             (LIST
                              (CONS NIL (CONS 1 (|NonNegativeRational;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|NonNegativeRational|)))))))))) 

(MAKEPROP '|NonNegativeRational| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Fraction| 23) (0 . |Zero|) (4 . |Zero|)
              (|Boolean|) (8 . >=) (14 . |max|) |NNRAT;sup;3%;1| (20 . |min|)
              |NNRAT;inf;3%;2| (26 . -) (32 . <) (|Union| % '"failed")
              |NNRAT;subtractIfCan;2%U;3| (|OutputForm|) (|String|)
              (|PositiveInteger|) (|NonNegativeInteger|) (|InputForm|)
              (|Integer|))
           '#(~= 38 |zero?| 44 |sup| 49 |subtractIfCan| 55 |smaller?| 61
              |sample| 67 |rightRecip| 71 |rightPower| 76 |recip| 88
              |opposite?| 93 |one?| 99 |min| 104 |max| 110 |leftRecip| 116
              |leftPower| 121 |latex| 133 |inf| 138 |convert| 144 |coerce| 149
              |antiCommutator| 154 ^ 160 |Zero| 172 |One| 176 >= 180 > 186 =
              192 <= 198 < 204 - 210 + 221 * 227)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0))
            (CONS
             '#(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |OrderedSet&| |AbelianSemiGroup&| |Magma&| NIL |SetCategory&|
                NIL NIL |PartialOrder&| |BasicType&| NIL NIL)
             (CONS
              '#((|SemiRing|) (|SemiRng|) (|BiModule| $$ $$)
                 (|OrderedAbelianMonoidSup|) (|LeftModule| $$)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|OrderedSet|) (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|SetCategory|) (|CommutativeStar|) (|CoercibleTo| 18)
                 (|PartialOrder|) (|BasicType|) (|TwoSidedRecip|)
                 (|ConvertibleTo| 22))
              (|makeByteWordVec2| 23
                                  '(0 0 0 6 0 5 0 7 2 5 8 0 0 9 2 0 0 0 0 10 2
                                    0 0 0 0 12 2 5 0 0 0 14 2 5 8 0 0 15 2 0 8
                                    0 0 1 1 0 8 0 1 2 0 0 0 0 11 2 0 16 0 0 17
                                    2 0 8 0 0 1 0 0 0 1 1 0 16 0 1 2 0 0 0 21 1
                                    2 0 0 0 20 1 1 0 16 0 1 2 0 8 0 0 1 1 0 8 0
                                    1 2 0 0 0 0 12 2 0 0 0 0 10 1 0 16 0 1 2 0
                                    0 0 21 1 2 0 0 0 20 1 1 0 19 0 1 2 0 0 0 0
                                    13 1 0 22 0 1 1 0 18 0 1 2 0 0 0 0 1 2 0 0
                                    0 21 1 2 0 0 0 20 1 0 0 0 6 0 0 0 1 2 0 8 0
                                    0 1 2 0 8 0 0 1 2 0 8 0 0 1 2 0 8 0 0 1 2 0
                                    8 0 0 1 1 1 0 0 1 2 1 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 20 0 1 2 0 0 21 0 1 2 0 0 0 0 1 2 1 0
                                    23 0 1)))))
           '|lookupComplete|)) 
