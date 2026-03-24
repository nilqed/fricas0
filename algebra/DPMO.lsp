
(SDEFUN |DPMO;*;R2%;1| ((|r| (R)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G3 NIL) (#2=#:G5 NIL) (|i| NIL) (#3=#:G4 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT % 6)))
                 (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #1# 0) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL |r| (SPADCALL |x| |i| (QREFELT % 11))
                                          (QREFELT % 12)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(DECLAIM (NOTINLINE |DirectProductModule;|)) 

(DEFUN |DirectProductModule;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G23 NIL) (#2=#:G24 NIL) (#3=#:G25 NIL) (#4=#:G27 NIL)
    (#5=#:G26 NIL) (#6=#:G28 NIL) (#7=#:G29 NIL) (#8=#:G30 NIL) (#9=#:G31 NIL)
    (#10=#:G32 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|DirectProductModule| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 46))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|)))
                                        (LETT #10#
                                              (|HasCategory| |#3|
                                                             '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10#)
                                        (|HasCategory| |#3| '(|unitsKnown|))
                                        (|HasCategory| |#3|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#3| '(|SemiRng|))
                                        (|HasCategory| |#3| '(|Ring|))
                                        (|HasCategory| |#3| '(|Monoid|))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#3| '(|SemiRng|)))
                                        (LETT #9#
                                              (|HasCategory| |#3| '(|Finite|)))
                                        (OR #9#
                                            (|HasCategory| |#3|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory| |#3|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #10#)
                                        (OR (|HasCategory| |#3| '(|Ring|))
                                            (|HasCategory| |#3| '(|SemiRng|)))
                                        (|HasCategory| |#3|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #8#
                                              (|HasCategory| |#3|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#3| '(|Ring|))
                                         (|HasCategory| |#3| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#3| '(|Ring|)))
                                        (|HasCategory| |#3| '(|SetCategory|))
                                        (AND
                                         (|HasCategory| |#3|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#3|)))
                                         (|HasCategory| |#3| '(|SetCategory|)))
                                        (|HasCategory| |#3| '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (OR #9# #10#)
                                        (AND #8#
                                             (|HasCategory| |#3| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (LETT #7#
                                              (|HasCategory| |#3|
                                                             '(|SemiGroup|)))
                                        (OR (|HasCategory| |#3| '(|Monoid|))
                                            #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))))
                                        (OR #6# (|HasCategory| |#3| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3| '(|SetCategory|)))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (LETT #5#
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Ring|))))
                                        (OR
                                         (AND #5#
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #5#
                                              (|HasCategory| |#3|
                                                             '(|CommutativeRing|)))
                                         (AND #5# #8#) #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #3#
                                              (|HasCategory| |#3|
                                                             '(|AbelianMonoid|)))
                                        (AND #3#
                                             (|HasCategory| |#3| '(|Monoid|)))
                                        (AND #3#
                                             (|HasCategory| |#3| '(|SemiRng|)))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2#)
                                        (LETT #1#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|))))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #7#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #7#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3|
                                                         '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #7#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         #6#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2# #1#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2# #3# #1#)))))
    (|haddProp| |$ConstructorCache| '|DirectProductModule|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 140737488355328))
    (AND #10# (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 281474976710656))
    (AND (|HasCategory| |#3| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 562949953421312))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 1125899906842624))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianMonoid|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
         #3#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         (AND #2# (|HasCategory| |#3| '(|Ring|)))
         (AND #2# (|HasCategory| |#3| '(|SemiRng|))) #1#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         #2#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 9007199254740992))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|Vector| |#3|))
    %))) 

(DEFUN |DirectProductModule| (&REST #1=#:G33)
  (SPROG NIL
         (PROG (#2=#:G34)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T T))
                                               (HGET |$ConstructorCache|
                                                     '|DirectProductModule|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProductModule;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|DirectProductModule|)))))))))) 

(MAKEPROP '|DirectProductModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Integer|)
              (0 . |elt|) (6 . *) |DPMO;*;R2%;1| (|Boolean|)
              (|NonNegativeInteger|) (|Mapping| 8 8) (|List| 8) (|List| 10)
              (|Vector| 8) (|PositiveInteger|) (|String|) (|OutputForm|)
              (|List| 24) (|Equation| 8) (|Matrix| 10) (|Matrix| %)
              (|Record| (|:| |mat| 25) (|:| |vec| (|Vector| 10))) (|Vector| %)
              (|List| 30) (|Symbol|) (|List| 15) (|Union| 33 '#1="failed")
              (|Fraction| 10) (|Union| 10 '#1#) (|Union| % '"failed")
              (|Mapping| 14 8) (|Mapping| 14 8 8) (|Void|) (|List| %)
              (|HashState|) (|SingleInteger|) (|InputForm|)
              (|Record| (|:| |mat| 44) (|:| |vec| 19)) (|Matrix| 8)
              (|Union| 8 '#1#))
           '#(~= 12 |zero?| 18 |unitVector| 23 |swap!| 28 |sup| 35
              |subtractIfCan| 41 |smaller?| 47 |size?| 53 |size| 59 |setelt!|
              63 |sample| 70 |rightRecip| 74 |rightPower| 79 |retractIfCan| 91
              |retract| 106 |reducedSystem| 121 |recip| 143 |random| 148
              |qsetelt!| 152 |qelt| 159 |plenaryPower| 165 |parts| 171
              |opposite?| 176 |one?| 182 |more?| 187 |minIndex| 193 |min| 198
              |members| 209 |member?| 214 |maxIndex| 220 |max| 225 |map!| 242
              |map| 248 |lookup| 254 |less?| 259 |leftRecip| 265 |leftPower|
              270 |latex| 282 |inf| 287 |indices| 293 |index?| 298 |index| 304
              |hashUpdate!| 309 |hash| 315 |first| 320 |fill!| 325 |every?| 331
              |eval| 337 |eq?| 363 |enumerate| 369 |entry?| 373 |entries| 379
              |empty?| 384 |empty| 389 |elt| 393 |dot| 406 |directProduct| 412
              |differentiate| 417 |count| 467 |copy| 479 |convert| 484
              |commutator| 489 |coerce| 495 |characteristic| 525 |associator|
              529 |any?| 536 |antiCommutator| 542 |annihilate?| 548 ^ 554
              |Zero| 566 |One| 570 D 574 >= 624 > 630 = 636 <= 642 < 648 - 654
              + 665 * 671 |#| 719)
           'NIL
           (CONS
            (|makeByteWordVec2| 47
                                '(0 8 6 15 14 6 6 17 17 6 6 8 8 6 6 7 33 8 10
                                  10 8 1 17 33 13 10 10 7 1 0 0 41 2 46 9 8 2
                                  47 16 26 11 9 4 0 18 26 12 0 0 45 44 18 11 6
                                  43 0 0 0 45 44 18 11 6 5 3 43 0 0 0 0 0 0))
            (CONS
             '#(|DirectProductCategory&| |DifferentialExtension&| NIL
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&|
                |Algebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |NonAssociativeRing&|
                NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| NIL |Finite&| |MagmaWithUnit&|
                |OrderedSet&| |IndexedAggregate&| |FullyRetractableTo&|
                |Magma&| NIL |AbelianSemiGroup&| |HomogeneousAggregate&|
                |RetractableTo&| |RetractableTo&| |RetractableTo&| |Hashable&|
                NIL |Evalable&| |EltableAggregate&| |SetCategory&| |Aggregate&|
                NIL NIL NIL NIL NIL NIL |PartialOrder&| |InnerEvalable&| NIL
                NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|DirectProductCategory| 6 8) (|DifferentialExtension| 8)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 30) (|Algebra| 8) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| 8)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 8) (|Module| 8) (|Module| $$)
                 (|SemiRng|) (|LinearlyExplicitOver| 10)
                 (|LinearlyExplicitOver| 8) (|BiModule| 8 8) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedAbelianMonoidSup|)
                 (|NonAssociativeRng|) (|RightModule| 10) (|RightModule| 8)
                 (|LeftModule| 8) (|LeftModule| $$) (|RightModule| $$)
                 (|OrderedCancellationAbelianMonoid|)
                 (|AbelianProductCategory| 8) (|LeftModule| 7) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|Finite|)
                 (|MagmaWithUnit|) (|OrderedSet|) (|IndexedAggregate| 10 8)
                 (|FullyRetractableTo| 8) (|Magma|) (|Comparable|)
                 (|AbelianSemiGroup|) (|HomogeneousAggregate| 8)
                 (|RetractableTo| 10) (|RetractableTo| 33) (|RetractableTo| 8)
                 (|Hashable|) (|CommutativeStar|) (|Evalable| 8)
                 (|EltableAggregate| 10 8) (|SetCategory|) (|Aggregate|)
                 (|CoercibleFrom| 10) (|CoercibleFrom| 33) (|CoercibleFrom| 8)
                 (|ConvertibleTo| 42) (|TwoSidedRecip|) (|unitsKnown|)
                 (|PartialOrder|) (|InnerEvalable| 8 8) (|Eltable| 10 8)
                 (|CoercibleTo| (|Vector| 8)) (|finiteAggregate|) (|BasicType|)
                 (|CoercibleTo| 22) (|Type|))
              (|makeByteWordVec2| 54
                                  '(2 0 8 0 10 11 2 8 0 7 0 12 2 0 14 0 0 1 1
                                    52 14 0 1 1 36 0 20 1 3 51 38 0 10 10 1 2 1
                                    0 0 0 1 2 53 35 0 0 1 2 22 14 0 0 1 2 0 14
                                    0 15 1 0 11 15 1 3 51 8 0 10 8 1 0 0 0 1 1
                                    9 35 0 1 2 9 0 0 15 1 2 25 0 0 20 1 1 29 32
                                    0 1 1 27 34 0 1 1 18 45 0 1 1 29 33 0 1 1
                                    27 10 0 1 1 18 8 0 1 1 32 25 26 1 2 32 27
                                    26 28 1 2 8 43 26 28 1 1 8 44 26 1 1 9 35 0
                                    1 0 11 0 1 3 51 8 0 10 8 1 2 0 8 0 10 1 2 6
                                    0 0 20 1 1 48 17 0 1 2 52 14 0 0 1 1 9 14 0
                                    1 2 0 14 0 15 1 1 21 10 0 1 1 49 8 0 1 2 3
                                    0 0 0 1 1 48 17 0 1 2 50 14 8 0 1 1 21 10 0
                                    1 1 49 8 0 1 2 48 8 37 0 1 2 3 0 0 0 1 2 51
                                    0 16 0 1 2 0 0 16 0 1 1 11 20 0 1 2 0 14 0
                                    15 1 1 9 35 0 1 2 9 0 0 15 1 2 25 0 0 20 1
                                    1 0 21 0 1 2 1 0 0 0 1 1 0 18 0 1 2 0 14 10
                                    0 1 1 11 0 20 1 2 11 40 40 0 1 1 11 41 0 1
                                    1 21 8 0 1 2 51 0 0 8 1 2 48 14 36 0 1 2 19
                                    0 0 23 1 3 19 0 0 8 8 1 2 19 0 0 24 1 3 19
                                    0 0 17 17 1 2 0 14 0 0 1 0 11 39 1 2 50 14
                                    8 0 1 1 0 17 0 1 1 0 14 0 1 0 0 0 1 2 0 8 0
                                    10 11 3 0 8 0 10 8 1 2 37 8 0 0 1 1 0 0 19
                                    1 1 23 0 0 1 2 23 0 0 15 1 2 24 0 0 29 1 2
                                    24 0 0 30 1 3 24 0 0 29 31 1 3 24 0 0 30 15
                                    1 2 8 0 0 16 1 3 8 0 0 16 15 1 2 50 15 8 0
                                    1 2 48 15 36 0 1 1 0 0 0 1 1 11 42 0 1 2 8
                                    0 0 0 1 1 0 19 0 1 1 0 22 0 1 1 29 0 33 1 1
                                    28 0 10 1 1 6 0 0 1 1 18 0 8 1 0 8 15 1 3 8
                                    0 0 0 0 1 2 48 14 36 0 1 2 7 0 0 0 1 2 8 14
                                    0 0 1 2 9 0 0 15 1 2 25 0 0 20 1 0 52 0 1 0
                                    9 0 1 1 23 0 0 1 2 23 0 0 15 1 2 24 0 0 29
                                    1 2 24 0 0 30 1 3 24 0 0 29 31 1 3 24 0 0
                                    30 15 1 2 8 0 0 16 1 3 8 0 0 16 15 1 2 3 14
                                    0 0 1 2 3 14 0 0 1 2 0 14 0 0 1 2 3 14 0 0
                                    1 2 3 14 0 0 1 1 54 0 0 1 2 54 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 20 0 1 2 0 0 7 0 13 2 32 0 0
                                    10 1 2 54 0 10 0 1 2 52 0 15 0 1 2 25 0 8 0
                                    1 2 25 0 0 8 1 2 25 0 0 0 1 1 48 15 0
                                    1)))))
           '|lookupComplete|)) 
