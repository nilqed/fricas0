
(PUT '|NNI;sup;3%;1| '|SPADreplace| 'MAX) 

(SDEFUN |NNI;sup;3%;1| ((|x| (%)) (|y| (%)) (% (%))) (MAX |x| |y|)) 

(PUT '|NNI;inf;3%;2| '|SPADreplace| 'MIN) 

(SDEFUN |NNI;inf;3%;2| ((|x| (%)) (|y| (%)) (% (%))) (MIN |x| |y|)) 

(PUT '|NNI;shift;%I%;3| '|SPADreplace| 'ASH) 

(SDEFUN |NNI;shift;%I%;3| ((|x| (%)) (|n| (|Integer|)) (% (%))) (ASH |x| |n|)) 

(PUT '|NNI;qcoerce;I%;4| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |NNI;qcoerce;I%;4| ((|n| (|Integer|)) (% (%))) |n|) 

(SDEFUN |NNI;subtractIfCan;2%U;5|
        ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG ((|c| (|Integer|)))
               (SEQ (LETT |c| (- |x| |y|))
                    (EXIT
                     (COND ((< |c| 0) (CONS 1 "failed")) ('T (CONS 0 |c|))))))) 

(DECLAIM (NOTINLINE |NonNegativeInteger;|)) 

(DEFUN |NonNegativeInteger;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NonNegativeInteger|))
          (LETT % (GETREFV 21))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|NonNegativeInteger| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|AbelianGroup|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |NonNegativeInteger| ()
  (SPROG NIL
         (PROG (#1=#:G1569)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|NonNegativeInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|NonNegativeInteger|
                             (LIST
                              (CONS NIL (CONS 1 (|NonNegativeInteger;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|NonNegativeInteger|)))))))))) 

(MAKEPROP '|NonNegativeInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) |NNI;sup;3%;1| |NNI;inf;3%;2|
              |NNI;shift;%I%;3| |NNI;qcoerce;I%;4| (|Union| % '"failed")
              |NNI;subtractIfCan;2%U;5| (|Boolean|) (|OutputForm|) (|String|)
              (|PositiveInteger|) (|NonNegativeInteger|) (|HashState|)
              (|SingleInteger|) (|InputForm|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %)))
           '#(~= 0 |zero?| 6 |sup| 11 |subtractIfCan| 17 |smaller?| 23 |shift|
              29 |sample| 35 |rightRecip| 39 |rightPower| 44 |rem| 56 |recip|
              62 |random| 67 |quo| 72 |qcoerce| 78 |opposite?| 83 |one?| 89
              |min| 94 |max| 100 |leftRecip| 106 |leftPower| 111 |latex| 123
              |inf| 128 |hashUpdate!| 134 |hash| 140 |gcd| 145 |exquo| 151
              |divide| 157 |convert| 163 |coerce| 168 |antiCommutator| 173 ^
              179 |Zero| 191 |One| 195 >= 199 > 205 = 211 <= 217 < 223 - 229 +
              240 * 246)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0))
            (CONS
             '#(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |OrderedSet&| |AbelianSemiGroup&| |Magma&| NIL |SetCategory&|
                |Hashable&| NIL NIL |PartialOrder&| |BasicType&| NIL NIL)
             (CONS
              '#((|SemiRing|) (|SemiRng|) (|BiModule| $$ $$)
                 (|OrderedAbelianMonoidSup|) (|LeftModule| $$)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|OrderedSet|) (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|SetCategory|) (|Hashable|) (|CommutativeStar|)
                 (|CoercibleTo| 13) (|PartialOrder|) (|BasicType|)
                 (|TwoSidedRecip|) (|ConvertibleTo| 19))
              (|makeByteWordVec2| 20
                                  '(2 0 12 0 0 1 1 0 12 0 1 2 0 0 0 0 6 2 0 10
                                    0 0 11 2 0 12 0 0 1 2 0 0 0 5 8 0 0 0 1 1 0
                                    10 0 1 2 0 0 0 16 1 2 0 0 0 15 1 2 0 0 0 0
                                    1 1 0 10 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0 5
                                    9 2 0 12 0 0 1 1 0 12 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 10 0 1 2 0 0 0 16 1 2 0 0 0 15 1
                                    1 0 14 0 1 2 0 0 0 0 7 2 0 17 17 0 1 1 0 18
                                    0 1 2 0 0 0 0 1 2 0 10 0 0 1 2 0 20 0 0 1 1
                                    0 19 0 1 1 0 13 0 1 2 0 0 0 0 1 2 0 0 0 16
                                    1 2 0 0 0 15 1 0 0 0 1 0 0 0 1 2 0 12 0 0 1
                                    2 0 12 0 0 1 2 0 12 0 0 1 2 0 12 0 0 1 2 0
                                    12 0 0 1 2 1 0 0 0 1 1 1 0 0 1 2 0 0 0 0 1
                                    2 0 0 15 0 1 2 0 0 16 0 1 2 0 0 0 0 1 2 1 0
                                    5 0 1)))))
           '|lookupComplete|)) 
