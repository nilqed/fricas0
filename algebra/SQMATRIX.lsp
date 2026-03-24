
(SDEFUN |SQMATRIX;Zero;%;1| ((% (%))) (QREFELT % 10)) 

(SDEFUN |SQMATRIX;One;%;2| ((% (%))) (QREFELT % 13)) 

(SDEFUN |SQMATRIX;characteristic;Nni;3| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 16))) 

(SDEFUN |SQMATRIX;matrix;L%;4| ((|l| (|List| (|List| R))) (% (%)))
        (SPROG
         ((#1=#:G22 NIL) (|j| NIL) (#2=#:G23 NIL) (|r| NIL) (#3=#:G20 NIL)
          (|i| NIL) (#4=#:G21 NIL) (|ll| NIL) (|ans| (|Matrix| R))
          (#5=#:G18 NIL) (#6=#:G19 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |l|) (QREFELT % 6) (QREFELT % 19))
            (|error| "matrix: wrong number of rows"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ll| NIL) (LETT #6# |l|) G190
                    (COND
                     ((OR (ATOM #6#) (PROGN (LETT |ll| (CAR #6#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (LENGTH |ll|) (QREFELT % 6) (QREFELT % 19))
                        (PROGN
                         (LETT #5# (|error| "matrix: wrong number of columns"))
                         (GO #7=#:G10))))))
                    (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #5#))
             (LETT |ans|
                   (MAKE_MATRIX1 (QREFELT % 6) (QREFELT % 6)
                                 (|spadConstant| % 8)))
             (SEQ (LETT |ll| NIL) (LETT #4# |l|) (LETT |i| (PROGN |ans| 1))
                  (LETT #3# (SPADCALL |ans| (QREFELT % 21))) G190
                  (COND
                   ((OR (> |i| #3#) (ATOM #4#)
                        (PROGN (LETT |ll| (CAR #4#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |r| NIL) (LETT #2# |ll|)
                         (LETT |j| (PROGN |ans| 1))
                         (LETT #1# (SPADCALL |ans| (QREFELT % 22))) G190
                         (COND
                          ((OR (> |j| #1#) (ATOM #2#)
                               (PROGN (LETT |r| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ (EXIT (QSETAREF2O |ans| |i| |j| |r| 1 1)))
                         (LETT |j| (PROG1 (+ |j| 1) (LETT #2# (CDR #2#))))
                         (GO G190) G191 (EXIT NIL))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |SQMATRIX;row;%IDp;5|
        ((|x| (%)) (|i| (|Integer|)) (% (|DirectProduct| |ndim| R)))
        (SPADCALL (SPADCALL |x| |i| (QREFELT % 26)) (QREFELT % 28))) 

(SDEFUN |SQMATRIX;column;%IDp;6|
        ((|x| (%)) (|j| (|Integer|)) (% (|DirectProduct| |ndim| R)))
        (SPADCALL (SPADCALL |x| |j| (QREFELT % 30)) (QREFELT % 28))) 

(SDEFUN |SQMATRIX;coerce;%Of;7| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 33))) 

(SDEFUN |SQMATRIX;scalarMatrix;R%;8| ((|r| (R)) (% (%)))
        (SPADCALL (QREFELT % 6) |r| (QREFELT % 35))) 

(SDEFUN |SQMATRIX;diagonalMatrix;L%;9| ((|l| (|List| R)) (% (%)))
        (COND
         ((SPADCALL (LENGTH |l|) (QREFELT % 6) (QREFELT % 19))
          (|error| "diagonalMatrix: wrong number of entries in list"))
         ('T (SPADCALL |l| (QREFELT % 37))))) 

(SDEFUN |SQMATRIX;coerce;%M;10| ((|x| (%)) (% (|Matrix| R)))
        (SPADCALL |x| (QREFELT % 39))) 

(SDEFUN |SQMATRIX;squareMatrix;M%;11| ((|x| (|Matrix| R)) (% (%)))
        (COND
         ((OR (SPADCALL (ANROWS |x|) (QREFELT % 6) (QREFELT % 19))
              (SPADCALL (ANCOLS |x|) (QREFELT % 6) (QREFELT % 19)))
          (|error| "squareMatrix: matrix of bad dimensions"))
         ('T (SPADCALL |x| (QREFELT % 39))))) 

(SDEFUN |SQMATRIX;*;%2Dp;12|
        ((|x| (%)) (|v| #1=(|DirectProduct| |ndim| R)) (% #1#))
        (SPADCALL (SPADCALL |x| (SPADCALL |v| (QREFELT % 42)) (QREFELT % 43))
                  (QREFELT % 28))) 

(SDEFUN |SQMATRIX;*;Dp%Dp;13|
        ((|v| #1=(|DirectProduct| |ndim| R)) (|x| (%)) (% #1#))
        (SPADCALL (SPADCALL (SPADCALL |v| (QREFELT % 42)) |x| (QREFELT % 45))
                  (QREFELT % 28))) 

(SDEFUN |SQMATRIX;determinant;%R;14| ((|x| (%)) (% (R)))
        (SPADCALL |x| (QREFELT % 47))) 

(SDEFUN |SQMATRIX;minordet;%R;15| ((|x| (%)) (% (R)))
        (SPADCALL |x| (QREFELT % 49))) 

(SDEFUN |SQMATRIX;Pfaffian;%R;16| ((|x| (%)) (% (R)))
        (SPADCALL |x| (QREFELT % 51))) 

(SDEFUN |SQMATRIX;rowEchelon;2%;17| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 53))) 

(SDEFUN |SQMATRIX;columnSpace;%L;18|
        ((|x| (%)) (% (|List| (|DirectProduct| |ndim| R))))
        (SPROG ((#1=#:G45 NIL) (|c| NIL) (#2=#:G44 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |c| NIL) (LETT #1# (SPADCALL |x| (QREFELT % 56)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |c| (QREFELT % 28)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SQMATRIX;rank;%Nni;19| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 59))) 

(SDEFUN |SQMATRIX;nullity;%Nni;20| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 61))) 

(SDEFUN |SQMATRIX;nullSpace;%L;21|
        ((|x| (%)) (% (|List| (|DirectProduct| |ndim| R))))
        (SPROG ((#1=#:G52 NIL) (|c| NIL) (#2=#:G51 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |c| NIL) (LETT #1# (SPADCALL |x| (QREFELT % 63)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |c| (QREFELT % 28)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SQMATRIX;recip;%U;22| ((|x| (%)) (% (|Union| % "failed")))
        (SPROG ((|u| (|Union| (|Matrix| R) "failed")))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT % 66)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           ('T (CONS 0 (QCDR |u|)))))))) 

(SDEFUN |SQMATRIX;inverse;%U;23| ((|x| (%)) (% (|Union| % "failed")))
        (SPROG ((|u| (|Union| (|Matrix| R) "failed")))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT % 68)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           ('T (CONS 0 (QCDR |u|)))))))) 

(SDEFUN |SQMATRIX;^;%I%;24| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 70))) 

(SDEFUN |SQMATRIX;recip;%U;25| ((|x| (%)) (% (|Union| % "failed")))
        (SPADCALL |x| (QREFELT % 69))) 

(SDEFUN |SQMATRIX;convert;%If;26| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL
         (LIST (SPADCALL '|squareMatrix| (QREFELT % 74))
               (SPADCALL (SPADCALL |x| (QREFELT % 40)) (QREFELT % 75)))
         (QREFELT % 77))) 

(DECLAIM (NOTINLINE |SquareMatrix;|)) 

(DEFUN |SquareMatrix;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G90 NIL) (#2=#:G92 NIL) (#3=#:G91 NIL) (#4=#:G94 NIL)
    (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|SquareMatrix| DV$1 DV$2))
    (LETT % (GETREFV 100))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #4# (|HasCategory| |#2| '(|Ring|)))
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
                                        (|HasCategory| |#2| '(|OrderedSet|))
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
                                          #4#)
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
                                        (AND #4#
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
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #3# #4#) #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|))))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#2|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#2|)))
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
                                            (AND #4#
                                                 (|HasCategory| |#2|
                                                                '(|Finite|)))
                                            (AND
                                             (|HasCategory| |#2| '(|Finite|))
                                             (|HasCategory| |#2| '(|Ring|)))
                                            (AND
                                             (|HasCategory| |#2| '(|Finite|))
                                             (|HasCategory| |#2|
                                                            '(|SemiRing|))))))))
    (|haddProp| |$ConstructorCache| '|SquareMatrix| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 134217728))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 268435456))
    (AND (|HasCategory| |#2| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 536870912))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 1073741824))
    (AND
     (OR
      (AND #3# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 2147483648))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 (SPADCALL (|spadConstant| % 8) (QREFELT % 9)))
    (COND
     ((|HasCategory| |#2| '(|Monoid|))
      (PROGN
       (QSETREFV % 13 (SPADCALL (|spadConstant| % 12) (QREFELT % 9)))
       (QSETREFV % 14
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |SQMATRIX;One;%;2|) % 14))))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV % 17
                (CONS (|dispatchFunction| |SQMATRIX;characteristic;Nni;3|)
                      %))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 48
                 (CONS (|dispatchFunction| |SQMATRIX;determinant;%R;14|) %))
       (QSETREFV % 50 (CONS (|dispatchFunction| |SQMATRIX;minordet;%R;15|) %))
       (QSETREFV % 52
                 (CONS (|dispatchFunction| |SQMATRIX;Pfaffian;%R;16|) %)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (PROGN
       (QSETREFV % 54
                 (CONS (|dispatchFunction| |SQMATRIX;rowEchelon;2%;17|) %))
       (QSETREFV % 58
                 (CONS (|dispatchFunction| |SQMATRIX;columnSpace;%L;18|) %)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (PROGN
       (QSETREFV % 60 (CONS (|dispatchFunction| |SQMATRIX;rank;%Nni;19|) %))
       (QSETREFV % 62 (CONS (|dispatchFunction| |SQMATRIX;nullity;%Nni;20|) %))
       (QSETREFV % 64 (CONS (|dispatchFunction| |SQMATRIX;nullSpace;%L;21|) %))
       (QSETREFV % 67 (CONS (|dispatchFunction| |SQMATRIX;recip;%U;22|) %)))))
    (COND
     ((|testBitVector| |pv$| 18)
      (PROGN
       (QSETREFV % 69 (CONS (|dispatchFunction| |SQMATRIX;inverse;%U;23|) %))
       (QSETREFV % 71 (CONS (|dispatchFunction| |SQMATRIX;^;%I%;24|) %))
       (QSETREFV % 67 (CONS (|dispatchFunction| |SQMATRIX;recip;%U;25|) %)))))
    (COND
     ((|testBitVector| |pv$| 26)
      (QSETREFV % 78 (CONS (|dispatchFunction| |SQMATRIX;convert;%If;26|) %))))
    %))) 

(DEFUN |SquareMatrix| (&REST #1=#:G95)
  (SPROG NIL
         (PROG (#2=#:G96)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|SquareMatrix|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SquareMatrix;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SquareMatrix|)))))))))) 

(MAKEPROP '|SquareMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Matrix| 7) (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) |SQMATRIX;scalarMatrix;R%;8| 'ZERO
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |SQMATRIX;Zero;%;1|) %))
              (4 . |One|) 'ONE (8 . |One|) (|NonNegativeInteger|)
              (12 . |characteristic|) (16 . |characteristic|) (|Boolean|)
              (20 . ~=) (|Integer|) (26 . |maxRowIndex|) (31 . |maxColIndex|)
              (|List| 36) |SQMATRIX;matrix;L%;4| (|Vector| 7) (36 . |row|)
              (|DirectProduct| (NRTEVAL (QREFELT % 6)) 7)
              (42 . |directProduct|) |SQMATRIX;row;%IDp;5| (47 . |column|)
              |SQMATRIX;column;%IDp;6| (|OutputForm|) (53 . |coerce|)
              |SQMATRIX;coerce;%Of;7| (58 . |scalarMatrix|) (|List| 7)
              (64 . |diagonalMatrix|) |SQMATRIX;diagonalMatrix;L%;9|
              (69 . |copy|) |SQMATRIX;coerce;%M;10|
              |SQMATRIX;squareMatrix;M%;11| (74 . |coerce|) (79 . *)
              |SQMATRIX;*;%2Dp;12| (85 . *) |SQMATRIX;*;Dp%Dp;13|
              (91 . |determinant|) (96 . |determinant|) (101 . |minordet|)
              (106 . |minordet|) (111 . |Pfaffian|) (116 . |Pfaffian|)
              (121 . |rowEchelon|) (126 . |rowEchelon|) (|List| 25)
              (131 . |columnSpace|) (|List| 27) (136 . |columnSpace|)
              (141 . |rank|) (146 . |rank|) (151 . |nullity|) (156 . |nullity|)
              (161 . |nullSpace|) (166 . |nullSpace|) (|Union| % '"failed")
              (171 . |invertIfCan|) (176 . |recip|) (181 . |inverse|)
              (186 . |inverse|) (191 . ^) (197 . ^) (|Symbol|) (|InputForm|)
              (203 . |convert|) (208 . |convert|) (|List| %) (213 . |convert|)
              (218 . |convert|) (|String|) (|PositiveInteger|)
              (|Mapping| 7 7 7) (|Mapping| 7 7) (|Union| 7 '#1="failed")
              (|List| 85) (|Equation| 7) (|Matrix| 20) (|Matrix| %)
              (|Record| (|:| |mat| 86) (|:| |vec| (|Vector| 20))) (|Vector| %)
              (|List| 72) (|List| 15) (|Mapping| 18 7) (|Mapping| 18 7 7)
              (|HashState|) (|SingleInteger|) (|Fraction| 20) (|Union| 96 '#1#)
              (|Union| 20 '#1#) (|Record| (|:| |mat| 5) (|:| |vec| 25)))
           '#(~= 223 |zero?| 229 |transpose| 234 |trace| 239 |symmetric?| 244
              |subtractIfCan| 249 |squareMatrix| 255 |square?| 260 |smaller?|
              265 |size?| 271 |size| 277 |scalarMatrix| 281 |sample| 286
              |rowEchelon| 290 |row| 295 |rightRecip| 301 |rightPower| 306
              |retractIfCan| 318 |retract| 333 |reducedSystem| 348 |recip| 370
              |rank| 375 |random| 380 |qelt| 384 |plenaryPower| 391 |parts| 397
              |opposite?| 402 |one?| 408 |nullity| 413 |nullSpace| 418 |nrows|
              423 |ncols| 428 |more?| 433 |minordet| 439 |minRowIndex| 444
              |minColIndex| 449 |min| 454 |members| 459 |member?| 464
              |maxRowIndex| 470 |maxColIndex| 475 |max| 480 |matrix| 491 |map!|
              496 |map| 502 |lookup| 515 |listOfLists| 520 |less?| 525
              |leftRecip| 531 |leftPower| 536 |latex| 548 |inverse| 553 |index|
              558 |hashUpdate!| 563 |hash| 569 |exquo| 574 |every?| 580 |eval|
              586 |eq?| 612 |enumerate| 618 |empty?| 622 |empty| 627 |elt| 631
              |differentiate| 646 |diagonalProduct| 696 |diagonalMatrix| 701
              |diagonal?| 706 |diagonal| 711 |determinant| 716 |count| 721
              |copy| 733 |convert| 738 |commutator| 743 |columnSpace| 749
              |column| 754 |coerce| 760 |characteristic| 785 |associator| 789
              |any?| 796 |antisymmetric?| 802 |antiCommutator| 807
              |annihilate?| 813 ^ 819 |Zero| 837 |Pfaffian| 841 |One| 846 D 850
              = 900 / 906 - 912 + 923 * 929 |#| 983)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 4 6 5 1 7 7 1 3 0 4 1 0 24 4 4 0 0 7 24 0 0
                                  0 0 2 3 3 2 8 3 0 0 0 8 0 0 0 0 10 9 17 8 0 0
                                  0 11 27 10 9 17 0 0 0 0 0 0 0))
            (CONS
             '#(|SquareMatrixCategory&| |DifferentialExtension&|
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&| NIL
                |Rng&| |NonAssociativeAlgebra&| NIL
                |RectangularMatrixCategory&| |FullyLinearlyExplicitOver&|
                |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL NIL |AbelianGroup&| NIL
                NIL NIL |Finite&| |MagmaWithUnit&| NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| NIL |AbelianSemiGroup&| |Magma&|
                |HomogeneousAggregate&| |FullyRetractableTo&| |RetractableTo&|
                |RetractableTo&| |Evalable&| |Hashable&| |SetCategory&|
                |Aggregate&| |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                NIL |BasicType&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|SquareMatrixCategory| 6 7 (|DirectProduct| 6 7)
                                         (|DirectProduct| 6 7))
                 (|DifferentialExtension| 7) (|DifferentialRing|)
                 (|PartialDifferentialRing| 72) (|Algebra| 7) (|Ring|) (|Rng|)
                 (|NonAssociativeAlgebra| 7) (|SemiRing|)
                 (|RectangularMatrixCategory| 6 6 7 (|DirectProduct| 6 7)
                                              (|DirectProduct| 6 7))
                 (|FullyLinearlyExplicitOver| 7) (|Module| 7) (|SemiRng|)
                 (|LinearlyExplicitOver| 20) (|LinearlyExplicitOver| 7)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 7 7)
                 (|NonAssociativeRng|) (|RightModule| 20) (|LeftModule| $$)
                 (|RightModule| $$) (|RightModule| 7) (|LeftModule| 7)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|Finite|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|HomogeneousAggregate| 7) (|FullyRetractableTo| 7)
                 (|RetractableTo| 20) (|RetractableTo| 96) (|Evalable| 7)
                 (|Hashable|) (|SetCategory|) (|Aggregate|) (|RetractableTo| 7)
                 (|unitsKnown|) (|ConvertibleTo| 73) (|CoercibleFrom| 20)
                 (|CoercibleFrom| 96) (|InnerEvalable| 7 7) (|CoercibleTo| 32)
                 (|BasicType|) (|TwoSidedRecip|) (|Type|) (|finiteAggregate|)
                 (|CoercibleFrom| 7) (|CoercibleTo| (|Matrix| 7)))
              (|makeByteWordVec2| 99
                                  '(0 7 0 8 0 7 0 12 0 0 0 14 0 7 15 16 0 0 15
                                    17 2 15 18 0 0 19 1 5 20 0 21 1 5 20 0 22 2
                                    5 25 0 20 26 1 27 0 25 28 2 5 25 0 20 30 1
                                    5 32 0 33 2 5 0 15 7 35 1 5 0 36 37 1 5 0 0
                                    39 1 27 25 0 42 2 5 25 0 25 43 2 5 25 25 0
                                    45 1 5 7 0 47 1 0 7 0 48 1 5 7 0 49 1 0 7 0
                                    50 1 5 7 0 51 1 0 7 0 52 1 5 0 0 53 1 0 0 0
                                    54 1 5 55 0 56 1 0 57 0 58 1 5 15 0 59 1 0
                                    15 0 60 1 5 15 0 61 1 0 15 0 62 1 5 55 0 63
                                    1 0 57 0 64 1 5 65 0 66 1 0 65 0 67 1 5 65
                                    0 68 1 0 65 0 69 2 5 0 0 20 70 2 0 0 0 20
                                    71 1 73 0 72 74 1 5 73 0 75 1 73 0 76 77 1
                                    0 73 0 78 2 0 18 0 0 1 1 0 18 0 1 1 0 0 0 1
                                    1 0 7 0 1 1 0 18 0 1 2 32 65 0 0 1 1 0 0 5
                                    41 1 0 18 0 1 2 8 18 0 0 1 2 0 18 0 15 1 0
                                    8 15 1 1 0 0 7 9 0 0 0 1 1 12 0 0 54 2 0 27
                                    0 20 29 1 3 65 0 1 2 0 0 0 80 1 2 3 0 0 15
                                    1 1 0 83 0 1 1 9 97 0 1 1 10 98 0 1 1 0 7 0
                                    1 1 9 96 0 1 1 10 20 0 1 1 23 86 87 1 2 23
                                    88 87 89 1 2 4 99 87 89 1 1 4 5 87 1 1 3 65
                                    0 67 1 13 15 0 60 0 8 0 1 3 0 7 0 20 20 1 2
                                    1 0 0 80 1 1 29 36 0 1 2 0 18 0 0 1 1 3 18
                                    0 1 1 13 15 0 62 1 13 57 0 64 1 0 15 0 1 1
                                    0 15 0 1 2 0 18 0 15 1 1 1 7 0 50 1 0 20 0
                                    1 1 0 20 0 1 1 30 7 0 1 1 29 36 0 1 2 31 18
                                    7 0 1 1 0 20 0 1 1 0 20 0 1 1 30 7 0 1 2 29
                                    7 93 0 1 1 0 0 23 24 2 28 0 82 0 1 3 0 0 81
                                    0 0 1 2 0 0 82 0 1 1 8 80 0 1 1 0 23 0 1 2
                                    0 18 0 15 1 1 3 65 0 1 2 0 0 0 80 1 2 3 0 0
                                    15 1 1 0 79 0 1 1 18 65 0 69 1 8 0 80 1 2 8
                                    94 94 0 1 1 8 95 0 1 2 13 65 0 7 1 2 29 18
                                    92 0 1 2 16 0 0 84 1 3 16 0 0 7 7 1 2 16 0
                                    0 85 1 3 16 0 0 36 36 1 2 0 18 0 0 1 0 8 76
                                    1 1 0 18 0 1 0 0 0 1 4 0 7 0 20 20 7 1 3 0
                                    7 0 20 20 1 1 19 0 0 1 2 19 0 0 15 1 2 20 0
                                    0 72 1 2 20 0 0 90 1 3 20 0 0 90 91 1 3 20
                                    0 0 72 15 1 2 4 0 0 82 1 3 4 0 0 82 15 1 1
                                    0 7 0 1 1 0 0 36 38 1 0 18 0 1 1 0 27 0 1 1
                                    1 7 0 48 2 31 15 7 0 1 2 29 15 92 0 1 1 0 0
                                    0 1 1 26 73 0 78 2 4 0 0 0 1 1 12 57 0 58 2
                                    0 27 0 20 31 1 0 32 0 34 1 0 0 7 1 1 0 5 0
                                    40 1 21 0 20 1 1 9 0 96 1 0 4 15 17 3 4 0 0
                                    0 0 1 2 29 18 92 0 1 1 0 18 0 1 2 0 0 0 0 1
                                    2 4 18 0 0 1 2 0 0 0 80 1 2 18 0 0 20 71 2
                                    3 0 0 15 1 0 0 0 11 1 1 7 0 52 0 3 0 14 1
                                    19 0 0 1 2 19 0 0 15 1 2 20 0 0 90 1 2 20 0
                                    0 72 1 3 20 0 0 90 91 1 3 20 0 0 72 15 1 2
                                    4 0 0 82 1 3 4 0 0 82 15 1 2 0 18 0 0 1 2
                                    18 0 0 7 1 2 32 0 0 0 1 1 32 0 0 1 2 0 0 0
                                    0 1 2 0 0 80 0 1 2 0 0 0 0 1 2 0 0 15 0 1 2
                                    0 0 7 0 1 2 0 0 0 7 1 2 0 27 0 27 44 2 0 27
                                    27 0 46 2 23 0 0 20 1 2 32 0 20 0 1 1 29 15
                                    0 1)))))
           '|lookupComplete|)) 
