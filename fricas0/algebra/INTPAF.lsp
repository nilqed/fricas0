
(SDEFUN |INTPAF;UPUP2F1|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|t| |Fraction| (|SparseUnivariatePolynomial| F))
         (|cf| |Fraction| (|SparseUnivariatePolynomial| F)) (|kx| |Kernel| F)
         (|k| |Kernel| F) ($ F))
        (|INTPAF;UPUP2F0| (SPADCALL |p| |t| |cf| (QREFELT $ 19)) |kx| |k| $)) 

(SDEFUN |INTPAF;UPUP2F0|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|kx| |Kernel| F) (|k| |Kernel| F) ($ F))
        (SPADCALL |p| |kx| (SPADCALL |k| (QREFELT $ 21)) (QREFELT $ 23))) 

(SDEFUN |INTPAF;chv|
        ((|f| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|n| |NonNegativeInteger|) (|a| F) (|b| F)
         ($ |Fraction| (|SparseUnivariatePolynomial| F)))
        (SPADCALL (|INTPAF;chv0| |f| |n| |a| |b| $) (QREFELT $ 14)
                  (QREFELT $ 25))) 

(SDEFUN |INTPAF;RF2UPUP|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F))
         (|modulus| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|bc|
           (|Record|
            (|:| |coef1|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |coef2|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (#1=#:G788 NIL))
         (SEQ
          (LETT |bc|
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (CONS #'|INTPAF;RF2UPUP!0| $)
                                     (SPADCALL |f| (QREFELT $ 29))
                                     (QREFELT $ 32))
                           |modulus| (|spadConstant| $ 34) (QREFELT $ 37))
                          . #2=(|INTPAF;RF2UPUP|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record|
                                   (|:| |coef1|
                                        (|SparseUnivariatePolynomial|
                                         (|Fraction|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7)))))
                                   (|:| |coef2|
                                        (|SparseUnivariatePolynomial|
                                         (|Fraction|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))))))
                                  (|Union|
                                   (|Record|
                                    (|:| |coef1|
                                         (|SparseUnivariatePolynomial|
                                          (|Fraction|
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 7)))))
                                    (|:| |coef2|
                                         (|SparseUnivariatePolynomial|
                                          (|Fraction|
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 7))))))
                                   "failed")
                                  #1#))
                . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (CONS #'|INTPAF;RF2UPUP!1| $)
                       (SPADCALL |f| (QREFELT $ 38)) (QREFELT $ 32))
             (QCAR |bc|) (QREFELT $ 39))
            |modulus| (QREFELT $ 40)))))) 

(SDEFUN |INTPAF;RF2UPUP!1| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 27)) (QREFELT $ 28))) 

(SDEFUN |INTPAF;RF2UPUP!0| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 27)) (QREFELT $ 28))) 

