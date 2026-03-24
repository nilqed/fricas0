
(SDEFUN |STTAYLOR;zro| ((% (|Stream| A))) (SPADCALL (QREFELT % 8))) 

(SDEFUN |STTAYLOR;+;3S;2|
        ((|x| (|Stream| A)) (|y| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;+;3S;2!2| (VECTOR |x| % |y|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;+;3S;2!2| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND ((SPADCALL |y| (QREFELT % 10)) |x|)
                         ((SPADCALL |x| (QREFELT % 10)) |y|)
                         ((SPADCALL |x| (SPADCALL |x| (QREFELT % 11))
                                    (QREFELT % 12))
                          (SPADCALL (CONS #'|STTAYLOR;+;3S;2!0| (VECTOR % |x|))
                                    |y| (QREFELT % 16)))
                         ((SPADCALL |y| (SPADCALL |y| (QREFELT % 11))
                                    (QREFELT % 12))
                          (SPADCALL (CONS #'|STTAYLOR;+;3S;2!1| (VECTOR % |y|))
                                    |x| (QREFELT % 16)))
                         ('T
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT % 13))
                                     (SPADCALL |y| (QREFELT % 13))
                                     (QREFELT % 14))
                           (SPADCALL (SPADCALL |x| (QREFELT % 11))
                                     (SPADCALL |y| (QREFELT % 11))
                                     (QREFELT % 17))
                           (QREFELT % 18))))))))) 

(SDEFUN |STTAYLOR;+;3S;2!1| ((|z| NIL) ($$ NIL))
        (PROG (|y| %)
          (LETT |y| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |y| (QREFELT % 13)) |z| (QREFELT % 14)))))) 

(SDEFUN |STTAYLOR;+;3S;2!0| ((|z| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 13)) |z| (QREFELT % 14)))))) 

(SDEFUN |STTAYLOR;-;3S;3|
        ((|x| (|Stream| A)) (|y| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;-;3S;3!2| (VECTOR |x| % |y|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;-;3S;3!2| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND ((SPADCALL |y| (QREFELT % 10)) |x|)
                         ((SPADCALL |x| (QREFELT % 10))
                          (SPADCALL |y| (QREFELT % 21)))
                         ((SPADCALL |x| (SPADCALL |x| (QREFELT % 11))
                                    (QREFELT % 12))
                          (SPADCALL (CONS #'|STTAYLOR;-;3S;3!0| (VECTOR % |x|))
                                    |y| (QREFELT % 16)))
                         ((SPADCALL |y| (SPADCALL |y| (QREFELT % 11))
                                    (QREFELT % 12))
                          (SPADCALL (CONS #'|STTAYLOR;-;3S;3!1| (VECTOR % |y|))
                                    |x| (QREFELT % 16)))
                         ('T
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT % 13))
                                     (SPADCALL |y| (QREFELT % 13))
                                     (QREFELT % 22))
                           (SPADCALL (SPADCALL |x| (QREFELT % 11))
                                     (SPADCALL |y| (QREFELT % 11))
                                     (QREFELT % 23))
                           (QREFELT % 18))))))))) 

(SDEFUN |STTAYLOR;-;3S;3!1| ((|z| NIL) ($$ NIL))
        (PROG (|y| %)
          (LETT |y| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z| (SPADCALL |y| (QREFELT % 13)) (QREFELT % 22)))))) 

(SDEFUN |STTAYLOR;-;3S;3!0| ((|z| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 13)) |z| (QREFELT % 22)))))) 

(SDEFUN |STTAYLOR;-;2S;4| ((|y| (|Stream| A)) (% (|Stream| A)))
        (SPADCALL (ELT % 24) |y| (QREFELT % 16))) 

(SDEFUN |STTAYLOR;*;A2S;5| ((|s| (A)) (|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (COND ((SPADCALL |s| (QREFELT % 25)) (|STTAYLOR;zro| %))
                     ('T
                      (SPADCALL (CONS #'|STTAYLOR;*;A2S;5!0| (VECTOR % |s|))
                                |x| (QREFELT % 16)))))) 

(SDEFUN |STTAYLOR;*;A2S;5!0| ((|z| NIL) ($$ NIL))
        (PROG (|s| %)
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |z| (QREFELT % 26)))))) 

(SDEFUN |STTAYLOR;*;SAS;6| ((|x| (|Stream| A)) (|s| (A)) (% (|Stream| A)))
        (SPROG NIL
               (COND ((SPADCALL |s| (QREFELT % 25)) (|STTAYLOR;zro| %))
                     ('T
                      (SPADCALL (CONS #'|STTAYLOR;*;SAS;6!0| (VECTOR % |s|))
                                |x| (QREFELT % 16)))))) 

(SDEFUN |STTAYLOR;*;SAS;6!0| ((|z| NIL) ($$ NIL))
        (PROG (|s| %)
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z| |s| (QREFELT % 26)))))) 

(SDEFUN |STTAYLOR;revSum| ((|ra| (|Stream| A)) (|rvc| (|List| A)) (% (A)))
        (SPROG ((|cc| (A)) (#1=#:G123 NIL) (|c| NIL))
               (SEQ (LETT |cc| (|spadConstant| % 29))
                    (SEQ (LETT |c| NIL) (LETT #1# |rvc|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL)
                               (NULL (NULL (SPADCALL |ra| (QREFELT % 10)))))
                           (GO G191)))
                         (SEQ
                          (LETT |cc|
                                (SPADCALL |cc|
                                          (SPADCALL |c|
                                                    (SPADCALL |ra|
                                                              (QREFELT % 13))
                                                    (QREFELT % 26))
                                          (QREFELT % 14)))
                          (EXIT (LETT |ra| (SPADCALL |ra| (QREFELT % 11)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |cc|)))) 

(SDEFUN |STTAYLOR;restRecip|
        ((|a| (|Stream| A)) (|u| (A)) (|n| (|Integer|)) (|k| (|Integer|))
         (|ra| (|Stream| A)) (|revc| (|List| A)) (% (|Stream| A)))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLOR;restRecip!0|
                       (VECTOR |k| |n| |a| |u| |revc| % |ra|))
                 (QREFELT % 20))))) 

(SDEFUN |STTAYLOR;restRecip!0| (($$ NIL))
        (PROG (|ra| % |revc| |u| |a| |n| |k|)
          (LETT |ra| (QREFELT $$ 6))
          (LETT % (QREFELT $$ 5))
          (LETT |revc| (QREFELT $$ 4))
          (LETT |u| (QREFELT $$ 3))
          (LETT |a| (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT |k| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|cn| NIL) (|i| NIL) (#1=#:G140 NIL) (|rvc| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |ra| (QREFELT % 10)) (SPADCALL (QREFELT % 8)))
                     ('T
                      (SEQ (LETT |rvc| |revc|)
                           (LETT |cn|
                                 (SPADCALL |u| (|STTAYLOR;revSum| |ra| |rvc| %)
                                           (QREFELT % 26)))
                           (EXIT
                            (COND
                             ((SPADCALL |cn| (QREFELT % 25))
                              (SPADCALL |cn|
                                        (|STTAYLOR;restRecip| |a| |u|
                                         (SPADCALL |n| (|spadConstant| % 35)
                                                   (QREFELT % 33))
                                         |k| (SPADCALL |ra| (QREFELT % 11))
                                         |rvc| %)
                                        (QREFELT % 18)))
                             ('T
                              (SEQ
                               (SEQ (LETT |i| |k|)
                                    (LETT #1#
                                          (SPADCALL |n| (|spadConstant| % 35)
                                                    (QREFELT % 36)))
                                    G190 (COND ((> |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |rvc|
                                            (SPADCALL (|spadConstant| % 29)
                                                      |rvc| (QREFELT % 39)))))
                                    (LETT |i| (+ |i| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (SPADCALL |cn|
                                          (|STTAYLOR;restRecip| |a| |u|
                                           (SPADCALL |n| (|spadConstant| % 35)
                                                     (QREFELT % 33))
                                           (SPADCALL |n| (|spadConstant| % 35)
                                                     (QREFELT % 33))
                                           |a|
                                           (SPADCALL |cn| |rvc| (QREFELT % 39))
                                           %)
                                          (QREFELT % 18)))))))))))))))) 

(SDEFUN |STTAYLOR;recip;SU;9|
        ((|x| (|Stream| A)) (% (|Union| (|Stream| A) "failed")))
        (SPROG ((|c0| (A)) (|ua| (|Union| A "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 10)) (CONS 1 "failed"))
                      (#1='T
                       (SEQ
                        (LETT |ua|
                              (SPADCALL (SPADCALL |x| (QREFELT % 13))
                                        (QREFELT % 41)))
                        (EXIT
                         (COND ((QEQCAR |ua| 1) (CONS 1 "failed"))
                               (#1#
                                (SEQ (LETT |c0| (QCDR |ua|))
                                     (EXIT
                                      (CONS 0
                                            (SPADCALL |c0|
                                                      (|STTAYLOR;restRecip|
                                                       (SPADCALL |x|
                                                                 (QREFELT %
                                                                          11))
                                                       (SPADCALL |c0|
                                                                 (QREFELT %
                                                                          24))
                                                       1 1
                                                       (SPADCALL |x|
                                                                 (QREFELT %
                                                                          11))
                                                       (LIST |c0|) %)
                                                      (QREFELT %
                                                               18)))))))))))))) 

(SDEFUN |STTAYLOR;restDiv|
        ((|a| (|Stream| A)) (|u| (A)) (|n| (|Integer|)) (|k| (|Integer|))
         (|ra| (|Stream| A)) (|b| (|Stream| A)) (|revc| (|List| A))
         (% (|Stream| A)))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLOR;restDiv!0|
                       (VECTOR |revc| |ra| |k| |n| |u| |a| % |b|))
                 (QREFELT % 20))))) 

