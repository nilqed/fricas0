
(SDEFUN |RFFACTOR;factorFraction;FF;1|
        ((|p| |Fraction| (|Polynomial| R))
         ($ |Fraction| (|Factored| (|Polynomial| R))))
        (SPROG
         ((MFF
           (CATEGORY |package|
            (SIGNATURE |factor| ((|Factored| #1=(|Polynomial| R)) #1#))
            (SIGNATURE |factor|
             ((|Factored| (|SparseUnivariatePolynomial| #1#))
              (|SparseUnivariatePolynomial| #1#)))))
          (FF
           (CATEGORY |package|
            (SIGNATURE |factor| ((|Factored| #2=(|Polynomial| R)) #2#))
            (SIGNATURE |factor|
             ((|Factored| (|SparseUnivariatePolynomial| #2#))
              (|SparseUnivariatePolynomial| #2#)))))
          (MR
           (CATEGORY |package|
            (SIGNATURE |factor| ((|Factored| #3=(|Polynomial| R)) #3#)))))
         (SEQ
          (COND
           ((|domainEqual| (QREFELT $ 6) (|Fraction| (|Integer|)))
            (SEQ
             (LETT MR
                   (|MRationalFactorize| (|IndexedExponents| (|Symbol|))
                                         (|Symbol|) (|Integer|)
                                         (|Polynomial| (QREFELT $ 6)))
                   . #4=(|RFFACTOR;factorFraction;FF;1|))
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |p| (QREFELT $ 9))
                         (|compiledLookupCheck| '|factor|
                                                (LIST
                                                 (LIST '|Factored|
                                                       (LIST '|Polynomial|
                                                             (|devaluate|
                                                              (ELT $ 6))))
                                                 (LIST '|Polynomial|
                                                       (|devaluate|
                                                        (ELT $ 6))))
                                                MR))
               (SPADCALL (SPADCALL |p| (QREFELT $ 10))
                         (|compiledLookupCheck| '|factor|
                                                (LIST
                                                 (LIST '|Factored|
                                                       (LIST '|Polynomial|
                                                             (|devaluate|
                                                              (ELT $ 6))))
                                                 (LIST '|Polynomial|
                                                       (|devaluate|
                                                        (ELT $ 6))))
                                                MR))
               (QREFELT $ 13)))))
           ((|HasCategory| (QREFELT $ 6) '(|FiniteFieldCategory|))
            (SEQ
             (LETT FF
                   (|MultFiniteFactorize| (|Symbol|)
                                          (|IndexedExponents| (|Symbol|))
                                          (QREFELT $ 6)
                                          (|Polynomial| (QREFELT $ 6)))
                   . #4#)
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |p| (QREFELT $ 9))
                         (|compiledLookupCheck| '|factor|
                                                (LIST
                                                 (LIST '|Factored|
                                                       (LIST '|Polynomial|
                                                             (|devaluate|
                                                              (ELT $ 6))))
                                                 (LIST '|Polynomial|
                                                       (|devaluate|
                                                        (ELT $ 6))))
                                                FF))
               (SPADCALL (SPADCALL |p| (QREFELT $ 10))
                         (|compiledLookupCheck| '|factor|
                                                (LIST
                                                 (LIST '|Factored|
                                                       (LIST '|Polynomial|
                                                             (|devaluate|
                                                              (ELT $ 6))))
                                                 (LIST '|Polynomial|
                                                       (|devaluate|
                                                        (ELT $ 6))))
                                                FF))
               (QREFELT $ 13)))))
           ((|HasCategory| (QREFELT $ 6) '(|CharacteristicZero|))
            (SEQ
             (LETT MFF
                   (|MultivariateFactorize| (|Symbol|)
                                            (|IndexedExponents| (|Symbol|))
                                            (QREFELT $ 6)
                                            (|Polynomial| (QREFELT $ 6)))
                   . #4#)
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |p| (QREFELT $ 9))
                         (|compiledLookupCheck| '|factor|
                                                (LIST
                                                 (LIST '|Factored|
                                                       (LIST '|Polynomial|
                                                             (|devaluate|
                                                              (ELT $ 6))))
                                                 (LIST '|Polynomial|
                                                       (|devaluate|
                                                        (ELT $ 6))))
                                                MFF))
               (SPADCALL (SPADCALL |p| (QREFELT $ 10))
                         (|compiledLookupCheck| '|factor|
                                                (LIST
                                                 (LIST '|Factored|
                                                       (LIST '|Polynomial|
                                                             (|devaluate|
                                                              (ELT $ 6))))
                                                 (LIST '|Polynomial|
                                                       (|devaluate|
                                                        (ELT $ 6))))
                                                MFF))
               (QREFELT $ 13)))))
           ('T (|error| "case not handled")))))) 

(DECLAIM (NOTINLINE |RationalFunctionFactorizer;|)) 

(DEFUN |RationalFunctionFactorizer| (#1=#:G711)
  (SPROG NIL
         (PROG (#2=#:G712)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RationalFunctionFactorizer|)
                                               '|domainEqualList|)
                    . #3=(|RationalFunctionFactorizer|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RationalFunctionFactorizer;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|RationalFunctionFactorizer|)))))))))) 

(DEFUN |RationalFunctionFactorizer;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RationalFunctionFactorizer|))
          (LETT |dv$| (LIST '|RationalFunctionFactorizer| DV$1) . #1#)
          (LETT $ (GETREFV 15) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RationalFunctionFactorizer|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RationalFunctionFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Polynomial| 6)
              (|Fraction| 7) (0 . |numer|) (5 . |denom|) (|Factored| 7)
              (|Fraction| 11) (10 . /) |RFFACTOR;factorFraction;FF;1|)
           '#(|factorFraction| 16) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 14
                                                 '(1 8 7 0 9 1 8 7 0 10 2 12 0
                                                   11 11 13 1 0 12 8 14)))))
           '|lookupComplete|)) 
