
(SDEFUN |FFIELDC-;differentiate;2S;1| ((|x| S) ($ S)) (|spadConstant| $ 7)) 

(SDEFUN |FFIELDC-;init;S;2| (($ S)) (|spadConstant| $ 7)) 

(SDEFUN |FFIELDC-;nextItem;SU;3| ((|a| S) ($ |Union| S "failed"))
        (COND
         ((SPADCALL
           (LETT |a|
                 (SPADCALL (+ (SPADCALL |a| (QREFELT $ 11)) 1) (QREFELT $ 12))
                 |FFIELDC-;nextItem;SU;3|)
           (QREFELT $ 14))
          (CONS 1 "failed"))
         ('T (CONS 0 |a|)))) 

(SDEFUN |FFIELDC-;order;SOpc;4|
        ((|e| S) ($ |OnePointCompletion| (|PositiveInteger|)))
        (SPADCALL (SPADCALL |e| (QREFELT $ 17)) (QREFELT $ 20))) 

(SDEFUN |FFIELDC-;conditionP;MU;5|
        ((|mat| |Matrix| S) ($ |Union| (|Vector| S) "failed"))
        (SPROG ((|l| (|List| (|Vector| S))))
               (SEQ
                (LETT |l| (SPADCALL |mat| (QREFELT $ 24))
                      |FFIELDC-;conditionP;MU;5|)
                (EXIT
                 (COND ((NULL |l|) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (ELT $ 25) (|SPADfirst| |l|)
                                        (QREFELT $ 28))))))))) 

(SDEFUN |FFIELDC-;charthRoot;2S;6| ((|x| S) ($ S))
        (SPADCALL |x|
                  (QUOTIENT2 (SPADCALL (QREFELT $ 33))
                             (SPADCALL (QREFELT $ 34)))
                  (QREFELT $ 35))) 

(SDEFUN |FFIELDC-;charthRoot;SU;7| ((|x| S) ($ |Union| S "failed"))
        (CONS 0 (SPADCALL |x| (QREFELT $ 25)))) 

(SDEFUN |FFIELDC-;createPrimitiveElement;S;8| (($ S))
        (SPROG
         ((|found| (|Boolean|)) (|e| (S)) (#1=#:G761 NIL) (|i| NIL)
          (|start| (|Integer|)) (|sm1| (|PositiveInteger|)))
         (SEQ
          (LETT |sm1| (- (SPADCALL (QREFELT $ 33)) 1)
                . #2=(|FFIELDC-;createPrimitiveElement;S;8|))
          (LETT |start|
                (COND
                 ((SPADCALL (SPADCALL (QREFELT $ 39)) (CONS 1 "polynomial")
                            (QREFELT $ 40))
                  (SPADCALL (QREFELT $ 34)))
                 ('T 1))
                . #2#)
          (LETT |found| NIL . #2#)
          (SEQ (LETT |i| |start| . #2#) G190
               (COND ((NULL (NULL |found|)) (GO G191)))
               (SEQ
                (LETT |e|
                      (SPADCALL
                       (PROG1 (LETT #1# |i| . #2#)
                         (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                           '(|Integer|) #1#))
                       (QREFELT $ 12))
                      . #2#)
                (EXIT
                 (LETT |found| (EQL (SPADCALL |e| (QREFELT $ 17)) |sm1|)
                       . #2#)))
               (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |e|)))) 

(SDEFUN |FFIELDC-;primitive?;SB;9| ((|a| S) ($ |Boolean|))
        (SPROG
         ((|equalone| (|Boolean|)) (#1=#:G771 NIL) (|exp| NIL)
          (|q| (|Integer|))
          (|explist|
           (|List|
            (|Record| (|:| |factor| (|Integer|))
                      (|:| |exponent| (|Integer|))))))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 14)) NIL)
                ('T
                 (SEQ
                  (LETT |explist| (SPADCALL (QREFELT $ 44))
                        . #2=(|FFIELDC-;primitive?;SB;9|))
                  (LETT |q| (- (SPADCALL (QREFELT $ 33)) 1) . #2#)
                  (LETT |equalone| NIL . #2#)
                  (SEQ (LETT |exp| NIL . #2#) (LETT #1# |explist| . #2#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |exp| (CAR #1#) . #2#) NIL)
                             (NULL (NULL |equalone|)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |equalone|
                               (SPADCALL
                                (SPADCALL |a| (QUOTIENT2 |q| (QCAR |exp|))
                                          (QREFELT $ 45))
                                (|spadConstant| $ 46) (QREFELT $ 47))
                               . #2#)))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT (NULL |equalone|)))))))) 

(SDEFUN |FFIELDC-;order;SPi;10| ((|e| S) ($ |PositiveInteger|))
        (SPROG
         ((|ord| (|Integer|)) (|goon| (|Boolean|)) (|a| (|Integer|))
          (#1=#:G780 NIL) (|j| NIL) (|primeDivisor| #2=(|Integer|))
          (#3=#:G779 NIL) (|rec| NIL)
          (|lof|
           (|List|
            (|Record| (|:| |factor| #2#) (|:| |exponent| (|Integer|))))))
         (SEQ
          (COND
           ((SPADCALL |e| (|spadConstant| $ 7) (QREFELT $ 47))
            (|error| "order(0) is not defined "))
           ('T
            (SEQ
             (LETT |ord| (- (SPADCALL (QREFELT $ 33)) 1)
                   . #4=(|FFIELDC-;order;SPi;10|))
             (LETT |a| 0 . #4#) (LETT |lof| (SPADCALL (QREFELT $ 44)) . #4#)
             (SEQ (LETT |rec| NIL . #4#) (LETT #3# |lof| . #4#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |rec| (CAR #3#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (LETT |a|
                         (QUOTIENT2 |ord|
                                    (LETT |primeDivisor| (QCAR |rec|) . #4#))
                         . #4#)
                   (LETT |goon|
                         (SPADCALL (SPADCALL |e| |a| (QREFELT $ 45))
                                   (|spadConstant| $ 46) (QREFELT $ 47))
                         . #4#)
                   (SEQ (LETT |j| 0 . #4#) (LETT #1# (- (QCDR |rec|) 2) . #4#)
                        G190
                        (COND
                         ((OR (|greater_SI| |j| #1#) (NULL |goon|)) (GO G191)))
                        (SEQ (LETT |ord| |a| . #4#)
                             (LETT |a| (QUOTIENT2 |ord| |primeDivisor|) . #4#)
                             (EXIT
                              (LETT |goon|
                                    (SPADCALL (SPADCALL |e| |a| (QREFELT $ 45))
                                              (|spadConstant| $ 46)
                                              (QREFELT $ 47))
                                    . #4#)))
                        (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT (COND (|goon| (LETT |ord| |a| . #4#)))))
                  (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
             (EXIT |ord|))))))) 

(SDEFUN |FFIELDC-;discreteLog;SNni;11| ((|b| S) ($ |NonNegativeInteger|))
        (SPROG
         ((|a| (S)) (|disclog| (|Integer|)) (|mult| (|Integer|)) (|c| (S))
          (|disc1| (|Integer|)) (|found| (|Boolean|))
          (|rho| (|Union| (|NonNegativeInteger|) "failed")) (#1=#:G799 NIL)
          (|i| NIL) (|end| (|Integer|)) (|n| (|NonNegativeInteger|))
          (|exptable| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|exp| #2=(|Integer|)) (#3=#:G798 NIL) (|t| NIL)
          (|fac| #4=(|Integer|)) (#5=#:G797 NIL) (|f| NIL) (|groupord| #2#)
          (|gen| (S))
          (|faclist|
           (|List|
            (|Record| (|:| |factor| #4#) (|:| |exponent| (|Integer|))))))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT $ 14))
            (|error| "discreteLog: logarithm of zero"))
           (#6='T
            (SEQ
             (LETT |faclist| (SPADCALL (QREFELT $ 44))
                   . #7=(|FFIELDC-;discreteLog;SNni;11|))
             (LETT |a| |b| . #7#) (LETT |gen| (SPADCALL (QREFELT $ 52)) . #7#)
             (EXIT
              (COND ((SPADCALL |b| |gen| (QREFELT $ 47)) 1)
                    (#6#
                     (SEQ (LETT |disclog| 0 . #7#) (LETT |mult| 1 . #7#)
                          (LETT |groupord| (- (SPADCALL (QREFELT $ 33)) 1)
                                . #7#)
                          (LETT |exp| |groupord| . #7#)
                          (SEQ (LETT |f| NIL . #7#) (LETT #5# |faclist| . #7#)
                               G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |f| (CAR #5#) . #7#) NIL))
                                 (GO G191)))
                               (SEQ (LETT |fac| (QCAR |f|) . #7#)
                                    (EXIT
                                     (SEQ (LETT |t| 0 . #7#)
                                          (LETT #3# (- (QCDR |f|) 1) . #7#)
                                          G190
                                          (COND
                                           ((|greater_SI| |t| #3#) (GO G191)))
                                          (SEQ
                                           (LETT |exp| (QUOTIENT2 |exp| |fac|)
                                                 . #7#)
                                           (LETT |exptable|
                                                 (SPADCALL |fac|
                                                           (QREFELT $ 54))
                                                 . #7#)
                                           (LETT |n|
                                                 (SPADCALL |exptable|
                                                           (QREFELT $ 55))
                                                 . #7#)
                                           (LETT |c|
                                                 (SPADCALL |a| |exp|
                                                           (QREFELT $ 45))
                                                 . #7#)
                                           (LETT |end|
                                                 (QUOTIENT2 (- |fac| 1) |n|)
                                                 . #7#)
                                           (LETT |found| NIL . #7#)
                                           (LETT |disc1| 0 . #7#)
                                           (SEQ (LETT |i| 0 . #7#)
                                                (LETT #1# |end| . #7#) G190
                                                (COND
                                                 ((OR (|greater_SI| |i| #1#)
                                                      (NULL (NULL |found|)))
                                                  (GO G191)))
                                                (SEQ
                                                 (LETT |rho|
                                                       (SPADCALL
                                                        (SPADCALL |c|
                                                                  (QREFELT $
                                                                           11))
                                                        |exptable|
                                                        (QREFELT $ 58))
                                                       . #7#)
                                                 (EXIT
                                                  (COND
                                                   ((QEQCAR |rho| 0)
                                                    (SEQ
                                                     (LETT |found| 'T . #7#)
                                                     (EXIT
                                                      (LETT |disc1|
                                                            (*
                                                             (+ (* |n| |i|)
                                                                (QCDR |rho|))
                                                             |mult|)
                                                            . #7#))))
                                                   ('T
                                                    (LETT |c|
                                                          (SPADCALL |c|
                                                                    (SPADCALL
                                                                     |gen|
                                                                     (*
                                                                      (QUOTIENT2
                                                                       |groupord|
                                                                       |fac|)
                                                                      (- |n|))
                                                                     (QREFELT $
                                                                              45))
                                                                    (QREFELT $
                                                                             59))
                                                          . #7#)))))
                                                (LETT |i| (|inc_SI| |i|) . #7#)
                                                (GO G190) G191 (EXIT NIL))
                                           (EXIT
                                            (COND
                                             (|found|
                                              (SEQ
                                               (LETT |mult| (* |mult| |fac|)
                                                     . #7#)
                                               (LETT |disclog|
                                                     (+ |disclog| |disc1|)
                                                     . #7#)
                                               (EXIT
                                                (LETT |a|
                                                      (SPADCALL |a|
                                                                (SPADCALL |gen|
                                                                          (-
                                                                           |disc1|)
                                                                          (QREFELT
                                                                           $
                                                                           45))
                                                                (QREFELT $ 59))
                                                      . #7#))))
                                             ('T
                                              (|error|
                                               "discreteLog: ?? discrete logarithm")))))
                                          (LETT |t| (|inc_SI| |t|) . #7#)
                                          (GO G190) G191 (EXIT NIL))))
                               (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT |disclog|))))))))))) 

(SDEFUN |FFIELDC-;discreteLog;2SU;12|
        ((|logbase| S) (|b| S) ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG
         ((|a| (S)) (|mult| (|Integer|)) (|disclog| (|Integer|))
          (|rho| (|Integer|)) (#1=#:G820 NIL)
          (|rhoHelp| (|Union| (|NonNegativeInteger|) "failed"))
          (|exp| (|Integer|)) (#2=#:G822 NIL) (|t| NIL) (|primroot| (S))
          (|fac| #3=(|Integer|)) (#4=#:G821 NIL) (|f| NIL)
          (|faclist|
           (|List| (|Record| (|:| |factor| #3#) (|:| |exponent| (|Integer|)))))
          (|groupord| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |b| (QREFELT $ 14))
             (SEQ (SPADCALL "discreteLog: logarithm of zero" (QREFELT $ 64))
                  (EXIT (CONS 1 "failed"))))
            ((SPADCALL |logbase| (QREFELT $ 14))
             (SEQ
              (SPADCALL "discreteLog: logarithm to base zero" (QREFELT $ 64))
              (EXIT (CONS 1 "failed"))))
            ((SPADCALL |b| |logbase| (QREFELT $ 47)) (CONS 0 1))
            ('T
             (COND
              ((NULL
                (ZEROP
                 (REM
                  (LETT |groupord| (SPADCALL |logbase| (QREFELT $ 17))
                        . #5=(|FFIELDC-;discreteLog;2SU;12|))
                  (SPADCALL |b| (QREFELT $ 17)))))
               (SEQ
                (SPADCALL
                 "discreteLog: second argument not in cyclic group generated by first argument"
                 (QREFELT $ 64))
                (EXIT (CONS 1 "failed"))))
              ('T
               (SEQ
                (LETT |faclist|
                      (SPADCALL (SPADCALL |groupord| (QREFELT $ 66))
                                (QREFELT $ 67))
                      . #5#)
                (LETT |a| |b| . #5#) (LETT |disclog| 0 . #5#)
                (LETT |mult| 1 . #5#) (LETT |exp| |groupord| . #5#)
                (SEQ (LETT |f| NIL . #5#) (LETT #4# |faclist| . #5#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ (LETT |fac| (QCAR |f|) . #5#)
                          (LETT |primroot|
                                (SPADCALL |logbase|
                                          (QUOTIENT2 |groupord| |fac|)
                                          (QREFELT $ 45))
                                . #5#)
                          (EXIT
                           (SEQ (LETT |t| 0 . #5#)
                                (LETT #2# (- (QCDR |f|) 1) . #5#) G190
                                (COND ((|greater_SI| |t| #2#) (GO G191)))
                                (SEQ (LETT |exp| (QUOTIENT2 |exp| |fac|) . #5#)
                                     (LETT |rhoHelp|
                                           (SPADCALL |primroot|
                                                     (SPADCALL |a| |exp|
                                                               (QREFELT $ 45))
                                                     |fac| (QREFELT $ 69))
                                           . #5#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR |rhoHelp| 1)
                                        (PROGN
                                         (LETT #1# (CONS 1 "failed") . #5#)
                                         (GO #6=#:G819)))
                                       ('T
                                        (SEQ
                                         (LETT |rho|
                                               (SPADCALL (QCDR |rhoHelp|)
                                                         |mult| (QREFELT $ 70))
                                               . #5#)
                                         (LETT |disclog| (+ |disclog| |rho|)
                                               . #5#)
                                         (LETT |mult| (* |mult| |fac|) . #5#)
                                         (EXIT
                                          (LETT |a|
                                                (SPADCALL |a|
                                                          (SPADCALL |logbase|
                                                                    (- |rho|)
                                                                    (QREFELT $
                                                                             45))
                                                          (QREFELT $ 59))
                                                . #5#)))))))
                                (LETT |t| (|inc_SI| |t|) . #5#) (GO G190) G191
                                (EXIT NIL))))
                     (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |disclog|))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |FFIELDC-;squareFreePolynomial|
        ((|f| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |f| (QREFELT $ 75))) 

(SDEFUN |FFIELDC-;factorPolynomial|
        ((|f| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |f| (QREFELT $ 77))) 

(SDEFUN |FFIELDC-;factorSquareFreePolynomial|
        ((|f| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G845 NIL)
          (#2=#:G844 #3=(|Factored| (|SparseUnivariatePolynomial| S)))
          (#4=#:G846 #3#) (#5=#:G849 NIL) (|u| NIL)
          (|flist|
           (|Record| (|:| |cont| S)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr| (|SparseUnivariatePolynomial| S))
                            (|:| |pow| (|Integer|))))))))
         (SEQ
          (COND
           ((SPADCALL |f| (|spadConstant| $ 78) (QREFELT $ 79))
            (|spadConstant| $ 80))
           (#6='T
            (SEQ
             (LETT |flist| (SPADCALL |f| 'T (QREFELT $ 83))
                   . #7=(|FFIELDC-;factorSquareFreePolynomial|))
             (EXIT
              (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 84))
                        (PROGN
                         (LETT #1# NIL . #7#)
                         (SEQ (LETT |u| NIL . #7#)
                              (LETT #5# (QCDR |flist|) . #7#) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |u| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4#
                                       (SPADCALL (QCAR |u|) (QCDR |u|)
                                                 (QREFELT $ 85))
                                       . #7#)
                                 (COND
                                  (#1#
                                   (LETT #2# (SPADCALL #2# #4# (QREFELT $ 86))
                                         . #7#))
                                  ('T
                                   (PROGN
                                    (LETT #2# #4# . #7#)
                                    (LETT #1# 'T . #7#)))))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#1# #2#) (#6# (|spadConstant| $ 87))))
                        (QREFELT $ 88))))))))) 

(SDEFUN |FFIELDC-;gcdPolynomial;3Sup;16|
        ((|f| |SparseUnivariatePolynomial| S)
         (|g| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| S))
        (SPADCALL |f| |g| (QREFELT $ 90))) 

(DECLAIM (NOTINLINE |FiniteFieldCategory&;|)) 

(DEFUN |FiniteFieldCategory&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteFieldCategory&|))
          (LETT |dv$| (LIST '|FiniteFieldCategory&| DV$1) . #1#)
          (LETT $ (GETREFV 93) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FiniteFieldCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|)
              |FFIELDC-;differentiate;2S;1| |FFIELDC-;init;S;2|
              (|PositiveInteger|) (4 . |lookup|) (9 . |index|) (|Boolean|)
              (14 . |zero?|) (|Union| $ '"failed") |FFIELDC-;nextItem;SU;3|
              (19 . |order|) (|Integer|) (|OnePointCompletion| 10)
              (24 . |coerce|) |FFIELDC-;order;SOpc;4| (|List| 27) (|Matrix| 6)
              (29 . |nullSpace|) (34 . |charthRoot|) (|Mapping| 6 6)
              (|Vector| 6) (39 . |map|) (|Union| (|Vector| $) '"failed")
              (|Matrix| $) |FFIELDC-;conditionP;MU;5| (|NonNegativeInteger|)
              (45 . |size|) (49 . |characteristic|) (53 . ^)
              |FFIELDC-;charthRoot;2S;6| |FFIELDC-;charthRoot;SU;7|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (59 . |representationType|) (63 . =)
              |FFIELDC-;createPrimitiveElement;S;8|
              (|Record| (|:| |factor| 18) (|:| |exponent| 18)) (|List| 42)
              (69 . |factorsOfCyclicGroupSize|) (73 . ^) (79 . |One|) (83 . =)
              |FFIELDC-;primitive?;SB;9| (|Factored| 18) (89 . |Zero|)
              |FFIELDC-;order;SPi;10| (93 . |primitiveElement|) (|Table| 10 32)
              (97 . |tableForDiscreteLogarithm|) (102 . |#|) (107 . |One|)
              (|Union| 32 '"failed") (111 . |search|) (117 . *)
              |FFIELDC-;discreteLog;SNni;11| (|Void|) (|String|) (|OutputForm|)
              (123 . |messagePrint|) (|Factored| $) (128 . |factor|)
              (133 . |factors|) (|DiscreteLogarithmPackage| 6)
              (138 . |shanksDiscLogAlgorithm|) (145 . *)
              |FFIELDC-;discreteLog;2SU;12| (|Factored| 73)
              (|SparseUnivariatePolynomial| 6)
              (|UnivariatePolynomialSquareFree| 6 73) (151 . |squareFree|)
              (|DistinctDegreeFactorize| 6 73) (156 . |factor|) (161 . |Zero|)
              (165 . =) (171 . |Zero|) (|Record| (|:| |irr| 73) (|:| |pow| 18))
              (|Record| (|:| |cont| 6) (|:| |factors| (|List| 81)))
              (175 . |distdfact|) (181 . |coerce|) (186 . |primeFactor|)
              (192 . *) (198 . |One|) (202 . *) (|EuclideanDomain&| 73)
              (208 . |gcd|) (|SparseUnivariatePolynomial| $)
              |FFIELDC-;gcdPolynomial;3Sup;16|)
           '#(|primitive?| 214 |order| 219 |nextItem| 229 |init| 234
              |gcdPolynomial| 238 |discreteLog| 244 |differentiate| 255
              |createPrimitiveElement| 260 |conditionP| 264 |charthRoot| 269)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 92
                                                 '(0 6 0 7 1 6 10 0 11 1 6 0 10
                                                   12 1 6 13 0 14 1 6 10 0 17 1
                                                   19 0 18 20 1 23 22 0 24 1 6
                                                   0 0 25 2 27 0 26 0 28 0 6 32
                                                   33 0 6 32 34 2 6 0 0 32 35 0
                                                   6 38 39 2 38 13 0 0 40 0 6
                                                   43 44 2 6 0 0 18 45 0 6 0 46
                                                   2 6 13 0 0 47 0 49 0 50 0 6
                                                   0 52 1 6 53 18 54 1 53 32 0
                                                   55 0 49 0 56 2 53 57 10 0 58
                                                   2 6 0 0 0 59 1 63 61 62 64 1
                                                   18 65 0 66 1 49 43 0 67 3 68
                                                   57 6 6 32 69 2 18 0 32 0 70
                                                   1 74 72 73 75 1 76 72 73 77
                                                   0 73 0 78 2 73 13 0 0 79 0
                                                   72 0 80 2 76 82 73 13 83 1
                                                   73 0 6 84 2 72 0 73 18 85 2
                                                   72 0 0 0 86 0 72 0 87 2 72 0
                                                   73 0 88 2 89 0 0 0 90 1 0 13
                                                   0 48 1 0 10 0 51 1 0 19 0 21
                                                   1 0 15 0 16 0 0 0 9 2 0 91
                                                   91 91 92 1 0 32 0 60 2 0 57
                                                   0 0 71 1 0 0 0 8 0 0 0 41 1
                                                   0 29 30 31 1 0 0 0 36 1 0 15
                                                   0 37)))))
           '|lookupComplete|)) 
