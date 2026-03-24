
(PUT '|CDFMAT;minRowIndex;%I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |CDFMAT;minRowIndex;%I;1| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|CDFMAT;minColIndex;%I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |CDFMAT;minColIndex;%I;2| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|CDFMAT;nrows;%Nni;3| '|SPADreplace| 'CDANROWS) 

(SDEFUN |CDFMAT;nrows;%Nni;3| ((|x| (%)) (% (|NonNegativeInteger|)))
        (CDANROWS |x|)) 

(PUT '|CDFMAT;ncols;%Nni;4| '|SPADreplace| 'CDANCOLS) 

(SDEFUN |CDFMAT;ncols;%Nni;4| ((|x| (%)) (% (|NonNegativeInteger|)))
        (CDANCOLS |x|)) 

(SDEFUN |CDFMAT;maxRowIndex;%I;5| ((|x| (%)) (% (|Integer|)))
        (- (CDANROWS |x|) 1)) 

(SDEFUN |CDFMAT;maxColIndex;%I;6| ((|x| (%)) (% (|Integer|)))
        (- (CDANCOLS |x|) 1)) 

(PUT '|CDFMAT;qelt;%2IC;7| '|SPADreplace| 'CDAREF2) 

(SDEFUN |CDFMAT;qelt;%2IC;7|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#)
         (% (|Complex| (|DoubleFloat|))))
        (CDAREF2 |m| |i| |j|)) 

(PUT '|CDFMAT;elt;%2IC;8| '|SPADreplace| 'CDAREF2) 

(SDEFUN |CDFMAT;elt;%2IC;8|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#)
         (% (|Complex| (|DoubleFloat|))))
        (CDAREF2 |m| |i| |j|)) 

(PUT '|CDFMAT;qsetelt!;%2I2C;9| '|SPADreplace| 'CDSETAREF2) 

(SDEFUN |CDFMAT;qsetelt!;%2I2C;9|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#)
         (|r| #2=(|Complex| (|DoubleFloat|))) (% #2#))
        (CDSETAREF2 |m| |i| |j| |r|)) 

(PUT '|CDFMAT;setelt!;%2I2C;10| '|SPADreplace| 'CDSETAREF2) 

(SDEFUN |CDFMAT;setelt!;%2I2C;10|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#)
         (|r| #2=(|Complex| (|DoubleFloat|))) (% #2#))
        (CDSETAREF2 |m| |i| |j| |r|)) 

(PUT '|CDFMAT;empty;%;11| '|SPADreplace| '(XLAM NIL (MAKE_CDOUBLE_MATRIX 0 0))) 

(SDEFUN |CDFMAT;empty;%;11| ((% (%))) (MAKE_CDOUBLE_MATRIX 0 0)) 

(PUT '|CDFMAT;qnew;2Nni%;12| '|SPADreplace| 'MAKE_CDOUBLE_MATRIX) 

(SDEFUN |CDFMAT;qnew;2Nni%;12|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) (% (%)))
        (MAKE_CDOUBLE_MATRIX |rows| |cols|)) 

(SDEFUN |CDFMAT;new;2NniC%;13|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#)
         (|a| (|Complex| (|DoubleFloat|))) (% (%)))
        (SPROG
         ((#2=#:G2770 NIL) (|j| NIL) (#3=#:G2769 NIL) (|i| NIL) (|res| (%)))
         (SEQ (LETT |res| (MAKE_CDOUBLE_MATRIX |rows| |cols|))
              (SEQ (LETT |i| 0) (LETT #3# (- |rows| 1)) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 0) (LETT #2# (- |cols| 1)) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ (EXIT (CDSETAREF2 |res| |i| |j| |a|)))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(DECLAIM (NOTINLINE |ComplexDoubleFloatMatrix;|)) 

(DEFUN |ComplexDoubleFloatMatrix;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G2783 NIL) (#2=#:G2784 NIL) (#3=#:G2782 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|ComplexDoubleFloatMatrix|))
    (LETT % (GETREFV 49))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|Comparable|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|Hashable|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|Complex| (|DoubleFloat|))
                                               '(|SetCategory|)))
                                        (OR
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|Comparable|))
                                         #1#)
                                        (OR
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|BasicType|))
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|Comparable|))
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|Hashable|))
                                         #1#)
                                        (LETT #2#
                                              (AND
                                               (|HasCategory|
                                                (|Complex| (|DoubleFloat|))
                                                '(|Evalable|
                                                  (|Complex| (|DoubleFloat|))))
                                               (|HasCategory|
                                                (|Complex| (|DoubleFloat|))
                                                '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory|
                                           (|Complex| (|DoubleFloat|))
                                           '(|Evalable|
                                             (|Complex| (|DoubleFloat|))))
                                          (|HasCategory|
                                           (|Complex| (|DoubleFloat|))
                                           '(|Comparable|)))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory|
                                               (|Complex| (|DoubleFloat|))
                                               '(|CoercibleTo|
                                                 (|OutputForm|))))
                                        (OR #3# #2#)
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|AbelianGroup|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|SemiRng|))
                                        (AND
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|Monoid|))
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|SemiRng|)))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|EuclideanDomain|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|IntegralDomain|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|CommutativeRing|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|ComplexDoubleFloatMatrix| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 262144))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Complex| (|DoubleFloat|)) '(|OrderedSet|))
         (|augmentPredVector| % 524288))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Complex| (|DoubleFloat|)) '(|BasicType|))
         (|augmentPredVector| % 1048576))
    (AND
     (OR
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Complex| (|DoubleFloat|)) '(|BasicType|)))
      (|HasCategory| (|Complex| (|DoubleFloat|)) '(|Hashable|)) #1#)
     (|augmentPredVector| % 2097152))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |ComplexDoubleFloatMatrix| ()
  (SPROG NIL
         (PROG (#1=#:G2786)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ComplexDoubleFloatMatrix|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ComplexDoubleFloatMatrix|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|ComplexDoubleFloatMatrix;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|ComplexDoubleFloatMatrix|)))))))))) 

(MAKEPROP '|ComplexDoubleFloatMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |CDFMAT;minRowIndex;%I;1|
              |CDFMAT;minColIndex;%I;2| (|NonNegativeInteger|)
              |CDFMAT;nrows;%Nni;3| |CDFMAT;ncols;%Nni;4|
              |CDFMAT;maxRowIndex;%I;5| |CDFMAT;maxColIndex;%I;6|
              (|Complex| (|DoubleFloat|)) |CDFMAT;qelt;%2IC;7|
              |CDFMAT;elt;%2IC;8| |CDFMAT;qsetelt!;%2I2C;9|
              |CDFMAT;setelt!;%2I2C;10| |CDFMAT;empty;%;11|
              |CDFMAT;qnew;2Nni%;12| |CDFMAT;new;2NniC%;13| (|Boolean|)
              (|Mapping| 14 14) (|List| 26) (|ComplexDoubleFloatVector|)
              (|List| 14) (|List| 6) (|Segment| 6) (|List| 28) (|List| %)
              (|List| 30) (|List| 9) (|PositiveInteger|) (|Mapping| 14 14 14)
              (|Mapping| 14 6 6) (|Void|) (|List| 32) (|Union| 14 '"one")
              (|List| 40) (|Equation| 14) (|Mapping| 22 14)
              (|Mapping| 22 14 14) (|OutputForm|) (|List| 25)
              (|Union| % '"failed") (|HashState|) (|SingleInteger|) (|String|))
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
           (CONS (|makeByteWordVec2| 11 '(0 0 1 0 2 6 9 0 7 11 9 0 0 0))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&| NIL
                     |HomogeneousAggregate&| |Hashable&| |SetCategory&|
                     |Evalable&| |Aggregate&| |BasicType&| NIL |InnerEvalable&|
                     NIL NIL NIL)
                  (CONS
                   '#((|MatrixCategory| 14 25 25)
                      (|TwoDimensionalArrayCategory| 14 25 25) (|Comparable|)
                      (|HomogeneousAggregate| 14) (|Hashable|) (|SetCategory|)
                      (|Evalable| 14) (|Aggregate|) (|BasicType|)
                      (|CoercibleTo| 43) (|InnerEvalable| 14 14)
                      (|shallowlyMutable|) (|finiteAggregate|) (|Type|))
                   (|makeByteWordVec2| 48
                                       '(2 22 22 0 0 1 1 0 22 0 1 2 0 0 9 9 1 2
                                         0 30 0 32 1 2 0 30 0 33 1 2 0 0 0 0 1
                                         1 0 0 30 1 1 0 0 0 1 1 0 0 25 1 1 0 22
                                         0 1 3 0 0 0 6 6 1 3 0 0 0 6 6 1 5 0 0
                                         0 6 6 6 6 1 1 0 0 0 1 1 0 22 0 1 2 1
                                         22 0 0 1 2 0 22 0 9 1 4 0 0 0 6 6 0 1
                                         4 0 0 0 29 6 0 1 4 0 0 0 6 29 0 1 4 0
                                         14 0 6 6 14 18 4 0 0 0 27 6 0 1 4 0 0
                                         0 6 27 0 1 4 0 0 0 28 28 0 1 4 0 0 0
                                         27 27 0 1 4 0 0 0 28 27 0 1 4 0 0 0 27
                                         28 0 1 4 0 0 0 29 28 0 1 4 0 0 0 28 29
                                         0 1 4 0 0 0 29 29 0 1 3 0 0 0 6 25 1 3
                                         0 0 0 6 25 1 2 0 0 9 14 1 0 0 0 1 1 0
                                         28 0 1 1 15 0 0 1 2 0 25 0 6 1 1 16 9
                                         0 1 4 0 14 0 6 6 14 17 2 0 0 9 9 20 3
                                         0 14 0 6 6 15 2 13 0 0 6 1 1 0 26 0 1
                                         1 16 9 0 1 1 16 44 0 1 1 0 9 0 10 3 0
                                         0 9 9 14 21 1 0 9 0 11 2 0 22 0 9 1 1
                                         17 14 0 1 1 0 6 0 7 1 0 6 0 8 1 20 14
                                         0 1 1 19 26 0 1 2 21 22 14 0 1 1 0 6 0
                                         12 1 0 6 0 13 1 20 14 0 1 2 19 14 42 0
                                         1 1 0 0 24 1 3 0 0 9 9 35 1 2 0 0 23 0
                                         1 2 0 0 23 0 1 3 0 0 34 0 0 1 4 0 0 34
                                         0 0 14 1 1 0 24 0 1 2 0 22 0 9 1 1 5
                                         48 0 1 7 0 36 0 6 37 30 9 9 38 1 2 0 0
                                         0 0 1 1 0 0 30 1 2 13 0 0 0 1 1 13 0
                                         30 1 1 18 45 0 1 2 0 30 0 32 1 2 0 30
                                         0 33 1 2 0 0 0 0 1 1 0 0 30 1 2 2 46
                                         46 0 1 1 2 47 0 1 2 0 0 0 14 1 2 16 45
                                         0 14 1 2 19 22 41 0 1 2 8 0 0 39 1 3 8
                                         0 0 14 14 1 2 8 0 0 40 1 3 8 0 0 26 26
                                         1 2 0 22 0 0 1 1 0 22 0 1 0 0 0 19 3 0
                                         14 0 6 6 16 4 0 14 0 6 6 14 1 3 0 0 0
                                         27 6 1 3 0 0 0 6 27 1 3 0 0 0 28 28 1
                                         3 0 0 0 27 27 1 3 0 0 0 28 27 1 3 0 0
                                         0 27 28 1 3 0 0 0 29 6 1 3 0 0 0 6 29
                                         1 3 0 0 0 29 28 1 3 0 0 0 28 29 1 3 0
                                         0 0 29 29 1 1 0 0 26 1 1 0 0 30 1 1 0
                                         22 0 1 1 17 14 0 1 2 21 9 14 0 1 2 19
                                         9 41 0 1 1 0 0 0 1 1 15 44 0 1 2 0 25
                                         0 6 1 1 0 28 0 1 1 0 0 25 1 1 10 43 0
                                         1 3 0 31 0 32 32 1 3 0 31 0 33 33 1 1
                                         0 0 31 1 1 0 0 24 1 2 19 22 41 0 1 1
                                         12 22 0 1 2 14 0 0 9 1 2 18 0 0 6 1 1
                                         17 14 0 1 2 22 22 0 0 1 2 18 0 0 14 1
                                         1 12 0 0 1 2 12 0 0 0 1 2 0 0 0 0 1 2
                                         12 0 6 0 1 2 13 0 0 0 1 2 13 0 0 14 1
                                         2 13 0 14 0 1 2 13 25 25 0 1 2 13 25 0
                                         25 1 1 19 9 0 1)))))
           '|lookupComplete|)) 
