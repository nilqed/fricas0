
(SDEFUN |PFRPAC;partialFraction;FSA;1|
        ((|rf| |Fraction| (|Polynomial| R)) (|v| |Symbol|) ($ |Any|))
        (SPROG ((|df| (|Factored| (|Polynomial| R))))
               (SEQ
                (LETT |df|
                      (SPADCALL (SPADCALL |rf| (QREFELT $ 9)) (QREFELT $ 12))
                      |PFRPAC;partialFraction;FSA;1|)
                (EXIT
                 (SPADCALL (SPADCALL |rf| (QREFELT $ 13)) |df| |v|
                           (QREFELT $ 16)))))) 

(SDEFUN |PFRPAC;makeSup|
        ((|p| |Polynomial| R) (|v| |Symbol|)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
        (SPROG ((|up| (|SparseUnivariatePolynomial| (|Polynomial| R))))
               (SEQ
                (LETT |up| (SPADCALL |p| |v| (QREFELT $ 19)) |PFRPAC;makeSup|)
                (EXIT (SPADCALL (ELT $ 20) |up| (QREFELT $ 25)))))) 

(SDEFUN |PFRPAC;partialFraction;PFSA;3|
        ((|p| |Polynomial| R) (|facq| |Factored| (|Polynomial| R))
         (|v| |Symbol|) ($ |Any|))
        (SPROG
         ((|pfup| (|PartialFraction| |up|)) (|nflist| (|fup|)) (#1=#:G725 NIL)
          (#2=#:G724 (|fup|)) (#3=#:G726 (|fup|)) (#4=#:G732 NIL) (|ff| NIL)
          (|fcont| (|up|))
          (|ffact|
           (|List| (|Record| (|:| |irr| |up|) (|:| |pow| (|Integer|)))))
          (#5=#:G731 NIL) (|u| NIL) (#6=#:G730 NIL)
          (|fup|
           (|Join| (|IntegralDomain|) (|DifferentialExtension| |up|)
                   (|Algebra| |up|) (|FullyEvalableOver| |up|)
                   (|FullyRetractableTo| |up|)
                   (CATEGORY |domain| (SIGNATURE |expand| (|up| $))
                    (SIGNATURE |exponent| ((|Integer|) $))
                    (SIGNATURE |makeFR|
                     ($ |up|
                      (|List|
                       (|Record|
                        (|:| |flg|
                             (|Union| #7="nil" #8="sqfr" #9="irred"
                                      #10="prime"))
                        (|:| |fctr| |up|) (|:| |xpnt| (|Integer|))))))
                    (SIGNATURE |factorList|
                     ((|List|
                       (|Record| (|:| |flg| (|Union| #7# #8# #9# #10#))
                                 (|:| |fctr| |up|) (|:| |xpnt| (|Integer|))))
                      $))
                    (SIGNATURE |nilFactor| ($ |up| (|Integer|)))
                    (SIGNATURE |factors|
                     ((|List|
                       (|Record| (|:| |factor| |up|)
                                 (|:| |exponent| (|Integer|))))
                      $))
                    (SIGNATURE |irreducibleFactor| ($ |up| (|Integer|)))
                    (SIGNATURE |nthExponent| ((|Integer|) $ (|Integer|)))
                    (SIGNATURE |nthFactor| (|up| $ (|Integer|)))
                    (SIGNATURE |nthFlag|
                     ((|Union| #7# #8# #9# #10#) $ (|Integer|)))
                    (SIGNATURE |numberOfFactors| ((|NonNegativeInteger|) $))
                    (SIGNATURE |primeFactor| ($ |up| (|Integer|)))
                    (SIGNATURE |sqfrFactor| ($ |up| (|Integer|)))
                    (SIGNATURE |flagFactor|
                     ($ |up| (|Integer|) (|Union| #7# #8# #9# #10#)))
                    (SIGNATURE |unit| (|up| $))
                    (SIGNATURE |unitNormalize| ($ $))
                    (SIGNATURE |map| ($ (|Mapping| |up| |up|) $))
                    (IF (|has| |up| (|GcdDomain|))
                        (ATTRIBUTE (|GcdDomain|))
                        |noBranch|)
                    (IF (|has| |up| (|RealConstant|))
                        (ATTRIBUTE (|RealConstant|))
                        |noBranch|)
                    (IF (|has| |up| (|UniqueFactorizationDomain|))
                        (ATTRIBUTE (|UniqueFactorizationDomain|))
                        |noBranch|)
                    (IF (|has| |up| (|ConvertibleTo| (|InputForm|)))
                        (ATTRIBUTE (|ConvertibleTo| (|InputForm|)))
                        |noBranch|)
                    (IF (|has| |up| (|IntegerNumberSystem|))
                        (PROGN
                         (SIGNATURE |rational?| ((|Boolean|) $))
                         (SIGNATURE |rational| ((|Fraction| (|Integer|)) $))
                         (SIGNATURE |rationalIfCan|
                          ((|Union| (|Fraction| (|Integer|)) "failed") $)))
                        |noBranch|)
                    (IF (|has| |up| (|Eltable| $ $))
                        (ATTRIBUTE (|Eltable| $ $))
                        |noBranch|)
                    (IF (|has| |up| (|Evalable| $))
                        (ATTRIBUTE (|Evalable| $))
                        |noBranch|)
                    (IF (|has| |up| (|InnerEvalable| (|Symbol|) $))
                        (ATTRIBUTE (|InnerEvalable| (|Symbol|) $))
                        |noBranch|))))
          (|up|
           (|Join|
            (|UnivariatePolynomialCategory| (|Fraction| (|Polynomial| R)))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |v|)))))))
         (SEQ
          (LETT |up|
                (|UnivariatePolynomial| |v|
                                        (|Fraction|
                                         (|Polynomial| (QREFELT $ 6))))
                . #11=(|PFRPAC;partialFraction;PFSA;3|))
          (LETT |fup| (|Factored| |up|) . #11#)
          (LETT |ffact|
                (PROGN
                 (LETT #6# NIL . #11#)
                 (SEQ (LETT |u| NIL . #11#)
                      (LETT #5# (SPADCALL |facq| (QREFELT $ 28)) . #11#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (CONS (|PFRPAC;makeSup| (QCAR |u|) |v| $)
                                     (QCDR |u|))
                               #6#)
                              . #11#)))
                      (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #11#)
          (LETT |fcont|
                (|PFRPAC;makeSup| (SPADCALL |facq| (QREFELT $ 29)) |v| $)
                . #11#)
          (LETT |nflist|
                (SPADCALL |fcont|
                          (PROGN
                           (LETT #1# NIL . #11#)
                           (SEQ (LETT |ff| NIL . #11#)
                                (LETT #4# |ffact| . #11#) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |ff| (CAR #4#) . #11#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #3#
                                         (SPADCALL (QCAR |ff|) (QCDR |ff|)
                                                   (|compiledLookupCheck|
                                                    '|primeFactor|
                                                    (LIST '$ (|devaluate| |up|)
                                                          (LIST '|Integer|))
                                                    |fup|))
                                         . #11#)
                                   (COND
                                    (#1#
                                     (LETT #2#
                                           (SPADCALL #2# #3#
                                                     (|compiledLookupCheck| '*
                                                                            (LIST
                                                                             '$
                                                                             '$
                                                                             '$)
                                                                            |fup|))
                                           . #11#))
                                    ('T
                                     (PROGN
                                      (LETT #2# #3# . #11#)
                                      (LETT #1# 'T . #11#)))))))
                                (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#1# #2#)
                                 ('T
                                  (SPADCALL
                                   (|compiledLookupCheck| '|One| (LIST '$)
                                                          |fup|)))))
                          (|compiledLookupCheck| '*
                                                 (LIST '$ (|devaluate| |up|)
                                                       '$)
                                                 |fup|))
                . #11#)
          (LETT |pfup|
                (SPADCALL (|PFRPAC;makeSup| |p| |v| $) |nflist|
                          (|compiledLookupCheck| '|partialFraction|
                                                 (LIST '$ (|devaluate| |up|)
                                                       (LIST '|Factored|
                                                             (|devaluate|
                                                              |up|)))
                                                 (|PartialFraction| |up|)))
                . #11#)
          (EXIT
           (SPADCALL |pfup|
                     (|compiledLookupCheck| '|coerce|
                                            (LIST (LIST '|Any|)
                                                  (LIST '|PartialFraction|
                                                        (|devaluate| |up|)))
                                            (|AnyFunctions1|
                                             (|PartialFraction| |up|)))))))) 

(DECLAIM (NOTINLINE |PartialFractionPackage;|)) 

(DEFUN |PartialFractionPackage| (#1=#:G733)
  (SPROG NIL
         (PROG (#2=#:G734)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PartialFractionPackage|)
                                               '|domainEqualList|)
                    . #3=(|PartialFractionPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|PartialFractionPackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PartialFractionPackage|)))))))))) 

(DEFUN |PartialFractionPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PartialFractionPackage|))
          (LETT |dv$| (LIST '|PartialFractionPackage| DV$1) . #1#)
          (LETT $ (GETREFV 30) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PartialFractionPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PartialFractionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Polynomial| 6)
              (|Fraction| 7) (0 . |denom|) (|Factored| 7)
              (|MultivariateFactorize| 15 (|IndexedExponents| 15) 6 7)
              (5 . |factor|) (10 . |numer|) (|Any|) (|Symbol|)
              |PFRPAC;partialFraction;PFSA;3| |PFRPAC;partialFraction;FSA;1|
              (|SparseUnivariatePolynomial| $) (15 . |univariate|)
              (21 . |coerce|) (|SparseUnivariatePolynomial| 8) (|Mapping| 8 7)
              (|SparseUnivariatePolynomial| 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 23 8 21) (26 . |map|)
              (|Record| (|:| |factor| 7) (|:| |exponent| (|Integer|)))
              (|List| 26) (32 . |factors|) (37 . |unit|))
           '#(|partialFraction| 42) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 29
                                                 '(1 8 7 0 9 1 11 10 7 12 1 8 7
                                                   0 13 2 7 18 0 15 19 1 8 0 7
                                                   20 2 24 21 22 23 25 1 10 27
                                                   0 28 1 10 7 0 29 3 0 14 7 10
                                                   15 16 2 0 14 8 15 17)))))
           '|lookupComplete|)) 
