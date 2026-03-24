
(PUT '|IIARRAY2;empty;%;1| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX 0 0))) 

(SDEFUN |IIARRAY2;empty;%;1| ((% (%))) (MAKE_MATRIX 0 0)) 

(PUT '|IIARRAY2;qnew;2Nni%;2| '|SPADreplace| 'MAKE_MATRIX) 

(SDEFUN |IIARRAY2;qnew;2Nni%;2|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) (% (%)))
        (MAKE_MATRIX |rows| |cols|)) 

(PUT '|IIARRAY2;new;2NniR%;3| '|SPADreplace| 'MAKE_MATRIX1) 

(SDEFUN |IIARRAY2;new;2NniR%;3|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) (|a| (R)) (% (%)))
        (MAKE_MATRIX1 |rows| |cols| |a|)) 

(SDEFUN |IIARRAY2;minRowIndex;%I;4| ((|m| (%)) (% (|Integer|))) (QREFELT % 7)) 

(SDEFUN |IIARRAY2;minColIndex;%I;5| ((|m| (%)) (% (|Integer|))) (QREFELT % 8)) 

(SDEFUN |IIARRAY2;maxRowIndex;%I;6| ((|m| (%)) (% (|Integer|)))
        (- (+ (SPADCALL |m| (QREFELT % 18)) (QREFELT % 7)) 1)) 

(SDEFUN |IIARRAY2;maxColIndex;%I;7| ((|m| (%)) (% (|Integer|)))
        (- (+ (SPADCALL |m| (QREFELT % 20)) (QREFELT % 8)) 1)) 

