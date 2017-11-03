
(SDEFUN |SIGNRF;sign;FU;1|
        ((|f| |Fraction| (|Polynomial| R)) ($ |Union| (|Integer|) #1="failed"))
        (SPROG ((|ud| #2=(|Union| (|Integer|) #1#)) (|un| #2#))
               (SEQ
                (LETT |un| (|SIGNRF;psign| (SPADCALL |f| (QREFELT $ 9)) $)
                      . #3=(|SIGNRF;sign;FU;1|))
                (EXIT
                 (COND ((QEQCAR |un| 1) (CONS 1 "failed"))
                       (#4='T
                        (SEQ
                         (LETT |ud|
                               (|SIGNRF;psign| (SPADCALL |f| (QREFELT $ 10)) $)
                               . #3#)
                         (EXIT
                          (COND ((QEQCAR |ud| 1) (CONS 1 "failed"))
                                (#4#
                                 (CONS 0 (* (QCDR |un|) (QCDR |ud|))))))))))))) 

(SDEFUN |SIGNRF;finiteSign|
        ((|g| |Fraction|
          (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
         (|a| |Fraction| (|Polynomial| R)) ($ |Union| (|Integer|) "failed"))
        (SPROG ((|un| #1=(|Union| (|Integer|) "failed")) (|ud| #1#))
               (SEQ
                (LETT |ud|
                      (SPADCALL (SPADCALL |g| (QREFELT $ 15)) |a| (ELT $ 12)
                                (QREFELT $ 18))
                      . #2=(|SIGNRF;finiteSign|))
                (EXIT
                 (COND ((QEQCAR |ud| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |un|
                               (SPADCALL (SPADCALL |g| (QREFELT $ 19)) |a|
                                         (ELT $ 12) (QREFELT $ 18))
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |un| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0 (* (QCDR |un|) (QCDR |ud|))))))))))))) 

(SDEFUN |SIGNRF;sign;FSOcU;3|
        ((|f| |Fraction| (|Polynomial| R)) (|x| |Symbol|)
         (|a| |OrderedCompletion| (|Fraction| (|Polynomial| R)))
         ($ |Union| (|Integer|) "failed"))
        (SPROG
         ((|un| #1=(|Union| (|Integer|) "failed")) (|ud| #1#) (|n| (|Integer|))
          (|g|
           (|Fraction|
            (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))))
         (SEQ
          (LETT |g| (SPADCALL |f| |x| (QREFELT $ 22))
                . #2=(|SIGNRF;sign;FSOcU;3|))
          (EXIT
           (COND
            ((ZEROP (LETT |n| (SPADCALL |a| (QREFELT $ 25)) . #2#))
             (|SIGNRF;finiteSign| |g| (SPADCALL |a| (QREFELT $ 26)) $))
            (#3='T
             (SEQ
              (LETT |ud|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 15)) |n| (ELT $ 12)
                              (QREFELT $ 28))
                    . #2#)
              (EXIT
               (COND ((QEQCAR |ud| 1) (CONS 1 "failed"))
                     (#3#
                      (SEQ
                       (LETT |un|
                             (SPADCALL (SPADCALL |g| (QREFELT $ 19)) |n|
                                       (ELT $ 12) (QREFELT $ 28))
                             . #2#)
                       (EXIT
                        (COND ((QEQCAR |un| 1) (CONS 1 "failed"))
                              (#3#
                               (CONS 0
                                     (* (QCDR |un|) (QCDR |ud|))))))))))))))))) 

(SDEFUN |SIGNRF;sign;FSFSU;4|
        ((|f| |Fraction| (|Polynomial| R)) (|x| |Symbol|)
         (|a| |Fraction| (|Polynomial| R)) (|st| |String|)
         ($ |Union| (|Integer|) "failed"))
        (SPROG
         ((|un| #1=(|Union| (|Integer|) "failed")) (|ud| #1#) (|d| (|Integer|))
          (|g|
           (|Fraction|
            (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))))
         (SEQ
          (LETT |ud|
                (SPADCALL
                 (SPADCALL
                  (LETT |g| (SPADCALL |f| |x| (QREFELT $ 22))
                        . #2=(|SIGNRF;sign;FSFSU;4|))
                  (QREFELT $ 15))
                 |a| (LETT |d| (SPADCALL |st| (QREFELT $ 32)) . #2#) (ELT $ 12)
                 (QREFELT $ 33))
                . #2#)
          (EXIT
           (COND ((QEQCAR |ud| 1) (CONS 1 "failed"))
                 (#3='T
                  (SEQ
                   (LETT |un|
                         (SPADCALL (SPADCALL |g| (QREFELT $ 19)) |a| |d|
                                   (ELT $ 12) (QREFELT $ 33))
                         . #2#)
                   (EXIT
                    (COND ((QEQCAR |un| 1) (CONS 1 "failed"))
                          (#3# (CONS 0 (* (QCDR |un|) (QCDR |ud|))))))))))))) 

(SDEFUN |SIGNRF;psign| ((|p| |Polynomial| R) ($ |Union| (|Integer|) "failed"))
        (SPROG
         ((|ans| (|Integer|)) (#1=#:G769 NIL)
          (|u| (|Union| (|Integer|) "failed")) (#2=#:G770 NIL) (|term| NIL)
          (|s| (|Factored| (|Polynomial| R))) (|r| (|Union| R "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 36)) . #3=(|SIGNRF;psign|))
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 37)))
                       (#4='T
                        (SEQ
                         (LETT |u|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (LETT |s| (SPADCALL |p| (QREFELT $ 39))
                                        . #3#)
                                  (QREFELT $ 41))
                                 (QREFELT $ 42))
                                (QREFELT $ 37))
                               . #3#)
                         (EXIT
                          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                                (#4#
                                 (SEQ (LETT |ans| (QCDR |u|) . #3#)
                                      (SEQ (LETT |term| NIL . #3#)
                                           (LETT #2#
                                                 (SPADCALL |s| (QREFELT $ 45))
                                                 . #3#)
                                           G190
                                           (COND
                                            ((OR (ATOM #2#)
                                                 (PROGN
                                                  (LETT |term| (CAR #2#) . #3#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((ODDP (QCDR |term|))
                                               (SEQ
                                                (LETT |u|
                                                      (|SIGNRF;sqfrSign|
                                                       (QCAR |term|) $)
                                                      . #3#)
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |u| 1)
                                                   (PROGN
                                                    (LETT #1# (CONS 1 "failed")
                                                          . #3#)
                                                    (GO #5=#:G768)))
                                                  ('T
                                                   (LETT |ans|
                                                         (* |ans| (QCDR |u|))
                                                         . #3#)))))))))
                                           (LETT #2# (CDR #2#) . #3#) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT (CONS 0 |ans|))))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |SIGNRF;sqfrSign|
        ((|p| |Polynomial| R) ($ |Union| (|Integer|) #1="failed"))
        (SPROG
         ((|u| (|Union| (|Integer|) #1#)) (|l| (|List| (|Polynomial| R))))
         (SEQ
          (LETT |u|
                (|SIGNRF;termSign|
                 (|SPADfirst|
                  (LETT |l| (SPADCALL |p| (QREFELT $ 47))
                        . #2=(|SIGNRF;sqfrSign|)))
                 $)
                . #2#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (|SIGNRF;listSign| (CDR |l|) (QCDR |u|) $))))))) 

(SDEFUN |SIGNRF;listSign|
        ((|l| |List| (|Polynomial| R)) (|s| |Integer|)
         ($ |Union| (|Integer|) #1="failed"))
        (SPROG
         ((#2=#:G788 NIL) (#3=#:G789 NIL) (|u| (|Union| (|Integer|) #1#))
          (#4=#:G790 NIL) (|term| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |term| NIL . #5=(|SIGNRF;listSign|))
                 (LETT #4# |l| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |term| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ (LETT |u| (|SIGNRF;termSign| |term| $) . #5#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN
                          (LETT #3# (CONS 1 "failed") . #5#)
                          (GO #6=#:G787)))
                        ('T
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QCDR |u|) |s| (QREFELT $ 49))
                             (PROGN
                              (LETT #2#
                                    (PROGN
                                     (LETT #3# (CONS 1 "failed") . #5#)
                                     (GO #6#))
                                    . #5#)
                              (GO #7=#:G783)))))
                          #7# (EXIT #2#))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |s|))))
          #6# (EXIT #3#)))) 

(SDEFUN |SIGNRF;termSign|
        ((|term| |Polynomial| R) ($ |Union| (|Integer|) "failed"))
        (SPROG ((#1=#:G798 NIL) (#2=#:G799 NIL) (#3=#:G800 NIL) (|var| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |var| NIL . #4=(|SIGNRF;termSign|))
                         (LETT #3# (SPADCALL |term| (QREFELT $ 51)) . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |var| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((ODDP (SPADCALL |term| |var| (QREFELT $ 53)))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed") . #4#)
                                     (GO #5=#:G797))
                                    . #4#)
                              (GO #6=#:G795))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT
                   (SPADCALL (SPADCALL |term| (QREFELT $ 54))
                             (QREFELT $ 37)))))
                #5# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |RationalFunctionSign;|)) 

(DEFUN |RationalFunctionSign| (#1=#:G801)
  (SPROG NIL
         (PROG (#2=#:G802)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RationalFunctionSign|)
                                               '|domainEqualList|)
                    . #3=(|RationalFunctionSign|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RationalFunctionSign;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RationalFunctionSign|)))))))))) 

(DEFUN |RationalFunctionSign;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RationalFunctionSign|))
          (LETT |dv$| (LIST '|RationalFunctionSign| DV$1) . #1#)
          (LETT $ (GETREFV 55) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RationalFunctionSign| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RationalFunctionSign| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Polynomial| 6)
              (|Fraction| 7) (0 . |numer|) (5 . |denom|) (|Union| 27 '"failed")
              |SIGNRF;sign;FU;1| (|SparseUnivariatePolynomial| 8)
              (|Fraction| 13) (10 . |denom|) (|Mapping| 11 8)
              (|InnerPolySign| 8 13) (15 . |signAround|) (22 . |numer|)
              (|Symbol|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 20) 20
                                                     6 7 8)
              (27 . |univariate|) (|SingleInteger|) (|OrderedCompletion| 8)
              (33 . |whatInfinity|) (38 . |retract|) (|Integer|)
              (43 . |signAround|) |SIGNRF;sign;FSOcU;3| (|String|)
              (|ToolsForSign| 6) (50 . |direction|) (55 . |signAround|)
              |SIGNRF;sign;FSFSU;4| (|Union| 6 '"failed") (63 . |retractIfCan|)
              (68 . |sign|) (|Factored| $) (73 . |squareFree|) (|Factored| 7)
              (78 . |unit|) (83 . |retract|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 27)) (|List| 43)
              (88 . |factors|) (|List| $) (93 . |monomials|) (|Boolean|)
              (98 . ~=) (|List| 20) (104 . |variables|) (|NonNegativeInteger|)
              (109 . |degree|) (115 . |leadingCoefficient|))
           '#(|sign| 120) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 54
                                                 '(1 8 7 0 9 1 8 7 0 10 1 14 13
                                                   0 15 3 17 11 13 8 16 18 1 14
                                                   13 0 19 2 21 14 8 20 22 1 24
                                                   23 0 25 1 24 8 0 26 3 17 11
                                                   13 27 16 28 1 31 27 30 32 4
                                                   17 11 13 8 27 16 33 1 7 35 0
                                                   36 1 31 11 6 37 1 7 38 0 39
                                                   1 40 7 0 41 1 7 6 0 42 1 40
                                                   44 0 45 1 7 46 0 47 2 27 48
                                                   0 0 49 1 7 50 0 51 2 7 52 0
                                                   20 53 1 7 6 0 54 1 0 11 8 12
                                                   4 0 11 8 20 8 30 34 3 0 11 8
                                                   20 24 29)))))
           '|lookupComplete|)) 
