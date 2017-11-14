
(SDEFUN |ORTHPOL;laguerreL;Nni2R;1| ((|n| |NonNegativeInteger|) (|x| R) ($ R))
        (SPROG
         ((|p0| (R)) (|p1| (R)) (|#G9| (R)) (|#G8| (R)) (#1=#:G700 NIL)
          (|i| NIL) (|#G6| (R)) (|#G5| (R)))
         (SEQ
          (COND ((EQL |n| 0) (|spadConstant| $ 8))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G5|
                         (SPADCALL (SPADCALL |x| (QREFELT $ 9))
                                   (|spadConstant| $ 8) (QREFELT $ 10))
                         . #2=(|ORTHPOL;laguerreL;Nni2R;1|))
                   (LETT |#G6| (|spadConstant| $ 8) . #2#)
                   (LETT |p1| |#G5| . #2#)
                   (LETT |p0| |#G6| . #2#))
                  (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT |#G8|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL 2 (SPADCALL |i| (QREFELT $ 12))
                                              (QREFELT $ 14))
                                    (|spadConstant| $ 8) (QREFELT $ 10))
                                   |x| (QREFELT $ 15))
                                  |p1| (QREFELT $ 16))
                                 (SPADCALL (SPADCALL |i| 2 (QREFELT $ 18)) |p0|
                                           (QREFELT $ 19))
                                 (QREFELT $ 15))
                                . #2#)
                          (LETT |#G9| |p1| . #2#)
                          (LETT |p1| |#G8| . #2#)
                          (LETT |p0| |#G9| . #2#))))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |p1|))))))) 

(SDEFUN |ORTHPOL;laguerreL;2Nni2R;2|
        ((|m| |NonNegativeInteger|) (|n| |NonNegativeInteger|) (|x| R) ($ R))
        (SPROG
         ((|p1| (R)) (|p0| (R)) (|cx| (|Integer|)) (#1=#:G702 NIL)
          (#2=#:G708 NIL) (|j| NIL) (|mi| (|Integer|)) (|ni| (|Integer|)))
         (SEQ (LETT |ni| |n| . #3=(|ORTHPOL;laguerreL;2Nni2R;2|))
              (LETT |mi| |m| . #3#)
              (LETT |cx|
                    (*
                     (* (EXPT -1 |m|)
                        (SPADCALL |ni| (- |ni| |mi|) (QREFELT $ 22)))
                     (SPADCALL |ni| (QREFELT $ 23)))
                    . #3#)
              (LETT |p0| (|spadConstant| $ 8) . #3#)
              (LETT |p1| (SPADCALL |cx| (QREFELT $ 12)) . #3#)
              (SEQ (LETT |j| 1 . #3#) (LETT #2# (- |ni| |mi|) . #3#) G190
                   (COND ((|greater_SI| |j| #2#) (GO G191)))
                   (SEQ
                    (LETT |cx| (- (* |cx| (+ (- (- |ni| |mi|) |j|) 1))) . #3#)
                    (LETT |cx|
                          (PROG2
                              (LETT #1#
                                    (SPADCALL |cx| (* (+ |mi| |j|) |j|)
                                              (QREFELT $ 25))
                                    . #3#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                            (|Union| (|Integer|) "failed")
                                            #1#))
                          . #3#)
                    (LETT |p0| (SPADCALL |p0| |x| (QREFELT $ 16)) . #3#)
                    (EXIT
                     (LETT |p1|
                           (SPADCALL |p1| (SPADCALL |cx| |p0| (QREFELT $ 19))
                                     (QREFELT $ 10))
                           . #3#)))
                   (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |p1|)))) 

(SDEFUN |ORTHPOL;chebyshevT;Nni2R;3| ((|n| |NonNegativeInteger|) (|x| R) ($ R))
        (SPROG
         ((|p0| (R)) (|p1| (R)) (|#G20| (R)) (|#G19| (R)) (#1=#:G712 NIL)
          (|i| NIL) (|#G17| (R)) (|#G16| (R)))
         (SEQ
          (COND ((EQL |n| 0) (|spadConstant| $ 8))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G16| |x| . #2=(|ORTHPOL;chebyshevT;Nni2R;3|))
                   (LETT |#G17| (|spadConstant| $ 8) . #2#)
                   (LETT |p1| |#G16| . #2#)
                   (LETT |p0| |#G17| . #2#))
                  (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT |#G19|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 2 |x| (QREFELT $ 14)) |p1|
                                           (QREFELT $ 16))
                                 |p0| (QREFELT $ 15))
                                . #2#)
                          (LETT |#G20| |p1| . #2#)
                          (LETT |p1| |#G19| . #2#)
                          (LETT |p0| |#G20| . #2#))))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |p1|))))))) 

(SDEFUN |ORTHPOL;chebyshevU;Nni2R;4| ((|n| |NonNegativeInteger|) (|x| R) ($ R))
        (SPROG
         ((|p0| (R)) (|p1| (R)) (|#G27| (R)) (|#G26| (R)) (#1=#:G716 NIL)
          (|i| NIL) (|#G24| (R)) (|#G23| (R)))
         (SEQ
          (COND ((EQL |n| 0) (|spadConstant| $ 8))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G23| (SPADCALL 2 |x| (QREFELT $ 14))
                         . #2=(|ORTHPOL;chebyshevU;Nni2R;4|))
                   (LETT |#G24| (|spadConstant| $ 8) . #2#)
                   (LETT |p1| |#G23| . #2#)
                   (LETT |p0| |#G24| . #2#))
                  (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT |#G26|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 2 |x| (QREFELT $ 14)) |p1|
                                           (QREFELT $ 16))
                                 |p0| (QREFELT $ 15))
                                . #2#)
                          (LETT |#G27| |p1| . #2#)
                          (LETT |p1| |#G26| . #2#)
                          (LETT |p0| |#G27| . #2#))))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |p1|))))))) 

(SDEFUN |ORTHPOL;hermiteH;Nni2R;5| ((|n| |NonNegativeInteger|) (|x| R) ($ R))
        (SPROG
         ((|p0| (R)) (|p1| (R)) (|#G34| (R)) (|#G33| (R)) (#1=#:G720 NIL)
          (|i| NIL) (|#G31| (R)) (|#G30| (R)))
         (SEQ
          (COND ((EQL |n| 0) (|spadConstant| $ 8))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G30| (SPADCALL 2 |x| (QREFELT $ 14))
                         . #2=(|ORTHPOL;hermiteH;Nni2R;5|))
                   (LETT |#G31| (|spadConstant| $ 8) . #2#)
                   (LETT |p1| |#G30| . #2#)
                   (LETT |p0| |#G31| . #2#))
                  (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT |#G33|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 2 |x| (QREFELT $ 14)) |p1|
                                           (QREFELT $ 16))
                                 (SPADCALL (SPADCALL 2 |i| (QREFELT $ 29)) |p0|
                                           (QREFELT $ 19))
                                 (QREFELT $ 15))
                                . #2#)
                          (LETT |#G34| |p1| . #2#)
                          (LETT |p1| |#G33| . #2#)
                          (LETT |p0| |#G34| . #2#))))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |p1|))))))) 

(SDEFUN |ORTHPOL;legendreP;Nni2R;6| ((|n| |NonNegativeInteger|) (|x| R) ($ R))
        (SPROG
         ((|p0| (R)) (|p1| (R)) (|#G39| (R)) (|#G38| (R))
          (|c| (|Fraction| (|Integer|))) (#1=#:G729 NIL) (|i| NIL))
         (SEQ
          (COND ((EQL |n| 0) (|spadConstant| $ 8))
                ('T
                 (SEQ
                  (LETT |p0| (|spadConstant| $ 8)
                        . #2=(|ORTHPOL;legendreP;Nni2R;6|))
                  (LETT |p1| |x| . #2#)
                  (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (LETT |c| (SPADCALL 1 (+ |i| 1) (QREFELT $ 32)) . #2#)
                        (EXIT
                         (PROGN
                          (LETT |#G38|
                                (SPADCALL |c|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (+ (SPADCALL 2 |i| (QREFELT $ 29))
                                                1)
                                             |x| (QREFELT $ 19))
                                            |p1| (QREFELT $ 16))
                                           (SPADCALL |i| |p0| (QREFELT $ 33))
                                           (QREFELT $ 15))
                                          (QREFELT $ 34))
                                . #2#)
                          (LETT |#G39| |p1| . #2#)
                          (LETT |p1| |#G38| . #2#)
                          (LETT |p0| |#G39| . #2#))))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |p1|))))))) 

(DECLAIM (NOTINLINE |OrthogonalPolynomialFunctions;|)) 

(DEFUN |OrthogonalPolynomialFunctions| (#1=#:G730)
  (SPROG NIL
         (PROG (#2=#:G731)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|OrthogonalPolynomialFunctions|)
                                               '|domainEqualList|)
                    . #3=(|OrthogonalPolynomialFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|OrthogonalPolynomialFunctions;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrthogonalPolynomialFunctions|)))))))))) 

(DEFUN |OrthogonalPolynomialFunctions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|OrthogonalPolynomialFunctions|))
          (LETT |dv$| (LIST '|OrthogonalPolynomialFunctions| DV$1) . #1#)
          (LETT $ (GETREFV 36) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|OrthogonalPolynomialFunctions|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 35
                      (CONS (|dispatchFunction| |ORTHPOL;legendreP;Nni2R;6|)
                            $))))
          $))) 

(MAKEPROP '|OrthogonalPolynomialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|) (4 . |One|)
              (8 . -) (13 . +) (|Integer|) (19 . |coerce|) (|PositiveInteger|)
              (24 . *) (30 . -) (36 . *) (|NonNegativeInteger|) (42 . ^)
              (48 . *) |ORTHPOL;laguerreL;Nni2R;1| (54 . ^) (60 . |binomial|)
              (66 . |factorial|) (|Union| $ '"failed") (71 . |exquo|)
              |ORTHPOL;laguerreL;2Nni2R;2| |ORTHPOL;chebyshevT;Nni2R;3|
              |ORTHPOL;chebyshevU;Nni2R;4| (77 . *) |ORTHPOL;hermiteH;Nni2R;5|
              (|Fraction| 11) (83 . /) (89 . *) (95 . *) (101 . |legendreP|))
           '#(|legendreP| 107 |laguerreL| 113 |hermiteH| 126 |chebyshevU| 132
              |chebyshevT| 138)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 35
                                                 '(0 6 0 7 0 6 0 8 1 6 0 0 9 2
                                                   6 0 0 0 10 1 6 0 11 12 2 6 0
                                                   13 0 14 2 6 0 0 0 15 2 6 0 0
                                                   0 16 2 17 0 0 13 18 2 6 0 11
                                                   0 19 2 6 0 0 17 21 2 11 0 0
                                                   0 22 1 11 0 0 23 2 11 24 0 0
                                                   25 2 17 0 13 0 29 2 31 0 11
                                                   11 32 2 6 0 17 0 33 2 6 0 31
                                                   0 34 2 0 6 17 6 35 2 1 6 17
                                                   6 35 2 0 6 17 6 20 3 0 6 17
                                                   17 6 26 2 0 6 17 6 30 2 0 6
                                                   17 6 28 2 0 6 17 6 27)))))
           '|lookupComplete|)) 
