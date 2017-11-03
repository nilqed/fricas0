
(SDEFUN |SMPCOER;convert_sorted|
        ((|p1| |Union| R
          (|Record| (|:| |v| |VarSet1|)
                    (|:| |ts|
                         #1=(|List|
                             (|Record| (|:| |k| (|NonNegativeInteger|))
                                       (|:| |c|
                                            (|SparseMultivariatePolynomial| R
                                                                            |VarSet1|)))))))
         (|lv1| |List| |VarSet1|) (|lv2| |List| |VarSet2|)
         ($
          . #2=(|Union| R
                        (|Record| (|:| |v| |VarSet2|)
                                  (|:| |ts|
                                       (|List|
                                        (|Record|
                                         (|:| |k| (|NonNegativeInteger|))
                                         (|:| |c|
                                              (|SparseMultivariatePolynomial| R
                                                                              |VarSet2|)))))))))
        (SPROG
         ((|pu2|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|SparseMultivariatePolynomial| R |VarSet2|)))))
          (|p2| #2#)
          (|t1|
           (|Union| R
                    (|Record| (|:| |v| |VarSet1|)
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|SparseMultivariatePolynomial|
                                                    R |VarSet1|))))))))
          (#3=#:G730 NIL) (|t0| NIL) (|pu1| #1#) (#4=#:G729 NIL)
          (|v2| (|VarSet2|)) (|v1| (|VarSet1|)))
         (SEQ
          (EXIT
           (COND ((QEQCAR |p1| 0) (CONS 0 (QCDR |p1|)))
                 ((NULL |lv1|) (|error| "p has variable not in lv1"))
                 (#5='T
                  (SEQ
                   (LETT |v1| (QCAR (QCDR |p1|))
                         . #6=(|SMPCOER;convert_sorted|))
                   (LETT |v2| (|SPADfirst| |lv2|) . #6#)
                   (LETT |lv2| (CDR |lv2|) . #6#)
                   (EXIT
                    (COND
                     ((SPADCALL |v1| (|SPADfirst| |lv1|) (QREFELT $ 10))
                      (PROGN
                       (LETT #4#
                             (|SMPCOER;convert_sorted| |p1| (CDR |lv1|) |lv2|
                              $)
                             . #6#)
                       (GO #7=#:G728)))
                     (#5#
                      (SEQ (LETT |lv1| (CDR |lv1|) . #6#)
                           (LETT |pu1| (QCDR (QCDR |p1|)) . #6#)
                           (LETT |pu2| NIL . #6#)
                           (SEQ (LETT |t0| NIL . #6#) (LETT #3# |pu1| . #6#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |t0| (CAR #3#) . #6#) NIL))
                                  (GO G191)))
                                (SEQ (LETT |t1| (QCDR |t0|) . #6#)
                                     (LETT |p2|
                                           (COND
                                            ((QEQCAR |t1| 0)
                                             (CONS 0 (QCDR |t1|)))
                                            ('T
                                             (|SMPCOER;convert_sorted| |t1|
                                              |lv1| |lv2| $)))
                                           . #6#)
                                     (EXIT
                                      (LETT |pu2|
                                            (CONS (CONS (QCAR |t0|) |p2|)
                                                  |pu2|)
                                            . #6#)))
                                (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (CONS 1 (CONS |v2| (NREVERSE |pu2|))))))))))))
          #7# (EXIT #4#)))) 

(SDEFUN |SMPCOER;find_var|
        ((|x| |VarSet1|)
         (|pl| |List|
          (|Record| (|:| |elt1| |VarSet1|)
                    (|:| |elt2| (|SparseMultivariatePolynomial| R |VarSet2|))))
         ($ |SparseMultivariatePolynomial| R |VarSet2|))
        (SPROG ((#1=#:G736 NIL) (#2=#:G737 NIL) (|y| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |y| NIL . #3=(|SMPCOER;find_var|))
                       (LETT #2# |pl| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |x| (QCAR |y|) (QREFELT $ 11))
                           (PROGN
                            (LETT #1# (QCDR |y|) . #3#)
                            (GO #4=#:G735))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT (|error| "Impossible"))))
                #4# (EXIT #1#)))) 

(SDEFUN |SMPCOER;remap_variables;SmpLLSmp;3|
        ((|p| |SparseMultivariatePolynomial| R |VarSet1|)
         (|lv1| |List| |VarSet1|) (|lv2| |List| |VarSet2|)
         ($ |SparseMultivariatePolynomial| R |VarSet2|))
        (SPROG
         ((|pl2|
           (|List|
            (|Record| (|:| |elt1| |VarSet1|)
                      (|:| |elt2|
                           (|SparseMultivariatePolynomial| R |VarSet2|)))))
          (#1=#:G767 NIL) (|el1| NIL) (#2=#:G768 NIL) (|el2| NIL)
          (#3=#:G766 NIL) (#4=#:G765 NIL) (|x| NIL) (#5=#:G764 NIL)
          (#6=#:G763 NIL) (#7=#:G762 NIL)
          (|pl|
           (|List| (|Record| (|:| |elt1| |VarSet1|) (|:| |elt2| |VarSet2|))))
          (#8=#:G760 NIL) (#9=#:G761 NIL) (#10=#:G759 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (LENGTH |lv1|)
                . #11=(|SMPCOER;remap_variables;SmpLLSmp;3|))
          (EXIT
           (COND
            ((SPADCALL |n| (LENGTH |lv2|) (QREFELT $ 13))
             (|error| "lv1 and lv2 have different lengths"))
            ('T
             (SEQ
              (COND
               ((NULL (SPADCALL |lv1| (QREFELT $ 15)))
                (SEQ
                 (LETT |pl|
                       (PROGN
                        (LETT #10# NIL . #11#)
                        (SEQ (LETT |el2| NIL . #11#) (LETT #9# |lv2| . #11#)
                             (LETT |el1| NIL . #11#) (LETT #8# |lv1| . #11#)
                             G190
                             (COND
                              ((OR (ATOM #8#)
                                   (PROGN (LETT |el1| (CAR #8#) . #11#) NIL)
                                   (ATOM #9#)
                                   (PROGN (LETT |el2| (CAR #9#) . #11#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #10# (CONS (CONS |el1| |el2|) #10#)
                                     . #11#)))
                             (LETT #8#
                                   (PROG1 (CDR #8#)
                                     (LETT #9# (CDR #9#) . #11#))
                                   . #11#)
                             (GO G190) G191 (EXIT (NREVERSE #10#))))
                       . #11#)
                 (LETT |pl|
                       (SPADCALL
                        (CONS #'|SMPCOER;remap_variables;SmpLLSmp;3!0| $) |pl|
                        (QREFELT $ 20))
                       . #11#)
                 (LETT |lv1|
                       (PROGN
                        (LETT #7# NIL . #11#)
                        (SEQ (LETT |x| NIL . #11#) (LETT #6# |pl| . #11#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |x| (CAR #6#) . #11#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT #7# (CONS (QCAR |x|) #7#) . #11#)))
                             (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #11#)
                 (EXIT
                  (LETT |lv2|
                        (PROGN
                         (LETT #5# NIL . #11#)
                         (SEQ (LETT |x| NIL . #11#) (LETT #4# |pl| . #11#) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |x| (CAR #4#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT (LETT #5# (CONS (QCDR |x|) #5#) . #11#)))
                              (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                              (EXIT (NREVERSE #5#))))
                        . #11#)))))
              (COND
               ((NULL (SPADCALL |lv2| (QREFELT $ 22)))
                (EXIT
                 (SEQ
                  (LETT |pl2|
                        (PROGN
                         (LETT #3# NIL . #11#)
                         (SEQ (LETT |el2| NIL . #11#) (LETT #2# |lv2| . #11#)
                              (LETT |el1| NIL . #11#) (LETT #1# |lv1| . #11#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |el1| (CAR #1#) . #11#) NIL)
                                    (ATOM #2#)
                                    (PROGN (LETT |el2| (CAR #2#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (CONS |el1|
                                             (SPADCALL (|spadConstant| $ 25)
                                                       |el2| 1 (QREFELT $ 26)))
                                       #3#)
                                      . #11#)))
                              (LETT #1#
                                    (PROG1 (CDR #1#)
                                      (LETT #2# (CDR #2#) . #11#))
                                    . #11#)
                              (GO G190) G191 (EXIT (NREVERSE #3#))))
                        . #11#)
                  (EXIT
                   (SPADCALL
                    (CONS #'|SMPCOER;remap_variables;SmpLLSmp;3!1|
                          (VECTOR $ |pl2|))
                    (ELT $ 27) |p| (QREFELT $ 32)))))))
              (LETT |lv1| (REVERSE |lv1|) . #11#)
              (LETT |lv2| (REVERSE |lv2|) . #11#)
              (EXIT (|SMPCOER;convert_sorted| |p| |lv1| |lv2| $))))))))) 

(SDEFUN |SMPCOER;remap_variables;SmpLLSmp;3!1| ((|z| NIL) ($$ NIL))
        (PROG (|pl2| $)
          (LETT |pl2| (QREFELT $$ 1)
                . #1=(|SMPCOER;remap_variables;SmpLLSmp;3|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SMPCOER;find_var| |z| |pl2| $))))) 

(SDEFUN |SMPCOER;remap_variables;SmpLLSmp;3!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 16))) 

(DECLAIM (NOTINLINE |SparsePolynomialCoercionHelpers;|)) 

(DEFUN |SparsePolynomialCoercionHelpers| (&REST #1=#:G769)
  (SPROG NIL
         (PROG (#2=#:G770)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparsePolynomialCoercionHelpers|)
                                               '|domainEqualList|)
                    . #3=(|SparsePolynomialCoercionHelpers|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparsePolynomialCoercionHelpers;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparsePolynomialCoercionHelpers|)))))))))) 

(DEFUN |SparsePolynomialCoercionHelpers;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|SparsePolynomialCoercionHelpers|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|SparsePolynomialCoercionHelpers| DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 34) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SparsePolynomialCoercionHelpers|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SparsePolynomialCoercionHelpers| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Boolean|) (0 . ~=) (6 . =)
              (|NonNegativeInteger|) (12 . ~=) (|List| 7) (18 . |sorted?|)
              (23 . <) (|Record| (|:| |elt1| 7) (|:| |elt2| 8))
              (|Mapping| 9 17 17) (|List| 17) (29 . |sort|) (|List| 8)
              (35 . |sorted?|) (40 . |One|)
              (|SparseMultivariatePolynomial| 6 8) (44 . |One|)
              (48 . |monomial|) (55 . |coerce|) (|Mapping| 24 7)
              (|Mapping| 24 6) (|SparseMultivariatePolynomial| 6 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 7) 7 6 30 24)
              (60 . |map|) |SMPCOER;remap_variables;SmpLLSmp;3|)
           '#(|remap_variables| 67) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 33
                                                 '(2 7 9 0 0 10 2 7 9 0 0 11 2
                                                   12 9 0 0 13 1 14 9 0 15 2 7
                                                   9 0 0 16 2 19 0 18 0 20 1 21
                                                   9 0 22 0 6 0 23 0 24 0 25 3
                                                   24 0 0 8 12 26 1 24 0 6 27 3
                                                   31 24 28 29 30 32 3 0 24 30
                                                   14 21 33)))))
           '|lookupComplete|)) 
