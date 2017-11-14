
(PUT '|MATSTOR;rep| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |MATSTOR;rep|
        ((|m| |Matrix| R) ($ |PrimitiveArray| (|PrimitiveArray| R))) |m|) 

(SDEFUN |MATSTOR;copy!;3M;2| ((|c| |Matrix| R) (|a| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((#1=#:G733 NIL) (|j| NIL) (|cRow| #2=(|PrimitiveArray| R))
          (|aRow| #2#) (#3=#:G732 NIL) (|i| NIL)
          (|cc| #4=(|PrimitiveArray| (|PrimitiveArray| R))) (|aa| #4#)
          (|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (ANROWS |a|) . #5=(|MATSTOR;copy!;3M;2|))
              (LETT |n| (ANCOLS |a|) . #5#)
              (COND
               ((EQL (ANROWS |c|) |m|)
                (COND
                 ((NULL (EQL (ANCOLS |c|) |n|))
                  (EXIT
                   (|error|
                    #6="copy!: matrices of incompatible dimensions")))))
               ('T (EXIT (|error| #6#))))
              (LETT |aa| (|MATSTOR;rep| |a| $) . #5#)
              (LETT |cc| (|MATSTOR;rep| |c| $) . #5#)
              (SEQ (LETT |i| 0 . #5#) (LETT #3# (- |m| 1) . #5#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #5#)
                        (LETT |cRow| (QAREF1 |cc| |i|) . #5#)
                        (EXIT
                         (SEQ (LETT |j| 0 . #5#) (LETT #1# (- |n| 1) . #5#)
                              G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (QSETAREF1 |cRow| |j| (QAREF1 |aRow| |j|))))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |c|)))) 

(SDEFUN |MATSTOR;plus!;4M;3|
        ((|c| |Matrix| R) (|a| |Matrix| R) (|b| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((#1=#:G744 NIL) (|j| NIL) (|cRow| #2=(|PrimitiveArray| R))
          (|bRow| #2#) (|aRow| #2#) (#3=#:G743 NIL) (|i| NIL)
          (|cc| #4=(|PrimitiveArray| (|PrimitiveArray| R))) (|bb| #4#)
          (|aa| #4#) (|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (ANROWS |a|) . #5=(|MATSTOR;plus!;4M;3|))
              (LETT |n| (ANCOLS |a|) . #5#)
              (COND
               ((EQL (ANROWS |b|) |m|)
                (COND
                 ((NULL (EQL (ANCOLS |b|) |n|))
                  (EXIT
                   (|error|
                    #6="plus!: matrices of incompatible dimensions")))))
               (#7='T (EXIT (|error| #6#))))
              (COND
               ((EQL (ANROWS |c|) |m|)
                (COND
                 ((NULL (EQL (ANCOLS |c|) |n|))
                  (EXIT
                   (|error|
                    #8="plus!: matrices of incompatible dimensions")))))
               (#7# (EXIT (|error| #8#))))
              (LETT |aa| (|MATSTOR;rep| |a| $) . #5#)
              (LETT |bb| (|MATSTOR;rep| |b| $) . #5#)
              (LETT |cc| (|MATSTOR;rep| |c| $) . #5#)
              (SEQ (LETT |i| 0 . #5#) (LETT #3# (- |m| 1) . #5#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #5#)
                        (LETT |bRow| (QAREF1 |bb| |i|) . #5#)
                        (LETT |cRow| (QAREF1 |cc| |i|) . #5#)
                        (EXIT
                         (SEQ (LETT |j| 0 . #5#) (LETT #1# (- |n| 1) . #5#)
                              G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (QSETAREF1 |cRow| |j|
                                           (SPADCALL (QAREF1 |aRow| |j|)
                                                     (QAREF1 |bRow| |j|)
                                                     (QREFELT $ 10)))))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |c|)))) 

(SDEFUN |MATSTOR;minus!;3M;4|
        ((|c| |Matrix| R) (|a| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((#1=#:G753 NIL) (|j| NIL) (|cRow| #2=(|PrimitiveArray| R))
          (|aRow| #2#) (#3=#:G752 NIL) (|i| NIL)
          (|cc| #4=(|PrimitiveArray| (|PrimitiveArray| R))) (|aa| #4#)
          (|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (ANROWS |a|) . #5=(|MATSTOR;minus!;3M;4|))
              (LETT |n| (ANCOLS |a|) . #5#)
              (COND
               ((EQL (ANROWS |c|) |m|)
                (COND
                 ((NULL (EQL (ANCOLS |c|) |n|))
                  (EXIT
                   (|error|
                    #6="minus!: matrices of incompatible dimensions")))))
               ('T (EXIT (|error| #6#))))
              (LETT |aa| (|MATSTOR;rep| |a| $) . #5#)
              (LETT |cc| (|MATSTOR;rep| |c| $) . #5#)
              (SEQ (LETT |i| 0 . #5#) (LETT #3# (- |m| 1) . #5#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #5#)
                        (LETT |cRow| (QAREF1 |cc| |i|) . #5#)
                        (EXIT
                         (SEQ (LETT |j| 0 . #5#) (LETT #1# (- |n| 1) . #5#)
                              G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (QSETAREF1 |cRow| |j|
                                           (SPADCALL (QAREF1 |aRow| |j|)
                                                     (QREFELT $ 12)))))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |c|)))) 

(SDEFUN |MATSTOR;minus!;4M;5|
        ((|c| |Matrix| R) (|a| |Matrix| R) (|b| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((#1=#:G764 NIL) (|j| NIL) (|cRow| #2=(|PrimitiveArray| R))
          (|bRow| #2#) (|aRow| #2#) (#3=#:G763 NIL) (|i| NIL)
          (|cc| #4=(|PrimitiveArray| (|PrimitiveArray| R))) (|bb| #4#)
          (|aa| #4#) (|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (ANROWS |a|) . #5=(|MATSTOR;minus!;4M;5|))
              (LETT |n| (ANCOLS |a|) . #5#)
              (COND
               ((EQL (ANROWS |b|) |m|)
                (COND
                 ((NULL (EQL (ANCOLS |b|) |n|))
                  (EXIT
                   (|error|
                    #6="minus!: matrices of incompatible dimensions")))))
               (#7='T (EXIT (|error| #6#))))
              (COND
               ((EQL (ANROWS |c|) |m|)
                (COND
                 ((NULL (EQL (ANCOLS |c|) |n|))
                  (EXIT
                   (|error|
                    #8="minus!: matrices of incompatible dimensions")))))
               (#7# (EXIT (|error| #8#))))
              (LETT |aa| (|MATSTOR;rep| |a| $) . #5#)
              (LETT |bb| (|MATSTOR;rep| |b| $) . #5#)
              (LETT |cc| (|MATSTOR;rep| |c| $) . #5#)
              (SEQ (LETT |i| 0 . #5#) (LETT #3# (- |m| 1) . #5#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #5#)
                        (LETT |bRow| (QAREF1 |bb| |i|) . #5#)
                        (LETT |cRow| (QAREF1 |cc| |i|) . #5#)
                        (EXIT
                         (SEQ (LETT |j| 0 . #5#) (LETT #1# (- |n| 1) . #5#)
                              G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (QSETAREF1 |cRow| |j|
                                           (SPADCALL (QAREF1 |aRow| |j|)
                                                     (QAREF1 |bRow| |j|)
                                                     (QREFELT $ 14)))))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |c|)))) 

(SDEFUN |MATSTOR;leftScalarTimes!;MR2M;6|
        ((|c| |Matrix| R) (|r| R) (|a| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((#1=#:G773 NIL) (|j| NIL) (|cRow| #2=(|PrimitiveArray| R))
          (|aRow| #2#) (#3=#:G772 NIL) (|i| NIL)
          (|cc| #4=(|PrimitiveArray| (|PrimitiveArray| R))) (|aa| #4#)
          (|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (ANROWS |a|) . #5=(|MATSTOR;leftScalarTimes!;MR2M;6|))
              (LETT |n| (ANCOLS |a|) . #5#)
              (COND
               ((EQL (ANROWS |c|) |m|)
                (COND
                 ((NULL (EQL (ANCOLS |c|) |n|))
                  (EXIT
                   (|error|
                    #6="leftScalarTimes!: matrices of incompatible dimensions")))))
               ('T (EXIT (|error| #6#))))
              (LETT |aa| (|MATSTOR;rep| |a| $) . #5#)
              (LETT |cc| (|MATSTOR;rep| |c| $) . #5#)
              (SEQ (LETT |i| 0 . #5#) (LETT #3# (- |m| 1) . #5#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #5#)
                        (LETT |cRow| (QAREF1 |cc| |i|) . #5#)
                        (EXIT
                         (SEQ (LETT |j| 0 . #5#) (LETT #1# (- |n| 1) . #5#)
                              G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (QSETAREF1 |cRow| |j|
                                           (SPADCALL |r| (QAREF1 |aRow| |j|)
                                                     (QREFELT $ 16)))))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |c|)))) 

(SDEFUN |MATSTOR;rightScalarTimes!;2MRM;7|
        ((|c| |Matrix| R) (|a| |Matrix| R) (|r| R) ($ |Matrix| R))
        (SPROG
         ((#1=#:G783 NIL) (|j| NIL) (|cRow| #2=(|PrimitiveArray| R))
          (|aRow| #2#) (#3=#:G782 NIL) (|i| NIL)
          (|cc| #4=(|PrimitiveArray| (|PrimitiveArray| R))) (|aa| #4#)
          (|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (ANROWS |a|) . #5=(|MATSTOR;rightScalarTimes!;2MRM;7|))
              (LETT |n| (ANCOLS |a|) . #5#)
              (COND
               ((EQL (ANROWS |c|) |m|)
                (COND
                 ((NULL (EQL (ANCOLS |c|) |n|))
                  (EXIT
                   (|error|
                    #6="rightScalarTimes!: matrices of incompatible dimensions")))))
               ('T (EXIT (|error| #6#))))
              (LETT |aa| (|MATSTOR;rep| |a| $) . #5#)
              (LETT |cc| (|MATSTOR;rep| |c| $) . #5#)
              (SEQ (LETT |i| 0 . #5#) (LETT #3# (- |m| 1) . #5#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #5#)
                        (LETT |cRow| (QAREF1 |cc| |i|) . #5#)
                        (EXIT
                         (SEQ (LETT |j| 0 . #5#) (LETT #1# (- |n| 1) . #5#)
                              G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (QSETAREF1 |cRow| |j|
                                           (SPADCALL (QAREF1 |aRow| |j|) |r|
                                                     (QREFELT $ 16)))))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |c|)))) 

(SDEFUN |MATSTOR;copyCol!|
        ((|bCol| |PrimitiveArray| R)
         (|bb| |PrimitiveArray| (|PrimitiveArray| R)) (|j| |Integer|)
         (|n1| |Integer|) ($ |PrimitiveArray| R))
        (SPROG ((#1=#:G786 NIL) (|i| NIL))
               (SEQ (LETT |i| 0 . #2=(|MATSTOR;copyCol!|))
                    (LETT #1# |n1| . #2#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (QSETAREF1 |bCol| |i| (QAREF1 (QAREF1 |bb| |i|) |j|))))
                    (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |MATSTOR;times!;4M;9|
        ((|c| |Matrix| R) (|a| |Matrix| R) (|b| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((|sum| (R)) (#1=#:G799 NIL) (|k| NIL)
          (|cRow| #2=(|PrimitiveArray| R)) (|aRow| #2#) (#3=#:G798 NIL)
          (|i| NIL) (#4=#:G797 NIL) (|j| NIL) (|n1| #5=(|Integer|)) (|m1| #5#)
          (|bCol| (|PrimitiveArray| R))
          (|cc| #6=(|PrimitiveArray| (|PrimitiveArray| R))) (|bb| #6#)
          (|aa| #6#) (|p| #7=(|NonNegativeInteger|)) (|n| #7#)
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (ANROWS |a|) . #8=(|MATSTOR;times!;4M;9|))
              (LETT |n| (ANCOLS |a|) . #8#) (LETT |p| (ANCOLS |b|) . #8#)
              (COND
               ((EQL (ANROWS |b|) |n|)
                (COND
                 ((EQL (ANROWS |c|) |m|)
                  (COND
                   ((NULL (EQL (ANCOLS |c|) |p|))
                    (EXIT
                     (|error|
                      #9="times!: matrices of incompatible dimensions")))))
                 (#10='T (EXIT (|error| #9#)))))
               (#10# (EXIT (|error| #9#))))
              (LETT |aa| (|MATSTOR;rep| |a| $) . #8#)
              (LETT |bb| (|MATSTOR;rep| |b| $) . #8#)
              (LETT |cc| (|MATSTOR;rep| |c| $) . #8#)
              (LETT |bCol| (MAKEARR1 |n| (|spadConstant| $ 19)) . #8#)
              (LETT |m1| (- |m| 1) . #8#) (LETT |n1| (- |n| 1) . #8#)
              (SEQ (LETT |j| 0 . #8#) (LETT #4# (- |p| 1) . #8#) G190
                   (COND ((|greater_SI| |j| #4#) (GO G191)))
                   (SEQ (|MATSTOR;copyCol!| |bCol| |bb| |j| |n1| $)
                        (EXIT
                         (SEQ (LETT |i| 0 . #8#) (LETT #3# |m1| . #8#) G190
                              (COND ((|greater_SI| |i| #3#) (GO G191)))
                              (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #8#)
                                   (LETT |cRow| (QAREF1 |cc| |i|) . #8#)
                                   (LETT |sum| (|spadConstant| $ 19) . #8#)
                                   (SEQ (LETT |k| 0 . #8#)
                                        (LETT #1# |n1| . #8#) G190
                                        (COND
                                         ((|greater_SI| |k| #1#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |sum|
                                                (SPADCALL |sum|
                                                          (SPADCALL
                                                           (QAREF1 |aRow| |k|)
                                                           (QAREF1 |bCol| |k|)
                                                           (QREFELT $ 16))
                                                          (QREFELT $ 10))
                                                . #8#)))
                                        (LETT |k| (|inc_SI| |k|) . #8#)
                                        (GO G190) G191 (EXIT NIL))
                                   (EXIT (QSETAREF1 |cRow| |j| |sum|)))
                              (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT |c|)))) 

(SDEFUN |MATSTOR;power!;4MNniM;10|
        ((|a| |Matrix| R) (|b| |Matrix| R) (|c| |Matrix| R) (|m| |Matrix| R)
         (|p| |NonNegativeInteger|) ($ |Matrix| R))
        (SPROG
         ((#1=#:G815 NIL) (|flag| (|Boolean|)) (|nn| (|NonNegativeInteger|))
          (|mm| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |mm| (ANROWS |a|) . #2=(|MATSTOR;power!;4MNniM;10|))
                (LETT |nn| (ANCOLS |a|) . #2#)
                (EXIT
                 (COND
                  ((EQL |mm| |nn|)
                   (SEQ
                    (COND
                     ((EQL (ANROWS |b|) |mm|)
                      (COND
                       ((NULL (EQL (ANCOLS |b|) |nn|))
                        (EXIT
                         (|error|
                          #3="power!: matrices of incompatible dimensions")))))
                     (#4='T (EXIT (|error| #3#))))
                    (COND
                     ((EQL (ANROWS |c|) |mm|)
                      (COND
                       ((NULL (EQL (ANCOLS |c|) |nn|))
                        (EXIT
                         (|error|
                          #5="power!: matrices of incompatible dimensions")))))
                     (#4# (EXIT (|error| #5#))))
                    (COND
                     ((EQL (ANROWS |m|) |mm|)
                      (COND
                       ((NULL (EQL (ANCOLS |m|) |nn|))
                        (EXIT
                         (|error|
                          #6="power!: matrices of incompatible dimensions")))))
                     (#4# (EXIT (|error| #6#))))
                    (LETT |flag| NIL . #2#) (SPADCALL |b| |m| (QREFELT $ 9))
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (COND
                            ((ODDP |p|)
                             (COND
                              (|flag|
                               (SEQ (SPADCALL |c| |b| |a| (QREFELT $ 20))
                                    (EXIT (SPADCALL |a| |c| (QREFELT $ 9)))))
                              ('T
                               (SEQ (LETT |flag| 'T . #2#)
                                    (EXIT
                                     (SPADCALL |a| |b| (QREFELT $ 9))))))))
                           (EXIT
                            (COND
                             ((EQL |p| 1)
                              (PROGN (LETT #1# |a| . #2#) (GO #7=#:G814)))
                             ('T
                              (SEQ (LETT |p| (QUOTIENT2 |p| 2) . #2#)
                                   (SPADCALL |c| |b| |b| (QREFELT $ 20))
                                   (EXIT (SPADCALL |b| |c| (QREFELT $ 9))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))
                  (#4# (|error| "power!: matrix must be square"))))))
          #7# (EXIT #1#)))) 

(SDEFUN |MATSTOR;^;MNniM;11|
        ((|m| |Matrix| R) (|n| |NonNegativeInteger|) ($ |Matrix| R))
        (SPROG ((|c| #1=(|Matrix| R)) (|b| #1#) (|a| #1#))
               (SEQ
                (COND
                 ((NULL (SPADCALL |m| (QREFELT $ 24)))
                  (|error| "^: matrix must be square"))
                 ('T
                  (SEQ
                   (LETT |a| (SPADCALL |m| (QREFELT $ 25))
                         . #2=(|MATSTOR;^;MNniM;11|))
                   (LETT |b| (SPADCALL |m| (QREFELT $ 25)) . #2#)
                   (LETT |c| (SPADCALL |m| (QREFELT $ 25)) . #2#)
                   (EXIT (SPADCALL |a| |b| |c| |m| |n| (QREFELT $ 22))))))))) 

(DECLAIM (NOTINLINE |StorageEfficientMatrixOperations;|)) 

(DEFUN |StorageEfficientMatrixOperations| (#1=#:G819)
  (SPROG NIL
         (PROG (#2=#:G820)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|StorageEfficientMatrixOperations|)
                                               '|domainEqualList|)
                    . #3=(|StorageEfficientMatrixOperations|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|StorageEfficientMatrixOperations;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|StorageEfficientMatrixOperations|)))))))))) 

(DEFUN |StorageEfficientMatrixOperations;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|StorageEfficientMatrixOperations|))
          (LETT |dv$| (LIST '|StorageEfficientMatrixOperations| DV$1) . #1#)
          (LETT $ (GETREFV 27) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|StorageEfficientMatrixOperations|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|StorageEfficientMatrixOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (|Matrix| 6)
              |MATSTOR;copy!;3M;2| (4 . +) |MATSTOR;plus!;4M;3| (10 . -)
              |MATSTOR;minus!;3M;4| (15 . -) |MATSTOR;minus!;4M;5| (21 . *)
              |MATSTOR;leftScalarTimes!;MR2M;6|
              |MATSTOR;rightScalarTimes!;2MRM;7| (27 . |Zero|)
              |MATSTOR;times!;4M;9| (|NonNegativeInteger|)
              |MATSTOR;power!;4MNniM;10| (|Boolean|) (31 . |square?|)
              (36 . |copy|) |MATSTOR;^;MNniM;11|)
           '#(|times!| 41 |rightScalarTimes!| 48 |power!| 55 |plus!| 64
              |minus!| 71 |leftScalarTimes!| 84 |copy!| 91 ^ 97)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 26
                                                 '(0 6 0 7 2 6 0 0 0 10 1 6 0 0
                                                   12 2 6 0 0 0 14 2 6 0 0 0 16
                                                   0 6 0 19 1 8 23 0 24 1 8 0 0
                                                   25 3 0 8 8 8 8 20 3 0 8 8 8
                                                   6 18 5 0 8 8 8 8 8 21 22 3 0
                                                   8 8 8 8 11 3 0 8 8 8 8 15 2
                                                   0 8 8 8 13 3 0 8 8 6 8 17 2
                                                   0 8 8 8 9 2 0 8 8 21 26)))))
           '|lookupComplete|)) 
