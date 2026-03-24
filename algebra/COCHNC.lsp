
(PUT '|COCHNC;coChainComplex;L%;1| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |COCHNC;coChainComplex;L%;1|
        ((|v| (|List| (|Matrix| (|Integer|)))) (% (%))) |v|) 

(SDEFUN |COCHNC;coChainComplex;Cc%;2| ((|s| (|ChainComplex|)) (% (%)))
        (SPROG ((|tm| (%)))
               (SEQ (LETT |tm| (SPADCALL |s| (QREFELT % 11)))
                    (LETT |tm| (NREVERSE |tm|))
                    (EXIT (SPADCALL (ELT % 13) |tm| (QREFELT % 15)))))) 

(SDEFUN |COCHNC;validate;%B;3| ((|a| (%)) (% (|Boolean|)))
        (SPROG
         ((|last| (|Matrix| (|Integer|))) (#1=#:G16 NIL)
          (|prod| (|Matrix| (|Integer|))) (#2=#:G17 NIL) (|m| NIL)
          (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |len| (LENGTH |a|))
                (COND ((< |len| 2) (PROGN (LETT #1# 'T) (GO #3=#:G15))))
                (LETT |last| (|SPADfirst| |a|))
                (SEQ (LETT |m| NIL) (LETT #2# (CDR |a|)) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |m| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL (SPADCALL |m| (QREFELT % 18))
                                  (SPADCALL |last| (QREFELT % 19))
                                  (QREFELT % 21))
                        (SEQ
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL "validate failed nRows=" (QREFELT % 24))
                             (SPADCALL (SPADCALL |m| (QREFELT % 18))
                                       (QREFELT % 25))
                             (QREFELT % 26))
                            (SPADCALL " not equal to nCols " (QREFELT % 24))
                            (QREFELT % 26))
                           (SPADCALL (SPADCALL |last| (QREFELT % 19))
                                     (QREFELT % 25))
                           (QREFELT % 26))
                          (QREFELT % 29))
                         (EXIT (PROGN (LETT #1# NIL) (GO #3#))))))
                      (LETT |prod| (SPADCALL |last| |m| (QREFELT % 30)))
                      (COND
                       ((NULL (SPADCALL |prod| (QREFELT % 31)))
                        (SEQ
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                "validate failed: product of adjacent maps should be zero"
                                (QREFELT % 24))
                               (SPADCALL |last| (QREFELT % 32)) (QREFELT % 26))
                              (SPADCALL " * " (QREFELT % 24)) (QREFELT % 26))
                             (SPADCALL |m| (QREFELT % 32)) (QREFELT % 26))
                            (SPADCALL " = " (QREFELT % 24)) (QREFELT % 26))
                           (SPADCALL |prod| (QREFELT % 32)) (QREFELT % 26))
                          (QREFELT % 29))
                         (EXIT (PROGN (LETT #1# NIL) (GO #3#))))))
                      (EXIT (LETT |last| |m|)))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #3# (EXIT #1#)))) 

(SDEFUN |COCHNC;coboundary;%Nni2L;4|
        ((|a| (%)) (|n| (|NonNegativeInteger|)) (|inp| (|List| VS))
         (% (|List| VS)))
        (SPROG
         ((|res| (|List| VS)) (#1=#:G35 NIL) (|i| NIL) (#2=#:G34 NIL)
          (|res1| (|List| VS)) (|val| (VS)) (#3=#:G33 NIL) (|v| NIL)
          (|vs| (|Vector| (|Integer|))) (|m| (|Matrix| (|Integer|)))
          (|b| (|Vector| (|Integer|))) (|base| (|List| (|Integer|)))
          (#4=#:G32 NIL) (|x| NIL) (#5=#:G31 NIL) (#6=#:G30 NIL) (|p| NIL)
          (|inpn| (|NonNegativeInteger|))
          (|maps| (|List| (|Matrix| (|Integer|)))))
         (SEQ (LETT |maps| (REVERSE |a|)) (LETT |res| NIL)
              (LETT |inpn| (LENGTH |inp|))
              (SEQ (LETT |p| 1) (LETT #6# |inpn|) G190
                   (COND ((|greater_SI| |p| #6#) (GO G191)))
                   (SEQ
                    (LETT |base|
                          (PROGN
                           (LETT #5# NIL)
                           (SEQ (LETT |x| 1) (LETT #4# |inpn|) G190
                                (COND ((|greater_SI| |x| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS (COND ((EQL |x| |p|) 1) ('T 0))
                                              #5#))))
                                (LETT |x| (|inc_SI| |x|)) (GO G190) G191
                                (EXIT (NREVERSE #5#)))))
                    (LETT |b| (SPADCALL |base| (QREFELT % 36)))
                    (LETT |m|
                          (SPADCALL (SPADCALL |maps| |n| (QREFELT % 37))
                                    (QREFELT % 13)))
                    (LETT |vs| (SPADCALL |b| |m| (QREFELT % 38)))
                    (LETT |res1| NIL)
                    (SEQ (LETT |v| NIL)
                         (LETT #3# (SPADCALL |vs| (QREFELT % 39))) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |val| (SPADCALL |inp| |p| (QREFELT % 41)))
                              (COND
                               ((EQL |v| 0)
                                (LETT |res1|
                                      (SPADCALL |res1| (|spadConstant| % 42)
                                                (QREFELT % 43)))))
                              (COND
                               ((> |v| 0)
                                (LETT |res1|
                                      (SPADCALL |res1|
                                                (SPADCALL |val| (QREFELT % 44))
                                                (QREFELT % 43)))))
                              (EXIT
                               (COND
                                ((< |v| 0)
                                 (LETT |res1|
                                       (SPADCALL |res1| |val|
                                                 (QREFELT % 43)))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((NULL |res|) (LETT |res| |res1|))
                           ('T
                            (LETT |res|
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |i| 1) (LETT #1# (LENGTH |res1|))
                                        G190
                                        (COND
                                         ((|greater_SI| |i| #1#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |res| |i|
                                                            (QREFELT % 41))
                                                  (SPADCALL |res1| |i|
                                                            (QREFELT % 41))
                                                  (QREFELT % 45))
                                                 #2#))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT (NREVERSE #2#)))))))))
                   (LETT |p| (|inc_SI| |p|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |COCHNC;coHomology;%L;5| ((|a| (%)) (% (|List| (|Homology|))))
        (SPROG
         ((|prev| (|Matrix| (|Integer|))) (|notFirst| (|Boolean|))
          (|res| (|List| (|Homology|))) (|m2| (|Homology|)) (#1=#:G42 NIL)
          (|m1| NIL))
         (SEQ (LETT |res| NIL) (LETT |prev| (MAKE_MATRIX 0 0))
              (LETT |notFirst| NIL)
              (SEQ (LETT |m1| NIL) (LETT #1# |a|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |m1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|notFirst|
                      (SEQ (LETT |m2| (SPADCALL |m1| |prev| (QREFELT % 49)))
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res| |m2| (QREFELT % 51)))))))
                    (LETT |notFirst| 'T) (EXIT (LETT |prev| |m1|)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |COCHNC;coerce;%Of;6| ((|s| (%)) (% (|OutputForm|)))
        (SPROG
         ((|lst| (|List| (|OutputForm|))) (#1=#:G48 NIL) (|x| NIL)
          (#2=#:G47 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |x| NIL) (LETT #1# |s|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT % 32)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (SPADCALL |lst| (QREFELT % 54)))))) 

(DECLAIM (NOTINLINE |CoChainComplex;|)) 

(DEFUN |CoChainComplex;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|CoChainComplex| DV$1))
          (LETT % (GETREFV 56))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CoChainComplex| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (|List| (|Matrix| (|Integer|))))
          %))) 

(DEFUN |CoChainComplex| (#1=#:G49)
  (SPROG NIL
         (PROG (#2=#:G50)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CoChainComplex|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|CoChainComplex;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CoChainComplex|)))))))))) 

(MAKEPROP '|CoChainComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 12)
              |COCHNC;coChainComplex;L%;1| (|ChainComplex|)
              (0 . |transition_matrices|) (|Matrix| 17) (5 . |transpose|)
              (|Mapping| 12 12) (10 . |map|) |COCHNC;coChainComplex;Cc%;2|
              (|Integer|) (16 . |maxRowIndex|) (21 . |maxColIndex|) (|Boolean|)
              (26 . ~=) (|String|) (|OutputForm|) (32 . |message|)
              (37 . |coerce|) (42 . |hconcat|) (|Void|) (|PrintPackage|)
              (48 . |print|) (53 . *) (59 . |zero?|) (64 . |coerce|)
              |COCHNC;validate;%B;3| (|List| 17) (|Vector| 17) (69 . |vector|)
              (74 . |elt|) (80 . *) (86 . |entries|) (|List| 6) (91 . |elt|)
              (97 . |Zero|) (101 . |concat|) (107 . -) (112 . +)
              (|NonNegativeInteger|) |COCHNC;coboundary;%Nni2L;4| (|Homology|)
              (118 . |homologyGroup|) (|List| 48) (124 . |concat|)
              |COCHNC;coHomology;%L;5| (|List| %) (130 . |commaSeparate|)
              |COCHNC;coerce;%Of;6|)
           '#(~= 135 |validate| 141 |latex| 146 |coerce| 151 |coboundary| 156
              |coHomology| 163 |coChainComplex| 168 = 178)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 23) (|BasicType|))
                        (|makeByteWordVec2| 55
                                            '(1 10 8 0 11 1 12 0 0 13 2 7 0 14
                                              0 15 1 12 17 0 18 1 12 17 0 19 2
                                              17 20 0 0 21 1 23 0 22 24 1 17 23
                                              0 25 2 23 0 0 0 26 1 28 27 23 29
                                              2 12 0 0 0 30 1 12 20 0 31 1 12
                                              23 0 32 1 35 0 34 36 2 7 12 0 17
                                              37 2 12 35 35 0 38 1 35 34 0 39 2
                                              40 6 0 17 41 0 6 0 42 2 40 0 0 6
                                              43 1 6 0 0 44 2 6 0 0 0 45 2 48 0
                                              12 12 49 2 50 0 0 48 51 1 23 0 53
                                              54 2 0 20 0 0 1 1 0 20 0 33 1 0
                                              22 0 1 1 0 23 0 55 3 0 40 0 46 40
                                              47 1 0 50 0 52 1 0 0 8 9 1 0 0 10
                                              16 2 0 20 0 0 1)))))
           '|lookupComplete|)) 