(PUT '|IIARRAY2;nrows;%Nni;8| '|SPADreplace| 'ANROWS) 

(SDEFUN |IIARRAY2;nrows;%Nni;8| ((|m| (%)) (% (|NonNegativeInteger|)))
        (ANROWS |m|)) 

(PUT '|IIARRAY2;ncols;%Nni;9| '|SPADreplace| 'ANCOLS) 

(SDEFUN |IIARRAY2;ncols;%Nni;9| ((|m| (%)) (% (|NonNegativeInteger|)))
        (ANCOLS |m|)) 

(SDEFUN |IIARRAY2;qelt;%2IR;10|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (% (R)))
        (QAREF2O |m| |i| |j| (QREFELT % 7) (QREFELT % 8))) 

(SDEFUN |IIARRAY2;elt;%2IR;11|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (% (R)))
        (COND
         ((OR (< |i| (SPADCALL |m| (QREFELT % 16)))
              (> |i| (SPADCALL |m| (QREFELT % 19))))
          (|error| "elt: index out of range"))
         ((OR (< |j| (SPADCALL |m| (QREFELT % 17)))
              (> |j| (SPADCALL |m| (QREFELT % 21))))
          (|error| "elt: index out of range"))
         ('T (SPADCALL |m| |i| |j| (QREFELT % 22))))) 

(SDEFUN |IIARRAY2;qsetelt!;%2I2R;12|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (|r| (R)) (% (R)))
        (QSETAREF2O |m| |i| |j| |r| (QREFELT % 7) (QREFELT % 8))) 

(SDEFUN |IIARRAY2;setelt!;%2I2R;13|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (|r| (R)) (% (R)))
        (COND
         ((OR (< |i| (SPADCALL |m| (QREFELT % 16)))
              (> |i| (SPADCALL |m| (QREFELT % 19))))
          (|error| "setelt!: index out of range"))
         ((OR (< |j| (SPADCALL |m| (QREFELT % 17)))
              (> |j| (SPADCALL |m| (QREFELT % 21))))
          (|error| "setelt!: index out of range"))
         ('T (SPADCALL |m| |i| |j| |r| (QREFELT % 24))))) 

(SDEFUN |IIARRAY2;hashUpdate!;Hs%Hs;14|
        ((|s| (|HashState|)) (|m| (%)) (% (|HashState|)))
        (SPROG ((#1=#:G2216 NIL) (|j| NIL) (#2=#:G2215 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 16)))
                     (LETT #2# (SPADCALL |m| (QREFELT % 19))) G190
                     (COND ((> |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 17)))
                            (LETT #1# (SPADCALL |m| (QREFELT % 21))) G190
                            (COND ((> |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |s|
                                    (SPADCALL |s|
                                              (SPADCALL |m| |i| |j|
                                                        (QREFELT % 22))
                                              (QREFELT % 27)))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(DECLAIM (NOTINLINE |InnerIndexedTwoDimensionalArray;|)) 

(DEFUN |InnerIndexedTwoDimensionalArray;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) (#1=#:G2221 NIL) (#2=#:G2222 NIL) (% NIL) (|dv$| NIL)
    (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$|
          (LIST '|InnerIndexedTwoDimensionalArray| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 48))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#1| '(|Comparable|))
                                         #2#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            (|HasCategory| |#1|
                                                           '(|Comparable|))
                                            (|HasCategory| |#1| '(|Hashable|))
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
                                                               (|OutputForm|))))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #2#))))))
    (|haddProp| |$ConstructorCache| '|InnerIndexedTwoDimensionalArray|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 2048))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 4096))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 8192))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (|HasCategory| |#1| '(|Hashable|)) #2#)
     (|augmentPredVector| % 16384))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV % 28
                (CONS (|dispatchFunction| |IIARRAY2;hashUpdate!;Hs%Hs;14|)
                      %))))
    %))) 

(DEFUN |InnerIndexedTwoDimensionalArray| (&REST #1=#:G2224)
  (SPROG NIL
         (PROG (#2=#:G2225)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL T T))
                     (HGET |$ConstructorCache|
                           '|InnerIndexedTwoDimensionalArray|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |InnerIndexedTwoDimensionalArray;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InnerIndexedTwoDimensionalArray|)))))))))) 

(MAKEPROP '|InnerIndexedTwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) |IIARRAY2;empty;%;1|
              (|NonNegativeInteger|) |IIARRAY2;qnew;2Nni%;2|
              |IIARRAY2;new;2NniR%;3| (|Integer|) |IIARRAY2;minRowIndex;%I;4|
              |IIARRAY2;minColIndex;%I;5| |IIARRAY2;nrows;%Nni;8|
              |IIARRAY2;maxRowIndex;%I;6| |IIARRAY2;ncols;%Nni;9|
              |IIARRAY2;maxColIndex;%I;7| |IIARRAY2;qelt;%2IR;10|
              |IIARRAY2;elt;%2IR;11| |IIARRAY2;qsetelt!;%2I2R;12|
              |IIARRAY2;setelt!;%2I2R;13| (|HashState|) (0 . |hashUpdate!|)
              (6 . |hashUpdate!|) (|Boolean|) (|Mapping| 6 6) (|List| 32)
              (|List| 6) (|List| 15) (|Segment| 15) (|List| 34) (|List| %)
              (|PositiveInteger|) (|List| 36) (|List| 12) (|Mapping| 6 6 6)
              (|List| 42) (|Equation| 6) (|Mapping| 29 6) (|Mapping| 29 6 6)
              (|OutputForm|) (|SingleInteger|) (|String|))
           '#(~= 12 |vertSplit| 18 |vertConcat| 30 |transpose| 41 |swapRows!|
              46 |swapColumns!| 53 |subMatrix| 60 |squareTop| 69 |smaller?| 74
              |size?| 80 |setsubMatrix!| 86 |setelt!| 94 |setRow!| 190
              |setColumn!| 197 |sample| 204 |rowSlice| 208 |row| 213 |qsetelt!|
              219 |qnew| 227 |qelt| 233 |parts| 240 |nrows| 245 |new| 250
              |ncols| 257 |more?| 262 |minRowIndex| 268 |minColIndex| 273 |min|
              278 |members| 283 |member?| 288 |maxRowIndex| 294 |maxColIndex|
              299 |max| 304 |map!| 315 |map| 321 |listOfLists| 342 |less?| 347
              |latex| 353 |horizSplit| 358 |horizConcat| 370 |hashUpdate!| 381
              |hash| 387 |fill!| 392 |every?| 398 |eval| 404 |eq?| 430 |empty?|
              436 |empty| 441 |elt| 445 |count| 537 |copy| 549 |column| 554
              |colSlice| 560 |coerce| 565 |blockSplit| 570 |blockConcat| 584
              |array2| 589 |any?| 594 = 600 |#| 606)
           'NIL
           (CONS (|makeByteWordVec2| 11 '(0 1 0 2 6 9 0 7 11 9 0 0 0))
                 (CONS
                  '#(|TwoDimensionalArrayCategory&| NIL |HomogeneousAggregate&|
                     |Hashable&| |SetCategory&| |Evalable&| |Aggregate&|
                     |BasicType&| NIL |InnerEvalable&| NIL NIL NIL)
                  (CONS
                   '#((|TwoDimensionalArrayCategory| 6 9 10) (|Comparable|)
                      (|HomogeneousAggregate| 6) (|Hashable|) (|SetCategory|)
                      (|Evalable| 6) (|Aggregate|) (|BasicType|)
                      (|CoercibleTo| 45) (|InnerEvalable| 6 6)
                      (|shallowlyMutable|) (|finiteAggregate|) (|Type|))
                   (|makeByteWordVec2| 47
                                       '(2 6 26 26 0 27 2 0 26 26 0 28 2 15 29
                                         0 0 1 2 0 36 0 37 1 2 0 36 0 39 1 2 0
                                         0 0 0 1 1 0 0 36 1 1 0 0 0 1 3 0 0 0
                                         15 15 1 3 0 0 0 15 15 1 5 0 0 0 15 15
                                         15 15 1 1 0 0 0 1 2 1 29 0 0 1 2 0 29
                                         0 12 1 4 0 0 0 15 15 0 1 4 0 0 0 15 35
                                         0 1 4 0 0 0 35 15 0 1 4 0 6 0 15 15 6
                                         25 4 0 0 0 33 15 0 1 4 0 0 0 15 33 0 1
                                         4 0 0 0 33 33 0 1 4 0 0 0 33 34 0 1 4
                                         0 0 0 34 34 0 1 4 0 0 0 34 33 0 1 4 0
                                         0 0 35 34 0 1 4 0 0 0 34 35 0 1 4 0 0
                                         0 35 35 0 1 3 0 0 0 15 9 1 3 0 0 0 15
                                         10 1 0 0 0 1 1 0 34 0 1 2 0 9 0 15 1 4
                                         0 6 0 15 15 6 24 2 0 0 12 12 13 3 0 6
                                         0 15 15 22 1 0 32 0 1 1 0 12 0 18 3 0
                                         0 12 12 6 14 1 0 12 0 20 2 0 29 0 12 1
                                         1 0 15 0 16 1 0 15 0 17 1 13 6 0 1 1
                                         12 32 0 1 2 14 29 6 0 1 1 0 15 0 19 1
                                         0 15 0 21 1 13 6 0 1 2 12 6 44 0 1 2 0
                                         0 30 0 1 2 0 0 30 0 1 3 0 0 40 0 0 1 4
                                         0 0 40 0 0 6 1 1 0 31 0 1 2 0 29 0 12
                                         1 1 5 47 0 1 2 0 36 0 39 1 2 0 36 0 37
                                         1 2 0 0 0 0 1 1 0 0 36 1 2 2 26 26 0
                                         28 1 2 46 0 1 2 0 0 0 6 1 2 12 29 43 0
                                         1 2 8 0 0 41 1 2 8 0 0 42 1 3 8 0 0 32
                                         32 1 3 8 0 0 6 6 1 2 0 29 0 0 1 1 0 29
                                         0 1 0 0 0 11 3 0 6 0 15 15 23 4 0 6 0
                                         15 15 6 1 3 0 0 0 15 33 1 3 0 0 0 33
                                         33 1 3 0 0 0 33 15 1 3 0 0 0 34 34 1 3
                                         0 0 0 34 33 1 3 0 0 0 33 34 1 3 0 0 0
                                         15 35 1 3 0 0 0 35 15 1 3 0 0 0 35 34
                                         1 3 0 0 0 34 35 1 3 0 0 0 35 35 1 2 14
                                         12 6 0 1 2 12 12 43 0 1 1 0 0 0 1 2 0
                                         10 0 15 1 1 0 34 0 1 1 10 45 0 1 3 0
                                         38 0 37 37 1 3 0 38 0 39 39 1 1 0 0 38
                                         1 1 0 0 31 1 2 12 29 43 0 1 2 15 29 0
                                         0 1 1 12 12 0 1)))))
           '|lookupComplete|)) 
