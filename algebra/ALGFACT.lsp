
(SDEFUN |ALGFACT;ker_lst|
        ((|la| (|List| (|AlgebraicNumber|)))
         (% (|List| (|Kernel| (|Expression| (|Integer|))))))
        (SPROG ((#1=#:G12 NIL) (|c| NIL) (#2=#:G11 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |c| NIL) (LETT #1# |la|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |c| (QREFELT % 9)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT % 12))))) 

(SDEFUN |ALGFACT;liftpoly|
        ((|p| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (% (UP)))
        (SPADCALL (ELT % 14) |p| (QREFELT % 18))) 

(SDEFUN |ALGFACT;downpoly|
        ((|p| (UP))
         (% (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPADCALL (ELT % 19) |p| (QREFELT % 22))) 

(SDEFUN |ALGFACT;ifactor|
        ((|p| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
         (|l| (|List| (|Kernel| (|Expression| (|Integer|)))))
         (% (|Factored| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))))
        (|ALGFACT;fact| |p| |l| %)) 

(SDEFUN |ALGFACT;factor;UPF;5| ((|p| (UP)) (% (|Factored| UP)))
        (|ALGFACT;fact| |p| (|ALGFACT;ker_lst| (SPADCALL |p| (QREFELT % 24)) %)
         %)) 

(SDEFUN |ALGFACT;factor;UPLF;6|
        ((|p| (UP)) (|l| (|List| (|AlgebraicNumber|))) (% (|Factored| UP)))
        (|ALGFACT;fact| |p|
         (|ALGFACT;ker_lst|
          (SPADCALL (SPADCALL |l| (SPADCALL |p| (QREFELT % 24)) (QREFELT % 27))
                    (QREFELT % 28))
          %)
         %)) 

(SDEFUN |ALGFACT;split;UPF;7| ((|p| (UP)) (% (|Factored| UP)))
        (SPROG
         ((#1=#:G20 NIL) (#2=#:G19 #3=(|Factored| UP)) (#4=#:G21 #3#)
          (#5=#:G24 NIL) (|fc| NIL) (|fp| (|Factored| UP)))
         (SEQ (LETT |fp| (SPADCALL |p| (QREFELT % 26)))
              (EXIT
               (SPADCALL (SPADCALL |fp| (QREFELT % 30))
                         (PROGN
                          (LETT #1# NIL)
                          (SEQ (LETT |fc| NIL)
                               (LETT #5# (SPADCALL |fp| (QREFELT % 34))) G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |fc| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #4#
                                        (|ALGFACT;extend| (QVELT |fc| 1)
                                         (QVELT |fc| 2) %))
                                  (COND
                                   (#1#
                                    (LETT #2#
                                          (SPADCALL #2# #4# (QREFELT % 35))))
                                   ('T
                                    (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                          (COND (#1# #2#) ('T (|spadConstant| % 36))))
                         (QREFELT % 37)))))) 

(SDEFUN |ALGFACT;extend|
        ((|p| (UP)) (|n| (|NonNegativeInteger|)) (% (|Factored| UP)))
        (SPROG ((#1=#:G26 NIL) (|q| (UP)))
               (SEQ
                (COND
                 ((EQL (SPADCALL |p| (QREFELT % 40)) 1)
                  (SPADCALL |p| |n| (QREFELT % 41)))
                 ('T
                  (SEQ
                   (LETT |q|
                         (SPADCALL
                          (SPADCALL (|spadConstant| % 43) 1 (QREFELT % 44))
                          (SPADCALL (SPADCALL |p| (QREFELT % 46))
                                    (QREFELT % 47))
                          (QREFELT % 48)))
                   (EXIT
                    (SPADCALL (SPADCALL |q| |n| (QREFELT % 41))
                              (SPADCALL
                               (SPADCALL
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL |p| |q| (QREFELT % 50)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                                  (|Union| (QREFELT % 6)
                                                           "failed")
                                                  #1#))
                                (QREFELT % 38))
                               |n| (QREFELT % 51))
                              (QREFELT % 35))))))))) 

(SDEFUN |ALGFACT;doublyTransitive?;UPB;9| ((|p| (UP)) (% (|Boolean|)))
        (SPROG ((#1=#:G32 NIL))
               (COND
                ((|ALGFACT;irred?| |p| %)
                 (|ALGFACT;irred?|
                  (PROG2
                      (LETT #1#
                            (SPADCALL |p|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 43) 1
                                                 (QREFELT % 44))
                                       (SPADCALL (SPADCALL |p| (QREFELT % 46))
                                                 (QREFELT % 47))
                                       (QREFELT % 48))
                                      (QREFELT % 50)))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                    (|Union| (QREFELT % 6) "failed") #1#))
                  %))
                ('T NIL)))) 

(SDEFUN |ALGFACT;irred?| ((|p| (UP)) (% (|Boolean|)))
        (SPROG
         ((|fp|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |fp| (SPADCALL (SPADCALL |p| (QREFELT % 26)) (QREFELT % 34)))
          (EXIT
           (COND
            ((SPADCALL |fp| 1 (QREFELT % 54))
             (EQL (QVELT (|SPADfirst| |fp|) 2) 1))
            ('T NIL)))))) 

(SDEFUN |ALGFACT;SUPEI_to_SUP|
        ((|pe| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (% (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
        (SPADCALL (ELT % 55) |pe| (QREFELT % 60))) 

(SDEFUN |ALGFACT;red_AN|
        ((|x| (|AlgebraicNumber|))
         (|alpha| (|Kernel| (|Expression| (|Integer|))))
         (|q| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (% (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
        (|ALGFACT;SUPEI_to_SUP|
         (SPADCALL (SPADCALL |x| (QREFELT % 9)) |alpha| |q| (QREFELT % 63)) %)) 

(SDEFUN |ALGFACT;fact|
        ((|p| (UP)) (|l| (|List| #1=(|Kernel| (|Expression| (|Integer|)))))
         (% (|Factored| UP)))
        (SPROG
         ((#2=#:G60 NIL) (#3=#:G59 #4=(|Factored| UP)) (#5=#:G61 #4#)
          (#6=#:G69 NIL) (|fc| NIL) (|newalpha| (|AlgebraicNumber|))
          (|fr| (|Factored| |ups|))
          (|ups|
           (|Join| (|UnivariatePolynomialCategory| |sae|)
                   (CATEGORY |domain|
                    (SIGNATURE |outputForm| ((|OutputForm|) % (|OutputForm|)))
                    (IF (|has| |sae| (|Canonical|))
                        (ATTRIBUTE (|Canonical|))
                        |noBranch|))))
          (|sae|
           (|Join|
            (|MonogenicAlgebra| #7=(|AlgebraicNumber|)
                                #8=(|SparseUnivariatePolynomial|
                                    (|AlgebraicNumber|)))
            (CATEGORY |package|
             (IF (|has| #7# (|Field|))
                 (IF (|has| #7# (|PolynomialFactorizationExplicit|))
                     (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                     |noBranch|)
                 |noBranch|)
             (IF (|has| #8# (|Hashable|))
                 (ATTRIBUTE (|Hashable|))
                 |noBranch|))))
          (|newl| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|q| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|qe| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|alpha| #1#) (#9=#:G48 NIL) (#10=#:G47 #1#) (#11=#:G49 #1#)
          (#12=#:G68 NIL) (#13=#:G0 NIL) (#14=#:G44 NIL) (#15=#:G43 #4#)
          (#16=#:G45 #4#) (#17=#:G67 NIL) (|dc| NIL)
          (|dr|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (SEQ
          (COND
           ((EQL (SPADCALL |p| (QREFELT % 40)) 1)
            (SPADCALL |p| 1 (QREFELT % 41)))
           ((NULL |l|)
            (SEQ
             (LETT |dr| (SPADCALL (|ALGFACT;downpoly| |p| %) (QREFELT % 66)))
             (EXIT
              (SPADCALL (|ALGFACT;liftpoly| (SPADCALL |dr| (QREFELT % 67)) %)
                        (PROGN
                         (LETT #14# NIL)
                         (SEQ (LETT |dc| NIL)
                              (LETT #17# (SPADCALL |dr| (QREFELT % 70))) G190
                              (COND
                               ((OR (ATOM #17#)
                                    (PROGN (LETT |dc| (CAR #17#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #16#
                                       (SPADCALL
                                        (|ALGFACT;liftpoly| (QVELT |dc| 1) %)
                                        (QVELT |dc| 2) (QREFELT % 41)))
                                 (COND
                                  (#14#
                                   (LETT #15#
                                         (SPADCALL #15# #16# (QREFELT % 35))))
                                  ('T
                                   (PROGN (LETT #15# #16#) (LETT #14# 'T)))))))
                              (LETT #17# (CDR #17#)) (GO G190) G191 (EXIT NIL))
                         (COND (#14# #15#) (#18='T (|spadConstant| % 36))))
                        (QREFELT % 37)))))
           (#18#
            (SEQ
             (LETT |q|
                   (|ALGFACT;SUPEI_to_SUP|
                    (LETT |qe|
                          (SPADCALL
                           (LETT |alpha|
                                 (PROGN
                                  (LETT #9# NIL)
                                  (SEQ (LETT #13# NIL) (LETT #12# |l|) G190
                                       (COND
                                        ((OR (ATOM #12#)
                                             (PROGN
                                              (LETT #13# (CAR #12#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (PROGN
                                          (LETT #11# #13#)
                                          (COND
                                           (#9#
                                            (LETT #10#
                                                  (SPADCALL #10# #11#
                                                            (QREFELT % 71))))
                                           ('T
                                            (PROGN
                                             (LETT #10# #11#)
                                             (LETT #9# 'T)))))))
                                       (LETT #12# (CDR #12#)) (GO G190) G191
                                       (EXIT NIL))
                                  (COND (#9# #10#)
                                        (#18# (|IdentityError| '|max|)))))
                           (QREFELT % 73)))
                    %))
             (LETT |newl|
                   (SPADCALL (CONS #'|ALGFACT;fact!0| (VECTOR % |alpha|)) |l|
                             (QREFELT % 77)))
             (LETT |sae|
                   (|SimpleAlgebraicExtension| (|AlgebraicNumber|)
                                               (|SparseUnivariatePolynomial|
                                                (|AlgebraicNumber|))
                                               |q|))
             (LETT |ups| (|SparseUnivariatePolynomial| |sae|))
             (LETT |fr|
                   (SPADCALL
                    (SPADCALL
                     (CONS #'|ALGFACT;fact!1| (VECTOR |sae| % |qe| |alpha|))
                     |p|
                     (|compiledLookupCheck| '|map|
                                            (LIST (|devaluate| |ups|)
                                                  (LIST '|Mapping|
                                                        (|devaluate| |sae|)
                                                        (LIST
                                                         '|AlgebraicNumber|))
                                                  (|devaluate| (ELT % 6)))
                                            (|UnivariatePolynomialCategoryFunctions2|
                                             (|AlgebraicNumber|) (ELT % 6)
                                             |sae| |ups|)))
                    (CONS #'|ALGFACT;fact!2| (VECTOR % |newl|))
                    (|compiledLookupCheck| '|factor|
                                           (LIST
                                            (LIST '|Factored|
                                                  (|devaluate| |ups|))
                                            (|devaluate| |ups|)
                                            (LIST '|Mapping|
                                                  (LIST '|Factored|
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (LIST
                                                          '|AlgebraicNumber|)))
                                                  (LIST
                                                   '|SparseUnivariatePolynomial|
                                                   (LIST '|AlgebraicNumber|))))
                                           (|InnerAlgFactor|
                                            (|AlgebraicNumber|)
                                            (|SparseUnivariatePolynomial|
                                             (|AlgebraicNumber|))
                                            |sae| |ups|))))
             (LETT |newalpha|
                   (SPADCALL (SPADCALL |alpha| (QREFELT % 78)) (QREFELT % 55)))
             (EXIT
              (SPADCALL
               (SPADCALL (CONS #'|ALGFACT;fact!3| (VECTOR % |newalpha| |sae|))
                         (SPADCALL |fr|
                                   (|compiledLookupCheck| '|unit|
                                                          (LIST
                                                           (|devaluate| |ups|)
                                                           '%)
                                                          (|Factored| |ups|)))
                         (|compiledLookupCheck| '|map|
                                                (LIST (|devaluate| (ELT % 6))
                                                      (LIST '|Mapping|
                                                            (LIST
                                                             '|AlgebraicNumber|)
                                                            (|devaluate|
                                                             |sae|))
                                                      (|devaluate| |ups|))
                                                (|UnivariatePolynomialCategoryFunctions2|
                                                 |sae| |ups|
                                                 (|AlgebraicNumber|)
                                                 (ELT % 6))))
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |fc| NIL)
                     (LETT #6#
                           (SPADCALL |fr|
                                     (|compiledLookupCheck| '|factorList|
                                                            (LIST
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|Record|
                                                                    (LIST '|:|
                                                                          '|flag|
                                                                          (LIST
                                                                           '|Union|
                                                                           '"nil"
                                                                           '"sqfr"
                                                                           '"irred"
                                                                           '"prime"))
                                                                    (LIST '|:|
                                                                          '|factor|
                                                                          (|devaluate|
                                                                           |ups|))
                                                                    (LIST '|:|
                                                                          '|exponent|
                                                                          (LIST
                                                                           '|NonNegativeInteger|))))
                                                             '%)
                                                            (|Factored|
                                                             |ups|))))
                     G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |fc| (CAR #6#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #5#
                              (SPADCALL
                               (SPADCALL
                                (CONS #'|ALGFACT;fact!4|
                                      (VECTOR % |newalpha| |sae|))
                                (QVELT |fc| 1)
                                (|compiledLookupCheck| '|map|
                                                       (LIST
                                                        (|devaluate| (ELT % 6))
                                                        (LIST '|Mapping|
                                                              (LIST
                                                               '|AlgebraicNumber|)
                                                              (|devaluate|
                                                               |sae|))
                                                        (|devaluate| |ups|))
                                                       (|UnivariatePolynomialCategoryFunctions2|
                                                        |sae| |ups|
                                                        (|AlgebraicNumber|)
                                                        (ELT % 6))))
                               (QVELT |fc| 2) (QREFELT % 41)))
                        (COND
                         (#2# (LETT #3# (SPADCALL #3# #5# (QREFELT % 35))))
                         ('T (PROGN (LETT #3# #5#) (LETT #2# 'T)))))))
                     (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                (COND (#2# #3#) (#18# (|spadConstant| % 36))))
               (QREFELT % 37))))))))) 

(SDEFUN |ALGFACT;fact!4| ((|x| NIL) ($$ NIL))
        (PROG (|sae| |newalpha| %)
          (LETT |sae| (QREFELT $$ 2))
          (LETT |newalpha| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |x|
                       (|compiledLookupCheck| '|lift|
                                              (LIST
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (LIST '|AlgebraicNumber|))
                                               '%)
                                              |sae|))
             |newalpha| (QREFELT % 79)))))) 

(SDEFUN |ALGFACT;fact!3| ((|x| NIL) ($$ NIL))
        (PROG (|sae| |newalpha| %)
          (LETT |sae| (QREFELT $$ 2))
          (LETT |newalpha| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |x|
                       (|compiledLookupCheck| '|lift|
                                              (LIST
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (LIST '|AlgebraicNumber|))
                                               '%)
                                              |sae|))
             |newalpha| (QREFELT % 79)))))) 

(SDEFUN |ALGFACT;fact!2| ((|x| NIL) ($$ NIL))
        (PROG (|newl| %)
          (LETT |newl| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|ALGFACT;ifactor| |x| |newl| %))))) 

(SDEFUN |ALGFACT;fact!1| ((|x| NIL) ($$ NIL))
        (PROG (|alpha| |qe| % |sae|)
          (LETT |alpha| (QREFELT $$ 3))
          (LETT |qe| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |sae| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|ALGFACT;red_AN| |x| |alpha| |qe| %)
                      (|compiledLookupCheck| '|reduce|
                                             (LIST '%
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (LIST '|AlgebraicNumber|)))
                                             |sae|)))))) 

(SDEFUN |ALGFACT;fact!0| ((|x| NIL) ($$ NIL))
        (PROG (|alpha| %)
          (LETT |alpha| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |alpha| |x| (QREFELT % 74)))))) 

(DECLAIM (NOTINLINE |AlgFactor;|)) 

(DEFUN |AlgFactor;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|AlgFactor| DV$1))
          (LETT % (GETREFV 80))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|AlgFactor| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |AlgFactor| (#1=#:G70)
  (SPROG NIL
         (PROG (#2=#:G71)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|AlgFactor|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|AlgFactor;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|AlgFactor|)))))))))) 

(MAKEPROP '|AlgFactor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|AlgebraicNumber|)
              (|Expression| (|Integer|)) (0 . |coerce|) (|List| 72) (|List| %)
              (5 . |tower|) (|Fraction| (|Integer|)) (10 . |coerce|)
              (|Mapping| 7 13) (|SparseUnivariatePolynomial| 13)
              (|UnivariatePolynomialCategoryFunctions2| 13 16 7 6) (15 . |map|)
              (21 . |retract|) (|Mapping| 13 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 6 13 16) (26 . |map|)
              (|List| 7) (32 . |coefficients|) (|Factored| 6)
              |ALGFACT;factor;UPF;5| (37 . |concat|) (43 . |removeDuplicates|)
              |ALGFACT;factor;UPLF;6| (48 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 31) (|:| |factor| 6) (|:| |exponent| 39))
              (|List| 32) (53 . |factorList|) (58 . *) (64 . |One|) (68 . *)
              |ALGFACT;split;UPF;7| (|NonNegativeInteger|) (74 . |degree|)
              (79 . |primeFactor|) (85 . |One|) (89 . |One|) (93 . |monomial|)
              (|SparseUnivariatePolynomial| %) (99 . |zeroOf|) (104 . |coerce|)
              (109 . -) (|Union| % '"failed") (115 . |exquo|) (121 . ^)
              (|Boolean|) |ALGFACT;doublyTransitive?;UPB;9| (127 . |size?|)
              (133 . |retract|) (|SparseUnivariatePolynomial| 7)
              (|Mapping| 7 8) (|SparseUnivariatePolynomial| 8)
              (|SparseUnivariatePolynomialFunctions2| 8 7) (138 . |map|)
              (|Kernel| 8)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 61) 61
                                                     (|Integer|)
                                                     (|SparseMultivariatePolynomial|
                                                      (|Integer|) 61)
                                                     8)
              (144 . |univariate|) (|Factored| 16) (|RationalFactorize| 16)
              (151 . |factor|) (156 . |unit|)
              (|Record| (|:| |flag| 31) (|:| |factor| 16) (|:| |exponent| 39))
              (|List| 68) (161 . |factorList|) (166 . |max|) (|Kernel| %)
              (172 . |minPoly|) (177 . =) (|Mapping| 52 61) (|List| 61)
              (183 . |remove|) (189 . |coerce|) (194 . |elt|))
           '#(|split| 200 |factor| 205 |doublyTransitive?| 216) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|factor|
                                 ((|Factored| |#1|) |#1|
                                  (|List| (|AlgebraicNumber|))))
                                T)
                              '((|factor| ((|Factored| |#1|) |#1|)) T)
                              '((|split| ((|Factored| |#1|) |#1|)) T)
                              '((|doublyTransitive?| ((|Boolean|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 79
                                            '(1 8 0 7 9 1 8 10 11 12 1 7 0 13
                                              14 2 17 6 15 16 18 1 7 13 0 19 2
                                              21 16 20 6 22 1 6 23 0 24 2 23 0
                                              0 0 27 1 23 0 0 28 1 25 6 0 30 1
                                              25 33 0 34 2 25 0 0 0 35 0 25 0
                                              36 2 25 0 6 0 37 1 6 39 0 40 2 25
                                              0 6 39 41 0 6 0 42 0 7 0 43 2 6 0
                                              7 39 44 1 7 0 45 46 1 6 0 7 47 2
                                              6 0 0 0 48 2 6 49 0 0 50 2 25 0 0
                                              39 51 2 33 52 0 39 54 1 8 7 0 55
                                              2 59 56 57 58 60 3 62 58 8 61 58
                                              63 1 65 64 16 66 1 64 16 0 67 1
                                              64 69 0 70 2 61 0 0 0 71 1 8 45
                                              72 73 2 61 52 0 0 74 2 76 0 75 0
                                              77 1 8 0 72 78 2 56 7 0 7 79 1 0
                                              25 6 38 2 0 25 6 23 29 1 0 25 6
                                              26 1 0 52 6 53)))))
           '|lookupComplete|)) 