(SDEFUN |STTAYLOR;restDiv!0| (($$ NIL))
        (PROG (|b| % |a| |u| |n| |k| |ra| |revc|)
          (LETT |b| (QREFELT $$ 7))
          (LETT % (QREFELT $$ 6))
          (LETT |a| (QREFELT $$ 5))
          (LETT |u| (QREFELT $$ 4))
          (LETT |n| (QREFELT $$ 3))
          (LETT |k| (QREFELT $$ 2))
          (LETT |ra| (QREFELT $$ 1))
          (LETT |revc| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|cn| NIL) (|i| NIL) (#1=#:G171 NIL) (|rvc| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |b| (QREFELT % 10))
                      (|STTAYLOR;restRecip| |a| |u| |n| |k| |ra| |revc| %))
                     ('T
                      (SEQ (LETT |rvc| |revc|)
                           (LETT |cn|
                                 (SPADCALL
                                  (SPADCALL (|STTAYLOR;revSum| |ra| |rvc| %)
                                            (SPADCALL |b| (QREFELT % 13))
                                            (QREFELT % 22))
                                  |u| (QREFELT % 26)))
                           (EXIT
                            (COND
                             ((SPADCALL |cn| (QREFELT % 25))
                              (SPADCALL |cn|
                                        (|STTAYLOR;restDiv| |a| |u|
                                         (SPADCALL |n| (|spadConstant| % 45)
                                                   (QREFELT % 33))
                                         |k| (SPADCALL |ra| (QREFELT % 11))
                                         (SPADCALL |b| (QREFELT % 11)) |rvc| %)
                                        (QREFELT % 18)))
                             ('T
                              (SEQ
                               (SEQ (LETT |i| |k|)
                                    (LETT #1#
                                          (SPADCALL |n| (|spadConstant| % 45)
                                                    (QREFELT % 36)))
                                    G190 (COND ((> |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |rvc|
                                            (SPADCALL (|spadConstant| % 29)
                                                      |rvc| (QREFELT % 39)))))
                                    (LETT |i| (+ |i| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (SPADCALL |cn|
                                          (|STTAYLOR;restDiv| |a| |u|
                                           (SPADCALL |n| (|spadConstant| % 45)
                                                     (QREFELT % 33))
                                           (SPADCALL |n| (|spadConstant| % 45)
                                                     (QREFELT % 33))
                                           |a| (SPADCALL |b| (QREFELT % 11))
                                           (SPADCALL |cn| |rvc| (QREFELT % 39))
                                           %)
                                          (QREFELT % 18)))))))))))))))) 

