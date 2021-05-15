
(SDEFUN |DSTCFPG;JContinuedFraction;DUpCf;1|
        ((|x| |Distribution| R) (|zz| |UnivariatePolynomial| |z| R)
         ($ |ContinuedFraction| (|UnivariatePolynomial| |z| R)))
        (SPROG
         ((|bn1| #1=(|Stream| (|UnivariatePolynomial| |z| R))) (|an1| #1#)
          (|jac| (|Record| (|:| |an| (|Stream| R)) (|:| |bn| (|Stream| R)))))
         (SEQ (LETT |jac| (SPADCALL |x| (QREFELT $ 10)))
              (LETT |an1|
                    (SPADCALL
                     (CONS #'|DSTCFPG;JContinuedFraction;DUpCf;1!0|
                           (VECTOR $ |zz|))
                     (QCAR |jac|) (QREFELT $ 22)))
              (LETT |bn1|
                    (SPADCALL (CONS #'|DSTCFPG;JContinuedFraction;DUpCf;1!1| $)
                              (QCDR |jac|) (QREFELT $ 22)))
              (EXIT
               (SPADCALL (|spadConstant| $ 13)
                         (SPADCALL (|spadConstant| $ 25) |bn1| (QREFELT $ 26))
                         (SPADCALL |zz| |an1| (QREFELT $ 26))
                         (QREFELT $ 28)))))) 

(SDEFUN |DSTCFPG;JContinuedFraction;DUpCf;1!1| ((|b| NIL) ($ NIL))
        (SPADCALL (SPADCALL |b| (QREFELT $ 23)) (|spadConstant| $ 15)
                  (QREFELT $ 16))) 

(SDEFUN |DSTCFPG;JContinuedFraction;DUpCf;1!0| ((|a| NIL) ($$ NIL))
        (PROG (|zz| $)
          (LETT |zz| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |zz| (SPADCALL |a| (|spadConstant| $ 15) (QREFELT $ 16))
                      (QREFELT $ 17)))))) 

