
(SDEFUN |LODOF;factor;LodoML;1|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP)
         ($ |List| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
        (|LODOF;innerFactor| |l| |zeros| (ELT $ 12) 'T $)) 

(SDEFUN |LODOF;expsol|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP)
         (|ezfactor| |Mapping| (|Factored| UP) UP)
         ($ |Union| (|Fraction| UP) "failed"))
        (SPROG ((|sol| (|List| (|Fraction| UP))))
               (COND
                ((NULL
                  (LETT |sol| (|LODOF;expsols| |l| |zeros| |ezfactor| NIL $)
                        |LODOF;expsol|))
                 (CONS 1 "failed"))
                ('T (CONS 0 (|SPADfirst| |sol|)))))) 

(SDEFUN |LODOF;expsols|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP)
         (|ezfactor| |Mapping| (|Factored| UP) UP) (|all?| |Boolean|)
         ($ |List| (|Fraction| UP)))
        (SPROG
         ((|sol| (|List| (|Fraction| UP))) (#1=#:G753 NIL) (|f| NIL)
          (#2=#:G752 NIL))
         (SEQ
          (LETT |sol|
                (PROGN
                 (LETT #2# NIL . #3=(|LODOF;expsols|))
                 (SEQ (LETT |f| NIL . #3#)
                      (LETT #1#
                            (QCDR
                             (SPADCALL |l| (|spadConstant| $ 19)
                                       (QREFELT $ 23)))
                            . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |f| (|spadConstant| $ 19) (QREFELT $ 25))
                          (LETT #2#
                                (CONS
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 26)) |f|
                                           (QREFELT $ 27))
                                 #2#)
                                . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (COND ((NULL |all?|) (COND ((NULL (NULL |sol|)) (EXIT |sol|)))))
          (EXIT
           (SPADCALL |sol| (SPADCALL |l| |zeros| |ezfactor| (QREFELT $ 31))
                     (QREFELT $ 32)))))) 

(SDEFUN |LODOF;opeval|
        ((|l1| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|l2| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         ($ |LinearOrdinaryDifferentialOperator1| (|Fraction| UP)))
        (SPROG
         ((|l2n| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP)))
          (|ans| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP)))
          (#1=#:G761 NIL) (|i| NIL))
         (SEQ (LETT |ans| (|spadConstant| $ 33) . #2=(|LODOF;opeval|))
              (LETT |l2n| (|spadConstant| $ 34) . #2#)
              (SEQ (LETT |i| 0 . #2#)
                   (LETT #1# (SPADCALL |l1| (QREFELT $ 36)) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |ans|
                          (SPADCALL |ans|
                                    (SPADCALL
                                     (SPADCALL |l1| |i| (QREFELT $ 37)) |l2n|
                                     (QREFELT $ 38))
                                    (QREFELT $ 39))
                          . #2#)
                    (EXIT
                     (LETT |l2n| (SPADCALL |l2| |l2n| (QREFELT $ 40)) . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |LODOF;recurfactor|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|r| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP)
         (|ezfactor| |Mapping| (|Factored| UP) UP) (|adj?| |Boolean|)
         ($ |List| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
        (SPROG
         ((|q| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP)))
          (#1=#:G763 NIL))
         (SEQ
          (LETT |q|
                (PROG2
                    (LETT #1# (SPADCALL |l| |r| (QREFELT $ 42))
                          . #2=(|LODOF;recurfactor|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction| (QREFELT $ 7)))
                                  (|Union|
                                   (|LinearOrdinaryDifferentialOperator1|
                                    (|Fraction| (QREFELT $ 7)))
                                   "failed")
                                  #1#))
                . #2#)
          (EXIT (|LODOF;innerFactor| |q| |zeros| |ezfactor| 'T $))))) 

(SDEFUN |LODOF;rfactor|
        ((|op| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|r| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP)
         (|ezfactor| |Mapping| (|Factored| UP) UP) (|adj?| |Boolean|)
         ($ |List| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
        (SPROG
         ((|op1| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
         (SEQ
          (COND
           ((OR (SPADCALL (SPADCALL |r| (QREFELT $ 36)) 1 (QREFELT $ 44))
                (NULL
                 (SPADCALL (SPADCALL |r| (QREFELT $ 45)) (|spadConstant| $ 46)
                           (QREFELT $ 47))))
            (|LODOF;recurfactor| |op| |r| |zeros| |ezfactor| |adj?| $))
           ('T
            (SEQ
             (LETT |op1|
                   (|LODOF;opeval| |op|
                    (SPADCALL (QREFELT $ 10)
                              (SPADCALL (SPADCALL |r| 0 (QREFELT $ 37))
                                        (QREFELT $ 48))
                              (QREFELT $ 49))
                    $)
                   |LODOF;rfactor|)
             (EXIT
              (SPADCALL (CONS #'|LODOF;rfactor!0| (VECTOR $ |r|))
                        (|LODOF;recurfactor| |op1| (QREFELT $ 10) |zeros|
                         |ezfactor| |adj?| $)
                        (QREFELT $ 51))))))))) 

(SDEFUN |LODOF;rfactor!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|LODOF;rfactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|LODOF;opeval| |z1| |r| $))))) 

(SDEFUN |LODOF;innerFactor|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP)
         (|ezfactor| |Mapping| (|Factored| UP) UP) (|r1?| |Boolean|)
         ($ |List| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
        (SPROG
         ((#1=#:G805 NIL) (#2=#:G806 NIL)
          (|u|
           (|Union| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
                    "failed"))
          (#3=#:G807 NIL) (|i| NIL)
          (|ll| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP)))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |l| (QREFELT $ 36)) . #4=(|LODOF;innerFactor|))
            (EXIT
             (COND ((SPADCALL |n| 1 (QREFELT $ 53)) (LIST |l|))
                   ('T
                    (SEQ (LETT |ll| (SPADCALL |l| (QREFELT $ 54)) . #4#)
                         (SEQ (LETT |i| 1 . #4#)
                              (LETT #3# (QUOTIENT2 |n| 2) . #4#) G190
                              (COND ((|greater_SI| |i| #3#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ
                                 (COND
                                  ((OR |r1?| (SPADCALL |i| 1 (QREFELT $ 44)))
                                   (SEQ
                                    (LETT |u|
                                          (|LODOF;rightFactor| |l| |i| |zeros|
                                           |ezfactor| $)
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |u| 0)
                                       (PROGN
                                        (LETT #1#
                                              (PROGN
                                               (LETT #2#
                                                     (SPADCALL
                                                      (|LODOF;rfactor| |l|
                                                       (QCDR |u|) |zeros|
                                                       |ezfactor| NIL $)
                                                      (QCDR |u|)
                                                      (QREFELT $ 55))
                                                     . #4#)
                                               (GO #5=#:G804))
                                              . #4#)
                                        (GO #6=#:G800))))))))
                                 (EXIT
                                  (COND
                                   ((< (SPADCALL 2 |i| (QREFELT $ 57)) |n|)
                                    (SEQ
                                     (LETT |u|
                                           (|LODOF;rightFactor| |ll| |i|
                                            |zeros| |ezfactor| $)
                                           . #4#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR |u| 0)
                                        (PROGN
                                         (LETT #1#
                                               (PROGN
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL (QCDR |u|)
                                                                 (QREFELT $
                                                                          54))
                                                       (SPADCALL (ELT $ 54)
                                                                 (NREVERSE
                                                                  (|LODOF;rfactor|
                                                                   |ll|
                                                                   (QCDR |u|)
                                                                   |zeros|
                                                                   |ezfactor|
                                                                   'T $))
                                                                 (QREFELT $
                                                                          51)))
                                                      . #4#)
                                                (GO #5#))
                                               . #4#)
                                         (GO #6#)))))))))))
                               #6# (EXIT #1#))
                              (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (LIST |l|))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |LODOF;rightFactor|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|n| |NonNegativeInteger|) (|zeros| |Mapping| (|List| F) UP)
         (|ezfactor| |Mapping| (|Factored| UP) UP)
         ($ |Union| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
          "failed"))
        (SPROG ((|u| (|Union| (|Fraction| UP) "failed")))
               (SEQ
                (COND
                 ((EQL |n| 1)
                  (SEQ
                   (LETT |u| (|LODOF;expsol| |l| |zeros| |ezfactor| $)
                         |LODOF;rightFactor|)
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          (#1='T
                           (CONS 0
                                 (SPADCALL (SPADCALL (QREFELT $ 9))
                                           (SPADCALL (QCDR |u|) (QREFELT $ 48))
                                           (QREFELT $ 49))))))))
                 (#1# (CONS 1 "failed")))))) 

(SDEFUN |LODOF;zro|
        ((|p| UP) (|ezfactor| |Mapping| (|Factored| UP) UP) ($ |List| F))
        (SPROG ((#1=#:G822 NIL) (|r| NIL) (#2=#:G821 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|LODOF;zro|))
                  (SEQ (LETT |r| NIL . #3#)
                       (LETT #1#
                             (SPADCALL (SPADCALL |p| |ezfactor|)
                                       (QREFELT $ 61))
                             . #3#)
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|LODOF;zro1| (QCAR |r|) $) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 64))))) 

(SDEFUN |LODOF;zro1| ((|p| UP) ($ |List| F))
        (LIST
         (SPADCALL (SPADCALL (LIST #'|LODOF;zro1!0|) |p| (QREFELT $ 68))
                   (QREFELT $ 70)))) 

(SDEFUN |LODOF;zro1!0| ((|z1| NIL) ($$ NIL)) |z1|) 

(SDEFUN |LODOF;factor;LodoL;11|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         ($ |List| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
        (|LODOF;innerFactor| |l| (CONS #'|LODOF;factor;LodoL;11!0| $)
         (ELT $ 71) 'T $)) 

(SDEFUN |LODOF;factor;LodoL;11!0| ((|p1| NIL) ($ NIL))
        (|LODOF;zro| |p1| (ELT $ 71) $)) 

(SDEFUN |LODOF;factor1;LodoL;12|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         ($ |List| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
        (|LODOF;innerFactor| |l| (CONS #'|LODOF;factor1;LodoL;12!0| $)
         (ELT $ 71) NIL $)) 

(SDEFUN |LODOF;factor1;LodoL;12!0| ((|p1| NIL) ($ NIL))
        (|LODOF;zro| |p1| (ELT $ 71) $)) 

(SDEFUN |LODOF;factor;LodoL;13|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         ($ |List| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
        (|LODOF;innerFactor| |l| (CONS #'|LODOF;factor;LodoL;13!0| $)
         (ELT $ 12) 'T $)) 

(SDEFUN |LODOF;factor;LodoL;13!0| ((|p1| NIL) ($ NIL))
        (|LODOF;zro| |p1| (ELT $ 12) $)) 

(SDEFUN |LODOF;factor1;LodoL;14|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         ($ |List| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
        (|LODOF;innerFactor| |l| (CONS #'|LODOF;factor1;LodoL;14!0| $)
         (ELT $ 12) NIL $)) 

(SDEFUN |LODOF;factor1;LodoL;14!0| ((|p1| NIL) ($ NIL))
        (|LODOF;zro| |p1| (ELT $ 12) $)) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperatorFactorizer;|)) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer| (&REST #1=#:G847)
  (SPROG NIL
         (PROG (#2=#:G848)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperatorFactorizer|)
                                               '|domainEqualList|)
                    . #3=(|LinearOrdinaryDifferentialOperatorFactorizer|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |LinearOrdinaryDifferentialOperatorFactorizer;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperatorFactorizer|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|LinearOrdinaryDifferentialOperatorFactorizer|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$|
                (LIST '|LinearOrdinaryDifferentialOperatorFactorizer| DV$1
                      DV$2)
                . #1#)
          (LETT $ (GETREFV 74) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|AlgebraicallyClosedField|))))
                          . #1#))
          (|haddProp| |$ConstructorCache|
                      '|LinearOrdinaryDifferentialOperatorFactorizer|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (COND
              ((|domainEqual| |#1| (|AlgebraicNumber|))
               (PROGN
                (QSETREFV $ 72
                          (CONS (|dispatchFunction| |LODOF;factor;LodoL;11|)
                                $))
                (QSETREFV $ 73
                          (CONS (|dispatchFunction| |LODOF;factor1;LodoL;12|)
                                $))))
              ('T
               (PROGN
                (QSETREFV $ 72
                          (CONS (|dispatchFunction| |LODOF;factor;LodoL;13|)
                                $))
                (QSETREFV $ 73
                          (CONS (|dispatchFunction| |LODOF;factor1;LodoL;14|)
                                $))))))))
          $))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperatorFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|LinearOrdinaryDifferentialOperator1| 18) (0 . D) '|dd|
              (|Factored| $) (4 . |squareFree|) (|List| 8) (|Mapping| 63 7)
              |LODOF;factor;LodoML;1| (9 . |Zero|) (13 . |Zero|) (|Fraction| 7)
              (17 . |Zero|) (|Union| 18 '"failed")
              (|Record| (|:| |particular| 20) (|:| |basis| 28))
              (|RationalLODE| 6 7) (21 . |ratDsolve|) (|Boolean|) (27 . ~=)
              (33 . |differentiate|) (38 . /) (|List| 18) (|Mapping| 60 7)
              (|RationalRicDE| 6 7) (44 . |ricDsolve|) (51 . |concat|)
              (57 . |Zero|) (61 . |One|) (|NonNegativeInteger|) (65 . |degree|)
              (70 . |coefficient|) (76 . *) (82 . +) (88 . *)
              (|Union| $ '"failed") (94 . |rightExactQuotient|) (100 . |One|)
              (104 . >) (110 . |leadingCoefficient|) (115 . |One|) (119 . =)
              (125 . |coerce|) (130 . -) (|Mapping| 8 8) (136 . |map!|)
              (142 . |One|) (146 . <=) (152 . |adjoint|) (157 . |concat!|)
              (|PositiveInteger|) (163 . *)
              (|Record| (|:| |factor| 7) (|:| |exponent| (|Integer|)))
              (|List| 58) (|Factored| 7) (169 . |factors|) (|List| $)
              (|List| 6) (174 . |concat|) (|SparseUnivariatePolynomial| 6)
              (|Mapping| 6 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 6 65) (179 . |map|)
              (|SparseUnivariatePolynomial| $) (185 . |zeroOf|)
              (190 . |factor|) (195 . |factor|) (200 . |factor1|))
           '#(|factor1| 205 |factor| 210) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 73
                                                 '(0 8 0 9 1 7 11 0 12 0 6 0 16
                                                   0 7 0 17 0 18 0 19 2 22 21 8
                                                   18 23 2 18 24 0 0 25 1 18 0
                                                   0 26 2 18 0 0 0 27 3 30 28 8
                                                   14 29 31 2 28 0 0 0 32 0 8 0
                                                   33 0 8 0 34 1 8 35 0 36 2 8
                                                   18 0 35 37 2 8 0 18 0 38 2 8
                                                   0 0 0 39 2 8 0 0 0 40 2 8 41
                                                   0 0 42 0 6 0 43 2 35 24 0 0
                                                   44 1 8 18 0 45 0 18 0 46 2
                                                   18 24 0 0 47 1 8 0 18 48 2 8
                                                   0 0 0 49 2 13 0 50 0 51 0 7
                                                   0 52 2 35 24 0 0 53 1 8 0 0
                                                   54 2 13 0 0 8 55 2 35 0 56 0
                                                   57 1 60 59 0 61 1 63 0 62 64
                                                   2 67 65 66 7 68 1 6 0 69 70
                                                   1 7 11 0 71 1 0 13 8 72 1 0
                                                   13 8 73 1 1 13 8 73 1 1 13 8
                                                   72 2 0 13 8 14 15)))))
           '|lookupComplete|)) 
