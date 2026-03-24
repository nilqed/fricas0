
(SDEFUN |FSERIES;One;%;1| ((% (%)))
        (LIST
         (CONS (SPADCALL (|spadConstant| % 12) (QREFELT % 14))
               (|spadConstant| % 15)))) 

(SDEFUN |FSERIES;coerce;Fc%;2| ((|e| (|FourierComponent| E)) (% (%)))
        (SPROG ((#1=#:G22 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |e| (QREFELT % 18))
                    (COND
                     ((SPADCALL (SPADCALL |e| (QREFELT % 19)) (QREFELT % 20))
                      (EXIT (|spadConstant| % 10))))))
                  (COND
                   ((SPADCALL (SPADCALL |e| (QREFELT % 19))
                              (|spadConstant| % 12) (QREFELT % 21))
                    (COND
                     ((NULL (SPADCALL |e| (QREFELT % 18)))
                      (LETT |e|
                            (SPADCALL
                             (SPADCALL (SPADCALL |e| (QREFELT % 19))
                                       (QREFELT % 22))
                             (QREFELT % 14))))
                     ('T
                      (PROGN
                       (LETT #1#
                             (LIST
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |e| (QREFELT % 19))
                                          (QREFELT % 22))
                                (QREFELT % 23))
                               (SPADCALL (|spadConstant| % 15)
                                         (QREFELT % 24)))))
                       (GO #2=#:G21))))))
                  (EXIT (LIST (CONS |e| (|spadConstant| % 15))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSERIES;multiply| ((|t1| (|Term|)) (|t2| (|Term|)) (% (%)))
        (SPROG ((|diff| (E)) (|sum| (E)) (|s2| (E)) (|s1| (E)) (|r| (R)))
               (SEQ
                (LETT |r|
                      (SPADCALL
                       (SPADCALL (QCDR |t1|) (QCDR |t2|) (QREFELT % 27))
                       (SPADCALL 1 2 (QREFELT % 30)) (QREFELT % 31)))
                (LETT |s1| (SPADCALL (QCAR |t1|) (QREFELT % 19)))
                (LETT |s2| (SPADCALL (QCAR |t2|) (QREFELT % 19)))
                (LETT |sum| (SPADCALL |s1| |s2| (QREFELT % 32)))
                (LETT |diff| (SPADCALL |s1| |s2| (QREFELT % 33)))
                (EXIT
                 (COND
                  ((SPADCALL (QCAR |t1|) (QREFELT % 18))
                   (COND
                    ((SPADCALL (QCAR |t2|) (QREFELT % 18))
                     (SPADCALL (SPADCALL |diff| |r| (QREFELT % 34))
                               (SPADCALL |sum| (SPADCALL |r| (QREFELT % 24))
                                         (QREFELT % 34))
                               (QREFELT % 35)))
                    (#1='T
                     (SPADCALL (SPADCALL |sum| |r| (QREFELT % 36))
                               (SPADCALL |diff| |r| (QREFELT % 36))
                               (QREFELT % 35)))))
                  ((SPADCALL (QCAR |t2|) (QREFELT % 18))
                   (SPADCALL (SPADCALL |sum| |r| (QREFELT % 36))
                             (SPADCALL |diff| |r| (QREFELT % 36))
                             (QREFELT % 37)))
                  (#1#
                   (SPADCALL (SPADCALL |diff| |r| (QREFELT % 34))
                             (SPADCALL |sum| |r| (QREFELT % 34))
                             (QREFELT % 35)))))))) 

(SDEFUN |FSERIES;*;3%;4| ((|x1| (%)) (|x2| (%)) (% (%)))
        (SPROG
         ((#1=#:G28 NIL) (#2=#:G27 (%)) (#3=#:G29 (%)) (#4=#:G31 NIL)
          (#5=#:G30 (%)) (#6=#:G32 (%)) (#7=#:G37 NIL) (|t2| NIL)
          (#8=#:G36 NIL) (|t1| NIL))
         (SEQ
          (COND ((OR (NULL |x1|) (NULL |x2|)) (|spadConstant| % 10))
                ('T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |t1| NIL) (LETT #8# |x1|) G190
                       (COND
                        ((OR (ATOM #8#) (PROGN (LETT |t1| (CAR #8#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (PROGN
                                 (LETT #4# NIL)
                                 (SEQ (LETT |t2| NIL) (LETT #7# |x2|) G190
                                      (COND
                                       ((OR (ATOM #7#)
                                            (PROGN (LETT |t2| (CAR #7#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #6#
                                               (|FSERIES;multiply| |t1| |t2|
                                                %))
                                         (COND
                                          (#4#
                                           (LETT #5#
                                                 (SPADCALL #5# #6#
                                                           (QREFELT % 35))))
                                          ('T
                                           (PROGN
                                            (LETT #5# #6#)
                                            (LETT #4# 'T)))))))
                                      (LETT #7# (CDR #7#)) (GO G190) G191
                                      (EXIT NIL))
                                 (COND (#4# #5#) ('T (|spadConstant| % 10)))))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 35))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) ('T (|spadConstant| % 10))))))))) 

(SDEFUN |FSERIES;makeCos;ER%;5| ((|a| (E)) (|r| (R)) (% (%)))
        (COND
         ((SPADCALL |a| (|spadConstant| % 12) (QREFELT % 21))
          (LIST
           (CONS (SPADCALL (SPADCALL |a| (QREFELT % 22)) (QREFELT % 14)) |r|)))
         ('T (LIST (CONS (SPADCALL |a| (QREFELT % 14)) |r|))))) 

(SDEFUN |FSERIES;makeSin;ER%;6| ((|a| (E)) (|r| (R)) (% (%)))
        (COND ((SPADCALL |a| (QREFELT % 20)) NIL)
              ((SPADCALL |a| (|spadConstant| % 12) (QREFELT % 21))
               (LIST
                (CONS (SPADCALL (SPADCALL |a| (QREFELT % 22)) (QREFELT % 23))
                      (SPADCALL |r| (QREFELT % 24)))))
              ('T (LIST (CONS (SPADCALL |a| (QREFELT % 23)) |r|))))) 

(DECLAIM (NOTINLINE |FourierSeries;|)) 

(DEFUN |FourierSeries;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FourierSeries| DV$1 DV$2))
          (LETT % (GETREFV 44))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|Canonical|))
                                               (|HasCategory| |#2|
                                                              '(|Canonical|)))))))
          (|haddProp| |$ConstructorCache| '|FourierSeries| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8
                    (|Record| (|:| |k| (|FourierComponent| |#2|))
                              (|:| |c| |#1|)))
          (QSETREFV % 9 (|List| (QREFELT % 8)))
          %))) 

(DEFUN |FourierSeries| (&REST #1=#:G46)
  (SPROG NIL
         (PROG (#2=#:G47)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FourierSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FourierSeries;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FourierSeries|)))))))))) 

(MAKEPROP '|FourierSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 13) (|local| |#1|)
              (|local| |#2|) '|Term| '|Rep| (0 . |Zero|) (4 . |Zero|)
              (8 . |Zero|) (|FourierComponent| 7) (12 . |cos|) (17 . |One|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FSERIES;One;%;1|) %))
              (|Boolean|) (21 . |sin?|) (26 . |argument|) (31 . |zero?|)
              (36 . <) (42 . -) (47 . |sin|) (52 . -) (57 . -)
              |FSERIES;coerce;Fc%;2| (62 . *) (|Integer|) (|Fraction| 28)
              (68 . /) (74 . *) (80 . +) (86 . -) |FSERIES;makeCos;ER%;5|
              (92 . +) |FSERIES;makeSin;ER%;6| (98 . -) |FSERIES;*;3%;4|
              (|OutputForm|) (|String|) (|PositiveInteger|)
              (|Union| % '"failed") (|NonNegativeInteger|))
           '#(~= 104 |zero?| 110 |subtractIfCan| 115 |sample| 121 |rightRecip|
              125 |rightPower| 130 |recip| 142 |plenaryPower| 147 |opposite?|
              153 |one?| 159 |makeSin| 164 |makeCos| 170 |leftRecip| 176
              |leftPower| 181 |latex| 193 |commutator| 198 |coerce| 204
              |characteristic| 224 |associator| 228 |antiCommutator| 235
              |annihilate?| 241 ^ 247 |Zero| 259 |One| 263 = 267 - 273 + 284 *
              290)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 1 0 0 0))
            (CONS
             '#(|Algebra&| NIL NIL |NonAssociativeAlgebra&| |Rng&| NIL
                |Module&| NIL |NonAssociativeRing&| NIL NIL NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL NIL NIL
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |Magma&| |SetCategory&| NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|Algebra| 6) (|Ring|) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|Rng|) (|SemiRng|) (|Module| 6)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 6 6)
                 (|LeftModule| $$) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| 6) (|RightModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|) (|Magma|)
                 (|SetCategory|) (|Canonical|) (|CoercibleTo| 39) (|BasicType|)
                 (|unitsKnown|))
              (|makeByteWordVec2| 43
                                  '(0 0 0 10 0 6 0 11 0 7 0 12 1 13 0 7 14 0 6
                                    0 15 1 13 17 0 18 1 13 7 0 19 1 7 17 0 20 2
                                    7 17 0 0 21 1 7 0 0 22 1 13 0 7 23 1 6 0 0
                                    24 1 0 0 0 25 2 6 0 0 0 27 2 29 0 28 28 30
                                    2 6 0 0 29 31 2 7 0 0 0 32 2 7 0 0 0 33 2 0
                                    0 0 0 35 2 0 0 0 0 37 2 0 17 0 0 1 1 0 17 0
                                    1 2 0 42 0 0 1 0 0 0 1 1 0 42 0 1 2 0 0 0
                                    41 1 2 0 0 0 43 1 1 0 42 0 1 2 0 0 0 41 1 2
                                    0 17 0 0 1 1 0 17 0 1 2 0 0 7 6 36 2 0 0 7
                                    6 34 1 0 42 0 1 2 0 0 0 41 1 2 0 0 0 43 1 1
                                    0 40 0 1 2 0 0 0 0 1 1 0 39 0 1 1 0 0 28 1
                                    1 0 0 6 1 1 0 0 13 26 0 0 43 1 3 0 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 17 0 0 1 2 0 0 0 41 1 2 0
                                    0 0 43 1 0 0 0 10 0 0 0 16 2 0 17 0 0 1 2 0
                                    0 0 0 37 1 0 0 0 25 2 0 0 0 0 35 2 0 0 41 0
                                    1 2 0 0 0 0 38 2 0 0 28 0 1 2 0 0 43 0 1 2
                                    0 0 6 0 1 2 0 0 0 6 1)))))
           '|lookupComplete|)) 
