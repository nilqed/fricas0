
(DECLAIM (NOTINLINE |GuessFinite;|)) 

(DEFUN |GuessFinite| (#1=#:G715)
  (SPROG NIL
         (PROG (#2=#:G716)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GuessFinite|)
                                               '|domainEqualList|)
                    . #3=(|GuessFinite|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|GuessFinite;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|GuessFinite|)))))))))) 

(DEFUN |GuessFinite;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GuessFinite|))
          (LETT |dv$| (LIST '|GuessFinite| DV$1) . #1#)
          (LETT $ (GETREFV 31) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Symbol|)))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|GuessFinite| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GuessFinite| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|Guess| 6 6 7 (NRTEVAL (ELT $ 9)) (NRTEVAL (ELT $ 10)))
              (|local| |#1|) (|Expression| (|Integer|))
              (|GuessFiniteFunctions| 6) (0 . EXPRR2F) (5 . F2EXPRR)
              (|Mapping| 25 26 27) (|Symbol|)
              (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| 6))
                         (|UnivariateFormalPowerSeries| 6))
              (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                         (|Integer|) (|Integer|))
              (|Mapping| 14 (|NonNegativeInteger|))
              (|Mapping|
               (|Vector|
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))))
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))))
              (|Mapping| 16 (|List| (|PositiveInteger|)))
              (|Mapping| (|Stream| 7) 7 12)
              (|Mapping| 6 (|NonNegativeInteger|) (|NonNegativeInteger|)
                         (|SparseUnivariatePolynomial| 6))
              (|Mapping|
               (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))
               (|NonNegativeInteger|) (|NonNegativeInteger|)
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))))
              (|Mapping| 7 (|NonNegativeInteger|) 12 7)
              (|Mapping| 26 (|NonNegativeInteger|))
              (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                        (|:| |guessStream| 13) (|:| |guessModGen| 15)
                        (|:| |testGen| 17) (|:| |exprStream| 18)
                        (|:| |kind| 12) (|:| |qvar| 12) (|:| A 19) (|:| AF 20)
                        (|:| AX 21) (|:| C 22))
              (|Mapping| 23 27) (|List| 7) (|List| 6) (|List| (|GuessOption|))
              (|List| 11) (|List| 12) (|List| 26))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10 '(1 8 6 7 9 1 8 7 6 10)))))
           '|lookupIncomplete|)) 
