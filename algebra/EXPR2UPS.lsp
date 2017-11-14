
(SDEFUN |EXPR2UPS;performSubstitution|
        ((|fcn| FE) (|x| |Symbol|) (|a| FE) ($ FE))
        (SPROG ((|xFE| (FE)))
               (SEQ
                (COND ((SPADCALL |a| (QREFELT $ 9)) |fcn|)
                      ('T
                       (SEQ
                        (LETT |xFE| (SPADCALL |x| (QREFELT $ 11))
                              |EXPR2UPS;performSubstitution|)
                        (EXIT
                         (SPADCALL |fcn|
                                   (SPADCALL |xFE|
                                             (SPADCALL |xFE| |a|
                                                       (QREFELT $ 12))
                                             (QREFELT $ 14))
                                   (QREFELT $ 16))))))))) 

(SDEFUN |EXPR2UPS;iTaylor| ((|fcn| FE) (|x| |Symbol|) (|a| FE) ($ |Any|))
        (SPROG
         ((|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #1=(|UnivariateTaylorSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #1# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#1# (|Any|)))))
          (|uts| (|Union| (|UnivariateTaylorSeries| FE |x| |a|) #2="failed"))
          (|uls| (|Uls|)) (#3=#:G746 NIL)
          (|ans|
           (|Union| (|:| |%series| |Uls|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|pack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|)
              (|Union| #4="complex" #5="real: two sides" #6="real: left side"
                       #7="real: right side" #8="just do it")))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #4# #5# #6# #7# #8#)))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #4# #5# #6# #7# #8#) (|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #4# #5# #6# #7# #8#) (|Boolean|) FE
              (|Mapping| (|Boolean|) FE) (|Mapping| (|Boolean|) FE)
              (|Mapping| (|Boolean|) FE)))))
          (|Uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| ($ (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) $
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| ($ (|Variable| |x|)))
                    (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
                    (SIGNATURE |lagrange| ($ $)) (SIGNATURE |lambert| ($ $))
                    (SIGNATURE |oddlambert| ($ $))
                    (SIGNATURE |evenlambert| ($ $))
                    (SIGNATURE |generalLambert| ($ $ (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| ($ $))
                    (SIGNATURE |multisect| ($ (|Integer|) (|Integer|) $))
                    (SIGNATURE |invmultisect| ($ (|Integer|) (|Integer|) $))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                        |noBranch|))))
          (|Uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x| |a|))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|)))))
         (SEQ
          (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|)
                . #9=(|EXPR2UPS;iTaylor|))
          (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|) . #9#)
          (LETT |pack|
                (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6)
                                                        (QREFELT $ 7)
                                                        (|Integer|) |Uls|
                                                        (|ElementaryFunctionsUnivariateLaurentSeries|
                                                         (QREFELT $ 7) |Uts|
                                                         |Uls|)
                                                        |Uts|
                                                        (|TaylorSeriesExpansionLaurent|
                                                         (QREFELT $ 7) |Uts|
                                                         |Uls|)
                                                        |x|)
                . #9#)
          (LETT |ans|
                (SPADCALL |fcn| NIL (CONS 4 "just do it")
                          (|compiledLookupCheck| '|exprToUPS|
                                                 (LIST
                                                  (LIST '|Union|
                                                        (LIST '|:| '|%series|
                                                              (|devaluate|
                                                               |Uls|))
                                                        (LIST '|:| '|%problem|
                                                              (LIST '|Record|
                                                                    (LIST '|:|
                                                                          '|func|
                                                                          (LIST
                                                                           '|String|))
                                                                    (LIST '|:|
                                                                          '|prob|
                                                                          (LIST
                                                                           '|String|)))))
                                                  (|devaluate| (ELT $ 7))
                                                  (LIST '|Boolean|)
                                                  (LIST '|Union| '"complex"
                                                        '"real: two sides"
                                                        '"real: left side"
                                                        '"real: right side"
                                                        '"just do it"))
                                                 |pack|))
                . #9#)
          (EXIT
           (COND
            ((QEQCAR |ans| 1)
             (COND
              ((EQUAL (QCDR (CDR |ans|)) "essential singularity")
               (|error| "No Taylor expansion: essential singularity"))
              ((EQUAL (QCAR (CDR |ans|)) "log")
               (|error| "No Taylor expansion: logarithmic singularity"))
              ((EQUAL (QCAR (CDR |ans|)) "nth root")
               (|error| "No Taylor expansion: fractional powers in expansion"))
              (#10='T (|error| "No Taylor expansion"))))
            (#10#
             (SEQ
              (LETT |uls|
                    (PROG2 (LETT #3# |ans| . #9#)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0) |Uls|
                                      (|Union| (|:| |%series| |Uls|)
                                               (|:| |%problem|
                                                    (|Record|
                                                     (|:| |func| (|String|))
                                                     (|:| |prob| (|String|)))))
                                      #3#))
                    . #9#)
              (LETT |uts|
                    (SPADCALL |uls|
                              (|compiledLookupCheck| '|taylorIfCan|
                                                     (LIST
                                                      (LIST '|Union|
                                                            (LIST
                                                             '|UnivariateTaylorSeries|
                                                             (|devaluate|
                                                              (ELT $ 7))
                                                             |x| |a|)
                                                            '#2#)
                                                      '$)
                                                     |Uls|))
                    . #9#)
              (EXIT
               (COND ((QEQCAR |uts| 1) (|error| "No Taylor expansion: pole"))
                     (#10#
                      (SEQ
                       (LETT |any1|
                             (|AnyFunctions1|
                              (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|))
                             . #9#)
                       (EXIT
                        (SPADCALL (QCDR |uts|)
                                  (|compiledLookupCheck| '|coerce|
                                                         (LIST (LIST '|Any|)
                                                               (LIST
                                                                '|UnivariateTaylorSeries|
                                                                (|devaluate|
                                                                 (ELT $ 7))
                                                                |x| |a|))
                                                         |any1|)))))))))))))) 

(SDEFUN |EXPR2UPS;taylor;SA;3| ((|x| |Symbol|) ($ |Any|))
        (SPROG
         ((|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |uts|))
            (SIGNATURE |retractIfCan| ((|Union| |uts| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|uts| (|Any|)))))
          (|uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| ($ (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) $
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| ($ (|Variable| |x|)))
                    (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
                    (SIGNATURE |lagrange| ($ $)) (SIGNATURE |lambert| ($ $))
                    (SIGNATURE |oddlambert| ($ $))
                    (SIGNATURE |evenlambert| ($ $))
                    (SIGNATURE |generalLambert| ($ $ (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| ($ $))
                    (SIGNATURE |multisect| ($ (|Integer|) (|Integer|) $))
                    (SIGNATURE |invmultisect| ($ (|Integer|) (|Integer|) $))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                        |noBranch|)))))
         (SEQ
          (LETT |uts|
                (|UnivariateTaylorSeries| (QREFELT $ 7) |x|
                                          (|spadConstant| $ 17))
                . #1=(|EXPR2UPS;taylor;SA;3|))
          (LETT |any1| (|AnyFunctions1| |uts|) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (|spadConstant| $ 19) 1
                      (|compiledLookupCheck| '|monomial|
                                             (LIST '$ (|devaluate| (ELT $ 7))
                                                   (LIST
                                                    '|NonNegativeInteger|))
                                             |uts|))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|) (|devaluate| |uts|))
                                   |any1|)))))) 

(SDEFUN |EXPR2UPS;taylor;FEA;4| ((|fcn| FE) ($ |Any|))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
                        |EXPR2UPS;taylor;FEA;4|))
                 (|error| "taylor: expression has no variables"))
                ((NULL (NULL (CDR |vars|)))
                 (|error| "taylor: expression has more than one variable"))
                ('T
                 (SPADCALL |fcn|
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |vars|) (QREFELT $ 11))
                            (|spadConstant| $ 17) (QREFELT $ 14))
                           (QREFELT $ 24)))))) 

(SDEFUN |EXPR2UPS;taylor;FENniA;5|
        ((|fcn| FE) (|n| |NonNegativeInteger|) ($ |Any|))
        (SPROG
         ((|series| (|uts|))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |uts|))
            (SIGNATURE |retractIfCan| ((|Union| |uts| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|uts| (|Any|)))))
          (|uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| ($ (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) $
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| ($ (|Variable| |x|)))
                    (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
                    (SIGNATURE |lagrange| ($ $)) (SIGNATURE |lambert| ($ $))
                    (SIGNATURE |oddlambert| ($ $))
                    (SIGNATURE |evenlambert| ($ $))
                    (SIGNATURE |generalLambert| ($ $ (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| ($ $))
                    (SIGNATURE |multisect| ($ (|Integer|) (|Integer|) $))
                    (SIGNATURE |invmultisect| ($ (|Integer|) (|Integer|) $))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                        |noBranch|))))
          (|x| (|Symbol|)) (|vars| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((NULL
             (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
                   . #1=(|EXPR2UPS;taylor;FENniA;5|)))
            (|error| "taylor: expression has no variables"))
           ((NULL (NULL (CDR |vars|)))
            (|error| "taylor: expression has more than one variable"))
           ('T
            (SEQ (LETT |x| (|SPADfirst| |vars|) . #1#)
                 (LETT |uts|
                       (|UnivariateTaylorSeries| (QREFELT $ 7) |x|
                                                 (|spadConstant| $ 17))
                       . #1#)
                 (LETT |any1| (|AnyFunctions1| |uts|) . #1#)
                 (LETT |series|
                       (SPADCALL
                        (SPADCALL |fcn|
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                            (|spadConstant| $ 17)
                                            (QREFELT $ 14))
                                  (QREFELT $ 24))
                        (|compiledLookupCheck| '|retract|
                                               (LIST (|devaluate| |uts|)
                                                     (LIST '|Any|))
                                               |any1|))
                       . #1#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL |series| |n|
                             (|compiledLookupCheck| '|extend|
                                                    (LIST '$ '$
                                                          (LIST
                                                           '|NonNegativeInteger|))
                                                    |uts|))
                   (|compiledLookupCheck| '|coerce|
                                          (LIST (LIST '|Any|)
                                                (|devaluate| |uts|))
                                          |any1|))))))))) 

(SDEFUN |EXPR2UPS;taylor;FEEA;6| ((|fcn| FE) (|eq| |Equation| FE) ($ |Any|))
        (SPROG
         ((|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
                . #1=(|EXPR2UPS;taylor;FEEA;6|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|) . #1#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
                  (EXIT
                   (|EXPR2UPS;iTaylor|
                    (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                    $))))))))) 

(SDEFUN |EXPR2UPS;taylor;FEENniA;7|
        ((|fcn| FE) (|eq| |Equation| FE) (|n| |NonNegativeInteger|) ($ |Any|))
        (SPROG
         ((|series| (|UnivariateTaylorSeries| FE |x| |a|))
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #1=(|UnivariateTaylorSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #1# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#1# (|Any|)))))
          (|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
                . #2=(|EXPR2UPS;taylor;FEENniA;7|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|) . #2#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #2#)
                  (LETT |any1|
                        (|AnyFunctions1|
                         (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|))
                        . #2#)
                  (LETT |series|
                        (SPADCALL
                         (|EXPR2UPS;iTaylor|
                          (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x|
                          |a| $)
                         (|compiledLookupCheck| '|retract|
                                                (LIST
                                                 (LIST
                                                  '|UnivariateTaylorSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |a|)
                                                 (LIST '|Any|))
                                                |any1|))
                        . #2#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL |series| |n|
                              (|compiledLookupCheck| '|extend|
                                                     (LIST '$ '$
                                                           (LIST
                                                            '|NonNegativeInteger|))
                                                     (|UnivariateTaylorSeries|
                                                      (ELT $ 7) |x| |a|)))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariateTaylorSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |a|))
                                           |any1|)))))))))) 

(SDEFUN |EXPR2UPS;iLaurent| ((|fcn| FE) (|x| |Symbol|) (|a| FE) ($ |Any|))
        (SPROG
         ((#1=#:G794 NIL)
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #2=(|UnivariateLaurentSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #2# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#2# (|Any|)))))
          (|ans|
           (|Union| (|:| |%series| |Uls|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|pack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|)
              (|Union| #3="complex" #4="real: two sides" #5="real: left side"
                       #6="real: right side" #7="just do it")))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #3# #4# #5# #6# #7#)))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #3# #4# #5# #6# #7#) (|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #3# #4# #5# #6# #7#) (|Boolean|) FE
              (|Mapping| (|Boolean|) FE) (|Mapping| (|Boolean|) FE)
              (|Mapping| (|Boolean|) FE)))))
          (|Uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| ($ (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) $
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| ($ (|Variable| |x|)))
                    (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
                    (SIGNATURE |lagrange| ($ $)) (SIGNATURE |lambert| ($ $))
                    (SIGNATURE |oddlambert| ($ $))
                    (SIGNATURE |evenlambert| ($ $))
                    (SIGNATURE |generalLambert| ($ $ (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| ($ $))
                    (SIGNATURE |multisect| ($ (|Integer|) (|Integer|) $))
                    (SIGNATURE |invmultisect| ($ (|Integer|) (|Integer|) $))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                        |noBranch|))))
          (|Uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x| |a|))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|)))))
         (SEQ
          (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|)
                . #8=(|EXPR2UPS;iLaurent|))
          (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|) . #8#)
          (LETT |pack|
                (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6)
                                                        (QREFELT $ 7)
                                                        (|Integer|) |Uls|
                                                        (|ElementaryFunctionsUnivariateLaurentSeries|
                                                         (QREFELT $ 7) |Uts|
                                                         |Uls|)
                                                        |Uts|
                                                        (|TaylorSeriesExpansionLaurent|
                                                         (QREFELT $ 7) |Uts|
                                                         |Uls|)
                                                        |x|)
                . #8#)
          (LETT |ans|
                (SPADCALL |fcn| NIL (CONS 4 "just do it")
                          (|compiledLookupCheck| '|exprToUPS|
                                                 (LIST
                                                  (LIST '|Union|
                                                        (LIST '|:| '|%series|
                                                              (|devaluate|
                                                               |Uls|))
                                                        (LIST '|:| '|%problem|
                                                              (LIST '|Record|
                                                                    (LIST '|:|
                                                                          '|func|
                                                                          (LIST
                                                                           '|String|))
                                                                    (LIST '|:|
                                                                          '|prob|
                                                                          (LIST
                                                                           '|String|)))))
                                                  (|devaluate| (ELT $ 7))
                                                  (LIST '|Boolean|)
                                                  (LIST '|Union| '"complex"
                                                        '"real: two sides"
                                                        '"real: left side"
                                                        '"real: right side"
                                                        '"just do it"))
                                                 |pack|))
                . #8#)
          (EXIT
           (COND
            ((QEQCAR |ans| 1)
             (COND
              ((EQUAL (QCDR (CDR |ans|)) "essential singularity")
               (|error| "No Laurent expansion: essential singularity"))
              ((EQUAL (QCAR (CDR |ans|)) "log")
               (|error| "No Laurent expansion: logarithmic singularity"))
              ((EQUAL (QCAR (CDR |ans|)) "nth root")
               (|error|
                "No Laurent expansion: fractional powers in expansion"))
              (#9='T (|error| "No Laurent expansion"))))
            (#9#
             (SEQ
              (LETT |any1|
                    (|AnyFunctions1|
                     (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|))
                    . #8#)
              (EXIT
               (SPADCALL
                (PROG2 (LETT #1# |ans| . #8#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) |Uls|
                                  (|Union| (|:| |%series| |Uls|)
                                           (|:| |%problem|
                                                (|Record|
                                                 (|:| |func| (|String|))
                                                 (|:| |prob| (|String|)))))
                                  #1#))
                (|compiledLookupCheck| '|coerce|
                                       (LIST (LIST '|Any|)
                                             (LIST '|UnivariateLaurentSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|))
                                       |any1|)))))))))) 

(SDEFUN |EXPR2UPS;laurent;SA;9| ((|x| |Symbol|) ($ |Any|))
        (SPROG
         ((|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |uls|))
            (SIGNATURE |retractIfCan| ((|Union| |uls| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|uls| (|Any|)))))
          (|uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x|
                                                           (|Sel| FE
                                                            (|Zero|))))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|)))))
         (SEQ
          (LETT |uls|
                (|UnivariateLaurentSeries| (QREFELT $ 7) |x|
                                           (|spadConstant| $ 17))
                . #1=(|EXPR2UPS;laurent;SA;9|))
          (LETT |any1| (|AnyFunctions1| |uls|) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (|spadConstant| $ 19) 1
                      (|compiledLookupCheck| '|monomial|
                                             (LIST '$ (|devaluate| (ELT $ 7))
                                                   (LIST '|Integer|))
                                             |uls|))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|) (|devaluate| |uls|))
                                   |any1|)))))) 

(SDEFUN |EXPR2UPS;laurent;FEA;10| ((|fcn| FE) ($ |Any|))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
                        |EXPR2UPS;laurent;FEA;10|))
                 (|error| "laurent: expression has no variables"))
                ((NULL (NULL (CDR |vars|)))
                 (|error| "laurent: expression has more than one variable"))
                ('T
                 (SPADCALL |fcn|
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |vars|) (QREFELT $ 11))
                            (|spadConstant| $ 17) (QREFELT $ 14))
                           (QREFELT $ 35)))))) 

(SDEFUN |EXPR2UPS;laurent;FEIA;11| ((|fcn| FE) (|n| |Integer|) ($ |Any|))
        (SPROG
         ((|series| (|uls|))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |uls|))
            (SIGNATURE |retractIfCan| ((|Union| |uls| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|uls| (|Any|)))))
          (|uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x|
                                                           (|Sel| FE
                                                            (|Zero|))))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|x| (|Symbol|)) (|vars| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((NULL
             (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
                   . #1=(|EXPR2UPS;laurent;FEIA;11|)))
            (|error| "laurent: expression has no variables"))
           ((NULL (NULL (CDR |vars|)))
            (|error| "laurent: expression has more than one variable"))
           ('T
            (SEQ (LETT |x| (|SPADfirst| |vars|) . #1#)
                 (LETT |uls|
                       (|UnivariateLaurentSeries| (QREFELT $ 7) |x|
                                                  (|spadConstant| $ 17))
                       . #1#)
                 (LETT |any1| (|AnyFunctions1| |uls|) . #1#)
                 (LETT |series|
                       (SPADCALL
                        (SPADCALL |fcn|
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                            (|spadConstant| $ 17)
                                            (QREFELT $ 14))
                                  (QREFELT $ 35))
                        (|compiledLookupCheck| '|retract|
                                               (LIST (|devaluate| |uls|)
                                                     (LIST '|Any|))
                                               |any1|))
                       . #1#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL |series| |n|
                             (|compiledLookupCheck| '|extend|
                                                    (LIST '$ '$
                                                          (LIST '|Integer|))
                                                    |uls|))
                   (|compiledLookupCheck| '|coerce|
                                          (LIST (LIST '|Any|)
                                                (|devaluate| |uls|))
                                          |any1|))))))))) 

(SDEFUN |EXPR2UPS;laurent;FEEA;12| ((|fcn| FE) (|eq| |Equation| FE) ($ |Any|))
        (SPROG
         ((|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
                . #1=(|EXPR2UPS;laurent;FEEA;12|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|) . #1#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
                  (EXIT
                   (|EXPR2UPS;iLaurent|
                    (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                    $))))))))) 

(SDEFUN |EXPR2UPS;laurent;FEEIA;13|
        ((|fcn| FE) (|eq| |Equation| FE) (|n| |Integer|) ($ |Any|))
        (SPROG
         ((|series| (|UnivariateLaurentSeries| FE |x| |a|))
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #1=(|UnivariateLaurentSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #1# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#1# (|Any|)))))
          (|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
                . #2=(|EXPR2UPS;laurent;FEEIA;13|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|) . #2#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #2#)
                  (LETT |any1|
                        (|AnyFunctions1|
                         (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|))
                        . #2#)
                  (LETT |series|
                        (SPADCALL
                         (|EXPR2UPS;iLaurent|
                          (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x|
                          |a| $)
                         (|compiledLookupCheck| '|retract|
                                                (LIST
                                                 (LIST
                                                  '|UnivariateLaurentSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |a|)
                                                 (LIST '|Any|))
                                                |any1|))
                        . #2#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL |series| |n|
                              (|compiledLookupCheck| '|extend|
                                                     (LIST '$ '$
                                                           (LIST '|Integer|))
                                                     (|UnivariateLaurentSeries|
                                                      (ELT $ 7) |x| |a|)))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariateLaurentSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |a|))
                                           |any1|)))))))))) 

(SDEFUN |EXPR2UPS;iPuiseux| ((|fcn| FE) (|x| |Symbol|) (|a| FE) ($ |Any|))
        (SPROG
         ((#1=#:G837 NIL)
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #2=(|UnivariatePuiseuxSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #2# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#2# (|Any|)))))
          (|ans|
           (|Union| (|:| |%series| |Ups|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|pack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Ups|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|)
              (|Union| #3="complex" #4="real: two sides" #5="real: left side"
                       #6="real: right side" #7="just do it")))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Ups|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #3# #4# #5# #6# #7#)))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Ups|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #3# #4# #5# #6# #7#) (|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Ups|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #3# #4# #5# #6# #7#) (|Boolean|) FE
              (|Mapping| (|Boolean|) FE) (|Mapping| (|Boolean|) FE)
              (|Mapping| (|Boolean|) FE)))))
          (|Ups|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x| |a|))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| |a|))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|Uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x| |a|))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|Uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| ($ (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) $
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| ($ (|Variable| |x|)))
                    (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
                    (SIGNATURE |lagrange| ($ $)) (SIGNATURE |lambert| ($ $))
                    (SIGNATURE |oddlambert| ($ $))
                    (SIGNATURE |evenlambert| ($ $))
                    (SIGNATURE |generalLambert| ($ $ (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| ($ $))
                    (SIGNATURE |multisect| ($ (|Integer|) (|Integer|) $))
                    (SIGNATURE |invmultisect| ($ (|Integer|) (|Integer|) $))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                        |noBranch|)))))
         (SEQ
          (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|)
                . #8=(|EXPR2UPS;iPuiseux|))
          (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|) . #8#)
          (LETT |Ups| (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| |a|) . #8#)
          (LETT |pack|
                (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6)
                                                        (QREFELT $ 7)
                                                        (|Fraction|
                                                         (|Integer|))
                                                        |Ups|
                                                        (|ElementaryFunctionsUnivariatePuiseuxSeries|
                                                         (QREFELT $ 7) |Uls|
                                                         |Ups|
                                                         (|ElementaryFunctionsUnivariateLaurentSeries|
                                                          (QREFELT $ 7) |Uts|
                                                          |Uls|))
                                                        |Uts|
                                                        (|TaylorSeriesExpansionPuiseux|
                                                         (QREFELT $ 7) |Uts|
                                                         |Uls| |Ups|)
                                                        |x|)
                . #8#)
          (LETT |ans|
                (SPADCALL |fcn| NIL (CONS 4 "just do it")
                          (|compiledLookupCheck| '|exprToUPS|
                                                 (LIST
                                                  (LIST '|Union|
                                                        (LIST '|:| '|%series|
                                                              (|devaluate|
                                                               |Ups|))
                                                        (LIST '|:| '|%problem|
                                                              (LIST '|Record|
                                                                    (LIST '|:|
                                                                          '|func|
                                                                          (LIST
                                                                           '|String|))
                                                                    (LIST '|:|
                                                                          '|prob|
                                                                          (LIST
                                                                           '|String|)))))
                                                  (|devaluate| (ELT $ 7))
                                                  (LIST '|Boolean|)
                                                  (LIST '|Union| '"complex"
                                                        '"real: two sides"
                                                        '"real: left side"
                                                        '"real: right side"
                                                        '"just do it"))
                                                 |pack|))
                . #8#)
          (EXIT
           (COND
            ((QEQCAR |ans| 1)
             (COND
              ((EQUAL (QCDR (CDR |ans|)) "essential singularity")
               (|error| "No Puiseux expansion: essential singularity"))
              ((EQUAL (QCAR (CDR |ans|)) "log")
               (|error| "No Puiseux expansion: logarithmic singularity"))
              (#9='T (|error| "No Puiseux expansion"))))
            (#9#
             (SEQ
              (LETT |any1|
                    (|AnyFunctions1|
                     (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| |a|))
                    . #8#)
              (EXIT
               (SPADCALL
                (PROG2 (LETT #1# |ans| . #8#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) |Ups|
                                  (|Union| (|:| |%series| |Ups|)
                                           (|:| |%problem|
                                                (|Record|
                                                 (|:| |func| (|String|))
                                                 (|:| |prob| (|String|)))))
                                  #1#))
                (|compiledLookupCheck| '|coerce|
                                       (LIST (LIST '|Any|)
                                             (LIST '|UnivariatePuiseuxSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|))
                                       |any1|)))))))))) 

(SDEFUN |EXPR2UPS;puiseux;SA;15| ((|x| |Symbol|) ($ |Any|))
        (SPROG
         ((|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |upxs|))
            (SIGNATURE |retractIfCan| ((|Union| |upxs| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|upxs| (|Any|)))))
          (|upxs|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x|
                                                           #1=(|Sel| FE
                                                               (|Zero|))))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| #1#))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|)))))
         (SEQ
          (LETT |upxs|
                (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                           (|spadConstant| $ 17))
                . #2=(|EXPR2UPS;puiseux;SA;15|))
          (LETT |any1| (|AnyFunctions1| |upxs|) . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL (|spadConstant| $ 19) (|spadConstant| $ 41)
                      (|compiledLookupCheck| '|monomial|
                                             (LIST '$ (|devaluate| (ELT $ 7))
                                                   (LIST '|Fraction|
                                                         (LIST '|Integer|)))
                                             |upxs|))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|) (|devaluate| |upxs|))
                                   |any1|)))))) 

(SDEFUN |EXPR2UPS;puiseux;FEA;16| ((|fcn| FE) ($ |Any|))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
                        |EXPR2UPS;puiseux;FEA;16|))
                 (|error| "puiseux: expression has no variables"))
                ((NULL (NULL (CDR |vars|)))
                 (|error| "puiseux: expression has more than one variable"))
                ('T
                 (SPADCALL |fcn|
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |vars|) (QREFELT $ 11))
                            (|spadConstant| $ 17) (QREFELT $ 14))
                           (QREFELT $ 43)))))) 

(SDEFUN |EXPR2UPS;puiseux;FEFA;17|
        ((|fcn| FE) (|n| |Fraction| (|Integer|)) ($ |Any|))
        (SPROG
         ((|series| (|upxs|))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |upxs|))
            (SIGNATURE |retractIfCan| ((|Union| |upxs| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|upxs| (|Any|)))))
          (|upxs|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x|
                                                           #1=(|Sel| FE
                                                               (|Zero|))))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| #1#))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|x| (|Symbol|)) (|vars| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((NULL
             (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
                   . #2=(|EXPR2UPS;puiseux;FEFA;17|)))
            (|error| "puiseux: expression has no variables"))
           ((NULL (NULL (CDR |vars|)))
            (|error| "puiseux: expression has more than one variable"))
           ('T
            (SEQ (LETT |x| (|SPADfirst| |vars|) . #2#)
                 (LETT |upxs|
                       (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                                  (|spadConstant| $ 17))
                       . #2#)
                 (LETT |any1| (|AnyFunctions1| |upxs|) . #2#)
                 (LETT |series|
                       (SPADCALL
                        (SPADCALL |fcn|
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                            (|spadConstant| $ 17)
                                            (QREFELT $ 14))
                                  (QREFELT $ 43))
                        (|compiledLookupCheck| '|retract|
                                               (LIST (|devaluate| |upxs|)
                                                     (LIST '|Any|))
                                               |any1|))
                       . #2#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL |series| |n|
                             (|compiledLookupCheck| '|extend|
                                                    (LIST '$ '$
                                                          (LIST '|Fraction|
                                                                (LIST
                                                                 '|Integer|)))
                                                    |upxs|))
                   (|compiledLookupCheck| '|coerce|
                                          (LIST (LIST '|Any|)
                                                (|devaluate| |upxs|))
                                          |any1|))))))))) 

(SDEFUN |EXPR2UPS;puiseux;FEEA;18| ((|fcn| FE) (|eq| |Equation| FE) ($ |Any|))
        (SPROG
         ((|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
                . #1=(|EXPR2UPS;puiseux;FEEA;18|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|) . #1#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
                  (EXIT
                   (|EXPR2UPS;iPuiseux|
                    (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                    $))))))))) 

(SDEFUN |EXPR2UPS;puiseux;FEEFA;19|
        ((|fcn| FE) (|eq| |Equation| FE) (|n| |Fraction| (|Integer|))
         ($ |Any|))
        (SPROG
         ((|series| (|UnivariatePuiseuxSeries| FE |x| |a|))
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #1=(|UnivariatePuiseuxSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #1# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#1# (|Any|)))))
          (|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
                . #2=(|EXPR2UPS;puiseux;FEEFA;19|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|) . #2#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #2#)
                  (LETT |any1|
                        (|AnyFunctions1|
                         (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| |a|))
                        . #2#)
                  (LETT |series|
                        (SPADCALL
                         (|EXPR2UPS;iPuiseux|
                          (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x|
                          |a| $)
                         (|compiledLookupCheck| '|retract|
                                                (LIST
                                                 (LIST
                                                  '|UnivariatePuiseuxSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |a|)
                                                 (LIST '|Any|))
                                                |any1|))
                        . #2#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL |series| |n|
                              (|compiledLookupCheck| '|extend|
                                                     (LIST '$ '$
                                                           (LIST '|Fraction|
                                                                 (LIST
                                                                  '|Integer|)))
                                                     (|UnivariatePuiseuxSeries|
                                                      (ELT $ 7) |x| |a|)))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariatePuiseuxSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |a|))
                                           |any1|)))))))))) 

(SDEFUN |EXPR2UPS;iSeries| ((|fcn| FE) (|x| |Symbol|) (|a| FE) ($ |Any|))
        (SPROG
         ((|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             (#1=(|Any|) #2=(|UnivariatePuiseuxSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan|
             ((|Union| #2# . #3=("failed")) . #4=((|Any|))))
            #5=(SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#2# . #6=((|Any|))))))
          (#7=#:G873 NIL)
          (|anyone|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             (#1# #8=(|GeneralUnivariatePowerSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #8# . #3#) . #4#)) #5#
            (SIGNATURE |retract| (#8# . #6#))))
          (|ansG|
           (|Union| (|:| |%series| (|UnivariatePuiseuxSeries| FE |x| |a|))
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|ans|
           (|Union| (|:| |%series| (|UnivariatePuiseuxSeries| FE |x| |a|))
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|pack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union|
               (|:| |%series| #9=(|UnivariatePuiseuxSeries| FE |x| |a|))
               (|:| |%problem|
                    (|Record| (|:| |func| (|String|))
                              (|:| |prob| (|String|)))))
              FE (|Boolean|)
              (|Union| #10="complex" #11="real: two sides"
                       #12="real: left side" #13="real: right side"
                       #14="just do it")))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| #9#)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #10# #11# #12# #13# #14#)))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| #9#)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #10# #11# #12# #13# #14#) (|Boolean|)
              FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| #9#)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #10# #11# #12# #13# #14#) (|Boolean|) FE
              (|Mapping| (|Boolean|) FE) (|Mapping| (|Boolean|) FE)
              (|Mapping| (|Boolean|) FE)))))
          (|Uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x| |a|))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|Uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| ($ (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) $
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| ($ (|Variable| |x|)))
                    (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
                    (SIGNATURE |lagrange| ($ $)) (SIGNATURE |lambert| ($ $))
                    (SIGNATURE |oddlambert| ($ $))
                    (SIGNATURE |evenlambert| ($ $))
                    (SIGNATURE |generalLambert| ($ $ (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| ($ $))
                    (SIGNATURE |multisect| ($ (|Integer|) (|Integer|) $))
                    (SIGNATURE |invmultisect| ($ (|Integer|) (|Integer|) $))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                        |noBranch|)))))
         (SEQ
          (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|)
                . #15=(|EXPR2UPS;iSeries|))
          (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|) . #15#)
          (LETT |pack|
                (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6)
                                                        (QREFELT $ 7)
                                                        (|Fraction|
                                                         (|Integer|))
                                                        (|UnivariatePuiseuxSeries|
                                                         (QREFELT $ 7) |x| |a|)
                                                        (|ElementaryFunctionsUnivariatePuiseuxSeries|
                                                         (QREFELT $ 7) |Uls|
                                                         (|UnivariatePuiseuxSeries|
                                                          (QREFELT $ 7) |x|
                                                          |a|)
                                                         (|ElementaryFunctionsUnivariateLaurentSeries|
                                                          (QREFELT $ 7) |Uts|
                                                          |Uls|))
                                                        |Uts|
                                                        (|TaylorSeriesExpansionPuiseux|
                                                         (QREFELT $ 7) |Uts|
                                                         |Uls|
                                                         (|UnivariatePuiseuxSeries|
                                                          (QREFELT $ 7) |x|
                                                          |a|))
                                                        |x|)
                . #15#)
          (LETT |ans|
                (SPADCALL |fcn| NIL (CONS 4 "just do it")
                          (|compiledLookupCheck| '|exprToUPS|
                                                 (LIST
                                                  (LIST '|Union|
                                                        (LIST '|:| '|%series|
                                                              (LIST
                                                               '|UnivariatePuiseuxSeries|
                                                               (|devaluate|
                                                                (ELT $ 7))
                                                               |x| |a|))
                                                        (LIST '|:| '|%problem|
                                                              (LIST '|Record|
                                                                    (LIST '|:|
                                                                          '|func|
                                                                          (LIST
                                                                           '|String|))
                                                                    (LIST '|:|
                                                                          '|prob|
                                                                          (LIST
                                                                           '|String|)))))
                                                  (|devaluate| (ELT $ 7))
                                                  (LIST '|Boolean|)
                                                  (LIST '|Union| '#16="complex"
                                                        '#17="real: two sides"
                                                        '#18="real: left side"
                                                        '#19="real: right side"
                                                        '#20="just do it"))
                                                 |pack|))
                . #15#)
          (EXIT
           (COND
            ((QEQCAR |ans| 1)
             (SEQ
              (LETT |ansG|
                    (SPADCALL |fcn| NIL (CONS 4 "just do it")
                              (|compiledLookupCheck| '|exprToGenUPS|
                                                     (LIST
                                                      (LIST '|Union|
                                                            (LIST '|:|
                                                                  '|%series|
                                                                  (LIST
                                                                   '|UnivariatePuiseuxSeries|
                                                                   (|devaluate|
                                                                    (ELT $ 7))
                                                                   |x| |a|))
                                                            (LIST '|:|
                                                                  '|%problem|
                                                                  (LIST
                                                                   '|Record|
                                                                   (LIST '|:|
                                                                         '|func|
                                                                         (LIST
                                                                          '|String|))
                                                                   (LIST '|:|
                                                                         '|prob|
                                                                         (LIST
                                                                          '|String|)))))
                                                      (|devaluate| (ELT $ 7))
                                                      (LIST '|Boolean|)
                                                      (LIST '|Union| '#16#
                                                            '#17# '#18# '#19#
                                                            '#20#))
                                                     |pack|))
                    . #15#)
              (EXIT
               (COND
                ((QEQCAR |ansG| 1)
                 (COND
                  ((EQUAL (QCDR (CDR |ansG|)) "essential singularity")
                   (|error| "No series expansion: essential singularity"))
                  (#21='T (|error| "No series expansion"))))
                (#21#
                 (SEQ
                  (LETT |anyone|
                        (|AnyFunctions1|
                         (|GeneralUnivariatePowerSeries| (QREFELT $ 7) |x|
                                                         |a|))
                        . #15#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (PROG2 (LETT #7# |ansG| . #15#)
                         (QCDR #7#)
                       (|check_union2| (QEQCAR #7# 0)
                                       (|UnivariatePuiseuxSeries| (QREFELT $ 7)
                                                                  |x| |a|)
                                       (|Union|
                                        (|:| |%series|
                                             (|UnivariatePuiseuxSeries|
                                              (QREFELT $ 7) |x| |a|))
                                        (|:| |%problem|
                                             (|Record| (|:| |func| (|String|))
                                                       (|:| |prob|
                                                            (|String|)))))
                                       #7#))
                     (|compiledLookupCheck| '|coerce|
                                            (LIST '$
                                                  (LIST
                                                   '|UnivariatePuiseuxSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|))
                                            (|GeneralUnivariatePowerSeries|
                                             (ELT $ 7) |x| |a|)))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|GeneralUnivariatePowerSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |a|))
                                           |anyone|)))))))))
            (#21#
             (SEQ
              (LETT |any1|
                    (|AnyFunctions1|
                     (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| |a|))
                    . #15#)
              (EXIT
               (SPADCALL (CDR |ans|)
                         (|compiledLookupCheck| '|coerce|
                                                (LIST (LIST '|Any|)
                                                      (LIST
                                                       '|UnivariatePuiseuxSeries|
                                                       (|devaluate| (ELT $ 7))
                                                       |x| |a|))
                                                |any1|)))))))))) 

(SDEFUN |EXPR2UPS;series;SA;21| ((|x| |Symbol|) ($ |Any|))
        (SPROG
         ((|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |upxs|))
            (SIGNATURE |retractIfCan| ((|Union| |upxs| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|upxs| (|Any|)))))
          (|upxs|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x|
                                                           #1=(|Sel| FE
                                                               (|Zero|))))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| #1#))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|)))))
         (SEQ
          (LETT |upxs|
                (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                           (|spadConstant| $ 17))
                . #2=(|EXPR2UPS;series;SA;21|))
          (LETT |any1| (|AnyFunctions1| |upxs|) . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL (|spadConstant| $ 19) (|spadConstant| $ 41)
                      (|compiledLookupCheck| '|monomial|
                                             (LIST '$ (|devaluate| (ELT $ 7))
                                                   (LIST '|Fraction|
                                                         (LIST '|Integer|)))
                                             |upxs|))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|) (|devaluate| |upxs|))
                                   |any1|)))))) 

(SDEFUN |EXPR2UPS;series;FEA;22| ((|fcn| FE) ($ |Any|))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
                        |EXPR2UPS;series;FEA;22|))
                 (|error| "series: expression has no variables"))
                ((NULL (NULL (CDR |vars|)))
                 (|error| "series: expression has more than one variable"))
                ('T
                 (SPADCALL |fcn|
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |vars|) (QREFELT $ 11))
                            (|spadConstant| $ 17) (QREFELT $ 14))
                           (QREFELT $ 48)))))) 

(SDEFUN |EXPR2UPS;series;FEFA;23|
        ((|fcn| FE) (|n| |Fraction| (|Integer|)) ($ |Any|))
        (SPROG
         ((|series| (|upxs|))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |upxs|))
            (SIGNATURE |retractIfCan| ((|Union| |upxs| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|upxs| (|Any|)))))
          (|upxs|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x|
                                                           #1=(|Sel| FE
                                                               (|Zero|))))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| #1#))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|x| (|Symbol|)) (|vars| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((NULL
             (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
                   . #2=(|EXPR2UPS;series;FEFA;23|)))
            (|error| "series: expression has no variables"))
           ((NULL (NULL (CDR |vars|)))
            (|error| "series: expression has more than one variable"))
           ('T
            (SEQ (LETT |x| (|SPADfirst| |vars|) . #2#)
                 (LETT |upxs|
                       (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                                  (|spadConstant| $ 17))
                       . #2#)
                 (LETT |any1| (|AnyFunctions1| |upxs|) . #2#)
                 (LETT |series|
                       (SPADCALL
                        (SPADCALL |fcn|
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                            (|spadConstant| $ 17)
                                            (QREFELT $ 14))
                                  (QREFELT $ 48))
                        (|compiledLookupCheck| '|retract|
                                               (LIST (|devaluate| |upxs|)
                                                     (LIST '|Any|))
                                               |any1|))
                       . #2#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL |series| |n|
                             (|compiledLookupCheck| '|extend|
                                                    (LIST '$ '$
                                                          (LIST '|Fraction|
                                                                (LIST
                                                                 '|Integer|)))
                                                    |upxs|))
                   (|compiledLookupCheck| '|coerce|
                                          (LIST (LIST '|Any|)
                                                (|devaluate| |upxs|))
                                          |any1|))))))))) 

(SDEFUN |EXPR2UPS;series;FEEA;24| ((|fcn| FE) (|eq| |Equation| FE) ($ |Any|))
        (SPROG
         ((|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
                . #1=(|EXPR2UPS;series;FEEA;24|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|) . #1#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
                  (EXIT
                   (|EXPR2UPS;iSeries|
                    (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                    $))))))))) 

(SDEFUN |EXPR2UPS;series;FEEFA;25|
        ((|fcn| FE) (|eq| |Equation| FE) (|n| |Fraction| (|Integer|))
         ($ |Any|))
        (SPROG
         ((|series| (|UnivariatePuiseuxSeries| FE |x| |a|))
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #1=(|UnivariatePuiseuxSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #1# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#1# (|Any|)))))
          (|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
                . #2=(|EXPR2UPS;series;FEEFA;25|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|) . #2#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #2#)
                  (LETT |any1|
                        (|AnyFunctions1|
                         (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| |a|))
                        . #2#)
                  (LETT |series|
                        (SPADCALL
                         (|EXPR2UPS;iSeries|
                          (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x|
                          |a| $)
                         (|compiledLookupCheck| '|retract|
                                                (LIST
                                                 (LIST
                                                  '|UnivariatePuiseuxSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |a|)
                                                 (LIST '|Any|))
                                                |any1|))
                        . #2#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL |series| |n|
                              (|compiledLookupCheck| '|extend|
                                                     (LIST '$ '$
                                                           (LIST '|Fraction|
                                                                 (LIST
                                                                  '|Integer|)))
                                                     (|UnivariatePuiseuxSeries|
                                                      (ELT $ 7) |x| |a|)))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariatePuiseuxSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |a|))
                                           |any1|)))))))))) 

(DECLAIM (NOTINLINE |ExpressionToUnivariatePowerSeries;|)) 

(DEFUN |ExpressionToUnivariatePowerSeries| (&REST #1=#:G903)
  (SPROG NIL
         (PROG (#2=#:G904)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExpressionToUnivariatePowerSeries|)
                                               '|domainEqualList|)
                    . #3=(|ExpressionToUnivariatePowerSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ExpressionToUnivariatePowerSeries;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ExpressionToUnivariatePowerSeries|)))))))))) 

(DEFUN |ExpressionToUnivariatePowerSeries;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|ExpressionToUnivariatePowerSeries|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ExpressionToUnivariatePowerSeries| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 52) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ExpressionToUnivariatePowerSeries|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ExpressionToUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |zero?|) (|Symbol|) (5 . |coerce|) (10 . +) (|Equation| 7)
              (16 . =) (|Equation| $) (22 . |eval|) (28 . |Zero|) (32 . |One|)
              (36 . |One|) (|Any|) |EXPR2UPS;taylor;SA;3| (|List| 10)
              (40 . |variables|) |EXPR2UPS;taylor;FEEA;6|
              |EXPR2UPS;taylor;FEA;4| (45 . |Zero|) (|NonNegativeInteger|)
              |EXPR2UPS;taylor;FENniA;5| (49 . |lhs|) (|Union| 10 '"failed")
              (54 . |retractIfCan|) (59 . |rhs|) |EXPR2UPS;taylor;FEENniA;7|
              |EXPR2UPS;laurent;SA;9| |EXPR2UPS;laurent;FEEA;12|
              |EXPR2UPS;laurent;FEA;10| (|Integer|) |EXPR2UPS;laurent;FEIA;11|
              |EXPR2UPS;laurent;FEEIA;13| (|Fraction| 37) (64 . |One|)
              |EXPR2UPS;puiseux;SA;15| |EXPR2UPS;puiseux;FEEA;18|
              |EXPR2UPS;puiseux;FEA;16| |EXPR2UPS;puiseux;FEFA;17|
              |EXPR2UPS;puiseux;FEEFA;19| |EXPR2UPS;series;SA;21|
              |EXPR2UPS;series;FEEA;24| |EXPR2UPS;series;FEA;22|
              |EXPR2UPS;series;FEFA;23| |EXPR2UPS;series;FEEFA;25|)
           '#(|taylor| 68 |series| 97 |puiseux| 126 |laurent| 155) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(1 7 8 0 9 1 7 0 10 11 2 7 0
                                                   0 0 12 2 13 0 7 7 14 2 7 0 0
                                                   15 16 0 7 0 17 0 6 0 18 0 7
                                                   0 19 1 7 22 0 23 0 6 0 26 1
                                                   13 7 0 29 1 7 30 0 31 1 13 7
                                                   0 32 0 40 0 41 1 0 20 7 25 1
                                                   0 20 10 21 2 0 20 7 27 28 3
                                                   0 20 7 13 27 33 2 0 20 7 13
                                                   24 1 0 20 7 49 1 0 20 10 47
                                                   2 0 20 7 40 50 3 0 20 7 13
                                                   40 51 2 0 20 7 13 48 1 0 20
                                                   7 44 1 0 20 10 42 2 0 20 7
                                                   40 45 3 0 20 7 13 40 46 2 0
                                                   20 7 13 43 1 0 20 7 36 1 0
                                                   20 10 34 2 0 20 7 37 38 3 0
                                                   20 7 13 37 39 2 0 20 7 13
                                                   35)))))
           '|lookupComplete|)) 
