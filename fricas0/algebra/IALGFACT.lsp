
(SDEFUN |IALGFACT;perturbfactor|
        ((|f| |AlPol|) (|k| |Integer|) (|fact| |Mapping| (|Factored| UP) UP)
         ($ |List| |AlPol|))
        (SPROG
         ((#1=#:G714 NIL) (|pp| NIL) (#2=#:G713 NIL) (|pol| (|AlPol|))
          (|lsols| (|List| |AlPol|)) (|newf| (|AlPol|)))
         (SEQ
          (LETT |pol|
                (SPADCALL (SPADCALL (|spadConstant| $ 10) 1 (QREFELT $ 13))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |k| (QREFELT $ 15)) 1
                                      (QREFELT $ 17))
                            (QREFELT $ 18))
                           0 (QREFELT $ 13))
                          (QREFELT $ 19))
                . #3=(|IALGFACT;perturbfactor|))
          (LETT |newf| (SPADCALL |f| |pol| (QREFELT $ 20)) . #3#)
          (LETT |lsols| (|IALGFACT;irrfactor| |newf| |k| |fact| $) . #3#)
          (LETT |pol|
                (SPADCALL (SPADCALL (|spadConstant| $ 10) 1 (QREFELT $ 13))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |k| (QREFELT $ 15)) 1
                                      (QREFELT $ 17))
                            (QREFELT $ 18))
                           0 (QREFELT $ 13))
                          (QREFELT $ 21))
                . #3#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |pp| NIL . #3#) (LETT #1# |lsols| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |pp| |pol| (QREFELT $ 20)) #2#)
                         . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |IALGFACT;irrfactor|
        ((|f| |AlPol|) (|k| |Integer|) (|fact| |Mapping| (|Factored| UP) UP)
         ($ |List| |AlPol|))
        (SPROG
         ((|listerm| (|List| |AlPol|)) (|newf| (|AlPol|)) (#1=#:G724 NIL)
          (|g| (|AlPol|)) (#2=#:G734 NIL) (|pelt| NIL)
          (|listfact|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))))
          (|nn| (UP)))
         (SEQ
          (COND ((EQL (SPADCALL |f| (QREFELT $ 22)) 1) (LIST |f|))
                (#3='T
                 (SEQ (LETT |newf| |f| . #4=(|IALGFACT;irrfactor|))
                      (LETT |nn| (|IALGFACT;pnorm| |f| $) . #4#)
                      (LETT |listfact|
                            (SPADCALL (SPADCALL |nn| |fact|) (QREFELT $ 26))
                            . #4#)
                      (EXIT
                       (COND
                        ((EQL (LENGTH |listfact|) 1)
                         (COND
                          ((EQL (QCDR (|SPADfirst| |listfact|)) 1) (LIST |f|))
                          (#3#
                           (|IALGFACT;perturbfactor| |f| (+ |k| 1) |fact| $))))
                        (#3#
                         (SEQ (LETT |listerm| NIL . #4#)
                              (SEQ (LETT |pelt| NIL . #4#)
                                   (LETT #2# |listfact| . #4#) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |pelt| (CAR #2#) . #4#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |g|
                                          (SPADCALL
                                           (|IALGFACT;change| (QCAR |pelt|) $)
                                           |newf| (QREFELT $ 27))
                                          . #4#)
                                    (LETT |newf|
                                          (PROG2
                                              (LETT #1#
                                                    (SPADCALL |newf| |g|
                                                              (QREFELT $ 29))
                                                    . #4#)
                                              (QCDR #1#)
                                            (|check_union2| (QEQCAR #1# 0)
                                                            (QREFELT $ 9)
                                                            (|Union|
                                                             (QREFELT $ 9)
                                                             "failed")
                                                            #1#))
                                          . #4#)
                                    (EXIT
                                     (LETT |listerm|
                                           (COND
                                            ((EQL (QCDR |pelt|) 1)
                                             (CONS |g| |listerm|))
                                            ('T
                                             (SPADCALL
                                              (|IALGFACT;perturbfactor| |g|
                                               (+ |k| 1) |fact| $)
                                              |listerm| (QREFELT $ 31))))
                                           . #4#)))
                                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT |listerm|))))))))))) 

(SDEFUN |IALGFACT;factor;AlPolMF;3|
        ((|f| |AlPol|) (|fact| |Mapping| (|Factored| UP) UP)
         ($ |Factored| |AlPol|))
        (SPROG
         ((#1=#:G737 NIL) (#2=#:G736 #3=(|Factored| |AlPol|)) (#4=#:G738 #3#)
          (#5=#:G741 NIL) (#6=#:G740 #3#) (#7=#:G742 #3#) (#8=#:G747 NIL)
          (|pol| NIL) (#9=#:G746 NIL) (|sqterm| NIL)
          (|sqf| (|Factored| |AlPol|)))
         (SEQ
          (LETT |sqf| (SPADCALL |f| (QREFELT $ 33))
                . #10=(|IALGFACT;factor;AlPolMF;3|))
          (EXIT
           (SPADCALL (SPADCALL |sqf| (QREFELT $ 35))
                     (PROGN
                      (LETT #1# NIL . #10#)
                      (SEQ (LETT |sqterm| NIL . #10#)
                           (LETT #9# (SPADCALL |sqf| (QREFELT $ 38)) . #10#)
                           G190
                           (COND
                            ((OR (ATOM #9#)
                                 (PROGN (LETT |sqterm| (CAR #9#) . #10#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (PROGN
                                     (LETT #5# NIL . #10#)
                                     (SEQ (LETT |pol| NIL . #10#)
                                          (LETT #8#
                                                (|IALGFACT;irrfactor|
                                                 (QCAR |sqterm|) 0 |fact| $)
                                                . #10#)
                                          G190
                                          (COND
                                           ((OR (ATOM #8#)
                                                (PROGN
                                                 (LETT |pol| (CAR #8#) . #10#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #7#
                                                   (SPADCALL |pol|
                                                             (QCDR |sqterm|)
                                                             (QREFELT $ 39))
                                                   . #10#)
                                             (COND
                                              (#5#
                                               (LETT #6#
                                                     (SPADCALL #6# #7#
                                                               (QREFELT $ 40))
                                                     . #10#))
                                              ('T
                                               (PROGN
                                                (LETT #6# #7# . #10#)
                                                (LETT #5# 'T . #10#)))))))
                                          (LETT #8# (CDR #8#) . #10#) (GO G190)
                                          G191 (EXIT NIL))
                                     (COND (#5# #6#)
                                           ('T (|spadConstant| $ 41))))
                                    . #10#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #4# (QREFELT $ 40))
                                      . #10#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #10#)
                                 (LETT #1# 'T . #10#)))))))
                           (LETT #9# (CDR #9#) . #10#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 41))))
                     (QREFELT $ 42)))))) 

(SDEFUN |IALGFACT;pnorm| ((|q| |AlPol|) ($ UP))
        (SPADCALL (|IALGFACT;convrt| |q| $) (QREFELT $ 52) (QREFELT $ 53))) 

(SDEFUN |IALGFACT;change| ((|q| UP) ($ |AlPol|))
        (SPADCALL (ELT $ 54) |q| (QREFELT $ 57))) 

(SDEFUN |IALGFACT;convrt| ((|q| |AlPol|) ($ |SparseUnivariatePolynomial| UP))
        (SPADCALL (SPADCALL (ELT $ 58) |q| (QREFELT $ 61)) (QREFELT $ 63))) 

(DECLAIM (NOTINLINE |InnerAlgFactor;|)) 

(DEFUN |InnerAlgFactor| (&REST #1=#:G754)
  (SPROG NIL
         (PROG (#2=#:G755)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerAlgFactor|)
                                               '|domainEqualList|)
                    . #3=(|InnerAlgFactor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerAlgFactor;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerAlgFactor|)))))))))) 

(DEFUN |InnerAlgFactor;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerAlgFactor|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|InnerAlgFactor| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 64) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|InnerAlgFactor|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 46 (SPADCALL (QREFELT $ 45)))
    (QSETREFV $ 52 (SPADCALL (ELT $ 47) (QREFELT $ 46) (QREFELT $ 51)))
    $))) 

(MAKEPROP '|InnerAlgFactor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |One|) (4 . |One|)
              (|NonNegativeInteger|) (8 . |monomial|) (|Integer|)
              (14 . |coerce|) (19 . |One|) (23 . |monomial|) (29 . |reduce|)
              (34 . -) (40 . |elt|) (46 . +) (52 . |degree|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 14)) (|List| 23)
              (|Factored| 7) (57 . |factors|) (62 . |gcd|)
              (|Union| $ '"failed") (68 . |exquo|) (|List| 9) (74 . |append|)
              (|Factored| $) (80 . |squareFree|) (|Factored| 9) (85 . |unit|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 14)) (|List| 36)
              (90 . |factors|) (95 . |primeFactor|) (101 . *) (107 . |One|)
              (111 . *) (|Mapping| 25 7) |IALGFACT;factor;AlPolMF;3|
              (117 . |definingPolynomial|) '|p| (121 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 7 48) (126 . |map|)
              '|newp| (132 . |resultant|) (138 . |coerce|) (|Mapping| 8 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 8 9) (143 . |map|)
              (149 . |lift|) (|Mapping| 7 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 9 7 48) (154 . |map|)
              (|CommuteUnivariatePolynomialCategory| 6 7 48) (160 . |swap|))
           '#(|factor| 165) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 63
                                                 '(0 8 0 10 0 6 0 11 2 9 0 8 12
                                                   13 1 6 0 14 15 0 7 0 16 2 7
                                                   0 6 12 17 1 8 0 7 18 2 9 0 0
                                                   0 19 2 9 0 0 0 20 2 9 0 0 0
                                                   21 1 9 12 0 22 1 25 24 0 26
                                                   2 9 0 0 0 27 2 9 28 0 0 29 2
                                                   30 0 0 0 31 1 9 32 0 33 1 34
                                                   9 0 35 1 34 37 0 38 2 34 0 9
                                                   14 39 2 34 0 0 0 40 0 34 0
                                                   41 2 34 0 9 0 42 0 8 7 45 1
                                                   7 0 6 47 2 50 48 49 7 51 2
                                                   48 7 0 0 53 1 8 0 6 54 2 56
                                                   9 55 7 57 1 8 7 0 58 2 60 48
                                                   59 9 61 1 62 48 48 63 2 0 34
                                                   9 43 44)))))
           '|lookupComplete|)) 
