
(SDEFUN |SCPKG;matrix2Vector| ((|m| (|Matrix| R)) (% (|Vector| R)))
        (SPROG ((|li| (|List| R)) (|lili| (|List| (|List| R))))
               (SEQ (LETT |lili| (SPADCALL |m| (QREFELT % 9)))
                    (LETT |li| (SPADCALL (ELT % 11) |lili| (QREFELT % 13)))
                    (EXIT (SPADCALL |li| (QREFELT % 15)))))) 

(SDEFUN |SCPKG;coordinates;MLV;2|
        ((|x| (|Matrix| R)) (|b| (|List| (|Matrix| R))) (% (|Vector| R)))
        (SPROG
         ((|res| (|Union| (|Vector| R) "failed")) (#1=#:G23 NIL) (|i| NIL)
          (|transitionMatrix| (|Matrix| R)) (|n| (|NonNegativeInteger|))
          (|m| (|NonNegativeInteger|)) (#2=#:G15 NIL))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #2# (LENGTH |b|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |n|
                (* (ANROWS (SPADCALL |b| 1 (QREFELT % 19)))
                   (ANCOLS (SPADCALL |b| 1 (QREFELT % 19)))))
          (LETT |transitionMatrix|
                (MAKE_MATRIX1 |n| |m| (|spadConstant| % 20)))
          (SEQ (LETT |i| 1) (LETT #1# |m|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |transitionMatrix| |i|
                           (|SCPKG;matrix2Vector|
                            (SPADCALL |b| |i| (QREFELT % 19)) %)
                           (QREFELT % 21))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |res|
                (SPADCALL |transitionMatrix| (|SCPKG;matrix2Vector| |x| %)
                          (QREFELT % 24)))
          (EXIT
           (COND
            ((QEQCAR |res| 1) (|error| "coordinates: solveUniquely failed"))
            ('T (QCDR |res|))))))) 

(SDEFUN |SCPKG;structuralConstants;LV;3|
        ((|b| (|List| (|Matrix| R))) (% (|Vector| (|Matrix| R))))
        (SPROG
         ((#1=#:G41 NIL) (|k| NIL) (|covec| (|Vector| R)) (#2=#:G40 NIL)
          (|j| NIL) (#3=#:G39 NIL) (|i| NIL) (|sC| (|Vector| (|Matrix| R)))
          (#4=#:G36 NIL) (#5=#:G38 NIL) (#6=#:G37 NIL)
          (|m| (|NonNegativeInteger|)) (#7=#:G24 NIL))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #7# (LENGTH |b|))
                  (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #7#)))
          (LETT |sC|
                (PROGN
                 (LETT #6# (GETREFV |m|))
                 (SEQ (LETT |k| 1) (LETT #5# |m|) (LETT #4# 0) G190
                      (COND ((|greater_SI| |k| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #6# #4#
                                (MAKE_MATRIX1 |m| |m| (|spadConstant| % 20)))))
                      (LETT #4#
                            (PROG1 (|inc_SI| #4#) (LETT |k| (|inc_SI| |k|))))
                      (GO G190) G191 (EXIT NIL))
                 #6#))
          (SEQ (LETT |i| 1) (LETT #3# |m|) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# |m|) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (LETT |covec|
                             (SPADCALL
                              (SPADCALL (SPADCALL |b| |i| (QREFELT % 19))
                                        (SPADCALL |b| |j| (QREFELT % 19))
                                        (QREFELT % 26))
                              |b| (QREFELT % 25)))
                       (EXIT
                        (SEQ (LETT |k| 1) (LETT #1# |m|) G190
                             (COND ((|greater_SI| |k| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL (SPADCALL |sC| |k| (QREFELT % 28)) |i|
                                         |j|
                                         (SPADCALL |covec| |k| (QREFELT % 29))
                                         (QREFELT % 30))))
                             (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |sC|)))) 

(SDEFUN |SCPKG;structuralConstants;LMV;4|
        ((|ls| (|List| (|Symbol|))) (|mt| (|Matrix| (|Polynomial| R)))
         (% (|Vector| (|Matrix| (|Polynomial| R)))))
        (SPROG
         ((|lscopy| (|List| (|Symbol|)))
          (|gamma| (|List| (|Matrix| (|Polynomial| R)))) (|c| (|Polynomial| R))
          (|p| (|Polynomial| R)) (#1=#:G57 NIL) (|j| NIL) (#2=#:G56 NIL)
          (|i| NIL) (|s| (|Symbol|)) (|mat| (|Matrix| (|Polynomial| R)))
          (|nn| (|NonNegativeInteger|)))
         (SEQ (LETT |nn| (LENGTH |ls|))
              (COND
               ((OR (SPADCALL (ANROWS |mt|) |nn| (QREFELT % 34))
                    (SPADCALL (ANCOLS |mt|) |nn| (QREFELT % 34)))
                (EXIT
                 (|error|
                  "structuralConstants: size of second argument does not agree with number of generators"))))
              (LETT |gamma| NIL) (LETT |lscopy| (SPADCALL |ls| (QREFELT % 36)))
              (SEQ G190 (COND ((NULL (NULL (NULL |lscopy|))) (GO G191)))
                   (SEQ
                    (LETT |mat| (MAKE_MATRIX1 |nn| |nn| (|spadConstant| % 38)))
                    (LETT |s| (|SPADfirst| |lscopy|))
                    (SEQ (LETT |i| 1) (LETT #2# |nn|) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #1# |nn|) G190
                                (COND ((|greater_SI| |j| #1#) (GO G191)))
                                (SEQ (LETT |p| (QAREF2O |mt| |i| |j| 1 1))
                                     (EXIT
                                      (COND
                                       ((> (SPADCALL |p| |ls| (QREFELT % 39))
                                           1)
                                        (|error|
                                         "structuralConstants: entries of second argument must be linear polynomials in the generators"))
                                       ((SPADCALL
                                         (LETT |c|
                                               (SPADCALL |p| |s| 1
                                                         (QREFELT % 41)))
                                         (|spadConstant| % 38) (QREFELT % 42))
                                        (QSETAREF2O |mat| |i| |j| |c| 1 1)))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |gamma| (CONS |mat| |gamma|))
                    (EXIT (LETT |lscopy| (CDR |lscopy|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (REVERSE |gamma|) (QREFELT % 45)))))) 

(SDEFUN |SCPKG;structuralConstants;LMV;5|
        ((|ls| (|List| (|Symbol|)))
         (|mt| (|Matrix| (|Fraction| (|Polynomial| R))))
         (% (|Vector| (|Matrix| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((|lscopy| (|List| (|Symbol|)))
          (|gamma| (|List| (|Matrix| (|Fraction| (|Polynomial| R)))))
          (|c| (|Polynomial| R)) (|p| (|Polynomial| R)) (|q| (|Polynomial| R))
          (|r| (|Fraction| (|Polynomial| R))) (#1=#:G74 NIL) (|j| NIL)
          (#2=#:G73 NIL) (|i| NIL) (|s| (|Symbol|))
          (|mat| (|Matrix| (|Fraction| (|Polynomial| R))))
          (|nn| (|NonNegativeInteger|)))
         (SEQ (LETT |nn| (LENGTH |ls|))
              (COND
               ((OR (SPADCALL (ANROWS |mt|) |nn| (QREFELT % 34))
                    (SPADCALL (ANCOLS |mt|) |nn| (QREFELT % 34)))
                (EXIT
                 (|error|
                  "structuralConstants: size of second argument does not agree with number of generators"))))
              (LETT |gamma| NIL) (LETT |lscopy| (SPADCALL |ls| (QREFELT % 36)))
              (SEQ G190 (COND ((NULL (NULL (NULL |lscopy|))) (GO G191)))
                   (SEQ
                    (LETT |mat| (MAKE_MATRIX1 |nn| |nn| (|spadConstant| % 49)))
                    (LETT |s| (|SPADfirst| |lscopy|))
                    (SEQ (LETT |i| 1) (LETT #2# |nn|) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #1# |nn|) G190
                                (COND ((|greater_SI| |j| #1#) (GO G191)))
                                (SEQ (LETT |r| (QAREF2O |mt| |i| |j| 1 1))
                                     (LETT |q| (SPADCALL |r| (QREFELT % 50)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |q| |ls| (QREFELT % 39)) 0
                                         (QREFELT % 34))
                                        (|error|
                                         "structuralConstants: entries of second argument must be (linear) polynomials in the generators"))
                                       ('T
                                        (SEQ
                                         (LETT |p|
                                               (SPADCALL |r| (QREFELT % 51)))
                                         (EXIT
                                          (COND
                                           ((>
                                             (SPADCALL |p| |ls| (QREFELT % 39))
                                             1)
                                            (|error|
                                             "structuralConstants: entries of second argument must be linear polynomials in the generators"))
                                           ((SPADCALL
                                             (LETT |c|
                                                   (SPADCALL |p| |s| 1
                                                             (QREFELT % 41)))
                                             (|spadConstant| % 38)
                                             (QREFELT % 42))
                                            (QSETAREF2O |mat| |i| |j|
                                                        (SPADCALL |c| |q|
                                                                  (QREFELT %
                                                                           52))
                                                        1 1)))))))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |gamma| (CONS |mat| |gamma|))
                    (EXIT (LETT |lscopy| (CDR |lscopy|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (REVERSE |gamma|) (QREFELT % 55)))))) 

(DECLAIM (NOTINLINE |StructuralConstantsPackage;|)) 

(DEFUN |StructuralConstantsPackage;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|StructuralConstantsPackage| DV$1))
          (LETT % (GETREFV 58))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|StructuralConstantsPackage|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |StructuralConstantsPackage| (#1=#:G75)
  (SPROG NIL
         (PROG (#2=#:G76)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|StructuralConstantsPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|StructuralConstantsPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|StructuralConstantsPackage|)))))))))) 

(MAKEPROP '|StructuralConstantsPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 10) (|Matrix| 6)
              (0 . |listOfLists|) (|List| 6) (5 . |concat|)
              (|Mapping| 10 10 10) (11 . |reduce|) (|Vector| 6)
              (17 . |construct|) (22 . |One|) (|Integer|) (|List| 8)
              (26 . |elt|) (32 . |Zero|) (36 . |setColumn!|)
              (|Union| 14 '"failed") (|LinearSystemMatrixPackage2| 6)
              (43 . |solveUniquely|) |SCPKG;coordinates;MLV;2| (49 . *)
              (|Vector| 8) (55 . |elt|) (61 . |elt|) (67 . |setelt!|)
              |SCPKG;structuralConstants;LV;3| (|Boolean|)
              (|NonNegativeInteger|) (75 . ~=) (|List| 40) (81 . |copy|)
              (|Polynomial| 6) (86 . |Zero|) (90 . |totalDegree|) (|Symbol|)
              (96 . |coefficient|) (103 . ~=) (|List| 46) (|Vector| 46)
              (109 . |vector|) (|Matrix| 37) |SCPKG;structuralConstants;LMV;4|
              (|Fraction| 37) (114 . |Zero|) (118 . |denom|) (123 . |numer|)
              (128 . /) (|List| 56) (|Vector| 56) (134 . |vector|)
              (|Matrix| 48) |SCPKG;structuralConstants;LMV;5|)
           '#(|structuralConstants| 139 |coordinates| 156) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|structuralConstants|
                                 ((|Vector|
                                   (|Matrix| (|Fraction| (|Polynomial| |#1|))))
                                  (|List| (|Symbol|))
                                  (|Matrix| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|structuralConstants|
                                 ((|Vector| (|Matrix| (|Polynomial| |#1|)))
                                  (|List| (|Symbol|))
                                  (|Matrix| (|Polynomial| |#1|))))
                                T)
                              '((|structuralConstants|
                                 ((|Vector| (|Matrix| |#1|))
                                  (|List| (|Matrix| |#1|))))
                                T)
                              '((|coordinates|
                                 ((|Vector| |#1|) (|Matrix| |#1|)
                                  (|List| (|Matrix| |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 57
                                            '(1 8 7 0 9 2 10 0 0 0 11 2 7 10 12
                                              0 13 1 14 0 10 15 0 6 0 16 2 18 8
                                              0 17 19 0 6 0 20 3 8 0 0 17 14 21
                                              2 23 22 8 14 24 2 8 0 0 0 26 2 27
                                              8 0 17 28 2 14 6 0 17 29 4 8 6 0
                                              17 17 6 30 2 33 32 0 0 34 1 35 0
                                              0 36 0 37 0 38 2 37 33 0 35 39 3
                                              37 0 0 40 33 41 2 37 32 0 0 42 1
                                              44 0 43 45 0 48 0 49 1 48 37 0 50
                                              1 48 37 0 51 2 48 0 37 37 52 1 54
                                              0 53 55 1 0 27 18 31 2 0 54 35 56
                                              57 2 0 44 35 46 47 2 0 14 8 18
                                              25)))))
           '|lookupComplete|)) 
