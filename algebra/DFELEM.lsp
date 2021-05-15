
(SDEFUN |DFELEM;log_plus_1;2Df;1| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|x2| (|DoubleFloat|)) (|x1| (|DoubleFloat|)))
               (SEQ (LETT |x1| (|add_DF| |x| 1.0))
                    (COND
                     ((OR (SPADCALL |x| (QREFELT $ 15) (QREFELT $ 20))
                          (|less_DF| |x| (|minus_DF| (QREFELT $ 15))))
                      (EXIT (SPADCALL |x1| (QREFELT $ 21)))))
                    (LETT |x2| (|mul_DF| (QREFELT $ 15) (|add_DF| 1.0 |x1|)))
                    (EXIT
                     (|mul_DF| |x|
                               (SPADCALL (|mul_DF| |x2| |x2|) |x1|
                                         (QREFELT $ 25))))))) 

(SDEFUN |DFELEM;atanh;2C;2|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|ri| (|DoubleFloat|)) (|t2| #1=(|DoubleFloat|))
          (|rr| (|DoubleFloat|)) (|t| (|DoubleFloat|)) (|sy| (|DoubleFloat|))
          (|u| #1#) (|s| (|DoubleFloat|)) (|ay| (|DoubleFloat|))
          (|y| (|DoubleFloat|)) (|x| (|DoubleFloat|)))
         (SEQ (LETT |x| (SPADCALL |z| (QREFELT $ 28)))
              (LETT |y| (SPADCALL |z| (QREFELT $ 29)))
              (EXIT
               (COND
                ((|less_DF| |x| 0.0)
                 (SPADCALL
                  (SPADCALL (SPADCALL |z| (QREFELT $ 31)) (QREFELT $ 32))
                  (QREFELT $ 31)))
                (#2='T
                 (SEQ (LETT |ay| (|abs_DF| |y|))
                      (COND
                       ((OR (SPADCALL |x| (QREFELT $ 13) (QREFELT $ 20))
                            (SPADCALL |ay| (QREFELT $ 13) (QREFELT $ 20)))
                        (EXIT
                         (SEQ
                          (LETT |s|
                                (|mul_DF_I| (QREFELT $ 16)
                                            (SPADCALL |y| (QREFELT $ 33))))
                          (EXIT
                           (COND
                            ((SPADCALL |x| |ay| (QREFELT $ 20))
                             (SEQ (LETT |t| (|div_DF| |ay| |x|))
                                  (LETT |t|
                                        (|div_DF| 1.0
                                                  (|add_DF| 1.0
                                                            (|mul_DF| |t|
                                                                      |t|))))
                                  (EXIT
                                   (SPADCALL (|div_DF| |t| |x|) |s|
                                             (QREFELT $ 34)))))
                            (#2#
                             (SEQ (LETT |t| (|div_DF| |x| |ay|))
                                  (LETT |t|
                                        (|div_DF| |t|
                                                  (|add_DF| 1.0
                                                            (|mul_DF| |t|
                                                                      |t|))))
                                  (EXIT
                                   (SPADCALL (|div_DF| |t| |ay|) |s|
                                             (QREFELT $ 34)))))))))))
                      (COND
                       ((|less_DF| |x| (QREFELT $ 15))
                        (COND
                         ((|less_DF| |ay| (QREFELT $ 15))
                          (EXIT
                           (SPADCALL |z|
                                     (SPADCALL (|spadConstant| $ 35)
                                               (SPADCALL (|spadConstant| $ 35)
                                                         (SPADCALL |z| |z|
                                                                   (QREFELT $
                                                                            36))
                                                         (QREFELT $ 37))
                                               (QREFELT $ 38))
                                     (QREFELT $ 36)))))))
                      (LETT |u| (|sub_DF| 1.0 |x|))
                      (LETT |sy|
                            (FLOAT (SPADCALL |y| (QREFELT $ 33))
                                   MOST-POSITIVE-DOUBLE-FLOAT))
                      (EXIT
                       (COND
                        ((|eql_DF| |u| 0.0)
                         (COND
                          ((|eql_DF| |y| 0.0)
                           (|error| "atanh: evaluating at pole"))
                          (#2#
                           (SEQ
                            (LETT |t|
                                  (|add_DF| (QREFELT $ 17) (|mul_DF| |y| |y|)))
                            (LETT |rr|
                                  (SPADCALL
                                   (|div_DF|
                                    (SPADCALL (SPADCALL |t| (QREFELT $ 39))
                                              (QREFELT $ 39))
                                    (SPADCALL |ay| (QREFELT $ 39)))
                                   (QREFELT $ 21)))
                            (LETT |ri|
                                  (|mul_DF| (|mul_DF| (QREFELT $ 15) |sy|)
                                            (|add_DF| (QREFELT $ 16)
                                                      (|atan_DF|
                                                       (|mul_DF| (QREFELT $ 15)
                                                                 |ay|)))))
                            (EXIT (SPADCALL |rr| |ri| (QREFELT $ 34)))))))
                        (#2#
                         (SEQ
                          (LETT |t|
                                (|add_DF| (|mul_DF| |u| |u|)
                                          (|mul_DF| |ay| |ay|)))
                          (LETT |rr|
                                (|mul_DF| (QREFELT $ 18)
                                          (SPADCALL
                                           (|div_DF|
                                            (|mul_DF| (QREFELT $ 17) |x|) |t|)
                                           (QREFELT $ 26))))
                          (LETT |t2|
                                (|sub_DF| (|mul_DF| |u| (|add_DF| 1.0 |x|))
                                          (|mul_DF| |ay| |ay|)))
                          (LETT |ri|
                                (COND
                                 ((|less_DF| |ay| |t2|)
                                  (|mul_DF| (QREFELT $ 15)
                                            (|atan_DF|
                                             (|div_DF|
                                              (|mul_DF| (QREFELT $ 14) |y|)
                                              |t2|))))
                                 ((|eql_DF| |y| 0.0)
                                  (|mul_DF| |sy| (QREFELT $ 16)))
                                 (#2#
                                  (|mul_DF| (|mul_DF| (QREFELT $ 15) |sy|)
                                            (|sub_DF| (QREFELT $ 16)
                                                      (|atan_DF|
                                                       (|div_DF| |t2|
                                                                 (|mul_DF|
                                                                  (QREFELT $
                                                                           14)
                                                                  |ay|))))))))
                          (EXIT (SPADCALL |rr| |ri| (QREFELT $ 34)))))))))))))) 

