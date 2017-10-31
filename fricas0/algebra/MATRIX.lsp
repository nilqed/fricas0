
(PUT '|MATRIX;minRowIndex;$I;1| '|SPADreplace| '(XLAM (|x|) 1)) 

(SDEFUN |MATRIX;minRowIndex;$I;1| ((|x| $) ($ |Integer|)) 1) 

(PUT '|MATRIX;minColIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 1)) 

(SDEFUN |MATRIX;minColIndex;$I;2| ((|x| $) ($ |Integer|)) 1) 

(PUT '|MATRIX;qelt;$2IR;3| '|SPADreplace|
     '(XLAM (|m| |i| |j|) (QAREF2O |m| |i| |j| 1 1))) 

(SDEFUN |MATRIX;qelt;$2IR;3| ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ R))
        (QAREF2O |m| |i| |j| 1 1)) 

(PUT '|MATRIX;qsetelt!;$2I2R;4| '|SPADreplace|
     '(XLAM (|m| |i| |j| |r|) (QSETAREF2O |m| |i| |j| |r| 1 1))) 

(SDEFUN |MATRIX;qsetelt!;$2I2R;4|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| R) ($ R))
        (QSETAREF2O |m| |i| |j| |r| 1 1)) 

(SDEFUN |MATRIX;swapRows!;$2I$;5|
        ((|x| $) (|i1| . #1=(|Integer|)) (|i2| . #1#) ($ $))
        (SPROG ((|t2| (R)) (|t1| (R)) (#2=#:G2769 NIL) (|j| NIL))
               (SEQ
                (COND
                 ((OR (< |i1| (SPADCALL |x| (QREFELT $ 8)))
                      (OR
                       (SPADCALL |i1| (SPADCALL |x| (QREFELT $ 12))
                                 (QREFELT $ 14))
                       (OR (< |i2| (SPADCALL |x| (QREFELT $ 8)))
                           (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12))
                                     (QREFELT $ 14)))))
                  (|error| "swapRows!: index out of range"))
                 ('T
                  (COND ((EQL |i1| |i2|) |x|)
                        ('T
                         (SEQ
                          (SEQ
                           (LETT |j| (SPADCALL |x| (QREFELT $ 9))
                                 . #3=(|MATRIX;swapRows!;$2I$;5|))
                           (LETT #2# (SPADCALL |x| (QREFELT $ 15)) . #3#) G190
                           (COND ((> |j| #2#) (GO G191)))
                           (SEQ (LETT |t1| (QAREF2O |x| |i1| |j| 1 1) . #3#)
                                (LETT |t2| (QAREF2O |x| |i2| |j| 1 1) . #3#)
                                (QSETAREF2O |x| |i1| |j| |t2| 1 1)
                                (EXIT (QSETAREF2O |x| |i2| |j| |t1| 1 1)))
                           (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                           (EXIT NIL))
                          (EXIT |x|))))))))) 

(SDEFUN |MATRIX;copy;2$;6| ((|m| $) ($ $))
        (SPROG
         ((#1=#:G2775 NIL) (|j| NIL) (#2=#:G2774 NIL) (|i| NIL) (|ans| ($)))
         (SEQ
          (LETT |ans| (MAKE_MATRIX (ANROWS |m|) (ANCOLS |m|))
                . #3=(|MATRIX;copy;2$;6|))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 8)) . #3#)
               (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 9)) . #3#)
                      (LETT #1# (SPADCALL |m| (QREFELT $ 15)) . #3#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL |m| |i| |j| (QREFELT $ 10))
                                  (QREFELT $ 11))))
                      (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |MATRIX;determinant;$R;7| ((|x| $) ($ R)) (SPADCALL |x| (QREFELT $ 19))) 

(SDEFUN |MATRIX;minordet;$R;8| ((|x| $) ($ R)) (SPADCALL |x| (QREFELT $ 21))) 

(SDEFUN |MATRIX;rowEchelon;2$;9| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 23))) 

(SDEFUN |MATRIX;rank;$Nni;10| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 26))) 

(SDEFUN |MATRIX;nullity;$Nni;11| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 28))) 

(SDEFUN |MATRIX;nullSpace;$L;12| ((|x| $) ($ |List| (|Vector| R)))
        (SPADCALL |x| (QREFELT $ 31))) 

(SDEFUN |MATRIX;inverse;$U;13| ((|x| $) ($ |Union| $ "failed"))
        (SPADCALL |x| (QREFELT $ 34))) 

(SDEFUN |MATRIX;invertIfCan;$U;14| ((|x| $) ($ |Union| $ "failed"))
        (SPADCALL |x| (QREFELT $ 37))) 

(SDEFUN |MATRIX;diagonalMatrix;V$;15| ((|v| |Vector| R) ($ $))
        (SPROG
         ((#1=#:G2796 NIL) (|i| NIL) (#2=#:G2797 NIL) (|j| NIL)
          (#3=#:G2798 NIL) (|k| NIL) (|ans| ($)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (QVSIZE |v|) . #4=(|MATRIX;diagonalMatrix;V$;15|))
              (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 39)) . #4#)
              (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 41)) . #4#)
                   (LETT #3# (QVSIZE |v|) . #4#)
                   (LETT |j| (SPADCALL |ans| (QREFELT $ 9)) . #4#)
                   (LETT #2# (SPADCALL |ans| (QREFELT $ 15)) . #4#)
                   (LETT |i| (SPADCALL |ans| (QREFELT $ 8)) . #4#)
                   (LETT #1# (SPADCALL |ans| (QREFELT $ 12)) . #4#) G190
                   (COND ((OR (> |i| #1#) (> |j| #2#) (> |k| #3#)) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |ans| |i| |j| (QAREF1O |v| |k| 1)
                               (QREFELT $ 11))))
                   (LETT |i|
                         (PROG1 (+ |i| 1)
                           (LETT |j|
                                 (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #4#))
                                 . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATRIX;convert;$If;16| ((|x| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|matrix| (QREFELT $ 45))
               (SPADCALL (SPADCALL |x| (QREFELT $ 47)) (QREFELT $ 48)))
         (QREFELT $ 50))) 

(DECLAIM (NOTINLINE |Matrix;|)) 

(DEFUN |Matrix| (#1=#:G2810)
  (SPROG NIL
         (PROG (#2=#:G2811)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Matrix|)
                                               '|domainEqualList|)
                    . #3=(|Matrix|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Matrix;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Matrix|)))))))))) 

(DEFUN |Matrix;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G2807 NIL) (#2=#:G2808 NIL) (#3=#:G2809 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|Matrix|))
    (LETT |dv$| (LIST '|Matrix| DV$1) . #4#)
    (LETT $ (GETREFV 72) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #4#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            (|HasCategory| |#1|
                                                           '(|Comparable|))
                                            #3#)
                                        (OR
                                         (|HasCategory| |#1| '(|Comparable|))
                                         #3#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #4#)
                                        (OR #2#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #3#))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRng|))
                                        (AND (|HasCategory| |#1| '(|Monoid|))
                                             (|HasCategory| |#1| '(|SemiRng|)))
                                        (|HasCategory| |#1|
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #4#)
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
                                          #1#)
                                         (AND
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          #3#))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|Matrix| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 131072))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 262144))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      #3#)
     (|augmentPredVector| $ 524288))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV $ 20 (CONS (|dispatchFunction| |MATRIX;determinant;$R;7|) $))
       (QSETREFV $ 22 (CONS (|dispatchFunction| |MATRIX;minordet;$R;8|) $)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (QSETREFV $ 24 (CONS (|dispatchFunction| |MATRIX;rowEchelon;2$;9|) $))))
    (COND
     ((|testBitVector| |pv$| 16)
      (PROGN
       (QSETREFV $ 27 (CONS (|dispatchFunction| |MATRIX;rank;$Nni;10|) $))
       (QSETREFV $ 29 (CONS (|dispatchFunction| |MATRIX;nullity;$Nni;11|) $))
       (QSETREFV $ 32
                 (CONS (|dispatchFunction| |MATRIX;nullSpace;$L;12|) $)))))
    (COND
     ((|testBitVector| |pv$| 15)
      (QSETREFV $ 36 (CONS (|dispatchFunction| |MATRIX;inverse;$U;13|) $))))
    (COND
     ((|testBitVector| |pv$| 16)
      (QSETREFV $ 38
                (CONS (|dispatchFunction| |MATRIX;invertIfCan;$U;14|) $))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 51 (CONS (|dispatchFunction| |MATRIX;convert;$If;16|) $))))
    $))) 

(MAKEPROP '|Matrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerIndexedTwoDimensionalArray| 6 (NRTEVAL 1) (NRTEVAL 1) 40
                                                 40)
              (|local| |#1|) (|Integer|) |MATRIX;minRowIndex;$I;1|
              |MATRIX;minColIndex;$I;2| |MATRIX;qelt;$2IR;3|
              |MATRIX;qsetelt!;$2I2R;4| (0 . |maxRowIndex|) (|Boolean|) (5 . >)
              (11 . |maxColIndex|) |MATRIX;swapRows!;$2I$;5| |MATRIX;copy;2$;6|
              (|MatrixLinearAlgebraFunctions| 6 40 40 $$) (16 . |determinant|)
              (21 . |determinant|) (26 . |minordet|) (31 . |minordet|)
              (36 . |rowEchelon|) (41 . |rowEchelon|) (|NonNegativeInteger|)
              (46 . |rank|) (51 . |rank|) (56 . |nullity|) (61 . |nullity|)
              (|List| 40) (66 . |nullSpace|) (71 . |nullSpace|)
              (|Union| $$ '"failed") (76 . |inverse|) (|Union| $ '"failed")
              (81 . |inverse|) (86 . |invertIfCan|) (91 . |invertIfCan|)
              (96 . |zero|) (|Vector| 6) (102 . |minIndex|)
              |MATRIX;diagonalMatrix;V$;15| (|Symbol|) (|InputForm|)
              (107 . |convert|) (|List| 52) (112 . |listOfLists|)
              (117 . |convert|) (|List| $) (122 . |convert|) (127 . |convert|)
              (|List| 6) (|Equation| 6) (|List| 53) (|Mapping| 13 6)
              (|OutputForm|) (|SingleInteger|) (|String|) (|HashState|)
              (|Void|) (|List| 68) (|Union| 6 '"one") (|Mapping| 6 7 7)
              (|Mapping| 6 6 6) (|Mapping| 6 6) (|List| 49) (|PositiveInteger|)
              (|List| 25) (|List| 70) (|Segment| 7) (|List| 7))
           '#(|zero| 132 |swapRows!| 138 |rowEchelon| 145 |rank| 150 |qsetelt!|
              155 |qelt| 163 |nullity| 170 |nullSpace| 175 |minordet| 180
              |minRowIndex| 185 |minColIndex| 190 |maxRowIndex| 195
              |maxColIndex| 200 |listOfLists| 205 |invertIfCan| 210 |inverse|
              215 |diagonalMatrix| 220 |determinant| 225 |copy| 230 |convert|
              235)
           'NIL
           (CONS (|makeByteWordVec2| 17 '(0 0 0 1 0 17 6 0 0 0 17 5 9 2))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| NIL |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL NIL)
                  (CONS
                   '#((|MatrixCategory| 6 (|Vector| 6) (|Vector| 6))
                      (|TwoDimensionalArrayCategory| 6 (|Vector| 6)
                                                     (|Vector| 6))
                      (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                      (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 56)
                      (|ConvertibleTo| 44))
                   (|makeByteWordVec2| 51
                                       '(1 0 7 0 12 2 7 13 0 0 14 1 0 7 0 15 1
                                         18 6 2 19 1 0 6 0 20 1 18 6 2 21 1 0 6
                                         0 22 1 18 2 2 23 1 0 0 0 24 1 18 25 2
                                         26 1 0 25 0 27 1 18 25 2 28 1 0 25 0
                                         29 1 18 30 2 31 1 0 30 0 32 1 18 33 2
                                         34 1 0 35 0 36 1 18 33 2 37 1 0 35 0
                                         38 2 0 0 25 25 39 1 40 7 0 41 1 44 0
                                         43 45 1 0 46 0 47 1 46 44 0 48 1 44 0
                                         49 50 1 0 44 0 51 2 0 0 25 25 39 3 0 0
                                         0 7 7 16 1 13 0 0 24 1 16 25 0 27 4 0
                                         6 0 7 7 6 11 3 0 6 0 7 7 10 1 16 25 0
                                         29 1 16 30 0 32 1 14 6 0 22 1 0 7 0 8
                                         1 0 7 0 9 1 0 7 0 12 1 0 7 0 15 1 0 46
                                         0 47 1 16 35 0 38 1 15 35 0 36 1 0 0
                                         40 42 1 14 6 0 20 1 0 0 0 17 1 2 44 0
                                         51)))))
           '|lookupIncomplete|)) 