(SDEFUN |INTPAF;split_power|
        ((|p1| |SparseUnivariatePolynomial| F) (|deg_p| |NonNegativeInteger|)
         ($ |Record| (|:| |pfac| (|SparseUnivariatePolynomial| F))
          (|:| |cofactor| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|p_fac| #1=(|SparseUnivariatePolynomial| F)) (#2=#:G841 NIL)
          (|e2| #3=(|Integer|)) (|e3| #4=(|Integer|)) (|cofac| #1#)
          (|#G22| (|Record| (|:| |quotient| #3#) (|:| |remainder| #4#)))
          (|f1| #5=(|SparseUnivariatePolynomial| F)) (|e1| #6=(|Integer|))
          (#7=#:G846 NIL) (|fac| NIL)
          (|facl| (|List| (|Record| (|:| |factor| #5#) (|:| |exponent| #6#))))
          (|fc0| (|Factored| (|SparseUnivariatePolynomial| F))))
         (SEQ
          (LETT |fc0| (SPADCALL |p1| (QREFELT $ 42))
                . #8=(|INTPAF;split_power|))
          (LETT |facl| (SPADCALL |fc0| (QREFELT $ 46)) . #8#)
          (LETT |p_fac| (|spadConstant| $ 47) . #8#)
          (LETT |cofac| (|spadConstant| $ 47) . #8#)
          (SEQ (LETT |fac| NIL . #8#) (LETT #7# |facl| . #8#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |fac| (CAR #7#) . #8#) NIL))
                 (GO G191)))
               (SEQ (LETT |e1| (QCDR |fac|) . #8#)
                    (LETT |f1| (QCAR |fac|) . #8#)
                    (PROGN
                     (LETT |#G22| (DIVIDE2 |e1| |deg_p|) . #8#)
                     (LETT |e2| (QCAR |#G22|) . #8#)
                     (LETT |e3| (QCDR |#G22|) . #8#)
                     |#G22|)
                    (COND
                     ((EQL |e3| (- |deg_p| 1))
                      (SEQ
                       (LETT |cofac| (SPADCALL |f1| |cofac| (QREFELT $ 49))
                             . #8#)
                       (LETT |e3| 0 . #8#)
                       (EXIT (LETT |e2| (+ |e2| 1) . #8#)))))
                    (EXIT
                     (LETT |p_fac|
                           (SPADCALL
                            (SPADCALL |f1|
                                      (PROG1 (LETT #2# |e2| . #8#)
                                        (|check_subtype2| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#))
                                      (QREFELT $ 51))
                            |p_fac| (QREFELT $ 49))
                           . #8#)))
               (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |p_fac| |cofac|))))) 

(SDEFUN |INTPAF;linearInXIfCan|
        ((|x| |Kernel| F) (|y| |Kernel| F)
         ($ |Union|
          (|Record| (|:| |xsub| F)
                    (|:| |dxsub| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |ycoeff| F))
          "failed"))
        (SPROG
         ((|xx| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|p|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|b| #1=(|SparseUnivariatePolynomial| F)) (|a| #1#)
          (|d| #2=(|NonNegativeInteger|)) (#3=#:G876 NIL)
          (|q| #4=(|SparseUnivariatePolynomial| F))
          (|y_coeff| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|ppow| (|SparseUnivariatePolynomial| F))
          (|np1|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|ui| (|Union| (|SparseUnivariatePolynomial| F) "failed")) (|ci| #4#)
          (|i| NIL) (|cofac| (|SparseUnivariatePolynomial| F))
          (|p_fac| (|SparseUnivariatePolynomial| F))
          (|#G27|
           #5=(|Record| (|:| |pfac| (|SparseUnivariatePolynomial| F))
                        (|:| |cofactor| (|SparseUnivariatePolynomial| F))))
          (|c0| #4#) (#6=#:G877 NIL) (|#G25| #5#) (|deg_p| #2#) (|lc| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |p|
                  (SPADCALL
                   (SPADCALL (SPADCALL |y| (QREFELT $ 53)) |x| (QREFELT $ 54))
                   (QREFELT $ 56))
                  . #7=(|INTPAF;linearInXIfCan|))
            (LETT |lc| (SPADCALL (SPADCALL |p| (QREFELT $ 57)) (QREFELT $ 38))
                  . #7#)
            (LETT |deg_p| (SPADCALL |p| (QREFELT $ 58)) . #7#)
            (LETT |y_coeff| (|spadConstant| $ 59) . #7#)
            (COND
             ((SPADCALL (SPADCALL |lc| (QREFELT $ 60)) 1 (QREFELT $ 62))
              (SEQ
               (PROGN
                (LETT |#G25| (|INTPAF;split_power| |lc| |deg_p| $) . #7#)
                (LETT |p_fac| (QCAR |#G25|) . #7#)
                (LETT |cofac| (QCDR |#G25|) . #7#)
                |#G25|)
               (EXIT
                (COND
                 ((SPADCALL (SPADCALL |cofac| (QREFELT $ 60)) 1 (QREFELT $ 62))
                  (PROGN (LETT #3# (CONS 1 "failed") . #7#) (GO #8=#:G875)))
                 (#9='T
                  (SEQ
                   (LETT |p|
                         (SPADCALL (SPADCALL |cofac| (QREFELT $ 28)) |p|
                                   (QREFELT $ 63))
                         . #7#)
                   (LETT |np1| (|spadConstant| $ 64) . #7#)
                   (LETT |ppow| (|spadConstant| $ 47) . #7#)
                   (SEQ (LETT |i| 0 . #7#) (LETT #6# |deg_p| . #7#) G190
                        (COND ((|greater_SI| |i| #6#) (GO G191)))
                        (SEQ
                         (LETT |ci|
                               (SPADCALL (SPADCALL |p| |i| (QREFELT $ 65))
                                         (QREFELT $ 38))
                               . #7#)
                         (LETT |ui| (SPADCALL |ci| |ppow| (QREFELT $ 67))
                               . #7#)
                         (EXIT
                          (COND
                           ((QEQCAR |ui| 1)
                            (PROGN
                             (LETT #3# (CONS 1 "failed") . #7#)
                             (GO #8#)))
                           ('T
                            (SEQ
                             (LETT |np1|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QCDR |ui|) (QREFELT $ 28)) |i|
                                     (QREFELT $ 68))
                                    |np1| (QREFELT $ 69))
                                   . #7#)
                             (EXIT
                              (LETT |ppow|
                                    (SPADCALL |p_fac| |ppow| (QREFELT $ 49))
                                    . #7#)))))))
                        (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |p| |np1| . #7#)
                   (LETT |y_coeff|
                         (SPADCALL |y_coeff| (SPADCALL |p_fac| (QREFELT $ 28))
                                   (QREFELT $ 70))
                         . #7#)
                   (EXIT
                    (COND
                     ((SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |p| (QREFELT $ 57)) (QREFELT $ 38))
                        (QREFELT $ 60))
                       1 (QREFELT $ 62))
                      (PROGN
                       (LETT #3# (CONS 1 "failed") . #7#)
                       (GO #8#))))))))))))
            (LETT |c0|
                  (SPADCALL (SPADCALL |p| 0 (QREFELT $ 65)) (QREFELT $ 38))
                  . #7#)
            (COND
             ((SPADCALL (SPADCALL |c0| (QREFELT $ 60)) 1 (QREFELT $ 62))
              (SEQ
               (PROGN
                (LETT |#G27| (|INTPAF;split_power| |c0| |deg_p| $) . #7#)
                (LETT |p_fac| (QCAR |#G27|) . #7#)
                (LETT |cofac| (QCDR |#G27|) . #7#)
                |#G27|)
               (EXIT
                (COND
                 ((SPADCALL (SPADCALL |cofac| (QREFELT $ 60)) 1 (QREFELT $ 62))
                  (PROGN (LETT #3# (CONS 1 "failed") . #7#) (GO #8#)))
                 (#9#
                  (SEQ
                   (LETT |p|
                         (SPADCALL (SPADCALL |cofac| (QREFELT $ 28)) |p|
                                   (QREFELT $ 63))
                         . #7#)
                   (EXIT
                    (COND
                     ((SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |p| (QREFELT $ 57)) (QREFELT $ 38))
                        (QREFELT $ 60))
                       1 (QREFELT $ 62))
                      (PROGN (LETT #3# (CONS 1 "failed") . #7#) (GO #8#)))
                     (#9#
                      (SEQ (LETT |np1| (|spadConstant| $ 64) . #7#)
                           (LETT |ppow| (|spadConstant| $ 47) . #7#)
                           (SEQ (LETT |i| |deg_p| . #7#) G190
                                (COND ((< |i| 0) (GO G191)))
                                (SEQ
                                 (COND
                                  ((EQL |i| (SPADCALL |p| (QREFELT $ 58)))
                                   (SEQ
                                    (LETT |ci|
                                          (SPADCALL
                                           (SPADCALL |p| (QREFELT $ 57))
                                           (QREFELT $ 38))
                                          . #7#)
                                    (LETT |ui|
                                          (SPADCALL |ci| |ppow| (QREFELT $ 67))
                                          . #7#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |ui| 1)
                                       (PROGN
                                        (LETT #3# (CONS 1 "failed") . #7#)
                                        (GO #8#)))
                                      ('T
                                       (SEQ
                                        (LETT |np1|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (QCDR |ui|)
                                                          (QREFELT $ 28))
                                                |i| (QREFELT $ 68))
                                               |np1| (QREFELT $ 69))
                                              . #7#)
                                        (EXIT
                                         (LETT |p|
                                               (SPADCALL |p| (QREFELT $ 73))
                                               . #7#)))))))))
                                 (EXIT
                                  (LETT |ppow|
                                        (SPADCALL |p_fac| |ppow|
                                                  (QREFELT $ 49))
                                        . #7#)))
                                (LETT |i| (+ |i| -1) . #7#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |p| |np1| . #7#)
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| 0 (QREFELT $ 65))
                                          (QREFELT $ 38))
                                (QREFELT $ 60))
                               1 (QREFELT $ 62))
                              (PROGN
                               (LETT #3# (CONS 1 "failed") . #7#)
                               (GO #8#)))
                             (#9#
                              (LETT |y_coeff|
                                    (SPADCALL |p_fac| |y_coeff| (QREFELT $ 74))
                                    . #7#)))))))))))))))
            (LETT |a| (LETT |b| (|spadConstant| $ 75) . #7#) . #7#)
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |p| (|spadConstant| $ 64) (QREFELT $ 76)))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL
                       (LETT |q|
                             (SPADCALL (SPADCALL |p| (QREFELT $ 57))
                                       (QREFELT $ 38))
                             . #7#)
                       (QREFELT $ 60))
                      1 (QREFELT $ 62))
                     (PROGN (LETT #3# (CONS 1 "failed") . #7#) (GO #8#)))
                    ('T
                     (SEQ
                      (LETT |a|
                            (SPADCALL |a|
                                      (SPADCALL (SPADCALL |q| 1 (QREFELT $ 77))
                                                (LETT |d|
                                                      (SPADCALL |p|
                                                                (QREFELT $ 58))
                                                      . #7#)
                                                (QREFELT $ 78))
                                      (QREFELT $ 79))
                            . #7#)
                      (LETT |b|
                            (SPADCALL |b|
                                      (SPADCALL (SPADCALL |q| 0 (QREFELT $ 77))
                                                |d| (QREFELT $ 78))
                                      (QREFELT $ 80))
                            . #7#)
                      (EXIT
                       (LETT |p| (SPADCALL |p| (QREFELT $ 73)) . #7#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              ((SPADCALL |a| (|spadConstant| $ 75) (QREFELT $ 81))
               (CONS 1 "failed"))
              (#9#
               (SEQ (LETT |xx| (SPADCALL |b| |a| (QREFELT $ 82)) . #7#)
                    (EXIT
                     (CONS 0
                           (VECTOR
                            (SPADCALL |xx|
                                      (SPADCALL (QREFELT $ 15) (QREFELT $ 21))
                                      (QREFELT $ 84))
                            (SPADCALL |xx| (ELT $ 85) (QREFELT $ 87))
                            (SPADCALL |y_coeff| (SPADCALL |x| (QREFELT $ 21))
                                      (QREFELT $ 84)))))))))))
          #8# (EXIT #3#)))) 

(SDEFUN |INTPAF;prootintegrate|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((#1=#:G886 NIL)
          (|r|
           (|Union| (|Fraction| (|SparseUnivariatePolynomial| F)) "failed"))
          (|rf|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|ff|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |modulus|
                  (SPADCALL
                   (LETT |p| (SPADCALL |y| (QREFELT $ 53))
                         . #2=(|INTPAF;prootintegrate|))
                   |x| (QREFELT $ 54))
                  . #2#)
            (LETT |rf|
                  (SPADCALL
                   (LETT |ff| (SPADCALL |f| |x| |y| |p| (QREFELT $ 88)) . #2#)
                   (QREFELT $ 73))
                  . #2#)
            (SEQ (LETT |r| (SPADCALL |rf| (QREFELT $ 90)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |r| 0)
                    (COND
                     ((SPADCALL |rf| (|spadConstant| $ 64) (QREFELT $ 76))
                      (PROGN
                       (LETT #1#
                             (SPADCALL
                              (SPADCALL
                               (CONS #'|INTPAF;prootintegrate!0|
                                     (VECTOR $ |x|))
                               (SPADCALL (QCDR |r|) (QREFELT $ 93))
                               (QREFELT $ 97))
                              (|INTPAF;prootintegrate1|
                               (SPADCALL |ff| (QREFELT $ 98)) |x| |y| |modulus|
                               $)
                              (QREFELT $ 99))
                             . #2#)
                       (GO #3=#:G884))))))))
            (EXIT (|INTPAF;prootintegrate1| |ff| |x| |y| |modulus| $))))
          #3# (EXIT #1#)))) 

(SDEFUN |INTPAF;prootintegrate!0| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAF;prootintegrate|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |f1| (SPADCALL |x| (QREFELT $ 21)) (QREFELT $ 84)))))) 

(SDEFUN |INTPAF;prootintegrate1|
        ((|ff| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|x| |Kernel| F) (|y| |Kernel| F)
         (|modulus| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ |IntegrationResult| F))
        (SPROG
         ((|dcv| (F))
          (|curve|
           (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial| F)))))
          (#1=#:G915 NIL)
          (|m|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|u|
           (|Union|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|qprime| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|q| (|SparseUnivariatePolynomial| F))
          (|r|
           (|Record|
            (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (#2=#:G890 NIL)
          (|cv|
           (|Record|
            (|:| |func|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |poly|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |c1| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |c2| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (|vz| (F)) (|vu| (F)) (|newf| (F)) (|ku| (|Kernel| F))
          (|kz| (|Kernel| F)) (|newalg| (F))
          (|chv|
           (|Record|
            (|:| |int|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |left| (|SparseUnivariatePolynomial| F))
            (|:| |right| (|SparseUnivariatePolynomial| F))
            (|:| |den| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (|uu|
           (|Union|
            (|Record|
             (|:| |int|
                  (|SparseUnivariatePolynomial|
                   (|Fraction| (|SparseUnivariatePolynomial| F))))
             (|:| |left| (|SparseUnivariatePolynomial| F))
             (|:| |right| (|SparseUnivariatePolynomial| F))
             (|:| |den| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |deg| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (LETT |r|
                (PROG2
                    (LETT #2# (SPADCALL |modulus| (QREFELT $ 102))
                          . #3=(|INTPAF;prootintegrate1|))
                    (QCDR #2#)
                  (|check_union2| (QEQCAR #2# 0)
                                  (|Record|
                                   (|:| |radicand|
                                        (|Fraction|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 7))))
                                   (|:| |deg| (|NonNegativeInteger|)))
                                  (|Union|
                                   (|Record|
                                    (|:| |radicand|
                                         (|Fraction|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))))
                                    (|:| |deg| (|NonNegativeInteger|)))
                                   #4="failed")
                                  #2#))
                . #3#)
          (LETT |uu| (|INTPAF;changeVarIfCan| |ff| (QCAR |r|) (QCDR |r|) $)
                . #3#)
          (EXIT
           (COND
            ((QEQCAR |uu| 0)
             (SEQ (LETT |chv| (QCDR |uu|) . #3#)
                  (LETT |newalg|
                        (SPADCALL
                         (SPADCALL (QVELT |chv| 1)
                                   (SPADCALL (QREFELT $ 14) (QREFELT $ 21))
                                   (QREFELT $ 103))
                         (QVELT |chv| 4) (QREFELT $ 105))
                        . #3#)
                  (LETT |kz|
                        (SPADCALL (SPADCALL |newalg| (QREFELT $ 107))
                                  (QREFELT $ 109))
                        . #3#)
                  (LETT |newf|
                        (SPADCALL (QVELT |chv| 0)
                                  (LETT |ku| (QREFELT $ 14) . #3#) |newalg|
                                  (QREFELT $ 23))
                        . #3#)
                  (LETT |vu|
                        (SPADCALL (QVELT |chv| 2) (SPADCALL |x| (QREFELT $ 21))
                                  (QREFELT $ 103))
                        . #3#)
                  (LETT |vz|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QVELT |chv| 3)
                                    (SPADCALL |x| (QREFELT $ 21))
                                    (QREFELT $ 84))
                          (SPADCALL |y| (QREFELT $ 21)) (QREFELT $ 110))
                         (SPADCALL (SPADCALL |newalg| (QREFELT $ 111))
                                   (QREFELT $ 112))
                         (QREFELT $ 110))
                        . #3#)
                  (EXIT
                   (SPADCALL
                    (CONS #'|INTPAF;prootintegrate1!0|
                          (VECTOR $ |vz| |vu| |kz| |ku|))
                    (SPADCALL |newf| |ku| |kz| (QREFELT $ 116))
                    (QREFELT $ 119)))))
            ('T
             (SEQ
              (EXIT
               (SEQ (LETT |cv| (SPADCALL |ff| |modulus| (QREFELT $ 121)) . #3#)
                    (LETT |r|
                          (PROG2
                              (LETT #2#
                                    (SPADCALL (QVELT |cv| 1) (QREFELT $ 102))
                                    . #3#)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0)
                                            (|Record|
                                             (|:| |radicand|
                                                  (|Fraction|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 7))))
                                             (|:| |deg|
                                                  (|NonNegativeInteger|)))
                                            (|Union|
                                             (|Record|
                                              (|:| |radicand|
                                                   (|Fraction|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7))))
                                              (|:| |deg|
                                                   (|NonNegativeInteger|)))
                                             #4#)
                                            #2#))
                          . #3#)
                    (LETT |qprime|
                          (SPADCALL
                           (SPADCALL
                            (LETT |q| (SPADCALL (QCAR |r|) (QREFELT $ 122))
                                  . #3#)
                            (QREFELT $ 85))
                           (QREFELT $ 28))
                          . #3#)
                    (COND
                     ((NULL (SPADCALL |qprime| (QREFELT $ 123)))
                      (SEQ
                       (LETT |u|
                             (|INTPAF;chvarIfCan| (QVELT |cv| 0)
                              (|spadConstant| $ 59) |q|
                              (SPADCALL |qprime| (QREFELT $ 124)) $)
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |u| 0)
                          (PROGN
                           (LETT #1#
                                 (SEQ
                                  (LETT |m|
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 59)
                                                   (QCDR |r|) (QREFELT $ 68))
                                         (SPADCALL
                                          (SPADCALL |q| (QREFELT $ 28))
                                          (QREFELT $ 125))
                                         (QREFELT $ 126))
                                        . #3#)
                                  (EXIT
                                   (SPADCALL
                                    (CONS #'|INTPAF;prootintegrate1!1|
                                          (VECTOR |y| |x| |cv| $ |m|))
                                    (|INTPAF;rationalInt| (QCDR |u|) (QCDR |r|)
                                     (SPADCALL (|spadConstant| $ 48) 1
                                               (QREFELT $ 78))
                                     $)
                                    (QREFELT $ 97))))
                                 . #3#)
                           (GO #5=#:G912))))))))
                    (LETT |curve|
                          (|RadicalFunctionField| (QREFELT $ 7)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))
                                                  (|SparseUnivariatePolynomial|
                                                   (|Fraction|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7))))
                                                  (SPADCALL |q| (QREFELT $ 28))
                                                  (QCDR |r|))
                          . #3#)
                    (LETT |dcv|
                          (SPADCALL (SPADCALL (QVELT |cv| 2) (QREFELT $ 127))
                                    |x| (QREFELT $ 129))
                          . #3#)
                    (EXIT
                     (|INTPAF;algaddx|
                      (SPADCALL
                       (CONS #'|INTPAF;prootintegrate1!2|
                             (VECTOR |y| |x| |cv| |curve| $))
                       (SPADCALL
                        (SPADCALL (QVELT |cv| 0)
                                  (|compiledLookupCheck| '|reduce|
                                                         (LIST '$
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (LIST
                                                                 '|Fraction|
                                                                 (LIST
                                                                  '|SparseUnivariatePolynomial|
                                                                  (|devaluate|
                                                                   (ELT $
                                                                        7))))))
                                                         |curve|))
                        (ELT $ 85)
                        (|compiledLookupCheck| '|palgintegrate|
                                               (LIST
                                                (LIST '|IntegrationResult|
                                                      (|devaluate| |curve|))
                                                (|devaluate| |curve|)
                                                (LIST '|Mapping|
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate| (ELT $ 7)))
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate|
                                                        (ELT $ 7)))))
                                               (|AlgebraicIntegrate| (ELT $ 6)
                                                                     (ELT $ 7)
                                                                     (|SparseUnivariatePolynomial|
                                                                      (ELT $
                                                                           7))
                                                                     (|SparseUnivariatePolynomial|
                                                                      (|Fraction|
                                                                       (|SparseUnivariatePolynomial|
                                                                        (ELT $
                                                                             7))))
                                                                     |curve|)))
                       (|compiledLookupCheck| '|map|
                                              (LIST
                                               (LIST '|IntegrationResult|
                                                     (|devaluate| (ELT $ 7)))
                                               (LIST '|Mapping|
                                                     (|devaluate| (ELT $ 7))
                                                     (|devaluate| |curve|))
                                               (LIST '|IntegrationResult|
                                                     (|devaluate| |curve|)))
                                              (|IntegrationResultFunctions2|
                                               |curve| (ELT $ 7))))
                      |dcv| (SPADCALL |x| (QREFELT $ 21)) $))))
              #5# (EXIT #1#)))))))) 

(SDEFUN |INTPAF;prootintegrate1!2| ((|x1| NIL) ($$ NIL))
        (PROG ($ |curve| |cv| |x| |y|)
          (LETT $ (QREFELT $$ 4) . #1=(|INTPAF;prootintegrate1|))
          (LETT |curve| (QREFELT $$ 3) . #1#)
          (LETT |cv| (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|INTPAF;UPUP2F1|
             (SPADCALL |x1|
                       (|compiledLookupCheck| '|lift|
                                              (LIST
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (LIST '|Fraction|
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate|
                                                        (ELT $ 7)))))
                                               '$)
                                              |curve|))
             (QVELT |cv| 2) (QVELT |cv| 3) |x| |y| $))))) 

(SDEFUN |INTPAF;prootintegrate1!1| ((|x1| NIL) ($$ NIL))
        (PROG (|m| $ |cv| |x| |y|)
          (LETT |m| (QREFELT $$ 4) . #1=(|INTPAF;prootintegrate1|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |cv| (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|INTPAF;UPUP2F1| (|INTPAF;RF2UPUP| |x1| |m| $) (QVELT |cv| 2)
             (QVELT |cv| 3) |x| |y| $))))) 

(SDEFUN |INTPAF;prootintegrate1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|ku| |kz| |vu| |vz| $)
          (LETT |ku| (QREFELT $$ 4) . #1=(|INTPAF;prootintegrate1|))
          (LETT |kz| (QREFELT $$ 3) . #1#)
          (LETT |vu| (QREFELT $$ 2) . #1#)
          (LETT |vz| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (LIST |ku| |kz|) (LIST |vu| |vz|)
                      (QREFELT $ 115)))))) 

(SDEFUN |INTPAF;rationalInt|
        ((|f| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|n| |NonNegativeInteger|) (|g| |SparseUnivariatePolynomial| F)
         ($ |IntegrationResult| (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG ((#1=#:G924 NIL) (|a| (F)))
               (SEQ
                (COND
                 ((NULL (EQL (SPADCALL |g| (QREFELT $ 60)) 1))
                  (|error| "rationalInt: radicand must be linear"))
                 ('T
                  (SEQ
                   (LETT |a| (SPADCALL |g| (QREFELT $ 130))
                         . #2=(|INTPAF;rationalInt|))
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |n|
                                (SPADCALL (SPADCALL |a| (QREFELT $ 131))
                                          (PROG1 (LETT #1# (- |n| 1) . #2#)
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))
                                          (QREFELT $ 78))
                                (QREFELT $ 132))
                      (|INTPAF;chv| |f| |n| |a|
                       (SPADCALL (SPADCALL |g| (QREFELT $ 133))
                                 (QREFELT $ 130))
                       $)
                      (QREFELT $ 74))
                     (QREFELT $ 93))))))))) 

(SDEFUN |INTPAF;chv0|
        ((|f| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|n| |NonNegativeInteger|) (|a| F) (|b| F) ($ F))
        (SPROG ((|d| (F)))
               (SEQ
                (LETT |d| (SPADCALL (QREFELT $ 14) (QREFELT $ 21))
                      |INTPAF;chv0|)
                (EXIT
                 (SPADCALL
                  (SPADCALL |f|
                            (SPADCALL (SPADCALL |d| (QREFELT $ 27))
                                      (QREFELT $ 28))
                            (QREFELT $ 134))
                  (SPADCALL
                   (SPADCALL (SPADCALL |d| |n| (QREFELT $ 135)) |b|
                             (QREFELT $ 136))
                   |a| (QREFELT $ 137))
                  (QREFELT $ 84)))))) 

(SDEFUN |INTPAF;candidates|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |List|
          (|Record| (|:| |left| (|SparseUnivariatePolynomial| F))
                    (|:| |right| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |left| (|SparseUnivariatePolynomial| F))
                      (|:| |right| (|SparseUnivariatePolynomial| F)))))
          (|u| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|xi| (|SparseUnivariatePolynomial| F)) (#1=#:G938 NIL) (|i| NIL))
         (SEQ (LETT |l| NIL . #2=(|INTPAF;candidates|))
              (EXIT
               (COND ((SPADCALL |p| (QREFELT $ 138)) |l|)
                     ('T
                      (SEQ
                       (SEQ (LETT |i| 2 . #2#)
                            (LETT #1# (SPADCALL |p| (QREFELT $ 60)) . #2#) G190
                            (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (LETT |u|
                                   (SPADCALL |p|
                                             (LETT |xi|
                                                   (SPADCALL
                                                    (|spadConstant| $ 48) |i|
                                                    (QREFELT $ 78))
                                                   . #2#)
                                             (QREFELT $ 139))
                                   . #2#)
                             (EXIT
                              (COND
                               ((QEQCAR |u| 0)
                                (LETT |l| (CONS (CONS (QCDR |u|) |xi|) |l|)
                                      . #2#)))))
                            (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (CONS
                         (CONS
                          (SPADCALL (|spadConstant| $ 48) 1 (QREFELT $ 78))
                          |p|)
                         |l|))))))))) 

(SDEFUN |INTPAF;changeVarIfCan|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|radi| |Fraction| (|SparseUnivariatePolynomial| F))
         (|n| |NonNegativeInteger|)
         ($ |Union|
          (|Record|
           (|:| |int|
                (|SparseUnivariatePolynomial|
                 (|Fraction| (|SparseUnivariatePolynomial| F))))
           (|:| |left| (|SparseUnivariatePolynomial| F))
           (|:| |right| (|SparseUnivariatePolynomial| F))
           (|:| |den| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |deg| (|NonNegativeInteger|)))
          "failed"))
        (SPROG
         ((#1=#:G952 NIL) (#2=#:G953 NIL)
          (|u|
           (|Union|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (#3=#:G954 NIL) (|cnd| NIL)
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rec| (SPADCALL |radi| |n| (QREFELT $ 141))
                  . #4=(|INTPAF;changeVarIfCan|))
            (SEQ
             (EXIT
              (SEQ (LETT |cnd| NIL . #4#)
                   (LETT #3# (|INTPAF;candidates| (QVELT |rec| 2) $) . #4#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |cnd| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |u|
                          (|INTPAF;chvarIfCan| |p| (QVELT |rec| 1) (QCDR |cnd|)
                           (SPADCALL
                            (SPADCALL (SPADCALL (QCDR |cnd|) (QREFELT $ 85))
                                      (QREFELT $ 28))
                            (QREFELT $ 124))
                           $)
                          . #4#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2#
                                     (CONS 0
                                           (VECTOR (QCDR |u|) (QCAR |cnd|)
                                                   (QCDR |cnd|) (QVELT |rec| 1)
                                                   (QVELT |rec| 0)))
                                     . #4#)
                               (GO #5=#:G951))
                              . #4#)
                        (GO #6=#:G949))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
             #6# (EXIT #1#))
            (EXIT (CONS 1 "failed"))))
          #5# (EXIT #2#)))) 

(SDEFUN |INTPAF;chvarIfCan|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|d| |Fraction| (|SparseUnivariatePolynomial| F))
         (|u| |SparseUnivariatePolynomial| F)
         (|u1| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Union|
          (|SparseUnivariatePolynomial|
           (|Fraction| (|SparseUnivariatePolynomial| F)))
          "failed"))
        (SPROG
         ((|ans|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#1=#:G966 NIL)
          (|v|
           (|Union| (|Fraction| (|SparseUnivariatePolynomial| F)) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| (|spadConstant| $ 64) . #2=(|INTPAF;chvarIfCan|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p| (|spadConstant| $ 64) (QREFELT $ 76)))
                       (GO G191)))
                     (SEQ
                      (LETT |v|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL |u1| (SPADCALL |p| (QREFELT $ 57))
                                        (QREFELT $ 142))
                              (SPADCALL |d| (SPADCALL |p| (QREFELT $ 58))
                                        (QREFELT $ 143))
                              (QREFELT $ 70))
                             |u| (QREFELT $ 145))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |v| 1)
                         (PROGN
                          (LETT #1# (CONS 1 "failed") . #2#)
                          (GO #3=#:G965)))
                        ('T
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL (QCDR |v|)
                                                    (SPADCALL |p|
                                                              (QREFELT $ 58))
                                                    (QREFELT $ 68))
                                          (QREFELT $ 69))
                                . #2#)
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 73)) . #2#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |ans|))))
          #3# (EXIT #1#)))) 

(SDEFUN |INTPAF;algaddx|
        ((|i| |IntegrationResult| F) (|dxx| F) (|xx| F)
         ($ |IntegrationResult| F))
        (SPROG ((#1=#:G973 NIL) (|ne| NIL) (#2=#:G972 NIL))
               (SEQ
                (COND ((SPADCALL |i| (QREFELT $ 146)) |i|)
                      ('T
                       (SPADCALL (SPADCALL |i| (QREFELT $ 147))
                                 (SPADCALL |i| (QREFELT $ 150))
                                 (PROGN
                                  (LETT #2# NIL . #3=(|INTPAF;algaddx|))
                                  (SEQ (LETT |ne| NIL . #3#)
                                       (LETT #1# (SPADCALL |i| (QREFELT $ 153))
                                             . #3#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |ne| (CAR #1#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (CONS
                                                 (SPADCALL (QCAR |ne|) |dxx|
                                                           (QREFELT $ 110))
                                                 |xx|)
                                                #2#)
                                               . #3#)))
                                       (LETT #1# (CDR #1#) . #3#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 154))))))) 

(SDEFUN |INTPAF;prootRDE|
        ((|nfp| F) (|f| F) (|g| F) (|x| |Kernel| F) (|k| |Kernel| F)
         (|rde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         ($ |Union| F #2#))
        (SPROG
         ((#3=#:G995 NIL)
          (|rc|
           (|Record| (|:| |particular| (|Union| |curve| #4="failed"))
                     (|:| |basis| (|List| |curve|))))
          (|curve|
           (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial| F)))))
          (#5=#:G1000 NIL) (|c1| (F)) (|u| #1#) (#6=#:G986 NIL)
          (|ug|
           #7=(|Union|
               (|SparseUnivariatePolynomial|
                (|Fraction| (|SparseUnivariatePolynomial| F)))
               "failed"))
          (|gg|
           #8=(|SparseUnivariatePolynomial|
               (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|uf| #7#) (|ff| #8#)
          (|dqdx| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|q| #9=(|SparseUnivariatePolynomial| F))
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand| #9#)))
          (|r|
           (|Record|
            (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (#10=#:G979 NIL)
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |modulus|
                  (SPADCALL
                   (LETT |p| (SPADCALL |k| (QREFELT $ 53))
                         . #11=(|INTPAF;prootRDE|))
                   |x| (QREFELT $ 54))
                  . #11#)
            (LETT |r|
                  (PROG2
                      (LETT #10# (SPADCALL |modulus| (QREFELT $ 102)) . #11#)
                      (QCDR #10#)
                    (|check_union2| (QEQCAR #10# 0)
                                    (|Record|
                                     (|:| |radicand|
                                          (|Fraction|
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 7))))
                                     (|:| |deg| (|NonNegativeInteger|)))
                                    (|Union|
                                     (|Record|
                                      (|:| |radicand|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                      (|:| |deg| (|NonNegativeInteger|)))
                                     "failed")
                                    #10#))
                  . #11#)
            (LETT |rec| (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 141))
                  . #11#)
            (LETT |dqdx|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (LETT |q| (QVELT |rec| 2) . #11#) (QREFELT $ 85))
                    (QREFELT $ 28))
                   (QREFELT $ 124))
                  . #11#)
            (SEQ
             (LETT |uf|
                   (|INTPAF;chvarIfCan|
                    (LETT |ff| (SPADCALL |f| |x| |k| |p| (QREFELT $ 88))
                          . #11#)
                    (QVELT |rec| 1) |q| (|spadConstant| $ 59) $)
                   . #11#)
             (EXIT
              (COND
               ((QEQCAR |uf| 0)
                (SEQ
                 (LETT |ug|
                       (|INTPAF;chvarIfCan|
                        (LETT |gg| (SPADCALL |g| |x| |k| |p| (QREFELT $ 88))
                              . #11#)
                        (QVELT |rec| 1) |q| |dqdx| $)
                       . #11#)
                 (EXIT
                  (COND
                   ((QEQCAR |ug| 0)
                    (PROGN
                     (LETT #5#
                           (SEQ
                            (LETT |u|
                                  (SPADCALL
                                   (|INTPAF;chv0| (QCDR |uf|) (QVELT |rec| 0)
                                    (|spadConstant| $ 48) (|spadConstant| $ 72)
                                    $)
                                   (SPADCALL
                                    (SPADCALL (QVELT |rec| 0)
                                              (SPADCALL
                                               (SPADCALL (QREFELT $ 14)
                                                         (QREFELT $ 21))
                                               (* (QVELT |rec| 0)
                                                  (- (QVELT |rec| 0) 1))
                                               (QREFELT $ 155))
                                              (QREFELT $ 156))
                                    (|INTPAF;chv0| (QCDR |ug|) (QVELT |rec| 0)
                                     (|spadConstant| $ 48)
                                     (|spadConstant| $ 72) $)
                                    (QREFELT $ 110))
                                   (PROG2
                                       (LETT #6#
                                             (SPADCALL (QREFELT $ 14)
                                                       (QREFELT $ 158))
                                             . #11#)
                                       (QCDR #6#)
                                     (|check_union2| (QEQCAR #6# 0) (|Symbol|)
                                                     (|Union| (|Symbol|)
                                                              "failed")
                                                     #6#))
                                   |rde|)
                                  . #11#)
                            (EXIT
                             (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                                   (#12='T
                                    (SEQ
                                     (LETT |c1|
                                           (SPADCALL (QVELT |rec| 1) |x|
                                                     (QREFELT $ 129))
                                           . #11#)
                                     (EXIT
                                      (CONS 0
                                            (SPADCALL (QCDR |u|) (QREFELT $ 14)
                                                      (SPADCALL |c1|
                                                                (SPADCALL |k|
                                                                          (QREFELT
                                                                           $
                                                                           21))
                                                                (QREFELT $
                                                                         110))
                                                      (QREFELT $ 159)))))))))
                           . #11#)
                     (GO #13=#:G998))))))))))
            (EXIT
             (COND
              ((SPADCALL (QVELT |rec| 1) (|spadConstant| $ 59) (QREFELT $ 160))
               (SEQ
                (LETT |curve|
                      (|RadicalFunctionField| (QREFELT $ 7)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))
                                              (|SparseUnivariatePolynomial|
                                               (|Fraction|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))))
                                              (SPADCALL |q| (QREFELT $ 28))
                                              (QVELT |rec| 0))
                      . #11#)
                (LETT |rc|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (|compiledLookupCheck| 'D (LIST '$)
                                                (|LinearOrdinaryDifferentialOperator1|
                                                 |curve|)))
                        (SPADCALL
                         (SPADCALL (SPADCALL |nfp| |x| |k| |p| (QREFELT $ 88))
                                   (|compiledLookupCheck| '|reduce|
                                                          (LIST '$
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (LIST
                                                                  '|Fraction|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    (ELT $
                                                                         7))))))
                                                          |curve|))
                         (|compiledLookupCheck| '|coerce|
                                                (LIST '$ (|devaluate| |curve|))
                                                (|LinearOrdinaryDifferentialOperator1|
                                                 |curve|)))
                        (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                               (|LinearOrdinaryDifferentialOperator1|
                                                |curve|)))
                       (SPADCALL (SPADCALL |g| |x| |k| |p| (QREFELT $ 88))
                                 (|compiledLookupCheck| '|reduce|
                                                        (LIST '$
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (LIST
                                                                '|Fraction|
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  (ELT $
                                                                       7))))))
                                                        |curve|))
                       (|compiledLookupCheck| '|algDsolve|
                                              (LIST
                                               (LIST '|Record|
                                                     (LIST '|:| '|particular|
                                                           (LIST '|Union|
                                                                 (|devaluate|
                                                                  |curve|)
                                                                 '#4#))
                                                     (LIST '|:| '|basis|
                                                           (LIST '|List|
                                                                 (|devaluate|
                                                                  |curve|))))
                                               (LIST
                                                '|LinearOrdinaryDifferentialOperator1|
                                                (|devaluate| |curve|))
                                               (|devaluate| |curve|))
                                              (|PureAlgebraicLODE| (ELT $ 7)
                                                                   (|SparseUnivariatePolynomial|
                                                                    (ELT $ 7))
                                                                   (|SparseUnivariatePolynomial|
                                                                    (|Fraction|
                                                                     (|SparseUnivariatePolynomial|
                                                                      (ELT $
                                                                           7))))
                                                                   |curve|)))
                      . #11#)
                (EXIT
                 (COND ((QEQCAR (QCAR |rc|) 1) (CONS 1 "failed"))
                       (#12#
                        (CONS 0
                              (|INTPAF;UPUP2F0|
                               (SPADCALL
                                (PROG2 (LETT #3# (QCAR |rc|) . #11#)
                                    (QCDR #3#)
                                  (|check_union2| (QEQCAR #3# 0) |curve|
                                                  (|Union| |curve| #4#) #3#))
                                (|compiledLookupCheck| '|lift|
                                                       (LIST
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (LIST '|Fraction|
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (|devaluate|
                                                                 (ELT $ 7)))))
                                                        '$)
                                                       |curve|))
                               |x| |k| $)))))))
              (#12# (|INTPAF;palgRDE1| |nfp| |g| |x| |k| $))))))
          #13# (EXIT #5#)))) 

(SDEFUN |INTPAF;change_back|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F)) (|x| |Kernel| F)
         (|k| |Kernel| F) (|cc| |Fraction| (|SparseUnivariatePolynomial| F))
         (|m| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ F))
        (SPROG
         ((|fu2|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|fu|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (LETT |fu| (|INTPAF;RF2UPUP| |f| |m| $) . #1=(|INTPAF;change_back|))
          (LETT |fu2|
                (SPADCALL |fu| (QREFELT $ 163) (SPADCALL |cc| 1 (QREFELT $ 68))
                          (QREFELT $ 164))
                . #1#)
          (EXIT (|INTPAF;UPUP2F0| |fu2| |x| |k| $))))) 

(SDEFUN |INTPAF;palgRDE1|
        ((|nfp| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         ($ |Union| F "failed"))
        (SPROG ((#1=#:G1007 NIL))
               (QCAR
                (|INTPAF;palgLODE1| (LIST |nfp| (|spadConstant| $ 48)) |g| |x|
                 |y|
                 (PROG2
                     (LETT #1# (SPADCALL |x| (QREFELT $ 158))
                           |INTPAF;palgRDE1|)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                   (|Union| (|Symbol|) "failed") #1#))
                 $)))) 

(SDEFUN |INTPAF;param_RDE;FL2KR;18|
        ((|fp| F) (|lg| |List| F) (|x| |Kernel| F) (|y| |Kernel| F)
         ($ |Record|
          (|:| |particular|
               (|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|:| |basis| (|List| F))))
        (SPADCALL (LIST |fp| (|spadConstant| $ 48)) |lg| |x| |y|
                  (QREFELT $ 168))) 

(SDEFUN |INTPAF;param_LODE;2L2KR;19|
        ((|eq| |List| F) (|lg| |List| F) (|kx| |Kernel| F) (|y| |Kernel| F)
         ($ |Record|
          (|:| |particular|
               (|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|:| |basis| (|List| F))))
        (SPROG
         ((|part1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#1=#:G1030 NIL) (|be| NIL) (#2=#:G1029 NIL) (|bas1| (|List| F))
          (#3=#:G1028 NIL) (|h| NIL) (#4=#:G1027 NIL)
          (|rec|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| |curve|)
                            (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| (|List| |curve|))))
          (#5=#:G1026 NIL) (|g| NIL) (#6=#:G1025 NIL)
          (|neq| (|LinearOrdinaryDifferentialOperator1| |curve|))
          (#7=#:G1024 NIL) (|f| NIL) (|i| NIL)
          (|curve|
           (|Join|
            (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                     (|SparseUnivariatePolynomial|
                                      (|Fraction|
                                       (|SparseUnivariatePolynomial| F))))
            (CATEGORY |package|
             (SIGNATURE |knownInfBasis| ((|Void|) (|NonNegativeInteger|))))))
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |modulus|
                (SPADCALL
                 (LETT |p| (SPADCALL |y| (QREFELT $ 53))
                       . #8=(|INTPAF;param_LODE;2L2KR;19|))
                 |kx| (QREFELT $ 54))
                . #8#)
          (LETT |curve|
                (|AlgebraicFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          |modulus|)
                . #8#)
          (LETT |neq|
                (SPADCALL
                 (|compiledLookupCheck| '|Zero| (LIST '$)
                                        (|LinearOrdinaryDifferentialOperator1|
                                         |curve|)))
                . #8#)
          (SEQ (LETT |i| 0 . #8#) (LETT |f| NIL . #8#) (LETT #7# |eq| . #8#)
               G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#) . #8#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |neq|
                       (SPADCALL |neq|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |f| |kx| |y| |p| (QREFELT $ 88))
                                   (|compiledLookupCheck| '|reduce|
                                                          (LIST '$
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (LIST
                                                                  '|Fraction|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    (ELT $
                                                                         7))))))
                                                          |curve|))
                                  |i|
                                  (|compiledLookupCheck| '|monomial|
                                                         (LIST '$
                                                               (|devaluate|
                                                                |curve|)
                                                               (LIST
                                                                '|NonNegativeInteger|))
                                                         (|LinearOrdinaryDifferentialOperator1|
                                                          |curve|)))
                                 (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                                        (|LinearOrdinaryDifferentialOperator1|
                                                         |curve|)))
                       . #8#)))
               (LETT #7# (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|) . #8#))
                     . #8#)
               (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL |neq|
                          (PROGN
                           (LETT #6# NIL . #8#)
                           (SEQ (LETT |g| NIL . #8#) (LETT #5# |lg| . #8#) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |g| (CAR #5#) . #8#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |g| |kx| |y| |p|
                                                    (QREFELT $ 88))
                                          (|compiledLookupCheck| '|reduce|
                                                                 (LIST '$
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (LIST
                                                                         '|Fraction|
                                                                         (LIST
                                                                          '|SparseUnivariatePolynomial|
                                                                          (|devaluate|
                                                                           (ELT
                                                                            $
                                                                            7))))))
                                                                 |curve|))
                                         #6#)
                                        . #8#)))
                                (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          (|compiledLookupCheck| '|algDsolve|
                                                 (LIST
                                                  (LIST '|Record|
                                                        (LIST '|:|
                                                              '|particular|
                                                              (LIST '|List|
                                                                    (LIST
                                                                     '|Record|
                                                                     (LIST '|:|
                                                                           '|ratpart|
                                                                           (|devaluate|
                                                                            |curve|))
                                                                     (LIST '|:|
                                                                           '|coeffs|
                                                                           (LIST
                                                                            '|Vector|
                                                                            (|devaluate|
                                                                             (ELT
                                                                              $
                                                                              7)))))))
                                                        (LIST '|:| '|basis|
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     |curve|))))
                                                  (LIST
                                                   '|LinearOrdinaryDifferentialOperator1|
                                                   (|devaluate| |curve|))
                                                  (LIST '|List|
                                                        (|devaluate| |curve|)))
                                                 (|PureAlgebraicLODE| (ELT $ 7)
                                                                      (|SparseUnivariatePolynomial|
                                                                       (ELT $
                                                                            7))
                                                                      (|SparseUnivariatePolynomial|
                                                                       (|Fraction|
                                                                        (|SparseUnivariatePolynomial|
                                                                         (ELT $
                                                                              7))))
                                                                      |curve|)))
                . #8#)
          (LETT |bas1|
                (PROGN
                 (LETT #4# NIL . #8#)
                 (SEQ (LETT |h| NIL . #8#) (LETT #3# (QCDR |rec|) . #8#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |h| (CAR #3#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (|INTPAF;UPUP2F0|
                                (SPADCALL |h|
                                          (|compiledLookupCheck| '|lift|
                                                                 (LIST
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (LIST
                                                                    '|Fraction|
                                                                    (LIST
                                                                     '|SparseUnivariatePolynomial|
                                                                     (|devaluate|
                                                                      (ELT $
                                                                           7)))))
                                                                  '$)
                                                                 |curve|))
                                |kx| |y| $)
                               #4#)
                              . #8#)))
                      (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #8#)
          (LETT |part1|
                (PROGN
                 (LETT #2# NIL . #8#)
                 (SEQ (LETT |be| NIL . #8#) (LETT #1# (QCAR |rec|) . #8#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |be| (CAR #1#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS
                                (|INTPAF;UPUP2F0|
                                 (SPADCALL (QCAR |be|)
                                           (|compiledLookupCheck| '|lift|
                                                                  (LIST
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (LIST
                                                                     '|Fraction|
                                                                     (LIST
                                                                      '|SparseUnivariatePolynomial|
                                                                      (|devaluate|
                                                                       (ELT $
                                                                            7)))))
                                                                   '$)
                                                                  |curve|))
                                 |kx| |y| $)
                                (QCDR |be|))
                               #2#)
                              . #8#)))
                      (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #8#)
          (EXIT (CONS |part1| |bas1|))))) 

(SDEFUN |INTPAF;palgLODE1|
        ((|eq| |List| F) (|g| F) (|kx| |Kernel| F) (|y| |Kernel| F)
         (|x| |Symbol|)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G1055 NIL) (|h| NIL) (#2=#:G1054 NIL)
          (|rec|
           (|Record| (|:| |particular| (|Union| |curve| #3="failed"))
                     (|:| |basis| (|List| |curve|))))
          (#4=#:G1041 NIL) (|bas| (|List| F)) (#5=#:G1053 NIL) (#6=#:G1052 NIL)
          (|neq| (|LinearOrdinaryDifferentialOperator1| |curve|))
          (#7=#:G1051 NIL) (|f| NIL) (|i| NIL)
          (|curve|
           (|Join|
            (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                     (|SparseUnivariatePolynomial|
                                      (|Fraction|
                                       (|SparseUnivariatePolynomial| F))))
            (CATEGORY |package|
             (SIGNATURE |knownInfBasis| ((|Void|) (|NonNegativeInteger|))))))
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |modulus|
                (SPADCALL
                 (LETT |p| (SPADCALL |y| (QREFELT $ 53))
                       . #8=(|INTPAF;palgLODE1|))
                 |kx| (QREFELT $ 54))
                . #8#)
          (LETT |curve|
                (|AlgebraicFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          |modulus|)
                . #8#)
          (LETT |neq|
                (SPADCALL
                 (|compiledLookupCheck| '|Zero| (LIST '$)
                                        (|LinearOrdinaryDifferentialOperator1|
                                         |curve|)))
                . #8#)
          (SEQ (LETT |i| 0 . #8#) (LETT |f| NIL . #8#) (LETT #7# |eq| . #8#)
               G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#) . #8#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |neq|
                       (SPADCALL |neq|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |f| |kx| |y| |p| (QREFELT $ 88))
                                   (|compiledLookupCheck| '|reduce|
                                                          (LIST '$
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (LIST
                                                                  '|Fraction|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    (ELT $
                                                                         7))))))
                                                          |curve|))
                                  |i|
                                  (|compiledLookupCheck| '|monomial|
                                                         (LIST '$
                                                               (|devaluate|
                                                                |curve|)
                                                               (LIST
                                                                '|NonNegativeInteger|))
                                                         (|LinearOrdinaryDifferentialOperator1|
                                                          |curve|)))
                                 (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                                        (|LinearOrdinaryDifferentialOperator1|
                                                         |curve|)))
                       . #8#)))
               (LETT #7# (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|) . #8#))
                     . #8#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL
              (SPADCALL |y|
                        (SPADCALL |kx|
                                  (SPADCALL (SPADCALL |g| (QREFELT $ 170)) |x|
                                            (QREFELT $ 173))
                                  (QREFELT $ 174))
                        (QREFELT $ 174)))
             (SEQ
              (LETT |rec|
                    (SPADCALL |neq|
                              (SPADCALL
                               (SPADCALL |g| |kx| |y| |p| (QREFELT $ 88))
                               (|compiledLookupCheck| '|reduce|
                                                      (LIST '$
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (LIST '|Fraction|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7))))))
                                                      |curve|))
                              (|compiledLookupCheck| '|algDsolve|
                                                     (LIST
                                                      (LIST '|Record|
                                                            (LIST '|:|
                                                                  '|particular|
                                                                  (LIST
                                                                   '|Union|
                                                                   (|devaluate|
                                                                    |curve|)
                                                                   '#3#))
                                                            (LIST '|:| '|basis|
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         |curve|))))
                                                      (LIST
                                                       '|LinearOrdinaryDifferentialOperator1|
                                                       (|devaluate| |curve|))
                                                      (|devaluate| |curve|))
                                                     (|PureAlgebraicLODE|
                                                      (ELT $ 7)
                                                      (|SparseUnivariatePolynomial|
                                                       (ELT $ 7))
                                                      (|SparseUnivariatePolynomial|
                                                       (|Fraction|
                                                        (|SparseUnivariatePolynomial|
                                                         (ELT $ 7))))
                                                      |curve|)))
                    . #8#)
              (LETT |bas|
                    (PROGN
                     (LETT #6# NIL . #8#)
                     (SEQ (LETT |h| NIL . #8#) (LETT #5# (QCDR |rec|) . #8#)
                          G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |h| (CAR #5#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (|INTPAF;UPUP2F0|
                                    (SPADCALL |h|
                                              (|compiledLookupCheck| '|lift|
                                                                     (LIST
                                                                      (LIST
                                                                       '|SparseUnivariatePolynomial|
                                                                       (LIST
                                                                        '|Fraction|
                                                                        (LIST
                                                                         '|SparseUnivariatePolynomial|
                                                                         (|devaluate|
                                                                          (ELT
                                                                           $
                                                                           7)))))
                                                                      '$)
                                                                     |curve|))
                                    |kx| |y| $)
                                   #6#)
                                  . #8#)))
                          (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #8#)
              (EXIT
               (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                     (#9='T
                      (CONS
                       (CONS 0
                             (|INTPAF;UPUP2F0|
                              (SPADCALL
                               (PROG2 (LETT #4# (QCAR |rec|) . #8#)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0) |curve|
                                                 (|Union| |curve| #3#) #4#))
                               (|compiledLookupCheck| '|lift|
                                                      (LIST
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (LIST '|Fraction|
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (|devaluate|
                                                                (ELT $ 7)))))
                                                       '$)
                                                      |curve|))
                              |kx| |y| $))
                       |bas|))))))
            (#9#
             (SEQ
              (LETT |rec|
                    (SPADCALL |neq|
                              (SPADCALL
                               (|compiledLookupCheck| '|Zero| (LIST '$)
                                                      |curve|))
                              (|compiledLookupCheck| '|algDsolve|
                                                     (LIST
                                                      (LIST '|Record|
                                                            (LIST '|:|
                                                                  '|particular|
                                                                  (LIST
                                                                   '|Union|
                                                                   (|devaluate|
                                                                    |curve|)
                                                                   '#3#))
                                                            (LIST '|:| '|basis|
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         |curve|))))
                                                      (LIST
                                                       '|LinearOrdinaryDifferentialOperator1|
                                                       (|devaluate| |curve|))
                                                      (|devaluate| |curve|))
                                                     (|PureAlgebraicLODE|
                                                      (ELT $ 7)
                                                      (|SparseUnivariatePolynomial|
                                                       (ELT $ 7))
                                                      (|SparseUnivariatePolynomial|
                                                       (|Fraction|
                                                        (|SparseUnivariatePolynomial|
                                                         (ELT $ 7))))
                                                      |curve|)))
                    . #8#)
              (EXIT
               (CONS (CONS 1 "failed")
                     (PROGN
                      (LETT #2# NIL . #8#)
                      (SEQ (LETT |h| NIL . #8#) (LETT #1# (QCDR |rec|) . #8#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |h| (CAR #1#) . #8#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|INTPAF;UPUP2F0|
                                     (SPADCALL |h|
                                               (|compiledLookupCheck| '|lift|
                                                                      (LIST
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (LIST
                                                                         '|Fraction|
                                                                         (LIST
                                                                          '|SparseUnivariatePolynomial|
                                                                          (|devaluate|
                                                                           (ELT
                                                                            $
                                                                            7)))))
                                                                       '$)
                                                                      |curve|))
                                     |kx| |y| $)
                                    #2#)
                                   . #8#)))
                           (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))))))))))) 

(SDEFUN |INTPAF;palgintegrate|
        ((|f| F) (|x| |Kernel| F) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|dcv| (F))
          (|curve|
           (|Join|
            (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                     (|SparseUnivariatePolynomial|
                                      (|Fraction|
                                       (|SparseUnivariatePolynomial| F))))
            (CATEGORY |package|
             (SIGNATURE |knownInfBasis| ((|Void|) (|NonNegativeInteger|))))))
          (|cv|
           (|Record|
            (|:| |func|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |poly|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |c1| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |c2| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |modulus|
                (SPADCALL
                 (LETT |p| (SPADCALL |k| (QREFELT $ 53))
                       . #1=(|INTPAF;palgintegrate|))
                 |x| (QREFELT $ 54))
                . #1#)
          (LETT |cv|
                (SPADCALL (SPADCALL |f| |x| |k| |p| (QREFELT $ 88)) |modulus|
                          (QREFELT $ 121))
                . #1#)
          (LETT |curve|
                (|AlgebraicFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          (QVELT |cv| 1))
                . #1#)
          (LETT |dcv|
                (SPADCALL (SPADCALL (QVELT |cv| 2) (QREFELT $ 127)) |x|
                          (QREFELT $ 129))
                . #1#)
          (SPADCALL (QVELT |cv| 4)
                    (|compiledLookupCheck| '|knownInfBasis|
                                           (LIST (LIST '|Void|)
                                                 (LIST '|NonNegativeInteger|))
                                           |curve|))
          (EXIT
           (|INTPAF;algaddx|
            (SPADCALL
             (CONS #'|INTPAF;palgintegrate!0| (VECTOR |k| |x| |cv| |curve| $))
             (SPADCALL
              (SPADCALL (QVELT |cv| 0)
                        (|compiledLookupCheck| '|reduce|
                                               (LIST '$
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (LIST '|Fraction|
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (|devaluate|
                                                              (ELT $ 7))))))
                                               |curve|))
              (ELT $ 85)
              (|compiledLookupCheck| '|palgintegrate|
                                     (LIST
                                      (LIST '|IntegrationResult|
                                            (|devaluate| |curve|))
                                      (|devaluate| |curve|)
                                      (LIST '|Mapping|
                                            (LIST '|SparseUnivariatePolynomial|
                                                  (|devaluate| (ELT $ 7)))
                                            (LIST '|SparseUnivariatePolynomial|
                                                  (|devaluate| (ELT $ 7)))))
                                     (|AlgebraicIntegrate| (ELT $ 6) (ELT $ 7)
                                                           (|SparseUnivariatePolynomial|
                                                            (ELT $ 7))
                                                           (|SparseUnivariatePolynomial|
                                                            (|Fraction|
                                                             (|SparseUnivariatePolynomial|
                                                              (ELT $ 7))))
                                                           |curve|)))
             (|compiledLookupCheck| '|map|
                                    (LIST
                                     (LIST '|IntegrationResult|
                                           (|devaluate| (ELT $ 7)))
                                     (LIST '|Mapping| (|devaluate| (ELT $ 7))
                                           (|devaluate| |curve|))
                                     (LIST '|IntegrationResult|
                                           (|devaluate| |curve|)))
                                    (|IntegrationResultFunctions2| |curve|
                                                                   (ELT $ 7))))
            |dcv| (SPADCALL |x| (QREFELT $ 21)) $))))) 

(SDEFUN |INTPAF;palgintegrate!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ |curve| |cv| |x| |k|)
          (LETT $ (QREFELT $$ 4) . #1=(|INTPAF;palgintegrate|))
          (LETT |curve| (QREFELT $$ 3) . #1#)
          (LETT |cv| (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|INTPAF;UPUP2F1|
             (SPADCALL |x1|
                       (|compiledLookupCheck| '|lift|
                                              (LIST
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (LIST '|Fraction|
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate|
                                                        (ELT $ 7)))))
                                               '$)
                                              |curve|))
             (QVELT |cv| 2) (QVELT |cv| 3) |x| |k| $))))) 

(SDEFUN |INTPAF;palgint;F2KIr;22|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |coef| F)
                      (|:| |poly| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|v|
           (|Union|
            (|Record| (|:| |xsub| F)
                      (|:| |dxsub|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |ycoeff| F))
            "failed")))
         (SEQ
          (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $)
                . #1=(|INTPAF;palgint;F2KIr;22|))
          (EXIT
           (COND
            ((QEQCAR |v| 1)
             (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $) . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (COND
                      ((SPADCALL |y| '|nthRoot| (QREFELT $ 175))
                       (|INTPAF;prootintegrate| |f| |x| |y| $))
                      ((SPADCALL |y| '|rootOf| (QREFELT $ 175))
                       (|INTPAF;palgintegrate| |f| |x| |y| $))
                      (#2='T
                       (|error| "failed - cannot handle that integrand"))))
                    (#2#
                     (SPADCALL |f| |x| |y| (QCAR (QCDR |u|)) (QCDR (QCDR |u|))
                               (QREFELT $ 176)))))))
            (#2#
             (SPADCALL |f| |x| |y| (QREFELT $ 15) (QVELT (QCDR |v|) 0)
                       (QVELT (QCDR |v|) 1) (QVELT (QCDR |v|) 2)
                       (QREFELT $ 177)))))))) 

(SDEFUN |INTPAF;palgRDE;3F2KMU;23|
        ((|nfp| F) (|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rde| |Mapping| (|Union| F #1="failed") F F (|Symbol|))
         ($ |Union| F #1#))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |coef| F)
                      (|:| |poly| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|v|
           (|Union|
            (|Record| (|:| |xsub| F)
                      (|:| |dxsub|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |ycoeff| F))
            "failed")))
         (SEQ
          (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $)
                . #2=(|INTPAF;palgRDE;3F2KMU;23|))
          (EXIT
           (COND
            ((QEQCAR |v| 1)
             (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $) . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (COND
                      ((SPADCALL |y| '|nthRoot| (QREFELT $ 175))
                       (|INTPAF;prootRDE| |nfp| |f| |g| |x| |y| |rde| $))
                      (#3='T (|INTPAF;palgRDE1| |nfp| |g| |x| |y| $))))
                    (#3#
                     (SPADCALL |f| |g| |x| |y| |rde| (QCAR (QCDR |u|))
                               (QCDR (QCDR |u|)) (QREFELT $ 180)))))))
            (#3#
             (SPADCALL |f| |g| |x| |y| |rde| (QREFELT $ 15)
                       (QVELT (QCDR |v|) 0) (QVELT (QCDR |v|) 1)
                       (QVELT (QCDR |v|) 2) (QREFELT $ 181)))))))) 

(SDEFUN |INTPAF;quadIfCan|
        ((|x| |Kernel| F) (|y| |Kernel| F)
         ($ |Union|
          (|Record| (|:| |coef| F)
                    (|:| |poly| (|SparseUnivariatePolynomial| F)))
          "failed"))
        (SPROG
         ((|radi| (|SparseUnivariatePolynomial| F))
          (|d| (|SparseUnivariatePolynomial| F))
          (|ff| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (COND
           ((EQL
             (SPADCALL
              (LETT |p| (SPADCALL |y| (QREFELT $ 53))
                    . #1=(|INTPAF;quadIfCan|))
              (QREFELT $ 60))
             2)
            (COND
             ((SPADCALL (SPADCALL |p| 1 (QREFELT $ 77)) (QREFELT $ 183))
              (EXIT
               (SEQ
                (LETT |d|
                      (SPADCALL
                       (LETT |ff|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |p| 0 (QREFELT $ 77))
                                         (SPADCALL |p| 2 (QREFELT $ 77))
                                         (QREFELT $ 137))
                               (QREFELT $ 184))
                              |x| (QREFELT $ 25))
                             . #1#)
                       (QREFELT $ 29))
                      . #1#)
                (EXIT
                 (COND
                  ((EQL
                    (SPADCALL
                     (LETT |radi|
                           (SPADCALL |d| (SPADCALL |ff| (QREFELT $ 38))
                                     (QREFELT $ 49))
                           . #1#)
                     (QREFELT $ 60))
                    2)
                   (CONS 0
                         (CONS
                          (SPADCALL |d| (SPADCALL |x| (QREFELT $ 21))
                                    (QREFELT $ 103))
                          |radi|)))
                  ('T (CONS 1 "failed"))))))))))
          (EXIT (CONS 1 "failed"))))) 

(SDEFUN |INTPAF;palgLODE;LF2KSR;25|
        ((|eq| L) (|g| F) (|kx| |Kernel| F) (|y| |Kernel| F) (|x| |Symbol|)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G1121 NIL) (|i| NIL) (#2=#:G1120 NIL)
          (|u|
           (|Union|
            (|Record| (|:| |coef| F)
                      (|:| |poly| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|v|
           (|Union|
            (|Record| (|:| |xsub| F)
                      (|:| |dxsub|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |ycoeff| F))
            "failed")))
         (SEQ
          (LETT |v| (|INTPAF;linearInXIfCan| |kx| |y| $)
                . #3=(|INTPAF;palgLODE;LF2KSR;25|))
          (EXIT
           (COND
            ((QEQCAR |v| 1)
             (SEQ (LETT |u| (|INTPAF;quadIfCan| |kx| |y| $) . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (|INTPAF;palgLODE1|
                      (PROGN
                       (LETT #2# NIL . #3#)
                       (SEQ (LETT |i| 0 . #3#)
                            (LETT #1# (SPADCALL |eq| (QREFELT $ 185)) . #3#)
                            G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |eq| |i| (QREFELT $ 186))
                                          #2#)
                                    . #3#)))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      |g| |kx| |y| |x| $))
                    (#4='T
                     (SPADCALL |eq| |g| |kx| |y| (QCAR (QCDR |u|))
                               (QCDR (QCDR |u|)) (QREFELT $ 188)))))))
            (#4#
             (SPADCALL |eq| |g| |kx| |y| (QREFELT $ 15) (QVELT (QCDR |v|) 0)
                       (QVELT (QCDR |v|) 1) (QVELT (QCDR |v|) 2)
                       (QREFELT $ 189)))))))) 

(DECLAIM (NOTINLINE |PureAlgebraicIntegration;|)) 

(DEFUN |PureAlgebraicIntegration| (&REST #1=#:G1122)
  (SPROG NIL
         (PROG (#2=#:G1123)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PureAlgebraicIntegration|)
                                               '|domainEqualList|)
                    . #3=(|PureAlgebraicIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PureAlgebraicIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PureAlgebraicIntegration|)))))))))) 

(DEFUN |PureAlgebraicIntegration;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PureAlgebraicIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|PureAlgebraicIntegration| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 191) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#3|
                                                             (LIST
                                                              '|LinearOrdinaryDifferentialOperatorCategory|
                                                              (|devaluate|
                                                               |#2|)))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|PureAlgebraicIntegration|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
          (QSETREFV $ 14 (SPADCALL (QREFELT $ 11) (QREFELT $ 13)))
          (QSETREFV $ 15 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 13)))
          (QSETREFV $ 163 (SPADCALL (QREFELT $ 162)))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 190
                      (CONS (|dispatchFunction| |INTPAF;palgLODE;LF2KSR;25|)
                            $))))
          $))) 

(MAKEPROP '|PureAlgebraicIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (0 . |new|) '|dummy| (|Kernel| 7)
              (4 . |kernel|) '|dumk| '|dumk2| (|SparseUnivariatePolynomial| 17)
              (|Fraction| 26) (|ChangeOfVariable| 7 26 16) (9 . |eval|)
              (|Kernel| $) (16 . |coerce|) (|GenusZeroIntegration| 6 7 8)
              (21 . |multivariate|) (|Fraction| 52) (28 . |univariate|)
              (|SparseUnivariatePolynomial| 7) (34 . |coerce|) (39 . |coerce|)
              (44 . |denom|) (|Mapping| 17 7)
              (|SparseUnivariatePolynomialFunctions2| 7 17) (49 . |map|)
              (55 . |One|) (59 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 35 '"failed")
              (63 . |extendedEuclidean|) (70 . |numer|) (75 . *) (81 . |rem|)
              (|Factored| $) (87 . |squareFree|)
              (|Record| (|:| |factor| 26) (|:| |exponent| 104)) (|List| 43)
              (|Factored| 26) (92 . |factors|) (97 . |One|) (101 . |One|)
              (105 . *) (|NonNegativeInteger|) (111 . ^)
              (|SparseUnivariatePolynomial| $) (117 . |minPoly|) (122 . |lift|)
              (|UnivariatePolynomialCommonDenominator| 26 17 16)
              (128 . |clearDenominator|) (133 . |leadingCoefficient|)
              (138 . |degree|) (143 . |One|) (147 . |degree|) (|Boolean|)
              (152 . >) (158 . *) (164 . |Zero|) (168 . |coefficient|)
              (|Union| $ '"failed") (174 . |exquo|) (180 . |monomial|)
              (186 . +) (192 . /) (198 . |Zero|) (202 . |Zero|)
              (206 . |reductum|) (211 . *) (217 . |Zero|) (221 . ~=)
              (227 . |coefficient|) (233 . |monomial|) (239 . +) (245 . -)
              (251 . =) (257 . /) (|Fraction| $) (263 . |elt|)
              (269 . |differentiate|) (|Mapping| 26 26) (274 . |differentiate|)
              (280 . |univariate|) (|Union| 17 '"failed")
              (288 . |retractIfCan|) (|IntegrationResult| 17)
              (|RationalIntegration| 7 26) (293 . |integrate|)
              (|IntegrationResult| 7) (|Mapping| 7 17)
              (|IntegrationResultFunctions2| 17 7) (298 . |map|)
              (304 . |leadingMonomial|) (309 . +)
              (|Record| (|:| |radicand| 17) (|:| |deg| 50))
              (|Union| 100 '"failed") (315 . |radPoly|) (320 . |elt|)
              (|Integer|) (326 . |nthRoot|)
              (|SparseMultivariatePolynomial| 6 20) (332 . |numer|)
              (|SparseMultivariatePolynomial| 6 12) (337 . |retract|) (342 . *)
              (348 . |denom|) (353 . |coerce|) (|List| 20) (|List| $)
              (358 . |eval|) |INTPAF;palgint;F2KIr;22| (|Mapping| 7 7)
              (|IntegrationResultFunctions2| 7 7) (365 . |map|)
              (|Record| (|:| |func| 16) (|:| |poly| 16) (|:| |c1| 17)
                        (|:| |c2| 17) (|:| |deg| 50))
              (371 . |chvar|) (377 . |retract|) (382 . |zero?|) (387 . |inv|)
              (392 . |coerce|) (397 . -) (403 . |differentiate|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6 108 7)
              (408 . |multivariate|) (414 . |leadingCoefficient|) (419 . |inv|)
              (424 . *) (430 . |reductum|) (435 . |elt|) (441 . ^) (447 . -)
              (453 . /) (459 . |ground?|) (464 . |composite|)
              (|Record| (|:| |exponent| 50) (|:| |coef| 17)
                        (|:| |radicand| 26))
              (470 . |rootPoly|) (476 . *) (482 . ^) (|Union| 83 '"failed")
              (488 . |composite|) (494 . |elem?|) (499 . |ratpart|)
              (|Record| (|:| |scalar| (|Fraction| 104)) (|:| |coeff| 26)
                        (|:| |logand| 26))
              (|List| 148) (504 . |logpart|)
              (|Record| (|:| |integrand| 7) (|:| |intvar| 7)) (|List| 151)
              (509 . |notelem|) (514 . |mkAnswer|) (521 . ^) (527 . *)
              (|Union| 9 '"failed") (533 . |symbolIfCan|) (538 . |eval|)
              (545 . =) (|SingletonAsOrderedSet|) (551 . |create|) '|sdummy|
              (555 . |eval|)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| (|Vector| 7)))
              (|Record| (|:| |particular| (|List| 165)) (|:| |basis| 167))
              (|List| 7) |INTPAF;param_LODE;2L2KR;19|
              |INTPAF;param_RDE;FL2KR;18| (562 . |kernels|) (|List| 12)
              (|IntegrationTools| 6 7) (567 . |varselect|) (573 . |remove!|)
              (579 . |is?|) (585 . |palgint0|) (594 . |palgint0|)
              (|Union| 7 '"failed") (|Mapping| 178 7 7 9) (605 . |palgRDE0|)
              (616 . |palgRDE0|) |INTPAF;palgRDE;3F2KMU;23| (629 . |zero?|)
              (634 . -) (639 . |degree|) (644 . |coefficient|)
              (|Record| (|:| |particular| 178) (|:| |basis| 167))
              (650 . |palgLODE0|) (660 . |palgLODE0|) (672 . |palgLODE|))
           '#(|param_RDE| 681 |param_LODE| 689 |palgint| 697 |palgRDE| 704
              |palgLODE| 714)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 190
                                                 '(0 9 0 10 1 12 0 9 13 3 18 16
                                                   16 17 17 19 1 7 0 20 21 3 22
                                                   7 16 12 7 23 2 7 24 0 20 25
                                                   1 26 0 7 27 1 17 0 26 28 1
                                                   17 26 0 29 2 31 16 30 26 32
                                                   0 6 0 33 0 16 0 34 3 16 36 0
                                                   0 0 37 1 17 26 0 38 2 16 0 0
                                                   0 39 2 16 0 0 0 40 1 26 41 0
                                                   42 1 45 44 0 46 0 26 0 47 0
                                                   7 0 48 2 26 0 0 0 49 2 26 0
                                                   0 50 51 1 7 52 20 53 2 22 16
                                                   26 12 54 1 55 16 16 56 1 16
                                                   17 0 57 1 16 50 0 58 0 17 0
                                                   59 1 26 50 0 60 2 50 61 0 0
                                                   62 2 16 0 17 0 63 0 16 0 64
                                                   2 16 17 0 50 65 2 26 66 0 0
                                                   67 2 16 0 17 50 68 2 16 0 0
                                                   0 69 2 17 0 0 0 70 0 6 0 71
                                                   0 7 0 72 1 16 0 0 73 2 17 0
                                                   26 0 74 0 26 0 75 2 16 61 0
                                                   0 76 2 26 7 0 50 77 2 26 0 7
                                                   50 78 2 26 0 0 0 79 2 26 0 0
                                                   0 80 2 26 61 0 0 81 2 17 0
                                                   26 26 82 2 26 7 83 7 84 1 26
                                                   0 0 85 2 17 0 0 86 87 4 22
                                                   16 7 12 12 26 88 1 16 89 0
                                                   90 1 92 91 17 93 2 96 94 95
                                                   91 97 1 16 0 0 98 2 94 0 0 0
                                                   99 1 18 101 16 102 2 26 7 0
                                                   7 103 2 7 0 0 104 105 1 7
                                                   106 0 107 1 108 12 0 109 2 7
                                                   0 0 0 110 1 7 106 0 111 1 7
                                                   0 106 112 3 7 0 0 113 114
                                                   115 2 118 94 117 94 119 2 18
                                                   120 16 16 121 1 17 26 0 122
                                                   1 17 61 0 123 1 17 0 0 124 1
                                                   16 0 17 125 2 16 0 0 0 126 1
                                                   17 0 0 127 2 128 7 17 12 129
                                                   1 26 7 0 130 1 7 0 0 131 2
                                                   26 0 50 0 132 1 26 0 0 133 2
                                                   16 17 0 17 134 2 7 0 0 50
                                                   135 2 7 0 0 0 136 2 7 0 0 0
                                                   137 1 26 61 0 138 2 26 66 0
                                                   0 139 2 18 140 17 50 141 2
                                                   17 0 0 0 142 2 17 0 0 104
                                                   143 2 26 144 83 0 145 1 94
                                                   61 0 146 1 94 7 0 147 1 94
                                                   149 0 150 1 94 152 0 153 3
                                                   94 0 7 149 152 154 2 7 0 0
                                                   104 155 2 7 0 50 0 156 1 12
                                                   157 0 158 3 7 0 0 20 0 159 2
                                                   17 61 0 0 160 0 161 0 162 3
                                                   16 0 0 161 0 164 1 7 113 0
                                                   170 2 172 171 171 9 173 2
                                                   171 0 12 0 174 2 12 61 0 9
                                                   175 5 22 94 7 12 12 7 26 176
                                                   7 22 94 7 12 12 12 7 17 7
                                                   177 7 22 178 7 7 12 12 179 7
                                                   26 180 9 22 178 7 7 12 12
                                                   179 12 7 17 7 181 1 7 61 0
                                                   183 1 7 0 0 184 1 8 50 0 185
                                                   2 8 7 0 50 186 6 22 187 8 7
                                                   12 12 7 26 188 8 22 187 8 7
                                                   12 12 12 7 17 7 189 5 0 187
                                                   8 7 12 12 9 190 4 0 166 7
                                                   167 12 12 169 4 0 166 167
                                                   167 12 12 168 3 0 94 7 12 12
                                                   116 6 0 178 7 7 7 12 12 179
                                                   182 5 1 187 8 7 12 12 9
                                                   190)))))
           '|lookupComplete|)) 
