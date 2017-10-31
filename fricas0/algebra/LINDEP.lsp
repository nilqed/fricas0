
(SDEFUN |LINDEP;aNonZeroSolution|
        ((|m| |Matrix| S) ($ |Union| (|Vector| S) "failed"))
        (SPROG ((|ns| (|List| (|Vector| S))))
               (COND
                ((NULL
                  (LETT |ns| (SPADCALL |m| (QREFELT $ 10))
                        |LINDEP;aNonZeroSolution|))
                 (CONS 1 "failed"))
                ('T (CONS 0 (|SPADfirst| |ns|)))))) 

(SDEFUN |LINDEP;linearlyDependent?;VB;2| ((|v| |Vector| R) ($ |Boolean|))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (COND
                ((ZEROP
                  (LETT |n| (QVSIZE |v|) |LINDEP;linearlyDependent?;VB;2|))
                 'T)
                ((EQL |n| 1)
                 (SPADCALL
                  (SPADCALL |v| (SPADCALL |v| (QREFELT $ 15)) (QREFELT $ 16))
                  (QREFELT $ 18)))
                ('T
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |v| (QREFELT $ 20)) (QREFELT $ 22))
                   (QREFELT $ 24))
                  (QREFELT $ 25)))))) 

(SDEFUN |LINDEP;linearDependence;VU;3|
        ((|v| |Vector| R) ($ |Union| (|Vector| S) "failed"))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (COND
                ((ZEROP (LETT |n| (QVSIZE |v|) |LINDEP;linearDependence;VU;3|))
                 (CONS 0 (MAKE-ARRAY 0)))
                ((EQL |n| 1)
                 (COND
                  ((SPADCALL
                    (SPADCALL |v| (SPADCALL |v| (QREFELT $ 15)) (QREFELT $ 16))
                    (QREFELT $ 18))
                   (CONS 0 (MAKEARR1 1 (|spadConstant| $ 11))))
                  (#1='T (CONS 1 "failed"))))
                (#1#
                 (|LINDEP;aNonZeroSolution|
                  (SPADCALL (SPADCALL |v| (QREFELT $ 20)) (QREFELT $ 22)) $))))) 

(SDEFUN |LINDEP;solveLinear;VRR;4|
        ((|v| |Vector| R) (|c| R)
         ($ |Record| (|:| |particular| (|Union| (|Vector| S) "failed"))
          (|:| |basis| (|List| (|Vector| S)))))
        (SPADCALL (SPADCALL |v| (QREFELT $ 20)) (MAKEARR1 1 |c|)
                  (QREFELT $ 30))) 

(SDEFUN |LINDEP;solveLinear;MVR;5|
        ((|m| |Matrix| R) (|v| |Vector| R)
         ($ |Record| (|:| |particular| (|Union| (|Vector| S) "failed"))
          (|:| |basis| (|List| (|Vector| S)))))
        (SPROG
         ((|sys| (|Record| (|:| |mat| (|Matrix| S)) (|:| |vec| (|Vector| S)))))
         (SEQ
          (LETT |sys| (SPADCALL |m| |v| (QREFELT $ 34))
                |LINDEP;solveLinear;MVR;5|)
          (EXIT (SPADCALL (QCAR |sys|) (QCDR |sys|) (QREFELT $ 37)))))) 

(SDEFUN |LINDEP;particularSolution;VRU;6|
        ((|v| |Vector| R) (|c| R) ($ |Union| (|Vector| S) "failed"))
        (COND
         ((SPADCALL |c| (QREFELT $ 18))
          (CONS 0 (MAKEARR1 (QVSIZE |v|) (|spadConstant| $ 38))))
         ((SPADCALL |v| (QREFELT $ 39)) (CONS 1 "failed"))
         ('T (QCAR (SPADCALL |v| |c| (QREFELT $ 31)))))) 

(SDEFUN |LINDEP;particularSolution;MVU;7|
        ((|m| |Matrix| R) (|v| |Vector| R) ($ |Union| (|Vector| S) "failed"))
        (COND
         ((SPADCALL |v| (SPADCALL (QVSIZE |v|) (QREFELT $ 41)) (QREFELT $ 42))
          (CONS 0 (MAKEARR1 (ANCOLS |m|) (|spadConstant| $ 38))))
         ('T (QCAR (SPADCALL |m| |v| (QREFELT $ 30)))))) 

(SDEFUN |LINDEP;solveLinear;VRR;8|
        ((|v| |Vector| R) (|c| R)
         ($ |Record|
          (|:| |particular| (|Union| (|Vector| (|Fraction| S)) "failed"))
          (|:| |basis| (|List| (|Vector| (|Fraction| S))))))
        (SPADCALL (SPADCALL |v| (QREFELT $ 20)) (MAKEARR1 1 |c|)
                  (QREFELT $ 46))) 

(SDEFUN |LINDEP;solveLinear;MVR;9|
        ((|m| |Matrix| R) (|v| |Vector| R)
         ($ |Record|
          (|:| |particular| (|Union| (|Vector| (|Fraction| S)) "failed"))
          (|:| |basis| (|List| (|Vector| (|Fraction| S))))))
        (SPROG
         ((|sys| (|Record| (|:| |mat| (|Matrix| S)) (|:| |vec| (|Vector| S)))))
         (SEQ
          (LETT |sys| (SPADCALL |m| |v| (QREFELT $ 34))
                |LINDEP;solveLinear;MVR;9|)
          (EXIT
           (SPADCALL (SPADCALL (ELT $ 49) (QCAR |sys|) (QREFELT $ 53))
                     (SPADCALL (ELT $ 49) (QCDR |sys|) (QREFELT $ 56))
                     (QREFELT $ 58)))))) 

(SDEFUN |LINDEP;particularSolution;VRU;10|
        ((|v| |Vector| R) (|c| R)
         ($ |Union| (|Vector| (|Fraction| S)) "failed"))
        (COND
         ((SPADCALL |c| (QREFELT $ 18))
          (CONS 0 (MAKEARR1 (QVSIZE |v|) (|spadConstant| $ 59))))
         ((SPADCALL |v| (QREFELT $ 39)) (CONS 1 "failed"))
         ('T (QCAR (SPADCALL |v| |c| (QREFELT $ 47)))))) 

(SDEFUN |LINDEP;particularSolution;MVU;11|
        ((|m| |Matrix| R) (|v| |Vector| R)
         ($ |Union| (|Vector| (|Fraction| S)) "failed"))
        (COND
         ((SPADCALL |v| (SPADCALL (QVSIZE |v|) (QREFELT $ 41)) (QREFELT $ 42))
          (CONS 0 (MAKEARR1 (ANCOLS |m|) (|spadConstant| $ 59))))
         ('T (QCAR (SPADCALL |m| |v| (QREFELT $ 46)))))) 

(DECLAIM (NOTINLINE |LinearDependence;|)) 

(DEFUN |LinearDependence| (&REST #1=#:G771)
  (SPROG NIL
         (PROG (#2=#:G772)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearDependence|)
                                               '|domainEqualList|)
                    . #3=(|LinearDependence|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LinearDependence;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LinearDependence|)))))))))) 

(DEFUN |LinearDependence;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G770 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|LinearDependence|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|LinearDependence| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 62) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Field|))
                                              . #2#)
                                        (|not| #1#)))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|LinearDependence| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 31 (CONS (|dispatchFunction| |LINDEP;solveLinear;VRR;4|) $))
       (QSETREFV $ 30 (CONS (|dispatchFunction| |LINDEP;solveLinear;MVR;5|) $))
       (QSETREFV $ 40
                 (CONS (|dispatchFunction| |LINDEP;particularSolution;VRU;6|)
                       $))
       (QSETREFV $ 43
                 (CONS (|dispatchFunction| |LINDEP;particularSolution;MVU;7|)
                       $))))
     ('T
      (PROGN
       (QSETREFV $ 47 (CONS (|dispatchFunction| |LINDEP;solveLinear;VRR;8|) $))
       (QSETREFV $ 46 (CONS (|dispatchFunction| |LINDEP;solveLinear;MVR;9|) $))
       (QSETREFV $ 60
                 (CONS (|dispatchFunction| |LINDEP;particularSolution;VRU;10|)
                       $))
       (QSETREFV $ 61
                 (CONS (|dispatchFunction| |LINDEP;particularSolution;MVU;11|)
                       $)))))
    $))) 

(MAKEPROP '|LinearDependence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 35)
              (|Matrix| 6) (0 . |nullSpace|) (5 . |One|) (9 . |One|)
              (|Integer|) (|Vector| 7) (13 . |minIndex|) (18 . |elt|)
              (|Boolean|) (24 . |zero?|) (|Matrix| 7) (29 . |transpose|)
              (|Matrix| $) (34 . |reducedSystem|) (|NonNegativeInteger|)
              (39 . |nullity|) (44 . |positive?|)
              |LINDEP;linearlyDependent?;VB;2| (|Union| 35 '"failed")
              |LINDEP;linearDependence;VU;3|
              (|Record| (|:| |particular| 27) (|:| |basis| 8))
              (49 . |solveLinear|) (55 . |solveLinear|)
              (|Record| (|:| |mat| 9) (|:| |vec| 35)) (|Vector| $)
              (61 . |reducedSystem|) (|Vector| 6)
              (|LinearSystemMatrixPackage| 6 35 35 9) (67 . |solve|)
              (73 . |Zero|) (77 . |empty?|) (82 . |particularSolution|)
              (88 . |zero|) (93 . =) (99 . |particularSolution|)
              (|Union| 54 '"failed")
              (|Record| (|:| |particular| 44) (|:| |basis| (|List| 54)))
              (105 . |solveLinear|) (111 . |solveLinear|) (|Fraction| 6)
              (117 . |coerce|) (|Matrix| 48) (|Mapping| 48 6)
              (|MatrixCategoryFunctions2| 6 35 35 9 48 54 54 50) (122 . |map|)
              (|Vector| 48) (|VectorFunctions2| 6 48) (128 . |map|)
              (|LinearSystemMatrixPackage| 48 54 54 50) (134 . |solve|)
              (140 . |Zero|) (144 . |particularSolution|)
              (150 . |particularSolution|))
           '#(|solveLinear| 156 |particularSolution| 180 |linearlyDependent?|
              204 |linearDependence| 209)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 61
                                                 '(1 9 8 0 10 0 6 0 11 0 7 0 12
                                                   1 14 13 0 15 2 14 7 0 13 16
                                                   1 7 17 0 18 1 19 0 14 20 1 7
                                                   9 21 22 1 9 23 0 24 1 13 17
                                                   0 25 2 0 29 19 14 30 2 0 29
                                                   14 7 31 2 7 32 21 33 34 2 36
                                                   29 9 35 37 0 6 0 38 1 14 17
                                                   0 39 2 0 27 14 7 40 1 14 0
                                                   23 41 2 14 17 0 0 42 2 0 27
                                                   19 14 43 2 0 45 19 14 46 2 0
                                                   45 14 7 47 1 48 0 6 49 2 52
                                                   50 51 9 53 2 55 54 51 35 56
                                                   2 57 45 50 54 58 0 48 0 59 2
                                                   0 44 14 7 60 2 0 44 19 14 61
                                                   2 1 29 14 7 31 2 1 29 19 14
                                                   30 2 2 45 19 14 46 2 2 45 14
                                                   7 47 2 1 27 14 7 40 2 1 27
                                                   19 14 43 2 2 44 14 7 60 2 2
                                                   44 19 14 61 1 0 17 14 26 1 0
                                                   27 14 28)))))
           '|lookupComplete|)) 
