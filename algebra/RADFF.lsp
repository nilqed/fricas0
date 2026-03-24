
(SDEFUN |RADFF;discriminant;F;1| ((% (|Fraction| UP)))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (QREFELT % 19)))) 

(SDEFUN |RADFF;radcand| ((% (UP)))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (QREFELT % 21)))) 

(SDEFUN |RADFF;integralBasis;V;3| ((% (|Vector| %)))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (|RADFF;diag| (QREFELT % 24) %)))) 

(SDEFUN |RADFF;integralBasisAtInfinity;V;4| ((% (|Vector| %)))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (|RADFF;diag| (QREFELT % 26) %)))) 

(SDEFUN |RADFF;basisvec| ((% (|Vector| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (QREFELT % 24)))) 

(SDEFUN |RADFF;integralMatrix;M;6| ((% (|Matrix| (|Fraction| UP))))
        (SPADCALL (|RADFF;basisvec| %) (QREFELT % 37))) 

(SDEFUN |RADFF;integralMatrixAtInfinity;M;7| ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (SPADCALL (QREFELT % 26) (QREFELT % 37))))) 

(SDEFUN |RADFF;inverseIntegralMatrix;M;8| ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (SPADCALL (QREFELT % 25) (QREFELT % 37))))) 

(SDEFUN |RADFF;inverseIntegralMatrixAtInfinity;M;9|
        ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (SPADCALL (QREFELT % 27) (QREFELT % 37))))) 

(SDEFUN |RADFF;definingPolynomial;UPUP;10| ((% (UPUP))) (QREFELT % 23)) 

(SDEFUN |RADFF;ramified?;FB;11| ((|point| (F)) (% (|Boolean|)))
        (SPADCALL (SPADCALL (|RADFF;radcand| %) |point| (QREFELT % 43))
                  (QREFELT % 45))) 

(SDEFUN |RADFF;branchPointAtInfinity?;B;12| ((% (|Boolean|)))
        (QEQCAR
         (SPADCALL (SPADCALL (|RADFF;radcand| %) (QREFELT % 47)) (QREFELT % 10)
                   (QREFELT % 49))
         1)) 

