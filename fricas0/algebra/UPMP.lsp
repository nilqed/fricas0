
(SDEFUN |UPMP;noKaratsuba;3U;1| ((|a| U) (|b| U) ($ U))
        (SPROG ((|res| (U)) (#1=#:G725 NIL) (|u| NIL) (|lu| (|List| U)))
               (SEQ
                (COND ((SPADCALL |a| (QREFELT $ 9)) |a|)
                      ((SPADCALL |b| (QREFELT $ 9)) |b|)
                      ((ZEROP (SPADCALL |a| (QREFELT $ 11)))
                       (SPADCALL (SPADCALL |a| (QREFELT $ 12)) |b|
                                 (QREFELT $ 13)))
                      ((ZEROP (SPADCALL |b| (QREFELT $ 11)))
                       (SPADCALL |a| (SPADCALL |b| (QREFELT $ 12))
                                 (QREFELT $ 14)))
                      ('T
                       (SEQ
                        (LETT |lu| (REVERSE (SPADCALL |a| (QREFELT $ 16)))
                              . #2=(|UPMP;noKaratsuba;3U;1|))
                        (LETT |res| (|spadConstant| $ 17) . #2#)
                        (SEQ (LETT |u| NIL . #2#) (LETT #1# |lu| . #2#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |u| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |res|
                                     (SPADCALL |res|
                                               (SPADCALL |u| (QREFELT $ 12))
                                               (SPADCALL |u| (QREFELT $ 11))
                                               |b| (QREFELT $ 18))
                                     . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(SDEFUN |UPMP;karatsubaOnce;3U;2| ((|a| U) (|b| U) ($ U))
        (SPROG
         ((|w| (U)) (|v| (U)) (|u| (U)) (|lb| (U)) (|hb| (U))
          (|rec| (|Record| (|:| |quotient| U) (|:| |remainder| U))) (|la| (U))
          (|ha| (U)) (|n| (|NonNegativeInteger|)) (|d| (|NonNegativeInteger|))
          (|db| #1=(|NonNegativeInteger|)) (|da| #1#))
         (SEQ
          (LETT |da| (SPADCALL |a| (QREFELT $ 20))
                . #2=(|UPMP;karatsubaOnce;3U;2|))
          (LETT |db| (SPADCALL |b| (QREFELT $ 20)) . #2#)
          (COND
           ((NULL (ZEROP |da|))
            (LETT |a| (SPADCALL |a| |da| (QREFELT $ 21)) . #2#)))
          (COND
           ((NULL (ZEROP |db|))
            (LETT |b| (SPADCALL |b| |db| (QREFELT $ 21)) . #2#)))
          (LETT |d| (+ |da| |db|) . #2#)
          (LETT |n|
                (QUOTIENT2
                 (MIN (SPADCALL |a| (QREFELT $ 11))
                      (SPADCALL |b| (QREFELT $ 11)))
                 2)
                . #2#)
          (LETT |rec| (SPADCALL |a| |n| (QREFELT $ 23)) . #2#)
          (LETT |ha| (QCAR |rec|) . #2#) (LETT |la| (QCDR |rec|) . #2#)
          (LETT |rec| (SPADCALL |b| |n| (QREFELT $ 23)) . #2#)
          (LETT |hb| (QCAR |rec|) . #2#) (LETT |lb| (QCDR |rec|) . #2#)
          (LETT |w|
                (SPADCALL (SPADCALL |ha| |la| (QREFELT $ 24))
                          (SPADCALL |lb| |hb| (QREFELT $ 24)) (QREFELT $ 25))
                . #2#)
          (LETT |u| (SPADCALL |la| |lb| (QREFELT $ 25)) . #2#)
          (LETT |v| (SPADCALL |ha| |hb| (QREFELT $ 25)) . #2#)
          (LETT |w|
                (SPADCALL |w| (SPADCALL |u| |v| (QREFELT $ 26)) (QREFELT $ 26))
                . #2#)
          (LETT |w|
                (SPADCALL (SPADCALL |w| |n| (QREFELT $ 27)) |u| (QREFELT $ 26))
                . #2#)
          (EXIT
           (COND
            ((ZEROP |d|)
             (SPADCALL
              (SPADCALL |v| (SPADCALL 2 |n| (QREFELT $ 29)) (QREFELT $ 27)) |w|
              (QREFELT $ 26)))
            ('T
             (SPADCALL
              (SPADCALL |v| (+ (SPADCALL 2 |n| (QREFELT $ 29)) |d|)
                        (QREFELT $ 27))
              (SPADCALL |w| |d| (QREFELT $ 27)) (QREFELT $ 26)))))))) 

(SDEFUN |UPMP;karatsuba;2U2NniU;3|
        ((|a| U) (|b| U) (|l| |NonNegativeInteger|) (|k| |NonNegativeInteger|)
         ($ U))
        (SPROG
         ((|w| (U)) (|v| (U)) (|u| (U)) (|lb| (U)) (|hb| (U))
          (|rec| (|Record| (|:| |quotient| U) (|:| |remainder| U))) (|la| (U))
          (|ha| (U)) (#1=#:G734 NIL) (|n| (|NonNegativeInteger|))
          (|d| (|NonNegativeInteger|)) (|db| #2=(|NonNegativeInteger|))
          (|da| #2#))
         (SEQ
          (COND
           ((OR (ZEROP |k|)
                (OR (< (SPADCALL |a| (QREFELT $ 11)) |l|)
                    (OR (< (SPADCALL |b| (QREFELT $ 11)) |l|)
                        (OR (< (SPADCALL |a| (QREFELT $ 31)) |l|)
                            (< (SPADCALL |b| (QREFELT $ 31)) |l|)))))
            (SPADCALL |a| |b| (QREFELT $ 19)))
           ('T
            (SEQ
             (LETT |da| (SPADCALL |a| (QREFELT $ 20))
                   . #3=(|UPMP;karatsuba;2U2NniU;3|))
             (LETT |db| (SPADCALL |b| (QREFELT $ 20)) . #3#)
             (COND
              ((NULL (ZEROP |da|))
               (LETT |a| (SPADCALL |a| |da| (QREFELT $ 21)) . #3#)))
             (COND
              ((NULL (ZEROP |db|))
               (LETT |b| (SPADCALL |b| |db| (QREFELT $ 21)) . #3#)))
             (LETT |d| (+ |da| |db|) . #3#)
             (LETT |n|
                   (QUOTIENT2
                    (MIN (SPADCALL |a| (QREFELT $ 11))
                         (SPADCALL |b| (QREFELT $ 11)))
                    2)
                   . #3#)
             (LETT |k|
                   (PROG2 (LETT #1# (SPADCALL |k| 1 (QREFELT $ 35)) . #3#)
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                     (|Union| (|NonNegativeInteger|) "failed")
                                     #1#))
                   . #3#)
             (LETT |rec| (SPADCALL |a| |n| (QREFELT $ 23)) . #3#)
             (LETT |ha| (QCAR |rec|) . #3#) (LETT |la| (QCDR |rec|) . #3#)
             (LETT |rec| (SPADCALL |b| |n| (QREFELT $ 23)) . #3#)
             (LETT |hb| (QCAR |rec|) . #3#) (LETT |lb| (QCDR |rec|) . #3#)
             (LETT |w|
                   (SPADCALL (SPADCALL |ha| |la| (QREFELT $ 24))
                             (SPADCALL |lb| |hb| (QREFELT $ 24)) |l| |k|
                             (QREFELT $ 36))
                   . #3#)
             (LETT |u| (SPADCALL |la| |lb| |l| |k| (QREFELT $ 36)) . #3#)
             (LETT |v| (SPADCALL |ha| |hb| |l| |k| (QREFELT $ 36)) . #3#)
             (LETT |w|
                   (SPADCALL |w| (SPADCALL |u| |v| (QREFELT $ 26))
                             (QREFELT $ 26))
                   . #3#)
             (LETT |w|
                   (SPADCALL (SPADCALL |w| |n| (QREFELT $ 27)) |u|
                             (QREFELT $ 26))
                   . #3#)
             (EXIT
              (COND
               ((ZEROP |d|)
                (SPADCALL
                 (SPADCALL |v| (SPADCALL 2 |n| (QREFELT $ 29)) (QREFELT $ 27))
                 |w| (QREFELT $ 26)))
               ('T
                (SPADCALL
                 (SPADCALL |v| (+ (SPADCALL 2 |n| (QREFELT $ 29)) |d|)
                           (QREFELT $ 27))
                 (SPADCALL |w| |d| (QREFELT $ 27)) (QREFELT $ 26))))))))))) 

(DECLAIM (NOTINLINE |UnivariatePolynomialMultiplicationPackage;|)) 

(DEFUN |UnivariatePolynomialMultiplicationPackage| (&REST #1=#:G744)
  (SPROG NIL
         (PROG (#2=#:G745)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePolynomialMultiplicationPackage|)
                                               '|domainEqualList|)
                    . #3=(|UnivariatePolynomialMultiplicationPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |UnivariatePolynomialMultiplicationPackage;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariatePolynomialMultiplicationPackage|)))))))))) 

(DEFUN |UnivariatePolynomialMultiplicationPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|UnivariatePolynomialMultiplicationPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$|
                (LIST '|UnivariatePolynomialMultiplicationPackage| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 37) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|UnivariatePolynomialMultiplicationPackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|UnivariatePolynomialMultiplicationPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |zero?|) (|NonNegativeInteger|) (5 . |degree|)
              (10 . |leadingCoefficient|) (15 . *) (21 . *) (|List| $)
              (27 . |monomials|) (32 . |Zero|) (36 . |pomopo!|)
              |UPMP;noKaratsuba;3U;1| (44 . |minimumDegree|)
              (49 . |shiftRight|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (55 . |karatsubaDivide|) (61 . -) (67 . *) (73 . +)
              (79 . |shiftLeft|) (|PositiveInteger|) (85 . *)
              |UPMP;karatsubaOnce;3U;2| (91 . |numberOfMonomials|) (96 . |One|)
              (100 . |One|) (|Union| $ '"failed") (104 . |subtractIfCan|)
              |UPMP;karatsuba;2U2NniU;3|)
           '#(|noKaratsuba| 110 |karatsubaOnce| 116 |karatsuba| 122) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 36
                                                 '(1 7 8 0 9 1 7 10 0 11 1 7 6
                                                   0 12 2 7 0 6 0 13 2 7 0 0 6
                                                   14 1 7 15 0 16 0 7 0 17 4 7
                                                   0 0 6 10 0 18 1 7 10 0 20 2
                                                   7 0 0 10 21 2 7 22 0 10 23 2
                                                   7 0 0 0 24 2 7 0 0 0 25 2 7
                                                   0 0 0 26 2 7 0 0 10 27 2 10
                                                   0 28 0 29 1 7 10 0 31 0 6 0
                                                   32 0 7 0 33 2 10 34 0 0 35 2
                                                   0 7 7 7 19 2 0 7 7 7 30 4 0
                                                   7 7 7 10 10 36)))))
           '|lookupComplete|)) 