(SDEFUN |STTAYLOR;exquo;2SU;11|
        ((|x| (|Stream| A)) (|y| (|Stream| A))
         (% (|Union| (|Stream| A) "failed")))
        (SPROG
         ((|c0| (A)) (|u| (A)) (|ua| (|Union| A "failed")) (#1=#:G190 NIL)
          (#2=#:G189 NIL) (|n| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |n| 1) G190 (COND ((|greater_SI| |n| 1000) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |y| (QREFELT % 10))
                       (PROGN (LETT #1# (CONS 1 "failed")) (GO #3=#:G188)))
                      ((SPADCALL |x| (QREFELT % 10))
                       (PROGN
                        (LETT #1# (CONS 0 (SPADCALL (QREFELT % 8))))
                        (GO #3#)))
                      ((NULL
                        (SPADCALL (SPADCALL |y| (QREFELT % 13))
                                  (QREFELT % 25)))
                       (PROGN (LETT #2# |$NoValue|) (GO #4=#:G182)))
                      ((NULL
                        (SPADCALL (SPADCALL |x| (QREFELT % 13))
                                  (QREFELT % 25)))
                       (PROGN (LETT #1# (CONS 1 "failed")) (GO #3#)))
                      ('T
                       (SEQ (LETT |x| (SPADCALL |x| (QREFELT % 11)))
                            (EXIT
                             (LETT |y| (SPADCALL |y| (QREFELT % 11)))))))))
                   (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL)))
             #4# (EXIT #2#))
            (LETT |ua| (SPADCALL (SPADCALL |y| (QREFELT % 13)) (QREFELT % 41)))
            (EXIT
             (COND ((QEQCAR |ua| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ (LETT |u| (QCDR |ua|))
                         (LETT |c0|
                               (SPADCALL (SPADCALL |x| (QREFELT % 13)) |u|
                                         (QREFELT % 26)))
                         (EXIT
                          (CONS 0
                                (SPADCALL |c0|
                                          (|STTAYLOR;restDiv|
                                           (SPADCALL |y| (QREFELT % 11))
                                           (SPADCALL |u| (QREFELT % 24)) 1 1
                                           (SPADCALL |y| (QREFELT % 11))
                                           (SPADCALL |x| (QREFELT % 11))
                                           (LIST |c0|) %)
                                          (QREFELT % 18))))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |STTAYLOR;/;3S;12|
        ((|x| (|Stream| A)) (|y| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|STTAYLOR;/;3S;12!0| (VECTOR |x| % |y|))
                          (QREFELT % 20))))) 

(SDEFUN |STTAYLOR;/;3S;12!0| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|ua| NIL) (|u| NIL) (|c0| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |y| (QREFELT % 10))
                      (|error| "/: division by zero"))
                     ((SPADCALL |x| (QREFELT % 10)) (SPADCALL (QREFELT % 8)))
                     ('T
                      (SEQ
                       (LETT |ua|
                             (SPADCALL (SPADCALL |y| (QREFELT % 13))
                                       (QREFELT % 41)))
                       (EXIT
                        (COND
                         ((QEQCAR |ua| 1)
                          (|error| "/: second argument is not invertible"))
                         ('T
                          (SEQ (LETT |u| (QCDR |ua|))
                               (LETT |c0|
                                     (SPADCALL (SPADCALL |x| (QREFELT % 13))
                                               |u| (QREFELT % 26)))
                               (EXIT
                                (SPADCALL |c0|
                                          (|STTAYLOR;restDiv|
                                           (SPADCALL |y| (QREFELT % 11))
                                           (SPADCALL |u| (QREFELT % 24))
                                           (|spadConstant| % 45)
                                           (|spadConstant| % 45)
                                           (SPADCALL |y| (QREFELT % 11))
                                           (SPADCALL |x| (QREFELT % 11))
                                           (LIST |c0|) %)
                                          (QREFELT % 18)))))))))))))))) 

(SDEFUN |STTAYLOR;rp| ((|z| (|Integer|)) (|s| (A)) (% (|List| A)))
        (COND ((<= |z| 0) NIL) ('T (CONS |s| (|STTAYLOR;rp| (- |z| 1) |s| %))))) 

(SDEFUN |STTAYLOR;rpSt| ((|z| (|Integer|)) (|s| (A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;rpSt!0| (VECTOR |s| % |z|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;rpSt!0| (($$ NIL))
        (PROG (|z| % |s|)
          (LETT |z| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |s| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |z| (|spadConstant| % 50) (QREFELT % 51))
              (SPADCALL (QREFELT % 8)))
             ('T
              (SPADCALL |s|
                        (|STTAYLOR;rpSt|
                         (SPADCALL |z| (|spadConstant| % 32) (QREFELT % 36))
                         |s| %)
                        (QREFELT % 18)))))))) 

(SDEFUN |STTAYLOR;monom;AIS;15| ((|s| (A)) (|z| (|Integer|)) (% (|Stream| A)))
        (COND
         ((< |z| 0)
          (|error| "monom: cannot create monomial of negative degree"))
         ('T
          (SPADCALL (|STTAYLOR;rpSt| |z| (|spadConstant| % 29) %)
                    (SPADCALL |s| (|STTAYLOR;zro| %) (QREFELT % 18))
                    (QREFELT % 52))))) 

(SDEFUN |STTAYLOR;nnintegers|
        ((|zz| (|NonNegativeInteger|)) (% (|Stream| (|NonNegativeInteger|))))
        (SPADCALL (CONS #'|STTAYLOR;nnintegers!0| %) |zz| (QREFELT % 58))) 

(SDEFUN |STTAYLOR;nnintegers!0| ((|y| NIL) (% NIL))
        (SPADCALL |y| (|spadConstant| % 54) (QREFELT % 55))) 

(SDEFUN |STTAYLOR;integers;IS;17|
        ((|z| (|Integer|)) (% (|Stream| (|Integer|))))
        (SPADCALL (CONS #'|STTAYLOR;integers;IS;17!0| %) |z| (QREFELT % 61))) 

(SDEFUN |STTAYLOR;integers;IS;17!0| ((|y| NIL) (% NIL))
        (SPADCALL |y| (|spadConstant| % 32) (QREFELT % 33))) 

(SDEFUN |STTAYLOR;oddintegers;IS;18|
        ((|z| (|Integer|)) (% (|Stream| (|Integer|))))
        (SPADCALL (CONS #'|STTAYLOR;oddintegers;IS;18!0| %) |z| (QREFELT % 61))) 

(SDEFUN |STTAYLOR;oddintegers;IS;18!0| ((|y| NIL) (% NIL))
        (SPADCALL |y| 2 (QREFELT % 33))) 

(SDEFUN |STTAYLOR;int;AS;19| ((|s| (A)) (% (|Stream| A)))
        (SPADCALL (CONS #'|STTAYLOR;int;AS;19!0| %) |s| (QREFELT % 64))) 

(SDEFUN |STTAYLOR;int;AS;19!0| ((|y| NIL) (% NIL))
        (SPADCALL |y| (|spadConstant| % 30) (QREFELT % 14))) 

(SDEFUN |STTAYLOR;stmult|
        ((|n0| (|Integer|)) (|x0| (|Stream| A)) (|y0| (|Stream| A))
         (|ll0| (|List| A)) (% (|Stream| A)))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLOR;stmult!0| (VECTOR % |ll0| |n0| |y0| |x0|))
                 (QREFELT % 20))))) 

(SDEFUN |STTAYLOR;stmult!0| (($$ NIL))
        (PROG (|x0| |y0| |n0| |ll0| %)
          (LETT |x0| (QREFELT $$ 4))
          (LETT |y0| (QREFELT $$ 3))
          (LETT |n0| (QREFELT $$ 2))
          (LETT |ll0| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|x| NIL) (|c| NIL) (|y| NIL) (|ll| NIL) (|n| NIL) (|i| NIL)
              (#1=#:G259 NIL) (#2=#:G258 NIL) (#3=#:G257 NIL) (|res| NIL)
              (|llp| NIL) (|xp| NIL))
             (SEQ
              (EXIT
               (SEQ (LETT |x| |x0|) (LETT |y| |y0|) (LETT |n| |n0|)
                    (LETT |ll| |ll0|)
                    (COND
                     ((SPADCALL |y| (QREFELT % 10))
                      (COND
                       ((OR (SPADCALL |n| (|spadConstant| % 37) (QREFELT % 66))
                            (SPADCALL |x| (QREFELT % 10)))
                        (PROGN
                         (LETT #2# (SPADCALL (QREFELT % 8)))
                         (GO #4=#:G256)))
                       ('T (LETT |x| (SPADCALL |x| (QREFELT % 11))))))
                     ('T
                      (SEQ (LETT |c| (SPADCALL |y| (QREFELT % 13)))
                           (LETT |y| (SPADCALL |y| (QREFELT % 11)))
                           (EXIT
                            (COND
                             ((SPADCALL |n| (|spadConstant| % 37)
                                        (QREFELT % 66))
                              (COND
                               ((SPADCALL |c| (|spadConstant| % 29)
                                          (QREFELT % 67))
                                (PROGN
                                 (LETT #2#
                                       (SPADCALL (|spadConstant| % 29)
                                                 (|STTAYLOR;stmult| |n| |x| |y|
                                                  |ll| %)
                                                 (QREFELT % 18)))
                                 (GO #4#)))
                               ('T
                                (SEQ
                                 (LETT |ll| (SPADCALL |c| |ll| (QREFELT % 39)))
                                 (EXIT
                                  (LETT |n|
                                        (SPADCALL |n| (|spadConstant| % 35)
                                                  (QREFELT % 33))))))))
                             ('T
                              (SEQ
                               (LETT |ll| (SPADCALL |c| |ll| (QREFELT % 39)))
                               (EXIT
                                (LETT |n|
                                      (SPADCALL |n| (|spadConstant| % 35)
                                                (QREFELT % 33)))))))))))
                    (LETT |res| (|spadConstant| % 29)) (LETT |xp| |x|)
                    (LETT |llp| |ll|)
                    (SEQ
                     (EXIT
                      (SEQ (LETT |i| (|spadConstant| % 37)) (LETT #1# |n|) G190
                           (COND ((> |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |xp| (QREFELT % 10))
                               (COND
                                ((SPADCALL |i| (|spadConstant| % 47)
                                           (QREFELT % 68))
                                 (PROGN
                                  (LETT #2# (SPADCALL (QREFELT % 8)))
                                  (GO #4#)))
                                ('T (PROGN (LETT #3# 1) (GO #5=#:G252)))))
                              ('T
                               (SEQ
                                (LETT |res|
                                      (SPADCALL |res|
                                                (SPADCALL
                                                 (SPADCALL |xp| (QREFELT % 13))
                                                 (SPADCALL |llp|
                                                           (QREFELT % 69))
                                                 (QREFELT % 26))
                                                (QREFELT % 14)))
                                (LETT |llp| (SPADCALL |llp| (QREFELT % 70)))
                                (EXIT
                                 (LETT |xp|
                                       (SPADCALL |xp| (QREFELT % 11)))))))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                     #5# (EXIT #3#))
                    (COND
                     ((SPADCALL (SPADCALL |x| (QREFELT % 11)) (QREFELT % 71))
                      (COND
                       ((SPADCALL |y| (QREFELT % 71))
                        (EXIT
                         (SPADCALL |res| (SPADCALL (QREFELT % 8))
                                   (QREFELT % 18)))))))
                    (EXIT
                     (SPADCALL |res| (|STTAYLOR;stmult| |n| |x| |y| |ll| %)
                               (QREFELT % 18)))))
              #4# (EXIT #2#))))))) 

(SDEFUN |STTAYLOR;*;3S;21|
        ((|x| (|Stream| A)) (|y| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;*;3S;21!0| (VECTOR |x| % |y|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;*;3S;21!0| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((OR (SPADCALL |y| (QREFELT % 10)) (SPADCALL |x| (QREFELT % 10)))
              (|STTAYLOR;zro| %))
             ('T
              (|STTAYLOR;stmult|
               (SPADCALL (|spadConstant| % 32) (QREFELT % 72)) |x| |y| NIL
               %))))))) 

(SDEFUN |STTAYLOR;mapmult;3S;22|
        ((|x| (|Stream| A)) (|y| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;mapmult;3S;22!0| (VECTOR |x| % |y|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;mapmult;3S;22!0| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((OR (SPADCALL |y| (QREFELT % 10)) (SPADCALL |x| (QREFELT % 10)))
              (|STTAYLOR;zro| %))
             ('T
              (SPADCALL
               (SPADCALL (SPADCALL |x| (QREFELT % 13))
                         (SPADCALL |y| (QREFELT % 13)) (QREFELT % 26))
               (SPADCALL (SPADCALL |x| (QREFELT % 11))
                         (SPADCALL |y| (QREFELT % 11)) (QREFELT % 74))
               (QREFELT % 18)))))))) 

(SDEFUN |STTAYLOR;deriv;2S;23| ((|x| (|Stream| A)) (% (|Stream| A)))
        (COND ((SPADCALL |x| (QREFELT % 10)) (|STTAYLOR;zro| %))
              ('T
               (SPADCALL (SPADCALL (|spadConstant| % 30) (QREFELT % 65))
                         (SPADCALL |x| (QREFELT % 75)) (QREFELT % 74))))) 

(SDEFUN |STTAYLOR;gderiv;M2S;24|
        ((|f| (|Mapping| A (|Integer|))) (|x| (|Stream| A)) (% (|Stream| A)))
        (COND ((SPADCALL |x| (QREFELT % 10)) (|STTAYLOR;zro| %))
              ('T
               (SPADCALL
                (SPADCALL |f| (SPADCALL 0 (QREFELT % 62)) (QREFELT % 79)) |x|
                (QREFELT % 74))))) 

(SDEFUN |STTAYLOR;coerce;AS;25| ((|s| (A)) (% (|Stream| A)))
        (COND ((SPADCALL |s| (QREFELT % 25)) (|STTAYLOR;zro| %))
              ('T (SPADCALL |s| (|STTAYLOR;zro| %) (QREFELT % 18))))) 

(SDEFUN |STTAYLOR;eval;SAS;26| ((|x| (|Stream| A)) (|at| (A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (|spadConstant| % 29) (ELT % 14)
                         (SPADCALL |x|
                                   (SPADCALL
                                    (CONS #'|STTAYLOR;eval;SAS;26!0|
                                          (VECTOR % |at|))
                                    (|spadConstant| % 30) (QREFELT % 64))
                                   (QREFELT % 74))
                         (QREFELT % 84)))) 

(SDEFUN |STTAYLOR;eval;SAS;26!0| ((|y| NIL) ($$ NIL))
        (PROG (|at| %)
          (LETT |at| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |at| |y| (QREFELT % 26)))))) 

(SDEFUN |STTAYLOR;compose;3S;27|
        ((|x| (|Stream| A)) (|y| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;compose;3S;27!0| (VECTOR |x| % |y|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;compose;3S;27!0| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |y| (QREFELT % 10))
              (SPADCALL (SPADCALL |x| (QREFELT % 13)) (|STTAYLOR;zro| %)
                        (QREFELT % 18)))
             ((NULL (SPADCALL (SPADCALL |y| (QREFELT % 13)) (QREFELT % 25)))
              (|error|
               "compose: 2nd argument should have 0 constant coefficient"))
             ('T
              (COND ((SPADCALL |x| (QREFELT % 10)) (|STTAYLOR;zro| %))
                    ('T
                     (SPADCALL (SPADCALL |x| (QREFELT % 13))
                               (SPADCALL
                                (SPADCALL (SPADCALL |x| (QREFELT % 11)) |y|
                                          (QREFELT % 86))
                                (SPADCALL |y| (QREFELT % 11)) (QREFELT % 73))
                               (QREFELT % 18)))))))))) 

(SDEFUN |STTAYLOR;lagrangere|
        ((|x| (|Stream| A)) (|c| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;lagrangere!0| (VECTOR |c| |x| %))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;lagrangere!0| (($$ NIL))
        (PROG (% |x| |c|)
          (LETT % (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT |c| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| % 29) (SPADCALL |x| |c| (QREFELT % 86))
                      (QREFELT % 18)))))) 

(SDEFUN |STTAYLOR;lagrange;2S;29| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;lagrange;2S;29!0| (VECTOR % |x|))
                         (QREFELT % 89)))) 

(SDEFUN |STTAYLOR;lagrange;2S;29!0| ((|y| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|STTAYLOR;lagrangere| |x| |y| %))))) 

(SDEFUN |STTAYLOR;revert;2S;30| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG ((|y| (|Union| (|Stream| A) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT % 10))
                  (|error| "revert: should be nonzero"))
                 ((SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 25))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT % 11)) (QREFELT % 10))
                    (|error| "revert: should be nonzero"))
                   (#1='T
                    (SEQ
                     (LETT |y|
                           (SPADCALL (SPADCALL |x| (QREFELT % 11))
                                     (QREFELT % 43)))
                     (EXIT
                      (COND
                       ((QEQCAR |y| 0) (SPADCALL (QCDR |y|) (QREFELT % 90)))
                       (#1#
                        (|error|
                         "revert: should start 0, x, ... with invertible x"))))))))
                 (#1# (|error| "revert: should start 0, x, ...")))))) 

(SDEFUN |STTAYLOR;prodiag1|
        ((|ststa| (|Stream| (|Stream| A))) (|n| (|Integer|)) (% (|Stream| A)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|STTAYLOR;prodiag1!0| (VECTOR |n| % |ststa|))
                          (QREFELT % 20))))) 

(SDEFUN |STTAYLOR;prodiag1!0| (($$ NIL))
        (PROG (|ststa| % |n|)
          (LETT |ststa| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|f1| NIL) (|r1| NIL) (|p1| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |ststa| (QREFELT % 93)) (|STTAYLOR;zro| %))
                     ('T
                      (SEQ (LETT |f1| (SPADCALL |ststa| (QREFELT % 94)))
                           (LETT |r1| (SPADCALL |ststa| (QREFELT % 95)))
                           (LETT |p1|
                                 (|STTAYLOR;prodiag1| |r1|
                                  (SPADCALL |n| (|spadConstant| % 45)
                                            (QREFELT % 33))
                                  %))
                           (EXIT
                            (COND
                             ((SPADCALL |f1| (QREFELT % 10))
                              (SPADCALL (|spadConstant| % 29) |p1|
                                        (QREFELT % 18)))
                             ('T
                              (SPADCALL (SPADCALL |f1| (QREFELT % 13))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |f1| (QREFELT % 11)) |p1|
                                          (QREFELT % 17))
                                         (SPADCALL
                                          (|STTAYLOR;rpSt| |n|
                                           (|spadConstant| % 29) %)
                                          (SPADCALL |f1| |p1| (QREFELT % 73))
                                          (QREFELT % 52))
                                         (QREFELT % 17))
                                        (QREFELT % 18)))))))))))))) 

(SDEFUN |STTAYLOR;prodiag;SS;32|
        ((|ststa| (|Stream| (|Stream| A))) (% (|Stream| A)))
        (SPADCALL (|spadConstant| % 30) (|STTAYLOR;prodiag1| |ststa| 1 %)
                  (QREFELT % 18))) 

(SDEFUN |STTAYLOR;addiag;SS;33|
        ((|ststa| (|Stream| (|Stream| A))) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;addiag;SS;33!0| (VECTOR % |ststa|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;addiag;SS;33!0| (($$ NIL))
        (PROG (|ststa| %)
          (LETT |ststa| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |ststa| (QREFELT % 93)) (|STTAYLOR;zro| %))
                  ((SPADCALL (SPADCALL |ststa| (QREFELT % 94)) (QREFELT % 10))
                   (SPADCALL (|spadConstant| % 29)
                             (SPADCALL (SPADCALL |ststa| (QREFELT % 95))
                                       (QREFELT % 97))
                             (QREFELT % 18)))
                  ('T
                   (SPADCALL
                    (SPADCALL (SPADCALL |ststa| (QREFELT % 94)) (QREFELT % 13))
                    (SPADCALL
                     (SPADCALL (SPADCALL |ststa| (QREFELT % 94))
                               (QREFELT % 11))
                     (SPADCALL (SPADCALL |ststa| (QREFELT % 95))
                               (QREFELT % 97))
                     (QREFELT % 17))
                    (QREFELT % 18)))))))) 

(SDEFUN |STTAYLOR;rptg1| ((|z| (|Integer|)) (|s| (A)) (% (|Stream| A)))
        (SPADCALL (CONS |s| (|STTAYLOR;rp| |z| (|spadConstant| % 29) %))
                  (QREFELT % 98))) 

(SDEFUN |STTAYLOR;rptg2| ((|z| (|Integer|)) (|s| (A)) (% (|Stream| A)))
        (SPADCALL
         (SPADCALL (|STTAYLOR;rp| |z| (|spadConstant| % 29) %)
                   (CONS |s| (|STTAYLOR;rp| (- |z| 1) (|spadConstant| % 29) %))
                   (QREFELT % 99))
         (QREFELT % 98))) 

(SDEFUN |STTAYLOR;rptg3|
        ((|a| (|Integer|)) (|d| (|Integer|)) (|n| (|Integer|)) (|s| (A))
         (% (|Stream| A)))
        (SPADCALL (|STTAYLOR;rpSt| (* |n| (- |a| 1)) (|spadConstant| % 29) %)
                  (SPADCALL
                   (CONS |s|
                         (|STTAYLOR;rp| (- (* |d| |n|) 1) (|spadConstant| % 29)
                          %))
                   (QREFELT % 98))
                  (QREFELT % 52))) 

(SDEFUN |STTAYLOR;lambert;2S;37| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;lambert;2S;37!0| (VECTOR % |x|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;lambert;2S;37!0| (($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT % 10)) (|STTAYLOR;zro| %))
                  ((SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 25))
                   (SPADCALL (|spadConstant| % 29)
                             (SPADCALL
                              (SPADCALL (CONS (|function| |STTAYLOR;rptg1|) %)
                                        (SPADCALL (|spadConstant| % 50)
                                                  (QREFELT % 62))
                                        (SPADCALL |x| (QREFELT % 11))
                                        (QREFELT % 102))
                              (QREFELT % 97))
                             (QREFELT % 18)))
                  ('T
                   (|error| "lambert:constant coefficient should be zero"))))))) 

(SDEFUN |STTAYLOR;oddlambert;2S;38| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;oddlambert;2S;38!0| (VECTOR % |x|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;oddlambert;2S;38!0| (($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT % 10)) (|STTAYLOR;zro| %))
                  ((SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 25))
                   (SPADCALL (|spadConstant| % 29)
                             (SPADCALL
                              (SPADCALL (CONS (|function| |STTAYLOR;rptg1|) %)
                                        (SPADCALL (|spadConstant| % 32)
                                                  (QREFELT % 63))
                                        (SPADCALL |x| (QREFELT % 11))
                                        (QREFELT % 102))
                              (QREFELT % 97))
                             (QREFELT % 18)))
                  ('T
                   (|error|
                    "oddlambert: constant coefficient should be zero"))))))) 

(SDEFUN |STTAYLOR;evenlambert;2S;39| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;evenlambert;2S;39!0| (VECTOR % |x|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;evenlambert;2S;39!0| (($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT % 10)) (|STTAYLOR;zro| %))
                  ((SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 25))
                   (SPADCALL (|spadConstant| % 29)
                             (SPADCALL
                              (SPADCALL (CONS (|function| |STTAYLOR;rptg2|) %)
                                        (SPADCALL (|spadConstant| % 32)
                                                  (QREFELT % 62))
                                        (SPADCALL |x| (QREFELT % 11))
                                        (QREFELT % 102))
                              (QREFELT % 97))
                             (QREFELT % 18)))
                  ('T
                   (|error|
                    "evenlambert: constant coefficient should be zero"))))))) 

