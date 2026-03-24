
(SDEFUN |RSIMP;str_to_expr| ((|s| (|String|)) (% (|Expression| (|Integer|))))
        (SPROG ((|av| (|Any|)) (|af| (|InputForm|)))
               (SEQ (LETT |af| (SPADCALL |s| (QREFELT % 8)))
                    (LETT |av| (SPADCALL |af| (QREFELT % 10)))
                    (EXIT (SPADCALL |av| (QREFELT % 13)))))) 

(SDEFUN |RSIMP;rsimp1_gen_2|
        ((|av| (|Expression| (|Integer|))) (|bv| (|Expression| (|Integer|)))
         (|rv| (|Expression| (|Integer|)))
         (|pcu| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|ps| (|Expression| (|Integer|)))
         (% (|Union| (|List| (|Expression| (|Integer|))) "failed")))
        (SPROG
         ((#1=#:G26 NIL) (|sv| (|Expression| (|Integer|)))
          (|el2| (|List| (|Equation| (|Expression| (|Integer|)))))
          (|cv| (|Expression| (|Integer|)))
          (|fp| #2=(|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (#3=#:G27 NIL) (|fac| NIL)
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #2#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|pcue| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|el1| (|List| (|Equation| (|Expression| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |el1|
                  (LIST (SPADCALL (QREFELT % 16) |av| (QREFELT % 58))
                        (SPADCALL (QREFELT % 17) |bv| (QREFELT % 58))
                        (SPADCALL (QREFELT % 22) |rv| (QREFELT % 58))))
            (LETT |pcue|
                  (SPADCALL (CONS #'|RSIMP;rsimp1_gen_2!0| (VECTOR % |el1|))
                            |pcu| (QREFELT % 62)))
            (LETT |fl|
                  (SPADCALL (SPADCALL |pcue| (QREFELT % 64)) (QREFELT % 69)))
            (SEQ (LETT |fac| NIL) (LETT #3# |fl|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |fac| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ (LETT |fp| (QVELT |fac| 1))
                      (EXIT
                       (COND
                        ((EQL (SPADCALL |fp| (QREFELT % 71)) 1)
                         (SEQ
                          (LETT |cv|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |fp| 0 (QREFELT % 73))
                                           (SPADCALL |fp| (QREFELT % 74))
                                           (QREFELT % 38))
                                 (QREFELT % 37)))
                          (LETT |el2|
                                (CONS
                                 (SPADCALL (SPADCALL '|c| (QREFELT % 15)) |cv|
                                           (QREFELT % 58))
                                 |el1|))
                          (LETT |sv| (SPADCALL |ps| |el2| (QREFELT % 60)))
                          (EXIT
                           (PROGN
                            (LETT #1#
                                  (CONS 0
                                        (LIST |sv| |cv|
                                              (|spadConstant| % 40))))
                            (GO #4=#:G25))))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #4# (EXIT #1#)))) 

(SDEFUN |RSIMP;rsimp1_gen_2!0| ((|c1| NIL) ($$ NIL))
        (PROG (|el1| %)
          (LETT |el1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c1| |el1| (QREFELT % 60)))))) 

(SDEFUN |RSIMP;rsimp_gen_2a|
        ((|rl| (|List| (|Expression| (|Integer|))))
         (|rv| (|Expression| (|Integer|)))
         (% (|Union| (|List| (|Expression| (|Integer|))) "failed")))
        (SPROG
         ((|res2| (|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|av| #1=(|Expression| (|Integer|))) (|bv| #1#) (|s| #1#)
          (|tmp| (|Expression| (|Integer|))))
         (SEQ (LETT |s| (SPADCALL |rl| 1 (QREFELT % 76)))
              (LETT |av| (SPADCALL |rl| 2 (QREFELT % 76)))
              (LETT |bv| (SPADCALL |rl| 3 (QREFELT % 76)))
              (LETT |res2|
                    (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 36)
                     (QREFELT % 39) %))
              (COND
               ((QEQCAR |res2| 1)
                (SEQ (LETT |tmp| (SPADCALL |rv| |bv| (QREFELT % 25)))
                     (LETT |s| (SPADCALL |s| |rv| (QREFELT % 38)))
                     (LETT |bv| |av|) (LETT |av| |tmp|)
                     (EXIT
                      (LETT |res2|
                            (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 36)
                             (QREFELT % 39) %))))))
              (EXIT
               (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                     ('T (CONS 0 (CONS |s| (QCDR |res2|))))))))) 

(SDEFUN |RSIMP;rsimp_gen_2|
        ((|av| (|Expression| (|Integer|))) (|bv| (|Expression| (|Integer|)))
         (|rv| (|Expression| (|Integer|))) (|k| (|Integer|))
         (% (|Union| (|List| (|Expression| (|Integer|))) "failed")))
        (SPROG
         ((|r3l| (|List| (|Expression| (|Integer|))))
          (|res3| #1=(|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|r2l| (|List| (|Expression| (|Integer|))))
          (|s| (|Expression| (|Integer|))) (|res2| #1#)
          (|res1| (|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|r1l| (|List| (|Expression| (|Integer|)))))
         (SEQ
          (COND
           ((EQL |k| 2)
            (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 36) (QREFELT % 39)
             %))
           ((EQL |k| 3)
            (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 44) (QREFELT % 45)
             %))
           ((EQL |k| 4)
            (SEQ
             (LETT |res1|
                   (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 36)
                    (QREFELT % 39) %))
             (EXIT
              (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                    (#2='T
                     (SEQ
                      (LETT |res2| (|RSIMP;rsimp_gen_2a| (QCDR |res1|) |rv| %))
                      (EXIT
                       (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                             (#2#
                              (SEQ (LETT |r2l| (QCDR |res2|))
                                   (EXIT
                                    (CONS 0
                                          (LIST
                                           (SPADCALL
                                            (SPADCALL |r2l| 1 (QREFELT % 76))
                                            (SPADCALL
                                             (SPADCALL |r2l| 2 (QREFELT % 76))
                                             2 (QREFELT % 77))
                                            (QREFELT % 25))
                                           (SPADCALL |r2l| 3 (QREFELT % 76))
                                           (SPADCALL |r2l| 4
                                                     (QREFELT %
                                                              76)))))))))))))))
           ((EQL |k| 5)
            (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 47) (QREFELT % 48)
             %))
           ((EQL |k| 6)
            (SEQ
             (LETT |res1|
                   (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 36)
                    (QREFELT % 39) %))
             (EXIT
              (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                    (#2#
                     (SEQ (LETT |r1l| (QCDR |res1|))
                          (LETT |res2|
                                (|RSIMP;rsimp1_gen_2|
                                 (SPADCALL |r1l| 2 (QREFELT % 76))
                                 (SPADCALL |r1l| 3 (QREFELT % 76)) |rv|
                                 (QREFELT % 44) (QREFELT % 45) %))
                          (EXIT
                           (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                                 (#2#
                                  (SEQ (LETT |r2l| (QCDR |res2|))
                                       (EXIT
                                        (CONS 0
                                              (LIST
                                               (SPADCALL
                                                (SPADCALL |r1l| 1
                                                          (QREFELT % 76))
                                                (SPADCALL
                                                 (SPADCALL |r2l| 1
                                                           (QREFELT % 76))
                                                 2 (QREFELT % 77))
                                                (QREFELT % 25))
                                               (SPADCALL |r2l| 2
                                                         (QREFELT % 76))
                                               (SPADCALL |r2l| 3
                                                         (QREFELT %
                                                                  76)))))))))))))))
           ((EQL |k| 7)
            (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 50) (QREFELT % 51)
             %))
           ((EQL |k| 8)
            (SEQ
             (LETT |res1|
                   (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 36)
                    (QREFELT % 39) %))
             (EXIT
              (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                    (#2#
                     (SEQ
                      (LETT |res2| (|RSIMP;rsimp_gen_2a| (QCDR |res1|) |rv| %))
                      (EXIT
                       (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                             (#2#
                              (SEQ (LETT |r2l| (QCDR |res2|))
                                   (LETT |s| (SPADCALL |r2l| 1 (QREFELT % 76)))
                                   (LETT |res3|
                                         (|RSIMP;rsimp_gen_2a| (CDR |r2l|) |rv|
                                          %))
                                   (EXIT
                                    (COND ((QEQCAR |res3| 1) (CONS 1 "failed"))
                                          (#2#
                                           (SEQ (LETT |r3l| (QCDR |res3|))
                                                (EXIT
                                                 (CONS 0
                                                       (LIST
                                                        (SPADCALL
                                                         (SPADCALL |s|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |r3l| 1
                                                                     (QREFELT %
                                                                              76))
                                                                    2
                                                                    (QREFELT %
                                                                             77))
                                                                   (QREFELT %
                                                                            25))
                                                         (SPADCALL
                                                          (SPADCALL |r3l| 2
                                                                    (QREFELT %
                                                                             76))
                                                          4 (QREFELT % 77))
                                                         (QREFELT % 25))
                                                        (SPADCALL |r3l| 3
                                                                  (QREFELT %
                                                                           76))
                                                        (SPADCALL |r3l| 4
                                                                  (QREFELT %
                                                                           76)))))))))))))))))))
           ((EQL |k| 9)
            (SEQ
             (LETT |res1|
                   (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 44)
                    (QREFELT % 45) %))
             (EXIT
              (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                    (#2#
                     (SEQ (LETT |r1l| (QCDR |res1|))
                          (LETT |res2|
                                (|RSIMP;rsimp1_gen_2|
                                 (SPADCALL |r1l| 2 (QREFELT % 76))
                                 (SPADCALL |r1l| 3 (QREFELT % 76)) |rv|
                                 (QREFELT % 44) (QREFELT % 45) %))
                          (EXIT
                           (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                                 (#2#
                                  (SEQ (LETT |r2l| (QCDR |res2|))
                                       (EXIT
                                        (CONS 0
                                              (LIST
                                               (SPADCALL
                                                (SPADCALL |r1l| 1
                                                          (QREFELT % 76))
                                                (SPADCALL
                                                 (SPADCALL |r2l| 1
                                                           (QREFELT % 76))
                                                 3 (QREFELT % 77))
                                                (QREFELT % 25))
                                               (SPADCALL |r2l| 2
                                                         (QREFELT % 76))
                                               (SPADCALL |r2l| 3
                                                         (QREFELT %
                                                                  76)))))))))))))))
           ((EQL |k| 10)
            (SEQ
             (LETT |res1|
                   (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 36)
                    (QREFELT % 39) %))
             (EXIT
              (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                    (#2#
                     (SEQ (LETT |r1l| (QCDR |res1|))
                          (LETT |res2|
                                (|RSIMP;rsimp1_gen_2|
                                 (SPADCALL |r1l| 2 (QREFELT % 76))
                                 (SPADCALL |r1l| 3 (QREFELT % 76)) |rv|
                                 (QREFELT % 47) (QREFELT % 48) %))
                          (EXIT
                           (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                                 (#2#
                                  (SEQ (LETT |r2l| (QCDR |res2|))
                                       (EXIT
                                        (CONS 0
                                              (LIST
                                               (SPADCALL
                                                (SPADCALL |r1l| 1
                                                          (QREFELT % 76))
                                                (SPADCALL
                                                 (SPADCALL |r2l| 1
                                                           (QREFELT % 76))
                                                 2 (QREFELT % 77))
                                                (QREFELT % 25))
                                               (SPADCALL |r2l| 2
                                                         (QREFELT % 76))
                                               (SPADCALL |r2l| 3
                                                         (QREFELT %
                                                                  76)))))))))))))))
           ((EQL |k| 11)
            (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 53) (QREFELT % 54)
             %))
           ((EQL |k| 12)
            (SEQ
             (LETT |res1|
                   (|RSIMP;rsimp1_gen_2| |av| |bv| |rv| (QREFELT % 36)
                    (QREFELT % 39) %))
             (EXIT
              (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                    (#2#
                     (SEQ
                      (LETT |res2| (|RSIMP;rsimp_gen_2a| (QCDR |res1|) |rv| %))
                      (EXIT
                       (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                             (#2#
                              (SEQ (LETT |r2l| (QCDR |res2|))
                                   (LETT |s| (SPADCALL |r2l| 1 (QREFELT % 76)))
                                   (LETT |r2l| (CDR |r2l|))
                                   (LETT |res3|
                                         (|RSIMP;rsimp1_gen_2|
                                          (SPADCALL |r2l| 2 (QREFELT % 76))
                                          (SPADCALL |r2l| 3 (QREFELT % 76))
                                          |rv| (QREFELT % 44) (QREFELT % 45)
                                          %))
                                   (EXIT
                                    (COND ((QEQCAR |res3| 1) (CONS 1 "failed"))
                                          (#2#
                                           (SEQ (LETT |r3l| (QCDR |res3|))
                                                (EXIT
                                                 (CONS 0
                                                       (LIST
                                                        (SPADCALL
                                                         (SPADCALL |s|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |r2l| 1
                                                                     (QREFELT %
                                                                              76))
                                                                    2
                                                                    (QREFELT %
                                                                             77))
                                                                   (QREFELT %
                                                                            25))
                                                         (SPADCALL
                                                          (SPADCALL |r3l| 1
                                                                    (QREFELT %
                                                                             76))
                                                          4 (QREFELT % 77))
                                                         (QREFELT % 25))
                                                        (SPADCALL |r3l| 2
                                                                  (QREFELT %
                                                                           76))
                                                        (SPADCALL |r3l| 3
                                                                  (QREFELT %
                                                                           76)))))))))))))))))))
           (#2# (CONS 1 "failed")))))) 

(SDEFUN |RSIMP;rsimp1_gen_3|
        ((|av| (|Expression| (|Integer|))) (|bv| (|Expression| (|Integer|)))
         (|cv| (|Expression| (|Integer|))) (|rv| (|Expression| (|Integer|)))
         (|pcu| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|pd| (|Expression| (|Integer|))) (|ps| (|Expression| (|Integer|)))
         (% (|Union| (|List| (|Expression| (|Integer|))) "failed")))
        (SPROG
         ((#1=#:G64 NIL) (|sv| #2=(|Expression| (|Integer|))) (#3=#:G63 NIL)
          (|sden| #4=(|Expression| (|Integer|)))
          (|el3| #5=(|List| (|Equation| (|Expression| (|Integer|)))))
          (|dv| #2#) (|dden| #4#) (|el2| #5#) (|ev| (|Expression| (|Integer|)))
          (|fp| #6=(|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (#7=#:G65 NIL) (|fac| NIL)
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #6#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|pcue| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|el1| (|List| (|Equation| (|Expression| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |el1|
                  (LIST (SPADCALL (QREFELT % 16) |av| (QREFELT % 58))
                        (SPADCALL (QREFELT % 17) |bv| (QREFELT % 58))
                        (SPADCALL (QREFELT % 18) |cv| (QREFELT % 58))
                        (SPADCALL (QREFELT % 22) |rv| (QREFELT % 58))))
            (LETT |pcue|
                  (SPADCALL (CONS #'|RSIMP;rsimp1_gen_3!0| (VECTOR % |el1|))
                            |pcu| (QREFELT % 62)))
            (LETT |fl|
                  (SPADCALL (SPADCALL |pcue| (QREFELT % 64)) (QREFELT % 69)))
            (SEQ (LETT |fac| NIL) (LETT #7# |fl|) G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |fac| (CAR #7#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |fp| (QVELT |fac| 1))
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |fp| (QREFELT % 71)) 1)
                           (SEQ
                            (LETT |ev|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |fp| 0 (QREFELT % 73))
                                             (SPADCALL |fp| (QREFELT % 74))
                                             (QREFELT % 38))
                                   (QREFELT % 37)))
                            (LETT |el2|
                                  (CONS
                                   (SPADCALL (SPADCALL '|e| (QREFELT % 15))
                                             |ev| (QREFELT % 58))
                                   |el1|))
                            (LETT |dden|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |pd| (QREFELT % 91))
                                             (QREFELT % 92))
                                   |el2| (QREFELT % 60)))
                            (COND
                             ((SPADCALL |dden| (|spadConstant| % 72)
                                        (QREFELT % 56))
                              (PROGN (LETT #3# |$NoValue|) (GO #8=#:G57))))
                            (LETT |dv|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |pd| (QREFELT % 93))
                                              (QREFELT % 92))
                                    |el2| (QREFELT % 60))
                                   |dden| (QREFELT % 38)))
                            (LETT |el3|
                                  (CONS
                                   (SPADCALL (SPADCALL '|d| (QREFELT % 15))
                                             |dv| (QREFELT % 58))
                                   |el2|))
                            (LETT |sden|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |ps| (QREFELT % 91))
                                             (QREFELT % 92))
                                   |el3| (QREFELT % 60)))
                            (COND
                             ((SPADCALL |sden| (|spadConstant| % 72)
                                        (QREFELT % 56))
                              (PROGN (LETT #3# |$NoValue|) (GO #8#))))
                            (LETT |sv|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |ps| (QREFELT % 93))
                                              (QREFELT % 92))
                                    |el3| (QREFELT % 60))
                                   |sden| (QREFELT % 38)))
                            (EXIT
                             (PROGN
                              (LETT #1#
                                    (CONS 0
                                          (LIST |sv| |dv| |ev|
                                                (|spadConstant| % 40))))
                              (GO #9=#:G62)))))))))
                  #8# (EXIT #3#))
                 (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #9# (EXIT #1#)))) 

(SDEFUN |RSIMP;rsimp1_gen_3!0| ((|c1| NIL) ($$ NIL))
        (PROG (|el1| %)
          (LETT |el1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c1| |el1| (QREFELT % 60)))))) 

(SDEFUN |RSIMP;rsimp1_gen_32|
        ((|av| (|Expression| (|Integer|))) (|bv| (|Expression| (|Integer|)))
         (|cv| #1=(|Expression| (|Integer|))) (|rv| (|Expression| (|Integer|)))
         (% (|Union| (|List| (|Expression| (|Integer|))) "failed")))
        (SPROG ((#2=#:G69 NIL) (|d| (|Expression| (|Integer|))) (|s| #1#))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((NULL (SPADCALL |cv| (|spadConstant| % 72) (QREFELT % 56)))
                    (SEQ (LETT |s| |cv|)
                         (LETT |d|
                               (SPADCALL |bv|
                                         (SPADCALL (SPADCALL 2 (QREFELT % 94))
                                                   |s| (QREFELT % 25))
                                         (QREFELT % 38)))
                         (EXIT
                          (COND
                           ((SPADCALL |av|
                                      (SPADCALL
                                       (SPADCALL |d| |d| (QREFELT % 25)) |s|
                                       (QREFELT % 25))
                                      (QREFELT % 56))
                            (PROGN
                             (LETT #2#
                                   (CONS 0
                                         (LIST |s| |d| (|spadConstant| % 40)
                                               (|spadConstant| % 72))))
                             (GO #3=#:G68))))))))
                  (EXIT
                   (|RSIMP;rsimp1_gen_3| |av| |bv| |cv| |rv| (QREFELT % 83)
                    (QREFELT % 84) (QREFELT % 85) %))))
                #3# (EXIT #2#)))) 

(SDEFUN |RSIMP;rsimp_gen_3|
        ((|av| (|Expression| (|Integer|))) (|bv| (|Expression| (|Integer|)))
         (|cv| (|Expression| (|Integer|))) (|rv| (|Expression| (|Integer|)))
         (|k| (|Integer|))
         (% (|Union| (|List| (|Expression| (|Integer|))) "failed")))
        (SPROG
         ((|r3l| (|List| (|Expression| (|Integer|))))
          (|res3| #1=(|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|r2l| (|List| (|Expression| (|Integer|)))) (|res2| #1#)
          (|r1l| (|List| (|Expression| (|Integer|)))) (|res1| #1#)
          (|s| (|Expression| (|Integer|))) (|tmp| (|Expression| (|Integer|))))
         (SEQ
          (COND
           ((SPADCALL |bv| (|spadConstant| % 72) (QREFELT % 56))
            (COND
             ((SPADCALL |cv| (|spadConstant| % 72) (QREFELT % 56))
              (EXIT
               (CONS 0
                     (LIST |av| (|spadConstant| % 40) (|spadConstant| % 72)
                           (|spadConstant| % 72))))))))
          (EXIT
           (COND ((EQL |k| 2) (|RSIMP;rsimp1_gen_32| |av| |bv| |cv| |rv| %))
                 ((EQL |k| 3)
                  (|RSIMP;rsimp1_gen_3| |av| |bv| |cv| |rv| (QREFELT % 87)
                   (QREFELT % 88) (QREFELT % 89) %))
                 ((EQL |k| 4)
                  (SEQ
                   (LETT |res1| (|RSIMP;rsimp1_gen_32| |av| |bv| |cv| |rv| %))
                   (EXIT
                    (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                          (#2='T
                           (SEQ (LETT |r1l| (QCDR |res1|))
                                (LETT |res2|
                                      (|RSIMP;rsimp1_gen_32|
                                       (SPADCALL |r1l| 2 (QREFELT % 76))
                                       (SPADCALL |r1l| 3 (QREFELT % 76))
                                       (SPADCALL |r1l| 4 (QREFELT % 76)) |rv|
                                       %))
                                (EXIT
                                 (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                                       (#2#
                                        (SEQ (LETT |r2l| (QCDR |res2|))
                                             (EXIT
                                              (CONS 0
                                                    (LIST
                                                     (SPADCALL
                                                      (SPADCALL |r1l| 1
                                                                (QREFELT % 76))
                                                      (SPADCALL
                                                       (SPADCALL |r2l| 1
                                                                 (QREFELT %
                                                                          76))
                                                       2 (QREFELT % 77))
                                                      (QREFELT % 25))
                                                     (SPADCALL |r2l| 2
                                                               (QREFELT % 76))
                                                     (SPADCALL |r2l| 3
                                                               (QREFELT % 76))
                                                     (SPADCALL |r2l| 4
                                                               (QREFELT %
                                                                        76)))))))))))))))
                 ((EQL |k| 6)
                  (SEQ
                   (LETT |res1| (|RSIMP;rsimp1_gen_32| |av| |bv| |cv| |rv| %))
                   (EXIT
                    (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                          (#2#
                           (SEQ (LETT |r1l| (QCDR |res1|))
                                (LETT |res2|
                                      (|RSIMP;rsimp1_gen_3|
                                       (SPADCALL |r1l| 2 (QREFELT % 76))
                                       (SPADCALL |r1l| 3 (QREFELT % 76))
                                       (SPADCALL |r1l| 4 (QREFELT % 76)) |rv|
                                       (QREFELT % 87) (QREFELT % 88)
                                       (QREFELT % 89) %))
                                (EXIT
                                 (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                                       (#2#
                                        (SEQ (LETT |r2l| (QCDR |res2|))
                                             (EXIT
                                              (CONS 0
                                                    (LIST
                                                     (SPADCALL
                                                      (SPADCALL |r1l| 1
                                                                (QREFELT % 76))
                                                      (SPADCALL
                                                       (SPADCALL |r2l| 1
                                                                 (QREFELT %
                                                                          76))
                                                       2 (QREFELT % 77))
                                                      (QREFELT % 25))
                                                     (SPADCALL |r2l| 2
                                                               (QREFELT % 76))
                                                     (SPADCALL |r2l| 3
                                                               (QREFELT % 76))
                                                     (SPADCALL |r2l| 4
                                                               (QREFELT %
                                                                        76)))))))))))))))
                 ((EQL |k| 8)
                  (SEQ
                   (LETT |res1| (|RSIMP;rsimp1_gen_32| |av| |bv| |cv| |rv| %))
                   (EXIT
                    (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                          (#2#
                           (SEQ (LETT |r1l| (QCDR |res1|))
                                (LETT |res2|
                                      (|RSIMP;rsimp1_gen_32|
                                       (SPADCALL |r1l| 2 (QREFELT % 76))
                                       (SPADCALL |r1l| 3 (QREFELT % 76))
                                       (SPADCALL |r1l| 4 (QREFELT % 76)) |rv|
                                       %))
                                (EXIT
                                 (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                                       (#2#
                                        (SEQ (LETT |r2l| (QCDR |res2|))
                                             (LETT |res3|
                                                   (|RSIMP;rsimp1_gen_32|
                                                    (SPADCALL |r2l| 2
                                                              (QREFELT % 76))
                                                    (SPADCALL |r2l| 3
                                                              (QREFELT % 76))
                                                    (SPADCALL |r2l| 4
                                                              (QREFELT % 76))
                                                    |rv| %))
                                             (EXIT
                                              (COND
                                               ((QEQCAR |res3| 1)
                                                (CONS 1 "failed"))
                                               (#2#
                                                (SEQ (LETT |r3l| (QCDR |res3|))
                                                     (EXIT
                                                      (CONS 0
                                                            (LIST
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL |r1l|
                                                                         1
                                                                         (QREFELT
                                                                          %
                                                                          76))
                                                               (SPADCALL
                                                                (SPADCALL |r2l|
                                                                          1
                                                                          (QREFELT
                                                                           %
                                                                           76))
                                                                2
                                                                (QREFELT % 77))
                                                               (QREFELT % 25))
                                                              (SPADCALL
                                                               (SPADCALL |r3l|
                                                                         1
                                                                         (QREFELT
                                                                          %
                                                                          76))
                                                               4
                                                               (QREFELT % 77))
                                                              (QREFELT % 25))
                                                             (SPADCALL |r3l| 2
                                                                       (QREFELT
                                                                        % 76))
                                                             (SPADCALL |r3l| 3
                                                                       (QREFELT
                                                                        % 76))
                                                             (SPADCALL |r3l| 4
                                                                       (QREFELT
                                                                        %
                                                                        76)))))))))))))))))))
                 ((EQL |k| 9)
                  (SEQ
                   (LETT |res1|
                         (|RSIMP;rsimp1_gen_3| |av| |bv| |cv| |rv|
                          (QREFELT % 87) (QREFELT % 88) (QREFELT % 89) %))
                   (EXIT
                    (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                          (#2#
                           (SEQ (LETT |r1l| (QCDR |res1|))
                                (LETT |s| (SPADCALL |r1l| 1 (QREFELT % 76)))
                                (LETT |av| (SPADCALL |r1l| 2 (QREFELT % 76)))
                                (LETT |bv| (SPADCALL |r1l| 3 (QREFELT % 76)))
                                (LETT |cv| (SPADCALL |r1l| 4 (QREFELT % 76)))
                                (LETT |res2|
                                      (|RSIMP;rsimp1_gen_3| |av| |bv| |cv| |rv|
                                       (QREFELT % 87) (QREFELT % 88)
                                       (QREFELT % 89) %))
                                (COND
                                 ((QEQCAR |res2| 1)
                                  (SEQ
                                   (LETT |tmp|
                                         (SPADCALL |cv| |rv| (QREFELT % 25)))
                                   (LETT |s|
                                         (SPADCALL |s| |rv| (QREFELT % 38)))
                                   (LETT |cv| |bv|) (LETT |bv| |av|)
                                   (LETT |av| |tmp|)
                                   (LETT |res2|
                                         (|RSIMP;rsimp1_gen_3| |av| |bv| |cv|
                                          |rv| (QREFELT % 87) (QREFELT % 88)
                                          (QREFELT % 89) %))
                                   (EXIT
                                    (COND
                                     ((QEQCAR |res2| 1)
                                      (SEQ
                                       (LETT |tmp|
                                             (SPADCALL |cv| |rv|
                                                       (QREFELT % 25)))
                                       (LETT |s|
                                             (SPADCALL |s| |rv|
                                                       (QREFELT % 38)))
                                       (LETT |cv| |bv|) (LETT |bv| |av|)
                                       (LETT |av| |tmp|)
                                       (EXIT
                                        (LETT |res2|
                                              (|RSIMP;rsimp1_gen_3| |av| |bv|
                                               |cv| |rv| (QREFELT % 87)
                                               (QREFELT % 88) (QREFELT % 89)
                                               %))))))))))
                                (EXIT
                                 (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                                       (#2#
                                        (SEQ (LETT |r2l| (QCDR |res2|))
                                             (EXIT
                                              (CONS 0
                                                    (LIST
                                                     (SPADCALL |s|
                                                               (SPADCALL
                                                                (SPADCALL |r2l|
                                                                          1
                                                                          (QREFELT
                                                                           %
                                                                           76))
                                                                3
                                                                (QREFELT % 77))
                                                               (QREFELT % 25))
                                                     (SPADCALL |r2l| 2
                                                               (QREFELT % 76))
                                                     (SPADCALL |r2l| 3
                                                               (QREFELT % 76))
                                                     (SPADCALL |r2l| 4
                                                               (QREFELT %
                                                                        76)))))))))))))))
                 ((EQL |k| 12)
                  (SEQ
                   (LETT |res1| (|RSIMP;rsimp1_gen_32| |av| |bv| |cv| |rv| %))
                   (EXIT
                    (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                          (#2#
                           (SEQ (LETT |r1l| (QCDR |res1|))
                                (LETT |res2|
                                      (|RSIMP;rsimp1_gen_32|
                                       (SPADCALL |r1l| 2 (QREFELT % 76))
                                       (SPADCALL |r1l| 3 (QREFELT % 76))
                                       (SPADCALL |r1l| 4 (QREFELT % 76)) |rv|
                                       %))
                                (EXIT
                                 (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                                       (#2#
                                        (SEQ (LETT |r2l| (QCDR |res2|))
                                             (LETT |res3|
                                                   (|RSIMP;rsimp1_gen_3|
                                                    (SPADCALL |r2l| 2
                                                              (QREFELT % 76))
                                                    (SPADCALL |r2l| 3
                                                              (QREFELT % 76))
                                                    (SPADCALL |r2l| 4
                                                              (QREFELT % 76))
                                                    |rv| (QREFELT % 87)
                                                    (QREFELT % 88)
                                                    (QREFELT % 89) %))
                                             (EXIT
                                              (COND
                                               ((QEQCAR |res3| 1)
                                                (CONS 1 "failed"))
                                               (#2#
                                                (SEQ (LETT |r3l| (QCDR |res3|))
                                                     (EXIT
                                                      (CONS 0
                                                            (LIST
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL |r1l|
                                                                         1
                                                                         (QREFELT
                                                                          %
                                                                          76))
                                                               (SPADCALL
                                                                (SPADCALL |r2l|
                                                                          1
                                                                          (QREFELT
                                                                           %
                                                                           76))
                                                                2
                                                                (QREFELT % 77))
                                                               (QREFELT % 25))
                                                              (SPADCALL
                                                               (SPADCALL |r3l|
                                                                         1
                                                                         (QREFELT
                                                                          %
                                                                          76))
                                                               4
                                                               (QREFELT % 77))
                                                              (QREFELT % 25))
                                                             (SPADCALL |r3l| 2
                                                                       (QREFELT
                                                                        % 76))
                                                             (SPADCALL |r3l| 3
                                                                       (QREFELT
                                                                        % 76))
                                                             (SPADCALL |r2l| 4
                                                                       (QREFELT
                                                                        %
                                                                        76)))))))))))))))))))
                 (#2# (CONS 1 "failed"))))))) 

(SDEFUN |RSIMP;split_eval|
        ((|la| (|List| (|Expression| (|Integer|))))
         (|kf| (|Expression| (|Integer|))) (|l| #1=(|Integer|))
         (|m| (|Integer|)) (% (|List| (|Expression| (|Integer|)))))
        (SPROG
         ((#2=#:G103 NIL) (|ll| NIL) (|mm| #1#)
          (|ki| (|Expression| (|Integer|))) (#3=#:G102 NIL)
          (|r_vec| (|Vector| (|Expression| (|Integer|)))))
         (SEQ (LETT |r_vec| (MAKEARR1 |l| (|spadConstant| % 72)))
              (SEQ (LETT |ll| 1) (LETT #3# |l|) G190
                   (COND ((|greater_SI| |ll| #3#) (GO G191)))
                   (SEQ
                    (SPADCALL |r_vec| |ll| (|SPADfirst| |la|) (QREFELT % 100))
                    (EXIT (LETT |la| (CDR |la|))))
                   (LETT |ll| (|inc_SI| |ll|)) (GO G190) G191 (EXIT NIL))
              (LETT |ki| (|spadConstant| % 40)) (LETT |mm| |l|)
              (SEQ G190 (COND ((NULL (< |mm| |m|)) (GO G191)))
                   (SEQ (LETT |ki| (SPADCALL |ki| |kf| (QREFELT % 25)))
                        (LETT |mm| (+ |mm| |l|))
                        (EXIT
                         (SEQ (LETT |ll| 1) (LETT #2# |l|) G190
                              (COND ((|greater_SI| |ll| #2#) (GO G191)))
                              (SEQ
                               (SPADCALL |r_vec| |ll|
                                         (SPADCALL
                                          (SPADCALL |r_vec| |ll|
                                                    (QREFELT % 101))
                                          (SPADCALL (|SPADfirst| |la|) |ki|
                                                    (QREFELT % 25))
                                          (QREFELT % 28))
                                         (QREFELT % 100))
                               (EXIT (LETT |la| (CDR |la|))))
                              (LETT |ll| (|inc_SI| |ll|)) (GO G190) G191
                              (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |r_vec| (QREFELT % 102)))))) 

(SDEFUN |RSIMP;my_coeffs|
        ((|p| (|uPe|)) (|k| (|Integer|))
         (% (|List| (|Expression| (|Integer|)))))
        (SPROG
         ((|res| (|List| (|Expression| (|Integer|))))
          (|d| (|NonNegativeInteger|)) (|i| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |i| |k|) G190 (COND ((< |i| 0) (GO G191)))
                   (SEQ (LETT |d| (SPADCALL |p| (QREFELT % 103)))
                        (EXIT
                         (COND
                          ((< |d| |i|)
                           (LETT |res| (CONS (|spadConstant| % 72) |res|)))
                          ('T
                           (SEQ
                            (LETT |res|
                                  (CONS (SPADCALL |p| (QREFELT % 104)) |res|))
                            (EXIT
                             (LETT |p| (SPADCALL |p| (QREFELT % 105)))))))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RSIMP;rsimp_gen_4|
        ((|cl| (|List| (|Expression| (|Integer|))))
         (|rv| (|Expression| (|Integer|))) (|k| (|Integer|))
         (% (|Union| (|List| (|Expression| (|Integer|))) "failed")))
        (SPROG
         ((|du| #1=(|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|cu| #1#) (|d1| #2=(|Expression| (|Integer|))) (|c1| #2#)
          (|s2| (|Expression| (|Integer|)))
          (|r2l| (|List| (|Expression| (|Integer|))))
          (|tmp| #3=(|Expression| (|Integer|))) (#4=#:G120 NIL)
          (|res2| #5=(|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|a2| #3#) (|b2| #3#) (#6=#:G121 NIL) (|i| NIL) (|kk| (|Integer|))
          (|su| #1#) (|s1| #2#) (|r1l| (|List| (|Expression| (|Integer|))))
          (|res1| #5#) (|b1| NIL)
          (|#G47| #7=(|List| (|Expression| (|Integer|)))) (|a1| NIL)
          (|#G46| #7#) (|krr| (|Kernel| (|Expression| (|Integer|))))
          (|rr| (|Expression| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |rr| (SPADCALL |rv| (QREFELT % 106)))
                (LETT |krr| (SPADCALL |rr| (QREFELT % 107)))
                (PROGN
                 (LETT |#G46| (|RSIMP;split_eval| |cl| |rr| 2 4 %))
                 (LETT |#G47| |#G46|)
                 (LETT |a1| (|SPADfirst| |#G47|))
                 (LETT |#G47| (CDR |#G47|))
                 (LETT |b1| (|SPADfirst| |#G47|))
                 |#G46|)
                (LETT |res1| (|RSIMP;rsimp_gen_2| |a1| |b1| |rr| |k| %))
                (EXIT
                 (COND
                  ((QEQCAR |res1| 1)
                   (PROGN (LETT #4# (CONS 1 "failed")) (GO #8=#:G119)))
                  (#9='T
                   (SEQ (LETT |r1l| (QCDR |res1|))
                        (LETT |s1| (SPADCALL |r1l| 1 (QREFELT % 76)))
                        (LETT |c1| (SPADCALL |r1l| 2 (QREFELT % 76)))
                        (LETT |d1| (SPADCALL |r1l| 3 (QREFELT % 76)))
                        (LETT |su|
                              (SPADCALL |s1| |krr|
                                        (SPADCALL |krr| (QREFELT % 109))
                                        (QREFELT % 110)))
                        (LETT |a2| (SPADCALL |su| 0 (QREFELT % 73)))
                        (LETT |b2| (SPADCALL |su| 1 (QREFELT % 73)))
                        (LETT |res2|
                              (|RSIMP;rsimp_gen_2| |a2| |b2| |rv| |k| %))
                        (COND
                         ((QEQCAR |res2| 1)
                          (COND
                           ((EQL (REM |k| 2) 0)
                            (SEQ (LETT |kk| (QUOTIENT2 |k| 2))
                                 (SEQ (LETT |i| 1) (LETT #6# |kk|) G190
                                      (COND ((|greater_SI| |i| #6#) (GO G191)))
                                      (SEQ (LETT |tmp| |b2|) (LETT |b2| |a2|)
                                           (EXIT
                                            (LETT |a2|
                                                  (SPADCALL |tmp| |rv|
                                                            (QREFELT % 25)))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT NIL))
                                 (LETT |res2|
                                       (|RSIMP;rsimp_gen_2| |a2| |b2| |rv| |k|
                                        %))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |res2| 1)
                                    (PROGN
                                     (LETT #4# (CONS 1 "failed"))
                                     (GO #8#)))
                                   (#9#
                                    (SEQ (LETT |tmp| |d1|)
                                         (LETT |d1|
                                               (SPADCALL |c1| |rr|
                                                         (QREFELT % 38)))
                                         (EXIT (LETT |c1| |tmp|)))))))))))
                        (EXIT
                         (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                               (#9#
                                (SEQ (LETT |r2l| (QCDR |res2|))
                                     (LETT |s2|
                                           (SPADCALL
                                            (SPADCALL |r2l| 2 (QREFELT % 76))
                                            (SPADCALL
                                             (SPADCALL |r2l| 3 (QREFELT % 76))
                                             |rr| (QREFELT % 25))
                                            (QREFELT % 28)))
                                     (LETT |c1|
                                           (SPADCALL |s2| |c1| (QREFELT % 25)))
                                     (LETT |d1|
                                           (SPADCALL |s2| |d1| (QREFELT % 25)))
                                     (LETT |cu|
                                           (SPADCALL |c1| |krr|
                                                     (SPADCALL |krr|
                                                               (QREFELT % 109))
                                                     (QREFELT % 110)))
                                     (LETT |du|
                                           (SPADCALL |d1| |krr|
                                                     (SPADCALL |krr|
                                                               (QREFELT % 109))
                                                     (QREFELT % 110)))
                                     (EXIT
                                      (CONS 0
                                            (LIST
                                             (SPADCALL |r2l| 1 (QREFELT % 76))
                                             (SPADCALL |cu| 0 (QREFELT % 73))
                                             (SPADCALL |du| 0 (QREFELT % 73))
                                             (SPADCALL |cu| 1 (QREFELT % 73))
                                             (SPADCALL |du| 1
                                                       (QREFELT %
                                                                73)))))))))))))))
          #8# (EXIT #4#)))) 

(SDEFUN |RSIMP;rsimp_gen_6|
        ((|cl| (|List| (|Expression| (|Integer|))))
         (|rv| (|Expression| (|Integer|))) (|k| (|Integer|))
         (% (|Union| (|List| (|Expression| (|Integer|))) "failed")))
        (SPROG
         ((|du| #1=(|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|cu| #1#) (|d1| #2=(|Expression| (|Integer|))) (|c1| #2#)
          (|s2| (|Expression| (|Integer|)))
          (|r2l| (|List| (|Expression| (|Integer|))))
          (|res2| (|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|c2| #3=(|Expression| (|Integer|))) (|b2| #3#) (|a2| #3#) (|su| #1#)
          (|s1| #2#) (|r1l| (|List| (|Expression| (|Integer|))))
          (#4=#:G126 NIL)
          (|res1| (|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|b1| NIL) (|#G55| #5=(|List| (|Expression| (|Integer|)))) (|a1| NIL)
          (|#G54| #5#) (|krr| (|Kernel| (|Expression| (|Integer|))))
          (|rr| (|Expression| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rr|
                  (SPADCALL |rv| (SPADCALL 1 3 (QREFELT % 113))
                            (QREFELT % 114)))
            (LETT |krr| (SPADCALL |rr| (QREFELT % 107)))
            (PROGN
             (LETT |#G54| (|RSIMP;split_eval| |cl| |rr| 2 6 %))
             (LETT |#G55| |#G54|)
             (LETT |a1| (|SPADfirst| |#G55|))
             (LETT |#G55| (CDR |#G55|))
             (LETT |b1| (|SPADfirst| |#G55|))
             |#G54|)
            (LETT |res1| (|RSIMP;rsimp_gen_2| |a1| |b1| |rr| |k| %))
            (EXIT
             (COND
              ((QEQCAR |res1| 1)
               (PROGN (LETT #4# (CONS 1 "failed")) (GO #6=#:G125)))
              (#7='T
               (SEQ (LETT |r1l| (QCDR |res1|))
                    (LETT |s1| (SPADCALL |r1l| 1 (QREFELT % 76)))
                    (LETT |c1| (SPADCALL |r1l| 2 (QREFELT % 76)))
                    (LETT |d1| (SPADCALL |r1l| 3 (QREFELT % 76)))
                    (LETT |su|
                          (SPADCALL |s1| |krr| (SPADCALL |krr| (QREFELT % 109))
                                    (QREFELT % 110)))
                    (LETT |a2| (SPADCALL |su| 0 (QREFELT % 73)))
                    (LETT |b2| (SPADCALL |su| 1 (QREFELT % 73)))
                    (LETT |c2| (SPADCALL |su| 2 (QREFELT % 73)))
                    (LETT |res2|
                          (|RSIMP;rsimp_gen_3| |a2| |b2| |c2| |rv| |k| %))
                    (EXIT
                     (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                           (#7#
                            (SEQ (LETT |r2l| (QCDR |res2|))
                                 (LETT |s2|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |r2l| 2 (QREFELT % 76))
                                         (SPADCALL
                                          (SPADCALL |r2l| 3 (QREFELT % 76))
                                          |rr| (QREFELT % 25))
                                         (QREFELT % 28))
                                        (SPADCALL
                                         (SPADCALL |r2l| 4 (QREFELT % 76))
                                         (SPADCALL |rr| 2 (QREFELT % 24))
                                         (QREFELT % 25))
                                        (QREFELT % 28)))
                                 (LETT |c1|
                                       (SPADCALL |s2| |c1| (QREFELT % 25)))
                                 (LETT |d1|
                                       (SPADCALL |s2| |d1| (QREFELT % 25)))
                                 (LETT |cu|
                                       (SPADCALL |c1| |krr|
                                                 (SPADCALL |krr|
                                                           (QREFELT % 109))
                                                 (QREFELT % 110)))
                                 (LETT |du|
                                       (SPADCALL |d1| |krr|
                                                 (SPADCALL |krr|
                                                           (QREFELT % 109))
                                                 (QREFELT % 110)))
                                 (EXIT
                                  (CONS 0
                                        (LIST (SPADCALL |r2l| 1 (QREFELT % 76))
                                              (SPADCALL |cu| 0 (QREFELT % 73))
                                              (SPADCALL |du| 0 (QREFELT % 73))
                                              (SPADCALL |cu| 1 (QREFELT % 73))
                                              (SPADCALL |du| 1 (QREFELT % 73))
                                              (SPADCALL |cu| 2 (QREFELT % 73))
                                              (SPADCALL |du| 2
                                                        (QREFELT %
                                                                 73)))))))))))))))
          #6# (EXIT #4#)))) 

(SDEFUN |RSIMP;rsimp_gen_8|
        ((|cl| (|List| (|Expression| (|Integer|))))
         (|rv| (|Expression| (|Integer|))) (|k| (|Integer|))
         (% (|Union| (|List| (|Expression| (|Integer|))) "failed")))
        (SPROG
         ((|du| #1=(|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|cu| #1#) (|d1| #2=(|Expression| (|Integer|))) (|c1| #2#)
          (|ss| #3=(|Expression| (|Integer|)))
          (|r3l| (|List| (|Expression| (|Integer|)))) (|c2| #2#) (|d2| #2#)
          (|tmp| #3#) (#4=#:G144 NIL)
          (|res3| #5=(|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|a3| #6=(|Expression| (|Integer|))) (|b3| #6#) (#7=#:G146 NIL)
          (|i| NIL) (|kk| (|Integer|)) (|su2| #1#) (|s2| #2#)
          (|r2l| (|List| (|Expression| (|Integer|)))) (|res2| #5#) (|a2| #3#)
          (|b2| #3#) (#8=#:G145 NIL) (|su| #1#) (|s1| #2#)
          (|r1l| (|List| (|Expression| (|Integer|)))) (|res1| #5#) (|b1| NIL)
          (|#G62| #9=(|List| (|Expression| (|Integer|)))) (|a1| NIL)
          (|#G61| #9#) (|krr| (|Kernel| (|Expression| (|Integer|))))
          (|rr| (|Expression| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rr|
                  (SPADCALL |rv| (SPADCALL 1 4 (QREFELT % 113))
                            (QREFELT % 114)))
            (LETT |krr| (SPADCALL |rr| (QREFELT % 107)))
            (PROGN
             (LETT |#G61| (|RSIMP;split_eval| |cl| |rr| 2 8 %))
             (LETT |#G62| |#G61|)
             (LETT |a1| (|SPADfirst| |#G62|))
             (LETT |#G62| (CDR |#G62|))
             (LETT |b1| (|SPADfirst| |#G62|))
             |#G61|)
            (LETT |res1| (|RSIMP;rsimp_gen_2| |a1| |b1| |rr| |k| %))
            (EXIT
             (COND
              ((QEQCAR |res1| 1)
               (PROGN (LETT #4# (CONS 1 "failed")) (GO #10=#:G143)))
              (#11='T
               (SEQ (LETT |r1l| (QCDR |res1|))
                    (LETT |s1| (SPADCALL |r1l| 1 (QREFELT % 76)))
                    (LETT |c1| (SPADCALL |r1l| 2 (QREFELT % 76)))
                    (LETT |d1| (SPADCALL |r1l| 3 (QREFELT % 76)))
                    (LETT |su|
                          (SPADCALL |s1| |krr| (SPADCALL |krr| (QREFELT % 109))
                                    (QREFELT % 110)))
                    (LETT |a2|
                          (SPADCALL (SPADCALL |su| 0 (QREFELT % 73))
                                    (SPADCALL (SPADCALL |su| 2 (QREFELT % 73))
                                              (SPADCALL |rr| 2 (QREFELT % 24))
                                              (QREFELT % 25))
                                    (QREFELT % 28)))
                    (LETT |b2|
                          (SPADCALL (SPADCALL |su| 1 (QREFELT % 73))
                                    (SPADCALL (SPADCALL |su| 3 (QREFELT % 73))
                                              (SPADCALL |rr| 2 (QREFELT % 24))
                                              (QREFELT % 25))
                                    (QREFELT % 28)))
                    (LETT |res2|
                          (|RSIMP;rsimp_gen_2| |a2| |b2|
                           (SPADCALL |rr| 2 (QREFELT % 24)) |k| %))
                    (COND
                     ((QEQCAR |res2| 1)
                      (COND
                       ((EQL (REM |k| 2) 0)
                        (SEQ (LETT |kk| (QUOTIENT2 |k| 2))
                             (SEQ (LETT |i| 1) (LETT #8# |kk|) G190
                                  (COND ((|greater_SI| |i| #8#) (GO G191)))
                                  (SEQ (LETT |tmp| |b2|) (LETT |b2| |a2|)
                                       (EXIT
                                        (LETT |a2|
                                              (SPADCALL |tmp|
                                                        (SPADCALL |rr| 2
                                                                  (QREFELT %
                                                                           24))
                                                        (QREFELT % 25)))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |res2|
                                   (|RSIMP;rsimp_gen_2| |a2| |b2|
                                    (SPADCALL |rr| 2 (QREFELT % 24)) |k| %))
                             (EXIT
                              (COND
                               ((QEQCAR |res2| 1)
                                (PROGN (LETT #4# (CONS 1 "failed")) (GO #10#)))
                               (#11#
                                (SEQ (LETT |tmp| |d1|)
                                     (LETT |d1|
                                           (SPADCALL |c1| |rr| (QREFELT % 38)))
                                     (EXIT (LETT |c1| |tmp|)))))))))))
                    (EXIT
                     (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                           (#11#
                            (SEQ (LETT |r2l| (QCDR |res2|))
                                 (LETT |s2| (SPADCALL |r2l| 1 (QREFELT % 76)))
                                 (LETT |c2| (SPADCALL |r2l| 2 (QREFELT % 76)))
                                 (LETT |d2| (SPADCALL |r2l| 3 (QREFELT % 76)))
                                 (LETT |su2|
                                       (SPADCALL |s2| |krr|
                                                 (SPADCALL |krr|
                                                           (QREFELT % 109))
                                                 (QREFELT % 110)))
                                 (LETT |a3| (SPADCALL |su2| 0 (QREFELT % 73)))
                                 (LETT |b3| (SPADCALL |su2| 2 (QREFELT % 73)))
                                 (LETT |res3|
                                       (|RSIMP;rsimp_gen_2| |a3| |b3| |rv| |k|
                                        %))
                                 (COND
                                  ((QEQCAR |res3| 1)
                                   (COND
                                    ((EQL (REM |k| 2) 0)
                                     (SEQ (LETT |kk| (QUOTIENT2 |k| 2))
                                          (SEQ (LETT |i| 1) (LETT #7# |kk|)
                                               G190
                                               (COND
                                                ((|greater_SI| |i| #7#)
                                                 (GO G191)))
                                               (SEQ (LETT |tmp| |b3|)
                                                    (LETT |b3| |a3|)
                                                    (EXIT
                                                     (LETT |a3|
                                                           (SPADCALL |tmp| |rv|
                                                                     (QREFELT %
                                                                              25)))))
                                               (LETT |i| (|inc_SI| |i|))
                                               (GO G190) G191 (EXIT NIL))
                                          (LETT |res3|
                                                (|RSIMP;rsimp_gen_2| |a3| |b3|
                                                 |rv| |k| %))
                                          (EXIT
                                           (COND
                                            ((QEQCAR |res3| 1)
                                             (PROGN
                                              (LETT #4# (CONS 1 "failed"))
                                              (GO #10#)))
                                            (#11#
                                             (SEQ (LETT |tmp| |d2|)
                                                  (LETT |d2|
                                                        (SPADCALL |c2|
                                                                  (SPADCALL
                                                                   |rr| 2
                                                                   (QREFELT %
                                                                            24))
                                                                  (QREFELT %
                                                                           38)))
                                                  (EXIT
                                                   (LETT |c2| |tmp|)))))))))))
                                 (EXIT
                                  (COND ((QEQCAR |res3| 1) (CONS 1 "failed"))
                                        (#11#
                                         (SEQ (LETT |r3l| (QCDR |res3|))
                                              (LETT |ss|
                                                    (SPADCALL
                                                     (SPADCALL |r3l| 2
                                                               (QREFELT % 76))
                                                     (SPADCALL
                                                      (SPADCALL |r3l| 3
                                                                (QREFELT % 76))
                                                      (SPADCALL |rr| 2
                                                                (QREFELT % 24))
                                                      (QREFELT % 25))
                                                     (QREFELT % 28)))
                                              (LETT |ss|
                                                    (SPADCALL |ss|
                                                              (SPADCALL |c2|
                                                                        (SPADCALL
                                                                         |d2|
                                                                         |rr|
                                                                         (QREFELT
                                                                          %
                                                                          25))
                                                                        (QREFELT
                                                                         % 28))
                                                              (QREFELT % 25)))
                                              (LETT |c1|
                                                    (SPADCALL |ss| |c1|
                                                              (QREFELT % 25)))
                                              (LETT |d1|
                                                    (SPADCALL |ss| |d1|
                                                              (QREFELT % 25)))
                                              (LETT |cu|
                                                    (SPADCALL |c1| |krr|
                                                              (SPADCALL |krr|
                                                                        (QREFELT
                                                                         %
                                                                         109))
                                                              (QREFELT % 110)))
                                              (LETT |du|
                                                    (SPADCALL |d1| |krr|
                                                              (SPADCALL |krr|
                                                                        (QREFELT
                                                                         %
                                                                         109))
                                                              (QREFELT % 110)))
                                              (EXIT
                                               (CONS 0
                                                     (LIST
                                                      (SPADCALL |r3l| 1
                                                                (QREFELT % 76))
                                                      (SPADCALL |cu| 0
                                                                (QREFELT % 73))
                                                      (SPADCALL |du| 0
                                                                (QREFELT % 73))
                                                      (SPADCALL |cu| 1
                                                                (QREFELT % 73))
                                                      (SPADCALL |du| 1
                                                                (QREFELT % 73))
                                                      (SPADCALL |cu| 2
                                                                (QREFELT % 73))
                                                      (SPADCALL |du| 2
                                                                (QREFELT % 73))
                                                      (SPADCALL |cu| 3
                                                                (QREFELT % 73))
                                                      (SPADCALL |du| 3
                                                                (QREFELT %
                                                                         73)))))))))))))))))))
          #10# (EXIT #4#)))) 

(SDEFUN |RSIMP;rsimp_gen_9|
        ((|cl| (|List| (|Expression| (|Integer|))))
         (|rv| (|Expression| (|Integer|))) (|k| (|Integer|))
         (% (|Union| (|List| (|Expression| (|Integer|))) "failed")))
        (SPROG
         ((|fu| #1=(|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|eu| #1#) (|du| #1#) (|f1| #2=(|Expression| (|Integer|))) (|e1| #2#)
          (|d1| #2#) (|s2| (|Expression| (|Integer|)))
          (|r2l| (|List| (|Expression| (|Integer|))))
          (|tmp| #3=(|Expression| (|Integer|))) (#4=#:G162 NIL)
          (|res2| #5=(|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|a2| #3#) (|b2| #3#) (|c2| #3#) (#6=#:G164 NIL) (|i| NIL)
          (|kk| (|Integer|)) (#7=#:G163 NIL) (|su| #1#) (|s1| #2#)
          (|r1l| (|List| (|Expression| (|Integer|)))) (|res1| #5#) (|c1| NIL)
          (|#G71| #8=(|List| (|Expression| (|Integer|)))) (|b1| NIL) (|a1| NIL)
          (|#G70| #8#) (|krr| (|Kernel| (|Expression| (|Integer|))))
          (|rr| (|Expression| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rr|
                  (SPADCALL |rv| (SPADCALL 1 3 (QREFELT % 113))
                            (QREFELT % 114)))
            (LETT |krr| (SPADCALL |rr| (QREFELT % 107)))
            (PROGN
             (LETT |#G70| (|RSIMP;split_eval| |cl| |rr| 3 9 %))
             (LETT |#G71| |#G70|)
             (LETT |a1| (|SPADfirst| |#G71|))
             (LETT |#G71| (CDR |#G71|))
             (LETT |b1| (|SPADfirst| |#G71|))
             (LETT |#G71| (CDR |#G71|))
             (LETT |c1| (|SPADfirst| |#G71|))
             |#G70|)
            (LETT |res1| (|RSIMP;rsimp_gen_3| |a1| |b1| |c1| |rr| |k| %))
            (EXIT
             (COND
              ((QEQCAR |res1| 1)
               (PROGN (LETT #4# (CONS 1 "failed")) (GO #9=#:G161)))
              (#10='T
               (SEQ (LETT |r1l| (QCDR |res1|))
                    (LETT |s1| (SPADCALL |r1l| 1 (QREFELT % 76)))
                    (LETT |d1| (SPADCALL |r1l| 2 (QREFELT % 76)))
                    (LETT |e1| (SPADCALL |r1l| 3 (QREFELT % 76)))
                    (LETT |f1| (SPADCALL |r1l| 4 (QREFELT % 76)))
                    (LETT |su|
                          (SPADCALL |s1| |krr| (SPADCALL |krr| (QREFELT % 109))
                                    (QREFELT % 110)))
                    (LETT |a2| (SPADCALL |su| 0 (QREFELT % 73)))
                    (LETT |b2| (SPADCALL |su| 1 (QREFELT % 73)))
                    (LETT |c2| (SPADCALL |su| 2 (QREFELT % 73)))
                    (LETT |res2|
                          (|RSIMP;rsimp_gen_3| |a2| |b2| |c2| |rv| |k| %))
                    (COND
                     ((QEQCAR |res2| 1)
                      (COND
                       ((EQL (REM |k| 3) 0)
                        (SEQ (LETT |kk| (QUOTIENT2 |k| 3))
                             (SEQ (LETT |i| 1) (LETT #7# |kk|) G190
                                  (COND ((|greater_SI| |i| #7#) (GO G191)))
                                  (SEQ (LETT |tmp| |c2|) (LETT |c2| |b2|)
                                       (LETT |b2| |a2|)
                                       (EXIT
                                        (LETT |a2|
                                              (SPADCALL |tmp| |rv|
                                                        (QREFELT % 25)))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |res2|
                                   (|RSIMP;rsimp_gen_3| |a2| |b2| |c2| |rv| |k|
                                    %))
                             (LETT |tmp| |d1|) (LETT |d1| |e1|)
                             (LETT |e1| |f1|)
                             (EXIT
                              (LETT |f1|
                                    (SPADCALL |tmp| |rr| (QREFELT % 38)))))))))
                    (COND
                     ((QEQCAR |res2| 1)
                      (COND
                       ((EQL (REM |k| 3) 0)
                        (SEQ (LETT |kk| (QUOTIENT2 |k| 3))
                             (SEQ (LETT |i| 1) (LETT #6# |kk|) G190
                                  (COND ((|greater_SI| |i| #6#) (GO G191)))
                                  (SEQ (LETT |tmp| |c2|) (LETT |c2| |b2|)
                                       (LETT |b2| |a2|)
                                       (EXIT
                                        (LETT |a2|
                                              (SPADCALL |tmp| |rv|
                                                        (QREFELT % 25)))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |res2|
                                   (|RSIMP;rsimp_gen_3| |a2| |b2| |c2| |rv| |k|
                                    %))
                             (EXIT
                              (COND
                               ((QEQCAR |res2| 1)
                                (PROGN (LETT #4# (CONS 1 "failed")) (GO #9#)))
                               (#10#
                                (SEQ (LETT |tmp| |d1|) (LETT |d1| |e1|)
                                     (LETT |e1| |f1|)
                                     (EXIT
                                      (LETT |f1|
                                            (SPADCALL |tmp| |rr|
                                                      (QREFELT %
                                                               38)))))))))))))
                    (EXIT
                     (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                           (#10#
                            (SEQ (LETT |r2l| (QCDR |res2|))
                                 (LETT |s2|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |r2l| 2 (QREFELT % 76))
                                         (SPADCALL
                                          (SPADCALL |r2l| 3 (QREFELT % 76))
                                          |rr| (QREFELT % 25))
                                         (QREFELT % 28))
                                        (SPADCALL
                                         (SPADCALL |r2l| 4 (QREFELT % 76))
                                         (SPADCALL |rr| 2 (QREFELT % 24))
                                         (QREFELT % 25))
                                        (QREFELT % 28)))
                                 (LETT |d1|
                                       (SPADCALL |s2| |d1| (QREFELT % 25)))
                                 (LETT |e1|
                                       (SPADCALL |s2| |e1| (QREFELT % 25)))
                                 (LETT |f1|
                                       (SPADCALL |s2| |f1| (QREFELT % 25)))
                                 (LETT |du|
                                       (SPADCALL |d1| |krr|
                                                 (SPADCALL |krr|
                                                           (QREFELT % 109))
                                                 (QREFELT % 110)))
                                 (LETT |eu|
                                       (SPADCALL |e1| |krr|
                                                 (SPADCALL |krr|
                                                           (QREFELT % 109))
                                                 (QREFELT % 110)))
                                 (LETT |fu|
                                       (SPADCALL |f1| |krr|
                                                 (SPADCALL |krr|
                                                           (QREFELT % 109))
                                                 (QREFELT % 110)))
                                 (EXIT
                                  (CONS 0
                                        (LIST (SPADCALL |r2l| 1 (QREFELT % 76))
                                              (SPADCALL |du| 0 (QREFELT % 73))
                                              (SPADCALL |eu| 0 (QREFELT % 73))
                                              (SPADCALL |fu| 0 (QREFELT % 73))
                                              (SPADCALL |du| 1 (QREFELT % 73))
                                              (SPADCALL |eu| 1 (QREFELT % 73))
                                              (SPADCALL |fu| 1 (QREFELT % 73))
                                              (SPADCALL |du| 2 (QREFELT % 73))
                                              (SPADCALL |eu| 2 (QREFELT % 73))
                                              (SPADCALL |fu| 2
                                                        (QREFELT %
                                                                 73)))))))))))))))
          #9# (EXIT #4#)))) 

(SDEFUN |RSIMP;rsimp_gen_12|
        ((|cl| (|List| (|Expression| (|Integer|))))
         (|rv| (|Expression| (|Integer|))) (|k| (|Integer|))
         (% (|Union| (|List| (|Expression| (|Integer|))) "failed")))
        (SPROG
         ((|rl| (|List| (|Expression| (|Integer|)))) (#1=#:G181 NIL) (|ci| NIL)
          (#2=#:G182 NIL) (|di| NIL)
          (|du| #3=(|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|cu| #3#) (|ss| (|Expression| (|Integer|)))
          (|r3l| (|List| (|Expression| (|Integer|))))
          (|res3| (|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|c3| #4=(|Expression| (|Integer|))) (|b3| #4#) (|a3| #4#)
          (|su2| #3#) (|d2| #5=(|Expression| (|Integer|))) (|c2| #5#)
          (|s2| #5#) (|r2l| (|List| (|Expression| (|Integer|)))) (|c1| #5#)
          (|d1| #5#) (|tmp| #6=(|Expression| (|Integer|))) (#7=#:G179 NIL)
          (|res2| #8=(|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|a2| (|Expression| (|Integer|))) (|b2| #6#) (#9=#:G180 NIL)
          (|i| NIL) (|kk| (|Integer|)) (|#G85| #10=(|List| #6#)) (|#G84| #10#)
          (|cl2| (|List| (|Expression| (|Integer|)))) (|su| #3#) (|s1| #5#)
          (|r1l| (|List| (|Expression| (|Integer|)))) (|res1| #8#) (|b1| NIL)
          (|#G81| #10#) (|a1| NIL) (|#G80| #10#)
          (|krr| (|Kernel| (|Expression| (|Integer|))))
          (|rr| (|Expression| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rr|
                  (SPADCALL |rv| (SPADCALL 1 6 (QREFELT % 113))
                            (QREFELT % 114)))
            (LETT |krr| (SPADCALL |rr| (QREFELT % 107)))
            (PROGN
             (LETT |#G80| (|RSIMP;split_eval| |cl| |rr| 2 12 %))
             (LETT |#G81| |#G80|)
             (LETT |a1| (|SPADfirst| |#G81|))
             (LETT |#G81| (CDR |#G81|))
             (LETT |b1| (|SPADfirst| |#G81|))
             |#G80|)
            (LETT |res1| (|RSIMP;rsimp_gen_2| |a1| |b1| |rr| |k| %))
            (EXIT
             (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                   (#11='T
                    (SEQ (LETT |r1l| (QCDR |res1|))
                         (LETT |s1| (SPADCALL |r1l| 1 (QREFELT % 76)))
                         (LETT |c1| (SPADCALL |r1l| 2 (QREFELT % 76)))
                         (LETT |d1| (SPADCALL |r1l| 3 (QREFELT % 76)))
                         (LETT |su|
                               (SPADCALL |s1| |krr|
                                         (SPADCALL |krr| (QREFELT % 109))
                                         (QREFELT % 110)))
                         (LETT |cl2| (|RSIMP;my_coeffs| |su| 5 %))
                         (PROGN
                          (LETT |#G84|
                                (|RSIMP;split_eval| |cl2|
                                 (SPADCALL |rr| 2 (QREFELT % 24)) 2 6 %))
                          (LETT |#G85| |#G84|)
                          (LETT |a2| (|SPADfirst| |#G85|))
                          (LETT |#G85| (CDR |#G85|))
                          (LETT |b2| (|SPADfirst| |#G85|))
                          |#G84|)
                         (LETT |res2|
                               (|RSIMP;rsimp_gen_2| |a2| |b2|
                                (SPADCALL |rr| 2 (QREFELT % 24)) |k| %))
                         (COND
                          ((QEQCAR |res2| 1)
                           (COND
                            ((EQL (REM |k| 2) 0)
                             (SEQ (LETT |kk| (QUOTIENT2 |k| 2))
                                  (SEQ (LETT |i| 1) (LETT #9# |kk|) G190
                                       (COND
                                        ((|greater_SI| |i| #9#) (GO G191)))
                                       (SEQ (LETT |tmp| |b2|) (LETT |b2| |a2|)
                                            (EXIT
                                             (LETT |a2|
                                                   (SPADCALL |tmp|
                                                             (SPADCALL |rr| 2
                                                                       (QREFELT
                                                                        % 24))
                                                             (QREFELT % 25)))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))
                                  (LETT |res2|
                                        (|RSIMP;rsimp_gen_2| |a2| |b2|
                                         (SPADCALL |rr| 2 (QREFELT % 24)) |k|
                                         %))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |res2| 1)
                                     (PROGN
                                      (LETT #7# (CONS 1 "failed"))
                                      (GO #12=#:G178)))
                                    (#11#
                                     (SEQ (LETT |tmp| |d1|)
                                          (LETT |d1|
                                                (SPADCALL |c1| |rr|
                                                          (QREFELT % 38)))
                                          (EXIT (LETT |c1| |tmp|)))))))))))
                         (EXIT
                          (COND ((QEQCAR |res2| 1) (CONS 1 "failed"))
                                (#11#
                                 (SEQ (LETT |r2l| (QCDR |res2|))
                                      (LETT |s2|
                                            (SPADCALL |r2l| 1 (QREFELT % 76)))
                                      (LETT |c2|
                                            (SPADCALL |r2l| 2 (QREFELT % 76)))
                                      (LETT |d2|
                                            (SPADCALL |r2l| 3 (QREFELT % 76)))
                                      (LETT |su2|
                                            (SPADCALL |s2| |krr|
                                                      (SPADCALL |krr|
                                                                (QREFELT %
                                                                         109))
                                                      (QREFELT % 110)))
                                      (LETT |a3|
                                            (SPADCALL |su2| 0 (QREFELT % 73)))
                                      (LETT |b3|
                                            (SPADCALL |su2| 2 (QREFELT % 73)))
                                      (LETT |c3|
                                            (SPADCALL |su2| 4 (QREFELT % 73)))
                                      (LETT |res3|
                                            (|RSIMP;rsimp_gen_3| |a3| |b3| |c3|
                                             |rv| |k| %))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |res3| 1) (CONS 1 "failed"))
                                        (#11#
                                         (SEQ (LETT |r3l| (QCDR |res3|))
                                              (LETT |ss|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |r3l| 2
                                                                (QREFELT % 76))
                                                      (SPADCALL
                                                       (SPADCALL |r3l| 3
                                                                 (QREFELT %
                                                                          76))
                                                       (SPADCALL |rr| 2
                                                                 (QREFELT %
                                                                          24))
                                                       (QREFELT % 25))
                                                      (QREFELT % 28))
                                                     (SPADCALL
                                                      (SPADCALL |r3l| 4
                                                                (QREFELT % 76))
                                                      (SPADCALL |rr| 4
                                                                (QREFELT % 24))
                                                      (QREFELT % 25))
                                                     (QREFELT % 28)))
                                              (LETT |ss|
                                                    (SPADCALL |ss|
                                                              (SPADCALL |c2|
                                                                        (SPADCALL
                                                                         |d2|
                                                                         |rr|
                                                                         (QREFELT
                                                                          %
                                                                          25))
                                                                        (QREFELT
                                                                         % 28))
                                                              (QREFELT % 25)))
                                              (LETT |cu|
                                                    (SPADCALL
                                                     (SPADCALL |ss| |c1|
                                                               (QREFELT % 25))
                                                     |krr|
                                                     (SPADCALL |krr|
                                                               (QREFELT % 109))
                                                     (QREFELT % 110)))
                                              (LETT |du|
                                                    (SPADCALL
                                                     (SPADCALL |ss| |d1|
                                                               (QREFELT % 25))
                                                     |krr|
                                                     (SPADCALL |krr|
                                                               (QREFELT % 109))
                                                     (QREFELT % 110)))
                                              (LETT |rl| NIL)
                                              (SEQ (LETT |di| NIL)
                                                   (LETT #2#
                                                         (|RSIMP;my_coeffs|
                                                          |du| 5 %))
                                                   (LETT |ci| NIL)
                                                   (LETT #1#
                                                         (|RSIMP;my_coeffs|
                                                          |cu| 5 %))
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #1#)
                                                         (PROGN
                                                          (LETT |ci| (CAR #1#))
                                                          NIL)
                                                         (ATOM #2#)
                                                         (PROGN
                                                          (LETT |di| (CAR #2#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (LETT |rl|
                                                          (CONS |ci| |rl|))
                                                    (EXIT
                                                     (LETT |rl|
                                                           (CONS |di| |rl|))))
                                                   (LETT #1#
                                                         (PROG1 (CDR #1#)
                                                           (LETT #2#
                                                                 (CDR #2#))))
                                                   (GO G190) G191 (EXIT NIL))
                                              (EXIT
                                               (CONS 0
                                                     (CONS
                                                      (SPADCALL |r3l| 1
                                                                (QREFELT % 76))
                                                      (NREVERSE
                                                       |rl|))))))))))))))))))
          #12# (EXIT #7#)))) 

(SDEFUN |RSIMP;rsimp1;EIU;15|
        ((|av| (|Expression| (|Integer|))) (|k| (|Integer|))
         (% (|Union| (|Expression| (|Integer|)) "failed")))
        (SPROG
         ((#1=#:G195 NIL)
          (|f1| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (#2=#:G196 NIL) (|fac| NIL)
          (|fpk|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (|pk| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |pk|
                  (SPADCALL
                   (SPADCALL (|spadConstant| % 40) |k| (QREFELT % 115))
                   (SPADCALL |av| (QREFELT % 116)) (QREFELT % 117)))
            (LETT |fpk| (SPADCALL |pk| (QREFELT % 64)))
            (SEQ (LETT |fac| NIL) (LETT #2# (SPADCALL |fpk| (QREFELT % 69)))
                 G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ (LETT |f1| (QVELT |fac| 1))
                      (EXIT
                       (COND
                        ((EQL (SPADCALL |f1| (QREFELT % 71)) 1)
                         (PROGN
                          (LETT #1#
                                (CONS 0
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |f1| 0 (QREFELT % 73))
                                        (SPADCALL |f1| (QREFELT % 74))
                                        (QREFELT % 38))
                                       (QREFELT % 37))))
                          (GO #3=#:G194))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #3# (EXIT #1#)))) 

(SDEFUN |RSIMP;my_root|
        ((|s1| (|Expression| (|Integer|))) (|k| (|Integer|))
         (|opr| (|BasicOperator|)) (% (|Expression| (|Integer|))))
        (SPROG
         ((|du1| #1=(|Union| (|Expression| (|Integer|)) "failed")) (|nu1| #1#)
          (|d1| (|Expression| (|Integer|))) (|n1| (|Expression| (|Integer|))))
         (SEQ
          (LETT |n1| (SPADCALL (SPADCALL |s1| (QREFELT % 93)) (QREFELT % 92)))
          (EXIT
           (COND
            ((SPADCALL |n1| (|spadConstant| % 40) (QREFELT % 56))
             (SPADCALL (|spadConstant| % 40)
                       (SPADCALL |opr|
                                 (LIST
                                  (SPADCALL (|spadConstant| % 40) |s1|
                                            (QREFELT % 38))
                                  (SPADCALL |k| (QREFELT % 94)))
                                 (QREFELT % 122))
                       (QREFELT % 38)))
            (#2='T
             (SEQ
              (LETT |d1|
                    (SPADCALL (SPADCALL |s1| (QREFELT % 91)) (QREFELT % 92)))
              (LETT |nu1| (SPADCALL |n1| |k| (QREFELT % 119)))
              (EXIT
               (COND
                ((QEQCAR |nu1| 0)
                 (SPADCALL (QCDR |nu1|)
                           (SPADCALL |opr|
                                     (LIST |d1| (SPADCALL |k| (QREFELT % 94)))
                                     (QREFELT % 122))
                           (QREFELT % 38)))
                (#2#
                 (SEQ (LETT |du1| (SPADCALL |d1| |k| (QREFELT % 119)))
                      (EXIT
                       (COND
                        ((QEQCAR |du1| 0)
                         (SPADCALL
                          (SPADCALL |opr|
                                    (LIST |n1| (SPADCALL |k| (QREFELT % 94)))
                                    (QREFELT % 122))
                          (QCDR |du1|) (QREFELT % 38)))
                        (#2#
                         (SPADCALL |opr|
                                   (LIST |s1| (SPADCALL |k| (QREFELT % 94)))
                                   (QREFELT % 122)))))))))))))))) 

(SDEFUN |RSIMP;eval_rl|
        ((|rl| (|List| (|Expression| (|Integer|))))
         (|kf| (|Expression| (|Integer|))) (|k| (|Integer|))
         (% (|Expression| (|Integer|))))
        (SPROG
         ((|res| (|Expression| (|Integer|))) (|ki| (|Expression| (|Integer|)))
          (#1=#:G209 NIL) (|i| NIL) (#2=#:G210 NIL) (|ci| NIL))
         (SEQ (LETT |res| (|SPADfirst| |rl|)) (LETT |ki| (|spadConstant| % 40))
              (SEQ (LETT |ci| NIL) (LETT #2# (CDR |rl|)) (LETT |i| 1)
                   (LETT #1# (- |k| 1)) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |ci| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ki| (SPADCALL |ki| |kf| (QREFELT % 25)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |ci| |ki| (QREFELT % 25))
                                         |res| (QREFELT % 28)))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RSIMP;rsimp2_gen|
        ((|arg| #1=(|Expression| (|Integer|)))
         (|lk| (|List| (|Kernel| (|Expression| (|Integer|)))))
         (|k| (|Integer|)) (|opr| (|BasicOperator|))
         (% (|Union| (|Expression| (|Integer|)) "failed")))
        (SPROG
         ((|su| (|Union| (|Expression| (|Integer|)) "failed")) (|s1| #1#)
          (|res| (|Expression| (|Integer|)))
          (|r1l| (|List| (|Expression| (|Integer|)))) (#2=#:G228 NIL)
          (|res1| (|Union| (|List| (|Expression| (|Integer|))) "failed"))
          (|cl| (|List| (|Expression| (|Integer|))))
          (|bv| #3=(|Expression| (|Integer|))) (|av| #3#)
          (|rv| (|Expression| (|Integer|))) (|deg_k| (|NonNegativeInteger|))
          (|def_k| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (#4=#:G227 NIL) (#5=#:G229 NIL) (|ker| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |s1| |arg|) (LETT |res| (|spadConstant| % 40))
                (SEQ (LETT |ker| NIL) (LETT #5# |lk|) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |ker| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL
                          (SPADCALL |ker| (SPADCALL |s1| (QREFELT % 124))
                                    (QREFELT % 126)))
                         (PROGN (LETT #4# |$NoValue|) (GO #6=#:G214)))
                        ('T
                         (SEQ (LETT |def_k| (SPADCALL |ker| (QREFELT % 109)))
                              (LETT |deg_k| (SPADCALL |def_k| (QREFELT % 71)))
                              (EXIT
                               (COND
                                ((>
                                  (SPADCALL (SPADCALL |def_k| (QREFELT % 127))
                                            (QREFELT % 71))
                                  0)
                                 (PROGN
                                  (LETT #2# (CONS 1 "failed"))
                                  (GO #7=#:G226)))
                                ('T
                                 (SEQ
                                  (LETT |rv|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |def_k| 0 (QREFELT % 73))
                                          (SPADCALL |def_k| (QREFELT % 74))
                                          (QREFELT % 38))
                                         (QREFELT % 37)))
                                  (LETT |su|
                                        (SPADCALL |s1| |ker|
                                                  (SPADCALL |ker|
                                                            (QREFELT % 109))
                                                  (QREFELT % 110)))
                                  (LETT |av| (SPADCALL |su| 0 (QREFELT % 73)))
                                  (LETT |bv| (SPADCALL |su| 1 (QREFELT % 73)))
                                  (EXIT
                                   (COND
                                    ((EQL |deg_k| 2)
                                     (SEQ
                                      (LETT |res1|
                                            (|RSIMP;rsimp_gen_2| |av| |bv| |rv|
                                             |k| %))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |res1| 1)
                                         (PROGN
                                          (LETT #2# (CONS 1 "failed"))
                                          (GO #7#)))
                                        ('T
                                         (SEQ (LETT |r1l| (QCDR |res1|))
                                              (LETT |res|
                                                    (SPADCALL |res|
                                                              (|RSIMP;eval_rl|
                                                               (CDR |r1l|)
                                                               (SPADCALL |ker|
                                                                         (QREFELT
                                                                          %
                                                                          128))
                                                               2 %)
                                                              (QREFELT % 25)))
                                              (EXIT
                                               (LETT |s1|
                                                     (SPADCALL |r1l| 1
                                                               (QREFELT %
                                                                        76))))))))))
                                    ((EQL |deg_k| 3)
                                     (SEQ
                                      (LETT |res1|
                                            (|RSIMP;rsimp_gen_3| |av| |bv|
                                             (SPADCALL |su| 2 (QREFELT % 73))
                                             |rv| |k| %))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |res1| 1)
                                         (PROGN
                                          (LETT #2# (CONS 1 "failed"))
                                          (GO #7#)))
                                        ('T
                                         (SEQ (LETT |r1l| (QCDR |res1|))
                                              (LETT |res|
                                                    (SPADCALL |res|
                                                              (|RSIMP;eval_rl|
                                                               (CDR |r1l|)
                                                               (SPADCALL |ker|
                                                                         (QREFELT
                                                                          %
                                                                          128))
                                                               3 %)
                                                              (QREFELT % 25)))
                                              (EXIT
                                               (LETT |s1|
                                                     (SPADCALL |r1l| 1
                                                               (QREFELT %
                                                                        76))))))))))
                                    ('T
                                     (SEQ
                                      (COND
                                       ((< 12 |deg_k|)
                                        (PROGN
                                         (LETT #2# (CONS 1 "failed"))
                                         (GO #7#))))
                                      (LETT |cl|
                                            (|RSIMP;my_coeffs| |su|
                                             (- |deg_k| 1) %))
                                      (LETT |res1|
                                            (COND
                                             ((EQL |deg_k| 4)
                                              (|RSIMP;rsimp_gen_4| |cl| |rv|
                                               |k| %))
                                             ((EQL |deg_k| 6)
                                              (|RSIMP;rsimp_gen_6| |cl| |rv|
                                               |k| %))
                                             ((EQL |deg_k| 8)
                                              (|RSIMP;rsimp_gen_8| |cl| |rv|
                                               |k| %))
                                             ((EQL |deg_k| 9)
                                              (|RSIMP;rsimp_gen_9| |cl| |rv|
                                               |k| %))
                                             ((EQL |deg_k| 12)
                                              (|RSIMP;rsimp_gen_12| |cl| |rv|
                                               |k| %))
                                             ('T (CONS 1 "failed"))))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |res1| 1)
                                         (PROGN
                                          (LETT #2# (CONS 1 "failed"))
                                          (GO #7#)))
                                        ('T
                                         (SEQ (LETT |r1l| (QCDR |res1|))
                                              (LETT |res|
                                                    (SPADCALL |res|
                                                              (|RSIMP;eval_rl|
                                                               (CDR |r1l|)
                                                               (SPADCALL |ker|
                                                                         (QREFELT
                                                                          %
                                                                          128))
                                                               |deg_k| %)
                                                              (QREFELT % 25)))
                                              (EXIT
                                               (LETT |s1|
                                                     (SPADCALL |r1l| 1
                                                               (QREFELT %
                                                                        76))))))))))))))))))))
                      #6# (EXIT #4#))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (LETT |su| (SPADCALL |s1| |k| (QREFELT % 119)))
                (EXIT
                 (COND
                  ((QEQCAR |su| 0)
                   (CONS 0 (SPADCALL |res| (QCDR |su|) (QREFELT % 25))))
                  ('T
                   (CONS 0
                         (SPADCALL |res| (|RSIMP;my_root| |s1| |k| |opr| %)
                                   (QREFELT % 25))))))))
          #7# (EXIT #2#)))) 

(SDEFUN |RSIMP;rsimp;EU;19|
        ((|av| (|Expression| (|Integer|)))
         (% (|Union| (|Expression| (|Integer|)) "failed")))
        (SPROG
         ((|lk| (|List| (|Kernel| (|Expression| (|Integer|))))) (#1=#:G241 NIL)
          (|ker| NIL) (#2=#:G240 NIL)
          (|res1| (|Union| (|Expression| (|Integer|)) "failed"))
          (|k| (|Integer|)) (|kke| #3=(|Expression| (|Integer|))) (|a1| #3#)
          (|args| (|List| (|Expression| (|Integer|))))
          (|opr| (|BasicOperator|))
          (|ker0| (|Kernel| (|Expression| (|Integer|))))
          (|k0u| (|Union| (|Kernel| (|Expression| (|Integer|))) "failed")))
         (SEQ (LETT |k0u| (SPADCALL |av| (QREFELT % 130)))
              (EXIT
               (COND ((QEQCAR |k0u| 1) (CONS 1 "failed"))
                     (#4='T
                      (SEQ (LETT |ker0| (QCDR |k0u|))
                           (LETT |opr| (SPADCALL |ker0| (QREFELT % 131)))
                           (COND
                            ((NULL (SPADCALL |opr| '|nthRoot| (QREFELT % 132)))
                             (EXIT (CONS 1 "failed"))))
                           (LETT |args| (SPADCALL |ker0| (QREFELT % 133)))
                           (LETT |a1| (SPADCALL |args| 1 (QREFELT % 76)))
                           (LETT |kke| (SPADCALL |args| 2 (QREFELT % 76)))
                           (LETT |k| (SPADCALL |kke| (QREFELT % 134)))
                           (LETT |res1| (SPADCALL |a1| |k| (QREFELT % 119)))
                           (EXIT
                            (COND ((QEQCAR |res1| 0) |res1|)
                                  (#4#
                                   (SEQ
                                    (LETT |lk|
                                          (PROGN
                                           (LETT #2# NIL)
                                           (SEQ (LETT |ker| NIL)
                                                (LETT #1#
                                                      (SPADCALL |a1|
                                                                (QREFELT %
                                                                         124)))
                                                G190
                                                (COND
                                                 ((OR (ATOM #1#)
                                                      (PROGN
                                                       (LETT |ker| (CAR #1#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL
                                                     (SPADCALL |ker|
                                                               (QREFELT % 131))
                                                     '|nthRoot|
                                                     (QREFELT % 132))
                                                    (LETT #2#
                                                          (CONS |ker| #2#))))))
                                                (LETT #1# (CDR #1#)) (GO G190)
                                                G191 (EXIT (NREVERSE #2#)))))
                                    (EXIT
                                     (|RSIMP;rsimp2_gen| |a1| |lk| |k| |opr|
                                      %))))))))))))) 

(DECLAIM (NOTINLINE |RootSimplification;|)) 

(DEFUN |RootSimplification;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|RootSimplification|))
          (LETT % (GETREFV 136))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RootSimplification| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 16 (SPADCALL '|a| (QREFELT % 15)))
          (QSETREFV % 17 (SPADCALL '|b| (QREFELT % 15)))
          (QSETREFV % 18 (SPADCALL '|c| (QREFELT % 15)))
          (QSETREFV % 21 (SPADCALL '|c| (QREFELT % 20)))
          (QSETREFV % 22 (SPADCALL '|r| (QREFELT % 15)))
          (QSETREFV % 29
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (QREFELT % 17)
                                (SPADCALL (QREFELT % 18) 2 (QREFELT % 24))
                                (QREFELT % 25))
                      (SPADCALL (SPADCALL 2 (QREFELT % 16) (QREFELT % 26))
                                (QREFELT % 18) (QREFELT % 25))
                      (QREFELT % 27))
                     (SPADCALL (QREFELT % 17) (QREFELT % 22) (QREFELT % 25))
                     (QREFELT % 28)))
          (QSETREFV % 36
                    (SPADCALL
                     (SPADCALL (QREFELT % 29) (QREFELT % 21) (QREFELT % 32))
                     (QREFELT % 35)))
          (QSETREFV % 39
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (QREFELT % 17) (QREFELT % 18) (QREFELT % 25))
                       (QREFELT % 37))
                      (SPADCALL 2 (QREFELT % 16) (QREFELT % 26))
                      (QREFELT % 28))
                     (SPADCALL 2 (QREFELT % 22) (QREFELT % 26))
                     (QREFELT % 38)))
          (QSETREFV % 43
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 3 (QREFELT % 17) (QREFELT % 26))
                                 (QREFELT % 18) (QREFELT % 25))
                       (SPADCALL -1 (QREFELT % 16) (QREFELT % 42))
                       (QREFELT % 28))
                      (QREFELT % 22) (QREFELT % 25))
                     (SPADCALL
                      (SPADCALL (QREFELT % 17)
                                (SPADCALL (QREFELT % 18) 3 (QREFELT % 24))
                                (QREFELT % 25))
                      (SPADCALL (SPADCALL -3 (QREFELT % 16) (QREFELT % 42))
                                (SPADCALL (QREFELT % 18) 2 (QREFELT % 24))
                                (QREFELT % 25))
                      (QREFELT % 28))
                     (QREFELT % 28)))
          (QSETREFV % 44
                    (SPADCALL
                     (SPADCALL (QREFELT % 43) (QREFELT % 21) (QREFELT % 32))
                     (QREFELT % 35)))
          (QSETREFV % 45
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL 8 (QREFELT % 17) (QREFELT % 26))
                                (QREFELT % 22) (QREFELT % 25))
                      (SPADCALL
                       (SPADCALL (SPADCALL 3 (QREFELT % 17) (QREFELT % 26))
                                 (SPADCALL (QREFELT % 18) 2 (QREFELT % 24))
                                 (QREFELT % 25))
                       (SPADCALL (SPADCALL -9 (QREFELT % 16) (QREFELT % 42))
                                 (QREFELT % 18) (QREFELT % 25))
                       (QREFELT % 28))
                      (QREFELT % 28))
                     (SPADCALL 8 (SPADCALL (QREFELT % 22) 2 (QREFELT % 24))
                               (QREFELT % 26))
                     (QREFELT % 38)))
          (QSETREFV % 46
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 5 (QREFELT % 17) (QREFELT % 26))
                                   (QREFELT % 18) (QREFELT % 25))
                         (QREFELT % 16) (QREFELT % 27))
                        (SPADCALL (QREFELT % 22) 2 (QREFELT % 24))
                        (QREFELT % 25))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 10 (QREFELT % 17) (QREFELT % 26))
                                   (SPADCALL (QREFELT % 18) 3 (QREFELT % 24))
                                   (QREFELT % 25))
                         (SPADCALL (SPADCALL 10 (QREFELT % 16) (QREFELT % 26))
                                   (SPADCALL (QREFELT % 18) 2 (QREFELT % 24))
                                   (QREFELT % 25))
                         (QREFELT % 27))
                        (QREFELT % 22) (QREFELT % 25))
                       (QREFELT % 28))
                      (SPADCALL (QREFELT % 17)
                                (SPADCALL (QREFELT % 18) 5 (QREFELT % 24))
                                (QREFELT % 25))
                      (QREFELT % 28))
                     (SPADCALL (SPADCALL 5 (QREFELT % 16) (QREFELT % 26))
                               (SPADCALL (QREFELT % 18) 4 (QREFELT % 24))
                               (QREFELT % 25))
                     (QREFELT % 27)))
          (QSETREFV % 47
                    (SPADCALL
                     (SPADCALL (QREFELT % 46) (QREFELT % 21) (QREFELT % 32))
                     (QREFELT % 35)))
          (QSETREFV % 48
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL 128 (QREFELT % 17) (QREFELT % 26))
                                  (SPADCALL (QREFELT % 22) 2 (QREFELT % 24))
                                  (QREFELT % 25))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL 345 (QREFELT % 17) (QREFELT % 26))
                           (SPADCALL (QREFELT % 18) 2 (QREFELT % 24))
                           (QREFELT % 25))
                          (SPADCALL
                           (SPADCALL 325 (QREFELT % 16) (QREFELT % 26))
                           (QREFELT % 18) (QREFELT % 25))
                          (QREFELT % 27))
                         (QREFELT % 22) (QREFELT % 25))
                        (QREFELT % 28))
                       (SPADCALL (SPADCALL 35 (QREFELT % 17) (QREFELT % 26))
                                 (SPADCALL (QREFELT % 18) 4 (QREFELT % 24))
                                 (QREFELT % 25))
                       (QREFELT % 28))
                      (SPADCALL (SPADCALL 175 (QREFELT % 16) (QREFELT % 26))
                                (SPADCALL (QREFELT % 18) 3 (QREFELT % 24))
                                (QREFELT % 25))
                      (QREFELT % 27))
                     (SPADCALL 128 (SPADCALL (QREFELT % 22) 4 (QREFELT % 24))
                               (QREFELT % 26))
                     (QREFELT % 38)))
          (QSETREFV % 49
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 7 (QREFELT % 17) (QREFELT % 26))
                                   (QREFELT % 18) (QREFELT % 25))
                         (SPADCALL -1 (QREFELT % 16) (QREFELT % 42))
                         (QREFELT % 28))
                        (SPADCALL (QREFELT % 22) 3 (QREFELT % 24))
                        (QREFELT % 25))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 35 (QREFELT % 17) (QREFELT % 26))
                                   (SPADCALL (QREFELT % 18) 3 (QREFELT % 24))
                                   (QREFELT % 25))
                         (SPADCALL (SPADCALL -21 (QREFELT % 16) (QREFELT % 42))
                                   (SPADCALL (QREFELT % 18) 2 (QREFELT % 24))
                                   (QREFELT % 25))
                         (QREFELT % 28))
                        (SPADCALL (QREFELT % 22) 2 (QREFELT % 24))
                        (QREFELT % 25))
                       (QREFELT % 28))
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL 21 (QREFELT % 17) (QREFELT % 26))
                                  (SPADCALL (QREFELT % 18) 5 (QREFELT % 24))
                                  (QREFELT % 25))
                        (SPADCALL (SPADCALL -35 (QREFELT % 16) (QREFELT % 42))
                                  (SPADCALL (QREFELT % 18) 4 (QREFELT % 24))
                                  (QREFELT % 25))
                        (QREFELT % 28))
                       (QREFELT % 22) (QREFELT % 25))
                      (QREFELT % 28))
                     (SPADCALL
                      (SPADCALL (QREFELT % 17)
                                (SPADCALL (QREFELT % 18) 7 (QREFELT % 24))
                                (QREFELT % 25))
                      (SPADCALL (SPADCALL -7 (QREFELT % 16) (QREFELT % 42))
                                (SPADCALL (QREFELT % 18) 6 (QREFELT % 24))
                                (QREFELT % 25))
                      (QREFELT % 28))
                     (QREFELT % 28)))
          (QSETREFV % 50
                    (SPADCALL
                     (SPADCALL (QREFELT % 49) (QREFELT % 21) (QREFELT % 32))
                     (QREFELT % 35)))
          (QSETREFV % 51
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL 1024 (QREFELT % 17) (QREFELT % 26))
                                  (SPADCALL (QREFELT % 22) 3 (QREFELT % 24))
                                  (QREFELT % 25))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL 7651 (QREFELT % 17) (QREFELT % 26))
                           (SPADCALL (QREFELT % 18) 2 (QREFELT % 24))
                           (QREFELT % 25))
                          (SPADCALL
                           (SPADCALL -4165 (QREFELT % 16) (QREFELT % 42))
                           (QREFELT % 18) (QREFELT % 25))
                          (QREFELT % 28))
                         (SPADCALL (QREFELT % 22) 2 (QREFELT % 24))
                         (QREFELT % 25))
                        (QREFELT % 28))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL 4830 (QREFELT % 17) (QREFELT % 26))
                          (SPADCALL (QREFELT % 18) 4 (QREFELT % 24))
                          (QREFELT % 25))
                         (SPADCALL
                          (SPADCALL -7938 (QREFELT % 16) (QREFELT % 42))
                          (SPADCALL (QREFELT % 18) 3 (QREFELT % 24))
                          (QREFELT % 25))
                         (QREFELT % 28))
                        (QREFELT % 22) (QREFELT % 25))
                       (QREFELT % 28))
                      (SPADCALL
                       (SPADCALL (SPADCALL 231 (QREFELT % 17) (QREFELT % 26))
                                 (SPADCALL (QREFELT % 18) 6 (QREFELT % 24))
                                 (QREFELT % 25))
                       (SPADCALL (SPADCALL -1617 (QREFELT % 16) (QREFELT % 42))
                                 (SPADCALL (QREFELT % 18) 5 (QREFELT % 24))
                                 (QREFELT % 25))
                       (QREFELT % 28))
                      (QREFELT % 28))
                     (SPADCALL 1024 (SPADCALL (QREFELT % 22) 6 (QREFELT % 24))
                               (QREFELT % 26))
                     (QREFELT % 38)))
          (QSETREFV % 52
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL 11 (QREFELT % 17) (QREFELT % 26))
                            (QREFELT % 18) (QREFELT % 25))
                           (SPADCALL -1 (QREFELT % 16) (QREFELT % 42))
                           (QREFELT % 28))
                          (SPADCALL (QREFELT % 22) 5 (QREFELT % 24))
                          (QREFELT % 25))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL 165 (QREFELT % 17) (QREFELT % 26))
                            (SPADCALL (QREFELT % 18) 3 (QREFELT % 24))
                            (QREFELT % 25))
                           (SPADCALL
                            (SPADCALL -55 (QREFELT % 16) (QREFELT % 42))
                            (SPADCALL (QREFELT % 18) 2 (QREFELT % 24))
                            (QREFELT % 25))
                           (QREFELT % 28))
                          (SPADCALL (QREFELT % 22) 4 (QREFELT % 24))
                          (QREFELT % 25))
                         (QREFELT % 28))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL 462 (QREFELT % 17) (QREFELT % 26))
                           (SPADCALL (QREFELT % 18) 5 (QREFELT % 24))
                           (QREFELT % 25))
                          (SPADCALL
                           (SPADCALL -330 (QREFELT % 16) (QREFELT % 42))
                           (SPADCALL (QREFELT % 18) 4 (QREFELT % 24))
                           (QREFELT % 25))
                          (QREFELT % 28))
                         (SPADCALL (QREFELT % 22) 3 (QREFELT % 24))
                         (QREFELT % 25))
                        (QREFELT % 28))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 330 (QREFELT % 17) (QREFELT % 26))
                                   (SPADCALL (QREFELT % 18) 7 (QREFELT % 24))
                                   (QREFELT % 25))
                         (SPADCALL
                          (SPADCALL -462 (QREFELT % 16) (QREFELT % 42))
                          (SPADCALL (QREFELT % 18) 6 (QREFELT % 24))
                          (QREFELT % 25))
                         (QREFELT % 28))
                        (SPADCALL (QREFELT % 22) 2 (QREFELT % 24))
                        (QREFELT % 25))
                       (QREFELT % 28))
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL 55 (QREFELT % 17) (QREFELT % 26))
                                  (SPADCALL (QREFELT % 18) 9 (QREFELT % 24))
                                  (QREFELT % 25))
                        (SPADCALL (SPADCALL -165 (QREFELT % 16) (QREFELT % 42))
                                  (SPADCALL (QREFELT % 18) 8 (QREFELT % 24))
                                  (QREFELT % 25))
                        (QREFELT % 28))
                       (QREFELT % 22) (QREFELT % 25))
                      (QREFELT % 28))
                     (SPADCALL
                      (SPADCALL (QREFELT % 17)
                                (SPADCALL (QREFELT % 18) 11 (QREFELT % 24))
                                (QREFELT % 25))
                      (SPADCALL (SPADCALL -11 (QREFELT % 16) (QREFELT % 42))
                                (SPADCALL (QREFELT % 18) 10 (QREFELT % 24))
                                (QREFELT % 25))
                      (QREFELT % 28))
                     (QREFELT % 28)))
          (QSETREFV % 53
                    (SPADCALL
                     (SPADCALL (QREFELT % 52) (QREFELT % 21) (QREFELT % 32))
                     (QREFELT % 35)))
          (QSETREFV % 54
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL 262144 (QREFELT % 17) (QREFELT % 26))
                           (SPADCALL (QREFELT % 22) 5 (QREFELT % 24))
                           (QREFELT % 25))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL 6631845 (QREFELT % 17) (QREFELT % 26))
                             (SPADCALL (QREFELT % 18) 2 (QREFELT % 24))
                             (QREFELT % 25))
                            (SPADCALL
                             (SPADCALL -1913615 (QREFELT % 16) (QREFELT % 42))
                             (QREFELT % 18) (QREFELT % 25))
                            (QREFELT % 28))
                           (SPADCALL (QREFELT % 22) 4 (QREFELT % 24))
                           (QREFELT % 25))
                          (QREFELT % 28))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL 20560540 (QREFELT % 17) (QREFELT % 26))
                            (SPADCALL (QREFELT % 18) 4 (QREFELT % 24))
                            (QREFELT % 25))
                           (SPADCALL
                            (SPADCALL -14188460 (QREFELT % 16) (QREFELT % 42))
                            (SPADCALL (QREFELT % 18) 3 (QREFELT % 24))
                            (QREFELT % 25))
                           (QREFELT % 28))
                          (SPADCALL (QREFELT % 22) 3 (QREFELT % 24))
                          (QREFELT % 25))
                         (QREFELT % 28))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL 15109094 (QREFELT % 17) (QREFELT % 26))
                           (SPADCALL (QREFELT % 18) 6 (QREFELT % 24))
                           (QREFELT % 25))
                          (SPADCALL
                           (SPADCALL -20942922 (QREFELT % 16) (QREFELT % 42))
                           (SPADCALL (QREFELT % 18) 5 (QREFELT % 24))
                           (QREFELT % 25))
                          (QREFELT % 28))
                         (SPADCALL (QREFELT % 22) 2 (QREFELT % 24))
                         (QREFELT % 25))
                        (QREFELT % 28))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL 2537964 (QREFELT % 17) (QREFELT % 26))
                          (SPADCALL (QREFELT % 18) 8 (QREFELT % 24))
                          (QREFELT % 25))
                         (SPADCALL
                          (SPADCALL -7594444 (QREFELT % 16) (QREFELT % 42))
                          (SPADCALL (QREFELT % 18) 7 (QREFELT % 24))
                          (QREFELT % 25))
                         (QREFELT % 28))
                        (QREFELT % 22) (QREFELT % 25))
                       (QREFELT % 28))
                      (SPADCALL
                       (SPADCALL (SPADCALL 46189 (QREFELT % 17) (QREFELT % 26))
                                 (SPADCALL (QREFELT % 18) 10 (QREFELT % 24))
                                 (QREFELT % 25))
                       (SPADCALL
                        (SPADCALL -508079 (QREFELT % 16) (QREFELT % 42))
                        (SPADCALL (QREFELT % 18) 9 (QREFELT % 24))
                        (QREFELT % 25))
                       (QREFELT % 28))
                      (QREFELT % 28))
                     (SPADCALL 262144
                               (SPADCALL (QREFELT % 22) 10 (QREFELT % 24))
                               (QREFELT % 26))
                     (QREFELT % 38)))
          (QSETREFV % 79
                    (SPADCALL "eI := Expression(Integer); a := 'a::eI; "
                              "b := 'b::eI; c := 'c::eI; r := 'r::eI; e := 'e::eI;"
                              (QREFELT % 78)))
          (QSETREFV % 80 (SPADCALL '|e| (QREFELT % 15)))
          (QSETREFV % 81 (SPADCALL '|e| (QREFELT % 20)))
          (QSETREFV % 82
                    (|RSIMP;str_to_expr|
                     (SPADCALL (QREFELT % 79)
                               (SPADCALL
                                "(-1)*c^2*r^2+((-8)*c^2*e^3+18*b*c*e^2+((-4)*a*c+(-8)*b^2)*e+"
                                "4*a*b)*r +((4*a*c+(-1)*b^2)*e^4+(-4)*a*b*e^3)"
                                (QREFELT % 78))
                               (QREFELT % 78))
                     %))
          (QSETREFV % 83
                    (SPADCALL
                     (SPADCALL (QREFELT % 82) (QREFELT % 81) (QREFELT % 32))
                     (QREFELT % 35)))
          (QSETREFV % 84
                    (|RSIMP;str_to_expr|
                     (SPADCALL (QREFELT % 79)
                               (SPADCALL
                                "((8*c^3*e^2+(-9)*b*c^2*e+(4*a*c^2+(-1)*b^2*c))*r"
                                " +(((-4)*a*c^2+b^2*c)*e^3+b^3*e^2))/(2*c^3*r+(-2)*b^3)"
                                (QREFELT % 78))
                               (QREFELT % 78))
                     %))
          (QSETREFV % 85
                    (|RSIMP;str_to_expr|
                     (SPADCALL (QREFELT % 79)
                               (SPADCALL
                                "(((-8)*c^4*e+10*b*c^3)*r^2+((4*a*c^3+(-9)*b^2*c^2)*e^2+17*b^3*c*e"
                                (SPADCALL
                                 "+((-4)*a*b^2*c+(-9)*b^4))*r+((4*a*b^2*c+(-1)*b^4)*e^3"
                                 "+(-4)*a*b^3*e^2))/(9*c^3*r^3+(-9)*b^3*r^2)"
                                 (QREFELT % 78))
                                (QREFELT % 78))
                               (QREFELT % 78))
                     %))
          (QSETREFV % 86
                    (|RSIMP;str_to_expr|
                     (SPADCALL (QREFELT % 79)
                               (SPADCALL
                                "(-1)*c^3*r^4+(3*c^3*e^3+(3*a*b*c+(-1)*b^3))*r^3"
                                (SPADCALL
                                 "+(24*c^3*e^6+(-81)*b*c^2*e^5+(27*a*c^2+81*b^2*c)*e^4"
                                 (SPADCALL
                                  "+((-63)*a*b*c+(-24)*b^3)*e^3+(9*a^2*c+27*a*b^2)*e^2"
                                  (SPADCALL
                                   "+(-9)*a^2*b*e)*r^2+(c^3*e^9+(-27)*a*c^2*e^7+(63*a*b*c+(-3)*b^3)*e^6"
                                   (SPADCALL
                                    "+((-18)*a^2*c+(-27)*a*b^2)*e^5+18*a^2*b*e^4)*r+(((-3)*a*b*c+b^3)*e^9"
                                    "+9*a^2*c*e^8+(-9)*a^2*b*e^7)"
                                    (QREFELT % 78))
                                   (QREFELT % 78))
                                  (QREFELT % 78))
                                 (QREFELT % 78))
                                (QREFELT % 78))
                               (QREFELT % 78))
                     %))
          (QSETREFV % 87
                    (SPADCALL
                     (SPADCALL (QREFELT % 86) (QREFELT % 81) (QREFELT % 32))
                     (QREFELT % 35)))
          (QSETREFV % 88
                    (|RSIMP;str_to_expr|
                     (SPADCALL (QREFELT % 79)
                               (SPADCALL
                                "((7*c^9*e^2+(-18)*b*c^8*e+(13*a*c^8+(-11)*b^2*c^7))*r^5"
                                (SPADCALL
                                 "+((-119)*c^9*e^5+336*b*c^8*e^4+((-140)*a*c^8+(-203)*b^2*c^7)*e^3"
                                 (SPADCALL
                                  "+(160*a*b*c^7+10*b^3*c^6)*e^2+((-41)*a^2*c^7+93*a*b^2*c^6"
                                  (SPADCALL
                                   "+(-43)*b^4*c^5)*e+((-58)*a^2*b*c^6+88*a*b^3*c^5+(-29)*b^5*c^4))*r^4"
                                   (SPADCALL
                                    "+((-5)*c^9*e^8+(-3)*b*c^8*e^7+(136*a*c^8+(-2)*b^2*c^7)*e^6+(289"
                                    (SPADCALL
                                     "*a*b*c^7+(-272)*b^3*c^6)*e^5+(94*a^2*c^7+(-1509)*a*b^2*c^6"
                                     (SPADCALL
                                      "+818*b^4*c^5)*e^4+(593*a^2*b*c^6+547*a*b^3*c^5+(-461)*b^5*c^4)*e^3"
                                      (SPADCALL
                                       "+(18*a^3*c^6+(-870)*a^2*b^2*c^5+519*a*b^4*c^4+(-37)*b^6*c^3)*e^2"
                                       (SPADCALL
                                        "+(144*a^3*b*c^5+(-157)*a^2*b^3*c^4+29*a*b^5*c^3+11*b^7*c^2)*e"
                                        (SPADCALL
                                         "+(27*a^4*c^5+(-36)*a^3*b^2*c^4+(-14)*a^2*b^4*c^3+15*a*b^6*c^2))*r^3"
                                         (SPADCALL
                                          "+((37*a*b*c^7+(-17)*b^3*c^6)*e^8+((-44)*a^2*c^7+21*a*b^2*c^6"
                                          (SPADCALL
                                           "+(-10)*b^4*c^5)*e^7+((-580)*a^2*b*c^6+337*a*b^3*c^5"
                                           (SPADCALL
                                            "+(-5)*b^5*c^4)*e^6+((-234)*a^3*c^6+1149*a^2*b^2*c^5"
                                            (SPADCALL
                                             "+(-657)*a*b^4*c^4+83*b^6*c^3)*e^5+(261*a^3*b*c^5"
                                             (SPADCALL
                                              "+29*a^2*b^3*c^4+44*a*b^5*c^3+(-139)*b^7*c^2)*e^4"
                                              (SPADCALL
                                               "+((-279)*a^4*c^5+(-171)*a^3*b^2*c^4+148*a^2*b^4*c^3"
                                               (SPADCALL
                                                "+(-201)*a*b^6*c^2+174*b^8*c)*e^3+(369*a^4*b*c^4"
                                                (SPADCALL "+(-117)*a^3*b^3*c^3"
                                                          (SPADCALL
                                                           "+(-45)*a^2*b^5*c^2+35*a*b^7*c+(-40)*b^9)*e^2"
                                                           (SPADCALL
                                                            "+((-81)*a^5*c^4+63*a^4*b^2*c^3+63*a^3*b^4*c^2"
                                                            (SPADCALL
                                                             "+(-77)*a^2*b^6*c+23*a*b^8)*e+(9*a^4*b^3*c^2"
                                                             (SPADCALL
                                                              "+(-4)*a^2*b^7))*r^2+(((-9)*a^3*c^6+(-63)*a^2*b^2*c^5"
                                                              (SPADCALL
                                                               "+57*a*b^4*c^4+(-10)*b^6*c^3)*e^8+(189*a^3*b*c^5"
                                                               (SPADCALL
                                                                "+(-142)*a^2*b^3*c^4+35*a*b^5*c^3+(-7)*b^7*c^2)*e^7"
                                                                (SPADCALL
                                                                 "+(252*a^4*c^5+(-171)*a^3*b^2*c^4+55*a^2*b^4*c^3"
                                                                 (SPADCALL
                                                                  "+(-39)*a*b^6*c^2+(-3)*b^8*c)*e^6+((-423)*a^4*b*c^4"
                                                                  (SPADCALL
                                                                   "+135*a^3*b^3*c^3+(-96)*a^2*b^5*c^2+134*a*b^7*c"
                                                                   (SPADCALL
                                                                    "+(-7)*b^9)*e^5+(162*a^5*c^4+(-108)*a^4*b^2*c^3"
                                                                    (SPADCALL
                                                                     "+(-72)*a^3*b^4*c^2+136*a^2*b^6*c+(-61)*a*b^8)*e^4"
                                                                     (SPADCALL
                                                                      "+((-27)*a^5*b*c^3+36*a^3*b^5*c+(-16)*a^2*b^7)*e^3"
                                                                      (SPADCALL
                                                                       "+((-27)*a^5*b^2*c^2+18*a^4*b^4*c)*e^2+((-27)*a^5*b^3*c"
                                                                       (SPADCALL
                                                                        "+18*a^4*b^5)*e)*r+((27*a^4*b*c^4+(-18)*a^3*b^3*c^3"
                                                                        (SPADCALL
                                                                         "+6*a^2*b^5*c^2+(-7)*a*b^7*c+2*b^9)*e^8+((-81)*a^5*c^4"
                                                                         (SPADCALL
                                                                          "+45*a^4*b^2*c^3+(-18)*a^3*b^4*c^2+13*a^2*b^6*c+2*a*b^8)*e^7"
                                                                          (SPADCALL
                                                                           "+(27*a^5*b*c^3+(-9)*a^4*b^3*c^2+18*a^3*b^5*c"
                                                                           (SPADCALL
                                                                            "+(-16)*a^2*b^7)*e^6+(27*a^5*b^2*c^2+9*a^4*b^4*c"
                                                                            (SPADCALL
                                                                             "+(-18)*a^3*b^6)*e^5+(27*a^5*b^3*c+(-18)*a^4*b^5)*e^4))"
                                                                             (SPADCALL
                                                                              "/(9*c^9*r^5+((-54)*a*b*c^7+18*b^3*c^6)*r^4"
                                                                              (SPADCALL
                                                                               "+(18*a^3*c^6+54*a^2*b^2*c^5+(-18)*b^6*c^3)*r^3"
                                                                               (SPADCALL
                                                                                "+((-27)*a^4*b*c^4+(-54)*a^2*b^5*c^2+54*a*b^7*c"
                                                                                "+(-9)*b^9)*r^2+(27*a^4*b^4*c+(-18)*a^3*b^6)*r)"
                                                                                (QREFELT
                                                                                 %
                                                                                 78))
                                                                               (QREFELT
                                                                                %
                                                                                78))
                                                                              (QREFELT
                                                                               %
                                                                               78))
                                                                             (QREFELT
                                                                              %
                                                                              78))
                                                                            (QREFELT
                                                                             %
                                                                             78))
                                                                           (QREFELT
                                                                            %
                                                                            78))
                                                                          (QREFELT
                                                                           %
                                                                           78))
                                                                         (QREFELT
                                                                          %
                                                                          78))
                                                                        (QREFELT
                                                                         % 78))
                                                                       (QREFELT
                                                                        % 78))
                                                                      (QREFELT
                                                                       % 78))
                                                                     (QREFELT %
                                                                              78))
                                                                    (QREFELT %
                                                                             78))
                                                                   (QREFELT %
                                                                            78))
                                                                  (QREFELT %
                                                                           78))
                                                                 (QREFELT %
                                                                          78))
                                                                (QREFELT % 78))
                                                               (QREFELT % 78))
                                                              (QREFELT % 78))
                                                             (QREFELT % 78))
                                                            (QREFELT % 78))
                                                           (QREFELT % 78))
                                                          (QREFELT % 78))
                                                (QREFELT % 78))
                                               (QREFELT % 78))
                                              (QREFELT % 78))
                                             (QREFELT % 78))
                                            (QREFELT % 78))
                                           (QREFELT % 78))
                                          (QREFELT % 78))
                                         (QREFELT % 78))
                                        (QREFELT % 78))
                                       (QREFELT % 78))
                                      (QREFELT % 78))
                                     (QREFELT % 78))
                                    (QREFELT % 78))
                                   (QREFELT % 78))
                                  (QREFELT % 78))
                                 (QREFELT % 78))
                                (QREFELT % 78))
                               (QREFELT % 78))
                     %))
          (QSETREFV % 89
                    (|RSIMP;str_to_expr|
                     (SPADCALL (QREFELT % 79)
                               (SPADCALL
                                "((117*c^13*e^2+(-91)*b*c^12*e+(40*a*c^12"
                                (SPADCALL
                                 "+31*b^2*c^11))*r^7+(363*c^13*e^5+(-946)*b*c^12*e^4"
                                 (SPADCALL
                                  "+(346*a*c^12+571*b^2*c^11)*e^3+((-1276)*a*b*c^11"
                                  (SPADCALL
                                   "+109*b^3*c^10)*e^2+(121*a^2*c^11+601*a*b^2*c^10"
                                   (SPADCALL
                                    "+(-76)*b^4*c^9)*e+((-300)*a^2*b*c^10+(-138)*a*b^3*c^9"
                                    (SPADCALL
                                     "+56*b^5*c^8))*r^6+(15*c^13*e^8+11*b*c^12*e^7"
                                     (SPADCALL
                                      "+((-404)*a*c^12+10*b^2*c^11)*e^6+((-1057)*a*b*c^11"
                                      (SPADCALL
                                       "+571*b^3*c^10)*e^5+((-248)*a^2*c^11+4303*a*b^2*c^10"
                                       (SPADCALL
                                        "+(-1462)*b^4*c^9)*e^4+((-1449)*a^2*b*c^10"
                                        (SPADCALL
                                         "+(-1857)*a*b^3*c^9+674*b^5*c^8)*e^3+(238*a^3*c^10"
                                         (SPADCALL
                                          "+3290*a^2*b^2*c^9+(-85)*a*b^4*c^8+(-425)*b^6*c^7)*e^2"
                                          (SPADCALL
                                           "+((-730)*a^3*b*c^9+(-566)*a^2*b^3*c^8+(-668)*a*b^5*c^7"
                                           (SPADCALL
                                            "+424*b^7*c^6)*e+(81*a^4*c^9+570*a^3*b^2*c^8"
                                            (SPADCALL
                                             "+384*a^2*b^4*c^7+(-179)*a*b^6*c^6+(-55)*b^8*c^5))*r^5"
                                             (SPADCALL
                                              "+(((-115)*a*b*c^11+40*b^3*c^10)*e^8+(136*a^2*c^11"
                                              (SPADCALL
                                               "+(-89)*a*b^2*c^10+35*b^4*c^9)*e^7+(1848*a^2*b*c^10"
                                               (SPADCALL
                                                "+(-759)*a*b^3*c^9+35*b^5*c^8)*e^6+(730*a^3*c^10"
                                                (SPADCALL
                                                 "+(-2869)*a^2*b^2*c^9+2120*a*b^4*c^8"
                                                 (SPADCALL
                                                  "+(-767)*b^6*c^7)*e^5+((-763)*a^3*b*c^9+37*a^2*b^3*c^8"
                                                  (SPADCALL
                                                   "+(-3425)*a*b^5*c^7+2119*b^7*c^6)*e^4+(693*a^4*c^9"
                                                   (SPADCALL
                                                    "+435*a^3*b^2*c^8+(-27)*a^2*b^4*c^7+2878*a*b^6*c^6"
                                                    (SPADCALL
                                                     "+(-1711)*b^8*c^5)*e^3+((-1521)*a^4*b*c^8"
                                                     (SPADCALL
                                                      "+187*a^3*b^3*c^7+(-3949)*a^2*b^5*c^6+1834*a*b^7*c^5"
                                                      (SPADCALL
                                                       "+245*b^9*c^4)*e^2+(243*a^5*c^8+306*a^4*b^2*c^7"
                                                       (SPADCALL
                                                        "+443*a^3*b^4*c^6+1778*a^2*b^6*c^5+(-1060)*a*b^8*c^4"
                                                        (SPADCALL
                                                         "+(-56)*b^10*c^3)*e+((-243)*a^5*b*c^7"
                                                         (SPADCALL
                                                          "+(-108)*a^4*b^3*c^6+(-1146)*a^3*b^5*c^5"
                                                          (SPADCALL
                                                           "+678*a^2*b^7*c^4+(-30)*a*b^9*c^3+28*b^11*c^2))*r^4"
                                                           (SPADCALL
                                                            "+((31*a^3*c^10+209*a^2*b^2*c^9+(-100)*a*b^4*c^8"
                                                            (SPADCALL
                                                             "+(-5)*b^6*c^7)*e^8+((-613)*a^3*b*c^9+412*a^2*b^3*c^8"
                                                             (SPADCALL
                                                              "+(-128)*a*b^5*c^7+13*b^7*c^6)*e^7+((-828)*a^4*c^9"
                                                              (SPADCALL
                                                               "+183*a^3*b^2*c^8+(-1023)*a^2*b^4*c^7+658*a*b^6*c^6"
                                                               (SPADCALL
                                                                "+20*b^8*c^5)*e^6+(1215*a^4*b*c^8+(-1301)*a^3*b^3*c^7"
                                                                (SPADCALL
                                                                 "+4085*a^2*b^5*c^6+(-2957)*a*b^7*c^5+584*b^9*c^4)*e^5"
                                                                 (SPADCALL
                                                                  "+((-522)*a^5*c^8+180*a^4*b^2*c^7+1481*a^3*b^4*c^6"
                                                                  (SPADCALL
                                                                   "+(-3307)*a^2*b^6*c^5+3599*a*b^8*c^4"
                                                                   (SPADCALL
                                                                    "+(-1433)*b^10*c^3)*e^4+(261*a^5*b*c^7"
                                                                    (SPADCALL
                                                                     "+(-657)*a^4*b^3*c^6+1293*a^3*b^5*c^5"
                                                                     (SPADCALL
                                                                      "+(-378)*a^2*b^7*c^4+(-1857)*a*b^9*c^3"
                                                                      (SPADCALL
                                                                       "+1156*b^11*c^2)*e^3+(9*a^5*b^2*c^6+1953*a^4*b^4*c^5"
                                                                       (SPADCALL
                                                                        "+(-1753)*a^3*b^6*c^4+2713*a^2*b^8*c^3"
                                                                        (SPADCALL
                                                                         "+(-1517)*a*b^10*c^2+14*b^12*c)*e^2"
                                                                         (SPADCALL
                                                                          "+((-180)*a^5*b^3*c^5+(-531)*a^4*b^5*c^4"
                                                                          (SPADCALL
                                                                           "+(-83)*a^3*b^7*c^3+(-775)*a^2*b^9*c^2+893*a*b^11*c"
                                                                           (SPADCALL
                                                                            "+(-141)*b^13)*e+(540*a^5*b^4*c^4+(-243)*a^4*b^6*c^3"
                                                                            (SPADCALL
                                                                             "+516*a^3*b^8*c^2+(-474)*a^2*b^10*c+73*a*b^12))*r^3"
                                                                             (SPADCALL
                                                                              "+(((-99)*a^4*b*c^8+7*a^3*b^3*c^7+(-91)*a^2*b^5*c^6"
                                                                              (SPADCALL
                                                                               "+88*a*b^7*c^5+(-10)*b^9*c^4)*e^8+(279*a^5*c^8"
                                                                               (SPADCALL
                                                                                "+(-81)*a^4*b^2*c^7+371*a^3*b^4*c^6"
                                                                                (SPADCALL
                                                                                 "+(-235)*a^2*b^6*c^5+17*a*b^8*c^4+(-5)*b^10*c^3)*e^7"
                                                                                 (SPADCALL
                                                                                  "+(63*a^5*b*c^7+819*a^4*b^3*c^6+(-1713)*a^3*b^5*c^5"
                                                                                  (SPADCALL
                                                                                   "+1545*a^2*b^7*c^4+(-543)*a*b^9*c^3"
                                                                                   (SPADCALL
                                                                                    "+(-5)*b^11*c^2)*e^6+((-27)*a^5*b^2*c^6"
                                                                                    (SPADCALL
                                                                                     "+(-1854)*a^4*b^4*c^5+2705*a^3*b^6*c^4"
                                                                                     (SPADCALL
                                                                                      "+(-2738)*a^2*b^8*c^3+1228*a*b^10*c^2"
                                                                                      (SPADCALL
                                                                                       "+(-61)*b^12*c)*e^5+(54*a^6*b*c^6+387*a^5*b^3*c^5"
                                                                                       (SPADCALL
                                                                                        "+468*a^4*b^5*c^4+(-770)*a^3*b^7*c^3+458*a^2*b^9*c^2"
                                                                                        (SPADCALL
                                                                                         "+(-121)*a*b^11*c+(-18)*b^13)*e^4+(54*a^6*b^2*c^5"
                                                                                         (SPADCALL
                                                                                          "+(-1323)*a^5*b^4*c^4+630*a^4*b^6*c^3+12*a^3*b^8*c^2"
                                                                                          (SPADCALL
                                                                                           "+306*a^2*b^10*c+(-176)*a*b^12)*e^3+(54*a^6*b^3*c^4"
                                                                                           (SPADCALL
                                                                                            "+495*a^5*b^5*c^3+(-1188)*a^4*b^7*c^2+296*a^3*b^9*c"
                                                                                            (SPADCALL
                                                                                             "+178*a^2*b^11)*e^2+((-162)*a^6*b^4*c^3"
                                                                                             (SPADCALL
                                                                                              "+207*a^5*b^6*c^2+441*a^4*b^8*c+(-338)*a^3*b^10)*e"
                                                                                              (SPADCALL
                                                                                               "+((-243)*a^5*b^7*c+162*a^4*b^9))*r^2"
                                                                                               (SPADCALL
                                                                                                "+((18*a^5*b^2*c^6+63*a^4*b^4*c^5+(-142)*a^3*b^6*c^4"
                                                                                                (SPADCALL
                                                                                                 "+178*a^2*b^8*c^3+(-107)*a*b^10*c^2+20*b^12*c)*e^8"
                                                                                                 (SPADCALL
                                                                                                  "+((-54)*a^6*b*c^6+(-207)*a^5*b^3*c^5+387*a^4*b^5*c^4"
                                                                                                  (SPADCALL
                                                                                                   "+(-470)*a^3*b^7*c^3+245*a^2*b^9*c^2+(-34)*a*b^11*c"
                                                                                                   (SPADCALL
                                                                                                    "+6*b^13)*e^7+((-54)*a^6*b^2*c^5+621*a^5*b^4*c^4"
                                                                                                    (SPADCALL
                                                                                                     "+(-819)*a^4*b^6*c^3+498*a^3*b^8*c^2"
                                                                                                     (SPADCALL
                                                                                                      "+(-138)*a^2*b^10*c+4*a*b^12)*e^6"
                                                                                                      (SPADCALL
                                                                                                       "+((-54)*a^6*b^3*c^4+(-531)*a^5*b^5*c^3"
                                                                                                       (SPADCALL
                                                                                                        "+1017*a^4*b^7*c^2+(-394)*a^3*b^9*c"
                                                                                                        (SPADCALL
                                                                                                         "+(-26)*a^2*b^11)*e^5+(270*a^6*b^4*c^3"
                                                                                                         (SPADCALL
                                                                                                          "+(-405)*a^5*b^6*c^2+(-108)*a^4*b^8*c"
                                                                                                          (SPADCALL
                                                                                                           "+172*a^3*b^10)*e^4+((-54)*a^6*b^5*c^2+468*a^5*b^7*c"
                                                                                                           (SPADCALL
                                                                                                            "+(-288)*a^4*b^9)*e^3+((-54)*a^6*b^6*c"
                                                                                                            (SPADCALL
                                                                                                             "+36*a^5*b^8)*e^2)*r+((36*a^5*b^5*c^3"
                                                                                                             (SPADCALL
                                                                                                              "+(-72)*a^4*b^7*c^2+44*a^3*b^9*c+(-8)*a^2*b^11)*e^8"
                                                                                                              (SPADCALL
                                                                                                               "+((-108)*a^6*b^4*c^3+198*a^5*b^6*c^2"
                                                                                                               (SPADCALL
                                                                                                                "+(-90)*a^4*b^8*c+4*a^3*b^10)*e^7+(54*a^6*b^5*c^2"
                                                                                                                (SPADCALL
                                                                                                                 "+(-144)*a^5*b^7*c+72*a^4*b^9)*e^6+(54*a^6*b^6*c"
                                                                                                                 (SPADCALL
                                                                                                                  "+(-36)*a^5*b^8)*e^5))/(81*c^12*r^9+((-486)*a*b*c^10"
                                                                                                                  (SPADCALL
                                                                                                                   "+81*b^3*c^9)*r^8+(162*a^3*c^9+486*a^2*b^2*c^8"
                                                                                                                   (SPADCALL
                                                                                                                    "+486*a*b^4*c^7+(-324)*b^6*c^6)*r^7"
                                                                                                                    (SPADCALL
                                                                                                                     "+((-243)*a^4*b*c^7+(-162)*a^3*b^3*c^6"
                                                                                                                     (SPADCALL
                                                                                                                      "+(-972)*a^2*b^5*c^5+486*a*b^7*c^4+81*b^9*c^3)*r^6"
                                                                                                                      (SPADCALL
                                                                                                                       "+(486*a^4*b^4*c^4+(-162)*a^3*b^6*c^3"
                                                                                                                       (SPADCALL
                                                                                                                        "+486*a^2*b^8*c^2+(-486)*a*b^10*c+81*b^12)*r^5"
                                                                                                                        "+((-243)*a^4*b^7*c+162*a^3*b^9)*r^4)"
                                                                                                                        (QREFELT
                                                                                                                         %
                                                                                                                         78))
                                                                                                                       (QREFELT
                                                                                                                        %
                                                                                                                        78))
                                                                                                                      (QREFELT
                                                                                                                       %
                                                                                                                       78))
                                                                                                                     (QREFELT
                                                                                                                      %
                                                                                                                      78))
                                                                                                                    (QREFELT
                                                                                                                     %
                                                                                                                     78))
                                                                                                                   (QREFELT
                                                                                                                    %
                                                                                                                    78))
                                                                                                                  (QREFELT
                                                                                                                   %
                                                                                                                   78))
                                                                                                                 (QREFELT
                                                                                                                  %
                                                                                                                  78))
                                                                                                                (QREFELT
                                                                                                                 %
                                                                                                                 78))
                                                                                                               (QREFELT
                                                                                                                %
                                                                                                                78))
                                                                                                              (QREFELT
                                                                                                               %
                                                                                                               78))
                                                                                                             (QREFELT
                                                                                                              %
                                                                                                              78))
                                                                                                            (QREFELT
                                                                                                             %
                                                                                                             78))
                                                                                                           (QREFELT
                                                                                                            %
                                                                                                            78))
                                                                                                          (QREFELT
                                                                                                           %
                                                                                                           78))
                                                                                                         (QREFELT
                                                                                                          %
                                                                                                          78))
                                                                                                        (QREFELT
                                                                                                         %
                                                                                                         78))
                                                                                                       (QREFELT
                                                                                                        %
                                                                                                        78))
                                                                                                      (QREFELT
                                                                                                       %
                                                                                                       78))
                                                                                                     (QREFELT
                                                                                                      %
                                                                                                      78))
                                                                                                    (QREFELT
                                                                                                     %
                                                                                                     78))
                                                                                                   (QREFELT
                                                                                                    %
                                                                                                    78))
                                                                                                  (QREFELT
                                                                                                   %
                                                                                                   78))
                                                                                                 (QREFELT
                                                                                                  %
                                                                                                  78))
                                                                                                (QREFELT
                                                                                                 %
                                                                                                 78))
                                                                                               (QREFELT
                                                                                                %
                                                                                                78))
                                                                                              (QREFELT
                                                                                               %
                                                                                               78))
                                                                                             (QREFELT
                                                                                              %
                                                                                              78))
                                                                                            (QREFELT
                                                                                             %
                                                                                             78))
                                                                                           (QREFELT
                                                                                            %
                                                                                            78))
                                                                                          (QREFELT
                                                                                           %
                                                                                           78))
                                                                                         (QREFELT
                                                                                          %
                                                                                          78))
                                                                                        (QREFELT
                                                                                         %
                                                                                         78))
                                                                                       (QREFELT
                                                                                        %
                                                                                        78))
                                                                                      (QREFELT
                                                                                       %
                                                                                       78))
                                                                                     (QREFELT
                                                                                      %
                                                                                      78))
                                                                                    (QREFELT
                                                                                     %
                                                                                     78))
                                                                                   (QREFELT
                                                                                    %
                                                                                    78))
                                                                                  (QREFELT
                                                                                   %
                                                                                   78))
                                                                                 (QREFELT
                                                                                  %
                                                                                  78))
                                                                                (QREFELT
                                                                                 %
                                                                                 78))
                                                                               (QREFELT
                                                                                %
                                                                                78))
                                                                              (QREFELT
                                                                               %
                                                                               78))
                                                                             (QREFELT
                                                                              %
                                                                              78))
                                                                            (QREFELT
                                                                             %
                                                                             78))
                                                                           (QREFELT
                                                                            %
                                                                            78))
                                                                          (QREFELT
                                                                           %
                                                                           78))
                                                                         (QREFELT
                                                                          %
                                                                          78))
                                                                        (QREFELT
                                                                         % 78))
                                                                       (QREFELT
                                                                        % 78))
                                                                      (QREFELT
                                                                       % 78))
                                                                     (QREFELT %
                                                                              78))
                                                                    (QREFELT %
                                                                             78))
                                                                   (QREFELT %
                                                                            78))
                                                                  (QREFELT %
                                                                           78))
                                                                 (QREFELT %
                                                                          78))
                                                                (QREFELT % 78))
                                                               (QREFELT % 78))
                                                              (QREFELT % 78))
                                                             (QREFELT % 78))
                                                            (QREFELT % 78))
                                                           (QREFELT % 78))
                                                          (QREFELT % 78))
                                                         (QREFELT % 78))
                                                        (QREFELT % 78))
                                                       (QREFELT % 78))
                                                      (QREFELT % 78))
                                                     (QREFELT % 78))
                                                    (QREFELT % 78))
                                                   (QREFELT % 78))
                                                  (QREFELT % 78))
                                                 (QREFELT % 78))
                                                (QREFELT % 78))
                                               (QREFELT % 78))
                                              (QREFELT % 78))
                                             (QREFELT % 78))
                                            (QREFELT % 78))
                                           (QREFELT % 78))
                                          (QREFELT % 78))
                                         (QREFELT % 78))
                                        (QREFELT % 78))
                                       (QREFELT % 78))
                                      (QREFELT % 78))
                                     (QREFELT % 78))
                                    (QREFELT % 78))
                                   (QREFELT % 78))
                                  (QREFELT % 78))
                                 (QREFELT % 78))
                                (QREFELT % 78))
                               (QREFELT % 78))
                     %))
          (QSETREFV % 95
                    (|IndexedExponents| (|Kernel| (|Expression| (|Integer|)))))
          (QSETREFV % 96
                    (|SparseMultivariatePolynomial| (|Integer|)
                                                    (|Kernel|
                                                     (|Expression|
                                                      (|Integer|)))))
          (QSETREFV % 97
                    (|PolynomialCategoryQuotientFunctions| (QREFELT % 95)
                                                           (|Kernel|
                                                            (|Expression|
                                                             (|Integer|)))
                                                           (|Integer|)
                                                           (QREFELT % 96)
                                                           (|Expression|
                                                            (|Integer|))))
          (QSETREFV % 98
                    (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          %))) 

(DEFUN |RootSimplification| ()
  (SPROG NIL
         (PROG (#1=#:G243)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|RootSimplification|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|RootSimplification|
                             (LIST
                              (CONS NIL (CONS 1 (|RootSimplification;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|RootSimplification|)))))))))) 

(MAKEPROP '|RootSimplification| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|InputForm|) (0 . |parse|)
              (|Any|) (5 . |interpret_in_new_env|) (|Expression| 41)
              (|AnyFunctions1| 11) (10 . |retract|) (|Symbol|) (15 . |coerce|)
              '|a| '|b| '|c| (|Kernel| 11) (20 . |kernel|) '|kc| '|r|
              (|PositiveInteger|) (25 . ^) (31 . *) (37 . *) (43 . -) (49 . +)
              '|p2c| (|Fraction| 108) (|Kernel| %) (55 . |univariate|)
              (|SparseUnivariatePolynomial| 11) (|Fraction| 33) (61 . |numer|)
              '|p2cu| (66 . -) (71 . /) '|p2s| (77 . |One|) (|Integer|)
              (81 . *) '|p3c| '|p3cu| '|p3s| '|p5c| '|p5cu| '|p5s| '|p7c|
              '|p7cu| '|p7s| '|p11c| '|p11cu| '|p11s| (|Boolean|) (87 . =)
              (|Equation| 11) (93 . =) (|List| (|Equation| %)) (99 . |subst|)
              (|Mapping| 11 11) (105 . |map|) (|Factored| %) (111 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 65) (|:| |factor| 33) (|:| |exponent| 70))
              (|List| 66) (|Factored| 33) (116 . |factorList|)
              (|NonNegativeInteger|) (121 . |degree|) (126 . |Zero|)
              (130 . |coefficient|) (136 . |leadingCoefficient|) (|List| 11)
              (141 . |elt|) (147 . ^) (153 . |elt|) '|init_str| '|e| '|ke|
              '|rp2| '|rp2u| '|rp2d| '|rp2s| '|rp3e| '|rp3u| '|rp3d| '|rp3s|
              (|SparseMultivariatePolynomial| 41 31) (159 . |denom|)
              (164 . |coerce|) (169 . |numer|) (174 . |coerce|) '|iE| '|sMp|
              '|pQf| '|uPe| (|Vector| 11) (179 . |setelt!|) (186 . |elt|)
              (192 . |entries|) (197 . |degree|) (202 . |leadingCoefficient|)
              (207 . |reductum|) (212 . |sqrt|) (217 . |retract|)
              (|SparseUnivariatePolynomial| %) (222 . |minPoly|)
              (227 . |univariate|) (234 . |One|) (|Fraction| 41) (238 . /)
              (244 . ^) (250 . |monomial|) (256 . |coerce|) (261 . -)
              (|Union| 11 '"failed") |RSIMP;rsimp1;EIU;15| (|BasicOperator|)
              (|List| %) (267 . |kernel|) (|List| 31) (273 . |kernels|)
              (|List| 19) (278 . |member?|) (284 . |reductum|) (289 . |coerce|)
              (|Union| 31 '"failed") (294 . |retractIfCan|) (299 . |operator|)
              (304 . |is?|) (310 . |argument|) (315 . |retract|)
              |RSIMP;rsimp;EU;19|)
           '#(|rsimp1| 320 |rsimp| 326) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|rsimp|
                                 ((|Union| (|Expression| (|Integer|)) "failed")
                                  (|Expression| (|Integer|))))
                                T)
                              '((|rsimp1|
                                 ((|Union| (|Expression| (|Integer|)) "failed")
                                  (|Expression| (|Integer|)) (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 135
                                            '(1 7 0 6 8 1 7 9 0 10 1 12 11 9 13
                                              1 11 0 14 15 1 19 0 14 20 2 11 0
                                              0 23 24 2 11 0 0 0 25 2 11 0 23 0
                                              26 2 11 0 0 0 27 2 11 0 0 0 28 2
                                              11 30 0 31 32 1 34 33 0 35 1 11 0
                                              0 37 2 11 0 0 0 38 0 11 0 40 2 11
                                              0 41 0 42 2 11 55 0 0 56 2 57 0
                                              11 11 58 2 11 0 0 59 60 2 33 0 61
                                              0 62 1 33 63 0 64 1 68 67 0 69 1
                                              33 70 0 71 0 11 0 72 2 33 11 0 70
                                              73 1 33 11 0 74 2 75 11 0 41 76 2
                                              11 0 0 41 77 2 6 0 0 0 78 1 11 90
                                              0 91 1 11 0 90 92 1 11 90 0 93 1
                                              11 0 41 94 3 99 11 0 41 11 100 2
                                              99 11 0 41 101 1 99 75 0 102 1 98
                                              70 0 103 1 98 11 0 104 1 98 0 0
                                              105 1 11 0 0 106 1 11 31 0 107 1
                                              11 108 31 109 3 97 33 11 19 33
                                              110 0 96 0 111 2 112 0 41 41 113
                                              2 11 0 0 112 114 2 98 0 11 70 115
                                              1 98 0 11 116 2 33 0 0 0 117 2 11
                                              0 120 121 122 1 11 123 0 124 2
                                              125 55 19 0 126 1 33 0 0 127 1 11
                                              0 31 128 1 11 129 0 130 1 19 120
                                              0 131 2 120 55 0 14 132 1 19 75 0
                                              133 1 11 41 0 134 2 0 118 11 41
                                              119 1 0 118 11 135)))))
           '|lookupComplete|)) 
