
(DECLAIM (NOTINLINE |GuessPolynomial;|)) 

(DEFUN |GuessPolynomial| (#1=#:G721)
  (SPROG NIL
         (PROG (#2=#:G722)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GuessPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|GuessPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|GuessPolynomial;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GuessPolynomial|)))))))))) 

(DEFUN |GuessPolynomial;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GuessPolynomial|))
          (LETT |dv$| (LIST '|GuessPolynomial| DV$1) . #1#)
          (LETT $ (GETREFV 32) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory|
                                                (|Fraction|
                                                 (|Polynomial| |#1|))
                                                '(|RetractableTo| (|Symbol|)))
                                               (|HasCategory|
                                                (|Polynomial| |#1|)
                                                '(|RetractableTo|
                                                  (|Symbol|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|GuessPolynomial| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GuessPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|Guess| 7 (|Polynomial| 6) 8 (NRTEVAL (ELT $ 10))
                       (NRTEVAL (ELT $ 11)))
              (|local| |#1|) (|Fraction| (|Polynomial| 6))
              (|Expression| (|Integer|)) (|GuessPolynomialFunctions| 6)
              (0 . EXPRR2F) (5 . F2EXPRR) (|Mapping| 26 27 28) (|Symbol|)
              (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| 7))
                         (|UnivariateFormalPowerSeries| 7))
              (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                         (|Integer|) (|Integer|))
              (|Mapping| 15 (|NonNegativeInteger|))
              (|Mapping|
               (|Vector|
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| 7 (|NonNegativeInteger|))))
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial| 7 (|NonNegativeInteger|))))
              (|Mapping| 17 (|List| (|PositiveInteger|)))
              (|Mapping| (|Stream| 8) 8 13)
              (|Mapping| (|Polynomial| 6) (|NonNegativeInteger|)
                         (|NonNegativeInteger|)
                         (|SparseUnivariatePolynomial| (|Polynomial| 6)))
              (|Mapping|
               (|SparseMultivariatePolynomial| 7 (|NonNegativeInteger|))
               (|NonNegativeInteger|) (|NonNegativeInteger|)
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial| 7 (|NonNegativeInteger|))))
              (|Mapping| 8 (|NonNegativeInteger|) 13 8)
              (|Mapping| (|List| (|Polynomial| 6)) (|NonNegativeInteger|))
              (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                        (|:| |guessStream| 14) (|:| |guessModGen| 16)
                        (|:| |testGen| 18) (|:| |exprStream| 19)
                        (|:| |kind| 13) (|:| |qvar| 13) (|:| A 20) (|:| AF 21)
                        (|:| AX 22) (|:| C 23))
              (|Mapping| 24 28) (|List| 8) (|List| 7) (|List| (|GuessOption|))
              (|List| 12) (|List| 13) (|List| 27))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 11
                                                 '(1 9 7 8 10 1 9 8 7 11)))))
           '|lookupIncomplete|)) 
