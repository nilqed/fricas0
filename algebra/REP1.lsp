
(SDEFUN |REP1;calcCoef|
        ((|beta| |List| (|Integer|)) (C |Matrix| (|Integer|)) ($ |Integer|))
        (SPROG ((|prod| (|Integer|)) (#1=#:G718 NIL) (|i| NIL))
               (SEQ (LETT |prod| 1 . #2=(|REP1;calcCoef|))
                    (SEQ (LETT |i| 1 . #2#)
                         (LETT #1# (SPADCALL |beta| (QREFELT $ 9)) . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |prod|
                                 (* |prod|
                                    (SPADCALL
                                     (SPADCALL |beta| |i| (QREFELT $ 10))
                                     (SPADCALL (SPADCALL C |i| (QREFELT $ 13))
                                               (QREFELT $ 14))
                                     (QREFELT $ 16)))
                                 . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |prod|)))) 

(SDEFUN |REP1;invContent|
        ((|alpha| |List| #1=(|Integer|)) ($ |Vector| (|Integer|)))
        (SPROG
         ((|i| (|NonNegativeInteger|)) (#2=#:G734 NIL) (|k| NIL)
          (|j| (|Integer|)) (#3=#:G733 NIL) (|og| NIL)
          (|f| (|Vector| (|Integer|))) (|n| (|NonNegativeInteger|))
          (#4=#:G725 NIL) (#5=#:G723 NIL) (#6=#:G722 #1#) (#7=#:G724 #1#)
          (#8=#:G732 NIL) (#9=#:G690 NIL))
         (SEQ
          (LETT |n|
                (PROG1
                    (LETT #4#
                          (PROGN
                           (LETT #5# NIL . #10=(|REP1;invContent|))
                           (SEQ (LETT #9# NIL . #10#) (LETT #8# |alpha| . #10#)
                                G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT #9# (CAR #8#) . #10#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #7# #9# . #10#)
                                   (COND (#5# (LETT #6# (+ #6# #7#) . #10#))
                                         ('T
                                          (PROGN
                                           (LETT #6# #7# . #10#)
                                           (LETT #5# 'T . #10#)))))))
                                (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#5# #6#) ('T 0)))
                          . #10#)
                  (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #4#))
                . #10#)
          (LETT |f| (MAKEARR1 |n| 0) . #10#) (LETT |i| 1 . #10#)
          (LETT |j| -1 . #10#)
          (SEQ (LETT |og| NIL . #10#) (LETT #3# |alpha| . #10#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |og| (CAR #3#) . #10#) NIL))
                 (GO G191)))
               (SEQ (LETT |j| (+ |j| 1) . #10#)
                    (EXIT
                     (SEQ (LETT |k| 1 . #10#) (LETT #2# |og| . #10#) G190
                          (COND ((|greater_SI| |k| #2#) (GO G191)))
                          (SEQ (SPADCALL |f| |i| |j| (QREFELT $ 19))
                               (EXIT (LETT |i| (+ |i| 1) . #10#)))
                          (LETT |k| (|inc_SI| |k|) . #10#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #3# (CDR #3#) . #10#) (GO G190) G191 (EXIT NIL))
          (EXIT |f|)))) 

(SDEFUN |REP1;antisymmetricTensors;MPiM;3|
        ((|a| |Matrix| R) (|k| |PositiveInteger|) ($ |Matrix| R))
        (SPROG
         ((#1=#:G761 NIL) (|t| NIL) (#2=#:G762 NIL) (|tt| NIL) (#3=#:G759 NIL)
          (|r| NIL) (#4=#:G760 NIL) (|rr| NIL) (|c| #5=(|Matrix| R))
          (#6=#:G757 NIL) (|j| NIL) (#7=#:G758 NIL) (|lt| NIL) (#8=#:G755 NIL)
          (|i| NIL) (#9=#:G756 NIL) (|lr| NIL) (|b| #5#) (#10=#:G741 NIL)
          (#11=#:G740 NIL) (|ilc| (|List| (|List| (|Integer|))))
          (#12=#:G754 NIL) (#13=#:G753 NIL)
          (|ilr| (|List| (|List| (|Integer|)))) (#14=#:G752 NIL)
          (#15=#:G751 NIL) (|mc| #16=(|Integer|)) (|mr| #16#)
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nr| (ANROWS |a|) . #17=(|REP1;antisymmetricTensors;MPiM;3|))
          (LETT |nc| (ANCOLS |a|) . #17#)
          (EXIT
           (COND ((EQL |k| 1) |a|)
                 ((SPADCALL |k| (MIN |nr| |nc|) (QREFELT $ 22))
                  (|error|
                   "second parameter for antisymmetricTensors is too large"))
                 ('T
                  (SEQ (LETT |mr| (SPADCALL |nr| |k| (QREFELT $ 23)) . #17#)
                       (LETT |mc| (SPADCALL |nc| |k| (QREFELT $ 23)) . #17#)
                       (LETT |ilr|
                             (PROGN
                              (LETT #15# NIL . #17#)
                              (SEQ (LETT |i| 0 . #17#)
                                   (LETT #14# (- |mr| 1) . #17#) G190
                                   (COND ((|greater_SI| |i| #14#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #15#
                                           (CONS
                                            (SPADCALL |nr| |k| |i|
                                                      (QREFELT $ 25))
                                            #15#)
                                           . #17#)))
                                   (LETT |i| (|inc_SI| |i|) . #17#) (GO G190)
                                   G191 (EXIT (NREVERSE #15#))))
                             . #17#)
                       (LETT |ilc|
                             (PROGN
                              (LETT #13# NIL . #17#)
                              (SEQ (LETT |i| 0 . #17#)
                                   (LETT #12# (- |mc| 1) . #17#) G190
                                   (COND ((|greater_SI| |i| #12#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #13#
                                           (CONS
                                            (SPADCALL |nc| |k| |i|
                                                      (QREFELT $ 25))
                                            #13#)
                                           . #17#)))
                                   (LETT |i| (|inc_SI| |i|) . #17#) (GO G190)
                                   G191 (EXIT (NREVERSE #13#))))
                             . #17#)
                       (LETT |b|
                             (SPADCALL
                              (PROG1 (LETT #11# |mr| . #17#)
                                (|check_subtype2| (>= #11# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #11#))
                              (PROG1 (LETT #10# |mc| . #17#)
                                (|check_subtype2| (>= #10# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #10#))
                              (QREFELT $ 27))
                             . #17#)
                       (SEQ (LETT |lr| NIL . #17#) (LETT #9# |ilr| . #17#)
                            (LETT |i| 1 . #17#) (LETT #8# |mr| . #17#) G190
                            (COND
                             ((OR (|greater_SI| |i| #8#) (ATOM #9#)
                                  (PROGN (LETT |lr| (CAR #9#) . #17#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |lt| NIL . #17#)
                                   (LETT #7# |ilc| . #17#) (LETT |j| 1 . #17#)
                                   (LETT #6# |mc| . #17#) G190
                                   (COND
                                    ((OR (|greater_SI| |j| #6#) (ATOM #7#)
                                         (PROGN
                                          (LETT |lt| (CAR #7#) . #17#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |c| (SPADCALL |k| |k| (QREFELT $ 27))
                                          . #17#)
                                    (SEQ (LETT |rr| NIL . #17#)
                                         (LETT #4# |lr| . #17#)
                                         (LETT |r| 1 . #17#)
                                         (LETT #3# |k| . #17#) G190
                                         (COND
                                          ((OR (|greater_SI| |r| #3#)
                                               (ATOM #4#)
                                               (PROGN
                                                (LETT |rr| (CAR #4#) . #17#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ (LETT |tt| NIL . #17#)
                                                (LETT #2# |lt| . #17#)
                                                (LETT |t| 1 . #17#)
                                                (LETT #1# |k| . #17#) G190
                                                (COND
                                                 ((OR (|greater_SI| |t| #1#)
                                                      (ATOM #2#)
                                                      (PROGN
                                                       (LETT |tt| (CAR #2#)
                                                             . #17#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (SPADCALL |c| |r| |t|
                                                            (SPADCALL |a|
                                                                      (+ 1
                                                                         |rr|)
                                                                      (+ 1
                                                                         |tt|)
                                                                      (QREFELT
                                                                       $ 28))
                                                            (QREFELT $ 29))))
                                                (LETT |t|
                                                      (PROG1 (|inc_SI| |t|)
                                                        (LETT #2# (CDR #2#)
                                                              . #17#))
                                                      . #17#)
                                                (GO G190) G191 (EXIT NIL))))
                                         (LETT |r|
                                               (PROG1 (|inc_SI| |r|)
                                                 (LETT #4# (CDR #4#) . #17#))
                                               . #17#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (SPADCALL |b| |i| |j|
                                               (SPADCALL |c| (QREFELT $ 30))
                                               (QREFELT $ 29))))
                                   (LETT |j|
                                         (PROG1 (|inc_SI| |j|)
                                           (LETT #7# (CDR #7#) . #17#))
                                         . #17#)
                                   (GO G190) G191 (EXIT NIL))))
                            (LETT |i|
                                  (PROG1 (|inc_SI| |i|)
                                    (LETT #9# (CDR #9#) . #17#))
                                  . #17#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT |b|)))))))) 

(SDEFUN |REP1;antisymmetricTensors;LPiL;4|
        ((|la| |List| (|Matrix| R)) (|k| |PositiveInteger|)
         ($ |List| (|Matrix| R)))
        (SPROG ((#1=#:G766 NIL) (|ma| NIL) (#2=#:G765 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|REP1;antisymmetricTensors;LPiL;4|))
                 (SEQ (LETT |ma| NIL . #3#) (LETT #1# |la| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ma| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |ma| |k| (QREFELT $ 32)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;symmetricTensors;MPiM;5|
        ((|a| |Matrix| R) (|n| |PositiveInteger|) ($ |Matrix| R))
        (SPROG
         ((|colemanMatrix| (|Matrix| (|Integer|))) (|help| (R)) (#1=#:G770 NIL)
          (#2=#:G769 NIL) (#3=#:G783 NIL) (|k| NIL)
          (|gamma| (|List| (|Integer|))) (|g| #4=(|Vector| (|Integer|)))
          (|beta| #5=(|List| (|Integer|))) (#6=#:G782 NIL) (|j| NIL) (|f| #4#)
          (|alpha| #5#) (#7=#:G781 NIL) (|i| NIL)
          (|nullMatrix| (|Matrix| (|Integer|))) (|c| (|Matrix| R))
          (|dimc| (|NonNegativeInteger|)) (#8=#:G768 NIL)
          (|dimr| (|NonNegativeInteger|)) (#9=#:G767 NIL)
          (|mc| (|NonNegativeInteger|)) (|mr| (|NonNegativeInteger|)))
         (SEQ (LETT |mr| (ANROWS |a|) . #10=(|REP1;symmetricTensors;MPiM;5|))
              (LETT |mc| (ANCOLS |a|) . #10#)
              (EXIT
               (COND ((EQL |n| 1) |a|)
                     ('T
                      (SEQ
                       (LETT |dimr|
                             (PROG1
                                 (LETT #9#
                                       (SPADCALL (- (+ |mr| |n|) 1) |n|
                                                 (QREFELT $ 23))
                                       . #10#)
                               (|check_subtype2| (>= #9# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #9#))
                             . #10#)
                       (LETT |dimc|
                             (PROG1
                                 (LETT #8#
                                       (SPADCALL (- (+ |mc| |n|) 1) |n|
                                                 (QREFELT $ 23))
                                       . #10#)
                               (|check_subtype2| (>= #8# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #8#))
                             . #10#)
                       (LETT |c|
                             (MAKE_MATRIX1 |dimr| |dimc| (|spadConstant| $ 17))
                             . #10#)
                       (LETT |f| (MAKEARR1 |n| 0) . #10#)
                       (LETT |g| (MAKEARR1 |n| 0) . #10#)
                       (LETT |nullMatrix| (MAKE_MATRIX1 1 1 0) . #10#)
                       (SEQ (LETT |i| 1 . #10#) (LETT #7# |dimr| . #10#) G190
                            (COND ((|greater_SI| |i| #7#) (GO G191)))
                            (SEQ
                             (LETT |alpha|
                                   (SPADCALL |n| |mr| (- |i| 1) (QREFELT $ 35))
                                   . #10#)
                             (LETT |f| (|REP1;invContent| |alpha| $) . #10#)
                             (EXIT
                              (SEQ (LETT |j| 1 . #10#) (LETT #6# |dimc| . #10#)
                                   G190
                                   (COND ((|greater_SI| |j| #6#) (GO G191)))
                                   (SEQ
                                    (LETT |beta|
                                          (SPADCALL |n| |mc| (- |j| 1)
                                                    (QREFELT $ 35))
                                          . #10#)
                                    (LETT |g| (|REP1;invContent| |beta| $)
                                          . #10#)
                                    (LETT |colemanMatrix|
                                          (SPADCALL |alpha| |beta| |nullMatrix|
                                                    (QREFELT $ 36))
                                          . #10#)
                                    (EXIT
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (SPADCALL |colemanMatrix|
                                                       |nullMatrix|
                                                       (QREFELT $ 37)))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |gamma|
                                                 (SPADCALL |alpha| |beta|
                                                           |colemanMatrix|
                                                           (QREFELT $ 38))
                                                 . #10#)
                                           (LETT |help|
                                                 (SPADCALL
                                                  (|REP1;calcCoef| |beta|
                                                   |colemanMatrix| $)
                                                  (QREFELT $ 39))
                                                 . #10#)
                                           (SEQ (LETT |k| 1 . #10#)
                                                (LETT #3# |n| . #10#) G190
                                                (COND
                                                 ((|greater_SI| |k| #3#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT |help|
                                                        (SPADCALL |help|
                                                                  (SPADCALL |a|
                                                                            (PROG1
                                                                                (LETT
                                                                                 #2#
                                                                                 (+
                                                                                  1
                                                                                  (SPADCALL
                                                                                   |f|
                                                                                   |k|
                                                                                   (QREFELT
                                                                                    $
                                                                                    40)))
                                                                                 . #10#)
                                                                              (|check_subtype2|
                                                                               (>=
                                                                                #2#
                                                                                0)
                                                                               '(|NonNegativeInteger|)
                                                                               '(|Integer|)
                                                                               #2#))
                                                                            (PROG1
                                                                                (LETT
                                                                                 #1#
                                                                                 (+
                                                                                  1
                                                                                  (SPADCALL
                                                                                   |g|
                                                                                   (SPADCALL
                                                                                    |gamma|
                                                                                    |k|
                                                                                    (QREFELT
                                                                                     $
                                                                                     10))
                                                                                   (QREFELT
                                                                                    $
                                                                                    40)))
                                                                                 . #10#)
                                                                              (|check_subtype2|
                                                                               (>=
                                                                                #1#
                                                                                0)
                                                                               '(|NonNegativeInteger|)
                                                                               '(|Integer|)
                                                                               #1#))
                                                                            (QREFELT
                                                                             $
                                                                             28))
                                                                  (QREFELT $
                                                                           41))
                                                        . #10#)))
                                                (LETT |k| (|inc_SI| |k|)
                                                      . #10#)
                                                (GO G190) G191 (EXIT NIL))
                                           (SPADCALL |c| |i| |j|
                                                     (SPADCALL
                                                      (SPADCALL |c| |i| |j|
                                                                (QREFELT $ 28))
                                                      |help| (QREFELT $ 42))
                                                     (QREFELT $ 29))
                                           (EXIT
                                            (LETT |colemanMatrix|
                                                  (SPADCALL |alpha| |beta|
                                                            |colemanMatrix|
                                                            (QREFELT $ 36))
                                                  . #10#)))
                                          NIL (GO G190) G191 (EXIT NIL))))
                                   (LETT |j| (|inc_SI| |j|) . #10#) (GO G190)
                                   G191 (EXIT NIL))))
                            (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |c|)))))))) 

(SDEFUN |REP1;symmetricTensors;LPiL;6|
        ((|la| |List| (|Matrix| R)) (|k| |PositiveInteger|)
         ($ |List| (|Matrix| R)))
        (SPROG ((#1=#:G787 NIL) (|ma| NIL) (#2=#:G786 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|REP1;symmetricTensors;LPiL;6|))
                 (SEQ (LETT |ma| NIL . #3#) (LETT #1# |la| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ma| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |ma| |k| (QREFELT $ 43)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;tensorProduct;3M;7|
        ((|a| |Matrix| R) (|b| |Matrix| R) ($ |Matrix| R))
        (SPADCALL |a| |b| (QREFELT $ 45))) 

(SDEFUN |REP1;tensorProduct;3L;8|
        ((|la| |List| (|Matrix| R)) (|lb| |List| (|Matrix| R))
         ($ |List| (|Matrix| R)))
        (SPROG ((#1=#:G792 NIL) (|i| NIL) (#2=#:G791 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|REP1;tensorProduct;3L;8|))
                 (SEQ (LETT |i| 1 . #3#)
                      (LETT #1# (SPADCALL |la| (QREFELT $ 47)) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |la| |i| (QREFELT $ 48))
                                         (SPADCALL |lb| |i| (QREFELT $ 48))
                                         (QREFELT $ 46))
                               #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;tensorProduct;2M;9| ((|a| |Matrix| R) ($ |Matrix| R))
        (SPADCALL |a| |a| (QREFELT $ 46))) 

(SDEFUN |REP1;tensorProduct;2L;10|
        ((|la| |List| (|Matrix| R)) ($ |List| (|Matrix| R)))
        (SPADCALL |la| |la| (QREFELT $ 49))) 

(SDEFUN |REP1;permutationRepresentation;PIM;11|
        ((|p| |Permutation| (|Integer|)) (|n| |Integer|)
         ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G802 NIL) (|i| NIL) (|a| (|Matrix| (|Integer|)))
          (#2=#:G798 NIL) (#3=#:G797 NIL))
         (SEQ
          (LETT |a|
                (SPADCALL
                 (PROG1
                     (LETT #3# |n|
                           . #4=(|REP1;permutationRepresentation;PIM;11|))
                   (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #3#))
                 (PROG1 (LETT #2# |n| . #4#)
                   (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #2#))
                 (QREFELT $ 52))
                . #4#)
          (SEQ (LETT |i| 1 . #4#) (LETT #1# |n| . #4#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |a| (SPADCALL |p| |i| (QREFELT $ 54)) |i| 1
                           (QREFELT $ 55))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |a|)))) 

(SDEFUN |REP1;permutationRepresentation;LM;12|
        ((|p| |List| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G810 NIL) (|i| NIL) (|a| (|Matrix| (|Integer|)))
          (#2=#:G806 NIL) (#3=#:G805 NIL) (|n| (|Integer|)))
         (SEQ
          (LETT |n| (LENGTH |p|) . #4=(|REP1;permutationRepresentation;LM;12|))
          (LETT |a|
                (SPADCALL
                 (PROG1 (LETT #3# |n| . #4#)
                   (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #3#))
                 (PROG1 (LETT #2# |n| . #4#)
                   (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #2#))
                 (QREFELT $ 52))
                . #4#)
          (SEQ (LETT |i| 1 . #4#) (LETT #1# |n| . #4#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |a| (SPADCALL |p| |i| (QREFELT $ 10)) |i| 1
                           (QREFELT $ 55))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |a|)))) 

(SDEFUN |REP1;permutationRepresentation;LIL;13|
        ((|listperm| |List| (|Permutation| (|Integer|))) (|n| |Integer|)
         ($ |List| (|Matrix| (|Integer|))))
        (SPROG ((#1=#:G814 NIL) (|perm| NIL) (#2=#:G813 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|REP1;permutationRepresentation;LIL;13|))
                 (SEQ (LETT |perm| NIL . #3#) (LETT #1# |listperm| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |perm| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |perm| |n| (QREFELT $ 56)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;permutationRepresentation;LL;14|
        ((|listperm| |List| (|List| (|Integer|)))
         ($ |List| (|Matrix| (|Integer|))))
        (SPROG ((#1=#:G818 NIL) (|perm| NIL) (#2=#:G817 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|REP1;permutationRepresentation;LL;14|))
                 (SEQ (LETT |perm| NIL . #3#) (LETT #1# |listperm| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |perm| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |perm| (QREFELT $ 57)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;createGenericMatrix;NniM;15|
        ((|m| |NonNegativeInteger|) ($ |Matrix| (|Polynomial| R)))
        (SPROG
         ((|sy| (|Symbol|)) (|le| (|List| (|OutputForm|)))
          (|jof| #1=(|OutputForm|)) (|iof| #1#) (#2=#:G833 NIL) (|j| NIL)
          (#3=#:G832 NIL) (|i| NIL) (|res| (|Matrix| (|Polynomial| R))))
         (SEQ
          (LETT |res| (MAKE_MATRIX1 |m| |m| (|spadConstant| $ 64))
                . #4=(|REP1;createGenericMatrix;NniM;15|))
          (SEQ (LETT |i| 1 . #4#) (LETT #3# |m| . #4#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #4#) (LETT #2# |m| . #4#) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ (LETT |iof| (SPADCALL |i| (QREFELT $ 66)) . #4#)
                           (LETT |jof| (SPADCALL |j| (QREFELT $ 66)) . #4#)
                           (LETT |le|
                                 (CONS |iof| (SPADCALL |jof| (QREFELT $ 68)))
                                 . #4#)
                           (LETT |sy| (SPADCALL '|x| |le| (QREFELT $ 70))
                                 . #4#)
                           (EXIT
                            (SPADCALL |res| |i| |j|
                                      (SPADCALL |sy| (QREFELT $ 71))
                                      (QREFELT $ 73))))
                      (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |RepresentationPackage1;|)) 

(DEFUN |RepresentationPackage1| (#1=#:G834)
  (SPROG NIL
         (PROG (#2=#:G835)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RepresentationPackage1|)
                                               '|domainEqualList|)
                    . #3=(|RepresentationPackage1|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RepresentationPackage1;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RepresentationPackage1|)))))))))) 

(DEFUN |RepresentationPackage1;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RepresentationPackage1|))
          (LETT |dv$| (LIST '|RepresentationPackage1| DV$1) . #1#)
          (LETT $ (GETREFV 75) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|RepresentationPackage1| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 32
                       (CONS
                        (|dispatchFunction| |REP1;antisymmetricTensors;MPiM;3|)
                        $))
             (QSETREFV $ 34
                       (CONS
                        (|dispatchFunction| |REP1;antisymmetricTensors;LPiL;4|)
                        $)))))
          $))) 

(MAKEPROP '|RepresentationPackage1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|) (|List| 7)
              (0 . |maxIndex|) (5 . |elt|) (|Vector| 7) (|Matrix| 7)
              (11 . |row|) (17 . |entries|) (|IntegerCombinatoricFunctions| 7)
              (22 . |multinomial|) (28 . |Zero|) (32 . |One|) (36 . |setelt!|)
              (|Boolean|) (|NonNegativeInteger|) (43 . >) (49 . |binomial|)
              (|SymmetricGroupCombinatoricFunctions|) (55 . |subSet|)
              (|Matrix| 6) (62 . |zero|) (68 . |elt|) (75 . |setelt!|)
              (83 . |determinant|) (|PositiveInteger|)
              (88 . |antisymmetricTensors|) (|List| 26)
              (94 . |antisymmetricTensors|) (100 . |unrankImproperPartitions1|)
              (107 . |nextColeman|) (114 . ~=) (120 . |inverseColeman|)
              (127 . |coerce|) (132 . |elt|) (138 . *) (144 . +)
              |REP1;symmetricTensors;MPiM;5| |REP1;symmetricTensors;LPiL;6|
              (150 . |kroneckerProduct|) |REP1;tensorProduct;3M;7|
              (156 . |maxIndex|) (161 . |elt|) |REP1;tensorProduct;3L;8|
              |REP1;tensorProduct;2M;9| |REP1;tensorProduct;2L;10|
              (167 . |zero|) (|Permutation| 7) (173 . |eval|) (179 . |setelt!|)
              |REP1;permutationRepresentation;PIM;11|
              |REP1;permutationRepresentation;LM;12| (|List| 12) (|List| 53)
              |REP1;permutationRepresentation;LIL;13| (|List| 8)
              |REP1;permutationRepresentation;LL;14| (|Polynomial| 6)
              (187 . |Zero|) (|OutputForm|) (191 . |coerce|) (|List| 65)
              (196 . |list|) (|Symbol|) (201 . |subscript|) (207 . |coerce|)
              (|Matrix| 63) (212 . |setelt!|)
              |REP1;createGenericMatrix;NniM;15|)
           '#(|tensorProduct| 220 |symmetricTensors| 242
              |permutationRepresentation| 254 |createGenericMatrix| 276
              |antisymmetricTensors| 281)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 74
                                                 '(1 8 7 0 9 2 8 7 0 7 10 2 12
                                                   11 0 7 13 1 11 8 0 14 2 15 7
                                                   7 8 16 0 6 0 17 0 6 0 18 3
                                                   11 7 0 7 7 19 2 21 20 0 0 22
                                                   2 15 7 7 7 23 3 24 8 7 7 7
                                                   25 2 26 0 21 21 27 3 26 6 0
                                                   7 7 28 4 26 6 0 7 7 6 29 1
                                                   26 6 0 30 2 0 26 26 31 32 2
                                                   0 33 33 31 34 3 24 8 7 7 7
                                                   35 3 24 12 8 8 12 36 2 12 20
                                                   0 0 37 3 24 8 8 8 12 38 1 6
                                                   0 7 39 2 11 7 0 7 40 2 6 0 0
                                                   0 41 2 6 0 0 0 42 2 26 0 0 0
                                                   45 1 33 7 0 47 2 33 26 0 7
                                                   48 2 12 0 21 21 52 2 53 7 0
                                                   7 54 4 12 7 0 7 7 7 55 0 63
                                                   0 64 1 7 65 0 66 1 67 0 65
                                                   68 2 69 0 0 67 70 1 63 0 69
                                                   71 4 72 63 0 7 7 63 73 2 0
                                                   26 26 26 46 2 0 33 33 33 49
                                                   1 0 33 33 51 1 0 26 26 50 2
                                                   0 26 26 31 43 2 0 33 33 31
                                                   44 1 0 12 8 57 2 0 12 53 7
                                                   56 1 0 58 61 62 2 0 58 59 7
                                                   60 1 0 72 21 74 2 1 26 26 31
                                                   32 2 1 33 33 31 34)))))
           '|lookupComplete|)) 
