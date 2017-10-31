
(SDEFUN |POLYVEC;copy_first;2UvIV;1|
        ((|np| |U32Vector|) (|op| |U32Vector|) (|n| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G708 NIL) (|j| NIL) (|ns| (|SingleInteger|)))
               (SEQ (LETT |ns| |n| . #2=(|POLYVEC;copy_first;2UvIV;1|))
                    (EXIT
                     (SEQ (LETT |j| 0 . #2#) (LETT #1# (|sub_SI| |ns| 1) . #2#)
                          G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ (EXIT (SETELT_U32 |np| |j| (ELT_U32 |op| |j|))))
                          (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |POLYVEC;copy_slice;2Uv2IV;2|
        ((|np| |U32Vector|) (|op| |U32Vector|) (|m| |Integer|) (|n| |Integer|)
         ($ |Void|))
        (SPROG
         ((#1=#:G712 NIL) (|j| NIL) (|ns| #2=(|SingleInteger|)) (|ms| #2#))
         (SEQ (LETT |ms| |m| . #3=(|POLYVEC;copy_slice;2Uv2IV;2|))
              (LETT |ns| |n| . #3#)
              (EXIT
               (SEQ (LETT |j| |ms| . #3#)
                    (LETT #1# (|sub_SI| (|add_SI| |ms| |ns|) 1) . #3#) G190
                    (COND ((|greater_SI| |j| #1#) (GO G191)))
                    (SEQ (EXIT (SETELT_U32 |np| |j| (ELT_U32 |op| |j|))))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |POLYVEC;eval_at;Uv4I;3|
        ((|v| |U32Vector|) (|deg| |Integer|) (|pt| |Integer|) (|p| |Integer|)
         ($ |Integer|))
        (SPROG ((|i| (|SingleInteger|)) (|res| (|Integer|)))
               (SEQ (LETT |i| |deg| . #1=(|POLYVEC;eval_at;Uv4I;3|))
                    (LETT |res| 0 . #1#)
                    (SEQ G190
                         (COND ((NULL (NULL (|less_SI| |i| 0))) (GO G191)))
                         (SEQ
                          (LETT |res|
                                (QSMULADDMOD64-32 |pt| |res| (ELT_U32 |v| |i|)
                                                  |p|)
                                . #1#)
                          (EXIT (LETT |i| (|sub_SI| |i| 1) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |POLYVEC;to_mod_pa;SupIUv;4|
        ((|s| |SparseUnivariatePolynomial| (|Integer|)) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|ncoeffs| (|U32Vector|))
          (|n0| (|SingleInteger|)))
         (SEQ
          (COND ((SPADCALL |s| (QREFELT $ 14)) (GETREFV_U32 1 0))
                ('T
                 (SEQ
                  (LETT |n0| (SPADCALL |s| (QREFELT $ 17))
                        . #1=(|POLYVEC;to_mod_pa;SupIUv;4|))
                  (LETT |ncoeffs| (GETREFV_U32 (|add_SI| |n0| 1) 0) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |s| (QREFELT $ 14))))
                         (GO G191)))
                       (SEQ (LETT |n| (SPADCALL |s| (QREFELT $ 17)) . #1#)
                            (SETELT_U32 |ncoeffs| |n|
                                        (SPADCALL (SPADCALL |s| (QREFELT $ 18))
                                                  |p| (QREFELT $ 19)))
                            (EXIT
                             (LETT |s| (SPADCALL |s| (QREFELT $ 20)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |ncoeffs|))))))) 

(SDEFUN |POLYVEC;pa_to_sup;UvSup;5|
        ((|v| |U32Vector|) ($ |SparseUnivariatePolynomial| (|Integer|)))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Integer|))) (#1=#:G727 NIL)
          (|i| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (QV_LEN_U32 |v|) . #2=(|POLYVEC;pa_to_sup;UvSup;5|))
              (LETT |res| (|spadConstant| $ 22) . #2#)
              (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (ELT_U32 |v| |i|) |i| (QREFELT $ 23))
                            |res| (QREFELT $ 24))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |POLYVEC;vector_add_mul;2Uv4IV;6|
        ((|v1| |U32Vector|) (|v2| |U32Vector|) (|m| |Integer|) (|n| |Integer|)
         (|c| |Integer|) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G731 NIL) (|i| NIL) (|ns| #2=(|SingleInteger|)) (|ms| #2#))
         (SEQ (LETT |ms| |m| . #3=(|POLYVEC;vector_add_mul;2Uv4IV;6|))
              (LETT |ns| |n| . #3#)
              (EXIT
               (SEQ (LETT |i| |ms| . #3#) (LETT #1# |ns| . #3#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SETELT_U32 |v1| |i|
                                  (QSMULADDMOD64-32 |c| (ELT_U32 |v2| |i|)
                                                    (ELT_U32 |v1| |i|) |p|))))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |POLYVEC;mul_by_binomial;Uv3IV;7|
        ((|v| |U32Vector|) (|n| |Integer|) (|pt| |Integer|) (|p| |Integer|)
         ($ |Void|))
        (SPROG
         ((|prev_coeff| (|Integer|)) (|pp| (|Integer|)) (#1=#:G736 NIL)
          (|i| NIL) (|ns| (|SingleInteger|)))
         (SEQ (LETT |prev_coeff| 0 . #2=(|POLYVEC;mul_by_binomial;Uv3IV;7|))
              (LETT |ns| |n| . #2#)
              (EXIT
               (SEQ (LETT |i| 0 . #2#) (LETT #1# (|sub_SI| |ns| 1) . #2#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ (LETT |pp| (ELT_U32 |v| |i|) . #2#)
                         (SETELT_U32 |v| |i|
                                     (QSMULADDMOD64-32 |pt| |pp| |prev_coeff|
                                                       |p|))
                         (EXIT (LETT |prev_coeff| |pp| . #2#)))
                    (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |POLYVEC;mul_by_binomial;Uv2IV;8|
        ((|v| |U32Vector|) (|pt| |Integer|) (|p| |Integer|) ($ |Void|))
        (SPADCALL |v| (QV_LEN_U32 |v|) |pt| |p| (QREFELT $ 27))) 

(SDEFUN |POLYVEC;mul_by_scalar;Uv3IV;9|
        ((|v| |U32Vector|) (|n| |Integer|) (|c| |Integer|) (|p| |Integer|)
         ($ |Void|))
        (SPROG ((#1=#:G741 NIL) (|i| NIL) (|ns| (|SingleInteger|)))
               (SEQ (LETT |ns| |n| . #2=(|POLYVEC;mul_by_scalar;Uv3IV;9|))
                    (EXIT
                     (SEQ (LETT |i| 0 . #2#) (LETT #1# |ns| . #2#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT_U32 |v| |i|
                                        (QSMULMOD32 |c| (ELT_U32 |v| |i|)
                                                    |p|))))
                          (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |POLYVEC;degree;UvI;10| ((|v| |U32Vector|) ($ |Integer|))
        (SPROG
         ((#1=#:G746 NIL) (#2=#:G747 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QV_LEN_U32 |v|) . #3=(|POLYVEC;degree;UvI;10|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |i| (- |n| 1) . #3#) G190
                       (COND ((< |i| 0) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (EQL (ELT_U32 |v| |i|) 0))
                           (PROGN
                            (LETT #1#
                                  (PROGN (LETT #2# |i| . #3#) (GO #4=#:G745))
                                  . #3#)
                            (GO #5=#:G743))))))
                       (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL)))
                 #5# (EXIT #1#))
                (EXIT -1)))
          #4# (EXIT #2#)))) 

(SDEFUN |POLYVEC;vector_combination;UvIUv4IV;11|
        ((|v1| |U32Vector|) (|c1| |Integer|) (|v2| |U32Vector|)
         (|c2| |Integer|) (|n| |Integer|) (|delta| |Integer|) (|p| |Integer|)
         ($ |Void|))
        (SPROG
         ((#1=#:G759 NIL) (|i| NIL) (#2=#:G758 NIL) (#3=#:G757 NIL)
          (#4=#:G756 NIL) (|ds| #5=(|SingleInteger|)) (|ns| #5#))
         (SEQ (LETT |ns| |n| . #6=(|POLYVEC;vector_combination;UvIUv4IV;11|))
              (LETT |ds| |delta| . #6#)
              (EXIT
               (COND
                ((EQL |c1| 1)
                 (SEQ (LETT |i| |ds| . #6#) (LETT #4# |ns| . #6#) G190
                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT_U32 |v1| |i|
                                    (QSMULADDMOD64-32 |c2|
                                                      (ELT_U32 |v2|
                                                               (|sub_SI| |i|
                                                                         |ds|))
                                                      (ELT_U32 |v1| |i|)
                                                      |p|))))
                      (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                      (EXIT NIL)))
                ((|less_SI| (|add_SI| |ns| 1) |ds|)
                 (SEQ (LETT |i| 0 . #6#) (LETT #3# |ns| . #6#) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT_U32 |v1| |i|
                                    (QSMULMOD32 (ELT_U32 |v1| |i|) |c1| |p|))))
                      (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                      (EXIT NIL)))
                ('T
                 (SEQ
                  (SEQ (LETT |i| 0 . #6#) (LETT #2# (|sub_SI| |ds| 1) . #6#)
                       G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT_U32 |v1| |i|
                                     (QSMULMOD32 (ELT_U32 |v1| |i|) |c1|
                                                 |p|))))
                       (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |i| |ds| . #6#) (LETT #1# |ns| . #6#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT_U32 |v1| |i|
                                      (QSDOT2MOD64-32 (ELT_U32 |v1| |i|) |c1|
                                                      (ELT_U32 |v2|
                                                               (|sub_SI| |i|
                                                                         |ds|))
                                                      |c2| |p|))))
                        (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                        (EXIT NIL)))))))))) 

(SDEFUN |POLYVEC;divide!;3UvIV;12|
        ((|r0| |U32Vector|) (|r1| |U32Vector|) (|res| |U32Vector|)
         (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G766 NIL) (|dr0| #2=(|SingleInteger|)) (#3=#:G767 NIL)
          (|c1| (|Integer|)) (|delta| (|SingleInteger|)) (|c0| (|Integer|))
          (|dr1| #2#))
         (SEQ
          (LETT |dr0| (SPADCALL |r0| (QREFELT $ 30))
                . #4=(|POLYVEC;divide!;3UvIV;12|))
          (LETT |dr1| (SPADCALL |r1| (QREFELT $ 30)) . #4#)
          (LETT |c0| (ELT_U32 |r1| |dr1|) . #4#)
          (LETT |c0| (SPADCALL |c0| |p| (QREFELT $ 32)) . #4#)
          (EXIT
           (SEQ
            (EXIT
             (SEQ G190 (COND ((NULL (NULL (|less_SI| |dr0| |dr1|))) (GO G191)))
                  (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|) . #4#)
                       (LETT |c1| (QSMULMOD32 |c0| (ELT_U32 |r0| |dr0|) |p|)
                             . #4#)
                       (SETELT_U32 |res| |delta| |c1|)
                       (LETT |c1| (- |p| |c1|) . #4#) (SETELT_U32 |r0| |dr0| 0)
                       (LETT |dr0| (|sub_SI| |dr0| 1) . #4#)
                       (COND
                        ((|less_SI| |dr0| 0)
                         (PROGN (LETT #3# |$NoValue| . #4#) (GO #5=#:G763))))
                       (SPADCALL |r0| 1 |r1| |c1| |dr0| |delta| |p|
                                 (QREFELT $ 31))
                       (EXIT
                        (SEQ
                         (EXIT
                          (SEQ G190
                               (COND
                                ((NULL (EQL (ELT_U32 |r0| |dr0|) 0))
                                 (GO G191)))
                               (SEQ (LETT |dr0| (|sub_SI| |dr0| 1) . #4#)
                                    (EXIT
                                     (COND
                                      ((|less_SI| |dr0| 0)
                                       (PROGN
                                        (LETT #1# |$NoValue| . #4#)
                                        (GO #6=#:G761))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #1#))))
                  NIL (GO G190) G191 (EXIT NIL)))
            #5# (EXIT #3#)))))) 

(SDEFUN |POLYVEC;remainder!;2UvIV;13|
        ((|r0| |U32Vector|) (|r1| |U32Vector|) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G774 NIL) (|dr0| #2=(|SingleInteger|)) (#3=#:G775 NIL)
          (|c1| (|Integer|)) (|delta| (|SingleInteger|)) (|c0| (|Integer|))
          (|dr1| #2#))
         (SEQ
          (LETT |dr0| (SPADCALL |r0| (QREFELT $ 30))
                . #4=(|POLYVEC;remainder!;2UvIV;13|))
          (LETT |dr1| (SPADCALL |r1| (QREFELT $ 30)) . #4#)
          (LETT |c0| (ELT_U32 |r1| |dr1|) . #4#)
          (LETT |c0| (SPADCALL |c0| |p| (QREFELT $ 32)) . #4#)
          (EXIT
           (SEQ
            (EXIT
             (SEQ G190 (COND ((NULL (NULL (|less_SI| |dr0| |dr1|))) (GO G191)))
                  (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|) . #4#)
                       (LETT |c1| (QSMULMOD32 |c0| (ELT_U32 |r0| |dr0|) |p|)
                             . #4#)
                       (LETT |c1| (- |p| |c1|) . #4#) (SETELT_U32 |r0| |dr0| 0)
                       (LETT |dr0| (|sub_SI| |dr0| 1) . #4#)
                       (COND
                        ((|less_SI| |dr0| 0)
                         (PROGN (LETT #3# |$NoValue| . #4#) (GO #5=#:G771))))
                       (SPADCALL |r0| 1 |r1| |c1| |dr0| |delta| |p|
                                 (QREFELT $ 31))
                       (EXIT
                        (SEQ
                         (EXIT
                          (SEQ G190
                               (COND
                                ((NULL (EQL (ELT_U32 |r0| |dr0|) 0))
                                 (GO G191)))
                               (SEQ (LETT |dr0| (|sub_SI| |dr0| 1) . #4#)
                                    (EXIT
                                     (COND
                                      ((|less_SI| |dr0| 0)
                                       (PROGN
                                        (LETT #1# |$NoValue| . #4#)
                                        (GO #6=#:G769))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #1#))))
                  NIL (GO G190) G191 (EXIT NIL)))
            #5# (EXIT #3#)))))) 

(SDEFUN |POLYVEC;gcd;2UvIUv;14|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((#1=#:G793 NIL) (|c| #2=(|Integer|)) (|dr1| #3=(|SingleInteger|))
          (|r1| #4=(|U32Vector|)) (|dr0| #3#) (|r0| #4#)
          (|tmp| #5=(|SingleInteger|)) (|tmpp| (|U32Vector|)) (#6=#:G792 NIL)
          (|c0| #2#) (|c1| (|Integer|)) (|delta| #5#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dr0| (SPADCALL |y| (QREFELT $ 30))
                  . #7=(|POLYVEC;gcd;2UvIUv;14|))
            (COND
             ((|less_SI| |dr0| 0)
              (SEQ (LETT |tmpp| |x| . #7#) (LETT |x| |y| . #7#)
                   (LETT |y| |tmpp| . #7#) (LETT |dr1| |dr0| . #7#)
                   (EXIT (LETT |dr0| (SPADCALL |y| (QREFELT $ 30)) . #7#))))
             (#8='T (LETT |dr1| (SPADCALL |x| (QREFELT $ 30)) . #7#)))
            (EXIT
             (COND
              ((|less_SI| |dr0| 0)
               (PROGN (LETT #1# (GETREFV_U32 1 0) . #7#) (GO #9=#:G791)))
              (#8#
               (SEQ (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0) . #7#)
                    (SPADCALL |r0| |y| (|add_SI| |dr0| 1) (QREFELT $ 9))
                    (EXIT
                     (COND
                      ((|less_SI| |dr1| 0)
                       (SEQ (LETT |c| (ELT_U32 |r0| |dr0|) . #7#)
                            (LETT |c| (SPADCALL |c| |p| (QREFELT $ 32)) . #7#)
                            (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 29))
                            (EXIT (PROGN (LETT #1# |r0| . #7#) (GO #9#)))))
                      (#8#
                       (SEQ
                        (LETT |r1| (GETREFV_U32 (|add_SI| |dr1| 1) 0) . #7#)
                        (SPADCALL |r1| |x| (|add_SI| |dr1| 1) (QREFELT $ 9))
                        (SEQ G190 (COND ((NULL (|less_SI| 0 |dr1|)) (GO G191)))
                             (SEQ
                              (SEQ G190
                                   (COND
                                    ((NULL (NULL (|less_SI| |dr0| |dr1|)))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |delta| (|sub_SI| |dr0| |dr1|) . #7#)
                                    (LETT |c1|
                                          (|sub_SI| |p| (ELT_U32 |r0| |dr0|))
                                          . #7#)
                                    (LETT |c0| (ELT_U32 |r1| |dr1|) . #7#)
                                    (COND
                                     ((SPADCALL |c0| 1 (QREFELT $ 35))
                                      (COND
                                       ((SPADCALL |delta| 30 (QREFELT $ 36))
                                        (SEQ
                                         (LETT |c0|
                                               (SPADCALL |c0| |p|
                                                         (QREFELT $ 32))
                                               . #7#)
                                         (SPADCALL |r1| |dr1| |c0| |p|
                                                   (QREFELT $ 29))
                                         (EXIT (LETT |c0| 1 . #7#)))))))
                                    (SETELT_U32 |r0| |dr0| 0)
                                    (LETT |dr0| (|sub_SI| |dr0| 1) . #7#)
                                    (SPADCALL |r0| |c0| |r1| |c1| |dr0| |delta|
                                              |p| (QREFELT $ 31))
                                    (EXIT
                                     (SEQ
                                      (EXIT
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (EQL (ELT_U32 |r0| |dr0|) 0))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |dr0| (|sub_SI| |dr0| 1)
                                                   . #7#)
                                             (EXIT
                                              (COND
                                               ((|less_SI| |dr0| 0)
                                                (PROGN
                                                 (LETT #6# |$NoValue| . #7#)
                                                 (GO #10=#:G781))))))
                                            NIL (GO G190) G191 (EXIT NIL)))
                                      #10# (EXIT #6#))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |tmpp| |r0| . #7#) (LETT |tmp| |dr0| . #7#)
                              (LETT |r0| |r1| . #7#) (LETT |dr0| |dr1| . #7#)
                              (LETT |r1| |tmpp| . #7#)
                              (EXIT (LETT |dr1| |tmp| . #7#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((|less_SI| |dr1| 0)
                           (SEQ (LETT |c| (ELT_U32 |r0| |dr0|) . #7#)
                                (LETT |c| (SPADCALL |c| |p| (QREFELT $ 32))
                                      . #7#)
                                (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 29))
                                (EXIT |r0|)))
                          (#8#
                           (SEQ (SETELT_U32 |r1| 0 1)
                                (EXIT
                                 (PROGN
                                  (LETT #1# |r1| . #7#)
                                  (GO #9#)))))))))))))))))
          #9# (EXIT #1#)))) 

(SDEFUN |POLYVEC;gcd;Pa3IUv;15|
        ((|a| |PrimitiveArray| (|U32Vector|)) (|lo| |Integer|) (|hi| |Integer|)
         (|p| |Integer|) ($ |U32Vector|))
        (SPROG ((|res| (|U32Vector|)) (#1=#:G797 NIL) (|i| NIL))
               (SEQ
                (LETT |res| (QAREF1 |a| |lo|) . #2=(|POLYVEC;gcd;Pa3IUv;15|))
                (SEQ (LETT |i| (+ |lo| 1) . #2#) (LETT #1# |hi| . #2#) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res|
                             (SPADCALL (QAREF1 |a| |i|) |res| |p|
                                       (QREFELT $ 37))
                             . #2#)))
                     (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))) 

(SDEFUN |POLYVEC;lcm2|
        ((|v1| |U32Vector|) (|v2| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((|tmp2| #1=(|U32Vector|)) (|tmp1| #1#) (|dpp| #2=(|Integer|))
          (|dv2| #2#) (|pp| (|U32Vector|)))
         (SEQ
          (LETT |pp| (SPADCALL |v1| |v2| |p| (QREFELT $ 37))
                . #3=(|POLYVEC;lcm2|))
          (LETT |dv2| (SPADCALL |v2| (QREFELT $ 30)) . #3#)
          (LETT |dpp| (SPADCALL |pp| (QREFELT $ 30)) . #3#)
          (EXIT
           (COND ((EQL |dv2| |dpp|) |v1|)
                 ((EQL |dpp| 0) (SPADCALL |v1| |v2| |p| (QREFELT $ 40)))
                 ('T
                  (SEQ (LETT |tmp1| (GETREFV_U32 (+ |dv2| 1) 0) . #3#)
                       (LETT |tmp2| (GETREFV_U32 (+ (- |dv2| |dpp|) 1) 0)
                             . #3#)
                       (SPADCALL |tmp1| |v2| (+ |dv2| 1) (QREFELT $ 9))
                       (SPADCALL |tmp1| |pp| |tmp2| |p| (QREFELT $ 33))
                       (EXIT (SPADCALL |v1| |tmp2| |p| (QREFELT $ 40)))))))))) 

(SDEFUN |POLYVEC;lcm;Pa3IUv;17|
        ((|a| |PrimitiveArray| (|U32Vector|)) (|lo| |Integer|) (|hi| |Integer|)
         (|p| |Integer|) ($ |U32Vector|))
        (SPROG ((|res| (|U32Vector|)) (#1=#:G804 NIL) (|i| NIL))
               (SEQ
                (LETT |res| (QAREF1 |a| |lo|) . #2=(|POLYVEC;lcm;Pa3IUv;17|))
                (SEQ (LETT |i| (+ |lo| 1) . #2#) (LETT #1# |hi| . #2#) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res|
                             (|POLYVEC;lcm2| (QAREF1 |a| |i|) |res| |p| $)
                             . #2#)))
                     (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))) 

(SDEFUN |POLYVEC;mul;2UvIUv;18|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((|zcoeffs| (|U32Vector|)) (|zdeg0| (|NonNegativeInteger|))
          (|zdeg| (|SingleInteger|)) (|ycoeffs| (|U32Vector|))
          (|xcoeffs| #1=(|U32Vector|)) (|ydeg| #2=(|SingleInteger|))
          (|xdeg| #2#) (|tmp| #2#) (|tmpp| #1#))
         (SEQ
          (LETT |xdeg| (SPADCALL |x| (QREFELT $ 30))
                . #3=(|POLYVEC;mul;2UvIUv;18|))
          (LETT |ydeg| (SPADCALL |y| (QREFELT $ 30)) . #3#)
          (COND
           ((SPADCALL |xdeg| |ydeg| (QREFELT $ 43))
            (SEQ (LETT |tmpp| |x| . #3#) (LETT |tmp| |xdeg| . #3#)
                 (LETT |x| |y| . #3#) (LETT |xdeg| |ydeg| . #3#)
                 (LETT |y| |tmpp| . #3#) (EXIT (LETT |ydeg| |tmp| . #3#)))))
          (LETT |xcoeffs| |x| . #3#) (LETT |ycoeffs| |y| . #3#)
          (EXIT
           (COND ((|less_SI| |xdeg| 0) |x|)
                 ('T
                  (SEQ
                   (COND
                    ((|eql_SI| |xdeg| 0)
                     (COND
                      ((EQL (ELT_U32 |xcoeffs| 0) 1)
                       (EXIT (SPADCALL |y| (QREFELT $ 44)))))))
                   (LETT |zdeg| (|add_SI| |xdeg| |ydeg|) . #3#)
                   (LETT |zdeg0| (|add_SI| |zdeg| 1) . #3#)
                   (LETT |zcoeffs| (GETREFV_U32 |zdeg0| 0) . #3#)
                   (|POLYVEC;inner_mul| |xcoeffs| |ycoeffs| |zcoeffs| |xdeg|
                    |ydeg| |zdeg| |p| $)
                   (EXIT |zcoeffs|)))))))) 

(SDEFUN |POLYVEC;inner_mul|
        ((|x| . #1=(|U32Vector|)) (|y| |U32Vector|) (|z| |U32Vector|)
         (|xdeg| . #2=(|SingleInteger|)) (|ydeg| |SingleInteger|)
         (|zdeg| |SingleInteger|) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((|ss| (|Integer|)) (#3=#:G827 NIL) (|j| NIL) (#4=#:G826 NIL)
          (|i| NIL) (#5=#:G825 NIL) (#6=#:G824 NIL) (#7=#:G823 NIL)
          (#8=#:G822 NIL) (|tmp| #2#) (|tmpp| #1#))
         (SEQ
          (COND
           ((|less_SI| |ydeg| |xdeg|)
            (SEQ (LETT |tmpp| |x| . #9=(|POLYVEC;inner_mul|))
                 (LETT |tmp| |xdeg| . #9#) (LETT |x| |y| . #9#)
                 (LETT |xdeg| |ydeg| . #9#) (LETT |y| |tmpp| . #9#)
                 (EXIT (LETT |ydeg| |tmp| . #9#)))))
          (LETT |xdeg|
                (COND ((|less_SI| |zdeg| |xdeg|) |zdeg|) (#10='T |xdeg|))
                . #9#)
          (LETT |ydeg| (COND ((|less_SI| |zdeg| |ydeg|) |zdeg|) (#10# |ydeg|))
                . #9#)
          (SEQ (LETT |i| 0 . #9#) (LETT #8# |xdeg| . #9#) G190
               (COND ((|greater_SI| |i| #8#) (GO G191)))
               (SEQ (LETT |ss| (ELT_U32 |z| |i|) . #9#)
                    (SEQ (LETT |j| 0 . #9#) (LETT #7# |i| . #9#) G190
                         (COND ((|greater_SI| |j| #7#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ss|
                                 (QSMULADD64-32 (ELT_U32 |x| (- |i| |j|))
                                                (ELT_U32 |y| |j|) |ss|)
                                 . #9#)))
                         (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (SETELT_U32 |z| |i| (QSMOD64-32 |ss| |p|))))
               (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| (|add_SI| |xdeg| 1) . #9#) (LETT #6# |ydeg| . #9#)
               G190 (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ (LETT |ss| (ELT_U32 |z| |i|) . #9#)
                    (SEQ (LETT |j| 0 . #9#) (LETT #5# |xdeg| . #9#) G190
                         (COND ((|greater_SI| |j| #5#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ss|
                                 (QSMULADD64-32 (ELT_U32 |x| |j|)
                                                (ELT_U32 |y| (- |i| |j|)) |ss|)
                                 . #9#)))
                         (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (SETELT_U32 |z| |i| (QSMOD64-32 |ss| |p|))))
               (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SEQ (LETT |i| (|add_SI| |ydeg| 1) . #9#) (LETT #4# |zdeg| . #9#)
                G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                (SEQ (LETT |ss| (ELT_U32 |z| |i|) . #9#)
                     (SEQ (LETT |j| (|sub_SI| |i| |xdeg|) . #9#)
                          (LETT #3# |ydeg| . #9#) G190
                          (COND ((|greater_SI| |j| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |ss|
                                  (QSMULADD64-32
                                   (ELT_U32 |x| (|sub_SI| |i| |j|))
                                   (ELT_U32 |y| |j|) |ss|)
                                  . #9#)))
                          (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT (SETELT_U32 |z| |i| (QSMOD64-32 |ss| |p|))))
                (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |POLYVEC;truncated_mul_add;3Uv2IV;20|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|z| |U32Vector|) (|m| |Integer|)
         (|p| |Integer|) ($ |Void|))
        (SPROG ((|ydeg| #1=(|SingleInteger|)) (|xdeg| #1#))
               (SEQ
                (LETT |xdeg| (- (QV_LEN_U32 |x|) 1)
                      . #2=(|POLYVEC;truncated_mul_add;3Uv2IV;20|))
                (LETT |ydeg| (- (QV_LEN_U32 |y|) 1) . #2#)
                (EXIT
                 (|POLYVEC;inner_mul| |x| |y| |z| |xdeg| |ydeg| |m| |p| $))))) 

(SDEFUN |POLYVEC;truncated_multiplication;2Uv2IUv;21|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|m| |Integer|) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG ((|z| (|U32Vector|)) (|ydeg| #1=(|SingleInteger|)) (|xdeg| #1#))
               (SEQ
                (LETT |xdeg| (- (QV_LEN_U32 |x|) 1)
                      . #2=(|POLYVEC;truncated_multiplication;2Uv2IUv;21|))
                (LETT |ydeg| (- (QV_LEN_U32 |y|) 1) . #2#)
                (LETT |z| (GETREFV_U32 (|add_SI| |m| 1) 0) . #2#)
                (|POLYVEC;inner_mul| |x| |y| |z| |xdeg| |ydeg| |m| |p| $)
                (EXIT |z|)))) 

(SDEFUN |POLYVEC;pow;UvPiNniIUv;22|
        ((|x| |U32Vector|) (|n| |PositiveInteger|) (|d| |NonNegativeInteger|)
         (|p| |Integer|) ($ |U32Vector|))
        (COND ((EQL |n| 1) |x|)
              ((ODDP |n|)
               (SPADCALL |x|
                         (SPADCALL (SPADCALL |x| |x| |d| |p| (QREFELT $ 46))
                                   (ASH |n| -1) |d| |p| (QREFELT $ 48))
                         |d| |p| (QREFELT $ 46)))
              ('T
               (SPADCALL (SPADCALL |x| |x| |d| |p| (QREFELT $ 46)) (ASH |n| -1)
                         |d| |p| (QREFELT $ 48))))) 

(SDEFUN |POLYVEC;differentiate;UvIUv;23|
        ((|x| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((|i1| (|NonNegativeInteger|)) (#1=#:G842 NIL) (|i| NIL)
          (|r| (|U32Vector|)) (#2=#:G836 NIL) (|d| (|Integer|)))
         (SEQ
          (LETT |d| (- (QV_LEN_U32 |x|) 1)
                . #3=(|POLYVEC;differentiate;UvIUv;23|))
          (EXIT
           (COND ((ZEROP |d|) (GETREFV_U32 0 0))
                 ('T
                  (SEQ
                   (LETT |r|
                         (GETREFV_U32
                          (PROG1 (LETT #2# |d| . #3#)
                            (|check_subtype2| (>= #2# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #2#))
                          0)
                         . #3#)
                   (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |d| 1) . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ (LETT |i1| (+ |i| 1) . #3#)
                             (EXIT
                              (SETELT_U32 |r| |i|
                                          (QSMULMOD32 |i1| (ELT_U32 |x| |i1|)
                                                      |p|))))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT |r|)))))))) 

(SDEFUN |POLYVEC;differentiate;UvNniIUv;24|
        ((|x| |U32Vector|) (|n| |NonNegativeInteger|) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((|f| (|Integer|)) (#1=#:G851 NIL) (|k| NIL) (|j| #2=(|Integer|))
          (#3=#:G850 NIL) (|i| NIL) (|r| (|U32Vector|)) (|d| #2#))
         (SEQ
          (COND ((ZEROP |n|) |x|)
                (#4='T
                 (SEQ
                  (LETT |d| (- (QV_LEN_U32 |x|) 1)
                        . #5=(|POLYVEC;differentiate;UvNniIUv;24|))
                  (EXIT
                   (COND ((< |d| |n|) (GETREFV_U32 0 0))
                         (#4#
                          (SEQ
                           (LETT |r| (GETREFV_U32 (+ (- |d| |n|) 1) 0) . #5#)
                           (SEQ (LETT |i| |n| . #5#) (LETT #3# |d| . #5#) G190
                                (COND ((> |i| #3#) (GO G191)))
                                (SEQ (LETT |j| (- |i| |n|) . #5#)
                                     (LETT |f| (+ |j| 1) . #5#)
                                     (SEQ (LETT |k| (+ |j| 2) . #5#)
                                          (LETT #1# |i| . #5#) G190
                                          (COND ((> |k| #1#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |f| (QSMULMOD32 |f| |k| |p|)
                                                  . #5#)))
                                          (LETT |k| (+ |k| 1) . #5#) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT
                                      (SETELT_U32 |r| |j|
                                                  (QSMULMOD32 |f|
                                                              (ELT_U32 |x| |i|)
                                                              |p|))))
                                (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |r|))))))))))) 

(SDEFUN |POLYVEC;extended_gcd;2UvIL;25|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|)
         ($ |List| (|U32Vector|)))
        (SPROG
         ((|c| #1=(|Integer|)) (#2=#:G872 NIL) (|t1| #3=(|U32Vector|))
          (|t0| #3#) (|#G128| #3#) (|#G127| #3#) (|s1| #3#) (|s0| #3#)
          (|#G126| #3#) (|#G125| #3#) (|dr1| #4=(|SingleInteger|)) (|dr0| #4#)
          (|#G124| #5=(|SingleInteger|)) (|#G123| #4#) (|r1| #3#) (|r0| #3#)
          (|#G122| #3#) (|#G121| #3#) (#6=#:G871 NIL) (|c0| #1#)
          (|c1| (|Integer|)) (|delta| #5#) (|ds| #7=(|SingleInteger|))
          (|dt| #7#) (|swapped| (|Boolean|)) (|#G119| (|U32Vector|))
          (|#G118| (|U32Vector|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dr0| (SPADCALL |x| (QREFELT $ 30))
                  . #8=(|POLYVEC;extended_gcd;2UvIL;25|))
            (LETT |swapped| NIL . #8#)
            (COND
             ((|less_SI| |dr0| 0)
              (SEQ
               (PROGN
                (LETT |#G118| |y| . #8#)
                (LETT |#G119| |x| . #8#)
                (LETT |x| |#G118| . #8#)
                (LETT |y| |#G119| . #8#))
               (LETT |dr1| |dr0| . #8#)
               (LETT |dr0| (SPADCALL |x| (QREFELT $ 30)) . #8#)
               (EXIT (LETT |swapped| 'T . #8#))))
             (#9='T (LETT |dr1| (SPADCALL |y| (QREFELT $ 30)) . #8#)))
            (EXIT
             (COND
              ((|less_SI| |dr1| 0)
               (COND
                ((|less_SI| |dr0| 0)
                 (PROGN
                  (LETT #2#
                        (LIST (GETREFV_U32 1 0) (GETREFV_U32 1 0)
                              (GETREFV_U32 1 1))
                        . #8#)
                  (GO #10=#:G870)))
                (#9#
                 (SEQ (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0) . #8#)
                      (SPADCALL |r0| |x| (|add_SI| |dr0| 1) (QREFELT $ 9))
                      (LETT |c| (ELT_U32 |r0| |dr0|) . #8#)
                      (LETT |c| (SPADCALL |c| |p| (QREFELT $ 32)) . #8#)
                      (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 29))
                      (LETT |t0| (GETREFV_U32 1 |c|) . #8#)
                      (EXIT
                       (COND
                        (|swapped|
                         (PROGN
                          (LETT #2# (LIST |r0| (GETREFV_U32 1 0) |t0|) . #8#)
                          (GO #10#)))
                        (#9#
                         (PROGN
                          (LETT #2# (LIST |r0| |t0| (GETREFV_U32 1 0)) . #8#)
                          (GO #10#)))))))))
              (|swapped| (|error| "impossible"))
              (#9#
               (SEQ
                (LETT |dt|
                      (COND
                       ((SPADCALL |dr0| 0 (QREFELT $ 43)) (|sub_SI| |dr0| 1))
                       (#9# 0))
                      . #8#)
                (LETT |ds|
                      (COND
                       ((SPADCALL |dr1| 0 (QREFELT $ 43)) (|sub_SI| |dr1| 1))
                       (#9# 0))
                      . #8#)
                (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0) . #8#)
                (LETT |t0| (GETREFV_U32 (|add_SI| |dt| 1) 0) . #8#)
                (LETT |s0| (GETREFV_U32 (|add_SI| |ds| 1) 0) . #8#)
                (SPADCALL |r0| |x| (|add_SI| |dr0| 1) (QREFELT $ 9))
                (SETELT_U32 |s0| 0 1)
                (LETT |r1| (GETREFV_U32 (|add_SI| |dr1| 1) 0) . #8#)
                (LETT |t1| (GETREFV_U32 (|add_SI| |dt| 1) 0) . #8#)
                (LETT |s1| (GETREFV_U32 (|add_SI| |ds| 1) 0) . #8#)
                (SPADCALL |r1| |y| (|add_SI| |dr1| 1) (QREFELT $ 9))
                (SETELT_U32 |t1| 0 1)
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |dr1| 0 (QREFELT $ 43))) (GO G191)))
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |dr0| |dr1| (QREFELT $ 51)))
                             (GO G191)))
                           (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|) . #8#)
                                (LETT |c1| (|sub_SI| |p| (ELT_U32 |r0| |dr0|))
                                      . #8#)
                                (LETT |c0| (ELT_U32 |r1| |dr1|) . #8#)
                                (COND
                                 ((SPADCALL |c0| 1 (QREFELT $ 35))
                                  (COND
                                   ((SPADCALL |delta| 30 (QREFELT $ 43))
                                    (SEQ
                                     (LETT |c0|
                                           (SPADCALL |c0| |p| (QREFELT $ 32))
                                           . #8#)
                                     (SPADCALL |r1| |dr1| |c0| |p|
                                               (QREFELT $ 29))
                                     (SPADCALL |t1| |dt| |c0| |p|
                                               (QREFELT $ 29))
                                     (SPADCALL |s1| |ds| |c0| |p|
                                               (QREFELT $ 29))
                                     (EXIT (LETT |c0| 1 . #8#)))))))
                                (SETELT_U32 |r0| |dr0| 0)
                                (LETT |dr0| (|sub_SI| |dr0| 1) . #8#)
                                (SPADCALL |r0| |c0| |r1| |c1| |dr0| |delta| |p|
                                          (QREFELT $ 31))
                                (SPADCALL |t0| |c0| |t1| |c1| |dt| |delta| |p|
                                          (QREFELT $ 31))
                                (SPADCALL |s0| |c0| |s1| |c1| |ds| |delta| |p|
                                          (QREFELT $ 31))
                                (EXIT
                                 (SEQ
                                  (EXIT
                                   (SEQ G190
                                        (COND
                                         ((NULL (EQL (ELT_U32 |r0| |dr0|) 0))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |dr0| (|sub_SI| |dr0| 1) . #8#)
                                         (EXIT
                                          (COND
                                           ((|less_SI| |dr0| 0)
                                            (PROGN
                                             (LETT #6# |$NoValue| . #8#)
                                             (GO #11=#:G861))))))
                                        NIL (GO G190) G191 (EXIT NIL)))
                                  #11# (EXIT #6#))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (PROGN
                       (LETT |#G121| |r1| . #8#)
                       (LETT |#G122| |r0| . #8#)
                       (LETT |r0| |#G121| . #8#)
                       (LETT |r1| |#G122| . #8#))
                      (PROGN
                       (LETT |#G123| |dr1| . #8#)
                       (LETT |#G124| |dr0| . #8#)
                       (LETT |dr0| |#G123| . #8#)
                       (LETT |dr1| |#G124| . #8#))
                      (PROGN
                       (LETT |#G125| |s1| . #8#)
                       (LETT |#G126| |s0| . #8#)
                       (LETT |s0| |#G125| . #8#)
                       (LETT |s1| |#G126| . #8#))
                      (EXIT
                       (PROGN
                        (LETT |#G127| |t1| . #8#)
                        (LETT |#G128| |t0| . #8#)
                        (LETT |t0| |#G127| . #8#)
                        (LETT |t1| |#G128| . #8#))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((SPADCALL |dr1| 0 (QREFELT $ 51))
                   (SEQ (LETT |c| (ELT_U32 |r1| 0) . #8#)
                        (LETT |c| (SPADCALL |c| |p| (QREFELT $ 32)) . #8#)
                        (SETELT_U32 |r1| 0 1)
                        (SPADCALL |s1| |ds| |c| |p| (QREFELT $ 29))
                        (SPADCALL |t1| |dt| |c| |p| (QREFELT $ 29))
                        (EXIT
                         (PROGN
                          (LETT #2# (LIST |r1| |s1| |t1|) . #8#)
                          (GO #10#)))))
                  (#9#
                   (SEQ (LETT |c| (ELT_U32 |r0| |dr0|) . #8#)
                        (LETT |c| (SPADCALL |c| |p| (QREFELT $ 32)) . #8#)
                        (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 29))
                        (SPADCALL |s0| |ds| |c| |p| (QREFELT $ 29))
                        (SPADCALL |t0| |dt| |c| |p| (QREFELT $ 29))
                        (EXIT (LIST |r0| |s0| |t0|))))))))))))
          #10# (EXIT #2#)))) 

(SDEFUN |POLYVEC;resultant;2Uv2I;26|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|) ($ |Integer|))
        (SPROG
         ((|res| (|SingleInteger|)) (#1=#:G887 NIL)
          (|dr0| #2=(|SingleInteger|)) (|c1| (|Integer|))
          (|delta| (|SingleInteger|)) (|c0| (|Integer|)) (|dr1| #2#)
          (|#G136| #2#) (|#G135| #2#) (|r1| #3=(|U32Vector|)) (|r0| #3#)
          (|#G134| #3#) (|#G133| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dr0| (SPADCALL |x| (QREFELT $ 30))
                  . #4=(|POLYVEC;resultant;2Uv2I;26|))
            (EXIT
             (COND ((|less_SI| |dr0| 0) 0)
                   (#5='T
                    (SEQ (LETT |dr1| (SPADCALL |y| (QREFELT $ 30)) . #4#)
                         (EXIT
                          (COND ((|less_SI| |dr1| 0) 0)
                                (#5#
                                 (SEQ
                                  (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0)
                                        . #4#)
                                  (SPADCALL |r0| |x| (|add_SI| |dr0| 1)
                                            (QREFELT $ 9))
                                  (LETT |r1| (GETREFV_U32 (|add_SI| |dr1| 1) 0)
                                        . #4#)
                                  (SPADCALL |r1| |y| (|add_SI| |dr1| 1)
                                            (QREFELT $ 9))
                                  (LETT |res| 1 . #4#)
                                  (EXIT
                                   (SEQ G190 NIL
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((|less_SI| |dr0| |dr1|)
                                            (SEQ
                                             (PROGN
                                              (LETT |#G133| |r1| . #4#)
                                              (LETT |#G134| |r0| . #4#)
                                              (LETT |r0| |#G133| . #4#)
                                              (LETT |r1| |#G134| . #4#))
                                             (EXIT
                                              (PROGN
                                               (LETT |#G135| |dr1| . #4#)
                                               (LETT |#G136| |dr0| . #4#)
                                               (LETT |dr0| |#G135| . #4#)
                                               (LETT |dr1| |#G136| . #4#)))))
                                           ('T
                                            (SEQ
                                             (LETT |c0| (ELT_U32 |r1| |dr1|)
                                                   . #4#)
                                             (EXIT
                                              (COND
                                               ((|eql_SI| |dr1| 0)
                                                (SEQ
                                                 (SEQ G190
                                                      (COND
                                                       ((NULL
                                                         (|less_SI| 0 |dr0|))
                                                        (GO G191)))
                                                      (SEQ
                                                       (LETT |res|
                                                             (QSMULMOD32 |res|
                                                                         |c0|
                                                                         |p|)
                                                             . #4#)
                                                       (EXIT
                                                        (LETT |dr0|
                                                              (|sub_SI| |dr0|
                                                                        1)
                                                              . #4#)))
                                                      NIL (GO G190) G191
                                                      (EXIT NIL))
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #1# |res| . #4#)
                                                   (GO #6=#:G886)))))
                                               ('T
                                                (SEQ
                                                 (LETT |delta|
                                                       (|sub_SI| |dr0| |dr1|)
                                                       . #4#)
                                                 (LETT |c1|
                                                       (|sub_SI| |p|
                                                                 (ELT_U32 |r0|
                                                                          |dr0|))
                                                       . #4#)
                                                 (COND
                                                  ((SPADCALL |c0| 1
                                                             (QREFELT $ 35))
                                                   (LETT |c1|
                                                         (QSMULMOD32 |c1|
                                                                     (SPADCALL
                                                                      |c0| |p|
                                                                      (QREFELT
                                                                       $ 32))
                                                                     |p|)
                                                         . #4#)))
                                                 (SETELT_U32 |r0| |dr0| 0)
                                                 (LETT |dr0| (|sub_SI| |dr0| 1)
                                                       . #4#)
                                                 (SPADCALL |r0| 1 |r1| |c1|
                                                           |dr0| |delta| |p|
                                                           (QREFELT $ 31))
                                                 (LETT |res|
                                                       (QSMULMOD32 |res| |c0|
                                                                   |p|)
                                                       . #4#)
                                                 (EXIT
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (EQL
                                                           (ELT_U32 |r0| |dr0|)
                                                           0))
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |dr0|
                                                              (|sub_SI| |dr0|
                                                                        1)
                                                              . #4#)
                                                        (EXIT
                                                         (COND
                                                          ((|less_SI| |dr0| 0)
                                                           (PROGN
                                                            (LETT #1# 0 . #4#)
                                                            (GO #6#)))
                                                          ('T
                                                           (LETT |res|
                                                                 (QSMULMOD32
                                                                  |res| |c0|
                                                                  |p|)
                                                                 . #4#)))))
                                                       NIL (GO G190) G191
                                                       (EXIT NIL))))))))))))
                                        NIL (GO G190) G191
                                        (EXIT NIL)))))))))))))
          #6# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |U32VectorPolynomialOperations;|)) 

(DEFUN |U32VectorPolynomialOperations| ()
  (SPROG NIL
         (PROG (#1=#:G889)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|U32VectorPolynomialOperations|)
                    . #2=(|U32VectorPolynomialOperations|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|U32VectorPolynomialOperations|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|U32VectorPolynomialOperations;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|U32VectorPolynomialOperations|)))))))))) 

(DEFUN |U32VectorPolynomialOperations;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|U32VectorPolynomialOperations|)
                . #1=(|U32VectorPolynomialOperations|))
          (LETT $ (GETREFV 55) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|U32VectorPolynomialOperations| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|U32VectorPolynomialOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|U32Vector|) (|Integer|)
              |POLYVEC;copy_first;2UvIV;1| |POLYVEC;copy_slice;2Uv2IV;2|
              |POLYVEC;eval_at;Uv4I;3| (|Boolean|)
              (|SparseUnivariatePolynomial| 8) (0 . |zero?|) (5 . |One|)
              (|NonNegativeInteger|) (9 . |degree|) (14 . |leadingCoefficient|)
              (19 . |positiveRemainder|) (25 . |reductum|)
              |POLYVEC;to_mod_pa;SupIUv;4| (30 . |Zero|) (34 . |monomial|)
              (40 . +) |POLYVEC;pa_to_sup;UvSup;5|
              |POLYVEC;vector_add_mul;2Uv4IV;6|
              |POLYVEC;mul_by_binomial;Uv3IV;7|
              |POLYVEC;mul_by_binomial;Uv2IV;8| |POLYVEC;mul_by_scalar;Uv3IV;9|
              |POLYVEC;degree;UvI;10| |POLYVEC;vector_combination;UvIUv4IV;11|
              (46 . |invmod|) |POLYVEC;divide!;3UvIV;12|
              |POLYVEC;remainder!;2UvIV;13| (52 . ~=) (58 . >)
              |POLYVEC;gcd;2UvIUv;14| (|PrimitiveArray| 7)
              |POLYVEC;gcd;Pa3IUv;15| |POLYVEC;mul;2UvIUv;18|
              |POLYVEC;lcm;Pa3IUv;17| (|SingleInteger|) (64 . >) (70 . |copy|)
              |POLYVEC;truncated_mul_add;3Uv2IV;20|
              |POLYVEC;truncated_multiplication;2Uv2IUv;21| (|PositiveInteger|)
              |POLYVEC;pow;UvPiNniIUv;22| |POLYVEC;differentiate;UvIUv;23|
              |POLYVEC;differentiate;UvNniIUv;24| (75 . >=) (|List| 7)
              |POLYVEC;extended_gcd;2UvIL;25| |POLYVEC;resultant;2Uv2I;26|)
           '#(|vector_combination| 81 |vector_add_mul| 92
              |truncated_multiplication| 102 |truncated_mul_add| 110
              |to_mod_pa| 119 |resultant| 125 |remainder!| 132 |pow| 139
              |pa_to_sup| 147 |mul_by_scalar| 152 |mul_by_binomial| 160 |mul|
              175 |lcm| 182 |gcd| 190 |extended_gcd| 205 |eval_at| 212
              |divide!| 220 |differentiate| 228 |degree| 241 |copy_slice| 246
              |copy_first| 254)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 54
                                                 '(1 13 12 0 14 0 13 0 15 1 13
                                                   16 0 17 1 13 8 0 18 2 8 0 0
                                                   0 19 1 13 0 0 20 0 13 0 22 2
                                                   13 0 8 16 23 2 13 0 0 0 24 2
                                                   8 0 0 0 32 2 8 12 0 0 35 2 8
                                                   12 0 0 36 2 42 12 0 0 43 1 7
                                                   0 0 44 2 42 12 0 0 51 7 0 6
                                                   7 8 7 8 8 8 8 31 6 0 6 7 7 8
                                                   8 8 8 26 4 0 7 7 7 8 8 46 5
                                                   0 6 7 7 7 8 8 45 2 0 7 13 8
                                                   21 3 0 8 7 7 8 54 3 0 6 7 7
                                                   8 34 4 0 7 7 47 16 8 48 1 0
                                                   13 7 25 4 0 6 7 8 8 8 29 4 0
                                                   6 7 8 8 8 27 3 0 6 7 8 8 28
                                                   3 0 7 7 7 8 40 4 0 7 38 8 8
                                                   8 41 3 0 7 7 7 8 37 4 0 7 38
                                                   8 8 8 39 3 0 52 7 7 8 53 4 0
                                                   8 7 8 8 8 11 4 0 6 7 7 7 8
                                                   33 2 0 7 7 8 49 3 0 7 7 16 8
                                                   50 1 0 8 7 30 4 0 6 7 7 8 8
                                                   10 3 0 6 7 7 8 9)))))
           '|lookupComplete|)) 

(MAKEPROP '|U32VectorPolynomialOperations| 'NILADIC T) 
