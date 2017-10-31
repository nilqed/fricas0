
(SDEFUN |CAD;cylindricalDecomposition;LL;1|
        ((|lpols| |List| (|Polynomial| |TheField|))
         ($ |List| (|Cell| |TheField|)))
        (SPROG ((|lv| (|List| (|Symbol|))) (#1=#:G718 NIL) (|pol| NIL))
               (SEQ (LETT |lv| NIL . #2=(|CAD;cylindricalDecomposition;LL;1|))
                    (SEQ (LETT |pol| NIL . #2#) (LETT #1# |lpols| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |pol| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND ((SPADCALL |pol| (QREFELT $ 9)) "next pol")
                                 ('T
                                  (LETT |lv|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |pol| (QREFELT $ 11)) |lv|
                                          (QREFELT $ 12))
                                         (QREFELT $ 13))
                                        . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (LETT |lv| (REVERSE (SPADCALL |lv| (QREFELT $ 14))) . #2#)
                    (EXIT (SPADCALL |lpols| |lv| (QREFELT $ 17)))))) 

(SDEFUN |CAD;cylindricalDecomposition;LLL;2|
        ((|lpols| |List| (|Polynomial| |TheField|)) (|lvars| |List| (|Symbol|))
         ($ |List| (|Cell| |TheField|)))
        (SPROG
         ((|res| (|List| (|Cell| |TheField|))) (#1=#:G738 NIL) (|scell| NIL)
          (#2=#:G737 NIL)
          (|scells|
           (|List|
            (|SimpleCell| |TheField|
                          (|SparseUnivariatePolynomial| |TheField|))))
          (|lspec| (|List| (|SparseUnivariatePolynomial| |TheField|)))
          (#3=#:G736 NIL) (|cell| NIL)
          (|previousCad| (|List| (|Cell| |TheField|)))
          (|lpols1| (|List| (|Polynomial| |TheField|))) (#4=#:G735 NIL)
          (|pol| NIL) (#5=#:G734 NIL) (#6=#:G733 NIL) (#7=#:G732 NIL)
          (|lp1| (|List| (|SparseUnivariatePolynomial| |TheField|)))
          (#8=#:G731 NIL) (#9=#:G730 NIL) (|lv| (|List| (|Symbol|)))
          (|mv| (|Symbol|)))
         (SEQ
          (COND
           ((SPADCALL |lvars| NIL (QREFELT $ 19))
            (|error| "cylindricalDecomposition: empty list of vars"))
           (#10='T
            (SEQ
             (LETT |mv| (|SPADfirst| |lvars|)
                   . #11=(|CAD;cylindricalDecomposition;LLL;2|))
             (LETT |lv| (CDR |lvars|) . #11#)
             (EXIT
              (COND
               ((SPADCALL |lv| NIL (QREFELT $ 19))
                (SEQ
                 (LETT |lp1|
                       (PROGN
                        (LETT #9# NIL . #11#)
                        (SEQ (LETT |pol| NIL . #11#) (LETT #8# |lpols| . #11#)
                             G190
                             (COND
                              ((OR (ATOM #8#)
                                   (PROGN (LETT |pol| (CAR #8#) . #11#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #9#
                                     (CONS (SPADCALL |pol| (QREFELT $ 21)) #9#)
                                     . #11#)))
                             (LETT #8# (CDR #8#) . #11#) (GO G190) G191
                             (EXIT (NREVERSE #9#))))
                       . #11#)
                 (LETT |scells| (SPADCALL |lp1| |mv| (QREFELT $ 26)) . #11#)
                 (EXIT
                  (PROGN
                   (LETT #7# NIL . #11#)
                   (SEQ (LETT |scell| NIL . #11#) (LETT #6# |scells| . #11#)
                        G190
                        (COND
                         ((OR (ATOM #6#)
                              (PROGN (LETT |scell| (CAR #6#) . #11#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #7#
                                (CONS (SPADCALL (LIST |scell|) (QREFELT $ 29))
                                      #7#)
                                . #11#)))
                        (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                        (EXIT (NREVERSE #7#)))))))
               (#10#
                (SEQ
                 (LETT |lpols1|
                       (SPADCALL
                        (PROGN
                         (LETT #5# NIL . #11#)
                         (SEQ (LETT |pol| NIL . #11#) (LETT #4# |lpols| . #11#)
                              G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |pol| (CAR #4#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #5#
                                      (CONS
                                       (SPADCALL |pol| |mv| (QREFELT $ 31))
                                       #5#)
                                      . #11#)))
                              (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                              (EXIT (NREVERSE #5#))))
                        (QREFELT $ 33))
                       . #11#)
                 (LETT |previousCad| (SPADCALL |lpols1| |lv| (QREFELT $ 17))
                       . #11#)
                 (LETT |res| NIL . #11#)
                 (SEQ (LETT |cell| NIL . #11#) (LETT #3# |previousCad| . #11#)
                      G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |cell| (CAR #3#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |lspec| (SPADCALL |lpols| |cell| (QREFELT $ 34))
                             . #11#)
                       (LETT |scells| (SPADCALL |lspec| |mv| (QREFELT $ 26))
                             . #11#)
                       (EXIT
                        (LETT |res|
                              (SPADCALL |res|
                                        (PROGN
                                         (LETT #2# NIL . #11#)
                                         (SEQ (LETT |scell| NIL . #11#)
                                              (LETT #1# |scells| . #11#) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |scell| (CAR #1#)
                                                           . #11#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL |scell| |cell|
                                                                 (QREFELT $
                                                                          35))
                                                       #2#)
                                                      . #11#)))
                                              (LETT #1# (CDR #1#) . #11#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        (QREFELT $ 36))
                              . #11#)))
                      (LETT #3# (CDR #3#) . #11#) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))))))) 

(SDEFUN |CAD;specialise;LCL;3|
        ((|lpols| |List| (|Polynomial| |TheField|)) (|cell| |Cell| |TheField|)
         ($ |List| (|SparseUnivariatePolynomial| |TheField|)))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| |TheField|)))
          (|p1| (|SparseUnivariatePolynomial| |TheField|)) (#1=#:G743 NIL)
          (|pol| NIL) (|vl| (|List| (|Symbol|))) (|sp| (|List| |TheField|)))
         (SEQ
          (COND
           ((SPADCALL |lpols| NIL (QREFELT $ 37))
            (|error| "specialise: empty list of pols"))
           ('T
            (SEQ
             (LETT |sp| (SPADCALL |cell| (QREFELT $ 39))
                   . #2=(|CAD;specialise;LCL;3|))
             (LETT |vl| (SPADCALL |cell| (QREFELT $ 40)) . #2#)
             (LETT |res| NIL . #2#)
             (SEQ (LETT |pol| NIL . #2#) (LETT #1# |lpols| . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |pol| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ
                   (LETT |p1|
                         (SPADCALL (SPADCALL |pol| |vl| |sp| (QREFELT $ 41))
                                   (QREFELT $ 21))
                         . #2#)
                   (EXIT
                    (COND ((EQL (SPADCALL |p1| (QREFELT $ 43)) 0) "next pol")
                          ('T (LETT |res| (CONS |p1| |res|) . #2#)))))
                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT |res|))))))) 

(SDEFUN |CAD;coefficientSet;SupL;4|
        ((|pol| |SparseUnivariatePolynomial| (|Polynomial| |TheField|))
         ($ |List| (|Polynomial| |TheField|)))
        (SPROG
         ((|res| (|List| (|Polynomial| |TheField|))) (#1=#:G748 NIL)
          (#2=#:G749 NIL) (|c| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| NIL . #3=(|CAD;coefficientSet;SupL;4|))
                (SEQ (LETT |c| NIL . #3#)
                     (LETT #2# (SPADCALL |pol| (QREFELT $ 46)) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |c| (QREFELT $ 9))
                         (PROGN (LETT #1# |res| . #3#) (GO #4=#:G747)))
                        ('T (LETT |res| (CONS |c| |res|) . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #4# (EXIT #1#)))) 

(SDEFUN |CAD;discriminantSet;LL;5|
        ((|lpols| |List|
          (|SparseUnivariatePolynomial| (|Polynomial| |TheField|)))
         ($ |List| (|Polynomial| |TheField|)))
        (SPROG
         ((|res| (|List| (|Polynomial| |TheField|))) (#1=#:G759 NIL)
          (|d| (|Polynomial| |TheField|))
          (|v|
           (|PrimitiveArray|
            (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))))
          (#2=#:G760 NIL) (|p| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| NIL . #3=(|CAD;discriminantSet;LL;5|))
                (SEQ (LETT |p| NIL . #3#) (LETT #2# |lpols| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |v|
                            (SPADCALL |p| (SPADCALL |p| (QREFELT $ 48))
                                      (QREFELT $ 51))
                            . #3#)
                      (COND
                       ((NULL (ZEROP (SPADCALL (QAREF1 |v| 0) (QREFELT $ 53))))
                        (EXIT
                         (PROGN
                          (LETT #1# (|error| "Bad discriminant") . #3#)
                          (GO #4=#:G758)))))
                      (LETT |d| (SPADCALL (QAREF1 |v| 0) (QREFELT $ 54)) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |d| (QREFELT $ 55))
                         (PROGN
                          (LETT #1# (|error| "Non Square Free polynomial")
                                . #3#)
                          (GO #4#)))
                        ((NULL (SPADCALL |d| (QREFELT $ 9)))
                         (LETT |res| (CONS |d| |res|) . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #4# (EXIT #1#)))) 

(SDEFUN |CAD;principalSubResultantSet;2SupL;6|
        ((|p| . #1=(|SparseUnivariatePolynomial| (|Polynomial| |TheField|)))
         (|q| . #2=(|SparseUnivariatePolynomial| (|Polynomial| |TheField|)))
         ($ |List| (|Polynomial| |TheField|)))
        (SPROG
         ((#3=#:G770 NIL) (#4=#:G765 NIL) (|i| NIL) (#5=#:G769 NIL)
          (|v|
           (|PrimitiveArray|
            (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))))
          (|#G27| (|SparseUnivariatePolynomial| (|Polynomial| |TheField|)))
          (|#G26| #2#) (|#G25| #1#) (|#G24| #2#))
         (SEQ
          (COND
           ((< (SPADCALL |p| (QREFELT $ 53)) (SPADCALL |q| (QREFELT $ 53)))
            (PROGN
             (LETT |#G24| |q| . #6=(|CAD;principalSubResultantSet;2SupL;6|))
             (LETT |#G25| |p| . #6#)
             (LETT |p| |#G24| . #6#)
             (LETT |q| |#G25| . #6#))))
          (COND
           ((EQL (SPADCALL |p| (QREFELT $ 53)) (SPADCALL |q| (QREFELT $ 53)))
            (PROGN
             (LETT |#G26| |q| . #6#)
             (LETT |#G27| (SPADCALL |p| |q| (QREFELT $ 57)) . #6#)
             (LETT |p| |#G26| . #6#)
             (LETT |q| |#G27| . #6#))))
          (LETT |v| (SPADCALL |p| |q| (QREFELT $ 51)) . #6#)
          (EXIT
           (PROGN
            (LETT #5# NIL . #6#)
            (SEQ (LETT |i| 0 . #6#)
                 (LETT #3#
                       (PROG1 (LETT #4# (- (QVSIZE |v|) 2) . #6#)
                         (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #4#))
                       . #6#)
                 G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #5#
                         (CONS (SPADCALL (QAREF1 |v| |i|) |i| (QREFELT $ 58))
                               #5#)
                         . #6#)))
                 (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                 (EXIT (NREVERSE #5#)))))))) 

(SDEFUN |CAD;resultantSet;LL;7|
        ((|lpols|
          . #1=(|List|
                (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))))
         ($ |List| (|Polynomial| |TheField|)))
        (SPROG
         ((|res| (|List| (|Polynomial| |TheField|))) (#2=#:G778 NIL)
          (|r| (|Polynomial| |TheField|)) (#3=#:G780 NIL) (|q| NIL)
          (|laux| #1#) (#4=#:G779 NIL) (|p| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| NIL . #5=(|CAD;resultantSet;LL;7|))
                (LETT |laux| |lpols| . #5#)
                (SEQ (LETT |p| NIL . #5#) (LETT #4# |lpols| . #5#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ (LETT |laux| (CDR |laux|) . #5#)
                          (EXIT
                           (SEQ (LETT |q| NIL . #5#) (LETT #3# |laux| . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |q| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |r|
                                       (|SPADfirst|
                                        (SPADCALL |p| |q| (QREFELT $ 59)))
                                       . #5#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |r| (QREFELT $ 55))
                                    (PROGN
                                     (LETT #2#
                                           (|error|
                                            "Non relatively prime polynomials")
                                           . #5#)
                                     (GO #6=#:G777)))
                                   ((NULL (SPADCALL |r| (QREFELT $ 9)))
                                    (LETT |res| (CONS |r| |res|) . #5#)))))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT NIL))))
                     (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #6# (EXIT #2#)))) 

(SDEFUN |CAD;projectionSet;LL;8|
        ((|lpols| |List|
          (|SparseUnivariatePolynomial| (|Polynomial| |TheField|)))
         ($ |List| (|Polynomial| |TheField|)))
        (SPROG
         ((|res| (|List| (|Polynomial| |TheField|))) (#1=#:G795 NIL) (|p| NIL)
          (|lsqfrb|
           (|List| (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))))
          (|lp1|
           (|List| (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))))
          (|f|
           (|Mapping| (|Boolean|)
                      (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))
                      (|SparseUnivariatePolynomial|
                       (|Polynomial| |TheField|))))
          (#2=#:G794 NIL) (#3=#:G793 NIL) (|c| (|Polynomial| |TheField|))
          (#4=#:G792 NIL))
         (SEQ (LETT |res| NIL . #5=(|CAD;projectionSet;LL;8|))
              (SEQ (LETT |p| NIL . #5#) (LETT #4# |lpols| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |p| (QREFELT $ 61)) . #5#)
                        (EXIT
                         (COND ((SPADCALL |c| (QREFELT $ 9)) "next p")
                               ('T (LETT |res| (CONS |c| |res|) . #5#)))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |lp1|
                    (PROGN
                     (LETT #3# NIL . #5#)
                     (SEQ (LETT |p| NIL . #5#) (LETT #2# |lpols| . #5#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |p| (CAR #2#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3# (CONS (SPADCALL |p| (QREFELT $ 62)) #3#)
                                  . #5#)))
                          (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #5#)
              (LETT |f| (CONS #'|CAD;projectionSet;LL;8!0| $) . #5#)
              (LETT |lp1| (SPADCALL |f| |lp1| (QREFELT $ 65)) . #5#)
              (LETT |lsqfrb| (SPADCALL |lp1| (QREFELT $ 67)) . #5#)
              (LETT |lsqfrb| (SPADCALL |f| |lsqfrb| (QREFELT $ 65)) . #5#)
              (SEQ (LETT |p| NIL . #5#) (LETT #1# |lp1| . #5#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res| (SPADCALL |p| (QREFELT $ 47))
                                     (QREFELT $ 68))
                           . #5#)))
                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL |res| (SPADCALL |lsqfrb| (QREFELT $ 56))
                              (QREFELT $ 68))
                    . #5#)
              (EXIT
               (SPADCALL |res| (SPADCALL |lsqfrb| (QREFELT $ 60))
                         (QREFELT $ 68)))))) 

(SDEFUN |CAD;projectionSet;LL;8!0| ((|x1| NIL) (|x2| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) (SPADCALL |x2| (QREFELT $ 53))
                  (QREFELT $ 63))) 

(DECLAIM (NOTINLINE |CylindricalAlgebraicDecompositionPackage;|)) 

(DEFUN |CylindricalAlgebraicDecompositionPackage| (#1=#:G796)
  (SPROG NIL
         (PROG (#2=#:G797)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CylindricalAlgebraicDecompositionPackage|)
                                               '|domainEqualList|)
                    . #3=(|CylindricalAlgebraicDecompositionPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|CylindricalAlgebraicDecompositionPackage;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|CylindricalAlgebraicDecompositionPackage|)))))))))) 

(DEFUN |CylindricalAlgebraicDecompositionPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|CylindricalAlgebraicDecompositionPackage|))
          (LETT |dv$| (LIST '|CylindricalAlgebraicDecompositionPackage| DV$1)
                . #1#)
          (LETT $ (GETREFV 69) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|CylindricalAlgebraicDecompositionPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|CylindricalAlgebraicDecompositionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (|Polynomial| 6) (0 . |ground?|) (|List| 24) (5 . |variables|)
              (10 . |append|) (16 . |removeDuplicates|) (21 . |sort|)
              (|List| 28) (|List| 8) |CAD;cylindricalDecomposition;LLL;2|
              |CAD;cylindricalDecomposition;LL;1| (26 . =)
              (|SparseUnivariatePolynomial| 6) (32 . |univariate|) (|List| $)
              (|List| 20) (|Symbol|) (|SimpleCell| 6 20)
              (37 . |allSimpleCells|) (|List| 25) (|Cell| 6) (43 . |makeCell|)
              (|SparseUnivariatePolynomial| $) (48 . |univariate|) (|List| 45)
              |CAD;projectionSet;LL;8| |CAD;specialise;LCL;3| (54 . |makeCell|)
              (60 . |append|) (66 . =) (|List| 6) (72 . |samplePoint|)
              (77 . |variablesOf|) (82 . |eval|) (|NonNegativeInteger|)
              (89 . |degree|) (94 . |Zero|) (|SparseUnivariatePolynomial| 8)
              (98 . |coefficients|) |CAD;coefficientSet;SupL;4|
              (103 . |differentiate|) (|PrimitiveArray| 45)
              (|SubResultantPackage| 8 45) (108 . |subresultantVector|)
              (114 . |Zero|) (118 . |degree|) (123 . |leadingCoefficient|)
              (128 . |zero?|) |CAD;discriminantSet;LL;5|
              (133 . |pseudoRemainder|) (139 . |coefficient|)
              |CAD;principalSubResultantSet;2SupL;6| |CAD;resultantSet;LL;7|
              (145 . |content|) (150 . |primitivePart|) (155 . <=)
              (|Mapping| 7 45 45) (161 . |sort|)
              (|CylindricalAlgebraicDecompositionUtilities| 8 45)
              (167 . |squareFreeBasis|) (172 . |append|))
           '#(|specialise| 178 |resultantSet| 184 |projectionSet| 189
              |principalSubResultantSet| 194 |discriminantSet| 200
              |cylindricalDecomposition| 205 |coefficientSet| 216)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 68
                                                 '(1 8 7 0 9 1 8 10 0 11 2 10 0
                                                   0 0 12 1 10 0 0 13 1 10 0 0
                                                   14 2 10 7 0 0 19 1 8 20 0 21
                                                   2 25 22 23 24 26 1 28 0 27
                                                   29 2 8 30 0 24 31 2 28 0 25
                                                   0 35 2 15 0 0 0 36 2 16 7 0
                                                   0 37 1 28 38 0 39 1 28 10 0
                                                   40 3 8 0 0 10 38 41 1 20 42
                                                   0 43 0 6 0 44 1 45 16 0 46 1
                                                   45 0 0 48 2 50 49 45 45 51 0
                                                   8 0 52 1 45 42 0 53 1 45 8 0
                                                   54 1 8 7 0 55 2 45 0 0 0 57
                                                   2 45 8 0 42 58 1 45 8 0 61 1
                                                   45 0 0 62 2 42 7 0 0 63 2 32
                                                   0 64 0 65 1 66 32 32 67 2 16
                                                   0 0 0 68 2 0 23 16 28 34 1 0
                                                   16 32 60 1 0 16 32 33 2 0 16
                                                   45 45 59 1 0 16 32 56 2 0 15
                                                   16 10 17 1 0 15 16 18 1 0 16
                                                   45 47)))))
           '|lookupComplete|)) 
