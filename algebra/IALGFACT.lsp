
(SDEFUN |IALGFACT;perturbfactor|
        ((|f| (|AlPol|)) (|k| (|Integer|))
         (|fact| (|Mapping| (|Factored| UP) UP)) (% (|List| |AlPol|)))
        (SPROG
         ((#1=#:G10 NIL) (|pp| NIL) (#2=#:G9 NIL) (|pol| (|AlPol|))
          (|lsols| (|List| |AlPol|)) (|newf| (|AlPol|)))
         (SEQ
          (LETT |pol|
                (SPADCALL (SPADCALL (|spadConstant| % 10) 1 (QREFELT % 13))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |k| (QREFELT % 15)) 1
                                      (QREFELT % 17))
                            (QREFELT % 18))
                           0 (QREFELT % 13))
                          (QREFELT % 19)))
          (LETT |newf| (SPADCALL |f| |pol| (QREFELT % 20)))
          (LETT |lsols| (|IALGFACT;irrfactor| |newf| |k| |fact| %))
          (LETT |pol|
                (SPADCALL (SPADCALL (|spadConstant| % 10) 1 (QREFELT % 13))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |k| (QREFELT % 15)) 1
                                      (QREFELT % 17))
                            (QREFELT % 18))
                           0 (QREFELT % 13))
                          (QREFELT % 21)))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |pp| NIL) (LETT #1# |lsols|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |pp| |pol| (QREFELT % 20)) #2#))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |IALGFACT;irrfactor|
        ((|f| (|AlPol|)) (|k| (|Integer|))
         (|fact| (|Mapping| (|Factored| UP) UP)) (% (|List| |AlPol|)))
        (SPROG
         ((|listerm| (|List| |AlPol|)) (|newf| (|AlPol|)) (#1=#:G17 NIL)
          (|g| (|AlPol|)) (#2=#:G27 NIL) (|pelt| NIL)
          (|listfact|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|nn| (UP)))
         (SEQ
          (COND ((EQL (SPADCALL |f| (QREFELT % 22)) 1) (LIST |f|))
                (#3='T
                 (SEQ (LETT |newf| |f|) (LETT |nn| (|IALGFACT;pnorm| |f| %))
                      (LETT |listfact|
                            (SPADCALL (SPADCALL |nn| |fact|) (QREFELT % 27)))
                      (EXIT
                       (COND
                        ((EQL (LENGTH |listfact|) 1)
                         (COND
                          ((EQL (QVELT (|SPADfirst| |listfact|) 2) 1)
                           (LIST |f|))
                          (#3#
                           (|IALGFACT;perturbfactor| |f| (+ |k| 1) |fact| %))))
                        (#3#
                         (SEQ (LETT |listerm| NIL)
                              (SEQ (LETT |pelt| NIL) (LETT #2# |listfact|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |pelt| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |g|
                                          (SPADCALL
                                           (|IALGFACT;change| (QVELT |pelt| 1)
                                            %)
                                           |newf| (QREFELT % 28)))
                                    (LETT |newf|
                                          (PROG2
                                              (LETT #1#
                                                    (SPADCALL |newf| |g|
                                                              (QREFELT % 30)))
                                              (QCDR #1#)
                                            (|check_union2| (QEQCAR #1# 0)
                                                            (QREFELT % 9)
                                                            (|Union|
                                                             (QREFELT % 9)
                                                             "failed")
                                                            #1#)))
                                    (EXIT
                                     (LETT |listerm|
                                           (COND
                                            ((EQL (QVELT |pelt| 2) 1)
                                             (CONS |g| |listerm|))
                                            ('T
                                             (SPADCALL
                                              (|IALGFACT;perturbfactor| |g|
                                               (+ |k| 1) |fact| %)
                                              |listerm| (QREFELT % 32)))))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT |listerm|))))))))))) 

(SDEFUN |IALGFACT;factor;AlPolMF;3|
        ((|f| (|AlPol|)) (|fact| (|Mapping| (|Factored| UP) UP))
         (% (|Factored| |AlPol|)))
        (SPROG
         ((|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| |AlPol|)
                      (|:| |exponent| #1=(|NonNegativeInteger|)))))
          (#2=#:G44 NIL) (|f1| NIL) (|e1| #1#) (#3=#:G43 NIL) (|sq1| NIL)
          (|sqf| (|Factored| |AlPol|)))
         (SEQ (LETT |sqf| (SPADCALL |f| (QREFELT % 34))) (LETT |fl| NIL)
              (SEQ (LETT |sq1| NIL) (LETT #3# (SPADCALL |sqf| (QREFELT % 38)))
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |sq1| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |e1| (QVELT |sq1| 2))
                        (EXIT
                         (SEQ (LETT |f1| NIL)
                              (LETT #2#
                                    (|IALGFACT;irrfactor| (QVELT |sq1| 1) 0
                                     |fact| %))
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |f1| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |fl|
                                      (CONS (VECTOR (CONS 3 "prime") |f1| |e1|)
                                            |fl|))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |sqf| (QREFELT % 39)) |fl|
                         (QREFELT % 40)))))) 

(SDEFUN |IALGFACT;pnorm| ((|q| (|AlPol|)) (% (UP)))
        (SPADCALL (|IALGFACT;convrt| |q| %) (QREFELT % 50) (QREFELT % 51))) 

(SDEFUN |IALGFACT;change| ((|q| (UP)) (% (|AlPol|)))
        (SPADCALL (ELT % 52) |q| (QREFELT % 55))) 

(SDEFUN |IALGFACT;convrt|
        ((|q| (|AlPol|)) (% (|SparseUnivariatePolynomial| UP)))
        (SPADCALL (SPADCALL (ELT % 56) |q| (QREFELT % 59)) (QREFELT % 61))) 

(DECLAIM (NOTINLINE |InnerAlgFactor;|)) 

(DEFUN |InnerAlgFactor;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|InnerAlgFactor| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 62))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|InnerAlgFactor|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 44 (SPADCALL (QREFELT % 43)))
    (QSETREFV % 50 (SPADCALL (ELT % 45) (QREFELT % 44) (QREFELT % 49)))
    %))) 

(DEFUN |InnerAlgFactor| (&REST #1=#:G50)
  (SPROG NIL
         (PROG (#2=#:G51)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerAlgFactor|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerAlgFactor;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerAlgFactor|)))))))))) 

(MAKEPROP '|InnerAlgFactor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |One|) (4 . |One|)
              (|NonNegativeInteger|) (8 . |monomial|) (|Integer|)
              (14 . |coerce|) (19 . |One|) (23 . |monomial|) (29 . |reduce|)
              (34 . -) (40 . |elt|) (46 . +) (52 . |degree|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 23) (|:| |factor| 7) (|:| |exponent| 12))
              (|List| 24) (|Factored| 7) (57 . |factorList|) (62 . |gcd|)
              (|Union| % '"failed") (68 . |exquo|) (|List| 9) (74 . |append|)
              (|Factored| %) (80 . |squareFree|)
              (|Record| (|:| |flag| 23) (|:| |factor| 9) (|:| |exponent| 12))
              (|List| 35) (|Factored| 9) (85 . |factorList|) (90 . |unit|)
              (95 . |makeFR|) (|Mapping| 26 7) |IALGFACT;factor;AlPolMF;3|
              (101 . |definingPolynomial|) '|p| (105 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 7 46) (110 . |map|)
              '|newp| (116 . |resultant|) (122 . |coerce|) (|Mapping| 8 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 8 9) (127 . |map|)
              (133 . |lift|) (|Mapping| 7 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 9 7 46) (138 . |map|)
              (|CommuteUnivariatePolynomialCategory| 6 7 46) (144 . |swap|))
           '#(|factor| 149) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|factor|
                                 ((|Factored| |#4|) |#4|
                                  (|Mapping| (|Factored| |#2|) |#2|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 61
                                            '(0 8 0 10 0 6 0 11 2 9 0 8 12 13 1
                                              6 0 14 15 0 7 0 16 2 7 0 6 12 17
                                              1 8 0 7 18 2 9 0 0 0 19 2 9 0 0 0
                                              20 2 9 0 0 0 21 1 9 12 0 22 1 26
                                              25 0 27 2 9 0 0 0 28 2 9 29 0 0
                                              30 2 31 0 0 0 32 1 9 33 0 34 1 37
                                              36 0 38 1 37 9 0 39 2 37 0 9 36
                                              40 0 8 7 43 1 7 0 6 45 2 48 46 47
                                              7 49 2 46 7 0 0 51 1 8 0 6 52 2
                                              54 9 53 7 55 1 8 7 0 56 2 58 46
                                              57 9 59 1 60 46 46 61 2 0 37 9 41
                                              42)))))
           '|lookupComplete|)) 
