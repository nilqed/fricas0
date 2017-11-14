
(SDEFUN |SQMATRIX;Zero;$;1| (($ $)) (QREFELT $ 10)) 

(SDEFUN |SQMATRIX;One;$;2| (($ $)) (QREFELT $ 13)) 

(SDEFUN |SQMATRIX;characteristic;Nni;3| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 16))) 

(SDEFUN |SQMATRIX;matrix;L$;4| ((|l| |List| (|List| R)) ($ $))
        (SPROG
         ((#1=#:G725 NIL) (|j| NIL) (#2=#:G726 NIL) (|r| NIL) (#3=#:G723 NIL)
          (|i| NIL) (#4=#:G724 NIL) (|ll| NIL) (|ans| (|Matrix| R))
          (#5=#:G721 NIL) (#6=#:G722 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |l|) (QREFELT $ 6) (QREFELT $ 19))
            (|error| "matrix: wrong number of rows"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ll| NIL . #7=(|SQMATRIX;matrix;L$;4|))
                    (LETT #6# |l| . #7#) G190
                    (COND
                     ((OR (ATOM #6#) (PROGN (LETT |ll| (CAR #6#) . #7#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (LENGTH |ll|) (QREFELT $ 6) (QREFELT $ 19))
                        (PROGN
                         (LETT #5# (|error| "matrix: wrong number of columns")
                               . #7#)
                         (GO #8=#:G713))))))
                    (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL)))
              #8# (EXIT #5#))
             (LETT |ans|
                   (MAKE_MATRIX1 (QREFELT $ 6) (QREFELT $ 6)
                                 (|spadConstant| $ 8))
                   . #7#)
             (SEQ (LETT |ll| NIL . #7#) (LETT #4# |l| . #7#) (LETT |i| 1 . #7#)
                  (LETT #3# (SPADCALL |ans| (QREFELT $ 21)) . #7#) G190
                  (COND
                   ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                        (PROGN (LETT |ll| (CAR #4#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |r| NIL . #7#) (LETT #2# |ll| . #7#)
                         (LETT |j| 1 . #7#)
                         (LETT #1# (SPADCALL |ans| (QREFELT $ 22)) . #7#) G190
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

(SDEFUN |SQMATRIX;row;$IDp;5|
        ((|x| $) (|i| |Integer|) ($ |DirectProduct| |ndim| R))
        (SPADCALL (SPADCALL |x| |i| (QREFELT $ 26)) (QREFELT $ 28))) 

(SDEFUN |SQMATRIX;column;$IDp;6|
        ((|x| $) (|j| |Integer|) ($ |DirectProduct| |ndim| R))
        (SPADCALL (SPADCALL |x| |j| (QREFELT $ 30)) (QREFELT $ 28))) 

(SDEFUN |SQMATRIX;coerce;$Of;7| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 33))) 

(SDEFUN |SQMATRIX;scalarMatrix;R$;8| ((|r| R) ($ $))
        (SPADCALL (QREFELT $ 6) |r| (QREFELT $ 35))) 

(SDEFUN |SQMATRIX;diagonalMatrix;L$;9| ((|l| |List| R) ($ $))
        (COND
         ((SPADCALL (LENGTH |l|) (QREFELT $ 6) (QREFELT $ 19))
          (|error| "diagonalMatrix: wrong number of entries in list"))
         ('T (SPADCALL |l| (QREFELT $ 37))))) 

(SDEFUN |SQMATRIX;coerce;$M;10| ((|x| $) ($ |Matrix| R))
        (SPADCALL |x| (QREFELT $ 39))) 

(SDEFUN |SQMATRIX;squareMatrix;M$;11| ((|x| |Matrix| R) ($ $))
        (COND
         ((OR (SPADCALL (ANROWS |x|) (QREFELT $ 6) (QREFELT $ 19))
              (SPADCALL (ANCOLS |x|) (QREFELT $ 6) (QREFELT $ 19)))
          (|error| "squareMatrix: matrix of bad dimensions"))
         ('T (SPADCALL |x| (QREFELT $ 39))))) 

(SDEFUN |SQMATRIX;*;$2Dp;12|
        ((|x| $) (|v| . #1=(|DirectProduct| |ndim| R)) ($ . #1#))
        (SPADCALL (SPADCALL |x| (SPADCALL |v| (QREFELT $ 42)) (QREFELT $ 43))
                  (QREFELT $ 28))) 

(SDEFUN |SQMATRIX;*;Dp$Dp;13|
        ((|v| . #1=(|DirectProduct| |ndim| R)) (|x| $) ($ . #1#))
        (SPADCALL (SPADCALL (SPADCALL |v| (QREFELT $ 42)) |x| (QREFELT $ 45))
                  (QREFELT $ 28))) 

(SDEFUN |SQMATRIX;determinant;$R;14| ((|x| $) ($ R))
        (SPADCALL |x| (QREFELT $ 47))) 

(SDEFUN |SQMATRIX;minordet;$R;15| ((|x| $) ($ R)) (SPADCALL |x| (QREFELT $ 49))) 

(SDEFUN |SQMATRIX;Pfaffian;$R;16| ((|x| $) ($ R)) (SPADCALL |x| (QREFELT $ 51))) 

(SDEFUN |SQMATRIX;rowEchelon;2$;17| ((|x| $) ($ $))
        (SPADCALL |x| (QREFELT $ 53))) 

(SDEFUN |SQMATRIX;rank;$Nni;18| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |SQMATRIX;nullity;$Nni;19| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 57))) 

(SDEFUN |SQMATRIX;nullSpace;$L;20|
        ((|x| $) ($ |List| (|DirectProduct| |ndim| R)))
        (SPROG ((#1=#:G749 NIL) (|c| NIL) (#2=#:G748 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SQMATRIX;nullSpace;$L;20|))
                 (SEQ (LETT |c| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 60)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 28)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SQMATRIX;recip;$U;21| ((|x| $) ($ |Union| $ "failed"))
        (SPROG ((|u| (|Union| (|Matrix| R) "failed")))
               (SEQ
                (LETT |u| (SPADCALL |x| (QREFELT $ 64)) |SQMATRIX;recip;$U;21|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (QCDR |u|)))))))) 

(SDEFUN |SQMATRIX;inverse;$U;22| ((|x| $) ($ |Union| $ "failed"))
        (SPROG ((|u| (|Union| (|Matrix| R) "failed")))
               (SEQ
                (LETT |u| (SPADCALL |x| (QREFELT $ 66))
                      |SQMATRIX;inverse;$U;22|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (QCDR |u|)))))))) 

(SDEFUN |SQMATRIX;^;$I$;23| ((|x| $) (|n| |Integer|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 68))) 

(SDEFUN |SQMATRIX;recip;$U;24| ((|x| $) ($ |Union| $ "failed"))
        (SPADCALL |x| (QREFELT $ 67))) 

(SDEFUN |SQMATRIX;convert;$If;25| ((|x| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|squareMatrix| (QREFELT $ 72))
               (SPADCALL (SPADCALL |x| (QREFELT $ 40)) (QREFELT $ 73)))
         (QREFELT $ 75))) 

(DECLAIM (NOTINLINE |SquareMatrix;|)) 

(DEFUN |SquareMatrix| (&REST #1=#:G797)
  (SPROG NIL
         (PROG (#2=#:G798)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SquareMatrix|)
                                               '|domainEqualList|)
                    . #3=(|SquareMatrix|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SquareMatrix;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SquareMatrix|)))))))))) 

(DEFUN |SquareMatrix;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G794 NIL) (#2=#:G796 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|SquareMatrix|))
    (LETT DV$2 (|devaluate| |#2|) . #3#)
    (LETT |dv$| (LIST '|SquareMatrix| DV$1 DV$2) . #3#)
    (LETT $ (GETREFV 97) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|))
                                              . #3#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #2# (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|Finite|))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|CommutativeStar|))
                                          (|HasCategory| |#2| '(|unitsKnown|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2|
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| |#2|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#2| '(|BasicType|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#2|)))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Finite|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|SemiRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|SetCategory|))))
                                        (|HasCategory| |#2| '(|Field|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (AND #2#
                                             (|HasCategory| |#2| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              . #3#)
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#2|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#2|)))
                                             (|HasCategory| |#2| '(|Finite|)))
                                            (AND
                                             (|HasCategory| |#2|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#2| '(|Finite|)))
                                            (AND
                                             (|HasCategory| |#2|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (|HasCategory| |#2| '(|Finite|)))
                                            (AND
                                             (|HasCategory| |#2|
                                                            '(|RetractableTo|
                                                              (|Fraction|
                                                               (|Integer|))))
                                             (|HasCategory| |#2| '(|Finite|)))
                                            (AND
                                             (|HasCategory| |#2|
                                                            '(|RetractableTo|
                                                              (|Integer|)))
                                             (|HasCategory| |#2| '(|Finite|)))
                                            (AND
                                             (|HasCategory| |#2|
                                                            '(|AbelianGroup|))
                                             (|HasCategory| |#2| '(|Finite|)))
                                            (AND
                                             (|HasCategory| |#2|
                                                            '(|CommutativeRing|))
                                             (|HasCategory| |#2| '(|Finite|)))
                                            (AND
                                             (|HasCategory| |#2|
                                                            '(|CommutativeStar|))
                                             (|HasCategory| |#2| '(|Finite|)))
                                            (AND #2#
                                                 (|HasCategory| |#2|
                                                                '(|Finite|)))
                                            (AND
                                             (|HasCategory| |#2| '(|Finite|))
                                             (|HasCategory| |#2| '(|Ring|)))
                                            (AND
                                             (|HasCategory| |#2| '(|Finite|))
                                             (|HasCategory| |#2|
                                                            '(|SemiRing|))))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|SquareMatrix| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 16777216))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 33554432))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 67108864))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 134217728))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (SPADCALL (|spadConstant| $ 8) (QREFELT $ 9)))
    (COND
     ((|HasCategory| |#2| '(|Monoid|))
      (PROGN
       (QSETREFV $ 13 (SPADCALL (|spadConstant| $ 12) (QREFELT $ 9)))
       (QSETREFV $ 14
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |SQMATRIX;One;$;2|) $ 14))))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 17
                (CONS (|dispatchFunction| |SQMATRIX;characteristic;Nni;3|)
                      $))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 48
                 (CONS (|dispatchFunction| |SQMATRIX;determinant;$R;14|) $))
       (QSETREFV $ 50 (CONS (|dispatchFunction| |SQMATRIX;minordet;$R;15|) $))
       (QSETREFV $ 52
                 (CONS (|dispatchFunction| |SQMATRIX;Pfaffian;$R;16|) $)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (QSETREFV $ 54
                (CONS (|dispatchFunction| |SQMATRIX;rowEchelon;2$;17|) $))))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV $ 56 (CONS (|dispatchFunction| |SQMATRIX;rank;$Nni;18|) $))
       (QSETREFV $ 58 (CONS (|dispatchFunction| |SQMATRIX;nullity;$Nni;19|) $))
       (QSETREFV $ 62 (CONS (|dispatchFunction| |SQMATRIX;nullSpace;$L;20|) $))
       (QSETREFV $ 65 (CONS (|dispatchFunction| |SQMATRIX;recip;$U;21|) $)))))
    (COND
     ((|testBitVector| |pv$| 18)
      (PROGN
       (QSETREFV $ 67 (CONS (|dispatchFunction| |SQMATRIX;inverse;$U;22|) $))
       (QSETREFV $ 69 (CONS (|dispatchFunction| |SQMATRIX;^;$I$;23|) $))
       (QSETREFV $ 65 (CONS (|dispatchFunction| |SQMATRIX;recip;$U;24|) $)))))
    (COND
     ((|testBitVector| |pv$| 23)
      (QSETREFV $ 76 (CONS (|dispatchFunction| |SQMATRIX;convert;$If;25|) $))))
    $))) 

(MAKEPROP '|SquareMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Matrix| 7) (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) |SQMATRIX;scalarMatrix;R$;8| 'ZERO
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |SQMATRIX;Zero;$;1|) $))
              (4 . |One|) 'ONE (8 . |One|) (|NonNegativeInteger|)
              (12 . |characteristic|) (16 . |characteristic|) (|Boolean|)
              (20 . ~=) (|Integer|) (26 . |maxRowIndex|) (31 . |maxColIndex|)
              (|List| 36) |SQMATRIX;matrix;L$;4| (|Vector| 7) (36 . |row|)
              (|DirectProduct| (NRTEVAL (QREFELT $ 6)) 7)
              (42 . |directProduct|) |SQMATRIX;row;$IDp;5| (47 . |column|)
              |SQMATRIX;column;$IDp;6| (|OutputForm|) (53 . |coerce|)
              |SQMATRIX;coerce;$Of;7| (58 . |scalarMatrix|) (|List| 7)
              (64 . |diagonalMatrix|) |SQMATRIX;diagonalMatrix;L$;9|
              (69 . |copy|) |SQMATRIX;coerce;$M;10|
              |SQMATRIX;squareMatrix;M$;11| (74 . |coerce|) (79 . *)
              |SQMATRIX;*;$2Dp;12| (85 . *) |SQMATRIX;*;Dp$Dp;13|
              (91 . |determinant|) (96 . |determinant|) (101 . |minordet|)
              (106 . |minordet|) (111 . |Pfaffian|) (116 . |Pfaffian|)
              (121 . |rowEchelon|) (126 . |rowEchelon|) (131 . |rank|)
              (136 . |rank|) (141 . |nullity|) (146 . |nullity|) (|List| 25)
              (151 . |nullSpace|) (|List| 27) (156 . |nullSpace|)
              (|Union| $ '"failed") (161 . |invertIfCan|) (166 . |recip|)
              (171 . |inverse|) (176 . |inverse|) (181 . ^) (187 . ^)
              (|Symbol|) (|InputForm|) (193 . |convert|) (198 . |convert|)
              (|List| $) (203 . |convert|) (208 . |convert|) (|Equation| 7)
              (|List| 77) (|Matrix| 20) (|Matrix| $)
              (|Record| (|:| |mat| 79) (|:| |vec| (|Vector| 20))) (|Vector| $)
              (|List| 70) (|List| 15) (|Mapping| 18 7) (|Mapping| 7 7)
              (|PositiveInteger|) (|Fraction| 20) (|Union| 88 '#1="failed")
              (|Union| 20 '#1#) (|Record| (|:| |mat| 5) (|:| |vec| 25))
              (|Union| 7 '#1#) (|Mapping| 7 7 7) (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 213 |zero?| 219 |transpose| 224 |trace| 229 |symmetric?| 234
              |subtractIfCan| 239 |squareMatrix| 245 |square?| 250 |smaller?|
              255 |size?| 261 |size| 267 |scalarMatrix| 271 |sample| 276
              |rowEchelon| 280 |row| 285 |rightRecip| 291 |rightPower| 296
              |retractIfCan| 308 |retract| 323 |reducedSystem| 338 |recip| 360
              |rank| 365 |random| 370 |qelt| 374 |parts| 381 |opposite?| 386
              |one?| 392 |nullity| 397 |nullSpace| 402 |nrows| 407 |ncols| 412
              |more?| 417 |minordet| 423 |minRowIndex| 428 |minColIndex| 433
              |members| 438 |member?| 443 |maxRowIndex| 449 |maxColIndex| 454
              |matrix| 459 |map!| 464 |map| 470 |lookup| 483 |listOfLists| 488
              |less?| 493 |leftRecip| 499 |leftPower| 504 |latex| 516 |inverse|
              521 |index| 526 |hashUpdate!| 531 |hash| 537 |exquo| 542 |every?|
              548 |eval| 554 |eq?| 580 |enumerate| 586 |empty?| 590 |empty| 595
              |elt| 599 |differentiate| 614 |diagonalProduct| 664
              |diagonalMatrix| 669 |diagonal?| 674 |diagonal| 679 |determinant|
              684 |count| 689 |copy| 701 |convert| 706 |commutator| 711
              |columnSpace| 717 |column| 722 |coerce| 728 |characteristic| 753
              |associator| 757 |any?| 764 |antisymmetric?| 770 |antiCommutator|
              775 |annihilate?| 781 ^ 787 |Zero| 805 |Pfaffian| 809 |One| 814 D
              818 = 868 / 874 - 880 + 891 * 897 |#| 945)
           'NIL
           (CONS
            (|makeByteWordVec2| 24
                                '(0 4 4 1 4 5 6 7 8 0 3 8 0 1 0 0 4 0 0 0 0 8 2
                                  2 3 3 0 0 0 3 9 0 0 0 9 0 0 0 17 0 0 0 0 0 0
                                  17 10 11 24 12))
            (CONS
             '#(|SquareMatrixCategory&| |FullyLinearlyExplicitOver&|
                |DifferentialExtension&| |Algebra&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL
                |RectangularMatrixCategory&| NIL |Rng&| NIL |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&|
                |AbelianGroup&| NIL NIL NIL |NonAssociativeSemiRng&|
                |AbelianMonoid&| NIL |MagmaWithUnit&| |Finite&|
                |HomogeneousAggregate&| |Magma&| |AbelianSemiGroup&| NIL
                |FullyRetractableTo&| |Aggregate&| |SetCategory&| |Evalable&|
                NIL |RetractableTo&| NIL NIL |BasicType&| NIL |InnerEvalable&|
                |RetractableTo&| |RetractableTo&| NIL NIL)
             (CONS
              '#((|SquareMatrixCategory| 6 7 (|DirectProduct| 6 7)
                                         (|DirectProduct| 6 7))
                 (|FullyLinearlyExplicitOver| 7) (|DifferentialExtension| 7)
                 (|Algebra| 7) (|LinearlyExplicitOver| 7)
                 (|LinearlyExplicitOver| 20) (|PartialDifferentialRing| 70)
                 (|DifferentialRing|) (|Ring|)
                 (|RectangularMatrixCategory| 6 6 7 (|DirectProduct| 6 7)
                                              (|DirectProduct| 6 7))
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 7) (|BiModule| 7 7)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|LeftModule| 7)
                 (|RightModule| 7) (|RightModule| $$) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|Finite|)
                 (|HomogeneousAggregate| 7) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|FullyRetractableTo| 7) (|Aggregate|)
                 (|SetCategory|) (|Evalable| 7) (|CoercibleTo| (|Matrix| 7))
                 (|RetractableTo| 7) (|finiteAggregate|) (|Type|) (|BasicType|)
                 (|CoercibleTo| 32) (|InnerEvalable| 7 7) (|RetractableTo| 88)
                 (|RetractableTo| 20) (|ConvertibleTo| 71) (|unitsKnown|))
              (|makeByteWordVec2| 96
                                  '(0 7 0 8 0 7 0 12 0 0 0 14 0 7 15 16 0 0 15
                                    17 2 15 18 0 0 19 1 5 20 0 21 1 5 20 0 22 2
                                    5 25 0 20 26 1 27 0 25 28 2 5 25 0 20 30 1
                                    5 32 0 33 2 5 0 15 7 35 1 5 0 36 37 1 5 0 0
                                    39 1 27 25 0 42 2 5 25 0 25 43 2 5 25 25 0
                                    45 1 5 7 0 47 1 0 7 0 48 1 5 7 0 49 1 0 7 0
                                    50 1 5 7 0 51 1 0 7 0 52 1 5 0 0 53 1 0 0 0
                                    54 1 5 15 0 55 1 0 15 0 56 1 5 15 0 57 1 0
                                    15 0 58 1 5 59 0 60 1 0 61 0 62 1 5 63 0 64
                                    1 0 63 0 65 1 5 63 0 66 1 0 63 0 67 2 5 0 0
                                    20 68 2 0 0 0 20 69 1 71 0 70 72 1 5 71 0
                                    73 1 71 0 74 75 1 0 71 0 76 2 0 18 0 0 1 1
                                    0 18 0 1 1 0 0 0 1 1 0 7 0 1 1 0 18 0 1 2
                                    28 63 0 0 1 1 0 0 5 41 1 0 18 0 1 2 9 18 0
                                    0 1 2 0 18 0 15 1 0 9 15 1 1 0 0 7 9 0 0 0
                                    1 1 13 0 0 54 2 0 27 0 20 29 1 3 63 0 1 2 3
                                    0 0 15 1 2 0 0 0 87 1 1 10 89 0 1 1 11 90 0
                                    1 1 0 92 0 1 1 10 88 0 1 1 11 20 0 1 1 0 7
                                    0 1 1 19 79 80 1 2 19 81 80 82 1 2 4 91 80
                                    82 1 1 4 5 80 1 1 3 63 0 65 1 14 15 0 56 0
                                    9 0 1 3 0 7 0 20 20 1 1 26 36 0 1 2 0 18 0
                                    0 1 1 3 18 0 1 1 14 15 0 58 1 14 61 0 62 1
                                    0 15 0 1 1 0 15 0 1 2 0 18 0 15 1 1 1 7 0
                                    50 1 0 20 0 1 1 0 20 0 1 1 26 36 0 1 2 27
                                    18 7 0 1 1 0 20 0 1 1 0 20 0 1 1 0 0 23 24
                                    2 25 0 86 0 1 2 0 0 86 0 1 3 0 0 93 0 0 1 1
                                    9 87 0 1 1 0 23 0 1 2 0 18 0 15 1 1 3 63 0
                                    1 2 3 0 0 15 1 2 0 0 0 87 1 1 0 94 0 1 1 18
                                    63 0 67 1 9 0 87 1 2 0 96 96 0 1 1 0 95 0 1
                                    2 14 63 0 7 1 2 26 18 85 0 1 3 16 0 0 7 7 1
                                    3 16 0 0 36 36 1 2 16 0 0 77 1 2 16 0 0 78
                                    1 2 0 18 0 0 1 0 9 74 1 1 0 18 0 1 0 0 0 1
                                    3 0 7 0 20 20 1 4 0 7 0 20 20 7 1 2 20 0 0
                                    15 1 1 20 0 0 1 3 21 0 0 83 84 1 2 21 0 0
                                    83 1 3 21 0 0 70 15 1 2 21 0 0 70 1 2 4 0 0
                                    86 1 3 4 0 0 86 15 1 1 0 7 0 1 1 0 0 36 38
                                    1 0 18 0 1 1 0 27 0 1 1 1 7 0 48 2 27 15 7
                                    0 1 2 26 15 85 0 1 1 0 0 0 1 1 23 71 0 76 2
                                    4 0 0 0 1 1 13 61 0 1 2 0 27 0 20 31 1 22 0
                                    20 1 1 10 0 88 1 1 0 5 0 40 1 0 0 7 1 1 0
                                    32 0 34 0 4 15 17 3 4 0 0 0 0 1 2 26 18 85
                                    0 1 1 0 18 0 1 2 0 0 0 0 1 2 4 18 0 0 1 2
                                    18 0 0 20 69 2 3 0 0 15 1 2 0 0 0 87 1 0 0
                                    0 11 1 1 7 0 52 0 3 0 14 2 20 0 0 15 1 1 20
                                    0 0 1 3 21 0 0 83 84 1 2 21 0 0 83 1 3 21 0
                                    0 70 15 1 2 21 0 0 70 1 2 4 0 0 86 1 3 4 0
                                    0 86 15 1 2 0 18 0 0 1 2 18 0 0 7 1 1 28 0
                                    0 1 2 28 0 0 0 1 2 0 0 0 0 1 2 28 0 20 0 1
                                    2 0 27 27 0 46 2 0 27 0 27 44 2 0 0 7 0 1 2
                                    0 0 0 7 1 2 0 0 15 0 1 2 0 0 0 0 1 2 0 0 87
                                    0 1 1 26 15 0 1)))))
           '|lookupComplete|)) 
