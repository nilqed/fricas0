
(SDEFUN |IMATRIX;swapRows!;$2I$;1|
        ((|x| $) (|i1| . #1=(|Integer|)) (|i2| . #1#) ($ $))
        (SPROG
         ((|t2| (R)) (|t1| (R)) (#2=#:G706 NIL) (|j| NIL) (|co| (|Integer|))
          (|ro| (|Integer|)))
         (SEQ
          (COND
           ((OR (< |i1| (SPADCALL |x| (QREFELT $ 10)))
                (OR
                 (SPADCALL |i1| (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 13))
                 (OR (< |i2| (SPADCALL |x| (QREFELT $ 10)))
                     (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 11))
                               (QREFELT $ 13)))))
            (|error| "swapRows!: index out of range"))
           ('T
            (COND ((EQL |i1| |i2|) |x|)
                  ('T
                   (SEQ
                    (LETT |ro| (QREFELT $ 7) . #3=(|IMATRIX;swapRows!;$2I$;1|))
                    (LETT |co| (QREFELT $ 8) . #3#)
                    (SEQ (LETT |j| |co| . #3#)
                         (LETT #2# (SPADCALL |x| (QREFELT $ 14)) . #3#) G190
                         (COND ((> |j| #2#) (GO G191)))
                         (SEQ
                          (LETT |t1| (QAREF2O |x| |i1| |j| |ro| |co|) . #3#)
                          (LETT |t2| (QAREF2O |x| |i2| |j| |ro| |co|) . #3#)
                          (QSETAREF2O |x| |i1| |j| |t2| |ro| |co|)
                          (EXIT (QSETAREF2O |x| |i2| |j| |t1| |ro| |co|)))
                         (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT |x|))))))))) 

(SDEFUN |IMATRIX;determinant;$R;2| ((|x| $) ($ R))
        (SPADCALL |x| (QREFELT $ 17))) 

(SDEFUN |IMATRIX;minordet;$R;3| ((|x| $) ($ R)) (SPADCALL |x| (QREFELT $ 19))) 

(SDEFUN |IMATRIX;rowEchelon;2$;4| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 21))) 

(SDEFUN |IMATRIX;rank;$Nni;5| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 24))) 

(SDEFUN |IMATRIX;nullity;$Nni;6| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 26))) 

(SDEFUN |IMATRIX;nullSpace;$L;7|
        ((|x| $) ($ |List| (|IndexedVector| R |mnRow|)))
        (SPADCALL |x| (QREFELT $ 29))) 

(SDEFUN |IMATRIX;inverse;$U;8| ((|x| $) ($ |Union| $ "failed"))
        (SPADCALL |x| (QREFELT $ 32))) 

(DECLAIM (NOTINLINE |IndexedMatrix;|)) 

(DEFUN |IndexedMatrix| (&REST #1=#:G734)
  (SPROG NIL
         (PROG (#2=#:G735)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedMatrix|)
                                               '|domainEqualList|)
                    . #3=(|IndexedMatrix|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedMatrix;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedMatrix|)))))))))) 

(DEFUN |IndexedMatrix;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G731 NIL) (#2=#:G732 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|IndexedMatrix|))
    (LETT DV$2 (|devaluate| |#2|) . #3#)
    (LETT DV$3 (|devaluate| |#3|) . #3#)
    (LETT |dv$| (LIST '|IndexedMatrix| DV$1 DV$2 DV$3) . #3#)
    (LETT $ (GETREFV 59) . #3#)
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
                                             #2#))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRng|))
                                        (AND (|HasCategory| |#1| '(|Monoid|))
                                             (|HasCategory| |#1| '(|SemiRng|)))
                                        (|HasCategory| |#1|
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1| '(|Field|))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|IndexedMatrix| (LIST DV$1 DV$2 DV$3)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 65536))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 131072))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      #2#)
     (|augmentPredVector| $ 262144))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 15)
      (PROGN
       (QSETREFV $ 18 (CONS (|dispatchFunction| |IMATRIX;determinant;$R;2|) $))
       (QSETREFV $ 20 (CONS (|dispatchFunction| |IMATRIX;minordet;$R;3|) $)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (QSETREFV $ 22 (CONS (|dispatchFunction| |IMATRIX;rowEchelon;2$;4|) $))))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV $ 25 (CONS (|dispatchFunction| |IMATRIX;rank;$Nni;5|) $))
       (QSETREFV $ 27 (CONS (|dispatchFunction| |IMATRIX;nullity;$Nni;6|) $))
       (QSETREFV $ 30
                 (CONS (|dispatchFunction| |IMATRIX;nullSpace;$L;7|) $)))))
    (COND
     ((|testBitVector| |pv$| 16)
      (QSETREFV $ 34 (CONS (|dispatchFunction| |IMATRIX;inverse;$U;8|) $))))
    $))) 

(MAKEPROP '|IndexedMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerIndexedTwoDimensionalArray| 6 7 8 40 41) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|Integer|) (0 . |minRowIndex|)
              (5 . |maxRowIndex|) (|Boolean|) (10 . >) (16 . |maxColIndex|)
              |IMATRIX;swapRows!;$2I$;1|
              (|MatrixLinearAlgebraFunctions| 6 40 41 $$) (21 . |determinant|)
              (26 . |determinant|) (31 . |minordet|) (36 . |minordet|)
              (41 . |rowEchelon|) (46 . |rowEchelon|) (|NonNegativeInteger|)
              (51 . |rank|) (56 . |rank|) (61 . |nullity|) (66 . |nullity|)
              (|List| 41) (71 . |nullSpace|) (76 . |nullSpace|)
              (|Union| $$ '"failed") (81 . |inverse|) (|Union| $ '"failed")
              (86 . |inverse|) (|List| 6) (|Equation| 6) (|List| 36)
              (|Mapping| 12 6) (|OutputForm|) (|IndexedVector| 6 8)
              (|IndexedVector| 6 7) (|List| $) (|SingleInteger|) (|String|)
              (|HashState|) (|Void|) (|List| 55) (|Union| 6 '"one") (|List| 35)
              (|Mapping| 6 9 9) (|Mapping| 6 6 6) (|Mapping| 6 6) (|List| 42)
              (|PositiveInteger|) (|List| 23) (|List| 57) (|Segment| 9)
              (|List| 9))
           '#(|swapRows!| 91 |rowEchelon| 98 |rank| 103 |nullity| 108
              |nullSpace| 113 |minordet| 118 |minRowIndex| 123 |maxRowIndex|
              128 |maxColIndex| 133 |inverse| 138 |determinant| 143)
           'NIL
           (CONS (|makeByteWordVec2| 9 '(0 0 0 1 0 7 5 0 0 0 7 4 9))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| NIL |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL)
                  (CONS
                   '#((|MatrixCategory| 6 (|IndexedVector| 6 8)
                                        (|IndexedVector| 6 7))
                      (|TwoDimensionalArrayCategory| 6 (|IndexedVector| 6 8)
                                                     (|IndexedVector| 6 7))
                      (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                      (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 39))
                   (|makeByteWordVec2| 34
                                       '(1 0 9 0 10 1 0 9 0 11 2 9 12 0 0 13 1
                                         0 9 0 14 1 16 6 2 17 1 0 6 0 18 1 16 6
                                         2 19 1 0 6 0 20 1 16 2 2 21 1 0 0 0 22
                                         1 16 23 2 24 1 0 23 0 25 1 16 23 2 26
                                         1 0 23 0 27 1 16 28 2 29 1 0 28 0 30 1
                                         16 31 2 32 1 0 33 0 34 3 0 0 0 9 9 15
                                         1 13 0 0 22 1 14 23 0 25 1 14 23 0 27
                                         1 14 28 0 30 1 15 6 0 20 1 0 9 0 10 1
                                         0 9 0 11 1 0 9 0 14 1 16 33 0 34 1 15
                                         6 0 18)))))
           '|lookupIncomplete|)) 
