
(SDEFUN |RFSSPLIT;alg_split_root0;FKIL;1|
        ((|f| F) (|r| |Kernel| F) (|n| |Integer|) ($ |List| F))
        (SPROG
         ((#1=#:G723 NIL) (|i| NIL) (#2=#:G722 NIL)
          (|q| (|SparseUnivariatePolynomial| F)) (|f1| (F)) (|f0| (F))
          (|ef| (F)))
         (SEQ
          (COND
           ((EQL |n| 2)
            (SEQ
             (LETT |ef|
                   (SPADCALL |f| |r|
                             (SPADCALL (SPADCALL |r| (QREFELT $ 9))
                                       (QREFELT $ 10))
                             (QREFELT $ 11))
                   . #3=(|RFSSPLIT;alg_split_root0;FKIL;1|))
             (LETT |f0|
                   (SPADCALL (SPADCALL |f| |ef| (QREFELT $ 12))
                             (SPADCALL 2 (QREFELT $ 14)) (QREFELT $ 15))
                   . #3#)
             (LETT |f1|
                   (SPADCALL (SPADCALL |f| |ef| (QREFELT $ 16))
                             (SPADCALL 2 (QREFELT $ 14)) (QREFELT $ 15))
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL |r| (SPADCALL |f0| (QREFELT $ 18)) (QREFELT $ 22))
                (SEQ (SPADCALL (SPADCALL |f0| (QREFELT $ 24)) (QREFELT $ 26))
                     (EXIT
                      (|error| "alg_split_root0: roots did not cancel 1"))))
               (#4='T
                (SEQ
                 (LETT |f1|
                       (SPADCALL |f1| (SPADCALL |r| (QREFELT $ 9))
                                 (QREFELT $ 15))
                       . #3#)
                 (EXIT
                  (COND
                   ((SPADCALL |r| (SPADCALL |f1| (QREFELT $ 18))
                              (QREFELT $ 22))
                    (SEQ
                     (SPADCALL (SPADCALL |f1| (QREFELT $ 24)) (QREFELT $ 26))
                     (EXIT
                      (|error| "alg_split_root0: roots did not cancel 2"))))
                   (#4# (LIST |f0| |f1|))))))))))
           (#4#
            (SEQ
             (LETT |q|
                   (SPADCALL |f| |r| (SPADCALL |r| (QREFELT $ 28))
                             (QREFELT $ 31))
                   . #3#)
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |q| |i| (QREFELT $ 35)) #2#)
                            . #3#)))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |RFSSPLIT;alg_split_root2|
        ((|lf| |List| F) (|r| |Kernel| F) (|n| |Integer|)
         ($ |List| (|List| F)))
        (SPROG
         ((|res| (|List| (|List| F))) (|resi| (|List| F))
          (|nlf1| #1=(|List| (|List| F))) (|lf1| (|List| F)) (#2=#:G734 NIL)
          (|pow1| NIL) (|nlf0| #1#) (#3=#:G733 NIL) (|f| NIL) (#4=#:G732 NIL))
         (SEQ
          (LETT |nlf0|
                (PROGN
                 (LETT #4# NIL . #5=(|RFSSPLIT;alg_split_root2|))
                 (SEQ (LETT |f| NIL . #5#) (LETT #3# |lf| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS (SPADCALL |f| |r| |n| (QREFELT $ 37)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |res| NIL . #5#)
          (SEQ (LETT |pow1| 0 . #5#) (LETT #2# (- |n| 1) . #5#) G190
               (COND ((|greater_SI| |pow1| #2#) (GO G191)))
               (SEQ (LETT |nlf1| |nlf0| . #5#) (LETT |resi| NIL . #5#)
                    (SEQ G190 (COND ((NULL (NULL (NULL |nlf1|))) (GO G191)))
                         (SEQ (LETT |lf1| (|SPADfirst| |nlf1|) . #5#)
                              (LETT |resi| (CONS (|SPADfirst| |lf1|) |resi|)
                                    . #5#)
                              (SPADCALL |nlf1| (CDR |lf1|) (QREFELT $ 39))
                              (EXIT (LETT |nlf1| (CDR |nlf1|) . #5#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |resi| (NREVERSE |resi|) . #5#)
                    (EXIT (LETT |res| (CONS |resi| |res|) . #5#)))
               (LETT |pow1| (|inc_SI| |pow1|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |res|))))) 

(SDEFUN |RFSSPLIT;alg_split_roots;L2KL;3|
        ((|lf| |List| F) (|r1| |Kernel| F) (|r2| |Kernel| F)
         ($ |List|
          (|Record| (|:| |funs| (|List| F)) (|:| |nroot| F)
                    (|:| |npow1| (|Integer|)) (|:| |npow2| (|Integer|)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |funs| (|List| F)) (|:| |nroot| F)
                      (|:| |npow1| (|Integer|)) (|:| |npow2| (|Integer|)))))
          (|nl| (|List| F)) (#1=#:G766 NIL) (|f1| NIL) (#2=#:G765 NIL)
          (|nrr| (F)) (|bb2| (F)) (#3=#:G746 NIL) (|bb1| (F))
          (|nn| (|Integer|)) (|np2| (|Integer|)) (|nn2| (|Integer|))
          (|g2| #4=(|Integer|)) (#5=#:G763 NIL) (|l2| NIL) (#6=#:G764 NIL)
          (|pow2| NIL) (|np1| (|Integer|)) (|nn1| (|Integer|)) (|g1| #4#)
          (|ll2| #7=(|List| (|List| F))) (#8=#:G761 NIL) (|l1| NIL)
          (#9=#:G762 NIL) (|pow1| NIL) (|rop| (|BasicOperator|)) (|ll1| #7#)
          (|b2| (F)) (|n2| #10=(|Integer|)) (|b1| (F)) (|n1| #10#)
          (|a2| #11=(|List| F)) (|a1| #11#))
         (SEQ
          (LETT |a1| (SPADCALL |r1| (QREFELT $ 40))
                . #12=(|RFSSPLIT;alg_split_roots;L2KL;3|))
          (LETT |a2| (SPADCALL |r2| (QREFELT $ 40)) . #12#)
          (LETT |n1| (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 41)) (QREFELT $ 42))
                . #12#)
          (LETT |b1| (SPADCALL |a1| 1 (QREFELT $ 41)) . #12#)
          (LETT |n2| (SPADCALL (SPADCALL |a2| 2 (QREFELT $ 41)) (QREFELT $ 42))
                . #12#)
          (LETT |b2| (SPADCALL |a2| 1 (QREFELT $ 41)) . #12#)
          (LETT |ll1| (|RFSSPLIT;alg_split_root2| |lf| |r1| |n1| $) . #12#)
          (LETT |res| NIL . #12#)
          (LETT |rop| (SPADCALL |r1| (QREFELT $ 44)) . #12#)
          (SEQ (LETT |pow1| 0 . #12#) (LETT #9# (- |n1| 1) . #12#)
               (LETT |l1| NIL . #12#) (LETT #8# |ll1| . #12#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |l1| (CAR #8#) . #12#) NIL)
                     (|greater_SI| |pow1| #9#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (CONS #'|RFSSPLIT;alg_split_roots;L2KL;3!0| $)
                             |l1| (QREFELT $ 49))
                   "iterate")
                  ('T
                   (SEQ
                    (LETT |ll2| (|RFSSPLIT;alg_split_root2| |l1| |r2| |n2| $)
                          . #12#)
                    (LETT |g1| (GCD |n1| |pow1|) . #12#)
                    (LETT |nn1|
                          (PROG2
                              (LETT #3# (SPADCALL |n1| |g1| (QREFELT $ 51))
                                    . #12#)
                              (QCDR #3#)
                            (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                            (|Union| (|Integer|) #13="failed")
                                            #3#))
                          . #12#)
                    (LETT |np1|
                          (PROG2
                              (LETT #3# (SPADCALL |pow1| |g1| (QREFELT $ 51))
                                    . #12#)
                              (QCDR #3#)
                            (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                            (|Union| (|Integer|) #13#) #3#))
                          . #12#)
                    (EXIT
                     (SEQ (LETT |pow2| 0 . #12#) (LETT #6# (- |n2| 1) . #12#)
                          (LETT |l2| NIL . #12#) (LETT #5# |ll2| . #12#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |l2| (CAR #5#) . #12#) NIL)
                                (|greater_SI| |pow2| #6#))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (CONS #'|RFSSPLIT;alg_split_roots;L2KL;3!1| $)
                               |l2| (QREFELT $ 49))
                              "iterate")
                             ('T
                              (SEQ (LETT |g2| (GCD |n2| |pow2|) . #12#)
                                   (LETT |nn2|
                                         (PROG2
                                             (LETT #3#
                                                   (SPADCALL |n2| |g2|
                                                             (QREFELT $ 51))
                                                   . #12#)
                                             (QCDR #3#)
                                           (|check_union2| (QEQCAR #3# 0)
                                                           (|Integer|)
                                                           (|Union| (|Integer|)
                                                                    #13#)
                                                           #3#))
                                         . #12#)
                                   (LETT |np2|
                                         (PROG2
                                             (LETT #3#
                                                   (SPADCALL |pow2| |g2|
                                                             (QREFELT $ 51))
                                                   . #12#)
                                             (QCDR #3#)
                                           (|check_union2| (QEQCAR #3# 0)
                                                           (|Integer|)
                                                           (|Union| (|Integer|)
                                                                    #13#)
                                                           #3#))
                                         . #12#)
                                   (LETT |nn|
                                         (SPADCALL |nn1| |nn2| (QREFELT $ 52))
                                         . #12#)
                                   (LETT |bb1|
                                         (SPADCALL |b1|
                                                   (* |np1|
                                                      (PROG2
                                                          (LETT #3#
                                                                (SPADCALL |nn|
                                                                          |nn1|
                                                                          (QREFELT
                                                                           $
                                                                           51))
                                                                . #12#)
                                                          (QCDR #3#)
                                                        (|check_union2|
                                                         (QEQCAR #3# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  #13#)
                                                         #3#)))
                                                   (QREFELT $ 53))
                                         . #12#)
                                   (LETT |bb2|
                                         (SPADCALL |b2|
                                                   (* |np2|
                                                      (PROG2
                                                          (LETT #3#
                                                                (SPADCALL |nn|
                                                                          |nn2|
                                                                          (QREFELT
                                                                           $
                                                                           51))
                                                                . #12#)
                                                          (QCDR #3#)
                                                        (|check_union2|
                                                         (QEQCAR #3# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  #13#)
                                                         #3#)))
                                                   (QREFELT $ 53))
                                         . #12#)
                                   (LETT |nrr|
                                         (COND
                                          ((SPADCALL (+ |pow1| |pow2|) 0
                                                     (QREFELT $ 54))
                                           (SPADCALL |rop|
                                                     (LIST
                                                      (SPADCALL |bb1| |bb2|
                                                                (QREFELT $ 55))
                                                      (SPADCALL |nn|
                                                                (QREFELT $
                                                                         14)))
                                                     (QREFELT $ 57)))
                                          ('T (|spadConstant| $ 33)))
                                         . #12#)
                                   (LETT |nl|
                                         (PROGN
                                          (LETT #2# NIL . #12#)
                                          (SEQ (LETT |f1| NIL . #12#)
                                               (LETT #1# |l2| . #12#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |f1| (CAR #1#)
                                                            . #12#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (SPADCALL |f1| |nrr|
                                                                  (QREFELT $
                                                                           55))
                                                        #2#)
                                                       . #12#)))
                                               (LETT #1# (CDR #1#) . #12#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#))))
                                         . #12#)
                                   (EXIT
                                    (LETT |res|
                                          (CONS
                                           (VECTOR |nl| |nrr| |pow1| |pow2|)
                                           |res|)
                                          . #12#)))))))
                          (LETT #5#
                                (PROG1 (CDR #5#)
                                  (LETT |pow2| (|inc_SI| |pow2|) . #12#))
                                . #12#)
                          (GO G190) G191 (EXIT NIL))))))))
               (LETT #8#
                     (PROG1 (CDR #8#) (LETT |pow1| (|inc_SI| |pow1|) . #12#))
                     . #12#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |RFSSPLIT;alg_split_roots;L2KL;3!1| ((|f1| NIL) ($ NIL))
        (SPADCALL |f1| (|spadConstant| $ 46) (QREFELT $ 47))) 

(SDEFUN |RFSSPLIT;alg_split_roots;L2KL;3!0| ((|f1| NIL) ($ NIL))
        (SPADCALL |f1| (|spadConstant| $ 46) (QREFELT $ 47))) 

(DECLAIM (NOTINLINE |RootFSSplit;|)) 

(DEFUN |RootFSSplit| (&REST #1=#:G767)
  (SPROG NIL
         (PROG (#2=#:G768)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RootFSSplit|)
                                               '|domainEqualList|)
                    . #3=(|RootFSSplit|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RootFSSplit;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|RootFSSplit|)))))))))) 

(DEFUN |RootFSSplit;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RootFSSplit|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|RootFSSplit| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 61) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RootFSSplit| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RootFSSplit| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Kernel| $) (0 . |coerce|) (5 . -) (10 . |eval|) (17 . +)
              (|Integer|) (23 . |coerce|) (28 . /) (34 . -) (|List| 8)
              (40 . |kernels|) (|Boolean|) (|Kernel| 7) (|List| 20)
              (45 . |member?|) (|OutputForm|) (51 . |coerce|) (|Void|)
              (56 . |print|) (|SparseUnivariatePolynomial| $) (61 . |minPoly|)
              (|SparseUnivariatePolynomial| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 20) 20
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 20)
                                                     7)
              (66 . |univariate|) (73 . |One|) (77 . |One|)
              (|NonNegativeInteger|) (81 . |coefficient|) (|List| 7)
              |RFSSPLIT;alg_split_root0;FKIL;1| (|List| 36) (87 . |setfirst!|)
              (93 . |argument|) (98 . |elt|) (104 . |retract|)
              (|BasicOperator|) (109 . |operator|) (114 . |Zero|)
              (118 . |Zero|) (122 . =) (|Mapping| 19 7) (128 . |every?|)
              (|Union| $ '"failed") (134 . |exquo|) (140 . |lcm|) (146 . ^)
              (152 . >) (158 . *) (|List| $) (164 . |kernel|)
              (|Record| (|:| |funs| 36) (|:| |nroot| 7) (|:| |npow1| 13)
                        (|:| |npow2| 13))
              (|List| 58) |RFSSPLIT;alg_split_roots;L2KL;3|)
           '#(|alg_split_roots| 170 |alg_split_root0| 177) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(1 7 0 8 9 1 7 0 0 10 3 7 0 0
                                                   8 0 11 2 7 0 0 0 12 1 7 0 13
                                                   14 2 7 0 0 0 15 2 7 0 0 0 16
                                                   1 7 17 0 18 2 21 19 20 0 22
                                                   1 7 23 0 24 1 23 25 0 26 1 7
                                                   27 8 28 3 30 29 7 20 29 31 0
                                                   6 0 32 0 7 0 33 2 29 7 0 34
                                                   35 2 38 36 0 36 39 1 20 36 0
                                                   40 2 36 7 0 13 41 1 7 13 0
                                                   42 1 20 43 0 44 0 6 0 45 0 7
                                                   0 46 2 7 19 0 0 47 2 36 19
                                                   48 0 49 2 13 50 0 0 51 2 13
                                                   0 0 0 52 2 7 0 0 13 53 2 13
                                                   19 0 0 54 2 7 0 0 0 55 2 7 0
                                                   43 56 57 3 0 59 36 20 20 60
                                                   3 0 36 7 20 13 37)))))
           '|lookupComplete|)) 
