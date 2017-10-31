
(PUT '|U32MAT;minRowIndex;$I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |U32MAT;minRowIndex;$I;1| ((|x| $) ($ |Integer|)) 0) 

(PUT '|U32MAT;minColIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |U32MAT;minColIndex;$I;2| ((|x| $) ($ |Integer|)) 0) 

(PUT '|U32MAT;nrows;$Nni;3| '|SPADreplace| 'ANROWS_U32) 

(SDEFUN |U32MAT;nrows;$Nni;3| ((|x| $) ($ |NonNegativeInteger|))
        (ANROWS_U32 |x|)) 

(PUT '|U32MAT;ncols;$Nni;4| '|SPADreplace| 'ANCOLS_U32) 

(SDEFUN |U32MAT;ncols;$Nni;4| ((|x| $) ($ |NonNegativeInteger|))
        (ANCOLS_U32 |x|)) 

(SDEFUN |U32MAT;maxRowIndex;$I;5| ((|x| $) ($ |Integer|))
        (- (ANROWS_U32 |x|) 1)) 

(SDEFUN |U32MAT;maxColIndex;$I;6| ((|x| $) ($ |Integer|))
        (- (ANCOLS_U32 |x|) 1)) 

(PUT '|U32MAT;qelt;$3I;7| '|SPADreplace| 'AREF2_U32) 

(SDEFUN |U32MAT;qelt;$3I;7|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ |Integer|))
        (AREF2_U32 |m| |i| |j|)) 

(PUT '|U32MAT;elt;$3I;8| '|SPADreplace| 'AREF2_U32) 

(SDEFUN |U32MAT;elt;$3I;8|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ |Integer|))
        (AREF2_U32 |m| |i| |j|)) 

(PUT '|U32MAT;qsetelt!;$4I;9| '|SPADreplace| 'SETAREF2_U32) 

(SDEFUN |U32MAT;qsetelt!;$4I;9|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| . #2=(|Integer|))
         ($ . #2#))
        (SETAREF2_U32 |m| |i| |j| |r|)) 

(PUT '|U32MAT;setelt!;$4I;10| '|SPADreplace| 'SETAREF2_U32) 

(SDEFUN |U32MAT;setelt!;$4I;10|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| . #2=(|Integer|))
         ($ . #2#))
        (SETAREF2_U32 |m| |i| |j| |r|)) 

(PUT '|U32MAT;empty;$;11| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX_U32 0 0))) 

(SDEFUN |U32MAT;empty;$;11| (($ $)) (MAKE_MATRIX_U32 0 0)) 

(PUT '|U32MAT;qnew;2Nni$;12| '|SPADreplace| 'MAKE_MATRIX_U32) 

(SDEFUN |U32MAT;qnew;2Nni$;12|
        ((|rows| . #1=(|NonNegativeInteger|)) (|cols| . #1#) ($ $))
        (MAKE_MATRIX_U32 |rows| |cols|)) 

(PUT '|U32MAT;new;2NniI$;13| '|SPADreplace| 'MAKE_MATRIX1_U32) 

(SDEFUN |U32MAT;new;2NniI$;13|
        ((|rows| . #1=(|NonNegativeInteger|)) (|cols| . #1#) (|a| |Integer|)
         ($ $))
        (MAKE_MATRIX1_U32 |rows| |cols| |a|)) 

(DECLAIM (NOTINLINE |U32Matrix;|)) 

(DEFUN |U32Matrix| ()
  (SPROG NIL
         (PROG (#1=#:G2946)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|U32Matrix|)
                    . #2=(|U32Matrix|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|U32Matrix|
                             (LIST (CONS NIL (CONS 1 (|U32Matrix;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|U32Matrix|)))))))))) 

(DEFUN |U32Matrix;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G2943 NIL) (#2=#:G2944 NIL) (#3=#:G2942 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|U32Matrix|) . #4=(|U32Matrix|))
    (LETT $ (GETREFV 45) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|Comparable|))
                                        (|HasCategory| (|Integer|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|SetCategory|))
                                              . #4#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|BasicType|))
                                         (|HasCategory| (|Integer|)
                                                        '(|Comparable|))
                                         #1#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|Comparable|))
                                         #1#)
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| (|Integer|)
                                                              '(|Evalable|
                                                                (|Integer|)))
                                               (|HasCategory| (|Integer|)
                                                              '(|SetCategory|)))
                                              . #4#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|Evalable|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|Comparable|)))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| (|Integer|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #4#)
                                        (OR #3# #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiRng|))
                                        (AND
                                         (|HasCategory| (|Integer|)
                                                        '(|Monoid|))
                                         (|HasCategory| (|Integer|)
                                                        '(|SemiRng|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| (|Integer|)
                                                       '(|IntegralDomain|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CommutativeRing|))
                                        (|HasCategory| (|Integer|)
                                                       '(|Field|))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|U32Matrix| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 65536))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|BasicType|))
         (|augmentPredVector| $ 131072))
    (AND
     (OR
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|BasicType|)))
      #1#)
     (|augmentPredVector| $ 262144))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|U32Matrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |U32MAT;minRowIndex;$I;1|
              |U32MAT;minColIndex;$I;2| (|NonNegativeInteger|)
              |U32MAT;nrows;$Nni;3| |U32MAT;ncols;$Nni;4|
              |U32MAT;maxRowIndex;$I;5| |U32MAT;maxColIndex;$I;6|
              |U32MAT;qelt;$3I;7| |U32MAT;elt;$3I;8| |U32MAT;qsetelt!;$4I;9|
              |U32MAT;setelt!;$4I;10| |U32MAT;empty;$;11|
              |U32MAT;qnew;2Nni$;12| |U32MAT;new;2NniI$;13| (|List| 6)
              (|Equation| 6) (|List| 22) (|Boolean|) (|OutputForm|) (|List| 28)
              (|Union| $ '"failed") (|U32Vector|) (|List| $) (|SingleInteger|)
              (|String|) (|HashState|) (|Mapping| 24 6) (|Void|) (|List| 42)
              (|Union| 6 '"one") (|List| 21) (|Mapping| 6 6 6) (|Mapping| 6 6)
              (|List| 29) (|PositiveInteger|) (|List| 9) (|List| 44)
              (|Segment| 6))
           '#(~= 0 |zero?| 6 |zero| 11 |vertSplit| 17 |vertConcat| 29
              |transpose| 40 |symmetric?| 50 |swapRows!| 55 |swapColumns!| 62
              |subMatrix| 69 |squareTop| 78 |square?| 83 |smaller?| 88 |size?|
              94 |setsubMatrix!| 100 |setelt!| 108 |setRow!| 204 |setColumn!|
              211 |scalarMatrix| 218 |sample| 224 |rowSlice| 228 |rowEchelon|
              233 |row| 238 |rank| 244 |qsetelt!| 249 |qnew| 257 |qelt| 263
              |positivePower| 270 |parts| 276 |nullity| 281 |nullSpace| 286
              |nrows| 291 |new| 296 |ncols| 303 |more?| 308 |minordet| 314
              |minRowIndex| 319 |minColIndex| 324 |members| 329 |member?| 334
              |maxRowIndex| 340 |maxColIndex| 345 |matrix| 350 |map!| 362 |map|
              368 |listOfLists| 389 |less?| 394 |latex| 400 |kronecker_prod1|
              405 |kroneckerSum| 416 |kroneckerProduct| 427 |inverse| 438
              |horizSplit| 443 |horizConcat| 455 |hashUpdate!| 466 |hash| 472
              |fill!| 477 |exquo| 483 |every?| 489 |eval| 495 |eq?| 521
              |empty?| 527 |empty| 532 |elt| 536 |diagonalMatrix| 628
              |diagonal?| 638 |determinant| 643 |count| 648 |copy| 660
              |columnSpace| 665 |column| 670 |colSlice| 676 |coerce| 681
              |blockSplit| 691 |blockConcat| 705 |any?| 710 |antisymmetric?|
              716 ^ 721 |Pfaffian| 733 = 738 / 744 - 750 + 761 * 767 |#| 803)
           'NIL
           (CONS (|makeByteWordVec2| 9 '(0 0 0 1 0 7 5 0 0 0 7 4 9))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| NIL |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL)
                  (CONS
                   '#((|MatrixCategory| 6 28 28)
                      (|TwoDimensionalArrayCategory| 6 28 28)
                      (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                      (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 25))
                   (|makeByteWordVec2| 44
                                       '(2 19 24 0 0 1 1 0 24 0 1 2 0 0 9 9 1 2
                                         0 29 0 41 1 2 0 29 0 42 1 1 0 0 29 1 2
                                         0 0 0 0 1 1 0 0 28 1 1 0 0 0 1 1 0 24
                                         0 1 3 0 0 0 6 6 1 3 0 0 0 6 6 1 5 0 0
                                         0 6 6 6 6 1 1 0 0 0 1 1 0 24 0 1 2 1
                                         24 0 0 1 2 0 24 0 9 1 4 0 0 0 6 6 0 1
                                         4 0 0 0 43 43 0 1 4 0 0 0 44 43 0 1 4
                                         0 0 0 43 44 0 1 4 0 0 0 21 44 0 1 4 0
                                         0 0 44 21 0 1 4 0 0 0 21 21 0 1 4 0 0
                                         0 44 44 0 1 4 0 0 0 6 21 0 1 4 0 0 0
                                         21 6 0 1 4 0 6 0 6 6 6 17 4 0 0 0 43 6
                                         0 1 4 0 0 0 6 43 0 1 3 0 0 0 6 28 1 3
                                         0 0 0 6 28 1 2 0 0 9 6 1 0 0 0 1 1 0
                                         44 0 1 1 13 0 0 1 2 0 28 0 6 1 1 14 9
                                         0 1 4 0 6 0 6 6 6 16 2 0 0 9 9 19 3 0
                                         6 0 6 6 14 2 11 0 0 6 1 1 0 21 0 1 1
                                         14 9 0 1 1 14 26 0 1 1 0 9 0 10 3 0 0
                                         9 9 6 20 1 0 9 0 11 2 0 24 0 9 1 1 15
                                         6 0 1 1 0 6 0 7 1 0 6 0 8 1 17 21 0 1
                                         2 18 24 6 0 1 1 0 6 0 12 1 0 6 0 13 1
                                         0 0 37 1 3 0 0 9 9 38 1 2 0 0 39 0 1 4
                                         0 0 38 0 0 6 1 3 0 0 38 0 0 1 2 0 0 39
                                         0 1 1 0 37 0 1 2 0 24 0 9 1 1 3 31 0 1
                                         7 0 34 0 6 35 29 9 9 36 1 2 0 0 0 0 1
                                         1 0 0 29 1 2 11 0 0 0 1 1 11 0 29 1 1
                                         16 27 0 1 2 0 29 0 41 1 2 0 29 0 42 1
                                         1 0 0 29 1 2 0 0 0 0 1 2 3 32 32 0 1 1
                                         3 30 0 1 2 0 0 0 6 1 2 14 27 0 6 1 2
                                         17 24 33 0 1 3 6 0 0 21 21 1 2 6 0 0
                                         22 1 3 6 0 0 6 6 1 2 6 0 0 23 1 2 0 24
                                         0 0 1 1 0 24 0 1 0 0 0 18 3 0 0 0 43
                                         44 1 3 0 0 0 43 43 1 3 0 0 0 44 43 1 3
                                         0 0 0 43 6 1 3 0 0 0 44 21 1 3 0 0 0 6
                                         43 1 3 0 0 0 44 44 1 3 0 0 0 21 44 1 3
                                         0 0 0 21 6 1 3 0 0 0 21 21 1 3 0 0 0 6
                                         21 1 4 0 6 0 6 6 6 1 3 0 6 0 6 6 15 1
                                         0 0 29 1 1 0 0 21 1 1 0 24 0 1 1 15 6
                                         0 1 2 18 9 6 0 1 2 17 9 33 0 1 1 0 0 0
                                         1 1 13 26 0 1 2 0 28 0 6 1 1 0 44 0 1
                                         1 8 25 0 1 1 0 0 28 1 3 0 40 0 41 41 1
                                         3 0 40 0 42 42 1 1 0 0 40 1 2 17 24 33
                                         0 1 1 10 24 0 1 2 12 0 0 9 1 2 16 0 0
                                         6 1 1 15 6 0 1 2 19 24 0 0 1 2 16 0 0
                                         6 1 1 10 0 0 1 2 10 0 0 0 1 2 0 0 0 0
                                         1 2 10 0 6 0 1 2 11 28 28 0 1 2 11 0 0
                                         6 1 2 11 28 0 28 1 2 11 0 0 0 1 2 11 0
                                         6 0 1 1 17 9 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|U32Matrix| 'NILADIC T) 
