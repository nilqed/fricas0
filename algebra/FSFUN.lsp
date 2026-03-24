
(SDEFUN |FSFUN;bernoulli_gamma_series|
        ((|z| (|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|s| #1=(|Complex| (|Float|))) (|bk| (|Float|)) (|kinv| (|Float|))
          (|zk| #2=(|Complex| (|Float|))) (#3=#:G46 NIL) (|k| NIL)
          (|z2inv| #1#) (|zinv| #2#))
         (SEQ (LETT |zinv| (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 8)))
              (LETT |zk| |zinv|)
              (LETT |z2inv| (SPADCALL |zinv| |zinv| (QREFELT % 9)))
              (LETT |s|
                    (SPADCALL |zk|
                              (SPADCALL (|spadConstant| % 7)
                                        (SPADCALL 12 (QREFELT % 11))
                                        (QREFELT % 8))
                              (QREFELT % 9)))
              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ (LETT |zk| (SPADCALL |zk| |z2inv| (QREFELT % 9)))
                        (LETT |kinv|
                              (SPADCALL (|spadConstant| % 15)
                                        (SPADCALL
                                         (* (+ (* 2 |k|) 2) (+ (* 2 |k|) 1))
                                         (QREFELT % 16))
                                        (QREFELT % 17)))
                        (LETT |bk|
                              (SPADCALL
                               (SPADCALL (+ (* 2 |k|) 2) (QREFELT % 19))
                               (QREFELT % 20)))
                        (EXIT
                         (LETT |s|
                               (SPADCALL |s|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |bk| |kinv|
                                                     (QREFELT % 21))
                                           (QREFELT % 22))
                                          |zk| (QREFELT % 9))
                                         (QREFELT % 23)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |s|)))) 

(SDEFUN |FSFUN;logGamma_a1|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |z|
                     (SPADCALL (|spadConstant| % 7) (SPADCALL 2 (QREFELT % 11))
                               (QREFELT % 8))
                     (QREFELT % 24))
           (SPADCALL |z| (QREFELT % 25)) (QREFELT % 9))
          |z| (QREFELT % 24))
         (SPADCALL
          (SPADCALL (|spadConstant| % 15) (SPADCALL 2 (QREFELT % 16))
                    (QREFELT % 17))
          (SPADCALL
           (SPADCALL (SPADCALL 2 (QREFELT % 16)) (SPADCALL (QREFELT % 26))
                     (QREFELT % 27))
           (QREFELT % 25))
          (QREFELT % 27))
         (QREFELT % 23))) 

(SDEFUN |FSFUN;logGamma_asymptotic|
        ((|z| (|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG ((|lg1| (|Complex| (|Float|))))
               (SEQ (LETT |lg1| (|FSFUN;logGamma_a1| |z| %))
                    (EXIT
                     (SPADCALL |lg1| (|FSFUN;bernoulli_gamma_series| |z| |n| %)
                               (QREFELT % 23)))))) 

(SDEFUN |FSFUN;gamma_series|
        ((|z| (|Complex| (|Float|))) (|l| (|Float|)) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|s| #1=(|Complex| (|Float|))) (|tk| #1#) (#2=#:G55 NIL) (|k| NIL))
         (SEQ
          (LETT |tk|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |z|
                            (SPADCALL (SPADCALL |l| (QREFELT % 28))
                                      (QREFELT % 22))
                            (QREFELT % 9))
                  (QREFELT % 29))
                 |z| (QREFELT % 8)))
          (LETT |s| |tk|)
          (SEQ (LETT |k| 1) (LETT #2# |n|) G190
               (COND ((|greater_SI| |k| #2#) (GO G191)))
               (SEQ
                (LETT |tk|
                      (SPADCALL
                       (SPADCALL |tk| (SPADCALL |l| (QREFELT % 22))
                                 (QREFELT % 9))
                       (SPADCALL |z| (SPADCALL |k| (QREFELT % 11))
                                 (QREFELT % 23))
                       (QREFELT % 8)))
                (EXIT (LETT |s| (SPADCALL |s| |tk| (QREFELT % 23)))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |s|
                     (SPADCALL
                      (SPADCALL (SPADCALL |l| (QREFELT % 30)) (QREFELT % 31))
                      (QREFELT % 22))
                     (QREFELT % 9)))))) 

(SDEFUN |FSFUN;Gamma;2C;5|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|result| (|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (#1=#:G66 NIL) (|llog| (|PositiveInteger|)) (#2=#:G64 NIL)
          (#3=#:G62 NIL) (|l1a| (|Integer|)) (|len| (|Float|))
          (|loss| (|Float|)) (|lz| (|PositiveInteger|)) (#4=#:G61 NIL)
          (|oz| (|PositiveInteger|)) (#5=#:G60 NIL) (|abs_z| #6=(|Float|))
          (|one| (|Complex| (|Float|))) (|c_pi| (|Complex| (|Float|)))
          (|sign| (|Float|)) (|z1| (|Complex| (|Float|))) (|re_zint| (|Float|))
          (|re_z| #6#) (|l| (|PositiveInteger|)) (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l| (MAX (+ |l0| 5) 20))
                 (LETT |re_z| (SPADCALL |z| (QREFELT % 35)))
                 (EXIT
                  (COND
                   ((SPADCALL |re_z|
                              (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                              (QREFELT % 38))
                    (SEQ (SPADCALL (+ |l| 5) (QREFELT % 39))
                         (LETT |re_zint| (SPADCALL |re_z| (QREFELT % 40)))
                         (LETT |z1|
                               (SPADCALL |z|
                                         (SPADCALL |re_zint| (QREFELT % 22))
                                         (QREFELT % 24)))
                         (LETT |sign|
                               (COND
                                ((ODDP (SPADCALL |re_zint| (QREFELT % 41)))
                                 (SPADCALL (|spadConstant| % 15)
                                           (QREFELT % 30)))
                                (#7='T (|spadConstant| % 15))))
                         (EXIT
                          (COND
                           ((SPADCALL |z1| (|spadConstant| % 42)
                                      (QREFELT % 43))
                            (SEQ (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT (|error| "Pole of Gamma"))))
                           (#7#
                            (SEQ (LETT |c_pi| (SPADCALL (QREFELT % 26)))
                                 (LETT |one| (|spadConstant| % 7))
                                 (LETT |result|
                                       (SPADCALL
                                        (SPADCALL |sign| |c_pi| (QREFELT % 27))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |one| |z| (QREFELT % 24))
                                          (QREFELT % 44))
                                         (SPADCALL
                                          (SPADCALL |c_pi| |z1| (QREFELT % 9))
                                          (QREFELT % 45))
                                         (QREFELT % 9))
                                        (QREFELT % 8)))
                                 (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT |result|)))))))
                   (#7#
                    (SEQ
                     (LETT |abs_z|
                           (SPADCALL (SPADCALL |z| (QREFELT % 46))
                                     (QREFELT % 35)))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                                  (SPADCALL 6 |abs_z| (QREFELT % 47))
                                  (QREFELT % 48))
                        (SEQ
                         (LETT |oz|
                               (PROG1
                                   (LETT #5#
                                         (MAX (SPADCALL |abs_z| (QREFELT % 49))
                                              5))
                                 (|check_subtype2| (> #5# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #5#)))
                         (LETT |lz|
                               (PROG1 (LETT #4# (INTEGER-LENGTH |oz|))
                                 (|check_subtype2| (> #4# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #4#)))
                         (SPADCALL (+ (+ |oz| |lz|) 30) (QREFELT % 39))
                         (LETT |loss|
                               (SPADCALL
                                (SPADCALL
                                 (|FSFUN;logGamma_a1|
                                  (SPADCALL (SPADCALL |z| (QREFELT % 35))
                                            (QREFELT % 22))
                                  %)
                                 (QREFELT % 35))
                                (SPADCALL (|FSFUN;logGamma_a1| |z| %)
                                          (QREFELT % 35))
                                (QREFELT % 50)))
                         (LETT |len|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL |z| (QREFELT % 35))
                                           (QREFELT % 47))
                                 (SPADCALL 2
                                           (SPADCALL |loss|
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT % 51))
                                                      (SPADCALL |l|
                                                                (QREFELT % 16))
                                                      (QREFELT % 21))
                                                     (QREFELT % 52))
                                           (QREFELT % 47))
                                 (QREFELT % 52))
                                (SPADCALL 3 (QREFELT % 16)) (QREFELT % 52)))
                         (LETT |l1a|
                               (+
                                (+ (+ |l| (SPADCALL |len| (QREFELT % 49)))
                                   (SPADCALL
                                    (SPADCALL |loss| (SPADCALL (QREFELT % 51))
                                              (QREFELT % 17))
                                    (QREFELT % 53)))
                                12))
                         (LETT |l1|
                               (PROG1
                                   (LETT #3#
                                         (MAX |l1a|
                                              (+
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |abs_z|
                                                           (SPADCALL |len|
                                                                     (QREFELT %
                                                                              28))
                                                           (QREFELT % 21))
                                                 (SPADCALL (QREFELT % 51))
                                                 (QREFELT % 17))
                                                (QREFELT % 53))
                                               10)))
                                 (|check_subtype2| (> #3# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #3#)))
                         (SPADCALL |l1| (QREFELT % 39))
                         (LETT |result|
                               (|FSFUN;gamma_series| |z| |len|
                                (+ (* 3 (SPADCALL |len| (QREFELT % 53))) 6) %))
                         (SPADCALL |l0| (QREFELT % 39)) (EXIT |result|)))
                       (#7#
                        (SEQ
                         (LETT |llog|
                               (PROG1
                                   (LETT #2#
                                         (MAX
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (|FSFUN;logGamma_a1| |z| %)
                                             (QREFELT % 46))
                                            (QREFELT % 35))
                                           (QREFELT % 49))
                                          5))
                                 (|check_subtype2| (> #2# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #2#)))
                         (LETT |l1|
                               (+
                                (+ (+ |l| |llog|)
                                   (PROG1 (LETT #1# (INTEGER-LENGTH |l|))
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #1#)))
                                12))
                         (SPADCALL |l1| (QREFELT % 39))
                         (LETT |result|
                               (SPADCALL
                                (|FSFUN;logGamma_asymptotic| |z|
                                 (+ (QUOTIENT2 |l| 6) 1) %)
                                (QREFELT % 29)))
                         (SPADCALL |l0| (QREFELT % 39))
                         (EXIT |result|)))))))))))
           (#7# (|error| "Gamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;logGamma_lift|
        ((|z| (|Complex| (|Float|))) (|lg2| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG ((|k| (|Float|)) (|lg2i| (|Float|)))
               (SEQ (LETT |lg2i| (SPADCALL |lg2| (QREFELT % 54)))
                    (LETT |k|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|FSFUN;logGamma_a1| |z| %)
                                       (QREFELT % 54))
                             |lg2i| (QREFELT % 50))
                            (SPADCALL 2 (SPADCALL (QREFELT % 55))
                                      (QREFELT % 47))
                            (QREFELT % 17))
                           (QREFELT % 40)))
                    (EXIT
                     (SPADCALL |lg2|
                               (SPADCALL (SPADCALL (QREFELT % 56))
                                         (SPADCALL
                                          (SPADCALL |k|
                                                    (SPADCALL 2 (QREFELT % 16))
                                                    (QREFELT % 21))
                                          (SPADCALL (QREFELT % 26))
                                          (QREFELT % 27))
                                         (QREFELT % 9))
                               (QREFELT % 23)))))) 

(SDEFUN |FSFUN;logGamma;2C;7|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|result| #1=(|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (#2=#:G81 NIL) (|l| (|PositiveInteger|)) (|abs_z| #3=(|Float|))
          (|c_pi| (|Complex| (|Float|))) (|lsign| (|Float|)) (|z1| #1#)
          (|re_zint| (|Float|)) (|one| (|Complex| (|Float|))) (|re_z| #3#)
          (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l| (MAX (+ |l0| 5) 20))
                 (LETT |re_z| (SPADCALL |z| (QREFELT % 35)))
                 (LETT |one| (|spadConstant| % 7))
                 (EXIT
                  (COND
                   ((SPADCALL |re_z|
                              (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                              (QREFELT % 38))
                    (SEQ (SPADCALL (+ |l| 5) (QREFELT % 39))
                         (LETT |re_zint| (SPADCALL |re_z| (QREFELT % 40)))
                         (LETT |z1|
                               (SPADCALL |z|
                                         (SPADCALL |re_zint| (QREFELT % 22))
                                         (QREFELT % 24)))
                         (LETT |lsign|
                               (COND
                                ((ODDP (SPADCALL |re_zint| (QREFELT % 41)))
                                 (|spadConstant| % 15))
                                (#4='T (|spadConstant| % 57))))
                         (EXIT
                          (COND
                           ((SPADCALL |z1| (|spadConstant| % 42)
                                      (QREFELT % 43))
                            (SEQ (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT (|error| "Pole of Gamma"))))
                           (#4#
                            (SEQ (SPADCALL (+ |l| 5) (QREFELT % 39))
                                 (LETT |c_pi| (SPADCALL (QREFELT % 26)))
                                 (LETT |result|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c_pi| (QREFELT % 25))
                                          (SPADCALL
                                           (SPADCALL (|spadConstant| % 57)
                                                     |lsign| (QREFELT % 58))
                                           |c_pi| (QREFELT % 9))
                                          (QREFELT % 23))
                                         (SPADCALL
                                          (SPADCALL |one| |z| (QREFELT % 24))
                                          (QREFELT % 59))
                                         (QREFELT % 24))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c_pi| |z1| (QREFELT % 9))
                                          (QREFELT % 45))
                                         (QREFELT % 25))
                                        (QREFELT % 24)))
                                 (LETT |result|
                                       (|FSFUN;logGamma_lift| |z| |result| %))
                                 (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT |result|)))))))
                   (#4#
                    (SEQ
                     (LETT |abs_z|
                           (SPADCALL (SPADCALL |z| (QREFELT % 46))
                                     (QREFELT % 35)))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                                  (SPADCALL 6 |abs_z| (QREFELT % 47))
                                  (QREFELT % 48))
                        (SEQ (LETT |l| (+ |l| 5))
                             (COND
                              ((OR
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |one| (QREFELT % 24))
                                            (QREFELT % 46))
                                  (QREFELT % 35))
                                 (SPADCALL (|spadConstant| % 15) 4
                                           (QREFELT % 36))
                                 (QREFELT % 38))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |z| |one| (QREFELT % 24)) |one|
                                    (QREFELT % 24))
                                   (QREFELT % 46))
                                  (QREFELT % 35))
                                 (SPADCALL (|spadConstant| % 15) 4
                                           (QREFELT % 36))
                                 (QREFELT % 38)))
                               (LETT |l| (* 2 |l|))))
                             (SPADCALL |l| (QREFELT % 39))
                             (LETT |result|
                                   (|FSFUN;logGamma_lift| |z|
                                    (SPADCALL (SPADCALL |z| (QREFELT % 44))
                                              (QREFELT % 25))
                                    %))
                             (SPADCALL |l0| (QREFELT % 39)) (EXIT |result|)))
                       (#4#
                        (SEQ
                         (LETT |l1|
                               (+
                                (+ |l|
                                   (PROG1 (LETT #2# (INTEGER-LENGTH |l|))
                                     (|check_subtype2| (> #2# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #2#)))
                                12))
                         (SPADCALL |l1| (QREFELT % 39))
                         (LETT |result|
                               (|FSFUN;logGamma_asymptotic| |z|
                                (+ (QUOTIENT2 |l| 6) 1) %))
                         (SPADCALL |l0| (QREFELT % 39))
                         (EXIT |result|)))))))))))
           (#4# (|error| "Gamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;Gamma;2F;8| ((|x| (|Float|)) (% (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 22)) (QREFELT % 44))
                  (QREFELT % 35))) 

