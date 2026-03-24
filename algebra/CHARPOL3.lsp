
(SDEFUN |CHARPOL3;char_pol_via_interpolation0|
        ((|m| (|Matrix| R)) (|ld| (|List| R))
         (% (|SparseUnivariatePolynomial| (|Fraction| R))))
        (SPROG
         ((#1=#:G10 NIL) (|j| NIL) (#2=#:G11 NIL) (|di| NIL)
          (|m1| (|SparseUnivariatePolynomial| (|Fraction| R)))
          (|res| (|SparseUnivariatePolynomial| (|Fraction| R)))
          (|cor| (|Fraction| R)) (|m1v| (|Fraction| R)) (|i_f| (|Fraction| R))
          (|d1| (R)) (#3=#:G9 NIL) (|i| NIL) (|v| (|SingletonAsOrderedSet|))
          (A1 (|Matrix| R)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANCOLS |m|))
              (EXIT
               (COND
                ((SPADCALL |n| (ANROWS |m|) (QREFELT % 9))
                 (|error| "matrix not square"))
                ('T
                 (SEQ (LETT A1 (SPADCALL |m| (QREFELT % 11)))
                      (LETT |res| (|spadConstant| % 13))
                      (LETT |m1| (|spadConstant| % 14))
                      (LETT |v| (SPADCALL (QREFELT % 16)))
                      (SEQ (LETT |i| 0) (LETT #3# |n|) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ (LETT |d1| (SPADCALL A1 (QREFELT % 17)))
                                (LETT |i_f|
                                      (SPADCALL (SPADCALL |i| (QREFELT % 19))
                                                (QREFELT % 21)))
                                (LETT |m1v|
                                      (SPADCALL
                                       (SPADCALL |m1| |v| |i_f| (QREFELT % 22))
                                       (QREFELT % 23)))
                                (LETT |cor|
                                      (SPADCALL (SPADCALL |d1| (QREFELT % 21))
                                                (SPADCALL
                                                 (SPADCALL |res| |v| |i_f|
                                                           (QREFELT % 22))
                                                 (QREFELT % 23))
                                                (QREFELT % 24)))
                                (LETT |res|
                                      (SPADCALL |res|
                                                (SPADCALL
                                                 (SPADCALL |cor| |m1v|
                                                           (QREFELT % 25))
                                                 |m1| (QREFELT % 26))
                                                (QREFELT % 27)))
                                (LETT |m1|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 29) 1
                                                  (QREFELT % 30))
                                        (SPADCALL |i_f| (QREFELT % 31))
                                        (QREFELT % 32))
                                       |m1| (QREFELT % 33)))
                                (EXIT
                                 (SEQ (LETT |di| NIL) (LETT #2# |ld|)
                                      (LETT |j| 1) (LETT #1# |n|) G190
                                      (COND
                                       ((OR (|greater_SI| |j| #1#) (ATOM #2#)
                                            (PROGN (LETT |di| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL A1 |j| |j|
                                                  (SPADCALL
                                                   (SPADCALL A1 |j| |j|
                                                             (QREFELT % 34))
                                                   |di| (QREFELT % 35))
                                                  (QREFELT % 36))))
                                      (LETT |j|
                                            (PROG1 (|inc_SI| |j|)
                                              (LETT #2# (CDR #2#))))
                                      (GO G190) G191 (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |CHARPOL3;char_pol_via_interpolation;MSup;2|
        ((|m| (|Matrix| R)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|p1| (|SparseUnivariatePolynomial| (|Fraction| R)))
          (|ld| (|List| R)) (#1=#:G18 NIL) (|i| NIL) (#2=#:G17 NIL))
         (SEQ
          (LETT |ld|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 1) (LETT #1# (ANCOLS |m|)) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (|spadConstant| % 28) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |p1| (|CHARPOL3;char_pol_via_interpolation0| |m| |ld| %))
          (EXIT (SPADCALL (ELT % 37) |p1| (QREFELT % 41)))))) 

(SDEFUN |CHARPOL3;to_common_denominator|
        ((|m| (|Matrix| (|Fraction| R)))
         (% (|Record| (|:| |mr| (|Matrix| R)) (|:| |rd| (|List| R)))))
        (SPROG
         ((|g1| (R)) (#1=#:G25 NIL) (|a| (|Fraction| R)) (#2=#:G35 NIL)
          (|j| NIL) (|lg| (|List| R)) (|g| (R)) (|lr| (|List| R))
          (#3=#:G34 NIL) (#4=#:G33 NIL) (|i| NIL) (B (|Matrix| R))
          (|k| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS |m|)) (LETT |k| (ANCOLS |m|)) (LETT |lg| NIL)
              (LETT B (MAKE_MATRIX1 |n| |n| (|spadConstant| % 43)))
              (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (LETT |lr| NIL)
                        (SEQ (LETT |j| 1) (LETT #3# |k|) G190
                             (COND ((|greater_SI| |j| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |lr|
                                     (CONS
                                      (SPADCALL (QAREF2O |m| |i| |j| 1 1)
                                                (QREFELT % 45))
                                      |lr|))))
                             (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                             (EXIT NIL))
                        (LETT |g| (SPADCALL |lr| (QREFELT % 47)))
                        (LETT |lg| (CONS |g| |lg|))
                        (EXIT
                         (SEQ (LETT |j| 1) (LETT #2# |k|) G190
                              (COND ((|greater_SI| |j| #2#) (GO G191)))
                              (SEQ (LETT |a| (QAREF2O |m| |i| |j| 1 1))
                                   (LETT |g1|
                                         (PROG2
                                             (LETT #1#
                                                   (SPADCALL |g|
                                                             (SPADCALL |a|
                                                                       (QREFELT
                                                                        % 45))
                                                             (QREFELT % 49)))
                                             (QCDR #1#)
                                           (|check_union2| (QEQCAR #1# 0)
                                                           (QREFELT % 6)
                                                           (|Union|
                                                            (QREFELT % 6)
                                                            "failed")
                                                           #1#)))
                                   (EXIT
                                    (QSETAREF2O B |i| |j|
                                                (SPADCALL |g1|
                                                          (SPADCALL |a|
                                                                    (QREFELT %
                                                                             50))
                                                          (QREFELT % 51))
                                                1 1)))
                              (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS B (NREVERSE |lg|)))))) 

(SDEFUN |CHARPOL3;det_via_common_denominator;MF;4|
        ((|m| (|Matrix| (|Fraction| R))) (% (|Fraction| R)))
        (SPROG
         ((|d| (R)) (|det1| (R)) (|lg| (|List| R)) (B (|Matrix| R))
          (|#G15| (|Record| (|:| |mr| (|Matrix| R)) (|:| |rd| (|List| R)))))
         (SEQ
          (PROGN
           (LETT |#G15| (|CHARPOL3;to_common_denominator| |m| %))
           (LETT B (QCAR |#G15|))
           (LETT |lg| (QCDR |#G15|))
           |#G15|)
          (LETT |det1| (SPADCALL B (QREFELT % 17)))
          (LETT |d|
                (SPADCALL (ELT % 51) |lg| (|spadConstant| % 28)
                          (QREFELT % 54)))
          (EXIT (SPADCALL |det1| |d| (QREFELT % 55)))))) 

(SDEFUN |CHARPOL3;char_pol_via_den_interpolation;MSup;5|
        ((|m| (|Matrix| (|Fraction| R)))
         (% (|SparseUnivariatePolynomial| (|Fraction| R))))
        (SPROG
         ((|d| (|Fraction| R))
          (|res1| (|SparseUnivariatePolynomial| (|Fraction| R)))
          (|lg| (|List| R)) (B (|Matrix| R))
          (|#G17| (|Record| (|:| |mr| (|Matrix| R)) (|:| |rd| (|List| R)))))
         (SEQ
          (PROGN
           (LETT |#G17| (|CHARPOL3;to_common_denominator| |m| %))
           (LETT B (QCAR |#G17|))
           (LETT |lg| (QCDR |#G17|))
           |#G17|)
          (LETT |res1| (|CHARPOL3;char_pol_via_interpolation0| B |lg| %))
          (LETT |d|
                (SPADCALL
                 (SPADCALL (ELT % 51) |lg| (|spadConstant| % 28)
                           (QREFELT % 54))
                 (QREFELT % 21)))
          (EXIT
           (SPADCALL
            (CONS #'|CHARPOL3;char_pol_via_den_interpolation;MSup;5!0|
                  (VECTOR % |d|))
            |res1| (QREFELT % 59)))))) 

(SDEFUN |CHARPOL3;char_pol_via_den_interpolation;MSup;5!0| ((|c| NIL) ($$ NIL))
        (PROG (|d| %)
          (LETT |d| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |d| (QREFELT % 25)))))) 

(DECLAIM (NOTINLINE |CharacteristicPolynomial3;|)) 

(DEFUN |CharacteristicPolynomial3;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|CharacteristicPolynomial3| DV$1))
          (LETT % (GETREFV 61))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))))))
          (|haddProp| |$ConstructorCache| '|CharacteristicPolynomial3|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 57
                       (CONS
                        (|dispatchFunction|
                         |CHARPOL3;det_via_common_denominator;MF;4|)
                        %))
             (QSETREFV % 60
                       (CONS
                        (|dispatchFunction|
                         |CHARPOL3;char_pol_via_den_interpolation;MSup;5|)
                        %)))))
          %))) 

(DEFUN |CharacteristicPolynomial3| (#1=#:G45)
  (SPROG NIL
         (PROG (#2=#:G46)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CharacteristicPolynomial3|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|CharacteristicPolynomial3;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|CharacteristicPolynomial3|)))))))))) 

(MAKEPROP '|CharacteristicPolynomial3| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (|NonNegativeInteger|) (0 . ~=) (|Matrix| 6) (6 . |copy|)
              (|SparseUnivariatePolynomial| 20) (11 . |Zero|) (15 . |One|)
              (|SingletonAsOrderedSet|) (19 . |create|) (23 . |determinant|)
              (|Integer|) (28 . |coerce|) (|Fraction| 6) (33 . |coerce|)
              (38 . |eval|) (45 . |ground|) (50 . -) (56 . /) (62 . *) (68 . +)
              (74 . |One|) (78 . |One|) (82 . |monomial|) (88 . |coerce|)
              (93 . -) (99 . *) (105 . |elt|) (112 . -) (118 . |setelt!|)
              (126 . |retract|) (|SparseUnivariatePolynomial| 6)
              (|Mapping| 6 20)
              (|UnivariatePolynomialCategoryFunctions2| 20 12 6 38)
              (131 . |map|) |CHARPOL3;char_pol_via_interpolation;MSup;2|
              (137 . |Zero|) (141 . |Zero|) (145 . |denom|) (|List| %)
              (150 . |lcm|) (|Union| % '"failed") (155 . |exquo|)
              (161 . |numer|) (166 . *) (|Mapping| 6 6 6) (|List| 6)
              (172 . |reduce|) (179 . /) (|Matrix| 20)
              (185 . |det_via_common_denominator|) (|Mapping| 20 20)
              (190 . |map|) (196 . |char_pol_via_den_interpolation|))
           '#(|det_via_common_denominator| 201 |char_pol_via_interpolation| 206
              |char_pol_via_den_interpolation| 211)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|char_pol_via_interpolation|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|Matrix| |#1|)))
                                T)
                              '((|det_via_common_denominator|
                                 ((|Fraction| |#1|)
                                  (|Matrix| (|Fraction| |#1|))))
                                (|has| 6 (|GcdDomain|)))
                              '((|char_pol_via_den_interpolation|
                                 ((|SparseUnivariatePolynomial|
                                   (|Fraction| |#1|))
                                  (|Matrix| (|Fraction| |#1|))))
                                (|has| 6 (|GcdDomain|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 60
                                            '(2 8 7 0 0 9 1 10 0 0 11 0 12 0 13
                                              0 12 0 14 0 15 0 16 1 10 6 0 17 1
                                              6 0 18 19 1 20 0 6 21 3 12 0 0 15
                                              20 22 1 12 20 0 23 2 20 0 0 0 24
                                              2 20 0 0 0 25 2 12 0 20 0 26 2 12
                                              0 0 0 27 0 6 0 28 0 20 0 29 2 12
                                              0 20 8 30 1 12 0 20 31 2 12 0 0 0
                                              32 2 12 0 0 0 33 3 10 6 0 18 18
                                              34 2 6 0 0 0 35 4 10 6 0 18 18 6
                                              36 1 20 6 0 37 2 40 38 39 12 41 0
                                              6 0 43 0 20 0 44 1 20 6 0 45 1 6
                                              0 46 47 2 6 48 0 0 49 1 20 6 0 50
                                              2 6 0 0 0 51 3 53 6 52 0 6 54 2
                                              20 0 6 6 55 1 0 20 56 57 2 12 0
                                              58 0 59 1 0 12 56 60 1 1 20 56 57
                                              1 0 38 10 42 1 1 12 56 60)))))
           '|lookupComplete|)) 
