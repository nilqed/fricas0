
(SDEFUN |REDORDER;localbinom| ((|j| |Integer|) (|i| |Integer|) ($ |Integer|))
        (COND
         ((SPADCALL |j| |i| (QREFELT $ 12))
          (SPADCALL |j| (+ |i| 1) (QREFELT $ 15)))
         ('T 0))) 

(SDEFUN |REDORDER;locals|
        ((|s| |PrimitiveArray| F) (|j| |Integer|) (|i| |Integer|) ($ F))
        (COND
         ((SPADCALL |j| |i| (QREFELT $ 12)) (QAREF1 |s| (- (- |j| |i|) 1)))
         ('T (|spadConstant| $ 16)))) 

(SDEFUN |REDORDER;ReduceOrder;LLR;3|
        ((|l| L) (|sols| |List| F)
         ($ |Record| (|:| |eq| L) (|:| |op| (|List| F))))
        (SPROG
         ((|rec| (|Record| (|:| |eq| L) (|:| |op| (|List| F)))) (#1=#:G717 NIL)
          (|s| NIL) (#2=#:G716 NIL) (|neweq| (L)) (|sol| (F)))
         (SEQ
          (COND ((NULL |sols|) (CONS |l| NIL))
                ('T
                 (SEQ
                  (LETT |neweq|
                        (SPADCALL |l|
                                  (LETT |sol| (|SPADfirst| |sols|)
                                        . #3=(|REDORDER;ReduceOrder;LLR;3|))
                                  (QREFELT $ 17))
                        . #3#)
                  (LETT |rec|
                        (SPADCALL |neweq|
                                  (PROGN
                                   (LETT #2# NIL . #3#)
                                   (SEQ (LETT |s| NIL . #3#)
                                        (LETT #1# (CDR |sols|) . #3#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |s| (CAR #1#) . #3#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL (QREFELT $ 9)
                                                           (SPADCALL |s| |sol|
                                                                     (QREFELT $
                                                                              18))
                                                           (QREFELT $ 19))
                                                 #2#)
                                                . #3#)))
                                        (LETT #1# (CDR #1#) . #3#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  (QREFELT $ 22))
                        . #3#)
                  (EXIT
                   (CONS (QCAR |rec|)
                         (SPADCALL (QCDR |rec|) |sol| (QREFELT $ 23)))))))))) 

(SDEFUN |REDORDER;ithcoef|
        ((|eq| L) (|i| |Integer|) (|s| |PrimitiveArray| F) ($ F))
        (SPROG ((|ans| (F)) (|j| (|NonNegativeInteger|)))
               (SEQ
                (LETT |ans| (|spadConstant| $ 16) . #1=(|REDORDER;ithcoef|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |eq| (|spadConstant| $ 24) (QREFELT $ 25)))
                       (GO G191)))
                     (SEQ (LETT |j| (SPADCALL |eq| (QREFELT $ 27)) . #1#)
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL
                                           (SPADCALL
                                            (|REDORDER;localbinom| |j| |i| $)
                                            (|REDORDER;locals| |s| |j| |i| $)
                                            (QREFELT $ 28))
                                           (SPADCALL |eq| (QREFELT $ 29))
                                           (QREFELT $ 30))
                                          (QREFELT $ 31))
                                . #1#)
                          (EXIT
                           (LETT |eq| (SPADCALL |eq| (QREFELT $ 32)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))) 

(SDEFUN |REDORDER;ReduceOrder;LFL;5| ((|eq| L) (|sol| F) ($ L))
        (SPROG
         ((|ans| (L)) (#1=#:G732 NIL) (#2=#:G727 NIL) (|i| NIL) (|si| (F))
          (#3=#:G731 NIL) (#4=#:G724 NIL) (|s| (|PrimitiveArray| F))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |s|
                (MAKEARR1
                 (LETT |n| (SPADCALL |eq| (QREFELT $ 27))
                       . #5=(|REDORDER;ReduceOrder;LFL;5|))
                 (|spadConstant| $ 16))
                . #5#)
          (LETT |si| |sol| . #5#) (QSETAREF1 |s| 0 |si|)
          (SEQ (LETT |i| 1 . #5#)
               (LETT #3#
                     (PROG1 (LETT #4# (- |n| 1) . #5#)
                       (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #4#))
                     . #5#)
               G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |s| |i|
                            (LETT |si|
                                  (SPADCALL (QREFELT $ 9) |si| (QREFELT $ 19))
                                  . #5#))))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |ans| (|spadConstant| $ 24) . #5#)
          (SEQ (LETT |i| 0 . #5#)
               (LETT #1#
                     (PROG1 (LETT #2# (- |n| 1) . #5#)
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#))
                     . #5#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ans|
                       (SPADCALL |ans|
                                 (SPADCALL (|REDORDER;ithcoef| |eq| |i| |s| $)
                                           |i| (QREFELT $ 33))
                                 (QREFELT $ 34))
                       . #5#)))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(DECLAIM (NOTINLINE |ReductionOfOrder;|)) 

(DEFUN |ReductionOfOrder| (&REST #1=#:G733)
  (SPROG NIL
         (PROG (#2=#:G734)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ReductionOfOrder|)
                                               '|domainEqualList|)
                    . #3=(|ReductionOfOrder|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ReductionOfOrder;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ReductionOfOrder|)))))))))) 

(DEFUN |ReductionOfOrder;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ReductionOfOrder|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ReductionOfOrder| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 35) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ReductionOfOrder| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL (QREFELT $ 8)))
          $))) 

(MAKEPROP '|ReductionOfOrder| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . D)
              '|diff| (|Boolean|) (|Integer|) (4 . >) (10 . |One|) (14 . |One|)
              (18 . |binomial|) (24 . |Zero|) |REDORDER;ReduceOrder;LFL;5|
              (28 . /) (34 . |elt|) (|Record| (|:| |eq| 7) (|:| |op| 21))
              (|List| 6) |REDORDER;ReduceOrder;LLR;3| (40 . |concat!|)
              (46 . |Zero|) (50 . ~=) (|NonNegativeInteger|) (56 . |degree|)
              (61 . *) (67 . |leadingCoefficient|) (72 . *) (78 . +)
              (84 . |reductum|) (89 . |monomial|) (95 . +))
           '#(|ReduceOrder| 101) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 34
                                                 '(0 7 0 8 2 11 10 0 0 12 0 6 0
                                                   13 0 7 0 14 2 11 0 0 0 15 0
                                                   6 0 16 2 6 0 0 0 18 2 7 6 0
                                                   6 19 2 21 0 0 6 23 0 7 0 24
                                                   2 7 10 0 0 25 1 7 26 0 27 2
                                                   6 0 11 0 28 1 7 6 0 29 2 6 0
                                                   0 0 30 2 6 0 0 0 31 1 7 0 0
                                                   32 2 7 0 6 26 33 2 7 0 0 0
                                                   34 2 0 20 7 21 22 2 0 7 7 6
                                                   17)))))
           '|lookupComplete|)) 
