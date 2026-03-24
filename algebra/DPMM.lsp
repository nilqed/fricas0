
(SDEFUN |DPMM;*;R2%;1| ((|r| (R)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G3 NIL) (#2=#:G5 NIL) (|i| NIL) (#3=#:G4 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT % 6)))
                 (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #1# 0) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL |r| (SPADCALL |x| |i| (QREFELT % 12))
                                          (QREFELT % 13)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(SDEFUN |DPMM;*;M2%;2| ((|m| (M)) (|x| (%)) (% (%)))
        (SPROG
         ((#1=#:G8 NIL) (#2=#:G7 (S)) (#3=#:G9 (S)) (#4=#:G15 NIL) (|j| NIL)
          (#5=#:G12 NIL) (#6=#:G14 NIL) (|i| NIL) (#7=#:G13 NIL))
         (SEQ
          (PROGN
           (LETT #7# (GETREFV #8=(QREFELT % 6)))
           (SEQ (LETT |i| 1) (LETT #6# #8#) (LETT #5# 0) G190
                (COND ((|greater_SI| |i| #6#) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT #7# #5#
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |j| 1) (LETT #4# (QREFELT % 6)) G190
                                (COND ((|greater_SI| |j| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #3#
                                         (SPADCALL
                                          (SPADCALL |m| |i| |j| (QREFELT % 15))
                                          (SPADCALL |x| |j| (QREFELT % 12))
                                          (QREFELT % 13)))
                                   (COND
                                    (#1#
                                     (LETT #2#
                                           (SPADCALL #2# #3# (QREFELT % 16))))
                                    ('T
                                     (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))
                           (COND (#1# #2#) ('T (|spadConstant| % 17)))))))
                (LETT #5# (PROG1 (|inc_SI| #5#) (LETT |i| (|inc_SI| |i|))))
                (GO G190) G191 (EXIT NIL))
           #7#)))) 

(DECLAIM (NOTINLINE |DirectProductMatrixModule;|)) 

(DEFUN |DirectProductMatrixModule;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G33 NIL) (#2=#:G34 NIL) (#3=#:G35 NIL) (#4=#:G37 NIL)
    (#5=#:G36 NIL) (#6=#:G38 NIL) (#7=#:G39 NIL) (#8=#:G40 NIL) (#9=#:G41 NIL)
    (#10=#:G42 NIL) (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|DirectProductMatrixModule| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 51))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#4|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (OR
                                         (|HasCategory| |#4|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#4|
                                                        '(|OrderedAbelianMonoidSup|)))
                                        (LETT #10#
                                              (|HasCategory| |#4|
                                                             '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#4|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#4|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10#)
                                        (|HasCategory| |#4| '(|unitsKnown|))
                                        (|HasCategory| |#4|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#4| '(|SemiRng|))
                                        (|HasCategory| |#4| '(|Ring|))
                                        (|HasCategory| |#4| '(|Monoid|))
                                        (OR
                                         (|HasCategory| |#4|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#4| '(|SemiRng|)))
                                        (LETT #9#
                                              (|HasCategory| |#4| '(|Finite|)))
                                        (OR #9#
                                            (|HasCategory| |#4|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory| |#4|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #10#)
                                        (OR (|HasCategory| |#4| '(|Ring|))
                                            (|HasCategory| |#4| '(|SemiRng|)))
                                        (|HasCategory| |#4|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #8#
                                              (|HasCategory| |#4|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#4|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#4| '(|Ring|))
                                         (|HasCategory| |#4| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#4|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#4| '(|Ring|)))
                                        (|HasCategory| |#4| '(|SetCategory|))
                                        (AND
                                         (|HasCategory| |#4|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#4|)))
                                         (|HasCategory| |#4| '(|SetCategory|)))
                                        (|HasCategory| |#4| '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (OR #9# #10#)
                                        (AND #8#
                                             (|HasCategory| |#4| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#4| '(|Ring|)))
                                        (LETT #7#
                                              (|HasCategory| |#4|
                                                             '(|SemiGroup|)))
                                        (OR (|HasCategory| |#4| '(|Monoid|))
                                            #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#4|
                                                              '(|SetCategory|))))
                                        (OR #6# (|HasCategory| |#4| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#4|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#4| '(|SetCategory|)))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (|HasCategory| |#3| '(|AbelianMonoid|))
                                        (LETT #5#
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#4| '(|Ring|))))
                                        (OR
                                         (AND #5#
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #5#
                                              (|HasCategory| |#4|
                                                             '(|CommutativeRing|)))
                                         (AND #5# #8#) #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #3#
                                              (|HasCategory| |#4|
                                                             '(|AbelianMonoid|)))
                                        (AND #3#
                                             (|HasCategory| |#4| '(|Monoid|)))
                                        (AND #3#
                                             (|HasCategory| |#4| '(|SemiRng|)))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#3| '(|AbelianGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#4|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2#)
                                        (LETT #1#
                                              (|HasCategory| |#4|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          #7#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4|
                                                         '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #7#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4|
                                                         '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #7#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4| '(|SemiRng|)))
                                         #6#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2# #1#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2# #3# #1#)))))
    (|haddProp| |$ConstructorCache| '|DirectProductMatrixModule|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 562949953421312))
    (AND #10# (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 1125899906842624))
    (AND (|HasCategory| |#4| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2251799813685248))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 4503599627370496))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianMonoid|))
         (|HasCategory| |#3| '(|AbelianMonoid|))
         (AND #5# (|HasCategory| |#4| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
         #3#
         (AND (|HasCategory| |#4| '(|SemiRng|))
              (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (|HasCategory| |#3| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#4| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         (AND #2# (|HasCategory| |#4| '(|Ring|)))
         (AND #2# (|HasCategory| |#4| '(|SemiRng|))) #1#
         (AND (|HasCategory| |#4| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (|HasCategory| |#3| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#4| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         #2#
         (AND (|HasCategory| |#4| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 36028797018963968))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 (|Vector| |#4|))
    %))) 

(DEFUN |DirectProductMatrixModule| (&REST #1=#:G43)
  (SPROG NIL
         (PROG (#2=#:G44)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(NIL T T T))
                     (HGET |$ConstructorCache| '|DirectProductMatrixModule|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProductMatrixModule;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|DirectProductMatrixModule|)))))))))) 

(MAKEPROP '|DirectProductMatrixModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 9)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Integer|) (0 . |elt|) (6 . *) |DPMM;*;R2%;1|
              (12 . |elt|) (19 . +) (25 . |Zero|) |DPMM;*;M2%;2| (|Boolean|)
              (|NonNegativeInteger|) (|Mapping| 9 9) (|List| 9) (|List| 11)
              (|Vector| 9) (|PositiveInteger|) (|OutputForm|) (|String|)
              (|List| 29) (|Equation| 9)
              (|Record| (|:| |mat| 33) (|:| |vec| (|Vector| 11))) (|Matrix| %)
              (|Vector| %) (|Matrix| 11) (|Symbol|) (|List| 34) (|List| 20)
              (|Fraction| 11) (|Union| 37 '#1="failed") (|Union| 11 '#1#)
              (|Union| % '"failed") (|Mapping| 19 9) (|Mapping| 19 9 9)
              (|Void|) (|List| %) (|HashState|) (|SingleInteger|) (|InputForm|)
              (|Matrix| 9) (|Record| (|:| |mat| 48) (|:| |vec| 24))
              (|Union| 9 '#1#))
           '#(~= 29 |zero?| 35 |unitVector| 40 |swap!| 45 |sup| 52
              |subtractIfCan| 58 |smaller?| 64 |size?| 70 |size| 76 |setelt!|
              80 |sample| 87 |rightRecip| 91 |rightPower| 96 |retractIfCan| 108
              |retract| 123 |reducedSystem| 138 |recip| 160 |random| 165
              |qsetelt!| 169 |qelt| 176 |plenaryPower| 182 |parts| 188
              |opposite?| 193 |one?| 199 |more?| 204 |minIndex| 210 |min| 215
              |members| 226 |member?| 231 |maxIndex| 237 |max| 242 |map!| 259
              |map| 265 |lookup| 271 |less?| 276 |leftRecip| 282 |leftPower|
              287 |latex| 299 |inf| 304 |indices| 310 |index?| 315 |index| 321
              |hashUpdate!| 326 |hash| 332 |first| 337 |fill!| 342 |every?| 348
              |eval| 354 |eq?| 380 |enumerate| 386 |entry?| 390 |entries| 396
              |empty?| 401 |empty| 406 |elt| 410 |dot| 423 |directProduct| 429
              |differentiate| 434 |count| 484 |copy| 496 |convert| 501
              |commutator| 506 |coerce| 512 |characteristic| 542 |associator|
              546 |any?| 553 |antiCommutator| 559 |annihilate?| 565 ^ 571
              |Zero| 583 |One| 587 D 591 >= 641 > 647 = 653 <= 659 < 665 - 671
              + 682 * 688 |#| 742)
           'NIL
           (CONS
            (|makeByteWordVec2| 49
                                '(0 8 6 15 14 6 6 17 17 6 6 8 8 6 6 7 34 8 10
                                  10 8 1 17 34 13 10 10 7 1 0 0 0 43 2 48 9 8 2
                                  49 16 26 11 9 4 0 18 26 12 0 0 47 46 18 11 6
                                  45 0 0 0 47 46 18 11 6 5 3 45 0 0 0 0 0 0))
            (CONS
             '#(|DirectProductCategory&| |DifferentialExtension&| NIL
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&|
                |Algebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |NonAssociativeRing&|
                NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| NIL |Finite&| |MagmaWithUnit&|
                |OrderedSet&| |IndexedAggregate&| |FullyRetractableTo&|
                |Magma&| NIL |AbelianSemiGroup&| |HomogeneousAggregate&|
                |RetractableTo&| |RetractableTo&| |RetractableTo&| |Hashable&|
                NIL |Evalable&| |EltableAggregate&| |SetCategory&| |Aggregate&|
                NIL NIL NIL NIL NIL NIL |PartialOrder&| |InnerEvalable&| NIL
                NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|DirectProductCategory| 6 9) (|DifferentialExtension| 9)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 34) (|Algebra| 9) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| 9)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 9) (|Module| 9) (|Module| $$)
                 (|SemiRng|) (|LinearlyExplicitOver| 11)
                 (|LinearlyExplicitOver| 9) (|BiModule| 9 9) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedAbelianMonoidSup|)
                 (|NonAssociativeRng|) (|RightModule| 11) (|RightModule| 9)
                 (|LeftModule| 9) (|LeftModule| $$) (|RightModule| $$)
                 (|OrderedCancellationAbelianMonoid|)
                 (|AbelianProductCategory| 9) (|LeftModule| 7) (|LeftModule| 8)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|CancellationAbelianMonoid|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|OrderedAbelianSemiGroup|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|Finite|) (|MagmaWithUnit|) (|OrderedSet|)
                 (|IndexedAggregate| 11 9) (|FullyRetractableTo| 9) (|Magma|)
                 (|Comparable|) (|AbelianSemiGroup|) (|HomogeneousAggregate| 9)
                 (|RetractableTo| 11) (|RetractableTo| 37) (|RetractableTo| 9)
                 (|Hashable|) (|CommutativeStar|) (|Evalable| 9)
                 (|EltableAggregate| 11 9) (|SetCategory|) (|Aggregate|)
                 (|CoercibleFrom| 11) (|CoercibleFrom| 37) (|CoercibleFrom| 9)
                 (|ConvertibleTo| 47) (|TwoSidedRecip|) (|unitsKnown|)
                 (|PartialOrder|) (|InnerEvalable| 9 9) (|Eltable| 11 9)
                 (|CoercibleTo| (|Vector| 9)) (|finiteAggregate|) (|BasicType|)
                 (|CoercibleTo| 26) (|Type|))
              (|makeByteWordVec2| 56
                                  '(2 0 9 0 11 12 2 9 0 7 0 13 3 8 7 0 11 11 15
                                    2 9 0 0 0 16 0 9 0 17 2 0 19 0 0 1 1 54 19
                                    0 1 1 37 0 25 1 3 53 43 0 11 11 1 2 1 0 0 0
                                    1 2 55 40 0 0 1 2 22 19 0 0 1 2 0 19 0 20 1
                                    0 11 20 1 3 53 9 0 11 9 1 0 0 0 1 1 9 40 0
                                    1 2 9 0 0 20 1 2 25 0 0 25 1 1 29 38 0 1 1
                                    27 39 0 1 1 18 50 0 1 1 29 37 0 1 1 27 11 0
                                    1 1 18 9 0 1 2 33 30 31 32 1 1 33 33 31 1 1
                                    8 48 31 1 2 8 49 31 32 1 1 9 40 0 1 0 11 0
                                    1 3 53 9 0 11 9 1 2 0 9 0 11 1 2 6 0 0 25 1
                                    1 50 22 0 1 2 54 19 0 0 1 1 9 19 0 1 2 0 19
                                    0 20 1 1 21 11 0 1 1 51 9 0 1 2 3 0 0 0 1 1
                                    50 22 0 1 2 52 19 9 0 1 1 21 11 0 1 1 51 9
                                    0 1 2 50 9 42 0 1 2 3 0 0 0 1 2 53 0 21 0 1
                                    2 0 0 21 0 1 1 11 25 0 1 2 0 19 0 20 1 1 9
                                    40 0 1 2 9 0 0 20 1 2 25 0 0 25 1 1 0 27 0
                                    1 2 1 0 0 0 1 1 0 23 0 1 2 0 19 11 0 1 1 11
                                    0 25 1 2 11 45 45 0 1 1 11 46 0 1 1 21 9 0
                                    1 2 53 0 0 9 1 2 50 19 41 0 1 2 19 0 0 28 1
                                    3 19 0 0 9 9 1 2 19 0 0 29 1 3 19 0 0 22 22
                                    1 2 0 19 0 0 1 0 11 44 1 2 52 19 9 0 1 1 0
                                    22 0 1 1 0 19 0 1 0 0 0 1 2 0 9 0 11 12 3 0
                                    9 0 11 9 1 2 38 9 0 0 1 1 0 0 24 1 1 23 0 0
                                    1 2 23 0 0 20 1 2 24 0 0 34 1 3 24 0 0 34
                                    20 1 2 24 0 0 35 1 3 24 0 0 35 36 1 3 8 0 0
                                    21 20 1 2 8 0 0 21 1 2 52 20 9 0 1 2 50 20
                                    41 0 1 1 0 0 0 1 1 11 47 0 1 2 8 0 0 0 1 1
                                    0 24 0 1 1 0 26 0 1 1 29 0 37 1 1 28 0 11 1
                                    1 6 0 0 1 1 18 0 9 1 0 8 20 1 3 8 0 0 0 0 1
                                    2 50 19 41 0 1 2 7 0 0 0 1 2 8 19 0 0 1 2 9
                                    0 0 20 1 2 25 0 0 25 1 0 54 0 1 0 9 0 1 1
                                    23 0 0 1 2 23 0 0 20 1 2 24 0 0 34 1 3 24 0
                                    0 34 20 1 2 24 0 0 35 1 3 24 0 0 35 36 1 3
                                    8 0 0 21 20 1 2 8 0 0 21 1 2 3 19 0 0 1 2 3
                                    19 0 0 1 2 0 19 0 0 1 2 3 19 0 0 1 2 3 19 0
                                    0 1 1 56 0 0 1 2 56 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 7 0 14 2 0 0 25 0 1 2 0 0 8 0 18 2 33 0 0
                                    11 1 2 56 0 11 0 1 2 54 0 20 0 1 2 25 0 9 0
                                    1 2 25 0 0 9 1 2 25 0 0 0 1 1 50 20 0
                                    1)))))
           '|lookupComplete|)) 
