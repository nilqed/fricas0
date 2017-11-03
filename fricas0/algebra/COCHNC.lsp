
(PUT '|COCHNC;coChainComplex;L$;1| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |COCHNC;coChainComplex;L$;1|
        ((|v| |List| (|Matrix| (|Integer|))) ($ $)) |v|) 

(SDEFUN |COCHNC;matrixOverRational|
        ((|AInt| |Matrix| (|Integer|)) ($ |Matrix| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G714 NIL) (|j| NIL) (#2=#:G713 NIL) (|i| NIL)
          (|a| (|Matrix| (|Fraction| (|Integer|))))
          (|ACols| (|NonNegativeInteger|)) (|ARows| (|NonNegativeInteger|)))
         (SEQ (LETT |ARows| (ANROWS |AInt|) . #3=(|COCHNC;matrixOverRational|))
              (LETT |ACols| (ANCOLS |AInt|) . #3#)
              (LETT |a| (MAKE_MATRIX1 |ARows| |ACols| (|spadConstant| $ 11))
                    . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT #2# |ARows| . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #3#) (LETT #1# |ACols| . #3#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |a| |i| |j|
                                      (SPADCALL
                                       (SPADCALL |AInt| |i| |j| (QREFELT $ 14))
                                       (QREFELT $ 15))
                                      (QREFELT $ 17))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |a|)))) 

(SDEFUN |COCHNC;validate;$B;3| ((|a| $) ($ |Boolean|))
        (SPROG
         ((|last| #1=(|Matrix| (|Integer|))) (#2=#:G736 NIL)
          (|prod| (|Matrix| (|Integer|))) (|m| #1#) (#3=#:G737 NIL) (|x| NIL)
          (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |len| (LENGTH |a|) . #4=(|COCHNC;validate;$B;3|))
                (COND ((< |len| 2) (PROGN (LETT #2# 'T . #4#) (GO #5=#:G735))))
                (LETT |last| (SPADCALL |a| 1 (QREFELT $ 18)) . #4#)
                (SEQ (LETT |x| 2 . #4#) (LETT #3# |len| . #4#) G190
                     (COND ((|greater_SI| |x| #3#) (GO G191)))
                     (SEQ (LETT |m| (SPADCALL |a| |x| (QREFELT $ 18)) . #4#)
                          (COND
                           ((SPADCALL (SPADCALL |m| (QREFELT $ 19))
                                      (SPADCALL |last| (QREFELT $ 20))
                                      (QREFELT $ 22))
                            (SEQ
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL "validate failed nRows="
                                           (QREFELT $ 25))
                                 (SPADCALL (SPADCALL |m| (QREFELT $ 19))
                                           (QREFELT $ 26))
                                 (QREFELT $ 27))
                                (SPADCALL " not equal to nCols "
                                          (QREFELT $ 25))
                                (QREFELT $ 27))
                               (SPADCALL (SPADCALL |last| (QREFELT $ 20))
                                         (QREFELT $ 26))
                               (QREFELT $ 27))
                              (QREFELT $ 29))
                             (EXIT (PROGN (LETT #2# NIL . #4#) (GO #5#))))))
                          (LETT |prod| (SPADCALL |last| |m| (QREFELT $ 30))
                                . #4#)
                          (COND
                           ((NULL (SPADCALL |prod| (QREFELT $ 31)))
                            (SEQ
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    "validate failed: product of adjacent maps should be zero"
                                    (QREFELT $ 25))
                                   (SPADCALL |last| (QREFELT $ 32))
                                   (QREFELT $ 27))
                                  (SPADCALL " * " (QREFELT $ 25))
                                  (QREFELT $ 27))
                                 (SPADCALL |m| (QREFELT $ 32)) (QREFELT $ 27))
                                (SPADCALL " = " (QREFELT $ 25)) (QREFELT $ 27))
                               (SPADCALL |prod| (QREFELT $ 32)) (QREFELT $ 27))
                              (QREFELT $ 29))
                             (EXIT (PROGN (LETT #2# NIL . #4#) (GO #5#))))))
                          (EXIT (LETT |last| |m| . #4#)))
                     (LETT |x| (|inc_SI| |x|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |COCHNC;coboundary;$Nni2L;4|
        ((|a| $) (|n| |NonNegativeInteger|) (|inp| |List| VS) ($ |List| VS))
        (SPROG
         ((|res| (|List| VS)) (#1=#:G751 NIL) (|i| NIL) (#2=#:G750 NIL)
          (|res1| (|List| VS)) (|val| (VS)) (#3=#:G749 NIL) (|v| NIL)
          (|fst| (|Boolean|)) (|vs| (|Vector| (|Integer|)))
          (|m| (|Matrix| (|Integer|))) (|b| (|Vector| (|Integer|)))
          (|base| (|List| (|Integer|))) (#4=#:G748 NIL) (|x| NIL)
          (#5=#:G747 NIL) (#6=#:G746 NIL) (|p| NIL)
          (|inpn| (|NonNegativeInteger|))
          (|maps| (|List| (|Matrix| (|Integer|)))))
         (SEQ (LETT |maps| (REVERSE |a|) . #7=(|COCHNC;coboundary;$Nni2L;4|))
              (LETT |res| NIL . #7#) (LETT |inpn| (LENGTH |inp|) . #7#)
              (SEQ (LETT |p| 1 . #7#) (LETT #6# |inpn| . #7#) G190
                   (COND ((|greater_SI| |p| #6#) (GO G191)))
                   (SEQ
                    (LETT |base|
                          (PROGN
                           (LETT #5# NIL . #7#)
                           (SEQ (LETT |x| 1 . #7#) (LETT #4# |inpn| . #7#) G190
                                (COND ((|greater_SI| |x| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS (COND ((EQL |x| |p|) 1) ('T 0))
                                              #5#)
                                        . #7#)))
                                (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          . #7#)
                    (LETT |b| (SPADCALL |base| (QREFELT $ 36)) . #7#)
                    (LETT |m|
                          (SPADCALL (SPADCALL |maps| |n| (QREFELT $ 18))
                                    (QREFELT $ 37))
                          . #7#)
                    (LETT |vs| (SPADCALL |b| |m| (QREFELT $ 38)) . #7#)
                    (LETT |fst| 'T . #7#) (LETT |res1| NIL . #7#)
                    (SEQ (LETT |v| NIL . #7#)
                         (LETT #3# (SPADCALL |vs| (QREFELT $ 39)) . #7#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |v| (CAR #3#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |val| (SPADCALL |inp| |p| (QREFELT $ 41))
                                . #7#)
                          (COND
                           ((EQL |v| 0)
                            (LETT |res1|
                                  (SPADCALL |res1| (|spadConstant| $ 42)
                                            (QREFELT $ 43))
                                  . #7#)))
                          (COND
                           ((SPADCALL |v| 0 (QREFELT $ 44))
                            (LETT |res1|
                                  (SPADCALL |res1|
                                            (SPADCALL |val| (QREFELT $ 45))
                                            (QREFELT $ 43))
                                  . #7#)))
                          (EXIT
                           (COND
                            ((< |v| 0)
                             (LETT |res1|
                                   (SPADCALL |res1| |val| (QREFELT $ 43))
                                   . #7#)))))
                         (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((NULL |res|) (LETT |res| |res1| . #7#))
                           ('T
                            (LETT |res|
                                  (PROGN
                                   (LETT #2# NIL . #7#)
                                   (SEQ (LETT |i| 1 . #7#)
                                        (LETT #1# (LENGTH |res1|) . #7#) G190
                                        (COND
                                         ((|greater_SI| |i| #1#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |res| |i|
                                                            (QREFELT $ 41))
                                                  (SPADCALL |res1| |i|
                                                            (QREFELT $ 41))
                                                  (QREFELT $ 46))
                                                 #2#)
                                                . #7#)))
                                        (LETT |i| (|inc_SI| |i|) . #7#)
                                        (GO G190) G191 (EXIT (NREVERSE #2#))))
                                  . #7#)))))
                   (LETT |p| (|inc_SI| |p|) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |COCHNC;coHomology;$L;5| ((|a| $) ($ |List| (|Homology|)))
        (SPROG
         ((|prev| (|Matrix| (|Integer|))) (|notFirst| (|Boolean|))
          (|res| (|List| (|Homology|))) (|m2| (|Homology|)) (#1=#:G757 NIL)
          (|m1| NIL))
         (SEQ (LETT |res| NIL . #2=(|COCHNC;coHomology;$L;5|))
              (LETT |prev| (MAKE_MATRIX 0 0) . #2#) (LETT |notFirst| NIL . #2#)
              (SEQ (LETT |m1| NIL . #2#) (LETT #1# |a| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |m1| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|notFirst|
                      (SEQ
                       (LETT |m2| (SPADCALL |m1| |prev| (QREFELT $ 50)) . #2#)
                       (EXIT
                        (LETT |res| (SPADCALL |res| |m2| (QREFELT $ 52))
                              . #2#)))))
                    (LETT |notFirst| 'T . #2#) (EXIT (LETT |prev| |m1| . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |COCHNC;coerce;$Of;6| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|lst| (|List| (|OutputForm|))) (#1=#:G762 NIL) (|x| NIL)
          (#2=#:G761 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #2# NIL . #3=(|COCHNC;coerce;$Of;6|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |s| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 32)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (SPADCALL |lst| (QREFELT $ 55)))))) 

(DECLAIM (NOTINLINE |CoChainComplex;|)) 

(DEFUN |CoChainComplex| (#1=#:G763)
  (SPROG NIL
         (PROG (#2=#:G764)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CoChainComplex|)
                                               '|domainEqualList|)
                    . #3=(|CoChainComplex|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|CoChainComplex;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CoChainComplex|)))))))))) 

(DEFUN |CoChainComplex;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|CoChainComplex|))
          (LETT |dv$| (LIST '|CoChainComplex| DV$1) . #1#)
          (LETT $ (GETREFV 59) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CoChainComplex| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|List| (|Matrix| (|Integer|))))
          $))) 

(MAKEPROP '|CoChainComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 13)
              |COCHNC;coChainComplex;L$;1| (|Fraction| 12) (0 . |Zero|)
              (|Integer|) (|Matrix| 12) (4 . |elt|) (11 . |coerce|)
              (|Matrix| 10) (16 . |setelt!|) (24 . |elt|) (30 . |maxRowIndex|)
              (35 . |maxColIndex|) (|Boolean|) (40 . ~=) (|String|)
              (|OutputForm|) (46 . |message|) (51 . |coerce|) (56 . |hconcat|)
              (|Void|) (62 . |print|) (67 . *) (73 . |zero?|) (78 . |coerce|)
              |COCHNC;validate;$B;3| (|List| 12) (|Vector| 12) (83 . |vector|)
              (88 . |transpose|) (93 . *) (99 . |entries|) (|List| 6)
              (104 . |elt|) (110 . |Zero|) (114 . |concat|) (120 . >) (126 . -)
              (131 . +) (|NonNegativeInteger|) |COCHNC;coboundary;$Nni2L;4|
              (|Homology|) (137 . |homologyGroup|) (|List| 49) (143 . |concat|)
              |COCHNC;coHomology;$L;5| (|List| $) (149 . |commaSeparate|)
              |COCHNC;coerce;$Of;6| (|SingleInteger|) (|HashState|))
           '#(~= 154 |validate| 160 |latex| 165 |hashUpdate!| 170 |hash| 176
              |coerce| 181 |coboundary| 186 |coHomology| 193 |coChainComplex|
              198 = 203)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 24))
                        (|makeByteWordVec2| 58
                                            '(0 10 0 11 3 13 12 0 12 12 14 1 10
                                              0 12 15 4 16 10 0 12 12 10 17 2 7
                                              13 0 12 18 1 13 12 0 19 1 13 12 0
                                              20 2 12 21 0 0 22 1 24 0 23 25 1
                                              12 24 0 26 2 24 0 0 0 27 1 24 28
                                              0 29 2 13 0 0 0 30 1 13 21 0 31 1
                                              13 24 0 32 1 35 0 34 36 1 13 0 0
                                              37 2 13 35 35 0 38 1 35 34 0 39 2
                                              40 6 0 12 41 0 6 0 42 2 40 0 0 6
                                              43 2 12 21 0 0 44 1 6 0 0 45 2 6
                                              0 0 0 46 2 49 0 13 13 50 2 51 0 0
                                              49 52 1 24 0 54 55 2 0 21 0 0 1 1
                                              0 21 0 33 1 0 23 0 1 2 0 58 58 0
                                              1 1 0 57 0 1 1 0 24 0 56 3 0 40 0
                                              47 40 48 1 0 51 0 53 1 0 0 8 9 2
                                              0 21 0 0 1)))))
           '|lookupComplete|)) 
