
(SDEFUN |OREPCAT-;coerce;RS;1| ((|x| R) ($ S)) (SPADCALL |x| 0 (QREFELT $ 11))) 

(SDEFUN |OREPCAT-;coefficients;SL;2| ((|l| S) ($ |List| R))
        (SPROG ((|ans| (|List| R)))
               (SEQ (LETT |ans| NIL . #1=(|OREPCAT-;coefficients;SL;2|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |l| (|spadConstant| $ 8) (QREFELT $ 14)))
                           (GO G191)))
                         (SEQ
                          (LETT |ans|
                                (CONS (SPADCALL |l| (QREFELT $ 15)) |ans|)
                                . #1#)
                          (EXIT
                           (LETT |l| (SPADCALL |l| (QREFELT $ 16)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |OREPCAT-;*;R2S;3| ((|a| R) (|y| S) ($ S))
        (SPROG ((|z| (S)))
               (SEQ (LETT |z| (|spadConstant| $ 8) . #1=(|OREPCAT-;*;R2S;3|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |y| (|spadConstant| $ 8) (QREFELT $ 14)))
                           (GO G191)))
                         (SEQ
                          (LETT |z|
                                (SPADCALL |z|
                                          (SPADCALL
                                           (SPADCALL |a|
                                                     (SPADCALL |y|
                                                               (QREFELT $ 15))
                                                     (QREFELT $ 19))
                                           (SPADCALL |y| (QREFELT $ 20))
                                           (QREFELT $ 11))
                                          (QREFELT $ 21))
                                . #1#)
                          (EXIT
                           (LETT |y| (SPADCALL |y| (QREFELT $ 16)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |z|)))) 

(SDEFUN |OREPCAT-;retractIfCan;SU;4| ((|x| S) ($ |Union| R "failed"))
        (COND
         ((OR (SPADCALL |x| (QREFELT $ 23))
              (ZEROP (SPADCALL |x| (QREFELT $ 20))))
          (CONS 0 (SPADCALL |x| (QREFELT $ 15))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |OREPCAT-;exquo;SRU;5| ((|l| S) (|a| R) ($ |Union| S "failed"))
        (SPROG ((|ans| (S)) (#1=#:G757 NIL) (|u| (|Union| R "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |ans| (|spadConstant| $ 8)
                        . #2=(|OREPCAT-;exquo;SRU;5|))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |l| (|spadConstant| $ 8) (QREFELT $ 14)))
                         (GO G191)))
                       (SEQ
                        (LETT |u|
                              (SPADCALL (SPADCALL |l| (QREFELT $ 15)) |a|
                                        (QREFELT $ 27))
                              . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 1)
                           (PROGN
                            (LETT #1# (CONS 1 "failed") . #2#)
                            (GO #3=#:G756)))
                          ('T
                           (SEQ
                            (LETT |ans|
                                  (SPADCALL |ans|
                                            (SPADCALL (QCDR |u|)
                                                      (SPADCALL |l|
                                                                (QREFELT $ 20))
                                                      (QREFELT $ 11))
                                            (QREFELT $ 21))
                                  . #2#)
                            (EXIT
                             (LETT |l| (SPADCALL |l| (QREFELT $ 16))
                                   . #2#)))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 |ans|))))
                #3# (EXIT #1#)))) 

(SDEFUN |OREPCAT-;content;SR;6| ((|l| S) ($ R))
        (SPADCALL (SPADCALL |l| (QREFELT $ 29)) (QREFELT $ 31))) 

(SDEFUN |OREPCAT-;primitivePart;2S;7| ((|l| S) ($ S))
        (SPROG ((#1=#:G760 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL |l| (SPADCALL |l| (QREFELT $ 33))
                                   (QREFELT $ 34))
                         |OREPCAT-;primitivePart;2S;7|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                 (|Union| (QREFELT $ 6) "failed") #1#)))) 

(SDEFUN |OREPCAT-;leftQuotient;3S;8| ((|a| S) (|b| S) ($ S))
        (QCAR (SPADCALL |a| |b| (QREFELT $ 37)))) 

(SDEFUN |OREPCAT-;leftRemainder;3S;9| ((|a| S) (|b| S) ($ S))
        (QCDR (SPADCALL |a| |b| (QREFELT $ 37)))) 

(SDEFUN |OREPCAT-;leftExtendedGcd;2SR;10|
        ((|a| S) (|b| S)
         ($ |Record| (|:| |coef1| S) (|:| |coef2| S) (|:| |generator| S)))
        (|OREPCAT-;extended| |a| |b| (CONS (|function| |OREPCAT-;leftEEA|) $)
         $)) 

(SDEFUN |OREPCAT-;rightLcm;3S;11| ((|a| S) (|b| S) ($ S))
        (|OREPCAT-;nclcm| |a| |b| (CONS (|function| |OREPCAT-;leftEEA|) $) $)) 

(SDEFUN |OREPCAT-;rightQuotient;3S;12| ((|a| S) (|b| S) ($ S))
        (QCAR (SPADCALL |a| |b| (QREFELT $ 43)))) 

(SDEFUN |OREPCAT-;rightRemainder;3S;13| ((|a| S) (|b| S) ($ S))
        (QCDR (SPADCALL |a| |b| (QREFELT $ 43)))) 

(SDEFUN |OREPCAT-;rightExtendedGcd;2SR;14|
        ((|a| S) (|b| S)
         ($ |Record| (|:| |coef1| S) (|:| |coef2| S) (|:| |generator| S)))
        (|OREPCAT-;extended| |a| |b| (CONS (|function| |OREPCAT-;rightEEA|) $)
         $)) 

(SDEFUN |OREPCAT-;leftLcm;3S;15| ((|a| S) (|b| S) ($ S))
        (|OREPCAT-;nclcm| |a| |b| (CONS (|function| |OREPCAT-;rightEEA|) $) $)) 

(SDEFUN |OREPCAT-;leftExactQuotient;2SU;16|
        ((|a| S) (|b| S) ($ |Union| S "failed"))
        (|OREPCAT-;exactQuotient| (SPADCALL |a| |b| (QREFELT $ 37)) $)) 

(SDEFUN |OREPCAT-;rightExactQuotient;2SU;17|
        ((|a| S) (|b| S) ($ |Union| S "failed"))
        (|OREPCAT-;exactQuotient| (SPADCALL |a| |b| (QREFELT $ 43)) $)) 

(SDEFUN |OREPCAT-;rightGcd;3S;18| ((|a| S) (|b| S) ($ S))
        (|OREPCAT-;ncgcd| |a| |b| (ELT $ 50) $)) 

(SDEFUN |OREPCAT-;leftGcd;3S;19| ((|a| S) (|b| S) ($ S))
        (|OREPCAT-;ncgcd| |a| |b| (ELT $ 52) $)) 

(SDEFUN |OREPCAT-;exactQuotient|
        ((|qr| |Record| (|:| |quotient| S) (|:| |remainder| S))
         ($ |Union| S "failed"))
        (COND ((SPADCALL (QCDR |qr|) (QREFELT $ 23)) (CONS 0 (QCAR |qr|)))
              ('T (CONS 1 "failed")))) 

(SDEFUN |OREPCAT-;leftEEA|
        ((|a| S) (|b| S)
         ($ |Record| (|:| |gcd| S) (|:| |coef1| S) (|:| |coef2| S)
          (|:| |lcm| S)))
        (SPROG
         ((|v| (S)) (|v0| (S)) (|#G45| (S)) (|#G44| (S)) (|u| (S)) (|u0| (S))
          (|#G43| (S)) (|#G42| (S)) (|#G41| (S)) (|#G40| (S))
          (|qr| (|Record| (|:| |quotient| S) (|:| |remainder| S))) (|a0| (S)))
         (SEQ (LETT |a0| |a| . #1=(|OREPCAT-;leftEEA|))
              (LETT |u0| (LETT |v| (|spadConstant| $ 54) . #1#) . #1#)
              (LETT |v0| (LETT |u| (|spadConstant| $ 8) . #1#) . #1#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |b| (|spadConstant| $ 8) (QREFELT $ 14)))
                     (GO G191)))
                   (SEQ (LETT |qr| (SPADCALL |a| |b| (QREFELT $ 37)) . #1#)
                        (PROGN
                         (LETT |#G40| |b| . #1#)
                         (LETT |#G41| (QCDR |qr|) . #1#)
                         (LETT |a| |#G40| . #1#)
                         (LETT |b| |#G41| . #1#))
                        (PROGN
                         (LETT |#G42| |u| . #1#)
                         (LETT |#G43|
                               (SPADCALL |u0|
                                         (SPADCALL |u| (QCAR |qr|)
                                                   (QREFELT $ 55))
                                         (QREFELT $ 56))
                               . #1#)
                         (LETT |u0| |#G42| . #1#)
                         (LETT |u| |#G43| . #1#))
                        (EXIT
                         (PROGN
                          (LETT |#G44| |v| . #1#)
                          (LETT |#G45|
                                (SPADCALL |v0|
                                          (SPADCALL |v| (QCAR |qr|)
                                                    (QREFELT $ 55))
                                          (QREFELT $ 56))
                                . #1#)
                          (LETT |v0| |#G44| . #1#)
                          (LETT |v| |#G45| . #1#))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (VECTOR |a| |u0| |v0| (SPADCALL |a0| |u| (QREFELT $ 55))))))) 

(SDEFUN |OREPCAT-;ncgcd| ((|a| S) (|b| S) (|ncrem| |Mapping| S S S) ($ S))
        (SPROG ((|#G50| (S)) (|#G49| (S)))
               (SEQ
                (COND ((SPADCALL |a| (QREFELT $ 23)) |b|)
                      ((SPADCALL |b| (QREFELT $ 23)) |a|)
                      ((< (SPADCALL |a| (QREFELT $ 20))
                          (SPADCALL |b| (QREFELT $ 20)))
                       (|OREPCAT-;ncgcd| |b| |a| |ncrem| $))
                      ('T
                       (SEQ
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL |b| (|spadConstant| $ 8)
                                          (QREFELT $ 14)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT |#G49| |b| . #1=(|OREPCAT-;ncgcd|))
                                (LETT |#G50| (SPADCALL |a| |b| |ncrem|) . #1#)
                                (LETT |a| |#G49| . #1#)
                                (LETT |b| |#G50| . #1#))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |a|))))))) 

(SDEFUN |OREPCAT-;extended|
        ((|a| S) (|b| S)
         (|eea| |Mapping|
          #1=(|Record| (|:| |gcd| S) (|:| |coef1| S) (|:| |coef2| S)
                       (|:| |lcm| S))
          S S)
         ($ |Record| (|:| |coef1| S) (|:| |coef2| S) (|:| |generator| S)))
        (SPROG ((|rec| #1#))
               (SEQ
                (COND
                 ((SPADCALL |a| (QREFELT $ 23))
                  (VECTOR (|spadConstant| $ 8) (|spadConstant| $ 54) |b|))
                 ((SPADCALL |b| (QREFELT $ 23))
                  (VECTOR (|spadConstant| $ 54) (|spadConstant| $ 8) |a|))
                 ((< (SPADCALL |a| (QREFELT $ 20))
                     (SPADCALL |b| (QREFELT $ 20)))
                  (SEQ
                   (LETT |rec| (SPADCALL |b| |a| |eea|)
                         . #2=(|OREPCAT-;extended|))
                   (EXIT
                    (VECTOR (QVELT |rec| 2) (QVELT |rec| 1) (QVELT |rec| 0)))))
                 ('T
                  (SEQ (LETT |rec| (SPADCALL |a| |b| |eea|) . #2#)
                       (EXIT
                        (VECTOR (QVELT |rec| 1) (QVELT |rec| 2)
                                (QVELT |rec| 0))))))))) 

(SDEFUN |OREPCAT-;nclcm|
        ((|a| S) (|b| S)
         (|eea| |Mapping|
          #1=(|Record| (|:| |gcd| S) (|:| |coef1| S) (|:| |coef2| S)
                       (|:| |lcm| S))
          S S)
         ($ S))
        (SPROG ((|rec| #1#))
               (SEQ
                (COND
                 ((OR (SPADCALL |a| (QREFELT $ 23))
                      (SPADCALL |b| (QREFELT $ 23)))
                  (|spadConstant| $ 8))
                 ('T
                  (COND
                   ((< (SPADCALL |a| (QREFELT $ 20))
                       (SPADCALL |b| (QREFELT $ 20)))
                    (|OREPCAT-;nclcm| |b| |a| |eea| $))
                   ('T
                    (SEQ (LETT |rec| (SPADCALL |a| |b| |eea|) |OREPCAT-;nclcm|)
                         (EXIT (QVELT |rec| 3)))))))))) 

(SDEFUN |OREPCAT-;right_ext_ext_GCD;2SR;25|
        ((|a| S) (|b| S)
         ($ |Record| (|:| |generator| S) (|:| |coef1| S) (|:| |coef2| S)
          (|:| |coefu| S) (|:| |coefv| S)))
        (SPROG
         ((|v| (S)) (|v0| (S)) (|#G65| (S)) (|#G64| (S)) (|u| (S)) (|u0| (S))
          (|#G63| (S)) (|#G62| (S)) (|#G61| (S)) (|#G60| (S))
          (|qr| (|Record| (|:| |quotient| S) (|:| |remainder| S))) (|a0| (S)))
         (SEQ (LETT |a0| |a| . #1=(|OREPCAT-;right_ext_ext_GCD;2SR;25|))
              (LETT |u0| (LETT |v| (|spadConstant| $ 54) . #1#) . #1#)
              (LETT |v0| (LETT |u| (|spadConstant| $ 8) . #1#) . #1#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |b| (|spadConstant| $ 8) (QREFELT $ 14)))
                     (GO G191)))
                   (SEQ (LETT |qr| (SPADCALL |a| |b| (QREFELT $ 43)) . #1#)
                        (PROGN
                         (LETT |#G60| |b| . #1#)
                         (LETT |#G61| (QCDR |qr|) . #1#)
                         (LETT |a| |#G60| . #1#)
                         (LETT |b| |#G61| . #1#))
                        (PROGN
                         (LETT |#G62| |u| . #1#)
                         (LETT |#G63|
                               (SPADCALL |u0|
                                         (SPADCALL (QCAR |qr|) |u|
                                                   (QREFELT $ 55))
                                         (QREFELT $ 56))
                               . #1#)
                         (LETT |u0| |#G62| . #1#)
                         (LETT |u| |#G63| . #1#))
                        (EXIT
                         (PROGN
                          (LETT |#G64| |v| . #1#)
                          (LETT |#G65|
                                (SPADCALL |v0|
                                          (SPADCALL (QCAR |qr|) |v|
                                                    (QREFELT $ 55))
                                          (QREFELT $ 56))
                                . #1#)
                          (LETT |v0| |#G64| . #1#)
                          (LETT |v| |#G65| . #1#))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |a| |u0| |v0| |u| |v|))))) 

(SDEFUN |OREPCAT-;rightEEA|
        ((|a| S) (|b| S)
         ($ |Record| (|:| |gcd| S) (|:| |coef1| S) (|:| |coef2| S)
          (|:| |lcm| S)))
        (SPROG
         ((|v| (S)) (|u| (S)) (|d| (S)) (|c| (S)) (|g| (S))
          (|#G68|
           (|Record| (|:| |generator| S) (|:| |coef1| S) (|:| |coef2| S)
                     (|:| |coefu| S) (|:| |coefv| S))))
         (SEQ
          (PROGN
           (LETT |#G68| (SPADCALL |a| |b| (QREFELT $ 60))
                 . #1=(|OREPCAT-;rightEEA|))
           (LETT |g| (QVELT |#G68| 0) . #1#)
           (LETT |c| (QVELT |#G68| 1) . #1#)
           (LETT |d| (QVELT |#G68| 2) . #1#)
           (LETT |u| (QVELT |#G68| 3) . #1#)
           (LETT |v| (QVELT |#G68| 4) . #1#)
           |#G68|)
          (EXIT (VECTOR |g| |c| |c| (SPADCALL |u| |a| (QREFELT $ 55))))))) 

(DECLAIM (NOTINLINE |UnivariateSkewPolynomialCategory&;|)) 

(DEFUN |UnivariateSkewPolynomialCategory&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|UnivariateSkewPolynomialCategory&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|UnivariateSkewPolynomialCategory&| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 67) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 2)
            (QSETREFV $ 28
                      (CONS (|dispatchFunction| |OREPCAT-;exquo;SRU;5|) $))))
          (COND
           ((|HasCategory| |#2| '(|GcdDomain|))
            (PROGN
             (QSETREFV $ 32
                       (CONS (|dispatchFunction| |OREPCAT-;content;SR;6|) $))
             (QSETREFV $ 35
                       (CONS (|dispatchFunction| |OREPCAT-;primitivePart;2S;7|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 38
                       (CONS (|dispatchFunction| |OREPCAT-;leftQuotient;3S;8|)
                             $))
             (QSETREFV $ 39
                       (CONS (|dispatchFunction| |OREPCAT-;leftRemainder;3S;9|)
                             $))
             (QSETREFV $ 41
                       (CONS
                        (|dispatchFunction| |OREPCAT-;leftExtendedGcd;2SR;10|)
                        $))
             (QSETREFV $ 42
                       (CONS (|dispatchFunction| |OREPCAT-;rightLcm;3S;11|) $))
             (QSETREFV $ 44
                       (CONS
                        (|dispatchFunction| |OREPCAT-;rightQuotient;3S;12|) $))
             (QSETREFV $ 45
                       (CONS
                        (|dispatchFunction| |OREPCAT-;rightRemainder;3S;13|)
                        $))
             (QSETREFV $ 46
                       (CONS
                        (|dispatchFunction| |OREPCAT-;rightExtendedGcd;2SR;14|)
                        $))
             (QSETREFV $ 47
                       (CONS (|dispatchFunction| |OREPCAT-;leftLcm;3S;15|) $))
             (QSETREFV $ 48
                       (CONS
                        (|dispatchFunction|
                         |OREPCAT-;leftExactQuotient;2SU;16|)
                        $))
             (QSETREFV $ 49
                       (CONS
                        (|dispatchFunction|
                         |OREPCAT-;rightExactQuotient;2SU;17|)
                        $))
             (QSETREFV $ 51
                       (CONS (|dispatchFunction| |OREPCAT-;rightGcd;3S;18|) $))
             (QSETREFV $ 53
                       (CONS (|dispatchFunction| |OREPCAT-;leftGcd;3S;19|) $))
             (QSETREFV $ 59
                       (CONS
                        (|dispatchFunction|
                         |OREPCAT-;right_ext_ext_GCD;2SR;25|)
                        $)))))
          $))) 

(MAKEPROP '|UnivariateSkewPolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|) (|NonNegativeInteger|) (8 . |monomial|)
              |OREPCAT-;coerce;RS;1| (|Boolean|) (14 . ~=)
              (20 . |leadingCoefficient|) (25 . |reductum|) (|List| 7)
              |OREPCAT-;coefficients;SL;2| (30 . *) (36 . |degree|) (41 . +)
              |OREPCAT-;*;R2S;3| (47 . |zero?|) (|Union| 7 '"failed")
              |OREPCAT-;retractIfCan;SU;4| (|Union| $ '"failed") (52 . |exquo|)
              (58 . |exquo|) (64 . |coefficients|) (|List| $) (69 . |gcd|)
              (74 . |content|) (79 . |content|) (84 . |exquo|)
              (90 . |primitivePart|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (95 . |leftDivide|) (101 . |leftQuotient|)
              (107 . |leftRemainder|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (113 . |leftExtendedGcd|) (119 . |rightLcm|)
              (125 . |rightDivide|) (131 . |rightQuotient|)
              (137 . |rightRemainder|) (143 . |rightExtendedGcd|)
              (149 . |leftLcm|) (155 . |leftExactQuotient|)
              (161 . |rightExactQuotient|) (167 . |rightRemainder|)
              (173 . |rightGcd|) (179 . |leftRemainder|) (185 . |leftGcd|)
              (191 . |One|) (195 . *) (201 . -) (207 . |One|)
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (211 . |right_ext_ext_GCD|) (217 . |right_ext_ext_GCD|)
              (|Integer|) (|Union| 63 '#1="failed") (|Fraction| 61)
              (|Union| 61 '#1#) (|OutputForm|) (|PositiveInteger|))
           '#(|right_ext_ext_GCD| 223 |rightRemainder| 229 |rightQuotient| 235
              |rightLcm| 241 |rightGcd| 247 |rightExtendedGcd| 253
              |rightExactQuotient| 259 |retractIfCan| 265 |primitivePart| 270
              |leftRemainder| 275 |leftQuotient| 281 |leftLcm| 287 |leftGcd|
              293 |leftExtendedGcd| 299 |leftExactQuotient| 305 |exquo| 311
              |content| 317 |coerce| 322 |coefficients| 327 * 332)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(0 6 0 8 0 7 0 9 2 6 0 7 10
                                                   11 2 6 13 0 0 14 1 6 7 0 15
                                                   1 6 0 0 16 2 7 0 0 0 19 1 6
                                                   10 0 20 2 6 0 0 0 21 1 6 13
                                                   0 23 2 7 26 0 0 27 2 0 26 0
                                                   7 28 1 6 17 0 29 1 7 0 30 31
                                                   1 0 7 0 32 1 6 7 0 33 2 6 26
                                                   0 7 34 1 0 0 0 35 2 6 36 0 0
                                                   37 2 0 0 0 0 38 2 0 0 0 0 39
                                                   2 0 40 0 0 41 2 0 0 0 0 42 2
                                                   6 36 0 0 43 2 0 0 0 0 44 2 0
                                                   0 0 0 45 2 0 40 0 0 46 2 0 0
                                                   0 0 47 2 0 26 0 0 48 2 0 26
                                                   0 0 49 2 6 0 0 0 50 2 0 0 0
                                                   0 51 2 6 0 0 0 52 2 0 0 0 0
                                                   53 0 6 0 54 2 6 0 0 0 55 2 6
                                                   0 0 0 56 0 7 0 57 2 0 58 0 0
                                                   59 2 6 58 0 0 60 2 0 58 0 0
                                                   59 2 0 0 0 0 45 2 0 0 0 0 44
                                                   2 0 0 0 0 42 2 0 0 0 0 51 2
                                                   0 40 0 0 46 2 0 26 0 0 49 1
                                                   0 24 0 25 1 0 0 0 35 2 0 0 0
                                                   0 39 2 0 0 0 0 38 2 0 0 0 0
                                                   47 2 0 0 0 0 53 2 0 40 0 0
                                                   41 2 0 26 0 0 48 2 0 26 0 7
                                                   28 1 0 7 0 32 1 0 0 7 12 1 0
                                                   17 0 18 2 0 0 7 0 22)))))
           '|lookupComplete|)) 
