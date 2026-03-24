
(SDEFUN |TENSOR;termgreater?|
        ((|t1| (|Record| (|:| |k| (|Product| B1 B2)) (|:| |c| R)))
         (|t2| (|Record| (|:| |k| (|Product| B1 B2)) (|:| |c| R)))
         (% (|Boolean|)))
        (SPADCALL (QCAR |t2|) (QCAR |t1|) (QREFELT % 13))) 

(SDEFUN |TENSOR;tensor;M1M2%;2| ((|x1| (M1)) (|x2| (M2)) (% (%)))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| (|Product| B1 B2)) (|:| |c| R))))
          (#1=#:G20 NIL) (|s2| NIL) (#2=#:G19 NIL) (|s1| NIL)
          (|ltx2| (|List| (|Record| (|:| |k| B2) (|:| |c| R))))
          (|ltx1| (|List| (|Record| (|:| |k| B1) (|:| |c| R)))) (#3=#:G18 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL |x1| (QREFELT % 14)) (SPADCALL |x2| (QREFELT % 16)))
             (PROGN (LETT #3# (|spadConstant| % 15)) (GO #4=#:G17)))
            ('T
             (SEQ (LETT |ltx1| (SPADCALL |x1| (QREFELT % 19)))
                  (LETT |ltx2| (SPADCALL |x2| (QREFELT % 22))) (LETT |res| NIL)
                  (SEQ (LETT |s1| NIL) (LETT #2# (REVERSE |ltx1|)) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |s1| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |s2| NIL) (LETT #1# (REVERSE |ltx2|)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |s2| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |res|
                                      (CONS
                                       (CONS
                                        (SPADCALL (QCAR |s1|) (QCAR |s2|)
                                                  (QREFELT % 23))
                                        (SPADCALL (QCDR |s1|) (QCDR |s2|)
                                                  (QREFELT % 24)))
                                       |res|))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |res| (QREFELT % 27)))))))
          #4# (EXIT #3#)))) 

(SDEFUN |TENSOR;*;3%;3| ((|x1| (%)) (|x2| (%)) (% (%)))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| (|Product| B1 B2)) (|:| |c| R))))
          (#1=#:G32 NIL) (|t| NIL) (|t2b| (M2)) (|t2a| (M1)) (|t1b| (M2))
          (|t1a| (M1)) (|t2k| #2=(|Product| B1 B2)) (|t1k| #2#) (#3=#:G31 NIL)
          (|t2| NIL) (#4=#:G30 NIL) (|t1| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |t1| NIL) (LETT #4# (SPADCALL |x1| (QREFELT % 29)))
                   G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |t1| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |t2| NIL)
                          (LETT #3# (SPADCALL |x2| (QREFELT % 29))) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |t2| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |t1k| (QCAR |t1|))
                               (LETT |t2k| (QCAR |t2|))
                               (LETT |t1a|
                                     (SPADCALL (QCDR |t1|)
                                               (SPADCALL |t1k| (QREFELT % 30))
                                               (QREFELT % 31)))
                               (LETT |t1b|
                                     (SPADCALL (|spadConstant| % 32)
                                               (SPADCALL |t1k| (QREFELT % 33))
                                               (QREFELT % 34)))
                               (LETT |t2a|
                                     (SPADCALL (QCDR |t2|)
                                               (SPADCALL |t2k| (QREFELT % 30))
                                               (QREFELT % 31)))
                               (LETT |t2b|
                                     (SPADCALL (|spadConstant| % 32)
                                               (SPADCALL |t2k| (QREFELT % 33))
                                               (QREFELT % 34)))
                               (EXIT
                                (SEQ (LETT |t| NIL)
                                     (LETT #1#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |t1a| |t2a|
                                                       (QREFELT % 35))
                                             (SPADCALL |t1b| |t2b|
                                                       (QREFELT % 36))
                                             (QREFELT % 28))
                                            (QREFELT % 29)))
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |t| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ (EXIT (LETT |res| (CONS |t| |res|))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT NIL))))
                          (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 37)))))) 

(SDEFUN |TENSOR;One;%;4| ((% (%)))
        (SPADCALL (|spadConstant| % 39) (|spadConstant| % 40) (QREFELT % 28))) 

(SDEFUN |TENSOR;coerce;%Of;5| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((|le| (|List| (|OutputForm|))) (|ko| (|OutputForm|)) (#1=#:G43 NIL)
          (|rec| NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 42))
            (SPADCALL (|spadConstant| % 43) (QREFELT % 45)))
           ('T
            (SEQ (LETT |le| NIL)
                 (SEQ (LETT |rec| NIL)
                      (LETT #1# (REVERSE (SPADCALL |x| (QREFELT % 29)))) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |ko|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCAR |rec|) (QREFELT % 30))
                                        (QREFELT % 46))
                              (SPADCALL (SPADCALL (QCAR |rec|) (QREFELT % 33))
                                        (QREFELT % 47))
                              (QREFELT % 48)))
                       (EXIT
                        (COND
                         ((SPADCALL (QCDR |rec|) (|spadConstant| % 32)
                                    (QREFELT % 49))
                          (LETT |le| (CONS |ko| |le|)))
                         ('T
                          (LETT |le|
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QCDR |rec|) (QREFELT % 45)) |ko|
                                  (QREFELT % 50))
                                 |le|))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL (ELT % 51) |le| (QREFELT % 54))))))))) 

