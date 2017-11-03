
(SDEFUN |SGCF;numberOfImproperPartitionsInternal|
        ((|n| |Integer|) (|m| |Integer|) (|cm| |Integer|) ($ |Integer|))
        (SPROG ((|s| (|Integer|)) (#1=#:G709 NIL) (|i| NIL))
               (SEQ
                (COND ((EQL |n| 0) (SPADCALL |m| |cm| (QREFELT $ 8)))
                      ('T
                       (SEQ
                        (COND
                         ((EQL |cm| 0)
                          (COND ((SPADCALL |n| 0 (QREFELT $ 10)) (EXIT 0)))))
                        (LETT |s| 0
                              . #2=(|SGCF;numberOfImproperPartitionsInternal|))
                        (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (+ |s|
                                        (|SGCF;numberOfImproperPartitionsInternal|
                                         |i| |m| (- |cm| 1) $))
                                     . #2#)))
                             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |s|))))))) 

(SDEFUN |SGCF;numberOfImproperPartitions;3I;2|
        ((|n| |Integer|) (|m| |Integer|) ($ |Integer|))
        (SPROG ((|s| (|Integer|)) (#1=#:G714 NIL) (|i| NIL) (#2=#:G713 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((OR (< |n| 0) (< |m| 1))
                    (PROGN
                     (LETT #2# 0 . #3=(|SGCF;numberOfImproperPartitions;3I;2|))
                     (GO #4=#:G712))))
                  (COND
                   ((OR (EQL |m| 1) (EQL |n| 0))
                    (PROGN (LETT #2# 1 . #3#) (GO #4#))))
                  (LETT |s| 0 . #3#)
                  (SEQ (LETT |i| 0 . #3#) (LETT #1# |n| . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |s|
                               (+ |s|
                                  (SPADCALL (- |n| |i|) (- |m| 1)
                                            (QREFELT $ 11)))
                               . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |s|)))
                #4# (EXIT #2#)))) 

(SDEFUN |SGCF;unrankImproperPartitions0;3IL;3|
        ((|n| |Integer|) (|m| |Integer|) (|k| |Integer|)
         ($ |List| (|Integer|)))
        (SPROG
         ((|l| (|List| (|Integer|))) (#1=#:G732 NIL) (|s| #2=(|Integer|))
          (|sOld| #2#) (#3=#:G734 NIL) (|y| NIL) (#4=#:G733 NIL) (|t| NIL))
         (SEQ (LETT |l| NIL . #5=(|SGCF;unrankImproperPartitions0;3IL;3|))
              (EXIT
               (COND
                ((< |k| 0) (|error| "counting of partitions is started at 0"))
                ((>= |k| (SPADCALL |n| |m| (QREFELT $ 11)))
                 (|error| "there are not so many partitions"))
                ('T
                 (SEQ
                  (SEQ (LETT |t| 0 . #5#) (LETT #4# (- |m| 2) . #5#) G190
                       (COND ((|greater_SI| |t| #4#) (GO G191)))
                       (SEQ (LETT |s| 0 . #5#)
                            (SEQ
                             (EXIT
                              (SEQ (LETT |y| 0 . #5#) (LETT #3# |n| . #5#) G190
                                   (COND ((|greater_SI| |y| #3#) (GO G191)))
                                   (SEQ (LETT |sOld| |s| . #5#)
                                        (LETT |s|
                                              (+ |s|
                                                 (SPADCALL (- |n| |y|)
                                                           (- (- |m| |t|) 1)
                                                           (QREFELT $ 11)))
                                              . #5#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |s| |k| (QREFELT $ 10))
                                           (PROGN
                                            (LETT #1# |$NoValue| . #5#)
                                            (GO #6=#:G721))))))
                                   (LETT |y| (|inc_SI| |y|) . #5#) (GO G190)
                                   G191 (EXIT NIL)))
                             #6# (EXIT #1#))
                            (LETT |l|
                                  (SPADCALL |l| (SPADCALL |y| (QREFELT $ 13))
                                            (QREFELT $ 14))
                                  . #5#)
                            (LETT |k| (- |k| |sOld|) . #5#)
                            (EXIT (LETT |n| (- |n| |y|) . #5#)))
                       (LETT |t| (|inc_SI| |t|) . #5#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |l|
                        (SPADCALL |l| (SPADCALL |n| (QREFELT $ 13))
                                  (QREFELT $ 14))
                        . #5#)
                  (EXIT |l|)))))))) 

(SDEFUN |SGCF;unrankImproperPartitions1;3IL;4|
        ((|n| |Integer|) (|m| . #1=(|Integer|)) (|k| |Integer|)
         ($ |List| (|Integer|)))
        (SPROG
         ((#2=#:G755 NIL) (|i| NIL) (|nonZeroPos| (|List| (|Integer|)))
          (|nonZeros| (|List| (|Integer|))) (#3=#:G754 NIL)
          (|s| #4=(|Integer|)) (|sOld| #4#) (|y| NIL) (|cm| #1#)
          (|partition| (|Vector| (|Integer|))) (#5=#:G736 NIL))
         (SEQ
          (LETT |nonZeros| NIL . #6=(|SGCF;unrankImproperPartitions1;3IL;4|))
          (LETT |partition|
                (MAKEARR1
                 (PROG1 (LETT #5# |m| . #6#)
                   (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #5#))
                 0)
                . #6#)
          (EXIT
           (COND
            ((OR (< |k| 0) (>= |k| (SPADCALL |n| |m| (QREFELT $ 11))))
             |nonZeros|)
            ('T
             (SEQ (LETT |cm| |m| . #6#)
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL |n| 0 (QREFELT $ 16))) (GO G191)))
                       (SEQ (LETT |s| 0 . #6#) (LETT |cm| (- |cm| 1) . #6#)
                            (SEQ
                             (EXIT
                              (SEQ (LETT |y| |n| . #6#) G190
                                   (COND ((< |y| 1) (GO G191)))
                                   (SEQ (LETT |sOld| |s| . #6#)
                                        (LETT |s|
                                              (+ |s|
                                                 (|SGCF;numberOfImproperPartitionsInternal|
                                                  (- |n| |y|) |m| |cm| $))
                                              . #6#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |s| |k| (QREFELT $ 10))
                                           (PROGN
                                            (LETT #3# |$NoValue| . #6#)
                                            (GO #7=#:G738))))))
                                   (LETT |y| (+ |y| -1) . #6#) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #3#))
                            (LETT |nonZeros|
                                  (SPADCALL |nonZeros|
                                            (SPADCALL |y| (QREFELT $ 13))
                                            (QREFELT $ 14))
                                  . #6#)
                            (LETT |k| (- |k| |sOld|) . #6#)
                            (EXIT (LETT |n| (- |n| |y|) . #6#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |nonZeroPos|
                        (REVERSE
                         (SPADCALL |m| (- |m| |cm|) |k| (QREFELT $ 17)))
                        . #6#)
                  (SEQ (LETT |i| 1 . #6#) (LETT #2# (- |m| |cm|) . #6#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |partition|
                                   (+ 1
                                      (SPADCALL |nonZeroPos| |i|
                                                (QREFELT $ 18)))
                                   (SPADCALL |nonZeros| |i| (QREFELT $ 18))
                                   (QREFELT $ 20))))
                       (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (SPADCALL |partition| (QREFELT $ 21)))))))))) 

(SDEFUN |SGCF;subSet;3IL;5|
        ((|n| |Integer|) (|m| . #1=(|Integer|)) (|k| . #2=(|Integer|))
         ($ |List| (|Integer|)))
        (SPROG
         ((|s| #1#) (|mm| #2#) (|l| (|List| (|Integer|))) (#3=#:G764 NIL)
          (#4=#:G766 NIL) (|y| NIL) (#5=#:G765 NIL) (|t| NIL)
          (|bin| (|Integer|)))
         (SEQ
          (COND
           ((OR (OR (OR (< |k| 0) (< |n| 0)) (< |m| 0))
                (SPADCALL |m| |n| (QREFELT $ 10)))
            (|error| "improper argument to subSet"))
           ('T
            (SEQ
             (LETT |bin| (SPADCALL |n| |m| (QREFELT $ 8))
                   . #6=(|SGCF;subSet;3IL;5|))
             (EXIT
              (COND ((>= |k| |bin|) (|error| "there are not so many subsets"))
                    (#7='T
                     (SEQ (LETT |l| NIL . #6#)
                          (EXIT
                           (COND ((EQL |n| 0) |l|)
                                 (#7#
                                  (SEQ (LETT |mm| |k| . #6#)
                                       (LETT |s| |m| . #6#)
                                       (SEQ (LETT |t| 0 . #6#)
                                            (LETT #5# (- |m| 1) . #6#) G190
                                            (COND
                                             ((|greater_SI| |t| #5#)
                                              (GO G191)))
                                            (SEQ
                                             (SEQ
                                              (EXIT
                                               (SEQ (LETT |y| (- |s| 1) . #6#)
                                                    (LETT #4# (+ |n| 1) . #6#)
                                                    G190
                                                    (COND
                                                     ((> |y| #4#) (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((SPADCALL
                                                         (SPADCALL |y| |s|
                                                                   (QREFELT $
                                                                            8))
                                                         |mm| (QREFELT $ 10))
                                                        (PROGN
                                                         (LETT #3# |$NoValue|
                                                               . #6#)
                                                         (GO #8=#:G757))))))
                                                    (LETT |y| (+ |y| 1) . #6#)
                                                    (GO G190) G191 (EXIT NIL)))
                                              #8# (EXIT #3#))
                                             (LETT |l|
                                                   (SPADCALL |l|
                                                             (SPADCALL
                                                              (- |y| 1)
                                                              (QREFELT $ 13))
                                                             (QREFELT $ 14))
                                                   . #6#)
                                             (LETT |mm|
                                                   (- |mm|
                                                      (SPADCALL (- |y| 1) |s|
                                                                (QREFELT $ 8)))
                                                   . #6#)
                                             (EXIT (LETT |s| (- |s| 1) . #6#)))
                                            (LETT |t| (|inc_SI| |t|) . #6#)
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT |l|))))))))))))))) 

(SDEFUN |SGCF;nextLatticePermutation;2LBL;6|
        ((|lambda| |List| #1=(|Integer|)) (|lattP| |List| (|Integer|))
         (|constructNotFirst| |Boolean|) ($ |List| (|Integer|)))
        (SPROG
         ((#2=#:G797 NIL) (|l| NIL) (|i| NIL)
          (|rightPosition| #3=(|NonNegativeInteger|)) (#4=#:G785 NIL)
          (|j| (|NonNegativeInteger|)) (#5=#:G796 NIL) (|ready| (|Boolean|))
          (|leftEntry| #6=(|NonNegativeInteger|)) (#7=#:G777 NIL)
          (|rightEntry| #6#) (#8=#:G795 NIL) (#9=#:G776 NIL)
          (|help| (|Vector| (|Integer|))) (|n| #3#) (#10=#:G775 NIL)
          (#11=#:G773 NIL) (#12=#:G772 #1#) (#13=#:G774 #1#) (#14=#:G794 NIL)
          (#15=#:G690 NIL) (|rows| (|NonNegativeInteger|)) (#16=#:G768 NIL)
          (|columns| (|NonNegativeInteger|)) (#17=#:G767 NIL)
          (|lprime| (|List| (|Integer|))))
         (SEQ
          (LETT |lprime| (SPADCALL |lambda| (QREFELT $ 24))
                . #18=(|SGCF;nextLatticePermutation;2LBL;6|))
          (LETT |columns|
                (PROG1 (LETT #17# (|SPADfirst| |lambda|) . #18#)
                  (|check_subtype2| (>= #17# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #17#))
                . #18#)
          (LETT |rows|
                (PROG1 (LETT #16# (|SPADfirst| |lprime|) . #18#)
                  (|check_subtype2| (>= #16# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #16#))
                . #18#)
          (LETT |n|
                (PROG1
                    (LETT #10#
                          (PROGN
                           (LETT #11# NIL . #18#)
                           (SEQ (LETT #15# NIL . #18#)
                                (LETT #14# |lambda| . #18#) G190
                                (COND
                                 ((OR (ATOM #14#)
                                      (PROGN
                                       (LETT #15# (CAR #14#) . #18#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #13# #15# . #18#)
                                   (COND
                                    (#11# (LETT #12# (+ #12# #13#) . #18#))
                                    ('T
                                     (PROGN
                                      (LETT #12# #13# . #18#)
                                      (LETT #11# 'T . #18#)))))))
                                (LETT #14# (CDR #14#) . #18#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#11# #12#) (#19='T 0)))
                          . #18#)
                  (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #10#))
                . #18#)
          (EXIT
           (COND
            (|constructNotFirst|
             (SEQ (LETT |help| (MAKEARR1 |columns| 0) . #18#)
                  (LETT |rightPosition| |n| . #18#)
                  (LETT |leftEntry|
                        (PROG1
                            (LETT #9#
                                  (SPADCALL |lattP| |rightPosition|
                                            (QREFELT $ 18))
                                  . #18#)
                          (|check_subtype2| (>= #9# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #9#))
                        . #18#)
                  (LETT |ready| NIL . #18#)
                  (SEQ (LETT #8# NIL . #18#) G190 (COND (#8# (GO G191)))
                       (SEQ (LETT |rightEntry| |leftEntry| . #18#)
                            (LETT |leftEntry|
                                  (PROG1
                                      (LETT #7#
                                            (SPADCALL |lattP|
                                                      (- |rightPosition| 1)
                                                      (QREFELT $ 18))
                                            . #18#)
                                    (|check_subtype2| (>= #7# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #7#))
                                  . #18#)
                            (SPADCALL |help| |rightEntry|
                                      (+
                                       (SPADCALL |help| |rightEntry|
                                                 (QREFELT $ 25))
                                       1)
                                      (QREFELT $ 20))
                            (COND
                             ((SPADCALL |rightEntry| |leftEntry|
                                        (QREFELT $ 27))
                              (COND
                               ((SPADCALL
                                 (-
                                  (SPADCALL |lprime| |leftEntry|
                                            (QREFELT $ 18))
                                  (SPADCALL |help| |leftEntry| (QREFELT $ 25)))
                                 (+
                                  (-
                                   (SPADCALL |lprime| |rightEntry|
                                             (QREFELT $ 18))
                                   (SPADCALL |help| |rightEntry|
                                             (QREFELT $ 25)))
                                  1)
                                 (QREFELT $ 10))
                                (SEQ (LETT |ready| 'T . #18#)
                                     (LETT |j| (+ |leftEntry| 1) . #18#)
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (COND
                                              ((EQL
                                                (SPADCALL |help| |j|
                                                          (QREFELT $ 25))
                                                0)
                                               'T)
                                              ('T
                                               (<
                                                (-
                                                 (SPADCALL |lprime| |leftEntry|
                                                           (QREFELT $ 18))
                                                 (SPADCALL |lprime| |j|
                                                           (QREFELT $ 18)))
                                                (+
                                                 (-
                                                  (SPADCALL |help| |leftEntry|
                                                            (QREFELT $ 25))
                                                  (SPADCALL |help| |j|
                                                            (QREFELT $ 25)))
                                                 2)))))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT (LETT |j| (+ |j| 1) . #18#)))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (SPADCALL |lattP| (- |rightPosition| 1)
                                               |j| (QREFELT $ 28))
                                     (SPADCALL |help| |j|
                                               (-
                                                (SPADCALL |help| |j|
                                                          (QREFELT $ 25))
                                                1)
                                               (QREFELT $ 20))
                                     (SPADCALL |help| |leftEntry|
                                               (+
                                                (SPADCALL |help| |leftEntry|
                                                          (QREFELT $ 25))
                                                1)
                                               (QREFELT $ 20))
                                     (EXIT
                                      (SEQ (LETT |l| |rightPosition| . #18#)
                                           (LETT #5# |n| . #18#) G190
                                           (COND ((> |l| #5#) (GO G191)))
                                           (SEQ (LETT |j| 0 . #18#)
                                                (SEQ G190
                                                     (COND
                                                      ((NULL
                                                        (EQL
                                                         (SPADCALL |help|
                                                                   (+ 1 |j|)
                                                                   (QREFELT $
                                                                            25))
                                                         0))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT |j| (+ |j| 1)
                                                             . #18#)))
                                                     NIL (GO G190) G191
                                                     (EXIT NIL))
                                                (SPADCALL |lattP| |l| (+ |j| 1)
                                                          (QREFELT $ 28))
                                                (EXIT
                                                 (SPADCALL |help| (+ 1 |j|)
                                                           (-
                                                            (SPADCALL |help|
                                                                      (+ 1 |j|)
                                                                      (QREFELT
                                                                       $ 25))
                                                            1)
                                                           (QREFELT $ 20))))
                                           (LETT |l| (+ |l| 1) . #18#)
                                           (GO G190) G191 (EXIT NIL))))))))
                            (LETT |rightPosition|
                                  (PROG1
                                      (LETT #4# (- |rightPosition| 1) . #18#)
                                    (|check_subtype2| (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #4#))
                                  . #18#)
                            (EXIT
                             (COND
                              ((EQL |rightPosition| 1)
                               (LETT |constructNotFirst| NIL . #18#)))))
                       (LETT #8#
                             (COND ((OR |ready| (NULL |constructNotFirst|)) 'T)
                                   ('T NIL))
                             . #18#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (COND (|constructNotFirst| |lattP|) (#19# NIL)))))
            (#19#
             (SEQ (LETT |lattP| NIL . #18#)
                  (SEQ (LETT |i| |columns| . #18#) G190
                       (COND ((< |i| 1) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |l| 1 . #18#)
                              (LETT #2# (SPADCALL |lprime| |i| (QREFELT $ 18))
                                    . #18#)
                              G190 (COND ((|greater_SI| |l| #2#) (GO G191)))
                              (SEQ
                               (EXIT (LETT |lattP| (CONS |i| |lattP|) . #18#)))
                              (LETT |l| (|inc_SI| |l|) . #18#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT |i| (+ |i| -1) . #18#) (GO G190) G191 (EXIT NIL))
                  (EXIT |lattP|)))))))) 

(SDEFUN |SGCF;makeYoungTableau;2LM;7|
        ((|lambda| |List| (|Integer|)) (|gitter| |List| (|Integer|))
         ($ |Matrix| (|Integer|)))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G805 NIL) (|l| NIL)
          (|help| (|Vector| (|Integer|))) (|ytab| (|Matrix| (|Integer|)))
          (|rows| (|NonNegativeInteger|)) (#2=#:G800 NIL)
          (|columns| (|NonNegativeInteger|)) (#3=#:G799 NIL)
          (|lprime| (|List| (|Integer|))))
         (SEQ
          (LETT |lprime| (SPADCALL |lambda| (QREFELT $ 24))
                . #4=(|SGCF;makeYoungTableau;2LM;7|))
          (LETT |columns|
                (PROG1 (LETT #3# (|SPADfirst| |lambda|) . #4#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #4#)
          (LETT |rows|
                (PROG1 (LETT #2# (|SPADfirst| |lprime|) . #4#)
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))
                . #4#)
          (LETT |ytab| (MAKE_MATRIX1 |rows| |columns| 0) . #4#)
          (LETT |help| (MAKEARR1 |columns| 1) . #4#) (LETT |i| -1 . #4#)
          (LETT |j| 0 . #4#)
          (SEQ (LETT |l| 1 . #4#)
               (LETT #1# (SPADCALL |gitter| (QREFELT $ 30)) . #4#) G190
               (COND ((|greater_SI| |l| #1#) (GO G191)))
               (SEQ (LETT |j| (SPADCALL |gitter| |l| (QREFELT $ 18)) . #4#)
                    (LETT |i| (+ |i| 1) . #4#)
                    (SPADCALL |ytab| (SPADCALL |help| |j| (QREFELT $ 25)) |j|
                              |i| (QREFELT $ 32))
                    (EXIT
                     (SPADCALL |help| |j|
                               (+ (SPADCALL |help| |j| (QREFELT $ 25)) 1)
                               (QREFELT $ 20))))
               (LETT |l| (|inc_SI| |l|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |ytab|)))) 

(SDEFUN |SGCF;listYoungTableaus;LL;8|
        ((|lambda| |List| (|Integer|)) ($ |List| (|Matrix| (|Integer|))))
        (SPROG
         ((|lattice| (|List| (|Integer|)))
          (|younglist| (|List| (|Matrix| (|Integer|))))
          (|ytab| (|Matrix| (|Integer|))) (#1=#:G810 NIL))
         (SEQ (LETT |younglist| NIL . #2=(|SGCF;listYoungTableaus;LL;8|))
              (LETT |lattice| (SPADCALL |lambda| |lattice| NIL (QREFELT $ 29))
                    . #2#)
              (SEQ (LETT #1# NIL . #2#) G190 (COND (#1# (GO G191)))
                   (SEQ
                    (LETT |ytab| (SPADCALL |lambda| |lattice| (QREFELT $ 33))
                          . #2#)
                    (LETT |younglist|
                          (SPADCALL |younglist| (LIST |ytab|) (QREFELT $ 35))
                          . #2#)
                    (EXIT
                     (LETT |lattice|
                           (SPADCALL |lambda| |lattice| 'T (QREFELT $ 29))
                           . #2#)))
                   (LETT #1# (NULL |lattice|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |younglist|)))) 

(SDEFUN |SGCF;nextColeman;2L2M;9|
        ((|alpha| |List| (|Integer|)) (|beta| |List| (|Integer|))
         (C |Matrix| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|vrest| #1=(|Vector| (|Integer|)))
          (|coleman| (|Matrix| (|Integer|))) (|succ| (|Vector| (|Integer|)))
          (#2=#:G826 NIL) (|i| (|NonNegativeInteger|)) (#3=#:G819 NIL)
          (|j| (|Integer|)) (#4=#:G812 NIL) (#5=#:G825 NIL) (#6=#:G811 NIL)
          (|cnull| (|Matrix| (|Integer|))) (|vzero| #1#)
          (|vnull| (|Vector| (|Integer|))) (|ncol| #7=(|NonNegativeInteger|))
          (|nrow| #7#))
         (SEQ
          (EXIT
           (SEQ (LETT |nrow| (LENGTH |beta|) . #8=(|SGCF;nextColeman;2L2M;9|))
                (LETT |ncol| (LENGTH |alpha|) . #8#)
                (LETT |vnull| (SPADCALL NIL (QREFELT $ 37)) . #8#)
                (LETT |vzero| (MAKEARR1 |ncol| 0) . #8#)
                (LETT |vrest| (MAKEARR1 |ncol| 0) . #8#)
                (LETT |cnull| (MAKE_MATRIX1 1 1 0) . #8#)
                (LETT |coleman| (SPADCALL C (QREFELT $ 38)) . #8#)
                (COND
                 ((SPADCALL |coleman| |cnull| (QREFELT $ 39))
                  (SEQ
                   (LETT |i|
                         (PROG1 (LETT #6# (- |nrow| 1) . #8#)
                           (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #6#))
                         . #8#)
                   (LETT |vrest|
                         (SPADCALL (SPADCALL |coleman| |i| (QREFELT $ 40))
                                   (SPADCALL |coleman| |nrow| (QREFELT $ 40))
                                   (QREFELT $ 41))
                         . #8#)
                   (LETT |succ|
                         (SPADCALL |vrest|
                                   (SPADCALL |coleman| |i| (QREFELT $ 40))
                                   (SPADCALL |beta| |i| (QREFELT $ 18))
                                   (QREFELT $ 42))
                         . #8#)
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |succ| |vnull| (QREFELT $ 43)))
                          (GO G191)))
                        (SEQ
                         (COND
                          ((EQL |i| 1)
                           (PROGN (LETT #5# |cnull| . #8#) (GO #9=#:G824))))
                         (LETT |i|
                               (PROG1 (LETT #4# (- |i| 1) . #8#)
                                 (|check_subtype2| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #4#))
                               . #8#)
                         (LETT |vrest|
                               (SPADCALL |vrest|
                                         (SPADCALL |coleman| |i|
                                                   (QREFELT $ 40))
                                         (QREFELT $ 41))
                               . #8#)
                         (EXIT
                          (LETT |succ|
                                (SPADCALL |vrest|
                                          (SPADCALL |coleman| |i|
                                                    (QREFELT $ 40))
                                          (SPADCALL |beta| |i| (QREFELT $ 18))
                                          (QREFELT $ 42))
                                . #8#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (LETT |j| |i| . #8#)
                   (LETT |coleman|
                         (SPADCALL |coleman| |i| |succ| (QREFELT $ 44)) . #8#)
                   (EXIT
                    (LETT |vrest|
                          (SPADCALL |vrest|
                                    (SPADCALL |coleman| |i| (QREFELT $ 40))
                                    (QREFELT $ 45))
                          . #8#))))
                 ('T
                  (SEQ (LETT |vrest| (SPADCALL |alpha| (QREFELT $ 37)) . #8#)
                       (LETT |coleman| (MAKE_MATRIX1 |nrow| |ncol| 0) . #8#)
                       (EXIT (LETT |j| 0 . #8#)))))
                (SEQ
                 (LETT |i|
                       (PROG1 (LETT #3# (+ |j| 1) . #8#)
                         (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #3#))
                       . #8#)
                 (LETT #2# (- |nrow| 1) . #8#) G190
                 (COND ((> |i| #2#) (GO G191)))
                 (SEQ
                  (LETT |succ|
                        (SPADCALL |vrest| |vnull|
                                  (SPADCALL |beta| |i| (QREFELT $ 18))
                                  (QREFELT $ 42))
                        . #8#)
                  (LETT |coleman|
                        (SPADCALL |coleman| |i| |succ| (QREFELT $ 44)) . #8#)
                  (EXIT
                   (LETT |vrest| (SPADCALL |vrest| |succ| (QREFELT $ 45))
                         . #8#)))
                 (LETT |i| (+ |i| 1) . #8#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |coleman| |nrow| |vrest| (QREFELT $ 44)))))
          #9# (EXIT #5#)))) 

(SDEFUN |SGCF;nextPartition;2VIV;10|
        ((|gamma| |Vector| (|Integer|)) (|part| |Vector| (|Integer|))
         (|number| |Integer|) ($ |Vector| (|Integer|)))
        (SPADCALL (SPADCALL |gamma| (QREFELT $ 21)) |part| |number|
                  (QREFELT $ 47))) 

(SDEFUN |SGCF;nextPartition;LVIV;11|
        ((|gamma| |List| (|Integer|)) (|part| |Vector| (|Integer|))
         (|number| |Integer|) ($ |Vector| (|Integer|)))
        (SPROG
         ((#1=#:G840 NIL) (|k| NIL) (|j| (|NonNegativeInteger|))
          (|sum| (|Integer|)) (|i| (|NonNegativeInteger|)) (#2=#:G839 NIL)
          (|vnull| (|Vector| (|Integer|))) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (LENGTH |gamma|) . #3=(|SGCF;nextPartition;LVIV;11|))
                (LETT |vnull| (MAKE-ARRAY 0) . #3#)
                (COND
                 ((SPADCALL |part| |vnull| (QREFELT $ 48))
                  (SEQ (LETT |i| 2 . #3#)
                       (LETT |sum| (SPADCALL |part| 1 (QREFELT $ 25)) . #3#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND
                                ((EQL (SPADCALL |part| |i| (QREFELT $ 25))
                                      (SPADCALL |gamma| |i| (QREFELT $ 18)))
                                 'T)
                                ('T (EQL |sum| 0))))
                              (GO G191)))
                            (SEQ
                             (LETT |sum|
                                   (+ |sum|
                                      (SPADCALL |part| |i| (QREFELT $ 25)))
                                   . #3#)
                             (LETT |i| (+ |i| 1) . #3#)
                             (EXIT
                              (COND
                               ((EQL |i| (+ 1 |n|))
                                (PROGN
                                 (LETT #2# |vnull| . #3#)
                                 (GO #4=#:G838))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |sum| (- |sum| 1) . #3#)
                       (EXIT
                        (SPADCALL |part| |i|
                                  (+ (SPADCALL |part| |i| (QREFELT $ 25)) 1)
                                  (QREFELT $ 20)))))
                 ('T
                  (SEQ (LETT |sum| |number| . #3#)
                       (LETT |part| (MAKEARR1 |n| 0) . #3#)
                       (EXIT (LETT |i| (+ 1 |n|) . #3#)))))
                (LETT |j| 1 . #3#)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |sum| (SPADCALL |gamma| |j| (QREFELT $ 18))
                                  (QREFELT $ 10)))
                       (GO G191)))
                     (SEQ
                      (SPADCALL |part| |j|
                                (SPADCALL |gamma| |j| (QREFELT $ 18))
                                (QREFELT $ 20))
                      (LETT |sum|
                            (- |sum| (SPADCALL |gamma| |j| (QREFELT $ 18)))
                            . #3#)
                      (EXIT (LETT |j| (+ |j| 1) . #3#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (SPADCALL |part| |j| |sum| (QREFELT $ 20))
                (SEQ (LETT |k| (+ |j| 1) . #3#) (LETT #1# (- |i| 1) . #3#) G190
                     (COND ((> |k| #1#) (GO G191)))
                     (SEQ (EXIT (SPADCALL |part| |k| 0 (QREFELT $ 20))))
                     (LETT |k| (+ |k| 1) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |part|)))
          #4# (EXIT #2#)))) 

(SDEFUN |SGCF;inverseColeman;2LML;12|
        ((|alpha| |List| (|Integer|)) (|beta| |List| (|Integer|))
         (C |Matrix| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG
         ((|pi| (|List| (|Integer|))) (#1=#:G852 NIL) (|k| NIL) (#2=#:G851 NIL)
          (|i| NIL) (#3=#:G850 NIL) (|j| NIL) (|sum| (|Integer|))
          (#4=#:G849 NIL) (|help| (|Vector| (|Integer|)))
          (|ncol| #5=(|NonNegativeInteger|)) (|nrow| #5#))
         (SEQ (LETT |pi| NIL . #6=(|SGCF;inverseColeman;2LML;12|))
              (LETT |nrow| (LENGTH |beta|) . #6#)
              (LETT |ncol| (LENGTH |alpha|) . #6#)
              (LETT |help| (MAKEARR1 |nrow| 0) . #6#) (LETT |sum| 1 . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #4# |nrow| . #6#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (SPADCALL |help| |i| |sum| (QREFELT $ 20))
                        (EXIT
                         (LETT |sum|
                               (+ |sum| (SPADCALL |beta| |i| (QREFELT $ 18)))
                               . #6#)))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |j| 1 . #6#) (LETT #3# |ncol| . #6#) G190
                   (COND ((|greater_SI| |j| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1 . #6#) (LETT #2# |nrow| . #6#) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 2 . #6#)
                                 (LETT #1#
                                       (+ 1
                                          (SPADCALL C |i| |j| (QREFELT $ 49)))
                                       . #6#)
                                 G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
                                 (SEQ
                                  (LETT |pi|
                                        (SPADCALL |pi|
                                                  (SPADCALL
                                                   (SPADCALL |help| |i|
                                                             (QREFELT $ 25))
                                                   (QREFELT $ 13))
                                                  (QREFELT $ 14))
                                        . #6#)
                                  (EXIT
                                   (SPADCALL |help| |i|
                                             (+
                                              (SPADCALL |help| |i|
                                                        (QREFELT $ 25))
                                              1)
                                             (QREFELT $ 20))))
                                 (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |pi|)))) 

(SDEFUN |SGCF;coleman;3LM;13|
        ((|alpha| |List| (|Integer|)) (|beta| |List| (|Integer|))
         (|pi| |List| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G870 NIL) (|j| NIL) (|betasum| #2=(|NonNegativeInteger|))
          (#3=#:G862 NIL) (|help| (|List| (|Integer|))) (#4=#:G860 NIL)
          (#5=#:G869 NIL) (|i| NIL) (|temp| (|List| (|List| (|Integer|))))
          (|alphasum| #2#) (#6=#:G856 NIL) (#7=#:G854 NIL) (#8=#:G868 NIL)
          (|colematrix| (|Matrix| (|Integer|)))
          (|ncol| #9=(|NonNegativeInteger|)) (|nrow| #9#))
         (SEQ (LETT |nrow| (LENGTH |beta|) . #10=(|SGCF;coleman;3LM;13|))
              (LETT |ncol| (LENGTH |alpha|) . #10#) (LETT |temp| NIL . #10#)
              (LETT |help| NIL . #10#)
              (LETT |colematrix| (MAKE_MATRIX1 |nrow| |ncol| 0) . #10#)
              (LETT |betasum| 0 . #10#) (LETT |alphasum| 0 . #10#)
              (SEQ (LETT |i| 1 . #10#) (LETT #8# |ncol| . #10#) G190
                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                   (SEQ (LETT |help| NIL . #10#)
                        (SEQ
                         (LETT |j| (SPADCALL |alpha| |i| (QREFELT $ 18))
                               . #10#)
                         G190 (COND ((< |j| 1) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |help|
                                 (CONS
                                  (SPADCALL |pi|
                                            (+
                                             (PROG1 (LETT #7# |j| . #10#)
                                               (|check_subtype2| (>= #7# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #7#))
                                             |alphasum|)
                                            (QREFELT $ 18))
                                  |help|)
                                 . #10#)))
                         (LETT |j| (+ |j| -1) . #10#) (GO G190) G191
                         (EXIT NIL))
                        (LETT |alphasum|
                              (PROG1
                                  (LETT #6#
                                        (+ |alphasum|
                                           (SPADCALL |alpha| |i|
                                                     (QREFELT $ 18)))
                                        . #10#)
                                (|check_subtype2| (>= #6# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #6#))
                              . #10#)
                        (EXIT
                         (LETT |temp|
                               (SPADCALL |temp|
                                         (SPADCALL |help| (QREFELT $ 52))
                                         (QREFELT $ 53))
                               . #10#)))
                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1 . #10#) (LETT #5# |nrow| . #10#) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ (LETT |help| NIL . #10#)
                        (SEQ
                         (LETT |j| (SPADCALL |beta| |i| (QREFELT $ 18)) . #10#)
                         G190 (COND ((< |j| 1) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |help|
                                 (CONS
                                  (+
                                   (PROG1 (LETT #4# |j| . #10#)
                                     (|check_subtype2| (>= #4# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #4#))
                                   |betasum|)
                                  |help|)
                                 . #10#)))
                         (LETT |j| (+ |j| -1) . #10#) (GO G190) G191
                         (EXIT NIL))
                        (LETT |betasum|
                              (PROG1
                                  (LETT #3#
                                        (+ |betasum|
                                           (SPADCALL |beta| |i|
                                                     (QREFELT $ 18)))
                                        . #10#)
                                (|check_subtype2| (>= #3# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #3#))
                              . #10#)
                        (EXIT
                         (SEQ (LETT |j| 1 . #10#) (LETT #1# |ncol| . #10#) G190
                              (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |colematrix| |i| |j|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |help| (QREFELT $ 55))
                                            (SPADCALL
                                             (SPADCALL |temp| |j|
                                                       (QREFELT $ 56))
                                             (QREFELT $ 55))
                                            (QREFELT $ 57))
                                           (QREFELT $ 58))
                                          (QREFELT $ 32))))
                              (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT |colematrix|)))) 

(DECLAIM (NOTINLINE |SymmetricGroupCombinatoricFunctions;|)) 

(DEFUN |SymmetricGroupCombinatoricFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G872)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|SymmetricGroupCombinatoricFunctions|)
                    . #2=(|SymmetricGroupCombinatoricFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|SymmetricGroupCombinatoricFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|SymmetricGroupCombinatoricFunctions;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|SymmetricGroupCombinatoricFunctions|)))))))))) 

(DEFUN |SymmetricGroupCombinatoricFunctions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SymmetricGroupCombinatoricFunctions|)
                . #1=(|SymmetricGroupCombinatoricFunctions|))
          (LETT $ (GETREFV 60) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|SymmetricGroupCombinatoricFunctions| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SymmetricGroupCombinatoricFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|)
              (|IntegerCombinatoricFunctions| 6) (0 . |binomial|) (|Boolean|)
              (6 . >) |SGCF;numberOfImproperPartitions;3I;2| (|List| 6)
              (12 . |list|) (17 . |append|)
              |SGCF;unrankImproperPartitions0;3IL;3| (23 . ~=)
              |SGCF;subSet;3IL;5| (29 . |elt|) (|Vector| 6) (35 . |setelt!|)
              (42 . |entries|) |SGCF;unrankImproperPartitions1;3IL;4|
              (|PartitionsAndPermutations|) (47 . |conjugate|) (52 . |elt|)
              (|NonNegativeInteger|) (58 . >) (64 . |setelt!|)
              |SGCF;nextLatticePermutation;2LBL;6| (71 . |maxIndex|)
              (|Matrix| 6) (76 . |setelt!|) |SGCF;makeYoungTableau;2LM;7|
              (|List| 31) (84 . |append|) |SGCF;listYoungTableaus;LL;8|
              (90 . |vector|) (95 . |copy|) (100 . ~=) (106 . |row|) (112 . +)
              |SGCF;nextPartition;2VIV;10| (118 . =) (124 . |setRow!|)
              (131 . -) |SGCF;nextColeman;2L2M;9| |SGCF;nextPartition;LVIV;11|
              (137 . ~=) (143 . |elt|) |SGCF;inverseColeman;2LML;12|
              (|List| 12) (150 . |list|) (155 . |append|) (|Set| 6)
              (161 . |set|) (166 . |elt|) (172 . |intersect|) (178 . |#|)
              |SGCF;coleman;3LM;13|)
           '#(|unrankImproperPartitions1| 183 |unrankImproperPartitions0| 190
              |subSet| 197 |numberOfImproperPartitions| 204 |nextPartition| 210
              |nextLatticePermutation| 224 |nextColeman| 231 |makeYoungTableau|
              238 |listYoungTableaus| 244 |inverseColeman| 249 |coleman| 256)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 59
                                                 '(2 7 6 6 6 8 2 6 9 0 0 10 1
                                                   12 0 6 13 2 12 0 0 0 14 2 6
                                                   9 0 0 16 2 12 6 0 6 18 3 19
                                                   6 0 6 6 20 1 19 12 0 21 1 23
                                                   12 12 24 2 19 6 0 6 25 2 26
                                                   9 0 0 27 3 12 6 0 6 6 28 1
                                                   12 6 0 30 4 31 6 0 6 6 6 32
                                                   2 34 0 0 0 35 1 19 0 12 37 1
                                                   31 0 0 38 2 31 9 0 0 39 2 31
                                                   19 0 6 40 2 19 0 0 0 41 2 19
                                                   9 0 0 43 3 31 0 0 6 19 44 2
                                                   19 0 0 0 45 2 19 9 0 0 48 3
                                                   31 6 0 6 6 49 1 51 0 12 52 2
                                                   51 0 0 0 53 1 54 0 12 55 2
                                                   51 12 0 6 56 2 54 0 0 0 57 1
                                                   54 26 0 58 3 0 12 6 6 6 22 3
                                                   0 12 6 6 6 15 3 0 12 6 6 6
                                                   17 2 0 6 6 6 11 3 0 19 19 19
                                                   6 42 3 0 19 12 19 6 47 3 0
                                                   12 12 12 9 29 3 0 31 12 12
                                                   31 46 2 0 31 12 12 33 1 0 34
                                                   12 36 3 0 12 12 12 31 50 3 0
                                                   31 12 12 12 59)))))
           '|lookupComplete|)) 

(MAKEPROP '|SymmetricGroupCombinatoricFunctions| 'NILADIC T) 
