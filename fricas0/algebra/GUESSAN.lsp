
(DECLAIM (NOTINLINE |GuessAlgebraicNumber;|)) 

(DEFUN |GuessAlgebraicNumber| ()
  (SPROG NIL
         (PROG (#1=#:G717)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GuessAlgebraicNumber|)
                    . #2=(|GuessAlgebraicNumber|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GuessAlgebraicNumber|
                             (LIST
                              (CONS NIL (CONS 1 (|GuessAlgebraicNumber;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|GuessAlgebraicNumber|)))))))))) 

(DEFUN |GuessAlgebraicNumber;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GuessAlgebraicNumber|) . #1=(|GuessAlgebraicNumber|))
          (LETT $ (GETREFV 30) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|AlgebraicNumber|)
                                               '(|RetractableTo| (|Symbol|)))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|GuessAlgebraicNumber| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GuessAlgebraicNumber| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|Guess| 6 6 7 (NRTEVAL (ELT $ 8)) (NRTEVAL (ELT $ 9)))
              (|AlgebraicNumber|) (|Expression| (|Integer|)) (0 . |retract|)
              (5 . |coerce|) (|Mapping| 24 25 26) (|Symbol|)
              (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| 6))
                         (|UnivariateFormalPowerSeries| 6))
              (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                         (|Integer|) (|Integer|))
              (|Mapping| 13 (|NonNegativeInteger|))
              (|Mapping|
               (|Vector|
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))))
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))))
              (|Mapping| 15 (|List| (|PositiveInteger|)))
              (|Mapping| (|Stream| 7) 7 11)
              (|Mapping| 6 (|NonNegativeInteger|) (|NonNegativeInteger|)
                         (|SparseUnivariatePolynomial| 6))
              (|Mapping|
               (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))
               (|NonNegativeInteger|) (|NonNegativeInteger|)
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))))
              (|Mapping| 7 (|NonNegativeInteger|) 11 7)
              (|Mapping| 25 (|NonNegativeInteger|))
              (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                        (|:| |guessStream| 12) (|:| |guessModGen| 14)
                        (|:| |testGen| 16) (|:| |exprStream| 17)
                        (|:| |kind| 11) (|:| |qvar| 11) (|:| A 18) (|:| AF 19)
                        (|:| AX 20) (|:| C 21))
              (|Mapping| 22 26) (|List| 7) (|List| 6) (|List| (|GuessOption|))
              (|List| 10) (|List| 11) (|List| 25))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 9 '(1 7 6 0 8 1 7 0 6 9)))))
           '|lookupIncomplete|)) 

(MAKEPROP '|GuessAlgebraicNumber| 'NILADIC T) 
