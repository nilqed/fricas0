
(SDEFUN |CPMATCH;makeComplex| ((|p| |Polynomial| S) ($ CS))
        (SPROG
         ((|rcoef| (S)) (|icoef| (S)) (|up| (|SparseUnivariatePolynomial| S)))
         (SEQ
          (LETT |up| (SPADCALL |p| (QREFELT $ 14))
                . #1=(|CPMATCH;makeComplex|))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |up| (QREFELT $ 16)) 1 (QREFELT $ 19))
             (|error| "not linear in %i"))
            ('T
             (SEQ (LETT |icoef| (SPADCALL |up| (QREFELT $ 20)) . #1#)
                  (LETT |rcoef|
                        (SPADCALL (SPADCALL |p| (QREFELT $ 21)) (QREFELT $ 22))
                        . #1#)
                  (EXIT (SPADCALL |rcoef| |icoef| (QREFELT $ 23)))))))))) 

(SDEFUN |CPMATCH;makePoly| ((|cs| CS) ($ |Polynomial| S))
        (SPADCALL (SPADCALL (SPADCALL |cs| (QREFELT $ 24)) (QREFELT $ 25))
                  (SPADCALL (SPADCALL |cs| (QREFELT $ 26)) (QREFELT $ 12)
                            (QREFELT $ 27))
                  (QREFELT $ 28))) 

(SDEFUN |CPMATCH;patternMatch;CSP2Pmr;3|
        ((|cs| CS) (|pat| |Pattern| R) (|result| |PatternMatchResult| R CS)
         ($ |PatternMatchResult| R CS))
        (COND
         ((SPADCALL (SPADCALL |cs| (QREFELT $ 26)) (QREFELT $ 29))
          (SPADCALL (SPADCALL |cs| (QREFELT $ 24)) |pat| |result|
                    (QREFELT $ 33)))
         ('T
          (SPADCALL (CONS (|function| |CPMATCH;makeComplex|) $)
                    (SPADCALL (|CPMATCH;makePoly| |cs| $) |pat|
                              (SPADCALL
                               (CONS (|function| |CPMATCH;makePoly|) $)
                               |result| (QREFELT $ 37))
                              (QREFELT $ 39))
                    (QREFELT $ 42))))) 

(DECLAIM (NOTINLINE |ComplexPatternMatch;|)) 

(DEFUN |ComplexPatternMatch| (&REST #1=#:G710)
  (SPROG NIL
         (PROG (#2=#:G711)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ComplexPatternMatch|)
                                               '|domainEqualList|)
                    . #3=(|ComplexPatternMatch|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ComplexPatternMatch;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ComplexPatternMatch|)))))))))) 

(DEFUN |ComplexPatternMatch;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ComplexPatternMatch|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|ComplexPatternMatch| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 44) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|Polynomial| |#2|)
                                               (LIST '|PatternMatchable|
                                                     (|devaluate| |#1|)))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|ComplexPatternMatch|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 12 (SPADCALL '|%i| (QREFELT $ 11)))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 43
                      (CONS
                       (|dispatchFunction| |CPMATCH;patternMatch;CSP2Pmr;3|)
                       $))))
          $))) 

(MAKEPROP '|ComplexPatternMatch| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (|Polynomial| 7) (0 . |coerce|) '|ivar|
              (|SparseUnivariatePolynomial| 7) (5 . |univariate|)
              (|NonNegativeInteger|) (10 . |degree|) (15 . |One|) (|Boolean|)
              (19 . >) (25 . |leadingCoefficient|) (30 . |reductum|)
              (35 . |leadingCoefficient|) (40 . |complex|) (46 . |real|)
              (51 . |coerce|) (56 . |imag|) (61 . *) (67 . +) (73 . |zero?|)
              (|PatternMatchResult| 6 8) (|Pattern| 6)
              (|PatternMatchPushDown| 6 7 8) (78 . |patternMatch|)
              (|PatternMatchResult| 6 10) (|Mapping| 10 8)
              (|PatternMatchResultFunctions2| 6 8 10) (85 . |map|)
              (|PatternMatchResult| 6 $) (91 . |patternMatch|) (|Mapping| 8 10)
              (|PatternMatchResultFunctions2| 6 10 8) (98 . |map|)
              (104 . |patternMatch|))
           '#(|patternMatch| 111) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 43
                                                 '(1 10 0 9 11 1 10 13 0 14 1
                                                   13 15 0 16 0 7 0 17 2 15 18
                                                   0 0 19 1 13 7 0 20 1 10 0 0
                                                   21 1 10 7 0 22 2 8 0 7 7 23
                                                   1 8 7 0 24 1 10 0 7 25 1 8 7
                                                   0 26 2 10 0 7 0 27 2 10 0 0
                                                   0 28 1 7 18 0 29 3 32 30 7
                                                   31 30 33 2 36 34 35 30 37 3
                                                   10 38 0 31 38 39 2 41 30 40
                                                   34 42 3 0 30 8 31 30 43 3 1
                                                   30 8 31 30 43)))))
           '|lookupComplete|)) 