(SDEFUN |FSFUN;logGamma;2F;9| ((|x| (|Float|)) (% (|Float|)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 57) (QREFELT % 61))
          (|error| "Argument to logGamma <= 0"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 22)) (QREFELT % 59))
                    (QREFELT % 35))))) 

(SDEFUN |FSFUN;Beta;3C;10|
        ((|x| (|Complex| (|Float|))) (|y| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l1| (MAX 30 (+ |l0| 10)))
                 (SPADCALL |l1| (QREFELT % 39))
                 (LETT |res|
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT % 44))
                                  (SPADCALL |y| (QREFELT % 44)) (QREFELT % 9))
                        (SPADCALL (SPADCALL |x| |y| (QREFELT % 23))
                                  (QREFELT % 44))
                        (QREFELT % 8)))
                 (SPADCALL |l0| (QREFELT % 39)) (EXIT |res|)))
           ('T (|error| "Beta can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;Beta;3F;11| ((|x| (|Float|)) (|y| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT % 22)) (SPADCALL |y| (QREFELT % 22))
                   (QREFELT % 63))
         (QREFELT % 35))) 

(SDEFUN |FSFUN;rabs;2F;12| ((|r| (|Float|)) (% (|Float|)))
        (SPADCALL |r| (QREFELT % 65))) 

(SDEFUN |FSFUN;rabs;CF;13| ((|r| (|Complex| (|Float|))) (% (|Float|)))
        (SPADCALL (SPADCALL |r| (QREFELT % 46)) (QREFELT % 35))) 

(PUT '|FSFUN;rabs;2Df;14| '|SPADreplace| '|abs_DF|) 

(SDEFUN |FSFUN;rabs;2Df;14| ((|r| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|abs_DF| |r|)) 

(SDEFUN |FSFUN;rabs;CDf;15|
        ((|r| (|Complex| (|DoubleFloat|))) (% (|DoubleFloat|)))
        (SPADCALL (SPADCALL |r| (QREFELT % 71)) (QREFELT % 72))) 

(SDEFUN |FSFUN;digamma_euler_maclaurin|
        ((|a| (|Complex| (|Float|))) (|n| (|Integer|)) (|m| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|bk| (|Float|))
          (|ns1| (|Complex| (|Float|))) (|kfac| (|Float|)) (#1=#:G104 NIL)
          (|k| NIL) (|n2_inv| #2=(|Complex| (|Float|))) (|ns| #2#)
          (|na| (|Complex| (|Float|))) (|n1| (|Integer|)) (|ck| #2#)
          (#3=#:G103 NIL))
         (SEQ (LETT |res| (|spadConstant| % 42))
              (SEQ (LETT |k| 0) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ
                    (LETT |ck|
                          (SPADCALL (|spadConstant| % 7)
                                    (SPADCALL (SPADCALL |k| (QREFELT % 11)) |a|
                                              (QREFELT % 23))
                                    (QREFELT % 8)))
                    (EXIT (LETT |res| (SPADCALL |res| |ck| (QREFELT % 23)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |n1| (+ |n| 1))
              (LETT |na|
                    (SPADCALL (SPADCALL |n1| (QREFELT % 11)) |a|
                              (QREFELT % 23)))
              (LETT |ns| (SPADCALL (|spadConstant| % 7) |na| (QREFELT % 8)))
              (LETT |ns1| (|spadConstant| % 7))
              (LETT |res|
                    (SPADCALL
                     (SPADCALL |res|
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 15) 2
                                          (QREFELT % 36))
                                |ns| (QREFELT % 27))
                               (QREFELT % 23))
                     (SPADCALL |na| (QREFELT % 25)) (QREFELT % 24)))
              (LETT |n2_inv|
                    (SPADCALL (|spadConstant| % 7)
                              (SPADCALL |na| |na| (QREFELT % 9))
                              (QREFELT % 8)))
              (SEQ (LETT |k| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ (LETT |kfac| (SPADCALL (* 2 |k|) (QREFELT % 16)))
                        (LETT |ns1| (SPADCALL |n2_inv| |ns1| (QREFELT % 9)))
                        (LETT |bk|
                              (SPADCALL (SPADCALL (* 2 |k|) (QREFELT % 19))
                                        (QREFELT % 20)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL
                                          (SPADCALL |bk| |kfac| (QREFELT % 17))
                                          |ns1| (QREFELT % 27))
                                         (QREFELT % 23)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 74)))))) 

(SDEFUN |FSFUN;digamma_aux|
        ((|a| (|Complex| (|Float|))) (|l| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG ((|abs_a| (|Float|)))
               (SEQ
                (LETT |abs_a|
                      (SPADCALL (SPADCALL |a| (QREFELT % 75)) (QREFELT % 76)))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                             (SPADCALL 6 |abs_a| (QREFELT % 47))
                             (QREFELT % 48))
                   (|FSFUN;digamma_euler_maclaurin| |a| (+ (QUOTIENT2 |l| 6) 1)
                    (+ (QUOTIENT2 |l| 6) 1) %))
                  ('T
                   (|FSFUN;digamma_euler_maclaurin| |a| -1
                    (+ (QUOTIENT2 |l| 6) 1) %))))))) 

(SDEFUN |FSFUN;digamma;2C;18|
        ((|a| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|ap| (|Complex| (|Float|))) (|r_pi| (|Float|))
          (|a1| (|Complex| (|Float|))) (|re_aint| (|Float|))
          (|l| (|PositiveInteger|)) (|re_a| (|Float|))
          (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l| (MAX (+ |l0| 10) 61))
                 (EXIT
                  (|finally|
                   (SEQ (LETT |re_a| (SPADCALL |a| (QREFELT % 35)))
                        (EXIT
                         (COND
                          ((SPADCALL |re_a|
                                     (SPADCALL (|spadConstant| % 15) 2
                                               (QREFELT % 36))
                                     (QREFELT % 38))
                           (SEQ (LETT |l| (+ |l| 5))
                                (SPADCALL
                                 (+ (+ |l| (* 3 (INTEGER-LENGTH |l|))) 10)
                                 (QREFELT % 39))
                                (LETT |re_aint|
                                      (SPADCALL |re_a| (QREFELT % 40)))
                                (LETT |a1|
                                      (SPADCALL |a|
                                                (SPADCALL |re_aint|
                                                          (|spadConstant| % 57)
                                                          (QREFELT % 58))
                                                (QREFELT % 24)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |a1| (|spadConstant| % 42)
                                             (QREFELT % 43))
                                   (|error| "Pole of Gamma"))
                                  (#1='T
                                   (SEQ (LETT |r_pi| (SPADCALL (QREFELT % 55)))
                                        (LETT |ap|
                                              (SPADCALL |r_pi| |a1|
                                                        (QREFELT % 27)))
                                        (EXIT
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |r_pi|
                                                      (SPADCALL |ap|
                                                                (QREFELT % 77))
                                                      (QREFELT % 27))
                                            (SPADCALL |ap| (QREFELT % 45))
                                            (QREFELT % 8))
                                           (QREFELT % 74))
                                          (|FSFUN;digamma_aux|
                                           (SPADCALL (|spadConstant| % 7) |a|
                                                     (QREFELT % 24))
                                           |l| %)
                                          (QREFELT % 23)))))))))
                          (#1#
                           (SEQ
                            (SPADCALL (+ (+ |l| (* 3 (INTEGER-LENGTH |l|))) 10)
                                      (QREFELT % 39))
                            (EXIT (|FSFUN;digamma_aux| |a| |l| %)))))))
                   (SPADCALL |l0| (QREFELT % 39))))))
           (#1# (|error| "digamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;digamma;2F;19| ((|z| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| % 57) (QREFELT % 58))
                   (QREFELT % 78))
         (QREFELT % 35))) 

