
(SDEFUN |SKSMP;D;Var%;1| ((|v| (|Var|)) (% (%)))
        (SPADCALL (|spadConstant| % 10) |v| 1 (QREFELT % 13))) 

(SDEFUN |SKSMP;Delta;S%;2| ((|s| (|Symbol|)) (% (%)))
        (SPROG ((|vu| (|Union| |Var| "failed")))
               (SEQ (LETT |vu| (SPADCALL |s| (QREFELT % 17)))
                    (EXIT
                     (COND ((QEQCAR |vu| 1) (|error| "missing variable"))
                           ('T (SPADCALL (QCDR |vu|) (QREFELT % 14)))))))) 

(SDEFUN |SKSMP;lift_map| ((|f| (|Mapping| R R)) (% (|Mapping| % %)))
        (SPROG NIL (CONS #'|SKSMP;lift_map!0| (VECTOR % |f|)))) 

(SDEFUN |SKSMP;lift_map!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| %)
          (LETT |f| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f| |x| (QREFELT % 28)))))) 

(SDEFUN |SKSMP;lift_morphism| ((|m| (|Automorphism| R)) (% (|Automorphism| %)))
        (SPROG NIL
               (SPADCALL
                (|SKSMP;lift_map|
                 (CONS #'|SKSMP;lift_morphism!0| (VECTOR % |m|)) %)
                (|SKSMP;lift_map|
                 (CONS #'|SKSMP;lift_morphism!1| (VECTOR % |m|)) %)
                (QREFELT % 32)))) 

(SDEFUN |SKSMP;lift_morphism!1| ((|x| NIL) ($$ NIL))
        (PROG (|m| %)
          (LETT |m| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |m| (QREFELT % 31)) |x| (QREFELT % 30)))))) 

(SDEFUN |SKSMP;lift_morphism!0| ((|x| NIL) ($$ NIL))
        (PROG (|m| %)
          (LETT |m| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |m| |x| (QREFELT % 30)))))) 

(SDEFUN |SKSMP;*;3%;5| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|ru| (|Upol|)) (|yu| (|Upol|)) (|xu| (|Upol|)) (|v| (|Var|))
          (#1=#:G30 NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 34))
            (SPADCALL (SPADCALL |x| (QREFELT % 35)) |y| (QREFELT % 36)))
           ('T
            (SEQ
             (LETT |v|
                   (PROG2 (LETT #1# (SPADCALL |x| (QREFELT % 38)))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                     (|Union| (QREFELT % 7) "failed") #1#)))
             (LETT |xu| (SPADCALL |x| |v| (QREFELT % 40)))
             (LETT |yu| (SPADCALL |y| |v| (QREFELT % 40)))
             (LETT |ru|
                   (SPADCALL |xu| |yu|
                             (|SKSMP;lift_morphism|
                              (SPADCALL |v| (QREFELT % 8)) %)
                             (|SKSMP;lift_map| (SPADCALL |v| (QREFELT % 9)) %)
                             (QREFELT % 42)))
             (EXIT (SPADCALL |ru| |v| (QREFELT % 43))))))))) 

(SDEFUN |SKSMP;*;%R%;6| ((|x| (%)) (|r| (R)) (% (%)))
        (SPADCALL |x| (SPADCALL |r| (QREFELT % 45)) (QREFELT % 44))) 

(SDEFUN |SKSMP;exquo;2%U;7| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|res| (%)) (|cc| (%)) (#1=#:G54 NIL)
          (|cu| (|Union| (|SparseMultivariatePolynomial| R |Var|) "failed"))
          (|lx| (|SparseMultivariatePolynomial| R |Var|)) (|lx1| (%))
          (|ly| (|SparseMultivariatePolynomial| R |Var|))
          (|maxd| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |y| (QREFELT % 34))
             (SPADCALL |x| (SPADCALL |y| (QREFELT % 35)) (QREFELT % 47)))
            ((SPADCALL |x| (QREFELT % 34)) (CONS 1 "failed"))
            ('T
             (SEQ (LETT |maxd| (SPADCALL |x| (QREFELT % 48)))
                  (LETT |ly| (SPADCALL |y| (QREFELT % 49)))
                  (LETT |res| (|spadConstant| % 25))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |x| (|spadConstant| % 25) (QREFELT % 51)))
                         (GO G191)))
                       (SEQ (LETT |lx1| (SPADCALL |x| (QREFELT % 49)))
                            (EXIT
                             (COND
                              ((> (SPADCALL |lx1| (QREFELT % 48)) |maxd|)
                               (PROGN
                                (LETT #1# (CONS 1 "failed"))
                                (GO #2=#:G53)))
                              ('T
                               (SEQ (LETT |lx| |lx1|)
                                    (LETT |cu|
                                          (SPADCALL |lx| |ly| (QREFELT % 52)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |cu| 1)
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed"))
                                        (GO #2#)))
                                      ('T
                                       (SEQ (LETT |cc| (QCDR |cu|))
                                            (LETT |res|
                                                  (SPADCALL |res| |cc|
                                                            (QREFELT % 53)))
                                            (EXIT
                                             (LETT |x|
                                                   (SPADCALL |x|
                                                             (SPADCALL |cc| |y|
                                                                       (QREFELT
                                                                        % 44))
                                                             (QREFELT %
                                                                      54)))))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 |res|))))))
          #2# (EXIT #1#)))) 

(SDEFUN |SKSMP;^;%Pi%;8| ((|x| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (SPROG ((|res| (%)) (#1=#:G59 NIL) (|i| NIL))
               (SEQ (LETT |res| |x|)
                    (SEQ (LETT |i| 2) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res| (SPADCALL |res| |x| (QREFELT % 44)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SKSMP;^;%Nni%;9| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND ((EQL |n| 0) (|spadConstant| % 10))
              ('T (SPADCALL |x| |n| (QREFELT % 57))))) 

(SDEFUN |SKSMP;coerce;%Of;10| ((|x| (%)) (% (|OutputForm|)))
        (SPROG ((|xu| (|Upol|)) (|v| (|Var|)) (#1=#:G62 NIL))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT % 34))
                  (SPADCALL (SPADCALL |x| (QREFELT % 35)) (QREFELT % 60)))
                 ('T
                  (SEQ
                   (LETT |v|
                         (PROG2 (LETT #1# (SPADCALL |x| (QREFELT % 38)))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                           (|Union| (QREFELT % 7) "failed")
                                           #1#)))
                   (LETT |xu| (SPADCALL |x| |v| (QREFELT % 40)))
                   (EXIT
                    (SPADCALL |xu|
                              (SPADCALL (SPADCALL 'D (QREFELT % 61))
                                        (SPADCALL |v| (QREFELT % 62))
                                        (QREFELT % 63))
                              (QREFELT % 64))))))))) 

(DECLAIM (NOTINLINE |SparseMultivariateSkewPolynomial;|)) 

(DEFUN |SparseMultivariateSkewPolynomial;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G83 NIL) (#2=#:G84 NIL) (#3=#:G85 NIL) (#4=#:G86 NIL)
    (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$| (LIST '|SparseMultivariateSkewPolynomial| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 89))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #4#)
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
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
                                        (|HasCategory|
                                         (|IndexedExponents| |#2|)
                                         '(|Comparable|))
                                        (|HasCategory| |#1| '(|Field|))
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
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|)))
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
                                         #2# #3#)
                                        (LETT #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|)))
                                         #1#)
                                        (|HasSignature| |#2|
                                                        (LIST '|variable|
                                                              (LIST
                                                               (|devaluate|
                                                                |#2|)
                                                               '(|Symbol|))))))))
    (|haddProp| |$ConstructorCache| '|SparseMultivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 268435456))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 536870912))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #4#)
     (|augmentPredVector| % 4294967296))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #4#)
     (|augmentPredVector| % 17179869184))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|LinearlyExplicitOver| (|Integer|))) #4#
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|LinearlyExplicitOver| (|Integer|))) #4#
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|)) #4#) #3#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 68719476736))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|LinearlyExplicitOver| (|Integer|))) #4#
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #2#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 137438953472))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasSignature| |#2|
                      (LIST '|variable|
                            (LIST
                             (LIST '|Union| (|devaluate| |#2|)
                                   (|devaluate| "failed"))
                             '(|Symbol|))))
      (QSETREFV % 18 (CONS (|dispatchFunction| |SKSMP;Delta;S%;2|) %))))
    (QSETREFV % 19 (|SparseUnivariatePolynomial| %))
    (QSETREFV % 20
              (|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| |#1| |#2|)))
    (QSETREFV % 24
              (SPADCALL (LIST #'|SparseMultivariateSkewPolynomial!0|)
                        (QREFELT % 23)))
    (QSETREFV % 26
              (|SparseUnivariateSkewPolynomial| % (QREFELT % 24)
                                                (CONS
                                                 #'|SparseMultivariateSkewPolynomial!1|
                                                 %)))
    (COND
     ((|testBitVector| |pv$| 16)
      (QSETREFV % 55 (CONS (|dispatchFunction| |SKSMP;exquo;2%U;7|) %))))
    %))) 

(DEFUN |SparseMultivariateSkewPolynomial| (&REST #1=#:G87)
  (SPROG NIL
         (PROG (#2=#:G88)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T NIL NIL))
                     (HGET |$ConstructorCache|
                           '|SparseMultivariateSkewPolynomial|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariateSkewPolynomial;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariateSkewPolynomial|)))))))))) 

(DEFUN |SparseMultivariateSkewPolynomial!1| (|x| %) (|spadConstant| % 25)) 

(DEFUN |SparseMultivariateSkewPolynomial!0| (|x| $$) |x|) 

(MAKEPROP '|SparseMultivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 7)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (0 . |One|) (4 . |One|) (|NonNegativeInteger|) (8 . |monomial|)
              |SKSMP;D;Var%;1| (|Union| % '"failed") (|Symbol|)
              (15 . |variable|) (20 . |Delta|) '|Sup| '|Supp| (|Mapping| $$ $$)
              (|Automorphism| $$) (25 . |morphism|) '|id| (30 . |Zero|) '|Upol|
              (|Mapping| 6 6) (34 . |map|) (|Automorphism| 6) (40 . |elt|)
              (46 . |inv|) (51 . |morphism|) (|Boolean|) (57 . |ground?|)
              (62 . |retract|) (67 . *) (|Union| 7 '"failed")
              (73 . |mainVariable|) (|SparseUnivariatePolynomial| %)
              (78 . |univariate|) (|UnivariateSkewPolynomialCategoryOps| $$ 26)
              (84 . |times|) (92 . |multivariate|) |SKSMP;*;3%;5|
              (98 . |coerce|) |SKSMP;*;%R%;6| (103 . |exquo|)
              (109 . |totalDegree|) (114 . |leadingMonomial|) (119 . |Zero|)
              (123 . ~=) (129 . |exquo|) (135 . +) (141 . -) (147 . |exquo|)
              (|PositiveInteger|) |SKSMP;^;%Pi%;8| |SKSMP;^;%Nni%;9|
              (|OutputForm|) (153 . |coerce|) (158 . |coerce|) (163 . |coerce|)
              (168 . |sub|) (174 . |outputForm|) |SKSMP;coerce;%Of;10|
              (|String|) (|Record| (|:| |k| 69) (|:| |c| 6)) (|List| 67)
              (|IndexedExponents| 7) (|List| %) (|List| 6) (|List| 69)
              (|Union| 6 '#1="failed") (|Mapping| 69 69) (|List| 12) (|List| 7)
              (|Integer|) (|Record| (|:| |mat| 81) (|:| |vec| (|Vector| 77)))
              (|Matrix| %) (|Vector| %) (|Matrix| 77)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 77) (|Mapping| 6 69) (|Union| 83 '#1#)
              (|Union| 77 '#1#)
              (|Record| (|:| |mat| 88) (|:| |vec| (|Vector| 6))) (|Matrix| 6))
           '#(~= 180 |zero?| 186 |variables| 191 |unitNormal| 196
              |unitCanonical| 201 |unit?| 206 |totalDegreeSorted| 211
              |totalDegree| 217 |support| 228 |subtractIfCan| 233 |smaller?|
              239 |sample| 245 |rightRecip| 249 |rightPower| 254 |retractIfCan|
              266 |retract| 281 |reductum| 296 |reducedSystem| 301 |recip| 323
              |primitivePart| 328 |primitiveMonomials| 333 |pomopo!| 338
              |plenaryPower| 346 |opposite?| 352 |one?| 358 |numberOfMonomials|
              363 |monomials| 368 |monomial?| 373 |monomial| 378
              |minimumDegree| 398 |mapExponents| 403 |map| 409 |mainVariable|
              415 |listOfTerms| 420 |linearExtend| 425 |leftRecip| 431
              |leftPower| 436 |leadingTerm| 448 |leadingSupport| 453
              |leadingMonomial| 458 |leadingCoefficient| 463 |latex| 468
              |ground?| 473 |ground| 478 |fmecg| 483 |exquo| 491 |degree| 503
              |content| 520 |constructOrdered| 525 |construct| 530 |commutator|
              535 |coerce| 541 |coefficients| 566 |coefficient| 571
              |charthRoot| 591 |characteristic| 596 |binomThmExpt| 600
              |associator| 607 |associates?| 614 |antiCommutator| 620
              |annihilate?| 626 ^ 632 |Zero| 644 |One| 648 |Delta| 652 D 657 =
              662 / 668 - 674 + 685 * 691)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 0 0 4 3 2 1 7 5 7 1 0 6 8 1 0 0 27 6 6 1
                                  0 0 0 27 7 1 1 0 0 0 0 0 13 22 5 5 25 5 0 0
                                  12 0 0 0 10 9 0 0 11 10 9 4 6 0 0 0))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |EntireRing&| NIL NIL |Algebra&| NIL NIL
                |Rng&| |NonAssociativeAlgebra&| |FreeModuleCategory&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |AbelianMonoid&| |MagmaWithUnit&|
                NIL |NonAssociativeSemiRng&| NIL |AbelianSemiGroup&| |Magma&|
                |FullyRetractableTo&| |RetractableTo&| |RetractableTo&|
                |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|EntireRing|)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 83) (|Ring|) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 83)
                 (|FreeModuleCategory| 6 (|IndexedExponents| 7))
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 83)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 7))
                 (|SemiRng|) (|LinearlyExplicitOver| 77)
                 (|LinearlyExplicitOver| 6) (|NonAssociativeRing|)
                 (|BiModule| 83 83) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 7))
                 (|RightModule| 77) (|NonAssociativeRng|) (|RightModule| 83)
                 (|LeftModule| 83) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|AbelianMonoid|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|) (|Comparable|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 6)
                 (|RetractableTo| 77) (|RetractableTo| 83) (|SetCategory|)
                 (|RetractableTo| 6) (|canonicalUnitNormal|)
                 (|CoercibleFrom| 77) (|CoercibleFrom| 83) (|noZeroDivisors|)
                 (|unitsKnown|) (|CoercibleTo| 59) (|BasicType|)
                 (|CoercibleFrom| 6))
              (|makeByteWordVec2| 88
                                  '(0 0 0 10 0 6 0 11 3 0 0 0 7 12 13 1 7 15 16
                                    17 1 0 0 16 18 1 22 0 21 23 0 0 0 25 2 0 0
                                    27 0 28 2 29 6 0 6 30 1 29 0 0 31 2 22 0 21
                                    21 32 1 0 33 0 34 1 0 6 0 35 2 0 0 6 0 36 1
                                    0 37 0 38 2 5 39 0 7 40 4 41 26 26 26 22 21
                                    42 2 5 0 39 7 43 1 0 0 6 45 2 0 15 0 6 47 1
                                    0 12 0 48 1 0 0 0 49 0 6 0 50 2 0 33 0 0 51
                                    2 5 15 0 0 52 2 0 0 0 0 53 2 0 0 0 0 54 2 0
                                    15 0 0 55 1 6 59 0 60 1 16 59 0 61 1 7 59 0
                                    62 2 59 0 0 0 63 2 26 59 0 59 64 2 0 33 0 0
                                    51 1 38 33 0 1 1 0 76 0 1 1 32 82 0 1 1 32
                                    0 0 1 1 32 33 0 1 2 0 12 0 76 1 1 0 12 0 48
                                    2 0 12 0 76 1 1 0 72 0 1 2 37 15 0 0 1 2 12
                                    33 0 0 1 0 38 0 1 1 34 15 0 1 2 0 0 0 56 1
                                    2 34 0 0 12 1 1 0 73 0 1 1 9 85 0 1 1 10 86
                                    0 1 1 0 6 0 35 1 9 83 0 1 1 10 77 0 1 1 14
                                    0 0 1 2 26 78 79 80 1 1 26 81 79 1 2 6 87
                                    79 80 1 1 6 88 79 1 1 34 15 0 1 1 18 0 0 1
                                    1 5 70 0 1 4 0 0 0 6 69 0 1 2 29 0 0 56 1 2
                                    38 33 0 0 1 1 34 33 0 1 1 0 12 0 1 1 0 70 0
                                    1 1 0 33 0 1 2 0 0 6 69 1 3 0 0 0 7 12 13 3
                                    0 0 0 76 75 1 1 0 69 0 1 2 0 0 74 0 1 2 0 0
                                    27 0 28 1 0 37 0 38 1 0 68 0 1 2 8 6 84 0 1
                                    1 34 15 0 1 2 0 0 0 56 1 2 34 0 0 12 1 1 14
                                    67 0 1 1 14 69 0 1 1 14 0 0 49 1 14 6 0 1 1
                                    0 66 0 1 1 0 33 0 34 1 0 6 0 1 4 6 0 0 69 6
                                    0 1 2 32 15 0 0 55 2 4 15 0 6 47 1 0 69 0 1
                                    2 0 12 0 7 1 2 0 75 0 76 1 1 18 6 0 1 1 14
                                    0 68 1 1 0 0 68 1 2 35 0 0 0 1 1 0 59 0 65
                                    1 0 0 6 45 1 30 0 0 1 1 33 0 77 1 1 17 0 83
                                    1 1 0 71 0 1 2 0 6 0 69 1 3 0 0 0 7 12 1 3
                                    0 0 0 76 75 1 1 2 15 0 1 0 35 12 1 3 31 0 0
                                    0 12 1 3 35 0 0 0 0 1 2 32 33 0 0 1 2 0 0 0
                                    0 1 2 35 33 0 0 1 2 0 0 0 56 57 2 34 0 0 12
                                    58 0 38 0 25 0 34 0 10 1 28 0 16 18 1 0 0 7
                                    14 2 0 33 0 0 1 2 15 0 0 6 1 2 36 0 0 0 54
                                    1 36 0 0 1 2 0 0 0 0 53 2 0 0 56 0 1 2 0 0
                                    0 0 44 2 0 0 0 6 46 2 0 0 6 0 36 2 26 0 0
                                    77 1 2 36 0 77 0 1 2 38 0 12 0 1 2 1 0 83 0
                                    1 2 1 0 0 83 1)))))
           '|lookupComplete|)) 
