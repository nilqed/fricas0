
(DECLAIM (NOTINLINE |GuessInteger;|)) 

(DEFUN |GuessInteger| ()
  (SPROG NIL
         (PROG (#1=#:G721)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GuessInteger|)
                    . #2=(|GuessInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GuessInteger|
                             (LIST (CONS NIL (CONS 1 (|GuessInteger;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|GuessInteger|)))))))))) 

(DEFUN |GuessInteger;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GuessInteger|) . #1=(|GuessInteger|))
          (LETT $ (GETREFV 30) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory|
                                                (|Fraction| (|Integer|))
                                                '(|RetractableTo| (|Symbol|)))
                                               (|HasCategory| (|Integer|)
                                                              '(|RetractableTo|
                                                                (|Symbol|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|GuessInteger| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GuessInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|Guess| 6 (|Integer|) 7 (NRTEVAL (ELT $ 8)) (NRTEVAL (ELT $ 9)))
              (|Fraction| (|Integer|)) (|Expression| (|Integer|))
              (0 . |retract|) (5 . |coerce|) (|Mapping| 24 25 26) (|Symbol|)
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
              (|Mapping| (|Integer|) (|NonNegativeInteger|)
                         (|NonNegativeInteger|)
                         (|SparseUnivariatePolynomial| (|Integer|)))
              (|Mapping|
               (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))
               (|NonNegativeInteger|) (|NonNegativeInteger|)
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial| 6 (|NonNegativeInteger|))))
              (|Mapping| 7 (|NonNegativeInteger|) 11 7)
              (|Mapping| (|List| (|Integer|)) (|NonNegativeInteger|))
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

(MAKEPROP '|GuessInteger| 'NILADIC T) 