(SDEFUN |STTAYLOR;generalLambert;S2IS;40|
        ((|st| (|Stream| A)) (|a| (|Integer|)) (|d| (|Integer|))
         (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|STTAYLOR;generalLambert;S2IS;40!1|
                      (VECTOR |st| |d| % |a|))
                (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;generalLambert;S2IS;40!1| (($$ NIL))
        (PROG (|a| % |d| |st|)
          (LETT |a| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |d| (QREFELT $$ 1))
          (LETT |st| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND
                    ((OR (SPADCALL |a| (|spadConstant| % 32) (QREFELT % 66))
                         (SPADCALL |d| (|spadConstant| % 32) (QREFELT % 66)))
                     (|error|
                      "generalLambert: both integer arguments must be positive"))
                    ('T
                     (COND ((SPADCALL |st| (QREFELT % 10)) (|STTAYLOR;zro| %))
                           ((SPADCALL (SPADCALL |st| (QREFELT % 13))
                                      (QREFELT % 25))
                            (SPADCALL (|spadConstant| % 29)
                                      (SPADCALL
                                       (SPADCALL
                                        (CONS
                                         #'|STTAYLOR;generalLambert;S2IS;40!0|
                                         (VECTOR % |d| |a|))
                                        (SPADCALL (|spadConstant| % 32)
                                                  (QREFELT % 62))
                                        (SPADCALL |st| (QREFELT % 11))
                                        (QREFELT % 102))
                                       (QREFELT % 97))
                                      (QREFELT % 18)))
                           ('T
                            (|error|
                             "generalLambert: constant coefficient should be zero")))))))))) 

