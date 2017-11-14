
(PUT '|DFSFUN;Gamma;2C;1| '|SPADreplace| '|c_gamma|) 

(SDEFUN |DFSFUN;Gamma;2C;1|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (|c_gamma| |z|)) 

(PUT '|DFSFUN;Gamma;2Df;2| '|SPADreplace| '|r_gamma|) 

(SDEFUN |DFSFUN;Gamma;2Df;2| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (|r_gamma| |x|)) 

(PUT '|DFSFUN;polygamma;Nni2C;3| '|SPADreplace| '|c_psi|) 

(SDEFUN |DFSFUN;polygamma;Nni2C;3|
        ((|k| |NonNegativeInteger|) (|z| |Complex| (|DoubleFloat|))
         ($ |Complex| (|DoubleFloat|)))
        (|c_psi| |k| |z|)) 

(PUT '|DFSFUN;polygamma;Nni2Df;4| '|SPADreplace| '|r_psi|) 

(SDEFUN |DFSFUN;polygamma;Nni2Df;4|
        ((|k| |NonNegativeInteger|) (|x| |DoubleFloat|) ($ |DoubleFloat|))
        (|r_psi| |k| |x|)) 

(PUT '|DFSFUN;logGamma;2C;5| '|SPADreplace| '|c_lngamma|) 

(SDEFUN |DFSFUN;logGamma;2C;5|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (|c_lngamma| |z|)) 

(PUT '|DFSFUN;logGamma;2Df;6| '|SPADreplace| '|r_lngamma|) 

(SDEFUN |DFSFUN;logGamma;2Df;6| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (|r_lngamma| |x|)) 

(PUT '|DFSFUN;besselJ;3C;7| '|SPADreplace| '|c_besselj|) 

(SDEFUN |DFSFUN;besselJ;3C;7|
        ((|v| |Complex| (|DoubleFloat|)) (|z| |Complex| (|DoubleFloat|))
         ($ |Complex| (|DoubleFloat|)))
        (|c_besselj| |v| |z|)) 

(PUT '|DFSFUN;besselJ;3Df;8| '|SPADreplace| '|r_besselj|) 

(SDEFUN |DFSFUN;besselJ;3Df;8|
        ((|n| |DoubleFloat|) (|x| |DoubleFloat|) ($ |DoubleFloat|))
        (|r_besselj| |n| |x|)) 

(PUT '|DFSFUN;besselI;3C;9| '|SPADreplace| '|c_besseli|) 

(SDEFUN |DFSFUN;besselI;3C;9|
        ((|v| |Complex| (|DoubleFloat|)) (|z| |Complex| (|DoubleFloat|))
         ($ |Complex| (|DoubleFloat|)))
        (|c_besseli| |v| |z|)) 

(PUT '|DFSFUN;besselI;3Df;10| '|SPADreplace| '|r_besseli|) 

(SDEFUN |DFSFUN;besselI;3Df;10|
        ((|n| |DoubleFloat|) (|x| |DoubleFloat|) ($ |DoubleFloat|))
        (|r_besseli| |n| |x|)) 

(PUT '|DFSFUN;hypergeometric0F1;3C;11| '|SPADreplace| '|c_hyper0f1|) 

(SDEFUN |DFSFUN;hypergeometric0F1;3C;11|
        ((|a| |Complex| (|DoubleFloat|)) (|z| |Complex| (|DoubleFloat|))
         ($ |Complex| (|DoubleFloat|)))
        (|c_hyper0f1| |a| |z|)) 

(SDEFUN |DFSFUN;hypergeometric0F1;3Df;12|
        ((|n| |DoubleFloat|) (|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPADCALL
         (SPADCALL (SPADCALL |n| (QREFELT $ 20)) (SPADCALL |x| (QREFELT $ 20))
                   (QREFELT $ 19))
         (QREFELT $ 21))) 

(SDEFUN |DFSFUN;digamma;2Df;13| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPADCALL 0 |x| (QREFELT $ 12))) 

(SDEFUN |DFSFUN;digamma;2C;14|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPADCALL 0 |z| (QREFELT $ 11))) 

(SDEFUN |DFSFUN;Beta;3Df;15|
        ((|x| |DoubleFloat|) (|y| |DoubleFloat|) ($ |DoubleFloat|))
        (|div_DF|
         (|mul_DF| (SPADCALL |x| (QREFELT $ 9)) (SPADCALL |y| (QREFELT $ 9)))
         (SPADCALL (|add_DF| |x| |y|) (QREFELT $ 9)))) 

(SDEFUN |DFSFUN;Beta;3C;16|
        ((|w| |Complex| (|DoubleFloat|)) (|z| |Complex| (|DoubleFloat|))
         ($ |Complex| (|DoubleFloat|)))
        (SPADCALL
         (SPADCALL (SPADCALL |w| (QREFELT $ 7)) (SPADCALL |z| (QREFELT $ 7))
                   (QREFELT $ 27))
         (SPADCALL (SPADCALL |w| |z| (QREFELT $ 28)) (QREFELT $ 7))
         (QREFELT $ 29))) 

(SDEFUN |DFSFUN;besselY;3Df;17|
        ((|n| |DoubleFloat|) (|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|vp| (|DoubleFloat|)))
               (SEQ
                (COND
                 ((SPADCALL |n| (QREFELT $ 34))
                  (LETT |n| (|add_DF| |n| (QREFELT $ 31))
                        . #1=(|DFSFUN;besselY;3Df;17|))))
                (LETT |vp| (|mul_DF| |n| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT))
                      . #1#)
                (EXIT
                 (|div_DF|
                  (|sub_DF|
                   (|mul_DF| (|cos_DF| |vp|) (SPADCALL |n| |x| (QREFELT $ 16)))
                   (SPADCALL (|minus_DF| |n|) |x| (QREFELT $ 16)))
                  (|sin_DF| |vp|)))))) 

(SDEFUN |DFSFUN;besselY;3C;18|
        ((|v| |Complex| (|DoubleFloat|)) (|z| |Complex| (|DoubleFloat|))
         ($ |Complex| (|DoubleFloat|)))
        (SPROG ((|vp| (|Complex| (|DoubleFloat|))))
               (SEQ
                (COND
                 ((SPADCALL |v| (QREFELT $ 37))
                  (LETT |v|
                        (SPADCALL |v| (SPADCALL (QREFELT $ 31) (QREFELT $ 20))
                                  (QREFELT $ 28))
                        . #1=(|DFSFUN;besselY;3C;18|))))
                (LETT |vp|
                      (SPADCALL |v| (SPADCALL (QREFELT $ 38)) (QREFELT $ 27))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |vp| (QREFELT $ 39))
                             (SPADCALL |v| |z| (QREFELT $ 15)) (QREFELT $ 27))
                   (SPADCALL (SPADCALL |v| (QREFELT $ 40)) |z| (QREFELT $ 15))
                   (QREFELT $ 41))
                  (SPADCALL |vp| (QREFELT $ 42)) (QREFELT $ 29)))))) 

(SDEFUN |DFSFUN;besselK;3Df;19|
        ((|n| |DoubleFloat|) (|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG
         ((|ahalf| (|DoubleFloat|)) (|vp| (|DoubleFloat|))
          (|p| (|DoubleFloat|)))
         (SEQ
          (COND
           ((SPADCALL |n| (QREFELT $ 34))
            (LETT |n| (|add_DF| |n| (QREFELT $ 31))
                  . #1=(|DFSFUN;besselK;3Df;19|))))
          (LETT |p| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) . #1#)
          (LETT |vp| (|mul_DF| |n| |p|) . #1#)
          (LETT |ahalf| (|div_DF| 1.0 (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
                . #1#)
          (EXIT
           (|div_DF|
            (|mul_DF| (|mul_DF| |p| |ahalf|)
                      (|sub_DF| (SPADCALL (|minus_DF| |n|) |x| (QREFELT $ 18))
                                (SPADCALL |n| |x| (QREFELT $ 18))))
            (|sin_DF| |vp|)))))) 

(SDEFUN |DFSFUN;besselK;3C;20|
        ((|v| |Complex| (|DoubleFloat|)) (|z| |Complex| (|DoubleFloat|))
         ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|ahalf| (|Complex| (|DoubleFloat|)))
          (|vp| (|Complex| (|DoubleFloat|))) (|p| (|Complex| (|DoubleFloat|))))
         (SEQ
          (COND
           ((SPADCALL |v| (QREFELT $ 37))
            (LETT |v|
                  (SPADCALL |v| (SPADCALL (QREFELT $ 31) (QREFELT $ 20))
                            (QREFELT $ 28))
                  . #1=(|DFSFUN;besselK;3C;20|))))
          (LETT |p| (SPADCALL (QREFELT $ 38)) . #1#)
          (LETT |vp| (SPADCALL |v| |p| (QREFELT $ 27)) . #1#)
          (LETT |ahalf|
                (SPADCALL (|spadConstant| $ 44) (SPADCALL 2 (QREFELT $ 47))
                          (QREFELT $ 29))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |p| |ahalf| (QREFELT $ 27))
                      (SPADCALL
                       (SPADCALL (SPADCALL |v| (QREFELT $ 40)) |z|
                                 (QREFELT $ 17))
                       (SPADCALL |v| |z| (QREFELT $ 17)) (QREFELT $ 41))
                      (QREFELT $ 27))
            (SPADCALL |vp| (QREFELT $ 42)) (QREFELT $ 29)))))) 

(SDEFUN |DFSFUN;airyAi;2Df;21| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG
         ((|eta| (|DoubleFloat|)) (|athird| (|DoubleFloat|)) (#1=#:G740 NIL)
          (|ahalf| (|DoubleFloat|)))
         (SEQ
          (LETT |ahalf|
                (PROG2
                    (LETT #1#
                          (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                    (QREFELT $ 50))
                          . #2=(|DFSFUN;airyAi;2Df;21|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|DoubleFloat|)
                                  (|Union| (|DoubleFloat|) #3="failed") #1#))
                . #2#)
          (LETT |athird|
                (PROG2
                    (LETT #1#
                          (SPADCALL (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                    (QREFELT $ 50))
                          . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|DoubleFloat|)
                                  (|Union| (|DoubleFloat|) #3#) #1#))
                . #2#)
          (LETT |eta|
                (|mul_DF| (SPADCALL 2 |athird| (QREFELT $ 52))
                          (SPADCALL (|minus_DF| |x|)
                                    (SPADCALL 3 |ahalf| (QREFELT $ 52))
                                    (QREFELT $ 53)))
                . #2#)
          (EXIT
           (|mul_DF|
            (|mul_DF| (SPADCALL (|minus_DF| |x|) |ahalf| (QREFELT $ 53))
                      |athird|)
            (|add_DF| (SPADCALL (|minus_DF| |athird|) |eta| (QREFELT $ 16))
                      (SPADCALL |athird| |eta| (QREFELT $ 16)))))))) 

(SDEFUN |DFSFUN;airyAi;2C;22|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|eta| (|Complex| (|DoubleFloat|)))
          (|athird| (|Complex| (|DoubleFloat|))) (#1=#:G745 NIL)
          (|ahalf| (|Complex| (|DoubleFloat|))))
         (SEQ
          (LETT |ahalf|
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 2 (QREFELT $ 47)) (QREFELT $ 55))
                          . #2=(|DFSFUN;airyAi;2C;22|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|))
                                  (|Union| (|Complex| (|DoubleFloat|))
                                           #3="failed")
                                  #1#))
                . #2#)
          (LETT |athird|
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 3 (QREFELT $ 47)) (QREFELT $ 55))
                          . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|))
                                  (|Union| (|Complex| (|DoubleFloat|)) #3#)
                                  #1#))
                . #2#)
          (LETT |eta|
                (SPADCALL (SPADCALL 2 |athird| (QREFELT $ 56))
                          (SPADCALL (SPADCALL |z| (QREFELT $ 40))
                                    (SPADCALL 3 |ahalf| (QREFELT $ 56))
                                    (QREFELT $ 57))
                          (QREFELT $ 27))
                . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (SPADCALL |z| (QREFELT $ 40)) |ahalf| (QREFELT $ 57))
             |athird| (QREFELT $ 27))
            (SPADCALL
             (SPADCALL (SPADCALL |athird| (QREFELT $ 40)) |eta| (QREFELT $ 15))
             (SPADCALL |athird| |eta| (QREFELT $ 15)) (QREFELT $ 28))
            (QREFELT $ 27)))))) 

(SDEFUN |DFSFUN;airyBi;2Df;23| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG
         ((|eta| (|DoubleFloat|)) (|athird| (|DoubleFloat|)) (#1=#:G750 NIL)
          (|ahalf| (|DoubleFloat|)))
         (SEQ
          (LETT |ahalf|
                (PROG2
                    (LETT #1#
                          (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                    (QREFELT $ 50))
                          . #2=(|DFSFUN;airyBi;2Df;23|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|DoubleFloat|)
                                  (|Union| (|DoubleFloat|) #3="failed") #1#))
                . #2#)
          (LETT |athird|
                (PROG2
                    (LETT #1#
                          (SPADCALL (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                    (QREFELT $ 50))
                          . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|DoubleFloat|)
                                  (|Union| (|DoubleFloat|) #3#) #1#))
                . #2#)
          (LETT |eta|
                (|mul_DF| (SPADCALL 2 |athird| (QREFELT $ 52))
                          (SPADCALL (|minus_DF| |x|)
                                    (SPADCALL 3 |ahalf| (QREFELT $ 52))
                                    (QREFELT $ 53)))
                . #2#)
          (EXIT
           (|mul_DF|
            (SPADCALL (|minus_DF| (|mul_DF| |x| |athird|)) |ahalf|
                      (QREFELT $ 53))
            (|sub_DF| (SPADCALL (|minus_DF| |athird|) |eta| (QREFELT $ 16))
                      (SPADCALL |athird| |eta| (QREFELT $ 16)))))))) 

(SDEFUN |DFSFUN;airyBi;2C;24|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|eta| (|Complex| (|DoubleFloat|)))
          (|athird| (|Complex| (|DoubleFloat|))) (#1=#:G755 NIL)
          (|ahalf| (|Complex| (|DoubleFloat|))))
         (SEQ
          (LETT |ahalf|
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 2 (QREFELT $ 47)) (QREFELT $ 55))
                          . #2=(|DFSFUN;airyBi;2C;24|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|))
                                  (|Union| (|Complex| (|DoubleFloat|))
                                           #3="failed")
                                  #1#))
                . #2#)
          (LETT |athird|
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 3 (QREFELT $ 47)) (QREFELT $ 55))
                          . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|))
                                  (|Union| (|Complex| (|DoubleFloat|)) #3#)
                                  #1#))
                . #2#)
          (LETT |eta|
                (SPADCALL (SPADCALL 2 |athird| (QREFELT $ 56))
                          (SPADCALL (SPADCALL |z| (QREFELT $ 40))
                                    (SPADCALL 3 |ahalf| (QREFELT $ 56))
                                    (QREFELT $ 57))
                          (QREFELT $ 27))
                . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (SPADCALL |z| |athird| (QREFELT $ 27)) (QREFELT $ 40))
             |ahalf| (QREFELT $ 57))
            (SPADCALL
             (SPADCALL (SPADCALL |athird| (QREFELT $ 40)) |eta| (QREFELT $ 15))
             (SPADCALL |athird| |eta| (QREFELT $ 15)) (QREFELT $ 41))
            (QREFELT $ 27)))))) 

(DECLAIM (NOTINLINE |DoubleFloatSpecialFunctions;|)) 

(DEFUN |DoubleFloatSpecialFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G760)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|DoubleFloatSpecialFunctions|)
                    . #2=(|DoubleFloatSpecialFunctions|))
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
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|DoubleFloatSpecialFunctions|)))))))))) 

(DEFUN |DoubleFloatSpecialFunctions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DoubleFloatSpecialFunctions|)
                . #1=(|DoubleFloatSpecialFunctions|))
          (LETT $ (GETREFV 61) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DoubleFloatSpecialFunctions| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 31
                    (|expt_DF_I| (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT) -7))
          $))) 

(MAKEPROP '|DoubleFloatSpecialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| 8) |DFSFUN;Gamma;2C;1|
              (|DoubleFloat|) |DFSFUN;Gamma;2Df;2| (|NonNegativeInteger|)
              |DFSFUN;polygamma;Nni2C;3| |DFSFUN;polygamma;Nni2Df;4|
              |DFSFUN;logGamma;2C;5| |DFSFUN;logGamma;2Df;6|
              |DFSFUN;besselJ;3C;7| |DFSFUN;besselJ;3Df;8|
              |DFSFUN;besselI;3C;9| |DFSFUN;besselI;3Df;10|
              |DFSFUN;hypergeometric0F1;3C;11| (0 . |coerce|) (5 . |retract|)
              |DFSFUN;hypergeometric0F1;3Df;12| (10 . |Zero|)
              |DFSFUN;digamma;2Df;13| |DFSFUN;digamma;2C;14|
              |DFSFUN;Beta;3Df;15| (14 . *) (20 . +) (26 . /)
              |DFSFUN;Beta;3C;16| '|fuzz| (|Boolean|) (|IntegerRetractions| 8)
              (32 . |integer?|) |DFSFUN;besselY;3Df;17|
              (|IntegerRetractions| 6) (37 . |integer?|) (42 . |pi|)
              (46 . |cos|) (51 . -) (56 . -) (62 . |sin|)
              |DFSFUN;besselY;3C;18| (67 . |One|) |DFSFUN;besselK;3Df;19|
              (|Integer|) (71 . |coerce|) |DFSFUN;besselK;3C;20|
              (|Union| $ '"failed") (76 . |recip|) (|PositiveInteger|) (81 . *)
              (87 . ^) |DFSFUN;airyAi;2Df;21| (93 . |recip|) (98 . *) (104 . ^)
              |DFSFUN;airyAi;2C;22| |DFSFUN;airyBi;2Df;23|
              |DFSFUN;airyBi;2C;24|)
           '#(|polygamma| 110 |logGamma| 122 |hypergeometric0F1| 132 |digamma|
              144 |besselY| 154 |besselK| 166 |besselJ| 178 |besselI| 190
              |airyBi| 202 |airyAi| 212 |Gamma| 222 |Beta| 232)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(1 6 0 8 20 1 6 8 0 21 0 6 0
                                                   23 2 6 0 0 0 27 2 6 0 0 0 28
                                                   2 6 0 0 0 29 1 33 32 8 34 1
                                                   36 32 6 37 0 6 0 38 1 6 0 0
                                                   39 1 6 0 0 40 2 6 0 0 0 41 1
                                                   6 0 0 42 0 6 0 44 1 6 0 46
                                                   47 1 8 49 0 50 2 8 0 51 0 52
                                                   2 8 0 0 0 53 1 6 49 0 55 2 6
                                                   0 51 0 56 2 6 0 0 0 57 2 0 8
                                                   10 8 12 2 0 6 10 6 11 1 0 6
                                                   6 13 1 0 8 8 14 2 0 6 6 6 19
                                                   2 0 8 8 8 22 1 0 8 8 24 1 0
                                                   6 6 25 2 0 8 8 8 35 2 0 6 6
                                                   6 43 2 0 6 6 6 48 2 0 8 8 8
                                                   45 2 0 6 6 6 15 2 0 8 8 8 16
                                                   2 0 8 8 8 18 2 0 6 6 6 17 1
                                                   0 8 8 59 1 0 6 6 60 1 0 6 6
                                                   58 1 0 8 8 54 1 0 8 8 9 1 0
                                                   6 6 7 2 0 8 8 8 26 2 0 6 6 6
                                                   30)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatSpecialFunctions| 'NILADIC T) 
