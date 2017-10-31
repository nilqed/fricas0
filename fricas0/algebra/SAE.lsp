
(SDEFUN |SAE;size;Nni;1| (($ |NonNegativeInteger|))
        (EXPT (SPADCALL (QREFELT $ 39)) (QREFELT $ 17))) 

(SDEFUN |SAE;random;$;2| (($ $))
        (SPROG ((#1=#:G709 NIL) (|i| NIL) (#2=#:G708 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 21)))
                        . #4=(|SAE;random;$;2|))
                  (SEQ (LETT |i| 0 . #4#) (LETT #1# #3# . #4#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (EXIT (SETELT #2# |i| (SPADCALL (QREFELT $ 41)))))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  #2#)
                 (QREFELT $ 43))))) 

(SDEFUN |SAE;Zero;$;3| (($ $)) (|spadConstant| $ 45)) 

(SDEFUN |SAE;One;$;4| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |SAE;*;R2$;5| ((|c| R) (|x| $) ($ $)) (SPADCALL |c| |x| (QREFELT $ 47))) 

(SDEFUN |SAE;*;I2$;6| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 50))) 

(SDEFUN |SAE;coerce;I$;7| ((|n| |Integer|) ($ $)) (SPADCALL |n| (QREFELT $ 52))) 

(SDEFUN |SAE;coerce;R$;8| ((|c| R) ($ $)) (SPADCALL |c| 0 (QREFELT $ 37))) 

(SDEFUN |SAE;coerce;$Of;9| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 56))) 

(PUT '|SAE;lift;$UP;10| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SAE;lift;$UP;10| ((|x| $) ($ UP)) |x|) 

(SDEFUN |SAE;reduce;UP$;11| ((|p| UP) ($ $))
        (QCDR (SPADCALL |p| (QREFELT $ 8) (QREFELT $ 60)))) 

(SDEFUN |SAE;=;2$B;12| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 62))) 

(SDEFUN |SAE;hashUpdate!;Hs$Hs;13| ((|s| . #1=(|HashState|)) (|x| $) ($ . #1#))
        (SPADCALL |s| |x| (QREFELT $ 65))) 

(SDEFUN |SAE;+;3$;14| ((|x| $) (|y| $) ($ $)) (SPADCALL |x| |y| (QREFELT $ 67))) 

(SDEFUN |SAE;-;2$;15| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 69))) 

(SDEFUN |SAE;*;3$;16| ((|x| $) (|y| $) ($ $))
        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 71)) (QREFELT $ 61))) 

(SDEFUN |SAE;coordinates;$V;17| ((|x| $) ($ |Vector| R))
        (SPROG ((#1=#:G728 NIL) (|i| NIL) (#2=#:G727 NIL))
               (SEQ
                (PROGN
                 (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 21)))
                       . #4=(|SAE;coordinates;$V;17|))
                 (SEQ (LETT |i| 0 . #4#) (LETT #1# #3# . #4#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# |i|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 58)) |i|
                                          (QREFELT $ 73)))))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT NIL))
                 #2#)))) 

(SDEFUN |SAE;represents;V$;18| ((|vect| |Vector| R) ($ $))
        (SPROG
         ((#1=#:G730 NIL) (#2=#:G729 ($)) (#3=#:G731 ($)) (#4=#:G733 NIL)
          (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|SAE;represents;V$;18|))
           (SEQ (LETT |i| 0 . #5#) (LETT #4# (QREFELT $ 21) . #5#) G190
                (COND ((|greater_SI| |i| #4#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (SPADCALL |vect| (+ |i| 1) (QREFELT $ 75))
                                   |i| (QREFELT $ 37))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 68)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 30))))))) 

(SDEFUN |SAE;definingPolynomial;UP;19| (($ UP)) (QREFELT $ 8)) 

(SDEFUN |SAE;characteristic;Nni;20| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 77))) 

