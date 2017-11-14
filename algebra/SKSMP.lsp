
(SDEFUN |SKSMP;D;Var$;1| ((|v| |Var|) ($ $))
        (SPADCALL (|spadConstant| $ 10) |v| 1 (QREFELT $ 13))) 

(SDEFUN |SKSMP;Delta;S$;2| ((|s| |Symbol|) ($ $))
        (SPROG ((|vu| (|Union| |Var| "failed")))
               (SEQ
                (LETT |vu| (SPADCALL |s| (QREFELT $ 17)) |SKSMP;Delta;S$;2|)
                (EXIT
                 (COND ((QEQCAR |vu| 1) (|error| "missing variable"))
                       ('T (SPADCALL (QCDR |vu|) (QREFELT $ 14)))))))) 

(SDEFUN |SKSMP;lift_map| ((|f| |Mapping| R R) ($ |Mapping| $ $))
        (SPROG NIL (CONS #'|SKSMP;lift_map!0| (VECTOR $ |f|)))) 

(SDEFUN |SKSMP;lift_map!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|SKSMP;lift_map|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f| |x| (QREFELT $ 28)))))) 

(SDEFUN |SKSMP;lift_morphism| ((|m| |Automorphism| R) ($ |Automorphism| $))
        (SPROG NIL
               (SPADCALL
                (|SKSMP;lift_map|
                 (CONS #'|SKSMP;lift_morphism!0| (VECTOR $ |m|)) $)
                (|SKSMP;lift_map|
                 (CONS #'|SKSMP;lift_morphism!1| (VECTOR $ |m|)) $)
                (QREFELT $ 32)))) 

(SDEFUN |SKSMP;lift_morphism!1| ((|x| NIL) ($$ NIL))
        (PROG (|m| $)
          (LETT |m| (QREFELT $$ 1) . #1=(|SKSMP;lift_morphism|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |m| (QREFELT $ 31)) |x| (QREFELT $ 30)))))) 

(SDEFUN |SKSMP;lift_morphism!0| ((|x| NIL) ($$ NIL))
        (PROG (|m| $)
          (LETT |m| (QREFELT $$ 1) . #1=(|SKSMP;lift_morphism|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |m| |x| (QREFELT $ 30)))))) 

(SDEFUN |SKSMP;*;3$;5| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|ru| (|Upol|)) (|yu| (|Upol|)) (|xu| (|Upol|)) (|v| (|Var|))
          (#1=#:G731 NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 34))
            (SPADCALL (SPADCALL |x| (QREFELT $ 35)) |y| (QREFELT $ 36)))
           ('T
            (SEQ
             (LETT |v|
                   (PROG2
                       (LETT #1# (SPADCALL |x| (QREFELT $ 38))
                             . #2=(|SKSMP;*;3$;5|))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                     (|Union| (QREFELT $ 7) "failed") #1#))
                   . #2#)
             (LETT |xu| (SPADCALL |x| |v| (QREFELT $ 40)) . #2#)
             (LETT |yu| (SPADCALL |y| |v| (QREFELT $ 40)) . #2#)
             (LETT |ru|
                   (SPADCALL |xu| |yu|
                             (|SKSMP;lift_morphism|
                              (SPADCALL |v| (QREFELT $ 8)) $)
                             (|SKSMP;lift_map| (SPADCALL |v| (QREFELT $ 9)) $)
                             (QREFELT $ 42))
                   . #2#)
             (EXIT (SPADCALL |ru| |v| (QREFELT $ 43))))))))) 

(SDEFUN |SKSMP;*;$R$;6| ((|x| $) (|r| R) ($ $))
        (SPADCALL |x| (SPADCALL |r| (QREFELT $ 45)) (QREFELT $ 44))) 

(SDEFUN |SKSMP;exquo;2$U;7| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG
         ((|res| ($)) (|cc| ($)) (#1=#:G754 NIL)
          (|cu| (|Union| (|SparseMultivariatePolynomial| R |Var|) "failed"))
          (|lx| (|SparseMultivariatePolynomial| R |Var|)) (|lx1| ($))
          (|ly| (|SparseMultivariatePolynomial| R |Var|))
          (|maxd| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |y| (QREFELT $ 34))
             (SPADCALL |x| (SPADCALL |y| (QREFELT $ 35)) (QREFELT $ 47)))
            ((SPADCALL |x| (QREFELT $ 34)) (CONS 1 "failed"))
            ('T
             (SEQ
              (LETT |maxd| (SPADCALL |x| (QREFELT $ 48))
                    . #2=(|SKSMP;exquo;2$U;7|))
              (LETT |ly| (SPADCALL |y| (QREFELT $ 49)) . #2#)
              (LETT |res| (|spadConstant| $ 25) . #2#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |x| (|spadConstant| $ 25) (QREFELT $ 51)))
                     (GO G191)))
                   (SEQ (LETT |lx1| (SPADCALL |x| (QREFELT $ 49)) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |lx1| (QREFELT $ 48)) |maxd|
                                     (QREFELT $ 52))
                           (PROGN
                            (LETT #1# (CONS 1 "failed") . #2#)
                            (GO #3=#:G753)))
                          ('T
                           (SEQ (LETT |lx| |lx1| . #2#)
                                (LETT |cu| (SPADCALL |lx| |ly| (QREFELT $ 53))
                                      . #2#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |cu| 1)
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #2#)
                                    (GO #3#)))
                                  ('T
                                   (SEQ (LETT |cc| (QCDR |cu|) . #2#)
                                        (LETT |res|
                                              (SPADCALL |res| |cc|
                                                        (QREFELT $ 54))
                                              . #2#)
                                        (EXIT
                                         (LETT |x|
                                               (SPADCALL |x|
                                                         (SPADCALL |cc| |y|
                                                                   (QREFELT $
                                                                            44))
                                                         (QREFELT $ 55))
                                               . #2#)))))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 |res|))))))
          #3# (EXIT #1#)))) 

(SDEFUN |SKSMP;^;$Pi$;8| ((|x| $) (|n| |PositiveInteger|) ($ $))
        (SPROG ((|res| ($)) (#1=#:G760 NIL) (|i| NIL))
               (SEQ (LETT |res| |x| . #2=(|SKSMP;^;$Pi$;8|))
                    (SEQ (LETT |i| 2 . #2#) (LETT #1# |n| . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res| (SPADCALL |res| |x| (QREFELT $ 44))
                                 . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SKSMP;^;$Nni$;9| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 10))
              ('T (SPADCALL |x| |n| (QREFELT $ 58))))) 

(SDEFUN |SKSMP;coerce;$Of;10| ((|x| $) ($ |OutputForm|))
        (SPROG ((|xu| (|Upol|)) (|v| (|Var|)) (#1=#:G763 NIL))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 34))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 35)) (QREFELT $ 61)))
                 ('T
                  (SEQ
                   (LETT |v|
                         (PROG2
                             (LETT #1# (SPADCALL |x| (QREFELT $ 38))
                                   . #2=(|SKSMP;coerce;$Of;10|))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                           (|Union| (QREFELT $ 7) "failed")
                                           #1#))
                         . #2#)
                   (LETT |xu| (SPADCALL |x| |v| (QREFELT $ 40)) . #2#)
                   (EXIT
                    (SPADCALL |xu|
                              (SPADCALL (SPADCALL 'D (QREFELT $ 62))
                                        (SPADCALL |v| (QREFELT $ 63))
                                        (QREFELT $ 64))
                              (QREFELT $ 65))))))))) 

(DECLAIM (NOTINLINE |SparseMultivariateSkewPolynomial;|)) 

(DEFUN |SparseMultivariateSkewPolynomial| (&REST #1=#:G801)
  (SPROG NIL
         (PROG (#2=#:G802)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseMultivariateSkewPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|SparseMultivariateSkewPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariateSkewPolynomial;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariateSkewPolynomial|)))))))))) 

(DEFUN |SparseMultivariateSkewPolynomial;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G799 NIL) (#2=#:G800 NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL)
    (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|SparseMultivariateSkewPolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #3#)
    (LETT DV$3 (|devaluate| |#3|) . #3#)
    (LETT DV$4 (|devaluate| |#4|) . #3#)
    (LETT |dv$| (LIST '|SparseMultivariateSkewPolynomial| DV$1 DV$2 DV$3 DV$4)
          . #3#)
    (LETT $ (GETREFV 88) . #3#)
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
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (|HasCategory| |#1| '(|Ring|))
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
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              . #3#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))
                                        (AND #2#
                                             (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #3#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #1#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#)
                                        (|HasSignature| |#2|
                                                        (LIST '|variable|
                                                              (LIST
                                                               (|devaluate|
                                                                |#2|)
                                                               '(|Symbol|))))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|SparseMultivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 16777216))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 33554432))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR #1#
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 4294967296))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasSignature| |#2|
                      (LIST '|variable|
                            (LIST
                             (LIST '|Union| (|devaluate| |#2|)
                                   (|devaluate| "failed"))
                             '(|Symbol|))))
      (QSETREFV $ 18 (CONS (|dispatchFunction| |SKSMP;Delta;S$;2|) $))))
    (QSETREFV $ 19 (|SparseUnivariatePolynomial| $))
    (QSETREFV $ 20
              (|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| |#1| |#2|)))
    (QSETREFV $ 24
              (SPADCALL (LIST #'|SparseMultivariateSkewPolynomial!0|)
                        (QREFELT $ 23)))
    (QSETREFV $ 26
              (|SparseUnivariateSkewPolynomial| $ (QREFELT $ 24)
                                                (CONS
                                                 #'|SparseMultivariateSkewPolynomial!1|
                                                 $)))
    (COND
     ((|testBitVector| |pv$| 16)
      (QSETREFV $ 56 (CONS (|dispatchFunction| |SKSMP;exquo;2$U;7|) $))))
    $))) 

(DEFUN |SparseMultivariateSkewPolynomial!1| (|x| $) (|spadConstant| $ 25)) 

(DEFUN |SparseMultivariateSkewPolynomial!0| (|x| $$) |x|) 

(MAKEPROP '|SparseMultivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 7)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (0 . |One|) (4 . |One|) (|NonNegativeInteger|) (8 . |monomial|)
              |SKSMP;D;Var$;1| (|Union| $ '"failed") (|Symbol|)
              (15 . |variable|) (20 . |Delta|) '|Sup| '|Supp| (|Mapping| $$ $$)
              (|Automorphism| $$) (25 . |morphism|) '|id| (30 . |Zero|) '|Upol|
              (|Mapping| 6 6) (34 . |map|) (|Automorphism| 6) (40 . |elt|)
              (46 . |inv|) (51 . |morphism|) (|Boolean|) (57 . |ground?|)
              (62 . |retract|) (67 . *) (|Union| 7 '"failed")
              (73 . |mainVariable|) (|SparseUnivariatePolynomial| $)
              (78 . |univariate|) (|UnivariateSkewPolynomialCategoryOps| $$ 26)
              (84 . |times|) (92 . |multivariate|) |SKSMP;*;3$;5|
              (98 . |coerce|) |SKSMP;*;$R$;6| (103 . |exquo|)
              (109 . |totalDegree|) (114 . |leadingMonomial|) (119 . |Zero|)
              (123 . ~=) (129 . >) (135 . |exquo|) (141 . +) (147 . -)
              (153 . |exquo|) (|PositiveInteger|) |SKSMP;^;$Pi$;8|
              |SKSMP;^;$Nni$;9| (|OutputForm|) (159 . |coerce|)
              (164 . |coerce|) (169 . |coerce|) (174 . |sub|)
              (180 . |outputForm|) |SKSMP;coerce;$Of;10|
              (|Record| (|:| |mat| 70) (|:| |vec| (|Vector| 71))) (|Matrix| $)
              (|Vector| $) (|Matrix| 71) (|Integer|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 71) (|Union| 73 '#1="failed") (|Union| 71 '#1#)
              (|Record| (|:| |mat| 77) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|IndexedExponents| 7) (|List| $) (|List| 7) (|List| 12)
              (|Mapping| 78 78) (|List| 6) (|Union| 6 '#1#) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 186 |zero?| 192 |variables| 197 |unitNormal| 202
              |unitCanonical| 207 |unit?| 212 |totalDegreeSorted| 217
              |totalDegree| 223 |subtractIfCan| 234 |smaller?| 240 |sample| 246
              |rightRecip| 250 |rightPower| 255 |retractIfCan| 267 |retract|
              282 |reductum| 297 |reducedSystem| 302 |recip| 324
              |primitivePart| 329 |primitiveMonomials| 334 |pomopo!| 339
              |opposite?| 347 |one?| 353 |numberOfMonomials| 358 |monomials|
              363 |monomial?| 368 |monomial| 373 |minimumDegree| 393
              |mapExponents| 398 |map| 404 |mainVariable| 410 |leftRecip| 415
              |leftPower| 420 |leadingMonomial| 432 |leadingCoefficient| 437
              |latex| 442 |hashUpdate!| 447 |hash| 453 |ground?| 458 |ground|
              463 |fmecg| 468 |exquo| 476 |degree| 488 |content| 505
              |commutator| 510 |coerce| 516 |coefficients| 541 |coefficient|
              546 |charthRoot| 566 |characteristic| 571 |binomThmExpt| 575
              |associator| 582 |associates?| 589 |antiCommutator| 595
              |annihilate?| 601 ^ 607 |Zero| 619 |One| 623 |Delta| 627 D 632 =
              637 / 643 - 649 + 660 * 666)
           'NIL
           (CONS
            (|makeByteWordVec2| 23
                                '(0 0 0 0 5 1 2 3 4 5 12 13 11 13 0 1 0 0 1 5 0
                                  0 0 0 1 1 13 10 23 11 11 0 0 22 11 0 0 9 0 0
                                  0 0 0 5 4 6 7 8))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |FullyLinearlyExplicitOver&| |Algebra&|
                NIL NIL |EntireRing&| NIL NIL NIL NIL |Rng&| NIL |Module&| NIL
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |Magma&| |AbelianSemiGroup&| NIL |FullyRetractableTo&|
                |SetCategory&| |RetractableTo&| |BasicType&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|FullyLinearlyExplicitOver| 6) (|Algebra| 73)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 71) (|Ring|) (|SemiRing|) (|Rng|)
                 (|SemiRng|) (|Module| 73) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|BiModule| 73 73) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 73) (|RightModule| 73) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|RetractableTo| 6) (|BasicType|) (|CoercibleTo| 60)
                 (|unitsKnown|) (|noZeroDivisors|) (|RetractableTo| 73)
                 (|RetractableTo| 71) (|canonicalUnitNormal|))
              (|makeByteWordVec2| 87
                                  '(0 0 0 10 0 6 0 11 3 0 0 0 7 12 13 1 7 15 16
                                    17 1 0 0 16 18 1 22 0 21 23 0 0 0 25 2 0 0
                                    27 0 28 2 29 6 0 6 30 1 29 0 0 31 2 22 0 21
                                    21 32 1 0 33 0 34 1 0 6 0 35 2 0 0 6 0 36 1
                                    0 37 0 38 2 5 39 0 7 40 4 41 26 26 26 22 21
                                    42 2 5 0 39 7 43 1 0 0 6 45 2 0 15 0 6 47 1
                                    0 12 0 48 1 0 0 0 49 0 6 0 50 2 0 33 0 0 51
                                    2 12 33 0 0 52 2 5 15 0 0 53 2 0 0 0 0 54 2
                                    0 0 0 0 55 2 0 15 0 0 56 1 6 60 0 61 1 16
                                    60 0 62 1 7 60 0 63 2 60 0 0 0 64 2 26 60 0
                                    60 65 2 0 33 0 0 51 1 31 33 0 1 1 0 80 0 1
                                    1 27 72 0 1 1 27 0 0 1 1 27 33 0 1 2 0 12 0
                                    80 1 2 0 12 0 80 1 1 0 12 0 48 2 32 15 0 0
                                    1 2 9 33 0 0 1 0 31 0 1 1 29 15 0 1 2 29 0
                                    0 12 1 2 0 0 0 57 1 1 6 74 0 1 1 7 75 0 1 1
                                    0 84 0 1 1 6 73 0 1 1 7 71 0 1 1 0 6 0 35 1
                                    0 0 0 1 2 19 67 68 69 1 1 19 70 68 1 2 5 76
                                    68 69 1 1 5 77 68 1 1 29 15 0 1 1 18 0 0 1
                                    1 11 79 0 1 4 0 0 0 6 78 0 1 2 31 33 0 0 1
                                    1 29 33 0 1 1 0 12 0 1 1 0 79 0 1 1 0 33 0
                                    1 3 0 0 0 80 81 1 3 0 0 0 7 12 13 2 0 0 6
                                    78 1 1 0 78 0 1 2 0 0 82 0 1 2 0 0 27 0 28
                                    1 0 37 0 38 1 29 15 0 1 2 29 0 0 12 1 2 0 0
                                    0 57 1 1 0 0 0 49 1 0 6 0 1 1 0 85 0 1 2 0
                                    87 87 0 1 1 0 86 0 1 1 0 33 0 34 1 0 6 0 1
                                    4 5 0 0 78 6 0 1 2 27 15 0 0 56 2 4 15 0 6
                                    47 2 0 81 0 80 1 2 0 12 0 7 1 1 0 78 0 1 1
                                    18 6 0 1 2 30 0 0 0 1 1 28 0 71 1 1 25 0 0
                                    1 1 17 0 73 1 1 0 0 6 45 1 0 60 0 66 1 0 83
                                    0 1 3 0 0 0 80 81 1 3 0 0 0 7 12 1 2 0 6 0
                                    78 1 1 2 15 0 1 0 30 12 1 3 26 0 0 0 12 1 3
                                    30 0 0 0 0 1 2 27 33 0 0 1 2 0 0 0 0 1 2 30
                                    33 0 0 1 2 29 0 0 12 59 2 0 0 0 57 58 0 31
                                    0 25 0 29 0 10 1 24 0 16 18 1 0 0 7 14 2 0
                                    33 0 0 1 2 14 0 0 6 1 1 33 0 0 1 2 33 0 0 0
                                    55 2 0 0 0 0 54 2 33 0 71 0 1 2 31 0 12 0 1
                                    2 1 0 73 0 1 2 1 0 0 73 1 2 0 0 6 0 36 2 0
                                    0 0 6 46 2 0 0 0 0 44 2 0 0 57 0 1)))))
           '|lookupComplete|)) 
