
(PUT '|I16VEC;#;%Nni;1| '|SPADreplace| 'QV_LEN_I16) 

(SDEFUN |I16VEC;#;%Nni;1| ((|x| (%)) (% (|NonNegativeInteger|)))
        (QV_LEN_I16 |x|)) 

(PUT '|I16VEC;minIndex;%I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |I16VEC;minIndex;%I;2| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|I16VEC;empty;%;3| '|SPADreplace| '(XLAM NIL (GETREFV_I16 0 0))) 

(SDEFUN |I16VEC;empty;%;3| ((% (%))) (GETREFV_I16 0 0)) 

(PUT '|I16VEC;new;NniI%;4| '|SPADreplace| 'GETREFV_I16) 

(SDEFUN |I16VEC;new;NniI%;4|
        ((|n| (|NonNegativeInteger|)) (|x| (|Integer|)) (% (%)))
        (GETREFV_I16 |n| |x|)) 

(PUT '|I16VEC;qelt;%2I;5| '|SPADreplace| 'ELT_I16) 

(SDEFUN |I16VEC;qelt;%2I;5| ((|x| (%)) (|i| (|Integer|)) (% (|Integer|)))
        (ELT_I16 |x| |i|)) 

(PUT '|I16VEC;elt;%2I;6| '|SPADreplace| 'ELT_I16) 

(SDEFUN |I16VEC;elt;%2I;6| ((|x| (%)) (|i| (|Integer|)) (% (|Integer|)))
        (ELT_I16 |x| |i|)) 

(PUT '|I16VEC;qsetelt!;%3I;7| '|SPADreplace| 'SETELT_I16) 

(SDEFUN |I16VEC;qsetelt!;%3I;7|
        ((|x| (%)) (|i| (|Integer|)) (|s| #1=(|Integer|)) (% #1#))
        (SETELT_I16 |x| |i| |s|)) 

(PUT '|I16VEC;setelt!;%3I;8| '|SPADreplace| 'SETELT_I16) 

(SDEFUN |I16VEC;setelt!;%3I;8|
        ((|x| (%)) (|i| (|Integer|)) (|s| #1=(|Integer|)) (% #1#))
        (SETELT_I16 |x| |i| |s|)) 

(SDEFUN |I16VEC;fill!;%I%;9| ((|x| (%)) (|s| (|Integer|)) (% (%)))
        (SPROG ((#1=#:G2461 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (|sub_SI| (QV_LEN_I16 |x|) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (SETELT_I16 |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(DECLAIM (NOTINLINE |I16Vector;|)) 

(DEFUN |I16Vector;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G2471 NIL) (#2=#:G2470 NIL) (#3=#:G2469 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|I16Vector|))
    (LETT % (GETREFV 34))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Integer|)
                                                       '(|Hashable|))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| (|Integer|)
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| (|Integer|)
                                                        '(|Evalable|
                                                          (|Integer|)))
                                         #2#)
                                        (OR #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|BasicType|))
                                         #1#
                                         (|HasCategory| (|Integer|)
                                                        '(|Hashable|))
                                         (|HasCategory| (|Integer|)
                                                        '(|OrderedSet|))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| (|Integer|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #3# #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|))
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|I16Vector| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 4096))
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 8192))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|BasicType|))
         (|augmentPredVector| % 16384))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 32768))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| % 65536))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| % 131072))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|))))
     (|augmentPredVector| % 262144))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| % 524288))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #3#)
     (|augmentPredVector| % 1048576))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|Hashable|))
         (|augmentPredVector| % 2097152))
    (AND
     (OR
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|BasicType|)))
      (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|Hashable|)))
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|OrderedSet|)))
      #2#)
     (|augmentPredVector| % 4194304))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |I16Vector| ()
  (SPROG NIL
         (PROG (#1=#:G2473)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|I16Vector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|I16Vector|
                             (LIST (CONS NIL (CONS 1 (|I16Vector;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|I16Vector|)))))))))) 

