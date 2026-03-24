
(SDEFUN |CHARPOL4;dot_col_vec|
        ((|m| (|Matrix| R)) (|k| (|Integer|)) (|v| (|Vector| R))
         (|l| (|Integer|)) (% (R)))
        (SPROG ((|ss| (R)) (#1=#:G5 NIL) (|j| NIL))
               (SEQ (LETT |ss| (|spadConstant| % 7))
                    (SEQ (LETT |j| 1) (LETT #1# |l|) G190
                         (COND ((|greater_SI| |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ss|
                                 (SPADCALL |ss|
                                           (SPADCALL
                                            (SPADCALL |m| |k| |j|
                                                      (QREFELT % 10))
                                            (SPADCALL |v| |j| (QREFELT % 12))
                                            (QREFELT % 13))
                                           (QREFELT % 14)))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ss|)))) 

(SDEFUN |CHARPOL4;char_pol_via_berkovitz;MSup;2|
        ((|m| (|Matrix| R)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((#1=#:G39 NIL) (|i| NIL) (|ss| (R)) (#2=#:G38 NIL) (|j| NIL)
          (#3=#:G37 NIL) (#4=#:G36 NIL) (#5=#:G35 NIL) (#6=#:G34 NIL)
          (#7=#:G33 NIL) (#8=#:G32 NIL) (#9=#:G31 NIL) (|r| NIL)
          (|s| #10=(|Vector| R)) (|c| #10#) (|q| #10#) (|pv| #10#)
          (|x| (|SparseUnivariatePolynomial| R)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANCOLS |m|))
              (EXIT
               (COND
                ((SPADCALL |n| (ANROWS |m|) (QREFELT % 17))
                 (|error| "matrix not square"))
                (#11='T
                 (SEQ
                  (LETT |x| (SPADCALL (|spadConstant| % 18) 1 (QREFELT % 21)))
                  (EXIT
                   (COND ((EQL |n| 0) (|spadConstant| % 20))
                         ((EQL |n| 1)
                          (SPADCALL
                           (SPADCALL (SPADCALL |m| 1 1 (QREFELT % 10))
                                     (QREFELT % 23))
                           |x| (QREFELT % 24)))
                         ((EQL |n| 2)
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL |m| 1 1 (QREFELT % 10))
                                       (QREFELT % 23))
                             |x| (QREFELT % 24))
                            (SPADCALL
                             (SPADCALL (SPADCALL |m| 2 2 (QREFELT % 10))
                                       (QREFELT % 23))
                             |x| (QREFELT % 24))
                            (QREFELT % 25))
                           (SPADCALL
                            (SPADCALL (SPADCALL |m| 2 1 (QREFELT % 10))
                                      (SPADCALL |m| 1 2 (QREFELT % 10))
                                      (QREFELT % 13))
                            (QREFELT % 23))
                           (QREFELT % 24)))
                         (#11#
                          (SEQ (LETT |pv| (SPADCALL (+ |n| 1) (QREFELT % 26)))
                               (LETT |q| (SPADCALL (+ |n| 1) (QREFELT % 26)))
                               (LETT |c| (SPADCALL (+ |n| 1) (QREFELT % 26)))
                               (LETT |s| (SPADCALL (- |n| 1) (QREFELT % 26)))
                               (SPADCALL |q| 1
                                         (SPADCALL (|spadConstant| % 18)
                                                   (QREFELT % 27))
                                         (QREFELT % 28))
                               (SPADCALL |q| 2
                                         (SPADCALL |m| 1 1 (QREFELT % 10))
                                         (QREFELT % 28))
                               (SPADCALL |c| 1
                                         (SPADCALL (|spadConstant| % 18)
                                                   (QREFELT % 27))
                                         (QREFELT % 28))
                               (SEQ (LETT |r| 2) (LETT #9# |n|) G190
                                    (COND ((|greater_SI| |r| #9#) (GO G191)))
                                    (SEQ
                                     (SEQ (LETT |i| 1) (LETT #8# |r|) G190
                                          (COND
                                           ((|greater_SI| |i| #8#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |pv| |i|
                                                      (SPADCALL |q| |i|
                                                                (QREFELT % 12))
                                                      (QREFELT % 28))))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (SEQ (LETT |i| 1) (LETT #7# (- |r| 1))
                                          G190
                                          (COND
                                           ((|greater_SI| |i| #7#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |s| |i|
                                                      (SPADCALL |m| |i| |r|
                                                                (QREFELT % 10))
                                                      (QREFELT % 28))))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (SPADCALL |c| 2
                                               (SPADCALL |m| |r| |r|
                                                         (QREFELT % 10))
                                               (QREFELT % 28))
                                     (SEQ (LETT |i| 1) (LETT #6# (- |r| 2))
                                          G190
                                          (COND
                                           ((|greater_SI| |i| #6#) (GO G191)))
                                          (SEQ
                                           (SPADCALL |c| (+ |i| 2)
                                                     (|CHARPOL4;dot_col_vec|
                                                      |m| |r| |s| (- |r| 1) %)
                                                     (QREFELT % 28))
                                           (SEQ (LETT |j| 1)
                                                (LETT #5# (- |r| 1)) G190
                                                (COND
                                                 ((|greater_SI| |j| #5#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (SPADCALL |q| |j|
                                                            (|CHARPOL4;dot_col_vec|
                                                             |m| |j| |s|
                                                             (- |r| 1) %)
                                                            (QREFELT % 28))))
                                                (LETT |j| (|inc_SI| |j|))
                                                (GO G190) G191 (EXIT NIL))
                                           (EXIT
                                            (SEQ (LETT |j| 1)
                                                 (LETT #4# (- |r| 1)) G190
                                                 (COND
                                                  ((|greater_SI| |j| #4#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (SPADCALL |s| |j|
                                                             (SPADCALL |q| |j|
                                                                       (QREFELT
                                                                        % 12))
                                                             (QREFELT % 28))))
                                                 (LETT |j| (|inc_SI| |j|))
                                                 (GO G190) G191 (EXIT NIL))))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (SPADCALL |c| (+ |r| 1)
                                               (|CHARPOL4;dot_col_vec| |m| |r|
                                                |s| (- |r| 1) %)
                                               (QREFELT % 28))
                                     (EXIT
                                      (SEQ (LETT |i| 1) (LETT #3# (+ |r| 1))
                                           G190
                                           (COND
                                            ((|greater_SI| |i| #3#) (GO G191)))
                                           (SEQ
                                            (LETT |ss| (|spadConstant| % 7))
                                            (SEQ (LETT |j| 1)
                                                 (LETT #2# (MIN |r| |i|)) G190
                                                 (COND
                                                  ((|greater_SI| |j| #2#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |ss|
                                                         (SPADCALL |ss|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |c|
                                                                     (-
                                                                      (+ |i| 1)
                                                                      |j|)
                                                                     (QREFELT %
                                                                              12))
                                                                    (SPADCALL
                                                                     |pv| |j|
                                                                     (QREFELT %
                                                                              12))
                                                                    (QREFELT %
                                                                             13))
                                                                   (QREFELT %
                                                                            14)))))
                                                 (LETT |j| (|inc_SI| |j|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (SPADCALL |q| |i| |ss|
                                                       (QREFELT % 28))))
                                           (LETT |i| (|inc_SI| |i|)) (GO G190)
                                           G191 (EXIT NIL))))
                                    (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                    (EXIT NIL))
                               (SEQ (LETT |i| 1) (LETT #1# (+ |n| 1)) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |pv| (- (+ |n| 2) |i|)
                                                (SPADCALL |q| |i|
                                                          (QREFELT % 12))
                                                (QREFELT % 28))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (SPADCALL |pv| (QREFELT % 29)))))))))))))) 

(DECLAIM (NOTINLINE |CharacteristicPolynomial4;|)) 

(DEFUN |CharacteristicPolynomial4;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|CharacteristicPolynomial4| DV$1))
          (LETT % (GETREFV 31))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CharacteristicPolynomial4|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |CharacteristicPolynomial4| (#1=#:G40)
  (SPROG NIL
         (PROG (#2=#:G41)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CharacteristicPolynomial4|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|CharacteristicPolynomial4;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|CharacteristicPolynomial4|)))))))))) 

(MAKEPROP '|CharacteristicPolynomial4| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|) (|Integer|)
              (|Matrix| 6) (4 . |elt|) (|Vector| 6) (11 . |elt|) (17 . *)
              (23 . +) (|Boolean|) (|NonNegativeInteger|) (29 . ~=)
              (35 . |One|) (|SparseUnivariatePolynomial| 6) (39 . |One|)
              (43 . |monomial|) (49 . |Zero|) (53 . |coerce|) (58 . -) (64 . *)
              (70 . |zero|) (75 . -) (80 . |setelt!|) (87 . |unvectorise|)
              |CHARPOL4;char_pol_via_berkovitz;MSup;2|)
           '#(|char_pol_via_berkovitz| 92) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|char_pol_via_berkovitz|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|Matrix| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 30
                                            '(0 6 0 7 3 9 6 0 8 8 10 2 11 6 0 8
                                              12 2 6 0 0 0 13 2 6 0 0 0 14 2 16
                                              15 0 0 17 0 6 0 18 0 19 0 20 2 19
                                              0 6 16 21 0 19 0 22 1 19 0 6 23 2
                                              19 0 0 0 24 2 19 0 0 0 25 1 11 0
                                              16 26 1 6 0 0 27 3 11 6 0 8 6 28
                                              1 19 0 11 29 1 0 19 9 30)))))
           '|lookupComplete|)) 
