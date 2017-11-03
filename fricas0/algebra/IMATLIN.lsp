
(SDEFUN |IMATLIN;rowAllZeroes?| ((|x| M) (|i| |Integer|) ($ |Boolean|))
        (SPROG ((#1=#:G715 NIL) (#2=#:G716 NIL) (#3=#:G717 NIL) (|j| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |j| (SPADCALL |x| (QREFELT $ 11))
                           . #4=(|IMATLIN;rowAllZeroes?|))
                     (LETT #3# (SPADCALL |x| (QREFELT $ 12)) . #4#) G190
                     (COND ((> |j| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                   (|spadConstant| $ 14) (QREFELT $ 16))
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# NIL . #4#) (GO #5=#:G714))
                                . #4#)
                          (GO #6=#:G712))))))
                     (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |IMATLIN;colAllZeroes?| ((|x| M) (|j| |Integer|) ($ |Boolean|))
        (SPROG ((#1=#:G722 NIL) (#2=#:G723 NIL) (#3=#:G724 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |i| (SPADCALL |x| (QREFELT $ 17))
                           . #4=(|IMATLIN;colAllZeroes?|))
                     (LETT #3# (SPADCALL |x| (QREFELT $ 18)) . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                   (|spadConstant| $ 14) (QREFELT $ 16))
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# NIL . #4#) (GO #5=#:G721))
                                . #4#)
                          (GO #6=#:G719))))))
                     (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |IMATLIN;row_operation_base;M4IRV;3|
        ((|x| M) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|)
         (|maxC| |Integer|) (|pp| R) ($ |Void|))
        (SPROG ((#1=#:G728 NIL) (|k1| NIL))
               (SEQ (LETT |k1| |j| . #2=(|IMATLIN;row_operation_base;M4IRV;3|))
                    (LETT #1# |maxC| . #2#) G190
                    (COND ((> |k1| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (QSETAREF2O |x| |k| |k1|
                                  (SPADCALL (QAREF2O |x| |k| |k1| 1 1)
                                            (SPADCALL |pp|
                                                      (QAREF2O |x| |i| |k1| 1
                                                               1)
                                                      (QREFELT $ 19))
                                            (QREFELT $ 20))
                                  1 1)))
                    (LETT |k1| (+ |k1| 1) . #2#) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |IMATLIN;row_operation_modular;M4IRIV;4|
        ((|x| M) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|)
         (|maxC| |Integer|) (|pp| R) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G732 NIL) (|k1| NIL) (|ms| #2=(|SingleInteger|)) (|js| #2#)
          (|pp1| (|Integer|)))
         (SEQ
          (LETT |pp1| (- |p| |pp|)
                . #3=(|IMATLIN;row_operation_modular;M4IRIV;4|))
          (LETT |js| |j| . #3#) (LETT |ms| |maxC| . #3#)
          (EXIT
           (SEQ (LETT |k1| |js| . #3#) (LETT #1# |ms| . #3#) G190
                (COND ((|greater_SI| |k1| #1#) (GO G191)))
                (SEQ
                 (EXIT
                  (QSETAREF2O |x| |k| |k1|
                              (QSMULADDMOD64-32 |pp1|
                                                (QAREF2O |x| |i| |k1| 1 1)
                                                (QAREF2O |x| |k| |k1| 1 1) |p|)
                              1 1)))
                (LETT |k1| (|inc_SI| |k1|) . #3#) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |IMATLIN;rowEchelon;2M;5| ((|y| M) ($ M))
        (SPROG
         ((|i| #1=(|Integer|)) (|pp| (R)) (#2=#:G771 NIL) (|k| NIL)
          (#3=#:G770 NIL) (|b| (R)) (#4=#:G766 NIL) (|n| (|Integer|))
          (#5=#:G769 NIL) (#6=#:G767 NIL) (#7=#:G768 NIL) (|j| NIL)
          (|maxC| (|Integer|)) (|minC| (|Integer|)) (|maxR| (|Integer|))
          (|minR| #1#) (|x| (M))
          (|row_op|
           (|Mapping| (|Void|) M (|Integer|) (|Integer|) (|Integer|)
                      (|Integer|) R))
          (#8=#:G742 NIL) (|cc| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |row_op|
                  (SEQ
                   (LETT |cc| (SPADCALL (QREFELT $ 25))
                         . #9=(|IMATLIN;rowEchelon;2M;5|))
                   (COND
                    ((SPADCALL |cc| (|spadConstant| $ 26) (QREFELT $ 27))
                     (COND
                      ((SPADCALL |cc| 1000000000 (QREFELT $ 28))
                       (COND
                        ((|domainEqual| (QREFELT $ 6)
                                        (|PrimeField|
                                         (PROG1 (LETT #8# |cc| . #9#)
                                           (|check_subtype2| (> #8# 0)
                                                             '(|PositiveInteger|)
                                                             '(|NonNegativeInteger|)
                                                             #8#))))
                         (EXIT
                          (CONS #'|IMATLIN;rowEchelon;2M;5!0|
                                (VECTOR $ |cc|)))))))))
                   (EXIT (ELT $ 22)))
                  . #9#)
            (LETT |x| (SPADCALL |y| (QREFELT $ 29)) . #9#)
            (LETT |minR| 1 . #9#)
            (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #9#)
            (LETT |minC| 1 . #9#)
            (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #9#)
            (LETT |i| |minR| . #9#) (LETT |n| (- |minR| 1) . #9#)
            (SEQ (LETT |j| |minC| . #9#) (LETT #7# |maxC| . #9#) G190
                 (COND ((> |j| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |i| |maxR| (QREFELT $ 31))
                     (PROGN (LETT #6# |x| . #9#) (GO #10=#:G765)))
                    ('T
                     (SEQ (LETT |n| (- |minR| 1) . #9#)
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| |i| . #9#) (LETT #5# |maxR| . #9#)
                                 G190 (COND ((> |k| #5#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                               (|spadConstant| $ 14)
                                               (QREFELT $ 16))
                                     (SEQ (LETT |n| |k| . #9#)
                                          (EXIT
                                           (PROGN
                                            (LETT #4# |$NoValue| . #9#)
                                            (GO #11=#:G754))))))))
                                 (LETT |k| (+ |k| 1) . #9#) (GO G190) G191
                                 (EXIT NIL)))
                           #11# (EXIT #4#))
                          (EXIT
                           (COND ((EQL |n| (- |minR| 1)) "no non-zeroes")
                                 ('T
                                  (SEQ
                                   (COND
                                    ((SPADCALL |i| |n| (QREFELT $ 32))
                                     (SPADCALL |x| |i| |n| (QREFELT $ 33))))
                                   (LETT |b|
                                         (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                                   (QREFELT $ 34))
                                         . #9#)
                                   (QSETAREF2O |x| |i| |j|
                                               (|spadConstant| $ 30) 1 1)
                                   (SEQ (LETT |k| (+ |j| 1) . #9#)
                                        (LETT #3# |maxC| . #9#) G190
                                        (COND ((> |k| #3#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (QSETAREF2O |x| |i| |k|
                                                      (SPADCALL |b|
                                                                (QAREF2O |x|
                                                                         |i|
                                                                         |k| 1
                                                                         1)
                                                                (QREFELT $ 19))
                                                      1 1)))
                                        (LETT |k| (+ |k| 1) . #9#) (GO G190)
                                        G191 (EXIT NIL))
                                   (SEQ (LETT |k| |minR| . #9#)
                                        (LETT #2# |maxR| . #9#) G190
                                        (COND ((> |k| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |k| |i| (QREFELT $ 32))
                                            (SEQ
                                             (LETT |pp|
                                                   (QAREF2O |x| |k| |j| 1 1)
                                                   . #9#)
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |pp|
                                                           (|spadConstant| $
                                                                           14)
                                                           (QREFELT $ 35)))
                                                (SEQ
                                                 (SPADCALL |x| |i| (+ |j| 1)
                                                           |k| |maxC| |pp|
                                                           |row_op|)
                                                 (EXIT
                                                  (QSETAREF2O |x| |k| |j|
                                                              (|spadConstant| $
                                                                              14)
                                                              1 1)))))))))))
                                        (LETT |k| (+ |k| 1) . #9#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT (LETT |i| (+ |i| 1) . #9#)))))))))))
                 (LETT |j| (+ |j| 1) . #9#) (GO G190) G191 (EXIT NIL))
            (EXIT |x|)))
          #10# (EXIT #6#)))) 

(SDEFUN |IMATLIN;rowEchelon;2M;5!0|
        ((|x| NIL) (|i| NIL) (|j| NIL) (|k| NIL) (|maxC| NIL) (|pp| NIL)
         ($$ NIL))
        (PROG (|cc| $)
          (LETT |cc| (QREFELT $$ 1) . #1=(|IMATLIN;rowEchelon;2M;5|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (SPADCALL |x| |i| |j| |k| |maxC| |pp| |cc| (QREFELT $ 23)))))) 

(SDEFUN |IMATLIN;nullSpace;ML;6| ((|y| M) ($ |List| |Col|))
        (SPROG
         ((|l| (|Integer|)) (|j| #1=(|Integer|)) (|basis| (|List| |Col|))
          (#2=#:G799 NIL) (|k| NIL) (#3=#:G800 NIL) (|ll| NIL) (|w| (|Col|))
          (#4=#:G798 NIL) (|i| NIL)
          (|v| (|IndexedOneDimensionalArray| (|Integer|) |minC|))
          (#5=#:G797 NIL) (|row| #6=(|Integer|)) (#7=#:G777 NIL)
          (|rk| #8=(|NonNegativeInteger|)) (#9=#:G776 NIL)
          (|ncol| (|NonNegativeInteger|)) (|nrow| #8#) (|maxC| #1#)
          (|minC| (|Integer|)) (|maxR| #6#) (|minR| (|Integer|)) (|x| (M)))
         (SEQ
          (LETT |x| (SPADCALL |y| (QREFELT $ 36))
                . #10=(|IMATLIN;nullSpace;ML;6|))
          (LETT |minR| 1 . #10#)
          (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #10#)
          (LETT |minC| 1 . #10#)
          (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #10#)
          (LETT |nrow| (ANROWS |x|) . #10#) (LETT |ncol| (ANCOLS |x|) . #10#)
          (LETT |basis| NIL . #10#) (LETT |rk| |nrow| . #10#)
          (LETT |row| |maxR| . #10#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |rk| 0 (QREFELT $ 27))
                    (|IMATLIN;rowAllZeroes?| |x| |row| $))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (LETT |rk|
                      (PROG1 (LETT #9# (- |rk| 1) . #10#)
                        (|check_subtype2| (>= #9# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #9#))
                      . #10#)
                (EXIT
                 (LETT |row|
                       (PROG1 (LETT #7# (- |row| 1) . #10#)
                         (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #7#))
                       . #10#)))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |ncol| |nrow| (QREFELT $ 37))
            (COND ((EQL |rk| |ncol|) (EXIT NIL)))))
          (EXIT
           (COND
            ((EQL |rk| 0)
             (SEQ
              (SEQ (LETT |j| |minC| . #10#) (LETT #5# |maxC| . #10#) G190
                   (COND ((> |j| #5#) (GO G191)))
                   (SEQ
                    (LETT |w|
                          (SPADCALL |ncol| (|spadConstant| $ 14)
                                    (QREFELT $ 38))
                          . #10#)
                    (SPADCALL |w| |j| (|spadConstant| $ 30) (QREFELT $ 39))
                    (EXIT (LETT |basis| (CONS |w| |basis|) . #10#)))
                   (LETT |j| (+ |j| 1) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT |basis|)))
            ('T
             (SEQ
              (LETT |v|
                    (SPADCALL |ncol| (- |minR| 1)
                              (|compiledLookupCheck| '|new|
                                                     (LIST '$
                                                           (LIST
                                                            '|NonNegativeInteger|)
                                                           (LIST '|Integer|))
                                                     (|IndexedOneDimensionalArray|
                                                      (|Integer|) |minC|)))
                    . #10#)
              (SEQ (LETT |i| |minR| . #10#)
                   (LETT #4# (- (+ |minR| |rk|) 1) . #10#) G190
                   (COND ((> |i| #4#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| |minC| . #10#) G190
                         (COND
                          ((NULL
                            (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                      (|spadConstant| $ 14) (QREFELT $ 35)))
                           (GO G191)))
                         (SEQ (EXIT |j|)) (LETT |j| (+ |j| 1) . #10#) (GO G190)
                         G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |v| |j| |i|
                               (|compiledLookupCheck| '|qsetelt!|
                                                      (LIST (LIST '|Integer|)
                                                            '$
                                                            (LIST '|Integer|)
                                                            (LIST '|Integer|))
                                                      (|IndexedOneDimensionalArray|
                                                       (|Integer|) |minC|)))))
                   (LETT |i| (+ |i| 1) . #10#) (GO G190) G191 (EXIT NIL))
              (LETT |j| |maxC| . #10#)
              (LETT |l| (- (+ |minR| |ncol|) 1) . #10#)
              (SEQ G190 (COND ((NULL (>= |j| |minC|)) (GO G191)))
                   (SEQ
                    (LETT |w|
                          (SPADCALL |ncol| (|spadConstant| $ 14)
                                    (QREFELT $ 38))
                          . #10#)
                    (COND
                     ((EQL
                       (SPADCALL |v| |j|
                                 (|compiledLookupCheck| '|qelt|
                                                        (LIST (LIST '|Integer|)
                                                              '$
                                                              (LIST
                                                               '|Integer|))
                                                        (|IndexedOneDimensionalArray|
                                                         (|Integer|) |minC|)))
                       (- |minR| 1))
                      (COND
                       ((|IMATLIN;colAllZeroes?| |x| |j| $)
                        (SEQ
                         (SPADCALL |w| |l| (|spadConstant| $ 30)
                                   (QREFELT $ 39))
                         (EXIT (LETT |basis| (CONS |w| |basis|) . #10#))))
                       ('T
                        (SEQ
                         (SEQ (LETT |ll| |minR| . #10#)
                              (LETT #3# (- |l| 1) . #10#)
                              (LETT |k| |minC| . #10#)
                              (LETT #2# (- |j| 1) . #10#) G190
                              (COND ((OR (> |k| #2#) (> |ll| #3#)) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |v| |k|
                                             (|compiledLookupCheck| '|qelt|
                                                                    (LIST
                                                                     (LIST
                                                                      '|Integer|)
                                                                     '$
                                                                     (LIST
                                                                      '|Integer|))
                                                                    (|IndexedOneDimensionalArray|
                                                                     (|Integer|)
                                                                     |minC|)))
                                   (- |minR| 1) (QREFELT $ 32))
                                  (SPADCALL |w| |ll|
                                            (SPADCALL
                                             (QAREF2O |x|
                                                      (SPADCALL |v| |k|
                                                                (|compiledLookupCheck|
                                                                 '|qelt|
                                                                 (LIST
                                                                  (LIST
                                                                   '|Integer|)
                                                                  '$
                                                                  (LIST
                                                                   '|Integer|))
                                                                 (|IndexedOneDimensionalArray|
                                                                  (|Integer|)
                                                                  |minC|)))
                                                      |j| 1 1)
                                             (QREFELT $ 40))
                                            (QREFELT $ 39))))))
                              (LETT |k|
                                    (PROG1 (+ |k| 1)
                                      (LETT |ll| (+ |ll| 1) . #10#))
                                    . #10#)
                              (GO G190) G191 (EXIT NIL))
                         (SPADCALL |w| |l| (|spadConstant| $ 30)
                                   (QREFELT $ 39))
                         (EXIT (LETT |basis| (CONS |w| |basis|) . #10#)))))))
                    (LETT |j| (- |j| 1) . #10#)
                    (EXIT (LETT |l| (- |l| 1) . #10#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |basis|)))))))) 

(SDEFUN |IMATLIN;determinant;MR;7| ((|y| M) ($ R))
        (SPROG
         ((#1=#:G823 NIL) (|l| NIL) (|b| (R)) (#2=#:G822 NIL) (|k| NIL)
          (#3=#:G821 NIL) (|ans| (R)) (#4=#:G817 NIL) (#5=#:G816 NIL)
          (|rown| (|Integer|)) (#6=#:G820 NIL) (#7=#:G818 NIL) (|i| NIL)
          (#8=#:G819 NIL) (|j| NIL) (|maxC| (|Integer|)) (|minC| (|Integer|))
          (|maxR| (|Integer|)) (|minR| (|Integer|)) (|x| (M))
          (|ndim| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL
              (LETT |ndim| (ANROWS |y|) . #9=(|IMATLIN;determinant;MR;7|))
              (ANCOLS |y|) (QREFELT $ 43))
             (|error| "determinant: matrix must be square"))
            ((EQL |ndim| 0) (|spadConstant| $ 30))
            ((EQL |ndim| 1) (QAREF2O |y| 1 1 1 1))
            ('T
             (SEQ (LETT |x| (SPADCALL |y| (QREFELT $ 29)) . #9#)
                  (LETT |minR| 1 . #9#)
                  (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #9#)
                  (LETT |minC| 1 . #9#)
                  (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #9#)
                  (LETT |ans| (|spadConstant| $ 30) . #9#)
                  (SEQ (LETT |j| |minC| . #9#) (LETT #8# (- |maxC| 1) . #9#)
                       (LETT |i| |minR| . #9#) (LETT #7# (- |maxR| 1) . #9#)
                       G190 (COND ((OR (> |i| #7#) (> |j| #8#)) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                    (|spadConstant| $ 14) (QREFELT $ 35))
                          (SEQ (LETT |rown| (- |minR| 1) . #9#)
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| (+ |i| 1) . #9#)
                                      (LETT #6# |maxR| . #9#) G190
                                      (COND ((> |k| #6#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                                    (|spadConstant| $ 14)
                                                    (QREFELT $ 16))
                                          (PROGN
                                           (LETT #5#
                                                 (SEQ (LETT |rown| |k| . #9#)
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #5# |$NoValue|
                                                              . #9#)
                                                        (GO #10=#:G803))))
                                                 . #9#)
                                           (GO #10#))))))
                                      (LETT |k| (+ |k| 1) . #9#) (GO G190) G191
                                      (EXIT NIL)))
                                #10# (EXIT #5#))
                               (COND
                                ((EQL |rown| (- |minR| 1))
                                 (PROGN
                                  (LETT #4# (|spadConstant| $ 14) . #9#)
                                  (GO #11=#:G815))))
                               (SPADCALL |x| |i| |rown| (QREFELT $ 33))
                               (EXIT
                                (LETT |ans| (SPADCALL |ans| (QREFELT $ 40))
                                      . #9#)))))
                        (LETT |ans|
                              (SPADCALL (QAREF2O |x| |i| |j| 1 1) |ans|
                                        (QREFELT $ 19))
                              . #9#)
                        (LETT |b|
                              (SPADCALL
                               (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                         (QREFELT $ 34))
                               (QREFELT $ 40))
                              . #9#)
                        (SEQ (LETT |l| (+ |j| 1) . #9#) (LETT #3# |maxC| . #9#)
                             G190 (COND ((> |l| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (QSETAREF2O |x| |i| |l|
                                           (SPADCALL |b|
                                                     (QAREF2O |x| |i| |l| 1 1)
                                                     (QREFELT $ 19))
                                           1 1)))
                             (LETT |l| (+ |l| 1) . #9#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SEQ (LETT |k| (+ |i| 1) . #9#)
                              (LETT #2# |maxR| . #9#) G190
                              (COND ((> |k| #2#) (GO G191)))
                              (SEQ (LETT |b| (QAREF2O |x| |k| |j| 1 1) . #9#)
                                   (EXIT
                                    (COND
                                     ((NULL
                                       (SPADCALL |b| (|spadConstant| $ 14)
                                                 (QREFELT $ 35)))
                                      (SEQ (LETT |l| (+ |j| 1) . #9#)
                                           (LETT #1# |maxC| . #9#) G190
                                           (COND ((> |l| #1#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF2O |x| |k| |l|
                                                         (SPADCALL
                                                          (QAREF2O |x| |k| |l|
                                                                   1 1)
                                                          (SPADCALL |b|
                                                                    (QAREF2O
                                                                     |x| |i|
                                                                     |l| 1 1)
                                                                    (QREFELT $
                                                                             19))
                                                          (QREFELT $ 44))
                                                         1 1)))
                                           (LETT |l| (+ |l| 1) . #9#) (GO G190)
                                           G191 (EXIT NIL))))))
                              (LETT |k| (+ |k| 1) . #9#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #9#))
                             . #9#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL (QAREF2O |x| |maxR| |maxC| 1 1) |ans|
                             (QREFELT $ 19)))))))
          #11# (EXIT #4#)))) 

(SDEFUN |IMATLIN;row_operation_base;M4IRV;8|
        ((|x| M) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|)
         (|maxC| |Integer|) (|pp| R) ($ |Void|))
        (SPROG ((#1=#:G826 NIL) (|k1| NIL))
               (SEQ (LETT |k1| |j| . #2=(|IMATLIN;row_operation_base;M4IRV;8|))
                    (LETT #1# |maxC| . #2#) G190
                    (COND ((> |k1| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |x| |k| |k1|
                                (SPADCALL
                                 (SPADCALL |x| |k| |k1| (QREFELT $ 13))
                                 (SPADCALL |pp|
                                           (SPADCALL |x| |i| |k1|
                                                     (QREFELT $ 13))
                                           (QREFELT $ 19))
                                 (QREFELT $ 20))
                                (QREFELT $ 46))))
                    (LETT |k1| (+ |k1| 1) . #2#) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |IMATLIN;row_operation_modular;M4IRIV;9|
        ((|x| M) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|)
         (|maxC| |Integer|) (|pp| R) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G830 NIL) (|k1| NIL) (|ms| #2=(|SingleInteger|)) (|js| #2#)
          (|pp1| (|Integer|)))
         (SEQ
          (LETT |pp1| (- |p| |pp|)
                . #3=(|IMATLIN;row_operation_modular;M4IRIV;9|))
          (LETT |js| |j| . #3#) (LETT |ms| |maxC| . #3#)
          (EXIT
           (SEQ (LETT |k1| |js| . #3#) (LETT #1# |ms| . #3#) G190
                (COND ((|greater_SI| |k1| #1#) (GO G191)))
                (SEQ
                 (EXIT
                  (SPADCALL |x| |k| |k1|
                            (QSMULADDMOD64-32 |pp1|
                                              (SPADCALL |x| |i| |k1|
                                                        (QREFELT $ 13))
                                              (SPADCALL |x| |k| |k1|
                                                        (QREFELT $ 13))
                                              |p|)
                            (QREFELT $ 46))))
                (LETT |k1| (|inc_SI| |k1|) . #3#) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |IMATLIN;rowEchelon;2M;10| ((|y| M) ($ M))
        (SPROG
         ((|i| #1=(|Integer|)) (|pp| (R)) (#2=#:G866 NIL) (|k| NIL)
          (#3=#:G865 NIL) (|b| (R)) (#4=#:G861 NIL) (|n| (|Integer|))
          (#5=#:G864 NIL) (#6=#:G862 NIL) (#7=#:G863 NIL) (|j| NIL)
          (|maxC| (|Integer|)) (|minC| (|Integer|)) (|maxR| (|Integer|))
          (|minR| #1#) (|x| (M))
          (|row_op|
           (|Mapping| (|Void|) M (|Integer|) (|Integer|) (|Integer|)
                      (|Integer|) R))
          (#8=#:G837 NIL) (|cc| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |row_op|
                  (SEQ
                   (LETT |cc| (SPADCALL (QREFELT $ 25))
                         . #9=(|IMATLIN;rowEchelon;2M;10|))
                   (COND
                    ((SPADCALL |cc| (|spadConstant| $ 26) (QREFELT $ 27))
                     (COND
                      ((SPADCALL |cc| 1000000000 (QREFELT $ 28))
                       (COND
                        ((|domainEqual| (QREFELT $ 6)
                                        (|PrimeField|
                                         (PROG1 (LETT #8# |cc| . #9#)
                                           (|check_subtype2| (> #8# 0)
                                                             '(|PositiveInteger|)
                                                             '(|NonNegativeInteger|)
                                                             #8#))))
                         (EXIT
                          (CONS #'|IMATLIN;rowEchelon;2M;10!0|
                                (VECTOR $ |cc|)))))))))
                   (EXIT (ELT $ 22)))
                  . #9#)
            (LETT |x| (SPADCALL |y| (QREFELT $ 29)) . #9#)
            (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #9#)
            (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #9#)
            (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #9#)
            (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #9#)
            (LETT |i| |minR| . #9#) (LETT |n| (- |minR| 1) . #9#)
            (SEQ (LETT |j| |minC| . #9#) (LETT #7# |maxC| . #9#) G190
                 (COND ((> |j| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |i| |maxR| (QREFELT $ 31))
                     (PROGN (LETT #6# |x| . #9#) (GO #10=#:G860)))
                    ('T
                     (SEQ (LETT |n| (- |minR| 1) . #9#)
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| |i| . #9#) (LETT #5# |maxR| . #9#)
                                 G190 (COND ((> |k| #5#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |x| |k| |j| (QREFELT $ 13))
                                      (|spadConstant| $ 14) (QREFELT $ 16))
                                     (SEQ (LETT |n| |k| . #9#)
                                          (EXIT
                                           (PROGN
                                            (LETT #4# |$NoValue| . #9#)
                                            (GO #11=#:G849))))))))
                                 (LETT |k| (+ |k| 1) . #9#) (GO G190) G191
                                 (EXIT NIL)))
                           #11# (EXIT #4#))
                          (EXIT
                           (COND ((EQL |n| (- |minR| 1)) "no non-zeroes")
                                 ('T
                                  (SEQ
                                   (COND
                                    ((SPADCALL |i| |n| (QREFELT $ 32))
                                     (SPADCALL |x| |i| |n| (QREFELT $ 33))))
                                   (LETT |b|
                                         (SPADCALL
                                          (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                          (QREFELT $ 34))
                                         . #9#)
                                   (SPADCALL |x| |i| |j| (|spadConstant| $ 30)
                                             (QREFELT $ 46))
                                   (SEQ (LETT |k| (+ |j| 1) . #9#)
                                        (LETT #3# |maxC| . #9#) G190
                                        (COND ((> |k| #3#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SPADCALL |x| |i| |k|
                                                    (SPADCALL |b|
                                                              (SPADCALL |x| |i|
                                                                        |k|
                                                                        (QREFELT
                                                                         $ 13))
                                                              (QREFELT $ 19))
                                                    (QREFELT $ 46))))
                                        (LETT |k| (+ |k| 1) . #9#) (GO G190)
                                        G191 (EXIT NIL))
                                   (SEQ (LETT |k| |minR| . #9#)
                                        (LETT #2# |maxR| . #9#) G190
                                        (COND ((> |k| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |k| |i| (QREFELT $ 32))
                                            (SEQ
                                             (LETT |pp|
                                                   (SPADCALL |x| |k| |j|
                                                             (QREFELT $ 13))
                                                   . #9#)
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |pp|
                                                           (|spadConstant| $
                                                                           14)
                                                           (QREFELT $ 35)))
                                                (SEQ
                                                 (SPADCALL |x| |i| (+ |j| 1)
                                                           |k| |maxC| |pp|
                                                           |row_op|)
                                                 (EXIT
                                                  (SPADCALL |x| |k| |j|
                                                            (|spadConstant| $
                                                                            14)
                                                            (QREFELT $
                                                                     46))))))))))))
                                        (LETT |k| (+ |k| 1) . #9#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT (LETT |i| (+ |i| 1) . #9#)))))))))))
                 (LETT |j| (+ |j| 1) . #9#) (GO G190) G191 (EXIT NIL))
            (EXIT |x|)))
          #10# (EXIT #6#)))) 

(SDEFUN |IMATLIN;rowEchelon;2M;10!0|
        ((|x| NIL) (|i| NIL) (|j| NIL) (|k| NIL) (|maxC| NIL) (|pp| NIL)
         ($$ NIL))
        (PROG (|cc| $)
          (LETT |cc| (QREFELT $$ 1) . #1=(|IMATLIN;rowEchelon;2M;10|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (SPADCALL |x| |i| |j| |k| |maxC| |pp| |cc| (QREFELT $ 23)))))) 

(SDEFUN |IMATLIN;nullSpace;ML;11| ((|y| M) ($ |List| |Col|))
        (SPROG
         ((|l| (|Integer|)) (|j| #1=(|Integer|)) (|basis| (|List| |Col|))
          (#2=#:G890 NIL) (|k| NIL) (#3=#:G891 NIL) (|ll| NIL) (|w| (|Col|))
          (#4=#:G889 NIL) (|i| NIL)
          (|v| (|IndexedOneDimensionalArray| (|Integer|) |minC|))
          (#5=#:G888 NIL) (|row| #6=(|Integer|)) (#7=#:G868 NIL)
          (|rk| #8=(|NonNegativeInteger|)) (#9=#:G867 NIL)
          (|ncol| (|NonNegativeInteger|)) (|nrow| #8#) (|maxC| #1#)
          (|minC| (|Integer|)) (|maxR| #6#) (|minR| (|Integer|)) (|x| (M)))
         (SEQ
          (LETT |x| (SPADCALL |y| (QREFELT $ 36))
                . #10=(|IMATLIN;nullSpace;ML;11|))
          (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #10#)
          (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #10#)
          (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #10#)
          (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #10#)
          (LETT |nrow| (SPADCALL |x| (QREFELT $ 47)) . #10#)
          (LETT |ncol| (SPADCALL |x| (QREFELT $ 48)) . #10#)
          (LETT |basis| NIL . #10#) (LETT |rk| |nrow| . #10#)
          (LETT |row| |maxR| . #10#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |rk| 0 (QREFELT $ 27))
                    (|IMATLIN;rowAllZeroes?| |x| |row| $))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (LETT |rk|
                      (PROG1 (LETT #9# (- |rk| 1) . #10#)
                        (|check_subtype2| (>= #9# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #9#))
                      . #10#)
                (EXIT
                 (LETT |row|
                       (PROG1 (LETT #7# (- |row| 1) . #10#)
                         (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #7#))
                       . #10#)))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |ncol| |nrow| (QREFELT $ 37))
            (COND ((EQL |rk| |ncol|) (EXIT NIL)))))
          (EXIT
           (COND
            ((EQL |rk| 0)
             (SEQ
              (SEQ (LETT |j| |minC| . #10#) (LETT #5# |maxC| . #10#) G190
                   (COND ((> |j| #5#) (GO G191)))
                   (SEQ
                    (LETT |w|
                          (SPADCALL |ncol| (|spadConstant| $ 14)
                                    (QREFELT $ 38))
                          . #10#)
                    (SPADCALL |w| |j| (|spadConstant| $ 30) (QREFELT $ 39))
                    (EXIT (LETT |basis| (CONS |w| |basis|) . #10#)))
                   (LETT |j| (+ |j| 1) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT |basis|)))
            ('T
             (SEQ
              (LETT |v|
                    (SPADCALL |ncol| (- |minR| 1)
                              (|compiledLookupCheck| '|new|
                                                     (LIST '$
                                                           (LIST
                                                            '|NonNegativeInteger|)
                                                           (LIST '|Integer|))
                                                     (|IndexedOneDimensionalArray|
                                                      (|Integer|) |minC|)))
                    . #10#)
              (SEQ (LETT |i| |minR| . #10#)
                   (LETT #4# (- (+ |minR| |rk|) 1) . #10#) G190
                   (COND ((> |i| #4#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| |minC| . #10#) G190
                         (COND
                          ((NULL
                            (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                      (|spadConstant| $ 14) (QREFELT $ 35)))
                           (GO G191)))
                         (SEQ (EXIT |j|)) (LETT |j| (+ |j| 1) . #10#) (GO G190)
                         G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |v| |j| |i|
                               (|compiledLookupCheck| '|qsetelt!|
                                                      (LIST (LIST '|Integer|)
                                                            '$
                                                            (LIST '|Integer|)
                                                            (LIST '|Integer|))
                                                      (|IndexedOneDimensionalArray|
                                                       (|Integer|) |minC|)))))
                   (LETT |i| (+ |i| 1) . #10#) (GO G190) G191 (EXIT NIL))
              (LETT |j| |maxC| . #10#)
              (LETT |l| (- (+ |minR| |ncol|) 1) . #10#)
              (SEQ G190 (COND ((NULL (>= |j| |minC|)) (GO G191)))
                   (SEQ
                    (LETT |w|
                          (SPADCALL |ncol| (|spadConstant| $ 14)
                                    (QREFELT $ 38))
                          . #10#)
                    (COND
                     ((EQL
                       (SPADCALL |v| |j|
                                 (|compiledLookupCheck| '|qelt|
                                                        (LIST (LIST '|Integer|)
                                                              '$
                                                              (LIST
                                                               '|Integer|))
                                                        (|IndexedOneDimensionalArray|
                                                         (|Integer|) |minC|)))
                       (- |minR| 1))
                      (COND
                       ((|IMATLIN;colAllZeroes?| |x| |j| $)
                        (SEQ
                         (SPADCALL |w| |l| (|spadConstant| $ 30)
                                   (QREFELT $ 39))
                         (EXIT (LETT |basis| (CONS |w| |basis|) . #10#))))
                       ('T
                        (SEQ
                         (SEQ (LETT |ll| |minR| . #10#)
                              (LETT #3# (- |l| 1) . #10#)
                              (LETT |k| |minC| . #10#)
                              (LETT #2# (- |j| 1) . #10#) G190
                              (COND ((OR (> |k| #2#) (> |ll| #3#)) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |v| |k|
                                             (|compiledLookupCheck| '|qelt|
                                                                    (LIST
                                                                     (LIST
                                                                      '|Integer|)
                                                                     '$
                                                                     (LIST
                                                                      '|Integer|))
                                                                    (|IndexedOneDimensionalArray|
                                                                     (|Integer|)
                                                                     |minC|)))
                                   (- |minR| 1) (QREFELT $ 32))
                                  (SPADCALL |w| |ll|
                                            (SPADCALL
                                             (SPADCALL |x|
                                                       (SPADCALL |v| |k|
                                                                 (|compiledLookupCheck|
                                                                  '|qelt|
                                                                  (LIST
                                                                   (LIST
                                                                    '|Integer|)
                                                                   '$
                                                                   (LIST
                                                                    '|Integer|))
                                                                  (|IndexedOneDimensionalArray|
                                                                   (|Integer|)
                                                                   |minC|)))
                                                       |j| (QREFELT $ 13))
                                             (QREFELT $ 40))
                                            (QREFELT $ 39))))))
                              (LETT |k|
                                    (PROG1 (+ |k| 1)
                                      (LETT |ll| (+ |ll| 1) . #10#))
                                    . #10#)
                              (GO G190) G191 (EXIT NIL))
                         (SPADCALL |w| |l| (|spadConstant| $ 30)
                                   (QREFELT $ 39))
                         (EXIT (LETT |basis| (CONS |w| |basis|) . #10#)))))))
                    (LETT |j| (- |j| 1) . #10#)
                    (EXIT (LETT |l| (- |l| 1) . #10#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |basis|)))))))) 

(SDEFUN |IMATLIN;determinant;MR;12| ((|y| M) ($ R))
        (SPROG
         ((#1=#:G914 NIL) (|l| NIL) (|b| (R)) (#2=#:G913 NIL) (|k| NIL)
          (#3=#:G912 NIL) (|ans| (R)) (#4=#:G908 NIL) (#5=#:G907 NIL)
          (|rown| (|Integer|)) (#6=#:G911 NIL) (#7=#:G909 NIL) (|i| NIL)
          (#8=#:G910 NIL) (|j| NIL) (|maxC| (|Integer|)) (|minC| (|Integer|))
          (|maxR| (|Integer|)) (|minR| (|Integer|)) (|x| (M))
          (|ndim| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL
              (LETT |ndim| (SPADCALL |y| (QREFELT $ 47))
                    . #9=(|IMATLIN;determinant;MR;12|))
              (SPADCALL |y| (QREFELT $ 48)) (QREFELT $ 43))
             (|error| "determinant: matrix must be square"))
            ((EQL |ndim| 0) (|spadConstant| $ 30))
            ((EQL |ndim| 1)
             (SPADCALL |y| (SPADCALL |y| (QREFELT $ 17))
                       (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 13)))
            ('T
             (SEQ (LETT |x| (SPADCALL |y| (QREFELT $ 29)) . #9#)
                  (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #9#)
                  (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #9#)
                  (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #9#)
                  (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #9#)
                  (LETT |ans| (|spadConstant| $ 30) . #9#)
                  (SEQ (LETT |j| |minC| . #9#) (LETT #8# (- |maxC| 1) . #9#)
                       (LETT |i| |minR| . #9#) (LETT #7# (- |maxR| 1) . #9#)
                       G190 (COND ((OR (> |i| #7#) (> |j| #8#)) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                    (|spadConstant| $ 14) (QREFELT $ 35))
                          (SEQ (LETT |rown| (- |minR| 1) . #9#)
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| (+ |i| 1) . #9#)
                                      (LETT #6# |maxR| . #9#) G190
                                      (COND ((> |k| #6#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |x| |k| |j|
                                                     (QREFELT $ 13))
                                           (|spadConstant| $ 14)
                                           (QREFELT $ 16))
                                          (PROGN
                                           (LETT #5#
                                                 (SEQ (LETT |rown| |k| . #9#)
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #5# |$NoValue|
                                                              . #9#)
                                                        (GO #10=#:G894))))
                                                 . #9#)
                                           (GO #10#))))))
                                      (LETT |k| (+ |k| 1) . #9#) (GO G190) G191
                                      (EXIT NIL)))
                                #10# (EXIT #5#))
                               (COND
                                ((EQL |rown| (- |minR| 1))
                                 (PROGN
                                  (LETT #4# (|spadConstant| $ 14) . #9#)
                                  (GO #11=#:G906))))
                               (SPADCALL |x| |i| |rown| (QREFELT $ 33))
                               (EXIT
                                (LETT |ans| (SPADCALL |ans| (QREFELT $ 40))
                                      . #9#)))))
                        (LETT |ans|
                              (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                        |ans| (QREFELT $ 19))
                              . #9#)
                        (LETT |b|
                              (SPADCALL
                               (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                         (QREFELT $ 34))
                               (QREFELT $ 40))
                              . #9#)
                        (SEQ (LETT |l| (+ |j| 1) . #9#) (LETT #3# |maxC| . #9#)
                             G190 (COND ((> |l| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |x| |i| |l|
                                         (SPADCALL |b|
                                                   (SPADCALL |x| |i| |l|
                                                             (QREFELT $ 13))
                                                   (QREFELT $ 19))
                                         (QREFELT $ 46))))
                             (LETT |l| (+ |l| 1) . #9#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SEQ (LETT |k| (+ |i| 1) . #9#)
                              (LETT #2# |maxR| . #9#) G190
                              (COND ((> |k| #2#) (GO G191)))
                              (SEQ
                               (LETT |b| (SPADCALL |x| |k| |j| (QREFELT $ 13))
                                     . #9#)
                               (EXIT
                                (COND
                                 ((NULL
                                   (SPADCALL |b| (|spadConstant| $ 14)
                                             (QREFELT $ 35)))
                                  (SEQ (LETT |l| (+ |j| 1) . #9#)
                                       (LETT #1# |maxC| . #9#) G190
                                       (COND ((> |l| #1#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |x| |k| |l|
                                                   (SPADCALL
                                                    (SPADCALL |x| |k| |l|
                                                              (QREFELT $ 13))
                                                    (SPADCALL |b|
                                                              (SPADCALL |x| |i|
                                                                        |l|
                                                                        (QREFELT
                                                                         $ 13))
                                                              (QREFELT $ 19))
                                                    (QREFELT $ 44))
                                                   (QREFELT $ 46))))
                                       (LETT |l| (+ |l| 1) . #9#) (GO G190)
                                       G191 (EXIT NIL))))))
                              (LETT |k| (+ |k| 1) . #9#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #9#))
                             . #9#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL (SPADCALL |x| |maxR| |maxC| (QREFELT $ 13)) |ans|
                             (QREFELT $ 19)))))))
          #11# (EXIT #4#)))) 

(SDEFUN |IMATLIN;rank;MNni;13| ((|x| M) ($ |NonNegativeInteger|))
        (SPROG
         ((|rk| (|NonNegativeInteger|)) (#1=#:G917 NIL) (|i| (|Integer|))
          (|y| (M)) (|rh| (|NonNegativeInteger|)))
         (SEQ
          (LETT |y|
                (SEQ
                 (LETT |rk| (SPADCALL |x| (QREFELT $ 47))
                       . #2=(|IMATLIN;rank;MNni;13|))
                 (LETT |rh| (SPADCALL |x| (QREFELT $ 48)) . #2#)
                 (EXIT
                  (COND
                   ((SPADCALL |rk| |rh| (QREFELT $ 27))
                    (SEQ (LETT |rk| |rh| . #2#)
                         (EXIT (SPADCALL |x| (QREFELT $ 49)))))
                   ('T (SPADCALL |x| (QREFELT $ 29))))))
                . #2#)
          (LETT |y| (SPADCALL |y| (QREFELT $ 36)) . #2#)
          (LETT |i| (SPADCALL |y| (QREFELT $ 18)) . #2#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |rk| 0 (QREFELT $ 27))
                    (|IMATLIN;rowAllZeroes?| |y| |i| $))
                   ('T NIL)))
                 (GO G191)))
               (SEQ (LETT |i| (- |i| 1) . #2#)
                    (EXIT
                     (LETT |rk|
                           (PROG1 (LETT #1# (- |rk| 1) . #2#)
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |rk|)))) 

(SDEFUN |IMATLIN;nullity;MNni;14| ((|x| M) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G922 NIL))
               (PROG1
                   (LETT #1#
                         (- (SPADCALL |x| (QREFELT $ 48))
                            (SPADCALL |x| (QREFELT $ 50)))
                         |IMATLIN;nullity;MNni;14|)
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |IMATLIN;generalizedInverse;2M;15| ((|x| M) ($ M))
        (SPROG
         ((|yy| (|Matrix| FSUP)) (#1=#:G931 NIL) (|var| (|Fraction| SUP))
          (|nc| (|NonNegativeInteger|)) (|ty| (|Matrix| FSUP))
          (|y| (|Matrix| FSUP))
          (MATCAT22
           (CATEGORY |package|
            (SIGNATURE |map| (M (|Mapping| R FSUP) #2=(|Matrix| FSUP)))
            (SIGNATURE |map|
             ((|Union| M . #3=("failed"))
              (|Mapping| (|Union| R . #4=("failed")) FSUP) #2#))
            (SIGNATURE |reduce| (R (|Mapping| R FSUP R) #2# R))))
          (MATCAT2
           (CATEGORY |package|
            (SIGNATURE |map| (#5=(|Matrix| FSUP) (|Mapping| FSUP R) M))
            (SIGNATURE |map|
             ((|Union| #5# . #3#) (|Mapping| (|Union| FSUP . #4#) R) M))
            (SIGNATURE |reduce| (FSUP (|Mapping| FSUP R FSUP) M FSUP))))
          (VFSUP
           (|Join| (|VectorCategory| FSUP)
                   (CATEGORY |domain| (SIGNATURE |vector| ($ (|List| FSUP))))))
          (FSUP
           (|Join| (|QuotientFieldCategory| SUP)
                   (CATEGORY |package|
                    (IF (|has| SUP (|IntegerNumberSystem|))
                        (IF (|has| SUP (|OpenMath|))
                            (ATTRIBUTE (|OpenMath|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| SUP (|Canonical|))
                        (IF (|has| SUP (|GcdDomain|))
                            (IF (|has| SUP (|canonicalUnitNormal|))
                                (ATTRIBUTE (|Canonical|))
                                |noBranch|)
                            |noBranch|)
                        |noBranch|))))
          (SUP
           (|Join| (|UnivariatePolynomialCategory| R)
                   (CATEGORY |domain|
                    (SIGNATURE |outputForm|
                     ((|OutputForm|) $ (|OutputForm|)))))))
         (SEQ
          (LETT SUP (|SparseUnivariatePolynomial| (QREFELT $ 6))
                . #6=(|IMATLIN;generalizedInverse;2M;15|))
          (LETT FSUP (|Fraction| SUP) . #6#) (LETT VFSUP (|Vector| FSUP) . #6#)
          (LETT MATCAT2
                (|MatrixCategoryFunctions2| (QREFELT $ 6) (QREFELT $ 7)
                                            (QREFELT $ 8) (QREFELT $ 9) FSUP
                                            VFSUP VFSUP (|Matrix| FSUP))
                . #6#)
          (LETT MATCAT22
                (|MatrixCategoryFunctions2| FSUP VFSUP VFSUP (|Matrix| FSUP)
                                            (QREFELT $ 6) (QREFELT $ 7)
                                            (QREFELT $ 8) (QREFELT $ 9))
                . #6#)
          (LETT |y|
                (SPADCALL
                 (CONS #'|IMATLIN;generalizedInverse;2M;15!0|
                       (VECTOR FSUP SUP $))
                 |x|
                 (|compiledLookupCheck| '|map|
                                        (LIST
                                         (LIST '|Matrix| (|devaluate| FSUP))
                                         (LIST '|Mapping| (|devaluate| FSUP)
                                               (|devaluate| (ELT $ 6)))
                                         (|devaluate| (ELT $ 9)))
                                        MATCAT2))
                . #6#)
          (LETT |ty|
                (SPADCALL |y|
                          (|compiledLookupCheck| '|transpose| (LIST '$ '$)
                                                 (|Matrix| FSUP)))
                . #6#)
          (LETT |yy|
                (SPADCALL |ty| |y|
                          (|compiledLookupCheck| '* (LIST '$ '$ '$)
                                                 (|Matrix| FSUP)))
                . #6#)
          (LETT |nc| (ANCOLS |yy|) . #6#)
          (LETT |var|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 30) 1
                           (|compiledLookupCheck| '|monomial|
                                                  (LIST '$
                                                        (|devaluate| (ELT $ 6))
                                                        (LIST
                                                         '|NonNegativeInteger|))
                                                  SUP))
                 (|compiledLookupCheck| '|coerce| (LIST '$ (|devaluate| SUP))
                                        (|Fraction| SUP)))
                . #6#)
          (LETT |yy|
                (SPADCALL
                 (PROG2
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL |yy|
                                      (SPADCALL (ANCOLS |yy|) |var|
                                                (|compiledLookupCheck|
                                                 '|scalarMatrix|
                                                 (LIST '$
                                                       (LIST
                                                        '|NonNegativeInteger|)
                                                       (|devaluate| FSUP))
                                                 (|Matrix| FSUP)))
                                      (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                                             (|Matrix| FSUP)))
                            (|compiledLookupCheck| '|inverse|
                                                   (LIST
                                                    (LIST '|Union| '$
                                                          '#7="failed")
                                                    '$)
                                                   (|Matrix| FSUP)))
                           . #6#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|Matrix| FSUP)
                                   (|Union| (|Matrix| FSUP) #7#) #1#))
                 |ty|
                 (|compiledLookupCheck| '* (LIST '$ '$ '$) (|Matrix| FSUP)))
                . #6#)
          (EXIT
           (SPADCALL
            (CONS #'|IMATLIN;generalizedInverse;2M;15!1| (VECTOR SUP $)) |yy|
            (|compiledLookupCheck| '|map|
                                   (LIST (|devaluate| (ELT $ 9))
                                         (LIST '|Mapping|
                                               (|devaluate| (ELT $ 6))
                                               (|devaluate| FSUP))
                                         (LIST '|Matrix| (|devaluate| FSUP)))
                                   MATCAT22)))))) 

(SDEFUN |IMATLIN;generalizedInverse;2M;15!1| ((|z1| NIL) ($$ NIL))
        (PROG ($ SUP)
          (LETT $ (QREFELT $$ 1) . #1=(|IMATLIN;generalizedInverse;2M;15|))
          (LETT SUP (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1| (|spadConstant| $ 14)
                      (|compiledLookupCheck| '|elt|
                                             (LIST (|devaluate| (ELT $ 6))
                                                   (LIST '|Fraction| '$)
                                                   (|devaluate| (ELT $ 6)))
                                             SUP)))))) 

(SDEFUN |IMATLIN;generalizedInverse;2M;15!0| ((|r1| NIL) ($$ NIL))
        (PROG ($ SUP FSUP)
          (LETT $ (QREFELT $$ 2) . #1=(|IMATLIN;generalizedInverse;2M;15|))
          (LETT SUP (QREFELT $$ 1) . #1#)
          (LETT FSUP (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |r1|
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (|devaluate| (ELT $ 6)))
                                              SUP))
             (|compiledLookupCheck| '|coerce| (LIST '$ (|devaluate| SUP))
                                    FSUP)))))) 

(SDEFUN |IMATLIN;inverse;MU;16| ((|x| M) ($ |Union| M "failed"))
        (SPROG
         ((AB (M)) (#1=#:G952 NIL) (|j| NIL) (#2=#:G953 NIL) (|l| NIL)
          (#3=#:G950 NIL) (|i| NIL) (#4=#:G951 NIL) (|k| NIL)
          (|lmax| #5=(|Integer|)) (|lmin| #6=(|Integer|)) (|kmax| #5#)
          (|kmin| #7=(|Integer|)) (|maxC| (|Integer|)) (|minC| #6#)
          (|maxR| (|Integer|)) (|minR| #7#) (|detinv| (R)) (|det| (R))
          (|ans2| (M)) (|ndim| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |ndim| (SPADCALL |x| (QREFELT $ 47))
                   . #8=(|IMATLIN;inverse;MU;16|))
             (SPADCALL |x| (QREFELT $ 48)) (QREFELT $ 43))
            (|error| "inverse: matrix must be square"))
           ((EQL |ndim| 0) (CONS 0 |x|))
           ((EQL |ndim| 2)
            (SEQ (LETT |ans2| (SPADCALL |ndim| |ndim| (QREFELT $ 53)) . #8#)
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |det|
                           (SPADCALL
                            (SPADCALL (SPADCALL |x| 1 1 (QREFELT $ 54))
                                      (SPADCALL |x| 2 2 (QREFELT $ 54))
                                      (QREFELT $ 19))
                            (SPADCALL (SPADCALL |x| 1 2 (QREFELT $ 54))
                                      (SPADCALL |x| 2 1 (QREFELT $ 54))
                                      (QREFELT $ 19))
                            (QREFELT $ 20))
                           . #8#)
                     (QREFELT $ 55))
                    (CONS 1 "failed"))
                   (#9='T
                    (SEQ (LETT |detinv| (SPADCALL |det| (QREFELT $ 34)) . #8#)
                         (SPADCALL |ans2| 1 1
                                   (SPADCALL (SPADCALL |x| 2 2 (QREFELT $ 54))
                                             |detinv| (QREFELT $ 19))
                                   (QREFELT $ 56))
                         (SPADCALL |ans2| 1 2
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |x| 1 2 (QREFELT $ 54))
                                              |detinv| (QREFELT $ 19))
                                    (QREFELT $ 40))
                                   (QREFELT $ 56))
                         (SPADCALL |ans2| 2 1
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |x| 2 1 (QREFELT $ 54))
                                              |detinv| (QREFELT $ 19))
                                    (QREFELT $ 40))
                                   (QREFELT $ 56))
                         (SPADCALL |ans2| 2 2
                                   (SPADCALL (SPADCALL |x| 1 1 (QREFELT $ 54))
                                             |detinv| (QREFELT $ 19))
                                   (QREFELT $ 56))
                         (EXIT (CONS 0 |ans2|))))))))
           (#9#
            (SEQ
             (LETT AB (SPADCALL |ndim| (+ |ndim| |ndim|) (QREFELT $ 53)) . #8#)
             (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #8#)
             (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #8#)
             (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #8#)
             (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #8#)
             (LETT |kmin| (SPADCALL AB (QREFELT $ 17)) . #8#)
             (LETT |kmax| (- (+ |kmin| |ndim|) 1) . #8#)
             (LETT |lmin| (SPADCALL AB (QREFELT $ 11)) . #8#)
             (LETT |lmax| (- (+ |lmin| |ndim|) 1) . #8#)
             (SEQ (LETT |k| |kmin| . #8#) (LETT #4# |kmax| . #8#)
                  (LETT |i| |minR| . #8#) (LETT #3# |maxR| . #8#) G190
                  (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                  (SEQ
                   (SEQ (LETT |l| |lmin| . #8#) (LETT #2# |lmax| . #8#)
                        (LETT |j| |minC| . #8#) (LETT #1# |maxC| . #8#) G190
                        (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL AB |k| |l|
                                    (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                    (QREFELT $ 46))))
                        (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #8#))
                              . #8#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (SPADCALL AB |k| (- (+ (+ |lmin| |ndim|) |k|) |kmin|)
                              (|spadConstant| $ 30) (QREFELT $ 46))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #8#)) . #8#)
                  (GO G190) G191 (EXIT NIL))
             (LETT AB (SPADCALL AB (QREFELT $ 36)) . #8#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL AB |kmax| |lmax| (QREFELT $ 54))
                          (|spadConstant| $ 14) (QREFELT $ 35))
                (CONS 1 "failed"))
               (#9#
                (CONS 0
                      (SPADCALL AB |kmin| |kmax| (+ |lmin| |ndim|)
                                (+ |lmax| |ndim|) (QREFELT $ 57)))))))))))) 

(DECLAIM (NOTINLINE |InnerMatrixLinearAlgebraFunctions;|)) 

(DEFUN |InnerMatrixLinearAlgebraFunctions| (&REST #1=#:G954)
  (SPROG NIL
         (PROG (#2=#:G955)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerMatrixLinearAlgebraFunctions|)
                                               '|domainEqualList|)
                    . #3=(|InnerMatrixLinearAlgebraFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |InnerMatrixLinearAlgebraFunctions;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InnerMatrixLinearAlgebraFunctions|)))))))))) 

(DEFUN |InnerMatrixLinearAlgebraFunctions;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerMatrixLinearAlgebraFunctions|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|InnerMatrixLinearAlgebraFunctions| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 60) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|shallowlyMutable|))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|InnerMatrixLinearAlgebraFunctions|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|domainEqual| |#4| (|Matrix| |#1|))
      (PROGN
       (QSETREFV $ 22
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_base;M4IRV;3|) $))
       (QSETREFV $ 23
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_modular;M4IRIV;4|)
                  $))
       (QSETREFV $ 36 (CONS (|dispatchFunction| |IMATLIN;rowEchelon;2M;5|) $))
       (COND
        ((|testBitVector| |pv$| 1)
         (QSETREFV $ 42
                   (CONS (|dispatchFunction| |IMATLIN;nullSpace;ML;6|) $))))
       (QSETREFV $ 45
                 (CONS (|dispatchFunction| |IMATLIN;determinant;MR;7|) $))))
     ('T
      (PROGN
       (QSETREFV $ 22
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_base;M4IRV;8|) $))
       (QSETREFV $ 23
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_modular;M4IRIV;9|)
                  $))
       (QSETREFV $ 36 (CONS (|dispatchFunction| |IMATLIN;rowEchelon;2M;10|) $))
       (COND
        ((|testBitVector| |pv$| 1)
         (QSETREFV $ 42
                   (CONS (|dispatchFunction| |IMATLIN;nullSpace;ML;11|) $))))
       (QSETREFV $ 45
                 (CONS (|dispatchFunction| |IMATLIN;determinant;MR;12|) $)))))
    $))) 

(MAKEPROP '|InnerMatrixLinearAlgebraFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minColIndex|)
              (5 . |maxColIndex|) (10 . |qelt|) (17 . |Zero|) (|Boolean|)
              (21 . ~=) (27 . |minRowIndex|) (32 . |maxRowIndex|) (37 . *)
              (43 . -) (|Void|) (49 . |row_operation_base|)
              (59 . |row_operation_modular|) (|NonNegativeInteger|)
              (70 . |characteristic|) (74 . |Zero|) (78 . >) (84 . <)
              (90 . |copy|) (95 . |One|) (99 . >) (105 . ~=)
              (111 . |swapRows!|) (118 . |inv|) (123 . =) (129 . |rowEchelon|)
              (134 . <=) (140 . |new|) (146 . |qsetelt!|) (153 . -) (|List| 8)
              (158 . |nullSpace|) (163 . ~=) (169 . +) (175 . |determinant|)
              (180 . |qsetelt!|) (188 . |nrows|) (193 . |ncols|)
              (198 . |transpose|) |IMATLIN;rank;MNni;13|
              |IMATLIN;nullity;MNni;14| |IMATLIN;generalizedInverse;2M;15|
              (203 . |zero|) (209 . |elt|) (216 . |zero?|) (221 . |setelt!|)
              (229 . |subMatrix|) (|Union| 9 '"failed")
              |IMATLIN;inverse;MU;16|)
           '#(|row_operation_modular| 238 |row_operation_base| 249 |rowEchelon|
              259 |rank| 264 |nullity| 269 |nullSpace| 274 |inverse| 279
              |generalizedInverse| 284 |determinant| 289)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 59
                                                 '(1 9 10 0 11 1 9 10 0 12 3 9
                                                   6 0 10 10 13 0 6 0 14 2 6 15
                                                   0 0 16 1 9 10 0 17 1 9 10 0
                                                   18 2 6 0 0 0 19 2 6 0 0 0 20
                                                   6 0 21 9 10 10 10 10 6 22 7
                                                   0 21 9 10 10 10 10 6 10 23 0
                                                   6 24 25 0 24 0 26 2 24 15 0
                                                   0 27 2 24 15 0 0 28 1 9 0 0
                                                   29 0 6 0 30 2 10 15 0 0 31 2
                                                   10 15 0 0 32 3 9 0 0 10 10
                                                   33 1 6 0 0 34 2 6 15 0 0 35
                                                   1 0 9 9 36 2 24 15 0 0 37 2
                                                   8 0 24 6 38 3 8 6 0 10 6 39
                                                   1 6 0 0 40 1 0 41 9 42 2 24
                                                   15 0 0 43 2 6 0 0 0 44 1 0 6
                                                   9 45 4 9 6 0 10 10 6 46 1 9
                                                   24 0 47 1 9 24 0 48 1 9 0 0
                                                   49 2 9 0 24 24 53 3 9 6 0 10
                                                   10 54 1 6 15 0 55 4 9 6 0 10
                                                   10 6 56 5 9 0 0 10 10 10 10
                                                   57 7 0 21 9 10 10 10 10 6 10
                                                   23 6 0 21 9 10 10 10 10 6 22
                                                   1 0 9 9 36 1 0 24 9 50 1 0
                                                   24 9 51 1 1 41 9 42 1 0 58 9
                                                   59 1 0 9 9 52 1 0 6 9
                                                   45)))))
           '|lookupComplete|)) 
