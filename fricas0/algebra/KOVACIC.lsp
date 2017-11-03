
(SDEFUN |KOVACIC;kovacic;3FU;1|
        ((|a0| |Fraction| UP) (|a1| |Fraction| UP) (|a2| |Fraction| UP)
         ($ |Union| (|SparseUnivariatePolynomial| (|Fraction| UP)) "failed"))
        (SPADCALL |a0| |a1| |a2| (ELT $ 9) (QREFELT $ 13))) 

(SDEFUN |KOVACIC;kovacic;3FMU;2|
        ((|a0| |Fraction| UP) (|a1| |Fraction| UP) (|a2| |Fraction| UP)
         (|ezfactor| |Mapping| (|Factored| UP) UP)
         ($ |Union| (|SparseUnivariatePolynomial| (|Fraction| UP)) "failed"))
        (SPROG
         ((|lf|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))))
          (|r| (|Fraction| UP)))
         (SEQ
          (LETT |r| (SPADCALL |a1| 2 (QREFELT $ 16))
                . #1=(|KOVACIC;kovacic;3FMU;2|))
          (LETT |r|
                (SPADCALL |r|
                          (SPADCALL (SPADCALL 2 |a2| (QREFELT $ 17))
                                    (SPADCALL |a1| (QREFELT $ 18))
                                    (QREFELT $ 19))
                          (QREFELT $ 20))
                . #1#)
          (LETT |r|
                (SPADCALL |r|
                          (SPADCALL (SPADCALL 2 |a1| (QREFELT $ 17))
                                    (SPADCALL |a2| (QREFELT $ 18))
                                    (QREFELT $ 19))
                          (QREFELT $ 21))
                . #1#)
          (LETT |r|
                (SPADCALL |r|
                          (SPADCALL (SPADCALL 4 |a0| (QREFELT $ 17)) |a2|
                                    (QREFELT $ 19))
                          (QREFELT $ 21))
                . #1#)
          (LETT |r|
                (SPADCALL |r|
                          (SPADCALL 4 (SPADCALL |a2| 2 (QREFELT $ 16))
                                    (QREFELT $ 17))
                          (QREFELT $ 22))
                . #1#)
          (LETT |lf|
                (SPADCALL
                 (SPADCALL (SPADCALL |r| (QREFELT $ 23)) (QREFELT $ 9))
                 (QREFELT $ 27))
                . #1#)
          (EXIT (|KOVACIC;case2| |r| |lf| |ezfactor| $))))) 

(SDEFUN |KOVACIC;case2|
        ((|r| |Fraction| UP)
         (|lf| |List|
          (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))))
         (|ezfactor| |Mapping| (|Factored| UP) UP)
         ($ |Union| (|SparseUnivariatePolynomial| (|Fraction| UP)) "failed"))
        (SPROG
         ((|b| (|Fraction| UP)) (|sol| (|List| (|Fraction| UP)))
          (|l2| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
         (SEQ
          (COND ((|KOVACIC;cannotCase2?| |lf| $) (CONS 1 "failed"))
                (#1='T
                 (SEQ
                  (LETT |l2|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 30) 3 (QREFELT $ 33))
                          (SPADCALL (SPADCALL 4 |r| (QREFELT $ 17)) 1
                                    (QREFELT $ 33))
                          (QREFELT $ 34))
                         (SPADCALL 2
                                   (SPADCALL (SPADCALL |r| (QREFELT $ 18))
                                             (QREFELT $ 35))
                                   (QREFELT $ 36))
                         (QREFELT $ 34))
                        . #2=(|KOVACIC;case2|))
                  (EXIT
                   (COND
                    ((NULL
                      (LETT |sol| (SPADCALL |l2| |ezfactor| (QREFELT $ 39))
                            . #2#))
                     (CONS 1 "failed"))
                    (#1#
                     (SEQ (LETT |b| (|SPADfirst| |sol|) . #2#)
                          (EXIT
                           (CONS 0
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 30) 2
                                             (QREFELT $ 41))
                                   (SPADCALL |b| 1 (QREFELT $ 41))
                                   (QREFELT $ 42))
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |b| (QREFELT $ 18))
                                               (SPADCALL |b| 2 (QREFELT $ 16))
                                               (QREFELT $ 20))
                                     (SPADCALL 2 |r| (QREFELT $ 17))
                                     (QREFELT $ 21))
                                    (SPADCALL 2 (QREFELT $ 44)) (QREFELT $ 22))
                                   (QREFELT $ 45))
                                  (QREFELT $ 46)))))))))))))) 

