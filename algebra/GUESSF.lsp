
(DECLAIM (NOTINLINE |GuessFinite;|)) 

(DEFUN |GuessFinite;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|GuessFinite| DV$1))
          (LETT % (GETREFV 31))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Symbol|)))))))
          (|haddProp| |$ConstructorCache| '|GuessFinite| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |GuessFinite| (#1=#:G18)
  (SPROG NIL
         (PROG (#2=#:G19)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GuessFinite|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|GuessFinite;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|GuessFinite|)))))))))) 

(MAKEPROP '|GuessFinite| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|Guess| 6 6 7 (NRTEVAL (ELT % 9)) (NRTEVAL (ELT % 10)))
              (|local| |#1|) (|Expression| (|Integer|))
              (|GuessFiniteFunctions| 6) (0 . EXPRR2F) (5 . F2EXPRR)
              (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| 6))
                         (|UnivariateFormalPowerSeries| 6))
              (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                         (|Integer|) (|Integer|))
              (|Mapping| 12 (|NonNegativeInteger|))
              (|Mapping|
               (|Vector|
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))))
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))))
              (|Mapping| 14 (|List| (|PositiveInteger|)))
              (|Mapping| (|Stream| 7) 7 29)
              (|Mapping| 6 (|NonNegativeInteger|) (|NonNegativeInteger|)
                         (|SparseUnivariatePolynomial| 6))
              (|Mapping|
               (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))
               (|NonNegativeInteger|) (|NonNegativeInteger|)
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))))
              (|Mapping| 7 (|NonNegativeInteger|) 29 7)
              (|Mapping| 24 (|NonNegativeInteger|))
              (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                        (|:| |guessStream| 11) (|:| |guessModGen| 13)
                        (|:| |testGen| 15) (|:| |exprStream| 16)
                        (|:| |kind| 29) (|:| |qvar| 29) (|:| A 17) (|:| AF 18)
                        (|:| AX 19) (|:| C 20))
              (|List| (|GuessOption|)) (|List| 7) (|List| 6) (|List| 24)
              (|Mapping| 23 24 22) (|List| 26) (|List| 29) (|Symbol|)
              (|Mapping| 21 22))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|guess|
                                 ((|List| #1=(|Expression| (|Integer|)))
                                  (|List| |#1|)))
                                T)
                              '((|guess|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guess|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List|
                                   (|Mapping| (|List| #1#) (|List| |#1|)
                                              (|List| (|GuessOption|))))
                                  (|List| (|Symbol|))))
                                T)
                              '((|guess|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List|
                                   (|Mapping| (|List| #1#) (|List| |#1|)
                                              (|List| (|GuessOption|))))
                                  (|List| (|Symbol|))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessExpRat| ((|List| #1#) (|List| |#1|))) T)
                              '((|guessExpRat|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessBinRat| ((|List| #1#) (|List| |#1|))) T)
                              '((|guessBinRat|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessExpRat|
                                 ((|Mapping| (|List| #1#) (|List| |#1|)
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND (|has| 6 (|RetractableTo| 29))
                                     (|has| 6 (|RetractableTo| 29))))
                              '((|guessBinRat|
                                 ((|Mapping| (|List| #1#) (|List| |#1|)
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND (|has| 6 (|RetractableTo| 29))
                                     (|has| 6 (|RetractableTo| 29))))
                              '((|guessAlgDep|
                                 ((|List| #1#) (|List| (|List| |#1|))))
                                T)
                              '((|guessAlgDep|
                                 ((|List| #1#) (|List| (|List| |#1|))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessADE| ((|List| #1#) (|List| |#1|))) T)
                              '((|guessADE|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessFE| ((|List| #1#) (|List| |#1|))) T)
                              '((|guessFE|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessAlg| ((|List| #1#) (|List| |#1|))) T)
                              '((|guessAlg|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessHolo| ((|List| #1#) (|List| |#1|))) T)
                              '((|guessHolo|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPade|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPade| ((|List| #1#) (|List| |#1|))) T)
                              '((|guessRec| ((|List| #1#) (|List| |#1|))) T)
                              '((|guessRec|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPRec|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPRec| ((|List| #1#) (|List| |#1|))) T)
                              '((|guessRat|
                                 ((|List| #1#) (|List| |#1|)
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessRat| ((|List| #1#) (|List| |#1|))) T)
                              '((|algDepHP|
                                 ((|Record|
                                   (|:| |degreeStream|
                                        (|Stream| (|NonNegativeInteger|)))
                                   (|:| |guessStream|
                                        (|Mapping|
                                         (|Stream|
                                          (|UnivariateFormalPowerSeries| |#1|))
                                         (|UnivariateFormalPowerSeries| |#1|)))
                                   (|:| |guessModGen|
                                        (|Mapping|
                                         (|Mapping| (|Vector| (|U32Vector|))
                                                    (|List| (|U32Vector|))
                                                    (|Integer|) (|Integer|))
                                         (|NonNegativeInteger|)))
                                   (|:| |testGen|
                                        (|Mapping|
                                         (|Mapping|
                                          (|Vector|
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             |#1| (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial| |#1|
                                                                           (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping| (|Stream| #1#) #1#
                                                   (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| |#1| (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    |#1|)))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial| |#1|
                                                                         (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial| |#1|
                                                                          (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| #1# (|NonNegativeInteger|)
                                                   (|Symbol|) #1#))
                                   (|:| C
                                        (|Mapping| (|List| |#1|)
                                                   (|NonNegativeInteger|))))
                                  (|List| (|List| |#1|))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|diffHP|
                                 ((|Record|
                                   (|:| |degreeStream|
                                        (|Stream| (|NonNegativeInteger|)))
                                   (|:| |guessStream|
                                        (|Mapping|
                                         (|Stream|
                                          (|UnivariateFormalPowerSeries| |#1|))
                                         (|UnivariateFormalPowerSeries| |#1|)))
                                   (|:| |guessModGen|
                                        (|Mapping|
                                         (|Mapping| (|Vector| (|U32Vector|))
                                                    (|List| (|U32Vector|))
                                                    (|Integer|) (|Integer|))
                                         (|NonNegativeInteger|)))
                                   (|:| |testGen|
                                        (|Mapping|
                                         (|Mapping|
                                          (|Vector|
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             |#1| (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial| |#1|
                                                                           (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping| (|Stream| #1#) #1#
                                                   (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| |#1| (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    |#1|)))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial| |#1|
                                                                         (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial| |#1|
                                                                          (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| #1# (|NonNegativeInteger|)
                                                   (|Symbol|) #1#))
                                   (|:| C
                                        (|Mapping| (|List| |#1|)
                                                   (|NonNegativeInteger|))))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|substHP|
                                 ((|Record|
                                   (|:| |degreeStream|
                                        (|Stream| (|NonNegativeInteger|)))
                                   (|:| |guessStream|
                                        (|Mapping|
                                         (|Stream|
                                          (|UnivariateFormalPowerSeries| |#1|))
                                         (|UnivariateFormalPowerSeries| |#1|)))
                                   (|:| |guessModGen|
                                        (|Mapping|
                                         (|Mapping| (|Vector| (|U32Vector|))
                                                    (|List| (|U32Vector|))
                                                    (|Integer|) (|Integer|))
                                         (|NonNegativeInteger|)))
                                   (|:| |testGen|
                                        (|Mapping|
                                         (|Mapping|
                                          (|Vector|
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             |#1| (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial| |#1|
                                                                           (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping| (|Stream| #1#) #1#
                                                   (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| |#1| (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    |#1|)))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial| |#1|
                                                                         (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial| |#1|
                                                                          (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| #1# (|NonNegativeInteger|)
                                                   (|Symbol|) #1#))
                                   (|:| C
                                        (|Mapping| (|List| |#1|)
                                                   (|NonNegativeInteger|))))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|shiftHP|
                                 ((|Record|
                                   (|:| |degreeStream|
                                        (|Stream| (|NonNegativeInteger|)))
                                   (|:| |guessStream|
                                        (|Mapping|
                                         (|Stream|
                                          (|UnivariateFormalPowerSeries| |#1|))
                                         (|UnivariateFormalPowerSeries| |#1|)))
                                   (|:| |guessModGen|
                                        (|Mapping|
                                         (|Mapping| (|Vector| (|U32Vector|))
                                                    (|List| (|U32Vector|))
                                                    (|Integer|) (|Integer|))
                                         (|NonNegativeInteger|)))
                                   (|:| |testGen|
                                        (|Mapping|
                                         (|Mapping|
                                          (|Vector|
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             |#1| (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial| |#1|
                                                                           (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping| (|Stream| #1#) #1#
                                                   (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| |#1| (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    |#1|)))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial| |#1|
                                                                         (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial| |#1|
                                                                          (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| #1# (|NonNegativeInteger|)
                                                   (|Symbol|) #1#))
                                   (|:| C
                                        (|Mapping| (|List| |#1|)
                                                   (|NonNegativeInteger|))))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|shiftHP|
                                 ((|Mapping|
                                   (|Record|
                                    (|:| |degreeStream|
                                         (|Stream| (|NonNegativeInteger|)))
                                    (|:| |guessStream|
                                         (|Mapping|
                                          (|Stream|
                                           (|UnivariateFormalPowerSeries|
                                            |#1|))
                                          (|UnivariateFormalPowerSeries|
                                           |#1|)))
                                    (|:| |guessModGen|
                                         (|Mapping|
                                          (|Mapping| (|Vector| (|U32Vector|))
                                                     (|List| (|U32Vector|))
                                                     (|Integer|) (|Integer|))
                                          (|NonNegativeInteger|)))
                                    (|:| |testGen|
                                         (|Mapping|
                                          (|Mapping|
                                           (|Vector|
                                            (|UnivariateFormalPowerSeries|
                                             (|SparseMultivariatePolynomial|
                                              |#1| (|NonNegativeInteger|))))
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             |#1| (|NonNegativeInteger|))))
                                          (|List| (|PositiveInteger|))))
                                    (|:| |exprStream|
                                         (|Mapping| (|Stream| #1#) #1#
                                                    (|Symbol|)))
                                    (|:| |kind| (|Symbol|))
                                    (|:| |qvar| (|Symbol|))
                                    (|:| A
                                         (|Mapping| |#1| (|NonNegativeInteger|)
                                                    (|NonNegativeInteger|)
                                                    (|SparseUnivariatePolynomial|
                                                     |#1|)))
                                    (|:| AF
                                         (|Mapping|
                                          (|SparseMultivariatePolynomial| |#1|
                                                                          (|NonNegativeInteger|))
                                          (|NonNegativeInteger|)
                                          (|NonNegativeInteger|)
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial| |#1|
                                                                           (|NonNegativeInteger|)))))
                                    (|:| AX
                                         (|Mapping| #1# (|NonNegativeInteger|)
                                                    (|Symbol|) #1#))
                                    (|:| C
                                         (|Mapping| (|List| |#1|)
                                                    (|NonNegativeInteger|))))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND (|has| 6 (|RetractableTo| 29))
                                     (|has| 6 (|RetractableTo| 29))))
                              '((|diffHP|
                                 ((|Mapping|
                                   (|Record|
                                    (|:| |degreeStream|
                                         (|Stream| (|NonNegativeInteger|)))
                                    (|:| |guessStream|
                                         (|Mapping|
                                          (|Stream|
                                           (|UnivariateFormalPowerSeries|
                                            |#1|))
                                          (|UnivariateFormalPowerSeries|
                                           |#1|)))
                                    (|:| |guessModGen|
                                         (|Mapping|
                                          (|Mapping| (|Vector| (|U32Vector|))
                                                     (|List| (|U32Vector|))
                                                     (|Integer|) (|Integer|))
                                          (|NonNegativeInteger|)))
                                    (|:| |testGen|
                                         (|Mapping|
                                          (|Mapping|
                                           (|Vector|
                                            (|UnivariateFormalPowerSeries|
                                             (|SparseMultivariatePolynomial|
                                              |#1| (|NonNegativeInteger|))))
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             |#1| (|NonNegativeInteger|))))
                                          (|List| (|PositiveInteger|))))
                                    (|:| |exprStream|
                                         (|Mapping| (|Stream| #1#) #1#
                                                    (|Symbol|)))
                                    (|:| |kind| (|Symbol|))
                                    (|:| |qvar| (|Symbol|))
                                    (|:| A
                                         (|Mapping| |#1| (|NonNegativeInteger|)
                                                    (|NonNegativeInteger|)
                                                    (|SparseUnivariatePolynomial|
                                                     |#1|)))
                                    (|:| AF
                                         (|Mapping|
                                          (|SparseMultivariatePolynomial| |#1|
                                                                          (|NonNegativeInteger|))
                                          (|NonNegativeInteger|)
                                          (|NonNegativeInteger|)
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial| |#1|
                                                                           (|NonNegativeInteger|)))))
                                    (|:| AX
                                         (|Mapping| #1# (|NonNegativeInteger|)
                                                    (|Symbol|) #1#))
                                    (|:| C
                                         (|Mapping| (|List| |#1|)
                                                    (|NonNegativeInteger|))))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND (|has| 6 (|RetractableTo| 29))
                                     (|has| 6 (|RetractableTo| 29))))
                              '((|guessRec|
                                 ((|Mapping| (|List| #1#) (|List| |#1|)
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND (|has| 6 (|RetractableTo| 29))
                                     (|has| 6 (|RetractableTo| 29))))
                              '((|guessPRec|
                                 ((|Mapping| (|List| #1#) (|List| |#1|)
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND (|has| 6 (|RetractableTo| 29))
                                     (|has| 6 (|RetractableTo| 29))))
                              '((|guessRat|
                                 ((|Mapping| (|List| #1#) (|List| |#1|)
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND (|has| 6 (|RetractableTo| 29))
                                     (|has| 6 (|RetractableTo| 29))))
                              '((|guessADE|
                                 ((|Mapping| (|List| #1#) (|List| |#1|)
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND (|has| 6 (|RetractableTo| 29))
                                     (|has| 6 (|RetractableTo| 29))))
                              '((|guessHolo|
                                 ((|Mapping| (|List| #1#) (|List| |#1|)
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND (|has| 6 (|RetractableTo| 29))
                                     (|has| 6 (|RetractableTo| 29)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 10 '(1 8 6 7 9 1 8 7 6 10)))))
           '|lookupIncomplete|)) 
