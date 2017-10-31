
(SDEFUN |RCFIELD-;sqrt;2S;1| ((|a| S) ($ S)) (SPADCALL |a| 2 (QREFELT $ 8))) 

(SDEFUN |RCFIELD-;sqrt;FS;2| ((|a| |Fraction| (|Integer|)) ($ S))
        (SPADCALL (SPADCALL |a| (QREFELT $ 11)) 2 (QREFELT $ 8))) 

(SDEFUN |RCFIELD-;sqrt;IS;3| ((|a| |Integer|) ($ S))
        (SPADCALL (SPADCALL |a| (QREFELT $ 14)) 2 (QREFELT $ 8))) 

(PUT '|RCFIELD-;characteristic;Nni;4| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |RCFIELD-;characteristic;Nni;4| (($ |NonNegativeInteger|)) 0) 

(SDEFUN |RCFIELD-;rootOf;SupPiOfU;5|
        ((|pol| |SparseUnivariatePolynomial| S) (|n| |PositiveInteger|)
         (|o| |OutputForm|) ($ |Union| S "failed"))
        (SPROG ((|r| (|Union| S "failed")))
               (SEQ
                (LETT |r| (SPADCALL |pol| |n| (QREFELT $ 20))
                      |RCFIELD-;rootOf;SupPiOfU;5|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0 (SPADCALL (QCDR |r|) |o| (QREFELT $ 22))))))))) 

(SDEFUN |RCFIELD-;rootOf;SupPiU;6|
        ((|pol| |SparseUnivariatePolynomial| S) (|n| |PositiveInteger|)
         ($ |Union| S "failed"))
        (SPROG ((|liste| (|List| S)))
               (SEQ
                (LETT |liste| (SPADCALL |pol| (QREFELT $ 25))
                      |RCFIELD-;rootOf;SupPiU;6|)
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |liste|) |n| (QREFELT $ 27))
                   (CONS 1 "failed"))
                  ('T (CONS 0 (SPADCALL |liste| |n| (QREFELT $ 29))))))))) 

(SDEFUN |RCFIELD-;sqrt;SPiS;7| ((|x| S) (|n| |PositiveInteger|) ($ S))
        (SPROG ((|r| (|Union| S "failed")))
               (SEQ
                (COND ((EQL |n| 1) |x|)
                      ((SPADCALL |x| (QREFELT $ 32)) (|spadConstant| $ 33))
                      ((SPADCALL |x| (QREFELT $ 34)) (|spadConstant| $ 31))
                      (#1='T
                       (SEQ
                        (COND
                         ((ODDP |n|)
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 31) |n|
                                            (QREFELT $ 36))
                                  (SPADCALL |x| (QREFELT $ 37)) (QREFELT $ 38))
                                 1 (QREFELT $ 20))
                                . #2=(|RCFIELD-;sqrt;SPiS;7|)))
                         (#1#
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 31) |n|
                                            (QREFELT $ 36))
                                  (SPADCALL |x| (QREFELT $ 37)) (QREFELT $ 38))
                                 2 (QREFELT $ 20))
                                . #2#)))
                        (EXIT
                         (COND ((QEQCAR |r| 1) (|error| "no roots"))
                               ((EQL |n| 2)
                                (SPADCALL (QCDR |r|)
                                          (SPADCALL
                                           (SPADCALL |x| (QREFELT $ 39))
                                           (QREFELT $ 40))
                                          (QREFELT $ 41)))
                               (#1#
                                (SPADCALL (QCDR |r|)
                                          (SPADCALL
                                           (SPADCALL |x| (QREFELT $ 39))
                                           (SPADCALL |n| (QREFELT $ 42))
                                           (QREFELT $ 43))
                                          (QREFELT $ 41))))))))))) 