(SDEFUN |FSFUN;li2_series|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|ck| (|Float|)) (|k2| (|Integer|))
          (|k| (|Integer|)) (#1=#:G120 NIL) (|i| NIL) (|n| (|Integer|))
          (|oz| (|Integer|)) (|nz| (|Float|)))
         (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 75)))
              (LETT |oz| (SPADCALL |nz| (QREFELT % 49)))
              (LETT |n|
                    (COND
                     ((< |oz| -200)
                      (+ (QUOTIENT2 (* 2 |prec|) (- (- |oz|) 1)) 1))
                     ('T
                      (+
                       (SPADCALL
                        (SPADCALL
                         (|mul_DF|
                          (FLOAT (* 2 |prec|) MOST-POSITIVE-DOUBLE-FLOAT)
                          (|minus_DF|
                           (|div_DF|
                            (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                      (QREFELT % 80))
                            (SPADCALL (SPADCALL |nz| (QREFELT % 81))
                                      (QREFELT % 80)))))
                         (QREFELT % 82))
                        (QREFELT % 83))
                       1))))
              (LETT |res| (|spadConstant| % 42))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |k| (- (+ |n| 2) |i|)) (LETT |k2| (* |k| |k|))
                        (LETT |ck|
                              (SPADCALL (|spadConstant| % 15)
                                        (SPADCALL |k2| (QREFELT % 16))
                                        (QREFELT % 17)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |z|
                                         (SPADCALL |res|
                                                   (SPADCALL |ck|
                                                             (|spadConstant| %
                                                                             57)
                                                             (QREFELT % 58))
                                                   (QREFELT % 23))
                                         (QREFELT % 9)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |z|
                         (SPADCALL (|spadConstant| % 7) |res| (QREFELT % 23))
                         (QREFELT % 9)))))) 

(SDEFUN |FSFUN;li2_aux|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|lz1| #1=(|Complex| (|Float|))) (|nz1| #2=(|Float|)) (|lz| #1#)
          (|lmz| #1#) (|pi_fac| (|Float|)) (|rpi| (|Float|))
          (|z1| (|Complex| (|Float|))) (|nz| #2#) (|dd| #2#)
          (|w| (|Complex| (|Float|))) (|siz| (|Float|)) (|iz| (|Float|))
          (|rz| (|Float|)))
         (SEQ (LETT |rz| (SPADCALL |z| (QREFELT % 35)))
              (LETT |iz| (SPADCALL |z| (QREFELT % 54)))
              (LETT |siz|
                    (COND
                     ((SPADCALL |iz| (|spadConstant| % 57) (QREFELT % 48))
                      (|spadConstant| % 15))
                     (#3='T (SPADCALL (|spadConstant| % 15) (QREFELT % 30)))))
              (LETT |w|
                    (SPADCALL (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                              (SPADCALL
                               (SPADCALL |siz|
                                         (SPADCALL (|spadConstant| % 15) 2
                                                   (QREFELT % 36))
                                         (QREFELT % 21))
                               (SPADCALL (SPADCALL 3 (QREFELT % 16))
                                         (QREFELT % 76))
                               (QREFELT % 21))
                              (QREFELT % 58)))
              (LETT |dd|
                    (SPADCALL (SPADCALL |z| |w| (QREFELT % 24))
                              (QREFELT % 75)))
              (EXIT
               (COND
                ((SPADCALL |dd|
                           (SPADCALL (|spadConstant| % 15) 8 (QREFELT % 36))
                           (QREFELT % 38))
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                            (|FSFUN;li2_aux| (SPADCALL |z| |z| (QREFELT % 9))
                             (+ |prec| 2) %)
                            (QREFELT % 27))
                  (|FSFUN;li2_aux| (SPADCALL |z| (QREFELT % 74)) (+ |prec| 2)
                   %)
                  (QREFELT % 24)))
                (#3#
                 (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 75)))
                      (LETT |z1|
                            (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 24)))
                      (LETT |rpi| (SPADCALL (QREFELT % 55)))
                      (LETT |pi_fac|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 15) 6 (QREFELT % 36))
                              |rpi| (QREFELT % 21))
                             |rpi| (QREFELT % 21)))
                      (EXIT
                       (COND
                        ((SPADCALL |rz|
                                   (SPADCALL (|spadConstant| % 15) 2
                                             (QREFELT % 36))
                                   (QREFELT % 48))
                         (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT % 75)))
                              (EXIT
                               (COND
                                ((SPADCALL |nz1| (|spadConstant| % 15)
                                           (QREFELT % 84))
                                 (SEQ
                                  (LETT |lmz|
                                        (SPADCALL (SPADCALL |z| (QREFELT % 74))
                                                  (QREFELT % 25)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |pi_fac| (QREFELT % 22))
                                      (QREFELT % 74))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 15) 2
                                                 (QREFELT % 36))
                                       |lmz| (QREFELT % 27))
                                      |lmz| (QREFELT % 9))
                                     (QREFELT % 24))
                                    (|FSFUN;li2_series|
                                     (SPADCALL (|spadConstant| % 7) |z|
                                               (QREFELT % 8))
                                     |prec| %)
                                    (QREFELT % 24)))))
                                (#3#
                                 (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 25)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |z1| (|spadConstant| % 42)
                                                   (QREFELT % 43))
                                         (SPADCALL |pi_fac| (QREFELT % 22)))
                                        (#3#
                                         (SEQ
                                          (LETT |lz1|
                                                (SPADCALL |z1| (QREFELT % 25)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |nz|
                                                       (|spadConstant| % 15)
                                                       (QREFELT % 84))
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |pi_fac|
                                                         (QREFELT % 22))
                                               (SPADCALL |lz|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (|spadConstant| %
                                                                            15)
                                                            2 (QREFELT % 36))
                                                           |lz| (QREFELT % 27))
                                                          |lz1| (QREFELT % 24))
                                                         (QREFELT % 9))
                                               (QREFELT % 23))
                                              (|FSFUN;li2_series|
                                               (SPADCALL
                                                (SPADCALL |z1| |z|
                                                          (QREFELT % 8))
                                                (QREFELT % 74))
                                               |prec| %)
                                              (QREFELT % 23)))
                                            (#3#
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |pi_fac|
                                                         (QREFELT % 22))
                                               (SPADCALL |lz| |lz1|
                                                         (QREFELT % 9))
                                               (QREFELT % 24))
                                              (|FSFUN;li2_series| |z1| |prec|
                                               %)
                                              (QREFELT % 24)))))))))))))))
                        ((SPADCALL |nz| (|spadConstant| % 15) (QREFELT % 84))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |pi_fac| (QREFELT % 22))
                                     (QREFELT % 74))
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                             (SPADCALL |z1| (QREFELT % 25)) (QREFELT % 27))
                            (SPADCALL
                             (SPADCALL |z1| (SPADCALL |z| |z| (QREFELT % 9))
                                       (QREFELT % 8))
                             (QREFELT % 25))
                            (QREFELT % 9))
                           (QREFELT % 23))
                          (|FSFUN;li2_series|
                           (SPADCALL (|spadConstant| % 7) |z1| (QREFELT % 8))
                           |prec| %)
                          (QREFELT % 23)))
                        (#3#
                         (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT % 75)))
                              (EXIT
                               (COND
                                ((SPADCALL |nz1| (|spadConstant| % 15)
                                           (QREFELT % 84))
                                 (SEQ
                                  (LETT |lz1| (SPADCALL |z1| (QREFELT % 25)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 15) 2
                                                 (QREFELT % 36))
                                       |lz1| (QREFELT % 27))
                                      |lz1| (QREFELT % 9))
                                     (QREFELT % 74))
                                    (|FSFUN;li2_series|
                                     (SPADCALL
                                      (SPADCALL |z| |z1| (QREFELT % 8))
                                      (QREFELT % 74))
                                     |prec| %)
                                    (QREFELT % 24)))))
                                (#3#
                                 (|FSFUN;li2_series| |z| |prec| %))))))))))))))) 

