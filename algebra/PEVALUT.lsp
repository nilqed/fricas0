
(SDEFUN |PEVALUT;eval1a;PIRI;1|
        ((|pol| |Polynomial| (|Integer|)) (|pt| |Integer|)
         (|pss| |Record| (|:| |prime| (|Integer|))
          (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ |Integer|))
        (SPROG
         ((|res| (|Integer|)) (|pk| #1=(|SingleInteger|)) (|ptk| (|Integer|))
          (|ki| #2=(|SingleInteger|)) (|j| NIL) (|i| #1#)
          (|t1|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (|ns| #2#) (|n| (|NonNegativeInteger|))
          (|exps| (|SortedExponentVector|)) (|nexps| (|SortedExponentVector|))
          (|coeffs| (|U32Vector|)) (|ncoeffs| (|U32Vector|))
          (|nn| (|NonNegativeInteger|)) (#3=#:G723 NIL) (|t0| NIL)
          (|polu|
           #4=(|List|
               (|Record| (|:| |k| (|NonNegativeInteger|))
                         (|:| |c| (|Polynomial| (|Integer|))))))
          (#5=#:G722 NIL)
          (|polr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|)) (|:| |ts| #4#))))
          (|p| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (QVELT |pss| 0) . #6=(|PEVALUT;eval1a;PIRI;1|))
                (LETT |polr| |pol| . #6#)
                (EXIT
                 (COND
                  ((QEQCAR |polr| 0)
                   (PROGN (LETT #5# (QCDR |polr|) . #6#) (GO #7=#:G721)))
                  ('T
                   (SEQ (LETT |polu| (QCDR (QCDR |polr|)) . #6#)
                        (LETT |i| 0 . #6#)
                        (LETT |coeffs| (QVELT |pss| 1) . #6#)
                        (LETT |exps| (QVELT |pss| 2) . #6#)
                        (LETT |n| (QV_LEN_U32 |coeffs|) . #6#)
                        (LETT |ns| |n| . #6#)
                        (SEQ (LETT |t0| NIL . #6#) (LETT #3# |polu| . #6#) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |t0| (CAR #3#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (COND
                               ((NULL (|less_SI| |i| |ns|))
                                (SEQ
                                 (LETT |nn| (SPADCALL 2 |n| (QREFELT $ 8))
                                       . #6#)
                                 (LETT |ncoeffs| (GETREFV_U32 |nn| 0) . #6#)
                                 (SPADCALL |ncoeffs| |coeffs| |n|
                                           (QREFELT $ 13))
                                 (LETT |coeffs| |ncoeffs| . #6#)
                                 (QSETVELT |pss| 1 |coeffs|)
                                 (LETT |nexps| (GETREFV_U32 |nn| 0) . #6#)
                                 (SPADCALL |nexps| |exps| |n| (QREFELT $ 13))
                                 (LETT |exps| |nexps| . #6#)
                                 (QSETVELT |pss| 2 |exps|)
                                 (LETT |n| |nn| . #6#)
                                 (EXIT (LETT |ns| |n| . #6#)))))
                              (LETT |t1| (QCDR |t0|) . #6#)
                              (SETELT_U32 |exps| |i| (QCAR |t0|))
                              (COND
                               ((QEQCAR |t1| 0)
                                (SETELT_U32 |coeffs| |i| (QCDR |t1|)))
                               ('T
                                (|error| "More than one variable in eval1a")))
                              (EXIT (LETT |i| (|add_SI| |i| 1) . #6#)))
                             (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |res| 0 . #6#) (LETT |ptk| 1 . #6#)
                        (LETT |pk| 0 . #6#)
                        (SEQ (LETT |j| (|sub_SI| |i| 1) . #6#) G190
                             (COND ((< |j| 0) (GO G191)))
                             (SEQ (LETT |ki| (ELT_U32 |exps| |j|) . #6#)
                                  (SEQ G190
                                       (COND
                                        ((NULL (|less_SI| |pk| |ki|))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |ptk| (QSMULMOD32 |ptk| |pt| |p|)
                                              . #6#)
                                        (EXIT
                                         (LETT |pk| (|add_SI| |pk| 1) . #6#)))
                                       NIL (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (LETT |res|
                                         (QSMULADDMOD64-32 |ptk|
                                                           (ELT_U32 |coeffs|
                                                                    |j|)
                                                           |res| |p|)
                                         . #6#)))
                             (LETT |j| (+ |j| -1) . #6#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|)))))))
          #7# (EXIT #5#)))) 

(SDEFUN |PEVALUT;eval1;PSIRP;2|
        ((|pol| |Polynomial| (|Integer|)) (|vv| |Symbol|) (|pt| |Integer|)
         (|pss| |Record| (|:| |prime| (|Integer|))
          (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|xr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (|yu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|c1| (|Polynomial| (|Integer|)))
          (|t1|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (#1=#:G752 NIL) (|t0| NIL)
          (|xu|
           #2=(|List|
               (|Record| (|:| |k| (|NonNegativeInteger|))
                         (|:| |c| (|Polynomial| (|Integer|))))))
          (#3=#:G751 NIL) (|vx| #4=(|Symbol|))
          (|polr|
           (|Union| (|Integer|) (|Record| (|:| |v| #4#) (|:| |ts| #2#)))))
         (SEQ
          (EXIT
           (SEQ (LETT |polr| |pol| . #5=(|PEVALUT;eval1;PSIRP;2|))
                (EXIT
                 (COND
                  ((QEQCAR |polr| 0)
                   (PROGN (LETT #3# |pol| . #5#) (GO #6=#:G750)))
                  (#7='T
                   (SEQ (LETT |vx| (QCAR (QCDR |polr|)) . #5#)
                        (EXIT
                         (COND
                          ((EQUAL |vx| |vv|)
                           (PROGN
                            (LETT #3#
                                  (SPADCALL
                                   (SPADCALL |pol| |pt| |pss| (QREFELT $ 16))
                                   (QREFELT $ 17))
                                  . #5#)
                            (GO #6#)))
                          (#7#
                           (SEQ (LETT |xu| (QCDR (QCDR |polr|)) . #5#)
                                (LETT |yu| NIL . #5#)
                                (SEQ (LETT |t0| NIL . #5#)
                                     (LETT #1# |xu| . #5#) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |t0| (CAR #1#) . #5#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ (LETT |t1| (QCDR |t0|) . #5#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |t1| 0)
                                             (LETT |yu|
                                                   (CONS
                                                    (CONS (QCAR |t0|)
                                                          (QCDR |t0|))
                                                    |yu|)
                                                   . #5#))
                                            ('T
                                             (SEQ
                                              (LETT |c1|
                                                    (SPADCALL (QCDR |t0|) |vv|
                                                              |pt| |pss|
                                                              (QREFELT $ 19))
                                                    . #5#)
                                              (EXIT
                                               (COND
                                                ((SPADCALL |c1|
                                                           (|spadConstant| $
                                                                           20)
                                                           (QREFELT $ 22))
                                                 0)
                                                ('T
                                                 (LETT |yu|
                                                       (CONS
                                                        (CONS (QCAR |t0|) |c1|)
                                                        |yu|)
                                                       . #5#)))))))))
                                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |xr|
                                      (COND
                                       ((SPADCALL |yu| NIL (QREFELT $ 25))
                                        (CONS 0 0))
                                       (#7#
                                        (CONS 1 (CONS |vx| (NREVERSE |yu|)))))
                                      . #5#)
                                (EXIT (SETF |xr| |xr|))))))))))))
          #6# (EXIT #3#)))) 

(SDEFUN |PEVALUT;eval1;RSIRU;3|
        ((|pol| |Record| (|:| |numer| (|Polynomial| (|Integer|)))
          (|:| |denom| (|Polynomial| (|Integer|))))
         (|vv| |Symbol|) (|pt| |Integer|)
         (|pss| |Record| (|:| |prime| (|Integer|))
          (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ |Union|
          (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                    (|:| |denom| (|Polynomial| (|Integer|))))
          "failed"))
        (SPROG ((|d| (|Polynomial| (|Integer|))))
               (SEQ
                (LETT |d|
                      (SPADCALL (QCDR |pol|) |vv| |pt| |pss| (QREFELT $ 19))
                      |PEVALUT;eval1;RSIRU;3|)
                (EXIT
                 (COND
                  ((SPADCALL |d| (|spadConstant| $ 20) (QREFELT $ 22))
                   (CONS 1 "failed"))
                  ('T
                   (CONS 0
                         (CONS
                          (SPADCALL (QCAR |pol|) |vv| |pt| |pss|
                                    (QREFELT $ 19))
                          |d|)))))))) 

(SDEFUN |PEVALUT;modpreduction;PIP;4|
        ((|x| |Polynomial| (|Integer|)) (|p| |Integer|)
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|xr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (|yu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|c1| (|Polynomial| (|Integer|))) (|c0| (|Integer|))
          (|t1|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (#1=#:G782 NIL) (|t0| NIL)
          (|xu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|vx| (|Symbol|)))
         (SEQ (LETT |xr| |x| . #2=(|PEVALUT;modpreduction;PIP;4|))
              (EXIT
               (COND
                ((QEQCAR |xr| 0)
                 (SEQ
                  (LETT |c0| (SPADCALL (QCDR |xr|) |p| (QREFELT $ 29)) . #2#)
                  (LETT |xr| (CONS 0 |c0|) . #2#) (EXIT (SETF |xr| |xr|))))
                (#3='T
                 (SEQ (LETT |vx| (QCAR (QCDR |xr|)) . #2#)
                      (LETT |xu| (QCDR (QCDR |xr|)) . #2#)
                      (LETT |yu| NIL . #2#)
                      (SEQ (LETT |t0| NIL . #2#) (LETT #1# |xu| . #2#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |t0| (CAR #1#) . #2#) NIL))
                             (GO G191)))
                           (SEQ (LETT |t1| (QCDR |t0|) . #2#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |t1| 0)
                                   (SEQ
                                    (LETT |c0|
                                          (SPADCALL (QCDR |t1|) |p|
                                                    (QREFELT $ 29))
                                          . #2#)
                                    (EXIT
                                     (COND ((EQL |c0| 0) 0)
                                           ('T
                                            (SEQ
                                             (LETT |xr| (CONS 0 |c0|) . #2#)
                                             (EXIT
                                              (LETT |yu|
                                                    (CONS
                                                     (CONS (QCAR |t0|)
                                                           (SETF |xr| |xr|))
                                                     |yu|)
                                                    . #2#))))))))
                                  ('T
                                   (SEQ
                                    (LETT |c1|
                                          (SPADCALL (QCDR |t0|) |p|
                                                    (QREFELT $ 30))
                                          . #2#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |c1| (|spadConstant| $ 20)
                                                 (QREFELT $ 22))
                                       0)
                                      ('T
                                       (LETT |yu|
                                             (CONS (CONS (QCAR |t0|) |c1|)
                                                   |yu|)
                                             . #2#)))))))))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |xr|
                            (COND
                             ((SPADCALL |yu| NIL (QREFELT $ 25)) (CONS 0 0))
                             (#3# (CONS 1 (CONS |vx| (NREVERSE |yu|)))))
                            . #2#)
                      (EXIT (SETF |xr| |xr|))))))))) 

(SDEFUN |PEVALUT;modpreduction;FIU;5|
        ((|x| |Fraction| (|Polynomial| (|Integer|))) (|p| |Integer|)
         ($ |Union|
          (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                    (|:| |denom| (|Polynomial| (|Integer|))))
          "failed"))
        (SPROG ((|d| (|Polynomial| (|Integer|))))
               (SEQ
                (LETT |d|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 32)) |p|
                                (QREFELT $ 30))
                      |PEVALUT;modpreduction;FIU;5|)
                (EXIT
                 (COND
                  ((SPADCALL |d| (|spadConstant| $ 20) (QREFELT $ 22))
                   (CONS 1 "failed"))
                  ('T
                   (CONS 0
                         (CONS
                          (SPADCALL (SPADCALL |x| (QREFELT $ 34)) |p|
                                    (QREFELT $ 30))
                          |d|)))))))) 

(SDEFUN |PEVALUT;modpeval;PLL2I;6|
        ((|x| |Polynomial| (|Integer|)) (|vars| |List| (|Symbol|))
         (|pts| |List| (|Integer|)) (|p| |Integer|) ($ |Integer|))
        (SPROG
         ((|res| #1=(|Integer|)) (|c0| (|Integer|)) (|kk| #1#)
          (|ptk| (|Integer|)) (|kk1| (|NonNegativeInteger|))
          (|t1|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (#2=#:G808 NIL) (|t0| NIL)
          (|xu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|yu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|vxval| (|Integer|)) (#3=#:G807 NIL) (|vx| (|Symbol|))
          (|xr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|))))))))))
         (SEQ
          (EXIT
           (SEQ (LETT |xr| |x| . #4=(|PEVALUT;modpeval;PLL2I;6|))
                (EXIT
                 (COND
                  ((QEQCAR |xr| 0)
                   (PROGN
                    (LETT #3# (SPADCALL (QCDR |xr|) |p| (QREFELT $ 29)) . #4#)
                    (GO #5=#:G806)))
                  (#6='T
                   (SEQ (LETT |vx| (QCAR (QCDR |xr|)) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |vx| (|SPADfirst| |vars|) (QREFELT $ 36))
                           (PROGN
                            (LETT #3#
                                  (SPADCALL |x| (CDR |vars|) (CDR |pts|) |p|
                                            (QREFELT $ 39))
                                  . #4#)
                            (GO #5#)))
                          (#6#
                           (SEQ (LETT |vxval| (|SPADfirst| |pts|) . #4#)
                                (LETT |vars| (CDR |vars|) . #4#)
                                (LETT |pts| (CDR |pts|) . #4#)
                                (LETT |xu| (QCDR (QCDR |xr|)) . #4#)
                                (LETT |yu| NIL . #4#) (LETT |ptk| 1 . #4#)
                                (LETT |kk| 0 . #4#) (LETT |res| 0 . #4#)
                                (LETT |xu| (REVERSE |xu|) . #4#)
                                (SEQ (LETT |t0| NIL . #4#)
                                     (LETT #2# |xu| . #4#) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN
                                            (LETT |t0| (CAR #2#) . #4#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ (LETT |t1| (QCDR |t0|) . #4#)
                                          (LETT |kk1| (QCAR |t0|) . #4#)
                                          (SEQ G190
                                               (COND
                                                ((NULL (< |kk| |kk1|))
                                                 (GO G191)))
                                               (SEQ
                                                (LETT |ptk|
                                                      (QSMULMOD32 |vxval| |ptk|
                                                                  |p|)
                                                      . #4#)
                                                (EXIT
                                                 (LETT |kk| (+ |kk| 1) . #4#)))
                                               NIL (GO G190) G191 (EXIT NIL))
                                          (LETT |c0|
                                                (COND
                                                 ((QEQCAR |t1| 0)
                                                  (SPADCALL (QCDR |t1|) |p|
                                                            (QREFELT $ 29)))
                                                 ('T
                                                  (SPADCALL (QCDR |t0|) |vars|
                                                            |pts| |p|
                                                            (QREFELT $ 39))))
                                                . #4#)
                                          (EXIT
                                           (LETT |res|
                                                 (QSMULADDMOD64-32 |ptk| |c0|
                                                                   |res| |p|)
                                                 . #4#)))
                                     (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT |res|)))))))))))
          #5# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |PolynomialEvaluationUtilities;|)) 

(DEFUN |PolynomialEvaluationUtilities| ()
  (SPROG NIL
         (PROG (#1=#:G810)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|PolynomialEvaluationUtilities|)
                    . #2=(|PolynomialEvaluationUtilities|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|PolynomialEvaluationUtilities|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|PolynomialEvaluationUtilities;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|PolynomialEvaluationUtilities|)))))))))) 

(DEFUN |PolynomialEvaluationUtilities;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|PolynomialEvaluationUtilities|)
                . #1=(|PolynomialEvaluationUtilities|))
          (LETT $ (GETREFV 40) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PolynomialEvaluationUtilities| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PolynomialEvaluationUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|PositiveInteger|)
              (|NonNegativeInteger|) (0 . *) (|Void|) (|U32Vector|) (|Integer|)
              (|U32VectorPolynomialOperations|) (6 . |copy_first|)
              (|Polynomial| 11)
              (|Record| (|:| |prime| 11) (|:| |eval1coeffbuf| 10)
                        (|:| |eval1expbuf| (|SortedExponentVector|)))
              |PEVALUT;eval1a;PIRI;1| (13 . |coerce|) (|Symbol|)
              |PEVALUT;eval1;PSIRP;2| (18 . |Zero|) (|Boolean|) (22 . =)
              (|Record| (|:| |k| 7) (|:| |c| 14)) (|List| 23) (28 . =)
              (|Record| (|:| |numer| 14) (|:| |denom| 14))
              (|Union| 26 '"failed") |PEVALUT;eval1;RSIRU;3|
              (34 . |positiveRemainder|) |PEVALUT;modpreduction;PIP;4|
              (|Fraction| 14) (40 . |denom|) (45 . |Zero|) (49 . |numer|)
              |PEVALUT;modpreduction;FIU;5| (54 . ~=) (|List| 18) (|List| 11)
              |PEVALUT;modpeval;PLL2I;6|)
           '#(|modpreduction| 60 |modpeval| 72 |eval1a| 80 |eval1| 87) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 39
                                                 '(2 7 0 6 0 8 3 12 9 10 10 11
                                                   13 1 14 0 11 17 0 14 0 20 2
                                                   14 21 0 0 22 2 24 21 0 0 25
                                                   2 11 0 0 0 29 1 31 14 0 32 0
                                                   31 0 33 1 31 14 0 34 2 18 21
                                                   0 0 36 2 0 14 14 11 30 2 0
                                                   27 31 11 35 4 0 11 14 37 38
                                                   11 39 3 0 11 14 11 15 16 4 0
                                                   27 26 18 11 15 28 4 0 14 14
                                                   18 11 15 19)))))
           '|lookupComplete|)) 

(MAKEPROP '|PolynomialEvaluationUtilities| 'NILADIC T) 
