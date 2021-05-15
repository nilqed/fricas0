
(SDEFUN |MONOTOOL;normalDenom;FMUP;1|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP) ($ UP))
        (QCAR
         (SPADCALL (SPADCALL |f| (QREFELT $ 9)) |derivation| (QREFELT $ 12)))) 

(SDEFUN |MONOTOOL;split;UPMR;2|
        ((|p| UP) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |normal| UP) (|:| |special| UP)))
        (SPROG
         ((|rec| (|Record| (|:| |normal| UP) (|:| |special| UP)))
          (#1=#:G387 NIL) (|pbar| (UP)))
         (SEQ
          (LETT |pbar|
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL |p| (SPADCALL |p| |derivation|)
                                     (QREFELT $ 14))
                           (SPADCALL |p| (SPADCALL |p| (QREFELT $ 15))
                                     (QREFELT $ 14))
                           (QREFELT $ 17)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                  (|Union| (QREFELT $ 7) #2="failed") #1#)))
          (EXIT
           (COND
            ((ZEROP (SPADCALL |pbar| (QREFELT $ 19)))
             (CONS |p| (|spadConstant| $ 21)))
            ('T
             (SEQ
              (LETT |rec|
                    (SPADCALL
                     (PROG2 (LETT #1# (SPADCALL |p| |pbar| (QREFELT $ 17)))
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                       (|Union| (QREFELT $ 7) #2#) #1#))
                     |derivation| (QREFELT $ 12)))
              (EXIT
               (CONS (QCAR |rec|)
                     (SPADCALL |pbar| (QCDR |rec|) (QREFELT $ 22))))))))))) 

(SDEFUN |MONOTOOL;splitSquarefree;UPMR;3|
        ((|p| UP) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |normal| (|Factored| UP))
          (|:| |special| (|Factored| UP))))
        (SPROG
         ((|n| #1=(|Factored| UP)) (|h| (UP)) (#2=#:G397 NIL) (|s| #1#)
          (|g| (UP)) (|r| (UP)) (#3=#:G404 NIL) (|rec| NIL)
          (|q| (|Factored| UP)))
         (SEQ (LETT |s| (|spadConstant| $ 24)) (LETT |n| |s|)
              (LETT |q| (SPADCALL |p| (QREFELT $ 26)))
              (SEQ (LETT |rec| NIL) (LETT #3# (SPADCALL |q| (QREFELT $ 30)))
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |rec| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (QVELT |rec| 1))
                        (LETT |g|
                              (SPADCALL |r| (SPADCALL |r| |derivation|)
                                        (QREFELT $ 14)))
                        (COND
                         ((NULL (SPADCALL |g| (QREFELT $ 32)))
                          (LETT |s|
                                (SPADCALL |s|
                                          (SPADCALL |g| (QVELT |rec| 2)
                                                    (QREFELT $ 33))
                                          (QREFELT $ 34)))))
                        (LETT |h|
                              (PROG2
                                  (LETT #2# (SPADCALL |r| |g| (QREFELT $ 17)))
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                                (|Union| (QREFELT $ 7)
                                                         "failed")
                                                #2#)))
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |h| (QREFELT $ 32)))
                           (LETT |n|
                                 (SPADCALL |n|
                                           (SPADCALL |h| (QVELT |rec| 2)
                                                     (QREFELT $ 33))
                                           (QREFELT $ 34)))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS |n|
                     (SPADCALL (SPADCALL |q| (QREFELT $ 35)) |s|
                               (QREFELT $ 36))))))) 

(SDEFUN |MONOTOOL;decompose;FMR;4|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |poly| UP) (|:| |normal| (|Fraction| UP))
          (|:| |special| (|Fraction| UP))))
        (SPROG
         ((|eeu| (|Record| (|:| |coef1| UP) (|:| |coef2| UP))) (#1=#:G411 NIL)
          (|rec| (|Record| (|:| |normal| UP) (|:| |special| UP)))
          (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP))))
         (SEQ
          (LETT |qr|
                (SPADCALL (SPADCALL |f| (QREFELT $ 39))
                          (SPADCALL |f| (QREFELT $ 9)) (QREFELT $ 41)))
          (LETT |rec|
                (SPADCALL (SPADCALL |f| (QREFELT $ 9)) |derivation|
                          (QREFELT $ 12)))
          (LETT |eeu|
                (PROG2
                    (LETT #1#
                          (SPADCALL (QCAR |rec|) (QCDR |rec|) (QCDR |qr|)
                                    (QREFELT $ 44)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record| (|:| |coef1| (QREFELT $ 7))
                                            (|:| |coef2| (QREFELT $ 7)))
                                  (|Union|
                                   (|Record| (|:| |coef1| (QREFELT $ 7))
                                             (|:| |coef2| (QREFELT $ 7)))
                                   "failed")
                                  #1#)))
          (EXIT
           (VECTOR (QCAR |qr|)
                   (SPADCALL (QCDR |eeu|) (QCAR |rec|) (QREFELT $ 45))
                   (SPADCALL (QCAR |eeu|) (QCDR |rec|) (QREFELT $ 45))))))) 

(DECLAIM (NOTINLINE |MonomialExtensionTools;|)) 

(DEFUN |MonomialExtensionTools| (&REST #1=#:G416)
  (SPROG NIL
         (PROG (#2=#:G417)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MonomialExtensionTools|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MonomialExtensionTools;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MonomialExtensionTools|)))))))))) 

(DEFUN |MonomialExtensionTools;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|MonomialExtensionTools| DV$1 DV$2))
          (LETT $ (GETREFV 48))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|MonomialExtensionTools|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|MonomialExtensionTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Fraction| 7) (0 . |denom|)
              (|Record| (|:| |normal| 7) (|:| |special| 7)) (|Mapping| 7 7)
              |MONOTOOL;split;UPMR;2| |MONOTOOL;normalDenom;FMUP;1| (5 . |gcd|)
              (11 . |differentiate|) (|Union| $ '"failed") (16 . |exquo|)
              (|NonNegativeInteger|) (22 . |degree|) (27 . |One|) (31 . |One|)
              (35 . *) (|Factored| 7) (41 . |One|) (|Factored| $)
              (45 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 27) (|:| |factor| 7) (|:| |exponent| 18))
              (|List| 28) (50 . |factorList|) (|Boolean|) (55 . |ground?|)
              (60 . |sqfrFactor|) (66 . *) (72 . |unit|) (77 . *)
              (|Record| (|:| |normal| 23) (|:| |special| 23))
              |MONOTOOL;splitSquarefree;UPMR;3| (83 . |numer|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (88 . |divide|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 42 '"failed")
              (94 . |extendedEuclidean|) (101 . /)
              (|Record| (|:| |poly| 7) (|:| |normal| 8) (|:| |special| 8))
              |MONOTOOL;decompose;FMR;4|)
           '#(|splitSquarefree| 107 |split| 113 |normalDenom| 119 |decompose|
              125)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|split|
                                 ((|Record| (|:| |normal| |#2|)
                                            (|:| |special| |#2|))
                                  |#2| (|Mapping| |#2| |#2|)))
                                T)
                              '((|splitSquarefree|
                                 ((|Record| (|:| |normal| (|Factored| |#2|))
                                            (|:| |special| (|Factored| |#2|)))
                                  |#2| (|Mapping| |#2| |#2|)))
                                T)
                              '((|normalDenom|
                                 (|#2| (|Fraction| |#2|)
                                  (|Mapping| |#2| |#2|)))
                                T)
                              '((|decompose|
                                 ((|Record| (|:| |poly| |#2|)
                                            (|:| |normal| (|Fraction| |#2|))
                                            (|:| |special| (|Fraction| |#2|)))
                                  (|Fraction| |#2|) (|Mapping| |#2| |#2|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 47
                                            '(1 8 7 0 9 2 7 0 0 0 14 1 7 0 0 15
                                              2 7 16 0 0 17 1 7 18 0 19 0 6 0
                                              20 0 7 0 21 2 7 0 0 0 22 0 23 0
                                              24 1 7 25 0 26 1 23 29 0 30 1 7
                                              31 0 32 2 23 0 7 18 33 2 23 0 0 0
                                              34 1 23 7 0 35 2 23 0 7 0 36 1 8
                                              7 0 39 2 7 40 0 0 41 3 7 43 0 0 0
                                              44 2 8 0 7 7 45 2 0 37 7 11 38 2
                                              0 10 7 11 12 2 0 7 8 11 13 2 0 46
                                              8 11 47)))))
           '|lookupComplete|)) 