(SDEFUN |FSFUN;li2;2C;22|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|prec| (|PositiveInteger|)) (|obits| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL (QREFELT % 33)) 2)
                  (SEQ (LETT |obits| (SPADCALL (QREFELT % 34)))
                       (LETT |prec| (+ |obits| 5))
                       (EXIT
                        (|finally|
                         (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 39))
                              (EXIT (|FSFUN;li2_aux| |z| |prec| %)))
                         (SPADCALL |obits| (QREFELT % 39))))))
                 ('T (|error| "li2 can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;dilog_aux|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|lz1| #1=(|Complex| (|Float|)))
          (|lz| #1#) (|pi_fac| (|Float|)) (|rpi| (|Float|)) (|nz| (|Float|)))
         (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 75)))
              (EXIT
               (COND
                ((SPADCALL |nz|
                           (SPADCALL (|spadConstant| % 15) 4 (QREFELT % 36))
                           (QREFELT % 38))
                 (SEQ (LETT |rpi| (SPADCALL (QREFELT % 55)))
                      (LETT |pi_fac|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 15) 6 (QREFELT % 36))
                              |rpi| (QREFELT % 21))
                             |rpi| (QREFELT % 21)))
                      (EXIT
                       (COND
                        ((SPADCALL |z| (|spadConstant| % 42) (QREFELT % 43))
                         (SPADCALL |pi_fac| (QREFELT % 22)))
                        (#2='T
                         (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 25)))
                              (LETT |lz1|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| % 7) |z|
                                               (QREFELT % 24))
                                     (QREFELT % 25)))
                              (EXIT
                               (LETT |res|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |pi_fac| (QREFELT % 22))
                                       (SPADCALL |lz| |lz1| (QREFELT % 9))
                                       (QREFELT % 24))
                                      (|FSFUN;li2_series| |z| |prec| %)
                                      (QREFELT % 24))))))))))
                (#2#
                 (|FSFUN;li2_aux|
                  (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 24)) |prec|
                  %))))))) 

(SDEFUN |FSFUN;dilog;2C;24|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|prec| (|PositiveInteger|)) (|obits| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL (QREFELT % 33)) 2)
                  (SEQ (LETT |obits| (SPADCALL (QREFELT % 34)))
                       (LETT |prec| (+ |obits| 5))
                       (EXIT
                        (|finally|
                         (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 39))
                              (EXIT (|FSFUN;dilog_aux| |z| |prec| %)))
                         (SPADCALL |obits| (QREFELT % 39))))))
                 ('T (|error| "dilog can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;zeta_borwein|
        ((|s| (|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|cn| (|Float|)) (|dn| (|Float|))
          (|sign| (|Integer|)) (|res2| #1=(|Complex| (|Float|))) (|res1| #1#)
          (|ks| (|Complex| (|Float|))) (|lk| (|Float|)) (|ck| #2=(|Float|))
          (|dk| #2#) (|dkd| (|Integer|)) (#3=#:G145 NIL) (|k| NIL))
         (SEQ (LETT |res1| (|spadConstant| % 7))
              (LETT |res2| (|spadConstant| % 7)) (LETT |sign| -1)
              (LETT |dk| (|spadConstant| % 15))
              (LETT |ck| (|spadConstant| % 15))
              (SEQ (LETT |k| 1) (LETT #3# (- |n| 1)) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ (LETT |dkd| (* (- (* 2 |k|) 1) |k|))
                        (LETT |dk|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 15)
                                         (SPADCALL |dkd| (QREFELT % 16))
                                         (QREFELT % 17))
                               |dk| (QREFELT % 21)))
                        (LETT |dk|
                              (SPADCALL
                               (SPADCALL
                                (* (* 2 (- (+ |n| |k|) 1)) (+ (- |n| |k|) 1))
                                (QREFELT % 16))
                               |dk| (QREFELT % 21)))
                        (LETT |ck| (SPADCALL |ck| |dk| (QREFELT % 52)))
                        (LETT |lk|
                              (SPADCALL (SPADCALL (+ |k| 1) (QREFELT % 16))
                                        (QREFELT % 28)))
                        (LETT |ks|
                              (SPADCALL
                               (SPADCALL (SPADCALL |lk| |s| (QREFELT % 27))
                                         (QREFELT % 74))
                               (QREFELT % 29)))
                        (LETT |res1|
                              (SPADCALL |res1|
                                        (SPADCALL
                                         (SPADCALL |sign| (QREFELT % 16)) |ks|
                                         (QREFELT % 27))
                                        (QREFELT % 23)))
                        (LETT |res2|
                              (SPADCALL |res2|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |sign| (QREFELT % 16)) |ck|
                                          (QREFELT % 21))
                                         |ks| (QREFELT % 27))
                                        (QREFELT % 23)))
                        (EXIT (LETT |sign| (- |sign|))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |dn|
                    (SPADCALL
                     (SPADCALL (SPADCALL 2 (QREFELT % 16))
                               (SPADCALL (|spadConstant| % 15)
                                         (SPADCALL |n| (QREFELT % 16))
                                         (QREFELT % 17))
                               (QREFELT % 21))
                     |dk| (QREFELT % 21)))
              (LETT |cn| (SPADCALL |ck| |dn| (QREFELT % 52)))
              (EXIT
               (LETT |res|
                     (SPADCALL |res1|
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 15) |cn|
                                          (QREFELT % 17))
                                |res2| (QREFELT % 27))
                               (QREFELT % 24))))))) 

(SDEFUN |FSFUN;zeta_aux1|
        ((|s| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|s21| (|Complex| (|Float|))) (|n| (|Integer|)) (|nt| (|Integer|))
          (|s2| (|Complex| (|Float|))))
         (SEQ
          (LETT |s2| (SPADCALL (SPADCALL 2 (QREFELT % 11)) |s| (QREFELT % 87)))
          (LETT |nt|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |s| (QREFELT % 54)) (QREFELT % 65))
                  (QREFELT % 40))
                 (QREFELT % 41)))
          (LETT |n| (+ (QUOTIENT2 (+ (+ (* 4 |prec|) (* 9 |nt|)) 9) 10) 5))
          (LETT |s21|
                (SPADCALL (|spadConstant| % 7)
                          (SPADCALL (SPADCALL 2 (QREFELT % 11)) |s2|
                                    (QREFELT % 8))
                          (QREFELT % 24)))
          (EXIT
           (SPADCALL (|FSFUN;zeta_borwein| |s| |n| %) |s21| (QREFELT % 8)))))) 

(SDEFUN |FSFUN;zeta_aux2|
        ((|s| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|h| (|Float|)) (|nprec| (|Integer|)) (|lb| #1=(|Integer|))
          (|ns1| (|Float|)) (|s1| (|Complex| (|Float|))) (|is1| #1#)
          (|l2pi| (|Float|)) (|pi1| (|Float|)))
         (SEQ
          (COND
           ((SPADCALL
             (SPADCALL (|spadConstant| % 15) (SPADCALL 4 (QREFELT % 16))
                       (QREFELT % 17))
             (SPADCALL
              (SPADCALL (SPADCALL |s| (|spadConstant| % 7) (QREFELT % 24))
                        (QREFELT % 35))
              (QREFELT % 66))
             (QREFELT % 38))
            (|FSFUN;zeta_aux1| |s| |prec| %))
           (#2='T
            (SEQ (SPADCALL (+ (* 2 |prec|) 15) (QREFELT % 39))
                 (LETT |s1| (SPADCALL (|spadConstant| % 7) |s| (QREFELT % 24)))
                 (LETT |ns1| (SPADCALL |s1| (QREFELT % 75)))
                 (EXIT
                  (COND
                   ((SPADCALL |ns1|
                              (SPADCALL (|spadConstant| % 15)
                                        (SPADCALL 2 (QREFELT % 16))
                                        (QREFELT % 17))
                              (QREFELT % 38))
                    (SEQ
                     (LETT |lb|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |ns1| (QREFELT % 28))
                                        (SPADCALL (SPADCALL 2 (QREFELT % 16))
                                                  (QREFELT % 28))
                                        (QREFELT % 17))
                              (QREFELT % 30))
                             (QREFELT % 40))
                            (QREFELT % 41)))
                     (EXIT
                      (COND
                       ((< |lb| (+ (QUOTIENT2 |prec| 2) 5))
                        (SEQ (LETT |nprec| (+ (+ |prec| |lb|) 10))
                             (SPADCALL (+ |nprec| 15) (QREFELT % 39))
                             (EXIT (|FSFUN;zeta_aux1| |s| |nprec| %))))
                       (#2#
                        (SEQ (SPADCALL (+ |prec| 15) (QREFELT % 39))
                             (EXIT
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 7) |s1|
                                          (QREFELT % 8))
                                (QREFELT % 74))
                               (SPADCALL (QREFELT % 89)) (QREFELT % 23)))))))))
                   (#2#
                    (SEQ (LETT |pi1| (SPADCALL (QREFELT % 55)))
                         (LETT |l2pi|
                               (SPADCALL
                                (SPADCALL (SPADCALL 2 (QREFELT % 16))
                                          (QREFELT % 28))
                                (SPADCALL (SPADCALL 2 (QREFELT % 16)) |pi1|
                                          (QREFELT % 21))
                                (QREFELT % 17)))
                         (LETT |is1|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL |s1| |l2pi| (QREFELT % 90))
                                  (QREFELT % 54))
                                 (QREFELT % 40))
                                (QREFELT % 41)))
                         (LETT |s1|
                               (SPADCALL |s1|
                                         (SPADCALL (|spadConstant| % 57)
                                                   (SPADCALL
                                                    (SPADCALL |is1|
                                                              (QREFELT % 16))
                                                    |l2pi| (QREFELT % 17))
                                                   (QREFELT % 58))
                                         (QREFELT % 24)))
                         (LETT |ns1| (SPADCALL |s1| (QREFELT % 75)))
                         (EXIT
                          (COND
                           ((SPADCALL
                             (SPADCALL (|spadConstant| % 15)
                                       (SPADCALL 4 (QREFELT % 16))
                                       (QREFELT % 17))
                             |ns1| (QREFELT % 38))
                            (SEQ (SPADCALL (+ |prec| 15) (QREFELT % 39))
                                 (EXIT (|FSFUN;zeta_aux1| |s| |prec| %))))
                           (#2#
                            (SEQ
                             (LETT |lb|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |ns1| (QREFELT % 28))
                                                (SPADCALL
                                                 (SPADCALL 2 (QREFELT % 16))
                                                 (QREFELT % 28))
                                                (QREFELT % 17))
                                      (QREFELT % 30))
                                     (QREFELT % 40))
                                    (QREFELT % 41)))
                             (EXIT
                              (COND
                               ((< |lb| (+ |prec| 5))
                                (SEQ (LETT |nprec| (+ (+ |prec| |lb|) 5))
                                     (SPADCALL (+ |nprec| 15) (QREFELT % 39))
                                     (EXIT (|FSFUN;zeta_aux1| |s| |nprec| %))))
                               (#2#
                                (SEQ
                                 (LETT |nprec|
                                       (QUOTIENT2 (+ (* 3 |prec|) 20) 2))
                                 (SPADCALL (+ |nprec| 15) (QREFELT % 39))
                                 (LETT |h|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 15)
                                                  (SPADCALL 2 (QREFELT % 16))
                                                  (QREFELT % 17))
                                        (QUOTIENT2 (- (* 2 |prec|) 5) 3)
                                        (QREFELT % 91)))
                                 (EXIT
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 15)
                                             (SPADCALL 2 (QREFELT % 16))
                                             (QREFELT % 17))
                                   (SPADCALL
                                    (|FSFUN;zeta_aux1|
                                     (SPADCALL |s|
                                               (SPADCALL |h| (QREFELT % 22))
                                               (QREFELT % 23))
                                     |nprec| %)
                                    (|FSFUN;zeta_aux1|
                                     (SPADCALL |s|
                                               (SPADCALL |h| (QREFELT % 22))
                                               (QREFELT % 24))
                                     |nprec| %)
                                    (QREFELT % 23))
                                   (QREFELT % 27))))))))))))))))))))) 

