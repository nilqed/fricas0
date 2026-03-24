
(SDEFUN |FFIELDC-;differentiate;2S;1| ((|x| (S)) (% (S))) (|spadConstant| % 7)) 

(SDEFUN |FFIELDC-;init;S;2| ((% (S))) (|spadConstant| % 7)) 

(SDEFUN |FFIELDC-;nextItem;SU;3| ((|a| (S)) (% (|Union| S "failed")))
        (COND
         ((SPADCALL
           (LETT |a|
                 (SPADCALL (+ (SPADCALL |a| (QREFELT % 11)) 1) (QREFELT % 12)))
           (QREFELT % 14))
          (CONS 1 "failed"))
         ('T (CONS 0 |a|)))) 

(SDEFUN |FFIELDC-;order;SOpc;4|
        ((|e| (S)) (% (|OnePointCompletion| (|PositiveInteger|))))
        (SPADCALL (SPADCALL |e| (QREFELT % 17)) (QREFELT % 19))) 

(SDEFUN |FFIELDC-;conditionP;MU;5|
        ((|mat| (|Matrix| S)) (% (|Union| (|Vector| S) "failed")))
        (SPROG ((|l| (|List| (|Vector| S))))
               (SEQ (LETT |l| (SPADCALL |mat| (QREFELT % 23)))
                    (EXIT
                     (COND ((NULL |l|) (CONS 1 "failed"))
                           ('T
                            (CONS 0
                                  (SPADCALL (ELT % 24) (|SPADfirst| |l|)
                                            (QREFELT % 27))))))))) 

(SDEFUN |FFIELDC-;charthRoot;2S;6| ((|x| (S)) (% (S)))
        (SPADCALL |x|
                  (QUOTIENT2 (SPADCALL (QREFELT % 32))
                             (SPADCALL (QREFELT % 33)))
                  (QREFELT % 34))) 

(SDEFUN |FFIELDC-;charthRoot;SU;7| ((|x| (S)) (% (|Union| S "failed")))
        (CONS 0 (SPADCALL |x| (QREFELT % 24)))) 

(SDEFUN |FFIELDC-;createPrimitiveElement;S;8| ((% (S)))
        (SPROG
         ((|found| (|Boolean|)) (|e| (S)) (#1=#:G46 NIL) (|i| NIL)
          (|start| (|Integer|)) (|sm1| (|PositiveInteger|)))
         (SEQ (LETT |sm1| (- (SPADCALL (QREFELT % 32)) 1))
              (LETT |start|
                    (COND
                     ((QEQCAR (SPADCALL (QREFELT % 38)) 1)
                      (SPADCALL (QREFELT % 33)))
                     ('T 1)))
              (LETT |found| NIL)
              (SEQ (LETT |i| |start|) G190
                   (COND ((NULL (NULL |found|)) (GO G191)))
                   (SEQ
                    (LETT |e|
                          (SPADCALL
                           (PROG1 (LETT #1# |i|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT % 12)))
                    (EXIT
                     (LETT |found| (EQL (SPADCALL |e| (QREFELT % 17)) |sm1|))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT |e|)))) 

(SDEFUN |FFIELDC-;primitive?;SB;9| ((|a| (S)) (% (|Boolean|)))
        (SPROG
         ((|equalone| (|Boolean|)) (#1=#:G57 NIL) (|exp| NIL) (|q| (|Integer|))
          (|explist|
           (|List|
            (|Record| (|:| |factor| (|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT % 14)) NIL)
                ('T
                 (SEQ (LETT |explist| (SPADCALL (QREFELT % 42)))
                      (LETT |q| (- (SPADCALL (QREFELT % 32)) 1))
                      (LETT |equalone| NIL)
                      (SEQ (LETT |exp| NIL) (LETT #1# |explist|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |exp| (CAR #1#)) NIL)
                                 (NULL (NULL |equalone|)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |equalone|
                                   (SPADCALL
                                    (SPADCALL |a| (QUOTIENT2 |q| (QCAR |exp|))
                                              (QREFELT % 44))
                                    (|spadConstant| % 45) (QREFELT % 46)))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (NULL |equalone|)))))))) 

(SDEFUN |FFIELDC-;order;SPi;10| ((|e| (S)) (% (|PositiveInteger|)))
        (SPROG
         ((|ord| (|Integer|)) (|goon| (|Boolean|)) (|a| (|Integer|))
          (#1=#:G68 NIL) (|j| NIL) (|primeDivisor| #2=(|Integer|))
          (#3=#:G67 NIL) (|rec| NIL)
          (|lof|
           (|List|
            (|Record| (|:| |factor| #2#)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((SPADCALL |e| (|spadConstant| % 7) (QREFELT % 46))
            (|error| "order(0) is not defined "))
           ('T
            (SEQ (LETT |ord| (- (SPADCALL (QREFELT % 32)) 1)) (LETT |a| 0)
                 (LETT |lof| (SPADCALL (QREFELT % 42)))
                 (SEQ (LETT |rec| NIL) (LETT #3# |lof|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |rec| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |a|
                             (QUOTIENT2 |ord|
                                        (LETT |primeDivisor| (QCAR |rec|))))
                       (LETT |goon|
                             (SPADCALL (SPADCALL |e| |a| (QREFELT % 44))
                                       (|spadConstant| % 45) (QREFELT % 46)))
                       (SEQ (LETT |j| 0) (LETT #1# (- (QCDR |rec|) 2)) G190
                            (COND
                             ((OR (|greater_SI| |j| #1#) (NULL |goon|))
                              (GO G191)))
                            (SEQ (LETT |ord| |a|)
                                 (LETT |a| (QUOTIENT2 |ord| |primeDivisor|))
                                 (EXIT
                                  (LETT |goon|
                                        (SPADCALL
                                         (SPADCALL |e| |a| (QREFELT % 44))
                                         (|spadConstant| % 45)
                                         (QREFELT % 46)))))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (COND (|goon| (LETT |ord| |a|)))))
                      (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                 (EXIT |ord|))))))) 

(SDEFUN |FFIELDC-;discreteLog;SNni;11| ((|b| (S)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|a| (S)) (|disclog| (|Integer|)) (|mult| (|Integer|)) (|c| (S))
          (|disc1| (|Integer|)) (|found| (|Boolean|))
          (|rho| (|Union| (|NonNegativeInteger|) "failed")) (#1=#:G90 NIL)
          (|i| NIL) (|end| (|Integer|)) (|n| (|NonNegativeInteger|))
          (|exptable| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|exp| #2=(|Integer|)) (#3=#:G89 NIL) (|t| NIL)
          (|fac| #4=(|Integer|)) (#5=#:G88 NIL) (|f| NIL) (|groupord| #2#)
          (|gen| (S))
          (|faclist|
           (|List|
            (|Record| (|:| |factor| #4#)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT % 14))
            (|error| "discreteLog: logarithm of zero"))
           (#6='T
            (SEQ (LETT |faclist| (SPADCALL (QREFELT % 42))) (LETT |a| |b|)
                 (LETT |gen| (SPADCALL (QREFELT % 51)))
                 (EXIT
                  (COND ((SPADCALL |b| |gen| (QREFELT % 46)) 1)
                        (#6#
                         (SEQ (LETT |disclog| 0) (LETT |mult| 1)
                              (LETT |groupord| (- (SPADCALL (QREFELT % 32)) 1))
                              (LETT |exp| |groupord|)
                              (SEQ (LETT |f| NIL) (LETT #5# |faclist|) G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN (LETT |f| (CAR #5#)) NIL))
                                     (GO G191)))
                                   (SEQ (LETT |fac| (QCAR |f|))
                                        (EXIT
                                         (SEQ (LETT |t| 0)
                                              (LETT #3# (- (QCDR |f|) 1)) G190
                                              (COND
                                               ((|greater_SI| |t| #3#)
                                                (GO G191)))
                                              (SEQ
                                               (LETT |exp|
                                                     (QUOTIENT2 |exp| |fac|))
                                               (LETT |exptable|
                                                     (SPADCALL |fac|
                                                               (QREFELT % 53)))
                                               (LETT |n|
                                                     (SPADCALL |exptable|
                                                               (QREFELT % 54)))
                                               (LETT |c|
                                                     (SPADCALL |a| |exp|
                                                               (QREFELT % 44)))
                                               (LETT |end|
                                                     (QUOTIENT2 (- |fac| 1)
                                                                |n|))
                                               (LETT |found| NIL)
                                               (LETT |disc1| 0)
                                               (SEQ (LETT |i| 0)
                                                    (LETT #1# |end|) G190
                                                    (COND
                                                     ((OR
                                                       (|greater_SI| |i| #1#)
                                                       (NULL (NULL |found|)))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |rho|
                                                           (SPADCALL
                                                            (SPADCALL |c|
                                                                      (QREFELT
                                                                       % 11))
                                                            |exptable|
                                                            (QREFELT % 57)))
                                                     (EXIT
                                                      (COND
                                                       ((QEQCAR |rho| 0)
                                                        (SEQ (LETT |found| 'T)
                                                             (EXIT
                                                              (LETT |disc1|
                                                                    (*
                                                                     (+
                                                                      (* |n|
                                                                         |i|)
                                                                      (QCDR
                                                                       |rho|))
                                                                     |mult|)))))
                                                       ('T
                                                        (LETT |c|
                                                              (SPADCALL |c|
                                                                        (SPADCALL
                                                                         |gen|
                                                                         (*
                                                                          (QUOTIENT2
                                                                           |groupord|
                                                                           |fac|)
                                                                          (-
                                                                           |n|))
                                                                         (QREFELT
                                                                          %
                                                                          44))
                                                                        (QREFELT
                                                                         %
                                                                         58)))))))
                                                    (LETT |i| (|inc_SI| |i|))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (COND
                                                 (|found|
                                                  (SEQ
                                                   (LETT |mult|
                                                         (* |mult| |fac|))
                                                   (LETT |disclog|
                                                         (+ |disclog| |disc1|))
                                                   (EXIT
                                                    (LETT |a|
                                                          (SPADCALL |a|
                                                                    (SPADCALL
                                                                     |gen|
                                                                     (-
                                                                      |disc1|)
                                                                     (QREFELT %
                                                                              44))
                                                                    (QREFELT %
                                                                             58))))))
                                                 ('T
                                                  (|error|
                                                   "discreteLog: ?? discrete logarithm")))))
                                              (LETT |t| (|inc_SI| |t|))
                                              (GO G190) G191 (EXIT NIL))))
                                   (LETT #5# (CDR #5#)) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT |disclog|))))))))))) 

(SDEFUN |FFIELDC-;discreteLog;2SU;12|
        ((|logbase| (S)) (|b| (S))
         (% (|Union| (|NonNegativeInteger|) "failed")))
        (SPROG
         ((|a| (S)) (|mult| (|Integer|)) (|disclog| (|Integer|))
          (|rho| (|Integer|)) (#1=#:G113 NIL)
          (|rhoHelp| (|Union| (|NonNegativeInteger|) "failed"))
          (|exp| (|Integer|)) (#2=#:G115 NIL) (|t| NIL) (|primroot| (S))
          (|fac| #3=(|Integer|)) (#4=#:G114 NIL) (|f| NIL)
          (|faclist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #3#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|groupord| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |b| (QREFELT % 14))
             (SEQ (SPADCALL "discreteLog: logarithm of zero" (QREFELT % 63))
                  (EXIT (CONS 1 "failed"))))
            ((SPADCALL |logbase| (QREFELT % 14))
             (SEQ
              (SPADCALL "discreteLog: logarithm to base zero" (QREFELT % 63))
              (EXIT (CONS 1 "failed"))))
            ((SPADCALL |b| |logbase| (QREFELT % 46)) (CONS 0 1))
            ('T
             (COND
              ((NULL
                (ZEROP
                 (REM (LETT |groupord| (SPADCALL |logbase| (QREFELT % 17)))
                      (SPADCALL |b| (QREFELT % 17)))))
               (SEQ
                (SPADCALL
                 "discreteLog: second argument not in cyclic group generated by first argument"
                 (QREFELT % 63))
                (EXIT (CONS 1 "failed"))))
              ('T
               (SEQ
                (LETT |faclist|
                      (SPADCALL (SPADCALL |groupord| (QREFELT % 65))
                                (QREFELT % 69)))
                (LETT |a| |b|) (LETT |disclog| 0) (LETT |mult| 1)
                (LETT |exp| |groupord|)
                (SEQ (LETT |f| NIL) (LETT #4# |faclist|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |fac| (QVELT |f| 1))
                          (LETT |primroot|
                                (SPADCALL |logbase|
                                          (QUOTIENT2 |groupord| |fac|)
                                          (QREFELT % 44)))
                          (EXIT
                           (SEQ (LETT |t| 0) (LETT #2# (- (QVELT |f| 2) 1))
                                G190 (COND ((|greater_SI| |t| #2#) (GO G191)))
                                (SEQ (LETT |exp| (QUOTIENT2 |exp| |fac|))
                                     (LETT |rhoHelp|
                                           (SPADCALL |primroot|
                                                     (SPADCALL |a| |exp|
                                                               (QREFELT % 44))
                                                     |fac| (QREFELT % 71)))
                                     (EXIT
                                      (COND
                                       ((QEQCAR |rhoHelp| 1)
                                        (PROGN
                                         (LETT #1# (CONS 1 "failed"))
                                         (GO #5=#:G112)))
                                       ('T
                                        (SEQ
                                         (LETT |rho|
                                               (* (QCDR |rhoHelp|) |mult|))
                                         (LETT |disclog| (+ |disclog| |rho|))
                                         (LETT |mult| (* |mult| |fac|))
                                         (EXIT
                                          (LETT |a|
                                                (SPADCALL |a|
                                                          (SPADCALL |logbase|
                                                                    (- |rho|)
                                                                    (QREFELT %
                                                                             44))
                                                          (QREFELT %
                                                                   58)))))))))
                                (LETT |t| (|inc_SI| |t|)) (GO G190) G191
                                (EXIT NIL))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |disclog|))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |FFIELDC-;squareFreePolynomial;SupF;13|
        ((|f| (|SparseUnivariatePolynomial| S))
         (% (|Factored| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |f| (QREFELT % 76))) 

(SDEFUN |FFIELDC-;factorPolynomial;SupF;14|
        ((|f| (|SparseUnivariatePolynomial| S))
         (% (|Factored| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |f| (QREFELT % 81))) 

(SDEFUN |FFIELDC-;factorSquareFreePolynomial;SupF;15|
        ((|f| (|SparseUnivariatePolynomial| S))
         (% (|Factored| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |f| (QREFELT % 83))) 

(SDEFUN |FFIELDC-;gcdPolynomial;3Sup;16|
        ((|f| (|SparseUnivariatePolynomial| S))
         (|g| (|SparseUnivariatePolynomial| S))
         (% (|SparseUnivariatePolynomial| S)))
        (SPADCALL |f| |g| (QREFELT % 86))) 

(DECLAIM (NOTINLINE |FiniteFieldCategory&;|)) 

(DEFUN |FiniteFieldCategory&| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FiniteFieldCategory&| DV$1))
          (LETT % (GETREFV 88))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|FiniteFieldCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|)
              |FFIELDC-;differentiate;2S;1| |FFIELDC-;init;S;2|
              (|PositiveInteger|) (4 . |lookup|) (9 . |index|) (|Boolean|)
              (14 . |zero?|) (|Union| % '#1="failed") |FFIELDC-;nextItem;SU;3|
              (19 . |order|) (|OnePointCompletion| 10) (24 . |coerce|)
              |FFIELDC-;order;SOpc;4| (|List| 26) (|Matrix| 6)
              (29 . |nullSpace|) (34 . |charthRoot|) (|Mapping| 6 6)
              (|Vector| 6) (39 . |map|) (|Union| (|Vector| %) '#2="failed")
              (|Matrix| %) |FFIELDC-;conditionP;MU;5| (|NonNegativeInteger|)
              (45 . |size|) (49 . |characteristic|) (53 . ^)
              |FFIELDC-;charthRoot;2S;6| |FFIELDC-;charthRoot;SU;7|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (59 . |representationType|) |FFIELDC-;createPrimitiveElement;S;8|
              (|Record| (|:| |factor| 43) (|:| |exponent| 31)) (|List| 40)
              (63 . |factorsOfCyclicGroupSize|) (|Integer|) (67 . ^)
              (73 . |One|) (77 . =) |FFIELDC-;primitive?;SB;9| (|Factored| 43)
              (83 . |Zero|) |FFIELDC-;order;SPi;10| (87 . |primitiveElement|)
              (|Table| 10 31) (91 . |tableForDiscreteLogarithm|) (96 . |#|)
              (101 . |One|) (|Union| 31 '"failed") (105 . |search|) (111 . *)
              |FFIELDC-;discreteLog;SNni;11| (|Void|) (|String|) (|OutputForm|)
              (117 . |messagePrint|) (|Factored| %) (122 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 66) (|:| |factor| 43) (|:| |exponent| 31))
              (|List| 67) (127 . |factorList|) (|DiscreteLogarithmPackage| 6)
              (132 . |shanksDiscLogAlgorithm|) |FFIELDC-;discreteLog;2SU;12|
              (|Factored| 74) (|SparseUnivariatePolynomial| 6)
              (|UnivariatePolynomialSquareFree| 6 74) (139 . |squareFree|)
              (|Factored| 78) (|SparseUnivariatePolynomial| %)
              |FFIELDC-;squareFreePolynomial;SupF;13|
              (|UnivariateFiniteFieldFactorize| 6 74) (144 . |factor|)
              |FFIELDC-;factorPolynomial;SupF;14| (149 . |factorSquareFree|)
              |FFIELDC-;factorSquareFreePolynomial;SupF;15|
              (|EuclideanDomain&| 74) (154 . |gcd|)
              |FFIELDC-;gcdPolynomial;3Sup;16|)
           '#(|squareFreePolynomial| 160 |primitive?| 165 |order| 170
              |nextItem| 180 |init| 185 |gcdPolynomial| 189
              |factorSquareFreePolynomial| 195 |factorPolynomial| 200
              |discreteLog| 205 |differentiate| 216 |createPrimitiveElement|
              221 |conditionP| 225 |charthRoot| 230)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|order| ((|PositiveInteger|) |#1|)) T)
                                   '((|discreteLog|
                                      ((|NonNegativeInteger|) |#1|))
                                     T)
                                   '((|primitive?| ((|Boolean|) |#1|)) T)
                                   '((|createPrimitiveElement| (|#1|)) T)
                                   '((|charthRoot| (|#1| |#1|)) T)
                                   '((|squareFreePolynomial|
                                      ((|Factored|
                                        (|SparseUnivariatePolynomial| |#1|))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|factorPolynomial|
                                      ((|Factored|
                                        (|SparseUnivariatePolynomial| |#1|))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|factorSquareFreePolynomial|
                                      ((|Factored|
                                        (|SparseUnivariatePolynomial| |#1|))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|conditionP|
                                      ((|Union| (|Vector| |#1|) #2#)
                                       (|Matrix| |#1|)))
                                     T)
                                   '((|differentiate| (|#1| |#1|)) T)
                                   '((|differentiate|
                                      (|#1| |#1| (|NonNegativeInteger|)))
                                     T)
                                   '((|init| (|#1|)) T)
                                   '((|nextItem| ((|Union| |#1| #1#) |#1|)) T)
                                   '((|discreteLog|
                                      ((|Union| (|NonNegativeInteger|)
                                                "failed")
                                       |#1| |#1|))
                                     T)
                                   '((|order|
                                      ((|OnePointCompletion|
                                        (|PositiveInteger|))
                                       |#1|))
                                     T)
                                   '((|charthRoot|
                                      ((|Union| |#1| "failed") |#1|))
                                     T)
                                   '((|gcdPolynomial|
                                      ((|SparseUnivariatePolynomial| |#1|)
                                       (|SparseUnivariatePolynomial| |#1|)
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 87
                                            '(0 6 0 7 1 6 10 0 11 1 6 0 10 12 1
                                              6 13 0 14 1 6 10 0 17 1 18 0 10
                                              19 1 22 21 0 23 1 6 0 0 24 2 26 0
                                              25 0 27 0 6 31 32 0 6 31 33 2 6 0
                                              0 31 34 0 6 37 38 0 6 41 42 2 6 0
                                              0 43 44 0 6 0 45 2 6 13 0 0 46 0
                                              48 0 49 0 6 0 51 1 6 52 43 53 1
                                              52 31 0 54 0 48 0 55 2 52 56 10 0
                                              57 2 6 0 0 0 58 1 62 60 61 63 1
                                              43 64 0 65 1 48 68 0 69 3 70 56 6
                                              6 31 71 1 75 73 74 76 1 80 73 74
                                              81 1 80 73 74 83 2 85 0 0 0 86 1
                                              0 77 78 79 1 0 13 0 47 1 0 18 0
                                              20 1 0 10 0 50 1 0 15 0 16 0 0 0
                                              9 2 0 78 78 78 87 1 0 77 78 84 1
                                              0 77 78 82 2 0 56 0 0 72 1 0 31 0
                                              59 1 0 0 0 8 0 0 0 39 1 0 28 29
                                              30 1 0 15 0 36 1 0 0 0 35)))))
           '|lookupComplete|)) 
