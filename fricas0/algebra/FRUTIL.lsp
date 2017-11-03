
(SDEFUN |FRUTIL;mergeFactors;3F;1|
        ((|f| |Factored| R) (|g| |Factored| R) ($ |Factored| R))
        (SPADCALL
         (SPADCALL (SPADCALL |f| (QREFELT $ 8)) (SPADCALL |g| (QREFELT $ 8))
                   (QREFELT $ 9))
         (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (SPADCALL |g| (QREFELT $ 13))
                   (QREFELT $ 14))
         (QREFELT $ 15))) 

(SDEFUN |FRUTIL;refine;FMF;2|
        ((|f| |Factored| R) (|func| |Mapping| (|Factored| R) R)
         ($ |Factored| R))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| R) (|:| |xpnt| (|Integer|)))))
          (#1=#:G740 NIL) (|v| NIL) (#2=#:G739 NIL) (|u| (R)) (#3=#:G717 NIL)
          (|fitem| (|Factored| R)) (#4=#:G738 NIL) (|item| NIL))
         (SEQ
          (LETT |u| (SPADCALL |f| (QREFELT $ 8)) . #5=(|FRUTIL;refine;FMF;2|))
          (LETT |l| NIL . #5#)
          (SEQ (LETT |item| NIL . #5#)
               (LETT #4# (SPADCALL |f| (QREFELT $ 13)) . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |item| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |fitem| (SPADCALL (QVELT |item| 1) |func|) . #5#)
                    (LETT |u|
                          (SPADCALL |u|
                                    (SPADCALL (SPADCALL |fitem| (QREFELT $ 8))
                                              (PROG1
                                                  (LETT #3# (QVELT |item| 2)
                                                        . #5#)
                                                (|check_subtype2| (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #3#))
                                              (QREFELT $ 18))
                                    (QREFELT $ 9))
                          . #5#)
                    (EXIT
                     (COND
                      ((EQL (QVELT |item| 2) 1)
                       (LETT |l|
                             (SPADCALL (SPADCALL |fitem| (QREFELT $ 13)) |l|
                                       (QREFELT $ 19))
                             . #5#))
                      ('T
                       (LETT |l|
                             (SPADCALL
                              (PROGN
                               (LETT #2# NIL . #5#)
                               (SEQ (LETT |v| NIL . #5#)
                                    (LETT #1# (SPADCALL |fitem| (QREFELT $ 13))
                                          . #5#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |v| (CAR #1#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (VECTOR (QVELT |v| 0)
                                                     (QVELT |v| 1)
                                                     (* (QVELT |v| 2)
                                                        (QVELT |item| 2)))
                                             #2#)
                                            . #5#)))
                                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              |l| (QREFELT $ 19))
                             . #5#)))))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |u| |l| (QREFELT $ 15)))))) 

(DECLAIM (NOTINLINE |FactoredFunctionUtilities;|)) 

(DEFUN |FactoredFunctionUtilities| (#1=#:G741)
  (SPROG NIL
         (PROG (#2=#:G742)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FactoredFunctionUtilities|)
                                               '|domainEqualList|)
                    . #3=(|FactoredFunctionUtilities|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FactoredFunctionUtilities;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FactoredFunctionUtilities|)))))))))) 

(DEFUN |FactoredFunctionUtilities;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FactoredFunctionUtilities|))
          (LETT |dv$| (LIST '|FactoredFunctionUtilities| DV$1) . #1#)
          (LETT $ (GETREFV 22) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FactoredFunctionUtilities|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FactoredFunctionUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Factored| 6)
              (0 . |unit|) (5 . *) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 10) (|:| |fctr| 6) (|:| |xpnt| (|Integer|)))
              (|List| 11) (11 . |factorList|) (16 . |append|) (22 . |makeFR|)
              |FRUTIL;mergeFactors;3F;1| (|NonNegativeInteger|) (28 . ^)
              (34 . |concat|) (|Mapping| 7 6) |FRUTIL;refine;FMF;2|)
           '#(|refine| 40 |mergeFactors| 46) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 21
                                                 '(1 7 6 0 8 2 6 0 0 0 9 1 7 12
                                                   0 13 2 12 0 0 0 14 2 7 0 6
                                                   12 15 2 6 0 0 17 18 2 12 0 0
                                                   0 19 2 0 7 7 20 21 2 0 7 7 7
                                                   16)))))
           '|lookupComplete|)) 