(SDEFUN |FSFUN;zeta_aux|
        ((|s| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|coef| (|Complex| (|Float|))) (|s2| (|Complex| (|Float|)))
          (|lb| (|Integer|)) (|pi1| (|Float|)) (|ns| (|Float|))
          (|s1| (|Complex| (|Float|))) (|re_s| (|Float|)))
         (SEQ (LETT |re_s| (SPADCALL |s| (QREFELT % 35)))
              (EXIT
               (COND
                ((SPADCALL |re_s|
                           (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                           (QREFELT % 84))
                 (|FSFUN;zeta_aux2| |s| |prec| %))
                (#1='T
                 (SEQ
                  (LETT |s1|
                        (SPADCALL (|spadConstant| % 7) |s| (QREFELT % 24)))
                  (EXIT
                   (COND
                    ((SPADCALL |s| (|spadConstant| % 42) (QREFELT % 43))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 15)
                                 (SPADCALL 2 (QREFELT % 16)) (QREFELT % 17))
                       (QREFELT % 22))
                      (QREFELT % 74)))
                    (#1#
                     (SEQ (LETT |ns| (SPADCALL |s| (QREFELT % 75)))
                          (LETT |pi1| (SPADCALL (QREFELT % 55)))
                          (LETT |lb|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |ns| (QREFELT % 28))
                                             (SPADCALL
                                              (SPADCALL 2 (QREFELT % 16))
                                              (QREFELT % 28))
                                             (QREFELT % 17))
                                   (QREFELT % 30))
                                  (QREFELT % 40))
                                 (QREFELT % 41)))
                          (EXIT
                           (COND
                            ((< (QUOTIENT2 |prec| 2) (- |lb| 15))
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 15) 2
                                         (QREFELT % 36))
                               (QREFELT % 30))
                              (SPADCALL (|spadConstant| % 7)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (SPADCALL 2 (QREFELT % 16))
                                                    |pi1| (QREFELT % 21))
                                          (QREFELT % 28))
                                         |s| (QREFELT % 27))
                                        (QREFELT % 23))
                              (QREFELT % 27)))
                            (#1#
                             (SEQ
                              (LETT |s2|
                                    (SPADCALL (SPADCALL 2 (QREFELT % 11)) |s|
                                              (QREFELT % 87)))
                              (LETT |coef|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |pi1| (QREFELT % 22))
                                               (SPADCALL |s1| (QREFELT % 74))
                                               (QREFELT % 87))
                                     (SPADCALL |s2|
                                               (SPADCALL |s1| (QREFELT % 44))
                                               (QREFELT % 9))
                                     (QREFELT % 9)))
                              (EXIT
                               (SPADCALL
                                (SPADCALL |coef|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| % 15)
                                                       (SPADCALL 2
                                                                 (QREFELT %
                                                                          16))
                                                       (QREFELT % 17))
                                             |pi1| (QREFELT % 21))
                                            |s| (QREFELT % 27))
                                           (QREFELT % 45))
                                          (QREFELT % 9))
                                (|FSFUN;zeta_aux2| |s1| |prec| %)
                                (QREFELT % 9)))))))))))))))))) 

(SDEFUN |FSFUN;riemannZeta;2C;29|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|prec| (|PositiveInteger|)) (|obits| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL (QREFELT % 33)) 2)
                  (SEQ (LETT |obits| (SPADCALL (QREFELT % 34)))
                       (LETT |prec| (+ |obits| 5))
                       (EXIT
                        (|finally|
                         (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 39))
                              (EXIT (|FSFUN;zeta_aux| |z| |prec| %)))
                         (SPADCALL |obits| (QREFELT % 39))))))
                 ('T (|error| "riemannZeta can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;lambert_via_newton1;4F;30|
        ((|x| (|Float|)) (|w| (|Float|)) (|eps| (|Float|)) (% (|Float|)))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G172 NIL) (|dw| (|Float|)) (|ew| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 31)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 17))
                                            (QREFELT % 50))
                                  (SPADCALL |w| (|spadConstant| % 15)
                                            (QREFELT % 52))
                                  (QREFELT % 17)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 50)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G171)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 66)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;4F;31|
        ((|lz| (|Float|)) (|w| (|Float|)) (|eps| (|Float|)) (% (|Float|)))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G178 NIL) (|dw| (|Float|)) (|lw| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 28)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 52))
                                            |lz| (QREFELT % 50))
                                  (SPADCALL (|spadConstant| % 15)
                                            (SPADCALL (|spadConstant| % 15) |w|
                                                      (QREFELT % 17))
                                            (QREFELT % 52))
                                  (QREFELT % 17)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 50)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G177)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 66)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3F;32|
        ((|h| (|Float|)) (|h2| (|Float|)) (% (|Float|)))
        (SPROG ((|res| (|Float|)) (|h4| #1=(|Float|)) (|h3| #1#))
               (SEQ
                (LETT |res|
                      (SPADCALL |h|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 1 3 (QREFELT % 95))
                                           (QREFELT % 20))
                                 |h2| (QREFELT % 21))
                                (QREFELT % 50)))
                (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 21)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 11 72 (QREFELT % 95))
                                           (QREFELT % 20))
                                 |h3| (QREFELT % 21))
                                (QREFELT % 52)))
                (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 21)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 43 540 (QREFELT % 95))
                                           (QREFELT % 20))
                                 |h4| (QREFELT % 21))
                                (QREFELT % 50)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 769 17280 (QREFELT % 95))
                                            (QREFELT % 20))
                                  |h3| (QREFELT % 21))
                                 |h2| (QREFELT % 21))
                                (QREFELT % 52)))
                (EXIT
                 (SPADCALL |res|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL 221 8505 (QREFELT % 95))
                                       (QREFELT % 20))
                             |h4| (QREFELT % 21))
                            |h2| (QREFELT % 21))
                           (QREFELT % 50)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;2CFC;33|
        ((|x| (|Complex| (|Float|))) (|w| (|Complex| (|Float|)))
         (|eps| (|Float|)) (% (|Complex| (|Float|))))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G186 NIL) (|dw| (|Complex| (|Float|)))
          (|ew| (|Complex| (|Float|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 29)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 8))
                                            (QREFELT % 24))
                                  (SPADCALL |w| (|spadConstant| % 7)
                                            (QREFELT % 23))
                                  (QREFELT % 8)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 24)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G185)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 67)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;2CFC;34|
        ((|lz| (|Complex| (|Float|))) (|w| (|Complex| (|Float|)))
         (|eps| (|Float|)) (% (|Complex| (|Float|))))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G192 NIL) (|dw| (|Complex| (|Float|)))
          (|lw| (|Complex| (|Float|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 25)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 23))
                                            |lz| (QREFELT % 24))
                                  (SPADCALL (|spadConstant| % 7)
                                            (SPADCALL (|spadConstant| % 7) |w|
                                                      (QREFELT % 8))
                                            (QREFELT % 23))
                                  (QREFELT % 8)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 24)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G191)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 67)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3C;35|
        ((|h| (|Complex| (|Float|))) (|h2| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|h4| #1=(|Complex| (|Float|)))
          (|h3| #1#))
         (SEQ
          (LETT |res|
                (SPADCALL |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 3 (QREFELT % 95))
                                     (QREFELT % 99))
                           |h2| (QREFELT % 9))
                          (QREFELT % 24)))
          (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 9)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 11 72 (QREFELT % 95))
                                     (QREFELT % 99))
                           |h3| (QREFELT % 9))
                          (QREFELT % 23)))
          (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 9)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 43 540 (QREFELT % 95))
                                     (QREFELT % 99))
                           |h4| (QREFELT % 9))
                          (QREFELT % 24)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 769 17280 (QREFELT % 95))
                                      (QREFELT % 99))
                            |h3| (QREFELT % 9))
                           |h2| (QREFELT % 9))
                          (QREFELT % 23)))
          (EXIT
           (SPADCALL |res|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 221 8505 (QREFELT % 95))
                                 (QREFELT % 99))
                       |h4| (QREFELT % 9))
                      |h2| (QREFELT % 9))
                     (QREFELT % 24)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;4Df;36|
        ((|x| (|DoubleFloat|)) (|w| (|DoubleFloat|)) (|eps| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G200 NIL) (|dw| (|DoubleFloat|))
          (|ew| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (|exp_DF| |w|))
                           (LETT |dw|
                                 (|div_DF| (|sub_DF| |w| (|div_DF| |x| |ew|))
                                           (|add_DF| |w| 1.0)))
                           (LETT |w| (|sub_DF| |w| |dw|))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G199)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 69)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;4Df;37|
        ((|lz| (|DoubleFloat|)) (|w| (|DoubleFloat|)) (|eps| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G206 NIL) (|dw| (|DoubleFloat|))
          (|lw| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 80)))
                           (LETT |dw|
                                 (|div_DF| (|sub_DF| (|add_DF| |w| |lw|) |lz|)
                                           (|add_DF| 1.0 (|div_DF| 1.0 |w|))))
                           (LETT |w| (|sub_DF| |w| |dw|))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G205)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 69)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3Df;38|
        ((|h| (|DoubleFloat|)) (|h2| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|res| (|DoubleFloat|)) (|h4| #1=(|DoubleFloat|)) (|h3| #1#))
               (SEQ
                (LETT |res|
                      (|sub_DF| |h|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 1 3 (QREFELT % 95))
                                           (QREFELT % 103))
                                 |h2|)))
                (LETT |h3| (|mul_DF| |h| |h2|))
                (LETT |res|
                      (|add_DF| |res|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 11 72 (QREFELT % 95))
                                           (QREFELT % 103))
                                 |h3|)))
                (LETT |h4| (|mul_DF| |h2| |h2|))
                (LETT |res|
                      (|sub_DF| |res|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 43 540 (QREFELT % 95))
                                           (QREFELT % 103))
                                 |h4|)))
                (LETT |res|
                      (|add_DF| |res|
                                (|mul_DF|
                                 (|mul_DF|
                                  (SPADCALL (SPADCALL 769 17280 (QREFELT % 95))
                                            (QREFELT % 103))
                                  |h3|)
                                 |h2|)))
                (EXIT
                 (|sub_DF| |res|
                           (|mul_DF|
                            (|mul_DF|
                             (SPADCALL (SPADCALL 221 8505 (QREFELT % 95))
                                       (QREFELT % 103))
                             |h4|)
                            |h2|)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;2CDfC;39|
        ((|x| (|Complex| (|DoubleFloat|))) (|w| (|Complex| (|DoubleFloat|)))
         (|eps| (|DoubleFloat|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G214 NIL)
          (|dw| (|Complex| (|DoubleFloat|)))
          (|ew| (|Complex| (|DoubleFloat|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 105)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 106))
                                            (QREFELT % 107))
                                  (SPADCALL |w| (|spadConstant| % 108)
                                            (QREFELT % 109))
                                  (QREFELT % 106)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 107)))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G213)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 73)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;2CDfC;40|
        ((|lz| (|Complex| (|DoubleFloat|))) (|w| (|Complex| (|DoubleFloat|)))
         (|eps| (|DoubleFloat|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G220 NIL)
          (|dw| (|Complex| (|DoubleFloat|)))
          (|lw| (|Complex| (|DoubleFloat|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 111)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 109))
                                            |lz| (QREFELT % 107))
                                  (SPADCALL (|spadConstant| % 108)
                                            (SPADCALL (|spadConstant| % 108)
                                                      |w| (QREFELT % 106))
                                            (QREFELT % 109))
                                  (QREFELT % 106)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 107)))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G219)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 73)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3C;41|
        ((|h| (|Complex| (|DoubleFloat|))) (|h2| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|res| (|Complex| (|DoubleFloat|)))
          (|h4| #1=(|Complex| (|DoubleFloat|))) (|h3| #1#))
         (SEQ
          (LETT |res|
                (SPADCALL |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 3 (QREFELT % 95))
                                     (QREFELT % 113))
                           |h2| (QREFELT % 114))
                          (QREFELT % 107)))
          (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 114)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 11 72 (QREFELT % 95))
                                     (QREFELT % 113))
                           |h3| (QREFELT % 114))
                          (QREFELT % 109)))
          (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 114)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 43 540 (QREFELT % 95))
                                     (QREFELT % 113))
                           |h4| (QREFELT % 114))
                          (QREFELT % 107)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 769 17280 (QREFELT % 95))
                                      (QREFELT % 113))
                            |h3| (QREFELT % 114))
                           |h2| (QREFELT % 114))
                          (QREFELT % 109)))
          (EXIT
           (SPADCALL |res|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 221 8505 (QREFELT % 95))
                                 (QREFELT % 113))
                       |h4| (QREFELT % 114))
                      |h2| (QREFELT % 114))
                     (QREFELT % 107)))))) 