(SDEFUN |STTAYLOR;generalLambert;S2IS;40!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|a| |d| %)
          (LETT |a| (QREFELT $$ 2))
          (LETT |d| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|STTAYLOR;rptg3| |a| |d| |x| |y| %))))) 

(SDEFUN |STTAYLOR;rptg4|
        ((|a| (|Integer|)) (|d| (|Integer|)) (|st| (|Stream| A))
         (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;rptg4!0| (VECTOR |d| |a| % |st|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;rptg4!0| (($$ NIL))
        (PROG (|st| % |a| |d|)
          (LETT |st| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |a| (QREFELT $$ 1))
          (LETT |d| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |st| (QREFELT % 10)) (|STTAYLOR;zro| %))
                  ('T
                   (SPADCALL (|STTAYLOR;rpSt| |a| (|spadConstant| % 29) %)
                             (SPADCALL (SPADCALL |st| (QREFELT % 13))
                                       (|STTAYLOR;rptg4| |d| |d|
                                        (SPADCALL |st| (QREFELT % 11)) %)
                                       (QREFELT % 18))
                             (QREFELT % 52)))))))) 

(SDEFUN |STTAYLOR;general_Lambert_product;S2IS;42|
        ((|st| (|Stream| A)) (|a| (|Integer|)) (|d| (|Integer|))
         (% (|Stream| A)))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLOR;general_Lambert_product;S2IS;42!1|
                       (VECTOR |st| |d| % |a|))
                 (QREFELT % 20))))) 

(SDEFUN |STTAYLOR;general_Lambert_product;S2IS;42!1| (($$ NIL))
        (PROG (|a| % |d| |st|)
          (LETT |a| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |d| (QREFELT $$ 1))
          (LETT |st| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|st1| NIL))
                   (SEQ
                    (COND
                     ((OR (SPADCALL |a| (|spadConstant| % 32) (QREFELT % 66))
                          (SPADCALL |d| (|spadConstant| % 32) (QREFELT % 66)))
                      (|error|
                       "general_Lambert_product: both integer arguments must be positive"))
                     ((OR (SPADCALL |st| (QREFELT % 10))
                          (SPADCALL (SPADCALL |st| (QREFELT % 13))
                                    (|spadConstant| % 30) (QREFELT % 107)))
                      (|error|
                       "general_Lambert_product: constant coefficient should be one"))
                     ('T
                      (SEQ (LETT |st1| (SPADCALL |st| (QREFELT % 11)))
                           (EXIT
                            (SPADCALL
                             (SPADCALL
                              (CONS
                               #'|STTAYLOR;general_Lambert_product;S2IS;42!0|
                               (VECTOR |st1| % |d| |a|))
                              (SPADCALL (|spadConstant| % 50) (QREFELT % 62))
                              (QREFELT % 111))
                             (QREFELT % 96)))))))))))) 

(SDEFUN |STTAYLOR;general_Lambert_product;S2IS;42!0| ((|n| NIL) ($$ NIL))
        (PROG (|a| |d| % |st1|)
          (LETT |a| (QREFELT $$ 3))
          (LETT |d| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |st1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|STTAYLOR;rptg4|
             (SPADCALL
              (SPADCALL
               (SPADCALL |a| (SPADCALL |n| |d| (QREFELT % 108)) (QREFELT % 33))
               |n| (QREFELT % 36))
              (|spadConstant| % 32) (QREFELT % 36))
             (SPADCALL
              (SPADCALL |a| (SPADCALL |n| |d| (QREFELT % 108)) (QREFELT % 33))
              (|spadConstant| % 32) (QREFELT % 36))
             |st1| %))))) 

(SDEFUN |STTAYLOR;ms|
        ((|m| (|Integer|)) (|n| (|Integer|)) (|s| (|Stream| A))
         (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;ms!0| (VECTOR |m| |n| % |s|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;ms!0| (($$ NIL))
        (PROG (|s| % |n| |m|)
          (LETT |s| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT |m| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |s| (QREFELT % 10)) (|STTAYLOR;zro| %))
                  ((SPADCALL |n| (QREFELT % 113))
                   (SPADCALL (SPADCALL |s| (QREFELT % 13))
                             (|STTAYLOR;ms| |m|
                              (SPADCALL |m| (|spadConstant| % 32)
                                        (QREFELT % 36))
                              (SPADCALL |s| (QREFELT % 11)) %)
                             (QREFELT % 18)))
                  ('T
                   (|STTAYLOR;ms| |m|
                    (SPADCALL |n| (|spadConstant| % 32) (QREFELT % 36))
                    (SPADCALL |s| (QREFELT % 11)) %))))))) 

(SDEFUN |STTAYLOR;multisect;2I2S;44|
        ((|b| (|Integer|)) (|a| (|Integer|)) (|x| (|Stream| A))
         (% (|Stream| A)))
        (SPROG ((#1=#:G410 NIL))
               (|STTAYLOR;ms| (+ |a| |b|) 0
                (SPADCALL |x|
                          (PROG1 (LETT #1# |a|)
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT % 114))
                %))) 

(SDEFUN |STTAYLOR;altn|
        ((|zs| (|Stream| A)) (|s| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;altn!0| (VECTOR |zs| % |s|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;altn!0| (($$ NIL))
        (PROG (|s| % |zs|)
          (LETT |s| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |zs| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |s| (QREFELT % 10)) (|STTAYLOR;zro| %))
                  ('T
                   (SPADCALL (SPADCALL |s| (QREFELT % 13))
                             (SPADCALL |zs|
                                       (|STTAYLOR;altn| |zs|
                                        (SPADCALL |s| (QREFELT % 11)) %)
                                       (QREFELT % 52))
                             (QREFELT % 18)))))))) 

(SDEFUN |STTAYLOR;invmultisect;2I2S;46|
        ((|a| (|Integer|)) (|b| (|Integer|)) (|x| (|Stream| A))
         (% (|Stream| A)))
        (SPADCALL (|STTAYLOR;rpSt| |b| (|spadConstant| % 29) %)
                  (|STTAYLOR;altn|
                   (|STTAYLOR;rpSt| (- (+ |a| |b|) 1) (|spadConstant| % 29) %)
                   |x| %)
                  (QREFELT % 52))) 

(SDEFUN |STTAYLOR;comps|
        ((|ststa| (|Stream| (|Stream| A))) (|x| (|Stream| A))
         (% (|Stream| (|Stream| A))))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;comps!1| (VECTOR |x| % |ststa|))
                         (QREFELT % 121)))) 

(SDEFUN |STTAYLOR;comps!1| (($$ NIL))
        (PROG (|ststa| % |x|)
          (LETT |ststa| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND
                    ((SPADCALL |ststa| (QREFELT % 93))
                     (SPADCALL (QREFELT % 117)))
                    ((SPADCALL |x| (QREFELT % 10))
                     (SPADCALL (SPADCALL |ststa| (QREFELT % 94))
                               (SPADCALL (QREFELT % 117)) (QREFELT % 118)))
                    ('T
                     (SPADCALL (SPADCALL |ststa| (QREFELT % 94))
                               (SPADCALL
                                (CONS #'|STTAYLOR;comps!0| (VECTOR % |x|))
                                (|STTAYLOR;comps|
                                 (SPADCALL |ststa| (QREFELT % 95)) |x| %)
                                (QREFELT % 120))
                               (QREFELT % 118))))))))) 

(SDEFUN |STTAYLOR;comps!0| ((|y| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 11)) |y| (QREFELT % 73)))))) 

(SDEFUN |STTAYLOR;integre|
        ((|x| (|Stream| A)) (|n| (|Integer|)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;integre!0| (VECTOR |n| % |x|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;integre!0| (($$ NIL))
        (PROG (|x| % |n|)
          (LETT |x| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT % 10)) (|STTAYLOR;zro| %))
                  ('T
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 32) |n| (QREFELT % 123))
                     (SPADCALL |x| (QREFELT % 13)) (QREFELT % 124))
                    (|STTAYLOR;integre| (SPADCALL |x| (QREFELT % 11))
                     (SPADCALL |n| (|spadConstant| % 32) (QREFELT % 33)) %)
                    (QREFELT % 18)))))))) 

