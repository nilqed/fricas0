
(SDEFUN |TENSPOW;coerce;$Of;1| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|le| (|List| (|OutputForm|))) (|ko| (|OutputForm|)) (#1=#:G397 NIL)
          (|b| NIL) (#2=#:G396 NIL) (#3=#:G395 NIL) (|rec| NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 11))
            (SPADCALL (|spadConstant| $ 12) (QREFELT $ 14)))
           ('T
            (SEQ (LETT |le| NIL)
                 (SEQ (LETT |rec| NIL)
                      (LETT #3# (REVERSE (SPADCALL |x| (QREFELT $ 17)))) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |rec| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |ko|
                             (SPADCALL (ELT $ 18)
                                       (PROGN
                                        (LETT #2# NIL)
                                        (SEQ (LETT |b| NIL)
                                             (LETT #1#
                                                   (SPADCALL (QCAR |rec|)
                                                             (QREFELT $ 21)))
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
                                                                (QREFELT $ 22))
                                                      #2#))))
                                             (LETT #1# (CDR #1#)) (GO G190)
                                             G191 (EXIT (NREVERSE #2#))))
                                       (QREFELT $ 25)))
                       (EXIT
                        (COND
                         ((SPADCALL (QCDR |rec|) (|spadConstant| $ 26)
                                    (QREFELT $ 27))
                          (LETT |le| (CONS |ko| |le|)))
                         ('T
                          (LETT |le|
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QCDR |rec|) (QREFELT $ 14)) |ko|
                                  (QREFELT $ 28))
                                 |le|))))))
                      (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL (ELT $ 29) |le| (QREFELT $ 25))))))))) 

(SDEFUN |TENSPOW;partialTensor|
        ((|bb| |List| B) (|xx| |List| M)
         ($ |List| (|Record| (|:| |k| (|List| B)) (|:| |c| R))))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| (|List| B)) (|:| |c| R))))
          (#1=#:G409 NIL) (|tt| NIL) (#2=#:G408 NIL) (|s1| NIL) (#3=#:G407 NIL)
          (|xr| (|List| M)) (|x1| (M)))
         (SEQ (LETT |x1| (|SPADfirst| |xx|)) (LETT |xr| (CDR |xx|))
              (COND
               ((NULL |xr|)
                (SEQ (LETT |s1| NIL) (LETT #3# (SPADCALL |x1| (QREFELT $ 33)))
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
                (SEQ (LETT |s1| NIL) (LETT #2# (SPADCALL |x1| (QREFELT $ 33)))
                     G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |s1| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |tt| NIL)
                            (LETT #1#
                                  (|TENSPOW;partialTensor|
                                   (CONS (QCAR |s1|) |bb|) |xr| $))
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
                                                     (QREFELT $ 34)))
                                     |res|))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
              (EXIT (REVERSE |res|))))) 

(SDEFUN |TENSPOW;tensor;L$;3| ((|bb| |List| B) ($ $))
        (SPADCALL (|spadConstant| $ 26) (SPADCALL |bb| (QREFELT $ 35))
                  (QREFELT $ 36))) 

(SDEFUN |TENSPOW;tensor;L$;4| ((|xx| |List| M) ($ $))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| (|Vector| B)) (|:| |c| R))))
          (#1=#:G421 NIL) (|tt| NIL))
         (SEQ
          (COND
           ((NULL (SPADCALL |xx| (QREFELT $ 6) (QREFELT $ 40)))
            (|error| "wrong size"))
           ('T
            (COND
             ((SPADCALL (ELT $ 41) |xx| (QREFELT $ 43)) (|spadConstant| $ 44))
             ('T
              (SEQ (LETT |res| NIL)
                   (SEQ (LETT |tt| NIL)
                        (LETT #1# (|TENSPOW;partialTensor| NIL |xx| $)) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |tt| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |res|
                                (CONS
                                 (CONS
                                  (SPADCALL (REVERSE (QCAR |tt|))
                                            (QREFELT $ 35))
                                  (QCDR |tt|))
                                 |res|))))
                        (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (SPADCALL (REVERSE |res|) (QREFELT $ 45))))))))))) 

