
(SDEFUN |FFPOLY;revListToSUP|
        ((|l| |List|
          (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
         ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((|newl|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#1=#:G440 NIL) (|t| NIL))
         (SEQ (LETT |newl| NIL)
              (SEQ (LETT |t| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |newl| (CONS (CONS (CAR |t|) (CDR |t|)) |newl|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |newl|)))) 

(SDEFUN |FFPOLY;listToSUP|
        ((|l| |List|
          (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
         ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((|newl|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#1=#:G446 NIL) (|t| NIL) (#2=#:G445 NIL))
         (SEQ
          (LETT |newl|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #2# (CONS (CONS (CAR |t|) (CDR |t|)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT |newl|)))) 

(SDEFUN |FFPOLY;reducedQPowers;SupPa;3|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |PrimitiveArray| (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((|h| (|SparseUnivariatePolynomial| GF))
          (|g| (|SparseUnivariatePolynomial| GF)) (#1=#:G457 NIL) (|i| NIL)
          (|qexp| #2=(|PrimitiveArray| (|SparseUnivariatePolynomial| GF)))
          (|w| (MM)) (#3=#:G456 NIL) (|qpow| #2#) (|e| (MM)) (|m1| (|Integer|))
          (|m| (|PositiveInteger|)))
         (SEQ (LETT |m| (SPADCALL |f| (QREFELT $ 12))) (LETT |m1| (- |m| 1))
              (SPADCALL |f| (QREFELT $ 15))
              (LETT |e|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16))
                      (QREFELT $ 17))
                     (QREFELT $ 10) (QREFELT $ 18)))
              (LETT |w| (|spadConstant| $ 14))
              (LETT |qpow| (MAKEARR1 |m| (|spadConstant| $ 21)))
              (QSETAREF1 |qpow| 0 (|spadConstant| $ 22))
              (SEQ (LETT |i| 1) (LETT #3# |m1|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |qpow| |i|
                                (SPADCALL
                                 (LETT |w| (SPADCALL |w| |e| (QREFELT $ 23)))
                                 (QREFELT $ 24)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |qexp| (MAKEARR1 |m| (|spadConstant| $ 21)))
              (EXIT
               (COND
                ((EQL |m| 1)
                 (SEQ
                  (QSETAREF1 |qexp| 0
                             (SPADCALL
                              (SPADCALL (SPADCALL |f| 0 (QREFELT $ 25))
                                        (QREFELT $ 26))
                              (QREFELT $ 27)))
                  (EXIT |qexp|)))
                ('T
                 (SEQ
                  (QSETAREF1 |qexp| 0
                             (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16)))
                  (LETT |h| (QAREF1 |qpow| 1)) (QSETAREF1 |qexp| 1 |h|)
                  (SEQ (LETT |i| 2) (LETT #1# |m1|) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |g| (|spadConstant| $ 21))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (SPADCALL |h| (|spadConstant| $ 21)
                                              (QREFELT $ 29)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |g|
                                        (SPADCALL |g|
                                                  (SPADCALL
                                                   (SPADCALL |h|
                                                             (QREFELT $ 30))
                                                   (QAREF1 |qpow|
                                                           (SPADCALL |h|
                                                                     (QREFELT $
                                                                              12)))
                                                   (QREFELT $ 31))
                                                  (QREFELT $ 32)))
                                  (EXIT
                                   (LETT |h| (SPADCALL |h| (QREFELT $ 33)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (QSETAREF1 |qexp| |i| (LETT |h| |g|))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |qexp|)))))))) 

(SDEFUN |FFPOLY;leastAffineMultiple;2Sup;4|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#1=#:G465 NIL) (#2=#:G464 #3=(|SparseUnivariatePolynomial| GF))
          (#4=#:G466 #3#) (#5=#:G468 NIL) (#6=#:G474 NIL) (|k| NIL)
          (|ns| (|List| (|Vector| GF))) (|coeffVector| #7=(|Vector| GF))
          (|dim| (|NonNegativeInteger|)) (|i| (|PositiveInteger|))
          (|newCoeffVector| #7#) (#8=#:G473 NIL) (|col1| (|Matrix| GF))
          (|b| (|Matrix| GF)) (#9=#:G472 NIL) (#10=#:G471 NIL)
          (|n| (|NonNegativeInteger|))
          (|qexp| (|PrimitiveArray| (|SparseUnivariatePolynomial| GF))))
         (SEQ (LETT |qexp| (SPADCALL |f| (QREFELT $ 35)))
              (LETT |n| (SPADCALL |f| (QREFELT $ 12)))
              (LETT |b|
                    (SPADCALL
                     (SPADCALL
                      (PROGN
                       (LETT #10# NIL)
                       (SEQ (LETT |i| 0) (LETT #9# (- |n| 1)) G190
                            (COND ((|greater_SI| |i| #9#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #10#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL (QAREF1 |qexp| |i|) |n|
                                                (QREFELT $ 37))
                                      (QREFELT $ 39))
                                     #10#))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT (NREVERSE #10#))))
                      (QREFELT $ 42))
                     (QREFELT $ 43)))
              (LETT |col1| (MAKE_MATRIX1 |n| 1 (|spadConstant| $ 19)))
              (SPADCALL |col1| 1 1 (|spadConstant| $ 13) (QREFELT $ 45))
              (LETT |ns|
                    (SPADCALL (SPADCALL |col1| |b| (QREFELT $ 46))
                              (QREFELT $ 48)))
              (LETT |dim| (+ |n| 2))
              (SEQ (LETT #8# NIL) G190 (COND (#8# (GO G191)))
                   (SEQ
                    (LETT |newCoeffVector| (SPADCALL |ns| 1 (QREFELT $ 49)))
                    (LETT |i| (+ |n| 1))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL
                             (SPADCALL |newCoeffVector| |i| (QREFELT $ 50))
                             (|spadConstant| $ 19) (QREFELT $ 51)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |i| (- |i| 1)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (COND
                     ((< |i| |dim|)
                      (SEQ (LETT |dim| |i|)
                           (EXIT (LETT |coeffVector| |newCoeffVector|)))))
                    (EXIT (LETT |ns| (CDR |ns|))))
                   (LETT #8# (NULL |ns|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |coeffVector| 1 (QREFELT $ 50))
                          (QREFELT $ 27))
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |k| 2) (LETT #6# |dim|) G190
                      (COND ((|greater_SI| |k| #6#) (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (SPADCALL
                                (SPADCALL |coeffVector| |k| (QREFELT $ 50))
                                (EXPT (QREFELT $ 10)
                                      (PROG1 (LETT #5# (- |k| 2))
                                        (|check_subtype2| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #5#)))
                                (QREFELT $ 16)))
                         (COND
                          (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 32))))
                          ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 21))))
                (QREFELT $ 32)))))) 

(SDEFUN |FFPOLY;numberOfIrreduciblePoly;2Pi;5|
        ((|n| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG
         ((#1=#:G477 NIL) (|lastd| (|PositiveInteger|)) (|sum| (|Integer|))
          (|qd| (|PositiveInteger|)) (#2=#:G480 NIL) (|d| NIL)
          (|divisorsOfn| (|List| (|PositiveInteger|))))
         (SEQ
          (COND ((EQL |n| 1) (QREFELT $ 10))
                ('T
                 (SEQ (LETT |lastd| 1) (LETT |qd| (QREFELT $ 10))
                      (LETT |sum| (* (SPADCALL |n| (QREFELT $ 54)) |qd|))
                      (LETT |divisorsOfn| (CDR (SPADCALL |n| (QREFELT $ 56))))
                      (SEQ (LETT |d| NIL) (LETT #2# |divisorsOfn|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |d| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |qd|
                                  (* |qd|
                                     (EXPT (QREFELT $ 10) (- |d| |lastd|))))
                            (LETT |sum|
                                  (+ |sum|
                                     (*
                                      (SPADCALL (QUOTIENT2 |n| |d|)
                                                (QREFELT $ 54))
                                      |qd|)))
                            (EXIT (LETT |lastd| |d|)))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (PROG1 (LETT #1# (QUOTIENT2 |sum| |n|))
                         (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                           '(|Integer|) #1#))))))))) 

(SDEFUN |FFPOLY;numberOfPrimitivePoly;2Pi;6|
        ((|n| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((#1=#:G481 NIL))
               (PROG1
                   (LETT #1#
                         (QUOTIENT2
                          (SPADCALL (- (EXPT (QREFELT $ 10) |n|) 1)
                                    (QREFELT $ 59))
                          |n|))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))) 

(SDEFUN |FFPOLY;numberOfNormalPoly;2Pi;7|
        ((|n| . #1=(|PositiveInteger|)) ($ |PositiveInteger|))
        (SPROG
         ((|prod| (|Integer|)) (|qe| #2=(|PositiveInteger|))
          (|e| (|PositiveInteger|)) (#3=#:G729 NIL) (|d| NIL)
          (|divisorsOfm| (|List| (|PositiveInteger|))) (#4=#:G721 NIL)
          (#5=#:G720 NIL) (|m| #1#) (#6=#:G487 NIL) (|q| #2#)
          (|p| (|PositiveInteger|)) (#7=#:G486 NIL) (#8=#:G485 NIL)
          (#9=#:G484 NIL))
         (SEQ
          (COND
           ((EQL |n| 1)
            (PROG1
                (LETT #8#
                      (PROG1 (LETT #9# (- (QREFELT $ 10) 1))
                        (|check_subtype2| (>= #9# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #9#)))
              (|check_subtype2| (> #8# 0) '(|PositiveInteger|)
                                '(|NonNegativeInteger|) #8#)))
           (#10='T
            (SEQ (LETT |m| |n|)
                 (LETT |p|
                       (PROG1 (LETT #7# (SPADCALL (QREFELT $ 61)))
                         (|check_subtype2| (> #7# 0) '(|PositiveInteger|)
                                           '(|NonNegativeInteger|) #7#)))
                 (LETT |q| (QREFELT $ 10))
                 (SEQ G190 (COND ((NULL (EQL (REM |m| |p|) 0)) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |m|
                              (PROG1 (LETT #6# (QUOTIENT2 |m| |p|))
                                (|check_subtype2| (> #6# 0)
                                                  '(|PositiveInteger|)
                                                  '(|NonNegativeInteger|)
                                                  #6#)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((EQL |m| 1)
                    (PROG1
                        (LETT #4#
                              (QUOTIENT2
                               (*
                                (EXPT |q|
                                      (PROG1 (LETT #5# (- |n| 1))
                                        (|check_subtype2| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #5#)))
                                (- |q| 1))
                               |n|))
                      (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                        '(|Integer|) #4#)))
                   (#10#
                    (SEQ (LETT |prod| (- |q| 1))
                         (LETT |divisorsOfm|
                               (CDR (SPADCALL |m| (QREFELT $ 56))))
                         (SEQ (LETT |d| NIL) (LETT #3# |divisorsOfm|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |d| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |e| 1) (LETT |qe| |q|)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (SPADCALL (REM |qe| |d|) 1
                                                     (QREFELT $ 62)))
                                          (GO G191)))
                                        (SEQ (LETT |e| (+ |e| 1))
                                             (EXIT (LETT |qe| (* |qe| |q|))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (LETT |prod|
                                          (* |prod|
                                             (EXPT (- |qe| 1)
                                                   (QUOTIENT2
                                                    (SPADCALL |d|
                                                              (QREFELT $ 59))
                                                    |e|))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (QUOTIENT2 (* (EXPT |q| (- |n| |m|)) |prod|)
                                     |n|)))))))))))) 

(SDEFUN |FFPOLY;primitive?;SupB;8|
        ((|f| |SparseUnivariatePolynomial| GF) ($ |Boolean|))
        (SPROG
         ((#1=#:G745 NIL) (#2=#:G746 NIL) (|expt| (|NonNegativeInteger|))
          (#3=#:G748 NIL) (|d| NIL) (|lfact| (|List| (|PositiveInteger|)))
          (#4=#:G734 NIL) (#5=#:G747 NIL) (|rec| NIL)
          (|lrec|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|x| (MM)) (|qn1| (|PositiveInteger|)) (#6=#:G732 NIL)
          (#7=#:G731 NIL) (|q| (|PositiveInteger|))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 12)))
                (EXIT
                 (COND
                  ((OR (EQL |n| 0)
                       (OR
                        (SPADCALL (SPADCALL |f| (QREFELT $ 30))
                                  (|spadConstant| $ 13) (QREFELT $ 64))
                        (SPADCALL (SPADCALL |f| 0 (QREFELT $ 25))
                                  (|spadConstant| $ 19) (QREFELT $ 51))))
                   NIL)
                  ('T
                   (SEQ (LETT |q| (QREFELT $ 10))
                        (LETT |qn1|
                              (PROG1
                                  (LETT #6#
                                        (PROG1 (LETT #7# (- (EXPT |q| |n|) 1))
                                          (|check_subtype2| (>= #7# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #7#)))
                                (|check_subtype2| (> #6# 0)
                                                  '(|PositiveInteger|)
                                                  '(|NonNegativeInteger|)
                                                  #6#)))
                        (SPADCALL |f| (QREFELT $ 15))
                        (LETT |x|
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 13) 1
                                         (QREFELT $ 16))
                               (QREFELT $ 17)))
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |x| |qn1| (QREFELT $ 65))
                                      (QREFELT $ 24))
                            (|spadConstant| $ 22) (QREFELT $ 29))
                           NIL)
                          ('T
                           (SEQ
                            (LETT |lrec|
                                  (SPADCALL (SPADCALL |qn1| (QREFELT $ 67))
                                            (QREFELT $ 72)))
                            (LETT |lfact| NIL)
                            (SEQ (LETT |rec| NIL) (LETT #5# |lrec|) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |rec| (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |lfact|
                                         (CONS
                                          (PROG1 (LETT #4# (QVELT |rec| 1))
                                            (|check_subtype2| (> #4# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #4#))
                                          |lfact|))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT NIL))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |d| NIL) (LETT #3# |lfact|) G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN (LETT |d| (CAR #3#)) NIL))
                                     (GO G191)))
                                   (SEQ (LETT |expt| (QUOTIENT2 |qn1| |d|))
                                        (EXIT
                                         (COND
                                          ((>= |expt| |n|)
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL
                                               (SPADCALL |x| |expt|
                                                         (QREFELT $ 18))
                                               (QREFELT $ 24))
                                              (|spadConstant| $ 22)
                                              (QREFELT $ 73))
                                             (PROGN
                                              (LETT #1#
                                                    (PROGN
                                                     (LETT #2# NIL)
                                                     (GO #8=#:G744)))
                                              (GO #9=#:G738))))))))
                                   (LETT #3# (CDR #3#)) (GO G190) G191
                                   (EXIT NIL)))
                             #9# (EXIT #1#))
                            (EXIT 'T)))))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |FFPOLY;normal?;SupB;9|
        ((|f| |SparseUnivariatePolynomial| GF) ($ |Boolean|))
        (SPROG
         ((|l| (|List| (|List| GF))) (#1=#:G759 NIL) (#2=#:G751 NIL) (|i| NIL)
          (#3=#:G758 NIL)
          (|g| (|PrimitiveArray| (|SparseUnivariatePolynomial| GF)))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 12)))
              (EXIT
               (COND
                ((OR (EQL |n| 0)
                     (OR
                      (SPADCALL (SPADCALL |f| (QREFELT $ 30))
                                (|spadConstant| $ 13) (QREFELT $ 64))
                      (SPADCALL (SPADCALL |f| 0 (QREFELT $ 25))
                                (|spadConstant| $ 19) (QREFELT $ 51))))
                 NIL)
                ((EQL |n| 1) 'T)
                (#4='T
                 (COND ((NULL (SPADCALL |f| (QREFELT $ 76))) NIL)
                       ('T
                        (SEQ (LETT |g| (SPADCALL |f| (QREFELT $ 35)))
                             (LETT |l|
                                   (PROGN
                                    (LETT #3# NIL)
                                    (SEQ (LETT |i| 0)
                                         (LETT #1#
                                               (PROG1 (LETT #2# (- |n| 1))
                                                 (|check_subtype2| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #2#)))
                                         G190
                                         (COND
                                          ((|greater_SI| |i| #1#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #3#
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL (QAREF1 |g| |i|)
                                                             |n|
                                                             (QREFELT $ 37))
                                                   (QREFELT $ 39))
                                                  #3#))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT (NREVERSE #3#)))))
                             (EXIT
                              (COND
                               ((EQL
                                 (SPADCALL (SPADCALL |l| (QREFELT $ 42))
                                           (QREFELT $ 77))
                                 |n|)
                                'T)
                               (#4# NIL)))))))))))) 

(SDEFUN |FFPOLY;nextSubset|
        ((|s| |List| (|NonNegativeInteger|)) (|bound| |NonNegativeInteger|)
         ($ |Union| (|List| (|NonNegativeInteger|)) "failed"))
        (SPROG
         ((|j| NIL) (#1=#:G774 NIL) (|i| (|NonNegativeInteger|))
          (|firstOfs| #2=(|NonNegativeInteger|)) (|noGap| (|Boolean|))
          (|firstOfsPlus1| (|NonNegativeInteger|)) (|secondOfs| #2#)
          (|restOfs| (|List| (|NonNegativeInteger|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (SPADCALL |s| (QREFELT $ 80)))
                (EXIT
                 (COND ((EQL |m| 0) (CONS 0 (LIST 1)))
                       (#3='T
                        (SEQ (LETT |noGap| 'T) (LETT |i| 0)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      (|noGap|
                                       (NULL
                                        (NULL (LETT |restOfs| (CDR |s|)))))
                                      ('T NIL)))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |secondOfs| (|SPADfirst| |restOfs|))
                                   (LETT |firstOfsPlus1|
                                         (+ (|SPADfirst| |s|) 1))
                                   (EXIT
                                    (COND
                                     ((EQL |secondOfs| |firstOfsPlus1|)
                                      (SEQ (LETT |s| |restOfs|)
                                           (EXIT (LETT |i| (+ |i| 1)))))
                                     ('T
                                      (SEQ
                                       (SPADCALL |s| |firstOfsPlus1|
                                                 (QREFELT $ 81))
                                       (EXIT (LETT |noGap| NIL)))))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (COND
                              (|noGap|
                               (SEQ (LETT |firstOfs| (|SPADfirst| |s|))
                                    (EXIT
                                     (COND
                                      ((< |firstOfs| |bound|)
                                       (SPADCALL |s| (+ |firstOfs| 1)
                                                 (QREFELT $ 81)))
                                      ((< |m| |bound|)
                                       (SEQ
                                        (SPADCALL |s| (+ |m| 1) (QREFELT $ 81))
                                        (EXIT (LETT |i| |m|))))
                                      (#3#
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed"))
                                        (GO #4=#:G773))))))))
                             (SEQ (LETT |j| |i|) G190
                                  (COND ((< |j| 1) (GO G191)))
                                  (SEQ (EXIT (LETT |s| (CONS |j| |s|))))
                                  (LETT |j| (+ |j| -1)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS 0 |s|))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |FFPOLY;nextIrreduciblePoly;SupU;11|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPROG
         ((|headpol|
           (|List|
            #1=(|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF))))
          (|s1| (|List| (|NonNegativeInteger|)))
          (|tailpol|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|headlookuplist| (|List| (|NonNegativeInteger|))) (#2=#:G805 NIL)
          (|taillookuplist| (|List| (|NonNegativeInteger|)))
          (|weight| (|NonNegativeInteger|))
          (|s| (|List| (|NonNegativeInteger|))) (#3=#:G803 NIL) (#4=#:G818 NIL)
          (#5=#:G820 NIL) (|entry| NIL)
          (|restfcopy|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|pol| (|SparseUnivariatePolynomial| GF)) (#6=#:G793 NIL)
          (|j| (|NonNegativeInteger|))
          (|term|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|n1| (|NonNegativeInteger|)) (#7=#:G789 NIL) (#8=#:G788 NIL)
          (|fcopy| (|List| #1#)) (#9=#:G819 NIL)
          (|fRepr|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 12)))
                (EXIT
                 (COND
                  ((EQL |n| 0)
                   (|error| "polynomial must have positive degree"))
                  ('T
                   (SEQ
                    (COND
                     ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)))
                                (|spadConstant| $ 13) (QREFELT $ 64))
                      (LETT |f|
                            (SPADCALL (SPADCALL |lcf| (QREFELT $ 82)) |f|
                                      (QREFELT $ 31)))))
                    (LETT |fRepr| |f|) (LETT |fcopy| NIL)
                    (SEQ (LETT |term| NIL) (LETT #9# |fRepr|) G190
                         (COND
                          ((OR (ATOM #9#) (PROGN (LETT |term| (CAR #9#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |fcopy|
                                 (CONS (CONS (CAR |term|) (CDR |term|))
                                       |fcopy|))))
                         (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                    (COND
                     ((SPADCALL (QCAR |term|) 0 (QREFELT $ 62))
                      (LETT |fcopy|
                            (CONS (CONS 0 (|spadConstant| $ 19)) |fcopy|))))
                    (LETT |tailpol| NIL) (LETT |headpol| |fcopy|)
                    (LETT |fcopy| (REVERSE |fcopy|))
                    (LETT |weight|
                          (PROG1 (LETT #8# (- (LENGTH |fcopy|) 1))
                            (|check_subtype2| (>= #8# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #8#)))
                    (LETT |taillookuplist| NIL)
                    (LETT |headlookuplist|
                          (SPADCALL |weight| 0 (QREFELT $ 83)))
                    (LETT |s| NIL)
                    (LETT |n1|
                          (PROG1 (LETT #7# (- |n| 1))
                            (|check_subtype2| (>= #7# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #7#)))
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (SEQ G190
                                (COND
                                 ((NULL (NULL (NULL |headlookuplist|)))
                                  (GO G191)))
                                (SEQ (LETT |term| (|SPADfirst| |headpol|))
                                     (LETT |j| (|SPADfirst| |headlookuplist|))
                                     (COND
                                      ((EQL |j| 0)
                                       (LETT |j|
                                             (SPADCALL (QCDR |term|)
                                                       (QREFELT $ 84)))))
                                     (LETT |j| (+ |j| 1))
                                     (EXIT
                                      (COND
                                       ((EQL (REM |j| (QREFELT $ 10)) 0)
                                        (SEQ
                                         (LETT |tailpol|
                                               (CONS |term| |tailpol|))
                                         (LETT |headpol| (CDR |headpol|))
                                         (LETT |taillookuplist|
                                               (CONS |j| |taillookuplist|))
                                         (EXIT
                                          (LETT |headlookuplist|
                                                (CDR |headlookuplist|)))))
                                       ('T
                                        (SEQ
                                         (PROGN
                                          (RPLACD (|SPADfirst| |headpol|)
                                                  (SPADCALL
                                                   (PROG1 (LETT #6# |j|)
                                                     (|check_subtype2|
                                                      (> #6# 0)
                                                      '(|PositiveInteger|)
                                                      '(|NonNegativeInteger|)
                                                      #6#))
                                                   (QREFELT $ 85)))
                                          (QCDR (|SPADfirst| |headpol|)))
                                         (SPADCALL |headlookuplist| |j|
                                                   (QREFELT $ 81))
                                         (EXIT
                                          (COND
                                           ((NULL |taillookuplist|)
                                            (SEQ
                                             (LETT |pol|
                                                   (|FFPOLY;revListToSUP|
                                                    |headpol| $))
                                             (EXIT
                                              (COND
                                               ((SPADCALL |pol| (QREFELT $ 76))
                                                (PROGN
                                                 (LETT #4# (CONS 0 |pol|))
                                                 (GO #10=#:G817)))))))
                                           ('T
                                            (SEQ
                                             (LETT |headpol|
                                                   (CONS
                                                    (|SPADfirst| |tailpol|)
                                                    |headpol|))
                                             (LETT |tailpol| (CDR |tailpol|))
                                             (LETT |headlookuplist|
                                                   (CONS
                                                    (|SPADfirst|
                                                     |taillookuplist|)
                                                    |headlookuplist|))
                                             (EXIT
                                              (LETT |taillookuplist|
                                                    (CDR
                                                     |taillookuplist|))))))))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (COND
                            ((NULL |s|)
                             (SEQ (LETT |restfcopy| (CDR |fcopy|))
                                  (EXIT
                                   (SEQ (LETT |entry| NIL)
                                        (LETT #5# |restfcopy|) G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN
                                               (LETT |entry| (CAR #5#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |s|
                                                (CONS (QCAR |entry|) |s|))))
                                        (LETT #5# (CDR #5#)) (GO G190) G191
                                        (EXIT NIL))))))
                           (EXIT
                            (COND
                             ((EQL |weight| |n|)
                              (PROGN (LETT #4# (CONS 1 "failed")) (GO #10#)))
                             ('T
                              (SEQ
                               (LETT |s1|
                                     (PROG2
                                         (LETT #3#
                                               (|FFPOLY;nextSubset| (CDR |s|)
                                                |n1| $))
                                         (QCDR #3#)
                                       (|check_union2| (QEQCAR #3# 0)
                                                       (|List|
                                                        (|NonNegativeInteger|))
                                                       (|Union|
                                                        (|List|
                                                         (|NonNegativeInteger|))
                                                        "failed")
                                                       #3#)))
                               (LETT |s| (CONS 0 |s1|))
                               (LETT |weight| (SPADCALL |s| (QREFELT $ 80)))
                               (LETT |taillookuplist| NIL)
                               (LETT |headlookuplist|
                                     (CONS (QREFELT $ 10)
                                           (SPADCALL
                                            (PROG1 (LETT #2# (- |weight| 1))
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#))
                                            1 (QREFELT $ 83))))
                               (LETT |tailpol| NIL) (LETT |headpol| NIL)
                               (LETT |s1| (CONS |n| (REVERSE |s1|)))
                               (SEQ G190
                                    (COND
                                     ((NULL (NULL (NULL |s1|))) (GO G191)))
                                    (SEQ
                                     (LETT |headpol|
                                           (CONS
                                            (CONS (|SPADfirst| |s1|)
                                                  (|spadConstant| $ 13))
                                            |headpol|))
                                     (EXIT (LETT |s1| (CDR |s1|))))
                                    NIL (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (LETT |headpol|
                                      (CONS (CONS 0 (|spadConstant| $ 19))
                                            |headpol|))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #10# (EXIT #4#)))) 

(SDEFUN |FFPOLY;nextPrimitivePoly;SupU;12|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPROG
         ((|c| (GF)) (#1=#:G875 NIL) (|l| (|NonNegativeInteger|))
          (|headpol|
           #2=(|List|
               (|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF))))
          (|s1| (|List| (|NonNegativeInteger|)))
          (|tailpol|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|headlookuplist| (|List| (|NonNegativeInteger|))) (#3=#:G867 NIL)
          (|taillookuplist| (|List| (|NonNegativeInteger|)))
          (|weight| (|NonNegativeInteger|))
          (|s| (|List| (|NonNegativeInteger|))) (#4=#:G865 NIL) (#5=#:G886 NIL)
          (|entry| NIL) (|restfcopy| #2#) (|notReady| #6=(|Boolean|))
          (#7=#:G884 NIL) (|pol| (|SparseUnivariatePolynomial| GF))
          (#8=#:G855 NIL) (|j| (|NonNegativeInteger|))
          (|term|
           #9=(|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|constterm| #9#) (#10=#:G844 NIL) (|noGenerator| #6#)
          (|n1| (|NonNegativeInteger|)) (#11=#:G842 NIL) (#12=#:G841 NIL)
          (#13=#:G883 NIL) (#14=#:G832 NIL) (|q1| (|NonNegativeInteger|))
          (#15=#:G830 NIL) (|c0| (GF))
          (|xn|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|fcopy|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#16=#:G885 NIL)
          (|fRepr|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 12)))
                (EXIT
                 (COND
                  ((EQL |n| 0)
                   (|error| "polynomial must have positive degree"))
                  (#17='T
                   (SEQ
                    (COND
                     ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)))
                                (|spadConstant| $ 13) (QREFELT $ 64))
                      (LETT |f|
                            (SPADCALL (SPADCALL |lcf| (QREFELT $ 82)) |f|
                                      (QREFELT $ 31)))))
                    (LETT |fRepr| |f|) (LETT |fcopy| NIL)
                    (SEQ (LETT |term| NIL) (LETT #16# |fRepr|) G190
                         (COND
                          ((OR (ATOM #16#)
                               (PROGN (LETT |term| (CAR #16#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |fcopy|
                                 (CONS (CONS (CAR |term|) (CDR |term|))
                                       |fcopy|))))
                         (LETT #16# (CDR #16#)) (GO G190) G191 (EXIT NIL))
                    (COND
                     ((SPADCALL (QCAR |term|) 0 (QREFELT $ 62))
                      (SEQ (LETT |term| (CONS 0 (|spadConstant| $ 19)))
                           (EXIT (LETT |fcopy| (CONS |term| |fcopy|))))))
                    (LETT |fcopy| (REVERSE |fcopy|))
                    (LETT |xn| (|SPADfirst| |fcopy|)) (LETT |c0| (QCDR |term|))
                    (LETT |l|
                          (REM (SPADCALL |c0| (QREFELT $ 84)) (QREFELT $ 10)))
                    (EXIT
                     (COND
                      ((EQL |n| 1)
                       (SEQ
                        (LETT |q1|
                              (PROG1 (LETT #15# (- (QREFELT $ 10) 1))
                                (|check_subtype2| (>= #15# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #15#)))
                        (SEQ G190 (COND ((NULL (< |l| |q1|)) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| (+ |l| 1))
                                    (LETT |c|
                                          (SPADCALL
                                           (PROG1 (LETT #14# |l|)
                                             (|check_subtype2| (> #14# 0)
                                                               '(|PositiveInteger|)
                                                               '(|NonNegativeInteger|)
                                                               #14#))
                                           (QREFELT $ 85)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL (SPADCALL |c| (QREFELT $ 26))
                                                 (QREFELT $ 88))
                                       (PROGN
                                        (LETT #13#
                                              (PROGN
                                               (LETT #7#
                                                     (CONS 0
                                                           (LIST |xn|
                                                                 (CONS 0
                                                                       |c|))))
                                               (GO #18=#:G882)))
                                        (GO #19=#:G833)))))))
                              #19# (EXIT #13#))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (CONS 1 "failed"))))
                      (#17#
                       (SEQ
                        (LETT |weight|
                              (PROG1 (LETT #12# (- (LENGTH |fcopy|) 1))
                                (|check_subtype2| (>= #12# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #12#)))
                        (LETT |s| NIL)
                        (LETT |n1|
                              (PROG1 (LETT #11# (- |n| 1))
                                (|check_subtype2| (>= #11# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #11#)))
                        (LETT |c| |c0|)
                        (SEQ G190
                             (COND ((NULL (< |l| (QREFELT $ 10))) (GO G191)))
                             (SEQ (LETT |noGenerator| 'T)
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (COND
                                           (|noGenerator|
                                            (< |l| (QREFELT $ 10)))
                                           ('T NIL)))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| $ 13)
                                                        (QREFELT $ 26))
                                              |n| (QREFELT $ 89))
                                             |c| (QREFELT $ 90))
                                            (QREFELT $ 88))
                                           (LETT |noGenerator| NIL))
                                          ('T
                                           (SEQ (LETT |l| (+ |l| 1))
                                                (EXIT
                                                 (LETT |c|
                                                       (SPADCALL
                                                        (PROG1 (LETT #10# |l|)
                                                          (|check_subtype2|
                                                           (> #10# 0)
                                                           '(|PositiveInteger|)
                                                           '(|NonNegativeInteger|)
                                                           #10#))
                                                        (QREFELT $ 85)))))))))
                                       NIL (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (COND
                                    (|noGenerator|
                                     (PROGN
                                      (LETT #7# (CONS 1 "failed"))
                                      (GO #18#)))
                                    ('T
                                     (SEQ (LETT |constterm| (CONS 0 |c|))
                                          (COND
                                           ((SPADCALL |c| |c0| (QREFELT $ 51))
                                            (COND
                                             ((> |weight| 1)
                                              (SEQ
                                               (LETT |headpol|
                                                     (CDR (REVERSE |fcopy|)))
                                               (EXIT
                                                (LETT |headlookuplist|
                                                      (SPADCALL |weight| 0
                                                                (QREFELT $
                                                                         83))))))
                                             ('T
                                              (SEQ
                                               (LETT |headpol|
                                                     (LIST
                                                      (CONS 1
                                                            (|spadConstant| $
                                                                            19))
                                                      |xn|))
                                               (LETT |headlookuplist|
                                                     (LIST (QREFELT $ 10)))
                                               (LETT |s| (LIST 0 1))
                                               (EXIT (LETT |weight| 2))))))
                                           ('T
                                            (SEQ
                                             (LETT |headpol|
                                                   (LIST
                                                    (CONS 1
                                                          (|spadConstant| $
                                                                          19))
                                                    |xn|))
                                             (LETT |headlookuplist|
                                                   (LIST (QREFELT $ 10)))
                                             (LETT |s| (LIST 0 1))
                                             (EXIT (LETT |weight| 2)))))
                                          (LETT |tailpol| NIL)
                                          (LETT |taillookuplist| NIL)
                                          (LETT |notReady| 'T)
                                          (SEQ G190
                                               (COND
                                                ((NULL |notReady|) (GO G191)))
                                               (SEQ
                                                (SEQ G190
                                                     (COND
                                                      ((NULL
                                                        (NULL
                                                         (NULL
                                                          |headlookuplist|)))
                                                       (GO G191)))
                                                     (SEQ
                                                      (LETT |term|
                                                            (|SPADfirst|
                                                             |headpol|))
                                                      (LETT |j|
                                                            (|SPADfirst|
                                                             |headlookuplist|))
                                                      (COND
                                                       ((EQL |j| 0)
                                                        (LETT |j|
                                                              (SPADCALL
                                                               (QCDR |term|)
                                                               (QREFELT $
                                                                        84)))))
                                                      (LETT |j| (+ |j| 1))
                                                      (EXIT
                                                       (COND
                                                        ((EQL
                                                          (REM |j|
                                                               (QREFELT $ 10))
                                                          0)
                                                         (SEQ
                                                          (LETT |tailpol|
                                                                (CONS |term|
                                                                      |tailpol|))
                                                          (LETT |headpol|
                                                                (CDR
                                                                 |headpol|))
                                                          (LETT
                                                           |taillookuplist|
                                                           (CONS |j|
                                                                 |taillookuplist|))
                                                          (EXIT
                                                           (LETT
                                                            |headlookuplist|
                                                            (CDR
                                                             |headlookuplist|)))))
                                                        ('T
                                                         (SEQ
                                                          (PROGN
                                                           (RPLACD
                                                            (|SPADfirst|
                                                             |headpol|)
                                                            (SPADCALL
                                                             (PROG1
                                                                 (LETT #8# |j|)
                                                               (|check_subtype2|
                                                                (> #8# 0)
                                                                '(|PositiveInteger|)
                                                                '(|NonNegativeInteger|)
                                                                #8#))
                                                             (QREFELT $ 85)))
                                                           (QCDR
                                                            (|SPADfirst|
                                                             |headpol|)))
                                                          (SPADCALL
                                                           |headlookuplist| |j|
                                                           (QREFELT $ 81))
                                                          (EXIT
                                                           (COND
                                                            ((NULL
                                                              |taillookuplist|)
                                                             (SEQ
                                                              (LETT |pol|
                                                                    (|FFPOLY;revListToSUP|
                                                                     (CONS
                                                                      |constterm|
                                                                      |headpol|)
                                                                     $))
                                                              (EXIT
                                                               (COND
                                                                ((SPADCALL
                                                                  |pol|
                                                                  (QREFELT $
                                                                           74))
                                                                 (PROGN
                                                                  (LETT #7#
                                                                        (CONS 0
                                                                              |pol|))
                                                                  (GO
                                                                   #18#)))))))
                                                            ('T
                                                             (SEQ
                                                              (LETT |headpol|
                                                                    (CONS
                                                                     (|SPADfirst|
                                                                      |tailpol|)
                                                                     |headpol|))
                                                              (LETT |tailpol|
                                                                    (CDR
                                                                     |tailpol|))
                                                              (LETT
                                                               |headlookuplist|
                                                               (CONS
                                                                (|SPADfirst|
                                                                 |taillookuplist|)
                                                                |headlookuplist|))
                                                              (EXIT
                                                               (LETT
                                                                |taillookuplist|
                                                                (CDR
                                                                 |taillookuplist|))))))))))))
                                                     NIL (GO G190) G191
                                                     (EXIT NIL))
                                                (EXIT
                                                 (COND
                                                  ((EQL |weight| |n|)
                                                   (LETT |notReady| NIL))
                                                  ('T
                                                   (SEQ
                                                    (COND
                                                     ((NULL |s|)
                                                      (SEQ
                                                       (LETT |restfcopy|
                                                             (CDR |fcopy|))
                                                       (EXIT
                                                        (SEQ (LETT |entry| NIL)
                                                             (LETT #5#
                                                                   |restfcopy|)
                                                             G190
                                                             (COND
                                                              ((OR (ATOM #5#)
                                                                   (PROGN
                                                                    (LETT
                                                                     |entry|
                                                                     (CAR #5#))
                                                                    NIL))
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (LETT |s|
                                                                     (CONS
                                                                      (QCAR
                                                                       |entry|)
                                                                      |s|))))
                                                             (LETT #5#
                                                                   (CDR #5#))
                                                             (GO G190) G191
                                                             (EXIT NIL))))))
                                                    (LETT |s1|
                                                          (PROG2
                                                              (LETT #4#
                                                                    (|FFPOLY;nextSubset|
                                                                     (CDR |s|)
                                                                     |n1| $))
                                                              (QCDR #4#)
                                                            (|check_union2|
                                                             (QEQCAR #4# 0)
                                                             (|List|
                                                              (|NonNegativeInteger|))
                                                             (|Union|
                                                              (|List|
                                                               (|NonNegativeInteger|))
                                                              "failed")
                                                             #4#)))
                                                    (LETT |s| (CONS 0 |s1|))
                                                    (LETT |weight|
                                                          (SPADCALL |s|
                                                                    (QREFELT $
                                                                             80)))
                                                    (LETT |taillookuplist| NIL)
                                                    (LETT |headlookuplist|
                                                          (CONS (QREFELT $ 10)
                                                                (SPADCALL
                                                                 (PROG1
                                                                     (LETT #3#
                                                                           (-
                                                                            |weight|
                                                                            2))
                                                                   (|check_subtype2|
                                                                    (>= #3# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #3#))
                                                                 1
                                                                 (QREFELT $
                                                                          83))))
                                                    (LETT |tailpol| NIL)
                                                    (LETT |headpol|
                                                          (LIST
                                                           (CONS
                                                            (|SPADfirst| |s1|)
                                                            (|spadConstant| $
                                                                            19))))
                                                    (SEQ G190
                                                         (COND
                                                          ((NULL
                                                            (NULL
                                                             (NULL
                                                              (LETT |s1|
                                                                    (CDR
                                                                     |s1|)))))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT |headpol|
                                                                 (CONS
                                                                  (CONS
                                                                   (|SPADfirst|
                                                                    |s1|)
                                                                   (|spadConstant|
                                                                    $ 13))
                                                                  |headpol|))))
                                                         NIL (GO G190) G191
                                                         (EXIT NIL))
                                                    (EXIT
                                                     (LETT |headpol|
                                                           (REVERSE
                                                            (CONS
                                                             (CONS |n|
                                                                   (|spadConstant|
                                                                    $ 13))
                                                             |headpol|)))))))))
                                               NIL (GO G190) G191 (EXIT NIL))
                                          (LETT |l| (+ |l| 1))
                                          (EXIT
                                           (LETT |c|
                                                 (SPADCALL
                                                  (PROG1 (LETT #1# |l|)
                                                    (|check_subtype2| (> #1# 0)
                                                                      '(|PositiveInteger|)
                                                                      '(|NonNegativeInteger|)
                                                                      #1#))
                                                  (QREFELT $ 85)))))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (CONS 1 "failed"))))))))))))
          #18# (EXIT #7#)))) 

(SDEFUN |FFPOLY;nextNormalPoly;SupU;13|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPROG
         ((|a| (GF)) (#1=#:G933 NIL) (|l| (|NonNegativeInteger|))
          (|middlepol|
           #2=(|List|
               (|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF))))
          (|s1| (|List| (|NonNegativeInteger|)))
          (|tailpol|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|middlelookuplist| (|List| (|NonNegativeInteger|))) (#3=#:G925 NIL)
          (|taillookuplist| (|List| (|NonNegativeInteger|)))
          (|weight| (|NonNegativeInteger|))
          (|s| (|List| (|NonNegativeInteger|))) (#4=#:G923 NIL) (#5=#:G942 NIL)
          (|entry| NIL) (|restfcopy| #2#) (|notReady| (|Boolean|))
          (#6=#:G940 NIL) (|pol| (|SparseUnivariatePolynomial| GF))
          (#7=#:G911 NIL) (|j| (|NonNegativeInteger|))
          (|term|
           #8=(|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|headpol| (|List| #8#)) (|n2| (|NonNegativeInteger|))
          (#9=#:G902 NIL) (|n1| (|NonNegativeInteger|)) (#10=#:G901 NIL)
          (#11=#:G899 NIL) (|a0| (GF))
          (|xn|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|fcopy|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#12=#:G941 NIL)
          (|fRepr|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 12)))
                (EXIT
                 (COND
                  ((EQL |n| 0)
                   (|error| "polynomial must have positive degree"))
                  (#13='T
                   (SEQ
                    (COND
                     ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)))
                                (|spadConstant| $ 13) (QREFELT $ 64))
                      (LETT |f|
                            (SPADCALL (SPADCALL |lcf| (QREFELT $ 82)) |f|
                                      (QREFELT $ 31)))))
                    (LETT |fRepr| |f|) (LETT |fcopy| NIL)
                    (SEQ (LETT |term| NIL) (LETT #12# |fRepr|) G190
                         (COND
                          ((OR (ATOM #12#)
                               (PROGN (LETT |term| (CAR #12#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |fcopy|
                                 (CONS (CONS (CAR |term|) (CDR |term|))
                                       |fcopy|))))
                         (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))
                    (COND
                     ((SPADCALL (QCAR |term|) 0 (QREFELT $ 62))
                      (SEQ (LETT |term| (CONS 0 (|spadConstant| $ 19)))
                           (EXIT (LETT |fcopy| (CONS |term| |fcopy|))))))
                    (LETT |fcopy| (REVERSE |fcopy|))
                    (LETT |xn| (|SPADfirst| |fcopy|))
                    (LETT |middlepol| (CDR |fcopy|))
                    (LETT |a0| (QCDR (|SPADfirst| |middlepol|)))
                    (LETT |l|
                          (REM (SPADCALL |a0| (QREFELT $ 84)) (QREFELT $ 10)))
                    (EXIT
                     (COND
                      ((EQL |n| 1)
                       (COND ((EQL |l| (- (QREFELT $ 10) 1)) (CONS 1 "failed"))
                             (#13#
                              (CONS 0
                                    (LIST |xn|
                                          (CONS 0
                                                (SPADCALL
                                                 (PROG1 (LETT #11# (+ |l| 1))
                                                   (|check_subtype2| (> #11# 0)
                                                                     '(|PositiveInteger|)
                                                                     '(|NonNegativeInteger|)
                                                                     #11#))
                                                 (QREFELT $ 85))))))))
                      (#13#
                       (SEQ
                        (LETT |n1|
                              (PROG1 (LETT #10# (- |n| 1))
                                (|check_subtype2| (>= #10# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #10#)))
                        (LETT |n2|
                              (PROG1 (LETT #9# (- |n1| 1))
                                (|check_subtype2| (>= #9# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #9#)))
                        (LETT |a| |a0|)
                        (COND
                         ((EQL |l| 0)
                          (SEQ (LETT |l| 1)
                               (EXIT (LETT |a| (|spadConstant| $ 13))))))
                        (SEQ G190
                             (COND ((NULL (< |l| (QREFELT $ 10))) (GO G191)))
                             (SEQ
                              (COND
                               ((SPADCALL |a| |a0| (QREFELT $ 51))
                                (SEQ
                                 (LETT |middlepol| (REVERSE (CDR |middlepol|)))
                                 (LETT |weight| (LENGTH |middlepol|))
                                 (LETT |middlelookuplist|
                                       (SPADCALL |weight| 0 (QREFELT $ 83)))
                                 (EXIT (LETT |s| NIL))))
                               ('T
                                (SEQ
                                 (LETT |middlepol|
                                       (LIST (CONS 0 (|spadConstant| $ 19))))
                                 (LETT |middlelookuplist|
                                       (LIST (QREFELT $ 10)))
                                 (LETT |s| (LIST 0))
                                 (EXIT (LETT |weight| 1)))))
                              (LETT |headpol| (LIST |xn| (CONS |n1| |a|)))
                              (LETT |tailpol| NIL) (LETT |taillookuplist| NIL)
                              (LETT |notReady| 'T)
                              (SEQ G190 (COND ((NULL |notReady|) (GO G191)))
                                   (SEQ
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (NULL (NULL |middlelookuplist|)))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |term|
                                                (|SPADfirst| |middlepol|))
                                          (LETT |j|
                                                (|SPADfirst|
                                                 |middlelookuplist|))
                                          (COND
                                           ((EQL |j| 0)
                                            (LETT |j|
                                                  (SPADCALL (QCDR |term|)
                                                            (QREFELT $ 84)))))
                                          (LETT |j| (+ |j| 1))
                                          (EXIT
                                           (COND
                                            ((EQL (REM |j| (QREFELT $ 10)) 0)
                                             (SEQ
                                              (LETT |tailpol|
                                                    (CONS |term| |tailpol|))
                                              (LETT |middlepol|
                                                    (CDR |middlepol|))
                                              (LETT |taillookuplist|
                                                    (CONS |j|
                                                          |taillookuplist|))
                                              (EXIT
                                               (LETT |middlelookuplist|
                                                     (CDR
                                                      |middlelookuplist|)))))
                                            ('T
                                             (SEQ
                                              (PROGN
                                               (RPLACD
                                                (|SPADfirst| |middlepol|)
                                                (SPADCALL
                                                 (PROG1 (LETT #7# |j|)
                                                   (|check_subtype2| (> #7# 0)
                                                                     '(|PositiveInteger|)
                                                                     '(|NonNegativeInteger|)
                                                                     #7#))
                                                 (QREFELT $ 85)))
                                               (QCDR
                                                (|SPADfirst| |middlepol|)))
                                              (SPADCALL |middlelookuplist| |j|
                                                        (QREFELT $ 81))
                                              (EXIT
                                               (COND
                                                ((NULL |taillookuplist|)
                                                 (SEQ
                                                  (LETT |pol|
                                                        (|FFPOLY;listToSUP|
                                                         (SPADCALL |headpol|
                                                                   (REVERSE
                                                                    |middlepol|)
                                                                   (QREFELT $
                                                                            94))
                                                         $))
                                                  (EXIT
                                                   (COND
                                                    ((SPADCALL |pol|
                                                               (QREFELT $ 78))
                                                     (PROGN
                                                      (LETT #6# (CONS 0 |pol|))
                                                      (GO #14=#:G939)))))))
                                                ('T
                                                 (SEQ
                                                  (LETT |middlepol|
                                                        (CONS
                                                         (|SPADfirst|
                                                          |tailpol|)
                                                         |middlepol|))
                                                  (LETT |tailpol|
                                                        (CDR |tailpol|))
                                                  (LETT |middlelookuplist|
                                                        (CONS
                                                         (|SPADfirst|
                                                          |taillookuplist|)
                                                         |middlelookuplist|))
                                                  (EXIT
                                                   (LETT |taillookuplist|
                                                         (CDR
                                                          |taillookuplist|))))))))))))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((EQL |weight| |n1|)
                                       (LETT |notReady| NIL))
                                      ('T
                                       (SEQ
                                        (COND
                                         ((NULL |s|)
                                          (SEQ
                                           (LETT |restfcopy|
                                                 (CDR (CDR |fcopy|)))
                                           (EXIT
                                            (SEQ (LETT |entry| NIL)
                                                 (LETT #5# |restfcopy|) G190
                                                 (COND
                                                  ((OR (ATOM #5#)
                                                       (PROGN
                                                        (LETT |entry|
                                                              (CAR #5#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |s|
                                                         (CONS (QCAR |entry|)
                                                               |s|))))
                                                 (LETT #5# (CDR #5#)) (GO G190)
                                                 G191 (EXIT NIL))))))
                                        (LETT |s1|
                                              (PROG2
                                                  (LETT #4#
                                                        (|FFPOLY;nextSubset|
                                                         (CDR |s|) |n2| $))
                                                  (QCDR #4#)
                                                (|check_union2| (QEQCAR #4# 0)
                                                                (|List|
                                                                 (|NonNegativeInteger|))
                                                                (|Union|
                                                                 (|List|
                                                                  (|NonNegativeInteger|))
                                                                 "failed")
                                                                #4#)))
                                        (LETT |s| (CONS 0 |s1|))
                                        (LETT |weight|
                                              (SPADCALL |s| (QREFELT $ 80)))
                                        (LETT |taillookuplist| NIL)
                                        (LETT |middlelookuplist|
                                              (CONS (QREFELT $ 10)
                                                    (SPADCALL
                                                     (PROG1
                                                         (LETT #3#
                                                               (- |weight| 1))
                                                       (|check_subtype2|
                                                        (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #3#))
                                                     1 (QREFELT $ 83))))
                                        (LETT |tailpol| NIL)
                                        (LETT |middlepol| NIL)
                                        (LETT |s1| (REVERSE |s1|))
                                        (SEQ G190
                                             (COND
                                              ((NULL (NULL (NULL |s1|)))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |middlepol|
                                                    (CONS
                                                     (CONS (|SPADfirst| |s1|)
                                                           (|spadConstant| $
                                                                           13))
                                                     |middlepol|))
                                              (EXIT (LETT |s1| (CDR |s1|))))
                                             NIL (GO G190) G191 (EXIT NIL))
                                        (EXIT
                                         (LETT |middlepol|
                                               (CONS
                                                (CONS 0 (|spadConstant| $ 19))
                                                |middlepol|))))))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |l| (+ |l| 1))
                              (EXIT
                               (LETT |a|
                                     (SPADCALL
                                      (PROG1 (LETT #1# |l|)
                                        (|check_subtype2| (> #1# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                      (QREFELT $ 85)))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (CONS 1 "failed"))))))))))))
          #14# (EXIT #6#)))) 

(SDEFUN |FFPOLY;nextNormalPrimitivePoly;SupU;14|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPROG
         ((|a| (GF)) (|la| #1=(|NonNegativeInteger|)) (|c| (GF))
          (#2=#:G1005 NIL) (|lc| #1#) (#3=#:G1001 NIL)
          (|middlepol|
           #4=(|List|
               (|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF))))
          (|s1| (|List| (|NonNegativeInteger|)))
          (|tailpol|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|middlelookuplist| (|List| (|NonNegativeInteger|))) (#5=#:G993 NIL)
          (|taillookuplist| (|List| (|NonNegativeInteger|)))
          (|weight| (|NonNegativeInteger|))
          (|s| (|List| (|NonNegativeInteger|))) (#6=#:G991 NIL)
          (#7=#:G1017 NIL) (|entry| NIL) (|restfcopy| #4#)
          (|notReady| #8=(|Boolean|)) (#9=#:G1014 NIL) (#10=#:G1015 NIL)
          (|pol| (|SparseUnivariatePolynomial| GF)) (#11=#:G979 NIL)
          (|j| (|NonNegativeInteger|))
          (|term|
           #12=(|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF)))
          (#13=#:G968 NIL) (|headpol| (|List| #12#)) (|constterm| #12#)
          (#14=#:G962 NIL) (|noGenerator| #8#) (|a0| (GF))
          (|n2| (|NonNegativeInteger|)) (#15=#:G959 NIL)
          (|n1| (|NonNegativeInteger|)) (#16=#:G958 NIL) (#17=#:G1013 NIL)
          (#18=#:G954 NIL) (|q1| (|NonNegativeInteger|)) (#19=#:G952 NIL)
          (|c0| (GF))
          (|xn|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|fcopy|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#20=#:G1016 NIL)
          (|fRepr|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 12)))
                (EXIT
                 (COND
                  ((EQL |n| 0)
                   (|error| "polynomial must have positive degree"))
                  (#21='T
                   (SEQ
                    (COND
                     ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)))
                                (|spadConstant| $ 13) (QREFELT $ 64))
                      (LETT |f|
                            (SPADCALL (SPADCALL |lcf| (QREFELT $ 82)) |f|
                                      (QREFELT $ 31)))))
                    (LETT |fRepr| |f|) (LETT |fcopy| NIL)
                    (SEQ (LETT |term| NIL) (LETT #20# |fRepr|) G190
                         (COND
                          ((OR (ATOM #20#)
                               (PROGN (LETT |term| (CAR #20#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |fcopy|
                                 (CONS (CONS (CAR |term|) (CDR |term|))
                                       |fcopy|))))
                         (LETT #20# (CDR #20#)) (GO G190) G191 (EXIT NIL))
                    (COND
                     ((SPADCALL (QCAR |term|) 0 (QREFELT $ 62))
                      (SEQ (LETT |term| (CONS 0 (|spadConstant| $ 19)))
                           (EXIT (LETT |fcopy| (CONS |term| |fcopy|))))))
                    (LETT |fcopy| (REVERSE |fcopy|))
                    (LETT |xn| (|SPADfirst| |fcopy|)) (LETT |c0| (QCDR |term|))
                    (LETT |lc|
                          (REM (SPADCALL |c0| (QREFELT $ 84)) (QREFELT $ 10)))
                    (EXIT
                     (COND
                      ((EQL |n| 1)
                       (SEQ
                        (LETT |q1|
                              (PROG1 (LETT #19# (- (QREFELT $ 10) 1))
                                (|check_subtype2| (>= #19# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #19#)))
                        (SEQ G190 (COND ((NULL (< |lc| |q1|)) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |lc| (+ |lc| 1))
                                    (LETT |c|
                                          (SPADCALL
                                           (PROG1 (LETT #18# |lc|)
                                             (|check_subtype2| (> #18# 0)
                                                               '(|PositiveInteger|)
                                                               '(|NonNegativeInteger|)
                                                               #18#))
                                           (QREFELT $ 85)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL (SPADCALL |c| (QREFELT $ 26))
                                                 (QREFELT $ 88))
                                       (PROGN
                                        (LETT #17#
                                              (PROGN
                                               (LETT #10#
                                                     (CONS 0
                                                           (LIST |xn|
                                                                 (CONS 0
                                                                       |c|))))
                                               (GO #22=#:G1012)))
                                        (GO #23=#:G955)))))))
                              #23# (EXIT #17#))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (CONS 1 "failed"))))
                      (#21#
                       (SEQ
                        (LETT |n1|
                              (PROG1 (LETT #16# (- |n| 1))
                                (|check_subtype2| (>= #16# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #16#)))
                        (LETT |n2|
                              (PROG1 (LETT #15# (- |n1| 1))
                                (|check_subtype2| (>= #15# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #15#)))
                        (LETT |middlepol| (CDR |fcopy|))
                        (LETT |a0| (QCDR (|SPADfirst| |middlepol|)))
                        (LETT |la|
                              (REM (SPADCALL |a0| (QREFELT $ 84))
                                   (QREFELT $ 10)))
                        (LETT |c| |c0|) (LETT |a| |a0|)
                        (COND
                         ((EQL |la| 0)
                          (SEQ (LETT |la| 1)
                               (EXIT (LETT |a| (|spadConstant| $ 13))))))
                        (SEQ G190
                             (COND ((NULL (< |lc| (QREFELT $ 10))) (GO G191)))
                             (SEQ (LETT |noGenerator| 'T)
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (COND
                                           (|noGenerator|
                                            (< |lc| (QREFELT $ 10)))
                                           ('T NIL)))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| $ 13)
                                                        (QREFELT $ 26))
                                              |n| (QREFELT $ 89))
                                             |c| (QREFELT $ 90))
                                            (QREFELT $ 88))
                                           (LETT |noGenerator| NIL))
                                          ('T
                                           (SEQ (LETT |lc| (+ |lc| 1))
                                                (EXIT
                                                 (LETT |c|
                                                       (SPADCALL
                                                        (PROG1 (LETT #14# |lc|)
                                                          (|check_subtype2|
                                                           (> #14# 0)
                                                           '(|PositiveInteger|)
                                                           '(|NonNegativeInteger|)
                                                           #14#))
                                                        (QREFELT $ 85)))))))))
                                       NIL (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (COND
                                    (|noGenerator|
                                     (PROGN
                                      (LETT #10# (CONS 1 "failed"))
                                      (GO #22#)))
                                    ('T
                                     (SEQ (LETT |constterm| (CONS 0 |c|))
                                          (SEQ G190
                                               (COND
                                                ((NULL (< |la| (QREFELT $ 10)))
                                                 (GO G191)))
                                               (SEQ
                                                (LETT |headpol|
                                                      (LIST |xn|
                                                            (CONS |n1| |a|)))
                                                (COND
                                                 ((SPADCALL |c| |c0|
                                                            (QREFELT $ 51))
                                                  (COND
                                                   ((SPADCALL |a| |a0|
                                                              (QREFELT $ 51))
                                                    (SEQ
                                                     (LETT |middlepol|
                                                           (CDR
                                                            (REVERSE
                                                             (CDR
                                                              |middlepol|))))
                                                     (LETT |weight|
                                                           (+
                                                            (LENGTH
                                                             |middlepol|)
                                                            1))
                                                     (LETT |middlelookuplist|
                                                           (SPADCALL
                                                            (PROG1
                                                                (LETT #13#
                                                                      (-
                                                                       |weight|
                                                                       1))
                                                              (|check_subtype2|
                                                               (>= #13# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #13#))
                                                            0 (QREFELT $ 83)))
                                                     (EXIT (LETT |s| NIL))))
                                                   ('T
                                                    (SEQ
                                                     (LETT |pol|
                                                           (|FFPOLY;listToSUP|
                                                            (SPADCALL |headpol|
                                                                      (LIST
                                                                       |constterm|)
                                                                      (QREFELT
                                                                       $ 94))
                                                            $))
                                                     (COND
                                                      ((SPADCALL |pol|
                                                                 (QREFELT $
                                                                          78))
                                                       (COND
                                                        ((SPADCALL |pol|
                                                                   (QREFELT $
                                                                            74))
                                                         (EXIT
                                                          (PROGN
                                                           (LETT #10#
                                                                 (CONS 0
                                                                       |pol|))
                                                           (GO #22#)))))))
                                                     (LETT |middlepol|
                                                           (LIST
                                                            (CONS 1
                                                                  (|spadConstant|
                                                                   $ 19))))
                                                     (LETT |middlelookuplist|
                                                           (LIST
                                                            (QREFELT $ 10)))
                                                     (LETT |s| (LIST 0 1))
                                                     (EXIT
                                                      (LETT |weight| 2))))))
                                                 ('T
                                                  (SEQ
                                                   (LETT |pol|
                                                         (|FFPOLY;listToSUP|
                                                          (SPADCALL |headpol|
                                                                    (LIST
                                                                     |constterm|)
                                                                    (QREFELT $
                                                                             94))
                                                          $))
                                                   (COND
                                                    ((SPADCALL |pol|
                                                               (QREFELT $ 78))
                                                     (COND
                                                      ((SPADCALL |pol|
                                                                 (QREFELT $
                                                                          74))
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #10#
                                                               (CONS 0 |pol|))
                                                         (GO #22#)))))))
                                                   (LETT |middlepol|
                                                         (LIST
                                                          (CONS 1
                                                                (|spadConstant|
                                                                 $ 19))))
                                                   (LETT |middlelookuplist|
                                                         (LIST (QREFELT $ 10)))
                                                   (LETT |s| (LIST 0 1))
                                                   (EXIT (LETT |weight| 2)))))
                                                (LETT |tailpol| NIL)
                                                (LETT |taillookuplist| NIL)
                                                (LETT |notReady| 'T)
                                                (SEQ G190
                                                     (COND
                                                      ((NULL |notReady|)
                                                       (GO G191)))
                                                     (SEQ
                                                      (SEQ G190
                                                           (COND
                                                            ((NULL
                                                              (NULL
                                                               (NULL
                                                                |middlelookuplist|)))
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |term|
                                                                  (|SPADfirst|
                                                                   |middlepol|))
                                                            (LETT |j|
                                                                  (|SPADfirst|
                                                                   |middlelookuplist|))
                                                            (COND
                                                             ((EQL |j| 0)
                                                              (LETT |j|
                                                                    (SPADCALL
                                                                     (QCDR
                                                                      |term|)
                                                                     (QREFELT $
                                                                              84)))))
                                                            (LETT |j|
                                                                  (+ |j| 1))
                                                            (EXIT
                                                             (COND
                                                              ((EQL
                                                                (REM |j|
                                                                     (QREFELT $
                                                                              10))
                                                                0)
                                                               (SEQ
                                                                (LETT |tailpol|
                                                                      (CONS
                                                                       |term|
                                                                       |tailpol|))
                                                                (LETT
                                                                 |middlepol|
                                                                 (CDR
                                                                  |middlepol|))
                                                                (LETT
                                                                 |taillookuplist|
                                                                 (CONS |j|
                                                                       |taillookuplist|))
                                                                (EXIT
                                                                 (LETT
                                                                  |middlelookuplist|
                                                                  (CDR
                                                                   |middlelookuplist|)))))
                                                              ('T
                                                               (SEQ
                                                                (PROGN
                                                                 (RPLACD
                                                                  (|SPADfirst|
                                                                   |middlepol|)
                                                                  (SPADCALL
                                                                   (PROG1
                                                                       (LETT
                                                                        #11#
                                                                        |j|)
                                                                     (|check_subtype2|
                                                                      (> #11#
                                                                         0)
                                                                      '(|PositiveInteger|)
                                                                      '(|NonNegativeInteger|)
                                                                      #11#))
                                                                   (QREFELT $
                                                                            85)))
                                                                 (QCDR
                                                                  (|SPADfirst|
                                                                   |middlepol|)))
                                                                (SPADCALL
                                                                 |middlelookuplist|
                                                                 |j|
                                                                 (QREFELT $
                                                                          81))
                                                                (EXIT
                                                                 (COND
                                                                  ((NULL
                                                                    |taillookuplist|)
                                                                   (SEQ
                                                                    (LETT |pol|
                                                                          (|FFPOLY;listToSUP|
                                                                           (SPADCALL
                                                                            |headpol|
                                                                            (REVERSE
                                                                             (CONS
                                                                              |constterm|
                                                                              |middlepol|))
                                                                            (QREFELT
                                                                             $
                                                                             94))
                                                                           $))
                                                                    (EXIT
                                                                     (COND
                                                                      ((SPADCALL
                                                                        |pol|
                                                                        (QREFELT
                                                                         $ 78))
                                                                       (SEQ
                                                                        (EXIT
                                                                         (COND
                                                                          ((SPADCALL
                                                                            |pol|
                                                                            (QREFELT
                                                                             $
                                                                             74))
                                                                           (PROGN
                                                                            (LETT
                                                                             #9#
                                                                             (PROGN
                                                                              (LETT
                                                                               #10#
                                                                               (CONS
                                                                                0
                                                                                |pol|))
                                                                              (GO
                                                                               #22#)))
                                                                            (GO
                                                                             #24=#:G981)))))
                                                                        #24#
                                                                        (EXIT
                                                                         #9#)))))))
                                                                  ('T
                                                                   (SEQ
                                                                    (LETT
                                                                     |middlepol|
                                                                     (CONS
                                                                      (|SPADfirst|
                                                                       |tailpol|)
                                                                      |middlepol|))
                                                                    (LETT
                                                                     |tailpol|
                                                                     (CDR
                                                                      |tailpol|))
                                                                    (LETT
                                                                     |middlelookuplist|
                                                                     (CONS
                                                                      (|SPADfirst|
                                                                       |taillookuplist|)
                                                                      |middlelookuplist|))
                                                                    (EXIT
                                                                     (LETT
                                                                      |taillookuplist|
                                                                      (CDR
                                                                       |taillookuplist|))))))))))))
                                                           NIL (GO G190) G191
                                                           (EXIT NIL))
                                                      (EXIT
                                                       (COND
                                                        ((EQL |weight| |n1|)
                                                         (LETT |notReady| NIL))
                                                        ('T
                                                         (SEQ
                                                          (COND
                                                           ((NULL |s|)
                                                            (SEQ
                                                             (LETT |restfcopy|
                                                                   (CDR
                                                                    (CDR
                                                                     |fcopy|)))
                                                             (EXIT
                                                              (SEQ
                                                               (LETT |entry|
                                                                     NIL)
                                                               (LETT #7#
                                                                     |restfcopy|)
                                                               G190
                                                               (COND
                                                                ((OR (ATOM #7#)
                                                                     (PROGN
                                                                      (LETT
                                                                       |entry|
                                                                       (CAR
                                                                        #7#))
                                                                      NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT |s|
                                                                       (CONS
                                                                        (QCAR
                                                                         |entry|)
                                                                        |s|))))
                                                               (LETT #7#
                                                                     (CDR #7#))
                                                               (GO G190) G191
                                                               (EXIT NIL))))))
                                                          (LETT |s1|
                                                                (PROG2
                                                                    (LETT #6#
                                                                          (|FFPOLY;nextSubset|
                                                                           (CDR
                                                                            |s|)
                                                                           |n2|
                                                                           $))
                                                                    (QCDR #6#)
                                                                  (|check_union2|
                                                                   (QEQCAR #6#
                                                                           0)
                                                                   (|List|
                                                                    (|NonNegativeInteger|))
                                                                   (|Union|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))
                                                                    "failed")
                                                                   #6#)))
                                                          (LETT |s|
                                                                (CONS 0 |s1|))
                                                          (LETT |weight|
                                                                (SPADCALL |s|
                                                                          (QREFELT
                                                                           $
                                                                           80)))
                                                          (LETT
                                                           |taillookuplist|
                                                           NIL)
                                                          (LETT
                                                           |middlelookuplist|
                                                           (CONS (QREFELT $ 10)
                                                                 (SPADCALL
                                                                  (PROG1
                                                                      (LETT #5#
                                                                            (-
                                                                             |weight|
                                                                             2))
                                                                    (|check_subtype2|
                                                                     (>= #5# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #5#))
                                                                  1
                                                                  (QREFELT $
                                                                           83))))
                                                          (LETT |tailpol| NIL)
                                                          (LETT |middlepol|
                                                                (LIST
                                                                 (CONS
                                                                  (|SPADfirst|
                                                                   |s1|)
                                                                  (|spadConstant|
                                                                   $ 19))))
                                                          (SEQ G190
                                                               (COND
                                                                ((NULL
                                                                  (NULL
                                                                   (NULL
                                                                    (LETT |s1|
                                                                          (CDR
                                                                           |s1|)))))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT
                                                                  |middlepol|
                                                                  (CONS
                                                                   (CONS
                                                                    (|SPADfirst|
                                                                     |s1|)
                                                                    (|spadConstant|
                                                                     $ 13))
                                                                   |middlepol|))))
                                                               NIL (GO G190)
                                                               G191 (EXIT NIL))
                                                          (EXIT
                                                           (LETT |middlepol|
                                                                 (REVERSE
                                                                  |middlepol|))))))))
                                                     NIL (GO G190) G191
                                                     (EXIT NIL))
                                                (LETT |la| (+ |la| 1))
                                                (EXIT
                                                 (LETT |a|
                                                       (SPADCALL
                                                        (PROG1 (LETT #3# |la|)
                                                          (|check_subtype2|
                                                           (> #3# 0)
                                                           '(|PositiveInteger|)
                                                           '(|NonNegativeInteger|)
                                                           #3#))
                                                        (QREFELT $ 85)))))
                                               NIL (GO G190) G191 (EXIT NIL))
                                          (LETT |lc| (+ |lc| 1))
                                          (LETT |c|
                                                (SPADCALL
                                                 (PROG1 (LETT #2# |lc|)
                                                   (|check_subtype2| (> #2# 0)
                                                                     '(|PositiveInteger|)
                                                                     '(|NonNegativeInteger|)
                                                                     #2#))
                                                 (QREFELT $ 85)))
                                          (LETT |la| 1)
                                          (EXIT
                                           (LETT |a|
                                                 (|spadConstant| $ 13))))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (CONS 1 "failed"))))))))))))
          #22# (EXIT #10#)))) 

(SDEFUN |FFPOLY;nextPrimitiveNormalPoly;SupU;15|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPADCALL |f| (QREFELT $ 96))) 

(SDEFUN |FFPOLY;createIrreduciblePoly;PiSup;16|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#1=#:G1023 NIL) (|xn| #2=(|SparseUnivariatePolynomial| GF))
          (|x| #2#))
         (SEQ (LETT |x| (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16)))
              (EXIT
               (COND ((EQL |n| 1) |x|)
                     (#3='T
                      (SEQ
                       (LETT |xn|
                             (SPADCALL (|spadConstant| $ 13) |n|
                                       (QREFELT $ 16)))
                       (EXIT
                        (COND
                         ((>= |n| (QREFELT $ 10))
                          (PROG2
                              (LETT #1#
                                    (SPADCALL
                                     (SPADCALL |xn| |x| (QREFELT $ 32))
                                     (QREFELT $ 87)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 6))
                                            (|Union|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 6))
                                             #4="failed")
                                            #1#)))
                         ((ODDP |n|)
                          (PROG2
                              (LETT #1#
                                    (SPADCALL
                                     (SPADCALL |xn| (|spadConstant| $ 22)
                                               (QREFELT $ 32))
                                     (QREFELT $ 87)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 6))
                                            (|Union|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 6))
                                             #4#)
                                            #1#)))
                         (#3#
                          (PROG2 (LETT #1# (SPADCALL |xn| (QREFELT $ 87)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 6))
                                            (|Union|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 6))
                                             #4#)
                                            #1#)))))))))))) 

(SDEFUN |FFPOLY;createPrimitivePoly;PiSup;17|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#1=#:G1041 NIL) (|weight| (|NonNegativeInteger|))
          (|s| (|List| (|NonNegativeInteger|)))
          (|s1| (|List| (|NonNegativeInteger|))) (#2=#:G1035 NIL)
          (|notReady| (|Boolean|)) (#3=#:G1046 NIL)
          (|pol| (|SparseUnivariatePolynomial| GF))
          (|polRepr|
           (|List|
            #4=(|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF))))
          (|n1| (|NonNegativeInteger|)) (#5=#:G1030 NIL) (|constterm| #4#)
          (|c0| (GF)) (|xn| (|SparseUnivariatePolynomial| GF)))
         (SEQ
          (EXIT
           (SEQ (LETT |xn| (SPADCALL (|spadConstant| $ 13) |n| (QREFELT $ 16)))
                (EXIT
                 (COND
                  ((EQL |n| 1)
                   (SPADCALL |xn|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QREFELT $ 99))
                                        (QREFELT $ 26))
                              0 (QREFELT $ 16))
                             (QREFELT $ 32)))
                  ('T
                   (SEQ
                    (LETT |c0|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26)) |n|
                            (QREFELT $ 100))
                           (SPADCALL (QREFELT $ 99)) (QREFELT $ 90)))
                    (LETT |constterm| (CONS 0 |c0|)) (LETT |s| (LIST 0 1))
                    (LETT |weight| 2) (LETT |s1| (LIST 1))
                    (LETT |n1|
                          (PROG1 (LETT #5# (- |n| 1))
                            (|check_subtype2| (>= #5# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #5#)))
                    (LETT |notReady| 'T)
                    (SEQ G190 (COND ((NULL |notReady|) (GO G191)))
                         (SEQ (LETT |polRepr| (LIST |constterm|))
                              (SEQ G190
                                   (COND ((NULL (NULL (NULL |s1|))) (GO G191)))
                                   (SEQ
                                    (LETT |polRepr|
                                          (CONS
                                           (CONS (|SPADfirst| |s1|)
                                                 (|spadConstant| $ 13))
                                           |polRepr|))
                                    (EXIT (LETT |s1| (CDR |s1|))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |polRepr|
                                    (CONS (CONS |n| (|spadConstant| $ 13))
                                          |polRepr|))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |pol| (|FFPOLY;listToSUP| |polRepr| $))
                                  (QREFELT $ 74))
                                 (PROGN (LETT #3# |pol|) (GO #6=#:G1045)))
                                ((EQL |weight| |n|) (LETT |notReady| NIL))
                                ('T
                                 (SEQ
                                  (LETT |s1|
                                        (PROG2
                                            (LETT #2#
                                                  (|FFPOLY;nextSubset|
                                                   (CDR |s|) |n1| $))
                                            (QCDR #2#)
                                          (|check_union2| (QEQCAR #2# 0)
                                                          (|List|
                                                           (|NonNegativeInteger|))
                                                          (|Union|
                                                           (|List|
                                                            (|NonNegativeInteger|))
                                                           "failed")
                                                          #2#)))
                                  (LETT |s| (CONS 0 |s1|))
                                  (EXIT
                                   (LETT |weight|
                                         (SPADCALL |s| (QREFELT $ 80)))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (PROG2
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL |xn| (SPADCALL |c0| 0 (QREFELT $ 16))
                                          (QREFELT $ 32))
                                (QREFELT $ 91)))
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0)
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT $ 6))
                                       (|Union|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 6))
                                        "failed")
                                       #1#)))))))))
          #6# (EXIT #3#)))) 

(SDEFUN |FFPOLY;createNormalPoly;PiSup;18|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPROG ((#1=#:G1050 NIL) (#2=#:G1048 NIL))
               (COND
                ((EQL |n| 1)
                 (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16))
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26)) 0
                            (QREFELT $ 16))
                           (QREFELT $ 32)))
                ('T
                 (PROG2
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 13) |n|
                                       (QREFELT $ 16))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26))
                              (PROG1 (LETT #2# (- |n| 1))
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              (QREFELT $ 16))
                             (QREFELT $ 32))
                            (QREFELT $ 95)))
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 6))
                                   (|Union|
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 6))
                                    "failed")
                                   #1#)))))) 

(SDEFUN |FFPOLY;createNormalPrimitivePoly;PiSup;19|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#1=#:G1057 NIL) (|pol| (|SparseUnivariatePolynomial| GF))
          (|res| (|Union| (|SparseUnivariatePolynomial| GF) #2="failed"))
          (|constterm| #3=(|SparseUnivariatePolynomial| GF)) (|c0| (GF))
          (|n1| (|NonNegativeInteger|)) (#4=#:G1053 NIL) (|xn| #3#))
         (SEQ (LETT |xn| (SPADCALL (|spadConstant| $ 13) |n| (QREFELT $ 16)))
              (EXIT
               (COND
                ((EQL |n| 1)
                 (SPADCALL |xn|
                           (SPADCALL
                            (SPADCALL (SPADCALL (QREFELT $ 99)) (QREFELT $ 26))
                            0 (QREFELT $ 16))
                           (QREFELT $ 32)))
                (#5='T
                 (SEQ
                  (LETT |n1|
                        (PROG1 (LETT #4# (- |n| 1))
                          (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #4#)))
                  (LETT |c0|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26)) |n|
                          (QREFELT $ 100))
                         (SPADCALL (QREFELT $ 99)) (QREFELT $ 90)))
                  (LETT |constterm| (SPADCALL |c0| 0 (QREFELT $ 16)))
                  (LETT |pol|
                        (SPADCALL
                         (SPADCALL |xn|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 13)
                                              (QREFELT $ 26))
                                    |n1| (QREFELT $ 16))
                                   (QREFELT $ 32))
                         |constterm| (QREFELT $ 32)))
                  (COND
                   ((SPADCALL |pol| (QREFELT $ 78))
                    (COND ((SPADCALL |pol| (QREFELT $ 74)) (EXIT |pol|)))))
                  (LETT |res| (SPADCALL |pol| (QREFELT $ 96)))
                  (EXIT
                   (COND ((QEQCAR |res| 0) (QCDR |res|))
                         (#5#
                          (SEQ
                           (LETT |pol|
                                 (SPADCALL
                                  (SPADCALL |xn|
                                            (SPADCALL (|spadConstant| $ 13)
                                                      |n1| (QREFELT $ 16))
                                            (QREFELT $ 32))
                                  |constterm| (QREFELT $ 32)))
                           (COND
                            ((SPADCALL |pol| (QREFELT $ 78))
                             (COND
                              ((SPADCALL |pol| (QREFELT $ 74)) (EXIT |pol|)))))
                           (EXIT
                            (PROG2 (LETT #1# (SPADCALL |pol| (QREFELT $ 96)))
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 6))
                                              (|Union|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 6))
                                               #2#)
                                              #1#)))))))))))))) 

(SDEFUN |FFPOLY;createPrimitiveNormalPoly;PiSup;20|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPADCALL |n| (QREFELT $ 103))) 

(SDEFUN |FFPOLY;random;PiSup;21|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((|polRepr|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|c| (GF)) (#1=#:G1072 NIL) (|i| NIL) (|n1| (|NonNegativeInteger|))
          (#2=#:G1067 NIL))
         (SEQ (LETT |polRepr| NIL)
              (LETT |n1|
                    (PROG1 (LETT #2# (- |n| 1))
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#)))
              (SEQ (LETT |i| 0) (LETT #1# |n1|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (LETT |c| (SPADCALL (QREFELT $ 105)))
                                 (|spadConstant| $ 19) (QREFELT $ 64))
                       (LETT |polRepr| (CONS (CONS |i| |c|) |polRepr|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (CONS |n| (|spadConstant| $ 13)) |polRepr|))))) 

(SDEFUN |FFPOLY;random;2PiSup;22|
        ((|m| . #1=(|PositiveInteger|)) (|n| . #2=(|PositiveInteger|))
         ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#3=#:G1074 NIL) (|d| (|NonNegativeInteger|)) (#4=#:G1073 NIL)
          (|#G65| #1#) (|#G64| #2#))
         (SEQ
          (COND
           ((> |m| |n|)
            (PROGN
             (LETT |#G64| |n|)
             (LETT |#G65| |m|)
             (LETT |m| |#G64|)
             (LETT |n| |#G65|))))
          (LETT |d|
                (PROG1 (LETT #4# (- |n| |m|))
                  (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #4#)))
          (COND
           ((> |d| 1)
            (LETT |n|
                  (PROG1 (LETT #3# (+ (RANDOM |d|) |m|))
                    (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                      '(|Integer|) #3#)))))
          (EXIT (SPADCALL |n| (QREFELT $ 106)))))) 

(DECLAIM (NOTINLINE |FiniteFieldPolynomialPackage;|)) 

(DEFUN |FiniteFieldPolynomialPackage| (#1=#:G1077)
  (SPROG NIL
         (PROG (#2=#:G1078)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldPolynomialPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FiniteFieldPolynomialPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldPolynomialPackage|)))))))))) 

(DEFUN |FiniteFieldPolynomialPackage;| (|#1|)
  (SPROG ((#1=#:G435 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FiniteFieldPolynomialPackage| DV$1))
          (LETT $ (GETREFV 108))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FiniteFieldPolynomialPackage|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|ModMonic| |#1| (|SparseUnivariatePolynomial| |#1|)))
          (QSETREFV $ 10
                    (PROG1 (LETT #1# (SPADCALL (QREFELT $ 9)))
                      (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                        '(|NonNegativeInteger|) #1#)))
          $))) 

(MAKEPROP '|FiniteFieldPolynomialPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'MM (|NonNegativeInteger|)
              (0 . |size|) '|sizeGF| (|SparseUnivariatePolynomial| 6)
              (4 . |degree|) (9 . |One|) (13 . |One|) (17 . |setPoly|)
              (22 . |monomial|) (28 . |reduce|) (33 . ^) (39 . |Zero|)
              (43 . |Zero|) (47 . |Zero|) (51 . |One|) (55 . *) (61 . |lift|)
              (66 . |coefficient|) (72 . -) (77 . |coerce|) (|Boolean|)
              (82 . ~=) (88 . |leadingCoefficient|) (93 . *) (99 . +)
              (105 . |reductum|) (|PrimitiveArray| 11)
              |FFPOLY;reducedQPowers;SupPa;3| (|Vector| 6) (110 . |vectorise|)
              (|List| 6) (116 . |entries|) (|List| 38) (|Matrix| 6)
              (121 . |matrix|) (126 . |transpose|) (|Integer|)
              (131 . |setelt!|) (139 . |horizConcat|) (|List| 36)
              (145 . |nullSpace|) (150 . |elt|) (156 . |elt|) (162 . =)
              |FFPOLY;leastAffineMultiple;2Sup;4|
              (|IntegerNumberTheoryFunctions|) (168 . |moebiusMu|) (|List| 44)
              (173 . |divisors|) (|PositiveInteger|)
              |FFPOLY;numberOfIrreduciblePoly;2Pi;5| (178 . |eulerPhi|)
              |FFPOLY;numberOfPrimitivePoly;2Pi;6| (183 . |characteristic|)
              (187 . ~=) |FFPOLY;numberOfNormalPoly;2Pi;7| (193 . ~=) (199 . ^)
              (|Factored| $) (205 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 68) (|:| |factor| 44) (|:| |exponent| 8))
              (|List| 69) (|Factored| 44) (210 . |factorList|) (215 . =)
              |FFPOLY;primitive?;SupB;8| (|DistinctDegreeFactorize| 6 11)
              (221 . |irreducible?|) (226 . |rank|) |FFPOLY;normal?;SupB;9|
              (|List| 8) (231 . |#|) (236 . |setfirst!|) (242 . |inv|)
              (247 . |new|) (253 . |lookup|) (258 . |index|)
              (|Union| 11 '#1="failed") |FFPOLY;nextIrreduciblePoly;SupU;11|
              (263 . |primitive?|) (268 . ^) (274 . *)
              |FFPOLY;nextPrimitivePoly;SupU;12|
              (|Record| (|:| |expnt| 8) (|:| |coeff| 6)) (|List| 92)
              (280 . |append|) |FFPOLY;nextNormalPoly;SupU;13|
              |FFPOLY;nextNormalPrimitivePoly;SupU;14|
              |FFPOLY;nextPrimitiveNormalPoly;SupU;15|
              |FFPOLY;createIrreduciblePoly;PiSup;16|
              (286 . |primitiveElement|) (290 . ^)
              |FFPOLY;createPrimitivePoly;PiSup;17|
              |FFPOLY;createNormalPoly;PiSup;18|
              |FFPOLY;createNormalPrimitivePoly;PiSup;19|
              |FFPOLY;createPrimitiveNormalPoly;PiSup;20| (296 . |random|)
              |FFPOLY;random;PiSup;21| |FFPOLY;random;2PiSup;22|)
           '#(|reducedQPowers| 300 |random| 305 |primitive?| 316
              |numberOfPrimitivePoly| 321 |numberOfNormalPoly| 326
              |numberOfIrreduciblePoly| 331 |normal?| 336 |nextPrimitivePoly|
              341 |nextPrimitiveNormalPoly| 346 |nextNormalPrimitivePoly| 351
              |nextNormalPoly| 356 |nextIrreduciblePoly| 361
              |leastAffineMultiple| 366 |createPrimitivePoly| 371
              |createPrimitiveNormalPoly| 376 |createNormalPrimitivePoly| 381
              |createNormalPoly| 386 |createIrreduciblePoly| 391)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|primitive?|
                                 ((|Boolean|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|normal?|
                                 ((|Boolean|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|numberOfIrreduciblePoly|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|numberOfPrimitivePoly|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|numberOfNormalPoly|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|createIrreduciblePoly|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|createPrimitivePoly|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|createNormalPoly|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|createNormalPrimitivePoly|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|createPrimitiveNormalPoly|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|nextIrreduciblePoly|
                                 ((|Union| (|SparseUnivariatePolynomial| |#1|)
                                           #1#)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|nextPrimitivePoly|
                                 ((|Union| (|SparseUnivariatePolynomial| |#1|)
                                           "failed")
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|nextNormalPoly|
                                 ((|Union| (|SparseUnivariatePolynomial| |#1|)
                                           "failed")
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|nextNormalPrimitivePoly|
                                 ((|Union| (|SparseUnivariatePolynomial| |#1|)
                                           "failed")
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|nextPrimitiveNormalPoly|
                                 ((|Union| (|SparseUnivariatePolynomial| |#1|)
                                           "failed")
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|random|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|random|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|leastAffineMultiple|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|reducedQPowers|
                                 ((|PrimitiveArray|
                                   (|SparseUnivariatePolynomial| |#1|))
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 107
                                            '(0 6 8 9 1 11 8 0 12 0 6 0 13 0 7
                                              0 14 1 7 11 11 15 2 11 0 6 8 16 1
                                              7 0 11 17 2 7 0 0 8 18 0 6 0 19 0
                                              7 0 20 0 11 0 21 0 11 0 22 2 7 0
                                              0 0 23 1 7 11 0 24 2 11 6 0 8 25
                                              1 6 0 0 26 1 11 0 6 27 2 11 28 0
                                              0 29 1 11 6 0 30 2 11 0 6 0 31 2
                                              11 0 0 0 32 1 11 0 0 33 2 11 36 0
                                              8 37 1 36 38 0 39 1 41 0 40 42 1
                                              41 0 0 43 4 41 6 0 44 44 6 45 2
                                              41 0 0 0 46 1 41 47 0 48 2 47 36
                                              0 44 49 2 36 6 0 44 50 2 6 28 0 0
                                              51 1 53 44 44 54 1 53 55 44 56 1
                                              53 44 44 59 0 6 8 61 2 8 28 0 0
                                              62 2 6 28 0 0 64 2 7 0 0 57 65 1
                                              44 66 0 67 1 71 70 0 72 2 11 28 0
                                              0 73 1 75 28 11 76 1 41 8 0 77 1
                                              79 8 0 80 2 79 8 0 8 81 1 6 0 0
                                              82 2 79 0 8 8 83 1 6 57 0 84 1 6
                                              0 57 85 1 6 28 0 88 2 6 0 0 8 89
                                              2 6 0 0 0 90 2 93 0 0 0 94 0 6 0
                                              99 2 6 0 0 57 100 0 6 0 105 1 0
                                              34 11 35 1 0 11 57 106 2 0 11 57
                                              57 107 1 0 28 11 74 1 0 57 57 60
                                              1 0 57 57 63 1 0 57 57 58 1 0 28
                                              11 78 1 0 86 11 91 1 0 86 11 97 1
                                              0 86 11 96 1 0 86 11 95 1 0 86 11
                                              87 1 0 11 11 52 1 0 11 57 101 1 0
                                              11 57 104 1 0 11 57 103 1 0 11 57
                                              102 1 0 11 57 98)))))
           '|lookupComplete|)) 
