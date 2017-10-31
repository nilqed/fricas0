
(SDEFUN |DPMM;*;R2$;1| ((|r| R) (|x| $) ($ $))
        (SPROG ((#1=#:G696 NIL) (#2=#:G698 NIL) (|i| NIL) (#3=#:G697 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT $ 6)) . #5=(|DPMM;*;R2$;1|))
                 (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#)
                      (LETT #1# 0 . #5#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL |r| (SPADCALL |x| |i| (QREFELT $ 12))
                                          (QREFELT $ 13)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#)
                              (LETT |i| (|inc_SI| |i|) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(SDEFUN |DPMM;*;M2$;2| ((|m| M) (|x| $) ($ $))
        (SPROG
         ((#1=#:G700 NIL) (#2=#:G699 (S)) (#3=#:G701 (S)) (#4=#:G707 NIL)
          (|j| NIL) (#5=#:G704 NIL) (#6=#:G706 NIL) (|i| NIL) (#7=#:G705 NIL))
         (SEQ
          (PROGN
           (LETT #7# (GETREFV #8=(QREFELT $ 6)) . #9=(|DPMM;*;M2$;2|))
           (SEQ (LETT |i| 1 . #9#) (LETT #6# #8# . #9#) (LETT #5# 0 . #9#) G190
                (COND ((|greater_SI| |i| #6#) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT #7# #5#
                          (PROGN
                           (LETT #1# NIL . #9#)
                           (SEQ (LETT |j| 1 . #9#)
                                (LETT #4# (QREFELT $ 6) . #9#) G190
                                (COND ((|greater_SI| |j| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #3#
                                         (SPADCALL
                                          (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                          (SPADCALL |x| |j| (QREFELT $ 12))
                                          (QREFELT $ 13))
                                         . #9#)
                                   (COND
                                    (#1#
                                     (LETT #2#
                                           (SPADCALL #2# #3# (QREFELT $ 16))
                                           . #9#))
                                    ('T
                                     (PROGN
                                      (LETT #2# #3# . #9#)
                                      (LETT #1# 'T . #9#)))))))
                                (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#1# #2#) ('T (|spadConstant| $ 17)))))))
                (LETT #5#
                      (PROG1 (|inc_SI| #5#) (LETT |i| (|inc_SI| |i|) . #9#))
                      . #9#)
                (GO G190) G191 (EXIT NIL))
           #7#)))) 

(DECLAIM (NOTINLINE |DirectProductMatrixModule;|)) 

(DEFUN |DirectProductMatrixModule| (&REST #1=#:G739)
  (SPROG NIL
         (PROG (#2=#:G740)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DirectProductMatrixModule|)
                                               '|domainEqualList|)
                    . #3=(|DirectProductMatrixModule|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProductMatrixModule;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|DirectProductMatrixModule|)))))))))) 

(DEFUN |DirectProductMatrixModule;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G732 NIL) (#2=#:G733 NIL) (#3=#:G734 NIL) (#4=#:G735 NIL)
    (#5=#:G736 NIL) (#6=#:G737 NIL) (#7=#:G738 NIL) ($ NIL) (|dv$| NIL)
    (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #8=(|DirectProductMatrixModule|))
    (LETT DV$2 (|devaluate| |#2|) . #8#)
    (LETT DV$3 (|devaluate| |#3|) . #8#)
    (LETT DV$4 (|devaluate| |#4|) . #8#)
    (LETT |dv$| (LIST '|DirectProductMatrixModule| DV$1 DV$2 DV$3 DV$4) . #8#)
    (LETT $ (GETREFV 51) . #8#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#4| '(|Field|))
                                             (|HasCategory| |#4| '(|SemiRng|))
                                             (|HasCategory| |#4|
                                                            '(|OrderedAbelianMonoidSup|))
                                             (LETT #7#
                                                   (|HasCategory| |#4|
                                                                  '(|OrderedRing|))
                                                   . #8#)
                                             (OR
                                              (|HasCategory| |#4|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #7#)
                                             (|HasCategory| |#4| '(|Ring|))
                                             (|HasCategory| |#4| '(|Monoid|))
                                             (|HasCategory| |#4|
                                                            '(|unitsKnown|))
                                             (LETT #6#
                                                   (|HasCategory| |#4|
                                                                  '(|CommutativeRing|))
                                                   . #8#)
                                             (OR #6#
                                                 (|HasCategory| |#4|
                                                                '(|Field|))
                                                 (|HasCategory| |#4|
                                                                '(|SemiRng|)))
                                             (OR #6#
                                                 (|HasCategory| |#4|
                                                                '(|Field|)))
                                             (OR #6#
                                                 (|HasCategory| |#4|
                                                                '(|Ring|)))
                                             (LETT #5#
                                                   (|HasCategory| |#4|
                                                                  '(|Finite|))
                                                   . #8#)
                                             (OR #5#
                                                 (|HasCategory| |#4|
                                                                '(|OrderedAbelianMonoidSup|))
                                                 #7#)
                                             (OR (|HasCategory| |#4| '(|Ring|))
                                                 (|HasCategory| |#4|
                                                                '(|SemiRng|)))
                                             (|HasCategory| |#4|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#4|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (LETT #4#
                                                   (|HasCategory| |#4|
                                                                  '(|DifferentialRing|))
                                                   . #8#)
                                             (OR
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #6# #4# #7#
                                              (|HasCategory| |#4| '(|Ring|)))
                                             (|HasCategory| |#4|
                                                            '(|SetCategory|))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#4|
                                                              '(|SemiRng|)))
                                              (|HasCategory| |#4|
                                                             '(|CancellationAbelianMonoid|))
                                              #6# #4# #7#
                                              (|HasCategory| |#4| '(|Ring|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#4|
                                                              '(|SemiRng|)))
                                              #6# #4# #7#
                                              (|HasCategory| |#4| '(|Ring|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|))
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#3|
                                                             '(|AbelianMonoid|))
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#4|
                                                              '(|SemiRng|)))
                                              (|HasCategory| |#4|
                                                             '(|AbelianMonoid|))
                                              (|HasCategory| |#4|
                                                             '(|CancellationAbelianMonoid|))
                                              #6# #4# #7#
                                              (|HasCategory| |#4| '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#4|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#4|)))
                                              (|HasCategory| |#4|
                                                             '(|SetCategory|)))
                                             (|HasCategory| |#4|
                                                            '(|BasicType|))
                                             (|HasCategory| (|Integer|)
                                                            '(|OrderedSet|))
                                             (AND
                                              (|HasCategory| |#4|
                                                             '(|AbelianMonoid|))
                                              (|HasCategory| |#4| '(|Monoid|)))
                                             (AND
                                              (|HasCategory| |#4|
                                                             '(|AbelianMonoid|))
                                              (|HasCategory| |#4|
                                                             '(|SemiRng|)))
                                             (AND
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#4| '(|Ring|)))
                                             (AND #4#
                                                  (|HasCategory| |#4|
                                                                 '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#4| '(|Ring|)))
                                             (LETT #3#
                                                   (|HasCategory| |#4|
                                                                  '(|SemiGroup|))
                                                   . #8#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|))))
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
                                               (|HasCategory| |#4|
                                                              '(|CancellationAbelianMonoid|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4|
                                                              '(|Monoid|)))
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
                                               #7#)
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
                                               #3#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4|
                                                              '(|SetCategory|))))
                                             (OR
                                              (|HasCategory| |#4| '(|Monoid|))
                                              #3#)
                                             (LETT #2#
                                                   (AND
                                                    (|HasCategory| |#4|
                                                                   '(|RetractableTo|
                                                                     (|Integer|)))
                                                    (|HasCategory| |#4|
                                                                   '(|SetCategory|)))
                                                   . #8#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|))))
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
                                               (|HasCategory| |#4|
                                                              '(|CancellationAbelianMonoid|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#4| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#4|
                                                              '(|Monoid|)))
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
                                               #7#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#4| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #3#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#4|
                                                              '(|SemiRng|)))
                                              #2#)
                                             (OR #2#
                                                 (|HasCategory| |#4|
                                                                '(|Ring|)))
                                             (LETT #1#
                                                   (AND
                                                    (|HasCategory| |#4|
                                                                   '(|RetractableTo|
                                                                     (|Fraction|
                                                                      (|Integer|))))
                                                    (|HasCategory| |#4|
                                                                   '(|SetCategory|)))
                                                   . #8#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|)))))
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
                                               (|HasCategory| |#4|
                                                              '(|CancellationAbelianMonoid|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#4| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#4|
                                                              '(|Monoid|)))
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
                                               #7#)
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
                                               #3#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#4|
                                                              '(|SemiRng|)))
                                              #1#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|))
                                              (|HasCategory| |#3|
                                                             '(|AbelianMonoid|))
                                              (|HasCategory| |#4|
                                                             '(|AbelianMonoid|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#4| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#4|
                                                              '(|SemiRng|)))
                                              (|HasCategory| |#4|
                                                             '(|CancellationAbelianMonoid|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#4| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#4|
                                                              '(|SemiRng|)))
                                              (|HasCategory| |#4| '(|Ring|)))))
                    . #8#))
    (|haddProp| |$ConstructorCache| '|DirectProductMatrixModule|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 4398046511104))
    (AND (|HasCategory| |#4| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 8796093022208))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 17592186044416))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (|Vector| |#4|))
    $))) 

(MAKEPROP '|DirectProductMatrixModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 6 9) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) '|Rep| (|Integer|)
              (0 . |elt|) (6 . *) |DPMM;*;R2$;1| (12 . |elt|) (19 . +)
              (25 . |Zero|) |DPMM;*;M2$;2| (|Boolean|) (|NonNegativeInteger|)
              (|PositiveInteger|) (|List| 9) (|Equation| 9) (|List| 23)
              (|Record| (|:| |mat| 28) (|:| |vec| (|Vector| 11))) (|Matrix| $)
              (|Vector| $) (|Matrix| 11) (|Symbol|) (|List| 29) (|List| 20)
              (|Union| 33 '#1="failed") (|Fraction| 11) (|Union| 11 '#1#)
              (|Union| $ '"failed") (|Mapping| 19 9) (|Void|) (|Mapping| 9 9)
              (|CardinalNumber|) (|InputForm|) (|List| $) (|Matrix| 9)
              (|Record| (|:| |mat| 42) (|:| |vec| 49)) (|Union| 9 '#1#)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|)
              (|Vector| 9) (|List| 11))
           '#(|elt| 29 * 35) 'NIL
           (CONS
            (|makeByteWordVec2| 39
                                '(0 1 4 9 6 6 11 4 9 6 16 17 18 10 3 4 9 19 0 0
                                  10 2 5 12 9 19 5 22 5 6 21 0 5 7 13 15 23 0 0
                                  14 34 0 0 0 33 20 0 0 0 0 0 0 33 5 8 9 13 20
                                  39 36))
            (CONS
             '#(|DirectProductCategory&| |VectorSpace&| |OrderedRing&|
                |Algebra&| |FullyLinearlyExplicitOver&|
                |DifferentialExtension&| |Module&| NIL NIL NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL NIL |Rng&| NIL |AbelianGroup&|
                NIL NIL NIL |IndexedAggregate&| |OrderedSet&| |Monoid&|
                |Finite&| NIL |AbelianMonoid&| |HomogeneousAggregate&|
                |AbelianSemiGroup&| NIL |SemiGroup&| |Aggregate&|
                |SetCategory&| |EltableAggregate&| |Evalable&|
                |FullyRetractableTo&| NIL NIL |BasicType&| NIL NIL NIL
                |InnerEvalable&| |PartialOrder&| NIL NIL NIL |RetractableTo&|
                |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 9) (|VectorSpace| 9)
                 (|OrderedRing|) (|Algebra| 9) (|FullyLinearlyExplicitOver| 9)
                 (|DifferentialExtension| 9) (|Module| 9)
                 (|CharacteristicZero|) (|CommutativeRing|)
                 (|LinearlyExplicitOver| 9) (|LinearlyExplicitOver| 11)
                 (|PartialDifferentialRing| 29) (|DifferentialRing|)
                 (|BiModule| 9 9) (|OrderedAbelianMonoidSup|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| 8) (|LeftModule| 7) (|LeftModule| 9)
                 (|RightModule| 9) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|RightModule| $$) (|Rng|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|IndexedAggregate| 11 9)
                 (|OrderedSet|) (|Monoid|) (|Finite|) (|SemiRng|)
                 (|AbelianMonoid|) (|HomogeneousAggregate| 9)
                 (|AbelianSemiGroup|) (|Comparable|) (|SemiGroup|)
                 (|Aggregate|) (|SetCategory|) (|EltableAggregate| 11 9)
                 (|Evalable| 9) (|FullyRetractableTo| 9) (|Type|)
                 (|CoercibleTo| 45) (|BasicType|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 9)) (|Eltable| 11 9)
                 (|InnerEvalable| 9 9) (|PartialOrder|) (|unitsKnown|)
                 (|CommutativeStar|) (|ConvertibleTo| 40) (|RetractableTo| 9)
                 (|RetractableTo| 33) (|RetractableTo| 11))
              (|makeByteWordVec2| 18
                                  '(2 0 9 0 11 12 2 9 0 7 0 13 3 8 7 0 11 11 15
                                    2 9 0 0 0 16 0 9 0 17 2 0 9 0 11 12 2 0 0 8
                                    0 18 2 0 0 7 0 14)))))
           '|lookupIncomplete|)) 
