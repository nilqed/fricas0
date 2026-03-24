
(SDEFUN |ODP;<;2%B;1| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 8))) 

(DECLAIM (NOTINLINE |OrderedDirectProduct;|)) 

(DEFUN |OrderedDirectProduct;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G18 NIL) (#2=#:G19 NIL) (#3=#:G20 NIL) (#4=#:G21 NIL)
    (#5=#:G22 NIL) (#6=#:G24 NIL) (#7=#:G23 NIL) (#8=#:G25 NIL) (#9=#:G26 NIL)
    (#10=#:G27 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|OrderedDirectProduct| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 44))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|)))
                                        (LETT #10#
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10#)
                                        (|HasCategory| |#2| '(|unitsKnown|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRng|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2| '(|Monoid|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #9#
                                              (|HasCategory| |#2| '(|Finite|)))
                                        (OR #9#
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #10#)
                                        (OR (|HasCategory| |#2| '(|Ring|))
                                            (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #8#
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|SetCategory|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#2|)))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (|HasCategory| |#2| '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (OR #9# #10#)
                                        (AND #8#
                                             (|HasCategory| |#2| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #7#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND #7#
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #7#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #7# #8#) #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #5#
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|)))
                                        (AND #5#
                                             (|HasCategory| |#2| '(|Monoid|)))
                                        (AND #5#
                                             (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5# #4#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5# #4#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|SemiGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #4#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|SetCategory|))))
                                        (OR (|HasCategory| |#2| '(|Monoid|))
                                            #3#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5#
                                         (|HasCategory| |#2| '(|BasicType|))
                                         #4#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# #9#
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10# (|HasCategory| |#2| '(|Ring|))
                                         #3# (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5# #4#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# #9#
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10# (|HasCategory| |#2| '(|Ring|))
                                         #3# (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR #5#
                                            (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|CoercibleTo|
                                                         (|OutputForm|)))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #4#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #2#)
                                        (OR #2# (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #1#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|SetCategory|)))
                                         #6# #1# #2#
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND #5#
                                              (|HasCategory| |#2| '(|Ring|)))
                                         (AND #5#
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|OrderedDirectProduct|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 1125899906842624))
    (AND #10# (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2251799813685248))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4503599627370496))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #5#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|SemiRng|)))
      #4#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (|HasCategory| |#2| '(|SetCategory|)))
     (|augmentPredVector| % 144115188075855872))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|Vector| |#2|))
    %))) 

(DEFUN |OrderedDirectProduct| (&REST #1=#:G28)
  (SPROG NIL
         (PROG (#2=#:G29)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(NIL T NIL))
                     (HGET |$ConstructorCache| '|OrderedDirectProduct|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |OrderedDirectProduct;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|OrderedDirectProduct|)))))))))) 

(MAKEPROP '|OrderedDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 7)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Boolean|)
              |ODP;<;2%B;1| (|NonNegativeInteger|) (|Mapping| 7 7) (|Integer|)
              (|List| 7) (|List| 14) (|Vector| 7) (|PositiveInteger|)
              (|List| 20) (|Equation| 7) (|Matrix| 14) (|Matrix| %)
              (|Record| (|:| |mat| 21) (|:| |vec| (|Vector| 14))) (|Vector| %)
              (|List| 26) (|Symbol|) (|List| 12) (|Fraction| 14)
              (|Union| 28 '#1="failed") (|Union| 14 '#1#) (|Union| % '"failed")
              (|Mapping| 10 7) (|Mapping| 10 7 7) (|Void|) (|OutputForm|)
              (|List| %) (|HashState|) (|SingleInteger|) (|InputForm|)
              (|Record| (|:| |mat| 41) (|:| |vec| 17)) (|Matrix| 7) (|String|)
              (|Union| 7 '#1#))
           '#(~= 0 |zero?| 6 |unitVector| 11 |swap!| 16 |sup| 23
              |subtractIfCan| 29 |smaller?| 35 |size?| 41 |size| 47 |setelt!|
              51 |sample| 58 |rightRecip| 62 |rightPower| 67 |retractIfCan| 79
              |retract| 94 |reducedSystem| 109 |recip| 131 |random| 136
              |qsetelt!| 140 |qelt| 147 |plenaryPower| 153 |parts| 159
              |opposite?| 164 |one?| 170 |more?| 175 |minIndex| 181 |min| 186
              |members| 197 |member?| 202 |maxIndex| 208 |max| 213 |map!| 230
              |map| 236 |lookup| 242 |less?| 247 |leftRecip| 253 |leftPower|
              258 |latex| 270 |inf| 275 |indices| 281 |index?| 286 |index| 292
              |hashUpdate!| 297 |hash| 303 |first| 308 |fill!| 313 |every?| 319
              |eval| 325 |eq?| 351 |enumerate| 357 |entry?| 361 |entries| 367
              |empty?| 372 |empty| 377 |elt| 381 |dot| 394 |directProduct| 400
              |differentiate| 405 |count| 455 |copy| 467 |convert| 472
              |commutator| 477 |coerce| 483 |characteristic| 513 |associator|
              517 |any?| 524 |antiCommutator| 530 |annihilate?| 536 ^ 542
              |Zero| 554 |One| 558 D 562 >= 612 > 618 = 624 <= 630 < 636 - 642
              + 653 * 659 |#| 701)
           'NIL
           (CONS
            (|makeByteWordVec2| 50
                                '(0 9 6 16 15 6 6 18 18 6 6 9 9 6 6 8 28 9 11
                                  11 9 1 18 28 14 11 11 8 1 0 7 2 10 9 36 2 17
                                  40 12 10 35 4 0 19 37 40 13 0 46 50 19 42 12
                                  6 39 0 0 46 50 19 41 12 6 5 3 49 39 0 0 0 0))
            (CONS
             '#(|DirectProductCategory&| |DifferentialExtension&| NIL
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&|
                |Algebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |NonAssociativeRing&|
                NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL NIL |NonAssociativeSemiRng&|
                NIL |Finite&| |MagmaWithUnit&| |AbelianMonoid&| |OrderedSet&|
                |IndexedAggregate&| |FullyRetractableTo&| |AbelianSemiGroup&|
                |Magma&| NIL |HomogeneousAggregate&| |RetractableTo&|
                |RetractableTo&| |RetractableTo&| |SetCategory&| |Hashable&|
                NIL |Evalable&| |EltableAggregate&| |Aggregate&| NIL NIL NIL
                |BasicType&| NIL NIL NIL |PartialOrder&| NIL |InnerEvalable&|
                NIL NIL NIL NIL)
             (CONS
              '#((|DirectProductCategory| 6 7) (|DifferentialExtension| 7)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 26) (|Algebra| 7) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| 7)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 7) (|Module| 7) (|Module| $$)
                 (|SemiRng|) (|LinearlyExplicitOver| 14)
                 (|LinearlyExplicitOver| 7) (|BiModule| 7 7) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedAbelianMonoidSup|)
                 (|NonAssociativeRng|) (|RightModule| 14) (|RightModule| 7)
                 (|LeftModule| 7) (|LeftModule| $$) (|RightModule| $$)
                 (|OrderedCancellationAbelianMonoid|)
                 (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|Finite|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|OrderedSet|)
                 (|IndexedAggregate| 14 7) (|FullyRetractableTo| 7)
                 (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|HomogeneousAggregate| 7) (|RetractableTo| 14)
                 (|RetractableTo| 28) (|RetractableTo| 7) (|SetCategory|)
                 (|Hashable|) (|CommutativeStar|) (|Evalable| 7)
                 (|EltableAggregate| 14 7) (|Aggregate|) (|CoercibleFrom| 14)
                 (|CoercibleFrom| 28) (|CoercibleFrom| 7) (|BasicType|)
                 (|ConvertibleTo| 39) (|TwoSidedRecip|) (|unitsKnown|)
                 (|PartialOrder|) (|CoercibleTo| 35) (|InnerEvalable| 7 7)
                 (|Eltable| 14 7) (|CoercibleTo| (|Vector| 7))
                 (|finiteAggregate|) (|Type|))
              (|makeByteWordVec2| 58
                                  '(2 58 10 0 0 1 1 55 10 0 1 1 31 0 18 1 3 54
                                    34 0 14 14 1 2 1 0 0 0 1 2 56 31 0 0 1 2 23
                                    10 0 0 1 2 0 10 0 12 1 0 12 12 1 3 54 7 0
                                    14 7 1 0 0 0 1 1 10 31 0 1 2 10 0 0 12 1 2
                                    38 0 0 18 1 1 48 29 0 1 1 45 30 0 1 1 19 43
                                    0 1 1 48 28 0 1 1 45 14 0 1 1 19 7 0 1 1 27
                                    21 22 1 2 27 23 22 24 1 2 9 40 22 24 1 1 9
                                    41 22 1 1 10 31 0 1 0 12 0 1 3 54 7 0 14 7
                                    1 2 0 7 0 14 1 2 6 0 0 18 1 1 51 15 0 1 2
                                    55 10 0 0 1 1 10 10 0 1 2 0 10 0 12 1 1 22
                                    14 0 1 1 52 7 0 1 2 3 0 0 0 1 1 51 15 0 1 2
                                    53 10 7 0 1 1 22 14 0 1 1 52 7 0 1 2 51 7
                                    33 0 1 2 3 0 0 0 1 2 54 0 13 0 1 2 0 0 13 0
                                    1 1 12 18 0 1 2 0 10 0 12 1 1 10 31 0 1 2
                                    10 0 0 12 1 2 38 0 0 18 1 1 19 42 0 1 2 1 0
                                    0 0 1 1 0 16 0 1 2 0 10 14 0 1 1 12 0 18 1
                                    2 12 37 37 0 1 1 12 38 0 1 1 22 7 0 1 2 54
                                    0 0 7 1 2 51 10 32 0 1 2 20 0 0 19 1 3 20 0
                                    0 7 7 1 2 20 0 0 20 1 3 20 0 0 15 15 1 2 0
                                    10 0 0 1 0 12 36 1 2 53 10 7 0 1 1 0 15 0 1
                                    1 0 10 0 1 0 0 0 1 2 0 7 0 14 1 3 0 7 0 14
                                    7 1 2 32 7 0 0 1 1 0 0 17 1 1 24 0 0 1 2 24
                                    0 0 12 1 2 25 0 0 25 1 2 25 0 0 26 1 3 25 0
                                    0 25 27 1 3 25 0 0 26 12 1 2 9 0 0 13 1 3 9
                                    0 0 13 12 1 2 53 12 7 0 1 2 51 12 32 0 1 1
                                    0 0 0 1 1 12 39 0 1 2 9 0 0 0 1 1 0 17 0 1
                                    1 48 0 28 1 1 47 0 14 1 1 44 35 0 1 1 6 0 0
                                    1 1 19 0 7 1 0 9 12 1 3 9 0 0 0 0 1 2 51 10
                                    32 0 1 2 8 0 0 0 1 2 9 10 0 0 1 2 10 0 0 12
                                    1 2 38 0 0 18 1 0 55 0 1 0 10 0 1 1 24 0 0
                                    1 2 24 0 0 12 1 2 25 0 0 25 1 2 25 0 0 26 1
                                    3 25 0 0 25 27 1 3 25 0 0 26 12 1 2 9 0 0
                                    13 1 3 9 0 0 13 12 1 2 3 10 0 0 1 2 3 10 0
                                    0 1 2 58 10 0 0 1 2 3 10 0 0 1 2 3 10 0 0
                                    11 2 57 0 0 0 1 1 57 0 0 1 2 43 0 0 0 1 2
                                    27 0 0 14 1 2 57 0 14 0 1 2 55 0 12 0 1 2
                                    43 0 18 0 1 2 38 0 7 0 1 2 38 0 0 7 1 2 38
                                    0 0 0 1 1 51 12 0 1)))))
           '|lookupComplete|)) 
