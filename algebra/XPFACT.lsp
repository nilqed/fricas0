
(SDEFUN |XPFACT;my_degree|
        ((|p| (|XDistributedPolynomial| |vl| F)) (% (|Integer|)))
        (COND ((SPADCALL |p| (|spadConstant| % 10) (QREFELT % 12)) -1)
              ('T (SPADCALL |p| (QREFELT % 15))))) 

(SDEFUN |XPFACT;top_split;XdpL;2|
        ((|p| (|XDistributedPolynomial| |vl| F))
         (% (|List| (|XDistributedPolynomial| |vl| F))))
        (SPROG
         ((|p2| #1=(|XDistributedPolynomial| |vl| F)) (|p1| #1#)
          (|lt2|
           (|List| #2=(|Record| (|:| |k| (|FreeMonoid| |vl|)) (|:| |c| F))))
          (#3=#:G43 NIL) (|r| NIL) (#4=#:G42 NIL) (|lt1| (|List| #2#))
          (#5=#:G41 NIL) (#6=#:G40 NIL) (|lt| (|List| #2#))
          (|d| (|NonNegativeInteger|)))
         (SEQ (LETT |d| (SPADCALL |p| (QREFELT % 15)))
              (EXIT
               (COND ((EQL |d| 0) (LIST |p| (|spadConstant| % 10)))
                     ('T
                      (SEQ (LETT |lt| (SPADCALL |p| (QREFELT % 18)))
                           (LETT |lt1|
                                 (PROGN
                                  (LETT #6# NIL)
                                  (SEQ (LETT |r| NIL) (LETT #5# |lt|) G190
                                       (COND
                                        ((OR (ATOM #5#)
                                             (PROGN (LETT |r| (CAR #5#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((EQL
                                            (SPADCALL (QCAR |r|)
                                                      (QREFELT % 20))
                                            |d|)
                                           (LETT #6# (CONS |r| #6#))))))
                                       (LETT #5# (CDR #5#)) (GO G190) G191
                                       (EXIT (NREVERSE #6#)))))
                           (LETT |lt2|
                                 (PROGN
                                  (LETT #4# NIL)
                                  (SEQ (LETT |r| NIL) (LETT #3# |lt|) G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN (LETT |r| (CAR #3#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((<
                                            (SPADCALL (QCAR |r|)
                                                      (QREFELT % 20))
                                            |d|)
                                           (LETT #4# (CONS |r| #4#))))))
                                       (LETT #3# (CDR #3#)) (GO G190) G191
                                       (EXIT (NREVERSE #4#)))))
                           (LETT |p1| (SPADCALL |lt1| (QREFELT % 21)))
                           (LETT |p2| (SPADCALL |lt2| (QREFELT % 21)))
                           (EXIT (LIST |p1| |p2|))))))))) 

(SDEFUN |XPFACT;ldivide;2XdpR;3|
        ((|x| (|XDistributedPolynomial| |vl| F))
         (|y| (|XDistributedPolynomial| |vl| F))
         (%
          (|Record| (|:| |quotient| (|XDistributedPolynomial| |vl| F))
                    (|:| |remainder| (|XDistributedPolynomial| |vl| F)))))
        (SPROG
         ((|dx| #1=(|Integer|)) (#2=#:G52 NIL) (|ndx| #1#)
          (|qq| (|XDistributedPolynomial| |vl| F))
          (|q1| (|XDistributedPolynomial| |vl| F))
          (|tx| (|List| (|XDistributedPolynomial| |vl| F)))
          (|dy| (|NonNegativeInteger|)) (|ilc| (F)) (|w| (|FreeMonoid| |vl|)))
         (SEQ
          (EXIT
           (SEQ (LETT |w| (SPADCALL |y| (QREFELT % 24)))
                (LETT |ilc|
                      (SPADCALL (|spadConstant| % 13)
                                (SPADCALL |y| (QREFELT % 25)) (QREFELT % 26)))
                (LETT |dy| (SPADCALL |y| (QREFELT % 15)))
                (LETT |dx| (|XPFACT;my_degree| |x| %))
                (EXIT
                 (COND ((< |dx| |dy|) (CONS (|spadConstant| % 10) |x|))
                       ('T
                        (SEQ (LETT |qq| (|spadConstant| % 10))
                             (EXIT
                              (SEQ G190 NIL
                                   (SEQ
                                    (LETT |tx| (SPADCALL |x| (QREFELT % 23)))
                                    (LETT |q1|
                                          (SPADCALL |ilc|
                                                    (SPADCALL
                                                     (|SPADfirst| |tx|) |w|
                                                     (QREFELT % 27))
                                                    (QREFELT % 28)))
                                    (LETT |x|
                                          (SPADCALL |x|
                                                    (SPADCALL |y| |q1|
                                                              (QREFELT % 29))
                                                    (QREFELT % 30)))
                                    (LETT |qq|
                                          (SPADCALL |qq| |q1| (QREFELT % 31)))
                                    (LETT |ndx| (|XPFACT;my_degree| |x| %))
                                    (COND
                                     ((OR (EQL |ndx| |dx|) (< |ndx| |dy|))
                                      (EXIT
                                       (PROGN
                                        (LETT #2# (CONS |qq| |x|))
                                        (GO #3=#:G51)))))
                                    (EXIT (LETT |dx| |ndx|)))
                                   NIL (GO G190) G191 (EXIT NIL)))))))))
          #3# (EXIT #2#)))) 

(SDEFUN |XPFACT;rdivide;2XdpR;4|
        ((|x| (|XDistributedPolynomial| |vl| F))
         (|y| (|XDistributedPolynomial| |vl| F))
         (%
          (|Record| (|:| |quotient| (|XDistributedPolynomial| |vl| F))
                    (|:| |remainder| (|XDistributedPolynomial| |vl| F)))))
        (SPROG
         ((|dx| #1=(|Integer|)) (#2=#:G60 NIL) (|ndx| #1#)
          (|qq| (|XDistributedPolynomial| |vl| F))
          (|q1| (|XDistributedPolynomial| |vl| F))
          (|tx| (|List| (|XDistributedPolynomial| |vl| F)))
          (|dy| (|NonNegativeInteger|)) (|ilc| (F)) (|w| (|FreeMonoid| |vl|)))
         (SEQ
          (EXIT
           (SEQ (LETT |w| (SPADCALL |y| (QREFELT % 24)))
                (LETT |ilc|
                      (SPADCALL (|spadConstant| % 13)
                                (SPADCALL |y| (QREFELT % 25)) (QREFELT % 26)))
                (LETT |dy| (SPADCALL |y| (QREFELT % 15)))
                (LETT |dx| (|XPFACT;my_degree| |x| %))
                (EXIT
                 (COND ((< |dx| |dy|) (CONS (|spadConstant| % 10) |x|))
                       ('T
                        (SEQ (LETT |qq| (|spadConstant| % 10))
                             (EXIT
                              (SEQ G190 NIL
                                   (SEQ
                                    (LETT |tx| (SPADCALL |x| (QREFELT % 23)))
                                    (LETT |q1|
                                          (SPADCALL |ilc|
                                                    (SPADCALL
                                                     (|SPADfirst| |tx|) |w|
                                                     (QREFELT % 34))
                                                    (QREFELT % 28)))
                                    (LETT |x|
                                          (SPADCALL |x|
                                                    (SPADCALL |q1| |y|
                                                              (QREFELT % 29))
                                                    (QREFELT % 30)))
                                    (LETT |qq|
                                          (SPADCALL |qq| |q1| (QREFELT % 31)))
                                    (LETT |ndx| (|XPFACT;my_degree| |x| %))
                                    (COND
                                     ((OR (EQL |ndx| |dx|) (< |ndx| |dy|))
                                      (EXIT
                                       (PROGN
                                        (LETT #2# (CONS |qq| |x|))
                                        (GO #3=#:G59)))))
                                    (EXIT (LETT |dx| |ndx|)))
                                   NIL (GO G190) G191 (EXIT NIL)))))))))
          #3# (EXIT #2#)))) 

(SDEFUN |XPFACT;lexquo|
        ((|x| (|XDistributedPolynomial| |vl| F))
         (|y| (|XDistributedPolynomial| |vl| F))
         (% (|Union| (|XDistributedPolynomial| |vl| F) "failed")))
        (SPROG
         ((|r| #1=(|XDistributedPolynomial| |vl| F))
          (|q| #2=(|XDistributedPolynomial| |vl| F))
          (|#G14| (|Record| (|:| |quotient| #2#) (|:| |remainder| #1#))))
         (SEQ
          (PROGN
           (LETT |#G14| (SPADCALL |x| |y| (QREFELT % 33)))
           (LETT |q| (QCAR |#G14|))
           (LETT |r| (QCDR |#G14|))
           |#G14|)
          (EXIT
           (COND
            ((SPADCALL |r| (|spadConstant| % 10) (QREFELT % 12)) (CONS 0 |q|))
            ('T (CONS 1 "failed"))))))) 

(SDEFUN |XPFACT;left_ext_GCD;2XdpU;6|
        ((|a| (|XDistributedPolynomial| |vl| F))
         (|b| (|XDistributedPolynomial| |vl| F))
         (%
          (|Union|
           (|Record| (|:| |g| (|XDistributedPolynomial| |vl| F))
                     (|:| |c1| (|XDistributedPolynomial| |vl| F))
                     (|:| |c2| (|XDistributedPolynomial| |vl| F))
                     (|:| |cu| (|XDistributedPolynomial| |vl| F))
                     (|:| |cv| (|XDistributedPolynomial| |vl| F)))
           "failed")))
        (SPROG
         ((|v| #1=(|XDistributedPolynomial| |vl| F))
          (|v0| #2=(|XDistributedPolynomial| |vl| F))
          (|#G23| #3=(|XDistributedPolynomial| |vl| F)) (|#G22| #1#) (|u| #2#)
          (|u0| #1#) (|#G21| #3#) (|#G20| #2#)
          (|#G19| #4=(|XDistributedPolynomial| |vl| F))
          (|#G18| (|XDistributedPolynomial| |vl| F)) (#5=#:G82 NIL) (|r| #4#)
          (|q| #6=(|XDistributedPolynomial| |vl| F))
          (|#G17| (|Record| (|:| |quotient| #6#) (|:| |remainder| #4#))))
         (SEQ
          (EXIT
           (SEQ (LETT |u0| (LETT |v| (|spadConstant| % 36)))
                (LETT |v0| (LETT |u| (|spadConstant| % 10)))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |b| (|spadConstant| % 10) (QREFELT % 37)))
                       (GO G191)))
                     (SEQ
                      (PROGN
                       (LETT |#G17| (SPADCALL |a| |b| (QREFELT % 33)))
                       (LETT |q| (QCAR |#G17|))
                       (LETT |r| (QCDR |#G17|))
                       |#G17|)
                      (COND
                       ((NULL
                         (< (|XPFACT;my_degree| |r| %)
                            (SPADCALL |b| (QREFELT % 15))))
                        (EXIT
                         (PROGN (LETT #5# (CONS 1 "failed")) (GO #7=#:G81)))))
                      (PROGN
                       (LETT |#G18| |b|)
                       (LETT |#G19| |r|)
                       (LETT |a| |#G18|)
                       (LETT |b| |#G19|))
                      (PROGN
                       (LETT |#G20| |u|)
                       (LETT |#G21|
                             (SPADCALL |u0| (SPADCALL |u| |q| (QREFELT % 29))
                                       (QREFELT % 30)))
                       (LETT |u0| |#G20|)
                       (LETT |u| |#G21|))
                      (EXIT
                       (PROGN
                        (LETT |#G22| |v|)
                        (LETT |#G23|
                              (SPADCALL |v0| (SPADCALL |v| |q| (QREFELT % 29))
                                        (QREFELT % 30)))
                        (LETT |v0| |#G22|)
                        (LETT |v| |#G23|))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (VECTOR |a| |u0| |v0| |u| |v|)))))
          #7# (EXIT #5#)))) 

(SDEFUN |XPFACT;homo_fact1|
        ((|p1| (|XDistributedPolynomial| |vl| F))
         (% (|List| (|XDistributedPolynomial| |vl| F))))
        (SPROG
         ((#1=#:G95 NIL) (#2=#:G98 NIL)
          (|lf| (|XDistributedPolynomial| |vl| F)) (#3=#:G96 NIL)
          (|n1| (|Integer|)) (|n1u| (|Union| (|NonNegativeInteger|) "failed"))
          (|n2| #4=(|NonNegativeInteger|))
          (|rf| (|XDistributedPolynomial| |vl| F)) (#5=#:G97 NIL)
          (|lw2| (|FreeMonoid| |vl|)) (|lw1| (|FreeMonoid| |vl|)) (|c0| (F))
          (|n| #4#))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |p1| (QREFELT % 41)))
                (LETT |lw2| (SPADCALL |p1| (QREFELT % 24)))
                (LETT |c0| (SPADCALL |p1| (QREFELT % 25)))
                (LETT |lw1| (|spadConstant| % 42))
                (EXIT
                 (COND ((EQL (SPADCALL |lw2| (QREFELT % 20)) 0) NIL)
                       ('T
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ G190
                                (COND
                                 ((NULL (> (SPADCALL |lw2| (QREFELT % 20)) 0))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (LETT |lw1|
                                         (SPADCALL |lw1|
                                                   (SPADCALL
                                                    (SPADCALL |lw2|
                                                              (QREFELT % 43))
                                                    (QREFELT % 44))
                                                   (QREFELT % 45)))
                                   (LETT |lw2| (SPADCALL |lw2| (QREFELT % 46)))
                                   (EXIT
                                    (COND
                                     ((EQL (SPADCALL |lw2| (QREFELT % 20)) 0)
                                      (PROGN (LETT #5# 1) (GO #6=#:G91)))
                                     ('T
                                      (SEQ
                                       (LETT |rf|
                                             (SPADCALL |p1| |lw1|
                                                       (QREFELT % 27)))
                                       (LETT |n2|
                                             (SPADCALL |rf| (QREFELT % 41)))
                                       (LETT |n1u|
                                             (SPADCALL |n| |n2|
                                                       (QREFELT % 48)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |n1u| 1)
                                          (PROGN
                                           (LETT #3# |$NoValue|)
                                           (GO #7=#:G83)))
                                         ('T
                                          (SEQ (LETT |n1| (QCDR |n1u|))
                                               (LETT |lf|
                                                     (SPADCALL |p1| |lw2|
                                                               (QREFELT % 34)))
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |n1|
                                                            (SPADCALL |lf|
                                                                      (QREFELT
                                                                       % 41))
                                                            (QREFELT % 50))
                                                  (PROGN
                                                   (LETT #3# |$NoValue|)
                                                   (GO #7#)))
                                                 ('T
                                                  (SEQ
                                                   (EXIT
                                                    (SEQ
                                                     (LETT |lf|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (|spadConstant| %
                                                                             13)
                                                             |c0|
                                                             (QREFELT % 26))
                                                            |lf|
                                                            (QREFELT % 28)))
                                                     (EXIT
                                                      (COND
                                                       ((SPADCALL |p1|
                                                                  (SPADCALL
                                                                   |lf| |rf|
                                                                   (QREFELT %
                                                                            29))
                                                                  (QREFELT %
                                                                           12))
                                                        (PROGN
                                                         (LETT #1#
                                                               (PROGN
                                                                (LETT #2#
                                                                      (LIST
                                                                       |lf|
                                                                       |rf|))
                                                                (GO #8=#:G94)))
                                                         (GO #9=#:G87)))))))
                                                   #9# (EXIT #1#)))))))))))))))
                                 #7# (EXIT #3#))
                                NIL (GO G190) G191 (EXIT NIL)))
                          #6# (EXIT #5#))
                         (EXIT NIL)))))))
          #8# (EXIT #2#)))) 

(SDEFUN |XPFACT;homo_fact;XdpL;8|
        ((|p| (|XDistributedPolynomial| |vl| F))
         (% (|List| (|XDistributedPolynomial| |vl| F))))
        (SPROG
         ((|res| (|List| (|XDistributedPolynomial| |vl| F)))
          (|p1| (|XDistributedPolynomial| |vl| F)) (#1=#:G106 NIL)
          (|fl1| (|List| (|XDistributedPolynomial| |vl| F))))
         (SEQ
          (EXIT
           (SEQ (LETT |res| NIL)
                (SEQ G190 NIL
                     (SEQ (LETT |fl1| (|XPFACT;homo_fact1| |p| %))
                          (EXIT
                           (COND
                            ((NULL |fl1|)
                             (SEQ (LETT |res| (CONS |p| |res|))
                                  (LETT |res| (REVERSE |res|))
                                  (EXIT
                                   (PROGN (LETT #1# |res|) (GO #2=#:G105)))))
                            ('T
                             (SEQ (LETT |p1| (|SPADfirst| |fl1|))
                                  (LETT |res| (CONS |p1| |res|))
                                  (EXIT
                                   (LETT |p| (|SPADfirst| (CDR |fl1|)))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #2# (EXIT #1#)))) 

(SDEFUN |XPFACT;XDP_to_YDP|
        ((|p| (|XDistributedPolynomial| |vl| F))
         (% (|XDistributedPolynomial| |vl| (|Polynomial| F))))
        (SPROG
         ((|lt2|
           (|List|
            (|Record| (|:| |k| (|FreeMonoid| |vl|))
                      (|:| |c| (|Polynomial| F)))))
          (#1=#:G115 NIL) (|t| NIL)
          (|lt| (|List| (|Record| (|:| |k| (|FreeMonoid| |vl|)) (|:| |c| F)))))
         (SEQ (LETT |lt| (SPADCALL |p| (QREFELT % 18))) (LETT |lt2| NIL)
              (SEQ (LETT |t| NIL) (LETT #1# |lt|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |lt2|
                           (CONS
                            (CONS (QCAR |t|)
                                  (SPADCALL (QCDR |t|) (QREFELT % 53)))
                            |lt2|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |lt2| (NREVERSE |lt2|))
              (EXIT (SPADCALL |lt2| (QREFELT % 57)))))) 

(SDEFUN |XPFACT;eval_YDP|
        ((|p| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
         (|ls| (|List| (|Symbol|))) (|lval| (|List| F))
         (% (|XDistributedPolynomial| |vl| F)))
        (SPROG
         ((|lt2| (|List| (|Record| (|:| |k| (|FreeMonoid| |vl|)) (|:| |c| F))))
          (#1=#:G123 NIL) (|nc| (F)) (#2=#:G124 NIL) (|t| NIL)
          (|lt|
           (|List|
            (|Record| (|:| |k| (|FreeMonoid| |vl|))
                      (|:| |c| (|Polynomial| F))))))
         (SEQ (LETT |lt| (SPADCALL |p| (QREFELT % 58))) (LETT |lt2| NIL)
              (SEQ (LETT |t| NIL) (LETT #2# |lt|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ
                      (LETT |nc|
                            (SPADCALL
                             (SPADCALL (QCDR |t|) |ls| |lval| (QREFELT % 61))
                             (QREFELT % 62)))
                      (EXIT
                       (COND
                        ((SPADCALL |nc| (|spadConstant| % 8) (QREFELT % 63))
                         (PROGN (LETT #1# |$NoValue|) (GO #3=#:G118)))
                        ('T
                         (LETT |lt2| (CONS (CONS (QCAR |t|) |nc|) |lt2|)))))))
                    #3# (EXIT #1#))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |lt2| (QREFELT % 21)))))) 

(SDEFUN |XPFACT;eval_sup|
        ((|p1| (|SparseUnivariatePolynomial| F))
         (|w| (|XDistributedPolynomial| |vl| F))
         (% (|XDistributedPolynomial| |vl| F)))
        (SPROG
         ((|res| (|XDistributedPolynomial| |vl| F)) (#1=#:G135 NIL) (|i| NIL)
          (|od| (|Integer|)) (#2=#:G134 NIL) (|nd| (|NonNegativeInteger|))
          (|c| (F)))
         (SEQ (LETT |res| (|spadConstant| % 10)) (LETT |od| -1)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |p1| (|spadConstant| % 65) (QREFELT % 66)))
                     (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |p1| (QREFELT % 67)))
                        (LETT |nd| (SPADCALL |p1| (QREFELT % 68)))
                        (SEQ (LETT |i| |nd|) (LETT #2# (- |od| 1)) G190
                             (COND ((> |i| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |res|
                                     (SPADCALL |w| |res| (QREFELT % 29)))))
                             (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                        (LETT |res|
                              (SPADCALL |res| (SPADCALL |c| (QREFELT % 69))
                                        (QREFELT % 31)))
                        (LETT |p1| (SPADCALL |p1| (QREFELT % 70)))
                        (EXIT (LETT |od| |nd|)))
                   NIL (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1) (LETT #1# |od|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT (LETT |res| (SPADCALL |w| |res| (QREFELT % 29)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |XPFACT;restn|
        ((|w| (|FreeMonoid| |vl|)) (|j| (|Integer|)) (% (|FreeMonoid| |vl|)))
        (SPROG ((#1=#:G140 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1) (LETT #1# |j|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (LETT |w| (SPADCALL |w| (QREFELT % 46)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |w|)))) 

(SDEFUN |XPFACT;firstn|
        ((|w| (|FreeMonoid| |vl|)) (|j| (|Integer|)) (% (|FreeMonoid| |vl|)))
        (SPROG ((|res| (|FreeMonoid| |vl|)) (#1=#:G146 NIL) (|i| NIL))
               (SEQ (LETT |res| (|spadConstant| % 42))
                    (SEQ (LETT |i| 1) (LETT #1# |j|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (LETT |res|
                                (SPADCALL |res|
                                          (SPADCALL
                                           (SPADCALL |w| (QREFELT % 43))
                                           (QREFELT % 44))
                                          (QREFELT % 45)))
                          (EXIT (LETT |w| (SPADCALL |w| (QREFELT % 46)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |XPFACT;my_ground| ((|fr| (|Fraction| (|Polynomial| F))) (% (F)))
        (SPADCALL (SPADCALL (SPADCALL |fr| (QREFELT % 72)) (QREFELT % 62))
                  (SPADCALL (SPADCALL |fr| (QREFELT % 73)) (QREFELT % 62))
                  (QREFELT % 26))) 

(SDEFUN |XPFACT;rational_solution1|
        ((|eq| (|Equation| (|Fraction| (|Polynomial| F))))
         (% (|List| (|Fraction| (|Polynomial| F)))))
        (SPROG
         ((|dr| (|Polynomial| F)) (|nr| #1=(|Polynomial| F))
          (|re| (|Fraction| (|Polynomial| F))) (|nl| #1#)
          (|le| (|Fraction| (|Polynomial| F))))
         (SEQ (LETT |le| (SPADCALL |eq| (QREFELT % 75)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |le| (QREFELT % 73)) (|spadConstant| % 76)
                           (QREFELT % 77))
                 NIL)
                ('T
                 (SEQ (LETT |nl| (SPADCALL |le| (QREFELT % 72)))
                      (COND
                       ((OR
                         (SPADCALL (SPADCALL |nl| (QREFELT % 78)) 1
                                   (QREFELT % 50))
                         (SPADCALL (SPADCALL |nl| (QREFELT % 79))
                                   (|spadConstant| % 80) (QREFELT % 77)))
                        (EXIT NIL)))
                      (LETT |re| (SPADCALL |eq| (QREFELT % 81)))
                      (LETT |nr| (SPADCALL |re| (QREFELT % 72)))
                      (COND ((NULL (SPADCALL |nr| (QREFELT % 82))) (EXIT NIL)))
                      (LETT |dr| (SPADCALL |re| (QREFELT % 73)))
                      (COND ((NULL (SPADCALL |dr| (QREFELT % 82))) (EXIT NIL)))
                      (EXIT
                       (LIST |le|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 76)
                                         (SPADCALL |nl| (QREFELT % 83))
                                         (QREFELT % 84))
                               (|XPFACT;my_ground| |re| %) (QREFELT % 87))
                              (QREFELT % 88))))))))))) 

(SDEFUN |XPFACT;rational_solution|
        ((|leq| (|List| (|Equation| (|Fraction| (|Polynomial| F)))))
         (|ls| (|List| (|Symbol|))) (% (|List| F)))
        (SPROG
         ((|sol| (|List| F)) (|v| (|Symbol|)) (#1=#:G161 NIL)
          (|sol1| (|List| (|Fraction| (|Polynomial| F)))) (#2=#:G162 NIL)
          (|eq| NIL) (#3=#:G163 NIL) (|s| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |sol| NIL)
                (SEQ (LETT |s| NIL) (LETT #3# |ls|) (LETT |eq| NIL)
                     (LETT #2# |leq|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#)) NIL)
                           (ATOM #3#) (PROGN (LETT |s| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL
                          (LETT |sol1| (|XPFACT;rational_solution1| |eq| %)))
                         (PROGN (LETT #1# NIL) (GO #4=#:G160)))
                        ('T
                         (SEQ
                          (LETT |v|
                                (|SPADfirst|
                                 (SPADCALL
                                  (SPADCALL (|SPADfirst| |sol1|)
                                            (QREFELT % 72))
                                  (QREFELT % 89))))
                          (EXIT
                           (COND
                            ((SPADCALL |s| |v| (QREFELT % 91))
                             (|error| "strange solution"))
                            ('T
                             (LETT |sol|
                                   (CONS
                                    (|XPFACT;my_ground|
                                     (|SPADfirst| (CDR |sol1|)) %)
                                    |sol|))))))))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (REVERSE |sol|))))
          #4# (EXIT #1#)))) 

(SDEFUN |XPFACT;get_rational_solution|
        ((|lsol| (|List| (|List| (|Equation| (|Fraction| (|Polynomial| F))))))
         (|ls| (|List| (|Symbol|))) (% (|List| F)))
        (SPROG ((#1=#:G169 NIL) (|sol| (|List| F)) (#2=#:G170 NIL) (|leq| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |leq| NIL) (LETT #2# |lsol|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |leq| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (NULL
                             (LETT |sol|
                                   (|XPFACT;rational_solution| |leq| |ls| %))))
                           (PROGN (LETT #1# |sol|) (GO #3=#:G168))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |XPFACT;algebraic_solution|
        ((|leq| (|List| (|Equation| (|Fraction| (|Polynomial| F)))))
         (|alg_sym| (|Symbol|)) (|ls| (|List| (|Symbol|)))
         (%
          (|Union|
           (|Record| (|:| |pol| (|Polynomial| F)) (|:| |sol1| (|List| F)))
           "failed")))
        (SPROG
         ((|v_lst| (|List| (|Symbol|))) (|eq| (|Polynomial| F))
          (|eqf| (|Fraction| (|Polynomial| F)))
          (|eq1| (|Equation| (|Fraction| (|Polynomial| F))))
          (|sol1| (|List| F)))
         (SEQ (LETT |sol1| (|XPFACT;rational_solution| (CDR |leq|) |ls| %))
              (EXIT
               (COND ((NULL |sol1|) (CONS 1 "failed"))
                     (#1='T
                      (SEQ (LETT |eq1| (|SPADfirst| |leq|))
                           (LETT |eqf|
                                 (SPADCALL (SPADCALL |eq1| (QREFELT % 75))
                                           (SPADCALL |eq1| (QREFELT % 81))
                                           (QREFELT % 92)))
                           (LETT |eq| (SPADCALL |eqf| (QREFELT % 72)))
                           (LETT |v_lst| (SPADCALL |eq| (QREFELT % 89)))
                           (EXIT
                            (COND
                             ((SPADCALL |v_lst| (LIST |alg_sym|)
                                        (QREFELT % 93))
                              (CONS 0 (CONS |eq| |sol1|)))
                             (#1# (CONS 1 "failed"))))))))))) 

(SDEFUN |XPFACT;get_algebraic_solution|
        ((|lsol| (|List| (|List| (|Equation| (|Fraction| (|Polynomial| F))))))
         (|alg_sym| (|Symbol|)) (|ls| (|List| (|Symbol|)))
         (%
          (|Union|
           (|Record| (|:| |pol| (|Polynomial| F)) (|:| |sol1| (|List| F)))
           "failed")))
        (SPROG
         ((#1=#:G183 NIL)
          (|sol|
           (|Union|
            (|Record| (|:| |pol| (|Polynomial| F)) (|:| |sol1| (|List| F)))
            "failed"))
          (#2=#:G184 NIL) (|leq| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |leq| NIL) (LETT #2# |lsol|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |leq| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |sol|
                        (|XPFACT;algebraic_solution| |leq| |alg_sym| |ls| %))
                  (EXIT
                   (COND
                    ((QEQCAR |sol| 0)
                     (PROGN (LETT #1# |sol|) (GO #3=#:G182))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #3# (EXIT #1#)))) 

(SDEFUN |XPFACT;my_mul|
        ((|l| (|List| (|XDistributedPolynomial| |vl| F)))
         (% (|XDistributedPolynomial| |vl| F)))
        (SPROG
         ((|res| (|XDistributedPolynomial| |vl| F)) (#1=#:G189 NIL) (|p| NIL))
         (SEQ (LETT |l| (REVERSE |l|)) (LETT |res| (|SPADfirst| |l|))
              (SEQ (LETT |p| NIL) (LETT #1# (CDR |l|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT (LETT |res| (SPADCALL |p| |res| (QREFELT % 29)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |XPFACT;overlap_steps|
        ((|ll| (|List| (|XDistributedPolynomial| |vl| F)))
         (|rl| (|List| (|XDistributedPolynomial| |vl| F)))
         (% (|List| (|Integer|))))
        (SPROG
         ((|d| (|NonNegativeInteger|)) (|res| (|List| (|Integer|)))
          (#1=#:G191 NIL) (#2=#:G197 NIL) (|p2| NIL) (#3=#:G198 NIL) (|k| NIL)
          (|kk| (|NonNegativeInteger|))
          (|p1| (|XDistributedPolynomial| |vl| F)))
         (SEQ (LETT |res| NIL) (LETT |p1| (SPADCALL |ll| (QREFELT % 94)))
              (LETT |d| (SPADCALL |p1| (QREFELT % 15)))
              (LETT |kk| (LENGTH |ll|))
              (SEQ (LETT |k| 1) (LETT #3# |kk|) (LETT |p2| NIL) (LETT #2# |rl|)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |p2| (CAR #2#)) NIL)
                         (|greater_SI| |k| #3#))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL |p2| |p1| (QREFELT % 12))
                      (COND
                       ((SPADCALL (SPADCALL |rl| |k| (QREFELT % 95))
                                  (SPADCALL |ll|
                                            (PROG1 (LETT #1# (- |kk| |k|))
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT % 96))
                                  (QREFELT % 97))
                        (LETT |res| (CONS |d| |res|))))))
                    (EXIT (LETT |d| (+ |d| (SPADCALL |p2| (QREFELT % 15))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |k| (|inc_SI| |k|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |res|))))) 

(SDEFUN |XPFACT;lift1|
        ((|lw| (|FreeMonoid| |vl|))
         (|lfy| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
         (|d1| (|Integer|)) (|rw| (|FreeMonoid| |vl|))
         (|rfy| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
         (|j| (|Integer|)) (|lc| (F))
         (|rp| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
         (|o_case| (|Boolean|))
         (%
          (|Record|
           (|:| |l_fac| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
           (|:| |r_fac| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
           (|:| |residual| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
           (|:| |nsym| (|Union| (|Symbol|) "none")))))
        (SPROG
         ((|lf1| #1=(|XDistributedPolynomial| |vl| (|Polynomial| F)))
          (|rf1| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
          (|rf1p| #2=(|XDistributedPolynomial| |vl| (|Polynomial| F)))
          (|nc1| (|Polynomial| F)) (|nc2| (|Polynomial| F)) (|piv2| (F))
          (|rdc0| (|Polynomial| F)) (|ldc| (F))
          (|lqu| (|Union| (|FreeMonoid| |vl|) "failed"))
          (|ldc0| (|Polynomial| F)) (|rdc| (F))
          (|rqu| (|Union| (|FreeMonoid| |vl|) "failed"))
          (|dc| #3=(|Polynomial| F)) (|dw| (|FreeMonoid| |vl|))
          (|dif_p| (|XDistributedPolynomial| |vl| (|Polynomial| F))) (|oc| #3#)
          (|nc| (|Polynomial| F)) (|nsu| (|Union| (|Symbol|) "none"))
          (|ns| (|Symbol|)) (|low| #4=(|FreeMonoid| |vl|)) (|row| #4#)
          (|lop| #1#) (|rcw| (|FreeMonoid| |vl|)) (|rop| #2#)
          (|lcw| (|FreeMonoid| |vl|)))
         (SEQ (LETT |nsu| (CONS 1 "none"))
              (LETT |lcw| (|XPFACT;restn| |lw| (- |d1| |j|) %))
              (LETT |rop| (SPADCALL |rfy| |lcw| (QREFELT % 98)))
              (COND
               ((SPADCALL |rop| (|spadConstant| % 99) (QREFELT % 100))
                (SEQ (LETT |rf1p| (SPADCALL |rp| |lw| (QREFELT % 98)))
                     (LETT |rf1|
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 76) |lc|
                                      (QREFELT % 84))
                            |rf1p| (QREFELT % 101)))
                     (LETT |rp|
                           (SPADCALL |rp|
                                     (SPADCALL |lfy| |rf1| (QREFELT % 102))
                                     (QREFELT % 103)))
                     (LETT |lf1| (SPADCALL |rp| |rw| (QREFELT % 104)))
                     (EXIT
                      (LETT |rp|
                            (SPADCALL |rp|
                                      (SPADCALL |lf1| |rfy| (QREFELT % 102))
                                      (QREFELT % 103))))))
               (#5='T
                (SEQ (LETT |rcw| (|XPFACT;firstn| |rw| |j| %))
                     (LETT |lop| (SPADCALL |lfy| |rcw| (QREFELT % 104)))
                     (LETT |row|
                           (SPADCALL |lw| (SPADCALL |rop| (QREFELT % 105))
                                     (QREFELT % 45)))
                     (EXIT
                      (COND
                       ((SPADCALL |lop| (|spadConstant| % 99) (QREFELT % 100))
                        (SEQ (LETT |lf1| (SPADCALL |rp| |rw| (QREFELT % 104)))
                             (LETT |rp|
                                   (SPADCALL |rp|
                                             (SPADCALL |lf1| |rfy|
                                                       (QREFELT % 102))
                                             (QREFELT % 103)))
                             (LETT |rf1p| (SPADCALL |rp| |lw| (QREFELT % 98)))
                             (LETT |rf1|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| % 76) |lc|
                                              (QREFELT % 84))
                                    |rf1p| (QREFELT % 101)))
                             (EXIT
                              (LETT |rp|
                                    (SPADCALL |rp|
                                              (SPADCALL |lfy| |rf1|
                                                        (QREFELT % 102))
                                              (QREFELT % 103))))))
                       (#5#
                        (SEQ
                         (LETT |low|
                               (SPADCALL (SPADCALL |lop| (QREFELT % 105)) |rw|
                                         (QREFELT % 45)))
                         (EXIT
                          (COND
                           ((SPADCALL |row| |low| (QREFELT % 106))
                            (SEQ
                             (LETT |lf1| (SPADCALL |rp| |rw| (QREFELT % 104)))
                             (LETT |rp|
                                   (SPADCALL |rp|
                                             (SPADCALL |lf1| |rfy|
                                                       (QREFELT % 102))
                                             (QREFELT % 103)))
                             (LETT |rf1p| (SPADCALL |rp| |lw| (QREFELT % 98)))
                             (LETT |rf1|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| % 76) |lc|
                                              (QREFELT % 84))
                                    |rf1p| (QREFELT % 101)))
                             (EXIT
                              (LETT |rp|
                                    (SPADCALL |rp|
                                              (SPADCALL |lfy| |rf1|
                                                        (QREFELT % 102))
                                              (QREFELT % 103))))))
                           ((SPADCALL |low| |row| (QREFELT % 106))
                            (SEQ
                             (LETT |rf1p| (SPADCALL |rp| |lw| (QREFELT % 98)))
                             (LETT |rf1|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| % 76) |lc|
                                              (QREFELT % 84))
                                    |rf1p| (QREFELT % 101)))
                             (LETT |rp|
                                   (SPADCALL |rp|
                                             (SPADCALL |lfy| |rf1|
                                                       (QREFELT % 102))
                                             (QREFELT % 103)))
                             (LETT |lf1| (SPADCALL |rp| |rw| (QREFELT % 104)))
                             (EXIT
                              (LETT |rp|
                                    (SPADCALL |rp|
                                              (SPADCALL |lf1| |rfy|
                                                        (QREFELT % 102))
                                              (QREFELT % 103))))))
                           (|o_case|
                            (SEQ (LETT |ns| (SPADCALL (QREFELT % 107)))
                                 (LETT |nsu| (CONS 0 |ns|))
                                 (LETT |nc|
                                       (SPADCALL (|spadConstant| % 76) |ns| 1
                                                 (QREFELT % 108)))
                                 (LETT |oc|
                                       (SPADCALL |rp| |low| (QREFELT % 109)))
                                 (LETT |rf1p|
                                       (SPADCALL |rp| |lw| (QREFELT % 98)))
                                 (LETT |rf1|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 76) |lc|
                                                  (QREFELT % 84))
                                        |rf1p| (QREFELT % 101)))
                                 (LETT |lf1|
                                       (SPADCALL |rp| |rw| (QREFELT % 104)))
                                 (LETT |rf1|
                                       (SPADCALL |rf1|
                                                 (SPADCALL |nc| |rop|
                                                           (QREFELT % 101))
                                                 (QREFELT % 110)))
                                 (LETT |lf1|
                                       (SPADCALL |lf1|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |oc| |lc|
                                                             (QREFELT % 84))
                                                   |nc| (QREFELT % 111))
                                                  |lop| (QREFELT % 101))
                                                 (QREFELT % 103)))
                                 (EXIT
                                  (LETT |rp|
                                        (SPADCALL
                                         (SPADCALL |rp|
                                                   (SPADCALL |lfy| |rf1|
                                                             (QREFELT % 102))
                                                   (QREFELT % 103))
                                         (SPADCALL |lf1| |rfy| (QREFELT % 102))
                                         (QREFELT % 103))))))
                           (#5#
                            (SEQ
                             (LETT |oc| (SPADCALL |rp| |low| (QREFELT % 109)))
                             (LETT |dif_p|
                                   (SPADCALL
                                    (SPADCALL |lfy| |rop| (QREFELT % 102))
                                    (SPADCALL |lop| |rfy| (QREFELT % 102))
                                    (QREFELT % 103)))
                             (EXIT
                              (COND
                               ((SPADCALL |dif_p| (|spadConstant| % 99)
                                          (QREFELT % 100))
                                (|error| "impossible 1"))
                               (#5#
                                (SEQ
                                 (LETT |dw| (SPADCALL |dif_p| (QREFELT % 105)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |dw| |low| (QREFELT % 112))
                                    (|error| "impossible 2"))
                                   (#5#
                                    (SEQ
                                     (LETT |dc|
                                           (SPADCALL |rp| |dw|
                                                     (QREFELT % 109)))
                                     (LETT |rdc| (|spadConstant| % 8))
                                     (LETT |ldc| (|spadConstant| % 8))
                                     (LETT |ldc0|
                                           (SEQ
                                            (LETT |rqu|
                                                  (SPADCALL |dw| |lw|
                                                            (QREFELT % 113)))
                                            (EXIT
                                             (COND
                                              ((QEQCAR |rqu| 1)
                                               (|spadConstant| % 80))
                                              (#5#
                                               (SEQ
                                                (LETT |rdc|
                                                      (SPADCALL
                                                       (SPADCALL |rop|
                                                                 (QCDR |rqu|)
                                                                 (QREFELT %
                                                                          109))
                                                       (QREFELT % 62)))
                                                (EXIT
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|spadConstant| % 13) |lc|
                                                   (QREFELT % 26))
                                                  |dc| (QREFELT % 114)))))))))
                                     (LETT |rdc0|
                                           (SEQ
                                            (LETT |lqu|
                                                  (SPADCALL |dw| |rw|
                                                            (QREFELT % 115)))
                                            (EXIT
                                             (COND
                                              ((QEQCAR |lqu| 1)
                                               (|spadConstant| % 80))
                                              (#5#
                                               (SEQ
                                                (LETT |ldc|
                                                      (SPADCALL
                                                       (SPADCALL |lop|
                                                                 (QCDR |lqu|)
                                                                 (QREFELT %
                                                                          109))
                                                       (QREFELT % 62)))
                                                (EXIT |dc|)))))))
                                     (LETT |piv2|
                                           (SPADCALL |rdc|
                                                     (|spadConstant| % 13)
                                                     (QREFELT % 116)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |piv2| (|spadConstant| % 8)
                                                  (QREFELT % 63))
                                        (|error| "impossible 3"))
                                       (#5#
                                        (SEQ
                                         (LETT |nc2|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| % 13)
                                                          |piv2|
                                                          (QREFELT % 26))
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |dc| |ldc0|
                                                            (QREFELT % 117))
                                                  |rdc0| (QREFELT % 117))
                                                 (SPADCALL |ldc| |oc|
                                                           (QREFELT % 114))
                                                 (QREFELT % 111))
                                                (QREFELT % 114)))
                                         (LETT |nc1|
                                               (SPADCALL
                                                (SPADCALL |oc| (QREFELT % 119))
                                                |nc2| (QREFELT % 117)))
                                         (LETT |rf1p|
                                               (SPADCALL |rp| |lw|
                                                         (QREFELT % 98)))
                                         (LETT |rf1|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| % 76)
                                                          |lc| (QREFELT % 84))
                                                |rf1p| (QREFELT % 101)))
                                         (LETT |rf1|
                                               (SPADCALL |rf1|
                                                         (SPADCALL |nc1| |rop|
                                                                   (QREFELT %
                                                                            101))
                                                         (QREFELT % 110)))
                                         (LETT |lf1|
                                               (SPADCALL |rp| |rw|
                                                         (QREFELT % 104)))
                                         (LETT |lf1|
                                               (SPADCALL |lf1|
                                                         (SPADCALL |nc2| |lop|
                                                                   (QREFELT %
                                                                            101))
                                                         (QREFELT % 110)))
                                         (EXIT
                                          (LETT |rp|
                                                (SPADCALL
                                                 (SPADCALL |rp|
                                                           (SPADCALL |lfy|
                                                                     |rf1|
                                                                     (QREFELT %
                                                                              102))
                                                           (QREFELT % 103))
                                                 (SPADCALL |lf1| |rfy|
                                                           (QREFELT % 102))
                                                 (QREFELT %
                                                          103)))))))))))))))))))))))))))
              (EXIT (VECTOR |lf1| |rf1| |rp| |nsu|))))) 

(SDEFUN |XPFACT;dc_fact11|
        ((|lf| (|XDistributedPolynomial| |vl| F))
         (|lrl| (|List| (|XDistributedPolynomial| |vl| (|Polynomial| F))))
         (|eqs| (|List| (|Polynomial| F)))
         (% (|Union| (|XDistributedPolynomial| |vl| F) "failed")))
        (SPROG
         ((#1=#:G242 NIL) (|w| (|XDistributedPolynomial| |vl| F))
          (|nfac| (|SparseUnivariatePolynomial| F)) (#2=#:G241 NIL)
          (|fac| #3=(|SparseUnivariatePolynomial| F)) (#4=#:G247 NIL)
          (|fr| NIL) (|inv_tt| (|SparseUnivariatePolynomial| F)) (|tt1| (F))
          (|tt0| (F)) (|tt| (|SparseUnivariatePolynomial| F))
          (|md| (|Integer|)) (#5=#:G246 NIL) (#6=#:G245 NIL)
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #3#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|feq| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|eq1| (|SparseUnivariatePolynomial| F))
          (|ueqs| (|List| (|SparseUnivariatePolynomial| F))) (#7=#:G244 NIL)
          (|eq| NIL) (#8=#:G243 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ueqs|
                  (PROGN
                   (LETT #8# NIL)
                   (SEQ (LETT |eq| NIL) (LETT #7# |eqs|) G190
                        (COND
                         ((OR (ATOM #7#) (PROGN (LETT |eq| (CAR #7#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #8#
                                (CONS (SPADCALL |eq| (QREFELT % 123)) #8#))))
                        (LETT #7# (CDR #7#)) (GO G190) G191
                        (EXIT (NREVERSE #8#)))))
            (LETT |eq1| (SPADCALL |ueqs| (QREFELT % 125)))
            (EXIT
             (COND ((< (SPADCALL |eq1| (QREFELT % 68)) 1) (CONS 1 "failed"))
                   (#9='T
                    (SEQ (LETT |feq| (SPADCALL |eq1| (QREFELT % 127)))
                         (LETT |fl| (SPADCALL |feq| (QREFELT % 132)))
                         (LETT |md|
                               (SPADCALL
                                (PROGN
                                 (LETT #6# NIL)
                                 (SEQ (LETT |fr| NIL) (LETT #5# |fl|) G190
                                      (COND
                                       ((OR (ATOM #5#)
                                            (PROGN (LETT |fr| (CAR #5#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #6#
                                              (CONS
                                               (SPADCALL (QVELT |fr| 1)
                                                         (QREFELT % 68))
                                               #6#))))
                                      (LETT #5# (CDR #5#)) (GO G190) G191
                                      (EXIT (NREVERSE #6#))))
                                (QREFELT % 134)))
                         (LETT |tt|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|SPADfirst| |lrl|) (QREFELT % 135))
                                 (QREFELT % 123))
                                (QREFELT % 136)))
                         (EXIT
                          (COND
                           ((> (SPADCALL |tt| (QREFELT % 68)) 1)
                            (|error| "degree(tt) > 1"))
                           (#9#
                            (SEQ (LETT |tt0| (SPADCALL |tt| 0 (QREFELT % 137)))
                                 (LETT |tt1| (SPADCALL |tt| (QREFELT % 67)))
                                 (LETT |inv_tt|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 13) |tt1|
                                                  (QREFELT % 26))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 13) 1
                                                   (QREFELT % 138))
                                         (SPADCALL |tt0| (QREFELT % 139))
                                         (QREFELT % 142))
                                        (QREFELT % 143)))
                                 (SEQ (LETT |fr| NIL) (LETT #4# |fl|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |fr| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |fac| (QVELT |fr| 1))
                                             (EXIT
                                              (COND
                                               ((>
                                                 (SPADCALL |fac|
                                                           (QREFELT % 68))
                                                 |md|)
                                                (PROGN
                                                 (LETT #2# |$NoValue|)
                                                 (GO #10=#:G231)))
                                               ('T
                                                (SEQ
                                                 (LETT |nfac|
                                                       (SPADCALL |fac|
                                                                 (QREFELT %
                                                                          122)
                                                                 |inv_tt|
                                                                 (QREFELT %
                                                                          144)))
                                                 (LETT |w|
                                                       (SPADCALL |lf|
                                                                 (|XPFACT;eval_YDP|
                                                                  (SPADCALL
                                                                   (ELT % 110)
                                                                   (CDR |lrl|)
                                                                   (|spadConstant|
                                                                    % 99)
                                                                   (QREFELT %
                                                                            147))
                                                                  NIL NIL %)
                                                                 (QREFELT %
                                                                          31)))
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #1#
                                                         (CONS 0
                                                               (|XPFACT;eval_sup|
                                                                |nfac| |w| %)))
                                                   (GO #11=#:G240)))))))))
                                       #10# (EXIT #2#))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (|error| "impossible"))))))))))))
          #11# (EXIT #1#)))) 

(SDEFUN |XPFACT;dc_fact12|
        ((|lf| (|XDistributedPolynomial| |vl| F))
         (|lrl| (|List| (|XDistributedPolynomial| |vl| (|Polynomial| F))))
         (|eq| (|Polynomial| F)) (|sol1| (|List| F)) (|ls| (|List| (|Symbol|)))
         (% (|XDistributedPolynomial| |vl| F)))
        (SPROG
         ((|w| (|XDistributedPolynomial| |vl| F))
          (|nfac| (|SparseUnivariatePolynomial| F))
          (|inv_tt| (|SparseUnivariatePolynomial| F)) (|tt1| (F)) (|tt0| (F))
          (|tt| (|SparseUnivariatePolynomial| F))
          (|ueq| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |ueq| (SPADCALL |eq| (QREFELT % 123)))
              (LETT |tt|
                    (SPADCALL
                     (SPADCALL (SPADCALL (|SPADfirst| |lrl|) (QREFELT % 135))
                               (QREFELT % 123))
                     (QREFELT % 136)))
              (EXIT
               (COND
                ((> (SPADCALL |tt| (QREFELT % 68)) 1)
                 (|error| "degree(tt) > 1"))
                ('T
                 (SEQ (LETT |tt0| (SPADCALL |tt| 0 (QREFELT % 137)))
                      (LETT |tt1| (SPADCALL |tt| (QREFELT % 67)))
                      (LETT |inv_tt|
                            (SPADCALL
                             (SPADCALL (|spadConstant| % 13) |tt1|
                                       (QREFELT % 26))
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 13) 1
                                        (QREFELT % 138))
                              (SPADCALL |tt0| (QREFELT % 139)) (QREFELT % 142))
                             (QREFELT % 143)))
                      (LETT |nfac|
                            (SPADCALL |ueq| (QREFELT % 122) |inv_tt|
                                      (QREFELT % 144)))
                      (LETT |w|
                            (SPADCALL |lf|
                                      (|XPFACT;eval_YDP|
                                       (SPADCALL (ELT % 110) (CDR |lrl|)
                                                 (|spadConstant| % 99)
                                                 (QREFELT % 147))
                                       |ls| |sol1| %)
                                      (QREFELT % 31)))
                      (EXIT (|XPFACT;eval_sup| |nfac| |w| %))))))))) 

(SDEFUN |XPFACT;dc_fact1|
        ((|d| (|NonNegativeInteger|)) (|lc| (F))
         (|ll| (|List| (|XDistributedPolynomial| |vl| F)))
         (|rl| (|List| (|XDistributedPolynomial| |vl| F)))
         (|rs| (|XDistributedPolynomial| |vl| F))
         (%
          (|Union| (|List| (|XDistributedPolynomial| |vl| F))
                   (|XDistributedPolynomial| |vl| F) "failed")))
        (SPROG
         ((|rf| (|XDistributedPolynomial| |vl| F))
          (|lf| (|XDistributedPolynomial| |vl| F))
          (|solr|
           (|Record| (|:| |pol| (|Polynomial| F)) (|:| |sol1| (|List| F))))
          (|solu|
           (|Union|
            (|Record| (|:| |pol| (|Polynomial| F)) (|:| |sol1| (|List| F)))
            "failed"))
          (|ls| (|List| (|Symbol|))) (|alg_sym| (|Symbol|)) (|sol| (|List| F))
          (|lsol| (|List| (|List| (|Equation| (|Fraction| (|Polynomial| F))))))
          (#1=#:G336 NIL) (|eq| NIL) (#2=#:G335 NIL)
          (|au| (|Union| (|XDistributedPolynomial| |vl| F) "failed"))
          (|rrl1| (|List| (|XDistributedPolynomial| |vl| (|Polynomial| F))))
          (|eqs| (|List| (|Polynomial| F)))
          (|rp| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
          (|ts| (|List| (|XDistributedPolynomial| |vl| F))) (#3=#:G333 NIL)
          (|lr1| NIL) (#4=#:G334 NIL) (|rr1| NIL) (#5=#:G332 NIL)
          (#6=#:G331 NIL) (|j| NIL)
          (|rrl| (|List| (|XDistributedPolynomial| |vl| (|Polynomial| F))))
          (|rf1| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
          (#7=#:G329 NIL) (#8=#:G330 NIL) (#9=#:G328 NIL) (#10=#:G327 NIL)
          (|lrl| (|List| (|XDistributedPolynomial| |vl| (|Polynomial| F))))
          (|lf1| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
          (#11=#:G325 NIL) (#12=#:G326 NIL) (#13=#:G324 NIL) (#14=#:G323 NIL)
          (|alg_case2| #15=(|Boolean|)) (|alg_case| #15#)
          (|nsu| (|Union| (|Symbol|) #16="none"))
          (|#G124|
           (|Record|
            (|:| |l_fac| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
            (|:| |r_fac| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
            (|:| |residual| (|XDistributedPolynomial| |vl| (|Polynomial| F)))
            (|:| |nsym| (|Union| (|Symbol|) #16#))))
          (#17=#:G321 NIL) (#18=#:G322 NIL) (#19=#:G320 NIL)
          (|lovl| (|List| (|Integer|))) (|ovls| (|Integer|)) (|o_case| #15#)
          (#20=#:G319 NIL) (|md| (|NonNegativeInteger|))
          (|rw| #21=(|FreeMonoid| |vl|)) (|lw| #21#)
          (|d2| #22=(|NonNegativeInteger|)) (|d1| #22#)
          (|rfy| #23=(|XDistributedPolynomial| |vl| (|Polynomial| F)))
          (|lfy| #23#))
         (SEQ
          (LETT |lf| (SPADCALL |lc| (|XPFACT;my_mul| |ll| %) (QREFELT % 28)))
          (LETT |rf| (|XPFACT;my_mul| |rl| %))
          (LETT |lfy| (|XPFACT;XDP_to_YDP| |lf| %))
          (LETT |rfy| (|XPFACT;XDP_to_YDP| |rf| %))
          (LETT |d1| (SPADCALL |lf| (QREFELT % 15)))
          (LETT |d2| (SPADCALL |rf| (QREFELT % 15)))
          (LETT |lw| (SPADCALL |lf| (QREFELT % 24)))
          (LETT |rw| (SPADCALL |rf| (QREFELT % 24)))
          (LETT |md| (MIN |d1| |d2|))
          (LETT |lovl| (|XPFACT;overlap_steps| |ll| |rl| %))
          (LETT |lovl| (SPADCALL |lovl| (+ |md| 1) (QREFELT % 148)))
          (LETT |ovls| (|SPADfirst| |lovl|)) (LETT |lovl| (CDR |lovl|))
          (LETT |lrl| NIL) (LETT |rrl| NIL) (LETT |eqs| NIL) (LETT |ls| NIL)
          (LETT |alg_case| 'T) (LETT |alg_case2| NIL)
          (SEQ (LETT |j| 1) (LETT #20# |md|) G190
               (COND ((|greater_SI| |j| #20#) (GO G191)))
               (SEQ (LETT |o_case| NIL)
                    (COND
                     ((EQL |j| |ovls|)
                      (SEQ (LETT |o_case| 'T)
                           (LETT |ovls| (|SPADfirst| |lovl|))
                           (EXIT (LETT |lovl| (CDR |lovl|))))))
                    (LETT |rp|
                          (SPADCALL
                           (SPADCALL (ELT % 110)
                                     (PROGN
                                      (LETT #19# NIL)
                                      (SEQ (LETT |rr1| NIL) (LETT #18# |rrl|)
                                           (LETT |lr1| NIL) (LETT #17# |lrl|)
                                           G190
                                           (COND
                                            ((OR (ATOM #17#)
                                                 (PROGN
                                                  (LETT |lr1| (CAR #17#))
                                                  NIL)
                                                 (ATOM #18#)
                                                 (PROGN
                                                  (LETT |rr1| (CAR #18#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #19#
                                                   (CONS
                                                    (SPADCALL |lr1| |rr1|
                                                              (QREFELT % 102))
                                                    #19#))))
                                           (LETT #17#
                                                 (PROG1 (CDR #17#)
                                                   (LETT #18# (CDR #18#))))
                                           (GO G190) G191
                                           (EXIT (NREVERSE #19#))))
                                     (|spadConstant| % 99) (QREFELT % 147))
                           (QREFELT % 149)))
                    (COND
                     ((EQL (- |d| |j|) (|XPFACT;my_degree| |rs| %))
                      (SEQ (LETT |ts| (SPADCALL |rs| (QREFELT % 23)))
                           (LETT |rp|
                                 (SPADCALL |rp|
                                           (|XPFACT;XDP_to_YDP|
                                            (|SPADfirst| |ts|) %)
                                           (QREFELT % 110)))
                           (EXIT (LETT |rs| (|SPADfirst| (CDR |ts|)))))))
                    (PROGN
                     (LETT |#G124|
                           (|XPFACT;lift1| |lw| |lfy| |d1| |rw| |rfy| |j| |lc|
                            |rp| |o_case| %))
                     (LETT |lf1| (QVELT |#G124| 0))
                     (LETT |rf1| (QVELT |#G124| 1))
                     (LETT |rp| (QVELT |#G124| 2))
                     (LETT |nsu| (QVELT |#G124| 3))
                     |#G124|)
                    (COND
                     ((QEQCAR |nsu| 0)
                      (SEQ (LETT |ls| (CONS (QCDR |nsu|) |ls|))
                           (COND ((< |j| |md|) (LETT |alg_case| NIL)))
                           (EXIT
                            (COND ((EQL |j| |md|) (LETT |alg_case2| 'T)))))))
                    (LETT |eqs|
                          (SPADCALL |eqs| (SPADCALL |rp| (QREFELT % 151))
                                    (QREFELT % 152)))
                    (LETT |lrl| (CONS |lf1| |lrl|))
                    (EXIT (LETT |rrl| (SPADCALL |rrl| |rf1| (QREFELT % 153)))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (COND
           ((> |d1| |d2|)
            (SEQ (LETT |j| (+ |md| 1)) (LETT #14# |d1|) G190
                 (COND ((> |j| #14#) (GO G191)))
                 (SEQ
                  (LETT |rp|
                        (SPADCALL
                         (SPADCALL (ELT % 110)
                                   (PROGN
                                    (LETT #13# NIL)
                                    (SEQ (LETT |rr1| NIL) (LETT #12# |rrl|)
                                         (LETT |lr1| NIL) (LETT #11# |lrl|)
                                         G190
                                         (COND
                                          ((OR (ATOM #11#)
                                               (PROGN
                                                (LETT |lr1| (CAR #11#))
                                                NIL)
                                               (ATOM #12#)
                                               (PROGN
                                                (LETT |rr1| (CAR #12#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #13#
                                                 (CONS
                                                  (SPADCALL |lr1| |rr1|
                                                            (QREFELT % 102))
                                                  #13#))))
                                         (LETT #11#
                                               (PROG1 (CDR #11#)
                                                 (LETT #12# (CDR #12#))))
                                         (GO G190) G191
                                         (EXIT (NREVERSE #13#))))
                                   (QREFELT % 154))
                         (QREFELT % 149)))
                  (COND
                   ((EQL (- |d| |j|) (|XPFACT;my_degree| |rs| %))
                    (SEQ (LETT |ts| (SPADCALL |rs| (QREFELT % 23)))
                         (LETT |rp|
                               (SPADCALL |rp|
                                         (|XPFACT;XDP_to_YDP|
                                          (|SPADfirst| |ts|) %)
                                         (QREFELT % 110)))
                         (EXIT (LETT |rs| (|SPADfirst| (CDR |ts|)))))))
                  (LETT |lf1| (SPADCALL |rp| |rw| (QREFELT % 104)))
                  (LETT |rp|
                        (SPADCALL |rp| (SPADCALL |lf1| |rfy| (QREFELT % 102))
                                  (QREFELT % 103)))
                  (LETT |eqs|
                        (SPADCALL |eqs| (SPADCALL |rp| (QREFELT % 151))
                                  (QREFELT % 152)))
                  (EXIT (LETT |lrl| (CONS |lf1| |lrl|))))
                 (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
          (LETT |rrl1| |rrl|)
          (COND
           ((> |d2| |d1|)
            (SEQ (LETT |j| (+ |md| 1)) (LETT #10# |d2|) G190
                 (COND ((> |j| #10#) (GO G191)))
                 (SEQ
                  (LETT |rp|
                        (SPADCALL
                         (SPADCALL (ELT % 110)
                                   (PROGN
                                    (LETT #9# NIL)
                                    (SEQ (LETT |rr1| NIL) (LETT #8# |rrl1|)
                                         (LETT |lr1| NIL) (LETT #7# |lrl|) G190
                                         (COND
                                          ((OR (ATOM #7#)
                                               (PROGN
                                                (LETT |lr1| (CAR #7#))
                                                NIL)
                                               (ATOM #8#)
                                               (PROGN
                                                (LETT |rr1| (CAR #8#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #9#
                                                 (CONS
                                                  (SPADCALL |lr1| |rr1|
                                                            (QREFELT % 102))
                                                  #9#))))
                                         (LETT #7#
                                               (PROG1 (CDR #7#)
                                                 (LETT #8# (CDR #8#))))
                                         (GO G190) G191 (EXIT (NREVERSE #9#))))
                                   (QREFELT % 154))
                         (QREFELT % 149)))
                  (COND
                   ((EQL (- |d| |j|) (|XPFACT;my_degree| |rs| %))
                    (SEQ (LETT |ts| (SPADCALL |rs| (QREFELT % 23)))
                         (LETT |rp|
                               (SPADCALL |rp|
                                         (|XPFACT;XDP_to_YDP|
                                          (|SPADfirst| |ts|) %)
                                         (QREFELT % 110)))
                         (EXIT (LETT |rs| (|SPADfirst| (CDR |ts|)))))))
                  (LETT |rf1| (SPADCALL |rp| |lw| (QREFELT % 98)))
                  (LETT |rf1|
                        (SPADCALL
                         (SPADCALL (|spadConstant| % 76) |lc| (QREFELT % 84))
                         |rf1| (QREFELT % 101)))
                  (LETT |rp|
                        (SPADCALL |rp| (SPADCALL |lfy| |rf1| (QREFELT % 102))
                                  (QREFELT % 103)))
                  (LETT |eqs|
                        (SPADCALL |eqs| (SPADCALL |rp| (QREFELT % 151))
                                  (QREFELT % 152)))
                  (LETT |rrl| (SPADCALL |rrl| |rf1| (QREFELT % 153)))
                  (EXIT
                   (LETT |rrl1|
                         (CDR (SPADCALL |rrl1| |rf1| (QREFELT % 153))))))
                 (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
          (SEQ (LETT |j| (+ (MAX |d1| |d2|) 1)) (LETT #6# |d|) G190
               (COND ((> |j| #6#) (GO G191)))
               (SEQ
                (LETT |rp|
                      (SPADCALL
                       (SPADCALL (ELT % 110)
                                 (PROGN
                                  (LETT #5# NIL)
                                  (SEQ (LETT |rr1| NIL) (LETT #4# |rrl1|)
                                       (LETT |lr1| NIL) (LETT #3# |lrl|) G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN (LETT |lr1| (CAR #3#)) NIL)
                                             (ATOM #4#)
                                             (PROGN
                                              (LETT |rr1| (CAR #4#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #5#
                                               (CONS
                                                (SPADCALL |lr1| |rr1|
                                                          (QREFELT % 102))
                                                #5#))))
                                       (LETT #3#
                                             (PROG1 (CDR #3#)
                                               (LETT #4# (CDR #4#))))
                                       (GO G190) G191 (EXIT (NREVERSE #5#))))
                                 (QREFELT % 154))
                       (QREFELT % 149)))
                (COND
                 ((EQL (- |d| |j|) (|XPFACT;my_degree| |rs| %))
                  (SEQ (LETT |ts| (SPADCALL |rs| (QREFELT % 23)))
                       (LETT |rp|
                             (SPADCALL |rp|
                                       (|XPFACT;XDP_to_YDP| (|SPADfirst| |ts|)
                                        %)
                                       (QREFELT % 110)))
                       (EXIT (LETT |rs| (|SPADfirst| (CDR |ts|)))))))
                (LETT |eqs|
                      (SPADCALL |eqs| (SPADCALL |rp| (QREFELT % 151))
                                (QREFELT % 152)))
                (EXIT (LETT |rrl1| (CDR |rrl1|))))
               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL |eqs|)
             (COND
              ((NULL |ls|)
               (SEQ
                (LETT |lf|
                      (SPADCALL |lf|
                                (|XPFACT;eval_YDP|
                                 (SPADCALL (ELT % 110) |lrl| (QREFELT % 154))
                                 NIL NIL %)
                                (QREFELT % 31)))
                (LETT |rf|
                      (SPADCALL |rf|
                                (|XPFACT;eval_YDP|
                                 (SPADCALL (ELT % 110) |rrl| (QREFELT % 154))
                                 NIL NIL %)
                                (QREFELT % 31)))
                (EXIT (CONS 0 (LIST |lf| |rf|)))))
              (#24='T (|error| "impossible"))))
            ((NULL |ls|) (CONS 2 "failed"))
            (|alg_case|
             (COND
              ((SPADCALL (LENGTH |ls|) 1 (QREFELT % 155))
               (|error| "impossible"))
              (#24#
               (SEQ (LETT |au| (|XPFACT;dc_fact11| |lf| |lrl| |eqs| %))
                    (EXIT
                     (COND ((QEQCAR |au| 1) (CONS 2 "failed"))
                           (#24# (CONS 1 (QCDR |au|)))))))))
            (#24#
             (SEQ
              (LETT |lsol|
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |eq| NIL) (LETT #1# |eqs|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |eq| (QREFELT % 88)) #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     |ls| (QREFELT % 159)))
              (LETT |sol| (|XPFACT;get_rational_solution| |lsol| |ls| %))
              (EXIT
               (COND
                ((NULL |sol|)
                 (COND
                  (|alg_case2|
                   (SEQ (LETT |alg_sym| (|SPADfirst| |ls|))
                        (LETT |ls| (CDR |ls|))
                        (LETT |solu|
                              (|XPFACT;get_algebraic_solution| |lsol| |alg_sym|
                               |ls| %))
                        (EXIT
                         (COND ((QEQCAR |solu| 1) (CONS 2 "failed"))
                               (#24#
                                (SEQ (LETT |solr| (QCDR |solu|))
                                     (EXIT
                                      (CONS 1
                                            (|XPFACT;dc_fact12| |lf| |lrl|
                                             (QCAR |solr|) (QCDR |solr|) |ls|
                                             %)))))))))
                  (#24# (CONS 2 "failed"))))
                (#24#
                 (SEQ
                  (LETT |lf|
                        (SPADCALL |lf|
                                  (|XPFACT;eval_YDP|
                                   (SPADCALL (ELT % 110) |lrl| (QREFELT % 154))
                                   |ls| |sol| %)
                                  (QREFELT % 31)))
                  (LETT |rf|
                        (SPADCALL |rf|
                                  (|XPFACT;eval_YDP|
                                   (SPADCALL (ELT % 110) |rrl| (QREFELT % 154))
                                   |ls| |sol| %)
                                  (QREFELT % 31)))
                  (EXIT (CONS 0 (LIST |lf| |rf|)))))))))))))) 

(SDEFUN |XPFACT;factor;XdpL;26|
        ((|p| (|XDistributedPolynomial| |vl| F))
         (% (|List| (|XDistributedPolynomial| |vl| F))))
        (SPROG
         ((|rf| #1=(|List| (|XDistributedPolynomial| |vl| F)))
          (|d| (|NonNegativeInteger|)) (#2=#:G345 NIL) (|rf0| #1#)
          (|p1| (|XDistributedPolynomial| |vl| F))
          (|lf| (|List| (|XDistributedPolynomial| |vl| F)))
          (|rs| #3=(|XDistributedPolynomial| |vl| F))
          (|ts| (|List| (|XDistributedPolynomial| |vl| F))) (|lc| (F))
          (|res| (|List| (|XDistributedPolynomial| |vl| F))) (#4=#:G357 NIL)
          (|d1| (|NonNegativeInteger|)) (#5=#:G342 NIL)
          (|pu| (|Union| (|XDistributedPolynomial| |vl| F) "failed"))
          (|f1| (|XDistributedPolynomial| |vl| F)) (#6=#:G340 NIL)
          (|fl| (|List| (|XDistributedPolynomial| |vl| F)))
          (|fu|
           (|Union| (|List| (|XDistributedPolynomial| |vl| F))
                    (|XDistributedPolynomial| |vl| F) "failed"))
          (|tp| #3#) (#7=#:G337 NIL) (|dd| (|Integer|)))
         (SEQ (LETT |dd| (|XPFACT;my_degree| |p| %))
              (EXIT
               (COND ((<= |dd| 1) (LIST |p|))
                     ('T
                      (SEQ
                       (LETT |d|
                             (PROG1 (LETT #7# |dd|)
                               (|check_subtype2| (>= #7# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #7#)))
                       (LETT |ts| (SPADCALL |p| (QREFELT % 23)))
                       (LETT |tp| (|SPADfirst| |ts|))
                       (LETT |rs| (|SPADfirst| (CDR |ts|)))
                       (LETT |lc| (SPADCALL |tp| (QREFELT % 25)))
                       (LETT |tp|
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 13) |lc|
                                        (QREFELT % 26))
                              |tp| (QREFELT % 28)))
                       (LETT |rf| (SPADCALL |tp| (QREFELT % 51)))
                       (LETT |rf0| |rf|) (LETT |lf| NIL) (LETT |res| NIL)
                       (SEQ
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ
                               (LETT |lf|
                                     (SPADCALL |lf| (|SPADfirst| |rf|)
                                               (QREFELT % 160)))
                               (LETT |rf| (CDR |rf|))
                               (EXIT
                                (COND
                                 ((NULL |rf|)
                                  (SEQ (LETT |res| (CONS |p| |res|))
                                       (EXIT
                                        (PROGN (LETT #4# 1) (GO #8=#:G353)))))
                                 ('T
                                  (SEQ
                                   (LETT |fu|
                                         (|XPFACT;dc_fact1| |d| |lc| |lf| |rf|
                                          |rs| %))
                                   (COND
                                    ((QEQCAR |fu| 0)
                                     (SEQ (LETT |fl| (QCDR |fu|))
                                          (LETT |res|
                                                (CONS (|SPADfirst| |fl|)
                                                      |res|))
                                          (LETT |p| (|SPADfirst| (CDR |fl|)))
                                          (LETT |ts|
                                                (SPADCALL |p| (QREFELT % 23)))
                                          (LETT |lc|
                                                (SPADCALL |p| (QREFELT % 25)))
                                          (LETT |d|
                                                (PROG1
                                                    (LETT #6#
                                                          (|XPFACT;my_degree|
                                                           |p| %))
                                                  (|check_subtype2| (>= #6# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #6#)))
                                          (LETT |rs| (|SPADfirst| (CDR |ts|)))
                                          (LETT |lf| NIL)
                                          (EXIT (LETT |rf0| |rf|)))))
                                   (EXIT
                                    (COND
                                     ((QEQCAR |fu| 1)
                                      (SEQ (LETT |f1| (QCDR |fu|))
                                           (LETT |pu|
                                                 (|XPFACT;lexquo| |p| |f1| %))
                                           (EXIT
                                            (COND
                                             ((QEQCAR |pu| 1)
                                              (|error| "lexquo(p, f1)"))
                                             ('T
                                              (SEQ (LETT |p1| (QCDR |pu|))
                                                   (LETT |d1|
                                                         (PROG1
                                                             (LETT #5#
                                                                   (|XPFACT;my_degree|
                                                                    |p1| %))
                                                           (|check_subtype2|
                                                            (>= #5# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #5#)))
                                                   (EXIT
                                                    (COND
                                                     ((EQL |d1| 0)
                                                      (SEQ
                                                       (LETT |res|
                                                             (CONS |p| |res|))
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #4# |$NoValue|)
                                                         (GO #8#)))))
                                                     ('T
                                                      (SEQ (LETT |p| |p1|)
                                                           (LETT |res|
                                                                 (CONS |f1|
                                                                       |res|))
                                                           (LETT |lc|
                                                                 (SPADCALL |p|
                                                                           (QREFELT
                                                                            %
                                                                            25)))
                                                           (LETT |ts|
                                                                 (SPADCALL |p|
                                                                           (QREFELT
                                                                            %
                                                                            23)))
                                                           (LETT |rs|
                                                                 (|SPADfirst|
                                                                  (CDR |ts|)))
                                                           (LETT |lf| NIL)
                                                           (SEQ G190
                                                                (COND
                                                                 ((NULL
                                                                   (> |d|
                                                                      |d1|))
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (LETT |p1|
                                                                       (|SPADfirst|
                                                                        |rf0|))
                                                                 (LETT |rf0|
                                                                       (CDR
                                                                        |rf0|))
                                                                 (EXIT
                                                                  (LETT |d|
                                                                        (PROG1
                                                                            (LETT
                                                                             #2#
                                                                             (-
                                                                              |d|
                                                                              (SPADCALL
                                                                               |p1|
                                                                               (QREFELT
                                                                                %
                                                                                15))))
                                                                          (|check_subtype2|
                                                                           (>=
                                                                            #2#
                                                                            0)
                                                                           '(|NonNegativeInteger|)
                                                                           '(|Integer|)
                                                                           #2#)))))
                                                                NIL (GO G190)
                                                                G191
                                                                (EXIT NIL))
                                                           (EXIT
                                                            (COND
                                                             ((< |d| |d1|)
                                                              (|error|
                                                               "d < d1"))
                                                             ('T
                                                              (LETT |rf|
                                                                    |rf0|)))))))))))))))))))))
                              NIL (GO G190) G191 (EXIT NIL)))
                        #8# (EXIT #4#))
                       (EXIT (REVERSE |res|))))))))) 

(DECLAIM (NOTINLINE |XPolynomialFactor;|)) 

(DEFUN |XPolynomialFactor;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|XPolynomialFactor| DV$1 DV$2))
          (LETT % (GETREFV 162))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|))))))
          (|haddProp| |$ConstructorCache| '|XPolynomialFactor| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 122 (SPADCALL (QREFELT % 121)))
             (QSETREFV % 161
                       (CONS (|dispatchFunction| |XPFACT;factor;XdpL;26|)
                             %)))))
          %))) 

(DEFUN |XPolynomialFactor| (&REST #1=#:G358)
  (SPROG NIL
         (PROG (#2=#:G359)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XPolynomialFactor|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XPolynomialFactor;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|XPolynomialFactor|)))))))))) 

(MAKEPROP '|XPolynomialFactor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (|XDistributedPolynomial| 6 7) (4 . |Zero|)
              (|Boolean|) (8 . =) (14 . |One|) (|NonNegativeInteger|)
              (18 . |degree|) (|Record| (|:| |k| 19) (|:| |c| 7)) (|List| 16)
              (23 . |listOfTerms|) (|FreeMonoid| 6) (28 . |length|)
              (33 . |construct|) (|List| 9) |XPFACT;top_split;XdpL;2|
              (38 . |maxdeg|) (43 . |leadingCoefficient|) (48 . /)
              (54 . |lquo|) (60 . *) (66 . *) (72 . -) (78 . +)
              (|Record| (|:| |quotient| 9) (|:| |remainder| 9))
              |XPFACT;ldivide;2XdpR;3| (84 . |rquo|) |XPFACT;rdivide;2XdpR;4|
              (90 . |One|) (94 . ~=)
              (|Record| (|:| |g| 9) (|:| |c1| 9) (|:| |c2| 9) (|:| |cu| 9)
                        (|:| |cv| 9))
              (|Union| 38 '"failed") |XPFACT;left_ext_GCD;2XdpU;6|
              (100 . |numberOfMonomials|) (105 . |One|) (109 . |first|)
              (114 . |coerce|) (119 . *) (125 . |rest|) (|Union| % '"failed")
              (130 . |exquo|) (|Integer|) (136 . ~=) |XPFACT;homo_fact;XdpL;8|
              (|Polynomial| 7) (142 . |coerce|)
              (|Record| (|:| |k| 19) (|:| |c| 52)) (|List| 54)
              (|XDistributedPolynomial| 6 52) (147 . |construct|)
              (152 . |listOfTerms|) (|List| 90) (|List| 7) (157 . |eval|)
              (164 . |ground|) (169 . =) (|SparseUnivariatePolynomial| 7)
              (175 . |Zero|) (179 . ~=) (185 . |leadingCoefficient|)
              (190 . |degree|) (195 . |coerce|) (200 . |reductum|)
              (|Fraction| 52) (205 . |numer|) (210 . |denom|) (|Equation| 71)
              (215 . |lhs|) (220 . |One|) (224 . ~=) (230 . |totalDegree|)
              (235 . |reductum|) (240 . |Zero|) (244 . |rhs|) (249 . |ground?|)
              (254 . |leadingCoefficient|) (259 . /) (|Fraction| 49)
              (265 . |One|) (269 . *) (275 . |coerce|) (280 . |variables|)
              (|Symbol|) (285 . ~=) (291 . -) (297 . =) (303 . |last|)
              (308 . |first|) (314 . |rest|) (320 . =) (326 . |lquo|)
              (332 . |Zero|) (336 . =) (342 . *) (348 . *) (354 . -)
              (360 . |rquo|) (366 . |maxdeg|) (371 . <) (377 . |new|)
              (381 . |monomial|) (388 . |coefficient|) (394 . +) (400 . +)
              (406 . >=) (412 . |lquo|) (418 . *) (424 . |rquo|) (430 . -)
              (436 . -) (442 . |One|) (446 . -) (|SingletonAsOrderedSet|)
              (451 . |create|) '|dummy| (455 . |univariate|) (|List| %)
              (460 . |gcd|) (|Factored| %) (465 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 128) (|:| |factor| 64) (|:| |exponent| 14))
              (|List| 129) (|Factored| 64) (470 . |factorList|) (|List| 49)
              (475 . |min|) (480 . |constant|) (485 . -) (490 . |coefficient|)
              (496 . |monomial|) (502 . |coerce|) (507 . |One|) (511 . /)
              (517 . -) (523 . *) (529 . |eval|) (|Mapping| 56 56 56)
              (|List| 56) (536 . |reduce|) (543 . |concat|) (549 . -)
              (|List| 52) (554 . |coefficients|) (559 . |concat|)
              (565 . |concat|) (571 . |reduce|) (577 . ~=) (|List| (|List| 74))
              (|List| 71) (|SystemSolvePackage| 7) (583 . |solve|)
              (589 . |concat|) (595 . |factor|))
           '#(|top_split| 600 |rdivide| 605 |left_ext_GCD| 611 |ldivide| 617
              |homo_fact| 623 |factor| 628)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|homo_fact|
                                 ((|List| (|XDistributedPolynomial| |#1| |#2|))
                                  (|XDistributedPolynomial| |#1| |#2|)))
                                T)
                              '((|top_split|
                                 ((|List| (|XDistributedPolynomial| |#1| |#2|))
                                  (|XDistributedPolynomial| |#1| |#2|)))
                                T)
                              '((|left_ext_GCD|
                                 ((|Union|
                                   (|Record|
                                    (|:| |g|
                                         (|XDistributedPolynomial| |#1| |#2|))
                                    (|:| |c1|
                                         (|XDistributedPolynomial| |#1| |#2|))
                                    (|:| |c2|
                                         (|XDistributedPolynomial| |#1| |#2|))
                                    (|:| |cu|
                                         (|XDistributedPolynomial| |#1| |#2|))
                                    (|:| |cv|
                                         (|XDistributedPolynomial| |#1| |#2|)))
                                   "failed")
                                  (|XDistributedPolynomial| |#1| |#2|)
                                  (|XDistributedPolynomial| |#1| |#2|)))
                                T)
                              '((|ldivide|
                                 ((|Record|
                                   (|:| |quotient|
                                        (|XDistributedPolynomial| |#1| |#2|))
                                   (|:| |remainder|
                                        (|XDistributedPolynomial| |#1| |#2|)))
                                  (|XDistributedPolynomial| |#1| |#2|)
                                  (|XDistributedPolynomial| |#1| |#2|)))
                                T)
                              '((|rdivide|
                                 ((|Record|
                                   (|:| |quotient|
                                        (|XDistributedPolynomial| |#1| |#2|))
                                   (|:| |remainder|
                                        (|XDistributedPolynomial| |#1| |#2|)))
                                  (|XDistributedPolynomial| |#1| |#2|)
                                  (|XDistributedPolynomial| |#1| |#2|)))
                                T)
                              '((|factor|
                                 ((|List| (|XDistributedPolynomial| |#1| |#2|))
                                  (|XDistributedPolynomial| |#1| |#2|)))
                                (|has| 7 (|PolynomialFactorizationExplicit|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 161
                                            '(0 7 0 8 0 9 0 10 2 9 11 0 0 12 0
                                              7 0 13 1 9 14 0 15 1 9 17 0 18 1
                                              19 14 0 20 1 9 0 17 21 1 9 19 0
                                              24 1 9 7 0 25 2 7 0 0 0 26 2 9 0
                                              0 19 27 2 9 0 7 0 28 2 9 0 0 0 29
                                              2 9 0 0 0 30 2 9 0 0 0 31 2 9 0 0
                                              19 34 0 9 0 36 2 9 11 0 0 37 1 9
                                              14 0 41 0 19 0 42 1 19 6 0 43 1
                                              19 0 6 44 2 19 0 0 0 45 1 19 0 0
                                              46 2 14 47 0 0 48 2 49 11 0 0 50
                                              1 52 0 7 53 1 56 0 55 57 1 56 55
                                              0 58 3 52 0 0 59 60 61 1 52 7 0
                                              62 2 7 11 0 0 63 0 64 0 65 2 64
                                              11 0 0 66 1 64 7 0 67 1 64 14 0
                                              68 1 9 0 7 69 1 64 0 0 70 1 71 52
                                              0 72 1 71 52 0 73 1 74 71 0 75 0
                                              52 0 76 2 52 11 0 0 77 1 52 14 0
                                              78 1 52 0 0 79 0 52 0 80 1 74 71
                                              0 81 1 52 11 0 82 1 52 7 0 83 2
                                              52 0 0 7 84 0 85 0 86 2 52 0 0 7
                                              87 1 71 0 52 88 1 52 59 0 89 2 90
                                              11 0 0 91 2 71 0 0 0 92 2 59 11 0
                                              0 93 1 22 9 0 94 2 22 0 0 14 95 2
                                              22 0 0 14 96 2 22 11 0 0 97 2 56
                                              0 0 19 98 0 56 0 99 2 56 11 0 0
                                              100 2 56 0 52 0 101 2 56 0 0 0
                                              102 2 56 0 0 0 103 2 56 0 0 19
                                              104 1 56 19 0 105 2 19 11 0 0 106
                                              0 90 0 107 3 52 0 0 90 14 108 2
                                              56 52 0 19 109 2 56 0 0 0 110 2
                                              52 0 0 0 111 2 19 11 0 0 112 2 19
                                              47 0 0 113 2 52 0 7 0 114 2 19 47
                                              0 0 115 2 7 0 0 0 116 2 52 0 0 0
                                              117 0 71 0 118 1 52 0 0 119 0 120
                                              0 121 1 52 64 0 123 1 64 0 124
                                              125 1 64 126 0 127 1 131 130 0
                                              132 1 133 49 0 134 1 56 52 0 135
                                              1 64 0 0 136 2 64 7 0 14 137 2 64
                                              0 7 14 138 1 64 0 7 139 0 64 0
                                              140 2 64 0 0 7 141 2 64 0 0 0 142
                                              2 64 0 7 0 143 3 64 0 0 120 0 144
                                              3 146 56 145 0 56 147 2 133 0 0
                                              49 148 1 56 0 0 149 1 56 150 0
                                              151 2 150 0 0 0 152 2 146 0 0 56
                                              153 2 146 56 145 0 154 2 14 11 0
                                              0 155 2 158 156 157 59 159 2 22 0
                                              0 9 160 1 0 22 9 161 1 0 22 9 23
                                              2 0 32 9 9 35 2 0 39 9 9 40 2 0
                                              32 9 9 33 1 0 22 9 51 1 1 22 9
                                              161)))))
           '|lookupComplete|)) 
