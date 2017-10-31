
(SDEFUN |POLYCATQ;univariate;FVF;1|
        ((|f| F) (|x| V) ($ |Fraction| (|SparseUnivariatePolynomial| F)))
        (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 11)) |x| $)
                  (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 12)) |x| $)
                  (QREFELT $ 15))) 

(SDEFUN |POLYCATQ;univ_root|
        ((|f| F) (|x| V) (|a| F) (|k| |Integer|)
         (|modulus| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((|nd| (F)) (|cofact| (|SparseUnivariatePolynomial| F))
          (|cf2| #1=(|SparseUnivariatePolynomial| F)) (#2=#:G710 NIL)
          (|ndu| (|Union| (|SparseUnivariatePolynomial| F) #3="failed"))
          (|nd1| (|SparseUnivariatePolynomial| F)) (|cf1| #1#) (|c0| (F))
          (|c1| (F)) (|c2| (F)) (|df| #4=(|SparseUnivariatePolynomial| F))
          (|nf| #4#))
         (SEQ
          (LETT |nf|
                (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 11)) |x| $)
                          |modulus| (QREFELT $ 20))
                . #5=(|POLYCATQ;univ_root|))
          (LETT |df|
                (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 12)) |x| $)
                          |modulus| (QREFELT $ 20))
                . #5#)
          (LETT |cofact|
                (COND ((EQL |k| 1) (|spadConstant| $ 23))
                      ((EQL |k| 2)
                       (SPADCALL |df| (QREFELT $ 19)
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 24)
                                            (QREFELT $ 25))
                                  1 (QREFELT $ 27))
                                 (QREFELT $ 28)))
                      ((EQL |k| 3)
                       (SEQ (LETT |c2| (SPADCALL |df| 2 (QREFELT $ 29)) . #5#)
                            (LETT |c1| (SPADCALL |df| 1 (QREFELT $ 29)) . #5#)
                            (LETT |c0| (SPADCALL |df| 0 (QREFELT $ 29)) . #5#)
                            (EXIT
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |c0| 2 (QREFELT $ 33))
                                          (SPADCALL
                                           (SPADCALL |c2| |c1| (QREFELT $ 34))
                                           |a| (QREFELT $ 34))
                                          (QREFELT $ 35))
                                (QREFELT $ 36))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |c2| 2 (QREFELT $ 33)) |a|
                                           (QREFELT $ 34))
                                 (SPADCALL |c0| |c1| (QREFELT $ 34))
                                 (QREFELT $ 35))
                                1 (QREFELT $ 27))
                               (QREFELT $ 37))
                              (SPADCALL
                               (SPADCALL (SPADCALL |c1| 2 (QREFELT $ 33))
                                         (SPADCALL |c0| |c2| (QREFELT $ 34))
                                         (QREFELT $ 35))
                               2 (QREFELT $ 27))
                              (QREFELT $ 37)))))
                      ((EQL |k| 4)
                       (SEQ
                        (LETT |cf1|
                              (SPADCALL |df| (QREFELT $ 19)
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 24)
                                                   (QREFELT $ 25))
                                         1 (QREFELT $ 27))
                                        (QREFELT $ 28))
                              . #5#)
                        (LETT |nd1| (SPADCALL |df| |cf1| (QREFELT $ 38)) . #5#)
                        (LETT |ndu| (SPADCALL |nd1| 2 (QREFELT $ 40)) . #5#)
                        (LETT |cf2|
                              (SPADCALL
                               (PROG2 (LETT #2# |ndu| . #5#)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 10))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 10))
                                                  #3#)
                                                 #2#))
                               (QREFELT $ 19)
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 24) (QREFELT $ 25))
                                2 (QREFELT $ 27))
                               (QREFELT $ 28))
                              . #5#)
                        (EXIT (SPADCALL |cf1| |cf2| (QREFELT $ 38))))))
                . #5#)
          (LETT |nd|
                (SPADCALL
                 (SPADCALL (SPADCALL |df| |cofact| (QREFELT $ 38)) |modulus|
                           (QREFELT $ 20))
                 (QREFELT $ 41))
                . #5#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |nf| |cofact| (QREFELT $ 38)) |modulus|
                      (QREFELT $ 20))
            |nd| (QREFELT $ 42)))))) 

