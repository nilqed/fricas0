
(SDEFUN |LSMP2;solveUniquely;MVU;1|
        ((|m| (|Matrix| S)) (|v| (|Vector| S))
         (% (|Union| (|Vector| S) "failed")))
        (SPROG
         ((|res|
           (|Record| (|:| |particular| (|Union| (|Vector| S) "failed"))
                     (|:| |basis| (|List| (|Vector| S))))))
         (SEQ (LETT |res| (SPADCALL |m| |v| (QREFELT % 12)))
              (COND ((NULL (NULL (QCDR |res|))) (EXIT (CONS 1 "failed"))))
              (EXIT
               (COND ((QEQCAR (QCAR |res|) 1) (CONS 1 "failed"))
                     ('T (QCAR |res|))))))) 

(SDEFUN |LSMP2;solveUniquely;MVU;2|
        ((|m| (|Matrix| S)) (|v| (|Vector| S))
         (% (|Union| (|Vector| S) "failed")))
        (SPROG
         ((#1=#:G27 NIL) (|cu| (|Union| S "failed")) (|cq| (|Fraction| S))
          (#2=#:G28 NIL) (|i| NIL) (|u| (|Vector| S))
          (|n| (|NonNegativeInteger|)) (|rp| (|Vector| (|Fraction| S)))
          (|rpu| #3=(|Union| (|Vector| (|Fraction| S)) "failed"))
          (|res|
           (|Record| (|:| |particular| #3#)
                     (|:| |basis| (|List| (|Vector| (|Fraction| S))))))
          (|m1| (|Matrix| (|Fraction| S))) (|v1| (|Vector| (|Fraction| S))))
         (SEQ
          (EXIT
           (SEQ (LETT |v1| (SPADCALL (ELT % 15) |v| (QREFELT % 19)))
                (LETT |m1| (SPADCALL (ELT % 15) |m| (QREFELT % 22)))
                (LETT |res| (SPADCALL |m1| |v1| (QREFELT % 26)))
                (COND ((NULL (NULL (QCDR |res|))) (EXIT (CONS 1 "failed"))))
                (LETT |rpu| (QCAR |res|))
                (EXIT
                 (COND ((QEQCAR |rpu| 1) (CONS 1 "failed"))
                       ('T
                        (SEQ (LETT |rp| (QCDR |rpu|)) (LETT |n| (QVSIZE |rp|))
                             (LETT |u| (MAKEARR1 |n| (|spadConstant| % 27)))
                             (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                                  (SEQ
                                   (LETT |cq|
                                         (SPADCALL |rp| |i| (QREFELT % 30)))
                                   (LETT |cu| (SPADCALL |cq| (QREFELT % 32)))
                                   (EXIT
                                    (COND
                                     ((QEQCAR |cu| 1)
                                      (PROGN
                                       (LETT #1# (CONS 1 "failed"))
                                       (GO #4=#:G26)))
                                     ('T
                                      (SPADCALL |u| |i| (QCDR |cu|)
                                                (QREFELT % 33))))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS 0 |u|))))))))
          #4# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |LinearSystemMatrixPackage2;|)) 

(DEFUN |LinearSystemMatrixPackage2;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|LinearSystemMatrixPackage2| DV$1))
          (LETT % (GETREFV 34))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|LinearSystemMatrixPackage2|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasCategory| |#1| '(|Field|))
            (PROGN
             (QSETREFV % 13
                       (CONS (|dispatchFunction| |LSMP2;solveUniquely;MVU;1|)
                             %))))
           ('T
            (PROGN
             (QSETREFV % 13
                       (CONS (|dispatchFunction| |LSMP2;solveUniquely;MVU;2|)
                             %)))))
          %))) 

(DEFUN |LinearSystemMatrixPackage2| (#1=#:G29)
  (SPROG NIL
         (PROG (#2=#:G30)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|LinearSystemMatrixPackage2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|LinearSystemMatrixPackage2;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearSystemMatrixPackage2|)))))))))) 

(MAKEPROP '|LinearSystemMatrixPackage2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Union| 10 '#1="failed")
              (|Record| (|:| |particular| 7) (|:| |basis| (|List| 10)))
              (|Matrix| 6) (|Vector| 6) (|LinearSystemMatrixPackage| 6 10 10 9)
              (0 . |solve|) (6 . |solveUniquely|) (|Fraction| 6)
              (12 . |coerce|) (|Vector| 14) (|Mapping| 14 6)
              (|VectorFunctions2| 6 14) (17 . |map|) (|Matrix| 14)
              (|MatrixCategoryFunctions2| 6 10 10 9 14 16 16 20) (23 . |map|)
              (|Union| 16 '#1#)
              (|Record| (|:| |particular| 23) (|:| |basis| (|List| 16)))
              (|LinearSystemMatrixPackage| 14 16 16 20) (29 . |solve|)
              (35 . |Zero|) (39 . |Zero|) (|Integer|) (43 . |elt|)
              (|Union| 6 '"failed") (49 . |retractIfCan|) (54 . |setelt!|))
           '#(|solveUniquely| 61) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|solveUniquely|
                                 ((|Union| (|Vector| |#1|) "failed")
                                  (|Matrix| |#1|) (|Vector| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 33
                                            '(2 11 8 9 10 12 2 0 7 9 10 13 1 14
                                              0 6 15 2 18 16 17 10 19 2 21 20
                                              17 9 22 2 25 24 20 16 26 0 6 0 27
                                              0 14 0 28 2 16 14 0 29 30 1 14 31
                                              0 32 3 10 6 0 29 6 33 2 0 7 9 10
                                              13)))))
           '|lookupComplete|)) 
