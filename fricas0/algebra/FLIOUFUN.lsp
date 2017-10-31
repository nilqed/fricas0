
(SDEFUN |FLIOUFUN;gamma;C;1| (($ |Complex| (|Float|)))
        (SPROG ((|nbits| (|PositiveInteger|)) (|obits| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |obits| (SPADCALL (QREFELT $ 10))
                         . #1=(|FLIOUFUN;gamma;C;1|))
                   (QCAR (QREFELT $ 8)) (QREFELT $ 14))
                  (SPADCALL (QCDR (QREFELT $ 8)) (|spadConstant| $ 7)
                            (QREFELT $ 16)))
                 ('T
                  (SEQ
                   (LETT |nbits|
                         (MAX |obits|
                              (SPADCALL 2 (QCAR (QREFELT $ 8)) (QREFELT $ 17)))
                         . #1#)
                   (EXIT
                    (|finally|
                     (SEQ (SPADCALL |nbits| (QREFELT $ 18))
                          (PROGN
                           (RPLACD (QREFELT $ 8)
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 19)
                                              (QREFELT $ 21))
                                    (QREFELT $ 22)))
                           (QCDR (QREFELT $ 8)))
                          (PROGN
                           (RPLACA (QREFELT $ 8) |nbits|)
                           (QCAR (QREFELT $ 8)))
                          (EXIT
                           (SPADCALL (QCDR (QREFELT $ 8)) (|spadConstant| $ 7)
                                     (QREFELT $ 16))))
                     (SPADCALL |obits| (QREFELT $ 18)))))))))) 

(SDEFUN |FLIOUFUN;erf_series|
        ((|z| . #1=(|Complex| (|Float|))) (|n| |Integer|)
         ($ |Complex| (|Float|)))
        (SPROG
         ((|tk| #1#) (|k2| #2=(|NonNegativeInteger|))
          (|res| (|Complex| (|Float|))) (|term| (|Complex| (|Float|)))
          (|k1| #2#) (#3=#:G729 NIL) (|i| NIL) (|z2| (|Complex| (|Float|))))
         (SEQ
          (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24))
                . #4=(|FLIOUFUN;erf_series|))
          (LETT |tk| |z| . #4#) (LETT |res| (|spadConstant| $ 25) . #4#)
          (SEQ (LETT |i| 0 . #4#) (LETT #3# |n| . #4#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ (LETT |k1| (+ (SPADCALL 2 |i| (QREFELT $ 27)) 1) . #4#)
                    (LETT |term|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 19)
                                     (SPADCALL |k1| (QREFELT $ 28))
                                     (QREFELT $ 31))
                           |tk| (QREFELT $ 33))
                          . #4#)
                    (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #4#)
                    (LETT |k2| (+ |i| 1) . #4#)
                    (EXIT
                     (LETT |tk|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 19)
                                        (SPADCALL |k2| (QREFELT $ 28))
                                        (QREFELT $ 31))
                              (QREFELT $ 22))
                             |z2| (QREFELT $ 33))
                            |tk| (QREFELT $ 24))
                           . #4#)))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL 2 (QREFELT $ 28))
                      (SPADCALL (SPADCALL (QREFELT $ 35)) (QREFELT $ 36))
                      (QREFELT $ 31))
            |res| (QREFELT $ 33)))))) 

(SDEFUN |FLIOUFUN;erfc_asymptotic|
        ((|z| |Complex| (|Float|)) (|prec| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|term| (|Complex| (|Float|))) (|res| (|Complex| (|Float|)))
          (|k| NIL) (|z2_inv| (|Complex| (|Float|)))
          (|z2| (|Complex| (|Float|))) (|eps| (|Float|)))
         (SEQ
          (LETT |eps|
                (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                          (QREFELT $ 37))
                . #1=(|FLIOUFUN;erfc_asymptotic|))
          (LETT |term| (|spadConstant| $ 32) . #1#)
          (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24)) . #1#)
          (LETT |z2_inv|
                (SPADCALL (|spadConstant| $ 32)
                          (SPADCALL (SPADCALL 2 (QREFELT $ 28)) |z2|
                                    (QREFELT $ 33))
                          (QREFELT $ 38))
                . #1#)
          (LETT |res| (|spadConstant| $ 25) . #1#)
          (SEQ (LETT |k| 0 . #1#) G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps|
                            (QREFELT $ 40)))
                 (GO G191)))
               (SEQ (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #1#)
                    (EXIT
                     (LETT |term|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 27)) 1)
                                        (QREFELT $ 28))
                              |z2_inv| (QREFELT $ 33))
                             |term| (QREFELT $ 24))
                            (QREFELT $ 41))
                           . #1#)))
               (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL (SPADCALL |z2| (QREFELT $ 41)) (QREFELT $ 42))
                      |res| (QREFELT $ 24))
            (SPADCALL |z| (SPADCALL (SPADCALL (QREFELT $ 35)) (QREFELT $ 36))
                      (QREFELT $ 43))
            (QREFELT $ 38)))))) 

