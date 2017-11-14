
(SETQ |$CategoryFrame|
        (|put| #1='|PositiveInteger| '|SuperDomain| #2='(|NonNegativeInteger|)
               (|put| #2# #3='|SubDomain|
                      (CONS '(|PositiveInteger| SPADCALL |#1| 0 (QREFELT $ 7))
                            (DELASC #1# (|get| #2# #3# |$CategoryFrame|)))
                      |$CategoryFrame|))) 

(PUT '|PI;qcoerce;I$;1| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |PI;qcoerce;I$;1| ((|n| |Integer|) ($ $)) |n|) 

(DECLAIM (NOTINLINE |PositiveInteger;|)) 

(DEFUN |PositiveInteger| ()
  (SPROG NIL
         (PROG (#1=#:G2417)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|PositiveInteger|)
                    . #2=(|PositiveInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|PositiveInteger|
                             (LIST (CONS NIL (CONS 1 (|PositiveInteger;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|PositiveInteger|)))))))))) 

(DEFUN |PositiveInteger;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|PositiveInteger|) . #1=(|PositiveInteger|))
          (LETT $ (GETREFV 17) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PositiveInteger| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PositiveInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|NonNegativeInteger|) (|Boolean|) (0 . >)
              (|Integer|) |PI;qcoerce;I$;1| (|InputForm|) (|PositiveInteger|)
              (|Union| $ '"failed") (|HashState|) (|String|) (|OutputForm|)
              (|SingleInteger|))
           '#(~= 6 |smaller?| 12 |sample| 18 |rightRecip| 22 |rightPower| 27
              |recip| 39 |qcoerce| 44 |one?| 49 |min| 54 |max| 60 |leftRecip|
              66 |leftPower| 71 |latex| 83 |hashUpdate!| 88 |hash| 94 |gcd| 99
              |convert| 105 |coerce| 110 ^ 115 |One| 127 >= 131 > 137 = 143 <=
              149 < 155 + 161 * 167)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL |OrderedSet&| |MagmaWithUnit&| NIL NIL |Magma&|
                     |AbelianSemiGroup&| |SetCategory&| NIL NIL |BasicType&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedAbelianSemiGroup|) (|Monoid|) (|OrderedSet|)
                      (|MagmaWithUnit|) (|SemiGroup|) (|Comparable|) (|Magma|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|ConvertibleTo| 10)
                      (|CommutativeStar|) (|BasicType|) (|PartialOrder|)
                      (|CoercibleTo| 15))
                   (|makeByteWordVec2| 16
                                       '(2 5 6 0 0 7 2 0 6 0 0 1 2 0 6 0 0 1 0
                                         0 0 1 1 0 12 0 1 2 0 0 0 11 1 2 0 0 0
                                         5 1 1 0 12 0 1 1 0 0 8 9 1 0 6 0 1 2 0
                                         0 0 0 1 2 0 0 0 0 1 1 0 12 0 1 2 0 0 0
                                         11 1 2 0 0 0 5 1 1 0 14 0 1 2 0 13 13
                                         0 1 1 0 16 0 1 2 0 0 0 0 1 1 0 10 0 1
                                         1 0 15 0 1 2 0 0 0 11 1 2 0 0 0 5 1 0
                                         0 0 1 2 0 6 0 0 1 2 0 6 0 0 1 2 0 6 0
                                         0 1 2 0 6 0 0 1 2 0 6 0 0 1 2 0 0 0 0
                                         1 2 0 0 0 0 1 2 0 0 11 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|PositiveInteger| 'NILADIC T) 
