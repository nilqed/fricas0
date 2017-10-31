
(SDEFUN |PADEPAC;pade;2Nni2UtsU;1|
        ((|n| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         (|u| |UnivariateTaylorSeries| R |x| |pt|)
         (|v| |UnivariateTaylorSeries| R |x| |pt|)
         ($ |Union| (|Fraction| (|UnivariatePolynomial| |x| R)) "failed"))
        (SPROG
         ((|den| (|UnivariatePolynomial| |x| R))
          (|num| (|UnivariatePolynomial| |x| R))
          (|xpt| (|UnivariatePolynomial| |x| R))
          (|ans|
           (|Union| (|Fraction| (|UnivariatePolynomial| |x| R)) "failed")))
         (SEQ
          (LETT |ans| (SPADCALL |n| |m| |u| |v| (QREFELT $ 13))
                . #1=(|PADEPAC;pade;2Nni2UtsU;1|))
          (EXIT
           (COND
            ((OR (QEQCAR |ans| 1)
                 (SPADCALL (QREFELT $ 8) (|spadConstant| $ 14) (QREFELT $ 16)))
             |ans|)
            ('T
             (SEQ (LETT |num| (SPADCALL (QCDR |ans|) (QREFELT $ 19)) . #1#)
                  (LETT |den| (SPADCALL (QCDR |ans|) (QREFELT $ 20)) . #1#)
                  (LETT |xpt|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 22))
                         (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 22))
                         (QREFELT $ 23))
                        . #1#)
                  (LETT |num| (SPADCALL |num| |xpt| (QREFELT $ 24)) . #1#)
                  (LETT |den| (SPADCALL |den| |xpt| (QREFELT $ 24)) . #1#)
                  (EXIT (CONS 0 (SPADCALL |num| |den| (QREFELT $ 25))))))))))) 

(SDEFUN |PADEPAC;pade;2NniUtsU;2|
        ((|n| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         (|u| |UnivariateTaylorSeries| R |x| |pt|)
         ($ |Union| (|Fraction| (|UnivariatePolynomial| |x| R)) "failed"))
        (SPADCALL |n| |m| |u| (|spadConstant| $ 27) (QREFELT $ 26))) 

(DECLAIM (NOTINLINE |PadeApproximantPackage;|)) 

(DEFUN |PadeApproximantPackage| (&REST #1=#:G710)
  (SPROG NIL
         (PROG (#2=#:G711)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PadeApproximantPackage|)
                                               '|domainEqualList|)
                    . #3=(|PadeApproximantPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PadeApproximantPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PadeApproximantPackage|)))))))))) 

(DEFUN |PadeApproximantPackage;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PadeApproximantPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|PadeApproximantPackage| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 29) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PadeApproximantPackage|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9
                    (|PadeApproximants| |#1|
                                        (|UnivariateTaylorSeries| |#1| |#2|
                                                                  |#3|)
                                        (|UnivariatePolynomial| |#2| |#1|)))
          $))) 

(MAKEPROP '|PadeApproximantPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|pa| (|Union| 18 '"failed")
              (|NonNegativeInteger|) (|UnivariateTaylorSeries| 6 7 8)
              (0 . |pade|) (8 . |Zero|) (|Boolean|) (12 . =)
              (|UnivariatePolynomial| 7 6) (|Fraction| 17) (18 . |numer|)
              (23 . |denom|) (28 . |One|) (32 . |monomial|) (38 . -)
              (44 . |elt|) (50 . /) |PADEPAC;pade;2Nni2UtsU;1| (56 . |One|)
              |PADEPAC;pade;2NniUtsU;2|)
           '#(|pade| 60) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(4 9 10 11 11 12 12 13 0 6 0
                                                   14 2 6 15 0 0 16 1 18 17 0
                                                   19 1 18 17 0 20 0 6 0 21 2
                                                   17 0 6 11 22 2 17 0 0 0 23 2
                                                   17 0 0 0 24 2 18 0 17 17 25
                                                   0 12 0 27 3 0 10 11 11 12 28
                                                   4 0 10 11 11 12 12 26)))))
           '|lookupComplete|)) 