(SDEFUN |SAE;rank;Pi;21| (($ |PositiveInteger|))
        (SPROG ((#1=#:G736 NIL))
               (PROG1 (LETT #1# (QREFELT $ 17) |SAE;rank;Pi;21|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |SAE;basis;V;22| (($ |Vector| $))
        (SPADCALL (QREFELT $ 38) (QREFELT $ 82))) 

(SDEFUN |SAE;minimalPolynomial;$UP;23| ((|x| $) ($ UP))
        (SPADCALL (SPADCALL |x| (QREFELT $ 85)) (QREFELT $ 86))) 

(SDEFUN |SAE;coordinates;$VV;24| ((|x| $) (|bas| |Vector| $) ($ |Vector| R))
        (SPROG ((|m| (|Union| (|Matrix| R) "failed")))
               (SEQ
                (LETT |m|
                      (SPADCALL
                       (SPADCALL (SPADCALL |bas| (QREFELT $ 88))
                                 (QREFELT $ 89))
                       (QREFELT $ 90))
                      |SAE;coordinates;$VV;24|)
                (EXIT
                 (COND
                  ((QEQCAR |m| 1)
                   (|error| "coordinates: second argument must be a basis"))
                  ('T
                   (SPADCALL (QCDR |m|) (SPADCALL |x| (QREFELT $ 74))
                             (QREFELT $ 91)))))))) 

(SDEFUN |SAE;coordinates;$VV;25| ((|x| $) (|bas| |Vector| $) ($ |Vector| R))
        (SPROG
         ((|xi| (|qf|)) (#1=#:G756 NIL) (|i| NIL) (|vec| (|Vector| R))
          (|vecQF| (|Vector| |qf|)) (|coordsQF| (|Vector| |qf|))
          (|m| (|Union| (|Matrix| |qf|) #2="failed")) (|mat| (|Matrix| R))
          (|imatqf|
           (CATEGORY |package|
            (SIGNATURE |rowEchelon| (#3=(|Matrix| |qf|) #4=(|Matrix| R)))
            (SIGNATURE |inverse| ((|Union| #3# "failed") #4#))
            (IF (|has| (|Vector| |qf|) (|shallowlyMutable|))
                (SIGNATURE |nullSpace| ((|List| (|Vector| R)) #4#))
                |noBranch|)))
          (|qf|
           (|Join| (|QuotientFieldCategory| R)
                   (CATEGORY |package|
                    (IF (|has| R (|IntegerNumberSystem|))
                        (IF (|has| R (|OpenMath|))
                            (ATTRIBUTE (|OpenMath|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| R (|Canonical|))
                        (IF (|has| R (|GcdDomain|))
                            (IF (|has| R (|canonicalUnitNormal|))
                                (ATTRIBUTE (|Canonical|))
                                |noBranch|)
                            |noBranch|)
                        |noBranch|)))))
         (SEQ
          (LETT |qf| (|Fraction| (QREFELT $ 6))
                . #5=(|SAE;coordinates;$VV;25|))
          (LETT |imatqf|
                (|InnerMatrixQuotientFieldFunctions| (QREFELT $ 6)
                                                     (|Vector| (QREFELT $ 6))
                                                     (|Vector| (QREFELT $ 6))
                                                     (|Matrix| (QREFELT $ 6))
                                                     |qf| (|Vector| |qf|)
                                                     (|Vector| |qf|)
                                                     (|Matrix| |qf|))
                . #5#)
          (LETT |mat| (SPADCALL (SPADCALL |bas| (QREFELT $ 88)) (QREFELT $ 89))
                . #5#)
          (LETT |m|
                (SPADCALL |mat|
                          (|compiledLookupCheck| '|inverse|
                                                 (LIST
                                                  (LIST '|Union|
                                                        (LIST '|Matrix|
                                                              (|devaluate|
                                                               |qf|))
                                                        '#2#)
                                                  (LIST '|Matrix|
                                                        (|devaluate|
                                                         (ELT $ 6))))
                                                 |imatqf|))
                . #5#)
          (EXIT
           (COND
            ((QEQCAR |m| 1)
             (|error| "coordinates: second argument must be a basis"))
            ('T
             (SEQ
              (LETT |coordsQF|
                    (SPADCALL
                     (|compiledLookupCheck| '|coerce|
                                            (LIST '$ (|devaluate| (ELT $ 6)))
                                            |qf|)
                     (SPADCALL |x| (QREFELT $ 74))
                     (|compiledLookupCheck| '|map|
                                            (LIST
                                             (LIST '|Vector|
                                                   (|devaluate| |qf|))
                                             (LIST '|Mapping|
                                                   (|devaluate| |qf|)
                                                   (|devaluate| (ELT $ 6)))
                                             (LIST '|Vector|
                                                   (|devaluate| (ELT $ 6))))
                                            (|VectorFunctions2| (ELT $ 6)
                                                                |qf|)))
                    . #5#)
              (LETT |vecQF|
                    (SPADCALL (QCDR |m|) |coordsQF|
                              (|compiledLookupCheck| '*
                                                     (LIST
                                                      (LIST '|Vector|
                                                            (|devaluate| |qf|))
                                                      '$
                                                      (LIST '|Vector|
                                                            (|devaluate|
                                                             |qf|)))
                                                     (|Matrix| |qf|)))
                    . #5#)
              (LETT |vec| (MAKEARR1 (QREFELT $ 17) (|spadConstant| $ 31))
                    . #5#)
              (SEQ (LETT |i| 1 . #5#) (LETT #1# (QREFELT $ 17) . #5#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |xi| (QAREF1O |vecQF| |i| 1) . #5#)
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL |xi|
                                      (|compiledLookupCheck| '|denom|
                                                             (LIST
                                                              (|devaluate|
                                                               (ELT $ 6))
                                                              '$)
                                                             |qf|))
                            (|spadConstant| $ 36) (QREFELT $ 93))
                           (QSETAREF1O |vec| |i|
                                       (SPADCALL |xi|
                                                 (|compiledLookupCheck|
                                                  '|numer|
                                                  (LIST (|devaluate| (ELT $ 6))
                                                        '$)
                                                  |qf|))
                                       1))
                          ('T
                           (|error|
                            "coordinates: coordinates are not integral over ground ring")))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |vec|)))))))) 

(SDEFUN |SAE;reducedSystem;MM;26| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPADCALL (SPADCALL (ELT $ 58) |m| (QREFELT $ 98)) (QREFELT $ 100))) 

(SDEFUN |SAE;reducedSystem;MVR;27|
        ((|m| |Matrix| $) (|v| |Vector| $)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPADCALL (SPADCALL (ELT $ 58) |m| (QREFELT $ 98))
                  (SPADCALL (ELT $ 58) |v| (QREFELT $ 104)) (QREFELT $ 106))) 

(SDEFUN |SAE;discriminant;R;28| (($ R))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 35) (QREFELT $ 108)) (|SAE;mkDisc| NIL $)))
         (EXIT (SPADCALL (QREFELT $ 34) (QREFELT $ 109))))) 

(SDEFUN |SAE;mkDisc| ((|b| |Boolean|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 35) |b| (QREFELT $ 111))
             (SPADCALL (QREFELT $ 34) (SPADCALL (QREFELT $ 8) (QREFELT $ 112))
                       (QREFELT $ 113))
             (EXIT (SPADCALL (QREFELT $ 115))))) 

(SDEFUN |SAE;traceMatrix;M;30| (($ |Matrix| R))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 28) (QREFELT $ 108)) (|SAE;mkDiscMat| NIL $)))
         (EXIT (QREFELT $ 24)))) 

(SDEFUN |SAE;mkDiscMat| ((|b| |Boolean|) ($ |Void|))
        (SPROG
         ((#1=#:G774 NIL) (|j| NIL) (#2=#:G773 NIL) (|i| NIL)
          (|mc| (|Integer|)) (|mr| (|Integer|)))
         (SEQ (SPADCALL (QREFELT $ 28) |b| (QREFELT $ 111))
              (LETT |mr| 1 . #3=(|SAE;mkDiscMat|)) (LETT |mc| 1 . #3#)
              (SEQ (LETT |i| 0 . #3#) (LETT #2# (QREFELT $ 21) . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 0 . #3#) (LETT #1# (QREFELT $ 21) . #3#)
                          G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O (QREFELT $ 24) (+ |mr| |i|)
                                        (+ |mc| |j|)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 36)
                                                    (+ |i| |j|)
                                                    (QREFELT $ 117))
                                          (QREFELT $ 61))
                                         (QREFELT $ 118))
                                        1 1)))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT $ 115)))))) 

(SDEFUN |SAE;trace;$R;32| ((|x| $) ($ R))
        (SPROG ((|ans| (R)) (|xn| ($)) (#1=#:G779 NIL) (|n| NIL))
               (SEQ (LETT |xn| |x| . #2=(|SAE;trace;$R;32|))
                    (LETT |ans|
                          (SPADCALL (SPADCALL |xn| (QREFELT $ 58)) 0
                                    (QREFELT $ 73))
                          . #2#)
                    (SEQ (LETT |n| 1 . #2#) (LETT #1# (QREFELT $ 21) . #2#)
                         G190 (COND ((|greater_SI| |n| #1#) (GO G191)))
                         (SEQ
                          (LETT |xn|
                                (SPADCALL (SPADCALL (QREFELT $ 119)) |xn|
                                          (QREFELT $ 72))
                                . #2#)
                          (EXIT
                           (LETT |ans|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |xn| (QREFELT $ 58)) |n|
                                            (QREFELT $ 73))
                                  |ans| (QREFELT $ 120))
                                 . #2#)))
                         (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |SAE;fac1| ((|up| UP) ($ |Factored| UP))
        (SPROG ((|f1| (|Factored| (|SparseUnivariatePolynomial| R))))
               (SEQ
                (LETT |f1|
                      (SPADCALL (SPADCALL |up| (QREFELT $ 122))
                                (QREFELT $ 125))
                      |SAE;fac1|)
                (EXIT (SPADCALL (ELT $ 126) |f1| (QREFELT $ 131)))))) 

(SDEFUN |SAE;factorPolynomial;SupF;34|
        ((|up| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |up| (CONS (|function| |SAE;fac1|) $) (QREFELT $ 136))) 

(SDEFUN |SAE;index;Pi$;35| ((|k| |PositiveInteger|) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|ans| ($)) (|a| (R)) (#1=#:G796 NIL)
          (|h| (|Integer|)) (|j| NIL) (|p| (|Integer|)))
         (SEQ
          (LETT |i| (REM |k| (SPADCALL (QREFELT $ 40)))
                . #2=(|SAE;index;Pi$;35|))
          (LETT |p| (SPADCALL (QREFELT $ 39)) . #2#)
          (LETT |ans| (|spadConstant| $ 30) . #2#)
          (SEQ (LETT |j| 0 . #2#) G190
               (COND ((NULL (SPADCALL |i| 0 (QREFELT $ 138))) (GO G191)))
               (SEQ (LETT |h| (REM |i| |p|) . #2#)
                    (COND
                     ((SPADCALL |h| 0 (QREFELT $ 139))
                      (SEQ
                       (LETT |a|
                             (SPADCALL
                              (PROG1 (LETT #1# |h| . #2#)
                                (|check_subtype2| (> #1# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #1#))
                              (QREFELT $ 140))
                             . #2#)
                       (EXIT
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL
                                         (SPADCALL |a| |j| (QREFELT $ 117))
                                         (QREFELT $ 61))
                                        (QREFELT $ 68))
                              . #2#)))))
                    (EXIT (LETT |i| (QUOTIENT2 |i| |p|) . #2#)))
               (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |SAE;lookup;$Pi;36| ((|z| $) ($ |PositiveInteger|))
        (SPROG
         ((|co| (|Integer|)) (|n| (|NonNegativeInteger|)) (|p| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |z| (QREFELT $ 142)) (SPADCALL (QREFELT $ 40)))
                (#1='T
                 (SEQ
                  (LETT |p| (SPADCALL (QREFELT $ 39))
                        . #2=(|SAE;lookup;$Pi;36|))
                  (LETT |co|
                        (SPADCALL (SPADCALL |z| (QREFELT $ 143))
                                  (QREFELT $ 144))
                        . #2#)
                  (LETT |n| (SPADCALL |z| (QREFELT $ 16)) . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (NULL
                           (SPADCALL
                            (LETT |z| (SPADCALL |z| (QREFELT $ 145)) . #2#)
                            (QREFELT $ 142))))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |co|
                               (+
                                (* |co|
                                   (EXPT |p|
                                         (- |n|
                                            (LETT |n|
                                                  (SPADCALL |z| (QREFELT $ 16))
                                                  . #2#))))
                                (SPADCALL (SPADCALL |z| (QREFELT $ 143))
                                          (QREFELT $ 144)))
                               . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |co|)
                         (#1# (* |co| (EXPT |p| |n|))))))))))) 

(DECLAIM (NOTINLINE |SimpleAlgebraicExtension;|)) 

(DEFUN |SimpleAlgebraicExtension| (&REST #1=#:G856)
  (SPROG NIL
         (PROG (#2=#:G857)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SimpleAlgebraicExtension|)
                                               '|domainEqualList|)
                    . #3=(|SimpleAlgebraicExtension|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SimpleAlgebraicExtension;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SimpleAlgebraicExtension|)))))))))) 

(DEFUN |SimpleAlgebraicExtension;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G855 NIL) (|i| NIL) (#2=#:G854 NIL) (#3=#:G700 NIL) (#4=#:G695 NIL)
    (|pv$| NIL) (#5=#:G851 NIL) (#6=#:G852 NIL) (#7=#:G853 NIL) ($ NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #8=(|SimpleAlgebraicExtension|))
     (LETT DV$2 (|devaluate| |#2|) . #8#)
     (LETT DV$3 (|devaluate| |#3|) . #8#)
     (LETT |dv$| (LIST '|SimpleAlgebraicExtension| DV$1 DV$2 DV$3) . #8#)
     (LETT $ (GETREFV 179) . #8#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|))
                                         (LETT #7#
                                               (|HasCategory| |#1| '(|Field|))
                                               . #8#)
                                         (OR #7#
                                             (|HasCategory| |#1|
                                                            '(|FiniteFieldCategory|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1| '(|Finite|))
                                         (OR
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|DifferentialRing|))
                                           #7#)
                                          (|HasCategory| |#1|
                                                         '(|FiniteFieldCategory|)))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (LETT #6#
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#1|
                                                               '(|Field|)))
                                               . #8#)
                                         (OR #6#
                                             (AND
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#1|
                                                             '(|FiniteFieldCategory|))))
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #7#)
                                         (LETT #5#
                                               (|HasCategory| |#1|
                                                              '(|PolynomialFactorizationExplicit|))
                                               . #8#)
                                         (AND #7# #5#)))
                     . #8#))
     (|haddProp| |$ConstructorCache| '|SimpleAlgebraicExtension|
                 (LIST DV$1 DV$2 DV$3) (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (QSETREFV $ 8 |#3|)
     (AND
      (OR (AND #7# #5# (|HasCategory| $ '(|CharacteristicNonZero|)))
          (|HasCategory| |#1| '(|FiniteFieldCategory|)))
      (|augmentPredVector| $ 32768))
     (AND
      (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
          (AND #7# #5# (|HasCategory| $ '(|CharacteristicNonZero|))))
      (|augmentPredVector| $ 65536))
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 12 (SPADCALL (SPADCALL |#3| (QREFELT $ 9)) (QREFELT $ 11)))
     (COND
      ((QEQCAR (QREFELT $ 12) 1) (|error| "Modulus cannot be made monic")))
     (QSETREFV $ 13 |#2|)
     (SETELT $ 8
             (SPADCALL
              (PROG2 (LETT #4# #9=(QREFELT $ 12) . #8#)
                  (QCDR #4#)
                (|check_union2| (QEQCAR #4# 0) #9# (|Union| #9# #10="failed")
                                #4#))
              |#3| (QREFELT $ 14)))
     (QSETREFV $ 17 (SPADCALL |#3| (QREFELT $ 16)))
     (QSETREFV $ 21
               (PROG2
                   (LETT #3# (SPADCALL (QREFELT $ 17) 1 (QREFELT $ 20)) . #8#)
                   (QCDR #3#)
                 (|check_union2| (QEQCAR #3# 0) (|NonNegativeInteger|)
                                 (|Union| (|NonNegativeInteger|) #10#) #3#)))
     (QSETREFV $ 24 (SPADCALL (QREFELT $ 17) (QREFELT $ 17) (QREFELT $ 23)))
     (QSETREFV $ 28 (SPADCALL 'T (QREFELT $ 27)))
     (QSETREFV $ 34 (SPADCALL (|spadConstant| $ 31) (QREFELT $ 33)))
     (QSETREFV $ 35 (SPADCALL 'T (QREFELT $ 27)))
     (QSETREFV $ 38
               (PROGN
                (LETT #2# (GETREFV (|inc_SI| #11=(QREFELT $ 21))) . #8#)
                (SEQ (LETT |i| 0 . #8#) (LETT #1# #11# . #8#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SETELT #2# |i|
                               (SPADCALL (|spadConstant| $ 36) |i|
                                         (QREFELT $ 37)))))
                     (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
                #2#))
     (COND
      ((|testBitVector| |pv$| 6)
       (PROGN
        (QSETREFV $ 40 (CONS (|dispatchFunction| |SAE;size;Nni;1|) $))
        (QSETREFV $ 44 (CONS (|dispatchFunction| |SAE;random;$;2|) $)))))
     (COND
      ((|testBitVector| |pv$| 3)
       (QSETREFV $ 87
                 (CONS (|dispatchFunction| |SAE;minimalPolynomial;$UP;23|)
                       $))))
     (COND
      ((|testBitVector| |pv$| 3)
       (QSETREFV $ 92 (CONS (|dispatchFunction| |SAE;coordinates;$VV;24|) $)))
      ((|HasCategory| |#1| '(|IntegralDomain|))
       (QSETREFV $ 92 (CONS (|dispatchFunction| |SAE;coordinates;$VV;25|) $))))
     (COND
      ((|testBitVector| |pv$| 3)
       (COND
        ((|testBitVector| |pv$| 14)
         (PROGN
          (QSETREFV $ 137
                    (CONS (|dispatchFunction| |SAE;factorPolynomial;SupF;34|)
                          $)))))))
     (COND
      ((|testBitVector| |pv$| 6)
       (PROGN
        (QSETREFV $ 141 (CONS (|dispatchFunction| |SAE;index;Pi$;35|) $))
        (QSETREFV $ 146 (CONS (|dispatchFunction| |SAE;lookup;$Pi;36|) $)))))
     $)))) 

(MAKEPROP '|SimpleAlgebraicExtension| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |leadingCoefficient|) (|Union| $ '"failed")
              (5 . |recip|) '|r| '|Rep| (10 . *) (|NonNegativeInteger|)
              (16 . |degree|) '|d| (21 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SAE;One;$;4|) $))
              (25 . |subtractIfCan|) '|d1| (|Matrix| 6) (31 . |zero|)
              '|discmat| (|Boolean|) (|Reference| 25) (37 . |ref|)
              '|nodiscmat?| (42 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SAE;Zero;$;3|) $))
              (46 . |Zero|) (|Reference| 6) (50 . |ref|) '|disc| '|nodisc?|
              (55 . |One|) (59 . |monomial|) '|bsis| (65 . |size|)
              (69 . |size|) (73 . |random|) (|Vector| 6) |SAE;represents;V$;18|
              (77 . |random|) (81 . |Zero|) (85 . |One|) (89 . *) |SAE;*;R2$;5|
              (|Integer|) (95 . *) |SAE;*;I2$;6| (101 . |coerce|)
              |SAE;coerce;I$;7| |SAE;coerce;R$;8| (|OutputForm|)
              (106 . |coerce|) |SAE;coerce;$Of;9| |SAE;lift;$UP;10|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (111 . |monicDivide|) |SAE;reduce;UP$;11| (117 . =)
              |SAE;=;2$B;12| (|HashState|) (123 . |hashUpdate!|)
              |SAE;hashUpdate!;Hs$Hs;13| (129 . +) |SAE;+;3$;14| (135 . -)
              |SAE;-;2$;15| (140 . *) |SAE;*;3$;16| (146 . |coefficient|)
              |SAE;coordinates;$V;17| (152 . |elt|)
              |SAE;definingPolynomial;UP;19| (158 . |characteristic|)
              |SAE;characteristic;Nni;20| (|PositiveInteger|) |SAE;rank;Pi;21|
              (|Vector| $$) (162 . |copy|) (|Vector| $) |SAE;basis;V;22|
              (167 . |characteristicPolynomial|) (172 . |squareFreePart|)
              (177 . |minimalPolynomial|) (182 . |coordinates|)
              (187 . |transpose|) (192 . |inverse|) (197 . *)
              (203 . |coordinates|) (209 . =) (|Matrix| 7) (|Mapping| 7 $$)
              (|Matrix| $$)
              (|MatrixCategoryFunctions2| $$ 81 81 96 7 102 102 94)
              (215 . |map|) (|Matrix| $) (221 . |reducedSystem|)
              |SAE;reducedSystem;MM;26| (|Vector| 7) (|VectorFunctions2| $$ 7)
              (226 . |map|) (|Record| (|:| |mat| 22) (|:| |vec| 42))
              (232 . |reducedSystem|) |SAE;reducedSystem;MVR;27| (238 . |elt|)
              (243 . |elt|) |SAE;discriminant;R;28| (248 . |setelt!|)
              (254 . |discriminant|) (259 . |setelt!|) (|Void|) (265 . |void|)
              |SAE;traceMatrix;M;30| (269 . |monomial|) |SAE;trace;$R;32|
              (275 . |generator|) (279 . +) (|SparseUnivariatePolynomial| 6)
              (285 . |makeSUP|) (|Factored| 124)
              (|SparseUnivariatePolynomial| $) (290 . |factorPolynomial|)
              (295 . |unmakeSUP|) (|Factored| 7) (|Mapping| 7 121)
              (|Factored| 121) (|FactoredFunctions2| 121 7) (300 . |map|)
              (|Factored| 133) (|SparseUnivariatePolynomial| $$)
              (|Mapping| 127 7) (|InnerAlgFactor| 6 7 $$ 133) (306 . |factor|)
              (312 . |factorPolynomial|) (317 . >) (323 . ~=) (329 . |index|)
              (334 . |index|) (339 . |zero?|) (344 . |leadingCoefficient|)
              (349 . |lookup|) (354 . |reductum|) (359 . |lookup|) (|List| 149)
              (|List| 15) (|Symbol|) (|Union| 151 '#1="failed") (|List| 124)
              (|Union| 83 '#1#) (|Fraction| 49) (|Factored| $) (|List| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |coef| 155) (|:| |generator| $))
              (|Union| 155 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 161 '"failed") (|Mapping| 6 6) (|Fraction| 7)
              (|InputForm|) (|OnePointCompletion| 79) (|Union| 15 '"failed")
              (|Record| (|:| |factor| 49) (|:| |exponent| 49)) (|List| 168)
              (|Table| 79 15)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |mat| 173) (|:| |vec| (|Vector| 49)))
              (|Matrix| 49) (|Union| 153 '#2="failed") (|Union| 49 '#2#)
              (|Union| 6 '#2#) (|String|) (|SingleInteger|))
           '#(~= 364 |zero?| 370 |unitNormal| 375 |unitCanonical| 380 |unit?|
              385 |traceMatrix| 390 |trace| 399 |tableForDiscreteLogarithm| 404
              |subtractIfCan| 409 |squareFreePolynomial| 415 |squareFreePart|
              420 |squareFree| 425 |solveLinearPolynomialEquation| 430
              |smaller?| 436 |sizeLess?| 442 |size| 448 |sample| 452
              |retractIfCan| 456 |retract| 471 |represents| 486
              |representationType| 497 |rem| 501 |regularRepresentation| 507
              |reducedSystem| 518 |reduce| 540 |recip| 550 |rank| 555 |random|
              559 |quo| 563 |principalIdeal| 569 |primitiveElement| 574
              |primitive?| 578 |primeFrobenius| 583 |prime?| 594 |order| 599
              |opposite?| 609 |one?| 615 |norm| 620 |nextItem| 625
              |multiEuclidean| 630 |minimalPolynomial| 636 |lookup| 641 |lift|
              646 |lcmCoef| 651 |lcm| 657 |latex| 668 |inv| 673 |init| 678
              |index| 682 |hashUpdate!| 687 |hash| 693 |generator| 698
              |gcdPolynomial| 702 |gcd| 708 |factorsOfCyclicGroupSize| 719
              |factorSquareFreePolynomial| 723 |factorPolynomial| 728 |factor|
              733 |extendedEuclidean| 738 |exquo| 751 |expressIdealMember| 757
              |euclideanSize| 763 |enumerate| 768 |divide| 772 |discriminant|
              778 |discreteLog| 787 |differentiate| 798 |derivationCoordinates|
              848 |definingPolynomial| 854 |createPrimitiveElement| 858
              |coordinates| 862 |convert| 884 |conditionP| 909 |coerce| 914
              |charthRoot| 939 |characteristicPolynomial| 949 |characteristic|
              954 |basis| 958 |associates?| 962 |annihilate?| 968 ^ 974 |Zero|
              992 |One| 996 D 1000 = 1050 / 1056 - 1062 + 1073 * 1079)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(0 2 2 4 4 15 4 3 0 4 0 3 4 0 0 3 3 3 3 0 0 0
                                  1 3 3 3 5 7 12 10 0 0 0 3 0 0 0 0 0 3 3 0 0 0
                                  0 0 0 6 0 0 6 2 0 0 0 0 0 0 0 0 3 3 3 6 8 9))
            (CONS
             '#(|MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |FramedAlgebra&| |GcdDomain&|
                |FiniteRankAlgebra&| |DivisionRing&| NIL |Algebra&|
                |FullyLinearlyExplicitOver&| |Algebra&| NIL |Algebra&|
                |DifferentialExtension&| NIL NIL |Module&| NIL |Module&|
                |EntireRing&| |Module&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| NIL NIL |Ring&| NIL NIL NIL NIL
                |Rng&| NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |Finite&| |SemiGroup&| |AbelianSemiGroup&| NIL
                NIL |FullyRetractableTo&| |SetCategory&| |RetractableTo&| NIL
                NIL NIL |BasicType&| NIL NIL NIL NIL NIL |RetractableTo&|
                |RetractableTo&|)
             (CONS
              '#((|MonogenicAlgebra| 6 7) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|FramedAlgebra| 6 7)
                 (|GcdDomain|) (|FiniteRankAlgebra| 6 7) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 6)
                 (|FullyLinearlyExplicitOver| 6) (|Algebra| $$) (|LeftOreRing|)
                 (|Algebra| 153) (|DifferentialExtension| 6)
                 (|LinearlyExplicitOver| 6) (|CommutativeRing|) (|Module| 6)
                 (|CharacteristicZero|) (|Module| $$) (|EntireRing|)
                 (|Module| 153) (|CharacteristicNonZero|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 149) (|LinearlyExplicitOver| 49)
                 (|BiModule| $$ $$) (|Ring|) (|BiModule| 6 6)
                 (|BiModule| 153 153) (|LeftModule| $$) (|RightModule| $$)
                 (|Rng|) (|RightModule| 6) (|LeftModule| 6) (|LeftModule| 153)
                 (|RightModule| 153) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|Finite|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|RetractableTo| 6)
                 (|ConvertibleTo| 7) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 55) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|ConvertibleTo| 165) (|RetractableTo| 153)
                 (|RetractableTo| 49))
              (|makeByteWordVec2| 178
                                  '(1 7 6 0 9 1 6 10 0 11 2 7 0 6 0 14 1 13 15
                                    0 16 0 7 0 18 2 15 10 0 0 20 2 22 0 15 15
                                    23 1 26 0 25 27 0 7 0 29 0 6 0 31 1 32 0 6
                                    33 0 6 0 36 2 13 0 6 15 37 0 6 15 39 0 0 15
                                    40 0 6 0 41 0 0 0 44 0 13 0 45 0 13 0 46 2
                                    13 0 6 0 47 2 13 0 49 0 50 1 13 0 49 52 1
                                    13 55 0 56 2 13 59 0 0 60 2 13 25 0 0 62 2
                                    13 64 64 0 65 2 13 0 0 0 67 1 13 0 0 69 2
                                    13 0 0 0 71 2 7 6 0 15 73 2 42 6 0 49 75 0
                                    6 15 77 1 81 0 0 82 1 0 7 0 85 1 7 0 0 86 1
                                    0 7 0 87 1 0 22 83 88 1 22 0 0 89 1 22 10 0
                                    90 2 22 42 0 42 91 2 0 42 0 83 92 2 6 25 0
                                    0 93 2 97 94 95 96 98 1 7 22 99 100 2 103
                                    102 95 81 104 2 7 105 99 83 106 1 26 25 0
                                    108 1 32 6 0 109 2 26 25 0 25 111 1 13 6 0
                                    112 2 32 6 0 6 113 0 114 0 115 2 7 0 6 15
                                    117 0 0 0 119 2 6 0 0 0 120 1 7 121 0 122 1
                                    6 123 124 125 1 7 0 121 126 2 130 127 128
                                    129 131 2 135 132 133 134 136 1 0 123 124
                                    137 2 49 25 0 0 138 2 49 25 0 0 139 1 6 0
                                    79 140 1 0 0 79 141 1 0 25 0 142 1 13 6 0
                                    143 1 6 79 0 144 1 13 0 0 145 1 0 79 0 146
                                    2 0 25 0 0 1 1 0 25 0 142 1 3 157 0 1 1 3 0
                                    0 1 1 3 25 0 1 0 0 22 116 1 0 22 83 1 1 0 6
                                    0 118 1 2 170 49 1 2 0 10 0 0 1 1 15 123
                                    124 1 1 3 0 0 1 1 3 154 0 1 2 15 150 151
                                    124 1 2 6 25 0 0 1 2 3 25 0 0 1 0 6 15 40 0
                                    0 0 1 1 8 174 0 1 1 9 175 0 1 1 0 176 0 1 1
                                    8 153 0 1 1 9 49 0 1 1 0 6 0 1 1 0 0 42 43
                                    2 0 0 42 83 1 0 2 171 1 2 3 0 0 0 1 1 0 22
                                    0 1 2 0 22 0 83 1 2 10 172 99 83 1 1 10 173
                                    99 1 1 0 22 99 101 2 0 105 99 83 107 1 3 10
                                    164 1 1 0 0 7 61 1 0 10 0 1 0 0 79 80 0 6 0
                                    44 2 3 0 0 0 1 1 3 158 155 1 0 2 0 1 1 2 25
                                    0 1 1 2 0 0 1 2 2 0 0 15 1 1 3 25 0 1 1 2
                                    166 0 1 1 2 79 0 1 2 0 25 0 0 1 1 0 25 0 1
                                    1 0 6 0 1 1 2 10 0 1 2 3 159 155 0 1 1 3 7
                                    0 87 1 6 79 0 146 1 0 7 0 58 2 3 156 0 0 1
                                    1 3 0 155 1 2 3 0 0 0 1 1 0 177 0 1 1 3 0 0
                                    1 0 2 0 1 1 6 0 79 141 2 0 64 64 0 66 1 0
                                    178 0 1 0 0 0 119 2 3 124 124 124 1 1 3 0
                                    155 1 2 3 0 0 0 1 0 2 169 1 1 15 123 124 1
                                    1 15 123 124 137 1 3 154 0 1 2 3 160 0 0 1
                                    3 3 162 0 0 0 1 2 3 10 0 0 1 2 3 159 155 0
                                    1 1 3 15 0 1 0 6 155 1 2 3 59 0 0 1 0 0 6
                                    110 1 0 6 83 1 2 2 167 0 0 1 1 2 15 0 1 3
                                    11 0 0 149 15 1 3 11 0 0 147 148 1 2 11 0 0
                                    149 1 2 11 0 0 147 1 2 7 0 0 15 1 1 7 0 0 1
                                    2 3 0 0 163 1 3 3 0 0 163 15 1 2 3 22 83
                                    163 1 0 0 7 76 0 2 0 1 1 0 42 0 74 1 0 22
                                    83 88 2 0 22 83 83 1 2 0 42 0 83 92 1 6 165
                                    0 1 1 0 0 7 1 1 0 7 0 1 1 0 0 42 1 1 0 42 0
                                    1 1 16 152 99 1 1 13 0 153 1 1 3 0 0 1 1 0
                                    0 6 54 1 0 0 49 53 1 0 55 0 57 1 17 10 0 1
                                    1 2 0 0 1 1 0 7 0 85 0 0 15 78 0 0 83 84 2
                                    3 25 0 0 1 2 0 25 0 0 1 2 3 0 0 49 1 2 0 0
                                    0 15 1 2 0 0 0 79 1 0 0 0 30 0 0 0 19 3 11
                                    0 0 147 148 1 3 11 0 0 149 15 1 2 11 0 0
                                    149 1 2 11 0 0 147 1 2 7 0 0 15 1 1 7 0 0 1
                                    2 3 0 0 163 1 3 3 0 0 163 15 1 2 0 25 0 0
                                    63 2 3 0 0 0 1 1 0 0 0 70 2 0 0 0 0 1 2 0 0
                                    0 0 68 2 3 0 0 153 1 2 3 0 153 0 1 2 0 0 6
                                    0 48 2 0 0 0 6 1 2 0 0 49 0 51 2 0 0 0 0 72
                                    2 0 0 15 0 1 2 0 0 79 0 1)))))
           '|lookupComplete|)) 
