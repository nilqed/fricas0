
(PUT '|GSERIES;coerce;Ups$;1| '|SPADreplace| '(XLAM (|upxs|) |upxs|)) 

(SDEFUN |GSERIES;coerce;Ups$;1|
        ((|upxs| |UnivariatePuiseuxSeries| |Coef| |var| |cen|) ($ $)) |upxs|) 

(PUT '|GSERIES;puiseux| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |GSERIES;puiseux|
        ((|f| $) ($ |UnivariatePuiseuxSeries| |Coef| |var| |cen|)) |f|) 

(SDEFUN |GSERIES;differentiate;2$;3| ((|f| $) ($ $))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ
                (LETT |str1| "'differentiate' unavailable on this domain;  ")
                (LETT |str2| "use 'approximate' first")
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
            (SEQ (LETT |str1| "'differentiate' unavailable on this domain;  ")
                 (LETT |str2| "use 'approximate' first")
                 (EXIT (|error| (STRCONC |str1| |str2|)))))
           ('T
            (SEQ
             (LETT |dcds|
                   (SPADCALL (SPADCALL |f| (QREFELT $ 15)) |s| (QREFELT $ 16)))
             (LETT |deriv|
                   (SPADCALL
                    (SPADCALL (|GSERIES;puiseux| |f| $) (QREFELT $ 17))
                    (QREFELT $ 9)))
             (EXIT
              (SPADCALL
               (SPADCALL
                (CONS #'|GSERIES;differentiate;$S$;5!0| (VECTOR $ |s|)) |f|
                (QREFELT $ 19))
               (SPADCALL |dcds| |deriv| (QREFELT $ 20)) (QREFELT $ 21))))))))) 

(SDEFUN |GSERIES;differentiate;$S$;5!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |s| (QREFELT $ 16)))))) 

(SDEFUN |GSERIES;integrate;2$;6| ((|f| $) ($ $))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ (LETT |str1| "'integrate' unavailable on this domain;  ")
                    (LETT |str2| "use 'approximate' first")
                    (EXIT (|error| (STRCONC |str1| |str2|)))))) 

