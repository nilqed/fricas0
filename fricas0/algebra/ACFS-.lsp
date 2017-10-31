
(SDEFUN |ACFS-;rootOf;2S;1| ((|p| S) ($ S))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |p| (QREFELT $ 9)) |ACFS-;rootOf;2S;1|))
                 (|error| "rootOf: constant expression"))
                ('T (SPADCALL |p| (|SPADfirst| |l|) (QREFELT $ 11)))))) 

(SDEFUN |ACFS-;rootsOf;SL;2| ((|p| S) ($ |List| S))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |p| (QREFELT $ 9)) |ACFS-;rootsOf;SL;2|))
                 (|error| "rootsOf: constant expression"))
                ('T (SPADCALL |p| (|SPADfirst| |l|) (QREFELT $ 14)))))) 

(SDEFUN |ACFS-;zeroOf;2S;3| ((|p| S) ($ S))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |p| (QREFELT $ 9)) |ACFS-;zeroOf;2S;3|))
                 (|error| "zeroOf: constant expression"))
                ('T (SPADCALL |p| (|SPADfirst| |l|) (QREFELT $ 16)))))) 

(SDEFUN |ACFS-;zerosOf;SL;4| ((|p| S) ($ |List| S))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |p| (QREFELT $ 9)) |ACFS-;zerosOf;SL;4|))
                 (|error| "zerosOf: constant expression"))
                ('T (SPADCALL |p| (|SPADfirst| |l|) (QREFELT $ 18)))))) 

(SDEFUN |ACFS-;zeroOf;SSS;5| ((|p| S) (|x| |Symbol|) ($ S))
        (SPROG
         ((|n| (|SparseUnivariatePolynomial| S))
          (|f| (|Fraction| (|SparseUnivariatePolynomial| S))))
         (SEQ
          (LETT |n|
                (SPADCALL
                 (LETT |f|
                       (SPADCALL |p| (SPADCALL |x| (QREFELT $ 21))
                                 (QREFELT $ 24))
                       . #1=(|ACFS-;zeroOf;SSS;5|))
                 (QREFELT $ 27))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 28)) (QREFELT $ 30))
                       0 (QREFELT $ 33))
             (|error| "zeroOf: variable appears in denom"))
            ((EQL (SPADCALL |n| (QREFELT $ 30)) 0)
             (|error| "zeroOf: constant expression"))
            ('T (SPADCALL |n| |x| (QREFELT $ 35)))))))) 

(SDEFUN |ACFS-;rootOf;SSS;6| ((|p| S) (|x| |Symbol|) ($ S))
        (SPROG
         ((|n| (|SparseUnivariatePolynomial| S))
          (|f| (|Fraction| (|SparseUnivariatePolynomial| S))))
         (SEQ
          (LETT |n|
                (SPADCALL
                 (LETT |f|
                       (SPADCALL |p| (SPADCALL |x| (QREFELT $ 21))
                                 (QREFELT $ 24))
                       . #1=(|ACFS-;rootOf;SSS;6|))
                 (QREFELT $ 27))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 28)) (QREFELT $ 30))
                       0 (QREFELT $ 33))
             (|error| "roofOf: variable appears in denom"))
            ((EQL (SPADCALL |n| (QREFELT $ 30)) 0)
             (|error| "rootOf: constant expression"))
            ('T (SPADCALL |n| |x| (QREFELT $ 37)))))))) 

(SDEFUN |ACFS-;zerosOf;SSL;7| ((|p| S) (|x| |Symbol|) ($ |List| S))
        (SPROG
         ((|n| (|SparseUnivariatePolynomial| S))
          (|f| (|Fraction| (|SparseUnivariatePolynomial| S))))
         (SEQ
          (LETT |n|
                (SPADCALL
                 (LETT |f|
                       (SPADCALL |p| (SPADCALL |x| (QREFELT $ 21))
                                 (QREFELT $ 24))
                       . #1=(|ACFS-;zerosOf;SSL;7|))
                 (QREFELT $ 27))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 28)) (QREFELT $ 30))
                       0 (QREFELT $ 33))
             (|error| "zerosOf: variable appears in denom"))
            ((EQL (SPADCALL |n| (QREFELT $ 30)) 0) NIL)
            ('T (SPADCALL |n| |x| (QREFELT $ 39)))))))) 

(SDEFUN |ACFS-;rootsOf;SSL;8| ((|p| S) (|x| |Symbol|) ($ |List| S))
        (SPROG
         ((|n| (|SparseUnivariatePolynomial| S))
          (|f| (|Fraction| (|SparseUnivariatePolynomial| S))))
         (SEQ
          (LETT |n|
                (SPADCALL
                 (LETT |f|
                       (SPADCALL |p| (SPADCALL |x| (QREFELT $ 21))
                                 (QREFELT $ 24))
                       . #1=(|ACFS-;rootsOf;SSL;8|))
                 (QREFELT $ 27))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 28)) (QREFELT $ 30))
                       0 (QREFELT $ 33))
             (|error| "roofsOf: variable appears in denom"))
            ((EQL (SPADCALL |n| (QREFELT $ 30)) 0) NIL)
            ('T (SPADCALL |n| |x| (QREFELT $ 41)))))))) 

(SDEFUN |ACFS-;rootsOf;SupSL;9|
        ((|p| |SparseUnivariatePolynomial| S) (|y| |Symbol|) ($ |List| S))
        (SPROG ((|r| (|Union| S "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 44))
                      |ACFS-;rootsOf;SupSL;9|)
                (EXIT
                 (COND
                  ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) |y| (QREFELT $ 14)))
                  ('T (SPADCALL |p| |y| (QREFELT $ 46)))))))) 

(SDEFUN |ACFS-;zerosOf;SupSL;10|
        ((|p| |SparseUnivariatePolynomial| S) (|y| |Symbol|) ($ |List| S))
        (SPROG ((|r| (|Union| S "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 44))
                      |ACFS-;zerosOf;SupSL;10|)
                (EXIT
                 (COND
                  ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) |y| (QREFELT $ 18)))
                  ('T (SPADCALL |p| |y| (QREFELT $ 48)))))))) 

(SDEFUN |ACFS-;zeroOf;SupSS;11|
        ((|p| |SparseUnivariatePolynomial| S) (|y| |Symbol|) ($ S))
        (SPROG ((|r| (|Union| S "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 44))
                      |ACFS-;zeroOf;SupSS;11|)
                (EXIT
                 (COND
                  ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) |y| (QREFELT $ 16)))
                  ('T (SPADCALL |p| |y| (QREFELT $ 50)))))))) 

(DECLAIM (NOTINLINE |AlgebraicallyClosedFunctionSpace&;|)) 

(DEFUN |AlgebraicallyClosedFunctionSpace&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|AlgebraicallyClosedFunctionSpace&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|AlgebraicallyClosedFunctionSpace&| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 53) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|AlgebraicallyClosedFunctionSpace&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 10)
              (0 . |variables|) (|Symbol|) (5 . |rootOf|) |ACFS-;rootOf;2S;1|
              (|List| $) (11 . |rootsOf|) |ACFS-;rootsOf;SL;2| (17 . |zeroOf|)
              |ACFS-;zeroOf;2S;3| (23 . |zerosOf|) |ACFS-;zerosOf;SL;4|
              (|Kernel| 6) (29 . |kernel|) (|Fraction| 34) (|Kernel| $)
              (34 . |univariate|) (|SparseUnivariatePolynomial| 6)
              (|Fraction| 25) (40 . |numer|) (45 . |denom|)
              (|NonNegativeInteger|) (50 . |degree|) (|Boolean|) (|Integer|)
              (55 . >) (|SparseUnivariatePolynomial| $) (61 . |zeroOf|)
              |ACFS-;zeroOf;SSS;5| (67 . |rootOf|) |ACFS-;rootOf;SSS;6|
              (73 . |zerosOf|) |ACFS-;zerosOf;SSL;7| (79 . |rootsOf|)
              |ACFS-;rootsOf;SSL;8| (|Union| 6 '"failed") (85 . |retractIfCan|)
              (|AlgebraicallyClosedField&| 6) (90 . |rootsOf|)
              |ACFS-;rootsOf;SupSL;9| (96 . |zerosOf|) |ACFS-;zerosOf;SupSL;10|
              (102 . |zeroOf|) |ACFS-;zeroOf;SupSS;11| (|Polynomial| $))
           '#(|zerosOf| 108 |zeroOf| 125 |rootsOf| 142 |rootOf| 159) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(1 6 8 0 9 2 6 0 0 10 11 2 6
                                                   13 0 10 14 2 6 0 0 10 16 2 6
                                                   13 0 10 18 1 20 0 10 21 2 6
                                                   22 0 23 24 1 26 25 0 27 1 26
                                                   25 0 28 1 25 29 0 30 2 32 31
                                                   0 0 33 2 6 0 34 10 35 2 6 0
                                                   34 10 37 2 6 13 34 10 39 2 6
                                                   13 34 10 41 1 25 43 0 44 2
                                                   45 13 34 10 46 2 45 13 34 10
                                                   48 2 45 0 34 10 50 2 0 13 0
                                                   10 40 1 0 13 0 19 2 0 13 34
                                                   10 49 2 0 0 0 10 36 1 0 0 0
                                                   17 2 0 0 34 10 51 2 0 13 0
                                                   10 42 1 0 13 0 15 2 0 13 34
                                                   10 47 2 0 0 0 10 38 1 0 0 0
                                                   12)))))
           '|lookupComplete|)) 
