
(SDEFUN |INTHERTR;HermiteIntegrate;FMUPR;1|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP) (|d0| UP)
         ($ |Record| (|:| |answer| (|Fraction| UP))
          (|:| |logpart| (|Fraction| UP)) (|:| |specpart| (|Fraction| UP))
          (|:| |polypart| UP)))
        (SPROG
         ((|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|hi|
           (|Record| (|:| |answer| (|Fraction| UP)) (|:| |lognum| UP)
                     (|:| |logden| UP)))
          (|rec|
           (|Record| (|:| |poly| UP) (|:| |normal| (|Fraction| UP))
                     (|:| |special| (|Fraction| UP)))))
         (SEQ
          (LETT |rec| (SPADCALL |f| |derivation| (QREFELT $ 12))
                . #1=(|INTHERTR;HermiteIntegrate;FMUPR;1|))
          (LETT |hi|
                (|INTHERTR;normalHermiteIntegrate| (QVELT |rec| 1) |derivation|
                 |d0| $)
                . #1#)
          (LETT |qr| (SPADCALL (QVELT |hi| 1) (QVELT |hi| 2) (QREFELT $ 14))
                . #1#)
          (EXIT
           (VECTOR (QVELT |hi| 0)
                   (SPADCALL (QCDR |qr|) (QVELT |hi| 2) (QREFELT $ 15))
                   (QVELT |rec| 2)
                   (SPADCALL (QCAR |qr|) (QVELT |rec| 0) (QREFELT $ 16))))))) 

(SDEFUN |INTHERTR;HermiteIntegrate;FMR;2|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |answer| (|Fraction| UP))
          (|:| |logpart| (|Fraction| UP)) (|:| |specpart| (|Fraction| UP))
          (|:| |polypart| UP)))
        (SPADCALL |f| |derivation| (|spadConstant| $ 20) (QREFELT $ 18))) 

