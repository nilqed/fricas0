
(SDEFUN |SYMFUNC;coef_vect|
        ((|p| |SparseUnivariatePolynomial| R) (|n| |NonNegativeInteger|)
         ($ |Vector| R))
        (SPADCALL (SPADCALL |p| |n| (QREFELT $ 10)) (QREFELT $ 11))) 

(SDEFUN |SYMFUNC;symFunc;RPiV;2|
        ((|x| R) (|n| |PositiveInteger|) ($ |Vector| R))
        (|SYMFUNC;coef_vect|
         (SPADCALL
          (SPADCALL (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 13))
                    (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 15))
          |n| (QREFELT $ 16))
         |n| $)) 

(SDEFUN |SYMFUNC;symFunc;LV;3| ((|l| |List| R) ($ |Vector| R))
        (SPROG
         ((#1=#:G700 NIL) (#2=#:G699 #3=(|SparseUnivariatePolynomial| R))
          (#4=#:G701 #3#) (#5=#:G707 NIL) (|a| NIL))
         (SEQ
          (|SYMFUNC;coef_vect|
           (PROGN
            (LETT #1# NIL . #6=(|SYMFUNC;symFunc;LV;3|))
            (SEQ (LETT |a| NIL . #6#) (LETT #5# |l| . #6#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4#
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 13))
                           (SPADCALL |a| (QREFELT $ 14)) (QREFELT $ 15))
                          . #6#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 20)) . #6#))
                     ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                 (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 19))))
           (LENGTH |l|) $)))) 

(DECLAIM (NOTINLINE |SymmetricFunctions;|)) 

(DEFUN |SymmetricFunctions| (#1=#:G708)
  (SPROG NIL
         (PROG (#2=#:G709)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SymmetricFunctions|)
                                               '|domainEqualList|)
                    . #3=(|SymmetricFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SymmetricFunctions;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SymmetricFunctions|)))))))))) 

(DEFUN |SymmetricFunctions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SymmetricFunctions|))
          (LETT |dv$| (LIST '|SymmetricFunctions| DV$1) . #1#)
          (LETT $ (GETREFV 23) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SymmetricFunctions| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SymmetricFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Vector| 6)
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 6)
              (0 . |vectorise|) (6 . |reverse!|) (11 . |One|) (15 . |monomial|)
              (21 . |coerce|) (26 . +) (32 . ^) (|PositiveInteger|)
              |SYMFUNC;symFunc;RPiV;2| (38 . |One|) (42 . *) (|List| 6)
              |SYMFUNC;symFunc;LV;3|)
           '#(|symFunc| 48) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 22
                                                 '(2 9 7 0 8 10 1 7 0 0 11 0 6
                                                   0 12 2 9 0 6 8 13 1 9 0 6 14
                                                   2 9 0 0 0 15 2 9 0 0 8 16 0
                                                   9 0 19 2 9 0 0 0 20 2 0 7 6
                                                   17 18 1 0 7 21 22)))))
           '|lookupComplete|)) 
