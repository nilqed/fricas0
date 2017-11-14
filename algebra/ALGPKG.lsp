
(SDEFUN |ALGPKG;convVM| ((|v| |Vector| R) ($ |Matrix| R))
        (SPROG
         ((|z| (|Integer|)) (#1=#:G710 NIL) (|j| NIL) (#2=#:G709 NIL) (|i| NIL)
          (|cond| (|Matrix| R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT $ 10) (QREFELT $ 10)
                              (|spadConstant| $ 16))
                . #3=(|ALGPKG;convVM|))
          (LETT |z| 0 . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 10) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #3#) (LETT #1# (QREFELT $ 10) . #3#) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ (LETT |z| (+ |z| 1) . #3#)
                           (EXIT
                            (SPADCALL |cond| |i| |j|
                                      (SPADCALL |v| |z| (QREFELT $ 20))
                                      (QREFELT $ 22))))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |cond|)))) 

(SDEFUN |ALGPKG;radicalOfLeftTraceForm;L;2| (($ |List| A))
        (SPROG ((|ma| (|Matrix| R)))
               (SEQ
                (LETT |ma| (SPADCALL (QREFELT $ 23))
                      |ALGPKG;radicalOfLeftTraceForm;L;2|)
                (EXIT
                 (SPADCALL (ELT $ 24) (SPADCALL |ma| (QREFELT $ 26))
                           (QREFELT $ 30)))))) 