(SDEFUN |POLYCATQ;univariate;FV2Sup;3|
        ((|f| F) (|x| V) (|modulus| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((|bc|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|m0| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |modulus| (QREFELT $ 43)) 4 (QREFELT $ 45))
            (COND
             ((SPADCALL
               (LETT |m0| (SPADCALL |modulus| (QREFELT $ 46))
                     . #1=(|POLYCATQ;univariate;FV2Sup;3|))
               (QREFELT $ 47))
              (EXIT
               (|POLYCATQ;univ_root| |f| |x|
                (SPADCALL
                 (SPADCALL (SPADCALL |m0| (QREFELT $ 48))
                           (SPADCALL |modulus| (QREFELT $ 49)) (QREFELT $ 50))
                 (QREFELT $ 25))
                (SPADCALL |modulus| (QREFELT $ 43)) |modulus| $))))))
          (LETT |bc|
                (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 12)) |x| $)
                          |modulus| (|spadConstant| $ 23) (QREFELT $ 53))
                . #1#)
          (EXIT
           (COND
            ((QEQCAR |bc| 1) (|error| "univariate: denominator is 0 mod p"))
            ('T
             (SPADCALL
              (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 11)) |x| $)
                        (QCAR (QCDR |bc|)) (QREFELT $ 38))
              |modulus| (QREFELT $ 20)))))))) 

(SDEFUN |POLYCATQ;multivariate;FVF;4|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F)) (|x| V) ($ F))
        (SPROG ((|v| (F)))
               (SEQ
                (LETT |v|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 55)) (QREFELT $ 56))
                      |POLYCATQ;multivariate;FVF;4|)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |f| (QREFELT $ 57)) |v| (QREFELT $ 58))
                  (SPADCALL (SPADCALL |f| (QREFELT $ 59)) |v| (QREFELT $ 58))
                  (QREFELT $ 50)))))) 

(SDEFUN |POLYCATQ;mymerge| ((|l| |List| V) (|m| |List| V) ($ |List| V))
        (COND ((NULL |l|) |m|) ((NULL |m|) |l|)
              ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 61))
               (CONS (|SPADfirst| |l|)
                     (|POLYCATQ;mymerge| (CDR |l|) (CDR |m|) $)))
              ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 62))
               (CONS (|SPADfirst| |l|) (|POLYCATQ;mymerge| (CDR |l|) |m| $)))
              ('T
               (CONS (|SPADfirst| |m|) (|POLYCATQ;mymerge| |l| (CDR |m|) $))))) 

(SDEFUN |POLYCATQ;variables;FL;6| ((|f| F) ($ |List| V))
        (|POLYCATQ;mymerge|
         (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 64))
         (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 64)) $)) 

(SDEFUN |POLYCATQ;isPower;FU;7|
        ((|f| F)
         ($ |Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPROG
         ((|r|
           (|Record| (|:| |var| V) (|:| |exponent| (|NonNegativeInteger|))))
          (|ur|
           (|Union|
            (|Record| (|:| |var| V) (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (|den| (P)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |den| (SPADCALL |f| (QREFELT $ 12))
                   . #1=(|POLYCATQ;isPower;FU;7|))
             (|spadConstant| $ 22) (QREFELT $ 66))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 11)) (|spadConstant| $ 22)
                        (QREFELT $ 66))
              (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |ur| (SPADCALL |den| (QREFELT $ 69)) . #1#)
                   (EXIT
                    (COND
                     ((QEQCAR |ur| 1)
                      (CONS 0 (CONS (SPADCALL |den| (QREFELT $ 56)) -1)))
                     (#2#
                      (SEQ (LETT |r| (QCDR |ur|) . #1#)
                           (EXIT
                            (CONS 0
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (QCAR |r|) (QREFELT $ 55))
                                    (QREFELT $ 56))
                                   (- (QCDR |r|)))))))))))))
           (#2#
            (SEQ
             (LETT |ur| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 69))
                   . #1#)
             (EXIT
              (COND ((QEQCAR |ur| 1) (CONS 1 "failed"))
                    (#2#
                     (SEQ (LETT |r| (QCDR |ur|) . #1#)
                          (EXIT
                           (CONS 0
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL (QCAR |r|) (QREFELT $ 55))
                                   (QREFELT $ 56))
                                  (QCDR |r|)))))))))))))) 