(SDEFUN |STTAYLOR;integ| ((|x| (|Stream| A)) (% (|Stream| A)))
        (|STTAYLOR;integre| |x| 1 %)) 

(SDEFUN |STTAYLOR;integrate;A2S;50|
        ((|a| (A)) (|x| (|Stream| A)) (% (|Stream| A)))
        (SPADCALL |a| (|STTAYLOR;integ| |x| %) (QREFELT % 18))) 

(SDEFUN |STTAYLOR;lazyIntegrate;AMS;51|
        ((|s| (A)) (|xf| (|Mapping| (|Stream| A))) (% (|Stream| A)))
        (SPADCALL |s| (|STTAYLOR;integ| (SPADCALL |xf| (QREFELT % 20)) %)
                  (QREFELT % 18))) 

(SDEFUN |STTAYLOR;nldere|
        ((|lslsa| (|Stream| (|Stream| A))) (|c| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (|spadConstant| % 29)
                         (CONS #'|STTAYLOR;nldere!0| (VECTOR % |c| |lslsa|))
                         (QREFELT % 127)))) 

(SDEFUN |STTAYLOR;nldere!0| (($$ NIL))
        (PROG (|lslsa| |c| %)
          (LETT |lslsa| (QREFELT $$ 2))
          (LETT |c| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN (SPADCALL (|STTAYLOR;comps| |lslsa| |c| %) (QREFELT % 97)))))) 

(SDEFUN |STTAYLOR;nlde;SS;53|
        ((|lslsa| (|Stream| (|Stream| A))) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;nlde;SS;53!0| (VECTOR % |lslsa|))
                         (QREFELT % 89)))) 

(SDEFUN |STTAYLOR;nlde;SS;53!0| ((|y| NIL) ($$ NIL))
        (PROG (|lslsa| %)
          (LETT |lslsa| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|STTAYLOR;nldere| |lslsa| |y| %))))) 

(SDEFUN |STTAYLOR;smult|
        ((|rn| (|Fraction| (|Integer|))) (|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;smult!0| (VECTOR % |rn|)) |x|
                         (QREFELT % 16)))) 

(SDEFUN |STTAYLOR;smult!0| ((|y| NIL) ($$ NIL))
        (PROG (|rn| %)
          (LETT |rn| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |rn| |y| (QREFELT % 124)))))) 

(SDEFUN |STTAYLOR;powerrn|
        ((|rn| (|Fraction| (|Integer|))) (|x| (|Stream| A)) (|c| (|Stream| A))
         (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;powerrn!0| (VECTOR |x| |c| |rn| %))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;powerrn!0| (($$ NIL))
        (PROG (% |rn| |c| |x|)
          (LETT % (QREFELT $$ 3))
          (LETT |rn| (QREFELT $$ 2))
          (LETT |c| (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| % 30)
                      (SPADCALL
                       (|STTAYLOR;integ|
                        (|STTAYLOR;smult|
                         (SPADCALL |rn| (|spadConstant| % 130) (QREFELT % 131))
                         (SPADCALL |c| (SPADCALL |x| (QREFELT % 76))
                                   (QREFELT % 73))
                         %)
                        %)
                       (SPADCALL (SPADCALL |x| (QREFELT % 11)) |c|
                                 (QREFELT % 73))
                       (QREFELT % 23))
                      (QREFELT % 18)))))) 

(SDEFUN |STTAYLOR;powern;F2S;56|
        ((|rn| (|Fraction| (|Integer|))) (|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG
         ((|power| (|Stream| A)) (#1=#:G469 NIL) (#2=#:G463 NIL)
          (|num| (|Integer|)) (|invCo| (|Union| A "failed")) (|co| (A))
          (|ord| (|Union| (|Integer|) "failed")) (#3=#:G478 NIL)
          (|order| (|Integer|)) (#4=#:G479 NIL) (|n| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |order| 0)
                (SEQ
                 (EXIT
                  (SEQ (LETT |n| 0) G190 NIL
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |x| (QREFELT % 10))
                           (PROGN
                            (LETT #4# (|STTAYLOR;zro| %))
                            (GO #5=#:G477)))
                          ((NULL
                            (SPADCALL (SPADCALL |x| (QREFELT % 13))
                                      (QREFELT % 25)))
                           (SEQ (LETT |order| |n|)
                                (EXIT
                                 (PROGN
                                  (LETT #3# |$NoValue|)
                                  (GO #6=#:G451)))))
                          ('T
                           (SEQ (LETT |x| (SPADCALL |x| (QREFELT % 11)))
                                (EXIT
                                 (COND
                                  ((EQL |n| 1000)
                                   (|error|
                                    "^: series with many leading zero coefficients")))))))))
                       (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL)))
                 #6# (EXIT #3#))
                (LETT |ord|
                      (SPADCALL |order| (SPADCALL |rn| (QREFELT % 132))
                                (QREFELT % 133)))
                (EXIT
                 (COND
                  ((QEQCAR |ord| 1)
                   (|error| "^: rational power does not exist"))
                  (#7='T
                   (SEQ (LETT |co| (SPADCALL |x| (QREFELT % 13)))
                        (COND
                         ((> (QCDR |ord|) 0)
                          (COND
                           ((SPADCALL |rn| (|spadConstant| % 134)
                                      (QREFELT % 135))
                            (|error| "^: negative power does not exist")))))
                        (LETT |invCo| (SPADCALL |co| (QREFELT % 41)))
                        (EXIT
                         (COND
                          ((QEQCAR |invCo| 1)
                           (|error|
                            "^ rational power of coefficient undefined"))
                          (#7#
                           (SEQ
                            (LETT |power|
                                  (COND
                                   ((SPADCALL |co| (|spadConstant| % 30)
                                              (QREFELT % 67))
                                    (SPADCALL
                                     (CONS #'|STTAYLOR;powern;F2S;56!0|
                                           (VECTOR % |x| |rn|))
                                     (QREFELT % 89)))
                                   ((EQL (SPADCALL |rn| (QREFELT % 132)) 1)
                                    (COND
                                     ((NULL
                                       (MINUSP
                                        (LETT |num|
                                              (SPADCALL |rn|
                                                        (QREFELT % 136)))))
                                      (SPADCALL
                                       (SPADCALL |co|
                                                 (PROG1 (LETT #2# |num|)
                                                   (|check_subtype2| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #2#))
                                                 (QREFELT % 137))
                                       (SPADCALL
                                        (CONS #'|STTAYLOR;powern;F2S;56!1|
                                              (VECTOR % |x| |invCo| |rn|))
                                        (QREFELT % 89))
                                       (QREFELT % 27)))
                                     ('T
                                      (SPADCALL
                                       (SPADCALL (QCDR |invCo|)
                                                 (PROG1 (LETT #1# (- |num|))
                                                   (|check_subtype2| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                 (QREFELT % 137))
                                       (SPADCALL
                                        (CONS #'|STTAYLOR;powern;F2S;56!2|
                                              (VECTOR % |x| |invCo| |rn|))
                                        (QREFELT % 89))
                                       (QREFELT % 27)))))
                                   ((QREFELT % 129)
                                    (SPADCALL
                                     (SPADCALL |co| |rn| (QREFELT % 138))
                                     (SPADCALL
                                      (CONS #'|STTAYLOR;powern;F2S;56!3|
                                            (VECTOR % |x| |invCo| |rn|))
                                      (QREFELT % 89))
                                     (QREFELT % 27)))
                                   (#7#
                                    (|error|
                                     "^ rational power of coefficient undefined"))))
                            (EXIT
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 30)
                                        (* (QCDR |ord|)
                                           (SPADCALL |rn| (QREFELT % 136)))
                                        (QREFELT % 53))
                              |power| (QREFELT % 73)))))))))))))
          #5# (EXIT #4#)))) 

(SDEFUN |STTAYLOR;powern;F2S;56!3| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |invCo| |x| %)
          (LETT |rn| (QREFELT $$ 3))
          (LETT |invCo| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|STTAYLOR;powerrn| |rn|
             (SPADCALL (QCDR |invCo|) |x| (QREFELT % 27)) |y| %))))) 

(SDEFUN |STTAYLOR;powern;F2S;56!2| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |invCo| |x| %)
          (LETT |rn| (QREFELT $$ 3))
          (LETT |invCo| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|STTAYLOR;powerrn| |rn|
             (SPADCALL (QCDR |invCo|) |x| (QREFELT % 27)) |y| %))))) 

(SDEFUN |STTAYLOR;powern;F2S;56!1| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |invCo| |x| %)
          (LETT |rn| (QREFELT $$ 3))
          (LETT |invCo| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|STTAYLOR;powerrn| |rn|
             (SPADCALL (QCDR |invCo|) |x| (QREFELT % 27)) |y| %))))) 

(SDEFUN |STTAYLOR;powern;F2S;56!0| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |x| %)
          (LETT |rn| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|STTAYLOR;powerrn| |rn| |x| |y| %))))) 

