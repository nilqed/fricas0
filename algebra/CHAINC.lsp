
(PUT '|CHAINC;chainComplex;L%;1| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |CHAINC;chainComplex;L%;1|
        ((|v| (|List| (|Matrix| (|Integer|)))) (% (%))) |v|) 

(PUT '|CHAINC;transition_matrices;%L;2| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |CHAINC;transition_matrices;%L;2|
        ((|a| (%)) (% (|List| (|Matrix| (|Integer|))))) |a|) 

(SDEFUN |CHAINC;validate;%B;3| ((|a| (%)) (% (|Boolean|)))
        (SPROG
         ((|last| (|Matrix| (|Integer|))) (#1=#:G13 NIL)
          (|prod| (|Matrix| (|Integer|))) (#2=#:G14 NIL) (|m| NIL)
          (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |len| (LENGTH |a|))
                (COND ((< |len| 2) (PROGN (LETT #1# 'T) (GO #3=#:G12))))
                (LETT |last| (|SPADfirst| |a|))
                (SEQ (LETT |m| NIL) (LETT #2# (CDR |a|)) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |m| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL (SPADCALL |m| (QREFELT % 12))
                                  (SPADCALL |last| (QREFELT % 13))
                                  (QREFELT % 15))
                        (SEQ
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL "validate failed nRows=" (QREFELT % 18))
                             (SPADCALL (SPADCALL |m| (QREFELT % 12))
                                       (QREFELT % 19))
                             (QREFELT % 20))
                            (SPADCALL " not equal to nCols " (QREFELT % 18))
                            (QREFELT % 20))
                           (SPADCALL (SPADCALL |last| (QREFELT % 13))
                                     (QREFELT % 19))
                           (QREFELT % 20))
                          (QREFELT % 23))
                         (EXIT (PROGN (LETT #1# NIL) (GO #3#))))))
                      (LETT |prod| (SPADCALL |last| |m| (QREFELT % 24)))
                      (COND
                       ((NULL (SPADCALL |prod| (QREFELT % 25)))
                        (SEQ
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                "validate failed: product of adjacent maps should be zero"
                                (QREFELT % 18))
                               (SPADCALL |last| (QREFELT % 26)) (QREFELT % 20))
                              (SPADCALL " * " (QREFELT % 18)) (QREFELT % 20))
                             (SPADCALL |m| (QREFELT % 26)) (QREFELT % 20))
                            (SPADCALL " = " (QREFELT % 18)) (QREFELT % 20))
                           (SPADCALL |prod| (QREFELT % 26)) (QREFELT % 20))
                          (QREFELT % 23))
                         (EXIT (PROGN (LETT #1# NIL) (GO #3#))))))
                      (EXIT (LETT |last| |m|)))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #3# (EXIT #1#)))) 

(SDEFUN |CHAINC;homology;%L;4| ((|a| (%)) (% (|List| (|Homology|))))
        (SPROG
         ((|prev| (|Matrix| (|Integer|))) (|notFirst| (|Boolean|))
          (|res| (|List| (|Homology|))) (|m2| (|Homology|)) (#1=#:G21 NIL)
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
                      (SEQ (LETT |m2| (SPADCALL |m1| |prev| (QREFELT % 29)))
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res| |m2| (QREFELT % 31)))))))
                    (LETT |notFirst| 'T) (EXIT (LETT |prev| |m1|)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CHAINC;coerce;%Of;5| ((|s| (%)) (% (|OutputForm|)))
        (SPROG
         ((|lst| (|List| (|OutputForm|))) (#1=#:G27 NIL) (|x| NIL)
          (#2=#:G26 NIL))
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
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT % 26)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (SPADCALL |lst| (QREFELT % 34)))))) 

(DECLAIM (NOTINLINE |ChainComplex;|)) 

(DEFUN |ChainComplex;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ChainComplex|))
          (LETT % (GETREFV 36))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ChainComplex| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|List| (|Matrix| (|Integer|))))
          %))) 

(DEFUN |ChainComplex| ()
  (SPROG NIL
         (PROG (#1=#:G29)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ChainComplex|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ChainComplex|
                             (LIST (CONS NIL (CONS 1 (|ChainComplex;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|ChainComplex|)))))))))) 

(MAKEPROP '|ChainComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 11)
              |CHAINC;chainComplex;L%;1| |CHAINC;transition_matrices;%L;2|
              (|Integer|) (|Matrix| 10) (0 . |maxRowIndex|) (5 . |maxColIndex|)
              (|Boolean|) (10 . ~=) (|String|) (|OutputForm|) (16 . |message|)
              (21 . |coerce|) (26 . |hconcat|) (|Void|) (|PrintPackage|)
              (32 . |print|) (37 . *) (43 . |zero?|) (48 . |coerce|)
              |CHAINC;validate;%B;3| (|Homology|) (53 . |homologyGroup|)
              (|List| 28) (59 . |concat|) |CHAINC;homology;%L;4| (|List| %)
              (65 . |commaSeparate|) |CHAINC;coerce;%Of;5|)
           '#(~= 70 |validate| 76 |transition_matrices| 81 |latex| 86
              |homology| 91 |coerce| 96 |chainComplex| 101 = 106)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 17) (|BasicType|))
                        (|makeByteWordVec2| 35
                                            '(1 11 10 0 12 1 11 10 0 13 2 10 14
                                              0 0 15 1 17 0 16 18 1 10 17 0 19
                                              2 17 0 0 0 20 1 22 21 17 23 2 11
                                              0 0 0 24 1 11 14 0 25 1 11 17 0
                                              26 2 28 0 11 11 29 2 30 0 0 28 31
                                              1 17 0 33 34 2 0 14 0 0 1 1 0 14
                                              0 27 1 0 7 0 9 1 0 16 0 1 1 0 30
                                              0 32 1 0 17 0 35 1 0 0 7 8 2 0 14
                                              0 0 1)))))
           '|lookupComplete|)) 
