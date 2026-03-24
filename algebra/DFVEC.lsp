
(PUT '|DFVEC;qelt;%IDf;1| '|SPADreplace| 'DELT) 

(SDEFUN |DFVEC;qelt;%IDf;1| ((|x| (%)) (|i| (|Integer|)) (% (|DoubleFloat|)))
        (DELT |x| |i|)) 

(PUT '|DFVEC;qsetelt!;%I2Df;2| '|SPADreplace| 'DSETELT) 

(SDEFUN |DFVEC;qsetelt!;%I2Df;2|
        ((|x| (%)) (|i| (|Integer|)) (|s| #1=(|DoubleFloat|)) (% #1#))
        (DSETELT |x| |i| |s|)) 

(PUT '|DFVEC;#;%Nni;3| '|SPADreplace| 'DLEN) 

(SDEFUN |DFVEC;#;%Nni;3| ((|x| (%)) (% (|NonNegativeInteger|))) (DLEN |x|)) 

(PUT '|DFVEC;minIndex;%I;4| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |DFVEC;minIndex;%I;4| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|DFVEC;empty;%;5| '|SPADreplace| '(XLAM NIL (MAKE_DOUBLE_VECTOR 0))) 

(SDEFUN |DFVEC;empty;%;5| ((% (%))) (MAKE_DOUBLE_VECTOR 0)) 

(PUT '|DFVEC;qnew;I%;6| '|SPADreplace| 'MAKE_DOUBLE_VECTOR) 

(SDEFUN |DFVEC;qnew;I%;6| ((|n| (|Integer|)) (% (%))) (MAKE_DOUBLE_VECTOR |n|)) 

(PUT '|DFVEC;new;NniDf%;7| '|SPADreplace| 'MAKE_DOUBLE_VECTOR1) 

(SDEFUN |DFVEC;new;NniDf%;7|
        ((|n| (|NonNegativeInteger|)) (|x| (|DoubleFloat|)) (% (%)))
        (MAKE_DOUBLE_VECTOR1 |n| |x|)) 

(PUT '|DFVEC;qelt;%IDf;8| '|SPADreplace| 'DELT) 

(SDEFUN |DFVEC;qelt;%IDf;8| ((|x| (%)) (|i| (|Integer|)) (% (|DoubleFloat|)))
        (DELT |x| |i|)) 

(PUT '|DFVEC;elt;%IDf;9| '|SPADreplace| 'DELT) 

(SDEFUN |DFVEC;elt;%IDf;9| ((|x| (%)) (|i| (|Integer|)) (% (|DoubleFloat|)))
        (DELT |x| |i|)) 

(PUT '|DFVEC;qsetelt!;%I2Df;10| '|SPADreplace| 'DSETELT) 

(SDEFUN |DFVEC;qsetelt!;%I2Df;10|
        ((|x| (%)) (|i| (|Integer|)) (|s| #1=(|DoubleFloat|)) (% #1#))
        (DSETELT |x| |i| |s|)) 

(PUT '|DFVEC;setelt!;%I2Df;11| '|SPADreplace| 'DSETELT) 

(SDEFUN |DFVEC;setelt!;%I2Df;11|
        ((|x| (%)) (|i| (|Integer|)) (|s| #1=(|DoubleFloat|)) (% #1#))
        (DSETELT |x| |i| |s|)) 

(SDEFUN |DFVEC;fill!;%Df%;12| ((|x| (%)) (|s| (|DoubleFloat|)) (% (%)))
        (SPROG ((#1=#:G2599 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (|sub_SI| (DLEN |x|) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (DSETELT |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(DECLAIM (NOTINLINE |DoubleFloatVector;|)) 

(DEFUN |DoubleFloatVector;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G2609 NIL) (#2=#:G2608 NIL) (#3=#:G2607 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|DoubleFloatVector|))
    (LETT % (GETREFV 38))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|Hashable|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| (|DoubleFloat|)
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|Evalable|
                                                          (|DoubleFloat|)))
                                         #2#)
                                        (OR #1#
                                            (|HasCategory| (|DoubleFloat|)
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|BasicType|))
                                         #1#
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|Hashable|))
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|OrderedSet|))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
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
                                                        '(|Ring|)))))))
    (|haddProp| |$ConstructorCache| '|DoubleFloatVector| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 1048576))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2097152))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|DoubleFloat|) '(|BasicType|))
         (|augmentPredVector| % 4194304))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 8388608))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|HasCategory| (|DoubleFloat|) '(|OrderedSet|))
         (|augmentPredVector| % 16777216))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|DoubleFloat|) '(|OrderedSet|))
         (|augmentPredVector| % 33554432))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|DoubleFloat|) '(|OrderedSet|))))
     (|augmentPredVector| % 67108864))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|DoubleFloat|) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| % 134217728))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|DoubleFloat|) '(|OrderedSet|)))
         #3#)
     (|augmentPredVector| % 268435456))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|DoubleFloat|) '(|Hashable|))
         (|augmentPredVector| % 536870912))
    (AND
     (OR
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|DoubleFloat|) '(|BasicType|)))
      (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|DoubleFloat|) '(|Hashable|)))
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|DoubleFloat|) '(|OrderedSet|)))
      #2#)
     (|augmentPredVector| % 1073741824))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |DoubleFloatVector| ()
  (SPROG NIL
         (PROG (#1=#:G2611)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DoubleFloatVector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DoubleFloatVector|
                             (LIST
                              (CONS NIL (CONS 1 (|DoubleFloatVector;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|DoubleFloatVector|)))))))))) 

