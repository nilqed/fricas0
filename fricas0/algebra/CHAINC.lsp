
(PUT '|CHAINC;chainComplex;L$;1| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |CHAINC;chainComplex;L$;1| ((|v| |List| (|Matrix| (|Integer|))) ($ $))
        |v|) 

(SDEFUN |CHAINC;matrixOverRational|
        ((|AInt| |Matrix| (|Integer|)) ($ |Matrix| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G710 NIL) (|j| NIL) (#2=#:G709 NIL) (|i| NIL)
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

(SDEFUN |CHAINC;cochainComplex;$L;3|
        ((|a| $)
         ($ |List| (|Union| (|Matrix| (|Fraction| (|Integer|))) "failed")))
        (SPROG
         ((|res|
           (|List| (|Union| (|Matrix| (|Fraction| (|Integer|))) "failed")))
          (|mi| (|Union| (|Matrix| (|Fraction| (|Integer|))) "failed"))
          (#1=#:G737 NIL) (|m| NIL))
         (SEQ (LETT |res| NIL . #2=(|CHAINC;cochainComplex;$L;3|))
              (SEQ (LETT |m| NIL . #2#) (LETT #1# |a| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |mi|
                          (COND
                           ((SPADCALL |m| (QREFELT $ 18))
                            (SPADCALL (|CHAINC;matrixOverRational| |m| $)
                                      (QREFELT $ 20)))
                           ('T (CONS 1 "failed")))
                          . #2#)
                    (EXIT
                     (LETT |res| (SPADCALL |res| |mi| (QREFELT $ 23)) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |res|))))) 

(SDEFUN |CHAINC;validate;$B;4| ((|a| $) ($ |Boolean|))
        (SPROG
         ((|last| #1=(|Matrix| (|Integer|))) (#2=#:G746 NIL)
          (|prod| (|Matrix| (|Integer|))) (|m| #1#) (#3=#:G747 NIL) (|x| NIL)
          (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |len| (LENGTH |a|) . #4=(|CHAINC;validate;$B;4|))
                (COND ((< |len| 2) (PROGN (LETT #2# 'T . #4#) (GO #5=#:G745))))
                (LETT |last| (SPADCALL |a| 1 (QREFELT $ 25)) . #4#)
                (SEQ (LETT |x| 2 . #4#) (LETT #3# |len| . #4#) G190
                     (COND ((|greater_SI| |x| #3#) (GO G191)))
                     (SEQ (LETT |m| (SPADCALL |a| |x| (QREFELT $ 25)) . #4#)
                          (COND
                           ((SPADCALL (SPADCALL |m| (QREFELT $ 26))
                                      (SPADCALL |last| (QREFELT $ 27))
                                      (QREFELT $ 28))
                            (SEQ
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL "validate failed nRows="
                                          (SPADCALL
                                           (SPADCALL |m| (QREFELT $ 26))
                                           (QREFELT $ 30))
                                          (QREFELT $ 31))
                                " not equal to nCols " (QREFELT $ 31))
                               (SPADCALL (SPADCALL |last| (QREFELT $ 27))
                                         (QREFELT $ 30))
                               (QREFELT $ 31))
                              (QREFELT $ 33))
                             (EXIT (PROGN (LETT #2# NIL . #4#) (GO #5#))))))
                          (LETT |prod| (SPADCALL |last| |m| (QREFELT $ 34))
                                . #4#)
                          (COND
                           ((NULL (SPADCALL |prod| (QREFELT $ 35)))
                            (SEQ
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   "validate failed: product of adjacent maps should be zero"
                                   (SPADCALL |last| (QREFELT $ 36))
                                   (QREFELT $ 31))
                                  " * " (QREFELT $ 31))
                                 (SPADCALL |m| (QREFELT $ 36)) (QREFELT $ 31))
                                " = " (QREFELT $ 31))
                               (SPADCALL |prod| (QREFELT $ 36)) (QREFELT $ 31))
                              (QREFELT $ 33))
                             (EXIT (PROGN (LETT #2# NIL . #4#) (GO #5#))))))
                          (EXIT (LETT |last| |m| . #4#)))
                     (LETT |x| (|inc_SI| |x|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |CHAINC;homology;$L;5| ((|a| $) ($ |List| (|Homology|)))
        (SPROG
         ((|prev| (|Matrix| (|Integer|))) (|notFirst| (|Boolean|))
          (|res| (|List| (|Homology|))) (|m2| (|Homology|)) (#1=#:G753 NIL)
          (|m1| NIL))
         (SEQ (LETT |res| NIL . #2=(|CHAINC;homology;$L;5|))
              (LETT |prev| (MAKE_MATRIX 0 0) . #2#) (LETT |notFirst| NIL . #2#)
              (SEQ (LETT |m1| NIL . #2#) (LETT #1# |a| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |m1| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|notFirst|
                      (SEQ
                       (LETT |m2| (SPADCALL |m1| |prev| (QREFELT $ 39)) . #2#)
                       (EXIT
                        (LETT |res| (SPADCALL |res| |m2| (QREFELT $ 41))
                              . #2#)))))
                    (LETT |notFirst| 'T . #2#) (EXIT (LETT |prev| |m1| . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CHAINC;coerce;$Of;6| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|lst| (|List| (|OutputForm|))) (#1=#:G758 NIL) (|x| NIL)
          (#2=#:G757 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #2# NIL . #3=(|CHAINC;coerce;$Of;6|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |s| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 36)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (SPADCALL |lst| (QREFELT $ 44)))))) 

(DECLAIM (NOTINLINE |ChainComplex;|)) 

(DEFUN |ChainComplex| ()
  (SPROG NIL
         (PROG (#1=#:G760)
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
          (LETT $ (GETREFV 50) . #1#)
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
              (|Matrix| 9) (16 . |setelt!|) (|Boolean|) (24 . |square?|)
              (|Union| $ '"failed") (29 . |invertIfCan|) (|Union| 15 '"failed")
              (|List| 21) (34 . |concat|) |CHAINC;cochainComplex;$L;3|
              (40 . |elt|) (46 . |maxRowIndex|) (51 . |maxColIndex|) (56 . ~=)
              (|OutputForm|) (62 . |coerce|) (67 . |hconcat|) (|Void|)
              (73 . |print|) (78 . *) (84 . |zero?|) (89 . |coerce|)
              |CHAINC;validate;$B;4| (|Homology|) (94 . |homologyGroup|)
              (|List| 38) (100 . |concat|) |CHAINC;homology;$L;5| (|List| $)
              (106 . |commaSeparate|) |CHAINC;coerce;$Of;6|
              (|NonNegativeInteger|) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 111 |validate| 117 |setMaxFaces| 122 |prod| 128 |maxFaces| 134
              |latex| 139 |join| 144 |homology| 150 |hashUpdate!| 155 |hash|
              161 |coerce| 166 |cochainComplex| 171 |chainComplex| 176 = 181)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|VertexSet|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 29))
                        (|makeByteWordVec2| 49
                                            '(0 9 0 10 3 12 11 0 11 11 13 1 9 0
                                              11 14 4 15 9 0 11 11 9 16 1 12 17
                                              0 18 1 15 19 0 20 2 22 0 0 21 23
                                              2 6 12 0 11 25 1 12 11 0 26 1 12
                                              11 0 27 2 11 17 0 0 28 1 11 29 0
                                              30 2 29 0 0 0 31 1 29 32 0 33 2
                                              12 0 0 0 34 1 12 17 0 35 1 12 29
                                              0 36 2 38 0 12 12 39 2 40 0 0 38
                                              41 1 29 0 43 44 2 0 17 0 0 1 1 0
                                              17 0 37 2 0 32 0 46 1 2 0 0 0 0 1
                                              1 0 46 0 1 1 0 48 0 1 2 0 0 0 0 1
                                              1 0 40 0 42 2 0 47 47 0 1 1 0 49
                                              0 1 1 0 29 0 45 1 0 22 0 24 1 0 0
                                              7 8 2 0 17 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|ChainComplex| 'NILADIC T) 
