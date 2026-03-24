
(SDEFUN |INTG0;kerdiff| ((|sa| (F)) (|a| (F)) (% (|List| (|Kernel| F))))
        (SPADCALL (SPADCALL |sa| (QREFELT % 15)) (SPADCALL |a| (QREFELT % 15))
                  (QREFELT % 17))) 

(SDEFUN |INTG0;checkroot| ((|f| (F)) (|l| (|List| (|Kernel| F))) (% (F)))
        (COND ((NULL |l|) |f|)
              ('T (SPADCALL |f| (|SPADfirst| |l|) (QREFELT % 19))))) 

(SDEFUN |INTG0;univ|
        ((|c| (F)) (|l| (|List| (|Kernel| F))) (|x| (|Kernel| F))
         (% (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPADCALL (|INTG0;checkroot| |c| |l| %) |x| (QREFELT % 22))) 

(SDEFUN |INTG0;univariate;F2KSupSup;4|
        ((|f| (F)) (|x| (|Kernel| F)) (|y| (|Kernel| F))
         (|p| (|SparseUnivariatePolynomial| F))
         (%
          (|SparseUnivariatePolynomial|
           (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPADCALL (SPADCALL |f| |y| |p| (QREFELT % 25)) |x| (QREFELT % 27))) 

(SDEFUN |INTG0;lift;SupKSup;5|
        ((|p| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (%
          (|SparseUnivariatePolynomial|
           (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG NIL
               (SPADCALL (CONS #'|INTG0;lift;SupKSup;5!0| (VECTOR % |k|)) |p|
                         (QREFELT % 31)))) 

(SDEFUN |INTG0;lift;SupKSup;5!0| ((|x1| NIL) ($$ NIL))
        (PROG (|k| %)
          (LETT |k| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT % 22)))))) 

(SDEFUN |INTG0;proot|
        ((|p| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |coef| (|SparseUnivariatePolynomial| F))
                    (|:| |radicand| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|r1| #1=(|SparseUnivariatePolynomial| F)) (|c1| #1#)
          (|rr1|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (|u1| (F)) (|e2| (|NonNegativeInteger|))
          (|e1| (|NonNegativeInteger|)) (|f1| (|SparseUnivariatePolynomial| F))
          (#2=#:G28 NIL) (|fac| NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| F))))
         (SEQ (LETT |ff| (SPADCALL |p| (QREFELT % 33)))
              (LETT |c1| (|spadConstant| % 34))
              (LETT |r1| (|spadConstant| % 34))
              (SEQ (LETT |fac| NIL) (LETT #2# (SPADCALL |ff| (QREFELT % 39)))
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |f1| (QVELT |fac| 1)) (LETT |e1| (QVELT |fac| 2))
                        (LETT |e2| (QUOTIENT2 |e1| 2))
                        (LETT |c1|
                              (SPADCALL (SPADCALL |f1| |e2| (QREFELT % 41))
                                        |c1| (QREFELT % 42)))
                        (EXIT
                         (COND
                          ((SPADCALL |e1| (* 2 |e2|) (QREFELT % 44))
                           (LETT |r1| (SPADCALL |f1| |r1| (QREFELT % 42)))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |u1|
                    (SPADCALL (SPADCALL |ff| (QREFELT % 45)) (QREFELT % 46)))
              (LETT |rr1| (SPADCALL |u1| 2 (QREFELT % 49)))
              (LETT |c1| (SPADCALL (QVELT |rr1| 1) |c1| (QREFELT % 50)))
              (LETT |r1| (SPADCALL (QVELT |rr1| 2) |r1| (QREFELT % 50)))
              (EXIT (CONS |c1| |r1|))))) 

(SDEFUN |INTG0;rationalize_log|
        ((|ll|
          (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                    (|:| |coeff| (|SparseUnivariatePolynomial| F))
                    (|:| |logand| (|SparseUnivariatePolynomial| F))))
         (|k1| (|Kernel| F))
         (%
          (|List|
           (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                     (|:| |coeff| (|SparseUnivariatePolynomial| F))
                     (|:| |logand| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| F))
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (|ppn| (|SparseUnivariatePolynomial| F))
          (|rr1|
           (|Record| (|:| |coef| (|SparseUnivariatePolynomial| F))
                     (|:| |radicand| (|SparseUnivariatePolynomial| F))))
          (|fun2| #1=(|SparseUnivariatePolynomial| F))
          (|fun2c| #2=(|SparseUnivariatePolynomial| F)) (|ppcc| #2#)
          (|c2| (|Fraction| (|Integer|))) (|c1| (|Fraction| (|Integer|)))
          (|fun1| #1#) (|fun1c| #2#) (|fun| (|SparseUnivariatePolynomial| F))
          (|ppc| (|SparseUnivariatePolynomial| F)) (#3=#:G34 NIL)
          (|ppr| (|SparseUnivariatePolynomial| F))
          (|pol1| #4=(|SparseUnivariatePolynomial| F)) (|pol0| #4#)
          (|polu|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|opol| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |opol| (QVELT |ll| 1))
              (LETT |polu|
                    (SPADCALL
                     (CONS #'|INTG0;rationalize_log!0| (VECTOR % |k1|)) |opol|
                     (QREFELT % 56)))
              (LETT |pol0|
                    (SPADCALL (CONS #'|INTG0;rationalize_log!1| %) |polu|
                              (QREFELT % 62)))
              (LETT |pol1|
                    (SPADCALL (CONS #'|INTG0;rationalize_log!2| %) |polu|
                              (QREFELT % 62)))
              (LETT |ppr|
                    (COND
                     ((SPADCALL |pol1| (|spadConstant| % 66) (QREFELT % 67))
                      |pol0|)
                     (#5='T (SPADCALL |pol0| |pol1| (QREFELT % 68)))))
              (LETT |ppc|
                    (PROG2 (LETT #3# (SPADCALL |opol| |ppr| (QREFELT % 70)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT % 7))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT % 7))
                                       "failed")
                                      #3#)))
              (LETT |fun| (QVELT |ll| 2)) (LETT |res| NIL)
              (COND
               ((> (SPADCALL |ppr| (QREFELT % 71)) 0)
                (SEQ (LETT |c1| (QVELT |ll| 0))
                     (LETT |fun1| (SPADCALL |fun| |ppr| (QREFELT % 72)))
                     (LETT |fun1c|
                           (SPADCALL
                            (CONS #'|INTG0;rationalize_log!3| (VECTOR % |k1|))
                            |fun1| (QREFELT % 77)))
                     (EXIT
                      (COND
                       ((SPADCALL |fun1c| |fun1| (QREFELT % 78))
                        (SEQ
                         (LETT |fun1| (SPADCALL |fun1c| |fun1| (QREFELT % 42)))
                         (LETT |c2|
                               (SPADCALL |c1| (SPADCALL 2 (QREFELT % 81))
                                         (QREFELT % 82)))
                         (LETT |rr1| (|INTG0;proot| |fun1| %))
                         (EXIT
                          (COND
                           ((SPADCALL (QCDR |rr1|) (|spadConstant| % 34)
                                      (QREFELT % 67))
                            (LETT |res|
                                  (CONS (VECTOR |c1| |ppr| (QCAR |rr1|))
                                        |res|)))
                           (#5#
                            (LETT |res|
                                  (CONS (VECTOR |c2| |ppr| |fun1|) |res|)))))))
                       (#5#
                        (LETT |res|
                              (CONS (VECTOR |c1| |ppr| |fun1|) |res|))))))))
              (COND
               ((> (SPADCALL |ppc| (QREFELT % 71)) 0)
                (SEQ (LETT |c1| (QVELT |ll| 0))
                     (LETT |c2|
                           (SPADCALL |c1| (SPADCALL 2 (QREFELT % 81))
                                     (QREFELT % 82)))
                     (LETT |fun2| (SPADCALL |fun| |ppc| (QREFELT % 72)))
                     (LETT |ppcc|
                           (SPADCALL
                            (CONS #'|INTG0;rationalize_log!4| (VECTOR % |k1|))
                            |ppc| (QREFELT % 77)))
                     (LETT |fun2c|
                           (SPADCALL
                            (CONS #'|INTG0;rationalize_log!5| (VECTOR % |k1|))
                            |fun2| (QREFELT % 77)))
                     (LETT |fun2|
                           (SPADCALL (SPADCALL |ppcc| |fun2| (QREFELT % 42))
                                     (SPADCALL |ppc| |fun2c| (QREFELT % 42))
                                     (QREFELT % 83)))
                     (LETT |rr1| (|INTG0;proot| |fun2| %))
                     (LETT |ppn| (SPADCALL |ppc| |ppcc| (QREFELT % 42)))
                     (EXIT
                      (COND
                       ((SPADCALL (QCDR |rr1|) (|spadConstant| % 34)
                                  (QREFELT % 67))
                        (LETT |res|
                              (CONS (VECTOR |c1| |ppn| (QCAR |rr1|)) |res|)))
                       (#5#
                        (LETT |res|
                              (CONS (VECTOR |c2| |ppn| |fun2|) |res|))))))))
              (EXIT |res|)))) 

(SDEFUN |INTG0;rationalize_log!5| ((|c| NIL) ($$ NIL))
        (PROG (|k1| %)
          (LETT |k1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |c| |k1|
                      (SPADCALL (SPADCALL |k1| (QREFELT % 73)) (QREFELT % 74))
                      (QREFELT % 75)))))) 

(SDEFUN |INTG0;rationalize_log!4| ((|c| NIL) ($$ NIL))
        (PROG (|k1| %)
          (LETT |k1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |c| |k1|
                      (SPADCALL (SPADCALL |k1| (QREFELT % 73)) (QREFELT % 74))
                      (QREFELT % 75)))))) 

(SDEFUN |INTG0;rationalize_log!3| ((|c| NIL) ($$ NIL))
        (PROG (|k1| %)
          (LETT |k1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |c| |k1|
                      (SPADCALL (SPADCALL |k1| (QREFELT % 73)) (QREFELT % 74))
                      (QREFELT % 75)))))) 

(SDEFUN |INTG0;rationalize_log!2| ((|c| NIL) (% NIL))
        (SPADCALL |c| (|spadConstant| % 65) (QREFELT % 59))) 

(SDEFUN |INTG0;rationalize_log!1| ((|c| NIL) (% NIL))
        (SPADCALL |c| (|spadConstant| % 58) (QREFELT % 59))) 

(SDEFUN |INTG0;rationalize_log!0| ((|c| NIL) ($$ NIL))
        (PROG (|k1| %)
          (LETT |k1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |c| |k1| (SPADCALL |k1| (QREFELT % 52))
                      (QREFELT % 25)))))) 

(SDEFUN |INTG0;rationalize_ir;IrKIr;8|
        ((|irf| (|IntegrationResult| F)) (|k1| (|Kernel| F))
         (% (|IntegrationResult| F)))
        (SPROG
         ((|lp1|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| F))
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (#1=#:G102 NIL) (|ll| NIL) (|rp1| (F)) (|rp| (F)))
         (SEQ (LETT |rp| (SPADCALL |irf| (QREFELT % 85)))
              (LETT |rp1|
                    (SPADCALL
                     (SPADCALL |rp|
                               (SPADCALL |rp| |k1|
                                         (SPADCALL
                                          (SPADCALL |k1| (QREFELT % 73))
                                          (QREFELT % 74))
                                         (QREFELT % 75))
                               (QREFELT % 86))
                     (SPADCALL 2 (QREFELT % 87)) (QREFELT % 88)))
              (LETT |lp1| NIL)
              (SEQ (LETT |ll| NIL) (LETT #1# (SPADCALL |irf| (QREFELT % 91)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ll| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |lp1|
                           (SPADCALL (|INTG0;rationalize_log| |ll| |k1| %)
                                     |lp1| (QREFELT % 92)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |rp1| |lp1| (SPADCALL |irf| (QREFELT % 95))
                         (QREFELT % 96)))))) 

(SDEFUN |INTG0;field_gens|
        ((|y| (|Kernel| F)) (|lf| (|List| F)) (% (|List| F)))
        (SPROG
         ((|res| (|List| F)) (#1=#:G107 NIL) (#2=#:G108 NIL) (|k| NIL)
          (|at| (|List| (|Kernel| F))))
         (SEQ (LETT |at| (SPADCALL |lf| (QREFELT % 99))) (LETT |res| NIL)
              (SEQ (LETT |k| NIL) (LETT #2# |at|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |k| |y| (QREFELT % 100))
                       (PROGN (LETT #1# |$NoValue|) (GO #3=#:G103)))
                      ('T
                       (LETT |res|
                             (CONS (SPADCALL |k| (QREFELT % 73)) |res|)))))
                    #3# (EXIT #1#))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;10|
        ((|f| (F)) (|x| (|Kernel| F)) (|y| (|Kernel| F)) (|den| (F))
         (|radi| (|SparseUnivariatePolynomial| F)) (% (|IntegrationResult| F)))
        (SPROG
         ((|irf1| (|IntegrationResult| F))
          (|irf|
           (|IntegrationResult| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|rf| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F)))))
          (|lc| (|List| F))
          (|f0|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|ff|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (LETT |ff|
                (SPADCALL |f| |x| |y| (SPADCALL |y| (QREFELT % 52))
                          (QREFELT % 28)))
          (LETT |f0| (SPADCALL |ff| (QREFELT % 101)))
          (LETT |lc| (|INTG0;field_gens| |y| (LIST |f|) %))
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| |lc| %))
          (LETT |rf|
                (|INTG0;mkRat|
                 (SPADCALL (SPADCALL |ff| (QREFELT % 102)) |x|
                           (SPADCALL |y| (QREFELT % 73)) (QREFELT % 103))
                 (QVELT |pr| 1) (QVELT |pr| 2) %))
          (LETT |irf| (SPADCALL |rf| (QREFELT % 107)))
          (LETT |irf1|
                (SPADCALL
                 (CONS #'|INTG0;palgint0;F2KFSupIr;10!0| (VECTOR % |pr|)) |irf|
                 (QREFELT % 112)))
          (COND
           ((NULL (NULL (QVELT |pr| 2)))
            (LETT |irf1|
                  (SPADCALL |irf1| (|SPADfirst| (QVELT |pr| 2))
                            (QREFELT % 97)))))
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTG0;palgint0;F2KFSupIr;10!1| (VECTOR % |x|))
                      (SPADCALL (SPADCALL |f0| (QREFELT % 113))
                                (QREFELT % 107))
                      (QREFELT % 112))
            |irf1| (QREFELT % 114)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;10!1| ((|f1| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |f1| (SPADCALL |x| (QREFELT % 73)) (QREFELT % 109)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;10!0| ((|f1| NIL) ($$ NIL))
        (PROG (|pr| %)
          (LETT |pr| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| (QVELT |pr| 0) (QREFELT % 109)))))) 

(SDEFUN |INTG0;sqrt_in_field| ((|a| (F)) (|lc| (|List| F)) (% (F)))
        (SPROG
         ((|ff| #1=(|SparseUnivariatePolynomial| F))
          (|lfac|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fp| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|pol| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |pol|
                (SPADCALL (SPADCALL (|spadConstant| % 64) 2 (QREFELT % 116))
                          (SPADCALL |a| (QREFELT % 117)) (QREFELT % 118)))
          (LETT |fp| (SPADCALL |pol| |lc| (QREFELT % 121)))
          (LETT |lfac| (SPADCALL |fp| (QREFELT % 39)))
          (LETT |ff| (QVELT (|SPADfirst| |lfac|) 1))
          (EXIT
           (COND
            ((EQL (SPADCALL |ff| (QREFELT % 71)) 1)
             (SPADCALL
              (SPADCALL (SPADCALL |ff| 0 (QREFELT % 59))
                        (SPADCALL |ff| 1 (QREFELT % 59)) (QREFELT % 88))
              (QREFELT % 74)))
            ('T (SPADCALL |a| (QREFELT % 122)))))))) 

(SDEFUN |INTG0;quadsubst|
        ((|x| (|Kernel| F)) (|y| (|Kernel| F)) (|den| (F))
         (|p| (|SparseUnivariatePolynomial| F)) (|lc| (|List| F))
         (%
          (|Record| (|:| |diff| F)
                    (|:| |subs|
                         (|Record| (|:| |coeff| F)
                                   (|:| |var| (|List| (|Kernel| F)))
                                   (|:| |val| (|List| F))))
                    (|:| |newk| (|List| (|Kernel| F))))))
        (SPROG
         ((|yy| (F)) (|ux| (F)) (|q| (F)) (|xx| (F)) (|sc| (F)) (|u2ma| (F))
          (|ua| (F)) (|bm2u| (F)) (|sa| (F)) (|a| (F)) (|c| (F)) (|b| (F))
          (|u| (F)))
         (SEQ (LETT |u| (SPADCALL (QREFELT % 13) (QREFELT % 73)))
              (LETT |b| (SPADCALL |p| 1 (QREFELT % 59)))
              (LETT |c| (SPADCALL |p| 0 (QREFELT % 59)))
              (LETT |a| (SPADCALL |p| 2 (QREFELT % 59)))
              (LETT |sa| (|INTG0;sqrt_in_field| |a| |lc| %))
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL (SPADCALL |b| |b| (QREFELT % 123))
                            (SPADCALL (SPADCALL 4 |a| (QREFELT % 125)) |c|
                                      (QREFELT % 123))
                            (QREFELT % 126))
                  (QREFELT % 127))
                 (VECTOR (SPADCALL |x| (QREFELT % 73))
                         (VECTOR (|spadConstant| % 64) (LIST |x| |y|)
                                 (LIST |u|
                                       (SPADCALL
                                        (SPADCALL |sa|
                                                  (SPADCALL |u|
                                                            (SPADCALL |b|
                                                                      (SPADCALL
                                                                       2 |a|
                                                                       (QREFELT
                                                                        % 125))
                                                                      (QREFELT
                                                                       % 88))
                                                            (QREFELT % 86))
                                                  (QREFELT % 123))
                                        (SPADCALL |den| |x| |u| (QREFELT % 75))
                                        (QREFELT % 88))))
                         NIL))
                ((NULL (|INTG0;kerdiff| |sa| |a| %))
                 (SEQ
                  (LETT |bm2u|
                        (SPADCALL |b|
                                  (SPADCALL (SPADCALL 2 |u| (QREFELT % 125))
                                            |sa| (QREFELT % 123))
                                  (QREFELT % 126)))
                  (LETT |q|
                        (SPADCALL |den| |x|
                                  (LETT |xx|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |u| 2 (QREFELT % 128)) |c|
                                          (QREFELT % 126))
                                         |bm2u| (QREFELT % 88)))
                                  (QREFELT % 75)))
                  (LETT |yy|
                        (SPADCALL
                         (LETT |ua|
                               (SPADCALL |u|
                                         (SPADCALL |xx| |sa| (QREFELT % 123))
                                         (QREFELT % 86)))
                         |q| (QREFELT % 88)))
                  (EXIT
                   (VECTOR
                    (SPADCALL
                     (SPADCALL |den| (SPADCALL |y| (QREFELT % 73))
                               (QREFELT % 123))
                     (SPADCALL (SPADCALL |x| (QREFELT % 73)) |sa|
                               (QREFELT % 123))
                     (QREFELT % 126))
                    (VECTOR
                     (SPADCALL (SPADCALL 2 |ua| (QREFELT % 125)) |bm2u|
                               (QREFELT % 88))
                     (LIST |x| |y|) (LIST |xx| |yy|))
                    NIL))))
                ('T
                 (SEQ
                  (LETT |u2ma|
                        (SPADCALL (SPADCALL |u| 2 (QREFELT % 128)) |a|
                                  (QREFELT % 126)))
                  (LETT |sc| (|INTG0;sqrt_in_field| |c| |lc| %))
                  (LETT |q|
                        (SPADCALL |den| |x|
                                  (LETT |xx|
                                        (SPADCALL
                                         (SPADCALL |b|
                                                   (SPADCALL
                                                    (SPADCALL 2 |u|
                                                              (QREFELT % 125))
                                                    |sc| (QREFELT % 123))
                                                   (QREFELT % 126))
                                         |u2ma| (QREFELT % 88)))
                                  (QREFELT % 75)))
                  (LETT |yy|
                        (SPADCALL
                         (LETT |ux|
                               (SPADCALL (SPADCALL |xx| |u| (QREFELT % 123))
                                         |sc| (QREFELT % 86)))
                         |q| (QREFELT % 88)))
                  (EXIT
                   (VECTOR
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |den| (SPADCALL |y| (QREFELT % 73))
                                (QREFELT % 123))
                      |sc| (QREFELT % 126))
                     (SPADCALL |x| (QREFELT % 73)) (QREFELT % 88))
                    (VECTOR
                     (SPADCALL
                      (SPADCALL (SPADCALL 2 |ux| (QREFELT % 125)) |u2ma|
                                (QREFELT % 88))
                      (QREFELT % 74))
                     (LIST |x| |y|) (LIST |xx| |yy|))
                    (|INTG0;kerdiff| |sc| |c| %)))))))))) 

(SDEFUN |INTG0;mkRatlx|
        ((|f| (F)) (|x| (|Kernel| F)) (|y| (|Kernel| F)) (|t| (F))
         (|z| (|Kernel| F))
         (|dx| (|Fraction| (|SparseUnivariatePolynomial| F))) (|r| (F))
         (% (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG ((|f1| (F)))
               (SEQ
                (LETT |f1|
                      (SPADCALL |f| |y|
                                (SPADCALL |r| (SPADCALL |z| (QREFELT % 73))
                                          (QREFELT % 123))
                                (QREFELT % 75)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |f1| |x| |t| (QREFELT % 75)) |z|
                            (QREFELT % 22))
                  |dx| (QREFELT % 129)))))) 

(SDEFUN |INTG0;mkRat|
        ((|f| (F))
         (|rec|
          (|Record| (|:| |coeff| F) (|:| |var| (|List| (|Kernel| F)))
                    (|:| |val| (|List| F))))
         (|l| (|List| (|Kernel| F)))
         (% (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG ((|rat| (|Fraction| (|SparseUnivariatePolynomial| F))))
               (SEQ
                (LETT |rat|
                      (SPADCALL
                       (|INTG0;checkroot|
                        (SPADCALL (QVELT |rec| 0)
                                  (SPADCALL |f| (QVELT |rec| 1) (QVELT |rec| 2)
                                            (QREFELT % 130))
                                  (QREFELT % 123))
                        |l| %)
                       (QREFELT % 13) (QREFELT % 22)))
                (EXIT
                 (SPADCALL (SPADCALL |rat| (QREFELT % 131))
                           (SPADCALL |rat| (QREFELT % 132)) (QREFELT % 133)))))) 

(SDEFUN |INTG0;ev|
        ((|x1| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|y1| (|Fraction| (|SparseUnivariatePolynomial| F))) (% (F)))
        (SPADCALL
         (SPADCALL (SPADCALL |x1| |y1| (QREFELT % 134)) (QREFELT % 135))
         (QREFELT % 136))) 

(SDEFUN |INTG0;palgint0;F3KFFFIr;16|
        ((|f| (F)) (|x| (|Kernel| F)) (|y| (|Kernel| F)) (|z| (|Kernel| F))
         (|xx| (F)) (|dx| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|r| (F)) (% (|IntegrationResult| F)))
        (SPROG
         ((|pp| (|IntegrationResult| F))
          (|y1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|res1|
           (|IntegrationResult|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (LETT |res1|
                (SPADCALL (|INTG0;mkRatlx| |f| |x| |y| |xx| |z| |dx| |r| %)
                          (QREFELT % 107)))
          (LETT |y1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |y| (QREFELT % 73)) |r| (QREFELT % 88))
                  (QREFELT % 117))
                 (QREFELT % 137)))
          (EXIT
           (LETT |pp|
                 (SPADCALL
                  (CONS #'|INTG0;palgint0;F3KFFFIr;16!0| (VECTOR % |y1|))
                  |res1| (QREFELT % 112))))))) 

(SDEFUN |INTG0;palgint0;F3KFFFIr;16!0| ((|x1| NIL) ($$ NIL))
        (PROG (|y1| %)
          (LETT |y1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|INTG0;ev| |x1| |y1| %))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMKFFFU;17|
        ((|f| (F)) (|g| (F)) (|x| (|Kernel| F)) (|y| (|Kernel| F))
         (|rischde| (|Mapping| #1=(|Union| F #2="failed") F F (|Symbol|)))
         (|z| (|Kernel| F)) (|xx| (F))
         (|dx| (|Fraction| (|SparseUnivariatePolynomial| F))) (|r| (F))
         (% (|Union| F #2#)))
        (SPROG ((|u| #1#) (#3=#:G139 NIL) (|g1| (F)) (|f1| (F)))
               (SEQ
                (LETT |f1|
                      (SPADCALL |f| |y|
                                (SPADCALL |r| (SPADCALL |z| (QREFELT % 73))
                                          (QREFELT % 123))
                                (QREFELT % 75)))
                (LETT |g1|
                      (SPADCALL |g| |y|
                                (SPADCALL |r| (SPADCALL |z| (QREFELT % 73))
                                          (QREFELT % 123))
                                (QREFELT % 75)))
                (LETT |u|
                      (SPADCALL (SPADCALL |f1| |x| |xx| (QREFELT % 75))
                                (SPADCALL (SPADCALL |dx| |z| (QREFELT % 139))
                                          (SPADCALL |g1| |x| |xx|
                                                    (QREFELT % 75))
                                          (QREFELT % 123))
                                (PROG2
                                    (LETT #3# (SPADCALL |z| (QREFELT % 141)))
                                    (QCDR #3#)
                                  (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                                  (|Union| (|Symbol|) "failed")
                                                  #3#))
                                |rischde|))
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |u|) |z|
                                        (SPADCALL (SPADCALL |y| (QREFELT % 73))
                                                  |r| (QREFELT % 88))
                                        (QREFELT % 75))))))))) 

(SDEFUN |INTG0;multivariate;SupK2F;18|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|x| (|Kernel| F)) (|y| (F)) (% (F)))
        (SPROG NIL
               (SPADCALL
                (SPADCALL
                 (CONS #'|INTG0;multivariate;SupK2F;18!0| (VECTOR % |x|)) |p|
                 (QREFELT % 146))
                |y| (QREFELT % 147)))) 

(SDEFUN |INTG0;multivariate;SupK2F;18!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT % 139)))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMFSupU;19|
        ((|f| (F)) (|g| (F)) (|x| (|Kernel| F)) (|y| (|Kernel| F))
         (|rischde| (|Mapping| #1=(|Union| F #2="failed") F F (|Symbol|)))
         (|den| (F)) (|radi| (|SparseUnivariatePolynomial| F))
         (% (|Union| F #2#)))
        (SPROG
         ((|u| #1#) (#3=#:G163 NIL)
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F)))))
          (|lc| (|List| F)))
         (SEQ (LETT |lc| (|INTG0;field_gens| |y| (LIST |f| |g|) %))
              (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| |lc| %))
              (LETT |u|
                    (SPADCALL
                     (|INTG0;checkroot|
                      (SPADCALL |f| (QVELT (QVELT |pr| 1) 1)
                                (QVELT (QVELT |pr| 1) 2) (QREFELT % 130))
                      (QVELT |pr| 2) %)
                     (|INTG0;checkroot|
                      (SPADCALL (QVELT (QVELT |pr| 1) 0)
                                (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                          (QVELT (QVELT |pr| 1) 2)
                                          (QREFELT % 130))
                                (QREFELT % 123))
                      (QVELT |pr| 2) %)
                     (PROG2
                         (LETT #3# (SPADCALL (QREFELT % 13) (QREFELT % 141)))
                         (QCDR #3#)
                       (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                       (|Union| (|Symbol|) "failed") #3#))
                     |rischde|))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (SPADCALL (QCDR |u|) (QREFELT % 13) (QVELT |pr| 0)
                                      (QREFELT % 75))))))))) 

(SDEFUN |INTG0;palgLODE0;LF2KFSupR;20|
        ((|eq| (L)) (|g| (F)) (|x| (|Kernel| F)) (|y| (|Kernel| F)) (|den| (F))
         (|radi| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |particular| (|Union| F "failed"))
                    (|:| |basis| (|List| F)))))
        (SPROG
         ((#1=#:G177 NIL) (|bas| (|List| F)) (#2=#:G187 NIL) (|b| NIL)
          (#3=#:G186 NIL)
          (|rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Fraction| (|SparseUnivariatePolynomial| F))
                          #4="failed"))
            (|:| |basis|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|di|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|op|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#5=#:G185 NIL) (|i| NIL)
          (|d|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F)))))
          (|lc| (|List| F)))
         (SEQ
          (LETT |lc|
                (|INTG0;field_gens| |y|
                 (CONS |g| (SPADCALL |eq| (QREFELT % 149))) %))
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| |lc| %))
          (LETT |d|
                (SPADCALL
                 (|INTG0;univ|
                  (SPADCALL (QVELT (QVELT |pr| 1) 0) (QREFELT % 150))
                  (QVELT |pr| 2) (QREFELT % 13) %)
                 1 (QREFELT % 152)))
          (LETT |di| (|spadConstant| % 153)) (LETT |op| (|spadConstant| % 154))
          (SEQ (LETT |i| 0) (LETT #5# (SPADCALL |eq| (QREFELT % 155))) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (|INTG0;univ|
                                  (SPADCALL (SPADCALL |eq| |i| (QREFELT % 156))
                                            (QVELT (QVELT |pr| 1) 1)
                                            (QVELT (QVELT |pr| 1) 2)
                                            (QREFELT % 130))
                                  (QVELT |pr| 2) (QREFELT % 13) %)
                                 |di| (QREFELT % 157))
                                (QREFELT % 158)))
                (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT % 159)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL |op|
                          (|INTG0;univ|
                           (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                     (QVELT (QVELT |pr| 1) 2) (QREFELT % 130))
                           (QVELT |pr| 2) (QREFELT % 13) %)
                          (QREFELT % 163)))
          (LETT |bas|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |b| NIL) (LETT #2# (QCDR |rec|)) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL |b| (QVELT |pr| 0) (QREFELT % 109))
                               #3#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (EXIT
           (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                 ('T
                  (CONS
                   (CONS 0
                         (SPADCALL
                          (PROG2 (LETT #1# (QCAR |rec|))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|Fraction|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT % 7)))
                                            (|Union|
                                             (|Fraction|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT % 7)))
                                             #4#)
                                            #1#))
                          (QVELT |pr| 0) (QREFELT % 109)))
                   |bas|))))))) 

(SDEFUN |INTG0;palgLODE0;LF3KFFFR;21|
        ((|eq| (L)) (|g| (F)) (|x| (|Kernel| F)) (|y| (|Kernel| F))
         (|kz| (|Kernel| F)) (|xx| (F))
         (|dx| (|Fraction| (|SparseUnivariatePolynomial| F))) (|r| (F))
         (%
          (|Record| (|:| |particular| (|Union| F "failed"))
                    (|:| |basis| (|List| F)))))
        (SPROG
         ((#1=#:G196 NIL) (|bas| (|List| F)) (#2=#:G205 NIL) (|b| NIL)
          (#3=#:G204 NIL)
          (|yinv| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Fraction| (|SparseUnivariatePolynomial| F))
                          #4="failed"))
            (|:| |basis|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|g1| (F))
          (|di|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|op|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|c1| (F)) (#5=#:G203 NIL) (|i| NIL) (|y1| (F))
          (|d|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (LETT |d|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |dx| |kz| (QREFELT % 139))
                            (QREFELT % 150))
                  |kz| (QREFELT % 22))
                 1 (QREFELT % 152)))
          (LETT |di| (|spadConstant| % 153)) (LETT |op| (|spadConstant| % 154))
          (LETT |y1|
                (SPADCALL |r| (SPADCALL |kz| (QREFELT % 73)) (QREFELT % 123)))
          (SEQ (LETT |i| 0) (LETT #5# (SPADCALL |eq| (QREFELT % 155))) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (LETT |c1|
                      (SPADCALL (SPADCALL |eq| |i| (QREFELT % 156)) |y| |y1|
                                (QREFELT % 75)))
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL |c1| |x| |xx| (QREFELT % 75)) |kz|
                                  (QREFELT % 22))
                                 |di| (QREFELT % 157))
                                (QREFELT % 158)))
                (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT % 159)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |g1| (SPADCALL |g| |y| |y1| (QREFELT % 75)))
          (LETT |rec|
                (SPADCALL |op|
                          (SPADCALL (SPADCALL |g1| |x| |xx| (QREFELT % 75))
                                    |kz| (QREFELT % 22))
                          (QREFELT % 163)))
          (LETT |yinv|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |y| (QREFELT % 73)) |r| (QREFELT % 88))
                  (QREFELT % 117))
                 (QREFELT % 137)))
          (LETT |bas|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |b| NIL) (LETT #2# (QCDR |rec|)) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #3# (CONS (|INTG0;ev| |b| |yinv| %) #3#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (EXIT
           (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                 ('T
                  (CONS
                   (CONS 0
                         (|INTG0;ev|
                          (PROG2 (LETT #1# (QCAR |rec|))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|Fraction|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT % 7)))
                                            (|Union|
                                             (|Fraction|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT % 7)))
                                             #4#)
                                            #1#))
                          |yinv| %))
                   |bas|))))))) 

(DECLAIM (NOTINLINE |GenusZeroIntegration;|)) 

(DEFUN |GenusZeroIntegration;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|GenusZeroIntegration| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 167))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#3|
                                                             (LIST
                                                              '|LinearOrdinaryDifferentialOperatorCategory|
                                                              (|devaluate|
                                                               |#2|)))))))
          (|haddProp| |$ConstructorCache| '|GenusZeroIntegration|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 13 (SPADCALL (SPADCALL (QREFELT % 10)) (QREFELT % 12)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 165
                       (CONS
                        (|dispatchFunction| |INTG0;palgLODE0;LF2KFSupR;20|) %))
             (QSETREFV % 166
                       (CONS (|dispatchFunction| |INTG0;palgLODE0;LF3KFFFR;21|)
                             %)))))
          %))) 

(DEFUN |GenusZeroIntegration| (&REST #1=#:G206)
  (SPROG NIL
         (PROG (#2=#:G207)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GenusZeroIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GenusZeroIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GenusZeroIntegration|)))))))))) 

(MAKEPROP '|GenusZeroIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (0 . |new|) (|Kernel| 7) (4 . |kernel|)
              '|dummy| (|List| 21) (9 . |kernels|) (|List| 11)
              (14 . |setDifference|) (|ElementaryFunctionStructurePackage| 6 7)
              (20 . |rootNormalize|) (|Fraction| 51) (|Kernel| %)
              (26 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 11) 11
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 11)
                                                     7)
              (32 . |univariate|) (|SparseUnivariatePolynomial| 105)
              |INTG0;lift;SupKSup;5| |INTG0;univariate;F2KSupSup;4|
              (|Mapping| 105 7) (|SparseUnivariatePolynomialFunctions2| 7 105)
              (39 . |map|) (|Factored| %) (45 . |squareFree|) (50 . |One|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 35) (|:| |factor| 23) (|:| |exponent| 40))
              (|List| 36) (|Factored| 23) (54 . |factorList|)
              (|NonNegativeInteger|) (59 . ^) (65 . *) (|Boolean|) (71 . ~=)
              (77 . |unit|) (82 . |ground|)
              (|Record| (|:| |exponent| 40) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 11) 11 6
                                 (|SparseMultivariatePolynomial| 6 11) 7)
              (87 . |froot|) (93 . *) (|SparseUnivariatePolynomial| %)
              (99 . |minPoly|) (|SparseUnivariatePolynomial| 23)
              (|Mapping| 23 7) (|SparseUnivariatePolynomialFunctions2| 7 23)
              (104 . |map|) (110 . |Zero|) (114 . |Zero|) (118 . |coefficient|)
              (|Mapping| 7 23) (|SparseUnivariatePolynomialFunctions2| 23 7)
              (124 . |map|) (130 . |One|) (134 . |One|) (138 . |One|)
              (142 . |Zero|) (146 . =) (152 . |gcd|) (|Union| % '"failed")
              (158 . |exquo|) (164 . |degree|) (169 . |rem|) (175 . |coerce|)
              (180 . -) (185 . |eval|) (|Mapping| 7 7) (192 . |map|) (198 . ~=)
              (|Integer|) (|Fraction| 79) (204 . |coerce|) (209 . /) (215 . +)
              (|IntegrationResult| 7) (221 . |ratpart|) (226 . +)
              (232 . |coerce|) (237 . /)
              (|Record| (|:| |scalar| 80) (|:| |coeff| 23) (|:| |logand| 23))
              (|List| 89) (243 . |logpart|) (248 . |concat|)
              (|Record| (|:| |integrand| 7) (|:| |intvar| 7)) (|List| 93)
              (254 . |notelem|) (259 . |mkAnswer|)
              |INTG0;rationalize_ir;IrKIr;8| (|List| %) (266 . |algtower|)
              (271 . =) (277 . |reductum|) (282 . |leadingMonomial|)
              |INTG0;multivariate;SupK2F;18| (|IntegrationResult| 105)
              (|Fraction| 23) (|RationalIntegration| 7 23) (287 . |integrate|)
              (|Fraction| %) (292 . |elt|) (|Mapping| 7 105)
              (|IntegrationResultFunctions2| 105 7) (298 . |map|)
              (304 . |retract|) (309 . +) |INTG0;palgint0;F2KFSupIr;10|
              (315 . |monomial|) (321 . |coerce|) (326 . -) (|List| 7)
              (|ExpressionFactorPolynomial| 6 7) (332 . |factor|)
              (338 . |sqrt|) (343 . *) (|PositiveInteger|) (349 . *) (355 . -)
              (361 . |zero?|) (366 . ^) (372 . *) (378 . |eval|)
              (385 . |numer|) (390 . |denom|) (395 . /) (401 . |elt|)
              (407 . |retract|) (412 . |retract|) (417 . |coerce|)
              |INTG0;palgint0;F3KFFFIr;16| (422 . |multivariate|)
              (|Union| 9 '"failed") (428 . |symbolIfCan|)
              (|Union| 7 '#1="failed") (|Mapping| 142 7 7 9)
              |INTG0;palgRDE0;2F2KMKFFFU;17|
              (|SparseUnivariatePolynomialFunctions2| 105 7) (433 . |map|)
              (439 . |elt|) |INTG0;palgRDE0;2F2KMFSupU;19|
              (445 . |coefficients|) (450 . |inv|)
              (|LinearOrdinaryDifferentialOperator1| 105) (455 . |monomial|)
              (461 . |One|) (465 . |Zero|) (469 . |degree|)
              (474 . |coefficient|) (480 . *) (486 . +) (492 . *)
              (|Union| 105 '"failed")
              (|Record| (|:| |particular| 160) (|:| |basis| (|List| 105)))
              (|RationalLODE| 7 23) (498 . |ratDsolve|)
              (|Record| (|:| |particular| 142) (|:| |basis| 119))
              (504 . |palgLODE0|) (514 . |palgLODE0|))
           '#(|univariate| 526 |rationalize_ir| 534 |palgint0| 540 |palgRDE0|
              560 |palgLODE0| 584 |multivariate| 606 |lift| 613)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|palgint0|
                                 ((|IntegrationResult| |#2|) |#2|
                                  (|Kernel| |#2|) (|Kernel| |#2|) |#2|
                                  (|SparseUnivariatePolynomial| |#2|)))
                                T)
                              '((|palgint0|
                                 ((|IntegrationResult| |#2|) |#2|
                                  (|Kernel| |#2|) (|Kernel| |#2|)
                                  (|Kernel| |#2|) |#2|
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial| |#2|))
                                  |#2|))
                                T)
                              '((|palgRDE0|
                                 ((|Union| |#2| #1#) |#2| |#2| (|Kernel| |#2|)
                                  (|Kernel| |#2|)
                                  (|Mapping| (|Union| |#2| #1#) |#2| |#2|
                                             (|Symbol|))
                                  |#2| (|SparseUnivariatePolynomial| |#2|)))
                                T)
                              '((|palgRDE0|
                                 ((|Union| |#2| #1#) |#2| |#2| (|Kernel| |#2|)
                                  (|Kernel| |#2|)
                                  (|Mapping| (|Union| |#2| #1#) |#2| |#2|
                                             (|Symbol|))
                                  (|Kernel| |#2|) |#2|
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial| |#2|))
                                  |#2|))
                                T)
                              '((|univariate|
                                 ((|SparseUnivariatePolynomial|
                                   (|Fraction|
                                    (|SparseUnivariatePolynomial| |#2|)))
                                  |#2| (|Kernel| |#2|) (|Kernel| |#2|)
                                  (|SparseUnivariatePolynomial| |#2|)))
                                T)
                              '((|multivariate|
                                 (|#2|
                                  (|SparseUnivariatePolynomial|
                                   (|Fraction|
                                    (|SparseUnivariatePolynomial| |#2|)))
                                  (|Kernel| |#2|) |#2|))
                                T)
                              '((|lift|
                                 ((|SparseUnivariatePolynomial|
                                   (|Fraction|
                                    (|SparseUnivariatePolynomial| |#2|)))
                                  (|SparseUnivariatePolynomial| |#2|)
                                  (|Kernel| |#2|)))
                                T)
                              '((|rationalize_ir|
                                 ((|IntegrationResult| |#2|)
                                  (|IntegrationResult| |#2|) (|Kernel| |#2|)))
                                T)
                              '((|palgLODE0|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union| |#2| #2="failed"))
                                   (|:| |basis| (|List| |#2|)))
                                  |#3| |#2| (|Kernel| |#2|) (|Kernel| |#2|)
                                  |#2| (|SparseUnivariatePolynomial| |#2|)))
                                (|has| 8
                                       (|LinearOrdinaryDifferentialOperatorCategory|
                                        7)))
                              '((|palgLODE0|
                                 ((|Record|
                                   (|:| |particular| (|Union| |#2| #2#))
                                   (|:| |basis| (|List| |#2|)))
                                  |#3| |#2| (|Kernel| |#2|) (|Kernel| |#2|)
                                  (|Kernel| |#2|) |#2|
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial| |#2|))
                                  |#2|))
                                (|has| 8
                                       (|LinearOrdinaryDifferentialOperatorCategory|
                                        7))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 166
                                            '(0 9 0 10 1 11 0 9 12 1 7 14 0 15
                                              2 16 0 0 0 17 2 18 7 7 11 19 2 7
                                              20 0 21 22 3 24 23 7 11 23 25 2
                                              30 26 29 23 31 1 23 32 0 33 0 23
                                              0 34 1 38 37 0 39 2 23 0 0 40 41
                                              2 23 0 0 0 42 2 40 43 0 0 44 1 38
                                              23 0 45 1 23 7 0 46 2 48 47 7 40
                                              49 2 23 0 7 0 50 1 7 51 21 52 2
                                              55 53 54 23 56 0 6 0 57 0 40 0 58
                                              2 23 7 0 40 59 2 61 23 60 53 62 0
                                              6 0 63 0 7 0 64 0 40 0 65 0 23 0
                                              66 2 23 43 0 0 67 2 23 0 0 0 68 2
                                              23 69 0 0 70 1 23 40 0 71 2 23 0
                                              0 0 72 1 7 0 21 73 1 7 0 0 74 3 7
                                              0 0 21 0 75 2 23 0 76 0 77 2 23
                                              43 0 0 78 1 80 0 79 81 2 80 0 0 0
                                              82 2 23 0 0 0 83 1 84 7 0 85 2 7
                                              0 0 0 86 1 7 0 79 87 2 7 0 0 0 88
                                              1 84 90 0 91 2 90 0 0 0 92 1 84
                                              94 0 95 3 84 0 7 90 94 96 1 7 14
                                              98 99 2 11 43 0 0 100 1 26 0 0
                                              101 1 26 0 0 102 1 106 104 105
                                              107 2 23 7 108 7 109 2 111 84 110
                                              104 112 1 26 105 0 113 2 84 0 0 0
                                              114 2 23 0 7 40 116 1 23 0 7 117
                                              2 23 0 0 0 118 2 120 38 23 119
                                              121 1 7 0 0 122 2 7 0 0 0 123 2 7
                                              0 124 0 125 2 7 0 0 0 126 1 7 43
                                              0 127 2 7 0 0 124 128 2 105 0 0 0
                                              129 3 7 0 0 14 98 130 1 105 23 0
                                              131 1 105 23 0 132 2 105 0 23 23
                                              133 2 23 108 108 108 134 1 105 23
                                              0 135 1 23 7 0 136 1 105 0 23 137
                                              2 24 7 105 11 139 1 11 140 0 141
                                              2 145 23 110 26 146 2 23 7 0 7
                                              147 1 8 119 0 149 1 7 0 0 150 2
                                              151 0 105 40 152 0 151 0 153 0
                                              151 0 154 1 8 40 0 155 2 8 7 0 40
                                              156 2 151 0 105 0 157 2 151 0 0 0
                                              158 2 151 0 0 0 159 2 162 161 151
                                              105 163 6 0 164 8 7 11 11 7 23
                                              165 8 0 164 8 7 11 11 11 7 105 7
                                              166 4 0 26 7 11 11 23 28 2 0 84
                                              84 11 97 5 0 84 7 11 11 7 23 115
                                              7 0 84 7 11 11 11 7 105 7 138 9 0
                                              142 7 7 11 11 143 11 7 105 7 144
                                              7 0 142 7 7 11 11 143 7 23 148 6
                                              1 164 8 7 11 11 7 23 165 8 1 164
                                              8 7 11 11 11 7 105 7 166 3 0 7 26
                                              11 7 103 2 0 26 23 11 27)))))
           '|lookupComplete|)) 
