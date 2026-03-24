
(PUT '|PRIMMAT2;minRowIndex;%I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |PRIMMAT2;minRowIndex;%I;1| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|PRIMMAT2;minColIndex;%I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |PRIMMAT2;minColIndex;%I;2| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|PRIMMAT2;nrows;%Nni;3| '|SPADreplace| 'ANROWS) 

(SDEFUN |PRIMMAT2;nrows;%Nni;3| ((|x| (%)) (% (|NonNegativeInteger|)))
        (ANROWS |x|)) 

(PUT '|PRIMMAT2;ncols;%Nni;4| '|SPADreplace| 'ANCOLS) 

(SDEFUN |PRIMMAT2;ncols;%Nni;4| ((|x| (%)) (% (|NonNegativeInteger|)))
        (ANCOLS |x|)) 

(SDEFUN |PRIMMAT2;maxRowIndex;%I;5| ((|x| (%)) (% (|Integer|)))
        (- (ANROWS |x|) 1)) 

(SDEFUN |PRIMMAT2;maxColIndex;%I;6| ((|x| (%)) (% (|Integer|)))
        (- (ANCOLS |x|) 1)) 

(PUT '|PRIMMAT2;qelt;%2IS;7| '|SPADreplace| 'QAREF2) 

(SDEFUN |PRIMMAT2;qelt;%2IS;7|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (% (S))) (QAREF2 |m| |i| |j|)) 

(PUT '|PRIMMAT2;elt;%2IS;8| '|SPADreplace| 'QAREF2) 

(SDEFUN |PRIMMAT2;elt;%2IS;8|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (% (S))) (QAREF2 |m| |i| |j|)) 

(PUT '|PRIMMAT2;qsetelt!;%2I2S;9| '|SPADreplace| 'QSETAREF2) 

(SDEFUN |PRIMMAT2;qsetelt!;%2I2S;9|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (|r| (S)) (% (S)))
        (QSETAREF2 |m| |i| |j| |r|)) 

(PUT '|PRIMMAT2;setelt!;%2I2S;10| '|SPADreplace| 'QSETAREF2) 

(SDEFUN |PRIMMAT2;setelt!;%2I2S;10|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (|r| (S)) (% (S)))
        (QSETAREF2 |m| |i| |j| |r|)) 

(PUT '|PRIMMAT2;empty;%;11| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX 0 0))) 

(SDEFUN |PRIMMAT2;empty;%;11| ((% (%))) (MAKE_MATRIX 0 0)) 

(PUT '|PRIMMAT2;qnew;2Nni%;12| '|SPADreplace| 'MAKE_MATRIX) 

(SDEFUN |PRIMMAT2;qnew;2Nni%;12|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) (% (%)))
        (MAKE_MATRIX |rows| |cols|)) 

(PUT '|PRIMMAT2;new;2NniS%;13| '|SPADreplace| 'MAKE_MATRIX1) 

(SDEFUN |PRIMMAT2;new;2NniS%;13|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) (|a| (S)) (% (%)))
        (MAKE_MATRIX1 |rows| |cols| |a|)) 

(DECLAIM (NOTINLINE |PrimitiveTwoDimensionalArray;|)) 

(DEFUN |PrimitiveTwoDimensionalArray;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G2579 NIL) (#2=#:G2580 NIL) (% NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|PrimitiveTwoDimensionalArray| DV$1))
    (LETT % (GETREFV 49))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            (|HasCategory| |#1|
                                                           '(|Comparable|))
                                            (|HasCategory| |#1| '(|Hashable|))
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
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|)))
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
                                             (|HasCategory| |#1|
                                                            '(|AbelianMonoid|)))
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #2#))
                                        (AND
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1| '(|SemiRng|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1| '(|Monoid|))
                                         (|HasCategory| |#1| '(|SemiRng|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|EuclideanDomain|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1| '(|Field|)))))))
    (|haddProp| |$ConstructorCache| '|PrimitiveTwoDimensionalArray| (LIST DV$1)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 524288))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 1048576))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2097152))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (|HasCategory| |#1| '(|Hashable|)) #2#)
     (|augmentPredVector| % 4194304))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |PrimitiveTwoDimensionalArray| (#1=#:G2582)
  (SPROG NIL
         (PROG (#2=#:G2583)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PrimitiveTwoDimensionalArray|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|PrimitiveTwoDimensionalArray;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PrimitiveTwoDimensionalArray|)))))))))) 

(MAKEPROP '|PrimitiveTwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              |PRIMMAT2;minRowIndex;%I;1| |PRIMMAT2;minColIndex;%I;2|
              (|NonNegativeInteger|) |PRIMMAT2;nrows;%Nni;3|
              |PRIMMAT2;ncols;%Nni;4| |PRIMMAT2;maxRowIndex;%I;5|
              |PRIMMAT2;maxColIndex;%I;6| |PRIMMAT2;qelt;%2IS;7|
              |PRIMMAT2;elt;%2IS;8| |PRIMMAT2;qsetelt!;%2I2S;9|
              |PRIMMAT2;setelt!;%2I2S;10| |PRIMMAT2;empty;%;11|
              |PRIMMAT2;qnew;2Nni%;12| |PRIMMAT2;new;2NniS%;13| (|Boolean|)
              (|Mapping| 6 6) (|List| 26) (|PrimitiveArray| 6) (|List| 6)
              (|List| 7) (|Segment| 7) (|List| 28) (|List| %)
              (|PositiveInteger|) (|List| 30) (|List| 10) (|Mapping| 6 6 6)
              (|List| 25) (|Union| % '"failed") (|List| 38) (|Equation| 6)
              (|Mapping| 22 6) (|Mapping| 22 6 6) (|Mapping| 6 7 7) (|Void|)
              (|List| 33) (|Union| 6 '"one") (|OutputForm|) (|HashState|)
              (|SingleInteger|) (|String|))
           '#(~= 0 |zero?| 6 |zero| 11 |vertSplit| 17 |vertConcat| 29
              |transpose| 40 |symmetric?| 50 |swapRows!| 55 |swapColumns!| 62
              |subMatrix| 69 |squareTop| 78 |square?| 83 |smaller?| 88 |size?|
              94 |setsubMatrix!| 100 |setelt!| 108 |setRow!| 204 |setColumn!|
              211 |scalarMatrix| 218 |sample| 224 |rowSlice| 228 |rowEchelon|
              233 |row| 238 |rank| 244 |qsetelt!| 249 |qnew| 257 |qelt| 263
              |positivePower| 270 |parts| 276 |nullity| 281 |nullSpace| 286
              |nrows| 291 |new| 296 |ncols| 303 |more?| 308 |minordet| 314
              |minRowIndex| 319 |minColIndex| 324 |min| 329 |members| 334
              |member?| 339 |maxRowIndex| 345 |maxColIndex| 350 |max| 355
              |matrix| 366 |map!| 378 |map| 384 |listOfLists| 405 |less?| 410
              |latex| 416 |kronecker_prod1| 421 |kroneckerSum| 432
              |kroneckerProduct| 443 |inverse| 454 |horizSplit| 459
              |horizConcat| 471 |hashUpdate!| 482 |hash| 488 |fill!| 493
              |exquo| 499 |every?| 505 |eval| 511 |eq?| 537 |empty?| 543
              |empty| 548 |elt| 552 |diagonalMatrix| 644 |diagonal?| 654
              |determinant| 659 |count| 664 |copy| 676 |columnSpace| 681
              |column| 686 |colSlice| 692 |coerce| 697 |blockSplit| 707
              |blockConcat| 721 |array2| 726 |any?| 731 |antisymmetric?| 737 ^
              742 |Pfaffian| 754 = 759 / 765 - 771 + 782 * 788 |#| 824)
           'NIL
           (CONS (|makeByteWordVec2| 12 '(3 0 1 0 8 2 10 0 12 7 10 0 0 0))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&| NIL
                     |HomogeneousAggregate&| |SetCategory&| |Hashable&|
                     |Evalable&| |Aggregate&| NIL |BasicType&| |InnerEvalable&|
                     NIL NIL NIL)
                  (CONS
                   '#((|MatrixCategory| 6 (|PrimitiveArray| 6)
                                        (|PrimitiveArray| 6))
                      (|TwoDimensionalArrayCategory| 6 (|PrimitiveArray| 6)
                                                     (|PrimitiveArray| 6))
                      (|Comparable|) (|HomogeneousAggregate| 6) (|SetCategory|)
                      (|Hashable|) (|Evalable| 6) (|Aggregate|)
                      (|CoercibleTo| 45) (|BasicType|) (|InnerEvalable| 6 6)
                      (|shallowlyMutable|) (|finiteAggregate|) (|Type|))
                   (|makeByteWordVec2| 48
                                       '(2 23 22 0 0 1 1 3 22 0 1 2 3 0 10 10 1
                                         2 0 30 0 31 1 2 0 30 0 33 1 1 0 0 30 1
                                         2 0 0 0 0 1 1 0 0 0 1 1 3 0 25 1 1 3
                                         22 0 1 3 0 0 0 7 7 1 3 0 0 0 7 7 1 5 0
                                         0 0 7 7 7 7 1 1 0 0 0 1 1 3 22 0 1 2 1
                                         22 0 0 1 2 0 22 0 10 1 4 0 0 0 7 7 0 1
                                         4 0 0 0 7 29 0 1 4 0 0 0 29 7 0 1 4 0
                                         6 0 7 7 6 18 4 0 0 0 7 27 0 1 4 0 0 0
                                         27 27 0 1 4 0 0 0 27 7 0 1 4 0 0 0 27
                                         28 0 1 4 0 0 0 28 28 0 1 4 0 0 0 28 29
                                         0 1 4 0 0 0 28 27 0 1 4 0 0 0 29 28 0
                                         1 4 0 0 0 29 29 0 1 3 0 0 0 7 25 1 3 0
                                         0 0 7 25 1 2 3 0 10 6 1 0 0 0 1 1 0 28
                                         0 1 1 16 0 0 1 2 0 25 0 7 1 1 17 10 0
                                         1 4 0 6 0 7 7 6 17 2 0 0 10 10 20 3 0
                                         6 0 7 7 15 2 14 0 0 7 1 1 0 26 0 1 1
                                         17 10 0 1 1 17 35 0 1 1 0 10 0 11 3 0
                                         0 10 10 6 21 1 0 10 0 12 2 0 22 0 10 1
                                         1 18 6 0 1 1 0 7 0 8 1 0 7 0 9 1 21 6
                                         0 1 1 20 26 0 1 2 22 22 6 0 1 1 0 7 0
                                         13 1 0 7 0 14 1 21 6 0 1 2 20 6 40 0 1
                                         1 3 0 24 1 3 3 0 10 10 41 1 2 0 0 23 0
                                         1 2 0 0 23 0 1 3 0 0 34 0 0 1 4 0 0 34
                                         0 0 6 1 1 0 24 0 1 2 0 22 0 10 1 1 6
                                         48 0 1 7 3 42 0 7 43 30 10 10 44 1 2 3
                                         0 0 0 1 1 3 0 30 1 2 14 0 0 0 1 1 14 0
                                         30 1 1 19 36 0 1 2 0 30 0 31 1 2 0 30
                                         0 33 1 1 0 0 30 1 2 0 0 0 0 1 2 2 46
                                         46 0 1 1 2 47 0 1 2 0 0 0 6 1 2 17 36
                                         0 6 1 2 20 22 39 0 1 2 9 0 0 37 1 3 9
                                         0 0 6 6 1 2 9 0 0 38 1 3 9 0 0 26 26 1
                                         2 0 22 0 0 1 1 0 22 0 1 0 0 0 19 3 0 6
                                         0 7 7 16 4 0 6 0 7 7 6 1 3 0 0 0 7 27
                                         1 3 0 0 0 27 27 1 3 0 0 0 27 7 1 3 0 0
                                         0 27 28 1 3 0 0 0 28 28 1 3 0 0 0 7 29
                                         1 3 0 0 0 28 27 1 3 0 0 0 29 7 1 3 0 0
                                         0 29 28 1 3 0 0 0 28 29 1 3 0 0 0 29
                                         29 1 1 3 0 26 1 1 3 0 30 1 1 3 22 0 1
                                         1 18 6 0 1 2 22 10 6 0 1 2 20 10 39 0
                                         1 1 0 0 0 1 1 16 35 0 1 2 0 25 0 7 1 1
                                         0 28 0 1 1 3 0 25 1 1 11 45 0 1 3 0 32
                                         0 31 31 1 3 0 32 0 33 33 1 1 0 0 32 1
                                         1 0 0 24 1 2 20 22 39 0 1 1 13 22 0 1
                                         2 19 0 0 7 1 2 15 0 0 10 1 1 18 6 0 1
                                         2 23 22 0 0 1 2 19 0 0 6 1 1 13 0 0 1
                                         2 13 0 0 0 1 2 3 0 0 0 1 2 13 0 7 0 1
                                         2 14 0 0 0 1 2 14 0 0 6 1 2 14 0 6 0 1
                                         2 14 25 25 0 1 2 14 25 0 25 1 1 20 10
                                         0 1)))))
           '|lookupComplete|)) 
