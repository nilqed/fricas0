
(SDEFUN |STTAYLOR;zro| (($ |Stream| A)) (SPADCALL (QREFELT $ 8))) 

(SDEFUN |STTAYLOR;+;3S;2| ((|x| |Stream| A) (|y| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;+;3S;2!2| (VECTOR |x| $ |y|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;+;3S;2!2| (($$ NIL))
        (PROG (|y| $ |x|)
          (LETT |y| (QREFELT $$ 2) . #1=(|STTAYLOR;+;3S;2|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND ((SPADCALL |y| (QREFELT $ 10)) |x|)
                         ((SPADCALL |x| (QREFELT $ 10)) |y|)
                         ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 11))
                                    (QREFELT $ 12))
                          (SPADCALL (CONS #'|STTAYLOR;+;3S;2!0| (VECTOR $ |x|))
                                    |y| (QREFELT $ 16)))
                         ((SPADCALL |y| (SPADCALL |y| (QREFELT $ 11))
                                    (QREFELT $ 12))
                          (SPADCALL (CONS #'|STTAYLOR;+;3S;2!1| (VECTOR $ |y|))
                                    |x| (QREFELT $ 16)))
                         ('T
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                     (SPADCALL |y| (QREFELT $ 13))
                                     (QREFELT $ 14))
                           (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                     (SPADCALL |y| (QREFELT $ 11))
                                     (QREFELT $ 17))
                           (QREFELT $ 18))))))))) 

(SDEFUN |STTAYLOR;+;3S;2!1| ((|z| NIL) ($$ NIL))
        (PROG (|y| $)
          (LETT |y| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |y| (QREFELT $ 13)) |z| (QREFELT $ 14)))))) 

(SDEFUN |STTAYLOR;+;3S;2!0| ((|z| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 13)) |z| (QREFELT $ 14)))))) 

(SDEFUN |STTAYLOR;-;3S;3| ((|x| |Stream| A) (|y| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;-;3S;3!2| (VECTOR |x| $ |y|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;-;3S;3!2| (($$ NIL))
        (PROG (|y| $ |x|)
          (LETT |y| (QREFELT $$ 2) . #1=(|STTAYLOR;-;3S;3|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND ((SPADCALL |y| (QREFELT $ 10)) |x|)
                         ((SPADCALL |x| (QREFELT $ 10))
                          (SPADCALL |y| (QREFELT $ 21)))
                         ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 11))
                                    (QREFELT $ 12))
                          (SPADCALL (CONS #'|STTAYLOR;-;3S;3!0| (VECTOR $ |x|))
                                    |y| (QREFELT $ 16)))
                         ((SPADCALL |y| (SPADCALL |y| (QREFELT $ 11))
                                    (QREFELT $ 12))
                          (SPADCALL (CONS #'|STTAYLOR;-;3S;3!1| (VECTOR $ |y|))
                                    |x| (QREFELT $ 16)))
                         ('T
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                     (SPADCALL |y| (QREFELT $ 13))
                                     (QREFELT $ 22))
                           (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                     (SPADCALL |y| (QREFELT $ 11))
                                     (QREFELT $ 23))
                           (QREFELT $ 18))))))))) 

(SDEFUN |STTAYLOR;-;3S;3!1| ((|z| NIL) ($$ NIL))
        (PROG (|y| $)
          (LETT |y| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL |z| (SPADCALL |y| (QREFELT $ 13)) (QREFELT $ 22)))))) 

(SDEFUN |STTAYLOR;-;3S;3!0| ((|z| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 13)) |z| (QREFELT $ 22)))))) 

(SDEFUN |STTAYLOR;-;2S;4| ((|y| |Stream| A) ($ |Stream| A))
        (SPADCALL (ELT $ 24) |y| (QREFELT $ 16))) 

(SDEFUN |STTAYLOR;*;A2S;5| ((|s| A) (|x| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (COND ((SPADCALL |s| (QREFELT $ 25)) (|STTAYLOR;zro| $))
                     ('T
                      (SPADCALL (CONS #'|STTAYLOR;*;A2S;5!0| (VECTOR $ |s|))
                                |x| (QREFELT $ 16)))))) 

(SDEFUN |STTAYLOR;*;A2S;5!0| ((|z| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|STTAYLOR;*;A2S;5|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |s| |z| (QREFELT $ 26)))))) 

(SDEFUN |STTAYLOR;*;SAS;6| ((|x| |Stream| A) (|s| A) ($ |Stream| A))
        (SPROG NIL
               (COND ((SPADCALL |s| (QREFELT $ 25)) (|STTAYLOR;zro| $))
                     ('T
                      (SPADCALL (CONS #'|STTAYLOR;*;SAS;6!0| (VECTOR $ |s|))
                                |x| (QREFELT $ 16)))))) 

(SDEFUN |STTAYLOR;*;SAS;6!0| ((|z| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|STTAYLOR;*;SAS;6|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z| |s| (QREFELT $ 26)))))) 

(SDEFUN |STTAYLOR;iDiv|
        ((|x| |Stream| A) (|y| |Stream| A) (|ry0| A) ($ |Stream| A))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|STTAYLOR;iDiv!0| (VECTOR |y| |ry0| $ |x|))
                          (QREFELT $ 20))))) 

(SDEFUN |STTAYLOR;iDiv!0| (($$ NIL))
        (PROG (|x| $ |ry0| |y|)
          (LETT |x| (QREFELT $$ 3) . #1=(|STTAYLOR;iDiv|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |ry0| (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|c0| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 10)) (SPADCALL (QREFELT $ 8)))
                     ('T
                      (SEQ
                       (LETT |c0|
                             (SPADCALL (SPADCALL |x| (QREFELT $ 13)) |ry0|
                                       (QREFELT $ 26))
                             NIL)
                       (EXIT
                        (SPADCALL |c0|
                                  (|STTAYLOR;iDiv|
                                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                             (SPADCALL |c0|
                                                       (SPADCALL |y|
                                                                 (QREFELT $
                                                                          11))
                                                       (QREFELT $ 27))
                                             (QREFELT $ 23))
                                   |y| |ry0| $)
                                  (QREFELT $ 18)))))))))))) 

