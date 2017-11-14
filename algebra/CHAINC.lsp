
(PUT '|CHAINC;chainComplex;L$;1| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |CHAINC;chainComplex;L$;1| ((|v| |List| (|Matrix| (|Integer|))) ($ $))
        |v|) 

(SDEFUN |CHAINC;matrixOverRational|
        ((|AInt| |Matrix| (|Integer|)) ($ |Matrix| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G713 NIL) (|j| NIL) (#2=#:G712 NIL) (|i| NIL)
          (|a| (|Matrix| (|Fraction| (|Integer|))))
          (|ACols| (|NonNegativeInteger|)) (|ARows| (|NonNegativeInteger|)))
         (SEQ (LETT |ARows| (ANROWS |AInt|) . #3=(|CHAINC;matrixOverRational|))
              (LETT |ACols| (ANCOLS |AInt|) . #3#)
              (LETT |a| (MAKE_MATRIX1 |ARows| |ACols| (|spadConstant| $ 10))
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
                                       (SPADCALL |AInt| |i| |j| (QREFELT $ 13))
                                       (QREFELT $ 14))
                                      (QREFELT $ 16))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |a|)))) 

(SDEFUN |CHAINC;validate;$B;3| ((|a| $) ($ |Boolean|))
        (SPROG
         ((|last| #1=(|Matrix| (|Integer|))) (#2=#:G735 NIL)
          (|prod| (|Matrix| (|Integer|))) (|m| #1#) (#3=#:G736 NIL) (|x| NIL)
          (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |len| (LENGTH |a|) . #4=(|CHAINC;validate;$B;3|))
                (COND ((< |len| 2) (PROGN (LETT #2# 'T . #4#) (GO #5=#:G734))))
                (LETT |last| (SPADCALL |a| 1 (QREFELT $ 17)) . #4#)
                (SEQ (LETT |x| 2 . #4#) (LETT #3# |len| . #4#) G190
                     (COND ((|greater_SI| |x| #3#) (GO G191)))
                     (SEQ (LETT |m| (SPADCALL |a| |x| (QREFELT $ 17)) . #4#)
                          (COND
                           ((SPADCALL (SPADCALL |m| (QREFELT $ 18))
                                      (SPADCALL |last| (QREFELT $ 19))
                                      (QREFELT $ 21))
                            (SEQ
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL "validate failed nRows="
                                           (QREFELT $ 24))
                                 (SPADCALL (SPADCALL |m| (QREFELT $ 18))
                                           (QREFELT $ 25))
                                 (QREFELT $ 26))
                                (SPADCALL " not equal to nCols "
                                          (QREFELT $ 24))
                                (QREFELT $ 26))
                               (SPADCALL (SPADCALL |last| (QREFELT $ 19))
                                         (QREFELT $ 25))
                               (QREFELT $ 26))
                              (QREFELT $ 28))
                             (EXIT (PROGN (LETT #2# NIL . #4#) (GO #5#))))))
                          (LETT |prod| (SPADCALL |last| |m| (QREFELT $ 29))
                                . #4#)
                          (COND
                           ((NULL (SPADCALL |prod| (QREFELT $ 30)))
                            (SEQ
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    "validate failed: product of adjacent maps should be zero"
                                    (QREFELT $ 24))
                                   (SPADCALL |last| (QREFELT $ 31))
                                   (QREFELT $ 26))
                                  (SPADCALL " * " (QREFELT $ 24))
                                  (QREFELT $ 26))
                                 (SPADCALL |m| (QREFELT $ 31)) (QREFELT $ 26))
                                (SPADCALL " = " (QREFELT $ 24)) (QREFELT $ 26))
                               (SPADCALL |prod| (QREFELT $ 31)) (QREFELT $ 26))
                              (QREFELT $ 28))
                             (EXIT (PROGN (LETT #2# NIL . #4#) (GO #5#))))))
                          (EXIT (LETT |last| |m| . #4#)))
                     (LETT |x| (|inc_SI| |x|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |CHAINC;homology;$L;4| ((|a| $) ($ |List| (|Homology|)))
        (SPROG
         ((|prev| (|Matrix| (|Integer|))) (|notFirst| (|Boolean|))
          (|res| (|List| (|Homology|))) (|m2| (|Homology|)) (#1=#:G742 NIL)
          (|m1| NIL))
         (SEQ (LETT |res| NIL . #2=(|CHAINC;homology;$L;4|))
              (LETT |prev| (MAKE_MATRIX 0 0) . #2#) (LETT |notFirst| NIL . #2#)
              (SEQ (LETT |m1| NIL . #2#) (LETT #1# |a| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |m1| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|notFirst|
                      (SEQ
                       (LETT |m2| (SPADCALL |m1| |prev| (QREFELT $ 34)) . #2#)
                       (EXIT
                        (LETT |res| (SPADCALL |res| |m2| (QREFELT $ 36))
                              . #2#)))))
                    (LETT |notFirst| 'T . #2#) (EXIT (LETT |prev| |m1| . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CHAINC;coerce;$Of;5| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|lst| (|List| (|OutputForm|))) (#1=#:G747 NIL) (|x| NIL)
          (#2=#:G746 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #2# NIL . #3=(|CHAINC;coerce;$Of;5|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |s| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 31)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (SPADCALL |lst| (QREFELT $ 39)))))) 

(DECLAIM (NOTINLINE |ChainComplex;|)) 

(DEFUN |ChainComplex| ()
  (SPROG NIL
         (PROG (#1=#:G749)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ChainComplex|)
                    . #2=(|ChainComplex|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ChainComplex|
                             (LIST (CONS NIL (CONS 1 (|ChainComplex;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|ChainComplex|)))))))))) 

(DEFUN |ChainComplex;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ChainComplex|) . #1=(|ChainComplex|))
          (LETT $ (GETREFV 43) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ChainComplex| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|List| (|Matrix| (|Integer|))))
          $))) 

(MAKEPROP '|ChainComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 12)
              |CHAINC;chainComplex;L$;1| (|Fraction| 11) (0 . |Zero|)
              (|Integer|) (|Matrix| 11) (4 . |elt|) (11 . |coerce|)
              (|Matrix| 9) (16 . |setelt!|) (24 . |elt|) (30 . |maxRowIndex|)
              (35 . |maxColIndex|) (|Boolean|) (40 . ~=) (|String|)
              (|OutputForm|) (46 . |message|) (51 . |coerce|) (56 . |hconcat|)
              (|Void|) (62 . |print|) (67 . *) (73 . |zero?|) (78 . |coerce|)
              |CHAINC;validate;$B;3| (|Homology|) (83 . |homologyGroup|)
              (|List| 33) (89 . |concat|) |CHAINC;homology;$L;4| (|List| $)
              (95 . |commaSeparate|) |CHAINC;coerce;$Of;5| (|SingleInteger|)
              (|HashState|))
           '#(~= 100 |validate| 106 |latex| 111 |homology| 116 |hashUpdate!|
              121 |hash| 127 |coerce| 132 |chainComplex| 137 = 142)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 23))
                        (|makeByteWordVec2| 42
                                            '(0 9 0 10 3 12 11 0 11 11 13 1 9 0
                                              11 14 4 15 9 0 11 11 9 16 2 6 12
                                              0 11 17 1 12 11 0 18 1 12 11 0 19
                                              2 11 20 0 0 21 1 23 0 22 24 1 11
                                              23 0 25 2 23 0 0 0 26 1 23 27 0
                                              28 2 12 0 0 0 29 1 12 20 0 30 1
                                              12 23 0 31 2 33 0 12 12 34 2 35 0
                                              0 33 36 1 23 0 38 39 2 0 20 0 0 1
                                              1 0 20 0 32 1 0 22 0 1 1 0 35 0
                                              37 2 0 42 42 0 1 1 0 41 0 1 1 0
                                              23 0 40 1 0 0 7 8 2 0 20 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|ChainComplex| 'NILADIC T) 
