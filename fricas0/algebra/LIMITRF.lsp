
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
        (SPROG ((|si| (|Integer|)) (|s| (|Union| (|Integer|) "failed")))
               (SEQ
                (LETT |s| (SPADCALL |d| |a| |dir| (ELT $ 45) (QREFELT $ 50))
                      . #1=(|LIMITRF;fLimit|))
                (EXIT
                 (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                       (#2='T
                        (SEQ (LETT |si| (* |n| (QCDR |s|)) . #1#)
                             (EXIT
                              (COND
                               ((EQL |si| 0) (|error| "fLimit: sign is 0"))
                               ((SPADCALL |si| 0 (QREFELT $ 53))
                                (CONS 0 (SPADCALL (QREFELT $ 54))))
                               (#2# (CONS 0 (SPADCALL (QREFELT $ 55))))))))))))) 

(SDEFUN |LIMITRF;finiteComplexLimit|
        ((|f| |Fraction|
          (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
         (|a| |Fraction| (|Polynomial| R))
         ($ |OnePointCompletion| (|Fraction| (|Polynomial| R))))
        (SPROG ((|d| #1=(|Fraction| (|Polynomial| R))) (|n| #1#))
               (COND
                ((SPADCALL
                  (LETT |n|
                        (SPADCALL (SPADCALL |f| (QREFELT $ 57)) |a|
                                  (QREFELT $ 58))
                        . #2=(|LIMITRF;finiteComplexLimit|))
                  (QREFELT $ 59))
                 (SPADCALL (|spadConstant| $ 60) (QREFELT $ 20)))
                ((SPADCALL
                  (LETT |d|
                        (SPADCALL (SPADCALL |f| (QREFELT $ 61)) |a|
                                  (QREFELT $ 58))
                        . #2#)
                  (QREFELT $ 59))
                 (SPADCALL (QREFELT $ 62)))
                ('T
                 (SPADCALL (SPADCALL |n| |d| (QREFELT $ 63)) (QREFELT $ 20)))))) 

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
                   (SPADCALL (SPADCALL |f| (QREFELT $ 57)) |a| (QREFELT $ 58))
                   . #4=(|LIMITRF;finiteLimit|))
             (QREFELT $ 59))
            (CONS 0 (SPADCALL (|spadConstant| $ 60) (QREFELT $ 14))))
           ((SPADCALL
             (LETT |d|
                   (SPADCALL (SPADCALL |f| (QREFELT $ 61)) |a| (QREFELT $ 58))
                   . #4#)
             (QREFELT $ 59))
            (SEQ (LETT |s| (SPADCALL |n| (QREFELT $ 45)) . #4#)
                 (EXIT
                  (COND ((QEQCAR |s| 1) (CONS 2 "failed"))
                        (#5='T
                         (SEQ
                          (LETT |rhsl|
                                (|LIMITRF;fLimit| (QCDR |s|)
                                 (SPADCALL |f| (QREFELT $ 61)) |a| 1 $)
                                . #4#)
                          (LETT |lhsl|
                                (|LIMITRF;fLimit| (QCDR |s|)
                                 (SPADCALL |f| (QREFELT $ 61)) |a| -1 $)
                                . #4#)
                          (EXIT
                           (COND
                            ((QEQCAR |rhsl| 1)
                             (COND ((QEQCAR |lhsl| 1) (CONS 2 "failed"))
                                   (#5# (CONS 1 (CONS |lhsl| |rhsl|)))))
                            ((QEQCAR |lhsl| 1) (CONS 1 (CONS |lhsl| |rhsl|)))
                            ((SPADCALL (QCDR |rhsl|) (QCDR |lhsl|)
                                       (QREFELT $ 66))
                             (CONS 0 (QCDR |lhsl|)))
                            (#5# (CONS 1 (CONS |lhsl| |rhsl|)))))))))))
           (#5#
            (CONS 0
                  (SPADCALL (SPADCALL |n| |d| (QREFELT $ 63))
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
         ((|si| (|Integer|)) (|sd| #2=(|Union| (|Integer|) "failed"))
          (|sn| #2#) (|dd| #3=(|NonNegativeInteger|)) (|dn| #3#)
          (|n| (|SingleInteger|))
          (|g|
           (|Fraction|
            (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))))
         (SEQ
          (LETT |g| (SPADCALL |f| |x| (QREFELT $ 69))
                . #4=(|LIMITRF;locallimit|))
          (EXIT
           (COND
            ((|zero?_SI| (LETT |n| (SPADCALL |a| (QREFELT $ 71)) . #4#))
             (|LIMITRF;finiteLimit| |g| (SPADCALL |a| (QREFELT $ 72)) $))
            (#5='T
             (SEQ
              (LETT |dn|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 57)) (QREFELT $ 74))
                    . #4#)
              (LETT |dd|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 61)) (QREFELT $ 74))
                    . #4#)
              (EXIT
               (COND
                ((SPADCALL |dn| |dd| (QREFELT $ 75))
                 (SEQ
                  (LETT |sn|
                        (SPADCALL (SPADCALL |g| (QREFELT $ 57)) |n| (ELT $ 45)
                                  (QREFELT $ 76))
                        . #4#)
                  (EXIT
                   (COND ((QEQCAR |sn| 1) (CONS 2 "failed"))
                         (#5#
                          (SEQ
                           (LETT |sd|
                                 (SPADCALL (SPADCALL |g| (QREFELT $ 61)) |n|
                                           (ELT $ 45) (QREFELT $ 76))
                                 . #4#)
                           (EXIT
                            (COND ((QEQCAR |sd| 1) (CONS 2 "failed"))
                                  (#5#
                                   (SEQ
                                    (LETT |si| (* (QCDR |sn|) (QCDR |sd|))
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((EQL |si| 0)
                                       (|error| "locallimit: sign is 0"))
                                      ((SPADCALL |si| 0 (QREFELT $ 53))
                                       (CONS 0 (SPADCALL (QREFELT $ 54))))
                                      (#5#
                                       (CONS 0
                                             (SPADCALL
                                              (QREFELT $ 55))))))))))))))))
                ((< |dn| |dd|)
                 (CONS 0 (SPADCALL (|spadConstant| $ 60) (QREFELT $ 14))))
                (#5#
                 (CONS 0
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |g| (QREFELT $ 57))
                                   (QREFELT $ 77))
                         (SPADCALL (SPADCALL |g| (QREFELT $ 61))
                                   (QREFELT $ 77))
                         (QREFELT $ 63))
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
                              (LETT |g| (SPADCALL |f| |x| (QREFELT $ 69))
                                    . #2#)
                              (QREFELT $ 57))
                             |a| (QREFELT $ 58))
                            . #2#)
                      (QREFELT $ 59))
                     (CONS 0 (SPADCALL (|spadConstant| $ 60) (QREFELT $ 14))))
                    ((SPADCALL
                      (LETT |d|
                            (SPADCALL (SPADCALL |g| (QREFELT $ 61)) |a|
                                      (QREFELT $ 58))
                            . #2#)
                      (QREFELT $ 59))
                     (SEQ (LETT |s| (SPADCALL |n| (QREFELT $ 45)) . #2#)
                          (EXIT
                           (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                 (#3#
                                  (|LIMITRF;fLimit| (QCDR |s|)
                                   (SPADCALL |g| (QREFELT $ 61)) |a|
                                   (SPADCALL |st| (QREFELT $ 80)) $))))))
                    (#3#
                     (CONS 0
                           (SPADCALL (SPADCALL |n| |d| (QREFELT $ 63))
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
          (LETT |g| (SPADCALL |f| |x| (QREFELT $ 69))
                . #2=(|LIMITRF;locallimitcomplex|))
          (LETT |r| (SPADCALL |a| (QREFELT $ 83)) . #2#)
          (EXIT
           (COND
            ((QEQCAR |r| 0) (|LIMITRF;finiteComplexLimit| |g| (QCDR |r|) $))
            (#3='T
             (SEQ
              (LETT |dn|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 57)) (QREFELT $ 74))
                    . #2#)
              (LETT |dd|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 61)) (QREFELT $ 74))
                    . #2#)
              (EXIT
               (COND
                ((SPADCALL |dn| |dd| (QREFELT $ 75)) (SPADCALL (QREFELT $ 62)))
                ((< |dn| |dd|) (SPADCALL (|spadConstant| $ 60) (QREFELT $ 20)))
                (#3#
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |g| (QREFELT $ 57)) (QREFELT $ 77))
                   (SPADCALL (SPADCALL |g| (QREFELT $ 61)) (QREFELT $ 77))
                   (QREFELT $ 63))
                  (QREFELT $ 20)))))))))))) 

(DECLAIM (NOTINLINE |RationalFunctionLimitPackage;|)) 

(DEFUN |RationalFunctionLimitPackage| (#1=#:G832)
  (SPROG NIL
         (PROG (#2=#:G833)
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
          (LETT $ (GETREFV 84) . #1#)
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
              (|Equation| 7) (0 . |lhs|) (|Union| 67 '"failed")
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
              (|InnerPolySign| 7 46) (82 . |signAround|) (90 . |Zero|)
              (|Boolean|) (94 . >) (100 . |plusInfinity|)
              (104 . |minusInfinity|) (|Fraction| 46) (108 . |numer|)
              (113 . |elt|) (119 . |zero?|) (124 . |Zero|) (128 . |denom|)
              (133 . |infinity|) (137 . /) (143 . |One|) (147 . |One|)
              (151 . =) (|Symbol|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 67) 67
                                                     6 27 7)
              (157 . |univariate|) (|SingleInteger|) (163 . |whatInfinity|)
              (168 . |retract|) (|NonNegativeInteger|) (173 . |degree|)
              (178 . >) (184 . |signAround|) (191 . |leadingCoefficient|)
              (|String|) (|ToolsForSign| 6) (196 . |direction|)
              |LIMITRF;limit;FESU;9| (|Union| 7 '"failed")
              (201 . |retractIfCan|))
           '#(|limit| 206 |complexLimit| 225) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 83
                                                 '(1 8 7 0 9 1 7 10 0 11 1 8 7
                                                   0 12 1 13 0 7 14 1 19 0 7 20
                                                   1 23 22 0 24 1 22 25 0 26 1
                                                   27 10 0 28 1 7 0 27 29 1 23
                                                   22 0 30 2 32 13 31 22 33 1
                                                   36 35 0 37 1 35 25 0 38 1 36
                                                   35 0 39 2 40 19 31 35 41 1
                                                   44 43 7 45 4 49 43 46 7 47
                                                   48 50 0 6 0 51 2 47 52 0 0
                                                   53 0 13 0 54 0 13 0 55 1 56
                                                   46 0 57 2 46 7 0 7 58 1 7 52
                                                   0 59 0 7 0 60 1 56 46 0 61 0
                                                   19 0 62 2 7 0 0 0 63 0 6 0
                                                   64 0 56 0 65 2 13 52 0 0 66
                                                   2 68 56 7 67 69 1 13 70 0 71
                                                   1 13 7 0 72 1 46 73 0 74 2
                                                   73 52 0 0 75 3 49 43 46 47
                                                   48 76 1 46 7 0 77 1 79 47 78
                                                   80 1 19 82 0 83 2 0 17 7 8
                                                   18 2 0 17 7 23 34 3 0 15 7 8
                                                   78 81 2 0 19 7 36 42 2 0 19
                                                   7 8 21)))))
           '|lookupComplete|)) 
