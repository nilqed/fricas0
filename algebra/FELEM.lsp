
(SDEFUN |FELEM;chop|
        ((|x|
          #1=(|Record| (|:| |mantissa| (|Integer|))
                       (|:| |exponent| (|Integer|))))
         (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|db| (|Integer|)) (|l1| (|Integer|)) (|xe| (|Integer|))
          (|xm| (|Integer|)) (|#G4| #1#))
         (SEQ
          (PROGN
           (LETT |#G4| |x|)
           (LETT |xm| (QCAR |#G4|))
           (LETT |xe| (QCDR |#G4|))
           |#G4|)
          (LETT |l1| (INTEGER-LENGTH |xm|))
          (EXIT
           (COND ((< |l1| (+ |b| 4)) |x|)
                 ('T
                  (SEQ (LETT |db| (- (- |l1| |b|) 3))
                       (EXIT (CONS (ASH |xm| (- |db|)) (+ |xe| |db|)))))))))) 

(SDEFUN |FELEM;round;RI;2|
        ((|x|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (% (|Integer|)))
        (SPROG
         ((|v0| (|Integer|)) (|xe| (|Integer|)) (|xm| (|Integer|))
          (|#G6|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|)))))
         (SEQ
          (PROGN
           (LETT |#G6| |x|)
           (LETT |xm| (QCAR |#G6|))
           (LETT |xe| (QCDR |#G6|))
           |#G6|)
          (EXIT
           (COND ((EQL |xm| 0) 0)
                 ((< |xe| 0)
                  (SEQ (LETT |v0| (ASH |xm| (+ |xe| 1)))
                       (EXIT
                        (COND ((ODDP |v0|) (ASH (+ |v0| 1) -1))
                              (#1='T (ASH |v0| -1))))))
                 (#1# (ASH |xm| |xe|))))))) 

(SDEFUN |FELEM;plus;2RPiR;3|
        ((|x|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|y|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|dl| #1=(|Integer|)) (|de| #1#) (|ye| #2=(|Integer|))
          (|ym| #3=(|Integer|))
          (|#G11|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|xe| #2#) (|xm| #3#)
          (|#G10|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|)))))
         (SEQ
          (PROGN
           (LETT |#G10| |x|)
           (LETT |xm| (QCAR |#G10|))
           (LETT |xe| (QCDR |#G10|))
           |#G10|)
          (PROGN
           (LETT |#G11| |y|)
           (LETT |ym| (QCAR |#G11|))
           (LETT |ye| (QCDR |#G11|))
           |#G11|)
          (LETT |de| (- |xe| |ye|))
          (LETT |dl| (- (INTEGER-LENGTH |xm|) (INTEGER-LENGTH |ym|)))
          (EXIT
           (COND ((> (+ |de| |dl|) (+ |b| 4)) |x|)
                 ((< (+ |de| |dl|) (- (- |b|) 4)) |y|)
                 ('T
                  (|FELEM;chop| (SPADCALL |x| |y| (QREFELT % 10)) |b| %))))))) 

(SDEFUN |FELEM;minus;2RPiR;4|
        ((|x|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|y|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPADCALL |x| (CONS (- (QCAR |y|)) (QCDR |y|)) |b| (QREFELT % 12))) 

(SDEFUN |FELEM;times;2RPiR;5|
        ((|x|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|y|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (|FELEM;chop| (SPADCALL |x| |y| (QREFELT % 14)) |b| %)) 

(SDEFUN |FELEM;quotient;2RPiR;6|
        ((|x|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|y|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|z| (|Integer|)) (|k| (|Integer|)) (|ly| #1=(|Integer|)) (|lx| #1#)
          (|ye| #2=(|Integer|)) (|ym| #3=(|Integer|))
          (|#G22|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|xe| #2#) (|xm| #3#)
          (|#G21|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|)))))
         (SEQ
          (PROGN
           (LETT |#G21| |x|)
           (LETT |xm| (QCAR |#G21|))
           (LETT |xe| (QCDR |#G21|))
           |#G21|)
          (PROGN
           (LETT |#G22| |y|)
           (LETT |ym| (QCAR |#G22|))
           (LETT |ye| (QCDR |#G22|))
           |#G22|)
          (LETT |lx| (INTEGER-LENGTH |xm|)) (LETT |ly| (INTEGER-LENGTH |ym|))
          (LETT |k| (+ (+ (- |ly| |lx|) |b|) 5))
          (LETT |z| (QUOTIENT2 (ASH |xm| |k|) |ym|))
          (EXIT (|FELEM;chop| (CONS |z| (- (- |xe| |ye|) |k|)) |b| %))))) 

(SDEFUN |FELEM;pow2k|
        ((|x|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|k| (|Integer|)) (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG ((#1=#:G31 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT (LETT |x| (SPADCALL |x| |x| |b| (QREFELT % 15)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |FELEM;mat0|
        ((|n0| #1=(|Integer|)) (|bl| (|Integer|)) (|ki| (|Integer|))
         (|d| (|Integer|)) (|ld| (|DoubleFloat|))
         (%
          (|Record| (|:| |highn| (|Integer|))
                    (|:| |matr| (|Matrix| (|Integer|))))))
        (SPROG
         ((|blf| (|DoubleFloat|)) (|i| #1#) (|m22| #2=(|Integer|))
          (|m21| #3=(|Integer|)) (|m12| #3#) (|m11| #2#) (|#G36| #3#)
          (|#G35| #2#) (|#G34| #4=(|Integer|)) (|#G33| #4#) (|j| NIL)
          (|ld5| (|DoubleFloat|)))
         (SEQ (LETT |m11| 1) (LETT |m12| 0) (LETT |m21| 0) (LETT |m22| 1)
              (LETT |i| |n0|)
              (LETT |blf| (FLOAT |bl| MOST-POSITIVE-DOUBLE-FLOAT))
              (LETT |ld5| (|mul_DF| (FLOAT 5 MOST-POSITIVE-DOUBLE-FLOAT) |ld|))
              (SEQ G190
                   (COND
                    ((NULL
                      (|less_DF|
                       (FLOAT (INTEGER-LENGTH |m12|)
                              MOST-POSITIVE-DOUBLE-FLOAT)
                       |blf|))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1) G190
                         (COND ((|greater_SI| |j| 5) (GO G191)))
                         (SEQ
                          (PROGN
                           (LETT |#G33| (+ (* |i| |m11|) (* |d| |m21|)))
                           (LETT |#G34| (+ (* |i| |m12|) (* |d| |m22|)))
                           (LETT |#G35| |m11|)
                           (LETT |#G36| |m12|)
                           (LETT |m11| |#G33|)
                           (LETT |m12| |#G34|)
                           (LETT |m21| |#G35|)
                           (LETT |m22| |#G36|))
                          (EXIT (LETT |i| (+ |i| |ki|))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |blf| (|add_DF| |blf| |ld5|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS |i|
                     (SPADCALL (LIST (LIST |m11| |m12|) (LIST |m21| |m22|))
                               (QREFELT % 19))))))) 

(SDEFUN |FELEM;mat1|
        ((|n0| (|Integer|)) (|bl| (|Integer|)) (|ki| (|Integer|))
         (|d| (|Integer|)) (|ld| (|DoubleFloat|))
         (%
          #1=(|Record| (|:| |highn| (|Integer|))
                       (|:| |matr| (|Matrix| (|Integer|))))))
        (SPROG
         ((|r2| #1#) (|bl1| (|Integer|)) (|m1| (|Matrix| (|Integer|)))
          (|r1| #1#))
         (SEQ
          (COND ((<= |bl| 300) (|FELEM;mat0| |n0| |bl| |ki| |d| |ld| %))
                ('T
                 (SEQ (LETT |bl1| (QUOTIENT2 |bl| 2))
                      (LETT |r1| (|FELEM;mat1| |n0| |bl1| |ki| |d| |ld| %))
                      (LETT |m1| (QCDR |r1|))
                      (LETT |bl1|
                            (- |bl|
                               (INTEGER-LENGTH
                                (SPADCALL |m1| 1 1 (QREFELT % 20)))))
                      (LETT |r2|
                            (|FELEM;mat1| (QCAR |r1|) |bl1| |ki| |d| |ld| %))
                      (EXIT
                       (CONS (QCAR |r2|)
                             (SPADCALL (QCDR |r2|) |m1| (QREFELT % 21)))))))))) 

(SDEFUN |FELEM;do_quo|
        ((|n| (|Integer|)) (|d| (|Integer|)) (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG ((|n1| (|Integer|)))
               (SEQ (LETT |n1| (ASH |n| (+ |b| 3)))
                    (EXIT (CONS (QUOTIENT2 |n1| |d|) (- (- |b|) 3)))))) 

(SDEFUN |FELEM;exp_frac;2IPiR;11|
        ((|k| (|Integer|)) (|n| (|Integer|)) (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|q1| (|Integer|)) (|p1| (|Integer|)) (|mm0| (|Matrix| (|Integer|)))
          (|l| (|NonNegativeInteger|)) (|ld| (|DoubleFloat|))
          (|ln2| (|Integer|)) (|ki| #1=(|Integer|)) (|k0| #1#)
          (|q0| (|Integer|)) (|p0| (|Integer|)) (|n2| (|Integer|)))
         (SEQ (LETT |n2| (* |n| |n|)) (LETT |p1| (+ (* 2 |k|) |n|))
              (LETT |p0| 1) (LETT |q1| (- (* 2 |k|) |n|)) (LETT |q0| 1)
              (LETT |k0| (* 6 |k|)) (LETT |ki| (* 4 |k|))
              (LETT |ln2| (INTEGER-LENGTH |n2|))
              (LETT |ld|
                    (COND
                     ((< |ln2| 100)
                      (|div_DF|
                       (SPADCALL (FLOAT |n2| MOST-POSITIVE-DOUBLE-FLOAT)
                                 (QREFELT % 23))
                       (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                 (QREFELT % 23))))
                     ('T
                      (|add_DF| (FLOAT (- |ln2| 60) MOST-POSITIVE-DOUBLE-FLOAT)
                                (|div_DF|
                                 (SPADCALL
                                  (FLOAT (ASH |n2| (- 60 |ln2|))
                                         MOST-POSITIVE-DOUBLE-FLOAT)
                                  (QREFELT % 23))
                                 (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                           (QREFELT % 23)))))))
              (LETT |l| (QUOTIENT2 (+ |b| 1) 2))
              (LETT |mm0|
                    (SPADCALL (LIST (LIST |p1| |q1|) (LIST |p0| |q0|))
                              (QREFELT % 19)))
              (LETT |mm0|
                    (SPADCALL (QCDR (|FELEM;mat1| |k0| |l| |ki| |n2| |ld| %))
                              |mm0| (QREFELT % 21)))
              (LETT |p1| (SPADCALL |mm0| 1 1 (QREFELT % 20)))
              (LETT |q1| (SPADCALL |mm0| 1 2 (QREFELT % 20)))
              (EXIT (|FELEM;do_quo| |p1| |q1| |b| %))))) 

(SDEFUN |FELEM;exp_series;RPiR;12|
        ((|f|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|k| (|PositiveInteger|)) (|s| #1=(|Integer|)) (#2=#:G53 NIL)
          (|tk| #1#) (|m| #1#) (|b1| (|Integer|)) (|e| (|Integer|))
          (|#G50|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|)))))
         (SEQ
          (PROGN
           (LETT |#G50| |f|)
           (LETT |m| (QCAR |#G50|))
           (LETT |e| (QCDR |#G50|))
           |#G50|)
          (LETT |b1| (+ (+ |b| (INTEGER-LENGTH |b|)) 3))
          (LETT |m| (ASH |m| (+ |e| |b1|))) (LETT |s| (LETT |tk| |m|))
          (LETT |k| 2)
          (SEQ
           (EXIT
            (SEQ G190 NIL
                 (SEQ (LETT |tk| (QUOTIENT2 (* |m| |tk|) |k|))
                      (LETT |tk| (ASH |tk| (- |b1|)))
                      (COND
                       ((EQL |tk| 0)
                        (EXIT (PROGN (LETT #2# |$NoValue|) (GO #3=#:G50))))
                       ((EQL |tk| -1) (EXIT (PROGN (LETT #2# 1) (GO #3#)))))
                      (LETT |s| (+ |s| |tk|)) (EXIT (LETT |k| (+ |k| 1))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #3# (EXIT #2#))
          (EXIT
           (CONS (ASH (+ |s| (ASH 1 |b1|)) (+ (- |b| |b1|) 3))
                 (- (- |b|) 3)))))) 

(SDEFUN |FELEM;exp_normal|
        ((|x|
          #1=(|Record| (|:| |mantissa| (|Integer|))
                       (|:| |exponent| (|Integer|))))
         (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|e1|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|b1| (|PositiveInteger|)) (#2=#:G54 NIL) (|k1| (|Integer|))
          (|k| (|PositiveInteger|)) (|lb2| (|Integer|)) (|lb| #3=(|Integer|))
          (|de| (|Integer|)) (|lm| #3#) (|e| (|Integer|)) (|m| (|Integer|))
          (|#G53| #1#))
         (SEQ
          (COND ((< |b| 80) (SPADCALL |x| |b| (QREFELT % 25)))
                (#4='T
                 (SEQ
                  (PROGN
                   (LETT |#G53| |x|)
                   (LETT |m| (QCAR |#G53|))
                   (LETT |e| (QCDR |#G53|))
                   |#G53|)
                  (LETT |lm| (INTEGER-LENGTH |m|)) (LETT |de| (+ |lm| |e|))
                  (LETT |lb| (INTEGER-LENGTH |b|))
                  (LETT |lb2| (QUOTIENT2 (+ |lb| 1) 2))
                  (LETT |k| (ASH |b| (- |lb2|))) (LETT |k1| (- |de| |k|))
                  (EXIT
                   (COND ((< |k1| 0) (SPADCALL |x| |b| (QREFELT % 25)))
                         (#4#
                          (SEQ
                           (LETT |b1|
                                 (PROG1 (LETT #2# (+ (+ |b| |k1|) 5))
                                   (|check_subtype2| (> #2# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #2#)))
                           (LETT |e1|
                                 (SPADCALL (CONS |m| (- |e| |k1|)) |b1|
                                           (QREFELT % 25)))
                           (EXIT
                            (|FELEM;chop| (|FELEM;pow2k| |e1| |k1| |b1| %) |b|
                             %)))))))))))) 

(SDEFUN |FELEM;exp;RPiR;14|
        ((|x|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|ye| #1=(|Integer|)) (|ym| #2=(|Integer|))
          (|#G57|
           #3=(|Record| (|:| |mantissa| (|Integer|))
                        (|:| |exponent| (|Integer|))))
          (|x1|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|qi| (|Integer|))
          (|q|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|lg2|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|b1| (|PositiveInteger|)) (#4=#:G62 NIL) (|e1| #3#) (#5=#:G59 NIL)
          (|k| #6=(|Integer|)) (|de| #6#) (|lm| (|Integer|)) (|e| #1#)
          (|m| #2#)
          (|#G56|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|)))))
         (SEQ
          (PROGN
           (LETT |#G56| |x|)
           (LETT |m| (QCAR |#G56|))
           (LETT |e| (QCDR |#G56|))
           |#G56|)
          (LETT |lm| (INTEGER-LENGTH |m|)) (LETT |de| (+ |lm| |e|))
          (EXIT
           (COND ((< |de| -3) (|FELEM;exp_normal| |x| |b| %))
                 (#7='T
                  (SEQ (LETT |k| (+ |de| 4))
                       (EXIT
                        (COND
                         ((< |k| 8)
                          (SEQ
                           (LETT |e1|
                                 (|FELEM;exp_normal| (CONS |m| (- |e| |k|))
                                  (+ |b|
                                     (PROG1 (LETT #5# |k|)
                                       (|check_subtype2| (> #5# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #5#)))
                                  %))
                           (EXIT
                            (|FELEM;chop| (|FELEM;pow2k| |e1| |k| (+ |b| 7) %)
                             |b| %))))
                         (#7#
                          (SEQ
                           (LETT |b1|
                                 (+
                                  (+ |b|
                                     (PROG1 (LETT #4# |k|)
                                       (|check_subtype2| (> #4# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #4#)))
                                  5))
                           (LETT |lg2| (SPADCALL |b1| (QREFELT % 26)))
                           (LETT |q| (SPADCALL |x| |lg2| |b1| (QREFELT % 16)))
                           (LETT |qi| (SPADCALL |q| (QREFELT % 8)))
                           (LETT |x1|
                                 (SPADCALL |x|
                                           (SPADCALL |lg2| (CONS |qi| 0) |b1|
                                                     (QREFELT % 15))
                                           |b1| (QREFELT % 13)))
                           (PROGN
                            (LETT |#G57| (|FELEM;exp_normal| |x1| (+ |b| 3) %))
                            (LETT |ym| (QCAR |#G57|))
                            (LETT |ye| (QCDR |#G57|))
                            |#G57|)
                           (EXIT (CONS |ym| (+ |ye| |qi|)))))))))))))) 

(SDEFUN |FELEM;exp1;PiR;15|
        ((|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|v0|
           #1=(|Record| (|:| |mantissa| (|Integer|))
                        (|:| |exponent| (|Integer|))))
          (|de| (|Integer|)) (|e| (|Integer|)) (|m| (|Integer|)) (|#G59| #1#)
          (|p1| (|PositiveInteger|)))
         (SEQ (LETT |p1| (QCDR (QREFELT % 28)))
              (LETT |v0| (QCAR (QREFELT % 28)))
              (EXIT
               (COND ((EQL |p1| |b|) |v0|)
                     ((< |b| |p1|)
                      (COND ((< |p1| (+ |b| 10)) |v0|)
                            (#2='T
                             (SEQ
                              (PROGN
                               (LETT |#G59| |v0|)
                               (LETT |m| (QCAR |#G59|))
                               (LETT |e| (QCDR |#G59|))
                               |#G59|)
                              (LETT |de| (- (- |p1| |b|) 1))
                              (EXIT (CONS (ASH |m| (- |de|)) (+ |e| |de|)))))))
                     (#2#
                      (SEQ (LETT |v0| (SPADCALL 1 1 |b| (QREFELT % 24)))
                           (PROGN
                            (RPLACA (QREFELT % 28) |v0|)
                            (QCAR (QREFELT % 28)))
                           (PROGN
                            (RPLACD (QREFELT % 28) |b|)
                            (QCDR (QREFELT % 28)))
                           (EXIT |v0|)))))))) 

(SDEFUN |FELEM;log_series;RPiR;16|
        ((|x|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|k| (|PositiveInteger|)) (|s| #1=(|Integer|)) (#2=#:G79 NIL)
          (|tk| #1#) (|m| #1#) (|e| (|Integer|))
          (|#G64|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G64| |x|)
             (LETT |m| (QCAR |#G64|))
             (LETT |e| (QCDR |#G64|))
             |#G64|)
            (LETT |m| (ASH |m| (+ |b| |e|))) (LETT |s| (LETT |tk| |m|))
            (LETT |k| 2)
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |tk| (* |m| |tk|))
                       (LETT |tk| (ASH (- |tk|) (- |b|)))
                       (COND
                        ((OR (EQL |tk| 0) (EQL |tk| -1))
                         (EXIT
                          (PROGN
                           (LETT #2# (CONS |s| (- |b|)))
                           (GO #3=#:G78)))))
                       (LETT |s| (+ |s| (QUOTIENT2 |tk| |k|)))
                       (EXIT (LETT |k| (+ |k| 1))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #2#)))) 

(SDEFUN |FELEM;log_newton2|
        ((|y|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|x0|
          #1=(|Record| (|:| |mantissa| (|Integer|))
                       (|:| |exponent| (|Integer|))))
         (|b0| (|PositiveInteger|)) (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((#2=#:G85 NIL)
          (|xd|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|yd|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|y1|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|x0e| (|Integer|)) (|x0m| (|Integer|)) (|#G69| #1#)
          (|b1| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (LETT |b1| (COND ((< |b| (* 5 |b0|)) |b|) ('T (* 3 |b0|))))
                 (PROGN
                  (LETT |#G69| |x0|)
                  (LETT |x0m| (QCAR |#G69|))
                  (LETT |x0e| (QCDR |#G69|))
                  |#G69|)
                 (LETT |y1|
                       (SPADCALL (CONS (- |x0m|) |x0e|) (+ |b1| 10)
                                 (QREFELT % 27)))
                 (LETT |yd|
                       (SPADCALL (SPADCALL |y| |y1| (+ |b1| 10) (QREFELT % 15))
                                 (CONS 1 0) (+ |b1| 10) (QREFELT % 13)))
                 (LETT |xd| (SPADCALL |yd| (+ |b1| 10) (QREFELT % 32)))
                 (LETT |x0| (SPADCALL |x0| |xd| (+ |b1| 2) (QREFELT % 12)))
                 (EXIT
                  (COND ((< |b1| |b|) (LETT |b0| |b1|))
                        ('T (PROGN (LETT #2# |x0|) (GO #3=#:G84))))))
                NIL (GO G190) G191 (EXIT NIL)))
          #3# (EXIT #2#)))) 

(SDEFUN |FELEM;log2;PiR;18|
        ((|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|v0|
           #1=(|Record| (|:| |mantissa| (|Integer|))
                        (|:| |exponent| (|Integer|))))
          (|de| (|Integer|)) (|e| (|Integer|)) (|m| (|Integer|)) (|#G71| #1#)
          (|p1| (|PositiveInteger|)))
         (SEQ (LETT |p1| (QCDR (QREFELT % 30)))
              (LETT |v0| (QCAR (QREFELT % 30)))
              (EXIT
               (COND ((EQL |p1| |b|) |v0|)
                     ((< |b| |p1|)
                      (COND ((< |p1| (+ |b| 10)) |v0|)
                            (#2='T
                             (SEQ
                              (PROGN
                               (LETT |#G71| |v0|)
                               (LETT |m| (QCAR |#G71|))
                               (LETT |e| (QCDR |#G71|))
                               |#G71|)
                              (LETT |de| (- (- |p1| |b|) 1))
                              (EXIT (CONS (ASH |m| (- |de|)) (+ |e| |de|)))))))
                     (#2#
                      (SEQ
                       (LETT |v0|
                             (|FELEM;log_newton2| (CONS 2 0) |v0| |p1| |b| %))
                       (PROGN
                        (RPLACA (QREFELT % 30) |v0|)
                        (QCAR (QREFELT % 30)))
                       (PROGN
                        (RPLACD (QREFELT % 30) |b|)
                        (QCDR (QREFELT % 30)))
                       (EXIT |v0|)))))))) 

(SDEFUN |FELEM;log10;PiR;19|
        ((|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|v0|
           #1=(|Record| (|:| |mantissa| (|Integer|))
                        (|:| |exponent| (|Integer|))))
          (|de| (|Integer|)) (|e| (|Integer|)) (|m| (|Integer|)) (|#G75| #1#)
          (|p1| (|PositiveInteger|)))
         (SEQ (LETT |p1| (QCDR (QREFELT % 31)))
              (LETT |v0| (QCAR (QREFELT % 31)))
              (EXIT
               (COND ((EQL |p1| |b|) |v0|)
                     ((< |b| |p1|)
                      (COND ((< |p1| (+ |b| 10)) |v0|)
                            (#2='T
                             (SEQ
                              (PROGN
                               (LETT |#G75| |v0|)
                               (LETT |m| (QCAR |#G75|))
                               (LETT |e| (QCDR |#G75|))
                               |#G75|)
                              (LETT |de| (- (- |p1| |b|) 1))
                              (EXIT (CONS (ASH |m| (- |de|)) (+ |e| |de|)))))))
                     (#2#
                      (SEQ
                       (LETT |v0|
                             (|FELEM;log_newton2| (CONS 10 0) |v0| |p1| |b| %))
                       (PROGN
                        (RPLACA (QREFELT % 31) |v0|)
                        (QCAR (QREFELT % 31)))
                       (PROGN
                        (RPLACD (QREFELT % 31) |b|)
                        (QCDR (QREFELT % 31)))
                       (EXIT |v0|)))))))) 

(SDEFUN |FELEM;log_newton|
        ((|x|
          #1=(|Record| (|:| |mantissa| (|Integer|))
                       (|:| |exponent| (|Integer|))))
         (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|e0| (|Integer|)) (|m0| (|Integer|)) (|l0| (|DoubleFloat|))
          (|m1| #2=(|Integer|)) (|e1| #3=(|Integer|)) (|e| #3#) (|m| #2#)
          (|#G80| #1#))
         (SEQ
          (PROGN
           (LETT |#G80| |x|)
           (LETT |m| (QCAR |#G80|))
           (LETT |e| (QCDR |#G80|))
           |#G80|)
          (LETT |m1| |m|) (LETT |e1| |e|)
          (COND
           ((< 50 (- |e|))
            (SEQ (LETT |e1| -50) (EXIT (LETT |m1| (ASH |m| (- |e| |e1|)))))))
          (LETT |l0|
                (SPADCALL (SPADCALL |m1| |e1| 2 (QREFELT % 34))
                          (QREFELT % 23)))
          (LETT |m0| (SPADCALL |l0| (QREFELT % 35)))
          (LETT |e0| (SPADCALL |l0| (QREFELT % 36)))
          (EXIT (|FELEM;log_newton2| |x| (CONS |m0| |e0|) 40 |b| %))))) 

(SDEFUN |FELEM;log;RPiR;21|
        ((|x|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|b| (|PositiveInteger|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|l1|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|e1| (|Integer|)) (|lm| (|Integer|)) (|m1| (|Integer|))
          (|e| (|Integer|)) (|m| (|Integer|))
          (|#G83|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|)))))
         (SEQ
          (PROGN
           (LETT |#G83| |x|)
           (LETT |m| (QCAR |#G83|))
           (LETT |e| (QCDR |#G83|))
           |#G83|)
          (EXIT
           (COND
            ((< 0 |m|)
             (SEQ (LETT |lm| (INTEGER-LENGTH |m|))
                  (LETT |m1| (ASH |m| (- 6 |lm|)))
                  (COND ((< |m1| 42) (LETT |lm| (- |lm| 1))))
                  (LETT |e1| (+ |lm| |e|))
                  (EXIT
                   (COND ((EQL |e1| 0) (|FELEM;log_newton| |x| |b| %))
                         (#1='T
                          (SEQ
                           (LETT |l1|
                                 (|FELEM;log_newton| (CONS |m| (- |lm|))
                                  (+ |b| 3) %))
                           (EXIT
                            (SPADCALL |l1|
                                      (SPADCALL (CONS |e1| 0)
                                                (SPADCALL (+ |b| 3)
                                                          (QREFELT % 26))
                                                (+ |b| 3) (QREFELT % 15))
                                      (+ |b| 2) (QREFELT % 12)))))))))
            (#1# (|error| "argument to log must be positive"))))))) 

(DECLAIM (NOTINLINE |FloatElementaryFunctions;|)) 

(DEFUN |FloatElementaryFunctions;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FloatElementaryFunctions|))
          (LETT % (GETREFV 38))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatElementaryFunctions| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 28
                    (CONS (CONS 924983374546220337150911035843336795079 -128)
                          128))
          (QSETREFV % 30
                    (CONS (CONS 235865763225513294137944142764154484399 -128)
                          128))
          (QSETREFV % 31
                    (CONS (CONS 195882276370220766701334620675861842472 -126)
                          125))
          %))) 

(DEFUN |FloatElementaryFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G105)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FloatElementaryFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FloatElementaryFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|FloatElementaryFunctions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|FloatElementaryFunctions|)))))))))) 

(MAKEPROP '|FloatElementaryFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|)
              (|Record| (|:| |mantissa| 6) (|:| |exponent| 6))
              |FELEM;round;RI;2| (|FloatingPointOperations|) (0 . |plus|)
              (|PositiveInteger|) |FELEM;plus;2RPiR;3| |FELEM;minus;2RPiR;4|
              (6 . |times|) |FELEM;times;2RPiR;5| |FELEM;quotient;2RPiR;6|
              (|List| (|List| 6)) (|Matrix| 6) (12 . |matrix|) (17 . |elt|)
              (24 . *) (|DoubleFloat|) (30 . |log|) |FELEM;exp_frac;2IPiR;11|
              |FELEM;exp_series;RPiR;12| |FELEM;log2;PiR;18|
              |FELEM;exp;RPiR;14| '|exp1_val| |FELEM;exp1;PiR;15| '|log2_val|
              '|log10_val| |FELEM;log_series;RPiR;16| |FELEM;log10;PiR;19|
              (35 . |float|) (42 . |mantissa|) (47 . |exponent|)
              |FELEM;log;RPiR;21|)
           '#(|times| 52 |round| 59 |quotient| 64 |plus| 71 |minus| 78
              |log_series| 85 |log2| 91 |log10| 96 |log| 101 |exp_series| 107
              |exp_frac| 113 |exp1| 120 |exp| 125)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|log2|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|PositiveInteger|)))
                                T)
                              '((|log10|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|PositiveInteger|)))
                                T)
                              '((|exp|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|PositiveInteger|)))
                                T)
                              '((|exp1|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|PositiveInteger|)))
                                T)
                              '((|log|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|PositiveInteger|)))
                                T)
                              '((|plus|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|PositiveInteger|)))
                                T)
                              '((|minus|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|PositiveInteger|)))
                                T)
                              '((|times|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|PositiveInteger|)))
                                T)
                              '((|quotient|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|PositiveInteger|)))
                                T)
                              '((|round|
                                 ((|Integer|)
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))))
                                T)
                              '((|exp_frac|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Integer|) (|Integer|) (|PositiveInteger|)))
                                T)
                              '((|exp_series|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|PositiveInteger|)))
                                T)
                              '((|log_series|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|PositiveInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 37
                                            '(2 9 7 7 7 10 2 9 7 7 7 14 1 18 0
                                              17 19 3 18 6 0 6 6 20 2 18 0 0 0
                                              21 1 22 0 0 23 3 22 0 6 6 11 34 1
                                              22 6 0 35 1 22 6 0 36 3 0 7 7 7
                                              11 15 1 0 6 7 8 3 0 7 7 7 11 16 3
                                              0 7 7 7 11 12 3 0 7 7 7 11 13 2 0
                                              7 7 11 32 1 0 7 11 26 1 0 7 11 33
                                              2 0 7 7 11 37 2 0 7 7 11 25 3 0 7
                                              6 6 11 24 1 0 7 11 29 2 0 7 7 11
                                              27)))))
           '|lookupComplete|)) 