(SDEFUN |GSERIES;integrate;$V$;7| ((|f| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |f| (QREFELT $ 23))) 

(SDEFUN |GSERIES;integrate;$S$;8| ((|f| $) (|s| |Symbol|) ($ $))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ
                (COND
                 ((EQUAL |s| (SPADCALL |f| (QREFELT $ 14)))
                  (SEQ
                   (LETT |str1| "'integrate' unavailable on this domain;  ")
                   (LETT |str2| "use 'approximate' first")
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
          (LETT |s| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |s| (QREFELT $ 29)))))) 

(SDEFUN |GSERIES;integrateWithOneAnswer|
        ((|f| |Coef|) (|s| |Symbol|) ($ |Coef|))
        (SPROG ((|res| (|Union| |Coef| (|List| |Coef|))))
               (SEQ (LETT |res| (SPADCALL |f| |s| (QREFELT $ 33)))
                    (EXIT
                     (COND ((QEQCAR |res| 0) (QCDR |res|))
                           ('T (|SPADfirst| (QCDR |res|)))))))) 

(SDEFUN |GSERIES;integrate;$S$;10| ((|f| $) (|s| |Symbol|) ($ $))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ
                (COND
                 ((EQUAL |s| (SPADCALL |f| (QREFELT $ 14)))
                  (SEQ
                   (LETT |str1| "'integrate' unavailable on this domain;  ")
                   (LETT |str2| "use 'approximate' first")
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
          (LETT |s| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GSERIES;integrateWithOneAnswer| |x| |s| $))))) 

(DECLAIM (NOTINLINE |GeneralUnivariatePowerSeries;|)) 

(DEFUN |GeneralUnivariatePowerSeries| (&REST #1=#:G437)
  (SPROG NIL
         (PROG (#2=#:G438)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralUnivariatePowerSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GeneralUnivariatePowerSeries;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GeneralUnivariatePowerSeries|)))))))))) 

(DEFUN |GeneralUnivariatePowerSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G430 NIL) (#2=#:G431 NIL) (#3=#:G432 NIL) (#4=#:G433 NIL)
    (#5=#:G435 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|GeneralUnivariatePowerSeries| DV$1 DV$2 DV$3))
    (LETT $ (GETREFV 58))
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
                                                             '(|CommutativeRing|)))
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
                                                             '(|IntegralDomain|)))
                                        (OR #5# (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
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
                                              (|HasCategory| |#1| '(|Ring|)))
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
                                                             '(|AbelianGroup|)))
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
                                                                    |#1|)))))))))
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
              (|FunctionSpaceIntegration| 37 6) (90 . |integrate|) (|List| 35)
              (|NonNegativeInteger|) (|Fraction| 37) (|Integer|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 41) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $) (|Union| 41 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 47 '"failed")
              (|Factored| $) (|Stream| 6) (|Record| (|:| |k| 36) (|:| |c| 6))
              (|Stream| 51) (|PositiveInteger|) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(~= 96 |zero?| 102 |variable| 107 |unitNormal| 112 |unitCanonical|
              117 |unit?| 122 |truncate| 127 |terms| 140 |tanh| 145 |tan| 150
              |subtractIfCan| 155 |squareFreePart| 161 |squareFree| 166 |sqrt|
              171 |sizeLess?| 176 |sinh| 182 |sin| 187 |series| 192 |sech| 198
              |sec| 203 |sample| 208 |rightRecip| 212 |rightPower| 217 |rem|
              229 |reductum| 235 |recip| 240 |quo| 245 |principalIdeal| 251
              |prime?| 256 |pole?| 261 |pi| 266 |order| 270 |opposite?| 281
              |one?| 287 |nthRoot| 292 |multiplyExponents| 298 |multiEuclidean|
              310 |monomial?| 316 |monomial| 321 |map| 327 |log| 333
              |leftRecip| 338 |leftPower| 343 |leadingMonomial| 355
              |leadingCoefficient| 360 |lcmCoef| 365 |lcm| 371 |latex| 382
              |inv| 387 |integrate| 392 |hashUpdate!| 409 |hash| 415
              |gcdPolynomial| 420 |gcd| 426 |factor| 437 |extendedEuclidean|
              442 |extend| 455 |exquo| 461 |expressIdealMember| 467 |exp| 473
              |eval| 478 |euclideanSize| 484 |elt| 489 |divide| 501
              |differentiate| 507 |degree| 550 |csch| 555 |csc| 560 |coth| 565
              |cot| 570 |cosh| 575 |cos| 580 |complete| 585 |commutator| 590
              |coerce| 596 |coefficient| 631 |charthRoot| 637 |characteristic|
              642 |center| 646 |atanh| 651 |atan| 656 |associator| 661
              |associates?| 668 |asinh| 674 |asin| 679 |asech| 684 |asec| 689
              |approximate| 694 |antiCommutator| 700 |annihilate?| 706 |acsch|
              712 |acsc| 717 |acoth| 722 |acot| 727 |acosh| 732 |acos| 737 ^
              742 |Zero| 772 |One| 776 D 780 = 817 / 823 - 835 + 846 * 852)
           'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 6 0 6 0 6 6 0 6 15 6 14 6 1 2 9 4 3 14 15 7
                                  20 17 20 0 9 14 7 0 0 19 7 0 0 0 0 20 7 7 26
                                  25 17 17 0 0 24 17 0 0 0 14 7 0 0 0 5 19 14
                                  15 6 6 7 7 7 7 7 7))
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
                |Magma&| |AbelianSemiGroup&| |SetCategory&| NIL
                |TranscendentalFunctionCategory&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL NIL |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 36) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 36 (|SingletonAsOrderedSet|))
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 36) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 6)
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
                 (|SetCategory|) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 57) (|Eltable| $$ $$) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 57
                                  '(1 0 0 0 10 2 0 0 0 11 12 1 0 13 0 14 1 0 6
                                    0 15 2 6 0 0 13 16 1 5 0 0 17 2 0 0 18 0 19
                                    2 0 0 6 0 20 2 0 0 0 0 21 2 0 0 0 13 22 1 0
                                    0 0 23 2 0 0 0 11 24 1 6 25 0 26 2 25 27 13
                                    0 28 2 6 0 0 13 29 2 0 0 0 13 30 2 32 31 6
                                    13 33 2 0 27 0 0 1 1 32 27 0 1 1 0 13 0 14
                                    1 28 39 0 1 1 28 0 0 1 1 28 27 0 1 2 0 0 0
                                    36 1 3 0 0 0 36 36 1 1 0 52 0 1 1 7 0 0 1 1
                                    7 0 0 1 2 33 38 0 0 1 1 6 0 0 1 1 6 49 0 1
                                    1 7 0 0 1 2 6 27 0 0 1 1 7 0 0 1 1 7 0 0 1
                                    2 0 0 35 52 1 1 7 0 0 1 1 7 0 0 1 0 32 0 1
                                    1 30 38 0 1 2 30 0 0 35 1 2 0 0 0 53 1 2 6
                                    0 0 0 1 1 0 0 0 1 1 30 38 0 1 2 6 0 0 0 1 1
                                    6 42 41 1 1 6 27 0 1 1 0 27 0 1 0 7 0 1 1 0
                                    36 0 1 2 0 36 0 36 1 2 32 27 0 0 1 1 30 27
                                    0 1 2 7 0 0 37 1 2 0 0 0 36 1 2 0 0 0 53 1
                                    2 6 44 41 0 1 1 0 27 0 1 2 0 0 6 36 1 2 0 0
                                    18 0 19 1 7 0 0 1 1 30 38 0 1 2 30 0 0 35 1
                                    2 0 0 0 53 1 1 0 0 0 1 1 0 6 0 1 2 6 40 0 0
                                    1 1 6 0 41 1 2 6 0 0 0 1 1 0 54 0 1 1 6 0 0
                                    1 2 12 0 0 13 30 2 7 0 0 11 24 1 7 0 0 23 2
                                    0 56 56 0 1 1 0 55 0 1 2 6 43 43 43 1 2 6 0
                                    0 0 1 1 6 0 41 1 1 6 49 0 1 2 6 46 0 0 1 3
                                    6 48 0 0 0 1 2 0 0 0 36 1 2 28 38 0 0 1 2 6
                                    44 41 0 1 1 7 0 0 1 2 10 50 0 6 1 1 6 35 0
                                    1 2 5 0 0 0 1 2 0 6 0 36 1 2 6 45 0 0 1 2 4
                                    0 0 25 1 2 4 0 0 13 22 3 4 0 0 25 34 1 3 4
                                    0 0 13 35 1 1 3 0 0 10 2 3 0 0 35 1 2 0 0 0
                                    11 12 1 0 36 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0
                                    0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 0 0 0 1
                                    2 31 0 0 0 1 1 27 0 6 1 1 29 0 0 1 1 31 0
                                    37 1 1 7 0 36 1 1 0 0 11 1 1 0 0 5 9 1 0 57
                                    0 1 2 0 6 0 36 1 1 1 38 0 1 0 31 35 1 1 0 6
                                    0 15 1 7 0 0 1 1 7 0 0 1 3 31 0 0 0 0 1 2
                                    28 27 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1
                                    7 0 0 1 2 11 6 0 36 1 2 0 0 0 0 1 2 31 27 0
                                    0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1
                                    1 7 0 0 1 1 7 0 0 1 2 30 0 0 35 1 2 7 0 0
                                    36 1 2 7 0 0 0 1 2 6 0 0 37 1 2 0 0 0 53 1
                                    0 32 0 1 0 30 0 1 2 4 0 0 25 1 2 4 0 0 13 1
                                    3 4 0 0 25 34 1 3 4 0 0 13 35 1 1 3 0 0 1 2
                                    3 0 0 35 1 2 0 27 0 0 1 2 6 0 0 0 1 2 6 0 0
                                    6 1 1 34 0 0 1 2 34 0 0 0 21 2 0 0 0 0 1 2
                                    34 0 37 0 1 2 32 0 35 0 1 2 7 0 0 36 1 2 7
                                    0 36 0 1 2 0 0 0 6 1 2 0 0 6 0 20 2 0 0 0 0
                                    1 2 0 0 53 0 1)))))
           '|lookupComplete|)) 
