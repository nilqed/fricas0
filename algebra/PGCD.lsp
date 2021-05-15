
(SDEFUN |PGCD;failtest|
        ((|f| |SparseUnivariatePolynomial| P)
         (|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P) ($ |Boolean|))
        (COND ((QEQCAR (SPADCALL |p1| |f| (QREFELT $ 17)) 1) 'T)
              ('T (QEQCAR (SPADCALL |p2| |f| (QREFELT $ 17)) 1)))) 

(SDEFUN |PGCD;chooseVal|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P) (|lvr| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Union|
          (|Record| (|:| |lpol| (|List| (|SparseUnivariatePolynomial| R)))
                    (|:| |lint| (|List| (|List| R)))
                    (|:| |mpol| (|SparseUnivariatePolynomial| P)))
          "failed"))
        (SPROG
         ((|dd| (|NonNegativeInteger|)) (#1=#:G451 NIL) (#2=#:G442 NIL)
          (|f| (|Union| (|SparseUnivariatePolynomial| P) #3="failed"))
          (#4=#:G439 NIL)
          (|uterm|
           (|Record| (|:| |lpol| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |lint| (|List| (|List| R)))
                     (|:| |mpol| (|SparseUnivariatePolynomial| P))))
          (|ugcd| (|List| (|SparseUnivariatePolynomial| R))) (#5=#:G433 NIL)
          (|du| (|NonNegativeInteger|)) (|u| (|SparseUnivariatePolynomial| R))
          (|uf2| #6=(|SparseUnivariatePolynomial| R)) (|uf1| #6#)
          (|lval| (|List| R)) (#7=#:G453 NIL) (|i| NIL) (#8=#:G452 NIL)
          (|range| (|Integer|)) (|nvr| (|NonNegativeInteger|))
          (|d2| #9=(|NonNegativeInteger|)) (|d1| #9#))
         (SEQ
          (EXIT
           (SEQ (LETT |d1| (SPADCALL |p1| (QREFELT $ 19)))
                (LETT |d2| (SPADCALL |p2| (QREFELT $ 19))) (LETT |dd| 0)
                (LETT |nvr| (LENGTH |lvr|)) (LETT |lval| NIL) (LETT |range| 8)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |range| (* 2 |range|))
                           (LETT |lval|
                                 (PROGN
                                  (LETT #8# NIL)
                                  (SEQ (LETT |i| 1) (LETT #7# |nvr|) G190
                                       (COND
                                        ((|greater_SI| |i| #7#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #8#
                                               (CONS
                                                (SPADCALL |range|
                                                          (QREFELT $ 21))
                                                #8#))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT (NREVERSE #8#)))))
                           (EXIT
                            (COND
                             ((SPADCALL |lval| |ltry| (QREFELT $ 25))
                              "new point")
                             ('T
                              (SEQ (LETT |ltry| (CONS |lval| |ltry|))
                                   (LETT |uf1|
                                         (SPADCALL |p1| |lvr| |lval|
                                                   (QREFELT $ 28)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL (SPADCALL |uf1| (QREFELT $ 29))
                                                |d1| (QREFELT $ 30))
                                      "new point")
                                     ('T
                                      (SEQ
                                       (LETT |uf2|
                                             (SPADCALL |p2| |lvr| |lval|
                                                       (QREFELT $ 28)))
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |uf2| (QREFELT $ 29)) |d2|
                                           (QREFELT $ 30))
                                          "new point")
                                         ('T
                                          (SEQ
                                           (LETT |u|
                                                 (SPADCALL |uf1| |uf2|
                                                           (QREFELT $ 31)))
                                           (LETT |du|
                                                 (SPADCALL |u| (QREFELT $ 29)))
                                           (COND
                                            ((EQL |du| 0)
                                             (PROGN
                                              (LETT #1#
                                                    (CONS 0
                                                          (VECTOR
                                                           (LIST
                                                            (|spadConstant| $
                                                                            34))
                                                           |ltry|
                                                           (|spadConstant| $
                                                                           35))))
                                              (GO #10=#:G450))))
                                           (LETT |ugcd|
                                                 (LIST |u|
                                                       (PROG2
                                                           (LETT #5#
                                                                 (SPADCALL
                                                                  |uf1| |u|
                                                                  (QREFELT $
                                                                           36)))
                                                           (QCDR #5#)
                                                         (|check_union2|
                                                          (QEQCAR #5# 0)
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 8))
                                                          (|Union|
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 8))
                                                           #3#)
                                                          #5#))
                                                       (PROG2
                                                           (LETT #5#
                                                                 (SPADCALL
                                                                  |uf2| |u|
                                                                  (QREFELT $
                                                                           36)))
                                                           (QCDR #5#)
                                                         (|check_union2|
                                                          (QEQCAR #5# 0)
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 8))
                                                          (|Union|
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 8))
                                                           #3#)
                                                          #5#))))
                                           (LETT |uterm|
                                                 (VECTOR |ugcd| |ltry|
                                                         (|spadConstant| $
                                                                         35)))
                                           (EXIT
                                            (COND
                                             ((EQL |dd| 0) (LETT |dd| |du|))
                                             ((EQL |du| |dd|)
                                              (COND
                                               ((EQL |dd| |d1|)
                                                (SEQ
                                                 (SEQ
                                                  (LETT |f|
                                                        (SPADCALL |p2| |p1|
                                                                  (QREFELT $
                                                                           17)))
                                                  (EXIT
                                                   (COND
                                                    ((NULL (QEQCAR |f| 1))
                                                     (PROGN
                                                      (LETT #1#
                                                            (CONS 0
                                                                  (VECTOR
                                                                   (LIST |u|)
                                                                   |ltry|
                                                                   |p1|)))
                                                      (GO #10#))))))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |dd| |d2|
                                                              (QREFELT $ 30))
                                                    (LETT |dd|
                                                          (PROG1
                                                              (LETT #4#
                                                                    (- |dd| 1))
                                                            (|check_subtype2|
                                                             (>= #4# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|)
                                                             #4#))))))))
                                               ((EQL |dd| |d2|)
                                                (SEQ
                                                 (SEQ
                                                  (LETT |f|
                                                        (SPADCALL |p1| |p2|
                                                                  (QREFELT $
                                                                           17)))
                                                  (EXIT
                                                   (COND
                                                    ((NULL (QEQCAR |f| 1))
                                                     (PROGN
                                                      (LETT #1#
                                                            (CONS 0
                                                                  (VECTOR
                                                                   (LIST |u|)
                                                                   |ltry|
                                                                   |p2|)))
                                                      (GO #10#))))))
                                                 (EXIT
                                                  (LETT |dd|
                                                        (PROG1
                                                            (LETT #2#
                                                                  (- |dd| 1))
                                                          (|check_subtype2|
                                                           (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|)
                                                           #2#))))))
                                               ('T
                                                (PROGN
                                                 (LETT #1# (CONS 0 |uterm|))
                                                 (GO #10#)))))
                                             ((< |du| |dd|)
                                              (LETT |dd| |du|)))))))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #10# (EXIT #1#)))) 

(SDEFUN |PGCD;good|
        ((|f| |SparseUnivariatePolynomial| P) (|lvr| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |upol| (|SparseUnivariatePolynomial| R))
          (|:| |inval| (|List| (|List| R)))))
        (SPROG
         ((#1=#:G461 NIL) (|uf| (|SparseUnivariatePolynomial| R))
          (|lval| (|List| R)) (#2=#:G463 NIL) (|i| NIL) (#3=#:G462 NIL)
          (|range| (|Integer|)) (|nvr| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nvr| (LENGTH |lvr|)) (LETT |range| 1)
                (EXIT
                 (SEQ G190 (COND ((NULL 'T) (GO G191)))
                      (SEQ (LETT |range| (* 2 |range|))
                           (LETT |lval|
                                 (PROGN
                                  (LETT #3# NIL)
                                  (SEQ (LETT |i| 1) (LETT #2# |nvr|) G190
                                       (COND
                                        ((|greater_SI| |i| #2#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #3#
                                               (CONS
                                                (SPADCALL |range|
                                                          (QREFELT $ 21))
                                                #3#))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT (NREVERSE #3#)))))
                           (EXIT
                            (COND
                             ((SPADCALL |lval| |ltry| (QREFELT $ 25))
                              "new point")
                             ('T
                              (SEQ (LETT |ltry| (CONS |lval| |ltry|))
                                   (LETT |uf|
                                         (SPADCALL |f| |lvr| |lval|
                                                   (QREFELT $ 28)))
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL
                                        (SPADCALL |uf|
                                                  (SPADCALL |uf|
                                                            (QREFELT $ 39))
                                                  (QREFELT $ 31))
                                        (QREFELT $ 29))
                                       0)
                                      (PROGN
                                       (LETT #1# (CONS |uf| |ltry|))
                                       (GO #4=#:G460))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #1#)))) 

(SDEFUN |PGCD;imposelc|
        ((|lipol| |List| (|SparseUnivariatePolynomial| R)) (|lvar| |List| OV)
         (|lval| |List| R) (|leadc| |List| P)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| R)) "failed"))
        (SPROG
         ((|result| (|List| (|SparseUnivariatePolynomial| R))) (#1=#:G474 NIL)
          (|p1u| (|Union| (|SparseUnivariatePolynomial| R) "failed"))
          (|p1| (|SparseUnivariatePolynomial| R)) (#2=#:G475 NIL) (|pol| NIL)
          (#3=#:G476 NIL) (|leadpol| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |result| NIL)
                (SEQ (LETT |leadpol| NIL) (LETT #3# |leadc|) (LETT |pol| NIL)
                     (LETT #2# |lipol|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |pol| (CAR #2#)) NIL)
                           (ATOM #3#) (PROGN (LETT |leadpol| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |p1|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL |leadpol| |lvar| |lval| (QREFELT $ 40))
                              (QREFELT $ 41))
                             |pol| (QREFELT $ 42)))
                      (LETT |p1u|
                            (SPADCALL |p1| (SPADCALL |pol| (QREFELT $ 43))
                                      (QREFELT $ 44)))
                      (EXIT
                       (COND
                        ((QEQCAR |p1u| 1)
                         (PROGN (LETT #1# (CONS 1 "failed")) (GO #4=#:G473)))
                        ('T (LETT |result| (CONS (QCDR |p1u|) |result|))))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (REVERSE |result|)))))
          #4# (EXIT #1#)))) 

(SDEFUN |PGCD;notCoprime|
        ((|g| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         (|ldeg| |List| (|NonNegativeInteger|)) (|lvar1| |List| OV)
         (|ltry| |List| (|List| R)) ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|lval| (|List| R)) (|ul| #1=(|SparseUnivariatePolynomial| R))
          (|newchoice|
           (|Record| (|:| |upol| (|SparseUnivariatePolynomial| R))
                     (|:| |inval| (|List| (|List| R)))))
          (#2=#:G491 NIL)
          (|resu| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (|ug2| #1#) (|ug1| #1#) (|lcpol| (|List| P))
          (|dp2l| #3=(|NonNegativeInteger|)) (|dg1| #3#)
          (|p2l| (|SparseUnivariatePolynomial| P)) (#4=#:G478 NIL) (|dl| #3#)
          (#5=#:G490 NIL)
          (|p2u| (|Union| (|SparseUnivariatePolynomial| P) #6="failed"))
          (|l| #7=(|SparseUnivariatePolynomial| P))
          (|#G30|
           (|Record| (|:| |locgcd| #7#) (|:| |goodint| (|List| (|List| R)))))
          (|l1| (|SparseUnivariatePolynomial| P))
          (|g1| (|SparseUnivariatePolynomial| P)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g1|
                  (SPADCALL |g| (SPADCALL |g| (QREFELT $ 45)) (QREFELT $ 46)))
            (LETT |l1|
                  (PROG2 (LETT #4# (SPADCALL |g| |g1| (QREFELT $ 17)))
                      (QCDR #4#)
                    (|check_union2| (QEQCAR #4# 0)
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 9))
                                    (|Union|
                                     (|SparseUnivariatePolynomial|
                                      (QREFELT $ 9))
                                     #6#)
                                    #4#)))
            (SEQ
             (EXIT
              (SEQ G190 NIL
                   (SEQ
                    (PROGN
                     (LETT |#G30| (|PGCD;localgcd| |l1| |p2| |lvar1| |ltry| $))
                     (LETT |l| (QCAR |#G30|))
                     (LETT |ltry| (QCDR |#G30|))
                     |#G30|)
                    (LETT |p2u| (SPADCALL |p2| |l| (QREFELT $ 17)))
                    (EXIT
                     (COND
                      ((NULL (QEQCAR |p2u| 1))
                       (PROGN (LETT #5# |$NoValue|) (GO #8=#:G482))))))
                   NIL (GO G190) G191 (EXIT NIL)))
             #8# (EXIT #5#))
            (LETT |lval| (|SPADfirst| |ltry|))
            (LETT |dl| (SPADCALL |l| (QREFELT $ 19)))
            (LETT |p2l|
                  (PROG2 (LETT #4# |p2u|)
                      (QCDR #4#)
                    (|check_union2| (QEQCAR #4# 0)
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 9))
                                    (|Union|
                                     (|SparseUnivariatePolynomial|
                                      (QREFELT $ 9))
                                     #6#)
                                    #4#)))
            (LETT |ul| (SPADCALL |l| |lvar1| |lval| (QREFELT $ 28)))
            (LETT |dg1| (SPADCALL |g1| (QREFELT $ 19)))
            (LETT |dp2l| (SPADCALL |p2l| (QREFELT $ 19)))
            (LETT |lcpol|
                  (LIST (SPADCALL |g1| (QREFELT $ 47))
                        (SPADCALL |p2| (QREFELT $ 47))))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (COND
                    ((EQL |dl| (SPADCALL |ul| (QREFELT $ 29)))
                     (COND
                      ((EQL
                        (SPADCALL
                         (SPADCALL |ul| (SPADCALL |ul| (QREFELT $ 39))
                                   (QREFELT $ 31))
                         (QREFELT $ 29))
                        0)
                       (SEQ
                        (LETT |ug1|
                              (SPADCALL |g1| |lvar1| |lval| (QREFELT $ 28)))
                        (LETT |ug2|
                              (SPADCALL |p2l| |lvar1| |lval| (QREFELT $ 28)))
                        (LETT |resu|
                              (|PGCD;not_coprime2| |l| |ul| (LIST |ug1| |ug2|)
                               |lcpol| |ldeg| |lvar1| |lval| $))
                        (EXIT
                         (COND
                          ((QEQCAR |resu| 0)
                           (PROGN
                            (LETT #2# (QCDR |resu|))
                            (GO #9=#:G489))))))))))
                   (LETT |newchoice| (|PGCD;good| |l| |lvar1| |ltry| $))
                   (LETT |ul| (QCAR |newchoice|))
                   (LETT |ltry| (QCDR |newchoice|))
                   (EXIT (LETT |lval| (|SPADfirst| |ltry|))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #9# (EXIT #2#)))) 

(SDEFUN |PGCD;not_coprime2|
        ((|l| . #1=(|SparseUnivariatePolynomial| P))
         (|ul| |SparseUnivariatePolynomial| R)
         (|ulist| |List| (|SparseUnivariatePolynomial| R)) (|lcpol| |List| P)
         (|ldeg| |List| (|NonNegativeInteger|)) (|lvar1| |List| OV)
         (|lval| |List| R)
         ($ |Union| (|SparseUnivariatePolynomial| P) "failed"))
        (SPROG
         ((#2=#:G497 NIL) (#3=#:G509 NIL) (|uf| NIL) (#4=#:G508 NIL)
          (|gd1| #1#) (#5=#:G507 NIL)
          (|gdl| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (|lgcd| (P)) (|lquo| (|SparseUnivariatePolynomial| R))
          (|d| (|SparseUnivariatePolynomial| R)))
         (SEQ
          (EXIT
           (SEQ (LETT |gd1| |l|)
                (EXIT
                 (SEQ G190 (COND ((NULL 'T) (GO G191)))
                      (SEQ
                       (LETT |d| (SPADCALL (CONS |ul| |ulist|) (QREFELT $ 49)))
                       (COND
                        ((EQL (SPADCALL |d| (QREFELT $ 29)) 0)
                         (PROGN (LETT #5# (CONS 0 |gd1|)) (GO #6=#:G506))))
                       (LETT |lquo|
                             (PROG2
                                 (LETT #2# (SPADCALL |ul| |d| (QREFELT $ 36)))
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 8))
                                               (|Union|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 8))
                                                #7="failed")
                                               #2#)))
                       (COND
                        ((SPADCALL (SPADCALL |lquo| (QREFELT $ 29)) 0
                                   (QREFELT $ 30))
                         (SEQ
                          (LETT |lgcd|
                                (SPADCALL
                                 (CONS (SPADCALL |l| (QREFELT $ 47)) |lcpol|)
                                 (QREFELT $ 51)))
                          (LETT |gdl|
                                (|PGCD;lift| |l| |d| |lquo| |lgcd| |lvar1|
                                 |ldeg| |lval| $))
                          (EXIT
                           (COND
                            ((QEQCAR |gdl| 1)
                             (PROGN (LETT #5# (CONS 1 "failed")) (GO #6#)))
                            ('T
                             (SEQ (LETT |l| (QCDR |gdl|))
                                  (EXIT
                                   (LETT |ul|
                                         (SPADCALL |l| |lvar1| |lval|
                                                   (QREFELT $ 28)))))))))))
                       (LETT |gd1| (SPADCALL |gd1| |l| (QREFELT $ 52)))
                       (EXIT
                        (LETT |ulist|
                              (PROGN
                               (LETT #4# NIL)
                               (SEQ (LETT |uf| NIL) (LETT #3# |ulist|) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |uf| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (PROG2
                                                 (LETT #2#
                                                       (SPADCALL |uf| |d|
                                                                 (QREFELT $
                                                                          36)))
                                                 (QCDR #2#)
                                               (|check_union2| (QEQCAR #2# 0)
                                                               (|SparseUnivariatePolynomial|
                                                                (QREFELT $ 8))
                                                               (|Union|
                                                                (|SparseUnivariatePolynomial|
                                                                 (QREFELT $ 8))
                                                                #7#)
                                                               #2#))
                                             #4#))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT (NREVERSE #4#)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #5#)))) 

(SDEFUN |PGCD;gcdPrimitive;3Sup;7|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#1=#:G521 NIL) (|ltry| (|List| (|List| R)))
          (|result| #2=(|SparseUnivariatePolynomial| P))
          (|#G45|
           (|Record| (|:| |locgcd| #2#) (|:| |goodint| (|List| (|List| R)))))
          (|lvar| (|List| OV)) (|d2| #3=(|NonNegativeInteger|)) (|d1| #3#)
          (|#G44| #3#) (|#G43| #3#) (|#G42| (|SparseUnivariatePolynomial| P))
          (|#G41| (|SparseUnivariatePolynomial| P)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |d1| (SPADCALL |p1| (QREFELT $ 19)))
                 (LETT |d2| (SPADCALL |p2| (QREFELT $ 19)))
                 (EXIT
                  (COND
                   ((> |d1| |d2|)
                    (SEQ
                     (PROGN
                      (LETT |#G41| |p2|)
                      (LETT |#G42| |p1|)
                      (LETT |p1| |#G41|)
                      (LETT |p2| |#G42|))
                     (EXIT
                      (PROGN
                       (LETT |#G43| |d2|)
                       (LETT |#G44| |d1|)
                       (LETT |d1| |#G43|)
                       (LETT |d2| |#G44|))))))))
            (EXIT
             (COND
              ((EQL (SPADCALL |p1| (QREFELT $ 19)) 0)
               (COND
                ((SPADCALL |p1| (|spadConstant| $ 35) (QREFELT $ 53))
                 (SPADCALL |p2| (QREFELT $ 54)))
                (#4='T (SPADCALL |p1| (QREFELT $ 54)))))
              (#4#
               (SEQ
                (LETT |lvar|
                      (SPADCALL (ELT $ 55)
                                (SPADCALL (SPADCALL |p1| (QREFELT $ 56))
                                          (SPADCALL |p2| (QREFELT $ 56))
                                          (QREFELT $ 57))
                                (QREFELT $ 59)))
                (EXIT
                 (COND
                  ((NULL |lvar|)
                   (SPADCALL
                    (SPADCALL (SPADCALL |p1| (QREFELT $ 60))
                              (SPADCALL |p2| (QREFELT $ 60)) (QREFELT $ 31))
                    (QREFELT $ 61)))
                  ((QEQCAR (SPADCALL |p2| |p1| (QREFELT $ 17)) 0)
                   (SPADCALL |p1| (QREFELT $ 54)))
                  (#4#
                   (SEQ (LETT |ltry| NIL)
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ
                               (PROGN
                                (LETT |#G45|
                                      (|PGCD;localgcd| |p1| |p2| |lvar| |ltry|
                                       $))
                                (LETT |result| (QCAR |#G45|))
                                (LETT |ltry| (QCDR |#G45|))
                                |#G45|)
                               (EXIT
                                (COND
                                 ((SPADCALL |result| (|spadConstant| $ 62)
                                            (QREFELT $ 53))
                                  (PROGN
                                   (LETT #1# (|spadConstant| $ 62))
                                   (GO #5=#:G520)))
                                 ((NULL (|PGCD;failtest| |result| |p1| |p2| $))
                                  (PROGN (LETT #1# |result|) (GO #5#))))))
                              NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PGCD;localgcd|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |locgcd| (|SparseUnivariatePolynomial| P))
          (|:| |goodint| (|List| (|List| R)))))
        (SPROG
         ((#1=#:G527 NIL)
          (|h|
           (|Union| (|:| |s| (|SparseUnivariatePolynomial| P))
                    (|:| |failed| #2="failed")
                    (|:| |notCoprime| #3="notCoprime")))
          (|ldeg| (|List| (|NonNegativeInteger|)))
          (|dd| (|NonNegativeInteger|)) (|ud| (|SparseUnivariatePolynomial| R))
          (|listpol| (|List| (|SparseUnivariatePolynomial| R)))
          (|uterm|
           (|Record| (|:| |lpol| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |lint| (|List| (|List| R)))
                     (|:| |mpol| (|SparseUnivariatePolynomial| P))))
          (#4=#:G429 NIL))
         (SEQ
          (LETT |uterm|
                (PROG2 (LETT #4# (|PGCD;chooseVal| |p1| |p2| |lvar| |ltry| $))
                    (QCDR #4#)
                  (|check_union2| (QEQCAR #4# 0)
                                  (|Record|
                                   (|:| |lpol|
                                        (|List|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 8))))
                                   (|:| |lint| (|List| (|List| (QREFELT $ 8))))
                                   (|:| |mpol|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 9))))
                                  (|Union|
                                   (|Record|
                                    (|:| |lpol|
                                         (|List|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 8))))
                                    (|:| |lint|
                                         (|List| (|List| (QREFELT $ 8))))
                                    (|:| |mpol|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 9))))
                                   "failed")
                                  #4#)))
          (LETT |ltry| (QVELT |uterm| 1)) (LETT |listpol| (QVELT |uterm| 0))
          (LETT |ud| (|SPADfirst| |listpol|))
          (LETT |dd| (SPADCALL |ud| (QREFELT $ 29)))
          (EXIT
           (COND ((EQL |dd| 0) (CONS (|spadConstant| $ 62) |ltry|))
                 ((OR (EQL |dd| (SPADCALL |p1| (QREFELT $ 19)))
                      (EQL |dd| (SPADCALL |p2| (QREFELT $ 19))))
                  (CONS (QVELT |uterm| 2) |ltry|))
                 ('T
                  (SEQ
                   (LETT |ldeg|
                         (SPADCALL (ELT $ 64)
                                   (SPADCALL |p1| |lvar| (QREFELT $ 66))
                                   (SPADCALL |p2| |lvar| (QREFELT $ 66))
                                   (QREFELT $ 68)))
                   (LETT |h| (|PGCD;lift?| |p1| |p2| |uterm| |ldeg| |lvar| $))
                   (EXIT
                    (COND
                     ((QEQCAR |h| 2)
                      (CONS
                       (|PGCD;notCoprime| |p1| |p2| |ldeg| |lvar| |ltry| $)
                       |ltry|))
                     ((QEQCAR |h| 1)
                      (|PGCD;localgcd| |p1| |p2| |lvar| |ltry| $))
                     ('T
                      (CONS
                       (PROG2 (LETT #1# |h|)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0)
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 9))
                                         (|Union|
                                          (|:| |s|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 9)))
                                          (|:| |failed| #2#)
                                          (|:| |notCoprime| #3#))
                                         #1#))
                       |ltry|))))))))))) 

(SDEFUN |PGCD;monomContent|
        ((|p| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG ((|md| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL |p| (QREFELT $ 19)) 0) (|spadConstant| $ 62))
                 ('T
                  (SEQ (LETT |md| (SPADCALL |p| (QREFELT $ 69)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |p| (QREFELT $ 70))
                                   (QREFELT $ 51))
                         |md| (QREFELT $ 71))))))))) 

(SDEFUN |PGCD;better| ((|p1| P) (|p2| P) ($ |Boolean|))
        (SPROG ((#1=#:G537 NIL))
               (COND ((SPADCALL |p1| (QREFELT $ 72)) 'T)
                     ((SPADCALL |p2| (QREFELT $ 72)) NIL)
                     ('T
                      (<
                       (SPADCALL |p1|
                                 (PROG2
                                     (LETT #1# (SPADCALL |p1| (QREFELT $ 74)))
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7)
                                                            #2="failed")
                                                   #1#))
                                 (QREFELT $ 75))
                       (SPADCALL |p2|
                                 (PROG2
                                     (LETT #1# (SPADCALL |p2| (QREFELT $ 74)))
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7) #2#)
                                                   #1#))
                                 (QREFELT $ 75))))))) 

(SDEFUN |PGCD;best_to_front| ((|l| |List| P) ($ |List| P))
        (SPROG ((|ress| (|List| P)) (|best| (P)) (#1=#:G547 NIL) (|p| NIL))
               (SEQ (LETT |ress| NIL) (LETT |best| (|SPADfirst| |l|))
                    (SEQ (LETT |p| NIL) (LETT #1# (CDR |l|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|PGCD;better| |p| |best| $)
                             (SEQ (LETT |ress| (CONS |best| |ress|))
                                  (EXIT (LETT |best| |p|))))
                            ('T (LETT |ress| (CONS |p| |ress|))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS |best| |ress|))))) 

(SDEFUN |PGCD;gcdTermList| ((|p1| P) (|p2| P) ($ P))
        (SPROG
         ((|q| (P)) (#1=#:G554 NIL) (|term| NIL) (#2=#:G555 NIL)
          (|termList| (|List| P)) (#3=#:G549 NIL))
         (SEQ
          (LETT |termList|
                (|PGCD;best_to_front|
                 (CONS |p1|
                       (SPADCALL
                        (SPADCALL |p2|
                                  (PROG2
                                      (LETT #3# (SPADCALL |p2| (QREFELT $ 74)))
                                      (QCDR #3#)
                                    (|check_union2| (QEQCAR #3# 0)
                                                    (QREFELT $ 7)
                                                    (|Union| (QREFELT $ 7)
                                                             "failed")
                                                    #3#))
                                  (QREFELT $ 77))
                        (QREFELT $ 70)))
                 $))
          (LETT |q| (|SPADfirst| |termList|))
          (SEQ (LETT #2# NIL) (LETT |term| NIL) (LETT #1# (CDR |termList|))
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL) #2#)
                 (GO G191)))
               (SEQ (EXIT (LETT |q| (SPADCALL |q| |term| (QREFELT $ 78)))))
               (LETT #1#
                     (PROG1 (CDR #1#)
                       (LETT #2#
                             (SPADCALL |q| (|spadConstant| $ 38)
                                       (QREFELT $ 79)))))
               (GO G190) G191 (EXIT NIL))
          (EXIT |q|)))) 

(SDEFUN |PGCD;gcd;3Sup;13|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#1=#:G493 NIL) (|c2| #2=(|SparseUnivariatePolynomial| P)) (|c1| #2#)
          (|#G63| (|SparseUnivariatePolynomial| P))
          (|#G62| (|SparseUnivariatePolynomial| P)))
         (SEQ
          (COND
           ((> (SPADCALL |p1| (QREFELT $ 19)) (SPADCALL |p2| (QREFELT $ 19)))
            (PROGN
             (LETT |#G62| |p2|)
             (LETT |#G63| |p1|)
             (LETT |p1| |#G62|)
             (LETT |p2| |#G63|))))
          (EXIT
           (COND
            ((EQL (SPADCALL |p1| (QREFELT $ 19)) 0)
             (COND
              ((SPADCALL |p1| (|spadConstant| $ 35) (QREFELT $ 53))
               (SPADCALL |p2| (QREFELT $ 54)))
              ((SPADCALL |p1| (|spadConstant| $ 62) (QREFELT $ 53))
               (SPADCALL |p1| (QREFELT $ 54)))
              (#3='T
               (SPADCALL
                (SPADCALL (SPADCALL |p1| (QREFELT $ 47))
                          (SPADCALL |p2| (QREFELT $ 80)) (QREFELT $ 78))
                (QREFELT $ 81)))))
            ((SPADCALL (SPADCALL |p1| (QREFELT $ 82)) (|spadConstant| $ 35)
                       (QREFELT $ 53))
             (|PGCD;gcdMonom| |p1| (|PGCD;monomContent| |p2| $) $))
            (#3#
             (SEQ (LETT |c1| (|PGCD;monomContent| |p1| $))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |p2| (QREFELT $ 82))
                               (|spadConstant| $ 35) (QREFELT $ 53))
                     (|PGCD;gcdMonom| |c1| |p2| $))
                    (#3#
                     (SEQ (LETT |c2| (|PGCD;monomContent| |p2| $))
                          (LETT |p1|
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL |p1| |c1| (QREFELT $ 17)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 9))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 9))
                                                   #4="failed")
                                                  #1#)))
                          (LETT |p2|
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL |p2| |c2| (QREFELT $ 17)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 9))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 9))
                                                   #4#)
                                                  #1#)))
                          (EXIT
                           (SPADCALL (SPADCALL |p1| |p2| (QREFELT $ 63))
                                     (|PGCD;gcdMonom| |c1| |c2| $)
                                     (QREFELT $ 52)))))))))))))) 

(SDEFUN |PGCD;gcdMonom|
        ((|m1| |SparseUnivariatePolynomial| P)
         (|m2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPADCALL
         (SPADCALL (SPADCALL |m1| (QREFELT $ 47))
                   (SPADCALL |m2| (QREFELT $ 47)) (QREFELT $ 78))
         (MIN (SPADCALL |m1| (QREFELT $ 19)) (SPADCALL |m2| (QREFELT $ 19)))
         (QREFELT $ 71))) 

(SDEFUN |PGCD;lift?|
        ((|p1| . #1=(|SparseUnivariatePolynomial| P))
         (|p2| |SparseUnivariatePolynomial| P)
         (|uterm| |Record|
          (|:| |lpol| (|List| (|SparseUnivariatePolynomial| R)))
          (|:| |lint| (|List| (|List| R)))
          (|:| |mpol| (|SparseUnivariatePolynomial| P)))
         (|ldeg| |List| (|NonNegativeInteger|)) (|lvar| |List| OV)
         ($ |Union| (|:| |s| (|SparseUnivariatePolynomial| P))
          (|:| |failed| #2="failed") (|:| |notCoprime| #3="notCoprime")))
        (SPROG
         ((|l| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (|lgcd| (P)) (#4=#:G570 NIL) (|f| #1#)
          (|uf| (|SparseUnivariatePolynomial| R))
          (|listpol| #5=(|List| (|SparseUnivariatePolynomial| R)))
          (|d| (|SparseUnivariatePolynomial| R)) (|lval| #6=(|List| R))
          (|#G72| #6#) (|#G71| #5#))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G71| (QVELT |uterm| 0))
             (LETT |#G72| (|SPADfirst| (QVELT |uterm| 1)))
             (LETT |listpol| |#G71|)
             (LETT |lval| |#G72|))
            (LETT |d| (|SPADfirst| |listpol|)) (LETT |listpol| (CDR |listpol|))
            (LETT |uf| (SPADCALL |listpol| 1 (QREFELT $ 84))) (LETT |f| |p1|)
            (COND
             ((SPADCALL
               (SPADCALL (SPADCALL |uf| |d| (QREFELT $ 31)) (QREFELT $ 29)) 0
               (QREFELT $ 30))
              (SEQ (LETT |uf| (SPADCALL |listpol| 2 (QREFELT $ 84)))
                   (LETT |f| |p2|)
                   (EXIT
                    (COND
                     ((SPADCALL
                       (SPADCALL (SPADCALL |uf| |d| (QREFELT $ 31))
                                 (QREFELT $ 29))
                       0 (QREFELT $ 30))
                      (PROGN (LETT #4# (CONS 2 #3#)) (GO #7=#:G569))))))))
            (LETT |lgcd|
                  (SPADCALL (SPADCALL |p1| (QREFELT $ 47))
                            (SPADCALL |p2| (QREFELT $ 47)) (QREFELT $ 78)))
            (LETT |l| (|PGCD;lift| |f| |d| |uf| |lgcd| |lvar| |ldeg| |lval| $))
            (EXIT
             (COND ((QEQCAR |l| 1) (CONS 1 #2#)) ('T (CONS 0 (QCDR |l|)))))))
          #7# (EXIT #4#)))) 

(SDEFUN |PGCD;lift|
        ((|f| |SparseUnivariatePolynomial| P)
         (|d| |SparseUnivariatePolynomial| R)
         (|uf| |SparseUnivariatePolynomial| R) (|lgcd| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|)) (|lval| |List| R)
         ($ |Union| (|SparseUnivariatePolynomial| P) "failed"))
        (SPROG
         ((|p1| #1=(|SparseUnivariatePolynomial| P))
          (|p0| #2=(|SparseUnivariatePolynomial| P)) (|#G85| #2#) (|#G84| #1#)
          (|#G83| #1#) (|#G82| #2#)
          (|plist| (|List| (|SparseUnivariatePolynomial| P)))
          (|pl| (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|lg| (|List| (|SparseUnivariatePolynomial| R)))
          (|lgu| (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed"))
          (|leadlist| (|List| P))
          (|du| (|Union| (|SparseUnivariatePolynomial| R) "failed"))
          (|lgcd1| (R)) (|lcd| (R)) (#3=#:G588 NIL) (|n0| NIL) (#4=#:G589 NIL)
          (|n1| NIL) (#5=#:G587 NIL) (|leadpol| (|Boolean|))
          (|df| (|NonNegativeInteger|)) (|lcf| (P)))
         (SEQ (LETT |leadpol| NIL) (LETT |lcf| (SPADCALL |f| (QREFELT $ 47)))
              (LETT |df| (SPADCALL |f| (QREFELT $ 19))) (LETT |leadlist| NIL)
              (COND
               ((SPADCALL |lgcd| (|spadConstant| $ 38) (QREFELT $ 85))
                (SEQ (LETT |leadpol| 'T)
                     (LETT |f| (SPADCALL |lgcd| |f| (QREFELT $ 86)))
                     (LETT |ldeg|
                           (PROGN
                            (LETT #5# NIL)
                            (SEQ (LETT |n1| NIL)
                                 (LETT #4#
                                       (SPADCALL |lgcd| |lvar| (QREFELT $ 87)))
                                 (LETT |n0| NIL) (LETT #3# |ldeg|) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |n0| (CAR #3#)) NIL)
                                       (ATOM #4#)
                                       (PROGN (LETT |n1| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT (LETT #5# (CONS (+ |n0| |n1|) #5#))))
                                 (LETT #3#
                                       (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                                 (GO G190) G191 (EXIT (NREVERSE #5#)))))
                     (LETT |lcd| (SPADCALL |d| (QREFELT $ 43)))
                     (LETT |lgcd1|
                           (COND
                            ((SPADCALL (SPADCALL |lgcd| (QREFELT $ 88))
                                       (|spadConstant| $ 32) (QREFELT $ 89))
                             (SPADCALL |lgcd| (QREFELT $ 90)))
                            (#6='T
                             (SPADCALL
                              (SPADCALL |lgcd| |lvar| |lval| (QREFELT $ 40))
                              (QREFELT $ 90)))))
                     (LETT |du|
                           (SPADCALL (SPADCALL |lgcd1| |d| (QREFELT $ 91))
                                     |lcd| (QREFELT $ 44)))
                     (EXIT
                      (COND ((QEQCAR |du| 1) "failed")
                            (#6#
                             (SEQ (LETT |d| (QCDR |du|))
                                  (EXIT
                                   (LETT |uf|
                                         (SPADCALL |lcd| |uf|
                                                   (QREFELT $ 91)))))))))))
              (LETT |leadlist| (LIST |lgcd| |lcf|))
              (LETT |lgu|
                    (|PGCD;imposelc| (LIST |d| |uf|) |lvar| |lval| |leadlist|
                     $))
              (EXIT
               (COND ((QEQCAR |lgu| 1) (CONS 1 "failed"))
                     (#6#
                      (SEQ (LETT |lg| (QCDR |lgu|))
                           (LETT |pl|
                                 (SPADCALL |f| |lvar| |lg| |lval| |leadlist|
                                           |ldeg| (QREFELT $ 14)
                                           (QREFELT $ 94)))
                           (EXIT
                            (COND ((QEQCAR |pl| 1) (CONS 1 "failed"))
                                  (#6#
                                   (SEQ (LETT |plist| (QCDR |pl|))
                                        (PROGN
                                         (LETT |#G82| (|SPADfirst| |plist|))
                                         (LETT |#G83|
                                               (SPADCALL |plist| 2
                                                         (QREFELT $ 96)))
                                         (LETT |p0| |#G82|)
                                         (LETT |p1| |#G83|))
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |p0| |lvar| |lval|
                                                     (QREFELT $ 28))
                                           (|SPADfirst| |lg|) (QREFELT $ 97))
                                          (PROGN
                                           (LETT |#G84| |p1|)
                                           (LETT |#G85| |p0|)
                                           (LETT |p0| |#G84|)
                                           (LETT |p1| |#G85|))))
                                        (EXIT
                                         (COND
                                          (|leadpol|
                                           (SPADCALL |p0|
                                                     (SPADCALL |p0|
                                                               (QREFELT $ 80))
                                                     (QREFELT $ 98)))
                                          (#6# (CONS 0 |p0|))))))))))))))) 

(SDEFUN |PGCD;gcd;3P;17| ((|p1| P) (|p2| P) ($ P))
        (SPROG ((|mv2| (OV)) (#1=#:G596 NIL) (|mv1| (OV)))
               (SEQ
                (COND
                 ((SPADCALL |p1| (QREFELT $ 72))
                  (SEQ (LETT |p1| (SPADCALL |p1| (QREFELT $ 99)))
                       (EXIT
                        (COND
                         ((SPADCALL |p1| (|spadConstant| $ 38) (QREFELT $ 79))
                          |p1|)
                         ((SPADCALL |p1| (|spadConstant| $ 100) (QREFELT $ 79))
                          (SPADCALL |p2| (QREFELT $ 99)))
                         ((SPADCALL |p2| (QREFELT $ 72))
                          (SPADCALL
                           (SPADCALL (SPADCALL |p1| (QREFELT $ 90))
                                     (SPADCALL |p2| (QREFELT $ 90))
                                     (QREFELT $ 101))
                           (QREFELT $ 102)))
                         (#2='T (|PGCD;gcdTermList| |p1| |p2| $))))))
                 ((SPADCALL |p2| (QREFELT $ 72))
                  (SEQ (LETT |p2| (SPADCALL |p2| (QREFELT $ 99)))
                       (EXIT
                        (COND
                         ((SPADCALL |p2| (|spadConstant| $ 38) (QREFELT $ 79))
                          |p2|)
                         ((SPADCALL |p2| (|spadConstant| $ 100) (QREFELT $ 79))
                          (SPADCALL |p1| (QREFELT $ 99)))
                         (#2# (|PGCD;gcdTermList| |p2| |p1| $))))))
                 (#2#
                  (SEQ (LETT |p1| (SPADCALL |p1| (QREFELT $ 99)))
                       (LETT |p2| (SPADCALL |p2| (QREFELT $ 99)))
                       (EXIT
                        (COND ((SPADCALL |p1| |p2| (QREFELT $ 79)) |p1|)
                              (#2#
                               (SEQ
                                (LETT |mv1|
                                      (PROG2
                                          (LETT #1#
                                                (SPADCALL |p1| (QREFELT $ 74)))
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (QREFELT $ 7)
                                                        (|Union| (QREFELT $ 7)
                                                                 #3="failed")
                                                        #1#)))
                                (LETT |mv2|
                                      (PROG2
                                          (LETT #1#
                                                (SPADCALL |p2| (QREFELT $ 74)))
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (QREFELT $ 7)
                                                        (|Union| (QREFELT $ 7)
                                                                 #3#)
                                                        #1#)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |mv1| |mv2| (QREFELT $ 103))
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |p1| |mv1| (QREFELT $ 77))
                                     (SPADCALL |p2| |mv1| (QREFELT $ 77))
                                     (QREFELT $ 46))
                                    |mv1| (QREFELT $ 104)))
                                  ((SPADCALL |mv1| |mv2| (QREFELT $ 105))
                                   (|PGCD;gcdTermList| |p1| |p2| $))
                                  (#2#
                                   (|PGCD;gcdTermList| |p2| |p1| $)))))))))))))) 

(SDEFUN |PGCD;gcd;LP;18| ((|listp| |List| P) ($ P))
        (SPROG
         ((#1=#:G607 NIL) (|f| (P)) (#2=#:G608 NIL) (|g| NIL)
          (|lf| (|List| P)))
         (SEQ
          (EXIT
           (SEQ (LETT |lf| (|PGCD;best_to_front| |listp| $))
                (LETT |f| (|SPADfirst| |lf|))
                (SEQ (LETT |g| NIL) (LETT #2# (CDR |lf|)) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |f| (SPADCALL |f| |g| (QREFELT $ 78)))
                          (EXIT
                           (COND
                            ((SPADCALL |f| (|spadConstant| $ 38)
                                       (QREFELT $ 79))
                             (PROGN (LETT #1# |f|) (GO #3=#:G606))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |f|)))
          #3# (EXIT #1#)))) 

(SDEFUN |PGCD;gcd;LSup;19|
        ((|listp| |List| (|SparseUnivariatePolynomial| P))
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#1=#:G618 NIL) (|f| (|SparseUnivariatePolynomial| P))
          (#2=#:G619 NIL) (|g| NIL)
          (|lf| (|List| (|SparseUnivariatePolynomial| P))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lf|
                  (SPADCALL (CONS #'|PGCD;gcd;LSup;19!0| $) |listp|
                            (QREFELT $ 108)))
            (LETT |f| (|SPADfirst| |lf|))
            (SEQ (LETT |g| NIL) (LETT #2# (CDR |lf|)) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL)) (GO G191)))
                 (SEQ (LETT |f| (SPADCALL |f| |g| (QREFELT $ 46)))
                      (EXIT
                       (COND
                        ((SPADCALL |f| (|spadConstant| $ 62) (QREFELT $ 53))
                         (PROGN (LETT #1# |f|) (GO #3=#:G617))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT |f|)))
          #3# (EXIT #1#)))) 

(SDEFUN |PGCD;gcd;LSup;19!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 19)) (SPADCALL |z2| (QREFELT $ 19))
                  (QREFELT $ 106))) 

(SDEFUN |PGCD;gcdPrimitive;3P;20| ((|p1| P) (|p2| P) ($ P))
        (SPROG
         ((|up2| #1=(|SparseUnivariatePolynomial| P)) (|up1| #1#)
          (#2=#:G627 NIL) (|mp| (P)) (|md| (|NonNegativeInteger|)) (|mv2| (OV))
          (#3=#:G624 NIL) (|mv1| (OV)))
         (SEQ (LETT |p1| (SPADCALL |p1| (QREFELT $ 99)))
              (LETT |p2| (SPADCALL |p2| (QREFELT $ 99)))
              (EXIT
               (COND ((SPADCALL |p1| |p2| (QREFELT $ 79)) |p1|)
                     ((SPADCALL |p1| (QREFELT $ 72))
                      (COND
                       ((SPADCALL |p2| (QREFELT $ 72))
                        (SPADCALL
                         (SPADCALL (SPADCALL |p1| (QREFELT $ 90))
                                   (SPADCALL |p2| (QREFELT $ 90))
                                   (QREFELT $ 101))
                         (QREFELT $ 102)))
                       ((SPADCALL |p1| (|spadConstant| $ 100) (QREFELT $ 79))
                        |p2|)
                       (#4='T (|spadConstant| $ 38))))
                     ((SPADCALL |p2| (QREFELT $ 72))
                      (COND
                       ((SPADCALL |p2| (|spadConstant| $ 100) (QREFELT $ 79))
                        |p1|)
                       (#4# (|spadConstant| $ 38))))
                     (#4#
                      (SEQ
                       (LETT |mv1|
                             (PROG2 (LETT #3# (SPADCALL |p1| (QREFELT $ 74)))
                                 (QCDR #3#)
                               (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                               (|Union| (QREFELT $ 7)
                                                        #5="failed")
                                               #3#)))
                       (LETT |mv2|
                             (PROG2 (LETT #3# (SPADCALL |p2| (QREFELT $ 74)))
                                 (QCDR #3#)
                               (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                               (|Union| (QREFELT $ 7) #5#)
                                               #3#)))
                       (EXIT
                        (COND
                         ((SPADCALL |mv1| |mv2| (QREFELT $ 103))
                          (SEQ
                           (LETT |md|
                                 (MIN (SPADCALL |p1| |mv1| (QREFELT $ 110))
                                      (SPADCALL |p2| |mv2| (QREFELT $ 110))))
                           (LETT |mp| (|spadConstant| $ 38))
                           (COND
                            ((> |md| 1)
                             (SEQ
                              (LETT |mp|
                                    (SPADCALL (SPADCALL |mv1| (QREFELT $ 111))
                                              |md| (QREFELT $ 112)))
                              (LETT |p1|
                                    (PROG2
                                        (LETT #2#
                                              (SPADCALL |p1| |mp|
                                                        (QREFELT $ 113)))
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 0)
                                                      (QREFELT $ 9)
                                                      (|Union| (QREFELT $ 9)
                                                               #6="failed")
                                                      #2#)))
                              (EXIT
                               (LETT |p2|
                                     (PROG2
                                         (LETT #2#
                                               (SPADCALL |p2| |mp|
                                                         (QREFELT $ 113)))
                                         (QCDR #2#)
                                       (|check_union2| (QEQCAR #2# 0)
                                                       (QREFELT $ 9)
                                                       (|Union| (QREFELT $ 9)
                                                                #6#)
                                                       #2#)))))))
                           (LETT |up1| (SPADCALL |p1| |mv1| (QREFELT $ 77)))
                           (LETT |up2| (SPADCALL |p2| |mv2| (QREFELT $ 77)))
                           (EXIT
                            (SPADCALL |mp|
                                      (SPADCALL
                                       (SPADCALL |up1| |up2| (QREFELT $ 63))
                                       |mv1| (QREFELT $ 104))
                                      (QREFELT $ 114)))))
                         (#4# (|spadConstant| $ 38))))))))))) 

(SDEFUN |PGCD;gcdPrimitive;LP;21| ((|listp| |List| P) ($ P))
        (SPROG
         ((#1=#:G642 NIL) (|f| (P)) (#2=#:G643 NIL) (|g| NIL)
          (|lf| (|List| P)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lf|
                  (SPADCALL (CONS (|function| |PGCD;better|) $) |listp|
                            (QREFELT $ 117)))
            (LETT |f| (|SPADfirst| |lf|))
            (SEQ (LETT |g| NIL) (LETT #2# (CDR |lf|)) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL)) (GO G191)))
                 (SEQ (LETT |f| (SPADCALL |f| |g| (QREFELT $ 115)))
                      (EXIT
                       (COND
                        ((SPADCALL |f| (|spadConstant| $ 38) (QREFELT $ 79))
                         (PROGN (LETT #1# |f|) (GO #3=#:G641))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT |f|)))
          #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |PolynomialGcdPackage;|)) 

(DEFUN |PolynomialGcdPackage| (&REST #1=#:G644)
  (SPROG NIL
         (PROG (#2=#:G645)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialGcdPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialGcdPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PolynomialGcdPackage|)))))))))) 

(DEFUN |PolynomialGcdPackage;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|PolynomialGcdPackage| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 119))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|PolynomialGcdPackage|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 14
              (SPADCALL (SPADCALL (EXPT 2 26) (QREFELT $ 12)) (QREFELT $ 13)))
    $))) 

(MAKEPROP '|PolynomialGcdPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|)
              (|IntegerPrimesPackage| 10) (0 . |prevPrime|) (5 . |coerce|)
              '|pmod| (|Union| $ '"failed") (|SparseUnivariatePolynomial| 9)
              (10 . |exquo|) (|NonNegativeInteger|) (16 . |degree|)
              (|FactoringUtilities| 6 7 8 9) (21 . |ran|) (|Boolean|)
              (|List| 8) (|List| 23) (26 . |member?|)
              (|SparseUnivariatePolynomial| 8) (|List| 7) (32 . |completeEval|)
              (39 . |degree|) (44 . ~=) (50 . |gcd|) (56 . |Zero|)
              (60 . |Zero|) (64 . |One|) (68 . |Zero|) (72 . |exquo|)
              (78 . |One|) (82 . |One|) (86 . |differentiate|) (91 . |eval|)
              (98 . |univariate|) (103 . *) (109 . |leadingCoefficient|)
              (114 . |exquo|) (120 . |differentiate|) |PGCD;gcd;3Sup;13|
              (125 . |leadingCoefficient|) (|List| $) (130 . |gcd|) (|List| 9)
              |PGCD;gcd;LP;18| (135 . *) (141 . =) (147 . |unitCanonical|)
              (152 . >) (158 . |variables|) (163 . |setUnion|)
              (|Mapping| 22 7 7) (169 . |sort|) (175 . |lowerPolynomial|)
              (180 . |raisePolynomial|) (185 . |One|)
              |PGCD;gcdPrimitive;3Sup;7| (189 . |min|) (|List| 18)
              (195 . |degree|) (|Mapping| 18 18 18) (201 . |map|)
              (208 . |minimumDegree|) (213 . |coefficients|) (218 . |monomial|)
              (224 . |ground?|) (|Union| 7 '"failed") (229 . |mainVariable|)
              (234 . |degree|) (|SparseUnivariatePolynomial| $)
              (240 . |univariate|) |PGCD;gcd;3P;17| (246 . =) (252 . |content|)
              (257 . |coerce|) (262 . |reductum|) (|List| 26) (267 . |elt|)
              (273 . ~=) (279 . *) (285 . |degree|) (291 . |degree|) (296 . =)
              (302 . |retract|) (307 . *) (|Union| 95 '"failed")
              (|MultivariateLifting| 6 7 8 9) (313 . |lifting|) (|List| 16)
              (324 . |elt|) (330 . ~=) (336 . |exquo|) (342 . |unitCanonical|)
              (347 . |Zero|) (351 . |gcd|) (357 . |coerce|) (362 . =)
              (368 . |multivariate|) (374 . <) (380 . <) (|Mapping| 22 16 16)
              (386 . |sort|) |PGCD;gcd;LSup;19| (392 . |minimumDegree|)
              (398 . |coerce|) (403 . ^) (409 . |exquo|) (415 . *)
              |PGCD;gcdPrimitive;3P;20| (|Mapping| 22 9 9) (421 . |sort|)
              |PGCD;gcdPrimitive;LP;21|)
           '#(|gcdPrimitive| 427 |gcd| 444) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|gcd| (|#4| |#4| |#4|)) T)
                                   '((|gcd| (|#4| (|List| |#4|))) T)
                                   '((|gcd|
                                      ((|SparseUnivariatePolynomial| |#4|)
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|SparseUnivariatePolynomial| |#4|)))
                                     T)
                                   '((|gcd|
                                      ((|SparseUnivariatePolynomial| |#4|)
                                       (|List|
                                        (|SparseUnivariatePolynomial| |#4|))))
                                     T)
                                   '((|gcdPrimitive| (|#4| |#4| |#4|)) T)
                                   '((|gcdPrimitive|
                                      ((|SparseUnivariatePolynomial| |#4|)
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|SparseUnivariatePolynomial| |#4|)))
                                     T)
                                   '((|gcdPrimitive| (|#4| (|List| |#4|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 118
                                            '(1 11 10 10 12 1 8 0 10 13 2 16 15
                                              0 0 17 1 16 18 0 19 1 20 8 10 21
                                              2 24 22 23 0 25 3 20 26 16 27 23
                                              28 1 26 18 0 29 2 18 22 0 0 30 2
                                              26 0 0 0 31 0 6 0 32 0 8 0 33 0
                                              26 0 34 0 16 0 35 2 26 15 0 0 36
                                              0 8 0 37 0 9 0 38 1 26 0 0 39 3 9
                                              0 0 27 23 40 1 9 26 0 41 2 26 0 0
                                              0 42 1 26 8 0 43 2 26 15 0 8 44 1
                                              16 0 0 45 1 16 9 0 47 1 26 0 48
                                              49 2 16 0 0 0 52 2 16 22 0 0 53 1
                                              16 0 0 54 2 7 22 0 0 55 1 20 27
                                              16 56 2 27 0 0 0 57 2 27 0 58 0
                                              59 1 20 26 16 60 1 20 16 26 61 0
                                              16 0 62 2 18 0 0 0 64 2 20 65 16
                                              27 66 3 65 0 67 0 0 68 1 16 18 0
                                              69 1 16 50 0 70 2 16 0 9 18 71 1
                                              9 22 0 72 1 9 73 0 74 2 9 18 0 7
                                              75 2 9 76 0 7 77 2 9 22 0 0 79 1
                                              16 9 0 80 1 16 0 9 81 1 16 0 0 82
                                              2 83 26 0 10 84 2 9 22 0 0 85 2
                                              16 0 9 0 86 2 9 65 0 27 87 1 9 6
                                              0 88 2 6 22 0 0 89 1 9 8 0 90 2
                                              26 0 8 0 91 7 93 92 16 27 83 23
                                              50 65 8 94 2 95 16 0 10 96 2 26
                                              22 0 0 97 2 16 15 0 9 98 1 9 0 0
                                              99 0 9 0 100 2 8 0 0 0 101 1 9 0
                                              8 102 2 7 22 0 0 103 2 9 0 76 7
                                              104 2 7 22 0 0 105 2 18 22 0 0
                                              106 2 95 0 107 0 108 2 9 18 0 7
                                              110 1 9 0 7 111 2 9 0 0 18 112 2
                                              9 15 0 0 113 2 9 0 0 0 114 2 50 0
                                              116 0 117 2 0 9 9 9 115 1 0 9 50
                                              118 2 0 16 16 16 63 2 0 9 9 9 78
                                              2 0 16 16 16 46 1 0 9 50 51 1 0
                                              16 95 109)))))
           '|lookupComplete|)) 
