
(SDEFUN |PNTHEORY;MonicQuotient|
        ((|a| |SparseUnivariatePolynomial| (|Integer|))
         (|b| |SparseUnivariatePolynomial| (|Integer|))
         ($ |SparseUnivariatePolynomial| (|Integer|)))
        (SPROG
         ((|da| #1=(|NonNegativeInteger|))
          (|q| (|SparseUnivariatePolynomial| (|Integer|)))
          (|t| (|SparseUnivariatePolynomial| (|Integer|))) (#2=#:G393 NIL)
          (|db| #1#))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |b| (QREFELT $ 26)) 1 (QREFELT $ 28))
            (|error| "divisor must be monic"))
           ((SPADCALL |b| (|spadConstant| $ 7) (QREFELT $ 29)) |a|)
           ('T
            (SEQ (LETT |da| (SPADCALL |a| (QREFELT $ 30)))
                 (LETT |db| (SPADCALL |b| (QREFELT $ 30)))
                 (LETT |q| (|spadConstant| $ 17))
                 (SEQ G190 (COND ((NULL (>= |da| |db|)) (GO G191)))
                      (SEQ
                       (LETT |t|
                             (SPADCALL (SPADCALL |a| (QREFELT $ 26))
                                       (PROG1 (LETT #2# (- |da| |db|))
                                         (|check_subtype2| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                       (QREFELT $ 10)))
                       (LETT |a|
                             (SPADCALL |a| (SPADCALL |b| |t| (QREFELT $ 31))
                                       (QREFELT $ 32)))
                       (LETT |q| (SPADCALL |q| |t| (QREFELT $ 33)))
                       (EXIT (LETT |da| (SPADCALL |a| (QREFELT $ 30)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |q|))))))) 

(SDEFUN |PNTHEORY;cyclotomic;ISup;2|
        ((|n| . #1=(|Integer|)) ($ |SparseUnivariatePolynomial| (|Integer|)))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#2=#:G407 NIL) (|s| #3=(|Integer|))
          (|c| (|SparseUnivariatePolynomial| (|Integer|)))
          (|t| (|SparseUnivariatePolynomial| (|Integer|))) (#4=#:G403 NIL)
          (|r| #5=(|Integer|)) (|q| #6=(|Integer|))
          (|#G6| #7=(|Record| (|:| |quotient| #6#) (|:| |remainder| #5#)))
          (|k| #1#) (|#G5| #7#) (|p| #3#))
         (SEQ
          (COND
           ((< |n| 0) (|error| "cyclotomic not defined for negative integers"))
           ((EQL |n| 0) (QREFELT $ 11))
           ('T
            (SEQ (LETT |k| |n|) (LETT |s| (LETT |p| 1))
                 (LETT |c|
                       (SPADCALL (QREFELT $ 11) (|spadConstant| $ 7)
                                 (QREFELT $ 32)))
                 (SEQ G190 (COND ((NULL (> |k| 1)) (GO G191)))
                      (SEQ (LETT |p| (SPADCALL |p| (QREFELT $ 35)))
                           (PROGN
                            (LETT |#G5| (DIVIDE2 |k| |p|))
                            (LETT |q| (QCAR |#G5|))
                            (LETT |r| (QCDR |#G5|))
                            |#G5|)
                           (EXIT
                            (COND
                             ((EQL |r| 0)
                              (SEQ
                               (SEQ G190 (COND ((NULL (EQL |r| 0)) (GO G191)))
                                    (SEQ (LETT |k| |q|)
                                         (EXIT
                                          (PROGN
                                           (LETT |#G6| (DIVIDE2 |k| |p|))
                                           (LETT |q| (QCAR |#G6|))
                                           (LETT |r| (QCDR |#G6|))
                                           |#G6|)))
                                    NIL (GO G190) G191 (EXIT NIL))
                               (LETT |t|
                                     (SPADCALL |c|
                                               (PROG1 (LETT #4# |p|)
                                                 (|check_subtype2| (>= #4# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #4#))
                                               (QREFELT $ 36)))
                               (LETT |c| (|PNTHEORY;MonicQuotient| |t| |c| $))
                               (EXIT (LETT |s| (* |s| |p|))))))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |m|
                       (PROG1 (LETT #2# (QUOTIENT2 |n| |s|))
                         (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #2#)))
                 (EXIT (SPADCALL |c| |m| (QREFELT $ 36))))))))) 

(SDEFUN |PNTHEORY;euler;ISup;3|
        ((|n| |Integer|)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|p| #1=(|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|c| (|Fraction| (|Integer|))) (#2=#:G414 NIL)
          (|t| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (#3=#:G420 NIL) (|i| NIL) (|s| #4=(|Integer|))
          (|#G10|
           (|Record| (|:| |En| (|Integer|))
                     (|:| |Ev|
                          (|SparseUnivariatePolynomial|
                           (|Fraction| (|Integer|))))))
          (|#G9| #1#) (|#G8| #4#))
         (SEQ
          (COND ((< |n| 0) (|error| "euler not defined for negative integers"))
                (#5='T
                 (SEQ
                  (COND
                   ((< |n| (QCAR (QREFELT $ 19)))
                    (PROGN
                     (LETT |#G8| 0)
                     (LETT |#G9| (|spadConstant| $ 18))
                     (LETT |s| |#G8|)
                     (LETT |p| |#G9|)))
                   (#5#
                    (PROGN
                     (LETT |#G10| (QREFELT $ 19))
                     (LETT |s| (QCAR |#G10|))
                     (LETT |p| (QCDR |#G10|))
                     |#G10|)))
                  (SEQ (LETT |i| (+ |s| 1)) (LETT #3# |n|) G190
                       (COND ((> |i| #3#) (GO G191)))
                       (SEQ
                        (LETT |t|
                              (SPADCALL (SPADCALL |i| (QREFELT $ 38))
                                        (SPADCALL |p| (QREFELT $ 39))
                                        (QREFELT $ 40)))
                        (LETT |c|
                              (SPADCALL
                               (SPADCALL (SPADCALL |i| (QREFELT $ 42))
                                         (EXPT 2
                                               (PROG1 (LETT #2# |i|)
                                                 (|check_subtype2| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #2#)))
                                         (QREFELT $ 43))
                               (SPADCALL |t| (SPADCALL 1 2 (QREFELT $ 43))
                                         (QREFELT $ 44))
                               (QREFELT $ 45)))
                        (EXIT
                         (LETT |p|
                               (SPADCALL |t| (SPADCALL |c| (QREFELT $ 46))
                                         (QREFELT $ 47)))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (PROGN (RPLACA (QREFELT $ 19) |n|) (QCAR (QREFELT $ 19)))
                  (PROGN (RPLACD (QREFELT $ 19) |p|) (QCDR (QREFELT $ 19)))
                  (EXIT |p|))))))) 

(SDEFUN |PNTHEORY;bernoulli;ISup;4|
        ((|n| |Integer|)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|p| #1=(|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|c| (|Fraction| (|Integer|)))
          (|t| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (#2=#:G427 NIL) (|i| NIL) (|s| #3=(|Integer|))
          (|#G17|
           (|Record| (|:| |Bn| (|Integer|))
                     (|:| |Bv|
                          (|SparseUnivariatePolynomial|
                           (|Fraction| (|Integer|))))))
          (|#G16| #1#) (|#G15| #3#))
         (SEQ
          (COND
           ((< |n| 0) (|error| "bernoulli not defined for negative integers"))
           (#4='T
            (SEQ
             (COND
              ((< |n| (QCAR (QREFELT $ 20)))
               (PROGN
                (LETT |#G15| 0)
                (LETT |#G16| (|spadConstant| $ 18))
                (LETT |s| |#G15|)
                (LETT |p| |#G16|)))
              (#4#
               (PROGN
                (LETT |#G17| (QREFELT $ 20))
                (LETT |s| (QCAR |#G17|))
                (LETT |p| (QCDR |#G17|))
                |#G17|)))
             (SEQ (LETT |i| (+ |s| 1)) (LETT #2# |n|) G190
                  (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (LETT |t|
                         (SPADCALL (SPADCALL |i| (QREFELT $ 38))
                                   (SPADCALL |p| (QREFELT $ 39))
                                   (QREFELT $ 40)))
                   (LETT |c| (SPADCALL |i| (QREFELT $ 49)))
                   (EXIT
                    (LETT |p|
                          (SPADCALL |t| (SPADCALL |c| (QREFELT $ 46))
                                    (QREFELT $ 47)))))
                  (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
             (PROGN (RPLACA (QREFELT $ 20) |n|) (QCAR (QREFELT $ 20)))
             (PROGN (RPLACD (QREFELT $ 20) |p|) (QCDR (QREFELT $ 20)))
             (EXIT |p|))))))) 

(SDEFUN |PNTHEORY;fixedDivisor;SupI;5|
        ((|a| |SparseUnivariatePolynomial| (|Integer|)) ($ |Integer|))
        (SPROG
         ((|g| (|Integer|)) (#1=#:G431 NIL) (|k| NIL)
          (|d| (|NonNegativeInteger|)))
         (SEQ (|SparseUnivariatePolynomial| (|Integer|))
              (LETT |d| (SPADCALL |a| (QREFELT $ 30)))
              (LETT |g|
                    (SPADCALL |a| (SPADCALL |a| (QREFELT $ 51))
                              (QREFELT $ 52)))
              (SEQ (LETT |k| 1) (LETT #1# |d|) G190
                   (COND
                    ((OR (|greater_SI| |k| #1#) (NULL (> |g| 1))) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |g| (GCD |g| (SPADCALL |a| |k| (QREFELT $ 53))))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |g|)))) 

(SDEFUN |PNTHEORY;hermite;ISup;6|
        ((|n| |Integer|) ($ |SparseUnivariatePolynomial| (|Integer|)))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| (|Integer|)))
          (|p| #1=(|SparseUnivariatePolynomial| (|Integer|))) (|#G30| #1#)
          (|#G29| (|SparseUnivariatePolynomial| (|Integer|))) (#2=#:G438 NIL)
          (|k| NIL) (|s| (|Integer|))
          (|#G24|
           (|Record| (|:| |Hn| (|Integer|))
                     (|:| H1 (|SparseUnivariatePolynomial| (|Integer|)))
                     (|:| H2 (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (COND
           ((< |n| 0) (|error| "hermite not defined for negative integers"))
           (#3='T
            (SEQ
             (COND
              ((< |n| (QVELT (QREFELT $ 21) 0))
               (SEQ (LETT |s| 0) (LETT |p| (|spadConstant| $ 7))
                    (EXIT (LETT |q| (QREFELT $ 11)))))
              (#3#
               (PROGN
                (LETT |#G24| (QREFELT $ 21))
                (LETT |s| (QVELT |#G24| 0))
                (LETT |p| (QVELT |#G24| 1))
                (LETT |q| (QVELT |#G24| 2))
                |#G24|)))
             (SEQ (LETT |k| (+ |s| 1)) (LETT #2# |n|) G190
                  (COND ((> |k| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT |#G29|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL 2 (QREFELT $ 11) (QREFELT $ 56)) |p|
                             (QREFELT $ 31))
                            (SPADCALL (* 2 (- |k| 1)) |q| (QREFELT $ 57))
                            (QREFELT $ 32)))
                     (LETT |#G30| |p|)
                     (LETT |p| |#G29|)
                     (LETT |q| |#G30|))))
                  (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
             (QSETVELT (QREFELT $ 21) 0 |n|) (QSETVELT (QREFELT $ 21) 1 |p|)
             (QSETVELT (QREFELT $ 21) 2 |q|) (EXIT |p|))))))) 

(SDEFUN |PNTHEORY;legendre;ISup;7|
        ((|n| |Integer|)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|p| #1=(|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|#G38| #1#)
          (|#G37| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|t| (|Integer|)) (#2=#:G446 NIL) (|k| NIL) (|s| (|Integer|))
          (|#G32|
           (|Record| (|:| |Pn| (|Integer|))
                     (|:| P1
                          (|SparseUnivariatePolynomial|
                           (|Fraction| (|Integer|))))
                     (|:| P2
                          (|SparseUnivariatePolynomial|
                           (|Fraction| (|Integer|)))))))
         (SEQ
          (COND
           ((< |n| 0) (|error| "legendre not defined for negative integers"))
           (#3='T
            (SEQ
             (COND
              ((< |n| (QVELT (QREFELT $ 23) 0))
               (SEQ (LETT |s| 0) (LETT |p| (|spadConstant| $ 18))
                    (EXIT (LETT |q| (QREFELT $ 16)))))
              (#3#
               (PROGN
                (LETT |#G32| (QREFELT $ 23))
                (LETT |s| (QVELT |#G32| 0))
                (LETT |p| (QVELT |#G32| 1))
                (LETT |q| (QVELT |#G32| 2))
                |#G32|)))
             (SEQ (LETT |k| (+ |s| 1)) (LETT #2# |n|) G190
                  (COND ((> |k| #2#) (GO G191)))
                  (SEQ (LETT |t| (- |k| 1))
                       (EXIT
                        (PROGN
                         (LETT |#G37|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (+ |k| |t|) |k| (QREFELT $ 43))
                                  (QREFELT $ 16) (QREFELT $ 40))
                                 |p| (QREFELT $ 59))
                                (SPADCALL (SPADCALL |t| |k| (QREFELT $ 43)) |q|
                                          (QREFELT $ 40))
                                (QREFELT $ 60)))
                         (LETT |#G38| |p|)
                         (LETT |p| |#G37|)
                         (LETT |q| |#G38|))))
                  (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
             (QSETVELT (QREFELT $ 23) 0 |n|) (QSETVELT (QREFELT $ 23) 1 |p|)
             (QSETVELT (QREFELT $ 23) 2 |q|) (EXIT |p|))))))) 

(SDEFUN |PNTHEORY;laguerre;ISup;8|
        ((|n| |Integer|) ($ |SparseUnivariatePolynomial| (|Integer|)))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| (|Integer|)))
          (|p| #1=(|SparseUnivariatePolynomial| (|Integer|))) (|#G46| #1#)
          (|#G45| (|SparseUnivariatePolynomial| (|Integer|))) (|t| (|Integer|))
          (#2=#:G454 NIL) (|k| NIL) (|s| (|Integer|))
          (|#G40|
           (|Record| (|:| |Ln| (|Integer|))
                     (|:| L1 (|SparseUnivariatePolynomial| (|Integer|)))
                     (|:| L2 (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (COND
           ((< |n| 0) (|error| "laguerre not defined for negative integers"))
           (#3='T
            (SEQ
             (COND
              ((< |n| (QVELT (QREFELT $ 22) 0))
               (SEQ (LETT |s| 0) (LETT |p| (|spadConstant| $ 7))
                    (EXIT (LETT |q| (QREFELT $ 11)))))
              (#3#
               (PROGN
                (LETT |#G40| (QREFELT $ 22))
                (LETT |s| (QVELT |#G40| 0))
                (LETT |p| (QVELT |#G40| 1))
                (LETT |q| (QVELT |#G40| 2))
                |#G40|)))
             (SEQ (LETT |k| (+ |s| 1)) (LETT #2# |n|) G190
                  (COND ((> |k| #2#) (GO G191)))
                  (SEQ (LETT |t| (- |k| 1))
                       (EXIT
                        (PROGN
                         (LETT |#G45|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (+ |k| |t|) (QREFELT $ 62))
                                  (QREFELT $ 11) (QREFELT $ 32))
                                 |p| (QREFELT $ 31))
                                (SPADCALL (EXPT |t| 2) |q| (QREFELT $ 57))
                                (QREFELT $ 32)))
                         (LETT |#G46| |p|)
                         (LETT |p| |#G45|)
                         (LETT |q| |#G46|))))
                  (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
             (QSETVELT (QREFELT $ 22) 0 |n|) (QSETVELT (QREFELT $ 22) 1 |p|)
             (QSETVELT (QREFELT $ 22) 2 |q|) (EXIT |p|))))))) 

(SDEFUN |PNTHEORY;chebyshevT;ISup;9|
        ((|n| |Integer|) ($ |SparseUnivariatePolynomial| (|Integer|)))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| (|Integer|)))
          (|p| #1=(|SparseUnivariatePolynomial| (|Integer|))) (|#G54| #1#)
          (|#G53| (|SparseUnivariatePolynomial| (|Integer|))) (#2=#:G461 NIL)
          (|k| NIL) (|s| (|Integer|))
          (|#G48|
           (|Record| (|:| |Tn| (|Integer|))
                     (|:| T1 (|SparseUnivariatePolynomial| (|Integer|)))
                     (|:| T2 (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (COND
           ((< |n| 0) (|error| "chebyshevT not defined for negative integers"))
           (#3='T
            (SEQ
             (COND
              ((< |n| (QVELT (QREFELT $ 24) 0))
               (SEQ (LETT |s| 0) (LETT |p| (|spadConstant| $ 7))
                    (EXIT (LETT |q| (QREFELT $ 11)))))
              (#3#
               (PROGN
                (LETT |#G48| (QREFELT $ 24))
                (LETT |s| (QVELT |#G48| 0))
                (LETT |p| (QVELT |#G48| 1))
                (LETT |q| (QVELT |#G48| 2))
                |#G48|)))
             (SEQ (LETT |k| (+ |s| 1)) (LETT #2# |n|) G190
                  (COND ((> |k| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT |#G53|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL 2 (QREFELT $ 11) (QREFELT $ 56)) |p|
                             (QREFELT $ 31))
                            |q| (QREFELT $ 32)))
                     (LETT |#G54| |p|)
                     (LETT |p| |#G53|)
                     (LETT |q| |#G54|))))
                  (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
             (QSETVELT (QREFELT $ 24) 0 |n|) (QSETVELT (QREFELT $ 24) 1 |p|)
             (QSETVELT (QREFELT $ 24) 2 |q|) (EXIT |p|))))))) 

(SDEFUN |PNTHEORY;chebyshevU;ISup;10|
        ((|n| |Integer|) ($ |SparseUnivariatePolynomial| (|Integer|)))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| (|Integer|)))
          (|p| #1=(|SparseUnivariatePolynomial| (|Integer|))) (|#G62| #1#)
          (|#G61| (|SparseUnivariatePolynomial| (|Integer|))) (#2=#:G468 NIL)
          (|k| NIL) (|s| (|Integer|))
          (|#G56|
           (|Record| (|:| |Un| (|Integer|))
                     (|:| U1 (|SparseUnivariatePolynomial| (|Integer|)))
                     (|:| U2 (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (COND
           ((< |n| 0) (|error| "chebyshevU not defined for negative integers"))
           (#3='T
            (SEQ
             (COND
              ((< |n| (QVELT (QREFELT $ 25) 0))
               (SEQ (LETT |s| 0) (LETT |p| (|spadConstant| $ 7))
                    (EXIT (LETT |q| (|spadConstant| $ 17)))))
              (#3#
               (PROGN
                (LETT |#G56| (QREFELT $ 25))
                (LETT |s| (QVELT |#G56| 0))
                (LETT |p| (QVELT |#G56| 1))
                (LETT |q| (QVELT |#G56| 2))
                |#G56|)))
             (SEQ (LETT |k| (+ |s| 1)) (LETT #2# |n|) G190
                  (COND ((> |k| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT |#G61|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL 2 (QREFELT $ 11) (QREFELT $ 56)) |p|
                             (QREFELT $ 31))
                            |q| (QREFELT $ 32)))
                     (LETT |#G62| |p|)
                     (LETT |p| |#G61|)
                     (LETT |q| |#G62|))))
                  (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
             (QSETVELT (QREFELT $ 25) 0 |n|) (QSETVELT (QREFELT $ 25) 1 |p|)
             (QSETVELT (QREFELT $ 25) 2 |q|) (EXIT |p|))))))) 

(DECLAIM (NOTINLINE |PolynomialNumberTheoryFunctions;|)) 

(DEFUN |PolynomialNumberTheoryFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G470)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|PolynomialNumberTheoryFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|PolynomialNumberTheoryFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|PolynomialNumberTheoryFunctions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|PolynomialNumberTheoryFunctions|)))))))))) 

(DEFUN |PolynomialNumberTheoryFunctions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|PolynomialNumberTheoryFunctions|))
          (LETT $ (GETREFV 66))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PolynomialNumberTheoryFunctions|
                      NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL 1 1 (QREFELT $ 10)))
          (QSETREFV $ 16 (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 15)))
          (QSETREFV $ 19 (CONS 0 (|spadConstant| $ 18)))
          (QSETREFV $ 20 (CONS 0 (|spadConstant| $ 18)))
          (QSETREFV $ 21 (VECTOR 0 (|spadConstant| $ 7) (QREFELT $ 11)))
          (QSETREFV $ 22 (VECTOR 0 (|spadConstant| $ 7) (QREFELT $ 11)))
          (QSETREFV $ 23 (VECTOR 0 (|spadConstant| $ 18) (QREFELT $ 16)))
          (QSETREFV $ 24 (VECTOR 0 (|spadConstant| $ 7) (QREFELT $ 11)))
          (QSETREFV $ 25 (VECTOR 0 (|spadConstant| $ 7) (|spadConstant| $ 17)))
          $))) 

(MAKEPROP '|PolynomialNumberTheoryFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 8)
              (0 . |One|) (|Integer|) (|NonNegativeInteger|) (4 . |monomial|)
              '|x| (|Fraction| 8) (10 . |One|)
              (|SparseUnivariatePolynomial| 12) (14 . |monomial|) '|y|
              (20 . |Zero|) (24 . |One|) 'E 'B 'H 'L 'P 'CT 'U
              (28 . |leadingCoefficient|) (|Boolean|) (33 . ~=) (39 . =)
              (45 . |degree|) (50 . *) (56 . -) (62 . +)
              (|IntegerPrimesPackage| 8) (68 . |nextPrime|)
              (73 . |multiplyExponents|) |PNTHEORY;cyclotomic;ISup;2|
              (79 . |coerce|) (84 . |integrate|) (89 . *)
              (|IntegerNumberTheoryFunctions|) (95 . |euler|) (100 . /)
              (106 . |elt|) (112 . -) (118 . |coerce|) (123 . +)
              |PNTHEORY;euler;ISup;3| (129 . |bernoulli|)
              |PNTHEORY;bernoulli;ISup;4| (134 . |minimumDegree|)
              (139 . |coefficient|) (145 . |elt|)
              |PNTHEORY;fixedDivisor;SupI;5| (|PositiveInteger|) (151 . *)
              (157 . *) |PNTHEORY;hermite;ISup;6| (163 . *) (169 . -)
              |PNTHEORY;legendre;ISup;7| (175 . |coerce|)
              |PNTHEORY;laguerre;ISup;8| |PNTHEORY;chebyshevT;ISup;9|
              |PNTHEORY;chebyshevU;ISup;10|)
           '#(|legendre| 180 |laguerre| 185 |hermite| 190 |fixedDivisor| 195
              |euler| 200 |cyclotomic| 205 |chebyshevU| 210 |chebyshevT| 215
              |bernoulli| 220)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|bernoulli|
                                 ((|SparseUnivariatePolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|chebyshevT|
                                 ((|SparseUnivariatePolynomial| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|chebyshevU|
                                 ((|SparseUnivariatePolynomial| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|cyclotomic|
                                 ((|SparseUnivariatePolynomial| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|euler|
                                 ((|SparseUnivariatePolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|fixedDivisor|
                                 ((|Integer|)
                                  (|SparseUnivariatePolynomial| (|Integer|))))
                                T)
                              '((|hermite|
                                 ((|SparseUnivariatePolynomial| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|laguerre|
                                 ((|SparseUnivariatePolynomial| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|legendre|
                                 ((|SparseUnivariatePolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 65
                                            '(0 6 0 7 2 6 0 8 9 10 0 12 0 13 2
                                              14 0 12 9 15 0 6 0 17 0 14 0 18 1
                                              6 8 0 26 2 8 27 0 0 28 2 6 27 0 0
                                              29 1 6 9 0 30 2 6 0 0 0 31 2 6 0
                                              0 0 32 2 6 0 0 0 33 1 34 8 8 35 2
                                              6 0 0 9 36 1 12 0 8 38 1 14 0 0
                                              39 2 14 0 12 0 40 1 41 8 8 42 2
                                              12 0 8 8 43 2 14 12 0 12 44 2 12
                                              0 0 0 45 1 14 0 12 46 2 14 0 0 0
                                              47 1 41 12 8 49 1 6 9 0 51 2 6 8
                                              0 9 52 2 6 8 0 8 53 2 6 0 55 0 56
                                              2 6 0 8 0 57 2 14 0 0 0 59 2 14 0
                                              0 0 60 1 6 0 8 62 1 0 14 8 61 1 0
                                              6 8 63 1 0 6 8 58 1 0 8 6 54 1 0
                                              14 8 48 1 0 6 8 37 1 0 6 8 65 1 0
                                              6 8 64 1 0 14 8 50)))))
           '|lookupComplete|)) 

(MAKEPROP '|PolynomialNumberTheoryFunctions| 'NILADIC T) 
