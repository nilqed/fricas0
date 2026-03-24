
(SDEFUN |LINDEP;aNonZeroSolution|
        ((|m| (|Matrix| S)) (% (|Union| (|Vector| S) "failed")))
        (SPROG ((|ns| (|List| (|Vector| S))))
               (COND
                ((NULL (LETT |ns| (SPADCALL |m| (QREFELT % 10))))
                 (CONS 1 "failed"))
                ('T (CONS 0 (|SPADfirst| |ns|)))))) 

(SDEFUN |LINDEP;linearlyDependent?;VB;2| ((|v| (|Vector| R)) (% (|Boolean|)))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (COND ((ZEROP (LETT |n| (QVSIZE |v|))) 'T)
                     ((EQL |n| 1)
                      (SPADCALL
                       (SPADCALL |v| (SPADCALL |v| (QREFELT % 14))
                                 (QREFELT % 15))
                       (QREFELT % 17)))
                     ('T
                      (PLUSP
                       (SPADCALL
                        (SPADCALL (SPADCALL |v| (QREFELT % 19)) (QREFELT % 21))
                        (QREFELT % 23))))))) 

(SDEFUN |LINDEP;linearDependence;VU;3|
        ((|v| (|Vector| R)) (% (|Union| (|Vector| S) "failed")))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (COND ((ZEROP (LETT |n| (QVSIZE |v|))) (CONS 0 (MAKE-ARRAY 0)))
                     ((EQL |n| 1)
                      (COND
                       ((SPADCALL
                         (SPADCALL |v| (SPADCALL |v| (QREFELT % 14))
                                   (QREFELT % 15))
                         (QREFELT % 17))
                        (CONS 0 (MAKEARR1 1 (|spadConstant| % 11))))
                       (#1='T (CONS 1 "failed"))))
                     (#1#
                      (|LINDEP;aNonZeroSolution|
                       (SPADCALL (SPADCALL |v| (QREFELT % 19)) (QREFELT % 21))
                       %))))) 

(SDEFUN |LINDEP;solveLinear;VRR;4|
        ((|v| (|Vector| R)) (|c| (R))
         (%
          (|Record| (|:| |particular| (|Union| (|Vector| S) "failed"))
                    (|:| |basis| (|List| (|Vector| S))))))
        (SPADCALL (SPADCALL |v| (QREFELT % 19)) (MAKEARR1 1 |c|)
                  (QREFELT % 28))) 

(SDEFUN |LINDEP;solveLinear;MVR;5|
        ((|m| (|Matrix| R)) (|v| (|Vector| R))
         (%
          (|Record| (|:| |particular| (|Union| (|Vector| S) "failed"))
                    (|:| |basis| (|List| (|Vector| S))))))
        (SPROG
         ((|sys| (|Record| (|:| |mat| (|Matrix| S)) (|:| |vec| (|Vector| S)))))
         (SEQ (LETT |sys| (SPADCALL |m| |v| (QREFELT % 32)))
              (EXIT (SPADCALL (QCAR |sys|) (QCDR |sys|) (QREFELT % 35)))))) 

(SDEFUN |LINDEP;particularSolution;VRU;6|
        ((|v| (|Vector| R)) (|c| (R)) (% (|Union| (|Vector| S) "failed")))
        (COND
         ((SPADCALL |c| (QREFELT % 17))
          (CONS 0 (MAKEARR1 (QVSIZE |v|) (|spadConstant| % 36))))
         ((SPADCALL |v| (QREFELT % 37)) (CONS 1 "failed"))
         ('T (QCAR (SPADCALL |v| |c| (QREFELT % 29)))))) 

(SDEFUN |LINDEP;particularSolution;MVU;7|
        ((|m| (|Matrix| R)) (|v| (|Vector| R))
         (% (|Union| (|Vector| S) "failed")))
        (COND
         ((SPADCALL |v| (SPADCALL (QVSIZE |v|) (QREFELT % 39)) (QREFELT % 40))
          (CONS 0 (MAKEARR1 (ANCOLS |m|) (|spadConstant| % 36))))
         ('T (QCAR (SPADCALL |m| |v| (QREFELT % 28)))))) 

(SDEFUN |LINDEP;solveLinear;VRR;8|
        ((|v| (|Vector| R)) (|c| (R))
         (%
          (|Record|
           (|:| |particular| (|Union| (|Vector| (|Fraction| S)) "failed"))
           (|:| |basis| (|List| (|Vector| (|Fraction| S)))))))
        (SPADCALL (SPADCALL |v| (QREFELT % 19)) (MAKEARR1 1 |c|)
                  (QREFELT % 44))) 

(SDEFUN |LINDEP;solveLinear;MVR;9|
        ((|m| (|Matrix| R)) (|v| (|Vector| R))
         (%
          (|Record|
           (|:| |particular| (|Union| (|Vector| (|Fraction| S)) "failed"))
           (|:| |basis| (|List| (|Vector| (|Fraction| S)))))))
        (SPROG
         ((|sys| (|Record| (|:| |mat| (|Matrix| S)) (|:| |vec| (|Vector| S)))))
         (SEQ (LETT |sys| (SPADCALL |m| |v| (QREFELT % 32)))
              (EXIT
               (SPADCALL (SPADCALL (ELT % 47) (QCAR |sys|) (QREFELT % 51))
                         (SPADCALL (ELT % 47) (QCDR |sys|) (QREFELT % 54))
                         (QREFELT % 56)))))) 

(SDEFUN |LINDEP;particularSolution;VRU;10|
        ((|v| (|Vector| R)) (|c| (R))
         (% (|Union| (|Vector| (|Fraction| S)) "failed")))
        (COND
         ((SPADCALL |c| (QREFELT % 17))
          (CONS 0 (MAKEARR1 (QVSIZE |v|) (|spadConstant| % 57))))
         ((SPADCALL |v| (QREFELT % 37)) (CONS 1 "failed"))
         ('T (QCAR (SPADCALL |v| |c| (QREFELT % 45)))))) 

(SDEFUN |LINDEP;particularSolution;MVU;11|
        ((|m| (|Matrix| R)) (|v| (|Vector| R))
         (% (|Union| (|Vector| (|Fraction| S)) "failed")))
        (COND
         ((SPADCALL |v| (SPADCALL (QVSIZE |v|) (QREFELT % 39)) (QREFELT % 40))
          (CONS 0 (MAKEARR1 (ANCOLS |m|) (|spadConstant| % 57))))
         ('T (QCAR (SPADCALL |m| |v| (QREFELT % 44)))))) 

(DECLAIM (NOTINLINE |LinearDependence;|)) 

(DEFUN |LinearDependence;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (#1=#:G64 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|LinearDependence| DV$1 DV$2))
          (LETT % (GETREFV 60))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|Field|)))
                                              (|not| #1#)))))
          (|haddProp| |$ConstructorCache| '|LinearDependence| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 29
                       (CONS (|dispatchFunction| |LINDEP;solveLinear;VRR;4|)
                             %))
             (QSETREFV % 28
                       (CONS (|dispatchFunction| |LINDEP;solveLinear;MVR;5|)
                             %))
             (QSETREFV % 38
                       (CONS
                        (|dispatchFunction| |LINDEP;particularSolution;VRU;6|)
                        %))
             (QSETREFV % 41
                       (CONS
                        (|dispatchFunction| |LINDEP;particularSolution;MVU;7|)
                        %))))
           ('T
            (PROGN
             (QSETREFV % 45
                       (CONS (|dispatchFunction| |LINDEP;solveLinear;VRR;8|)
                             %))
             (QSETREFV % 44
                       (CONS (|dispatchFunction| |LINDEP;solveLinear;MVR;9|)
                             %))
             (QSETREFV % 58
                       (CONS
                        (|dispatchFunction| |LINDEP;particularSolution;VRU;10|)
                        %))
             (QSETREFV % 59
                       (CONS
                        (|dispatchFunction| |LINDEP;particularSolution;MVU;11|)
                        %)))))
          %))) 

(DEFUN |LinearDependence| (&REST #1=#:G65)
  (SPROG NIL
         (PROG (#2=#:G66)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearDependence|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LinearDependence;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LinearDependence|)))))))))) 

(MAKEPROP '|LinearDependence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 33)
              (|Matrix| 6) (0 . |nullSpace|) (5 . |One|) (|Integer|)
              (|Vector| 7) (9 . |minIndex|) (14 . |elt|) (|Boolean|)
              (20 . |zero?|) (|Matrix| 7) (25 . |transpose|) (|Matrix| %)
              (30 . |reducedSystem|) (|NonNegativeInteger|) (35 . |nullity|)
              |LINDEP;linearlyDependent?;VB;2| (|Union| 33 '#1="failed")
              |LINDEP;linearDependence;VU;3|
              (|Record| (|:| |particular| 25) (|:| |basis| 8))
              (40 . |solveLinear|) (46 . |solveLinear|)
              (|Record| (|:| |mat| 9) (|:| |vec| 33)) (|Vector| %)
              (52 . |reducedSystem|) (|Vector| 6)
              (|LinearSystemMatrixPackage| 6 33 33 9) (58 . |solve|)
              (64 . |Zero|) (68 . |empty?|) (73 . |particularSolution|)
              (79 . |zero|) (84 . =) (90 . |particularSolution|)
              (|Union| 52 '#2="failed")
              (|Record| (|:| |particular| 42) (|:| |basis| (|List| 52)))
              (96 . |solveLinear|) (102 . |solveLinear|) (|Fraction| 6)
              (108 . |coerce|) (|Matrix| 46) (|Mapping| 46 6)
              (|MatrixCategoryFunctions2| 6 33 33 9 46 52 52 48) (113 . |map|)
              (|Vector| 46) (|VectorFunctions2| 6 46) (119 . |map|)
              (|LinearSystemMatrixPackage| 46 52 52 48) (125 . |solve|)
              (131 . |Zero|) (135 . |particularSolution|)
              (141 . |particularSolution|))
           '#(|solveLinear| 147 |particularSolution| 171 |linearlyDependent?|
              195 |linearDependence| 200)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|linearlyDependent?|
                                 ((|Boolean|) (|Vector| |#2|)))
                                T)
                              '((|linearDependence|
                                 ((|Union| (|Vector| |#1|) #1#)
                                  (|Vector| |#2|)))
                                T)
                              '((|particularSolution|
                                 ((|Union| (|Vector| |#1|) #1#) (|Vector| |#2|)
                                  |#2|))
                                (|has| 6 (|Field|)))
                              '((|particularSolution|
                                 ((|Union| (|Vector| |#1|) #1#) (|Matrix| |#2|)
                                  (|Vector| |#2|)))
                                (|has| 6 (|Field|)))
                              '((|solveLinear|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union| (|Vector| |#1|) #1#))
                                   (|:| |basis| (|List| (|Vector| |#1|))))
                                  (|Vector| |#2|) |#2|))
                                (|has| 6 (|Field|)))
                              '((|solveLinear|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union| (|Vector| |#1|) #1#))
                                   (|:| |basis| (|List| (|Vector| |#1|))))
                                  (|Matrix| |#2|) (|Vector| |#2|)))
                                (|has| 6 (|Field|)))
                              '((|particularSolution|
                                 ((|Union| (|Vector| (|Fraction| |#1|)) #2#)
                                  (|Vector| |#2|) |#2|))
                                (|not| (|has| 6 (|Field|))))
                              '((|particularSolution|
                                 ((|Union| (|Vector| (|Fraction| |#1|)) #2#)
                                  (|Matrix| |#2|) (|Vector| |#2|)))
                                (|not| (|has| 6 (|Field|))))
                              '((|solveLinear|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union| (|Vector| (|Fraction| |#1|))
                                                 #2#))
                                   (|:| |basis|
                                        (|List| (|Vector| (|Fraction| |#1|)))))
                                  (|Vector| |#2|) |#2|))
                                (|not| (|has| 6 (|Field|))))
                              '((|solveLinear|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union| (|Vector| (|Fraction| |#1|))
                                                 #2#))
                                   (|:| |basis|
                                        (|List| (|Vector| (|Fraction| |#1|)))))
                                  (|Matrix| |#2|) (|Vector| |#2|)))
                                (|not| (|has| 6 (|Field|)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 59
                                            '(1 9 8 0 10 0 6 0 11 1 13 12 0 14
                                              2 13 7 0 12 15 1 7 16 0 17 1 18 0
                                              13 19 1 7 9 20 21 1 9 22 0 23 2 0
                                              27 18 13 28 2 0 27 13 7 29 2 7 30
                                              20 31 32 2 34 27 9 33 35 0 6 0 36
                                              1 13 16 0 37 2 0 25 13 7 38 1 13
                                              0 22 39 2 13 16 0 0 40 2 0 25 18
                                              13 41 2 0 43 18 13 44 2 0 43 13 7
                                              45 1 46 0 6 47 2 50 48 49 9 51 2
                                              53 52 49 33 54 2 55 43 48 52 56 0
                                              46 0 57 2 0 42 13 7 58 2 0 42 18
                                              13 59 2 1 27 18 13 28 2 1 27 13 7
                                              29 2 2 43 13 7 45 2 2 43 18 13 44
                                              2 1 25 18 13 41 2 1 25 13 7 38 2
                                              2 42 18 13 59 2 2 42 13 7 58 1 0
                                              16 13 24 1 0 25 13 26)))))
           '|lookupComplete|)) 
