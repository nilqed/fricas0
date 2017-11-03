
(SDEFUN |RMATRIX;Zero;$;1| (($ $)) (QREFELT $ 10)) 

(SDEFUN |RMATRIX;coerce;$Of;2| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 13))) 

(SDEFUN |RMATRIX;matrix;L$;3| ((|l| |List| (|List| R)) ($ $))
        (SPROG
         ((#1=#:G723 NIL) (|j| NIL) (#2=#:G724 NIL) (|r| NIL) (#3=#:G721 NIL)
          (|i| NIL) (#4=#:G722 NIL) (|ll| NIL) (|ans| (|Matrix| R))
          (#5=#:G719 NIL) (#6=#:G720 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |l|) (QREFELT $ 6) (QREFELT $ 17))
            (|error| "matrix: wrong number of rows"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ll| NIL . #7=(|RMATRIX;matrix;L$;3|))
                    (LETT #6# |l| . #7#) G190
                    (COND
                     ((OR (ATOM #6#) (PROGN (LETT |ll| (CAR #6#) . #7#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (LENGTH |ll|) (QREFELT $ 7) (QREFELT $ 17))
                        (PROGN
                         (LETT #5# (|error| "matrix: wrong number of columns")
                               . #7#)
                         (GO #8=#:G711))))))
                    (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL)))
              #8# (EXIT #5#))
             (LETT |ans|
                   (MAKE_MATRIX1 (QREFELT $ 6) (QREFELT $ 7)
                                 (|spadConstant| $ 9))
                   . #7#)
             (SEQ (LETT |ll| NIL . #7#) (LETT #4# |l| . #7#) (LETT |i| 1 . #7#)
                  (LETT #3# (SPADCALL |ans| (QREFELT $ 19)) . #7#) G190
                  (COND
                   ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                        (PROGN (LETT |ll| (CAR #4#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |r| NIL . #7#) (LETT #2# |ll| . #7#)
                         (LETT |j| 1 . #7#)
                         (LETT #1# (SPADCALL |ans| (QREFELT $ 20)) . #7#) G190
                         (COND
                          ((OR (|greater_SI| |j| #1#) (ATOM #2#)
                               (PROGN (LETT |r| (CAR #2#) . #7#) NIL))
                           (GO G191)))
                         (SEQ (EXIT (QSETAREF2O |ans| |i| |j| |r| 1 1)))
                         (LETT |j|
                               (PROG1 (|inc_SI| |j|)
                                 (LETT #2# (CDR #2#) . #7#))
                               . #7#)
                         (GO G190) G191 (EXIT NIL))))
                  (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #7#))
                        . #7#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |RMATRIX;row;$IDp;4|
        ((|x| $) (|i| |Integer|) ($ |DirectProduct| |n| R))
        (SPADCALL (SPADCALL |x| |i| (QREFELT $ 24)) (QREFELT $ 26))) 

(SDEFUN |RMATRIX;column;$IDp;5|
        ((|x| $) (|j| |Integer|) ($ |DirectProduct| |m| R))
        (SPADCALL (SPADCALL |x| |j| (QREFELT $ 28)) (QREFELT $ 30))) 

(SDEFUN |RMATRIX;coerce;$M;6| ((|x| $) ($ |Matrix| R))
        (SPADCALL |x| (QREFELT $ 32))) 

(SDEFUN |RMATRIX;rectangularMatrix;M$;7| ((|x| |Matrix| R) ($ $))
        (COND
         ((OR (SPADCALL (ANROWS |x|) (QREFELT $ 6) (QREFELT $ 17))
              (SPADCALL (ANCOLS |x|) (QREFELT $ 7) (QREFELT $ 17)))
          (|error| "rectangularMatrix: matrix of bad dimensions"))
         ('T (SPADCALL |x| (QREFELT $ 32))))) 

(SDEFUN |RMATRIX;rowEchelon;2$;8| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 35))) 

(SDEFUN |RMATRIX;columnSpace;$L;9| ((|x| $) ($ |List| (|DirectProduct| |m| R)))
        (SPROG ((#1=#:G736 NIL) (|c| NIL) (#2=#:G735 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|RMATRIX;columnSpace;$L;9|))
                 (SEQ (LETT |c| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 38)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 30)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |RMATRIX;rank;$Nni;10| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 41))) 

(SDEFUN |RMATRIX;nullity;$Nni;11| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 43))) 

(SDEFUN |RMATRIX;nullSpace;$L;12| ((|x| $) ($ |List| (|DirectProduct| |m| R)))
        (SPROG ((#1=#:G742 NIL) (|c| NIL) (#2=#:G741 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|RMATRIX;nullSpace;$L;12|))
                 (SEQ (LETT |c| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 45)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 30)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |RMATRIX;dimension;Cn;13| (($ |CardinalNumber|))
        (SPADCALL (* (QREFELT $ 6) (QREFELT $ 7)) (QREFELT $ 48))) 

(SDEFUN |RMATRIX;convert;$If;14| ((|x| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|rectangularMatrix| (QREFELT $ 52))
               (SPADCALL (SPADCALL |x| (QREFELT $ 33)) (QREFELT $ 53)))
         (QREFELT $ 55))) 

(DECLAIM (NOTINLINE |RectangularMatrix;|)) 

(DEFUN |RectangularMatrix| (&REST #1=#:G760)
  (SPROG NIL
         (PROG (#2=#:G761)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RectangularMatrix|)
                                               '|domainEqualList|)
                    . #3=(|RectangularMatrix|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RectangularMatrix;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RectangularMatrix|)))))))))) 

(DEFUN |RectangularMatrix;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G759 NIL) (|pv$| NIL) (#2=#:G755 NIL) (#3=#:G756 NIL) (#4=#:G758 NIL)
    ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|RectangularMatrix|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT DV$3 (|devaluate| |#3|) . #5#)
    (LETT |dv$| (LIST '|RectangularMatrix| DV$1 DV$2 DV$3) . #5#)
    (LETT $ (GETREFV 68) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3| '(|AbelianGroup|))
                                        (|HasCategory| |#3| '(|Finite|))
                                        (LETT #4#
                                              (|HasCategory| |#3| '(|Field|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #4#)
                                        (AND
                                         (|HasCategory| |#3|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#3|)))
                                         (|HasCategory| |#3| '(|SetCategory|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #4#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3| '(|Finite|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|SetCategory|))))
                                        (|HasCategory| |#3| '(|BasicType|))
                                        (|HasCategory| |#3|
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| |#3|
                                                       '(|IntegralDomain|))
                                        (LETT #3#
                                              (|HasCategory| |#3|
                                                             '(|AbelianMonoid|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#3|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              . #5#)
                                        (OR #2#
                                            (AND
                                             (|HasCategory| |#3|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#3|)))
                                             (|HasCategory| |#3| '(|Finite|)))
                                            (AND
                                             (|HasCategory| |#3|
                                                            '(|AbelianGroup|))
                                             (|HasCategory| |#3| '(|Finite|)))
                                            (AND #3#
                                                 (|HasCategory| |#3|
                                                                '(|Finite|)))
                                            (AND
                                             (|HasCategory| |#3|
                                                            '(|CommutativeRing|))
                                             (|HasCategory| |#3| '(|Finite|)))
                                            (AND #4#
                                                 (|HasCategory| |#3|
                                                                '(|Finite|))))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|RectangularMatrix| (LIST DV$1 DV$2 DV$3)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 8192))
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
         (|augmentPredVector| $ 16384))
    (AND (|HasCategory| |#3| '(|BasicType|)) #1# (|augmentPredVector| $ 32768))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (MAKE_MATRIX1 |#1| |#2| (|spadConstant| $ 9)))
    (COND
     ((|testBitVector| |pv$| 8)
      (PROGN
       (QSETREFV $ 36 (CONS (|dispatchFunction| |RMATRIX;rowEchelon;2$;8|) $))
       (QSETREFV $ 40
                 (CONS (|dispatchFunction| |RMATRIX;columnSpace;$L;9|) $)))))
    (COND
     ((|testBitVector| |pv$| 9)
      (PROGN
       (QSETREFV $ 42 (CONS (|dispatchFunction| |RMATRIX;rank;$Nni;10|) $))
       (QSETREFV $ 44 (CONS (|dispatchFunction| |RMATRIX;nullity;$Nni;11|) $))
       (QSETREFV $ 46
                 (CONS (|dispatchFunction| |RMATRIX;nullSpace;$L;12|) $)))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 49 (CONS (|dispatchFunction| |RMATRIX;dimension;Cn;13|) $))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV $ 56 (CONS (|dispatchFunction| |RMATRIX;convert;$If;14|) $))))
    $))) 

(MAKEPROP '|RectangularMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Matrix| 8) (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |Zero|) 'ZERO
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |RMATRIX;Zero;$;1|) $))
              (|OutputForm|) (4 . |coerce|) |RMATRIX;coerce;$Of;2| (|Boolean|)
              (|NonNegativeInteger|) (9 . ~=) (|Integer|) (15 . |maxRowIndex|)
              (20 . |maxColIndex|) (|List| 59) |RMATRIX;matrix;L$;3|
              (|Vector| 8) (25 . |row|)
              (|DirectProduct| (NRTEVAL (QREFELT $ 7)) 8)
              (31 . |directProduct|) |RMATRIX;row;$IDp;4| (36 . |column|)
              (|DirectProduct| (NRTEVAL (QREFELT $ 6)) 8)
              (42 . |directProduct|) |RMATRIX;column;$IDp;5| (47 . |copy|)
              |RMATRIX;coerce;$M;6| |RMATRIX;rectangularMatrix;M$;7|
              (52 . |rowEchelon|) (57 . |rowEchelon|) (|List| 23)
              (62 . |columnSpace|) (|List| 29) (67 . |columnSpace|)
              (72 . |rank|) (77 . |rank|) (82 . |nullity|) (87 . |nullity|)
              (92 . |nullSpace|) (97 . |nullSpace|) (|CardinalNumber|)
              (102 . |coerce|) (107 . |dimension|) (|Symbol|) (|InputForm|)
              (111 . |convert|) (116 . |convert|) (|List| $) (121 . |convert|)
              (126 . |convert|) (|List| 58) (|Equation| 8) (|List| 8)
              (|Mapping| 15 8) (|Mapping| 8 8) (|Union| $ '"failed")
              (|PositiveInteger|) (|Mapping| 8 8 8) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 131 |zero?| 137 |symmetric?| 142 |subtractIfCan| 147 |square?|
              153 |smaller?| 158 |size?| 164 |size| 170 |sample| 174
              |rowEchelon| 178 |row| 183 |rectangularMatrix| 189 |rank| 194
              |random| 199 |qelt| 203 |parts| 210 |opposite?| 215 |nullity| 221
              |nullSpace| 226 |nrows| 231 |ncols| 236 |more?| 241 |minRowIndex|
              247 |minColIndex| 252 |members| 257 |member?| 262 |maxRowIndex|
              268 |maxColIndex| 273 |matrix| 278 |map!| 283 |map| 289 |lookup|
              302 |listOfLists| 307 |less?| 312 |latex| 318 |index| 323
              |hashUpdate!| 328 |hash| 334 |exquo| 339 |every?| 345 |eval| 351
              |eq?| 377 |enumerate| 383 |empty?| 387 |empty| 392 |elt| 396
              |dimension| 411 |diagonal?| 415 |count| 420 |copy| 432 |convert|
              437 |columnSpace| 442 |column| 447 |coerce| 453 |any?| 463
              |antisymmetric?| 469 |Zero| 474 = 478 / 484 - 490 + 501 * 507 |#|
              537)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 3 4 0 0 0 1 1 11 2 0 0 2 0 0 6 0 0 0 0 0 6
                                  13))
            (CONS
             '#(|RectangularMatrixCategory&| |VectorSpace&| |Module&| NIL NIL
                NIL |AbelianGroup&| NIL |AbelianMonoid&| |Finite&|
                |HomogeneousAggregate&| |AbelianSemiGroup&| NIL |Aggregate&|
                |SetCategory&| |Evalable&| NIL NIL NIL |BasicType&| NIL
                |InnerEvalable&| NIL)
             (CONS
              '#((|RectangularMatrixCategory| 6 7 8 (|DirectProduct| 7 8)
                                              (|DirectProduct| 6 8))
                 (|VectorSpace| 8) (|Module| 8) (|BiModule| 8 8)
                 (|LeftModule| 8) (|RightModule| 8) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|AbelianMonoid|) (|Finite|)
                 (|HomogeneousAggregate| 8) (|AbelianSemiGroup|) (|Comparable|)
                 (|Aggregate|) (|SetCategory|) (|Evalable| 8)
                 (|CoercibleTo| (|Matrix| 8)) (|finiteAggregate|) (|Type|)
                 (|BasicType|) (|CoercibleTo| 12) (|InnerEvalable| 8 8)
                 (|ConvertibleTo| 51))
              (|makeByteWordVec2| 67
                                  '(0 8 0 9 1 5 12 0 13 2 16 15 0 0 17 1 5 18 0
                                    19 1 5 18 0 20 2 5 23 0 18 24 1 25 0 23 26
                                    2 5 23 0 18 28 1 29 0 23 30 1 5 0 0 32 1 5
                                    0 0 35 1 0 0 0 36 1 5 37 0 38 1 0 39 0 40 1
                                    5 16 0 41 1 0 16 0 42 1 5 16 0 43 1 0 16 0
                                    44 1 5 37 0 45 1 0 39 0 46 1 47 0 16 48 0 0
                                    47 49 1 51 0 50 52 1 5 51 0 53 1 51 0 54 55
                                    1 0 51 0 56 2 0 15 0 0 1 1 10 15 0 1 1 0 15
                                    0 1 2 1 62 0 0 1 1 0 15 0 1 2 2 15 0 0 1 2
                                    0 15 0 16 1 0 2 16 1 0 0 0 1 1 8 0 0 36 2 0
                                    25 0 18 27 1 0 0 5 34 1 9 16 0 42 0 2 0 1 3
                                    0 8 0 18 18 1 1 15 59 0 1 2 10 15 0 0 1 1 9
                                    16 0 44 1 9 39 0 46 1 0 16 0 1 1 0 16 0 1 2
                                    0 15 0 16 1 1 0 18 0 1 1 0 18 0 1 1 15 59 0
                                    1 2 16 15 8 0 1 1 0 18 0 1 1 0 18 0 1 1 0 0
                                    21 22 2 14 0 61 0 1 3 0 0 64 0 0 1 2 0 0 61
                                    0 1 1 2 63 0 1 1 0 21 0 1 2 0 15 0 16 1 1 0
                                    65 0 1 1 2 0 63 1 2 0 67 67 0 1 1 0 66 0 1
                                    2 9 62 0 8 1 2 15 15 60 0 1 2 5 0 0 57 1 2
                                    5 0 0 58 1 3 5 0 0 59 59 1 3 5 0 0 8 8 1 2
                                    0 15 0 0 1 0 2 54 1 1 0 15 0 1 0 0 0 1 4 0
                                    8 0 18 18 8 1 3 0 8 0 18 18 1 0 3 47 49 1 0
                                    15 0 1 2 16 16 8 0 1 2 15 16 60 0 1 1 0 0 0
                                    1 1 12 51 0 56 1 8 39 0 40 2 0 29 0 18 31 1
                                    0 5 0 33 1 0 12 0 14 2 15 15 60 0 1 1 0 15
                                    0 1 0 10 0 11 2 0 15 0 0 1 2 3 0 0 8 1 1 1
                                    0 0 1 2 1 0 0 0 1 2 0 0 0 0 1 2 1 0 18 0 1
                                    2 10 0 16 0 1 2 0 0 8 0 1 2 0 0 0 8 1 2 0 0
                                    63 0 1 1 15 16 0 1)))))
           '|lookupComplete|)) 
