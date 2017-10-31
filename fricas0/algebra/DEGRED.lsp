
(SDEFUN |DEGRED;degrees|
        ((|u| |SparseUnivariatePolynomial| R1) ($ |List| (|Integer|)))
        (SPROG ((|l| (|List| (|Integer|))))
               (SEQ (LETT |l| NIL . #1=(|DEGRED;degrees|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |u| (|spadConstant| $ 11)
                                      (QREFELT $ 13)))
                           (GO G191)))
                         (SEQ
                          (LETT |l| (CONS (SPADCALL |u| (QREFELT $ 15)) |l|)
                                . #1#)
                          (EXIT
                           (LETT |u| (SPADCALL |u| (QREFELT $ 16)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |l|)))) 

(SDEFUN |DEGRED;reduce;SupR;2|
        ((|u| |SparseUnivariatePolynomial| R1)
         ($ |Record| (|:| |pol| (|SparseUnivariatePolynomial| R1))
          (|:| |deg| (|PositiveInteger|))))
        (SPROG
         ((#1=#:G718 NIL) (#2=#:G715 NIL) (#3=#:G713 NIL) (|g| #4=(|Integer|))
          (#5=#:G707 NIL) (#6=#:G706 #4#) (#7=#:G708 #4#) (#8=#:G722 NIL)
          (|d| NIL))
         (SEQ
          (LETT |g|
                (PROGN
                 (LETT #5# NIL . #9=(|DEGRED;reduce;SupR;2|))
                 (SEQ (LETT |d| NIL . #9#)
                      (LETT #8# (|DEGRED;degrees| |u| $) . #9#) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |d| (CAR #8#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #7# |d| . #9#)
                         (COND (#5# (LETT #6# (GCD #6# #7#) . #9#))
                               ('T
                                (PROGN
                                 (LETT #6# #7# . #9#)
                                 (LETT #5# 'T . #9#)))))))
                      (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
                 (COND (#5# #6#) ('T 0)))
                . #9#)
          (LETT |u|
                (PROG2
                    (LETT #2#
                          (SPADCALL |u|
                                    (PROG1 (LETT #3# |g| . #9#)
                                      (|check_subtype2| (> #3# 0)
                                                        '(|PositiveInteger|)
                                                        '(|Integer|) #3#))
                                    (QREFELT $ 18))
                          . #9#)
                    (QCDR #2#)
                  (|check_union2| (QEQCAR #2# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 6))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 6))
                                   "failed")
                                  #2#))
                . #9#)
          (EXIT
           (CONS |u|
                 (PROG1 (LETT #1# |g| . #9#)
                   (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                     '(|Integer|) #1#))))))) 

(SDEFUN |DEGRED;rootOfUnity|
        ((|j| |Integer|) (|n| |Integer|) ($ |Expression| R2))
        (SPROG ((|arg| (|Expression| R2)))
               (SEQ
                (COND ((EQL |j| 0) (|spadConstant| $ 22))
                      ('T
                       (SEQ
                        (LETT |arg|
                              (SPADCALL
                               (SPADCALL (SPADCALL 2 |j| (QREFELT $ 25))
                                         (SPADCALL (QREFELT $ 26))
                                         (QREFELT $ 27))
                               (SPADCALL |n| (QREFELT $ 28)) (QREFELT $ 29))
                              |DEGRED;rootOfUnity|)
                        (EXIT
                         (SPADCALL (SPADCALL |arg| (QREFELT $ 30))
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 22)
                                               (QREFELT $ 37))
                                     (SPADCALL 1 2 (QREFELT $ 36))
                                     (QREFELT $ 40))
                                    (SPADCALL |arg| (QREFELT $ 41))
                                    (QREFELT $ 42))
                                   (QREFELT $ 43))))))))) 

(SDEFUN |DEGRED;expand;EPiL;4|
        ((|s| |Expression| R2) (|g| |PositiveInteger|)
         ($ |List| (|Expression| R2)))
        (SPROG ((#1=#:G736 NIL) (|i| NIL) (#2=#:G735 NIL))
               (SEQ
                (COND ((EQL |g| 1) (LIST |s|))
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|DEGRED;expand;EPiL;4|))
                        (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |g| 1) . #3#) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (|DEGRED;rootOfUnity| |i| |g| $)
                                       (SPADCALL |s|
                                                 (SPADCALL 1 |g|
                                                           (QREFELT $ 36))
                                                 (QREFELT $ 40))
                                       (QREFELT $ 42))
                                      #2#)
                                     . #3#)))
                             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(DECLAIM (NOTINLINE |DegreeReductionPackage;|)) 

(DEFUN |DegreeReductionPackage| (&REST #1=#:G737)
  (SPROG NIL
         (PROG (#2=#:G738)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DegreeReductionPackage|)
                                               '|domainEqualList|)
                    . #3=(|DegreeReductionPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DegreeReductionPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|DegreeReductionPackage|)))))))))) 

(DEFUN |DegreeReductionPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DegreeReductionPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|DegreeReductionPackage| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 46) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DegreeReductionPackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|DegreeReductionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|) (|SparseUnivariatePolynomial| 6)
              (8 . |Zero|) (|Boolean|) (12 . ~=) (|NonNegativeInteger|)
              (18 . |degree|) (23 . |reductum|) (|Union| $ '"failed")
              (28 . |divideExponents|) (|Record| (|:| |pol| 10) (|:| |deg| 23))
              |DEGRED;reduce;SupR;2| (|Expression| 7) (34 . |One|)
              (|PositiveInteger|) (|Integer|) (38 . *) (44 . |pi|) (48 . *)
              (54 . |coerce|) (59 . /) (65 . |cos|) (70 . |One|) (74 . |One|)
              (78 . -) (83 . -) (|Fraction| 24) (88 . /) (94 . -)
              (|SparseMultivariatePolynomial| 7 (|Kernel| 21)) (99 . |One|)
              (103 . ^) (109 . |sin|) (114 . *) (120 . +) (|List| 21)
              |DEGRED;expand;EPiL;4|)
           '#(|reduce| 126 |expand| 131) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(0 6 0 8 0 7 0 9 0 10 0 11 2
                                                   10 12 0 0 13 1 10 14 0 15 1
                                                   10 0 0 16 2 10 17 0 14 18 0
                                                   21 0 22 2 24 0 23 0 25 0 21
                                                   0 26 2 21 0 24 0 27 1 21 0
                                                   24 28 2 21 0 0 0 29 1 21 0 0
                                                   30 0 6 0 31 0 7 0 32 1 7 0 0
                                                   33 1 6 0 0 34 2 35 0 24 24
                                                   36 1 21 0 0 37 0 38 0 39 2
                                                   21 0 0 35 40 1 21 0 0 41 2
                                                   21 0 0 0 42 2 21 0 0 0 43 1
                                                   0 19 10 20 2 0 44 21 23
                                                   45)))))
           '|lookupComplete|)) 
