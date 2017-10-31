
(SDEFUN |PFOQ;torsion?;FdB;1|
        ((|d| |FiniteDivisor| (|Fraction| (|Integer|)) UP UPUP R)
         ($ |Boolean|))
        (QEQCAR (SPADCALL |d| (QREFELT $ 11)) 0)) 

(SDEFUN |PFOQ;ratcurve|
        ((|d| |FiniteDivisor| (|Fraction| (|Integer|)) UP UPUP R)
         (|modulus| UPUP) (|disc| |Integer|) ($ |NonNegativeInteger|))
        (SPROG
         ((|m| #1=(|NonNegativeInteger|)) (|n| #1#) (|p| (|PositiveInteger|))
          (|bad| (|Integer|)) (|r| (|Fraction| (|Integer|)))
          (|bd| (|Record| (|:| |den| (|Integer|)) (|:| |gcdnum| (|Integer|))))
          (|s| (UP)) (|b| (UP)) (|h| (UPUP)) (|hh| (R)) (|mn| (|Integer|))
          (|nm| (|Vector| R))
          (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
         (SEQ
          (LETT |mn|
                (SPADCALL
                 (LETT |nm|
                       (SPADCALL
                        (LETT |i| (SPADCALL |d| (QREFELT $ 15))
                              . #2=(|PFOQ;ratcurve|))
                        (QREFELT $ 17))
                       . #2#)
                 (QREFELT $ 19))
                . #2#)
          (LETT |h|
                (SPADCALL
                 (LETT |hh| (SPADCALL |nm| (+ |mn| 1) (QREFELT $ 22)) . #2#)
                 (QREFELT $ 23))
                . #2#)
          (LETT |s|
                (QCAR
                 (SPADCALL
                  (SPADCALL (SPADCALL |hh| (QREFELT $ 25)) (QREFELT $ 26))
                  (LETT |b|
                        (SPADCALL
                         (SPADCALL (SPADCALL |nm| |mn| (QREFELT $ 22))
                                   (QREFELT $ 27))
                         (QREFELT $ 26))
                        . #2#)
                  (QREFELT $ 29)))
                . #2#)
          (LETT |bd| (SPADCALL (SPADCALL |i| (QREFELT $ 30)) (QREFELT $ 33))
                . #2#)
          (LETT |r| (SPADCALL |s| |b| (QREFELT $ 35)) . #2#)
          (LETT |bad|
                (SPADCALL
                 (LIST |disc| (SPADCALL |r| (QREFELT $ 36))
                       (SPADCALL |r| (QREFELT $ 37))
                       (* (QCAR |bd|) (QCDR |bd|))
                       (SPADCALL |h| (QREFELT $ 38)))
                 (QREFELT $ 40))
                . #2#)
          (LETT |n|
                (|PFOQ;rat| |modulus| |d|
                 (LETT |p| (SPADCALL |bad| (QREFELT $ 42)) . #2#) $)
                . #2#)
          (EXIT
           (COND ((EQL |n| 1) |n|)
                 (#3='T
                  (SEQ
                   (LETT |m|
                         (|PFOQ;rat| |modulus| |d|
                          (SPADCALL (SPADCALL |p| |bad| (QREFELT $ 43))
                                    (QREFELT $ 42))
                          $)
                         . #2#)
                   (EXIT (COND ((EQL |n| |m|) |n|) (#3# 0)))))))))) 

(SDEFUN |PFOQ;rat|
        ((|pp| UPUP) (|d| |FiniteDivisor| (|Fraction| (|Integer|)) UP UPUP R)
         (|p| |PositiveInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| $)
                   (|ConvertibleTo| (|Integer|)))))
         (SEQ (LETT |gf| (|InnerPrimeField| |p|) |PFOQ;rat|)
              (EXIT
               (SPADCALL |d| |pp| (CONS #'|PFOQ;rat!0| (VECTOR |gf| $))
                         (|compiledLookupCheck| '|order|
                                                (LIST
                                                 (LIST '|NonNegativeInteger|)
                                                 (LIST '|FiniteDivisor|
                                                       (LIST '|Fraction|
                                                             (LIST '|Integer|))
                                                       (|devaluate| (ELT $ 6))
                                                       (|devaluate| (ELT $ 7))
                                                       (|devaluate| (ELT $ 8)))
                                                 (|devaluate| (ELT $ 7))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |gf|)
                                                       (LIST '|Fraction|
                                                             (LIST
                                                              '|Integer|))))
                                                (|ReducedDivisor|
                                                 (|Fraction| (|Integer|))
                                                 (ELT $ 6) (ELT $ 7) (ELT $ 8)
                                                 |gf|))))))) 

(SDEFUN |PFOQ;rat!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFOQ;rat|))
          (LETT |gf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |z1| (QREFELT $ 36))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (LIST '|Integer|))
                                              |gf|))
             (SPADCALL (SPADCALL |z1| (QREFELT $ 37))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (LIST '|Integer|))
                                              |gf|))
             (|compiledLookupCheck| '/ (LIST '$ '$ '$) |gf|)))))) 

(SDEFUN |PFOQ;possibleOrder|
        ((|d| |FiniteDivisor| (|Fraction| (|Integer|)) UP UPUP R)
         ($ |NonNegativeInteger|))
        (SPROG ((|r| (UPUP)))
               (SEQ
                (COND
                 ((OR (ZEROP (SPADCALL (QREFELT $ 45)))
                      (EQL
                       (QVSIZE
                        (SPADCALL (SPADCALL |d| (QREFELT $ 15))
                                  (QREFELT $ 17)))
                       1))
                  1)
                 ('T
                  (SEQ
                   (LETT |r|
                         (SPADCALL (SPADCALL (QREFELT $ 46)) (QREFELT $ 47))
                         |PFOQ;possibleOrder|)
                   (EXIT
                    (|PFOQ;ratcurve| |d| |r| (SPADCALL |r| (QREFELT $ 48))
                     $)))))))) 

(SDEFUN |PFOQ;order;FdU;5|
        ((|d| |FiniteDivisor| (|Fraction| (|Integer|)) UP UPUP R)
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (COND
                ((OR
                  (ZEROP
                   (LETT |n|
                         (|PFOQ;possibleOrder|
                          (LETT |d| (SPADCALL |d| (QREFELT $ 49))
                                . #1=(|PFOQ;order;FdU;5|))
                          $)
                         . #1#))
                  (NULL
                   (SPADCALL
                    (SPADCALL (SPADCALL |n| |d| (QREFELT $ 50)) (QREFELT $ 49))
                    (QREFELT $ 51))))
                 (CONS 1 "failed"))
                ('T (CONS 0 |n|))))) 

(SDEFUN |PFOQ;torsionIfCan;FdU;6|
        ((|d| |FiniteDivisor| (|Fraction| (|Integer|)) UP UPUP R)
         ($ |Union|
          (|Record| (|:| |order| (|NonNegativeInteger|)) (|:| |function| R))
          "failed"))
        (SPROG ((|g| (|Union| R "failed")) (|n| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((ZEROP
                   (LETT |n|
                         (|PFOQ;possibleOrder|
                          (LETT |d| (SPADCALL |d| (QREFELT $ 49))
                                . #1=(|PFOQ;torsionIfCan;FdU;6|))
                          $)
                         . #1#))
                  (CONS 1 "failed"))
                 (#2='T
                  (SEQ
                   (LETT |g|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |d| (QREFELT $ 50))
                                    (QREFELT $ 49))
                          (QREFELT $ 53))
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                          (#2# (CONS 0 (CONS |n| (QCDR |g|)))))))))))) 

(DECLAIM (NOTINLINE |PointsOfFiniteOrderRational;|)) 

(DEFUN |PointsOfFiniteOrderRational| (&REST #1=#:G740)
  (SPROG NIL
         (PROG (#2=#:G741)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PointsOfFiniteOrderRational|)
                                               '|domainEqualList|)
                    . #3=(|PointsOfFiniteOrderRational|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |PointsOfFiniteOrderRational;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PointsOfFiniteOrderRational|)))))))))) 

(DEFUN |PointsOfFiniteOrderRational;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PointsOfFiniteOrderRational|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|PointsOfFiniteOrderRational| DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 57) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PointsOfFiniteOrderRational|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PointsOfFiniteOrderRational| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Union| 44 '"failed") (|FiniteDivisor| 34 6 7 8)
              |PFOQ;order;FdU;5| (|Boolean|) |PFOQ;torsion?;FdB;1|
              (|FractionalIdeal| 6 24 7 8) (0 . |ideal|) (|Vector| 8)
              (5 . |numer|) (|Integer|) (10 . |minIndex|) (15 . |One|)
              (19 . |One|) (23 . |elt|) (29 . |lift|) (|Fraction| 6)
              (34 . |norm|) (39 . |retract|) (44 . |retract|)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (49 . |separate|) (55 . |denom|)
              (|Record| (|:| |den| 18) (|:| |gcdnum| 18))
              (|PointsOfFiniteOrderTools| 6 7) (60 . |badNum|) (|Fraction| 18)
              (65 . |resultant|) (71 . |numer|) (76 . |denom|) (81 . |badNum|)
              (|List| $) (86 . |lcm|) (|PositiveInteger|) (91 . |getGoodPrime|)
              (96 . *) (|NonNegativeInteger|) (102 . |genus|)
              (106 . |definingPolynomial|) (110 . |polyred|)
              (115 . |doubleDisc|) (120 . |reduce|) (125 . *)
              (131 . |principal?|) (|Union| 8 '"failed") (136 . |generator|)
              (|Record| (|:| |order| 44) (|:| |function| 8))
              (|Union| 54 '"failed") |PFOQ;torsionIfCan;FdU;6|)
           '#(|torsionIfCan| 141 |torsion?| 146 |order| 151) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 56
                                                 '(1 10 14 0 15 1 14 16 0 17 1
                                                   16 18 0 19 0 6 0 20 0 7 0 21
                                                   2 16 8 0 18 22 1 8 7 0 23 1
                                                   8 24 0 25 1 24 6 0 26 1 8 24
                                                   0 27 2 6 28 0 0 29 1 14 6 0
                                                   30 1 32 31 6 33 2 6 34 0 0
                                                   35 1 34 18 0 36 1 34 18 0 37
                                                   1 32 18 7 38 1 18 0 39 40 1
                                                   32 41 18 42 2 18 0 41 0 43 0
                                                   8 44 45 0 8 7 46 1 32 7 7 47
                                                   1 32 18 7 48 1 10 0 0 49 2
                                                   10 0 18 0 50 1 10 12 0 51 1
                                                   10 52 0 53 1 0 55 10 56 1 0
                                                   12 10 13 1 0 9 10 11)))))
           '|lookupComplete|)) 
