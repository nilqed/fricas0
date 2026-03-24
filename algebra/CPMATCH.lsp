
(SDEFUN |CPMATCH;makeComplex| ((|p| (|Polynomial| S)) (% (CS)))
        (SPROG
         ((|rcoef| (S)) (|icoef| (S)) (|up| (|SparseUnivariatePolynomial| S)))
         (SEQ (LETT |up| (SPADCALL |p| (QREFELT % 14)))
              (EXIT
               (COND
                ((> (SPADCALL |up| (QREFELT % 16)) 1)
                 (|error| "not linear in %i"))
                ('T
                 (SEQ (LETT |icoef| (SPADCALL |up| (QREFELT % 17)))
                      (LETT |rcoef|
                            (SPADCALL (SPADCALL |p| (QREFELT % 18))
                                      (QREFELT % 19)))
                      (EXIT (SPADCALL |rcoef| |icoef| (QREFELT % 20)))))))))) 

(SDEFUN |CPMATCH;makePoly| ((|cs| (CS)) (% (|Polynomial| S)))
        (SPADCALL (SPADCALL (SPADCALL |cs| (QREFELT % 21)) (QREFELT % 22))
                  (SPADCALL (SPADCALL |cs| (QREFELT % 23)) (QREFELT % 12)
                            (QREFELT % 24))
                  (QREFELT % 25))) 

(SDEFUN |CPMATCH;patternMatch;CSP2Pmr;3|
        ((|cs| (CS)) (|pat| (|Pattern| R))
         (|result| (|PatternMatchResult| R CS))
         (% (|PatternMatchResult| R CS)))
        (COND
         ((SPADCALL (SPADCALL |cs| (QREFELT % 23)) (QREFELT % 27))
          (SPADCALL (SPADCALL |cs| (QREFELT % 21)) |pat| |result|
                    (QREFELT % 31)))
         ('T
          (SPADCALL (CONS (|function| |CPMATCH;makeComplex|) %)
                    (SPADCALL (|CPMATCH;makePoly| |cs| %) |pat|
                              (SPADCALL
                               (CONS (|function| |CPMATCH;makePoly|) %)
                               |result| (QREFELT % 35))
                              (QREFELT % 37))
                    (QREFELT % 40))))) 

(DECLAIM (NOTINLINE |ComplexPatternMatch;|)) 

(DEFUN |ComplexPatternMatch;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|ComplexPatternMatch| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 42))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|Polynomial| |#2|)
                                               (LIST '|PatternMatchable|
                                                     (|devaluate| |#1|)))))))
          (|haddProp| |$ConstructorCache| '|ComplexPatternMatch|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 12 (SPADCALL '|%i| (QREFELT % 11)))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 41
                      (CONS
                       (|dispatchFunction| |CPMATCH;patternMatch;CSP2Pmr;3|)
                       %))))
          %))) 

(DEFUN |ComplexPatternMatch| (&REST #1=#:G10)
  (SPROG NIL
         (PROG (#2=#:G11)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ComplexPatternMatch|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ComplexPatternMatch;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ComplexPatternMatch|)))))))))) 

(MAKEPROP '|ComplexPatternMatch| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (|Polynomial| 7) (0 . |coerce|) '|ivar|
              (|SparseUnivariatePolynomial| 7) (5 . |univariate|)
              (|NonNegativeInteger|) (10 . |degree|)
              (15 . |leadingCoefficient|) (20 . |reductum|)
              (25 . |leadingCoefficient|) (30 . |complex|) (36 . |real|)
              (41 . |coerce|) (46 . |imag|) (51 . *) (57 . +) (|Boolean|)
              (63 . |zero?|) (|PatternMatchResult| 6 8) (|Pattern| 6)
              (|PatternMatchPushDown| 6 7 8) (68 . |patternMatch|)
              (|PatternMatchResult| 6 10) (|Mapping| 10 8)
              (|PatternMatchResultFunctions2| 6 8 10) (75 . |map|)
              (|PatternMatchResult| 6 %) (81 . |patternMatch|) (|Mapping| 8 10)
              (|PatternMatchResultFunctions2| 6 10 8) (88 . |map|)
              (94 . |patternMatch|))
           '#(|patternMatch| 101) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|patternMatch|
                                 ((|PatternMatchResult| |#1| |#3|) |#3|
                                  (|Pattern| |#1|)
                                  (|PatternMatchResult| |#1| |#3|)))
                                (|has| (|Polynomial| 7)
                                       (|PatternMatchable| 6))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 41
                                            '(1 10 0 9 11 1 10 13 0 14 1 13 15
                                              0 16 1 13 7 0 17 1 10 0 0 18 1 10
                                              7 0 19 2 8 0 7 7 20 1 8 7 0 21 1
                                              10 0 7 22 1 8 7 0 23 2 10 0 7 0
                                              24 2 10 0 0 0 25 1 7 26 0 27 3 30
                                              28 7 29 28 31 2 34 32 33 28 35 3
                                              10 36 0 29 36 37 2 39 28 38 32 40
                                              3 0 28 8 29 28 41 3 1 28 8 29 28
                                              41)))))
           '|lookupComplete|)) 
