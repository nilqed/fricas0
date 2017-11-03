
(SDEFUN |NEWTON;differences| ((|yl| |List| F) ($ |List| F))
        (SPROG
         ((#1=#:G705 NIL) (|y1| NIL) (#2=#:G706 NIL) (|y2| NIL)
          (#3=#:G704 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL . #4=(|NEWTON;differences|))
           (SEQ (LETT |y2| NIL . #4#) (LETT #2# (CDR |yl|) . #4#)
                (LETT |y1| NIL . #4#) (LETT #1# |yl| . #4#) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |y1| (CAR #1#) . #4#) NIL)
                      (ATOM #2#) (PROGN (LETT |y2| (CAR #2#) . #4#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #3# (CONS (SPADCALL |y2| |y1| (QREFELT $ 7)) #3#)
                        . #4#)))
                (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
                (GO G190) G191 (EXIT (NREVERSE #3#))))))) 

(SDEFUN |NEWTON;newtonAux|
        ((|k| F) (|fact| F) (|yl| |List| F) ($ |SparseUnivariatePolynomial| F))
        (SPROG ((#1=#:G718 NIL))
               (COND
                ((NULL (CDR |yl|))
                 (SPADCALL
                  (PROG2
                      (LETT #1#
                            (SPADCALL (SPADCALL |yl| 1 (QREFELT $ 16)) |fact|
                                      (QREFELT $ 18))
                            . #2=(|NEWTON;newtonAux|))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) #3="failed") #1#))
                  (QREFELT $ 19)))
                ('T
                 (SPADCALL
                  (SPADCALL
                   (PROG2
                       (LETT #1#
                             (SPADCALL (SPADCALL |yl| 1 (QREFELT $ 16)) |fact|
                                       (QREFELT $ 18))
                             . #2#)
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                     (|Union| (QREFELT $ 6) #3#) #1#))
                   (QREFELT $ 19))
                  (SPADCALL
                   (SPADCALL (QREFELT $ 13) (SPADCALL |k| (QREFELT $ 19))
                             (QREFELT $ 20))
                   (|NEWTON;newtonAux|
                    (SPADCALL |k| (|spadConstant| $ 8) (QREFELT $ 21))
                    (SPADCALL |fact| |k| (QREFELT $ 22))
                    (|NEWTON;differences| |yl| $) $)
                   (QREFELT $ 23))
                  (QREFELT $ 24)))))) 

(SDEFUN |NEWTON;newton;LSup;3|
        ((|yl| |List| F) ($ |SparseUnivariatePolynomial| F))
        (|NEWTON;newtonAux| (|spadConstant| $ 8) (|spadConstant| $ 8) |yl| $)) 

(DECLAIM (NOTINLINE |NewtonInterpolation;|)) 

(DEFUN |NewtonInterpolation| (#1=#:G727)
  (SPROG NIL
         (PROG (#2=#:G728)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NewtonInterpolation|)
                                               '|domainEqualList|)
                    . #3=(|NewtonInterpolation|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|NewtonInterpolation;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|NewtonInterpolation|)))))))))) 

(DEFUN |NewtonInterpolation;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|NewtonInterpolation|))
          (LETT |dv$| (LIST '|NewtonInterpolation| DV$1) . #1#)
          (LETT $ (GETREFV 26) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|NewtonInterpolation| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 13 (SPADCALL (|spadConstant| $ 8) 1 (QREFELT $ 12)))
          $))) 

(MAKEPROP '|NewtonInterpolation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . -) (6 . |One|)
              (|SparseUnivariatePolynomial| 6) (10 . |One|)
              (|NonNegativeInteger|) (14 . |monomial|) '|z| (|Integer|)
              (|List| 6) (20 . |elt|) (|Union| $ '"failed") (26 . |exquo|)
              (32 . |coerce|) (37 . -) (43 . +) (49 . *) (55 . *) (61 . +)
              |NEWTON;newton;LSup;3|)
           '#(|newton| 67) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 25
                                                 '(2 6 0 0 0 7 0 6 0 8 0 9 0 10
                                                   2 9 0 6 11 12 2 15 6 0 14 16
                                                   2 6 17 0 0 18 1 9 0 6 19 2 9
                                                   0 0 0 20 2 6 0 0 0 21 2 6 0
                                                   0 0 22 2 9 0 0 0 23 2 9 0 0
                                                   0 24 1 0 9 15 25)))))
           '|lookupComplete|)) 