(SDEFUN |DSTCFPG;JContinuedFraction;DUpCf;2|
        ((|x| |Distribution| R)
         (|zz| |UnivariatePolynomial| |z| (|Fraction| R))
         ($ |ContinuedFraction| (|UnivariatePolynomial| |z| (|Fraction| R))))
        (SPROG
         ((|bn1| #1=(|Stream| (|UnivariatePolynomial| |z| (|Fraction| R))))
          (|an1| #1#)
          (|jac|
           (|Record| (|:| |an| (|Stream| (|Fraction| R)))
                     (|:| |bn| (|Stream| (|Fraction| R))))))
         (SEQ (LETT |jac| (SPADCALL |x| (QREFELT $ 31)))
              (LETT |an1|
                    (SPADCALL
                     (CONS #'|DSTCFPG;JContinuedFraction;DUpCf;2!0|
                           (VECTOR $ |zz|))
                     (QCAR |jac|) (QREFELT $ 41)))
              (LETT |bn1|
                    (SPADCALL (CONS #'|DSTCFPG;JContinuedFraction;DUpCf;2!1| $)
                              (QCDR |jac|) (QREFELT $ 41)))
              (EXIT
               (SPADCALL (|spadConstant| $ 33)
                         (SPADCALL (|spadConstant| $ 43) |bn1| (QREFELT $ 44))
                         (SPADCALL |zz| |an1| (QREFELT $ 44))
                         (QREFELT $ 46)))))) 

(SDEFUN |DSTCFPG;JContinuedFraction;DUpCf;2!1| ((|b| NIL) ($ NIL))
        (SPADCALL (SPADCALL |b| (QREFELT $ 42)) (|spadConstant| $ 15)
                  (QREFELT $ 35))) 

(SDEFUN |DSTCFPG;JContinuedFraction;DUpCf;2!0| ((|a| NIL) ($$ NIL))
        (PROG (|zz| $)
          (LETT |zz| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |zz| (SPADCALL |a| (|spadConstant| $ 15) (QREFELT $ 35))
                      (QREFELT $ 36)))))) 

(DECLAIM (NOTINLINE |DistributionContinuedFractionPackage;|)) 

(DEFUN |DistributionContinuedFractionPackage| (&REST #1=#:G389)
  (SPROG NIL
         (PROG (#2=#:G390)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DistributionContinuedFractionPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |DistributionContinuedFractionPackage;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|DistributionContinuedFractionPackage|)))))))))) 

(DEFUN |DistributionContinuedFractionPackage;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G388 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|DistributionContinuedFractionPackage| DV$1 DV$2))
    (LETT $ (GETREFV 48))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Field|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         (|not| #1#))))))
    (|haddProp| |$ConstructorCache| '|DistributionContinuedFractionPackage|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV $ 29
                (CONS (|dispatchFunction| |DSTCFPG;JContinuedFraction;DUpCf;1|)
                      $)))
     ((|HasCategory| |#1| '(|IntegralDomain|))
      (QSETREFV $ 47
                (CONS (|dispatchFunction| |DSTCFPG;JContinuedFraction;DUpCf;2|)
                      $))))
    $))) 

(MAKEPROP '|DistributionContinuedFractionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |an| 20) (|:| |bn| 20)) (|Distribution| 6)
              (0 . |jacobiParameters|) (5 . |Zero|)
              (|UnivariatePolynomial| (NRTEVAL (QREFELT $ 7)) 6) (9 . |Zero|)
              (|NonNegativeInteger|) (13 . |Zero|) (17 . |monomial|) (23 . -)
              (|Stream| 12) (|Mapping| 12 6) (|Stream| 6)
              (|StreamFunctions2| 6 12) (29 . |map|) (35 . -) (40 . |One|)
              (44 . |One|) (48 . |cons|) (|ContinuedFraction| 12)
              (54 . |continuedFraction|) (61 . |JContinuedFraction|)
              (|Record| (|:| |an| 39) (|:| |bn| 39)) (67 . |jacobiParameters|)
              (|UnivariatePolynomial| (NRTEVAL (QREFELT $ 7)) 34) (72 . |Zero|)
              (|Fraction| 6) (76 . |monomial|) (82 . -) (|Stream| 32)
              (|Mapping| 32 34) (|Stream| 34) (|StreamFunctions2| 34 32)
              (88 . |map|) (94 . -) (99 . |One|) (103 . |cons|)
              (|ContinuedFraction| 32) (109 . |continuedFraction|)
              (116 . |JContinuedFraction|))
           '#(|JContinuedFraction| 122) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|JContinuedFraction|
                                 ((|ContinuedFraction|
                                   (|UnivariatePolynomial| |#2| |#1|))
                                  (|Distribution| |#1|)
                                  (|UnivariatePolynomial| |#2| |#1|)))
                                (|has| 6 (|Field|)))
                              '((|JContinuedFraction|
                                 ((|ContinuedFraction|
                                   (|UnivariatePolynomial| |#2|
                                                           (|Fraction| |#1|)))
                                  (|Distribution| |#1|)
                                  (|UnivariatePolynomial| |#2|
                                                          (|Fraction| |#1|))))
                                (AND (|has| 6 (|IntegralDomain|))
                                     (|not| (|has| 6 (|Field|))))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 47
                                            '(1 9 8 0 10 0 6 0 11 0 12 0 13 0
                                              14 0 15 2 12 0 6 14 16 2 12 0 0 0
                                              17 2 21 18 19 20 22 1 6 0 0 23 0
                                              6 0 24 0 12 0 25 2 18 0 12 0 26 3
                                              27 0 12 18 18 28 2 0 27 9 12 29 1
                                              9 30 0 31 0 32 0 33 2 32 0 34 14
                                              35 2 32 0 0 0 36 2 40 37 38 39 41
                                              1 34 0 0 42 0 32 0 43 2 37 0 32 0
                                              44 3 45 0 32 37 37 46 2 0 45 9 32
                                              47 2 2 45 9 32 47 2 1 27 9 12
                                              29)))))
           '|lookupComplete|)) 