(SDEFUN |POLYCATQ;isExpt;FU;8|
        ((|f| F)
         ($ |Union| (|Record| (|:| |var| V) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPROG
         ((|r|
           (|Record| (|:| |var| V) (|:| |exponent| (|NonNegativeInteger|))))
          (|ur|
           (|Union|
            (|Record| (|:| |var| V) (|:| |exponent| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (LETT |ur| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 69))
                . #1=(|POLYCATQ;isExpt;FU;8|))
          (EXIT
           (COND
            ((QEQCAR |ur| 1)
             (COND
              ((SPADCALL (SPADCALL |f| (QREFELT $ 11)) (|spadConstant| $ 22)
                         (QREFELT $ 73))
               (SEQ
                (LETT |ur|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 69))
                      . #1#)
                (EXIT
                 (COND ((QEQCAR |ur| 1) (CONS 1 "failed"))
                       (#2='T
                        (SEQ (LETT |r| (QCDR |ur|) . #1#)
                             (EXIT
                              (CONS 0 (CONS (QCAR |r|) (- (QCDR |r|)))))))))))
              (#2# (CONS 1 "failed"))))
            (#2#
             (SEQ (LETT |r| (QCDR |ur|) . #1#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |f| (QREFELT $ 12))
                               (|spadConstant| $ 22) (QREFELT $ 73))
                     (CONS 0 (CONS (QCAR |r|) (QCDR |r|))))
                    (#2# (CONS 1 "failed"))))))))))) 

(SDEFUN |POLYCATQ;isTimes;FU;9| ((|f| F) ($ |Union| (|List| F) "failed"))
        (SPROG
         ((|d| (F)) (|den| (P)) (|l| (|Union| (|List| F) "failed"))
          (#1=#:G798 NIL) (|x| NIL) (#2=#:G797 NIL)
          (|t| (|Union| (|List| P) "failed")) (|num| (P)))
         (SEQ
          (LETT |t|
                (SPADCALL
                 (LETT |num| (SPADCALL |f| (QREFELT $ 11))
                       . #3=(|POLYCATQ;isTimes;FU;9|))
                 (QREFELT $ 78))
                . #3#)
          (LETT |l|
                (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                      (#4='T
                       (CONS 0
                             (PROGN
                              (LETT #2# NIL . #3#)
                              (SEQ (LETT |x| NIL . #3#)
                                   (LETT #1# (QCDR |t|) . #3#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |x| (CAR #1#) . #3#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS (SPADCALL |x| (QREFELT $ 56))
                                                 #2#)
                                           . #3#)))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))))
                . #3#)
          (LETT |den| (SPADCALL |f| (QREFELT $ 12)) . #3#)
          (EXIT
           (COND ((SPADCALL |den| (|spadConstant| $ 22) (QREFELT $ 73)) |l|)
                 ((SPADCALL |num| (|spadConstant| $ 22) (QREFELT $ 73))
                  (CONS 1 "failed"))
                 (#4#
                  (SEQ
                   (LETT |d|
                         (SPADCALL (SPADCALL |den| (QREFELT $ 56))
                                   (QREFELT $ 79))
                         . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |l| 1)
                      (CONS 0 (LIST (SPADCALL |num| (QREFELT $ 56)) |d|)))
                     (#4#
                      (CONS 0
                            (SPADCALL (QCDR |l|) |d| (QREFELT $ 81))))))))))))) 

(SDEFUN |POLYCATQ;isPlus;FU;10| ((|f| F) ($ |Union| (|List| F) "failed"))
        (SPROG
         ((#1=#:G810 NIL) (|x| NIL) (#2=#:G809 NIL)
          (|s| (|Union| (|List| P) "failed")))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |f| (QREFELT $ 12)) (|spadConstant| $ 22)
                      (QREFELT $ 66))
            (CONS 1 "failed"))
           (#3='T
            (SEQ
             (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 84))
                   . #4=(|POLYCATQ;isPlus;FU;10|))
             (EXIT
              (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                    (#3#
                     (CONS 0
                           (PROGN
                            (LETT #2# NIL . #4#)
                            (SEQ (LETT |x| NIL . #4#)
                                 (LETT #1# (QCDR |s|) . #4#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |x| (CAR #1#) . #4#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |x| (QREFELT $ 56))
                                               #2#)
                                         . #4#)))
                                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                 (EXIT (NREVERSE #2#)))))))))))))) 

(SDEFUN |POLYCATQ;mainVariable;FU;11| ((|f| F) ($ |Union| V "failed"))
        (SPROG ((|b| #1=(|Union| V "failed")) (|a| #1#))
               (SEQ
                (LETT |a|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 87))
                      . #2=(|POLYCATQ;mainVariable;FU;11|))
                (LETT |b|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 87))
                      . #2#)
                (EXIT
                 (COND ((QEQCAR |b| 1) |a|) ((QEQCAR |a| 1) |b|)
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |a|) (QCDR |b|)
                                        (QREFELT $ 88))))))))) 

(SDEFUN |POLYCATQ;P2UP| ((|p| P) (|x| V) ($ |SparseUnivariatePolynomial| F))
        (SPADCALL (ELT $ 56) (SPADCALL |p| |x| (QREFELT $ 91)) (QREFELT $ 95))) 

(DECLAIM (NOTINLINE |PolynomialCategoryQuotientFunctions;|)) 

(DEFUN |PolynomialCategoryQuotientFunctions| (&REST #1=#:G817)
  (SPROG NIL
         (PROG (#2=#:G818)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialCategoryQuotientFunctions|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialCategoryQuotientFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |PolynomialCategoryQuotientFunctions;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialCategoryQuotientFunctions|)))))))))) 

(DEFUN |PolynomialCategoryQuotientFunctions;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialCategoryQuotientFunctions|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$|
          (LIST '|PolynomialCategoryQuotientFunctions| DV$1 DV$2 DV$3 DV$4
                DV$5)
          . #1#)
    (LETT $ (GETREFV 96) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|PolynomialCategoryQuotientFunctions|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 19 (SPADCALL (QREFELT $ 18)))
    $))) 

(MAKEPROP '|PolynomialCategoryQuotientFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |numer|)
              (5 . |denom|) (|SparseUnivariatePolynomial| 10) (|Fraction| 13)
              (10 . /) |POLYCATQ;univariate;FVF;1| (|SingletonAsOrderedSet|)
              (16 . |create|) '|dummys| (20 . |rem|) (26 . |One|) (30 . |One|)
              (34 . |One|) (38 . |One|) (42 . -) (|NonNegativeInteger|)
              (47 . |monomial|) (53 . |eval|) (60 . |coefficient|)
              (66 . |Zero|) (70 . |Zero|) (|PositiveInteger|) (74 . ^) (80 . *)
              (86 . -) (92 . |coerce|) (97 . +) (103 . *) (|Union| $ '"failed")
              (109 . |divideExponents|) (115 . |retract|) (120 . /)
              (126 . |degree|) (|Boolean|) (131 . <=) (137 . |reductum|)
              (142 . |ground?|) (147 . |ground|) (152 . |leadingCoefficient|)
              (157 . /) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 51 '"failed") (163 . |extendedEuclidean|)
              |POLYCATQ;univariate;FV2Sup;3| (170 . |coerce|) (175 . |coerce|)
              (180 . |numer|) (185 . |elt|) (191 . |denom|)
              |POLYCATQ;multivariate;FVF;4| (196 . =) (202 . >) (|List| 7)
              (208 . |variables|) |POLYCATQ;variables;FL;6| (213 . ~=)
              (|Record| (|:| |var| 7) (|:| |exponent| 26))
              (|Union| 67 '#1="failed") (219 . |isExpt|)
              (|Record| (|:| |val| 10) (|:| |exponent| (|Integer|)))
              (|Union| 70 '"failed") |POLYCATQ;isPower;FU;7| (224 . =)
              (|Record| (|:| |var| 7) (|:| |exponent| (|Integer|)))
              (|Union| 74 '"failed") |POLYCATQ;isExpt;FU;8|
              (|Union| (|List| $) '#1#) (230 . |isTimes|) (235 . |inv|)
              (|List| 10) (240 . |concat!|) (|Union| 80 '"failed")
              |POLYCATQ;isTimes;FU;9| (246 . |isPlus|) |POLYCATQ;isPlus;FU;10|
              (|Union| 7 '"failed") (251 . |mainVariable|) (256 . |max|)
              |POLYCATQ;mainVariable;FU;11| (|SparseUnivariatePolynomial| $)
              (262 . |univariate|) (|Mapping| 10 9)
              (|SparseUnivariatePolynomial| 9)
              (|SparseUnivariatePolynomialFunctions2| 9 10) (268 . |map|))
           '#(|variables| 274 |univariate| 279 |multivariate| 292
              |mainVariable| 298 |isTimes| 303 |isPower| 308 |isPlus| 313
              |isExpt| 318)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 95
                                                 '(1 10 9 0 11 1 10 9 0 12 2 14
                                                   0 13 13 15 0 17 0 18 2 13 0
                                                   0 0 20 0 8 0 21 0 9 0 22 0
                                                   13 0 23 0 10 0 24 1 10 0 0
                                                   25 2 13 0 10 26 27 3 13 0 0
                                                   17 0 28 2 13 10 0 26 29 0 6
                                                   0 30 0 8 0 31 2 10 0 0 32 33
                                                   2 10 0 0 0 34 2 10 0 0 0 35
                                                   1 13 0 10 36 2 13 0 0 0 37 2
                                                   13 0 0 0 38 2 13 39 0 26 40
                                                   1 13 10 0 41 2 13 0 0 10 42
                                                   1 13 26 0 43 2 26 44 0 0 45
                                                   1 13 0 0 46 1 13 44 0 47 1
                                                   13 10 0 48 1 13 10 0 49 2 10
                                                   0 0 0 50 3 13 52 0 0 0 53 1
                                                   9 0 7 55 1 10 0 9 56 1 14 13
                                                   0 57 2 13 10 0 10 58 1 14 13
                                                   0 59 2 7 44 0 0 61 2 7 44 0
                                                   0 62 1 9 63 0 64 2 9 44 0 0
                                                   66 1 9 68 0 69 2 9 44 0 0 73
                                                   1 9 77 0 78 1 10 0 0 79 2 80
                                                   0 0 10 81 1 9 77 0 84 1 9 86
                                                   0 87 2 7 0 0 0 88 2 9 90 0 7
                                                   91 2 94 13 92 93 95 1 0 63
                                                   10 65 2 0 14 10 7 16 3 0 13
                                                   10 7 13 54 2 0 10 14 7 60 1
                                                   0 86 10 89 1 0 82 10 83 1 0
                                                   71 10 72 1 0 82 10 85 1 0 75
                                                   10 76)))))
           '|lookupComplete|)) 
