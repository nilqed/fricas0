
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
          (#2=#:G796 NIL)
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
          (|p1| #2#) (#4=#:G829 NIL) (|i| NIL)
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
          (|ind| (|NonNegativeInteger|)) (#1=#:G841 NIL) (|j| NIL)
          (|slop| (|Fraction| (|Integer|))) (#2=#:G839 NIL) (|i| NIL)
          (#3=#:G840 NIL) (|nxt| NIL)
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
          (#1=#:G879 NIL)
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
          (#2=#:G891 NIL) (|i| NIL) (|slo| #3=(|Fraction| (|Integer|)))
          (|v|
           #4=(|List|
               (|Record|
                (|:| |factor|
                     (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
                (|:| |exponent| (|Integer|)))))
          (#5=#:G890 NIL) (#6=#:G889 NIL) (|v_old| #4#)
          (|unsafe|
           (|List|
            (|Record|
             (|:| |factor|
                  #7=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|Integer|)))))
          (|sbt| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|newx| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|ie| (|Integer|)) (|e| (|Expression| (|Integer|)))
          (|d| (|NonNegativeInteger|)) (|vjf| #7#) (#8=#:G887 NIL) (|j| NIL)
          (#9=#:G888 NIL) (|jj| NIL) (|dvif| (|NonNegativeInteger|))
          (|vif| #7#) (#10=#:G885 NIL) (#11=#:G886 NIL) (|ii| NIL)
          (|restl| NIL) (#12=#:G883 NIL) (#13=#:G884 NIL)
          (|semi|
           (|OneDimensionalArray|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#14=#:G882 NIL) (|il| NIL) (#15=#:G881 NIL)
          (|npol|
           #16=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#17=#:G880 NIL) (|k| NIL)
          (|np|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| #3#) (|:| |npoly| #16#)))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 41)) 1 (QREFELT $ 49))
              (PROGN
               (LETT #1# (LIST |f|) . #18=(|LODOF2;factor_newton|))
               (GO #19=#:G878))))
            (LETT |np| (|LODOF2;newtonpolygon| |f| $) . #18#)
            (LETT |res| NIL . #18#)
            (SEQ (LETT |k| NIL . #18#) (LETT #17# |np| . #18#) G190
                 (COND
                  ((OR (ATOM #17#) (PROGN (LETT |k| (CAR #17#) . #18#) NIL))
                   (GO G191)))
                 (SEQ (LETT |npol| (QVELT |k| 2) . #18#)
                      (LETT |v|
                            (SPADCALL (|LODOF2;factorUP| |npol| |factorizer| $)
                                      (QREFELT $ 67))
                            . #18#)
                      (COND
                       ((SPADCALL (QVELT |k| 1) (|spadConstant| $ 68)
                                  (QREFELT $ 69))
                        (LETT |v|
                              (PROGN
                               (LETT #15# NIL . #18#)
                               (SEQ (LETT |il| NIL . #18#)
                                    (LETT #14# |v| . #18#) G190
                                    (COND
                                     ((OR (ATOM #14#)
                                          (PROGN
                                           (LETT |il| (CAR #14#) . #18#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #15#
                                            (CONS
                                             (CONS
                                              (SPADCALL (QCAR |il|) (QCDR |il|)
                                                        (QREFELT $ 70))
                                              0)
                                             #15#)
                                            . #18#)))
                                    (LETT #14# (CDR #14#) . #18#) (GO G190)
                                    G191 (EXIT (NREVERSE #15#))))
                              . #18#))
                       ('T
                        (SEQ (LETT |unsafe| NIL . #18#)
                             (LETT |semi|
                                   (MAKEARR1 (LENGTH |v|)
                                             (|spadConstant| $ 52))
                                   . #18#)
                             (SEQ (LETT |ii| 1 . #18#)
                                  (LETT #13# (LENGTH |v|) . #18#)
                                  (LETT |i| NIL . #18#) (LETT #12# |v| . #18#)
                                  G190
                                  (COND
                                   ((OR (ATOM #12#)
                                        (PROGN
                                         (LETT |i| (CAR #12#) . #18#)
                                         NIL)
                                        (|greater_SI| |ii| #13#))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |semi| |ii|
                                              (SPADCALL (QCAR |i|) (QCDR |i|)
                                                        (QREFELT $ 70))
                                              (QREFELT $ 72))))
                                  (LETT #12#
                                        (PROG1 (CDR #12#)
                                          (LETT |ii| (|inc_SI| |ii|) . #18#))
                                        . #18#)
                                  (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |restl| (CDR |v|) . #18#)
                                  (LETT |ii| 1 . #18#)
                                  (LETT #11# (LENGTH |v|) . #18#)
                                  (LETT |i| NIL . #18#) (LETT #10# |v| . #18#)
                                  G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN
                                         (LETT |i| (CAR #10#) . #18#)
                                         NIL)
                                        (|greater_SI| |ii| #11#)
                                        (ATOM |restl|))
                                    (GO G191)))
                                  (SEQ (LETT |vif| (QCAR |i|) . #18#)
                                       (LETT |dvif|
                                             (SPADCALL |vif| (QREFELT $ 73))
                                             . #18#)
                                       (EXIT
                                        (SEQ (LETT |jj| (+ |ii| 1) . #18#)
                                             (LETT #9# (LENGTH |v|) . #18#)
                                             (LETT |j| NIL . #18#)
                                             (LETT #8# |restl| . #18#) G190
                                             (COND
                                              ((OR (ATOM #8#)
                                                   (PROGN
                                                    (LETT |j| (CAR #8#) . #18#)
                                                    NIL)
                                                   (> |jj| #9#))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |vjf| (QCAR |j|) . #18#)
                                              (EXIT
                                               (COND
                                                ((EQL |dvif|
                                                      (SPADCALL |vjf|
                                                                (QREFELT $
                                                                         73)))
                                                 (SEQ
                                                  (LETT |d| (- |dvif| 1)
                                                        . #18#)
                                                  (LETT |e|
                                                        (SPADCALL
                                                         (SPADCALL |vif| |d|
                                                                   (QREFELT $
                                                                            74))
                                                         (SPADCALL |vjf| |d|
                                                                   (QREFELT $
                                                                            74))
                                                         (QREFELT $ 75))
                                                        . #18#)
                                                  (LETT |e|
                                                        (SPADCALL |e|
                                                                  (SPADCALL
                                                                   |dvif|
                                                                   (QREFELT $
                                                                            76))
                                                                  (QREFELT $
                                                                           77))
                                                        . #18#)
                                                  (EXIT
                                                   (COND
                                                    ((SPADCALL |e|
                                                               (QREFELT $ 79))
                                                     (COND
                                                      ((SPADCALL |e|
                                                                 (|spadConstant|
                                                                  $ 19)
                                                                 (QREFELT $
                                                                          80))
                                                       (SEQ
                                                        (LETT |ie|
                                                              (SPADCALL |e|
                                                                        (QREFELT
                                                                         $ 81))
                                                              . #18#)
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
                                                                          82))
                                                               (QREFELT $ 59))
                                                              . #18#)
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
                                                                         $ 83))
                                                              . #18#)
                                                        (EXIT
                                                         (COND
                                                          ((SPADCALL
                                                            (SPADCALL |vif|
                                                                      |sbt|
                                                                      (QREFELT
                                                                       $ 84))
                                                            (|spadConstant| $
                                                                            52)
                                                            (QREFELT $ 85))
                                                           (COND
                                                            ((SPADCALL |ie| 0
                                                                       (QREFELT
                                                                        $ 86))
                                                             (SEQ
                                                              (LETT |unsafe|
                                                                    (CONS |i|
                                                                          |unsafe|)
                                                                    . #18#)
                                                              (EXIT
                                                               (SPADCALL |semi|
                                                                         |jj|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |semi|
                                                                           |jj|
                                                                           (QREFELT
                                                                            $
                                                                            87))
                                                                          (SPADCALL
                                                                           |vif|
                                                                           (QCDR
                                                                            |i|)
                                                                           (QREFELT
                                                                            $
                                                                            70))
                                                                          (QREFELT
                                                                           $
                                                                           88))
                                                                         (QREFELT
                                                                          $
                                                                          72)))))
                                                            ('T
                                                             (SEQ
                                                              (LETT |unsafe|
                                                                    (CONS |j|
                                                                          |unsafe|)
                                                                    . #18#)
                                                              (EXIT
                                                               (SPADCALL |semi|
                                                                         |ii|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |semi|
                                                                           |ii|
                                                                           (QREFELT
                                                                            $
                                                                            87))
                                                                          (SPADCALL
                                                                           |vjf|
                                                                           (QCDR
                                                                            |j|)
                                                                           (QREFELT
                                                                            $
                                                                            70))
                                                                          (QREFELT
                                                                           $
                                                                           88))
                                                                         (QREFELT
                                                                          $
                                                                          72))))))))))))))))))))
                                             (LETT #8#
                                                   (PROG1 (CDR #8#)
                                                     (LETT |jj| (+ |jj| 1)
                                                           . #18#))
                                                   . #18#)
                                             (GO G190) G191 (EXIT NIL))))
                                  (LETT #10#
                                        (PROG1 (CDR #10#)
                                          (LETT |ii|
                                                (PROG1 (|inc_SI| |ii|)
                                                  (LETT |restl| (CDR |restl|)
                                                        . #18#))
                                                . #18#))
                                        . #18#)
                                  (GO G190) G191 (EXIT NIL))
                             (LETT |v_old| |v| . #18#)
                             (LETT |v| (SPADCALL |v| |unsafe| (QREFELT $ 89))
                                   . #18#)
                             (EXIT
                              (COND
                               ((EQUAL |option| "semireg")
                                (LETT |v|
                                      (PROGN
                                       (LETT #6# NIL . #18#)
                                       (SEQ (LETT |i| NIL . #18#)
                                            (LETT #5# |v| . #18#) G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |i| (CAR #5#) . #18#)
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
                                                                           90))
                                                                (QREFELT $ 87))
                                                      1)
                                                     #6#)
                                                    . #18#)))
                                            (LETT #5# (CDR #5#) . #18#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #6#))))
                                      . #18#)))))))
                      (LETT |slo| (QVELT |k| 1) . #18#)
                      (COND
                       ((EQL
                         (*
                          (SPADCALL (QCAR (SPADCALL |v| 1 (QREFELT $ 91)))
                                    (QREFELT $ 73))
                          (SPADCALL |slo| (QREFELT $ 53)))
                         (SPADCALL |f| (QREFELT $ 41)))
                        (PROGN (LETT #1# (LIST |f|) . #18#) (GO #19#))))
                      (EXIT
                       (SEQ (LETT |i| NIL . #18#) (LETT #2# |v| . #18#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |i| (CAR #2#) . #18#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |jl|
                                   (|LODOF2;factor_newton2| |f| (QCAR |i|) |k|
                                    $)
                                   . #18#)
                             (COND
                              ((EQUAL |option| "alg factor")
                               (PROGN
                                (LETT #1# (LIST (QCDR |jl|)) . #18#)
                                (GO #19#)))
                              ((EQUAL |option| "split over k((x))")
                               (PROGN
                                (LETT #1#
                                      (SPADCALL
                                       (|LODOF2;factor_newton| (QCAR |jl|)
                                        |factorizer| |option| $)
                                       (LIST (QCDR |jl|)) (QREFELT $ 93))
                                      . #18#)
                                (GO #19#))))
                             (EXIT
                              (LETT |res|
                                    (SPADCALL |res| (LIST (QCDR |jl|))
                                              (QREFELT $ 93))
                                    . #18#)))
                            (LETT #2# (CDR #2#) . #18#) (GO G190) G191
                            (EXIT NIL))))
                 (LETT #17# (CDR #17#) . #18#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #19# (EXIT #1#)))) 

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
          (LETT |snp| (SPADCALL |np| (QREFELT $ 98)) . #2=(|LODOF2;factorUP|))
          (LETT |fsnp| (SPADCALL |snp| |factorSUP|) . #2#)
          (EXIT (SPADCALL (ELT $ 99) |fsnp| (QREFELT $ 103)))))) 

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
                              (SPADCALL (SPADCALL |ycd| (QREFELT $ 104))
                                        (SPADCALL
                                         (- (SPADCALL |f| (QREFELT $ 41))
                                            |xcd|)
                                         |slop| (QREFELT $ 105))
                                        (QREFELT $ 106))
                              (QREFELT $ 107))
                    . #5#)
              (LETT |npo| (SPADCALL (|spadConstant| $ 12) |xcd| (QREFELT $ 58))
                    . #5#)
              (LETT |mlr|
                    (SPADCALL (SPADCALL |npol| |r| (QREFELT $ 108))
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL (|spadConstant| $ 12)
                                        (SPADCALL |slop| (QREFELT $ 53))
                                        (QREFELT $ 58))
                              (QREFELT $ 83))
                    . #5#)
              (LETT |npo| (SPADCALL |npo| |mlr| (QREFELT $ 88)) . #5#)
              (LETT |npor|
                    (SPADCALL |r|
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL (|spadConstant| $ 12)
                                        (SPADCALL |slop| (QREFELT $ 53))
                                        (QREFELT $ 58))
                              (QREFELT $ 83))
                    . #5#)
              (LETT |ordr|
                    (* (SPADCALL |r| (QREFELT $ 73))
                       (SPADCALL |slop| (QREFELT $ 53)))
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
          (#2=#:G910 NIL) (|i| NIL) (|np| (|List| #1#)))
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
                  ((SPADCALL (QVELT |i| 1) |slop| (QREFELT $ 109))
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
          (#1=#:G914 NIL) (|i| NIL))
         (SEQ (LETT |f| (|spadConstant| $ 18) . #2=(|LODOF2;laurent_op|))
              (SEQ (LETT |i| 0 . #2#) (LETT #1# |dgf| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |f|
                           (SPADCALL |f|
                                     (SPADCALL
                                      (SPADCALL |llaur| (+ |i| 1)
                                                (QREFELT $ 113))
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
          (#1=#:G928 NIL) (|i| NIL))
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
                                                 (QREFELT $ 119))
                                       (QREFELT $ 120)))
                                     (QREFELT $ 121))
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
                          (QREFELT $ 126))
                . #3=(|LODOF2;listream_coefs|))
          (LETT |le|
                (SPADCALL
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 53)) |shift|
                           (QREFELT $ 105))
                 (QREFELT $ 127))
                . #3#)
          (LETT |le| (- |le| (* (SPADCALL |slop| (QREFELT $ 55)) |dgl|)) . #3#)
          (LETT |lsc| (|LODOF2;listream_coefsop| |sle| |dgl| |le| |slop| $)
                . #3#)
          (LETT |sre|
                (SPADCALL (LIST #'|LODOF2;listream_coefs!1|) |slr|
                          (QREFELT $ 126))
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
          (|nl_st| (|Stream| (|Integer|))) (#1=#:G963 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL . #2=(|LODOF2;listream_coefsop|))
              (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |dgf| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |nl_st|
                          (SPADCALL (CONS #'|LODOF2;listream_coefsop!0| $) 1
                                    (QREFELT $ 135))
                          . #2#)
                    (LETT |new_term|
                          (SPADCALL
                           (CONS #'|LODOF2;listream_coefsop!1|
                                 (VECTOR |i| |fe| |slop| $))
                           |sfe| |nl_st| (QREFELT $ 143))
                          . #2#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res| (LIST |new_term|) (QREFELT $ 144))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |dgc|
                    (LIST
                     (SPADCALL (LIST (CONS 0 (|spadConstant| $ 12)))
                               (QREFELT $ 146)))
                    . #2#)
              (EXIT (SPADCALL |res| |dgc| (QREFELT $ 144)))))) 

(SDEFUN |LODOF2;listream_coefsop!1| ((|x| NIL) (|n_l| NIL) ($$ NIL))
        (PROG ($ |slop| |fe| |i|)
          (LETT $ (QREFELT $$ 3) . #1=(|LODOF2;listream_coefsop|))
          (LETT |slop| (QREFELT $$ 2) . #1#)
          (LETT |fe| (QREFELT $$ 1) . #1#)
          (LETT |i| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((#2=#:G952 NIL) (|coefd| NIL) (|cx| NIL) (|deg| NIL)
              (|degn| NIL))
             (SEQ
              (LETT |degn|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL |n_l| (|spadConstant| $ 131) (QREFELT $ 136))
                       (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 137))
                      |fe| (QREFELT $ 132))
                     (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 55))
                               (QREFELT $ 56))
                     (QREFELT $ 132))
                    NIL)
              (LETT |deg|
                    (SPADCALL
                     (SPADCALL |degn| (SPADCALL |slop| (QREFELT $ 53))
                               (QREFELT $ 51))
                     (QREFELT $ 139))
                    NIL)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |deg| (CONS 1 "failed") (QREFELT $ 140)))
                     (GO G191)))
                   (SEQ
                    (LETT |degn|
                          (SPADCALL |degn| (|spadConstant| $ 131)
                                    (QREFELT $ 132))
                          NIL)
                    (EXIT
                     (LETT |deg|
                           (SPADCALL
                            (SPADCALL |degn| (SPADCALL |slop| (QREFELT $ 53))
                                      (QREFELT $ 51))
                            (QREFELT $ 139))
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
        (SPADCALL |x| (|spadConstant| $ 131) (QREFELT $ 132))) 

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
          (#3=#:G982 NIL) (|i| #4=(|Integer|)) (|fe| #5=(|Integer|))
          (|re| (|Integer|)) (|le| #5#)
          (|c2| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|c1| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|s|
           (|Record|
            (|:| |coef1|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |coef2|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#6=#:G973 NIL)
          (|sl_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|dgl| #4#))
         (SEQ
          (LETT |dgl| (- (SPADCALL |ff| (QREFELT $ 41)) |dgr|)
                . #7=(|LODOF2;lift_newton|))
          (LETT |li| (QCAR |v|) . #7#) (LETT |ri| (QCDR |v|) . #7#)
          (COND
           ((SPADCALL |slop| (|spadConstant| $ 68) (QREFELT $ 109))
            (SEQ (LETT |i| (- |n_l| 1) . #7#)
                 (COND
                  ((EQL |i| 0)
                   (SEQ (LETT |r_extra| (|LODOF2;plug_delta| |r_low| $) . #7#)
                        (EXIT
                         (LETT |l_extra|
                               (SPADCALL (|LODOF2;plug_delta| |l_low| $)
                                         (SPADCALL (|spadConstant| $ 12)
                                                   (SPADCALL |shift|
                                                             (QREFELT $ 127))
                                                   (QREFELT $ 147))
                                         (QREFELT $ 148))
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
                                     (SPADCALL |i| (QREFELT $ 82))
                                     (QREFELT $ 59))
                                    (QREFELT $ 83))
                          . #7#)
                    (LETT |s| (SPADCALL |r_low| |sl_low| (QREFELT $ 150))
                          . #7#)
                    (COND
                     ((SPADCALL (QVELT |s| 2) (|spadConstant| $ 151)
                                (QREFELT $ 152))
                      (|error| "unsafe factor")))
                    (LETT |c1| (QVELT |s| 0) . #7#)
                    (LETT |c2| (QVELT |s| 1) . #7#)
                    (LETT |pi|
                          (|LODOF2;coeffx| |ei|
                           (SPADCALL (SPADCALL |i| (QREFELT $ 104)) |shift|
                                     (QREFELT $ 106))
                           $)
                          . #7#)
                    (LETT |pr_extra|
                          (SPADCALL
                           (SPADCALL (SPADCALL |c2| |pi| (QREFELT $ 88))
                                     |r_low| (QREFELT $ 153))
                           (QREFELT $ 154))
                          . #7#)
                    (LETT |r_extra| (|LODOF2;plug_delta| |pr_extra| $) . #7#)
                    (LETT |pl_extra|
                          (SPADCALL
                           (SPADCALL |pi|
                                     (SPADCALL |pr_extra| |sl_low|
                                               (QREFELT $ 88))
                                     (QREFELT $ 59))
                           |r_low| (QREFELT $ 108))
                          . #7#)
                    (LETT |l_extra| (|LODOF2;plug_delta| |pl_extra| $) . #7#)
                    (LETT |l_extra|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12)
                                      (+ |i|
                                         (SPADCALL |shift| (QREFELT $ 127)))
                                      (QREFELT $ 147))
                            |l_extra| (QREFELT $ 158))
                           (QREFELT $ 159))
                          . #7#)
                    (EXIT
                     (LETT |r_extra|
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) |i|
                                      (QREFELT $ 147))
                            |r_extra| (QREFELT $ 158))
                           . #7#)))))
                 (LETT |li| (SPADCALL |li| |l_extra| (QREFELT $ 35)) . #7#)
                 (LETT |ei|
                       (SPADCALL
                        (SPADCALL |ei|
                                  (SPADCALL |l_extra| |ri| (QREFELT $ 160))
                                  (QREFELT $ 35))
                        (SPADCALL |li| |r_extra| (QREFELT $ 160))
                        (QREFELT $ 35))
                       . #7#)
                 (EXIT
                  (LETT |ri| (SPADCALL |ri| |r_extra| (QREFELT $ 35)) . #7#))))
           (#8#
            (SEQ
             (LETT |s|
                   (PROG2
                       (LETT #6#
                             (SPADCALL |r_low| |l_low| (|spadConstant| $ 151)
                                       (QREFELT $ 163))
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
                              (QREFELT $ 105))
                    (QREFELT $ 127))
                   . #7#)
             (LETT |le| (- |le| (* (SPADCALL |slop| (QREFELT $ 55)) |dgl|))
                   . #7#)
             (LETT |re| (- (* (SPADCALL |slop| (QREFELT $ 55)) |dgr|)) . #7#)
             (LETT |fe|
                   (SPADCALL
                    (SPADCALL (SPADCALL |slop| (QREFELT $ 53)) |shift|
                              (QREFELT $ 105))
                    (QREFELT $ 127))
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
                                (QREFELT $ 165))
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
                         (SPADCALL (SPADCALL |c2| |pi| (QREFELT $ 88)) |r_low|
                                   (QREFELT $ 153))
                         . #7#)
                   (LETT |pl_extra|
                         (SPADCALL |pi|
                                   (SPADCALL |pr_extra| |l_low| (QREFELT $ 88))
                                   (QREFELT $ 84))
                         . #7#)
                   (LETT |pl_extra|
                         (SPADCALL
                          (SPADCALL |pl_extra| |r_low| (QREFELT $ 108))
                          (QREFELT $ 154))
                         . #7#)
                   (LETT |l_extra|
                         (|LODOF2;coefs_operator| |pl_extra| |slop|
                          (+ |i| |le|) $)
                         . #7#)
                   (EXIT
                    (LETT |r_extra|
                          (|LODOF2;coefs_operator|
                           (SPADCALL |pr_extra| (QREFELT $ 154)) |slop|
                           (+ |i| |re|) $)
                          . #7#)))))
                (LETT |li| (SPADCALL |li| |l_extra| (QREFELT $ 35)) . #7#)
                (LETT |ei|
                      (SPADCALL
                       (SPADCALL |ei| (SPADCALL |l_extra| |ri| (QREFELT $ 160))
                                 (QREFELT $ 35))
                       (SPADCALL |li| |r_extra| (QREFELT $ 160))
                       (QREFELT $ 35))
                      . #7#)
                (EXIT
                 (LETT |ri| (SPADCALL |ri| |r_extra| (QREFELT $ 35)) . #7#)))
               (LETT |i| (+ |i| 1) . #7#) (GO G190) G191 (EXIT NIL))))))
          (EXIT
           (VECTOR
            (CONS (SPADCALL |li| (QCAR |v|) (QREFELT $ 166))
                  (SPADCALL |ri| (QCDR |v|) (QREFELT $ 166)))
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
          (LETT |ei| (SPADCALL (|LODOF2;convertL3toLL| |f| $) (QREFELT $ 159))
                . #1#)
          (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| 5) (GO G191)))
               (SEQ
                (LETT |lnr|
                      (|LODOF2;lift_newton| |slop|
                       (|LODOF2;convertL3toLL| |f| $) |l_low| |r_low| |shift|
                       |dgr| |v| |ei| |i| $)
                      . #1#)
                (SPADCALL (SPADCALL (QCAR (QVELT |lnr| 0)) (QREFELT $ 168))
                          (QREFELT $ 170))
                (SPADCALL (SPADCALL (QCDR (QVELT |lnr| 0)) (QREFELT $ 168))
                          (QREFELT $ 170))
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
                        (SPADCALL |f| (QREFELT $ 159)))
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
                 (CONS |lni| |n_li|) (QREFELT $ 178))
                . #1#)
          (LETT |res|
                (SPADCALL (LIST #'|LODOF2;ln_wrapper!1|) |all| (QREFELT $ 181))
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
                              (SPADCALL (QCDR |rec|) (|spadConstant| $ 173)
                                        (QREFELT $ 174))
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
          (#1=#:G1009 NIL) (|j| NIL) (|start_x| (|Fraction| (|Integer|)))
          (|start_D| (|Integer|)) (|nsi| (|Integer|)))
         (SEQ
          (LETT |nsi|
                (QVELT
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                           (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 183))
                 0)
                . #2=(|LODOF2;coefs_poly|))
          (LETT |start_D|
                (SPADCALL (- (* |i| |nsi|)) (SPADCALL |slop| (QREFELT $ 53))
                          (QREFELT $ 184))
                . #2#)
          (LETT |start_x|
                (SPADCALL (SPADCALL |start_D| |slop| (QREFELT $ 105))
                          (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 53))
                                    (QREFELT $ 51))
                          (QREFELT $ 106))
                . #2#)
          (LETT |res| (|spadConstant| $ 52) . #2#)
          (SEQ (LETT |j| 0 . #2#)
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| (QREFELT $ 41))
                                (SPADCALL |slop| (QREFELT $ 53))
                                (QREFELT $ 51))
                      (QREFELT $ 185))
                     . #2#)
               G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (LETT |fc|
                      (|LODOF2;coeffx| |f|
                       (SPADCALL |start_x|
                                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                           (SPADCALL |j| (QREFELT $ 104))
                                           (QREFELT $ 105))
                                 (QREFELT $ 106))
                       $)
                      . #2#)
                (LETT |npc|
                      (SPADCALL |fc|
                                (+ |start_D|
                                   (SPADCALL |j|
                                             (SPADCALL |slop| (QREFELT $ 53))
                                             (QREFELT $ 56)))
                                (QREFELT $ 74))
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
          (|npc| (|Expression| (|Integer|))) (#1=#:G1016 NIL) (|j| NIL)
          (|start_x| (|Integer|)) (|start_D| (|Integer|)) (|nsi| (|Integer|)))
         (SEQ
          (LETT |nsi|
                (QVELT
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                           (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 183))
                 0)
                . #2=(|LODOF2;coefs_operator|))
          (LETT |start_D|
                (SPADCALL (- (* |i| |nsi|)) (SPADCALL |slop| (QREFELT $ 53))
                          (QREFELT $ 184))
                . #2#)
          (LETT |start_x|
                (SPADCALL
                 (SPADCALL (SPADCALL |start_D| |slop| (QREFELT $ 105))
                           (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 53))
                                     (QREFELT $ 51))
                           (QREFELT $ 106))
                 (QREFELT $ 127))
                . #2#)
          (LETT |res| (|spadConstant| $ 18) . #2#)
          (SEQ (LETT |j| 0 . #2#)
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |np| (QREFELT $ 73))
                                (SPADCALL |slop| (QREFELT $ 53))
                                (QREFELT $ 51))
                      (QREFELT $ 187))
                     . #2#)
               G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (LETT |npc|
                      (SPADCALL |np|
                                (+ |start_D|
                                   (SPADCALL |j|
                                             (SPADCALL |slop| (QREFELT $ 53))
                                             (QREFELT $ 56)))
                                (QREFELT $ 74))
                      . #2#)
                (LETT |sc|
                      (SPADCALL |npc|
                                (+ |start_x|
                                   (* (SPADCALL |slop| (QREFELT $ 55)) |j|))
                                (QREFELT $ 147))
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
            |np| (QREFELT $ 85)))))) 

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
              (LETT |ex| (SPADCALL |e| (QREFELT $ 127)) . #2#)
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
                      (SPADCALL |nptmp| (|spadConstant| $ 52) (QREFELT $ 152)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |nptmp| (QREFELT $ 190)) . #2#)
                        (LETT |dg| (SPADCALL |nptmp| (QREFELT $ 73)) . #2#)
                        (LETT |f|
                              (SPADCALL |f|
                                        (SPADCALL
                                         (SPADCALL |lc| (QREFELT $ 191)) |dg|
                                         (QREFELT $ 34))
                                        (QREFELT $ 35))
                              . #2#)
                        (EXIT
                         (LETT |nptmp| (SPADCALL |nptmp| (QREFELT $ 192))
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
         ((#1=#:G1204 NIL)
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
          (#3=#:G1236 NIL)
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
          (#4=#:G1235 NIL) (#5=#:G1234 NIL)
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
          (#8=#:G1233 NIL) (|np| (|List| #6#))
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
          (#9=#:G1232 NIL)
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
          (#10=#:G792 NIL) (#11=#:G1231 NIL)
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
          (#12=#:G1032 NIL)
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
          (#13=#:G1230 NIL) (#14=#:G1229 NIL) (#15=#:G1228 NIL)
          (#16=#:G1227 NIL) (#17=#:G1226 NIL) (#18=#:G1225 NIL)
          (#19=#:G1224 NIL) (#20=#:G1223 NIL)
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
          (#21=#:G1222 NIL) (|vi| NIL) (|sym| (|Symbol|)) (#22=#:G1031 NIL)
          (#23=#:G791 NIL)
          (|cxs|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#24=#:G1221 NIL) (#25=#:G1220 NIL) (#26=#:G1219 NIL)
          (#27=#:G1218 NIL) (#28=#:G1217 NIL) (#29=#:G1216 NIL)
          (#30=#:G1215 NIL) (#31=#:G1214 NIL) (#32=#:G1213 NIL)
          (#33=#:G1212 NIL) (#34=#:G1211 NIL) (#35=#:G1210 NIL)
          (#36=#:G1209 NIL) (#37=#:G1208 NIL) (#38=#:G1207 NIL)
          (|il|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|npf|
           (|Record|
            (|:| |factor|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |exponent| (|Integer|))))
          (#39=#:G1206 NIL) (|ip| NIL)
          (|subs|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|sols| (|List| (|Integer|))) (#40=#:G1047 NIL)
          (|fact| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|diff| (|Union| (|Integer|) "failed")) (#41=#:G1205 NIL) (|l| NIL)
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
            (LETT |np1| (SPADCALL |np| 1 (QREFELT $ 194)) . #42#)
            (LETT |slop| (QVELT |np1| 1) . #42#)
            (COND
             ((EQUAL |option| "semireg")
              (COND
               ((SPADCALL |slop| (|spadConstant| $ 68) (QREFELT $ 109))
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
                        (QREFELT $ 198))
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
                                 (QREFELT $ 84))
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
                                              (SPADCALL |il| (QREFELT $ 199))
                                              (QREFELT $ 35))
                                    (QVELT |vr| 3) |il|)))
                            . #42#)
                      (GO #44=#:G1203))))))
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
                                   (QREFELT $ 83))
                         |factorizer| $)
                        (QREFELT $ 67))
                       . #42#)
                 (LETT |r| (|spadConstant| $ 151) . #42#)
                 (LETT |sols| NIL . #42#)
                 (SEQ (LETT |l| NIL . #42#) (LETT #41# |npf| . #42#) G190
                      (COND
                       ((OR (ATOM #41#)
                            (PROGN (LETT |l| (CAR #41#) . #42#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |diff|
                             (SPADCALL
                              (SPADCALL |xx| (QCAR |l|) (QREFELT $ 84))
                              (QREFELT $ 200))
                             . #42#)
                       (EXIT
                        (COND
                         ((SPADCALL |diff| (CONS 1 "failed") (QREFELT $ 201))
                          (SEQ (LETT |fact| (QCAR |l|) . #42#)
                               (LETT |exp| (QCDR |l|) . #42#)
                               (LETT |r|
                                     (SPADCALL |r|
                                               (SPADCALL |fact| |exp|
                                                         (QREFELT $ 70))
                                               (QREFELT $ 88))
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
                  ((SPADCALL (SPADCALL |r| (QREFELT $ 73)) |n| (QREFELT $ 202))
                   (|error| "bug")))
                 (LETT |n| (SPADCALL (ELT $ 203) |sols| (QREFELT $ 206))
                       . #42#)
                 (LETT |r|
                       (SPADCALL |r|
                                 (SPADCALL (|spadConstant| $ 12) 1
                                           (QREFELT $ 58))
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 12) 1
                                            (QREFELT $ 58))
                                  (SPADCALL |n| (QREFELT $ 82)) (QREFELT $ 59))
                                 (QREFELT $ 83))
                       . #42#)
                 (LETT |subs|
                       (PROG2
                           (LETT #23#
                                 (|LODOF2;substitute|
                                  (CONS 0
                                        (SPADCALL |i|
                                                  (SPADCALL |n| (QREFELT $ 82))
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
                                    (QREFELT $ 109))
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
                                                              (QREFELT $ 82))
                                                    (QREFELT $ 59))
                                          $)
                                         (QREFELT $ 28)))))
                         . #42#)
                   (GO #44#))))))))
            (LETT |npf|
                  (SPADCALL
                   (SPADCALL (|LODOF2;factorUP| (QVELT |np1| 2) |factorizer| $)
                             (QREFELT $ 67))
                   1 (QREFELT $ 91))
                  . #42#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |f| (QREFELT $ 41)) 1 (QREFELT $ 207))
               (COND
                ((EQUAL |option| #45="semireg")
                 (SEQ
                  (LETT |il|
                        (SPADCALL
                         (SPADCALL (SPADCALL |f| 0 (QREFELT $ 54)) 0
                                   (QREFELT $ 208))
                         (QREFELT $ 209))
                        . #42#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (CONS 0
                                (LIST
                                 (VECTOR
                                  (SPADCALL |f| (SPADCALL |il| (QREFELT $ 199))
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
                                     (QREFELT $ 208))
                           (QREFELT $ 209))
                          . #42#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 0
                                  (LIST
                                   (VECTOR
                                    (SPADCALL |f|
                                              (SPADCALL |il| (QREFELT $ 199))
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
                ((EQL (SPADCALL (QCAR |npf|) (QREFELT $ 73)) 1)
                 (COND
                  ((EQL (SPADCALL |slop| (QREFELT $ 53)) 1)
                   (SEQ
                    (LETT |cxs|
                          (SPADCALL
                           (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 74))
                                     (SPADCALL (|spadConstant| $ 12)
                                               (-
                                                (SPADCALL |slop|
                                                          (QREFELT $ 55)))
                                               (QREFELT $ 147))
                                     (QREFELT $ 210))
                           (QREFELT $ 209))
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
                       (LETT |sym| (SPADCALL |cxs| (QREFELT $ 212)) . #42#)
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
                                    (QREFELT $ 213))
                                   . #42#)
                             (LETT |fullxr|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QVELT |vi| 1) (QREFELT $ 73))
                                     (SPADCALL
                                      (SPADCALL (QCAR |npf|) 0 (QREFELT $ 74))
                                      (QREFELT $ 214))
                                     (QREFELT $ 215))
                                    |xsubsr| (QREFELT $ 210))
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
                                                                          216))))
                                              (QREFELT $ 219))
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
                                                                           209)))
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
                              (LETT #10# (SPADCALL |ric| (QREFELT $ 198))
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
                     ((SPADCALL |rk| |f| (QREFELT $ 220))
                      (PROGN
                       (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                       (GO #44#))))
                    (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 221)) . #42#)
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
                                   (LIST (CONS 0 |rk|)) (QREFELT $ 222)))
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
                            ((SPADCALL |rk| |f| (QREFELT $ 220))
                             (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                            ('T
                             (LETT |res|
                                   (SPADCALL |res| (LIST (CONS 0 |rk|))
                                             (QREFELT $ 222))
                                   . #42#)))))
                         (LETT #35# (CDR #35#) . #42#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
                  (#43#
                   (COND
                    ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 73)) 1
                               (QREFELT $ 48))
                     (SEQ
                      (LETT |gr|
                            (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 98))
                                      (QREFELT $ 224))
                            . #42#)
                      (LETT |npgr|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL |gr| (QREFELT $ 225)) (QREFELT $ 84))
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
                                                                (QREFELT $ 73))
                                                      |gr|
                                                      (SPADCALL
                                                       (|spadConstant| $ 12) 1
                                                       (QREFELT $ 58)))
                                              . #42#)
                                        (EXIT
                                         (LETT |res|
                                               (SPADCALL |res|
                                                         (LIST (CONS 1 |nt|))
                                                         (QREFELT $ 222))
                                               . #42#))))
                                      ('T
                                       (LETT |res|
                                             (SPADCALL |res| (LIST |i|)
                                                       (QREFELT $ 222))
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
                                       (QREFELT $ 183))
                             0)
                            . #42#)
                      (LETT |coefr|
                            (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 74))
                                      (QREFELT $ 214))
                            . #42#)
                      (LETT |ror|
                            (|LODOF2;ramification_of| |f|
                             (SPADCALL |coefr| |n| (QREFELT $ 226))
                             (SPADCALL |slop| (QREFELT $ 53)) $)
                            . #42#)
                      (LETT |exp|
                            (SPADCALL
                             (SPADCALL
                              (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                              (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                             (QREFELT $ 127))
                            . #42#)
                      (LETT |tosub|
                            (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                      (SPADCALL |coefr| |exp| (QREFELT $ 226))
                                      (QREFELT $ 215))
                            . #42#)
                      (LETT |r|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL |tosub| (QREFELT $ 225))
                              (QREFELT $ 84))
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
                                          (QREFELT $ 104))
                                         (QREFELT $ 109))
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
                            (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 226))
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
                                                                              83))
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
                                                                             83)))
                                                  . #42#)))))
                                    (EXIT
                                     (LETT |res|
                                           (SPADCALL |res| (LIST (CONS 1 |nt|))
                                                     (QREFELT $ 222))
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
                            (LETT #10# (SPADCALL |ric| (QREFELT $ 198)) . #42#)
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
                   ((SPADCALL |rk| |f| (QREFELT $ 220))
                    (PROGN
                     (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                     (GO #44#))))
                  (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 221)) . #42#)
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
                                 (LIST (CONS 0 |rk|)) (QREFELT $ 222)))
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
                          ((SPADCALL |rk| |f| (QREFELT $ 220))
                           (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                          ('T
                           (LETT |res|
                                 (SPADCALL |res| (LIST (CONS 0 |rk|))
                                           (QREFELT $ 222))
                                 . #42#)))))
                       (LETT #29# (CDR #29#) . #42#) (GO G190) G191 (EXIT NIL))
                  (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
                (#43#
                 (COND
                  ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 73)) 1
                             (QREFELT $ 48))
                   (SEQ
                    (LETT |gr|
                          (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 98))
                                    (QREFELT $ 224))
                          . #42#)
                    (LETT |npgr|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |gr| (QREFELT $ 225)) (QREFELT $ 84))
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
                                                              (QREFELT $ 73))
                                                    |gr|
                                                    (SPADCALL
                                                     (|spadConstant| $ 12) 1
                                                     (QREFELT $ 58)))
                                            . #42#)
                                      (EXIT
                                       (LETT |res|
                                             (SPADCALL |res|
                                                       (LIST (CONS 1 |nt|))
                                                       (QREFELT $ 222))
                                             . #42#))))
                                    ('T
                                     (LETT |res|
                                           (SPADCALL |res| (LIST |i|)
                                                     (QREFELT $ 222))
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
                                     (QREFELT $ 183))
                           0)
                          . #42#)
                    (LETT |coefr|
                          (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 74))
                                    (QREFELT $ 214))
                          . #42#)
                    (LETT |ror|
                          (|LODOF2;ramification_of| |f|
                           (SPADCALL |coefr| |n| (QREFELT $ 226))
                           (SPADCALL |slop| (QREFELT $ 53)) $)
                          . #42#)
                    (LETT |exp|
                          (SPADCALL
                           (SPADCALL
                            (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                            (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                           (QREFELT $ 127))
                          . #42#)
                    (LETT |tosub|
                          (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                    (SPADCALL |coefr| |exp| (QREFELT $ 226))
                                    (QREFELT $ 215))
                          . #42#)
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |tosub| (QREFELT $ 225)) (QREFELT $ 84))
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
                                        (QREFELT $ 104))
                                       (QREFELT $ 109))
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
                          (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 226))
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
                                                                            83))
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
                                                                           83)))
                                                . #42#)))))
                                  (EXIT
                                   (LETT |res|
                                         (SPADCALL |res| (LIST (CONS 1 |nt|))
                                                   (QREFELT $ 222))
                                         . #42#)))
                                 (LETT #24# (CDR #24#) . #42#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 1 |res|) . #42#)
                              (GO #44#)))))))))))))
              ((EQL (SPADCALL (QCAR |npf|) (QREFELT $ 73)) 1)
               (COND
                ((EQL (SPADCALL |slop| (QREFELT $ 53)) 1)
                 (SEQ
                  (LETT |cxs|
                        (SPADCALL
                         (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 74))
                                   (SPADCALL (|spadConstant| $ 12)
                                             (-
                                              (SPADCALL |slop| (QREFELT $ 55)))
                                             (QREFELT $ 147))
                                   (QREFELT $ 210))
                         (QREFELT $ 209))
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
                     (LETT |sym| (SPADCALL |cxs| (QREFELT $ 212)) . #42#)
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
                                  (QREFELT $ 213))
                                 . #42#)
                           (LETT |fullxr|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (QVELT |vi| 1) (QREFELT $ 73))
                                   (SPADCALL
                                    (SPADCALL (QCAR |npf|) 0 (QREFELT $ 74))
                                    (QREFELT $ 214))
                                   (QREFELT $ 215))
                                  |xsubsr| (QREFELT $ 210))
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
                                                                        216))))
                                            (QREFELT $ 219))
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
                                                                         209)))
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
                            (LETT #10# (SPADCALL |ric| (QREFELT $ 198)) . #42#)
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
                   ((SPADCALL |rk| |f| (QREFELT $ 220))
                    (PROGN
                     (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                     (GO #44#))))
                  (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 221)) . #42#)
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
                                 (LIST (CONS 0 |rk|)) (QREFELT $ 222)))
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
                          ((SPADCALL |rk| |f| (QREFELT $ 220))
                           (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                          ('T
                           (LETT |res|
                                 (SPADCALL |res| (LIST (CONS 0 |rk|))
                                           (QREFELT $ 222))
                                 . #42#)))))
                       (LETT #18# (CDR #18#) . #42#) (GO G190) G191 (EXIT NIL))
                  (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
                (#43#
                 (COND
                  ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 73)) 1
                             (QREFELT $ 48))
                   (SEQ
                    (LETT |gr|
                          (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 98))
                                    (QREFELT $ 224))
                          . #42#)
                    (LETT |npgr|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |gr| (QREFELT $ 225)) (QREFELT $ 84))
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
                                                              (QREFELT $ 73))
                                                    |gr|
                                                    (SPADCALL
                                                     (|spadConstant| $ 12) 1
                                                     (QREFELT $ 58)))
                                            . #42#)
                                      (EXIT
                                       (LETT |res|
                                             (SPADCALL |res|
                                                       (LIST (CONS 1 |nt|))
                                                       (QREFELT $ 222))
                                             . #42#))))
                                    ('T
                                     (LETT |res|
                                           (SPADCALL |res| (LIST |i|)
                                                     (QREFELT $ 222))
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
                                     (QREFELT $ 183))
                           0)
                          . #42#)
                    (LETT |coefr|
                          (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 74))
                                    (QREFELT $ 214))
                          . #42#)
                    (LETT |ror|
                          (|LODOF2;ramification_of| |f|
                           (SPADCALL |coefr| |n| (QREFELT $ 226))
                           (SPADCALL |slop| (QREFELT $ 53)) $)
                          . #42#)
                    (LETT |exp|
                          (SPADCALL
                           (SPADCALL
                            (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                            (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                           (QREFELT $ 127))
                          . #42#)
                    (LETT |tosub|
                          (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                    (SPADCALL |coefr| |exp| (QREFELT $ 226))
                                    (QREFELT $ 215))
                          . #42#)
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |tosub| (QREFELT $ 225)) (QREFELT $ 84))
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
                                        (QREFELT $ 104))
                                       (QREFELT $ 109))
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
                          (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 226))
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
                                                                            83))
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
                                                                           83)))
                                                . #42#)))))
                                  (EXIT
                                   (LETT |res|
                                         (SPADCALL |res| (LIST (CONS 1 |nt|))
                                                   (QREFELT $ 222))
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
                          (LETT #10# (SPADCALL |ric| (QREFELT $ 198)) . #42#)
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
                 ((SPADCALL |rk| |f| (QREFELT $ 220))
                  (PROGN
                   (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                   (GO #44#))))
                (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 221)) . #42#)
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
                               (LIST (CONS 0 |rk|)) (QREFELT $ 222)))
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
                        ((SPADCALL |rk| |f| (QREFELT $ 220))
                         (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                        ('T
                         (LETT |res|
                               (SPADCALL |res| (LIST (CONS 0 |rk|))
                                         (QREFELT $ 222))
                               . #42#)))))
                     (LETT #11# (CDR #11#) . #42#) (GO G190) G191 (EXIT NIL))
                (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
              (#43#
               (COND
                ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 73)) 1
                           (QREFELT $ 48))
                 (SEQ
                  (LETT |gr|
                        (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 98))
                                  (QREFELT $ 224))
                        . #42#)
                  (LETT |npgr|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                          (SPADCALL |gr| (QREFELT $ 225)) (QREFELT $ 84))
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
                                                            (QREFELT $ 73))
                                                  |gr|
                                                  (SPADCALL
                                                   (|spadConstant| $ 12) 1
                                                   (QREFELT $ 58)))
                                          . #42#)
                                    (EXIT
                                     (LETT |res|
                                           (SPADCALL |res| (LIST (CONS 1 |nt|))
                                                     (QREFELT $ 222))
                                           . #42#))))
                                  ('T
                                   (LETT |res|
                                         (SPADCALL |res| (LIST |i|)
                                                   (QREFELT $ 222))
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
                                   (QREFELT $ 183))
                         0)
                        . #42#)
                  (LETT |coefr|
                        (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 74))
                                  (QREFELT $ 214))
                        . #42#)
                  (LETT |ror|
                        (|LODOF2;ramification_of| |f|
                         (SPADCALL |coefr| |n| (QREFELT $ 226))
                         (SPADCALL |slop| (QREFELT $ 53)) $)
                        . #42#)
                  (LETT |exp|
                        (SPADCALL
                         (SPADCALL
                          (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                          (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                         (QREFELT $ 127))
                        . #42#)
                  (LETT |tosub|
                        (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                  (SPADCALL |coefr| |exp| (QREFELT $ 226))
                                  (QREFELT $ 215))
                        . #42#)
                  (LETT |r|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                          (SPADCALL |tosub| (QREFELT $ 225)) (QREFELT $ 84))
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
                                               (QREFELT $ 104))
                                     (QREFELT $ 109))
                           (LETT |lns| |i| . #42#)))))
                       (LETT #8# (CDR #8#) . #42#) (GO G190) G191 (EXIT NIL))
                  (LETT |f2r|
                        (QCDR (|LODOF2;factor_newton2| |ror| |r| |lns| $))
                        . #42#)
                  (LETT |v|
                        (|LODOF2;factor_riccati| |f2r| |factorizer| |option| $)
                        . #42#)
                  (LETT |r|
                        (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 226))
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
                                                                          83))
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
                                                                         83)))
                                              . #42#)))))
                                (EXIT
                                 (LETT |res|
                                       (SPADCALL |res| (LIST (CONS 1 |nt|))
                                                 (QREFELT $ 222))
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
         ((#1=#:G1256 NIL)
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
                               (SPADCALL (SPADCALL (QCDR |a|) (QREFELT $ 229))
                                         (QREFELT $ 230))
                               $)
                              (QREFELT $ 35))
                    . #2#))
             (#3='T
              (LETT |new_mon|
                    (SPADCALL |new_mon| (SPADCALL (QCDR |a|) (QREFELT $ 199))
                              (QREFELT $ 35))
                    . #2#)))
            (COND ((QEQCAR |f| 0) (LETT |ftmp| (QCDR |f|) . #2#))
                  (#3#
                   (SEQ (LETT |fr| (QCDR |f|) . #2#)
                        (LETT |ftmp| (QVELT |fr| 0) . #2#)
                        (EXIT
                         (LETT |new_mon|
                               (|LODOF2;ramification_of| |new_mon|
                                (SPADCALL (QVELT |fr| 3) (QREFELT $ 190))
                                (SPADCALL (QVELT |fr| 3) (QREFELT $ 73)) $)
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
                                                          (QREFELT $ 231))
                                                (QREFELT $ 158))
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
                     (PROGN (LETT #1# (CONS 0 |res|) . #2#) (GO #4=#:G1255)))))
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
        (SPROG ((#1=#:G791 NIL))
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
          (#2=#:G1269 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |coefr| (|spadConstant| $ 12) (QREFELT $ 234))
              (COND
               ((EQL |n| 1)
                (PROGN
                 (LETT #2# |f| . #3=(|LODOF2;ramification_of|))
                 (GO #4=#:G1268))))))
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
                             |lc| (QREFELT $ 236))
                            . #3#)
                      (LETT |mlc| (SPADCALL |mlc| |n| (QREFELT $ 237)) . #3#)
                      (LETT |extra|
                            (SPADCALL (SPADCALL |mlc| |dg| (QREFELT $ 34))
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL 1 |n| (QREFELT $ 51)) |dg|
                                         (QREFELT $ 238))
                                        (QREFELT $ 239))
                                       (QREFELT $ 191))
                                      (QREFELT $ 148))
                            . #3#)
                      (LETT |res| (SPADCALL |res| |extra| (QREFELT $ 35))
                            . #3#)
                      (EXIT
                       (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)) . #3#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (SPADCALL (EXPT |n| (SPADCALL |f| (QREFELT $ 41))) |res|
                       (QREFELT $ 240)))))
          #4# (EXIT #2#)))) 

(SDEFUN |LODOF2;ramification_of!0| ((|x| NIL) ($$ NIL))
        (PROG (|coefr| $)
          (LETT |coefr| (QREFELT $$ 1) . #1=(|LODOF2;ramification_of|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |coefr| |x| (QREFELT $ 226)))))) 

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
         ((#1=#:G1288 NIL)
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
          (#2=#:G1274 NIL) (#3=#:G1290 NIL) (|i| NIL) (#4=#:G1273 NIL)
          (#5=#:G1289 NIL)
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
                                           (QREFELT $ 219))
                                 . #6#)))
                         (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (PROGN (LETT #1# (CONS 0 |res|) . #6#) (GO #7=#:G1287)))))
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
                                           (QREFELT $ 222))
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
        (SPROG ((#1=#:G1300 NIL) (|d| (|PositiveInteger|)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |d| (SPADCALL (QVELT |ric| 3) (QREFELT $ 73))
                        . #2=(|LODOF2;make_rightfactor|))
                  (LETT |d| (* |d| (QVELT |ric| 1)) . #2#)
                  (COND
                   ((EQL |d| (SPADCALL |f| (QREFELT $ 41)))
                    (PROGN (LETT #1# |f| . #2#) (GO #3=#:G1299))))
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
          (#1=#:G1393 NIL) (|i| NIL)
          (|num|
           #2=(|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                         |cen|))
          (#3=#:G1392 NIL)
          (|coefs|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#4=#:G1391 NIL) (#5=#:G1390 NIL) (|den| #2#) (#6=#:G1389 NIL)
          (|k| NIL) (#7=#:G1388 NIL) (|j| NIL) (#8=#:G1387 NIL)
          (|nums|
           (|List|
            (|SquareMatrix| |order|
                            (|UnivariateLaurentSeries|
                             (|Expression| (|Integer|)) |var| |cen|))))
          (#9=#:G1386 NIL) (#10=#:G1385 NIL)
          (|denm|
           (|SquareMatrix| |order|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
          (#11=#:G1384 NIL) (#12=#:G1383 NIL)
          (|ll|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#13=#:G1382 NIL) (#14=#:G1381 NIL) (#15=#:G1380 NIL)
          (#16=#:G1379 NIL)
          (|nsr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#17=#:G1378 NIL)
          (|ser|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#18=#:G1377 NIL) (#19=#:G1376 NIL)
          (|pa| (|Vector| (|Expression| (|Integer|)))) (#20=#:G1375 NIL)
          (#21=#:G1374 NIL)
          (|system|
           (|List|
            (|Vector|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#22=#:G1373 NIL) (#23=#:G1372 NIL)
          (|cst|
           (|Stream|
            (|Record| (|:| |k| (|Integer|))
                      (|:| |c| (|Expression| (|Integer|))))))
          (#24=#:G1371 NIL) (#25=#:G1370 NIL)
          (|nn| (|Stream| (|NonNegativeInteger|)))
          (|sysram|
           (|List|
            (|Vector|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#26=#:G1369 NIL) (#27=#:G1368 NIL) (|mindg| (|Integer|))
          (|rp|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#28=#:G1367 NIL)
          (|s|
           (|Vector|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (|r|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ram| (|NonNegativeInteger|)) (|cric| (|Expression| (|Integer|))))
         (SEQ
          (LETT |cric| (SPADCALL (QVELT |ric| 3) (QREFELT $ 190))
                . #29=(|LODOF2;lift_rightfactor|))
          (LETT |ram| (SPADCALL (QVELT |ric| 3) (QREFELT $ 73)) . #29#)
          (LETT |r|
                (SPADCALL (SPADCALL (QVELT |ric| 0) 0 (QREFELT $ 54))
                          (QREFELT $ 209))
                . #29#)
          (LETT |rp| (|spadConstant| $ 14) . #29#)
          (LETT |s| (MAKEARR1 (+ |order| 1) (|spadConstant| $ 20)) . #29#)
          (SPADCALL |s| 1 (|spadConstant| $ 14) (QREFELT $ 244))
          (LETT |mindg| 0 . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #28# |order| . #29#) G190
               (COND ((|greater_SI| |i| #28#) (GO G191)))
               (SEQ
                (LETT |rp|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL (QREFELT $ 245))
                                  (|spadConstant| $ 20) |rp| (QREFELT $ 246))
                        (SPADCALL |r| |rp| (QREFELT $ 247)) (QREFELT $ 216))
                       (SPADCALL |ram| (QREFELT $ 76)) (QREFELT $ 248))
                      . #29#)
                (SPADCALL |s| (+ |i| 1) |rp| (QREFELT $ 244))
                (EXIT
                 (LETT |mindg| (MIN |mindg| (SPADCALL |rp| 0 (QREFELT $ 42)))
                       . #29#)))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (SPADCALL (CONS #'|LODOF2;lift_rightfactor!0| (VECTOR |mindg| $)) |s|
                    (QREFELT $ 251))
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
                          (QREFELT $ 255))
                . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #25# |ram| . #29#) G190
               (COND ((|greater_SI| |i| #25#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #29#) (LETT #24# (+ |order| 1) . #29#) G190
                      (COND ((|greater_SI| |j| #24#) (GO G191)))
                      (SEQ
                       (LETT |ser| (SPADCALL |s| |j| (QREFELT $ 256)) . #29#)
                       (LETT |cst|
                             (SPADCALL
                              (CONS #'|LODOF2;lift_rightfactor!2|
                                    (VECTOR |cric| |ser| |ram| $ |i|))
                              |nn| (QREFELT $ 261))
                             . #29#)
                       (EXIT
                        (SPADCALL (SPADCALL |sysram| |i| (QREFELT $ 263)) |j|
                                  (SPADCALL |cst| (QREFELT $ 120))
                                  (QREFELT $ 244))))
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
                                          (QREFELT $ 226)))))
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
                             (SPADCALL (SPADCALL |sysram| |i| (QREFELT $ 263))
                                       |j| (QREFELT $ 256))
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
                                     |ser| (QREFELT $ 272))
                                    . #29#)
                              (EXIT
                               (SPADCALL
                                (SPADCALL |system|
                                          (+ (* (- |i| 1) (QVELT |ric| 1)) |k|)
                                          (QREFELT $ 263))
                                |j| |nsr| (QREFELT $ 244))))
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
                        (SPADCALL (SPADCALL |ll| |i| (QREFELT $ 274)) |j|
                                  (SPADCALL
                                   (SPADCALL |system| |i| (QREFELT $ 263)) |j|
                                   (QREFELT $ 256))
                                  (QREFELT $ 275))))
                      (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |denm|
                (SPADCALL (SPADCALL |ll| (QREFELT $ 277))
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
                                (SPADCALL (SPADCALL |ll| |j| (QREFELT $ 274))
                                          |k|
                                          (SPADCALL
                                           (SPADCALL |system| |j|
                                                     (QREFELT $ 263))
                                           (+ |order| 1) (QREFELT $ 256))
                                          (QREFELT $ 275)))
                               ('T
                                (SPADCALL (SPADCALL |ll| |j| (QREFELT $ 274))
                                          |k|
                                          (SPADCALL
                                           (SPADCALL |system| |j|
                                                     (QREFELT $ 263))
                                           |k| (QREFELT $ 256))
                                          (QREFELT $ 275))))))
                            (LETT |k| (|inc_SI| |k|) . #29#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |nums| |i|
                           (SPADCALL (SPADCALL |ll| (QREFELT $ 277))
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
                           (SPADCALL (SPADCALL |num| |den| (QREFELT $ 249))
                                     (QREFELT $ 209))
                           (QREFELT $ 275))))
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
                                  (SPADCALL |coefs| (+ |i| 1) (QREFELT $ 113))
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
            (SPROG ((#2=#:G1325 NIL) (|psq| NIL))
                   (SEQ (LETT |psq| (SPADCALL |pa| |x| (QREFELT $ 267)) NIL)
                        (EXIT
                         (COND
                          ((SPADCALL |psq| (CONS 1 "failed") (QREFELT $ 268))
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
                             |k| (QREFELT $ 270))
                            (QREFELT $ 239))))))))))) 

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
                           (SPADCALL |i| (|spadConstant| $ 173)
                                     (QREFELT $ 136))
                           (SPADCALL |x| |ram| (QREFELT $ 257))
                           (QREFELT $ 132))
                          NIL)
                    (EXIT
                     (CONS |x|
                           (SPADCALL (SPADCALL |ser| |dg| (QREFELT $ 57))
                                     (SPADCALL |cric| |x| (QREFELT $ 258))
                                     (QREFELT $ 77)))))))))) 

(SDEFUN |LODOF2;lift_rightfactor!1| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 173) (QREFELT $ 252))) 

(SDEFUN |LODOF2;lift_rightfactor!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |mindg|)
          (LETT $ (QREFELT $$ 1) . #1=(|LODOF2;lift_rightfactor|))
          (LETT |mindg| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x|
                      (SPADCALL (|spadConstant| $ 12) |mindg| (QREFELT $ 147))
                      (QREFELT $ 249)))))) 

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
         ((#1=#:G1429 NIL) (#2=#:G1432 NIL) (|i| NIL)
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
          (#3=#:G791 NIL)
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
          (#4=#:G792 NIL) (#5=#:G1417 NIL)
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
          (#6=#:G1431 NIL) (|j| NIL) (#7=#:G1430 NIL)
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
                        (SPADCALL |g| (QREFELT $ 41)) (QREFELT $ 202))
              (PROGN
               (LETT #1# NIL . #10=(|LODOF2;same_charclass?|))
               (GO #11=#:G1428))))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 37)) (|spadConstant| $ 14)
                        (QREFELT $ 278))
              (LETT |f|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 14)
                               (SPADCALL |f| (QREFELT $ 37)) (QREFELT $ 249))
                     |f| (QREFELT $ 158))
                    . #10#)))
            (COND
             ((SPADCALL (SPADCALL |g| (QREFELT $ 37)) (|spadConstant| $ 14)
                        (QREFELT $ 278))
              (LETT |g|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 14)
                               (SPADCALL |g| (QREFELT $ 37)) (QREFELT $ 249))
                     |g| (QREFELT $ 158))
                    . #10#)))
            (COND
             ((EQL (SPADCALL |f| (QREFELT $ 41)) 1)
              (SEQ
               (LETT |il|
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| |g| (QREFELT $ 166)) 0
                                (QREFELT $ 54))
                      0 (QREFELT $ 208))
                     . #10#)
               (EXIT
                (PROGN
                 (LETT #1#
                       (COND
                        ((EQL (SPADCALL |il| 0 (QREFELT $ 42)) 0)
                         (SPADCALL (SPADCALL |il| 0 (QREFELT $ 57))
                                   (QREFELT $ 79)))
                        ('T NIL))
                       . #10#)
                 (GO #11#))))))
            (LETT |r|
                  (SPADCALL (CONS (|function| |LODOF2;newtonpolygon|) $)
                            (LIST |f| |g|) (QREFELT $ 286))
                  . #10#)
            (LETT |r11|
                  (SPADCALL (SPADCALL |r| 1 (QREFELT $ 287)) 1 (QREFELT $ 194))
                  . #10#)
            (LETT |r21|
                  (SPADCALL (SPADCALL |r| 2 (QREFELT $ 287)) 1 (QREFELT $ 194))
                  . #10#)
            (COND
             ((SPADCALL (QVELT |r11| 1) (|spadConstant| $ 68) (QREFELT $ 109))
              (SEQ (LETT |c| (QVELT |r11| 2) . #10#)
                   (LETT |c2| (QVELT |r21| 2) . #10#)
                   (LETT |d| (SPADCALL |c| (QREFELT $ 73)) . #10#)
                   (LETT |dm1| (- |d| 1) . #10#)
                   (LETT |fd| (SPADCALL |d| (QREFELT $ 76)) . #10#)
                   (LETT |cx|
                         (SPADCALL
                          (SPADCALL (SPADCALL |c| |dm1| (QREFELT $ 74))
                                    (SPADCALL |c2| |dm1| (QREFELT $ 74))
                                    (QREFELT $ 75))
                          |fd| (QREFELT $ 77))
                         . #10#)
                   (COND
                    ((NULL (SPADCALL |cx| (QREFELT $ 79)))
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
                                               (SPADCALL |cx| (QREFELT $ 225))
                                               (QREFELT $ 84))
                                              (QREFELT $ 83)))
                            (PROGN
                             (LETT #7# NIL . #10#)
                             (SEQ (LETT |j| 2 . #10#)
                                  (LETT #6#
                                        (LENGTH
                                         (SPADCALL |r| 1 (QREFELT $ 287)))
                                        . #10#)
                                  G190
                                  (COND ((|greater_SI| |j| #6#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #7#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |r| 1 (QREFELT $ 287))
                                            |j| (QREFELT $ 194))
                                           #7#)
                                          . #10#)))
                                  (LETT |j| (|inc_SI| |j|) . #10#) (GO G190)
                                  G191 (EXIT (NREVERSE #7#)))))
                           (SPADCALL |r| 2 (QREFELT $ 287)))
                          . #10#)))))
            (COND
             ((SPADCALL (SPADCALL |r| 1 (QREFELT $ 287))
                        (SPADCALL |r| 2 (QREFELT $ 287)) (QREFELT $ 288))
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
                             (QREFELT $ 198))
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
                             (QREFELT $ 208))
                   (QREFELT $ 209))
                  . #10#)
            (LETT |gr| (QVELT |gg| 3) . #10#)
            (LETT |ff|
                  (PROG2
                      (LETT #3#
                            (|LODOF2;substitute| (CONS 1 |rr|)
                             (CONS 0
                                   (|LODOF2;ramification_of| |f|
                                    (SPADCALL |gr| (QREFELT $ 190))
                                    (SPADCALL |gr| (QREFELT $ 73)) $))
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
             ((SPADCALL (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 194)) 1)
                        (|spadConstant| $ 68) (QREFELT $ 69))
              (PROGN (LETT #1# NIL . #10#) (GO #11#))))
            (LETT |fff|
                  (SPADCALL
                   (|LODOF2;factorUP|
                    (SPADCALL (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 194)) 2)
                              (SPADCALL
                               (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 194)) 2)
                               (QREFELT $ 190))
                              (QREFELT $ 289))
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
                    ((EQL (SPADCALL (QCAR |i|) (QREFELT $ 73)) 1)
                     (COND
                      ((SPADCALL
                        (SPADCALL (SPADCALL (QCAR |i|) 0 (QREFELT $ 74))
                                  (SPADCALL (QCAR |i|) 1 (QREFELT $ 74))
                                  (QREFELT $ 77))
                        (QREFELT $ 79))
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
         ((#2=#:G1481 NIL)
          (|re|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|srl|
           #3=(|LinearOrdinaryDifferentialOperator1|
               (|Fraction|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#4=#:G1456 NIL) (|ftmp| #3#)
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
          (#7=#:G1453 NIL) (#8=#:G1452 #6#) (#9=#:G1454 #6#) (#10=#:G1493 NIL)
          (|j| NIL)
          (|flm|
           (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (#11=#:G1447 NIL)
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
          (#13=#:G1492 NIL) (|fc| NIL) (#14=#:G1491 NIL) (#15=#:G1490 NIL)
          (|ff| NIL) (#16=#:G1489 NIL)
          (|fls|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#17=#:G1488 NIL) (#18=#:G1487 NIL) (#19=#:G1486 NIL)
          (#20=#:G1485 NIL) (#21=#:G1484 NIL) (#22=#:G1483 NIL)
          (#23=#:G1482 NIL) (|i| NIL))
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
                                                          (QREFELT $ 147))
                                                         |fc| (QREFELT $ 247))
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
                                                                         291))
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
                    ((SPADCALL |tf2| (CONS 1 "failed") (QREFELT $ 293))
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
                                                        (QREFELT $ 295))
                                              (QREFELT $ 99))
                                             (QREFELT $ 229))
                                            (SPADCALL (|spadConstant| $ 296)
                                                      |j| (QREFELT $ 297))
                                            (QREFELT $ 298))
                                           . #24#)
                                     (COND
                                      (#7#
                                       (LETT #8#
                                             (SPADCALL #8# #9# (QREFELT $ 299))
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
                             (SPADCALL (|spadConstant| $ 296)
                                       (SPADCALL |sr| (QREFELT $ 26))
                                       (QREFELT $ 302))
                             |sr| (QREFELT $ 298))
                            . #24#)
                      (COND
                       ((EQUAL |option| "use adjoint")
                        (LETT |sr| (SPADCALL |sr| (QREFELT $ 303)) . #24#)))
                      (LETT |srl| (SPADCALL |sr| (QREFELT $ 306)) . #24#)
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
                            (|spadConstant| $ 19) (QREFELT $ 234)))
                          (SEQ (LETT |ftmp| |srl| . #24#)
                               (LETT |srl| (|spadConstant| $ 307) . #24#)
                               (EXIT
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (SPADCALL |ftmp| (|spadConstant| $ 307)
                                                  (QREFELT $ 308)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |lc|
                                            (SPADCALL |ftmp| (QREFELT $ 309))
                                            . #24#)
                                      (LETT |dg|
                                            (SPADCALL |ftmp| (QREFELT $ 310))
                                            . #24#)
                                      (COND
                                       ((SPADCALL (QVELT |sng| 0)
                                                  (CONS 1 #25="infinity")
                                                  (QREFELT $ 312))
                                        (LETT |newx|
                                              (SPADCALL (|spadConstant| $ 151)
                                                        (SPADCALL
                                                         (|spadConstant| $ 12)
                                                         1 (QREFELT $ 58))
                                                        (QREFELT $ 313))
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
                                                 (QREFELT $ 225))
                                                (QREFELT $ 84))
                                               (QREFELT $ 229))
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
                                                      (QREFELT $ 302))
                                            . #24#)
                                      (COND
                                       ((SPADCALL (QVELT |sng| 0)
                                                  (CONS 1 #26="infinity")
                                                  (QREFELT $ 312))
                                        (LETT |newd|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|spadConstant| $ 12) 1
                                                   (QREFELT $ 58))
                                                  2 (QREFELT $ 70))
                                                 (QREFELT $ 229))
                                                (SPADCALL (QREFELT $ 314))
                                                (QREFELT $ 315))
                                               (QREFELT $ 316))
                                              . #24#))
                                       ('T
                                        (LETT |newd| (SPADCALL (QREFELT $ 314))
                                              . #24#)))
                                      (LETT |srl|
                                            (SPADCALL |srl|
                                                      (SPADCALL |slc|
                                                                (SPADCALL
                                                                 |newd| |dg|
                                                                 (QREFELT $
                                                                          317))
                                                                (QREFELT $
                                                                         315))
                                                      (QREFELT $ 318))
                                            . #24#)
                                      (EXIT
                                       (LETT |ftmp|
                                             (SPADCALL |ftmp| (QREFELT $ 319))
                                             . #24#)))
                                     NIL (GO G190) G191 (EXIT NIL)))))))
                       ('T
                        (SEQ (LETT |ftmp| |srl| . #24#)
                             (LETT |srl| (|spadConstant| $ 307) . #24#)
                             (EXIT
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (SPADCALL |ftmp| (|spadConstant| $ 307)
                                                (QREFELT $ 308)))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |lc|
                                          (SPADCALL |ftmp| (QREFELT $ 309))
                                          . #24#)
                                    (LETT |dg|
                                          (SPADCALL |ftmp| (QREFELT $ 310))
                                          . #24#)
                                    (COND
                                     ((SPADCALL (QVELT |sng| 0) (CONS 1 #25#)
                                                (QREFELT $ 312))
                                      (LETT |newx|
                                            (SPADCALL (|spadConstant| $ 151)
                                                      (SPADCALL
                                                       (|spadConstant| $ 12) 1
                                                       (QREFELT $ 58))
                                                      (QREFELT $ 313))
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
                                               (QREFELT $ 225))
                                              (QREFELT $ 84))
                                             (QREFELT $ 229))
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
                                                    (QREFELT $ 302))
                                          . #24#)
                                    (COND
                                     ((SPADCALL (QVELT |sng| 0) (CONS 1 #26#)
                                                (QREFELT $ 312))
                                      (LETT |newd|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 12)
                                                          1 (QREFELT $ 58))
                                                2 (QREFELT $ 70))
                                               (QREFELT $ 229))
                                              (SPADCALL (QREFELT $ 314))
                                              (QREFELT $ 315))
                                             (QREFELT $ 316))
                                            . #24#))
                                     ('T
                                      (LETT |newd| (SPADCALL (QREFELT $ 314))
                                            . #24#)))
                                    (LETT |srl|
                                          (SPADCALL |srl|
                                                    (SPADCALL |slc|
                                                              (SPADCALL |newd|
                                                                        |dg|
                                                                        (QREFELT
                                                                         $
                                                                         317))
                                                              (QREFELT $ 315))
                                                    (QREFELT $ 318))
                                          . #24#)
                                    (EXIT
                                     (LETT |ftmp|
                                           (SPADCALL |ftmp| (QREFELT $ 319))
                                           . #24#)))
                                   NIL (GO G190) G191 (EXIT NIL))))))
                      (EXIT
                       (COND
                        ((SPADCALL |option| "use adjoint" (QREFELT $ 320))
                         (SEQ
                          (LETT |re| (SPADCALL |f| |srl| (QREFELT $ 321))
                                . #24#)
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |re| (QREFELT $ 310)) 0
                                       (QREFELT $ 48))
                             (PROGN
                              (LETT #2#
                                    (CONS 0
                                          (LIST
                                           (SPADCALL |f| |re| (QREFELT $ 322))
                                           |re|))
                                    . #24#)
                              (GO #27=#:G1480)))))))
                        ('T
                         (SEQ
                          (COND
                           ((SPADCALL (QVELT |sng| 0) (CONS 1 "infinity")
                                      (QREFELT $ 312))
                            (LETT |re|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 151)
                                             (SPADCALL (|spadConstant| $ 12)
                                                       (SPADCALL |f|
                                                                 (QREFELT $
                                                                          310))
                                                       (QREFELT $ 58))
                                             (QREFELT $ 313))
                                   (QREFELT $ 323))
                                  . #24#))
                           ('T
                            (LETT |re|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 151)
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
                                                (QREFELT $ 225))
                                               (QREFELT $ 84))
                                              (SPADCALL |f| (QREFELT $ 310))
                                              (QREFELT $ 70))
                                             (QREFELT $ 313))
                                   (QREFELT $ 323))
                                  . #24#)))
                          (LETT |srl|
                                (SPADCALL
                                 (SPADCALL |re| (SPADCALL |f| (QREFELT $ 309))
                                           (QREFELT $ 324))
                                 |srl| (QREFELT $ 325))
                                . #24#)
                          (LETT |srl|
                                (SPADCALL |srl|
                                          (SPADCALL (|spadConstant| $ 296)
                                                    (SPADCALL |srl|
                                                              (QREFELT $ 309))
                                                    (QREFELT $ 302))
                                          (QREFELT $ 324))
                                . #24#)
                          (LETT |re| (SPADCALL |f| |srl| (QREFELT $ 326))
                                . #24#)
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |re| (QREFELT $ 310)) 0
                                       (QREFELT $ 48))
                             (PROGN
                              (LETT #2#
                                    (CONS 0
                                          (LIST |re|
                                                (SPADCALL |f| |re|
                                                          (QREFELT $ 327))))
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
         ((|nstep| (|Integer|)) (|acc| (|Integer|)) (#1=#:G1506 NIL)
          (|hps|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (|lv|
           (|List|
            (|Vector|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
          (#2=#:G1512 NIL) (|g| NIL) (#3=#:G1511 NIL) (#4=#:G1510 NIL)
          (|f| NIL) (#5=#:G1509 NIL) (|vdim| (|NonNegativeInteger|))
          (|cnt| (|Integer|)) (|eta| (|List| (|NonNegativeInteger|)))
          (#6=#:G1508 NIL) (|i| NIL) (#7=#:G1507 NIL) (|cb| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |cb|
                  (+
                   (SPADCALL
                    (SPADCALL |bound| (- (LENGTH |fl|) 1) (QREFELT $ 329))
                    (QREFELT $ 187))
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
            (LETT |cnt| (* (LENGTH |fl|) (+ |cb| 1)) . #8#)
            (LETT |vdim| (LENGTH (|SPADfirst| |fl|)) . #8#)
            (LETT |acc| (QUOTIENT2 (+ (+ |cnt| |vdim|) 3) |vdim|) . #8#)
            (LETT |nstep|
                  (SPADCALL
                   (SPADCALL (SPADCALL |acc| 2 (QREFELT $ 330)) 3
                             (QREFELT $ 51))
                   (QREFELT $ 187))
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
                                                         (QREFELT $ 98))
                                                        #3#)
                                                       . #8#)))
                                               (LETT #2# (CDR #2#) . #8#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #3#))))
                                         (QREFELT $ 332))
                                        #5#)
                                       . #8#)))
                               (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                               (EXIT (NREVERSE #5#))))
                         . #8#)
                   (LETT |hps| (SPADCALL |lv| |eta| |acc| (QREFELT $ 337))
                         . #8#)
                   (EXIT
                    (COND
                     ((EQL (ANCOLS |hps|) 1)
                      (PROGN
                       (LETT #1#
                             (CONS 0
                                   (SPADCALL (SPADCALL |hps| 1 (QREFELT $ 338))
                                             (QREFELT $ 339)))
                             . #8#)
                       (GO #9=#:G1505)))
                     ((EQL (ANCOLS |hps|) 0)
                      (PROGN (LETT #1# (CONS 1 "failed") . #8#) (GO #9#)))
                     ('T
                      (SEQ (LETT |acc| (+ |acc| |nstep|) . #8#)
                           (EXIT
                            (LETT |nstep|
                                  (+
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 3 2 (QREFELT $ 51))
                                              |nstep| (QREFELT $ 340))
                                    (QREFELT $ 185))
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
          (#1=#:G1520 NIL) (|j| NIL) (#2=#:G1519 NIL)
          (|p|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#3=#:G1518 NIL) (|i| NIL))
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
                                         (QREFELT $ 341))
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
          (#1=#:G1524 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |n| (SPADCALL |r| (QREFELT $ 41)))
              (PROGN
               (LETT #1# (SPADCALL (|spadConstant| $ 14) |n| (QREFELT $ 34))
                     . #2=(|LODOF2;xDn_modr|))
               (GO #3=#:G1523))))
            (LETT |a| (|LODOF2;xDn_modr| (- |n| 1) |r| $) . #2#)
            (LETT |coefa|
                  (SPADCALL |a| (- (SPADCALL |r| (QREFELT $ 41)) 1)
                            (QREFELT $ 54))
                  . #2#)
            (EXIT
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 34)) |a|
                         (QREFELT $ 160))
               (SPADCALL |a| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 34))
                         (QREFELT $ 160))
               (QREFELT $ 35))
              (SPADCALL |coefa| |r| (QREFELT $ 158)) (QREFELT $ 166)))))
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
         ((#1=#:G1540 NIL) (#2=#:G1541 NIL) (|i| NIL)
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
             ((SPADCALL (SPADCALL |f| (QREFELT $ 310)) 1 (QREFELT $ 49))
              (PROGN
               (LETT #1# (LIST |f|) . #3=(|LODOF2;factor;LodoMLL;47|))
               (GO #4=#:G1539))))
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
                            (SPADCALL (SPADCALL |b| 1 (QREFELT $ 343))
                                      |factorizer| |y| (QREFELT $ 346))
                            (SPADCALL (SPADCALL |b| 2 (QREFELT $ 343))
                                      |factorizer| |y| (QREFELT $ 346))
                            (QREFELT $ 347))
                           . #3#)
                     (SEQ (LETT |i| 3 . #3#) (LETT #2# (LENGTH |b|) . #3#) G190
                          (COND ((> |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |res|
                                      (SPADCALL
                                       (SPADCALL |b| |i| (QREFELT $ 343))
                                       |factorizer| |y| (QREFELT $ 346))
                                      (QREFELT $ 348))))
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
         ((#2=#:G1548 NIL)
          (|dlc|
           (|List| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#3=#:G1551 NIL) (|e| NIL) (#4=#:G1550 NIL)
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
          (#6=#:G1549 NIL) (|i| NIL)
          (|ux|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|ftmp| #1#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fi| (|spadConstant| $ 307) . #7=(|LODOF2;inf_singularity?|))
            (LETT |ftmp| |f| . #7#)
            (LETT |ux|
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| $ 12) 2 (QREFELT $ 58))
                             (QREFELT $ 229))
                   (QREFELT $ 349))
                  . #7#)
            (LETT |yu| (|spadConstant| $ 350) . #7#)
            (SEQ (LETT |i| 0 . #7#)
                 (LETT #6# (SPADCALL |f| (QREFELT $ 310)) . #7#) G190
                 (COND ((|greater_SI| |i| #6#) (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |f| |i| (QREFELT $ 351)) . #7#)
                      (LETT |lcn|
                            (|LODOF2;subsup| (SPADCALL |lc| (QREFELT $ 29))
                             (SPADCALL (|spadConstant| $ 151)
                                       (SPADCALL (|spadConstant| $ 12) 1
                                                 (QREFELT $ 58))
                                       (QREFELT $ 313))
                             $)
                            . #7#)
                      (LETT |lcd|
                            (|LODOF2;subsup| (SPADCALL |lc| (QREFELT $ 27))
                             (SPADCALL (|spadConstant| $ 151)
                                       (SPADCALL (|spadConstant| $ 12) 1
                                                 (QREFELT $ 58))
                                       (QREFELT $ 313))
                             $)
                            . #7#)
                      (LETT |slc| (SPADCALL |lcn| |lcd| (QREFELT $ 302)) . #7#)
                      (LETT |fi|
                            (SPADCALL |fi|
                                      (SPADCALL |slc| |yu| (QREFELT $ 315))
                                      (QREFELT $ 318))
                            . #7#)
                      (EXIT
                       (LETT |yu|
                             (SPADCALL
                              (SPADCALL |ux| (SPADCALL (QREFELT $ 314))
                                        (QREFELT $ 315))
                              |yu| (QREFELT $ 325))
                             . #7#)))
                 (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |fi|
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 296)
                             (SPADCALL |fi| (QREFELT $ 309)) (QREFELT $ 302))
                   |fi| (QREFELT $ 315))
                  . #7#)
            (LETT |dlc|
                  (PROGN
                   (LETT #4# NIL . #7#)
                   (SEQ (LETT |e| (SPADCALL |fi| (QREFELT $ 353)) . #7#)
                        (LETT #3# (SPADCALL |fi| (QREFELT $ 310)) . #7#) G190
                        (COND ((> |e| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #4#
                                (CONS
                                 (SPADCALL (SPADCALL |fi| |e| (QREFELT $ 351))
                                           (QREFELT $ 27))
                                 #4#)
                                . #7#)))
                        (LETT |e| (+ |e| 1) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #4#))))
                  . #7#)
            (COND
             ((SPADCALL
               (SPADCALL (SPADCALL |dlc| (QREFELT $ 355))
                         (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                         (|spadConstant| $ 52) (QREFELT $ 83))
               (|spadConstant| $ 52) (QREFELT $ 85))
              (PROGN (LETT #2# 'T . #7#) (GO #8=#:G1547))))
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
         ((#1=#:G1656 NIL) (#2=#:G1621 NIL)
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
          (#4=#:G791 NIL) (#5=#:G1680 NIL) (|l| NIL)
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
          (#6=#:G1602 NIL)
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
          (#7=#:G792 NIL)
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
          (#8=#:G1679 NIL) (|s| NIL) (#9=#:G1678 NIL) (|sop| NIL)
          (#10=#:G1677 NIL) (#11=#:G1675 NIL) (#12=#:G1676 NIL) (|sa| NIL)
          (#13=#:G1674 NIL)
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
          (#15=#:G1673 NIL) (|all_one| (|Boolean|)) (#16=#:G1672 NIL)
          (#17=#:G1670 NIL) (|ssp| NIL) (#18=#:G1671 NIL)
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
          (#20=#:G1669 NIL) (|ge| NIL) (|min_deg| (|PositiveInteger|))
          (|dl| (|List| (|PositiveInteger|))) (#21=#:G1668 NIL)
          (#22=#:G1667 NIL) (|eba| (|Integer|)) (|gema| #19#)
          (|eb| (|Integer|)) (|bound| (|List| (|Fraction| (|Integer|))))
          (#23=#:G1666 NIL) (|j| NIL) (#24=#:G1665 NIL) (#25=#:G1664 NIL)
          (|i| NIL) (|v| (|List| (|Fraction| (|Integer|)))) (#26=#:G1663 NIL)
          (|ji1x| #27=(|Integer|)) (|jix| #27#) (|ji1y| #28=(|Integer|))
          (|jiy| #28#) (#29=#:G1662 NIL)
          (|np|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (#30=#:G1661 NIL) (#31=#:G1660 NIL) (#32=#:G1659 NIL)
          (#33=#:G1658 NIL) (#34=#:G1657 NIL)
          (|a|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 310)) 1 (QREFELT $ 49))
              (PROGN
               (LETT #1# (LIST |f|) . #35=(|LODOF2;factor_global|))
               (GO #36=#:G1655))))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 309)) (|spadConstant| $ 296)
                        (QREFELT $ 357))
              (SEQ
               (LETT |a|
                     (|LODOF2;factor_global|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 296)
                                 (SPADCALL |f| (QREFELT $ 309))
                                 (QREFELT $ 302))
                       |f| (QREFELT $ 315))
                      |factorizer| $)
                     . #35#)
               (EXIT
                (PROGN
                 (LETT #1#
                       (CONS
                        (SPADCALL (SPADCALL |f| (QREFELT $ 309))
                                  (SPADCALL |a| 1 (QREFELT $ 343))
                                  (QREFELT $ 315))
                        (PROGN
                         (LETT #34# NIL . #35#)
                         (SEQ (LETT |i| 2 . #35#)
                              (LETT #33# (LENGTH |a|) . #35#) G190
                              (COND ((|greater_SI| |i| #33#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #34#
                                      (CONS (SPADCALL |a| |i| (QREFELT $ 343))
                                            #34#)
                                      . #35#)))
                              (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #34#)))))
                       . #35#)
                 (GO #36#))))))
            (COND
             ((EQL (SPADCALL |f| (QREFELT $ 310)) 2)
              (SPADCALL "Better to use old factorizer" (QREFELT $ 170))))
            (LETT |gem| (SPADCALL |f| |factorizer| "" (QREFELT $ 361)) . #35#)
            (LETT |bound|
                  (PROGN
                   (LETT #32# NIL . #35#)
                   (SEQ (LETT |i| 1 . #35#)
                        (LETT #31# (- (SPADCALL |f| (QREFELT $ 310)) 1) . #35#)
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
                               (QVELT (SPADCALL |np| |i| (QREFELT $ 194)) 0))
                              . #35#)
                        (LETT |ji1y|
                              (QCDR
                               (QVELT (SPADCALL |np| (+ |i| 1) (QREFELT $ 194))
                                      0))
                              . #35#)
                        (LETT |jix|
                              (QCAR
                               (QVELT (SPADCALL |np| |i| (QREFELT $ 194)) 0))
                              . #35#)
                        (LETT |ji1x|
                              (QCAR
                               (QVELT (SPADCALL |np| (+ |i| 1) (QREFELT $ 194))
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
                                                            (QREFELT $ 104))
                                                  (SPADCALL
                                                   (* (- |l| |jix|)
                                                      (- |ji1y| |jiy|))
                                                   (- |ji1x| |jix|)
                                                   (QREFELT $ 51))
                                                  (QREFELT $ 106)))
                                                (QREFELT $ 362))
                                      . #35#)))
                              (LETT |l| (+ |l| 1) . #35#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191
                       (EXIT NIL))
                  (SEQ (LETT |i| 1 . #35#)
                       (LETT #25# (- (SPADCALL |f| (QREFELT $ 310)) 1) . #35#)
                       G190 (COND ((|greater_SI| |i| #25#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |bound| |i|
                                   (SPADCALL
                                    (SPADCALL |bound| |i| (QREFELT $ 329))
                                    (SPADCALL (QVELT (QVELT |s| 0) 2)
                                              (SPADCALL |v| (+ |i| 1)
                                                        (QREFELT $ 329))
                                              (QREFELT $ 105))
                                    (QREFELT $ 106))
                                   (QREFELT $ 363))))
                       (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (LETT |eb| (+ |eb| (QVELT (QVELT |s| 0) 2)) . #35#)))
                 (LETT #30# (CDR #30#) . #35#) (GO G190) G191 (EXIT NIL))
            (LETT |bound|
                  (PROGN
                   (LETT #24# NIL . #35#)
                   (SEQ (LETT |j| 1 . #35#)
                        (LETT #23# (- (SPADCALL |f| (QREFELT $ 310)) 1) . #35#)
                        G190 (COND ((|greater_SI| |j| #23#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #24#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |bound|
                                             (- (SPADCALL |f| (QREFELT $ 310))
                                                |j|)
                                             (QREFELT $ 329))
                                   (QREFELT $ 364))
                                  (SPADCALL |j| (SPADCALL |eb| (QREFELT $ 104))
                                            (QREFELT $ 365))
                                  (QREFELT $ 106))
                                 #24#)
                                . #35#)))
                        (LETT |j| (|inc_SI| |j|) . #35#) (GO G190) G191
                        (EXIT (NREVERSE #24#))))
                  . #35#)
            (LETT |eb| (|LODOF2;compute_bound| |gem| (|spadConstant| $ 19) $)
                  . #35#)
            (LETT |gema|
                  (SPADCALL |f| |factorizer| "use adjoint" (QREFELT $ 361))
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
                  (LETT |min_deg| (SPADCALL (ELT $ 369) |dl| (QREFELT $ 372))
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
                             (LETT |gem| (SPADCALL |ge| |gem| (QREFELT $ 373))
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
                                             (QREFELT $ 376))
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
                                                              (QREFELT $ 377))
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
              (SPADCALL "Better to use old factorizer" (QREFELT $ 170))))
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
                                (SPADCALL (SPADCALL |f| (QREFELT $ 310)) 2
                                          (QREFELT $ 51))
                                (QREFELT $ 185))
                               |bound| (QCAR |s|) |f| |eb| 0 "" $)
                              . #35#)
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 379))
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
                                             (QREFELT $ 380))
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
                                  (QREFELT $ 376))
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
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 310)) 2
                                           (QREFELT $ 51))
                                 (QREFELT $ 185))
                                |bound| (QCAR |s|) |f| |eba| 0 "use adjoint" $)
                               . #35#)
                         (EXIT
                          (COND
                           ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 379))
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
                               (- (SPADCALL |f| (QREFELT $ 310)) 1) |bound|
                               (QCAR |s|) |f| |eb|
                               (+
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 310)) 2
                                           (QREFELT $ 51))
                                 (QREFELT $ 185))
                                1)
                               "" $)
                              . #35#)
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 379))
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
                                (- (SPADCALL |f| (QREFELT $ 310)) 1) |bound|
                                (QCAR |s|) |f| |eba|
                                (+
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |f| (QREFELT $ 310)) 2
                                            (QREFELT $ 51))
                                  (QREFELT $ 185))
                                 1)
                                "use adjoint" $)
                               . #35#)
                         (EXIT
                          (COND
                           ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 379))
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
                                  (LETT #7# (SPADCALL |j1| (QREFELT $ 198))
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
                               (- (SPADCALL |f| (QREFELT $ 310)) 1) |bound|
                               (QCAR |s|) |f| 0 0 "" $)
                              . #35#)
                        (COND
                         ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 379))
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
                                                   (QREFELT $ 380))
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
                                              (QREFELT $ 220))))
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
                                  (SPADCALL |kk| (QREFELT $ 380)) |factorizer|
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
                               (- (SPADCALL |f| (QREFELT $ 310)) 1) |bound|
                               (QCAR |s|) |f| 0 0 "use adjoint" $)
                              . #35#)
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 379))
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
            (SPADCALL "Try the old factorizer" (QREFELT $ 170))
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
         ((#1=#:G1703 NIL) (#2=#:G1685 NIL)
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
          (#4=#:G791 NIL) (#5=#:G1704 NIL) (|i| NIL)
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
          (#6=#:G1694 NIL) (|fl| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fl|
                  (SPADCALL
                   (SPADCALL (SPADCALL |f| (QREFELT $ 310)) 2 (QREFELT $ 51))
                   (QREFELT $ 185))
                  . #7=(|LODOF2;factor_minmult1|))
            (LETT |t|
                  (|LODOF2;try_factorization| |r| |fl| |bound| |sng| |f| |eb| 0
                   "" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 379))
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
               (GO #8=#:G1702))))
            (LETT |w|
                  (PROG2
                      (LETT #6#
                            (|LODOF2;factor_op|
                             (SPADCALL (QVELT |sng| 1) (QREFELT $ 380))
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
                                  (QREFELT $ 220))))
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
                      (SPADCALL |r| (QREFELT $ 380)) |factorizer| $)
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
             ((SPADCALL |r_left| (|spadConstant| $ 18) (QREFELT $ 220))
              (|error| "bug")))
            (LETT |t|
                  (|LODOF2;try_factorization| |r_left| |fl| |bound| |sng| |f|
                   |eba| 0 "use adjoint" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 379))
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
                   (- (SPADCALL |f| (QREFELT $ 310)) 1) |bound| |sng| |f| |eb|
                   (+ |fl| 1) "" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 379))
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
                   (- (SPADCALL |f| (QREFELT $ 310)) 1) |bound| |sng| |f| |eba|
                   (+ |fl| 1) "use adjoint" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 379))
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
          (#4=#:G1706 NIL) (|dg| (|NonNegativeInteger|))
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (SEQ (LETT |lpf| (|spadConstant| $ 307) . #5=(|LODOF2;l_p|))
              (COND
               ((SPADCALL |p| (CONS 0 (|spadConstant| $ 19)) (QREFELT $ 312))
                (LETT |lpf| |f| . #5#))
               ('T
                (SEQ (LETT |ftmp| |f| . #5#)
                     (EXIT
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL |ftmp| (|spadConstant| $ 307)
                                        (QREFELT $ 308)))
                             (GO G191)))
                           (SEQ
                            (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 309)) . #5#)
                            (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 310)) . #5#)
                            (COND
                             ((SPADCALL |p| (CONS 1 "infinity")
                                        (QREFELT $ 312))
                              (LETT |newx|
                                    (SPADCALL (|spadConstant| $ 151)
                                              (SPADCALL (|spadConstant| $ 12) 1
                                                        (QREFELT $ 58))
                                              (QREFELT $ 313))
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
                                       (QREFELT $ 225))
                                      (QREFELT $ 59))
                                     (QREFELT $ 229))
                                    . #5#)))
                            (LETT |lcn|
                                  (|LODOF2;subsup|
                                   (SPADCALL |lc| (QREFELT $ 29)) |newx| $)
                                  . #5#)
                            (LETT |lcd|
                                  (|LODOF2;subsup|
                                   (SPADCALL |lc| (QREFELT $ 27)) |newx| $)
                                  . #5#)
                            (LETT |slc| (SPADCALL |lcn| |lcd| (QREFELT $ 302))
                                  . #5#)
                            (COND
                             ((SPADCALL |p| (CONS 1 "infinity")
                                        (QREFELT $ 312))
                              (LETT |newd|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| $ 12) 1
                                                  (QREFELT $ 58))
                                        2 (QREFELT $ 70))
                                       (QREFELT $ 229))
                                      (SPADCALL (QREFELT $ 314))
                                      (QREFELT $ 315))
                                     (QREFELT $ 316))
                                    . #5#))
                             ('T
                              (LETT |newd| (SPADCALL (QREFELT $ 314)) . #5#)))
                            (LETT |lpf|
                                  (SPADCALL |lpf|
                                            (SPADCALL |slc|
                                                      (SPADCALL |newd| |dg|
                                                                (QREFELT $
                                                                         317))
                                                      (QREFELT $ 315))
                                            (QREFELT $ 318))
                                  . #5#)
                            (EXIT
                             (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 319))
                                   . #5#)))
                           NIL (GO G190) G191 (EXIT NIL))))))
              (LETT |llr|
                    (|LODOF2;convertL3toLL| (SPADCALL |lpf| (QREFELT $ 382)) $)
                    . #5#)
              (EXIT
               (SPADCALL
                (SPADCALL (|spadConstant| $ 14) (SPADCALL |llr| (QREFELT $ 37))
                          (QREFELT $ 249))
                |llr| (QREFELT $ 158)))))) 

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
         (SEQ (LETT |res| (|spadConstant| $ 384) . #2=(|LODOF2;subsup|))
              (LETT |nptmp| |np| . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |nptmp| (|spadConstant| $ 52) (QREFELT $ 152)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |nptmp| (QREFELT $ 190)) . #2#)
                        (LETT |dg| (SPADCALL |nptmp| (QREFELT $ 73)) . #2#)
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| (QREFELT $ 225))
                                         (SPADCALL |newx| |dg| (QREFELT $ 385))
                                         (QREFELT $ 386))
                                        (QREFELT $ 387))
                              . #2#)
                        (EXIT
                         (LETT |nptmp| (SPADCALL |nptmp| (QREFELT $ 192))
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
          (LETT |min_pol| (SPADCALL |k| (QREFELT $ 389))
                . #2=(|LODOF2;get_trace|))
          (LETT |Sae|
                (|SimpleAlgebraicExtension| (|Expression| (|Integer|))
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|)))
                                            (SPADCALL |min_pol|
                                                      (QREFELT $ 99)))
                . #2#)
          (LETT |fa| (SPADCALL |f| |k| |min_pol| (QREFELT $ 392)) . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |fa| (QREFELT $ 99))
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
         (SEQ (LETT |res| (|spadConstant| $ 394) . #2=(|LODOF2;make_poly|))
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
                                         (QREFELT $ 395))
                                        (QREFELT $ 396))
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
         ((|res| (|Fraction| (|Integer|))) (#1=#:G1733 NIL) (#2=#:G1756 NIL)
          (|ma| (|Union| (|Fraction| (|Integer|)) #3="-infinity"))
          (|cq| (|Fraction| (|Integer|))) (|c| (|Expression| (|Integer|)))
          (#4=#:G1763 NIL) (|ke| NIL)
          (|ks| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|vpej| #5=(|Fraction| (|Integer|))) (|vpei| #5#)
          (|rjj| #6=(|NonNegativeInteger|)) (#7=#:G1761 NIL) (|jj| NIL)
          (#8=#:G1762 NIL) (|fpsjj| NIL) (|r| #6#) (#9=#:G1758 NIL) (|f| NIL)
          (#10=#:G1759 NIL) (|fps| NIL) (#11=#:G1760 NIL) (|ji| NIL)
          (#12=#:G1757 NIL) (|ge| NIL))
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
                            (LETT |r| (SPADCALL (QVELT |fps| 1) (QREFELT $ 73))
                                  . #13#)
                            (LETT |c| (SPADCALL |f| 0 (QREFELT $ 57)) . #13#)
                            (SEQ (LETT |fpsjj| NIL . #13#)
                                 (LETT #8#
                                       (SPADCALL (QVELT |ge| 1) |ji|
                                                 (QREFELT $ 398))
                                       . #13#)
                                 (LETT |jj| NIL . #13#)
                                 (LETT #7#
                                       (SPADCALL (QVELT |ge| 2) |ji|
                                                 (QREFELT $ 397))
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
                                                  (QREFELT $ 73))
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
                                                              (QREFELT $ 107))
                                                    (QREFELT $ 239))
                                                   (QREFELT $ 399))
                                         . #13#)))
                                 (LETT #7#
                                       (PROG1 (CDR #7#)
                                         (LETT #8# (CDR #8#) . #13#))
                                       . #13#)
                                 (GO G190) G191 (EXIT NIL))
                            (LETT |ks| (SPADCALL |c| (QREFELT $ 401)) . #13#)
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
                                      (SPADCALL (SPADCALL |ke| (QREFELT $ 402))
                                                (QREFELT $ 404))
                                      1)
                                     (SEQ
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c| (QREFELT $ 405)) |ke|
                                          |rlc| (QREFELT $ 406))
                                         (|spadConstant| $ 19) (QREFELT $ 234))
                                        (PROGN
                                         (LETT #2#
                                               (|LODOF2;compute_bound| |gem|
                                                (SPADCALL |rlc|
                                                          (|spadConstant| $ 12)
                                                          (QREFELT $ 399))
                                                $)
                                               . #13#)
                                         (GO #14=#:G1755))))
                                      (EXIT
                                       (LETT |c|
                                             (SPADCALL |c| |ke| |rlc|
                                                       (QREFELT $ 406))
                                             . #13#))))
                                    ('T
                                     (LETT |c|
                                           (SPADCALL
                                            (|LODOF2;get_trace| |c| |ke| $)
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |ke| (QREFELT $ 389))
                                              (QREFELT $ 407))
                                             (QREFELT $ 76))
                                            (QREFELT $ 77))
                                           . #13#)))))
                                 (LETT #4# (CDR #4#) . #13#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |cq| (SPADCALL |c| (QREFELT $ 408)) . #13#)
                            (EXIT
                             (COND
                              ((SPADCALL |ma| (CONS 1 "-infinity")
                                         (QREFELT $ 410))
                               (LETT |ma|
                                     (CONS 0 (SPADCALL |cq| (QREFELT $ 364)))
                                     . #13#))
                              ('T
                               (LETT |ma|
                                     (CONS 0
                                           (SPADCALL
                                            (SPADCALL |cq| (QREFELT $ 364))
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
                                            (QREFELT $ 411)))
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
                       ((SPADCALL |ma| (CONS 1 "-infinity") (QREFELT $ 410))
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
                                                 (QREFELT $ 105))
                                       (QREFELT $ 106))
                             . #13#)))
                 (LETT #12# (CDR #12#) . #13#) (GO G190) G191 (EXIT NIL))
            (EXIT (MAX 0 (SPADCALL |res| (QREFELT $ 185))))))
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
          (#2=#:G1766 NIL)
          (|ss|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#3=#:G1788 NIL) (|root| NIL) (#4=#:G1787 NIL)
          (|es| (|List| (|Expression| (|Integer|)))) (#5=#:G1786 NIL) (|g| NIL)
          (#6=#:G1785 NIL)
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
          (|r| (|NonNegativeInteger|)) (#8=#:G1784 NIL) (|e| NIL)
          (|v|
           (|List|
            (|Record| (|:| |op| #7#)
                      (|:| |ram|
                           (|UnivariatePolynomial| |var|
                                                   (|Expression| (|Integer|))))
                      (|:| |expart|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))))
          (#9=#:G1774 NIL)
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
               (SEQ (LETT |r| (SPADCALL (QVELT |e| 1) (QREFELT $ 73)) . #10#)
                    (LETT |s| (QVELT |e| 0) . #10#)
                    (LETT |es|
                          (PROGN
                           (LETT #6# NIL . #10#)
                           (SEQ (LETT |g| NIL . #10#)
                                (LETT #5#
                                      (SPADCALL
                                       (SPADCALL (|LODOF2;make_poly| |s| $)
                                                 |factorizer2|)
                                       (QREFELT $ 414))
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
                                         (SPADCALL (QCAR |g|) (QREFELT $ 415))
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
                                           (SPADCALL |root| (QREFELT $ 191))
                                           (QVELT |e| 2) (QREFELT $ 216))
                                          (SPADCALL |r| (QREFELT $ 76))
                                          (QREFELT $ 248))
                                         #4#)
                                        . #10#)))
                                (LETT #3# (CDR #3#) . #10#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          . #10#)
                    (COND
                     ((SPADCALL |p| (CONS 1 "infinity") (QREFELT $ 312))
                      (LETT |tr|
                            (SPADCALL (|spadConstant| $ 151)
                                      (SPADCALL (|spadConstant| $ 12) 1
                                                (QREFELT $ 58))
                                      (QREFELT $ 313))
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
                               (QREFELT $ 225))
                              (QREFELT $ 84))
                             (QREFELT $ 229))
                            . #10#)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (LIST (VECTOR |ss| (QVELT |e| 1) |tr|))
                                     (QREFELT $ 418))
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
          (|es| (|List| (|Fraction| (|Integer|)))) (#2=#:G1848 NIL) (|g| NIL)
          (#3=#:G1847 NIL)
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
          (|r| (|NonNegativeInteger|)) (#5=#:G1846 NIL) (|e| NIL)
          (|v|
           (|List|
            (|Record| (|:| |op| #4#)
                      (|:| |ram|
                           (|UnivariatePolynomial| |var|
                                                   (|Expression| (|Integer|))))
                      (|:| |expart|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))))
          (#6=#:G1807 NIL) (#7=#:G1845 NIL) (|sg| NIL)
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
          (#8=#:G1844 NIL) (#9=#:G1843 NIL) (|root| (|Expression| (|Integer|)))
          (#10=#:G1842 NIL)
          (|dnf|
           (|List|
            (|Record|
             (|:| |factor|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|Integer|)))))
          (#11=#:G1841 NIL) (|p| NIL)
          (|dlc|
           (|List| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#12=#:G1840 NIL) (#13=#:G1839 NIL))
         (SEQ
          (LETT |dlc|
                (PROGN
                 (LETT #13# NIL . #14=(|LODOF2;ge_minimal;LodoMSL;61|))
                 (SEQ (LETT |e| (SPADCALL |f| (QREFELT $ 353)) . #14#)
                      (LETT #12# (SPADCALL |f| (QREFELT $ 310)) . #14#) G190
                      (COND ((> |e| #12#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #13#
                              (CONS
                               (SPADCALL (SPADCALL |f| |e| (QREFELT $ 351))
                                         (QREFELT $ 27))
                               #13#)
                              . #14#)))
                      (LETT |e| (+ |e| 1) . #14#) (GO G190) G191
                      (EXIT (NREVERSE #13#))))
                . #14#)
          (LETT |dlc| (SPADCALL |dlc| (QREFELT $ 422)) . #14#)
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
                                 (QREFELT $ 423))
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
                      (SPADCALL (SPADCALL (QCAR |g|) (QREFELT $ 98))
                                (QREFELT $ 415))
                      . #14#)
                (EXIT
                 (LETT |singularities|
                       (CONS
                        (VECTOR (CONS 0 |root|)
                                (|LODOF2;l_p| |f| (CONS 0 |root|) $)
                                (SPADCALL (QCAR |g|) (QREFELT $ 73)))
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
                                                   (QREFELT $ 380))
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
                      (LETT |r| (SPADCALL (QVELT |e| 1) (QREFELT $ 73)) . #14#)
                      (LETT |s| (QVELT |e| 0) . #14#)
                      (LETT |es|
                            (PROGN
                             (LETT #3# NIL . #14#)
                             (SEQ (LETT |g| NIL . #14#)
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL (|LODOF2;make_poly| |s| $)
                                                   |factorizer|)
                                         (QREFELT $ 414))
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
                                                      (QREFELT $ 415))
                                            (QREFELT $ 408))
                                           #3#)
                                          . #14#)))
                                  (LETT #2# (CDR #2#) . #14#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            . #14#)
                      (LETT |ms|
                            (SPADCALL
                             (SPADCALL (ELT $ 107) |es| (QREFELT $ 425))
                             (QREFELT $ 239))
                            . #14#)
                      (LETT |ss|
                            (SPADCALL
                             (SPADCALL (SPADCALL |ms| (QREFELT $ 191))
                                       (QVELT |e| 2) (QREFELT $ 216))
                             (SPADCALL |r| (QREFELT $ 76)) (QREFELT $ 248))
                            . #14#)
                      (EXIT
                       (LETT |mg| (SPADCALL |mg| (LIST |ss|) (QREFELT $ 121))
                             . #14#)))
                     (LETT #5# (CDR #5#) . #14#) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |res| (CONS (VECTOR |sg| |v| |mg|) |res|) . #14#)))
               (LETT #7# (CDR #7#) . #14#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperatorFactorizer2;|)) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer2| (&REST #1=#:G1849)
  (SPROG NIL
         (PROG (#2=#:G1850)
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
          (LETT $ (GETREFV 426) . #1#)
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
              (|UnivariatePolynomial| 6 11) (|UnivariateTaylorSeries| 11 6 7)
              (0 . |coerce|) (|Expression| 38) (5 . |One|)
              (|UnivariateLaurentSeries| 11 6 7) (9 . |One|)
              (|NonNegativeInteger|) (13 . |univariatePolynomial|)
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
              (221 . ^) (|OneDimensionalArray| 8) (227 . |setelt!|)
              (234 . |degree|) (239 . |coefficient|) (245 . -) (251 . |coerce|)
              (256 . /) (|IntegerRetractions| 11) (262 . |integer?|) (267 . ~=)
              (273 . |integer|) (278 . |coerce|) (283 . |eval|) (290 . -)
              (296 . =) (302 . >) (308 . |elt|) (314 . *)
              (320 . |setDifference|) (326 . |position|) (332 . |elt|)
              (|List| 17) (338 . |append|) (|Mapping| 101 97) (|String|)
              |LODOF2;testfn;LodoMSL;8| (|SparseUnivariatePolynomial| 11)
              (344 . |makeSUP|) (349 . |unmakeSUP|) (|Mapping| 8 97)
              (|Factored| 97) (|FactoredFunctions2| 97 8) (354 . |map|)
              (360 . |coerce|) (365 . *) (371 . +) (377 . |min|) (383 . |quo|)
              (389 . =) (|Record| (|:| |Qt| 17) (|:| |Rt| 17))
              |LODOF2;testf2;LodoUpFR;11| (|List| 13) (395 . |elt|)
              (|Record| (|:| |laurl| 112) (|:| |laurr| 112))
              |LODOF2;testll;FLodo2UpFIR;14|
              (|Record| (|:| |k| 38) (|:| |c| 11)) (|Stream| 116) (|List| 117)
              (401 . |elt|) (407 . |series|) (412 . |append|) (|Stream| 17)
              (|Mapping| 17 110) (|Stream| 110) (|StreamFunctions2| 110 17)
              (418 . |map|) (424 . |retract|)
              (|Record| (|:| |llc| 118) (|:| |rlc| 118))
              |LODOF2;testlc;FLodo2UpFIR;17| (|SingleInteger|) (429 . |One|)
              (433 . +) (|Mapping| 38 38) (|Stream| 38) (439 . |stream|)
              (445 . -) (451 . *) (|Union| 38 '"failed") (457 . |retractIfCan|)
              (462 . =) (|Mapping| 116 17 38) (|StreamFunctions3| 17 38 116)
              (468 . |map|) (475 . |append|) (|List| 116) (481 . |coerce|)
              (486 . |monomial|) (492 . *)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (498 . |extendedEuclidean|) (504 . |One|) (508 . ~=)
              (514 . |rem|) (520 . -) (525 . |pi|) (529 . |pi|) (533 . |pi|)
              (537 . *) (543 . -) (548 . *)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 161 '"failed") (554 . |extendedEuclidean|)
              (|PositiveInteger|) (561 . *) (567 . -) (|OutputForm|)
              (573 . |coerce|) (|Void|) (578 . |print|)
              (|Record| (|:| |main| 110) (|:| |nf| 110) (|:| |error| 17))
              |LODOF2;testln;FLodo2UpFIR;20| (583 . |One|) (587 . +)
              (|Record| (|:| |lr| 171) (|:| |n_lifts| 164)) (|Mapping| 175 175)
              (|Stream| 175) (593 . |stream|) (|Mapping| 110 175)
              (|StreamFunctions2| 175 110) (599 . |map|)
              |LODOF2;testlw;FLodo2UpFIS;22| (605 . |extendedEuclidean|)
              (611 . |positiveRemainder|) (617 . |floor|)
              |LODOF2;testcp;LodoFILodo;24| (622 . |ceiling|)
              |LODOF2;testco;LodoFIB;26| |LODOF2;testcx;LodoFUp;28|
              (627 . |leadingCoefficient|) (632 . |coerce|) (637 . |reductum|)
              |LODOF2;testpd;UpLodo;30| (642 . |elt|)
              (|Record| (|:| |ope| 17) (|:| |dext| 164) (|:| |alpha| 11)
                        (|:| |rami| 8))
              (|Union| 17 195) (|List| 196) (648 . |value|) (653 . |coerce|)
              (658 . |retractIfCan|) (663 . ~=) (669 . ~=) (675 . |min|)
              (|Mapping| 38 38 38) (|List| 38) (681 . |reduce|) (687 . <=)
              (693 . |truncate|) (699 . -) (704 . *) (|Symbol|)
              (710 . |variable|) (715 . ^) (721 . -) (726 . *) (732 . +)
              (|Record| (|:| |op| 17) (|:| |ram| 8) (|:| |expart| 13))
              (|List| 217) (738 . |append|) (744 . =) (750 . |rightQuotient|)
              (756 . |append|) (|SparseUnivariatePolynomial| $)
              (762 . |zeroOf|) (767 . |coerce|) (772 . ^) (|Union| 218 197)
              |LODOF2;testfr;LodoMSU;32| (778 . |coerce|) (783 . |coerce|)
              (788 . ^) (|Union| 8 13) |LODOF2;testsb;ULodoLodo;34| (794 . =)
              (|Mapping| 11 38) (800 . |multiplyCoefficients|)
              (806 . |multiplyExponents|) (812 . ^) (818 . |coerce|) (823 . *)
              |LODOF2;testro;LodoEPiLodo;36| |LODOF2;testfo;LodoMSU;38|
              (|Vector| 13) (829 . |setelt!|) (836 . D) (840 . |apply|)
              (847 . *) (853 . /) (859 . /) (|Mapping| 13 13) (865 . |map!|)
              (871 . +) (|Mapping| 15 15) (|Stream| 15) (877 . |stream|)
              (883 . |elt|) (889 . *) (895 . ^) (|Mapping| 116 15)
              (|StreamFunctions2| 15 116) (901 . |map|) (|List| 243)
              (907 . |elt|) (|Union| 269 '"failed") (|Vector| 11)
              (|IntegerLinearDependence| 11) (913 . |particularSolutionOverQ|)
              (919 . =) (|Vector| 50) (925 . |elt|) (|Mapping| 11 11)
              (931 . |map|) (|List| 112) (937 . |elt|) (943 . |setelt!|)
              (|Matrix| 13) (950 . |matrix|) (955 . ~=) (961 . |One|) (965 . /)
              (971 . |One|) (975 . |One|) (|List| 61) (|Mapping| 61 17)
              (|ListFunctions2| 17 61) (979 . |map|) (985 . |elt|) (991 . ~=)
              (997 . /) |LODOF2;testsc;2LodoMB;42| (1003 . |retract|)
              (|Union| 294 '"failed") (1008 . ~=) (|List| 97) (1014 . |elt|)
              (1020 . |One|) (1024 . |monomial|) (1030 . *) (1036 . +)
              (1042 . |One|) (1046 . /) (1052 . /) (1058 . |adjoint|)
              (|LinearOrdinaryDifferentialOperator1| 25)
              (|LODOConvertions| 11 8 25) (1063 . |convert|) (1068 . |Zero|)
              (1072 . ~=) (1078 . |leadingCoefficient|) (1083 . |degree|)
              (|Union| 11 '"infinity") (1088 . =) (1094 . /) (1100 . D)
              (1104 . *) (1110 . -) (1115 . ^) (1121 . +) (1127 . |reductum|)
              (1132 . ~=) (1138 . |rightGcd|) (1144 . |rightQuotient|)
              (1150 . |coerce|) (1155 . *) (1161 . *) (1167 . |leftGcd|)
              (1173 . |leftQuotient|) (|List| 50) (1179 . |elt|) (1185 . *)
              (|Vector| 97) (1191 . |vector|) (|Matrix| 97) (|List| 331)
              (|List| 15) (|VectorHermitePadeSolver|) (1196 . |hp_solve|)
              (1203 . |column|) (1209 . |members|) (1214 . *) (1220 . |append|)
              (|List| 304) (1226 . |elt|) (|Mapping| 101 97 345) (|List| 11)
              |LODOF2;factor;LodoMLL;47| (1232 . |concat|) (1238 . |concat!|)
              (1244 . -) (1249 . |One|) (1253 . |coefficient|) (1259 . /)
              (1265 . |minimumDegree|) (|List| $) (1270 . |lcm|)
              |LODOF2;testis;LodoB;49| (1275 . ~=)
              (|Record| (|:| |point| 311) (|:| |lpf| 17) (|:| |dxt| 164))
              (|Record| (|:| |singularity| 358) (|:| |fos| 218)
                        (|:| |mge| 112))
              (|List| 359) |LODOF2;ge_minimal;LodoMSL;61| (1281 . |append|)
              (1287 . |setelt!|) (1294 . -) (1299 . *) (1305 . |min|)
              (|Character|) (1309 . |min|) (1315 . |min|)
              (|Mapping| 164 164 164) (|List| 164) (1321 . |reduce|)
              (1327 . |remove|) (|Record| (|:| |sing| 358) (|:| |arf| 197))
              (|List| 374) (1333 . |append|) (1339 . |elt|)
              (|Union| 342 '"failed") (1345 . ~=) (1351 . |adjoint|)
              |LODOF2;testfg;LodoML;51| (1356 . |convert|)
              |LODOF2;testlp;LodoULodo;54| (1361 . |Zero|) (1365 . ^)
              (1371 . *) (1377 . +) (|Kernel| $) (1383 . |minPoly|)
              (|Kernel| 11)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 390)
                                                     390 38
                                                     (|SparseMultivariatePolynomial|
                                                      38 390)
                                                     11)
              (1388 . |univariate|) |LODOF2;testgt;EKE;57| (1395 . |Zero|)
              (1399 . |monomial|) (1405 . +) (1411 . |rest|) (1417 . |rest|)
              (1423 . +) (|List| 388) (1429 . |kernels|) (1434 . |coerce|)
              (|Union| (|AlgebraicNumber|) '"failed") (1439 . |retractIfCan|)
              (1444 . |denominator|) (1449 . |eval|) (1456 . |degree|)
              (1461 . |retract|) (|Union| 50 '"-infinity") (1466 . =)
              (1472 . |max|) (|Record| (|:| |factor| 97) (|:| |exponent| 38))
              (|List| 412) (1478 . |factors|) (1483 . |rootOf|)
              (|Record| (|:| |ecs| 112) (|:| |ecr| 8) (|:| |ect| 25))
              (|List| 416) (1488 . |append|) |LODOF2;gen_exp;LodoUMLL;60|
              (|List| 8) (|CylindricalAlgebraicDecompositionUtilities| 11 8)
              (1494 . |squareFreeBasis|) (1499 . |append|) (|Mapping| 50 50 50)
              (1505 . |reduce|))
           '#(|testsc| 1511 |testsb| 1518 |testro| 1524 |testpd| 1531 |testnp|
              1536 |testlw| 1541 |testlp| 1551 |testln| 1557 |testll| 1567
              |testlc| 1577 |testis| 1587 |testgt| 1592 |testfr| 1598 |testfo|
              1605 |testfn| 1612 |testfg| 1619 |testf2| 1625 |testcx| 1632
              |testcp| 1638 |testco| 1645 |gen_exp| 1652 |ge_minimal| 1660
              |factor| 1667)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 425
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
                                                   3 71 8 0 38 8 72 1 8 15 0 73
                                                   2 8 11 0 15 74 2 11 0 0 0 75
                                                   1 11 0 38 76 2 11 0 0 0 77 1
                                                   78 23 11 79 2 11 23 0 0 80 1
                                                   78 38 11 81 1 8 0 38 82 3 8
                                                   0 0 0 0 83 2 8 0 0 0 84 2 8
                                                   23 0 0 85 2 38 23 0 0 86 2
                                                   71 8 0 38 87 2 8 0 0 0 88 2
                                                   65 0 0 0 89 2 65 38 64 0 90
                                                   2 65 64 0 38 91 2 92 0 0 0
                                                   93 1 8 97 0 98 1 8 0 97 99 2
                                                   102 66 100 101 103 1 50 0 38
                                                   104 2 50 0 38 0 105 2 50 0 0
                                                   0 106 2 50 0 0 0 107 2 8 0 0
                                                   0 108 2 50 23 0 0 109 2 112
                                                   13 0 38 113 2 118 117 0 38
                                                   119 1 13 0 117 120 2 112 0 0
                                                   0 121 2 125 122 123 124 126
                                                   1 50 38 0 127 0 130 0 131 2
                                                   38 0 0 0 132 2 134 0 133 38
                                                   135 2 38 0 0 0 136 2 38 0 38
                                                   0 137 1 50 138 0 139 2 138
                                                   23 0 0 140 3 142 117 141 122
                                                   134 143 2 118 0 0 0 144 1
                                                   117 0 145 146 2 13 0 11 38
                                                   147 2 17 0 0 13 148 2 8 149
                                                   0 0 150 0 8 0 151 2 8 23 0 0
                                                   152 2 8 0 0 0 153 1 8 0 0
                                                   154 0 11 0 155 0 13 0 156 0
                                                   9 0 157 2 17 0 13 0 158 1 17
                                                   0 0 159 2 17 0 0 0 160 3 8
                                                   162 0 0 0 163 2 38 0 164 0
                                                   165 2 17 0 0 0 166 1 17 167
                                                   0 168 1 167 169 0 170 0 164
                                                   0 173 2 164 0 0 0 174 2 177
                                                   0 176 175 178 2 180 124 179
                                                   177 181 2 38 149 0 0 183 2
                                                   38 0 0 0 184 1 50 38 0 185 1
                                                   50 38 0 187 1 8 11 0 190 1
                                                   13 0 11 191 1 8 0 0 192 2 61
                                                   60 0 38 194 1 197 196 0 198
                                                   1 17 0 13 199 1 8 138 0 200
                                                   2 138 23 0 0 201 2 38 23 0 0
                                                   202 2 38 0 0 0 203 2 205 38
                                                   204 0 206 2 15 23 0 0 207 2
                                                   13 0 0 38 208 1 13 0 0 209 2
                                                   13 0 11 0 210 1 13 211 0 212
                                                   2 13 0 0 38 213 1 11 0 0 214
                                                   2 11 0 38 0 215 2 13 0 0 0
                                                   216 2 218 0 0 0 219 2 17 23
                                                   0 0 220 2 17 0 0 0 221 2 197
                                                   0 0 0 222 1 11 0 223 224 1 8
                                                   0 11 225 2 11 0 0 38 226 1
                                                   25 0 8 229 1 21 0 25 230 2
                                                   17 0 0 15 231 2 11 23 0 0
                                                   234 2 13 0 235 0 236 2 13 0
                                                   0 164 237 2 50 0 0 38 238 1
                                                   11 0 50 239 2 17 0 15 0 240
                                                   3 243 13 0 38 13 244 0 17 0
                                                   245 3 17 13 0 13 13 246 2 13
                                                   0 0 0 247 2 13 0 0 11 248 2
                                                   13 0 0 0 249 2 243 0 250 0
                                                   251 2 15 0 0 0 252 2 254 0
                                                   253 15 255 2 243 13 0 38 256
                                                   2 15 0 15 0 257 2 11 0 0 15
                                                   258 2 260 117 259 254 261 2
                                                   262 243 0 38 263 2 266 264
                                                   265 11 267 2 264 23 0 0 268
                                                   2 269 50 0 38 270 2 13 0 271
                                                   0 272 2 273 112 0 38 274 3
                                                   112 13 0 38 13 275 1 276 0
                                                   273 277 2 13 23 0 0 278 0 17
                                                   0 279 2 17 0 0 13 280 0 50 0
                                                   281 0 9 0 282 2 285 283 284
                                                   92 286 2 283 61 0 38 287 2
                                                   61 23 0 0 288 2 8 0 0 11 289
                                                   1 13 9 0 291 2 292 23 0 0
                                                   293 2 294 97 0 38 295 0 25 0
                                                   296 2 21 0 25 15 297 2 21 0
                                                   25 0 298 2 21 0 0 0 299 0 21
                                                   0 300 2 21 0 0 25 301 2 25 0
                                                   0 0 302 1 21 0 0 303 1 305
                                                   304 21 306 0 304 0 307 2 304
                                                   23 0 0 308 1 304 25 0 309 1
                                                   304 15 0 310 2 311 23 0 0
                                                   312 2 25 0 8 8 313 0 304 0
                                                   314 2 304 0 25 0 315 1 304 0
                                                   0 316 2 304 0 0 15 317 2 304
                                                   0 0 0 318 1 304 0 0 319 2 95
                                                   23 0 0 320 2 304 0 0 0 321 2
                                                   304 0 0 0 322 1 304 0 25 323
                                                   2 304 0 0 25 324 2 304 0 0 0
                                                   325 2 304 0 0 0 326 2 304 0
                                                   0 0 327 2 328 50 0 38 329 2
                                                   130 0 38 0 330 1 331 0 294
                                                   332 3 336 333 334 335 15 337
                                                   2 333 331 0 38 338 1 331 294
                                                   0 339 2 50 0 0 38 340 2 273
                                                   0 0 0 341 2 342 304 0 38 343
                                                   2 342 0 0 0 347 2 342 0 0 0
                                                   348 1 25 0 0 349 0 304 0 350
                                                   2 304 25 0 15 351 2 304 0 0
                                                   25 352 1 304 15 0 353 1 8 0
                                                   354 355 2 25 23 0 0 357 2
                                                   328 0 0 0 362 3 328 50 0 38
                                                   50 363 1 50 0 0 364 2 50 0
                                                   15 0 365 0 130 0 366 2 367 0
                                                   0 0 368 2 164 0 0 0 369 2
                                                   371 164 370 0 372 2 360 0
                                                   359 0 373 2 375 0 0 0 376 2
                                                   197 196 0 38 377 2 378 23 0
                                                   0 379 1 17 0 0 380 1 305 21
                                                   304 382 0 25 0 384 2 25 0 0
                                                   15 385 2 25 0 8 0 386 2 25 0
                                                   0 0 387 1 11 223 388 389 3
                                                   391 97 11 390 97 392 0 97 0
                                                   394 2 97 0 11 15 395 2 97 0
                                                   0 0 396 2 112 0 0 15 397 2
                                                   218 0 0 15 398 2 11 0 0 0
                                                   399 1 11 400 0 401 1 11 0
                                                   388 402 1 11 403 0 404 1 11
                                                   0 0 405 3 11 0 0 388 0 406 1
                                                   97 15 0 407 1 11 50 0 408 2
                                                   409 23 0 0 410 2 50 0 0 0
                                                   411 1 101 413 0 414 1 11 0
                                                   223 415 2 417 0 0 0 418 1
                                                   421 420 420 422 2 65 0 0 0
                                                   423 2 328 50 424 0 425 3 0
                                                   23 21 21 94 290 2 0 17 232
                                                   21 233 3 0 17 21 11 164 241
                                                   1 0 17 8 193 1 0 61 21 63 6
                                                   0 124 50 21 8 8 50 38 182 2
                                                   0 17 304 311 383 6 0 171 50
                                                   21 8 8 50 38 172 6 0 114 50
                                                   21 8 8 50 38 115 6 0 128 50
                                                   21 8 8 50 38 129 1 0 23 304
                                                   356 2 0 11 11 390 393 3 0
                                                   227 21 94 95 228 3 0 227 21
                                                   94 95 242 3 0 92 21 94 95 96
                                                   2 0 342 304 94 381 3 0 110
                                                   21 8 50 111 2 0 8 21 50 189
                                                   3 0 17 21 50 38 186 3 0 23
                                                   21 50 38 188 4 0 417 304 311
                                                   344 345 419 3 0 360 304 94
                                                   95 361 3 0 342 304 344 345
                                                   346)))))
           '|lookupComplete|)) 
