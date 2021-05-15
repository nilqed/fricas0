
(SDEFUN |UPSQFREE;squareFreePart;2P;1| ((|p| P) ($ P))
        (SPROG ((#1=#:G384 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL |p|
                                   (SPADCALL |p| (SPADCALL |p| (QREFELT $ 8))
                                             (QREFELT $ 9))
                                   (QREFELT $ 11)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                 (|Union| (QREFELT $ 7) "failed") #1#)))) 

(SDEFUN |UPSQFREE;squareFreePart;2P;2| ((|p| P) ($ P))
        (SPROG
         ((#1=#:G389 NIL) (#2=#:G388 (P)) (#3=#:G390 (P)) (#4=#:G392 NIL)
          (|f| NIL) (|s| (|Factored| P)))
         (SEQ
          (SPADCALL
           (SPADCALL (LETT |s| (SPADCALL |p| (QREFELT $ 14))) (QREFELT $ 15))
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |f| NIL) (LETT #4# (SPADCALL |s| (QREFELT $ 19))) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3# (QVELT |f| 1))
                    (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 20))))
                          ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 21))))
           (QREFELT $ 20))))) 

(SDEFUN |UPSQFREE;BumInSepFFE;2R;3|
        ((|ffe| |Record|
          (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
          (|:| |factor| P) (|:| |exponent| (|NonNegativeInteger|)))
         ($ |Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| P)
          (|:| |exponent| (|NonNegativeInteger|))))
        (VECTOR (CONS 1 "sqfr")
                (SPADCALL (ELT $ 22) (QVELT |ffe| 1) (QREFELT $ 24))
                (* (SPADCALL (QREFELT $ 26)) (QVELT |ffe| 2)))) 

(SDEFUN |UPSQFREE;BumInSepFFE;2R;4|
        ((|ffe| |Record|
          (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
          (|:| |factor| P) (|:| |exponent| (|NonNegativeInteger|)))
         ($ |Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| P)
          (|:| |exponent| (|NonNegativeInteger|))))
        (SPROG ((|nthrp| (|Union| P "failed")) (|np| (P)))
               (SEQ
                (LETT |np|
                      (SPADCALL (QVELT |ffe| 1) (SPADCALL (QREFELT $ 26))
                                (QREFELT $ 28)))
                (LETT |nthrp| (SPADCALL |np| (QREFELT $ 29)))
                (EXIT
                 (COND
                  ((QEQCAR |nthrp| 1)
                   (VECTOR (CONS 0 "nil") |np| (QVELT |ffe| 2)))
                  ('T
                   (VECTOR (CONS 1 "sqfr") (QCDR |nthrp|)
                           (* (SPADCALL (QREFELT $ 26)) (QVELT |ffe| 2))))))))) 

(SDEFUN |UPSQFREE;BumInSepFFE;2R;5|
        ((|ffe| |Record|
          (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
          (|:| |factor| P) (|:| |exponent| (|NonNegativeInteger|)))
         ($ |Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| P)
          (|:| |exponent| (|NonNegativeInteger|))))
        (VECTOR (CONS 0 "nil")
                (SPADCALL (QVELT |ffe| 1) (SPADCALL (QREFELT $ 26))
                          (QREFELT $ 28))
                (QVELT |ffe| 2))) 

