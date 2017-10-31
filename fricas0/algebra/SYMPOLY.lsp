
(SDEFUN |SYMPOLY;*;3$;1| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((#1=#:G706 NIL) (#2=#:G705 ($)) (#3=#:G707 ($)) (#4=#:G713 NIL)
          (|t2| NIL) (#5=#:G712 NIL) (#6=#:G711 NIL) (|t1| NIL))
         (SEQ
          (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| $ 9))
                ('T
                 (COND
                  ((SPADCALL (QCAR (|SPADfirst| |p1|)) (QREFELT $ 12))
                   (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT $ 13)))
                  ((SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 16)) |p1|)
                  (#7='T
                   (PROGN
                    (LETT #1# NIL . #8=(|SYMPOLY;*;3$;1|))
                    (SEQ (LETT |t1| NIL . #8#) (LETT #6# (REVERSE |p1|) . #8#)
                         G190
                         (COND
                          ((OR (ATOM #6#)
                               (PROGN (LETT |t1| (CAR #6#) . #8#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #3#
                                  (PROGN
                                   (LETT #5# NIL . #8#)
                                   (SEQ (LETT |t2| NIL . #8#)
                                        (LETT #4# |p2| . #8#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |t2| (CAR #4#) . #8#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (CONS
                                                  (SPADCALL (QCAR |t1|)
                                                            (QCAR |t2|)
                                                            (QREFELT $ 17))
                                                  (SPADCALL (QCDR |t1|)
                                                            (QCDR |t2|)
                                                            (QREFELT $ 18)))
                                                 #5#)
                                                . #8#)))
                                        (LETT #4# (CDR #4#) . #8#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  . #8#)
                            (COND
                             (#1#
                              (LETT #2# (SPADCALL #2# #3# (QREFELT $ 19))
                                    . #8#))
                             ('T
                              (PROGN
                               (LETT #2# #3# . #8#)
                               (LETT #1# 'T . #8#)))))))
                         (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                    (COND (#1# #2#) (#7# (|spadConstant| $ 9))))))))))) 

(SDEFUN |SYMPOLY;*;3$;2| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((#1=#:G715 NIL) (#2=#:G714 ($)) (#3=#:G716 ($)) (|r| (R))
          (#4=#:G725 NIL) (|t2| NIL) (#5=#:G724 NIL) (#6=#:G723 NIL)
          (|t1| NIL))
         (SEQ
          (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| $ 9))
                ('T
                 (COND
                  ((SPADCALL (QCAR (|SPADfirst| |p1|)) (QREFELT $ 12))
                   (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT $ 13)))
                  ((SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 16)) |p1|)
                  (#7='T
                   (PROGN
                    (LETT #1# NIL . #8=(|SYMPOLY;*;3$;2|))
                    (SEQ (LETT |t1| NIL . #8#) (LETT #6# (REVERSE |p1|) . #8#)
                         G190
                         (COND
                          ((OR (ATOM #6#)
                               (PROGN (LETT |t1| (CAR #6#) . #8#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #3#
                                  (PROGN
                                   (LETT #5# NIL . #8#)
                                   (SEQ (LETT |t2| NIL . #8#)
                                        (LETT #4# |p2| . #8#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |t2| (CAR #4#) . #8#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL
                                             (LETT |r|
                                                   (SPADCALL (QCDR |t1|)
                                                             (QCDR |t2|)
                                                             (QREFELT $ 18))
                                                   . #8#)
                                             (|spadConstant| $ 21)
                                             (QREFELT $ 22))
                                            (LETT #5#
                                                  (CONS
                                                   (CONS
                                                    (SPADCALL (QCAR |t1|)
                                                              (QCAR |t2|)
                                                              (QREFELT $ 17))
                                                    |r|)
                                                   #5#)
                                                  . #8#)))))
                                        (LETT #4# (CDR #4#) . #8#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  . #8#)
                            (COND
                             (#1#
                              (LETT #2# (SPADCALL #2# #3# (QREFELT $ 19))
                                    . #8#))
                             ('T
                              (PROGN
                               (LETT #2# #3# . #8#)
                               (LETT #1# 'T . #8#)))))))
                         (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                    (COND (#1# #2#) (#7# (|spadConstant| $ 9))))))))))) 

(DECLAIM (NOTINLINE |SymmetricPolynomial;|)) 

(DEFUN |SymmetricPolynomial| (#1=#:G747)
  (SPROG NIL
         (PROG (#2=#:G748)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SymmetricPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|SymmetricPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SymmetricPolynomial;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SymmetricPolynomial|)))))))))) 

(DEFUN |SymmetricPolynomial;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G742 NIL) (#2=#:G743 NIL) (#3=#:G744 NIL) (#4=#:G745 NIL)
    (#5=#:G746 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|SymmetricPolynomial|))
    (LETT |dv$| (LIST '|SymmetricPolynomial| DV$1) . #6#)
    (LETT $ (GETREFV 39) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #6#)
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#)
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|))
                                            #4#)
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3# #1# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#)))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|SymmetricPolynomial| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 67108864))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #4#)
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #4#)
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR #3# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR #2# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR #1# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 17179869184))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Record| (|:| |k| (|Partition|)) (|:| |c| |#1|)))
    (QSETREFV $ 8 (|List| (QREFELT $ 7)))
    (COND
     ((|testBitVector| |pv$| 7)
      (QSETREFV $ 20 (CONS (|dispatchFunction| |SYMPOLY;*;3$;1|) $)))
     ('T (QSETREFV $ 20 (CONS (|dispatchFunction| |SYMPOLY;*;3$;2|) $))))
    $))) 

(MAKEPROP '|SymmetricPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 11) (|local| |#1|)
              '|Term| '|Rep| (0 . |Zero|) (|Boolean|) (|Partition|)
              (4 . |zero?|) (9 . *) (15 . |One|) (19 . |One|) (23 . =) (29 . +)
              (35 . *) (41 . +) (47 . *) (53 . |Zero|) (57 . ~=) (|Integer|)
              (|NonNegativeInteger|) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 23) (|Union| 27 '#1="failed") (|Union| 23 '#1#)
              (|Mapping| 11 11) (|List| 6) (|Union| 6 '#1#) (|Mapping| 6 6)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(|Zero| 63 |One| 67 = 71 + 77 * 83) 'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 2 1 2 5 1 6 2 3 4 5 7 0 1 10 12 0 0 1 1
                                  10 11 13 22 24 8 0 26 8 0 0 16 0 0 0 0 0 0 6
                                  9 7 14 15 17))
            (CONS
             '#(|FiniteAbelianMonoidRing&| |AbelianMonoidRing&| NIL |Algebra&|
                |Algebra&| |Algebra&| |Module&| NIL |Module&| NIL NIL |Module&|
                |EntireRing&| NIL NIL |Ring&| NIL NIL NIL NIL NIL |Rng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&| |Monoid&|
                |AbelianSemiGroup&| |SemiGroup&| NIL |FullyRetractableTo&|
                |SetCategory&| NIL |RetractableTo&| |BasicType&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|FiniteAbelianMonoidRing| 6 11) (|AbelianMonoidRing| 6 11)
                 (|IntegralDomain|) (|Algebra| 27) (|Algebra| $$) (|Algebra| 6)
                 (|Module| 27) (|CommutativeRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|BiModule| 6 6) (|BiModule| 27 27) (|Ring|)
                 (|BiModule| $$ $$) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 27) (|RightModule| 27) (|Rng|) (|LeftModule| $$)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|SemiRng|)
                 (|AbelianMonoid|) (|Monoid|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|Comparable|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 6) (|BasicType|) (|CoercibleTo| 38)
                 (|CommutativeStar|) (|unitsKnown|) (|noZeroDivisors|)
                 (|RetractableTo| 27) (|RetractableTo| 23)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 35
                                  '(0 0 0 9 1 11 10 0 12 2 0 0 6 0 13 0 0 0 14
                                    0 6 0 15 2 0 10 0 0 16 2 11 0 0 0 17 2 6 0
                                    0 0 18 2 0 0 0 0 19 2 0 0 0 0 20 0 6 0 21 2
                                    6 10 0 0 22 0 35 0 9 0 31 0 14 2 0 10 0 0
                                    16 2 0 0 0 0 19 2 0 0 6 0 13 2 0 0 0 0
                                    20)))))
           '|lookupIncomplete|)) 
