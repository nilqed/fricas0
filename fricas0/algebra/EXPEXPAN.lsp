
(PUT '|EXPEXPAN;coeff| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 0))) 

(SDEFUN |EXPEXPAN;coeff|
        ((|term| |Record|
          (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expon|
               (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expTerms|
               (|List|
                (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE)))))
         ($ |UnivariatePuiseuxSeries| FE |var| |cen|))
        (QVELT |term| 0)) 

(PUT '|EXPEXPAN;exponent| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 1))) 

(SDEFUN |EXPEXPAN;exponent|
        ((|term| |Record|
          (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expon|
               (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expTerms|
               (|List|
                (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE)))))
         ($ |ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
        (QVELT |term| 1)) 

(SDEFUN |EXPEXPAN;upxssingIfCan|
        ((|f| $)
         ($ |Union|
          (|UnivariatePuiseuxSeriesWithExponentialSingularity| R FE |var|
                                                               |cen|)
          "failed"))
        (COND
         ((SPADCALL (SPADCALL |f| (QREFELT $ 17)) (|spadConstant| $ 18)
                    (QREFELT $ 20))
          (CONS 0 (SPADCALL |f| (QREFELT $ 21))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |EXPEXPAN;retractIfCan;$U;4|
        ((|f| $)
         ($ |Union| (|UnivariatePuiseuxSeries| FE |var| |cen|) "failed"))
        (SPROG
         ((|fff| (|Union| (|UnivariatePuiseuxSeries| FE |var| |cen|) "failed"))
          (|ff|
           (|Union|
            (|UnivariatePuiseuxSeriesWithExponentialSingularity| R FE |var|
                                                                 |cen|)
            "failed")))
         (SEQ
          (LETT |ff| (|EXPEXPAN;upxssingIfCan| |f| $)
                . #1=(|EXPEXPAN;retractIfCan;$U;4|))
          (EXIT
           (COND ((QEQCAR |ff| 1) (CONS 1 "failed"))
                 (#2='T
                  (SEQ (LETT |fff| (SPADCALL (QCDR |ff|) (QREFELT $ 23)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |fff| 1) (CONS 1 "failed"))
                              (#2# (CONS 0 (QCDR |fff|)))))))))))) 

(SDEFUN |EXPEXPAN;/;2Upswes$;5|
        ((|f|
          . #1=(|UnivariatePuiseuxSeriesWithExponentialSingularity| R FE |var|
                                                                    |cen|))
         (|g| . #1#) ($ $))
        (SPROG
         ((|rec|
           (|Union|
            (|UnivariatePuiseuxSeriesWithExponentialSingularity| R FE |var|
                                                                 |cen|)
            "failed")))
         (SEQ
          (LETT |rec| (SPADCALL |g| (QREFELT $ 26)) |EXPEXPAN;/;2Upswes$;5|)
          (EXIT
           (COND ((QEQCAR |rec| 1) (SPADCALL |f| |g| (QREFELT $ 27)))
                 ('T
                  (SPADCALL |f| (SPADCALL (QCDR |rec|) (QREFELT $ 28))
                            (QREFELT $ 29)))))))) 

(SDEFUN |EXPEXPAN;/;3$;6| ((|f| $) (|g| $) ($ $))
        (SPROG
         ((|rec|
           (|Union|
            (|UnivariatePuiseuxSeriesWithExponentialSingularity| R FE |var|
                                                                 |cen|)
            "failed")))
         (SEQ
          (LETT |rec| (SPADCALL (SPADCALL |g| (QREFELT $ 21)) (QREFELT $ 26))
                |EXPEXPAN;/;3$;6|)
          (EXIT
           (COND ((QEQCAR |rec| 1) (SPADCALL |f| |g| (QREFELT $ 31)))
                 ('T
                  (SPADCALL
                   (SPADCALL (QCDR |rec|) (SPADCALL |g| (QREFELT $ 17))
                             (QREFELT $ 32))
                   |f| (QREFELT $ 29)))))))) 

(SDEFUN |EXPEXPAN;coerce;Ups$;7|
        ((|f| |UnivariatePuiseuxSeries| FE |var| |cen|) ($ $))
        (SPADCALL (SPADCALL |f| (QREFELT $ 35)) (QREFELT $ 28))) 

(SDEFUN |EXPEXPAN;seriesQuotientLimit|
        ((|num| |UnivariatePuiseuxSeries| FE |var| |cen|)
         (|den| |UnivariatePuiseuxSeries| FE |var| |cen|)
         ($ |Union| (|OrderedCompletion| FE) "failed"))
        (SPROG
         ((#1=#:G754 NIL) (|sig| (|Union| (|Integer|) "failed")) (|coef| (FE))
          (|ord| (|Fraction| (|Integer|)))
          (|series| (|UnivariatePuiseuxSeries| FE |var| |cen|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |series| (SPADCALL |num| |den| (QREFELT $ 37))
                  . #2=(|EXPEXPAN;seriesQuotientLimit|))
            (LETT |ord|
                  (SPADCALL |series| (|spadConstant| $ 38) (QREFELT $ 39))
                  . #2#)
            (EXIT
             (COND
              ((SPADCALL |ord| (|spadConstant| $ 41) (QREFELT $ 42))
               (CONS 0 (|spadConstant| $ 44)))
              (#3='T
               (SEQ
                (LETT |coef| (SPADCALL |series| |ord| (QREFELT $ 45)) . #2#)
                (EXIT
                 (COND
                  ((SPADCALL (QREFELT $ 8) (SPADCALL |coef| (QREFELT $ 47))
                             (QREFELT $ 49))
                   (CONS 1 "failed"))
                  ((SPADCALL |ord| (|spadConstant| $ 41) (QREFELT $ 50))
                   (CONS 0 (SPADCALL |coef| (QREFELT $ 51))))
                  (#3#
                   (SEQ (LETT |sig| (SPADCALL |coef| (QREFELT $ 54)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |sig| 1)
                           (PROGN
                            (LETT #1# (CONS 1 "failed") . #2#)
                            (GO #4=#:G753)))
                          ((EQL (QCDR |sig|) 1)
                           (CONS 0 (SPADCALL (QREFELT $ 55))))
                          (#3# (CONS 0 (SPADCALL (QREFELT $ 56))))))))))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPEXPAN;seriesQuotientInfinity|
        ((|num| |UnivariatePuiseuxSeries| FE |var| |cen|)
         (|den| |UnivariatePuiseuxSeries| FE |var| |cen|)
         ($ |Union| (|OrderedCompletion| FE) "failed"))
        (SPROG
         ((#1=#:G766 NIL) (|sig| (|Union| (|Integer|) "failed")) (|cc| (FE))
          (|denOrd| #2=(|Fraction| (|Integer|))) (|numOrd| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |numOrd| (SPADCALL |num| (QREFELT $ 15) (QREFELT $ 39))
                  . #3=(|EXPEXPAN;seriesQuotientInfinity|))
            (EXIT
             (COND
              ((SPADCALL |numOrd| (QREFELT $ 15) (QREFELT $ 50))
               (CONS 1 "failed"))
              (#4='T
               (SEQ
                (LETT |denOrd| (SPADCALL |den| (QREFELT $ 15) (QREFELT $ 39))
                      . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |denOrd| (QREFELT $ 15) (QREFELT $ 50))
                   (CONS 1 "failed"))
                  (#4#
                   (SEQ
                    (LETT |cc|
                          (SPADCALL (SPADCALL |num| |numOrd| (QREFELT $ 45))
                                    (SPADCALL |den| |denOrd| (QREFELT $ 45))
                                    (QREFELT $ 57))
                          . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL (QREFELT $ 8) (SPADCALL |cc| (QREFELT $ 47))
                                 (QREFELT $ 49))
                       (CONS 1 "failed"))
                      (#4#
                       (SEQ (LETT |sig| (SPADCALL |cc| (QREFELT $ 54)) . #3#)
                            (EXIT
                             (COND
                              ((QEQCAR |sig| 1)
                               (PROGN
                                (LETT #1# (CONS 1 "failed") . #3#)
                                (GO #5=#:G765)))
                              ((EQL (QCDR |sig|) 1)
                               (CONS 0 (SPADCALL (QREFELT $ 55))))
                              (#4#
                               (CONS 0
                                     (SPADCALL
                                      (QREFELT $ 56))))))))))))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |EXPEXPAN;limitPlus;$U;10|
        ((|f| $) ($ |Union| (|OrderedCompletion| FE) "failed"))
        (SPROG
         ((#1=#:G791 NIL) (|sig| (|Union| (|Integer|) "failed"))
          (|expCoef| (FE))
          (|exponDiff| (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|denCoef| #2=(|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|numCoef| #2#)
          (|denExpon|
           #3=(|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|numExpon| #3#) (|denType| #4=(|String|))
          (|denTerm|
           (|Record|
            (|:| |%term|
                 (|Record|
                  (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expon|
                       (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expTerms|
                       (|List|
                        (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                  (|:| |c| FE))))))
            (|:| |%type| (|String|))))
          (|denomTerm|
           #5=(|Union|
               (|Record|
                (|:| |%term|
                     (|Record|
                      (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                      (|:| |%expon|
                           (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                   |cen|))
                      (|:| |%expTerms|
                           (|List|
                            (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                      (|:| |c| FE))))))
                (|:| |%type| #4#))
               "failed"))
          (|numType| #4#)
          (|numTerm|
           (|Record|
            (|:| |%term|
                 (|Record|
                  (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expon|
                       (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expTerms|
                       (|List|
                        (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                  (|:| |c| FE))))))
            (|:| |%type| (|String|))))
          (|numerTerm| #5#)
          (|num|
           (|UnivariatePuiseuxSeriesWithExponentialSingularity| R FE |var|
                                                                |cen|))
          (|den|
           (|UnivariatePuiseuxSeriesWithExponentialSingularity| R FE |var|
                                                                |cen|)))
         (SEQ
          (EXIT
           (COND ((SPADCALL |f| (QREFELT $ 58)) (CONS 0 (|spadConstant| $ 44)))
                 (#6='T
                  (SEQ
                   (LETT |den| (SPADCALL |f| (QREFELT $ 17))
                         . #7=(|EXPEXPAN;limitPlus;$U;10|))
                   (EXIT
                    (COND
                     ((SPADCALL |den| (|spadConstant| $ 18) (QREFELT $ 20))
                      (SPADCALL (SPADCALL |f| (QREFELT $ 21)) (QREFELT $ 60)))
                     (#6#
                      (SEQ
                       (LETT |numerTerm|
                             (SPADCALL
                              (LETT |num| (SPADCALL |f| (QREFELT $ 21)) . #7#)
                              (QREFELT $ 65))
                             . #7#)
                       (EXIT
                        (COND ((QEQCAR |numerTerm| 1) (CONS 1 "failed"))
                              (#6#
                               (SEQ
                                (LETT |numType|
                                      (QCDR
                                       (LETT |numTerm| (QCDR |numerTerm|)
                                             . #7#))
                                      . #7#)
                                (LETT |denomTerm|
                                      (SPADCALL |den| (QREFELT $ 65)) . #7#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |denomTerm| 1) (CONS 1 "failed"))
                                  (#6#
                                   (SEQ
                                    (LETT |denType|
                                          (QCDR
                                           (LETT |denTerm| (QCDR |denomTerm|)
                                                 . #7#))
                                          . #7#)
                                    (LETT |numExpon|
                                          (|EXPEXPAN;exponent| (QCAR |numTerm|)
                                           $)
                                          . #7#)
                                    (LETT |denExpon|
                                          (|EXPEXPAN;exponent| (QCAR |denTerm|)
                                           $)
                                          . #7#)
                                    (LETT |numCoef|
                                          (|EXPEXPAN;coeff| (QCAR |numTerm|) $)
                                          . #7#)
                                    (LETT |denCoef|
                                          (|EXPEXPAN;coeff| (QCAR |denTerm|) $)
                                          . #7#)
                                    (EXIT
                                     (COND
                                      ((EQUAL |numType| "zero")
                                       (COND
                                        ((EQUAL |denType| "zero")
                                         (SEQ
                                          (LETT |exponDiff|
                                                (SPADCALL |numExpon| |denExpon|
                                                          (QREFELT $ 67))
                                                . #7#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |exponDiff|
                                                       (|spadConstant| $ 68)
                                                       (QREFELT $ 69))
                                             (|EXPEXPAN;seriesQuotientLimit|
                                              |numCoef| |denCoef| $))
                                            (#6#
                                             (SEQ
                                              (LETT |expCoef|
                                                    (SPADCALL |exponDiff|
                                                              (SPADCALL
                                                               |exponDiff|
                                                               (QREFELT $ 70))
                                                              (QREFELT $ 71))
                                                    . #7#)
                                              (LETT |sig|
                                                    (SPADCALL |expCoef|
                                                              (QREFELT $ 54))
                                                    . #7#)
                                              (EXIT
                                               (COND
                                                ((QEQCAR |sig| 1)
                                                 (PROGN
                                                  (LETT #1# (CONS 1 "failed")
                                                        . #7#)
                                                  (GO #8=#:G790)))
                                                ((EQL (QCDR |sig|) -1)
                                                 (CONS 0
                                                       (|spadConstant| $ 44)))
                                                (#6#
                                                 (|EXPEXPAN;seriesQuotientInfinity|
                                                  |numCoef| |denCoef|
                                                  $))))))))))
                                        (#6# (CONS 0 (|spadConstant| $ 44)))))
                                      ((EQUAL |numType| "series")
                                       (COND
                                        ((EQUAL |denType| "zero")
                                         (|EXPEXPAN;seriesQuotientInfinity|
                                          |numCoef| |denCoef| $))
                                        ((EQUAL |denType| "series")
                                         (|EXPEXPAN;seriesQuotientLimit|
                                          |numCoef| |denCoef| $))
                                        (#6# (CONS 0 (|spadConstant| $ 44)))))
                                      ((EQUAL |denType| "infinity")
                                       (SEQ
                                        (LETT |exponDiff|
                                              (SPADCALL |numExpon| |denExpon|
                                                        (QREFELT $ 67))
                                              . #7#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |exponDiff|
                                                     (|spadConstant| $ 68)
                                                     (QREFELT $ 69))
                                           (|EXPEXPAN;seriesQuotientLimit|
                                            |numCoef| |denCoef| $))
                                          (#6#
                                           (SEQ
                                            (LETT |expCoef|
                                                  (SPADCALL |exponDiff|
                                                            (SPADCALL
                                                             |exponDiff|
                                                             (QREFELT $ 70))
                                                            (QREFELT $ 71))
                                                  . #7#)
                                            (LETT |sig|
                                                  (SPADCALL |expCoef|
                                                            (QREFELT $ 54))
                                                  . #7#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |sig| 1)
                                               (PROGN
                                                (LETT #1# (CONS 1 "failed")
                                                      . #7#)
                                                (GO #8#)))
                                              ((EQL (QCDR |sig|) -1)
                                               (CONS 0 (|spadConstant| $ 44)))
                                              (#6#
                                               (|EXPEXPAN;seriesQuotientInfinity|
                                                |numCoef| |denCoef| $))))))))))
                                      (#6#
                                       (|EXPEXPAN;seriesQuotientInfinity|
                                        |numCoef| |denCoef|
                                        $))))))))))))))))))))
          #8# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |ExponentialExpansion;|)) 

(DEFUN |ExponentialExpansion| (&REST #1=#:G838)
  (SPROG NIL
         (PROG (#2=#:G839)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExponentialExpansion|)
                                               '|domainEqualList|)
                    . #3=(|ExponentialExpansion|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ExponentialExpansion;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ExponentialExpansion|)))))))))) 

(DEFUN |ExponentialExpansion;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G837 NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|ExponentialExpansion|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT DV$3 (|devaluate| |#3|) . #2#)
    (LETT DV$4 (|devaluate| |#4|) . #2#)
    (LETT |dv$| (LIST '|ExponentialExpansion| DV$1 DV$2 DV$3 DV$4) . #2#)
    (LETT $ (GETREFV 115) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|RetractableTo| (|Symbol|)))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|CharacteristicNonZero|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|CharacteristicZero|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|RealConstant|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|OrderedIntegralDomain|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|OrderedSet|))
                                        (OR
                                         (|HasCategory|
                                          (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                           |#1| |#2| |#3| |#4|)
                                          '(|OrderedIntegralDomain|))
                                         (|HasCategory|
                                          (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                           |#1| |#2| |#3| |#4|)
                                          '(|OrderedSet|)))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|RetractableTo| (|Integer|)))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|StepThrough|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         (LIST '|InnerEvalable| '(|Symbol|)
                                               (LIST
                                                '|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                (|devaluate| |#1|)
                                                (|devaluate| |#2|)
                                                (|devaluate| |#3|)
                                                (|devaluate| |#4|))))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         (LIST '|Evalable|
                                               (LIST
                                                '|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                (|devaluate| |#1|)
                                                (|devaluate| |#2|)
                                                (|devaluate| |#3|)
                                                (|devaluate| |#4|))))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         (LIST '|Eltable|
                                               (LIST
                                                '|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                (|devaluate| |#1|)
                                                (|devaluate| |#2|)
                                                (|devaluate| |#3|)
                                                (|devaluate| |#4|))
                                               (LIST
                                                '|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                (|devaluate| |#1|)
                                                (|devaluate| |#2|)
                                                (|devaluate| |#3|)
                                                (|devaluate| |#4|))))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|PartialDifferentialRing|
                                           (|Symbol|)))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|DifferentialRing|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|LinearlyExplicitOver| (|Integer|)))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|ConvertibleTo|
                                           (|Pattern| (|Float|))))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|ConvertibleTo|
                                           (|Pattern| (|Integer|))))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|PatternMatchable| (|Float|)))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|PatternMatchable| (|Integer|)))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|EuclideanDomain|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                          |#1| |#2| |#3| |#4|)
                                         '(|IntegerNumberSystem|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                |#1| |#2| |#3| |#4|)
                                               '(|Comparable|))
                                              . #2#)
                                        (OR #1#
                                            (|HasCategory|
                                             (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                              |#1| |#2| |#3| |#4|)
                                             '(|OrderedIntegralDomain|))
                                            (|HasCategory|
                                             (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                              |#1| |#2| |#3| |#4|)
                                             '(|OrderedSet|)))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|ExponentialExpansion|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND (|HasCategory| $ '(|CharacteristicNonZero|))
         (|HasCategory|
          (|UnivariatePuiseuxSeriesWithExponentialSingularity| |#1| |#2| |#3|
                                                               |#4|)
          '(|PolynomialFactorizationExplicit|))
         (|augmentPredVector| $ 33554432))
    (AND
     (OR
      (AND (|HasCategory| $ '(|CharacteristicNonZero|))
           (|HasCategory|
            (|UnivariatePuiseuxSeriesWithExponentialSingularity| |#1| |#2| |#3|
                                                                 |#4|)
            '(|PolynomialFactorizationExplicit|)))
      (|HasCategory|
       (|UnivariatePuiseuxSeriesWithExponentialSingularity| |#1| |#2| |#3|
                                                            |#4|)
       '(|CharacteristicNonZero|)))
     (|augmentPredVector| $ 67108864))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10
              (|Fraction|
               (|UnivariatePuiseuxSeriesWithExponentialSingularity| |#1| |#2|
                                                                    |#3|
                                                                    |#4|)))
    (QSETREFV $ 15 (SPADCALL 1000 1 (QREFELT $ 14)))
    $))) 

(MAKEPROP '|ExponentialExpansion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Fraction| 16) (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| (0 . |One|) (|Integer|)
              (|Fraction| 12) (4 . /) 'ZEROCOUNT
              (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8 9)
              (10 . |denom|) (15 . |One|) (|Boolean|) (19 . =) (25 . |numer|)
              (|Union| 34 '"failed") (30 . |retractIfCan|)
              |EXPEXPAN;retractIfCan;$U;4| (|Union| $ '"failed") (35 . |recip|)
              (40 . /) (46 . |coerce|) (51 . *) |EXPEXPAN;/;2Upswes$;5|
              (57 . /) (63 . *) |EXPEXPAN;/;3$;6|
              (|UnivariatePuiseuxSeries| 7 8 9) (69 . |coerce|)
              |EXPEXPAN;coerce;Ups$;7| (74 . /) (80 . |One|) (84 . |order|)
              (90 . |Zero|) (94 . |Zero|) (98 . >) (|OrderedCompletion| 7)
              (104 . |Zero|) (108 . |coefficient|) (|List| 48)
              (114 . |variables|) (|Symbol|) (119 . |member?|) (125 . =)
              (131 . |coerce|) (|Union| 12 '"failed")
              (|ElementaryFunctionSign| 6 7) (136 . |sign|)
              (141 . |plusInfinity|) (145 . |minusInfinity|) (149 . /)
              (155 . |zero?|) (|Union| 43 '"failed") (160 . |limitPlus|)
              (|Record| (|:| |k| 13) (|:| |c| 7))
              (|Record| (|:| |%coef| 34) (|:| |%expon| 66)
                        (|:| |%expTerms| (|List| 61)))
              (|Record| (|:| |%term| 62) (|:| |%type| 111))
              (|Union| 63 '"failed") (165 . |dominantTerm|)
              (|ExponentialOfUnivariatePuiseuxSeries| 7 8 9) (170 . -)
              (176 . |Zero|) (180 . =) (186 . |order|) (191 . |coefficient|)
              |EXPEXPAN;limitPlus;$U;10| (|Union| 83 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| 92) (|Pattern| 12)
              (|NonNegativeInteger|) (|List| 80) (|Equation| 16) (|List| 16)
              (|Record| (|:| |mat| 84) (|:| |vec| (|Vector| 12))) (|Vector| $)
              (|Matrix| 12) (|List| 78) (|PatternMatchResult| 92 $)
              (|PatternMatchResult| 12 $) (|Factored| 89)
              (|SparseUnivariatePolynomial| $) (|Union| 91 '#1#) (|List| 89)
              (|Float|) (|DoubleFloat|) (|Union| 13 '#2="failed")
              (|Union| 48 '#2#)
              (|Record| (|:| |mat| 97) (|:| |vec| (|Vector| 16))) (|Matrix| 16)
              (|Mapping| 16 16) (|Union| 16 '#2#) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 101 '#3="failed") (|Union| 104 '#3#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 104) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 197 |zero?| 203 |wholePart| 208 |unitNormal| 213
              |unitCanonical| 218 |unit?| 223 |subtractIfCan| 228
              |squareFreePolynomial| 234 |squareFreePart| 239 |squareFree| 244
              |solveLinearPolynomialEquation| 249 |smaller?| 255 |sizeLess?|
              261 |sign| 267 |sample| 272 |retractIfCan| 276 |retract| 301
              |rem| 326 |reducedSystem| 332 |recip| 354 |quo| 359
              |principalIdeal| 365 |prime?| 370 |positive?| 375 |patternMatch|
              380 |opposite?| 394 |one?| 400 |numerator| 405 |numer| 410
              |nextItem| 415 |negative?| 420 |multiEuclidean| 425 |min| 431
              |max| 437 |map| 443 |limitPlus| 449 |lcmCoef| 454 |lcm| 460
              |latex| 471 |inv| 476 |init| 481 |hashUpdate!| 485 |hash| 491
              |gcdPolynomial| 496 |gcd| 502 |fractionPart| 513 |floor| 518
              |factorSquareFreePolynomial| 523 |factorPolynomial| 528 |factor|
              533 |extendedEuclidean| 538 |exquo| 551 |expressIdealMember| 557
              |eval| 563 |euclideanSize| 603 |elt| 608 |divide| 614
              |differentiate| 620 |denominator| 670 |denom| 675 |convert| 680
              |conditionP| 705 |coerce| 710 |charthRoot| 745 |characteristic|
              750 |ceiling| 754 |associates?| 759 |annihilate?| 765 |abs| 771 ^
              776 |Zero| 794 |One| 798 D 802 >= 852 > 858 = 864 <= 870 < 876 /
              882 - 894 + 905 * 911)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 0 1 0 0 0 7 0 0 0 0 0 0 0 0 7 0 0 0 0 0 0
                                  3 4 15 16 17 0 0 0 0 7 0 0 0 0 0 0 0 7 0 7 0
                                  0 7 0 0 0 0 9 0 0 0 25 11 20 21 0 0 6 13 0 0
                                  0 0 0 0 0 0 0 0 2 5 6 6 8 10 10 12 13 14 18
                                  19))
            (CONS
             '#(|QuotientFieldCategory&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |DivisionRing&|
                NIL |FullyLinearlyExplicitOver&| |DifferentialExtension&|
                |Algebra&| |Algebra&| NIL |Algebra&| |OrderedRing&| NIL
                |Module&| |Module&| NIL |EntireRing&| |Module&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| NIL NIL |AbelianGroup&|
                NIL NIL NIL NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |OrderedSet&| |FullyEvalableOver&| |SemiGroup&|
                |AbelianSemiGroup&| NIL NIL NIL NIL NIL |SetCategory&| NIL
                |Evalable&| |RetractableTo&| NIL |RetractableTo&| NIL NIL NIL
                NIL NIL |BasicType&| NIL |RetractableTo&| NIL NIL NIL
                |PartialOrder&| |RetractableTo&| |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitOver|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|DifferentialExtension|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Algebra|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Algebra| 13) (|LeftOreRing|) (|Algebra| $$) (|OrderedRing|)
                 (|LinearlyExplicitOver|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Module|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Module| 13) (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|PartialDifferentialRing| 48) (|DifferentialRing|)
                 (|LinearlyExplicitOver| 12)
                 (|BiModule|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8 9)
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|BiModule| 13 13) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedAbelianGroup|)
                 (|RightModule|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|LeftModule|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|RightModule| 13) (|LeftModule| 13) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|OrderedAbelianSemiGroup|)
                 (|FullyPatternMatchable|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|OrderedSet|)
                 (|FullyEvalableOver|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Comparable|)
                 (|StepThrough|) (|PatternMatchable| 92)
                 (|PatternMatchable| 12)
                 (|Patternable|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|SetCategory|) (|RealConstant|)
                 (|Evalable|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|RetractableTo| (|UnivariatePuiseuxSeries| 7 8 9)) (|Type|)
                 (|RetractableTo|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 114) (|RetractableTo| 48)
                 (|ConvertibleTo| 75) (|ConvertibleTo| 93) (|ConvertibleTo| 92)
                 (|PartialOrder|) (|RetractableTo| 13) (|RetractableTo| 12)
                 (|InnerEvalable| 48
                                  (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                   6 7 8 9))
                 (|InnerEvalable|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8 9)
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Eltable|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8 9)
                  $$)
                 (|ConvertibleTo| 76) (|ConvertibleTo| 77))
              (|makeByteWordVec2| 114
                                  '(0 7 0 11 2 13 0 12 12 14 1 0 16 0 17 0 16 0
                                    18 2 16 19 0 0 20 1 0 16 0 21 1 16 22 0 23
                                    1 16 25 0 26 2 10 0 16 16 27 1 0 0 16 28 2
                                    0 0 16 0 29 2 10 0 0 0 31 2 16 0 0 0 32 1
                                    16 0 34 35 2 34 0 0 0 37 0 13 0 38 2 34 13
                                    0 13 39 0 7 0 40 0 13 0 41 2 13 19 0 0 42 0
                                    43 0 44 2 34 7 0 13 45 1 7 46 0 47 2 46 19
                                    48 0 49 2 13 19 0 0 50 1 43 0 7 51 1 53 52
                                    7 54 0 43 0 55 0 43 0 56 2 7 0 0 0 57 1 0
                                    19 0 58 1 16 59 0 60 1 16 64 0 65 2 66 0 0
                                    0 67 0 66 0 68 2 66 19 0 0 69 1 66 13 0 70
                                    2 66 7 0 13 71 2 0 19 0 0 1 1 0 19 0 58 1
                                    22 16 0 1 1 0 109 0 1 1 0 0 0 1 1 0 19 0 1
                                    2 0 25 0 0 1 1 1 88 89 1 1 0 0 0 1 1 0 100
                                    0 1 2 1 90 91 89 1 2 24 19 0 0 1 2 0 19 0 0
                                    1 1 7 12 0 1 0 0 0 1 1 10 52 0 1 1 10 94 0
                                    1 1 2 95 0 1 1 0 22 0 24 1 0 99 0 1 1 10 12
                                    0 1 1 10 13 0 1 1 2 48 0 1 1 0 34 0 1 1 0
                                    16 0 1 2 0 0 0 0 1 2 17 82 74 83 1 1 17 84
                                    74 1 2 0 96 74 83 1 1 0 97 74 1 1 0 25 0 1
                                    2 0 0 0 0 1 1 0 107 104 1 1 0 19 0 1 1 7 19
                                    0 1 3 20 86 0 76 86 1 3 21 87 0 77 87 1 2 0
                                    19 0 0 1 1 0 19 0 1 1 0 0 0 1 1 0 16 0 21 1
                                    11 25 0 1 1 7 19 0 1 2 0 103 104 0 1 2 8 0
                                    0 0 1 2 8 0 0 0 1 2 0 0 98 0 1 1 0 59 0 72
                                    2 0 108 0 0 1 2 0 0 0 0 1 1 0 0 104 1 1 0
                                    111 0 1 1 0 0 0 1 0 11 0 1 2 0 113 113 0 1
                                    1 0 112 0 1 2 0 89 89 89 1 2 0 0 0 0 1 1 0
                                    0 104 1 1 22 0 0 1 1 23 16 0 1 1 1 88 89 1
                                    1 1 88 89 1 1 0 100 0 1 3 0 102 0 0 0 1 2 0
                                    105 0 0 1 2 0 25 0 0 1 2 0 103 104 0 1 2 13
                                    0 0 79 1 3 13 0 0 16 16 1 2 13 0 0 80 1 3
                                    13 0 0 81 81 1 3 12 0 0 48 16 1 3 12 0 0 46
                                    81 1 1 0 78 0 1 2 14 0 0 16 1 2 0 106 0 0 1
                                    2 16 0 0 78 1 1 16 0 0 1 3 15 0 0 46 85 1 2
                                    15 0 0 46 1 3 15 0 0 48 78 1 2 15 0 0 48 1
                                    2 0 0 0 98 1 3 0 0 0 98 78 1 1 0 0 0 1 1 0
                                    16 0 17 1 5 75 0 1 1 18 76 0 1 1 19 77 0 1
                                    1 6 92 0 1 1 6 93 0 1 1 26 73 74 1 1 2 0 48
                                    1 1 0 0 34 36 1 0 0 16 28 1 0 0 13 1 1 0 0
                                    12 1 1 0 0 0 1 1 0 114 0 1 1 27 25 0 1 0 0
                                    78 1 1 23 16 0 1 2 0 19 0 0 1 2 0 19 0 0 1
                                    1 7 0 0 1 2 0 0 0 12 1 2 0 0 0 78 1 2 0 0 0
                                    110 1 0 0 0 1 0 0 0 1 2 16 0 0 78 1 1 16 0
                                    0 1 3 15 0 0 46 85 1 2 15 0 0 46 1 3 15 0 0
                                    48 78 1 2 15 0 0 48 1 2 0 0 0 98 1 3 0 0 0
                                    98 78 1 2 8 19 0 0 1 2 8 19 0 0 1 2 0 19 0
                                    0 1 2 8 19 0 0 1 2 8 19 0 0 1 2 0 0 16 16
                                    30 2 0 0 0 0 33 1 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 16 0 29 2 0 0 0 16 1 2 0 0 13 0
                                    1 2 0 0 0 13 1 2 0 0 12 0 1 2 0 0 0 0 1 2 0
                                    0 78 0 1 2 0 0 110 0 1)))))
           '|lookupComplete|)) 
