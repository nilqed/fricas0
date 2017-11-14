
(SDEFUN |LINCOMB;dehomogenize;LR;1|
        ((|ls| |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
         ($ |Record|
          (|:| |particular|
               (|Union|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                "failed"))
          (|:| |basis|
               (|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))))
        (SPROG
         ((|res3|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|bv| #1=(|Vector| F)) (|rp| (F)) (|c| (F)) (#2=#:G738 NIL)
          (|be| NIL) (|ppv| #1#) (|ppa| (F)) (|c1inv| (F))
          (|found| (|Boolean|))
          (|be1| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|res2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#3=#:G737 NIL) (|nn| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |ls|) (CONS (CONS 1 "failed") NIL))
                (#4='T
                 (SEQ
                  (LETT |nn| (QVSIZE (QCDR (SPADCALL |ls| 1 (QREFELT $ 13))))
                        . #5=(|LINCOMB;dehomogenize;LR;1|))
                  (LETT |found| NIL . #5#) (LETT |res2| NIL . #5#)
                  (SEQ (LETT |be| NIL . #5#) (LETT #3# |ls| . #5#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |be| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |c| (SPADCALL (QCDR |be|) 1 (QREFELT $ 15))
                              . #5#)
                        (COND
                         ((OR
                           (SPADCALL |c| (|spadConstant| $ 16) (QREFELT $ 19))
                           |found|)
                          (EXIT (LETT |res2| (CONS |be| |res2|) . #5#))))
                        (LETT |be1| |be| . #5#) (EXIT (LETT |found| 'T . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    (|found|
                     (SEQ
                      (LETT |c1inv|
                            (SPADCALL (|spadConstant| $ 8)
                                      (SPADCALL (QCDR |be1|) 1 (QREFELT $ 15))
                                      (QREFELT $ 20))
                            . #5#)
                      (LETT |ppa|
                            (SPADCALL |c1inv| (QCAR |be1|) (QREFELT $ 21))
                            . #5#)
                      (LETT |ppv|
                            (SPADCALL
                             (SPADCALL |c1inv| (QCDR |be1|) (QREFELT $ 22))
                             (SPADCALL 2 |nn| (QREFELT $ 24)) (QREFELT $ 25))
                            . #5#)
                      (LETT |res3| NIL . #5#)
                      (SEQ (LETT |be| NIL . #5#) (LETT #2# |res2| . #5#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |be| (CAR #2#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |c| (SPADCALL (QCDR |be|) 1 (QREFELT $ 15))
                                  . #5#)
                            (LETT |bv|
                                  (SPADCALL (QCDR |be|)
                                            (SPADCALL 2 |nn| (QREFELT $ 24))
                                            (QREFELT $ 25))
                                  . #5#)
                            (LETT |rp| (QCAR |be|) . #5#)
                            (COND
                             ((SPADCALL |c| (|spadConstant| $ 16)
                                        (QREFELT $ 26))
                              (SEQ
                               (LETT |rp|
                                     (SPADCALL |rp|
                                               (SPADCALL |c| |ppa|
                                                         (QREFELT $ 21))
                                               (QREFELT $ 27))
                                     . #5#)
                               (EXIT
                                (LETT |bv|
                                      (SPADCALL |bv|
                                                (SPADCALL |c| |ppv|
                                                          (QREFELT $ 22))
                                                (QREFELT $ 28))
                                      . #5#)))))
                            (EXIT
                             (LETT |res3| (CONS (CONS |rp| |bv|) |res3|)
                                   . #5#)))
                           (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (CONS (CONS 0 (CONS |ppa| |ppv|)) |res3|))))
                    (#4# (CONS (CONS 1 "failed") NIL)))))))))) 

(SDEFUN |LINCOMB;lin_comb;VLF;2| ((|v| |Vector| F) (|lf| |List| F) ($ F))
        (SPROG
         ((|res| (F)) (#1=#:G744 NIL) (|i| NIL) (#2=#:G745 NIL) (|f| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 16) . #3=(|LINCOMB;lin_comb;VLF;2|))
          (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL (SPADCALL |v| |i| (QREFELT $ 15))
                                           |f| (QREFELT $ 21))
                                 (QREFELT $ 32))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb;VLF;3|
        ((|v| |Vector| (|Fraction| (|Integer|))) (|lf| |List| F) ($ F))
        (SPROG
         ((|res| (F)) (#1=#:G749 NIL) (|i| NIL) (#2=#:G750 NIL) (|f| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 16) . #3=(|LINCOMB;lin_comb;VLF;3|))
          (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |v| |i| (QREFELT $ 37))
                                            (QREFELT $ 38))
                                  |f| (QREFELT $ 21))
                                 (QREFELT $ 32))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb!;2VLV;4|
        ((|u| |Vector| F) (|v| |Vector| F) (|lw| |List| (|Vector| F))
         ($ |Vector| F))
        (SPROG
         ((#1=#:G758 NIL) (|j| NIL) (|c| (F)) (#2=#:G756 NIL) (|i| NIL)
          (#3=#:G757 NIL) (|w| NIL) (|n| (|NonNegativeInteger|))
          (|res| (|Vector| F)))
         (SEQ (LETT |res| |v| . #4=(|LINCOMB;lin_comb!;2VLV;4|))
              (LETT |n| (QVSIZE |res|) . #4#)
              (SEQ (LETT |w| NIL . #4#) (LETT #3# |lw| . #4#)
                   (LETT |i| 1 . #4#) (LETT #2# (QVSIZE |u|) . #4#) G190
                   (COND
                    ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                         (PROGN (LETT |w| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |u| |i| (QREFELT $ 15)) . #4#)
                        (EXIT
                         (SEQ (LETT |j| 1 . #4#) (LETT #1# |n| . #4#) G190
                              (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |res| |j|
                                          (SPADCALL
                                           (SPADCALL |res| |j| (QREFELT $ 15))
                                           (SPADCALL |c|
                                                     (SPADCALL |w| |j|
                                                               (QREFELT $ 15))
                                                     (QREFELT $ 21))
                                           (QREFELT $ 32))
                                          (QREFELT $ 40))))
                              (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb;VLV;5|
        ((|u| |Vector| F) (|lw| |List| (|Vector| F)) ($ |Vector| F))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ
                (LETT |n| (QVSIZE (|SPADfirst| |lw|)) |LINCOMB;lin_comb;VLV;5|)
                (EXIT
                 (SPADCALL |u| (MAKEARR1 |n| (|spadConstant| $ 16)) |lw|
                           (QREFELT $ 42)))))) 

(SDEFUN |LINCOMB;lin_comb;VLF;6|
        ((|v| |Vector| F) (|lf| |List| (|Fraction| UP)) ($ |Fraction| UP))
        (SPROG
         ((|res| (|Fraction| UP)) (#1=#:G764 NIL) (|i| NIL) (#2=#:G765 NIL)
          (|f| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 45) . #3=(|LINCOMB;lin_comb;VLF;6|))
          (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |v| |i| (QREFELT $ 15))
                                            (QREFELT $ 46))
                                  |f| (QREFELT $ 47))
                                 (QREFELT $ 48))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb;VLF;7|
        ((|v| |Vector| (|Fraction| (|Integer|))) (|lg| |List| (|Fraction| UP))
         ($ |Fraction| UP))
        (SPROG
         ((|res| (|Fraction| UP)) (#1=#:G769 NIL) (|i| NIL) (#2=#:G770 NIL)
          (|g| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 45) . #3=(|LINCOMB;lin_comb;VLF;7|))
          (SEQ (LETT |g| NIL . #3#) (LETT #2# |lg| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |g| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |v| |i| (QREFELT $ 37))
                                              (QREFELT $ 38))
                                    (QREFELT $ 46))
                                   (QREFELT $ 51))
                                  |g| (QREFELT $ 52))
                                 (QREFELT $ 48))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb;VLLp;8|
        ((|v| |Vector| F) (|lf| |List| (|LaurentPolynomial| F UP))
         ($ |LaurentPolynomial| F UP))
        (SPROG
         ((|res| (|LaurentPolynomial| F UP)) (#1=#:G776 NIL) (|i| NIL)
          (#2=#:G777 NIL) (|f| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 55) . #3=(|LINCOMB;lin_comb;VLLp;8|))
          (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |v| |i| (QREFELT $ 15))
                                            (QREFELT $ 56))
                                  |f| (QREFELT $ 57))
                                 (QREFELT $ 58))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb;VLUP;9| ((|v| |Vector| F) (|lf| |List| UP) ($ UP))
        (SPROG
         ((|res| (UP)) (#1=#:G781 NIL) (|i| NIL) (#2=#:G782 NIL) (|f| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 17) . #3=(|LINCOMB;lin_comb;VLUP;9|))
          (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL (SPADCALL |v| |i| (QREFELT $ 15))
                                           |f| (QREFELT $ 61))
                                 (QREFELT $ 62))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |LinearCombinationUtilities;|)) 

(DEFUN |LinearCombinationUtilities| (&REST #1=#:G783)
  (SPROG NIL
         (PROG (#2=#:G784)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearCombinationUtilities|)
                                               '|domainEqualList|)
                    . #3=(|LinearCombinationUtilities|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LinearCombinationUtilities;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearCombinationUtilities|)))))))))) 

(DEFUN |LinearCombinationUtilities;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LinearCombinationUtilities|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LinearCombinationUtilities| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 65) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|LinearCombinationUtilities|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|LinearCombinationUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|Record| (|:| |ratpart| 6) (|:| |coeffs| 14))
              (|Integer|) (|List| 10) (8 . |elt|) (|Vector| 6) (14 . |elt|)
              (20 . |Zero|) (24 . |Zero|) (|Boolean|) (28 . =) (34 . /)
              (40 . *) (46 . *) (|UniversalSegment| 11) (52 . SEGMENT)
              (58 . |elt|) (64 . ~=) (70 . -) (76 . -) (|Union| 10 '"failed")
              (|Record| (|:| |particular| 29) (|:| |basis| 12))
              |LINCOMB;dehomogenize;LR;1| (82 . +) (|List| 6)
              |LINCOMB;lin_comb;VLF;2| (|Fraction| 11) (|Vector| 35)
              (88 . |elt|) (94 . |coerce|) |LINCOMB;lin_comb;VLF;3|
              (99 . |setelt!|) (|List| 14) |LINCOMB;lin_comb!;2VLV;4|
              |LINCOMB;lin_comb;VLV;5| (|Fraction| 7) (106 . |Zero|)
              (110 . |coerce|) (115 . *) (121 . +) (|List| 44)
              |LINCOMB;lin_comb;VLF;6| (127 . |coerce|) (132 . *)
              |LINCOMB;lin_comb;VLF;7| (|LaurentPolynomial| 6 7) (138 . |Zero|)
              (142 . |coerce|) (147 . *) (153 . +) (|List| 54)
              |LINCOMB;lin_comb;VLLp;8| (159 . *) (165 . +) (|List| 7)
              |LINCOMB;lin_comb;VLUP;9|)
           '#(|lin_comb!| 171 |lin_comb| 178 |dehomogenize| 220) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 64
                                                 '(0 6 0 8 0 7 0 9 2 12 10 0 11
                                                   13 2 14 6 0 11 15 0 6 0 16 0
                                                   7 0 17 2 6 18 0 0 19 2 6 0 0
                                                   0 20 2 6 0 0 0 21 2 14 0 6 0
                                                   22 2 23 0 11 11 24 2 14 0 0
                                                   23 25 2 6 18 0 0 26 2 6 0 0
                                                   0 27 2 14 0 0 0 28 2 6 0 0 0
                                                   32 2 36 35 0 11 37 1 6 0 35
                                                   38 3 14 6 0 11 6 40 0 44 0
                                                   45 1 7 0 6 46 2 44 0 7 0 47
                                                   2 44 0 0 0 48 1 44 0 7 51 2
                                                   44 0 0 0 52 0 54 0 55 1 54 0
                                                   6 56 2 54 0 0 0 57 2 54 0 0
                                                   0 58 2 7 0 6 0 61 2 7 0 0 0
                                                   62 3 0 14 14 14 41 42 2 0 6
                                                   14 33 34 2 0 6 36 33 39 2 0
                                                   44 14 49 50 2 0 14 14 41 43
                                                   2 0 44 36 49 53 2 0 7 14 63
                                                   64 2 0 54 14 59 60 1 0 30 12
                                                   31)))))
           '|lookupComplete|)) 
