
(PUT '|GSERIES;coerce;Ups$;1| '|SPADreplace| '(XLAM (|upxs|) |upxs|)) 

(SDEFUN |GSERIES;coerce;Ups$;1|
        ((|upxs| |UnivariatePuiseuxSeries| |Coef| |var| |cen|) ($ $)) |upxs|) 

(PUT '|GSERIES;puiseux| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |GSERIES;puiseux|
        ((|f| $) ($ |UnivariatePuiseuxSeries| |Coef| |var| |cen|)) |f|) 

(SDEFUN |GSERIES;differentiate;2$;3| ((|f| $) ($ $))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ
                (LETT |str1| "'differentiate' unavailable on this domain;  "
                      . #1=(|GSERIES;differentiate;2$;3|))
                (LETT |str2| "use 'approximate' first" . #1#)
                (EXIT (|error| (STRCONC |str1| |str2|)))))) 

(SDEFUN |GSERIES;differentiate;$V$;4| ((|f| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |f| (QREFELT $ 10))) 

(SDEFUN |GSERIES;differentiate;$S$;5| ((|f| $) (|s| |Symbol|) ($ $))
        (SPROG
         ((|deriv| ($)) (|dcds| (|Coef|)) (|str2| (|String|))
          (|str1| (|String|)))
         (SEQ
          (COND
           ((EQUAL |s| (SPADCALL |f| (QREFELT $ 14)))
            (SEQ
             (LETT |str1| "'differentiate' unavailable on this domain;  "
                   . #1=(|GSERIES;differentiate;$S$;5|))
             (LETT |str2| "use 'approximate' first" . #1#)
             (EXIT (|error| (STRCONC |str1| |str2|)))))
           ('T
            (SEQ
             (LETT |dcds|
                   (SPADCALL (SPADCALL |f| (QREFELT $ 15)) |s| (QREFELT $ 16))
                   . #1#)
             (LETT |deriv|
                   (SPADCALL
                    (SPADCALL (|GSERIES;puiseux| |f| $) (QREFELT $ 17))
                    (QREFELT $ 9))
                   . #1#)
             (EXIT
              (SPADCALL
               (SPADCALL
                (CONS #'|GSERIES;differentiate;$S$;5!0| (VECTOR $ |s|)) |f|
                (QREFELT $ 19))
               (SPADCALL |dcds| |deriv| (QREFELT $ 20)) (QREFELT $ 21))))))))) 

(SDEFUN |GSERIES;differentiate;$S$;5!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|GSERIES;differentiate;$S$;5|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |s| (QREFELT $ 16)))))) 

(SDEFUN |GSERIES;integrate;2$;6| ((|f| $) ($ $))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ
                (LETT |str1| "'integrate' unavailable on this domain;  "
                      . #1=(|GSERIES;integrate;2$;6|))
                (LETT |str2| "use 'approximate' first" . #1#)
                (EXIT (|error| (STRCONC |str1| |str2|)))))) 

(SDEFUN |GSERIES;integrate;$V$;7| ((|f| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |f| (QREFELT $ 23))) 

(SDEFUN |GSERIES;integrate;$S$;8| ((|f| $) (|s| |Symbol|) ($ $))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ
                (COND
                 ((EQUAL |s| (SPADCALL |f| (QREFELT $ 14)))
                  (SEQ
                   (LETT |str1| "'integrate' unavailable on this domain;  "
                         . #1=(|GSERIES;integrate;$S$;8|))
                   (LETT |str2| "use 'approximate' first" . #1#)
                   (EXIT (|error| (STRCONC |str1| |str2|)))))
                 ((NULL
                   (SPADCALL |s|
                             (SPADCALL (SPADCALL |f| (QREFELT $ 15))
                                       (QREFELT $ 26))
                             (QREFELT $ 28)))
                  (SPADCALL (CONS #'|GSERIES;integrate;$S$;8!0| (VECTOR $ |s|))
                            |f| (QREFELT $ 19)))
                 ('T
                  (|error|
                   "integrate: center is a function of variable of integration")))))) 

(SDEFUN |GSERIES;integrate;$S$;8!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|GSERIES;integrate;$S$;8|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |s| (QREFELT $ 29)))))) 

(SDEFUN |GSERIES;integrateWithOneAnswer|
        ((|f| |Coef|) (|s| |Symbol|) ($ |Coef|))
        (SPROG ((|res| (|Union| |Coef| (|List| |Coef|))))
               (SEQ
                (LETT |res| (SPADCALL |f| |s| (QREFELT $ 33))
                      |GSERIES;integrateWithOneAnswer|)
                (EXIT
                 (COND ((QEQCAR |res| 0) (QCDR |res|))
                       ('T (|SPADfirst| (QCDR |res|)))))))) 

(SDEFUN |GSERIES;integrate;$S$;10| ((|f| $) (|s| |Symbol|) ($ $))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ
                (COND
                 ((EQUAL |s| (SPADCALL |f| (QREFELT $ 14)))
                  (SEQ
                   (LETT |str1| "'integrate' unavailable on this domain;  "
                         . #1=(|GSERIES;integrate;$S$;10|))
                   (LETT |str2| "use 'approximate' first" . #1#)
                   (EXIT (|error| (STRCONC |str1| |str2|)))))
                 ((NULL
                   (SPADCALL |s|
                             (SPADCALL (SPADCALL |f| (QREFELT $ 15))
                                       (QREFELT $ 26))
                             (QREFELT $ 28)))
                  (SPADCALL
                   (CONS #'|GSERIES;integrate;$S$;10!0| (VECTOR $ |s|)) |f|
                   (QREFELT $ 19)))
                 ('T
                  (|error|
                   "integrate: center is a function of variable of integration")))))) 

(SDEFUN |GSERIES;integrate;$S$;10!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|GSERIES;integrate;$S$;10|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GSERIES;integrateWithOneAnswer| |x| |s| $))))) 

(DECLAIM (NOTINLINE |GeneralUnivariatePowerSeries;|)) 

(DEFUN |GeneralUnivariatePowerSeries| (&REST #1=#:G783)
  (SPROG NIL
         (PROG (#2=#:G784)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralUnivariatePowerSeries|)
                                               '|domainEqualList|)
                    . #3=(|GeneralUnivariatePowerSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GeneralUnivariatePowerSeries;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GeneralUnivariatePowerSeries|)))))))))) 

(DEFUN |GeneralUnivariatePowerSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G774 NIL) (#2=#:G775 NIL) (#3=#:G776 NIL) (#4=#:G777 NIL)
    (#5=#:G778 NIL) (#6=#:G779 NIL) (#7=#:G781 NIL) ($ NIL) (|dv$| NIL)
    (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #8=(|GeneralUnivariatePowerSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #8#)
    (LETT DV$3 (|devaluate| |#3|) . #8#)
    (LETT |dv$| (LIST '|GeneralUnivariatePowerSeries| DV$1 DV$2 DV$3) . #8#)
    (LETT $ (GETREFV 61) . #8#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|))
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #8#)
                                        (OR #7#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|)))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|)))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|AlgebraicallyClosedFunctionSpace|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PrimitiveFunctionCategory|))
                                          (|HasCategory| |#1|
                                                         '(|TranscendentalFunctionCategory|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasSignature| |#1|
                                                          (LIST '|integrate|
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Symbol|))))
                                          (|HasSignature| |#1|
                                                          (LIST '|variables|
                                                                (LIST
                                                                 '(|List|
                                                                   (|Symbol|))
                                                                 (|devaluate|
                                                                  |#1|))))))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #8#)
                                        (OR #7# (|HasCategory| |#1| '(|Field|))
                                            #6#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              . #8#)
                                        (OR #5#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #8#)
                                        (OR #4#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #7# (|HasCategory| |#1| '(|Field|))
                                            #6# #4#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3# #1# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))))
                    . #8#))
    (|haddProp| |$ConstructorCache| '|GeneralUnivariatePowerSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #5#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #4#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR #3# (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR #2# (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR #1# (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 8589934592))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 10
                 (CONS (|dispatchFunction| |GSERIES;differentiate;2$;3|) $))
       (QSETREFV $ 12
                 (CONS (|dispatchFunction| |GSERIES;differentiate;$V$;4|) $))
       (COND
        ((|HasCategory| |#1| '(|PartialDifferentialRing| (|Symbol|)))
         (QSETREFV $ 22
                   (CONS (|dispatchFunction| |GSERIES;differentiate;$S$;5|)
                         $))))
       (QSETREFV $ 23 (CONS (|dispatchFunction| |GSERIES;integrate;2$;6|) $))
       (QSETREFV $ 24 (CONS (|dispatchFunction| |GSERIES;integrate;$V$;7|) $))
       (COND
        ((|HasSignature| |#1|
                         (LIST '|integrate|
                               (LIST (|devaluate| |#1|) (|devaluate| |#1|)
                                     '(|Symbol|))))
         (COND
          ((|HasSignature| |#1|
                           (LIST '|variables|
                                 (LIST '(|List| (|Symbol|))
                                       (|devaluate| |#1|))))
           (QSETREFV $ 30
                     (CONS (|dispatchFunction| |GSERIES;integrate;$S$;8|)
                           $))))))
       (COND
        ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
         (COND
          ((|HasCategory| |#1| '(|PrimitiveFunctionCategory|))
           (COND
            ((|HasCategory| |#1|
                            '(|AlgebraicallyClosedFunctionSpace| (|Integer|)))
             (PROGN
              (QSETREFV $ 30
                        (CONS (|dispatchFunction| |GSERIES;integrate;$S$;10|)
                              $))))))))))))
    $))) 

(MAKEPROP '|GeneralUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|UnivariatePuiseuxSeries| 6 7 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              |GSERIES;coerce;Ups$;1| (0 . |differentiate|) (|Variable| 7)
              (5 . |differentiate|) (|Symbol|) (11 . |variable|)
              (16 . |center|) (21 . |differentiate|) (27 . |differentiate|)
              (|Mapping| 6 6) (32 . |map|) (38 . *) (44 . -)
              (50 . |differentiate|) (56 . |integrate|) (61 . |integrate|)
              (|List| 13) (67 . |variables|) (|Boolean|) (72 . |entry?|)
              (78 . |integrate|) (84 . |integrate|) (|Union| 6 (|List| 6))
              (|FunctionSpaceIntegration| 37 6) (90 . |integrate|) (|List| 35)
              (|NonNegativeInteger|) (|Fraction| 37) (|Integer|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Union| 41 '"failed")
              (|Record| (|:| |coef| 41) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 46 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|Stream| 6) (|Record| (|:| |k| 36) (|:| |c| 6))
              (|Stream| 51) (|PositiveInteger|) (|List| 55)
              (|SingletonAsOrderedSet|) (|List| 36) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 96 |zero?| 102 |variables| 107 |variable| 112 |unitNormal| 117
              |unitCanonical| 122 |unit?| 127 |truncate| 132 |terms| 145 |tanh|
              150 |tan| 155 |subtractIfCan| 160 |squareFreePart| 166
              |squareFree| 171 |sqrt| 176 |sizeLess?| 181 |sinh| 187 |sin| 192
              |series| 197 |sech| 203 |sec| 208 |sample| 213 |rem| 217
              |reductum| 223 |recip| 228 |quo| 233 |principalIdeal| 239
              |prime?| 244 |pole?| 249 |pi| 254 |order| 258 |opposite?| 269
              |one?| 275 |nthRoot| 280 |multiplyExponents| 286 |multiEuclidean|
              298 |monomial?| 304 |monomial| 309 |map| 329 |log| 335
              |leadingMonomial| 340 |leadingCoefficient| 345 |lcmCoef| 350
              |lcm| 356 |latex| 367 |inv| 372 |integrate| 377 |hashUpdate!| 394
              |hash| 400 |gcdPolynomial| 405 |gcd| 411 |factor| 422
              |extendedEuclidean| 427 |extend| 440 |exquo| 446
              |expressIdealMember| 452 |exp| 458 |eval| 463 |euclideanSize| 469
              |elt| 474 |divide| 486 |differentiate| 492 |degree| 535 |csch|
              540 |csc| 545 |coth| 550 |cot| 555 |cosh| 560 |cos| 565
              |complete| 570 |coerce| 575 |coefficient| 610 |charthRoot| 616
              |characteristic| 621 |center| 625 |atanh| 630 |atan| 635
              |associates?| 640 |asinh| 646 |asin| 651 |asech| 656 |asec| 661
              |approximate| 666 |annihilate?| 672 |acsch| 678 |acsc| 683
              |acoth| 688 |acot| 693 |acosh| 698 |acos| 703 ^ 708 |Zero| 738
              |One| 742 D 746 = 783 / 789 - 801 + 812 * 818)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 6 0 6 0 6 6 0 6 15 6 9 15 6 7 1 2 9 4 3 15
                                  14 15 7 0 14 21 7 0 0 14 20 21 7 7 23 17 25 0
                                  17 27 0 0 0 7 0 0 0 5 19 14 15 6 6 7 7 7 7 7
                                  7))
            (CONS
             '#(NIL |Field&| |UnivariatePowerSeriesCategory&|
                |EuclideanDomain&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DivisionRing&| |Algebra&| |Algebra&| NIL |Algebra&| NIL
                NIL |Module&| |PartialDifferentialRing&| |DifferentialRing&|
                |Module&| NIL |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL
                NIL NIL NIL |Rng&| NIL NIL |AbelianGroup&| NIL NIL NIL
                |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                |SetCategory&| |TranscendentalFunctionCategory&| NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 36) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 36 55) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 36)
                 (|GcdDomain|) (|IntegralDomain|) (|DivisionRing|)
                 (|Algebra| 6) (|Algebra| $$) (|LeftOreRing|) (|Algebra| 36)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 13) (|DifferentialRing|)
                 (|Module| $$) (|CommutativeRing|) (|EntireRing|) (|Module| 36)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 36 36) (|LeftModule| 6) (|RightModule| 6)
                 (|RightModule| $$) (|LeftModule| $$) (|Rng|) (|LeftModule| 36)
                 (|RightModule| 36) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 60) (|Eltable| $$ $$) (|unitsKnown|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 60
                                  '(1 0 0 0 10 2 0 0 0 11 12 1 0 13 0 14 1 0 6
                                    0 15 2 6 0 0 13 16 1 5 0 0 17 2 0 0 18 0 19
                                    2 0 0 6 0 20 2 0 0 0 0 21 2 0 0 0 13 22 1 0
                                    0 0 23 2 0 0 0 11 24 1 6 25 0 26 2 25 27 13
                                    0 28 2 6 0 0 13 29 2 0 0 0 13 30 2 32 31 6
                                    13 33 2 0 27 0 0 1 1 34 27 0 1 1 0 54 0 1 1
                                    0 13 0 14 1 29 39 0 1 1 29 0 0 1 1 29 27 0
                                    1 2 0 0 0 36 1 3 0 0 0 36 36 1 1 0 52 0 1 1
                                    7 0 0 1 1 7 0 0 1 2 33 38 0 0 1 1 6 0 0 1 1
                                    6 49 0 1 1 7 0 0 1 2 6 27 0 0 1 1 7 0 0 1 1
                                    7 0 0 1 2 0 0 35 52 1 1 7 0 0 1 1 7 0 0 1 0
                                    34 0 1 2 6 0 0 0 1 1 0 0 0 1 1 30 38 0 1 2
                                    6 0 0 0 1 1 6 44 41 1 1 6 27 0 1 1 0 27 0 1
                                    0 7 0 1 1 0 36 0 1 2 0 36 0 36 1 2 34 27 0
                                    0 1 1 30 27 0 1 2 7 0 0 37 1 2 0 0 0 36 1 2
                                    0 0 0 53 1 2 6 43 41 0 1 1 0 27 0 1 3 0 0 0
                                    55 36 1 3 0 0 0 54 56 1 2 0 0 6 36 1 2 0 0
                                    18 0 19 1 7 0 0 1 1 0 0 0 1 1 0 6 0 1 2 6
                                    40 0 0 1 2 6 0 0 0 1 1 6 0 41 1 1 0 57 0 1
                                    1 6 0 0 1 2 12 0 0 13 30 2 7 0 0 11 24 1 7
                                    0 0 23 2 0 59 59 0 1 1 0 58 0 1 2 6 42 42
                                    42 1 2 6 0 0 0 1 1 6 0 41 1 1 6 49 0 1 3 6
                                    47 0 0 0 1 2 6 48 0 0 1 2 0 0 0 36 1 2 29
                                    38 0 0 1 2 6 43 41 0 1 1 7 0 0 1 2 10 50 0
                                    6 1 1 6 35 0 1 2 5 0 0 0 1 2 0 6 0 36 1 2 6
                                    45 0 0 1 2 4 0 0 13 22 2 4 0 0 25 1 3 4 0 0
                                    25 34 1 3 4 0 0 13 35 1 1 3 0 0 10 2 3 0 0
                                    35 1 2 0 0 0 11 12 1 0 36 0 1 1 7 0 0 1 1 7
                                    0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0
                                    1 1 0 0 0 1 1 28 0 6 1 1 31 0 37 1 1 29 0 0
                                    1 1 7 0 36 1 1 0 0 11 1 1 0 0 5 9 1 0 60 0
                                    1 2 0 6 0 36 1 1 1 38 0 1 0 31 35 1 1 0 6 0
                                    15 1 7 0 0 1 1 7 0 0 1 2 29 27 0 0 1 1 7 0
                                    0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 2 11 6 0
                                    36 1 2 31 27 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7
                                    0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 2 30 0
                                    0 35 1 2 7 0 0 36 1 2 7 0 0 0 1 2 6 0 0 37
                                    1 2 0 0 0 53 1 0 34 0 1 0 30 0 1 2 4 0 0 25
                                    1 2 4 0 0 13 1 3 4 0 0 25 34 1 3 4 0 0 13
                                    35 1 1 3 0 0 1 2 3 0 0 35 1 2 0 27 0 0 1 2
                                    6 0 0 0 1 2 6 0 0 6 1 2 32 0 0 0 21 1 32 0
                                    0 1 2 0 0 0 0 1 2 32 0 37 0 1 2 34 0 35 0 1
                                    2 7 0 0 36 1 2 7 0 36 0 1 2 0 0 6 0 20 2 0
                                    0 0 0 1 2 0 0 0 6 1 2 0 0 53 0 1)))))
           '|lookupComplete|)) 