(MAKEPROP '|I16Vector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) |I16VEC;#;%Nni;1|
              (|Integer|) |I16VEC;minIndex;%I;2| |I16VEC;empty;%;3|
              |I16VEC;new;NniI%;4| |I16VEC;qelt;%2I;5| |I16VEC;elt;%2I;6|
              |I16VEC;qsetelt!;%3I;7| |I16VEC;setelt!;%3I;8|
              |I16VEC;fill!;%I%;9| (|Boolean|) (|Mapping| 8 8) (|List| 8)
              (|Union| 8 '"failed") (|Mapping| 17 8) (|UniversalSegment| 8)
              (|List| %) (|Mapping| 8 8 8) (|Mapping| 17 8 8) (|HashState|)
              (|SingleInteger|) (|Equation| 8) (|List| 28) (|OutputForm|)
              (|String|) (|Void|) (|InputForm|))
           '#(~= 0 |trim| 6 |swap!| 12 |sorted?| 19 |sort!| 30 |sort| 41
              |smaller?| 52 |size?| 58 |setelt!| 64 |select| 78 |sample| 84
              |rightTrim| 88 |reverse!| 94 |reverse| 99 |removeDuplicates| 104
              |remove| 109 |reduce| 121 |qsetelt!| 142 |qelt| 149 |position|
              155 |parts| 174 |new| 179 |more?| 185 |minIndex| 191 |min| 196
              |merge| 207 |members| 220 |member?| 225 |maxIndex| 231 |max| 236
              |map!| 253 |map| 259 |less?| 272 |leftTrim| 278 |latex| 284
              |insert| 289 |indices| 303 |index?| 308 |hashUpdate!| 314 |hash|
              320 |first| 325 |find| 336 |fill!| 342 |every?| 348 |eval| 354
              |eq?| 380 |entry?| 386 |entries| 392 |empty?| 397 |empty| 402
              |elt| 406 |delete| 425 |count| 437 |copyInto!| 449 |copy| 456
              |convert| 461 |construct| 466 |concat| 471 |coerce| 494 |any?|
              499 >= 505 > 511 = 517 <= 523 < 529 |#| 535)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 1 0 0 6 0 2 9 8 0 0 3 10 1 12 8 0 0 0 0
                                  0))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL |LinearAggregate&|
                |OrderedSet&| |Collection&| |IndexedAggregate&| NIL
                |HomogeneousAggregate&| |Hashable&| |SetCategory&| |Evalable&|
                |EltableAggregate&| |Aggregate&| NIL |BasicType&|
                |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 8) (|FiniteLinearAggregate| 8)
                 (|LinearAggregate| 8) (|OrderedSet|) (|Collection| 8)
                 (|IndexedAggregate| 8 8) (|Comparable|)
                 (|HomogeneousAggregate| 8) (|Hashable|) (|SetCategory|)
                 (|Evalable| 8) (|EltableAggregate| 8 8) (|Aggregate|)
                 (|ConvertibleTo| 33) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 30) (|InnerEvalable| 8 8) (|Eltable| 8 8)
                 (|Type|) (|Eltable| 22 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| 33
                                  '(2 23 17 0 0 1 2 15 0 0 8 1 3 13 32 0 8 8 1
                                    1 18 17 0 1 2 14 17 25 0 1 2 16 0 25 0 1 1
                                    17 0 0 1 1 18 0 0 1 2 14 0 25 0 1 2 19 17 0
                                    0 1 2 0 17 0 6 1 3 13 8 0 8 8 15 3 13 8 0
                                    22 8 1 2 14 0 21 0 1 0 0 0 1 2 15 0 0 8 1 1
                                    16 0 0 1 1 14 0 0 1 1 15 0 0 1 2 15 0 8 0 1
                                    2 14 0 21 0 1 4 15 8 24 0 8 8 1 3 14 8 24 0
                                    8 1 2 14 8 24 0 1 3 13 8 0 8 8 14 2 0 8 0 8
                                    12 3 15 8 8 0 8 1 2 15 8 8 0 1 2 14 8 21 0
                                    1 1 14 19 0 1 2 0 0 6 8 11 2 0 17 0 6 1 1 1
                                    8 0 9 1 18 8 0 1 2 18 0 0 0 1 2 18 0 0 0 1
                                    3 14 0 25 0 0 1 1 14 19 0 1 2 15 17 8 0 1 1
                                    1 8 0 1 1 18 8 0 1 2 18 0 0 0 1 2 14 8 25 0
                                    1 2 13 0 18 0 1 2 0 0 18 0 1 3 0 0 24 0 0 1
                                    2 0 17 0 6 1 2 15 0 0 8 1 1 20 31 0 1 3 0 0
                                    8 0 8 1 3 0 0 0 0 8 1 1 0 19 0 1 2 0 17 8 0
                                    1 2 22 26 26 0 1 1 22 27 0 1 2 0 0 0 6 1 1
                                    1 8 0 1 2 0 20 21 0 1 2 13 0 0 8 16 2 14 17
                                    21 0 1 2 8 0 0 28 1 2 8 0 0 29 1 3 8 0 0 19
                                    19 1 3 8 0 0 8 8 1 2 0 17 0 0 1 2 15 17 8 0
                                    1 1 0 19 0 1 1 0 17 0 1 0 0 0 10 3 0 8 0 8
                                    8 1 2 0 8 0 8 13 2 0 0 0 22 1 2 0 0 0 8 1 2
                                    0 0 0 22 1 2 15 6 8 0 1 2 14 6 21 0 1 3 16
                                    0 0 0 8 1 1 0 0 0 1 1 3 33 0 1 1 0 0 19 1 2
                                    0 0 0 8 1 2 0 0 0 0 1 2 0 0 8 0 1 1 0 0 23
                                    1 1 21 30 0 1 2 14 17 21 0 1 2 18 17 0 0 1
                                    2 18 17 0 0 1 2 23 17 0 0 1 2 18 17 0 0 1 2
                                    18 17 0 0 1 1 14 6 0 7)))))
           '|lookupComplete|)) 
