
(SDEFUN |COMBINAT;partition;2I;1| ((|n| I) ($ I))
        (SPROG
         ((|s| (I)) (|t| (I)) (#1=#:G723 NIL) (|u| (|Integer|))
          (|l| (|Integer|)) (|k| NIL) (#2=#:G724 NIL) (|i| NIL) (#3=#:G708 NIL)
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (QREFELT $ 18) (QREFELT $ 20)) 0
                      (QREFELT $ 22))
            (|error| "Partition: must have minIndex of 0"))
           (#4='T
            (SEQ
             (LETT |m| (SPADCALL (QREFELT $ 18) (QREFELT $ 23))
                   . #5=(|COMBINAT;partition;2I;1|))
             (EXIT
              (COND
               ((SPADCALL |n| (|spadConstant| $ 7) (QREFELT $ 24))
                (|error| "partition is not defined for negative integers"))
               ((SPADCALL |n| (SPADCALL |m| (QREFELT $ 25)) (QREFELT $ 24))
                (SPADCALL (QREFELT $ 18) (SPADCALL |n| (QREFELT $ 26))
                          (QREFELT $ 27)))
               (#4#
                (SEQ
                 (SPADCALL (QREFELT $ 18)
                           (SPADCALL
                            (PROG1
                                (LETT #3#
                                      (-
                                       (SPADCALL
                                        (SPADCALL |n| (|spadConstant| $ 8)
                                                  (QREFELT $ 28))
                                        (QREFELT $ 26))
                                       |m|)
                                      . #5#)
                              (|check_subtype2| (>= #3# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #3#))
                            (|spadConstant| $ 7) (QREFELT $ 17))
                           (QREFELT $ 29))
                 (SEQ (LETT |i| |m| . #5#)
                      (LETT #2# (SPADCALL |n| (QREFELT $ 26)) . #5#) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ (LETT |s| (|spadConstant| $ 8) . #5#)
                           (LETT |t| (|spadConstant| $ 7) . #5#)
                           (SEQ
                            (EXIT
                             (SEQ (LETT |k| 1 . #5#) G190 NIL
                                  (SEQ
                                   (LETT |l|
                                         (QUOTIENT2
                                          (-
                                           (* (SPADCALL 3 |k| (QREFELT $ 31))
                                              |k|)
                                           |k|)
                                          2)
                                         . #5#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |l| |i| (QREFELT $ 32))
                                      (PROGN
                                       (LETT #1# |$NoValue| . #5#)
                                       (GO #6=#:G716)))
                                     ('T
                                      (SEQ (LETT |u| (+ |l| |k|) . #5#)
                                           (LETT |t|
                                                 (SPADCALL |t|
                                                           (SPADCALL |s|
                                                                     (SPADCALL
                                                                      (QREFELT
                                                                       $ 18)
                                                                      (- |i|
                                                                         |l|)
                                                                      (QREFELT
                                                                       $ 27))
                                                                     (QREFELT $
                                                                              33))
                                                           (QREFELT $ 28))
                                                 . #5#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |u| |i| (QREFELT $ 32))
                                              (PROGN
                                               (LETT #1# |$NoValue| . #5#)
                                               (GO #6#)))
                                             ('T
                                              (SEQ
                                               (LETT |t|
                                                     (SPADCALL |t|
                                                               (SPADCALL |s|
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $
                                                                           18)
                                                                          (-
                                                                           |i|
                                                                           |u|)
                                                                          (QREFELT
                                                                           $
                                                                           27))
                                                                         (QREFELT
                                                                          $
                                                                          33))
                                                               (QREFELT $ 28))
                                                     . #5#)
                                               (EXIT
                                                (LETT |s|
                                                      (SPADCALL |s|
                                                                (QREFELT $ 34))
                                                      . #5#)))))))))))
                                  (LETT |k| (|inc_SI| |k|) . #5#) (GO G190)
                                  G191 (EXIT NIL)))
                            #6# (EXIT #1#))
                           (EXIT
                            (SPADCALL (QREFELT $ 18) |i| |t| (QREFELT $ 35))))
                      (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SPADCALL (QREFELT $ 18) (SPADCALL |n| (QREFELT $ 26))
                            (QREFELT $ 27))))))))))))) 

(SDEFUN |COMBINAT;factorial;2I;2| ((|n| I) ($ I))
        (SPROG
         ((|f| (I)) (|t| (I)) (#1=#:G731 NIL) (|k| NIL) (|s| (I))
          (|#G7| (|Record| (|:| |Fn| I) (|:| |Fv| I))))
         (SEQ
          (COND
           ((SPADCALL |n| (|spadConstant| $ 7) (QREFELT $ 24))
            (|error| "factorial not defined for negative integers"))
           (#2='T
            (SEQ
             (COND
              ((SPADCALL |n| (QCAR (QREFELT $ 9)) (QREFELT $ 37))
               (LETT |s|
                     (LETT |f| (|spadConstant| $ 8)
                           . #3=(|COMBINAT;factorial;2I;2|))
                     . #3#))
              (#2#
               (PROGN
                (LETT |#G7| (QREFELT $ 9) . #3#)
                (LETT |s| (QCAR |#G7|) . #3#)
                (LETT |f| (QCDR |#G7|) . #3#)
                |#G7|)))
             (SEQ
              (LETT |k|
                    (SPADCALL
                     (SPADCALL |s| (|spadConstant| $ 8) (QREFELT $ 28))
                     (QREFELT $ 26))
                    . #3#)
              (LETT #1# (SPADCALL |n| (QREFELT $ 26)) . #3#) G190
              (COND ((> |k| #1#) (GO G191)))
              (SEQ
               (COND
                ((SPADCALL (SPADCALL |k| (QREFELT $ 25)) |n| (QREFELT $ 38))
                 (LETT |t| |n| . #3#))
                ('T
                 (LETT |t|
                       (SPADCALL (SPADCALL |k| (QREFELT $ 25))
                                 (SPADCALL (+ |k| 1) (QREFELT $ 25))
                                 (QREFELT $ 33))
                       . #3#)))
               (EXIT (LETT |f| (SPADCALL |t| |f| (QREFELT $ 33)) . #3#)))
              (LETT |k| (+ |k| 2) . #3#) (GO G190) G191 (EXIT NIL))
             (PROGN (RPLACA (QREFELT $ 9) |n|) (QCAR (QREFELT $ 9)))
             (EXIT
              (PROGN (RPLACD (QREFELT $ 9) |f|) (QCDR (QREFELT $ 9)))))))))) 

(SDEFUN |COMBINAT;binomial;3I;3| ((|n| I) (|m| I) ($ I))
        (SPROG
         ((|b| (I)) (#1=#:G743 NIL) (|k| NIL) (|s| (I)) (|#G17| (I))
          (|#G16| (I)) (#2=#:G742 NIL) (|#G15| (I)) (|#G14| (I)))
         (SEQ
          (EXIT
           (COND
            ((OR
              (OR (SPADCALL |n| (|spadConstant| $ 7) (QREFELT $ 24))
                  (SPADCALL |m| (|spadConstant| $ 7) (QREFELT $ 24)))
              (SPADCALL |m| |n| (QREFELT $ 40)))
             (|spadConstant| $ 7))
            ('T
             (COND
              ((SPADCALL |m| (|spadConstant| $ 7) (QREFELT $ 38))
               (|spadConstant| $ 8))
              ((SPADCALL |n| (SPADCALL 2 |m| (QREFELT $ 41)) (QREFELT $ 24))
               (SPADCALL |n| (SPADCALL |n| |m| (QREFELT $ 42)) (QREFELT $ 43)))
              (#3='T
               (SEQ
                (PROGN
                 (LETT |#G14| (|spadConstant| $ 7)
                       . #4=(|COMBINAT;binomial;3I;3|))
                 (LETT |#G15| (|spadConstant| $ 8) . #4#)
                 (LETT |s| |#G14| . #4#)
                 (LETT |b| |#G15| . #4#))
                (COND
                 ((SPADCALL (QVELT (QREFELT $ 10) 0) |n| (QREFELT $ 38))
                  (COND
                   ((SPADCALL (QVELT (QREFELT $ 10) 1)
                              (SPADCALL |m| (|spadConstant| $ 8)
                                        (QREFELT $ 28))
                              (QREFELT $ 38))
                    (SEQ
                     (LETT |b|
                           (SPADCALL
                            (SPADCALL (QVELT (QREFELT $ 10) 2)
                                      (SPADCALL |m| (|spadConstant| $ 8)
                                                (QREFELT $ 28))
                                      (QREFELT $ 33))
                            (SPADCALL |n| |m| (QREFELT $ 42)) (QREFELT $ 44))
                           . #4#)
                     (QSETVELT (QREFELT $ 10) 0 |n|)
                     (QSETVELT (QREFELT $ 10) 1 |m|)
                     (EXIT
                      (PROGN
                       (LETT #2# (QSETVELT (QREFELT $ 10) 2 |b|) . #4#)
                       (GO #5=#:G741)))))
                   ((SPADCALL |m| (QVELT (QREFELT $ 10) 1) (QREFELT $ 45))
                    (SEQ (LETT |s| (QVELT (QREFELT $ 10) 1) . #4#)
                         (EXIT (LETT |b| (QVELT (QREFELT $ 10) 2) . #4#))))
                   (#3#
                    (PROGN
                     (LETT |#G16| (|spadConstant| $ 7) . #4#)
                     (LETT |#G17| (|spadConstant| $ 8) . #4#)
                     (LETT |s| |#G16| . #4#)
                     (LETT |b| |#G17| . #4#))))))
                (SEQ
                 (LETT |k|
                       (SPADCALL
                        (SPADCALL |s| (|spadConstant| $ 8) (QREFELT $ 28))
                        (QREFELT $ 26))
                       . #4#)
                 (LETT #1# (SPADCALL |m| (QREFELT $ 26)) . #4#) G190
                 (COND ((> |k| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |b|
                         (SPADCALL
                          (SPADCALL |b|
                                    (SPADCALL
                                     (SPADCALL |n|
                                               (SPADCALL |k| (QREFELT $ 25))
                                               (QREFELT $ 42))
                                     (|spadConstant| $ 8) (QREFELT $ 28))
                                    (QREFELT $ 33))
                          (SPADCALL |k| (QREFELT $ 25)) (QREFELT $ 44))
                         . #4#)))
                 (LETT |k| (+ |k| 1) . #4#) (GO G190) G191 (EXIT NIL))
                (QSETVELT (QREFELT $ 10) 0 |n|) (QSETVELT (QREFELT $ 10) 1 |m|)
                (EXIT (QSETVELT (QREFELT $ 10) 2 |b|))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |COMBINAT;multinomial;ILI;4| ((|n| I) (|m| |List| I) ($ I))
        (SPROG
         ((|s| (I)) (#1=#:G760 NIL) (|t| NIL) (#2=#:G750 NIL) (#3=#:G749 (I))
          (#4=#:G751 (I)) (#5=#:G759 NIL) (#6=#:G690 NIL) (#7=#:G756 NIL)
          (#8=#:G757 NIL) (#9=#:G758 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |t| NIL . #10=(|COMBINAT;multinomial;ILI;4|))
                   (LETT #9# |m| . #10#) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |t| (CAR #9#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |t| (|spadConstant| $ 7) (QREFELT $ 24))
                       (PROGN
                        (LETT #7#
                              (PROGN
                               (LETT #8# (|spadConstant| $ 7) . #10#)
                               (GO #11=#:G755))
                              . #10#)
                        (GO #12=#:G748))))))
                   (LETT #9# (CDR #9#) . #10#) (GO G190) G191 (EXIT NIL)))
             #12# (EXIT #7#))
            (EXIT
             (COND
              ((SPADCALL |n|
                         (PROGN
                          (LETT #2# NIL . #10#)
                          (SEQ (LETT #6# NIL . #10#) (LETT #5# |m| . #10#) G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT #6# (CAR #5#) . #10#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #4# #6# . #10#)
                                  (COND
                                   (#2#
                                    (LETT #3# (SPADCALL #3# #4# (QREFELT $ 28))
                                          . #10#))
                                   ('T
                                    (PROGN
                                     (LETT #3# #4# . #10#)
                                     (LETT #2# 'T . #10#)))))))
                               (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#2# #3#) (#13='T (|spadConstant| $ 7))))
                         (QREFELT $ 24))
               (|spadConstant| $ 7))
              (#13#
               (SEQ (LETT |s| (|spadConstant| $ 8) . #10#)
                    (SEQ (LETT |t| NIL . #10#) (LETT #1# |m| . #10#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |t| (CAR #1#) . #10#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |s|
                                 (SPADCALL |s| (SPADCALL |t| (QREFELT $ 39))
                                           (QREFELT $ 33))
                                 . #10#)))
                         (LETT #1# (CDR #1#) . #10#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL (SPADCALL |n| (QREFELT $ 39)) |s|
                               (QREFELT $ 44)))))))))
          #11# (EXIT #8#)))) 

(SDEFUN |COMBINAT;permutation;3I;5| ((|n| I) (|m| I) ($ I))
        (SPROG ((|p| (I)) (|t| (I)) (#1=#:G765 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR (SPADCALL |m| (|spadConstant| $ 7) (QREFELT $ 24))
                      (SPADCALL |n| |m| (QREFELT $ 24)))
                  (|spadConstant| $ 7))
                 ('T
                  (SEQ
                   (LETT |m| (SPADCALL |n| |m| (QREFELT $ 42))
                         . #2=(|COMBINAT;permutation;3I;5|))
                   (LETT |p| (|spadConstant| $ 8) . #2#)
                   (SEQ
                    (LETT |k|
                          (SPADCALL
                           (SPADCALL |m| (|spadConstant| $ 8) (QREFELT $ 28))
                           (QREFELT $ 26))
                          . #2#)
                    (LETT #1# (SPADCALL |n| (QREFELT $ 26)) . #2#) G190
                    (COND ((> |k| #1#) (GO G191)))
                    (SEQ
                     (COND
                      ((SPADCALL (SPADCALL |k| (QREFELT $ 25)) |n|
                                 (QREFELT $ 38))
                       (LETT |t| |n| . #2#))
                      ('T
                       (LETT |t| (SPADCALL (* |k| (+ |k| 1)) (QREFELT $ 25))
                             . #2#)))
                     (EXIT (LETT |p| (SPADCALL |p| |t| (QREFELT $ 33)) . #2#)))
                    (LETT |k| (+ |k| 2) . #2#) (GO G190) G191 (EXIT NIL))
                   (EXIT |p|))))))) 

(SDEFUN |COMBINAT;stirling1;3I;6| ((|n| I) (|m| I) ($ I))
        (SPROG
         ((#1=#:G768 NIL) (#2=#:G773 NIL) (|k| NIL)
          (|x| (|SparseUnivariatePolynomial| I)) (#3=#:G766 NIL))
         (SEQ
          (COND
           ((OR
             (OR (SPADCALL |n| (|spadConstant| $ 7) (QREFELT $ 24))
                 (SPADCALL |m| (|spadConstant| $ 8) (QREFELT $ 24)))
             (SPADCALL |m| |n| (QREFELT $ 40)))
            (|spadConstant| $ 7))
           ('T
            (COND ((SPADCALL |m| |n| (QREFELT $ 38)) (|spadConstant| $ 8))
                  ((SPADCALL (QCAR (QREFELT $ 13)) |n| (QREFELT $ 38))
                   (SPADCALL (QCDR (QREFELT $ 13))
                             (PROG1
                                 (LETT #3# (SPADCALL |m| (QREFELT $ 26))
                                       . #4=(|COMBINAT;stirling1;3I;6|))
                               (|check_subtype2| (>= #3# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #3#))
                             (QREFELT $ 49)))
                  ('T
                   (SEQ
                    (LETT |x| (SPADCALL (|spadConstant| $ 8) 1 (QREFELT $ 50))
                          . #4#)
                    (PROGN (RPLACA (QREFELT $ 13) |n|) (QCAR (QREFELT $ 13)))
                    (PROGN (RPLACD (QREFELT $ 13) |x|) (QCDR (QREFELT $ 13)))
                    (SEQ (LETT |k| 1 . #4#)
                         (LETT #2#
                               (SPADCALL
                                (SPADCALL |n| (|spadConstant| $ 8)
                                          (QREFELT $ 42))
                                (QREFELT $ 26))
                               . #4#)
                         G190 (COND ((|greater_SI| |k| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (RPLACD (QREFELT $ 13)
                                    (SPADCALL (QCDR (QREFELT $ 13))
                                              (SPADCALL |x|
                                                        (SPADCALL |k|
                                                                  (QREFELT $
                                                                           51))
                                                        (QREFELT $ 52))
                                              (QREFELT $ 53)))
                            (QCDR (QREFELT $ 13)))))
                         (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL (QCDR (QREFELT $ 13))
                               (PROG1
                                   (LETT #1# (SPADCALL |m| (QREFELT $ 26))
                                         . #4#)
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               (QREFELT $ 49))))))))))) 

(SDEFUN |COMBINAT;stirling2;3I;7| ((|n| I) (|m| I) ($ I))
        (SPROG ((|t| (I)) (#1=#:G776 NIL) (|s| (I)) (#2=#:G781 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR
                   (OR (SPADCALL |n| (|spadConstant| $ 7) (QREFELT $ 24))
                       (SPADCALL |m| (|spadConstant| $ 8) (QREFELT $ 24)))
                   (SPADCALL |m| |n| (QREFELT $ 40)))
                  (|spadConstant| $ 7))
                 ((OR (SPADCALL |m| (|spadConstant| $ 8) (QREFELT $ 38))
                      (SPADCALL |n| |m| (QREFELT $ 38)))
                  (|spadConstant| $ 8))
                 ('T
                  (SEQ
                   (LETT |s|
                         (COND
                          ((SPADCALL |m| (QREFELT $ 55))
                           (SPADCALL (|spadConstant| $ 8) (QREFELT $ 34)))
                          ('T (|spadConstant| $ 8)))
                         . #3=(|COMBINAT;stirling2;3I;7|))
                   (LETT |t| (|spadConstant| $ 7) . #3#)
                   (SEQ (LETT |k| 1 . #3#)
                        (LETT #2# (SPADCALL |m| (QREFELT $ 26)) . #3#) G190
                        (COND ((|greater_SI| |k| #2#) (GO G191)))
                        (SEQ (LETT |s| (SPADCALL |s| (QREFELT $ 34)) . #3#)
                             (EXIT
                              (LETT |t|
                                    (SPADCALL |t|
                                              (SPADCALL
                                               (SPADCALL |s|
                                                         (SPADCALL |m|
                                                                   (SPADCALL
                                                                    |k|
                                                                    (QREFELT $
                                                                             25))
                                                                   (QREFELT $
                                                                            43))
                                                         (QREFELT $ 33))
                                               (SPADCALL
                                                (SPADCALL |k| (QREFELT $ 25))
                                                (PROG1
                                                    (LETT #1#
                                                          (SPADCALL |n|
                                                                    (QREFELT $
                                                                             26))
                                                          . #3#)
                                                  (|check_subtype2| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #1#))
                                                (QREFELT $ 56))
                                               (QREFELT $ 33))
                                              (QREFELT $ 28))
                                    . #3#)))
                        (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT
                    (SPADCALL |t| (SPADCALL |m| (QREFELT $ 39))
                              (QREFELT $ 44))))))))) 

(SDEFUN |COMBINAT;catalan;2I;8| ((|n| I) ($ I))
        (SPROG ((#1=#:G783 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL 2 |n| (QREFELT $ 41)) |n|
                                    (QREFELT $ 43))
                          (SPADCALL |n| (|spadConstant| $ 8) (QREFELT $ 28))
                          (QREFELT $ 59))
                         |COMBINAT;catalan;2I;8|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                 (|Union| (QREFELT $ 6) "failed") #1#)))) 

(DECLAIM (NOTINLINE |IntegerCombinatoricFunctions;|)) 

(DEFUN |IntegerCombinatoricFunctions| (#1=#:G786)
  (SPROG NIL
         (PROG (#2=#:G787)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IntegerCombinatoricFunctions|)
                                               '|domainEqualList|)
                    . #3=(|IntegerCombinatoricFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|IntegerCombinatoricFunctions;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|IntegerCombinatoricFunctions|)))))))))) 

(DEFUN |IntegerCombinatoricFunctions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegerCombinatoricFunctions|))
          (LETT |dv$| (LIST '|IntegerCombinatoricFunctions| DV$1) . #1#)
          (LETT $ (GETREFV 61) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|IntegerCombinatoricFunctions|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (CONS (|spadConstant| $ 7) (|spadConstant| $ 8)))
          (QSETREFV $ 10
                    (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7)
                            (|spadConstant| $ 7)))
          (QSETREFV $ 13 (CONS (|spadConstant| $ 7) (|spadConstant| $ 12)))
          (QSETREFV $ 18 (SPADCALL 1 (|spadConstant| $ 8) (QREFELT $ 17)))
          $))) 

(MAKEPROP '|IntegerCombinatoricFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|) (4 . |One|)
              'F 'B (|SparseUnivariatePolynomial| 6) (8 . |Zero|) 'S
              (12 . |One|) (|NonNegativeInteger|)
              (|IndexedFlexibleArray| 6 (NRTEVAL 0)) (16 . |new|) 'P
              (|Integer|) (22 . |minIndex|) (|Boolean|) (27 . ~=) (33 . |#|)
              (38 . <) (44 . |coerce|) (49 . |convert|) (54 . |elt|) (60 . +)
              (66 . |concat!|) (|PositiveInteger|) (72 . *) (78 . >) (84 . *)
              (90 . -) (95 . |setelt!|) |COMBINAT;partition;2I;1| (102 . <=)
              (108 . =) |COMBINAT;factorial;2I;2| (114 . >) (120 . *) (126 . -)
              |COMBINAT;binomial;3I;3| (132 . |quo|) (138 . >=) (|List| 6)
              |COMBINAT;multinomial;ILI;4| |COMBINAT;permutation;3I;5|
              (144 . |coefficient|) (150 . |monomial|) (156 . |coerce|)
              (161 . -) (167 . *) |COMBINAT;stirling1;3I;6| (173 . |odd?|)
              (178 . ^) |COMBINAT;stirling2;3I;7| (|Union| $ '"failed")
              (184 . |exquo|) |COMBINAT;catalan;2I;8|)
           '#(|stirling2| 190 |stirling1| 196 |permutation| 202 |partition| 208
              |multinomial| 213 |factorial| 219 |catalan| 224 |binomial| 229)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(0 6 0 7 0 6 0 8 0 11 0 12 0
                                                   11 0 14 2 16 0 15 6 17 1 16
                                                   19 0 20 2 19 21 0 0 22 1 16
                                                   15 0 23 2 6 21 0 0 24 1 6 0
                                                   19 25 1 6 19 0 26 2 16 6 0
                                                   19 27 2 6 0 0 0 28 2 16 0 0
                                                   0 29 2 15 0 30 0 31 2 19 21
                                                   0 0 32 2 6 0 0 0 33 1 6 0 0
                                                   34 3 16 6 0 19 6 35 2 6 21 0
                                                   0 37 2 6 21 0 0 38 2 6 21 0
                                                   0 40 2 6 0 30 0 41 2 6 0 0 0
                                                   42 2 6 0 0 0 44 2 6 21 0 0
                                                   45 2 11 6 0 15 49 2 11 0 6
                                                   15 50 1 11 0 19 51 2 11 0 0
                                                   0 52 2 11 0 0 0 53 1 6 21 0
                                                   55 2 6 0 0 15 56 2 6 58 0 0
                                                   59 2 0 6 6 6 57 2 0 6 6 6 54
                                                   2 0 6 6 6 48 1 0 6 6 36 2 0
                                                   6 6 46 47 1 0 6 6 39 1 0 6 6
                                                   60 2 0 6 6 6 43)))))
           '|lookupComplete|)) 
