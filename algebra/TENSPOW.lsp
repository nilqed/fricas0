
(SDEFUN |TENSPOW;coerce;%Of;1| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((|le| (|List| (|OutputForm|))) (|ko| (|OutputForm|)) (#1=#:G21 NIL)
          (|b| NIL) (#2=#:G20 NIL) (#3=#:G19 NIL) (|rec| NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 11))
            (SPADCALL (|spadConstant| % 12) (QREFELT % 14)))
           ('T
            (SEQ (LETT |le| NIL)
                 (SEQ (LETT |rec| NIL)
                      (LETT #3# (REVERSE (SPADCALL |x| (QREFELT % 17)))) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |rec| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |ko|
                             (SPADCALL (ELT % 18)
                                       (PROGN
                                        (LETT #2# NIL)
                                        (SEQ (LETT |b| NIL)
                                             (LETT #1#
                                                   (SPADCALL (QCAR |rec|)
                                                             (QREFELT % 21)))
                                             G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |b| (CAR #1#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #2#
                                                     (CONS
                                                      (SPADCALL |b|
                                                                (QREFELT % 22))
                                                      #2#))))
                                             (LETT #1# (CDR #1#)) (GO G190)
                                             G191 (EXIT (NREVERSE #2#))))
                                       (QREFELT % 25)))
                       (EXIT
                        (COND
                         ((SPADCALL (QCDR |rec|) (|spadConstant| % 26)
                                    (QREFELT % 27))
                          (LETT |le| (CONS |ko| |le|)))
                         ('T
                          (LETT |le|
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QCDR |rec|) (QREFELT % 14)) |ko|
                                  (QREFELT % 28))
                                 |le|))))))
                      (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL (ELT % 29) |le| (QREFELT % 25))))))))) 

(SDEFUN |TENSPOW;partialTensor|
        ((|bb| (|List| B)) (|xx| (|List| M))
         (% (|List| (|Record| (|:| |k| (|List| B)) (|:| |c| R)))))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| (|List| B)) (|:| |c| R))))
          (#1=#:G36 NIL) (|tt| NIL) (#2=#:G35 NIL) (|s1| NIL) (#3=#:G34 NIL)
          (|xr| (|List| M)) (|x1| (M)))
         (SEQ (LETT |x1| (|SPADfirst| |xx|)) (LETT |xr| (CDR |xx|))
              (COND
               ((NULL |xr|)
                (SEQ (LETT |s1| NIL) (LETT #3# (SPADCALL |x1| (QREFELT % 33)))
                     G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |s1| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res|
                             (CONS (CONS (CONS (QCAR |s1|) |bb|) (QCDR |s1|))
                                   |res|))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
               ('T
                (SEQ (LETT |s1| NIL) (LETT #2# (SPADCALL |x1| (QREFELT % 33)))
                     G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |s1| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |tt| NIL)
                            (LETT #1#
                                  (|TENSPOW;partialTensor|
                                   (CONS (QCAR |s1|) |bb|) |xr| %))
                            G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |tt| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |res|
                                    (CONS
                                     (CONS (QCAR |tt|)
                                           (SPADCALL (QCDR |s1|) (QCDR |tt|)
                                                     (QREFELT % 34)))
                                     |res|))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
              (EXIT (REVERSE |res|))))) 

(SDEFUN |TENSPOW;tensor;L%;3| ((|bb| (|List| B)) (% (%)))
        (SPADCALL (|spadConstant| % 26) (SPADCALL |bb| (QREFELT % 35))
                  (QREFELT % 36))) 

(SDEFUN |TENSPOW;tensor;L%;4| ((|xx| (|List| M)) (% (%)))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| (|Vector| B)) (|:| |c| R))))
          (#1=#:G48 NIL) (|tt| NIL))
         (SEQ
          (COND
           ((NULL (SPADCALL |xx| (QREFELT % 6) (QREFELT % 40)))
            (|error| "wrong size"))
           ('T
            (COND
             ((SPADCALL (ELT % 41) |xx| (QREFELT % 43)) (|spadConstant| % 44))
             ('T
              (SEQ (LETT |res| NIL)
                   (SEQ (LETT |tt| NIL)
                        (LETT #1# (|TENSPOW;partialTensor| NIL |xx| %)) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |tt| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |res|
                                (CONS
                                 (CONS
                                  (SPADCALL (REVERSE (QCAR |tt|))
                                            (QREFELT % 35))
                                  (QCDR |tt|))
                                 |res|))))
                        (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (SPADCALL (REVERSE |res|) (QREFELT % 45))))))))))) 

