
(PUT '|MODFT1;get_char;2I;1| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |MODFT1;get_char;2I;1| ((|p| (|Integer|)) (% (|Integer|))) |p|) 

(PUT '|MODFT1;get_extension_degree;2I;2| '|SPADreplace| '(XLAM (|p|) 1)) 

(SDEFUN |MODFT1;get_extension_degree;2I;2| ((|p| (|Integer|)) (% (|Integer|)))
        1) 

(SDEFUN |MODFT1;degree;UvI;3| ((|pol| (|U32Vector|)) (% (|Integer|)))
        (SPADCALL |pol| (QREFELT % 11))) 

(SDEFUN |MODFT1;monomial1;IUv;4| ((|p| (|Integer|)) (% (|U32Vector|)))
        (SPROG ((|res| (|U32Vector|)))
               (SEQ (LETT |res| (GETREFV_U32 2 0)) (SETELT_U32 |res| 1 1)
                    (EXIT |res|)))) 

(PUT '|MODFT1;empty_poly;Uv;5| '|SPADreplace| '(XLAM NIL (GETREFV_U32 0 0))) 

(SDEFUN |MODFT1;empty_poly;Uv;5| ((% (|U32Vector|))) (GETREFV_U32 0 0)) 

(SDEFUN |MODFT1;gcd;2UvIUv;6|
        ((|pol1| #1=(|U32Vector|)) (|pol2| #1#) (|p| (|Integer|)) (% #1#))
        (SPADCALL |pol1| |pol2| |p| (QREFELT % 15))) 

(SDEFUN |MODFT1;sub1!;UvIUv;7|
        ((|pol| #1=(|U32Vector|)) (|p| (|Integer|)) (% #1#))
        (SEQ (COND ((EQL (QV_LEN_U32 |pol|) 0) (LETT |pol| (GETREFV_U32 1 0))))
             (COND ((EQL (ELT_U32 |pol| 0) 0) (SETELT_U32 |pol| 0 (- |p| 1)))
                   ('T (SETELT_U32 |pol| 0 (- (ELT_U32 |pol| 0) 1))))
             (EXIT |pol|))) 

(SDEFUN |MODFT1;copy_poly;Uv2IUv;8|
        ((|pol| (|U32Vector|)) (|n| (|Integer|)) (|p| (|Integer|))
         (% (|U32Vector|)))
        (SPROG ((|res| (|U32Vector|)) (|n0| (|NonNegativeInteger|)))
               (SEQ (LETT |n0| (+ (SPADCALL |pol| (QREFELT % 12)) 1))
                    (EXIT
                     (COND
                      ((< |n| |n0|)
                       (|error| "copy_poly: degree of pol too large"))
                      ('T
                       (SEQ (LETT |res| (GETREFV_U32 |n| 0))
                            (SPADCALL |res| |pol| |n0| (QREFELT % 19))
                            (EXIT |res|)))))))) 

(SDEFUN |MODFT1;random_poly;2IUv;9|
        ((|n| (|Integer|)) (|p| (|Integer|)) (% (|U32Vector|)))
        (SPROG ((#1=#:G30 NIL) (|i| NIL) (|res| (|U32Vector|)))
               (SEQ (LETT |res| (GETREFV_U32 (+ |n| 1) 0))
                    (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (EXIT (SETELT_U32 |res| |i| (RANDOM |p|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |MODFT1;divide!;2UvIUv;10|
        ((|pol| #1=(|U32Vector|)) (|dpol| #1#) (|p| (|Integer|)) (% #1#))
        (SPROG
         ((|res| (|U32Vector|)) (|dr| (|NonNegativeInteger|))
          (|dd| #2=(|Integer|)) (|dp| #2#))
         (SEQ (LETT |dp| (SPADCALL |pol| (QREFELT % 12)))
              (LETT |dd| (SPADCALL |dpol| (QREFELT % 12)))
              (LETT |dr| (- |dp| |dd|)) (LETT |res| (GETREFV_U32 (+ |dr| 1) 0))
              (SPADCALL |pol| |dpol| |res| |p| (QREFELT % 22)) (EXIT |res|)))) 

(SDEFUN |MODFT1;add_poly;2UvIUv;11|
        ((|pol1| #1=(|U32Vector|)) (|pol2| #1#) (|p| (|Integer|)) (% #1#))
        (SPROG
         ((|res| (|U32Vector|)) (|dr| (|Integer|)) (|d2| #2=(|Integer|))
          (|d1| #2#))
         (SEQ (LETT |d1| (SPADCALL |pol1| (QREFELT % 12)))
              (LETT |d2| (SPADCALL |pol2| (QREFELT % 12)))
              (LETT |dr| (MAX |d1| |d2|))
              (LETT |res| (SPADCALL |pol1| (+ |dr| 1) |p| (QREFELT % 20)))
              (SPADCALL |res| |pol2| 0 |d2| 1 |p| (QREFELT % 24))
              (EXIT |res|)))) 

(SDEFUN |MODFT1;sub_poly;2UvIUv;12|
        ((|pol1| #1=(|U32Vector|)) (|pol2| #1#) (|p| (|Integer|)) (% #1#))
        (SPROG
         ((|res| (|U32Vector|)) (|dr| (|Integer|)) (|d2| #2=(|Integer|))
          (|d1| #2#))
         (SEQ (LETT |d1| (SPADCALL |pol1| (QREFELT % 12)))
              (LETT |d2| (SPADCALL |pol2| (QREFELT % 12)))
              (LETT |dr| (MAX |d1| |d2|))
              (LETT |res| (SPADCALL |pol1| (+ |dr| 1) |p| (QREFELT % 20)))
              (SPADCALL |res| |pol2| 0 |d2| (- |p| 1) |p| (QREFELT % 24))
              (EXIT |res|)))) 

(SDEFUN |MODFT1;ini_rdata;UvIL;13|
        ((|pol| (|U32Vector|)) (|p| (|Integer|))
         (%
          (|List|
           #1=(|Record| (|:| |ind| (|NonNegativeInteger|))
                        (|:| |poly| (|U32Vector|))))))
        (SPROG
         ((|res| (|List| #1#)) (|tmp1| (|U32Vector|)) (#2=#:G49 NIL) (|i| NIL)
          (|ni| #3=(|Integer|)) (|ii| #3#) (|nn| (|Integer|))
          (|tmp| (|U32Vector|)) (|n1| #3#) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |pol| (SPADCALL |pol| (QREFELT % 27)))
              (LETT |n| (SPADCALL |pol| (QREFELT % 12)))
              (LETT |res| (LIST (CONS |p| |pol|)))
              (LETT |ni| (LETT |n1| (- |n| 1)))
              (LETT |tmp| (GETREFV_U32 (* 2 |n1|) 0))
              (SEQ G190 (COND ((NULL (> |ni| 10)) (GO G191)))
                   (SEQ (LETT |nn| (QUOTIENT2 (- |ni| 1) 2))
                        (LETT |ii| (- (+ |n1| |ni|) |nn|))
                        (LETT |ni| (- (- |ii| |n1|) 1))
                        (SEQ (LETT |i| 0) (LETT #2# |n1|) G190
                             (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ (EXIT (SETELT_U32 |tmp| |i| 0)))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (SETELT_U32 |tmp| |ii| 1)
                        (SPADCALL |tmp| |pol| |p| (QREFELT % 28))
                        (LETT |tmp1| (SPADCALL |tmp| |n| |p| (QREFELT % 20)))
                        (EXIT (LETT |res| (CONS (CONS |ii| |tmp1|) |res|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |MODFT1;get_mod;LI;14|
        ((|rdata|
          (|List|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (% (|Integer|)))
        (SPROG
         ((|r0|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (SEQ (LETT |r0| (|SPADfirst| |rdata|)) (EXIT (QCAR |r0|))))) 

(SDEFUN |MODFT1;copy_slice2|
        ((|np| (|U32Vector|)) (|op| (|U32Vector|)) (|n| (|Integer|))
         (|m| (|Integer|)) (% (|Void|)))
        (SPROG ((#1=#:G56 NIL) (|i| NIL))
               (SEQ (LETT |i| 0) (LETT #1# (- |m| 1)) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT (SETELT_U32 |np| |i| (ELT_U32 |op| (+ |n| |i|)))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |MODFT1;red_pol!;UvLUv;16|
        ((|pol| (|U32Vector|))
         (|rdata|
          (|List|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (% (|U32Vector|)))
        (SPROG
         ((#1=#:G77 NIL) (|i| NIL) (#2=#:G76 NIL) (|n1| #3=(|Integer|))
          (|mi| #4=(|Integer|)) (|tmp| (|U32Vector|)) (|mi0| #4#) (|ni| #3#)
          (|ii| #5=(|NonNegativeInteger|)) (#6=#:G75 NIL) (|ri| NIL) (|n0| #3#)
          (|f| (|U32Vector|)) (|p| #5#)
          (|r0|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (SEQ (LETT |r0| (|SPADfirst| |rdata|)) (LETT |p| (QCAR |r0|))
              (LETT |f| (QCDR |r0|)) (LETT |n0| (SPADCALL |f| (QREFELT % 12)))
              (LETT |rdata| (CDR |rdata|))
              (SEQ (LETT |ri| NIL) (LETT #6# |rdata|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |ri| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ii| (QCAR |ri|))
                        (LETT |ni| (SPADCALL |pol| (QREFELT % 12)))
                        (EXIT
                         (COND
                          ((>= |ni| |ii|)
                           (SEQ (LETT |mi| (+ (- |ni| |ii|) 1))
                                (LETT |mi0| (+ (- |ii| |n0|) 1))
                                (COND
                                 ((<= |mi| |mi0|)
                                  (SEQ (LETT |tmp| (GETREFV_U32 |mi| 0))
                                       (|MODFT1;copy_slice2| |tmp| |pol| |ii|
                                        |mi| %)
                                       (EXIT
                                        (SPADCALL |tmp| (QCDR |ri|) |pol|
                                                  (- (+ |n0| |mi|) 2) |p|
                                                  (QREFELT % 33)))))
                                 ('T
                                  (SEQ (LETT |tmp| (GETREFV_U32 |mi0| 0))
                                       (LETT |n1| |ni|)
                                       (EXIT
                                        (SEQ G190
                                             (COND
                                              ((NULL (>= |n1| |ii|))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |mi| (+ (- |n1| |ii|) 1))
                                              (LETT |n1| (- |n1| |mi0|))
                                              (EXIT
                                               (COND
                                                ((< |mi| |mi0|)
                                                 (SEQ
                                                  (|MODFT1;copy_slice2| |tmp|
                                                   |pol| |ii| |mi| %)
                                                  (SEQ (LETT |i| |mi|)
                                                       (LETT #2# (- |mi0| 1))
                                                       G190
                                                       (COND
                                                        ((> |i| #2#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (SETELT_U32 |tmp| |i|
                                                                     0)))
                                                       (LETT |i| (+ |i| 1))
                                                       (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (SPADCALL |tmp| (QCDR |ri|)
                                                             |pol|
                                                             (- (+ |n0| |mi|)
                                                                2)
                                                             |p|
                                                             (QREFELT % 33)))))
                                                ('T
                                                 (SEQ
                                                  (|MODFT1;copy_slice2| |tmp|
                                                   |pol| (+ |n1| 1) |mi0| %)
                                                  (EXIT
                                                   (SPADCALL |tmp| (QCDR |ri|)
                                                             |pol|
                                                             (+ (- |n1| |ii|)
                                                                1)
                                                             (+ |n1| 1) |p|
                                                             (QREFELT %
                                                                      34))))))))
                                             NIL (GO G190) G191 (EXIT NIL))))))
                                (EXIT
                                 (SEQ (LETT |i| |ii|) (LETT #1# |ni|) G190
                                      (COND ((> |i| #1#) (GO G191)))
                                      (SEQ (EXIT (SETELT_U32 |pol| |i| 0)))
                                      (LETT |i| (+ |i| 1)) (GO G190) G191
                                      (EXIT NIL))))))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (SPADCALL |pol| |f| |p| (QREFELT % 28)) (EXIT |pol|)))) 

(SDEFUN |MODFT1;mul_and_red|
        ((|res| (|U32Vector|)) (|pow| (|U32Vector|))
         (|rdata|
          (|List|
           (|Record| (|:| |ind| #1=(|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (% (|Void|)))
        (SPROG
         ((#2=#:G83 NIL) (|i| NIL) (|n| #3=(|NonNegativeInteger|)) (|n1| #3#)
          (|res1| (|U32Vector|)) (|p| #1#)
          (|r0|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (SEQ (LETT |r0| (|SPADfirst| |rdata|)) (LETT |p| (QCAR |r0|))
              (LETT |res1| (SPADCALL |pow| |res| |p| (QREFELT % 36)))
              (LETT |res1| (SPADCALL |res1| |rdata| (QREFELT % 35)))
              (LETT |n1| (QV_LEN_U32 |res1|)) (LETT |n| (QV_LEN_U32 |res|))
              (SPADCALL |res| |res1| (MIN |n| |n1|) (QREFELT % 19))
              (EXIT
               (SEQ (LETT |i| |n1|) (LETT #2# (- |n| 1)) G190
                    (COND ((> |i| #2#) (GO G191)))
                    (SEQ (EXIT (SETELT_U32 |res| |i| 0))) (LETT |i| (+ |i| 1))
                    (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |MODFT1;mod_exp;UvILUv;18|
        ((|pol| (|U32Vector|)) (|n| (|Integer|))
         (|rdata|
          (|List|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (% (|U32Vector|)))
        (SPROG
         ((#1=#:G92 NIL) (|has_res| (|Boolean|)) (|res| (|U32Vector|))
          (|pow| (|U32Vector|)) (|m| (|NonNegativeInteger|))
          (|f| (|U32Vector|)) (|p| (|NonNegativeInteger|))
          (|r0|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (SEQ
          (COND ((<= |n| 0) (|error| "mod_exp: n must be positive"))
                ('T
                 (SEQ (LETT |r0| (|SPADfirst| |rdata|)) (LETT |p| (QCAR |r0|))
                      (LETT |f| (QCDR |r0|))
                      (LETT |m| (SPADCALL |f| (QREFELT % 12)))
                      (LETT |pow| (SPADCALL |pol| |m| |p| (QREFELT % 20)))
                      (LETT |res| (GETREFV_U32 |m| 0)) (LETT |has_res| NIL)
                      (SEQ
                       (EXIT
                        (SEQ G190 (COND ((NULL (> |n| 0)) (GO G191)))
                             (SEQ
                              (COND
                               ((ODDP |n|)
                                (COND
                                 (|has_res|
                                  (|MODFT1;mul_and_red| |res| |pow| |rdata| %))
                                 ('T
                                  (SEQ
                                   (SPADCALL |res| |pow| |m| (QREFELT % 19))
                                   (EXIT (LETT |has_res| 'T)))))))
                              (LETT |n| (QUOTIENT2 |n| 2))
                              (EXIT
                               (COND
                                ((EQL |n| 0)
                                 (PROGN (LETT #1# |$NoValue|) (GO #2=#:G89)))
                                ('T
                                 (|MODFT1;mul_and_red| |pow| |pow| |rdata|
                                  %)))))
                             NIL (GO G190) G191 (EXIT NIL)))
                       #2# (EXIT #1#))
                      (EXIT |res|))))))) 

(PUT '|MODFT1;empty_mat;Um;19| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX_U32 0 0))) 

(SDEFUN |MODFT1;empty_mat;Um;19| ((% (|U32Matrix|))) (MAKE_MATRIX_U32 0 0)) 

(SDEFUN |MODFT1;empty_mat?;UmB;20| ((|mat| (|U32Matrix|)) (% (|Boolean|)))
        (SPADCALL |mat| (QREFELT % 41))) 

(SDEFUN |MODFT1;mmul|
        ((|m1| (|U32Matrix|)) (|m2| (|U32Matrix|)) (|d2| (|Integer|))
         (|p| (|Integer|)) (% (|U32Matrix|)))
        (SPROG
         ((|ss| (|Integer|)) (#1=#:G108 NIL) (|k| NIL) (#2=#:G107 NIL)
          (|j| NIL) (#3=#:G106 NIL) (|i| NIL) (|res| (|U32Matrix|))
          (|nr2| (|NonNegativeInteger|)) (|nc1| (|NonNegativeInteger|))
          (|nr1| (|NonNegativeInteger|)))
         (SEQ (LETT |nr1| (ANROWS_U32 |m1|)) (LETT |nc1| (ANCOLS_U32 |m1|))
              (EXIT
               (COND
                ((OR (< (ANCOLS_U32 |m2|) |nc1|) (< (ANROWS_U32 |m2|) |d2|))
                 (|error| "mmul: m2 too small"))
                ('T
                 (SEQ (LETT |nr2| |d2|)
                      (LETT |res| (MAKE_MATRIX1_U32 |nr1| |nr2| 0))
                      (SEQ (LETT |i| 0) (LETT #3# (- |nr1| 1)) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |j| 0) (LETT #2# (- |nr2| 1)) G190
                                  (COND ((|greater_SI| |j| #2#) (GO G191)))
                                  (SEQ (LETT |ss| 0)
                                       (SEQ (LETT |k| 0) (LETT #1# (- |nc1| 1))
                                            G190
                                            (COND
                                             ((|greater_SI| |k| #1#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |ss|
                                                    (QSMULADD64_32
                                                     (AREF2_U32 |m1| |i| |k|)
                                                     (AREF2_U32 |m2| |j| |k|)
                                                     |ss|))))
                                            (LETT |k| (|inc_SI| |k|)) (GO G190)
                                            G191 (EXIT NIL))
                                       (EXIT
                                        (SETAREF2_U32 |res| |i| |j|
                                                      (QSMOD64_32 |ss| |p|))))
                                  (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MODFT1;copy_mat_part;UmIUm;22|
        ((|m| (|U32Matrix|)) (|nr| (|Integer|)) (% (|U32Matrix|)))
        (SPROG
         ((#1=#:G116 NIL) (|j| NIL) (#2=#:G115 NIL) (|i| NIL)
          (|res| (|U32Matrix|)) (|nc| (|Integer|)))
         (SEQ (LETT |nc| (MIN (ANCOLS_U32 |m|) |nr|))
              (LETT |res| (MAKE_MATRIX1_U32 |nr| |nc| 0))
              (SEQ (LETT |i| 0) (LETT #2# (- |nr| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 0) (LETT #1# (- |nc| 1)) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETAREF2_U32 |res| |i| |j|
                                          (AREF2_U32 |m| |i| |j|))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODFT1;shift_mat!;Um2IV;23|
        ((|m| (|U32Matrix|)) (|sa| #1=(|Integer|)) (|nr| #1#) (% (|Void|)))
        (SPROG
         ((#2=#:G124 NIL) (|j| NIL) (#3=#:G123 NIL) (|i| NIL)
          (|nc| (|Integer|)))
         (SEQ (LETT |nc| (MIN (ANCOLS_U32 |m|) |nr|))
              (EXIT
               (SEQ (LETT |i| 0) (LETT #3# (- |nr| 1)) G190
                    (COND ((|greater_SI| |i| #3#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |j| 0) (LETT #2# (- |nc| 1)) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SETAREF2_U32 |m| |i| |j|
                                           (AREF2_U32 |m| (+ |i| |sa|) |j|))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |MODFT1;trim_mat!;Um2ILV;24|
        ((|m| (|U32Matrix|)) (|nr0| #1=(|Integer|)) (|nr1| #1#)
         (|rdata|
          (|List|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (% (|Void|)))
        (SPROG
         ((#2=#:G138 NIL) (|i| NIL) (|tmp1| (|U32Vector|)) (#3=#:G137 NIL)
          (#4=#:G136 NIL) (|j| NIL) (|tmp| (|U32Vector|)) (|nc| (|Integer|)))
         (SEQ
          (COND ((< (ANROWS_U32 |m|) |nr0|) (|error| "trim_mat!: m too small"))
                ('T
                 (SEQ (LETT |nc| (MIN (ANCOLS_U32 |m|) |nr1|))
                      (LETT |tmp| (GETREFV_U32 |nr0| 0))
                      (EXIT
                       (SEQ (LETT |j| 0) (LETT #4# (- |nc| 1)) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (SEQ (LETT |i| 0) (LETT #3# (- |nr0| 1)) G190
                                  (COND ((|greater_SI| |i| #3#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SETELT_U32 |tmp| |i|
                                                (AREF2_U32 |m| |i| |j|))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |tmp1|
                                   (SPADCALL |tmp| |rdata| (QREFELT % 35)))
                             (EXIT
                              (SEQ (LETT |i| 0) (LETT #2# (- |nr1| 1)) G190
                                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SETAREF2_U32 |m| |i| |j|
                                                   (ELT_U32 |tmp1| |i|))))
                                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))))))) 

(SDEFUN |MODFT1;split_mat!;Um3I2LV;25|
        ((|m| (|U32Matrix|)) (|nr0| #1=(|Integer|)) (|nr1| #1#) (|nr2| #1#)
         (|rdata1|
          #2=(|List|
              (|Record| (|:| |ind| (|NonNegativeInteger|))
                        (|:| |poly| (|U32Vector|)))))
         (|rdata2| #2#) (% (|Void|)))
        (SPROG
         ((#3=#:G158 NIL) (|i| NIL) (|rtmp| (|U32Vector|)) (#4=#:G157 NIL)
          (#5=#:G156 NIL) (#6=#:G155 NIL) (|j| NIL) (|tmp2| #7=(|U32Vector|))
          (|tmp1| #7#) (|nc| (|Integer|)))
         (SEQ
          (COND
           ((< (ANROWS_U32 |m|) |nr1|) (|error| "split_mat!: m too small"))
           ('T
            (SEQ (LETT |nc| (MIN (ANCOLS_U32 |m|) (MAX |nr1| |nr2|)))
                 (LETT |tmp1| (GETREFV_U32 |nr0| 0))
                 (LETT |tmp2| (GETREFV_U32 |nr0| 0))
                 (EXIT
                  (SEQ (LETT |j| 0) (LETT #6# (- |nc| 1)) G190
                       (COND ((|greater_SI| |j| #6#) (GO G191)))
                       (SEQ
                        (SEQ (LETT |i| 0) (LETT #5# (- |nr0| 1)) G190
                             (COND ((|greater_SI| |i| #5#) (GO G191)))
                             (SEQ
                              (SETELT_U32 |tmp1| |i| (AREF2_U32 |m| |i| |j|))
                              (EXIT
                               (SETELT_U32 |tmp2| |i| (ELT_U32 |tmp1| |i|))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((< |j| |nr1|)
                          (SEQ
                           (LETT |rtmp|
                                 (SPADCALL |tmp1| |rdata1| (QREFELT % 35)))
                           (EXIT
                            (SEQ (LETT |i| 0) (LETT #4# (- |nr1| 1)) G190
                                 (COND ((|greater_SI| |i| #4#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SETAREF2_U32 |m| |i| |j|
                                                 (ELT_U32 |rtmp| |i|))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))))))
                        (EXIT
                         (COND
                          ((< |j| |nr2|)
                           (SEQ
                            (LETT |rtmp|
                                  (SPADCALL |tmp2| |rdata2| (QREFELT % 35)))
                            (EXIT
                             (SEQ (LETT |i| 0) (LETT #3# (- |nr2| 1)) G190
                                  (COND ((|greater_SI| |i| #3#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SETAREF2_U32 |m| (+ |i| |nr1|) |j|
                                                  (ELT_U32 |rtmp| |i|))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))))))))
                       (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                       (EXIT NIL))))))))) 

(SDEFUN |MODFT1;power_matrix;UvNniLR;26|
        ((|xp| (|U32Vector|)) (|l| (|NonNegativeInteger|))
         (|rdata|
          (|List|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (% (|Record| (|:| |matr| (|U32Matrix|)) (|:| |poly| (|U32Vector|)))))
        (SPROG
         ((#1=#:G170 NIL) (|k| NIL) (#2=#:G169 NIL) (|j| NIL)
          (|n1| (|SingleInteger|)) (|l1| (|Integer|)) (|pow| (|U32Vector|))
          (|pm| (|U32Matrix|)) (|n| (|NonNegativeInteger|)) (|f| (|U32Vector|))
          (|p| (|NonNegativeInteger|))
          (|r0|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (SEQ (LETT |r0| (|SPADfirst| |rdata|)) (LETT |p| (QCAR |r0|))
              (LETT |f| (QCDR |r0|)) (LETT |n| (SPADCALL |f| (QREFELT % 12)))
              (LETT |pm| (MAKE_MATRIX1_U32 |n| |l| 0))
              (SETAREF2_U32 |pm| 0 0 1)
              (LETT |pow| (SPADCALL |xp| |n| |p| (QREFELT % 20)))
              (LETT |l1| (- |l| 1)) (LETT |n1| (- |n| 1))
              (SEQ (LETT |j| 1) (LETT #2# |l1|) G190
                   (COND ((|greater_SI| |j| #2#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |k| 0) (LETT #1# (- |n| 1)) G190
                         (COND ((|greater_SI| |k| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SETAREF2_U32 |pm| |k| |j| (ELT_U32 |pow| |k|))))
                         (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (|MODFT1;mul_and_red| |pow| |xp| |rdata| %)))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |pm| |pow|))))) 

(SDEFUN |MODFT1;modular_compose;UvUmUvNniLUv;27|
        ((|pol| #1=(|U32Vector|)) (|pm| (|U32Matrix|)) (|xp1| #1#)
         (|l1| (|NonNegativeInteger|))
         (|rdata|
          (|List|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (% (|U32Vector|)))
        (SPROG
         ((#2=#:G188 NIL) (|i| (|SingleInteger|)) (|k| NIL)
          (|ns1| (|SingleInteger|)) (|res| #3=(|U32Vector|)) (|p1| #3#)
          (|m2| (|U32Matrix|)) (#4=#:G187 NIL) (#5=#:G186 NIL) (|j| NIL)
          (|k1| #6=(|SingleInteger|)) (|l1s| #6#) (|m1| (|U32Matrix|))
          (|l2| #7=(|NonNegativeInteger|)) (|dps1| #6#) (|dp| #7#)
          (|dp0| (|Integer|)) (|ns| #6#) (|n| #7#) (|f| (|U32Vector|))
          (|p| (|NonNegativeInteger|))
          (|r0|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (SEQ (LETT |r0| (|SPADfirst| |rdata|)) (LETT |p| (QCAR |r0|))
              (LETT |f| (QCDR |r0|)) (LETT |n| (SPADCALL |f| (QREFELT % 12)))
              (LETT |ns| |n|) (LETT |dp0| (SPADCALL |pol| (QREFELT % 12)))
              (EXIT
               (COND ((< |dp0| 0) (GETREFV_U32 |n| 0))
                     (#8='T
                      (SEQ (LETT |dp| |dp0|) (LETT |dps1| (+ |dp| 1))
                           (LETT |l2| (QUOTIENT2 (+ |dp| |l1|) |l1|))
                           (COND ((EQL |l2| 1) (LETT |l1| (+ |dp| 1))))
                           (LETT |m1| (MAKE_MATRIX1_U32 |l2| |l1| 0))
                           (LETT |i| 0) (LETT |l1s| (- |l1| 1))
                           (LETT |k1| (- |l2| 1))
                           (SEQ (LETT |j| 0) (LETT #5# |k1|) G190
                                (COND ((|greater_SI| |j| #5#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |k| 0) (LETT #4# |l1s|) G190
                                       (COND
                                        ((OR (|greater_SI| |k| #4#)
                                             (NULL (|less_SI| |i| |dps1|)))
                                         (GO G191)))
                                       (SEQ
                                        (SETAREF2_U32 |m1| |j| |k|
                                                      (ELT_U32 |pol| |i|))
                                        (EXIT (LETT |i| (|add_SI| |i| 1))))
                                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))
                           (LETT |m2| (|MODFT1;mmul| |m1| |pm| |n| |p| %))
                           (EXIT
                            (COND
                             ((SPADCALL (ANCOLS_U32 |m2|) |n| (QREFELT % 50))
                              (|error|
                               "modular_compose: unexpected dimension of m2"))
                             (#8#
                              (SEQ (LETT |p1| (GETREFV_U32 |n| 0))
                                   (LETT |res| (GETREFV_U32 |n| 0))
                                   (LETT |ns1| (|sub_SI| |ns| 1))
                                   (SEQ (LETT |k| |k1|) G190
                                        (COND ((< |k| 0) (GO G191)))
                                        (SEQ
                                         (SEQ (LETT |i| 0) (LETT #2# |ns1|)
                                              G190
                                              (COND
                                               ((|greater_SI| |i| #2#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (SETELT_U32 |p1| |i|
                                                            (AREF2_U32 |m2| |k|
                                                                       |i|))))
                                              (LETT |i| (|inc_SI| |i|))
                                              (GO G190) G191 (EXIT NIL))
                                         (COND
                                          ((< |k| |k1|)
                                           (|MODFT1;mul_and_red| |res| |xp1|
                                            |rdata| %)))
                                         (EXIT
                                          (SPADCALL |res| |p1| 0 |ns1| 1 |p|
                                                    (QREFELT % 24))))
                                        (LETT |k| (+ |k| -1)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT |res|)))))))))))) 

(DECLAIM (NOTINLINE |ModularFactorizationTools1;|)) 

(DEFUN |ModularFactorizationTools1;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularFactorizationTools1|))
          (LETT % (GETREFV 52))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ModularFactorizationTools1| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ModularFactorizationTools1| ()
  (SPROG NIL
         (PROG (#1=#:G192)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|ModularFactorizationTools1|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularFactorizationTools1|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|ModularFactorizationTools1;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|ModularFactorizationTools1|)))))))))) 

(MAKEPROP '|ModularFactorizationTools1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |MODFT1;get_char;2I;1|
              |MODFT1;get_extension_degree;2I;2| (|U32Vector|)
              (|U32VectorPolynomialOperations|) (0 . |degree|)
              |MODFT1;degree;UvI;3| |MODFT1;monomial1;IUv;4|
              |MODFT1;empty_poly;Uv;5| (5 . |gcd|) |MODFT1;gcd;2UvIUv;6|
              |MODFT1;sub1!;UvIUv;7| (|Void|) (12 . |copy_first|)
              |MODFT1;copy_poly;Uv2IUv;8| |MODFT1;random_poly;2IUv;9|
              (19 . |divide!|) |MODFT1;divide!;2UvIUv;10|
              (27 . |vector_add_mul|) |MODFT1;add_poly;2UvIUv;11|
              |MODFT1;sub_poly;2UvIUv;12| (37 . |copy|) (42 . |remainder!|)
              (|Record| (|:| |ind| 48) (|:| |poly| 9)) (|List| 29)
              |MODFT1;ini_rdata;UvIL;13| |MODFT1;get_mod;LI;14|
              (49 . |truncated_mul_add|) (58 . |truncated_mul_add2|)
              |MODFT1;red_pol!;UvLUv;16| (68 . |mul|)
              |MODFT1;mod_exp;UvILUv;18| (|U32Matrix|) |MODFT1;empty_mat;Um;19|
              (|Boolean|) (75 . |empty?|) |MODFT1;empty_mat?;UmB;20|
              |MODFT1;copy_mat_part;UmIUm;22| |MODFT1;shift_mat!;Um2IV;23|
              |MODFT1;trim_mat!;Um2ILV;24| |MODFT1;split_mat!;Um3I2LV;25|
              (|Record| (|:| |matr| 38) (|:| |poly| 9)) (|NonNegativeInteger|)
              |MODFT1;power_matrix;UvNniLR;26| (80 . ~=)
              |MODFT1;modular_compose;UvUmUvNniLUv;27|)
           '#(|trim_mat!| 86 |sub_poly| 94 |sub1!| 101 |split_mat!| 107
              |shift_mat!| 117 |red_pol!| 124 |random_poly| 130 |power_matrix|
              136 |monomial1| 143 |modular_compose| 148 |mod_exp| 157
              |ini_rdata| 164 |get_mod| 170 |get_extension_degree| 175
              |get_char| 180 |gcd| 185 |empty_poly| 192 |empty_mat?| 196
              |empty_mat| 201 |divide!| 205 |degree| 212 |copy_poly| 217
              |copy_mat_part| 224 |add_poly| 230)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|ModularFactorizationOperations| 9 38 6 30))
                             (|makeByteWordVec2| 51
                                                 '(1 10 6 9 11 3 10 9 9 9 6 15
                                                   3 10 18 9 9 6 19 4 10 18 9 9
                                                   9 6 22 6 10 18 9 9 6 6 6 6
                                                   24 1 9 0 0 27 3 10 18 9 9 6
                                                   28 5 10 18 9 9 9 6 6 33 6 10
                                                   18 9 9 9 6 6 6 34 3 10 9 9 9
                                                   6 36 1 38 40 0 41 2 48 40 0
                                                   0 50 4 0 18 38 6 6 30 45 3 0
                                                   9 9 9 6 26 2 0 9 9 6 17 6 0
                                                   18 38 6 6 6 30 30 46 3 0 18
                                                   38 6 6 44 2 0 9 9 30 35 2 0
                                                   9 6 6 21 3 0 47 9 48 30 49 1
                                                   0 9 6 13 5 0 9 9 38 9 48 30
                                                   51 3 0 9 9 6 30 37 2 0 30 9
                                                   6 31 1 0 6 30 32 1 0 6 6 8 1
                                                   0 6 6 7 3 0 9 9 9 6 16 0 0 9
                                                   14 1 0 40 38 42 0 0 38 39 3
                                                   0 9 9 9 6 23 1 0 6 9 12 3 0
                                                   9 9 6 6 20 2 0 38 38 6 43 3
                                                   0 9 9 9 6 25)))))
           '|lookupComplete|)) 