(SDEFUN |INTHERTR;normalHermiteIntegrate|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP) (|d0| UP)
         ($ |Record| (|:| |answer| (|Fraction| UP)) (|:| |lognum| UP)
          (|:| |logden| UP)))
        (SPROG
         ((|mult| (UP)) (|p| (UP)) (|a| (UP)) (#1=#:G708 NIL) (|qr_rem| (UP))
          (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|bc| (|Record| (|:| |coef1| UP) (|:| |coef2| UP))) (#2=#:G717 NIL)
          (|qtil| (UP)) (|qbarhat| (UP)) (|g| (UP)) (|qbar| (UP)) (|qhat| (UP))
          (|g0| (UP)) (|q| (UP)))
         (SEQ
          (LETT |a| (SPADCALL |f| (QREFELT $ 22))
                . #3=(|INTHERTR;normalHermiteIntegrate|))
          (LETT |q| (SPADCALL |f| (QREFELT $ 23)) . #3#)
          (LETT |p| (|spadConstant| $ 20) . #3#)
          (LETT |mult| (|spadConstant| $ 24) . #3#)
          (LETT |qhat|
                (PROG2
                    (LETT #1#
                          (SPADCALL |q|
                                    (LETT |g0|
                                          (LETT |g|
                                                (SPADCALL |q|
                                                          (SPADCALL |q|
                                                                    (QREFELT $
                                                                             25))
                                                          (QREFELT $ 26))
                                                . #3#)
                                          . #3#)
                                    (QREFELT $ 28))
                          . #3#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                  (|Union| (QREFELT $ 7) #4="failed") #1#))
                . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL (LETT |qbar| |g| . #3#) (QREFELT $ 30)) 0
                            (QREFELT $ 32)))
                 (GO G191)))
               (SEQ
                (LETT |qbarhat|
                      (PROG2
                          (LETT #1#
                                (SPADCALL |qbar|
                                          (LETT |g|
                                                (SPADCALL |qbar|
                                                          (SPADCALL |qbar|
                                                                    (QREFELT $
                                                                             25))
                                                          (QREFELT $ 26))
                                                . #3#)
                                          (QREFELT $ 28))
                                . #3#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) #4#) #1#))
                      . #3#)
                (LETT |qtil|
                      (SPADCALL
                       (PROG2
                           (LETT #1#
                                 (SPADCALL
                                  (SPADCALL |qhat|
                                            (SPADCALL |qbar| |derivation|)
                                            (QREFELT $ 33))
                                  |qbar| (QREFELT $ 28))
                                 . #3#)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                         (|Union| (QREFELT $ 7) #4#) #1#))
                       (QREFELT $ 34))
                      . #3#)
                (LETT |bc|
                      (PROG2
                          (LETT #2#
                                (SPADCALL |qtil| |qbarhat| |a| (QREFELT $ 37))
                                . #3#)
                          (QCDR #2#)
                        (|check_union2| (QEQCAR #2# 0)
                                        (|Record| (|:| |coef1| (QREFELT $ 7))
                                                  (|:| |coef2| (QREFELT $ 7)))
                                        (|Union|
                                         (|Record| (|:| |coef1| (QREFELT $ 7))
                                                   (|:| |coef2| (QREFELT $ 7)))
                                         "failed")
                                        #2#))
                      . #3#)
                (LETT |qr| (SPADCALL (QCAR |bc|) |qbarhat| (QREFELT $ 14))
                      . #3#)
                (LETT |qr_rem| (QCDR |qr|) . #3#)
                (LETT |a|
                      (SPADCALL
                       (SPADCALL (QCDR |bc|)
                                 (SPADCALL |qtil| (QCAR |qr|) (QREFELT $ 33))
                                 (QREFELT $ 16))
                       (SPADCALL
                        (SPADCALL (SPADCALL |qr_rem| |derivation|)
                                  (SPADCALL |d0| |qr_rem| (QREFELT $ 33))
                                  (QREFELT $ 16))
                        (PROG2
                            (LETT #1#
                                  (SPADCALL |qhat| |qbarhat| (QREFELT $ 28))
                                  . #3#)
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                          (|Union| (QREFELT $ 7) #4#) #1#))
                        (QREFELT $ 33))
                       (QREFELT $ 38))
                      . #3#)
                (LETT |p|
                      (SPADCALL |p| (SPADCALL |mult| |qr_rem| (QREFELT $ 33))
                                (QREFELT $ 16))
                      . #3#)
                (EXIT
                 (LETT |mult| (SPADCALL |mult| |qbarhat| (QREFELT $ 33))
                       . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR (SPADCALL |p| |g0| (QREFELT $ 15)) |a| |qhat|))))) 

(DECLAIM (NOTINLINE |TranscendentalHermiteIntegration;|)) 

(DEFUN |TranscendentalHermiteIntegration| (&REST #1=#:G724)
  (SPROG NIL
         (PROG (#2=#:G725)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TranscendentalHermiteIntegration|)
                                               '|domainEqualList|)
                    . #3=(|TranscendentalHermiteIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |TranscendentalHermiteIntegration;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TranscendentalHermiteIntegration|)))))))))) 

(DEFUN |TranscendentalHermiteIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|TranscendentalHermiteIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|TranscendentalHermiteIntegration| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 39) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TranscendentalHermiteIntegration|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TranscendentalHermiteIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |poly| 7) (|:| |normal| 9) (|:| |special| 9))
              (|Fraction| 7) (|Mapping| 7 7) (|MonomialExtensionTools| 6 7)
              (0 . |decompose|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (6 . |divide|)
              (12 . /) (18 . +)
              (|Record| (|:| |answer| 9) (|:| |logpart| 9) (|:| |specpart| 9)
                        (|:| |polypart| 7))
              |INTHERTR;HermiteIntegrate;FMUPR;1| (24 . |Zero|) (28 . |Zero|)
              |INTHERTR;HermiteIntegrate;FMR;2| (32 . |numer|) (37 . |denom|)
              (42 . |One|) (46 . |differentiate|) (51 . |gcd|)
              (|Union| $ '"failed") (57 . |exquo|) (|NonNegativeInteger|)
              (63 . |degree|) (|Boolean|) (68 . >) (74 . *) (80 . -)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 35 '"failed")
              (85 . |extendedEuclidean|) (92 . -))
           '#(|HermiteIntegrate| 98) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 38
                                                 '(2 11 8 9 10 12 2 7 13 0 0 14
                                                   2 9 0 7 7 15 2 7 0 0 0 16 0
                                                   6 0 19 0 7 0 20 1 9 7 0 22 1
                                                   9 7 0 23 0 7 0 24 1 7 0 0 25
                                                   2 7 0 0 0 26 2 7 27 0 0 28 1
                                                   7 29 0 30 2 29 31 0 0 32 2 7
                                                   0 0 0 33 1 7 0 0 34 3 7 36 0
                                                   0 0 37 2 7 0 0 0 38 3 0 17 9
                                                   10 7 18 2 0 17 9 10 21)))))
           '|lookupComplete|)) 
