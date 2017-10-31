
(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1|
        ((|vp| |Vector| (|SparseUnivariatePolynomial| (|Integer|)))
         (|vn| |Vector| (|Integer|)) (|sigma| |NonNegativeInteger|)
         (|prime| |Integer|) ($ |List| (|Any|)))
        (SPADCALL |vp| |vn| |sigma| |prime|
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;1!0| $)
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;1!1| $)
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;1!2| $)
                  (QREFELT $ 14))) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1!2|
        ((|x| NIL) (|pt| NIL) (|p| NIL) ($ NIL)) (|NBLM;vector_shift| |x| $)) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1!1|
        ((|x| NIL) (|pt| NIL) (|p| NIL) ($ NIL)) (|NBLM;vector_shift| |x| $)) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1!0| ((|x| NIL) ($ NIL))
        (|spadConstant| $ 7)) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2|
        ((|vp| |Vector| (|U32Vector|)) (|vn| |Vector| (|Integer|))
         (|sigma| |NonNegativeInteger|) (|prime| |Integer|) ($ |List| (|Any|)))
        (SPADCALL |vp| |vn| |sigma| |prime|
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;2!0| $)
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;2!1| $)
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;2!2| $)
                  (QREFELT $ 17))) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2!2|
        ((|x| NIL) (|pt| NIL) (|p| NIL) ($ NIL)) (|NBLM;vector_shift| |x| $)) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2!1|
        ((|x| NIL) (|pt| NIL) (|p| NIL) ($ NIL)) (|NBLM;vector_shift| |x| $)) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2!0| ((|x| NIL) ($ NIL))
        (|spadConstant| $ 7)) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3|
        ((|vp| |Vector| (|SparseUnivariatePolynomial| (|Integer|)))
         (|vn| |Vector| (|Integer|)) (|pts| |U32Vector|) (|prime| |Integer|)
         ($ |List| (|Any|)))
        (SPROG NIL
               (COND
                ((SPADCALL (QV_LEN_U32 |pts|) |prime| (QREFELT $ 20))
                 (|error|
                  "naiveBeckermannLabahnMultipoint: number of points > prime"))
                ('T
                 (SPADCALL |vp| |vn| (QV_LEN_U32 |pts|) |prime|
                           (CONS
                            #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!0|
                            (VECTOR $ |pts| |prime|))
                           (CONS
                            #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!1|
                            (VECTOR $ |pts|))
                           (ELT $ 25) (QREFELT $ 14)))))) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!1|
        ((|x| NIL) (|pt| NIL) (|p| NIL) ($$ NIL))
        (PROG (|pts| $)
          (LETT |pts| (QREFELT $$ 1)
                . #1=(|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|NBLM;mul_by_binomial_pointwise| |x| |pt| |pts| |p| $))))) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!0| ((|x| NIL) ($$ NIL))
        (PROG (|prime| |pts| $)
          (LETT |prime| (QREFELT $$ 2)
                . #1=(|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3|))
          (LETT |pts| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|sub_SI| |prime| (SPADCALL |pts| |x| (QREFELT $ 22))))))) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4|
        ((|vp| |Vector| (|U32Vector|)) (|vn| |Vector| (|Integer|))
         (|pts| |U32Vector|) (|prime| |Integer|) ($ |List| (|Any|)))
        (SPROG NIL
               (COND
                ((SPADCALL (QV_LEN_U32 |pts|) |prime| (QREFELT $ 20))
                 (|error|
                  "naiveBeckermannLabahnMultipoint: number of points > prime"))
                ('T
                 (SPADCALL |vp| |vn| (QV_LEN_U32 |pts|) |prime|
                           (CONS
                            #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!0|
                            (VECTOR $ |pts| |prime|))
                           (CONS
                            #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!1|
                            (VECTOR $ |pts|))
                           (ELT $ 25) (QREFELT $ 17)))))) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!1|
        ((|x| NIL) (|pt| NIL) (|p| NIL) ($$ NIL))
        (PROG (|pts| $)
          (LETT |pts| (QREFELT $$ 1)
                . #1=(|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|NBLM;mul_by_binomial_pointwise| |x| |pt| |pts| |p| $))))) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!0| ((|x| NIL) ($$ NIL))
        (PROG (|prime| |pts| $)
          (LETT |prime| (QREFELT $$ 2)
                . #1=(|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4|))
          (LETT |pts| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|sub_SI| |prime| (SPADCALL |pts| |x| (QREFELT $ 22))))))) 

