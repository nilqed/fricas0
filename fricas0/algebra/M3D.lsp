
(SDEFUN |M3D;matrixConcat3D;S3$;1|
        ((|dir| |Symbol|) (|mat1| $) (|mat2| $) ($ $))
        (SPROG
         ((|retVal| ($)) (#1=#:G738 NIL) (|j| NIL)
          (|temp| (|PrimitiveArray| (|PrimitiveArray| R))) (#2=#:G737 NIL)
          (|i| NIL) (#3=#:G736 NIL)
          (|matRep2|
           #4=(|PrimitiveArray| (|PrimitiveArray| (|PrimitiveArray| R))))
          (|matRep1| #4#) (|kDim2| #5=(|NonNegativeInteger|)) (|jDim2| #5#)
          (|iDim2| #5#) (|kDim1| #5#) (|jDim1| #5#) (|iDim1| #5#)
          (|mat2Dim| #6=(|Vector| (|NonNegativeInteger|))) (|mat1Dim| #6#))
         (SEQ
          (COND
           ((NULL (EQUAL |dir| '|i|))
            (COND
             ((NULL (EQUAL |dir| '|j|))
              (COND
               ((NULL (EQUAL |dir| '|k|))
                (EXIT
                 (|error| "the axis of concatenation must be i,j or k"))))))))
          (LETT |mat1Dim| (SPADCALL |mat1| (QREFELT $ 8))
                . #7=(|M3D;matrixConcat3D;S3$;1|))
          (LETT |mat2Dim| (SPADCALL |mat2| (QREFELT $ 8)) . #7#)
          (LETT |iDim1| (SPADCALL |mat1Dim| 1 (QREFELT $ 11)) . #7#)
          (LETT |jDim1| (SPADCALL |mat1Dim| 2 (QREFELT $ 11)) . #7#)
          (LETT |kDim1| (SPADCALL |mat1Dim| 3 (QREFELT $ 11)) . #7#)
          (LETT |iDim2| (SPADCALL |mat2Dim| 1 (QREFELT $ 11)) . #7#)
          (LETT |jDim2| (SPADCALL |mat2Dim| 2 (QREFELT $ 11)) . #7#)
          (LETT |kDim2| (SPADCALL |mat2Dim| 3 (QREFELT $ 11)) . #7#)
          (LETT |matRep1|
                (SPADCALL (SPADCALL |mat1| (QREFELT $ 12)) (QREFELT $ 13))
                . #7#)
          (LETT |matRep2|
                (SPADCALL (SPADCALL |mat2| (QREFELT $ 12)) (QREFELT $ 13))
                . #7#)
          (COND
           ((EQUAL |dir| '|i|)
            (COND
             ((EQL |jDim1| |jDim2|)
              (COND
               ((EQL |kDim1| |kDim2|)
                (LETT |retVal|
                      (SPADCALL (SPADCALL |matRep1| |matRep2| (QREFELT $ 14))
                                (QREFELT $ 15))
                      . #7#))
               (#8='T (|error| #9="jxk do not agree"))))
             (#8# (|error| #9#)))))
          (COND
           ((EQUAL |dir| '|j|)
            (COND
             ((EQL |iDim1| |iDim2|)
              (COND
               ((EQL |kDim1| |kDim2|)
                (SEQ
                 (SEQ (LETT |i| 0 . #7#) (LETT #3# (- |iDim1| 1) . #7#) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1 |matRep1| |i|
                                   (SPADCALL (QAREF1 |matRep1| |i|)
                                             (QAREF1 |matRep2| |i|)
                                             (QREFELT $ 17)))))
                      (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                      (EXIT NIL))
                 (EXIT
                  (LETT |retVal| (SPADCALL |matRep1| (QREFELT $ 15)) . #7#))))
               (#8# (|error| #10="ixk do not agree"))))
             (#8# (|error| #10#)))))
          (COND
           ((EQUAL |dir| '|k|)
            (COND
             ((EQL |iDim1| |iDim2|)
              (COND
               ((EQL |jDim1| |jDim2|)
                (SEQ
                 (SEQ (LETT |i| 0 . #7#) (LETT #2# (- |iDim1| 1) . #7#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (LETT |temp|
                             (SPADCALL (QAREF1 |matRep1| |i|) (QREFELT $ 18))
                             . #7#)
                       (SEQ (LETT |j| 0 . #7#) (LETT #1# (- |jDim1| 1) . #7#)
                            G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF1 |temp| |j|
                                         (SPADCALL
                                          (QAREF1 (QAREF1 |matRep1| |i|) |j|)
                                          (QAREF1 (QAREF1 |matRep2| |i|) |j|)
                                          (QREFELT $ 20)))))
                            (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (QSETAREF1 |matRep1| |i| |temp|)))
                      (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                      (EXIT NIL))
                 (EXIT
                  (LETT |retVal| (SPADCALL |matRep1| (QREFELT $ 15)) . #7#))))
               (#8# (|error| #11="ixj do not agree"))))
             (#8# (|error| #11#)))))
          (EXIT |retVal|)))) 

(SDEFUN |M3D;matrixDimensions;$V;2|
        ((|mat| $) ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((|retVal| (|Vector| (|NonNegativeInteger|)))
          (|kDim| (|NonNegativeInteger|)) (|matRep3| (|PrimitiveArray| R))
          (|jDim| (|NonNegativeInteger|))
          (|matRep2| (|PrimitiveArray| (|PrimitiveArray| R)))
          (|iDim| (|NonNegativeInteger|))
          (|matRep|
           (|PrimitiveArray| (|PrimitiveArray| (|PrimitiveArray| R)))))
         (SEQ
          (LETT |matRep| (SPADCALL |mat| (QREFELT $ 12))
                . #1=(|M3D;matrixDimensions;$V;2|))
          (LETT |iDim| (QVSIZE |matRep|) . #1#)
          (LETT |matRep2| (QAREF1 |matRep| 0) . #1#)
          (LETT |jDim| (QVSIZE |matRep2|) . #1#)
          (LETT |matRep3| (QAREF1 |matRep2| 0) . #1#)
          (LETT |kDim| (QVSIZE |matRep3|) . #1#)
          (LETT |retVal| (SPADCALL 3 0 (QREFELT $ 23)) . #1#)
          (SPADCALL |retVal| 1 |iDim| (QREFELT $ 24))
          (SPADCALL |retVal| 2 |jDim| (QREFELT $ 24))
          (SPADCALL |retVal| 3 |kDim| (QREFELT $ 24)) (EXIT |retVal|)))) 

(PUT '|M3D;coerce;Pa$;3| '|SPADreplace| '(XLAM (|matrixRep|) |matrixRep|)) 

(SDEFUN |M3D;coerce;Pa$;3|
        ((|matrixRep| |PrimitiveArray| (|PrimitiveArray| (|PrimitiveArray| R)))
         ($ $))
        |matrixRep|) 

(PUT '|M3D;coerce;$Pa;4| '|SPADreplace| '(XLAM (|mat|) |mat|)) 

(SDEFUN |M3D;coerce;$Pa;4|
        ((|mat| $)
         ($ |PrimitiveArray| (|PrimitiveArray| (|PrimitiveArray| R))))
        |mat|) 

(SDEFUN |M3D;elt;$3NniR;5|
        ((|mat| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|k| |NonNegativeInteger|) ($ R))
        (SPROG
         ((|matrixRep|
           (|PrimitiveArray| (|PrimitiveArray| (|PrimitiveArray| R))))
          (|kLength| #1=(|NonNegativeInteger|)) (|jLength| #1#) (|iLength| #1#)
          (|matDims| (|Vector| (|NonNegativeInteger|))))
         (SEQ
          (LETT |matDims| (SPADCALL |mat| (QREFELT $ 8))
                . #2=(|M3D;elt;$3NniR;5|))
          (LETT |iLength| (SPADCALL |matDims| 1 (QREFELT $ 11)) . #2#)
          (LETT |jLength| (SPADCALL |matDims| 2 (QREFELT $ 11)) . #2#)
          (LETT |kLength| (SPADCALL |matDims| 3 (QREFELT $ 11)) . #2#)
          (COND
           ((OR
             (OR
              (OR
               (OR
                (OR (SPADCALL |i| |iLength| (QREFELT $ 26))
                    (SPADCALL |j| |jLength| (QREFELT $ 26)))
                (SPADCALL |k| |kLength| (QREFELT $ 26)))
               (EQL |i| 0))
              (EQL |j| 0))
             (EQL |k| 0))
            (EXIT
             (|error| "coordinates must be within the bounds of the matrix"))))
          (LETT |matrixRep| (SPADCALL |mat| (QREFELT $ 12)) . #2#)
          (EXIT
           (QAREF1 (QAREF1 (QAREF1 |matrixRep| (- |i| 1)) (- |j| 1))
                   (- |k| 1)))))) 

(SDEFUN |M3D;setelt!;$3Nni2R;6|
        ((|mat| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|k| |NonNegativeInteger|) (|val| R) ($ R))
        (SPROG
         ((|row1| (|PrimitiveArray| R))
          (|row2| (|PrimitiveArray| (|PrimitiveArray| R)))
          (|matrixRep|
           (|PrimitiveArray| (|PrimitiveArray| (|PrimitiveArray| R))))
          (|kLength| #1=(|NonNegativeInteger|)) (|jLength| #1#) (|iLength| #1#)
          (|matDims| (|Vector| (|NonNegativeInteger|))))
         (SEQ
          (LETT |matDims| (SPADCALL |mat| (QREFELT $ 8))
                . #2=(|M3D;setelt!;$3Nni2R;6|))
          (LETT |iLength| (SPADCALL |matDims| 1 (QREFELT $ 11)) . #2#)
          (LETT |jLength| (SPADCALL |matDims| 2 (QREFELT $ 11)) . #2#)
          (LETT |kLength| (SPADCALL |matDims| 3 (QREFELT $ 11)) . #2#)
          (COND
           ((OR
             (OR
              (OR
               (OR
                (OR (SPADCALL |i| |iLength| (QREFELT $ 26))
                    (SPADCALL |j| |jLength| (QREFELT $ 26)))
                (SPADCALL |k| |kLength| (QREFELT $ 26)))
               (EQL |i| 0))
              (EQL |j| 0))
             (EQL |k| 0))
            (EXIT
             (|error| "coordinates must be within the bounds of the matrix"))))
          (LETT |matrixRep| (SPADCALL |mat| (QREFELT $ 12)) . #2#)
          (LETT |row2| (SPADCALL (QAREF1 |matrixRep| (- |i| 1)) (QREFELT $ 18))
                . #2#)
          (LETT |row1| (SPADCALL (QAREF1 |row2| (- |j| 1)) (QREFELT $ 28))
                . #2#)
          (QSETAREF1 |row1| (- |k| 1) |val|)
          (QSETAREF1 |row2| (- |j| 1) |row1|)
          (QSETAREF1 |matrixRep| (- |i| 1) |row2|) (EXIT |val|)))) 

(SDEFUN |M3D;zeroMatrix;3Nni$;7|
        ((|iLength| |NonNegativeInteger|) (|jLength| |NonNegativeInteger|)
         (|kLength| |NonNegativeInteger|) ($ $))
        (SPADCALL
         (MAKEARR1 |iLength|
                   (MAKEARR1 |jLength|
                             (MAKEARR1 |kLength| (|spadConstant| $ 30))))
         (QREFELT $ 15))) 

(SDEFUN |M3D;identityMatrix;Nni$;8| ((|iLength| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|row2| (|PrimitiveArray| (|PrimitiveArray| R)))
          (|row1| (|PrimitiveArray| R)) (#1=#:G752 NIL) (|count| NIL)
          (|row2empty| (|PrimitiveArray| (|PrimitiveArray| R)))
          (|row1empty| (|PrimitiveArray| R))
          (|retValueRep|
           (|PrimitiveArray| (|PrimitiveArray| (|PrimitiveArray| R)))))
         (SEQ
          (LETT |retValueRep|
                (SPADCALL
                 (SPADCALL |iLength| |iLength| |iLength| (QREFELT $ 31))
                 (QREFELT $ 12))
                . #2=(|M3D;identityMatrix;Nni$;8|))
          (LETT |row1empty| (MAKEARR1 |iLength| (|spadConstant| $ 30)) . #2#)
          (LETT |row2empty|
                (MAKEARR1 |iLength| (SPADCALL |row1empty| (QREFELT $ 28)))
                . #2#)
          (SEQ (LETT |count| 0 . #2#) (LETT #1# (- |iLength| 1) . #2#) G190
               (COND ((|greater_SI| |count| #1#) (GO G191)))
               (SEQ (LETT |row1| (SPADCALL |row1empty| (QREFELT $ 28)) . #2#)
                    (QSETAREF1 |row1| |count| (|spadConstant| $ 32))
                    (LETT |row2| (SPADCALL |row2empty| (QREFELT $ 18)) . #2#)
                    (QSETAREF1 |row2| |count| (SPADCALL |row1| (QREFELT $ 28)))
                    (EXIT
                     (QSETAREF1 |retValueRep| |count|
                                (SPADCALL |row2| (QREFELT $ 18)))))
               (LETT |count| (|inc_SI| |count|) . #2#) (GO G190) G191
               (EXIT NIL))
          (EXIT (SPADCALL |retValueRep| (QREFELT $ 15)))))) 

(SDEFUN |M3D;plus;3$;9| ((|mat1| $) (|mat2| $) ($ $))
        (SPROG
         ((|resultMatrix| ($)) (|sum| (R)) (#1=#:G763 NIL) (|k| NIL)
          (#2=#:G762 NIL) (|j| NIL) (#3=#:G761 NIL) (|i| NIL)
          (|row3| (|PrimitiveArray| (|PrimitiveArray| (|PrimitiveArray| R))))
          (|row2| (|PrimitiveArray| (|PrimitiveArray| R)))
          (|row1| (|PrimitiveArray| R)) (|kLength2| #4=(|NonNegativeInteger|))
          (|jLength2| #4#) (|iLength2| #4#)
          (|mat2Dims| #5=(|Vector| (|NonNegativeInteger|))) (|kLength1| #4#)
          (|jLength1| #4#) (|iLength1| #4#) (|mat1Dims| #5#))
         (SEQ
          (LETT |mat1Dims| (SPADCALL |mat1| (QREFELT $ 8))
                . #6=(|M3D;plus;3$;9|))
          (LETT |iLength1| (SPADCALL |mat1Dims| 1 (QREFELT $ 11)) . #6#)
          (LETT |jLength1| (SPADCALL |mat1Dims| 2 (QREFELT $ 11)) . #6#)
          (LETT |kLength1| (SPADCALL |mat1Dims| 3 (QREFELT $ 11)) . #6#)
          (LETT |mat2Dims| (SPADCALL |mat2| (QREFELT $ 8)) . #6#)
          (LETT |iLength2| (SPADCALL |mat2Dims| 1 (QREFELT $ 11)) . #6#)
          (LETT |jLength2| (SPADCALL |mat2Dims| 2 (QREFELT $ 11)) . #6#)
          (LETT |kLength2| (SPADCALL |mat2Dims| 3 (QREFELT $ 11)) . #6#)
          (COND
           ((EQL |iLength1| |iLength2|)
            (COND
             ((EQL |jLength1| |jLength2|)
              (COND
               ((NULL (EQL |kLength1| |kLength2|))
                (EXIT (|error| #7="error the matrices are different sizes")))))
             (#8='T (EXIT (|error| #7#)))))
           (#8# (EXIT (|error| #7#))))
          (LETT |row1| (MAKEARR1 |kLength1| (|spadConstant| $ 30)) . #6#)
          (LETT |row2| (MAKEARR1 |jLength1| (SPADCALL |row1| (QREFELT $ 28)))
                . #6#)
          (LETT |row3| (MAKEARR1 |iLength1| (SPADCALL |row2| (QREFELT $ 18)))
                . #6#)
          (SEQ (LETT |i| 1 . #6#) (LETT #3# |iLength1| . #6#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| 1 . #6#) (LETT #2# |jLength1| . #6#) G190
                     (COND ((|greater_SI| |j| #2#) (GO G191)))
                     (SEQ
                      (SEQ (LETT |k| 1 . #6#) (LETT #1# |kLength1| . #6#) G190
                           (COND ((|greater_SI| |k| #1#) (GO G191)))
                           (SEQ
                            (LETT |sum|
                                  (SPADCALL
                                   (SPADCALL |mat1| |i| |j| |k| (QREFELT $ 27))
                                   (SPADCALL |mat2| |i| |j| |k| (QREFELT $ 27))
                                   (QREFELT $ 34))
                                  . #6#)
                            (EXIT (QSETAREF1 |row1| (- |k| 1) |sum|)))
                           (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (QSETAREF1 |row2| (- |j| 1)
                                  (SPADCALL |row1| (QREFELT $ 28)))))
                     (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (QSETAREF1 |row3| (- |i| 1)
                            (SPADCALL |row2| (QREFELT $ 18)))))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |resultMatrix| |row3| . #6#) (EXIT |resultMatrix|)))) 

(SDEFUN |M3D;construct;L$;10| ((|listRep| |List| (|List| (|List| R))) ($ $))
        (SPROG
         ((|resultMatrix| ($)) (|element| (R)) (#1=#:G793 NIL) (|k| NIL)
          (#2=#:G792 NIL) (|j| NIL) (#3=#:G791 NIL) (|i| NIL)
          (|row3| (|PrimitiveArray| (|PrimitiveArray| (|PrimitiveArray| R))))
          (|row2| (|PrimitiveArray| (|PrimitiveArray| R)))
          (|row1| (|PrimitiveArray| R)) (#4=#:G788 NIL) (#5=#:G790 NIL)
          (|subSubList| NIL) (#6=#:G789 NIL) (|subList| NIL)
          (|kLength| (|NonNegativeInteger|)) (|jLength| (|NonNegativeInteger|))
          (|iLength| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (EQL (LENGTH |listRep|) 0)
                (OR (EQL (LENGTH (SPADCALL |listRep| 1 (QREFELT $ 38))) 0)
                    (EQL
                     (LENGTH
                      (SPADCALL (SPADCALL |listRep| 1 (QREFELT $ 38)) 1
                                (QREFELT $ 40)))
                     0)))
            (|error| "empty list"))
           ('T
            (SEQ
             (LETT |iLength| (LENGTH |listRep|) . #7=(|M3D;construct;L$;10|))
             (LETT |jLength| (LENGTH (SPADCALL |listRep| 1 (QREFELT $ 38)))
                   . #7#)
             (LETT |kLength|
                   (LENGTH
                    (SPADCALL (SPADCALL |listRep| 1 (QREFELT $ 38)) 1
                              (QREFELT $ 40)))
                   . #7#)
             (SEQ (LETT |subList| NIL . #7#) (LETT #6# |listRep| . #7#) G190
                  (COND
                   ((OR (ATOM #6#)
                        (PROGN (LETT |subList| (CAR #6#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((NULL (EQL (LENGTH |subList|) |jLength|))
                      (|error| "can not have an irregular shaped matrix"))
                     ('T
                      (SEQ
                       (EXIT
                        (SEQ (LETT |subSubList| NIL . #7#)
                             (LETT #5# |subList| . #7#) G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN
                                    (LETT |subSubList| (CAR #5#) . #7#)
                                    NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (EQL (LENGTH |subSubList|) |kLength|))
                                 (PROGN
                                  (LETT #4#
                                        (|error|
                                         "can not have an irregular shaped matrix")
                                        . #7#)
                                  (GO #8=#:G774))))))
                             (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                             (EXIT NIL)))
                       #8# (EXIT #4#))))))
                  (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
             (LETT |row1|
                   (MAKEARR1 |kLength|
                             (SPADCALL
                              (SPADCALL (SPADCALL |listRep| 1 (QREFELT $ 38)) 1
                                        (QREFELT $ 40))
                              1 (QREFELT $ 41)))
                   . #7#)
             (LETT |row2| (MAKEARR1 |jLength| (SPADCALL |row1| (QREFELT $ 28)))
                   . #7#)
             (LETT |row3| (MAKEARR1 |iLength| (SPADCALL |row2| (QREFELT $ 18)))
                   . #7#)
             (SEQ (LETT |i| 1 . #7#) (LETT #3# |iLength| . #7#) G190
                  (COND ((|greater_SI| |i| #3#) (GO G191)))
                  (SEQ
                   (SEQ (LETT |j| 1 . #7#) (LETT #2# |jLength| . #7#) G190
                        (COND ((|greater_SI| |j| #2#) (GO G191)))
                        (SEQ
                         (SEQ (LETT |k| 1 . #7#) (LETT #1# |kLength| . #7#)
                              G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
                              (SEQ
                               (LETT |element|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |listRep| |i| (QREFELT $ 38))
                                       |j| (QREFELT $ 40))
                                      |k| (QREFELT $ 41))
                                     . #7#)
                               (EXIT (QSETAREF1 |row1| (- |k| 1) |element|)))
                              (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (QSETAREF1 |row2| (- |j| 1)
                                     (SPADCALL |row1| (QREFELT $ 28)))))
                        (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT
                    (QSETAREF1 |row3| (- |i| 1)
                               (SPADCALL |row2| (QREFELT $ 18)))))
                  (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
             (LETT |resultMatrix| |row3| . #7#) (EXIT |resultMatrix|))))))) 

(DECLAIM (NOTINLINE |ThreeDimensionalMatrix;|)) 

(DEFUN |ThreeDimensionalMatrix| (#1=#:G798)
  (SPROG NIL
         (PROG (#2=#:G799)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ThreeDimensionalMatrix|)
                                               '|domainEqualList|)
                    . #3=(|ThreeDimensionalMatrix|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ThreeDimensionalMatrix;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ThreeDimensionalMatrix|)))))))))) 

(DEFUN |ThreeDimensionalMatrix;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G796 NIL) (#2=#:G797 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|ThreeDimensionalMatrix|))
    (LETT |dv$| (LIST '|ThreeDimensionalMatrix| DV$1) . #3#)
    (LETT $ (GETREFV 51) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|SetCategory|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         (|HasCategory| |#1| '(|SetCategory|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #3#)
                                        (OR #2#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             (|HasCategory| |#1|
                                                            '(|SetCategory|))))
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #3#)
                                        (OR
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
                                          (|HasCategory| |#1|
                                                         '(|SetCategory|))))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|ThreeDimensionalMatrix| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 128))
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 256))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 512))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      (|HasCategory| |#1| '(|SetCategory|)))
     (|augmentPredVector| $ 1024))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 6)
      (PROGN
       (QSETREFV $ 31 (CONS (|dispatchFunction| |M3D;zeroMatrix;3Nni$;7|) $))
       (QSETREFV $ 33
                 (CONS (|dispatchFunction| |M3D;identityMatrix;Nni$;8|) $))
       (QSETREFV $ 35 (CONS (|dispatchFunction| |M3D;plus;3$;9|) $)))))
    $))) 

(MAKEPROP '|ThreeDimensionalMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PrimitiveArray| 16) (|local| |#1|)
              (|Vector| 9) |M3D;matrixDimensions;$V;2| (|NonNegativeInteger|)
              (|Integer|) (0 . |elt|) |M3D;coerce;$Pa;4| (6 . |copy|)
              (11 . |concat|) |M3D;coerce;Pa$;3| (|PrimitiveArray| 19)
              (17 . |concat|) (23 . |copy|) (|PrimitiveArray| 6)
              (28 . |concat|) (|Symbol|) |M3D;matrixConcat3D;S3$;1|
              (34 . |new|) (40 . |setelt!|) (|Boolean|) (47 . >)
              |M3D;elt;$3NniR;5| (53 . |copy|) |M3D;setelt!;$3Nni2R;6|
              (58 . |Zero|) (62 . |zeroMatrix|) (69 . |One|)
              (73 . |identityMatrix|) (78 . +) (84 . |plus|) (|List| 39)
              (|List| 36) (90 . |elt|) (|List| 6) (96 . |elt|) (102 . |elt|)
              |M3D;construct;L$;10| (|Equation| 6) (|List| 43) (|Mapping| 25 6)
              (|Mapping| 6 6) (|OutputForm|) (|SingleInteger|) (|String|)
              (|HashState|))
           '#(~= 108 |zeroMatrix| 114 |size?| 121 |setelt!| 127 |sample| 136
              |plus| 140 |parts| 146 |more?| 151 |members| 157 |member?| 162
              |matrixDimensions| 168 |matrixConcat3D| 173 |map!| 180 |map| 186
              |less?| 192 |latex| 198 |identityMatrix| 203 |hashUpdate!| 208
              |hash| 214 |every?| 219 |eval| 225 |eq?| 251 |empty?| 257 |empty|
              262 |elt| 266 |count| 274 |copy| 286 |construct| 291 |coerce| 296
              |any?| 311 = 317 |#| 323)
           'NIL
           (CONS (|makeByteWordVec2| 7 '(0 0 7 1 0 7 1 5))
                 (CONS
                  '#(|HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL |InnerEvalable&| |BasicType&| NIL)
                  (CONS
                   '#((|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|InnerEvalable| 6 6)
                      (|BasicType|) (|CoercibleTo| 47))
                   (|makeByteWordVec2| 50
                                       '(2 7 9 0 10 11 1 5 0 0 13 2 5 0 0 0 14
                                         2 16 0 0 0 17 1 16 0 0 18 2 19 0 0 0
                                         20 2 7 0 9 9 23 3 7 9 0 10 9 24 2 9 25
                                         0 0 26 1 19 0 0 28 0 6 0 30 3 0 0 9 9
                                         9 31 0 6 0 32 1 0 0 9 33 2 6 0 0 0 34
                                         2 0 0 0 0 35 2 37 36 0 10 38 2 36 39 0
                                         10 40 2 39 6 0 10 41 2 11 25 0 0 1 3 6
                                         0 9 9 9 31 2 0 25 0 9 1 5 0 6 0 9 9 9
                                         6 29 0 0 0 1 2 6 0 0 0 35 1 9 39 0 1 2
                                         0 25 0 9 1 1 9 39 0 1 2 10 25 6 0 1 1
                                         0 7 0 8 3 0 0 21 0 0 22 2 8 0 46 0 1 2
                                         0 0 46 0 1 2 0 25 0 9 1 1 1 49 0 1 1 6
                                         0 9 33 2 1 50 50 0 1 1 1 48 0 1 2 9 25
                                         45 0 1 3 3 0 0 39 39 1 2 3 0 0 43 1 3
                                         3 0 0 6 6 1 2 3 0 0 44 1 2 0 25 0 0 1
                                         1 0 25 0 1 0 0 0 1 4 0 6 0 9 9 9 27 2
                                         10 9 6 0 1 2 9 9 45 0 1 1 0 0 0 1 1 0
                                         0 37 42 1 4 47 0 1 1 0 0 5 15 1 0 5 0
                                         12 2 9 25 45 0 1 2 11 25 0 0 1 1 9 9 0
                                         1)))))
           '|lookupComplete|)) 
