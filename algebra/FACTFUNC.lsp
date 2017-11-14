
(SDEFUN |FACTFUNC;nthRoot;FNniR;1|
        ((|ff| |Factored| M) (|n| |NonNegativeInteger|)
         ($ |Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| M)
          (|:| |radicand| (|List| M))))
        (SPROG
         ((#1=#:G743 NIL) (|radi| (|List| M)) (|coeff| (M))
          (|qr|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#2=#:G727 NIL) (#3=#:G746 NIL) (|term| NIL)
          (|d| (|NonNegativeInteger|)) (#4=#:G725 NIL) (#5=#:G723 NIL)
          (#6=#:G745 NIL) (|t| NIL) (#7=#:G744 NIL)
          (|lf|
           (|List| (|Record| (|:| |factor| M) (|:| |exponent| (|Integer|))))))
         (SEQ
          (LETT |coeff| (|spadConstant| $ 7) . #8=(|FACTFUNC;nthRoot;FNniR;1|))
          (LETT |radi|
                (COND
                 ((SPADCALL (SPADCALL |ff| (QREFELT $ 9)) (|spadConstant| $ 7)
                            (QREFELT $ 11))
                  NIL)
                 (#9='T (LIST (SPADCALL |ff| (QREFELT $ 9)))))
                . #8#)
          (LETT |lf| (SPADCALL |ff| (QREFELT $ 14)) . #8#)
          (LETT |d|
                (COND
                 ((NULL |radi|)
                  (PROG1
                      (LETT #4#
                            (SPADCALL
                             (CONS |n|
                                   (PROGN
                                    (LETT #7# NIL . #8#)
                                    (SEQ (LETT |t| NIL . #8#)
                                         (LETT #6# |lf| . #8#) G190
                                         (COND
                                          ((OR (ATOM #6#)
                                               (PROGN
                                                (LETT |t| (CAR #6#) . #8#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #7#
                                                 (CONS
                                                  (PROG1
                                                      (LETT #5# (QCDR |t|)
                                                            . #8#)
                                                    (|check_subtype2|
                                                     (>= #5# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #5#))
                                                  #7#)
                                                 . #8#)))
                                         (LETT #6# (CDR #6#) . #8#) (GO G190)
                                         G191 (EXIT (NREVERSE #7#)))))
                             (QREFELT $ 17))
                            . #8#)
                    (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #4#)))
                 (#9# 1))
                . #8#)
          (LETT |n| (QUOTIENT2 |n| |d|) . #8#)
          (SEQ (LETT |term| NIL . #8#) (LETT #3# |lf| . #8#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |term| (CAR #3#) . #8#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |qr|
                        (DIVIDE2
                         (QUOTIENT2
                          (PROG1 (LETT #2# (QCDR |term|) . #8#)
                            (|check_subtype2| (>= #2# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #2#))
                          |d|)
                         |n|)
                        . #8#)
                  (LETT |coeff|
                        (SPADCALL |coeff|
                                  (SPADCALL (QCAR |term|) (QCAR |qr|)
                                            (QREFELT $ 19))
                                  (QREFELT $ 20))
                        . #8#)
                  (EXIT
                   (COND
                    ((NULL (ZEROP (QCDR |qr|)))
                     (PROGN
                      (LETT #1#
                            (LETT |radi|
                                  (SPADCALL |radi|
                                            (SPADCALL (QCAR |term|) (QCDR |qr|)
                                                      (QREFELT $ 19))
                                            (QREFELT $ 22))
                                  . #8#)
                            . #8#)
                      (GO #10=#:G738)))))))
                #10# (EXIT #1#))
               (LETT #3# (CDR #3#) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |n| |coeff| |radi|))))) 

(SDEFUN |FACTFUNC;log;FL;2|
        ((|ff| |Factored| M)
         ($ |List|
          (|Record| (|:| |coef| (|NonNegativeInteger|)) (|:| |logand| M))))
        (SPROG
         ((#1=#:G749 NIL) (#2=#:G756 NIL) (|term| NIL) (#3=#:G755 NIL)
          (|ans| (M)))
         (SEQ
          (LETT |ans| (SPADCALL |ff| (QREFELT $ 9)) . #4=(|FACTFUNC;log;FL;2|))
          (EXIT
           (CONS (CONS 1 (SPADCALL |ff| (QREFELT $ 9)))
                 (PROGN
                  (LETT #3# NIL . #4#)
                  (SEQ (LETT |term| NIL . #4#)
                       (LETT #2# (SPADCALL |ff| (QREFELT $ 14)) . #4#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |term| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3#
                               (CONS
                                (CONS
                                 (PROG1 (LETT #1# (QCDR |term|) . #4#)
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 (QCAR |term|))
                                #3#)
                               . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))))))) 

(DECLAIM (NOTINLINE |FactoredFunctions;|)) 

(DEFUN |FactoredFunctions| (#1=#:G757)
  (SPROG NIL
         (PROG (#2=#:G758)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FactoredFunctions|)
                                               '|domainEqualList|)
                    . #3=(|FactoredFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FactoredFunctions;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FactoredFunctions|)))))))))) 

(DEFUN |FactoredFunctions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FactoredFunctions|))
          (LETT |dv$| (LIST '|FactoredFunctions| DV$1) . #1#)
          (LETT $ (GETREFV 29) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FactoredFunctions| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FactoredFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (|Factored| 6)
              (4 . |unit|) (|Boolean|) (9 . =)
              (|Record| (|:| |factor| 6) (|:| |exponent| 16)) (|List| 12)
              (15 . |factors|) (|List| $) (|Integer|) (20 . |gcd|)
              (|NonNegativeInteger|) (25 . ^) (31 . *) (|List| 6)
              (37 . |concat!|)
              (|Record| (|:| |exponent| 18) (|:| |coef| 6) (|:| |radicand| 21))
              |FACTFUNC;nthRoot;FNniR;1| (43 . |One|)
              (|Record| (|:| |coef| 18) (|:| |logand| 6)) (|List| 26)
              |FACTFUNC;log;FL;2|)
           '#(|nthRoot| 47 |log| 53) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(0 6 0 7 1 8 6 0 9 2 6 10 0 0
                                                   11 1 8 13 0 14 1 16 0 15 17
                                                   2 6 0 0 18 19 2 6 0 0 0 20 2
                                                   21 0 0 6 22 0 8 0 25 2 0 23
                                                   8 18 24 1 0 27 8 28)))))
           '|lookupComplete|)) 
