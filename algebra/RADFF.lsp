
(SDEFUN |RADFF;discriminant;F;1| (($ |Fraction| UP))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| NIL $)))
         (EXIT (SPADCALL (QREFELT $ 24) (QREFELT $ 40))))) 

(SDEFUN |RADFF;radcand| (($ UP))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| NIL $)))
         (EXIT (SPADCALL (QREFELT $ 28) (QREFELT $ 42))))) 

(SDEFUN |RADFF;integralBasis;V;3| (($ |Vector| $))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| NIL $)))
         (EXIT (|RADFF;diag| (QREFELT $ 31) $)))) 

(SDEFUN |RADFF;integralBasisAtInfinity;V;4| (($ |Vector| $))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| NIL $)))
         (EXIT (|RADFF;diag| (QREFELT $ 33) $)))) 

(SDEFUN |RADFF;basisvec| (($ |Vector| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| NIL $)))
         (EXIT (QREFELT $ 31)))) 

(SDEFUN |RADFF;integralMatrix;M;6| (($ |Matrix| (|Fraction| UP)))
        (SPADCALL (|RADFF;basisvec| $) (QREFELT $ 47))) 

(SDEFUN |RADFF;integralMatrixAtInfinity;M;7| (($ |Matrix| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| NIL $)))
         (EXIT (SPADCALL (QREFELT $ 33) (QREFELT $ 47))))) 

(SDEFUN |RADFF;inverseIntegralMatrix;M;8| (($ |Matrix| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| NIL $)))
         (EXIT (SPADCALL (QREFELT $ 32) (QREFELT $ 47))))) 

(SDEFUN |RADFF;inverseIntegralMatrixAtInfinity;M;9|
        (($ |Matrix| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| NIL $)))
         (EXIT (SPADCALL (QREFELT $ 34) (QREFELT $ 47))))) 

(SDEFUN |RADFF;definingPolynomial;UPUP;10| (($ UPUP)) (QREFELT $ 30)) 

(SDEFUN |RADFF;ramified?;FB;11| ((|point| F) ($ |Boolean|))
        (SPADCALL (SPADCALL (|RADFF;radcand| $) |point| (QREFELT $ 53))
                  (QREFELT $ 54))) 

(SDEFUN |RADFF;branchPointAtInfinity?;B;12| (($ |Boolean|))
        (QEQCAR
         (SPADCALL (SPADCALL (|RADFF;radcand| $) (QREFELT $ 56)) (QREFELT $ 10)
                   (QREFELT $ 58))
         1)) 

