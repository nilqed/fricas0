
(SDEFUN |LIMITRF;limit;FEU;1|
        ((|f| |Fraction| (|Polynomial| R))
         (|eq| |Equation| (|Fraction| (|Polynomial| R)))
         ($ |Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
          (|Record|
           (|:| |leftHandLimit|
                (|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                         #1="failed"))
           (|:| |rightHandLimit|
                (|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                         #1#)))
          "failed"))
        (SPROG
         ((|a| (|Fraction| (|Polynomial| R))) (|x| (|Symbol|))
          (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 11))
                . #2=(|LIMITRF;limit;FEU;1|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "limit: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|) . #2#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 12)) . #2#)
                  (EXIT
                   (|LIMITRF;locallimit| |f| |x| (SPADCALL |a| (QREFELT $ 14))
                    $))))))))) 

(SDEFUN |LIMITRF;complexLimit;FEOpc;2|
        ((|f| |Fraction| (|Polynomial| R))
         (|eq| |Equation| (|Fraction| (|Polynomial| R)))
         ($ |OnePointCompletion| (|Fraction| (|Polynomial| R))))
        (SPROG
         ((|a| (|Fraction| (|Polynomial| R))) (|x| (|Symbol|))
          (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 11))
                . #1=(|LIMITRF;complexLimit;FEOpc;2|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "limit: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|) . #1#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 12)) . #1#)
                  (EXIT
                   (|LIMITRF;locallimitcomplex| |f| |x|
                    (SPADCALL |a| (QREFELT $ 20)) $))))))))) 

