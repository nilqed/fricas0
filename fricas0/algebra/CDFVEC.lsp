
(PUT '|CDFVEC;qelt;$IC;1| '|SPADreplace| 'CDELT) 

(SDEFUN |CDFVEC;qelt;$IC;1|
        ((|x| $) (|i| |Integer|) ($ |Complex| (|DoubleFloat|))) (CDELT |x| |i|)) 

(PUT '|CDFVEC;qsetelt!;$I2C;2| '|SPADreplace| 'CDSETELT) 

(SDEFUN |CDFVEC;qsetelt!;$I2C;2|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|Complex| (|DoubleFloat|)))
         ($ . #1#))
        (CDSETELT |x| |i| |s|)) 

(PUT '|CDFVEC;#;$Nni;3| '|SPADreplace| 'CDLEN) 

(SDEFUN |CDFVEC;#;$Nni;3| ((|x| $) ($ |NonNegativeInteger|)) (CDLEN |x|)) 

(PUT '|CDFVEC;minIndex;$I;4| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |CDFVEC;minIndex;$I;4| ((|x| $) ($ |Integer|)) 0) 

(PUT '|CDFVEC;empty;$;5| '|SPADreplace| '(XLAM NIL (MAKE-CDOUBLE-VECTOR 0))) 

(SDEFUN |CDFVEC;empty;$;5| (($ $)) (MAKE-CDOUBLE-VECTOR 0)) 

(PUT '|CDFVEC;qnew;I$;6| '|SPADreplace| 'MAKE-CDOUBLE-VECTOR) 

(SDEFUN |CDFVEC;qnew;I$;6| ((|n| |Integer|) ($ $)) (MAKE-CDOUBLE-VECTOR |n|)) 

(SDEFUN |CDFVEC;new;NniC$;7|
        ((|n| |NonNegativeInteger|) (|x| |Complex| (|DoubleFloat|)) ($ $))
        (SPROG ((|res| ($)))
               (SEQ (LETT |res| (MAKE-CDOUBLE-VECTOR |n|) |CDFVEC;new;NniC$;7|)
                    (EXIT (SPADCALL |res| |x| (QREFELT $ 15)))))) 

(PUT '|CDFVEC;qelt;$IC;8| '|SPADreplace| 'CDELT) 

(SDEFUN |CDFVEC;qelt;$IC;8|
        ((|x| $) (|i| |Integer|) ($ |Complex| (|DoubleFloat|))) (CDELT |x| |i|)) 

(PUT '|CDFVEC;elt;$IC;9| '|SPADreplace| 'CDELT) 

(SDEFUN |CDFVEC;elt;$IC;9|
        ((|x| $) (|i| |Integer|) ($ |Complex| (|DoubleFloat|))) (CDELT |x| |i|)) 

(PUT '|CDFVEC;qsetelt!;$I2C;10| '|SPADreplace| 'CDSETELT) 

(SDEFUN |CDFVEC;qsetelt!;$I2C;10|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|Complex| (|DoubleFloat|)))
         ($ . #1#))
        (CDSETELT |x| |i| |s|)) 

(PUT '|CDFVEC;setelt!;$I2C;11| '|SPADreplace| 'CDSETELT) 

(SDEFUN |CDFVEC;setelt!;$I2C;11|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|Complex| (|DoubleFloat|)))
         ($ . #1#))
        (CDSETELT |x| |i| |s|)) 

(SDEFUN |CDFVEC;fill!;$C$;12| ((|x| $) (|s| |Complex| (|DoubleFloat|)) ($ $))
        (SPROG ((#1=#:G3213 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0 . #2=(|CDFVEC;fill!;$C$;12|))
                     (LETT #1# (|sub_SI| (CDLEN |x|) 1) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (CDSETELT |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(DECLAIM (NOTINLINE |ComplexDoubleFloatVector;|)) 

(DEFUN |ComplexDoubleFloatVector| ()
  (SPROG NIL
         (PROG (#1=#:G3225)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ComplexDoubleFloatVector|)
                    . #2=(|ComplexDoubleFloatVector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ComplexDoubleFloatVector|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|ComplexDoubleFloatVector;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|ComplexDoubleFloatVector|)))))))))) 

(DEFUN |ComplexDoubleFloatVector;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G3223 NIL) (#2=#:G3222 NIL) (#3=#:G3221 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|ComplexDoubleFloatVector|)
          . #4=(|ComplexDoubleFloatVector|))
    (LETT $ (GETREFV 38) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|Complex| (|DoubleFloat|))
                                               '(|Comparable|))
                                              . #4#)
                                        (OR #1#
                                            (|HasCategory|
                                             (|Complex| (|DoubleFloat|))
                                             '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory|
                                               (|Complex| (|DoubleFloat|))
                                               '(|SetCategory|))
                                              . #4#)
                                        (AND
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|Evalable|
                                            (|Complex| (|DoubleFloat|))))
                                         #2#)
                                        (OR
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|BasicType|))
                                         #1#
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|OrderedSet|))
                                         #2#)
                                        (OR #1#
                                            (|HasCategory|
                                             (|Complex| (|DoubleFloat|))
                                             '(|OrderedSet|))
                                            #2#)
                                        (LETT #3#
                                              (|HasCategory|
                                               (|Complex| (|DoubleFloat|))
                                               '(|CoercibleTo| (|OutputForm|)))
                                              . #4#)
                                        (OR #3# #1#
                                            (|HasCategory|
                                             (|Complex| (|DoubleFloat|))
                                             '(|OrderedSet|))
                                            #2#)
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|AbelianSemiGroup|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|AbelianMonoid|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|AbelianGroup|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|SemiGroup|))
                                        (AND
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|AbelianMonoid|))
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|SemiRng|)))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|)) '(|Ring|))
                                        (AND
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|RadicalCategory|))
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|Ring|)))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|ComplexDoubleFloatVector| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 524288))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 1048576))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Complex| (|DoubleFloat|)) '(|BasicType|))
         (|augmentPredVector| $ 2097152))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 4194304))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| $ '(|shallowlyMutable|))
         (|HasCategory| (|Complex| (|DoubleFloat|)) '(|OrderedSet|))
         (|augmentPredVector| $ 8388608))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Complex| (|DoubleFloat|)) '(|OrderedSet|))
         (|augmentPredVector| $ 16777216))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Complex| (|DoubleFloat|)) '(|OrderedSet|))))
     (|augmentPredVector| $ 33554432))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Complex| (|DoubleFloat|)) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Complex| (|DoubleFloat|)) '(|OrderedSet|)))
         #3#)
     (|augmentPredVector| $ 134217728))
    (AND
     (OR
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|Complex| (|DoubleFloat|)) '(|BasicType|)))
      (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|Complex| (|DoubleFloat|)) '(|OrderedSet|)))
      #2#)
     (|augmentPredVector| $ 268435456))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|ComplexDoubleFloatVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| (|DoubleFloat|)) (|Integer|)
              |CDFVEC;qelt;$IC;8| |CDFVEC;qsetelt!;$I2C;10|
              (|NonNegativeInteger|) |CDFVEC;#;$Nni;3| |CDFVEC;minIndex;$I;4|
              |CDFVEC;empty;$;5| |CDFVEC;qnew;I$;6| |CDFVEC;fill!;$C$;12|
              |CDFVEC;new;NniC$;7| |CDFVEC;elt;$IC;9| |CDFVEC;setelt!;$I2C;11|
              (|List| 6) (|Equation| 6) (|List| 20) (|Mapping| 6 6 6)
              (|Boolean|) (|Mapping| 23 6 6) (|OutputForm|) (|SingleInteger|)
              (|HashState|) (|String|) (|InputForm|) (|Matrix| 6)
              (|Mapping| 23 6) (|UniversalSegment| 7) (|Void|) (|Mapping| 6 6)
              (|List| $) (|Union| 6 '"failed") (|List| 7))
           '#(~= 0 |zero?| 6 |zero| 11 |vector| 16 |trim| 21 |swap!| 27
              |sorted?| 34 |sort!| 45 |sort| 56 |smaller?| 67 |size?| 73
              |setelt!| 79 |select| 93 |sample| 99 |rightTrim| 103 |reverse!|
              109 |reverse| 114 |removeDuplicates| 119 |remove| 124 |reduce|
              136 |qsetelt!| 157 |qnew| 164 |qelt| 169 |position| 175 |parts|
              194 |outerProduct| 199 |new| 205 |more?| 211 |minIndex| 217 |min|
              222 |merge| 228 |members| 241 |member?| 246 |maxIndex| 252 |max|
              257 |map!| 263 |map| 269 |less?| 282 |length| 288 |leftTrim| 293
              |latex| 299 |insert| 304 |indices| 318 |index?| 323 |hashUpdate!|
              329 |hash| 335 |first| 340 |find| 345 |fill!| 351 |every?| 357
              |eval| 363 |eq?| 389 |entry?| 395 |entries| 401 |empty?| 406
              |empty| 411 |elt| 415 |dot| 434 |delete| 440 |cross| 452 |count|
              458 |copyInto!| 470 |copy| 477 |convert| 482 |construct| 487
              |concat| 492 |coerce| 515 |any?| 520 >= 526 > 532 = 538 <= 544 <
              550 - 556 + 567 * 573 |#| 591)
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
                                  '(2 29 23 0 0 1 1 14 23 0 1 1 14 0 10 1 1 0 0
                                    19 1 2 22 0 0 6 1 3 20 33 0 7 7 1 1 25 23 0
                                    1 2 21 23 24 0 1 1 24 0 0 1 2 23 0 24 0 1 1
                                    25 0 0 1 2 21 0 24 0 1 2 26 23 0 0 1 2 0 23
                                    0 10 1 3 20 6 0 32 6 1 3 20 6 0 7 6 18 2 21
                                    0 31 0 1 0 0 0 1 2 22 0 0 6 1 1 23 0 0 1 1
                                    21 0 0 1 1 22 0 0 1 2 22 0 6 0 1 2 21 0 31
                                    0 1 4 22 6 22 0 6 6 1 3 21 6 22 0 6 1 2 21
                                    6 22 0 1 3 20 6 0 7 6 9 1 0 0 7 14 2 0 6 0
                                    7 8 3 22 7 6 0 7 1 2 22 7 6 0 1 2 21 7 31 0
                                    1 1 21 19 0 1 2 18 30 0 0 1 2 0 0 10 6 16 2
                                    0 23 0 10 1 1 3 7 0 12 2 25 0 0 0 1 2 25 0
                                    0 0 1 3 21 0 24 0 0 1 1 21 19 0 1 2 22 23 6
                                    0 1 1 3 7 0 1 2 25 0 0 0 1 2 20 0 34 0 1 3
                                    0 0 22 0 0 1 2 0 0 34 0 1 2 0 23 0 10 1 1
                                    19 6 0 1 2 22 0 0 6 1 1 27 28 0 1 3 0 0 6 0
                                    7 1 3 0 0 0 0 7 1 1 0 37 0 1 2 0 23 7 0 1 2
                                    27 27 27 0 1 1 27 26 0 1 1 3 6 0 1 2 0 36
                                    31 0 1 2 20 0 0 6 15 2 21 23 31 0 1 3 8 0 0
                                    6 6 1 3 8 0 0 19 19 1 2 8 0 0 20 1 2 8 0 0
                                    21 1 2 0 23 0 0 1 2 22 23 6 0 1 1 0 19 0 1
                                    1 0 23 0 1 0 0 0 13 2 0 0 0 32 1 2 0 6 0 7
                                    17 3 0 6 0 7 6 1 2 17 6 0 0 1 2 0 0 0 7 1 2
                                    0 0 0 32 1 2 18 0 0 0 1 2 22 10 6 0 1 2 21
                                    10 31 0 1 3 23 0 0 0 7 1 1 0 0 0 1 1 2 29 0
                                    1 1 0 0 19 1 1 0 0 35 1 2 0 0 0 0 1 2 0 0 0
                                    6 1 2 0 0 6 0 1 1 28 25 0 1 2 21 23 31 0 1
                                    2 25 23 0 0 1 2 25 23 0 0 1 2 29 23 0 0 1 2
                                    25 23 0 0 1 2 25 23 0 0 1 2 15 0 0 0 1 1 15
                                    0 0 1 2 13 0 0 0 1 2 15 0 7 0 1 2 16 0 0 6
                                    1 2 16 0 6 0 1 1 21 10 0 11)))))
           '|lookupComplete|)) 

(MAKEPROP '|ComplexDoubleFloatVector| 'NILADIC T) 
