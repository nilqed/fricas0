
(SDEFUN |NTPOLFN;cyclotomic;Nni2R;1| ((|k| |NonNegativeInteger|) (|x| R) ($ R))
        (SPROG
         ((|r| (R)) (|p| (|SparseUnivariatePolynomial| (|Integer|)))
          (|c| (|Integer|)) (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p| (SPADCALL |k| (QREFELT $ 10))
                . #1=(|NTPOLFN;cyclotomic;Nni2R;1|))
          (LETT |r| (|spadConstant| $ 11) . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 14)))
                 (GO G191)))
               (SEQ (LETT |d| (SPADCALL |p| (QREFELT $ 16)) . #1#)
                    (LETT |c| (SPADCALL |p| (QREFELT $ 17)) . #1#)
                    (LETT |p| (SPADCALL |p| (QREFELT $ 18)) . #1#)
                    (EXIT
                     (LETT |r|
                           (SPADCALL
                            (SPADCALL |c| (SPADCALL |x| |d| (QREFELT $ 19))
                                      (QREFELT $ 20))
                            |r| (QREFELT $ 21))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |NTPOLFN;eulerE;Nni2R;2| ((|k| |NonNegativeInteger|) (|x| R) ($ R))
        (SPROG
         ((|r| (R))
          (|p| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|c| (|Fraction| (|Integer|))) (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p| (SPADCALL |k| (QREFELT $ 24))
                . #1=(|NTPOLFN;eulerE;Nni2R;2|))
          (LETT |r| (|spadConstant| $ 11) . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 26)))
                 (GO G191)))
               (SEQ (LETT |d| (SPADCALL |p| (QREFELT $ 27)) . #1#)
                    (LETT |c| (SPADCALL |p| (QREFELT $ 29)) . #1#)
                    (LETT |p| (SPADCALL |p| (QREFELT $ 30)) . #1#)
                    (EXIT
                     (LETT |r|
                           (SPADCALL
                            (SPADCALL |c| (SPADCALL |x| |d| (QREFELT $ 19))
                                      (QREFELT $ 31))
                            |r| (QREFELT $ 21))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |NTPOLFN;bernoulliB;Nni2R;3| ((|k| |NonNegativeInteger|) (|x| R) ($ R))
        (SPROG
         ((|r| (R))
          (|p| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|c| (|Fraction| (|Integer|))) (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p| (SPADCALL |k| (QREFELT $ 33))
                . #1=(|NTPOLFN;bernoulliB;Nni2R;3|))
          (LETT |r| (|spadConstant| $ 11) . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 26)))
                 (GO G191)))
               (SEQ (LETT |d| (SPADCALL |p| (QREFELT $ 27)) . #1#)
                    (LETT |c| (SPADCALL |p| (QREFELT $ 29)) . #1#)
                    (LETT |p| (SPADCALL |p| (QREFELT $ 30)) . #1#)
                    (EXIT
                     (LETT |r|
                           (SPADCALL
                            (SPADCALL |c| (SPADCALL |x| |d| (QREFELT $ 19))
                                      (QREFELT $ 31))
                            |r| (QREFELT $ 21))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(DECLAIM (NOTINLINE |NumberTheoreticPolynomialFunctions;|)) 

(DEFUN |NumberTheoreticPolynomialFunctions| (#1=#:G711)
  (SPROG NIL
         (PROG (#2=#:G712)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NumberTheoreticPolynomialFunctions|)
                                               '|domainEqualList|)
                    . #3=(|NumberTheoreticPolynomialFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|NumberTheoreticPolynomialFunctions;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|NumberTheoreticPolynomialFunctions|)))))))))) 

(DEFUN |NumberTheoreticPolynomialFunctions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|NumberTheoreticPolynomialFunctions|))
          (LETT |dv$| (LIST '|NumberTheoreticPolynomialFunctions| DV$1) . #1#)
          (LETT $ (GETREFV 35) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|NumberTheoreticPolynomialFunctions|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 32
                       (CONS (|dispatchFunction| |NTPOLFN;eulerE;Nni2R;2|) $))
             (QSETREFV $ 34
                       (CONS (|dispatchFunction| |NTPOLFN;bernoulliB;Nni2R;3|)
                             $)))))
          $))) 

(MAKEPROP '|NumberTheoreticPolynomialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|SparseUnivariatePolynomial| 8) (|Integer|)
              (|PolynomialNumberTheoryFunctions|) (0 . |cyclotomic|)
              (5 . |Zero|) (9 . |Zero|) (|Boolean|) (13 . ~=)
              (|NonNegativeInteger|) (19 . |degree|)
              (24 . |leadingCoefficient|) (29 . |reductum|) (34 . ^) (40 . *)
              (46 . +) |NTPOLFN;cyclotomic;Nni2R;1|
              (|SparseUnivariatePolynomial| 28) (52 . |euler|) (57 . |Zero|)
              (61 . ~=) (67 . |degree|) (|Fraction| 8)
              (72 . |leadingCoefficient|) (77 . |reductum|) (82 . *)
              (88 . |eulerE|) (94 . |bernoulli|) (99 . |bernoulliB|))
           '#(|eulerE| 105 |cyclotomic| 111 |bernoulliB| 117) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 34
                                                 '(1 9 7 8 10 0 6 0 11 0 7 0 12
                                                   2 7 13 0 0 14 1 7 15 0 16 1
                                                   7 8 0 17 1 7 0 0 18 2 6 0 0
                                                   15 19 2 6 0 8 0 20 2 6 0 0 0
                                                   21 1 9 23 8 24 0 23 0 25 2
                                                   23 13 0 0 26 1 23 15 0 27 1
                                                   23 28 0 29 1 23 0 0 30 2 6 0
                                                   28 0 31 2 0 6 15 6 32 1 9 23
                                                   8 33 2 0 6 15 6 34 2 1 6 15
                                                   6 32 2 0 6 15 6 22 2 1 6 15
                                                   6 34)))))
           '|lookupComplete|)) 
