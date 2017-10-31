
(SDEFUN |INTHERAL;HermiteIntegrate;RMR;1|
        ((|f| R) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |answer| R) (|:| |logpart| R)))
        (SPADCALL |f| |derivation| (|spadConstant| $ 12) (QREFELT $ 15))) 

(SDEFUN |INTHERAL;HermiteIntegrate;RMRR;2|
        ((|f| R) (|derivation| |Mapping| UP UP) (|d0| R)
         ($ |Record| (|:| |answer| R) (|:| |logpart| R)))
        (SPROG
         ((|iden| (UP)) (|inum| #1=(|Vector| UP)) (#2=#:G710 NIL)
          (#3=#:G936 NIL) (#4=#:G938 NIL) (|i| NIL) (#5=#:G937 NIL)
          (|ratform| (R)) (#6=#:G924 NIL) (|cnum| #1#)
          (|corr| #7=(|Record| (|:| |num| #1#) (|:| |den| UP))) (|s0| (R))
          (|sol| (|Vector| UP)) (|p| (UP)) (|j| (|Integer|)) (|nn| (|Integer|))
          (|sys| (|Matrix| UP)) (|u'| (UP)) (|u| (UP)) (#8=#:G922 NIL)
          (|v| (UP)) (#9=#:G935 NIL) (|trm| NIL) (|coef| (UP)) (|e| (UP))
          (|cform| #7#) (|m| (|Matrix| UP))
          (|mat| (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
          (|n| (|PositiveInteger|)))
         (SEQ
          (LETT |ratform| (|spadConstant| $ 12)
                . #10=(|INTHERAL;HermiteIntegrate;RMRR;2|))
          (LETT |n| (SPADCALL (QREFELT $ 18)) . #10#)
          (LETT |m|
                (SPADCALL
                 (QCAR
                  (LETT |mat| (SPADCALL |derivation| (QREFELT $ 20)) . #10#))
                 (QREFELT $ 22))
                . #10#)
          (EXIT
           (COND
            ((SPADCALL (QCDR (SPADCALL |d0| (QREFELT $ 24)))
                       (|spadConstant| $ 25) (QREFELT $ 27))
             (|error| "nonintegral d0"))
            ('T
             (SEQ
              (LETT |inum|
                    (QCAR (LETT |cform| (SPADCALL |f| (QREFELT $ 24)) . #10#))
                    . #10#)
              (COND
               ((QEQCAR
                 (SPADCALL (LETT |iden| (QCDR |cform|) . #10#)
                           (LETT |e| (QCDR |mat|) . #10#) (QREFELT $ 29))
                 1)
                (SEQ
                 (LETT |iden|
                       (SPADCALL
                        (LETT |coef|
                              (PROG2
                                  (LETT #2#
                                        (SPADCALL |e|
                                                  (SPADCALL |e| |iden|
                                                            (QREFELT $ 30))
                                                  (QREFELT $ 29))
                                        . #10#)
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                                (|Union| (QREFELT $ 7)
                                                         #11="failed")
                                                #2#))
                              . #10#)
                        |iden| (QREFELT $ 31))
                       . #10#)
                 (EXIT
                  (LETT |inum| (SPADCALL |coef| |inum| (QREFELT $ 33))
                        . #10#)))))
              (SEQ (LETT |trm| NIL . #10#)
                   (LETT #9#
                         (SPADCALL (SPADCALL |iden| (QREFELT $ 35))
                                   (QREFELT $ 39))
                         . #10#)
                   G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |trm| (CAR #9#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (LETT |j| (QCDR |trm|) . #10#) 1
                                 (QREFELT $ 41))
                       (SEQ
                        (LETT |u'|
                              (SPADCALL
                               (LETT |u|
                                     (PROG2
                                         (LETT #2#
                                               (SPADCALL |iden|
                                                         (SPADCALL
                                                          (LETT |v|
                                                                (QCAR |trm|)
                                                                . #10#)
                                                          (PROG1
                                                              (LETT #8# |j|
                                                                    . #10#)
                                                            (|check_subtype2|
                                                             (>= #8# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #8#))
                                                          (QREFELT $ 43))
                                                         (QREFELT $ 29))
                                               . #10#)
                                         (QCDR #2#)
                                       (|check_union2| (QEQCAR #2# 0)
                                                       (QREFELT $ 7)
                                                       (|Union| (QREFELT $ 7)
                                                                #11#)
                                                       #2#))
                                     . #10#)
                               (SPADCALL |v| |derivation|) (QREFELT $ 31))
                              . #10#)
                        (LETT |sys|
                              (SPADCALL
                               (PROG2
                                   (LETT #2#
                                         (SPADCALL
                                          (SPADCALL |u| |v| (QREFELT $ 31)) |e|
                                          (QREFELT $ 29))
                                         . #10#)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                                 (|Union| (QREFELT $ 7) #11#)
                                                 #2#))
                               |m| (QREFELT $ 44))
                              . #10#)
                        (LETT |nn| (- 1 (SPADCALL |inum| (QREFELT $ 45)))
                              . #10#)
                        (SEQ G190
                             (COND
                              ((NULL (SPADCALL |j| 1 (QREFELT $ 41)))
                               (GO G191)))
                             (SEQ (LETT |j| (- |j| 1) . #10#)
                                  (LETT |p|
                                        (SPADCALL
                                         (SPADCALL |j| |u'| (QREFELT $ 47))
                                         (QREFELT $ 48))
                                        . #10#)
                                  (LETT |sol|
                                        (|INTHERAL;localsolve|
                                         (SPADCALL |sys|
                                                   (SPADCALL |n| |p|
                                                             (QREFELT $ 49))
                                                   (QREFELT $ 50))
                                         |inum| |v| $)
                                        . #10#)
                                  (LETT |s0|
                                        (SPADCALL |sol| (|spadConstant| $ 25)
                                                  (QREFELT $ 51))
                                        . #10#)
                                  (LETT |corr|
                                        (SPADCALL
                                         (SPADCALL |d0| |s0| (QREFELT $ 52))
                                         (QREFELT $ 24))
                                        . #10#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL (QCDR |corr|)
                                               (|spadConstant| $ 25)
                                               (QREFELT $ 27))
                                     (|error| "impossible"))
                                    ('T
                                     (SEQ (LETT |cnum| (QCAR |corr|) . #10#)
                                          (LETT |ratform|
                                                (SPADCALL |ratform|
                                                          (SPADCALL |sol|
                                                                    (SPADCALL
                                                                     |v|
                                                                     (PROG1
                                                                         (LETT
                                                                          #6#
                                                                          |j|
                                                                          . #10#)
                                                                       (|check_subtype2|
                                                                        (>= #6#
                                                                            0)
                                                                        '(|NonNegativeInteger|)
                                                                        '(|Integer|)
                                                                        #6#))
                                                                     (QREFELT $
                                                                              43))
                                                                    (QREFELT $
                                                                             51))
                                                          (QREFELT $ 53))
                                                . #10#)
                                          (EXIT
                                           (LETT |inum|
                                                 (PROGN
                                                  (LETT #5#
                                                        (GETREFV
                                                         (|inc_SI|
                                                          (-
                                                           #12=(QVSIZE |inum|)
                                                           #13=(SPADCALL |inum|
                                                                         (QREFELT
                                                                          $
                                                                          45)))))
                                                        . #10#)
                                                  (SEQ (LETT |i| #13# . #10#)
                                                       (LETT #4# #12# . #10#)
                                                       (LETT #3# 0 . #10#) G190
                                                       (COND
                                                        ((> |i| #4#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (SETELT #5# #3#
                                                                 (SPADCALL
                                                                  (PROG2
                                                                      (LETT #2#
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QAREF1O
                                                                                |inum|
                                                                                |i|
                                                                                1)
                                                                               (SPADCALL
                                                                                |p|
                                                                                (QAREF1O
                                                                                 |sol|
                                                                                 |i|
                                                                                 1)
                                                                                (QREFELT
                                                                                 $
                                                                                 31))
                                                                               (QREFELT
                                                                                $
                                                                                54))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                |sys|
                                                                                (-
                                                                                 |i|
                                                                                 |nn|)
                                                                                (QREFELT
                                                                                 $
                                                                                 55))
                                                                               |sol|
                                                                               (QREFELT
                                                                                $
                                                                                56))
                                                                              (QREFELT
                                                                               $
                                                                               54))
                                                                             |v|
                                                                             (QREFELT
                                                                              $
                                                                              29))
                                                                            . #10#)
                                                                      (QCDR
                                                                       #2#)
                                                                    (|check_union2|
                                                                     (QEQCAR
                                                                      #2# 0)
                                                                     (QREFELT $
                                                                              7)
                                                                     (|Union|
                                                                      (QREFELT
                                                                       $ 7)
                                                                      #11#)
                                                                     #2#))
                                                                  (SPADCALL |u|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QAREF1O
                                                                               |sol|
                                                                               |i|
                                                                               1)
                                                                              |derivation|)
                                                                             (QAREF1O
                                                                              |cnum|
                                                                              |i|
                                                                              1)
                                                                             (QREFELT
                                                                              $
                                                                              57))
                                                                            (QREFELT
                                                                             $
                                                                             31))
                                                                  (QREFELT $
                                                                           54)))))
                                                       (LETT #3#
                                                             (PROG1
                                                                 (|inc_SI| #3#)
                                                               (LETT |i|
                                                                     (+ |i| 1)
                                                                     . #10#))
                                                             . #10#)
                                                       (GO G190) G191
                                                       (EXIT NIL))
                                                  #5#)
                                                 . #10#)))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |iden| (SPADCALL |u| |v| (QREFELT $ 31))
                               . #10#)))))))
                   (LETT #9# (CDR #9#) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS |ratform| (SPADCALL |inum| |iden| (QREFELT $ 51))))))))))) 

(SDEFUN |INTHERAL;localsolve|
        ((|mat| |Matrix| UP) (|vec| |Vector| UP) (|modulus| UP)
         ($ |Vector| UP))
        (SPROG
         ((#1=#:G957 NIL)
          (|bc|
           (|Union| (|Record| (|:| |coef1| UP) (|:| |coef2| UP)) "failed"))
          (#2=#:G961 NIL) (|i| NIL)
          (|sol| (|Union| (|Vector| (|Fraction| UP)) "failed")) (#3=#:G958 NIL)
          (#4=#:G959 NIL) (|j| NIL) (#5=#:G960 NIL) (|k| NIL)
          (|ans| (|Vector| UP)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ans| (MAKEARR1 (ANROWS |mat|) (|spadConstant| $ 11))
                  . #6=(|INTHERAL;localsolve|))
            (EXIT
             (COND
              ((SPADCALL |mat| (QREFELT $ 58))
               (SEQ
                (SEQ (LETT |k| 1 . #6#)
                     (LETT #5# (SPADCALL |mat| (QREFELT $ 60)) . #6#)
                     (LETT |j| 1 . #6#)
                     (LETT #4# (SPADCALL |mat| (QREFELT $ 59)) . #6#)
                     (LETT |i| (SPADCALL |ans| (QREFELT $ 45)) . #6#)
                     (LETT #3# (QVSIZE |ans|) . #6#) G190
                     (COND
                      ((OR (> |i| #3#) (|greater_SI| |j| #4#)
                           (|greater_SI| |k| #5#))
                       (GO G191)))
                     (SEQ
                      (LETT |bc|
                            (SPADCALL (QAREF2O |mat| |j| |k| 1 1) |modulus|
                                      (QAREF1O |vec| |i| 1) (QREFELT $ 63))
                            . #6#)
                      (EXIT
                       (COND
                        ((QEQCAR |bc| 1)
                         (PROGN
                          (LETT #1# (MAKEARR1 0 (|spadConstant| $ 11)) . #6#)
                          (GO #7=#:G956)))
                        ('T (QSETAREF1O |ans| |i| (QCAR (QCDR |bc|)) 1)))))
                     (LETT |i|
                           (PROG1 (+ |i| 1)
                             (LETT |j|
                                   (PROG1 (|inc_SI| |j|)
                                     (LETT |k| (|inc_SI| |k|) . #6#))
                                   . #6#))
                           . #6#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))
              (#8='T
               (SEQ
                (LETT |sol|
                      (SPADCALL (SPADCALL (ELT $ 65) |mat| (QREFELT $ 69))
                                (SPADCALL (ELT $ 65) |vec| (QREFELT $ 72))
                                (QREFELT $ 75))
                      . #6#)
                (EXIT
                 (COND ((QEQCAR |sol| 1) (MAKEARR1 0 (|spadConstant| $ 11)))
                       (#8#
                        (SEQ
                         (SEQ (LETT |i| (SPADCALL |ans| (QREFELT $ 45)) . #6#)
                              (LETT #2# (QVSIZE |ans|) . #6#) G190
                              (COND ((> |i| #2#) (GO G191)))
                              (SEQ
                               (LETT |bc|
                                     (SPADCALL
                                      (SPADCALL (QAREF1O (QCDR |sol|) |i| 1)
                                                (QREFELT $ 76))
                                      |modulus| (|spadConstant| $ 25)
                                      (QREFELT $ 63))
                                     . #6#)
                               (EXIT
                                (COND
                                 ((QEQCAR |bc| 1)
                                  (PROGN
                                   (LETT #1# (MAKEARR1 0 (|spadConstant| $ 11))
                                         . #6#)
                                   (GO #7#)))
                                 ('T
                                  (QSETAREF1O |ans| |i|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (QAREF1O (QCDR |sol|) |i| 1)
                                                 (QREFELT $ 77))
                                                (QCAR (QCDR |bc|))
                                                (QREFELT $ 31))
                                               |modulus| (QREFELT $ 78))
                                              1)))))
                              (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT |ans|)))))))))))
          #7# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |AlgebraicHermiteIntegration;|)) 

(DEFUN |AlgebraicHermiteIntegration| (&REST #1=#:G962)
  (SPROG NIL
         (PROG (#2=#:G963)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicHermiteIntegration|)
                                               '|domainEqualList|)
                    . #3=(|AlgebraicHermiteIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |AlgebraicHermiteIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|AlgebraicHermiteIntegration|)))))))))) 

(DEFUN |AlgebraicHermiteIntegration;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicHermiteIntegration|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|AlgebraicHermiteIntegration| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 79) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|AlgebraicHermiteIntegration|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|AlgebraicHermiteIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |Zero|) (4 . |Zero|)
              (8 . |Zero|) (|Record| (|:| |answer| 9) (|:| |logpart| 9))
              (|Mapping| 7 7) |INTHERAL;HermiteIntegrate;RMRR;2|
              |INTHERAL;HermiteIntegrate;RMR;1| (|PositiveInteger|)
              (12 . |rank|) (|Record| (|:| |num| 21) (|:| |den| 7))
              (16 . |integralDerivationMatrix|) (|Matrix| 7) (21 . |transpose|)
              (|Record| (|:| |num| 32) (|:| |den| 7))
              (26 . |integralCoordinates|) (31 . |One|) (|Boolean|) (35 . ~=)
              (|Union| $ '"failed") (41 . |exquo|) (47 . |gcd|) (53 . *)
              (|Vector| 7) (59 . *) (|Factored| $) (65 . |squareFree|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 40)) (|List| 36)
              (|Factored| 7) (70 . |factors|) (|Integer|) (75 . >)
              (|NonNegativeInteger|) (81 . ^) (87 . *) (93 . |minIndex|)
              (98 . |One|) (102 . *) (108 . -) (113 . |scalarMatrix|) (119 . +)
              (125 . |integralRepresents|) (131 . *) (137 . +) (143 . -)
              (149 . |row|) (155 . |dot|) (161 . +) (167 . |diagonal?|)
              (172 . |maxRowIndex|) (177 . |maxColIndex|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 61 '"failed")
              (182 . |extendedEuclidean|) (|Fraction| 7) (189 . |coerce|)
              (|Matrix| 64) (|Mapping| 64 7)
              (|MatrixCategoryFunctions2| 7 32 32 21 64 70 70 66) (194 . |map|)
              (|Vector| 64) (|VectorFunctions2| 7 64) (200 . |map|)
              (|Union| 70 '"failed") (|LinearSystemMatrixPackage| 64 70 70 66)
              (206 . |particularSolution|) (212 . |denom|) (217 . |numer|)
              (222 . |rem|))
           '#(|HermiteIntegrate| 228) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 78
                                                 '(0 6 0 10 0 7 0 11 0 9 0 12 0
                                                   9 17 18 1 9 19 14 20 1 21 0
                                                   0 22 1 9 23 0 24 0 7 0 25 2
                                                   7 26 0 0 27 2 7 28 0 0 29 2
                                                   7 0 0 0 30 2 7 0 0 0 31 2 32
                                                   0 7 0 33 1 7 34 0 35 1 38 37
                                                   0 39 2 40 26 0 0 41 2 7 0 0
                                                   42 43 2 21 0 7 0 44 1 32 40
                                                   0 45 0 6 0 46 2 7 0 40 0 47
                                                   1 7 0 0 48 2 21 0 42 7 49 2
                                                   21 0 0 0 50 2 9 0 32 7 51 2
                                                   9 0 0 0 52 2 9 0 0 0 53 2 7
                                                   0 0 0 54 2 21 32 0 40 55 2
                                                   32 7 0 0 56 2 7 0 0 0 57 1
                                                   21 26 0 58 1 21 40 0 59 1 21
                                                   40 0 60 3 7 62 0 0 0 63 1 64
                                                   0 7 65 2 68 66 67 21 69 2 71
                                                   70 67 32 72 2 74 73 66 70 75
                                                   1 64 7 0 76 1 64 7 0 77 2 7
                                                   0 0 0 78 3 0 13 9 14 9 15 2
                                                   0 13 9 14 16)))))
           '|lookupComplete|)) 