(SDEFUN |ALGPKG;basisOfLeftAnnihilator;AL;3| ((|a| A) ($ |List| A))
        (SPROG
         ((|cond| (|Matrix| R)) (#1=#:G720 NIL) (#2=#:G722 NIL) (|i| NIL)
          (#3=#:G721 NIL) (|ca| (|Matrix| R)))
         (SEQ
          (LETT |ca|
                (SPADCALL
                 (SPADCALL (SPADCALL |a| (QREFELT $ 32)) (QREFELT $ 33))
                 (QREFELT $ 34))
                . #4=(|ALGPKG;basisOfLeftAnnihilator;AL;3|))
          (LETT |cond|
                (SPADCALL (ELT $ 35)
                          (PROGN
                           (LETT #3# (GETREFV #5=(QVSIZE (QREFELT $ 15)))
                                 . #4#)
                           (SEQ (LETT |i| 1 . #4#) (LETT #2# #5# . #4#)
                                (LETT #1# 0 . #4#) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SETELT #3# #1#
                                          (SPADCALL |ca|
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 15)
                                                               |i|
                                                               (QREFELT $ 36))
                                                     (QREFELT $ 34))
                                                    (QREFELT $ 37)))))
                                (LETT #1#
                                      (PROG1 (|inc_SI| #1#)
                                        (LETT |i| (|inc_SI| |i|) . #4#))
                                      . #4#)
                                (GO G190) G191 (EXIT NIL))
                           #3#)
                          (QREFELT $ 39))
                . #4#)
          (EXIT
           (SPADCALL (ELT $ 24) (SPADCALL |cond| (QREFELT $ 26))
                     (QREFELT $ 30)))))) 

(SDEFUN |ALGPKG;basisOfRightAnnihilator;AL;4| ((|a| A) ($ |List| A))
        (SPROG
         ((|cond| (|Matrix| R)) (#1=#:G729 NIL) (#2=#:G731 NIL) (|i| NIL)
          (#3=#:G730 NIL) (|ca| (|Matrix| R)))
         (SEQ
          (LETT |ca|
                (SPADCALL
                 (SPADCALL (SPADCALL |a| (QREFELT $ 32)) (QREFELT $ 33))
                 (QREFELT $ 34))
                . #4=(|ALGPKG;basisOfRightAnnihilator;AL;4|))
          (LETT |cond|
                (SPADCALL (ELT $ 35)
                          (PROGN
                           (LETT #3# (GETREFV #5=(QVSIZE (QREFELT $ 15)))
                                 . #4#)
                           (SEQ (LETT |i| 1 . #4#) (LETT #2# #5# . #4#)
                                (LETT #1# 0 . #4#) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SETELT #3# #1#
                                          (SPADCALL |ca|
                                                    (SPADCALL (QREFELT $ 15)
                                                              |i|
                                                              (QREFELT $ 36))
                                                    (QREFELT $ 37)))))
                                (LETT #1#
                                      (PROG1 (|inc_SI| #1#)
                                        (LETT |i| (|inc_SI| |i|) . #4#))
                                      . #4#)
                                (GO G190) G191 (EXIT NIL))
                           #3#)
                          (QREFELT $ 39))
                . #4#)
          (EXIT
           (SPADCALL (ELT $ 24) (SPADCALL |cond| (QREFELT $ 26))
                     (QREFELT $ 30)))))) 

(SDEFUN |ALGPKG;basisOfLeftNucloid;L;5| (($ |List| (|Matrix| R)))
        (SPROG
         ((#1=#:G747 NIL) (|sol| NIL) (#2=#:G746 NIL) (|r2| (|Integer|))
          (|r1| (|Integer|)) (#3=#:G745 NIL) (|r| NIL) (|z| (|Integer|))
          (#4=#:G744 NIL) (|k| NIL) (#5=#:G743 NIL) (|j| NIL) (#6=#:G742 NIL)
          (|i| NIL) (|condo| #7=(|Matrix| R)) (|cond| #7#))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT $ 12) (QREFELT $ 11)
                              (|spadConstant| $ 16))
                . #8=(|ALGPKG;basisOfLeftNucloid;L;5|))
          (LETT |condo|
                (MAKE_MATRIX1 (QREFELT $ 12) (QREFELT $ 11)
                              (|spadConstant| $ 16))
                . #8#)
          (LETT |z| 0 . #8#)
          (SEQ (LETT |i| 1 . #8#) (LETT #6# (QREFELT $ 10) . #8#) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #8#) (LETT #5# (QREFELT $ 10) . #8#) G190
                      (COND ((|greater_SI| |j| #5#) (GO G191)))
                      (SEQ (LETT |r1| 0 . #8#)
                           (EXIT
                            (SEQ (LETT |k| 1 . #8#)
                                 (LETT #4# (QREFELT $ 10) . #8#) G190
                                 (COND ((|greater_SI| |k| #4#) (GO G191)))
                                 (SEQ (LETT |z| (+ |z| 1) . #8#)
                                      (LETT |r2| |i| . #8#)
                                      (EXIT
                                       (SEQ (LETT |r| 1 . #8#)
                                            (LETT #3# (QREFELT $ 10) . #8#)
                                            G190
                                            (COND
                                             ((|greater_SI| |r| #3#)
                                              (GO G191)))
                                            (SEQ (LETT |r1| (+ |r1| 1) . #8#)
                                                 (SPADCALL |cond| |z| |r1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QREFELT $ 15) |r|
                                                             (QREFELT $ 36))
                                                            |i| |j|
                                                            (QREFELT $ 42))
                                                           (QREFELT $ 22))
                                                 (SPADCALL |condo| |z| |r2|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT $ 15)
                                                              |k|
                                                              (QREFELT $ 36))
                                                             |r| |j|
                                                             (QREFELT $ 42))
                                                            (QREFELT $ 43))
                                                           (QREFELT $ 22))
                                                 (EXIT
                                                  (LETT |r2|
                                                        (+ |r2| (QREFELT $ 10))
                                                        . #8#)))
                                            (LETT |r| (|inc_SI| |r|) . #8#)
                                            (GO G190) G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #2# NIL . #8#)
            (SEQ (LETT |sol| NIL . #8#)
                 (LETT #1#
                       (SPADCALL (SPADCALL |cond| |condo| (QREFELT $ 44))
                                 (QREFELT $ 26))
                       . #8#)
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT (LETT #2# (CONS (|ALGPKG;convVM| |sol| $) #2#) . #8#)))
                 (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |ALGPKG;basisOfCommutingElements;L;6| (($ |List| A))
        (SPROG
         ((|cond| (|Matrix| R)) (|gam| (|Matrix| R)) (#1=#:G754 NIL)
          (#2=#:G756 NIL) (|i| NIL) (#3=#:G755 NIL))
         (SEQ
          (LETT |cond|
                (SPADCALL (ELT $ 35)
                          (PROGN
                           (LETT #3# (GETREFV #4=(QVSIZE (QREFELT $ 15)))
                                 . #5=(|ALGPKG;basisOfCommutingElements;L;6|))
                           (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#)
                                (LETT #1# 0 . #5#) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SETELT #3# #1#
                                          (SPADCALL
                                           (LETT |gam|
                                                 (SPADCALL (QREFELT $ 15) |i|
                                                           (QREFELT $ 36))
                                                 . #5#)
                                           (SPADCALL |gam| (QREFELT $ 34))
                                           (QREFELT $ 47)))))
                                (LETT #1#
                                      (PROG1 (|inc_SI| #1#)
                                        (LETT |i| (|inc_SI| |i|) . #5#))
                                      . #5#)
                                (GO G190) G191 (EXIT NIL))
                           #3#)
                          (QREFELT $ 39))
                . #5#)
          (EXIT
           (SPADCALL (ELT $ 24) (SPADCALL |cond| (QREFELT $ 26))
                     (QREFELT $ 30)))))) 

(SDEFUN |ALGPKG;basisOfLeftNucleus;L;7| (($ |List| A))
        (SPROG
         ((|entry| (R)) (#1=#:G771 NIL) (|l| NIL) (#2=#:G770 NIL) (|i| NIL)
          (|z| (|Integer|)) (#3=#:G769 NIL) (|s| NIL) (#4=#:G768 NIL) (|j| NIL)
          (#5=#:G767 NIL) (|k| NIL) (|condi| (|Matrix| R)))
         (SEQ
          (LETT |condi|
                (MAKE_MATRIX1 (QREFELT $ 12) (QREFELT $ 10)
                              (|spadConstant| $ 16))
                . #6=(|ALGPKG;basisOfLeftNucleus;L;7|))
          (LETT |z| 0 . #6#)
          (SEQ (LETT |k| 1 . #6#) (LETT #5# (QREFELT $ 10) . #6#) G190
               (COND ((|greater_SI| |k| #5#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #6#) (LETT #4# (QREFELT $ 10) . #6#) G190
                      (COND ((|greater_SI| |j| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |s| 1 . #6#) (LETT #3# (QREFELT $ 10) . #6#)
                             G190 (COND ((|greater_SI| |s| #3#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1) . #6#)
                                  (EXIT
                                   (SEQ (LETT |i| 1 . #6#)
                                        (LETT #2# (QREFELT $ 10) . #6#) G190
                                        (COND
                                         ((|greater_SI| |i| #2#) (GO G191)))
                                        (SEQ
                                         (LETT |entry| (|spadConstant| $ 16)
                                               . #6#)
                                         (SEQ (LETT |l| 1 . #6#)
                                              (LETT #1# (QREFELT $ 10) . #6#)
                                              G190
                                              (COND
                                               ((|greater_SI| |l| #1#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |entry|
                                                      (SPADCALL
                                                       (SPADCALL |entry|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |l|
                                                                    (QREFELT $
                                                                             36))
                                                                   |j| |k|
                                                                   (QREFELT $
                                                                            42))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |s|
                                                                    (QREFELT $
                                                                             36))
                                                                   |i| |l|
                                                                   (QREFELT $
                                                                            42))
                                                                  (QREFELT $
                                                                           49))
                                                                 (QREFELT $
                                                                          50))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |l|
                                                          (QREFELT $ 36))
                                                         |i| |j|
                                                         (QREFELT $ 42))
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |s|
                                                          (QREFELT $ 36))
                                                         |l| |k|
                                                         (QREFELT $ 42))
                                                        (QREFELT $ 49))
                                                       (QREFELT $ 51))
                                                      . #6#)))
                                              (LETT |l| (|inc_SI| |l|) . #6#)
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (SPADCALL |condi| |z| |i| |entry|
                                                    (QREFELT $ 22))))
                                        (LETT |i| (|inc_SI| |i|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                             (LETT |s| (|inc_SI| |s|) . #6#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (ELT $ 24) (SPADCALL |condi| (QREFELT $ 26))
                     (QREFELT $ 30)))))) 

(SDEFUN |ALGPKG;basisOfRightNucleus;L;8| (($ |List| A))
        (SPROG
         ((|entry| (R)) (#1=#:G786 NIL) (|l| NIL) (#2=#:G785 NIL) (|i| NIL)
          (|z| (|Integer|)) (#3=#:G784 NIL) (|s| NIL) (#4=#:G783 NIL) (|j| NIL)
          (#5=#:G782 NIL) (|k| NIL) (|condo| (|Matrix| R)))
         (SEQ
          (LETT |condo|
                (MAKE_MATRIX1 (QREFELT $ 12) (QREFELT $ 10)
                              (|spadConstant| $ 16))
                . #6=(|ALGPKG;basisOfRightNucleus;L;8|))
          (LETT |z| 0 . #6#)
          (SEQ (LETT |k| 1 . #6#) (LETT #5# (QREFELT $ 10) . #6#) G190
               (COND ((|greater_SI| |k| #5#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #6#) (LETT #4# (QREFELT $ 10) . #6#) G190
                      (COND ((|greater_SI| |j| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |s| 1 . #6#) (LETT #3# (QREFELT $ 10) . #6#)
                             G190 (COND ((|greater_SI| |s| #3#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1) . #6#)
                                  (EXIT
                                   (SEQ (LETT |i| 1 . #6#)
                                        (LETT #2# (QREFELT $ 10) . #6#) G190
                                        (COND
                                         ((|greater_SI| |i| #2#) (GO G191)))
                                        (SEQ
                                         (LETT |entry| (|spadConstant| $ 16)
                                               . #6#)
                                         (SEQ (LETT |l| 1 . #6#)
                                              (LETT #1# (QREFELT $ 10) . #6#)
                                              G190
                                              (COND
                                               ((|greater_SI| |l| #1#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |entry|
                                                      (SPADCALL
                                                       (SPADCALL |entry|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |l|
                                                                    (QREFELT $
                                                                             36))
                                                                   |k| |i|
                                                                   (QREFELT $
                                                                            42))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |s|
                                                                    (QREFELT $
                                                                             36))
                                                                   |j| |l|
                                                                   (QREFELT $
                                                                            42))
                                                                  (QREFELT $
                                                                           49))
                                                                 (QREFELT $
                                                                          50))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |l|
                                                          (QREFELT $ 36))
                                                         |j| |k|
                                                         (QREFELT $ 42))
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |s|
                                                          (QREFELT $ 36))
                                                         |l| |i|
                                                         (QREFELT $ 42))
                                                        (QREFELT $ 49))
                                                       (QREFELT $ 51))
                                                      . #6#)))
                                              (LETT |l| (|inc_SI| |l|) . #6#)
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (SPADCALL |condo| |z| |i| |entry|
                                                    (QREFELT $ 22))))
                                        (LETT |i| (|inc_SI| |i|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                             (LETT |s| (|inc_SI| |s|) . #6#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (ELT $ 24) (SPADCALL |condo| (QREFELT $ 26))
                     (QREFELT $ 30)))))) 

(SDEFUN |ALGPKG;basisOfMiddleNucleus;L;9| (($ |List| A))
        (SPROG
         ((|entry| (R)) (#1=#:G801 NIL) (|l| NIL) (#2=#:G800 NIL) (|i| NIL)
          (|z| (|Integer|)) (#3=#:G799 NIL) (|s| NIL) (#4=#:G798 NIL) (|j| NIL)
          (#5=#:G797 NIL) (|k| NIL) (|conda| (|Matrix| R)))
         (SEQ
          (LETT |conda|
                (MAKE_MATRIX1 (QREFELT $ 12) (QREFELT $ 10)
                              (|spadConstant| $ 16))
                . #6=(|ALGPKG;basisOfMiddleNucleus;L;9|))
          (LETT |z| 0 . #6#)
          (SEQ (LETT |k| 1 . #6#) (LETT #5# (QREFELT $ 10) . #6#) G190
               (COND ((|greater_SI| |k| #5#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #6#) (LETT #4# (QREFELT $ 10) . #6#) G190
                      (COND ((|greater_SI| |j| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |s| 1 . #6#) (LETT #3# (QREFELT $ 10) . #6#)
                             G190 (COND ((|greater_SI| |s| #3#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1) . #6#)
                                  (EXIT
                                   (SEQ (LETT |i| 1 . #6#)
                                        (LETT #2# (QREFELT $ 10) . #6#) G190
                                        (COND
                                         ((|greater_SI| |i| #2#) (GO G191)))
                                        (SEQ
                                         (LETT |entry| (|spadConstant| $ 16)
                                               . #6#)
                                         (SEQ (LETT |l| 1 . #6#)
                                              (LETT #1# (QREFELT $ 10) . #6#)
                                              G190
                                              (COND
                                               ((|greater_SI| |l| #1#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |entry|
                                                      (SPADCALL
                                                       (SPADCALL |entry|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |l|
                                                                    (QREFELT $
                                                                             36))
                                                                   |j| |i|
                                                                   (QREFELT $
                                                                            42))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |s|
                                                                    (QREFELT $
                                                                             36))
                                                                   |l| |k|
                                                                   (QREFELT $
                                                                            42))
                                                                  (QREFELT $
                                                                           49))
                                                                 (QREFELT $
                                                                          50))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |l|
                                                          (QREFELT $ 36))
                                                         |i| |k|
                                                         (QREFELT $ 42))
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |s|
                                                          (QREFELT $ 36))
                                                         |j| |l|
                                                         (QREFELT $ 42))
                                                        (QREFELT $ 49))
                                                       (QREFELT $ 51))
                                                      . #6#)))
                                              (LETT |l| (|inc_SI| |l|) . #6#)
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (SPADCALL |conda| |z| |i| |entry|
                                                    (QREFELT $ 22))))
                                        (LETT |i| (|inc_SI| |i|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                             (LETT |s| (|inc_SI| |s|) . #6#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (ELT $ 24) (SPADCALL |conda| (QREFELT $ 26))
                     (QREFELT $ 30)))))) 

(SDEFUN |ALGPKG;basisOfNucleus;L;10| (($ |List| A))
        (SPROG
         ((|ent| (R)) (|enter| (R)) (|entry| (R)) (#1=#:G817 NIL) (|l| NIL)
          (#2=#:G816 NIL) (|i| NIL) (|w| (|Integer|)) (|u| (|Integer|))
          (|z| (|Integer|)) (#3=#:G815 NIL) (|s| NIL) (#4=#:G814 NIL) (|j| NIL)
          (#5=#:G813 NIL) (|k| NIL) (|condi| (|Matrix| R)))
         (SEQ
          (LETT |condi|
                (MAKE_MATRIX1 (* 3 (QREFELT $ 12)) (QREFELT $ 10)
                              (|spadConstant| $ 16))
                . #6=(|ALGPKG;basisOfNucleus;L;10|))
          (LETT |z| 0 . #6#) (LETT |u| (QREFELT $ 12) . #6#)
          (LETT |w| (* 2 (QREFELT $ 12)) . #6#)
          (SEQ (LETT |k| 1 . #6#) (LETT #5# (QREFELT $ 10) . #6#) G190
               (COND ((|greater_SI| |k| #5#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #6#) (LETT #4# (QREFELT $ 10) . #6#) G190
                      (COND ((|greater_SI| |j| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |s| 1 . #6#) (LETT #3# (QREFELT $ 10) . #6#)
                             G190 (COND ((|greater_SI| |s| #3#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1) . #6#)
                                  (LETT |u| (+ |u| 1) . #6#)
                                  (LETT |w| (+ |w| 1) . #6#)
                                  (EXIT
                                   (SEQ (LETT |i| 1 . #6#)
                                        (LETT #2# (QREFELT $ 10) . #6#) G190
                                        (COND
                                         ((|greater_SI| |i| #2#) (GO G191)))
                                        (SEQ
                                         (LETT |entry| (|spadConstant| $ 16)
                                               . #6#)
                                         (LETT |enter| (|spadConstant| $ 16)
                                               . #6#)
                                         (LETT |ent| (|spadConstant| $ 16)
                                               . #6#)
                                         (SEQ (LETT |l| 1 . #6#)
                                              (LETT #1# (QREFELT $ 10) . #6#)
                                              G190
                                              (COND
                                               ((|greater_SI| |l| #1#)
                                                (GO G191)))
                                              (SEQ
                                               (LETT |entry|
                                                     (SPADCALL
                                                      (SPADCALL |entry|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT $
                                                                            15)
                                                                   |l|
                                                                   (QREFELT $
                                                                            36))
                                                                  |j| |k|
                                                                  (QREFELT $
                                                                           42))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT $
                                                                            15)
                                                                   |s|
                                                                   (QREFELT $
                                                                            36))
                                                                  |i| |l|
                                                                  (QREFELT $
                                                                           42))
                                                                 (QREFELT $
                                                                          49))
                                                                (QREFELT $ 50))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 15) |l|
                                                         (QREFELT $ 36))
                                                        |i| |j| (QREFELT $ 42))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 15) |s|
                                                         (QREFELT $ 36))
                                                        |l| |k| (QREFELT $ 42))
                                                       (QREFELT $ 49))
                                                      (QREFELT $ 51))
                                                     . #6#)
                                               (LETT |enter|
                                                     (SPADCALL
                                                      (SPADCALL |enter|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT $
                                                                            15)
                                                                   |l|
                                                                   (QREFELT $
                                                                            36))
                                                                  |k| |i|
                                                                  (QREFELT $
                                                                           42))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT $
                                                                            15)
                                                                   |s|
                                                                   (QREFELT $
                                                                            36))
                                                                  |j| |l|
                                                                  (QREFELT $
                                                                           42))
                                                                 (QREFELT $
                                                                          49))
                                                                (QREFELT $ 50))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 15) |l|
                                                         (QREFELT $ 36))
                                                        |j| |k| (QREFELT $ 42))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 15) |s|
                                                         (QREFELT $ 36))
                                                        |l| |i| (QREFELT $ 42))
                                                       (QREFELT $ 49))
                                                      (QREFELT $ 51))
                                                     . #6#)
                                               (EXIT
                                                (LETT |ent|
                                                      (SPADCALL
                                                       (SPADCALL |ent|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |l|
                                                                    (QREFELT $
                                                                             36))
                                                                   |j| |k|
                                                                   (QREFELT $
                                                                            42))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |s|
                                                                    (QREFELT $
                                                                             36))
                                                                   |i| |l|
                                                                   (QREFELT $
                                                                            42))
                                                                  (QREFELT $
                                                                           49))
                                                                 (QREFELT $
                                                                          50))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |l|
                                                          (QREFELT $ 36))
                                                         |j| |i|
                                                         (QREFELT $ 42))
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |s|
                                                          (QREFELT $ 36))
                                                         |l| |k|
                                                         (QREFELT $ 42))
                                                        (QREFELT $ 49))
                                                       (QREFELT $ 51))
                                                      . #6#)))
                                              (LETT |l| (|inc_SI| |l|) . #6#)
                                              (GO G190) G191 (EXIT NIL))
                                         (SPADCALL |condi| |z| |i| |entry|
                                                   (QREFELT $ 22))
                                         (SPADCALL |condi| |u| |i| |enter|
                                                   (QREFELT $ 22))
                                         (EXIT
                                          (SPADCALL |condi| |w| |i| |ent|
                                                    (QREFELT $ 22))))
                                        (LETT |i| (|inc_SI| |i|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                             (LETT |s| (|inc_SI| |s|) . #6#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (ELT $ 24) (SPADCALL |condi| (QREFELT $ 26))
                     (QREFELT $ 30)))))) 

(SDEFUN |ALGPKG;basisOfCenter;L;11| (($ |List| A))
        (SPROG
         ((D #1=(|Matrix| R)) (|enter| (R)) (|entry| (R)) (#2=#:G836 NIL)
          (|l| NIL) (#3=#:G835 NIL) (|i| NIL) (|u| (|Integer|))
          (|z| (|Integer|)) (#4=#:G834 NIL) (|s| NIL) (#5=#:G833 NIL) (|j| NIL)
          (#6=#:G832 NIL) (|k| NIL) (|condi| (|Matrix| R)) (B #1#)
          (|cond| (|Matrix| R)) (|gammak| (|Matrix| R)) (#7=#:G831 NIL)
          (|gamma1| (|Matrix| R)))
         (SEQ
          (LETT |gamma1| (SPADCALL (QREFELT $ 15) (QREFELT $ 56))
                . #8=(|ALGPKG;basisOfCenter;L;11|))
          (LETT |gamma1|
                (SPADCALL |gamma1| (SPADCALL |gamma1| (QREFELT $ 34))
                          (QREFELT $ 47))
                . #8#)
          (LETT |cond| |gamma1| . #8#)
          (SEQ (LETT |i| 2 . #8#) (LETT #7# (QREFELT $ 10) . #8#) G190
               (COND ((|greater_SI| |i| #7#) (GO G191)))
               (SEQ
                (LETT |gammak| (SPADCALL (QREFELT $ 15) |i| (QREFELT $ 36))
                      . #8#)
                (LETT |gammak|
                      (SPADCALL |gammak| (SPADCALL |gammak| (QREFELT $ 34))
                                (QREFELT $ 47))
                      . #8#)
                (EXIT
                 (LETT |cond| (SPADCALL |cond| |gammak| (QREFELT $ 35))
                       . #8#)))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (LETT B |cond| . #8#)
          (LETT |condi|
                (MAKE_MATRIX1 (* 2 (QREFELT $ 12)) (QREFELT $ 10)
                              (|spadConstant| $ 16))
                . #8#)
          (LETT |z| 0 . #8#) (LETT |u| (QREFELT $ 12) . #8#)
          (SEQ (LETT |k| 1 . #8#) (LETT #6# (QREFELT $ 10) . #8#) G190
               (COND ((|greater_SI| |k| #6#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #8#) (LETT #5# (QREFELT $ 10) . #8#) G190
                      (COND ((|greater_SI| |j| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |s| 1 . #8#) (LETT #4# (QREFELT $ 10) . #8#)
                             G190 (COND ((|greater_SI| |s| #4#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1) . #8#)
                                  (LETT |u| (+ |u| 1) . #8#)
                                  (EXIT
                                   (SEQ (LETT |i| 1 . #8#)
                                        (LETT #3# (QREFELT $ 10) . #8#) G190
                                        (COND
                                         ((|greater_SI| |i| #3#) (GO G191)))
                                        (SEQ
                                         (LETT |entry| (|spadConstant| $ 16)
                                               . #8#)
                                         (LETT |enter| (|spadConstant| $ 16)
                                               . #8#)
                                         (SEQ (LETT |l| 1 . #8#)
                                              (LETT #2# (QREFELT $ 10) . #8#)
                                              G190
                                              (COND
                                               ((|greater_SI| |l| #2#)
                                                (GO G191)))
                                              (SEQ
                                               (LETT |entry|
                                                     (SPADCALL
                                                      (SPADCALL |entry|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT $
                                                                            15)
                                                                   |l|
                                                                   (QREFELT $
                                                                            36))
                                                                  |j| |k|
                                                                  (QREFELT $
                                                                           42))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT $
                                                                            15)
                                                                   |s|
                                                                   (QREFELT $
                                                                            36))
                                                                  |i| |l|
                                                                  (QREFELT $
                                                                           42))
                                                                 (QREFELT $
                                                                          49))
                                                                (QREFELT $ 50))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 15) |l|
                                                         (QREFELT $ 36))
                                                        |i| |j| (QREFELT $ 42))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 15) |s|
                                                         (QREFELT $ 36))
                                                        |l| |k| (QREFELT $ 42))
                                                       (QREFELT $ 49))
                                                      (QREFELT $ 51))
                                                     . #8#)
                                               (EXIT
                                                (LETT |enter|
                                                      (SPADCALL
                                                       (SPADCALL |enter|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |l|
                                                                    (QREFELT $
                                                                             36))
                                                                   |k| |i|
                                                                   (QREFELT $
                                                                            42))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |s|
                                                                    (QREFELT $
                                                                             36))
                                                                   |j| |l|
                                                                   (QREFELT $
                                                                            42))
                                                                  (QREFELT $
                                                                           49))
                                                                 (QREFELT $
                                                                          50))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |l|
                                                          (QREFELT $ 36))
                                                         |j| |k|
                                                         (QREFELT $ 42))
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |s|
                                                          (QREFELT $ 36))
                                                         |l| |i|
                                                         (QREFELT $ 42))
                                                        (QREFELT $ 49))
                                                       (QREFELT $ 51))
                                                      . #8#)))
                                              (LETT |l| (|inc_SI| |l|) . #8#)
                                              (GO G190) G191 (EXIT NIL))
                                         (SPADCALL |condi| |z| |i| |entry|
                                                   (QREFELT $ 22))
                                         (EXIT
                                          (SPADCALL |condi| |u| |i| |enter|
                                                    (QREFELT $ 22))))
                                        (LETT |i| (|inc_SI| |i|) . #8#)
                                        (GO G190) G191 (EXIT NIL))))
                             (LETT |s| (|inc_SI| |s|) . #8#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191 (EXIT NIL))
          (LETT D (SPADCALL |condi| B (QREFELT $ 35)) . #8#)
          (EXIT
           (SPADCALL (ELT $ 24) (SPADCALL D (QREFELT $ 26)) (QREFELT $ 30)))))) 

(SDEFUN |ALGPKG;basisOfRightNucloid;L;12| (($ |List| (|Matrix| R)))
        (SPROG
         ((#1=#:G852 NIL) (|sol| NIL) (#2=#:G851 NIL) (|r2| (|Integer|))
          (|r1| (|Integer|)) (#3=#:G850 NIL) (|r| NIL) (|z| (|Integer|))
          (#4=#:G849 NIL) (|k| NIL) (#5=#:G848 NIL) (|j| NIL) (#6=#:G847 NIL)
          (|i| NIL) (|condo| #7=(|Matrix| R)) (|cond| #7#))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT $ 12) (QREFELT $ 11)
                              (|spadConstant| $ 16))
                . #8=(|ALGPKG;basisOfRightNucloid;L;12|))
          (LETT |condo|
                (MAKE_MATRIX1 (QREFELT $ 12) (QREFELT $ 11)
                              (|spadConstant| $ 16))
                . #8#)
          (LETT |z| 0 . #8#)
          (SEQ (LETT |i| 1 . #8#) (LETT #6# (QREFELT $ 10) . #8#) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #8#) (LETT #5# (QREFELT $ 10) . #8#) G190
                      (COND ((|greater_SI| |j| #5#) (GO G191)))
                      (SEQ (LETT |r1| 0 . #8#)
                           (EXIT
                            (SEQ (LETT |k| 1 . #8#)
                                 (LETT #4# (QREFELT $ 10) . #8#) G190
                                 (COND ((|greater_SI| |k| #4#) (GO G191)))
                                 (SEQ (LETT |z| (+ |z| 1) . #8#)
                                      (LETT |r2| |i| . #8#)
                                      (EXIT
                                       (SEQ (LETT |r| 1 . #8#)
                                            (LETT #3# (QREFELT $ 10) . #8#)
                                            G190
                                            (COND
                                             ((|greater_SI| |r| #3#)
                                              (GO G191)))
                                            (SEQ (LETT |r1| (+ |r1| 1) . #8#)
                                                 (SPADCALL |cond| |z| |r1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QREFELT $ 15) |r|
                                                             (QREFELT $ 36))
                                                            |j| |i|
                                                            (QREFELT $ 42))
                                                           (QREFELT $ 22))
                                                 (SPADCALL |condo| |z| |r2|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT $ 15)
                                                              |k|
                                                              (QREFELT $ 36))
                                                             |j| |r|
                                                             (QREFELT $ 42))
                                                            (QREFELT $ 43))
                                                           (QREFELT $ 22))
                                                 (EXIT
                                                  (LETT |r2|
                                                        (+ |r2| (QREFELT $ 10))
                                                        . #8#)))
                                            (LETT |r| (|inc_SI| |r|) . #8#)
                                            (GO G190) G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #2# NIL . #8#)
            (SEQ (LETT |sol| NIL . #8#)
                 (LETT #1#
                       (SPADCALL (SPADCALL |cond| |condo| (QREFELT $ 44))
                                 (QREFELT $ 26))
                       . #8#)
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT (LETT #2# (CONS (|ALGPKG;convVM| |sol| $) #2#) . #8#)))
                 (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |ALGPKG;basisOfCentroid;L;13| (($ |List| (|Matrix| R)))
        (SPROG
         ((#1=#:G868 NIL) (|sol| NIL) (#2=#:G867 NIL) (|r2| (|Integer|))
          (|r1| (|Integer|)) (#3=#:G866 NIL) (|r| NIL) (|u| (|Integer|))
          (|z| (|Integer|)) (#4=#:G865 NIL) (|k| NIL) (#5=#:G864 NIL) (|j| NIL)
          (#6=#:G863 NIL) (|i| NIL) (|condo| #7=(|Matrix| R)) (|cond| #7#))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (* 2 (QREFELT $ 12)) (QREFELT $ 11)
                              (|spadConstant| $ 16))
                . #8=(|ALGPKG;basisOfCentroid;L;13|))
          (LETT |condo|
                (MAKE_MATRIX1 (* 2 (QREFELT $ 12)) (QREFELT $ 11)
                              (|spadConstant| $ 16))
                . #8#)
          (LETT |z| 0 . #8#) (LETT |u| (QREFELT $ 12) . #8#)
          (SEQ (LETT |i| 1 . #8#) (LETT #6# (QREFELT $ 10) . #8#) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #8#) (LETT #5# (QREFELT $ 10) . #8#) G190
                      (COND ((|greater_SI| |j| #5#) (GO G191)))
                      (SEQ (LETT |r1| 0 . #8#)
                           (EXIT
                            (SEQ (LETT |k| 1 . #8#)
                                 (LETT #4# (QREFELT $ 10) . #8#) G190
                                 (COND ((|greater_SI| |k| #4#) (GO G191)))
                                 (SEQ (LETT |z| (+ |z| 1) . #8#)
                                      (LETT |u| (+ |u| 1) . #8#)
                                      (LETT |r2| |i| . #8#)
                                      (EXIT
                                       (SEQ (LETT |r| 1 . #8#)
                                            (LETT #3# (QREFELT $ 10) . #8#)
                                            G190
                                            (COND
                                             ((|greater_SI| |r| #3#)
                                              (GO G191)))
                                            (SEQ (LETT |r1| (+ |r1| 1) . #8#)
                                                 (SPADCALL |cond| |z| |r1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QREFELT $ 15) |r|
                                                             (QREFELT $ 36))
                                                            |i| |j|
                                                            (QREFELT $ 42))
                                                           (QREFELT $ 22))
                                                 (SPADCALL |cond| |u| |r1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QREFELT $ 15) |r|
                                                             (QREFELT $ 36))
                                                            |j| |i|
                                                            (QREFELT $ 42))
                                                           (QREFELT $ 22))
                                                 (SPADCALL |condo| |z| |r2|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT $ 15)
                                                              |k|
                                                              (QREFELT $ 36))
                                                             |r| |j|
                                                             (QREFELT $ 42))
                                                            (QREFELT $ 43))
                                                           (QREFELT $ 22))
                                                 (SPADCALL |condo| |u| |r2|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT $ 15)
                                                              |k|
                                                              (QREFELT $ 36))
                                                             |j| |r|
                                                             (QREFELT $ 42))
                                                            (QREFELT $ 43))
                                                           (QREFELT $ 22))
                                                 (EXIT
                                                  (LETT |r2|
                                                        (+ |r2| (QREFELT $ 10))
                                                        . #8#)))
                                            (LETT |r| (|inc_SI| |r|) . #8#)
                                            (GO G190) G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #2# NIL . #8#)
            (SEQ (LETT |sol| NIL . #8#)
                 (LETT #1#
                       (SPADCALL (SPADCALL |cond| |condo| (QREFELT $ 44))
                                 (QREFELT $ 26))
                       . #8#)
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT (LETT #2# (CONS (|ALGPKG;convVM| |sol| $) #2#) . #8#)))
                 (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |ALGPKG;doubleRank;ANni;14| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG
         ((|enter| (R)) (|entry| (R)) (#1=#:G879 NIL) (|i| NIL)
          (|u| (|Integer|)) (|z| (|Integer|)) (#2=#:G878 NIL) (|j| NIL)
          (#3=#:G877 NIL) (|k| NIL) (|cond| (|Matrix| R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (* 2 (QREFELT $ 10)) (QREFELT $ 10)
                              (|spadConstant| $ 16))
                . #4=(|ALGPKG;doubleRank;ANni;14|))
          (SEQ (LETT |k| 1 . #4#) (LETT #3# (QREFELT $ 10) . #4#) G190
               (COND ((|greater_SI| |k| #3#) (GO G191)))
               (SEQ (LETT |z| 0 . #4#) (LETT |u| (QREFELT $ 10) . #4#)
                    (EXIT
                     (SEQ (LETT |j| 1 . #4#) (LETT #2# (QREFELT $ 10) . #4#)
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ (LETT |z| (+ |z| 1) . #4#)
                               (LETT |u| (+ |u| 1) . #4#)
                               (LETT |entry| (|spadConstant| $ 16) . #4#)
                               (LETT |enter| (|spadConstant| $ 16) . #4#)
                               (SEQ (LETT |i| 1 . #4#)
                                    (LETT #1# (QREFELT $ 10) . #4#) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ
                                     (LETT |entry|
                                           (SPADCALL |entry|
                                                     (SPADCALL
                                                      (SPADCALL |x| |i|
                                                                (QREFELT $ 60))
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 15)
                                                                 |k|
                                                                 (QREFELT $
                                                                          36))
                                                       |j| |i| (QREFELT $ 42))
                                                      (QREFELT $ 49))
                                                     (QREFELT $ 50))
                                           . #4#)
                                     (EXIT
                                      (LETT |enter|
                                            (SPADCALL |enter|
                                                      (SPADCALL
                                                       (SPADCALL |x| |i|
                                                                 (QREFELT $
                                                                          60))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 15) |k|
                                                         (QREFELT $ 36))
                                                        |i| |j| (QREFELT $ 42))
                                                       (QREFELT $ 49))
                                                      (QREFELT $ 50))
                                            . #4#)))
                                    (LETT |i| (|inc_SI| |i|) . #4#) (GO G190)
                                    G191 (EXIT NIL))
                               (SPADCALL |cond| |z| |k| |entry| (QREFELT $ 22))
                               (EXIT
                                (SPADCALL |cond| |u| |k| |enter|
                                          (QREFELT $ 22))))
                          (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| (QREFELT $ 62)))))) 

(SDEFUN |ALGPKG;weakBiRank;ANni;15| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG
         ((|entry| (R)) (#1=#:G893 NIL) (|s| NIL) (#2=#:G892 NIL) (|l| NIL)
          (#3=#:G891 NIL) (|k| NIL) (|z| (|Integer|)) (#4=#:G890 NIL) (|j| NIL)
          (#5=#:G889 NIL) (|i| NIL) (|cond| (|Matrix| R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT $ 11) (QREFELT $ 10)
                              (|spadConstant| $ 16))
                . #6=(|ALGPKG;weakBiRank;ANni;15|))
          (LETT |z| 0 . #6#)
          (SEQ (LETT |i| 1 . #6#) (LETT #5# (QREFELT $ 10) . #6#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #6#) (LETT #4# (QREFELT $ 10) . #6#) G190
                      (COND ((|greater_SI| |j| #4#) (GO G191)))
                      (SEQ (LETT |z| (+ |z| 1) . #6#)
                           (EXIT
                            (SEQ (LETT |k| 1 . #6#)
                                 (LETT #3# (QREFELT $ 10) . #6#) G190
                                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                                 (SEQ
                                  (LETT |entry| (|spadConstant| $ 16) . #6#)
                                  (SEQ (LETT |l| 1 . #6#)
                                       (LETT #2# (QREFELT $ 10) . #6#) G190
                                       (COND
                                        ((|greater_SI| |l| #2#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |s| 1 . #6#)
                                              (LETT #1# (QREFELT $ 10) . #6#)
                                              G190
                                              (COND
                                               ((|greater_SI| |s| #1#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |entry|
                                                      (SPADCALL |entry|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL |x|
                                                                            |l|
                                                                            (QREFELT
                                                                             $
                                                                             60))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |s|
                                                                    (QREFELT $
                                                                             36))
                                                                   |i| |l|
                                                                   (QREFELT $
                                                                            42))
                                                                  (QREFELT $
                                                                           49))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT $
                                                                            15)
                                                                   |k|
                                                                   (QREFELT $
                                                                            36))
                                                                  |s| |j|
                                                                  (QREFELT $
                                                                           42))
                                                                 (QREFELT $
                                                                          49))
                                                                (QREFELT $ 50))
                                                      . #6#)))
                                              (LETT |s| (|inc_SI| |s|) . #6#)
                                              (GO G190) G191 (EXIT NIL))))
                                       (LETT |l| (|inc_SI| |l|) . #6#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (SPADCALL |cond| |z| |k| |entry|
                                             (QREFELT $ 22))))
                                 (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| (QREFELT $ 62)))))) 

(SDEFUN |ALGPKG;biRank;ANni;16| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG
         ((|enter| (R)) (|entry| (R)) (#1=#:G916 NIL) (|i| NIL) (#2=#:G915 NIL)
          (|k| NIL) (|w| (|Integer|)) (|u| (|Integer|)) (#3=#:G914 NIL)
          (|j| NIL) (|c| (|PositiveInteger|)) (#4=#:G913 NIL) (|s| NIL)
          (#5=#:G912 NIL) (|l| NIL) (#6=#:G911 NIL) (|z| (|Integer|))
          (#7=#:G910 NIL) (#8=#:G909 NIL) (|cond| (|Matrix| R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (+ (+ (QREFELT $ 11) (* 2 (QREFELT $ 10))) 1)
                              (QREFELT $ 10) (|spadConstant| $ 16))
                . #9=(|ALGPKG;biRank;ANni;16|))
          (LETT |z| 0 . #9#)
          (SEQ (LETT |j| 1 . #9#) (LETT #8# (QREFELT $ 10) . #9#) G190
               (COND ((|greater_SI| |j| #8#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| 1 . #9#) (LETT #7# (QREFELT $ 10) . #9#) G190
                      (COND ((|greater_SI| |i| #7#) (GO G191)))
                      (SEQ (LETT |z| (+ |z| 1) . #9#)
                           (EXIT
                            (SEQ (LETT |k| 1 . #9#)
                                 (LETT #6# (QREFELT $ 10) . #9#) G190
                                 (COND ((|greater_SI| |k| #6#) (GO G191)))
                                 (SEQ
                                  (LETT |entry| (|spadConstant| $ 16) . #9#)
                                  (SEQ (LETT |l| 1 . #9#)
                                       (LETT #5# (QREFELT $ 10) . #9#) G190
                                       (COND
                                        ((|greater_SI| |l| #5#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |s| 1 . #9#)
                                              (LETT #4# (QREFELT $ 10) . #9#)
                                              G190
                                              (COND
                                               ((|greater_SI| |s| #4#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |entry|
                                                      (SPADCALL |entry|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL |x|
                                                                            |l|
                                                                            (QREFELT
                                                                             $
                                                                             60))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |s|
                                                                    (QREFELT $
                                                                             36))
                                                                   |i| |l|
                                                                   (QREFELT $
                                                                            42))
                                                                  (QREFELT $
                                                                           49))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT $
                                                                            15)
                                                                   |k|
                                                                   (QREFELT $
                                                                            36))
                                                                  |s| |j|
                                                                  (QREFELT $
                                                                           42))
                                                                 (QREFELT $
                                                                          49))
                                                                (QREFELT $ 50))
                                                      . #9#)))
                                              (LETT |s| (|inc_SI| |s|) . #9#)
                                              (GO G190) G191 (EXIT NIL))))
                                       (LETT |l| (|inc_SI| |l|) . #9#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (SPADCALL |cond| |z| |k| |entry|
                                             (QREFELT $ 22))))
                                 (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |u| (* (QREFELT $ 10) (QREFELT $ 10)) . #9#)
          (LETT |w| (* (QREFELT $ 10) (+ (QREFELT $ 10) 1)) . #9#)
          (LETT |c| (+ (+ (QREFELT $ 11) (* 2 (QREFELT $ 10))) 1) . #9#)
          (SEQ (LETT |j| 1 . #9#) (LETT #3# (QREFELT $ 10) . #9#) G190
               (COND ((|greater_SI| |j| #3#) (GO G191)))
               (SEQ (LETT |u| (+ |u| 1) . #9#) (LETT |w| (+ |w| 1) . #9#)
                    (SEQ (LETT |k| 1 . #9#) (LETT #2# (QREFELT $ 10) . #9#)
                         G190 (COND ((|greater_SI| |k| #2#) (GO G191)))
                         (SEQ (LETT |entry| (|spadConstant| $ 16) . #9#)
                              (LETT |enter| (|spadConstant| $ 16) . #9#)
                              (SEQ (LETT |i| 1 . #9#)
                                   (LETT #1# (QREFELT $ 10) . #9#) G190
                                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                                   (SEQ
                                    (LETT |entry|
                                          (SPADCALL |entry|
                                                    (SPADCALL
                                                     (SPADCALL |x| |i|
                                                               (QREFELT $ 60))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 15)
                                                                |k|
                                                                (QREFELT $ 36))
                                                      |j| |i| (QREFELT $ 42))
                                                     (QREFELT $ 49))
                                                    (QREFELT $ 50))
                                          . #9#)
                                    (EXIT
                                     (LETT |enter|
                                           (SPADCALL |enter|
                                                     (SPADCALL
                                                      (SPADCALL |x| |i|
                                                                (QREFELT $ 60))
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 15)
                                                                 |k|
                                                                 (QREFELT $
                                                                          36))
                                                       |i| |j| (QREFELT $ 42))
                                                      (QREFELT $ 49))
                                                     (QREFELT $ 50))
                                           . #9#)))
                                   (LETT |i| (|inc_SI| |i|) . #9#) (GO G190)
                                   G191 (EXIT NIL))
                              (SPADCALL |cond| |u| |k| |entry| (QREFELT $ 22))
                              (EXIT
                               (SPADCALL |cond| |w| |k| |enter|
                                         (QREFELT $ 22))))
                         (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL |cond| |c| |j| (SPADCALL |x| |j| (QREFELT $ 60))
                               (QREFELT $ 22))))
               (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| (QREFELT $ 62)))))) 

(SDEFUN |ALGPKG;leftRank;ANni;17| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG
         ((|entry| (R)) (#1=#:G925 NIL) (|i| NIL) (#2=#:G924 NIL) (|j| NIL)
          (#3=#:G923 NIL) (|k| NIL) (|cond| (|Matrix| R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT $ 10) (QREFELT $ 10)
                              (|spadConstant| $ 16))
                . #4=(|ALGPKG;leftRank;ANni;17|))
          (SEQ (LETT |k| 1 . #4#) (LETT #3# (QREFELT $ 10) . #4#) G190
               (COND ((|greater_SI| |k| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #4#) (LETT #2# (QREFELT $ 10) . #4#) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ (LETT |entry| (|spadConstant| $ 16) . #4#)
                           (SEQ (LETT |i| 1 . #4#)
                                (LETT #1# (QREFELT $ 10) . #4#) G190
                                (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |entry|
                                        (SPADCALL |entry|
                                                  (SPADCALL
                                                   (SPADCALL |x| |i|
                                                             (QREFELT $ 60))
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 15)
                                                              |k|
                                                              (QREFELT $ 36))
                                                    |i| |j| (QREFELT $ 42))
                                                   (QREFELT $ 49))
                                                  (QREFELT $ 50))
                                        . #4#)))
                                (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (SPADCALL |cond| |j| |k| |entry| (QREFELT $ 22))))
                      (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| (QREFELT $ 62)))))) 

(SDEFUN |ALGPKG;rightRank;ANni;18| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG
         ((|entry| (R)) (#1=#:G934 NIL) (|i| NIL) (#2=#:G933 NIL) (|j| NIL)
          (#3=#:G932 NIL) (|k| NIL) (|cond| (|Matrix| R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT $ 10) (QREFELT $ 10)
                              (|spadConstant| $ 16))
                . #4=(|ALGPKG;rightRank;ANni;18|))
          (SEQ (LETT |k| 1 . #4#) (LETT #3# (QREFELT $ 10) . #4#) G190
               (COND ((|greater_SI| |k| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #4#) (LETT #2# (QREFELT $ 10) . #4#) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ (LETT |entry| (|spadConstant| $ 16) . #4#)
                           (SEQ (LETT |i| 1 . #4#)
                                (LETT #1# (QREFELT $ 10) . #4#) G190
                                (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |entry|
                                        (SPADCALL |entry|
                                                  (SPADCALL
                                                   (SPADCALL |x| |i|
                                                             (QREFELT $ 60))
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 15)
                                                              |k|
                                                              (QREFELT $ 36))
                                                    |j| |i| (QREFELT $ 42))
                                                   (QREFELT $ 49))
                                                  (QREFELT $ 50))
                                        . #4#)))
                                (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (SPADCALL |cond| |j| |k| |entry| (QREFELT $ 22))))
                      (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| (QREFELT $ 62)))))) 

(SDEFUN |ALGPKG;basis;2V;19| ((|va| |Vector| A) ($ |Vector| A))
        (SPROG
         ((#1=#:G951 NIL) (#2=#:G953 NIL) (|j| (|Integer|)) (#3=#:G952 NIL)
          (|finished?| (|Boolean|)) (|h| (|Integer|))
          (|lj| (|List| (|Integer|))) (|mCI| (|Integer|)) (|mRI| (|Integer|))
          (|m| (|Matrix| R)) (#4=#:G950 NIL) (|i| NIL) (|v| (|Vector| A)))
         (SEQ
          (LETT |v| (SPADCALL (ELT $ 69) |va| (QREFELT $ 72))
                . #5=(|ALGPKG;basis;2V;19|))
          (LETT |v| (SPADCALL |v| (QREFELT $ 73)) . #5#)
          (EXIT
           (COND ((SPADCALL |v| (QREFELT $ 74)) (VECTOR (|spadConstant| $ 75)))
                 ('T
                  (SEQ
                   (LETT |m|
                         (SPADCALL
                          (SPADCALL (SPADCALL |v| 1 (QREFELT $ 76))
                                    (QREFELT $ 32))
                          (QREFELT $ 33))
                         . #5#)
                   (SEQ (LETT |i| 2 . #5#) (LETT #4# (QVSIZE |v|) . #5#) G190
                        (COND ((|greater_SI| |i| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |m|
                                (SPADCALL |m|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |v| |i| (QREFELT $ 76))
                                            (QREFELT $ 32))
                                           (QREFELT $ 33))
                                          (QREFELT $ 77))
                                . #5#)))
                        (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |m| (SPADCALL |m| (QREFELT $ 78)) . #5#)
                   (LETT |lj| NIL . #5#) (LETT |h| 1 . #5#)
                   (LETT |mRI| (SPADCALL |m| (QREFELT $ 79)) . #5#)
                   (LETT |mCI| (SPADCALL |m| (QREFELT $ 80)) . #5#)
                   (LETT |finished?| NIL . #5#) (LETT |j| 1 . #5#)
                   (SEQ G190 (COND ((NULL (NULL |finished?|)) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |m| |h| |j| (QREFELT $ 42))
                                       (QREFELT $ 81)))
                            (SEQ (LETT |lj| (CONS |j| |lj|) . #5#)
                                 (LETT |h| |mRI| . #5#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (SPADCALL
                                          (SPADCALL |m| |h| |j| (QREFELT $ 42))
                                          (QREFELT $ 81)))
                                        (GO G191)))
                                      (SEQ (EXIT (LETT |h| (- |h| 1) . #5#)))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |finished?| (EQL |h| |mRI|) . #5#)
                                 (EXIT
                                  (COND
                                   ((NULL |finished?|)
                                    (LETT |h| (+ |h| 1) . #5#))))))
                           ((< |j| |mCI|) (LETT |j| (+ |j| 1) . #5#))
                           ('T (LETT |finished?| 'T . #5#)))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (PROGN
                     (LETT #3# (GETREFV (SIZE #6=(REVERSE |lj|))) . #5#)
                     (SEQ (LETT |j| NIL . #5#) (LETT #2# #6# . #5#)
                          (LETT #1# 0 . #5#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |j| (CAR #2#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #3# #1#
                                    (SPADCALL |v| |j| (QREFELT $ 76)))))
                          (LETT #1#
                                (PROG1 (|inc_SI| #1#)
                                  (LETT #2# (CDR #2#) . #5#))
                                . #5#)
                          (GO G190) G191 (EXIT NIL))
                     #3#))))))))) 

(DECLAIM (NOTINLINE |AlgebraPackage;|)) 

(DEFUN |AlgebraPackage| (&REST #1=#:G954)
  (SPROG NIL
         (PROG (#2=#:G955)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraPackage|)
                                               '|domainEqualList|)
                    . #3=(|AlgebraPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraPackage|)))))))))) 

(DEFUN |AlgebraPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|AlgebraPackage| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 83) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|EuclideanDomain|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|AlgebraPackage| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
          (QSETREFV $ 11 (* (QREFELT $ 10) (QREFELT $ 10)))
          (QSETREFV $ 12 (* (QREFELT $ 10) (QREFELT $ 11)))
          (QSETREFV $ 15 (SPADCALL (QREFELT $ 14)))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 82
                      (CONS (|dispatchFunction| |ALGPKG;basis;2V;19|) $))))
          $))) 

(MAKEPROP '|AlgebraPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |rank|) '|n| '|n2| '|n3| (|Vector| 21)
              (4 . |structuralConstants|) '|gamma| (8 . |Zero|) (12 . |One|)
              (|Integer|) (|Vector| 6) (16 . |elt|) (|Matrix| 6)
              (22 . |setelt!|) (30 . |leftTraceMatrix|) (34 . |represents|)
              (|List| 19) (39 . |nullSpace|) (|List| 7) (|Mapping| 7 19)
              (|ListFunctions2| 19 7) (44 . |map|)
              |ALGPKG;radicalOfLeftTraceForm;L;2| (50 . |coordinates|)
              (55 . |coerce|) (60 . |transpose|) (65 . |vertConcat|)
              (71 . |elt|) (77 . *) (|Mapping| 21 21 21) (83 . |reduce|)
              |ALGPKG;basisOfLeftAnnihilator;AL;3|
              |ALGPKG;basisOfRightAnnihilator;AL;4| (89 . |elt|) (96 . -)
              (101 . +) (|List| 21) |ALGPKG;basisOfLeftNucloid;L;5| (107 . -)
              |ALGPKG;basisOfCommutingElements;L;6| (113 . *) (119 . +)
              (125 . -) |ALGPKG;basisOfLeftNucleus;L;7|
              |ALGPKG;basisOfRightNucleus;L;8|
              |ALGPKG;basisOfMiddleNucleus;L;9| |ALGPKG;basisOfNucleus;L;10|
              (131 . |first|) |ALGPKG;basisOfCenter;L;11|
              |ALGPKG;basisOfRightNucloid;L;12| |ALGPKG;basisOfCentroid;L;13|
              (136 . |elt|) (|NonNegativeInteger|) (142 . |rank|)
              |ALGPKG;doubleRank;ANni;14| |ALGPKG;weakBiRank;ANni;15|
              |ALGPKG;biRank;ANni;16| |ALGPKG;leftRank;ANni;17|
              |ALGPKG;rightRank;ANni;18| (|Boolean|) (147 . |zero?|)
              (|Mapping| 68 7) (|Vector| 7) (152 . |remove|)
              (158 . |removeDuplicates|) (163 . |empty?|) (168 . |Zero|)
              (172 . |elt|) (178 . |horizConcat|) (184 . |rowEchelon|)
              (189 . |maxRowIndex|) (194 . |maxColIndex|) (199 . |zero?|)
              (204 . |basis|))
           '#(|weakBiRank| 209 |rightRank| 214 |radicalOfLeftTraceForm| 219
              |leftRank| 223 |doubleRank| 228 |biRank| 233
              |basisOfRightNucloid| 238 |basisOfRightNucleus| 242
              |basisOfRightAnnihilator| 246 |basisOfNucleus| 251
              |basisOfMiddleNucleus| 255 |basisOfLeftNucloid| 259
              |basisOfLeftNucleus| 263 |basisOfLeftAnnihilator| 267
              |basisOfCommutingElements| 272 |basisOfCentroid| 276
              |basisOfCenter| 280 |basis| 284)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 82
                                                 '(0 7 8 9 0 7 13 14 0 6 0 16 0
                                                   6 0 17 2 19 6 0 18 20 4 21 6
                                                   0 18 18 6 22 0 7 21 23 1 7 0
                                                   19 24 1 21 25 0 26 2 29 27
                                                   28 25 30 1 7 19 0 32 1 21 0
                                                   19 33 1 21 0 0 34 2 21 0 0 0
                                                   35 2 13 21 0 18 36 2 21 0 0
                                                   0 37 2 13 21 38 0 39 3 21 6
                                                   0 18 18 42 1 6 0 0 43 2 21 0
                                                   0 0 44 2 21 0 0 0 47 2 6 0 0
                                                   0 49 2 6 0 0 0 50 2 6 0 0 0
                                                   51 1 13 21 0 56 2 7 6 0 18
                                                   60 1 21 61 0 62 1 7 68 0 69
                                                   2 71 0 70 0 72 1 71 0 0 73 1
                                                   71 68 0 74 0 7 0 75 2 71 7 0
                                                   18 76 2 21 0 0 0 77 1 21 0 0
                                                   78 1 21 18 0 79 1 21 18 0 80
                                                   1 6 68 0 81 1 0 71 71 82 1 0
                                                   61 7 64 1 0 61 7 67 0 0 27
                                                   31 1 0 61 7 66 1 0 61 7 63 1
                                                   0 61 7 65 0 0 45 58 0 0 27
                                                   53 1 0 27 7 41 0 0 27 55 0 0
                                                   27 54 0 0 45 46 0 0 27 52 1
                                                   0 27 7 40 0 0 27 48 0 0 45
                                                   59 0 0 27 57 1 1 71 71
                                                   82)))))
           '|lookupComplete|)) 