(SDEFUN |STTAYLOR;mapdiv;3S;57|
        ((|x| (|Stream| A)) (|y| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;mapdiv;3S;57!0| (VECTOR |x| % |y|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;mapdiv;3S;57!0| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |y| (QREFELT % 10))
              (|error| "stream division by zero"))
             ((SPADCALL |x| (QREFELT % 10)) (|STTAYLOR;zro| %))
             ('T
              (SPADCALL
               (SPADCALL (SPADCALL |x| (QREFELT % 13))
                         (SPADCALL |y| (QREFELT % 13)) (QREFELT % 140))
               (SPADCALL (SPADCALL |x| (QREFELT % 11))
                         (SPADCALL |y| (QREFELT % 11)) (QREFELT % 141))
               (QREFELT % 18)))))))) 

(SDEFUN |STTAYLOR;ginteg|
        ((|f| (|Mapping| A (|Integer|))) (|x| (|Stream| A)) (% (|Stream| A)))
        (SPADCALL |x| (SPADCALL |f| (SPADCALL 1 (QREFELT % 62)) (QREFELT % 79))
                  (QREFELT % 141))) 

(SDEFUN |STTAYLOR;lazyGintegrate;MAMS;59|
        ((|fntoa| (|Mapping| A (|Integer|))) (|s| (A))
         (|xf| (|Mapping| (|Stream| A))) (% (|Stream| A)))
        (SPADCALL |s|
                  (|STTAYLOR;ginteg| |fntoa| (SPADCALL |xf| (QREFELT % 20)) %)
                  (QREFELT % 18))) 

(SDEFUN |STTAYLOR;finteg| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPADCALL |x| (SPADCALL (|spadConstant| % 30) (QREFELT % 65))
                  (QREFELT % 141))) 

(SDEFUN |STTAYLOR;powerre|
        ((|s| (A)) (|x| (|Stream| A)) (|c| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;powerre!0| (VECTOR |c| |s| % |x|))
                         (QREFELT % 20)))) 

(SDEFUN |STTAYLOR;powerre!0| (($$ NIL))
        (PROG (|x| % |s| |c|)
          (LETT |x| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |s| (QREFELT $$ 1))
          (LETT |c| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT % 10)) (|STTAYLOR;zro| %))
                  ((SPADCALL (SPADCALL |x| (QREFELT % 13))
                             (|spadConstant| % 30) (QREFELT % 107))
                   (|error| "^:constant coefficient should be 1"))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT % 13))
                             (SPADCALL
                              (|STTAYLOR;finteg|
                               (SPADCALL
                                (SPADCALL |s| (|spadConstant| % 30)
                                          (QREFELT % 14))
                                (SPADCALL |c| (SPADCALL |x| (QREFELT % 76))
                                          (QREFELT % 73))
                                (QREFELT % 27))
                               %)
                              (SPADCALL (SPADCALL |x| (QREFELT % 11)) |c|
                                        (QREFELT % 73))
                              (QREFELT % 23))
                             (QREFELT % 18)))))))) 

(SDEFUN |STTAYLOR;power;A2S;62| ((|s| (A)) (|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;power;A2S;62!0| (VECTOR % |x| |s|))
                         (QREFELT % 89)))) 

(SDEFUN |STTAYLOR;power;A2S;62!0| ((|y| NIL) ($$ NIL))
        (PROG (|s| |x| %)
          (LETT |s| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|STTAYLOR;powerre| |s| |x| |y| %))))) 

(DECLAIM (NOTINLINE |StreamTaylorSeriesOperations;|)) 

(DEFUN |StreamTaylorSeriesOperations;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|StreamTaylorSeriesOperations| DV$1))
          (LETT % (GETREFV 144))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))))))
          (|haddProp| |$ConstructorCache| '|StreamTaylorSeriesOperations|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV % 125
                       (CONS (|dispatchFunction| |STTAYLOR;integrate;A2S;50|)
                             %))
             (QSETREFV % 127
                       (CONS
                        (|dispatchFunction| |STTAYLOR;lazyIntegrate;AMS;51|)
                        %))
             NIL
             (QSETREFV % 128
                       (CONS (|dispatchFunction| |STTAYLOR;nlde;SS;53|) %))
             (QSETREFV % 129
                       (|HasSignature| |#1|
                                       (LIST '^
                                             (LIST (|devaluate| |#1|)
                                                   (|devaluate| |#1|)
                                                   '(|Fraction|
                                                     (|Integer|))))))
             NIL
             NIL
             (QSETREFV % 139
                       (CONS (|dispatchFunction| |STTAYLOR;powern;F2S;56|)
                             %)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 141
                       (CONS (|dispatchFunction| |STTAYLOR;mapdiv;3S;57|) %))
             NIL
             (QSETREFV % 142
                       (CONS
                        (|dispatchFunction| |STTAYLOR;lazyGintegrate;MAMS;59|)
                        %))
             NIL
             NIL
             (QSETREFV % 143
                       (CONS (|dispatchFunction| |STTAYLOR;power;A2S;62|)
                             %)))))
          %))) 

