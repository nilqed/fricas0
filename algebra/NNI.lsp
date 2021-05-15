
(SETQ |$CategoryFrame|
        (|put| #1='|NonNegativeInteger| '|SuperDomain| #2='(|Integer|)
               (|put| #2# #3='|SubDomain|
                      (CONS '(|NonNegativeInteger| >= |#1| 0)
                            (DELASC #1# (|get| #2# #3# |$CategoryFrame|)))
                      |$CategoryFrame|))) 

(PUT '|NNI;sup;3$;1| '|SPADreplace| 'MAX) 

(SDEFUN |NNI;sup;3$;1| ((|x| $) (|y| $) ($ $)) (MAX |x| |y|)) 

(PUT '|NNI;shift;$I$;2| '|SPADreplace| 'ASH) 

(SDEFUN |NNI;shift;$I$;2| ((|x| $) (|n| |Integer|) ($ $)) (ASH |x| |n|)) 

(PUT '|NNI;qcoerce;I$;3| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |NNI;qcoerce;I$;3| ((|n| |Integer|) ($ $)) |n|) 

(SDEFUN |NNI;subtractIfCan;2$U;4| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG ((|c| (|Integer|)))
               (SEQ (LETT |c| (- |x| |y|))
                    (EXIT
                     (COND ((< |c| 0) (CONS 1 "failed")) ('T (CONS 0 |c|))))))) 

(DECLAIM (NOTINLINE |NonNegativeInteger;|)) 

(DEFUN |NonNegativeInteger| ()
  (SPROG NIL
         (PROG (#1=#:G1888)
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

(DEFUN |NonNegativeInteger;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NonNegativeInteger|))
          (LETT $ (GETREFV 20))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|NonNegativeInteger| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|AbelianGroup|)) (|augmentPredVector| $ 1))
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|NonNegativeInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) |NNI;sup;3$;1| |NNI;shift;$I$;2|
              |NNI;qcoerce;I$;3| (|Union| $ '"failed")
              |NNI;subtractIfCan;2$U;4|
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|InputForm|)
              (|PositiveInteger|) (|NonNegativeInteger|) (|Boolean|) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 0 |zero?| 6 |sup| 11 |subtractIfCan| 17 |smaller?| 23 |shift|
              29 |sample| 35 |rightRecip| 39 |rightPower| 44 |rem| 56 |recip|
              62 |random| 67 |quo| 72 |qcoerce| 78 |opposite?| 83 |one?| 89
              |min| 94 |max| 100 |leftRecip| 106 |leftPower| 111 |latex| 123
              |hashUpdate!| 128 |hash| 134 |gcd| 139 |exquo| 145 |divide| 151
              |convert| 157 |coerce| 162 |antiCommutator| 167 ^ 173 |Zero| 185
              |One| 189 >= 193 > 199 = 205 <= 211 < 217 - 223 + 234 * 240)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0))
            (CONS
             '#(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL |OrderedSet&|
                NIL |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                NIL |Magma&| |AbelianSemiGroup&| NIL |SetCategory&| NIL NIL
                |BasicType&| |PartialOrder&| NIL)
             (CONS
              '#((|SemiRing|) (|SemiRng|) (|OrderedAbelianMonoidSup|)
                 (|BiModule| $$ $$) (|OrderedCancellationAbelianMonoid|)
                 (|RightModule| $$) (|LeftModule| $$) (|OrderedAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Comparable|)
                 (|Magma|) (|AbelianSemiGroup|) (|CommutativeStar|)
                 (|SetCategory|) (|ConvertibleTo| 12) (|TwoSidedRecip|)
                 (|BasicType|) (|PartialOrder|) (|CoercibleTo| 19))
              (|makeByteWordVec2| 19
                                  '(2 0 15 0 0 1 1 0 15 0 1 2 0 0 0 0 6 2 0 9 0
                                    0 10 2 0 15 0 0 1 2 0 0 0 5 7 0 0 0 1 1 0 9
                                    0 1 2 0 0 0 13 1 2 0 0 0 14 1 2 0 0 0 0 1 1
                                    0 9 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0 5 8 2 0
                                    15 0 0 1 1 0 15 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    1 0 9 0 1 2 0 0 0 13 1 2 0 0 0 14 1 1 0 16
                                    0 1 2 0 18 18 0 1 1 0 17 0 1 2 0 0 0 0 1 2
                                    0 9 0 0 1 2 0 11 0 0 1 1 0 12 0 1 1 0 19 0
                                    1 2 0 0 0 0 1 2 0 0 0 13 1 2 0 0 0 14 1 0 0
                                    0 1 0 0 0 1 2 0 15 0 0 1 2 0 15 0 0 1 2 0
                                    15 0 0 1 2 0 15 0 0 1 2 0 15 0 0 1 1 1 0 0
                                    1 2 1 0 0 0 1 2 0 0 0 0 1 2 1 0 5 0 1 2 0 0
                                    0 0 1 2 0 0 14 0 1 2 0 0 13 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|NonNegativeInteger| 'NILADIC T) 
