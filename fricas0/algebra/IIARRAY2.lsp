
(PUT '|IIARRAY2;empty;$;1| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX 0 0))) 

(SDEFUN |IIARRAY2;empty;$;1| (($ $)) (MAKE_MATRIX 0 0)) 

(PUT '|IIARRAY2;qnew;2Nni$;2| '|SPADreplace| 'MAKE_MATRIX) 

(SDEFUN |IIARRAY2;qnew;2Nni$;2|
        ((|rows| . #1=(|NonNegativeInteger|)) (|cols| . #1#) ($ $))
        (MAKE_MATRIX |rows| |cols|)) 

(PUT '|IIARRAY2;new;2NniR$;3| '|SPADreplace| 'MAKE_MATRIX1) 

(SDEFUN |IIARRAY2;new;2NniR$;3|
        ((|rows| . #1=(|NonNegativeInteger|)) (|cols| . #1#) (|a| R) ($ $))
        (MAKE_MATRIX1 |rows| |cols| |a|)) 

(SDEFUN |IIARRAY2;minRowIndex;$I;4| ((|m| $) ($ |Integer|)) (QREFELT $ 7)) 

(SDEFUN |IIARRAY2;minColIndex;$I;5| ((|m| $) ($ |Integer|)) (QREFELT $ 8)) 

(SDEFUN |IIARRAY2;maxRowIndex;$I;6| ((|m| $) ($ |Integer|))
        (- (+ (SPADCALL |m| (QREFELT $ 18)) (QREFELT $ 7)) 1)) 

(SDEFUN |IIARRAY2;maxColIndex;$I;7| ((|m| $) ($ |Integer|))
        (- (+ (SPADCALL |m| (QREFELT $ 20)) (QREFELT $ 8)) 1)) 

(PUT '|IIARRAY2;nrows;$Nni;8| '|SPADreplace| 'ANROWS) 

(SDEFUN |IIARRAY2;nrows;$Nni;8| ((|m| $) ($ |NonNegativeInteger|)) (ANROWS |m|)) 

(PUT '|IIARRAY2;ncols;$Nni;9| '|SPADreplace| 'ANCOLS) 

(SDEFUN |IIARRAY2;ncols;$Nni;9| ((|m| $) ($ |NonNegativeInteger|)) (ANCOLS |m|)) 

(SDEFUN |IIARRAY2;qelt;$2IR;10|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ R))
        (QAREF2O |m| |i| |j| (QREFELT $ 7) (QREFELT $ 8))) 

(SDEFUN |IIARRAY2;elt;$2IR;11|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ R))
        (COND
         ((OR (< |i| (SPADCALL |m| (QREFELT $ 16)))
              (SPADCALL |i| (SPADCALL |m| (QREFELT $ 19)) (QREFELT $ 24)))
          (|error| "elt: index out of range"))
         ((OR (< |j| (SPADCALL |m| (QREFELT $ 17)))
              (SPADCALL |j| (SPADCALL |m| (QREFELT $ 21)) (QREFELT $ 24)))
          (|error| "elt: index out of range"))
         ('T (SPADCALL |m| |i| |j| (QREFELT $ 22))))) 

(SDEFUN |IIARRAY2;qsetelt!;$2I2R;12|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| R) ($ R))
        (QSETAREF2O |m| |i| |j| |r| (QREFELT $ 7) (QREFELT $ 8))) 

(SDEFUN |IIARRAY2;setelt!;$2I2R;13|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| R) ($ R))
        (COND
         ((OR (< |i| (SPADCALL |m| (QREFELT $ 16)))
              (SPADCALL |i| (SPADCALL |m| (QREFELT $ 19)) (QREFELT $ 24)))
          (|error| "setelt!: index out of range"))
         ((OR (< |j| (SPADCALL |m| (QREFELT $ 17)))
              (SPADCALL |j| (SPADCALL |m| (QREFELT $ 21)) (QREFELT $ 24)))
          (|error| "setelt!: index out of range"))
         ('T (SPADCALL |m| |i| |j| |r| (QREFELT $ 26))))) 

(SDEFUN |IIARRAY2;latex;$S;14| ((|m| $) ($ |String|))
        (SPROG
         ((|s| (|String|)) (#1=#:G2877 NIL) (|j| NIL) (#2=#:G2876 NIL)
          (|i| NIL) (#3=#:G2875 NIL))
         (SEQ
          (LETT |s| "\\left[ \\begin{array}{" . #4=(|IIARRAY2;latex;$S;14|))
          (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 17)) . #4#)
               (LETT #3# (SPADCALL |m| (QREFELT $ 21)) . #4#) G190
               (COND ((> |j| #3#) (GO G191)))
               (SEQ (EXIT (LETT |s| (STRCONC |s| "c") . #4#)))
               (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |s| (STRCONC |s| "} ") . #4#)
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 16)) . #4#)
               (LETT #2# (SPADCALL |m| (QREFELT $ 19)) . #4#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 17)) . #4#)
                     (LETT #1# (SPADCALL |m| (QREFELT $ 21)) . #4#) G190
                     (COND ((> |j| #1#) (GO G191)))
                     (SEQ
                      (LETT |s|
                            (STRCONC |s|
                                     (SPADCALL
                                      (SPADCALL |m| |i| |j| (QREFELT $ 22))
                                      (QREFELT $ 29)))
                            . #4#)
                      (EXIT
                       (COND
                        ((< |j| (SPADCALL |m| (QREFELT $ 21)))
                         (LETT |s| (STRCONC |s| " & ") . #4#)))))
                     (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((< |i| (SPADCALL |m| (QREFELT $ 19)))
                   (LETT |s| (STRCONC |s| " \\\\ ") . #4#)))))
               (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (STRCONC |s| "\\end{array} \\right]"))))) 

(DECLAIM (NOTINLINE |InnerIndexedTwoDimensionalArray;|)) 

(DEFUN |InnerIndexedTwoDimensionalArray| (&REST #1=#:G2884)
  (SPROG NIL
         (PROG (#2=#:G2885)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerIndexedTwoDimensionalArray|)
                                               '|domainEqualList|)
                    . #3=(|InnerIndexedTwoDimensionalArray|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |InnerIndexedTwoDimensionalArray;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InnerIndexedTwoDimensionalArray|)))))))))) 

(DEFUN |InnerIndexedTwoDimensionalArray;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) (#1=#:G2881 NIL) (#2=#:G2882 NIL) ($ NIL) (|dv$| NIL)
    (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|InnerIndexedTwoDimensionalArray|))
    (LETT DV$2 (|devaluate| |#2|) . #3#)
    (LETT DV$3 (|devaluate| |#3|) . #3#)
    (LETT DV$4 (|devaluate| |#4|) . #3#)
    (LETT DV$5 (|devaluate| |#5|) . #3#)
    (LETT |dv$|
          (LIST '|InnerIndexedTwoDimensionalArray| DV$1 DV$2 DV$3 DV$4 DV$5)
          . #3#)
    (LETT $ (GETREFV 48) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #3#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            (|HasCategory| |#1|
                                                           '(|Comparable|))
                                            #2#)
                                        (OR
                                         (|HasCategory| |#1| '(|Comparable|))
                                         #2#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #2#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#1| '(|Comparable|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          #2#))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #3#)
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #2#))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|InnerIndexedTwoDimensionalArray|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 512))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 1024))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      #2#)
     (|augmentPredVector| $ 2048))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 30 (CONS (|dispatchFunction| |IIARRAY2;latex;$S;14|) $))))
    $))) 

(MAKEPROP '|InnerIndexedTwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) |IIARRAY2;empty;$;1|
              (|NonNegativeInteger|) |IIARRAY2;qnew;2Nni$;2|
              |IIARRAY2;new;2NniR$;3| (|Integer|) |IIARRAY2;minRowIndex;$I;4|
              |IIARRAY2;minColIndex;$I;5| |IIARRAY2;nrows;$Nni;8|
              |IIARRAY2;maxRowIndex;$I;6| |IIARRAY2;ncols;$Nni;9|
              |IIARRAY2;maxColIndex;$I;7| |IIARRAY2;qelt;$2IR;10| (|Boolean|)
              (0 . >) |IIARRAY2;elt;$2IR;11| |IIARRAY2;qsetelt!;$2I2R;12|
              |IIARRAY2;setelt!;$2I2R;13| (|String|) (6 . |latex|)
              (11 . |latex|) (|List| 6) (|Equation| 6) (|List| 32)
              (|Mapping| 23 6) (|OutputForm|) (|HashState|) (|SingleInteger|)
              (|Mapping| 6 6 6) (|List| 42) (|List| 12) (|Mapping| 6 6)
              (|List| $) (|PositiveInteger|) (|List| 45) (|Segment| 15)
              (|List| 15) (|List| 31))
           '#(~= 16 |vertSplit| 22 |vertConcat| 34 |transpose| 45 |swapRows!|
              50 |swapColumns!| 57 |subMatrix| 64 |squareTop| 73 |smaller?| 78
              |size?| 84 |setsubMatrix!| 90 |setelt!| 98 |setRow!| 194
              |setColumn!| 201 |sample| 208 |rowSlice| 212 |row| 217 |qsetelt!|
              223 |qnew| 231 |qelt| 237 |parts| 244 |nrows| 249 |new| 254
              |ncols| 261 |more?| 266 |minRowIndex| 272 |minColIndex| 277
              |members| 282 |member?| 287 |maxRowIndex| 293 |maxColIndex| 298
              |map!| 303 |map| 309 |listOfLists| 330 |less?| 335 |latex| 341
              |horizSplit| 346 |horizConcat| 358 |hashUpdate!| 369 |hash| 375
              |fill!| 380 |every?| 386 |eval| 392 |eq?| 418 |empty?| 424
              |empty| 429 |elt| 433 |count| 525 |copy| 537 |column| 542
              |colSlice| 548 |coerce| 553 |blockSplit| 558 |blockConcat| 572
              |any?| 577 = 583 |#| 589)
           'NIL
           (CONS (|makeByteWordVec2| 9 '(0 0 1 0 7 5 0 0 0 7 4 9))
                 (CONS
                  '#(|TwoDimensionalArrayCategory&| |HomogeneousAggregate&| NIL
                     |Aggregate&| |Evalable&| |SetCategory&| NIL NIL NIL
                     |InnerEvalable&| |BasicType&| NIL)
                  (CONS
                   '#((|TwoDimensionalArrayCategory| 6 9 10)
                      (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                      (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 35))
                   (|makeByteWordVec2| 47
                                       '(2 15 23 0 0 24 1 6 28 0 29 1 0 28 0 30
                                         2 12 23 0 0 1 2 0 42 0 43 1 2 0 42 0
                                         40 1 2 0 0 0 0 1 1 0 0 42 1 1 0 0 0 1
                                         3 0 0 0 15 15 1 3 0 0 0 15 15 1 5 0 0
                                         0 15 15 15 15 1 1 0 0 0 1 2 1 23 0 0 1
                                         2 0 23 0 12 1 4 0 0 0 15 15 0 1 4 0 0
                                         0 44 44 0 1 4 0 0 0 44 45 0 1 4 0 0 0
                                         45 46 0 1 4 0 0 0 45 44 0 1 4 0 0 0 46
                                         45 0 1 4 0 0 0 46 46 0 1 4 0 0 0 45 45
                                         0 1 4 0 0 0 46 15 0 1 4 0 0 0 15 46 0
                                         1 4 0 6 0 15 15 6 27 4 0 0 0 44 15 0 1
                                         4 0 0 0 15 44 0 1 3 0 0 0 15 9 1 3 0 0
                                         0 15 10 1 0 0 0 1 1 0 45 0 1 2 0 9 0
                                         15 1 4 0 6 0 15 15 6 26 2 0 0 12 12 13
                                         3 0 6 0 15 15 22 1 0 31 0 1 1 0 12 0
                                         18 3 0 0 12 12 6 14 1 0 12 0 20 2 0 23
                                         0 12 1 1 0 15 0 16 1 0 15 0 17 1 10 31
                                         0 1 2 11 23 6 0 1 1 0 15 0 19 1 0 15 0
                                         21 2 0 0 41 0 1 4 0 0 38 0 0 6 1 3 0 0
                                         38 0 0 1 2 0 0 41 0 1 1 0 47 0 1 2 0
                                         23 0 12 1 1 3 28 0 30 2 0 42 0 40 1 2
                                         0 42 0 43 1 1 0 0 42 1 2 0 0 0 0 1 2 3
                                         36 36 0 1 1 3 37 0 1 2 0 0 0 6 1 2 10
                                         23 34 0 1 3 6 0 0 6 6 1 3 6 0 0 31 31
                                         1 2 6 0 0 32 1 2 6 0 0 33 1 2 0 23 0 0
                                         1 1 0 23 0 1 0 0 0 11 3 0 0 0 44 44 1
                                         3 0 0 0 44 45 1 3 0 0 0 45 44 1 3 0 0
                                         0 44 15 1 3 0 0 0 15 44 1 3 0 0 0 46
                                         45 1 3 0 0 0 45 46 1 3 0 0 0 45 45 1 3
                                         0 0 0 46 15 1 3 0 0 0 46 46 1 3 0 0 0
                                         15 46 1 4 0 6 0 15 15 6 1 3 0 6 0 15
                                         15 25 2 11 12 6 0 1 2 10 12 34 0 1 1 0
                                         0 0 1 2 0 10 0 15 1 1 0 45 0 1 1 8 35
                                         0 1 3 0 39 0 40 40 1 3 0 39 0 43 43 1
                                         1 0 0 39 1 2 10 23 34 0 1 2 12 23 0 0
                                         1 1 10 12 0 1)))))
           '|lookupComplete|)) 