(DEFUN |StreamTaylorSeriesOperations| (#1=#:G503)
  (SPROG NIL
         (PROG (#2=#:G504)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|StreamTaylorSeriesOperations|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|StreamTaylorSeriesOperations;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|StreamTaylorSeriesOperations|)))))))))) 

(MAKEPROP '|StreamTaylorSeriesOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Stream| 6) (0 . |empty|)
              (|Boolean|) (4 . |empty?|) (9 . |rst|) (14 . |eq?|) (20 . |frst|)
              (25 . +) (|Mapping| 6 6) (31 . |map|) |STTAYLOR;+;3S;2|
              (37 . |concat|) (|Mapping| %) (43 . |delay|) |STTAYLOR;-;2S;4|
              (48 . -) |STTAYLOR;-;3S;3| (54 . -) (59 . |zero?|) (64 . *)
              |STTAYLOR;*;A2S;5| |STTAYLOR;*;SAS;6| (70 . |Zero|) (74 . |One|)
              (|Integer|) (78 . |One|) (82 . +) (|SingleInteger|) (88 . |One|)
              (92 . -) (98 . |Zero|) (|List| 6) (102 . |cons|)
              (|Union| % '"failed") (108 . |recip|) (|Union| 7 '#1="failed")
              |STTAYLOR;recip;SU;9| (|PositiveInteger|) (113 . |One|)
              (|NonNegativeInteger|) (117 . |Zero|) |STTAYLOR;exquo;2SU;11|
              |STTAYLOR;/;3S;12| (121 . |Zero|) (125 . <=) (131 . |concat|)
              |STTAYLOR;monom;AIS;15| (137 . |One|) (141 . +) (|Mapping| 46 46)
              (|Stream| 46) (147 . |stream|) (|Mapping| 31 31) (|Stream| 31)
              (153 . |stream|) |STTAYLOR;integers;IS;17|
              |STTAYLOR;oddintegers;IS;18| (159 . |stream|)
              |STTAYLOR;int;AS;19| (165 . <) (171 . =) (177 . =)
              (183 . |first|) (188 . |rest|) (193 . |explicitlyEmpty?|)
              (198 . -) |STTAYLOR;*;3S;21| |STTAYLOR;mapmult;3S;22|
              (203 . |rest|) |STTAYLOR;deriv;2S;23| (|Mapping| 6 31)
              (|StreamFunctions2| 31 6) (208 . |map|) |STTAYLOR;gderiv;M2S;24|
              |STTAYLOR;coerce;AS;25| (|Mapping| 6 6 6)
              (|StreamFunctions2| 6 6) (214 . |scan|) |STTAYLOR;eval;SAS;26|
              |STTAYLOR;compose;3S;27| (|Mapping| 7 7)
              (|ParadoxicalCombinatorsForStreams| 6) (221 . Y)
              |STTAYLOR;lagrange;2S;29| |STTAYLOR;revert;2S;30| (|Stream| 7)
              (226 . |empty?|) (231 . |frst|) (236 . |rst|)
              |STTAYLOR;prodiag;SS;32| |STTAYLOR;addiag;SS;33|
              (241 . |repeating|) (246 . |concat|) (|Mapping| 7 31 6)
              (|StreamFunctions3| 31 6 7) (252 . |map|)
              |STTAYLOR;lambert;2S;37| |STTAYLOR;oddlambert;2S;38|
              |STTAYLOR;evenlambert;2S;39| |STTAYLOR;generalLambert;S2IS;40|
              (259 . ~=) (265 . *) (|Mapping| 7 31) (|StreamFunctions2| 31 7)
              (271 . |map|) |STTAYLOR;general_Lambert_product;S2IS;42|
              (277 . |zero?|) (282 . |rest|) |STTAYLOR;multisect;2I2S;44|
              |STTAYLOR;invmultisect;2I2S;46| (288 . |empty|) (292 . |concat|)
              (|StreamFunctions2| 7 7) (298 . |map|) (304 . |delay|)
              (|Fraction| 31) (309 . /) (315 . *) (321 . |integrate|)
              (|Mapping| 7) (327 . |lazyIntegrate|) (333 . |nlde|) 'RATPOWERS
              (338 . |One|) (342 . +) (348 . |denom|) (353 . |exquo|)
              (359 . |Zero|) (363 . <) (369 . |numer|) (374 . ^) (380 . ^)
              (386 . |powern|) (392 . /) (398 . |mapdiv|)
              (404 . |lazyGintegrate|) (411 . |power|))
           '#(|revert| 417 |recip| 422 |prodiag| 427 |powern| 432 |power| 438
              |oddlambert| 444 |oddintegers| 449 |nlde| 454 |multisect| 459
              |monom| 466 |mapmult| 472 |mapdiv| 478 |lazyIntegrate| 484
              |lazyGintegrate| 490 |lambert| 497 |lagrange| 502 |invmultisect|
              507 |integrate| 514 |integers| 520 |int| 525
              |general_Lambert_product| 530 |generalLambert| 537 |gderiv| 544
              |exquo| 550 |evenlambert| 556 |eval| 561 |deriv| 567 |compose|
              572 |coerce| 578 |addiag| 583 / 588 - 594 + 605 * 611)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((+
                                 ((|Stream| |#1|) (|Stream| |#1|)
                                  (|Stream| |#1|)))
                                T)
                              '((-
                                 ((|Stream| |#1|) (|Stream| |#1|)
                                  (|Stream| |#1|)))
                                T)
                              '((- ((|Stream| |#1|) (|Stream| |#1|))) T)
                              '((*
                                 ((|Stream| |#1|) (|Stream| |#1|)
                                  (|Stream| |#1|)))
                                T)
                              '((* ((|Stream| |#1|) |#1| (|Stream| |#1|))) T)
                              '((* ((|Stream| |#1|) (|Stream| |#1|) |#1|)) T)
                              '((|exquo|
                                 ((|Union| (|Stream| |#1|) "failed")
                                  (|Stream| |#1|) (|Stream| |#1|)))
                                T)
                              '((/
                                 ((|Stream| |#1|) (|Stream| |#1|)
                                  (|Stream| |#1|)))
                                T)
                              '((|recip|
                                 ((|Union| (|Stream| |#1|) #1#)
                                  (|Stream| |#1|)))
                                T)
                              '((|monom| ((|Stream| |#1|) |#1| (|Integer|))) T)
                              '((|integers|
                                 ((|Stream| (|Integer|)) (|Integer|)))
                                T)
                              '((|oddintegers|
                                 ((|Stream| (|Integer|)) (|Integer|)))
                                T)
                              '((|int| ((|Stream| |#1|) |#1|)) T)
                              '((|mapmult|
                                 ((|Stream| |#1|) (|Stream| |#1|)
                                  (|Stream| |#1|)))
                                T)
                              '((|deriv| ((|Stream| |#1|) (|Stream| |#1|))) T)
                              '((|gderiv|
                                 ((|Stream| |#1|) (|Mapping| |#1| (|Integer|))
                                  (|Stream| |#1|)))
                                T)
                              '((|coerce| ((|Stream| |#1|) |#1|)) T)
                              '((|eval| ((|Stream| |#1|) (|Stream| |#1|) |#1|))
                                T)
                              '((|compose|
                                 ((|Stream| |#1|) (|Stream| |#1|)
                                  (|Stream| |#1|)))
                                T)
                              '((|lagrange| ((|Stream| |#1|) (|Stream| |#1|)))
                                T)
                              '((|revert| ((|Stream| |#1|) (|Stream| |#1|))) T)
                              '((|addiag|
                                 ((|Stream| |#1|) (|Stream| (|Stream| |#1|))))
                                T)
                              '((|prodiag|
                                 ((|Stream| |#1|) (|Stream| (|Stream| |#1|))))
                                T)
                              '((|lambert| ((|Stream| |#1|) (|Stream| |#1|)))
                                T)
                              '((|oddlambert|
                                 ((|Stream| |#1|) (|Stream| |#1|)))
                                T)
                              '((|evenlambert|
                                 ((|Stream| |#1|) (|Stream| |#1|)))
                                T)
                              '((|generalLambert|
                                 ((|Stream| |#1|) (|Stream| |#1|) (|Integer|)
                                  (|Integer|)))
                                T)
                              '((|general_Lambert_product|
                                 ((|Stream| |#1|) (|Stream| |#1|) (|Integer|)
                                  (|Integer|)))
                                T)
                              '((|multisect|
                                 ((|Stream| |#1|) (|Integer|) (|Integer|)
                                  (|Stream| |#1|)))
                                T)
                              '((|invmultisect|
                                 ((|Stream| |#1|) (|Integer|) (|Integer|)
                                  (|Stream| |#1|)))
                                T)
                              '((|integrate|
                                 ((|Stream| |#1|) |#1| (|Stream| |#1|)))
                                (|has| 6 (|Algebra| 122)))
                              '((|lazyIntegrate|
                                 ((|Stream| |#1|) |#1|
                                  (|Mapping| (|Stream| |#1|))))
                                (|has| 6 (|Algebra| 122)))
                              '((|nlde|
                                 ((|Stream| |#1|) (|Stream| (|Stream| |#1|))))
                                (|has| 6 (|Algebra| 122)))
                              '((|powern|
                                 ((|Stream| |#1|) (|Fraction| (|Integer|))
                                  (|Stream| |#1|)))
                                (|has| 6 (|Algebra| 122)))
                              '((|mapdiv|
                                 ((|Stream| |#1|) (|Stream| |#1|)
                                  (|Stream| |#1|)))
                                (|has| 6 (|Field|)))
                              '((|lazyGintegrate|
                                 ((|Stream| |#1|) (|Mapping| |#1| (|Integer|))
                                  |#1| (|Mapping| (|Stream| |#1|))))
                                (|has| 6 (|Field|)))
                              '((|power|
                                 ((|Stream| |#1|) |#1| (|Stream| |#1|)))
                                (|has| 6 (|Field|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 143
                                            '(0 7 0 8 1 7 9 0 10 1 7 0 0 11 2 7
                                              9 0 0 12 1 7 6 0 13 2 6 0 0 0 14
                                              2 7 0 15 0 16 2 7 0 6 0 18 1 7 0
                                              19 20 2 6 0 0 0 22 1 6 0 0 24 1 6
                                              9 0 25 2 6 0 0 0 26 0 6 0 29 0 6
                                              0 30 0 31 0 32 2 31 0 0 0 33 0 34
                                              0 35 2 31 0 0 0 36 0 34 0 37 2 38
                                              0 6 0 39 1 6 40 0 41 0 44 0 45 0
                                              46 0 47 0 31 0 50 2 31 9 0 0 51 2
                                              7 0 0 0 52 0 46 0 54 2 46 0 0 0
                                              55 2 57 0 56 46 58 2 60 0 59 31
                                              61 2 7 0 15 6 64 2 31 9 0 0 66 2
                                              6 9 0 0 67 2 46 9 0 0 68 1 38 6 0
                                              69 1 38 0 0 70 1 7 9 0 71 1 31 0
                                              0 72 1 7 0 0 75 2 78 7 77 60 79 3
                                              83 7 6 82 7 84 1 88 7 87 89 1 92
                                              9 0 93 1 92 7 0 94 1 92 0 0 95 1
                                              7 0 38 98 2 38 0 0 0 99 3 101 92
                                              100 60 7 102 2 6 9 0 0 107 2 31 0
                                              0 31 108 2 110 92 109 60 111 1 31
                                              9 0 113 2 7 0 0 46 114 0 92 0 117
                                              2 92 0 7 0 118 2 119 92 87 92 120
                                              1 92 0 19 121 2 122 0 31 31 123 2
                                              6 0 122 0 124 2 0 7 6 7 125 2 0 7
                                              6 126 127 1 0 7 92 128 0 122 0
                                              130 2 122 0 0 0 131 1 122 31 0
                                              132 2 31 40 0 0 133 0 122 0 134 2
                                              122 9 0 0 135 1 122 31 0 136 2 6
                                              0 0 46 137 2 6 0 0 122 138 2 0 7
                                              122 7 139 2 6 0 0 0 140 2 0 7 7 7
                                              141 3 0 7 77 6 126 142 2 0 7 6 7
                                              143 1 0 7 7 91 1 0 42 7 43 1 0 7
                                              92 96 2 2 7 122 7 139 2 1 7 6 7
                                              143 1 0 7 7 104 1 0 60 31 63 1 2
                                              7 92 128 3 0 7 31 31 7 115 2 0 7
                                              6 31 53 2 0 7 7 7 74 2 1 7 7 7
                                              141 2 2 7 6 126 127 3 1 7 77 6
                                              126 142 1 0 7 7 103 1 0 7 7 90 3
                                              0 7 31 31 7 116 2 2 7 6 7 125 1 0
                                              60 31 62 1 0 7 6 65 3 0 7 7 31 31
                                              112 3 0 7 7 31 31 106 2 0 7 77 7
                                              80 2 0 42 7 7 48 1 0 7 7 105 2 0
                                              7 7 6 85 1 0 7 7 76 2 0 7 7 7 86
                                              1 0 7 6 81 1 0 7 92 97 2 0 7 7 7
                                              49 1 0 7 7 21 2 0 7 7 7 23 2 0 7
                                              7 7 17 2 0 7 6 7 27 2 0 7 7 6 28
                                              2 0 7 7 7 73)))))
           '|lookupComplete|)) 