(SDEFUN |FSFUN;lambertW;2Df;42| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|eps| (|DoubleFloat|)) (|ax| (|DoubleFloat|)) (|h| (|DoubleFloat|))
          (|h2| (|DoubleFloat|)) (|e1| (|DoubleFloat|)) (|w| (|DoubleFloat|))
          (|y| #1=(|DoubleFloat|)) (|lx| #1#) (|ox| (|Integer|)))
         (SEQ
          (COND ((|eql_DF| |x| 0.0) |x|)
                (#2='T
                 (SEQ (LETT |eps| (SPADCALL 1 -35 (QREFELT % 116)))
                      (LETT |ox| (SPADCALL |x| (QREFELT % 117)))
                      (EXIT
                       (COND ((< |ox| -70) |x|)
                             (#2#
                              (SEQ
                               (COND
                                ((> |ox| 200)
                                 (COND
                                  ((SPADCALL |x| 0.0 (QREFELT % 118))
                                   (EXIT
                                    (SEQ
                                     (LETT |lx| (SPADCALL |x| (QREFELT % 80)))
                                     (EXIT
                                      (SPADCALL |lx| |lx| |eps|
                                                (QREFELT % 102)))))))))
                               (LETT |w|
                                     (COND
                                      ((SPADCALL |x|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 (QREFELT % 118))
                                       (SEQ
                                        (LETT |y|
                                              (SPADCALL |x| (QREFELT % 80)))
                                        (EXIT
                                         (|sub_DF| |y|
                                                   (SPADCALL |y|
                                                             (QREFELT %
                                                                      80))))))
                                      (#2# (|mul_DF| (|div_DF_I| 1.0 2) |x|))))
                               (EXIT
                                (COND
                                 ((|less_DF| |x|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 190436 517656
                                                         (QREFELT % 95))
                                               (QREFELT % 119))
                                              (QREFELT % 103)))
                                  (|error| "x < -exp(-1)"))
                                 ((|less_DF| |x|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 231087 628160
                                                         (QREFELT % 95))
                                               (QREFELT % 119))
                                              (QREFELT % 103)))
                                  (SEQ (LETT |e1| (|exp_DF| (|minus_DF| 1.0)))
                                       (LETT |h2| (|add_DF| |x| |e1|))
                                       (EXIT
                                        (COND
                                         ((|less_DF| |h2| 0.0)
                                          (|error| "x < -exp(-1)"))
                                         (#2#
                                          (SEQ
                                           (LETT |h2|
                                                 (|div_DF|
                                                  (SPADCALL 2 |h2|
                                                            (QREFELT % 120))
                                                  |e1|))
                                           (LETT |h|
                                                 (SPADCALL |h2|
                                                           (QREFELT % 121)))
                                           (EXIT
                                            (|sub_DF|
                                             (SPADCALL |h| |h2|
                                                       (QREFELT % 104))
                                             1.0))))))))
                                 (#2#
                                  (SEQ
                                   (COND
                                    ((|less_DF| (LETT |ax| (|abs_DF| |x|))
                                                (|div_DF_I| 1.0 2))
                                     (LETT |eps| (|mul_DF| |ax| |eps|))))
                                   (EXIT
                                    (SPADCALL |x| |w| |eps|
                                              (QREFELT % 101))))))))))))))))) 

(SDEFUN |FSFUN;lambertW;2C;43|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|eps| (|DoubleFloat|)) (|w| #1=(|Complex| (|DoubleFloat|)))
          (|y| (|Complex| (|DoubleFloat|))) (|h| (|Complex| (|DoubleFloat|)))
          (|h2| #1#) (|e1| (|DoubleFloat|)) (|lz| (|Complex| (|DoubleFloat|)))
          (|ox| (|Integer|)) (|ax| (|DoubleFloat|)) (|ix| (|DoubleFloat|))
          (|rx| (|DoubleFloat|)))
         (SEQ
          (COND ((SPADCALL |x| (|spadConstant| % 123) (QREFELT % 124)) |x|)
                (#2='T
                 (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 72)))
                      (LETT |ix| (SPADCALL |x| (QREFELT % 125)))
                      (LETT |ax| (|add_DF| (|abs_DF| |rx|) (|abs_DF| |ix|)))
                      (LETT |eps| (SPADCALL 1 -35 (QREFELT % 116)))
                      (LETT |ox| (SPADCALL |ax| (QREFELT % 117)))
                      (EXIT
                       (COND ((< |ox| -70) |x|)
                             ((> |ox| 200)
                              (SEQ
                               (LETT |lz|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |ax| (QREFELT % 80))
                                                0.0 (QREFELT % 126))
                                      (SPADCALL
                                       (SPADCALL (|div_DF| |rx| |ax|)
                                                 (|div_DF| |ix| |ax|)
                                                 (QREFELT % 126))
                                       (QREFELT % 111))
                                      (QREFELT % 109)))
                               (EXIT
                                (SPADCALL |lz| |lz| |eps| (QREFELT % 112)))))
                             (#2#
                              (SEQ
                               (COND
                                ((|less_DF| (|abs_DF| |ix|)
                                            (SPADCALL
                                             (SPADCALL 1 4194304
                                                       (QREFELT % 95))
                                             (QREFELT % 103)))
                                 (COND
                                  ((|less_DF| |rx|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 231087 628160
                                                          (QREFELT % 95))
                                                (QREFELT % 119))
                                               (QREFELT % 103)))
                                   (COND
                                    ((|less_DF|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL 56258 152925 (QREFELT % 95))
                                        (QREFELT % 119))
                                       (QREFELT % 103))
                                      |rx|)
                                     (EXIT
                                      (SEQ
                                       (LETT |e1| (|exp_DF| (|minus_DF| 1.0)))
                                       (LETT |h2|
                                             (SPADCALL
                                              (SPADCALL 2 (|div_DF| 1.0 |e1|)
                                                        (QREFELT % 120))
                                              (SPADCALL |x|
                                                        (SPADCALL |e1| 0.0
                                                                  (QREFELT %
                                                                           126))
                                                        (QREFELT % 109))
                                              (QREFELT % 127)))
                                       (LETT |h|
                                             (SPADCALL |h2| (QREFELT % 128)))
                                       (EXIT
                                        (SPADCALL
                                         (SPADCALL |h| |h2| (QREFELT % 115))
                                         (|spadConstant| % 108)
                                         (QREFELT % 107)))))))))))
                               (LETT |w|
                                     (COND
                                      ((SPADCALL |ax|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 (QREFELT % 118))
                                       (SEQ
                                        (LETT |y|
                                              (SPADCALL |x| (QREFELT % 111)))
                                        (EXIT
                                         (SPADCALL |y|
                                                   (SPADCALL |y|
                                                             (QREFELT % 111))
                                                   (QREFELT % 107)))))
                                      (#2#
                                       (SPADCALL (|div_DF_I| 1.0 2) |x|
                                                 (QREFELT % 127)))))
                               (COND
                                ((|less_DF| |ax| (|div_DF_I| 1.0 2))
                                 (LETT |eps| (|mul_DF| |ax| |eps|))))
                               (EXIT
                                (SPADCALL |x| |w| |eps|
                                          (QREFELT % 110))))))))))))) 