(SDEFUN |RADFF;elliptic;U;13| (($ |Union| UP "failed"))
        (SEQ
         (COND
          ((EQL (QREFELT $ 10) 2)
           (COND
            ((EQL (SPADCALL (|RADFF;radcand| $) (QREFELT $ 56)) 3)
             (EXIT (CONS 0 (|RADFF;radcand| $)))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |RADFF;hyperelliptic;U;14| (($ |Union| UP "failed"))
        (SEQ
         (COND
          ((EQL (QREFELT $ 10) 2)
           (COND
            ((ODDP (SPADCALL (|RADFF;radcand| $) (QREFELT $ 56)))
             (EXIT (CONS 0 (|RADFF;radcand| $)))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |RADFF;diag| ((|v| |Vector| (|Fraction| UP)) ($ |Vector| $))
        (SPROG ((#1=#:G773 NIL) (|i| NIL) (#2=#:G772 NIL))
               (SEQ
                (PROGN
                 (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 29)))
                       . #4=(|RADFF;diag|))
                 (SEQ (LETT |i| 0 . #4#) (LETT #1# #3# . #4#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# |i|
                                (SPADCALL
                                 (SPADCALL
                                  (QAREF1O |v| (+ |i| (QREFELT $ 38)) 1) |i|
                                  (QREFELT $ 14))
                                 (QREFELT $ 63)))))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT NIL))
                 #2#)))) 

(SDEFUN |RADFF;integralRepresents;VUP$;16| ((|v| |Vector| UP) (|d| UP) ($ $))
        (SPROG
         ((#1=#:G777 NIL) (#2=#:G779 NIL) (|i| NIL) (#3=#:G778 NIL)
          (|ib| (|Vector| (|Fraction| UP))))
         (SEQ
          (LETT |ib| (|RADFF;basisvec| $)
                . #4=(|RADFF;integralRepresents;VUP$;16|))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #3#
                   (GETREFV (|inc_SI| (- #5=(QVSIZE |ib|) #6=(QREFELT $ 38))))
                   . #4#)
             (SEQ (LETT |i| #6# . #4#) (LETT #2# #5# . #4#) (LETT #1# 0 . #4#)
                  G190 (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #3# #1#
                            (SPADCALL (QAREF1O |ib| |i| 1)
                                      (SPADCALL (QAREF1O |v| |i| 1) |d|
                                                (QREFELT $ 64))
                                      (QREFELT $ 65)))))
                  (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #4#))
                        . #4#)
                  (GO G190) G191 (EXIT NIL))
             #3#)
            (QREFELT $ 66)))))) 

(SDEFUN |RADFF;integralCoordinates;$R;17|
        ((|f| $) ($ |Record| (|:| |num| (|Vector| UP)) (|:| |den| UP)))
        (SPROG
         ((#1=#:G784 NIL) (#2=#:G786 NIL) (|i| NIL) (#3=#:G785 NIL)
          (|ib| (|Vector| (|Fraction| UP))) (|v| (|Vector| (|Fraction| UP))))
         (SEQ
          (LETT |v| (SPADCALL |f| (QREFELT $ 69))
                . #4=(|RADFF;integralCoordinates;$R;17|))
          (LETT |ib| (|RADFF;basisvec| $) . #4#)
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #3#
                   (GETREFV (|inc_SI| (- #5=(QVSIZE |ib|) #6=(QREFELT $ 38))))
                   . #4#)
             (SEQ (LETT |i| #6# . #4#) (LETT #2# #5# . #4#) (LETT #1# 0 . #4#)
                  G190 (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #3# #1#
                            (SPADCALL (QAREF1O |v| |i| 1) (QAREF1O |ib| |i| 1)
                                      (QREFELT $ 70)))))
                  (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #4#))
                        . #4#)
                  (GO G190) G191 (EXIT NIL))
             #3#)
            (QREFELT $ 73)))))) 

(SDEFUN |RADFF;integralDerivationMatrix;MR;18|
        ((|d| |Mapping| UP UP)
         ($ |Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
        (SPROG
         ((|cd| (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP)))
          (#1=#:G795 NIL) (#2=#:G797 NIL) (|i| NIL) (#3=#:G796 NIL)
          (|v| (|Vector| (|Fraction| UP))) (|dlogp| (|Fraction| UP)))
         (SEQ
          (LETT |dlogp|
                (SPADCALL (SPADCALL (QREFELT $ 9) |d| (QREFELT $ 76))
                          (SPADCALL (QREFELT $ 10) (QREFELT $ 9)
                                    (QREFELT $ 77))
                          (QREFELT $ 70))
                . #4=(|RADFF;integralDerivationMatrix;MR;18|))
          (LETT |v| (|RADFF;basisvec| $) . #4#)
          (LETT |cd|
                (SPADCALL
                 (PROGN
                  (LETT #3#
                        (GETREFV
                         (|inc_SI| (- #5=(QVSIZE |v|) #6=(QREFELT $ 38))))
                        . #4#)
                  (SEQ (LETT |i| #6# . #4#) (LETT #2# #5# . #4#)
                       (LETT #1# 0 . #4#) G190 (COND ((> |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT #3# #1#
                                 (SPADCALL
                                  (SPADCALL (- |i| (QREFELT $ 38)) |dlogp|
                                            (QREFELT $ 78))
                                  (SPADCALL
                                   (SPADCALL (QAREF1O |v| |i| 1) |d|
                                             (QREFELT $ 76))
                                   (QAREF1O |v| |i| 1) (QREFELT $ 70))
                                  (QREFELT $ 79)))))
                       (LETT #1#
                             (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #4#))
                             . #4#)
                       (GO G190) G191 (EXIT NIL))
                  #3#)
                 (QREFELT $ 73))
                . #4#)
          (EXIT (CONS (SPADCALL (QCAR |cd|) (QREFELT $ 81)) (QCDR |cd|)))))) 

(SDEFUN |RADFF;iBasis| ((|p| UP) (|d| |NonNegativeInteger|) ($ |Vector| UP))
        (SPROG
         ((#1=#:G809 NIL) (#2=#:G808 (UP)) (#3=#:G810 (UP)) (#4=#:G816 NIL)
          (|j| NIL) (#5=#:G815 NIL) (|i| NIL) (#6=#:G814 NIL)
          (|d1| (|NonNegativeInteger|)) (#7=#:G807 NIL)
          (|pl| (|PrimitiveArray| UP)))
         (SEQ
          (LETT |pl| (|RADFF;fullVector| (SPADCALL |p| (QREFELT $ 85)) |d| $)
                . #8=(|RADFF;iBasis|))
          (LETT |d1|
                (PROG1 (LETT #7# (- |d| 1) . #8#)
                  (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #7#))
                . #8#)
          (EXIT
           (PROGN
            (LETT #6# (GETREFV (|inc_SI| |d1|)) . #8#)
            (SEQ (LETT |i| 0 . #8#) (LETT #5# |d1| . #8#) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SETELT #6# |i|
                           (PROGN
                            (LETT #1# NIL . #8#)
                            (SEQ (LETT |j| 0 . #8#) (LETT #4# |d1| . #8#) G190
                                 (COND ((|greater_SI| |j| #4#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3#
                                          (SPADCALL (QAREF1 |pl| |j|)
                                                    (QUOTIENT2 (* |i| |j|) |d|)
                                                    (QREFELT $ 86))
                                          . #8#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #3# (QREFELT $ 87))
                                            . #8#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #3# . #8#)
                                       (LETT #1# 'T . #8#)))))))
                                 (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) ('T (|spadConstant| $ 88)))))))
                 (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
            #6#))))) 

(SDEFUN |RADFF;fullVector|
        ((|p| |Factored| UP) (|m| |NonNegativeInteger|)
         ($ |PrimitiveArray| UP))
        (SPROG
         ((|u|
           (|Union| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))
                    "failed"))
          (#1=#:G834 NIL) (|i| NIL)
          (|l|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))))
          (|ans| (|PrimitiveArray| UP)))
         (SEQ
          (LETT |ans| (MAKEARR1 |m| (|spadConstant| $ 25))
                . #2=(|RADFF;fullVector|))
          (QSETAREF1 |ans| 0 (SPADCALL |p| (QREFELT $ 90)))
          (LETT |l| (SPADCALL |p| (QREFELT $ 93)) . #2#)
          (SEQ (LETT |i| 1 . #2#)
               (LETT #1# (SPADCALL |ans| (QREFELT $ 95)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |ans| |i|
                            (SEQ
                             (LETT |u|
                                   (SPADCALL
                                    (CONS #'|RADFF;fullVector!0|
                                          (VECTOR $ |i|))
                                    |l| (QREFELT $ 99))
                                   . #2#)
                             (EXIT
                              (COND ((QEQCAR |u| 1) (|spadConstant| $ 88))
                                    ('T (QCAR (QCDR |u|)))))))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |RADFF;fullVector!0| ((|s| NIL) ($$ NIL))
        (PROG (|i| $)
          (LETT |i| (QREFELT $$ 1) . #1=(|RADFF;fullVector|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (QCDR |s|) |i| (QREFELT $ 96)))))) 

(SDEFUN |RADFF;inftyBasis|
        ((|p| |Fraction| UP) (|m| |NonNegativeInteger|)
         ($ |Vector| (|Fraction| UP)))
        (SPROG
         ((|b| (|Fraction| UP)) (#1=#:G841 NIL) (|i| NIL)
          (|w| (|Vector| (|Fraction| UP))) (|v| (|Vector| UP))
          (|a| (|Fraction| UP))
          (|rt|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| UP)) (|:| |radicand| UP)))
          (|x| (|Fraction| UP)))
         (SEQ
          (LETT |rt|
                (SPADCALL
                 (SPADCALL |p|
                           (LETT |x|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 100) 1
                                             (QREFELT $ 101))
                                   (QREFELT $ 102))
                                  (QREFELT $ 103))
                                 . #2=(|RADFF;inftyBasis|))
                           (QREFELT $ 105))
                 |m| (QREFELT $ 108))
                . #2#)
          (EXIT
           (COND
            ((SPADCALL |m| (QVELT |rt| 0) (QREFELT $ 109))
             (|error|
              "Curve not irreducible after change of variable 0 -> infinity"))
            ('T
             (SEQ
              (LETT |a| (SPADCALL (QVELT |rt| 1) |x| (QREFELT $ 105)) . #2#)
              (LETT |b| (|spadConstant| $ 12) . #2#)
              (LETT |v| (|RADFF;iBasis| (QVELT |rt| 2) |m| $) . #2#)
              (LETT |w| (MAKEARR1 |m| (|spadConstant| $ 21)) . #2#)
              (SEQ (LETT |i| (QREFELT $ 38) . #2#)
                   (LETT #1# (QVSIZE |v|) . #2#) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (QSETAREF1O |w| |i|
                                (SPADCALL |b|
                                          (SPADCALL
                                           (SPADCALL (QAREF1O |v| |i| 1)
                                                     (QREFELT $ 102))
                                           |x| (QREFELT $ 105))
                                          (QREFELT $ 70))
                                1)
                    (EXIT (LETT |b| (SPADCALL |b| |a| (QREFELT $ 65)) . #2#)))
                   (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |w|)))))))) 

(SDEFUN |RADFF;charPintbas|
        ((|p| UPUP) (|c| |Fraction| UP) (|v| |Vector| (|Fraction| UP))
         (|w| |Vector| (|Fraction| UP)) ($ |Void|))
        (SPROG
         ((|a| (|Fraction| UP)) (#1=#:G850 NIL) (|i| NIL) (#2=#:G851 NIL)
          (|j| NIL) (#3=#:G852 NIL) (|k| NIL)
          (|ib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (|q| (|SparseUnivariatePolynomial| UP)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |p| (QREFELT $ 110)) (QREFELT $ 10)
                      (QREFELT $ 109))
            (|error| "charPintbas: should not happen"))
           ('T
            (SEQ
             (LETT |q| (SPADCALL (ELT $ 111) |p| (QREFELT $ 115))
                   . #4=(|RADFF;charPintbas|))
             (LETT |ib|
                   (SPADCALL
                    (|compiledLookupCheck| '|integralBasis|
                                           (LIST
                                            (LIST '|Record|
                                                  (LIST '|:| '|basis|
                                                        (LIST '|Matrix|
                                                              (|devaluate|
                                                               (ELT $ 7))))
                                                  (LIST '|:| '|basisDen|
                                                        (|devaluate|
                                                         (ELT $ 7)))
                                                  (LIST '|:| '|basisInv|
                                                        (LIST '|Matrix|
                                                              (|devaluate|
                                                               (ELT $ 7))))))
                                           (|FunctionFieldIntegralBasis|
                                            (ELT $ 7)
                                            (|SparseUnivariatePolynomial|
                                             (ELT $ 7))
                                            (|SimpleAlgebraicExtension|
                                             (ELT $ 7)
                                             (|SparseUnivariatePolynomial|
                                              (ELT $ 7))
                                             |q|))))
                   . #4#)
             (COND
              ((NULL (SPADCALL (QVELT |ib| 0) (QREFELT $ 117)))
               (EXIT (|error| "charPintbas: integral basis not diagonal"))))
             (LETT |a| (|spadConstant| $ 12) . #4#)
             (SEQ (LETT |k| (QREFELT $ 38) . #4#) (LETT #3# (QVSIZE |v|) . #4#)
                  (LETT |j| 1 . #4#)
                  (LETT #2# (SPADCALL (QVELT |ib| 0) (QREFELT $ 119)) . #4#)
                  (LETT |i| 1 . #4#)
                  (LETT #1# (SPADCALL (QVELT |ib| 0) (QREFELT $ 118)) . #4#)
                  G190
                  (COND
                   ((OR (|greater_SI| |i| #1#) (|greater_SI| |j| #2#)
                        (> |k| #3#))
                    (GO G191)))
                  (SEQ
                   (QSETAREF1O |v| |k|
                               (SPADCALL
                                (SPADCALL (QAREF2O (QVELT |ib| 0) |i| |j| 1 1)
                                          (QVELT |ib| 1) (QREFELT $ 64))
                                |a| (QREFELT $ 65))
                               1)
                   (QSETAREF1O |w| |k|
                               (SPADCALL (QAREF2O (QVELT |ib| 2) |i| |j| 1 1)
                                         (SPADCALL |a| (QREFELT $ 103))
                                         (QREFELT $ 120))
                               1)
                   (EXIT (LETT |a| (SPADCALL |a| |c| (QREFELT $ 65)) . #4#)))
                  (LETT |i|
                        (PROG1 (|inc_SI| |i|)
                          (LETT |j|
                                (PROG1 (|inc_SI| |j|)
                                  (LETT |k| (+ |k| 1) . #4#))
                                . #4#))
                        . #4#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL (QREFELT $ 122))))))))) 

(SDEFUN |RADFF;charPStartUp| (($ |Void|))
        (SPROG
         ((|r| (|Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP)))
          (|invmod| (UPUP)) (|x| (|Fraction| UP)))
         (SEQ
          (LETT |r| (SPADCALL (QREFELT $ 30) (QREFELT $ 124))
                . #1=(|RADFF;charPStartUp|))
          (|RADFF;charPintbas| (QCDR |r|) (QCAR |r|) (QREFELT $ 31)
           (QREFELT $ 32) $)
          (LETT |x|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 100) 1 (QREFELT $ 101))
                           (QREFELT $ 102))
                 (QREFELT $ 103))
                . #1#)
          (LETT |invmod|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 12) (QREFELT $ 10) (QREFELT $ 14))
                 (SPADCALL (SPADCALL (QREFELT $ 9) |x| (QREFELT $ 105))
                           (QREFELT $ 15))
                 (QREFELT $ 16))
                . #1#)
          (LETT |r| (SPADCALL |invmod| (QREFELT $ 124)) . #1#)
          (EXIT
           (|RADFF;charPintbas| (QCDR |r|)
            (SPADCALL (QCAR |r|) |x| (QREFELT $ 105)) (QREFELT $ 33)
            (QREFELT $ 34) $))))) 

(SDEFUN |RADFF;startUp| ((|b| |Boolean|) ($ |Void|))
        (SPROG
         ((|dsc| (|Fraction| UP)) (#1=#:G867 NIL)
          (#2=#:G866 #3=(|Fraction| UP)) (#4=#:G868 #3#) (#5=#:G871 NIL)
          (|i| NIL) (|p| (|NonNegativeInteger|)))
         (SEQ (SPADCALL (QREFELT $ 20) |b| (QREFELT $ 125))
              (COND
               ((OR
                 (ZEROP
                  (LETT |p| (SPADCALL (QREFELT $ 126)) . #6=(|RADFF;startUp|)))
                 (SPADCALL |p| (QREFELT $ 10) (QREFELT $ 127)))
                (|RADFF;char0StartUp| $))
               ('T (|RADFF;charPStartUp| $)))
              (LETT |dsc|
                    (SPADCALL
                     (SPADCALL
                      (*
                       (EXPT -1
                             (QUOTIENT2 (* (QREFELT $ 10) (QREFELT $ 29)) 2))
                       (EXPT (QREFELT $ 10) (QREFELT $ 10)))
                      (SPADCALL (QREFELT $ 9) (QREFELT $ 29) (QREFELT $ 128))
                      (QREFELT $ 78))
                     (PROGN
                      (LETT #1# NIL . #6#)
                      (SEQ (LETT |i| (QREFELT $ 38) . #6#)
                           (LETT #5# (QVSIZE (QREFELT $ 31)) . #6#) G190
                           (COND ((> |i| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (SPADCALL (QAREF1O (QREFELT $ 31) |i| 1) 2
                                              (QREFELT $ 129))
                                    . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #4# (QREFELT $ 65))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 12))))
                     (QREFELT $ 65))
                    . #6#)
              (SPADCALL (QREFELT $ 24)
                        (SPADCALL
                         (SPADCALL (SPADCALL |dsc| (QREFELT $ 130))
                                   (QREFELT $ 131))
                         (SPADCALL |dsc| (QREFELT $ 132)) (QREFELT $ 64))
                        (QREFELT $ 133))
              (EXIT (SPADCALL (QREFELT $ 122)))))) 

(SDEFUN |RADFF;char0StartUp| (($ |Void|))
        (SPROG
         ((|a| (|Fraction| UP)) (|invden| (|Fraction| UP)) (#1=#:G878 NIL)
          (|i| NIL) (|infb| (|Vector| (|Fraction| UP))) (|ib| (|Vector| UP))
          (|rp|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| UP)) (|:| |radicand| UP))))
         (SEQ
          (LETT |rp| (SPADCALL (QREFELT $ 9) (QREFELT $ 10) (QREFELT $ 108))
                . #2=(|RADFF;char0StartUp|))
          (EXIT
           (COND
            ((SPADCALL (QVELT |rp| 0) (QREFELT $ 10) (QREFELT $ 109))
             (|error| "RadicalFunctionField: curve is not irreducible"))
            ('T
             (SEQ (SPADCALL (QREFELT $ 28) (QVELT |rp| 2) (QREFELT $ 134))
                  (LETT |ib|
                        (|RADFF;iBasis|
                         (SPADCALL (QREFELT $ 28) (QREFELT $ 42))
                         (QREFELT $ 10) $)
                        . #2#)
                  (LETT |infb|
                        (|RADFF;inftyBasis| (QREFELT $ 9) (QREFELT $ 10) $)
                        . #2#)
                  (LETT |invden| (|spadConstant| $ 12) . #2#)
                  (SEQ (LETT |i| (QREFELT $ 38) . #2#)
                       (LETT #1# (QVSIZE |ib|) . #2#) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (QSETAREF1O (QREFELT $ 32) |i|
                                    (LETT |a|
                                          (SPADCALL (QAREF1O |ib| |i| 1)
                                                    |invden| (QREFELT $ 120))
                                          . #2#)
                                    1)
                        (QSETAREF1O (QREFELT $ 31) |i|
                                    (SPADCALL |a| (QREFELT $ 103)) 1)
                        (LETT |invden|
                              (SPADCALL |invden| (QVELT |rp| 1) (QREFELT $ 70))
                              . #2#)
                        (QSETAREF1O (QREFELT $ 33) |i|
                                    (LETT |a| (QAREF1O |infb| |i| 1) . #2#) 1)
                        (EXIT
                         (QSETAREF1O (QREFELT $ 34) |i|
                                     (SPADCALL |a| (QREFELT $ 103)) 1)))
                       (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL (QREFELT $ 122)))))))))) 

(SDEFUN |RADFF;ramified?;UPB;26| ((|p| UP) ($ |Boolean|))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 136))
                      |RADFF;ramified?;UPB;26|)
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 137)))
                       ('T
                        (QEQCAR
                         (SPADCALL (|RADFF;radcand| $) |p| (QREFELT $ 138))
                         0))))))) 

(SDEFUN |RADFF;singular?;UPB;27| ((|p| UP) ($ |Boolean|))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 136))
                      |RADFF;singular?;UPB;27|)
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 137)))
                       ('T
                        (QEQCAR
                         (SPADCALL (|RADFF;radcand| $)
                                   (SPADCALL |p| 2 (QREFELT $ 141))
                                   (QREFELT $ 138))
                         0))))))) 

(SDEFUN |RADFF;branchPoint?;UPB;28| ((|p| UP) ($ |Boolean|))
        (SPROG ((|q| (|Union| UP "failed")) (|r| (|Union| F "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 136))
                      . #1=(|RADFF;branchPoint?;UPB;28|))
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 143)))
                       (#2='T
                        (SEQ
                         (LETT |q|
                               (SPADCALL (|RADFF;radcand| $) |p|
                                         (QREFELT $ 138))
                               . #1#)
                         (EXIT
                          (COND
                           ((QEQCAR |q| 0)
                            (QEQCAR (SPADCALL (QCDR |q|) |p| (QREFELT $ 138))
                                    1))
                           (#2# NIL)))))))))) 

(SDEFUN |RADFF;singular?;FB;29| ((|point| F) ($ |Boolean|))
        (SPROG ((#1=#:G905 NIL))
               (COND
                ((SPADCALL
                  (SPADCALL (|RADFF;radcand| $) |point| (QREFELT $ 53))
                  (QREFELT $ 54))
                 (SPADCALL
                  (SPADCALL
                   (PROG2
                       (LETT #1#
                             (SPADCALL (|RADFF;radcand| $)
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| $ 100) 1
                                                  (QREFELT $ 101))
                                        (SPADCALL |point| (QREFELT $ 145))
                                        (QREFELT $ 146))
                                       (QREFELT $ 138))
                             |RADFF;singular?;FB;29|)
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                     (|Union| (QREFELT $ 7) "failed") #1#))
                   |point| (QREFELT $ 53))
                  (QREFELT $ 54)))
                ('T NIL)))) 

(SDEFUN |RADFF;branchPoint?;FB;30| ((|point| F) ($ |Boolean|))
        (SPROG ((#1=#:G910 NIL))
               (COND
                ((SPADCALL
                  (SPADCALL (|RADFF;radcand| $) |point| (QREFELT $ 53))
                  (QREFELT $ 54))
                 (NULL
                  (SPADCALL
                   (SPADCALL
                    (PROG2
                        (LETT #1#
                              (SPADCALL (|RADFF;radcand| $)
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 100) 1
                                                   (QREFELT $ 101))
                                         (SPADCALL |point| (QREFELT $ 145))
                                         (QREFELT $ 146))
                                        (QREFELT $ 138))
                              |RADFF;branchPoint?;FB;30|)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                      (|Union| (QREFELT $ 7) "failed") #1#))
                    |point| (QREFELT $ 53))
                   (QREFELT $ 54))))
                ('T NIL)))) 

(DECLAIM (NOTINLINE |RadicalFunctionField;|)) 

(DEFUN |RadicalFunctionField| (&REST #1=#:G962)
  (SPROG NIL
         (PROG (#2=#:G963)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RadicalFunctionField|)
                                               '|domainEqualList|)
                    . #3=(|RadicalFunctionField|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RadicalFunctionField;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RadicalFunctionField|)))))))))) 

(DEFUN |RadicalFunctionField;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((#1=#:G720 NIL) (|pv$| NIL) (#2=#:G960 NIL) (#3=#:G961 NIL) ($ NIL)
    (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|RadicalFunctionField|))
    (LETT DV$2 (|devaluate| |#2|) . #4#)
    (LETT DV$3 (|devaluate| |#3|) . #4#)
    (LETT DV$4 (|devaluate| |#4|) . #4#)
    (LETT DV$5 (|devaluate| |#5|) . #4#)
    (LETT |dv$| (LIST '|RadicalFunctionField| DV$1 DV$2 DV$3 DV$4 DV$5) . #4#)
    (LETT $ (GETREFV 188) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|FiniteFieldCategory|))
                                        (LETT #3#
                                              (|HasCategory| (|Fraction| |#2|)
                                                             '(|Field|))
                                              . #4#)
                                        (OR #3#
                                            (|HasCategory| (|Fraction| |#2|)
                                                           '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|Finite|))
                                        (OR
                                         (AND
                                          (|HasCategory| (|Fraction| |#2|)
                                                         '(|DifferentialRing|))
                                          #3#)
                                         (|HasCategory| (|Fraction| |#2|)
                                                        '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| (|Fraction| |#2|)
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| (|Fraction| |#2|)
                                                              '(|Field|)))
                                              . #4#)
                                        (OR #2#
                                            (AND
                                             (|HasCategory| (|Fraction| |#2|)
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (|HasCategory| (|Fraction| |#2|)
                                                            '(|FiniteFieldCategory|))))
                                        (OR
                                         (|HasCategory| (|Fraction| |#2|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3#)
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|Finite|))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|RadicalFunctionField|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (AND (|HasCategory| $ '(|CharacteristicNonZero|))
         (|HasCategory| (|Fraction| |#2|) '(|FiniteFieldCategory|))
         (|augmentPredVector| $ 32768))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 20 (SPADCALL 'T (QREFELT $ 19)))
    (QSETREFV $ 24 (SPADCALL (|spadConstant| $ 21) (QREFELT $ 23)))
    (QSETREFV $ 28 (SPADCALL (|spadConstant| $ 25) (QREFELT $ 27)))
    (QSETREFV $ 29
              (PROG1 (LETT #1# (- |#5| 1) . #4#)
                (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                  '(|Integer|) #1#)))
    (QSETREFV $ 30
              (SPADCALL (SPADCALL (|spadConstant| $ 12) |#5| (QREFELT $ 14))
                        (SPADCALL |#4| (QREFELT $ 15)) (QREFELT $ 16)))
    (QSETREFV $ 31 (MAKEARR1 |#5| (|spadConstant| $ 21)))
    (QSETREFV $ 32 (MAKEARR1 |#5| (|spadConstant| $ 21)))
    (QSETREFV $ 33 (MAKEARR1 |#5| (|spadConstant| $ 21)))
    (QSETREFV $ 34 (MAKEARR1 |#5| (|spadConstant| $ 21)))
    (QSETREFV $ 38 (SPADCALL (QREFELT $ 31) (QREFELT $ 37)))
    $))) 

(MAKEPROP '|RadicalFunctionField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SimpleAlgebraicExtension| 11 8
                                          (NRTEVAL
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 12)
                                                      (QREFELT $ 10)
                                                      (QREFELT $ 14))
                                            (SPADCALL (QREFELT $ 9)
                                                      (QREFELT $ 15))
                                            (QREFELT $ 16))))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|local| |#5|) (|Fraction| 7) (0 . |One|) (|NonNegativeInteger|)
              (4 . |monomial|) (10 . |coerce|) (15 . -) (|Boolean|)
              (|Reference| 17) (21 . |ref|) '|brandNew?| (26 . |Zero|)
              (|Reference| 11) (30 . |ref|) '|discPoly| (35 . |Zero|)
              (|Reference| 7) (39 . |ref|) '|newrad| '|n1| '|modulus| '|ibasis|
              '|invibasis| '|infbasis| '|invinfbasis| (|Integer|) (|Vector| 11)
              (44 . |minIndex|) '|mini| (49 . |deref|) (54 . |elt|)
              |RADFF;discriminant;F;1| (59 . |elt|) (|Vector| $)
              |RADFF;integralBasis;V;3| |RADFF;integralBasisAtInfinity;V;4|
              (|Matrix| 11) (64 . |diagonalMatrix|) |RADFF;integralMatrix;M;6|
              |RADFF;integralMatrixAtInfinity;M;7|
              |RADFF;inverseIntegralMatrix;M;8|
              |RADFF;inverseIntegralMatrixAtInfinity;M;9|
              |RADFF;definingPolynomial;UPUP;10| (69 . |elt|) (75 . |zero?|)
              |RADFF;ramified?;FB;11| (80 . |degree|) (|Union| $ '"failed")
              (85 . |exquo|) |RADFF;branchPointAtInfinity?;B;12|
              (|Union| 7 '"failed") |RADFF;elliptic;U;13|
              |RADFF;hyperelliptic;U;14| (91 . |reduce|) (96 . /) (102 . *)
              (108 . |represents|) (|Vector| 7)
              |RADFF;integralRepresents;VUP$;16| (113 . |coordinates|)
              (118 . /) (|Record| (|:| |num| 67) (|:| |den| 7))
              (|InnerCommonDenominator| 7 11 67 36) (124 . |splitDenominator|)
              |RADFF;integralCoordinates;$R;17| (|Mapping| 7 7)
              (129 . |differentiate|) (135 . *) (141 . *) (147 . +)
              (|Matrix| 7) (153 . |diagonalMatrix|)
              (|Record| (|:| |num| 80) (|:| |den| 7))
              |RADFF;integralDerivationMatrix;MR;18| (|Factored| $)
              (158 . |squareFree|) (163 . ^) (169 . *) (175 . |One|)
              (|Factored| 7) (179 . |unit|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 35)) (|List| 91)
              (184 . |factors|) (|PrimitiveArray| 7) (189 . |maxIndex|)
              (194 . =) (|Union| 91 '"failed") (|Mapping| 17 91) (200 . |find|)
              (206 . |One|) (210 . |monomial|) (216 . |coerce|) (221 . |inv|)
              (|Fraction| $) (226 . |elt|)
              (|Record| (|:| |exponent| 13) (|:| |coef| 11) (|:| |radicand| 7))
              (|ChangeOfVariable| 6 7 8) (232 . |rootPoly|) (238 . ~=)
              (244 . |degree|) (249 . |retract|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 8 7 112)
              (254 . |map|) (260 . |basis|) (264 . |diagonal?|)
              (269 . |maxRowIndex|) (274 . |maxColIndex|) (279 . *) (|Void|)
              (285 . |void|) (|Record| (|:| |coef| 11) (|:| |poly| 8))
              (289 . |mkIntegral|) (294 . |setelt!|) (300 . |characteristic|)
              (304 . >) (310 . ^) (316 . ^) (322 . |numer|)
              (327 . |primitivePart|) (332 . |denom|) (337 . |setelt!|)
              (343 . |setelt!|) (|Union| 6 '#1="failed") (349 . |retractIfCan|)
              |RADFF;singular?;FB;29| (354 . |exquo|) |RADFF;ramified?;UPB;26|
              (|PositiveInteger|) (360 . ^) |RADFF;singular?;UPB;27|
              |RADFF;branchPoint?;FB;30| |RADFF;branchPoint?;UPB;28|
              (366 . |coerce|) (371 . -) (|List| 149) (|List| 13) (|Symbol|)
              (|Union| 43 '#2="failed") (|Matrix| $) (|Fraction| 35)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 155) (|:| |generator| $))
              (|Union| 155 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 160 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Mapping| 11 11) (|Fraction| 8) (|InputForm|)
              (|Union| 13 '"failed") (|OnePointCompletion| 140)
              (|Union| 169 '#2#) (|List| 156) (|Factored| 156)
              (|Record| (|:| |factor| 35) (|:| |exponent| 35)) (|List| 171)
              (|Table| 140 13)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Matrix| 35)
              (|Record| (|:| |mat| 175) (|:| |vec| (|Vector| 35)))
              (|Union| 152 '#1#) (|Union| 35 '#1#) (|List| (|Polynomial| 6))
              (|List| (|List| 6))
              (|Record| (|:| |num| $) (|:| |den| 7) (|:| |derivden| 7)
                        (|:| |gd| 7))
              (|Record| (|:| |mat| 46) (|:| |vec| 36)) (|Union| 11 '#1#)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 377 |zero?| 383 |yCoordinates| 388 |unitNormal| 393
              |unitCanonical| 398 |unit?| 403 |traceMatrix| 408 |trace| 417
              |tableForDiscreteLogarithm| 422 |subtractIfCan| 427
              |squareFreePolynomial| 433 |squareFreePart| 438 |squareFree| 443
              |solveLinearPolynomialEquation| 448 |smaller?| 454 |sizeLess?|
              460 |size| 466 |singularAtInfinity?| 470 |singular?| 474 |sample|
              484 |rightRecip| 488 |rightPower| 493 |retractIfCan| 505
              |retract| 520 |represents| 535 |representationType| 552 |rem| 556
              |regularRepresentation| 562 |reducedSystem| 573
              |reduceBasisAtInfinity| 595 |reduce| 600 |recip| 610
              |rationalPoints| 615 |rationalPoint?| 619 |rank| 625 |random| 629
              |ramifiedAtInfinity?| 633 |ramified?| 637 |quo| 647
              |principalIdeal| 653 |primitivePart| 658 |primitiveElement| 663
              |primitive?| 667 |primeFrobenius| 672 |prime?| 683 |order| 688
              |opposite?| 698 |one?| 704 |numberOfComponents| 709
              |normalizeAtInfinity| 713 |norm| 718 |nonSingularModel| 723
              |nextItem| 728 |multiEuclidean| 733 |minimalPolynomial| 739
              |lookup| 744 |lift| 749 |leftRecip| 754 |leftPower| 759 |lcmCoef|
              771 |lcm| 777 |latex| 788 |inverseIntegralMatrixAtInfinity| 793
              |inverseIntegralMatrix| 797 |inv| 801 |integralRepresents| 806
              |integralMatrixAtInfinity| 812 |integralMatrix| 816
              |integralDerivationMatrix| 820 |integralCoordinates| 825
              |integralBasisAtInfinity| 830 |integralBasis| 834
              |integralAtInfinity?| 838 |integral?| 843 |init| 860 |index| 864
              |hyperelliptic| 869 |hashUpdate!| 873 |hash| 879 |genus| 884
              |generator| 888 |gcdPolynomial| 892 |gcd| 898
              |factorsOfCyclicGroupSize| 909 |factorSquareFreePolynomial| 913
              |factorPolynomial| 918 |factor| 923 |extendedEuclidean| 928
              |exquo| 941 |expressIdealMember| 947 |euclideanSize| 953
              |enumerate| 958 |elt| 962 |elliptic| 969 |divide| 973
              |discriminant| 979 |discreteLog| 988 |differentiate| 999
              |derivationCoordinates| 1055 |definingPolynomial| 1061
              |createPrimitiveElement| 1065 |coordinates| 1069 |convert| 1091
              |conditionP| 1116 |complementaryBasis| 1121 |commutator| 1126
              |coerce| 1132 |charthRoot| 1157 |characteristicPolynomial| 1167
              |characteristic| 1172 |branchPointAtInfinity?| 1176
              |branchPoint?| 1180 |basis| 1190 |associator| 1194 |associates?|
              1201 |antiCommutator| 1207 |annihilate?| 1213 |algSplitSimple|
              1219 |absolutelyIrreducible?| 1225 ^ 1229 |Zero| 1247 |One| 1251
              D 1255 = 1305 / 1311 - 1317 + 1328 * 1334)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 2 2 4 4 2 4 4 4 0 4 0 0 0 3 3 3 0 0 0 1 3
                                  3 5 7 12 10 0 0 0 0 0 0 3 0 0 0 0 3 0 0 0 0 0
                                  3 3 0 0 0 0 0 0 0 0 6 0 0 6 2 0 0 0 0 0 0 0 0
                                  3 3 3 6 8 9))
            (CONS
             '#(|FunctionFieldCategory&| |MonogenicAlgebra&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| |FramedAlgebra&| NIL
                |FiniteRankAlgebra&| |FullyLinearlyExplicitOver&| NIL NIL
                |DivisionRing&| |DifferentialExtension&| |Algebra&| NIL
                |Algebra&| NIL |EntireRing&| |Algebra&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| NIL NIL |Rng&| NIL |Module&|
                |Module&| NIL |Module&| NIL |FramedModule&| NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Finite&| |Magma&|
                |AbelianSemiGroup&| NIL NIL |FullyRetractableTo&|
                |SetCategory&| |RetractableTo&| NIL NIL NIL |BasicType&| NIL
                NIL NIL NIL NIL |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|FunctionFieldCategory| 6 7 8)
                 (|MonogenicAlgebra| (|Fraction| 7) 8) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|FramedAlgebra| (|Fraction| 7) 8) (|IntegralDomain|)
                 (|FiniteRankAlgebra| (|Fraction| 7) 8)
                 (|FullyLinearlyExplicitOver| (|Fraction| 7))
                 (|CommutativeRing|) (|LeftOreRing|) (|DivisionRing|)
                 (|DifferentialExtension| (|Fraction| 7))
                 (|Algebra| (|Fraction| 7))
                 (|LinearlyExplicitOver| (|Fraction| 7)) (|Algebra| $$)
                 (|CharacteristicZero|) (|EntireRing|) (|Algebra| 152)
                 (|CharacteristicNonZero|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 149) (|LinearlyExplicitOver| 35)
                 (|Ring|) (|Rng|) (|SemiRing|) (|Module| $$)
                 (|Module| (|Fraction| 7)) (|SemiRng|) (|Module| 152)
                 (|BiModule| $$ $$) (|FramedModule| (|Fraction| 7))
                 (|BiModule| (|Fraction| 7) (|Fraction| 7))
                 (|NonAssociativeRing|) (|BiModule| 152 152) (|LeftModule| $$)
                 (|RightModule| (|Fraction| 7)) (|LeftModule| (|Fraction| 7))
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| 152)
                 (|RightModule| 152) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|)
                 (|FullyRetractableTo| (|Fraction| 7)) (|SetCategory|)
                 (|RetractableTo| (|Fraction| 7)) (|ConvertibleTo| 8)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 187) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|ConvertibleTo| 165)
                 (|RetractableTo| 152) (|RetractableTo| 35))
              (|makeByteWordVec2| 187
                                  '(0 11 0 12 2 8 0 11 13 14 1 8 0 11 15 2 8 0
                                    0 0 16 1 18 0 17 19 0 11 0 21 1 22 0 11 23
                                    0 7 0 25 1 26 0 7 27 1 36 35 0 37 1 18 17 0
                                    39 1 22 11 0 40 1 26 7 0 42 1 46 0 36 47 2
                                    7 6 0 6 53 1 6 17 0 54 1 7 13 0 56 2 13 57
                                    0 0 58 1 0 0 8 63 2 11 0 7 7 64 2 11 0 0 0
                                    65 1 0 0 36 66 1 0 36 0 69 2 11 0 0 0 70 1
                                    72 71 36 73 2 11 0 0 75 76 2 11 0 13 0 77 2
                                    11 0 35 0 78 2 11 0 0 0 79 1 80 0 67 81 1 7
                                    84 0 85 2 7 0 0 13 86 2 7 0 0 0 87 0 7 0 88
                                    1 89 7 0 90 1 89 92 0 93 1 94 35 0 95 2 35
                                    17 0 0 96 2 92 97 98 0 99 0 6 0 100 2 7 0 6
                                    13 101 1 11 0 7 102 1 11 0 0 103 2 7 104
                                    104 104 105 2 107 106 11 13 108 2 13 17 0 0
                                    109 1 8 13 0 110 1 11 7 0 111 2 114 112 113
                                    8 115 0 0 43 116 1 80 17 0 117 1 80 35 0
                                    118 1 80 35 0 119 2 11 0 7 0 120 0 121 0
                                    122 1 107 123 8 124 2 18 17 0 17 125 0 6 13
                                    126 2 13 17 0 0 127 2 11 0 0 13 128 2 11 0
                                    0 35 129 1 11 7 0 130 1 7 0 0 131 1 11 7 0
                                    132 2 22 11 0 11 133 2 26 7 0 7 134 1 7 135
                                    0 136 2 7 57 0 0 138 2 7 0 0 140 141 1 7 0
                                    6 145 2 7 0 0 0 146 2 0 17 0 0 1 1 0 17 0 1
                                    1 0 71 0 1 1 3 153 0 1 1 3 0 0 1 1 3 17 0 1
                                    0 0 46 1 1 0 46 43 1 1 0 11 0 1 1 2 173 35
                                    1 2 0 57 0 0 1 1 2 170 156 1 1 3 0 0 1 1 3
                                    84 0 1 2 2 168 169 156 1 2 6 17 0 0 1 2 3
                                    17 0 0 1 0 6 13 1 0 0 17 1 1 0 17 7 142 1 0
                                    17 6 137 0 0 0 1 1 0 57 0 1 2 0 0 0 13 1 2
                                    0 0 0 140 1 1 8 177 0 1 1 9 178 0 1 1 0 183
                                    0 1 1 8 152 0 1 1 9 35 0 1 1 0 11 0 1 2 0 0
                                    67 7 1 1 0 0 36 66 2 0 0 36 43 1 0 2 174 1
                                    2 3 0 0 0 1 1 0 46 0 1 2 0 46 0 43 1 1 10
                                    175 151 1 2 10 176 151 43 1 1 0 46 151 1 2
                                    0 182 151 43 1 1 0 43 43 1 1 3 57 164 1 1 0
                                    0 8 63 1 0 57 0 1 0 15 180 1 2 0 17 6 6 1 0
                                    0 140 1 0 6 0 1 0 0 17 1 1 0 17 7 139 1 0
                                    17 6 55 2 3 0 0 0 1 1 3 157 155 1 1 0 0 0 1
                                    0 2 0 1 1 2 17 0 1 1 2 0 0 1 2 2 0 0 13 1 1
                                    3 17 0 1 1 2 167 0 1 1 2 140 0 1 2 0 17 0 0
                                    1 1 0 17 0 1 0 0 13 1 1 0 43 43 1 1 0 11 0
                                    1 1 14 179 149 1 1 2 57 0 1 2 3 158 155 0 1
                                    1 3 8 0 1 1 6 140 0 1 1 0 8 0 1 1 0 57 0 1
                                    2 0 0 0 13 1 2 0 0 0 140 1 2 3 154 0 0 1 2
                                    3 0 0 0 1 1 3 0 155 1 1 0 184 0 1 0 0 46 51
                                    0 0 46 50 1 3 0 0 1 2 0 0 67 7 68 0 0 46 49
                                    0 0 46 48 1 0 82 75 83 1 0 71 0 74 0 0 43
                                    45 0 0 43 44 1 0 17 0 1 2 0 17 0 6 1 2 0 17
                                    0 7 1 1 0 17 0 1 0 2 0 1 1 6 0 140 1 0 0 60
                                    62 2 0 186 186 0 1 1 0 185 0 1 0 0 13 1 0 0
                                    0 1 2 3 156 156 156 1 1 3 0 155 1 2 3 0 0 0
                                    1 0 2 172 1 1 2 170 156 1 1 2 170 156 1 1 3
                                    84 0 1 3 3 161 0 0 0 1 2 3 162 0 0 1 2 3 57
                                    0 0 1 2 3 158 155 0 1 1 3 13 0 1 0 6 155 1
                                    3 0 6 0 6 6 1 0 0 60 61 2 3 159 0 0 1 0 0
                                    11 41 1 0 11 43 1 2 2 166 0 0 1 1 2 13 0 1
                                    3 11 0 0 149 13 1 3 11 0 0 147 148 1 2 11 0
                                    0 147 1 2 11 0 0 149 1 2 7 0 0 13 1 1 7 0 0
                                    1 2 3 0 0 163 1 3 3 0 0 163 13 1 2 0 0 0 75
                                    1 2 3 46 43 163 1 0 0 8 52 0 2 0 1 1 0 36 0
                                    69 1 0 46 43 1 2 0 36 0 43 1 2 0 46 43 43 1
                                    1 6 165 0 1 1 0 0 8 1 1 0 8 0 1 1 0 36 0 1
                                    1 0 0 36 1 1 16 150 151 1 1 0 43 43 1 2 0 0
                                    0 0 1 1 13 0 152 1 1 0 0 0 1 1 0 0 11 1 1 0
                                    0 35 1 1 0 187 0 1 1 5 57 0 1 1 2 0 0 1 1 0
                                    8 0 1 0 0 13 1 0 0 17 59 1 0 17 7 144 1 0
                                    17 6 143 0 0 43 116 3 0 0 0 0 0 1 2 3 17 0
                                    0 1 2 0 0 0 0 1 2 0 17 0 0 1 2 0 181 0 75 1
                                    0 0 17 1 2 3 0 0 35 1 2 0 0 0 13 1 2 0 0 0
                                    140 1 0 0 0 1 0 0 0 1 3 11 0 0 147 148 1 2
                                    11 0 0 147 1 3 11 0 0 149 13 1 2 11 0 0 149
                                    1 2 7 0 0 13 1 1 7 0 0 1 3 3 0 0 163 13 1 2
                                    3 0 0 163 1 2 0 17 0 0 1 2 3 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 3 0 152 0 1 2
                                    3 0 0 152 1 2 0 0 11 0 1 2 0 0 0 11 1 2 0 0
                                    13 0 1 2 0 0 35 0 1 2 0 0 0 0 1 2 0 0 140 0
                                    1)))))
           '|lookupComplete|)) 
