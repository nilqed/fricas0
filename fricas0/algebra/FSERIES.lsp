
(SDEFUN |FSERIES;One;$;1| (($ $))
        (LIST
         (CONS (SPADCALL (|spadConstant| $ 12) (QREFELT $ 14))
               (|spadConstant| $ 15)))) 

(SDEFUN |FSERIES;coerce;Fc$;2| ((|e| |FourierComponent| E) ($ $))
        (SPROG ((#1=#:G714 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |e| (QREFELT $ 18))
                    (COND
                     ((SPADCALL (SPADCALL |e| (QREFELT $ 19)) (QREFELT $ 20))
                      (EXIT (|spadConstant| $ 10))))))
                  (COND
                   ((SPADCALL (SPADCALL |e| (QREFELT $ 19))
                              (|spadConstant| $ 12) (QREFELT $ 21))
                    (COND
                     ((NULL (SPADCALL |e| (QREFELT $ 18)))
                      (LETT |e|
                            (SPADCALL
                             (SPADCALL (SPADCALL |e| (QREFELT $ 19))
                                       (QREFELT $ 22))
                             (QREFELT $ 14))
                            . #2=(|FSERIES;coerce;Fc$;2|)))
                     ('T
                      (PROGN
                       (LETT #1#
                             (LIST
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |e| (QREFELT $ 19))
                                          (QREFELT $ 22))
                                (QREFELT $ 23))
                               (SPADCALL (|spadConstant| $ 15)
                                         (QREFELT $ 24))))
                             . #2#)
                       (GO #3=#:G713))))))
                  (EXIT (LIST (CONS |e| (|spadConstant| $ 15))))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSERIES;multiply| ((|t1| |Term|) (|t2| |Term|) ($ $))
        (SPROG ((|diff| (E)) (|sum| (E)) (|s2| (E)) (|s1| (E)) (|r| (R)))
               (SEQ
                (LETT |r|
                      (SPADCALL
                       (SPADCALL (QCDR |t1|) (QCDR |t2|) (QREFELT $ 26))
                       (SPADCALL 1 2 (QREFELT $ 29)) (QREFELT $ 30))
                      . #1=(|FSERIES;multiply|))
                (LETT |s1| (SPADCALL (QCAR |t1|) (QREFELT $ 19)) . #1#)
                (LETT |s2| (SPADCALL (QCAR |t2|) (QREFELT $ 19)) . #1#)
                (LETT |sum| (SPADCALL |s1| |s2| (QREFELT $ 31)) . #1#)
                (LETT |diff| (SPADCALL |s1| |s2| (QREFELT $ 32)) . #1#)
                (EXIT
                 (COND
                  ((SPADCALL (QCAR |t1|) (QREFELT $ 18))
                   (COND
                    ((SPADCALL (QCAR |t2|) (QREFELT $ 18))
                     (SPADCALL (SPADCALL |diff| |r| (QREFELT $ 33))
                               (SPADCALL |sum| (SPADCALL |r| (QREFELT $ 24))
                                         (QREFELT $ 33))
                               (QREFELT $ 34)))
                    (#2='T
                     (SPADCALL (SPADCALL |sum| |r| (QREFELT $ 35))
                               (SPADCALL |diff| |r| (QREFELT $ 35))
                               (QREFELT $ 34)))))
                  ((SPADCALL (QCAR |t2|) (QREFELT $ 18))
                   (SPADCALL (SPADCALL |sum| |r| (QREFELT $ 35))
                             (SPADCALL |diff| |r| (QREFELT $ 35))
                             (QREFELT $ 34)))
                  (#2#
                   (SPADCALL (SPADCALL |diff| |r| (QREFELT $ 33))
                             (SPADCALL |sum| |r| (QREFELT $ 33))
                             (QREFELT $ 34)))))))) 

(SDEFUN |FSERIES;*;3$;4| ((|x1| $) (|x2| $) ($ $))
        (SPROG
         ((#1=#:G723 NIL) (#2=#:G722 ($)) (#3=#:G724 ($)) (#4=#:G726 NIL)
          (#5=#:G725 ($)) (#6=#:G727 ($)) (#7=#:G730 NIL) (|t2| NIL)
          (#8=#:G729 NIL) (|t1| NIL))
         (SEQ
          (COND ((OR (NULL |x1|) (NULL |x2|)) (|spadConstant| $ 10))
                ('T
                 (PROGN
                  (LETT #1# NIL . #9=(|FSERIES;*;3$;4|))
                  (SEQ (LETT |t1| NIL . #9#) (LETT #8# |x1| . #9#) G190
                       (COND
                        ((OR (ATOM #8#)
                             (PROGN (LETT |t1| (CAR #8#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (PROGN
                                 (LETT #4# NIL . #9#)
                                 (SEQ (LETT |t2| NIL . #9#)
                                      (LETT #7# |x2| . #9#) G190
                                      (COND
                                       ((OR (ATOM #7#)
                                            (PROGN
                                             (LETT |t2| (CAR #7#) . #9#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #6#
                                               (|FSERIES;multiply| |t1| |t2| $)
                                               . #9#)
                                         (COND
                                          (#4#
                                           (LETT #5#
                                                 (SPADCALL #5# #6#
                                                           (QREFELT $ 34))
                                                 . #9#))
                                          ('T
                                           (PROGN
                                            (LETT #5# #6# . #9#)
                                            (LETT #4# 'T . #9#)))))))
                                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                                      (EXIT NIL))
                                 (COND (#4# #5#) ('T (|spadConstant| $ 10))))
                                . #9#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 34)) . #9#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #9#)
                             (LETT #1# 'T . #9#)))))))
                       (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) ('T (|spadConstant| $ 10))))))))) 

(SDEFUN |FSERIES;makeCos;ER$;5| ((|a| E) (|r| R) ($ $))
        (COND
         ((SPADCALL |a| (|spadConstant| $ 12) (QREFELT $ 21))
          (LIST
           (CONS (SPADCALL (SPADCALL |a| (QREFELT $ 22)) (QREFELT $ 14)) |r|)))
         ('T (LIST (CONS (SPADCALL |a| (QREFELT $ 14)) |r|))))) 

(SDEFUN |FSERIES;makeSin;ER$;6| ((|a| E) (|r| R) ($ $))
        (COND ((SPADCALL |a| (QREFELT $ 20)) NIL)
              ((SPADCALL |a| (|spadConstant| $ 12) (QREFELT $ 21))
               (LIST
                (CONS (SPADCALL (SPADCALL |a| (QREFELT $ 22)) (QREFELT $ 23))
                      (SPADCALL |r| (QREFELT $ 24)))))
              ('T (LIST (CONS (SPADCALL |a| (QREFELT $ 23)) |r|))))) 

(DECLAIM (NOTINLINE |FourierSeries;|)) 

(DEFUN |FourierSeries| (&REST #1=#:G738)
  (SPROG NIL
         (PROG (#2=#:G739)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FourierSeries|)
                                               '|domainEqualList|)
                    . #3=(|FourierSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FourierSeries;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FourierSeries|)))))))))) 

(DEFUN |FourierSeries;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FourierSeries|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FourierSeries| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 44) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|Canonical|))
                                               (|HasCategory| |#2|
                                                              '(|Canonical|)))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|FourierSeries| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record| (|:| |k| (|FourierComponent| |#2|))
                              (|:| |c| |#1|)))
          (QSETREFV $ 9 (|List| (QREFELT $ 8)))
          $))) 

(MAKEPROP '|FourierSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 13) (|local| |#1|)
              (|local| |#2|) '|Term| '|Rep| (0 . |Zero|) (4 . |Zero|)
              (8 . |Zero|) (|FourierComponent| 7) (12 . |cos|) (17 . |One|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FSERIES;One;$;1|) $))
              (|Boolean|) (21 . |sin?|) (26 . |argument|) (31 . |zero?|)
              (36 . <) (42 . -) (47 . |sin|) (52 . -) |FSERIES;coerce;Fc$;2|
              (57 . *) (|Integer|) (|Fraction| 27) (63 . /) (69 . *) (75 . +)
              (81 . -) |FSERIES;makeCos;ER$;5| (87 . +) |FSERIES;makeSin;ER$;6|
              |FSERIES;*;3$;4| (|NonNegativeInteger|) (|Union| $ '"failed")
              (|PositiveInteger|) (|HashState|) (|String|) (|OutputForm|)
              (|SingleInteger|))
           '#(~= 93 |zero?| 99 |subtractIfCan| 104 |sample| 110 |recip| 114
              |opposite?| 119 |one?| 125 |makeSin| 130 |makeCos| 136 |latex|
              142 |hashUpdate!| 147 |hash| 153 |coerce| 158 |characteristic|
              178 |annihilate?| 182 ^ 188 |Zero| 200 |One| 204 = 208 - 214 +
              225 * 231)
           'NIL
           (CONS
            (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1))
            (CONS
             '#(|Algebra&| |Module&| |Ring&| NIL |Rng&| NIL NIL NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |SetCategory&| NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|Algebra| 6) (|Module| 6) (|Ring|) (|BiModule| 6 6) (|Rng|)
                 (|RightModule| 6) (|LeftModule| 6) (|LeftModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 42) (|Canonical|))
              (|makeByteWordVec2| 43
                                  '(0 0 0 10 0 6 0 11 0 7 0 12 1 13 0 7 14 0 6
                                    0 15 1 13 17 0 18 1 13 7 0 19 1 7 17 0 20 2
                                    7 17 0 0 21 1 7 0 0 22 1 13 0 7 23 1 6 0 0
                                    24 2 6 0 0 0 26 2 28 0 27 27 29 2 6 0 0 28
                                    30 2 7 0 0 0 31 2 7 0 0 0 32 2 0 0 0 0 34 2
                                    0 17 0 0 1 1 0 17 0 1 2 0 38 0 0 1 0 0 0 1
                                    1 0 38 0 1 2 0 17 0 0 1 1 0 17 0 1 2 0 0 7
                                    6 35 2 0 0 7 6 33 1 0 41 0 1 2 0 40 40 0 1
                                    1 0 43 0 1 1 0 0 6 1 1 0 0 13 25 1 0 0 27 1
                                    1 0 42 0 1 0 0 37 1 2 0 17 0 0 1 2 0 0 0 37
                                    1 2 0 0 0 39 1 0 0 0 10 0 0 0 16 2 0 17 0 0
                                    1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 34 2 0 0
                                    0 6 1 2 0 0 6 0 1 2 0 0 27 0 1 2 0 0 0 0 36
                                    2 0 0 37 0 1 2 0 0 39 0 1)))))
           '|lookupComplete|)) 
