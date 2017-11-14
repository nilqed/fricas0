
(SDEFUN |LODOF2;convertUPtoUTS|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         ($ |UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|))
        (SPADCALL |np| (QREFELT $ 10))) 

(SDEFUN |LODOF2;convertUTStoUP|
        ((|ns| |UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
         (|n| |Integer|)
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (SPADCALL |ns| (- |n| 1) (QREFELT $ 16))) 

(SDEFUN |LODOF2;convertL3toLL|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|ftmp| #1#)
          (|apf|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#2=#:G799 NIL)
          (|den|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (SEQ (LETT |apf| (|spadConstant| $ 18) . #3=(|LODOF2;convertL3toLL|))
              (LETT |ftmp| |f| . #3#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 22) (QREFELT $ 24)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 26)) . #3#)
                        (LETT |den|
                              (SPADCALL
                               (|LODOF2;convertUPtoUTS|
                                (SPADCALL |lc| (QREFELT $ 27)) $)
                               (QREFELT $ 28))
                              . #3#)
                        (LETT |apf|
                              (SPADCALL |apf|
                                        (SPADCALL
                                         (SPADCALL
                                          (|LODOF2;convertUPtoUTS|
                                           (SPADCALL |lc| (QREFELT $ 29)) $)
                                          (PROG2
                                              (LETT #2#
                                                    (SPADCALL |den|
                                                              (QREFELT $ 31))
                                                    . #3#)
                                              (QCDR #2#)
                                            (|check_union2| (QEQCAR #2# 0)
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|Union|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             "failed")
                                                            #2#))
                                          (QREFELT $ 32))
                                         (SPADCALL |ftmp| (QREFELT $ 33))
                                         (QREFELT $ 34))
                                        (QREFELT $ 35))
                              . #3#)
                        (EXIT
                         (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 36)) . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |apf|)))) 

(SDEFUN |LODOF2;newtonpolygonPoints|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         ($ |List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
        (SPROG
         ((|npg|
           (|List| #2=(|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|ccw| (|Boolean|)) (|sb2| #3=(|Integer|)) (|sb1| #3#) (|p2| #2#)
          (|p1| #2#) (#4=#:G833 NIL) (|i| NIL)
          (|points3|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|points|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|ftmp| #1#) (|yzero| (|Integer|)) (|yv| (|Integer|))
          (|xv| (|NonNegativeInteger|)))
         (SEQ (LETT |ftmp| |f| . #5=(|LODOF2;newtonpolygonPoints|))
              (LETT |points| NIL . #5#)
              (LETT |yzero|
                    (SPADCALL (SPADCALL |ftmp| (QREFELT $ 37)) (QREFELT $ 39))
                    . #5#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                     (GO G191)))
                   (SEQ (LETT |xv| (SPADCALL |ftmp| (QREFELT $ 41)) . #5#)
                        (LETT |yv|
                              (SPADCALL (SPADCALL |ftmp| (QREFELT $ 37))
                                        (SPADCALL (SPADCALL |f| (QREFELT $ 37))
                                                  (QREFELT $ 39))
                                        (QREFELT $ 42))
                              . #5#)
                        (COND
                         ((SPADCALL |xv| 0 (QREFELT $ 43))
                          (LETT |points| (CONS (CONS |xv| |yv|) |points|)
                                . #5#)))
                        (LETT |yzero| (MIN |yzero| |yv|) . #5#)
                        (EXIT
                         (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)) . #5#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |points| (CONS (CONS 0 |yzero|) |points|) . #5#)
              (LETT |npg|
                    (LIST (SPADCALL |points| 2 (QREFELT $ 47))
                          (SPADCALL |points| 1 (QREFELT $ 47)))
                    . #5#)
              (LETT |points3| (CDR (CDR |points|)) . #5#)
              (SEQ (LETT |i| NIL . #5#) (LETT #4# |points3| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ccw| 'T . #5#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((SPADCALL (LENGTH |npg|) 1 (QREFELT $ 48))
                                  |ccw|)
                                 ('T NIL)))
                               (GO G191)))
                             (SEQ
                              (LETT |p1| (SPADCALL |npg| 2 (QREFELT $ 47))
                                    . #5#)
                              (LETT |p2| (SPADCALL |npg| 1 (QREFELT $ 47))
                                    . #5#)
                              (LETT |sb1|
                                    (* (- (QCAR |p2|) (QCAR |p1|))
                                       (- (QCDR |i|) (QCDR |p1|)))
                                    . #5#)
                              (LETT |sb2|
                                    (* (- (QCDR |p2|) (QCDR |p1|))
                                       (- (QCAR |i|) (QCAR |p1|)))
                                    . #5#)
                              (LETT |ccw|
                                    (SPADCALL (- |sb1| |sb2|) 0 (QREFELT $ 49))
                                    . #5#)
                              (EXIT
                               (COND (|ccw| (LETT |npg| (CDR |npg|) . #5#)))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |npg| (CONS |i| |npg|) . #5#)))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |npg|))))) 

(SDEFUN |LODOF2;newtonpolygon|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         ($ |List|
          (|Record|
           (|:| |point| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
           (|:| |slope| (|Fraction| (|Integer|)))
           (|:| |npoly|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|npol| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|lsc| (|Expression| (|Integer|)))
          (|opc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ind| (|NonNegativeInteger|)) (#1=#:G846 NIL) (|j| NIL)
          (|slop| (|Fraction| (|Integer|))) (#2=#:G844 NIL) (|i| NIL)
          (#3=#:G845 NIL) (|nxt| NIL)
          (|restl|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|npg|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))))
         (SEQ
          (LETT |npg| (|LODOF2;newtonpolygonPoints| |f| $)
                . #4=(|LODOF2;newtonpolygon|))
          (LETT |res| NIL . #4#) (LETT |restl| (CDR |npg|) . #4#)
          (SEQ (LETT |nxt| NIL . #4#) (LETT #3# |restl| . #4#)
               (LETT |i| NIL . #4#) (LETT #2# |npg| . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #4#) NIL)
                     (ATOM #3#) (PROGN (LETT |nxt| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |slop|
                      (SPADCALL (- (QCDR |nxt|) (QCDR |i|))
                                (- (QCAR |nxt|) (QCAR |i|)) (QREFELT $ 51))
                      . #4#)
                (LETT |npol| (|spadConstant| $ 52) . #4#)
                (SEQ (LETT |j| 0 . #4#)
                     (LETT #1#
                           (QUOTIENT2 (- (QCAR |nxt|) (QCAR |i|))
                                      (SPADCALL |slop| (QREFELT $ 53)))
                           . #4#)
                     G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ
                      (LETT |ind|
                            (+ (* (SPADCALL |slop| (QREFELT $ 53)) |j|)
                               (QCAR |i|))
                            . #4#)
                      (LETT |opc| (SPADCALL |f| |ind| (QREFELT $ 54)) . #4#)
                      (LETT |lsc|
                            (SPADCALL |opc|
                                      (+
                                       (SPADCALL |j|
                                                 (SPADCALL |slop|
                                                           (QREFELT $ 55))
                                                 (QREFELT $ 56))
                                       (QCDR |i|))
                                      (QREFELT $ 57))
                            . #4#)
                      (EXIT
                       (LETT |npol|
                             (SPADCALL |npol|
                                       (SPADCALL |lsc| |j| (QREFELT $ 58))
                                       (QREFELT $ 59))
                             . #4#)))
                     (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (LETT |res|
                       (SPADCALL |res| (LIST (VECTOR |i| |slop| |npol|))
                                 (QREFELT $ 62))
                       . #4#)))
               (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;testnp;LodoL;6|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |List|
          (|Record|
           (|:| |point| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
           (|:| |slope| (|Fraction| (|Integer|)))
           (|:| |npoly|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (|LODOF2;newtonpolygon| (|LODOF2;convertL3toLL| |f| $) $)) 

(SDEFUN |LODOF2;factor_newton|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |List|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG
         ((|res|
           (|List|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))))
          (#1=#:G884 NIL)
          (|jl|
           (|Record|
            (|:| |Qt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |Rt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (#2=#:G897 NIL) (|i| NIL) (|slo| #3=(|Fraction| (|Integer|)))
          (|v|
           #4=(|List|
               (|Record|
                (|:| |factor|
                     (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
                (|:| |exponent| (|Integer|)))))
          (#5=#:G896 NIL) (#6=#:G895 NIL) (|v_old| #4#)
          (|unsafe|
           (|List|
            (|Record|
             (|:| |factor|
                  #7=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|Integer|)))))
          (|sbt| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|newx| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|ie| (|Integer|)) (|e| (|Expression| (|Integer|)))
          (|d| (|NonNegativeInteger|)) (|vjf| #7#) (#8=#:G893 NIL) (|j| NIL)
          (#9=#:G894 NIL) (|jj| NIL) (|dvif| (|NonNegativeInteger|))
          (|vif| #7#) (#10=#:G890 NIL) (#11=#:G891 NIL) (|ii| NIL)
          (#12=#:G892 NIL) (|restl| NIL) (#13=#:G888 NIL) (#14=#:G889 NIL)
          (|semi|
           (|OneDimensionalArray|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#15=#:G887 NIL) (|il| NIL) (#16=#:G886 NIL)
          (|npol|
           #17=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#18=#:G885 NIL) (|k| NIL)
          (|np|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| #3#) (|:| |npoly| #17#)))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 41)) 1 (QREFELT $ 49))
              (PROGN
               (LETT #1# (LIST |f|) . #19=(|LODOF2;factor_newton|))
               (GO #20=#:G883))))
            (LETT |np| (|LODOF2;newtonpolygon| |f| $) . #19#)
            (LETT |res| NIL . #19#)
            (SEQ (LETT |k| NIL . #19#) (LETT #18# |np| . #19#) G190
                 (COND
                  ((OR (ATOM #18#) (PROGN (LETT |k| (CAR #18#) . #19#) NIL))
                   (GO G191)))
                 (SEQ (LETT |npol| (QVELT |k| 2) . #19#)
                      (LETT |v|
                            (SPADCALL (|LODOF2;factorUP| |npol| |factorizer| $)
                                      (QREFELT $ 67))
                            . #19#)
                      (COND
                       ((SPADCALL (QVELT |k| 1) (|spadConstant| $ 68)
                                  (QREFELT $ 69))
                        (LETT |v|
                              (PROGN
                               (LETT #16# NIL . #19#)
                               (SEQ (LETT |il| NIL . #19#)
                                    (LETT #15# |v| . #19#) G190
                                    (COND
                                     ((OR (ATOM #15#)
                                          (PROGN
                                           (LETT |il| (CAR #15#) . #19#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #16#
                                            (CONS
                                             (CONS
                                              (SPADCALL (QCAR |il|) (QCDR |il|)
                                                        (QREFELT $ 70))
                                              0)
                                             #16#)
                                            . #19#)))
                                    (LETT #15# (CDR #15#) . #19#) (GO G190)
                                    G191 (EXIT (NREVERSE #16#))))
                              . #19#))
                       ('T
                        (SEQ (LETT |unsafe| NIL . #19#)
                             (LETT |semi|
                                   (MAKEARR1 (LENGTH |v|)
                                             (|spadConstant| $ 52))
                                   . #19#)
                             (SEQ (LETT |ii| 1 . #19#)
                                  (LETT #14# (LENGTH |v|) . #19#)
                                  (LETT |i| NIL . #19#) (LETT #13# |v| . #19#)
                                  G190
                                  (COND
                                   ((OR (ATOM #13#)
                                        (PROGN
                                         (LETT |i| (CAR #13#) . #19#)
                                         NIL)
                                        (|greater_SI| |ii| #14#))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |semi| |ii|
                                              (SPADCALL (QCAR |i|) (QCDR |i|)
                                                        (QREFELT $ 70))
                                              (QREFELT $ 72))))
                                  (LETT #13#
                                        (PROG1 (CDR #13#)
                                          (LETT |ii| (|inc_SI| |ii|) . #19#))
                                        . #19#)
                                  (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |restl| NIL . #19#)
                                  (LETT #12#
                                        (SPADCALL (CDR |v|) (QREFELT $ 74))
                                        . #19#)
                                  (LETT |ii| 1 . #19#)
                                  (LETT #11# (LENGTH |v|) . #19#)
                                  (LETT |i| NIL . #19#) (LETT #10# |v| . #19#)
                                  G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN
                                         (LETT |i| (CAR #10#) . #19#)
                                         NIL)
                                        (|greater_SI| |ii| #11#) (ATOM #12#)
                                        (PROGN
                                         (LETT |restl| (CAR #12#) . #19#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ (LETT |vif| (QCAR |i|) . #19#)
                                       (LETT |dvif|
                                             (SPADCALL |vif| (QREFELT $ 75))
                                             . #19#)
                                       (EXIT
                                        (SEQ (LETT |jj| (+ |ii| 1) . #19#)
                                             (LETT #9# (LENGTH |v|) . #19#)
                                             (LETT |j| NIL . #19#)
                                             (LETT #8# |restl| . #19#) G190
                                             (COND
                                              ((OR (ATOM #8#)
                                                   (PROGN
                                                    (LETT |j| (CAR #8#) . #19#)
                                                    NIL)
                                                   (> |jj| #9#))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |vjf| (QCAR |j|) . #19#)
                                              (EXIT
                                               (COND
                                                ((EQL |dvif|
                                                      (SPADCALL |vjf|
                                                                (QREFELT $
                                                                         75)))
                                                 (SEQ
                                                  (LETT |d| (- |dvif| 1)
                                                        . #19#)
                                                  (LETT |e|
                                                        (SPADCALL
                                                         (SPADCALL |vif| |d|
                                                                   (QREFELT $
                                                                            76))
                                                         (SPADCALL |vjf| |d|
                                                                   (QREFELT $
                                                                            76))
                                                         (QREFELT $ 77))
                                                        . #19#)
                                                  (LETT |e|
                                                        (SPADCALL |e|
                                                                  (SPADCALL
                                                                   |dvif|
                                                                   (QREFELT $
                                                                            78))
                                                                  (QREFELT $
                                                                           79))
                                                        . #19#)
                                                  (EXIT
                                                   (COND
                                                    ((SPADCALL |e|
                                                               (QREFELT $ 81))
                                                     (COND
                                                      ((SPADCALL |e|
                                                                 (|spadConstant|
                                                                  $ 19)
                                                                 (QREFELT $
                                                                          82))
                                                       (SEQ
                                                        (LETT |ie|
                                                              (SPADCALL |e|
                                                                        (QREFELT
                                                                         $ 83))
                                                              . #19#)
                                                        (LETT |newx|
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (|spadConstant|
                                                                 $ 12)
                                                                1
                                                                (QREFELT $ 58))
                                                               (SPADCALL |ie|
                                                                         (QREFELT
                                                                          $
                                                                          84))
                                                               (QREFELT $ 59))
                                                              . #19#)
                                                        (LETT |sbt|
                                                              (SPADCALL |vjf|
                                                                        (SPADCALL
                                                                         (|spadConstant|
                                                                          $ 12)
                                                                         1
                                                                         (QREFELT
                                                                          $
                                                                          58))
                                                                        |newx|
                                                                        (QREFELT
                                                                         $ 85))
                                                              . #19#)
                                                        (EXIT
                                                         (COND
                                                          ((SPADCALL
                                                            (SPADCALL |vif|
                                                                      |sbt|
                                                                      (QREFELT
                                                                       $ 86))
                                                            (|spadConstant| $
                                                                            52)
                                                            (QREFELT $ 87))
                                                           (COND
                                                            ((SPADCALL |ie| 0
                                                                       (QREFELT
                                                                        $ 88))
                                                             (SEQ
                                                              (LETT |unsafe|
                                                                    (CONS |i|
                                                                          |unsafe|)
                                                                    . #19#)
                                                              (EXIT
                                                               (SPADCALL |semi|
                                                                         |jj|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |semi|
                                                                           |jj|
                                                                           (QREFELT
                                                                            $
                                                                            89))
                                                                          (SPADCALL
                                                                           |vif|
                                                                           (QCDR
                                                                            |i|)
                                                                           (QREFELT
                                                                            $
                                                                            70))
                                                                          (QREFELT
                                                                           $
                                                                           90))
                                                                         (QREFELT
                                                                          $
                                                                          72)))))
                                                            ('T
                                                             (SEQ
                                                              (LETT |unsafe|
                                                                    (CONS |j|
                                                                          |unsafe|)
                                                                    . #19#)
                                                              (EXIT
                                                               (SPADCALL |semi|
                                                                         |ii|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |semi|
                                                                           |ii|
                                                                           (QREFELT
                                                                            $
                                                                            89))
                                                                          (SPADCALL
                                                                           |vjf|
                                                                           (QCDR
                                                                            |j|)
                                                                           (QREFELT
                                                                            $
                                                                            70))
                                                                          (QREFELT
                                                                           $
                                                                           90))
                                                                         (QREFELT
                                                                          $
                                                                          72))))))))))))))))))))
                                             (LETT #8#
                                                   (PROG1 (CDR #8#)
                                                     (LETT |jj| (+ |jj| 1)
                                                           . #19#))
                                                   . #19#)
                                             (GO G190) G191 (EXIT NIL))))
                                  (LETT #10#
                                        (PROG1 (CDR #10#)
                                          (LETT |ii|
                                                (PROG1 (|inc_SI| |ii|)
                                                  (LETT #12# (CDR #12#)
                                                        . #19#))
                                                . #19#))
                                        . #19#)
                                  (GO G190) G191 (EXIT NIL))
                             (LETT |v_old| |v| . #19#)
                             (LETT |v| (SPADCALL |v| |unsafe| (QREFELT $ 91))
                                   . #19#)
                             (EXIT
                              (COND
                               ((EQUAL |option| "semireg")
                                (LETT |v|
                                      (PROGN
                                       (LETT #6# NIL . #19#)
                                       (SEQ (LETT |i| NIL . #19#)
                                            (LETT #5# |v| . #19#) G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |i| (CAR #5#) . #19#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (CONS
                                                      (SPADCALL |semi|
                                                                (SPADCALL |i|
                                                                          |v_old|
                                                                          (QREFELT
                                                                           $
                                                                           92))
                                                                (QREFELT $ 89))
                                                      1)
                                                     #6#)
                                                    . #19#)))
                                            (LETT #5# (CDR #5#) . #19#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #6#))))
                                      . #19#)))))))
                      (LETT |slo| (QVELT |k| 1) . #19#)
                      (COND
                       ((EQL
                         (SPADCALL
                          (SPADCALL (QCAR (SPADCALL |v| 1 (QREFELT $ 93)))
                                    (QREFELT $ 75))
                          (SPADCALL |slo| (QREFELT $ 53)) (QREFELT $ 56))
                         (SPADCALL |f| (QREFELT $ 41)))
                        (PROGN (LETT #1# (LIST |f|) . #19#) (GO #20#))))
                      (EXIT
                       (SEQ (LETT |i| NIL . #19#) (LETT #2# |v| . #19#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |i| (CAR #2#) . #19#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |jl|
                                   (|LODOF2;factor_newton2| |f| (QCAR |i|) |k|
                                    $)
                                   . #19#)
                             (COND
                              ((EQUAL |option| "alg factor")
                               (PROGN
                                (LETT #1# (LIST (QCDR |jl|)) . #19#)
                                (GO #20#)))
                              ((EQUAL |option| "split over k((x))")
                               (PROGN
                                (LETT #1#
                                      (SPADCALL
                                       (|LODOF2;factor_newton| (QCAR |jl|)
                                        |factorizer| |option| $)
                                       (LIST (QCDR |jl|)) (QREFELT $ 95))
                                      . #19#)
                                (GO #20#))))
                             (EXIT
                              (LETT |res|
                                    (SPADCALL |res| (LIST (QCDR |jl|))
                                              (QREFELT $ 95))
                                    . #19#)))
                            (LETT #2# (CDR #2#) . #19#) (GO G190) G191
                            (EXIT NIL))))
                 (LETT #18# (CDR #18#) . #19#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #20# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfn;LodoMSL;8|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |List|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (|LODOF2;factor_newton| (|LODOF2;convertL3toLL| |f| $) |factorizer|
         |option| $)) 

(SDEFUN |LODOF2;factorUP|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|factorSUP| |Mapping|
          #1=(|Factored|
              (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |Factored|
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
        (SPROG
         ((|fsnp| #1#)
          (|snp| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (SEQ
          (LETT |snp| (SPADCALL |np| (QREFELT $ 100)) . #2=(|LODOF2;factorUP|))
          (LETT |fsnp| (SPADCALL |snp| |factorSUP|) . #2#)
          (EXIT (SPADCALL (ELT $ 101) |fsnp| (QREFELT $ 105)))))) 

(SDEFUN |LODOF2;factor_newton2|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|r| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|l| |Record|
          (|:| |point| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
          (|:| |slope| #1=(|Fraction| (|Integer|)))
          (|:| |npoly|
               #2=(|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |Record|
          (|:| |Qt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |Rt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|right|
           #3=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)))
          (|left| #3#)
          (|llr|
           (|Record|
            (|:| |laurl|
                 (|List|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |laurr|
                 (|List|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|lcr|
           (|Record|
            (|:| |llc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))
            (|:| |rlc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))))
          (|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))))
          (|ordl| (|Integer|)) (|ordr| (|Integer|))
          (|npor| #4=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|npo| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|mlr| #4#) (|shift| (|Fraction| (|Integer|))) (|npol| #2#)
          (|xcd| (|Integer|)) (|ycd| (|Integer|)) (|slop| #1#))
         (SEQ (LETT |slop| (QVELT |l| 1) . #5=(|LODOF2;factor_newton2|))
              (LETT |ycd| (QCDR (QVELT |l| 0)) . #5#)
              (LETT |xcd| (QCAR (QVELT |l| 0)) . #5#)
              (LETT |npol| (QVELT |l| 2) . #5#)
              (LETT |shift|
                    (SPADCALL (|spadConstant| $ 68)
                              (SPADCALL (SPADCALL |ycd| (QREFELT $ 106))
                                        (SPADCALL
                                         (- (SPADCALL |f| (QREFELT $ 41))
                                            |xcd|)
                                         |slop| (QREFELT $ 107))
                                        (QREFELT $ 108))
                              (QREFELT $ 109))
                    . #5#)
              (LETT |npo| (SPADCALL (|spadConstant| $ 12) |xcd| (QREFELT $ 58))
                    . #5#)
              (LETT |mlr|
                    (SPADCALL (SPADCALL |npol| |r| (QREFELT $ 110))
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL (|spadConstant| $ 12)
                                        (SPADCALL |slop| (QREFELT $ 53))
                                        (QREFELT $ 58))
                              (QREFELT $ 85))
                    . #5#)
              (LETT |npo| (SPADCALL |npo| |mlr| (QREFELT $ 90)) . #5#)
              (LETT |npor|
                    (SPADCALL |r|
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL (|spadConstant| $ 12)
                                        (SPADCALL |slop| (QREFELT $ 53))
                                        (QREFELT $ 58))
                              (QREFELT $ 85))
                    . #5#)
              (LETT |ordr|
                    (SPADCALL (SPADCALL |r| (QREFELT $ 75))
                              (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 56))
                    . #5#)
              (LETT |ordl| (- (SPADCALL |f| (QREFELT $ 41)) |ordr|) . #5#)
              (LETT |lwr|
                    (|LODOF2;ln_wrapper| |slop| |f| |npo| |npor| |shift| |ordr|
                     $)
                    . #5#)
              (LETT |lcr|
                    (|LODOF2;listream_coefs| |lwr| |ordl| |ordr| |shift| |slop|
                     $)
                    . #5#)
              (LETT |llr| (|LODOF2;list_laurent| |lcr| |ordl| |ordr| $) . #5#)
              (LETT |left| (|LODOF2;laurent_op| (QCAR |llr|) |ordl| $) . #5#)
              (LETT |right| (|LODOF2;laurent_op| (QCDR |llr|) |ordr| $) . #5#)
              (EXIT (CONS |left| |right|))))) 

(SDEFUN |LODOF2;testf2;LodoUpFR;11|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|r| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|slop| |Fraction| (|Integer|))
         ($ |Record|
          (|:| |Qt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |Rt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|l|
           #1=(|Record|
               (|:| |point|
                    (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
               (|:| |slope| (|Fraction| (|Integer|)))
               (|:| |npoly|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (#2=#:G916 NIL) (|i| NIL) (|np| (|List| #1#)))
         (SEQ
          (LETT |np| (|LODOF2;newtonpolygon| (|LODOF2;convertL3toLL| |f| $) $)
                . #3=(|LODOF2;testf2;LodoUpFR;11|))
          (SEQ (LETT |i| NIL . #3#) (LETT #2# |np| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QVELT |i| 1) |slop| (QREFELT $ 111))
                   (LETT |l| |i| . #3#)))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (|LODOF2;factor_newton2| (|LODOF2;convertL3toLL| |f| $) |r| |l|
            $))))) 

(SDEFUN |LODOF2;laurent_op|
        ((|llaur| |List|
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|dgf| |Integer|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|f|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#1=#:G920 NIL) (|i| NIL))
         (SEQ (LETT |f| (|spadConstant| $ 18) . #2=(|LODOF2;laurent_op|))
              (SEQ (LETT |i| 0 . #2#) (LETT #1# |dgf| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |f|
                           (SPADCALL |f|
                                     (SPADCALL
                                      (SPADCALL |llaur| (+ |i| 1)
                                                (QREFELT $ 115))
                                      |i| (QREFELT $ 34))
                                     (QREFELT $ 35))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |f|)))) 

(SDEFUN |LODOF2;list_laurent|
        ((|lsc| |Record|
          (|:| |llc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))
          (|:| |rlc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|))))))))
         (|dgl| |Integer|) (|dgr| |Integer|)
         ($ |Record|
          (|:| |laurl|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |laurr|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|laurer|
           #1=(|List|
               (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)))
          (|laurel| #1#))
         (SEQ
          (LETT |laurel| (|LODOF2;list_laurentop| (QCAR |lsc|) |dgl| $)
                . #2=(|LODOF2;list_laurent|))
          (LETT |laurer| (|LODOF2;list_laurentop| (QCDR |lsc|) |dgr| $) . #2#)
          (EXIT (CONS |laurel| |laurer|))))) 

(SDEFUN |LODOF2;testll;FLodo2UpFIR;14|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Record|
          (|:| |laurl|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |laurr|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|lcr|
           (|Record|
            (|:| |llc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))
            (|:| |rlc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))))
          (|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))))))
         (SEQ
          (LETT |lwr|
                (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| $)
                 |l_low| |r_low| |shift| |dgr| $)
                . #1=(|LODOF2;testll;FLodo2UpFIR;14|))
          (LETT |lcr|
                (|LODOF2;listream_coefs| |lwr|
                 (- (SPADCALL |f| (QREFELT $ 33)) |dgr|) |dgr| |shift| |slop|
                 $)
                . #1#)
          (EXIT
           (|LODOF2;list_laurent| |lcr| (- (SPADCALL |f| (QREFELT $ 33)) |dgr|)
            |dgr| $))))) 

(SDEFUN |LODOF2;list_laurentop|
        ((|lsc| |List|
          (|Stream|
           (|Record| (|:| |k| (|Integer|))
                     (|:| |c| (|Expression| (|Integer|))))))
         (|dgf| |Integer|)
         ($ |List|
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|res|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#1=#:G934 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL . #2=(|LODOF2;list_laurentop|))
              (SEQ (LETT |i| 0 . #2#) (LETT #1# |dgf| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (LIST
                                      (SPADCALL
                                       (SPADCALL |lsc| (+ |i| 1)
                                                 (QREFELT $ 121))
                                       (QREFELT $ 122)))
                                     (QREFELT $ 123))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;listream_coefs|
        ((|slr| |Stream|
          (|Record|
           (|:| |Qt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |Rt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))))
         (|dgl| |Integer|) (|dgr| |Integer|) (|shift| |Fraction| (|Integer|))
         (|slop| |Fraction| (|Integer|))
         ($ |Record|
          (|:| |llc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))
          (|:| |rlc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))))
        (SPROG
         ((|rsc|
           #1=(|List|
               (|Stream|
                (|Record| (|:| |k| (|Integer|))
                          (|:| |c| (|Expression| (|Integer|)))))))
          (|re| (|Integer|))
          (|sre|
           #2=(|Stream|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|))))
          (|lsc| #1#) (|le| (|Integer|)) (|sle| #2#))
         (SEQ
          (LETT |sle|
                (SPADCALL (LIST #'|LODOF2;listream_coefs!0|) |slr|
                          (QREFELT $ 128))
                . #3=(|LODOF2;listream_coefs|))
          (LETT |le|
                (SPADCALL
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 53)) |shift|
                           (QREFELT $ 107))
                 (QREFELT $ 129))
                . #3#)
          (LETT |le| (- |le| (* (SPADCALL |slop| (QREFELT $ 55)) |dgl|)) . #3#)
          (LETT |lsc| (|LODOF2;listream_coefsop| |sle| |dgl| |le| |slop| $)
                . #3#)
          (LETT |sre|
                (SPADCALL (LIST #'|LODOF2;listream_coefs!1|) |slr|
                          (QREFELT $ 128))
                . #3#)
          (LETT |re| (- (* (SPADCALL |slop| (QREFELT $ 55)) |dgr|)) . #3#)
          (LETT |rsc| (|LODOF2;listream_coefsop| |sre| |dgr| |re| |slop| $)
                . #3#)
          (EXIT (CONS |lsc| |rsc|))))) 

(SDEFUN |LODOF2;listream_coefs!1| ((|landr| NIL) ($$ NIL)) (QCDR |landr|)) 

(SDEFUN |LODOF2;listream_coefs!0| ((|landr| NIL) ($$ NIL)) (QCAR |landr|)) 

(SDEFUN |LODOF2;testlc;FLodo2UpFIR;17|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Record|
          (|:| |llc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))
          (|:| |rlc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))))
        (SPROG
         ((|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))))))
         (SEQ
          (LETT |lwr|
                (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| $)
                 |l_low| |r_low| |shift| |dgr| $)
                |LODOF2;testlc;FLodo2UpFIR;17|)
          (EXIT
           (|LODOF2;listream_coefs| |lwr|
            (- (SPADCALL |f| (QREFELT $ 33)) |dgr|) |dgr| |shift| |slop| $))))) 

(SDEFUN |LODOF2;listream_coefsop|
        ((|sfe| |Stream|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|dgf| |Integer|) (|fe| |Integer|) (|slop| |Fraction| (|Integer|))
         ($ |List|
          (|Stream|
           (|Record| (|:| |k| (|Integer|))
                     (|:| |c| (|Expression| (|Integer|)))))))
        (SPROG
         ((|dgc|
           (|List|
            (|Stream|
             (|Record| (|:| |k| (|Integer|))
                       (|:| |c| (|Expression| (|Integer|)))))))
          (|res|
           (|List|
            (|Stream|
             (|Record| (|:| |k| (|Integer|))
                       (|:| |c| (|Expression| (|Integer|)))))))
          (|new_term|
           (|Stream|
            (|Record| (|:| |k| (|Integer|))
                      (|:| |c| (|Expression| (|Integer|))))))
          (|nl_st| (|Stream| (|Integer|))) (#1=#:G969 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL . #2=(|LODOF2;listream_coefsop|))
              (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |dgf| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |nl_st|
                          (SPADCALL (CONS #'|LODOF2;listream_coefsop!0| $) 1
                                    (QREFELT $ 137))
                          . #2#)
                    (LETT |new_term|
                          (SPADCALL
                           (CONS #'|LODOF2;listream_coefsop!1|
                                 (VECTOR |i| |fe| |slop| $))
                           |sfe| |nl_st| (QREFELT $ 145))
                          . #2#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res| (LIST |new_term|) (QREFELT $ 146))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |dgc|
                    (LIST
                     (SPADCALL (LIST (CONS 0 (|spadConstant| $ 12)))
                               (QREFELT $ 148)))
                    . #2#)
              (EXIT (SPADCALL |res| |dgc| (QREFELT $ 146)))))) 

(SDEFUN |LODOF2;listream_coefsop!1| ((|x| NIL) (|n_l| NIL) ($$ NIL))
        (PROG ($ |slop| |fe| |i|)
          (LETT $ (QREFELT $$ 3) . #1=(|LODOF2;listream_coefsop|))
          (LETT |slop| (QREFELT $$ 2) . #1#)
          (LETT |fe| (QREFELT $$ 1) . #1#)
          (LETT |i| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((#2=#:G958 NIL) (|coefd| NIL) (|cx| NIL) (|deg| NIL)
              (|degn| NIL))
             (SEQ
              (LETT |degn|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL |n_l| (|spadConstant| $ 133) (QREFELT $ 138))
                       (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 139))
                      |fe| (QREFELT $ 134))
                     (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 55))
                               (QREFELT $ 56))
                     (QREFELT $ 134))
                    NIL)
              (LETT |deg|
                    (SPADCALL
                     (SPADCALL |degn| (SPADCALL |slop| (QREFELT $ 53))
                               (QREFELT $ 51))
                     (QREFELT $ 141))
                    NIL)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |deg| (CONS 1 "failed") (QREFELT $ 142)))
                     (GO G191)))
                   (SEQ
                    (LETT |degn|
                          (SPADCALL |degn| (|spadConstant| $ 133)
                                    (QREFELT $ 134))
                          NIL)
                    (EXIT
                     (LETT |deg|
                           (SPADCALL
                            (SPADCALL |degn| (SPADCALL |slop| (QREFELT $ 53))
                                      (QREFELT $ 51))
                            (QREFELT $ 141))
                           NIL)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |cx| (SPADCALL |x| |i| (QREFELT $ 54)) NIL)
              (LETT |coefd|
                    (SPADCALL |cx|
                              (PROG2 (LETT #2# |deg| NIL)
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                                (|Union| (|Integer|)
                                                         #3="failed")
                                                #2#))
                              (QREFELT $ 57))
                    NIL)
              (EXIT
               (CONS
                (PROG2 (LETT #2# |deg| NIL)
                    (QCDR #2#)
                  (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                  (|Union| (|Integer|) #3#) #2#))
                |coefd|)))))))) 

(SDEFUN |LODOF2;listream_coefsop!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 133) (QREFELT $ 134))) 

(SDEFUN |LODOF2;lift_newton|
        ((|slop| |Fraction| (|Integer|))
         (|ff| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         (|v| |Record|
          (|:| |Qt|
               #1=(|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
          (|:| |Rt|
               #2=(|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))
         (|ei| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|n_l| |PositiveInteger|)
         ($ |Record|
          (|:| |main|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |nf|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |error|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|ri| #2#) (|li| #1#)
          (|r_extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|l_extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|pl_extra|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|pr_extra|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|pi| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#3=#:G988 NIL) (|i| #4=(|Integer|)) (|fe| #5=(|Integer|))
          (|re| (|Integer|)) (|le| #5#)
          (|c2| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|c1| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|s|
           (|Record|
            (|:| |coef1|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |coef2|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#6=#:G979 NIL)
          (|sl_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|dgl| #4#))
         (SEQ
          (LETT |dgl| (- (SPADCALL |ff| (QREFELT $ 41)) |dgr|)
                . #7=(|LODOF2;lift_newton|))
          (LETT |li| (QCAR |v|) . #7#) (LETT |ri| (QCDR |v|) . #7#)
          (COND
           ((SPADCALL |slop| (|spadConstant| $ 68) (QREFELT $ 111))
            (SEQ (LETT |i| (- |n_l| 1) . #7#)
                 (COND
                  ((EQL |i| 0)
                   (SEQ (LETT |r_extra| (|LODOF2;plug_delta| |r_low| $) . #7#)
                        (EXIT
                         (LETT |l_extra|
                               (SPADCALL (|LODOF2;plug_delta| |l_low| $)
                                         (SPADCALL (|spadConstant| $ 12)
                                                   (SPADCALL |shift|
                                                             (QREFELT $ 129))
                                                   (QREFELT $ 149))
                                         (QREFELT $ 150))
                               . #7#))))
                  (#8='T
                   (SEQ
                    (LETT |sl_low|
                          (SPADCALL |l_low|
                                    (SPADCALL (|spadConstant| $ 12) 1
                                              (QREFELT $ 58))
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 12) 1
                                               (QREFELT $ 58))
                                     (SPADCALL |i| (QREFELT $ 84))
                                     (QREFELT $ 59))
                                    (QREFELT $ 85))
                          . #7#)
                    (LETT |s| (SPADCALL |r_low| |sl_low| (QREFELT $ 152))
                          . #7#)
                    (COND
                     ((SPADCALL (QVELT |s| 2) (|spadConstant| $ 153)
                                (QREFELT $ 154))
                      (|error| "unsafe factor")))
                    (LETT |c1| (QVELT |s| 0) . #7#)
                    (LETT |c2| (QVELT |s| 1) . #7#)
                    (LETT |pi|
                          (|LODOF2;coeffx| |ei|
                           (SPADCALL (SPADCALL |i| (QREFELT $ 106)) |shift|
                                     (QREFELT $ 108))
                           $)
                          . #7#)
                    (LETT |pr_extra|
                          (SPADCALL
                           (SPADCALL (SPADCALL |c2| |pi| (QREFELT $ 90))
                                     |r_low| (QREFELT $ 155))
                           (QREFELT $ 156))
                          . #7#)
                    (LETT |r_extra| (|LODOF2;plug_delta| |pr_extra| $) . #7#)
                    (LETT |pl_extra|
                          (SPADCALL
                           (SPADCALL |pi|
                                     (SPADCALL |pr_extra| |sl_low|
                                               (QREFELT $ 90))
                                     (QREFELT $ 59))
                           |r_low| (QREFELT $ 110))
                          . #7#)
                    (LETT |l_extra| (|LODOF2;plug_delta| |pl_extra| $) . #7#)
                    (LETT |l_extra|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12)
                                      (+ |i|
                                         (SPADCALL |shift| (QREFELT $ 129)))
                                      (QREFELT $ 149))
                            |l_extra| (QREFELT $ 160))
                           (QREFELT $ 161))
                          . #7#)
                    (EXIT
                     (LETT |r_extra|
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) |i|
                                      (QREFELT $ 149))
                            |r_extra| (QREFELT $ 160))
                           . #7#)))))
                 (LETT |li| (SPADCALL |li| |l_extra| (QREFELT $ 35)) . #7#)
                 (LETT |ei|
                       (SPADCALL
                        (SPADCALL |ei|
                                  (SPADCALL |l_extra| |ri| (QREFELT $ 162))
                                  (QREFELT $ 35))
                        (SPADCALL |li| |r_extra| (QREFELT $ 162))
                        (QREFELT $ 35))
                       . #7#)
                 (EXIT
                  (LETT |ri| (SPADCALL |ri| |r_extra| (QREFELT $ 35)) . #7#))))
           (#8#
            (SEQ
             (LETT |s|
                   (PROG2
                       (LETT #6#
                             (SPADCALL |r_low| |l_low| (|spadConstant| $ 153)
                                       (QREFELT $ 165))
                             . #7#)
                       (QCDR #6#)
                     (|check_union2| (QEQCAR #6# 0)
                                     (|Record|
                                      (|:| |coef1|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))
                                      (|:| |coef2|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|)))))
                                     (|Union|
                                      (|Record|
                                       (|:| |coef1|
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|))))
                                       (|:| |coef2|
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|)))))
                                      "failed")
                                     #6#))
                   . #7#)
             (LETT |c1| (QCAR |s|) . #7#) (LETT |c2| (QCDR |s|) . #7#)
             (LETT |le|
                   (SPADCALL
                    (SPADCALL (SPADCALL |slop| (QREFELT $ 53)) |shift|
                              (QREFELT $ 107))
                    (QREFELT $ 129))
                   . #7#)
             (LETT |le| (- |le| (* (SPADCALL |slop| (QREFELT $ 55)) |dgl|))
                   . #7#)
             (LETT |re| (- (* (SPADCALL |slop| (QREFELT $ 55)) |dgr|)) . #7#)
             (LETT |fe|
                   (SPADCALL
                    (SPADCALL (SPADCALL |slop| (QREFELT $ 53)) |shift|
                              (QREFELT $ 107))
                    (QREFELT $ 129))
                   . #7#)
             (LETT |fe|
                   (- |fe|
                      (* (SPADCALL |slop| (QREFELT $ 55))
                         (SPADCALL |ff| (QREFELT $ 41))))
                   . #7#)
             (EXIT
              (SEQ
               (LETT |i| (* (- |n_l| 1) (SPADCALL |slop| (QREFELT $ 53)))
                     . #7#)
               (LETT #3#
                     (-
                      (SPADCALL |n_l| (SPADCALL |slop| (QREFELT $ 53))
                                (QREFELT $ 167))
                      1)
                     . #7#)
               G190 (COND ((> |i| #3#) (GO G191)))
               (SEQ
                (COND
                 ((EQL |i| 0)
                  (SEQ
                   (LETT |r_extra|
                         (|LODOF2;coefs_operator| |r_low| |slop| |re| $) . #7#)
                   (EXIT
                    (LETT |l_extra|
                          (|LODOF2;coefs_operator| |l_low| |slop| |le| $)
                          . #7#))))
                 ('T
                  (SEQ
                   (LETT |pi| (|LODOF2;coefs_poly| |ei| |slop| (+ |i| |fe|) $)
                         . #7#)
                   (LETT |pr_extra|
                         (SPADCALL (SPADCALL |c2| |pi| (QREFELT $ 90)) |r_low|
                                   (QREFELT $ 155))
                         . #7#)
                   (LETT |pl_extra|
                         (SPADCALL |pi|
                                   (SPADCALL |pr_extra| |l_low| (QREFELT $ 90))
                                   (QREFELT $ 86))
                         . #7#)
                   (LETT |pl_extra|
                         (SPADCALL
                          (SPADCALL |pl_extra| |r_low| (QREFELT $ 110))
                          (QREFELT $ 156))
                         . #7#)
                   (LETT |l_extra|
                         (|LODOF2;coefs_operator| |pl_extra| |slop|
                          (+ |i| |le|) $)
                         . #7#)
                   (EXIT
                    (LETT |r_extra|
                          (|LODOF2;coefs_operator|
                           (SPADCALL |pr_extra| (QREFELT $ 156)) |slop|
                           (+ |i| |re|) $)
                          . #7#)))))
                (LETT |li| (SPADCALL |li| |l_extra| (QREFELT $ 35)) . #7#)
                (LETT |ei|
                      (SPADCALL
                       (SPADCALL |ei| (SPADCALL |l_extra| |ri| (QREFELT $ 162))
                                 (QREFELT $ 35))
                       (SPADCALL |li| |r_extra| (QREFELT $ 162))
                       (QREFELT $ 35))
                      . #7#)
                (EXIT
                 (LETT |ri| (SPADCALL |ri| |r_extra| (QREFELT $ 35)) . #7#)))
               (LETT |i| (+ |i| 1) . #7#) (GO G190) G191 (EXIT NIL))))))
          (EXIT
           (VECTOR
            (CONS (SPADCALL |li| (QCAR |v|) (QREFELT $ 168))
                  (SPADCALL |ri| (QCDR |v|) (QREFELT $ 168)))
            (CONS |li| |ri|) |ei|))))) 

(SDEFUN |LODOF2;testln;FLodo2UpFIR;20|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Record|
          (|:| |main|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |nf|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |error|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|ei|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|v|
           (|Record|
            (|:| |Qt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |Rt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|lnr|
           (|Record|
            (|:| |main|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |nf|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |error|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|i| NIL))
         (SEQ
          (LETT |v| (CONS (|spadConstant| $ 18) (|spadConstant| $ 18))
                . #1=(|LODOF2;testln;FLodo2UpFIR;20|))
          (LETT |ei| (SPADCALL (|LODOF2;convertL3toLL| |f| $) (QREFELT $ 161))
                . #1#)
          (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| 5) (GO G191)))
               (SEQ
                (LETT |lnr|
                      (|LODOF2;lift_newton| |slop|
                       (|LODOF2;convertL3toLL| |f| $) |l_low| |r_low| |shift|
                       |dgr| |v| |ei| |i| $)
                      . #1#)
                (SPADCALL (SPADCALL (QCAR (QVELT |lnr| 0)) (QREFELT $ 170))
                          (QREFELT $ 172))
                (SPADCALL (SPADCALL (QCDR (QVELT |lnr| 0)) (QREFELT $ 170))
                          (QREFELT $ 172))
                (LETT |v| (QVELT |lnr| 1) . #1#)
                (EXIT (LETT |ei| (QVELT |lnr| 2) . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |lnr|)))) 

(SDEFUN |LODOF2;ln_wrapper|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Stream|
          (|Record|
           (|:| |Qt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |Rt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|res|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))))
          (|all|
           (|Stream|
            (|Record|
             (|:| |lr|
                  (|Record|
                   (|:| |main|
                        (|Record|
                         (|:| |Qt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))
                         (|:| |Rt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))))
                   (|:| |nf|
                        (|Record|
                         (|:| |Qt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))
                         (|:| |Rt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))))
                   (|:| |error|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))))
             (|:| |n_lifts| (|PositiveInteger|)))))
          (|lni|
           (|Record|
            (|:| |main|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |nf|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |error|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|n_li| (|PositiveInteger|)))
         (SEQ
          (LETT |lni|
                (VECTOR (CONS (|spadConstant| $ 18) (|spadConstant| $ 18))
                        (CONS (|spadConstant| $ 18) (|spadConstant| $ 18))
                        (SPADCALL |f| (QREFELT $ 161)))
                . #1=(|LODOF2;ln_wrapper|))
          (LETT |n_li| 1 . #1#)
          (LETT |lni|
                (|LODOF2;lift_newton| |slop| |f| |l_low| |r_low| |shift| |dgr|
                 (QVELT |lni| 1) (QVELT |lni| 2) |n_li| $)
                . #1#)
          (LETT |all|
                (SPADCALL
                 (CONS #'|LODOF2;ln_wrapper!0|
                       (VECTOR |dgr| |shift| |r_low| |l_low| |f| |slop| $))
                 (CONS |lni| |n_li|) (QREFELT $ 180))
                . #1#)
          (LETT |res|
                (SPADCALL (LIST #'|LODOF2;ln_wrapper!1|) |all| (QREFELT $ 183))
                . #1#)
          (EXIT |res|)))) 

(SDEFUN |LODOF2;ln_wrapper!1| ((|rec| NIL) ($$ NIL)) (QVELT (QCAR |rec|) 0)) 

(SDEFUN |LODOF2;ln_wrapper!0| ((|rec| NIL) ($$ NIL))
        (PROG ($ |slop| |f| |l_low| |r_low| |shift| |dgr|)
          (LETT $ (QREFELT $$ 6) . #1=(|LODOF2;ln_wrapper|))
          (LETT |slop| (QREFELT $$ 5) . #1#)
          (LETT |f| (QREFELT $$ 4) . #1#)
          (LETT |l_low| (QREFELT $$ 3) . #1#)
          (LETT |r_low| (QREFELT $$ 2) . #1#)
          (LETT |shift| (QREFELT $$ 1) . #1#)
          (LETT |dgr| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|lnr| NIL) (|n_l| NIL))
                   (SEQ (LETT |lnr| (QCAR |rec|) NIL)
                        (LETT |n_l|
                              (SPADCALL (QCDR |rec|) (|spadConstant| $ 175)
                                        (QREFELT $ 176))
                              NIL)
                        (LETT |lnr|
                              (|LODOF2;lift_newton| |slop| |f| |l_low| |r_low|
                               |shift| |dgr| (QVELT |lnr| 1) (QVELT |lnr| 2)
                               |n_l| $)
                              NIL)
                        (EXIT (CONS |lnr| |n_l|)))))))) 

(SDEFUN |LODOF2;testlw;FLodo2UpFIS;22|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Stream|
          (|Record|
           (|:| |Qt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |Rt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| $) |l_low|
         |r_low| |shift| |dgr| $)) 

(SDEFUN |LODOF2;coefs_poly|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|)
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (SPROG
         ((|res| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|npc| (|Expression| (|Integer|)))
          (|fc| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#1=#:G1015 NIL) (|j| NIL) (|start_x| (|Fraction| (|Integer|)))
          (|start_D| (|Integer|)) (|nsi| (|Integer|)))
         (SEQ
          (LETT |nsi|
                (QVELT
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                           (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 185))
                 0)
                . #2=(|LODOF2;coefs_poly|))
          (LETT |start_D|
                (SPADCALL (- (* |i| |nsi|)) (SPADCALL |slop| (QREFELT $ 53))
                          (QREFELT $ 186))
                . #2#)
          (LETT |start_x|
                (SPADCALL (SPADCALL |start_D| |slop| (QREFELT $ 107))
                          (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 53))
                                    (QREFELT $ 51))
                          (QREFELT $ 108))
                . #2#)
          (LETT |res| (|spadConstant| $ 52) . #2#)
          (SEQ (LETT |j| 0 . #2#)
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| (QREFELT $ 41))
                                (SPADCALL |slop| (QREFELT $ 53))
                                (QREFELT $ 51))
                      (QREFELT $ 187))
                     . #2#)
               G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (LETT |fc|
                      (|LODOF2;coeffx| |f|
                       (SPADCALL |start_x|
                                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                           (SPADCALL |j| (QREFELT $ 106))
                                           (QREFELT $ 107))
                                 (QREFELT $ 108))
                       $)
                      . #2#)
                (LETT |npc|
                      (SPADCALL |fc|
                                (+ |start_D|
                                   (SPADCALL |j|
                                             (SPADCALL |slop| (QREFELT $ 53))
                                             (QREFELT $ 56)))
                                (QREFELT $ 76))
                      . #2#)
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL |npc|
                                           (+ |start_D|
                                              (SPADCALL |j|
                                                        (SPADCALL |slop|
                                                                  (QREFELT $
                                                                           53))
                                                        (QREFELT $ 56)))
                                           (QREFELT $ 58))
                                 (QREFELT $ 59))
                       . #2#)))
               (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;testcp;LodoFILodo;24|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;coefs_operator|
         (|LODOF2;coefs_poly| (|LODOF2;convertL3toLL| |f| $) |slop| |i| $)
         |slop| |i| $)) 

(SDEFUN |LODOF2;coefs_operator|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|sc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|npc| (|Expression| (|Integer|))) (#1=#:G1022 NIL) (|j| NIL)
          (|start_x| (|Integer|)) (|start_D| (|Integer|)) (|nsi| (|Integer|)))
         (SEQ
          (LETT |nsi|
                (QVELT
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                           (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 185))
                 0)
                . #2=(|LODOF2;coefs_operator|))
          (LETT |start_D|
                (SPADCALL (- (* |i| |nsi|)) (SPADCALL |slop| (QREFELT $ 53))
                          (QREFELT $ 186))
                . #2#)
          (LETT |start_x|
                (SPADCALL
                 (SPADCALL (SPADCALL |start_D| |slop| (QREFELT $ 107))
                           (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 53))
                                     (QREFELT $ 51))
                           (QREFELT $ 108))
                 (QREFELT $ 129))
                . #2#)
          (LETT |res| (|spadConstant| $ 18) . #2#)
          (SEQ (LETT |j| 0 . #2#)
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |np| (QREFELT $ 75))
                                (SPADCALL |slop| (QREFELT $ 53))
                                (QREFELT $ 51))
                      (QREFELT $ 189))
                     . #2#)
               G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (LETT |npc|
                      (SPADCALL |np|
                                (+ |start_D|
                                   (SPADCALL |j|
                                             (SPADCALL |slop| (QREFELT $ 53))
                                             (QREFELT $ 56)))
                                (QREFELT $ 76))
                      . #2#)
                (LETT |sc|
                      (SPADCALL |npc|
                                (+ |start_x|
                                   (* (SPADCALL |slop| (QREFELT $ 55)) |j|))
                                (QREFELT $ 149))
                      . #2#)
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL |sc|
                                           (+ |start_D|
                                              (SPADCALL |j|
                                                        (SPADCALL |slop|
                                                                  (QREFELT $
                                                                           53))
                                                        (QREFELT $ 56)))
                                           (QREFELT $ 34))
                                 (QREFELT $ 35))
                       . #2#)))
               (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;testco;LodoFIB;26|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|) ($ |Boolean|))
        (SPROG
         ((|np| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (SEQ
          (LETT |np|
                (|LODOF2;coefs_poly| (|LODOF2;convertL3toLL| |f| $) |slop| |i|
                 $)
                |LODOF2;testco;LodoFIB;26|)
          (EXIT
           (SPADCALL
            (|LODOF2;coefs_poly| (|LODOF2;coefs_operator| |np| |slop| |i| $)
             |slop| |i| $)
            |np| (QREFELT $ 87)))))) 

(SDEFUN |LODOF2;coeffx|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         (|e| |Fraction| (|Integer|))
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (SPROG
         ((|ftmp| #1#)
          (|res| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ex| (|Integer|)))
         (SEQ (LETT |ftmp| |f| . #2=(|LODOF2;coeffx|))
              (LETT |ex| (SPADCALL |e| (QREFELT $ 129)) . #2#)
              (LETT |res| (|spadConstant| $ 52) . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)) . #2#)
                        (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)) . #2#)
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| |ex| (QREFELT $ 57))
                                         |dg| (QREFELT $ 58))
                                        (QREFELT $ 59))
                              . #2#)
                        (EXIT
                         (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;testcx;LodoFUp;28|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|e| |Fraction| (|Integer|))
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (|LODOF2;coeffx| (|LODOF2;convertL3toLL| |f| $) |e| $)) 

(SDEFUN |LODOF2;plug_delta|
        ((|np| . #1=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|nptmp| #1#)
          (|f|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|dg| (|NonNegativeInteger|)) (|lc| (|Expression| (|Integer|))))
         (SEQ (LETT |f| (|spadConstant| $ 18) . #2=(|LODOF2;plug_delta|))
              (LETT |nptmp| |np| . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |nptmp| (|spadConstant| $ 52) (QREFELT $ 154)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |nptmp| (QREFELT $ 192)) . #2#)
                        (LETT |dg| (SPADCALL |nptmp| (QREFELT $ 75)) . #2#)
                        (LETT |f|
                              (SPADCALL |f|
                                        (SPADCALL
                                         (SPADCALL |lc| (QREFELT $ 193)) |dg|
                                         (QREFELT $ 34))
                                        (QREFELT $ 35))
                              . #2#)
                        (EXIT
                         (LETT |nptmp| (SPADCALL |nptmp| (QREFELT $ 194))
                               . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |f|)))) 

(SDEFUN |LODOF2;testpd;UpLodo;30|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;plug_delta| |np| $)) 

(SDEFUN |LODOF2;factor_riccati|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (SPROG
         ((#1=#:G1210 NIL)
          (|res|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|nt|
           #2=(|Record|
               (|:| |ope|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|)))
               (|:| |dext| (|PositiveInteger|))
               (|:| |alpha| (|Expression| (|Integer|)))
               (|:| |rami|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (|ir|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#3=#:G1242 NIL)
          (|i| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|vrs|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#4=#:G1241 NIL) (#5=#:G1240 NIL)
          (|vsp|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|r| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|v|
           (|Union|
            (|List|
             (|Record|
              (|:| |op|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |ram|
                   (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
              (|:| |expart|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))
            (|List|
             (|Union|
              (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|))
              (|Record|
               (|:| |ope|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|)))
               (|:| |dext| (|PositiveInteger|))
               (|:| |alpha| (|Expression| (|Integer|)))
               (|:| |rami|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|)))))))))
          (|f2r|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|lns|
           #6=(|Record|
               (|:| |point|
                    (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
               (|:| |slope| #7=(|Fraction| (|Integer|)))
               (|:| |npoly|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (#8=#:G1239 NIL) (|np| (|List| #6#))
          (|tosub| (|Expression| (|Integer|))) (|exp| (|Integer|))
          (|ror|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|coefr| (|Expression| (|Integer|))) (|n| (|Integer|))
          (#9=#:G1238 NIL)
          (|npgr| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|gr| (|Expression| (|Integer|)))
          (|rk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#10=#:G794 NIL) (#11=#:G1237 NIL)
          (|ric|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#12=#:G1038 NIL)
          (|lk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|r1|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#13=#:G1236 NIL) (#14=#:G1235 NIL) (#15=#:G1234 NIL)
          (#16=#:G1233 NIL) (#17=#:G1232 NIL) (#18=#:G1231 NIL)
          (#19=#:G1230 NIL) (#20=#:G1229 NIL)
          (|retv|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|fullxr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|xsubsr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#21=#:G1228 NIL) (|vi| NIL) (|sym| (|Symbol|)) (#22=#:G1037 NIL)
          (#23=#:G793 NIL)
          (|cxs|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#24=#:G1227 NIL) (#25=#:G1226 NIL) (#26=#:G1225 NIL)
          (#27=#:G1224 NIL) (#28=#:G1223 NIL) (#29=#:G1222 NIL)
          (#30=#:G1221 NIL) (#31=#:G1220 NIL) (#32=#:G1219 NIL)
          (#33=#:G1218 NIL) (#34=#:G1217 NIL) (#35=#:G1216 NIL)
          (#36=#:G1215 NIL) (#37=#:G1214 NIL) (#38=#:G1213 NIL)
          (|il|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|npf|
           (|Record|
            (|:| |factor|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |exponent| (|Integer|))))
          (#39=#:G1212 NIL) (|ip| NIL)
          (|subs|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|sols| (|List| (|Integer|))) (#40=#:G1053 NIL)
          (|fact| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|diff| (|Union| (|Integer|) "failed")) (#41=#:G1211 NIL) (|l| NIL)
          (|xx| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|vr| #2#)
          (|va|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|slop| #7#)
          (|np1|
           (|Record|
            (|:| |point|
                 (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
            (|:| |slope| (|Fraction| (|Integer|)))
            (|:| |npoly|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |np| (|LODOF2;newtonpolygon| |f| $)
                  . #42=(|LODOF2;factor_riccati|))
            (LETT |np1| (SPADCALL |np| 1 (QREFELT $ 196)) . #42#)
            (LETT |slop| (QVELT |np1| 1) . #42#)
            (COND
             ((EQUAL |option| "semireg")
              (COND
               ((SPADCALL |slop| (|spadConstant| $ 68) (QREFELT $ 111))
                (SEQ
                 (LETT |va|
                       (SPADCALL
                        (PROG2
                            (LETT #12#
                                  (|LODOF2;factor_op| |f| |factorizer|
                                   "alg factor" $)
                                  . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        (QREFELT $ 200))
                       . #42#)
                 (COND
                  ((QEQCAR |va| 0)
                   (LETT |vr|
                         (VECTOR (QCDR |va|) 1 (|spadConstant| $ 19)
                                 (SPADCALL (|spadConstant| $ 12) 1
                                           (QREFELT $ 58)))
                         . #42#))
                  (#43='T (LETT |vr| (QCDR |va|) . #42#)))
                 (LETT |xx| (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                       . #42#)
                 (LETT |i|
                       (SPADCALL |xx|
                                 (|LODOF2;coeffx| (QVELT |vr| 0)
                                  (|spadConstant| $ 68) $)
                                 (QREFELT $ 86))
                       . #42#)
                 (LETT |n|
                       (QUOTIENT2 (SPADCALL |f| (QREFELT $ 41)) (QVELT |vr| 1))
                       . #42#)
                 (COND
                  ((EQL |n| 1)
                   (SEQ
                    (LETT |il|
                          (SPADCALL (|LODOF2;convertUPtoUTS| |i| $)
                                    (QREFELT $ 28))
                          . #42#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 0
                                  (LIST
                                   (VECTOR
                                    (SPADCALL (QVELT |vr| 0)
                                              (SPADCALL |il| (QREFELT $ 201))
                                              (QREFELT $ 35))
                                    (QVELT |vr| 3) |il|)))
                            . #42#)
                      (GO #44=#:G1209))))))
                 (LETT |npf|
                       (SPADCALL
                        (|LODOF2;factorUP|
                         (SPADCALL (QVELT |np1| 2)
                                   (SPADCALL (|spadConstant| $ 12) 1
                                             (QREFELT $ 58))
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 12) 1
                                              (QREFELT $ 58))
                                    |i| (QREFELT $ 59))
                                   (QREFELT $ 85))
                         |factorizer| $)
                        (QREFELT $ 67))
                       . #42#)
                 (LETT |r| (|spadConstant| $ 153) . #42#)
                 (LETT |sols| NIL . #42#)
                 (SEQ (LETT |l| NIL . #42#) (LETT #41# |npf| . #42#) G190
                      (COND
                       ((OR (ATOM #41#)
                            (PROGN (LETT |l| (CAR #41#) . #42#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |diff|
                             (SPADCALL
                              (SPADCALL |xx| (QCAR |l|) (QREFELT $ 86))
                              (QREFELT $ 202))
                             . #42#)
                       (EXIT
                        (COND
                         ((SPADCALL |diff| (CONS 1 "failed") (QREFELT $ 203))
                          (SEQ (LETT |fact| (QCAR |l|) . #42#)
                               (LETT |exp| (QCDR |l|) . #42#)
                               (LETT |r|
                                     (SPADCALL |r|
                                               (SPADCALL |fact| |exp|
                                                         (QREFELT $ 70))
                                               (QREFELT $ 90))
                                     . #42#)
                               (EXIT
                                (LETT |sols|
                                      (CONS
                                       (PROG2 (LETT #40# |diff| . #42#)
                                           (QCDR #40#)
                                         (|check_union2| (QEQCAR #40# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  "failed")
                                                         #40#))
                                       |sols|)
                                      . #42#)))))))
                      (LETT #41# (CDR #41#) . #42#) (GO G190) G191 (EXIT NIL))
                 (COND
                  ((SPADCALL (SPADCALL |r| (QREFELT $ 75)) |n| (QREFELT $ 204))
                   (|error| "bug")))
                 (LETT |n| (SPADCALL (ELT $ 205) |sols| (QREFELT $ 208))
                       . #42#)
                 (LETT |r|
                       (SPADCALL |r|
                                 (SPADCALL (|spadConstant| $ 12) 1
                                           (QREFELT $ 58))
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 12) 1
                                            (QREFELT $ 58))
                                  (SPADCALL |n| (QREFELT $ 84)) (QREFELT $ 59))
                                 (QREFELT $ 85))
                       . #42#)
                 (LETT |subs|
                       (PROG2
                           (LETT #23#
                                 (|LODOF2;substitute|
                                  (CONS 0
                                        (SPADCALL |i|
                                                  (SPADCALL |n| (QREFELT $ 84))
                                                  (QREFELT $ 59)))
                                  (CONS 0 |f|) $)
                                 . #42#)
                           (QCDR #23#)
                         (|check_union2| (QEQCAR #23# 0)
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7)))
                                         (|Union|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7)))
                                          (|Record|
                                           (|:| |ope|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |dext| (|PositiveInteger|))
                                           (|:| |alpha|
                                                (|Expression| (|Integer|)))
                                           (|:| |rami|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|))))))
                                         #23#))
                       . #42#)
                 (LETT |np| (|LODOF2;newtonpolygon| |subs| $) . #42#)
                 (SEQ (LETT |ip| NIL . #42#) (LETT #39# |np| . #42#) G190
                      (COND
                       ((OR (ATOM #39#)
                            (PROGN (LETT |ip| (CAR #39#) . #42#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QVELT |ip| 1) (|spadConstant| $ 68)
                                    (QREFELT $ 111))
                          (LETT |lns| |ip| . #42#)))))
                      (LETT #39# (CDR #39#) . #42#) (GO G190) G191 (EXIT NIL))
                 (LETT |f2r|
                       (QCDR (|LODOF2;factor_newton2| |subs| |r| |lns| $))
                       . #42#)
                 (EXIT
                  (PROGN
                   (LETT #1#
                         (CONS 0
                               (LIST
                                (VECTOR |f2r| (QVELT |vr| 3)
                                        (SPADCALL
                                         (|LODOF2;convertUPtoUTS|
                                          (SPADCALL |i|
                                                    (SPADCALL |n|
                                                              (QREFELT $ 84))
                                                    (QREFELT $ 59))
                                          $)
                                         (QREFELT $ 28)))))
                         . #42#)
                   (GO #44#))))))))
            (LETT |npf|
                  (SPADCALL
                   (SPADCALL (|LODOF2;factorUP| (QVELT |np1| 2) |factorizer| $)
                             (QREFELT $ 67))
                   1 (QREFELT $ 93))
                  . #42#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |f| (QREFELT $ 41)) 1 (QREFELT $ 209))
               (COND
                ((EQUAL |option| #45="semireg")
                 (SEQ
                  (LETT |il|
                        (SPADCALL
                         (SPADCALL (SPADCALL |f| 0 (QREFELT $ 54)) 0
                                   (QREFELT $ 210))
                         (QREFELT $ 211))
                        . #42#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (CONS 0
                                (LIST
                                 (VECTOR
                                  (SPADCALL |f| (SPADCALL |il| (QREFELT $ 201))
                                            (QREFELT $ 35))
                                  (SPADCALL (|spadConstant| $ 12) 1
                                            (QREFELT $ 58))
                                  |il|)))
                          . #42#)
                    (GO #44#)))))
                (#43#
                 (PROGN
                  (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                  (GO #44#)))))
              ((EQL (QCDR |npf|) 1)
               (COND
                ((OR (EQUAL |option| "split over k((x))")
                     (EQUAL |option| "all right factors"))
                 (COND
                  ((EQUAL |option| #45#)
                   (SEQ
                    (LETT |il|
                          (SPADCALL
                           (SPADCALL (SPADCALL |f| 0 (QREFELT $ 54)) 0
                                     (QREFELT $ 210))
                           (QREFELT $ 211))
                          . #42#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 0
                                  (LIST
                                   (VECTOR
                                    (SPADCALL |f|
                                              (SPADCALL |il| (QREFELT $ 201))
                                              (QREFELT $ 35))
                                    (SPADCALL (|spadConstant| $ 12) 1
                                              (QREFELT $ 58))
                                    |il|)))
                            . #42#)
                      (GO #44#)))))
                  (#43#
                   (PROGN
                    (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                    (GO #44#)))))
                ((EQL (SPADCALL (QCAR |npf|) (QREFELT $ 75)) 1)
                 (COND
                  ((EQL (SPADCALL |slop| (QREFELT $ 53)) 1)
                   (SEQ
                    (LETT |cxs|
                          (SPADCALL
                           (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 76))
                                     (SPADCALL (|spadConstant| $ 12)
                                               (-
                                                (SPADCALL |slop|
                                                          (QREFELT $ 55)))
                                               (QREFELT $ 149))
                                     (QREFELT $ 212))
                           (QREFELT $ 211))
                          . #42#)
                    (LETT |v|
                          (|LODOF2;factor_op|
                           (PROG2
                               (LETT #23#
                                     (|LODOF2;substitute| (CONS 1 |cxs|)
                                      (CONS 0 |f|) $)
                                     . #42#)
                               (QCDR #23#)
                             (|check_union2| (QEQCAR #23# 0)
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))))
                                             #23#))
                           |factorizer| |option| $)
                          . #42#)
                    (COND
                     ((EQUAL |option| #46="semireg")
                      (SEQ
                       (LETT |vsp|
                             (PROG2 (LETT #22# |v| . #42#)
                                 (QCDR #22#)
                               (|check_union2| (QEQCAR #22# 0)
                                               (|List|
                                                (|Record|
                                                 (|:| |op|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))))
                                                 (|:| |ram|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|))))
                                                 (|:| |expart|
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7)))))
                                               (|Union|
                                                (|List|
                                                 (|Record|
                                                  (|:| |op|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |ram|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))
                                                  (|:| |expart|
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)))))
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))))
                                               #22#))
                             . #42#)
                       (LETT |sym| (SPADCALL |cxs| (QREFELT $ 214)) . #42#)
                       (LETT |retv| NIL . #42#)
                       (SEQ (LETT |vi| NIL . #42#) (LETT #38# |vsp| . #42#)
                            G190
                            (COND
                             ((OR (ATOM #38#)
                                  (PROGN (LETT |vi| (CAR #38#) . #42#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |xsubsr|
                                   (SPADCALL
                                    (SPADCALL
                                     (|LODOF2;convertUPtoUTS| (QVELT |vi| 1) $)
                                     (QREFELT $ 28))
                                    (- (SPADCALL |slop| (QREFELT $ 55)))
                                    (QREFELT $ 215))
                                   . #42#)
                             (LETT |fullxr|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QVELT |vi| 1) (QREFELT $ 75))
                                     (SPADCALL
                                      (SPADCALL (QCAR |npf|) 0 (QREFELT $ 76))
                                      (QREFELT $ 216))
                                     (QREFELT $ 217))
                                    |xsubsr| (QREFELT $ 212))
                                   . #42#)
                             (EXIT
                              (LETT |retv|
                                    (SPADCALL |retv|
                                              (LIST
                                               (VECTOR (QVELT |vi| 0)
                                                       (QVELT |vi| 1)
                                                       (SPADCALL (QVELT |vi| 2)
                                                                 |fullxr|
                                                                 (QREFELT $
                                                                          218))))
                                              (QREFELT $ 221))
                                    . #42#)))
                            (LETT #38# (CDR #38#) . #42#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (PROGN (LETT #1# (CONS 0 |retv|) . #42#) (GO #44#))))))
                    (LETT |vrs|
                          (PROG2 (LETT #12# |v| . #42#)
                              (QCDR #12#)
                            (|check_union2| (QEQCAR #12# 1)
                                            (|List|
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|)))))))
                                            (|Union|
                                             (|List|
                                              (|Record|
                                               (|:| |op|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |ram|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))
                                               (|:| |expart|
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))))
                                             (|List|
                                              (|Union|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7)))
                                               (|Record|
                                                (|:| |ope|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))))
                                                (|:| |dext|
                                                     (|PositiveInteger|))
                                                (|:| |alpha|
                                                     (|Expression|
                                                      (|Integer|)))
                                                (|:| |rami|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|Expression|
                                                       (|Integer|))))))))
                                            #12#))
                          . #42#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 1
                                  (PROGN
                                   (LETT #37# NIL . #42#)
                                   (SEQ (LETT |i| NIL . #42#)
                                        (LETT #36# |vrs| . #42#) G190
                                        (COND
                                         ((OR (ATOM #36#)
                                              (PROGN
                                               (LETT |i| (CAR #36#) . #42#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #37#
                                                (CONS
                                                 (|LODOF2;substitute|
                                                  (CONS 1
                                                        (SPADCALL |cxs|
                                                                  (QREFELT $
                                                                           211)))
                                                  |i| $)
                                                 #37#)
                                                . #42#)))
                                        (LETT #36# (CDR #36#) . #42#) (GO G190)
                                        G191 (EXIT (NREVERSE #37#)))))
                            . #42#)
                      (GO #44#)))))
                  ((EQUAL |option| #47="split over k((x))")
                   (SEQ
                    (LETT |ric|
                          (PROG2
                              (LETT #12#
                                    (|LODOF2;factor_riccati| |f| |factorizer|
                                     #48="alg factor" $)
                                    . #42#)
                              (QCDR #12#)
                            (|check_union2| (QEQCAR #12# 1)
                                            (|List|
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|)))))))
                                            (|Union|
                                             (|List|
                                              (|Record|
                                               (|:| |op|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |ram|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))
                                               (|:| |expart|
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))))
                                             (|List|
                                              (|Union|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7)))
                                               (|Record|
                                                (|:| |ope|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))))
                                                (|:| |dext|
                                                     (|PositiveInteger|))
                                                (|:| |alpha|
                                                     (|Expression|
                                                      (|Integer|)))
                                                (|:| |rami|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|Expression|
                                                       (|Integer|))))))))
                                            #12#))
                          . #42#)
                    (LETT |r1|
                          (PROG2
                              (LETT #10# (SPADCALL |ric| (QREFELT $ 200))
                                    . #42#)
                              (QCDR #10#)
                            (|check_union2| (QEQCAR #10# 1)
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))
                                            #10#))
                          . #42#)
                    (LETT |rk| (|LODOF2;make_rightfactor| |f| |r1| $) . #42#)
                    (COND
                     ((SPADCALL |rk| |f| (QREFELT $ 222))
                      (PROGN
                       (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                       (GO #44#))))
                    (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 223)) . #42#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 1
                                  (SPADCALL
                                   (PROG2
                                       (LETT #12#
                                             (|LODOF2;factor_riccati| |lk|
                                              |factorizer| |option| $)
                                             . #42#)
                                       (QCDR #12#)
                                     (|check_union2| (QEQCAR #12# 1)
                                                     (|List|
                                                      (|Union|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))
                                                       (|Record|
                                                        (|:| |ope|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |dext|
                                                             (|PositiveInteger|))
                                                        (|:| |alpha|
                                                             (|Expression|
                                                              (|Integer|)))
                                                        (|:| |rami|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|)))))))
                                                     (|Union|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |op|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |ram|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|))))
                                                        (|:| |expart|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))))
                                                      (|List|
                                                       (|Union|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7)))
                                                        (|Record|
                                                         (|:| |ope|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $ 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $
                                                                         7))))
                                                         (|:| |dext|
                                                              (|PositiveInteger|))
                                                         (|:| |alpha|
                                                              (|Expression|
                                                               (|Integer|)))
                                                         (|:| |rami|
                                                              (|UnivariatePolynomial|
                                                               (QREFELT $ 6)
                                                               (|Expression|
                                                                (|Integer|))))))))
                                                     #12#))
                                   (LIST (CONS 0 |rk|)) (QREFELT $ 224)))
                            . #42#)
                      (GO #44#)))))
                  ((EQUAL |option| #49="all right factors")
                   (SEQ
                    (LETT |ric|
                          (PROG2
                              (LETT #12#
                                    (|LODOF2;factor_riccati| |f| |factorizer|
                                     #50="all alg factors" $)
                                    . #42#)
                              (QCDR #12#)
                            (|check_union2| (QEQCAR #12# 1)
                                            (|List|
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|)))))))
                                            (|Union|
                                             (|List|
                                              (|Record|
                                               (|:| |op|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |ram|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))
                                               (|:| |expart|
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))))
                                             (|List|
                                              (|Union|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7)))
                                               (|Record|
                                                (|:| |ope|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))))
                                                (|:| |dext|
                                                     (|PositiveInteger|))
                                                (|:| |alpha|
                                                     (|Expression|
                                                      (|Integer|)))
                                                (|:| |rami|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|Expression|
                                                       (|Integer|))))))))
                                            #12#))
                          . #42#)
                    (LETT |res| NIL . #42#)
                    (SEQ (LETT |i| NIL . #42#) (LETT #35# |ric| . #42#) G190
                         (COND
                          ((OR (ATOM #35#)
                               (PROGN (LETT |i| (CAR #35#) . #42#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |rk|
                                (|LODOF2;make_rightfactor| |f|
                                 (PROG2 (LETT #10# |i| . #42#)
                                     (QCDR #10#)
                                   (|check_union2| (QEQCAR #10# 1)
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|)))))
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|))))))
                                                   #10#))
                                 $)
                                . #42#)
                          (EXIT
                           (COND
                            ((SPADCALL |rk| |f| (QREFELT $ 222))
                             (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                            ('T
                             (LETT |res|
                                   (SPADCALL |res| (LIST (CONS 0 |rk|))
                                             (QREFELT $ 224))
                                   . #42#)))))
                         (LETT #35# (CDR #35#) . #42#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
                  (#43#
                   (COND
                    ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 75)) 1
                               (QREFELT $ 48))
                     (SEQ
                      (LETT |gr|
                            (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 100))
                                      (QREFELT $ 226))
                            . #42#)
                      (LETT |npgr|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL |gr| (QREFELT $ 227)) (QREFELT $ 86))
                             (QCDR |npf|) (QREFELT $ 70))
                            . #42#)
                      (LETT |f2r|
                            (QCDR (|LODOF2;factor_newton2| |f| |npgr| |np1| $))
                            . #42#)
                      (LETT |v|
                            (|LODOF2;factor_riccati| |f2r| |factorizer|
                             |option| $)
                            . #42#)
                      (EXIT
                       (COND
                        ((QEQCAR |v| 0)
                         (PROGN (LETT #1# |v| . #42#) (GO #44#)))
                        (#43#
                         (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                              (LETT |res| NIL . #42#)
                              (SEQ (LETT |i| NIL . #42#)
                                   (LETT #34# |vrs| . #42#) G190
                                   (COND
                                    ((OR (ATOM #34#)
                                         (PROGN
                                          (LETT |i| (CAR #34#) . #42#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((QEQCAR |i| 0)
                                       (SEQ
                                        (LETT |nt|
                                              (VECTOR (QCDR |i|)
                                                      (SPADCALL (QCAR |npf|)
                                                                (QREFELT $ 75))
                                                      |gr|
                                                      (SPADCALL
                                                       (|spadConstant| $ 12) 1
                                                       (QREFELT $ 58)))
                                              . #42#)
                                        (EXIT
                                         (LETT |res|
                                               (SPADCALL |res|
                                                         (LIST (CONS 1 |nt|))
                                                         (QREFELT $ 224))
                                               . #42#))))
                                      ('T
                                       (LETT |res|
                                             (SPADCALL |res| (LIST |i|)
                                                       (QREFELT $ 224))
                                             . #42#)))))
                                   (LETT #34# (CDR #34#) . #42#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (PROGN
                                (LETT #1# (CONS 1 |res|) . #42#)
                                (GO #44#)))))))))
                    (#43#
                     (SEQ
                      (LETT |n|
                            (QVELT
                             (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                       (SPADCALL |slop| (QREFELT $ 53))
                                       (QREFELT $ 185))
                             0)
                            . #42#)
                      (LETT |coefr|
                            (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 76))
                                      (QREFELT $ 216))
                            . #42#)
                      (LETT |ror|
                            (|LODOF2;ramification_of| |f|
                             (SPADCALL |coefr| |n| (QREFELT $ 228))
                             (SPADCALL |slop| (QREFELT $ 53)) $)
                            . #42#)
                      (LETT |exp|
                            (SPADCALL
                             (SPADCALL
                              (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                              (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                             (QREFELT $ 129))
                            . #42#)
                      (LETT |tosub|
                            (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                      (SPADCALL |coefr| |exp| (QREFELT $ 228))
                                      (QREFELT $ 229))
                            . #42#)
                      (LETT |r|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL |tosub| (QREFELT $ 227))
                              (QREFELT $ 86))
                             (QCDR |npf|) (QREFELT $ 70))
                            . #42#)
                      (LETT |np| (|LODOF2;newtonpolygon| |ror| $) . #42#)
                      (SEQ (LETT |i| NIL . #42#) (LETT #33# |np| . #42#) G190
                           (COND
                            ((OR (ATOM #33#)
                                 (PROGN (LETT |i| (CAR #33#) . #42#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QVELT |i| 1)
                                         (SPADCALL
                                          (SPADCALL |slop| (QREFELT $ 55))
                                          (QREFELT $ 106))
                                         (QREFELT $ 111))
                               (LETT |lns| |i| . #42#)))))
                           (LETT #33# (CDR #33#) . #42#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |f2r|
                            (QCDR (|LODOF2;factor_newton2| |ror| |r| |lns| $))
                            . #42#)
                      (LETT |v|
                            (|LODOF2;factor_riccati| |f2r| |factorizer|
                             |option| $)
                            . #42#)
                      (LETT |r|
                            (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 228))
                                      (SPADCALL |slop| (QREFELT $ 53))
                                      (QREFELT $ 58))
                            . #42#)
                      (EXIT
                       (COND
                        ((QEQCAR |v| 0)
                         (SEQ (LETT |vsp| (QCDR |v|) . #42#)
                              (LETT |res|
                                    (PROGN
                                     (LETT #32# NIL . #42#)
                                     (SEQ (LETT |i| NIL . #42#)
                                          (LETT #31# |vsp| . #42#) G190
                                          (COND
                                           ((OR (ATOM #31#)
                                                (PROGN
                                                 (LETT |i| (CAR #31#) . #42#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #32#
                                                  (CONS
                                                   (VECTOR (QVELT |i| 0)
                                                           (SPADCALL |r|
                                                                     (SPADCALL
                                                                      (|spadConstant|
                                                                       $ 12)
                                                                      1
                                                                      (QREFELT
                                                                       $ 58))
                                                                     (QVELT |i|
                                                                            1)
                                                                     (QREFELT $
                                                                              85))
                                                           (QVELT |i| 2))
                                                   #32#)
                                                  . #42#)))
                                          (LETT #31# (CDR #31#) . #42#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #32#))))
                                    . #42#)
                              (EXIT
                               (PROGN
                                (LETT #1# (CONS 0 |res|) . #42#)
                                (GO #44#)))))
                        (#43#
                         (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                              (LETT |res| NIL . #42#)
                              (SEQ (LETT |i| NIL . #42#)
                                   (LETT #30# |vrs| . #42#) G190
                                   (COND
                                    ((OR (ATOM #30#)
                                         (PROGN
                                          (LETT |i| (CAR #30#) . #42#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (COND
                                     ((QEQCAR |i| 0)
                                      (LETT |nt|
                                            (VECTOR (QCDR |i|) 1
                                                    (|spadConstant| $ 19) |r|)
                                            . #42#))
                                     ('T
                                      (SEQ (LETT |ir| (QCDR |i|) . #42#)
                                           (EXIT
                                            (LETT |nt|
                                                  (VECTOR (QVELT |ir| 0)
                                                          (QVELT |ir| 1)
                                                          (QVELT |ir| 2)
                                                          (SPADCALL |r|
                                                                    (SPADCALL
                                                                     (|spadConstant|
                                                                      $ 12)
                                                                     1
                                                                     (QREFELT $
                                                                              58))
                                                                    (QVELT |ir|
                                                                           3)
                                                                    (QREFELT $
                                                                             85)))
                                                  . #42#)))))
                                    (EXIT
                                     (LETT |res|
                                           (SPADCALL |res| (LIST (CONS 1 |nt|))
                                                     (QREFELT $ 224))
                                           . #42#)))
                                   (LETT #30# (CDR #30#) . #42#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (PROGN
                                (LETT #1# (CONS 1 |res|) . #42#)
                                (GO #44#)))))))))))))
                ((EQUAL |option| #47#)
                 (SEQ
                  (LETT |ric|
                        (PROG2
                            (LETT #12#
                                  (|LODOF2;factor_riccati| |f| |factorizer|
                                   #48# $)
                                  . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        . #42#)
                  (LETT |r1|
                        (PROG2
                            (LETT #10# (SPADCALL |ric| (QREFELT $ 200)) . #42#)
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 1)
                                          (|Record|
                                           (|:| |ope|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |dext| (|PositiveInteger|))
                                           (|:| |alpha|
                                                (|Expression| (|Integer|)))
                                           (|:| |rami|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|)))))
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Expression|
                                                   (|Integer|))))))
                                          #10#))
                        . #42#)
                  (LETT |rk| (|LODOF2;make_rightfactor| |f| |r1| $) . #42#)
                  (COND
                   ((SPADCALL |rk| |f| (QREFELT $ 222))
                    (PROGN
                     (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                     (GO #44#))))
                  (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 223)) . #42#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (CONS 1
                                (SPADCALL
                                 (PROG2
                                     (LETT #12#
                                           (|LODOF2;factor_riccati| |lk|
                                            |factorizer| |option| $)
                                           . #42#)
                                     (QCDR #12#)
                                   (|check_union2| (QEQCAR #12# 1)
                                                   (|List|
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|)))))))
                                                   (|Union|
                                                    (|List|
                                                     (|Record|
                                                      (|:| |op|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |ram|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|))))
                                                      (|:| |expart|
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7)))))
                                                    (|List|
                                                     (|Union|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)))
                                                      (|Record|
                                                       (|:| |ope|
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))))
                                                       (|:| |dext|
                                                            (|PositiveInteger|))
                                                       (|:| |alpha|
                                                            (|Expression|
                                                             (|Integer|)))
                                                       (|:| |rami|
                                                            (|UnivariatePolynomial|
                                                             (QREFELT $ 6)
                                                             (|Expression|
                                                              (|Integer|))))))))
                                                   #12#))
                                 (LIST (CONS 0 |rk|)) (QREFELT $ 224)))
                          . #42#)
                    (GO #44#)))))
                ((EQUAL |option| #49#)
                 (SEQ
                  (LETT |ric|
                        (PROG2
                            (LETT #12#
                                  (|LODOF2;factor_riccati| |f| |factorizer|
                                   #50# $)
                                  . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        . #42#)
                  (LETT |res| NIL . #42#)
                  (SEQ (LETT |i| NIL . #42#) (LETT #29# |ric| . #42#) G190
                       (COND
                        ((OR (ATOM #29#)
                             (PROGN (LETT |i| (CAR #29#) . #42#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |rk|
                              (|LODOF2;make_rightfactor| |f|
                               (PROG2 (LETT #10# |i| . #42#)
                                   (QCDR #10#)
                                 (|check_union2| (QEQCAR #10# 1)
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|)))))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #10#))
                               $)
                              . #42#)
                        (EXIT
                         (COND
                          ((SPADCALL |rk| |f| (QREFELT $ 222))
                           (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                          ('T
                           (LETT |res|
                                 (SPADCALL |res| (LIST (CONS 0 |rk|))
                                           (QREFELT $ 224))
                                 . #42#)))))
                       (LETT #29# (CDR #29#) . #42#) (GO G190) G191 (EXIT NIL))
                  (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
                (#43#
                 (COND
                  ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 75)) 1
                             (QREFELT $ 48))
                   (SEQ
                    (LETT |gr|
                          (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 100))
                                    (QREFELT $ 226))
                          . #42#)
                    (LETT |npgr|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |gr| (QREFELT $ 227)) (QREFELT $ 86))
                           (QCDR |npf|) (QREFELT $ 70))
                          . #42#)
                    (LETT |f2r|
                          (QCDR (|LODOF2;factor_newton2| |f| |npgr| |np1| $))
                          . #42#)
                    (LETT |v|
                          (|LODOF2;factor_riccati| |f2r| |factorizer| |option|
                           $)
                          . #42#)
                    (EXIT
                     (COND
                      ((QEQCAR |v| 0) (PROGN (LETT #1# |v| . #42#) (GO #44#)))
                      (#43#
                       (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                            (LETT |res| NIL . #42#)
                            (SEQ (LETT |i| NIL . #42#) (LETT #28# |vrs| . #42#)
                                 G190
                                 (COND
                                  ((OR (ATOM #28#)
                                       (PROGN
                                        (LETT |i| (CAR #28#) . #42#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((QEQCAR |i| 0)
                                     (SEQ
                                      (LETT |nt|
                                            (VECTOR (QCDR |i|)
                                                    (SPADCALL (QCAR |npf|)
                                                              (QREFELT $ 75))
                                                    |gr|
                                                    (SPADCALL
                                                     (|spadConstant| $ 12) 1
                                                     (QREFELT $ 58)))
                                            . #42#)
                                      (EXIT
                                       (LETT |res|
                                             (SPADCALL |res|
                                                       (LIST (CONS 1 |nt|))
                                                       (QREFELT $ 224))
                                             . #42#))))
                                    ('T
                                     (LETT |res|
                                           (SPADCALL |res| (LIST |i|)
                                                     (QREFELT $ 224))
                                           . #42#)))))
                                 (LETT #28# (CDR #28#) . #42#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 1 |res|) . #42#)
                              (GO #44#)))))))))
                  (#43#
                   (SEQ
                    (LETT |n|
                          (QVELT
                           (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                     (SPADCALL |slop| (QREFELT $ 53))
                                     (QREFELT $ 185))
                           0)
                          . #42#)
                    (LETT |coefr|
                          (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 76))
                                    (QREFELT $ 216))
                          . #42#)
                    (LETT |ror|
                          (|LODOF2;ramification_of| |f|
                           (SPADCALL |coefr| |n| (QREFELT $ 228))
                           (SPADCALL |slop| (QREFELT $ 53)) $)
                          . #42#)
                    (LETT |exp|
                          (SPADCALL
                           (SPADCALL
                            (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                            (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                           (QREFELT $ 129))
                          . #42#)
                    (LETT |tosub|
                          (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                    (SPADCALL |coefr| |exp| (QREFELT $ 228))
                                    (QREFELT $ 229))
                          . #42#)
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |tosub| (QREFELT $ 227)) (QREFELT $ 86))
                           (QCDR |npf|) (QREFELT $ 70))
                          . #42#)
                    (LETT |np| (|LODOF2;newtonpolygon| |ror| $) . #42#)
                    (SEQ (LETT |i| NIL . #42#) (LETT #27# |np| . #42#) G190
                         (COND
                          ((OR (ATOM #27#)
                               (PROGN (LETT |i| (CAR #27#) . #42#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |i| 1)
                                       (SPADCALL
                                        (SPADCALL |slop| (QREFELT $ 55))
                                        (QREFELT $ 106))
                                       (QREFELT $ 111))
                             (LETT |lns| |i| . #42#)))))
                         (LETT #27# (CDR #27#) . #42#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |f2r|
                          (QCDR (|LODOF2;factor_newton2| |ror| |r| |lns| $))
                          . #42#)
                    (LETT |v|
                          (|LODOF2;factor_riccati| |f2r| |factorizer| |option|
                           $)
                          . #42#)
                    (LETT |r|
                          (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 228))
                                    (SPADCALL |slop| (QREFELT $ 53))
                                    (QREFELT $ 58))
                          . #42#)
                    (EXIT
                     (COND
                      ((QEQCAR |v| 0)
                       (SEQ (LETT |vsp| (QCDR |v|) . #42#)
                            (LETT |res|
                                  (PROGN
                                   (LETT #26# NIL . #42#)
                                   (SEQ (LETT |i| NIL . #42#)
                                        (LETT #25# |vsp| . #42#) G190
                                        (COND
                                         ((OR (ATOM #25#)
                                              (PROGN
                                               (LETT |i| (CAR #25#) . #42#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #26#
                                                (CONS
                                                 (VECTOR (QVELT |i| 0)
                                                         (SPADCALL |r|
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     $ 12)
                                                                    1
                                                                    (QREFELT $
                                                                             58))
                                                                   (QVELT |i|
                                                                          1)
                                                                   (QREFELT $
                                                                            85))
                                                         (QVELT |i| 2))
                                                 #26#)
                                                . #42#)))
                                        (LETT #25# (CDR #25#) . #42#) (GO G190)
                                        G191 (EXIT (NREVERSE #26#))))
                                  . #42#)
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 0 |res|) . #42#)
                              (GO #44#)))))
                      (#43#
                       (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                            (LETT |res| NIL . #42#)
                            (SEQ (LETT |i| NIL . #42#) (LETT #24# |vrs| . #42#)
                                 G190
                                 (COND
                                  ((OR (ATOM #24#)
                                       (PROGN
                                        (LETT |i| (CAR #24#) . #42#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (COND
                                   ((QEQCAR |i| 0)
                                    (LETT |nt|
                                          (VECTOR (QCDR |i|) 1
                                                  (|spadConstant| $ 19) |r|)
                                          . #42#))
                                   ('T
                                    (SEQ (LETT |ir| (QCDR |i|) . #42#)
                                         (EXIT
                                          (LETT |nt|
                                                (VECTOR (QVELT |ir| 0)
                                                        (QVELT |ir| 1)
                                                        (QVELT |ir| 2)
                                                        (SPADCALL |r|
                                                                  (SPADCALL
                                                                   (|spadConstant|
                                                                    $ 12)
                                                                   1
                                                                   (QREFELT $
                                                                            58))
                                                                  (QVELT |ir|
                                                                         3)
                                                                  (QREFELT $
                                                                           85)))
                                                . #42#)))))
                                  (EXIT
                                   (LETT |res|
                                         (SPADCALL |res| (LIST (CONS 1 |nt|))
                                                   (QREFELT $ 224))
                                         . #42#)))
                                 (LETT #24# (CDR #24#) . #42#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 1 |res|) . #42#)
                              (GO #44#)))))))))))))
              ((EQL (SPADCALL (QCAR |npf|) (QREFELT $ 75)) 1)
               (COND
                ((EQL (SPADCALL |slop| (QREFELT $ 53)) 1)
                 (SEQ
                  (LETT |cxs|
                        (SPADCALL
                         (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 76))
                                   (SPADCALL (|spadConstant| $ 12)
                                             (-
                                              (SPADCALL |slop| (QREFELT $ 55)))
                                             (QREFELT $ 149))
                                   (QREFELT $ 212))
                         (QREFELT $ 211))
                        . #42#)
                  (LETT |v|
                        (|LODOF2;factor_op|
                         (PROG2
                             (LETT #23#
                                   (|LODOF2;substitute| (CONS 1 |cxs|)
                                    (CONS 0 |f|) $)
                                   . #42#)
                             (QCDR #23#)
                           (|check_union2| (QEQCAR #23# 0)
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|))))))
                                           #23#))
                         |factorizer| |option| $)
                        . #42#)
                  (COND
                   ((EQUAL |option| #46#)
                    (SEQ
                     (LETT |vsp|
                           (PROG2 (LETT #22# |v| . #42#)
                               (QCDR #22#)
                             (|check_union2| (QEQCAR #22# 0)
                                             (|List|
                                              (|Record|
                                               (|:| |op|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |ram|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))
                                               (|:| |expart|
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))))
                                             (|Union|
                                              (|List|
                                               (|Record|
                                                (|:| |op|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))))
                                                (|:| |ram|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|Expression|
                                                       (|Integer|))))
                                                (|:| |expart|
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))))
                                              (|List|
                                               (|Union|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7)))
                                                (|Record|
                                                 (|:| |ope|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))))
                                                 (|:| |dext|
                                                      (|PositiveInteger|))
                                                 (|:| |alpha|
                                                      (|Expression|
                                                       (|Integer|)))
                                                 (|:| |rami|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|))))))))
                                             #22#))
                           . #42#)
                     (LETT |sym| (SPADCALL |cxs| (QREFELT $ 214)) . #42#)
                     (LETT |retv| NIL . #42#)
                     (SEQ (LETT |vi| NIL . #42#) (LETT #21# |vsp| . #42#) G190
                          (COND
                           ((OR (ATOM #21#)
                                (PROGN (LETT |vi| (CAR #21#) . #42#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |xsubsr|
                                 (SPADCALL
                                  (SPADCALL
                                   (|LODOF2;convertUPtoUTS| (QVELT |vi| 1) $)
                                   (QREFELT $ 28))
                                  (- (SPADCALL |slop| (QREFELT $ 55)))
                                  (QREFELT $ 215))
                                 . #42#)
                           (LETT |fullxr|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (QVELT |vi| 1) (QREFELT $ 75))
                                   (SPADCALL
                                    (SPADCALL (QCAR |npf|) 0 (QREFELT $ 76))
                                    (QREFELT $ 216))
                                   (QREFELT $ 217))
                                  |xsubsr| (QREFELT $ 212))
                                 . #42#)
                           (EXIT
                            (LETT |retv|
                                  (SPADCALL |retv|
                                            (LIST
                                             (VECTOR (QVELT |vi| 0)
                                                     (QVELT |vi| 1)
                                                     (SPADCALL (QVELT |vi| 2)
                                                               |fullxr|
                                                               (QREFELT $
                                                                        218))))
                                            (QREFELT $ 221))
                                  . #42#)))
                          (LETT #21# (CDR #21#) . #42#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT
                      (PROGN (LETT #1# (CONS 0 |retv|) . #42#) (GO #44#))))))
                  (LETT |vrs|
                        (PROG2 (LETT #12# |v| . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        . #42#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (CONS 1
                                (PROGN
                                 (LETT #20# NIL . #42#)
                                 (SEQ (LETT |i| NIL . #42#)
                                      (LETT #19# |vrs| . #42#) G190
                                      (COND
                                       ((OR (ATOM #19#)
                                            (PROGN
                                             (LETT |i| (CAR #19#) . #42#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #20#
                                              (CONS
                                               (|LODOF2;substitute|
                                                (CONS 1
                                                      (SPADCALL |cxs|
                                                                (QREFELT $
                                                                         211)))
                                                |i| $)
                                               #20#)
                                              . #42#)))
                                      (LETT #19# (CDR #19#) . #42#) (GO G190)
                                      G191 (EXIT (NREVERSE #20#)))))
                          . #42#)
                    (GO #44#)))))
                ((EQUAL |option| #47#)
                 (SEQ
                  (LETT |ric|
                        (PROG2
                            (LETT #12#
                                  (|LODOF2;factor_riccati| |f| |factorizer|
                                   #48# $)
                                  . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        . #42#)
                  (LETT |r1|
                        (PROG2
                            (LETT #10# (SPADCALL |ric| (QREFELT $ 200)) . #42#)
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 1)
                                          (|Record|
                                           (|:| |ope|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |dext| (|PositiveInteger|))
                                           (|:| |alpha|
                                                (|Expression| (|Integer|)))
                                           (|:| |rami|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|)))))
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Expression|
                                                   (|Integer|))))))
                                          #10#))
                        . #42#)
                  (LETT |rk| (|LODOF2;make_rightfactor| |f| |r1| $) . #42#)
                  (COND
                   ((SPADCALL |rk| |f| (QREFELT $ 222))
                    (PROGN
                     (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                     (GO #44#))))
                  (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 223)) . #42#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (CONS 1
                                (SPADCALL
                                 (PROG2
                                     (LETT #12#
                                           (|LODOF2;factor_riccati| |lk|
                                            |factorizer| |option| $)
                                           . #42#)
                                     (QCDR #12#)
                                   (|check_union2| (QEQCAR #12# 1)
                                                   (|List|
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|)))))))
                                                   (|Union|
                                                    (|List|
                                                     (|Record|
                                                      (|:| |op|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |ram|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|))))
                                                      (|:| |expart|
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7)))))
                                                    (|List|
                                                     (|Union|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)))
                                                      (|Record|
                                                       (|:| |ope|
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))))
                                                       (|:| |dext|
                                                            (|PositiveInteger|))
                                                       (|:| |alpha|
                                                            (|Expression|
                                                             (|Integer|)))
                                                       (|:| |rami|
                                                            (|UnivariatePolynomial|
                                                             (QREFELT $ 6)
                                                             (|Expression|
                                                              (|Integer|))))))))
                                                   #12#))
                                 (LIST (CONS 0 |rk|)) (QREFELT $ 224)))
                          . #42#)
                    (GO #44#)))))
                ((EQUAL |option| #49#)
                 (SEQ
                  (LETT |ric|
                        (PROG2
                            (LETT #12#
                                  (|LODOF2;factor_riccati| |f| |factorizer|
                                   #50# $)
                                  . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        . #42#)
                  (LETT |res| NIL . #42#)
                  (SEQ (LETT |i| NIL . #42#) (LETT #18# |ric| . #42#) G190
                       (COND
                        ((OR (ATOM #18#)
                             (PROGN (LETT |i| (CAR #18#) . #42#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |rk|
                              (|LODOF2;make_rightfactor| |f|
                               (PROG2 (LETT #10# |i| . #42#)
                                   (QCDR #10#)
                                 (|check_union2| (QEQCAR #10# 1)
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|)))))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #10#))
                               $)
                              . #42#)
                        (EXIT
                         (COND
                          ((SPADCALL |rk| |f| (QREFELT $ 222))
                           (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                          ('T
                           (LETT |res|
                                 (SPADCALL |res| (LIST (CONS 0 |rk|))
                                           (QREFELT $ 224))
                                 . #42#)))))
                       (LETT #18# (CDR #18#) . #42#) (GO G190) G191 (EXIT NIL))
                  (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
                (#43#
                 (COND
                  ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 75)) 1
                             (QREFELT $ 48))
                   (SEQ
                    (LETT |gr|
                          (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 100))
                                    (QREFELT $ 226))
                          . #42#)
                    (LETT |npgr|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |gr| (QREFELT $ 227)) (QREFELT $ 86))
                           (QCDR |npf|) (QREFELT $ 70))
                          . #42#)
                    (LETT |f2r|
                          (QCDR (|LODOF2;factor_newton2| |f| |npgr| |np1| $))
                          . #42#)
                    (LETT |v|
                          (|LODOF2;factor_riccati| |f2r| |factorizer| |option|
                           $)
                          . #42#)
                    (EXIT
                     (COND
                      ((QEQCAR |v| 0) (PROGN (LETT #1# |v| . #42#) (GO #44#)))
                      (#43#
                       (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                            (LETT |res| NIL . #42#)
                            (SEQ (LETT |i| NIL . #42#) (LETT #17# |vrs| . #42#)
                                 G190
                                 (COND
                                  ((OR (ATOM #17#)
                                       (PROGN
                                        (LETT |i| (CAR #17#) . #42#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((QEQCAR |i| 0)
                                     (SEQ
                                      (LETT |nt|
                                            (VECTOR (QCDR |i|)
                                                    (SPADCALL (QCAR |npf|)
                                                              (QREFELT $ 75))
                                                    |gr|
                                                    (SPADCALL
                                                     (|spadConstant| $ 12) 1
                                                     (QREFELT $ 58)))
                                            . #42#)
                                      (EXIT
                                       (LETT |res|
                                             (SPADCALL |res|
                                                       (LIST (CONS 1 |nt|))
                                                       (QREFELT $ 224))
                                             . #42#))))
                                    ('T
                                     (LETT |res|
                                           (SPADCALL |res| (LIST |i|)
                                                     (QREFELT $ 224))
                                           . #42#)))))
                                 (LETT #17# (CDR #17#) . #42#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 1 |res|) . #42#)
                              (GO #44#)))))))))
                  (#43#
                   (SEQ
                    (LETT |n|
                          (QVELT
                           (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                     (SPADCALL |slop| (QREFELT $ 53))
                                     (QREFELT $ 185))
                           0)
                          . #42#)
                    (LETT |coefr|
                          (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 76))
                                    (QREFELT $ 216))
                          . #42#)
                    (LETT |ror|
                          (|LODOF2;ramification_of| |f|
                           (SPADCALL |coefr| |n| (QREFELT $ 228))
                           (SPADCALL |slop| (QREFELT $ 53)) $)
                          . #42#)
                    (LETT |exp|
                          (SPADCALL
                           (SPADCALL
                            (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                            (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                           (QREFELT $ 129))
                          . #42#)
                    (LETT |tosub|
                          (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                    (SPADCALL |coefr| |exp| (QREFELT $ 228))
                                    (QREFELT $ 229))
                          . #42#)
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |tosub| (QREFELT $ 227)) (QREFELT $ 86))
                           (QCDR |npf|) (QREFELT $ 70))
                          . #42#)
                    (LETT |np| (|LODOF2;newtonpolygon| |ror| $) . #42#)
                    (SEQ (LETT |i| NIL . #42#) (LETT #16# |np| . #42#) G190
                         (COND
                          ((OR (ATOM #16#)
                               (PROGN (LETT |i| (CAR #16#) . #42#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |i| 1)
                                       (SPADCALL
                                        (SPADCALL |slop| (QREFELT $ 55))
                                        (QREFELT $ 106))
                                       (QREFELT $ 111))
                             (LETT |lns| |i| . #42#)))))
                         (LETT #16# (CDR #16#) . #42#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |f2r|
                          (QCDR (|LODOF2;factor_newton2| |ror| |r| |lns| $))
                          . #42#)
                    (LETT |v|
                          (|LODOF2;factor_riccati| |f2r| |factorizer| |option|
                           $)
                          . #42#)
                    (LETT |r|
                          (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 228))
                                    (SPADCALL |slop| (QREFELT $ 53))
                                    (QREFELT $ 58))
                          . #42#)
                    (EXIT
                     (COND
                      ((QEQCAR |v| 0)
                       (SEQ (LETT |vsp| (QCDR |v|) . #42#)
                            (LETT |res|
                                  (PROGN
                                   (LETT #15# NIL . #42#)
                                   (SEQ (LETT |i| NIL . #42#)
                                        (LETT #14# |vsp| . #42#) G190
                                        (COND
                                         ((OR (ATOM #14#)
                                              (PROGN
                                               (LETT |i| (CAR #14#) . #42#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #15#
                                                (CONS
                                                 (VECTOR (QVELT |i| 0)
                                                         (SPADCALL |r|
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     $ 12)
                                                                    1
                                                                    (QREFELT $
                                                                             58))
                                                                   (QVELT |i|
                                                                          1)
                                                                   (QREFELT $
                                                                            85))
                                                         (QVELT |i| 2))
                                                 #15#)
                                                . #42#)))
                                        (LETT #14# (CDR #14#) . #42#) (GO G190)
                                        G191 (EXIT (NREVERSE #15#))))
                                  . #42#)
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 0 |res|) . #42#)
                              (GO #44#)))))
                      (#43#
                       (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                            (LETT |res| NIL . #42#)
                            (SEQ (LETT |i| NIL . #42#) (LETT #13# |vrs| . #42#)
                                 G190
                                 (COND
                                  ((OR (ATOM #13#)
                                       (PROGN
                                        (LETT |i| (CAR #13#) . #42#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (COND
                                   ((QEQCAR |i| 0)
                                    (LETT |nt|
                                          (VECTOR (QCDR |i|) 1
                                                  (|spadConstant| $ 19) |r|)
                                          . #42#))
                                   ('T
                                    (SEQ (LETT |ir| (QCDR |i|) . #42#)
                                         (EXIT
                                          (LETT |nt|
                                                (VECTOR (QVELT |ir| 0)
                                                        (QVELT |ir| 1)
                                                        (QVELT |ir| 2)
                                                        (SPADCALL |r|
                                                                  (SPADCALL
                                                                   (|spadConstant|
                                                                    $ 12)
                                                                   1
                                                                   (QREFELT $
                                                                            58))
                                                                  (QVELT |ir|
                                                                         3)
                                                                  (QREFELT $
                                                                           85)))
                                                . #42#)))))
                                  (EXIT
                                   (LETT |res|
                                         (SPADCALL |res| (LIST (CONS 1 |nt|))
                                                   (QREFELT $ 224))
                                         . #42#)))
                                 (LETT #13# (CDR #13#) . #42#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 1 |res|) . #42#)
                              (GO #44#)))))))))))))
              ((EQUAL |option| #47#)
               (SEQ
                (LETT |ric|
                      (PROG2
                          (LETT #12#
                                (|LODOF2;factor_riccati| |f| |factorizer| #48#
                                 $)
                                . #42#)
                          (QCDR #12#)
                        (|check_union2| (QEQCAR #12# 1)
                                        (|List|
                                         (|Union|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7)))
                                          (|Record|
                                           (|:| |ope|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |dext| (|PositiveInteger|))
                                           (|:| |alpha|
                                                (|Expression| (|Integer|)))
                                           (|:| |rami|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression|
                                                  (|Integer|)))))))
                                        (|Union|
                                         (|List|
                                          (|Record|
                                           (|:| |op|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |ram|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|))))
                                           (|:| |expart|
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6)
                                                 (QREFELT $ 7)))))
                                         (|List|
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Expression|
                                                   (|Integer|))))))))
                                        #12#))
                      . #42#)
                (LETT |r1|
                      (PROG2
                          (LETT #10# (SPADCALL |ric| (QREFELT $ 200)) . #42#)
                          (QCDR #10#)
                        (|check_union2| (QEQCAR #10# 1)
                                        (|Record|
                                         (|:| |ope|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))))
                                         (|:| |dext| (|PositiveInteger|))
                                         (|:| |alpha|
                                              (|Expression| (|Integer|)))
                                         (|:| |rami|
                                              (|UnivariatePolynomial|
                                               (QREFELT $ 6)
                                               (|Expression| (|Integer|)))))
                                        (|Union|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7)))
                                         (|Record|
                                          (|:| |ope|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))))
                                          (|:| |dext| (|PositiveInteger|))
                                          (|:| |alpha|
                                               (|Expression| (|Integer|)))
                                          (|:| |rami|
                                               (|UnivariatePolynomial|
                                                (QREFELT $ 6)
                                                (|Expression| (|Integer|))))))
                                        #10#))
                      . #42#)
                (LETT |rk| (|LODOF2;make_rightfactor| |f| |r1| $) . #42#)
                (COND
                 ((SPADCALL |rk| |f| (QREFELT $ 222))
                  (PROGN
                   (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                   (GO #44#))))
                (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 223)) . #42#)
                (EXIT
                 (PROGN
                  (LETT #1#
                        (CONS 1
                              (SPADCALL
                               (PROG2
                                   (LETT #12#
                                         (|LODOF2;factor_riccati| |lk|
                                          |factorizer| |option| $)
                                         . #42#)
                                   (QCDR #12#)
                                 (|check_union2| (QEQCAR #12# 1)
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|)))))))
                                                 (|Union|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |op|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |ram|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))
                                                    (|:| |expart|
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7)))))
                                                  (|List|
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|))))))))
                                                 #12#))
                               (LIST (CONS 0 |rk|)) (QREFELT $ 224)))
                        . #42#)
                  (GO #44#)))))
              ((EQUAL |option| #49#)
               (SEQ
                (LETT |ric|
                      (PROG2
                          (LETT #12#
                                (|LODOF2;factor_riccati| |f| |factorizer| #50#
                                 $)
                                . #42#)
                          (QCDR #12#)
                        (|check_union2| (QEQCAR #12# 1)
                                        (|List|
                                         (|Union|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7)))
                                          (|Record|
                                           (|:| |ope|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |dext| (|PositiveInteger|))
                                           (|:| |alpha|
                                                (|Expression| (|Integer|)))
                                           (|:| |rami|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression|
                                                  (|Integer|)))))))
                                        (|Union|
                                         (|List|
                                          (|Record|
                                           (|:| |op|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |ram|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|))))
                                           (|:| |expart|
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6)
                                                 (QREFELT $ 7)))))
                                         (|List|
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Expression|
                                                   (|Integer|))))))))
                                        #12#))
                      . #42#)
                (LETT |res| NIL . #42#)
                (SEQ (LETT |i| NIL . #42#) (LETT #11# |ric| . #42#) G190
                     (COND
                      ((OR (ATOM #11#)
                           (PROGN (LETT |i| (CAR #11#) . #42#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |rk|
                            (|LODOF2;make_rightfactor| |f|
                             (PROG2 (LETT #10# |i| . #42#)
                                 (QCDR #10#)
                               (|check_union2| (QEQCAR #10# 1)
                                               (|Record|
                                                (|:| |ope|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))))
                                                (|:| |dext|
                                                     (|PositiveInteger|))
                                                (|:| |alpha|
                                                     (|Expression|
                                                      (|Integer|)))
                                                (|:| |rami|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|Expression|
                                                       (|Integer|)))))
                                               (|Union|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7)))
                                                (|Record|
                                                 (|:| |ope|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))))
                                                 (|:| |dext|
                                                      (|PositiveInteger|))
                                                 (|:| |alpha|
                                                      (|Expression|
                                                       (|Integer|)))
                                                 (|:| |rami|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|))))))
                                               #10#))
                             $)
                            . #42#)
                      (EXIT
                       (COND
                        ((SPADCALL |rk| |f| (QREFELT $ 222))
                         (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                        ('T
                         (LETT |res|
                               (SPADCALL |res| (LIST (CONS 0 |rk|))
                                         (QREFELT $ 224))
                               . #42#)))))
                     (LETT #11# (CDR #11#) . #42#) (GO G190) G191 (EXIT NIL))
                (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
              (#43#
               (COND
                ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 75)) 1
                           (QREFELT $ 48))
                 (SEQ
                  (LETT |gr|
                        (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 100))
                                  (QREFELT $ 226))
                        . #42#)
                  (LETT |npgr|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                          (SPADCALL |gr| (QREFELT $ 227)) (QREFELT $ 86))
                         (QCDR |npf|) (QREFELT $ 70))
                        . #42#)
                  (LETT |f2r|
                        (QCDR (|LODOF2;factor_newton2| |f| |npgr| |np1| $))
                        . #42#)
                  (LETT |v|
                        (|LODOF2;factor_riccati| |f2r| |factorizer| |option| $)
                        . #42#)
                  (EXIT
                   (COND
                    ((QEQCAR |v| 0) (PROGN (LETT #1# |v| . #42#) (GO #44#)))
                    (#43#
                     (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                          (LETT |res| NIL . #42#)
                          (SEQ (LETT |i| NIL . #42#) (LETT #9# |vrs| . #42#)
                               G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |i| (CAR #9#) . #42#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((QEQCAR |i| 0)
                                   (SEQ
                                    (LETT |nt|
                                          (VECTOR (QCDR |i|)
                                                  (SPADCALL (QCAR |npf|)
                                                            (QREFELT $ 75))
                                                  |gr|
                                                  (SPADCALL
                                                   (|spadConstant| $ 12) 1
                                                   (QREFELT $ 58)))
                                          . #42#)
                                    (EXIT
                                     (LETT |res|
                                           (SPADCALL |res| (LIST (CONS 1 |nt|))
                                                     (QREFELT $ 224))
                                           . #42#))))
                                  ('T
                                   (LETT |res|
                                         (SPADCALL |res| (LIST |i|)
                                                   (QREFELT $ 224))
                                         . #42#)))))
                               (LETT #9# (CDR #9#) . #42#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (PROGN
                            (LETT #1# (CONS 1 |res|) . #42#)
                            (GO #44#)))))))))
                (#43#
                 (SEQ
                  (LETT |n|
                        (QVELT
                         (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                   (SPADCALL |slop| (QREFELT $ 53))
                                   (QREFELT $ 185))
                         0)
                        . #42#)
                  (LETT |coefr|
                        (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 76))
                                  (QREFELT $ 216))
                        . #42#)
                  (LETT |ror|
                        (|LODOF2;ramification_of| |f|
                         (SPADCALL |coefr| |n| (QREFELT $ 228))
                         (SPADCALL |slop| (QREFELT $ 53)) $)
                        . #42#)
                  (LETT |exp|
                        (SPADCALL
                         (SPADCALL
                          (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                          (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                         (QREFELT $ 129))
                        . #42#)
                  (LETT |tosub|
                        (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                  (SPADCALL |coefr| |exp| (QREFELT $ 228))
                                  (QREFELT $ 229))
                        . #42#)
                  (LETT |r|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                          (SPADCALL |tosub| (QREFELT $ 227)) (QREFELT $ 86))
                         (QCDR |npf|) (QREFELT $ 70))
                        . #42#)
                  (LETT |np| (|LODOF2;newtonpolygon| |ror| $) . #42#)
                  (SEQ (LETT |i| NIL . #42#) (LETT #8# |np| . #42#) G190
                       (COND
                        ((OR (ATOM #8#)
                             (PROGN (LETT |i| (CAR #8#) . #42#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QVELT |i| 1)
                                     (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                               (QREFELT $ 106))
                                     (QREFELT $ 111))
                           (LETT |lns| |i| . #42#)))))
                       (LETT #8# (CDR #8#) . #42#) (GO G190) G191 (EXIT NIL))
                  (LETT |f2r|
                        (QCDR (|LODOF2;factor_newton2| |ror| |r| |lns| $))
                        . #42#)
                  (LETT |v|
                        (|LODOF2;factor_riccati| |f2r| |factorizer| |option| $)
                        . #42#)
                  (LETT |r|
                        (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 228))
                                  (SPADCALL |slop| (QREFELT $ 53))
                                  (QREFELT $ 58))
                        . #42#)
                  (EXIT
                   (COND
                    ((QEQCAR |v| 0)
                     (SEQ (LETT |vsp| (QCDR |v|) . #42#)
                          (LETT |res|
                                (PROGN
                                 (LETT #5# NIL . #42#)
                                 (SEQ (LETT |i| NIL . #42#)
                                      (LETT #4# |vsp| . #42#) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN
                                             (LETT |i| (CAR #4#) . #42#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (VECTOR (QVELT |i| 0)
                                                       (SPADCALL |r|
                                                                 (SPADCALL
                                                                  (|spadConstant|
                                                                   $ 12)
                                                                  1
                                                                  (QREFELT $
                                                                           58))
                                                                 (QVELT |i| 1)
                                                                 (QREFELT $
                                                                          85))
                                                       (QVELT |i| 2))
                                               #5#)
                                              . #42#)))
                                      (LETT #4# (CDR #4#) . #42#) (GO G190)
                                      G191 (EXIT (NREVERSE #5#))))
                                . #42#)
                          (EXIT
                           (PROGN
                            (LETT #1# (CONS 0 |res|) . #42#)
                            (GO #44#)))))
                    (#43#
                     (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                          (LETT |res| NIL . #42#)
                          (SEQ (LETT |i| NIL . #42#) (LETT #3# |vrs| . #42#)
                               G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |i| (CAR #3#) . #42#) NIL))
                                 (GO G191)))
                               (SEQ
                                (COND
                                 ((QEQCAR |i| 0)
                                  (LETT |nt|
                                        (VECTOR (QCDR |i|) 1
                                                (|spadConstant| $ 19) |r|)
                                        . #42#))
                                 ('T
                                  (SEQ (LETT |ir| (QCDR |i|) . #42#)
                                       (EXIT
                                        (LETT |nt|
                                              (VECTOR (QVELT |ir| 0)
                                                      (QVELT |ir| 1)
                                                      (QVELT |ir| 2)
                                                      (SPADCALL |r|
                                                                (SPADCALL
                                                                 (|spadConstant|
                                                                  $ 12)
                                                                 1
                                                                 (QREFELT $
                                                                          58))
                                                                (QVELT |ir| 3)
                                                                (QREFELT $
                                                                         85)))
                                              . #42#)))))
                                (EXIT
                                 (LETT |res|
                                       (SPADCALL |res| (LIST (CONS 1 |nt|))
                                                 (QREFELT $ 224))
                                       . #42#)))
                               (LETT #3# (CDR #3#) . #42#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (PROGN
                            (LETT #1# (CONS 1 |res|) . #42#)
                            (GO #44#)))))))))))))))
          #44# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfr;LodoMSU;32|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (|LODOF2;factor_riccati| (|LODOF2;convertL3toLL| |f| $) |factorizer|
         |option| $)) 

(SDEFUN |LODOF2;substitute|
        ((|a| |Union| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|f| |Union|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))
          (|Record|
           (|:| |ope|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |dext| (|PositiveInteger|))
           (|:| |alpha| (|Expression| (|Integer|)))
           (|:| |rami|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         ($ |Union|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))
          (|Record|
           (|:| |ope|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |dext| (|PositiveInteger|))
           (|:| |alpha| (|Expression| (|Integer|)))
           (|:| |rami|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G1262 NIL)
          (|fr|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|fl|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|ftmp|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|new_mon|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |new_mon| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 34))
                  . #2=(|LODOF2;substitute|))
            (COND
             ((QEQCAR |a| 0)
              (LETT |new_mon|
                    (SPADCALL |new_mon|
                              (|LODOF2;convertL3toLL|
                               (SPADCALL (SPADCALL (QCDR |a|) (QREFELT $ 232))
                                         (QREFELT $ 233))
                               $)
                              (QREFELT $ 35))
                    . #2#))
             (#3='T
              (LETT |new_mon|
                    (SPADCALL |new_mon| (SPADCALL (QCDR |a|) (QREFELT $ 201))
                              (QREFELT $ 35))
                    . #2#)))
            (COND ((QEQCAR |f| 0) (LETT |ftmp| (QCDR |f|) . #2#))
                  (#3#
                   (SEQ (LETT |fr| (QCDR |f|) . #2#)
                        (LETT |ftmp| (QVELT |fr| 0) . #2#)
                        (EXIT
                         (LETT |new_mon|
                               (|LODOF2;ramification_of| |new_mon|
                                (SPADCALL (QVELT |fr| 3) (QREFELT $ 192))
                                (SPADCALL (QVELT |fr| 3) (QREFELT $ 75)) $)
                               . #2#)))))
            (LETT |res| (|spadConstant| $ 18) . #2#)
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                   (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)) . #2#)
                      (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)) . #2#)
                      (LETT |res|
                            (SPADCALL |res|
                                      (SPADCALL |lc|
                                                (SPADCALL |new_mon| |dg|
                                                          (QREFELT $ 234))
                                                (QREFELT $ 160))
                                      (QREFELT $ 35))
                            . #2#)
                      (EXIT
                       (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              ((QEQCAR |f| 0)
               (SEQ (LETT |fl| (QCDR |f|) . #2#)
                    (EXIT
                     (PROGN (LETT #1# (CONS 0 |res|) . #2#) (GO #4=#:G1261)))))
              (#3#
               (SEQ (LETT |fr| (QCDR |f|) . #2#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 1
                                  (VECTOR |res| (QVELT |fr| 1) (QVELT |fr| 2)
                                          (QVELT |fr| 3)))
                            . #2#)
                      (GO #4#)))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |LODOF2;testsb;ULodoLodo;34|
        ((|a| |Union| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG ((#1=#:G793 NIL))
               (PROG2
                   (LETT #1#
                         (|LODOF2;substitute| |a|
                          (CONS 0 (|LODOF2;convertL3toLL| |f| $)) $)
                         |LODOF2;testsb;ULodoLodo;34|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|LinearOrdinaryDifferentialOperator3|
                                  (|Expression| (|Integer|))
                                  (|UnivariateTaylorSeries|
                                   (|Expression| (|Integer|)) (QREFELT $ 6)
                                   (QREFELT $ 7))
                                  (|UnivariateLaurentSeries|
                                   (|Expression| (|Integer|)) (QREFELT $ 6)
                                   (QREFELT $ 7)))
                                 (|Union|
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) (QREFELT $ 6)
                                    (QREFELT $ 7))
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) (QREFELT $ 6)
                                    (QREFELT $ 7)))
                                  (|Record|
                                   (|:| |ope|
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7))
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7))))
                                   (|:| |dext| (|PositiveInteger|))
                                   (|:| |alpha| (|Expression| (|Integer|)))
                                   (|:| |rami|
                                        (|UnivariatePolynomial| (QREFELT $ 6)
                                                                (|Expression|
                                                                 (|Integer|))))))
                                 #1#)))) 

(SDEFUN |LODOF2;ramification_of|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         (|coefr| |Expression| (|Integer|)) (|n| |PositiveInteger|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|ftmp| #1#)
          (|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|mlc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#2=#:G1275 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |coefr| (|spadConstant| $ 12) (QREFELT $ 237))
              (COND
               ((EQL |n| 1)
                (PROGN
                 (LETT #2# |f| . #3=(|LODOF2;ramification_of|))
                 (GO #4=#:G1274))))))
            (LETT |res| (|spadConstant| $ 18) . #3#) (LETT |ftmp| |f| . #3#)
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                   (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)) . #3#)
                      (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)) . #3#)
                      (LETT |mlc|
                            (SPADCALL
                             (CONS #'|LODOF2;ramification_of!0|
                                   (VECTOR $ |coefr|))
                             |lc| (QREFELT $ 239))
                            . #3#)
                      (LETT |mlc| (SPADCALL |mlc| |n| (QREFELT $ 240)) . #3#)
                      (LETT |extra|
                            (SPADCALL (SPADCALL |mlc| |dg| (QREFELT $ 34))
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL 1 |n| (QREFELT $ 51)) |dg|
                                         (QREFELT $ 241))
                                        (QREFELT $ 242))
                                       (QREFELT $ 193))
                                      (QREFELT $ 150))
                            . #3#)
                      (LETT |res| (SPADCALL |res| |extra| (QREFELT $ 35))
                            . #3#)
                      (EXIT
                       (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)) . #3#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (SPADCALL (EXPT |n| (SPADCALL |f| (QREFELT $ 41))) |res|
                       (QREFELT $ 243)))))
          #4# (EXIT #2#)))) 

(SDEFUN |LODOF2;ramification_of!0| ((|x| NIL) ($$ NIL))
        (PROG (|coefr| $)
          (LETT |coefr| (QREFELT $$ 1) . #1=(|LODOF2;ramification_of|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |coefr| |x| (QREFELT $ 228)))))) 

(SDEFUN |LODOF2;testro;LodoEPiLodo;36|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|coefr| |Expression| (|Integer|)) (|n| |PositiveInteger|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;ramification_of| (|LODOF2;convertL3toLL| |f| $) |coefr| |n| $)) 

(SDEFUN |LODOF2;factor_op|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (SPROG
         ((#1=#:G1294 NIL)
          (|res|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#2=#:G1280 NIL) (#3=#:G1296 NIL) (|i| NIL) (#4=#:G1279 NIL)
          (#5=#:G1295 NIL)
          (|fnr|
           (|List|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fnr| (|LODOF2;factor_newton| |f| |factorizer| |option| $)
                  . #6=(|LODOF2;factor_op|))
            (EXIT
             (COND
              ((EQUAL |option| "semireg")
               (SEQ (LETT |res| NIL . #6#)
                    (SEQ (LETT |i| NIL . #6#) (LETT #5# |fnr| . #6#) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |i| (CAR #5#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (PROG2
                                               (LETT #4#
                                                     (|LODOF2;factor_riccati|
                                                      |i| |factorizer| |option|
                                                      $)
                                                     . #6#)
                                               (QCDR #4#)
                                             (|check_union2| (QEQCAR #4# 0)
                                                             (|List|
                                                              (|Record|
                                                               (|:| |op|
                                                                    (|LinearOrdinaryDifferentialOperator3|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (|UnivariateTaylorSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7))
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7))))
                                                               (|:| |ram|
                                                                    (|UnivariatePolynomial|
                                                                     (QREFELT $
                                                                              6)
                                                                     (|Expression|
                                                                      (|Integer|))))
                                                               (|:| |expart|
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7)))))
                                                             (|Union|
                                                              (|List|
                                                               (|Record|
                                                                (|:| |op|
                                                                     (|LinearOrdinaryDifferentialOperator3|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (|UnivariateTaylorSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))
                                                                      (|UnivariateLaurentSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))))
                                                                (|:| |ram|
                                                                     (|UnivariatePolynomial|
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (|Expression|
                                                                       (|Integer|))))
                                                                (|:| |expart|
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7)))))
                                                              (|List|
                                                               (|Union|
                                                                (|LinearOrdinaryDifferentialOperator3|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|UnivariateTaylorSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7))
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7)))
                                                                (|Record|
                                                                 (|:| |ope|
                                                                      (|LinearOrdinaryDifferentialOperator3|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (|UnivariateTaylorSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         $ 6)
                                                                        (QREFELT
                                                                         $ 7))
                                                                       (|UnivariateLaurentSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         $ 6)
                                                                        (QREFELT
                                                                         $
                                                                         7))))
                                                                 (|:| |dext|
                                                                      (|PositiveInteger|))
                                                                 (|:| |alpha|
                                                                      (|Expression|
                                                                       (|Integer|)))
                                                                 (|:| |rami|
                                                                      (|UnivariatePolynomial|
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (|Expression|
                                                                        (|Integer|))))))))
                                                             #4#))
                                           (QREFELT $ 221))
                                 . #6#)))
                         (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (PROGN (LETT #1# (CONS 0 |res|) . #6#) (GO #7=#:G1293)))))
              ('T
               (SEQ (LETT |res| NIL . #6#)
                    (SEQ (LETT |i| NIL . #6#) (LETT #3# |fnr| . #6#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |i| (CAR #3#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (PROG2
                                               (LETT #2#
                                                     (|LODOF2;factor_riccati|
                                                      |i| |factorizer| |option|
                                                      $)
                                                     . #6#)
                                               (QCDR #2#)
                                             (|check_union2| (QEQCAR #2# 1)
                                                             (|List|
                                                              (|Union|
                                                               (|LinearOrdinaryDifferentialOperator3|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (|UnivariateTaylorSeries|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (QREFELT $ 6)
                                                                 (QREFELT $ 7))
                                                                (|UnivariateLaurentSeries|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (QREFELT $ 6)
                                                                 (QREFELT $
                                                                          7)))
                                                               (|Record|
                                                                (|:| |ope|
                                                                     (|LinearOrdinaryDifferentialOperator3|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (|UnivariateTaylorSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))
                                                                      (|UnivariateLaurentSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))))
                                                                (|:| |dext|
                                                                     (|PositiveInteger|))
                                                                (|:| |alpha|
                                                                     (|Expression|
                                                                      (|Integer|)))
                                                                (|:| |rami|
                                                                     (|UnivariatePolynomial|
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (|Expression|
                                                                       (|Integer|)))))))
                                                             (|Union|
                                                              (|List|
                                                               (|Record|
                                                                (|:| |op|
                                                                     (|LinearOrdinaryDifferentialOperator3|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (|UnivariateTaylorSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))
                                                                      (|UnivariateLaurentSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))))
                                                                (|:| |ram|
                                                                     (|UnivariatePolynomial|
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (|Expression|
                                                                       (|Integer|))))
                                                                (|:| |expart|
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7)))))
                                                              (|List|
                                                               (|Union|
                                                                (|LinearOrdinaryDifferentialOperator3|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|UnivariateTaylorSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7))
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7)))
                                                                (|Record|
                                                                 (|:| |ope|
                                                                      (|LinearOrdinaryDifferentialOperator3|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (|UnivariateTaylorSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         $ 6)
                                                                        (QREFELT
                                                                         $ 7))
                                                                       (|UnivariateLaurentSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         $ 6)
                                                                        (QREFELT
                                                                         $
                                                                         7))))
                                                                 (|:| |dext|
                                                                      (|PositiveInteger|))
                                                                 (|:| |alpha|
                                                                      (|Expression|
                                                                       (|Integer|)))
                                                                 (|:| |rami|
                                                                      (|UnivariatePolynomial|
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (|Expression|
                                                                        (|Integer|))))))))
                                                             #2#))
                                           (QREFELT $ 224))
                                 . #6#)))
                         (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (PROGN (LETT #1# (CONS 1 |res|) . #6#) (GO #7#)))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfo;LodoMSU;38|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (|LODOF2;factor_op| (|LODOF2;convertL3toLL| |f| $) |factorizer|
         |option| $)) 

(SDEFUN |LODOF2;make_rightfactor|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|ric| |Record|
          (|:| |ope|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dext| (|PositiveInteger|))
          (|:| |alpha| (|Expression| (|Integer|)))
          (|:| |rami|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG ((#1=#:G1306 NIL) (|d| (|PositiveInteger|)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |d| (SPADCALL (QVELT |ric| 3) (QREFELT $ 75))
                        . #2=(|LODOF2;make_rightfactor|))
                  (LETT |d| (* |d| (QVELT |ric| 1)) . #2#)
                  (COND
                   ((EQL |d| (SPADCALL |f| (QREFELT $ 41)))
                    (PROGN (LETT #1# |f| . #2#) (GO #3=#:G1305))))
                  (EXIT (|LODOF2;lift_rightfactor| |d| |ric| $))))
                #3# (EXIT #1#)))) 

(SDEFUN |LODOF2;lift_rightfactor|
        ((|order| |PositiveInteger|)
         (|ric| |Record|
          (|:| |ope|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dext| (|PositiveInteger|))
          (|:| |alpha| (|Expression| (|Integer|)))
          (|:| |rami|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#1=#:G1399 NIL) (|i| NIL)
          (|num|
           #2=(|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                         |cen|))
          (#3=#:G1398 NIL)
          (|coefs|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#4=#:G1397 NIL) (#5=#:G1396 NIL) (|den| #2#) (#6=#:G1395 NIL)
          (|k| NIL) (#7=#:G1394 NIL) (|j| NIL) (#8=#:G1393 NIL)
          (|nums|
           (|List|
            (|SquareMatrix| |order|
                            (|UnivariateLaurentSeries|
                             (|Expression| (|Integer|)) |var| |cen|))))
          (#9=#:G1392 NIL) (#10=#:G1391 NIL)
          (|denm|
           (|SquareMatrix| |order|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
          (#11=#:G1390 NIL) (#12=#:G1389 NIL)
          (|ll|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#13=#:G1388 NIL) (#14=#:G1387 NIL) (#15=#:G1386 NIL)
          (#16=#:G1385 NIL)
          (|nsr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#17=#:G1384 NIL)
          (|ser|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#18=#:G1383 NIL) (#19=#:G1382 NIL)
          (|pa| (|Vector| (|Expression| (|Integer|)))) (#20=#:G1381 NIL)
          (#21=#:G1380 NIL)
          (|system|
           (|List|
            (|Vector|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#22=#:G1379 NIL) (#23=#:G1378 NIL)
          (|cst|
           (|Stream|
            (|Record| (|:| |k| (|Integer|))
                      (|:| |c| (|Expression| (|Integer|))))))
          (#24=#:G1377 NIL) (#25=#:G1376 NIL)
          (|nn| (|Stream| (|NonNegativeInteger|)))
          (|sysram|
           (|List|
            (|Vector|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#26=#:G1375 NIL) (#27=#:G1374 NIL) (|mindg| (|Integer|))
          (|rp|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#28=#:G1373 NIL)
          (|s|
           (|Vector|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (|r|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ram| (|NonNegativeInteger|)) (|cric| (|Expression| (|Integer|))))
         (SEQ
          (LETT |cric| (SPADCALL (QVELT |ric| 3) (QREFELT $ 192))
                . #29=(|LODOF2;lift_rightfactor|))
          (LETT |ram| (SPADCALL (QVELT |ric| 3) (QREFELT $ 75)) . #29#)
          (LETT |r|
                (SPADCALL (SPADCALL (QVELT |ric| 0) 0 (QREFELT $ 54))
                          (QREFELT $ 211))
                . #29#)
          (LETT |rp| (|spadConstant| $ 14) . #29#)
          (LETT |s| (MAKEARR1 (+ |order| 1) (|spadConstant| $ 20)) . #29#)
          (SPADCALL |s| 1 (|spadConstant| $ 14) (QREFELT $ 247))
          (LETT |mindg| 0 . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #28# |order| . #29#) G190
               (COND ((|greater_SI| |i| #28#) (GO G191)))
               (SEQ
                (LETT |rp|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL (QREFELT $ 248))
                                  (|spadConstant| $ 20) |rp| (QREFELT $ 249))
                        (SPADCALL |r| |rp| (QREFELT $ 250)) (QREFELT $ 218))
                       (SPADCALL |ram| (QREFELT $ 78)) (QREFELT $ 251))
                      . #29#)
                (SPADCALL |s| (+ |i| 1) |rp| (QREFELT $ 247))
                (EXIT
                 (LETT |mindg| (MIN |mindg| (SPADCALL |rp| 0 (QREFELT $ 42)))
                       . #29#)))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (SPADCALL (CONS #'|LODOF2;lift_rightfactor!0| (VECTOR |mindg| $)) |s|
                    (QREFELT $ 254))
          (LETT |sysram|
                (PROGN
                 (LETT #27# NIL . #29#)
                 (SEQ (LETT |i| 1 . #29#) (LETT #26# |ram| . #29#) G190
                      (COND ((|greater_SI| |i| #26#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #27#
                              (CONS
                               (MAKEARR1 (+ |order| 1) (|spadConstant| $ 20))
                               #27#)
                              . #29#)))
                      (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #27#))))
                . #29#)
          (LETT |nn|
                (SPADCALL (CONS #'|LODOF2;lift_rightfactor!1| $) 0
                          (QREFELT $ 258))
                . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #25# |ram| . #29#) G190
               (COND ((|greater_SI| |i| #25#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #29#) (LETT #24# (+ |order| 1) . #29#) G190
                      (COND ((|greater_SI| |j| #24#) (GO G191)))
                      (SEQ
                       (LETT |ser| (SPADCALL |s| |j| (QREFELT $ 259)) . #29#)
                       (LETT |cst|
                             (SPADCALL
                              (CONS #'|LODOF2;lift_rightfactor!2|
                                    (VECTOR |cric| |ser| |ram| $ |i|))
                              |nn| (QREFELT $ 264))
                             . #29#)
                       (EXIT
                        (SPADCALL (SPADCALL |sysram| |i| (QREFELT $ 266)) |j|
                                  (SPADCALL |cst| (QREFELT $ 122))
                                  (QREFELT $ 247))))
                      (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |system|
                (PROGN
                 (LETT #23# NIL . #29#)
                 (SEQ (LETT |i| 1 . #29#) (LETT #22# |order| . #29#) G190
                      (COND ((|greater_SI| |i| #22#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #23#
                              (CONS
                               (MAKEARR1 (+ |order| 1) (|spadConstant| $ 20))
                               #23#)
                              . #29#)))
                      (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #23#))))
                . #29#)
          (LETT |pa|
                (PROGN
                 (LETT #21# (GETREFV #30=(QVELT |ric| 1)) . #29#)
                 (SEQ (LETT |i| 0 . #29#) (LETT #20# (- #30# 1) . #29#) G190
                      (COND ((|greater_SI| |i| #20#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #21# |i|
                                (SPADCALL (QVELT |ric| 2) |i|
                                          (QREFELT $ 228)))))
                      (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191
                      (EXIT NIL))
                 #21#)
                . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #19# |ram| . #29#) G190
               (COND ((|greater_SI| |i| #19#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #29#) (LETT #18# (+ |order| 1) . #29#) G190
                      (COND ((|greater_SI| |j| #18#) (GO G191)))
                      (SEQ
                       (LETT |ser|
                             (SPADCALL (SPADCALL |sysram| |i| (QREFELT $ 266))
                                       |j| (QREFELT $ 259))
                             . #29#)
                       (EXIT
                        (SEQ (LETT |k| 1 . #29#)
                             (LETT #17# (QVELT |ric| 1) . #29#) G190
                             (COND ((|greater_SI| |k| #17#) (GO G191)))
                             (SEQ
                              (LETT |nsr|
                                    (SPADCALL
                                     (CONS #'|LODOF2;lift_rightfactor!3|
                                           (VECTOR |k| $ |pa|))
                                     |ser| (QREFELT $ 275))
                                    . #29#)
                              (EXIT
                               (SPADCALL
                                (SPADCALL |system|
                                          (+ (* (- |i| 1) (QVELT |ric| 1)) |k|)
                                          (QREFELT $ 266))
                                |j| |nsr| (QREFELT $ 247))))
                             (LETT |k| (|inc_SI| |k|) . #29#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |ll|
                (PROGN
                 (LETT #16# NIL . #29#)
                 (SEQ (LETT |j| 1 . #29#) (LETT #15# |order| . #29#) G190
                      (COND ((|greater_SI| |j| #15#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16#
                              (CONS
                               (PROGN
                                (LETT #14# NIL . #29#)
                                (SEQ (LETT |i| 1 . #29#)
                                     (LETT #13# |order| . #29#) G190
                                     (COND ((|greater_SI| |i| #13#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #14#
                                             (CONS (|spadConstant| $ 20) #14#)
                                             . #29#)))
                                     (LETT |i| (|inc_SI| |i|) . #29#) (GO G190)
                                     G191 (EXIT (NREVERSE #14#))))
                               #16#)
                              . #29#)))
                      (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #12# |order| . #29#) G190
               (COND ((|greater_SI| |i| #12#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #29#) (LETT #11# |order| . #29#) G190
                      (COND ((|greater_SI| |j| #11#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL (SPADCALL |ll| |i| (QREFELT $ 277)) |j|
                                  (SPADCALL
                                   (SPADCALL |system| |i| (QREFELT $ 266)) |j|
                                   (QREFELT $ 259))
                                  (QREFELT $ 278))))
                      (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |denm|
                (SPADCALL (SPADCALL |ll| (QREFELT $ 280))
                          (|compiledLookupCheck| '|squareMatrix|
                                                 (LIST '$
                                                       (LIST '|Matrix|
                                                             (LIST
                                                              '|UnivariateLaurentSeries|
                                                              (LIST
                                                               '|Expression|
                                                               (LIST
                                                                '|Integer|))
                                                              (|devaluate|
                                                               (ELT $ 6))
                                                              (|devaluate|
                                                               (ELT $ 7)))))
                                                 (|SquareMatrix| |order|
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (ELT $ 6)
                                                                  (ELT $ 7)))))
                . #29#)
          (LETT |nums|
                (PROGN
                 (LETT #10# NIL . #29#)
                 (SEQ (LETT |i| 1 . #29#) (LETT #9# |order| . #29#) G190
                      (COND ((|greater_SI| |i| #9#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10#
                              (CONS
                               (SPADCALL
                                (|compiledLookupCheck| '|empty| (LIST '$)
                                                       (|SquareMatrix| |order|
                                                                       (|UnivariateLaurentSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (ELT $
                                                                             6)
                                                                        (ELT $
                                                                             7)))))
                               #10#)
                              . #29#)))
                      (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #8# |order| . #29#) G190
               (COND ((|greater_SI| |i| #8#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| 1 . #29#) (LETT #7# |order| . #29#) G190
                     (COND ((|greater_SI| |j| #7#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |k| 1 . #29#) (LETT #6# |order| . #29#) G190
                            (COND ((|greater_SI| |k| #6#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL |k| |i|)
                                (SPADCALL (SPADCALL |ll| |j| (QREFELT $ 277))
                                          |k|
                                          (SPADCALL
                                           (SPADCALL |system| |j|
                                                     (QREFELT $ 266))
                                           (+ |order| 1) (QREFELT $ 259))
                                          (QREFELT $ 278)))
                               ('T
                                (SPADCALL (SPADCALL |ll| |j| (QREFELT $ 277))
                                          |k|
                                          (SPADCALL
                                           (SPADCALL |system| |j|
                                                     (QREFELT $ 266))
                                           |k| (QREFELT $ 259))
                                          (QREFELT $ 278))))))
                            (LETT |k| (|inc_SI| |k|) . #29#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |nums| |i|
                           (SPADCALL (SPADCALL |ll| (QREFELT $ 280))
                                     (|compiledLookupCheck| '|squareMatrix|
                                                            (LIST '$
                                                                  (LIST
                                                                   '|Matrix|
                                                                   (LIST
                                                                    '|UnivariateLaurentSeries|
                                                                    (LIST
                                                                     '|Expression|
                                                                     (LIST
                                                                      '|Integer|))
                                                                    (|devaluate|
                                                                     (ELT $ 6))
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7)))))
                                                            (|SquareMatrix|
                                                             |order|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (ELT $ 6)
                                                              (ELT $ 7)))))
                           (|compiledLookupCheck| '|setelt!|
                                                  (LIST
                                                   (LIST '|SquareMatrix|
                                                         |order|
                                                         (LIST
                                                          '|UnivariateLaurentSeries|
                                                          (LIST '|Expression|
                                                                (LIST
                                                                 '|Integer|))
                                                          (|devaluate|
                                                           (ELT $ 6))
                                                          (|devaluate|
                                                           (ELT $ 7))))
                                                   '$ (LIST '|Integer|)
                                                   (LIST '|SquareMatrix|
                                                         |order|
                                                         (LIST
                                                          '|UnivariateLaurentSeries|
                                                          (LIST '|Expression|
                                                                (LIST
                                                                 '|Integer|))
                                                          (|devaluate|
                                                           (ELT $ 6))
                                                          (|devaluate|
                                                           (ELT $ 7)))))
                                                  (|List|
                                                   (|SquareMatrix| |order|
                                                                   (|UnivariateLaurentSeries|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (ELT $ 6)
                                                                    (ELT $
                                                                         7))))))))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |den|
                (SPADCALL |denm|
                          (|compiledLookupCheck| '|minordet|
                                                 (LIST
                                                  (LIST
                                                   '|UnivariateLaurentSeries|
                                                   (LIST '|Expression|
                                                         (LIST '|Integer|))
                                                   (|devaluate| (ELT $ 6))
                                                   (|devaluate| (ELT $ 7)))
                                                  '$)
                                                 (|SquareMatrix| |order|
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (ELT $ 6)
                                                                  (ELT $ 7)))))
                . #29#)
          (LETT |coefs|
                (PROGN
                 (LETT #5# NIL . #29#)
                 (SEQ (LETT |i| 1 . #29#) (LETT #4# |order| . #29#) G190
                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5# (CONS (|spadConstant| $ 20) #5#) . #29#)))
                      (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #3# |order| . #29#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (LETT |num|
                      (SPADCALL
                       (SPADCALL |nums| |i|
                                 (|compiledLookupCheck| '|elt|
                                                        (LIST
                                                         (LIST '|SquareMatrix|
                                                               |order|
                                                               (LIST
                                                                '|UnivariateLaurentSeries|
                                                                (LIST
                                                                 '|Expression|
                                                                 (LIST
                                                                  '|Integer|))
                                                                (|devaluate|
                                                                 (ELT $ 6))
                                                                (|devaluate|
                                                                 (ELT $ 7))))
                                                         '$ (LIST '|Integer|))
                                                        (|List|
                                                         (|SquareMatrix|
                                                          |order|
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (ELT $ 6)
                                                           (ELT $ 7))))))
                       (|compiledLookupCheck| '|minordet|
                                              (LIST
                                               (LIST '|UnivariateLaurentSeries|
                                                     (LIST '|Expression|
                                                           (LIST '|Integer|))
                                                     (|devaluate| (ELT $ 6))
                                                     (|devaluate| (ELT $ 7)))
                                               '$)
                                              (|SquareMatrix| |order|
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (ELT $ 6)
                                                               (ELT $ 7)))))
                      . #29#)
                (EXIT
                 (SPADCALL |coefs| |i|
                           (SPADCALL (SPADCALL |num| |den| (QREFELT $ 252))
                                     (QREFELT $ 211))
                           (QREFELT $ 278))))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |res| (SPADCALL (|spadConstant| $ 14) |order| (QREFELT $ 34))
                . #29#)
          (SEQ (LETT |i| 0 . #29#) (LETT #1# (- |order| 1) . #29#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL
                                  (SPADCALL |coefs| (+ |i| 1) (QREFELT $ 115))
                                  |i| (QREFELT $ 34))
                                 (QREFELT $ 35))
                       . #29#)))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;lift_rightfactor!3| ((|x| NIL) ($$ NIL))
        (PROG (|pa| $ |k|)
          (LETT |pa| (QREFELT $$ 2) . #1=(|LODOF2;lift_rightfactor|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G1331 NIL) (|psq| NIL))
                   (SEQ (LETT |psq| (SPADCALL |pa| |x| (QREFELT $ 270)) NIL)
                        (EXIT
                         (COND
                          ((SPADCALL |psq| (CONS 1 "failed") (QREFELT $ 271))
                           |x|)
                          ('T
                           (SPADCALL
                            (SPADCALL
                             (PROG2 (LETT #2# |psq| NIL)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|Vector|
                                                (|Fraction| (|Integer|)))
                                               (|Union|
                                                (|Vector|
                                                 (|Fraction| (|Integer|)))
                                                "failed")
                                               #2#))
                             |k| (QREFELT $ 273))
                            (QREFELT $ 242))))))))))) 

(SDEFUN |LODOF2;lift_rightfactor!2| ((|x| NIL) ($$ NIL))
        (PROG (|i| $ |ram| |ser| |cric|)
          (LETT |i| (QREFELT $$ 4) . #1=(|LODOF2;lift_rightfactor|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |ram| (QREFELT $$ 2) . #1#)
          (LETT |ser| (QREFELT $$ 1) . #1#)
          (LETT |cric| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|dg| NIL))
                   (SEQ
                    (LETT |dg|
                          (SPADCALL
                           (SPADCALL |i| (|spadConstant| $ 175)
                                     (QREFELT $ 138))
                           (SPADCALL |x| |ram| (QREFELT $ 260))
                           (QREFELT $ 134))
                          NIL)
                    (EXIT
                     (CONS |x|
                           (SPADCALL (SPADCALL |ser| |dg| (QREFELT $ 57))
                                     (SPADCALL |cric| |x| (QREFELT $ 261))
                                     (QREFELT $ 79)))))))))) 

(SDEFUN |LODOF2;lift_rightfactor!1| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 175) (QREFELT $ 255))) 

(SDEFUN |LODOF2;lift_rightfactor!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |mindg|)
          (LETT $ (QREFELT $$ 1) . #1=(|LODOF2;lift_rightfactor|))
          (LETT |mindg| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x|
                      (SPADCALL (|spadConstant| $ 12) |mindg| (QREFELT $ 149))
                      (QREFELT $ 252)))))) 

(SDEFUN |LODOF2;same_charclass?|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|g| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G1435 NIL) (#2=#:G1438 NIL) (|i| NIL)
          (|fff|
           (|List|
            (|Record|
             (|:| |factor|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|Integer|)))))
          (|ffnp|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|ff|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#3=#:G793 NIL)
          (|gr| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|rr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|gg|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#4=#:G794 NIL) (#5=#:G1423 NIL)
          (|r|
           (|List|
            (|List|
             (|Record|
              (|:| |point|
                   (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
              (|:| |slope| (|Fraction| (|Integer|)))
              (|:| |npoly|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#6=#:G1437 NIL) (|j| NIL) (#7=#:G1436 NIL)
          (|cx| (|Expression| (|Integer|))) (|fd| (|Expression| (|Integer|)))
          (|dm1| (|NonNegativeInteger|)) (|d| (|NonNegativeInteger|))
          (|c2| #8=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|c| #8#)
          (|r21|
           #9=(|Record|
               (|:| |point|
                    (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
               (|:| |slope| (|Fraction| (|Integer|)))
               (|:| |npoly|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (|r11| #9#)
          (|il|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 41))
                        (SPADCALL |g| (QREFELT $ 41)) (QREFELT $ 204))
              (PROGN
               (LETT #1# NIL . #10=(|LODOF2;same_charclass?|))
               (GO #11=#:G1434))))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 37)) (|spadConstant| $ 14)
                        (QREFELT $ 281))
              (LETT |f|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 14)
                               (SPADCALL |f| (QREFELT $ 37)) (QREFELT $ 252))
                     |f| (QREFELT $ 160))
                    . #10#)))
            (COND
             ((SPADCALL (SPADCALL |g| (QREFELT $ 37)) (|spadConstant| $ 14)
                        (QREFELT $ 281))
              (LETT |g|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 14)
                               (SPADCALL |g| (QREFELT $ 37)) (QREFELT $ 252))
                     |g| (QREFELT $ 160))
                    . #10#)))
            (COND
             ((EQL (SPADCALL |f| (QREFELT $ 41)) 1)
              (SEQ
               (LETT |il|
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| |g| (QREFELT $ 168)) 0
                                (QREFELT $ 54))
                      0 (QREFELT $ 210))
                     . #10#)
               (EXIT
                (PROGN
                 (LETT #1#
                       (COND
                        ((EQL (SPADCALL |il| 0 (QREFELT $ 42)) 0)
                         (SPADCALL (SPADCALL |il| 0 (QREFELT $ 57))
                                   (QREFELT $ 81)))
                        ('T NIL))
                       . #10#)
                 (GO #11#))))))
            (LETT |r|
                  (SPADCALL (CONS (|function| |LODOF2;newtonpolygon|) $)
                            (LIST |f| |g|) (QREFELT $ 289))
                  . #10#)
            (LETT |r11|
                  (SPADCALL (SPADCALL |r| 1 (QREFELT $ 290)) 1 (QREFELT $ 196))
                  . #10#)
            (LETT |r21|
                  (SPADCALL (SPADCALL |r| 2 (QREFELT $ 290)) 1 (QREFELT $ 196))
                  . #10#)
            (COND
             ((SPADCALL (QVELT |r11| 1) (|spadConstant| $ 68) (QREFELT $ 111))
              (SEQ (LETT |c| (QVELT |r11| 2) . #10#)
                   (LETT |c2| (QVELT |r21| 2) . #10#)
                   (LETT |d| (SPADCALL |c| (QREFELT $ 75)) . #10#)
                   (LETT |dm1| (- |d| 1) . #10#)
                   (LETT |fd| (SPADCALL |d| (QREFELT $ 78)) . #10#)
                   (LETT |cx|
                         (SPADCALL
                          (SPADCALL (SPADCALL |c| |dm1| (QREFELT $ 76))
                                    (SPADCALL |c2| |dm1| (QREFELT $ 76))
                                    (QREFELT $ 77))
                          |fd| (QREFELT $ 79))
                         . #10#)
                   (COND
                    ((NULL (SPADCALL |cx| (QREFELT $ 81)))
                     (PROGN (LETT #1# NIL . #10#) (GO #11#))))
                   (EXIT
                    (LETT |r|
                          (LIST
                           (CONS
                            (VECTOR (QVELT |r11| 0) (QVELT |r11| 1)
                                    (SPADCALL (QVELT |r11| 2)
                                              (SPADCALL (|spadConstant| $ 12) 1
                                                        (QREFELT $ 58))
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| $ 12)
                                                         1 (QREFELT $ 58))
                                               (SPADCALL |cx| (QREFELT $ 227))
                                               (QREFELT $ 86))
                                              (QREFELT $ 85)))
                            (PROGN
                             (LETT #7# NIL . #10#)
                             (SEQ (LETT |j| 2 . #10#)
                                  (LETT #6#
                                        (LENGTH
                                         (SPADCALL |r| 1 (QREFELT $ 290)))
                                        . #10#)
                                  G190
                                  (COND ((|greater_SI| |j| #6#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #7#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |r| 1 (QREFELT $ 290))
                                            |j| (QREFELT $ 196))
                                           #7#)
                                          . #10#)))
                                  (LETT |j| (|inc_SI| |j|) . #10#) (GO G190)
                                  G191 (EXIT (NREVERSE #7#)))))
                           (SPADCALL |r| 2 (QREFELT $ 290)))
                          . #10#)))))
            (COND
             ((SPADCALL (SPADCALL |r| 1 (QREFELT $ 290))
                        (SPADCALL |r| 2 (QREFELT $ 290)) (QREFELT $ 291))
              (PROGN (LETT #1# NIL . #10#) (GO #11#))))
            (LETT |gg|
                  (PROG2
                      (LETT #4#
                            (SPADCALL
                             (PROG2
                                 (LETT #5#
                                       (|LODOF2;factor_op| |g| |factorizer|
                                        "alg factor" $)
                                       . #10#)
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 1)
                                               (|List|
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|)))))))
                                               (|Union|
                                                (|List|
                                                 (|Record|
                                                  (|:| |op|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |ram|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))
                                                  (|:| |expart|
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)))))
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))))
                                               #5#))
                             (QREFELT $ 200))
                            . #10#)
                      (QCDR #4#)
                    (|check_union2| (QEQCAR #4# 1)
                                    (|Record|
                                     (|:| |ope|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))))
                                     (|:| |dext| (|PositiveInteger|))
                                     (|:| |alpha| (|Expression| (|Integer|)))
                                     (|:| |rami|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|)))))
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                    #4#))
                  . #10#)
            (LETT |rr|
                  (SPADCALL
                   (SPADCALL (SPADCALL (QVELT |gg| 0) 0 (QREFELT $ 54)) 0
                             (QREFELT $ 210))
                   (QREFELT $ 211))
                  . #10#)
            (LETT |gr| (QVELT |gg| 3) . #10#)
            (LETT |ff|
                  (PROG2
                      (LETT #3#
                            (|LODOF2;substitute| (CONS 1 |rr|)
                             (CONS 0
                                   (|LODOF2;ramification_of| |f|
                                    (SPADCALL |gr| (QREFELT $ 192))
                                    (SPADCALL |gr| (QREFELT $ 75)) $))
                             $)
                            . #10#)
                      (QCDR #3#)
                    (|check_union2| (QEQCAR #3# 0)
                                    (|LinearOrdinaryDifferentialOperator3|
                                     (|Expression| (|Integer|))
                                     (|UnivariateTaylorSeries|
                                      (|Expression| (|Integer|)) (QREFELT $ 6)
                                      (QREFELT $ 7))
                                     (|UnivariateLaurentSeries|
                                      (|Expression| (|Integer|)) (QREFELT $ 6)
                                      (QREFELT $ 7)))
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                    #3#))
                  . #10#)
            (LETT |ffnp| (|LODOF2;newtonpolygon| |ff| $) . #10#)
            (COND
             ((SPADCALL (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 196)) 1)
                        (|spadConstant| $ 68) (QREFELT $ 69))
              (PROGN (LETT #1# NIL . #10#) (GO #11#))))
            (LETT |fff|
                  (SPADCALL
                   (|LODOF2;factorUP|
                    (SPADCALL (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 196)) 2)
                              (SPADCALL
                               (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 196)) 2)
                               (QREFELT $ 192))
                              (QREFELT $ 292))
                    |factorizer| $)
                   (QREFELT $ 67))
                  . #10#)
            (SEQ (LETT |i| NIL . #10#) (LETT #2# |fff| . #10#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #10#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (SPADCALL (QCAR |i|) (QREFELT $ 75)) 1)
                     (COND
                      ((SPADCALL
                        (SPADCALL (SPADCALL (QCAR |i|) 0 (QREFELT $ 76))
                                  (SPADCALL (QCAR |i|) 1 (QREFELT $ 76))
                                  (QREFELT $ 79))
                        (QREFELT $ 81))
                       (PROGN (LETT #1# 'T . #10#) (GO #11#))))))))
                 (LETT #2# (CDR #2#) . #10#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #11# (EXIT #1#)))) 

(SDEFUN |LODOF2;testsc;2LodoMB;42|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|g| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |Boolean|))
        (|LODOF2;same_charclass?| (|LODOF2;convertL3toLL| |f| $)
         (|LODOF2;convertL3toLL| |g| $) |factorizer| $)) 

(SDEFUN |LODOF2;try_factorization|
        ((|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|max_order| |Integer|) (|bound| |List| (|Fraction| (|Integer|)))
         (|sng| |Record|
          (|:| |point| (|Union| (|Expression| (|Integer|)) #1="infinity"))
          (|:| |lpf|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dxt| (|PositiveInteger|)))
         (|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|eb| |Integer|) (|min_order| |Integer|) (|option| |String|)
         ($ |Union|
          (|List|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          "failed"))
        (SPROG
         ((#2=#:G1487 NIL)
          (|re|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|srl|
           #3=(|LinearOrdinaryDifferentialOperator1|
               (|Fraction|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#4=#:G1462 NIL) (|ftmp| #3#)
          (|newd|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd|
           #5=(|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcn| #5#)
          (|newx|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|sr|
           #6=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariatePolynomial|
                                                      |var|
                                                      (|Expression|
                                                       (|Integer|)))
                                                     (|Fraction|
                                                      (|UnivariatePolynomial|
                                                       |var|
                                                       (|Expression|
                                                        (|Integer|))))))
          (#7=#:G1459 NIL) (#8=#:G1458 #6#) (#9=#:G1460 #6#) (#10=#:G1499 NIL)
          (|j| NIL)
          (|flm|
           (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (#11=#:G1453 NIL)
          (|tf2|
           (|Union|
            (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            #12="failed"))
          (|n| (|Integer|))
          (|flst|
           (|List|
            (|List|
             (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                       |cen|))))
          (#13=#:G1498 NIL) (|fc| NIL) (#14=#:G1497 NIL) (#15=#:G1496 NIL)
          (|ff| NIL) (#16=#:G1495 NIL)
          (|fls|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#17=#:G1494 NIL) (#18=#:G1493 NIL) (#19=#:G1492 NIL)
          (#20=#:G1491 NIL) (#21=#:G1490 NIL) (#22=#:G1489 NIL)
          (#23=#:G1488 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |i| (MAX (SPADCALL |r| (QREFELT $ 41)) |min_order|)
                   . #24=(|LODOF2;try_factorization|))
             (LETT #23# |max_order| . #24#) G190
             (COND ((> |i| #23#) (GO G191)))
             (SEQ (LETT |fls| (|LODOF2;flist| |r| |i| $) . #24#)
                  (LETT |n| 0 . #24#)
                  (SEQ (LETT |ff| NIL . #24#) (LETT #22# |fls| . #24#) G190
                       (COND
                        ((OR (ATOM #22#)
                             (PROGN (LETT |ff| (CAR #22#) . #24#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |fc| NIL . #24#) (LETT #21# |ff| . #24#)
                              G190
                              (COND
                               ((OR (ATOM #21#)
                                    (PROGN (LETT |fc| (CAR #21#) . #24#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |n|
                                      (MIN |n|
                                           (SPADCALL |fc| 0 (QREFELT $ 42)))
                                      . #24#)))
                              (LETT #21# (CDR #21#) . #24#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #22# (CDR #22#) . #24#) (GO G190) G191 (EXIT NIL))
                  (COND
                   ((< |n| 0)
                    (LETT |fls|
                          (PROGN
                           (LETT #20# NIL . #24#)
                           (SEQ (LETT |ff| NIL . #24#) (LETT #19# |fls| . #24#)
                                G190
                                (COND
                                 ((OR (ATOM #19#)
                                      (PROGN
                                       (LETT |ff| (CAR #19#) . #24#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #20#
                                        (CONS
                                         (PROGN
                                          (LETT #18# NIL . #24#)
                                          (SEQ (LETT |fc| NIL . #24#)
                                               (LETT #17# |ff| . #24#) G190
                                               (COND
                                                ((OR (ATOM #17#)
                                                     (PROGN
                                                      (LETT |fc| (CAR #17#)
                                                            . #24#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #18#
                                                       (CONS
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (|spadConstant| $ 12)
                                                          (- |n|)
                                                          (QREFELT $ 149))
                                                         |fc| (QREFELT $ 250))
                                                        #18#)
                                                       . #24#)))
                                               (LETT #17# (CDR #17#) . #24#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #18#))))
                                         #20#)
                                        . #24#)))
                                (LETT #19# (CDR #19#) . #24#) (GO G190) G191
                                (EXIT (NREVERSE #20#))))
                          . #24#)))
                  (LETT |flst|
                        (PROGN
                         (LETT #16# NIL . #24#)
                         (SEQ (LETT |ff| NIL . #24#) (LETT #15# |fls| . #24#)
                              G190
                              (COND
                               ((OR (ATOM #15#)
                                    (PROGN (LETT |ff| (CAR #15#) . #24#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #16#
                                      (CONS
                                       (PROGN
                                        (LETT #14# NIL . #24#)
                                        (SEQ (LETT |fc| NIL . #24#)
                                             (LETT #13# |ff| . #24#) G190
                                             (COND
                                              ((OR (ATOM #13#)
                                                   (PROGN
                                                    (LETT |fc| (CAR #13#)
                                                          . #24#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #14#
                                                     (CONS
                                                      (SPADCALL |fc|
                                                                (QREFELT $
                                                                         294))
                                                      #14#)
                                                     . #24#)))
                                             (LETT #13# (CDR #13#) . #24#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #14#))))
                                       #16#)
                                      . #24#)))
                              (LETT #15# (CDR #15#) . #24#) (GO G190) G191
                              (EXIT (NREVERSE #16#))))
                        . #24#)
                  (LETT |n| (LENGTH |flst|) . #24#)
                  (LETT |tf2|
                        (|LODOF2;try_factorization2| |flst| |n| |bound| |eb| $)
                        . #24#)
                  (EXIT
                   (COND
                    ((SPADCALL |tf2| (CONS 1 "failed") (QREFELT $ 296))
                     (SEQ
                      (LETT |flm|
                            (PROG2 (LETT #11# |tf2| . #24#)
                                (QCDR #11#)
                              (|check_union2| (QEQCAR #11# 0)
                                              (|List|
                                               (|SparseUnivariatePolynomial|
                                                (|Expression| (|Integer|))))
                                              (|Union|
                                               (|List|
                                                (|SparseUnivariatePolynomial|
                                                 (|Expression| (|Integer|))))
                                               #12#)
                                              #11#))
                            . #24#)
                      (LETT |sr|
                            (PROGN
                             (LETT #7# NIL . #24#)
                             (SEQ (LETT |j| 0 . #24#)
                                  (LETT #10# (- (LENGTH |flm|) 1) . #24#) G190
                                  (COND ((|greater_SI| |j| #10#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #9#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |flm| (+ |j| 1)
                                                        (QREFELT $ 298))
                                              (QREFELT $ 101))
                                             (QREFELT $ 232))
                                            (SPADCALL (|spadConstant| $ 299)
                                                      |j| (QREFELT $ 300))
                                            (QREFELT $ 301))
                                           . #24#)
                                     (COND
                                      (#7#
                                       (LETT #8#
                                             (SPADCALL #8# #9# (QREFELT $ 302))
                                             . #24#))
                                      ('T
                                       (PROGN
                                        (LETT #8# #9# . #24#)
                                        (LETT #7# 'T . #24#)))))))
                                  (LETT |j| (|inc_SI| |j|) . #24#) (GO G190)
                                  G191 (EXIT NIL))
                             (COND (#7# #8#) ('T (|spadConstant| $ 22))))
                            . #24#)
                      (LETT |sr|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 299)
                                       (SPADCALL |sr| (QREFELT $ 26))
                                       (QREFELT $ 305))
                             |sr| (QREFELT $ 301))
                            . #24#)
                      (COND
                       ((EQUAL |option| "use adjoint")
                        (LETT |sr| (SPADCALL |sr| (QREFELT $ 306)) . #24#)))
                      (LETT |srl| (SPADCALL |sr| (QREFELT $ 309)) . #24#)
                      (COND
                       ((QEQCAR (QVELT |sng| 0) 0)
                        (COND
                         ((NULL
                           (SPADCALL
                            (PROG2 (LETT #4# (QVELT |sng| 0) . #24#)
                                (QCDR #4#)
                              (|check_union2| (QEQCAR #4# 0)
                                              (|Expression| (|Integer|))
                                              (|Union|
                                               (|Expression| (|Integer|)) #1#)
                                              #4#))
                            (|spadConstant| $ 19) (QREFELT $ 237)))
                          (SEQ (LETT |ftmp| |srl| . #24#)
                               (LETT |srl| (|spadConstant| $ 310) . #24#)
                               (EXIT
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (SPADCALL |ftmp| (|spadConstant| $ 310)
                                                  (QREFELT $ 311)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |lc|
                                            (SPADCALL |ftmp| (QREFELT $ 312))
                                            . #24#)
                                      (LETT |dg|
                                            (SPADCALL |ftmp| (QREFELT $ 313))
                                            . #24#)
                                      (COND
                                       ((SPADCALL (QVELT |sng| 0)
                                                  (CONS 1 #25="infinity")
                                                  (QREFELT $ 315))
                                        (LETT |newx|
                                              (SPADCALL (|spadConstant| $ 153)
                                                        (SPADCALL
                                                         (|spadConstant| $ 12)
                                                         1 (QREFELT $ 58))
                                                        (QREFELT $ 316))
                                              . #24#))
                                       ('T
                                        (LETT |newx|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 12)
                                                          1 (QREFELT $ 58))
                                                (SPADCALL
                                                 (PROG2
                                                     (LETT #4# (QVELT |sng| 0)
                                                           . #24#)
                                                     (QCDR #4#)
                                                   (|check_union2|
                                                    (QEQCAR #4# 0)
                                                    (|Expression| (|Integer|))
                                                    (|Union|
                                                     (|Expression| (|Integer|))
                                                     #1#)
                                                    #4#))
                                                 (QREFELT $ 227))
                                                (QREFELT $ 86))
                                               (QREFELT $ 232))
                                              . #24#)))
                                      (LETT |lcn|
                                            (|LODOF2;subsup|
                                             (SPADCALL |lc| (QREFELT $ 29))
                                             |newx| $)
                                            . #24#)
                                      (LETT |lcd|
                                            (|LODOF2;subsup|
                                             (SPADCALL |lc| (QREFELT $ 27))
                                             |newx| $)
                                            . #24#)
                                      (LETT |slc|
                                            (SPADCALL |lcn| |lcd|
                                                      (QREFELT $ 305))
                                            . #24#)
                                      (COND
                                       ((SPADCALL (QVELT |sng| 0)
                                                  (CONS 1 #26="infinity")
                                                  (QREFELT $ 315))
                                        (LETT |newd|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|spadConstant| $ 12) 1
                                                   (QREFELT $ 58))
                                                  2 (QREFELT $ 70))
                                                 (QREFELT $ 232))
                                                (SPADCALL (QREFELT $ 317))
                                                (QREFELT $ 318))
                                               (QREFELT $ 319))
                                              . #24#))
                                       ('T
                                        (LETT |newd| (SPADCALL (QREFELT $ 317))
                                              . #24#)))
                                      (LETT |srl|
                                            (SPADCALL |srl|
                                                      (SPADCALL |slc|
                                                                (SPADCALL
                                                                 |newd| |dg|
                                                                 (QREFELT $
                                                                          320))
                                                                (QREFELT $
                                                                         318))
                                                      (QREFELT $ 321))
                                            . #24#)
                                      (EXIT
                                       (LETT |ftmp|
                                             (SPADCALL |ftmp| (QREFELT $ 322))
                                             . #24#)))
                                     NIL (GO G190) G191 (EXIT NIL)))))))
                       ('T
                        (SEQ (LETT |ftmp| |srl| . #24#)
                             (LETT |srl| (|spadConstant| $ 310) . #24#)
                             (EXIT
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (SPADCALL |ftmp| (|spadConstant| $ 310)
                                                (QREFELT $ 311)))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |lc|
                                          (SPADCALL |ftmp| (QREFELT $ 312))
                                          . #24#)
                                    (LETT |dg|
                                          (SPADCALL |ftmp| (QREFELT $ 313))
                                          . #24#)
                                    (COND
                                     ((SPADCALL (QVELT |sng| 0) (CONS 1 #25#)
                                                (QREFELT $ 315))
                                      (LETT |newx|
                                            (SPADCALL (|spadConstant| $ 153)
                                                      (SPADCALL
                                                       (|spadConstant| $ 12) 1
                                                       (QREFELT $ 58))
                                                      (QREFELT $ 316))
                                            . #24#))
                                     ('T
                                      (LETT |newx|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| $ 12) 1
                                                        (QREFELT $ 58))
                                              (SPADCALL
                                               (PROG2
                                                   (LETT #4# (QVELT |sng| 0)
                                                         . #24#)
                                                   (QCDR #4#)
                                                 (|check_union2| (QEQCAR #4# 0)
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|Union|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  #1#)
                                                                 #4#))
                                               (QREFELT $ 227))
                                              (QREFELT $ 86))
                                             (QREFELT $ 232))
                                            . #24#)))
                                    (LETT |lcn|
                                          (|LODOF2;subsup|
                                           (SPADCALL |lc| (QREFELT $ 29))
                                           |newx| $)
                                          . #24#)
                                    (LETT |lcd|
                                          (|LODOF2;subsup|
                                           (SPADCALL |lc| (QREFELT $ 27))
                                           |newx| $)
                                          . #24#)
                                    (LETT |slc|
                                          (SPADCALL |lcn| |lcd|
                                                    (QREFELT $ 305))
                                          . #24#)
                                    (COND
                                     ((SPADCALL (QVELT |sng| 0) (CONS 1 #26#)
                                                (QREFELT $ 315))
                                      (LETT |newd|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 12)
                                                          1 (QREFELT $ 58))
                                                2 (QREFELT $ 70))
                                               (QREFELT $ 232))
                                              (SPADCALL (QREFELT $ 317))
                                              (QREFELT $ 318))
                                             (QREFELT $ 319))
                                            . #24#))
                                     ('T
                                      (LETT |newd| (SPADCALL (QREFELT $ 317))
                                            . #24#)))
                                    (LETT |srl|
                                          (SPADCALL |srl|
                                                    (SPADCALL |slc|
                                                              (SPADCALL |newd|
                                                                        |dg|
                                                                        (QREFELT
                                                                         $
                                                                         320))
                                                              (QREFELT $ 318))
                                                    (QREFELT $ 321))
                                          . #24#)
                                    (EXIT
                                     (LETT |ftmp|
                                           (SPADCALL |ftmp| (QREFELT $ 322))
                                           . #24#)))
                                   NIL (GO G190) G191 (EXIT NIL))))))
                      (EXIT
                       (COND
                        ((SPADCALL |option| "use adjoint" (QREFELT $ 323))
                         (SEQ
                          (LETT |re| (SPADCALL |f| |srl| (QREFELT $ 324))
                                . #24#)
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |re| (QREFELT $ 313)) 0
                                       (QREFELT $ 48))
                             (PROGN
                              (LETT #2#
                                    (CONS 0
                                          (LIST
                                           (SPADCALL |f| |re| (QREFELT $ 325))
                                           |re|))
                                    . #24#)
                              (GO #27=#:G1486)))))))
                        ('T
                         (SEQ
                          (COND
                           ((SPADCALL (QVELT |sng| 0) (CONS 1 "infinity")
                                      (QREFELT $ 315))
                            (LETT |re|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 153)
                                             (SPADCALL (|spadConstant| $ 12)
                                                       (SPADCALL |f|
                                                                 (QREFELT $
                                                                          313))
                                                       (QREFELT $ 58))
                                             (QREFELT $ 316))
                                   (QREFELT $ 326))
                                  . #24#))
                           ('T
                            (LETT |re|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 153)
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| $ 12)
                                                         1 (QREFELT $ 58))
                                               (SPADCALL
                                                (PROG2
                                                    (LETT #4# (QVELT |sng| 0)
                                                          . #24#)
                                                    (QCDR #4#)
                                                  (|check_union2|
                                                   (QEQCAR #4# 0)
                                                   (|Expression| (|Integer|))
                                                   (|Union|
                                                    (|Expression| (|Integer|))
                                                    #1#)
                                                   #4#))
                                                (QREFELT $ 227))
                                               (QREFELT $ 86))
                                              (SPADCALL |f| (QREFELT $ 313))
                                              (QREFELT $ 70))
                                             (QREFELT $ 316))
                                   (QREFELT $ 326))
                                  . #24#)))
                          (LETT |srl|
                                (SPADCALL
                                 (SPADCALL |re| (SPADCALL |f| (QREFELT $ 312))
                                           (QREFELT $ 327))
                                 |srl| (QREFELT $ 328))
                                . #24#)
                          (LETT |srl|
                                (SPADCALL |srl|
                                          (SPADCALL (|spadConstant| $ 299)
                                                    (SPADCALL |srl|
                                                              (QREFELT $ 312))
                                                    (QREFELT $ 305))
                                          (QREFELT $ 327))
                                . #24#)
                          (LETT |re| (SPADCALL |f| |srl| (QREFELT $ 329))
                                . #24#)
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |re| (QREFELT $ 313)) 0
                                       (QREFELT $ 48))
                             (PROGN
                              (LETT #2#
                                    (CONS 0
                                          (LIST |re|
                                                (SPADCALL |f| |re|
                                                          (QREFELT $ 330))))
                                    . #24#)
                              (GO #27#))))))))))))))
             (LETT |i| (+ |i| 1) . #24#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #27# (EXIT #2#)))) 

(SDEFUN |LODOF2;try_factorization2|
        ((|fl| |List|
          (|List|
           (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)))
         (|n| |Integer|) (|bound| |List| (|Fraction| (|Integer|)))
         (|eb| |Integer|)
         ($ |Union|
          (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          "failed"))
        (SPROG
         ((|nstep| (|Integer|)) (|acc| (|Integer|)) (#1=#:G1512 NIL)
          (|hps|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (|lv|
           (|List|
            (|Vector|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
          (#2=#:G1518 NIL) (|g| NIL) (#3=#:G1517 NIL) (#4=#:G1516 NIL)
          (|f| NIL) (#5=#:G1515 NIL) (|vdim| (|NonNegativeInteger|))
          (|cnt| (|Integer|)) (|eta| (|List| (|NonNegativeInteger|)))
          (#6=#:G1514 NIL) (|i| NIL) (#7=#:G1513 NIL) (|cb| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |cb|
                  (+
                   (SPADCALL
                    (SPADCALL |bound| (- (LENGTH |fl|) 1) (QREFELT $ 332))
                    (QREFELT $ 189))
                   |eb|)
                  . #8=(|LODOF2;try_factorization2|))
            (LETT |eta|
                  (PROGN
                   (LETT #7# NIL . #8#)
                   (SEQ (LETT |i| 1 . #8#) (LETT #6# |n| . #8#) G190
                        (COND ((|greater_SI| |i| #6#) (GO G191)))
                        (SEQ (EXIT (LETT #7# (CONS |cb| #7#) . #8#)))
                        (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                        (EXIT (NREVERSE #7#))))
                  . #8#)
            (LETT |cnt| (SPADCALL (LENGTH |fl|) (+ |cb| 1) (QREFELT $ 56))
                  . #8#)
            (LETT |vdim| (LENGTH (|SPADfirst| |fl|)) . #8#)
            (LETT |acc| (QUOTIENT2 (+ (+ |cnt| |vdim|) 3) |vdim|) . #8#)
            (LETT |nstep|
                  (SPADCALL
                   (SPADCALL (SPADCALL |acc| 2 (QREFELT $ 333)) 3
                             (QREFELT $ 51))
                   (QREFELT $ 189))
                  . #8#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |lv|
                         (PROGN
                          (LETT #5# NIL . #8#)
                          (SEQ (LETT |f| NIL . #8#) (LETT #4# |fl| . #8#) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |f| (CAR #4#) . #8#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #5#
                                       (CONS
                                        (SPADCALL
                                         (PROGN
                                          (LETT #3# NIL . #8#)
                                          (SEQ (LETT |g| NIL . #8#)
                                               (LETT #2# |f| . #8#) G190
                                               (COND
                                                ((OR (ATOM #2#)
                                                     (PROGN
                                                      (LETT |g| (CAR #2#)
                                                            . #8#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #3#
                                                       (CONS
                                                        (SPADCALL
                                                         (|LODOF2;convertUTStoUP|
                                                          |g| |acc| $)
                                                         (QREFELT $ 100))
                                                        #3#)
                                                       . #8#)))
                                               (LETT #2# (CDR #2#) . #8#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #3#))))
                                         (QREFELT $ 335))
                                        #5#)
                                       . #8#)))
                               (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                               (EXIT (NREVERSE #5#))))
                         . #8#)
                   (LETT |hps| (SPADCALL |lv| |eta| |acc| (QREFELT $ 340))
                         . #8#)
                   (EXIT
                    (COND
                     ((EQL (ANCOLS |hps|) 1)
                      (PROGN
                       (LETT #1#
                             (CONS 0
                                   (SPADCALL (SPADCALL |hps| 1 (QREFELT $ 341))
                                             (QREFELT $ 342)))
                             . #8#)
                       (GO #9=#:G1511)))
                     ((EQL (ANCOLS |hps|) 0)
                      (PROGN (LETT #1# (CONS 1 "failed") . #8#) (GO #9#)))
                     ('T
                      (SEQ (LETT |acc| (+ |acc| |nstep|) . #8#)
                           (EXIT
                            (LETT |nstep|
                                  (+
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 3 2 (QREFELT $ 51))
                                              |nstep| (QREFELT $ 343))
                                    (QREFELT $ 187))
                                   2)
                                  . #8#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #9# (EXIT #1#)))) 

(SDEFUN |LODOF2;flist|
        ((|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|order| |Integer|)
         ($ |List|
          (|List|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                      |cen|))))
        (SPROG
         ((|res|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#1=#:G1526 NIL) (|j| NIL) (#2=#:G1525 NIL)
          (|p|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#3=#:G1524 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL . #4=(|LODOF2;flist|))
              (SEQ (LETT |i| 0 . #4#) (LETT #3# |order| . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |p| (|LODOF2;xDn_modr| |i| |r| $) . #4#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (LIST
                                          (PROGN
                                           (LETT #2# NIL . #4#)
                                           (SEQ (LETT |j| 0 . #4#)
                                                (LETT #1#
                                                      (-
                                                       (SPADCALL |r|
                                                                 (QREFELT $
                                                                          41))
                                                       1)
                                                      . #4#)
                                                G190
                                                (COND
                                                 ((|greater_SI| |j| #1#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #2#
                                                        (CONS
                                                         (SPADCALL |p| |j|
                                                                   (QREFELT $
                                                                            54))
                                                         #2#)
                                                        . #4#)))
                                                (LETT |j| (|inc_SI| |j|) . #4#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #2#)))))
                                         (QREFELT $ 344))
                               . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;xDn_modr|
        ((|n| |Integer|)
         (|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|coefa|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|a|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#1=#:G1530 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |n| (SPADCALL |r| (QREFELT $ 41)))
              (PROGN
               (LETT #1# (SPADCALL (|spadConstant| $ 14) |n| (QREFELT $ 34))
                     . #2=(|LODOF2;xDn_modr|))
               (GO #3=#:G1529))))
            (LETT |a| (|LODOF2;xDn_modr| (- |n| 1) |r| $) . #2#)
            (LETT |coefa|
                  (SPADCALL |a| (- (SPADCALL |r| (QREFELT $ 41)) 1)
                            (QREFELT $ 54))
                  . #2#)
            (EXIT
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 34)) |a|
                         (QREFELT $ 162))
               (SPADCALL |a| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 34))
                         (QREFELT $ 162))
               (QREFELT $ 35))
              (SPADCALL |coefa| |r| (QREFELT $ 160)) (QREFELT $ 168)))))
          #3# (EXIT #1#)))) 

(SDEFUN |LODOF2;factor;LodoMLL;47|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))
          (|List| (|Expression| (|Integer|))))
         (|y| |List| (|Expression| (|Integer|)))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G1546 NIL) (#2=#:G1547 NIL) (|i| NIL)
          (|res|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|b|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|factorizer2|
           (|Mapping|
            (|Factored|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 313)) 1 (QREFELT $ 49))
              (PROGN
               (LETT #1# (LIST |f|) . #3=(|LODOF2;factor;LodoMLL;47|))
               (GO #4=#:G1545))))
            (LETT |factorizer2|
                  (CONS #'|LODOF2;factor;LodoMLL;47!0|
                        (VECTOR |factorizer| |y|))
                  . #3#)
            (LETT |b| (|LODOF2;factor_global| |f| |factorizer2| $) . #3#)
            (EXIT
             (COND ((EQL (LENGTH |b|) 1) (PROGN (LETT #1# |b| . #3#) (GO #4#)))
                   ('T
                    (SEQ
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (SPADCALL |b| 1 (QREFELT $ 346))
                                      |factorizer| |y| (QREFELT $ 349))
                            (SPADCALL (SPADCALL |b| 2 (QREFELT $ 346))
                                      |factorizer| |y| (QREFELT $ 349))
                            (QREFELT $ 350))
                           . #3#)
                     (SEQ (LETT |i| 3 . #3#) (LETT #2# (LENGTH |b|) . #3#) G190
                          (COND ((> |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |res|
                                      (SPADCALL
                                       (SPADCALL |b| |i| (QREFELT $ 346))
                                       |factorizer| |y| (QREFELT $ 349))
                                      (QREFELT $ 351))))
                          (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                     (EXIT (PROGN (LETT #1# |res| . #3#) (GO #4#)))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |LODOF2;factor;LodoMLL;47!0| ((|x| NIL) ($$ NIL))
        (PROG (|y| |factorizer|)
          (LETT |y| (QREFELT $$ 1) . #1=(|LODOF2;factor;LodoMLL;47|))
          (LETT |factorizer| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |y| |factorizer|))))) 

(SDEFUN |LODOF2;inf_singularity?|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator1|
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         ($ |Boolean|))
        (SPROG
         ((#2=#:G1554 NIL)
          (|dlc|
           (|List| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#3=#:G1557 NIL) (|e| NIL) (#4=#:G1556 NIL)
          (|fi|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|yu|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd|
           #5=(|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcn| #5#)
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#6=#:G1555 NIL) (|i| NIL)
          (|ux|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|ftmp| #1#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fi| (|spadConstant| $ 310) . #7=(|LODOF2;inf_singularity?|))
            (LETT |ftmp| |f| . #7#)
            (LETT |ux|
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| $ 12) 2 (QREFELT $ 58))
                             (QREFELT $ 232))
                   (QREFELT $ 352))
                  . #7#)
            (LETT |yu| (|spadConstant| $ 353) . #7#)
            (SEQ (LETT |i| 0 . #7#)
                 (LETT #6# (SPADCALL |f| (QREFELT $ 313)) . #7#) G190
                 (COND ((|greater_SI| |i| #6#) (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |f| |i| (QREFELT $ 354)) . #7#)
                      (LETT |lcn|
                            (|LODOF2;subsup| (SPADCALL |lc| (QREFELT $ 29))
                             (SPADCALL (|spadConstant| $ 153)
                                       (SPADCALL (|spadConstant| $ 12) 1
                                                 (QREFELT $ 58))
                                       (QREFELT $ 316))
                             $)
                            . #7#)
                      (LETT |lcd|
                            (|LODOF2;subsup| (SPADCALL |lc| (QREFELT $ 27))
                             (SPADCALL (|spadConstant| $ 153)
                                       (SPADCALL (|spadConstant| $ 12) 1
                                                 (QREFELT $ 58))
                                       (QREFELT $ 316))
                             $)
                            . #7#)
                      (LETT |slc| (SPADCALL |lcn| |lcd| (QREFELT $ 305)) . #7#)
                      (LETT |fi|
                            (SPADCALL |fi|
                                      (SPADCALL |slc| |yu| (QREFELT $ 318))
                                      (QREFELT $ 321))
                            . #7#)
                      (EXIT
                       (LETT |yu|
                             (SPADCALL
                              (SPADCALL |ux| (SPADCALL (QREFELT $ 317))
                                        (QREFELT $ 318))
                              |yu| (QREFELT $ 328))
                             . #7#)))
                 (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |fi|
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 299)
                             (SPADCALL |fi| (QREFELT $ 312)) (QREFELT $ 305))
                   |fi| (QREFELT $ 318))
                  . #7#)
            (LETT |dlc|
                  (PROGN
                   (LETT #4# NIL . #7#)
                   (SEQ (LETT |e| (SPADCALL |fi| (QREFELT $ 356)) . #7#)
                        (LETT #3# (SPADCALL |fi| (QREFELT $ 313)) . #7#) G190
                        (COND ((> |e| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #4#
                                (CONS
                                 (SPADCALL (SPADCALL |fi| |e| (QREFELT $ 354))
                                           (QREFELT $ 27))
                                 #4#)
                                . #7#)))
                        (LETT |e| (+ |e| 1) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #4#))))
                  . #7#)
            (COND
             ((SPADCALL
               (SPADCALL (SPADCALL |dlc| (QREFELT $ 357))
                         (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                         (|spadConstant| $ 52) (QREFELT $ 85))
               (|spadConstant| $ 52) (QREFELT $ 87))
              (PROGN (LETT #2# 'T . #7#) (GO #8=#:G1553))))
            (EXIT NIL)))
          #8# (EXIT #2#)))) 

(SDEFUN |LODOF2;testis;LodoB;49|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |Boolean|))
        (|LODOF2;inf_singularity?| |f| $)) 

(SDEFUN |LODOF2;factor_global|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G1663 NIL) (#2=#:G1628 NIL)
          (|t|
           (|Union|
            (|List|
             (|LinearOrdinaryDifferentialOperator1|
              (|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
            #3="failed"))
          (|r_left|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#4=#:G793 NIL) (#5=#:G1687 NIL) (|l| NIL)
          (|vrs|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#6=#:G1609 NIL)
          (|kk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|jj|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#7=#:G794 NIL)
          (|j1|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|iarf1|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#8=#:G1686 NIL) (|s| NIL) (#9=#:G1685 NIL) (|sop| NIL)
          (#10=#:G1684 NIL) (#11=#:G1682 NIL) (#12=#:G1683 NIL) (|sa| NIL)
          (#13=#:G1681 NIL)
          (|done_sa|
           (|List|
            (|Record|
             (|:| |sing|
                  (|Record|
                   (|:| |point|
                        (|Union| (|Expression| (|Integer|)) #14="infinity"))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |arf|
                  (|List|
                   (|Union|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|))
                    (|Record|
                     (|:| |ope|
                          (|LinearOrdinaryDifferentialOperator3|
                           (|Expression| (|Integer|))
                           (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
                     (|:| |dext| (|PositiveInteger|))
                     (|:| |alpha| (|Expression| (|Integer|)))
                     (|:| |rami|
                          (|UnivariatePolynomial| |var|
                                                  (|Expression|
                                                   (|Integer|)))))))))))
          (#15=#:G1680 NIL) (|all_one| (|Boolean|)) (#16=#:G1679 NIL)
          (#17=#:G1677 NIL) (|ssp| NIL) (#18=#:G1678 NIL)
          (|done_s|
           (|List|
            (|Record|
             (|:| |sing|
                  (|Record|
                   (|:| |point| (|Union| (|Expression| (|Integer|)) #14#))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |arf|
                  (|List|
                   (|Union|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|))
                    (|Record|
                     (|:| |ope|
                          (|LinearOrdinaryDifferentialOperator3|
                           (|Expression| (|Integer|))
                           (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
                     (|:| |dext| (|PositiveInteger|))
                     (|:| |alpha| (|Expression| (|Integer|)))
                     (|:| |rami|
                          (|UnivariatePolynomial| |var|
                                                  (|Expression|
                                                   (|Integer|)))))))))))
          (|gem|
           #19=(|List|
                (|Record|
                 (|:| |singularity|
                      (|Record|
                       (|:| |point| (|Union| (|Expression| (|Integer|)) #14#))
                       (|:| |lpf|
                            (|LinearOrdinaryDifferentialOperator3|
                             (|Expression| (|Integer|))
                             (|UnivariateTaylorSeries|
                              (|Expression| (|Integer|)) |var| |cen|)
                             (|UnivariateLaurentSeries|
                              (|Expression| (|Integer|)) |var| |cen|)))
                       (|:| |dxt| (|PositiveInteger|))))
                 (|:| |fos|
                      (|List|
                       (|Record|
                        (|:| |op|
                             (|LinearOrdinaryDifferentialOperator3|
                              (|Expression| (|Integer|))
                              (|UnivariateTaylorSeries|
                               (|Expression| (|Integer|)) |var| |cen|)
                              (|UnivariateLaurentSeries|
                               (|Expression| (|Integer|)) |var| |cen|)))
                        (|:| |ram|
                             (|UnivariatePolynomial| |var|
                                                     (|Expression|
                                                      (|Integer|))))
                        (|:| |expart|
                             (|UnivariateLaurentSeries|
                              (|Expression| (|Integer|)) |var| |cen|)))))
                 (|:| |mge|
                      (|List|
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|))))))
          (#20=#:G1676 NIL) (|ge| NIL) (|min_deg| (|PositiveInteger|))
          (|dl| (|List| (|PositiveInteger|))) (#21=#:G1675 NIL)
          (#22=#:G1674 NIL) (|eba| (|Integer|)) (|gema| #19#)
          (|eb| (|Integer|)) (|bound| (|List| (|Fraction| (|Integer|))))
          (#23=#:G1673 NIL) (|j| NIL) (#24=#:G1672 NIL) (#25=#:G1671 NIL)
          (|i| NIL) (|v| (|List| (|Fraction| (|Integer|)))) (#26=#:G1670 NIL)
          (|ji1x| #27=(|Integer|)) (|jix| #27#) (|ji1y| #28=(|Integer|))
          (|jiy| #28#) (#29=#:G1669 NIL)
          (|np|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (#30=#:G1668 NIL) (#31=#:G1667 NIL) (#32=#:G1666 NIL)
          (#33=#:G1665 NIL) (#34=#:G1664 NIL)
          (|a|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 313)) 1 (QREFELT $ 49))
              (PROGN
               (LETT #1# (LIST |f|) . #35=(|LODOF2;factor_global|))
               (GO #36=#:G1662))))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 312)) (|spadConstant| $ 299)
                        (QREFELT $ 359))
              (SEQ
               (LETT |a|
                     (|LODOF2;factor_global|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 299)
                                 (SPADCALL |f| (QREFELT $ 312))
                                 (QREFELT $ 305))
                       |f| (QREFELT $ 318))
                      |factorizer| $)
                     . #35#)
               (EXIT
                (PROGN
                 (LETT #1#
                       (CONS
                        (SPADCALL (SPADCALL |f| (QREFELT $ 312))
                                  (SPADCALL |a| 1 (QREFELT $ 346))
                                  (QREFELT $ 318))
                        (PROGN
                         (LETT #34# NIL . #35#)
                         (SEQ (LETT |i| 2 . #35#)
                              (LETT #33# (LENGTH |a|) . #35#) G190
                              (COND ((|greater_SI| |i| #33#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #34#
                                      (CONS (SPADCALL |a| |i| (QREFELT $ 346))
                                            #34#)
                                      . #35#)))
                              (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #34#)))))
                       . #35#)
                 (GO #36#))))))
            (COND
             ((EQL (SPADCALL |f| (QREFELT $ 313)) 2)
              (SPADCALL
               (SPADCALL "Better to use old factorizer" (QREFELT $ 360))
               (QREFELT $ 172))))
            (LETT |gem| (SPADCALL |f| |factorizer| "" (QREFELT $ 364)) . #35#)
            (LETT |bound|
                  (PROGN
                   (LETT #32# NIL . #35#)
                   (SEQ (LETT |i| 1 . #35#)
                        (LETT #31# (- (SPADCALL |f| (QREFELT $ 313)) 1) . #35#)
                        G190 (COND ((|greater_SI| |i| #31#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #32# (CONS (|spadConstant| $ 68) #32#)
                                . #35#)))
                        (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191
                        (EXIT (NREVERSE #32#))))
                  . #35#)
            (LETT |eb| -1 . #35#)
            (SEQ (LETT |s| NIL . #35#) (LETT #30# |gem| . #35#) G190
                 (COND
                  ((OR (ATOM #30#) (PROGN (LETT |s| (CAR #30#) . #35#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |np| (|LODOF2;newtonpolygon| (QVELT (QVELT |s| 0) 1) $)
                        . #35#)
                  (LETT |np|
                        (SPADCALL |np|
                                  (LIST
                                   (VECTOR
                                    (CONS
                                     (SPADCALL (QVELT (QVELT |s| 0) 1)
                                               (QREFELT $ 41))
                                     0)
                                    (|spadConstant| $ 68)
                                    (|spadConstant| $ 52)))
                                  (QREFELT $ 62))
                        . #35#)
                  (LETT |v| NIL . #35#)
                  (SEQ (LETT |i| 1 . #35#)
                       (LETT #29# (- (LENGTH |np|) 1) . #35#) G190
                       (COND ((|greater_SI| |i| #29#) (GO G191)))
                       (SEQ
                        (LETT |jiy|
                              (QCDR
                               (QVELT (SPADCALL |np| |i| (QREFELT $ 196)) 0))
                              . #35#)
                        (LETT |ji1y|
                              (QCDR
                               (QVELT (SPADCALL |np| (+ |i| 1) (QREFELT $ 196))
                                      0))
                              . #35#)
                        (LETT |jix|
                              (QCAR
                               (QVELT (SPADCALL |np| |i| (QREFELT $ 196)) 0))
                              . #35#)
                        (LETT |ji1x|
                              (QCAR
                               (QVELT (SPADCALL |np| (+ |i| 1) (QREFELT $ 196))
                                      0))
                              . #35#)
                        (EXIT
                         (SEQ (LETT |l| |jix| . #35#)
                              (LETT #26# (- |ji1x| 1) . #35#) G190
                              (COND ((> |l| #26#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |v|
                                      (SPADCALL |v|
                                                (LIST
                                                 (SPADCALL
                                                  (SPADCALL |jiy|
                                                            (QREFELT $ 106))
                                                  (SPADCALL
                                                   (* (- |l| |jix|)
                                                      (- |ji1y| |jiy|))
                                                   (- |ji1x| |jix|)
                                                   (QREFELT $ 51))
                                                  (QREFELT $ 108)))
                                                (QREFELT $ 365))
                                      . #35#)))
                              (LETT |l| (+ |l| 1) . #35#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191
                       (EXIT NIL))
                  (SEQ (LETT |i| 1 . #35#)
                       (LETT #25# (- (SPADCALL |f| (QREFELT $ 313)) 1) . #35#)
                       G190 (COND ((|greater_SI| |i| #25#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |bound| |i|
                                   (SPADCALL
                                    (SPADCALL |bound| |i| (QREFELT $ 332))
                                    (SPADCALL (QVELT (QVELT |s| 0) 2)
                                              (SPADCALL |v| (+ |i| 1)
                                                        (QREFELT $ 332))
                                              (QREFELT $ 366))
                                    (QREFELT $ 108))
                                   (QREFELT $ 367))))
                       (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (LETT |eb| (+ |eb| (QVELT (QVELT |s| 0) 2)) . #35#)))
                 (LETT #30# (CDR #30#) . #35#) (GO G190) G191 (EXIT NIL))
            (LETT |bound|
                  (PROGN
                   (LETT #24# NIL . #35#)
                   (SEQ (LETT |j| 1 . #35#)
                        (LETT #23# (- (SPADCALL |f| (QREFELT $ 313)) 1) . #35#)
                        G190 (COND ((|greater_SI| |j| #23#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #24#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |bound|
                                             (- (SPADCALL |f| (QREFELT $ 313))
                                                |j|)
                                             (QREFELT $ 332))
                                   (QREFELT $ 368))
                                  (SPADCALL |j| (SPADCALL |eb| (QREFELT $ 106))
                                            (QREFELT $ 366))
                                  (QREFELT $ 108))
                                 #24#)
                                . #35#)))
                        (LETT |j| (|inc_SI| |j|) . #35#) (GO G190) G191
                        (EXIT (NREVERSE #24#))))
                  . #35#)
            (LETT |eb| (|LODOF2;compute_bound| |gem| (|spadConstant| $ 19) $)
                  . #35#)
            (LETT |gema|
                  (SPADCALL |f| |factorizer| "use adjoint" (QREFELT $ 364))
                  . #35#)
            (LETT |eba| (|LODOF2;compute_bound| |gema| (|spadConstant| $ 19) $)
                  . #35#)
            (LETT |all_one| 'T . #35#) (LETT |done_s| NIL . #35#)
            (SEQ G190 (COND ((NULL (NULL (NULL |gem|))) (GO G191)))
                 (SEQ
                  (LETT |dl|
                        (PROGN
                         (LETT #22# NIL . #35#)
                         (SEQ (LETT |s| NIL . #35#) (LETT #21# |gem| . #35#)
                              G190
                              (COND
                               ((OR (ATOM #21#)
                                    (PROGN (LETT |s| (CAR #21#) . #35#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #22# (CONS (QVELT (QVELT |s| 0) 2) #22#)
                                      . #35#)))
                              (LETT #21# (CDR #21#) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #22#))))
                        . #35#)
                  (LETT |min_deg| (SPADCALL (ELT $ 372) |dl| (QREFELT $ 375))
                        . #35#)
                  (EXIT
                   (SEQ (LETT |ge| NIL . #35#) (LETT #20# |gem| . #35#) G190
                        (COND
                         ((OR (ATOM #20#)
                              (PROGN (LETT |ge| (CAR #20#) . #35#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL (QVELT (QVELT |ge| 0) 2) |min_deg|)
                            (SEQ
                             (LETT |gem| (SPADCALL |ge| |gem| (QREFELT $ 376))
                                   . #35#)
                             (LETT |vrs|
                                   (PROG2
                                       (LETT #6#
                                             (|LODOF2;factor_op|
                                              (QVELT (QVELT |ge| 0) 1)
                                              |factorizer| "all right factors"
                                              $)
                                             . #35#)
                                       (QCDR #6#)
                                     (|check_union2| (QEQCAR #6# 1)
                                                     (|List|
                                                      (|Union|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))
                                                       (|Record|
                                                        (|:| |ope|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |dext|
                                                             (|PositiveInteger|))
                                                        (|:| |alpha|
                                                             (|Expression|
                                                              (|Integer|)))
                                                        (|:| |rami|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|)))))))
                                                     (|Union|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |op|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |ram|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|))))
                                                        (|:| |expart|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))))
                                                      (|List|
                                                       (|Union|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7)))
                                                        (|Record|
                                                         (|:| |ope|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $ 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $
                                                                         7))))
                                                         (|:| |dext|
                                                              (|PositiveInteger|))
                                                         (|:| |alpha|
                                                              (|Expression|
                                                               (|Integer|)))
                                                         (|:| |rami|
                                                              (|UnivariatePolynomial|
                                                               (QREFELT $ 6)
                                                               (|Expression|
                                                                (|Integer|))))))))
                                                     #6#))
                                   . #35#)
                             (LETT |done_s|
                                   (SPADCALL |done_s|
                                             (LIST (CONS (QVELT |ge| 0) |vrs|))
                                             (QREFELT $ 379))
                                   . #35#)
                             (SEQ (LETT |sop| NIL . #35#)
                                  (LETT #18# |vrs| . #35#)
                                  (LETT |ssp| NIL . #35#)
                                  (LETT #17# (QVELT |ge| 1) . #35#) G190
                                  (COND
                                   ((OR (ATOM #17#)
                                        (PROGN
                                         (LETT |ssp| (CAR #17#) . #35#)
                                         NIL)
                                        (ATOM #18#)
                                        (PROGN
                                         (LETT |sop| (CAR #18#) . #35#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL (QVELT |ssp| 0)
                                                 (QREFELT $ 41))
                                       1)
                                      (COND
                                       ((EQL
                                         (SPADCALL
                                          (PROG2 (LETT #4# |sop| . #35#)
                                              (QCDR #4#)
                                            (|check_union2| (QEQCAR #4# 0)
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))
                                                            (|Union|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7)))
                                                             (|Record|
                                                              (|:| |ope|
                                                                   (|LinearOrdinaryDifferentialOperator3|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (|UnivariateTaylorSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))))
                                                              (|:| |dext|
                                                                   (|PositiveInteger|))
                                                              (|:| |alpha|
                                                                   (|Expression|
                                                                    (|Integer|)))
                                                              (|:| |rami|
                                                                   (|UnivariatePolynomial|
                                                                    (QREFELT $
                                                                             6)
                                                                    (|Expression|
                                                                     (|Integer|))))))
                                                            #4#))
                                          (QREFELT $ 41))
                                         1)
                                        (PROGN
                                         (LETT #1#
                                               (|LODOF2;factor_minmult1|
                                                |bound| (QVELT |ge| 0) |f| |eb|
                                                |eba|
                                                (PROG2 (LETT #4# |sop| . #35#)
                                                    (QCDR #4#)
                                                  (|check_union2|
                                                   (QEQCAR #4# 0)
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|))))))
                                                   #4#))
                                                |factorizer| $)
                                               . #35#)
                                         (GO #36#))))))))
                                  (LETT #17#
                                        (PROG1 (CDR #17#)
                                          (LETT #18# (CDR #18#) . #35#))
                                        . #35#)
                                  (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (LETT |all_one|
                                    (COND
                                     (|all_one|
                                      (COND
                                       ((EQL (LENGTH |vrs|) 1)
                                        (EQL
                                         (SPADCALL
                                          (PROG2
                                              (LETT #4#
                                                    (SPADCALL |vrs| 1
                                                              (QREFELT $ 380))
                                                    . #35#)
                                              (QCDR #4#)
                                            (|check_union2| (QEQCAR #4# 0)
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))
                                                            (|Union|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7)))
                                                             (|Record|
                                                              (|:| |ope|
                                                                   (|LinearOrdinaryDifferentialOperator3|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (|UnivariateTaylorSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))))
                                                              (|:| |dext|
                                                                   (|PositiveInteger|))
                                                              (|:| |alpha|
                                                                   (|Expression|
                                                                    (|Integer|)))
                                                              (|:| |rami|
                                                                   (|UnivariatePolynomial|
                                                                    (QREFELT $
                                                                             6)
                                                                    (|Expression|
                                                                     (|Integer|))))))
                                                            #4#))
                                          (QREFELT $ 41))
                                         1))
                                       ('T NIL)))
                                     ('T NIL))
                                    . #35#)))))))
                        (LETT #20# (CDR #20#) . #35#) (GO G190) G191
                        (EXIT NIL))))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             (|all_one|
              (SPADCALL
               (SPADCALL "Better to use old factorizer" (QREFELT $ 360))
               (QREFELT $ 172))))
            (LETT |all_one| 'T . #35#) (LETT |done_sa| NIL . #35#)
            (SEQ (LETT |s| NIL . #35#) (LETT #16# |done_s| . #35#) G190
                 (COND
                  ((OR (ATOM #16#) (PROGN (LETT |s| (CAR #16#) . #35#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |all_one|
                        (COND (|all_one| (EQL (LENGTH (QCDR |s|)) 1)) ('T NIL))
                        . #35#)
                  (SEQ (LETT |sop| NIL . #35#) (LETT #15# (QCDR |s|) . #35#)
                       G190
                       (COND
                        ((OR (ATOM #15#)
                             (PROGN (LETT |sop| (CAR #15#) . #35#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |t|
                              (|LODOF2;try_factorization|
                               (PROG2 (LETT #4# |sop| . #35#)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #4#))
                               (SPADCALL
                                (SPADCALL (SPADCALL |f| (QREFELT $ 313)) 2
                                          (QREFELT $ 51))
                                (QREFELT $ 187))
                               |bound| (QCAR |s|) |f| |eb| 0 "" $)
                              . #35#)
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 382))
                           (PROGN
                            (LETT #1#
                                  (PROG2 (LETT #2# |t| . #35#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #3#)
                                                    #2#))
                                  . #35#)
                            (GO #36#))))))
                       (LETT #15# (CDR #15#) . #35#) (GO G190) G191 (EXIT NIL))
                  (LETT |vrs|
                        (PROG2
                            (LETT #6#
                                  (|LODOF2;factor_op|
                                   (SPADCALL (QVELT (QCAR |s|) 1)
                                             (QREFELT $ 383))
                                   |factorizer| "all right factors" $)
                                  . #35#)
                            (QCDR #6#)
                          (|check_union2| (QEQCAR #6# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #6#))
                        . #35#)
                  (LETT |done_sa|
                        (SPADCALL |done_sa| (LIST (CONS (QCAR |s|) |vrs|))
                                  (QREFELT $ 379))
                        . #35#)
                  (EXIT
                   (SEQ (LETT |sop| NIL . #35#) (LETT #13# |vrs| . #35#) G190
                        (COND
                         ((OR (ATOM #13#)
                              (PROGN (LETT |sop| (CAR #13#) . #35#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |t|
                               (|LODOF2;try_factorization|
                                (PROG2 (LETT #4# |sop| . #35#)
                                    (QCDR #4#)
                                  (|check_union2| (QEQCAR #4# 0)
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                  #4#))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 313)) 2
                                           (QREFELT $ 51))
                                 (QREFELT $ 187))
                                |bound| (QCAR |s|) |f| |eba| 0 "use adjoint" $)
                               . #35#)
                         (EXIT
                          (COND
                           ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 382))
                            (PROGN
                             (LETT #1#
                                   (PROG2 (LETT #2# |t| . #35#)
                                       (QCDR #2#)
                                     (|check_union2| (QEQCAR #2# 0)
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     (|Union|
                                                      (|List|
                                                       (|LinearOrdinaryDifferentialOperator1|
                                                        (|Fraction|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                      #3#)
                                                     #2#))
                                   . #35#)
                             (GO #36#))))))
                        (LETT #13# (CDR #13#) . #35#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT #16# (CDR #16#) . #35#) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |sa| NIL . #35#) (LETT #12# |done_sa| . #35#)
                 (LETT |s| NIL . #35#) (LETT #11# |done_s| . #35#) G190
                 (COND
                  ((OR (ATOM #11#) (PROGN (LETT |s| (CAR #11#) . #35#) NIL)
                       (ATOM #12#) (PROGN (LETT |sa| (CAR #12#) . #35#) NIL))
                   (GO G191)))
                 (SEQ
                  (SEQ (LETT |sop| NIL . #35#) (LETT #10# (QCDR |s|) . #35#)
                       G190
                       (COND
                        ((OR (ATOM #10#)
                             (PROGN (LETT |sop| (CAR #10#) . #35#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |t|
                              (|LODOF2;try_factorization|
                               (PROG2 (LETT #4# |sop| . #35#)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #4#))
                               (- (SPADCALL |f| (QREFELT $ 313)) 1) |bound|
                               (QCAR |s|) |f| |eb|
                               (+
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 313)) 2
                                           (QREFELT $ 51))
                                 (QREFELT $ 187))
                                1)
                               "" $)
                              . #35#)
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 382))
                           (PROGN
                            (LETT #1#
                                  (PROG2 (LETT #2# |t| . #35#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #3#)
                                                    #2#))
                                  . #35#)
                            (GO #36#))))))
                       (LETT #10# (CDR #10#) . #35#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |sop| NIL . #35#) (LETT #9# (QCDR |sa|) . #35#)
                        G190
                        (COND
                         ((OR (ATOM #9#)
                              (PROGN (LETT |sop| (CAR #9#) . #35#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |t|
                               (|LODOF2;try_factorization|
                                (PROG2 (LETT #4# |sop| . #35#)
                                    (QCDR #4#)
                                  (|check_union2| (QEQCAR #4# 0)
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                  #4#))
                                (- (SPADCALL |f| (QREFELT $ 313)) 1) |bound|
                                (QCAR |s|) |f| |eba|
                                (+
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |f| (QREFELT $ 313)) 2
                                            (QREFELT $ 51))
                                  (QREFELT $ 187))
                                 1)
                                "use adjoint" $)
                               . #35#)
                         (EXIT
                          (COND
                           ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 382))
                            (PROGN
                             (LETT #1#
                                   (PROG2 (LETT #2# |t| . #35#)
                                       (QCDR #2#)
                                     (|check_union2| (QEQCAR #2# 0)
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     (|Union|
                                                      (|List|
                                                       (|LinearOrdinaryDifferentialOperator1|
                                                        (|Fraction|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                      #3#)
                                                     #2#))
                                   . #35#)
                             (GO #36#))))))
                        (LETT #9# (CDR #9#) . #35#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #35#))
                       . #35#)
                 (GO G190) G191 (EXIT NIL))
            (COND
             (|all_one|
              (SEQ (LETT |s| NIL . #35#) (LETT #8# |done_s| . #35#) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |s| (CAR #8#) . #35#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |iarf1|
                          (PROG2 (LETT #4# (|SPADfirst| (QCDR |s|)) . #35#)
                              (QCDR #4#)
                            (|check_union2| (QEQCAR #4# 0)
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))
                                            #4#))
                          . #35#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |iarf1| (QREFELT $ 41)) 1
                                 (QREFELT $ 48))
                       (SEQ
                        (LETT |j1|
                              (PROG2
                                  (LETT #6#
                                        (|LODOF2;factor_op| |iarf1|
                                         |factorizer| "alg factor" $)
                                        . #35#)
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #6#))
                              . #35#)
                        (LETT |jj|
                              (PROG2
                                  (LETT #7# (SPADCALL |j1| (QREFELT $ 200))
                                        . #35#)
                                  (QCDR #7#)
                                (|check_union2| (QEQCAR #7# 1)
                                                (|Record|
                                                 (|:| |ope|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))))
                                                 (|:| |dext|
                                                      (|PositiveInteger|))
                                                 (|:| |alpha|
                                                      (|Expression|
                                                       (|Integer|)))
                                                 (|:| |rami|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|)))))
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                #7#))
                              . #35#)
                        (LETT |kk| (|LODOF2;make_rightfactor| |iarf1| |jj| $)
                              . #35#)
                        (LETT |t|
                              (|LODOF2;try_factorization| |kk|
                               (- (SPADCALL |f| (QREFELT $ 313)) 1) |bound|
                               (QCAR |s|) |f| 0 0 "" $)
                              . #35#)
                        (COND
                         ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 382))
                          (PROGN
                           (LETT #1#
                                 (PROG2 (LETT #2# |t| . #35#)
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 0)
                                                   (|List|
                                                    (|LinearOrdinaryDifferentialOperator1|
                                                     (|Fraction|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|))))))
                                                   (|Union|
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    #3#)
                                                   #2#))
                                 . #35#)
                           (GO #36#))))
                        (LETT |vrs|
                              (PROG2
                                  (LETT #6#
                                        (|LODOF2;factor_op|
                                         (SPADCALL (QVELT (QCAR |s|) 1)
                                                   (QREFELT $ 383))
                                         |factorizer| "all right factors" $)
                                        . #35#)
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #6#))
                              . #35#)
                        (LETT |r_left| (|spadConstant| $ 18) . #35#)
                        (SEQ (LETT |l| NIL . #35#) (LETT #5# |vrs| . #35#) G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |l| (CAR #5#) . #35#) NIL)
                                   (NULL
                                    (SPADCALL |r_left| (|spadConstant| $ 18)
                                              (QREFELT $ 222))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((|LODOF2;same_charclass?|
                                  (PROG2 (LETT #4# |l| . #35#)
                                      (QCDR #4#)
                                    (|check_union2| (QEQCAR #4# 0)
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|))))))
                                                    #4#))
                                  (SPADCALL |kk| (QREFELT $ 383)) |factorizer|
                                  $)
                                 (LETT |r_left|
                                       (PROG2 (LETT #4# |l| . #35#)
                                           (QCDR #4#)
                                         (|check_union2| (QEQCAR #4# 0)
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7)))
                                                         (|Union|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7)))
                                                          (|Record|
                                                           (|:| |ope|
                                                                (|LinearOrdinaryDifferentialOperator3|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|UnivariateTaylorSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7))
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7))))
                                                           (|:| |dext|
                                                                (|PositiveInteger|))
                                                           (|:| |alpha|
                                                                (|Expression|
                                                                 (|Integer|)))
                                                           (|:| |rami|
                                                                (|UnivariatePolynomial|
                                                                 (QREFELT $ 6)
                                                                 (|Expression|
                                                                  (|Integer|))))))
                                                         #4#))
                                       . #35#)))))
                             (LETT #5# (CDR #5#) . #35#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |t|
                              (|LODOF2;try_factorization| |r_left|
                               (- (SPADCALL |f| (QREFELT $ 313)) 1) |bound|
                               (QCAR |s|) |f| 0 0 "use adjoint" $)
                              . #35#)
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 382))
                           (PROGN
                            (LETT #1#
                                  (PROG2 (LETT #2# |t| . #35#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #3#)
                                                    #2#))
                                  . #35#)
                            (GO #36#))))))))))
                   (LETT #8# (CDR #8#) . #35#) (GO G190) G191 (EXIT NIL))))
            (SPADCALL (SPADCALL "Try the old factorizer" (QREFELT $ 360))
                      (QREFELT $ 172))
            (EXIT (LIST |f|))))
          #36# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfg;LodoML;51|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (|LODOF2;factor_global| |f| |factorizer| $)) 

(SDEFUN |LODOF2;factor_minmult1|
        ((|bound| |List| (|Fraction| (|Integer|)))
         (|sng| |Record|
          (|:| |point| (|Union| (|Expression| (|Integer|)) "infinity"))
          (|:| |lpf|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dxt| (|PositiveInteger|)))
         (|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|eb| |Integer|) (|eba| |Integer|)
         (|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G1710 NIL) (#2=#:G1692 NIL)
          (|t|
           (|Union|
            (|List|
             (|LinearOrdinaryDifferentialOperator1|
              (|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
            #3="failed"))
          (|r_left|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#4=#:G793 NIL) (#5=#:G1711 NIL) (|i| NIL)
          (|w|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#6=#:G1701 NIL) (|fl| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fl|
                  (SPADCALL
                   (SPADCALL (SPADCALL |f| (QREFELT $ 313)) 2 (QREFELT $ 51))
                   (QREFELT $ 187))
                  . #7=(|LODOF2;factor_minmult1|))
            (LETT |t|
                  (|LODOF2;try_factorization| |r| |fl| |bound| |sng| |f| |eb| 0
                   "" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 382))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t| . #7#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#))
                     . #7#)
               (GO #8=#:G1709))))
            (LETT |w|
                  (PROG2
                      (LETT #6#
                            (|LODOF2;factor_op|
                             (SPADCALL (QVELT |sng| 1) (QREFELT $ 383))
                             |factorizer| "all right factors" $)
                            . #7#)
                      (QCDR #6#)
                    (|check_union2| (QEQCAR #6# 1)
                                    (|List|
                                     (|Union|
                                      (|LinearOrdinaryDifferentialOperator3|
                                       (|Expression| (|Integer|))
                                       (|UnivariateTaylorSeries|
                                        (|Expression| (|Integer|))
                                        (QREFELT $ 6) (QREFELT $ 7))
                                       (|UnivariateLaurentSeries|
                                        (|Expression| (|Integer|))
                                        (QREFELT $ 6) (QREFELT $ 7)))
                                      (|Record|
                                       (|:| |ope|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))))
                                       (|:| |dext| (|PositiveInteger|))
                                       (|:| |alpha| (|Expression| (|Integer|)))
                                       (|:| |rami|
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|)))))))
                                    (|Union|
                                     (|List|
                                      (|Record|
                                       (|:| |op|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))))
                                       (|:| |ram|
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|))))
                                       (|:| |expart|
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))))
                                     (|List|
                                      (|Union|
                                       (|LinearOrdinaryDifferentialOperator3|
                                        (|Expression| (|Integer|))
                                        (|UnivariateTaylorSeries|
                                         (|Expression| (|Integer|))
                                         (QREFELT $ 6) (QREFELT $ 7))
                                        (|UnivariateLaurentSeries|
                                         (|Expression| (|Integer|))
                                         (QREFELT $ 6) (QREFELT $ 7)))
                                       (|Record|
                                        (|:| |ope|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))))
                                        (|:| |dext| (|PositiveInteger|))
                                        (|:| |alpha|
                                             (|Expression| (|Integer|)))
                                        (|:| |rami|
                                             (|UnivariatePolynomial|
                                              (QREFELT $ 6)
                                              (|Expression| (|Integer|))))))))
                                    #6#))
                  . #7#)
            (LETT |r_left| (|spadConstant| $ 18) . #7#)
            (SEQ (LETT |i| NIL . #7#) (LETT #5# |w| . #7#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#) . #7#) NIL)
                       (NULL
                        (SPADCALL |r_left| (|spadConstant| $ 18)
                                  (QREFELT $ 222))))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((|LODOF2;same_charclass?|
                      (PROG2 (LETT #4# |i| . #7#)
                          (QCDR #4#)
                        (|check_union2| (QEQCAR #4# 0)
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7))
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7)))
                                        (|Union|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7)))
                                         (|Record|
                                          (|:| |ope|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))))
                                          (|:| |dext| (|PositiveInteger|))
                                          (|:| |alpha|
                                               (|Expression| (|Integer|)))
                                          (|:| |rami|
                                               (|UnivariatePolynomial|
                                                (QREFELT $ 6)
                                                (|Expression| (|Integer|))))))
                                        #4#))
                      (SPADCALL |r| (QREFELT $ 383)) |factorizer| $)
                     (LETT |r_left|
                           (PROG2 (LETT #4# |i| . #7#)
                               (QCDR #4#)
                             (|check_union2| (QEQCAR #4# 0)
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))))
                                             #4#))
                           . #7#)))))
                 (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |r_left| (|spadConstant| $ 18) (QREFELT $ 222))
              (|error| "bug")))
            (LETT |t|
                  (|LODOF2;try_factorization| |r_left| |fl| |bound| |sng| |f|
                   |eba| 0 "use adjoint" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 382))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t| . #7#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#))
                     . #7#)
               (GO #8#))))
            (LETT |t|
                  (|LODOF2;try_factorization| |r|
                   (- (SPADCALL |f| (QREFELT $ 313)) 1) |bound| |sng| |f| |eb|
                   (+ |fl| 1) "" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 382))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t| . #7#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#))
                     . #7#)
               (GO #8#))))
            (LETT |t|
                  (|LODOF2;try_factorization| |r_left|
                   (- (SPADCALL |f| (QREFELT $ 313)) 1) |bound| |sng| |f| |eba|
                   (+ |fl| 1) "use adjoint" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 382))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t| . #7#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#))
                     . #7#)
               (GO #8#))))
            (EXIT (LIST |f|))))
          #8# (EXIT #1#)))) 

(SDEFUN |LODOF2;l_p|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator1|
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|p| |Union| (|Expression| (|Integer|)) #2="infinity")
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|llr|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|ftmp| #1#)
          (|lpf|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|newd|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd|
           #3=(|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcn| #3#)
          (|newx|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#4=#:G1713 NIL) (|dg| (|NonNegativeInteger|))
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (SEQ (LETT |lpf| (|spadConstant| $ 310) . #5=(|LODOF2;l_p|))
              (COND
               ((SPADCALL |p| (CONS 0 (|spadConstant| $ 19)) (QREFELT $ 315))
                (LETT |lpf| |f| . #5#))
               ('T
                (SEQ (LETT |ftmp| |f| . #5#)
                     (EXIT
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL |ftmp| (|spadConstant| $ 310)
                                        (QREFELT $ 311)))
                             (GO G191)))
                           (SEQ
                            (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 312)) . #5#)
                            (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 313)) . #5#)
                            (COND
                             ((SPADCALL |p| (CONS 1 "infinity")
                                        (QREFELT $ 315))
                              (LETT |newx|
                                    (SPADCALL (|spadConstant| $ 153)
                                              (SPADCALL (|spadConstant| $ 12) 1
                                                        (QREFELT $ 58))
                                              (QREFELT $ 316))
                                    . #5#))
                             ('T
                              (LETT |newx|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 12) 1
                                                (QREFELT $ 58))
                                      (SPADCALL
                                       (PROG2 (LETT #4# |p| . #5#)
                                           (QCDR #4#)
                                         (|check_union2| (QEQCAR #4# 0)
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|Union|
                                                          (|Expression|
                                                           (|Integer|))
                                                          #2#)
                                                         #4#))
                                       (QREFELT $ 227))
                                      (QREFELT $ 59))
                                     (QREFELT $ 232))
                                    . #5#)))
                            (LETT |lcn|
                                  (|LODOF2;subsup|
                                   (SPADCALL |lc| (QREFELT $ 29)) |newx| $)
                                  . #5#)
                            (LETT |lcd|
                                  (|LODOF2;subsup|
                                   (SPADCALL |lc| (QREFELT $ 27)) |newx| $)
                                  . #5#)
                            (LETT |slc| (SPADCALL |lcn| |lcd| (QREFELT $ 305))
                                  . #5#)
                            (COND
                             ((SPADCALL |p| (CONS 1 "infinity")
                                        (QREFELT $ 315))
                              (LETT |newd|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| $ 12) 1
                                                  (QREFELT $ 58))
                                        2 (QREFELT $ 70))
                                       (QREFELT $ 232))
                                      (SPADCALL (QREFELT $ 317))
                                      (QREFELT $ 318))
                                     (QREFELT $ 319))
                                    . #5#))
                             ('T
                              (LETT |newd| (SPADCALL (QREFELT $ 317)) . #5#)))
                            (LETT |lpf|
                                  (SPADCALL |lpf|
                                            (SPADCALL |slc|
                                                      (SPADCALL |newd| |dg|
                                                                (QREFELT $
                                                                         320))
                                                      (QREFELT $ 318))
                                            (QREFELT $ 321))
                                  . #5#)
                            (EXIT
                             (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 322))
                                   . #5#)))
                           NIL (GO G190) G191 (EXIT NIL))))))
              (LETT |llr|
                    (|LODOF2;convertL3toLL| (SPADCALL |lpf| (QREFELT $ 385)) $)
                    . #5#)
              (EXIT
               (SPADCALL
                (SPADCALL (|spadConstant| $ 14) (SPADCALL |llr| (QREFELT $ 37))
                          (QREFELT $ 252))
                |llr| (QREFELT $ 160)))))) 

(SDEFUN |LODOF2;testlp;LodoULodo;54|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|p| |Union| (|Expression| (|Integer|)) "infinity")
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;l_p| |f| |p| $)) 

(SDEFUN |LODOF2;subsup|
        ((|np| . #1=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|newx| |Fraction|
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         ($ |Fraction|
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
        (SPROG
         ((|nptmp| #1#)
          (|res|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|dg| (|NonNegativeInteger|)) (|lc| (|Expression| (|Integer|))))
         (SEQ (LETT |res| (|spadConstant| $ 387) . #2=(|LODOF2;subsup|))
              (LETT |nptmp| |np| . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |nptmp| (|spadConstant| $ 52) (QREFELT $ 154)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |nptmp| (QREFELT $ 192)) . #2#)
                        (LETT |dg| (SPADCALL |nptmp| (QREFELT $ 75)) . #2#)
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| (QREFELT $ 227))
                                         (SPADCALL |newx| |dg| (QREFELT $ 388))
                                         (QREFELT $ 389))
                                        (QREFELT $ 390))
                              . #2#)
                        (EXIT
                         (LETT |nptmp| (SPADCALL |nptmp| (QREFELT $ 194))
                               . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;get_trace|
        ((|f| |Expression| (|Integer|))
         (|k| |Kernel| (|Expression| (|Integer|)))
         ($ |Expression| (|Integer|)))
        (SPROG
         ((|fa| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|Sae|
           (|Join|
            (|MonogenicAlgebra| #1=(|Expression| (|Integer|))
                                (|UnivariatePolynomial| |var|
                                                        (|Expression|
                                                         (|Integer|))))
            (CATEGORY |package|
             (IF (|has| #1# (|Field|))
                 (IF (|has| #1# (|PolynomialFactorizationExplicit|))
                     (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                     |noBranch|)
                 |noBranch|))))
          (|min_pol|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (SEQ
          (LETT |min_pol| (SPADCALL |k| (QREFELT $ 392))
                . #2=(|LODOF2;get_trace|))
          (LETT |Sae|
                (|SimpleAlgebraicExtension| (|Expression| (|Integer|))
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|)))
                                            (SPADCALL |min_pol|
                                                      (QREFELT $ 101)))
                . #2#)
          (LETT |fa| (SPADCALL |f| |k| |min_pol| (QREFELT $ 395)) . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |fa| (QREFELT $ 101))
                      (|compiledLookupCheck| '|reduce|
                                             (LIST '$
                                                   (LIST
                                                    '|UnivariatePolynomial|
                                                    (|devaluate| (ELT $ 6))
                                                    (LIST '|Expression|
                                                          (LIST '|Integer|))))
                                             |Sae|))
            (|compiledLookupCheck| '|trace|
                                   (LIST (LIST '|Expression| (LIST '|Integer|))
                                         '$)
                                   |Sae|)))))) 

(SDEFUN |LODOF2;testgt;EKE;57|
        ((|f| |Expression| (|Integer|))
         (|k| |Kernel| (|Expression| (|Integer|)))
         ($ |Expression| (|Integer|)))
        (|LODOF2;get_trace| |f| |k| $)) 

(SDEFUN |LODOF2;make_poly|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         ($ |SparseUnivariatePolynomial| (|Expression| (|Integer|))))
        (SPROG
         ((|ftmp| #1#)
          (|res| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
         (SEQ (LETT |res| (|spadConstant| $ 397) . #2=(|LODOF2;make_poly|))
              (LETT |ftmp| |f| . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)) . #2#)
                        (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)) . #2#)
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| 0 (QREFELT $ 57)) |dg|
                                         (QREFELT $ 398))
                                        (QREFELT $ 399))
                              . #2#)
                        (EXIT
                         (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;compute_bound|
        ((|gem| |List|
          (|Record|
           (|:| |singularity|
                (|Record|
                 (|:| |point| (|Union| (|Expression| (|Integer|)) "infinity"))
                 (|:| |lpf|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))
                 (|:| |dxt| (|PositiveInteger|))))
           (|:| |fos|
                (|List|
                 (|Record|
                  (|:| |op|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |ram|
                       (|UnivariatePolynomial| |var|
                                               (|Expression| (|Integer|))))
                  (|:| |expart|
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))))
           (|:| |mge|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))))
         (|rlc| |Expression| (|Integer|)) ($ |Integer|))
        (SPROG
         ((|res| (|Fraction| (|Integer|))) (#1=#:G1740 NIL) (#2=#:G1763 NIL)
          (|ma| (|Union| (|Fraction| (|Integer|)) #3="-infinity"))
          (|cq| (|Fraction| (|Integer|))) (|c| (|Expression| (|Integer|)))
          (#4=#:G1770 NIL) (|ke| NIL)
          (|ks| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|vpej| #5=(|Fraction| (|Integer|))) (|vpei| #5#)
          (|rjj| #6=(|NonNegativeInteger|)) (#7=#:G1768 NIL) (|jj| NIL)
          (#8=#:G1769 NIL) (|fpsjj| NIL) (|r| #6#) (#9=#:G1765 NIL) (|f| NIL)
          (#10=#:G1766 NIL) (|fps| NIL) (#11=#:G1767 NIL) (|ji| NIL)
          (#12=#:G1764 NIL) (|ge| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res| (|spadConstant| $ 68) . #13=(|LODOF2;compute_bound|))
            (SEQ (LETT |ge| NIL . #13#) (LETT #12# |gem| . #13#) G190
                 (COND
                  ((OR (ATOM #12#) (PROGN (LETT |ge| (CAR #12#) . #13#) NIL))
                   (GO G191)))
                 (SEQ (LETT |ma| (CONS 1 "-infinity") . #13#)
                      (SEQ (LETT |ji| 1 . #13#)
                           (LETT #11# (LENGTH (QVELT |ge| 2)) . #13#)
                           (LETT |fps| NIL . #13#)
                           (LETT #10# (QVELT |ge| 1) . #13#)
                           (LETT |f| NIL . #13#)
                           (LETT #9# (QVELT |ge| 2) . #13#) G190
                           (COND
                            ((OR (ATOM #9#)
                                 (PROGN (LETT |f| (CAR #9#) . #13#) NIL)
                                 (ATOM #10#)
                                 (PROGN (LETT |fps| (CAR #10#) . #13#) NIL)
                                 (|greater_SI| |ji| #11#))
                             (GO G191)))
                           (SEQ
                            (LETT |r| (SPADCALL (QVELT |fps| 1) (QREFELT $ 75))
                                  . #13#)
                            (LETT |c| (SPADCALL |f| 0 (QREFELT $ 57)) . #13#)
                            (SEQ (LETT |fpsjj| NIL . #13#)
                                 (LETT #8#
                                       (SPADCALL (QVELT |ge| 1) |ji|
                                                 (QREFELT $ 401))
                                       . #13#)
                                 (LETT |jj| NIL . #13#)
                                 (LETT #7#
                                       (SPADCALL (QVELT |ge| 2) |ji|
                                                 (QREFELT $ 400))
                                       . #13#)
                                 G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN (LETT |jj| (CAR #7#) . #13#) NIL)
                                       (ATOM #8#)
                                       (PROGN
                                        (LETT |fpsjj| (CAR #8#) . #13#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |rjj|
                                        (SPADCALL (QVELT |fpsjj| 1)
                                                  (QREFELT $ 75))
                                        . #13#)
                                  (LETT |vpei|
                                        (SPADCALL
                                         (SPADCALL |f| 0 (QREFELT $ 42)) |r|
                                         (QREFELT $ 51))
                                        . #13#)
                                  (LETT |vpej|
                                        (SPADCALL
                                         (SPADCALL |jj| 0 (QREFELT $ 42)) |rjj|
                                         (QREFELT $ 51))
                                        . #13#)
                                  (EXIT
                                   (LETT |c|
                                         (SPADCALL |c|
                                                   (SPADCALL
                                                    (SPADCALL |vpei| |vpej|
                                                              (QREFELT $ 109))
                                                    (QREFELT $ 242))
                                                   (QREFELT $ 402))
                                         . #13#)))
                                 (LETT #7#
                                       (PROG1 (CDR #7#)
                                         (LETT #8# (CDR #8#) . #13#))
                                       . #13#)
                                 (GO G190) G191 (EXIT NIL))
                            (LETT |ks| (SPADCALL |c| (QREFELT $ 404)) . #13#)
                            (SEQ (LETT |ke| NIL . #13#) (LETT #4# |ks| . #13#)
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN
                                        (LETT |ke| (CAR #4#) . #13#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((QEQCAR
                                      (SPADCALL (SPADCALL |ke| (QREFELT $ 405))
                                                (QREFELT $ 407))
                                      1)
                                     (SEQ
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c| (QREFELT $ 408)) |ke|
                                          |rlc| (QREFELT $ 409))
                                         (|spadConstant| $ 19) (QREFELT $ 237))
                                        (PROGN
                                         (LETT #2#
                                               (|LODOF2;compute_bound| |gem|
                                                (SPADCALL |rlc|
                                                          (|spadConstant| $ 12)
                                                          (QREFELT $ 402))
                                                $)
                                               . #13#)
                                         (GO #14=#:G1762))))
                                      (EXIT
                                       (LETT |c|
                                             (SPADCALL |c| |ke| |rlc|
                                                       (QREFELT $ 409))
                                             . #13#))))
                                    ('T
                                     (LETT |c|
                                           (SPADCALL
                                            (|LODOF2;get_trace| |c| |ke| $)
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |ke| (QREFELT $ 392))
                                              (QREFELT $ 410))
                                             (QREFELT $ 78))
                                            (QREFELT $ 79))
                                           . #13#)))))
                                 (LETT #4# (CDR #4#) . #13#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |cq| (SPADCALL |c| (QREFELT $ 411)) . #13#)
                            (EXIT
                             (COND
                              ((SPADCALL |ma| (CONS 1 "-infinity")
                                         (QREFELT $ 413))
                               (LETT |ma|
                                     (CONS 0 (SPADCALL |cq| (QREFELT $ 368)))
                                     . #13#))
                              ('T
                               (LETT |ma|
                                     (CONS 0
                                           (SPADCALL
                                            (SPADCALL |cq| (QREFELT $ 368))
                                            (PROG2 (LETT #1# |ma| . #13#)
                                                (QCDR #1#)
                                              (|check_union2| (QEQCAR #1# 0)
                                                              (|Fraction|
                                                               (|Integer|))
                                                              (|Union|
                                                               (|Fraction|
                                                                (|Integer|))
                                                               #3#)
                                                              #1#))
                                            (QREFELT $ 414)))
                                     . #13#)))))
                           (LETT #9#
                                 (PROG1 (CDR #9#)
                                   (LETT #10#
                                         (PROG1 (CDR #10#)
                                           (LETT |ji| (|inc_SI| |ji|) . #13#))
                                         . #13#))
                                 . #13#)
                           (GO G190) G191 (EXIT NIL))
                      (COND
                       ((SPADCALL |ma| (CONS 1 "-infinity") (QREFELT $ 413))
                        (PROGN (LETT #2# 0 . #13#) (GO #14#))))
                      (EXIT
                       (LETT |res|
                             (SPADCALL |res|
                                       (SPADCALL (QVELT (QVELT |ge| 0) 2)
                                                 (PROG2 (LETT #1# |ma| . #13#)
                                                     (QCDR #1#)
                                                   (|check_union2|
                                                    (QEQCAR #1# 0)
                                                    (|Fraction| (|Integer|))
                                                    (|Union|
                                                     (|Fraction| (|Integer|))
                                                     #3#)
                                                    #1#))
                                                 (QREFELT $ 366))
                                       (QREFELT $ 108))
                             . #13#)))
                 (LETT #12# (CDR #12#) . #13#) (GO G190) G191 (EXIT NIL))
            (EXIT (MAX 0 (SPADCALL |res| (QREFELT $ 187))))))
          #14# (EXIT #2#)))) 

(SDEFUN |LODOF2;gen_exp;LodoUMLL;60|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|p| |Union| (|Expression| (|Integer|)) #1="infinity")
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))
          (|List| (|Expression| (|Integer|))))
         (|y| |List| (|Expression| (|Integer|)))
         ($ |List|
          (|Record|
           (|:| |ecs|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |ecr|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
           (|:| |ect|
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |ecs|
                  (|List|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ecr|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |ect|
                  (|Fraction|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|tr|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#2=#:G1773 NIL)
          (|ss|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#3=#:G1795 NIL) (|root| NIL) (#4=#:G1794 NIL)
          (|es| (|List| (|Expression| (|Integer|)))) (#5=#:G1793 NIL) (|g| NIL)
          (#6=#:G1792 NIL)
          (|s|
           #7=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)))
          (|r| (|NonNegativeInteger|)) (#8=#:G1791 NIL) (|e| NIL)
          (|v|
           (|List|
            (|Record| (|:| |op| #7#)
                      (|:| |ram|
                           (|UnivariatePolynomial| |var|
                                                   (|Expression| (|Integer|))))
                      (|:| |expart|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))))
          (#9=#:G1781 NIL)
          (|factorizer2|
           (|Mapping|
            (|Factored|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
         (SEQ
          (LETT |factorizer2|
                (CONS #'|LODOF2;gen_exp;LodoUMLL;60!0|
                      (VECTOR |factorizer| |y|))
                . #10=(|LODOF2;gen_exp;LodoUMLL;60|))
          (LETT |v|
                (PROG2
                    (LETT #9#
                          (|LODOF2;factor_op| (|LODOF2;l_p| |f| |p| $)
                           |factorizer2| "semireg" $)
                          . #10#)
                    (QCDR #9#)
                  (|check_union2| (QEQCAR #9# 0)
                                  (|List|
                                   (|Record|
                                    (|:| |op|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))))
                                    (|:| |ram|
                                         (|UnivariatePolynomial| (QREFELT $ 6)
                                                                 (|Expression|
                                                                  (|Integer|))))
                                    (|:| |expart|
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7)))))
                                  (|Union|
                                   (|List|
                                    (|Record|
                                     (|:| |op|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))))
                                     (|:| |ram|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))
                                     (|:| |expart|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7)))))
                                   (|List|
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))))
                                  #9#))
                . #10#)
          (LETT |res| NIL . #10#)
          (SEQ (LETT |e| NIL . #10#) (LETT #8# |v| . #10#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |e| (CAR #8#) . #10#) NIL))
                 (GO G191)))
               (SEQ (LETT |r| (SPADCALL (QVELT |e| 1) (QREFELT $ 75)) . #10#)
                    (LETT |s| (QVELT |e| 0) . #10#)
                    (LETT |es|
                          (PROGN
                           (LETT #6# NIL . #10#)
                           (SEQ (LETT |g| NIL . #10#)
                                (LETT #5#
                                      (SPADCALL
                                       (SPADCALL (|LODOF2;make_poly| |s| $)
                                                 |factorizer2|)
                                       (QREFELT $ 417))
                                      . #10#)
                                G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |g| (CAR #5#) . #10#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (SPADCALL (QCAR |g|) (QREFELT $ 418))
                                         #6#)
                                        . #10#)))
                                (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          . #10#)
                    (LETT |ss|
                          (PROGN
                           (LETT #4# NIL . #10#)
                           (SEQ (LETT |root| NIL . #10#) (LETT #3# |es| . #10#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN
                                       (LETT |root| (CAR #3#) . #10#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |root| (QREFELT $ 193))
                                           (QVELT |e| 2) (QREFELT $ 218))
                                          (SPADCALL |r| (QREFELT $ 78))
                                          (QREFELT $ 251))
                                         #4#)
                                        . #10#)))
                                (LETT #3# (CDR #3#) . #10#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          . #10#)
                    (COND
                     ((SPADCALL |p| (CONS 1 "infinity") (QREFELT $ 315))
                      (LETT |tr|
                            (SPADCALL (|spadConstant| $ 153)
                                      (SPADCALL (|spadConstant| $ 12) 1
                                                (QREFELT $ 58))
                                      (QREFELT $ 316))
                            . #10#))
                     ('T
                      (LETT |tr|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL
                               (PROG2 (LETT #2# |p| . #10#)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0)
                                                 (|Expression| (|Integer|))
                                                 (|Union|
                                                  (|Expression| (|Integer|))
                                                  #1#)
                                                 #2#))
                               (QREFELT $ 227))
                              (QREFELT $ 86))
                             (QREFELT $ 232))
                            . #10#)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (LIST (VECTOR |ss| (QVELT |e| 1) |tr|))
                                     (QREFELT $ 421))
                           . #10#)))
               (LETT #8# (CDR #8#) . #10#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;gen_exp;LodoUMLL;60!0| ((|x| NIL) ($$ NIL))
        (PROG (|y| |factorizer|)
          (LETT |y| (QREFELT $$ 1) . #1=(|LODOF2;gen_exp;LodoUMLL;60|))
          (LETT |factorizer| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |y| |factorizer|))))) 

(SDEFUN |LODOF2;ge_minimal;LodoMSL;61|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |List|
          (|Record|
           (|:| |singularity|
                (|Record|
                 (|:| |point|
                      (|Union| (|Expression| (|Integer|)) #1="infinity"))
                 (|:| |lpf|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))
                 (|:| |dxt| (|PositiveInteger|))))
           (|:| |fos|
                (|List|
                 (|Record|
                  (|:| |op|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |ram|
                       (|UnivariatePolynomial| |var|
                                               (|Expression| (|Integer|))))
                  (|:| |expart|
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))))
           (|:| |mge|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |singularity|
                  (|Record|
                   (|:| |point| (|Union| (|Expression| (|Integer|)) #1#))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |fos|
                  (|List|
                   (|Record|
                    (|:| |op|
                         (|LinearOrdinaryDifferentialOperator3|
                          (|Expression| (|Integer|))
                          (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)
                          (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)))
                    (|:| |ram|
                         (|UnivariatePolynomial| |var|
                                                 (|Expression| (|Integer|))))
                    (|:| |expart|
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))))
             (|:| |mge|
                  (|List|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))))
          (|mg|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (|ss|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ms| (|Expression| (|Integer|)))
          (|es| (|List| (|Fraction| (|Integer|)))) (#2=#:G1855 NIL) (|g| NIL)
          (#3=#:G1854 NIL)
          (|s|
           #4=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)))
          (|r| (|NonNegativeInteger|)) (#5=#:G1853 NIL) (|e| NIL)
          (|v|
           (|List|
            (|Record| (|:| |op| #4#)
                      (|:| |ram|
                           (|UnivariatePolynomial| |var|
                                                   (|Expression| (|Integer|))))
                      (|:| |expart|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))))
          (#6=#:G1814 NIL) (#7=#:G1852 NIL) (|sg| NIL)
          (|singularities|
           (|List|
            (|Record| (|:| |point| (|Union| (|Expression| (|Integer|)) #1#))
                      (|:| |lpf|
                           (|LinearOrdinaryDifferentialOperator3|
                            (|Expression| (|Integer|))
                            (|UnivariateTaylorSeries|
                             (|Expression| (|Integer|)) |var| |cen|)
                            (|UnivariateLaurentSeries|
                             (|Expression| (|Integer|)) |var| |cen|)))
                      (|:| |dxt| (|PositiveInteger|)))))
          (#8=#:G1851 NIL) (#9=#:G1850 NIL) (|root| (|Expression| (|Integer|)))
          (#10=#:G1849 NIL)
          (|dnf|
           (|List|
            (|Record|
             (|:| |factor|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|Integer|)))))
          (#11=#:G1848 NIL) (|p| NIL)
          (|dlc|
           (|List| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#12=#:G1847 NIL) (#13=#:G1846 NIL))
         (SEQ
          (LETT |dlc|
                (PROGN
                 (LETT #13# NIL . #14=(|LODOF2;ge_minimal;LodoMSL;61|))
                 (SEQ (LETT |e| (SPADCALL |f| (QREFELT $ 356)) . #14#)
                      (LETT #12# (SPADCALL |f| (QREFELT $ 313)) . #14#) G190
                      (COND ((> |e| #12#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #13#
                              (CONS
                               (SPADCALL (SPADCALL |f| |e| (QREFELT $ 354))
                                         (QREFELT $ 27))
                               #13#)
                              . #14#)))
                      (LETT |e| (+ |e| 1) . #14#) (GO G190) G191
                      (EXIT (NREVERSE #13#))))
                . #14#)
          (LETT |dlc| (SPADCALL |dlc| (QREFELT $ 425)) . #14#)
          (LETT |dnf| NIL . #14#)
          (SEQ (LETT |p| NIL . #14#) (LETT #11# |dlc| . #14#) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |p| (CAR #11#) . #14#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |dnf|
                       (SPADCALL |dnf|
                                 (SPADCALL
                                  (|LODOF2;factorUP| |p| |factorizer| $)
                                  (QREFELT $ 67))
                                 (QREFELT $ 426))
                       . #14#)))
               (LETT #11# (CDR #11#) . #14#) (GO G190) G191 (EXIT NIL))
          (COND
           ((|LODOF2;inf_singularity?| |f| $)
            (LETT |singularities|
                  (LIST
                   (VECTOR (CONS 1 "infinity")
                           (|LODOF2;l_p| |f| (CONS 1 "infinity") $) 1))
                  . #14#))
           ('T (LETT |singularities| NIL . #14#)))
          (SEQ (LETT |g| NIL . #14#) (LETT #10# |dnf| . #14#) G190
               (COND
                ((OR (ATOM #10#) (PROGN (LETT |g| (CAR #10#) . #14#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |root|
                      (SPADCALL (SPADCALL (QCAR |g|) (QREFELT $ 100))
                                (QREFELT $ 418))
                      . #14#)
                (EXIT
                 (LETT |singularities|
                       (CONS
                        (VECTOR (CONS 0 |root|)
                                (|LODOF2;l_p| |f| (CONS 0 |root|) $)
                                (SPADCALL (QCAR |g|) (QREFELT $ 75)))
                        |singularities|)
                       . #14#)))
               (LETT #10# (CDR #10#) . #14#) (GO G190) G191 (EXIT NIL))
          (COND
           ((EQUAL |option| "use adjoint")
            (LETT |singularities|
                  (PROGN
                   (LETT #9# NIL . #14#)
                   (SEQ (LETT |sg| NIL . #14#)
                        (LETT #8# |singularities| . #14#) G190
                        (COND
                         ((OR (ATOM #8#)
                              (PROGN (LETT |sg| (CAR #8#) . #14#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #9#
                                (CONS
                                 (VECTOR (QVELT |sg| 0)
                                         (SPADCALL (QVELT |sg| 1)
                                                   (QREFELT $ 383))
                                         (QVELT |sg| 2))
                                 #9#)
                                . #14#)))
                        (LETT #8# (CDR #8#) . #14#) (GO G190) G191
                        (EXIT (NREVERSE #9#))))
                  . #14#)))
          (LETT |res| NIL . #14#)
          (SEQ (LETT |sg| NIL . #14#) (LETT #7# |singularities| . #14#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |sg| (CAR #7#) . #14#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |v|
                      (PROG2
                          (LETT #6#
                                (|LODOF2;factor_op| (QVELT |sg| 1) |factorizer|
                                 "semireg" $)
                                . #14#)
                          (QCDR #6#)
                        (|check_union2| (QEQCAR #6# 0)
                                        (|List|
                                         (|Record|
                                          (|:| |op|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))))
                                          (|:| |ram|
                                               (|UnivariatePolynomial|
                                                (QREFELT $ 6)
                                                (|Expression| (|Integer|))))
                                          (|:| |expart|
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))))
                                        (|Union|
                                         (|List|
                                          (|Record|
                                           (|:| |op|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |ram|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|))))
                                           (|:| |expart|
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6)
                                                 (QREFELT $ 7)))))
                                         (|List|
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Expression|
                                                   (|Integer|))))))))
                                        #6#))
                      . #14#)
                (LETT |mg| NIL . #14#)
                (SEQ (LETT |e| NIL . #14#) (LETT #5# |v| . #14#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |e| (CAR #5#) . #14#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |r| (SPADCALL (QVELT |e| 1) (QREFELT $ 75)) . #14#)
                      (LETT |s| (QVELT |e| 0) . #14#)
                      (LETT |es|
                            (PROGN
                             (LETT #3# NIL . #14#)
                             (SEQ (LETT |g| NIL . #14#)
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL (|LODOF2;make_poly| |s| $)
                                                   |factorizer|)
                                         (QREFELT $ 417))
                                        . #14#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN
                                         (LETT |g| (CAR #2#) . #14#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL (QCAR |g|)
                                                      (QREFELT $ 418))
                                            (QREFELT $ 411))
                                           #3#)
                                          . #14#)))
                                  (LETT #2# (CDR #2#) . #14#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            . #14#)
                      (LETT |ms|
                            (SPADCALL
                             (SPADCALL (ELT $ 109) |es| (QREFELT $ 428))
                             (QREFELT $ 242))
                            . #14#)
                      (LETT |ss|
                            (SPADCALL
                             (SPADCALL (SPADCALL |ms| (QREFELT $ 193))
                                       (QVELT |e| 2) (QREFELT $ 218))
                             (SPADCALL |r| (QREFELT $ 78)) (QREFELT $ 251))
                            . #14#)
                      (EXIT
                       (LETT |mg| (SPADCALL |mg| (LIST |ss|) (QREFELT $ 123))
                             . #14#)))
                     (LETT #5# (CDR #5#) . #14#) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |res| (CONS (VECTOR |sg| |v| |mg|) |res|) . #14#)))
               (LETT #7# (CDR #7#) . #14#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperatorFactorizer2;|)) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer2| (&REST #1=#:G1856)
  (SPROG NIL
         (PROG (#2=#:G1857)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperatorFactorizer2|)
                                               '|domainEqualList|)
                    . #3=(|LinearOrdinaryDifferentialOperatorFactorizer2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |LinearOrdinaryDifferentialOperatorFactorizer2;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperatorFactorizer2|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|LinearOrdinaryDifferentialOperatorFactorizer2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$|
                (LIST '|LinearOrdinaryDifferentialOperatorFactorizer2| DV$1
                      DV$2)
                . #1#)
          (LETT $ (GETREFV 429) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|LinearOrdinaryDifferentialOperatorFactorizer2|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperatorFactorizer2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|UnivariatePolynomial| (NRTEVAL (QREFELT $ 6)) 11)
              (|UnivariateTaylorSeries| 11 (NRTEVAL (QREFELT $ 6))
                                        (NRTEVAL (QREFELT $ 7)))
              (0 . |coerce|) (|Expression| 38) (5 . |One|)
              (|UnivariateLaurentSeries| 11 (NRTEVAL (QREFELT $ 6))
                                         (NRTEVAL (QREFELT $ 7)))
              (9 . |One|) (|NonNegativeInteger|) (13 . |univariatePolynomial|)
              (|LinearOrdinaryDifferentialOperator3| 11 9 13) (19 . |Zero|)
              (23 . |Zero|) (27 . |Zero|)
              (|LinearOrdinaryDifferentialOperator3| 11 8 25) (31 . |Zero|)
              (|Boolean|) (35 . ~=) (|Fraction| 8) (41 . |leadingCoefficient|)
              (46 . |denom|) (51 . |coerce|) (56 . |numer|)
              (|Union| $ '"failed") (61 . |recip|) (66 . *) (72 . |degree|)
              (77 . |monomial|) (83 . +) (89 . |reductum|)
              (94 . |leadingCoefficient|) (|Integer|) (99 . |order|) (104 . ~=)
              (110 . |degree|) (115 . |order|) (121 . ~=) (127 . |reductum|)
              (|Record| (|:| |x| 38) (|:| |y| 38)) (|List| 45) (132 . |elt|)
              (138 . >) (144 . <=) (|Fraction| 38) (150 . /) (156 . |Zero|)
              (160 . |denom|) (165 . |coefficient|) (171 . |numer|) (176 . *)
              (182 . |coefficient|) (188 . |monomial|) (194 . +)
              (|Record| (|:| |point| 45) (|:| |slope| 50) (|:| |npoly| 8))
              (|List| 60) (200 . |append|) |LODOF2;testnp;LodoL;6|
              (|Record| (|:| |factor| 8) (|:| |exponent| 38)) (|List| 64)
              (|Factored| 8) (206 . |factors|) (211 . |Zero|) (215 . ~=)
              (221 . ^) (|OneDimensionalArray| 8) (227 . |setelt!|) (|List| $)
              (234 . |tails|) (239 . |degree|) (244 . |coefficient|) (250 . -)
              (256 . |coerce|) (261 . /) (|IntegerRetractions| 11)
              (267 . |integer?|) (272 . ~=) (278 . |integer|) (283 . |coerce|)
              (288 . |eval|) (295 . -) (301 . =) (307 . >) (313 . |elt|)
              (319 . *) (325 . |setDifference|) (331 . |position|)
              (337 . |elt|) (|List| 17) (343 . |append|) (|Mapping| 103 99)
              (|String|) |LODOF2;testfn;LodoMSL;8|
              (|SparseUnivariatePolynomial| 11) (349 . |makeSUP|)
              (354 . |unmakeSUP|) (|Mapping| 8 99) (|Factored| 99)
              (|FactoredFunctions2| 99 8) (359 . |map|) (365 . |coerce|)
              (370 . *) (376 . +) (382 . |min|) (388 . |quo|) (394 . =)
              (|Record| (|:| |Qt| 17) (|:| |Rt| 17))
              |LODOF2;testf2;LodoUpFR;11| (|List| 13) (400 . |elt|)
              (|Record| (|:| |laurl| 114) (|:| |laurr| 114))
              |LODOF2;testll;FLodo2UpFIR;14|
              (|Record| (|:| |k| 38) (|:| |c| 11)) (|Stream| 118) (|List| 119)
              (406 . |elt|) (412 . |series|) (417 . |append|) (|Stream| 17)
              (|Mapping| 17 112) (|Stream| 112) (|StreamFunctions2| 112 17)
              (423 . |map|) (429 . |retract|)
              (|Record| (|:| |llc| 120) (|:| |rlc| 120))
              |LODOF2;testlc;FLodo2UpFIR;17| (|SingleInteger|) (434 . |One|)
              (438 . +) (|Mapping| 38 38) (|Stream| 38) (444 . |stream|)
              (450 . -) (456 . *) (|Union| 38 '"failed") (462 . |retractIfCan|)
              (467 . =) (|Mapping| 118 17 38) (|StreamFunctions3| 17 38 118)
              (473 . |map|) (480 . |append|) (|List| 118) (486 . |coerce|)
              (491 . |monomial|) (497 . *)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (503 . |extendedEuclidean|) (509 . |One|) (513 . ~=)
              (519 . |rem|) (525 . -) (530 . |pi|) (534 . |pi|) (538 . |pi|)
              (542 . *) (548 . -) (553 . *)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 163 '"failed") (559 . |extendedEuclidean|)
              (|PositiveInteger|) (566 . *) (572 . -) (|OutputForm|)
              (578 . |coerce|) (|Void|) (583 . |print|)
              (|Record| (|:| |main| 112) (|:| |nf| 112) (|:| |error| 17))
              |LODOF2;testln;FLodo2UpFIR;20| (588 . |One|) (592 . +)
              (|Record| (|:| |lr| 173) (|:| |n_lifts| 166)) (|Mapping| 177 177)
              (|Stream| 177) (598 . |stream|) (|Mapping| 112 177)
              (|StreamFunctions2| 177 112) (604 . |map|)
              |LODOF2;testlw;FLodo2UpFIS;22| (610 . |extendedEuclidean|)
              (616 . |positiveRemainder|) (622 . |floor|)
              |LODOF2;testcp;LodoFILodo;24| (627 . |ceiling|)
              |LODOF2;testco;LodoFIB;26| |LODOF2;testcx;LodoFUp;28|
              (632 . |leadingCoefficient|) (637 . |coerce|) (642 . |reductum|)
              |LODOF2;testpd;UpLodo;30| (647 . |elt|)
              (|Record| (|:| |ope| 17) (|:| |dext| 166) (|:| |alpha| 11)
                        (|:| |rami| 8))
              (|Union| 17 197) (|List| 198) (653 . |value|) (658 . |coerce|)
              (663 . |retractIfCan|) (668 . ~=) (674 . ~=) (680 . |min|)
              (|Mapping| 38 38 38) (|List| 38) (686 . |reduce|) (692 . <=)
              (698 . |truncate|) (704 . -) (709 . *) (|Symbol|)
              (715 . |variable|) (720 . ^) (726 . -) (731 . *) (737 . +)
              (|Record| (|:| |op| 17) (|:| |ram| 8) (|:| |expart| 13))
              (|List| 219) (743 . |append|) (749 . =) (755 . |rightQuotient|)
              (761 . |append|) (|SparseUnivariatePolynomial| $)
              (767 . |zeroOf|) (772 . |coerce|) (777 . ^) (783 . *)
              (|Union| 220 199) |LODOF2;testfr;LodoMSU;32| (789 . |coerce|)
              (794 . |coerce|) (799 . ^) (|Union| 8 13)
              |LODOF2;testsb;ULodoLodo;34| (805 . =) (|Mapping| 11 38)
              (811 . |multiplyCoefficients|) (817 . |multiplyExponents|)
              (823 . ^) (829 . |coerce|) (834 . *)
              |LODOF2;testro;LodoEPiLodo;36| |LODOF2;testfo;LodoMSU;38|
              (|Vector| 13) (840 . |setelt!|) (847 . D) (851 . |apply|)
              (858 . *) (864 . /) (870 . /) (|Mapping| 13 13) (876 . |map!|)
              (882 . +) (|Mapping| 15 15) (|Stream| 15) (888 . |stream|)
              (894 . |elt|) (900 . *) (906 . ^) (|Mapping| 118 15)
              (|StreamFunctions2| 15 118) (912 . |map|) (|List| 246)
              (918 . |elt|) (|Union| 272 '"failed") (|Vector| 11)
              (|IntegerLinearDependence| 11) (924 . |particularSolutionOverQ|)
              (930 . =) (|Vector| 50) (936 . |elt|) (|Mapping| 11 11)
              (942 . |map|) (|List| 114) (948 . |elt|) (954 . |setelt!|)
              (|Matrix| 13) (961 . |matrix|) (966 . ~=) (972 . |One|) (976 . /)
              (982 . |One|) (986 . |One|) (|List| 61) (|Mapping| 61 17)
              (|ListFunctions2| 17 61) (990 . |map|) (996 . |elt|) (1002 . ~=)
              (1008 . /) |LODOF2;testsc;2LodoMB;42| (1014 . |retract|)
              (|Union| 297 '"failed") (1019 . ~=) (|List| 99) (1025 . |elt|)
              (1031 . |One|) (1035 . |monomial|) (1041 . *) (1047 . +)
              (1053 . |One|) (1057 . /) (1063 . /) (1069 . |adjoint|)
              (|LinearOrdinaryDifferentialOperator1| 25)
              (|LODOConvertions| 11 8 25) (1074 . |convert|) (1079 . |Zero|)
              (1083 . ~=) (1089 . |leadingCoefficient|) (1094 . |degree|)
              (|Union| 11 '"infinity") (1099 . =) (1105 . /) (1111 . D)
              (1115 . *) (1121 . -) (1126 . ^) (1132 . +) (1138 . |reductum|)
              (1143 . ~=) (1149 . |rightGcd|) (1155 . |rightQuotient|)
              (1161 . |coerce|) (1166 . *) (1172 . *) (1178 . |leftGcd|)
              (1184 . |leftQuotient|) (|List| 50) (1190 . |elt|) (1196 . *)
              (|Vector| 99) (1202 . |vector|) (|Matrix| 99) (|List| 334)
              (|List| 15) (|VectorHermitePadeSolver|) (1207 . |hp_solve|)
              (1214 . |column|) (1220 . |members|) (1225 . *) (1231 . |append|)
              (|List| 307) (1237 . |elt|) (|Mapping| 103 99 348) (|List| 11)
              |LODOF2;factor;LodoMLL;47| (1243 . |concat|) (1249 . |concat!|)
              (1255 . -) (1260 . |One|) (1264 . |coefficient|) (1270 . /)
              (1276 . |minimumDegree|) (1281 . |lcm|) |LODOF2;testis;LodoB;49|
              (1286 . ~=) (1292 . |message|)
              (|Record| (|:| |point| 314) (|:| |lpf| 17) (|:| |dxt| 166))
              (|Record| (|:| |singularity| 361) (|:| |fos| 220)
                        (|:| |mge| 114))
              (|List| 362) |LODOF2;ge_minimal;LodoMSL;61| (1297 . |append|)
              (1303 . *) (1309 . |setelt!|) (1316 . -) (1321 . |min|)
              (|Character|) (1325 . |min|) (1331 . |min|)
              (|Mapping| 166 166 166) (|List| 166) (1337 . |reduce|)
              (1343 . |remove|) (|Record| (|:| |sing| 361) (|:| |arf| 199))
              (|List| 377) (1349 . |append|) (1355 . |elt|)
              (|Union| 345 '"failed") (1361 . ~=) (1367 . |adjoint|)
              |LODOF2;testfg;LodoML;51| (1372 . |convert|)
              |LODOF2;testlp;LodoULodo;54| (1377 . |Zero|) (1381 . ^)
              (1387 . *) (1393 . +) (|Kernel| $) (1399 . |minPoly|)
              (|Kernel| 11)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 393)
                                                     393 38
                                                     (|SparseMultivariatePolynomial|
                                                      38 393)
                                                     11)
              (1404 . |univariate|) |LODOF2;testgt;EKE;57| (1411 . |Zero|)
              (1415 . |monomial|) (1421 . +) (1427 . |rest|) (1433 . |rest|)
              (1439 . +) (|List| 391) (1445 . |kernels|) (1450 . |coerce|)
              (|Union| (|AlgebraicNumber|) '"failed") (1455 . |retractIfCan|)
              (1460 . |denominator|) (1465 . |eval|) (1472 . |degree|)
              (1477 . |retract|) (|Union| 50 '"-infinity") (1482 . =)
              (1488 . |max|) (|Record| (|:| |factor| 99) (|:| |exponent| 38))
              (|List| 415) (1494 . |factors|) (1499 . |rootOf|)
              (|Record| (|:| |ecs| 114) (|:| |ecr| 8) (|:| |ect| 25))
              (|List| 419) (1504 . |append|) |LODOF2;gen_exp;LodoUMLL;60|
              (|List| 8) (|CylindricalAlgebraicDecompositionUtilities| 11 8)
              (1510 . |squareFreeBasis|) (1515 . |append|) (|Mapping| 50 50 50)
              (1521 . |reduce|))
           '#(|testsc| 1527 |testsb| 1534 |testro| 1540 |testpd| 1547 |testnp|
              1552 |testlw| 1557 |testlp| 1567 |testln| 1573 |testll| 1583
              |testlc| 1593 |testis| 1603 |testgt| 1608 |testfr| 1614 |testfo|
              1621 |testfn| 1628 |testfg| 1635 |testf2| 1641 |testcx| 1648
              |testcp| 1654 |testco| 1661 |gen_exp| 1668 |ge_minimal| 1676
              |factor| 1683)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 428
                                                 '(1 9 0 8 10 0 11 0 12 0 13 0
                                                   14 2 9 8 0 15 16 0 17 0 18 0
                                                   11 0 19 0 13 0 20 0 21 0 22
                                                   2 21 23 0 0 24 1 21 25 0 26
                                                   1 25 8 0 27 1 13 0 9 28 1 25
                                                   8 0 29 1 13 30 0 31 2 13 0 9
                                                   0 32 1 21 15 0 33 2 17 0 13
                                                   15 34 2 17 0 0 0 35 1 21 0 0
                                                   36 1 17 13 0 37 1 13 38 0 39
                                                   2 17 23 0 0 40 1 17 15 0 41
                                                   2 13 38 0 38 42 2 15 23 0 0
                                                   43 1 17 0 0 44 2 46 45 0 38
                                                   47 2 15 23 0 0 48 2 38 23 0
                                                   0 49 2 50 0 38 38 51 0 8 0
                                                   52 1 50 38 0 53 2 17 13 0 15
                                                   54 1 50 38 0 55 2 38 0 15 0
                                                   56 2 13 11 0 38 57 2 8 0 11
                                                   15 58 2 8 0 0 0 59 2 61 0 0
                                                   0 62 1 66 65 0 67 0 50 0 68
                                                   2 50 23 0 0 69 2 8 0 0 15 70
                                                   3 71 8 0 38 8 72 1 65 73 0
                                                   74 1 8 15 0 75 2 8 11 0 15
                                                   76 2 11 0 0 0 77 1 11 0 38
                                                   78 2 11 0 0 0 79 1 80 23 11
                                                   81 2 11 23 0 0 82 1 80 38 11
                                                   83 1 8 0 38 84 3 8 0 0 0 0
                                                   85 2 8 0 0 0 86 2 8 23 0 0
                                                   87 2 38 23 0 0 88 2 71 8 0
                                                   38 89 2 8 0 0 0 90 2 65 0 0
                                                   0 91 2 65 38 64 0 92 2 65 64
                                                   0 38 93 2 94 0 0 0 95 1 8 99
                                                   0 100 1 8 0 99 101 2 104 66
                                                   102 103 105 1 50 0 38 106 2
                                                   50 0 38 0 107 2 50 0 0 0 108
                                                   2 50 0 0 0 109 2 8 0 0 0 110
                                                   2 50 23 0 0 111 2 114 13 0
                                                   38 115 2 120 119 0 38 121 1
                                                   13 0 119 122 2 114 0 0 0 123
                                                   2 127 124 125 126 128 1 50
                                                   38 0 129 0 132 0 133 2 38 0
                                                   0 0 134 2 136 0 135 38 137 2
                                                   38 0 0 0 138 2 38 0 0 0 139
                                                   1 50 140 0 141 2 140 23 0 0
                                                   142 3 144 119 143 124 136
                                                   145 2 120 0 0 0 146 1 119 0
                                                   147 148 2 13 0 11 38 149 2
                                                   17 0 0 13 150 2 8 151 0 0
                                                   152 0 8 0 153 2 8 23 0 0 154
                                                   2 8 0 0 0 155 1 8 0 0 156 0
                                                   11 0 157 0 13 0 158 0 9 0
                                                   159 2 17 0 13 0 160 1 17 0 0
                                                   161 2 17 0 0 0 162 3 8 164 0
                                                   0 0 165 2 38 0 166 0 167 2
                                                   17 0 0 0 168 1 17 169 0 170
                                                   1 169 171 0 172 0 166 0 175
                                                   2 166 0 0 0 176 2 179 0 178
                                                   177 180 2 182 126 181 179
                                                   183 2 38 151 0 0 185 2 38 0
                                                   0 0 186 1 50 38 0 187 1 50
                                                   38 0 189 1 8 11 0 192 1 13 0
                                                   11 193 1 8 0 0 194 2 61 60 0
                                                   38 196 1 199 198 0 200 1 17
                                                   0 13 201 1 8 140 0 202 2 140
                                                   23 0 0 203 2 38 23 0 0 204 2
                                                   38 0 0 0 205 2 207 38 206 0
                                                   208 2 15 23 0 0 209 2 13 0 0
                                                   38 210 1 13 0 0 211 2 13 0
                                                   11 0 212 1 13 213 0 214 2 13
                                                   0 0 38 215 1 11 0 0 216 2 11
                                                   0 15 0 217 2 13 0 0 0 218 2
                                                   220 0 0 0 221 2 17 23 0 0
                                                   222 2 17 0 0 0 223 2 199 0 0
                                                   0 224 1 11 0 225 226 1 8 0
                                                   11 227 2 11 0 0 38 228 2 11
                                                   0 38 0 229 1 25 0 8 232 1 21
                                                   0 25 233 2 17 0 0 15 234 2
                                                   11 23 0 0 237 2 13 0 238 0
                                                   239 2 13 0 0 166 240 2 50 0
                                                   0 38 241 1 11 0 50 242 2 17
                                                   0 38 0 243 3 246 13 0 38 13
                                                   247 0 17 0 248 3 17 13 0 13
                                                   13 249 2 13 0 0 0 250 2 13 0
                                                   0 11 251 2 13 0 0 0 252 2
                                                   246 0 253 0 254 2 15 0 0 0
                                                   255 2 257 0 256 15 258 2 246
                                                   13 0 38 259 2 15 0 0 0 260 2
                                                   11 0 0 15 261 2 263 119 262
                                                   257 264 2 265 246 0 38 266 2
                                                   269 267 268 11 270 2 267 23
                                                   0 0 271 2 272 50 0 38 273 2
                                                   13 0 274 0 275 2 276 114 0
                                                   38 277 3 114 13 0 38 13 278
                                                   1 279 0 276 280 2 13 23 0 0
                                                   281 0 17 0 282 2 17 0 0 13
                                                   283 0 50 0 284 0 9 0 285 2
                                                   288 286 287 94 289 2 286 61
                                                   0 38 290 2 61 23 0 0 291 2 8
                                                   0 0 11 292 1 13 9 0 294 2
                                                   295 23 0 0 296 2 297 99 0 38
                                                   298 0 25 0 299 2 21 0 25 15
                                                   300 2 21 0 25 0 301 2 21 0 0
                                                   0 302 0 21 0 303 2 21 0 0 25
                                                   304 2 25 0 0 0 305 1 21 0 0
                                                   306 1 308 307 21 309 0 307 0
                                                   310 2 307 23 0 0 311 1 307
                                                   25 0 312 1 307 15 0 313 2
                                                   314 23 0 0 315 2 25 0 8 8
                                                   316 0 307 0 317 2 307 0 25 0
                                                   318 1 307 0 0 319 2 307 0 0
                                                   15 320 2 307 0 0 0 321 1 307
                                                   0 0 322 2 97 23 0 0 323 2
                                                   307 0 0 0 324 2 307 0 0 0
                                                   325 1 307 0 25 326 2 307 0 0
                                                   25 327 2 307 0 0 0 328 2 307
                                                   0 0 0 329 2 307 0 0 0 330 2
                                                   331 50 0 38 332 2 132 0 38 0
                                                   333 1 334 0 297 335 3 339
                                                   336 337 338 15 340 2 336 334
                                                   0 38 341 1 334 297 0 342 2
                                                   50 0 0 38 343 2 276 0 0 0
                                                   344 2 345 307 0 38 346 2 345
                                                   0 0 0 350 2 345 0 0 0 351 1
                                                   25 0 0 352 0 307 0 353 2 307
                                                   25 0 15 354 2 307 0 0 25 355
                                                   1 307 15 0 356 1 8 0 73 357
                                                   2 25 23 0 0 359 1 169 0 97
                                                   360 2 331 0 0 0 365 2 50 0
                                                   15 0 366 3 331 50 0 38 50
                                                   367 1 50 0 0 368 0 132 0 369
                                                   2 370 0 0 0 371 2 166 0 0 0
                                                   372 2 374 166 373 0 375 2
                                                   363 0 362 0 376 2 378 0 0 0
                                                   379 2 199 198 0 38 380 2 381
                                                   23 0 0 382 1 17 0 0 383 1
                                                   308 21 307 385 0 25 0 387 2
                                                   25 0 0 15 388 2 25 0 8 0 389
                                                   2 25 0 0 0 390 1 11 225 391
                                                   392 3 394 99 11 393 99 395 0
                                                   99 0 397 2 99 0 11 15 398 2
                                                   99 0 0 0 399 2 114 0 0 15
                                                   400 2 220 0 0 15 401 2 11 0
                                                   0 0 402 1 11 403 0 404 1 11
                                                   0 391 405 1 11 406 0 407 1
                                                   11 0 0 408 3 11 0 0 391 0
                                                   409 1 99 15 0 410 1 11 50 0
                                                   411 2 412 23 0 0 413 2 50 0
                                                   0 0 414 1 103 416 0 417 1 11
                                                   0 225 418 2 420 0 0 0 421 1
                                                   424 423 423 425 2 65 0 0 0
                                                   426 2 331 50 427 0 428 3 0
                                                   23 21 21 96 293 2 0 17 235
                                                   21 236 3 0 17 21 11 166 244
                                                   1 0 17 8 195 1 0 61 21 63 6
                                                   0 126 50 21 8 8 50 38 184 2
                                                   0 17 307 314 386 6 0 173 50
                                                   21 8 8 50 38 174 6 0 116 50
                                                   21 8 8 50 38 117 6 0 130 50
                                                   21 8 8 50 38 131 1 0 23 307
                                                   358 2 0 11 11 393 396 3 0
                                                   230 21 96 97 231 3 0 230 21
                                                   96 97 245 3 0 94 21 96 97 98
                                                   2 0 345 307 96 384 3 0 112
                                                   21 8 50 113 2 0 8 21 50 191
                                                   3 0 17 21 50 38 188 3 0 23
                                                   21 50 38 190 4 0 420 307 314
                                                   347 348 422 3 0 363 307 96
                                                   97 364 3 0 345 307 347 348
                                                   349)))))
           '|lookupComplete|)) 