(SDEFUN |FSFUN;lambertW;2F;44| ((|x| (|Float|)) (% (|Float|)))
        (SPROG
         ((|eps| (|Float|)) (|w| (|Float|)) (|y| #1=(|Float|)) (|w1| (|Float|))
          (|h| (|Float|)) (|h2| (|Float|)) (|e1| (|Float|))
          (|cbit2| (|NonNegativeInteger|)) (|lx| #1#) (|ox| (|Integer|))
          (|ax| (|Float|)) (|cbit| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (COND ((SPADCALL |x| (|spadConstant| % 57) (QREFELT % 130)) |x|)
                  (#2='T
                   (SEQ (LETT |cbit| (SPADCALL (QREFELT % 34)))
                        (LETT |eps|
                              (SPADCALL 1 (- (QUOTIENT2 (* 2 |cbit|) 3))
                                        (QREFELT % 131)))
                        (LETT |ax| (SPADCALL |x| (QREFELT % 65)))
                        (LETT |ox| (SPADCALL |ax| (QREFELT % 49)))
                        (EXIT
                         (COND ((< |ox| (- (- |cbit|) 10)) |x|)
                               (#2#
                                (SEQ
                                 (COND
                                  ((> |ox| 200)
                                   (COND
                                    ((SPADCALL |x| (|spadConstant| % 57)
                                               (QREFELT % 48))
                                     (EXIT
                                      (SEQ
                                       (LETT |lx|
                                             (SPADCALL |x| (QREFELT % 28)))
                                       (EXIT
                                        (SPADCALL |lx| |lx| |eps|
                                                  (QREFELT % 94)))))))))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |x|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 190436 517656
                                                          (QREFELT % 95))
                                                (QREFELT % 119))
                                               (QREFELT % 20))
                                              (QREFELT % 38))
                                    (|error| "x < -exp(-1)"))
                                   ((SPADCALL |x|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 190434 517656
                                                          (QREFELT % 95))
                                                (QREFELT % 119))
                                               (QREFELT % 20))
                                              (QREFELT % 38))
                                    (SEQ (LETT |cbit2| (QUOTIENT2 |cbit| 2))
                                         (SPADCALL (+ |cbit| |cbit2|)
                                                   (QREFELT % 39))
                                         (LETT |e1|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| % 15)
                                                          (QREFELT % 30))
                                                (QREFELT % 31)))
                                         (LETT |h2|
                                               (SPADCALL |x| |e1|
                                                         (QREFELT % 52)))
                                         (LETT |h|
                                               (SPADCALL |h2| (QREFELT % 76)))
                                         (SPADCALL |cbit| (QREFELT % 39))
                                         (EXIT
                                          (COND
                                           ((SPADCALL |h2|
                                                      (|spadConstant| % 57)
                                                      (QREFELT % 38))
                                            (|error| "x < -exp(-1)"))
                                           (#2#
                                            (SEQ
                                             (LETT |w1|
                                                   (SPADCALL |h| |h2|
                                                             (QREFELT % 96)))
                                             (EXIT
                                              (COND
                                               ((<
                                                 (SPADCALL |w1| (QREFELT % 49))
                                                 (- |cbit2|))
                                                (SPADCALL |w1|
                                                          (|spadConstant| % 15)
                                                          (QREFELT % 50)))
                                               (#2#
                                                (SPADCALL |x|
                                                          (SPADCALL |w1|
                                                                    (|spadConstant|
                                                                     % 15)
                                                                    (QREFELT %
                                                                             50))
                                                          |eps|
                                                          (QREFELT %
                                                                   93)))))))))))
                                   (#2#
                                    (SEQ
                                     (LETT |w|
                                           (COND
                                            ((SPADCALL |x|
                                                       (SPADCALL 2
                                                                 (QREFELT %
                                                                          16))
                                                       (QREFELT % 48))
                                             (SEQ
                                              (LETT |y|
                                                    (SPADCALL |x|
                                                              (QREFELT % 28)))
                                              (EXIT
                                               (SPADCALL |y|
                                                         (SPADCALL |y|
                                                                   (QREFELT %
                                                                            28))
                                                         (QREFELT % 50)))))
                                            (#2#
                                             (SPADCALL
                                              (SPADCALL 5 -1 10
                                                        (QREFELT % 132))
                                              |x| (QREFELT % 21)))))
                                     (COND
                                      ((SPADCALL (SPADCALL |x| (QREFELT % 65))
                                                 (SPADCALL
                                                  (SPADCALL 1 2 (QREFELT % 95))
                                                  (QREFELT % 20))
                                                 (QREFELT % 38))
                                       (LETT |eps|
                                             (SPADCALL |ax| |eps|
                                                       (QREFELT % 21)))))
                                     (EXIT
                                      (SPADCALL |x| |w| |eps|
                                                (QREFELT % 93)))))))))))))))
           (#2# (|error| "lambertW can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;lambertW;2C;45|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|w1| (|Complex| (|Float|))) (|h| (|Complex| (|Float|)))
          (|h2| (|Complex| (|Float|))) (|e1| (|Float|))
          (|cbit2| (|NonNegativeInteger|)) (|eps| (|Float|))
          (|w| (|Complex| (|Float|))) (|wd| (|Complex| (|DoubleFloat|)))
          (|izd| (|DoubleFloat|)) (|rzd| (|DoubleFloat|))
          (|lz| (|Complex| (|Float|))) (|oz| (|Integer|)) (|abs_z| (|Float|))
          (|cbit| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (COND ((SPADCALL |z| (|spadConstant| % 42) (QREFELT % 43)) |z|)
                  (#1='T
                   (SEQ (LETT |cbit| (SPADCALL (QREFELT % 34)))
                        (LETT |eps|
                              (SPADCALL 1 (- (QUOTIENT2 (* 2 |cbit|) 3))
                                        (QREFELT % 131)))
                        (LETT |abs_z| (SPADCALL |z| (QREFELT % 67)))
                        (LETT |oz| (SPADCALL |abs_z| (QREFELT % 49)))
                        (EXIT
                         (COND ((< |oz| (- (- |cbit|) 10)) |z|)
                               ((> |oz| 200)
                                (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 25)))
                                     (EXIT
                                      (SPADCALL |lz| |lz| |eps|
                                                (QREFELT % 98)))))
                               (#1#
                                (SEQ
                                 (LETT |rzd|
                                       (SPADCALL (SPADCALL |z| (QREFELT % 35))
                                                 (QREFELT % 134)))
                                 (COND
                                  ((OR
                                    (SPADCALL (SPADCALL |z| (QREFELT % 54))
                                              (SPADCALL (|spadConstant| % 15)
                                                        1000000 (QREFELT % 36))
                                              (QREFELT % 48))
                                    (OR
                                     (|less_DF| |rzd|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL 190436 517656
                                                            (QREFELT % 95))
                                                  (QREFELT % 119))
                                                 (QREFELT % 103)))
                                     (SPADCALL |rzd|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL 190434 517656
                                                           (QREFELT % 95))
                                                 (QREFELT % 119))
                                                (QREFELT % 103))
                                               (QREFELT % 118))))
                                   (EXIT
                                    (SEQ
                                     (LETT |izd|
                                           (SPADCALL
                                            (SPADCALL |z| (QREFELT % 54))
                                            (QREFELT % 134)))
                                     (LETT |wd|
                                           (SPADCALL
                                            (SPADCALL |rzd| |izd|
                                                      (QREFELT % 126))
                                            (QREFELT % 129)))
                                     (LETT |w|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |wd| (QREFELT % 72))
                                             (QREFELT % 135))
                                            (SPADCALL
                                             (SPADCALL |wd| (QREFELT % 125))
                                             (QREFELT % 135))
                                            (QREFELT % 58)))
                                     (COND
                                      ((SPADCALL |abs_z|
                                                 (SPADCALL
                                                  (|spadConstant| % 15) 2
                                                  (QREFELT % 36))
                                                 (QREFELT % 38))
                                       (LETT |eps|
                                             (SPADCALL |abs_z| |eps|
                                                       (QREFELT % 21)))))
                                     (EXIT
                                      (SPADCALL |z| |w| |eps|
                                                (QREFELT % 97)))))))
                                 (LETT |cbit2| (QUOTIENT2 |cbit| 2))
                                 (SPADCALL (+ |cbit| |cbit2|) (QREFELT % 39))
                                 (LETT |e1|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 15)
                                                  (QREFELT % 30))
                                        (QREFELT % 31)))
                                 (LETT |h2|
                                       (SPADCALL |z|
                                                 (SPADCALL |e1|
                                                           (|spadConstant| %
                                                                           57)
                                                           (QREFELT % 58))
                                                 (QREFELT % 23)))
                                 (LETT |h| (SPADCALL |h2| (QREFELT % 136)))
                                 (SPADCALL |cbit| (QREFELT % 39))
                                 (LETT |w1|
                                       (SPADCALL |h| |h2| (QREFELT % 100)))
                                 (EXIT
                                  (COND
                                   ((<
                                     (SPADCALL (SPADCALL |h2| (QREFELT % 67))
                                               (QREFELT % 49))
                                     (- |cbit2|))
                                    (SPADCALL |w1| (|spadConstant| % 7)
                                              (QREFELT % 24)))
                                   (#1#
                                    (SPADCALL |z|
                                              (SPADCALL |w1|
                                                        (|spadConstant| % 7)
                                                        (QREFELT % 24))
                                              |eps| (QREFELT % 97)))))))))))))
           (#1# (|error| "lambertW can only handle base 2 Float-s")))))) 

(DECLAIM (NOTINLINE |FloatSpecialFunctions;|)) 

(DEFUN |FloatSpecialFunctions;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FloatSpecialFunctions|))
          (LETT % (GETREFV 138))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatSpecialFunctions| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FloatSpecialFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G267)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FloatSpecialFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FloatSpecialFunctions|
                             (LIST
                              (CONS NIL (CONS 1 (|FloatSpecialFunctions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FloatSpecialFunctions|)))))))))) 