(DECLAIM (NOTINLINE |TensorProduct;|)) 

(DEFUN |TensorProduct;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) (#1=#:G49 NIL) (% NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL)
    (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|TensorProduct| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 66))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#4|
                                                        (LIST '|Algebra|
                                                              (|devaluate|
                                                               |#1|)))
                                         (|HasCategory| |#5|
                                                        (LIST '|Algebra|
                                                              (|devaluate|
                                                               |#1|))))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#5|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#5|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate|
                                                           |#1|)))))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#5|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#5|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate|
                                                           |#1|)))))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#5|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#5|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate|
                                                           |#1|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#5|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#5|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate|
                                                           |#1|)))))
                                        (AND
                                         (|HasCategory| |#4|
                                                        (LIST
                                                         '|NonAssociativeAlgebra|
                                                         (|devaluate| |#1|)))
                                         (|HasCategory| |#4|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#5|
                                                        (LIST
                                                         '|NonAssociativeAlgebra|
                                                         (|devaluate| |#1|)))
                                         (|HasCategory| |#5|
                                                        '(|CommutativeRing|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#5|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#4|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#5|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#5|
                                                         '(|CommutativeRing|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#4|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#5|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#5|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#4|
                                                         '(|CommutativeStar|))
                                          (|HasCategory| |#5|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#5|
                                                         '(|CommutativeStar|))))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|Product| |#2| |#3|)
                                               '(|Comparable|)))
                                        (AND
                                         (|HasCategory| |#1| '(|Comparable|))
                                         #1#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#5|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#1|))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#5|
                                                         (LIST
                                                          '|NonAssociativeAlgebra|
                                                          (|devaluate|
                                                           |#1|)))))))))
    (|haddProp| |$ConstructorCache| '|TensorProduct|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasCategory| |#4| (LIST '|NonAssociativeAlgebra| (|devaluate| |#1|)))
      (COND
       ((|HasCategory| |#5| (LIST '|NonAssociativeAlgebra| (|devaluate| |#1|)))
        (QSETREFV % 38 (CONS (|dispatchFunction| |TENSOR;*;3%;3|) %))))))
    (COND
     ((|HasCategory| |#4| (LIST '|Algebra| (|devaluate| |#1|)))
      (COND
       ((|HasCategory| |#5| (LIST '|Algebra| (|devaluate| |#1|)))
        (QSETREFV % 41
                  (CONS #'|makeSpadConstant|
                        (LIST (|dispatchFunction| |TENSOR;One;%;4|) % 41)))))))
    %))) 

(DEFUN |TensorProduct| (&REST #1=#:G52)
  (SPROG NIL
         (PROG (#2=#:G53)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TensorProduct|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TensorProduct;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TensorProduct|)))))))))) 

(MAKEPROP '|TensorProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 12) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|Boolean|) (|Product| 7 8) (0 . <) (6 . |zero?|) (11 . |Zero|)
              (15 . |zero?|) (|Record| (|:| |k| 7) (|:| |c| 6)) (|List| 17)
              (20 . |listOfTerms|) (|Record| (|:| |k| 8) (|:| |c| 6))
              (|List| 20) (25 . |listOfTerms|) (30 . |construct|) (36 . *)
              (|Record| (|:| |k| 12) (|:| |c| 6)) (|List| 25)
              (42 . |constructOrdered|) |TENSOR;tensor;M1M2%;2|
              (47 . |listOfTerms|) (52 . |first|) (57 . |monomial|)
              (63 . |One|) (67 . |second|) (72 . |monomial|) (78 . *) (84 . *)
              (90 . |construct|) (95 . *) (101 . |One|) (105 . |One|)
              (109 . |One|) (113 . |zero?|) (118 . |Zero|) (|OutputForm|)
              (122 . |coerce|) (127 . |coerce|) (132 . |coerce|)
              (137 . |tensor|) (143 . =) (149 . *) (155 . +)
              (|Mapping| 44 44 44) (|List| 44) (161 . |reduce|)
              |TENSOR;coerce;%Of;5| (|String|) (|PositiveInteger|) (|List| %)
              (|List| 6) (|List| 12) (|Mapping| 6 6) (|NonNegativeInteger|)
              (|Union| % '"failed") (|Integer|) (|Mapping| 6 12))
           '#(~= 167 |zero?| 173 |tensor| 178 |support| 184 |subtractIfCan| 189
              |smaller?| 195 |sample| 201 |rightRecip| 205 |rightPower| 210
              |reductum| 222 |recip| 227 |plenaryPower| 232 |opposite?| 238
              |one?| 244 |numberOfMonomials| 249 |monomials| 254 |monomial?|
              259 |monomial| 264 |map| 270 |listOfTerms| 276 |linearExtend| 281
              |leftRecip| 287 |leftPower| 292 |leadingTerm| 304
              |leadingSupport| 309 |leadingMonomial| 314 |leadingCoefficient|
              319 |latex| 324 |constructOrdered| 329 |construct| 334
              |commutator| 339 |coerce| 345 |coefficients| 365 |coefficient|
              370 |characteristic| 376 |associator| 380 |antiCommutator| 387
              |annihilate?| 393 ^ 399 |Zero| 411 |One| 415 = 419 - 425 + 436 *
              442)
           'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(6 6 1 7 6 7 5 7 0 0 6 7 0 0 7 7 0 0 7 5 7 0 0
                                  0 2 7 7 4 5 7 7 3 5 11 0 8 0 8 7 0 0))
            (CONS
             '#(NIL |Algebra&| |Algebra&| NIL |NonAssociativeAlgebra&| |Rng&|
                |NonAssociativeAlgebra&| NIL |FreeModuleCategory&| NIL
                |Module&| NIL NIL |Module&| NIL |NonAssociativeRing&| NIL NIL
                NIL |NonAssociativeRng&| NIL NIL NIL NIL |AbelianGroup&| NIL
                NIL NIL |NonAssociativeSemiRng&| NIL |MagmaWithUnit&|
                |AbelianMonoid&| |Magma&| NIL |AbelianSemiGroup&| NIL
                |SetCategory&| NIL NIL NIL |BasicType&|)
             (CONS
              '#((|CommutativeRing|) (|Algebra| $$) (|Algebra| 6) (|Ring|)
                 (|NonAssociativeAlgebra| $$) (|Rng|)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|)
                 (|FreeModuleCategory| 6 (|Product| 7 8))
                 (|TensorProductCategory| 6 9 10) (|Module| $$) (|SemiRng|)
                 (|IndexedDirectProductCategory| 6 (|Product| 7 8))
                 (|Module| 6) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|BiModule| 6 6) (|IndexedProductCategory| 6 (|Product| 7 8))
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|Magma|) (|Comparable|)
                 (|AbelianSemiGroup|) (|CommutativeStar|) (|SetCategory|)
                 (|TwoSidedRecip|) (|unitsKnown|) (|CoercibleTo| 44)
                 (|BasicType|))
              (|makeByteWordVec2| 65
                                  '(2 12 11 0 0 13 1 9 11 0 14 0 0 0 15 1 10 11
                                    0 16 1 9 18 0 19 1 10 21 0 22 2 12 0 7 8 23
                                    2 6 0 0 0 24 1 0 0 26 27 1 0 26 0 29 1 12 7
                                    0 30 2 9 0 6 7 31 0 6 0 32 1 12 8 0 33 2 10
                                    0 6 8 34 2 9 0 0 0 35 2 10 0 0 0 36 1 0 0
                                    26 37 2 0 0 0 0 38 0 9 0 39 0 10 0 40 0 0 0
                                    41 1 0 11 0 42 0 6 0 43 1 6 44 0 45 1 7 44
                                    0 46 1 8 44 0 47 2 44 0 0 0 48 2 6 11 0 0
                                    49 2 44 0 0 0 50 2 44 0 0 0 51 2 53 44 52 0
                                    54 2 0 11 0 0 1 1 12 11 0 42 2 0 0 9 10 28
                                    1 0 60 0 1 2 4 63 0 0 1 2 11 11 0 0 1 0 12
                                    0 1 1 7 63 0 1 2 7 0 0 62 1 2 5 0 0 57 1 1
                                    10 0 0 1 1 7 63 0 1 2 5 0 0 57 1 2 12 11 0
                                    0 1 1 7 11 0 1 1 0 62 0 1 1 0 58 0 1 1 0 11
                                    0 1 2 0 0 6 12 1 2 0 0 61 0 1 1 0 26 0 29 2
                                    9 6 65 0 1 1 7 63 0 1 2 7 0 0 62 1 2 5 0 0
                                    57 1 1 10 25 0 1 1 10 12 0 1 1 10 0 0 1 1
                                    10 6 0 1 1 0 56 0 1 1 10 0 26 27 1 0 0 26
                                    37 2 5 0 0 0 1 1 0 44 0 55 1 1 0 6 1 1 6 0
                                    0 1 1 7 0 64 1 1 0 59 0 1 2 0 6 0 12 1 0 7
                                    62 1 3 5 0 0 0 0 1 2 5 0 0 0 1 2 7 11 0 0 1
                                    2 7 0 0 62 1 2 5 0 0 57 1 0 12 0 15 0 7 0
                                    41 2 0 11 0 0 1 1 2 0 0 1 2 2 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 57 0 1 2 0 0 0 6 1 2 0 0 6 0 1
                                    2 5 0 0 0 38 2 2 0 64 0 1 2 12 0 62 0
                                    1)))))
           '|lookupComplete|)) 