(SDEFUN |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;5|
        ((|vp| |Vector| (|SparseUnivariatePolynomial| (|Integer|)))
         (|vn| |Vector| (|Integer|)) (|sigma| |NonNegativeInteger|)
         (|prime| |Integer|) (|pts| |Mapping| (|Integer|) (|Integer|))
         (|up_residual| |Mapping| (|Void|) (|U32Vector|) (|Integer|)
          (|Integer|))
         (|up_poly| |Mapping| (|Void|) (|U32Vector|) (|Integer|) (|Integer|))
         ($ |List| (|Any|)))
        (SPROG
         ((|p| (|SparseUnivariatePolynomial| (|Integer|)))
          (|l| (|NonNegativeInteger|)) (|vk| (|U32Vector|)) (#1=#:G757 NIL)
          (|k| NIL) (|vpa| (|Vector| (|U32Vector|))) (#2=#:G756 NIL)
          (#3=#:G755 NIL) (|m| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |m| (QVSIZE |vp|)
                   . #4=(|NBLM;naiveBeckermannLabahn1;VVNniIM2ML;5|))
             (QVSIZE |vn|) (QREFELT $ 28))
            (|error|
             "Number of polynomials and number of degrees do not agree"))
           ('T
            (SEQ
             (LETT |vpa|
                   (SPADCALL
                    (PROGN
                     (LETT #3# NIL . #4#)
                     (SEQ (LETT |k| 1 . #4#) (LETT #2# |m| . #4#) G190
                          (COND ((|greater_SI| |k| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3# (CONS (GETREFV_U32 |sigma| 0) #3#)
                                  . #4#)))
                          (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 30))
                   . #4#)
             (SEQ (LETT |k| 1 . #4#) (LETT #1# |m| . #4#) G190
                  (COND ((|greater_SI| |k| #1#) (GO G191)))
                  (SEQ (LETT |p| (SPADCALL |vp| |k| (QREFELT $ 32)) . #4#)
                       (LETT |vk| (SPADCALL |vpa| |k| (QREFELT $ 33)) . #4#)
                       (EXIT
                        (SEQ G190
                             (COND
                              ((NULL (NULL (SPADCALL |p| (QREFELT $ 34))))
                               (GO G191)))
                             (SEQ
                              (LETT |l| (SPADCALL |p| (QREFELT $ 35)) . #4#)
                              (COND
                               ((< |l| |sigma|)
                                (SETELT_U32 |vk| |l|
                                            (SPADCALL |p| (QREFELT $ 36)))))
                              (EXIT
                               (LETT |p| (SPADCALL |p| (QREFELT $ 37)) . #4#)))
                             NIL (GO G190) G191 (EXIT NIL))))
                  (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL |vpa| |vn| |sigma| |prime| |pts| |up_residual|
                        |up_poly| (QREFELT $ 17))))))))) 

(SDEFUN |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;6|
        ((|vpa| |Vector| (|U32Vector|)) (|vn| |Vector| (|Integer|))
         (|sigma| |NonNegativeInteger|) (|prime| |Integer|)
         (|pts| |Mapping| (|Integer|) (|Integer|))
         (|up_residual| |Mapping| (|Void|) (|U32Vector|) (|Integer|)
          (|Integer|))
         (|up_poly| |Mapping| (|Void|) (|U32Vector|) (|Integer|) (|Integer|))
         ($ |List| (|Any|)))
        (SPROG
         ((|vd| (|Vector| (|Integer|))) (#1=#:G775 NIL) (|k| NIL)
          (#2=#:G774 NIL) (|m2| (|Integer|)) (|vk| (|U32Vector|))
          (#3=#:G773 NIL) (|mp| (|Vector| (|U32Vector|))) (|m1| (|Integer|))
          (#4=#:G772 NIL) (|m| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |m| (QVSIZE |vpa|)
                   . #5=(|NBLM;naiveBeckermannLabahn1;VVNniIM2ML;6|))
             (QVSIZE |vn|) (QREFELT $ 28))
            (|error|
             "Number of polynomials and number of degrees do not agree"))
           ('T
            (SEQ (LETT |m1| 0 . #5#)
                 (SEQ (LETT |k| 1 . #5#) (LETT #4# |m| . #5#) G190
                      (COND ((|greater_SI| |k| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |m1|
                              (+ (+ |m1| (SPADCALL |vn| |k| (QREFELT $ 38))) 1)
                              . #5#)))
                      (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191
                      (EXIT NIL))
                 (LETT |mp| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #5#)
                 (LETT |m2| 0 . #5#)
                 (SEQ (LETT |k| 1 . #5#) (LETT #3# |m| . #5#) G190
                      (COND ((|greater_SI| |k| #3#) (GO G191)))
                      (SEQ
                       (SPADCALL |mp| |k| (GETREFV_U32 |m1| 0) (QREFELT $ 39))
                       (LETT |vk| (SPADCALL |mp| |k| (QREFELT $ 33)) . #5#)
                       (SETELT_U32 |vk| |m2| 1)
                       (EXIT
                        (LETT |m2|
                              (+ (+ |m2| (SPADCALL |vn| |k| (QREFELT $ 38))) 1)
                              . #5#)))
                      (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191
                      (EXIT NIL))
                 (LETT |vd|
                       (SPADCALL
                        (PROGN
                         (LETT #2# NIL . #5#)
                         (SEQ (LETT |k| 1 . #5#) (LETT #1# |m| . #5#) G190
                              (COND ((|greater_SI| |k| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |vn| |k| (QREFELT $ 38))
                                            #2#)
                                      . #5#)))
                              (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 41))
                       . #5#)
                 (SPADCALL |mp| |vpa| |vd| |sigma| |prime| |pts| |up_residual|
                           |up_poly| (QREFELT $ 42))
                 (EXIT
                  (LIST (SPADCALL |mp| (QREFELT $ 45))
                        (SPADCALL |vpa| (QREFELT $ 45))
                        (SPADCALL |vd| (QREFELT $ 47)))))))))) 

(SDEFUN |NBLM;vector_shift| ((|v| |U32Vector|) ($ |Void|))
        (SPROG ((|i| (|SingleInteger|)) (|n| (|SingleInteger|)))
               (SEQ (LETT |n| (QV_LEN_U32 |v|) . #1=(|NBLM;vector_shift|))
                    (LETT |i| (|sub_SI| |n| 1) . #1#)
                    (SEQ G190 (COND ((NULL (|less_SI| 0 |i|)) (GO G191)))
                         (SEQ
                          (SETELT_U32 |v| |i| (ELT_U32 |v| (|sub_SI| |i| 1)))
                          (EXIT (LETT |i| (|sub_SI| |i| 1) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SETELT_U32 |v| 0 0))))) 

(SDEFUN |NBLM;mul_by_binomial_pointwise|
        ((|v| |U32Vector|) (|pt| |Integer|) (|pts| |U32Vector|) (|p| |Integer|)
         ($ |Void|))
        (SPROG
         ((|pp| (|Integer|)) (#1=#:G784 NIL) (|i| NIL) (|n| (|SingleInteger|)))
         (SEQ
          (LETT |n| (QV_LEN_U32 |v|) . #2=(|NBLM;mul_by_binomial_pointwise|))
          (EXIT
           (SEQ (LETT |i| 0 . #2#) (LETT #1# (|sub_SI| |n| 1) . #2#) G190
                (COND ((|greater_SI| |i| #1#) (GO G191)))
                (SEQ
                 (LETT |pp| (|addmod_SI| (ELT_U32 |pts| |i|) |pt| |p|) . #2#)
                 (EXIT
                  (SETELT_U32 |v| |i|
                              (QSMULMOD32 (ELT_U32 |v| |i|) |pp| |p|))))
                (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |NBLM;naiveBeckermannLabahn0;2VVNniIM2MV;9|
        ((|mp| |Vector| (|U32Vector|)) (|vp| |Vector| (|U32Vector|))
         (|vd| |Vector| (|Integer|)) (|sigma| |NonNegativeInteger|)
         (|p| |Integer|) (|pts| |Mapping| (|Integer|) (|Integer|))
         (|up_residual| |Mapping| (|Void|) (|U32Vector|) (|Integer|)
          (|Integer|))
         (|up_poly| |Mapping| (|Void|) (|U32Vector|) (|Integer|) (|Integer|))
         ($ |Void|))
        (SPROG
         ((|vckinv| (|Integer|)) (#1=#:G802 NIL) (|k| NIL)
          (|vcinv| (|Integer|)) (|maxd| (|Integer|)) (|cpi| (|Integer|))
          (|pi| (|Integer|)) (#2=#:G801 NIL) (|pt| (|Integer|)) (#3=#:G800 NIL)
          (|l| NIL) (|s1| #4=(|Integer|)) (|m1| #4#)
          (|vc| (|Vector| (|Integer|))) (|m| (|NonNegativeInteger|)))
         (SEQ
          (LETT |m| (QVSIZE |vd|)
                . #5=(|NBLM;naiveBeckermannLabahn0;2VVNniIM2MV;9|))
          (LETT |vc| (MAKEARR1 |m| 0) . #5#)
          (LETT |m1| (- (QV_LEN_U32 (SPADCALL |mp| 1 (QREFELT $ 33))) 1) . #5#)
          (LETT |s1| (- |sigma| 1) . #5#)
          (EXIT
           (SEQ (LETT |l| 0 . #5#) (LETT #3# |s1| . #5#) G190
                (COND ((|greater_SI| |l| #3#) (GO G191)))
                (SEQ (LETT |pt| (SPADCALL |l| |pts|) . #5#)
                     (LETT |maxd| -1 . #5#) (LETT |pi| 0 . #5#)
                     (SEQ (LETT |k| 1 . #5#) (LETT #2# |m| . #5#) G190
                          (COND ((|greater_SI| |k| #2#) (GO G191)))
                          (SEQ
                           (SPADCALL |vc| |k|
                                     (ELT_U32
                                      (SPADCALL |vp| |k| (QREFELT $ 33)) |l|)
                                     (QREFELT $ 48))
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |vc| |k| (QREFELT $ 38)) 0
                                        (QREFELT $ 49))
                              (COND
                               ((< |maxd| (SPADCALL |vd| |k| (QREFELT $ 38)))
                                (SEQ (LETT |pi| |k| . #5#)
                                     (LETT |cpi|
                                           (SPADCALL |vc| |k| (QREFELT $ 38))
                                           . #5#)
                                     (EXIT
                                      (LETT |maxd|
                                            (SPADCALL |vd| |k| (QREFELT $ 38))
                                            . #5#)))))))))
                          (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT
                      (COND ((EQL |pi| 0) "iterate")
                            ('T
                             (SEQ
                              (LETT |vcinv|
                                    (QSMULMOD32 (- |p| 1)
                                                (SPADCALL
                                                 (SPADCALL |vc| |pi|
                                                           (QREFELT $ 38))
                                                 |p| (QREFELT $ 50))
                                                |p|)
                                    . #5#)
                              (SEQ (LETT |k| 1 . #5#) (LETT #1# |m| . #5#) G190
                                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |vc| |k| (QREFELT $ 38)) 0
                                        (QREFELT $ 49))
                                       (COND
                                        ((>= (SPADCALL |vd| |k| (QREFELT $ 38))
                                             0)
                                         (COND
                                          ((SPADCALL |k| |pi| (QREFELT $ 49))
                                           (SEQ
                                            (LETT |vckinv|
                                                  (QSMULMOD32 |vcinv|
                                                              (SPADCALL |vc|
                                                                        |k|
                                                                        (QREFELT
                                                                         $ 38))
                                                              |p|)
                                                  . #5#)
                                            (SPADCALL
                                             (SPADCALL |vp| |k| (QREFELT $ 33))
                                             (SPADCALL |vp| |pi|
                                                       (QREFELT $ 33))
                                             |l| |s1| |vckinv| |p|
                                             (QREFELT $ 51))
                                            (EXIT
                                             (SPADCALL (QAREF1O |mp| |k| 1)
                                                       (QAREF1O |mp| |pi| 1) 0
                                                       |m1| |vckinv| |p|
                                                       (QREFELT $
                                                                51))))))))))))
                                   (LETT |k| (|inc_SI| |k|) . #5#) (GO G190)
                                   G191 (EXIT NIL))
                              (SPADCALL |vd| |pi|
                                        (- (SPADCALL |vd| |pi| (QREFELT $ 38))
                                           1)
                                        (QREFELT $ 48))
                              (EXIT
                               (COND
                                ((>= (SPADCALL |vd| |pi| (QREFELT $ 38)) 0)
                                 (SEQ
                                  (SPADCALL (SPADCALL |vp| |pi| (QREFELT $ 33))
                                            |pt| |p| |up_residual|)
                                  (EXIT
                                   (SPADCALL (QAREF1O |mp| |pi| 1) |pt| |p|
                                             |up_poly|)))))))))))
                (LETT |l| (|inc_SI| |l|) . #5#) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |NBLM;critical_index|
        ((|m| |TwoDimensionalArray| (|U32Vector|)) (|i| |Integer|)
         (|d| |Integer|) (|vn| |Vector| (|Integer|)) ($ |Integer|))
        (SPROG
         ((#1=#:G808 NIL) (#2=#:G809 NIL) (|pa| (|U32Vector|))
          (|nj| (|Integer|)) (#3=#:G810 NIL) (|j| NIL)
          (|nc| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nc| (QVSIZE |vn|) . #4=(|NBLM;critical_index|))
                (SEQ (LETT |j| 1 . #4#) (LETT #3# |nc| . #4#) G190
                     (COND ((|greater_SI| |j| #3#) (GO G191)))
                     (SEQ
                      (LETT |nj| (- (SPADCALL |vn| |j| (QREFELT $ 38)) |d|)
                            . #4#)
                      (EXIT
                       (COND ((< |nj| 0) "iterate")
                             ('T
                              (SEQ
                               (EXIT
                                (SEQ
                                 (LETT |pa| (QAREF2O |m| |i| |j| 1 1) . #4#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL (ELT_U32 |pa| |nj|) 0
                                              (QREFELT $ 49))
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# |j| . #4#)
                                            (GO #5=#:G807))
                                           . #4#)
                                     (GO #6=#:G803)))))))
                               #6# (EXIT #1#))))))
                     (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (|error| "Incorrect defect"))))
          #5# (EXIT #2#)))) 

(SDEFUN |NBLM;swap_rows|
        ((|m| |TwoDimensionalArray| (|U32Vector|)) (|i| |Integer|)
         (|j| |Integer|) ($ |Void|))
        (SPROG
         ((|t2| #1=(|U32Vector|)) (|t1| #1#) (#2=#:G815 NIL) (|k| NIL)
          (|kmax| (|NonNegativeInteger|)))
         (SEQ
          (COND ((EQL |i| |j|) "nothing")
                ('T
                 (SEQ (LETT |kmax| (ANCOLS |m|) . #3=(|NBLM;swap_rows|))
                      (EXIT
                       (SEQ (LETT |k| 1 . #3#) (LETT #2# |kmax| . #3#) G190
                            (COND ((|greater_SI| |k| #2#) (GO G191)))
                            (SEQ (LETT |t1| (QAREF2O |m| |i| |k| 1 1) . #3#)
                                 (LETT |t2| (QAREF2O |m| |j| |k| 1 1) . #3#)
                                 (QSETAREF2O |m| |i| |k| |t2| 1 1)
                                 (EXIT (QSETAREF2O |m| |j| |k| |t1| 1 1)))
                            (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                            (EXIT NIL))))))))) 

(SDEFUN |NBLM;mult_vector|
        ((|v| |U32Vector|) (|c| |Integer|) (|p| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G819 NIL) (|i| NIL) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (QV_LEN_U32 |v|) . #2=(|NBLM;mult_vector|))
                    (EXIT
                     (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT_U32 |v| |i|
                                        (QSMULMOD32 |c| (ELT_U32 |v| |i|)
                                                    |p|))))
                          (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |NBLM;mult_row|
        ((|m| |TwoDimensionalArray| (|U32Vector|)) (|i| |Integer|)
         (|c| |Integer|) (|p| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G823 NIL) (|j| NIL) (|jmax| (|NonNegativeInteger|)))
               (SEQ (LETT |jmax| (ANCOLS |m|) . #2=(|NBLM;mult_row|))
                    (EXIT
                     (SEQ (LETT |j| 1 . #2#) (LETT #1# |jmax| . #2#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (|NBLM;mult_vector| (QAREF2O |m| |i| |j| 1 1) |c|
                             |p| $)))
                          (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |NBLM;add_vector|
        ((|v1| |U32Vector|) (|v2| |U32Vector|) (|c| |Integer|) (|k| |Integer|)
         (|p| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G827 NIL) (|i| NIL) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (QV_LEN_U32 |v1|) . #2=(|NBLM;add_vector|))
                    (EXIT
                     (SEQ (LETT |i| |k| . #2#) (LETT #1# (- |n| 1) . #2#) G190
                          (COND ((> |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT_U32 |v1| |i|
                                        (QSMULADDMOD64-32 |c|
                                                          (ELT_U32 |v2|
                                                                   (- |i| |k|))
                                                          (ELT_U32 |v1| |i|)
                                                          |p|))))
                          (LETT |i| (+ |i| 1) . #2#) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |NBLM;add_row|
        ((|m| |TwoDimensionalArray| (|U32Vector|)) (|j1| |Integer|)
         (|j2| |Integer|) (|c| |Integer|) (|k| |Integer|) (|p| |Integer|)
         ($ |Void|))
        (SPROG ((#1=#:G831 NIL) (|i| NIL) (|imax| (|NonNegativeInteger|)))
               (SEQ (LETT |imax| (ANCOLS |m|) . #2=(|NBLM;add_row|))
                    (EXIT
                     (SEQ (LETT |i| 1 . #2#) (LETT #1# |imax| . #2#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (|NBLM;add_vector| (QAREF2O |m| |j1| |i| 1 1)
                             (QAREF2O |m| |j2| |i| 1 1) |c| |k| |p| $)))
                          (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |NBLM;reduce_row_by_row1|
        ((|m| |TwoDimensionalArray| (|U32Vector|)) (|j| |Integer|)
         (|i| |Integer|) (|ci| |Integer|) (|cdeg| |Integer|)
         (|vdiff| |Integer|) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G835 NIL) (|c| (|Integer|)) (|k| (|Integer|))
          (|rj0| (|U32Vector|)))
         (SEQ
          (LETT |rj0| (QAREF2O |m| |j| |ci| 1 1)
                . #2=(|NBLM;reduce_row_by_row1|))
          (EXIT
           (COND
            ((< |vdiff| 0)
             (|error| "Internal error : vdiff < 0 in reduce_row_by_row1"))
            ('T
             (SEQ
              (EXIT
               (SEQ (LETT |k| (+ |vdiff| |cdeg|) . #2#)
                    (LETT |c| (ELT_U32 |rj0| |k|) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |c| 0 (QREFELT $ 49))
                       (PROGN
                        (LETT #1#
                              (|NBLM;add_row| |m| |j| |i| (- |p| |c|) |vdiff|
                               |p| $)
                              . #2#)
                        (GO #3=#:G832)))))))
              #3# (EXIT #1#)))))))) 

(SDEFUN |NBLM;top_reduce_by_row|
        ((|m| |TwoDimensionalArray| (|U32Vector|)) (|i| |Integer|)
         (|ci| |Integer|) (|vn| |Vector| (|Integer|))
         (|vd| |Vector| (|Integer|)) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G839 NIL) (|j| NIL) (|minv| (|Integer|)) (|mcoeff| (|Integer|))
          (|cdeg| (|Integer|)) (|mdeg| (|Integer|))
          (|nr| (|NonNegativeInteger|)))
         (SEQ (LETT |nr| (QVSIZE |vd|) . #2=(|NBLM;top_reduce_by_row|))
              (LETT |mdeg| (SPADCALL |vn| |ci| (QREFELT $ 38)) . #2#)
              (LETT |cdeg| (- |mdeg| (SPADCALL |vd| |i| (QREFELT $ 38))) . #2#)
              (LETT |mcoeff| (ELT_U32 (QAREF2O |m| |i| |ci| 1 1) |cdeg|) . #2#)
              (LETT |minv| (SPADCALL |mcoeff| |p| (QREFELT $ 50)) . #2#)
              (|NBLM;mult_row| |m| |i| |minv| |p| $)
              (EXIT
               (SEQ (LETT |j| (+ |i| 1) . #2#) (LETT #1# |nr| . #2#) G190
                    (COND ((> |j| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (|NBLM;reduce_row_by_row1| |m| |j| |i| |ci| |cdeg|
                       (- (SPADCALL |vd| |i| (QREFELT $ 38))
                          (SPADCALL |vd| |j| (QREFELT $ 38)))
                       |p| $)))
                    (LETT |j| (+ |j| 1) . #2#) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |NBLM;final_reduce|
        ((|m| |TwoDimensionalArray| (|U32Vector|)) (|civ| |Vector| (|Integer|))
         (|vn| |Vector| (|Integer|)) (|vd| |Vector| (|Integer|))
         (|p| |Integer|) ($ |Void|))
        (SPROG
         ((|ci| #1=(|Integer|)) (#2=#:G848 NIL) (|vdi| #1#) (#3=#:G851 NIL)
          (|i| NIL) (#4=#:G850 NIL) (|d| NIL) (|vdj| #1#) (#5=#:G849 NIL)
          (|j| NIL) (|mvd| #1#) (|ns| (|NonNegativeInteger|)))
         (SEQ (LETT |ns| (QVSIZE |vd|) . #6=(|NBLM;final_reduce|))
              (LETT |mvd| (SPADCALL |vd| 1 (QREFELT $ 38)) . #6#)
              (EXIT
               (SEQ (LETT |j| 1 . #6#) (LETT #5# |ns| . #6#) G190
                    (COND ((|greater_SI| |j| #5#) (GO G191)))
                    (SEQ (LETT |vdj| (SPADCALL |vd| |j| (QREFELT $ 38)) . #6#)
                         (EXIT
                          (SEQ (LETT |d| 0 . #6#)
                               (LETT #4# (- |mvd| |vdj|) . #6#) G190
                               (COND ((|greater_SI| |d| #4#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |i| 1 . #6#) (LETT #3# |ns| . #6#)
                                      G190
                                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND ((EQL |i| |j|) "iterate")
                                              ('T
                                               (SEQ
                                                (LETT |vdi|
                                                      (SPADCALL |vd| |i|
                                                                (QREFELT $ 38))
                                                      . #6#)
                                                (EXIT
                                                 (COND
                                                  ((< |vdi| (+ |vdj| |d|))
                                                   (PROGN
                                                    (LETT #2# |$NoValue| . #6#)
                                                    (GO #7=#:G842)))
                                                  ('T
                                                   (SEQ
                                                    (LETT |ci|
                                                          (SPADCALL |civ| |i|
                                                                    (QREFELT $
                                                                             38))
                                                          . #6#)
                                                    (EXIT
                                                     (|NBLM;reduce_row_by_row1|
                                                      |m| |j| |i| |ci|
                                                      (-
                                                       (SPADCALL |vn| |ci|
                                                                 (QREFELT $
                                                                          38))
                                                       |vdi|)
                                                      |d| |p| $)))))))))))
                                      (LETT |i| (|inc_SI| |i|) . #6#) (GO G190)
                                      G191 (EXIT NIL)))
                                #7# (EXIT #2#))
                               (LETT |d| (|inc_SI| |d|) . #6#) (GO G190) G191
                               (EXIT NIL))))
                    (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |NBLM;reduceBasis0;Tda2VIR;19|
        ((|m| |TwoDimensionalArray| (|U32Vector|)) (|vn| |Vector| (|Integer|))
         (|vd| |Vector| (|Integer|)) (|p| |Integer|)
         ($ |Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
          (|:| |defects| (|Vector| (|Integer|)))
          (|:| |cinds| (|Vector| (|Integer|)))))
        (SPROG
         ((|tmp| #1=(|Integer|)) (|maxj| (|Integer|)) (|ci| #2=(|Integer|))
          (|nci| #2#) (|maxd| (|Integer|)) (|cd| #1#) (#3=#:G864 NIL) (|j| NIL)
          (#4=#:G863 NIL) (|i| NIL) (|civ| (|Vector| (|Integer|)))
          (|ns| #5=(|NonNegativeInteger|)) (|nc| #5#))
         (SEQ (LETT |nc| (QVSIZE |vn|) . #6=(|NBLM;reduceBasis0;Tda2VIR;19|))
              (LETT |ns| (QVSIZE |vd|) . #6#)
              (LETT |civ| (MAKEARR1 |ns| 0) . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #4# |ns| . #6#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (LETT |maxd| -1 . #6#)
                        (SEQ (LETT |j| |i| . #6#) (LETT #3# |ns| . #6#) G190
                             (COND ((> |j| #3#) (GO G191)))
                             (SEQ
                              (LETT |cd| (SPADCALL |vd| |j| (QREFELT $ 38))
                                    . #6#)
                              (EXIT
                               (COND
                                ((SPADCALL |cd| |maxd| (QREFELT $ 20))
                                 (SEQ (LETT |maxd| |cd| . #6#)
                                      (LETT |ci|
                                            (|NBLM;critical_index| |m| |j|
                                             |maxd| |vn| $)
                                            . #6#)
                                      (EXIT (LETT |maxj| |j| . #6#))))
                                ((EQL |cd| |maxd|)
                                 (SEQ
                                  (LETT |nci|
                                        (|NBLM;critical_index| |m| |j| |maxd|
                                         |vn| $)
                                        . #6#)
                                  (EXIT
                                   (COND
                                    ((< |nci| |ci|)
                                     (SEQ (LETT |ci| |nci| . #6#)
                                          (EXIT
                                           (LETT |maxj| |j| . #6#)))))))))))
                             (LETT |j| (+ |j| 1) . #6#) (GO G190) G191
                             (EXIT NIL))
                        (|NBLM;swap_rows| |m| |i| |maxj| $)
                        (LETT |tmp| (SPADCALL |vd| |i| (QREFELT $ 38)) . #6#)
                        (SPADCALL |vd| |i|
                                  (SPADCALL |vd| |maxj| (QREFELT $ 38))
                                  (QREFELT $ 48))
                        (SPADCALL |vd| |maxj| |tmp| (QREFELT $ 48))
                        (SPADCALL |civ| |i| |ci| (QREFELT $ 48))
                        (EXIT
                         (|NBLM;top_reduce_by_row| |m| |i| |ci| |vn| |vd| |p|
                          $)))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (|NBLM;final_reduce| |m| |civ| |vn| |vd| |p| $)
              (EXIT (VECTOR |m| |vd| |civ|))))) 

(SDEFUN |NBLM;reduceBasis;V2VIR;20|
        ((|m| |Vector| (|U32Vector|)) (|vn| |Vector| (|Integer|))
         (|vd| |Vector| (|Integer|)) (|p| |Integer|)
         ($ |Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
          (|:| |defects| (|Vector| (|Integer|)))
          (|:| |cinds| (|Vector| (|Integer|)))))
        (SPROG
         ((|j| (|NonNegativeInteger|)) (|m2| (|SingleInteger|)) (#1=#:G879 NIL)
          (|i1| NIL) (|resjk| (|U32Vector|)) (|vnk1| (|SingleInteger|))
          (#2=#:G878 NIL) (|k| NIL) (|mi| (|U32Vector|)) (#3=#:G877 NIL)
          (|i| NIL) (|nvd| (|Vector| (|Integer|)))
          (|res| (|TwoDimensionalArray| (|U32Vector|)))
          (|ns| (|NonNegativeInteger|)) (#4=#:G876 NIL)
          (|nc| #5=(|NonNegativeInteger|)) (|nr| #5#))
         (SEQ (LETT |nr| (QVSIZE |vd|) . #6=(|NBLM;reduceBasis;V2VIR;20|))
              (LETT |nc| (QVSIZE |vn|) . #6#) (LETT |ns| 0 . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #4# |nr| . #6#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((>= (SPADCALL |vd| |i| (QREFELT $ 38)) 0)
                       (LETT |ns| (+ |ns| 1) . #6#)))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |res| (MAKE_MATRIX1 |ns| |nc| (GETREFV_U32 0 0)) . #6#)
              (LETT |nvd| (MAKEARR1 |ns| 0) . #6#) (LETT |j| 1 . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #3# |nr| . #6#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |mi| (SPADCALL |m| |i| (QREFELT $ 33)) . #6#)
                        (LETT |m2| 0 . #6#)
                        (EXIT
                         (COND
                          ((>= (SPADCALL |vd| |i| (QREFELT $ 38)) 0)
                           (SEQ
                            (SPADCALL |nvd| |j|
                                      (SPADCALL |vd| |i| (QREFELT $ 38))
                                      (QREFELT $ 48))
                            (SEQ (LETT |k| 1 . #6#) (LETT #2# |nc| . #6#) G190
                                 (COND ((|greater_SI| |k| #2#) (GO G191)))
                                 (SEQ
                                  (LETT |vnk1|
                                        (+ (SPADCALL |vn| |k| (QREFELT $ 38))
                                           1)
                                        . #6#)
                                  (LETT |resjk| (GETREFV_U32 |vnk1| 0) . #6#)
                                  (SEQ (LETT |i1| 0 . #6#)
                                       (LETT #1# (|sub_SI| |vnk1| 1) . #6#)
                                       G190
                                       (COND
                                        ((|greater_SI| |i1| #1#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SETELT_U32 |resjk| |i1|
                                                     (ELT_U32 |mi|
                                                              (+ |m2| |i1|)))))
                                       (LETT |i1| (|inc_SI| |i1|) . #6#)
                                       (GO G190) G191 (EXIT NIL))
                                  (LETT |m2| (|add_SI| |m2| |vnk1|) . #6#)
                                  (EXIT
                                   (QSETAREF2O |res| |j| |k| |resjk| 1 1)))
                                 (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT (LETT |j| (+ |j| 1) . #6#)))))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| |vn| |nvd| |p| (QREFELT $ 54)))))) 

(DECLAIM (NOTINLINE |NaiveBeckermannLabahnModular;|)) 

(DEFUN |NaiveBeckermannLabahnModular| ()
  (SPROG NIL
         (PROG (#1=#:G881)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|NaiveBeckermannLabahnModular|)
                    . #2=(|NaiveBeckermannLabahnModular|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|NaiveBeckermannLabahnModular|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|NaiveBeckermannLabahnModular;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|NaiveBeckermannLabahnModular|)))))))))) 

(DEFUN |NaiveBeckermannLabahnModular;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NaiveBeckermannLabahnModular|)
                . #1=(|NaiveBeckermannLabahnModular|))
          (LETT $ (GETREFV 56) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|NaiveBeckermannLabahnModular| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|NaiveBeckermannLabahnModular| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) (0 . |Zero|)
              (|List| 43) (|Vector| 31) (|Vector| 11) (|Integer|)
              (|Mapping| 11 11) (|Mapping| 23 21 11 11)
              |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;5|
              |NBLM;naiveBeckermannLabahn;VVNniIL;1| (|Vector| 21)
              |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;6|
              |NBLM;naiveBeckermannLabahn;VVNniIL;2| (|Boolean|) (4 . >)
              (|U32Vector|) (10 . |elt|) (|Void|)
              (|U32VectorPolynomialOperations|) (16 . |mul_by_binomial|)
              |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3|
              |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4| (23 . ~=)
              (|List| 21) (29 . |vector|) (|SparseUnivariatePolynomial| 11)
              (34 . |elt|) (40 . |elt|) (46 . |zero?|) (51 . |degree|)
              (56 . |leadingCoefficient|) (61 . |reductum|) (66 . |elt|)
              (72 . |setelt!|) (|List| 11) (79 . |vector|)
              |NBLM;naiveBeckermannLabahn0;2VVNniIM2MV;9| (|Any|)
              (|AnyFunctions1| 16) (84 . |coerce|) (|AnyFunctions1| 10)
              (89 . |coerce|) (94 . |setelt!|) (101 . ~=) (107 . |invmod|)
              (113 . |vector_add_mul|)
              (|Record| (|:| |basis| 53) (|:| |defects| 10) (|:| |cinds| 10))
              (|TwoDimensionalArray| 21) |NBLM;reduceBasis0;Tda2VIR;19|
              |NBLM;reduceBasis;V2VIR;20|)
           '#(|reduceBasis0| 123 |reduceBasis| 131
              |naiveBeckermannLabahnMultipoint| 139 |naiveBeckermannLabahn1|
              155 |naiveBeckermannLabahn0| 177 |naiveBeckermannLabahn| 189)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(0 6 0 7 2 11 19 0 0 20 2 21
                                                   11 0 11 22 3 24 23 21 11 11
                                                   25 2 6 19 0 0 28 1 16 0 29
                                                   30 2 9 31 0 11 32 2 16 21 0
                                                   11 33 1 31 19 0 34 1 31 6 0
                                                   35 1 31 11 0 36 1 31 0 0 37
                                                   2 10 11 0 11 38 3 16 21 0 11
                                                   21 39 1 10 0 40 41 1 44 43
                                                   16 45 1 46 43 10 47 3 10 11
                                                   0 11 11 48 2 11 19 0 0 49 2
                                                   11 0 0 0 50 6 24 23 21 21 11
                                                   11 11 11 51 4 0 52 53 10 10
                                                   11 54 4 0 52 16 10 10 11 55
                                                   4 0 8 9 10 21 11 26 4 0 8 16
                                                   10 21 11 27 7 0 8 16 10 6 11
                                                   12 13 13 17 7 0 8 9 10 6 11
                                                   12 13 13 14 8 0 23 16 16 10
                                                   6 11 12 13 13 42 4 0 8 9 10
                                                   6 11 15 4 0 8 16 10 6 11
                                                   18)))))
           '|lookupComplete|)) 

(MAKEPROP '|NaiveBeckermannLabahnModular| 'NILADIC T) 
