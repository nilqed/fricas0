
(SDEFUN |MULTFACT;factor;PF;1| ((|p| P) ($ |Factored| P))
        (SEQ
         (COND
          ((|domainEqual| (QREFELT $ 8) (|Fraction| (|Integer|)))
           (SPADCALL |p| (QREFELT $ 12)))
          ((|domainEqual| (QREFELT $ 8) (|Fraction| (|Complex| (|Integer|))))
           (SPADCALL |p| (QREFELT $ 14)))
          (#1='T
           (SEQ
            (COND
             ((|domainEqual| (QREFELT $ 8)
                             (|Fraction| (|Polynomial| (|Integer|))))
              (COND
               ((|HasSignature| (QREFELT $ 6)
                                (LIST '|convert| (LIST '(|Symbol|) '$)))
                (EXIT (SPADCALL |p| (QREFELT $ 16)))))))
            (EXIT
             (COND
              ((|HasCategory| (QREFELT $ 8)
                              '(|PolynomialFactorizationExplicit|))
               (SPADCALL |p| (ELT $ 19) (QREFELT $ 22)))
              (#1# (|error| "MULTFACT: factor unimplemented"))))))))) 

(SDEFUN |MULTFACT;factor;SupF;2|
        ((|up| |SparseUnivariatePolynomial| P)
         ($ |Factored| (|SparseUnivariatePolynomial| P)))
        (COND
         ((|HasCategory| (QREFELT $ 8) '(|PolynomialFactorizationExplicit|))
          (SPADCALL |up| (ELT $ 19) (QREFELT $ 26)))
         ('T (|error| "MULTFACT: factor unimplemented")))) 

(DECLAIM (NOTINLINE |MultivariateFactorize;|)) 

(DEFUN |MultivariateFactorize| (&REST #1=#:G717)
  (SPROG NIL
         (PROG (#2=#:G718)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultivariateFactorize|)
                                               '|domainEqualList|)
                    . #3=(|MultivariateFactorize|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultivariateFactorize;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultivariateFactorize|)))))))))) 

(DEFUN |MultivariateFactorize;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|MultivariateFactorize|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|MultivariateFactorize| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 28) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|MultivariateFactorize|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|MultivariateFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Factored| 9)
              (|MRationalFactorize| 7 6 (|Integer|) 9) (0 . |factor|)
              (|MRationalFactorize| 7 6 (|Complex| (|Integer|)) 9)
              (5 . |factor|)
              (|MPolyCatRationalFunctionFactorizer| 7 6 (|Integer|) 9)
              (10 . |factor|) (|Factored| 18) (|SparseUnivariatePolynomial| $)
              (15 . |factorPolynomial|)
              (|Mapping| (|Factored| (|SparseUnivariatePolynomial| 8))
                         (|SparseUnivariatePolynomial| 8))
              (|InnerMultFact| 6 7 8 9) (20 . |factor|) |MULTFACT;factor;PF;1|
              (|Factored| 25) (|SparseUnivariatePolynomial| 9) (26 . |factor|)
              |MULTFACT;factor;SupF;2|)
           '#(|factor| 32) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 27
                                                 '(1 11 10 9 12 1 13 10 9 14 1
                                                   15 10 9 16 1 8 17 18 19 2 21
                                                   10 9 20 22 2 21 24 25 20 26
                                                   1 0 24 25 27 1 0 10 9
                                                   23)))))
           '|lookupComplete|)) 
