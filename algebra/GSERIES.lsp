
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

(DEFUN |GeneralUnivariatePowerSeries| (&REST #1=#:G785)
  (SPROG NIL
         (PROG (#2=#:G786)
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
   ((|pv$| NIL) (#1=#:G778 NIL) (#2=#:G779 NIL) (#3=#:G780 NIL) (#4=#:G781 NIL)
    (#5=#:G783 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|GeneralUnivariatePowerSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #6#)
    (LETT DV$3 (|devaluate| |#3|) . #6#)
    (LETT |dv$| (LIST '|GeneralUnivariatePowerSeries| DV$1 DV$2 DV$3) . #6#)
    (LETT $ (GETREFV 61) . #6#)
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
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #6#)
                                        (OR #5#
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
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #6#)
                                        (OR #5# (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              . #6#)
                                        (OR #3#
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
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #6#)
                                        (OR #2#
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
                                         #5# (|HasCategory| |#1| '(|Field|))
                                         #4# #2#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #6#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|GeneralUnivariatePowerSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 67108864))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR #1# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
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
           '#(NIL NIL NIL NIL NIL
              (|UnivariatePuiseuxSeries| 6 (NRTEVAL (QREFELT $ 7))
                                         (NRTEVAL (QREFELT $ 8)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              |GSERIES;coerce;Ups$;1| (0 . |differentiate|)
              (|Variable| (NRTEVAL (QREFELT $ 7))) (5 . |differentiate|)
              (|Symbol|) (11 . |variable|) (16 . |center|)
              (21 . |differentiate|) (27 . |differentiate|) (|Mapping| 6 6)
              (32 . |map|) (38 . *) (44 . -) (50 . |differentiate|)
              (56 . |integrate|) (61 . |integrate|) (|List| 13)
              (67 . |variables|) (|Boolean|) (72 . |entry?|) (78 . |integrate|)
              (84 . |integrate|) (|Union| 6 (|List| 6))
              (|FunctionSpaceIntegration| 37 6) (90 . |integrate|)
              (|NonNegativeInteger|) (|List| 34) (|Fraction| 37) (|Integer|)
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
              (|Stream| 51) (|PositiveInteger|) (|List| 56) (|List| 36)
              (|SingletonAsOrderedSet|) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(~= 96 |zero?| 102 |variables| 107 |variable| 112 |unitNormal| 117
              |unitCanonical| 122 |unit?| 127 |truncate| 132 |terms| 145 |tanh|
              150 |tan| 155 |subtractIfCan| 160 |squareFreePart| 166
              |squareFree| 171 |sqrt| 176 |sizeLess?| 181 |sinh| 187 |sin| 192
              |series| 197 |sech| 203 |sec| 208 |sample| 213 |rightRecip| 217
              |rightPower| 222 |rem| 234 |reductum| 240 |recip| 245 |quo| 250
              |principalIdeal| 256 |prime?| 261 |pole?| 266 |pi| 271 |order|
              275 |opposite?| 286 |one?| 292 |nthRoot| 297 |multiplyExponents|
              303 |multiEuclidean| 315 |monomial?| 321 |monomial| 326 |map| 346
              |log| 352 |leftRecip| 357 |leftPower| 362 |leadingMonomial| 374
              |leadingCoefficient| 379 |lcmCoef| 384 |lcm| 390 |latex| 401
              |inv| 406 |integrate| 411 |hashUpdate!| 428 |hash| 434
              |gcdPolynomial| 439 |gcd| 445 |factor| 456 |extendedEuclidean|
              461 |extend| 474 |exquo| 480 |expressIdealMember| 486 |exp| 492
              |eval| 497 |euclideanSize| 503 |elt| 508 |divide| 520
              |differentiate| 526 |degree| 569 |csch| 574 |csc| 579 |coth| 584
              |cot| 589 |cosh| 594 |cos| 599 |complete| 604 |commutator| 609
              |coerce| 615 |coefficient| 650 |charthRoot| 656 |characteristic|
              661 |center| 665 |atanh| 670 |atan| 675 |associator| 680
              |associates?| 687 |asinh| 693 |asin| 698 |asech| 703 |asec| 708
              |approximate| 713 |antiCommutator| 719 |annihilate?| 725 |acsch|
              731 |acsc| 736 |acoth| 741 |acot| 746 |acosh| 751 |acos| 756 ^
              761 |Zero| 791 |One| 795 D 799 = 836 / 842 - 854 + 865 * 871)
           'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 6 0 6 0 6 6 0 6 15 6 14 6 1 2 9 4 3 14 15 7
                                  20 17 20 0 9 14 7 0 0 19 7 0 0 0 0 20 7 7 26
                                  25 17 17 0 0 24 17 0 0 0 7 0 0 0 5 19 14 15 6
                                  6 7 7 7 7 7 7))
            (CONS
             '#(NIL |Field&| |UnivariatePowerSeriesCategory&|
                |EuclideanDomain&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL NIL NIL |DivisionRing&| NIL NIL |Algebra&|
                |PartialDifferentialRing&| |DifferentialRing&| |Algebra&|
                |EntireRing&| |Algebra&| NIL NIL |Rng&| NIL |Module&| |Module&|
                |Module&| NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |Magma&| |AbelianSemiGroup&| |SetCategory&|
                |TranscendentalFunctionCategory&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL NIL |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 36) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 36 56) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 36)
                 (|GcdDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|CommutativeRing|) (|DivisionRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6)
                 (|PartialDifferentialRing| 13) (|DifferentialRing|)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 36) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 6) (|Module| $$)
                 (|Module| 36) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|BiModule| 36 36) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| 36) (|RightModule| 36)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
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
                                    13 33 2 0 27 0 0 1 1 32 27 0 1 1 0 54 0 1 1
                                    0 13 0 14 1 28 39 0 1 1 28 0 0 1 1 28 27 0
                                    1 2 0 0 0 36 1 3 0 0 0 36 36 1 1 0 52 0 1 1
                                    7 0 0 1 1 7 0 0 1 2 33 38 0 0 1 1 6 0 0 1 1
                                    6 49 0 1 1 7 0 0 1 2 6 27 0 0 1 1 7 0 0 1 1
                                    7 0 0 1 2 0 0 34 52 1 1 7 0 0 1 1 7 0 0 1 0
                                    32 0 1 1 30 38 0 1 2 30 0 0 34 1 2 0 0 0 53
                                    1 2 6 0 0 0 1 1 0 0 0 1 1 30 38 0 1 2 6 0 0
                                    0 1 1 6 44 41 1 1 6 27 0 1 1 0 27 0 1 0 7 0
                                    1 1 0 36 0 1 2 0 36 0 36 1 2 32 27 0 0 1 1
                                    30 27 0 1 2 7 0 0 37 1 2 0 0 0 36 1 2 0 0 0
                                    53 1 2 6 43 41 0 1 1 0 27 0 1 3 0 0 0 54 55
                                    1 3 0 0 0 56 36 1 2 0 0 6 36 1 2 0 0 18 0
                                    19 1 7 0 0 1 1 30 38 0 1 2 30 0 0 34 1 2 0
                                    0 0 53 1 1 0 0 0 1 1 0 6 0 1 2 6 40 0 0 1 2
                                    6 0 0 0 1 1 6 0 41 1 1 0 57 0 1 1 6 0 0 1 2
                                    12 0 0 13 30 2 7 0 0 11 24 1 7 0 0 23 2 0
                                    59 59 0 1 1 0 58 0 1 2 6 42 42 42 1 1 6 0
                                    41 1 2 6 0 0 0 1 1 6 49 0 1 3 6 47 0 0 0 1
                                    2 6 48 0 0 1 2 0 0 0 36 1 2 28 38 0 0 1 2 6
                                    43 41 0 1 1 7 0 0 1 2 10 50 0 6 1 1 6 34 0
                                    1 2 5 0 0 0 1 2 0 6 0 36 1 2 6 45 0 0 1 2 4
                                    0 0 13 22 3 4 0 0 13 34 1 2 4 0 0 25 1 3 4
                                    0 0 25 35 1 1 3 0 0 10 2 3 0 0 34 1 2 0 0 0
                                    11 12 1 0 36 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0
                                    0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 0 0 0 1
                                    2 31 0 0 0 1 1 27 0 6 1 1 29 0 0 1 1 31 0
                                    37 1 1 7 0 36 1 1 0 0 11 1 1 0 0 5 9 1 0 60
                                    0 1 2 0 6 0 36 1 1 1 38 0 1 0 31 34 1 1 0 6
                                    0 15 1 7 0 0 1 1 7 0 0 1 3 31 0 0 0 0 1 2
                                    28 27 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1
                                    7 0 0 1 2 11 6 0 36 1 2 0 0 0 0 1 2 31 27 0
                                    0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1
                                    1 7 0 0 1 1 7 0 0 1 2 30 0 0 34 1 2 7 0 0
                                    36 1 2 7 0 0 0 1 2 6 0 0 37 1 2 0 0 0 53 1
                                    0 32 0 1 0 30 0 1 2 4 0 0 13 1 2 4 0 0 25 1
                                    3 4 0 0 25 35 1 3 4 0 0 13 34 1 1 3 0 0 1 2
                                    3 0 0 34 1 2 0 27 0 0 1 2 6 0 0 0 1 2 6 0 0
                                    6 1 2 34 0 0 0 21 1 34 0 0 1 2 0 0 0 0 1 2
                                    34 0 37 0 1 2 32 0 34 0 1 2 7 0 36 0 1 2 7
                                    0 0 36 1 2 0 0 0 6 1 2 0 0 6 0 20 2 0 0 0 0
                                    1 2 0 0 53 0 1)))))
           '|lookupComplete|)) 
