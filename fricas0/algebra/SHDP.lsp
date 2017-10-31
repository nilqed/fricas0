
(SDEFUN |SHDP;lessThanRlex|
        ((|v1| $) (|v2| $) (|low| |NonNegativeInteger|)
         (|high| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG
         ((#1=#:G706 NIL) (#2=#:G708 NIL) (|i| NIL) (|n2| (S)) (|n1| (S))
          (#3=#:G707 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n1| (|spadConstant| $ 10) . #4=(|SHDP;lessThanRlex|))
                (LETT |n2| (|spadConstant| $ 10) . #4#)
                (SEQ (LETT |i| |low| . #4#) (LETT #3# |high| . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (LETT |n1|
                            (SPADCALL |n1| (SPADCALL |v1| |i| (QREFELT $ 12))
                                      (QREFELT $ 13))
                            . #4#)
                      (EXIT
                       (LETT |n2|
                             (SPADCALL |n2| (SPADCALL |v2| |i| (QREFELT $ 12))
                                       (QREFELT $ 13))
                             . #4#)))
                     (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((SPADCALL |n1| |n2| (QREFELT $ 15)) 'T)
                       ((SPADCALL |n2| |n1| (QREFELT $ 15)) NIL)
                       ('T
                        (SEQ
                         (SEQ (LETT |i| |high| . #4#) (LETT #2# |low| . #4#)
                              G190 (COND ((< |i| #2#) (GO G191)))
                              (SEQ
                               (COND
                                ((SPADCALL (SPADCALL |v2| |i| (QREFELT $ 12))
                                           (SPADCALL |v1| |i| (QREFELT $ 12))
                                           (QREFELT $ 15))
                                 (PROGN (LETT #1# 'T . #4#) (GO #5=#:G705))))
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |v1| |i| (QREFELT $ 12))
                                            (SPADCALL |v2| |i| (QREFELT $ 12))
                                            (QREFELT $ 15))
                                  (PROGN (LETT #1# NIL . #4#) (GO #5#))))))
                              (LETT |i| (+ |i| -1) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT NIL)))))))
          #5# (EXIT #1#)))) 

(SDEFUN |SHDP;<;2$B;2| ((|v1| $) (|v2| $) ($ |Boolean|))
        (SPROG ((#1=#:G714 NIL) (#2=#:G715 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND ((|SHDP;lessThanRlex| |v1| |v2| 1 (QREFELT $ 7) $) 'T)
                       ('T
                        (SEQ
                         (SEQ (LETT |i| 1 . #3=(|SHDP;<;2$B;2|))
                              (LETT #2# (QREFELT $ 7) . #3#) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |v1| |i| (QREFELT $ 12))
                                            (SPADCALL |v2| |i| (QREFELT $ 12))
                                            (QREFELT $ 16))
                                  (PROGN
                                   (LETT #1# NIL . #3#)
                                   (GO #4=#:G713))))))
                              (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (|SHDP;lessThanRlex| |v1| |v2| (+ (QREFELT $ 7) 1)
                           (QREFELT $ 6) $))))))
                #4# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |SplitHomogeneousDirectProduct;|)) 

(DEFUN |SplitHomogeneousDirectProduct| (&REST #1=#:G748)
  (SPROG NIL
         (PROG (#2=#:G749)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SplitHomogeneousDirectProduct|)
                                               '|domainEqualList|)
                    . #3=(|SplitHomogeneousDirectProduct|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SplitHomogeneousDirectProduct;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SplitHomogeneousDirectProduct|)))))))))) 

(DEFUN |SplitHomogeneousDirectProduct;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G740 NIL) (#2=#:G741 NIL) (#3=#:G742 NIL) (#4=#:G743 NIL)
    (#5=#:G744 NIL) (#6=#:G745 NIL) (#7=#:G746 NIL) (#8=#:G747 NIL) ($ NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #9=(|SplitHomogeneousDirectProduct|))
    (LETT DV$2 (|devaluate| |#2|) . #9#)
    (LETT DV$3 (|devaluate| |#3|) . #9#)
    (LETT |dv$| (LIST '|SplitHomogeneousDirectProduct| DV$1 DV$2 DV$3) . #9#)
    (LETT $ (GETREFV 49) . #9#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#3| '(|Field|))
                                             (|HasCategory| |#3| '(|SemiRng|))
                                             (|HasCategory| |#3|
                                                            '(|OrderedAbelianMonoidSup|))
                                             (LETT #8#
                                                   (|HasCategory| |#3|
                                                                  '(|OrderedRing|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #8#)
                                             (|HasCategory| |#3| '(|Ring|))
                                             (|HasCategory| |#3| '(|Monoid|))
                                             (|HasCategory| |#3|
                                                            '(|unitsKnown|))
                                             (LETT #7#
                                                   (|HasCategory| |#3|
                                                                  '(|CommutativeRing|))
                                                   . #9#)
                                             (OR #7#
                                                 (|HasCategory| |#3|
                                                                '(|Field|))
                                                 (|HasCategory| |#3|
                                                                '(|SemiRng|)))
                                             (OR #7#
                                                 (|HasCategory| |#3|
                                                                '(|Field|)))
                                             (OR #7#
                                                 (|HasCategory| |#3|
                                                                '(|Ring|)))
                                             (LETT #6#
                                                   (|HasCategory| |#3|
                                                                  '(|Finite|))
                                                   . #9#)
                                             (OR #6#
                                                 (|HasCategory| |#3|
                                                                '(|OrderedAbelianMonoidSup|))
                                                 #8#)
                                             (OR (|HasCategory| |#3| '(|Ring|))
                                                 (|HasCategory| |#3|
                                                                '(|SemiRng|)))
                                             (|HasCategory| |#3|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#3|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (LETT #5#
                                                   (|HasCategory| |#3|
                                                                  '(|DifferentialRing|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|))
                                              #7# #5# #8#
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              #7# #5# #8#
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #7# #5# #8#
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (|HasCategory| |#3|
                                                            '(|SetCategory|))
                                             (AND
                                              (|HasCategory| |#3|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#3|)))
                                              (|HasCategory| |#3|
                                                             '(|SetCategory|)))
                                             (|HasCategory| |#3|
                                                            '(|BasicType|))
                                             (|HasCategory| (|Integer|)
                                                            '(|OrderedSet|))
                                             (AND
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (AND #5#
                                                  (|HasCategory| |#3|
                                                                 '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (LETT #4#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiGroup|))
                                                   . #9#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|))))
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
                                               (|HasCategory| |#3|
                                                              '(|CancellationAbelianMonoid|)))
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
                                               #5#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|Monoid|)))
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
                                               #8#)
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
                                               #4#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))))
                                             (OR
                                              (|HasCategory| |#3| '(|Monoid|))
                                              #4#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|)))
                                             (LETT #3#
                                                   (|HasCategory| |#3|
                                                                  '(|AbelianMonoid|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #3#
                                              (|HasCategory| |#3|
                                                             '(|BasicType|))
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|))
                                              #7# #5#
                                              (|HasCategory| |#3| '(|Field|))
                                              #6#
                                              (|HasCategory| |#3| '(|Monoid|))
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #8#
                                              (|HasCategory| |#3| '(|Ring|))
                                              #4#
                                              (|HasCategory| |#3| '(|SemiRng|))
                                              (|HasCategory| |#3|
                                                             '(|SetCategory|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #3#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|))
                                              #7# #5#
                                              (|HasCategory| |#3| '(|Field|))
                                              #6#
                                              (|HasCategory| |#3| '(|Monoid|))
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #8#
                                              (|HasCategory| |#3| '(|Ring|))
                                              #4#
                                              (|HasCategory| |#3| '(|SemiRng|))
                                              (|HasCategory| |#3|
                                                             '(|SetCategory|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #3#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|))
                                              #7# #5#
                                              (|HasCategory| |#3| '(|Field|))
                                              #8#
                                              (|HasCategory| |#3| '(|Ring|))
                                              (|HasCategory| |#3|
                                                             '(|SemiRng|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              #3#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|))
                                              #7# #5# #8#
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (AND #3#
                                                  (|HasCategory| |#3|
                                                                 '(|Monoid|)))
                                             (AND #3#
                                                  (|HasCategory| |#3|
                                                                 '(|SemiRng|)))
                                             (OR #3#
                                                 (|HasCategory| |#3|
                                                                '(|SemiRng|)))
                                             (|HasCategory| |#3|
                                                            '(|CoercibleTo|
                                                              (|OutputForm|)))
                                             (LETT #2#
                                                   (AND
                                                    (|HasCategory| |#3|
                                                                   '(|RetractableTo|
                                                                     (|Integer|)))
                                                    (|HasCategory| |#3|
                                                                   '(|SetCategory|)))
                                                   . #9#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|))))
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
                                               (|HasCategory| |#3|
                                                              '(|CancellationAbelianMonoid|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|Monoid|)))
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
                                               #8#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              #2#)
                                             (OR #2#
                                                 (|HasCategory| |#3|
                                                                '(|Ring|)))
                                             (LETT #1#
                                                   (AND
                                                    (|HasCategory| |#3|
                                                                   '(|RetractableTo|
                                                                     (|Fraction|
                                                                      (|Integer|))))
                                                    (|HasCategory| |#3|
                                                                   '(|SetCategory|)))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|)))
                                              #1# #2#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               #7#
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              (AND #3#
                                                   (|HasCategory| |#3|
                                                                  '(|Field|)))
                                              (AND #3#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiRng|))))
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|)))))
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
                                               (|HasCategory| |#3|
                                                              '(|CancellationAbelianMonoid|)))
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
                                               #5#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3|
                                                              '(|Monoid|)))
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
                                               #8#)
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
                                               #4#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              #1#)))
                    . #9#))
    (|haddProp| |$ConstructorCache| '|SplitHomogeneousDirectProduct|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 281474976710656))
    (AND (|HasCategory| |#3| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 562949953421312))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      (|HasCategory| |#3| '(|SetCategory|)))
     (|augmentPredVector| $ 2251799813685248))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|Vector| |#3|))
    $))) 

(MAKEPROP '|SplitHomogeneousDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 6 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (0 . |Zero|) (|Integer|)
              (4 . |qelt|) (10 . +) (|Boolean|) (16 . <) (22 . ~=)
              |SHDP;<;2$B;2| (|NonNegativeInteger|) (|PositiveInteger|)
              (|List| 8) (|Equation| 8) (|List| 21) (|Matrix| 11) (|Matrix| $)
              (|Record| (|:| |mat| 23) (|:| |vec| (|Vector| 11))) (|Vector| $)
              (|List| 29) (|List| 18) (|Symbol|) (|Union| 31 '#1="failed")
              (|Fraction| 11) (|Union| 11 '#1#) (|Union| $ '"failed")
              (|Mapping| 14 8) (|Void|) (|Mapping| 8 8) (|OutputForm|)
              (|CardinalNumber|) (|InputForm|) (|List| $)
              (|Record| (|:| |mat| 42) (|:| |vec| 47)) (|Matrix| 8)
              (|Union| 8 '#1#) (|HashState|) (|SingleInteger|) (|String|)
              (|Vector| 8) (|List| 11))
           '#(|qelt| 28 < 34) 'NIL
           (CONS
            (|makeByteWordVec2| 48
                                '(0 1 4 9 6 6 11 4 9 6 16 17 18 10 3 4 9 21 10
                                  2 5 12 9 21 5 20 5 6 19 0 5 7 13 15 38 0 14
                                  31 37 0 0 30 36 22 0 0 0 0 30 47 5 8 9 13 35
                                  22 48 44))
            (CONS
             '#(|DirectProductCategory&| |VectorSpace&| |OrderedRing&|
                |Algebra&| |FullyLinearlyExplicitOver&|
                |DifferentialExtension&| |Module&| NIL NIL NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL |Rng&| NIL |AbelianGroup&| NIL NIL
                NIL |IndexedAggregate&| |OrderedSet&| |Monoid&| |Finite&| NIL
                |AbelianMonoid&| |HomogeneousAggregate&| NIL |SemiGroup&|
                |AbelianSemiGroup&| |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| |FullyRetractableTo&| NIL NIL NIL
                NIL |InnerEvalable&| NIL |PartialOrder&| NIL NIL NIL
                |BasicType&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 8) (|VectorSpace| 8)
                 (|OrderedRing|) (|Algebra| 8) (|FullyLinearlyExplicitOver| 8)
                 (|DifferentialExtension| 8) (|Module| 8)
                 (|CharacteristicZero|) (|CommutativeRing|)
                 (|LinearlyExplicitOver| 8) (|LinearlyExplicitOver| 11)
                 (|PartialDifferentialRing| 29) (|DifferentialRing|)
                 (|BiModule| 8 8) (|OrderedAbelianMonoidSup|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| 8) (|RightModule| 8)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|RightModule| $$) (|Rng|) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|IndexedAggregate| 11 8)
                 (|OrderedSet|) (|Monoid|) (|Finite|) (|SemiRng|)
                 (|AbelianMonoid|) (|HomogeneousAggregate| 8) (|Comparable|)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Aggregate|)
                 (|EltableAggregate| 11 8) (|Evalable| 8) (|SetCategory|)
                 (|FullyRetractableTo| 8) (|Type|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 8)) (|Eltable| 11 8)
                 (|InnerEvalable| 8 8) (|CoercibleTo| 37) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 39)
                 (|BasicType|) (|RetractableTo| 8) (|RetractableTo| 31)
                 (|RetractableTo| 11))
              (|makeByteWordVec2| 17
                                  '(0 8 0 10 2 0 8 0 11 12 2 8 0 0 0 13 2 8 14
                                    0 0 15 2 8 14 0 0 16 2 0 8 0 11 12 2 5 14 0
                                    0 17)))))
           '|lookupIncomplete|)) 
