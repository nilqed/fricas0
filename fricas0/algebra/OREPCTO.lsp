
(SDEFUN |OREPCTO;times;2CAMC;1|
        ((|x| C) (|y| C) (|sigma| |Automorphism| R) (|delta| |Mapping| R R)
         ($ C))
        (COND ((SPADCALL |y| (QREFELT $ 9)) (|spadConstant| $ 10))
              ('T
               (QCAR
                (|OREPCTO;times2| (SPADCALL |x| (QREFELT $ 12)) |x| |y| |sigma|
                 |delta| $))))) 

(SDEFUN |OREPCTO;times2|
        ((|n| |NonNegativeInteger|) (|x| C) (|y| C) (|sigma| |Automorphism| R)
         (|delta| |Mapping| R R) ($ |Record| (|:| |prod| C) (|:| |yton| C)))
        (SPROG
         ((|y1| (C)) (|z| (C)) (|b| (R)) (|m| (|NonNegativeInteger|))
          (|pp| (|Record| (|:| |prod| C) (|:| |yton| C))) (|x1| (C))
          (|n1| (|NonNegativeInteger|))
          (|u| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |u| (SPADCALL |n| 1 (QREFELT $ 19)) . #1=(|OREPCTO;times2|))
          (EXIT
           (COND
            ((QEQCAR |u| 1)
             (COND
              ((SPADCALL |x| (QREFELT $ 9)) (CONS (|spadConstant| $ 10) |y|))
              (#2='T
               (CONS
                (SPADCALL (SPADCALL |x| (QREFELT $ 21)) |y| (QREFELT $ 22))
                |y|))))
            (#2#
             (SEQ (LETT |n1| (QCDR |u|) . #1#)
                  (LETT |x1|
                        (COND
                         ((EQL |n| (SPADCALL |x| (QREFELT $ 12)))
                          (SPADCALL |x| (QREFELT $ 23)))
                         (#2# |x|))
                        . #1#)
                  (LETT |pp| (|OREPCTO;times2| |n1| |x1| |y| |sigma| |delta| $)
                        . #1#)
                  (LETT |y1| (QCDR |pp|) . #1#)
                  (LETT |z| (|spadConstant| $ 10) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |y1| (|spadConstant| $ 10) (QREFELT $ 24)))
                         (GO G191)))
                       (SEQ (LETT |m| (SPADCALL |y1| (QREFELT $ 12)) . #1#)
                            (LETT |b| (SPADCALL |y1| (QREFELT $ 21)) . #1#)
                            (LETT |z|
                                  (SPADCALL
                                   (SPADCALL |z|
                                             (SPADCALL
                                              (SPADCALL |sigma| |b|
                                                        (QREFELT $ 25))
                                              (+ |m| 1) (QREFELT $ 26))
                                             (QREFELT $ 27))
                                   (SPADCALL (SPADCALL |b| |delta|) |m|
                                             (QREFELT $ 26))
                                   (QREFELT $ 27))
                                  . #1#)
                            (EXIT
                             (LETT |y1| (SPADCALL |y1| (QREFELT $ 23)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((EQL |n| (SPADCALL |x| (QREFELT $ 12)))
                     (CONS
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| (QREFELT $ 21)) |z|
                                 (QREFELT $ 22))
                       (QCAR |pp|) (QREFELT $ 27))
                      |z|))
                    (#2# (CONS (QCAR |pp|) |z|))))))))))) 

(SDEFUN |OREPCTO;apply;C2RAMR;3|
        ((|p| C) (|c| R) (|x| R) (|sigma| |Automorphism| R)
         (|delta| |Mapping| R R) ($ R))
        (SPROG ((|xn| (R)) (|w| (R)) (#1=#:G725 NIL) (|i| NIL))
               (SEQ
                (LETT |w| (|spadConstant| $ 20)
                      . #2=(|OREPCTO;apply;C2RAMR;3|))
                (LETT |xn| |x| . #2#)
                (SEQ (LETT |i| 0 . #2#)
                     (LETT #1# (SPADCALL |p| (QREFELT $ 12)) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |w|
                            (SPADCALL |w|
                                      (SPADCALL
                                       (SPADCALL |p| |i| (QREFELT $ 28)) |xn|
                                       (QREFELT $ 29))
                                      (QREFELT $ 30))
                            . #2#)
                      (EXIT
                       (LETT |xn|
                             (SPADCALL
                              (SPADCALL |c|
                                        (SPADCALL |sigma| |xn| (QREFELT $ 25))
                                        (QREFELT $ 29))
                              (SPADCALL |xn| |delta|) (QREFELT $ 30))
                             . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |w|)))) 

(SDEFUN |OREPCTO;localLeftDivide|
        ((|a| C) (|b| C) (|sigma| |Automorphism| R) (|b1| R)
         ($ |Record| (|:| |quotient| C) (|:| |remainder| C)))
        (SPROG
         ((|qr| (|Record| (|:| |quotient| C) (|:| |remainder| C))) (|a1| (C))
          (|q| (C)) (#1=#:G735 NIL)
          (|n| (|Union| (|NonNegativeInteger|) "failed"))
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT $ 9)) (|error| "leftDivide: division by 0"))
           (#2='T
            (SEQ
             (EXIT
              (SEQ
               (COND
                ((SPADCALL |a| (QREFELT $ 9))
                 (EXIT (CONS (|spadConstant| $ 10) |a|)))
                (#2#
                 (SEQ
                  (LETT |n|
                        (SPADCALL (SPADCALL |a| (QREFELT $ 12))
                                  (LETT |m| (SPADCALL |b| (QREFELT $ 12))
                                        . #3=(|OREPCTO;localLeftDivide|))
                                  (QREFELT $ 19))
                        . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |n| 1)
                     (PROGN
                      (LETT #1# (CONS (|spadConstant| $ 10) |a|) . #3#)
                      (GO #4=#:G732))))))))
               (LETT |q|
                     (SPADCALL
                      (SPADCALL (SPADCALL |sigma| (- |m|) (QREFELT $ 33))
                                (SPADCALL |b1| (SPADCALL |a| (QREFELT $ 21))
                                          (QREFELT $ 29))
                                (QREFELT $ 25))
                      (QCDR |n|) (QREFELT $ 26))
                     . #3#)
               (LETT |a1|
                     (SPADCALL (SPADCALL |a| (QREFELT $ 23))
                               (SPADCALL (SPADCALL |b| |q| (QREFELT $ 34))
                                         (QREFELT $ 23))
                               (QREFELT $ 35))
                     . #3#)
               (LETT |qr| (|OREPCTO;localLeftDivide| |a1| |b| |sigma| |b1| $)
                     . #3#)
               (EXIT
                (CONS (SPADCALL |q| (QCAR |qr|) (QREFELT $ 27)) (QCDR |qr|)))))
             #4# (EXIT #1#))))))) 

(SDEFUN |OREPCTO;localRightDivide|
        ((|a| C) (|b| C) (|sigma| |Automorphism| R) (|b1| R)
         ($ |Record| (|:| |quotient| C) (|:| |remainder| C)))
        (SPROG
         ((|qr| (|Record| (|:| |quotient| C) (|:| |remainder| C))) (|a1| (C))
          (|q| (C)) (#1=#:G745 NIL)
          (|n| (|Union| (|NonNegativeInteger|) "failed"))
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT $ 9))
            (|error| "rightDivide: division by 0"))
           (#2='T
            (SEQ
             (EXIT
              (SEQ
               (COND
                ((SPADCALL |a| (QREFELT $ 9))
                 (EXIT (CONS (|spadConstant| $ 10) |a|)))
                (#2#
                 (SEQ
                  (LETT |n|
                        (SPADCALL (SPADCALL |a| (QREFELT $ 12))
                                  (LETT |m| (SPADCALL |b| (QREFELT $ 12))
                                        . #3=(|OREPCTO;localRightDivide|))
                                  (QREFELT $ 19))
                        . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |n| 1)
                     (PROGN
                      (LETT #1# (CONS (|spadConstant| $ 10) |a|) . #3#)
                      (GO #4=#:G742))))))))
               (LETT |q|
                     (SPADCALL
                      (SPADCALL (SPADCALL |a| (QREFELT $ 21))
                                (SPADCALL
                                 (SPADCALL |sigma| (QCDR |n|) (QREFELT $ 33))
                                 |b1| (QREFELT $ 25))
                                (QREFELT $ 29))
                      (QCDR |n|) (QREFELT $ 26))
                     . #3#)
               (LETT |a1|
                     (SPADCALL (SPADCALL |a| (QREFELT $ 23))
                               (SPADCALL (SPADCALL |q| |b| (QREFELT $ 34))
                                         (QREFELT $ 23))
                               (QREFELT $ 35))
                     . #3#)
               (LETT |qr| (|OREPCTO;localRightDivide| |a1| |b| |sigma| |b1| $)
                     . #3#)
               (EXIT
                (CONS (SPADCALL |q| (QCAR |qr|) (QREFELT $ 27)) (QCDR |qr|)))))
             #4# (EXIT #1#))))))) 

(SDEFUN |OREPCTO;monicLeftDivide;2CAR;6|
        ((|a| C) (|b| C) (|sigma| |Automorphism| R)
         ($ |Record| (|:| |quotient| C) (|:| |remainder| C)))
        (SPROG ((#1=#:G748 NIL) (|u| (R)))
               (COND
                ((SPADCALL
                  (LETT |u| (SPADCALL |b| (QREFELT $ 21))
                        . #2=(|OREPCTO;monicLeftDivide;2CAR;6|))
                  (QREFELT $ 36))
                 (|OREPCTO;localLeftDivide| |a| |b| |sigma|
                  (PROG2 (LETT #1# (SPADCALL |u| (QREFELT $ 37)) . #2#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) "failed") #1#))
                  $))
                ('T (|error| "monicLeftDivide: divisor is not monic"))))) 

(SDEFUN |OREPCTO;monicRightDivide;2CAR;7|
        ((|a| C) (|b| C) (|sigma| |Automorphism| R)
         ($ |Record| (|:| |quotient| C) (|:| |remainder| C)))
        (SPROG ((#1=#:G755 NIL) (|u| (R)))
               (COND
                ((SPADCALL
                  (LETT |u| (SPADCALL |b| (QREFELT $ 21))
                        . #2=(|OREPCTO;monicRightDivide;2CAR;7|))
                  (QREFELT $ 36))
                 (|OREPCTO;localRightDivide| |a| |b| |sigma|
                  (PROG2 (LETT #1# (SPADCALL |u| (QREFELT $ 37)) . #2#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) "failed") #1#))
                  $))
                ('T (|error| "monicRightDivide: divisor is not monic"))))) 

(SDEFUN |OREPCTO;leftDivide;2CAR;8|
        ((|a| C) (|b| C) (|sigma| |Automorphism| R)
         ($ |Record| (|:| |quotient| C) (|:| |remainder| C)))
        (|OREPCTO;localLeftDivide| |a| |b| |sigma|
         (SPADCALL (SPADCALL |b| (QREFELT $ 21)) (QREFELT $ 41)) $)) 

(SDEFUN |OREPCTO;rightDivide;2CAR;9|
        ((|a| C) (|b| C) (|sigma| |Automorphism| R)
         ($ |Record| (|:| |quotient| C) (|:| |remainder| C)))
        (|OREPCTO;localRightDivide| |a| |b| |sigma|
         (SPADCALL (SPADCALL |b| (QREFELT $ 21)) (QREFELT $ 41)) $)) 

(DECLAIM (NOTINLINE |UnivariateSkewPolynomialCategoryOps;|)) 

(DEFUN |UnivariateSkewPolynomialCategoryOps| (&REST #1=#:G763)
  (SPROG NIL
         (PROG (#2=#:G764)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateSkewPolynomialCategoryOps|)
                                               '|domainEqualList|)
                    . #3=(|UnivariateSkewPolynomialCategoryOps|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |UnivariateSkewPolynomialCategoryOps;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateSkewPolynomialCategoryOps|)))))))))) 

(DEFUN |UnivariateSkewPolynomialCategoryOps;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|UnivariateSkewPolynomialCategoryOps|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|UnivariateSkewPolynomialCategoryOps| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 44) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))))
                          . #1#))
          (|haddProp| |$ConstructorCache|
                      '|UnivariateSkewPolynomialCategoryOps| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 39
                       (CONS
                        (|dispatchFunction| |OREPCTO;monicLeftDivide;2CAR;6|)
                        $))
             (QSETREFV $ 40
                       (CONS
                        (|dispatchFunction| |OREPCTO;monicRightDivide;2CAR;7|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 42
                       (CONS (|dispatchFunction| |OREPCTO;leftDivide;2CAR;8|)
                             $))
             (QSETREFV $ 43
                       (CONS (|dispatchFunction| |OREPCTO;rightDivide;2CAR;9|)
                             $)))))
          $))) 

(MAKEPROP '|UnivariateSkewPolynomialCategoryOps| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |zero?|) (5 . |Zero|) (|NonNegativeInteger|) (9 . |degree|)
              (|Automorphism| 6) (|Mapping| 6 6) |OREPCTO;times;2CAMC;1|
              (14 . |One|) (18 . |One|) (|Union| $ '"failed")
              (22 . |subtractIfCan|) (28 . |Zero|) (32 . |leadingCoefficient|)
              (37 . *) (43 . |reductum|) (48 . ~=) (54 . |elt|)
              (60 . |monomial|) (66 . +) (72 . |coefficient|) (78 . *) (84 . +)
              |OREPCTO;apply;C2RAMR;3| (|Integer|) (90 . ^) (96 . *) (102 . -)
              (108 . |unit?|) (113 . |recip|)
              (|Record| (|:| |quotient| 7) (|:| |remainder| 7))
              (118 . |monicLeftDivide|) (125 . |monicRightDivide|)
              (132 . |inv|) (137 . |leftDivide|) (144 . |rightDivide|))
           '#(|times| 151 |rightDivide| 159 |monicRightDivide| 166
              |monicLeftDivide| 173 |leftDivide| 180 |apply| 187)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 43
                                                 '(1 7 8 0 9 0 7 0 10 1 7 11 0
                                                   12 0 6 0 16 0 7 0 17 2 11 18
                                                   0 0 19 0 6 0 20 1 7 6 0 21 2
                                                   7 0 6 0 22 1 7 0 0 23 2 7 8
                                                   0 0 24 2 13 6 0 6 25 2 7 0 6
                                                   11 26 2 7 0 0 0 27 2 7 6 0
                                                   11 28 2 6 0 0 0 29 2 6 0 0 0
                                                   30 2 13 0 0 32 33 2 7 0 0 0
                                                   34 2 7 0 0 0 35 1 6 8 0 36 1
                                                   6 18 0 37 3 0 38 7 7 13 39 3
                                                   0 38 7 7 13 40 1 6 0 0 41 3
                                                   0 38 7 7 13 42 3 0 38 7 7 13
                                                   43 4 0 7 7 7 13 14 15 3 1 38
                                                   7 7 13 43 3 2 38 7 7 13 40 3
                                                   2 38 7 7 13 39 3 1 38 7 7 13
                                                   42 5 0 6 7 6 6 13 14 31)))))
           '|lookupComplete|)) 
