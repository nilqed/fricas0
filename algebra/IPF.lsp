
(SDEFUN |IPF;generator;$;1| (($ $)) (|spadConstant| $ 15)) 

(SDEFUN |IPF;^;$I$;2| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|r| (|NonNegativeInteger|)) (#1=#:G708 NIL))
               (SEQ
                (COND ((ZEROP |n|) (|spadConstant| $ 15))
                      ((SPADCALL |x| (QREFELT $ 18)) (|spadConstant| $ 19))
                      ('T
                       (SEQ
                        (LETT |r|
                              (PROG1
                                  (LETT #1#
                                        (SPADCALL |n| (- (QREFELT $ 6) 1)
                                                  (QREFELT $ 21))
                                        . #2=(|IPF;^;$I$;2|))
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#))
                              . #2#)
                        (EXIT (SPADCALL |x| |r| (QREFELT $ 23))))))))) 

(SDEFUN |IPF;recip;$U;3| ((|x| $) ($ |Union| $ "failed"))
        (SPROG ((|y| (|SingleInteger|)))
               (COND
                ((|zero?_SI|
                  (LETT |y|
                        (SPADCALL (SPADCALL |x| (QREFELT $ 30)) (QREFELT $ 28))
                        |IPF;recip;$U;3|))
                 (CONS 1 "failed"))
                ('T
                 (CONS 0
                       (SPADCALL (SPADCALL |y| (QREFELT $ 29) (QREFELT $ 31))
                                 (QREFELT $ 32))))))) 

(SDEFUN |IPF;recip;$U;4| ((|x| $) ($ |Union| $ "failed"))
        (SPROG ((|y| (|Integer|)))
               (COND
                ((ZEROP
                  (LETT |y| (SPADCALL |x| (QREFELT $ 30)) |IPF;recip;$U;4|))
                 (CONS 1 "failed"))
                ('T
                 (CONS 0
                       (SPADCALL (SPADCALL |y| (QREFELT $ 6) (QREFELT $ 35))
                                 (QREFELT $ 32))))))) 

(PUT '|IPF;convert;$I;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |IPF;convert;$I;5| ((|x| $) ($ |Integer|)) |x|) 

(SDEFUN |IPF;normalElement;$;6| (($ $)) (|spadConstant| $ 15)) 

(SDEFUN |IPF;createNormalElement;$;7| (($ $)) (|spadConstant| $ 15)) 

(SDEFUN |IPF;characteristic;Nni;8| (($ |NonNegativeInteger|)) (QREFELT $ 6)) 

(SDEFUN |IPF;factorsOfCyclicGroupSize;L;9|
        (($ |List|
          (|Record| (|:| |factor| #1=(|Integer|)) (|:| |exponent| #1#))))
        (SEQ
         (COND ((EQL (QREFELT $ 6) 2) (QREFELT $ 9))
               ('T
                (SEQ (COND ((NULL (QREFELT $ 9)) (|IPF;initializeElt| $)))
                     (EXIT (QREFELT $ 9))))))) 

(PUT '|IPF;representationType;U;10| '|SPADreplace| '(XLAM NIL (CONS 0 "prime"))) 

(SDEFUN |IPF;representationType;U;10|
        (($ |Union| "prime" "polynomial" "normal" "cyclic")) (CONS 0 "prime")) 

(SDEFUN |IPF;tableForDiscreteLogarithm;IT;11|
        ((|fac| |Integer|)
         ($ |Table| (|PositiveInteger|) (|NonNegativeInteger|)))
        (SPROG
         ((|tbl|
           (|Union| (|Table| (|PositiveInteger|) (|NonNegativeInteger|))
                    "failed"))
          (#1=#:G753 NIL))
         (SEQ (COND ((QREFELT $ 10) (|IPF;initializeLog| $)))
              (LETT |tbl|
                    (SPADCALL
                     (PROG1
                         (LETT #1# |fac|
                               . #2=(|IPF;tableForDiscreteLogarithm;IT;11|))
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT $ 14) (QREFELT $ 46))
                    . #2#)
              (EXIT
               (COND
                ((QEQCAR |tbl| 1)
                 (|error|
                  "tableForDiscreteLogarithm: argument must be prime divisor of the order of the multiplicative group"))
                ('T (QCDR |tbl|))))))) 

(SDEFUN |IPF;primitiveElement;$;12| (($ $))
        (SEQ (COND ((QREFELT $ 11) (|IPF;initializeElt| $)))
             (EXIT (SPADCALL (QREFELT $ 7) (QREFELT $ 49))))) 

(SDEFUN |IPF;initializeElt| (($ |Void|))
        (SEQ
         (SETELT $ 9
                 (SPADCALL (SPADCALL (QREFELT $ 8) (QREFELT $ 52))
                           (QREFELT $ 54)))
         (SETELT $ 7 (SPADCALL (SPADCALL (QREFELT $ 55)) (QREFELT $ 56)))
         (SETELT $ 11 NIL) (EXIT (SPADCALL (QREFELT $ 58))))) 

(SDEFUN |IPF;initializeLog| (($ |Void|))
        (SPROG
         ((#1=#:G780 NIL) (|a| ($)) (#2=#:G786 NIL) (#3=#:G774 NIL) (|i| NIL)
          (|tbl| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|n| (|Integer|)) (|d| (|Integer|)) (|l| (|Integer|)) (|base| ($))
          (|fac| (|Integer|)) (#4=#:G785 NIL) (|f| NIL) (|limit| (|Integer|)))
         (SEQ (COND ((QREFELT $ 11) (|IPF;initializeElt| $)))
              (LETT |limit| 30 . #5=(|IPF;initializeLog|))
              (SEQ (LETT |f| NIL . #5#) (LETT #4# (QREFELT $ 9) . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |fac| (QCAR |f|) . #5#)
                        (LETT |base|
                              (SPADCALL (SPADCALL (QREFELT $ 50))
                                        (QUOTIENT2 (QREFELT $ 8) |fac|)
                                        (QREFELT $ 24))
                              . #5#)
                        (LETT |l| (INTEGER-LENGTH |fac|) . #5#)
                        (LETT |n| 0 . #5#)
                        (COND
                         ((ODDP |l|)
                          (LETT |n| (ASH |fac| (- (QUOTIENT2 |l| 2))) . #5#))
                         ('T (LETT |n| (ASH 1 (QUOTIENT2 |l| 2)) . #5#)))
                        (COND
                         ((< |n| |limit|)
                          (SEQ
                           (LETT |d| (+ (QUOTIENT2 (- |fac| 1) |limit|) 1)
                                 . #5#)
                           (EXIT
                            (LETT |n| (+ (QUOTIENT2 (- |fac| 1) |d|) 1)
                                  . #5#)))))
                        (LETT |tbl| (SPADCALL (QREFELT $ 59)) . #5#)
                        (LETT |a| (|spadConstant| $ 15) . #5#)
                        (SEQ (LETT |i| 0 . #5#)
                             (LETT #2#
                                   (PROG1 (LETT #3# (- |n| 1) . #5#)
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                   . #5#)
                             G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (SPADCALL
                               (CONS (SPADCALL |a| (QREFELT $ 56)) |i|) |tbl|
                               (QREFELT $ 61))
                              (EXIT
                               (LETT |a| (SPADCALL |a| |base| (QREFELT $ 62))
                                     . #5#)))
                             (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL
                          (CONS
                           (PROG1 (LETT #1# |fac| . #5#)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (SPADCALL |tbl| (QREFELT $ 63)))
                          (QREFELT $ 14) (QREFELT $ 65))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (SETELT $ 10 NIL) (EXIT (SPADCALL (QREFELT $ 58)))))) 

(PUT '|IPF;degree;$Pi;15| '|SPADreplace| '(XLAM (|x|) 1)) 

(SDEFUN |IPF;degree;$Pi;15| ((|x| $) ($ |PositiveInteger|)) 1) 

(PUT '|IPF;extensionDegree;Pi;16| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |IPF;extensionDegree;Pi;16| (($ |PositiveInteger|)) 1) 

(PUT '|IPF;inGroundField?;$B;17| '|SPADreplace| '(XLAM (|x|) 'T)) 

(SDEFUN |IPF;inGroundField?;$B;17| ((|x| $) ($ |Boolean|)) 'T) 

(SDEFUN |IPF;coordinates;$V;18| ((|x| $) ($ |Vector| $))
        (SPADCALL 1 |x| (QREFELT $ 70))) 

(SDEFUN |IPF;represents;V$;19| ((|v| |Vector| $) ($ $))
        (SPADCALL |v| 1 (QREFELT $ 73))) 

(PUT '|IPF;retract;2$;20| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |IPF;retract;2$;20| ((|x| $) ($ $)) |x|) 

(PUT '|IPF;retractIfCan;$U;21| '|SPADreplace| '(XLAM (|x|) (CONS 0 |x|))) 

(SDEFUN |IPF;retractIfCan;$U;21| ((|x| $) ($ |Union| $ "failed")) (CONS 0 |x|)) 

(SDEFUN |IPF;basis;V;22| (($ |Vector| $))
        (SPADCALL 1 (|spadConstant| $ 15) (QREFELT $ 70))) 

(SDEFUN |IPF;basis;PiV;23| ((|n| |PositiveInteger|) ($ |Vector| $))
        (COND ((EQL |n| 1) (SPADCALL (QREFELT $ 77)))
              ('T (|error| "basis: argument must divide extension degree")))) 

(SDEFUN |IPF;definingPolynomial;Sup;24| (($ |SparseUnivariatePolynomial| $))
        (SPADCALL (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 80))
                  (SPADCALL (|spadConstant| $ 15) 0 (QREFELT $ 80))
                  (QREFELT $ 81))) 

(SDEFUN |IPF;minimalPolynomial;$Sup;25|
        ((|x| $) ($ |SparseUnivariatePolynomial| $))
        (SPADCALL (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 80))
                  (SPADCALL |x| 0 (QREFELT $ 80)) (QREFELT $ 81))) 

(PUT '|IPF;charthRoot;2$;26| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |IPF;charthRoot;2$;26| ((|x| $) ($ $)) |x|) 

(DECLAIM (NOTINLINE |InnerPrimeField;|)) 

(DEFUN |InnerPrimeField| (#1=#:G833)
  (SPROG NIL
         (PROG (#2=#:G834)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|InnerPrimeField|)
                                               '|domainEqualList|)
                    . #3=(|InnerPrimeField|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|InnerPrimeField;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerPrimeField|)))))))))) 

(DEFUN |InnerPrimeField;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerPrimeField|))
          (LETT |dv$| (LIST '|InnerPrimeField| DV$1) . #1#)
          (LETT $ (GETREFV 109) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InnerPrimeField| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND (|HasCategory| $ '(|CharacteristicNonZero|))
               (|augmentPredVector| $ 1))
          (AND (|HasCategory| $ '(|Finite|)) (|augmentPredVector| $ 2))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 1)
          (QSETREFV $ 8 (- |#1| 1))
          (QSETREFV $ 9 NIL)
          (QSETREFV $ 10 'T)
          (QSETREFV $ 11 'T)
          (QSETREFV $ 14 (SPADCALL (QREFELT $ 13)))
          (QSETREFV $ 26 (SPADCALL |#1| MOST-POSITIVE-FIXNUM (QREFELT $ 25)))
          (COND
           ((QREFELT $ 26)
            (PROGN
             (QSETREFV $ 29 (SPADCALL |#1| (QREFELT $ 28)))
             (QSETREFV $ 34 (CONS (|dispatchFunction| |IPF;recip;$U;3|) $))))
           ('T (QSETREFV $ 34 (CONS (|dispatchFunction| |IPF;recip;$U;4|) $))))
          $))) 

(MAKEPROP '|InnerPrimeField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IntegerMod| (NRTEVAL (QREFELT $ 6)))
              (|local| |#1|) '|primitiveElt| '|sizeCG| '|facOfGroupSize|
              '|initlog?| '|initelt?| (|Table| 45 47) (0 . |table|)
              '|discLogTable| (4 . |One|) |IPF;generator;$;1| (|Boolean|)
              (8 . |zero?|) (13 . |Zero|) (|Integer|)
              (17 . |positiveRemainder|) (|NonNegativeInteger|) (23 . ^)
              |IPF;^;$I$;2| (29 . <=) '#:G694 (|SingleInteger|) (35 . |coerce|)
              '|q| |IPF;convert;$I;5| (40 . |invmod|) (46 . |coerce|)
              (|Union| $ '"failed") (51 . |recip|) (56 . |invmod|)
              |IPF;normalElement;$;6| |IPF;createNormalElement;$;7|
              |IPF;characteristic;Nni;8|
              (|Record| (|:| |factor| 20) (|:| |exponent| 20)) (|List| 39)
              |IPF;factorsOfCyclicGroupSize;L;9|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              |IPF;representationType;U;10| (|Union| 47 '"failed")
              (|PositiveInteger|) (62 . |search|) (|Table| 45 22)
              |IPF;tableForDiscreteLogarithm;IT;11| (68 . |index|)
              |IPF;primitiveElement;$;12| (|Factored| $) (73 . |factor|)
              (|Factored| 20) (78 . |factors|) (83 . |createPrimitiveElement|)
              (87 . |lookup|) (|Void|) (92 . |void|) (96 . |table|)
              (|Record| (|:| |key| 45) (|:| |entry| 22)) (100 . |insert!|)
              (106 . *) (112 . |copy|)
              (|Record| (|:| |key| 45) (|:| |entry| 47)) (117 . |insert!|)
              |IPF;degree;$Pi;15| |IPF;extensionDegree;Pi;16|
              |IPF;inGroundField?;$B;17| (|Vector| $$) (123 . |new|)
              (|Vector| $) |IPF;coordinates;$V;18| (129 . |elt|)
              |IPF;represents;V$;19| |IPF;retract;2$;20|
              |IPF;retractIfCan;$U;21| |IPF;basis;V;22| |IPF;basis;PiV;23|
              (|SparseUnivariatePolynomial| $$) (135 . |monomial|) (141 . -)
              (|SparseUnivariatePolynomial| $) |IPF;definingPolynomial;Sup;24|
              |IPF;minimalPolynomial;$Sup;25| |IPF;charthRoot;2$;26|
              (|Union| 71 '#1="failed") (|Matrix| $) (|Union| 82 '"failed")
              (|CardinalNumber|) (|OnePointCompletion| 45) (|Factored| 82)
              (|Union| 93 '#1#) (|List| 82) (|InputForm|) (|List| $)
              (|Union| 22 '"failed") (|Fraction| 20)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 98 '#2="failed") (|Union| 95 '#2#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 95) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|HashState|) (|OutputForm|))
           '#(|zero?| 147 |tableForDiscreteLogarithm| 152 |retractIfCan| 157
              |retract| 162 |represents| 167 |representationType| 172 |recip|
              176 |primitiveElement| 181 |normalElement| 185
              |minimalPolynomial| 189 |lookup| 194 |index| 199 |inGroundField?|
              204 |generator| 209 |factorsOfCyclicGroupSize| 213
              |extensionDegree| 217 |degree| 221 |definingPolynomial| 226
              |createPrimitiveElement| 230 |createNormalElement| 234
              |coordinates| 238 |convert| 243 |coerce| 248 |charthRoot| 253
              |characteristic| 258 |basis| 262 ^ 271 |Zero| 277 |One| 281 *
              285)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |FiniteFieldCategory&|
                |ExtensionField&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL NIL
                |DivisionRing&| NIL |DifferentialRing&| NIL |Algebra&|
                |EntireRing&| |Algebra&| NIL |VectorSpace&| |Rng&| NIL
                |Module&| |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL
                NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL
                |Finite&| NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| NIL NIL |Magma&| |AbelianSemiGroup&|
                |SetCategory&| NIL |RetractableTo&| NIL NIL NIL NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| $$) (|FiniteFieldCategory|)
                 (|ExtensionField| $$) (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|EuclideanDomain|) (|PolynomialFactorizationExplicit|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|CommutativeRing|)
                 (|DivisionRing|) (|LeftOreRing|) (|DifferentialRing|)
                 (|CharacteristicNonZero|) (|Algebra| 97) (|EntireRing|)
                 (|Algebra| $$) (|Ring|) (|VectorSpace| $$) (|Rng|)
                 (|SemiRing|) (|Module| $$) (|Module| 97) (|SemiRng|)
                 (|BiModule| $$ $$) (|BiModule| 97 97) (|NonAssociativeRing|)
                 (|LeftModule| $$) (|RightModule| 97) (|LeftModule| 97)
                 (|NonAssociativeRng|) (|RightModule| $$) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|Finite|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|StepThrough|) (|Comparable|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|ConvertibleTo| 20) (|RetractableTo| $$)
                 (|ConvertibleTo| 94) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 108))
              (|makeByteWordVec2| 85
                                  '(0 12 0 13 0 0 0 15 1 0 17 0 18 0 0 0 19 2
                                    20 0 0 0 21 2 5 0 0 22 23 2 20 17 0 0 25 1
                                    27 0 20 28 2 27 0 0 0 31 1 0 0 20 32 1 0 33
                                    0 34 2 20 0 0 0 35 2 12 44 45 0 46 1 0 0 45
                                    49 1 20 51 0 52 1 53 40 0 54 0 0 0 55 1 0
                                    45 0 56 0 57 0 58 0 47 0 59 2 47 0 60 0 61
                                    2 0 0 0 0 62 1 47 0 0 63 2 12 0 64 0 65 2
                                    69 0 22 2 70 2 69 2 0 20 73 2 79 0 2 22 80
                                    2 79 0 0 0 81 1 0 17 0 18 1 0 47 20 48 1 0
                                    33 0 76 1 0 0 0 75 1 0 0 71 74 0 0 42 43 1
                                    0 33 0 34 0 0 0 50 0 2 0 36 1 0 82 0 84 1 0
                                    45 0 56 1 0 0 45 49 1 0 17 0 68 0 2 0 16 0
                                    0 40 41 0 0 45 67 1 0 45 0 66 0 0 82 83 0 0
                                    0 55 0 2 0 37 1 0 71 0 72 1 0 20 0 30 1 0 0
                                    20 32 1 0 0 0 85 0 0 22 38 1 0 71 45 78 0 0
                                    71 77 2 0 0 0 20 24 0 0 0 19 0 0 0 15 2 0 0
                                    0 0 62)))))
           '|lookupIncomplete|)) 
