
(SDEFUN |TANEXP;m1toN| ((|n| |Integer|) ($ |Integer|))
        (COND ((ODDP |n|) -1) ('T 1))) 

(SDEFUN |TANEXP;tanAn;RPiSup;2|
        ((|a| R) (|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| R))
        (SPROG ((|q| (|Fraction| (|SparseUnivariatePolynomial| R))))
               (SPADCALL
                (SPADCALL |a|
                          (SPADCALL
                           (LETT |q| (|TANEXP;tanPIa| |n| $)
                                 |TANEXP;tanAn;RPiSup;2|)
                           (QREFELT $ 10))
                          (QREFELT $ 11))
                (SPADCALL |q| (QREFELT $ 12)) (QREFELT $ 13)))) 

(SDEFUN |TANEXP;tanNa;RIR;3| ((|a| R) (|n| |Integer|) ($ R))
        (SPROG
         ((|t| (|Fraction| (|SparseUnivariatePolynomial| R))) (#1=#:G710 NIL))
         (COND ((ZEROP |n|) (|spadConstant| $ 16))
               ((MINUSP |n|)
                (SPADCALL (SPADCALL |a| (- |n|) (QREFELT $ 18))
                          (QREFELT $ 19)))
               ('T
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (LETT |t|
                         (|TANEXP;tanPIa|
                          (PROG1 (LETT #1# |n| . #2=(|TANEXP;tanNa;RIR;3|))
                            (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                              '(|Integer|) #1#))
                          $)
                         . #2#)
                   (QREFELT $ 12))
                  |a| (QREFELT $ 20))
                 (SPADCALL (SPADCALL |t| (QREFELT $ 10)) |a| (QREFELT $ 20))
                 (QREFELT $ 21)))))) 

(SDEFUN |TANEXP;tanSum;LR;4| ((|l| |List| R) ($ R))
        (SPROG
         ((#1=#:G728 NIL) (#2=#:G727 (R)) (#3=#:G729 (R)) (#4=#:G734 NIL)
          (|i| NIL) (#5=#:G725 NIL) (#6=#:G724 (R)) (#7=#:G726 (R))
          (#8=#:G733 NIL) (|m| (|Integer|)) (|v| (|Vector| R)))
         (SEQ
          (COND ((NULL |l|) (|spadConstant| $ 16))
                (#9='T
                 (SEQ
                  (LETT |m|
                        (SPADCALL
                         (LETT |v| (SPADCALL |l| (QREFELT $ 25))
                               . #10=(|TANEXP;tanSum;LR;4|))
                         (QREFELT $ 26))
                        . #10#)
                  (EXIT
                   (SPADCALL
                    (PROGN
                     (LETT #5# NIL . #10#)
                     (SEQ (LETT |i| 0 . #10#)
                          (LETT #8# (QUOTIENT2 (- (QVSIZE |v|) 1) 2) . #10#)
                          G190 (COND ((|greater_SI| |i| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #7#
                                   (SPADCALL (|TANEXP;m1toN| |i| $)
                                             (SPADCALL |v|
                                                       (+
                                                        (SPADCALL 2 |i|
                                                                  (QREFELT $
                                                                           28))
                                                        |m|)
                                                       (QREFELT $ 29))
                                             (QREFELT $ 30))
                                   . #10#)
                             (COND
                              (#5#
                               (LETT #6# (SPADCALL #6# #7# (QREFELT $ 31))
                                     . #10#))
                              ('T
                               (PROGN
                                (LETT #6# #7# . #10#)
                                (LETT #5# 'T . #10#)))))))
                          (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#5# #6#) (#9# (|spadConstant| $ 16))))
                    (SPADCALL (|spadConstant| $ 7)
                              (PROGN
                               (LETT #1# NIL . #10#)
                               (SEQ (LETT |i| 1 . #10#)
                                    (LETT #4# (QUOTIENT2 (QVSIZE |v|) 2)
                                          . #10#)
                                    G190
                                    (COND ((|greater_SI| |i| #4#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #3#
                                             (SPADCALL (|TANEXP;m1toN| |i| $)
                                                       (SPADCALL |v|
                                                                 (+
                                                                  (-
                                                                   (SPADCALL 2
                                                                             |i|
                                                                             (QREFELT
                                                                              $
                                                                              28))
                                                                   1)
                                                                  |m|)
                                                                 (QREFELT $
                                                                          29))
                                                       (QREFELT $ 30))
                                             . #10#)
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #3#
                                                         (QREFELT $ 31))
                                               . #10#))
                                        ('T
                                         (PROGN
                                          (LETT #2# #3# . #10#)
                                          (LETT #1# 'T . #10#)))))))
                                    (LETT |i| (|inc_SI| |i|) . #10#) (GO G190)
                                    G191 (EXIT NIL))
                               (COND (#1# #2#) (#9# (|spadConstant| $ 16))))
                              (QREFELT $ 31))
                    (QREFELT $ 21))))))))) 

(SDEFUN |TANEXP;tanPIa|
        ((|n| |PositiveInteger|)
         ($ |Fraction| (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((#1=#:G739 NIL) (#2=#:G738 #3=(|SparseUnivariatePolynomial| R))
          (#4=#:G740 #3#) (#5=#:G744 NIL) (|i| NIL) (#6=#:G736 NIL)
          (#7=#:G735 #3#) (#8=#:G737 #3#) (#9=#:G743 NIL) (|m| (|Integer|))
          (|v| (|Vector| (|SparseUnivariatePolynomial| R))))
         (SEQ
          (LETT |m|
                (SPADCALL
                 (LETT |v|
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 7) 1 (QREFELT $ 34)) |n|
                        (QREFELT $ 37))
                       . #10=(|TANEXP;tanPIa|))
                 (QREFELT $ 38))
                . #10#)
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #6# NIL . #10#)
             (SEQ (LETT |i| 0 . #10#)
                  (LETT #9# (QUOTIENT2 (- (QVSIZE |v|) 1) 2) . #10#) G190
                  (COND ((|greater_SI| |i| #9#) (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #8#
                           (SPADCALL (|TANEXP;m1toN| |i| $)
                                     (SPADCALL |v|
                                               (+
                                                (SPADCALL 2 |i| (QREFELT $ 28))
                                                |m|)
                                               (QREFELT $ 39))
                                     (QREFELT $ 40))
                           . #10#)
                     (COND
                      (#6# (LETT #7# (SPADCALL #7# #8# (QREFELT $ 41)) . #10#))
                      ('T
                       (PROGN (LETT #7# #8# . #10#) (LETT #6# 'T . #10#)))))))
                  (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
             (COND (#6# #7#) (#11='T (|spadConstant| $ 42))))
            (SPADCALL (|spadConstant| $ 43)
                      (PROGN
                       (LETT #1# NIL . #10#)
                       (SEQ (LETT |i| 1 . #10#)
                            (LETT #5# (QUOTIENT2 (QVSIZE |v|) 2) . #10#) G190
                            (COND ((|greater_SI| |i| #5#) (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #4#
                                     (SPADCALL (|TANEXP;m1toN| |i| $)
                                               (SPADCALL |v|
                                                         (+
                                                          (-
                                                           (SPADCALL 2 |i|
                                                                     (QREFELT $
                                                                              28))
                                                           1)
                                                          |m|)
                                                         (QREFELT $ 39))
                                               (QREFELT $ 40))
                                     . #10#)
                               (COND
                                (#1#
                                 (LETT #2# (SPADCALL #2# #4# (QREFELT $ 41))
                                       . #10#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #10#)
                                  (LETT #1# 'T . #10#)))))))
                            (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#1# #2#) (#11# (|spadConstant| $ 42))))
                      (QREFELT $ 41))
            (QREFELT $ 44)))))) 

(DECLAIM (NOTINLINE |TangentExpansions;|)) 

(DEFUN |TangentExpansions| (#1=#:G745)
  (SPROG NIL
         (PROG (#2=#:G746)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TangentExpansions|)
                                               '|domainEqualList|)
                    . #3=(|TangentExpansions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|TangentExpansions;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TangentExpansions|)))))))))) 

(DEFUN |TangentExpansions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TangentExpansions|))
          (LETT |dv$| (LIST '|TangentExpansions| DV$1) . #1#)
          (LETT $ (GETREFV 45) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TangentExpansions| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TangentExpansions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|)
              (|SparseUnivariatePolynomial| 6) (|Fraction| 8) (4 . |denom|)
              (9 . *) (15 . |numer|) (20 . -) (|PositiveInteger|)
              |TANEXP;tanAn;RPiSup;2| (26 . |Zero|) (|Integer|)
              |TANEXP;tanNa;RIR;3| (30 . -) (35 . |elt|) (41 . /) (|Vector| 6)
              (|List| 6) (|SymmetricFunctions| 6) (47 . |symFunc|)
              (52 . |minIndex|) (|NonNegativeInteger|) (57 . *) (63 . |elt|)
              (69 . *) (75 . +) |TANEXP;tanSum;LR;4| (81 . |One|)
              (85 . |monomial|) (|Vector| 8) (|SymmetricFunctions| 8)
              (91 . |symFunc|) (97 . |minIndex|) (102 . |elt|) (108 . *)
              (114 . +) (120 . |Zero|) (124 . |One|) (128 . /))
           '#(|tanSum| 134 |tanNa| 139 |tanAn| 145) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 44
                                                 '(0 6 0 7 1 9 8 0 10 2 8 0 6 0
                                                   11 1 9 8 0 12 2 8 0 0 0 13 0
                                                   6 0 16 1 6 0 0 19 2 8 6 0 6
                                                   20 2 6 0 0 0 21 1 24 22 23
                                                   25 1 22 17 0 26 2 27 0 14 0
                                                   28 2 22 6 0 17 29 2 6 0 17 0
                                                   30 2 6 0 0 0 31 0 9 0 33 2 8
                                                   0 6 27 34 2 36 35 8 14 37 1
                                                   35 17 0 38 2 35 8 0 17 39 2
                                                   8 0 17 0 40 2 8 0 0 0 41 0 8
                                                   0 42 0 8 0 43 2 9 0 8 8 44 1
                                                   0 6 23 32 2 0 6 6 17 18 2 0
                                                   8 6 14 15)))))
           '|lookupComplete|)) 
