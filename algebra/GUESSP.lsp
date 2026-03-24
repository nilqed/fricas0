
(DECLAIM (NOTINLINE |GuessPolynomial;|)) 

(DEFUN |GuessPolynomial;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|GuessPolynomial| DV$1))
          (LETT % (GETREFV 32))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
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
                                                  (|Symbol|))))))))
          (|haddProp| |$ConstructorCache| '|GuessPolynomial| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |GuessPolynomial| (#1=#:G18)
  (SPROG NIL
         (PROG (#2=#:G19)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GuessPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|GuessPolynomial;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GuessPolynomial|)))))))))) 

(MAKEPROP '|GuessPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|Guess| 7 (|Polynomial| 6) 8 (NRTEVAL (ELT % 10))
                       (NRTEVAL (ELT % 11)))
              (|local| |#1|) (|Fraction| (|Polynomial| 6))
              (|Expression| (|Integer|)) (|GuessPolynomialFunctions| 6)
              (0 . EXPRR2F) (5 . F2EXPRR)
              (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| 7))
                         (|UnivariateFormalPowerSeries| 7))
              (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                         (|Integer|) (|Integer|))
              (|Mapping| 13 (|NonNegativeInteger|))
              (|Mapping|
               (|Vector|
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| 7 (|NonNegativeInteger|))))
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial| 7 (|NonNegativeInteger|))))
              (|Mapping| 15 (|List| (|PositiveInteger|)))
              (|Mapping| (|Stream| 8) 8 30)
              (|Mapping| (|Polynomial| 6) (|NonNegativeInteger|)
                         (|NonNegativeInteger|)
                         (|SparseUnivariatePolynomial| (|Polynomial| 6)))
              (|Mapping|
               (|SparseMultivariatePolynomial| 7 (|NonNegativeInteger|))
               (|NonNegativeInteger|) (|NonNegativeInteger|)
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial| 7 (|NonNegativeInteger|))))
              (|Mapping| 8 (|NonNegativeInteger|) 30 8)
              (|Mapping| (|List| (|Polynomial| 6)) (|NonNegativeInteger|))
              (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                        (|:| |guessStream| 12) (|:| |guessModGen| 14)
                        (|:| |testGen| 16) (|:| |exprStream| 17)
                        (|:| |kind| 30) (|:| |qvar| 30) (|:| A 18) (|:| AF 19)
                        (|:| AX 20) (|:| C 21))
              (|List| (|GuessOption|)) (|List| 8) (|List| 7) (|List| 25)
              (|Mapping| 24 25 23) (|List| 27) (|List| 30) (|Symbol|)
              (|Mapping| 22 23))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|guess|
                                 ((|List| #1=(|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|guess|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guess|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List|
                                   (|Mapping| (|List| #1#)
                                              (|List|
                                               (|Fraction|
                                                (|Polynomial| |#1|)))
                                              (|List| (|GuessOption|))))
                                  (|List| (|Symbol|))))
                                T)
                              '((|guess|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List|
                                   (|Mapping| (|List| #1#)
                                              (|List|
                                               (|Fraction|
                                                (|Polynomial| |#1|)))
                                              (|List| (|GuessOption|))))
                                  (|List| (|Symbol|))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessExpRat|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|guessExpRat|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessBinRat|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|guessBinRat|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessExpRat|
                                 ((|Mapping| (|List| #1#)
                                             (|List|
                                              (|Fraction| (|Polynomial| |#1|)))
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| 6) (|RetractableTo| 30))
                                 (|has| (|Fraction| (|Polynomial| 6))
                                        (|RetractableTo| 30))))
                              '((|guessBinRat|
                                 ((|Mapping| (|List| #1#)
                                             (|List|
                                              (|Fraction| (|Polynomial| |#1|)))
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| 6) (|RetractableTo| 30))
                                 (|has| (|Fraction| (|Polynomial| 6))
                                        (|RetractableTo| 30))))
                              '((|guessAlgDep|
                                 ((|List| #1#)
                                  (|List|
                                   (|List| (|Fraction| (|Polynomial| |#1|))))))
                                T)
                              '((|guessAlgDep|
                                 ((|List| #1#)
                                  (|List|
                                   (|List| (|Fraction| (|Polynomial| |#1|))))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessADE|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|guessADE|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessFE|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|guessFE|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessAlg|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|guessAlg|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessHolo|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|guessHolo|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPade|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPade|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|guessRec|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|guessRec|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPRec|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPRec|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|guessRat|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessRat|
                                 ((|List| #1#)
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|algDepHP|
                                 ((|Record|
                                   (|:| |degreeStream|
                                        (|Stream| (|NonNegativeInteger|)))
                                   (|:| |guessStream|
                                        (|Mapping|
                                         (|Stream|
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| |#1|))))
                                         (|UnivariateFormalPowerSeries|
                                          (|Fraction| (|Polynomial| |#1|)))))
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
                                             (|Fraction| (|Polynomial| |#1|))
                                             (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| |#1|))
                                            (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping| (|Stream| #1#) #1#
                                                   (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| (|Polynomial| |#1|)
                                                   (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    (|Polynomial| |#1|))))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial|
                                          (|Fraction| (|Polynomial| |#1|))
                                          (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| |#1|))
                                           (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| #1# (|NonNegativeInteger|)
                                                   (|Symbol|) #1#))
                                   (|:| C
                                        (|Mapping| (|List| (|Polynomial| |#1|))
                                                   (|NonNegativeInteger|))))
                                  (|List|
                                   (|List| (|Fraction| (|Polynomial| |#1|))))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|diffHP|
                                 ((|Record|
                                   (|:| |degreeStream|
                                        (|Stream| (|NonNegativeInteger|)))
                                   (|:| |guessStream|
                                        (|Mapping|
                                         (|Stream|
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| |#1|))))
                                         (|UnivariateFormalPowerSeries|
                                          (|Fraction| (|Polynomial| |#1|)))))
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
                                             (|Fraction| (|Polynomial| |#1|))
                                             (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| |#1|))
                                            (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping| (|Stream| #1#) #1#
                                                   (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| (|Polynomial| |#1|)
                                                   (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    (|Polynomial| |#1|))))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial|
                                          (|Fraction| (|Polynomial| |#1|))
                                          (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| |#1|))
                                           (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| #1# (|NonNegativeInteger|)
                                                   (|Symbol|) #1#))
                                   (|:| C
                                        (|Mapping| (|List| (|Polynomial| |#1|))
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
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| |#1|))))
                                         (|UnivariateFormalPowerSeries|
                                          (|Fraction| (|Polynomial| |#1|)))))
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
                                             (|Fraction| (|Polynomial| |#1|))
                                             (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| |#1|))
                                            (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping| (|Stream| #1#) #1#
                                                   (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| (|Polynomial| |#1|)
                                                   (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    (|Polynomial| |#1|))))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial|
                                          (|Fraction| (|Polynomial| |#1|))
                                          (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| |#1|))
                                           (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| #1# (|NonNegativeInteger|)
                                                   (|Symbol|) #1#))
                                   (|:| C
                                        (|Mapping| (|List| (|Polynomial| |#1|))
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
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| |#1|))))
                                         (|UnivariateFormalPowerSeries|
                                          (|Fraction| (|Polynomial| |#1|)))))
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
                                             (|Fraction| (|Polynomial| |#1|))
                                             (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| |#1|))
                                            (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping| (|Stream| #1#) #1#
                                                   (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| (|Polynomial| |#1|)
                                                   (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    (|Polynomial| |#1|))))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial|
                                          (|Fraction| (|Polynomial| |#1|))
                                          (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| |#1|))
                                           (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| #1# (|NonNegativeInteger|)
                                                   (|Symbol|) #1#))
                                   (|:| C
                                        (|Mapping| (|List| (|Polynomial| |#1|))
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
                                            (|Fraction| (|Polynomial| |#1|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| |#1|)))))
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
                                              (|Fraction| (|Polynomial| |#1|))
                                              (|NonNegativeInteger|))))
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             (|Fraction| (|Polynomial| |#1|))
                                             (|NonNegativeInteger|))))
                                          (|List| (|PositiveInteger|))))
                                    (|:| |exprStream|
                                         (|Mapping| (|Stream| #1#) #1#
                                                    (|Symbol|)))
                                    (|:| |kind| (|Symbol|))
                                    (|:| |qvar| (|Symbol|))
                                    (|:| A
                                         (|Mapping| (|Polynomial| |#1|)
                                                    (|NonNegativeInteger|)
                                                    (|NonNegativeInteger|)
                                                    (|SparseUnivariatePolynomial|
                                                     (|Polynomial| |#1|))))
                                    (|:| AF
                                         (|Mapping|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| |#1|))
                                           (|NonNegativeInteger|))
                                          (|NonNegativeInteger|)
                                          (|NonNegativeInteger|)
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| |#1|))
                                            (|NonNegativeInteger|)))))
                                    (|:| AX
                                         (|Mapping| #1# (|NonNegativeInteger|)
                                                    (|Symbol|) #1#))
                                    (|:| C
                                         (|Mapping|
                                          (|List| (|Polynomial| |#1|))
                                          (|NonNegativeInteger|))))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| 6) (|RetractableTo| 30))
                                 (|has| (|Fraction| (|Polynomial| 6))
                                        (|RetractableTo| 30))))
                              '((|diffHP|
                                 ((|Mapping|
                                   (|Record|
                                    (|:| |degreeStream|
                                         (|Stream| (|NonNegativeInteger|)))
                                    (|:| |guessStream|
                                         (|Mapping|
                                          (|Stream|
                                           (|UnivariateFormalPowerSeries|
                                            (|Fraction| (|Polynomial| |#1|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| |#1|)))))
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
                                              (|Fraction| (|Polynomial| |#1|))
                                              (|NonNegativeInteger|))))
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             (|Fraction| (|Polynomial| |#1|))
                                             (|NonNegativeInteger|))))
                                          (|List| (|PositiveInteger|))))
                                    (|:| |exprStream|
                                         (|Mapping| (|Stream| #1#) #1#
                                                    (|Symbol|)))
                                    (|:| |kind| (|Symbol|))
                                    (|:| |qvar| (|Symbol|))
                                    (|:| A
                                         (|Mapping| (|Polynomial| |#1|)
                                                    (|NonNegativeInteger|)
                                                    (|NonNegativeInteger|)
                                                    (|SparseUnivariatePolynomial|
                                                     (|Polynomial| |#1|))))
                                    (|:| AF
                                         (|Mapping|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| |#1|))
                                           (|NonNegativeInteger|))
                                          (|NonNegativeInteger|)
                                          (|NonNegativeInteger|)
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| |#1|))
                                            (|NonNegativeInteger|)))))
                                    (|:| AX
                                         (|Mapping| #1# (|NonNegativeInteger|)
                                                    (|Symbol|) #1#))
                                    (|:| C
                                         (|Mapping|
                                          (|List| (|Polynomial| |#1|))
                                          (|NonNegativeInteger|))))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| 6) (|RetractableTo| 30))
                                 (|has| (|Fraction| (|Polynomial| 6))
                                        (|RetractableTo| 30))))
                              '((|guessRec|
                                 ((|Mapping| (|List| #1#)
                                             (|List|
                                              (|Fraction| (|Polynomial| |#1|)))
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| 6) (|RetractableTo| 30))
                                 (|has| (|Fraction| (|Polynomial| 6))
                                        (|RetractableTo| 30))))
                              '((|guessPRec|
                                 ((|Mapping| (|List| #1#)
                                             (|List|
                                              (|Fraction| (|Polynomial| |#1|)))
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| 6) (|RetractableTo| 30))
                                 (|has| (|Fraction| (|Polynomial| 6))
                                        (|RetractableTo| 30))))
                              '((|guessRat|
                                 ((|Mapping| (|List| #1#)
                                             (|List|
                                              (|Fraction| (|Polynomial| |#1|)))
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| 6) (|RetractableTo| 30))
                                 (|has| (|Fraction| (|Polynomial| 6))
                                        (|RetractableTo| 30))))
                              '((|guessADE|
                                 ((|Mapping| (|List| #1#)
                                             (|List|
                                              (|Fraction| (|Polynomial| |#1|)))
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| 6) (|RetractableTo| 30))
                                 (|has| (|Fraction| (|Polynomial| 6))
                                        (|RetractableTo| 30))))
                              '((|guessHolo|
                                 ((|Mapping| (|List| #1#)
                                             (|List|
                                              (|Fraction| (|Polynomial| |#1|)))
                                             (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| 6) (|RetractableTo| 30))
                                 (|has| (|Fraction| (|Polynomial| 6))
                                        (|RetractableTo| 30)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 11 '(1 9 7 8 10 1 9 8 7 11)))))
           '|lookupIncomplete|)) 
