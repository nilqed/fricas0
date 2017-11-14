
(SDEFUN |WP;changeWeightLevel;NniV;1| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SETELT $ 12 |n|)) 

(SDEFUN |WP;lookup| ((|v| |VarSet|) ($ |NonNegativeInteger|))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |var| |VarSet|)
                      (|:| |weight| (|NonNegativeInteger|)))))
          (#1=#:G722 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |l| (QREFELT $ 22) . #2=(|WP;lookup|))
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |l| NIL (QREFELT $ 25))) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |v| (QCAR (|SPADfirst| |l|)) (QREFELT $ 26))
                         (PROGN
                          (LETT #1# (QCDR (|SPADfirst| |l|)) . #2#)
                          (GO #3=#:G721)))
                        ('T (LETT |l| (CDR |l|) . #2#)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT 0)))
          #3# (EXIT #1#)))) 

(SDEFUN |WP;innercoerce| ((|p| P) (|z| |Integer|) ($ $))
        (SPROG
         ((|tmp| ($)) (|ans| ($)) (|mon| (P))
          (|up| (|SparseUnivariatePolynomial| P)) (|lcup| (P))
          (|f| (|NonNegativeInteger|)) (|d| (|NonNegativeInteger|))
          (|n| (|NonNegativeInteger|)) (|mv| (|Union| |VarSet| "failed")))
         (SEQ
          (COND
           ((OR (< |z| 0) (SPADCALL |p| (QREFELT $ 28))) (|spadConstant| $ 27))
           ('T
            (SEQ
             (LETT |mv| (SPADCALL |p| (QREFELT $ 30)) . #1=(|WP;innercoerce|))
             (EXIT
              (COND ((QEQCAR |mv| 1) (SPADCALL |p| 0 (QREFELT $ 31)))
                    ('T
                     (SEQ (LETT |n| (|WP;lookup| (QCDR |mv|) $) . #1#)
                          (LETT |up| (SPADCALL |p| (QCDR |mv|) (QREFELT $ 33))
                                . #1#)
                          (LETT |ans| (|spadConstant| $ 27) . #1#)
                          (SEQ G190
                               (COND
                                ((NULL (NULL (SPADCALL |up| (QREFELT $ 35))))
                                 (GO G191)))
                               (SEQ
                                (LETT |d| (SPADCALL |up| (QREFELT $ 36)) . #1#)
                                (LETT |f| (* |n| |d|) . #1#)
                                (LETT |lcup| (SPADCALL |up| (QREFELT $ 37))
                                      . #1#)
                                (LETT |up|
                                      (SPADCALL |up|
                                                (SPADCALL |up| (QREFELT $ 38))
                                                (QREFELT $ 39))
                                      . #1#)
                                (LETT |mon|
                                      (SPADCALL (|spadConstant| $ 40)
                                                (QCDR |mv|) |d| (QREFELT $ 41))
                                      . #1#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |f| |z| (QREFELT $ 43))
                                   (SEQ
                                    (LETT |tmp|
                                          (|WP;innercoerce| |lcup| (- |z| |f|)
                                           $)
                                          . #1#)
                                    (EXIT
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (NULL
                                              (SPADCALL |tmp| (QREFELT $ 44))))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |ans|
                                                 (SPADCALL |ans|
                                                           (SPADCALL
                                                            (SPADCALL |mon|
                                                                      (SPADCALL
                                                                       |tmp|
                                                                       (QREFELT
                                                                        $ 45))
                                                                      (QREFELT
                                                                       $ 46))
                                                            (+
                                                             (SPADCALL |tmp|
                                                                       (QREFELT
                                                                        $ 47))
                                                             |f|)
                                                            (QREFELT $ 31))
                                                           (QREFELT $ 48))
                                                 . #1#)
                                           (EXIT
                                            (LETT |tmp|
                                                  (SPADCALL |tmp|
                                                            (QREFELT $ 49))
                                                  . #1#)))
                                          NIL (GO G190) G191 (EXIT NIL))))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT |ans|))))))))))) 

(SDEFUN |WP;coerce;P$;4| ((|p| P) ($ $))
        (|WP;innercoerce| |p| (QREFELT $ 12) $)) 

(SDEFUN |WP;coerce;$P;5| ((|w| $) ($ P))
        (SPROG
         ((#1=#:G740 NIL) (#2=#:G739 (P)) (#3=#:G741 (P)) (#4=#:G743 NIL)
          (|c| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|WP;coerce;$P;5|))
           (SEQ (LETT |c| NIL . #5#)
                (LETT #4# (SPADCALL |w| (QREFELT $ 52)) . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3# |c| . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 53)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 54))))))) 

(SDEFUN |WP;coerce;$Of;6| ((|p| $) ($ |OutputForm|))
        (SPROG ((#1=#:G756 NIL) (|c| NIL) (#2=#:G755 NIL))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 44)) (SPADCALL 0 (QREFELT $ 57)))
                 ((EQL (SPADCALL |p| (QREFELT $ 47)) 0)
                  (SPADCALL (SPADCALL |p| (QREFELT $ 45)) (QREFELT $ 58)))
                 ('T
                  (SPADCALL (ELT $ 60)
                            (REVERSE
                             (PROGN
                              (LETT #2# NIL . #3=(|WP;coerce;$Of;6|))
                              (SEQ (LETT |c| NIL . #3#)
                                   (LETT #1# (SPADCALL |p| (QREFELT $ 52))
                                         . #3#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |c| (CAR #1#) . #3#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |c| (QREFELT $ 58))
                                             (QREFELT $ 59))
                                            #2#)
                                           . #3#)))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))
                            (QREFELT $ 63))))))) 

(SDEFUN |WP;Zero;$;7| (($ $)) (|spadConstant| $ 65)) 

(SDEFUN |WP;One;$;8| (($ $)) (|spadConstant| $ 66)) 

(SDEFUN |WP;=;2$B;9| ((|x1| $) (|x2| $) ($ |Boolean|))
        (SEQ
         (SEQ G190
              (COND
               ((NULL
                 (SPADCALL (SPADCALL |x1| (QREFELT $ 47)) (QREFELT $ 12)
                           (QREFELT $ 68)))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT |x1| (SPADCALL |x1| (QREFELT $ 49))
                      . #1=(|WP;=;2$B;9|))))
              NIL (GO G190) G191 (EXIT NIL))
         (SEQ G190
              (COND
               ((NULL
                 (SPADCALL (SPADCALL |x2| (QREFELT $ 47)) (QREFELT $ 12)
                           (QREFELT $ 68)))
                (GO G191)))
              (SEQ (EXIT (LETT |x2| (SPADCALL |x2| (QREFELT $ 49)) . #1#))) NIL
              (GO G190) G191 (EXIT NIL))
         (EXIT (SPADCALL |x1| |x2| (QREFELT $ 69))))) 

(SDEFUN |WP;+;3$;10| ((|x1| $) (|x2| $) ($ $))
        (SPADCALL |x1| |x2| (QREFELT $ 71))) 

(SDEFUN |WP;-;2$;11| ((|x1| $) ($ $)) (SPADCALL |x1| (QREFELT $ 72))) 

(SDEFUN |WP;*;I2$;12| ((|z| |Integer|) (|x1| $) ($ $))
        (SPADCALL |z| |x1| (QREFELT $ 73))) 

(SDEFUN |WP;*;3$;13| ((|x1| $) (|x2| $) ($ $))
        (SPROG ((|w| ($)))
               (SEQ
                (LETT |w| (SPADCALL |x1| |x2| (QREFELT $ 75))
                      . #1=(|WP;*;3$;13|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |w| (QREFELT $ 47)) (QREFELT $ 12)
                                  (QREFELT $ 68)))
                       (GO G191)))
                     (SEQ
                      (EXIT (LETT |w| (SPADCALL |w| (QREFELT $ 49)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |w|)))) 

(SDEFUN |WP;characteristic;Nni;14| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 77))) 

(DECLAIM (NOTINLINE |WeightedPolynomials;|)) 

(DEFUN |WeightedPolynomials| (&REST #1=#:G779)
  (SPROG NIL
         (PROG (#2=#:G780)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|WeightedPolynomials|)
                                               '|domainEqualList|)
                    . #3=(|WeightedPolynomials|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |WeightedPolynomials;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|WeightedPolynomials|)))))))))) 

(DEFUN |WeightedPolynomials;| (|#1| |#2| |#3| |#4| |#5| |#6| |#7|)
  (SPROG
   ((#1=#:G777 NIL) (|v| NIL) (#2=#:G778 NIL) (|n| NIL) (#3=#:G776 NIL)
    (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$7 NIL) (DV$6 NIL) (DV$5 NIL) (DV$4 NIL)
    (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #4=(|WeightedPolynomials|))
     (LETT DV$2 (|devaluate| |#2|) . #4#)
     (LETT DV$3 (|devaluate| |#3|) . #4#)
     (LETT DV$4 (|devaluate| |#4|) . #4#)
     (LETT DV$5 (|devaluate| |#5|) . #4#)
     (LETT DV$6 (|devaluate| |#6|) . #4#)
     (LETT DV$7 (|devaluate| |#7|) . #4#)
     (LETT |dv$|
           (LIST '|WeightedPolynomials| DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7)
           . #4#)
     (LETT $ (GETREFV 84) . #4#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|Field|))))
                     . #4#))
     (|haddProp| |$ConstructorCache| '|WeightedPolynomials|
                 (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7) (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (QSETREFV $ 8 |#3|)
     (QSETREFV $ 9 |#4|)
     (QSETREFV $ 10 |#5|)
     (QSETREFV $ 11 |#6|)
     (QSETREFV $ 12 |#7|)
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 13 (|PolynomialRing| |#4| (|NonNegativeInteger|)))
     (QSETREFV $ 21
               (SPADCALL (LENGTH |#5|) (SPADCALL |#6| (QREFELT $ 18))
                         (QREFELT $ 20)))
     (COND
      ((QREFELT $ 21)
       (|error| "incompatible length lists in WeightedPolynomial")))
     (QSETREFV $ 22
               (PROGN
                (LETT #3# NIL . #4#)
                (SEQ (LETT |n| NIL . #4#) (LETT #2# |#6| . #4#)
                     (LETT |v| NIL . #4#) (LETT #1# |#5| . #4#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #4#) NIL)
                           (ATOM #2#) (PROGN (LETT |n| (CAR #2#) . #4#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT #3# (CONS (CONS |v| |n|) #3#) . #4#)))
                     (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#))
                           . #4#)
                     (GO G190) G191 (EXIT (NREVERSE #3#)))))
     $)))) 

(MAKEPROP '|WeightedPolynomials| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) '|Rep| (|Void|) (|NonNegativeInteger|)
              |WP;changeWeightLevel;NniV;1| (|List| 15) (0 . |#|) (|Boolean|)
              (5 . ~=) '#:G690 '|lookupList|
              (|Record| (|:| |var| 7) (|:| |weight| 15)) (|List| 23) (11 . ~=)
              (17 . =)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |WP;Zero;$;7|) $))
              (23 . |zero?|) (|Union| 7 '"failed") (28 . |mainVariable|)
              (33 . |monomial|) (|SparseUnivariatePolynomial| $)
              (39 . |univariate|) (|SparseUnivariatePolynomial| 9)
              (45 . |zero?|) (50 . |degree|) (55 . |leadingCoefficient|)
              (60 . |leadingMonomial|) (65 . -) (71 . |One|) (75 . |monomial|)
              (|Integer|) (82 . <=) (88 . |zero?|) (93 . |leadingCoefficient|)
              (98 . *) (104 . |degree|) |WP;+;3$;10| (109 . |reductum|)
              |WP;coerce;P$;4| (|List| 9) (114 . |coefficients|) (119 . +)
              (125 . |Zero|) |WP;coerce;$P;5| (|OutputForm|) (129 . |coerce|)
              (134 . |coerce|) (139 . |paren|) (144 . +) (|Mapping| 56 56 56)
              (|List| 56) (150 . |reduce|) |WP;coerce;$Of;6| (156 . |Zero|)
              (160 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |WP;One;$;8|) $))
              (164 . >) (170 . =) |WP;=;2$B;9| (176 . +) |WP;-;2$;11| (182 . *)
              |WP;*;I2$;12| (188 . *) |WP;*;3$;13| (194 . |characteristic|)
              |WP;characteristic;Nni;14| (|Union| $ '"failed")
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 198 |zero?| 204 |subtractIfCan| 209 |sample| 215 |rightRecip|
              219 |rightPower| 224 |recip| 236 |opposite?| 241 |one?| 247
              |leftRecip| 252 |leftPower| 257 |latex| 269 |hashUpdate!| 274
              |hash| 280 |commutator| 285 |coerce| 291 |characteristic| 316
              |changeWeightLevel| 320 |associator| 325 |antiCommutator| 332
              |annihilate?| 338 ^ 344 |Zero| 356 |One| 360 = 364 / 370 - 376 +
              387 * 393)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(1 0 0 0 0 1 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0))
            (CONS
             '#(|Algebra&| NIL |Rng&| NIL NIL |Module&| |NonAssociativeRing&|
                NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL |AbelianGroup&|
                NIL NIL NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |Magma&| |AbelianSemiGroup&| |SetCategory&|
                NIL |BasicType&| NIL)
             (CONS
              '#((|Algebra| 6) (|Ring|) (|Rng|) (|SemiRing|) (|SemiRng|)
                 (|Module| 6) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 6) (|RightModule| 6)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Magma|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 56))
              (|makeByteWordVec2| 83
                                  '(1 17 15 0 18 2 15 19 0 0 20 2 24 19 0 0 25
                                    2 7 19 0 0 26 1 9 19 0 28 1 9 29 0 30 2 13
                                    0 9 15 31 2 9 32 0 7 33 1 34 19 0 35 1 34
                                    15 0 36 1 34 9 0 37 1 34 0 0 38 2 34 0 0 0
                                    39 0 9 0 40 3 9 0 0 7 15 41 2 42 19 0 0 43
                                    1 0 19 0 44 1 13 9 0 45 2 9 0 0 0 46 1 13
                                    15 0 47 1 13 0 0 49 1 13 51 0 52 2 9 0 0 0
                                    53 0 9 0 54 1 42 56 0 57 1 9 56 0 58 1 56 0
                                    0 59 2 56 0 0 0 60 2 62 56 61 0 63 0 13 0
                                    65 0 13 0 66 2 15 19 0 0 68 2 13 19 0 0 69
                                    2 13 0 0 0 71 2 13 0 42 0 73 2 13 0 0 0 75
                                    0 6 15 77 2 0 19 0 0 1 1 0 19 0 44 2 0 79 0
                                    0 1 0 0 0 1 1 0 79 0 1 2 0 0 0 15 1 2 0 0 0
                                    80 1 1 0 79 0 1 2 0 19 0 0 1 1 0 19 0 1 1 0
                                    79 0 1 2 0 0 0 15 1 2 0 0 0 80 1 1 0 81 0 1
                                    2 0 83 83 0 1 1 0 82 0 1 2 0 0 0 0 1 1 1 0
                                    6 1 1 0 0 9 50 1 0 9 0 55 1 0 0 42 1 1 0 56
                                    0 64 0 0 15 78 1 0 14 15 16 3 0 0 0 0 0 1 2
                                    0 0 0 0 1 2 0 19 0 0 1 2 0 0 0 15 1 2 0 0 0
                                    80 1 0 0 0 27 0 0 0 67 2 0 19 0 0 70 2 2 79
                                    0 0 1 2 0 0 0 0 1 1 0 0 0 72 2 0 0 0 0 48 2
                                    1 0 0 6 1 2 1 0 6 0 1 2 0 0 15 0 1 2 0 0 42
                                    0 74 2 0 0 0 0 76 2 0 0 80 0 1)))))
           '|lookupComplete|)) 