(MAKEPROP '|FloatSpecialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| 14) (0 . |One|) (4 . /)
              (10 . *) (|Integer|) (16 . |coerce|) (|Fraction| 10) (21 . |One|)
              (|Float|) (25 . |One|) (29 . |coerce|) (34 . /)
              (|IntegerNumberTheoryFunctions|) (40 . |bernoulli|)
              (45 . |coerce|) (50 . *) (56 . |coerce|) (61 . +) (67 . -)
              (73 . |log|) (78 . |pi|) (82 . *) (88 . |log|) (93 . |exp|)
              (98 . -) (103 . |exp|) (|PositiveInteger|) (108 . |base|)
              (112 . |bits|) (116 . |real|) (121 . /) (|Boolean|) (127 . <)
              (133 . |bits|) (138 . |round|) (143 . |retract|) (148 . |Zero|)
              (152 . =) |FSFUN;Gamma;2C;5| (158 . |sin|) (163 . |abs|)
              (168 . *) (174 . >) (180 . |order|) (185 . -) (191 . |log2|)
              (195 . +) (201 . |wholePart|) (206 . |imag|) (211 . |pi|)
              (215 . |imaginary|) (219 . |Zero|) (223 . |complex|)
              |FSFUN;logGamma;2C;7| |FSFUN;Gamma;2F;8| (229 . <=)
              |FSFUN;logGamma;2F;9| |FSFUN;Beta;3C;10| |FSFUN;Beta;3F;11|
              (235 . |abs|) |FSFUN;rabs;2F;12| |FSFUN;rabs;CF;13|
              (|DoubleFloat|) |FSFUN;rabs;2Df;14| (|Complex| 68) (240 . |abs|)
              (245 . |real|) |FSFUN;rabs;CDf;15| (250 . -) (255 . |norm|)
              (260 . |sqrt|) (265 . |cos|) |FSFUN;digamma;2C;18|
              |FSFUN;digamma;2F;19| (270 . |log|) (275 . |convert|)
              (280 . |round|) (285 . |retract|) (290 . >=) |FSFUN;li2;2C;22|
              |FSFUN;dilog;2C;24| (296 . ^) (|FloatLiouvilianFunctions|)
              (302 . |gamma|) (306 . *) (312 . ^) |FSFUN;riemannZeta;2C;29|
              |FSFUN;lambert_via_newton1;4F;30|
              |FSFUN;lambert_via_newton2;4F;31| (318 . /)
              |FSFUN;lambert_inverse_series;3F;32|
              |FSFUN;lambert_via_newton1;2CFC;33|
              |FSFUN;lambert_via_newton2;2CFC;34| (324 . |coerce|)
              |FSFUN;lambert_inverse_series;3C;35|
              |FSFUN;lambert_via_newton1;4Df;36|
              |FSFUN;lambert_via_newton2;4Df;37| (329 . |coerce|)
              |FSFUN;lambert_inverse_series;3Df;38| (334 . |exp|) (339 . /)
              (345 . -) (351 . |One|) (355 . +)
              |FSFUN;lambert_via_newton1;2CDfC;39| (361 . |log|)
              |FSFUN;lambert_via_newton2;2CDfC;40| (366 . |coerce|) (371 . *)
              |FSFUN;lambert_inverse_series;3C;41| (377 . |float|)
              (383 . |order|) (388 . >) (394 . -) (399 . *) (405 . |sqrt|)
              |FSFUN;lambertW;2Df;42| (410 . |Zero|) (414 . =) (420 . |imag|)
              (425 . |complex|) (431 . *) (437 . |sqrt|) |FSFUN;lambertW;2C;43|
              (442 . =) (448 . |float|) (454 . |float|) |FSFUN;lambertW;2F;44|
              (461 . |coerce|) (466 . |convert|) (471 . |sqrt|)
              |FSFUN;lambertW;2C;45|)
           '#(|riemannZeta| 476 |rabs| 481 |logGamma| 501 |li2| 511
              |lambert_via_newton2| 516 |lambert_via_newton1| 544
              |lambert_inverse_series| 572 |lambertW| 596 |dilog| 616 |digamma|
              621 |Gamma| 631 |Beta| 641)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|logGamma| ((|Float|) (|Float|))) T)
                                   '((|logGamma|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|Gamma| ((|Float|) (|Float|))) T)
                                   '((|Gamma|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|digamma| ((|Float|) (|Float|))) T)
                                   '((|digamma|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|Beta| ((|Float|) (|Float|) (|Float|)))
                                     T)
                                   '((|Beta|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|lambertW| ((|Float|) (|Float|))) T)
                                   '((|lambertW|
                                      ((|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|lambertW|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|lambertW|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))))
                                     T)
                                   '((|dilog|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|li2|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|riemannZeta|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|rabs| ((|Float|) (|Float|))) T)
                                   '((|rabs| ((|Float|) (|Complex| (|Float|))))
                                     T)
                                   '((|rabs| ((|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|rabs|
                                      ((|DoubleFloat|)
                                       (|Complex| (|DoubleFloat|))))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|Float|) (|Float|) (|Float|)
                                       (|Float|)))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|DoubleFloat|) (|DoubleFloat|)
                                       (|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|)) (|Float|)))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|DoubleFloat|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|Float|) (|Float|) (|Float|)
                                       (|Float|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|DoubleFloat|) (|DoubleFloat|)
                                       (|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|)) (|Float|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|DoubleFloat|)))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|Float|) (|Float|) (|Float|)))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|DoubleFloat|) (|DoubleFloat|)
                                       (|DoubleFloat|)))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 137
                                            '(0 6 0 7 2 6 0 0 0 8 2 6 0 0 0 9 1
                                              6 0 10 11 0 12 0 13 0 14 0 15 1
                                              14 0 10 16 2 14 0 0 0 17 1 18 12
                                              10 19 1 14 0 12 20 2 14 0 0 0 21
                                              1 6 0 14 22 2 6 0 0 0 23 2 6 0 0
                                              0 24 1 6 0 0 25 0 6 0 26 2 6 0 14
                                              0 27 1 14 0 0 28 1 6 0 0 29 1 14
                                              0 0 30 1 14 0 0 31 0 14 32 33 0
                                              14 32 34 1 6 14 0 35 2 14 0 0 10
                                              36 2 14 37 0 0 38 1 14 32 32 39 1
                                              14 0 0 40 1 14 10 0 41 0 6 0 42 2
                                              6 37 0 0 43 1 6 0 0 45 1 6 0 0 46
                                              2 14 0 32 0 47 2 14 37 0 0 48 1
                                              14 10 0 49 2 14 0 0 0 50 0 14 0
                                              51 2 14 0 0 0 52 1 14 10 0 53 1 6
                                              14 0 54 0 14 0 55 0 6 0 56 0 14 0
                                              57 2 6 0 14 14 58 2 14 37 0 0 61
                                              1 14 0 0 65 1 70 0 0 71 1 70 68 0
                                              72 1 6 0 0 74 1 6 14 0 75 1 14 0
                                              0 76 1 6 0 0 77 1 68 0 0 80 1 14
                                              68 0 81 1 68 0 0 82 1 68 10 0 83
                                              2 14 37 0 0 84 2 6 0 0 0 87 0 88
                                              6 89 2 6 0 0 14 90 2 14 0 0 10 91
                                              2 12 0 10 10 95 1 6 0 12 99 1 68
                                              0 12 103 1 70 0 0 105 2 70 0 0 0
                                              106 2 70 0 0 0 107 0 70 0 108 2
                                              70 0 0 0 109 1 70 0 0 111 1 70 0
                                              12 113 2 70 0 0 0 114 2 68 0 10
                                              10 116 1 68 10 0 117 2 68 37 0 0
                                              118 1 12 0 0 119 2 68 0 32 0 120
                                              1 68 0 0 121 0 70 0 123 2 70 37 0
                                              0 124 1 70 68 0 125 2 70 0 68 68
                                              126 2 70 0 68 0 127 1 70 0 0 128
                                              2 14 37 0 0 130 2 14 0 10 10 131
                                              3 14 0 10 10 32 132 1 14 68 0 134
                                              1 14 0 68 135 1 6 0 0 136 1 0 6 6
                                              92 1 0 68 68 69 1 0 68 70 73 1 0
                                              14 14 66 1 0 14 6 67 1 0 6 6 59 1
                                              0 14 14 62 1 0 6 6 85 3 0 6 6 6
                                              14 98 3 0 70 70 70 68 112 3 0 14
                                              14 14 14 94 3 0 68 68 68 68 102 3
                                              0 6 6 6 14 97 3 0 70 70 70 68 110
                                              3 0 14 14 14 14 93 3 0 68 68 68
                                              68 101 2 0 6 6 6 100 2 0 70 70 70
                                              115 2 0 14 14 14 96 2 0 68 68 68
                                              104 1 0 70 70 129 1 0 68 68 122 1
                                              0 6 6 137 1 0 14 14 133 1 0 6 6
                                              86 1 0 6 6 78 1 0 14 14 79 1 0 6
                                              6 44 1 0 14 14 60 2 0 6 6 6 63 2
                                              0 14 14 14 64)))))
           '|lookupComplete|)) 
