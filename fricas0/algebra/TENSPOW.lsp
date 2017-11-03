
(SDEFUN |TENSPOW;coerce;$Of;1| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|le| (|List| (|OutputForm|))) (|ko| (|OutputForm|)) (#1=#:G721 NIL)
          (|b| NIL) (#2=#:G720 NIL) (#3=#:G719 NIL) (|rec| NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 11))
            (SPADCALL (|spadConstant| $ 12) (QREFELT $ 14)))
           ('T
            (SEQ (LETT |le| NIL . #4=(|TENSPOW;coerce;$Of;1|))
                 (SEQ (LETT |rec| NIL . #4#)
                      (LETT #3# (REVERSE (SPADCALL |x| (QREFELT $ 17))) . #4#)
                      G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |rec| (CAR #3#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |ko|
                             (SPADCALL (ELT $ 18)
                                       (PROGN
                                        (LETT #2# NIL . #4#)
                                        (SEQ (LETT |b| NIL . #4#)
                                             (LETT #1#
                                                   (SPADCALL (QCAR |rec|)
                                                             (QREFELT $ 21))
                                                   . #4#)
                                             G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |b| (CAR #1#) . #4#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #2#
                                                     (CONS
                                                      (SPADCALL |b|
                                                                (QREFELT $ 22))
                                                      #2#)
                                                     . #4#)))
                                             (LETT #1# (CDR #1#) . #4#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #2#))))
                                       (QREFELT $ 25))
                             . #4#)
                       (EXIT
                        (COND
                         ((SPADCALL (QCDR |rec|) (|spadConstant| $ 26)
                                    (QREFELT $ 27))
                          (LETT |le| (CONS |ko| |le|) . #4#))
                         ('T
                          (LETT |le|
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QCDR |rec|) (QREFELT $ 14)) |ko|
                                  (QREFELT $ 28))
                                 |le|)
                                . #4#)))))
                      (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL (ELT $ 29) |le| (QREFELT $ 25))))))))) 

(SDEFUN |TENSPOW;partialTensor|
        ((|bb| |List| B) (|xx| |List| M)
         ($ |List| (|Record| (|:| |k| (|List| B)) (|:| |c| R))))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| (|List| B)) (|:| |c| R))))
          (#1=#:G734 NIL) (|tt| NIL) (#2=#:G733 NIL) (|s1| NIL) (#3=#:G732 NIL)
          (|xr| (|List| M)) (|x1| (M)))
         (SEQ (LETT |x1| (|SPADfirst| |xx|) . #4=(|TENSPOW;partialTensor|))
              (LETT |xr| (CDR |xx|) . #4#)
              (COND
               ((NULL |xr|)
                (SEQ (LETT |s1| NIL . #4#)
                     (LETT #3# (SPADCALL |x1| (QREFELT $ 33)) . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |s1| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res|
                             (CONS (CONS (CONS (QCAR |s1|) |bb|) (QCDR |s1|))
                                   |res|)
                             . #4#)))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
               ('T
                (SEQ (LETT |s1| NIL . #4#)
                     (LETT #2# (SPADCALL |x1| (QREFELT $ 33)) . #4#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |s1| (CAR #2#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |tt| NIL . #4#)
                            (LETT #1#
                                  (|TENSPOW;partialTensor|
                                   (CONS (QCAR |s1|) |bb|) |xr| $)
                                  . #4#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |tt| (CAR #1#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |res|
                                    (CONS
                                     (CONS (QCAR |tt|)
                                           (SPADCALL (QCDR |s1|) (QCDR |tt|)
                                                     (QREFELT $ 34)))
                                     |res|)
                                    . #4#)))
                            (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))))
              (EXIT (REVERSE |res|))))) 

(SDEFUN |TENSPOW;tensor;L$;3| ((|bb| |List| B) ($ $))
        (SPADCALL (|spadConstant| $ 26) (SPADCALL |bb| (QREFELT $ 35))
                  (QREFELT $ 36))) 

(SDEFUN |TENSPOW;tensor;L$;4| ((|xx| |List| M) ($ $))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| (|Vector| B)) (|:| |c| R))))
          (#1=#:G747 NIL) (|tt| NIL))
         (SEQ
          (COND
           ((NULL (SPADCALL |xx| (QREFELT $ 6) (QREFELT $ 40)))
            (|error| "wrong size"))
           ('T
            (COND
             ((SPADCALL (ELT $ 41) |xx| (QREFELT $ 43)) (|spadConstant| $ 44))
             ('T
              (SEQ (LETT |res| NIL . #2=(|TENSPOW;tensor;L$;4|))
                   (SEQ (LETT |tt| NIL . #2#)
                        (LETT #1# (|TENSPOW;partialTensor| NIL |xx| $) . #2#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |tt| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |res|
                                (CONS
                                 (CONS
                                  (SPADCALL (REVERSE (QCAR |tt|))
                                            (QREFELT $ 35))
                                  (QCDR |tt|))
                                 |res|)
                                . #2#)))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (EXIT (SPADCALL (REVERSE |res|) (QREFELT $ 45))))))))))) 

(SDEFUN |TENSPOW;*;3$;5| ((|x1| $) (|x2| $) ($ $))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| (|Vector| B)) (|:| |c| R))))
          (#1=#:G761 NIL) (|t| NIL) (|t1t2| ($)) (#2=#:G759 NIL) (|b1| NIL)
          (#3=#:G760 NIL) (|b2| NIL) (#4=#:G758 NIL) (|t2k| #5=(|Vector| B))
          (|t1k| #5#) (|t2c| (R)) (|t1c| (R)) (#6=#:G757 NIL) (|t2| NIL)
          (#7=#:G756 NIL) (|t1| NIL))
         (SEQ (LETT |res| NIL . #8=(|TENSPOW;*;3$;5|))
              (SEQ (LETT |t1| NIL . #8#)
                   (LETT #7# (SPADCALL |x1| (QREFELT $ 17)) . #8#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |t1| (CAR #7#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |t2| NIL . #8#)
                          (LETT #6# (SPADCALL |x2| (QREFELT $ 17)) . #8#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |t2| (CAR #6#) . #8#) NIL))
                            (GO G191)))
                          (SEQ (LETT |t1c| (QCDR |t1|) . #8#)
                               (LETT |t2c| (QCDR |t2|) . #8#)
                               (LETT |t1k| (QCAR |t1|) . #8#)
                               (LETT |t2k| (QCAR |t2|) . #8#)
                               (LETT |t1t2|
                                     (SPADCALL
                                      (SPADCALL (QCDR |t1|) (QCDR |t2|)
                                                (QREFELT $ 34))
                                      (SPADCALL
                                       (PROGN
                                        (LETT #4# NIL . #8#)
                                        (SEQ (LETT |b2| NIL . #8#)
                                             (LETT #3#
                                                   (SPADCALL (QCAR |t2|)
                                                             (QREFELT $ 21))
                                                   . #8#)
                                             (LETT |b1| NIL . #8#)
                                             (LETT #2#
                                                   (SPADCALL (QCAR |t1|)
                                                             (QREFELT $ 21))
                                                   . #8#)
                                             G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |b1| (CAR #2#) . #8#)
                                                    NIL)
                                                   (ATOM #3#)
                                                   (PROGN
                                                    (LETT |b2| (CAR #3#) . #8#)
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
                                                      #4#)
                                                     . #8#)))
                                             (LETT #2#
                                                   (PROG1 (CDR #2#)
                                                     (LETT #3# (CDR #3#)
                                                           . #8#))
                                                   . #8#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #4#))))
                                       (QREFELT $ 46))
                                      (QREFELT $ 49))
                                     . #8#)
                               (EXIT
                                (SEQ (LETT |t| NIL . #8#)
                                     (LETT #1# (SPADCALL |t1t2| (QREFELT $ 17))
                                           . #8#)
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |t| (CAR #1#) . #8#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT |res| (CONS |t| |res|) . #8#)))
                                     (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                                     (EXIT NIL))))
                          (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 50)))))) 

(DECLAIM (NOTINLINE |TensorPower;|)) 

(DEFUN |TensorPower| (&REST #1=#:G773)
  (SPROG NIL
         (PROG (#2=#:G774)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TensorPower|)
                                               '|domainEqualList|)
                    . #3=(|TensorPower|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TensorPower;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TensorPower|)))))))))) 

(DEFUN |TensorPower;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|TensorPower|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|TensorPower| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 64) . #1#)
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
                                         (|HasCategory| |#2| '(|Comparable|))
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
                                                       '(|CommutativeRing|))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|TensorPower| (LIST DV$1 DV$2 DV$3 DV$4)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
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
              |TENSPOW;tensor;L$;4| (111 . |monomial|) (117 . *) (123 . *)
              (129 . |construct|) (134 . *) (|Union| $ '"failed") (|Integer|)
              (|PositiveInteger|) (|Mapping| 7 20) (|Union| 20 '"failed")
              (|Mapping| 7 7) (|List| 7) (|List| 20) (|List| $) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 140 |zero?| 146 |tensor| 151 |support| 167 |sup| 172
              |subtractIfCan| 178 |smaller?| 184 |sample| 190 |rightRecip| 194
              |rightPower| 199 |retractIfCan| 211 |retract| 216 |reductum| 221
              |recip| 226 |opposite?| 231 |one?| 237 |numberOfMonomials| 242
              |monomials| 247 |monomial?| 252 |monomial| 257 |min| 263 |max|
              269 |map| 275 |listOfTerms| 281 |linearExtend| 286 |leftRecip|
              292 |leftPower| 297 |leadingTerm| 309 |leadingSupport| 314
              |leadingMonomial| 319 |leadingCoefficient| 324 |latex| 329
              |hashUpdate!| 334 |hash| 340 |constructOrdered| 345 |construct|
              350 |commutator| 355 |coerce| 361 |coefficients| 381
              |coefficient| 386 |characteristic| 392 |associator| 396
              |antiCommutator| 403 |annihilate?| 409 ^ 415 |Zero| 427 |One| 431
              >= 435 > 441 = 447 <= 453 < 459 - 465 + 476 * 482)
           'NIL
           (CONS
            (|makeByteWordVec2| 8
                                '(0 1 1 0 0 1 1 0 0 1 0 1 1 4 0 0 0 1 1 1 4 2 6
                                  1 1 6 8 1 1 1 6 7 0 1 5 0 0 0 1 3 6))
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
                                    0 16 45 2 9 0 7 8 47 2 9 0 0 0 48 2 0 0 7 0
                                    49 1 0 0 16 50 2 0 0 0 0 51 2 0 10 0 0 1 1
                                    9 10 0 11 1 0 0 19 37 2 0 0 9 9 1 1 0 0 39
                                    46 1 0 59 0 1 2 4 0 0 0 1 2 10 52 0 0 1 2 5
                                    10 0 0 1 0 9 0 1 1 1 52 0 1 2 1 0 0 54 1 2
                                    1 0 0 38 1 1 3 56 0 1 1 3 20 0 1 1 0 0 0 1
                                    1 1 52 0 1 2 9 10 0 0 1 1 1 10 0 1 1 0 38 0
                                    1 1 0 60 0 1 1 0 10 0 1 2 0 0 7 20 36 2 6 0
                                    0 0 1 2 6 0 0 0 1 2 0 0 57 0 1 1 0 16 0 17
                                    2 11 7 55 0 1 1 1 52 0 1 2 1 0 0 54 1 2 1 0
                                    0 38 1 1 0 15 0 1 1 0 20 0 1 1 0 0 0 1 1 0
                                    7 0 1 1 0 61 0 1 2 0 63 63 0 1 1 0 62 0 1 1
                                    0 0 16 45 1 0 0 16 50 2 1 0 0 0 1 1 1 0 53
                                    1 1 1 0 7 1 1 3 0 20 1 1 0 13 0 30 1 0 58 0
                                    1 2 0 7 0 20 1 0 1 38 1 3 1 0 0 0 0 1 2 1 0
                                    0 0 1 2 1 10 0 0 1 2 1 0 0 54 1 2 1 0 0 38
                                    1 0 9 0 44 0 1 0 1 2 6 10 0 0 1 2 6 10 0 0
                                    1 2 0 10 0 0 1 2 6 10 0 0 1 2 6 10 0 0 1 2
                                    2 0 0 0 1 1 2 0 0 1 2 0 0 0 0 1 2 2 0 53 0
                                    1 2 9 0 38 0 1 2 1 0 0 0 51 2 0 0 7 20 1 2
                                    0 0 20 7 1 2 0 0 0 7 1 2 0 0 54 0 1 2 0 0 7
                                    0 49)))))
           '|lookupComplete|)) 
