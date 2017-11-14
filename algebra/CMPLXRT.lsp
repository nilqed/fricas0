
(SDEFUN |CMPLXRT;complexZeros;UPParL;1|
        ((|p| UP) (|eps| |Par|) ($ |List| (|Complex| |Par|)))
        (SPROG
         ((|ris| (|List| (|Complex| |Par|))) (#1=#:G743 NIL) (|z| NIL)
          (#2=#:G742 NIL) (|lz| (|List| (|List| |Par|)))
          (|p2| #3=(|Polynomial| (|Integer|))) (|p1| #3#)
          (|q| (|Polynomial| (|Complex| (|Integer|))))
          (|pp| #4=(|SparseUnivariatePolynomial| (|Complex| (|Integer|))))
          (#5=#:G741 NIL) (|pf| NIL)
          (|lpf|
           (|List| (|Record| (|:| |factor| #4#) (|:| |exponent| (|Integer|)))))
          (|np| (|SparseUnivariatePolynomial| (|Complex| (|Integer|))))
          (|vv| #6=(|Symbol|)) (|x2| #6#) (|x1| #6#))
         (SEQ
          (LETT |x1| (SPADCALL (QREFELT $ 9))
                . #7=(|CMPLXRT;complexZeros;UPParL;1|))
          (LETT |x2| (SPADCALL (QREFELT $ 9)) . #7#)
          (LETT |vv| (SPADCALL (QREFELT $ 9)) . #7#)
          (LETT |np| (SPADCALL |p| (QREFELT $ 11)) . #7#)
          (LETT |lpf| (SPADCALL (SPADCALL |np| (QREFELT $ 13)) (QREFELT $ 17))
                . #7#)
          (LETT |ris| NIL . #7#)
          (SEQ (LETT |pf| NIL . #7#) (LETT #5# |lpf| . #7#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |pf| (CAR #5#) . #7#) NIL))
                 (GO G191)))
               (SEQ (LETT |pp| (QCAR |pf|) . #7#)
                    (LETT |q| (SPADCALL |pp| |vv| (QREFELT $ 19)) . #7#)
                    (LETT |q|
                          (SPADCALL |q| |vv|
                                    (SPADCALL (SPADCALL |x1| (QREFELT $ 20))
                                              (SPADCALL
                                               (SPADCALL 0 1 (QREFELT $ 26))
                                               (SPADCALL |x2| (QREFELT $ 20))
                                               (QREFELT $ 27))
                                              (QREFELT $ 28))
                                    (QREFELT $ 29))
                          . #7#)
                    (LETT |p1| (SPADCALL (ELT $ 30) |q| (QREFELT $ 34)) . #7#)
                    (LETT |p2| (SPADCALL (ELT $ 35) |q| (QREFELT $ 34)) . #7#)
                    (LETT |lz|
                          (SPADCALL (LIST |p1| |p2|) NIL (LIST |x1| |x2|) |eps|
                                    (QREFELT $ 40))
                          . #7#)
                    (EXIT
                     (LETT |ris|
                           (SPADCALL
                            (PROGN
                             (LETT #2# NIL . #7#)
                             (SEQ (LETT |z| NIL . #7#) (LETT #1# |lz| . #7#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |z| (CAR #1#) . #7#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL (|SPADfirst| |z|)
                                                     (SPADCALL |z|
                                                               (QREFELT $ 42))
                                                     (QREFELT $ 44))
                                           #2#)
                                          . #7#)))
                                  (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            |ris| (QREFELT $ 46))
                           . #7#)))
               (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |ris|)))) 

(DECLAIM (NOTINLINE |ComplexRootPackage;|)) 

(DEFUN |ComplexRootPackage| (&REST #1=#:G744)
  (SPROG NIL
         (PROG (#2=#:G745)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ComplexRootPackage|)
                                               '|domainEqualList|)
                    . #3=(|ComplexRootPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ComplexRootPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ComplexRootPackage|)))))))))) 

(DEFUN |ComplexRootPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ComplexRootPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ComplexRootPackage| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 48) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ComplexRootPackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ComplexRootPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) (|SparseUnivariatePolynomial| 25) (4 . |makeSUP|)
              (|Factored| $) (9 . |factor|)
              (|Record| (|:| |factor| 10) (|:| |exponent| 24)) (|List| 14)
              (|Factored| 10) (14 . |factors|) (|Polynomial| 25)
              (19 . |multivariate|) (25 . |coerce|) (30 . |Zero|) (34 . |Zero|)
              (38 . |One|) (|Integer|) (|Complex| 24) (42 . |complex|) (48 . *)
              (54 . +) (60 . |eval|) (67 . |real|) (|Polynomial| 24)
              (|Mapping| 24 25) (|PolynomialFunctions2| 25 24) (72 . |map|)
              (78 . |imag|) (|List| 41) (|List| 31) (|List| 8)
              (|InnerNumericFloatSolvePackage| 24 7 7) (83 . |innerSolve|)
              (|List| 7) (91 . |second|) (|Complex| 7) (96 . |complex|)
              (|List| 43) (102 . |append|) |CMPLXRT;complexZeros;UPParL;1|)
           '#(|complexZeros| 108) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 47
                                                 '(0 8 0 9 1 6 10 0 11 1 10 12
                                                   0 13 1 16 15 0 17 2 18 0 10
                                                   8 19 1 18 0 8 20 0 6 0 21 0
                                                   7 0 22 0 6 0 23 2 25 0 24 24
                                                   26 2 18 0 25 0 27 2 18 0 0 0
                                                   28 3 18 0 0 8 0 29 1 25 24 0
                                                   30 2 33 31 32 18 34 1 25 24
                                                   0 35 4 39 36 37 37 38 7 40 1
                                                   41 7 0 42 2 43 0 7 7 44 2 45
                                                   0 0 0 46 2 0 45 6 7 47)))))
           '|lookupComplete|)) 