(SDEFUN |KOVACIC;cannotCase2?|
        ((|lf| |List|
          (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))))
         ($ |Boolean|))
        (SPROG ((#1=#:G754 NIL) (#2=#:G755 NIL) (#3=#:G756 NIL) (|rec| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |rec| NIL . #4=(|KOVACIC;cannotCase2?|))
                         (LETT #3# |lf| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |rec| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQL (QCDR |rec|) 2)
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# NIL . #4#) (GO #5=#:G753))
                                    . #4#)
                              (GO #6=#:G751)))
                            ((ODDP (QCDR |rec|))
                             (COND
                              ((SPADCALL (QCDR |rec|) 2 (QREFELT $ 48))
                               (PROGN
                                (LETT #1# (PROGN (LETT #2# NIL . #4#) (GO #5#))
                                      . #4#)
                                (GO #6#))))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |Kovacic;|)) 

(DEFUN |Kovacic| (&REST #1=#:G757)
  (SPROG NIL
         (PROG (#2=#:G758)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|Kovacic|)
                                               '|domainEqualList|)
                    . #3=(|Kovacic|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |Kovacic;|) #1#)
                    (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Kovacic|)))))))))) 

(DEFUN |Kovacic;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Kovacic|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|Kovacic| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 49) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Kovacic| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|Kovacic| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Factored| $) (0 . |squareFree|) (|Union| 40 '"failed")
              (|Fraction| 7) (|Mapping| 26 7) |KOVACIC;kovacic;3FMU;2|
              |KOVACIC;kovacic;3FU;1| (|PositiveInteger|) (5 . ^) (11 . *)
              (17 . |differentiate|) (22 . *) (28 . +) (34 . -) (40 . /)
              (46 . |denom|) (|Record| (|:| |factor| 7) (|:| |exponent| 43))
              (|List| 24) (|Factored| 7) (51 . |factors|) (56 . |One|)
              (60 . |One|) (64 . |One|) (|NonNegativeInteger|)
              (|LinearOrdinaryDifferentialOperator1| 11) (68 . |monomial|)
              (74 . -) (80 . |coerce|) (85 . *) (|List| 11)
              (|RationalRicDE| 6 7) (91 . |ricDsolve|)
              (|SparseUnivariatePolynomial| 11) (97 . |monomial|) (103 . -)
              (|Integer|) (109 . |coerce|) (114 . |coerce|) (119 . +)
              (|Boolean|) (125 . >))
           '#(|kovacic| 131) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 48
                                                 '(1 7 8 0 9 2 11 0 0 15 16 2
                                                   11 0 15 0 17 1 11 0 0 18 2
                                                   11 0 0 0 19 2 11 0 0 0 20 2
                                                   11 0 0 0 21 2 11 0 0 0 22 1
                                                   11 7 0 23 1 26 25 0 27 0 6 0
                                                   28 0 7 0 29 0 11 0 30 2 32 0
                                                   11 31 33 2 32 0 0 0 34 1 32
                                                   0 11 35 2 32 0 15 0 36 2 38
                                                   37 32 12 39 2 40 0 11 31 41
                                                   2 40 0 0 0 42 1 11 0 43 44 1
                                                   40 0 11 45 2 40 0 0 0 46 2
                                                   43 47 0 0 48 4 0 10 11 11 11
                                                   12 13 3 0 10 11 11 11
                                                   14)))))
           '|lookupComplete|)) 