(SDEFUN |UPSQFREE;squareFree;PF;6| ((|p| P) ($ |Factored| P))
        (SPROG
         ((#1=#:G439 NIL)
          (|lffe|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|lcp| (RC)) (#2=#:G431 NIL) (|i| (|NonNegativeInteger|)) (|pi| (P))
          (|di| (P)) (#3=#:G428 NIL) (|ci| (P)) (|a| (P)) (|c| (P)) (|u| (P))
          (|#G11|
           (|Record| (|:| |unit| P) (|:| |canonical| P) (|:| |associate| P))))
         (SEQ (LETT |ci| |p|) (LETT |di| (SPADCALL |p| (QREFELT $ 8)))
              (LETT |pi| (SPADCALL |ci| |di| (QREFELT $ 9)))
              (EXIT
               (COND
                ((EQL (SPADCALL |pi| (QREFELT $ 30)) 0)
                 (SEQ
                  (PROGN
                   (LETT |#G11| (SPADCALL |p| (QREFELT $ 33)))
                   (LETT |u| (QVELT |#G11| 0))
                   (LETT |c| (QVELT |#G11| 1))
                   (LETT |a| (QVELT |#G11| 2))
                   |#G11|)
                  (EXIT
                   (SPADCALL |u| (LIST (VECTOR (CONS 1 "sqfr") |c| 1))
                             (QREFELT $ 35)))))
                ('T
                 (SEQ (LETT |i| 0) (LETT |lffe| NIL)
                      (LETT |lcp| (SPADCALL |p| (QREFELT $ 36)))
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL (SPADCALL |ci| (QREFELT $ 30)) 0
                                        (QREFELT $ 38)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ
                              (LETT |ci|
                                    (PROG2
                                        (LETT #3#
                                              (SPADCALL |ci| |pi|
                                                        (QREFELT $ 11)))
                                        (QCDR #3#)
                                      (|check_union2| (QEQCAR #3# 0)
                                                      (QREFELT $ 7)
                                                      (|Union| (QREFELT $ 7)
                                                               #4="failed")
                                                      #3#)))
                              (LETT |di|
                                    (SPADCALL
                                     (PROG2
                                         (LETT #3#
                                               (SPADCALL |di| |pi|
                                                         (QREFELT $ 11)))
                                         (QCDR #3#)
                                       (|check_union2| (QEQCAR #3# 0)
                                                       (QREFELT $ 7)
                                                       (|Union| (QREFELT $ 7)
                                                                #4#)
                                                       #3#))
                                     (SPADCALL |ci| (QREFELT $ 8))
                                     (QREFELT $ 39)))
                              (LETT |pi| (SPADCALL |ci| |di| (QREFELT $ 9)))
                              (LETT |i| (+ |i| 1))
                              (EXIT
                               (COND
                                ((> (SPADCALL |pi| (QREFELT $ 30)) 0)
                                 (PROGN
                                  (LETT #1#
                                        (SEQ
                                         (LETT |lcp|
                                               (PROG2
                                                   (LETT #2#
                                                         (SPADCALL |lcp|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |pi|
                                                                     (QREFELT $
                                                                              36))
                                                                    |i|
                                                                    (QREFELT $
                                                                             40))
                                                                   (QREFELT $
                                                                            41)))
                                                   (QCDR #2#)
                                                 (|check_union2| (QEQCAR #2# 0)
                                                                 (QREFELT $ 6)
                                                                 (|Union|
                                                                  (QREFELT $ 6)
                                                                  #4#)
                                                                 #2#)))
                                         (EXIT
                                          (LETT |lffe|
                                                (CONS
                                                 (VECTOR (CONS 1 "sqfr") |pi|
                                                         |i|)
                                                 |lffe|)))))
                                  (GO #5=#:G434)))))))
                            #5# (EXIT #1#))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (SPADCALL (SPADCALL |lcp| (QREFELT $ 42)) |lffe|
                                 (QREFELT $ 35)))))))))) 

(SDEFUN |UPSQFREE;squareFree;PF;7| ((|p| P) ($ |Factored| P))
        (SPROG
         ((|lffe|
           (|List|
            (|Record|
             (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
             (|:| |factor| P) (|:| |exponent| (|NonNegativeInteger|)))))
          (|lsnil|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#5=#:G464 NIL) (|ffe| NIL) (#6=#:G463 NIL)
          (|redSqfr| (|Factored| P)) (#7=#:G449 NIL) (|dunit| (P)) (|pi| (P))
          (|lc| (RC)) (#8=#:G452 NIL) (|i| (|NonNegativeInteger|)) (|ci| (P))
          (|di| (P)) (|diprev| (P)) (|a| (P)) (|c| (P)) (|u| (P))
          (|#G13|
           (|Record| (|:| |unit| P) (|:| |canonical| P) (|:| |associate| P))))
         (SEQ
          (LETT |ci| (SPADCALL |p| (SPADCALL |p| (QREFELT $ 8)) (QREFELT $ 9)))
          (EXIT
           (COND
            ((EQL (SPADCALL |ci| (QREFELT $ 30)) 0)
             (SEQ
              (PROGN
               (LETT |#G13| (SPADCALL |p| (QREFELT $ 33)))
               (LETT |u| (QVELT |#G13| 0))
               (LETT |c| (QVELT |#G13| 1))
               (LETT |a| (QVELT |#G13| 2))
               |#G13|)
              (EXIT
               (SPADCALL |u| (LIST (VECTOR (CONS 1 "sqfr") |c| 1))
                         (QREFELT $ 35)))))
            (#9='T
             (SEQ
              (LETT |di|
                    (PROG2 (LETT #7# (SPADCALL |p| |ci| (QREFELT $ 11)))
                        (QCDR #7#)
                      (|check_union2| (QEQCAR #7# 0) (QREFELT $ 7)
                                      (|Union| (QREFELT $ 7) #10="failed")
                                      #7#)))
              (LETT |i| 0) (LETT |lffe| NIL)
              (LETT |dunit| (|spadConstant| $ 21))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |di| (QREFELT $ 30)) 0
                                (QREFELT $ 38)))
                     (GO G191)))
                   (SEQ (LETT |diprev| |di|)
                        (LETT |di| (SPADCALL |ci| |di| (QREFELT $ 9)))
                        (LETT |ci|
                              (PROG2
                                  (LETT #7#
                                        (SPADCALL |ci| |di| (QREFELT $ 11)))
                                  (QCDR #7#)
                                (|check_union2| (QEQCAR #7# 0) (QREFELT $ 7)
                                                (|Union| (QREFELT $ 7) #10#)
                                                #7#)))
                        (LETT |i| (+ |i| 1))
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |diprev| (QREFELT $ 30))
                                (SPADCALL |di| (QREFELT $ 30)))
                           (SEQ
                            (LETT |lc|
                                  (PROG2
                                      (LETT #8#
                                            (SPADCALL
                                             (SPADCALL |diprev| (QREFELT $ 36))
                                             (SPADCALL |di| (QREFELT $ 36))
                                             (QREFELT $ 41)))
                                      (QCDR #8#)
                                    (|check_union2| (QEQCAR #8# 0)
                                                    (QREFELT $ 6)
                                                    (|Union| (QREFELT $ 6)
                                                             #10#)
                                                    #8#)))
                            (EXIT
                             (LETT |dunit|
                                   (SPADCALL (SPADCALL |lc| |i| (QREFELT $ 40))
                                             |dunit| (QREFELT $ 43))))))
                          ('T
                           (SEQ
                            (LETT |pi|
                                  (PROG2
                                      (LETT #7#
                                            (SPADCALL |diprev| |di|
                                                      (QREFELT $ 11)))
                                      (QCDR #7#)
                                    (|check_union2| (QEQCAR #7# 0)
                                                    (QREFELT $ 7)
                                                    (|Union| (QREFELT $ 7)
                                                             #10#)
                                                    #7#)))
                            (EXIT
                             (LETT |lffe|
                                   (CONS (VECTOR (CONS 1 "sqfr") |pi| |i|)
                                         |lffe|))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |dunit|
                    (SPADCALL |dunit| (SPADCALL |di| (+ |i| 1) (QREFELT $ 44))
                              (QREFELT $ 20)))
              (EXIT
               (COND
                ((EQL (SPADCALL |ci| (QREFELT $ 30)) 0)
                 (SPADCALL (SPADCALL |dunit| |ci| (QREFELT $ 20)) |lffe|
                           (QREFELT $ 35)))
                (#9#
                 (SEQ
                  (LETT |redSqfr|
                        (SPADCALL
                         (PROG2
                             (LETT #7#
                                   (SPADCALL |ci| (SPADCALL (QREFELT $ 26))
                                             (QREFELT $ 45)))
                             (QCDR #7#)
                           (|check_union2| (QEQCAR #7# 0) (QREFELT $ 7)
                                           (|Union| (QREFELT $ 7) #10#) #7#))
                         (QREFELT $ 14)))
                  (LETT |lsnil|
                        (PROGN
                         (LETT #6# NIL)
                         (SEQ (LETT |ffe| NIL)
                              (LETT #5# (SPADCALL |redSqfr| (QREFELT $ 19)))
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |ffe| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS (SPADCALL |ffe| (QREFELT $ 27))
                                            #6#))))
                              (LETT #5# (CDR #5#)) (GO G190) G191
                              (EXIT (NREVERSE #6#)))))
                  (LETT |lffe| (SPADCALL |lsnil| |lffe| (QREFELT $ 46)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL |dunit| (SPADCALL |redSqfr| (QREFELT $ 15))
                              (QREFELT $ 20))
                    |lffe| (QREFELT $ 35)))))))))))))) 

(DECLAIM (NOTINLINE |UnivariatePolynomialSquareFree;|)) 

(DEFUN |UnivariatePolynomialSquareFree| (&REST #1=#:G465)
  (SPROG NIL
         (PROG (#2=#:G466)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePolynomialSquareFree|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |UnivariatePolynomialSquareFree;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariatePolynomialSquareFree|)))))))))) 

(DEFUN |UnivariatePolynomialSquareFree;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|UnivariatePolynomialSquareFree| DV$1 DV$2))
          (LETT $ (GETREFV 47))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|UnivariatePolynomialSquareFree|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|CharacteristicZero|))
            (QSETREFV $ 12
                      (CONS (|dispatchFunction| |UPSQFREE;squareFreePart;2P;1|)
                            $)))
           ('T
            (QSETREFV $ 12
                      (CONS (|dispatchFunction| |UPSQFREE;squareFreePart;2P;2|)
                            $))))
          (COND
           ((|HasCategory| |#1| '(|FiniteFieldCategory|))
            (QSETREFV $ 27
                      (CONS (|dispatchFunction| |UPSQFREE;BumInSepFFE;2R;3|)
                            $)))
           ((|HasCategory| |#1| '(|CharacteristicNonZero|))
            (QSETREFV $ 27
                      (CONS (|dispatchFunction| |UPSQFREE;BumInSepFFE;2R;4|)
                            $)))
           ('T
            (QSETREFV $ 27
                      (CONS (|dispatchFunction| |UPSQFREE;BumInSepFFE;2R;5|)
                            $))))
          (COND
           ((|HasCategory| |#1| '(|CharacteristicZero|))
            (QSETREFV $ 14
                      (CONS (|dispatchFunction| |UPSQFREE;squareFree;PF;6|)
                            $)))
           ('T
            (QSETREFV $ 14
                      (CONS (|dispatchFunction| |UPSQFREE;squareFree;PF;7|)
                            $))))
          $))) 

(MAKEPROP '|UnivariatePolynomialSquareFree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |differentiate|) (5 . |gcd|) (|Union| $ '"failed")
              (11 . |exquo|) (17 . |squareFreePart|) (|Factored| 7)
              (22 . |squareFree|) (27 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 16) (|:| |factor| 7) (|:| |exponent| 25))
              (|List| 17) (32 . |factorList|) (37 . *) (43 . |One|)
              (47 . |charthRoot|) (|Mapping| 6 6) (52 . |map|)
              (|NonNegativeInteger|) (58 . |characteristic|)
              (62 . |BumInSepFFE|) (67 . |multiplyExponents|)
              (73 . |charthRoot|) (78 . |degree|) (83 . |Zero|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (87 . |unitNormal|) (92 . |One|) (96 . |makeFR|)
              (102 . |leadingCoefficient|) (|Boolean|) (107 . ~=) (113 . -)
              (119 . ^) (125 . |exquo|) (131 . |coerce|) (136 . *) (142 . ^)
              (148 . |divideExponents|) (154 . |append|))
           '#(|squareFreePart| 160 |squareFree| 165 |BumInSepFFE| 170) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|squareFree| ((|Factored| |#2|) |#2|)) T)
                                   '((|squareFreePart| (|#2| |#2|)) T)
                                   '((|BumInSepFFE|
                                      ((|Record|
                                        (|:| |flag|
                                             (|Union| #1="nil" #2="sqfr"
                                                      #3="irred" #4="prime"))
                                        (|:| |factor| |#2|)
                                        (|:| |exponent|
                                             (|NonNegativeInteger|)))
                                       (|Record|
                                        (|:| |flag| (|Union| #1# #2# #3# #4#))
                                        (|:| |factor| |#2|)
                                        (|:| |exponent|
                                             (|NonNegativeInteger|)))))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 46
                                            '(1 7 0 0 8 2 7 0 0 0 9 2 7 10 0 0
                                              11 1 0 7 7 12 1 0 13 7 14 1 13 7
                                              0 15 1 13 18 0 19 2 7 0 0 0 20 0
                                              7 0 21 1 6 0 0 22 2 7 0 23 0 24 0
                                              7 25 26 1 0 17 17 27 2 7 0 0 25
                                              28 1 7 10 0 29 1 7 25 0 30 0 6 0
                                              31 1 7 32 0 33 0 6 0 34 2 13 0 7
                                              18 35 1 7 6 0 36 2 25 37 0 0 38 2
                                              7 0 0 0 39 2 6 0 0 25 40 2 6 10 0
                                              0 41 1 7 0 6 42 2 7 0 6 0 43 2 7
                                              0 0 25 44 2 7 10 0 25 45 2 18 0 0
                                              0 46 1 0 7 7 12 1 0 13 7 14 1 0
                                              17 17 27)))))
           '|lookupComplete|)) 
