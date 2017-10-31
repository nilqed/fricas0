
(SDEFUN |RDEEFX;top_kernel| ((|f| F) (|g| F) (|x| |Symbol|) ($ |Kernel| F))
        (SPROG
         ((|extra_tk| (|Boolean|)) (|tk| (|Kernel| F))
          (|htk| #1=(|NonNegativeInteger|)) (|hk| #1#) (#2=#:G894 NIL)
          (|k| NIL) (|lk| (|List| (|Kernel| F))) (|lkf| (|List| (|Kernel| F))))
         (SEQ
          (LETT |lkf|
                (SPADCALL (SPADCALL |f| (QREFELT $ 11)) |x| (QREFELT $ 15))
                . #3=(|RDEEFX;top_kernel|))
          (LETT |lk|
                (SPADCALL
                 (SPADCALL (SPADCALL |g| (QREFELT $ 11)) |x| (QREFELT $ 15))
                 |lkf| (QREFELT $ 16))
                . #3#)
          (LETT |tk| (|SPADfirst| |lk|) . #3#)
          (LETT |htk| (SPADCALL |tk| (QREFELT $ 19)) . #3#)
          (LETT |extra_tk| (NULL (SPADCALL |tk| |lkf| (QREFELT $ 21))) . #3#)
          (SEQ (LETT |k| NIL . #3#) (LETT #2# (CDR |lk|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |hk| (SPADCALL |k| (QREFELT $ 19)) . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |hk| |htk| (QREFELT $ 22))
                       (SEQ (LETT |tk| |k| . #3#) (LETT |htk| |hk| . #3#)
                            (EXIT
                             (LETT |extra_tk|
                                   (NULL (SPADCALL |tk| |lkf| (QREFELT $ 21)))
                                   . #3#))))
                      ((< |hk| |htk|) "iterate")
                      ('T
                       (SEQ
                        (COND
                         ((SPADCALL |tk| '|exp| (QREFELT $ 23))
                          (COND (|extra_tk| (EXIT "iterate")))))
                        (COND
                         ((SPADCALL |k| '|exp| (QREFELT $ 23))
                          (COND
                           ((NULL (SPADCALL |k| |lkf| (QREFELT $ 21)))
                            (EXIT
                             (SEQ (LETT |tk| |k| . #3#)
                                  (EXIT (LETT |extra_tk| 'T . #3#))))))))
                        (EXIT
                         (COND
                          ((SPADCALL |tk| '|exp| (QREFELT $ 23)) "iterate")
                          ((SPADCALL |k| '|exp| (QREFELT $ 23))
                           (SEQ (LETT |tk| |k| . #3#)
                                (EXIT (LETT |extra_tk| NIL . #3#))))
                          ('T
                           (SEQ
                            (COND
                             ((SPADCALL |tk| '|log| (QREFELT $ 23))
                              (COND (|extra_tk| (EXIT "iterate")))))
                            (COND
                             ((SPADCALL |k| '|log| (QREFELT $ 23))
                              (COND
                               ((NULL (SPADCALL |k| |lkf| (QREFELT $ 21)))
                                (EXIT
                                 (SEQ (LETT |tk| |k| . #3#)
                                      (EXIT (LETT |extra_tk| 'T . #3#))))))))
                            (EXIT
                             (COND
                              ((SPADCALL |tk| '|log| (QREFELT $ 23)) "iterate")
                              ((SPADCALL |k| '|log| (QREFELT $ 23))
                               (SEQ (LETT |tk| |k| . #3#)
                                    (EXIT (LETT |extra_tk| NIL . #3#))))
                              ((SPADCALL (SPADCALL |tk| (QREFELT $ 25))
                                         (QREFELT $ 8) (QREFELT $ 26))
                               (COND
                                ((SPADCALL (SPADCALL |k| (QREFELT $ 25))
                                           (QREFELT $ 8) (QREFELT $ 26))
                                 (COND (|extra_tk| "iterate")
                                       ((NULL
                                         (SPADCALL |k| |lkf| (QREFELT $ 21)))
                                        (SEQ (LETT |tk| |k| . #3#)
                                             (EXIT
                                              (LETT |extra_tk| 'T . #3#))))))
                                ('T
                                 (SEQ (LETT |tk| |k| . #3#)
                                      (EXIT
                                       (LETT |extra_tk|
                                             (NULL
                                              (SPADCALL |k| |lkf|
                                                        (QREFELT $ 21)))
                                             . #3#)))))))))))))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |tk|)))) 

(SDEFUN |RDEEFX;genus0_if_can|
        ((|k| |Kernel| F) (|kx| |Kernel| F)
         ($ |Union|
          (|Record| (|:| |coef1| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |coef2| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |exponent| (|NonNegativeInteger|)))
          "failed"))
        (SPROG
         ((|c1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|d| (F))
          (|c| (F)) (|b| (F)) (|a| (F))
          (|drf| (|SparseUnivariatePolynomial| F))
          (|nrf| (|SparseUnivariatePolynomial| F))
          (|r1rf| (|Fraction| (|SparseUnivariatePolynomial| F))) (|r1| (F))
          (|n| (|NonNegativeInteger|)) (#1=#:G908 NIL) (|args| (|List| F)))
         (SEQ
          (COND
           ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 23))) (CONS 1 "failed"))
           ('T
            (SEQ
             (LETT |args| (SPADCALL |k| (QREFELT $ 28))
                   . #2=(|RDEEFX;genus0_if_can|))
             (LETT |n|
                   (PROG1
                       (LETT #1#
                             (SPADCALL (SPADCALL |args| 2 (QREFELT $ 30))
                                       (QREFELT $ 31))
                             . #2#)
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#))
                   . #2#)
             (LETT |r1| (SPADCALL |args| 1 (QREFELT $ 30)) . #2#)
             (LETT |r1rf| (SPADCALL |r1| |kx| (QREFELT $ 36)) . #2#)
             (LETT |nrf| (SPADCALL |r1rf| (QREFELT $ 39)) . #2#)
             (LETT |drf| (SPADCALL |r1rf| (QREFELT $ 40)) . #2#)
             (COND
              ((OR (SPADCALL (SPADCALL |nrf| (QREFELT $ 41)) 1 (QREFELT $ 42))
                   (SPADCALL (SPADCALL |drf| (QREFELT $ 41)) 1 (QREFELT $ 42)))
               (EXIT (CONS 1 "failed"))))
             (LETT |a| (SPADCALL |nrf| 1 (QREFELT $ 43)) . #2#)
             (LETT |b| (SPADCALL |nrf| 0 (QREFELT $ 43)) . #2#)
             (LETT |c| (SPADCALL |drf| 1 (QREFELT $ 43)) . #2#)
             (LETT |d| (SPADCALL |drf| 0 (QREFELT $ 43)) . #2#)
             (LETT |c1|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |d| |n| (QREFELT $ 46))
                               (SPADCALL |b| (QREFELT $ 47)) (QREFELT $ 48))
                     (QREFELT $ 49))
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |c| (QREFELT $ 50)) |n|
                                (QREFELT $ 46))
                      (SPADCALL |a| (QREFELT $ 47)) (QREFELT $ 51))
                     (QREFELT $ 49))
                    (QREFELT $ 52))
                   . #2#)
             (EXIT (CONS 0 (VECTOR |c1| |r1rf| |n|))))))))) 

(SDEFUN |RDEEFX;ei_int_alg|
        ((|n| |Integer|) (|f| F) (|g| F) (|x| |Symbol|) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F))
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|ansp| (F)) (|a1| (F)) (|r1| (F)) (|kf| (F))
          (|res1|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|nf| (F)) (|ng| (F)) (|dfx| (F)) (|fy| (F)) (|fx| (F))
          (|nxk| (|Kernel| F)) (|nx| (|Symbol|))
          (|cv|
           (|Record|
            (|:| |coef1| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coef2| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |exponent| (|NonNegativeInteger|))))
          (|cvu|
           (|Union|
            (|Record|
             (|:| |coef1| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coef2| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (|kx| (|Kernel| F)))
         (SEQ
          (LETT |kx| (SPADCALL |lk| (QREFELT $ 53)) . #1=(|RDEEFX;ei_int_alg|))
          (COND
           ((NULL (QEQCAR (SPADCALL |kx| (QREFELT $ 55)) 0))
            (EXIT (SPADCALL |f| |g| |x| (CONS |k| |lk|) (QREFELT $ 58)))))
          (LETT |cvu| (|RDEEFX;genus0_if_can| |k| |kx| $) . #1#)
          (EXIT
           (COND
            ((QEQCAR |cvu| 1)
             (SPADCALL |f| |g| |x| (CONS |k| |lk|) (QREFELT $ 58)))
            ('T
             (SEQ (LETT |cv| (QCDR |cvu|) . #1#)
                  (LETT |nx| (SPADCALL (QREFELT $ 59)) . #1#)
                  (LETT |nxk| (SPADCALL |nx| (QREFELT $ 60)) . #1#)
                  (LETT |fx| (SPADCALL (QVELT |cv| 0) |nxk| (QREFELT $ 62))
                        . #1#)
                  (LETT |fy| (SPADCALL |nxk| (QREFELT $ 63)) . #1#)
                  (LETT |dfx| (SPADCALL |fx| |nx| (QREFELT $ 64)) . #1#)
                  (LETT |ng|
                        (SPADCALL |dfx|
                                  (SPADCALL |g| (LIST |kx| |k|)
                                            (LIST |fx| |fy|) (QREFELT $ 66))
                                  (QREFELT $ 67))
                        . #1#)
                  (LETT |nf|
                        (SPADCALL |f| (LIST |kx| |k|) (LIST |fx| |fy|)
                                  (QREFELT $ 66))
                        . #1#)
                  (LETT |res1| (SPADCALL |n| |nf| |ng| |nx| (QREFELT $ 68))
                        . #1#)
                  (LETT |kf| (SPADCALL |k| (QREFELT $ 63)) . #1#)
                  (LETT |r1|
                        (SPADCALL
                         (SPADCALL (QVELT |res1| 1) |dfx| (QREFELT $ 69)) |nxk|
                         |kf| (QREFELT $ 70))
                        . #1#)
                  (LETT |a1|
                        (SPADCALL (QVELT |res1| 0) |nxk| |kf| (QREFELT $ 70))
                        . #1#)
                  (LETT |ansp|
                        (SPADCALL (QVELT |res1| 2) |nxk| |kf| (QREFELT $ 70))
                        . #1#)
                  (EXIT (VECTOR |a1| |r1| |ansp| (QVELT |res1| 3)))))))))) 

(SDEFUN |RDEEFX;UP_to_UPUP|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
        (SPADCALL (ELT $ 47) |p| (QREFELT $ 74))) 

(SDEFUN |RDEEFX;get_uv0|
        ((|tt| F) (|coeffs| |List| (|Integer|)) (|vlst| |List| F)
         (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         ($ |Record| (|:| |u_part| F) (|:| |v_part| F)
          (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
        (SPROG
         ((|kc| #1=(|Integer|)) (#2=#:G959 NIL) (|vi| NIL) (#3=#:G960 NIL)
          (|ki| NIL) (|kf| (F)) (|u| (F)) (#4=#:G957 NIL) (|ui| NIL)
          (#5=#:G958 NIL) (#6=#:G956 NIL) (|ku| #1#) (#7=#:G954 NIL)
          (#8=#:G955 NIL) (|v0| (F)) (#9=#:G952 NIL) (#10=#:G953 NIL)
          (#11=#:G951 NIL))
         (SEQ
          (LETT |v0|
                (SPADCALL |tt|
                          (SPADCALL (ELT $ 75)
                                    (PROGN
                                     (LETT #11# NIL . #12=(|RDEEFX;get_uv0|))
                                     (SEQ (LETT |ki| NIL . #12#)
                                          (LETT #10# |coeffs| . #12#)
                                          (LETT |vi| NIL . #12#)
                                          (LETT #9# |vlst| . #12#) G190
                                          (COND
                                           ((OR (ATOM #9#)
                                                (PROGN
                                                 (LETT |vi| (CAR #9#) . #12#)
                                                 NIL)
                                                (ATOM #10#)
                                                (PROGN
                                                 (LETT |ki| (CAR #10#) . #12#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #11#
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL |ki|
                                                              (QREFELT $ 76))
                                                    |vi| (QREFELT $ 67))
                                                   #11#)
                                                  . #12#)))
                                          (LETT #9#
                                                (PROG1 (CDR #9#)
                                                  (LETT #10# (CDR #10#)
                                                        . #12#))
                                                . #12#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #11#))))
                                    (|spadConstant| $ 45) (QREFELT $ 78))
                          (QREFELT $ 79))
                . #12#)
          (LETT |ku| 0 . #12#) (LETT |u| (|spadConstant| $ 33) . #12#)
          (COND
           ((SPADCALL |k| '|exp| (QREFELT $ 23))
            (SEQ (LETT |kf| (SPADCALL |k| (QREFELT $ 63)) . #12#)
                 (EXIT
                  (SEQ (LETT |ki| NIL . #12#) (LETT #8# |coeffs| . #12#)
                       (LETT |ui| NIL . #12#) (LETT #7# |ulst| . #12#) G190
                       (COND
                        ((OR (ATOM #7#)
                             (PROGN (LETT |ui| (CAR #7#) . #12#) NIL)
                             (ATOM #8#)
                             (PROGN (LETT |ki| (CAR #8#) . #12#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |ui| |kf| (QREFELT $ 80))
                           (LETT |ku| |ki| . #12#))
                          ('T
                           (LETT |u|
                                 (SPADCALL |u|
                                           (SPADCALL |ui| |ki| (QREFELT $ 81))
                                           (QREFELT $ 67))
                                 . #12#)))))
                       (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #12#))
                             . #12#)
                       (GO G190) G191 (EXIT NIL)))))
           ('T
            (LETT |u|
                  (SPADCALL (ELT $ 67)
                            (PROGN
                             (LETT #6# NIL . #12#)
                             (SEQ (LETT |ki| NIL . #12#)
                                  (LETT #5# |coeffs| . #12#)
                                  (LETT |ui| NIL . #12#)
                                  (LETT #4# |ulst| . #12#) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN
                                         (LETT |ui| (CAR #4#) . #12#)
                                         NIL)
                                        (ATOM #5#)
                                        (PROGN
                                         (LETT |ki| (CAR #5#) . #12#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (SPADCALL |ui| |ki| (QREFELT $ 81))
                                           #6#)
                                          . #12#)))
                                  (LETT #4#
                                        (PROG1 (CDR #4#)
                                          (LETT #5# (CDR #5#) . #12#))
                                        . #12#)
                                  (GO G190) G191 (EXIT (NREVERSE #6#))))
                            (|spadConstant| $ 33) (QREFELT $ 78))
                  . #12#)))
          (LETT |kc| 0 . #12#)
          (COND
           ((SPADCALL |k| '|log| (QREFELT $ 23))
            (SEQ (LETT |kf| (SPADCALL |k| (QREFELT $ 63)) . #12#)
                 (EXIT
                  (SEQ (LETT |ki| NIL . #12#) (LETT #3# |coeffs| . #12#)
                       (LETT |vi| NIL . #12#) (LETT #2# |vlst| . #12#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |vi| (CAR #2#) . #12#) NIL)
                             (ATOM #3#)
                             (PROGN (LETT |ki| (CAR #3#) . #12#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |vi| |kf| (QREFELT $ 80))
                           (LETT |kc| |ki| . #12#)))))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #12#))
                             . #12#)
                       (GO G190) G191 (EXIT NIL))))))
          (EXIT (VECTOR |u| |v0| |ku| |kc|))))) 

(SDEFUN |RDEEFX;get_uv|
        ((|tt| F) (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F)
         (|x| |Symbol|)
         ($ |Union|
          (|Record| (|:| |u_part| F) (|:| |v_part| F)
                    (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
          "failed"))
        (SPROG
         ((|d| #1=(|Integer|))
          (|cd| (|Record| (|:| |num| (|List| (|Integer|))) (|:| |den| #1#)))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|dvvec| (|Vector| F)) (#2=#:G975 NIL) (|vi| NIL) (#3=#:G974 NIL))
         (SEQ
          (LETT |dvvec|
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #4=(|RDEEFX;get_uv|))
                  (SEQ (LETT |vi| NIL . #4#) (LETT #2# |vlst| . #4#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |vi| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3#
                               (CONS (SPADCALL |vi| |x| (QREFELT $ 64)) #3#)
                               . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 (QREFELT $ 83))
                . #4#)
          (LETT |su|
                (SPADCALL |dvvec| (SPADCALL |tt| |x| (QREFELT $ 64))
                          (QREFELT $ 86))
                . #4#)
          (EXIT
           (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                 (#5='T
                  (SEQ (LETT |sv| (QCDR |su|) . #4#)
                       (LETT |cd| (SPADCALL |sv| (QREFELT $ 90)) . #4#)
                       (LETT |d| (QCDR |cd|) . #4#)
                       (EXIT
                        (COND
                         ((SPADCALL |d| 1 (QREFELT $ 91)) (CONS 1 "failed"))
                         (#5#
                          (CONS 0
                                (|RDEEFX;get_uv0| |tt| (QCAR |cd|) |vlst|
                                 |ulst| |k| |x| $)))))))))))) 

(SDEFUN |RDEEFX;handle_factor|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|f1| |SparseUnivariatePolynomial| F) (|r0| |Integer|) (|u0| F)
         (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         (|known_dividing| |Boolean|)
         ($ |Union|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))
          "failed"))
        (SPROG
         ((|ff1| #1=(|SparseUnivariatePolynomial| F)) (#2=#:G995 NIL)
          (|ff3| (|SparseUnivariatePolynomial| F)) (#3=#:G985 NIL) (|ff2| #1#)
          (|ff| #4=(|SparseUnivariatePolynomial| F))
          (|f2pp| #5=(|SparseUnivariatePolynomial| F)) (|tt1| #4#) (|u| (F))
          (|tt| (F)) (|v0| (F)) (|u_exp| (|Integer|))
          (|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|f2| #5#) (|deg1| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |deg1| (SPADCALL |f1| (QREFELT $ 41))
                  . #6=(|RDEEFX;handle_factor|))
            (LETT |tt|
                  (SPADCALL
                   (SPADCALL (SPADCALL |f1| (- |deg1| 1) (QREFELT $ 43))
                             (SPADCALL (SPADCALL |deg1| (QREFELT $ 76))
                                       (SPADCALL |f1| |deg1| (QREFELT $ 43))
                                       (QREFELT $ 67))
                             (QREFELT $ 69))
                   (QREFELT $ 50))
                  . #6#)
            (LETT |f2|
                  (SPADCALL |f1| (QREFELT $ 94)
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 33) 1 (QREFELT $ 46))
                             (SPADCALL |tt| (QREFELT $ 47)) (QREFELT $ 51))
                            (QREFELT $ 95))
                  . #6#)
            (COND
             ((NULL
               (SPADCALL (CONS #'|RDEEFX;handle_factor!0| (VECTOR $ |x|))
                         (SPADCALL |f2| (QREFELT $ 96)) (QREFELT $ 98)))
              (EXIT
               (PROGN (LETT #2# (CONS 1 "failed") . #6#) (GO #7=#:G994)))))
            (LETT |uvu| (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| $) . #6#)
            (EXIT
             (COND
              ((QEQCAR |uvu| 1)
               (PROGN (LETT #2# (CONS 1 "failed") . #6#) (GO #7#)))
              (#8='T
               (SEQ (LETT |uv| (QCDR |uvu|) . #6#)
                    (LETT |u| (QVELT |uv| 0) . #6#)
                    (LETT |u_exp| (QVELT |uv| 2) . #6#)
                    (LETT |v0| (QVELT |uv| 1) . #6#)
                    (COND
                     ((EQL |r0| 0)
                      (SEQ (LETT |r0| (QVELT |uv| 3) . #6#)
                           (EXIT
                            (LETT |tt|
                                  (SPADCALL |tt|
                                            (SPADCALL
                                             (SPADCALL |r0| (QREFELT $ 76))
                                             (SPADCALL |k| (QREFELT $ 63))
                                             (QREFELT $ 67))
                                            (QREFELT $ 79))
                                  . #6#))))
                     (#8#
                      (LETT |u|
                            (SPADCALL (SPADCALL |u0| |r0| (QREFELT $ 81)) |u|
                                      (QREFELT $ 67))
                            . #6#)))
                    (LETT |tt1|
                          (SPADCALL
                           (SPADCALL (SPADCALL |r0| (QREFELT $ 76)) 1
                                     (QREFELT $ 46))
                           (SPADCALL |tt| (QREFELT $ 47)) (QREFELT $ 51))
                          . #6#)
                    (LETT |ff|
                          (SPADCALL |nf| (SPADCALL |tt1| |denf| (QREFELT $ 99))
                                    (QREFELT $ 51))
                          . #6#)
                    (COND
                     ((SPADCALL |deg1| 1 (QREFELT $ 22))
                      (LETT |ff|
                            (SPADCALL
                             (SPADCALL (SPADCALL |denf| 1 (QREFELT $ 100))
                                       (SPADCALL |ff| (QREFELT $ 101))
                                       (QREFELT $ 102))
                             (|RDEEFX;UP_to_UPUP| |f2| $) (QREFELT $ 103))
                            . #6#)))
                    (LETT |f2pp|
                          (COND ((EQL |deg1| 1) (|spadConstant| $ 104))
                                (#8# |f2|))
                          . #6#)
                    (EXIT
                     (COND
                      (|known_dividing|
                       (SEQ
                        (LETT |ff|
                              (SPADCALL |ff| (SPADCALL |ff| (QREFELT $ 105))
                                        (QREFELT $ 106))
                              . #6#)
                        (EXIT
                         (CONS 0
                               (VECTOR |ff| |r0| |tt| |f2pp| |u| |u_exp|
                                       |v0|)))))
                      (#8#
                       (SEQ
                        (LETT |ff2|
                              (LETT |ff1| (SPADCALL |ff| |gd| (QREFELT $ 107))
                                    . #6#)
                              . #6#)
                        (LETT |ff3|
                              (PROG2
                                  (LETT #3#
                                        (SPADCALL |ff| |ff1| (QREFELT $ 109))
                                        . #6#)
                                  (QCDR #3#)
                                (|check_union2| (QEQCAR #3# 0)
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))
                                                (|Union|
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 7))
                                                 #9="failed")
                                                #3#))
                              . #6#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL
                                 (LETT |ff2|
                                       (SPADCALL |ff2| |ff3| (QREFELT $ 107))
                                       . #6#)
                                 (|spadConstant| $ 110) (QREFELT $ 111)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |ff3|
                                     (PROG2
                                         (LETT #3#
                                               (SPADCALL |ff3| |ff2|
                                                         (QREFELT $ 109))
                                               . #6#)
                                         (QCDR #3#)
                                       (|check_union2| (QEQCAR #3# 0)
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT $ 7))
                                                       (|Union|
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT $ 7))
                                                        #9#)
                                                       #3#))
                                     . #6#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (COND
                         ((NULL (EQL (SPADCALL |ff3| (QREFELT $ 41)) 0))
                          (COND
                           ((SPADCALL |k| '|exp| (QREFELT $ 23))
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |ff3| (QREFELT $ 112))
                                         (|spadConstant| $ 104)
                                         (QREFELT $ 113)))
                              (EXIT
                               (PROGN
                                (LETT #2# (CONS 1 #10="failed") . #6#)
                                (GO #7#))))))
                           (#8#
                            (EXIT
                             (PROGN
                              (LETT #2# (CONS 1 #10#) . #6#)
                              (GO #7#)))))))
                        (LETT |ff1|
                              (SPADCALL |ff1| (SPADCALL |ff1| (QREFELT $ 105))
                                        (QREFELT $ 106))
                              . #6#)
                        (EXIT
                         (CONS 0
                               (VECTOR |ff1| |r0| |tt| |f2pp| |u| |u_exp|
                                       |v0|)))))))))))))
          #7# (EXIT #2#)))) 

(SDEFUN |RDEEFX;handle_factor!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX;handle_factor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 64)) (|spadConstant| $ 45)
                      (QREFELT $ 80)))))) 

(SDEFUN |RDEEFX;z_basis|
        ((|a| |Vector| (|Fraction| (|Integer|)))
         (|b| |List| (|Vector| (|Fraction| (|Integer|))))
         ($ |Union|
          (|Record| (|:| |particular| (|Vector| (|Integer|)))
                    (|:| |basis| (|List| (|Vector| (|Integer|)))))
          "failed"))
        (SPROG
         ((#1=#:G1003 NIL) (#2=#:G1021 NIL) (|i| NIL)
          (|av| #3=(|Vector| (|Integer|))) (|ki| (|Integer|))
          (|di| (|Integer|)) (|g| #4=(|Integer|)) (|c2| #5=(|Integer|))
          (|c1| #6=(|Integer|))
          (|#G55|
           (|Record| (|:| |coef1| #6#) (|:| |coef2| #5#)
                     (|:| |generator| #4#)))
          (|ki1| (|Integer|)) (|di2| (|Integer|)) (|di1| (|Integer|))
          (#7=#:G1018 NIL) (|bi| #8=(|Integer|)) (|ai| #8#) (#9=#:G1020 NIL)
          (#10=#:G1019 NIL) (|n| (|NonNegativeInteger|)) (|bv| #3#)
          (|gb| (|Integer|)) (|bl| #11=(|List| (|Integer|)))
          (|db| #12=(|Integer|))
          (|cd| (|Record| (|:| |num| #11#) (|:| |den| #12#)))
          (|bvp| (|Vector| (|Fraction| (|Integer|)))) (|da| #12#)
          (|nn| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nn| (LENGTH |b|) . #13=(|RDEEFX;z_basis|))
                (EXIT
                 (COND ((SPADCALL |nn| 1 (QREFELT $ 22)) (|error| "#b > 1"))
                       (#14='T
                        (SEQ (LETT |cd| (SPADCALL |a| (QREFELT $ 90)) . #13#)
                             (LETT |da| (QCDR |cd|) . #13#)
                             (LETT |av| (SPADCALL (QCAR |cd|) (QREFELT $ 116))
                                   . #13#)
                             (EXIT
                              (COND
                               ((EQL |nn| 0)
                                (COND
                                 ((SPADCALL |da| 1 (QREFELT $ 91))
                                  (CONS 1 "failed"))
                                 (#14# (CONS 0 (CONS |av| NIL)))))
                               (#14#
                                (SEQ (LETT |bvp| (|SPADfirst| |b|) . #13#)
                                     (LETT |cd| (SPADCALL |bvp| (QREFELT $ 90))
                                           . #13#)
                                     (LETT |db| (QCDR |cd|) . #13#)
                                     (LETT |bl| (QCAR |cd|) . #13#)
                                     (LETT |gb| (SPADCALL |bl| (QREFELT $ 117))
                                           . #13#)
                                     (LETT |bv| (SPADCALL |bl| (QREFELT $ 116))
                                           . #13#)
                                     (LETT |n| (QVSIZE |bv|) . #13#)
                                     (SEQ (LETT |i| 1 . #13#)
                                          (LETT #10# |n| . #13#) G190
                                          (COND
                                           ((|greater_SI| |i| #10#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |bv| |i|
                                                      (PROG2
                                                          (LETT #1#
                                                                (SPADCALL
                                                                 (SPADCALL |bv|
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            118))
                                                                 |gb|
                                                                 (QREFELT $
                                                                          119))
                                                                . #13#)
                                                          (QCDR #1#)
                                                        (|check_union2|
                                                         (QEQCAR #1# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  #15="failed")
                                                         #1#))
                                                      (QREFELT $ 120))))
                                          (LETT |i| (|inc_SI| |i|) . #13#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((EQL |da| 1)
                                        (CONS 0 (CONS |av| (LIST |bv|))))
                                       ((QEQCAR
                                         (SPADCALL |db| |da| (QREFELT $ 119))
                                         1)
                                        (CONS 1 "failed"))
                                       (#14#
                                        (SEQ (LETT |ki| 0 . #13#)
                                             (LETT |di| 1 . #13#)
                                             (SEQ (LETT |i| 1 . #13#)
                                                  (LETT #9# |n| . #13#) G190
                                                  (COND
                                                   ((|greater_SI| |i| #9#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |ai|
                                                         (SPADCALL |av| |i|
                                                                   (QREFELT $
                                                                            118))
                                                         . #13#)
                                                   (LETT |bi|
                                                         (SPADCALL |bv| |i|
                                                                   (QREFELT $
                                                                            118))
                                                         . #13#)
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL
                                                       (REM
                                                        (- |ai| (* |ki| |bi|))
                                                        |di|)
                                                       0 (QREFELT $ 91))
                                                      (PROGN
                                                       (LETT #7#
                                                             (CONS 1 "failed")
                                                             . #13#)
                                                       (GO #16=#:G1017)))
                                                     ('T
                                                      (SEQ
                                                       (LETT |di1|
                                                             (PROG2
                                                                 (LETT #1#
                                                                       (SPADCALL
                                                                        |da|
                                                                        (GCD
                                                                         |bi|
                                                                         |da|)
                                                                        (QREFELT
                                                                         $
                                                                         119))
                                                                       . #13#)
                                                                 (QCDR #1#)
                                                               (|check_union2|
                                                                (QEQCAR #1# 0)
                                                                (|Integer|)
                                                                (|Union|
                                                                 (|Integer|)
                                                                 #15#)
                                                                #1#))
                                                             . #13#)
                                                       (LETT |di2|
                                                             (PROG2
                                                                 (LETT #1#
                                                                       (SPADCALL
                                                                        |di1|
                                                                        (GCD
                                                                         |di1|
                                                                         |di|)
                                                                        (QREFELT
                                                                         $
                                                                         119))
                                                                       . #13#)
                                                                 (QCDR #1#)
                                                               (|check_union2|
                                                                (QEQCAR #1# 0)
                                                                (|Integer|)
                                                                (|Union|
                                                                 (|Integer|)
                                                                 #15#)
                                                                #1#))
                                                             . #13#)
                                                       (EXIT
                                                        (COND
                                                         ((EQL |di2| 1)
                                                          "iterate")
                                                         ('T
                                                          (SEQ
                                                           (LETT |ki1|
                                                                 (SPADCALL |bi|
                                                                           |di2|
                                                                           (QREFELT
                                                                            $
                                                                            121))
                                                                 . #13#)
                                                           (PROGN
                                                            (LETT |#G55|
                                                                  (SPADCALL
                                                                   |di| |di2|
                                                                   (QREFELT $
                                                                            123))
                                                                  . #13#)
                                                            (LETT |c1|
                                                                  (QVELT |#G55|
                                                                         0)
                                                                  . #13#)
                                                            (LETT |c2|
                                                                  (QVELT |#G55|
                                                                         1)
                                                                  . #13#)
                                                            (LETT |g|
                                                                  (QVELT |#G55|
                                                                         2)
                                                                  . #13#)
                                                            |#G55|)
                                                           (LETT |di|
                                                                 (* |di2| |di|)
                                                                 . #13#)
                                                           (EXIT
                                                            (LETT |ki|
                                                                  (REM
                                                                   (+
                                                                    (* |ki1|
                                                                       |c1|)
                                                                    (* |ki|
                                                                       |c2|))
                                                                   |di|)
                                                                  . #13#)))))))))))
                                                  (LETT |i| (|inc_SI| |i|)
                                                        . #13#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |av|
                                                   (SPADCALL |av|
                                                             (SPADCALL |ki|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 124))
                                                             (QREFELT $ 125))
                                                   . #13#)
                                             (SEQ (LETT |i| 1 . #13#)
                                                  (LETT #2# |n| . #13#) G190
                                                  (COND
                                                   ((|greater_SI| |i| #2#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (SPADCALL |av| |i|
                                                              (PROG2
                                                                  (LETT #1#
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          |av|
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           118))
                                                                         |da|
                                                                         (QREFELT
                                                                          $
                                                                          119))
                                                                        . #13#)
                                                                  (QCDR #1#)
                                                                (|check_union2|
                                                                 (QEQCAR #1# 0)
                                                                 (|Integer|)
                                                                 (|Union|
                                                                  (|Integer|)
                                                                  #15#)
                                                                 #1#))
                                                              (QREFELT $
                                                                       120))))
                                                  (LETT |i| (|inc_SI| |i|)
                                                        . #13#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (CONS 0
                                                    (CONS |av|
                                                          (LIST
                                                           |bv|))))))))))))))))))
          #16# (EXIT #7#)))) 

(SDEFUN |RDEEFX;lin_args|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                    (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                    (|:| |u_part2| F) (|:| |shift_part2| F))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                      (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                      (|:| |u_part2| F) (|:| |shift_part2| F))))
          (|v2| (F)) (|u2| (F))
          (|uv2|
           #1=(|Record| (|:| |u_part| F) (|:| |v_part| F)
                        (|:| |exponent| (|Integer|))
                        (|:| |coeff| (|Integer|))))
          (|r2| (|Integer|)) (|bv| (|Vector| (|Integer|))) (|v1| (F))
          (|u1| (F)) (|uv1| #1#) (|tt1| (F)) (|a1n| (F)) (|r0| (|Integer|))
          (|vec1| (|Vector| (|Integer|)))
          (|zb|
           (|Record| (|:| |particular| (|Vector| (|Integer|)))
                     (|:| |basis| (|List| (|Vector| (|Integer|))))))
          (|zbu|
           (|Union|
            (|Record| (|:| |particular| (|Vector| (|Integer|)))
                      (|:| |basis| (|List| (|Vector| (|Integer|)))))
            "failed"))
          (|psol| (|Vector| (|Fraction| (|Integer|))))
          (|psolu| #2=(|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|sol_rec|
           (|Record| (|:| |particular| #2#)
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (|vecf| (|Vector| F)) (|dv0| (F)) (|dvs| (|List| F)) (#3=#:G1066 NIL)
          (|v| NIL) (#4=#:G1065 NIL) (|dv1| (F)) (#5=#:G1061 NIL)
          (|no_sol| #6=(|Boolean|)) (|f2| (|SparseUnivariatePolynomial| F))
          (|r0u| (|Union| (|Integer|) "failed")) (|r0f| (F)) (|b0p| (F))
          (|b0| (F)) (|has_r0| #6#) (|a1p| (F)) (|tt| (F))
          (|f1| (|SparseUnivariatePolynomial| F))
          (|deg1| (|NonNegativeInteger|)) (#7=#:G1064 NIL) (|fac| NIL)
          (|ulst1| (|List| F)) (|vlst1| (|List| F)) (|u0| (F)) (#8=#:G1062 NIL)
          (#9=#:G1063 NIL) (|u| NIL) (|v0| (F)) (|a0| (F)) (|a1| (F))
          (|fgd| (|Factored| (|SparseUnivariatePolynomial| F))))
         (SEQ
          (LETT |fgd| (SPADCALL |gd| (QREFELT $ 128))
                . #10=(|RDEEFX;lin_args|))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |nf| (QREFELT $ 41)) 1 (QREFELT $ 42))
             (|error| "lin_args only works for linear nf"))
            (#11='T
             (SEQ
              (LETT |a1|
                    (COND
                     ((EQL (SPADCALL |nf| (QREFELT $ 41)) 1)
                      (SPADCALL |nf| (QREFELT $ 105)))
                     (#11# (|spadConstant| $ 45)))
                    . #10#)
              (LETT |a0| (SPADCALL |nf| 0 (QREFELT $ 43)) . #10#)
              (LETT |v0| (SPADCALL |k| (QREFELT $ 63)) . #10#)
              (LETT |vlst1| NIL . #10#) (LETT |ulst1| NIL . #10#)
              (SEQ (LETT |u| NIL . #10#) (LETT #9# |ulst| . #10#)
                   (LETT |v| NIL . #10#) (LETT #8# |vlst| . #10#) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |v| (CAR #8#) . #10#) NIL)
                         (ATOM #9#) (PROGN (LETT |u| (CAR #9#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |v| |v0| (QREFELT $ 80))
                       (LETT |u0| |u| . #10#))
                      ('T
                       (SEQ (LETT |vlst1| (CONS |v| |vlst1|) . #10#)
                            (EXIT
                             (LETT |ulst1| (CONS |u| |ulst1|) . #10#)))))))
                   (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#) . #10#))
                         . #10#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |res| NIL . #10#)
              (SEQ (LETT |fac| NIL . #10#)
                   (LETT #7# (SPADCALL |fgd| (QREFELT $ 131)) . #10#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |fac| (CAR #7#) . #10#) NIL))
                     (GO G191)))
                   (SEQ (LETT |f1| (QCAR |fac|) . #10#)
                        (LETT |deg1| (SPADCALL |f1| (QREFELT $ 41)) . #10#)
                        (EXIT
                         (COND ((EQL |deg1| 0) "iterate")
                               ('T
                                (SEQ
                                 (LETT |f1|
                                       (SPADCALL |f1|
                                                 (SPADCALL |f1|
                                                           (QREFELT $ 105))
                                                 (QREFELT $ 106))
                                       . #10#)
                                 (LETT |tt|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |f1| (- |deg1| 1)
                                                   (QREFELT $ 43))
                                         (SPADCALL |deg1| (QREFELT $ 76))
                                         (QREFELT $ 69))
                                        (QREFELT $ 50))
                                       . #10#)
                                 (LETT |no_sol| NIL . #10#)
                                 (LETT |has_r0| NIL . #10#)
                                 (LETT |f2| (|spadConstant| $ 104) . #10#)
                                 (LETT |r0| 0 . #10#)
                                 (LETT |r0f| (|spadConstant| $ 45) . #10#)
                                 (COND
                                  ((SPADCALL |deg1| 1 (QREFELT $ 22))
                                   (SEQ
                                    (EXIT
                                     (SEQ
                                      (LETT |f2|
                                            (SPADCALL |f1| (QREFELT $ 94)
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (|spadConstant| $ 33) 1
                                                        (QREFELT $ 46))
                                                       (SPADCALL |tt|
                                                                 (QREFELT $
                                                                          47))
                                                       (QREFELT $ 51))
                                                      (QREFELT $ 95))
                                            . #10#)
                                      (LETT |f2|
                                            (SPADCALL |f2|
                                                      (SPADCALL |f2|
                                                                (QREFELT $
                                                                         105))
                                                      (QREFELT $ 106))
                                            . #10#)
                                      (COND
                                       ((SPADCALL
                                         (LETT |a1p|
                                               (SPADCALL |a1| |x|
                                                         (QREFELT $ 64))
                                               . #10#)
                                         (|spadConstant| $ 45) (QREFELT $ 132))
                                        (SEQ (LETT |has_r0| 'T . #10#)
                                             (LETT |b0|
                                                   (SPADCALL |f2| 0
                                                             (QREFELT $ 43))
                                                   . #10#)
                                             (LETT |b0p|
                                                   (SPADCALL |b0| |x|
                                                             (QREFELT $ 64))
                                                   . #10#)
                                             (EXIT
                                              (COND
                                               ((SPADCALL |b0p|
                                                          (|spadConstant| $ 45)
                                                          (QREFELT $ 80))
                                                (LETT |no_sol| 'T . #10#))
                                               ('T
                                                (SEQ
                                                 (LETT |r0f|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |deg1|
                                                                      (QREFELT
                                                                       $ 76))
                                                            |a1p|
                                                            (QREFELT $ 67))
                                                           |b0| (QREFELT $ 67))
                                                          |b0p| (QREFELT $ 69))
                                                         (QREFELT $ 50))
                                                        |a1| (QREFELT $ 79))
                                                       . #10#)
                                                 (LETT |r0u|
                                                       (SPADCALL |r0f|
                                                                 (QREFELT $
                                                                          134))
                                                       . #10#)
                                                 (EXIT
                                                  (COND
                                                   ((QEQCAR |r0u| 1)
                                                    (LETT |no_sol| 'T . #10#))
                                                   ('T
                                                    (SEQ
                                                     (LETT |r0| (QCDR |r0u|)
                                                           . #10#)
                                                     (EXIT
                                                      (LETT |f2|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |a1|
                                                                        |r0f|
                                                                        (QREFELT
                                                                         $ 75))
                                                              |deg1|
                                                              (QREFELT $ 81))
                                                             (SPADCALL |f2|
                                                                       (QREFELT
                                                                        $ 94)
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (|spadConstant|
                                                                          $ 33)
                                                                         (SPADCALL
                                                                          |a1|
                                                                          |r0f|
                                                                          (QREFELT
                                                                           $
                                                                           75))
                                                                         (QREFELT
                                                                          $
                                                                          69))
                                                                        1
                                                                        (QREFELT
                                                                         $ 46))
                                                                       (QREFELT
                                                                        $ 95))
                                                             (QREFELT $ 137))
                                                            . #10#)))))))))))))
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (SPADCALL
                                           (CONS #'|RDEEFX;lin_args!0|
                                                 (VECTOR $ |x|))
                                           (SPADCALL |f2| (QREFELT $ 96))
                                           (QREFELT $ 98)))
                                         (PROGN
                                          (LETT #5# (LETT |no_sol| 'T . #10#)
                                                . #10#)
                                          (GO #12=#:G1044)))))))
                                    #12# (EXIT #5#))))
                                 (EXIT
                                  (COND (|no_sol| "iterate")
                                        ('T
                                         (SEQ
                                          (LETT |dv0|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |a1| |tt|
                                                             (QREFELT $ 67))
                                                   |a0| (QREFELT $ 75))
                                                  |x| (QREFELT $ 64))
                                                 (QREFELT $ 50))
                                                . #10#)
                                          (LETT |dv1|
                                                (SPADCALL |tt| |x|
                                                          (QREFELT $ 64))
                                                . #10#)
                                          (LETT |dvs|
                                                (PROGN
                                                 (LETT #4# NIL . #10#)
                                                 (SEQ (LETT |v| NIL . #10#)
                                                      (LETT #3# |vlst1| . #10#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #3#)
                                                            (PROGN
                                                             (LETT |v|
                                                                   (CAR #3#)
                                                                   . #10#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #4#
                                                              (CONS
                                                               (SPADCALL |v|
                                                                         |x|
                                                                         (QREFELT
                                                                          $
                                                                          64))
                                                               #4#)
                                                              . #10#)))
                                                      (LETT #3# (CDR #3#)
                                                            . #10#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #4#))))
                                                . #10#)
                                          (LETT |vecf|
                                                (COND
                                                 (|has_r0|
                                                  (SEQ
                                                   (LETT |dv0|
                                                         (SPADCALL |dv0|
                                                                   (SPADCALL
                                                                    |r0f| |dv1|
                                                                    (QREFELT $
                                                                             67))
                                                                   (QREFELT $
                                                                            75))
                                                         . #10#)
                                                   (EXIT
                                                    (SPADCALL |dvs|
                                                              (QREFELT $
                                                                       83)))))
                                                 ('T
                                                  (SPADCALL (CONS |dv1| |dvs|)
                                                            (QREFELT $ 83))))
                                                . #10#)
                                          (LETT |sol_rec|
                                                (SPADCALL |vecf| |dv0|
                                                          (QREFELT $ 139))
                                                . #10#)
                                          (LETT |psolu| (QCAR |sol_rec|)
                                                . #10#)
                                          (EXIT
                                           (COND ((QEQCAR |psolu| 1) "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |psol| (QCDR |psolu|)
                                                         . #10#)
                                                   (COND
                                                    (|has_r0|
                                                     (LETT |psol|
                                                           (SPADCALL
                                                            (CONS
                                                             (SPADCALL |r0|
                                                                       (QREFELT
                                                                        $ 141))
                                                             (SPADCALL |psol|
                                                                       (QREFELT
                                                                        $
                                                                        143)))
                                                            (QREFELT $ 144))
                                                           . #10#)))
                                                   (LETT |zbu|
                                                         (|RDEEFX;z_basis|
                                                          |psol|
                                                          (QCDR |sol_rec|) $)
                                                         . #10#)
                                                   (EXIT
                                                    (COND
                                                     ((QEQCAR |zbu| 1)
                                                      "iterate")
                                                     ('T
                                                      (SEQ
                                                       (LETT |zb| (QCDR |zbu|)
                                                             . #10#)
                                                       (LETT |vec1| (QCAR |zb|)
                                                             . #10#)
                                                       (LETT |r0|
                                                             (SPADCALL |vec1| 1
                                                                       (QREFELT
                                                                        $ 118))
                                                             . #10#)
                                                       (LETT |a1n|
                                                             (SPADCALL |a1|
                                                                       (SPADCALL
                                                                        |r0|
                                                                        (QREFELT
                                                                         $ 76))
                                                                       (QREFELT
                                                                        $ 75))
                                                             . #10#)
                                                       (LETT |tt1|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL |a1n|
                                                                         |tt|
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                               (QREFELT $ 50))
                                                              |a0|
                                                              (QREFELT $ 79))
                                                             . #10#)
                                                       (LETT |uv1|
                                                             (|RDEEFX;get_uv0|
                                                              |tt1|
                                                              (CDR
                                                               (SPADCALL |vec1|
                                                                         (QREFELT
                                                                          $
                                                                          145)))
                                                              |vlst1| |ulst1|
                                                              |k| |x| $)
                                                             . #10#)
                                                       (LETT |u1|
                                                             (SPADCALL
                                                              (QVELT |uv1| 0)
                                                              (SPADCALL |u0|
                                                                        |r0|
                                                                        (QREFELT
                                                                         $ 81))
                                                              (QREFELT $ 67))
                                                             . #10#)
                                                       (LETT |v1|
                                                             (QVELT |uv1| 1)
                                                             . #10#)
                                                       (EXIT
                                                        (COND
                                                         ((NULL (QCDR |zb|))
                                                          (LETT |res|
                                                                (CONS
                                                                 (VECTOR |f1|
                                                                         |r0|
                                                                         |tt1|
                                                                         |f2|
                                                                         |u1| 0
                                                                         |v1|
                                                                         NIL 0
                                                                         (|spadConstant|
                                                                          $ 45)
                                                                         (|spadConstant|
                                                                          $ 33)
                                                                         (|spadConstant|
                                                                          $
                                                                          45))
                                                                 |res|)
                                                                . #10#))
                                                         ('T
                                                          (SEQ
                                                           (LETT |bv|
                                                                 (|SPADfirst|
                                                                  (QCDR |zb|))
                                                                 . #10#)
                                                           (LETT |r2|
                                                                 (SPADCALL |bv|
                                                                           1
                                                                           (QREFELT
                                                                            $
                                                                            118))
                                                                 . #10#)
                                                           (LETT |uv2|
                                                                 (|RDEEFX;get_uv0|
                                                                  (SPADCALL
                                                                   |tt|
                                                                   (QREFELT $
                                                                            50))
                                                                  (CDR
                                                                   (SPADCALL
                                                                    |bv|
                                                                    (QREFELT $
                                                                             145)))
                                                                  |vlst1|
                                                                  |ulst1| |k|
                                                                  |x| $)
                                                                 . #10#)
                                                           (LETT |u2|
                                                                 (SPADCALL
                                                                  (QVELT |uv2|
                                                                         0)
                                                                  (SPADCALL
                                                                   |u0| |r2|
                                                                   (QREFELT $
                                                                            81))
                                                                  (QREFELT $
                                                                           67))
                                                                 . #10#)
                                                           (LETT |v2|
                                                                 (QVELT |uv2|
                                                                        1)
                                                                 . #10#)
                                                           (EXIT
                                                            (LETT |res|
                                                                  (CONS
                                                                   (VECTOR |f1|
                                                                           |r0|
                                                                           |tt1|
                                                                           |f2|
                                                                           |u1|
                                                                           0
                                                                           |v1|
                                                                           'T
                                                                           |r2|
                                                                           (SPADCALL
                                                                            |tt|
                                                                            (QREFELT
                                                                             $
                                                                             50))
                                                                           |u2|
                                                                           |v2|)
                                                                   |res|)
                                                                  . #10#)))))))))))))))))))))))
                   (LETT #7# (CDR #7#) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))))))) 

(SDEFUN |RDEEFX;lin_args!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX;lin_args|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 64)) (|spadConstant| $ 45)
                      (QREFELT $ 80)))))) 

(SDEFUN |RDEEFX;get_rational_solutions|
        ((|eq1| |Equation| (|Fraction| (|Polynomial| F))) (|s1| |Symbol|)
         (|s2| |Symbol|) ($ |List| (|Fraction| (|Integer|))))
        (SPROG
         ((|eq1f| (F)) (|k1| (|Kernel| F)) (|eq1p| (|Polynomial| F))
          (|ru2| (|Union| (|Fraction| (|Integer|)) "failed"))
          (|ru1| (|Union| F "failed"))
          (|ru0| (|Union| (|Polynomial| F) "failed"))
          (|rv| (|Fraction| (|Polynomial| F))))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |rv| (SPADCALL |eq1| (QREFELT $ 148))
                   . #1=(|RDEEFX;get_rational_solutions|))
             (|spadConstant| $ 149) (QREFELT $ 150))
            (COND
             ((SPADCALL |s1|
                        (SPADCALL (SPADCALL |eq1| (QREFELT $ 151))
                                  (QREFELT $ 152))
                        (QREFELT $ 153))
              (|error| "wrong format of solution 1"))
             (#2='T
              (SEQ (LETT |ru0| (SPADCALL |rv| (QREFELT $ 155)) . #1#)
                   (EXIT
                    (COND ((QEQCAR |ru0| 1) NIL)
                          (#2#
                           (SEQ
                            (LETT |ru1| (SPADCALL (QCDR |ru0|) (QREFELT $ 158))
                                  . #1#)
                            (EXIT
                             (COND ((QEQCAR |ru1| 1) NIL)
                                   (#2#
                                    (SEQ
                                     (LETT |ru2|
                                           (SPADCALL (QCDR |ru1|)
                                                     (QREFELT $ 160))
                                           . #1#)
                                     (EXIT
                                      (COND ((QEQCAR |ru2| 1) NIL)
                                            (#2#
                                             (LIST (QCDR |ru2|)))))))))))))))))
           (#2#
            (SEQ
             (LETT |eq1p|
                   (SPADCALL (SPADCALL |eq1| (QREFELT $ 151)) (QREFELT $ 161))
                   . #1#)
             (EXIT
              (COND
               ((SPADCALL |s2| (SPADCALL |eq1p| (QREFELT $ 163))
                          (QREFELT $ 164))
                (|error| "wrong format of solution 2"))
               (#2#
                (SEQ (LETT |k1| (SPADCALL |s1| (QREFELT $ 60)) . #1#)
                     (LETT |eq1f|
                           (SPADCALL
                            (SPADCALL |eq1p| |s1|
                                      (SPADCALL |k1| (QREFELT $ 63))
                                      (QREFELT $ 165))
                            (QREFELT $ 166))
                           . #1#)
                     (EXIT (SPADCALL |eq1f| |k1| (QREFELT $ 168))))))))))))) 

(SDEFUN |RDEEFX;F_to_FP|
        ((|p| F) (|ls| |List| (|Symbol|)) (|lk| |List| (|Kernel| F))
         ($ |Polynomial| F))
        (SPROG
         ((|pu1| (|SparseUnivariatePolynomial| (|Polynomial| F)))
          (|pu| (|SparseUnivariatePolynomial| F)) (|s1| (|Symbol|))
          (|k1| (|Kernel| F)))
         (SEQ
          (COND ((NULL |lk|) (SPADCALL |p| (QREFELT $ 169)))
                ('T
                 (SEQ (LETT |k1| (|SPADfirst| |lk|) . #1=(|RDEEFX;F_to_FP|))
                      (LETT |s1| (|SPADfirst| |ls|) . #1#)
                      (LETT |pu|
                            (SPADCALL (SPADCALL |p| |k1| (QREFELT $ 36))
                                      (QREFELT $ 39))
                            . #1#)
                      (LETT |pu1|
                            (SPADCALL
                             (CONS #'|RDEEFX;F_to_FP!0| (VECTOR |lk| $ |ls|))
                             |pu| (QREFELT $ 175))
                            . #1#)
                      (EXIT (SPADCALL |pu1| |s1| (QREFELT $ 177))))))))) 

(SDEFUN |RDEEFX;F_to_FP!0| ((|c| NIL) ($$ NIL))
        (PROG (|ls| $ |lk|)
          (LETT |ls| (QREFELT $$ 2) . #1=(|RDEEFX;F_to_FP|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|RDEEFX;F_to_FP| |c| (SPADCALL |ls| (QREFELT $ 170))
             (SPADCALL |lk| (QREFELT $ 171)) $))))) 

(SDEFUN |RDEEFX;solve_poly_eqs|
        ((|eqs| |List| F) (|s1| |Symbol|) (|s2| |Symbol|)
         ($ |List|
          (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
          (|val2alg| (|SparseUnivariatePolynomial| F))
          (|val2eq| (|Polynomial| F)) (#1=#:G1108 NIL) (|val1r| NIL)
          (|eq1| (|Equation| (|Fraction| (|Polynomial| F))))
          (|eq0p| (|Polynomial| F))
          (|eq0| (|Equation| (|Fraction| (|Polynomial| F)))) (#2=#:G1107 NIL)
          (|sol0| NIL)
          (|lsol0|
           (|List| (|List| (|Equation| (|Fraction| (|Polynomial| F))))))
          (#3=#:G1106 NIL) (|ci| NIL) (#4=#:G1105 NIL)
          (|eqs0| (|List| (|Polynomial| F))) (#5=#:G1104 NIL) (|eqi| NIL)
          (#6=#:G1103 NIL) (|k2| #7=(|Kernel| F)) (|k1| #7#))
         (SEQ
          (LETT |k1| (SPADCALL |s1| (QREFELT $ 60))
                . #8=(|RDEEFX;solve_poly_eqs|))
          (LETT |k2| (SPADCALL |s2| (QREFELT $ 60)) . #8#)
          (LETT |eqs0|
                (PROGN
                 (LETT #6# NIL . #8#)
                 (SEQ (LETT |eqi| NIL . #8#) (LETT #5# |eqs| . #8#) G190
                      (COND
                       ((OR (ATOM #5#)
                            (PROGN (LETT |eqi| (CAR #5#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (|RDEEFX;F_to_FP|
                                (SPADCALL (SPADCALL |eqi| (QREFELT $ 179))
                                          (QREFELT $ 180))
                                (LIST |s1| |s2|) (LIST |k1| |k2|) $)
                               #6#)
                              . #8#)))
                      (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #8#)
          (LETT |lsol0|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #8#)
                  (SEQ (LETT |ci| NIL . #8#) (LETT #3# |eqs0| . #8#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |ci| (CAR #3#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4# (CONS (SPADCALL |ci| (QREFELT $ 181)) #4#)
                               . #8#)))
                       (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (LIST |s2| |s1|) (QREFELT $ 185))
                . #8#)
          (LETT |res| NIL . #8#)
          (SEQ (LETT |sol0| NIL . #8#) (LETT #2# |lsol0| . #8#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |sol0| (CAR #2#) . #8#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |sol0|) 2 (QREFELT $ 91))
                   (|error| "wrong format of solution 0"))
                  ('T
                   (SEQ (LETT |eq0| (|SPADfirst| |sol0|) . #8#)
                        (LETT |eq0p|
                              (SPADCALL
                               (SPADCALL (SPADCALL |eq0| (QREFELT $ 151))
                                         (SPADCALL |eq0| (QREFELT $ 148))
                                         (QREFELT $ 186))
                               (QREFELT $ 161))
                              . #8#)
                        (LETT |eq1| (SPADCALL |sol0| (QREFELT $ 188)) . #8#)
                        (EXIT
                         (SEQ (LETT |val1r| NIL . #8#)
                              (LETT #1#
                                    (|RDEEFX;get_rational_solutions| |eq1| |s1|
                                     |s2| $)
                                    . #8#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |val1r| (CAR #1#) . #8#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |val2eq|
                                     (SPADCALL |eq0p| |s1|
                                               (SPADCALL |val1r|
                                                         (QREFELT $ 189))
                                               (QREFELT $ 165))
                                     . #8#)
                               (LETT |val2alg|
                                     (SPADCALL |val2eq| (QREFELT $ 190)) . #8#)
                               (EXIT
                                (LETT |res|
                                      (CONS (CONS |val1r| |val2alg|) |res|)
                                      . #8#)))
                              (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                              (EXIT NIL))))))))
               (LETT #2# (CDR #2#) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args0|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst0| |List| F) (|ulst0| |List| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|vp| (F)) (|dega| (|Integer|))
          (|fac| (|SparseUnivariatePolynomial| F))
          (|ap| (|SparseUnivariatePolynomial| F)) (#1=#:G1138 NIL)
          (|res1|
           (|Union|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))
            "failed"))
          (|res1l|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|nn| #2=(|SparseUnivariatePolynomial| F)) (|ri| (|Integer|))
          (|ru| (|Union| (|Integer|) "failed")) (#3=#:G1137 NIL) (|r0| NIL)
          (|degn1| (|NonNegativeInteger|)) (|degn| #4=(|NonNegativeInteger|))
          (|degd| #4#) (|ratl| (|List| (|Fraction| (|Integer|)))) (|eq1| (F))
          (|nnp| #2#) (#5=#:G1136 NIL) (|sol| NIL) (|r_bad| (|Integer|))
          (|has_r_bad| (|Boolean|)) (|ccu| (|Union| (|Integer|) "failed"))
          (|cc| (F))
          (|lsol|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
          (|eqs0| (|List| F)) (#6=#:G1135 NIL) (|ci| NIL) (#7=#:G1134 NIL)
          (|qq| (|SparseUnivariatePolynomial| F)) (|b| #8=(|Kernel| F))
          (|bs| #9=(|Symbol|)) (|a| #8#) (|as| #9#) (|u0| (F))
          (|ulst| (|List| F)) (|vlst| (|List| F)) (#10=#:G1132 NIL) (|v| NIL)
          (#11=#:G1133 NIL) (|u| NIL) (|kf| (F)))
         (SEQ (LETT |vlst| NIL . #12=(|RDEEFX;ei_args0|))
              (LETT |ulst| NIL . #12#)
              (LETT |kf| (SPADCALL |k| (QREFELT $ 63)) . #12#)
              (SEQ (LETT |u| NIL . #12#) (LETT #11# |ulst0| . #12#)
                   (LETT |v| NIL . #12#) (LETT #10# |vlst0| . #12#) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |v| (CAR #10#) . #12#) NIL)
                         (ATOM #11#) (PROGN (LETT |u| (CAR #11#) . #12#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |v| |kf| (QREFELT $ 132))
                       (SEQ (LETT |vlst| (CONS |v| |vlst|) . #12#)
                            (EXIT (LETT |ulst| (CONS |u| |ulst|) . #12#))))
                      ('T (LETT |u0| |u| . #12#)))))
                   (LETT #10# (PROG1 (CDR #10#) (LETT #11# (CDR #11#) . #12#))
                         . #12#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |as| (SPADCALL (QREFELT $ 59)) . #12#)
              (LETT |a| (SPADCALL |as| (QREFELT $ 60)) . #12#)
              (LETT |bs| (SPADCALL (QREFELT $ 59)) . #12#)
              (LETT |b| (SPADCALL |bs| (QREFELT $ 60)) . #12#)
              (LETT |nn|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |a| (QREFELT $ 63)) 1
                                          (QREFELT $ 46))
                                (SPADCALL (SPADCALL |b| (QREFELT $ 63))
                                          (QREFELT $ 47))
                                (QREFELT $ 51))
                               |denf| (QREFELT $ 99))
                              (QREFELT $ 51))
                    . #12#)
              (LETT |qq| (SPADCALL |gd| |nn| (QREFELT $ 191)) . #12#)
              (LETT |eqs0|
                    (PROGN
                     (LETT #7# NIL . #12#)
                     (SEQ (LETT |ci| NIL . #12#)
                          (LETT #6# (SPADCALL |qq| (QREFELT $ 96)) . #12#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |ci| (CAR #6#) . #12#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL (SPADCALL |ci| (QREFELT $ 179))
                                             (QREFELT $ 180))
                                   #7#)
                                  . #12#)))
                          (LETT #6# (CDR #6#) . #12#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #12#)
              (LETT |lsol| (|RDEEFX;solve_poly_eqs| |eqs0| |as| |bs| $) . #12#)
              (LETT |has_r_bad| NIL . #12#) (LETT |r_bad| 0 . #12#)
              (COND
               ((>= (+ (SPADCALL |denf| (QREFELT $ 41)) 1)
                    (SPADCALL |nf| (QREFELT $ 41)))
                (COND
                 ((SPADCALL (+ (SPADCALL |denf| (QREFELT $ 41)) 1)
                            (SPADCALL |nf| (QREFELT $ 41)) (QREFELT $ 22))
                  (SEQ (LETT |has_r_bad| 'T . #12#)
                       (EXIT (LETT |r_bad| 0 . #12#))))
                 ('T
                  (SEQ
                   (LETT |cc|
                         (SPADCALL
                          (SPADCALL (SPADCALL |nf| (QREFELT $ 105))
                                    (SPADCALL |denf| (QREFELT $ 105))
                                    (QREFELT $ 69))
                          (QREFELT $ 50))
                         . #12#)
                   (LETT |ccu| (SPADCALL |cc| (QREFELT $ 134)) . #12#)
                   (EXIT
                    (COND
                     ((QEQCAR |ccu| 0)
                      (SEQ (LETT |has_r_bad| 'T . #12#)
                           (EXIT (LETT |r_bad| (QCDR |ccu|) . #12#)))))))))))
              (LETT |res| NIL . #12#)
              (SEQ (LETT |sol| NIL . #12#) (LETT #5# |lsol| . #12#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |sol| (CAR #5#) . #12#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ru| (SPADCALL (QCAR |sol|) (QREFELT $ 192)) . #12#)
                    (EXIT
                     (COND ((QEQCAR |ru| 1) "iterate")
                           ('T
                            (SEQ
                             (COND
                              (|has_r_bad|
                               (COND
                                ((EQL (QCDR |ru|) |r_bad|) (EXIT "iterate")))))
                             (LETT |res1|
                                   (|RDEEFX;handle_factor| |gd| |nf| |denf|
                                    (QCDR |sol|) (QCDR |ru|) |u| |vlst| |ulst|
                                    |k| |x| 'T $)
                                   . #12#)
                             (EXIT
                              (COND ((QEQCAR |res1| 1) "iterate")
                                    ('T
                                     (LETT |res| (CONS (QCDR |res1|) |res|)
                                           . #12#)))))))))
                   (LETT #5# (CDR #5#) . #12#) (GO G190) G191 (EXIT NIL))
              (LETT |nnp|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |nf| (QREFELT $ 193)) |denf|
                                (QREFELT $ 99))
                      (SPADCALL (SPADCALL |denf| (QREFELT $ 193)) |nf|
                                (QREFELT $ 99))
                      (QREFELT $ 48))
                     (SPADCALL (SPADCALL |a| (QREFELT $ 63)) (QREFELT $ 47))
                     (QREFELT $ 51))
                    . #12#)
              (LETT |eq1| (SPADCALL |nnp| |gd| (QREFELT $ 194)) . #12#)
              (LETT |ratl| (SPADCALL |eq1| |a| (QREFELT $ 168)) . #12#)
              (COND
               (|has_r_bad|
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |r_bad| (QREFELT $ 141)) |ratl|
                             (QREFELT $ 195)))
                  (LETT |ratl| (CONS (SPADCALL |r_bad| (QREFELT $ 141)) |ratl|)
                        . #12#)))))
              (LETT |degd| (SPADCALL |denf| (QREFELT $ 41)) . #12#)
              (LETT |degn| (SPADCALL |nf| (QREFELT $ 41)) . #12#)
              (LETT |degn1| (MAX |degn| (+ |degd| 1)) . #12#)
              (SEQ (LETT |r0| NIL . #12#) (LETT #3# |ratl| . #12#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |r0| (CAR #3#) . #12#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ru| (SPADCALL |r0| (QREFELT $ 192)) . #12#)
                        (EXIT
                         (COND ((QEQCAR |ru| 1) "iterate")
                               ('T
                                (SEQ (LETT |ri| (QCDR |ru|) . #12#)
                                     (LETT |nn|
                                           (SPADCALL |nf|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          76))
                                                       1 (QREFELT $ 46))
                                                      |denf| (QREFELT $ 99))
                                                     (QREFELT $ 51))
                                           . #12#)
                                     (LETT |res1l|
                                           (|RDEEFX;ei_args3| |gd| |nn| |denf|
                                            |k| |vlst| |ulst| |x| $)
                                           . #12#)
                                     (EXIT
                                      (SEQ (LETT |res1| NIL . #12#)
                                           (LETT #1# |res1l| . #12#) G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |res1| (CAR #1#)
                                                        . #12#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |ap| (QVELT |res1| 3) . #12#)
                                            (LETT |fac| (QVELT |res1| 0)
                                                  . #12#)
                                            (LETT |dega|
                                                  (COND
                                                   ((SPADCALL |ap|
                                                              (|spadConstant| $
                                                                              104)
                                                              (QREFELT $ 113))
                                                    1)
                                                   ('T
                                                    (SPADCALL |ap|
                                                              (QREFELT $ 41))))
                                                  . #12#)
                                            (LETT |vp| (QVELT |res1| 2) . #12#)
                                            (EXIT
                                             (COND
                                              ((EQL
                                                (SPADCALL |fac| (QREFELT $ 41))
                                                (SPADCALL |degn1| |dega|
                                                          (QREFELT $ 196)))
                                               "iterate")
                                              ('T
                                               (LETT |res|
                                                     (CONS
                                                      (VECTOR |fac| |ri|
                                                              (QVELT |res1| 2)
                                                              |ap|
                                                              (SPADCALL
                                                               (SPADCALL |u0|
                                                                         |ri|
                                                                         (QREFELT
                                                                          $
                                                                          81))
                                                               (QVELT |res1| 4)
                                                               (QREFELT $ 67))
                                                              0
                                                              (QVELT |res1| 6))
                                                      |res|)
                                                     . #12#)))))
                                           (LETT #1# (CDR #1#) . #12#)
                                           (GO G190) G191 (EXIT NIL))))))))
                   (LETT #3# (CDR #3#) . #12#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args1|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|t| |Kernel| F)
         ($ |Factored| (|SparseUnivariatePolynomial| F)))
        (SPROG ((|r| (F)))
               (SEQ
                (LETT |r|
                      (SPADCALL
                       (SPADCALL |nf|
                                 (SPADCALL (SPADCALL |t| (QREFELT $ 63)) |denf|
                                           (QREFELT $ 137))
                                 (QREFELT $ 51))
                       |gd| (QREFELT $ 194))
                      |RDEEFX;ei_args1|)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |r| |t| (QREFELT $ 36)) (QREFELT $ 39))
                  (QREFELT $ 128)))))) 

(SDEFUN |RDEEFX;ei_args2|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|f_res| |Factored| (|SparseUnivariatePolynomial| F)) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|resu|
           (|Union|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))
            "failed"))
          (|deg1| #1=(|NonNegativeInteger|))
          (|f1| #2=(|SparseUnivariatePolynomial| F)) (#3=#:G1147 NIL)
          (|fac| NIL) (|degg| #1#)
          (|rfac|
           (|List| (|Record| (|:| |factor| #2#) (|:| |exponent| (|Integer|)))))
          (|n1| (|Integer|)) (|log_case| (|Boolean|)))
         (SEQ
          (LETT |log_case| (SPADCALL |k| '|log| (QREFELT $ 23))
                . #4=(|RDEEFX;ei_args2|))
          (LETT |n1| 0 . #4#)
          (LETT |rfac| (SPADCALL |f_res| (QREFELT $ 131)) . #4#)
          (LETT |res| NIL . #4#)
          (LETT |degg| (SPADCALL |gd| (QREFELT $ 41)) . #4#)
          (SEQ (LETT |fac| NIL . #4#) (LETT #3# |rfac| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |fac| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |f1| (QCAR |fac|) . #4#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 41)) . #4#)
                    (EXIT
                     (COND ((EQL |deg1| 0) "iterate")
                           ('T
                            (SEQ
                             (LETT |resu|
                                   (|RDEEFX;handle_factor| |gd| |nf| |denf|
                                    |f1| 0 (|spadConstant| $ 33) |vlst| |ulst|
                                    |k| |x| NIL $)
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |resu| 0)
                                (LETT |res| (CONS (QCDR |resu|) |res|)
                                      . #4#)))))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args3|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|f_res| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|t| (|Kernel| F)))
         (SEQ
          (LETT |t| (SPADCALL (SPADCALL (QREFELT $ 59)) (QREFELT $ 60))
                . #1=(|RDEEFX;ei_args3|))
          (LETT |f_res| (|RDEEFX;ei_args1| |gd| |nf| |denf| |t| $) . #1#)
          (EXIT
           (|RDEEFX;ei_args2| |gd| |nf| |denf| |f_res| |k| |vlst| |ulst| |x|
            $))))) 

(SDEFUN |RDEEFX;ei_args|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|res1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F)))))
         (SEQ
          (COND ((EQL (SPADCALL |gd| (QREFELT $ 41)) 0) NIL)
                (#1='T
                 (SEQ
                  (LETT |res1|
                        (COND
                         ((SPADCALL |k| '|log| (QREFELT $ 23))
                          (|RDEEFX;ei_args0| |gd| |nf| |denf| |k| |vlst| |ulst|
                           |x| $))
                         (#1#
                          (|RDEEFX;ei_args3| |gd| |nf| |denf| |k| |vlst| |ulst|
                           |x| $)))
                        |RDEEFX;ei_args|)
                  (EXIT |res1|))))))) 

(SDEFUN |RDEEFX;my_exp|
        ((|p| |SparseUnivariatePolynomial| F) (|n| |NonNegativeInteger|)
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL |p| |n| (QREFELT $ 197))) 

(SDEFUN |RDEEFX;ei_candidate|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|vlst| |List| F)
         (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|) (|a| |Integer|)
         (|tt| F)
         (|res| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F)))
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|nf1| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |tt| (SPADCALL |tt| (QREFELT $ 50))
                . #1=(|RDEEFX;ei_candidate|))
          (LETT |nf1|
                (SPADCALL |nf| (SPADCALL |tt| |denf| (QREFELT $ 137))
                          (QREFELT $ 51))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |nf1| (QREFELT $ 112)) (|spadConstant| $ 104)
                       (QREFELT $ 111))
             |res|)
            (#2='T
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |nf1| (QREFELT $ 41)) 0 (QREFELT $ 42))
                (COND
                 ((NULL (SPADCALL |k| '|exp| (QREFELT $ 23))) (EXIT |res|)))))
              (LETT |uvu| (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| $) . #1#)
              (EXIT
               (COND ((QEQCAR |uvu| 1) |res|)
                     (#2#
                      (SEQ (LETT |uv| (QCDR |uvu|) . #1#)
                           (EXIT
                            (CONS
                             (VECTOR 1 |nf1| (|spadConstant| $ 33) |a| |tt|
                                     (|spadConstant| $ 104)
                                     (SPADCALL |nf1| |denf| (QREFELT $ 198))
                                     (|spadConstant| $ 199) (QVELT |uv| 0)
                                     (QVELT |uv| 2) (QVELT |uv| 1))
                             |res|))))))))))))) 

(SDEFUN |RDEEFX;special_ei_candidates|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|vlst| |List| F)
         (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|tt| (F)) (|a| (|Integer|)) (#1=#:G1186 NIL)
          (|rcu| (|Union| (|Integer|) "failed")) (|lc| (F))
          (|res|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|rdf| #2=(|SparseUnivariatePolynomial| F)) (|rnf| #2#)
          (|n2| #3=(|NonNegativeInteger|)) (|n1| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |tt| (|spadConstant| $ 45)
                  . #4=(|RDEEFX;special_ei_candidates|))
            (LETT |a| 0 . #4#)
            (EXIT
             (COND
              ((SPADCALL |k| '|exp| (QREFELT $ 23))
               (SEQ (LETT |res| NIL . #4#)
                    (LETT |n1| (SPADCALL |nf| (QREFELT $ 41)) . #4#)
                    (LETT |n2| (SPADCALL |denf| (QREFELT $ 41)) . #4#)
                    (LETT |rnf| (SPADCALL |nf| (QREFELT $ 112)) . #4#)
                    (LETT |rdf| (SPADCALL |denf| (QREFELT $ 112)) . #4#)
                    (EXIT
                     (COND
                      ((EQL |n1| |n2|)
                       (SEQ (LETT |tt| (SPADCALL |nf| (QREFELT $ 105)) . #4#)
                            (LETT |res|
                                  (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                   |ulst| |k| |x| |a| |tt| |res| $)
                                  . #4#)
                            (COND
                             ((SPADCALL |rdf| (|spadConstant| $ 104)
                                        (QREFELT $ 111))
                              (COND
                               ((EQL (SPADCALL |rdf| (QREFELT $ 41))
                                     (SPADCALL |rnf| (QREFELT $ 41)))
                                (EXIT
                                 (SEQ
                                  (LETT |tt|
                                        (SPADCALL
                                         (SPADCALL |rnf| (QREFELT $ 105))
                                         (SPADCALL |rdf| (QREFELT $ 105))
                                         (QREFELT $ 69))
                                        . #4#)
                                  (EXIT
                                   (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                    |ulst| |k| |x| |a| |tt| |res| $))))))))
                            (EXIT |res|)))
                      (#5='T
                       (SEQ
                        (LETT |res|
                              (|RDEEFX;ei_candidate| |nf| |denf| |vlst| |ulst|
                               |k| |x| |a| (|spadConstant| $ 45) |res| $)
                              . #4#)
                        (COND
                         ((< |n1| |n2|)
                          (COND
                           ((SPADCALL |rdf| (|spadConstant| $ 104)
                                      (QREFELT $ 111))
                            (COND
                             ((EQL (SPADCALL |rdf| (QREFELT $ 41)) |n1|)
                              (EXIT
                               (SEQ
                                (LETT |tt|
                                      (SPADCALL (SPADCALL |nf| (QREFELT $ 105))
                                                (SPADCALL |rdf|
                                                          (QREFELT $ 105))
                                                (QREFELT $ 69))
                                      . #4#)
                                (EXIT
                                 (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                  |ulst| |k| |x| |a| |tt| |res| $))))))))))
                        (COND
                         ((SPADCALL |n1| |n2| (QREFELT $ 22))
                          (COND
                           ((SPADCALL |rnf| (|spadConstant| $ 104)
                                      (QREFELT $ 111))
                            (COND
                             ((EQL (SPADCALL |rnf| (QREFELT $ 41)) |n2|)
                              (EXIT
                               (SEQ
                                (LETT |tt| (SPADCALL |rnf| (QREFELT $ 105))
                                      . #4#)
                                (EXIT
                                 (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                  |ulst| |k| |x| |a| |tt| |res| $))))))))))
                        (EXIT |res|)))))))
              ((SPADCALL (SPADCALL |nf| (QREFELT $ 41))
                         (+ (SPADCALL |denf| (QREFELT $ 41)) 1) (QREFELT $ 42))
               NIL)
              (#5#
               (SEQ
                (COND
                 ((SPADCALL |k| '|log| (QREFELT $ 23))
                  (COND
                   ((EQL (SPADCALL |nf| (QREFELT $ 41))
                         (+ (SPADCALL |denf| (QREFELT $ 41)) 1))
                    (SEQ (LETT |lc| (SPADCALL |nf| (QREFELT $ 105)) . #4#)
                         (LETT |rcu| (SPADCALL |lc| (QREFELT $ 134)) . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |rcu| 1)
                            (PROGN (LETT #1# NIL . #4#) (GO #6=#:G1185)))
                           (#5#
                            (SEQ (LETT |a| (- (QCDR |rcu|)) . #4#)
                                 (EXIT
                                  (LETT |nf|
                                        (SPADCALL |nf|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |a|
                                                              (QREFELT $ 76))
                                                    1 (QREFELT $ 46))
                                                   |denf| (QREFELT $ 99))
                                                  (QREFELT $ 51))
                                        . #4#)))))))))))
                (COND
                 ((EQL (SPADCALL |nf| (QREFELT $ 41))
                       (SPADCALL |denf| (QREFELT $ 41)))
                  (LETT |tt| (SPADCALL |nf| (QREFELT $ 105)) . #4#)))
                (EXIT
                 (|RDEEFX;ei_candidate| |nf| |denf| |vlst| |ulst| |k| |x| |a|
                  |tt| NIL $))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |RDEEFX;gamma_candidate|
        ((|fnf| |Factored| (|SparseUnivariatePolynomial| F))
         (|nf1| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|gden1| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|a| |Integer|) (|tt| F) (|f2| |SparseUnivariatePolynomial| F)
         (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         (|res| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F)))
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|unf| (F)) (|nf2| (|SparseUnivariatePolynomial| F))
          (|m1| (|Integer|)) (#1=#:G1208 NIL)
          (|mu| (|Union| (|Integer|) "failed"))
          (|ur|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (#2=#:G1196 NIL)
          (|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (#3=#:G1194 NIL) (#4=#:G1214 NIL) (|e1| NIL) (#5=#:G1215 NIL)
          (|fac1| NIL) (#6=#:G1213 NIL)
          (|lexp1| (|List| (|NonNegativeInteger|))) (#7=#:G1189 NIL)
          (#8=#:G1212 NIL) (#9=#:G1211 NIL) (|l1| (|Integer|))
          (|lexp| (|List| #10=(|Integer|))) (#11=#:G1210 NIL) (#12=#:G1209 NIL)
          (|nffacs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| #10#)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |nffacs| (SPADCALL |fnf| (QREFELT $ 131))
                  . #13=(|RDEEFX;gamma_candidate|))
            (LETT |lexp|
                  (PROGN
                   (LETT #12# NIL . #13#)
                   (SEQ (LETT |fac1| NIL . #13#) (LETT #11# |nffacs| . #13#)
                        G190
                        (COND
                         ((OR (ATOM #11#)
                              (PROGN (LETT |fac1| (CAR #11#) . #13#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT (LETT #12# (CONS (QCDR |fac1|) #12#) . #13#)))
                        (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  . #13#)
            (LETT |l1| (GCD |gexp| (SPADCALL |lexp| (QREFELT $ 117))) . #13#)
            (EXIT
             (COND ((EQL |l1| 1) |res|)
                   (#14='T
                    (SEQ
                     (LETT |lexp1|
                           (PROGN
                            (LETT #9# NIL . #13#)
                            (SEQ (LETT |e1| NIL . #13#)
                                 (LETT #8# |lexp| . #13#) G190
                                 (COND
                                  ((OR (ATOM #8#)
                                       (PROGN
                                        (LETT |e1| (CAR #8#) . #13#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #9#
                                         (CONS
                                          (PROG1
                                              (LETT #7# (QUOTIENT2 |e1| |l1|)
                                                    . #13#)
                                            (|check_subtype2| (>= #7# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #7#))
                                          #9#)
                                         . #13#)))
                                 (LETT #8# (CDR #8#) . #13#) (GO G190) G191
                                 (EXIT (NREVERSE #9#))))
                           . #13#)
                     (LETT |nf2|
                           (SPADCALL (ELT $ 99)
                                     (PROGN
                                      (LETT #6# NIL . #13#)
                                      (SEQ (LETT |fac1| NIL . #13#)
                                           (LETT #5# |nffacs| . #13#)
                                           (LETT |e1| NIL . #13#)
                                           (LETT #4# |lexp1| . #13#) G190
                                           (COND
                                            ((OR (ATOM #4#)
                                                 (PROGN
                                                  (LETT |e1| (CAR #4#) . #13#)
                                                  NIL)
                                                 (ATOM #5#)
                                                 (PROGN
                                                  (LETT |fac1| (CAR #5#)
                                                        . #13#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #6#
                                                   (CONS
                                                    (|RDEEFX;my_exp|
                                                     (QCAR |fac1|) |e1| $)
                                                    #6#)
                                                   . #13#)))
                                           (LETT #4#
                                                 (PROG1 (CDR #4#)
                                                   (LETT #5# (CDR #5#) . #13#))
                                                 . #13#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #6#))))
                                     (|spadConstant| $ 110) (QREFELT $ 202))
                           . #13#)
                     (LETT |gden1|
                           (COND ((EQL |gexp| 1) (|spadConstant| $ 110))
                                 (#14#
                                  (|RDEEFX;my_exp| |gden1|
                                   (PROG1
                                       (LETT #3# (QUOTIENT2 |gexp| |l1|)
                                             . #13#)
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                   $)))
                           . #13#)
                     (LETT |uvu| (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| $)
                           . #13#)
                     (EXIT
                      (COND ((QEQCAR |uvu| 1) |res|)
                            (#14#
                             (SEQ (LETT |uv| (QCDR |uvu|) . #13#)
                                  (LETT |unf|
                                        (SPADCALL
                                         (SPADCALL |fnf| (QREFELT $ 203))
                                         (QREFELT $ 204))
                                        . #13#)
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |unf| |x| (QREFELT $ 64))
                                     (|spadConstant| $ 45) (QREFELT $ 132))
                                    (SEQ
                                     (LETT |ur|
                                           (SPADCALL |unf|
                                                     (PROG1
                                                         (LETT #2# |l1| . #13#)
                                                       (|check_subtype2|
                                                        (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #2#))
                                                     (QREFELT $ 207))
                                           . #13#)
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL (QVELT |ur| 2) |x|
                                                  (QREFELT $ 64))
                                        (|spadConstant| $ 45) (QREFELT $ 132))
                                       (PROGN
                                        (LETT #1# |res| . #13#)
                                        (GO #15=#:G1207))))
                                     (LETT |mu|
                                           (SPADCALL |l1| (QVELT |ur| 0)
                                                     (QREFELT $ 119))
                                           . #13#)
                                     (COND
                                      ((QEQCAR |mu| 1)
                                       (PROGN
                                        (LETT #1# |res| . #13#)
                                        (GO #15#))))
                                     (LETT |m1| (QCDR |mu|) . #13#)
                                     (LETT |nf2|
                                           (SPADCALL |nf2| (QVELT |ur| 1)
                                                     (QREFELT $ 208))
                                           . #13#)
                                     (EXIT
                                      (LETT |unf|
                                            (SPADCALL (QVELT |ur| 2) |m1|
                                                      (QREFELT $ 81))
                                            . #13#)))))
                                  (EXIT
                                   (CONS
                                    (VECTOR |l1| |nf2| |unf| |a| |tt| |f2|
                                            (SPADCALL |nf1| |denf|
                                                      (QREFELT $ 198))
                                            (SPADCALL |nf2| |gden1|
                                                      (QREFELT $ 198))
                                            (QVELT |uv| 0) (QVELT |uv| 2)
                                            (QVELT |uv| 1))
                                    |res|))))))))))))
          #15# (EXIT #1#)))) 

(SDEFUN |RDEEFX;gammas1|
        ((|nf| |SparseUnivariatePolynomial| F) (|a| |Integer|)
         (|denf| |SparseUnivariatePolynomial| F)
         (|denf1| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|n2| |Integer|) (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F)
         (|x| |Symbol|)
         (|res| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F)))
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|fnf| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|nf1| (|SparseUnivariatePolynomial| F)) (|cfac| (F))
          (|f2| (|SparseUnivariatePolynomial| F)) (|tt| (F))
          (|deg1| (|NonNegativeInteger|))
          (|f1| #1=(|SparseUnivariatePolynomial| F)) (#2=#:G1233 NIL)
          (|fac| NIL) (|e_tt| (|List| F))
          (|rfacs|
           (|List| (|Record| (|:| |factor| #1#) (|:| |exponent| (|Integer|)))))
          (|f_res| (|Factored| (|SparseUnivariatePolynomial| F))) (|r| (F))
          (|nfp1| (|SparseUnivariatePolynomial| F)) (|t| (|Kernel| F)))
         (SEQ
          (LETT |t| (SPADCALL (SPADCALL (QREFELT $ 59)) (QREFELT $ 60))
                . #3=(|RDEEFX;gammas1|))
          (LETT |nfp1|
                (SPADCALL
                 (SPADCALL (SPADCALL |nf| (QREFELT $ 193)) |denf1|
                           (QREFELT $ 99))
                 (SPADCALL
                  (SPADCALL (SPADCALL |gexp| (QREFELT $ 76)) |nf|
                            (QREFELT $ 137))
                  (SPADCALL |denf1| (QREFELT $ 193)) (QREFELT $ 99))
                 (QREFELT $ 48))
                . #3#)
          (LETT |r|
                (SPADCALL
                 (SPADCALL |nf|
                           (SPADCALL
                            (SPADCALL (SPADCALL |t| (QREFELT $ 63))
                                      (QREFELT $ 47))
                            |denf| (QREFELT $ 99))
                           (QREFELT $ 51))
                 |nfp1| (QREFELT $ 194))
                . #3#)
          (LETT |f_res|
                (SPADCALL
                 (SPADCALL (SPADCALL |r| |t| (QREFELT $ 36)) (QREFELT $ 39))
                 (QREFELT $ 128))
                . #3#)
          (LETT |rfacs| (SPADCALL |f_res| (QREFELT $ 131)) . #3#)
          (LETT |e_tt|
                (COND
                 ((EQL (SPADCALL |nf| (QREFELT $ 41)) 0)
                  (LIST (|spadConstant| $ 45)))
                 ((EQL (SPADCALL |nf| (QREFELT $ 41))
                       (SPADCALL |denf| (QREFELT $ 41)))
                  (SEQ
                   (LETT |tt|
                         (SPADCALL
                          (SPADCALL (SPADCALL |nf| (QREFELT $ 105))
                                    (SPADCALL |denf| (QREFELT $ 105))
                                    (QREFELT $ 69))
                          (QREFELT $ 50))
                         . #3#)
                   (LETT |nf1|
                         (SPADCALL |nf|
                                   (SPADCALL (SPADCALL |tt| (QREFELT $ 47))
                                             |denf| (QREFELT $ 99))
                                   (QREFELT $ 51))
                         . #3#)
                   (EXIT
                    (COND ((EQL (SPADCALL |nf1| (QREFELT $ 41)) 0) (LIST |tt|))
                          (#4='T NIL)))))
                 (#4# NIL))
                . #3#)
          (COND
           ((NULL (NULL |e_tt|))
            (SEQ (LETT |tt| (|SPADfirst| |e_tt|) . #3#)
                 (LETT |nf1|
                       (SPADCALL |nf|
                                 (SPADCALL (SPADCALL |tt| (QREFELT $ 47))
                                           |denf| (QREFELT $ 99))
                                 (QREFELT $ 51))
                       . #3#)
                 (LETT |fnf| (SPADCALL |nf1| NIL (QREFELT $ 212)) . #3#)
                 (EXIT
                  (LETT |res|
                        (|RDEEFX;gamma_candidate| |fnf| |nf1| |denf| |denf1|
                         |gexp| |a| |tt| (|spadConstant| $ 104) |vlst| |ulst|
                         |k| |x| |res| $)
                        . #3#)))))
          (SEQ (LETT |fac| NIL . #3#) (LETT #2# |rfacs| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |f1| (QCAR |fac|) . #3#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 41)) . #3#)
                    (EXIT
                     (COND
                      ((EQL |deg1| 1)
                       (SEQ
                        (LETT |tt|
                              (SPADCALL
                               (SPADCALL (SPADCALL |f1| 0 (QREFELT $ 43))
                                         (SPADCALL |f1| 1 (QREFELT $ 43))
                                         (QREFELT $ 69))
                               (QREFELT $ 50))
                              . #3#)
                        (LETT |nf1|
                              (SPADCALL |nf|
                                        (SPADCALL
                                         (SPADCALL |tt| (QREFELT $ 47)) |denf|
                                         (QREFELT $ 99))
                                        (QREFELT $ 51))
                              . #3#)
                        (EXIT
                         (COND
                          ((< (SPADCALL 2 (QCDR |fac|) (QREFELT $ 214))
                              (SPADCALL |nf1| (QREFELT $ 41)))
                           "iterate")
                          ('T
                           (SEQ
                            (LETT |fnf| (SPADCALL |nf1| (QREFELT $ 216)) . #3#)
                            (EXIT
                             (LETT |res|
                                   (|RDEEFX;gamma_candidate| |fnf| |nf1| |denf|
                                    |denf1| |gexp| |a| |tt|
                                    (|spadConstant| $ 104) |vlst| |ulst| |k|
                                    |x| |res| $)
                                   . #3#))))))))
                      ((< (QCDR |fac|) |n2|) "iterate")
                      ((EQL |deg1| 2)
                       (SEQ
                        (LETT |tt|
                              (SPADCALL
                               (SPADCALL (SPADCALL |f1| 1 (QREFELT $ 43))
                                         (SPADCALL (SPADCALL 2 (QREFELT $ 76))
                                                   (SPADCALL |f1|
                                                             (QREFELT $ 105))
                                                   (QREFELT $ 67))
                                         (QREFELT $ 69))
                               (QREFELT $ 50))
                              . #3#)
                        (LETT |f2|
                              (SPADCALL |f1| (QREFELT $ 94)
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 33) 1
                                                   (QREFELT $ 46))
                                         (SPADCALL |tt| (QREFELT $ 47))
                                         (QREFELT $ 51))
                                        (QREFELT $ 95))
                              . #3#)
                        (COND
                         ((NULL
                           (SPADCALL (CONS #'|RDEEFX;gammas1!0| (VECTOR $ |x|))
                                     (SPADCALL |f2| (QREFELT $ 96))
                                     (QREFELT $ 98)))
                          (EXIT "iterate")))
                        (LETT |cfac| (SPADCALL |f2| (QREFELT $ 217)) . #3#)
                        (LETT |nf1|
                              (SPADCALL |nf|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |tt| |cfac| (QREFELT $ 75))
                                          (QREFELT $ 47))
                                         |denf| (QREFELT $ 99))
                                        (QREFELT $ 51))
                              . #3#)
                        (LETT |fnf| (SPADCALL |nf1| (QREFELT $ 216)) . #3#)
                        (EXIT
                         (LETT |res|
                               (|RDEEFX;gamma_candidate| |fnf| |nf1| |denf|
                                |denf1| |gexp| |a| |tt| |f2| |vlst| |ulst| |k|
                                |x| |res| $)
                               . #3#)))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |RDEEFX;gammas1!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX;gammas1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 64)) (|spadConstant| $ 45)
                      (QREFELT $ 80)))))) 

(SDEFUN |RDEEFX;special_candidates|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|denf1| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|res1|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|nn| #1=(|SparseUnivariatePolynomial| F)) (|ri| (|Integer|))
          (|ru| (|Union| (|Integer|) "failed")) (#2=#:G1257 NIL) (|sol| NIL)
          (|lsol|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
          (|f_res1| (F)) (|tx_plus_b| #1#) (|bk| #3=(|Kernel| F))
          (|bs| #4=(|Symbol|)) (#5=#:G1256 NIL) (|r0| NIL)
          (|ratl| (|List| (|Fraction| (|Integer|))))
          (|nnp2| (|SparseUnivariatePolynomial| F))
          (|t3| #6=(|SparseUnivariatePolynomial| F)) (|t2| #6#) (|ct1| (F))
          (|t1| #6#) (|denf2| (|SparseUnivariatePolynomial| F))
          (|denfp2| #7=(|SparseUnivariatePolynomial| F)) (|nfp2| #7#)
          (|nnp| #1#) (|denfp1| #7#) (|nfp1| #7#) (|t| #3#) (|ts| #4#)
          (|n4| (|Integer|)) (|l| (|Integer|)) (|n3| (|NonNegativeInteger|))
          (|n1| #8=(|NonNegativeInteger|)) (|a| (|Integer|)) (#9=#:G1255 NIL)
          (|rcu| (|Union| (|Integer|) "failed")) (|lc| (F)) (|n2| #8#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res1|
                  (|RDEEFX;special_ei_candidates| |nf| |denf| |vlst| |ulst| |k|
                   |x| $)
                  . #10=(|RDEEFX;special_candidates|))
            (LETT |a| 0 . #10#)
            (LETT |n1| (SPADCALL |nf| (QREFELT $ 41)) . #10#)
            (LETT |n2| (SPADCALL |denf| (QREFELT $ 41)) . #10#)
            (EXIT
             (COND ((EQL |n1| 1) |res1|)
                   (#11='T
                    (SEQ
                     (COND
                      ((EQL |n1| (+ |n2| 1))
                       (COND
                        ((NULL (SPADCALL |k| '|log| (QREFELT $ 23)))
                         (PROGN (LETT #9# |res1| . #10#) (GO #12=#:G1254)))
                        ('T
                         (SEQ
                          (LETT |lc| (SPADCALL |nf| (QREFELT $ 105)) . #10#)
                          (LETT |rcu| (SPADCALL |lc| (QREFELT $ 134)) . #10#)
                          (EXIT
                           (COND
                            ((QEQCAR |rcu| 1)
                             (PROGN (LETT #9# |res1| . #10#) (GO #12#)))
                            (#11#
                             (SEQ (LETT |a| (QCDR |rcu|) . #10#)
                                  (LETT |nf|
                                        (SPADCALL |nf|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |a|
                                                              (QREFELT $ 76))
                                                    1 (QREFELT $ 46))
                                                   |denf| (QREFELT $ 99))
                                                  (QREFELT $ 48))
                                        . #10#)
                                  (EXIT (LETT |n1| |n2| . #10#)))))))))))
                     (LETT |n3| (MAX |n1| |n2|) . #10#)
                     (LETT |l| (GCD |gexp| |n3|) . #10#)
                     (EXIT
                      (COND ((EQL |l| 1) |res1|)
                            (#11#
                             (SEQ
                              (LETT |n4| (- |n3| (QUOTIENT2 |n3| 2)) . #10#)
                              (LETT |ts| (SPADCALL (QREFELT $ 59)) . #10#)
                              (LETT |t| (SPADCALL |ts| (QREFELT $ 60)) . #10#)
                              (LETT |nfp1| (SPADCALL |nf| (QREFELT $ 193))
                                    . #10#)
                              (LETT |denfp1| (SPADCALL |denf1| (QREFELT $ 193))
                                    . #10#)
                              (COND
                               ((SPADCALL |n1| |n2| (QREFELT $ 22))
                                (COND
                                 ((SPADCALL |k| '|log| (QREFELT $ 23))
                                  (EXIT
                                   (SEQ
                                    (LETT |nnp|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |nfp1| |denf1|
                                                      (QREFELT $ 99))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |gexp| (QREFELT $ 76))
                                              |denfp1| (QREFELT $ 137))
                                             |nf| (QREFELT $ 99))
                                            (QREFELT $ 48))
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |t| (QREFELT $ 63))
                                              (QREFELT $ 47))
                                             |denf| (QREFELT $ 99))
                                            |denf1| (QREFELT $ 99))
                                           (QREFELT $ 51))
                                          . #10#)
                                    (EXIT
                                     (COND
                                      ((ODDP |l|)
                                       (SEQ
                                        (LETT |nfp2|
                                              (SPADCALL |nfp1| (QREFELT $ 193))
                                              . #10#)
                                        (LETT |denfp2|
                                              (SPADCALL |denfp1|
                                                        (QREFELT $ 193))
                                              . #10#)
                                        (LETT |denf2|
                                              (SPADCALL |denf1| |denf1|
                                                        (QREFELT $ 99))
                                              . #10#)
                                        (LETT |t1|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 2 |gexp|
                                                          (QREFELT $ 214))
                                                (QREFELT $ 76))
                                               |denfp1| (QREFELT $ 137))
                                              . #10#)
                                        (LETT |t1|
                                              (SPADCALL
                                               (SPADCALL |t1| |nfp1|
                                                         (QREFELT $ 99))
                                               |denf1| (QREFELT $ 99))
                                              . #10#)
                                        (LETT |ct1|
                                              (SPADCALL (* (+ |gexp| 1) |gexp|)
                                                        (QREFELT $ 76))
                                              . #10#)
                                        (LETT |t2|
                                              (SPADCALL |ct1| |denfp1|
                                                        (QREFELT $ 137))
                                              . #10#)
                                        (LETT |t2|
                                              (SPADCALL
                                               (SPADCALL |t2| |denfp1|
                                                         (QREFELT $ 99))
                                               |nf| (QREFELT $ 99))
                                              . #10#)
                                        (LETT |t3|
                                              (SPADCALL
                                               (SPADCALL |gexp| (QREFELT $ 76))
                                               |denfp2| (QREFELT $ 137))
                                              . #10#)
                                        (LETT |t3|
                                              (SPADCALL
                                               (SPADCALL |t3| |nf|
                                                         (QREFELT $ 99))
                                               |denf1| (QREFELT $ 99))
                                              . #10#)
                                        (LETT |nnp2|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |nfp2| |denf2|
                                                           (QREFELT $ 99))
                                                 |t1| (QREFELT $ 48))
                                                |t2| (QREFELT $ 51))
                                               |t3| (QREFELT $ 48))
                                              . #10#)
                                        (LETT |f_res1|
                                              (SPADCALL |nnp| |nnp2|
                                                        (QREFELT $ 194))
                                              . #10#)
                                        (LETT |ratl|
                                              (SPADCALL |f_res1| |t|
                                                        (QREFELT $ 168))
                                              . #10#)
                                        (SEQ (LETT |r0| NIL . #10#)
                                             (LETT #5# |ratl| . #10#) G190
                                             (COND
                                              ((OR (ATOM #5#)
                                                   (PROGN
                                                    (LETT |r0| (CAR #5#)
                                                          . #10#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |ru|
                                                    (SPADCALL |r0|
                                                              (QREFELT $ 192))
                                                    . #10#)
                                              (EXIT
                                               (COND
                                                ((QEQCAR |ru| 1) "iterate")
                                                ('T
                                                 (SEQ
                                                  (LETT |ri| (QCDR |ru|)
                                                        . #10#)
                                                  (LETT |nn|
                                                        (SPADCALL |nf|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |ri|
                                                                     (QREFELT $
                                                                              76))
                                                                    1
                                                                    (QREFELT $
                                                                             46))
                                                                   |denf|
                                                                   (QREFELT $
                                                                            99))
                                                                  (QREFELT $
                                                                           51))
                                                        . #10#)
                                                  (EXIT
                                                   (LETT |res1|
                                                         (|RDEEFX;gammas1| |nn|
                                                          |ri| |denf| |denf1|
                                                          |gexp| |n2| |vlst|
                                                          |ulst| |k| |x| |res1|
                                                          $)
                                                         . #10#)))))))
                                             (LETT #5# (CDR #5#) . #10#)
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT |res1|)))
                                      (#11#
                                       (SEQ
                                        (LETT |bs| (SPADCALL (QREFELT $ 59))
                                              . #10#)
                                        (LETT |bk|
                                              (SPADCALL |bs| (QREFELT $ 60))
                                              . #10#)
                                        (LETT |tx_plus_b|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |t| (QREFELT $ 63)) 1
                                                (QREFELT $ 46))
                                               (SPADCALL
                                                (SPADCALL |bk| (QREFELT $ 63))
                                                (QREFELT $ 47))
                                               (QREFELT $ 51))
                                              . #10#)
                                        (LETT |f_res1|
                                              (SPADCALL |nnp|
                                                        (SPADCALL |nf|
                                                                  (SPADCALL
                                                                   |tx_plus_b|
                                                                   |denf|
                                                                   (QREFELT $
                                                                            99))
                                                                  (QREFELT $
                                                                           51))
                                                        (QREFELT $ 194))
                                              . #10#)
                                        (LETT |lsol|
                                              (|RDEEFX;solve_poly_eqs|
                                               (LIST |f_res1|
                                                     (SPADCALL |f_res1| |bs|
                                                               (QREFELT $ 64)))
                                               |ts| |bs| $)
                                              . #10#)
                                        (SEQ (LETT |sol| NIL . #10#)
                                             (LETT #2# |lsol| . #10#) G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |sol| (CAR #2#)
                                                          . #10#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |ru|
                                                    (SPADCALL (QCAR |sol|)
                                                              (QREFELT $ 192))
                                                    . #10#)
                                              (EXIT
                                               (COND
                                                ((QEQCAR |ru| 1) "iterate")
                                                ('T
                                                 (SEQ
                                                  (LETT |ri| (QCDR |ru|)
                                                        . #10#)
                                                  (LETT |nn|
                                                        (SPADCALL |nf|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |ri|
                                                                     (QREFELT $
                                                                              76))
                                                                    1
                                                                    (QREFELT $
                                                                             46))
                                                                   |denf|
                                                                   (QREFELT $
                                                                            99))
                                                                  (QREFELT $
                                                                           51))
                                                        . #10#)
                                                  (EXIT
                                                   (LETT |res1|
                                                         (|RDEEFX;gammas1| |nn|
                                                          |ri| |denf| |denf1|
                                                          |gexp| |n2| |vlst|
                                                          |ulst| |k| |x| |res1|
                                                          $)
                                                         . #10#)))))))
                                             (LETT #2# (CDR #2#) . #10#)
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT |res1|)))))))))))
                              (EXIT
                               (|RDEEFX;gammas1| |nf| |a| |denf| |denf1| |gexp|
                                |n2| |vlst| |ulst| |k| |x| |res1| $))))))))))))
          #12# (EXIT #9#)))) 

(SDEFUN |RDEEFX;finish_special_integrate2|
        ((|rr1f| F) (|csol| |Vector| F) (|a1p| F) (|as| |Vector| F)
         (|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F)))
         (|denf| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|k| |Kernel| F)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|cand_prims| (|List| F)) (|ansp| (F)) (#1=#:G1264 NIL) (|i| NIL))
         (SEQ (LETT |cand_prims| NIL . #2=(|RDEEFX;finish_special_integrate2|))
              (LETT |ansp| (|spadConstant| $ 45) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |as|) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (COND
                     ((NULL |cand_prims|)
                      (SEQ
                       (LETT |cand_prims|
                             (|RDEEFX;get_prims| (|SPADfirst| |scands|) |denf|
                              |denf| |gexp| |k| $)
                             . #2#)
                       (EXIT (LETT |scands| (CDR |scands|) . #2#)))))
                    (LETT |a1p|
                          (SPADCALL |a1p|
                                    (SPADCALL
                                     (SPADCALL |csol| |i| (QREFELT $ 218))
                                     (SPADCALL |as| |i| (QREFELT $ 218))
                                     (QREFELT $ 67))
                                    (QREFELT $ 79))
                          . #2#)
                    (LETT |ansp|
                          (SPADCALL |ansp|
                                    (SPADCALL
                                     (SPADCALL |csol| |i| (QREFELT $ 218))
                                     (|SPADfirst| |cand_prims|) (QREFELT $ 67))
                                    (QREFELT $ 75))
                          . #2#)
                    (EXIT (LETT |cand_prims| (CDR |cand_prims|) . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |a1p| |rr1f| |ansp| 'T))))) 

(SDEFUN |RDEEFX;finish_special_integrate|
        ((|rr1f| F) (|a1p| F) (|vs| |Vector| F) (|as| |Vector| F)
         (|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F)))
         (|denf| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|k| |Kernel| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|csol| (|Vector| F)) (|csolu| (|Union| (|Vector| F) "failed")))
         (SEQ
          (LETT |csolu|
                (SPADCALL |vs| |rr1f|
                          (LIST
                           (CONS #'|RDEEFX;finish_special_integrate!0|
                                 (VECTOR $ |x|)))
                          (QREFELT $ 223))
                . #1=(|RDEEFX;finish_special_integrate|))
          (EXIT
           (COND
            ((QEQCAR |csolu| 1)
             (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 45)
                     (|spadConstant| $ 45) NIL))
            ('T
             (SEQ (LETT |csol| (QCDR |csolu|) . #1#)
                  (EXIT
                   (|RDEEFX;finish_special_integrate2| |rr1f| |csol| |a1p| |as|
                    |scands| |denf| |gexp| |k| $))))))))) 

(SDEFUN |RDEEFX;finish_special_integrate!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX;finish_special_integrate|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |c| |x| (QREFELT $ 64)))))) 

(SDEFUN |RDEEFX;exp_lower_bound|
        ((|nfp| |SparseUnivariatePolynomial| F) (|eta| F)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| F))
         (|scoeffs| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|x| |Symbol|) (|lk| |List| (|Kernel| F)) ($ |Integer|))
        (SPROG
         ((|min_deg| (|Integer|)) (|max_deg| (|Integer|))
          (|c_degs| (|List| (|NonNegativeInteger|))) (#1=#:G1288 NIL)
          (|scoeff| NIL) (#2=#:G1287 NIL)
          (|b| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
          (|logi|
           (|Mapping|
            (|Record| (|:| |logands| (|List| F))
                      (|:| |basis|
                           (|List| (|Vector| (|Fraction| (|Integer|))))))
            (|List| (|Kernel| F)) (|List| F))))
         (SEQ
          (LETT |logi| (CONS #'|RDEEFX;exp_lower_bound!0| (VECTOR $ |x|))
                . #3=(|RDEEFX;exp_lower_bound|))
          (LETT |b| (SPADCALL |nfp| (QREFELT $ 228)) . #3#)
          (LETT |c_degs|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |scoeff| NIL . #3#) (LETT #1# |scoeffs| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |scoeff| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |scoeff| (QREFELT $ 40))
                                         (QREFELT $ 41))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |c_degs|
                (CONS (SPADCALL (SPADCALL |rr1| (QREFELT $ 40)) (QREFELT $ 41))
                      |c_degs|)
                . #3#)
          (LETT |max_deg| (SPADCALL (ELT $ 229) |c_degs| (QREFELT $ 232))
                . #3#)
          (LETT |min_deg| (SPADCALL |nfp| (QREFELT $ 233)) . #3#)
          (EXIT
           (SPADCALL (|spadConstant| $ 110) |b| |min_deg| (- |max_deg|) |lk|
                     |eta| |logi| (QREFELT $ 236)))))) 

(SDEFUN |RDEEFX;exp_lower_bound!0| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX;exp_lower_bound|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |x2| |x3| (QREFELT $ 226)))))) 

(SDEFUN |RDEEFX;special_integrate2|
        ((|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|ndenf| |SparseUnivariatePolynomial| F) (|f| F) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F)) (|x| |Symbol|)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| F)) (|a1| F) (|r1| F)
         (|g| F)
         (|scoeffs| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F)))
         (|gexp| |Integer|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|as| (|Vector| F))
          (|part| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|partu|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                    "failed"))
          (|g1| (F)) (|lg1| (|List| F)) (#1=#:G1298 NIL) (|scoeff| NIL)
          (#2=#:G1297 NIL))
         (SEQ
          (LETT |lg1|
                (PROGN
                 (LETT #2# NIL . #3=(|RDEEFX;special_integrate2|))
                 (SEQ (LETT |scoeff| NIL . #3#) (LETT #1# |scoeffs| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |scoeff| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |scoeff| |k| (QREFELT $ 62)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |g1| (SPADCALL |rr1| |k| (QREFELT $ 62)) . #3#)
          (LETT |partu|
                (SPADCALL |f| |g1| |lg1| |x| (CONS |k| |lk|) (QREFELT $ 239))
                . #3#)
          (EXIT
           (COND
            ((QEQCAR |partu| 1)
             (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 45)
                     (|spadConstant| $ 45) NIL))
            ('T
             (SEQ (LETT |part| (QCDR |partu|) . #3#)
                  (LETT |as|
                        (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 45))
                        . #3#)
                  (EXIT
                   (|RDEEFX;finish_special_integrate2| |g1| (QCDR |part|)
                    (QCAR |part|) |as| |scands| |denf| |gexp| |k| $))))))))) 

(SDEFUN |RDEEFX;do_spde1|
        ((|rr1| |Fraction| (|SparseUnivariatePolynomial| F))
         (|nfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |ans| F) (|:| |defect| F) (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|def_f| (F)) (|af| (F)) (|r2| (|SparseUnivariatePolynomial| F))
          (|a1| #1=(|SparseUnivariatePolynomial| F))
          (|res1|
           (|Record| (|:| |ans| #1#)
                     (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (|spec1p| (|SparseUnivariatePolynomial| F))
          (|spec1u| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
         (SEQ
          (LETT |spec1u| (SPADCALL |rr1| (QREFELT $ 241))
                . #2=(|RDEEFX;do_spde1|))
          (EXIT
           (COND ((QEQCAR |spec1u| 1) (|error| "impossible 7"))
                 ('T
                  (SEQ (LETT |spec1p| (QCDR |spec1u|) . #2#)
                       (LETT |res1|
                             (SPADCALL |nfp| |spec1p| |der| (QREFELT $ 245))
                             . #2#)
                       (LETT |a1| (QCAR |res1|) . #2#)
                       (LETT |r2|
                             (SPADCALL (SPADCALL |a1| |der|)
                                       (SPADCALL |nfp| |a1| (QREFELT $ 99))
                                       (QREFELT $ 51))
                             . #2#)
                       (LETT |af|
                             (SPADCALL (SPADCALL |a1| (QREFELT $ 49)) |k|
                                       (QREFELT $ 62))
                             . #2#)
                       (LETT |def_f|
                             (SPADCALL
                              (SPADCALL |rr1| (SPADCALL |r2| (QREFELT $ 49))
                                        (QREFELT $ 246))
                              |k| (QREFELT $ 62))
                             . #2#)
                       (EXIT
                        (VECTOR |af| |def_f|
                                (SPADCALL (QCDR |res1|) (|spadConstant| $ 104)
                                          (QREFELT $ 113))))))))))) 

(SDEFUN |RDEEFX;special_integrate1|
        ((|nfp| . #1=(|SparseUnivariatePolynomial| F)) (|f| F) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F)) (|x| |Symbol|)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| F)) (|a1| F) (|r1| F)
         (|g| F) (|ansp| F)
         (|scoeffs| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F)))
         (|gexp| |Integer|)
         (|derivation| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|res3|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|res2|
           (|Record| (|:| |ans| F) (|:| |defect| F) (|:| |sol?| (|Boolean|))))
          (#2=#:G1326 NIL) (|scoeff| NIL) (#3=#:G1327 NIL) (|i| NIL)
          (|as| #4=(|Vector| F)) (|vs| #4#) (|rr1f| (F)) (|a1p| (F))
          (|inv_den1| (F)) (|nfp1| #1#) (|ak| (F)) (#5=#:G1325 NIL)
          (#6=#:G1324 NIL) (|mm| (|SparseUnivariatePolynomial| F))
          (#7=#:G1313 NIL) (|neg_deg| (|Integer|)) (|eta| (F))
          (#8=#:G1309 NIL))
         (SEQ
          (LETT |neg_deg|
                (COND
                 ((SPADCALL |k| '|exp| (QREFELT $ 23))
                  (SEQ
                   (LETT |eta|
                         (SPADCALL
                          (PROG2
                              (LETT #8#
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 33) 1
                                                (QREFELT $ 46))
                                      |derivation|)
                                     (SPADCALL (|spadConstant| $ 33) 1
                                               (QREFELT $ 46))
                                     (QREFELT $ 109))
                                    . #9=(|RDEEFX;special_integrate1|))
                              (QCDR #8#)
                            (|check_union2| (QEQCAR #8# 0)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))
                                            (|Union|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 7))
                                             "failed")
                                            #8#))
                          (QREFELT $ 204))
                         . #9#)
                   (EXIT
                    (-
                     (|RDEEFX;exp_lower_bound| |nfp| |eta| |rr1| |scoeffs| |x|
                      |lk| $)))))
                 (#10='T 0))
                . #9#)
          (LETT |nfp1| |nfp| . #9#)
          (LETT |inv_den1| (|spadConstant| $ 33) . #9#)
          (COND
           ((SPADCALL |neg_deg| 0 (QREFELT $ 42))
            (SEQ
             (LETT |mm|
                   (SPADCALL (|spadConstant| $ 33)
                             (PROG1 (LETT #7# |neg_deg| . #9#)
                               (|check_subtype2| (>= #7# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #7#))
                             (QREFELT $ 46))
                   . #9#)
             (LETT |scoeffs|
                   (PROGN
                    (LETT #6# NIL . #9#)
                    (SEQ (LETT |scoeff| NIL . #9#) (LETT #5# |scoeffs| . #9#)
                         G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |scoeff| (CAR #5#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6#
                                 (CONS (SPADCALL |mm| |scoeff| (QREFELT $ 247))
                                       #6#)
                                 . #9#)))
                         (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   . #9#)
             (LETT |rr1| (SPADCALL |mm| |rr1| (QREFELT $ 247)) . #9#)
             (LETT |ak|
                   (SPADCALL (SPADCALL |k| (QREFELT $ 28)) 1 (QREFELT $ 30))
                   . #9#)
             (LETT |nfp1|
                   (SPADCALL |nfp|
                             (SPADCALL
                              (SPADCALL (SPADCALL |neg_deg| (QREFELT $ 76))
                                        (SPADCALL |ak| |x| (QREFELT $ 64))
                                        (QREFELT $ 67))
                              (QREFELT $ 47))
                             (QREFELT $ 48))
                   . #9#)
             (EXIT
              (LETT |inv_den1|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 248)
                               (SPADCALL |mm| (QREFELT $ 49)) (QREFELT $ 52))
                     |k| (QREFELT $ 62))
                    . #9#)))))
          (LETT |res2| (|RDEEFX;do_spde1| |rr1| |nfp1| |k| |derivation| $)
                . #9#)
          (LETT |a1p| (SPADCALL |inv_den1| (QVELT |res2| 0) (QREFELT $ 67))
                . #9#)
          (EXIT
           (COND
            ((QVELT |res2| 2)
             (VECTOR (SPADCALL |a1| |a1p| (QREFELT $ 75)) |g| |ansp| 'T))
            (#10#
             (SEQ (LETT |rr1f| (QVELT |res2| 1) . #9#)
                  (LETT |vs|
                        (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 45))
                        . #9#)
                  (LETT |as|
                        (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 45))
                        . #9#)
                  (SEQ (LETT |i| 1 . #9#) (LETT #3# (LENGTH |scoeffs|) . #9#)
                       (LETT |scoeff| NIL . #9#) (LETT #2# |scoeffs| . #9#)
                       G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |scoeff| (CAR #2#) . #9#) NIL)
                             (|greater_SI| |i| #3#))
                         (GO G191)))
                       (SEQ
                        (LETT |res2|
                              (|RDEEFX;do_spde1| |scoeff| |nfp1| |k|
                               |derivation| $)
                              . #9#)
                        (SPADCALL |as| |i|
                                  (SPADCALL |inv_den1| (QVELT |res2| 0)
                                            (QREFELT $ 67))
                                  (QREFELT $ 249))
                        (EXIT
                         (SPADCALL |vs| |i| (QVELT |res2| 1) (QREFELT $ 249))))
                       (LETT #2#
                             (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #9#))
                             . #9#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |res3|
                        (|RDEEFX;finish_special_integrate| |rr1f| |a1p| |vs|
                         |as| |scands| (|spadConstant| $ 110) |gexp| |k| |x| $)
                        . #9#)
                  (COND
                   ((NULL (QVELT |res3| 3))
                    (EXIT
                     (COND
                      ((SPADCALL |neg_deg| 0 (QREFELT $ 42))
                       (VECTOR |a1| |r1| |ansp| NIL))
                      (#10#
                       (VECTOR (SPADCALL |a1| |a1p| (QREFELT $ 75))
                               (SPADCALL |g| |rr1f| (QREFELT $ 79)) |ansp|
                               NIL))))))
                  (EXIT
                   (VECTOR (SPADCALL |a1| (QVELT |res3| 0) (QREFELT $ 75)) |g|
                           (SPADCALL |ansp| (QVELT |res3| 2) (QREFELT $ 75))
                           'T))))))))) 

(SDEFUN |RDEEFX;mk_pow1| ((|u| F) (|i| |Integer|) ($ F))
        (SPADCALL |u| |i| (QREFELT $ 81))) 

(SDEFUN |RDEEFX;mk_pow|
        ((|uu| F) (|ulst| |List| F) (|v| |Vector| (|Integer|)) ($ F))
        (SPROG
         ((|res2| (F)) (|lp| (|List| F)) (#1=#:G1347 NIL) (|ui| NIL) (|i| NIL)
          (#2=#:G1346 NIL) (|res| (F)))
         (SEQ
          (LETT |res|
                (|RDEEFX;mk_pow1| |uu| (SPADCALL |v| 1 (QREFELT $ 118)) $)
                . #3=(|RDEEFX;mk_pow|))
          (LETT |lp|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |i| 2 . #3#) (LETT |ui| NIL . #3#)
                      (LETT #1# |ulst| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ui| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (|RDEEFX;mk_pow1| |ui|
                                (SPADCALL |v| |i| (QREFELT $ 118)) $)
                               #2#)
                              . #3#)))
                      (LETT #1#
                            (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #3#))
                            . #3#)
                      (GO G190) G191 (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |res2|
                (SPADCALL (ELT $ 67) |lp| (|spadConstant| $ 33) (QREFELT $ 78))
                . #3#)
          (EXIT (SPADCALL |res| |res2| (QREFELT $ 67)))))) 

(SDEFUN |RDEEFX;quadratic_log_erf_integrate|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| F)) (|a1| F) (|g| F)
         (|ansp| F)
         (|derivation| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F)) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|as| (|Vector| F)) (|vc| #1=(|Vector| F)) (#2=#:G1472 NIL)
          (|ci| NIL) (#3=#:G1471 NIL)
          (|cndl|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|rr| (|Integer|)) (|ii| (|Integer|)) (#4=#:G1470 NIL)
          (|cil| (|List| (|List| F)))
          (|cis| (|Union| (|List| (|List| F)) "failed")) (|u1| (F)) (|u0| (F))
          (|uu| (F)) (|solb1| (|Vector| (|Integer|))) (|f| (F))
          (|scoeffs| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|derivation3|
           (|Mapping| (|Fraction| (|SparseUnivariatePolynomial| F))
                      (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|cands|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|nn| (|SparseUnivariatePolynomial| F)) (|ri| (|Integer|))
          (|rcu| (|Union| (|Integer|) #5="failed")) (#6=#:G1457 NIL)
          (|sol0| (|Vector| (|Integer|))) (#7=#:G1424 NIL)
          (|sol_rec|
           (|Record|
            (|:| |particular| (|Union| (|Vector| (|Integer|)) #8="failed"))
            (|:| |basis| (|List| (|Vector| (|Integer|))))))
          (|v2| #9=(|Vector| (|Integer|))) (|m2| #10=(|Matrix| (|Integer|)))
          (|#G275| (|Record| (|:| |mat| #10#) (|:| |vec| #9#))) (|v1| #1#)
          (|m1| (|Matrix| F)) (#11=#:G1469 NIL) (|v| NIL) (#12=#:G1468 NIL)
          (|lv| (|List| F)) (|c2| (F)) (|c1| (F)) (|c0| (F)) (|r4| (F))
          (|ulst1| (|List| F)) (|vlst1| (|List| F)) (#13=#:G1466 NIL)
          (#14=#:G1467 NIL) (|u| NIL) (|phi| (F)) (|piv| (F)) (|kf| (F))
          (|unG| (R)) (G (F))
          (|G_num| #15=(|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|G_den| #15#)
          (|fl2| (|List| #16=(|SparseMultivariatePolynomial| R (|Kernel| F))))
          (#17=#:G1370 NIL) (#18=#:G1465 NIL) (|fac| NIL) (#19=#:G1464 NIL)
          (|fl1| (|List| #16#)) (#20=#:G1368 NIL) (#21=#:G1463 NIL)
          (#22=#:G1462 NIL)
          (|uv0|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu0|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|l_pifp| (F)) (|pif| (F))
          (|pip| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#23=#:G1461 NIL) (#24=#:G1460 NIL) (#25=#:G1459 NIL)
          (#26=#:G1458 NIL)
          (|f_numr|
           #27=(|Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|f_denr| #27#) (|t| (F)) (|s| (F)) (|r| (F)) (|r1| (F))
          (|spec1p| (|SparseUnivariatePolynomial| F))
          (|res2|
           (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (|spec1u| (|Union| (|SparseUnivariatePolynomial| F) #5#)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |spec1u| (SPADCALL |rr1| (QREFELT $ 241))
                  . #28=(|RDEEFX;quadratic_log_erf_integrate|))
            (EXIT
             (COND ((QEQCAR |spec1u| 1) (|error| "impossible 10"))
                   (#29='T
                    (SEQ (LETT |spec1p| (QCDR |spec1u|) . #28#)
                         (LETT |res2|
                               (SPADCALL |nfp| |spec1p| |derivation|
                                         (QREFELT $ 245))
                               . #28#)
                         (LETT |a1|
                               (SPADCALL |a1|
                                         (SPADCALL
                                          (SPADCALL (QCAR |res2|)
                                                    (QREFELT $ 49))
                                          |k| (QREFELT $ 62))
                                         (QREFELT $ 75))
                               . #28#)
                         (LETT |spec1p| (QCDR |res2|) . #28#)
                         (EXIT
                          (COND
                           ((SPADCALL |spec1p| (|spadConstant| $ 104)
                                      (QREFELT $ 113))
                            (PROGN
                             (LETT #6# (VECTOR |a1| |g| |ansp| 'T) . #28#)
                             (GO #30=#:G1456)))
                           ((>= (SPADCALL |spec1p| (QREFELT $ 41))
                                (SPADCALL |nfp| (QREFELT $ 41)))
                            (|error| "impossible 8"))
                           (#29#
                            (SEQ
                             (LETT |r1|
                                   (SPADCALL |g|
                                             (SPADCALL
                                              (SPADCALL |spec1p|
                                                        (QREFELT $ 49))
                                              |k| (QREFELT $ 62))
                                             (QREFELT $ 79))
                                   . #28#)
                             (LETT |r| (SPADCALL |nf| (QREFELT $ 105)) . #28#)
                             (LETT |s| (SPADCALL |nf| 1 (QREFELT $ 43)) . #28#)
                             (LETT |t| (SPADCALL |nf| 0 (QREFELT $ 43)) . #28#)
                             (LETT |f_denr|
                                   (SPADCALL (SPADCALL |r| (QREFELT $ 250))
                                             (QREFELT $ 253))
                                   . #28#)
                             (LETT |f_numr|
                                   (SPADCALL (SPADCALL |r| (QREFELT $ 179))
                                             (QREFELT $ 253))
                                   . #28#)
                             (LETT |fl1|
                                   (PROGN
                                    (LETT #26# NIL . #28#)
                                    (SEQ (LETT |fac| NIL . #28#)
                                         (LETT #25#
                                               (SPADCALL |f_denr|
                                                         (QREFELT $ 256))
                                               . #28#)
                                         G190
                                         (COND
                                          ((OR (ATOM #25#)
                                               (PROGN
                                                (LETT |fac| (CAR #25#) . #28#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((ODDP (QCDR |fac|))
                                             (LETT #26#
                                                   (CONS (QCAR |fac|) #26#)
                                                   . #28#)))))
                                         (LETT #25# (CDR #25#) . #28#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #26#))))
                                   . #28#)
                             (LETT |fl2|
                                   (PROGN
                                    (LETT #24# NIL . #28#)
                                    (SEQ (LETT |fac| NIL . #28#)
                                         (LETT #23#
                                               (SPADCALL |f_numr|
                                                         (QREFELT $ 256))
                                               . #28#)
                                         G190
                                         (COND
                                          ((OR (ATOM #23#)
                                               (PROGN
                                                (LETT |fac| (CAR #23#) . #28#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((ODDP (QCDR |fac|))
                                             (LETT #24#
                                                   (CONS (QCAR |fac|) #24#)
                                                   . #28#)))))
                                         (LETT #23# (CDR #23#) . #28#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #24#))))
                                   . #28#)
                             (LETT |pip|
                                   (SPADCALL
                                    (SPADCALL (ELT $ 257) |fl1|
                                              (|spadConstant| $ 136)
                                              (QREFELT $ 260))
                                    (SPADCALL (ELT $ 257) |fl2|
                                              (|spadConstant| $ 136)
                                              (QREFELT $ 260))
                                    (QREFELT $ 257))
                                   . #28#)
                             (LETT |pif| (SPADCALL |pip| (QREFELT $ 180))
                                   . #28#)
                             (LETT |l_pifp|
                                   (SPADCALL
                                    (SPADCALL |pif| |x| (QREFELT $ 64)) |pif|
                                    (QREFELT $ 69))
                                   . #28#)
                             (LETT |uvu0|
                                   (|RDEEFX;get_uv| |l_pifp| |vlst| |ulst| |k|
                                    |x| $)
                                   . #28#)
                             (EXIT
                              (COND
                               ((QEQCAR |uvu0| 1)
                                (VECTOR |a1| |r1| |ansp| NIL))
                               (#29#
                                (SEQ (LETT |uv0| (QCDR |uvu0|) . #28#)
                                     (LETT |fl1|
                                           (PROGN
                                            (LETT #22# NIL . #28#)
                                            (SEQ (LETT |fac| NIL . #28#)
                                                 (LETT #21#
                                                       (SPADCALL |f_denr|
                                                                 (QREFELT $
                                                                          256))
                                                       . #28#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #21#)
                                                       (PROGN
                                                        (LETT |fac| (CAR #21#)
                                                              . #28#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #22#
                                                         (CONS
                                                          (SPADCALL
                                                           (QCAR |fac|)
                                                           (PROG1
                                                               (LETT #20#
                                                                     (QUOTIENT2
                                                                      (-
                                                                       (QCDR
                                                                        |fac|)
                                                                       1)
                                                                      2)
                                                                     . #28#)
                                                             (|check_subtype2|
                                                              (>= #20# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #20#))
                                                           (QREFELT $ 262))
                                                          #22#)
                                                         . #28#)))
                                                 (LETT #21# (CDR #21#) . #28#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #22#))))
                                           . #28#)
                                     (LETT |fl2|
                                           (PROGN
                                            (LETT #19# NIL . #28#)
                                            (SEQ (LETT |fac| NIL . #28#)
                                                 (LETT #18#
                                                       (SPADCALL |f_numr|
                                                                 (QREFELT $
                                                                          256))
                                                       . #28#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #18#)
                                                       (PROGN
                                                        (LETT |fac| (CAR #18#)
                                                              . #28#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #19#
                                                         (CONS
                                                          (SPADCALL
                                                           (QCAR |fac|)
                                                           (PROG1
                                                               (LETT #17#
                                                                     (QUOTIENT2
                                                                      (+
                                                                       (QCDR
                                                                        |fac|)
                                                                       1)
                                                                      2)
                                                                     . #28#)
                                                             (|check_subtype2|
                                                              (>= #17# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #17#))
                                                           (QREFELT $ 262))
                                                          #19#)
                                                         . #28#)))
                                                 (LETT #18# (CDR #18#) . #28#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #19#))))
                                           . #28#)
                                     (LETT |G_den|
                                           (SPADCALL (ELT $ 257) |fl1|
                                                     (|spadConstant| $ 136)
                                                     (QREFELT $ 260))
                                           . #28#)
                                     (LETT |G_num|
                                           (SPADCALL (ELT $ 257) |fl2|
                                                     (|spadConstant| $ 136)
                                                     (QREFELT $ 260))
                                           . #28#)
                                     (LETT G
                                           (SPADCALL
                                            (SPADCALL |G_den| (QREFELT $ 180))
                                            (SPADCALL |G_num| (QREFELT $ 180))
                                            (QREFELT $ 69))
                                           . #28#)
                                     (LETT |unG|
                                           (SPADCALL
                                            (SPADCALL |f_numr| (QREFELT $ 263))
                                            (QREFELT $ 264))
                                           . #28#)
                                     (LETT |kf| (SPADCALL |k| (QREFELT $ 63))
                                           . #28#)
                                     (LETT |phi|
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |r| |x| (QREFELT $ 64))
                                              (|spadConstant| $ 45)
                                              (QREFELT $ 132))
                                             (SEQ
                                              (LETT |piv|
                                                    (SPADCALL
                                                     (SPADCALL G |x|
                                                               (QREFELT $ 64))
                                                     (SPADCALL
                                                      (SPADCALL G |l_pifp|
                                                                (QREFELT $ 67))
                                                      (SPADCALL 2
                                                                (QREFELT $ 76))
                                                      (QREFELT $ 69))
                                                     (QREFELT $ 79))
                                                    . #28#)
                                              (EXIT
                                               (SPADCALL
                                                (SPADCALL |spec1p| 1
                                                          (QREFELT $ 43))
                                                |piv| (QREFELT $ 69)))))
                                            (#29#
                                             (SEQ
                                              (LETT |piv|
                                                    (SPADCALL
                                                     (SPADCALL G
                                                               (SPADCALL |kf|
                                                                         |x|
                                                                         (QREFELT
                                                                          $
                                                                          64))
                                                               (QREFELT $ 67))
                                                     (SPADCALL
                                                      (SPADCALL |unG|
                                                                (SPADCALL |s|
                                                                          |x|
                                                                          (QREFELT
                                                                           $
                                                                           64))
                                                                (QREFELT $
                                                                         265))
                                                      (SPADCALL
                                                       (SPADCALL 2
                                                                 (QREFELT $
                                                                          76))
                                                       G (QREFELT $ 67))
                                                      (QREFELT $ 69))
                                                     (QREFELT $ 75))
                                                    . #28#)
                                              (EXIT
                                               (SPADCALL
                                                (SPADCALL |spec1p| 0
                                                          (QREFELT $ 43))
                                                |piv| (QREFELT $ 69))))))
                                           . #28#)
                                     (LETT |vlst1| NIL . #28#)
                                     (LETT |ulst1| NIL . #28#)
                                     (SEQ (LETT |u| NIL . #28#)
                                          (LETT #14# |ulst| . #28#)
                                          (LETT |v| NIL . #28#)
                                          (LETT #13# |vlst| . #28#) G190
                                          (COND
                                           ((OR (ATOM #13#)
                                                (PROGN
                                                 (LETT |v| (CAR #13#) . #28#)
                                                 NIL)
                                                (ATOM #14#)
                                                (PROGN
                                                 (LETT |u| (CAR #14#) . #28#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL |v| |kf|
                                                        (QREFELT $ 132))
                                              (SEQ
                                               (LETT |vlst1| (CONS |v| |vlst1|)
                                                     . #28#)
                                               (EXIT
                                                (LETT |ulst1|
                                                      (CONS |u| |ulst1|)
                                                      . #28#)))))))
                                          (LETT #13#
                                                (PROG1 (CDR #13#)
                                                  (LETT #14# (CDR #14#)
                                                        . #28#))
                                                . #28#)
                                          (GO G190) G191 (EXIT NIL))
                                     (LETT |r4|
                                           (SPADCALL
                                            (SPADCALL 4 (QREFELT $ 76)) |r|
                                            (QREFELT $ 67))
                                           . #28#)
                                     (LETT |c0|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |s| 2 (QREFELT $ 266))
                                             |r4| (QREFELT $ 69))
                                            |t| (QREFELT $ 79))
                                           . #28#)
                                     (LETT |c1|
                                           (SPADCALL |s| |r4| (QREFELT $ 69))
                                           . #28#)
                                     (LETT |c2|
                                           (SPADCALL (|spadConstant| $ 33) |r4|
                                                     (QREFELT $ 69))
                                           . #28#)
                                     (LETT |lv|
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |r| |x| (QREFELT $ 64))
                                              (|spadConstant| $ 45)
                                              (QREFELT $ 132))
                                             (SPADCALL
                                              (LIST
                                               (SPADCALL |c1| (QREFELT $ 50))
                                               (SPADCALL |c2| (QREFELT $ 50)))
                                              |vlst1| (QREFELT $ 267)))
                                            (#29#
                                             (CONS
                                              (SPADCALL |c1| (QREFELT $ 50))
                                              |vlst1|)))
                                           . #28#)
                                     (LETT |m1|
                                           (SPADCALL
                                            (LIST
                                             (PROGN
                                              (LETT #12# NIL . #28#)
                                              (SEQ (LETT |v| NIL . #28#)
                                                   (LETT #11# |lv| . #28#) G190
                                                   (COND
                                                    ((OR (ATOM #11#)
                                                         (PROGN
                                                          (LETT |v| (CAR #11#)
                                                                . #28#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #12#
                                                           (CONS
                                                            (SPADCALL |v| |x|
                                                                      (QREFELT
                                                                       $ 64))
                                                            #12#)
                                                           . #28#)))
                                                   (LETT #11# (CDR #11#)
                                                         . #28#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #12#)))))
                                            (QREFELT $ 270))
                                           . #28#)
                                     (LETT |v1|
                                           (SPADCALL
                                            (LIST
                                             (SPADCALL |c0| |x|
                                                       (QREFELT $ 64)))
                                            (QREFELT $ 83))
                                           . #28#)
                                     (PROGN
                                      (LETT |#G275|
                                            (SPADCALL |m1| |v1|
                                                      (QREFELT $ 274))
                                            . #28#)
                                      (LETT |m2| (QCAR |#G275|) . #28#)
                                      (LETT |v2| (QCDR |#G275|) . #28#)
                                      |#G275|)
                                     (LETT |sol_rec|
                                           (SPADCALL |m2| |v2| (QREFELT $ 279))
                                           . #28#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR (QCAR |sol_rec|) 1)
                                        (VECTOR |a1| |r1| |ansp| NIL))
                                       (#29#
                                        (SEQ
                                         (LETT |sol0|
                                               (PROG2
                                                   (LETT #7# (QCAR |sol_rec|)
                                                         . #28#)
                                                   (QCDR #7#)
                                                 (|check_union2| (QEQCAR #7# 0)
                                                                 (|Vector|
                                                                  (|Integer|))
                                                                 (|Union|
                                                                  (|Vector|
                                                                   (|Integer|))
                                                                  #8#)
                                                                 #7#))
                                               . #28#)
                                         (EXIT
                                          (COND
                                           ((NULL (QCDR |sol_rec|))
                                            (SEQ
                                             (COND
                                              ((SPADCALL
                                                (SPADCALL |r| |x|
                                                          (QREFELT $ 64))
                                                (|spadConstant| $ 45)
                                                (QREFELT $ 132))
                                               (COND
                                                ((SPADCALL
                                                  (EXPT
                                                   (SPADCALL |sol0| 1
                                                             (QREFELT $ 118))
                                                   2)
                                                  (SPADCALL |sol0| 2
                                                            (QREFELT $ 118))
                                                  (QREFELT $ 91))
                                                 (PROGN
                                                  (LETT #6#
                                                        (VECTOR |a1| |r1|
                                                                |ansp| NIL)
                                                        . #28#)
                                                  (GO #30#))))))
                                             (LETT |rcu|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |sol0| 1
                                                                (QREFELT $
                                                                         118))
                                                      (QREFELT $ 141))
                                                     (SPADCALL 2
                                                               (QREFELT $ 141))
                                                     (QREFELT $ 280))
                                                    (QREFELT $ 192))
                                                   . #28#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |rcu| 1)
                                                (VECTOR |a1| |r1| |ansp| NIL))
                                               (#29#
                                                (SEQ
                                                 (LETT |ri| (QCDR |rcu|)
                                                       . #28#)
                                                 (LETT |nn|
                                                       (SPADCALL |nf|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |ri|
                                                                   (QREFELT $
                                                                            76))
                                                                  1
                                                                  (QREFELT $
                                                                           46))
                                                                 (QREFELT $
                                                                          51))
                                                       . #28#)
                                                 (LETT |cands|
                                                       (|RDEEFX;gammas1| |nn|
                                                        (QCDR |rcu|)
                                                        (|spadConstant| $ 110)
                                                        (|spadConstant| $ 110)
                                                        0 1 |vlst| |ulst| |k|
                                                        |x| NIL $)
                                                       . #28#)
                                                 (LETT |derivation3|
                                                       (CONS
                                                        #'|RDEEFX;quadratic_log_erf_integrate!0|
                                                        (VECTOR |derivation|
                                                                $))
                                                       . #28#)
                                                 (LETT |scoeffs|
                                                       (|RDEEFX;get_scoeffs|
                                                        |cands|
                                                        (|spadConstant| $ 110)
                                                        |k| |derivation3| $)
                                                       . #28#)
                                                 (LETT |rr1|
                                                       (SPADCALL |spec1p|
                                                                 (QREFELT $
                                                                          49))
                                                       . #28#)
                                                 (LETT |f|
                                                       (SPADCALL
                                                        (SPADCALL |nf|
                                                                  (QREFELT $
                                                                           49))
                                                        |k| (QREFELT $ 62))
                                                       . #28#)
                                                 (EXIT
                                                  (|RDEEFX;special_integrate1|
                                                   |nfp| |f| |k| |lk| |x| |rr1|
                                                   |a1| |r1| |g| |ansp|
                                                   |scoeffs| |cands| 0
                                                   |derivation| $))))))))
                                           (#29#
                                            (SEQ
                                             (LETT |solb1|
                                                   (|SPADfirst|
                                                    (QCDR |sol_rec|))
                                                   . #28#)
                                             (EXIT
                                              (COND
                                               ((SPADCALL
                                                 (SPADCALL |r| |x|
                                                           (QREFELT $ 64))
                                                 (|spadConstant| $ 45)
                                                 (QREFELT $ 80))
                                                (COND
                                                 ((SPADCALL
                                                   (LENGTH (QCDR |sol_rec|)) 1
                                                   (QREFELT $ 22))
                                                  (|error| "impossible 11"))
                                                 (#29#
                                                  (SEQ
                                                   (LETT |uu|
                                                         (|SPADfirst|
                                                          (SPADCALL |k|
                                                                    (QREFELT $
                                                                             28)))
                                                         . #28#)
                                                   (LETT |u0|
                                                         (|RDEEFX;mk_pow| |uu|
                                                          |ulst1| |sol0| $)
                                                         . #28#)
                                                   (LETT |u1|
                                                         (|RDEEFX;mk_pow| |uu|
                                                          |ulst1| |solb1| $)
                                                         . #28#)
                                                   (LETT |cis|
                                                         (SPADCALL
                                                          (SPADCALL |phi| |u0|
                                                                    (QREFELT $
                                                                             69))
                                                          |u1| |x|
                                                          (QREFELT $ 283))
                                                         . #28#)
                                                   (EXIT
                                                    (COND
                                                     ((QEQCAR |cis| 1)
                                                      (VECTOR |a1| |r1| |ansp|
                                                              NIL))
                                                     (#29#
                                                      (SEQ
                                                       (LETT |cil| (QCDR |cis|)
                                                             . #28#)
                                                       (LETT |cndl| NIL . #28#)
                                                       (SEQ
                                                        (LETT |ci| NIL . #28#)
                                                        (LETT #4# |cil| . #28#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #4#)
                                                              (PROGN
                                                               (LETT |ci|
                                                                     (CAR #4#)
                                                                     . #28#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (LETT |ii|
                                                               (SPADCALL
                                                                (SPADCALL |ci|
                                                                          (QREFELT
                                                                           $
                                                                           284))
                                                                (QREFELT $ 31))
                                                               . #28#)
                                                         (LETT |rr|
                                                               (+
                                                                (SPADCALL
                                                                 |sol0| 1
                                                                 (QREFELT $
                                                                          118))
                                                                (* |ii|
                                                                   (SPADCALL
                                                                    |solb1| 1
                                                                    (QREFELT $
                                                                             118))))
                                                               . #28#)
                                                         (EXIT
                                                          (LETT |cndl|
                                                                (|RDEEFX;gammas1|
                                                                 (SPADCALL |nf|
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             |rr|
                                                                             (QREFELT
                                                                              $
                                                                              76))
                                                                            1
                                                                            (QREFELT
                                                                             $
                                                                             46))
                                                                           (QREFELT
                                                                            $
                                                                            51))
                                                                 |rr|
                                                                 (|spadConstant|
                                                                  $ 110)
                                                                 (|spadConstant|
                                                                  $ 110)
                                                                 0 0 |vlst|
                                                                 |ulst| |k| |x|
                                                                 |cndl| $)
                                                                . #28#)))
                                                        (LETT #4# (CDR #4#)
                                                              . #28#)
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                       (LETT |cndl|
                                                             (NREVERSE |cndl|)
                                                             . #28#)
                                                       (LETT |vc|
                                                             (SPADCALL
                                                              (PROGN
                                                               (LETT #3# NIL
                                                                     . #28#)
                                                               (SEQ
                                                                (LETT |ci| NIL
                                                                      . #28#)
                                                                (LETT #2# |cil|
                                                                      . #28#)
                                                                G190
                                                                (COND
                                                                 ((OR
                                                                   (ATOM #2#)
                                                                   (PROGN
                                                                    (LETT |ci|
                                                                          (CAR
                                                                           #2#)
                                                                          . #28#)
                                                                    NIL))
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (EXIT
                                                                  (LETT #3#
                                                                        (CONS
                                                                         (|SPADfirst|
                                                                          |ci|)
                                                                         #3#)
                                                                        . #28#)))
                                                                (LETT #2#
                                                                      (CDR #2#)
                                                                      . #28#)
                                                                (GO G190) G191
                                                                (EXIT
                                                                 (NREVERSE
                                                                  #3#))))
                                                              (QREFELT $ 83))
                                                             . #28#)
                                                       (LETT |as|
                                                             (MAKEARR1
                                                              (LENGTH |cil|)
                                                              (|spadConstant| $
                                                                              45))
                                                             . #28#)
                                                       (EXIT
                                                        (|RDEEFX;finish_special_integrate2|
                                                         |r1| |vc| |a1| |as|
                                                         |cndl|
                                                         (|spadConstant| $ 110)
                                                         0 |k| $))))))))))
                                               ((OR
                                                 (EQL (LENGTH (QCDR |sol_rec|))
                                                      1)
                                                 (NULL
                                                  (SPADCALL
                                                   (LENGTH (QCDR |sol_rec|)) 2
                                                   (QREFELT $ 22))))
                                                (VECTOR |a1| |r1| |ansp| NIL))
                                               ('T
                                                (|error|
                                                 "impossible 12"))))))))))))))))))))))))))
          #30# (EXIT #6#)))) 

(SDEFUN |RDEEFX;quadratic_log_erf_integrate!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |derivation|)
          (LETT $ (QREFELT $$ 1) . #1=(|RDEEFX;quadratic_log_erf_integrate|))
          (LETT |derivation| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT $ 39)) |derivation|)
                        (SPADCALL |z1| (QREFELT $ 40)) (QREFELT $ 99))
              (SPADCALL (SPADCALL |z1| (QREFELT $ 39))
                        (SPADCALL (SPADCALL |z1| (QREFELT $ 40)) |derivation|)
                        (QREFELT $ 99))
              (QREFELT $ 48))
             (SPADCALL (SPADCALL |z1| (QREFELT $ 40))
                       (SPADCALL |z1| (QREFELT $ 40)) (QREFELT $ 99))
             (QREFELT $ 198)))))) 

(SDEFUN |RDEEFX;decompose1|
        ((|num| |SparseUnivariatePolynomial| F)
         (|den| |SparseUnivariatePolynomial| F)
         (|eidens| |List| (|SparseUnivariatePolynomial| F))
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| F)))
          (|f1| (|SparseUnivariatePolynomial| F)) (#1=#:G1476 NIL))
         (SEQ
          (LETT |f1|
                (PROG2
                    (LETT #1#
                          (SPADCALL |den|
                                    (SPADCALL (ELT $ 99) |eidens|
                                              (QREFELT $ 285))
                                    (QREFELT $ 109))
                          . #2=(|RDEEFX;decompose1|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   "failed")
                                  #1#))
                . #2#)
          (COND
           ((SPADCALL |f1| (|spadConstant| $ 110) (QREFELT $ 111))
            (LETT |eidens| (CONS |f1| |eidens|) . #2#)))
          (LETT |res| (SPADCALL |num| |eidens| (QREFELT $ 287)) . #2#)
          (EXIT
           (COND
            ((SPADCALL |f1| (|spadConstant| $ 110) (QREFELT $ 111))
             (CDR |res|))
            ('T |res|)))))) 

(SDEFUN |RDEEFX;get_trace|
        ((|fu| |Fraction| (|SparseUnivariatePolynomial| F)) (|k| |Kernel| F)
         (|rf1k| |Kernel| F) (|cfac| |SparseUnivariatePolynomial| F)
         ($ |Fraction| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|resd| (F)) (|fa| (|SparseUnivariatePolynomial| F)) (|f| (F))
          (|Sae|
           (|Join| (|MonogenicAlgebra| F (|SparseUnivariatePolynomial| F))
                   (CATEGORY |package|
                    (IF (|has| F (|Field|))
                        (IF (|has| F (|PolynomialFactorizationExplicit|))
                            (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                            |noBranch|)
                        |noBranch|)))))
         (SEQ
          (LETT |Sae|
                (|SimpleAlgebraicExtension| (QREFELT $ 7)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))
                                            |cfac|)
                . #1=(|RDEEFX;get_trace|))
          (LETT |f| (SPADCALL |fu| |k| (QREFELT $ 62)) . #1#)
          (LETT |fa| (SPADCALL |f| |rf1k| |cfac| (QREFELT $ 288)) . #1#)
          (LETT |resd|
                (SPADCALL
                 (SPADCALL |fa|
                           (|compiledLookupCheck| '|reduce|
                                                  (LIST '$
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (|devaluate|
                                                          (ELT $ 7))))
                                                  |Sae|))
                 (|compiledLookupCheck| '|trace|
                                        (LIST (|devaluate| (ELT $ 7)) '$)
                                        |Sae|))
                . #1#)
          (EXIT (SPADCALL |resd| |k| (QREFELT $ 36)))))) 

(SDEFUN |RDEEFX;solve_factor1|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|x| |Symbol|) (|einum| |SparseUnivariatePolynomial| F)
         (|bpol| |SparseUnivariatePolynomial| F)
         (|er| |Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
          (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
          (|:| |alg_part| (|SparseUnivariatePolynomial| F)) (|:| |u_part| F)
          (|:| |exponent| (|Integer|)) (|:| |shift_part| F))
         ($ |Record| (|:| |primpart| F)
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |polypart| (|SparseUnivariatePolynomial| F))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|poly_cor| (|SparseUnivariatePolynomial| F))
          (|poly_cor_rf| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|sp_cor| #1=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lp_cor| #1#) (|ansp| (F)) (#2=#:G1516 NIL) (|zz| NIL)
          (|zzl| (|List| F)) (|ansp1| (F)) (|c| (F))
          (|cu1| (|Union| F "failed")) (|cp| (|SparseUnivariatePolynomial| F))
          (|cu| (|Union| (|SparseUnivariatePolynomial| F) #3="failed"))
          (|ppu|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|ddf| (|SparseUnivariatePolynomial| F))
          (|lnum1| #4=(|SparseUnivariatePolynomial| F))
          (|reml| (|List| (|SparseUnivariatePolynomial| F))) (|lnum0| #4#)
          (|coeff1_rs| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|auxl| (|List| (|SparseUnivariatePolynomial| F)))
          (|denf1| (|SparseUnivariatePolynomial| F)) (#5=#:G1491 NIL)
          (|spec_den| (|SparseUnivariatePolynomial| F))
          (|min_deg| (|NonNegativeInteger|))
          (|dvr|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| #4#)))
          (|coeff1_r| #6=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|coeff1| (|SparseUnivariatePolynomial| F))
          (|numfp1| #7=(|SparseUnivariatePolynomial| F)) (|ei_arg| #6#)
          (|eiarg_num| #7#) (|rf1k| (|Kernel| F)) (|rfc| (F)) (|vshift| (F))
          (|u_exp| (|Integer|)) (|u0| (F))
          (|cfac| (|SparseUnivariatePolynomial| F)) (|v0| (F))
          (|r0| (|Integer|)) (|eiden| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |eiden| (QVELT |er| 0) . #8=(|RDEEFX;solve_factor1|))
              (LETT |r0| (QVELT |er| 1) . #8#) (LETT |v0| (QVELT |er| 2) . #8#)
              (LETT |cfac| (QVELT |er| 3) . #8#)
              (LETT |u0| (QVELT |er| 4) . #8#)
              (LETT |u_exp| (QVELT |er| 5) . #8#)
              (LETT |vshift| (QVELT |er| 6) . #8#)
              (LETT |rfc| (|spadConstant| $ 45) . #8#)
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 217)) . #8#)
                     (EXIT
                      (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 289)) . #8#)))))
              (LETT |eiarg_num|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |r0| (QREFELT $ 76)) 1
                                           (QREFELT $ 46))
                                 (SPADCALL |v0| (QREFELT $ 47)) (QREFELT $ 51))
                                (SPADCALL |rfc| (QREFELT $ 47)) (QREFELT $ 51))
                               |denf| (QREFELT $ 99))
                              (QREFELT $ 51))
                    . #8#)
              (LETT |ei_arg|
                    (SPADCALL (SPADCALL |eiarg_num| (QREFELT $ 49))
                              (SPADCALL |denf| (QREFELT $ 49)) (QREFELT $ 52))
                    . #8#)
              (LETT |numfp1|
                    (SPADCALL |nfp|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |v0|
                                          (SPADCALL
                                           (SPADCALL |r0| (QREFELT $ 76))
                                           (SPADCALL |k| (QREFELT $ 63))
                                           (QREFELT $ 67))
                                          (QREFELT $ 75))
                                |x| (QREFELT $ 64))
                               |denfp| (QREFELT $ 137))
                              (QREFELT $ 51))
                    . #8#)
              (LETT |coeff1|
                    (SPADCALL (SPADCALL |numfp1| |denf| (QREFELT $ 99)) |u0|
                              (QREFELT $ 208))
                    . #8#)
              (LETT |coeff1_r|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 33) 1 (QREFELT $ 46))
                        (QREFELT $ 49))
                       |u_exp| (QREFELT $ 290))
                      (SPADCALL |coeff1| (QREFELT $ 49)) (QREFELT $ 291))
                     (SPADCALL |eiarg_num| (QREFELT $ 49)) (QREFELT $ 52))
                    . #8#)
              (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT $ 40)) . #8#)
              (LETT |coeff1_rs| (|spadConstant| $ 199) . #8#)
              (LETT |dvr|
                    (SPADCALL (SPADCALL |coeff1_r| (QREFELT $ 39)) |denf1|
                              (QREFELT $ 293))
                    . #8#)
              (LETT |lnum1| (QCDR |dvr|) . #8#)
              (COND
               ((SPADCALL |k| '|exp| (QREFELT $ 23))
                (SEQ (LETT |min_deg| (SPADCALL |denf1| (QREFELT $ 233)) . #8#)
                     (EXIT
                      (COND
                       ((SPADCALL |min_deg| 0 (QREFELT $ 22))
                        (SEQ
                         (LETT |spec_den|
                               (SPADCALL (|spadConstant| $ 33) |min_deg|
                                         (QREFELT $ 46))
                               . #8#)
                         (LETT |denf1|
                               (PROG2
                                   (LETT #5#
                                         (SPADCALL |denf1| |spec_den|
                                                   (QREFELT $ 109))
                                         . #8#)
                                   (QCDR #5#)
                                 (|check_union2| (QEQCAR #5# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 7))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))
                                                  #3#)
                                                 #5#))
                               . #8#)
                         (LETT |auxl|
                               (SPADCALL |lnum1| (LIST |denf1| |spec_den|)
                                         (QREFELT $ 287))
                               . #8#)
                         (LETT |lnum1| (SPADCALL |auxl| 1 (QREFELT $ 294))
                               . #8#)
                         (EXIT
                          (LETT |coeff1_rs|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |auxl| 2 (QREFELT $ 294))
                                           (QREFELT $ 49))
                                 (SPADCALL |spec_den| (QREFELT $ 49))
                                 (QREFELT $ 52))
                                . #8#)))))))))
              (LETT |lnum0| |lnum1| . #8#)
              (COND
               ((SPADCALL |bpol| |eiden| (QREFELT $ 111))
                (SEQ
                 (LETT |reml|
                       (|RDEEFX;decompose1| |lnum1| |denf1| (LIST |bpol|) $)
                       . #8#)
                 (EXIT (LETT |lnum1| (|SPADfirst| |reml|) . #8#)))))
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                (SEQ
                 (LETT |einum| (SPADCALL |einum| |denf1| (QREFELT $ 191))
                       . #8#)
                 (LETT |ddf|
                       (SPADCALL (SPADCALL |eiden| (QREFELT $ 193)) |denf1|
                                 (QREFELT $ 191))
                       . #8#)
                 (LETT |ppu| (SPADCALL |denf1| |ddf| |einum| (QREFELT $ 297))
                       . #8#)
                 (EXIT
                  (COND ((QEQCAR |ppu| 1) (|error| "impossible 4"))
                        (#9='T
                         (SEQ (LETT |einum| (QCDR (QCDR |ppu|)) . #8#)
                              (EXIT
                               (LETT |einum|
                                     (SPADCALL
                                      (SPADCALL |einum|
                                                (SPADCALL |denf1|
                                                          (QREFELT $ 193))
                                                (QREFELT $ 99))
                                      |denf1| (QREFELT $ 191))
                                     . #8#)))))))))
              (LETT |cu| (SPADCALL |einum| |lnum1| (QREFELT $ 109)) . #8#)
              (EXIT
               (COND
                ((QEQCAR |cu| 1)
                 (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 199)
                         (|spadConstant| $ 104) (|spadConstant| $ 199)))
                (#9#
                 (SEQ (LETT |cp| (QCDR |cu|) . #8#)
                      (LETT |cu1| (SPADCALL |cp| (QREFELT $ 298)) . #8#)
                      (EXIT
                       (COND
                        ((QEQCAR |cu1| 1)
                         (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 199)
                                 (|spadConstant| $ 104)
                                 (|spadConstant| $ 199)))
                        (#9#
                         (SEQ (LETT |c| (QCDR |cu1|) . #8#)
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |c| |x| (QREFELT $ 299))
                                           (|spadConstant| $ 45)
                                           (QREFELT $ 132))
                                 (VECTOR (|spadConstant| $ 45)
                                         (|spadConstant| $ 199)
                                         (|spadConstant| $ 104)
                                         (|spadConstant| $ 199)))
                                (#9#
                                 (SEQ
                                  (LETT |ansp1|
                                        (SPADCALL
                                         (SPADCALL |c|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |vshift|
                                                               (QREFELT $ 50))
                                                     |rfc| (QREFELT $ 79))
                                                    (QREFELT $ 300))
                                                   (QREFELT $ 67))
                                         (SPADCALL
                                          (SPADCALL |ei_arg| |k|
                                                    (QREFELT $ 62))
                                          (QREFELT $ 301))
                                         (QREFELT $ 67))
                                        . #8#)
                                  (LETT |zzl|
                                        (COND
                                         ((SPADCALL |cfac|
                                                    (|spadConstant| $ 104)
                                                    (QREFELT $ 113))
                                          (LIST (|spadConstant| $ 45)))
                                         (#9#
                                          (SPADCALL |cfac| (QREFELT $ 302))))
                                        . #8#)
                                  (LETT |ansp| (|spadConstant| $ 45) . #8#)
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| $ 104)
                                              (QREFELT $ 113))
                                    (LETT |ansp| |ansp1| . #8#))
                                   (#9#
                                    (SEQ (LETT |zz| NIL . #8#)
                                         (LETT #2# |zzl| . #8#) G190
                                         (COND
                                          ((OR (ATOM #2#)
                                               (PROGN
                                                (LETT |zz| (CAR #2#) . #8#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |ansp|
                                                 (SPADCALL |ansp|
                                                           (SPADCALL |ansp1|
                                                                     |rf1k|
                                                                     |zz|
                                                                     (QREFELT $
                                                                              70))
                                                           (QREFELT $ 75))
                                                 . #8#)))
                                         (LETT #2# (CDR #2#) . #8#) (GO G190)
                                         G191 (EXIT NIL))))
                                  (LETT |lp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 47))
                                                  (SPADCALL
                                                   (SPADCALL |lnum0|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |denf1|
                                                             (QREFELT $ 49))
                                                   (QREFELT $ 52))
                                                  (QREFELT $ 247))
                                        . #8#)
                                  (LETT |sp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 47))
                                                  |coeff1_rs| (QREFELT $ 247))
                                        . #8#)
                                  (LETT |poly_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 47))
                                                  (QCAR |dvr|) (QREFELT $ 99))
                                        . #8#)
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| $ 104)
                                              (QREFELT $ 111))
                                    (SEQ
                                     (LETT |lp_cor|
                                           (|RDEEFX;get_trace| |lp_cor| |k|
                                            |rf1k| |cfac| $)
                                           . #8#)
                                     (LETT |sp_cor|
                                           (|RDEEFX;get_trace| |sp_cor| |k|
                                            |rf1k| |cfac| $)
                                           . #8#)
                                     (LETT |poly_cor_rf|
                                           (|RDEEFX;get_trace|
                                            (SPADCALL |poly_cor|
                                                      (QREFELT $ 49))
                                            |k| |rf1k| |cfac| $)
                                           . #8#)
                                     (EXIT
                                      (LETT |poly_cor|
                                            (SPADCALL |poly_cor_rf|
                                                      (QREFELT $ 303))
                                            . #8#)))))
                                  (EXIT
                                   (VECTOR |ansp| |lp_cor| |poly_cor|
                                           |sp_cor|))))))))))))))))) 

(SDEFUN |RDEEFX;p_power_in_q|
        ((|q| |SparseUnivariatePolynomial| F)
         (|p| |SparseUnivariatePolynomial| F) ($ |Integer|))
        (SPROG
         ((|nn| (|Integer|)) (#1=#:G1525 NIL)
          (|nqu| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
         (SEQ (LETT |nn| 0 . #2=(|RDEEFX;p_power_in_q|))
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ (LETT |nqu| (SPADCALL |q| |p| (QREFELT $ 109)) . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |nqu| 1)
                             (PROGN
                              (LETT #1# |$NoValue| . #2#)
                              (GO #3=#:G1522)))
                            ('T
                             (SEQ (LETT |q| (QCDR |nqu|) . #2#)
                                  (EXIT (LETT |nn| (+ |nn| 1) . #2#)))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #3# (EXIT #1#))
              (EXIT |nn|)))) 

(SDEFUN |RDEEFX;solve_linear_factor|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|x| |Symbol|) (|einum| |SparseUnivariatePolynomial| F)
         (|er| |Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
          (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
          (|:| |alg_part| (|SparseUnivariatePolynomial| F)) (|:| |u_part| F)
          (|:| |exponent| (|Integer|)) (|:| |shift_part| F)
          (|:| |has_part2?| (|Boolean|)) (|:| |ratpart2| (|Integer|))
          (|:| |v_part2| F) (|:| |u_part2| F) (|:| |shift_part2| F))
         ($ |Record| (|:| |primpart| F)
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |polypart| (|SparseUnivariatePolynomial| F))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|dvr2|
           #1=(|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                        (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (|ansp| (F)) (#2=#:G1556 NIL) (|zz| NIL)
          (|lp_cor| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|eiargp| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|coefi| (F)) (|ansp1| (F)) (|shifti| (F)) (|eiargi| (F))
          (|eiargi_r| #3=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|ci| (F)) (|nn| (|Integer|))
          (|einumi| (|SparseUnivariatePolynomial| F)) (|ki| (|Integer|))
          (|kif| (F)) (#4=#:G1555 NIL) (|ck| NIL) (|zzl| (|List| F))
          (|eiarg_inc| (|SparseUnivariatePolynomial| F))
          (|res1| (|List| (|List| F)))
          (|res1u| (|Union| (|List| (|List| F)) "failed")) (|u1| (F))
          (|einum1| (F)) (|lnum1| (F))
          (|reml| (|List| (|SparseUnivariatePolynomial| F)))
          (|ppu|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|ddf| (|SparseUnivariatePolynomial| F)) (|dvr| #1#)
          (|denf1| (|SparseUnivariatePolynomial| F)) (|coeff1_r| #3#)
          (|coeff1| (|SparseUnivariatePolynomial| F))
          (|numfp1| #5=(|SparseUnivariatePolynomial| F)) (|nn0| (|Integer|))
          (|fac1| (|SparseUnivariatePolynomial| F)) (|eiarg_num| #5#)
          (|lc0| (F)) (|u0| (F)) (|v0| (F)) (|r0| (|Integer|))
          (|rf1k| (|Kernel| F)) (|rfc| (F))
          (|cfac| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |cfac| (QVELT |er| 3) . #6=(|RDEEFX;solve_linear_factor|))
              (LETT |rfc| (|spadConstant| $ 45) . #6#)
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 217)) . #6#)
                     (EXIT
                      (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 289)) . #6#)))))
              (LETT |r0| (QVELT |er| 1) . #6#) (LETT |v0| (QVELT |er| 2) . #6#)
              (LETT |u0| (QVELT |er| 4) . #6#)
              (LETT |lc0|
                    (SPADCALL (SPADCALL |nf| (QREFELT $ 105))
                              (SPADCALL |r0| (QREFELT $ 76)) (QREFELT $ 75))
                    . #6#)
              (COND
               ((OR (SPADCALL (SPADCALL |nf| (QREFELT $ 41)) 1 (QREFELT $ 91))
                    (SPADCALL |denf| (|spadConstant| $ 110) (QREFELT $ 111)))
                (COND
                 ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                  (EXIT (|error| "cfac ~= 0 in nonlinear case"))))))
              (LETT |eiarg_num|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |r0| (QREFELT $ 76)) 1
                                          (QREFELT $ 46))
                                (SPADCALL
                                 (SPADCALL |v0|
                                           (SPADCALL |lc0| |rfc|
                                                     (QREFELT $ 67))
                                           (QREFELT $ 75))
                                 (QREFELT $ 47))
                                (QREFELT $ 51))
                               |denf| (QREFELT $ 99))
                              (QREFELT $ 51))
                    . #6#)
              (LETT |fac1| (QVELT |er| 0) . #6#)
              (LETT |nn0|
                    (COND
                     ((SPADCALL (SPADCALL |eiarg_num| (QREFELT $ 41)) 1
                                (QREFELT $ 22))
                      (|RDEEFX;p_power_in_q| |eiarg_num| |fac1| $))
                     (#7='T 1))
                    . #6#)
              (EXIT
               (COND
                ((EQL |nn0| 0)
                 (|error|
                  "impossible, eiarg_num is not divisible by its factor"))
                (#7#
                 (SEQ
                  (LETT |numfp1|
                        (SPADCALL |nfp|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |v0|
                                              (SPADCALL
                                               (SPADCALL |r0| (QREFELT $ 76))
                                               (SPADCALL |k| (QREFELT $ 63))
                                               (QREFELT $ 67))
                                              (QREFELT $ 75))
                                    |x| (QREFELT $ 64))
                                   |denfp| (QREFELT $ 137))
                                  (QREFELT $ 51))
                        . #6#)
                  (LETT |coeff1|
                        (SPADCALL (SPADCALL |numfp1| |denf| (QREFELT $ 99))
                                  |u0| (QREFELT $ 208))
                        . #6#)
                  (LETT |coeff1_r|
                        (SPADCALL (SPADCALL |coeff1| (QREFELT $ 49))
                                  (SPADCALL |eiarg_num| (QREFELT $ 49))
                                  (QREFELT $ 52))
                        . #6#)
                  (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT $ 40)) . #6#)
                  (LETT |dvr|
                        (SPADCALL (SPADCALL |coeff1_r| (QREFELT $ 39)) |denf1|
                                  (QREFELT $ 293))
                        . #6#)
                  (COND
                   ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                    (SEQ
                     (LETT |einum| (SPADCALL |einum| |denf1| (QREFELT $ 191))
                           . #6#)
                     (LETT |ddf|
                           (SPADCALL (SPADCALL (QVELT |er| 0) (QREFELT $ 193))
                                     |denf1| (QREFELT $ 191))
                           . #6#)
                     (LETT |ppu|
                           (SPADCALL |denf1| |ddf| |einum| (QREFELT $ 297))
                           . #6#)
                     (EXIT
                      (COND ((QEQCAR |ppu| 1) (|error| "impossible 4"))
                            (#7#
                             (SEQ (LETT |einum| (QCDR (QCDR |ppu|)) . #6#)
                                  (EXIT
                                   (LETT |einum|
                                         (SPADCALL
                                          (SPADCALL |einum|
                                                    (SPADCALL |denf1|
                                                              (QREFELT $ 193))
                                                    (QREFELT $ 99))
                                          |denf1| (QREFELT $ 191))
                                         . #6#)))))))))
                  (LETT |lnum1|
                        (COND
                         ((SPADCALL (SPADCALL |fac1| (QREFELT $ 41)) 1
                                    (QREFELT $ 22))
                          (SPADCALL (QCDR |dvr|) (QREFELT $ 204)))
                         (#7#
                          (SEQ
                           (LETT |reml|
                                 (|RDEEFX;decompose1| (QCDR |dvr|) |denf1|
                                  (LIST |fac1|) $)
                                 . #6#)
                           (EXIT
                            (SPADCALL (|SPADfirst| |reml|) (QREFELT $ 204))))))
                        . #6#)
                  (LETT |einum1| (SPADCALL |einum| (QREFELT $ 204)) . #6#)
                  (LETT |u1| (QVELT |er| 10) . #6#)
                  (LETT |res1u|
                        (SPADCALL (SPADCALL |einum1| |lnum1| (QREFELT $ 69))
                                  |u1| |x| (QREFELT $ 283))
                        . #6#)
                  (EXIT
                   (COND
                    ((QEQCAR |res1u| 1)
                     (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 199)
                             (|spadConstant| $ 104) (|spadConstant| $ 199)))
                    (#7#
                     (SEQ (LETT |res1| (QCDR |res1u|) . #6#)
                          (LETT |ansp1| (|spadConstant| $ 45) . #6#)
                          (LETT |lp_cor| (|spadConstant| $ 199) . #6#)
                          (LETT |eiarg_inc|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (QVELT |er| 8) (QREFELT $ 76)) 1
                                   (QREFELT $ 46))
                                  (SPADCALL (QVELT |er| 9) (QREFELT $ 47))
                                  (QREFELT $ 51))
                                 |denf| (QREFELT $ 99))
                                . #6#)
                          (LETT |zzl|
                                (COND
                                 ((SPADCALL |cfac| (|spadConstant| $ 104)
                                            (QREFELT $ 113))
                                  (LIST (|spadConstant| $ 45)))
                                 (#7# (SPADCALL |cfac| (QREFELT $ 302))))
                                . #6#)
                          (SEQ (LETT |ck| NIL . #6#) (LETT #4# |res1| . #6#)
                               G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |ck| (CAR #4#) . #6#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |ci| (SPADCALL |ck| 1 (QREFELT $ 30))
                                      . #6#)
                                (LETT |kif| (SPADCALL |ck| 2 (QREFELT $ 30))
                                      . #6#)
                                (LETT |ki| (SPADCALL |kif| (QREFELT $ 31))
                                      . #6#)
                                (LETT |einumi|
                                      (COND
                                       ((SPADCALL |cfac| (|spadConstant| $ 104)
                                                  (QREFELT $ 113))
                                        (SPADCALL |eiarg_num|
                                                  (SPADCALL |kif| |eiarg_inc|
                                                            (QREFELT $ 137))
                                                  (QREFELT $ 51)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lc0| |kif| (QREFELT $ 75))
                                          |lc0| (QREFELT $ 69))
                                         |eiarg_num| (QREFELT $ 137))))
                                      . #6#)
                                (LETT |nn|
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |einumi| (QREFELT $ 41)) 1
                                         (QREFELT $ 22))
                                        (|RDEEFX;p_power_in_q| |einumi| |fac1|
                                         $))
                                       ('T 1))
                                      . #6#)
                                (COND
                                 ((EQL |nn| 0)
                                  (|error|
                                   "impossible, einumi not divisible by its factor")))
                                (LETT |ci|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |nn0| (QREFELT $ 76)) |ci|
                                        (QREFELT $ 67))
                                       (SPADCALL |nn| (QREFELT $ 76))
                                       (QREFELT $ 69))
                                      . #6#)
                                (LETT |eiargi_r|
                                      (SPADCALL
                                       (SPADCALL |einumi| (QREFELT $ 49))
                                       (SPADCALL |denf| (QREFELT $ 49))
                                       (QREFELT $ 52))
                                      . #6#)
                                (LETT |eiargi|
                                      (SPADCALL |eiargi_r| |k| (QREFELT $ 62))
                                      . #6#)
                                (LETT |shifti|
                                      (COND
                                       ((SPADCALL |cfac| (|spadConstant| $ 104)
                                                  (QREFELT $ 113))
                                        (SPADCALL (QVELT |er| 6)
                                                  (SPADCALL |kif|
                                                            (QVELT |er| 11)
                                                            (QREFELT $ 67))
                                                  (QREFELT $ 75)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lc0| |kif| (QREFELT $ 75))
                                          |lc0| (QREFELT $ 69))
                                         (SPADCALL (QVELT |er| 6)
                                                   (SPADCALL |lc0| |rfc|
                                                             (QREFELT $ 67))
                                                   (QREFELT $ 75))
                                         (QREFELT $ 67))))
                                      . #6#)
                                (LETT |ansp1|
                                      (SPADCALL |ansp1|
                                                (SPADCALL
                                                 (SPADCALL |ci|
                                                           (SPADCALL
                                                            (SPADCALL |shifti|
                                                                      (QREFELT
                                                                       $ 50))
                                                            (QREFELT $ 300))
                                                           (QREFELT $ 67))
                                                 (SPADCALL |eiargi|
                                                           (QREFELT $ 301))
                                                 (QREFELT $ 67))
                                                (QREFELT $ 75))
                                      . #6#)
                                (LETT |coefi|
                                      (SPADCALL
                                       (SPADCALL |ci| |u0| (QREFELT $ 67))
                                       (SPADCALL |u1| |ki| (QREFELT $ 81))
                                       (QREFELT $ 67))
                                      . #6#)
                                (LETT |eiargp|
                                      (SPADCALL |denfp|
                                                (SPADCALL
                                                 (SPADCALL |eiargi| |x|
                                                           (QREFELT $ 64))
                                                 |k| (QREFELT $ 36))
                                                (QREFELT $ 247))
                                      . #6#)
                                (EXIT
                                 (LETT |lp_cor|
                                       (SPADCALL |lp_cor|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |coefi|
                                                              (QREFELT $ 47))
                                                    (QREFELT $ 49))
                                                   |eiargp| (QREFELT $ 291))
                                                  |eiargi_r| (QREFELT $ 52))
                                                 (QREFELT $ 304))
                                       . #6#)))
                               (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |ansp| (|spadConstant| $ 45) . #6#)
                          (COND
                           ((SPADCALL |cfac| (|spadConstant| $ 104)
                                      (QREFELT $ 113))
                            (LETT |ansp| |ansp1| . #6#))
                           (#7#
                            (SEQ
                             (LETT |lp_cor|
                                   (|RDEEFX;get_trace| |lp_cor| |k| |rf1k|
                                    |cfac| $)
                                   . #6#)
                             (EXIT
                              (SEQ (LETT |zz| NIL . #6#) (LETT #2# |zzl| . #6#)
                                   G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |zz| (CAR #2#) . #6#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |ansp|
                                           (SPADCALL |ansp|
                                                     (SPADCALL |ansp1| |rf1k|
                                                               |zz|
                                                               (QREFELT $ 70))
                                                     (QREFELT $ 75))
                                           . #6#)))
                                   (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                   (EXIT NIL))))))
                          (LETT |dvr2|
                                (SPADCALL (SPADCALL |lp_cor| (QREFELT $ 39))
                                          (SPADCALL |lp_cor| (QREFELT $ 40))
                                          (QREFELT $ 293))
                                . #6#)
                          (EXIT
                           (VECTOR |ansp|
                                   (SPADCALL
                                    (SPADCALL (QCDR |dvr2|) (QREFELT $ 49))
                                    (SPADCALL
                                     (SPADCALL |lp_cor| (QREFELT $ 40))
                                     (QREFELT $ 49))
                                    (QREFELT $ 52))
                                   (QCAR |dvr2|)
                                   (|spadConstant| $ 199)))))))))))))) 

(SDEFUN |RDEEFX;linear_log_case|
        ((|num| |SparseUnivariatePolynomial| F)
         (|den| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |Record| (|:| |primpart| F)
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |polypart| (|SparseUnivariatePolynomial| F))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|poly_cor| (|SparseUnivariatePolynomial| F))
          (|sp_cor| #1=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lp_cor| #1#) (|ansp| (F))
          (|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#2=#:G1566 NIL) (|einum| NIL) (#3=#:G1567 NIL) (|er| NIL)
          (|einums| (|List| (|SparseUnivariatePolynomial| F)))
          (|eidens| (|List| (|SparseUnivariatePolynomial| F))) (#4=#:G1565 NIL)
          (#5=#:G1564 NIL)
          (|al|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                      (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                      (|:| |u_part2| F) (|:| |shift_part2| F)))))
         (SEQ
          (LETT |al| (|RDEEFX;lin_args| |den| |nf| |k| |vlst| |ulst| |x| $)
                . #6=(|RDEEFX;linear_log_case|))
          (EXIT
           (COND
            ((NULL |al|)
             (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 199)
                     (|spadConstant| $ 104) (|spadConstant| $ 199)))
            ('T
             (SEQ
              (LETT |eidens|
                    (PROGN
                     (LETT #5# NIL . #6#)
                     (SEQ (LETT |er| NIL . #6#) (LETT #4# |al| . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |er| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #5# (CONS (QVELT |er| 0) #5#) . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |einums| (|RDEEFX;decompose1| |num| |den| |eidens| $)
                    . #6#)
              (LETT |ansp| (|spadConstant| $ 45) . #6#)
              (LETT |lp_cor| (|spadConstant| $ 199) . #6#)
              (LETT |sp_cor| (|spadConstant| $ 199) . #6#)
              (LETT |poly_cor| (|spadConstant| $ 104) . #6#)
              (SEQ (LETT |er| NIL . #6#) (LETT #3# |al| . #6#)
                   (LETT |einum| NIL . #6#) (LETT #2# |einums| . #6#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |einum| (CAR #2#) . #6#) NIL)
                         (ATOM #3#) (PROGN (LETT |er| (CAR #3#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ar1|
                          (COND
                           ((QVELT |er| 7)
                            (|RDEEFX;solve_linear_factor| |nf|
                             (|spadConstant| $ 110) |nfp|
                             (|spadConstant| $ 110) |k| |x| |einum| |er| $))
                           ('T
                            (|RDEEFX;solve_factor1| |nf| (|spadConstant| $ 110)
                             |nfp| (|spadConstant| $ 110) |k| |x| |einum|
                             (QVELT |er| 0)
                             (VECTOR (QVELT |er| 0) (QVELT |er| 1)
                                     (QVELT |er| 2) (QVELT |er| 3)
                                     (QVELT |er| 4) (QVELT |er| 5)
                                     (QVELT |er| 6))
                             $)))
                          . #6#)
                    (LETT |ansp|
                          (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT $ 75))
                          . #6#)
                    (LETT |lp_cor|
                          (SPADCALL |lp_cor| (QVELT |ar1| 1) (QREFELT $ 304))
                          . #6#)
                    (LETT |sp_cor|
                          (SPADCALL |sp_cor| (QVELT |ar1| 3) (QREFELT $ 304))
                          . #6#)
                    (EXIT
                     (LETT |poly_cor|
                           (SPADCALL |poly_cor| (QVELT |ar1| 2) (QREFELT $ 51))
                           . #6#)))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))))) 

(SDEFUN |RDEEFX;handle_nonlinear_log|
        ((|num| |SparseUnivariatePolynomial| F)
         (|den| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|x| |Symbol|) (|vlst| |List| F) (|ulst| |List| F)
         (|lei| |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F)))
         (|dbasis| |Vector| (|SparseUnivariatePolynomial| F))
         (|dtrans| |Matrix| (|Integer|))
         ($ |Record| (|:| |primpart| F)
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |polypart| (|SparseUnivariatePolynomial| F))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|einums| (|List| (|SparseUnivariatePolynomial| F)))
          (|er2|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                     (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                     (|:| |u_part2| F) (|:| |shift_part2| F)))
          (|u1| (F))
          (|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|v1| (F)) (|v0| (F)) (|r1| (|Integer|)) (|ril| (|List| (|Integer|)))
          (#1=#:G1596 NIL) (|er| NIL) (#2=#:G1595 NIL) (|r0| (|Integer|))
          (|er1|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F)))
          (|lei1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (#3=#:G1593 NIL) (|j| NIL) (#4=#:G1594 NIL)
          (|bpol| (|SparseUnivariatePolynomial| F))
          (|poly_cor| (|SparseUnivariatePolynomial| F))
          (|sp_cor| #5=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lp_cor| #5#) (|ansp| (F)) (#6=#:G1590 NIL) (|einum| NIL)
          (#7=#:G1591 NIL) (#8=#:G1592 NIL)
          (|bpols| (|List| (|SparseUnivariatePolynomial| F)))
          (|j0| (|NonNegativeInteger|)) (#9=#:G1587 NIL) (|esum| (|Integer|))
          (#10=#:G1589 NIL) (#11=#:G1588 NIL) (|i| NIL)
          (|m| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |lei|) . #12=(|RDEEFX;handle_nonlinear_log|))
              (LETT |m| (QVSIZE |dbasis|) . #12#) (LETT |bpols| NIL . #12#)
              (LETT |lei1| NIL . #12#)
              (SEQ (LETT |i| 1 . #12#) (LETT #11# |m| . #12#) G190
                   (COND ((|greater_SI| |i| #11#) (GO G191)))
                   (SEQ (LETT |esum| 0 . #12#)
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| 1 . #12#) (LETT #10# |n| . #12#) G190
                               (COND ((|greater_SI| |j| #10#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL
                                    (SPADCALL |dtrans| |i| |j| (QREFELT $ 305))
                                    1)
                                   (SEQ (LETT |esum| (+ |esum| 1) . #12#)
                                        (EXIT
                                         (COND
                                          ((EQL |esum| 2)
                                           (PROGN
                                            (LETT #9# |$NoValue| . #12#)
                                            (GO #13=#:G1571)))
                                          ('T (LETT |j0| |j| . #12#)))))))))
                               (LETT |j| (|inc_SI| |j|) . #12#) (GO G190) G191
                               (EXIT NIL)))
                         #13# (EXIT #9#))
                        (EXIT
                         (COND
                          ((EQL |esum| 1)
                           (SEQ
                            (LETT |bpols|
                                  (CONS (SPADCALL |dbasis| |i| (QREFELT $ 307))
                                        |bpols|)
                                  . #12#)
                            (EXIT
                             (LETT |lei1|
                                   (CONS (SPADCALL |lei| |j0| (QREFELT $ 310))
                                         |lei1|)
                                   . #12#)))))))
                   (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191 (EXIT NIL))
              (LETT |ansp| (|spadConstant| $ 45) . #12#)
              (LETT |lp_cor| (|spadConstant| $ 199) . #12#)
              (LETT |sp_cor| (|spadConstant| $ 199) . #12#)
              (LETT |poly_cor| (|spadConstant| $ 104) . #12#)
              (COND
               ((NULL (NULL |bpols|))
                (EXIT
                 (SEQ
                  (LETT |einums| (|RDEEFX;decompose1| |num| |den| |bpols| $)
                        . #12#)
                  (SEQ (LETT |er| NIL . #12#) (LETT #8# |lei1| . #12#)
                       (LETT |bpol| NIL . #12#) (LETT #7# |bpols| . #12#)
                       (LETT |einum| NIL . #12#) (LETT #6# |einums| . #12#)
                       G190
                       (COND
                        ((OR (ATOM #6#)
                             (PROGN (LETT |einum| (CAR #6#) . #12#) NIL)
                             (ATOM #7#)
                             (PROGN (LETT |bpol| (CAR #7#) . #12#) NIL)
                             (ATOM #8#)
                             (PROGN (LETT |er| (CAR #8#) . #12#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ar1|
                              (|RDEEFX;solve_factor1| |nf| |denf| |nfp| |denfp|
                               |k| |x| |einum| |bpol| |er| $)
                              . #12#)
                        (LETT |ansp|
                              (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT $ 75))
                              . #12#)
                        (LETT |lp_cor|
                              (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                        (QREFELT $ 304))
                              . #12#)
                        (LETT |sp_cor|
                              (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                        (QREFELT $ 304))
                              . #12#)
                        (EXIT
                         (LETT |poly_cor|
                               (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                         (QREFELT $ 51))
                               . #12#)))
                       (LETT #6#
                             (PROG1 (CDR #6#)
                               (LETT #7#
                                     (PROG1 (CDR #7#)
                                       (LETT #8# (CDR #8#) . #12#))
                                     . #12#))
                             . #12#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))
              (LETT |bpol| (SPADCALL |dbasis| 1 (QREFELT $ 307)) . #12#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |bpol| (QREFELT $ 41)) 1 (QREFELT $ 311))
                 (|error| "degree(bpol) ~= 1"))
                (#14='T
                 (SEQ
                  (SEQ (LETT |er| NIL . #12#) (LETT #4# |lei| . #12#)
                       (LETT |j| 1 . #12#) (LETT #3# |n| . #12#) G190
                       (COND
                        ((OR (|greater_SI| |j| #3#) (ATOM #4#)
                             (PROGN (LETT |er| (CAR #4#) . #12#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |dtrans| 1 |j| (QREFELT $ 305)) 1)
                           (LETT |lei1| (CONS |er| |lei1|) . #12#)))))
                       (LETT |j|
                             (PROG1 (|inc_SI| |j|) (LETT #4# (CDR #4#) . #12#))
                             . #12#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |er1| (|SPADfirst| |lei1|) . #12#)
                  (LETT |r0| (QVELT |er1| 1) . #12#)
                  (LETT |lei| (CDR |lei1|) . #12#)
                  (LETT |ril|
                        (PROGN
                         (LETT #2# NIL . #12#)
                         (SEQ (LETT |er| NIL . #12#) (LETT #1# |lei| . #12#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |er| (CAR #1#) . #12#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2# (CONS (- (QVELT |er| 1) |r0|) #2#)
                                      . #12#)))
                              (LETT #1# (CDR #1#) . #12#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #12#)
                  (LETT |r1| (SPADCALL |ril| (QREFELT $ 117)) . #12#)
                  (LETT |v0| (QVELT |er1| 2) . #12#)
                  (LETT |v1|
                        (SPADCALL (QVELT (|SPADfirst| |lei|) 2) |v0|
                                  (QREFELT $ 79))
                        . #12#)
                  (LETT |v1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |r1| (QREFELT $ 76))
                                   (SPADCALL
                                    (- (QVELT (|SPADfirst| |lei|) 1) |r0|)
                                    (QREFELT $ 76))
                                   (QREFELT $ 69))
                         |v1| (QREFELT $ 67))
                        . #12#)
                  (LETT |uvu| (|RDEEFX;get_uv| |v1| |vlst| |ulst| |k| |x| $)
                        . #12#)
                  (EXIT
                   (COND
                    ((QEQCAR |uvu| 1) (|error| "impossible, get_uv failed"))
                    (#14#
                     (SEQ (LETT |uv| (QCDR |uvu|) . #12#)
                          (LETT |u1|
                                (SPADCALL (QVELT |uv| 0)
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |k| (QREFELT $ 28)) 1
                                            (QREFELT $ 30))
                                           |r1| (QREFELT $ 81))
                                          (QREFELT $ 67))
                                . #12#)
                          (LETT |er2|
                                (VECTOR |bpol| |r0| |v0| (|spadConstant| $ 104)
                                        (QVELT |er1| 4) 0 (QVELT |er1| 6) 'T
                                        |r1| |v1| |u1| (QVELT |uv| 1))
                                . #12#)
                          (LETT |einums|
                                (|RDEEFX;decompose1| |num| |den| (LIST |bpol|)
                                 $)
                                . #12#)
                          (LETT |ar1|
                                (|RDEEFX;solve_linear_factor| |nf| |denf| |nfp|
                                 |denfp| |k| |x| (|SPADfirst| |einums|) |er2|
                                 $)
                                . #12#)
                          (EXIT |ar1|)))))))))))) 

(SDEFUN |RDEEFX;handle_logpart|
        ((|num| |SparseUnivariatePolynomial| F)
         (|den| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |Record| (|:| |primpart| F)
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |polypart| (|SparseUnivariatePolynomial| F))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|poly_cor| (|SparseUnivariatePolynomial| F))
          (|sp_cor| #1=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lp_cor| #1#) (|ansp| (F))
          (|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#2=#:G1632 NIL) (|einum| NIL) (#3=#:G1633 NIL) (|er| NIL)
          (|einums| (|List| (|SparseUnivariatePolynomial| F)))
          (|dtrans| #4=(|Matrix| (|Integer|)))
          (|dbasis| #5=(|Vector| (|SparseUnivariatePolynomial| F)))
          (|lei|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|ninds| (|List| (|Integer|)))
          (|eidens| (|List| (|SparseUnivariatePolynomial| F)))
          (|lei1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|neidens| (|List| (|SparseUnivariatePolynomial| F)))
          (#6=#:G1629 NIL) (|i| NIL) (#7=#:G1630 NIL) (|eiden| NIL)
          (#8=#:G1631 NIL) (|n| (|NonNegativeInteger|))
          (|nidbl| (|List| (|Integer|)))
          (|ndbl| (|List| (|SparseUnivariatePolynomial| F)))
          (|bi| (|SparseUnivariatePolynomial| F)) (#9=#:G1628 NIL)
          (|m| (|NonNegativeInteger|)) (#10=#:G1625 NIL)
          (|lp| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|dr| (|Record| (|:| |basis| #5#) (|:| |transform| #4#)))
          (#11=#:G1627 NIL) (#12=#:G1626 NIL))
         (SEQ
          (COND
           ((SPADCALL |k| '|log| (QREFELT $ 23))
            (COND
             ((SPADCALL |denf| (|spadConstant| $ 110) (QREFELT $ 113))
              (COND
               ((SPADCALL (SPADCALL |nf| (QREFELT $ 41)) 1 (QREFELT $ 312))
                (EXIT
                 (|RDEEFX;linear_log_case| |num| |den| |nf| |nfp| |k| |vlst|
                  |ulst| |x| $))))))))
          (COND
           ((SPADCALL |denf| (|spadConstant| $ 110) (QREFELT $ 113))
            (COND
             ((EQL (SPADCALL |nf| (QREFELT $ 41)) 0)
              (EXIT
               (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 199)
                       (|spadConstant| $ 104) (|spadConstant| $ 199)))))))
          (LETT |lei|
                (|RDEEFX;ei_args| |den| |nf| |denf| |k| |vlst| |ulst| |x| $)
                . #13=(|RDEEFX;handle_logpart|))
          (EXIT
           (COND
            ((NULL |lei|)
             (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 199)
                     (|spadConstant| $ 104) (|spadConstant| $ 199)))
            (#14='T
             (SEQ
              (LETT |eidens|
                    (PROGN
                     (LETT #12# NIL . #13#)
                     (SEQ (LETT |er| NIL . #13#) (LETT #11# |lei| . #13#) G190
                          (COND
                           ((OR (ATOM #11#)
                                (PROGN (LETT |er| (CAR #11#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #12# (CONS (QVELT |er| 0) #12#) . #13#)))
                          (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #12#))))
                    . #13#)
              (LETT |ansp| (|spadConstant| $ 45) . #13#)
              (LETT |lp_cor| (|spadConstant| $ 199) . #13#)
              (LETT |sp_cor| (|spadConstant| $ 199) . #13#)
              (LETT |poly_cor| (|spadConstant| $ 104) . #13#)
              (EXIT
               (COND
                ((SPADCALL |k| '|log| (QREFELT $ 23))
                 (SEQ
                  (LETT |dr|
                        (SPADCALL (SPADCALL |eidens| (QREFELT $ 313))
                                  (QREFELT $ 316))
                        . #13#)
                  (LETT |dbasis| (QCAR |dr|) . #13#)
                  (LETT |dtrans| (QCDR |dr|) . #13#)
                  (LETT |lp|
                        (SPADCALL (SPADCALL |num| (QREFELT $ 49))
                                  (SPADCALL |den| (QREFELT $ 49))
                                  (QREFELT $ 52))
                        . #13#)
                  (SEQ
                   (EXIT
                    (SEQ G190 NIL
                         (SEQ
                          (LETT |ar1|
                                (|RDEEFX;handle_nonlinear_log| |num| |den| |nf|
                                 |denf| |nfp| |denfp| |k| |x| |vlst| |ulst|
                                 |lei| |dbasis| |dtrans| $)
                                . #13#)
                          (LETT |ansp|
                                (SPADCALL |ansp| (QVELT |ar1| 0)
                                          (QREFELT $ 75))
                                . #13#)
                          (LETT |lp_cor|
                                (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                          (QREFELT $ 304))
                                . #13#)
                          (LETT |sp_cor|
                                (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                          (QREFELT $ 304))
                                . #13#)
                          (LETT |poly_cor|
                                (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                          (QREFELT $ 51))
                                . #13#)
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |ar1| 1) (|spadConstant| $ 199)
                                       (QREFELT $ 317))
                             (PROGN
                              (LETT #10# |$NoValue| . #13#)
                              (GO #15=#:G1617)))
                            ('T
                             (SEQ
                              (LETT |lp|
                                    (SPADCALL |lp| (QVELT |ar1| 1)
                                              (QREFELT $ 246))
                                    . #13#)
                              (EXIT
                               (COND
                                ((SPADCALL |lp| (|spadConstant| $ 199)
                                           (QREFELT $ 317))
                                 (PROGN
                                  (LETT #10# |$NoValue| . #13#)
                                  (GO #15#)))
                                ('T
                                 (SEQ
                                  (LETT |num| (SPADCALL |lp| (QREFELT $ 39))
                                        . #13#)
                                  (LETT |den| (SPADCALL |lp| (QREFELT $ 40))
                                        . #13#)
                                  (LETT |ndbl| NIL . #13#)
                                  (LETT |nidbl| NIL . #13#)
                                  (LETT |m| (QVSIZE |dbasis|) . #13#)
                                  (SEQ (LETT |i| 1 . #13#)
                                       (LETT #9# |m| . #13#) G190
                                       (COND
                                        ((|greater_SI| |i| #9#) (GO G191)))
                                       (SEQ
                                        (LETT |bi|
                                              (SPADCALL |dbasis| |i|
                                                        (QREFELT $ 307))
                                              . #13#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR
                                            (SPADCALL |den| |bi|
                                                      (QREFELT $ 109))
                                            0)
                                           (SEQ
                                            (LETT |ndbl| (CONS |bi| |ndbl|)
                                                  . #13#)
                                            (EXIT
                                             (LETT |nidbl| (CONS |i| |nidbl|)
                                                   . #13#)))))))
                                       (LETT |i| (|inc_SI| |i|) . #13#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((EQL (LENGTH |ndbl|) |m|)
                                     (|error|
                                      "no progress in handle_nonlinear_log"))
                                    ('T
                                     (SEQ
                                      (LETT |ndbl| (NREVERSE |ndbl|) . #13#)
                                      (LETT |nidbl| (NREVERSE |nidbl|) . #13#)
                                      (LETT |neidens| NIL . #13#)
                                      (LETT |ninds| NIL . #13#)
                                      (LETT |lei1| NIL . #13#)
                                      (LETT |n| (LENGTH |eidens|) . #13#)
                                      (SEQ (LETT |er| NIL . #13#)
                                           (LETT #8# |lei| . #13#)
                                           (LETT |eiden| NIL . #13#)
                                           (LETT #7# |eidens| . #13#)
                                           (LETT |i| 1 . #13#)
                                           (LETT #6# |n| . #13#) G190
                                           (COND
                                            ((OR (|greater_SI| |i| #6#)
                                                 (ATOM #7#)
                                                 (PROGN
                                                  (LETT |eiden| (CAR #7#)
                                                        . #13#)
                                                  NIL)
                                                 (ATOM #8#)
                                                 (PROGN
                                                  (LETT |er| (CAR #8#) . #13#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((QEQCAR
                                                (SPADCALL |den| |eiden|
                                                          (QREFELT $ 109))
                                                0)
                                               (SEQ
                                                (LETT |neidens|
                                                      (CONS |eiden| |neidens|)
                                                      . #13#)
                                                (LETT |ninds|
                                                      (CONS |i| |ninds|)
                                                      . #13#)
                                                (EXIT
                                                 (LETT |lei1|
                                                       (CONS |er| |lei1|)
                                                       . #13#)))))))
                                           (LETT |i|
                                                 (PROG1 (|inc_SI| |i|)
                                                   (LETT #7#
                                                         (PROG1 (CDR #7#)
                                                           (LETT #8# (CDR #8#)
                                                                 . #13#))
                                                         . #13#))
                                                 . #13#)
                                           (GO G190) G191 (EXIT NIL))
                                      (LETT |eidens| (NREVERSE |neidens|)
                                            . #13#)
                                      (LETT |ninds| (NREVERSE |ninds|) . #13#)
                                      (LETT |lei| (NREVERSE |lei1|) . #13#)
                                      (LETT |dbasis|
                                            (SPADCALL |ndbl| (QREFELT $ 313))
                                            . #13#)
                                      (EXIT
                                       (LETT |dtrans|
                                             (SPADCALL |dtrans| |nidbl| |ninds|
                                                       (QREFELT $ 318))
                                             . #13#)))))))))))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #15# (EXIT #10#))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))
                (#14#
                 (SEQ
                  (LETT |einums| (|RDEEFX;decompose1| |num| |den| |eidens| $)
                        . #13#)
                  (SEQ (LETT |er| NIL . #13#) (LETT #3# |lei| . #13#)
                       (LETT |einum| NIL . #13#) (LETT #2# |einums| . #13#)
                       G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |einum| (CAR #2#) . #13#) NIL)
                             (ATOM #3#)
                             (PROGN (LETT |er| (CAR #3#) . #13#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ar1|
                              (|RDEEFX;solve_factor1| |nf| |denf| |nfp| |denfp|
                               |k| |x| |einum| (QVELT |er| 0) |er| $)
                              . #13#)
                        (LETT |ansp|
                              (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT $ 75))
                              . #13#)
                        (LETT |lp_cor|
                              (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                        (QREFELT $ 304))
                              . #13#)
                        (LETT |sp_cor|
                              (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                        (QREFELT $ 304))
                              . #13#)
                        (EXIT
                         (LETT |poly_cor|
                               (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                         (QREFELT $ 51))
                               . #13#)))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #13#))
                             . #13#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))))))))) 

(SDEFUN |RDEEFX;gamma_denominator|
        ((|denf| . #1=(|SparseUnivariatePolynomial| F)) (|k| |Kernel| F)
         ($ |Record| (|:| |radicand| (|SparseUnivariatePolynomial| F))
          (|:| |exponent| (|Integer|))))
        (SPROG
         ((|gden1| (|SparseUnivariatePolynomial| F)) (#2=#:G1659 NIL)
          (#3=#:G1655 NIL) (#4=#:G1667 NIL) (|fac1| NIL) (#5=#:G1666 NIL)
          (|l1| (|Integer|)) (|lexp| (|List| #6=(|Integer|))) (#7=#:G1665 NIL)
          (#8=#:G1664 NIL)
          (|nffacs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| #6#))))
          (|fnf| (|Factored| (|SparseUnivariatePolynomial| F))) (|denf1| #1#)
          (#9=#:G1637 NIL) (#10=#:G1635 NIL) (|s_deg| (|Integer|)))
         (SEQ (LETT |s_deg| 0 . #11=(|RDEEFX;gamma_denominator|))
              (LETT |denf1| |denf| . #11#)
              (COND
               ((SPADCALL |k| '|exp| (QREFELT $ 23))
                (SEQ (LETT |s_deg| (SPADCALL |denf| (QREFELT $ 233)) . #11#)
                     (EXIT
                      (LETT |denf1|
                            (PROG2
                                (LETT #9#
                                      (SPADCALL |denf|
                                                (SPADCALL (|spadConstant| $ 33)
                                                          (PROG1
                                                              (LETT #10#
                                                                    |s_deg|
                                                                    . #11#)
                                                            (|check_subtype2|
                                                             (>= #10# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|)
                                                             #10#))
                                                          (QREFELT $ 46))
                                                (QREFELT $ 109))
                                      . #11#)
                                (QCDR #9#)
                              (|check_union2| (QEQCAR #9# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))
                                              (|Union|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7))
                                               "failed")
                                              #9#))
                            . #11#)))))
              (EXIT
               (COND
                ((SPADCALL |denf1| (|spadConstant| $ 110) (QREFELT $ 113))
                 (COND ((EQL |s_deg| 0) (CONS (|spadConstant| $ 110) 0))
                       (#12='T
                        (CONS (SPADCALL (|spadConstant| $ 33) 1 (QREFELT $ 46))
                              |s_deg|))))
                (#12#
                 (SEQ (LETT |fnf| (SPADCALL |denf1| (QREFELT $ 216)) . #11#)
                      (LETT |nffacs| (SPADCALL |fnf| (QREFELT $ 131)) . #11#)
                      (LETT |lexp|
                            (PROGN
                             (LETT #8# NIL . #11#)
                             (SEQ (LETT |fac1| NIL . #11#)
                                  (LETT #7# |nffacs| . #11#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |fac1| (CAR #7#) . #11#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #8# (CONS (QCDR |fac1|) #8#)
                                          . #11#)))
                                  (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                                  (EXIT (NREVERSE #8#))))
                            . #11#)
                      (LETT |l1|
                            (SPADCALL (CONS |s_deg| |lexp|) (QREFELT $ 117))
                            . #11#)
                      (EXIT
                       (COND ((EQL |l1| 1) (CONS |denf| 1))
                             (#12#
                              (SEQ
                               (LETT |gden1|
                                     (SPADCALL (ELT $ 99)
                                               (PROGN
                                                (LETT #5# NIL . #11#)
                                                (SEQ (LETT |fac1| NIL . #11#)
                                                     (LETT #4# |nffacs| . #11#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #4#)
                                                           (PROGN
                                                            (LETT |fac1|
                                                                  (CAR #4#)
                                                                  . #11#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #5#
                                                             (CONS
                                                              (|RDEEFX;my_exp|
                                                               (QCAR |fac1|)
                                                               (PROG1
                                                                   (LETT #3#
                                                                         (QUOTIENT2
                                                                          (QCDR
                                                                           |fac1|)
                                                                          |l1|)
                                                                         . #11#)
                                                                 (|check_subtype2|
                                                                  (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #3#))
                                                               $)
                                                              #5#)
                                                             . #11#)))
                                                     (LETT #4# (CDR #4#)
                                                           . #11#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #5#))))
                                               (QREFELT $ 285))
                                     . #11#)
                               (COND
                                ((SPADCALL |s_deg| 0 (QREFELT $ 42))
                                 (LETT |gden1|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| $ 33)
                                                  (PROG1
                                                      (LETT #2#
                                                            (QUOTIENT2 |s_deg|
                                                                       |l1|)
                                                            . #11#)
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT $ 46))
                                        |gden1| (QREFELT $ 99))
                                       . #11#)))
                               (EXIT (CONS |gden1| |l1|))))))))))))) 

(SDEFUN |RDEEFX;special_Hermite|
        ((|r| |Fraction| (|SparseUnivariatePolynomial| F))
         (|nfp| |SparseUnivariatePolynomial| F)
         (|ndenf| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F)
         (|deriv| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record|
          (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|mult| (|SparseUnivariatePolynomial| F))
          (|denr| #1=(|SparseUnivariatePolynomial| F)) (#2=#:G1674 NIL)
          (|numr| (|SparseUnivariatePolynomial| F))
          (|nfp1| (|SparseUnivariatePolynomial| F))
          (|an| (|SparseUnivariatePolynomial| F))
          (|nn| (|SparseUnivariatePolynomial| F))
          (|ee|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))))
          (#3=#:G1671 NIL) (#4=#:G1681 NIL)
          (|hh1| (|SparseUnivariatePolynomial| F)) (|ad| #1#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ad|
                  (LETT |denr| (SPADCALL |r| (QREFELT $ 40))
                        . #5=(|RDEEFX;special_Hermite|))
                  . #5#)
            (LETT |numr| (SPADCALL |r| (QREFELT $ 39)) . #5#)
            (LETT |an| (|spadConstant| $ 104) . #5#)
            (LETT |mult| (|spadConstant| $ 110) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |hh1| (SPADCALL |denr| |ndenf| (QREFELT $ 107)) . #5#)
                   (EXIT
                    (COND
                     ((EQL (SPADCALL |hh1| (QREFELT $ 41)) 0)
                      (PROGN
                       (LETT #4#
                             (CONS
                              (SPADCALL (SPADCALL |denfp| |an| (QREFELT $ 99))
                                        |ad| (QREFELT $ 198))
                              (SPADCALL |numr| |denr| (QREFELT $ 198)))
                             . #5#)
                       (GO #6=#:G1680)))
                     ('T
                      (SEQ
                       (LETT |ee|
                             (PROG2
                                 (LETT #3#
                                       (SPADCALL |nfp| |hh1| |numr|
                                                 (QREFELT $ 297))
                                       . #5#)
                                 (QCDR #3#)
                               (|check_union2| (QEQCAR #3# 0)
                                               (|Record|
                                                (|:| |coef1|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 7)))
                                                (|:| |coef2|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 7))))
                                               (|Union|
                                                (|Record|
                                                 (|:| |coef1|
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 7)))
                                                 (|:| |coef2|
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 7))))
                                                "failed")
                                               #3#))
                             . #5#)
                       (LETT |nn| (SPADCALL (QCAR |ee|) |hh1| (QREFELT $ 191))
                             . #5#)
                       (LETT |an|
                             (SPADCALL |an|
                                       (SPADCALL |mult| |nn| (QREFELT $ 99))
                                       (QREFELT $ 51))
                             . #5#)
                       (LETT |nfp1|
                             (SPADCALL |nfp|
                                       (PROG2
                                           (LETT #2#
                                                 (SPADCALL
                                                  (SPADCALL |denfp|
                                                            (SPADCALL |denr|
                                                                      |deriv|)
                                                            (QREFELT $ 99))
                                                  |denr| (QREFELT $ 109))
                                                 . #5#)
                                           (QCDR #2#)
                                         (|check_union2| (QEQCAR #2# 0)
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 7))
                                                         (|Union|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 7))
                                                          #7="failed")
                                                         #2#))
                                       (QREFELT $ 48))
                             . #5#)
                       (LETT |numr|
                             (SPADCALL
                              (SPADCALL |numr|
                                        (SPADCALL |nfp1| |nn| (QREFELT $ 99))
                                        (QREFELT $ 48))
                              (SPADCALL (SPADCALL |denfp| |nn| (QREFELT $ 99))
                                        |deriv|)
                              (QREFELT $ 48))
                             . #5#)
                       (LETT |numr|
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL |numr| |hh1| (QREFELT $ 109))
                                       . #5#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7))
                                               (|Union|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))
                                                #7#)
                                               #2#))
                             . #5#)
                       (LETT |denr|
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL |denr| |hh1| (QREFELT $ 109))
                                       . #5#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7))
                                               (|Union|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))
                                                #7#)
                                               #2#))
                             . #5#)
                       (EXIT
                        (LETT |mult| (SPADCALL |mult| |hh1| (QREFELT $ 99))
                              . #5#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #4#)))) 

(SDEFUN |RDEEFX;ei_int_log|
        ((|f| F) (|ng| |SparseUnivariatePolynomial| F) (|x| |Symbol|)
         (|k| |Kernel| F)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|is_sol| (|Boolean|)) (|rh| (F)) (|r1| (F))
          (|res2|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|gm| (F)) (|kfm| (F)) (|am1| (F))
          (|res1|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|m| NIL) (|ansp| (F)) (|dk| (F)) (|kf| (F)) (|k1| (|Kernel| F))
          (|lk| (|List| (|Kernel| F))) (#1=#:G1690 NIL) (#2=#:G1689 NIL)
          (|ngu| (F)))
         (SEQ
          (LETT |ngu|
                (SPADCALL (SPADCALL |ng| (QREFELT $ 49)) |k| (QREFELT $ 62))
                . #3=(|RDEEFX;ei_int_log|))
          (LETT |lk|
                (SPADCALL
                 (SPADCALL (SPADCALL |f| (QREFELT $ 319))
                           (SPADCALL |ngu| (QREFELT $ 319)) (QREFELT $ 16))
                 |x| (QREFELT $ 15))
                . #3#)
          (LETT |lk|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |k1| NIL . #3#) (LETT #1# |lk| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k1| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |k1| |k| (QREFELT $ 320))
                          (LETT #2# (CONS |k1| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |k1| (SPADCALL |lk| (QREFELT $ 53)) . #3#)
          (LETT |kf| (SPADCALL |k| (QREFELT $ 63)) . #3#)
          (LETT |dk| (SPADCALL |kf| |x| (QREFELT $ 64)) . #3#)
          (LETT |r1| (|spadConstant| $ 45) . #3#)
          (LETT |ansp| (|spadConstant| $ 45) . #3#) (LETT |is_sol| 'T . #3#)
          (LETT |rh| (|spadConstant| $ 45) . #3#)
          (LETT |am1| (|spadConstant| $ 45) . #3#)
          (SEQ (LETT |m| (SPADCALL |ng| (QREFELT $ 41)) . #3#) G190
               (COND ((< |m| 1) (GO G191)))
               (SEQ
                (LETT |gm|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL (+ |m| 1) (QREFELT $ 76)) |dk|
                                  (QREFELT $ 67))
                        |am1| (QREFELT $ 67))
                       (QREFELT $ 50))
                      . #3#)
                (COND
                 ((EQL |m| (SPADCALL |ng| (QREFELT $ 41)))
                  (SEQ
                   (LETT |gm|
                         (SPADCALL |gm| (SPADCALL |ng| (QREFELT $ 105))
                                   (QREFELT $ 75))
                         . #3#)
                   (EXIT (LETT |ng| (SPADCALL |ng| (QREFELT $ 112)) . #3#)))))
                (LETT |res1| (SPADCALL |f| |gm| |x| |lk| (QREFELT $ 58)) . #3#)
                (LETT |is_sol| (COND (|is_sol| (QVELT |res1| 3)) ('T NIL))
                      . #3#)
                (LETT |am1| (QVELT |res1| 0) . #3#)
                (LETT |kfm| (SPADCALL |kf| |m| (QREFELT $ 321)) . #3#)
                (LETT |r1|
                      (SPADCALL |r1| (SPADCALL |kfm| |am1| (QREFELT $ 67))
                                (QREFELT $ 75))
                      . #3#)
                (EXIT
                 (LETT |rh|
                       (SPADCALL
                        (SPADCALL |rh|
                                  (SPADCALL |kfm| (QVELT |res1| 1)
                                            (QREFELT $ 67))
                                  (QREFELT $ 75))
                        (SPADCALL
                         (SPADCALL (SPADCALL |m| (QREFELT $ 76)) |dk|
                                   (QREFELT $ 67))
                         |am1| (QREFELT $ 67))
                        (QREFELT $ 75))
                       . #3#)))
               (LETT |m| (+ |m| -1) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |gm|
                (SPADCALL (SPADCALL |ng| (QREFELT $ 204))
                          (SPADCALL |dk| |am1| (QREFELT $ 67)) (QREFELT $ 79))
                . #3#)
          (LETT |res2| (SPADCALL 1 |f| |gm| |x| (QREFELT $ 68)) . #3#)
          (LETT |r1| (SPADCALL |r1| (QVELT |res2| 0) (QREFELT $ 75)) . #3#)
          (LETT |rh| (SPADCALL |rh| (QVELT |res2| 1) (QREFELT $ 75)) . #3#)
          (LETT |is_sol| (COND (|is_sol| (QVELT |res2| 3)) ('T NIL)) . #3#)
          (EXIT (VECTOR |r1| |rh| (QVELT |res2| 2) |is_sol|))))) 

(SDEFUN |RDEEFX;ei_int_exp|
        ((|f| F) (|ng| |SparseUnivariatePolynomial| F)
         (|degs| |NonNegativeInteger|) (|x| |Symbol|) (|k| |Kernel| F)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|is_sol| (|Boolean|)) (|rh| (F)) (|ansp| (F)) (|r1| (F)) (|kfm| (F))
          (|res1|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|f1| (F)) (|gm| (F)) (|m| (|Integer|)) (|kf| (F)) (|ak| (F))
          (|k1| (|Kernel| F)) (|lk| (|List| (|Kernel| F))) (|ngu| (F)))
         (SEQ
          (LETT |ngu|
                (SPADCALL (SPADCALL |ng| (QREFELT $ 49)) |k| (QREFELT $ 62))
                . #1=(|RDEEFX;ei_int_exp|))
          (LETT |lk|
                (SPADCALL (SPADCALL |f| (QREFELT $ 319))
                          (SPADCALL |ngu| (QREFELT $ 319)) (QREFELT $ 16))
                . #1#)
          (LETT |k1|
                (SPADCALL |k| (SPADCALL |lk| |x| (QREFELT $ 15)) |x|
                          (QREFELT $ 322))
                . #1#)
          (LETT |ak| (SPADCALL (SPADCALL |k| (QREFELT $ 28)) 1 (QREFELT $ 30))
                . #1#)
          (LETT |kf| (SPADCALL |k| (QREFELT $ 63)) . #1#)
          (LETT |r1| (|spadConstant| $ 45) . #1#)
          (LETT |ansp| (|spadConstant| $ 45) . #1#) (LETT |is_sol| 'T . #1#)
          (LETT |rh| (|spadConstant| $ 45) . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |ng| (|spadConstant| $ 104) (QREFELT $ 111)))
                 (GO G191)))
               (SEQ (LETT |m| (- (SPADCALL |ng| (QREFELT $ 41)) |degs|) . #1#)
                    (LETT |gm| (SPADCALL |ng| (QREFELT $ 105)) . #1#)
                    (LETT |ng| (SPADCALL |ng| (QREFELT $ 112)) . #1#)
                    (LETT |f1|
                          (SPADCALL |f|
                                    (SPADCALL (SPADCALL |m| (QREFELT $ 76))
                                              |ak| (QREFELT $ 67))
                                    (QREFELT $ 75))
                          . #1#)
                    (LETT |res1| (SPADCALL 1 |f1| |gm| |x| (QREFELT $ 68))
                          . #1#)
                    (LETT |kfm| (SPADCALL |kf| |m| (QREFELT $ 81)) . #1#)
                    (LETT |r1|
                          (SPADCALL |r1|
                                    (SPADCALL |kfm| (QVELT |res1| 0)
                                              (QREFELT $ 67))
                                    (QREFELT $ 75))
                          . #1#)
                    (LETT |ansp|
                          (SPADCALL |ansp| (QVELT |res1| 2) (QREFELT $ 75))
                          . #1#)
                    (LETT |rh|
                          (SPADCALL |rh|
                                    (SPADCALL |kfm| (QVELT |res1| 1)
                                              (QREFELT $ 67))
                                    (QREFELT $ 75))
                          . #1#)
                    (EXIT
                     (LETT |is_sol| (COND (|is_sol| (QVELT |res1| 3)) ('T NIL))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |r1| |rh| |ansp| |is_sol|))))) 

(SDEFUN |RDEEFX;get_scoeff|
        ((|scand| |Record| (|:| |degree| (|Integer|))
          (|:| |factor| (|SparseUnivariatePolynomial| F)) (|:| |coeff| F)
          (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
          (|:| |alg_part| (|SparseUnivariatePolynomial| F))
          (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |u_part| F) (|:| |exponent| (|Integer|)) (|:| |shift_part| F))
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|der| |Mapping| #1=(|Fraction| (|SparseUnivariatePolynomial| F))
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|res| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ |List| (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|gt| #2=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|gt1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (#3=#:G1708 NIL) (|i| NIL)
          (|nf2| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|l1| (|NonNegativeInteger|)) (#4=#:G1702 NIL) (|rf1k| (|Kernel| F))
          (|rfc| (F)) (|coeff1_r| #2#)
          (|coeff1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|nfp| #1#)
          (|d| (|Integer|)) (|vshift| (F)) (|u_exp| (|Integer|)) (|u0| (F))
          (|ak| (F)) (|nf1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|cfac| (|SparseUnivariatePolynomial| F)) (|v0| (F))
          (|r0| (|Integer|)) (|nn| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |nn| (QVELT |scand| 1) . #5=(|RDEEFX;get_scoeff|))
              (LETT |r0| (QVELT |scand| 3) . #5#)
              (LETT |v0| (QVELT |scand| 4) . #5#)
              (LETT |cfac| (QVELT |scand| 5) . #5#)
              (LETT |u0| (QVELT |scand| 8) . #5#)
              (LETT |nf1| (QVELT |scand| 6) . #5#)
              (COND
               ((SPADCALL |r0| 0 (QREFELT $ 91))
                (SEQ
                 (LETT |ak|
                       (SPADCALL (SPADCALL |k| (QREFELT $ 28)) 1
                                 (QREFELT $ 30))
                       . #5#)
                 (EXIT
                  (LETT |u0|
                        (SPADCALL |u0| (SPADCALL |ak| |r0| (QREFELT $ 81))
                                  (QREFELT $ 67))
                        . #5#)))))
              (LETT |u_exp| (QVELT |scand| 9) . #5#)
              (LETT |vshift| (QVELT |scand| 10) . #5#)
              (LETT |d| (QVELT |scand| 0) . #5#)
              (EXIT
               (COND
                ((EQL |d| 1)
                 (SEQ (LETT |nfp| (SPADCALL |nf1| |der|) . #5#)
                      (COND
                       ((OR
                         (SPADCALL (QVELT |scand| 2) (|spadConstant| $ 33)
                                   (QREFELT $ 132))
                         (SPADCALL |cfac| (|spadConstant| $ 104)
                                   (QREFELT $ 111)))
                        (EXIT (|error| "impossible coeff"))))
                      (LETT |coeff1|
                            (SPADCALL
                             (SPADCALL (SPADCALL |u0| (QREFELT $ 47)) |nfp|
                                       (QREFELT $ 247))
                             |nf1| (QREFELT $ 52))
                            . #5#)
                      (LETT |coeff1_r|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 33) 1
                                         (QREFELT $ 46))
                               (QREFELT $ 49))
                              |u_exp| (QREFELT $ 290))
                             |coeff1| (QREFELT $ 291))
                            . #5#)
                      (EXIT (CONS |coeff1_r| |res|))))
                ((SPADCALL |d| 1 (QREFELT $ 42))
                 (SEQ
                  (COND
                   ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                    (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 217)) . #5#)
                         (EXIT
                          (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 289))
                                . #5#)))))
                  (LETT |l1|
                        (PROG1 (LETT #4# (- |d| 1) . #5#)
                          (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #4#))
                        . #5#)
                  (LETT |nf2| (QVELT |scand| 7) . #5#)
                  (LETT |gt|
                        (SPADCALL
                         (SPADCALL (SPADCALL |nf2| |der|)
                                   (SPADCALL |u0| (QREFELT $ 47))
                                   (QREFELT $ 323))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 33) 1 (QREFELT $ 46))
                           (QREFELT $ 49))
                          |u_exp| (QREFELT $ 290))
                         (QREFELT $ 291))
                        . #5#)
                  (SEQ (LETT |i| 1 . #5#) (LETT #3# |l1| . #5#) G190
                       (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ
                        (LETT |gt1|
                              (COND
                               ((SPADCALL |cfac| (|spadConstant| $ 104)
                                          (QREFELT $ 113))
                                |gt|)
                               ('T
                                (|RDEEFX;get_trace| |gt| |k| |rf1k| |cfac| $)))
                              . #5#)
                        (LETT |res| (CONS |gt1| |res|) . #5#)
                        (EXIT
                         (LETT |gt| (SPADCALL |gt| |nf2| (QREFELT $ 291))
                               . #5#)))
                       (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |res|)))
                ('T (|error| "unimplemented"))))))) 

(SDEFUN |RDEEFX;get_scoeffs|
        ((|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F)))
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|der| |Mapping| (|Fraction| (|SparseUnivariatePolynomial| F))
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ |List| (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|res| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#1=#:G1713 NIL) (|scand| NIL))
         (SEQ (LETT |res| NIL . #2=(|RDEEFX;get_scoeffs|))
              (SEQ (LETT |scand| NIL . #2#) (LETT #1# |scands| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |scand| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (|RDEEFX;get_scoeff| |scand| |denf| |k| |der| |res|
                            $)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |RDEEFX;mk_erf1| ((|uc| F) (|ff| F) ($ F))
        (SPROG ((|uc1| (F)))
               (SEQ
                (LETT |uc1| (SPADCALL |uc| (QREFELT $ 324)) |RDEEFX;mk_erf1|)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT $ 325)) (QREFELT $ 324))
                   (SPADCALL (SPADCALL |uc1| |ff| (QREFELT $ 67))
                             (QREFELT $ 326))
                   (QREFELT $ 67))
                  |uc1| (QREFELT $ 69)))))) 

(SDEFUN |RDEEFX;is_imaginary?| ((|c| F) ($ |Boolean|))
        (SPROG
         ((|dl| (|List| (|Complex| (|Integer|))))
          (|nl| (|List| (|Complex| (|Integer|))))
          (|dc| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|nc| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (LETT |nc| (SPADCALL |c| (QREFELT $ 179))
                . #1=(|RDEEFX;is_imaginary?|))
          (LETT |dc| (SPADCALL |c| (QREFELT $ 250)) . #1#)
          (LETT |nl| (SPADCALL |nc| (QREFELT $ 328)) . #1#)
          (LETT |dl| (SPADCALL |dc| (QREFELT $ 328)) . #1#)
          (EXIT
           (COND
            ((SPADCALL (CONS #'|RDEEFX;is_imaginary?!0| $) |dl|
                       (QREFELT $ 335))
             (SPADCALL (CONS #'|RDEEFX;is_imaginary?!1| $) |nl|
                       (QREFELT $ 335)))
            ('T NIL)))))) 

(SDEFUN |RDEEFX;is_imaginary?!1| ((|c1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c1| (QREFELT $ 336)) (|spadConstant| $ 331)
                  (QREFELT $ 332))) 

(SDEFUN |RDEEFX;is_imaginary?!0| ((|c1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c1| (QREFELT $ 330)) (|spadConstant| $ 331)
                  (QREFELT $ 332))) 

(SDEFUN |RDEEFX;mk_erf;3F;49| ((|uc| F) (|ff| F) ($ F))
        (SPROG ((|uc2| (F)) (|uc1| (F)) (|s| (F)) (|im| (F)))
               (SEQ
                (COND
                 ((NULL (|RDEEFX;is_imaginary?| |uc| $))
                  (|RDEEFX;mk_erf1| |uc| |ff| $))
                 ('T
                  (SEQ
                   (LETT |im|
                         (SPADCALL (SPADCALL 0 1 (QREFELT $ 337))
                                   (QREFELT $ 338))
                         . #1=(|RDEEFX;mk_erf;3F;49|))
                   (LETT |uc1|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 2 (QREFELT $ 76)) |im|
                                      (QREFELT $ 67))
                            |uc| (QREFELT $ 67))
                           (SPADCALL (QREFELT $ 325)) (QREFELT $ 69))
                          (QREFELT $ 50))
                         . #1#)
                   (LETT |s| (|spadConstant| $ 33) . #1#)
                   (COND
                    ((SPADCALL |uc1| (SPADCALL |uc1| (QREFELT $ 50))
                               (QREFELT $ 339))
                     (SEQ
                      (LETT |s| (SPADCALL (|spadConstant| $ 33) (QREFELT $ 50))
                            . #1#)
                      (EXIT
                       (LETT |uc1| (SPADCALL |uc1| (QREFELT $ 50)) . #1#)))))
                   (LETT |uc2| (SPADCALL |uc1| (QREFELT $ 324)) . #1#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL 2 (QREFELT $ 76))
                               (SPADCALL
                                (SPADCALL (SPADCALL |uc2| |ff| (QREFELT $ 67))
                                          (QREFELT $ 340))
                                (SPADCALL (SPADCALL |im| |s| (QREFELT $ 67))
                                          (SPADCALL
                                           (SPADCALL |uc2| |ff| (QREFELT $ 67))
                                           (QREFELT $ 341))
                                          (QREFELT $ 67))
                                (QREFELT $ 79))
                               (QREFELT $ 67))
                     |uc2| (QREFELT $ 69))))))))) 

(SDEFUN |RDEEFX;mk_erf;3F;50| ((|uc| F) (|ff| F) ($ F))
        (|RDEEFX;mk_erf1| |uc| |ff| $)) 

(SDEFUN |RDEEFX;get_prims|
        ((|scand| |Record| (|:| |degree| (|Integer|))
          (|:| |factor| (|SparseUnivariatePolynomial| F)) (|:| |coeff| F)
          (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
          (|:| |alg_part| (|SparseUnivariatePolynomial| F))
          (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |u_part| F) (|:| |exponent| (|Integer|)) (|:| |shift_part| F))
         (|denf| |SparseUnivariatePolynomial| F)
         (|denf1| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|k| |Kernel| F) ($ |List| F))
        (SPROG
         ((|res| (|List| F)) (|f1| (F)) (#1=#:G1775 NIL) (|zz| NIL) (|f11| (F))
          (|ff| (F)) (|c1s| (F)) (|j1| (F)) (#2=#:G1774 NIL) (|j| NIL)
          (|nf2| (|Fraction| (|SparseUnivariatePolynomial| F))) (|lf| (F))
          (|l1| (|NonNegativeInteger|)) (#3=#:G1763 NIL) (|gpow| (|Integer|))
          (#4=#:G1761 NIL) (|zzl| (|List| F)) (|rf1k| (|Kernel| F)) (|rfc| (F))
          (|d| (|Integer|)) (|f| (F))
          (|nf| (|Fraction| (|SparseUnivariatePolynomial| F))) (|uc| (F))
          (|vshift| (F)) (|cfac| (|SparseUnivariatePolynomial| F))
          (|nn| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |nn| (QVELT |scand| 1) . #5=(|RDEEFX;get_prims|))
              (LETT |cfac| (QVELT |scand| 5) . #5#)
              (LETT |vshift| (QVELT |scand| 10) . #5#)
              (LETT |uc| (QVELT |scand| 2) . #5#)
              (LETT |nf| (QVELT |scand| 6) . #5#)
              (LETT |f| (SPADCALL |nf| |k| (QREFELT $ 62)) . #5#)
              (LETT |d| (QVELT |scand| 0) . #5#)
              (EXIT
               (COND
                ((EQL |d| 1)
                 (LIST
                  (SPADCALL
                   (SPADCALL (SPADCALL |vshift| (QREFELT $ 50))
                             (QREFELT $ 300))
                   (SPADCALL |f| (QREFELT $ 301)) (QREFELT $ 67))))
                ((SPADCALL |d| 1 (QREFELT $ 42))
                 (SEQ (LETT |rfc| (|spadConstant| $ 45) . #5#)
                      (COND
                       ((SPADCALL |cfac| (|spadConstant| $ 104)
                                  (QREFELT $ 111))
                        (SEQ
                         (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 217)) . #5#)
                         (EXIT
                          (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 289))
                                . #5#)))))
                      (LETT |zzl|
                            (COND
                             ((SPADCALL |cfac| (|spadConstant| $ 104)
                                        (QREFELT $ 113))
                              (LIST (|spadConstant| $ 45)))
                             (#6='T (SPADCALL |cfac| (QREFELT $ 302))))
                            . #5#)
                      (LETT |gpow|
                            (PROG2
                                (LETT #4# (SPADCALL |gexp| |d| (QREFELT $ 119))
                                      . #5#)
                                (QCDR #4#)
                              (|check_union2| (QEQCAR #4# 0) (|Integer|)
                                              (|Union| (|Integer|) "failed")
                                              #4#))
                            . #5#)
                      (LETT |l1|
                            (PROG1 (LETT #3# (- |d| 1) . #5#)
                              (|check_subtype2| (>= #3# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #3#))
                            . #5#)
                      (LETT |lf| (SPADCALL |d| (QREFELT $ 76)) . #5#)
                      (LETT |res| NIL . #5#)
                      (LETT |nf2| (QVELT |scand| 7) . #5#)
                      (SEQ (LETT |j| 1 . #5#) (LETT #2# |l1| . #5#) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ
                            (LETT |j1|
                                  (SPADCALL (SPADCALL |j| (QREFELT $ 76)) |lf|
                                            (QREFELT $ 69))
                                  . #5#)
                            (LETT |c1s|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |vshift| (QREFELT $ 50))
                                             (QREFELT $ 300))
                                   |lf| (QREFELT $ 69))
                                  . #5#)
                            (LETT |f1|
                                  (COND
                                   ((EQL (SPADCALL 2 |j| (QREFELT $ 343)) |d|)
                                    (SEQ
                                     (LETT |ff|
                                           (SPADCALL |nf2| |k| (QREFELT $ 62))
                                           . #5#)
                                     (EXIT
                                      (SPADCALL |c1s|
                                                (SPADCALL
                                                 (SPADCALL |uc| (QREFELT $ 50))
                                                 (SPADCALL |ff| |j|
                                                           (QREFELT $ 321))
                                                 (QREFELT $ 342))
                                                (QREFELT $ 67)))))
                                   ('T
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |c1s|
                                                (SPADCALL
                                                 (SPADCALL |uc| (QREFELT $ 50))
                                                 (SPADCALL |j1| (QREFELT $ 50))
                                                 (QREFELT $ 344))
                                                (QREFELT $ 67))
                                      (SPADCALL |j1|
                                                (SPADCALL |f| (QREFELT $ 50))
                                                (QREFELT $ 345))
                                      (QREFELT $ 67))
                                     (QREFELT $ 50))))
                                  . #5#)
                            (COND
                             ((SPADCALL |cfac| (|spadConstant| $ 104)
                                        (QREFELT $ 111))
                              (SEQ (LETT |f11| |f1| . #5#)
                                   (LETT |f1| (|spadConstant| $ 45) . #5#)
                                   (EXIT
                                    (SEQ (LETT |zz| NIL . #5#)
                                         (LETT #1# |zzl| . #5#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |zz| (CAR #1#) . #5#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |f1|
                                                 (SPADCALL |f1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |zz|
                                                                       (QREFELT
                                                                        $ 50))
                                                             (QREFELT $ 300))
                                                            (SPADCALL |f11|
                                                                      |rf1k|
                                                                      |zz|
                                                                      (QREFELT
                                                                       $ 70))
                                                            (QREFELT $ 67))
                                                           (QREFELT $ 75))
                                                 . #5#)))
                                         (LETT #1# (CDR #1#) . #5#) (GO G190)
                                         G191 (EXIT NIL))))))
                            (EXIT (LETT |res| (CONS |f1| |res|) . #5#)))
                           (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (NREVERSE |res|))))
                (#6# (|error| "unimplemented"))))))) 

(SDEFUN |RDEEFX;ei_int_diff|
        ((|f| F) (|g| F) (|gu| |Fraction| (|SparseUnivariatePolynomial| F))
         (|x| |Symbol|) (|k| |Kernel| F) (|lk| |List| (|Kernel| F))
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|nres2|
           #1=(|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                        (|:| |sol?| (|Boolean|))))
          (|g3u| #2=(|Fraction| (|SparseUnivariatePolynomial| F))) (|g3| (F))
          (|r1| (F)) (|dp1| (F)) (|p1| (F)) (|a1| (F)) (|k1f| (F))
          (|kdv| (|Kernel| F)) (|nres| #1#) (|g2| (F)) (|f2| (F)) (|dvf| (F))
          (|dv| (|Symbol|)) (|k1| (F)) (|args| (|List| F)) (|g1| (F))
          (|ngu| (|SparseUnivariatePolynomial| F)) (|fu| #2#))
         (SEQ
          (LETT |fu| (SPADCALL |f| |k| (QREFELT $ 36))
                . #3=(|RDEEFX;ei_int_diff|))
          (LETT |ngu| (SPADCALL |gu| (QREFELT $ 39)) . #3#)
          (COND
           ((OR
             (SPADCALL (SPADCALL |gu| (QREFELT $ 40)) (|spadConstant| $ 110)
                       (QREFELT $ 111))
             (OR (SPADCALL (SPADCALL |ngu| (QREFELT $ 41)) 1 (QREFELT $ 91))
                 (SPADCALL |fu|
                           (SPADCALL (SPADCALL |f| (QREFELT $ 47))
                                     (QREFELT $ 49))
                           (QREFELT $ 346))))
            (EXIT
             (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 45)
                     (|spadConstant| $ 45) NIL))))
          (LETT |g1| (SPADCALL |ngu| (QREFELT $ 105)) . #3#)
          (LETT |args| (SPADCALL |k| (QREFELT $ 28)) . #3#)
          (EXIT
           (COND
            ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 91))
             (|error| "internal error, k is not a diff"))
            (#4='T
             (SEQ
              (LETT |k1|
                    (SPADCALL (SPADCALL |args| 1 (QREFELT $ 30))
                              (SPADCALL (SPADCALL |args| 2 (QREFELT $ 30))
                                        (QREFELT $ 289))
                              (SPADCALL |args| 3 (QREFELT $ 30))
                              (QREFELT $ 70))
                    . #3#)
              (LETT |dv| (SPADCALL (QREFELT $ 59)) . #3#)
              (LETT |dvf| (SPADCALL |dv| (QREFELT $ 347)) . #3#)
              (LETT |f2| (SPADCALL |f| |k1| |dvf| (QREFELT $ 348)) . #3#)
              (LETT |g2| (SPADCALL |g1| |k1| |dvf| (QREFELT $ 348)) . #3#)
              (LETT |nres| (SPADCALL 1 |f2| |g2| |dv| (QREFELT $ 68)) . #3#)
              (COND
               ((NULL (QVELT |nres| 3))
                (EXIT
                 (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 45)
                         (|spadConstant| $ 45) NIL))))
              (LETT |kdv| (SPADCALL |dv| (QREFELT $ 60)) . #3#)
              (LETT |k1f| |k1| . #3#)
              (LETT |a1| (SPADCALL (QVELT |nres| 0) |kdv| |k1f| (QREFELT $ 70))
                    . #3#)
              (LETT |p1| (SPADCALL (QVELT |nres| 2) |kdv| |k1f| (QREFELT $ 70))
                    . #3#)
              (LETT |dp1|
                    (COND
                     ((SPADCALL |p1| (|spadConstant| $ 45) (QREFELT $ 80))
                      (|spadConstant| $ 45))
                     (#4#
                      (SPADCALL (SPADCALL |p1| |x| (QREFELT $ 299))
                                (SPADCALL |f| (QREFELT $ 300))
                                (QREFELT $ 69))))
                    . #3#)
              (LETT |r1|
                    (SPADCALL
                     (SPADCALL (SPADCALL |a1| |x| (QREFELT $ 299))
                               (SPADCALL |a1|
                                         (SPADCALL |f| |x| (QREFELT $ 299))
                                         (QREFELT $ 67))
                               (QREFELT $ 75))
                     |dp1| (QREFELT $ 75))
                    . #3#)
              (LETT |g3| (SPADCALL |g| |r1| (QREFELT $ 79)) . #3#)
              (EXIT
               (COND
                ((SPADCALL |g3| (|spadConstant| $ 45) (QREFELT $ 80))
                 (VECTOR |a1| |g| |p1| 'T))
                (#4#
                 (SEQ (LETT |g3u| (SPADCALL |g3| |k| (QREFELT $ 36)) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |g3u|
                                   (SPADCALL (SPADCALL |g3| (QREFELT $ 47))
                                             (QREFELT $ 49))
                                   (QREFELT $ 346))
                         (SEQ
                          (SPADCALL
                           "Failed to differentiate nres in ei_int_diff"
                           (QREFELT $ 351))
                          (EXIT
                           (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 45)
                                   (|spadConstant| $ 45) NIL))))
                        (#4#
                         (SEQ
                          (LETT |nres2|
                                (SPADCALL 1 |f| |g3| |x| (QREFELT $ 68)) . #3#)
                          (EXIT
                           (VECTOR
                            (SPADCALL (QVELT |nres2| 0) |a1| (QREFELT $ 75))
                            (SPADCALL (QVELT |nres2| 1) |r1| (QREFELT $ 75))
                            (SPADCALL (QVELT |nres2| 2) |p1| (QREFELT $ 75))
                            (QVELT |nres2| 3)))))))))))))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;53|
        ((|n| |Integer|) (|f| F) (|g| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|res3|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|res6|
           #1=(|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                        (|:| |sol?| (|Boolean|))))
          (#2=#:G1866 NIL) (|r1| (F)) (|ansp| (F)) (|a1| (F))
          (|res4|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|f1| (F)) (|u| (F)) (|rc| (|Integer|))
          (|rcu2| (|Union| (|Integer|) #3="failed"))
          (|rcq| (|Fraction| (|Integer|)))
          (|rcu1| (|Union| (|Fraction| (|Integer|)) "failed")) (|lc| (F))
          (|rr1f| (F)) (#4=#:G1864 NIL) (|aa| (F)) (|res7| #1#)
          (#5=#:G1865 NIL) (|ff| (F))
          (|spec1p| (|SparseUnivariatePolynomial| F)) (|gj| (F)) (|j| NIL)
          (|dkf| (F)) (|kf| (F)) (|d| #6=(|NonNegativeInteger|))
          (|spec1u| #7=(|Union| (|SparseUnivariatePolynomial| F) #3#))
          (|log_recursion| (|Boolean|))
          (|scoeffs| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|derivation3|
           (|Mapping| (|Fraction| (|SparseUnivariatePolynomial| F))
                      (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|scands|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|rr1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|her2|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|ndenf| #8=(|SparseUnivariatePolynomial| F))
          (|denf_split|
           (|Record| (|:| |normal| #8#)
                     (|:| |special| (|SparseUnivariatePolynomial| F))))
          (|derivation2|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|gexp| (|Integer|)) (|gden1| (|SparseUnivariatePolynomial| F))
          (|#G426|
           (|Record| (|:| |radicand| (|SparseUnivariatePolynomial| F))
                     (|:| |exponent| (|Integer|))))
          (|res5|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|lp1u| #7#) (|lp| #9=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|ulst| (|List| F)) (#10=#:G1874 NIL) (|kk| NIL) (#11=#:G1873 NIL)
          (|vlst| (|List| F)) (#12=#:G1872 NIL) (#13=#:G1871 NIL)
          (|lk1| (|List| (|Kernel| F))) (#14=#:G1870 NIL) (#15=#:G1869 NIL)
          (|ng| (|SparseUnivariatePolynomial| F)) (|degs| #6#)
          (|ds| #16=(|SparseUnivariatePolynomial| F))
          (|nf| #17=(|SparseUnivariatePolynomial| F)) (|denf| #16#)
          (|fu| #18=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lnum| #17#) (|lden| #16#)
          (|her|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |logpart| #9#)
            (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |polypart| (|SparseUnivariatePolynomial| F))))
          (|derivation|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|nfp| #17#) (|denfp| #16#) (|dk| #17#) (|dku| #18#) (|gu| #18#)
          (|fpu| #18#) (|lk| (|List| (|Kernel| F))) (#19=#:G1868 NIL)
          (#20=#:G1867 NIL) (|k| (|Kernel| F)) (|fp| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lk|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |f| (QREFELT $ 319))
                              (SPADCALL |g| (QREFELT $ 319)) (QREFELT $ 16))
                    |x| (QREFELT $ 15))
                   (LIST (SPADCALL |x| (QREFELT $ 60))) (QREFELT $ 16))
                  . #21=(|RDEEFX;ei_int;I2FSR;53|))
            (LETT |f| (SPADCALL |n| |f| (QREFELT $ 352)) . #21#)
            (LETT |fp| (SPADCALL |f| |x| (QREFELT $ 64)) . #21#)
            (EXIT
             (COND
              ((SPADCALL |fp| (|spadConstant| $ 45) (QREFELT $ 80))
               (SPADCALL |f| |g| |x| |lk| (QREFELT $ 58)))
              (#22='T
               (SEQ (LETT |k| (|RDEEFX;top_kernel| |f| |g| |x| $) . #21#)
                    (LETT |lk|
                          (PROGN
                           (LETT #20# NIL . #21#)
                           (SEQ (LETT |kk| NIL . #21#) (LETT #19# |lk| . #21#)
                                G190
                                (COND
                                 ((OR (ATOM #19#)
                                      (PROGN
                                       (LETT |kk| (CAR #19#) . #21#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL |kk| |k| (QREFELT $ 320))
                                    (LETT #20# (CONS |kk| #20#) . #21#)))))
                                (LETT #19# (CDR #19#) . #21#) (GO G190) G191
                                (EXIT (NREVERSE #20#))))
                          . #21#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |k| (QREFELT $ 25)) (QREFELT $ 8)
                                 (QREFELT $ 26))
                       (|RDEEFX;ei_int_alg| 1 |f| |g| |x| |k| |lk| $))
                      (#22#
                       (SEQ
                        (LETT |fpu| (SPADCALL |fp| |k| (QREFELT $ 36)) . #21#)
                        (LETT |gu| (SPADCALL |g| |k| (QREFELT $ 36)) . #21#)
                        (EXIT
                         (COND
                          ((SPADCALL |k| '|%diff| (QREFELT $ 23))
                           (|RDEEFX;ei_int_diff| |f| |g| |gu| |x| |k| |lk| $))
                          (#22#
                           (SEQ
                            (LETT |dku|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |k| (QREFELT $ 63)) |x|
                                             (QREFELT $ 299))
                                   |k| (QREFELT $ 36))
                                  . #21#)
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |dku| (QREFELT $ 40))
                                         (|spadConstant| $ 110)
                                         (QREFELT $ 111))
                               (VECTOR (|spadConstant| $ 45)
                                       (|spadConstant| $ 45)
                                       (|spadConstant| $ 45) NIL))
                              (#22#
                               (SEQ
                                (LETT |dk| (SPADCALL |dku| (QREFELT $ 39))
                                      . #21#)
                                (LETT |denfp| (SPADCALL |fpu| (QREFELT $ 40))
                                      . #21#)
                                (LETT |nfp| (SPADCALL |fpu| (QREFELT $ 39))
                                      . #21#)
                                (LETT |derivation|
                                      (CONS #'|RDEEFX;ei_int;I2FSR;53!1|
                                            (VECTOR |dk| |x| $ |denfp|))
                                      . #21#)
                                (LETT |her|
                                      (SPADCALL
                                       (SPADCALL |denfp| |gu| (QREFELT $ 247))
                                       |derivation| |nfp| (QREFELT $ 356))
                                      . #21#)
                                (LETT |lp| (QVELT |her| 1) . #21#)
                                (LETT |a1|
                                      (SPADCALL (QVELT |her| 0) |k|
                                                (QREFELT $ 62))
                                      . #21#)
                                (LETT |rr1|
                                      (SPADCALL
                                       (SPADCALL |lp|
                                                 (SPADCALL (QVELT |her| 3)
                                                           (QREFELT $ 49))
                                                 (QREFELT $ 304))
                                       (QVELT |her| 2) (QREFELT $ 304))
                                      . #21#)
                                (LETT |rr1|
                                      (SPADCALL |rr1|
                                                (SPADCALL |denfp|
                                                          (QREFELT $ 49))
                                                (QREFELT $ 52))
                                      . #21#)
                                (LETT |r1|
                                      (SPADCALL |g|
                                                (SPADCALL |rr1| |k|
                                                          (QREFELT $ 62))
                                                (QREFELT $ 79))
                                      . #21#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |rr1| (|spadConstant| $ 199)
                                             (QREFELT $ 317))
                                   (VECTOR |a1| |g| (|spadConstant| $ 45) 'T))
                                  (#22#
                                   (SEQ
                                    (LETT |lden| (SPADCALL |lp| (QREFELT $ 40))
                                          . #21#)
                                    (LETT |lnum| (SPADCALL |lp| (QREFELT $ 39))
                                          . #21#)
                                    (LETT |fu|
                                          (SPADCALL |f| |k| (QREFELT $ 36))
                                          . #21#)
                                    (LETT |denf| (SPADCALL |fu| (QREFELT $ 40))
                                          . #21#)
                                    (LETT |nf| (SPADCALL |fu| (QREFELT $ 39))
                                          . #21#)
                                    (COND
                                     ((SPADCALL |denf| (|spadConstant| $ 110)
                                                (QREFELT $ 113))
                                      (COND
                                       ((EQL (SPADCALL |nf| (QREFELT $ 41)) 0)
                                        (COND
                                         ((SPADCALL |k| '|exp| (QREFELT $ 23))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |lp|
                                                       (|spadConstant| $ 199)
                                                       (QREFELT $ 346))
                                             (VECTOR |a1| |r1|
                                                     (|spadConstant| $ 45)
                                                     NIL))
                                            (#22#
                                             (SEQ
                                              (LETT |ds|
                                                    (SPADCALL (QVELT |her| 2)
                                                              (QREFELT $ 40))
                                                    . #21#)
                                              (COND
                                               ((OR
                                                 (SPADCALL
                                                  (SPADCALL |ds|
                                                            (QREFELT $ 112))
                                                  (|spadConstant| $ 104)
                                                  (QREFELT $ 111))
                                                 (SPADCALL
                                                  (SPADCALL |ds|
                                                            (QREFELT $ 105))
                                                  (|spadConstant| $ 33)
                                                  (QREFELT $ 132)))
                                                (EXIT
                                                 (|error|
                                                  "unexpected special part"))))
                                              (LETT |degs|
                                                    (SPADCALL |ds|
                                                              (QREFELT $ 41))
                                                    . #21#)
                                              (LETT |ng|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (|spadConstant| $ 33)
                                                       |degs| (QREFELT $ 46))
                                                      (QVELT |her| 3)
                                                      (QREFELT $ 99))
                                                     (SPADCALL (QVELT |her| 2)
                                                               (QREFELT $ 39))
                                                     (QREFELT $ 51))
                                                    . #21#)
                                              (LETT |res5|
                                                    (|RDEEFX;ei_int_exp| |f|
                                                     |ng| |degs| |x| |k| $)
                                                    . #21#)
                                              (LETT |a1|
                                                    (SPADCALL |a1|
                                                              (QVELT |res5| 0)
                                                              (QREFELT $ 75))
                                                    . #21#)
                                              (LETT |r1|
                                                    (SPADCALL |r1|
                                                              (QVELT |res5| 1)
                                                              (QREFELT $ 75))
                                                    . #21#)
                                              (EXIT
                                               (VECTOR |a1| |r1|
                                                       (QVELT |res5| 2)
                                                       (QVELT |res5|
                                                              3)))))))))))))
                                    (LETT |lk1|
                                          (PROGN
                                           (LETT #15# NIL . #21#)
                                           (SEQ (LETT |kk| NIL . #21#)
                                                (LETT #14# (CONS |k| |lk|)
                                                      . #21#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #14#)
                                                      (PROGN
                                                       (LETT |kk| (CAR #14#)
                                                             . #21#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (COND
                                                   ((COND
                                                     ((SPADCALL |kk| '|log|
                                                                (QREFELT $ 23))
                                                      'T)
                                                     (#22#
                                                      (SPADCALL |kk| '|exp|
                                                                (QREFELT $
                                                                         23))))
                                                    (LETT #15# (CONS |kk| #15#)
                                                          . #21#)))))
                                                (LETT #14# (CDR #14#) . #21#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #15#))))
                                          . #21#)
                                    (LETT |vlst|
                                          (PROGN
                                           (LETT #13# NIL . #21#)
                                           (SEQ (LETT |kk| NIL . #21#)
                                                (LETT #12# |lk1| . #21#) G190
                                                (COND
                                                 ((OR (ATOM #12#)
                                                      (PROGN
                                                       (LETT |kk| (CAR #12#)
                                                             . #21#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #13#
                                                        (CONS
                                                         (COND
                                                          ((SPADCALL |kk|
                                                                     '|log|
                                                                     (QREFELT $
                                                                              23))
                                                           (SPADCALL |kk|
                                                                     (QREFELT $
                                                                              63)))
                                                          ('T
                                                           (SPADCALL
                                                            (SPADCALL |kk|
                                                                      (QREFELT
                                                                       $ 28))
                                                            1 (QREFELT $ 30))))
                                                         #13#)
                                                        . #21#)))
                                                (LETT #12# (CDR #12#) . #21#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #13#))))
                                          . #21#)
                                    (LETT |ulst|
                                          (PROGN
                                           (LETT #11# NIL . #21#)
                                           (SEQ (LETT |kk| NIL . #21#)
                                                (LETT #10# |lk1| . #21#) G190
                                                (COND
                                                 ((OR (ATOM #10#)
                                                      (PROGN
                                                       (LETT |kk| (CAR #10#)
                                                             . #21#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #11#
                                                        (CONS
                                                         (COND
                                                          ((SPADCALL |kk|
                                                                     '|log|
                                                                     (QREFELT $
                                                                              23))
                                                           (SPADCALL
                                                            (SPADCALL |kk|
                                                                      (QREFELT
                                                                       $ 28))
                                                            1 (QREFELT $ 30)))
                                                          ('T
                                                           (SPADCALL |kk|
                                                                     (QREFELT $
                                                                              63))))
                                                         #11#)
                                                        . #21#)))
                                                (LETT #10# (CDR #10#) . #21#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #11#))))
                                          . #21#)
                                    (LETT |ar1|
                                          (|RDEEFX;handle_logpart| |lnum|
                                           |lden| |nf| |denf| |nfp| |denfp| |k|
                                           |vlst| |ulst| |x| $)
                                          . #21#)
                                    (LETT |ansp| (QVELT |ar1| 0) . #21#)
                                    (LETT |lp|
                                          (SPADCALL |lp| (QVELT |ar1| 1)
                                                    (QREFELT $ 246))
                                          . #21#)
                                    (QSETVELT |her| 2
                                              (SPADCALL (QVELT |her| 2)
                                                        (QVELT |ar1| 3)
                                                        (QREFELT $ 246)))
                                    (QSETVELT |her| 3
                                              (SPADCALL (QVELT |her| 3)
                                                        (QVELT |ar1| 2)
                                                        (QREFELT $ 48)))
                                    (LETT |lp1u|
                                          (SPADCALL |lp| (QREFELT $ 241))
                                          . #21#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |lp1u| 1)
                                       (VECTOR |a1| |r1| (|spadConstant| $ 45)
                                               NIL))
                                      (#22#
                                       (SEQ
                                        (QSETVELT |her| 3
                                                  (SPADCALL (QVELT |her| 3)
                                                            (QCDR |lp1u|)
                                                            (QREFELT $ 51)))
                                        (COND
                                         ((SPADCALL (QVELT |her| 3)
                                                    (|spadConstant| $ 104)
                                                    (QREFELT $ 113))
                                          (COND
                                           ((SPADCALL (QVELT |her| 2)
                                                      (|spadConstant| $ 199)
                                                      (QREFELT $ 317))
                                            (EXIT
                                             (VECTOR |a1| |g| |ansp| 'T))))))
                                        (COND
                                         ((SPADCALL |denf|
                                                    (|spadConstant| $ 110)
                                                    (QREFELT $ 113))
                                          (COND
                                           ((EQL (SPADCALL |nf| (QREFELT $ 41))
                                                 0)
                                            (COND
                                             ((OR
                                               (SPADCALL |k| '|log|
                                                         (QREFELT $ 23))
                                               (SPADCALL
                                                (SPADCALL |k| (QREFELT $ 25))
                                                (QREFELT $ 9) (QREFELT $ 26)))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |lp|
                                                           (|spadConstant| $
                                                                           199)
                                                           (QREFELT $ 346))
                                                 (VECTOR |a1| |r1|
                                                         (|spadConstant| $ 45)
                                                         NIL))
                                                ((SPADCALL (QVELT |her| 2)
                                                           (|spadConstant| $
                                                                           199)
                                                           (QREFELT $ 346))
                                                 (|error|
                                                  "unexpected special part"))
                                                (#22#
                                                 (SEQ
                                                  (LETT |res5|
                                                        (|RDEEFX;ei_int_log|
                                                         |f| (QVELT |her| 3)
                                                         |x| |k| $)
                                                        . #21#)
                                                  (LETT |a1|
                                                        (SPADCALL |a1|
                                                                  (QVELT |res5|
                                                                         0)
                                                                  (QREFELT $
                                                                           75))
                                                        . #21#)
                                                  (LETT |r1|
                                                        (SPADCALL |r1|
                                                                  (QVELT |res5|
                                                                         1)
                                                                  (QREFELT $
                                                                           75))
                                                        . #21#)
                                                  (EXIT
                                                   (VECTOR |a1| |r1|
                                                           (SPADCALL |ansp|
                                                                     (QVELT
                                                                      |res5| 2)
                                                                     (QREFELT $
                                                                              75))
                                                           (QVELT |res5|
                                                                  3)))))))))))))
                                        (LETT |rr1|
                                              (SPADCALL
                                               (SPADCALL (QVELT |her| 3)
                                                         (QREFELT $ 49))
                                               (QVELT |her| 2) (QREFELT $ 304))
                                              . #21#)
                                        (LETT |rr1|
                                              (SPADCALL |rr1|
                                                        (SPADCALL |denfp|
                                                                  (QREFELT $
                                                                           49))
                                                        (QREFELT $ 52))
                                              . #21#)
                                        (PROGN
                                         (LETT |#G426|
                                               (|RDEEFX;gamma_denominator|
                                                |denf| |k| $)
                                               . #21#)
                                         (LETT |gden1| (QCAR |#G426|) . #21#)
                                         (LETT |gexp| (QCDR |#G426|) . #21#)
                                         |#G426|)
                                        (LETT |derivation2|
                                              (CONS
                                               #'|RDEEFX;ei_int;I2FSR;53!3|
                                               (VECTOR |dk| |x| $))
                                              . #21#)
                                        (LETT |denf_split|
                                              (SPADCALL |denf| |derivation2|
                                                        (QREFELT $ 359))
                                              . #21#)
                                        (LETT |ndenf| (QCAR |denf_split|)
                                              . #21#)
                                        (LETT |her2|
                                              (|RDEEFX;special_Hermite| |rr1|
                                               |nfp| |ndenf| |denfp|
                                               |derivation2| $)
                                              . #21#)
                                        (LETT |a1|
                                              (SPADCALL |a1|
                                                        (SPADCALL (QCAR |her2|)
                                                                  |k|
                                                                  (QREFELT $
                                                                           62))
                                                        (QREFELT $ 75))
                                              . #21#)
                                        (LETT |rr1| (QCDR |her2|) . #21#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |rr1|
                                                     (|spadConstant| $ 199)
                                                     (QREFELT $ 317))
                                           (VECTOR |a1| |g| |ansp| 'T))
                                          (#22#
                                           (SEQ
                                            (COND
                                             ((SPADCALL |denf|
                                                        (|spadConstant| $ 110)
                                                        (QREFELT $ 113))
                                              (COND
                                               ((EQL
                                                 (SPADCALL |nf| (QREFELT $ 41))
                                                 2)
                                                (COND
                                                 ((SPADCALL |k| '|log|
                                                            (QREFELT $ 23))
                                                  (EXIT
                                                   (|RDEEFX;quadratic_log_erf_integrate|
                                                    |nf| |nfp| |rr1| |a1| |g|
                                                    |ansp| |derivation| |vlst|
                                                    |ulst| |k| |lk| |x|
                                                    $))))))))
                                            (LETT |scands|
                                                  (|RDEEFX;special_candidates|
                                                   |nf| |denf| |gden1| |gexp|
                                                   |vlst| |ulst| |k| |x| $)
                                                  . #21#)
                                            (LETT |derivation3|
                                                  (CONS
                                                   #'|RDEEFX;ei_int;I2FSR;53!4|
                                                   (VECTOR |derivation2| $))
                                                  . #21#)
                                            (LETT |scoeffs|
                                                  (|RDEEFX;get_scoeffs|
                                                   |scands| |denf| |k|
                                                   |derivation3| $)
                                                  . #21#)
                                            (LETT |rr1f|
                                                  (SPADCALL |rr1| |k|
                                                            (QREFELT $ 62))
                                                  . #21#)
                                            (LETT |r1|
                                                  (SPADCALL |g| |rr1f|
                                                            (QREFELT $ 79))
                                                  . #21#)
                                            (LETT |log_recursion| NIL . #21#)
                                            (COND
                                             ((SPADCALL |denf|
                                                        (|spadConstant| $ 110)
                                                        (QREFELT $ 113))
                                              (COND
                                               ((SPADCALL |k| '|log|
                                                          (QREFELT $ 23))
                                                (COND
                                                 ((EQL
                                                   (SPADCALL |nf|
                                                             (QREFELT $ 41))
                                                   1)
                                                  (SEQ
                                                   (LETT |lc|
                                                         (SPADCALL |nf|
                                                                   (QREFELT $
                                                                            105))
                                                         . #21#)
                                                   (LETT |rcu1|
                                                         (SPADCALL |lc|
                                                                   (QREFELT $
                                                                            160))
                                                         . #21#)
                                                   (EXIT
                                                    (LETT |log_recursion|
                                                          (QEQCAR |rcu1| 0)
                                                          . #21#)))))))))
                                            (EXIT
                                             (COND
                                              (|log_recursion|
                                               (SEQ
                                                (COND
                                                 (|log_recursion|
                                                  (SEQ
                                                   (LETT |spec1u|
                                                         (SPADCALL |rr1|
                                                                   (QREFELT $
                                                                            241))
                                                         . #21#)
                                                   (EXIT
                                                    (COND
                                                     ((QEQCAR |spec1u| 1)
                                                      (|error| "impossible 9"))
                                                     (#22#
                                                      (SEQ
                                                       (LETT |spec1p|
                                                             (QCDR |spec1u|)
                                                             . #21#)
                                                       (LETT |d|
                                                             (SPADCALL |spec1p|
                                                                       (QREFELT
                                                                        $ 41))
                                                             . #21#)
                                                       (LETT |aa|
                                                             (|spadConstant| $
                                                                             45)
                                                             . #21#)
                                                       (LETT |kf|
                                                             (SPADCALL |k|
                                                                       (QREFELT
                                                                        $ 63))
                                                             . #21#)
                                                       (LETT |dkf|
                                                             (SPADCALL |dk|
                                                                       (QREFELT
                                                                        $ 204))
                                                             . #21#)
                                                       (SEQ
                                                        (EXIT
                                                         (SEQ
                                                          (LETT |j| |d| . #21#)
                                                          G190
                                                          (COND
                                                           ((< |j| 0)
                                                            (GO G191)))
                                                          (SEQ
                                                           (LETT |gj|
                                                                 (|spadConstant|
                                                                  $ 45)
                                                                 . #21#)
                                                           (COND
                                                            ((EQL |j|
                                                                  (SPADCALL
                                                                   |spec1p|
                                                                   (QREFELT $
                                                                            41)))
                                                             (SEQ
                                                              (LETT |gj|
                                                                    (SPADCALL
                                                                     |spec1p|
                                                                     (QREFELT $
                                                                              105))
                                                                    . #21#)
                                                              (EXIT
                                                               (LETT |spec1p|
                                                                     (SPADCALL
                                                                      |spec1p|
                                                                      (QREFELT
                                                                       $ 112))
                                                                     . #21#)))))
                                                           (LETT |ff|
                                                                 (SPADCALL |gj|
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (+
                                                                               |j|
                                                                               1)
                                                                              (QREFELT
                                                                               $
                                                                               76))
                                                                             |dkf|
                                                                             (QREFELT
                                                                              $
                                                                              67))
                                                                            |aa|
                                                                            (QREFELT
                                                                             $
                                                                             67))
                                                                           (QREFELT
                                                                            $
                                                                            79))
                                                                 . #21#)
                                                           (EXIT
                                                            (COND
                                                             ((EQL |j| 0)
                                                              (PROGN
                                                               (LETT #5#
                                                                     |$NoValue|
                                                                     . #21#)
                                                               (GO
                                                                #23=#:G1843)))
                                                             ('T
                                                              (SEQ
                                                               (EXIT
                                                                (SEQ
                                                                 (LETT |res7|
                                                                       (SPADCALL
                                                                        |f|
                                                                        |ff|
                                                                        |x|
                                                                        (CONS
                                                                         |k|
                                                                         |lk|)
                                                                        (QREFELT
                                                                         $ 58))
                                                                       . #21#)
                                                                 (LETT |aa|
                                                                       (QVELT
                                                                        |res7|
                                                                        0)
                                                                       . #21#)
                                                                 (LETT |a1|
                                                                       (SPADCALL
                                                                        |a1|
                                                                        (SPADCALL
                                                                         |aa|
                                                                         (SPADCALL
                                                                          |kf|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           321))
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (QREFELT
                                                                         $ 75))
                                                                       . #21#)
                                                                 (LETT |r1|
                                                                       (SPADCALL
                                                                        |r1|
                                                                        (SPADCALL
                                                                         (QVELT
                                                                          |res7|
                                                                          1)
                                                                         (SPADCALL
                                                                          |kf|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           321))
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (QREFELT
                                                                         $ 75))
                                                                       . #21#)
                                                                 (EXIT
                                                                  (COND
                                                                   ((NULL
                                                                     (QVELT
                                                                      |res7|
                                                                      3))
                                                                    (PROGN
                                                                     (LETT #4#
                                                                           (PROGN
                                                                            (LETT
                                                                             #2#
                                                                             (VECTOR
                                                                              |a1|
                                                                              |r1|
                                                                              |ansp|
                                                                              (QVELT
                                                                               |res7|
                                                                               3))
                                                                             . #21#)
                                                                            (GO
                                                                             #24=#:G1863))
                                                                           . #21#)
                                                                     (GO
                                                                      #25=#:G1841)))))))
                                                               #25#
                                                               (EXIT #4#))))))
                                                          (LETT |j| (+ |j| -1)
                                                                . #21#)
                                                          (GO G190) G191
                                                          (EXIT NIL)))
                                                        #23# (EXIT #5#))
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL |ff|
                                                                    (|spadConstant|
                                                                     $ 45)
                                                                    (QREFELT $
                                                                             80))
                                                          (PROGN
                                                           (LETT #2#
                                                                 (VECTOR |a1|
                                                                         |r1|
                                                                         |ansp|
                                                                         'T)
                                                                 . #21#)
                                                           (GO #24#)))
                                                         (#22#
                                                          (SEQ
                                                           (LETT |rr1f| |ff|
                                                                 . #21#)
                                                           (LETT |lc|
                                                                 (SPADCALL |nf|
                                                                           (QREFELT
                                                                            $
                                                                            105))
                                                                 . #21#)
                                                           (LETT |rcu1|
                                                                 (SPADCALL |lc|
                                                                           (QREFELT
                                                                            $
                                                                            160))
                                                                 . #21#)
                                                           (EXIT
                                                            (COND
                                                             ((QEQCAR |rcu1| 1)
                                                              "skip")
                                                             (#22#
                                                              (SEQ
                                                               (LETT |rcq|
                                                                     (QCDR
                                                                      |rcu1|)
                                                                     . #21#)
                                                               (LETT |rcu2|
                                                                     (SPADCALL
                                                                      |rcq|
                                                                      (QREFELT
                                                                       $ 192))
                                                                     . #21#)
                                                               (EXIT
                                                                (COND
                                                                 ((QEQCAR
                                                                   |rcu2| 1)
                                                                  "skip")
                                                                 (#22#
                                                                  (SEQ
                                                                   (LETT |rc|
                                                                         (QCDR
                                                                          |rcu2|)
                                                                         . #21#)
                                                                   (LETT |u|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |k|
                                                                            (QREFELT
                                                                             $
                                                                             28))
                                                                           1
                                                                           (QREFELT
                                                                            $
                                                                            30))
                                                                          |rc|
                                                                          (QREFELT
                                                                           $
                                                                           81))
                                                                         . #21#)
                                                                   (LETT |f1|
                                                                         (SPADCALL
                                                                          |nf|
                                                                          0
                                                                          (QREFELT
                                                                           $
                                                                           43))
                                                                         . #21#)
                                                                   (LETT |res4|
                                                                         (SPADCALL
                                                                          1
                                                                          |f1|
                                                                          (SPADCALL
                                                                           |rr1f|
                                                                           |u|
                                                                           (QREFELT
                                                                            $
                                                                            67))
                                                                          |x|
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                         . #21#)
                                                                   (LETT |a1|
                                                                         (SPADCALL
                                                                          |a1|
                                                                          (SPADCALL
                                                                           (QVELT
                                                                            |res4|
                                                                            0)
                                                                           |u|
                                                                           (QREFELT
                                                                            $
                                                                            69))
                                                                          (QREFELT
                                                                           $
                                                                           75))
                                                                         . #21#)
                                                                   (LETT |ansp|
                                                                         (SPADCALL
                                                                          |ansp|
                                                                          (QVELT
                                                                           |res4|
                                                                           2)
                                                                          (QREFELT
                                                                           $
                                                                           75))
                                                                         . #21#)
                                                                   (LETT |r1|
                                                                         (SPADCALL
                                                                          |r1|
                                                                          (SPADCALL
                                                                           (QVELT
                                                                            |res4|
                                                                            1)
                                                                           |u|
                                                                           (QREFELT
                                                                            $
                                                                            69))
                                                                          (QREFELT
                                                                           $
                                                                           75))
                                                                         . #21#)
                                                                   (EXIT
                                                                    (PROGN
                                                                     (LETT #2#
                                                                           (VECTOR
                                                                            |a1|
                                                                            |r1|
                                                                            |ansp|
                                                                            (QVELT
                                                                             |res4|
                                                                             3))
                                                                           . #21#)
                                                                     (GO
                                                                      #24#))))))))))))))))))))))
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL |r1| |g|
                                                             (QREFELT $ 80))
                                                   (VECTOR |a1| |g| |ansp| 'T))
                                                  (#22#
                                                   (SEQ
                                                    (LETT |res6|
                                                          (SPADCALL |f| |rr1f|
                                                                    |x|
                                                                    (CONS |k|
                                                                          |lk|)
                                                                    (QREFELT $
                                                                             58))
                                                          . #21#)
                                                    (EXIT
                                                     (VECTOR
                                                      (SPADCALL |a1|
                                                                (QVELT |res6|
                                                                       0)
                                                                (QREFELT $ 75))
                                                      (SPADCALL |r1|
                                                                (QVELT |res6|
                                                                       1)
                                                                (QREFELT $ 75))
                                                      |ansp|
                                                      (QVELT |res6| 3)))))))))
                                              (#22#
                                               (SEQ
                                                (LETT |res3|
                                                      (|RDEEFX;special_integrate2|
                                                       |nfp| |denfp| |denf|
                                                       |ndenf| |f| |k| |lk| |x|
                                                       |rr1| |a1| |r1| |g|
                                                       |scoeffs| |scands|
                                                       |gexp| $)
                                                      . #21#)
                                                (EXIT
                                                 (VECTOR
                                                  (SPADCALL |a1|
                                                            (QVELT |res3| 0)
                                                            (QREFELT $ 75))
                                                  (SPADCALL |r1|
                                                            (QVELT |res3| 1)
                                                            (QREFELT $ 75))
                                                  (SPADCALL |ansp|
                                                            (QVELT |res3| 2)
                                                            (QREFELT $ 75))
                                                  (QVELT |res3|
                                                         3)))))))))))))))))))))))))))))))))))))
          #24# (EXIT #2#)))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;53!4| ((|z1| NIL) ($$ NIL))
        (PROG ($ |derivation2|)
          (LETT $ (QREFELT $$ 1) . #1=(|RDEEFX;ei_int;I2FSR;53|))
          (LETT |derivation2| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT $ 39)) |derivation2|)
                        (SPADCALL |z1| (QREFELT $ 40)) (QREFELT $ 99))
              (SPADCALL (SPADCALL |z1| (QREFELT $ 39))
                        (SPADCALL (SPADCALL |z1| (QREFELT $ 40)) |derivation2|)
                        (QREFELT $ 99))
              (QREFELT $ 48))
             (SPADCALL (SPADCALL |z1| (QREFELT $ 40))
                       (SPADCALL |z1| (QREFELT $ 40)) (QREFELT $ 99))
             (QREFELT $ 198)))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;53!3| ((|z1| NIL) ($$ NIL))
        (PROG ($ |x| |dk|)
          (LETT $ (QREFELT $$ 2) . #1=(|RDEEFX;ei_int;I2FSR;53|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |z1|
                             (CONS #'|RDEEFX;ei_int;I2FSR;53!2| (VECTOR $ |x|))
                             |dk| (QREFELT $ 353))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;53!2| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 299)))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;53!1| ((|z1| NIL) ($$ NIL))
        (PROG (|denfp| $ |x| |dk|)
          (LETT |denfp| (QREFELT $$ 3) . #1=(|RDEEFX;ei_int;I2FSR;53|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |denfp|
                             (SPADCALL |z1|
                                       (CONS #'|RDEEFX;ei_int;I2FSR;53!0|
                                             (VECTOR $ |x|))
                                       |dk| (QREFELT $ 353))
                             (QREFELT $ 99))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;53!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 299)))))) 

(DECLAIM (NOTINLINE |ElementaryRischDEX;|)) 

(DEFUN |ElementaryRischDEX| (&REST #1=#:G1875)
  (SPROG NIL
         (PROG (#2=#:G1876)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryRischDEX|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryRischDEX|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ElementaryRischDEX;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryRischDEX|)))))))))) 

(DEFUN |ElementaryRischDEX;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryRischDEX|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ElementaryRischDEX| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 360) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ElementaryRischDEX|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|%alg|)
          (QSETREFV $ 9 '|prim|)
          (QSETREFV $ 94 (SPADCALL (QREFELT $ 93)))
          (COND
           ((|domainEqual| |#1| (|Complex| (|Integer|)))
            (PROGN
             (QSETREFV $ 342
                       (CONS (|dispatchFunction| |RDEEFX;mk_erf;3F;49|) $))))
           ('T
            (QSETREFV $ 342
                      (CONS (|dispatchFunction| |RDEEFX;mk_erf;3F;50|) $))))
          $))) 

(MAKEPROP '|ElementaryRischDEX| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              'PRIM (|List| 35) (0 . |kernels|) (|List| 18) (|Symbol|)
              (|IntegrationTools| 6 7) (5 . |varselect|) (11 . |union|)
              (|NonNegativeInteger|) (|Kernel| 7) (17 . |height|) (|Boolean|)
              (22 . |member?|) (28 . >) (34 . |is?|) (|BasicOperator|)
              (40 . |operator|) (45 . |has?|) (|List| 7) (51 . |argument|)
              (|Integer|) (56 . |elt|) (62 . |retract|) (67 . |One|)
              (71 . |One|) (|Fraction| 176) (|Kernel| $) (75 . |univariate|)
              (|SparseUnivariatePolynomial| 7) (|Fraction| 37) (81 . |numer|)
              (86 . |denom|) (91 . |degree|) (96 . >) (102 . |coefficient|)
              (108 . |Zero|) (112 . |Zero|) (116 . |monomial|) (122 . |coerce|)
              (127 . -) (133 . |coerce|) (138 . -) (143 . +) (149 . /)
              (155 . |kmax|) (|Union| 13 '"failed") (160 . |symbolIfCan|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |primpart| 7)
                        (|:| |sol?| 20))
              (|ElementaryRischDEX2| 6 7) (165 . |do_risch_DE|) (173 . |new|)
              (177 . |kernel|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 18) 18
                                                     6 135 7)
              (182 . |multivariate|) (188 . |coerce|) (193 . D) (|List| $)
              (199 . |eval|) (206 . *) |RDEEFX;ei_int;I2FSR;53| (212 . /)
              (218 . |eval|) (|SparseUnivariatePolynomial| 37) (|Mapping| 37 7)
              (|SparseUnivariatePolynomialFunctions2| 7 37) (225 . |map|)
              (231 . +) (237 . |coerce|) (|Mapping| 7 7 7) (242 . |reduce|)
              (249 . -) (255 . =) (261 . ^) (|Vector| 7) (267 . |vector|)
              (|Union| 88 '"failed") (|IntegerLinearDependence| 7)
              (272 . |particularSolutionOverQ|)
              (|Record| (|:| |num| 114) (|:| |den| 29)) (|Vector| 140)
              (|InnerCommonDenominator| 29 140 114 88)
              (278 . |splitDenominator|) (283 . ~=) (|SingletonAsOrderedSet|)
              (289 . |create|) '|dummy| (293 . |eval|) (300 . |coefficients|)
              (|Mapping| 20 7) (305 . |every?|) (311 . *) (317 . |monomial|)
              (323 . |coerce|) (328 . +) (334 . |resultant|) (340 . |Zero|)
              (344 . |leadingCoefficient|) (349 . /) (355 . |gcd|)
              (|Union| $ '"failed") (361 . |exquo|) (367 . |One|) (371 . ~=)
              (377 . |reductum|) (382 . =) (|List| 29) (|Vector| 29)
              (388 . |vector|) (393 . |gcd|) (398 . |elt|) (404 . |exquo|)
              (410 . |setelt!|) (417 . |invmod|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (423 . |extendedEuclidean|) (429 . *) (435 . +) (|Factored| 37)
              (|ExpressionFactorPolynomial| 6 7) (441 . |factorPolynomial|)
              (|Record| (|:| |factor| 37) (|:| |exponent| 29)) (|List| 129)
              (446 . |factors|) (451 . ~=) (|Union| 29 '#1="failed")
              (457 . |retractIfCan|) (|SparseMultivariatePolynomial| 6 18)
              (462 . |One|) (466 . *)
              (|Record| (|:| |particular| 84) (|:| |basis| (|List| 88)))
              (472 . |solveLinearlyOverQ|) (|Fraction| 29) (478 . |coerce|)
              (|List| 140) (483 . |entries|) (488 . |vector|) (493 . |entries|)
              (|Fraction| 157) (|Equation| 146) (498 . |rhs|) (503 . |Zero|)
              (507 . ~=) (513 . |lhs|) (518 . |retract|) (523 . ~=)
              (|Union| 157 '#2="failed") (529 . |retractIfCan|)
              (|Union| 7 '"failed") (|Polynomial| 7) (534 . |retractIfCan|)
              (|Union| 140 '#1#) (539 . |retractIfCan|) (544 . |numer|)
              (|List| 13) (549 . |variables|) (554 . |member?|) (560 . |eval|)
              (567 . |retract|) (|FunctionSpaceRationalRoots| 6 7)
              (572 . |get_rational_roots|) (578 . |coerce|) (583 . |rest|)
              (588 . |rest|) (|SparseUnivariatePolynomial| 157)
              (|Mapping| 157 7) (|SparseUnivariatePolynomialFunctions2| 7 157)
              (593 . |map|) (|SparseUnivariatePolynomial| $)
              (599 . |multivariate|) (|SparseMultivariatePolynomial| 6 35)
              (605 . |numer|) (610 . |coerce|) (615 . |coerce|) (|List| 187)
              (|List| 146) (|SystemSolvePackage| 7) (620 . |solve|) (626 . -)
              (|List| 147) (632 . |last|) (637 . |coerce|) (642 . |univariate|)
              (647 . |rem|) (653 . |retractIfCan|) (658 . |differentiate|)
              (663 . |resultant|) (669 . |member?|) (675 . *) (681 . ^)
              (687 . /) (693 . |Zero|) (|Mapping| 37 37 37) (|List| 37)
              (697 . |reduce|) (704 . |unit|) (709 . |retract|)
              (|Record| (|:| |exponent| 17) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 18) 18 6 135 7)
              (714 . |froot|) (720 . *)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 209) (|:| |fctr| 37) (|:| |xpnt| 29))
              (|List| 210) (726 . |makeFR|) (|PositiveInteger|) (732 . *)
              (|Factored| $) (738 . |squareFree|) (743 . |rootOf|)
              (748 . |elt|) (|Union| 82 '"failed") (|Mapping| 7 7) (|List| 220)
              (|ConstantLinearDependence| 6 7)
              (754 . |particularSolutionOverConstants|)
              (|Record| (|:| |logands| 27) (|:| |basis| (|List| 88)))
              (|ParametricIntegration| 6 7) (761 . |logextint|)
              (|LaurentPolynomial| 7 37) (768 . |coerce|) (773 . |max|)
              (|Mapping| 17 17 17) (|List| 17) (779 . |reduce|)
              (785 . |minimumDegree|) (|Mapping| 224 12 27)
              (|ParametricRischDE| 6 7) (790 . |exp_lower_bound|)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| 82))
              (|Union| 237 '"failed") (801 . |do_param_RDE|) (|Union| 37 '#2#)
              (810 . |retractIfCan|)
              (|Record| (|:| |ans| 37) (|:| |remainder| 37)) (|Mapping| 37 37)
              (|RDEaux| 7) (815 . SPDE1) (822 . -) (828 . *) (834 . |One|)
              (838 . |setelt!|) (845 . |denom|) (|Factored| 135)
              (|MultivariateFactorize| 18 (|IndexedExponents| 18) 6 135)
              (850 . |factor|)
              (|Record| (|:| |factor| 135) (|:| |exponent| 29)) (|List| 254)
              (855 . |factors|) (860 . *) (|Mapping| 135 135 135) (|List| 135)
              (866 . |reduce|) (873 . *) (879 . ^) (885 . |unit|)
              (890 . |retract|) (895 . *) (901 . ^) (907 . |concat|)
              (|List| 27) (|Matrix| 7) (913 . |matrix|)
              (|Record| (|:| |mat| 277) (|:| |vec| 115)) (|Matrix| $)
              (|Vector| $) (918 . |reducedSystem|) (|Union| 115 '"failed")
              (|Record| (|:| |particular| 275) (|:| |basis| (|List| 115)))
              (|Matrix| 29) (|SmithNormalForm| 29 115 115 277)
              (924 . |diophantineSystem|) (930 . /) (|Union| 268 '"failed")
              (|DenominatorIntegration| 6 7) (936 . |solve_u|) (943 . |second|)
              (948 . |reduce|) (|PartialFractionUtilities| 7 37)
              (954 . |decompose|) (960 . |univariate|) (967 . |retract|)
              (972 . ^) (978 . *)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (984 . |divide|) (990 . |elt|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 295 '"failed") (996 . |extendedEuclidean|)
              (1003 . |retractIfCan|) (1008 . |differentiate|) (1014 . |exp|)
              (1019 . |Ei|) (1024 . |zerosOf|) (1029 . |retract|) (1034 . +)
              (1040 . |elt|) (|Vector| 37) (1047 . |elt|)
              (|Record| (|:| |factor| 37) (|:| |ratpart| 29) (|:| |v_part| 7)
                        (|:| |alg_part| 37) (|:| |u_part| 7)
                        (|:| |exponent| 29) (|:| |shift_part| 7))
              (|List| 308) (1053 . |elt|) (1059 . ~=) (1065 . <=)
              (1071 . |vector|)
              (|Record| (|:| |basis| 306) (|:| |transform| 277))
              (|GcdBasis| 37) (1076 . |gcdDecomposition|) (1081 . =)
              (1087 . |elt|) (1094 . |tower|) (1099 . ~=) (1105 . ^)
              (1111 . |ksec|) (1118 . *) (1124 . |sqrt|) (1129 . |pi|)
              (1133 . |erf|) (|List| 6) (1138 . |coefficients|) (|Complex| 29)
              (1143 . |imag|) (1148 . |Zero|) (1152 . =) (|Mapping| 20 329)
              (|List| 329) (1158 . |every?|) (1164 . |real|) (1169 . |complex|)
              (1175 . |coerce|) (1180 . |smaller?|) (1186 . |fresnelC|)
              (1191 . |fresnelS|) (1196 . |mk_erf|) (1202 . *) (1208 . ^)
              (1214 . |Gamma|) (1220 . ~=) (1226 . |coerce|) (1231 . |eval|)
              (|Void|) (|OutputForm|) (1238 . |print|) (1243 . *)
              (1249 . |differentiate|)
              (|Record| (|:| |answer| 38) (|:| |logpart| 38)
                        (|:| |specpart| 38) (|:| |polypart| 37))
              (|TranscendentalHermiteIntegration| 7 37)
              (1256 . |HermiteIntegrate|)
              (|Record| (|:| |normal| 37) (|:| |special| 37))
              (|MonomialExtensionTools| 7 37) (1263 . |split|))
           '#(|mk_erf| 1269 |ei_int| 1275) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 359
                                                 '(1 7 10 0 11 2 14 12 12 13 15
                                                   2 14 12 12 12 16 1 18 17 0
                                                   19 2 12 20 18 0 21 2 17 20 0
                                                   0 22 2 18 20 0 13 23 1 18 24
                                                   0 25 2 24 20 0 13 26 1 18 27
                                                   0 28 2 27 7 0 29 30 1 7 29 0
                                                   31 0 6 0 32 0 7 0 33 2 7 34
                                                   0 35 36 1 38 37 0 39 1 38 37
                                                   0 40 1 37 17 0 41 2 29 20 0
                                                   0 42 2 37 7 0 17 43 0 6 0 44
                                                   0 7 0 45 2 37 0 7 17 46 1 37
                                                   0 7 47 2 37 0 0 0 48 1 38 0
                                                   37 49 1 7 0 0 50 2 37 0 0 0
                                                   51 2 38 0 0 0 52 1 14 18 12
                                                   53 1 18 54 0 55 4 57 56 7 7
                                                   13 12 58 0 13 0 59 1 18 0 13
                                                   60 2 61 7 38 18 62 1 7 0 35
                                                   63 2 7 0 0 13 64 3 7 0 0 10
                                                   65 66 2 7 0 0 0 67 2 7 0 0 0
                                                   69 3 7 0 0 35 0 70 2 73 71
                                                   72 37 74 2 7 0 0 0 75 1 7 0
                                                   29 76 3 27 7 77 0 7 78 2 7 0
                                                   0 0 79 2 7 20 0 0 80 2 7 0 0
                                                   29 81 1 82 0 27 83 2 85 84
                                                   82 7 86 1 89 87 88 90 2 29
                                                   20 0 0 91 0 92 0 93 3 37 0 0
                                                   92 0 95 1 37 27 0 96 2 27 20
                                                   97 0 98 2 37 0 0 0 99 2 71 0
                                                   37 17 100 1 71 0 37 101 2 71
                                                   0 0 0 102 2 71 37 0 0 103 0
                                                   37 0 104 1 37 7 0 105 2 37 0
                                                   0 7 106 2 37 0 0 0 107 2 37
                                                   108 0 0 109 0 37 0 110 2 37
                                                   20 0 0 111 1 37 0 0 112 2 37
                                                   20 0 0 113 1 115 0 114 116 1
                                                   29 0 65 117 2 115 29 0 29
                                                   118 2 29 108 0 0 119 3 115
                                                   29 0 29 29 120 2 29 0 0 0
                                                   121 2 29 122 0 0 123 2 115 0
                                                   29 0 124 2 115 0 0 0 125 1
                                                   127 126 37 128 1 126 130 0
                                                   131 2 7 20 0 0 132 1 7 133 0
                                                   134 0 135 0 136 2 37 0 7 0
                                                   137 2 85 138 82 7 139 1 140
                                                   0 29 141 1 88 142 0 143 1 88
                                                   0 142 144 1 115 114 0 145 1
                                                   147 146 0 148 0 146 0 149 2
                                                   146 20 0 0 150 1 147 146 0
                                                   151 1 146 13 0 152 2 13 20 0
                                                   0 153 1 146 154 0 155 1 157
                                                   156 0 158 1 7 159 0 160 1
                                                   146 157 0 161 1 157 162 0
                                                   163 2 162 20 13 0 164 3 157
                                                   0 0 13 7 165 1 157 7 0 166 2
                                                   167 142 7 18 168 1 157 0 7
                                                   169 1 162 0 0 170 1 12 0 0
                                                   171 2 174 172 173 37 175 2
                                                   157 0 176 13 177 1 7 178 0
                                                   179 1 7 0 178 180 1 146 0
                                                   157 181 2 184 182 183 162
                                                   185 2 146 0 0 0 186 1 187
                                                   147 0 188 1 7 0 140 189 1
                                                   157 37 0 190 2 37 0 0 0 191
                                                   1 140 133 0 192 1 37 0 0 193
                                                   2 37 7 0 0 194 2 142 20 140
                                                   0 195 2 29 0 17 0 196 2 37 0
                                                   0 17 197 2 38 0 37 37 198 0
                                                   38 0 199 3 201 37 200 0 37
                                                   202 1 126 37 0 203 1 37 7 0
                                                   204 2 206 205 7 17 207 2 37
                                                   0 0 7 208 2 126 0 37 211 212
                                                   2 29 0 213 0 214 1 37 215 0
                                                   216 1 7 0 176 217 2 82 7 0
                                                   29 218 3 222 219 82 7 221
                                                   223 3 225 224 13 12 27 226 1
                                                   227 0 37 228 2 17 0 0 0 229
                                                   2 231 17 230 0 232 1 37 17 0
                                                   233 7 235 29 37 227 29 29 12
                                                   7 234 236 5 57 238 7 7 27 13
                                                   12 239 1 38 240 0 241 3 244
                                                   242 37 37 243 245 2 38 0 0 0
                                                   246 2 38 0 37 0 247 0 38 0
                                                   248 3 82 7 0 29 7 249 1 7
                                                   178 0 250 1 252 251 135 253
                                                   1 251 255 0 256 2 135 0 0 0
                                                   257 3 259 135 258 0 135 260
                                                   2 140 0 0 0 261 2 135 0 0 17
                                                   262 1 251 135 0 263 1 135 6
                                                   0 264 2 7 0 6 0 265 2 7 0 0
                                                   213 266 2 27 0 0 0 267 1 269
                                                   0 268 270 2 7 271 272 273
                                                   274 2 278 276 277 115 279 2
                                                   140 0 0 0 280 3 282 281 7 7
                                                   13 283 1 27 7 0 284 2 201 37
                                                   200 0 285 2 286 201 37 201
                                                   287 3 61 37 7 18 37 288 1 7
                                                   35 0 289 2 38 0 0 29 290 2
                                                   38 0 0 0 291 2 37 292 0 0
                                                   293 2 201 37 0 29 294 3 37
                                                   296 0 0 0 297 1 37 156 0 298
                                                   2 7 0 0 13 299 1 7 0 0 300 1
                                                   7 0 0 301 1 7 65 176 302 1
                                                   38 37 0 303 2 38 0 0 0 304 3
                                                   277 29 0 29 29 305 2 306 37
                                                   0 29 307 2 309 308 0 29 310
                                                   2 17 20 0 0 311 2 29 20 0 0
                                                   312 1 306 0 201 313 1 315
                                                   314 306 316 2 38 20 0 0 317
                                                   3 277 0 0 114 114 318 1 7 10
                                                   0 319 2 18 20 0 0 320 2 7 0
                                                   0 17 321 3 14 18 18 12 13
                                                   322 2 38 0 0 37 323 1 7 0 0
                                                   324 0 7 0 325 1 7 0 0 326 1
                                                   135 327 0 328 1 329 29 0 330
                                                   0 29 0 331 2 29 20 0 0 332 2
                                                   334 20 333 0 335 1 329 29 0
                                                   336 2 329 0 29 29 337 1 7 0
                                                   6 338 2 7 20 0 0 339 1 7 0 0
                                                   340 1 7 0 0 341 2 0 7 7 7
                                                   342 2 17 0 213 0 343 2 7 0 0
                                                   0 344 2 7 0 0 0 345 2 38 20
                                                   0 0 346 1 7 0 13 347 3 7 0 0
                                                   0 0 348 1 350 349 0 351 2 7
                                                   0 29 0 352 3 37 0 0 220 0
                                                   353 3 355 354 38 243 37 356
                                                   2 358 357 37 243 359 2 0 7 7
                                                   7 342 4 0 56 29 7 7 13
                                                   68)))))
           '|lookupComplete|)) 