(SDEFUN |FLIOUFUN;erf_z| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((#1=#:G741 NIL) (#2=#:G742 NIL) (|res| (|Complex| (|Float|)))
          (|n| (|Integer|)) (|nf| #3=(|DoubleFloat|))
          (|np| (|PositiveInteger|)) (|npf| #3#) (|sp| (|DoubleFloat|))
          (|dnz| (|DoubleFloat|)) (|oz| (|Integer|))
          (|prec| (|PositiveInteger|)) (|nz| (|Float|))
          (|obits| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |obits| (SPADCALL (QREFELT $ 10)) . #4=(|FLIOUFUN;erf_z|))
            (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #4#)
            (LETT |prec| (+ |obits| 20) . #4#)
            (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #4#)
            (EXIT
             (COND
              ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
               (|error| "reqested too high precision"))
              (#5='T
               (SEQ
                (COND
                 ((< |oz| 500)
                  (SEQ
                   (EXIT
                    (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT $ 47)) . #4#)
                         (LETT |sp|
                               (|mul_DF_I|
                                (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                          (QREFELT $ 49))
                                |prec|)
                               . #4#)
                         (EXIT
                          (COND
                           ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                            (PROGN
                             (LETT #1#
                                   (SEQ
                                    (LETT |npf|
                                          (|add_DF|
                                           (|mul_DF|
                                            (SPADCALL
                                             (SPADCALL 2000 693 (QREFELT $ 48))
                                             (QREFELT $ 49))
                                            |dnz|)
                                           (FLOAT |prec|
                                                  MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #4#)
                                    (LETT |np|
                                          (SPADCALL
                                           (SPADCALL |npf| (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (LETT |nf|
                                          (|add_DF|
                                           (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                           |sp|)
                                          . #4#)
                                    (LETT |n|
                                          (SPADCALL
                                           (SPADCALL |nf| (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (SPADCALL |np| (QREFELT $ 18))
                                    (LETT |res|
                                          (|FLIOUFUN;erf_series| |z| |n| $)
                                          . #4#)
                                    (SPADCALL |obits| (QREFELT $ 18))
                                    (EXIT
                                     (PROGN
                                      (LETT #2# |res| . #4#)
                                      (GO #6=#:G740))))
                                   . #4#)
                             (GO #7=#:G737)))))))
                   #7# (EXIT #1#))))
                (SPADCALL |prec| (QREFELT $ 18))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |z| (QREFELT $ 53)) (|spadConstant| $ 7)
                             (QREFELT $ 40))
                   (SPADCALL (|spadConstant| $ 32)
                             (|FLIOUFUN;erfc_asymptotic| |z| (+ |obits| 5) $)
                             (QREFELT $ 54)))
                  (#5#
                   (SPADCALL
                    (|FLIOUFUN;erfc_asymptotic| (SPADCALL |z| (QREFELT $ 41))
                     (+ |obits| 5) $)
                    (|spadConstant| $ 32) (QREFELT $ 54)))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;erf;2C;5| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;erf;2C;5|)
                (EXIT
                 (|finally| (|FLIOUFUN;erf_z| |z| $)
                            (SPADCALL |obits| (QREFELT $ 18))))))) 

(SDEFUN |FLIOUFUN;erf;2F;6| ((|z| |Float|) ($ |Float|))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16))
                   (QREFELT $ 55))
         (QREFELT $ 53))) 

(SDEFUN |FLIOUFUN;erfi;2C;7|
        ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPADCALL
         (SPADCALL (|spadConstant| $ 7)
                   (SPADCALL (|spadConstant| $ 19) (QREFELT $ 22))
                   (QREFELT $ 16))
         (SPADCALL
          (SPADCALL
           (SPADCALL (|spadConstant| $ 7) (|spadConstant| $ 19) (QREFELT $ 16))
           |z| (QREFELT $ 24))
          (QREFELT $ 55))
         (QREFELT $ 24))) 

(SDEFUN |FLIOUFUN;erfi;2F;8| ((|z| |Float|) ($ |Float|))
        (SPADCALL
         (SPADCALL (SPADCALL (|spadConstant| $ 7) |z| (QREFELT $ 16))
                   (QREFELT $ 55))
         (QREFELT $ 58))) 

(SDEFUN |FLIOUFUN;fresnel_c_series|
        ((|z| . #1=(|Complex| (|Float|))) (|n| |Integer|)
         ($ |Complex| (|Float|)))
        (SPROG
         ((|tk| #1#) (|k2| (|NonNegativeInteger|))
          (|res| (|Complex| (|Float|))) (|term| (|Complex| (|Float|)))
          (|k1| (|NonNegativeInteger|)) (#2=#:G752 NIL) (|i| NIL)
          (|z4| #3=(|Complex| (|Float|))) (|z2| #3#))
         (SEQ
          (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24))
                . #4=(|FLIOUFUN;fresnel_c_series|))
          (LETT |tk| |z| . #4#)
          (LETT |z4| (SPADCALL |z2| |z2| (QREFELT $ 24)) . #4#)
          (LETT |res| (|spadConstant| $ 25) . #4#)
          (SEQ (LETT |i| 0 . #4#) (LETT #2# |n| . #4#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |k1| (+ (SPADCALL 4 |i| (QREFELT $ 27)) 1) . #4#)
                    (LETT |term|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 19)
                                     (SPADCALL |k1| (QREFELT $ 28))
                                     (QREFELT $ 31))
                           |tk| (QREFELT $ 33))
                          . #4#)
                    (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #4#)
                    (LETT |k2|
                          (* (+ (SPADCALL 2 |i| (QREFELT $ 27)) 1)
                             (+ (SPADCALL 2 |i| (QREFELT $ 27)) 2))
                          . #4#)
                    (EXIT
                     (LETT |tk|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 19)
                                        (SPADCALL |k2| (QREFELT $ 28))
                                        (QREFELT $ 31))
                              (QREFELT $ 22))
                             |z4| (QREFELT $ 33))
                            |tk| (QREFELT $ 24))
                           . #4#)))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |FLIOUFUN;fresnel_c_asymptotic|
        ((|z| |Complex| (|Float|)) (|prec| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|term| (|Complex| (|Float|))) (|res_c| #1=(|Complex| (|Float|)))
          (|res_s| #1#) (|k| NIL) (|z2_inv| #2=(|Complex| (|Float|)))
          (|z2| (|Complex| (|Float|))) (|z_inv| #2#) (|eps| (|Float|)))
         (SEQ
          (LETT |eps|
                (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                          (QREFELT $ 37))
                . #3=(|FLIOUFUN;fresnel_c_asymptotic|))
          (LETT |z_inv| (SPADCALL (|spadConstant| $ 32) |z| (QREFELT $ 38))
                . #3#)
          (LETT |term| (|spadConstant| $ 32) . #3#)
          (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24)) . #3#)
          (LETT |z2_inv|
                (SPADCALL (|spadConstant| $ 32)
                          (SPADCALL (SPADCALL 2 (QREFELT $ 28)) |z2|
                                    (QREFELT $ 33))
                          (QREFELT $ 38))
                . #3#)
          (LETT |res_c| (|spadConstant| $ 25) . #3#)
          (LETT |res_s| (|spadConstant| $ 25) . #3#)
          (SEQ (LETT |k| 0 . #3#) G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps|
                            (QREFELT $ 40)))
                 (GO G191)))
               (SEQ
                (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 54)) . #3#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 27)) 1)
                                  (QREFELT $ 28))
                        |z2_inv| (QREFELT $ 33))
                       |term| (QREFELT $ 24))
                      . #3#)
                (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 34)) . #3#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 27)) 3)
                                    (QREFELT $ 28))
                          |z2_inv| (QREFELT $ 33))
                         |term| (QREFELT $ 24))
                        (QREFELT $ 41))
                       . #3#)))
               (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL (SPADCALL 1 2 (QREFELT $ 48)) (QREFELT $ 60))
                      |z_inv| (QREFELT $ 33))
            (SPADCALL
             (SPADCALL (SPADCALL |z2| (QREFELT $ 61)) |res_c| (QREFELT $ 24))
             (SPADCALL (SPADCALL |z2| (QREFELT $ 62)) |res_s| (QREFELT $ 24))
             (QREFELT $ 34))
            (QREFELT $ 24)))))) 

(SDEFUN |FLIOUFUN;fresnel_c_z|
        ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((|im_z| (|Float|)) (|re_z| (|Float|)) (|pi_fac| (|Float|))
          (#1=#:G765 NIL) (#2=#:G766 NIL) (|res| (|Complex| (|Float|)))
          (|n| (|Integer|)) (|nf| #3=(|DoubleFloat|))
          (|np| (|PositiveInteger|)) (|npf| #3#) (|sp| (|DoubleFloat|))
          (|dnz| (|DoubleFloat|)) (|oz| (|Integer|))
          (|prec| (|PositiveInteger|)) (|nz| (|Float|))
          (|obits| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |obits| (SPADCALL (QREFELT $ 10))
                  . #4=(|FLIOUFUN;fresnel_c_z|))
            (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #4#)
            (LETT |prec| (+ |obits| 10) . #4#)
            (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #4#)
            (EXIT
             (COND
              ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
               (|error| "reqested too high precision"))
              (#5='T
               (SEQ
                (COND
                 ((< |oz| 500)
                  (SEQ
                   (EXIT
                    (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT $ 47)) . #4#)
                         (LETT |sp|
                               (|mul_DF_I|
                                (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                          (QREFELT $ 49))
                                |prec|)
                               . #4#)
                         (EXIT
                          (COND
                           ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                            (PROGN
                             (LETT #1#
                                   (SEQ
                                    (LETT |npf|
                                          (|add_DF|
                                           (|mul_DF|
                                            (SPADCALL
                                             (SPADCALL 2000 693 (QREFELT $ 48))
                                             (QREFELT $ 49))
                                            |dnz|)
                                           (FLOAT |prec|
                                                  MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #4#)
                                    (LETT |np|
                                          (SPADCALL
                                           (SPADCALL |npf| (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (LETT |nf|
                                          (|add_DF|
                                           (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                           |sp|)
                                          . #4#)
                                    (LETT |n|
                                          (SPADCALL
                                           (SPADCALL
                                            (|div_DF| |nf|
                                                      (FLOAT 2
                                                             MOST-POSITIVE-DOUBLE-FLOAT))
                                            (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (SPADCALL |np| (QREFELT $ 18))
                                    (LETT |res|
                                          (|FLIOUFUN;fresnel_c_series| |z| |n|
                                           $)
                                          . #4#)
                                    (SPADCALL |obits| (QREFELT $ 18))
                                    (EXIT
                                     (PROGN
                                      (LETT #2# |res| . #4#)
                                      (GO #6=#:G764))))
                                   . #4#)
                             (GO #7=#:G758)))))))
                   #7# (EXIT #1#))))
                (SPADCALL |prec| (QREFELT $ 18))
                (LETT |pi_fac|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT $ 35))
                                 (SPADCALL 8 (QREFELT $ 28)) (QREFELT $ 31))
                       (QREFELT $ 36))
                      . #4#)
                (LETT |re_z| (SPADCALL |z| (QREFELT $ 53)) . #4#)
                (LETT |im_z| (SPADCALL |z| (QREFELT $ 58)) . #4#)
                (EXIT
                 (COND
                  ((SPADCALL |re_z| (|spadConstant| $ 7) (QREFELT $ 40))
                   (COND
                    ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 40))
                     (COND
                      ((SPADCALL |re_z| |im_z| (QREFELT $ 40))
                       (SPADCALL
                        (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                        (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                        (QREFELT $ 54)))
                      (#5#
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                        (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                        (QREFELT $ 54)))))
                    ((SPADCALL |re_z| (SPADCALL |im_z| (QREFELT $ 22))
                               (QREFELT $ 40))
                     (SPADCALL
                      (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))
                    (#5#
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 7)
                                (SPADCALL |pi_fac| (QREFELT $ 22))
                                (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))))
                  ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 40))
                   (COND
                    ((SPADCALL (SPADCALL |re_z| (QREFELT $ 22)) |im_z|
                               (QREFELT $ 40))
                     (SPADCALL
                      (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 22))
                                (|spadConstant| $ 7) (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))
                    (#5#
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))))
                  (#5#
                   (COND
                    ((SPADCALL (SPADCALL |re_z| (QREFELT $ 22))
                               (SPADCALL |im_z| (QREFELT $ 22)) (QREFELT $ 40))
                     (SPADCALL
                      (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 22))
                                (|spadConstant| $ 7) (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))
                    (#5#
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 7)
                                (SPADCALL |pi_fac| (QREFELT $ 22))
                                (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;fresnelC;2C;12|
        ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|pi_fac| (|Float|))
          (|obits| (|PositiveInteger|)))
         (SEQ
          (LETT |obits| (SPADCALL (QREFELT $ 10))
                . #1=(|FLIOUFUN;fresnelC;2C;12|))
          (EXIT
           (|finally|
            (SEQ (SPADCALL (+ |obits| 10) (QREFELT $ 18))
                 (LETT |pi_fac|
                       (SPADCALL
                        (SPADCALL (SPADCALL (QREFELT $ 35))
                                  (SPADCALL 2 (QREFELT $ 28)) (QREFELT $ 31))
                        (QREFELT $ 36))
                       . #1#)
                 (LETT |z| (SPADCALL |pi_fac| |z| (QREFELT $ 33)) . #1#)
                 (LETT |res| (|FLIOUFUN;fresnel_c_z| |z| $) . #1#)
                 (SPADCALL (+ |obits| 10) (QREFELT $ 18))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 19) |pi_fac| (QREFELT $ 31))
                   |res| (QREFELT $ 33))))
            (SPADCALL |obits| (QREFELT $ 18))))))) 

(SDEFUN |FLIOUFUN;fresnelC;2F;13| ((|z| |Float|) ($ |Float|))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16))
                   (QREFELT $ 63))
         (QREFELT $ 53))) 

(SDEFUN |FLIOUFUN;fresnel_s_series|
        ((|z| |Complex| (|Float|)) (|n| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|tk| #1=(|Complex| (|Float|))) (|k2| (|NonNegativeInteger|))
          (|res| (|Complex| (|Float|))) (|term| (|Complex| (|Float|)))
          (|k1| (|NonNegativeInteger|)) (#2=#:G775 NIL) (|i| NIL) (|z4| #1#)
          (|z2| #1#))
         (SEQ
          (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24))
                . #3=(|FLIOUFUN;fresnel_s_series|))
          (LETT |tk| (SPADCALL |z2| |z| (QREFELT $ 24)) . #3#)
          (LETT |z4| (SPADCALL |z2| |z2| (QREFELT $ 24)) . #3#)
          (LETT |res| (|spadConstant| $ 25) . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# |n| . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |k1| (+ (SPADCALL 4 |i| (QREFELT $ 27)) 3) . #3#)
                    (LETT |term|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 19)
                                     (SPADCALL |k1| (QREFELT $ 28))
                                     (QREFELT $ 31))
                           |tk| (QREFELT $ 33))
                          . #3#)
                    (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #3#)
                    (LETT |k2|
                          (* (+ (SPADCALL 2 |i| (QREFELT $ 27)) 2)
                             (+ (SPADCALL 2 |i| (QREFELT $ 27)) 3))
                          . #3#)
                    (EXIT
                     (LETT |tk|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 19)
                                        (SPADCALL |k2| (QREFELT $ 28))
                                        (QREFELT $ 31))
                              (QREFELT $ 22))
                             |z4| (QREFELT $ 33))
                            |tk| (QREFELT $ 24))
                           . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |FLIOUFUN;fresnel_s_asymptotic|
        ((|z| |Complex| (|Float|)) (|prec| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|term| (|Complex| (|Float|))) (|res_s| #1=(|Complex| (|Float|)))
          (|res_c| #1#) (|k| NIL) (|z2_inv| #2=(|Complex| (|Float|)))
          (|z2| (|Complex| (|Float|))) (|z_inv| #2#) (|eps| (|Float|)))
         (SEQ
          (LETT |eps|
                (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                          (QREFELT $ 37))
                . #3=(|FLIOUFUN;fresnel_s_asymptotic|))
          (LETT |z_inv| (SPADCALL (|spadConstant| $ 32) |z| (QREFELT $ 38))
                . #3#)
          (LETT |term| (|spadConstant| $ 32) . #3#)
          (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24)) . #3#)
          (LETT |z2_inv|
                (SPADCALL (|spadConstant| $ 32)
                          (SPADCALL (SPADCALL 2 (QREFELT $ 28)) |z2|
                                    (QREFELT $ 33))
                          (QREFELT $ 38))
                . #3#)
          (LETT |res_c| (|spadConstant| $ 25) . #3#)
          (LETT |res_s| (|spadConstant| $ 25) . #3#)
          (SEQ (LETT |k| 0 . #3#) G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps|
                            (QREFELT $ 40)))
                 (GO G191)))
               (SEQ
                (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 34)) . #3#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 27)) 1)
                                  (QREFELT $ 28))
                        |z2_inv| (QREFELT $ 33))
                       |term| (QREFELT $ 24))
                      . #3#)
                (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 34)) . #3#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 27)) 3)
                                    (QREFELT $ 28))
                          |z2_inv| (QREFELT $ 33))
                         |term| (QREFELT $ 24))
                        (QREFELT $ 41))
                       . #3#)))
               (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL (SPADCALL 1 2 (QREFELT $ 48)) (QREFELT $ 60))
                      |z_inv| (QREFELT $ 33))
            (SPADCALL
             (SPADCALL (SPADCALL |z2| (QREFELT $ 61)) |res_c| (QREFELT $ 24))
             (SPADCALL (SPADCALL |z2| (QREFELT $ 62)) |res_s| (QREFELT $ 24))
             (QREFELT $ 34))
            (QREFELT $ 24)))))) 

(SDEFUN |FLIOUFUN;fresnel_s_z|
        ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((|im_z| (|Float|)) (|re_z| (|Float|)) (|pi_fac| (|Float|))
          (#1=#:G788 NIL) (#2=#:G789 NIL) (|res| (|Complex| (|Float|)))
          (|n| (|Integer|)) (|nf| #3=(|DoubleFloat|))
          (|np| (|PositiveInteger|)) (|npf| #3#) (|sp| (|DoubleFloat|))
          (|dnz| (|DoubleFloat|)) (|oz| (|Integer|))
          (|prec| (|PositiveInteger|)) (|nz| (|Float|))
          (|obits| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |obits| (SPADCALL (QREFELT $ 10))
                  . #4=(|FLIOUFUN;fresnel_s_z|))
            (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #4#)
            (LETT |prec| (+ |obits| 10) . #4#)
            (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #4#)
            (EXIT
             (COND
              ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
               (|error| "reqested too high precision"))
              (#5='T
               (SEQ
                (COND
                 ((< |oz| 500)
                  (SEQ
                   (EXIT
                    (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT $ 47)) . #4#)
                         (LETT |sp|
                               (|mul_DF_I|
                                (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                          (QREFELT $ 49))
                                |prec|)
                               . #4#)
                         (EXIT
                          (COND
                           ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                            (PROGN
                             (LETT #1#
                                   (SEQ
                                    (LETT |npf|
                                          (|add_DF|
                                           (|mul_DF|
                                            (SPADCALL
                                             (SPADCALL 2000 693 (QREFELT $ 48))
                                             (QREFELT $ 49))
                                            |dnz|)
                                           (FLOAT |prec|
                                                  MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #4#)
                                    (LETT |np|
                                          (SPADCALL
                                           (SPADCALL |npf| (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (LETT |nf|
                                          (|add_DF|
                                           (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                           |sp|)
                                          . #4#)
                                    (LETT |n|
                                          (SPADCALL
                                           (SPADCALL
                                            (|div_DF| |nf|
                                                      (FLOAT 2
                                                             MOST-POSITIVE-DOUBLE-FLOAT))
                                            (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (SPADCALL |np| (QREFELT $ 18))
                                    (LETT |res|
                                          (|FLIOUFUN;fresnel_s_series| |z| |n|
                                           $)
                                          . #4#)
                                    (SPADCALL |obits| (QREFELT $ 18))
                                    (EXIT
                                     (PROGN
                                      (LETT #2# |res| . #4#)
                                      (GO #6=#:G787))))
                                   . #4#)
                             (GO #7=#:G781)))))))
                   #7# (EXIT #1#))))
                (SPADCALL |prec| (QREFELT $ 18))
                (LETT |pi_fac|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT $ 35))
                                 (SPADCALL 8 (QREFELT $ 28)) (QREFELT $ 31))
                       (QREFELT $ 36))
                      . #4#)
                (LETT |re_z| (SPADCALL |z| (QREFELT $ 53)) . #4#)
                (LETT |im_z| (SPADCALL |z| (QREFELT $ 58)) . #4#)
                (EXIT
                 (COND
                  ((SPADCALL |re_z| (|spadConstant| $ 7) (QREFELT $ 40))
                   (COND
                    ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 40))
                     (COND
                      ((SPADCALL |re_z| |im_z| (QREFELT $ 40))
                       (SPADCALL
                        (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                        (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                        (QREFELT $ 54)))
                      (#5#
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 7)
                                  (SPADCALL |pi_fac| (QREFELT $ 22))
                                  (QREFELT $ 16))
                        (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                        (QREFELT $ 54)))))
                    ((SPADCALL |re_z| (SPADCALL |im_z| (QREFELT $ 22))
                               (QREFELT $ 40))
                     (SPADCALL
                      (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))
                    (#5#
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))))
                  ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 40))
                   (COND
                    ((SPADCALL (SPADCALL |re_z| (QREFELT $ 22)) |im_z|
                               (QREFELT $ 40))
                     (SPADCALL
                      (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 22))
                                (|spadConstant| $ 7) (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))
                    (#5#
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 7)
                                (SPADCALL |pi_fac| (QREFELT $ 22))
                                (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))))
                  (#5#
                   (COND
                    ((SPADCALL (SPADCALL |re_z| (QREFELT $ 22))
                               (SPADCALL |im_z| (QREFELT $ 22)) (QREFELT $ 40))
                     (SPADCALL
                      (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 22))
                                (|spadConstant| $ 7) (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))
                    (#5#
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                      (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                      (QREFELT $ 54)))))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;fresnelS;2C;17|
        ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|pi_fac| (|Float|))
          (|obits| (|PositiveInteger|)))
         (SEQ
          (LETT |obits| (SPADCALL (QREFELT $ 10))
                . #1=(|FLIOUFUN;fresnelS;2C;17|))
          (EXIT
           (|finally|
            (SEQ (SPADCALL (+ |obits| 10) (QREFELT $ 18))
                 (LETT |pi_fac|
                       (SPADCALL
                        (SPADCALL (SPADCALL (QREFELT $ 35))
                                  (SPADCALL 2 (QREFELT $ 28)) (QREFELT $ 31))
                        (QREFELT $ 36))
                       . #1#)
                 (LETT |z| (SPADCALL |pi_fac| |z| (QREFELT $ 33)) . #1#)
                 (LETT |res| (|FLIOUFUN;fresnel_s_z| |z| $) . #1#)
                 (SPADCALL (+ |obits| 10) (QREFELT $ 18))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 19) |pi_fac| (QREFELT $ 31))
                   |res| (QREFELT $ 33))))
            (SPADCALL |obits| (QREFELT $ 18))))))) 

(SDEFUN |FLIOUFUN;fresnelS;2F;18| ((|z| |Float|) ($ |Float|))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16))
                   (QREFELT $ 65))
         (QREFELT $ 53))) 

(SDEFUN |FLIOUFUN;ei_series|
        ((|z| . #1=(|Complex| (|Float|))) (|n| |Integer|)
         ($ |Complex| (|Float|)))
        (SPROG
         ((|tk| #1#) (|k2| #2=(|NonNegativeInteger|))
          (|res| (|Complex| (|Float|))) (|term| (|Complex| (|Float|)))
          (|k1| #2#) (#3=#:G798 NIL) (|i| NIL))
         (SEQ (LETT |tk| |z| . #4=(|FLIOUFUN;ei_series|))
              (LETT |res| (|spadConstant| $ 25) . #4#)
              (SEQ (LETT |i| 0 . #4#) (LETT #3# |n| . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |k1| (+ |i| 1) . #4#)
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 19)
                                         (SPADCALL |k1| (QREFELT $ 28))
                                         (QREFELT $ 31))
                               |tk| (QREFELT $ 33))
                              . #4#)
                        (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34))
                              . #4#)
                        (LETT |k2| (+ |i| 2) . #4#)
                        (EXIT
                         (LETT |tk|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 19)
                                           (SPADCALL |k2| (QREFELT $ 28))
                                           (QREFELT $ 31))
                                 |z| (QREFELT $ 33))
                                |tk| (QREFELT $ 24))
                               . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FLIOUFUN;ei_asymptotic|
        ((|z| |Complex| (|Float|)) (|prec| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|term| #1=(|Complex| (|Float|))) (|res| (|Complex| (|Float|)))
          (|k| NIL) (|z_inv| #1#) (|eps| (|Float|)))
         (SEQ
          (LETT |eps|
                (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                          (QREFELT $ 37))
                . #2=(|FLIOUFUN;ei_asymptotic|))
          (LETT |z_inv| (SPADCALL (|spadConstant| $ 32) |z| (QREFELT $ 38))
                . #2#)
          (LETT |term| |z_inv| . #2#) (LETT |res| (|spadConstant| $ 25) . #2#)
          (SEQ (LETT |k| 0 . #2#) G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps|
                            (QREFELT $ 40)))
                 (GO G191)))
               (SEQ (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #2#)
                    (EXIT
                     (LETT |term|
                           (SPADCALL
                            (SPADCALL (SPADCALL (+ |k| 1) (QREFELT $ 28))
                                      |z_inv| (QREFELT $ 33))
                            |term| (QREFELT $ 24))
                           . #2#)))
               (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL |z| (QREFELT $ 42)) |res| (QREFELT $ 24)))))) 

(SDEFUN |FLIOUFUN;ei_z| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((|im_z| (|Float|)) (|pii| (|Float|)) (#1=#:G810 NIL) (#2=#:G811 NIL)
          (|res| (|Complex| (|Float|))) (|n| (|Integer|))
          (|nf| #3=(|DoubleFloat|)) (|np| (|PositiveInteger|)) (|npf| #3#)
          (|sp| (|DoubleFloat|)) (|dnz| (|DoubleFloat|)) (|oz| (|Integer|))
          (|prec| (|PositiveInteger|)) (|nz| (|Float|))
          (|obits| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #4=(|FLIOUFUN;ei_z|))
                (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #4#)
                (LETT |prec| (+ |obits| 20) . #4#)
                (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #4#)
                (EXIT
                 (COND
                  ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
                   (|error| "reqested too high precision"))
                  (#5='T
                   (SEQ
                    (COND
                     ((< |oz| 1000)
                      (SEQ
                       (EXIT
                        (SEQ
                         (LETT |dnz|
                               (SPADCALL (SPADCALL |nz| (QREFELT $ 47))
                                         (QREFELT $ 67))
                               . #4#)
                         (LETT |sp|
                               (|mul_DF_I|
                                (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                          (QREFELT $ 49))
                                |prec|)
                               . #4#)
                         (EXIT
                          (COND
                           ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                            (PROGN
                             (LETT #1#
                                   (SEQ
                                    (LETT |npf|
                                          (|add_DF|
                                           (|mul_DF|
                                            (SPADCALL
                                             (SPADCALL 2000 693 (QREFELT $ 48))
                                             (QREFELT $ 49))
                                            |dnz|)
                                           (FLOAT |prec|
                                                  MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #4#)
                                    (LETT |np|
                                          (SPADCALL
                                           (SPADCALL |npf| (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (LETT |nf|
                                          (|add_DF|
                                           (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                           |sp|)
                                          . #4#)
                                    (LETT |n|
                                          (SPADCALL
                                           (SPADCALL |nf| (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (SPADCALL |np| (QREFELT $ 18))
                                    (LETT |res|
                                          (|FLIOUFUN;ei_series| |z| |n| $)
                                          . #4#)
                                    (SPADCALL |obits| (QREFELT $ 18))
                                    (EXIT
                                     (PROGN
                                      (LETT #2#
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 23))
                                              (SPADCALL |z| (QREFELT $ 68))
                                              (QREFELT $ 34))
                                             |res| (QREFELT $ 34))
                                            . #4#)
                                      (GO #6=#:G809))))
                                   . #4#)
                             (GO #7=#:G804)))))))
                       #7# (EXIT #1#))))
                    (SPADCALL |prec| (QREFELT $ 18))
                    (LETT |pii| (SPADCALL (QREFELT $ 35)) . #4#)
                    (LETT |im_z| (SPADCALL |z| (QREFELT $ 58)) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 69))
                       (COND
                        ((SPADCALL (SPADCALL |z| (QREFELT $ 53))
                                   (SPADCALL |im_z| (QREFELT $ 22))
                                   (QREFELT $ 40))
                         (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $))
                        (#5#
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 7)
                                    (SPADCALL |pii| (QREFELT $ 22))
                                    (QREFELT $ 16))
                          (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $)
                          (QREFELT $ 34)))))
                      ((SPADCALL (SPADCALL |z| (QREFELT $ 53)) |im_z|
                                 (QREFELT $ 40))
                       (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $))
                      (#5#
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 7) |pii| (QREFELT $ 16))
                        (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $)
                        (QREFELT $ 34)))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;Ei;2C;22| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;Ei;2C;22|)
                (EXIT
                 (|finally| (|FLIOUFUN;ei_z| |z| $)
                            (SPADCALL |obits| (QREFELT $ 18))))))) 

(SDEFUN |FLIOUFUN;Ei;2F;23| ((|x| |Float|) ($ |Float|))
        (COND
         ((SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 71))
          (|error| "Ei: x <= 0"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
                     (QREFELT $ 70))
           (QREFELT $ 53))))) 

(SDEFUN |FLIOUFUN;li;2C;24| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG ((|z1| (|Complex| (|Float|))) (|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 10))
                      . #1=(|FLIOUFUN;li;2C;24|))
                (EXIT
                 (|finally|
                  (SEQ (SPADCALL (+ |obits| 5) (QREFELT $ 18))
                       (LETT |z1| (SPADCALL |z| (QREFELT $ 68)) . #1#)
                       (EXIT (SPADCALL |z1| (QREFELT $ 70))))
                  (SPADCALL |obits| (QREFELT $ 18))))))) 

(SDEFUN |FLIOUFUN;li;2F;25| ((|x| |Float|) ($ |Float|))
        (COND
         ((SPADCALL |x| (|spadConstant| $ 19) (QREFELT $ 71))
          (|error| "li: x <= 1"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
                     (QREFELT $ 73))
           (QREFELT $ 53))))) 

(SDEFUN |FLIOUFUN;ci_series|
        ((|z| |Complex| (|Float|)) (|n| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|tk| #1=(|Complex| (|Float|))) (|k2| (|NonNegativeInteger|))
          (|res| (|Complex| (|Float|))) (|term| #1#)
          (|k1| (|NonNegativeInteger|)) (#2=#:G823 NIL) (|i| NIL)
          (|z2| (|Complex| (|Float|))))
         (SEQ
          (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24))
                . #3=(|FLIOUFUN;ci_series|))
          (LETT |tk|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 19) (SPADCALL 2 (QREFELT $ 28))
                            (QREFELT $ 31))
                  (QREFELT $ 22))
                 |z2| (QREFELT $ 33))
                . #3#)
          (LETT |res| (|spadConstant| $ 25) . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #2# |n| . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |k1| (SPADCALL 2 |i| (QREFELT $ 27)) . #3#)
                    (LETT |term|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 19)
                                     (SPADCALL |k1| (QREFELT $ 28))
                                     (QREFELT $ 31))
                           |tk| (QREFELT $ 33))
                          . #3#)
                    (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #3#)
                    (LETT |k2|
                          (* (+ (SPADCALL 2 |i| (QREFELT $ 27)) 1)
                             (+ (SPADCALL 2 |i| (QREFELT $ 27)) 2))
                          . #3#)
                    (EXIT
                     (LETT |tk|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 19)
                                        (SPADCALL |k2| (QREFELT $ 28))
                                        (QREFELT $ 31))
                              (QREFELT $ 22))
                             |z2| (QREFELT $ 33))
                            |tk| (QREFELT $ 24))
                           . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |FLIOUFUN;ci_asymptotic|
        ((|z| |Complex| (|Float|)) (|prec| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|term| (|Complex| (|Float|))) (|res_c| #1=(|Complex| (|Float|)))
          (|res_s| #1#) (|k| NIL) (|z_inv| (|Complex| (|Float|)))
          (|eps| (|Float|)))
         (SEQ
          (LETT |eps|
                (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                          (QREFELT $ 37))
                . #2=(|FLIOUFUN;ci_asymptotic|))
          (LETT |z_inv| (SPADCALL (|spadConstant| $ 32) |z| (QREFELT $ 38))
                . #2#)
          (LETT |term| (|spadConstant| $ 32) . #2#)
          (LETT |res_c| (|spadConstant| $ 25) . #2#)
          (LETT |res_s| (|spadConstant| $ 25) . #2#)
          (SEQ (LETT |k| 0 . #2#) G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps|
                            (QREFELT $ 40)))
                 (GO G191)))
               (SEQ
                (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 34)) . #2#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 27)) 1)
                                   (QREFELT $ 28))
                         |z_inv| (QREFELT $ 33))
                        |term| (QREFELT $ 24))
                       (QREFELT $ 41))
                      . #2#)
                (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 34)) . #2#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 27)) 2)
                                   (QREFELT $ 28))
                         |z_inv| (QREFELT $ 33))
                        |term| (QREFELT $ 24))
                       . #2#)))
               (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |z_inv|
                     (SPADCALL
                      (SPADCALL (SPADCALL |z| (QREFELT $ 61)) |res_c|
                                (QREFELT $ 24))
                      (SPADCALL (SPADCALL |z| (QREFELT $ 62)) |res_s|
                                (QREFELT $ 24))
                      (QREFELT $ 34))
                     (QREFELT $ 24)))))) 

(SDEFUN |FLIOUFUN;ci_z| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((|pi_fac| (|Float|)) (#1=#:G834 NIL) (#2=#:G835 NIL)
          (|res| (|Complex| (|Float|))) (|n| (|Integer|))
          (|nf| #3=(|DoubleFloat|)) (|np| (|PositiveInteger|)) (|npf| #3#)
          (|sp| (|DoubleFloat|)) (|dnz| (|DoubleFloat|)) (|oz| (|Integer|))
          (|prec| (|PositiveInteger|)) (|nz| (|Float|))
          (|obits| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #4=(|FLIOUFUN;ci_z|))
                (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #4#)
                (LETT |prec| (+ |obits| 20) . #4#)
                (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #4#)
                (EXIT
                 (COND
                  ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
                   (|error| "reqested too high precision"))
                  (#5='T
                   (SEQ
                    (COND
                     ((< |oz| 1000)
                      (SEQ
                       (EXIT
                        (SEQ
                         (LETT |dnz|
                               (SPADCALL (SPADCALL |nz| (QREFELT $ 47))
                                         (QREFELT $ 67))
                               . #4#)
                         (LETT |sp|
                               (|mul_DF_I|
                                (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                          (QREFELT $ 49))
                                |prec|)
                               . #4#)
                         (EXIT
                          (COND
                           ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                            (PROGN
                             (LETT #1#
                                   (SEQ
                                    (LETT |npf|
                                          (|add_DF|
                                           (|mul_DF|
                                            (SPADCALL
                                             (SPADCALL 2000 693 (QREFELT $ 48))
                                             (QREFELT $ 49))
                                            |dnz|)
                                           (FLOAT |prec|
                                                  MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #4#)
                                    (LETT |np|
                                          (SPADCALL
                                           (SPADCALL |npf| (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (LETT |nf|
                                          (|add_DF|
                                           (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                           |sp|)
                                          . #4#)
                                    (LETT |n|
                                          (SPADCALL
                                           (SPADCALL
                                            (|div_DF| |nf|
                                                      (FLOAT 2
                                                             MOST-POSITIVE-DOUBLE-FLOAT))
                                            (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (SPADCALL |np| (QREFELT $ 18))
                                    (LETT |res|
                                          (|FLIOUFUN;ci_series| |z| |n| $)
                                          . #4#)
                                    (SPADCALL |obits| (QREFELT $ 18))
                                    (EXIT
                                     (PROGN
                                      (LETT #2#
                                            (SPADCALL
                                             (SPADCALL |res|
                                                       (SPADCALL
                                                        (QREFELT $ 23))
                                                       (QREFELT $ 34))
                                             (SPADCALL |z| (QREFELT $ 68))
                                             (QREFELT $ 34))
                                            . #4#)
                                      (GO #6=#:G833))))
                                   . #4#)
                             (GO #7=#:G829)))))))
                       #7# (EXIT #1#))))
                    (SPADCALL |prec| (QREFELT $ 18))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |z| (QREFELT $ 53))
                                 (|spadConstant| $ 7) (QREFELT $ 40))
                       (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) $))
                      (#5#
                       (SEQ (LETT |pi_fac| (SPADCALL (QREFELT $ 35)) . #4#)
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |z| (QREFELT $ 58))
                                         (|spadConstant| $ 7) (QREFELT $ 69))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 7)
                                          (SPADCALL |pi_fac| (QREFELT $ 22))
                                          (QREFELT $ 16))
                                (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) $)
                                (QREFELT $ 34)))
                              (#5#
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 7) |pi_fac|
                                          (QREFELT $ 16))
                                (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) $)
                                (QREFELT $ 34)))))))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;Ci;2C;29| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;Ci;2C;29|)
                (EXIT
                 (|finally| (|FLIOUFUN;ci_z| |z| $)
                            (SPADCALL |obits| (QREFELT $ 18))))))) 

(SDEFUN |FLIOUFUN;Ci;2F;30| ((|x| |Float|) ($ |Float|))
        (COND
         ((SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 71))
          (|error| "Ci: x <= 0"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
                     (QREFELT $ 75))
           (QREFELT $ 53))))) 

(SDEFUN |FLIOUFUN;Chi;2C;31|
        ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (SPADCALL (|spadConstant| $ 7) (|spadConstant| $ 19)
                      (QREFELT $ 16))
            |z| (QREFELT $ 24))
           (QREFELT $ 75))
          (SPADCALL |z| (QREFELT $ 68)) (QREFELT $ 34))
         (SPADCALL
          (SPADCALL
           (SPADCALL (|spadConstant| $ 7) (|spadConstant| $ 19) (QREFELT $ 16))
           |z| (QREFELT $ 24))
          (QREFELT $ 68))
         (QREFELT $ 54))) 

(SDEFUN |FLIOUFUN;Chi;2F;32| ((|x| |Float|) ($ |Float|))
        (COND
         ((SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 71))
          (|error| "Chi: x <= 0"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
                     (QREFELT $ 77))
           (QREFELT $ 53))))) 

(SDEFUN |FLIOUFUN;si_series|
        ((|z| . #1=(|Complex| (|Float|))) (|n| |Integer|)
         ($ |Complex| (|Float|)))
        (SPROG
         ((|tk| #1#) (|k2| (|NonNegativeInteger|))
          (|res| (|Complex| (|Float|))) (|term| (|Complex| (|Float|)))
          (|k1| (|NonNegativeInteger|)) (#2=#:G845 NIL) (|i| NIL)
          (|z2| (|Complex| (|Float|))))
         (SEQ
          (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24))
                . #3=(|FLIOUFUN;si_series|))
          (LETT |tk| |z| . #3#) (LETT |res| (|spadConstant| $ 25) . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# |n| . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |k1| (+ (SPADCALL 2 |i| (QREFELT $ 27)) 1) . #3#)
                    (LETT |term|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 19)
                                     (SPADCALL |k1| (QREFELT $ 28))
                                     (QREFELT $ 31))
                           |tk| (QREFELT $ 33))
                          . #3#)
                    (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #3#)
                    (LETT |k2|
                          (* (+ (SPADCALL 2 |i| (QREFELT $ 27)) 2)
                             (+ (SPADCALL 2 |i| (QREFELT $ 27)) 3))
                          . #3#)
                    (EXIT
                     (LETT |tk|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 19)
                                        (SPADCALL |k2| (QREFELT $ 28))
                                        (QREFELT $ 31))
                              (QREFELT $ 22))
                             |z2| (QREFELT $ 33))
                            |tk| (QREFELT $ 24))
                           . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |FLIOUFUN;si_asymptotic|
        ((|z| |Complex| (|Float|)) (|prec| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|term| (|Complex| (|Float|))) (|res_s| #1=(|Complex| (|Float|)))
          (|res_c| #1#) (|k| NIL) (|z_inv| (|Complex| (|Float|)))
          (|eps| (|Float|)))
         (SEQ
          (LETT |eps|
                (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                          (QREFELT $ 37))
                . #2=(|FLIOUFUN;si_asymptotic|))
          (LETT |z_inv| (SPADCALL (|spadConstant| $ 32) |z| (QREFELT $ 38))
                . #2#)
          (LETT |term| (|spadConstant| $ 32) . #2#)
          (LETT |res_c| (|spadConstant| $ 25) . #2#)
          (LETT |res_s| (|spadConstant| $ 25) . #2#)
          (SEQ (LETT |k| 0 . #2#) G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps|
                            (QREFELT $ 40)))
                 (GO G191)))
               (SEQ
                (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 34)) . #2#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 27)) 1)
                                  (QREFELT $ 28))
                        |z_inv| (QREFELT $ 33))
                       |term| (QREFELT $ 24))
                      . #2#)
                (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 34)) . #2#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 27)) 2)
                                    (QREFELT $ 28))
                          |z_inv| (QREFELT $ 33))
                         |term| (QREFELT $ 24))
                        (QREFELT $ 41))
                       . #2#)))
               (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |z_inv|
                     (SPADCALL
                      (SPADCALL (SPADCALL |z| (QREFELT $ 61)) |res_c|
                                (QREFELT $ 24))
                      (SPADCALL (SPADCALL |z| (QREFELT $ 62)) |res_s|
                                (QREFELT $ 24))
                      (QREFELT $ 34))
                     (QREFELT $ 24)))))) 

(SDEFUN |FLIOUFUN;si_z| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((|pi_fac| (|Float|)) (#1=#:G855 NIL) (#2=#:G856 NIL)
          (|res| (|Complex| (|Float|))) (|n| (|Integer|))
          (|nf| #3=(|DoubleFloat|)) (|np| (|PositiveInteger|)) (|npf| #3#)
          (|sp| (|DoubleFloat|)) (|dnz| (|DoubleFloat|)) (|oz| (|Integer|))
          (|prec| (|PositiveInteger|)) (|nz| (|Float|))
          (|obits| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #4=(|FLIOUFUN;si_z|))
                (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #4#)
                (LETT |prec| (+ |obits| 20) . #4#)
                (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #4#)
                (EXIT
                 (COND
                  ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
                   (|error| "reqested too high precision"))
                  (#5='T
                   (SEQ
                    (COND
                     ((< |oz| 1000)
                      (SEQ
                       (EXIT
                        (SEQ
                         (LETT |dnz|
                               (SPADCALL (SPADCALL |nz| (QREFELT $ 47))
                                         (QREFELT $ 67))
                               . #4#)
                         (LETT |sp|
                               (|mul_DF_I|
                                (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                          (QREFELT $ 49))
                                |prec|)
                               . #4#)
                         (EXIT
                          (COND
                           ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                            (PROGN
                             (LETT #1#
                                   (SEQ
                                    (LETT |npf|
                                          (|add_DF|
                                           (|mul_DF|
                                            (SPADCALL
                                             (SPADCALL 2000 693 (QREFELT $ 48))
                                             (QREFELT $ 49))
                                            |dnz|)
                                           (FLOAT |prec|
                                                  MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #4#)
                                    (LETT |np|
                                          (SPADCALL
                                           (SPADCALL |npf| (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (LETT |nf|
                                          (|add_DF|
                                           (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                           |sp|)
                                          . #4#)
                                    (LETT |n|
                                          (SPADCALL
                                           (SPADCALL
                                            (|div_DF| |nf|
                                                      (FLOAT 2
                                                             MOST-POSITIVE-DOUBLE-FLOAT))
                                            (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #4#)
                                    (SPADCALL |np| (QREFELT $ 18))
                                    (LETT |res|
                                          (|FLIOUFUN;si_series| |z| |n| $)
                                          . #4#)
                                    (SPADCALL |obits| (QREFELT $ 18))
                                    (EXIT
                                     (PROGN
                                      (LETT #2# |res| . #4#)
                                      (GO #6=#:G854))))
                                   . #4#)
                             (GO #7=#:G851)))))))
                       #7# (EXIT #1#))))
                    (SPADCALL |prec| (QREFELT $ 18))
                    (LETT |pi_fac|
                          (SPADCALL (SPADCALL (QREFELT $ 35))
                                    (SPADCALL 2 (QREFELT $ 28)) (QREFELT $ 31))
                          . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |z| (QREFELT $ 53))
                                 (|spadConstant| $ 7) (QREFELT $ 40))
                       (SPADCALL
                        (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                        (|FLIOUFUN;si_asymptotic| |z| (+ |obits| 5) $)
                        (QREFELT $ 54)))
                      (#5#
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |pi_fac| (|spadConstant| $ 7)
                                   (QREFELT $ 16))
                         (|FLIOUFUN;si_asymptotic|
                          (SPADCALL |z| (QREFELT $ 41)) (+ |obits| 5) $)
                         (QREFELT $ 54))
                        (QREFELT $ 41)))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;Si;2C;36| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;Si;2C;36|)
                (EXIT
                 (|finally| (|FLIOUFUN;si_z| |z| $)
                            (SPADCALL |obits| (QREFELT $ 18))))))) 

(SDEFUN |FLIOUFUN;Si;2F;37| ((|z| |Float|) ($ |Float|))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16))
                   (QREFELT $ 79))
         (QREFELT $ 53))) 

(SDEFUN |FLIOUFUN;Shi;2C;38|
        ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|spadConstant| $ 7) (|spadConstant| $ 19) (QREFELT $ 16))
          (SPADCALL
           (SPADCALL
            (SPADCALL (|spadConstant| $ 7) (|spadConstant| $ 19)
                      (QREFELT $ 16))
            |z| (QREFELT $ 24))
           (QREFELT $ 79))
          (QREFELT $ 24))
         (QREFELT $ 41))) 

(SDEFUN |FLIOUFUN;Shi;2F;39| ((|x| |Float|) ($ |Float|))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
                   (QREFELT $ 81))
         (QREFELT $ 53))) 

(DECLAIM (NOTINLINE |FloatLiouvilianFunctions;|)) 

(DEFUN |FloatLiouvilianFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G863)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FloatLiouvilianFunctions|)
                    . #2=(|FloatLiouvilianFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FloatLiouvilianFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|FloatLiouvilianFunctions;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|FloatLiouvilianFunctions|)))))))))) 

(DEFUN |FloatLiouvilianFunctions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FloatLiouvilianFunctions|)
                . #1=(|FloatLiouvilianFunctions|))
          (LETT $ (GETREFV 83) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FloatLiouvilianFunctions| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (CONS -1 (|spadConstant| $ 7)))
          $))) 

(MAKEPROP '|FloatLiouvilianFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Float|) (0 . |Zero|) 'G
              (|PositiveInteger|) (4 . |bits|) (8 . |precision|) (|Boolean|)
              (|Integer|) (12 . <=) (|Complex| 6) (18 . |complex|) (24 . *)
              (30 . |bits|) (35 . |One|) (|FloatSpecialFunctions|)
              (39 . |digamma|) (44 . -) |FLIOUFUN;gamma;C;1| (49 . *)
              (55 . |Zero|) (|NonNegativeInteger|) (59 . *) (65 . |coerce|)
              (|Fraction| 13) (70 . |One|) (74 . /) (80 . |One|) (84 . *)
              (90 . +) (96 . |pi|) (100 . |sqrt|) (105 . |float|) (112 . /)
              (118 . |norm|) (123 . >) (129 . -) (134 . |exp|) (139 . *)
              (145 . |order|) (150 . >) (|DoubleFloat|) (156 . |coerce|)
              (161 . /) (167 . |coerce|) (172 . >) (178 . |round|)
              (183 . |retract|) (188 . |real|) (193 . -) |FLIOUFUN;erf;2C;5|
              |FLIOUFUN;erf;2F;6| |FLIOUFUN;erfi;2C;7| (199 . |imag|)
              |FLIOUFUN;erfi;2F;8| (204 . |coerce|) (209 . |cos|) (214 . |sin|)
              |FLIOUFUN;fresnelC;2C;12| |FLIOUFUN;fresnelC;2F;13|
              |FLIOUFUN;fresnelS;2C;17| |FLIOUFUN;fresnelS;2F;18|
              (219 . |sqrt|) (224 . |log|) (229 . <) |FLIOUFUN;Ei;2C;22|
              (235 . <=) |FLIOUFUN;Ei;2F;23| |FLIOUFUN;li;2C;24|
              |FLIOUFUN;li;2F;25| |FLIOUFUN;Ci;2C;29| |FLIOUFUN;Ci;2F;30|
              |FLIOUFUN;Chi;2C;31| |FLIOUFUN;Chi;2F;32| |FLIOUFUN;Si;2C;36|
              |FLIOUFUN;Si;2F;37| |FLIOUFUN;Shi;2C;38| |FLIOUFUN;Shi;2F;39|)
           '#(|li| 241 |gamma| 251 |fresnelS| 255 |fresnelC| 265 |erfi| 275
              |erf| 285 |Si| 295 |Shi| 305 |Ei| 315 |Ci| 325 |Chi| 335)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 82
                                                 '(0 6 0 7 0 6 9 10 0 6 9 11 2
                                                   13 12 0 0 14 2 15 0 6 6 16 2
                                                   13 0 9 0 17 1 6 9 9 18 0 6 0
                                                   19 1 20 6 6 21 1 6 0 0 22 2
                                                   15 0 0 0 24 0 15 0 25 2 26 0
                                                   9 0 27 1 6 0 13 28 0 29 0 30
                                                   2 6 0 0 0 31 0 15 0 32 2 15
                                                   0 6 0 33 2 15 0 0 0 34 0 6 0
                                                   35 1 6 0 0 36 3 6 0 13 13 9
                                                   37 2 15 0 0 0 38 1 15 6 0 39
                                                   2 6 12 0 0 40 1 15 0 0 41 1
                                                   15 0 0 42 2 15 0 0 6 43 1 6
                                                   13 0 44 2 13 12 0 0 45 1 6
                                                   46 0 47 2 29 0 13 13 48 1 46
                                                   0 29 49 2 46 12 0 0 50 1 46
                                                   0 0 51 1 46 13 0 52 1 15 6 0
                                                   53 2 15 0 0 0 54 1 15 6 0 58
                                                   1 6 0 29 60 1 15 0 0 61 1 15
                                                   0 0 62 1 46 0 0 67 1 15 0 0
                                                   68 2 6 12 0 0 69 2 6 12 0 0
                                                   71 1 0 6 6 74 1 0 15 15 73 0
                                                   0 15 23 1 0 6 6 66 1 0 15 15
                                                   65 1 0 15 15 63 1 0 6 6 64 1
                                                   0 15 15 57 1 0 6 6 59 1 0 6
                                                   6 56 1 0 15 15 55 1 0 6 6 80
                                                   1 0 15 15 79 1 0 15 15 81 1
                                                   0 6 6 82 1 0 6 6 72 1 0 15
                                                   15 70 1 0 15 15 75 1 0 6 6
                                                   76 1 0 6 6 78 1 0 15 15
                                                   77)))))
           '|lookupComplete|)) 

(MAKEPROP '|FloatLiouvilianFunctions| 'NILADIC T) 
