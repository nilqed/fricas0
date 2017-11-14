
(SDEFUN |ALGFACT;allk|
        ((|l| |List| (|AlgebraicNumber|))
         ($ |List| (|Kernel| (|AlgebraicNumber|))))
        (SPROG ((#1=#:G719 NIL) (|x| NIL) (#2=#:G718 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #3=(|ALGFACT;allk|))
                   (SEQ (LETT |x| NIL . #3#) (LETT #1# |l| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 9)) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 12))
                 (QREFELT $ 13))))) 

(SDEFUN |ALGFACT;liftpoly|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|))) ($ UP))
        (SPADCALL (ELT $ 15) |p| (QREFELT $ 19))) 

(SDEFUN |ALGFACT;downpoly|
        ((|p| UP) ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (ELT $ 20) |p| (QREFELT $ 23))) 

(SDEFUN |ALGFACT;ifactor|
        ((|p| |SparseUnivariatePolynomial| (|AlgebraicNumber|))
         (|l| |List| (|Kernel| (|AlgebraicNumber|)))
         ($ |Factored| (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
        (|ALGFACT;fact| |p| |l| $)) 

(SDEFUN |ALGFACT;factor;UPF;5| ((|p| UP) ($ |Factored| UP))
        (|ALGFACT;fact| |p| (|ALGFACT;allk| (SPADCALL |p| (QREFELT $ 25)) $) $)) 

(SDEFUN |ALGFACT;factor;UPLF;6|
        ((|p| UP) (|l| |List| (|AlgebraicNumber|)) ($ |Factored| UP))
        (|ALGFACT;fact| |p|
         (|ALGFACT;allk|
          (SPADCALL (SPADCALL |l| (SPADCALL |p| (QREFELT $ 25)) (QREFELT $ 28))
                    (QREFELT $ 29))
          $)
         $)) 

(SDEFUN |ALGFACT;split;UPF;7| ((|p| UP) ($ |Factored| UP))
        (SPROG
         ((#1=#:G741 NIL) (#2=#:G740 #3=(|Factored| UP)) (#4=#:G742 #3#)
          (#5=#:G745 NIL) (|fc| NIL) (|fp| (|Factored| UP)))
         (SEQ
          (LETT |fp| (SPADCALL |p| (QREFELT $ 27))
                . #6=(|ALGFACT;split;UPF;7|))
          (EXIT
           (SPADCALL (SPADCALL |fp| (QREFELT $ 31))
                     (PROGN
                      (LETT #1# NIL . #6#)
                      (SEQ (LETT |fc| NIL . #6#)
                           (LETT #5# (SPADCALL |fp| (QREFELT $ 34)) . #6#) G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |fc| (CAR #5#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (|ALGFACT;extend| (QCAR |fc|) (QCDR |fc|)
                                     $)
                                    . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #4# (QREFELT $ 35))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 36))))
                     (QREFELT $ 37)))))) 

(SDEFUN |ALGFACT;extend| ((|p| UP) (|n| |Integer|) ($ |Factored| UP))
        (SPROG ((#1=#:G755 NIL) (#2=#:G751 NIL) (|q| (UP)))
               (SEQ
                (COND
                 ((EQL (SPADCALL |p| (QREFELT $ 40)) 1)
                  (SPADCALL |p| |n| (QREFELT $ 42)))
                 ('T
                  (SEQ
                   (LETT |q|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 44) 1 (QREFELT $ 45))
                          (SPADCALL (SPADCALL |p| (QREFELT $ 47))
                                    (QREFELT $ 48))
                          (QREFELT $ 49))
                         . #3=(|ALGFACT;extend|))
                   (EXIT
                    (SPADCALL (SPADCALL |q| |n| (QREFELT $ 42))
                              (SPADCALL
                               (SPADCALL
                                (PROG2
                                    (LETT #2# (SPADCALL |p| |q| (QREFELT $ 51))
                                          . #3#)
                                    (QCDR #2#)
                                  (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                                  (|Union| (QREFELT $ 6)
                                                           "failed")
                                                  #2#))
                                (QREFELT $ 38))
                               (PROG1 (LETT #1# |n| . #3#)
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               (QREFELT $ 52))
                              (QREFELT $ 35))))))))) 

(SDEFUN |ALGFACT;doublyTransitive?;UPB;9| ((|p| UP) ($ |Boolean|))
        (SPROG ((#1=#:G760 NIL))
               (COND
                ((|ALGFACT;irred?| |p| $)
                 (|ALGFACT;irred?|
                  (PROG2
                      (LETT #1#
                            (SPADCALL |p|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 44) 1
                                                 (QREFELT $ 45))
                                       (SPADCALL (SPADCALL |p| (QREFELT $ 47))
                                                 (QREFELT $ 48))
                                       (QREFELT $ 49))
                                      (QREFELT $ 51))
                            |ALGFACT;doublyTransitive?;UPB;9|)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) "failed") #1#))
                  $))
                ('T NIL)))) 

(SDEFUN |ALGFACT;irred?| ((|p| UP) ($ |Boolean|))
        (SPROG ((|fp| (|Factored| UP)))
               (SEQ (LETT |fp| (SPADCALL |p| (QREFELT $ 27)) |ALGFACT;irred?|)
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |fp| (QREFELT $ 55)) 1)
                       (EQL (SPADCALL |fp| 1 (QREFELT $ 56)) 1))
                      ('T NIL)))))) 

(SDEFUN |ALGFACT;fact|
        ((|p| UP) (|l| |List| #1=(|Kernel| (|AlgebraicNumber|)))
         ($ |Factored| UP))
        (SPROG
         ((#2=#:G788 NIL) (#3=#:G787 #4=(|Factored| UP)) (#5=#:G789 #4#)
          (#6=#:G797 NIL) (|fc| NIL) (|newalpha| (|AlgebraicNumber|))
          (|fr| (|Factored| |ups|))
          (|ups|
           (|Join| (|UnivariatePolynomialCategory| |sae|)
                   (CATEGORY |domain|
                    (SIGNATURE |outputForm|
                     ((|OutputForm|) $ (|OutputForm|))))))
          (|sae|
           (|Join|
            (|MonogenicAlgebra| #7=(|AlgebraicNumber|)
                                (|SparseUnivariatePolynomial|
                                 (|AlgebraicNumber|)))
            (CATEGORY |package|
             (IF (|has| #7# (|Field|))
                 (IF (|has| #7# (|PolynomialFactorizationExplicit|))
                     (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                     |noBranch|)
                 |noBranch|))))
          (|newl| (|List| (|Kernel| (|AlgebraicNumber|))))
          (|q| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|alpha| #1#) (#8=#:G772 NIL) (#9=#:G771 #1#) (#10=#:G773 #1#)
          (#11=#:G796 NIL) (#12=#:G690 NIL) (#13=#:G768 NIL) (#14=#:G767 #4#)
          (#15=#:G769 #4#) (#16=#:G795 NIL) (|dc| NIL)
          (|dr|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (SEQ
          (COND
           ((EQL (SPADCALL |p| (QREFELT $ 40)) 1)
            (SPADCALL |p| 1 (QREFELT $ 42)))
           ((NULL |l|)
            (SEQ
             (LETT |dr| (SPADCALL (|ALGFACT;downpoly| |p| $) (QREFELT $ 59))
                   . #17=(|ALGFACT;fact|))
             (EXIT
              (SPADCALL (|ALGFACT;liftpoly| (SPADCALL |dr| (QREFELT $ 60)) $)
                        (PROGN
                         (LETT #13# NIL . #17#)
                         (SEQ (LETT |dc| NIL . #17#)
                              (LETT #16# (SPADCALL |dr| (QREFELT $ 63)) . #17#)
                              G190
                              (COND
                               ((OR (ATOM #16#)
                                    (PROGN (LETT |dc| (CAR #16#) . #17#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #15#
                                       (SPADCALL
                                        (|ALGFACT;liftpoly| (QCAR |dc|) $)
                                        (QCDR |dc|) (QREFELT $ 42))
                                       . #17#)
                                 (COND
                                  (#13#
                                   (LETT #14#
                                         (SPADCALL #14# #15# (QREFELT $ 35))
                                         . #17#))
                                  ('T
                                   (PROGN
                                    (LETT #14# #15# . #17#)
                                    (LETT #13# 'T . #17#)))))))
                              (LETT #16# (CDR #16#) . #17#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#13# #14#) (#18='T (|spadConstant| $ 36))))
                        (QREFELT $ 37)))))
           (#18#
            (SEQ
             (LETT |q|
                   (SPADCALL
                    (LETT |alpha|
                          (PROGN
                           (LETT #8# NIL . #17#)
                           (SEQ (LETT #12# NIL . #17#) (LETT #11# |l| . #17#)
                                G190
                                (COND
                                 ((OR (ATOM #11#)
                                      (PROGN
                                       (LETT #12# (CAR #11#) . #17#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #10# #12# . #17#)
                                   (COND
                                    (#8#
                                     (LETT #9#
                                           (SPADCALL #9# #10# (QREFELT $ 65))
                                           . #17#))
                                    ('T
                                     (PROGN
                                      (LETT #9# #10# . #17#)
                                      (LETT #8# 'T . #17#)))))))
                                (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#8# #9#) (#18# (|IdentityError| '|max|))))
                          . #17#)
                    (QREFELT $ 67))
                   . #17#)
             (LETT |newl|
                   (SPADCALL (CONS #'|ALGFACT;fact!0| (VECTOR $ |alpha|)) |l|
                             (QREFELT $ 70))
                   . #17#)
             (LETT |sae|
                   (|SimpleAlgebraicExtension| (|AlgebraicNumber|)
                                               (|SparseUnivariatePolynomial|
                                                (|AlgebraicNumber|))
                                               |q|)
                   . #17#)
             (LETT |ups| (|SparseUnivariatePolynomial| |sae|) . #17#)
             (LETT |fr|
                   (SPADCALL
                    (SPADCALL
                     (CONS #'|ALGFACT;fact!1| (VECTOR |sae| $ |q| |alpha|)) |p|
                     (|compiledLookupCheck| '|map|
                                            (LIST (|devaluate| |ups|)
                                                  (LIST '|Mapping|
                                                        (|devaluate| |sae|)
                                                        (LIST
                                                         '|AlgebraicNumber|))
                                                  (|devaluate| (ELT $ 6)))
                                            (|UnivariatePolynomialCategoryFunctions2|
                                             (|AlgebraicNumber|) (ELT $ 6)
                                             |sae| |ups|)))
                    (CONS #'|ALGFACT;fact!2| (VECTOR $ |newl|))
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
                                            |sae| |ups|)))
                   . #17#)
             (LETT |newalpha| (SPADCALL |alpha| (QREFELT $ 74)) . #17#)
             (EXIT
              (SPADCALL
               (SPADCALL (CONS #'|ALGFACT;fact!3| (VECTOR $ |newalpha| |sae|))
                         (SPADCALL |fr|
                                   (|compiledLookupCheck| '|unit|
                                                          (LIST
                                                           (|devaluate| |ups|)
                                                           '$)
                                                          (|Factored| |ups|)))
                         (|compiledLookupCheck| '|map|
                                                (LIST (|devaluate| (ELT $ 6))
                                                      (LIST '|Mapping|
                                                            (LIST
                                                             '|AlgebraicNumber|)
                                                            (|devaluate|
                                                             |sae|))
                                                      (|devaluate| |ups|))
                                                (|UnivariatePolynomialCategoryFunctions2|
                                                 |sae| |ups|
                                                 (|AlgebraicNumber|)
                                                 (ELT $ 6))))
               (PROGN
                (LETT #2# NIL . #17#)
                (SEQ (LETT |fc| NIL . #17#)
                     (LETT #6#
                           (SPADCALL |fr|
                                     (|compiledLookupCheck| '|factors|
                                                            (LIST
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|Record|
                                                                    (LIST '|:|
                                                                          '|factor|
                                                                          (|devaluate|
                                                                           |ups|))
                                                                    (LIST '|:|
                                                                          '|exponent|
                                                                          (LIST
                                                                           '|Integer|))))
                                                             '$)
                                                            (|Factored|
                                                             |ups|)))
                           . #17#)
                     G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |fc| (CAR #6#) . #17#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #5#
                              (SPADCALL
                               (SPADCALL
                                (CONS #'|ALGFACT;fact!4|
                                      (VECTOR $ |newalpha| |sae|))
                                (QCAR |fc|)
                                (|compiledLookupCheck| '|map|
                                                       (LIST
                                                        (|devaluate| (ELT $ 6))
                                                        (LIST '|Mapping|
                                                              (LIST
                                                               '|AlgebraicNumber|)
                                                              (|devaluate|
                                                               |sae|))
                                                        (|devaluate| |ups|))
                                                       (|UnivariatePolynomialCategoryFunctions2|
                                                        |sae| |ups|
                                                        (|AlgebraicNumber|)
                                                        (ELT $ 6))))
                               (QCDR |fc|) (QREFELT $ 42))
                              . #17#)
                        (COND
                         (#2#
                          (LETT #3# (SPADCALL #3# #5# (QREFELT $ 35)) . #17#))
                         ('T
                          (PROGN
                           (LETT #3# #5# . #17#)
                           (LETT #2# 'T . #17#)))))))
                     (LETT #6# (CDR #6#) . #17#) (GO G190) G191 (EXIT NIL))
                (COND (#2# #3#) (#18# (|spadConstant| $ 36))))
               (QREFELT $ 37))))))))) 

(SDEFUN |ALGFACT;fact!4| ((|x| NIL) ($$ NIL))
        (PROG (|sae| |newalpha| $)
          (LETT |sae| (QREFELT $$ 2) . #1=(|ALGFACT;fact|))
          (LETT |newalpha| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |x|
                       (|compiledLookupCheck| '|lift|
                                              (LIST
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (LIST '|AlgebraicNumber|))
                                               '$)
                                              |sae|))
             |newalpha| (QREFELT $ 75)))))) 

(SDEFUN |ALGFACT;fact!3| ((|x| NIL) ($$ NIL))
        (PROG (|sae| |newalpha| $)
          (LETT |sae| (QREFELT $$ 2) . #1=(|ALGFACT;fact|))
          (LETT |newalpha| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |x|
                       (|compiledLookupCheck| '|lift|
                                              (LIST
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (LIST '|AlgebraicNumber|))
                                               '$)
                                              |sae|))
             |newalpha| (QREFELT $ 75)))))) 

(SDEFUN |ALGFACT;fact!2| ((|x| NIL) ($$ NIL))
        (PROG (|newl| $)
          (LETT |newl| (QREFELT $$ 1) . #1=(|ALGFACT;fact|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ALGFACT;ifactor| |x| |newl| $))))) 

(SDEFUN |ALGFACT;fact!1| ((|x| NIL) ($$ NIL))
        (PROG (|alpha| |q| $ |sae|)
          (LETT |alpha| (QREFELT $$ 3) . #1=(|ALGFACT;fact|))
          (LETT |q| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |sae| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |alpha| |q| (QREFELT $ 73))
                      (|compiledLookupCheck| '|reduce|
                                             (LIST '$
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (LIST '|AlgebraicNumber|)))
                                             |sae|)))))) 

(SDEFUN |ALGFACT;fact!0| ((|x| NIL) ($$ NIL))
        (PROG (|alpha| $)
          (LETT |alpha| (QREFELT $$ 1) . #1=(|ALGFACT;fact|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |alpha| |x| (QREFELT $ 68)))))) 

(DECLAIM (NOTINLINE |AlgFactor;|)) 

(DEFUN |AlgFactor| (#1=#:G798)
  (SPROG NIL
         (PROG (#2=#:G799)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|AlgFactor|)
                                               '|domainEqualList|)
                    . #3=(|AlgFactor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|AlgFactor;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|AlgFactor|)))))))))) 

(DEFUN |AlgFactor;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgFactor|))
          (LETT |dv$| (LIST '|AlgFactor| DV$1) . #1#)
          (LETT $ (GETREFV 76) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|AlgFactor| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|AlgFactor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 66)
              (|AlgebraicNumber|) (0 . |tower|) (|List| $) (|List| 64)
              (5 . |concat|) (10 . |removeDuplicates|) (|Fraction| 41)
              (15 . |coerce|) (|Mapping| 8 14)
              (|SparseUnivariatePolynomial| 14)
              (|UnivariatePolynomialCategoryFunctions2| 14 17 8 6) (20 . |map|)
              (26 . |retract|) (|Mapping| 14 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 6 14 17) (31 . |map|)
              (|List| 8) (37 . |coefficients|) (|Factored| 6)
              |ALGFACT;factor;UPF;5| (42 . |concat|) (48 . |removeDuplicates|)
              |ALGFACT;factor;UPLF;6| (53 . |unit|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 41)) (|List| 32)
              (58 . |factors|) (63 . *) (69 . |One|) (73 . *)
              |ALGFACT;split;UPF;7| (|NonNegativeInteger|) (79 . |degree|)
              (|Integer|) (84 . |primeFactor|) (90 . |One|) (94 . |One|)
              (98 . |monomial|) (|SparseUnivariatePolynomial| $)
              (104 . |zeroOf|) (109 . |coerce|) (114 . -) (|Union| $ '"failed")
              (120 . |exquo|) (126 . ^) (|Boolean|)
              |ALGFACT;doublyTransitive?;UPB;9| (132 . |numberOfFactors|)
              (137 . |nthExponent|) (|Factored| 17) (|RationalFactorize| 17)
              (143 . |factor|) (148 . |unit|)
              (|Record| (|:| |factor| 17) (|:| |exponent| 41)) (|List| 61)
              (153 . |factors|) (|Kernel| 8) (158 . |max|) (|Kernel| $)
              (164 . |minPoly|) (169 . =) (|Mapping| 53 64) (175 . |remove|)
              (|SparseUnivariatePolynomial| 8)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 64) 64
                                                     41
                                                     (|SparseMultivariatePolynomial|
                                                      41 64)
                                                     8)
              (181 . |univariate|) (188 . |coerce|) (193 . |elt|))
           '#(|split| 199 |factor| 204 |doublyTransitive?| 215) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 75
                                                 '(1 8 7 0 9 1 11 0 10 12 1 11
                                                   0 0 13 1 8 0 14 15 2 18 6 16
                                                   17 19 1 8 14 0 20 2 22 17 21
                                                   6 23 1 6 24 0 25 2 24 0 0 0
                                                   28 1 24 0 0 29 1 26 6 0 31 1
                                                   26 33 0 34 2 26 0 0 0 35 0
                                                   26 0 36 2 26 0 6 0 37 1 6 39
                                                   0 40 2 26 0 6 41 42 0 6 0 43
                                                   0 8 0 44 2 6 0 8 39 45 1 8 0
                                                   46 47 1 6 0 8 48 2 6 0 0 0
                                                   49 2 6 50 0 0 51 2 26 0 0 39
                                                   52 1 26 39 0 55 2 26 41 0 41
                                                   56 1 58 57 17 59 1 57 17 0
                                                   60 1 57 62 0 63 2 64 0 0 0
                                                   65 1 8 46 66 67 2 64 53 0 0
                                                   68 2 11 0 69 0 70 3 72 71 8
                                                   64 71 73 1 8 0 66 74 2 71 8
                                                   0 8 75 1 0 26 6 38 1 0 26 6
                                                   27 2 0 26 6 24 30 1 0 53 6
                                                   54)))))
           '|lookupComplete|)) 
