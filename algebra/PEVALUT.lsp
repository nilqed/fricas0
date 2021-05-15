
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
          (|nn| (|NonNegativeInteger|)) (#3=#:G397 NIL) (|t0| NIL)
          (|polu|
           #4=(|List|
               (|Record| (|:| |k| (|NonNegativeInteger|))
                         (|:| |c| (|Polynomial| (|Integer|))))))
          (#5=#:G396 NIL)
          (|polr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|)) (|:| |ts| #4#))))
          (|p| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (QVELT |pss| 0)) (LETT |polr| |pol|)
                (EXIT
                 (COND
                  ((QEQCAR |polr| 0)
                   (PROGN (LETT #5# (QCDR |polr|)) (GO #6=#:G395)))
                  ('T
                   (SEQ (LETT |polu| (QCDR (QCDR |polr|))) (LETT |i| 0)
                        (LETT |coeffs| (QVELT |pss| 1))
                        (LETT |exps| (QVELT |pss| 2))
                        (LETT |n| (QV_LEN_U32 |coeffs|)) (LETT |ns| |n|)
                        (SEQ (LETT |t0| NIL) (LETT #3# |polu|) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |t0| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (COND
                               ((NULL (|less_SI| |i| |ns|))
                                (SEQ (LETT |nn| (* 2 |n|))
                                     (LETT |ncoeffs| (GETREFV_U32 |nn| 0))
                                     (SPADCALL |ncoeffs| |coeffs| |n|
                                               (QREFELT $ 10))
                                     (LETT |coeffs| |ncoeffs|)
                                     (QSETVELT |pss| 1 |coeffs|)
                                     (LETT |nexps| (GETREFV_U32 |nn| 0))
                                     (SPADCALL |nexps| |exps| |n|
                                               (QREFELT $ 10))
                                     (LETT |exps| |nexps|)
                                     (QSETVELT |pss| 2 |exps|) (LETT |n| |nn|)
                                     (EXIT (LETT |ns| |n|)))))
                              (LETT |t1| (QCDR |t0|))
                              (SETELT_U32 |exps| |i| (QCAR |t0|))
                              (COND
                               ((QEQCAR |t1| 0)
                                (SETELT_U32 |coeffs| |i| (QCDR |t1|)))
                               ('T
                                (|error| "More than one variable in eval1a")))
                              (EXIT (LETT |i| (|add_SI| |i| 1))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (LETT |res| 0) (LETT |ptk| 1) (LETT |pk| 0)
                        (SEQ (LETT |j| (|sub_SI| |i| 1)) G190
                             (COND ((< |j| 0) (GO G191)))
                             (SEQ (LETT |ki| (ELT_U32 |exps| |j|))
                                  (SEQ G190
                                       (COND
                                        ((NULL (|less_SI| |pk| |ki|))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |ptk|
                                              (QSMULMOD32 |ptk| |pt| |p|))
                                        (EXIT (LETT |pk| (|add_SI| |pk| 1))))
                                       NIL (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (LETT |res|
                                         (QSMULADDMOD64_32 |ptk|
                                                           (ELT_U32 |coeffs|
                                                                    |j|)
                                                           |res| |p|))))
                             (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
                        (EXIT |res|)))))))
          #6# (EXIT #5#)))) 

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
          (#1=#:G417 NIL) (|t0| NIL)
          (|xu|
           #2=(|List|
               (|Record| (|:| |k| (|NonNegativeInteger|))
                         (|:| |c| (|Polynomial| (|Integer|))))))
          (#3=#:G416 NIL) (|vx| #4=(|Symbol|))
          (|polr|
           (|Union| (|Integer|) (|Record| (|:| |v| #4#) (|:| |ts| #2#)))))
         (SEQ
          (EXIT
           (SEQ (LETT |polr| |pol|)
                (EXIT
                 (COND
                  ((QEQCAR |polr| 0) (PROGN (LETT #3# |pol|) (GO #5=#:G415)))
                  (#6='T
                   (SEQ (LETT |vx| (QCAR (QCDR |polr|)))
                        (EXIT
                         (COND
                          ((EQUAL |vx| |vv|)
                           (PROGN
                            (LETT #3#
                                  (SPADCALL
                                   (SPADCALL |pol| |pt| |pss| (QREFELT $ 13))
                                   (QREFELT $ 14)))
                            (GO #5#)))
                          (#6#
                           (SEQ (LETT |xu| (QCDR (QCDR |polr|)))
                                (LETT |yu| NIL)
                                (SEQ (LETT |t0| NIL) (LETT #1# |xu|) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |t0| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ (LETT |t1| (QCDR |t0|))
                                          (EXIT
                                           (COND
                                            ((QEQCAR |t1| 0)
                                             (LETT |yu|
                                                   (CONS
                                                    (CONS (QCAR |t0|)
                                                          (QCDR |t0|))
                                                    |yu|)))
                                            ('T
                                             (SEQ
                                              (LETT |c1|
                                                    (SPADCALL (QCDR |t0|) |vv|
                                                              |pt| |pss|
                                                              (QREFELT $ 16)))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |c1|
                                                           (|spadConstant| $
                                                                           17)
                                                           (QREFELT $ 19))
                                                 0)
                                                ('T
                                                 (LETT |yu|
                                                       (CONS
                                                        (CONS (QCAR |t0|) |c1|)
                                                        |yu|))))))))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |xr|
                                      (COND
                                       ((SPADCALL |yu| NIL (QREFELT $ 22))
                                        (CONS 0 0))
                                       (#6#
                                        (CONS 1 (CONS |vx| (NREVERSE |yu|))))))
                                (EXIT |xr|)))))))))))
          #5# (EXIT #3#)))) 

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
                      (SPADCALL (QCDR |pol|) |vv| |pt| |pss| (QREFELT $ 16)))
                (EXIT
                 (COND
                  ((SPADCALL |d| (|spadConstant| $ 17) (QREFELT $ 19))
                   (CONS 1 "failed"))
                  ('T
                   (CONS 0
                         (CONS
                          (SPADCALL (QCAR |pol|) |vv| |pt| |pss|
                                    (QREFELT $ 16))
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
          (#1=#:G447 NIL) (|t0| NIL)
          (|xu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|vx| (|Symbol|)))
         (SEQ (LETT |xr| |x|)
              (EXIT
               (COND
                ((QEQCAR |xr| 0)
                 (SEQ (LETT |c0| (SPADCALL (QCDR |xr|) |p| (QREFELT $ 26)))
                      (LETT |xr| (CONS 0 |c0|)) (EXIT |xr|)))
                (#2='T
                 (SEQ (LETT |vx| (QCAR (QCDR |xr|)))
                      (LETT |xu| (QCDR (QCDR |xr|))) (LETT |yu| NIL)
                      (SEQ (LETT |t0| NIL) (LETT #1# |xu|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |t0| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |t1| (QCDR |t0|))
                                (EXIT
                                 (COND
                                  ((QEQCAR |t1| 0)
                                   (SEQ
                                    (LETT |c0|
                                          (SPADCALL (QCDR |t1|) |p|
                                                    (QREFELT $ 26)))
                                    (EXIT
                                     (COND ((EQL |c0| 0) 0)
                                           ('T
                                            (SEQ (LETT |xr| (CONS 0 |c0|))
                                                 (EXIT
                                                  (LETT |yu|
                                                        (CONS
                                                         (CONS (QCAR |t0|)
                                                               |xr|)
                                                         |yu|)))))))))
                                  ('T
                                   (SEQ
                                    (LETT |c1|
                                          (SPADCALL (QCDR |t0|) |p|
                                                    (QREFELT $ 27)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |c1| (|spadConstant| $ 17)
                                                 (QREFELT $ 19))
                                       0)
                                      ('T
                                       (LETT |yu|
                                             (CONS (CONS (QCAR |t0|) |c1|)
                                                   |yu|))))))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |xr|
                            (COND
                             ((SPADCALL |yu| NIL (QREFELT $ 22)) (CONS 0 0))
                             (#2# (CONS 1 (CONS |vx| (NREVERSE |yu|))))))
                      (EXIT |xr|)))))))) 

(SDEFUN |PEVALUT;modpreduction;FIU;5|
        ((|x| |Fraction| (|Polynomial| (|Integer|))) (|p| |Integer|)
         ($ |Union|
          (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                    (|:| |denom| (|Polynomial| (|Integer|))))
          "failed"))
        (SPROG ((|d| (|Polynomial| (|Integer|))))
               (SEQ
                (LETT |d|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 29)) |p|
                                (QREFELT $ 27)))
                (EXIT
                 (COND
                  ((SPADCALL |d| (|spadConstant| $ 17) (QREFELT $ 19))
                   (CONS 1 "failed"))
                  ('T
                   (CONS 0
                         (CONS
                          (SPADCALL (SPADCALL |x| (QREFELT $ 31)) |p|
                                    (QREFELT $ 27))
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
          (#2=#:G469 NIL) (|t0| NIL)
          (|xu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|yu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|vxval| (|Integer|)) (#3=#:G468 NIL) (|vx| (|Symbol|))
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
           (SEQ (LETT |xr| |x|)
                (EXIT
                 (COND
                  ((QEQCAR |xr| 0)
                   (PROGN
                    (LETT #3# (SPADCALL (QCDR |xr|) |p| (QREFELT $ 26)))
                    (GO #4=#:G467)))
                  (#5='T
                   (SEQ (LETT |vx| (QCAR (QCDR |xr|)))
                        (EXIT
                         (COND
                          ((SPADCALL |vx| (|SPADfirst| |vars|) (QREFELT $ 33))
                           (PROGN
                            (LETT #3#
                                  (SPADCALL |x| (CDR |vars|) (CDR |pts|) |p|
                                            (QREFELT $ 36)))
                            (GO #4#)))
                          (#5#
                           (SEQ (LETT |vxval| (|SPADfirst| |pts|))
                                (LETT |vars| (CDR |vars|))
                                (LETT |pts| (CDR |pts|))
                                (LETT |xu| (QCDR (QCDR |xr|))) (LETT |yu| NIL)
                                (LETT |ptk| 1) (LETT |kk| 0) (LETT |res| 0)
                                (LETT |xu| (REVERSE |xu|))
                                (SEQ (LETT |t0| NIL) (LETT #2# |xu|) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN (LETT |t0| (CAR #2#)) NIL))
                                       (GO G191)))
                                     (SEQ (LETT |t1| (QCDR |t0|))
                                          (LETT |kk1| (QCAR |t0|))
                                          (SEQ G190
                                               (COND
                                                ((NULL (< |kk| |kk1|))
                                                 (GO G191)))
                                               (SEQ
                                                (LETT |ptk|
                                                      (QSMULMOD32 |vxval| |ptk|
                                                                  |p|))
                                                (EXIT (LETT |kk| (+ |kk| 1))))
                                               NIL (GO G190) G191 (EXIT NIL))
                                          (LETT |c0|
                                                (COND
                                                 ((QEQCAR |t1| 0)
                                                  (SPADCALL (QCDR |t1|) |p|
                                                            (QREFELT $ 26)))
                                                 ('T
                                                  (SPADCALL (QCDR |t0|) |vars|
                                                            |pts| |p|
                                                            (QREFELT $ 36)))))
                                          (EXIT
                                           (LETT |res|
                                                 (QSMULADDMOD64_32 |ptk| |c0|
                                                                   |res|
                                                                   |p|))))
                                     (LETT #2# (CDR #2#)) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT |res|)))))))))))
          #4# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |PolynomialEvaluationUtilities;|)) 

(DEFUN |PolynomialEvaluationUtilities| ()
  (SPROG NIL
         (PROG (#1=#:G471)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|PolynomialEvaluationUtilities|))
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
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|PolynomialEvaluationUtilities|)))))))))) 

(DEFUN |PolynomialEvaluationUtilities;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|PolynomialEvaluationUtilities|))
          (LETT $ (GETREFV 37))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PolynomialEvaluationUtilities| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PolynomialEvaluationUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|U32Vector|) (|Integer|)
              (|U32VectorPolynomialOperations|) (0 . |copy_first|)
              (|Polynomial| 8)
              (|Record| (|:| |prime| 8) (|:| |eval1coeffbuf| 7)
                        (|:| |eval1expbuf| (|SortedExponentVector|)))
              |PEVALUT;eval1a;PIRI;1| (7 . |coerce|) (|Symbol|)
              |PEVALUT;eval1;PSIRP;2| (12 . |Zero|) (|Boolean|) (16 . =)
              (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| 11))
              (|List| 20) (22 . =) (|Record| (|:| |numer| 11) (|:| |denom| 11))
              (|Union| 23 '"failed") |PEVALUT;eval1;RSIRU;3|
              (28 . |positiveRemainder|) |PEVALUT;modpreduction;PIP;4|
              (|Fraction| 11) (34 . |denom|) (39 . |Zero|) (43 . |numer|)
              |PEVALUT;modpreduction;FIU;5| (48 . ~=) (|List| 15) (|List| 8)
              |PEVALUT;modpeval;PLL2I;6|)
           '#(|modpreduction| 54 |modpeval| 66 |eval1a| 74 |eval1| 81) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|eval1a|
                                 ((|Integer|) (|Polynomial| (|Integer|))
                                  (|Integer|)
                                  (|Record| (|:| |prime| (|Integer|))
                                            (|:| |eval1coeffbuf| (|U32Vector|))
                                            (|:| |eval1expbuf|
                                                 (|SortedExponentVector|)))))
                                T)
                              '((|eval1|
                                 ((|Polynomial| (|Integer|))
                                  (|Polynomial| (|Integer|)) (|Symbol|)
                                  (|Integer|)
                                  (|Record| (|:| |prime| (|Integer|))
                                            (|:| |eval1coeffbuf| (|U32Vector|))
                                            (|:| |eval1expbuf|
                                                 (|SortedExponentVector|)))))
                                T)
                              '((|eval1|
                                 ((|Union|
                                   (|Record|
                                    (|:| |numer| (|Polynomial| (|Integer|)))
                                    (|:| |denom| (|Polynomial| (|Integer|))))
                                   "failed")
                                  (|Record|
                                   (|:| |numer| (|Polynomial| (|Integer|)))
                                   (|:| |denom| (|Polynomial| (|Integer|))))
                                  (|Symbol|) (|Integer|)
                                  (|Record| (|:| |prime| (|Integer|))
                                            (|:| |eval1coeffbuf| (|U32Vector|))
                                            (|:| |eval1expbuf|
                                                 (|SortedExponentVector|)))))
                                T)
                              '((|modpreduction|
                                 ((|Polynomial| (|Integer|))
                                  (|Polynomial| (|Integer|)) (|Integer|)))
                                T)
                              '((|modpreduction|
                                 ((|Union|
                                   (|Record|
                                    (|:| |numer| (|Polynomial| (|Integer|)))
                                    (|:| |denom| (|Polynomial| (|Integer|))))
                                   "failed")
                                  (|Fraction| (|Polynomial| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|modpeval|
                                 ((|Integer|) (|Polynomial| (|Integer|))
                                  (|List| (|Symbol|)) (|List| (|Integer|))
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 36
                                            '(3 9 6 7 7 8 10 1 11 0 8 14 0 11 0
                                              17 2 11 18 0 0 19 2 21 18 0 0 22
                                              2 8 0 0 0 26 1 28 11 0 29 0 28 0
                                              30 1 28 11 0 31 2 15 18 0 0 33 2
                                              0 11 11 8 27 2 0 24 28 8 32 4 0 8
                                              11 34 35 8 36 3 0 8 11 8 12 13 4
                                              0 24 23 15 8 12 25 4 0 11 11 15 8
                                              12 16)))))
           '|lookupComplete|)) 

(MAKEPROP '|PolynomialEvaluationUtilities| 'NILADIC T) 