(SDEFUN |TENSPOW;*;3%;5| ((|x1| (%)) (|x2| (%)) (% (%)))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| (|Vector| B)) (|:| |c| R))))
          (#1=#:G66 NIL) (|t| NIL) (|t1t2| (%)) (#2=#:G64 NIL) (|b1| NIL)
          (#3=#:G65 NIL) (|b2| NIL) (#4=#:G63 NIL) (#5=#:G62 NIL) (|t2| NIL)
          (#6=#:G61 NIL) (|t1| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |t1| NIL) (LETT #6# (SPADCALL |x1| (QREFELT % 17)))
                   G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |t2| NIL)
                          (LETT #5# (SPADCALL |x2| (QREFELT % 17))) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |t2| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |t1t2|
                                 (SPADCALL
                                  (SPADCALL (QCDR |t1|) (QCDR |t2|)
                                            (QREFELT % 34))
                                  (SPADCALL
                                   (PROGN
                                    (LETT #4# NIL)
                                    (SEQ (LETT |b2| NIL)
                                         (LETT #3#
                                               (SPADCALL (QCAR |t2|)
                                                         (QREFELT % 21)))
                                         (LETT |b1| NIL)
                                         (LETT #2#
                                               (SPADCALL (QCAR |t1|)
                                                         (QREFELT % 21)))
                                         G190
                                         (COND
                                          ((OR (ATOM #2#)
                                               (PROGN
                                                (LETT |b1| (CAR #2#))
                                                NIL)
                                               (ATOM #3#)
                                               (PROGN
                                                (LETT |b2| (CAR #3#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #4#
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (|spadConstant| % 26) |b1|
                                                    (QREFELT % 47))
                                                   (SPADCALL
                                                    (|spadConstant| % 26) |b2|
                                                    (QREFELT % 47))
                                                   (QREFELT % 48))
                                                  #4#))))
                                         (LETT #2#
                                               (PROG1 (CDR #2#)
                                                 (LETT #3# (CDR #3#))))
                                         (GO G190) G191 (EXIT (NREVERSE #4#))))
                                   (QREFELT % 46))
                                  (QREFELT % 49)))
                           (EXIT
                            (SEQ (LETT |t| NIL)
                                 (LETT #1# (SPADCALL |t1t2| (QREFELT % 17)))
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |t| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ (EXIT (LETT |res| (CONS |t| |res|))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 50)))))) 

(DECLAIM (NOTINLINE |TensorPower;|)) 

(DEFUN |TensorPower;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G72 NIL) (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|TensorPower| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 61))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#4|
                                                       (LIST '|Algebra|
                                                             (|devaluate|
                                                              |#2|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#4|
                                                        (LIST '|Algebra|
                                                              (|devaluate|
                                                               |#2|))))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasCategory| |#4|
                                                        (LIST '|Algebra|
                                                              (|devaluate|
                                                               |#2|))))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasCategory| |#4|
                                                        (LIST '|Algebra|
                                                              (|devaluate|
                                                               |#2|))))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#4|
                                                        (LIST '|Algebra|
                                                              (|devaluate|
                                                               |#2|))))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (LETT #1#
                                              (|HasCategory| (|Vector| |#3|)
                                                             '(|Comparable|)))
                                        (AND
                                         (|HasCategory| |#2| '(|Comparable|))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|TensorPower| (LIST DV$1 DV$2 DV$3 DV$4)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 7)
      (QSETREFV % 46 (CONS (|dispatchFunction| |TENSPOW;tensor;L%;4|) %))))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV % 51 (CONS (|dispatchFunction| |TENSPOW;*;3%;5|) %))))
    %))) 

(DEFUN |TensorPower| (&REST #1=#:G74)
  (SPROG NIL
         (PROG (#2=#:G75)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(NIL T T T))
                     (HGET |$ConstructorCache| '|TensorPower|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TensorPower;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TensorPower|)))))))))) 

(MAKEPROP '|TensorPower| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 7 20) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) (|Boolean|)
              (0 . |zero?|) (5 . |Zero|) (|OutputForm|) (9 . |coerce|)
              (|Record| (|:| |k| 20) (|:| |c| 7)) (|List| 15)
              (14 . |listOfTerms|) (19 . |tensor|) (|List| 8) (|Vector| 8)
              (25 . |parts|) (30 . |coerce|) (|Mapping| 13 13 13) (|List| 13)
              (35 . |reduce|) (41 . |One|) (45 . =) (51 . *) (57 . +)
              |TENSPOW;coerce;%Of;1| (|Record| (|:| |k| 8) (|:| |c| 7))
              (|List| 31) (63 . |listOfTerms|) (68 . *) (74 . |vector|)
              (79 . |monomial|) |TENSPOW;tensor;L%;3| (|NonNegativeInteger|)
              (|List| 9) (85 . |size?|) (91 . |zero?|) (|Mapping| 10 9)
              (96 . |any?|) (102 . |Zero|) (106 . |constructOrdered|)
              (111 . |tensor|) (116 . |monomial|) (122 . *) (128 . *)
              (134 . |construct|) (139 . *) (|String|) (|PositiveInteger|)
              (|List| 20) (|List| %) (|List| 7) (|Mapping| 7 7) (|Integer|)
              (|Union| % '"failed") (|Mapping| 7 20))
           '#(~= 145 |zero?| 151 |tensor| 156 |support| 172 |subtractIfCan| 177
              |smaller?| 183 |sample| 189 |rightRecip| 193 |rightPower| 198
              |reductum| 210 |recip| 215 |plenaryPower| 220 |opposite?| 226
              |one?| 232 |numberOfMonomials| 237 |monomials| 242 |monomial?|
              247 |monomial| 252 |map| 258 |listOfTerms| 264 |linearExtend| 269
              |leftRecip| 275 |leftPower| 280 |leadingTerm| 292
              |leadingSupport| 297 |leadingMonomial| 302 |leadingCoefficient|
              307 |latex| 312 |constructOrdered| 317 |construct| 322
              |commutator| 327 |coerce| 333 |coefficients| 348 |coefficient|
              353 |characteristic| 359 |associator| 363 |antiCommutator| 370
              |annihilate?| 376 ^ 382 |Zero| 394 |One| 398 = 402 - 408 + 419 *
              425)
           'NIL
           (CONS
            (|makeByteWordVec2| 8
                                '(0 1 1 1 1 1 0 0 1 0 0 1 1 0 0 1 1 1 0 0 0 2 4
                                  1 1 3 1 1 1 8 1 0 0 1 0 0))
            (CONS
             '#(|TensorPowerCategory&| |Algebra&| NIL |NonAssociativeAlgebra&|
                NIL |Rng&| NIL |FreeModuleCategory&| NIL |Module&| NIL
                |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&| NIL NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| NIL |MagmaWithUnit&| NIL |Magma&|
                |AbelianSemiGroup&| |SetCategory&| NIL NIL |BasicType&|)
             (CONS
              '#((|TensorPowerCategory| 6 7 9) (|Algebra| 7) (|Ring|)
                 (|NonAssociativeAlgebra| 7) (|SemiRing|) (|Rng|)
                 (|TensorProductCategory| 7 9 9)
                 (|FreeModuleCategory| 7 (|Vector| 8)) (|SemiRng|) (|Module| 7)
                 (|IndexedDirectProductCategory| 7 (|Vector| 8))
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 7 7)
                 (|IndexedProductCategory| 7 (|Vector| 8))
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| $$)
                 (|RightModule| 7) (|LeftModule| 7)
                 (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|) (|SetCategory|)
                 (|unitsKnown|) (|CoercibleTo| 13) (|BasicType|))
              (|makeByteWordVec2| 60
                                  '(1 0 10 0 11 0 7 0 12 1 7 13 0 14 1 0 16 0
                                    17 2 13 0 0 0 18 1 20 19 0 21 1 8 13 0 22 2
                                    24 13 23 0 25 0 7 0 26 2 7 10 0 0 27 2 13 0
                                    0 0 28 2 13 0 0 0 29 1 9 32 0 33 2 7 0 0 0
                                    34 1 20 0 19 35 2 0 0 7 20 36 2 39 10 0 38
                                    40 1 9 10 0 41 2 39 10 42 0 43 0 0 0 44 1 0
                                    0 16 45 1 0 0 39 46 2 9 0 7 8 47 2 9 0 0 0
                                    48 2 0 0 7 0 49 1 0 0 16 50 2 0 0 0 0 51 2
                                    0 10 0 0 1 1 5 10 0 11 2 0 0 9 9 1 1 0 0 39
                                    46 1 0 0 19 37 1 0 54 0 1 2 4 59 0 0 1 2 8
                                    10 0 0 1 0 5 0 1 1 1 59 0 1 2 1 0 0 38 1 2
                                    1 0 0 53 1 1 7 0 0 1 1 1 59 0 1 2 1 0 0 53
                                    1 2 5 10 0 0 1 1 1 10 0 1 1 0 38 0 1 1 0 55
                                    0 1 1 0 10 0 1 2 0 0 7 20 36 2 0 0 57 0 1 1
                                    0 16 0 17 2 6 7 60 0 1 1 1 59 0 1 2 1 0 0
                                    38 1 2 1 0 0 53 1 1 7 15 0 1 1 7 20 0 1 1 7
                                    0 0 1 1 7 7 0 1 1 0 52 0 1 1 7 0 16 45 1 0
                                    0 16 50 2 1 0 0 0 1 1 0 13 0 30 1 1 0 7 1 1
                                    1 0 58 1 1 0 56 0 1 2 0 7 0 20 1 0 1 38 1 3
                                    1 0 0 0 0 1 2 1 0 0 0 1 2 1 10 0 0 1 2 1 0
                                    0 38 1 2 1 0 0 53 1 0 5 0 44 0 1 0 1 2 0 10
                                    0 0 1 1 2 0 0 1 2 2 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 53 0 1 2 0 0 0 7 1 2 0 0 7 0 49 2 2 0 58
                                    0 1 2 5 0 38 0 1 2 1 0 0 0 51)))))
           '|lookupComplete|)) 
