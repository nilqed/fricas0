
(PUT '|ROOTUT;root_pair| '|SPADreplace| 'CONS) 

(SDEFUN |ROOTUT;root_pair|
        ((|a| (F)) (|b| (F)) (% (|Record| (|:| |real| F) (|:| |imag| F))))
        (CONS |a| |b|)) 

(SDEFUN |ROOTUT;root4| ((|a| (F)) (% (F)))
        (SPROG
         ((|p1| (|SparseUnivariatePolynomial| F))
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F))))
         (SEQ (LETT |rec| (SPADCALL |a| 4 (QREFELT % 19)))
              (LETT |p1|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 12) (QVELT |rec| 0)
                               (QREFELT % 21))
                     (SPADCALL (QVELT |rec| 2) (QREFELT % 22)) (QREFELT % 23)))
              (EXIT
               (SPADCALL (QVELT |rec| 1) (SPADCALL |p1| (QREFELT % 25))
                         (QREFELT % 26)))))) 

(SDEFUN |ROOTUT;my_sqrt;2F;3| ((|a| (F)) (% (F)))
        (SPROG
         ((|fr1| #1=(|SparseUnivariatePolynomial| F))
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fr| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |p|
                (SPADCALL (SPADCALL (|spadConstant| % 12) 2 (QREFELT % 21))
                          (SPADCALL |a| (QREFELT % 22)) (QREFELT % 23)))
          (LETT |fr| (SPADCALL |p| (QREFELT % 28)))
          (LETT |fl| (SPADCALL |fr| (QREFELT % 33)))
          (EXIT
           (COND ((EQL (LENGTH |fl|) 1) (SPADCALL |a| (QREFELT % 14)))
                 (#2='T
                  (SEQ (LETT |fr1| (QVELT (SPADCALL |fl| 1 (QREFELT % 35)) 1))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |fr1| (QREFELT % 36)) 1
                                    (QREFELT % 38))
                          (|error| "impossible"))
                         (#2#
                          (SPADCALL
                           (SPADCALL (SPADCALL |fr1| 0 (QREFELT % 40))
                                     (SPADCALL |fr1| 1 (QREFELT % 40))
                                     (QREFELT % 41))
                           (QREFELT % 13)))))))))))) 

(SDEFUN |ROOTUT;my_root3;2F;4| ((|a| (F)) (% (F)))
        (SPROG
         ((|fr1| #1=(|SparseUnivariatePolynomial| F))
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fr| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |p|
                (SPADCALL (SPADCALL (|spadConstant| % 12) 3 (QREFELT % 21))
                          (SPADCALL |a| (QREFELT % 22)) (QREFELT % 23)))
          (LETT |fr| (SPADCALL |p| (QREFELT % 28)))
          (LETT |fl| (SPADCALL |fr| (QREFELT % 33)))
          (EXIT
           (COND
            ((EQL (LENGTH |fl|) 1)
             (SPADCALL |a| (SPADCALL 1 3 (QREFELT % 46)) (QREFELT % 47)))
            (#2='T
             (SEQ (LETT |fr1| (QVELT (SPADCALL |fl| 1 (QREFELT % 35)) 1))
                  (COND
                   ((SPADCALL (SPADCALL |fr1| (QREFELT % 36)) 1 (QREFELT % 38))
                    (LETT |fr1| (QVELT (SPADCALL |fl| 2 (QREFELT % 35)) 1))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |fr1| (QREFELT % 36)) 1
                               (QREFELT % 38))
                     (|error| "impossible"))
                    (#2#
                     (SPADCALL
                      (SPADCALL (SPADCALL |fr1| 0 (QREFELT % 40))
                                (SPADCALL |fr1| 1 (QREFELT % 40))
                                (QREFELT % 41))
                      (QREFELT % 13)))))))))))) 

(SDEFUN |ROOTUT;do_rp|
        ((|r| (F)) (|q| (F))
         (|res1|
          (|Record| (|:| |reals| (|List| F))
                    (|:| |complexes|
                         (|List| (|Record| (|:| |real| F) (|:| |imag| F))))))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG ((|qr| (F)) (|su| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |su| (SPADCALL |q| (QREFELT % 51)))
                    (EXIT
                     (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                           ((< 0 (QCDR |su|))
                            (SEQ (LETT |qr| (SPADCALL |q| (QREFELT % 42)))
                                 (EXIT
                                  (CONS 0
                                        (CONS (QCAR |res1|)
                                              (CONS
                                               (|ROOTUT;root_pair| |r| |qr| %)
                                               (QCDR |res1|)))))))
                           ('T
                            (SEQ
                             (LETT |qr|
                                   (SPADCALL (SPADCALL |q| (QREFELT % 13))
                                             (QREFELT % 42)))
                             (EXIT
                              (CONS 0
                                    (CONS
                                     (CONS (SPADCALL |r| |qr| (QREFELT % 52))
                                           (CONS
                                            (SPADCALL |r| |qr| (QREFELT % 53))
                                            (QCAR |res1|)))
                                     (QCDR |res1|))))))))))) 