(SDEFUN |RADFF;elliptic;U;13| ((% (|Union| UP "failed")))
        (SEQ
         (COND
          ((EQL (QREFELT % 10) 2)
           (COND
            ((EQL (SPADCALL (|RADFF;radcand| %) (QREFELT % 47)) 3)
             (EXIT (CONS 0 (|RADFF;radcand| %)))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |RADFF;hyperelliptic;U;14| ((% (|Union| UP "failed")))
        (SEQ
         (COND
          ((EQL (QREFELT % 10) 2)
           (COND
            ((ODDP (SPADCALL (|RADFF;radcand| %) (QREFELT % 47)))
             (EXIT (CONS 0 (|RADFF;radcand| %)))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |RADFF;diag| ((|v| (|Vector| (|Fraction| UP))) (% (|Vector| %)))
        (SPROG ((#1=#:G53 NIL) (|i| NIL) (#2=#:G52 NIL))
               (SEQ
                (PROGN
                 (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT % 22))))
                 (SEQ (LETT |i| 0) (LETT #1# #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# |i|
                                (SPADCALL
                                 (SPADCALL
                                  (QAREF1O |v| (+ |i| (QREFELT % 31)) 1) |i|
                                  (QREFELT % 14))
                                 (QREFELT % 54)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 #2#)))) 

(SDEFUN |RADFF;integralRepresents;VUP%;16|
        ((|v| (|Vector| UP)) (|d| (UP)) (% (%)))
        (SPROG
         ((#1=#:G58 NIL) (#2=#:G60 NIL) (|i| NIL) (#3=#:G59 NIL)
          (|ib| (|Vector| (|Fraction| UP))))
         (SEQ (LETT |ib| (|RADFF;basisvec| %))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #3#
                       (GETREFV
                        (|inc_SI| (- #4=(QVSIZE |ib|) #5=(QREFELT % 31)))))
                 (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #1# 0) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL (QAREF1O |ib| |i| 1)
                                          (SPADCALL (QAREF1O |v| |i| 1) |d|
                                                    (QREFELT % 55))
                                          (QREFELT % 56)))))
                      (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)
                (QREFELT % 57)))))) 

(SDEFUN |RADFF;integralCoordinates;%R;17|
        ((|f| (%)) (% (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP))))
        (SPROG
         ((#1=#:G66 NIL) (#2=#:G68 NIL) (|i| NIL) (#3=#:G67 NIL)
          (|ib| (|Vector| (|Fraction| UP))) (|v| (|Vector| (|Fraction| UP))))
         (SEQ (LETT |v| (SPADCALL |f| (QREFELT % 60)))
              (LETT |ib| (|RADFF;basisvec| %))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #3#
                       (GETREFV
                        (|inc_SI| (- #4=(QVSIZE |ib|) #5=(QREFELT % 31)))))
                 (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #1# 0) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL (QAREF1O |v| |i| 1)
                                          (QAREF1O |ib| |i| 1)
                                          (QREFELT % 61)))))
                      (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)
                (QREFELT % 64)))))) 

(SDEFUN |RADFF;integralDerivationMatrix;MR;18|
        ((|d| (|Mapping| UP UP))
         (% (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP))))
        (SPROG
         ((|cd| (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP)))
          (#1=#:G78 NIL) (#2=#:G80 NIL) (|i| NIL) (#3=#:G79 NIL)
          (|v| (|Vector| (|Fraction| UP))) (|dlogp| (|Fraction| UP)))
         (SEQ
          (LETT |dlogp|
                (SPADCALL (SPADCALL (QREFELT % 9) |d| (QREFELT % 67))
                          (SPADCALL (QREFELT % 10) (QREFELT % 9)
                                    (QREFELT % 68))
                          (QREFELT % 61)))
          (LETT |v| (|RADFF;basisvec| %))
          (LETT |cd|
                (SPADCALL
                 (PROGN
                  (LETT #3#
                        (GETREFV
                         (|inc_SI| (- #4=(QVSIZE |v|) #5=(QREFELT % 31)))))
                  (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #1# 0) G190
                       (COND ((> |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT #3# #1#
                                 (SPADCALL
                                  (SPADCALL (- |i| (QREFELT % 31)) |dlogp|
                                            (QREFELT % 69))
                                  (SPADCALL
                                   (SPADCALL (QAREF1O |v| |i| 1) |d|
                                             (QREFELT % 67))
                                   (QAREF1O |v| |i| 1) (QREFELT % 61))
                                  (QREFELT % 70)))))
                       (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1))))
                       (GO G190) G191 (EXIT NIL))
                  #3#)
                 (QREFELT % 64)))
          (EXIT (CONS (SPADCALL (QCAR |cd|) (QREFELT % 72)) (QCDR |cd|)))))) 

(SDEFUN |RADFF;iBasis|
        ((|p| (UP)) (|d| (|NonNegativeInteger|)) (% (|Vector| UP)))
        (SPROG
         ((#1=#:G84 NIL) (#2=#:G83 (UP)) (#3=#:G85 (UP)) (#4=#:G91 NIL)
          (|j| NIL) (#5=#:G90 NIL) (|i| NIL) (#6=#:G89 NIL)
          (|d1| (|NonNegativeInteger|)) (#7=#:G81 NIL)
          (|pl| (|PrimitiveArray| UP)))
         (SEQ
          (LETT |pl| (|RADFF;fullVector| (SPADCALL |p| (QREFELT % 76)) |d| %))
          (LETT |d1|
                (PROG1 (LETT #7# (- |d| 1))
                  (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #7#)))
          (EXIT
           (PROGN
            (LETT #6# (GETREFV (|inc_SI| |d1|)))
            (SEQ (LETT |i| 0) (LETT #5# |d1|) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SETELT #6# |i|
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT |j| 0) (LETT #4# |d1|) G190
                                 (COND ((|greater_SI| |j| #4#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3#
                                          (SPADCALL (QAREF1 |pl| |j|)
                                                    (QUOTIENT2 (* |i| |j|) |d|)
                                                    (QREFELT % 77)))
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #3# (QREFELT % 78))))
                                     ('T
                                      (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) ('T (|spadConstant| % 79)))))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            #6#))))) 

(SDEFUN |RADFF;fullVector|
        ((|p| (|Factored| UP)) (|m| (|NonNegativeInteger|))
         (% (|PrimitiveArray| UP)))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (#1=#:G102 NIL) (|i| NIL)
          (|l|
           (|List|
            (|Record| (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|ans| (|PrimitiveArray| UP)))
         (SEQ (LETT |ans| (MAKEARR1 |m| (|spadConstant| % 20)))
              (QSETAREF1 |ans| 0 (SPADCALL |p| (QREFELT % 81)))
              (LETT |l| (SPADCALL |p| (QREFELT % 84)))
              (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |ans| (QREFELT % 86))) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |ans| |i|
                                (SEQ
                                 (LETT |u|
                                       (SPADCALL
                                        (CONS #'|RADFF;fullVector!0|
                                              (VECTOR % |i|))
                                        |l| (QREFELT % 90)))
                                 (EXIT
                                  (COND ((QEQCAR |u| 1) (|spadConstant| % 79))
                                        ('T (QCAR (QCDR |u|)))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |RADFF;fullVector!0| ((|s| NIL) ($$ NIL))
        (PROG (|i| %)
          (LETT |i| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (QCDR |s|) |i| (QREFELT % 87)))))) 

(SDEFUN |RADFF;inftyBasis|
        ((|p| (|Fraction| UP)) (|m| (|NonNegativeInteger|))
         (% (|Vector| (|Fraction| UP))))
        (SPROG
         ((|b| (|Fraction| UP)) (#1=#:G110 NIL) (|i| NIL)
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
                                   (SPADCALL (|spadConstant| % 91) 1
                                             (QREFELT % 92))
                                   (QREFELT % 93))
                                  (QREFELT % 94)))
                           (QREFELT % 96))
                 |m| (QREFELT % 99)))
          (EXIT
           (COND
            ((SPADCALL |m| (QVELT |rt| 0) (QREFELT % 100))
             (|error|
              "Curve not irreducible after change of variable 0 -> infinity"))
            ('T
             (SEQ (LETT |a| (SPADCALL (QVELT |rt| 1) |x| (QREFELT % 96)))
                  (LETT |b| (|spadConstant| % 12))
                  (LETT |v| (|RADFF;iBasis| (QVELT |rt| 2) |m| %))
                  (LETT |w| (MAKEARR1 |m| (|spadConstant| % 18)))
                  (SEQ (LETT |i| (QREFELT % 31)) (LETT #1# (QVSIZE |v|)) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (QSETAREF1O |w| |i|
                                    (SPADCALL |b|
                                              (SPADCALL
                                               (SPADCALL (QAREF1O |v| |i| 1)
                                                         (QREFELT % 93))
                                               |x| (QREFELT % 96))
                                              (QREFELT % 61))
                                    1)
                        (EXIT (LETT |b| (SPADCALL |b| |a| (QREFELT % 56)))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (EXIT |w|)))))))) 

(SDEFUN |RADFF;charPintbas|
        ((|p| (UPUP)) (|c| (|Fraction| UP)) (|v| (|Vector| (|Fraction| UP)))
         (|w| (|Vector| (|Fraction| UP))) (% (|Void|)))
        (SPROG
         ((|a| (|Fraction| UP)) (#1=#:G119 NIL) (|i| NIL) (#2=#:G120 NIL)
          (|j| NIL) (#3=#:G121 NIL) (|k| NIL)
          (|ib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (|q| (|SparseUnivariatePolynomial| UP)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |p| (QREFELT % 101)) (QREFELT % 10)
                      (QREFELT % 100))
            (|error| "charPintbas: should not happen"))
           ('T
            (SEQ (LETT |q| (SPADCALL (ELT % 102) |p| (QREFELT % 106)))
                 (LETT |ib|
                       (SPADCALL
                        (|compiledLookupCheck| '|integralBasis|
                                               (LIST
                                                (LIST '|Record|
                                                      (LIST '|:| '|basis|
                                                            (LIST '|Matrix|
                                                                  (|devaluate|
                                                                   (ELT % 7))))
                                                      (LIST '|:| '|basisDen|
                                                            (|devaluate|
                                                             (ELT % 7)))
                                                      (LIST '|:| '|basisInv|
                                                            (LIST '|Matrix|
                                                                  (|devaluate|
                                                                   (ELT %
                                                                        7))))))
                                               (|FunctionFieldIntegralBasis|
                                                (ELT % 7)
                                                (|SparseUnivariatePolynomial|
                                                 (ELT % 7))
                                                (|SimpleAlgebraicExtension|
                                                 (ELT % 7)
                                                 (|SparseUnivariatePolynomial|
                                                  (ELT % 7))
                                                 |q|)))))
                 (COND
                  ((NULL (SPADCALL (QVELT |ib| 0) (QREFELT % 108)))
                   (EXIT
                    (|error| "charPintbas: integral basis not diagonal"))))
                 (LETT |a| (|spadConstant| % 12))
                 (SEQ (LETT |k| (QREFELT % 31)) (LETT #3# (QVSIZE |v|))
                      (LETT |j| (PROGN (QVELT |ib| 0) 1))
                      (LETT #2# (SPADCALL (QVELT |ib| 0) (QREFELT % 110)))
                      (LETT |i| (PROGN (QVELT |ib| 0) 1))
                      (LETT #1# (SPADCALL (QVELT |ib| 0) (QREFELT % 109))) G190
                      (COND
                       ((OR (> |i| #1#) (> |j| #2#) (> |k| #3#)) (GO G191)))
                      (SEQ
                       (QSETAREF1O |v| |k|
                                   (SPADCALL
                                    (SPADCALL
                                     (QAREF2O (QVELT |ib| 0) |i| |j| 1 1)
                                     (QVELT |ib| 1) (QREFELT % 55))
                                    |a| (QREFELT % 56))
                                   1)
                       (QSETAREF1O |w| |k|
                                   (SPADCALL
                                    (QAREF2O (QVELT |ib| 2) |i| |j| 1 1)
                                    (SPADCALL |a| (QREFELT % 94))
                                    (QREFELT % 111))
                                   1)
                       (EXIT (LETT |a| (SPADCALL |a| |c| (QREFELT % 56)))))
                      (LETT |i|
                            (PROG1 (+ |i| 1)
                              (LETT |j|
                                    (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1))))))
                      (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL (QREFELT % 113))))))))) 

(SDEFUN |RADFF;charPStartUp| ((% (|Void|)))
        (SPROG
         ((|r| (|Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP)))
          (|invmod| (UPUP)) (|x| (|Fraction| UP)))
         (SEQ (LETT |r| (SPADCALL (QREFELT % 23) (QREFELT % 115)))
              (|RADFF;charPintbas| (QCDR |r|) (QCAR |r|) (QREFELT % 24)
               (QREFELT % 25) %)
              (LETT |x|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| % 91) 1 (QREFELT % 92))
                      (QREFELT % 93))
                     (QREFELT % 94)))
              (LETT |invmod|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 12) (QREFELT % 10)
                               (QREFELT % 14))
                     (SPADCALL (SPADCALL (QREFELT % 9) |x| (QREFELT % 96))
                               (QREFELT % 15))
                     (QREFELT % 16)))
              (LETT |r| (SPADCALL |invmod| (QREFELT % 115)))
              (EXIT
               (|RADFF;charPintbas| (QCDR |r|)
                (SPADCALL (QCAR |r|) |x| (QREFELT % 96)) (QREFELT % 26)
                (QREFELT % 27) %))))) 

(SDEFUN |RADFF;startUp| ((|b| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|dsc| (|Fraction| UP)) (#1=#:G139 NIL)
          (#2=#:G138 #3=(|Fraction| UP)) (#4=#:G140 #3#) (#5=#:G143 NIL)
          (|i| NIL) (|p| (|NonNegativeInteger|)))
         (SEQ (SETELT % 17 |b|)
              (COND
               ((OR (ZEROP (LETT |p| (SPADCALL (QREFELT % 116))))
                    (> |p| (QREFELT % 10)))
                (|RADFF;char0StartUp| %))
               ('T (|RADFF;charPStartUp| %)))
              (LETT |dsc|
                    (SPADCALL
                     (SPADCALL
                      (*
                       (EXPT -1
                             (QUOTIENT2 (* (QREFELT % 10) (QREFELT % 22)) 2))
                       (EXPT (QREFELT % 10) (QREFELT % 10)))
                      (SPADCALL (QREFELT % 9) (QREFELT % 22) (QREFELT % 117))
                      (QREFELT % 69))
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |i| (QREFELT % 31))
                           (LETT #5# (QVSIZE (QREFELT % 24))) G190
                           (COND ((> |i| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (SPADCALL (QAREF1O (QREFELT % 24) |i| 1) 2
                                              (QREFELT % 118)))
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #4# (QREFELT % 56))))
                               ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| % 12))))
                     (QREFELT % 56)))
              (SETELT % 19
                      (SPADCALL
                       (SPADCALL (SPADCALL |dsc| (QREFELT % 119))
                                 (QREFELT % 120))
                       (SPADCALL |dsc| (QREFELT % 121)) (QREFELT % 55)))
              (EXIT (SPADCALL (QREFELT % 113)))))) 

(SDEFUN |RADFF;char0StartUp| ((% (|Void|)))
        (SPROG
         ((|a| (|Fraction| UP)) (|invden| (|Fraction| UP)) (#1=#:G151 NIL)
          (|i| NIL) (|infb| (|Vector| (|Fraction| UP))) (|ib| (|Vector| UP))
          (|rp|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| UP)) (|:| |radicand| UP))))
         (SEQ
          (LETT |rp| (SPADCALL (QREFELT % 9) (QREFELT % 10) (QREFELT % 99)))
          (EXIT
           (COND
            ((SPADCALL (QVELT |rp| 0) (QREFELT % 10) (QREFELT % 100))
             (|error| "RadicalFunctionField: curve is not irreducible"))
            ('T
             (SEQ (SETELT % 21 (QVELT |rp| 2))
                  (LETT |ib| (|RADFF;iBasis| (QREFELT % 21) (QREFELT % 10) %))
                  (LETT |infb|
                        (|RADFF;inftyBasis| (QREFELT % 9) (QREFELT % 10) %))
                  (LETT |invden| (|spadConstant| % 12))
                  (SEQ (LETT |i| (QREFELT % 31)) (LETT #1# (QVSIZE |ib|)) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (QSETAREF1O (QREFELT % 25) |i|
                                    (LETT |a|
                                          (SPADCALL (QAREF1O |ib| |i| 1)
                                                    |invden| (QREFELT % 111)))
                                    1)
                        (QSETAREF1O (QREFELT % 24) |i|
                                    (SPADCALL |a| (QREFELT % 94)) 1)
                        (LETT |invden|
                              (SPADCALL |invden| (QVELT |rp| 1)
                                        (QREFELT % 61)))
                        (QSETAREF1O (QREFELT % 26) |i|
                                    (LETT |a| (QAREF1O |infb| |i| 1)) 1)
                        (EXIT
                         (QSETAREF1O (QREFELT % 27) |i|
                                     (SPADCALL |a| (QREFELT % 94)) 1)))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL (QREFELT % 113)))))))))) 

(SDEFUN |RADFF;ramified?;UPB;26| ((|p| (UP)) (% (|Boolean|)))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ (LETT |r| (SPADCALL |p| (QREFELT % 123)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 124)))
                      ('T
                       (QEQCAR
                        (SPADCALL (|RADFF;radcand| %) |p| (QREFELT % 125))
                        0))))))) 

(SDEFUN |RADFF;singular?;UPB;27| ((|p| (UP)) (% (|Boolean|)))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ (LETT |r| (SPADCALL |p| (QREFELT % 123)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 124)))
                      ('T
                       (QEQCAR
                        (SPADCALL (|RADFF;radcand| %)
                                  (SPADCALL |p| 2 (QREFELT % 128))
                                  (QREFELT % 125))
                        0))))))) 

(SDEFUN |RADFF;branchPoint?;UPB;28| ((|p| (UP)) (% (|Boolean|)))
        (SPROG ((|q| (|Union| UP "failed")) (|r| (|Union| F "failed")))
               (SEQ (LETT |r| (SPADCALL |p| (QREFELT % 123)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 130)))
                      (#1='T
                       (SEQ
                        (LETT |q|
                              (SPADCALL (|RADFF;radcand| %) |p|
                                        (QREFELT % 125)))
                        (EXIT
                         (COND
                          ((QEQCAR |q| 0)
                           (QEQCAR (SPADCALL (QCDR |q|) |p| (QREFELT % 125))
                                   1))
                          (#1# NIL)))))))))) 

(SDEFUN |RADFF;singular?;FB;29| ((|point| (F)) (% (|Boolean|)))
        (SPROG ((#1=#:G178 NIL))
               (COND
                ((SPADCALL
                  (SPADCALL (|RADFF;radcand| %) |point| (QREFELT % 43))
                  (QREFELT % 45))
                 (SPADCALL
                  (SPADCALL
                   (PROG2
                       (LETT #1#
                             (SPADCALL (|RADFF;radcand| %)
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 91) 1
                                                  (QREFELT % 92))
                                        (SPADCALL |point| (QREFELT % 132))
                                        (QREFELT % 133))
                                       (QREFELT % 125)))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                     (|Union| (QREFELT % 7) "failed") #1#))
                   |point| (QREFELT % 43))
                  (QREFELT % 45)))
                ('T NIL)))) 

(SDEFUN |RADFF;branchPoint?;FB;30| ((|point| (F)) (% (|Boolean|)))
        (SPROG ((#1=#:G183 NIL))
               (COND
                ((SPADCALL
                  (SPADCALL (|RADFF;radcand| %) |point| (QREFELT % 43))
                  (QREFELT % 45))
                 (NULL
                  (SPADCALL
                   (SPADCALL
                    (PROG2
                        (LETT #1#
                              (SPADCALL (|RADFF;radcand| %)
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 91) 1
                                                   (QREFELT % 92))
                                         (SPADCALL |point| (QREFELT % 132))
                                         (QREFELT % 133))
                                        (QREFELT % 125)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                      (|Union| (QREFELT % 7) "failed") #1#))
                    |point| (QREFELT % 43))
                   (QREFELT % 45))))
                ('T NIL)))) 

(DECLAIM (NOTINLINE |RadicalFunctionField;|)) 

(DEFUN |RadicalFunctionField;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((#1=#:G10 NIL) (|pv$| NIL) (#2=#:G229 NIL) (#3=#:G230 NIL) (% NIL)
    (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 |#4|)
    (LETT DV$5 |#5|)
    (LETT |dv$| (LIST '|RadicalFunctionField| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 176))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|FiniteFieldCategory|))
                                        (LETT #3#
                                              (|HasCategory| (|Fraction| |#2|)
                                                             '(|Field|)))
                                        (OR #3#
                                            (|HasCategory| (|Fraction| |#2|)
                                                           '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|Finite|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|Hashable|))
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
                                                              '(|Field|))))
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
                                        (|HasCategory| |#1| '(|Finite|))))))
    (|haddProp| |$ConstructorCache| '|RadicalFunctionField|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (AND (|HasCategory| % '(|CharacteristicNonZero|))
         (|HasCategory| (|Fraction| |#2|) '(|FiniteFieldCategory|))
         (|augmentPredVector| % 65536))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 17 'T)
    (QSETREFV % 19 (|spadConstant| % 18))
    (QSETREFV % 21 (|spadConstant| % 20))
    (QSETREFV % 22
              (PROG1 (LETT #1# (- |#5| 1))
                (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                  '(|Integer|) #1#)))
    (QSETREFV % 23
              (SPADCALL (SPADCALL (|spadConstant| % 12) |#5| (QREFELT % 14))
                        (SPADCALL |#4| (QREFELT % 15)) (QREFELT % 16)))
    (QSETREFV % 24 (MAKEARR1 |#5| (|spadConstant| % 18)))
    (QSETREFV % 25 (MAKEARR1 |#5| (|spadConstant| % 18)))
    (QSETREFV % 26 (MAKEARR1 |#5| (|spadConstant| % 18)))
    (QSETREFV % 27 (MAKEARR1 |#5| (|spadConstant| % 18)))
    (QSETREFV % 31 (SPADCALL (QREFELT % 24) (QREFELT % 30)))
    %))) 

(DEFUN |RadicalFunctionField| (&REST #1=#:G231)
  (SPROG NIL
         (PROG (#2=#:G232)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T T NIL NIL))
                     (HGET |$ConstructorCache| '|RadicalFunctionField|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RadicalFunctionField;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RadicalFunctionField|)))))))))) 

(MAKEPROP '|RadicalFunctionField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SimpleAlgebraicExtension| 11 8
                                          (NRTEVAL
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| % 12)
                                                      (QREFELT % 10)
                                                      (QREFELT % 14))
                                            (SPADCALL (QREFELT % 9)
                                                      (QREFELT % 15))
                                            (QREFELT % 16))))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|local| |#5|) (|Fraction| 7) (0 . |One|) (|NonNegativeInteger|)
              (4 . |monomial|) (10 . |coerce|) (15 . -) '|brandNew?|
              (21 . |Zero|) '|discPoly| (25 . |Zero|) '|newrad| '|n1|
              '|modulus| '|ibasis| '|invibasis| '|infbasis| '|invinfbasis|
              (|Integer|) (|Vector| 11) (29 . |minIndex|) '|mini|
              |RADFF;discriminant;F;1| (|Vector| %) |RADFF;integralBasis;V;3|
              |RADFF;integralBasisAtInfinity;V;4| (|Matrix| 11)
              (34 . |diagonalMatrix|) |RADFF;integralMatrix;M;6|
              |RADFF;integralMatrixAtInfinity;M;7|
              |RADFF;inverseIntegralMatrix;M;8|
              |RADFF;inverseIntegralMatrixAtInfinity;M;9|
              |RADFF;definingPolynomial;UPUP;10| (39 . |elt|) (|Boolean|)
              (45 . |zero?|) |RADFF;ramified?;FB;11| (50 . |degree|)
              (|Union| % '"failed") (55 . |exquo|)
              |RADFF;branchPointAtInfinity?;B;12| (|Union| 7 '"failed")
              |RADFF;elliptic;U;13| |RADFF;hyperelliptic;U;14| (61 . |reduce|)
              (66 . /) (72 . *) (78 . |represents|) (|Vector| 7)
              |RADFF;integralRepresents;VUP%;16| (83 . |coordinates|) (88 . /)
              (|Record| (|:| |num| 58) (|:| |den| 7))
              (|InnerCommonDenominator| 7 11 58 29) (94 . |splitDenominator|)
              |RADFF;integralCoordinates;%R;17| (|Mapping| 7 7)
              (99 . |differentiate|) (105 . *) (111 . *) (117 . +) (|Matrix| 7)
              (123 . |diagonalMatrix|) (|Record| (|:| |num| 71) (|:| |den| 7))
              |RADFF;integralDerivationMatrix;MR;18| (|Factored| %)
              (128 . |squareFree|) (133 . ^) (139 . *) (145 . |One|)
              (|Factored| 7) (149 . |unit|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 13)) (|List| 82)
              (154 . |factors|) (|PrimitiveArray| 7) (159 . |maxIndex|)
              (164 . =) (|Union| 82 '"failed") (|Mapping| 44 82) (170 . |find|)
              (176 . |One|) (180 . |monomial|) (186 . |coerce|) (191 . |inv|)
              (|Fraction| %) (196 . |elt|)
              (|Record| (|:| |exponent| 13) (|:| |coef| 11) (|:| |radicand| 7))
              (|ChangeOfVariable| 6 7 8) (202 . |rootPoly|) (208 . ~=)
              (214 . |degree|) (219 . |retract|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 8 7 103)
              (224 . |map|) (230 . |basis|) (234 . |diagonal?|)
              (239 . |maxRowIndex|) (244 . |maxColIndex|) (249 . *) (|Void|)
              (255 . |void|) (|Record| (|:| |coef| 11) (|:| |poly| 8))
              (259 . |mkIntegral|) (264 . |characteristic|) (268 . ^) (274 . ^)
              (280 . |numer|) (285 . |primitivePart|) (290 . |denom|)
              (|Union| 6 '#1="failed") (295 . |retractIfCan|)
              |RADFF;singular?;FB;29| (300 . |exquo|) |RADFF;ramified?;UPB;26|
              (|PositiveInteger|) (306 . ^) |RADFF;singular?;UPB;27|
              |RADFF;branchPoint?;FB;30| |RADFF;branchPoint?;UPB;28|
              (312 . |coerce|) (317 . -) (|String|) (|OutputForm|)
              (|Union| 11 '#1#) (|Record| (|:| |mat| 36) (|:| |vec| 29))
              (|Matrix| %) (|List| 7)
              (|Record| (|:| |num| %) (|:| |den| 7) (|:| |derivden| 7)
                        (|:| |gd| 7))
              (|Union| 33 '#2="failed") (|Symbol|) (|List| 142) (|List| 13)
              (|Fraction| 28) (|List| (|Polynomial| 6)) (|List| (|List| 6))
              (|Fraction| 8) (|Mapping| 11 11) (|Union| 151 '#3="failed")
              (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 153 '#3#)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 151) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|InputForm|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Table| 127 13) (|Record| (|:| |factor| 28) (|:| |exponent| 13))
              (|List| 163) (|Factored| 157) (|Union| 167 '#2#) (|List| 157)
              (|OnePointCompletion| 127) (|Union| 13 '"failed") (|HashState|)
              (|SingleInteger|) (|Matrix| 28)
              (|Record| (|:| |mat| 172) (|:| |vec| (|Vector| 28)))
              (|Union| 145 '#1#) (|Union| 28 '#1#))
           '#(~= 323 |zero?| 329 |yCoordinates| 334 |unitNormal| 339
              |unitCanonical| 344 |unit?| 349 |traceMatrix| 354 |trace| 363
              |tableForDiscreteLogarithm| 368 |subtractIfCan| 373
              |squareFreePolynomial| 379 |squareFreePart| 384 |squareFree| 389
              |special_order| 394 |solveLinearPolynomialEquation| 400
              |smaller?| 406 |sizeLess?| 412 |size| 418 |singularAtInfinity?|
              422 |singular?| 426 |sample| 436 |rightRecip| 440 |rightPower|
              445 |retractIfCan| 457 |retract| 472 |represents| 487
              |representationType| 504 |rem| 508 |regularRepresentation| 514
              |reducedSystem| 525 |reduceBasisAtInfinity| 547 |reduce| 552
              |recip| 562 |rationalPoints| 567 |rationalPoint?| 571 |rank| 577
              |random| 581 |ramifiedAtInfinity?| 585 |ramified?| 589 |quo| 599
              |principalIdeal| 605 |primitivePart| 610 |primitiveElement| 615
              |primitive?| 619 |primeFrobenius| 624 |prime?| 635 |plenaryPower|
              640 |order| 646 |opposite?| 656 |one?| 662 |numberOfComponents|
              667 |normalizeAtInfinity| 671 |norm| 676 |nonSingularModel| 681
              |nextItem| 686 |multiEuclidean| 691 |minimalPolynomial| 697
              |lookup| 702 |lift| 707 |leftRecip| 712 |leftPower| 717 |lcmCoef|
              729 |lcm| 735 |latex| 746 |inverseIntegralMatrixAtInfinity| 751
              |inverseIntegralMatrix| 755 |inv| 759 |integralRepresents| 764
              |integralMatrixAtInfinity| 770 |integralMatrix| 774
              |integralDerivationMatrix| 778 |integralCoordinates| 783
              |integralBasisAtInfinity| 788 |integralBasis| 792
              |integralAtInfinity?| 796 |integral?| 801 |init| 818 |index| 822
              |hyperelliptic| 827 |hashUpdate!| 831 |hash| 837 |genus| 842
              |generator| 846 |gcdPolynomial| 850 |gcd| 856
              |factorsOfCyclicGroupSize| 867 |factorSquareFreePolynomial| 871
              |factorPolynomial| 876 |factor| 881 |extendedEuclidean| 886
              |exquo| 899 |expressIdealMember| 905 |euclideanSize| 911
              |enumerate| 916 |elt| 920 |elliptic| 927 |divide| 931
              |discriminant| 937 |discreteLog| 946 |differentiate| 957
              |derivationCoordinates| 1013 |definingPolynomial| 1019
              |createPrimitiveElement| 1023 |coordinates| 1027 |convert| 1049
              |conditionP| 1074 |complementaryBasis| 1079 |commutator| 1084
              |coerce| 1090 |charthRoot| 1115 |characteristicPolynomial| 1125
              |characteristic| 1130 |branchPointAtInfinity?| 1134
              |branchPoint?| 1138 |basis| 1148 |associator| 1152 |associates?|
              1159 |antiCommutator| 1165 |annihilate?| 1171 |algSplitSimple|
              1177 |absolutelyIrreducible?| 1183 ^ 1187 |Zero| 1205 |One| 1209
              D 1213 = 1263 / 1269 - 1275 + 1286 * 1292)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 2 2 4 2 4 4 4 4 4 0 3 3 3 0 0 13 8 5 3 3
                                  1 0 0 0 3 0 0 0 0 3 0 0 0 0 11 3 0 0 0 0 0 11
                                  3 3 0 0 0 0 0 0 0 0 0 6 0 0 0 0 2 6 0 0 0 10
                                  9 7 0 0 0 10 9 6 3 3 3 0 0 0 0 0 0))
            (CONS
             '#(|FunctionFieldCategory&| |MonogenicAlgebra&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL
                |FramedAlgebra&| |DifferentialExtension&| |DivisionRing&| NIL
                NIL |FiniteRankAlgebra&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Algebra&| |EntireRing&| NIL |Algebra&|
                |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |NonAssociativeAlgebra&| |Rng&| |NonAssociativeAlgebra&|
                |Module&| NIL |Module&| |Module&| |FullyLinearlyExplicitOver&|
                NIL NIL |NonAssociativeRing&| NIL |FramedModule&| NIL NIL NIL
                NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&|
                NIL NIL NIL |Finite&| |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL NIL NIL |AbelianSemiGroup&| |Magma&|
                |FullyRetractableTo&| |RetractableTo&| |RetractableTo&|
                |Hashable&| |SetCategory&| NIL |RetractableTo&| NIL NIL NIL NIL
                NIL NIL NIL |BasicType&| NIL NIL NIL NIL)
             (CONS
              '#((|FunctionFieldCategory| 6 7 8)
                 (|MonogenicAlgebra| (|Fraction| 7) 8) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FramedAlgebra| (|Fraction| 7) 8)
                 (|DifferentialExtension| (|Fraction| 7)) (|DivisionRing|)
                 (|LeftOreRing|) (|CommutativeRing|)
                 (|FiniteRankAlgebra| (|Fraction| 7) 8)
                 (|PartialDifferentialRing| 142) (|DifferentialRing|)
                 (|CharacteristicNonZero|) (|Algebra| 145) (|EntireRing|)
                 (|CharacteristicZero|) (|Algebra| $$)
                 (|Algebra| (|Fraction| 7)) (|Ring|)
                 (|NonAssociativeAlgebra| 145) (|SemiRing|)
                 (|NonAssociativeAlgebra| (|Fraction| 7)) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|Module| 145) (|SemiRng|)
                 (|Module| (|Fraction| 7)) (|Module| $$)
                 (|FullyLinearlyExplicitOver| (|Fraction| 7))
                 (|LinearlyExplicitOver| 28) (|BiModule| 145 145)
                 (|NonAssociativeRing|)
                 (|BiModule| (|Fraction| 7) (|Fraction| 7))
                 (|FramedModule| (|Fraction| 7)) (|BiModule| $$ $$)
                 (|LinearlyExplicitOver| (|Fraction| 7)) (|RightModule| 28)
                 (|RightModule| 145) (|LeftModule| 145) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| (|Fraction| 7))
                 (|LeftModule| $$) (|RightModule| (|Fraction| 7))
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|Finite|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|StepThrough|) (|Comparable|)
                 (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| (|Fraction| 7)) (|RetractableTo| 28)
                 (|RetractableTo| 145) (|Hashable|) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| (|Fraction| 7))
                 (|CoercibleFrom| 28) (|CoercibleFrom| 145)
                 (|ConvertibleTo| 160) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CoercibleTo| 135)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|ConvertibleTo| 8) (|CoercibleFrom| (|Fraction| 7)))
              (|makeByteWordVec2| 175
                                  '(0 11 0 12 2 8 0 11 13 14 1 8 0 11 15 2 8 0
                                    0 0 16 0 11 0 18 0 7 0 20 1 29 28 0 30 1 36
                                    0 29 37 2 7 6 0 6 43 1 6 44 0 45 1 7 13 0
                                    47 2 13 48 0 0 49 1 0 0 8 54 2 11 0 7 7 55
                                    2 11 0 0 0 56 1 0 0 29 57 1 0 29 0 60 2 11
                                    0 0 0 61 1 63 62 29 64 2 11 0 0 66 67 2 11
                                    0 13 0 68 2 11 0 28 0 69 2 11 0 0 0 70 1 71
                                    0 58 72 1 7 75 0 76 2 7 0 0 13 77 2 7 0 0 0
                                    78 0 7 0 79 1 80 7 0 81 1 80 83 0 84 1 85
                                    28 0 86 2 13 44 0 0 87 2 83 88 89 0 90 0 6
                                    0 91 2 7 0 6 13 92 1 11 0 7 93 1 11 0 0 94
                                    2 7 95 95 95 96 2 98 97 11 13 99 2 13 44 0
                                    0 100 1 8 13 0 101 1 11 7 0 102 2 105 103
                                    104 8 106 0 0 33 107 1 71 44 0 108 1 71 28
                                    0 109 1 71 28 0 110 2 11 0 7 0 111 0 112 0
                                    113 1 98 114 8 115 0 6 13 116 2 11 0 0 13
                                    117 2 11 0 0 28 118 1 11 7 0 119 1 7 0 0
                                    120 1 11 7 0 121 1 7 122 0 123 2 7 48 0 0
                                    125 2 7 0 0 127 128 1 7 0 6 132 2 7 0 0 0
                                    133 2 0 44 0 0 1 1 0 44 0 1 1 0 62 0 1 1 3
                                    159 0 1 1 3 0 0 1 1 3 44 0 1 1 0 36 33 1 0
                                    0 36 1 1 0 11 0 1 1 2 162 28 1 2 0 48 0 0 1
                                    1 2 165 157 1 1 3 0 0 1 1 3 75 0 1 2 0 28 0
                                    139 1 2 2 166 167 157 1 2 6 44 0 0 1 2 3 44
                                    0 0 1 0 6 13 1 0 0 44 1 1 0 44 6 124 1 0 44
                                    7 129 0 0 0 1 1 0 48 0 1 2 0 0 0 127 1 2 0
                                    0 0 13 1 1 0 136 0 1 1 9 174 0 1 1 10 175 0
                                    1 1 0 11 0 1 1 9 145 0 1 1 10 28 0 1 2 0 0
                                    29 33 1 1 0 0 29 57 2 0 0 58 7 1 0 2 161 1
                                    2 3 0 0 0 1 2 0 36 0 33 1 1 0 36 0 1 2 0
                                    137 138 33 1 1 0 36 138 1 1 11 172 138 1 2
                                    11 173 138 33 1 1 0 33 33 1 1 0 0 8 54 1 3
                                    48 148 1 1 0 48 0 1 0 16 147 1 2 0 44 6 6 1
                                    0 0 127 1 0 6 0 1 0 0 44 1 1 0 44 6 46 1 0
                                    44 7 126 2 3 0 0 0 1 1 3 156 151 1 1 0 0 0
                                    1 0 2 0 1 1 2 44 0 1 2 2 0 0 13 1 1 2 0 0 1
                                    1 3 44 0 1 2 0 0 0 127 1 1 2 127 0 1 1 2
                                    168 0 1 2 0 44 0 0 1 1 0 44 0 1 0 0 13 1 1
                                    0 33 33 1 1 0 11 0 1 1 15 146 142 1 1 2 48
                                    0 1 2 3 150 151 0 1 1 3 8 0 1 1 6 127 0 1 1
                                    0 8 0 1 1 0 48 0 1 2 0 0 0 127 1 2 0 0 0 13
                                    1 2 3 158 0 0 1 1 3 0 151 1 2 3 0 0 0 1 1 0
                                    134 0 1 0 0 36 41 0 0 36 40 1 3 0 0 1 2 0 0
                                    58 7 59 0 0 36 39 0 0 36 38 1 0 73 66 74 1
                                    0 62 0 65 0 0 33 35 0 0 33 34 1 0 44 0 1 1
                                    0 44 0 1 2 0 44 0 6 1 2 0 44 0 7 1 0 2 0 1
                                    1 6 0 127 1 0 0 51 53 2 7 170 170 0 1 1 7
                                    171 0 1 0 0 13 1 0 0 0 1 2 3 157 157 157 1
                                    2 3 0 0 0 1 1 3 0 151 1 0 2 164 1 1 2 165
                                    157 1 1 2 165 157 1 1 3 75 0 1 2 3 152 0 0
                                    1 3 3 154 0 0 0 1 2 3 48 0 0 1 2 3 150 151
                                    0 1 1 3 13 0 1 0 6 151 1 3 0 6 0 6 6 1 0 0
                                    51 52 2 3 155 0 0 1 1 0 11 33 1 0 0 11 32 1
                                    2 13 0 1 2 2 169 0 0 1 2 0 0 0 66 1 2 12 0
                                    0 142 1 2 12 0 0 143 1 3 12 0 0 143 144 1 3
                                    12 0 0 142 13 1 1 8 0 0 1 2 8 0 0 13 1 3 3
                                    0 0 149 13 1 2 3 0 0 149 1 2 3 36 33 149 1
                                    0 0 8 42 0 2 0 1 2 0 29 0 33 1 2 0 36 33 33
                                    1 1 0 36 33 1 1 0 29 0 60 1 0 0 29 1 1 0 29
                                    0 1 1 0 8 0 1 1 0 0 8 1 1 6 160 0 1 1 17
                                    141 138 1 1 0 33 33 1 2 0 0 0 0 1 1 0 135 0
                                    1 1 0 0 28 1 1 0 0 11 1 1 0 0 0 1 1 14 0
                                    145 1 1 5 48 0 1 1 2 0 0 1 1 0 8 0 1 0 0 13
                                    1 0 0 44 50 1 0 44 6 130 1 0 44 7 131 0 0
                                    33 107 3 0 0 0 0 0 1 2 3 44 0 0 1 2 0 0 0 0
                                    1 2 0 44 0 0 1 2 0 140 0 66 1 0 0 44 1 2 0
                                    0 0 127 1 2 0 0 0 13 1 2 3 0 0 28 1 0 0 0 1
                                    0 0 0 1 2 12 0 0 142 1 3 12 0 0 142 13 1 2
                                    12 0 0 143 1 3 12 0 0 143 144 1 1 8 0 0 1 2
                                    8 0 0 13 1 2 3 0 0 149 1 3 3 0 0 149 13 1 2
                                    0 44 0 0 1 2 3 0 0 0 1 2 0 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 127 0 1 2 0 0 0 0 1 2 0
                                    0 28 0 1 2 0 0 13 0 1 2 0 0 0 11 1 2 0 0 11
                                    0 1 2 3 0 145 0 1 2 3 0 0 145 1 2 11 0 0 28
                                    1)))))
           '|lookupComplete|)) 
