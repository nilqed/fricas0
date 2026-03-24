
(PUT '|DFSFUN;besselJ;3C;1| '|SPADreplace| '|c_besselj|) 

(SDEFUN |DFSFUN;besselJ;3C;1|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (|c_besselj| |v| |z|)) 

(PUT '|DFSFUN;besselJ;3Df;2| '|SPADreplace| '|r_besselj|) 

(SDEFUN |DFSFUN;besselJ;3Df;2|
        ((|n| (|DoubleFloat|)) (|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|r_besselj| |n| |x|)) 

(PUT '|DFSFUN;besselI;3C;3| '|SPADreplace| '|c_besseli|) 

(SDEFUN |DFSFUN;besselI;3C;3|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (|c_besseli| |v| |z|)) 

(PUT '|DFSFUN;besselI;3Df;4| '|SPADreplace| '|r_besseli|) 

(SDEFUN |DFSFUN;besselI;3Df;4|
        ((|n| (|DoubleFloat|)) (|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|r_besseli| |n| |x|)) 

(SDEFUN |DFSFUN;besselY;3Df;5|
        ((|n| (|DoubleFloat|)) (|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|vp| (|DoubleFloat|)))
               (SEQ
                (COND
                 ((SPADCALL |n| (QREFELT % 15))
                  (LETT |n| (|add_DF| |n| (QREFELT % 12)))))
                (LETT |vp|
                      (|mul_DF| |n| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)))
                (EXIT
                 (|div_DF|
                  (|sub_DF|
                   (|mul_DF| (|cos_DF| |vp|) (SPADCALL |n| |x| (QREFELT % 9)))
                   (SPADCALL (|minus_DF| |n|) |x| (QREFELT % 9)))
                  (|sin_DF| |vp|)))))) 

(SDEFUN |DFSFUN;besselY;3C;6|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|vp| (|Complex| (|DoubleFloat|))))
               (SEQ
                (COND
                 ((SPADCALL |v| (QREFELT % 18))
                  (LETT |v|
                        (SPADCALL |v| (SPADCALL (QREFELT % 12) (QREFELT % 19))
                                  (QREFELT % 20)))))
                (LETT |vp|
                      (SPADCALL |v| (SPADCALL (QREFELT % 21)) (QREFELT % 22)))
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |vp| (QREFELT % 23))
                             (SPADCALL |v| |z| (QREFELT % 7)) (QREFELT % 22))
                   (SPADCALL (SPADCALL |v| (QREFELT % 24)) |z| (QREFELT % 7))
                   (QREFELT % 25))
                  (SPADCALL |vp| (QREFELT % 26)) (QREFELT % 27)))))) 

(SDEFUN |DFSFUN;besselK;3Df;7|
        ((|n| (|DoubleFloat|)) (|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|ahalf| (|DoubleFloat|)) (|vp| (|DoubleFloat|))
          (|p| (|DoubleFloat|)))
         (SEQ
          (COND
           ((SPADCALL |n| (QREFELT % 15))
            (LETT |n| (|add_DF| |n| (QREFELT % 12)))))
          (LETT |p| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT))
          (LETT |vp| (|mul_DF| |n| |p|))
          (LETT |ahalf| (|div_DF| 1.0 (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
          (EXIT
           (|div_DF|
            (|mul_DF| (|mul_DF| |p| |ahalf|)
                      (|sub_DF| (SPADCALL (|minus_DF| |n|) |x| (QREFELT % 11))
                                (SPADCALL |n| |x| (QREFELT % 11))))
            (|sin_DF| |vp|)))))) 

(SDEFUN |DFSFUN;besselK;3C;8|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|ahalf| (|Complex| (|DoubleFloat|)))
          (|vp| (|Complex| (|DoubleFloat|))) (|p| (|Complex| (|DoubleFloat|))))
         (SEQ
          (COND
           ((SPADCALL |v| (QREFELT % 18))
            (LETT |v|
                  (SPADCALL |v| (SPADCALL (QREFELT % 12) (QREFELT % 19))
                            (QREFELT % 20)))))
          (LETT |p| (SPADCALL (QREFELT % 21)))
          (LETT |vp| (SPADCALL |v| |p| (QREFELT % 22)))
          (LETT |ahalf|
                (SPADCALL (|spadConstant| % 29) (SPADCALL 2 (QREFELT % 32))
                          (QREFELT % 27)))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |p| |ahalf| (QREFELT % 22))
                      (SPADCALL
                       (SPADCALL (SPADCALL |v| (QREFELT % 24)) |z|
                                 (QREFELT % 10))
                       (SPADCALL |v| |z| (QREFELT % 10)) (QREFELT % 25))
                      (QREFELT % 22))
            (SPADCALL |vp| (QREFELT % 26)) (QREFELT % 27)))))) 

(DECLAIM (NOTINLINE |DoubleFloatSpecialFunctions;|)) 

(DEFUN |DoubleFloatSpecialFunctions;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DoubleFloatSpecialFunctions|))
          (LETT % (GETREFV 34))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DoubleFloatSpecialFunctions| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 12
                    (|expt_DF_I| (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT) -7))
          %))) 

(DEFUN |DoubleFloatSpecialFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G21)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|DoubleFloatSpecialFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DoubleFloatSpecialFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|DoubleFloatSpecialFunctions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|DoubleFloatSpecialFunctions|)))))))))) 

(MAKEPROP '|DoubleFloatSpecialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| 8) |DFSFUN;besselJ;3C;1|
              (|DoubleFloat|) |DFSFUN;besselJ;3Df;2| |DFSFUN;besselI;3C;3|
              |DFSFUN;besselI;3Df;4| '|fuzz| (|Boolean|)
              (|IntegerRetractions| 8) (0 . |integer?|) |DFSFUN;besselY;3Df;5|
              (|IntegerRetractions| 6) (5 . |integer?|) (10 . |coerce|)
              (15 . +) (21 . |pi|) (25 . *) (31 . |cos|) (36 . -) (41 . -)
              (47 . |sin|) (52 . /) |DFSFUN;besselY;3C;6| (58 . |One|)
              |DFSFUN;besselK;3Df;7| (|Integer|) (62 . |coerce|)
              |DFSFUN;besselK;3C;8|)
           '#(|besselY| 67 |besselK| 79 |besselJ| 91 |besselI| 103) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|besselJ|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|besselJ|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|besselY|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|besselY|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|besselI|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|besselI|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|besselK|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|besselK|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 33
                                            '(1 14 13 8 15 1 17 13 6 18 1 6 0 8
                                              19 2 6 0 0 0 20 0 6 0 21 2 6 0 0
                                              0 22 1 6 0 0 23 1 6 0 0 24 2 6 0
                                              0 0 25 1 6 0 0 26 2 6 0 0 0 27 0
                                              6 0 29 1 6 0 31 32 2 0 8 8 8 16 2
                                              0 6 6 6 28 2 0 8 8 8 30 2 0 6 6 6
                                              33 2 0 8 8 8 9 2 0 6 6 6 7 2 0 8
                                              8 8 11 2 0 6 6 6 10)))))
           '|lookupComplete|)) 
