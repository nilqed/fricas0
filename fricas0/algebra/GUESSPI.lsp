
(DECLAIM (NOTINLINE |GuessPolynomialInteger;|)) 

(DEFUN |GuessPolynomialInteger| ()
  (SPROG NIL
         (PROG (#1=#:G720)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GuessPolynomialInteger|)
                    . #2=(|GuessPolynomialInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GuessPolynomialInteger|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|GuessPolynomialInteger;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|GuessPolynomialInteger|)))))))))) 

(DEFUN |GuessPolynomialInteger;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GuessPolynomialInteger|)
                . #1=(|GuessPolynomialInteger|))
          (LETT $ (GETREFV 26) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))
                                                '(|RetractableTo| (|Symbol|)))
                                               (|HasCategory|
                                                (|Polynomial| (|Integer|))
                                                '(|RetractableTo|
                                                  (|Symbol|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|GuessPolynomialInteger| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GuessPolynomialInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|GuessPolynomial| (|Integer|))
              (|Mapping| 20 21 22) (|Symbol|)
              (|Mapping|
               (|Stream|
                (|UnivariateFormalPowerSeries|
                 (|Fraction| (|Polynomial| (|Integer|)))))
               (|UnivariateFormalPowerSeries|
                (|Fraction| (|Polynomial| (|Integer|)))))
              (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                         (|Integer|) (|Integer|))
              (|Mapping| 9 (|NonNegativeInteger|))
              (|Mapping|
               (|Vector|
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial|
                  (|Fraction| (|Polynomial| (|Integer|)))
                  (|NonNegativeInteger|))))
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial|
                 (|Fraction| (|Polynomial| (|Integer|)))
                 (|NonNegativeInteger|))))
              (|Mapping| 11 (|List| (|PositiveInteger|)))
              (|Mapping| (|Stream| (|Expression| (|Integer|)))
                         (|Expression| (|Integer|)) 7)
              (|Mapping| (|Polynomial| (|Integer|)) (|NonNegativeInteger|)
                         (|NonNegativeInteger|)
                         (|SparseUnivariatePolynomial|
                          (|Polynomial| (|Integer|))))
              (|Mapping|
               (|SparseMultivariatePolynomial|
                (|Fraction| (|Polynomial| (|Integer|))) (|NonNegativeInteger|))
               (|NonNegativeInteger|) (|NonNegativeInteger|)
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial|
                 (|Fraction| (|Polynomial| (|Integer|)))
                 (|NonNegativeInteger|))))
              (|Mapping| (|Expression| (|Integer|)) (|NonNegativeInteger|) 7
                         (|Expression| (|Integer|)))
              (|Mapping| (|List| (|Polynomial| (|Integer|)))
                         (|NonNegativeInteger|))
              (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                        (|:| |guessStream| 8) (|:| |guessModGen| 10)
                        (|:| |testGen| 12) (|:| |exprStream| 13) (|:| |kind| 7)
                        (|:| |qvar| 7) (|:| A 14) (|:| AF 15) (|:| AX 16)
                        (|:| C 17))
              (|Mapping| 18 22) (|List| (|Expression| (|Integer|)))
              (|List| (|Fraction| (|Polynomial| (|Integer|))))
              (|List| (|GuessOption|)) (|List| 6) (|List| 7) (|List| 21))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#() (CONS '#() (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 

(MAKEPROP '|GuessPolynomialInteger| 'NILADIC T) 
