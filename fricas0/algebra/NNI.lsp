
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
               (SEQ (LETT |c| (- |x| |y|) |NNI;subtractIfCan;2$U;4|)
                    (EXIT
                     (COND ((< |c| 0) (CONS 1 "failed")) ('T (CONS 0 |c|))))))) 

(DECLAIM (NOTINLINE |NonNegativeInteger;|)) 

(DEFUN |NonNegativeInteger| ()
  (SPROG NIL
         (PROG (#1=#:G2263)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|NonNegativeInteger|)
                    . #2=(|NonNegativeInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|NonNegativeInteger|
                             (LIST
                              (CONS NIL (CONS 1 (|NonNegativeInteger;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|NonNegativeInteger|)))))))))) 

(DEFUN |NonNegativeInteger;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NonNegativeInteger|) . #1=(|NonNegativeInteger|))
          (LETT $ (GETREFV 20) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|NonNegativeInteger| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
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
              29 |sample| 35 |rem| 39 |recip| 45 |random| 50 |quo| 55 |qcoerce|
              61 |opposite?| 66 |one?| 72 |min| 77 |max| 83 |latex| 89
              |hashUpdate!| 94 |hash| 100 |gcd| 105 |exquo| 111 |divide| 117
              |convert| 123 |coerce| 128 ^ 133 |Zero| 145 |One| 149 >= 153 >
              159 = 165 <= 171 < 177 + 183 * 189)
           'NIL
           (CONS
            (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(NIL NIL NIL NIL NIL NIL |OrderedSet&| |Monoid&| NIL
                |AbelianMonoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                |SetCategory&| NIL NIL |BasicType&| |PartialOrder&| NIL)
             (CONS
              '#((|OrderedAbelianMonoidSup|)
                 (|OrderedCancellationAbelianMonoid|) (|OrderedAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedSet|) (|Monoid|)
                 (|SemiRng|) (|AbelianMonoid|) (|Comparable|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|ConvertibleTo| 12)
                 (|CommutativeStar|) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 19))
              (|makeByteWordVec2| 19
                                  '(2 0 15 0 0 1 1 0 15 0 1 2 0 0 0 0 6 2 0 9 0
                                    0 10 2 0 15 0 0 1 2 0 0 0 5 7 0 0 0 1 2 0 0
                                    0 0 1 1 0 9 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0
                                    5 8 2 0 15 0 0 1 1 0 15 0 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 1 0 16 0 1 2 0 18 18 0 1 1 0 17 0 1
                                    2 0 0 0 0 1 2 0 9 0 0 1 2 0 11 0 0 1 1 0 12
                                    0 1 1 0 19 0 1 2 0 0 0 13 1 2 0 0 0 14 1 0
                                    0 0 1 0 0 0 1 2 0 15 0 0 1 2 0 15 0 0 1 2 0
                                    15 0 0 1 2 0 15 0 0 1 2 0 15 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 14 0 1 2 0 0 13 0
                                    1)))))
           '|lookupComplete|)) 

(MAKEPROP '|NonNegativeInteger| 'NILADIC T) 