(SDEFUN |STTAYLOR;exquo;2SU;8|
        ((|x| |Stream| A) (|y| |Stream| A) ($ |Union| (|Stream| A) "failed"))
        (SPROG
         ((|ry0| (|Union| A "failed")) (#1=#:G839 NIL) (#2=#:G840 NIL)
          (|n| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |n| 1 . #3=(|STTAYLOR;exquo;2SU;8|)) G190 NIL
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |n| 1000 (QREFELT $ 30))
                           (SPADCALL |y| (QREFELT $ 10)))
                       (PROGN
                        (LETT #2# (CONS 1 "failed") . #3#)
                        (GO #4=#:G838)))
                      ((SPADCALL |x| (QREFELT $ 10))
                       (PROGN
                        (LETT #2# (CONS 0 (SPADCALL (QREFELT $ 8))) . #3#)
                        (GO #4#)))
                      ((SPADCALL (SPADCALL |y| (QREFELT $ 13))
                                 (|spadConstant| $ 31) (QREFELT $ 32))
                       (COND
                        ((SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                   (|spadConstant| $ 31) (QREFELT $ 32))
                         (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 11)) . #3#)
                              (EXIT
                               (LETT |y| (SPADCALL |y| (QREFELT $ 11))
                                     . #3#))))
                        ('T
                         (PROGN (LETT #2# (CONS 1 "failed") . #3#) (GO #4#)))))
                      ('T
                       (PROGN (LETT #1# |$NoValue| . #3#) (GO #5=#:G828))))))
                   (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL)))
             #5# (EXIT #1#))
            (LETT |ry0| (SPADCALL (SPADCALL |y| (QREFELT $ 13)) (QREFELT $ 34))
                  . #3#)
            (EXIT
             (COND ((QEQCAR |ry0| 1) (CONS 1 "failed"))
                   ((SPADCALL (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 10))
                    (CONS 0
                          (SPADCALL
                           (CONS #'|STTAYLOR;exquo;2SU;8!0| (VECTOR $ |ry0|))
                           |x| (QREFELT $ 16))))
                   ('T (CONS 0 (|STTAYLOR;iDiv| |x| |y| (QCDR |ry0|) $)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |STTAYLOR;exquo;2SU;8!0| ((|z| NIL) ($$ NIL))
        (PROG (|ry0| $)
          (LETT |ry0| (QREFELT $$ 1) . #1=(|STTAYLOR;exquo;2SU;8|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z| (QCDR |ry0|) (QREFELT $ 26)))))) 

(SDEFUN |STTAYLOR;/;3S;9| ((|x| |Stream| A) (|y| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|STTAYLOR;/;3S;9!1| (VECTOR |x| $ |y|))
                          (QREFELT $ 20))))) 

(SDEFUN |STTAYLOR;/;3S;9!1| (($$ NIL))
        (PROG (|y| $ |x|)
          (LETT |y| (QREFELT $$ 2) . #1=(|STTAYLOR;/;3S;9|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|ry0| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |y| (QREFELT $ 10))
                      (|error| "/: division by zero"))
                     ((SPADCALL |x| (QREFELT $ 10)) (SPADCALL (QREFELT $ 8)))
                     ('T
                      (SEQ
                       (LETT |ry0|
                             (SPADCALL (SPADCALL |y| (QREFELT $ 13))
                                       (QREFELT $ 34))
                             NIL)
                       (EXIT
                        (COND
                         ((QEQCAR |ry0| 1)
                          (|error| "/: second argument is not invertible"))
                         ((SPADCALL (SPADCALL |y| (QREFELT $ 11))
                                    (QREFELT $ 10))
                          (SPADCALL
                           (CONS #'|STTAYLOR;/;3S;9!0| (VECTOR $ |ry0|)) |x|
                           (QREFELT $ 16)))
                         ('T
                          (|STTAYLOR;iDiv| |x| |y| (QCDR |ry0|) $))))))))))))) 

(SDEFUN |STTAYLOR;/;3S;9!0| ((|z| NIL) ($$ NIL))
        (PROG (|ry0| $)
          (LETT |ry0| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z| (QCDR |ry0|) (QREFELT $ 26)))))) 

(SDEFUN |STTAYLOR;recip;SU;10|
        ((|x| |Stream| A) ($ |Union| (|Stream| A) "failed"))
        (SPROG ((|rh| (A)) (|rh1| (|Union| A "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 10)) (CONS 1 "failed"))
                      (#1='T
                       (SEQ
                        (LETT |rh1|
                              (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                        (QREFELT $ 34))
                              . #2=(|STTAYLOR;recip;SU;10|))
                        (EXIT
                         (COND ((QEQCAR |rh1| 1) (CONS 1 "failed"))
                               (#1#
                                (SEQ (LETT |rh| (QCDR |rh1|) . #2#)
                                     (EXIT
                                      (CONS 0
                                            (SPADCALL
                                             (CONS #'|STTAYLOR;recip;SU;10!0|
                                                   (VECTOR $ |x| |rh|))
                                             (QREFELT $ 20)))))))))))))) 

(SDEFUN |STTAYLOR;recip;SU;10!0| (($$ NIL))
        (PROG (|rh| |x| $)
          (LETT |rh| (QREFELT $$ 2) . #1=(|STTAYLOR;recip;SU;10|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |rh|
                      (|STTAYLOR;iDiv|
                       (SPADCALL
                        (SPADCALL |rh| (SPADCALL |x| (QREFELT $ 11))
                                  (QREFELT $ 27))
                        (QREFELT $ 21))
                       |x| |rh| $)
                      (QREFELT $ 18)))))) 

(SDEFUN |STTAYLOR;rp| ((|z| |Integer|) (|s| A) ($ |List| A))
        (COND ((SPADCALL |z| 0 (QREFELT $ 40)) NIL)
              ('T (CONS |s| (|STTAYLOR;rp| (- |z| 1) |s| $))))) 

(SDEFUN |STTAYLOR;rpSt| ((|z| |Integer|) (|s| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;rpSt!0| (VECTOR |s| $ |z|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;rpSt!0| (($$ NIL))
        (PROG (|z| $ |s|)
          (LETT |z| (QREFELT $$ 2) . #1=(|STTAYLOR;rpSt|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |s| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |z| (|spadConstant| $ 42) (QREFELT $ 40))
              (SPADCALL (QREFELT $ 8)))
             ('T
              (SPADCALL |s|
                        (|STTAYLOR;rpSt|
                         (SPADCALL |z| (|spadConstant| $ 43) (QREFELT $ 44))
                         |s| $)
                        (QREFELT $ 18)))))))) 

(SDEFUN |STTAYLOR;monom;AIS;13| ((|s| A) (|z| |Integer|) ($ |Stream| A))
        (COND
         ((< |z| 0)
          (|error| "monom: cannot create monomial of negative degree"))
         ('T
          (SPADCALL (|STTAYLOR;rpSt| |z| (|spadConstant| $ 31) $)
                    (SPADCALL |s| (|STTAYLOR;zro| $) (QREFELT $ 18))
                    (QREFELT $ 45))))) 

(SDEFUN |STTAYLOR;nnintegers|
        ((|zz| |NonNegativeInteger|) ($ |Stream| (|NonNegativeInteger|)))
        (SPADCALL (CONS #'|STTAYLOR;nnintegers!0| $) |zz| (QREFELT $ 51))) 

(SDEFUN |STTAYLOR;nnintegers!0| ((|y| NIL) ($ NIL))
        (SPADCALL |y| (|spadConstant| $ 47) (QREFELT $ 48))) 

(SDEFUN |STTAYLOR;integers;IS;15| ((|z| |Integer|) ($ |Stream| (|Integer|)))
        (SPADCALL (CONS #'|STTAYLOR;integers;IS;15!0| $) |z| (QREFELT $ 55))) 

(SDEFUN |STTAYLOR;integers;IS;15!0| ((|y| NIL) ($ NIL))
        (SPADCALL |y| (|spadConstant| $ 43) (QREFELT $ 52))) 

(SDEFUN |STTAYLOR;oddintegers;IS;16| ((|z| |Integer|) ($ |Stream| (|Integer|)))
        (SPADCALL (CONS #'|STTAYLOR;oddintegers;IS;16!0| $) |z| (QREFELT $ 55))) 

(SDEFUN |STTAYLOR;oddintegers;IS;16!0| ((|y| NIL) ($ NIL))
        (SPADCALL |y| 2 (QREFELT $ 52))) 

(SDEFUN |STTAYLOR;int;AS;17| ((|s| A) ($ |Stream| A))
        (SPADCALL (CONS #'|STTAYLOR;int;AS;17!0| $) |s| (QREFELT $ 58))) 

(SDEFUN |STTAYLOR;int;AS;17!0| ((|y| NIL) ($ NIL))
        (SPADCALL |y| (|spadConstant| $ 41) (QREFELT $ 14))) 

(SDEFUN |STTAYLOR;stmult|
        ((|n0| |Integer|) (|x0| |Stream| A) (|y0| |Stream| A) (|ll0| |List| A)
         ($ |Stream| A))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLOR;stmult!0| (VECTOR $ |ll0| |n0| |y0| |x0|))
                 (QREFELT $ 20))))) 

(SDEFUN |STTAYLOR;stmult!0| (($$ NIL))
        (PROG (|x0| |y0| |n0| |ll0| $)
          (LETT |x0| (QREFELT $$ 4) . #1=(|STTAYLOR;stmult|))
          (LETT |y0| (QREFELT $$ 3) . #1#)
          (LETT |n0| (QREFELT $$ 2) . #1#)
          (LETT |ll0| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|x| NIL) (|c| NIL) (|y| NIL) (|ll| NIL) (|n| NIL) (|i| NIL)
              (#2=#:G928 NIL) (#3=#:G927 NIL) (#4=#:G926 NIL) (|res| NIL)
              (|llp| NIL) (|xp| NIL))
             (SEQ
              (EXIT
               (SEQ (LETT |x| |x0| NIL) (LETT |y| |y0| NIL) (LETT |n| |n0| NIL)
                    (LETT |ll| |ll0| NIL)
                    (COND
                     ((SPADCALL |y| (QREFELT $ 10))
                      (COND
                       ((OR (SPADCALL |n| (|spadConstant| $ 64) (QREFELT $ 60))
                            (SPADCALL |x| (QREFELT $ 10)))
                        (PROGN
                         (LETT #3# (SPADCALL (QREFELT $ 8)) NIL)
                         (GO #5=#:G925)))
                       ('T (LETT |x| (SPADCALL |x| (QREFELT $ 11)) NIL))))
                     ('T
                      (SEQ (LETT |c| (SPADCALL |y| (QREFELT $ 13)) NIL)
                           (LETT |y| (SPADCALL |y| (QREFELT $ 11)) NIL)
                           (EXIT
                            (COND
                             ((SPADCALL |n| (|spadConstant| $ 64)
                                        (QREFELT $ 60))
                              (COND
                               ((SPADCALL |c| (|spadConstant| $ 31)
                                          (QREFELT $ 32))
                                (PROGN
                                 (LETT #3#
                                       (SPADCALL (|spadConstant| $ 31)
                                                 (|STTAYLOR;stmult| |n| |x| |y|
                                                  |ll| $)
                                                 (QREFELT $ 18))
                                       NIL)
                                 (GO #5#)))
                               ('T
                                (SEQ
                                 (LETT |ll| (SPADCALL |c| |ll| (QREFELT $ 62))
                                       NIL)
                                 (EXIT
                                  (LETT |n|
                                        (SPADCALL |n| (|spadConstant| $ 70)
                                                  (QREFELT $ 52))
                                        NIL))))))
                             ('T
                              (SEQ
                               (LETT |ll| (SPADCALL |c| |ll| (QREFELT $ 62))
                                     NIL)
                               (EXIT
                                (LETT |n|
                                      (SPADCALL |n| (|spadConstant| $ 70)
                                                (QREFELT $ 52))
                                      NIL)))))))))
                    (LETT |res| (|spadConstant| $ 31) NIL) (LETT |xp| |x| NIL)
                    (LETT |llp| |ll| NIL)
                    (SEQ
                     (EXIT
                      (SEQ (LETT |i| (|spadConstant| $ 64) NIL)
                           (LETT #2# |n| NIL) G190
                           (COND ((> |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |xp| (QREFELT $ 10))
                               (COND
                                ((SPADCALL |i| (|spadConstant| $ 65)
                                           (QREFELT $ 66))
                                 (PROGN
                                  (LETT #3# (SPADCALL (QREFELT $ 8)) NIL)
                                  (GO #5#)))
                                ('T
                                 (PROGN
                                  (LETT #4# |$NoValue| NIL)
                                  (GO #6=#:G921)))))
                              ('T
                               (SEQ
                                (LETT |res|
                                      (SPADCALL |res|
                                                (SPADCALL
                                                 (SPADCALL |xp| (QREFELT $ 13))
                                                 (SPADCALL |llp|
                                                           (QREFELT $ 67))
                                                 (QREFELT $ 26))
                                                (QREFELT $ 14))
                                      NIL)
                                (LETT |llp| (SPADCALL |llp| (QREFELT $ 68))
                                      NIL)
                                (EXIT
                                 (LETT |xp| (SPADCALL |xp| (QREFELT $ 11))
                                       NIL)))))))
                           (LETT |i| (+ |i| 1) NIL) (GO G190) G191 (EXIT NIL)))
                     #6# (EXIT #4#))
                    (COND
                     ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 69))
                      (COND
                       ((SPADCALL |y| (QREFELT $ 69))
                        (EXIT
                         (SPADCALL |res| (SPADCALL (QREFELT $ 8))
                                   (QREFELT $ 18)))))))
                    (EXIT
                     (SPADCALL |res| (|STTAYLOR;stmult| |n| |x| |y| |ll| $)
                               (QREFELT $ 18)))))
              #5# (EXIT #3#))))))) 

(SDEFUN |STTAYLOR;*;3S;19| ((|x| |Stream| A) (|y| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;*;3S;19!0| (VECTOR |x| $ |y|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;*;3S;19!0| (($$ NIL))
        (PROG (|y| $ |x|)
          (LETT |y| (QREFELT $$ 2) . #1=(|STTAYLOR;*;3S;19|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((OR (SPADCALL |y| (QREFELT $ 10)) (SPADCALL |x| (QREFELT $ 10)))
              (|STTAYLOR;zro| $))
             ('T
              (|STTAYLOR;stmult|
               (SPADCALL (|spadConstant| $ 43) (QREFELT $ 71)) |x| |y| NIL
               $))))))) 

(SDEFUN |STTAYLOR;mapmult;3S;20|
        ((|x| |Stream| A) (|y| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;mapmult;3S;20!0| (VECTOR |x| $ |y|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;mapmult;3S;20!0| (($$ NIL))
        (PROG (|y| $ |x|)
          (LETT |y| (QREFELT $$ 2) . #1=(|STTAYLOR;mapmult;3S;20|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((OR (SPADCALL |y| (QREFELT $ 10)) (SPADCALL |x| (QREFELT $ 10)))
              (|STTAYLOR;zro| $))
             ('T
              (SPADCALL
               (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                         (SPADCALL |y| (QREFELT $ 13)) (QREFELT $ 26))
               (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                         (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 73))
               (QREFELT $ 18)))))))) 

(SDEFUN |STTAYLOR;deriv;2S;21| ((|x| |Stream| A) ($ |Stream| A))
        (COND ((SPADCALL |x| (QREFELT $ 10)) (|STTAYLOR;zro| $))
              ('T
               (SPADCALL (SPADCALL (|spadConstant| $ 41) (QREFELT $ 59))
                         (SPADCALL |x| (QREFELT $ 74)) (QREFELT $ 73))))) 

(SDEFUN |STTAYLOR;gderiv;M2S;22|
        ((|f| |Mapping| A (|Integer|)) (|x| |Stream| A) ($ |Stream| A))
        (COND ((SPADCALL |x| (QREFELT $ 10)) (|STTAYLOR;zro| $))
              ('T
               (SPADCALL
                (SPADCALL |f| (SPADCALL 0 (QREFELT $ 56)) (QREFELT $ 78)) |x|
                (QREFELT $ 73))))) 

(SDEFUN |STTAYLOR;coerce;AS;23| ((|s| A) ($ |Stream| A))
        (COND ((SPADCALL |s| (QREFELT $ 25)) (|STTAYLOR;zro| $))
              ('T (SPADCALL |s| (|STTAYLOR;zro| $) (QREFELT $ 18))))) 

(SDEFUN |STTAYLOR;eval;SAS;24| ((|x| |Stream| A) (|at| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (|spadConstant| $ 31) (ELT $ 14)
                         (SPADCALL |x|
                                   (SPADCALL
                                    (CONS #'|STTAYLOR;eval;SAS;24!0|
                                          (VECTOR $ |at|))
                                    (|spadConstant| $ 41) (QREFELT $ 58))
                                   (QREFELT $ 73))
                         (QREFELT $ 83)))) 

(SDEFUN |STTAYLOR;eval;SAS;24!0| ((|y| NIL) ($$ NIL))
        (PROG (|at| $)
          (LETT |at| (QREFELT $$ 1) . #1=(|STTAYLOR;eval;SAS;24|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |at| |y| (QREFELT $ 26)))))) 

(SDEFUN |STTAYLOR;compose;3S;25|
        ((|x| |Stream| A) (|y| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;compose;3S;25!0| (VECTOR |x| $ |y|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;compose;3S;25!0| (($$ NIL))
        (PROG (|y| $ |x|)
          (LETT |y| (QREFELT $$ 2) . #1=(|STTAYLOR;compose;3S;25|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |y| (QREFELT $ 10))
              (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (|STTAYLOR;zro| $)
                        (QREFELT $ 18)))
             ((NULL (SPADCALL (SPADCALL |y| (QREFELT $ 13)) (QREFELT $ 25)))
              (|error|
               "compose: 2nd argument should have 0 constant coefficient"))
             ('T
              (COND ((SPADCALL |x| (QREFELT $ 10)) (|STTAYLOR;zro| $))
                    ('T
                     (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                               (SPADCALL
                                (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |y|
                                          (QREFELT $ 85))
                                (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 72))
                               (QREFELT $ 18)))))))))) 

(SDEFUN |STTAYLOR;lagrangere|
        ((|x| |Stream| A) (|c| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;lagrangere!0| (VECTOR |c| |x| $))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;lagrangere!0| (($$ NIL))
        (PROG ($ |x| |c|)
          (LETT $ (QREFELT $$ 2) . #1=(|STTAYLOR;lagrangere|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |c| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| $ 31) (SPADCALL |x| |c| (QREFELT $ 85))
                      (QREFELT $ 18)))))) 

(SDEFUN |STTAYLOR;lagrange;2S;27| ((|x| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;lagrange;2S;27!0| (VECTOR $ |x|))
                         (QREFELT $ 88)))) 

(SDEFUN |STTAYLOR;lagrange;2S;27!0| ((|y| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|STTAYLOR;lagrange;2S;27|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|STTAYLOR;lagrangere| |x| |y| $))))) 

(SDEFUN |STTAYLOR;revert;2S;28| ((|x| |Stream| A) ($ |Stream| A))
        (SPROG ((#1=#:G971 NIL) (|y| (|Union| (|Stream| A) #2="failed")))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 10))
                  (|error| "revert: should be nonzero"))
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 25))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 10))
                    (|error| "revert: should be nonzero"))
                   (#3='T
                    (SEQ
                     (LETT |y|
                           (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                     (QREFELT $ 38))
                           . #4=(|STTAYLOR;revert;2S;28|))
                     (EXIT
                      (COND
                       ((QEQCAR |y| 0)
                        (SPADCALL
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                             (QREFELT $ 38))
                                   . #4#)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0)
                                           (|Stream| (QREFELT $ 6))
                                           (|Union| (|Stream| (QREFELT $ 6))
                                                    #2#)
                                           #1#))
                         (QREFELT $ 89)))
                       (#3#
                        (|error|
                         "revert: should start 0, x, ... with invertible x"))))))))
                 (#3# (|error| "revert: should start 0, x, ...")))))) 

(SDEFUN |STTAYLOR;prodiag1|
        ((|ststa| |Stream| (|Stream| A)) (|n| |Integer|) ($ |Stream| A))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|STTAYLOR;prodiag1!0| (VECTOR |n| $ |ststa|))
                          (QREFELT $ 20))))) 

(SDEFUN |STTAYLOR;prodiag1!0| (($$ NIL))
        (PROG (|ststa| $ |n|)
          (LETT |ststa| (QREFELT $$ 2) . #1=(|STTAYLOR;prodiag1|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|f1| NIL) (|r1| NIL) (|p1| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |ststa| (QREFELT $ 92)) (|STTAYLOR;zro| $))
                     ('T
                      (SEQ (LETT |f1| (SPADCALL |ststa| (QREFELT $ 93)) NIL)
                           (LETT |r1| (SPADCALL |ststa| (QREFELT $ 94)) NIL)
                           (LETT |p1|
                                 (|STTAYLOR;prodiag1| |r1|
                                  (SPADCALL |n| (|spadConstant| $ 96)
                                            (QREFELT $ 52))
                                  $)
                                 NIL)
                           (EXIT
                            (COND
                             ((SPADCALL |f1| (QREFELT $ 10))
                              (SPADCALL (|spadConstant| $ 31) |p1|
                                        (QREFELT $ 18)))
                             ('T
                              (SPADCALL (SPADCALL |f1| (QREFELT $ 13))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |f1| (QREFELT $ 11)) |p1|
                                          (QREFELT $ 17))
                                         (SPADCALL
                                          (|STTAYLOR;rpSt| |n|
                                           (|spadConstant| $ 31) $)
                                          (SPADCALL |f1| |p1| (QREFELT $ 72))
                                          (QREFELT $ 45))
                                         (QREFELT $ 17))
                                        (QREFELT $ 18)))))))))))))) 

(SDEFUN |STTAYLOR;prodiag;SS;30|
        ((|ststa| |Stream| (|Stream| A)) ($ |Stream| A))
        (SPADCALL (|spadConstant| $ 41) (|STTAYLOR;prodiag1| |ststa| 1 $)
                  (QREFELT $ 18))) 

(SDEFUN |STTAYLOR;addiag;SS;31|
        ((|ststa| |Stream| (|Stream| A)) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;addiag;SS;31!0| (VECTOR $ |ststa|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;addiag;SS;31!0| (($$ NIL))
        (PROG (|ststa| $)
          (LETT |ststa| (QREFELT $$ 1) . #1=(|STTAYLOR;addiag;SS;31|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |ststa| (QREFELT $ 92)) (|STTAYLOR;zro| $))
                  ((SPADCALL (SPADCALL |ststa| (QREFELT $ 93)) (QREFELT $ 10))
                   (SPADCALL (|spadConstant| $ 31)
                             (SPADCALL (SPADCALL |ststa| (QREFELT $ 94))
                                       (QREFELT $ 98))
                             (QREFELT $ 18)))
                  ('T
                   (SPADCALL
                    (SPADCALL (SPADCALL |ststa| (QREFELT $ 93)) (QREFELT $ 13))
                    (SPADCALL
                     (SPADCALL (SPADCALL |ststa| (QREFELT $ 93))
                               (QREFELT $ 11))
                     (SPADCALL (SPADCALL |ststa| (QREFELT $ 94))
                               (QREFELT $ 98))
                     (QREFELT $ 17))
                    (QREFELT $ 18)))))))) 

(SDEFUN |STTAYLOR;rptg1| ((|z| |Integer|) (|s| A) ($ |Stream| A))
        (SPADCALL (CONS |s| (|STTAYLOR;rp| |z| (|spadConstant| $ 31) $))
                  (QREFELT $ 99))) 

(SDEFUN |STTAYLOR;rptg2| ((|z| |Integer|) (|s| A) ($ |Stream| A))
        (SPADCALL
         (SPADCALL (|STTAYLOR;rp| |z| (|spadConstant| $ 31) $)
                   (CONS |s| (|STTAYLOR;rp| (- |z| 1) (|spadConstant| $ 31) $))
                   (QREFELT $ 100))
         (QREFELT $ 99))) 

(SDEFUN |STTAYLOR;rptg3|
        ((|a| |Integer|) (|d| |Integer|) (|n| |Integer|) (|s| A)
         ($ |Stream| A))
        (SPADCALL (|STTAYLOR;rpSt| (* |n| (- |a| 1)) (|spadConstant| $ 31) $)
                  (SPADCALL
                   (CONS |s|
                         (|STTAYLOR;rp| (- (* |d| |n|) 1) (|spadConstant| $ 31)
                          $))
                   (QREFELT $ 99))
                  (QREFELT $ 45))) 

(SDEFUN |STTAYLOR;lambert;2S;35| ((|x| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;lambert;2S;35!0| (VECTOR $ |x|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;lambert;2S;35!0| (($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|STTAYLOR;lambert;2S;35|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 10)) (|STTAYLOR;zro| $))
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 25))
                   (SPADCALL (|spadConstant| $ 31)
                             (SPADCALL
                              (SPADCALL (CONS (|function| |STTAYLOR;rptg1|) $)
                                        (SPADCALL (|spadConstant| $ 42)
                                                  (QREFELT $ 56))
                                        (SPADCALL |x| (QREFELT $ 11))
                                        (QREFELT $ 103))
                              (QREFELT $ 98))
                             (QREFELT $ 18)))
                  ('T
                   (|error| "lambert:constant coefficient should be zero"))))))) 

(SDEFUN |STTAYLOR;oddlambert;2S;36| ((|x| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;oddlambert;2S;36!0| (VECTOR $ |x|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;oddlambert;2S;36!0| (($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|STTAYLOR;oddlambert;2S;36|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 10)) (|STTAYLOR;zro| $))
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 25))
                   (SPADCALL (|spadConstant| $ 31)
                             (SPADCALL
                              (SPADCALL (CONS (|function| |STTAYLOR;rptg1|) $)
                                        (SPADCALL (|spadConstant| $ 43)
                                                  (QREFELT $ 57))
                                        (SPADCALL |x| (QREFELT $ 11))
                                        (QREFELT $ 103))
                              (QREFELT $ 98))
                             (QREFELT $ 18)))
                  ('T
                   (|error|
                    "oddlambert: constant coefficient should be zero"))))))) 

(SDEFUN |STTAYLOR;evenlambert;2S;37| ((|x| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;evenlambert;2S;37!0| (VECTOR $ |x|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;evenlambert;2S;37!0| (($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|STTAYLOR;evenlambert;2S;37|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 10)) (|STTAYLOR;zro| $))
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 25))
                   (SPADCALL (|spadConstant| $ 31)
                             (SPADCALL
                              (SPADCALL (CONS (|function| |STTAYLOR;rptg2|) $)
                                        (SPADCALL (|spadConstant| $ 43)
                                                  (QREFELT $ 56))
                                        (SPADCALL |x| (QREFELT $ 11))
                                        (QREFELT $ 103))
                              (QREFELT $ 98))
                             (QREFELT $ 18)))
                  ('T
                   (|error|
                    "evenlambert: constant coefficient should be zero"))))))) 

(SDEFUN |STTAYLOR;generalLambert;S2IS;38|
        ((|st| |Stream| A) (|a| |Integer|) (|d| |Integer|) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL
                (CONS #'|STTAYLOR;generalLambert;S2IS;38!1|
                      (VECTOR |st| |d| $ |a|))
                (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;generalLambert;S2IS;38!1| (($$ NIL))
        (PROG (|a| $ |d| |st|)
          (LETT |a| (QREFELT $$ 3) . #1=(|STTAYLOR;generalLambert;S2IS;38|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |d| (QREFELT $$ 1) . #1#)
          (LETT |st| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND
                    ((OR (SPADCALL |a| (|spadConstant| $ 43) (QREFELT $ 60))
                         (SPADCALL |d| (|spadConstant| $ 43) (QREFELT $ 60)))
                     (|error|
                      "generalLambert: both integer arguments must be positive"))
                    ('T
                     (COND ((SPADCALL |st| (QREFELT $ 10)) (|STTAYLOR;zro| $))
                           ((SPADCALL (SPADCALL |st| (QREFELT $ 13))
                                      (QREFELT $ 25))
                            (SPADCALL (|spadConstant| $ 31)
                                      (SPADCALL
                                       (SPADCALL
                                        (CONS
                                         #'|STTAYLOR;generalLambert;S2IS;38!0|
                                         (VECTOR $ |d| |a|))
                                        (SPADCALL (|spadConstant| $ 43)
                                                  (QREFELT $ 56))
                                        (SPADCALL |st| (QREFELT $ 11))
                                        (QREFELT $ 103))
                                       (QREFELT $ 98))
                                      (QREFELT $ 18)))
                           ('T
                            (|error|
                             "generalLambert: constant coefficient should be zero")))))))))) 

(SDEFUN |STTAYLOR;generalLambert;S2IS;38!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|a| |d| $)
          (LETT |a| (QREFELT $$ 2) NIL)
          (LETT |d| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|STTAYLOR;rptg3| |a| |d| |x| |y| $))))) 

(SDEFUN |STTAYLOR;rptg4|
        ((|a| |Integer|) (|d| |Integer|) (|st| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;rptg4!0| (VECTOR |d| |a| $ |st|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;rptg4!0| (($$ NIL))
        (PROG (|st| $ |a| |d|)
          (LETT |st| (QREFELT $$ 3) . #1=(|STTAYLOR;rptg4|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |a| (QREFELT $$ 1) . #1#)
          (LETT |d| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |st| (QREFELT $ 10)) (|STTAYLOR;zro| $))
                  ('T
                   (SPADCALL (|STTAYLOR;rpSt| |a| (|spadConstant| $ 31) $)
                             (SPADCALL (SPADCALL |st| (QREFELT $ 13))
                                       (|STTAYLOR;rptg4| |d| |d|
                                        (SPADCALL |st| (QREFELT $ 11)) $)
                                       (QREFELT $ 18))
                             (QREFELT $ 45)))))))) 

(SDEFUN |STTAYLOR;general_Lambert_product;S2IS;40|
        ((|st| |Stream| A) (|a| |Integer|) (|d| |Integer|) ($ |Stream| A))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLOR;general_Lambert_product;S2IS;40!1|
                       (VECTOR |st| |d| $ |a|))
                 (QREFELT $ 20))))) 

(SDEFUN |STTAYLOR;general_Lambert_product;S2IS;40!1| (($$ NIL))
        (PROG (|a| $ |d| |st|)
          (LETT |a| (QREFELT $$ 3)
                . #1=(|STTAYLOR;general_Lambert_product;S2IS;40|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |d| (QREFELT $$ 1) . #1#)
          (LETT |st| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|st1| NIL))
                   (SEQ
                    (COND
                     ((OR (SPADCALL |a| (|spadConstant| $ 43) (QREFELT $ 60))
                          (SPADCALL |d| (|spadConstant| $ 43) (QREFELT $ 60)))
                      (|error|
                       "general_Lambert_product: both integer arguments must be positive"))
                     ((OR (SPADCALL |st| (QREFELT $ 10))
                          (SPADCALL (SPADCALL |st| (QREFELT $ 13))
                                    (|spadConstant| $ 41) (QREFELT $ 108)))
                      (|error|
                       "general_Lambert_product: constant coefficient should be one"))
                     ('T
                      (SEQ (LETT |st1| (SPADCALL |st| (QREFELT $ 11)) NIL)
                           (EXIT
                            (SPADCALL
                             (SPADCALL
                              (CONS
                               #'|STTAYLOR;general_Lambert_product;S2IS;40!0|
                               (VECTOR |st1| $ |d| |a|))
                              (SPADCALL (|spadConstant| $ 42) (QREFELT $ 56))
                              (QREFELT $ 112))
                             (QREFELT $ 97)))))))))))) 

(SDEFUN |STTAYLOR;general_Lambert_product;S2IS;40!0| ((|n| NIL) ($$ NIL))
        (PROG (|a| |d| $ |st1|)
          (LETT |a| (QREFELT $$ 3) NIL)
          (LETT |d| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |st1| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|STTAYLOR;rptg4|
             (SPADCALL
              (SPADCALL
               (SPADCALL |a| (SPADCALL |n| |d| (QREFELT $ 109)) (QREFELT $ 52))
               |n| (QREFELT $ 44))
              (|spadConstant| $ 43) (QREFELT $ 44))
             (SPADCALL
              (SPADCALL |a| (SPADCALL |n| |d| (QREFELT $ 109)) (QREFELT $ 52))
              (|spadConstant| $ 43) (QREFELT $ 44))
             |st1| $))))) 

(SDEFUN |STTAYLOR;ms|
        ((|m| |Integer|) (|n| |Integer|) (|s| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;ms!0| (VECTOR |m| |n| $ |s|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;ms!0| (($$ NIL))
        (PROG (|s| $ |n| |m|)
          (LETT |s| (QREFELT $$ 3) . #1=(|STTAYLOR;ms|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |n| (QREFELT $$ 1) . #1#)
          (LETT |m| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |s| (QREFELT $ 10)) (|STTAYLOR;zro| $))
                  ((SPADCALL |n| (QREFELT $ 114))
                   (SPADCALL (SPADCALL |s| (QREFELT $ 13))
                             (|STTAYLOR;ms| |m|
                              (SPADCALL |m| (|spadConstant| $ 43)
                                        (QREFELT $ 44))
                              (SPADCALL |s| (QREFELT $ 11)) $)
                             (QREFELT $ 18)))
                  ('T
                   (|STTAYLOR;ms| |m|
                    (SPADCALL |n| (|spadConstant| $ 43) (QREFELT $ 44))
                    (SPADCALL |s| (QREFELT $ 11)) $))))))) 

(SDEFUN |STTAYLOR;multisect;2I2S;42|
        ((|b| |Integer|) (|a| |Integer|) (|x| |Stream| A) ($ |Stream| A))
        (SPROG ((#1=#:G1087 NIL))
               (|STTAYLOR;ms| (+ |a| |b|) 0
                (SPADCALL |x|
                          (PROG1 (LETT #1# |a| |STTAYLOR;multisect;2I2S;42|)
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT $ 115))
                $))) 

(SDEFUN |STTAYLOR;altn| ((|zs| |Stream| A) (|s| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;altn!0| (VECTOR |zs| $ |s|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;altn!0| (($$ NIL))
        (PROG (|s| $ |zs|)
          (LETT |s| (QREFELT $$ 2) . #1=(|STTAYLOR;altn|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |zs| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |s| (QREFELT $ 10)) (|STTAYLOR;zro| $))
                  ('T
                   (SPADCALL (SPADCALL |s| (QREFELT $ 13))
                             (SPADCALL |zs|
                                       (|STTAYLOR;altn| |zs|
                                        (SPADCALL |s| (QREFELT $ 11)) $)
                                       (QREFELT $ 45))
                             (QREFELT $ 18)))))))) 

(SDEFUN |STTAYLOR;invmultisect;2I2S;44|
        ((|a| |Integer|) (|b| |Integer|) (|x| |Stream| A) ($ |Stream| A))
        (SPADCALL (|STTAYLOR;rpSt| |b| (|spadConstant| $ 31) $)
                  (|STTAYLOR;altn|
                   (|STTAYLOR;rpSt| (- (+ |a| |b|) 1) (|spadConstant| $ 31) $)
                   |x| $)
                  (QREFELT $ 45))) 

(SDEFUN |STTAYLOR;comps|
        ((|ststa| |Stream| (|Stream| A)) (|x| |Stream| A)
         ($ |Stream| (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;comps!1| (VECTOR |x| $ |ststa|))
                         (QREFELT $ 122)))) 

(SDEFUN |STTAYLOR;comps!1| (($$ NIL))
        (PROG (|ststa| $ |x|)
          (LETT |ststa| (QREFELT $$ 2) . #1=(|STTAYLOR;comps|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND
                    ((SPADCALL |ststa| (QREFELT $ 92))
                     (SPADCALL (QREFELT $ 118)))
                    ((SPADCALL |x| (QREFELT $ 10))
                     (SPADCALL (SPADCALL |ststa| (QREFELT $ 93))
                               (SPADCALL (QREFELT $ 118)) (QREFELT $ 119)))
                    ('T
                     (SPADCALL (SPADCALL |ststa| (QREFELT $ 93))
                               (SPADCALL
                                (CONS #'|STTAYLOR;comps!0| (VECTOR $ |x|))
                                (|STTAYLOR;comps|
                                 (SPADCALL |ststa| (QREFELT $ 94)) |x| $)
                                (QREFELT $ 121))
                               (QREFELT $ 119))))))))) 

(SDEFUN |STTAYLOR;comps!0| ((|y| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |y| (QREFELT $ 72)))))) 

(SDEFUN |STTAYLOR;integre| ((|x| |Stream| A) (|n| |Integer|) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;integre!0| (VECTOR |n| $ |x|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;integre!0| (($$ NIL))
        (PROG (|x| $ |n|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STTAYLOR;integre|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 10)) (|STTAYLOR;zro| $))
                  ('T
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 43) |n| (QREFELT $ 124))
                     (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 125))
                    (|STTAYLOR;integre| (SPADCALL |x| (QREFELT $ 11))
                     (SPADCALL |n| (|spadConstant| $ 43) (QREFELT $ 52)) $)
                    (QREFELT $ 18)))))))) 

(SDEFUN |STTAYLOR;integ| ((|x| |Stream| A) ($ |Stream| A))
        (|STTAYLOR;integre| |x| 1 $)) 

(SDEFUN |STTAYLOR;integrate;A2S;48| ((|a| A) (|x| |Stream| A) ($ |Stream| A))
        (SPADCALL |a| (|STTAYLOR;integ| |x| $) (QREFELT $ 18))) 

(SDEFUN |STTAYLOR;lazyIntegrate;AMS;49|
        ((|s| A) (|xf| |Mapping| (|Stream| A)) ($ |Stream| A))
        (SPADCALL |s| (|STTAYLOR;integ| (SPADCALL |xf| (QREFELT $ 20)) $)
                  (QREFELT $ 18))) 

(SDEFUN |STTAYLOR;nldere|
        ((|lslsa| |Stream| (|Stream| A)) (|c| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (|spadConstant| $ 31)
                         (CONS #'|STTAYLOR;nldere!0| (VECTOR $ |c| |lslsa|))
                         (QREFELT $ 128)))) 

(SDEFUN |STTAYLOR;nldere!0| (($$ NIL))
        (PROG (|lslsa| |c| $)
          (LETT |lslsa| (QREFELT $$ 2) . #1=(|STTAYLOR;nldere|))
          (LETT |c| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (SPADCALL (|STTAYLOR;comps| |lslsa| |c| $) (QREFELT $ 98)))))) 

(SDEFUN |STTAYLOR;nlde;SS;51| ((|lslsa| |Stream| (|Stream| A)) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;nlde;SS;51!0| (VECTOR $ |lslsa|))
                         (QREFELT $ 88)))) 

(SDEFUN |STTAYLOR;nlde;SS;51!0| ((|y| NIL) ($$ NIL))
        (PROG (|lslsa| $)
          (LETT |lslsa| (QREFELT $$ 1) . #1=(|STTAYLOR;nlde;SS;51|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|STTAYLOR;nldere| |lslsa| |y| $))))) 

(SDEFUN |STTAYLOR;smult|
        ((|rn| |Fraction| (|Integer|)) (|x| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;smult!0| (VECTOR $ |rn|)) |x|
                         (QREFELT $ 16)))) 

(SDEFUN |STTAYLOR;smult!0| ((|y| NIL) ($$ NIL))
        (PROG (|rn| $)
          (LETT |rn| (QREFELT $$ 1) . #1=(|STTAYLOR;smult|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |rn| |y| (QREFELT $ 125)))))) 

(SDEFUN |STTAYLOR;powerrn|
        ((|rn| |Fraction| (|Integer|)) (|x| |Stream| A) (|c| |Stream| A)
         ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;powerrn!0| (VECTOR |x| |c| |rn| $))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;powerrn!0| (($$ NIL))
        (PROG ($ |rn| |c| |x|)
          (LETT $ (QREFELT $$ 3) . #1=(|STTAYLOR;powerrn|))
          (LETT |rn| (QREFELT $$ 2) . #1#)
          (LETT |c| (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| $ 41)
                      (SPADCALL
                       (|STTAYLOR;integ|
                        (|STTAYLOR;smult|
                         (SPADCALL |rn| (|spadConstant| $ 131) (QREFELT $ 132))
                         (SPADCALL |c| (SPADCALL |x| (QREFELT $ 75))
                                   (QREFELT $ 72))
                         $)
                        $)
                       (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |c|
                                 (QREFELT $ 72))
                       (QREFELT $ 23))
                      (QREFELT $ 18)))))) 

(SDEFUN |STTAYLOR;powern;F2S;54|
        ((|rn| |Fraction| (|Integer|)) (|x| |Stream| A) ($ |Stream| A))
        (SPROG
         ((|power| (|Stream| A)) (#1=#:G1149 NIL) (#2=#:G1143 NIL)
          (|num| (|Integer|)) (|invCo| (|Union| A "failed")) (|co| (A))
          (|ord| (|Union| (|Integer|) "failed")) (#3=#:G1158 NIL)
          (|order| (|Integer|)) (#4=#:G1159 NIL) (|n| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |order| 0 . #5=(|STTAYLOR;powern;F2S;54|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |n| 0 . #5#) G190 NIL
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |x| (QREFELT $ 10))
                           (PROGN
                            (LETT #4# (|STTAYLOR;zro| $) . #5#)
                            (GO #6=#:G1157)))
                          ((NULL
                            (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                      (QREFELT $ 25)))
                           (SEQ (LETT |order| |n| . #5#)
                                (EXIT
                                 (PROGN
                                  (LETT #3# |$NoValue| . #5#)
                                  (GO #7=#:G1131)))))
                          ('T
                           (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 11)) . #5#)
                                (EXIT
                                 (COND
                                  ((EQL |n| 1000)
                                   (|error|
                                    "^: series with many leading zero coefficients")))))))))
                       (LETT |n| (|inc_SI| |n|) . #5#) (GO G190) G191
                       (EXIT NIL)))
                 #7# (EXIT #3#))
                (LETT |ord|
                      (SPADCALL |order| (SPADCALL |rn| (QREFELT $ 133))
                                (QREFELT $ 134))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |ord| 1)
                   (|error| "^: rational power does not exist"))
                  (#8='T
                   (SEQ (LETT |co| (SPADCALL |x| (QREFELT $ 13)) . #5#)
                        (COND
                         ((SPADCALL (QCDR |ord|) 0 (QREFELT $ 136))
                          (COND
                           ((SPADCALL |rn| (|spadConstant| $ 135)
                                      (QREFELT $ 137))
                            (|error| "^: negative power does not exist")))))
                        (LETT |invCo| (SPADCALL |co| (QREFELT $ 34)) . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |invCo| 1)
                           (|error|
                            "^ rational power of coefficient undefined"))
                          (#8#
                           (SEQ
                            (LETT |power|
                                  (COND
                                   ((SPADCALL |co| (|spadConstant| $ 41)
                                              (QREFELT $ 32))
                                    (SPADCALL
                                     (CONS #'|STTAYLOR;powern;F2S;54!0|
                                           (VECTOR $ |x| |rn|))
                                     (QREFELT $ 88)))
                                   ((EQL (SPADCALL |rn| (QREFELT $ 133)) 1)
                                    (COND
                                     ((NULL
                                       (MINUSP
                                        (LETT |num|
                                              (SPADCALL |rn| (QREFELT $ 138))
                                              . #5#)))
                                      (SPADCALL
                                       (SPADCALL |co|
                                                 (PROG1 (LETT #2# |num| . #5#)
                                                   (|check_subtype2| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #2#))
                                                 (QREFELT $ 139))
                                       (SPADCALL
                                        (CONS #'|STTAYLOR;powern;F2S;54!1|
                                              (VECTOR $ |x| |invCo| |rn|))
                                        (QREFELT $ 88))
                                       (QREFELT $ 27)))
                                     ('T
                                      (SPADCALL
                                       (SPADCALL (QCDR |invCo|)
                                                 (PROG1
                                                     (LETT #1# (- |num|) . #5#)
                                                   (|check_subtype2| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                 (QREFELT $ 139))
                                       (SPADCALL
                                        (CONS #'|STTAYLOR;powern;F2S;54!2|
                                              (VECTOR $ |x| |invCo| |rn|))
                                        (QREFELT $ 88))
                                       (QREFELT $ 27)))))
                                   ((QREFELT $ 130)
                                    (SPADCALL
                                     (SPADCALL |co| |rn| (QREFELT $ 140))
                                     (SPADCALL
                                      (CONS #'|STTAYLOR;powern;F2S;54!3|
                                            (VECTOR $ |x| |invCo| |rn|))
                                      (QREFELT $ 88))
                                     (QREFELT $ 27)))
                                   (#8#
                                    (|error|
                                     "^ rational power of coefficient undefined")))
                                  . #5#)
                            (EXIT
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 41)
                                        (* (QCDR |ord|)
                                           (SPADCALL |rn| (QREFELT $ 138)))
                                        (QREFELT $ 46))
                              |power| (QREFELT $ 72)))))))))))))
          #6# (EXIT #4#)))) 

(SDEFUN |STTAYLOR;powern;F2S;54!3| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |invCo| |x| $)
          (LETT |rn| (QREFELT $$ 3) . #1=(|STTAYLOR;powern;F2S;54|))
          (LETT |invCo| (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|STTAYLOR;powerrn| |rn|
             (SPADCALL (QCDR |invCo|) |x| (QREFELT $ 27)) |y| $))))) 

(SDEFUN |STTAYLOR;powern;F2S;54!2| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |invCo| |x| $)
          (LETT |rn| (QREFELT $$ 3) . #1=(|STTAYLOR;powern;F2S;54|))
          (LETT |invCo| (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|STTAYLOR;powerrn| |rn|
             (SPADCALL (QCDR |invCo|) |x| (QREFELT $ 27)) |y| $))))) 

(SDEFUN |STTAYLOR;powern;F2S;54!1| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |invCo| |x| $)
          (LETT |rn| (QREFELT $$ 3) . #1=(|STTAYLOR;powern;F2S;54|))
          (LETT |invCo| (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|STTAYLOR;powerrn| |rn|
             (SPADCALL (QCDR |invCo|) |x| (QREFELT $ 27)) |y| $))))) 

(SDEFUN |STTAYLOR;powern;F2S;54!0| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |x| $)
          (LETT |rn| (QREFELT $$ 2) . #1=(|STTAYLOR;powern;F2S;54|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|STTAYLOR;powerrn| |rn| |x| |y| $))))) 

(SDEFUN |STTAYLOR;mapdiv;3S;55|
        ((|x| |Stream| A) (|y| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;mapdiv;3S;55!0| (VECTOR |x| $ |y|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;mapdiv;3S;55!0| (($$ NIL))
        (PROG (|y| $ |x|)
          (LETT |y| (QREFELT $$ 2) . #1=(|STTAYLOR;mapdiv;3S;55|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |y| (QREFELT $ 10))
              (|error| "stream division by zero"))
             ((SPADCALL |x| (QREFELT $ 10)) (|STTAYLOR;zro| $))
             ('T
              (SPADCALL
               (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                         (SPADCALL |y| (QREFELT $ 13)) (QREFELT $ 142))
               (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                         (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 143))
               (QREFELT $ 18)))))))) 

(SDEFUN |STTAYLOR;ginteg|
        ((|f| |Mapping| A (|Integer|)) (|x| |Stream| A) ($ |Stream| A))
        (SPADCALL |x| (SPADCALL |f| (SPADCALL 1 (QREFELT $ 56)) (QREFELT $ 78))
                  (QREFELT $ 143))) 

(SDEFUN |STTAYLOR;lazyGintegrate;MAMS;57|
        ((|fntoa| |Mapping| A (|Integer|)) (|s| A)
         (|xf| |Mapping| (|Stream| A)) ($ |Stream| A))
        (SPADCALL |s|
                  (|STTAYLOR;ginteg| |fntoa| (SPADCALL |xf| (QREFELT $ 20)) $)
                  (QREFELT $ 18))) 

(SDEFUN |STTAYLOR;finteg| ((|x| |Stream| A) ($ |Stream| A))
        (SPADCALL |x| (SPADCALL (|spadConstant| $ 41) (QREFELT $ 59))
                  (QREFELT $ 143))) 

(SDEFUN |STTAYLOR;powerre|
        ((|s| A) (|x| |Stream| A) (|c| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;powerre!0| (VECTOR |c| |s| $ |x|))
                         (QREFELT $ 20)))) 

(SDEFUN |STTAYLOR;powerre!0| (($$ NIL))
        (PROG (|x| $ |s| |c|)
          (LETT |x| (QREFELT $$ 3) . #1=(|STTAYLOR;powerre|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |s| (QREFELT $$ 1) . #1#)
          (LETT |c| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 10)) (|STTAYLOR;zro| $))
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 13))
                             (|spadConstant| $ 41) (QREFELT $ 108))
                   (|error| "^:constant coefficient should be 1"))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                             (SPADCALL
                              (|STTAYLOR;finteg|
                               (SPADCALL
                                (SPADCALL |s| (|spadConstant| $ 41)
                                          (QREFELT $ 14))
                                (SPADCALL |c| (SPADCALL |x| (QREFELT $ 75))
                                          (QREFELT $ 72))
                                (QREFELT $ 27))
                               $)
                              (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |c|
                                        (QREFELT $ 72))
                              (QREFELT $ 23))
                             (QREFELT $ 18)))))))) 

(SDEFUN |STTAYLOR;power;A2S;60| ((|s| A) (|x| |Stream| A) ($ |Stream| A))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;power;A2S;60!0| (VECTOR $ |x| |s|))
                         (QREFELT $ 88)))) 