(SDEFUN |TENSPOW;*;3$;5| ((|x1| $) (|x2| $) ($ $))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| (|Vector| B)) (|:| |c| R))))
          (#1=#:G435 NIL) (|t| NIL) (|t1t2| ($)) (#2=#:G433 NIL) (|b1| NIL)
          (#3=#:G434 NIL) (|b2| NIL) (#4=#:G432 NIL) (|t2k| #5=(|Vector| B))
          (|t1k| #5#) (|t2c| (R)) (|t1c| (R)) (#6=#:G431 NIL) (|t2| NIL)
          (#7=#:G430 NIL) (|t1| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |t1| NIL) (LETT #7# (SPADCALL |x1| (QREFELT $ 17)))
                   G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |t1| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |t2| NIL)
                          (LETT #6# (SPADCALL |x2| (QREFELT $ 17))) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |t2| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |t1c| (QCDR |t1|))
                               (LETT |t2c| (QCDR |t2|))
                               (LETT |t1k| (QCAR |t1|))
                               (LETT |t2k| (QCAR |t2|))
                               (LETT |t1t2|
                                     (SPADCALL
                                      (SPADCALL (QCDR |t1|) (QCDR |t2|)
                                                (QREFELT $ 34))
                                      (SPADCALL
                                       (PROGN
                                        (LETT #4# NIL)
                                        (SEQ (LETT |b2| NIL)
                                             (LETT #3#
                                                   (SPADCALL (QCAR |t2|)
                                                             (QREFELT $ 21)))
                                             (LETT |b1| NIL)
                                             (LETT #2#
                                                   (SPADCALL (QCAR |t1|)
                                                             (QREFELT $ 21)))
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
                                                        (|spadConstant| $ 26)
                                                        |b1| (QREFELT $ 47))
                                                       (SPADCALL
                                                        (|spadConstant| $ 26)
                                                        |b2| (QREFELT $ 47))
                                                       (QREFELT $ 48))
                                                      #4#))))
                                             (LETT #2#
                                                   (PROG1 (CDR #2#)
                                                     (LETT #3# (CDR #3#))))
                                             (GO G190) G191
                                             (EXIT (NREVERSE #4#))))
                                       (QREFELT $ 46))
                                      (QREFELT $ 49)))
                               (EXIT
                                (SEQ (LETT |t| NIL)
                                     (LETT #1#
                                           (SPADCALL |t1t2| (QREFELT $ 17)))
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |t| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ (EXIT (LETT |res| (CONS |t| |res|))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT NIL))))
                          (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 50)))))) 

(DECLAIM (NOTINLINE |TensorPower;|)) 

(DEFUN |TensorPower| (&REST #1=#:G446)
  (SPROG NIL
         (PROG (#2=#:G447)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TensorPower|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TensorPower;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TensorPower|)))))))))) 

(DEFUN |TensorPower;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G444 NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|TensorPower| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 64))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
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
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         (|HasCategory| (|Vector| |#3|)
                                                        '(|OrderedSet|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| (|Vector| |#3|)
                                                         '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| (|Vector| |#3|)
                                                         '(|OrderedSet|))))
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
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| (|Vector| |#3|)
                                                         '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| (|Vector| |#3|)
                                                         '(|OrderedSet|)))
                                         (|HasCategory| |#4|
                                                        (LIST '|Algebra|
                                                              (|devaluate|
                                                               |#2|))))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| (|Vector| |#3|)
                                                         '(|OrderedSet|)))
                                         (|HasCategory| |#4|
                                                        (LIST '|Algebra|
                                                              (|devaluate|
                                                               |#2|))))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (LETT #1#
                                              (|HasCategory| (|Vector| |#3|)
                                                             '(|Comparable|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2| '(|Comparable|))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| (|Vector| |#3|)
                                                         '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| (|Vector| |#3|)
                                                         '(|OrderedSet|))))))))
    (|haddProp| |$ConstructorCache| '|TensorPower| (LIST DV$1 DV$2 DV$3 DV$4)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 46 (CONS (|dispatchFunction| |TENSPOW;tensor;L$;4|) $))))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV $ 51 (CONS (|dispatchFunction| |TENSPOW;*;3$;5|) $))))
    $))) 

(MAKEPROP '|TensorPower| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 7 20) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) (|Boolean|)
              (0 . |zero?|) (5 . |Zero|) (|OutputForm|) (9 . |coerce|)
              (|Record| (|:| |k| 20) (|:| |c| 7)) (|List| 15)
              (14 . |listOfTerms|) (19 . |tensor|) (|List| 8) (|Vector| 8)
              (25 . |parts|) (30 . |coerce|) (|Mapping| 13 13 13) (|List| 13)
              (35 . |reduce|) (41 . |One|) (45 . =) (51 . *) (57 . +)
              |TENSPOW;coerce;$Of;1| (|Record| (|:| |k| 8) (|:| |c| 7))
              (|List| 31) (63 . |listOfTerms|) (68 . *) (74 . |vector|)
              (79 . |monomial|) |TENSPOW;tensor;L$;3| (|NonNegativeInteger|)
              (|List| 9) (85 . |size?|) (91 . |zero?|) (|Mapping| 10 9)
              (96 . |any?|) (102 . |Zero|) (106 . |constructOrdered|)
              (111 . |tensor|) (116 . |monomial|) (122 . *) (128 . *)
              (134 . |construct|) (139 . *) (|Union| $ '"failed") (|Integer|)
              (|PositiveInteger|) (|Mapping| 7 20) (|Union| 20 '"failed")
              (|Mapping| 7 7) (|List| 7) (|List| 20) (|List| $) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 145 |zero?| 151 |tensor| 156 |support| 172 |sup| 177
              |subtractIfCan| 183 |smaller?| 189 |sample| 195 |rightRecip| 199
              |rightPower| 204 |retractIfCan| 216 |retract| 221 |reductum| 226
              |recip| 231 |opposite?| 236 |one?| 242 |numberOfMonomials| 247
              |monomials| 252 |monomial?| 257 |monomial| 262 |min| 268 |max|
              274 |map| 280 |listOfTerms| 286 |linearExtend| 291 |leftRecip|
              297 |leftPower| 302 |leadingTerm| 314 |leadingSupport| 319
              |leadingMonomial| 324 |leadingCoefficient| 329 |latex| 334
              |hashUpdate!| 339 |hash| 345 |constructOrdered| 350 |construct|
              355 |commutator| 360 |coerce| 366 |coefficients| 386
              |coefficient| 391 |characteristic| 397 |associator| 401
              |antiCommutator| 408 |annihilate?| 414 ^ 420 |Zero| 432 |One| 436
              >= 440 > 446 = 452 <= 458 < 464 - 470 + 481 * 487)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 1 1 0 0 1 1 0 0 1 0 1 1 4 0 0 0 1 1 1 4 2 5
                                  1 1 5 7 1 1 1 5 6 0 1 12 0 0 0 1 3 5))
            (CONS
             '#(|TensorPowerCategory&| |Algebra&| NIL |FreeModuleCategory&| NIL
                |Rng&| NIL NIL |Module&| NIL NIL NIL |NonAssociativeRing&| NIL
                NIL NIL NIL NIL NIL |NonAssociativeRng&| NIL |AbelianGroup&|
                NIL NIL NIL NIL NIL |MagmaWithUnit&| NIL
                |NonAssociativeSemiRng&| |OrderedSet&| |AbelianMonoid&|
                |AbelianSemiGroup&| |Magma&| NIL |SetCategory&| |BasicType&|
                NIL NIL |RetractableTo&| |PartialOrder&|)
             (CONS
              '#((|TensorPowerCategory| 6 7 9) (|Algebra| 7) (|Ring|)
                 (|FreeModuleCategory| 7 (|Vector| 8))
                 (|TensorProductCategory| 7 9 9) (|Rng|) (|SemiRing|)
                 (|IndexedDirectProductCategory| 7 (|Vector| 8)) (|Module| 7)
                 (|SemiRng|) (|BiModule| 7 7) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedAbelianMonoidSup|)
                 (|AbelianProductCategory| 7) (|LeftModule| 7)
                 (|RightModule| 7) (|LeftModule| $$) (|RightModule| $$)
                 (|NonAssociativeRng|) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|OrderedSet|) (|AbelianMonoid|) (|AbelianSemiGroup|)
                 (|Magma|) (|Comparable|) (|SetCategory|) (|BasicType|)
                 (|CoercibleTo| 13) (|unitsKnown|)
                 (|RetractableTo| (|Vector| 8)) (|PartialOrder|))
              (|makeByteWordVec2| 63
                                  '(1 0 10 0 11 0 7 0 12 1 7 13 0 14 1 0 16 0
                                    17 2 13 0 0 0 18 1 20 19 0 21 1 8 13 0 22 2
                                    24 13 23 0 25 0 7 0 26 2 7 10 0 0 27 2 13 0
                                    0 0 28 2 13 0 0 0 29 1 9 32 0 33 2 7 0 0 0
                                    34 1 20 0 19 35 2 0 0 7 20 36 2 39 10 0 38
                                    40 1 9 10 0 41 2 39 10 42 0 43 0 0 0 44 1 0
                                    0 16 45 1 0 0 39 46 2 9 0 7 8 47 2 9 0 0 0
                                    48 2 0 0 7 0 49 1 0 0 16 50 2 0 0 0 0 51 2
                                    0 10 0 0 1 1 8 10 0 11 1 0 0 19 37 2 0 0 9
                                    9 1 1 0 0 39 46 1 0 59 0 1 2 4 0 0 0 1 2 9
                                    52 0 0 1 2 12 10 0 0 1 0 8 0 1 1 1 52 0 1 2
                                    1 0 0 54 1 2 1 0 0 38 1 1 3 56 0 1 1 3 20 0
                                    1 1 11 0 0 1 1 1 52 0 1 2 8 10 0 0 1 1 1 10
                                    0 1 1 0 38 0 1 1 0 60 0 1 1 0 10 0 1 2 0 0
                                    7 20 36 2 5 0 0 0 1 2 5 0 0 0 1 2 0 0 57 0
                                    1 1 0 16 0 17 2 10 7 55 0 1 1 1 52 0 1 2 1
                                    0 0 54 1 2 1 0 0 38 1 1 11 15 0 1 1 11 20 0
                                    1 1 11 0 0 1 1 11 7 0 1 1 0 61 0 1 2 0 63
                                    63 0 1 1 0 62 0 1 1 11 0 16 45 1 0 0 16 50
                                    2 1 0 0 0 1 1 1 0 53 1 1 1 0 7 1 1 3 0 20 1
                                    1 0 13 0 30 1 0 58 0 1 2 0 7 0 20 1 0 1 38
                                    1 3 1 0 0 0 0 1 2 1 0 0 0 1 2 1 10 0 0 1 2
                                    1 0 0 54 1 2 1 0 0 38 1 0 8 0 44 0 1 0 1 2
                                    5 10 0 0 1 2 5 10 0 0 1 2 0 10 0 0 1 2 5 10
                                    0 0 1 2 5 10 0 0 1 2 2 0 0 0 1 1 2 0 0 1 2
                                    0 0 0 0 1 2 2 0 53 0 1 2 8 0 38 0 1 2 1 0 0
                                    0 51 2 0 0 7 20 1 2 0 0 20 7 1 2 0 0 0 7 1
                                    2 0 0 54 0 1 2 0 0 7 0 49)))))
           '|lookupComplete|)) 
