
(SDEFUN |EFACTOR;poly_factor;SupF;1|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         ($ |Factored|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F)))))
        (SPADCALL |p| (QREFELT $ 11))) 

(SDEFUN |EFACTOR;poly_factor;SupF;2|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         ($ |Factored|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F)))))
        (SPADCALL |p| (QREFELT $ 11))) 

(SDEFUN |EFACTOR;poly_factor;SupF;3|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         ($ |Factored|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F)))))
        (SPADCALL |p| (QREFELT $ 16))) 

(PUT '|EFACTOR;poly_factor;SupF;4| '|SPADreplace|
     '(XLAM (|p|) (|error| "factorPolynomial unimplemented"))) 

(SDEFUN |EFACTOR;poly_factor;SupF;4|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         ($ |Factored|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F)))))
        (|error| "factorPolynomial unimplemented")) 

(SDEFUN |EFACTOR;fpoly_factor|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |Factored| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|res| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|fr2| (|SparseUnivariatePolynomial| F))
          (|fru| (|SparseUnivariatePolynomial| F))
          (|fr1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (#1=#:G751 NIL) (|frec| NIL)
          (|fres1|
           (|Factored|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| R (|Kernel| F)))))
          (|p2|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|pf| (F)) (|cnp| (|SparseUnivariatePolynomial| F)) (|cn| (F)))
         (SEQ
          (LETT |cn| (SPADCALL |p| (QREFELT $ 27))
                . #2=(|EFACTOR;fpoly_factor|))
          (EXIT
           (COND
            ((SPADCALL |cn| (|spadConstant| $ 29) (QREFELT $ 31))
             (SPADCALL |p| 1 (QREFELT $ 36)))
            ('T
             (SEQ (LETT |p| (SPADCALL |p| |cn| (QREFELT $ 37)) . #2#)
                  (LETT |cnp| (SPADCALL |cn| (QREFELT $ 38)) . #2#)
                  (LETT |pf|
                        (SPADCALL
                         (SPADCALL |p| (QREFELT $ 19)
                                   (SPADCALL (QREFELT $ 25) (QREFELT $ 40))
                                   (QREFELT $ 41))
                         (QREFELT $ 42))
                        . #2#)
                  (LETT |p2|
                        (SPADCALL (SPADCALL |pf| (QREFELT $ 44)) (QREFELT $ 25)
                                  (QREFELT $ 45))
                        . #2#)
                  (LETT |fres1| (SPADCALL |p2| (QREFELT $ 12)) . #2#)
                  (LETT |res| (SPADCALL |cnp| NIL (QREFELT $ 49)) . #2#)
                  (SEQ (LETT |frec| NIL . #2#)
                       (LETT #1# (SPADCALL |fres1| (QREFELT $ 52)) . #2#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |frec| (CAR #1#) . #2#) NIL))
                         (GO G191)))
                       (SEQ (LETT |fr1| (QVELT |frec| 1) . #2#)
                            (EXIT
                             (COND
                              ((< (SPADCALL |fr1| (QREFELT $ 54)) 1) "iterate")
                              ('T
                               (SEQ
                                (COND
                                 ((SPADCALL (QVELT |frec| 0) (CONS 3 "prime")
                                            (QREFELT $ 55))
                                  (COND
                                   ((SPADCALL (QVELT |frec| 0) (CONS 2 "irred")
                                              (QREFELT $ 55))
                                    (EXIT (|error| "impossible"))))))
                                (LETT |fru|
                                      (SPADCALL (ELT $ 56) |fr1|
                                                (QREFELT $ 59))
                                      . #2#)
                                (LETT |fr2|
                                      (SPADCALL |fru|
                                                (SPADCALL |fru| (QREFELT $ 27))
                                                (QREFELT $ 37))
                                      . #2#)
                                (EXIT
                                 (LETT |res|
                                       (SPADCALL |res|
                                                 (SPADCALL |fr2|
                                                           (QVELT |frec| 2)
                                                           (QREFELT $ 60))
                                                 (QREFELT $ 61))
                                       . #2#)))))))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))))))) 

(SDEFUN |EFACTOR;ifactor|
        ((|p| |SparseUnivariatePolynomial| F) (|lk| |List| #1=(|Kernel| F))
         ($ |Factored| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|res| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|fr2| (|SparseUnivariatePolynomial| F))
          (|fru| (|SparseUnivariatePolynomial| F)) (|fr1| (|ups|))
          (#2=#:G784 NIL) (|frec| NIL) (|kf| (F)) (|fres1| (|Factored| |ups|))
          (|p2| (|ups|))
          (|ups|
           (|Join| (|UnivariatePolynomialCategory| |sae|)
                   (CATEGORY |domain|
                    (SIGNATURE |outputForm|
                     ((|OutputForm|) $ (|OutputForm|))))))
          (|sae|
           (|Join| (|MonogenicAlgebra| F (|SparseUnivariatePolynomial| F))
                   (CATEGORY |package|
                    (IF (|has| F (|Field|))
                        (IF (|has| F (|PolynomialFactorizationExplicit|))
                            (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                            |noBranch|)
                        |noBranch|))))
          (|lk2| (|List| #1#)) (#3=#:G783 NIL) (|k| NIL) (#4=#:G782 NIL)
          (|q| (|SparseUnivariatePolynomial| F)) (|k1| (|Kernel| F))
          (|cnp| (|SparseUnivariatePolynomial| F)) (|cn| (F))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL |p| (QREFELT $ 62)) . #5=(|EFACTOR;ifactor|))
              (LETT |cn| (SPADCALL |p| (QREFELT $ 27)) . #5#)
              (EXIT
               (COND
                ((SPADCALL |cn| (|spadConstant| $ 29) (QREFELT $ 31))
                 (SPADCALL |p| 1 (QREFELT $ 36)))
                (#6='T
                 (SEQ (LETT |cnp| (SPADCALL |cn| (QREFELT $ 38)) . #5#)
                      (EXIT
                       (COND ((< |n| 1) (SPADCALL |cnp| NIL (QREFELT $ 49)))
                             ((EQL |n| 1)
                              (SPADCALL |cnp|
                                        (LIST (VECTOR (CONS 3 "prime") |p| 1))
                                        (QREFELT $ 49)))
                             (#6#
                              (COND
                               ((NULL |lk|) (|EFACTOR;fpoly_factor| |p| $))
                               (#6#
                                (SEQ
                                 (LETT |q|
                                       (SPADCALL
                                        (LETT |k1|
                                              (SPADCALL (ELT $ 63) |lk|
                                                        (QREFELT $ 66))
                                              . #5#)
                                        (QREFELT $ 67))
                                       . #5#)
                                 (LETT |lk2|
                                       (PROGN
                                        (LETT #4# NIL . #5#)
                                        (SEQ (LETT |k| NIL . #5#)
                                             (LETT #3# |lk| . #5#) G190
                                             (COND
                                              ((OR (ATOM #3#)
                                                   (PROGN
                                                    (LETT |k| (CAR #3#) . #5#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((SPADCALL |k| |k1|
                                                           (QREFELT $ 68))
                                                 (LETT #4# (CONS |k| #4#)
                                                       . #5#)))))
                                             (LETT #3# (CDR #3#) . #5#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #4#))))
                                       . #5#)
                                 (LETT |sae|
                                       (|SimpleAlgebraicExtension|
                                        (QREFELT $ 7)
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 7))
                                        |q|)
                                       . #5#)
                                 (LETT |ups|
                                       (|SparseUnivariatePolynomial| |sae|)
                                       . #5#)
                                 (LETT |p2|
                                       (SPADCALL
                                        (CONS #'|EFACTOR;ifactor!0|
                                              (VECTOR |sae| $ |q| |k1|))
                                        |p|
                                        (|compiledLookupCheck| '|map|
                                                               (LIST
                                                                (|devaluate|
                                                                 |ups|)
                                                                (LIST
                                                                 '|Mapping|
                                                                 (|devaluate|
                                                                  |sae|)
                                                                 (|devaluate|
                                                                  (ELT $ 7)))
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  (ELT $ 7))))
                                                               (|UnivariatePolynomialCategoryFunctions2|
                                                                (ELT $ 7)
                                                                (|SparseUnivariatePolynomial|
                                                                 (ELT $ 7))
                                                                |sae| |ups|)))
                                       . #5#)
                                 (LETT |fres1|
                                       (SPADCALL |p2|
                                                 (CONS #'|EFACTOR;ifactor!1|
                                                       (VECTOR $ |lk2|))
                                                 (|compiledLookupCheck|
                                                  '|factor|
                                                  (LIST
                                                   (LIST '|Factored|
                                                         (|devaluate| |ups|))
                                                   (|devaluate| |ups|)
                                                   (LIST '|Mapping|
                                                         (LIST '|Factored|
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (|devaluate|
                                                                 (ELT $ 7))))
                                                         (LIST
                                                          '|SparseUnivariatePolynomial|
                                                          (|devaluate|
                                                           (ELT $ 7)))))
                                                  (|InnerAlgFactor| (ELT $ 7)
                                                                    (|SparseUnivariatePolynomial|
                                                                     (ELT $ 7))
                                                                    |sae|
                                                                    |ups|)))
                                       . #5#)
                                 (LETT |res|
                                       (SPADCALL |cnp| NIL (QREFELT $ 49))
                                       . #5#)
                                 (LETT |kf| (SPADCALL |k1| (QREFELT $ 40))
                                       . #5#)
                                 (SEQ (LETT |frec| NIL . #5#)
                                      (LETT #2#
                                            (SPADCALL |fres1|
                                                      (|compiledLookupCheck|
                                                       '|factorList|
                                                       (LIST
                                                        (LIST '|List|
                                                              (LIST '|Record|
                                                                    (LIST '|:|
                                                                          '|flg|
                                                                          (LIST
                                                                           '|Union|
                                                                           '"nil"
                                                                           '"sqfr"
                                                                           '"irred"
                                                                           '"prime"))
                                                                    (LIST '|:|
                                                                          '|fctr|
                                                                          (|devaluate|
                                                                           |ups|))
                                                                    (LIST '|:|
                                                                          '|xpnt|
                                                                          (LIST
                                                                           '|Integer|))))
                                                        '$)
                                                       (|Factored| |ups|)))
                                            . #5#)
                                      G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN
                                             (LETT |frec| (CAR #2#) . #5#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ (LETT |fr1| (QVELT |frec| 1) . #5#)
                                           (COND
                                            ((SPADCALL (QVELT |frec| 0)
                                                       (CONS 3 "prime")
                                                       (QREFELT $ 55))
                                             (COND
                                              ((SPADCALL (QVELT |frec| 0)
                                                         (CONS 2 "irred")
                                                         (QREFELT $ 55))
                                               (EXIT
                                                (|error| "impossible"))))))
                                           (LETT |fru|
                                                 (SPADCALL
                                                  (CONS #'|EFACTOR;ifactor!2|
                                                        (VECTOR |kf| |sae| $))
                                                  |fr1|
                                                  (|compiledLookupCheck| '|map|
                                                                         (LIST
                                                                          (LIST
                                                                           '|SparseUnivariatePolynomial|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7)))
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7))
                                                                           (|devaluate|
                                                                            |sae|))
                                                                          (|devaluate|
                                                                           |ups|))
                                                                         (|UnivariatePolynomialCategoryFunctions2|
                                                                          |sae|
                                                                          |ups|
                                                                          (ELT
                                                                           $ 7)
                                                                          (|SparseUnivariatePolynomial|
                                                                           (ELT
                                                                            $
                                                                            7)))))
                                                 . #5#)
                                           (LETT |fr2|
                                                 (SPADCALL |fru|
                                                           (SPADCALL |fru|
                                                                     (QREFELT $
                                                                              27))
                                                           (QREFELT $ 37))
                                                 . #5#)
                                           (EXIT
                                            (LETT |res|
                                                  (SPADCALL |res|
                                                            (SPADCALL |fr2|
                                                                      (QVELT
                                                                       |frec|
                                                                       2)
                                                                      (QREFELT
                                                                       $ 60))
                                                            (QREFELT $ 61))
                                                  . #5#)))
                                      (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT |res|)))))))))))))) 

(SDEFUN |EFACTOR;ifactor!2| ((|c1| NIL) ($$ NIL))
        (PROG ($ |sae| |kf|)
          (LETT $ (QREFELT $$ 2) . #1=(|EFACTOR;ifactor|))
          (LETT |sae| (QREFELT $$ 1) . #1#)
          (LETT |kf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |c1|
                       (|compiledLookupCheck| '|lift|
                                              (LIST
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (|devaluate| (ELT $ 7)))
                                               '$)
                                              |sae|))
             |kf| (QREFELT $ 71)))))) 

(SDEFUN |EFACTOR;ifactor!1| ((|x| NIL) ($$ NIL))
        (PROG (|lk2| $)
          (LETT |lk2| (QREFELT $$ 1) . #1=(|EFACTOR;ifactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|EFACTOR;ifactor| |x| |lk2| $))))) 

(SDEFUN |EFACTOR;ifactor!0| ((|x| NIL) ($$ NIL))
        (PROG (|k1| |q| $ |sae|)
          (LETT |k1| (QREFELT $$ 3) . #1=(|EFACTOR;ifactor|))
          (LETT |q| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |sae| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |k1| |q| (QREFELT $ 70))
                      (|compiledLookupCheck| '|reduce|
                                             (LIST '$
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (|devaluate| (ELT $ 7))))
                                             |sae|)))))) 

(SDEFUN |EFACTOR;factorPolynomial;SupF;7|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |Factored| (|SparseUnivariatePolynomial| F)))
        (|EFACTOR;ifactor| |p|
         (SPADCALL (SPADCALL |p| (QREFELT $ 73)) (QREFELT $ 76)) $)) 

(SDEFUN |EFACTOR;factor;SupLF;8|
        ((|p| |SparseUnivariatePolynomial| F) (|lf| |List| F)
         ($ |Factored| (|SparseUnivariatePolynomial| F)))
        (|EFACTOR;ifactor| |p|
         (SPADCALL (SPADCALL |lf| (SPADCALL |p| (QREFELT $ 73)) (QREFELT $ 78))
                   (QREFELT $ 76))
         $)) 

(DECLAIM (NOTINLINE |ExpressionFactorPolynomial;|)) 

(DEFUN |ExpressionFactorPolynomial| (&REST #1=#:G795)
  (SPROG NIL
         (PROG (#2=#:G796)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExpressionFactorPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|ExpressionFactorPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ExpressionFactorPolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ExpressionFactorPolynomial|)))))))))) 

(DEFUN |ExpressionFactorPolynomial;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionFactorPolynomial|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ExpressionFactorPolynomial| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 80) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ExpressionFactorPolynomial|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|domainEqual| |#1| (|Integer|))
            (PROGN
             (QSETREFV $ 12
                       (CONS (|dispatchFunction| |EFACTOR;poly_factor;SupF;1|)
                             $))))
           ((|domainEqual| |#1| (|Complex| (|Integer|)))
            (PROGN
             (QSETREFV $ 12
                       (CONS (|dispatchFunction| |EFACTOR;poly_factor;SupF;2|)
                             $))))
           ((|HasCategory|
             (|SparseMultivariatePolynomial| |#1| (|Kernel| |#2|))
             '(|PolynomialFactorizationExplicit|))
            (QSETREFV $ 12
                      (CONS (|dispatchFunction| |EFACTOR;poly_factor;SupF;3|)
                            $)))
           ('T
            (QSETREFV $ 12
                      (CONS (|dispatchFunction| |EFACTOR;poly_factor;SupF;4|)
                            $))))
          (QSETREFV $ 19 (SPADCALL (QREFELT $ 18)))
          (QSETREFV $ 22 (SPADCALL (QREFELT $ 21)))
          (QSETREFV $ 25 (SPADCALL (QREFELT $ 22) (QREFELT $ 24)))
          $))) 

(MAKEPROP '|ExpressionFactorPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Factored| 9) (|SparseUnivariatePolynomial| 15)
              (|MultivariateFactorize| 23 (|IndexedExponents| 23) 6 15)
              (0 . |factor|) (5 . |poly_factor|) (|Factored| 14)
              (|SparseUnivariatePolynomial| $)
              (|SparseMultivariatePolynomial| 6 23) (10 . |factorPolynomial|)
              (|SingletonAsOrderedSet|) (15 . |create|) '|dummy| (|Symbol|)
              (19 . |new|) '|xs| (|Kernel| 7) (23 . |kernel|) '|xk|
              (|SparseUnivariatePolynomial| 7) (28 . |leadingCoefficient|)
              (33 . |Zero|) (37 . |Zero|) (|Boolean|) (41 . =) (47 . |One|)
              (51 . |One|) (|Integer|) (|Factored| 26) (55 . |nilFactor|)
              (61 . /) (67 . |coerce|) (|Kernel| $) (72 . |coerce|)
              (77 . |eval|) (84 . |retract|)
              (|SparseMultivariatePolynomial| 6 39) (89 . |numer|)
              (94 . |univariate|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 46) (|:| |fctr| 26) (|:| |xpnt| 34))
              (|List| 47) (100 . |makeFR|)
              (|Record| (|:| |flg| 46) (|:| |fctr| 9) (|:| |xpnt| 34))
              (|List| 50) (106 . |factorList|) (|NonNegativeInteger|)
              (111 . |degree|) (116 . ~=) (122 . |coerce|) (|Mapping| 7 15)
              (|UnivariatePolynomialCategoryFunctions2| 15 9 7 26)
              (127 . |map|) (133 . |primeFactor|) (139 . *) (145 . |degree|)
              (150 . |max|) (|Mapping| 23 23 23) (|List| 23) (156 . |reduce|)
              (162 . |minPoly|) (167 . ~=)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 23) 23
                                                     6 15 7)
              (173 . |univariate|) (180 . |elt|) (|List| 7)
              (186 . |coefficients|) (|List| 39) (|List| $) (191 . |algtower|)
              |EFACTOR;factorPolynomial;SupF;7| (196 . |concat|)
              |EFACTOR;factor;SupLF;8|)
           '#(|poly_factor| 202 |factorPolynomial| 207 |factor| 212) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 79
                                                 '(1 10 8 9 11 1 0 8 9 12 1 15
                                                   13 14 16 0 17 0 18 0 20 0 21
                                                   1 23 0 20 24 1 26 7 0 27 0 6
                                                   0 28 0 7 0 29 2 7 30 0 0 31
                                                   0 6 0 32 0 7 0 33 2 35 0 26
                                                   34 36 2 26 0 0 7 37 1 26 0 7
                                                   38 1 7 0 39 40 3 26 0 0 17 7
                                                   41 1 26 7 0 42 1 7 43 0 44 2
                                                   15 14 0 23 45 2 35 0 26 48
                                                   49 1 8 51 0 52 1 9 53 0 54 2
                                                   46 30 0 0 55 1 7 0 43 56 2
                                                   58 26 57 9 59 2 35 0 26 34
                                                   60 2 35 0 0 0 61 1 26 53 0
                                                   62 2 23 0 0 0 63 2 65 23 64
                                                   0 66 1 7 14 39 67 2 23 30 0
                                                   0 68 3 69 26 7 23 26 70 2 26
                                                   7 0 7 71 1 26 72 0 73 1 7 74
                                                   75 76 2 72 0 0 0 78 1 0 8 9
                                                   12 1 0 35 26 77 2 0 35 26 72
                                                   79)))))
           '|lookupComplete|)) 
