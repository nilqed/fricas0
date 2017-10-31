
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
          (#1=#:G728 NIL))
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
         ((|res| ($)) (|cc| ($)) (#1=#:G751 NIL)
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
                            (GO #3=#:G750)))
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
        (SPROG ((|res| ($)) (#1=#:G756 NIL) (|i| NIL))
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
        (SPROG ((|xu| (|Upol|)) (|v| (|Var|)) (#1=#:G759 NIL))
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

(DEFUN |SparseMultivariateSkewPolynomial| (&REST #1=#:G800)
  (SPROG NIL
         (PROG (#2=#:G801)
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
   ((|pv$| NIL) (#1=#:G795 NIL) (#2=#:G796 NIL) (#3=#:G797 NIL) (#4=#:G798 NIL)
    (#5=#:G799 NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|SparseMultivariateSkewPolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #6#)
    (LETT DV$3 (|devaluate| |#3|) . #6#)
    (LETT DV$4 (|devaluate| |#4|) . #6#)
    (LETT |dv$| (LIST '|SparseMultivariateSkewPolynomial| DV$1 DV$2 DV$3 DV$4)
          . #6#)
    (LETT $ (GETREFV 88) . #6#)
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
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #6#)
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|))
                                            (|HasCategory| |#1| '(|Ring|)))
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
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
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|Field|))
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
                                        (AND #4#
                                             (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #4# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #4# #3# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #4# #3# #1# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasSignature| |#2|
                                                        (LIST '|variable|
                                                              (LIST
                                                               (|devaluate|
                                                                |#2|)
                                                               '(|Symbol|))))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|SparseMultivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 536870912))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 17179869184))
    (AND
     (OR #3# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 34359738368))
    (AND
     (OR #2# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 68719476736))
    (AND
     (OR #1# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 137438953472))
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
     ((|testBitVector| |pv$| 2)
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
              (|Matrix| 6) (|Record| (|:| |mat| 76) (|:| |vec| (|Vector| 6)))
              (|IndexedExponents| 7) (|List| $) (|List| 7) (|List| 12)
              (|Mapping| 78 78) (|List| 6) (|Union| 6 '#1#) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 186 |zero?| 192 |variables| 197 |unitNormal| 202
              |unitCanonical| 207 |unit?| 212 |totalDegreeSorted| 217
              |totalDegree| 223 |subtractIfCan| 234 |smaller?| 240 |sample| 246
              |retractIfCan| 250 |retract| 265 |reductum| 280 |reducedSystem|
              285 |recip| 307 |primitivePart| 312 |primitiveMonomials| 317
              |pomopo!| 322 |opposite?| 330 |one?| 336 |numberOfMonomials| 341
              |monomials| 346 |monomial?| 351 |monomial| 356 |minimumDegree|
              376 |mapExponents| 381 |map| 387 |mainVariable| 393
              |leadingMonomial| 398 |leadingCoefficient| 403 |latex| 408
              |hashUpdate!| 413 |hash| 419 |ground?| 424 |ground| 429 |fmecg|
              434 |exquo| 442 |degree| 454 |content| 471 |coerce| 476
              |coefficients| 501 |coefficient| 506 |charthRoot| 526
              |characteristic| 531 |binomThmExpt| 535 |associates?| 542
              |annihilate?| 548 ^ 554 |Zero| 566 |One| 570 |Delta| 574 D 579 =
              584 / 590 - 596 + 607 * 613)
           'NIL
           (CONS
            (|makeByteWordVec2| 28
                                '(0 0 0 0 2 1 2 5 8 1 6 2 3 4 5 7 8 17 0 1 10
                                  18 0 0 1 1 9 11 18 24 16 26 0 16 28 0 0 15 0
                                  0 0 0 0 6 8 7 12 13 14))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| NIL |Algebra&| |Algebra&| |Algebra&|
                |FullyLinearlyExplicitOver&| |Module&| NIL |Module&| NIL NIL
                |Module&| |EntireRing&| NIL NIL NIL NIL NIL |Ring&| NIL NIL NIL
                NIL NIL NIL |Rng&| |AbelianGroup&| NIL NIL NIL |Monoid&|
                |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| |RetractableTo&|
                |BasicType&| NIL NIL NIL NIL |RetractableTo&| |RetractableTo&|
                NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|IntegralDomain|) (|Algebra| 73) (|Algebra| $$) (|Algebra| 6)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 73)
                 (|CommutativeRing|) (|Module| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6) (|EntireRing|)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 71)
                 (|BiModule| 6 6) (|BiModule| 73 73) (|BiModule| $$ $$)
                 (|Ring|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| 73)
                 (|RightModule| 73) (|LeftModule| $$) (|RightModule| $$)
                 (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|Comparable|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|RetractableTo| 6) (|BasicType|) (|CoercibleTo| 60)
                 (|CommutativeStar|) (|unitsKnown|) (|noZeroDivisors|)
                 (|RetractableTo| 73) (|RetractableTo| 71)
                 (|canonicalUnitNormal|))
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
                                    60 65 2 0 33 0 0 51 1 38 33 0 1 1 0 80 0 1
                                    1 32 72 0 1 1 32 0 0 1 1 32 33 0 1 2 0 12 0
                                    80 1 2 0 12 0 80 1 1 0 12 0 48 2 37 15 0 0
                                    1 2 15 33 0 0 1 0 38 0 1 1 12 74 0 1 1 13
                                    75 0 1 1 0 84 0 1 1 12 73 0 1 1 13 71 0 1 1
                                    0 6 0 35 1 0 0 0 1 2 22 67 68 69 1 1 22 70
                                    68 1 1 8 76 68 1 2 8 77 68 69 1 1 34 15 0 1
                                    1 21 0 0 1 1 16 79 0 1 4 0 0 0 6 78 0 1 2
                                    38 33 0 0 1 1 34 33 0 1 1 0 12 0 1 1 0 79 0
                                    1 1 0 33 0 1 3 0 0 0 80 81 1 3 0 0 0 7 12
                                    13 2 0 0 6 78 1 1 0 78 0 1 2 0 0 82 0 1 2 0
                                    0 27 0 28 1 0 37 0 38 1 0 0 0 49 1 0 6 0 1
                                    1 0 85 0 1 2 0 87 87 0 1 1 0 86 0 1 1 0 33
                                    0 34 1 0 6 0 1 4 8 0 0 78 6 0 1 2 32 15 0 0
                                    56 2 7 15 0 6 47 2 0 81 0 80 1 2 0 12 0 7 1
                                    1 0 78 0 1 1 21 6 0 1 1 30 0 0 1 1 33 0 71
                                    1 1 20 0 73 1 1 0 0 6 45 1 0 60 0 66 1 0 83
                                    0 1 3 0 0 0 7 12 1 3 0 0 0 80 81 1 2 0 6 0
                                    78 1 1 3 15 0 1 0 35 12 1 3 31 0 0 0 12 1 2
                                    32 33 0 0 1 2 35 33 0 0 1 2 34 0 0 12 59 2
                                    0 0 0 57 58 0 38 0 25 0 34 0 10 1 29 0 16
                                    18 1 0 0 7 14 2 0 33 0 0 1 2 19 0 0 6 1 2
                                    36 0 0 0 55 1 36 0 0 1 2 0 0 0 0 54 2 36 0
                                    71 0 1 2 38 0 12 0 1 2 1 0 0 73 1 2 1 0 73
                                    0 1 2 0 0 6 0 36 2 0 0 0 0 44 2 0 0 0 6 46
                                    2 0 0 57 0 1)))))
           '|lookupComplete|)) 