(SDEFUN |LIMITRF;limit;FEU;3|
        ((|f| |Fraction| (|Polynomial| R))
         (|eq| |Equation| (|OrderedCompletion| (|Polynomial| R)))
         ($ |Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
          (|Record|
           (|:| |leftHandLimit|
                (|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                         #1="failed"))
           (|:| |rightHandLimit|
                (|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                         #1#)))
          "failed"))
        (SPROG
         ((|a| (|OrderedCompletion| (|Fraction| (|Polynomial| R))))
          (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed"))
          (|p| (|Union| (|Polynomial| R) "failed")))
         (SEQ
          (LETT |p| (SPADCALL (SPADCALL |eq| (QREFELT $ 24)) (QREFELT $ 26))
                . #2=(|LIMITRF;limit;FEU;3|))
          (EXIT
           (COND
            ((QEQCAR |p| 1)
             (|error| "limit: left hand side must be a variable"))
            (#3='T
             (SEQ (LETT |xx| (SPADCALL (QCDR |p|) (QREFELT $ 28)) . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |xx| 1)
                     (|error| "limit: left hand side must be a variable"))
                    (#3#
                     (SEQ (LETT |x| (QCDR |xx|) . #2#)
                          (LETT |a|
                                (SPADCALL (ELT $ 29)
                                          (SPADCALL |eq| (QREFELT $ 30))
                                          (QREFELT $ 33))
                                . #2#)
                          (EXIT (|LIMITRF;locallimit| |f| |x| |a| $))))))))))))) 

(SDEFUN |LIMITRF;complexLimit;FEOpc;4|
        ((|f| |Fraction| (|Polynomial| R))
         (|eq| |Equation| (|OnePointCompletion| (|Polynomial| R)))
         ($ |OnePointCompletion| (|Fraction| (|Polynomial| R))))
        (SPROG
         ((|a| (|OnePointCompletion| (|Fraction| (|Polynomial| R))))
          (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed"))
          (|p| (|Union| (|Polynomial| R) "failed")))
         (SEQ
          (LETT |p| (SPADCALL (SPADCALL |eq| (QREFELT $ 37)) (QREFELT $ 38))
                . #1=(|LIMITRF;complexLimit;FEOpc;4|))
          (EXIT
           (COND
            ((QEQCAR |p| 1)
             (|error| "limit: left hand side must be a variable"))
            (#2='T
             (SEQ (LETT |xx| (SPADCALL (QCDR |p|) (QREFELT $ 28)) . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |xx| 1)
                     (|error| "limit: left hand side must be a variable"))
                    (#2#
                     (SEQ (LETT |x| (QCDR |xx|) . #1#)
                          (LETT |a|
                                (SPADCALL (ELT $ 29)
                                          (SPADCALL |eq| (QREFELT $ 39))
                                          (QREFELT $ 41))
                                . #1#)
                          (EXIT
                           (|LIMITRF;locallimitcomplex| |f| |x| |a|
                            $))))))))))))) 

(SDEFUN |LIMITRF;fLimit|
        ((|n| |Integer|)
         (|d| |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
         (|a| |Fraction| (|Polynomial| R)) (|dir| |Integer|)
         ($ |Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
          "failed"))
        (SPROG ((|s| (|Union| (|Integer|) "failed")))
               (SEQ
                (LETT |s| (SPADCALL |d| |a| |dir| (ELT $ 45) (QREFELT $ 50))
                      |LIMITRF;fLimit|)
                (EXIT
                 (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (* |n| (QCDR |s|))
                                        (SPADCALL (QREFELT $ 51))
                                        (QREFELT $ 52))))))))) 

(SDEFUN |LIMITRF;finiteComplexLimit|
        ((|f| |Fraction|
          (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
         (|a| |Fraction| (|Polynomial| R))
         ($ |OnePointCompletion| (|Fraction| (|Polynomial| R))))
        (SPROG ((|d| #1=(|Fraction| (|Polynomial| R))) (|n| #1#))
               (COND
                ((SPADCALL
                  (LETT |n|
                        (SPADCALL (SPADCALL |f| (QREFELT $ 54)) |a|
                                  (QREFELT $ 55))
                        . #2=(|LIMITRF;finiteComplexLimit|))
                  (QREFELT $ 57))
                 (|spadConstant| $ 58))
                ((SPADCALL
                  (LETT |d|
                        (SPADCALL (SPADCALL |f| (QREFELT $ 59)) |a|
                                  (QREFELT $ 55))
                        . #2#)
                  (QREFELT $ 57))
                 (SPADCALL (QREFELT $ 60)))
                ('T
                 (SPADCALL (SPADCALL |n| |d| (QREFELT $ 61)) (QREFELT $ 20)))))) 

(SDEFUN |LIMITRF;finiteLimit|
        ((|f| |Fraction|
          (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
         (|a| |Fraction| (|Polynomial| R))
         ($ |Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
          (|Record|
           (|:| |leftHandLimit|
                (|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                         #1="failed"))
           (|:| |rightHandLimit|
                (|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                         #1#)))
          "failed"))
        (SPROG
         ((|lhsl|
           #2=(|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                       #1#))
          (|rhsl| #2#) (|s| (|Union| (|Integer|) "failed"))
          (|d| #3=(|Fraction| (|Polynomial| R))) (|n| #3#))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |n|
                   (SPADCALL (SPADCALL |f| (QREFELT $ 54)) |a| (QREFELT $ 55))
                   . #4=(|LIMITRF;finiteLimit|))
             (QREFELT $ 57))
            (CONS 0 (|spadConstant| $ 62)))
           ((SPADCALL
             (LETT |d|
                   (SPADCALL (SPADCALL |f| (QREFELT $ 59)) |a| (QREFELT $ 55))
                   . #4#)
             (QREFELT $ 57))
            (SEQ (LETT |s| (SPADCALL |n| (QREFELT $ 45)) . #4#)
                 (EXIT
                  (COND ((QEQCAR |s| 1) (CONS 2 "failed"))
                        (#5='T
                         (SEQ
                          (LETT |rhsl|
                                (|LIMITRF;fLimit| (QCDR |s|)
                                 (SPADCALL |f| (QREFELT $ 59)) |a| 1 $)
                                . #4#)
                          (LETT |lhsl|
                                (|LIMITRF;fLimit| (QCDR |s|)
                                 (SPADCALL |f| (QREFELT $ 59)) |a| -1 $)
                                . #4#)
                          (EXIT
                           (COND
                            ((QEQCAR |rhsl| 1)
                             (COND ((QEQCAR |lhsl| 1) (CONS 2 "failed"))
                                   (#5# (CONS 1 (CONS |lhsl| |rhsl|)))))
                            ((QEQCAR |lhsl| 1) (CONS 1 (CONS |lhsl| |rhsl|)))
                            ((SPADCALL (QCDR |rhsl|) (QCDR |lhsl|)
                                       (QREFELT $ 65))
                             (CONS 0 (QCDR |lhsl|)))
                            (#5# (CONS 1 (CONS |lhsl| |rhsl|)))))))))))
           (#5#
            (CONS 0
                  (SPADCALL (SPADCALL |n| |d| (QREFELT $ 61))
                            (QREFELT $ 14)))))))) 

(SDEFUN |LIMITRF;locallimit|
        ((|f| |Fraction| (|Polynomial| R)) (|x| |Symbol|)
         (|a| |OrderedCompletion| (|Fraction| (|Polynomial| R)))
         ($ |Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
          (|Record|
           (|:| |leftHandLimit|
                (|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                         #1="failed"))
           (|:| |rightHandLimit|
                (|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                         #1#)))
          "failed"))
        (SPROG
         ((|sd| #2=(|Union| (|Integer|) "failed")) (|sn| #2#)
          (|dd| #3=(|NonNegativeInteger|)) (|dn| #3#) (|n| (|SingleInteger|))
          (|g|
           (|Fraction|
            (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))))
         (SEQ
          (LETT |g| (SPADCALL |f| |x| (QREFELT $ 68))
                . #4=(|LIMITRF;locallimit|))
          (EXIT
           (COND
            ((|zero?_SI| (LETT |n| (SPADCALL |a| (QREFELT $ 70)) . #4#))
             (|LIMITRF;finiteLimit| |g| (SPADCALL |a| (QREFELT $ 71)) $))
            (#5='T
             (SEQ
              (LETT |dn|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 54)) (QREFELT $ 73))
                    . #4#)
              (LETT |dd|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 59)) (QREFELT $ 73))
                    . #4#)
              (EXIT
               (COND
                ((SPADCALL |dn| |dd| (QREFELT $ 74))
                 (SEQ
                  (LETT |sn|
                        (SPADCALL (SPADCALL |g| (QREFELT $ 54)) |n| (ELT $ 45)
                                  (QREFELT $ 75))
                        . #4#)
                  (EXIT
                   (COND ((QEQCAR |sn| 1) (CONS 2 "failed"))
                         (#5#
                          (SEQ
                           (LETT |sd|
                                 (SPADCALL (SPADCALL |g| (QREFELT $ 59)) |n|
                                           (ELT $ 45) (QREFELT $ 75))
                                 . #4#)
                           (EXIT
                            (COND ((QEQCAR |sd| 1) (CONS 2 "failed"))
                                  (#5#
                                   (CONS 0
                                         (SPADCALL (* (QCDR |sn|) (QCDR |sd|))
                                                   (SPADCALL (QREFELT $ 51))
                                                   (QREFELT $ 52))))))))))))
                ((< |dn| |dd|) (CONS 0 (|spadConstant| $ 62)))
                (#5#
                 (CONS 0
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |g| (QREFELT $ 54))
                                   (QREFELT $ 76))
                         (SPADCALL (SPADCALL |g| (QREFELT $ 59))
                                   (QREFELT $ 76))
                         (QREFELT $ 61))
                        (QREFELT $ 14))))))))))))) 

(SDEFUN |LIMITRF;limit;FESU;9|
        ((|f| |Fraction| (|Polynomial| R))
         (|eq| |Equation| (|Fraction| (|Polynomial| R))) (|st| |String|)
         ($ |Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
          "failed"))
        (SPROG
         ((|s| (|Union| (|Integer|) "failed"))
          (|d| #1=(|Fraction| (|Polynomial| R))) (|n| #1#)
          (|g|
           (|Fraction|
            (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))))
          (|a| (|Fraction| (|Polynomial| R))) (|x| (|Symbol|))
          (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 11))
                . #2=(|LIMITRF;limit;FESU;9|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "limit: left hand side must be a variable"))
            (#3='T
             (SEQ (LETT |x| (QCDR |xx|) . #2#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 12)) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL
                      (LETT |n|
                            (SPADCALL
                             (SPADCALL
                              (LETT |g| (SPADCALL |f| |x| (QREFELT $ 68))
                                    . #2#)
                              (QREFELT $ 54))
                             |a| (QREFELT $ 55))
                            . #2#)
                      (QREFELT $ 57))
                     (CONS 0 (|spadConstant| $ 62)))
                    ((SPADCALL
                      (LETT |d|
                            (SPADCALL (SPADCALL |g| (QREFELT $ 59)) |a|
                                      (QREFELT $ 55))
                            . #2#)
                      (QREFELT $ 57))
                     (SEQ (LETT |s| (SPADCALL |n| (QREFELT $ 45)) . #2#)
                          (EXIT
                           (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                 (#3#
                                  (|LIMITRF;fLimit| (QCDR |s|)
                                   (SPADCALL |g| (QREFELT $ 59)) |a|
                                   (SPADCALL |st| (QREFELT $ 79)) $))))))
                    (#3#
                     (CONS 0
                           (SPADCALL (SPADCALL |n| |d| (QREFELT $ 61))
                                     (QREFELT $ 14))))))))))))) 

(SDEFUN |LIMITRF;locallimitcomplex|
        ((|f| |Fraction| (|Polynomial| R)) (|x| |Symbol|)
         (|a| |OnePointCompletion| (|Fraction| (|Polynomial| R)))
         ($ |OnePointCompletion| (|Fraction| (|Polynomial| R))))
        (SPROG
         ((|dd| #1=(|NonNegativeInteger|)) (|dn| #1#)
          (|r| (|Union| (|Fraction| (|Polynomial| R)) "failed"))
          (|g|
           (|Fraction|
            (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))))
         (SEQ
          (LETT |g| (SPADCALL |f| |x| (QREFELT $ 68))
                . #2=(|LIMITRF;locallimitcomplex|))
          (LETT |r| (SPADCALL |a| (QREFELT $ 82)) . #2#)
          (EXIT
           (COND
            ((QEQCAR |r| 0) (|LIMITRF;finiteComplexLimit| |g| (QCDR |r|) $))
            (#3='T
             (SEQ
              (LETT |dn|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 54)) (QREFELT $ 73))
                    . #2#)
              (LETT |dd|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 59)) (QREFELT $ 73))
                    . #2#)
              (EXIT
               (COND
                ((SPADCALL |dn| |dd| (QREFELT $ 74)) (SPADCALL (QREFELT $ 60)))
                ((< |dn| |dd|) (|spadConstant| $ 58))
                (#3#
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |g| (QREFELT $ 54)) (QREFELT $ 76))
                   (SPADCALL (SPADCALL |g| (QREFELT $ 59)) (QREFELT $ 76))
                   (QREFELT $ 61))
                  (QREFELT $ 20)))))))))))) 

(DECLAIM (NOTINLINE |RationalFunctionLimitPackage;|)) 

(DEFUN |RationalFunctionLimitPackage| (#1=#:G826)
  (SPROG NIL
         (PROG (#2=#:G827)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RationalFunctionLimitPackage|)
                                               '|domainEqualList|)
                    . #3=(|RationalFunctionLimitPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RationalFunctionLimitPackage;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|RationalFunctionLimitPackage|)))))))))) 

(DEFUN |RationalFunctionLimitPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RationalFunctionLimitPackage|))
          (LETT |dv$| (LIST '|RationalFunctionLimitPackage| DV$1) . #1#)
          (LETT $ (GETREFV 83) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RationalFunctionLimitPackage|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RationalFunctionLimitPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Fraction| 27)
              (|Equation| 7) (0 . |lhs|) (|Union| 66 '"failed")
              (5 . |retractIfCan|) (10 . |rhs|) (|OrderedCompletion| 7)
              (15 . |coerce|) (|Union| 13 '"failed")
              (|Record| (|:| |leftHandLimit| 15) (|:| |rightHandLimit| 15))
              (|Union| 13 16 '"failed") |LIMITRF;limit;FEU;1|
              (|OnePointCompletion| 7) (20 . |coerce|)
              |LIMITRF;complexLimit;FEOpc;2| (|OrderedCompletion| 27)
              (|Equation| 22) (25 . |lhs|) (|Union| 27 '"failed")
              (30 . |retractIfCan|) (|Polynomial| 6) (35 . |retractIfCan|)
              (40 . |coerce|) (45 . |rhs|) (|Mapping| 7 27)
              (|OrderedCompletionFunctions2| 27 7) (50 . |map|)
              |LIMITRF;limit;FEU;3| (|OnePointCompletion| 27) (|Equation| 35)
              (56 . |lhs|) (61 . |retractIfCan|) (66 . |rhs|)
              (|OnePointCompletionFunctions2| 27 7) (71 . |map|)
              |LIMITRF;complexLimit;FEOpc;4| (|Union| 47 '"failed")
              (|RationalFunctionSign| 6) (77 . |sign|)
              (|SparseUnivariatePolynomial| 7) (|Integer|) (|Mapping| 43 7)
              (|InnerPolySign| 7 46) (82 . |signAround|) (90 . |plusInfinity|)
              (94 . *) (|Fraction| 46) (100 . |numer|) (105 . |elt|)
              (|Boolean|) (111 . |zero?|) (116 . |Zero|) (120 . |denom|)
              (125 . |infinity|) (129 . /) (135 . |Zero|) (139 . |One|)
              (143 . |One|) (147 . =) (|Symbol|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 66) 66
                                                     6 27 7)
              (153 . |univariate|) (|SingleInteger|) (159 . |whatInfinity|)
              (164 . |retract|) (|NonNegativeInteger|) (169 . |degree|)
              (174 . >) (180 . |signAround|) (187 . |leadingCoefficient|)
              (|String|) (|ToolsForSign| 6) (192 . |direction|)
              |LIMITRF;limit;FESU;9| (|Union| 7 '"failed")
              (197 . |retractIfCan|))
           '#(|limit| 202 |complexLimit| 221) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 82
                                                 '(1 8 7 0 9 1 7 10 0 11 1 8 7
                                                   0 12 1 13 0 7 14 1 19 0 7 20
                                                   1 23 22 0 24 1 22 25 0 26 1
                                                   27 10 0 28 1 7 0 27 29 1 23
                                                   22 0 30 2 32 13 31 22 33 1
                                                   36 35 0 37 1 35 25 0 38 1 36
                                                   35 0 39 2 40 19 31 35 41 1
                                                   44 43 7 45 4 49 43 46 7 47
                                                   48 50 0 13 0 51 2 13 0 47 0
                                                   52 1 53 46 0 54 2 46 7 0 7
                                                   55 1 7 56 0 57 0 19 0 58 1
                                                   53 46 0 59 0 19 0 60 2 7 0 0
                                                   0 61 0 13 0 62 0 6 0 63 0 53
                                                   0 64 2 13 56 0 0 65 2 67 53
                                                   7 66 68 1 13 69 0 70 1 13 7
                                                   0 71 1 46 72 0 73 2 72 56 0
                                                   0 74 3 49 43 46 47 48 75 1
                                                   46 7 0 76 1 78 47 77 79 1 19
                                                   81 0 82 2 0 17 7 8 18 2 0 17
                                                   7 23 34 3 0 15 7 8 77 80 2 0
                                                   19 7 36 42 2 0 19 7 8
                                                   21)))))
           '|lookupComplete|)) 