(MAKEPROP '|DoubleFloatVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|DoubleFloat|) (|Integer|)
              |DFVEC;qelt;%IDf;8| |DFVEC;qsetelt!;%I2Df;10|
              (|NonNegativeInteger|) |DFVEC;#;%Nni;3| |DFVEC;minIndex;%I;4|
              |DFVEC;empty;%;5| |DFVEC;qnew;I%;6| |DFVEC;new;NniDf%;7|
              |DFVEC;elt;%IDf;9| |DFVEC;setelt!;%I2Df;11| |DFVEC;fill!;%Df%;12|
              (|Boolean|) (|Mapping| 6 6) (|List| 6) (|List| 7)
              (|Union| 6 '"failed") (|Mapping| 19 6) (|UniversalSegment| 7)
              (|List| %) (|Mapping| 6 6 6) (|Mapping| 19 6 6) (|HashState|)
              (|SingleInteger|) (|Equation| 6) (|List| 31) (|OutputForm|)
              (|String|) (|Void|) (|InputForm|) (|Matrix| 6))
           '#(~= 0 |zero?| 6 |zero| 11 |trim| 16 |swap!| 22 |sorted?| 29
              |sort!| 40 |sort| 51 |smaller?| 62 |size?| 68 |setelt!| 74
              |select| 88 |sample| 94 |rightTrim| 98 |reverse!| 104 |reverse|
              109 |removeDuplicates| 114 |remove| 119 |reduce| 131 |qsetelt!|
              152 |qnew| 159 |qelt| 164 |position| 170 |parts| 189
              |outerProduct| 194 |new| 200 |more?| 206 |minIndex| 212 |min| 217
              |merge| 228 |members| 241 |member?| 246 |maxIndex| 252 |max| 257
              |map!| 274 |map| 280 |less?| 293 |length| 299 |leftTrim| 304
              |latex| 310 |insert| 315 |indices| 329 |index?| 334 |hashUpdate!|
              340 |hash| 346 |first| 351 |find| 362 |fill!| 368 |every?| 374
              |eval| 380 |eq?| 406 |entry?| 412 |entries| 418 |empty?| 423
              |empty| 428 |elt| 432 |dot| 451 |delete| 457 |cross| 469 |count|
              475 |copyInto!| 487 |copy| 494 |convert| 499 |construct| 504
              |concat| 509 |coerce| 532 |any?| 537 >= 543 > 549 = 555 <= 561 <
              567 - 573 + 584 * 590 |#| 608)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 1 0 0 7 0 2 10 9 0 0 3 11 1 13 9 0 0
                                  0 0 0))
            (CONS
             '#(|VectorCategory&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |OrderedSet&| |Collection&|
                |IndexedAggregate&| NIL |HomogeneousAggregate&| |Hashable&|
                |SetCategory&| |Evalable&| |EltableAggregate&| |Aggregate&| NIL
                |BasicType&| |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL
                NIL NIL)
             (CONS
              '#((|VectorCategory| 6) (|OneDimensionalArrayAggregate| 6)
                 (|FiniteLinearAggregate| 6) (|LinearAggregate| 6)
                 (|OrderedSet|) (|Collection| 6) (|IndexedAggregate| 7 6)
                 (|Comparable|) (|HomogeneousAggregate| 6) (|Hashable|)
                 (|SetCategory|) (|Evalable| 6) (|EltableAggregate| 7 6)
                 (|Aggregate|) (|ConvertibleTo| 36) (|BasicType|)
                 (|PartialOrder|) (|CoercibleTo| 33) (|InnerEvalable| 6 6)
                 (|Eltable| 7 6) (|Type|) (|Eltable| 25 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| 37
                                  '(2 31 19 0 0 1 1 15 19 0 1 1 15 0 10 1 2 23
                                    0 0 6 1 3 21 35 0 7 7 1 1 26 19 0 1 2 22 19
                                    28 0 1 2 24 0 28 0 1 1 25 0 0 1 1 26 0 0 1
                                    2 22 0 28 0 1 2 27 19 0 0 1 2 0 19 0 10 1 3
                                    21 6 0 7 6 17 3 21 6 0 25 6 1 2 22 0 24 0 1
                                    0 0 0 1 2 23 0 0 6 1 1 24 0 0 1 1 22 0 0 1
                                    1 23 0 0 1 2 23 0 6 0 1 2 22 0 24 0 1 4 23
                                    6 27 0 6 6 1 3 22 6 27 0 6 1 2 22 6 27 0 1
                                    3 21 6 0 7 6 9 1 0 0 7 14 2 0 6 0 7 8 2 23
                                    7 6 0 1 3 23 7 6 0 7 1 2 22 7 24 0 1 1 22
                                    21 0 1 2 19 37 0 0 1 2 0 0 10 6 15 2 0 19 0
                                    10 1 1 4 7 0 12 1 26 6 0 1 2 26 0 0 0 1 2
                                    26 0 0 0 1 3 22 0 28 0 0 1 1 22 21 0 1 2 23
                                    19 6 0 1 1 4 7 0 1 1 26 6 0 1 2 26 0 0 0 1
                                    2 22 6 28 0 1 2 21 0 20 0 1 2 0 0 20 0 1 3
                                    0 0 27 0 0 1 2 0 19 0 10 1 1 20 6 0 1 2 23
                                    0 0 6 1 1 28 34 0 1 3 0 0 6 0 7 1 3 0 0 0 0
                                    7 1 1 0 22 0 1 2 0 19 7 0 1 2 30 29 29 0 1
                                    1 30 30 0 1 2 0 0 0 10 1 1 4 6 0 1 2 0 23
                                    24 0 1 2 21 0 0 6 18 2 22 19 24 0 1 2 9 0 0
                                    31 1 2 9 0 0 32 1 3 9 0 0 6 6 1 3 9 0 0 21
                                    21 1 2 0 19 0 0 1 2 23 19 6 0 1 1 0 21 0 1
                                    1 0 19 0 1 0 0 0 13 3 0 6 0 7 6 1 2 0 6 0 7
                                    16 2 0 0 0 25 1 2 18 6 0 0 1 2 0 0 0 7 1 2
                                    0 0 0 25 1 2 19 0 0 0 1 2 23 10 6 0 1 2 22
                                    10 24 0 1 3 24 0 0 0 7 1 1 0 0 0 1 1 3 36 0
                                    1 1 0 0 21 1 2 0 0 0 6 1 2 0 0 6 0 1 1 0 0
                                    26 1 2 0 0 0 0 1 1 29 33 0 1 2 22 19 24 0 1
                                    2 26 19 0 0 1 2 26 19 0 0 1 2 31 19 0 0 1 2
                                    26 19 0 0 1 2 26 19 0 0 1 1 16 0 0 1 2 16 0
                                    0 0 1 2 14 0 0 0 1 2 16 0 7 0 1 2 17 0 6 0
                                    1 2 17 0 0 6 1 1 22 10 0 11)))))
           '|lookupComplete|)) 