(SDEFUN |RCFIELD-;^;SFS;8| ((|x| S) (|rn| |Fraction| (|Integer|)) ($ S))
        (SPROG ((#1=#:G760 NIL))
               (SPADCALL
                (SPADCALL |x| (SPADCALL |rn| (QREFELT $ 45)) (QREFELT $ 46))
                (PROG1
                    (LETT #1# (SPADCALL |rn| (QREFELT $ 47))
                          |RCFIELD-;^;SFS;8|)
                  (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                    #1#))
                (QREFELT $ 8)))) 

(SDEFUN |RCFIELD-;nthRoot;SIS;9| ((|x| S) (|n| |Integer|) ($ S))
        (SPROG ((#1=#:G764 NIL) (#2=#:G762 NIL))
               (COND ((ZEROP |n|) |x|)
                     ((MINUSP |n|)
                      (SPADCALL
                       (SPADCALL |x|
                                 (PROG1
                                     (LETT #2# (- |n|)
                                           . #3=(|RCFIELD-;nthRoot;SIS;9|))
                                   (|check_subtype2| (> #2# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #2#))
                                 (QREFELT $ 8))
                       (QREFELT $ 49)))
                     ('T
                      (SPADCALL |x|
                                (PROG1 (LETT #1# |n| . #3#)
                                  (|check_subtype2| (> #1# 0)
                                                    '(|PositiveInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 8)))))) 

(SDEFUN |RCFIELD-;allRootsOf;SupL;10|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |List| S))
        (SPADCALL (SPADCALL (ELT $ 11) |p| (QREFELT $ 54)) (QREFELT $ 25))) 

(SDEFUN |RCFIELD-;allRootsOf;SupL;11|
        ((|p| |SparseUnivariatePolynomial| (|Integer|)) ($ |List| S))
        (SPADCALL (SPADCALL (ELT $ 14) |p| (QREFELT $ 59)) (QREFELT $ 25))) 

(SDEFUN |RCFIELD-;allRootsOf;PL;12| ((|p| |Polynomial| S) ($ |List| S))
        (SPADCALL (SPADCALL |p| (QREFELT $ 62)) (QREFELT $ 25))) 

(SDEFUN |RCFIELD-;allRootsOf;PL;13|
        ((|p| |Polynomial| (|Fraction| (|Integer|))) ($ |List| S))
        (SPADCALL (SPADCALL |p| (QREFELT $ 66)) (QREFELT $ 67))) 

(SDEFUN |RCFIELD-;allRootsOf;PL;14|
        ((|p| |Polynomial| (|Integer|)) ($ |List| S))
        (SPADCALL (SPADCALL |p| (QREFELT $ 70)) (QREFELT $ 71))) 

(DECLAIM (NOTINLINE |RealClosedField&;|)) 

(DEFUN |RealClosedField&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RealClosedField&|))
          (LETT |dv$| (LIST '|RealClosedField&| DV$1) . #1#)
          (LETT $ (GETREFV 73) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RealClosedField&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|PositiveInteger|)
              (0 . |sqrt|) |RCFIELD-;sqrt;2S;1| (|Fraction| 13) (6 . |coerce|)
              |RCFIELD-;sqrt;FS;2| (|Integer|) (11 . |coerce|)
              |RCFIELD-;sqrt;IS;3| (|NonNegativeInteger|)
              |RCFIELD-;characteristic;Nni;4| (|Union| $ '"failed")
              (|SparseUnivariatePolynomial| $) (16 . |rootOf|) (|OutputForm|)
              (22 . |rename!|) |RCFIELD-;rootOf;SupPiOfU;5| (|List| $)
              (28 . |allRootsOf|) (|Boolean|) (33 . >) (|List| 6) (39 . |elt|)
              |RCFIELD-;rootOf;SupPiU;6| (45 . |One|) (49 . |zero?|)
              (54 . |Zero|) (58 . |one?|) (|SparseUnivariatePolynomial| 6)
              (63 . |monomial|) (69 . |coerce|) (74 . -) (80 . |coerce|)
              (85 . |root|) (90 . |rename|) (96 . |coerce|) (101 . |root|)
              |RCFIELD-;sqrt;SPiS;7| (107 . |numer|) (112 . ^) (118 . |denom|)
              |RCFIELD-;^;SFS;8| (123 . |inv|) |RCFIELD-;nthRoot;SIS;9|
              (|Mapping| 6 10) (|SparseUnivariatePolynomial| 10)
              (|SparseUnivariatePolynomialFunctions2| 10 6) (128 . |map|)
              |RCFIELD-;allRootsOf;SupL;10| (|Mapping| 6 13)
              (|SparseUnivariatePolynomial| 13)
              (|SparseUnivariatePolynomialFunctions2| 13 6) (134 . |map|)
              |RCFIELD-;allRootsOf;SupL;11| (|Polynomial| 6)
              (140 . |univariate|) (|Polynomial| $) |RCFIELD-;allRootsOf;PL;12|
              (|Polynomial| 10) (145 . |univariate|) (150 . |allRootsOf|)
              |RCFIELD-;allRootsOf;PL;13| (|Polynomial| 13)
              (155 . |univariate|) (160 . |allRootsOf|)
              |RCFIELD-;allRootsOf;PL;14|)
           '#(|sqrt| 165 |rootOf| 186 |nthRoot| 199 |characteristic| 205
              |allRootsOf| 209 ^ 234)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 72
                                                 '(2 6 0 0 7 8 1 6 0 10 11 1 6
                                                   0 13 14 2 6 18 19 7 20 2 6 0
                                                   0 21 22 1 6 24 19 25 2 16 26
                                                   0 0 27 2 28 6 0 13 29 0 6 0
                                                   31 1 6 26 0 32 0 6 0 33 1 6
                                                   26 0 34 2 35 0 6 16 36 1 35
                                                   0 6 37 2 35 0 0 0 38 1 6 21
                                                   0 39 1 21 0 0 40 2 6 0 0 21
                                                   41 1 7 21 0 42 2 21 0 0 0 43
                                                   1 10 13 0 45 2 6 0 0 13 46 1
                                                   10 13 0 47 1 6 0 0 49 2 53
                                                   35 51 52 54 2 58 35 56 57 59
                                                   1 61 35 0 62 1 65 52 0 66 1
                                                   6 24 52 67 1 69 57 0 70 1 6
                                                   24 57 71 1 0 0 10 12 1 0 0
                                                   13 15 2 0 0 0 7 44 1 0 0 0 9
                                                   3 0 18 19 7 21 23 2 0 18 19
                                                   7 30 2 0 0 0 13 50 0 0 16 17
                                                   1 0 24 69 72 1 0 24 63 64 1
                                                   0 24 65 68 1 0 24 57 60 1 0
                                                   24 52 55 2 0 0 0 10 48)))))
           '|lookupComplete|)) 
