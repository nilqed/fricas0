
(PUT '|DFVEC;qelt;$IDf;1| '|SPADreplace| 'DELT) 

(SDEFUN |DFVEC;qelt;$IDf;1| ((|x| $) (|i| |Integer|) ($ |DoubleFloat|))
        (DELT |x| |i|)) 

(PUT '|DFVEC;qsetelt!;$I2Df;2| '|SPADreplace| 'DSETELT) 

(SDEFUN |DFVEC;qsetelt!;$I2Df;2|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|DoubleFloat|)) ($ . #1#))
        (DSETELT |x| |i| |s|)) 

(PUT '|DFVEC;#;$Nni;3| '|SPADreplace| 'DLEN) 

(SDEFUN |DFVEC;#;$Nni;3| ((|x| $) ($ |NonNegativeInteger|)) (DLEN |x|)) 

(PUT '|DFVEC;minIndex;$I;4| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |DFVEC;minIndex;$I;4| ((|x| $) ($ |Integer|)) 0) 

(PUT '|DFVEC;empty;$;5| '|SPADreplace| '(XLAM NIL (MAKE-DOUBLE-VECTOR 0))) 

(SDEFUN |DFVEC;empty;$;5| (($ $)) (MAKE-DOUBLE-VECTOR 0)) 

(PUT '|DFVEC;qnew;I$;6| '|SPADreplace| 'MAKE-DOUBLE-VECTOR) 

(SDEFUN |DFVEC;qnew;I$;6| ((|n| |Integer|) ($ $)) (MAKE-DOUBLE-VECTOR |n|)) 

(PUT '|DFVEC;new;NniDf$;7| '|SPADreplace| 'MAKE-DOUBLE-VECTOR1) 

(SDEFUN |DFVEC;new;NniDf$;7|
        ((|n| |NonNegativeInteger|) (|x| |DoubleFloat|) ($ $))
        (MAKE-DOUBLE-VECTOR1 |n| |x|)) 

(PUT '|DFVEC;qelt;$IDf;8| '|SPADreplace| 'DELT) 

(SDEFUN |DFVEC;qelt;$IDf;8| ((|x| $) (|i| |Integer|) ($ |DoubleFloat|))
        (DELT |x| |i|)) 

(PUT '|DFVEC;elt;$IDf;9| '|SPADreplace| 'DELT) 

(SDEFUN |DFVEC;elt;$IDf;9| ((|x| $) (|i| |Integer|) ($ |DoubleFloat|))
        (DELT |x| |i|)) 

(PUT '|DFVEC;qsetelt!;$I2Df;10| '|SPADreplace| 'DSETELT) 

(SDEFUN |DFVEC;qsetelt!;$I2Df;10|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|DoubleFloat|)) ($ . #1#))
        (DSETELT |x| |i| |s|)) 

(PUT '|DFVEC;setelt!;$I2Df;11| '|SPADreplace| 'DSETELT) 

(SDEFUN |DFVEC;setelt!;$I2Df;11|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|DoubleFloat|)) ($ . #1#))
        (DSETELT |x| |i| |s|)) 

(SDEFUN |DFVEC;fill!;$Df$;12| ((|x| $) (|s| |DoubleFloat|) ($ $))
        (SPROG ((#1=#:G3076 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0 . #2=(|DFVEC;fill!;$Df$;12|))
                     (LETT #1# (|sub_SI| (DLEN |x|) 1) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (DSETELT |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(DECLAIM (NOTINLINE |DoubleFloatVector;|)) 

(DEFUN |DoubleFloatVector| ()
  (SPROG NIL
         (PROG (#1=#:G3088)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DoubleFloatVector|)
                    . #2=(|DoubleFloatVector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DoubleFloatVector|
                             (LIST
                              (CONS NIL (CONS 1 (|DoubleFloatVector;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|DoubleFloatVector|)))))))))) 

(DEFUN |DoubleFloatVector;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G3086 NIL) (#2=#:G3085 NIL) (#3=#:G3084 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|DoubleFloatVector|) . #4=(|DoubleFloatVector|))
    (LETT $ (GETREFV 38) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|Comparable|))
                                              . #4#)
                                        (OR #1#
                                            (|HasCategory| (|DoubleFloat|)
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|SetCategory|))
                                              . #4#)
                                        (AND
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|Evalable|
                                                          (|DoubleFloat|)))
                                         #2#)
                                        (OR
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|BasicType|))
                                         #1#
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|OrderedSet|))
                                         #2#)
                                        (OR #1#
                                            (|HasCategory| (|DoubleFloat|)
                                                           '(|OrderedSet|))
                                            #2#)
                                        (LETT #3#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #4#)
                                        (OR #3# #1#
                                            (|HasCategory| (|DoubleFloat|)
                                                           '(|OrderedSet|))
                                            #2#)
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|AbelianSemiGroup|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|AbelianGroup|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|SemiGroup|))
                                        (AND
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|SemiRng|)))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|Ring|))
                                        (AND
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|RadicalCategory|))
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|Ring|)))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|DoubleFloatVector| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 524288))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 1048576))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|DoubleFloat|) '(|BasicType|))
         (|augmentPredVector| $ 2097152))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 4194304))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| $ '(|shallowlyMutable|))
         (|HasCategory| (|DoubleFloat|) '(|OrderedSet|))
         (|augmentPredVector| $ 8388608))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|DoubleFloat|) '(|OrderedSet|))
         (|augmentPredVector| $ 16777216))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|DoubleFloat|) '(|OrderedSet|))))
     (|augmentPredVector| $ 33554432))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|DoubleFloat|) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|DoubleFloat|) '(|OrderedSet|)))
         #3#)
     (|augmentPredVector| $ 134217728))
    (AND
     (OR
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|DoubleFloat|) '(|BasicType|)))
      (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|DoubleFloat|) '(|OrderedSet|)))
      #2#)
     (|augmentPredVector| $ 268435456))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|DoubleFloatVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|DoubleFloat|) (|Integer|)
              |DFVEC;qelt;$IDf;8| |DFVEC;qsetelt!;$I2Df;10|
              (|NonNegativeInteger|) |DFVEC;#;$Nni;3| |DFVEC;minIndex;$I;4|
              |DFVEC;empty;$;5| |DFVEC;qnew;I$;6| |DFVEC;new;NniDf$;7|
              |DFVEC;elt;$IDf;9| |DFVEC;setelt!;$I2Df;11| |DFVEC;fill!;$Df$;12|
              (|List| 6) (|Equation| 6) (|List| 20) (|Mapping| 6 6 6)
              (|Boolean|) (|Mapping| 23 6 6) (|OutputForm|) (|HashState|)
              (|SingleInteger|) (|String|) (|InputForm|) (|Matrix| 6)
              (|Mapping| 23 6) (|UniversalSegment| 7) (|Void|) (|Mapping| 6 6)
              (|List| $) (|Union| 6 '"failed") (|List| 7))
           '#(~= 0 |zero?| 6 |zero| 11 |trim| 16 |swap!| 22 |sorted?| 29
              |sort!| 40 |sort| 51 |smaller?| 62 |size?| 68 |setelt!| 74
              |select| 88 |sample| 94 |rightTrim| 98 |reverse!| 104 |reverse|
              109 |removeDuplicates| 114 |remove| 119 |reduce| 131 |qsetelt!|
              152 |qnew| 159 |qelt| 164 |position| 170 |parts| 189
              |outerProduct| 194 |new| 200 |more?| 206 |minIndex| 212 |min| 217
              |merge| 223 |members| 236 |member?| 241 |maxIndex| 247 |max| 252
              |map!| 258 |map| 264 |less?| 277 |length| 283 |leftTrim| 288
              |latex| 294 |insert| 299 |indices| 313 |index?| 318 |hashUpdate!|
              324 |hash| 330 |first| 335 |find| 346 |fill!| 352 |every?| 358
              |eval| 364 |eq?| 390 |entry?| 396 |entries| 402 |empty?| 407
              |empty| 412 |elt| 416 |dot| 435 |delete| 441 |cross| 453 |count|
              459 |copyInto!| 471 |copy| 478 |convert| 483 |construct| 488
              |concat| 493 |coerce| 516 |any?| 521 >= 527 > 533 = 539 <= 545 <
              551 - 557 + 568 * 574 |#| 592)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 1 0 6 0 0 8 10 0 0 0 0 0 8 9 12 1
                                  2))
            (CONS
             '#(|VectorCategory&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                NIL |InnerEvalable&| |BasicType&| NIL |PartialOrder&| NIL)
             (CONS
              '#((|VectorCategory| 6) (|OneDimensionalArrayAggregate| 6)
                 (|FiniteLinearAggregate| 6) (|LinearAggregate| 6)
                 (|IndexedAggregate| 7 6) (|Collection| 6) (|OrderedSet|)
                 (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 7 6) (|Evalable| 6) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Eltable| 32 $$)
                 (|Type|) (|Eltable| 7 6) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 25) (|PartialOrder|) (|ConvertibleTo| 29))
              (|makeByteWordVec2| 37
                                  '(2 29 23 0 0 1 1 14 23 0 1 1 14 0 10 1 2 22
                                    0 0 6 1 3 20 33 0 7 7 1 1 25 23 0 1 2 21 23
                                    24 0 1 1 24 0 0 1 2 23 0 24 0 1 1 25 0 0 1
                                    2 21 0 24 0 1 2 26 23 0 0 1 2 0 23 0 10 1 3
                                    20 6 0 32 6 1 3 20 6 0 7 6 17 2 21 0 31 0 1
                                    0 0 0 1 2 22 0 0 6 1 1 23 0 0 1 1 21 0 0 1
                                    1 22 0 0 1 2 22 0 6 0 1 2 21 0 31 0 1 4 22
                                    6 22 0 6 6 1 3 21 6 22 0 6 1 2 21 6 22 0 1
                                    3 20 6 0 7 6 9 1 0 0 7 14 2 0 6 0 7 8 2 22
                                    7 6 0 1 3 22 7 6 0 7 1 2 21 7 31 0 1 1 21
                                    19 0 1 2 18 30 0 0 1 2 0 0 10 6 15 2 0 23 0
                                    10 1 1 3 7 0 12 2 25 0 0 0 1 2 25 0 0 0 1 3
                                    21 0 24 0 0 1 1 21 19 0 1 2 22 23 6 0 1 1 3
                                    7 0 1 2 25 0 0 0 1 2 20 0 34 0 1 3 0 0 22 0
                                    0 1 2 0 0 34 0 1 2 0 23 0 10 1 1 19 6 0 1 2
                                    22 0 0 6 1 1 27 28 0 1 3 0 0 0 0 7 1 3 0 0
                                    6 0 7 1 1 0 37 0 1 2 0 23 7 0 1 2 27 26 26
                                    0 1 1 27 27 0 1 1 3 6 0 1 2 0 0 0 10 1 2 0
                                    36 31 0 1 2 20 0 0 6 18 2 21 23 31 0 1 3 8
                                    0 0 6 6 1 3 8 0 0 19 19 1 2 8 0 0 20 1 2 8
                                    0 0 21 1 2 0 23 0 0 1 2 22 23 6 0 1 1 0 19
                                    0 1 1 0 23 0 1 0 0 0 13 2 0 0 0 32 1 2 0 6
                                    0 7 16 3 0 6 0 7 6 1 2 17 6 0 0 1 2 0 0 0 7
                                    1 2 0 0 0 32 1 2 18 0 0 0 1 2 22 10 6 0 1 2
                                    21 10 31 0 1 3 23 0 0 0 7 1 1 0 0 0 1 1 2
                                    29 0 1 1 0 0 19 1 1 0 0 35 1 2 0 0 0 0 1 2
                                    0 0 0 6 1 2 0 0 6 0 1 1 28 25 0 1 2 21 23
                                    31 0 1 2 25 23 0 0 1 2 25 23 0 0 1 2 29 23
                                    0 0 1 2 25 23 0 0 1 2 25 23 0 0 1 2 15 0 0
                                    0 1 1 15 0 0 1 2 13 0 0 0 1 2 15 0 7 0 1 2
                                    16 0 0 6 1 2 16 0 6 0 1 1 21 10 0 11)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatVector| 'NILADIC T) 