(DECLAIM (NOTINLINE |DoubleFloatElementaryFunctions;|)) 

(DEFUN |DoubleFloatElementaryFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G394)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|DoubleFloatElementaryFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|DoubleFloatElementaryFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|DoubleFloatElementaryFunctions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|DoubleFloatElementaryFunctions|)))))))))) 

(DEFUN |DoubleFloatElementaryFunctions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DoubleFloatElementaryFunctions|))
          (LETT $ (GETREFV 40))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DoubleFloatElementaryFunctions| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 13
                    (SPADCALL (SPADCALL 1 30 10 (QREFELT $ 10))
                              (QREFELT $ 12)))
          (QSETREFV $ 14 (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
          (QSETREFV $ 15 (|div_DF| 1.0 (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV $ 16
                    (|div_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV $ 17 (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT))
          (QSETREFV $ 18 (|div_DF| 1.0 (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT)))
          $))) 

(MAKEPROP '|DoubleFloatElementaryFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Float|) (0 . |One|) (|Integer|)
              (|PositiveInteger|) (4 . |float|) (|DoubleFloat|) (11 . |coerce|)
              '|large| '|two| '|half| '|half_pi| '|four| '|fourth| (|Boolean|)
              (16 . >) (22 . |log|) (|Fraction| 8) (27 . |One|)
              (|DoubleFloatEllipticIntegrals|) (31 . |ellipticRC|)
              |DFELEM;log_plus_1;2Df;1| (|Complex| 11) (37 . |real|)
              (42 . |imag|) (47 . |Zero|) (51 . -) |DFELEM;atanh;2C;2|
              (56 . |sign|) (61 . |complex|) (67 . |One|) (71 . *) (77 . -)
              (83 . |ellipticRC|) (89 . |sqrt|))
           '#(|log_plus_1| 94 |atanh| 99) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|log_plus_1|
                                 ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|atanh|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 39
                                            '(0 6 0 7 3 6 0 8 8 9 10 1 6 11 0
                                              12 2 11 19 0 0 20 1 11 0 0 21 0
                                              22 0 23 2 24 11 11 11 25 1 27 11
                                              0 28 1 27 11 0 29 0 6 0 30 1 27 0
                                              0 31 1 11 8 0 33 2 27 0 11 11 34
                                              0 27 0 35 2 27 0 0 0 36 2 27 0 0
                                              0 37 2 24 27 27 27 38 1 11 0 0 39
                                              1 0 11 11 26 1 0 27 27 32)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatElementaryFunctions| 'NILADIC T) 