(SDEFUN |STTAYLOR;power;A2S;60!0| ((|y| NIL) ($$ NIL))
        (PROG (|s| |x| $)
          (LETT |s| (QREFELT $$ 2) . #1=(|STTAYLOR;power;A2S;60|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|STTAYLOR;powerre| |s| |x| |y| $))))) 

(DECLAIM (NOTINLINE |StreamTaylorSeriesOperations;|)) 

(DEFUN |StreamTaylorSeriesOperations| (#1=#:G1183)
  (SPROG NIL
         (PROG (#2=#:G1184)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|StreamTaylorSeriesOperations|)
                                               '|domainEqualList|)
                    . #3=(|StreamTaylorSeriesOperations|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|StreamTaylorSeriesOperations;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|StreamTaylorSeriesOperations|)))))))))) 

(DEFUN |StreamTaylorSeriesOperations;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|StreamTaylorSeriesOperations|))
          (LETT |dv$| (LIST '|StreamTaylorSeriesOperations| DV$1) . #1#)
          (LETT $ (GETREFV 146) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|StreamTaylorSeriesOperations|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 126
                       (CONS (|dispatchFunction| |STTAYLOR;integrate;A2S;48|)
                             $))
             (QSETREFV $ 128
                       (CONS
                        (|dispatchFunction| |STTAYLOR;lazyIntegrate;AMS;49|)
                        $))
             NIL
             (QSETREFV $ 129
                       (CONS (|dispatchFunction| |STTAYLOR;nlde;SS;51|) $))
             (QSETREFV $ 130
                       (|HasSignature| |#1|
                                       (LIST '^
                                             (LIST (|devaluate| |#1|)
                                                   (|devaluate| |#1|)
                                                   '(|Fraction|
                                                     (|Integer|))))))
             NIL
             NIL
             (QSETREFV $ 141
                       (CONS (|dispatchFunction| |STTAYLOR;powern;F2S;54|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 143
                       (CONS (|dispatchFunction| |STTAYLOR;mapdiv;3S;55|) $))
             NIL
             (QSETREFV $ 144
                       (CONS
                        (|dispatchFunction| |STTAYLOR;lazyGintegrate;MAMS;57|)
                        $))
             NIL
             NIL
             (QSETREFV $ 145
                       (CONS (|dispatchFunction| |STTAYLOR;power;A2S;60|)
                             $)))))
          $))) 

(MAKEPROP '|StreamTaylorSeriesOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Stream| 6) (0 . |empty|)
              (|Boolean|) (4 . |empty?|) (9 . |rst|) (14 . |eq?|) (20 . |frst|)
              (25 . +) (|Mapping| 6 6) (31 . |map|) |STTAYLOR;+;3S;2|
              (37 . |concat|) (|Mapping| $) (43 . |delay|) |STTAYLOR;-;2S;4|
              (48 . -) |STTAYLOR;-;3S;3| (54 . -) (59 . |zero?|) (64 . *)
              |STTAYLOR;*;A2S;5| |STTAYLOR;*;SAS;6| (|NonNegativeInteger|)
              (70 . >) (76 . |Zero|) (80 . =) (|Union| $ '"failed")
              (86 . |recip|) (|Union| 7 '"failed") |STTAYLOR;exquo;2SU;8|
              |STTAYLOR;/;3S;9| |STTAYLOR;recip;SU;10| (|Integer|) (91 . <=)
              (97 . |One|) (101 . |Zero|) (105 . |One|) (109 . -)
              (115 . |concat|) |STTAYLOR;monom;AIS;13| (121 . |One|) (125 . +)
              (|Mapping| 29 29) (|Stream| 29) (131 . |stream|) (137 . +)
              (|Mapping| 39 39) (|Stream| 39) (143 . |stream|)
              |STTAYLOR;integers;IS;15| |STTAYLOR;oddintegers;IS;16|
              (149 . |stream|) |STTAYLOR;int;AS;17| (155 . <) (|List| 6)
              (161 . |cons|) (|SingleInteger|) (167 . |Zero|) (171 . |Zero|)
              (175 . =) (181 . |first|) (186 . |rest|)
              (191 . |explicitlyEmpty?|) (196 . |One|) (200 . -)
              |STTAYLOR;*;3S;19| |STTAYLOR;mapmult;3S;20| (205 . |rest|)
              |STTAYLOR;deriv;2S;21| (|Mapping| 6 39) (|StreamFunctions2| 39 6)
              (210 . |map|) |STTAYLOR;gderiv;M2S;22| |STTAYLOR;coerce;AS;23|
              (|Mapping| 6 6 6) (|StreamFunctions2| 6 6) (216 . |scan|)
              |STTAYLOR;eval;SAS;24| |STTAYLOR;compose;3S;25| (|Mapping| 7 7)
              (|ParadoxicalCombinatorsForStreams| 6) (223 . Y)
              |STTAYLOR;lagrange;2S;27| |STTAYLOR;revert;2S;28| (|Stream| 7)
              (228 . |empty?|) (233 . |frst|) (238 . |rst|) (|PositiveInteger|)
              (243 . |One|) |STTAYLOR;prodiag;SS;30| |STTAYLOR;addiag;SS;31|
              (247 . |repeating|) (252 . |concat|) (|Mapping| 7 39 6)
              (|StreamFunctions3| 39 6 7) (258 . |map|)
              |STTAYLOR;lambert;2S;35| |STTAYLOR;oddlambert;2S;36|
              |STTAYLOR;evenlambert;2S;37| |STTAYLOR;generalLambert;S2IS;38|
              (265 . ~=) (271 . *) (|Mapping| 7 39) (|StreamFunctions2| 39 7)
              (277 . |map|) |STTAYLOR;general_Lambert_product;S2IS;40|
              (283 . |zero?|) (288 . |rest|) |STTAYLOR;multisect;2I2S;42|
              |STTAYLOR;invmultisect;2I2S;44| (294 . |empty|) (298 . |concat|)
              (|StreamFunctions2| 7 7) (304 . |map|) (310 . |delay|)
              (|Fraction| 39) (315 . /) (321 . *) (327 . |integrate|)
              (|Mapping| 7) (333 . |lazyIntegrate|) (339 . |nlde|) 'RATPOWERS
              (344 . |One|) (348 . +) (354 . |denom|) (359 . |exquo|)
              (365 . |Zero|) (369 . >) (375 . <) (381 . |numer|) (386 . ^)
              (392 . ^) (398 . |powern|) (404 . /) (410 . |mapdiv|)
              (416 . |lazyGintegrate|) (423 . |power|))
           '#(|revert| 429 |recip| 434 |prodiag| 439 |powern| 444 |power| 450
              |oddlambert| 456 |oddintegers| 461 |nlde| 466 |multisect| 471
              |monom| 478 |mapmult| 484 |mapdiv| 490 |lazyIntegrate| 496
              |lazyGintegrate| 502 |lambert| 509 |lagrange| 514 |invmultisect|
              519 |integrate| 526 |integers| 532 |int| 537
              |general_Lambert_product| 542 |generalLambert| 549 |gderiv| 556
              |exquo| 562 |evenlambert| 568 |eval| 573 |deriv| 579 |compose|
              584 |coerce| 590 |addiag| 595 / 600 - 606 + 617 * 623)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 145
                                                 '(0 7 0 8 1 7 9 0 10 1 7 0 0
                                                   11 2 7 9 0 0 12 1 7 6 0 13 2
                                                   6 0 0 0 14 2 7 0 15 0 16 2 7
                                                   0 6 0 18 1 7 0 19 20 2 6 0 0
                                                   0 22 1 6 0 0 24 1 6 9 0 25 2
                                                   6 0 0 0 26 2 29 9 0 0 30 0 6
                                                   0 31 2 6 9 0 0 32 1 6 33 0
                                                   34 2 39 9 0 0 40 0 6 0 41 0
                                                   39 0 42 0 39 0 43 2 39 0 0 0
                                                   44 2 7 0 0 0 45 0 29 0 47 2
                                                   29 0 0 0 48 2 50 0 49 29 51
                                                   2 39 0 0 0 52 2 54 0 53 39
                                                   55 2 7 0 15 6 58 2 39 9 0 0
                                                   60 2 61 0 6 0 62 0 63 0 64 0
                                                   29 0 65 2 29 9 0 0 66 1 61 6
                                                   0 67 1 61 0 0 68 1 7 9 0 69
                                                   0 63 0 70 1 39 0 0 71 1 7 0
                                                   0 74 2 77 7 76 54 78 3 82 7
                                                   6 81 7 83 1 87 7 86 88 1 91
                                                   9 0 92 1 91 7 0 93 1 91 0 0
                                                   94 0 95 0 96 1 7 0 61 99 2
                                                   61 0 0 0 100 3 102 91 101 54
                                                   7 103 2 6 9 0 0 108 2 39 0 0
                                                   0 109 2 111 91 110 54 112 1
                                                   39 9 0 114 2 7 0 0 29 115 0
                                                   91 0 118 2 91 0 7 0 119 2
                                                   120 91 86 91 121 1 91 0 19
                                                   122 2 123 0 39 39 124 2 6 0
                                                   123 0 125 2 0 7 6 7 126 2 0
                                                   7 6 127 128 1 0 7 91 129 0
                                                   123 0 131 2 123 0 0 0 132 1
                                                   123 39 0 133 2 39 33 0 0 134
                                                   0 123 0 135 2 39 9 0 0 136 2
                                                   123 9 0 0 137 1 123 39 0 138
                                                   2 6 0 0 29 139 2 6 0 0 123
                                                   140 2 0 7 123 7 141 2 6 0 0
                                                   0 142 2 0 7 7 7 143 3 0 7 76
                                                   6 127 144 2 0 7 6 7 145 1 0
                                                   7 7 90 1 0 35 7 38 1 0 7 91
                                                   97 2 2 7 123 7 141 2 1 7 6 7
                                                   145 1 0 7 7 105 1 0 54 39 57
                                                   1 2 7 91 129 3 0 7 39 39 7
                                                   116 2 0 7 6 39 46 2 0 7 7 7
                                                   73 2 1 7 7 7 143 2 2 7 6 127
                                                   128 3 1 7 76 6 127 144 1 0 7
                                                   7 104 1 0 7 7 89 3 0 7 39 39
                                                   7 117 2 2 7 6 7 126 1 0 54
                                                   39 56 1 0 7 6 59 3 0 7 7 39
                                                   39 113 3 0 7 7 39 39 107 2 0
                                                   7 76 7 79 2 0 35 7 7 36 1 0
                                                   7 7 106 2 0 7 7 6 84 1 0 7 7
                                                   75 2 0 7 7 7 85 1 0 7 6 80 1
                                                   0 7 91 98 2 0 7 7 7 37 2 0 7
                                                   7 7 23 1 0 7 7 21 2 0 7 7 7
                                                   17 2 0 7 7 7 72 2 0 7 7 6 28
                                                   2 0 7 6 7 27)))))
           '|lookupComplete|)) 