(SDEFUN |ROOTUT;quartic3|
        ((|r1| (F)) (|a0| (F)) (|a| (F)) (|b| (F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG
         ((|q2| (F))
          (|res1|
           (|Union|
            (|Record| (|:| |reals| (|List| F))
                      (|:| |complexes|
                           (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
            "failed"))
          (|q1| (F)) (|qq| (F)) (|rr| (F)))
         (SEQ (LETT |rr| (SPADCALL |r1| (QREFELT % 42)))
              (LETT |qq|
                    (SPADCALL |r1|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 12)
                                         (SPADCALL 2 (QREFELT % 54))
                                         (QREFELT % 41))
                               |a| (QREFELT % 26))
                              (QREFELT % 52)))
              (LETT |q1|
                    (SPADCALL |qq|
                              (SPADCALL (SPADCALL |b| |rr| (QREFELT % 26))
                                        (SPADCALL 4 |r1| (QREFELT % 56))
                                        (QREFELT % 41))
                              (QREFELT % 52)))
              (LETT |res1|
                    (|ROOTUT;do_rp| (SPADCALL |rr| |a0| (QREFELT % 52)) |q1|
                     (CONS NIL NIL) %))
              (EXIT
               (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                     ('T
                      (SEQ
                       (LETT |q2|
                             (SPADCALL |qq|
                                       (SPADCALL
                                        (SPADCALL |b| |rr| (QREFELT % 26))
                                        (SPADCALL 4 |r1| (QREFELT % 56))
                                        (QREFELT % 41))
                                       (QREFELT % 53)))
                       (EXIT
                        (|ROOTUT;do_rp|
                         (SPADCALL (SPADCALL |rr| (QREFELT % 13)) |a0|
                                   (QREFELT % 52))
                         |q2| (QCDR |res1|) %))))))))) 

(SDEFUN |ROOTUT;do_f2|
        ((|del| (F)) (|a2| (F)) (|b2| (F)) (|a0| (F)) (|a| (F)) (|b| (F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG ((|d2| (F)) (|su| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |d2| (SPADCALL |del| (QREFELT % 42)))
                    (LETT |su| (SPADCALL |d2| (QREFELT % 51)))
                    (EXIT
                     (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                           ('T
                            (SEQ
                             (COND
                              ((< (QCDR |su|) 0)
                               (LETT |d2| (SPADCALL |d2| (QREFELT % 13)))))
                             (EXIT
                              (|ROOTUT;quartic3|
                               (SPADCALL
                                (SPADCALL (SPADCALL |b2| (QREFELT % 13)) |d2|
                                          (QREFELT % 52))
                                (SPADCALL 2 |a2| (QREFELT % 56))
                                (QREFELT % 41))
                               |a0| |a| |b| %))))))))) 

(SDEFUN |ROOTUT;quartic2;SupFU;8|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a0| (F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG
         ((#1=#:G101 NIL) (|su| (|Union| (|Integer|) "failed")) (|t2| (F))
          (|t1| (F)) (|del| (F)) (|b2| (F)) (|a2| (F)) (|s1| (|Integer|))
          (|r1| (F)) (|f2| #2=(|SparseUnivariatePolynomial| F))
          (|f1| #3=(|SparseUnivariatePolynomial| F))
          (|#G29| (|SparseUnivariatePolynomial| F)) (|#G28| #2#)
          (#4=#:G100 NIL) (|cnt| (|Integer|)) (|cc| (F)) (#5=#:G104 NIL)
          (|flf| (|List| (|SparseUnivariatePolynomial| F))) (#6=#:G103 NIL)
          (|i| NIL) (#7=#:G102 NIL) (|fac| NIL)
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #3#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fr| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|r| (|SparseUnivariatePolynomial| F))
          (|xx| (|SparseUnivariatePolynomial| F)) (|c| (F)) (|b| (F))
          (|a| (F)))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (SPADCALL |p| 2 (QREFELT % 40)))
                (LETT |b| (SPADCALL |p| 1 (QREFELT % 40)))
                (LETT |c| (SPADCALL |p| 0 (QREFELT % 40)))
                (LETT |xx| (SPADCALL (|spadConstant| % 12) 1 (QREFELT % 21)))
                (LETT |r|
                      (SPADCALL
                       (SPADCALL 64 (SPADCALL |xx| 3 (QREFELT % 57))
                                 (QREFELT % 58))
                       (SPADCALL (SPADCALL 32 |a| (QREFELT % 56))
                                 (SPADCALL |xx| 2 (QREFELT % 57))
                                 (QREFELT % 59))
                       (QREFELT % 60)))
                (LETT |r|
                      (SPADCALL |r|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 16 |c| (QREFELT % 56))
                                            (QREFELT % 13))
                                  (SPADCALL 4 (SPADCALL |a| 2 (QREFELT % 61))
                                            (QREFELT % 56))
                                  (QREFELT % 52))
                                 |xx| (QREFELT % 59))
                                (QREFELT % 60)))
                (LETT |r|
                      (SPADCALL |r|
                                (SPADCALL (SPADCALL |b| 2 (QREFELT % 61))
                                          (QREFELT % 22))
                                (QREFELT % 23)))
                (LETT |fr| (SPADCALL |r| (QREFELT % 28)))
                (LETT |fl| (SPADCALL |fr| (QREFELT % 33))) (LETT |flf| NIL)
                (SEQ (LETT |fac| NIL) (LETT #7# |fl|) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |fac| (CAR #7#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |f1| (QVELT |fac| 1))
                          (EXIT
                           (SEQ (LETT |i| 1) (LETT #6# (QVELT |fac| 2)) G190
                                (COND ((|greater_SI| |i| #6#) (GO G191)))
                                (SEQ (EXIT (LETT |flf| (CONS |f1| |flf|))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))))
                     (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((EQL (LENGTH |flf|) 1) (CONS 1 "failed"))
                       ((EQL (LENGTH |flf|) 3)
                        (SEQ (LETT |cnt| 0)
                             (SEQ (LETT #5# |flf|) G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN (LETT |f1| (CAR #5#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |cc|
                                           (SPADCALL
                                            (SPADCALL |f1| 0 (QREFELT % 40))
                                            (SPADCALL |f1| 1 (QREFELT % 40))
                                            (QREFELT % 41)))
                                     (LETT |su| (SPADCALL |cc| (QREFELT % 51)))
                                     (EXIT
                                      (COND
                                       ((QEQCAR |su| 1)
                                        (PROGN
                                         (LETT #1# (CONS 1 "failed"))
                                         (GO #8=#:G99)))
                                       ((< (QCDR |su|) 0)
                                        (SEQ (LETT |cnt| (+ |cnt| 1))
                                             (EXIT
                                              (COND
                                               ((> |cnt| 1)
                                                (PROGN
                                                 (LETT #4# |$NoValue|)
                                                 (GO #9=#:G72)))
                                               ('T (LETT |r1| |cc|))))))))))
                                   #9# (EXIT #4#))
                                  (LETT #5# (CDR #5#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (COND ((EQL |cnt| 0) (|error| "impossible"))
                                    (#10='T
                                     (|ROOTUT;quartic3|
                                      (SPADCALL |r1| (QREFELT % 13)) |a0| |a|
                                      |b| %))))))
                       ((EQL (LENGTH |flf|) 2)
                        (SEQ (LETT |f1| (|SPADfirst| |flf|))
                             (LETT |f2| (SPADCALL |flf| (QREFELT % 63)))
                             (COND
                              ((EQL (SPADCALL |f2| (QREFELT % 36)) 1)
                               (PROGN
                                (LETT |#G28| |f2|)
                                (LETT |#G29| |f1|)
                                (LETT |f1| |#G28|)
                                (LETT |f2| |#G29|))))
                             (LETT |r1|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |f1| 0 (QREFELT % 40))
                                              (SPADCALL |f1| 1 (QREFELT % 40))
                                              (QREFELT % 41))
                                    (QREFELT % 13)))
                             (LETT |su| (SPADCALL |r1| (QREFELT % 51)))
                             (EXIT
                              (COND
                               ((QEQCAR |su| 1)
                                (PROGN (LETT #1# (CONS 1 "failed")) (GO #8#)))
                               (#10#
                                (SEQ (LETT |s1| (QCDR |su|))
                                     (LETT |a2|
                                           (SPADCALL |f2| 2 (QREFELT % 40)))
                                     (LETT |b2|
                                           (SPADCALL |f2| 1 (QREFELT % 40)))
                                     (LETT |del|
                                           (SPADCALL
                                            (SPADCALL |b2| 2 (QREFELT % 61))
                                            (SPADCALL
                                             (SPADCALL 4 |a2| (QREFELT % 56))
                                             (SPADCALL |f2| 0 (QREFELT % 40))
                                             (QREFELT % 26))
                                            (QREFELT % 53)))
                                     (SEQ
                                      (LETT |su|
                                            (SPADCALL |del| (QREFELT % 51)))
                                      (EXIT
                                       (COND
                                        ((NULL (QEQCAR |su| 1))
                                         (SEQ
                                          (COND
                                           ((< (QCDR |su|) 0)
                                            (PROGN
                                             (LETT #1#
                                                   (COND
                                                    ((< 0 |s1|)
                                                     (|ROOTUT;quartic3| |r1|
                                                      |a0| |a| |b| %))
                                                    (#10#
                                                     (|error| "impossible"))))
                                             (GO #8#))))
                                          (EXIT
                                           (COND
                                            ((< 0 |s1|)
                                             (SEQ
                                              (LETT |t1|
                                                    (SPADCALL |r1|
                                                              (SPADCALL |b2|
                                                                        (SPADCALL
                                                                         2 |a2|
                                                                         (QREFELT
                                                                          %
                                                                          56))
                                                                        (QREFELT
                                                                         % 41))
                                                              (QREFELT % 52)))
                                              (LETT |t2|
                                                    (SPADCALL
                                                     (SPADCALL |del|
                                                               (SPADCALL
                                                                (SPADCALL 4
                                                                          |a2|
                                                                          (QREFELT
                                                                           %
                                                                           56))
                                                                |a2|
                                                                (QREFELT % 26))
                                                               (QREFELT % 41))
                                                     (SPADCALL |t1| |t1|
                                                               (QREFELT % 26))
                                                     (QREFELT % 53)))
                                              (LETT |su|
                                                    (SPADCALL |t2|
                                                              (QREFELT % 51)))
                                              (EXIT
                                               (COND
                                                ((NULL (QEQCAR |su| 1))
                                                 (COND
                                                  ((< 0 (QCDR |su|))
                                                   (PROGN
                                                    (LETT #1#
                                                          (|ROOTUT;do_f2| |del|
                                                           |a2| |b2| |a0| |a|
                                                           |b| %))
                                                    (GO #8#)))
                                                  (#10#
                                                   (PROGN
                                                    (LETT #1#
                                                          (|ROOTUT;quartic3|
                                                           |r1| |a0| |a| |b|
                                                           %))
                                                    (GO #8#)))))))))
                                            (#10#
                                             (PROGN
                                              (LETT #1#
                                                    (|ROOTUT;do_f2| |del| |a2|
                                                     |b2| |a0| |a| |b| %))
                                              (GO #8#))))))))))
                                     (LETT |su| (SPADCALL |b2| (QREFELT % 51)))
                                     (COND
                                      ((OR (QEQCAR |su| 1)
                                           (NULL (< 0 (QCDR |su|))))
                                       (EXIT
                                        (PROGN
                                         (LETT #1# (CONS 1 "failed"))
                                         (GO #8#)))))
                                     (LETT |su|
                                           (SPADCALL
                                            (SPADCALL |a2|
                                                      (SPADCALL |f2| 0
                                                                (QREFELT % 40))
                                                      (QREFELT % 26))
                                            (QREFELT % 51)))
                                     (COND
                                      ((OR (QEQCAR |su| 1)
                                           (NULL (< 0 (QCDR |su|))))
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed"))
                                        (GO #8#))))
                                     (EXIT
                                      (|ROOTUT;quartic3| |r1| |a0| |a| |b|
                                       %))))))))
                       (#10# (|error| "impossible"))))))
          #8# (EXIT #1#)))) 

(PUT '|ROOTUT;quartic2;SupFU;9| '|SPADreplace|
     '(XLAM (|p| |a0|) (CONS 1 "failed"))) 

(SDEFUN |ROOTUT;quartic2;SupFU;9|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a0| (F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (CONS 1 "failed")) 

(SDEFUN |ROOTUT;my_sqrt;2F;10| ((|a| (F)) (% (F)))
        (SPROG
         ((|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F))))
         (SEQ (LETT |rec| (SPADCALL |a| 2 (QREFELT % 19)))
              (EXIT
               (COND ((EQL (QVELT |rec| 0) 2) (SPADCALL |a| (QREFELT % 14)))
                     ('T
                      (SPADCALL (QVELT |rec| 1) (QVELT |rec| 2)
                                (QREFELT % 26)))))))) 

(SDEFUN |ROOTUT;my_root3;2F;11| ((|a| (F)) (% (F)))
        (SPROG
         ((|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F))))
         (SEQ (LETT |rec| (SPADCALL |a| 3 (QREFELT % 19)))
              (EXIT
               (COND
                ((EQL (QVELT |rec| 0) 3)
                 (SPADCALL |a| (SPADCALL 1 3 (QREFELT % 46)) (QREFELT % 47)))
                ('T
                 (SPADCALL (QVELT |rec| 1) (QVELT |rec| 2) (QREFELT % 26)))))))) 

(SDEFUN |ROOTUT;qubic|
        ((|p| (|SparseUnivariatePolynomial| F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG
         ((|su| (|Union| (|Integer|) "failed")) (|r1| (F)) (|a| (F))
          (|rp| (|SparseUnivariatePolynomial| F)) (|a0| (F)))
         (SEQ
          (LETT |p|
                (SPADCALL
                 (SPADCALL (|spadConstant| % 12) (SPADCALL |p| (QREFELT % 68))
                           (QREFELT % 41))
                 |p| (QREFELT % 59)))
          (LETT |a0|
                (SPADCALL
                 (SPADCALL (SPADCALL |p| 2 (QREFELT % 40))
                           (SPADCALL 3 (QREFELT % 54)) (QREFELT % 41))
                 (QREFELT % 13)))
          (LETT |p|
                (SPADCALL |p| (QREFELT % 10)
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 12) 1 (QREFELT % 21))
                           (SPADCALL |a0| (QREFELT % 22)) (QREFELT % 60))
                          (QREFELT % 72)))
          (EXIT
           (COND
            ((SPADCALL (LETT |rp| (SPADCALL |p| (QREFELT % 73)))
                       (QREFELT % 74))
             (SEQ (LETT |a| (SPADCALL |rp| (QREFELT % 75)))
                  (EXIT
                   (COND
                    ((SPADCALL |a| (|spadConstant| % 76) (QREFELT % 77))
                     (CONS 0 (CONS (LIST |a0| |a0| |a0|) NIL)))
                    (#1='T
                     (SEQ (LETT |su| (SPADCALL |a| (QREFELT % 51)))
                          (EXIT
                           (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                                 ((< (QCDR |su|) 0)
                                  (SEQ
                                   (LETT |r1|
                                         (SPADCALL
                                          (SPADCALL |a| (QREFELT % 13))
                                          (QREFELT % 48)))
                                   (LETT |su| (SPADCALL |r1| (QREFELT % 51)))
                                   (EXIT
                                    (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                                          (#1#
                                           (CONS 0
                                                 (CONS
                                                  (LIST
                                                   (SPADCALL |r1| |a0|
                                                             (QREFELT % 52)))
                                                  (LIST
                                                   (|ROOTUT;root_pair|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |r1|
                                                                (SPADCALL 2
                                                                          (QREFELT
                                                                           %
                                                                           54))
                                                                (QREFELT % 41))
                                                      (QREFELT % 13))
                                                     |a0| (QREFELT % 52))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL 3
                                                                 (QREFELT %
                                                                          54))
                                                       (QREFELT % 14))
                                                      |r1| (QREFELT % 26))
                                                     (SPADCALL 2
                                                               (QREFELT % 54))
                                                     (QREFELT % 41))
                                                    %)))))))))
                                 (#1#
                                  (SEQ
                                   (LETT |r1| (SPADCALL |a| (QREFELT % 48)))
                                   (LETT |su| (SPADCALL |r1| (QREFELT % 51)))
                                   (EXIT
                                    (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                                          (#1#
                                           (CONS 0
                                                 (CONS
                                                  (LIST
                                                   (SPADCALL
                                                    (SPADCALL |r1|
                                                              (QREFELT % 13))
                                                    |a0| (QREFELT % 52)))
                                                  (LIST
                                                   (|ROOTUT;root_pair|
                                                    (SPADCALL
                                                     (SPADCALL |r1|
                                                               (SPADCALL 2
                                                                         (QREFELT
                                                                          %
                                                                          54))
                                                               (QREFELT % 41))
                                                     |a0| (QREFELT % 52))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL 3
                                                                 (QREFELT %
                                                                          54))
                                                       (QREFELT % 14))
                                                      |r1| (QREFELT % 26))
                                                     (SPADCALL 2
                                                               (QREFELT % 54))
                                                     (QREFELT % 41))
                                                    %)))))))))))))))))
            (#1# (CONS 1 "failed"))))))) 

(SDEFUN |ROOTUT;quartic0|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a0| (F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG
         ((|cl| (|List| (|Record| (|:| |real| F) (|:| |imag| F))))
          (|cp| (|Record| (|:| |real| F) (|:| |imag| F))) (|rl| (|List| F))
          (#1=#:G141 NIL) (|r| NIL)
          (|r1|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F))))))
          (|ru|
           (|Union|
            (|Record| (|:| |reals| (|List| F))
                      (|:| |complexes|
                           (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
            "failed"))
          (|pu| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
         (SEQ
          (LETT |pu|
                (SPADCALL |p| (SPADCALL (|spadConstant| % 12) 1 (QREFELT % 21))
                          (QREFELT % 79)))
          (EXIT
           (COND ((QEQCAR |pu| 1) (|error| "impossible"))
                 (#2='T
                  (SEQ (LETT |p| (QCDR |pu|))
                       (LETT |ru| (|ROOTUT;qubic| |p| %))
                       (EXIT
                        (COND ((QEQCAR |ru| 1) (CONS 1 "failed"))
                              (#2#
                               (SEQ (LETT |r1| (QCDR |ru|))
                                    (LETT |rl| (LIST |a0|))
                                    (SEQ (LETT |r| NIL) (LETT #1# (QCAR |r1|))
                                         G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |r| (CAR #1#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |rl|
                                                 (CONS
                                                  (SPADCALL |r| |a0|
                                                            (QREFELT % 52))
                                                  |rl|))))
                                         (LETT #1# (CDR #1#)) (GO G190) G191
                                         (EXIT NIL))
                                    (LETT |cl|
                                          (COND ((NULL (QCDR |r1|)) NIL)
                                                (#2#
                                                 (SEQ
                                                  (LETT |cp|
                                                        (|SPADfirst|
                                                         (QCDR |r1|)))
                                                  (EXIT
                                                   (LIST
                                                    (|ROOTUT;root_pair|
                                                     (SPADCALL (QCAR |cp|) |a0|
                                                               (QREFELT % 52))
                                                     (QCDR |cp|) %)))))))
                                    (EXIT (CONS 0 (CONS |rl| |cl|)))))))))))))) 

(SDEFUN |ROOTUT;quartic|
        ((|p| (|SparseUnivariatePolynomial| F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG
         ((#1=#:G164 NIL) (|r3| (F)) (|r2| (F))
          (|su| (|Union| (|Integer|) "failed")) (|x2| (F)) (|x1| (F))
          (|r1| (F)) (|si| (|Integer|)) (|del| (F)) (|c| (F)) (|b| (F))
          (|a| (F)) (|rp| (|SparseUnivariatePolynomial| F)) (|a0| (F))
          (|lc| (F)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |p| 0 (QREFELT % 40)) (|spadConstant| % 76)
                      (QREFELT % 77))
            (|ROOTUT;quartic0| |p| (|spadConstant| % 76) %))
           (#2='T
            (SEQ (LETT |lc| (SPADCALL |p| (QREFELT % 68)))
                 (LETT |p|
                       (SPADCALL
                        (SPADCALL (|spadConstant| % 12) |lc| (QREFELT % 41))
                        |p| (QREFELT % 59)))
                 (LETT |a0|
                       (SPADCALL
                        (SPADCALL (SPADCALL |p| 3 (QREFELT % 40))
                                  (SPADCALL 4 (QREFELT % 54)) (QREFELT % 41))
                        (QREFELT % 13)))
                 (LETT |p|
                       (SPADCALL |p| (QREFELT % 10)
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 12) 1
                                            (QREFELT % 21))
                                  (SPADCALL |a0| (QREFELT % 22))
                                  (QREFELT % 60))
                                 (QREFELT % 72)))
                 (EXIT
                  (COND
                   ((SPADCALL (LETT |rp| (SPADCALL |p| (QREFELT % 73)))
                              (QREFELT % 74))
                    (SEQ (LETT |a| (SPADCALL |rp| (QREFELT % 75)))
                         (EXIT
                          (COND
                           ((SPADCALL |a| (|spadConstant| % 76) (QREFELT % 77))
                            (CONS 0 (CONS (LIST |a0| |a0| |a0| |a0|) NIL)))
                           (#2#
                            (SEQ (LETT |su| (SPADCALL |a| (QREFELT % 51)))
                                 (EXIT
                                  (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                                        (#2#
                                         (SEQ (LETT |si| (QCDR |su|))
                                              (EXIT
                                               (COND
                                                ((EQL |si| 1)
                                                 (SEQ
                                                  (LETT |r1|
                                                        (|ROOTUT;root4|
                                                         (SPADCALL |a|
                                                                   (SPADCALL
                                                                    (SPADCALL 4
                                                                              (QREFELT
                                                                               %
                                                                               54))
                                                                    (SPADCALL
                                                                     |p|
                                                                     (QREFELT %
                                                                              68))
                                                                    (QREFELT %
                                                                             26))
                                                                   (QREFELT %
                                                                            41))
                                                         %))
                                                  (EXIT
                                                   (CONS 0
                                                         (CONS NIL
                                                               (LIST
                                                                (|ROOTUT;root_pair|
                                                                 (SPADCALL |r1|
                                                                           |a0|
                                                                           (QREFELT
                                                                            %
                                                                            52))
                                                                 |r1| %)
                                                                (|ROOTUT;root_pair|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |r1|
                                                                   (QREFELT %
                                                                            13))
                                                                  |a0|
                                                                  (QREFELT %
                                                                           52))
                                                                 |r1| %)))))))
                                                ((EQL |si| -1)
                                                 (SEQ
                                                  (LETT |r1|
                                                        (SPADCALL
                                                         (SPADCALL |p|
                                                                   (QREFELT %
                                                                            25))
                                                         (QREFELT % 81)))
                                                  (EXIT
                                                   (CONS 0
                                                         (CONS
                                                          (LIST
                                                           (SPADCALL |r1| |a0|
                                                                     (QREFELT %
                                                                              52))
                                                           (SPADCALL
                                                            (SPADCALL |r1|
                                                                      (QREFELT
                                                                       % 13))
                                                            |a0|
                                                            (QREFELT % 52)))
                                                          (LIST
                                                           (|ROOTUT;root_pair|
                                                            |a0| |r1| %)))))))
                                                (#2#
                                                 (|error|
                                                  "impossible"))))))))))))))
                   ((SPADCALL (SPADCALL |p| 0 (QREFELT % 40))
                              (|spadConstant| % 76) (QREFELT % 77))
                    (|ROOTUT;quartic0| |p| |a0| %))
                   ((SPADCALL (SPADCALL |p| 1 (QREFELT % 40))
                              (|spadConstant| % 76) (QREFELT % 77))
                    (SEQ (LETT |b| (SPADCALL |p| 2 (QREFELT % 40)))
                         (LETT |c| (SPADCALL |p| 0 (QREFELT % 40)))
                         (LETT |del|
                               (SPADCALL (SPADCALL |b| |b| (QREFELT % 26))
                                         (SPADCALL 4 |c| (QREFELT % 56))
                                         (QREFELT % 53)))
                         (LETT |su| (SPADCALL |del| (QREFELT % 51)))
                         (EXIT
                          (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                                (#2#
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (SEQ (LETT |si| (QCDR |su|))
                                         (EXIT
                                          (COND
                                           ((NULL (< |si| 0))
                                            (PROGN
                                             (LETT #1#
                                                   (SEQ
                                                    (LETT |r1|
                                                          (SPADCALL |del|
                                                                    (QREFELT %
                                                                             42)))
                                                    (LETT |x1|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |b|
                                                                      (QREFELT
                                                                       % 13))
                                                            |r1|
                                                            (QREFELT % 52))
                                                           (SPADCALL 2
                                                                     (QREFELT %
                                                                              54))
                                                           (QREFELT % 41)))
                                                    (LETT |x2|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |b|
                                                                      (QREFELT
                                                                       % 13))
                                                            |r1|
                                                            (QREFELT % 53))
                                                           (SPADCALL 2
                                                                     (QREFELT %
                                                                              54))
                                                           (QREFELT % 41)))
                                                    (LETT |su|
                                                          (SPADCALL |x1|
                                                                    (QREFELT %
                                                                             51)))
                                                    (EXIT
                                                     (COND
                                                      ((QEQCAR |su| 1)
                                                       (CONS 1 "failed"))
                                                      ((< (QCDR |su|) 0)
                                                       (CONS 0
                                                             (CONS NIL
                                                                   (LIST
                                                                    (|ROOTUT;root_pair|
                                                                     |a0|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |x1|
                                                                       (QREFELT
                                                                        % 13))
                                                                      (QREFELT
                                                                       % 42))
                                                                     %)
                                                                    (|ROOTUT;root_pair|
                                                                     |a0|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |x2|
                                                                       (QREFELT
                                                                        % 13))
                                                                      (QREFELT
                                                                       % 42))
                                                                     %)))))
                                                      (#2#
                                                       (SEQ
                                                        (LETT |su|
                                                              (SPADCALL |x2|
                                                                        (QREFELT
                                                                         %
                                                                         51)))
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |su| 1)
                                                           (CONS 1 "failed"))
                                                          (#2#
                                                           (SEQ
                                                            (LETT |r2|
                                                                  (SPADCALL
                                                                   |x1|
                                                                   (QREFELT %
                                                                            42)))
                                                            (EXIT
                                                             (COND
                                                              ((< (QCDR |su|)
                                                                  0)
                                                               (CONS 0
                                                                     (CONS
                                                                      (LIST
                                                                       (SPADCALL
                                                                        |r2|
                                                                        |a0|
                                                                        (QREFELT
                                                                         % 52))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |r2|
                                                                         (QREFELT
                                                                          %
                                                                          13))
                                                                        |a0|
                                                                        (QREFELT
                                                                         %
                                                                         52)))
                                                                      (LIST
                                                                       (|ROOTUT;root_pair|
                                                                        |a0|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          |x2|
                                                                          (QREFELT
                                                                           %
                                                                           13))
                                                                         (QREFELT
                                                                          %
                                                                          42))
                                                                        %)))))
                                                              (#2#
                                                               (SEQ
                                                                (LETT |r3|
                                                                      (SPADCALL
                                                                       |x2|
                                                                       (QREFELT
                                                                        % 42)))
                                                                (EXIT
                                                                 (CONS 0
                                                                       (CONS
                                                                        (LIST
                                                                         (SPADCALL
                                                                          |r2|
                                                                          |a0|
                                                                          (QREFELT
                                                                           %
                                                                           52))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |r2|
                                                                           (QREFELT
                                                                            %
                                                                            13))
                                                                          |a0|
                                                                          (QREFELT
                                                                           %
                                                                           52))
                                                                         (SPADCALL
                                                                          |r3|
                                                                          |a0|
                                                                          (QREFELT
                                                                           %
                                                                           52))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |r3|
                                                                           (QREFELT
                                                                            %
                                                                            13))
                                                                          |a0|
                                                                          (QREFELT
                                                                           %
                                                                           52)))
                                                                        NIL)))))))))))))))))
                                             (GO #3=#:G157))))))
                                    (EXIT (SPADCALL |p| |a0| (QREFELT % 67)))))
                                  #3# (EXIT #1#)))))))
                   (#2# (SPADCALL |p| |a0| (QREFELT % 67))))))))))) 

(SDEFUN |ROOTUT;complex_roots;SupU;15|
        ((|p| (|SparseUnivariatePolynomial| F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (SEQ (LETT |d| (SPADCALL |p| (QREFELT % 36)))
                    (EXIT
                     (COND ((EQL |d| 3) (|ROOTUT;qubic| |p| %))
                           ((EQL |d| 4) (|ROOTUT;quartic| |p| %))
                           ('T (CONS 1 "failed"))))))) 

(SDEFUN |ROOTUT;radical_solve;SupU;16|
        ((|p| (|SparseUnivariatePolynomial| F))
         (% (|Union| (|List| F) "failed")))
        (SPROG
         ((|res| (|List| F)) (#1=#:G179 NIL) (|c1| NIL)
          (|r1|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F))))))
          (|r1u|
           (|Union|
            (|Record| (|:| |reals| (|List| F))
                      (|:| |complexes|
                           (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
            "failed")))
         (SEQ (LETT |r1u| (SPADCALL |p| (QREFELT % 82)))
              (EXIT
               (COND ((QEQCAR |r1u| 1) (CONS 1 "failed"))
                     ('T
                      (SEQ (LETT |r1| (QCDR |r1u|))
                           (LETT |res| (NREVERSE (QCAR |r1|)))
                           (SEQ (LETT |c1| NIL) (LETT #1# (QCDR |r1|)) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |c1| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |res|
                                       (CONS
                                        (SPADCALL (QCAR |c1|)
                                                  (SPADCALL (QREFELT % 15)
                                                            (QCDR |c1|)
                                                            (QREFELT % 26))
                                                  (QREFELT % 52))
                                        |res|))
                                 (EXIT
                                  (LETT |res|
                                        (CONS
                                         (SPADCALL (QCAR |c1|)
                                                   (SPADCALL (QREFELT % 15)
                                                             (QCDR |c1|)
                                                             (QREFELT % 26))
                                                   (QREFELT % 53))
                                         |res|))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS 0 (NREVERSE |res|)))))))))) 

(DECLAIM (NOTINLINE |RootUtilities;|)) 

(DEFUN |RootUtilities;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|RootUtilities| DV$1 DV$2))
          (LETT % (GETREFV 85))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RootUtilities| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 10 (SPADCALL (QREFELT % 9)))
          (QSETREFV % 15
                    (SPADCALL (SPADCALL (|spadConstant| % 12) (QREFELT % 13))
                              (QREFELT % 14)))
          (COND
           ((|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
            (PROGN
             (QSETREFV % 42
                       (CONS (|dispatchFunction| |ROOTUT;my_sqrt;2F;3|) %))
             (QSETREFV % 48
                       (CONS (|dispatchFunction| |ROOTUT;my_root3;2F;4|) %))
             (QSETREFV % 67
                       (CONS (|dispatchFunction| |ROOTUT;quartic2;SupFU;8|)
                             %))))
           ('T
            (PROGN
             (QSETREFV % 67
                       (CONS (|dispatchFunction| |ROOTUT;quartic2;SupFU;9|) %))
             (QSETREFV % 42
                       (CONS (|dispatchFunction| |ROOTUT;my_sqrt;2F;10|) %))
             (QSETREFV % 48
                       (CONS (|dispatchFunction| |ROOTUT;my_root3;2F;11|)
                             %)))))
          %))) 

(DEFUN |RootUtilities| (&REST #1=#:G180)
  (SPROG NIL
         (PROG (#2=#:G181)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RootUtilities|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RootUtilities;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|RootUtilities|)))))))))) 

(MAKEPROP '|RootUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SingletonAsOrderedSet|) (0 . |create|) '|dummy| (4 . |One|)
              (8 . |One|) (12 . -) (17 . |sqrt|) '|my_imag|
              (|Record| (|:| |exponent| 17) (|:| |coef| 7) (|:| |radicand| 7))
              (|NonNegativeInteger|)
              (|PolynomialRoots| (|IndexedExponents| (|Kernel| 7)) (|Kernel| 7)
                                 6 43 7)
              (22 . |froot|) (|SparseUnivariatePolynomial| 7) (28 . |monomial|)
              (34 . |coerce|) (39 . -) (|SparseUnivariatePolynomial| %)
              (45 . |zeroOf|) (50 . *) (|Factored| %) (56 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 29) (|:| |factor| 20) (|:| |exponent| 17))
              (|List| 30) (|Factored| 20) (61 . |factorList|) (|Integer|)
              (66 . |elt|) (72 . |degree|) (|Boolean|) (77 . ~=) (83 . |Zero|)
              (87 . |coefficient|) (93 . /) (99 . |my_sqrt|)
              (|SparseMultivariatePolynomial| 6 (|Kernel| 7)) (104 . |One|)
              (|Fraction| 34) (108 . /) (114 . ^) (120 . |my_root3|)
              (|Union| 34 '"failed") (|ElementaryFunctionSign| 6 7)
              (125 . |sign|) (130 . +) (136 . -) (142 . |coerce|)
              (|PositiveInteger|) (147 . *) (153 . ^) (159 . *) (165 . *)
              (171 . +) (177 . ^) (|List| 20) (183 . |second|)
              (|Record| (|:| |real| 7) (|:| |imag| 7))
              (|Record| (|:| |reals| (|List| 7)) (|:| |complexes| (|List| 64)))
              (|Union| 65 '"failed") (188 . |quartic2|)
              (194 . |leadingCoefficient|) (199 . |One|) (203 . /)
              (209 . |One|) (213 . |eval|) (220 . |reductum|) (225 . |ground?|)
              (230 . |ground|) (235 . |Zero|) (239 . =) (|Union| % '"failed")
              (245 . |exquo|) (|AlgebraicManipulations| 6 7) (251 . |rootSimp|)
              |ROOTUT;complex_roots;SupU;15| (|Union| (|List| 7) '"failed")
              |ROOTUT;radical_solve;SupU;16|)
           '#(|radical_solve| 256 |quartic2| 261 |my_sqrt| 267 |my_root3| 272
              |complex_roots| 277)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|complex_roots|
                                 ((|Union|
                                   (|Record| (|:| |reals| (|List| |#2|))
                                             (|:| |complexes|
                                                  (|List|
                                                   (|Record| (|:| |real| |#2|)
                                                             (|:| |imag|
                                                                  |#2|)))))
                                   "failed")
                                  (|SparseUnivariatePolynomial| |#2|)))
                                T)
                              '((|radical_solve|
                                 ((|Union| (|List| |#2|) "failed")
                                  (|SparseUnivariatePolynomial| |#2|)))
                                T)
                              '((|quartic2|
                                 ((|Union|
                                   (|Record| (|:| |reals| (|List| |#2|))
                                             (|:| |complexes|
                                                  (|List|
                                                   (|Record| (|:| |real| |#2|)
                                                             (|:| |imag|
                                                                  |#2|)))))
                                   "failed")
                                  (|SparseUnivariatePolynomial| |#2|) |#2|))
                                T)
                              '((|my_sqrt| (|#2| |#2|)) T)
                              '((|my_root3| (|#2| |#2|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 84
                                            '(0 8 0 9 0 6 0 11 0 7 0 12 1 7 0 0
                                              13 1 7 0 0 14 2 18 16 7 17 19 2
                                              20 0 7 17 21 1 20 0 7 22 2 20 0 0
                                              0 23 1 7 0 24 25 2 7 0 0 0 26 1
                                              20 27 0 28 1 32 31 0 33 2 31 30 0
                                              34 35 1 20 17 0 36 2 17 37 0 0 38
                                              0 6 0 39 2 20 7 0 17 40 2 7 0 0 0
                                              41 1 0 7 7 42 0 43 0 44 2 45 0 34
                                              34 46 2 7 0 0 45 47 1 0 7 7 48 1
                                              50 49 7 51 2 7 0 0 0 52 2 7 0 0 0
                                              53 1 7 0 34 54 2 7 0 55 0 56 2 20
                                              0 0 55 57 2 20 0 55 0 58 2 20 0 7
                                              0 59 2 20 0 0 0 60 2 7 0 0 55 61
                                              1 62 20 0 63 2 0 66 20 7 67 1 20
                                              7 0 68 0 20 0 69 2 20 0 0 7 70 0
                                              45 0 71 3 20 0 0 8 0 72 1 20 0 0
                                              73 1 20 37 0 74 1 20 7 0 75 0 7 0
                                              76 2 7 37 0 0 77 2 20 78 0 0 79 1
                                              80 7 7 81 1 0 83 20 84 2 0 66 20
                                              7 67 1 0 7 7 42 1 0 7 7 48 1 0 66
                                              20 82)))))
           '|lookupComplete|)) 
