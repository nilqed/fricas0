
(SDEFUN |JBP;jetVariables;$L;1| ((|p| $) ($ |List| JB))
        (SPADCALL |p| (QREFELT $ 10))) 

(SDEFUN |JBP;subst;$JB2$;2| ((|p| $) (|jv| JB) (|exp| $) ($ $))
        (SPADCALL |p| |jv| |exp| (QREFELT $ 12))) 

(PUT '|JBP;numerator;2$;3| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |JBP;numerator;2$;3| ((|l| $) ($ $)) |l|) 

(SDEFUN |JBP;denominator;2$;4| ((|l| $) ($ $)) (|spadConstant| $ 15)) 

(SDEFUN |JBP;solveFor;$JBU;5| ((|p| $) (|jv| JB) ($ |Union| $ "failed"))
        (SPROG ((|cc| (R)) (|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |p| |jv| (QREFELT $ 17))
                      . #1=(|JBP;solveFor;$JBU;5|))
                (EXIT
                 (COND
                  ((SPADCALL |c| (QREFELT $ 19))
                   (SEQ (LETT |cc| (SPADCALL |c| (QREFELT $ 20)) . #1#)
                        (EXIT
                         (CONS 0
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 15) |cc|
                                           (QREFELT $ 22))
                                 |p| (QREFELT $ 23))
                                (SPADCALL |jv| (QREFELT $ 24))
                                (QREFELT $ 25))))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |JBP;solveFor;$JBU;6| ((|p| $) (|jv| JB) ($ |Union| $ "failed"))
        (SPROG ((|rc| (|Union| R "failed")) (|cc| (R)) (|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |p| |jv| (QREFELT $ 17))
                      . #1=(|JBP;solveFor;$JBU;6|))
                (EXIT
                 (COND
                  ((SPADCALL |c| (QREFELT $ 19))
                   (SEQ (LETT |cc| (SPADCALL |c| (QREFELT $ 20)) . #1#)
                        (LETT |rc| (SPADCALL |cc| (QREFELT $ 28)) . #1#)
                        (EXIT
                         (COND ((QEQCAR |rc| 1) (CONS 1 "failed"))
                               (#2='T
                                (CONS 0
                                      (SPADCALL
                                       (SPADCALL (QCDR |rc|) |p|
                                                 (QREFELT $ 29))
                                       (SPADCALL |jv| (QREFELT $ 24))
                                       (QREFELT $ 25))))))))
                  (#2# (CONS 1 "failed"))))))) 

(SDEFUN |JBP;groebner;2L;7| ((|lp| |List| $) ($ |List| $))
        (SPROG
         ((LJV (|List| JB)) (|lj| (|List| (|List| JB))) (#1=#:G733 NIL)
          (|p| NIL) (#2=#:G732 NIL))
         (SEQ (SPADCALL "groebner" (QREFELT $ 32))
              (LETT |lj|
                    (PROGN
                     (LETT #2# NIL . #3=(|JBP;groebner;2L;7|))
                     (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 11)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (LETT LJV (SPADCALL (ELT $ 33) |lj| NIL (QREFELT $ 36)) . #3#)
              (SPADCALL
               (SPADCALL "LJV" (SPADCALL LJV (QREFELT $ 37)) (QREFELT $ 38))
               (QREFELT $ 32))
              (EXIT
               (SPADCALL |lp|
                         (|compiledLookupCheck| '|groebner|
                                                (LIST
                                                 (LIST '|List| (|devaluate| $))
                                                 (LIST '|List|
                                                       (|devaluate| $)))
                                                (|JetGroebner| (ELT $ 6)
                                                               (ELT $ 7) LJV $
                                                               (|DirectProduct|
                                                                (|#| LJV)
                                                                (|NonNegativeInteger|))))))))) 

(DECLAIM (NOTINLINE |JetBundlePolynomial;|)) 

(DEFUN |JetBundlePolynomial| (&REST #1=#:G790)
  (SPROG NIL
         (PROG (#2=#:G791)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetBundlePolynomial|)
                                               '|domainEqualList|)
                    . #3=(|JetBundlePolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetBundlePolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundlePolynomial|)))))))))) 

(DEFUN |JetBundlePolynomial;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G789 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|JetBundlePolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|JetBundlePolynomial| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 90) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Float|))))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Float|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory| |#2|
                                                        '(|PatternMatchable|
                                                          (|Integer|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Float|)))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory| |#2|
                                                        '(|PatternMatchable|
                                                          (|Float|))))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|Field|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #2#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #1#
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #1#
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #1#
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #1#
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|JetBundlePolynomial| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| $ '(|CharacteristicNonZero|))
         (|augmentPredVector| $ 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
              (|HasCategory| $ '(|CharacteristicNonZero|))))
     (|augmentPredVector| $ 268435456))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 536870912))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|SparseMultivariatePolynomial| |#1| |#2|))
    (COND
     ((|testBitVector| |pv$| 21)
      (QSETREFV $ 27 (CONS (|dispatchFunction| |JBP;solveFor;$JBU;5|) $)))
     ('T (QSETREFV $ 27 (CONS (|dispatchFunction| |JBP;solveFor;$JBU;6|) $))))
    (COND
     ((|testBitVector| |pv$| 22)
      (QSETREFV $ 40 (CONS (|dispatchFunction| |JBP;groebner;2L;7|) $))))
    $))) 

(MAKEPROP '|JetBundlePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (|List| 7) (0 . |variables|)
              |JBP;jetVariables;$L;1| (5 . |eval|) |JBP;subst;$JB2$;2|
              |JBP;numerator;2$;3| (12 . |One|) |JBP;denominator;2$;4|
              (16 . |differentiate|) (|Boolean|) (22 . |ground?|)
              (27 . |retract|) (32 . |One|) (36 . /) (42 . *) (48 . |coerce|)
              (53 . -) (|Union| $ '"failed") (59 . |solveFor|) (65 . |recip|)
              (70 . *) (|Void|) (|OutputForm|) (76 . |print|) (81 . |setUnion|)
              (|Mapping| 9 9 9) (|List| 9) (87 . |reduce|) (94 . |coerce|)
              (99 . |assign|) (|List| $) (105 . |groebner|)
              (|Union| 50 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 59)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 59 $)
              (|Matrix| 59) (|Record| (|:| |mat| 48) (|:| |vec| (|Vector| 59)))
              (|Vector| $) (|Fraction| 59) (|NonNegativeInteger|)
              (|Factored| $) (|Union| 55 '#1#) (|List| 56)
              (|SparseUnivariatePolynomial| $) (|Factored| 56)
              (|Union| 51 '#2="failed") (|Integer|) (|Union| 59 '#2#)
              (|IndexedExponents| 7)
              (|Record| (|:| |mat| 63) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|List| 52)
              (|Record| (|:| |var| 7) (|:| |exponent| 52))
              (|Union| 66 '#3="failed") (|Union| 39 '#3#) (|List| 70)
              (|Equation| $) (|Mapping| 6 6) (|Union| 6 '#2#) (|List| 6)
              (|Mapping| 61 61) (|Union| 7 '"failed")
              (|SparseUnivariatePolynomial| 6) (|Union| '"failed" (|List| 65))
              (|Record| (|:| |Sys| 39) (|:| JM 79) (|:| |Depend| 77))
              (|SparseEchelonMatrix| 7 $)
              (|Record| (|:| |DSys| 39) (|:| |JVars| 35)) (|PositiveInteger|)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 9)) (|Symbol|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 83) (|String|) (|SingleInteger|) (|HashState|))
           '#(|variables| 110 |subst| 115 |solveFor| 122 |retract| 128
              |numerator| 133 |jetVariables| 138 |ground?| 143 |groebner| 148
              |eval| 153 |differentiate| 160 |denominator| 166 |coerce| 171
              |One| 176 / 180 - 186 * 192)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 10 0 0 10 0 0 0 0 0 1 23 8 0 0 0 0 1 2 3
                                  23 8 9 8 0 0 0 1 0 0 0 0 0 1 1 0 0 0 0 0 0 0
                                  0 7 24 25 0 0 12 0 0 0 0 0 0 0 0 0 0 4 5 6 26
                                  27 11 12))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |JetBundleFunctionCategory&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&|
                |AbelianMonoidRing&| |GcdDomain&| NIL NIL |Algebra&| |Algebra&|
                |Algebra&| |FullyLinearlyExplicitOver&|
                |PartialDifferentialRing&| |EntireRing&| |Module&| NIL
                |Module&| NIL NIL |Module&| NIL NIL |PartialDifferentialRing&|
                NIL NIL |Ring&| NIL NIL NIL NIL NIL |Rng&| NIL NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL
                |FullyRetractableTo&| |SetCategory&| |Evalable&| NIL
                |InnerEvalable&| |InnerEvalable&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL |BasicType&| NIL |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|)
             (CONS
              '#((|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|JetBundleFunctionCategory| 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|GcdDomain|)
                 (|IntegralDomain|) (|LeftOreRing|) (|Algebra| $$)
                 (|Algebra| 51) (|Algebra| 6) (|FullyLinearlyExplicitOver| 6)
                 (|PartialDifferentialRing| 83) (|EntireRing|) (|Module| $$)
                 (|CommutativeRing|) (|Module| 51) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 59) (|PartialDifferentialRing| 7)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 51 51) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| $$) (|RightModule| $$) (|Rng|) (|LeftModule| 51)
                 (|RightModule| 51) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 59) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|Evalable| $$)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 7 $$)
                 (|InnerEvalable| 7 6) (|RetractableTo| 6) (|RetractableTo| 7)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 31) (|RetractableTo| 51)
                 (|RetractableTo| 59) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 44) (|ConvertibleTo| 45) (|ConvertibleTo| 43)
                 (|InnerEvalable| $$ $$))
              (|makeByteWordVec2| 40
                                  '(1 0 9 0 10 3 0 0 0 7 0 12 0 0 0 15 2 0 0 0
                                    7 17 1 0 18 0 19 1 0 6 0 20 0 6 0 21 2 0 0
                                    0 6 22 2 0 0 0 0 23 1 0 0 7 24 2 0 0 0 0 25
                                    2 0 26 0 7 27 1 6 26 0 28 2 0 0 6 0 29 1 31
                                    30 0 32 2 9 0 0 0 33 3 35 9 34 0 9 36 1 9
                                    31 0 37 2 31 0 0 0 38 1 0 39 39 40 1 0 9 0
                                    10 3 0 0 0 7 0 13 2 0 26 0 7 27 1 0 6 0 20
                                    1 0 0 0 14 1 0 9 0 11 1 0 18 0 19 1 22 39
                                    39 40 3 0 0 0 7 0 12 2 0 0 0 7 17 1 0 0 0
                                    16 1 0 0 7 24 0 0 0 15 2 21 0 0 6 22 2 0 0
                                    0 0 25 2 0 0 6 0 29 2 0 0 0 0 23)))))
           '|lookupIncomplete|)) 
