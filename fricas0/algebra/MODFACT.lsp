
(SDEFUN |MODFACT;mvmul|
        ((|m| |U32Matrix|) (|v| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((|ss| (|Integer|)) (#1=#:G712 NIL) (|j| NIL) (#2=#:G711 NIL)
          (|i| NIL) (|res| (|U32Vector|)) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)))
         (SEQ (LETT |nr| (ANROWS_U32 |m|) . #3=(|MODFACT;mvmul|))
              (LETT |nc| (ANCOLS_U32 |m|) . #3#)
              (EXIT
               (COND
                ((SPADCALL |nc| (QV_LEN_U32 |v|) (QREFELT $ 8))
                 (|error| "mvmul: nc ~= #v"))
                ('T
                 (SEQ (LETT |res| (GETREFV_U32 |nr| 0) . #3#)
                      (SEQ (LETT |i| 0 . #3#) (LETT #2# (- |nr| 1) . #3#) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ (LETT |ss| 0 . #3#)
                                (SEQ (LETT |j| 0 . #3#)
                                     (LETT #1# (- |nc| 1) . #3#) G190
                                     (COND ((|greater_SI| |j| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT |ss|
                                             (QSMULADD64-32
                                              (AREF2_U32 |m| |i| |j|)
                                              (ELT_U32 |v| |j|) |ss|)
                                             . #3#)))
                                     (LETT |j| (|inc_SI| |j|) . #3#) (GO G190)
                                     G191 (EXIT NIL))
                                (EXIT
                                 (SETELT_U32 |res| |i| (QSMOD64-32 |ss| |p|))))
                           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MODFACT;mmul;2UmIUm;2|
        ((|m1| |U32Matrix|) (|m2| |U32Matrix|) (|p| |Integer|) ($ |U32Matrix|))
        (SPROG
         ((|ss| (|Integer|)) (#1=#:G722 NIL) (|k| NIL) (#2=#:G721 NIL)
          (|j| NIL) (#3=#:G720 NIL) (|i| NIL) (|res| (|U32Matrix|))
          (|nr2| #4=(|NonNegativeInteger|)) (|nc1| (|NonNegativeInteger|))
          (|nr1| #4#))
         (SEQ (LETT |nr1| (ANROWS_U32 |m1|) . #5=(|MODFACT;mmul;2UmIUm;2|))
              (LETT |nc1| (ANCOLS_U32 |m1|) . #5#)
              (EXIT
               (COND
                ((SPADCALL |nc1| (ANCOLS_U32 |m2|) (QREFELT $ 8))
                 (|error| "mmul: dimensions do not match"))
                ('T
                 (SEQ (LETT |nr2| (ANROWS_U32 |m2|) . #5#)
                      (LETT |res| (MAKE_MATRIX1_U32 |nr1| |nr2| 0) . #5#)
                      (SEQ (LETT |i| 0 . #5#) (LETT #3# (- |nr1| 1) . #5#) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |j| 0 . #5#)
                                  (LETT #2# (- |nr2| 1) . #5#) G190
                                  (COND ((|greater_SI| |j| #2#) (GO G191)))
                                  (SEQ (LETT |ss| 0 . #5#)
                                       (SEQ (LETT |k| 0 . #5#)
                                            (LETT #1# (- |nc1| 1) . #5#) G190
                                            (COND
                                             ((|greater_SI| |k| #1#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |ss|
                                                    (QSMULADD64-32
                                                     (AREF2_U32 |m1| |i| |k|)
                                                     (AREF2_U32 |m2| |j| |k|)
                                                     |ss|)
                                                    . #5#)))
                                            (LETT |k| (|inc_SI| |k|) . #5#)
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (SETAREF2_U32 |res| |i| |j|
                                                      (QSMOD64-32 |ss| |p|))))
                                  (LETT |j| (|inc_SI| |j|) . #5#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MODFACT;copy_slice2|
        ((|np| |U32Vector|) (|op| |U32Vector|) (|n| |Integer|) (|m| |Integer|)
         ($ |Void|))
        (SPROG ((#1=#:G725 NIL) (|i| NIL))
               (SEQ (LETT |i| 0 . #2=(|MODFACT;copy_slice2|))
                    (LETT #1# (- |m| 1) . #2#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT (SETELT_U32 |np| |i| (ELT_U32 |op| (+ |n| |i|)))))
                    (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |MODFACT;red_pol;UvLV;4|
        ((|pol| |U32Vector|)
         (|rdata| |List|
          (|Record| (|:| |ind| (|NonNegativeInteger|))
                    (|:| |poly| (|U32Vector|))))
         ($ |Void|))
        (SPROG
         ((#1=#:G740 NIL) (|i| NIL) (|tmp| (|U32Vector|))
          (|mi| (|NonNegativeInteger|)) (|ni| #2=(|Integer|))
          (|ii| #3=(|NonNegativeInteger|)) (#4=#:G739 NIL) (|ri| NIL)
          (|n0| #2#) (|f| (|U32Vector|)) (|p| #3#)
          (|r0|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (SEQ (LETT |r0| (|SPADfirst| |rdata|) . #5=(|MODFACT;red_pol;UvLV;4|))
              (LETT |p| (QCAR |r0|) . #5#) (LETT |f| (QCDR |r0|) . #5#)
              (LETT |n0| (SPADCALL |f| (QREFELT $ 14)) . #5#)
              (LETT |rdata| (CDR |rdata|) . #5#)
              (SEQ (LETT |ri| NIL . #5#) (LETT #4# |rdata| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |ri| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ii| (QCAR |ri|) . #5#)
                        (LETT |ni| (SPADCALL |pol| (QREFELT $ 14)) . #5#)
                        (EXIT
                         (COND
                          ((>= |ni| |ii|)
                           (SEQ (LETT |mi| (+ (- |ni| |ii|) 1) . #5#)
                                (LETT |tmp| (GETREFV_U32 |mi| 0) . #5#)
                                (|MODFACT;copy_slice2| |tmp| |pol| |ii| |mi| $)
                                (SPADCALL |tmp| (QCDR |ri|) |pol|
                                          (- (+ |n0| |mi|) 2) |p|
                                          (QREFELT $ 16))
                                (EXIT
                                 (SEQ (LETT |i| |ii| . #5#)
                                      (LETT #1# |ni| . #5#) G190
                                      (COND ((> |i| #1#) (GO G191)))
                                      (SEQ (EXIT (SETELT_U32 |pol| |i| 0)))
                                      (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                                      (EXIT NIL))))))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |pol| |f| |p| (QREFELT $ 17)))))) 

(SDEFUN |MODFACT;mod_exp;UvILUv;5|
        ((|pol| |U32Vector|) (|n| |Integer|)
         (|rdata| |List|
          (|Record| (|:| |ind| (|NonNegativeInteger|))
                    (|:| |poly| (|U32Vector|))))
         ($ |U32Vector|))
        (SPROG
         ((|pow1| #1=(|U32Vector|)) (#2=#:G750 NIL) (|has_res| (|Boolean|))
          (|res1| #1#) (|res| #3=(|U32Vector|)) (|pow| #3#)
          (|m| (|NonNegativeInteger|)) (|f| (|U32Vector|))
          (|p| (|NonNegativeInteger|))
          (|r0|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (SEQ
          (COND
           ((SPADCALL |n| 0 (QREFELT $ 21))
            (|error| "mod_exp: n must be positive"))
           ('T
            (SEQ
             (LETT |r0| (|SPADfirst| |rdata|)
                   . #4=(|MODFACT;mod_exp;UvILUv;5|))
             (LETT |p| (QCAR |r0|) . #4#) (LETT |f| (QCDR |r0|) . #4#)
             (LETT |m| (SPADCALL |f| (QREFELT $ 14)) . #4#)
             (LETT |pow| (GETREFV_U32 |m| 0) . #4#)
             (SPADCALL |pow| |pol| (MIN |m| (QV_LEN_U32 |pol|)) (QREFELT $ 22))
             (LETT |res| (GETREFV_U32 |m| 0) . #4#) (LETT |has_res| NIL . #4#)
             (SEQ
              (EXIT
               (SEQ G190
                    (COND ((NULL (SPADCALL |n| 0 (QREFELT $ 23))) (GO G191)))
                    (SEQ
                     (COND
                      ((ODDP |n|)
                       (COND
                        (|has_res|
                         (SEQ
                          (LETT |res1|
                                (SPADCALL |pow| |res| |p| (QREFELT $ 24))
                                . #4#)
                          (SPADCALL |res1| |rdata| (QREFELT $ 20))
                          (EXIT
                           (SPADCALL |res| |res1| (MIN |m| (QV_LEN_U32 |res1|))
                                     (QREFELT $ 22)))))
                        ('T
                         (SEQ (SPADCALL |res| |pow| |m| (QREFELT $ 22))
                              (EXIT (LETT |has_res| 'T . #4#)))))))
                     (LETT |n| (QUOTIENT2 |n| 2) . #4#)
                     (EXIT
                      (COND
                       ((EQL |n| 0)
                        (PROGN (LETT #2# |$NoValue| . #4#) (GO #5=#:G747)))
                       ('T
                        (SEQ
                         (LETT |pow1| (SPADCALL |pow| |pow| |p| (QREFELT $ 24))
                               . #4#)
                         (SPADCALL |pow1| |rdata| (QREFELT $ 20))
                         (EXIT
                          (SPADCALL |pow| |pow1| (MIN |m| (QV_LEN_U32 |pow1|))
                                    (QREFELT $ 22))))))))
                    NIL (GO G190) G191 (EXIT NIL)))
              #5# (EXIT #2#))
             (EXIT |res|))))))) 

(SDEFUN |MODFACT;power_matrix;UvNniLR;6|
        ((|xp| |U32Vector|) (|l| |NonNegativeInteger|)
         (|rdata| |List|
          (|Record| (|:| |ind| (|NonNegativeInteger|))
                    (|:| |poly| (|U32Vector|))))
         ($ |Record| (|:| |matr| (|U32Matrix|)) (|:| |poly| (|U32Vector|))))
        (SPROG
         ((#1=#:G762 NIL) (|k| NIL) (|nn1| (|Integer|)) (|pow1| (|U32Vector|))
          (#2=#:G761 NIL) (#3=#:G760 NIL) (|j| NIL) (|n1| (|SingleInteger|))
          (|l1| (|Integer|)) (|pow| (|U32Vector|)) (|pm| (|U32Matrix|))
          (|n| (|NonNegativeInteger|)) (|f| (|U32Vector|))
          (|p| (|NonNegativeInteger|))
          (|r0|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (SEQ
          (LETT |r0| (|SPADfirst| |rdata|)
                . #4=(|MODFACT;power_matrix;UvNniLR;6|))
          (LETT |p| (QCAR |r0|) . #4#) (LETT |f| (QCDR |r0|) . #4#)
          (LETT |n| (SPADCALL |f| (QREFELT $ 14)) . #4#)
          (LETT |pm| (MAKE_MATRIX1_U32 |n| |l| 0) . #4#)
          (SETAREF2_U32 |pm| 0 0 1) (LETT |pow| (GETREFV_U32 |n| 0) . #4#)
          (SPADCALL |pow| |xp| (MIN |n| (QV_LEN_U32 |xp|)) (QREFELT $ 22))
          (LETT |l1| (- |l| 1) . #4#) (LETT |n1| (- |n| 1) . #4#)
          (SEQ (LETT |j| 1 . #4#) (LETT #3# |l1| . #4#) G190
               (COND ((|greater_SI| |j| #3#) (GO G191)))
               (SEQ
                (SEQ (LETT |k| 0 . #4#) (LETT #2# (- |n| 1) . #4#) G190
                     (COND ((|greater_SI| |k| #2#) (GO G191)))
                     (SEQ
                      (EXIT (SETAREF2_U32 |pm| |k| |j| (ELT_U32 |pow| |k|))))
                     (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
                (LETT |pow1| (SPADCALL |xp| |pow| |p| (QREFELT $ 24)) . #4#)
                (SPADCALL |pow1| |rdata| (QREFELT $ 20))
                (LETT |nn1| (MIN |n| (+ (SPADCALL |pow1| (QREFELT $ 14)) 1))
                      . #4#)
                (SPADCALL |pow| |pow1| |nn1| (QREFELT $ 22))
                (EXIT
                 (SEQ (LETT |k| |nn1| . #4#) (LETT #1# (- |n| 1) . #4#) G190
                      (COND ((> |k| #1#) (GO G191)))
                      (SEQ (EXIT (SETELT_U32 |pow| |k| 0)))
                      (LETT |k| (+ |k| 1) . #4#) (GO G190) G191 (EXIT NIL))))
               (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |pm| |pow|))))) 

(SDEFUN |MODFACT;modular_compose;UvUmUv2NniLUv;7|
        ((|pol| |U32Vector|) (|pm| |U32Matrix|) (|xp1| |U32Vector|)
         (|l1| |NonNegativeInteger|) (|l2| |NonNegativeInteger|)
         (|rdata| |List|
          (|Record| (|:| |ind| (|NonNegativeInteger|))
                    (|:| |poly| (|U32Vector|))))
         ($ |U32Vector|))
        (SPROG
         ((|res1| (|U32Vector|)) (#1=#:G775 NIL) (|i| (|SingleInteger|))
          (|k| NIL) (|ns1| (|SingleInteger|)) (|res| #2=(|U32Vector|))
          (|p1| #2#) (|m2| (|U32Matrix|)) (#3=#:G774 NIL) (#4=#:G773 NIL)
          (|j| NIL) (|k1| #5=(|SingleInteger|)) (|l1s| #5#)
          (|m1| (|U32Matrix|)) (|ns| #5#) (|n| (|NonNegativeInteger|))
          (|f| (|U32Vector|)) (|p| (|NonNegativeInteger|))
          (|r0|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (SEQ
          (LETT |r0| (|SPADfirst| |rdata|)
                . #6=(|MODFACT;modular_compose;UvUmUv2NniLUv;7|))
          (LETT |p| (QCAR |r0|) . #6#) (LETT |f| (QCDR |r0|) . #6#)
          (LETT |n| (SPADCALL |f| (QREFELT $ 14)) . #6#) (LETT |ns| |n| . #6#)
          (LETT |m1| (MAKE_MATRIX1_U32 |l2| |l1| 0) . #6#) (LETT |i| 0 . #6#)
          (LETT |l1s| (- |l1| 1) . #6#) (LETT |k1| (- |l2| 1) . #6#)
          (SEQ (LETT |j| 0 . #6#) (LETT #4# |k1| . #6#) G190
               (COND ((|greater_SI| |j| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |k| 0 . #6#) (LETT #3# |l1s| . #6#) G190
                      (COND
                       ((OR (|greater_SI| |k| #3#) (NULL (|less_SI| |i| |ns|)))
                        (GO G191)))
                      (SEQ (SETAREF2_U32 |m1| |j| |k| (ELT_U32 |pol| |i|))
                           (EXIT (LETT |i| (|add_SI| |i| 1) . #6#)))
                      (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |m2| (SPADCALL |m1| |pm| |p| (QREFELT $ 11)) . #6#)
          (LETT |p1| (GETREFV_U32 |n| 0) . #6#)
          (LETT |res| (GETREFV_U32 |n| 0) . #6#)
          (LETT |ns1| (|sub_SI| |ns| 1) . #6#)
          (SEQ (LETT |k| |k1| . #6#) G190 (COND ((< |k| 0) (GO G191)))
               (SEQ
                (SEQ (LETT |i| 0 . #6#) (LETT #1# |ns1| . #6#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT (SETELT_U32 |p1| |i| (AREF2_U32 |m2| |k| |i|))))
                     (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |k| |k1|)
                  (SEQ
                   (LETT |res1| (SPADCALL |xp1| |res| |p| (QREFELT $ 24))
                         . #6#)
                   (SPADCALL |res1| |rdata| (QREFELT $ 20))
                   (EXIT
                    (SPADCALL |res| |res1| (MIN |n| (QV_LEN_U32 |res1|))
                              (QREFELT $ 22))))))
                (EXIT (SPADCALL |res| |p1| 0 |ns1| 1 |p| (QREFELT $ 28))))
               (LETT |k| (+ |k| -1) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |MODFACT;ini_rdata;UvIL;8|
        ((|pol| |U32Vector|) (|p| |Integer|)
         ($ |List|
          #1=(|Record| (|:| |ind| (|NonNegativeInteger|))
                       (|:| |poly| (|U32Vector|)))))
        (SPROG
         ((|res| (|List| #1#)) (|tmp1| #2=(|U32Vector|)) (#3=#:G784 NIL)
          (|i| NIL) (|ni| #4=(|Integer|)) (|ii| #4#) (|nn| (|Integer|))
          (|tmp| #2#) (|n1| #4#) (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL |pol| (QREFELT $ 14))
                . #5=(|MODFACT;ini_rdata;UvIL;8|))
          (LETT |res| (LIST (CONS |p| |pol|)) . #5#)
          (LETT |ni| (LETT |n1| (- |n| 1) . #5#) . #5#)
          (LETT |tmp| (GETREFV_U32 (SPADCALL 2 |n1| (QREFELT $ 31)) 0) . #5#)
          (SEQ G190 (COND ((NULL (SPADCALL |ni| 10 (QREFELT $ 23))) (GO G191)))
               (SEQ (LETT |nn| (QUOTIENT2 (- |ni| 1) 2) . #5#)
                    (LETT |ii| (- (+ |n1| |ni|) |nn|) . #5#)
                    (LETT |ni| (- (- |ii| |n1|) 1) . #5#)
                    (SEQ (LETT |i| 0 . #5#) (LETT #3# |n1| . #5#) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ (EXIT (SETELT_U32 |tmp| |i| 0)))
                         (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                         (EXIT NIL))
                    (SETELT_U32 |tmp| |ii| 1)
                    (SPADCALL |tmp| |pol| |p| (QREFELT $ 17))
                    (LETT |tmp1| (GETREFV_U32 |n| 0) . #5#)
                    (SPADCALL |tmp1| |tmp| |n| (QREFELT $ 22))
                    (EXIT (LETT |res| (CONS (CONS |ii| |tmp1|) |res|) . #5#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |res|))))) 

(SDEFUN |MODFACT;floor_sqrt| ((|n| |Integer|) ($ |Integer|))
        (SPROG ((|res| (|Integer|)))
               (SEQ
                (LETT |res| (SPADCALL |n| (QREFELT $ 35)) |MODFACT;floor_sqrt|)
                (EXIT
                 (COND ((SPADCALL |n| (* |res| |res|) (QREFELT $ 21)) |res|)
                       ('T (+ |res| 1))))))) 

(SDEFUN |MODFACT;eqfact|
        ((|pol| |U32Vector|) (|l| |Integer|) (|pmat1| |U32Matrix|)
         (|xp1| |U32Vector|) (|pmat2| |U32Matrix|) (|xp2| |U32Vector|)
         (|l1| |NonNegativeInteger|) (|l2| |NonNegativeInteger|)
         (|k1| |Integer|) (|k2| |Integer|)
         (|rdata| |List|
          (|Record| (|:| |ind| #1=(|NonNegativeInteger|))
                    (|:| |poly| #2=(|U32Vector|))))
         (|res| |List| (|U32Vector|)) ($ |List| (|U32Vector|)))
        (SPROG
         ((|dg| #3=(|NonNegativeInteger|)) (|dp| (|NonNegativeInteger|))
          (|#G64| (|NonNegativeInteger|)) (|#G63| #3#) (|g| #4=(|U32Vector|))
          (|#G62| #4#) (|#G61| #5=(|U32Vector|)) (|tmp| #5#) (|tr1| #5#)
          (|tr| #5#) (#6=#:G804 NIL) (|i| NIL) (#7=#:G803 NIL) (#8=#:G802 NIL)
          (|kk| (|Integer|)) (#9=#:G801 NIL) (|n0| (|Integer|)) (|rpol| #5#)
          (|n| (|NonNegativeInteger|)) (|f| #2#) (|p| #1#)
          (|r0|
           (|Record| (|:| |ind| (|NonNegativeInteger|))
                     (|:| |poly| (|U32Vector|)))))
         (SEQ
          (COND ((EQL |l| 1) (CONS |pol| |res|))
                ('T
                 (SEQ
                  (LETT |r0| (|SPADfirst| |rdata|) . #10=(|MODFACT;eqfact|))
                  (LETT |p| (QCAR |r0|) . #10#) (LETT |f| (QCDR |r0|) . #10#)
                  (LETT |n| (SPADCALL |f| (QREFELT $ 14)) . #10#)
                  (LETT |rpol| (GETREFV_U32 |n| 0) . #10#)
                  (LETT |dp| (SPADCALL |pol| (QREFELT $ 14)) . #10#)
                  (LETT |tmp| (GETREFV_U32 (+ |dp| 1) 0) . #10#)
                  (SPADCALL |tmp| |pol| (+ |dp| 1) (QREFELT $ 22))
                  (LETT |pol| |tmp| . #10#)
                  (LETT |n0| (QUOTIENT2 |dp| |l|) . #10#)
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL |l| 1 (QREFELT $ 23))) (GO G191)))
                       (SEQ
                        (SEQ (LETT |i| 0 . #10#) (LETT #9# (- |n| 1) . #10#)
                             G190 (COND ((|greater_SI| |i| #9#) (GO G191)))
                             (SEQ (EXIT (SETELT_U32 |rpol| |i| (RANDOM |p|))))
                             (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |tr| |rpol| . #10#)
                        (LETT |kk| (MIN (- |n0| 1) |k1|) . #10#)
                        (SEQ (LETT |i| 1 . #10#) (LETT #8# |kk| . #10#) G190
                             (COND ((|greater_SI| |i| #8#) (GO G191)))
                             (SEQ (LETT |tr1| |tr| . #10#)
                                  (LETT |tr|
                                        (SPADCALL |tr| |pmat1| |xp1| |l1| |l2|
                                                  |rdata| (QREFELT $ 29))
                                        . #10#)
                                  (EXIT
                                   (SPADCALL |tr| |rpol| 0 (- |n| 1) 1 |p|
                                             (QREFELT $ 28))))
                             (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                             (EXIT NIL))
                        (SEQ (LETT |i| 2 . #10#)
                             (LETT #7# (QUOTIENT2 (- |n0| 1) |k1|) . #10#) G190
                             (COND ((|greater_SI| |i| #7#) (GO G191)))
                             (SEQ
                              (LETT |tr|
                                    (SPADCALL |tr| |pmat2| |xp2| |l1| |l2|
                                              |rdata| (QREFELT $ 29))
                                    . #10#)
                              (EXIT
                               (SPADCALL |tr| |tr1| 0 (- |n| 1) 1 |p|
                                         (QREFELT $ 28))))
                             (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((SPADCALL |n0| |k1| (QREFELT $ 23))
                          (SEQ (LETT |i| 1 . #10#)
                               (LETT #6# (REM (- |n0| 1) |k1|) . #10#) G190
                               (COND ((|greater_SI| |i| #6#) (GO G191)))
                               (SEQ
                                (LETT |tr|
                                      (SPADCALL |tr| |pmat1| |xp1| |l1| |l2|
                                                |rdata| (QREFELT $ 29))
                                      . #10#)
                                (EXIT
                                 (SPADCALL |tr| |rpol| 0 (- |n| 1) 1 |p|
                                           (QREFELT $ 28))))
                               (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |tr1|
                              (COND ((EQL |p| 2) |tr|)
                                    ('T
                                     (SPADCALL |tr| (QUOTIENT2 (- |p| 1) 2)
                                               |rdata| (QREFELT $ 25))))
                              . #10#)
                        (LETT |tmp| (GETREFV_U32 |n| 0) . #10#)
                        (SPADCALL |tr1| |pol| |tmp| |p| (QREFELT $ 36))
                        (LETT |tmp| (GETREFV_U32 |dp| 0) . #10#)
                        (SPADCALL |tmp| |tr1| |dp| (QREFELT $ 22))
                        (COND
                         ((EQL (ELT_U32 |tmp| 0) 0)
                          (SETELT_U32 |tmp| 0 (- |p| 1)))
                         ('T (SETELT_U32 |tmp| 0 (- (ELT_U32 |tmp| 0) 1))))
                        (LETT |g| (SPADCALL |tmp| |pol| |p| (QREFELT $ 37))
                              . #10#)
                        (LETT |dg| (SPADCALL |g| (QREFELT $ 14)) . #10#)
                        (COND
                         ((OR (EQL |dg| 0) (EQL |dg| |dp|)) (EXIT "iterate")))
                        (SPADCALL |tmp| 0 (QREFELT $ 38))
                        (SPADCALL |pol| |g| |tmp| |p| (QREFELT $ 36))
                        (LETT |dp| (- |dp| |dg|) . #10#)
                        (LETT |pol| (GETREFV_U32 (+ |dp| 1) 0) . #10#)
                        (SPADCALL |pol| |tmp| (+ |dp| 1) (QREFELT $ 22))
                        (COND
                         ((< |dp| |dg|)
                          (SEQ
                           (PROGN
                            (LETT |#G61| |pol| . #10#)
                            (LETT |#G62| |g| . #10#)
                            (LETT |g| |#G61| . #10#)
                            (LETT |pol| |#G62| . #10#))
                           (EXIT
                            (PROGN
                             (LETT |#G63| |dg| . #10#)
                             (LETT |#G64| |dp| . #10#)
                             (LETT |dp| |#G63| . #10#)
                             (LETT |dg| |#G64| . #10#))))))
                        (LETT |res|
                              (|MODFACT;eqfact| |g| (QUOTIENT2 |dg| |n0|)
                               |pmat1| |xp1| |pmat2| |xp2| |l1| |l2| |k1| |k2|
                               |rdata| |res| $)
                              . #10#)
                        (EXIT (LETT |l| (QUOTIENT2 |dp| |n0|) . #10#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS |pol| |res|)))))))) 

(SDEFUN |MODFACT;do_ddfact|
        ((|pol| |U32Vector|) (|p| |Integer|) (|do_eqfact?| |Boolean|)
         ($ |List|
          (|Record| (|:| |poly| (|U32Vector|))
                    (|:| |degree| (|NonNegativeInteger|))
                    (|:| |separate_factors|
                         (|Mapping| (|List| (|U32Vector|)))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |poly| (|U32Vector|))
                      (|:| |degree| (|NonNegativeInteger|))
                      (|:| |separate_factors|
                           (|Mapping| (|List| (|U32Vector|)))))))
          (#1=#:G822 NIL) (|dg| (|Integer|)) (|pk| (|U32Vector|))
          (#2=#:G829 NIL) (#3=#:G827 NIL) (#4=#:G828 NIL)
          (|n| #5=(|NonNegativeInteger|)) (|tmp| #6=(|U32Vector|))
          (#7=#:G833 NIL) (|g1| NIL) (|res1| (|List| (|U32Vector|)))
          (|g| (|U32Vector|)) (|i| (|NonNegativeInteger|)) (#8=#:G832 NIL)
          (|pj| #9=(|U32Vector|)) (#10=#:G831 NIL) (|i1| NIL)
          (|xp2| #11=(|U32Vector|)) (|pmat2| #12=(|U32Matrix|)) (|#G72| #11#)
          (|#G71| #12#)
          (|#G70| #13=(|Record| (|:| |matr| #12#) (|:| |poly| #11#)))
          (|pk1| #6#) (|lpj| (|List| #6#)) (#14=#:G830 NIL)
          (|k2| (|NonNegativeInteger|)) (|k1| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|xp1| #11#) (|pmat1| #12#)
          (|#G68| #13#) (|l1| (|NonNegativeInteger|))
          (|l2| (|NonNegativeInteger|)) (|n0| #5#) (|xp| #9#)
          (|rdata|
           (|List|
            (|Record| (|:| |ind| (|NonNegativeInteger|))
                      (|:| |poly| (|U32Vector|))))))
         (SEQ
          (LETT |rdata| (SPADCALL |pol| |p| (QREFELT $ 32))
                . #15=(|MODFACT;do_ddfact|))
          (LETT |xp| (SPADCALL (QREFELT $ 33) |p| |rdata| (QREFELT $ 25))
                . #15#)
          (LETT |n| (SPADCALL |pol| (QREFELT $ 14)) . #15#)
          (LETT |n0| |n| . #15#)
          (LETT |l2|
                (COND ((< |n| 120) 1) ((< |n| 360) 3)
                      (#16='T (SPADCALL |n| 4 (QREFELT $ 39))))
                . #15#)
          (LETT |l1| (QUOTIENT2 (- (+ |n| |l2|) 1) |l2|) . #15#)
          (PROGN
           (LETT |#G68| (SPADCALL |xp| |l1| |rdata| (QREFELT $ 27)) . #15#)
           (LETT |pmat1| (QCAR |#G68|) . #15#)
           (LETT |xp1| (QCDR |#G68|) . #15#)
           |#G68|)
          (LETT |tmp| (GETREFV_U32 |n| 0) . #15#) (SETELT_U32 |tmp| 1 1)
          (LETT |lpj| (LIST |tmp|) . #15#) (LETT |n2| (QUOTIENT2 |n| 2) . #15#)
          (LETT |k1|
                (COND ((EQL |l2| 1) |l2|) (#16# (|MODFACT;floor_sqrt| |n2| $)))
                . #15#)
          (LETT |k2| (QUOTIENT2 (- (+ |n2| |k1|) 1) |k1|) . #15#)
          (LETT |pj| |xp| . #15#)
          (SEQ (LETT |i| 1 . #15#) (LETT #14# (- |k1| 1) . #15#) G190
               (COND ((|greater_SI| |i| #14#) (GO G191)))
               (SEQ (LETT |lpj| (CONS |pj| |lpj|) . #15#)
                    (EXIT
                     (LETT |pj|
                           (SPADCALL |pj| |pmat1| |xp1| |l1| |l2| |rdata|
                                     (QREFELT $ 29))
                           . #15#)))
               (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191 (EXIT NIL))
          (LETT |pk| |pj| . #15#) (LETT |tmp| (GETREFV_U32 (+ |n| 1) 0) . #15#)
          (SPADCALL |tmp| |pol| (+ |n| 1) (QREFELT $ 22))
          (LETT |pol| |tmp| . #15#) (LETT |res| NIL . #15#)
          (LETT |pk1| (GETREFV_U32 |n0| 0) . #15#)
          (COND
           ((SPADCALL |k1| 1 (QREFELT $ 40))
            (PROGN
             (LETT |#G70| (SPADCALL |pj| |l1| |rdata| (QREFELT $ 27)) . #15#)
             (LETT |pmat2| (QCAR |#G70|) . #15#)
             (LETT |xp2| (QCDR |#G70|) . #15#)
             |#G70|))
           (#16#
            (PROGN
             (LETT |#G71| |pmat1| . #15#)
             (LETT |#G72| |xp1| . #15#)
             (LETT |pmat2| |#G71| . #15#)
             (LETT |xp2| |#G72| . #15#))))
          (LETT |i| 0 . #15#)
          (SEQ
           (EXIT
            (SEQ (LETT |i1| 1 . #15#) (LETT #10# |k2| . #15#) G190
                 (COND ((|greater_SI| |i1| #10#) (GO G191)))
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |pj| NIL . #15#) (LETT #8# |lpj| . #15#) G190
                         (COND
                          ((OR (ATOM #8#)
                               (PROGN (LETT |pj| (CAR #8#) . #15#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |i| (+ |i| 1) . #15#)
                                (SPADCALL |pk1| |pk| |n0| (QREFELT $ 22))
                                (SPADCALL |pk1| |pj| 0 (- |n0| 1) (- |p| 1) |p|
                                          (QREFELT $ 28))
                                (LETT |g|
                                      (SPADCALL |pk1| |pol| |p| (QREFELT $ 37))
                                      . #15#)
                                (SEQ
                                 (LETT |dg| (SPADCALL |g| (QREFELT $ 14))
                                       . #15#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |dg| 0 (QREFELT $ 23))
                                    (SEQ
                                     (COND
                                      ((EQL |dg| |i|)
                                       (LETT |res|
                                             (CONS
                                              (VECTOR |g| |i|
                                                      (CONS
                                                       #'|MODFACT;do_ddfact!0|
                                                       |g|))
                                              |res|)
                                             . #15#))
                                      (|do_eqfact?|
                                       (SEQ
                                        (LETT |res1|
                                              (|MODFACT;eqfact| |g|
                                               (QUOTIENT2 |dg| |i|) |pmat1|
                                               |xp1| |pmat2| |xp2| |l1| |l2|
                                               |k1| |k2| |rdata| NIL $)
                                              . #15#)
                                        (EXIT
                                         (SEQ (LETT |g1| NIL . #15#)
                                              (LETT #7# |res1| . #15#) G190
                                              (COND
                                               ((OR (ATOM #7#)
                                                    (PROGN
                                                     (LETT |g1| (CAR #7#)
                                                           . #15#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |res|
                                                      (CONS
                                                       (VECTOR |g1| |i|
                                                               (CONS
                                                                #'|MODFACT;do_ddfact!1|
                                                                |g1|))
                                                       |res|)
                                                      . #15#)))
                                              (LETT #7# (CDR #7#) . #15#)
                                              (GO G190) G191 (EXIT NIL)))))
                                      ('T
                                       (LETT |res|
                                             (CONS
                                              (VECTOR |g| |i|
                                                      (CONS
                                                       #'|MODFACT;do_ddfact!2|
                                                       (VECTOR |rdata| |k2|
                                                               |k1| |l2| |l1|
                                                               |xp2| |pmat2|
                                                               |xp1| |pmat1| $
                                                               |i| |dg| |g|)))
                                              |res|)
                                             . #15#)))
                                     (LETT |tmp|
                                           (GETREFV_U32
                                            (+
                                             (- |n|
                                                (SPADCALL |g| (QREFELT $ 14)))
                                             1)
                                            0)
                                           . #15#)
                                     (SPADCALL |pol| |g| |tmp| |p|
                                               (QREFELT $ 36))
                                     (LETT |pol| |tmp| . #15#)
                                     (EXIT
                                      (LETT |n| (SPADCALL |pol| (QREFELT $ 14))
                                            . #15#)))))))
                                (EXIT
                                 (COND
                                  ((>= |i| (QUOTIENT2 |n| 2))
                                   (PROGN
                                    (LETT #3#
                                          (PROGN
                                           (LETT #4# |$NoValue| . #15#)
                                           (GO #17=#:G818))
                                          . #15#)
                                    (GO #18=#:G817)))))))
                          #18# (EXIT #3#))
                         (LETT #8# (CDR #8#) . #15#) (GO G190) G191
                         (EXIT NIL)))
                   #17# (EXIT #4#))
                  (EXIT
                   (COND
                    ((>= |i| (QUOTIENT2 |n| 2))
                     (PROGN (LETT #2# |$NoValue| . #15#) (GO #19=#:G820)))
                    ('T
                     (LETT |pk|
                           (SPADCALL |pk| |pmat2| |xp2| |l1| |l2| |rdata|
                                     (QREFELT $ 29))
                           . #15#)))))
                 (LETT |i1| (|inc_SI| |i1|) . #15#) (GO G190) G191 (EXIT NIL)))
           #19# (EXIT #2#))
          (SEQ (LETT |dg| (SPADCALL |pol| (QREFELT $ 14)) . #15#)
               (EXIT
                (COND
                 ((SPADCALL |dg| 0 (QREFELT $ 23))
                  (LETT |res|
                        (CONS
                         (VECTOR |pol|
                                 (PROG1 (LETT #1# |dg| . #15#)
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 (CONS #'|MODFACT;do_ddfact!3| |pol|))
                         |res|)
                        . #15#)))))
          (EXIT |res|)))) 

(SDEFUN |MODFACT;do_ddfact!3| ((|pol| NIL)) (LIST |pol|)) 

(SDEFUN |MODFACT;do_ddfact!2| (($$ NIL))
        (PROG (|g| |dg| |i| $ |pmat1| |xp1| |pmat2| |xp2| |l1| |l2| |k1| |k2|
               |rdata|)
          (LETT |g| (QREFELT $$ 12) . #1=(|MODFACT;do_ddfact|))
          (LETT |dg| (QREFELT $$ 11) . #1#)
          (LETT |i| (QREFELT $$ 10) . #1#)
          (LETT $ (QREFELT $$ 9) . #1#)
          (LETT |pmat1| (QREFELT $$ 8) . #1#)
          (LETT |xp1| (QREFELT $$ 7) . #1#)
          (LETT |pmat2| (QREFELT $$ 6) . #1#)
          (LETT |xp2| (QREFELT $$ 5) . #1#)
          (LETT |l1| (QREFELT $$ 4) . #1#)
          (LETT |l2| (QREFELT $$ 3) . #1#)
          (LETT |k1| (QREFELT $$ 2) . #1#)
          (LETT |k2| (QREFELT $$ 1) . #1#)
          (LETT |rdata| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|MODFACT;eqfact| |g| (SPADCALL |dg| |i| (QREFELT $ 41)) |pmat1|
             |xp1| |pmat2| |xp2| |l1| |l2| |k1| |k2| |rdata| NIL $))))) 

(SDEFUN |MODFACT;do_ddfact!1| ((|g1| NIL)) (LIST |g1|)) 

(SDEFUN |MODFACT;do_ddfact!0| ((|g| NIL)) (LIST |g|)) 

(SDEFUN |MODFACT;ddfact;UvIL;12|
        ((|pol| |U32Vector|) (|prime| |Integer|)
         ($ |List|
          (|Record| (|:| |poly| (|U32Vector|))
                    (|:| |degree| (|NonNegativeInteger|))
                    (|:| |separate_factors|
                         (|Mapping| (|List| (|U32Vector|)))))))
        (|MODFACT;do_ddfact| |pol| |prime| NIL $)) 

(SDEFUN |MODFACT;mfactor;UvIL;13|
        ((|pol| |U32Vector|) (|prime| |Integer|) ($ |List| (|U32Vector|)))
        (SPROG
         ((#1=#:G842 NIL) (|el| NIL) (#2=#:G841 NIL)
          (|rl1|
           (|List|
            (|Record| (|:| |poly| (|U32Vector|))
                      (|:| |degree| (|NonNegativeInteger|))
                      (|:| |separate_factors|
                           (|Mapping| (|List| (|U32Vector|))))))))
         (SEQ
          (LETT |rl1| (|MODFACT;do_ddfact| |pol| |prime| 'T $)
                . #3=(|MODFACT;mfactor;UvIL;13|))
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |el| NIL . #3#) (LETT #1# |rl1| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #2# (CONS (QVELT |el| 0) #2#) . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |ModularFactorization;|)) 

(DEFUN |ModularFactorization| ()
  (SPROG NIL
         (PROG (#1=#:G844)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ModularFactorization|)
                    . #2=(|ModularFactorization|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularFactorization|
                             (LIST
                              (CONS NIL (CONS 1 (|ModularFactorization;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ModularFactorization|)))))))))) 

(DEFUN |ModularFactorization;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularFactorization|) . #1=(|ModularFactorization|))
          (LETT $ (GETREFV 48) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ModularFactorization| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 33 (GETREFV_U32 2 0))
          (SETELT_U32 (QREFELT $ 33) 1 1)
          $))) 

(MAKEPROP '|ModularFactorization| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|NonNegativeInteger|)
              (0 . ~=) (|U32Matrix|) (|Integer|) |MODFACT;mmul;2UmIUm;2|
              (|U32Vector|) (|U32VectorPolynomialOperations|) (6 . |degree|)
              (|Void|) (11 . |truncated_mul_add|) (20 . |remainder!|)
              (|Record| (|:| |ind| 7) (|:| |poly| 12)) (|List| 18)
              |MODFACT;red_pol;UvLV;4| (27 . <=) (33 . |copy_first|) (40 . >)
              (46 . |mul|) |MODFACT;mod_exp;UvILUv;5|
              (|Record| (|:| |matr| 9) (|:| |poly| 12))
              |MODFACT;power_matrix;UvNniLR;6| (53 . |vector_add_mul|)
              |MODFACT;modular_compose;UvUmUv2NniLUv;7| (|PositiveInteger|)
              (63 . *) |MODFACT;ini_rdata;UvIL;8| '|x1| (|IntegerRoots| 10)
              (69 . |approxSqrt|) (74 . |divide!|) (82 . |gcd|) (89 . |fill!|)
              (95 . |approxNthRoot|) (101 . >) (107 . |quo|) (|Mapping| 46)
              (|Record| (|:| |poly| 12) (|:| |degree| 7)
                        (|:| |separate_factors| 42))
              (|List| 43) |MODFACT;ddfact;UvIL;12| (|List| 12)
              |MODFACT;mfactor;UvIL;13|)
           '#(|red_pol| 113 |power_matrix| 119 |modular_compose| 126 |mod_exp|
              136 |mmul| 143 |mfactor| 150 |ini_rdata| 156 |ddfact| 162)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 47
                                                 '(2 7 6 0 0 8 1 13 10 12 14 5
                                                   13 15 12 12 12 10 10 16 3 13
                                                   15 12 12 10 17 2 10 6 0 0 21
                                                   3 13 15 12 12 10 22 2 10 6 0
                                                   0 23 3 13 12 12 12 10 24 6
                                                   13 15 12 12 10 10 10 10 28 2
                                                   10 0 30 0 31 1 34 10 10 35 4
                                                   13 15 12 12 12 10 36 3 13 12
                                                   12 12 10 37 2 12 0 0 10 38 2
                                                   34 10 10 7 39 2 7 6 0 0 40 2
                                                   10 0 0 0 41 2 0 15 12 19 20
                                                   3 0 26 12 7 19 27 6 0 12 12
                                                   9 12 7 7 19 29 3 0 12 12 10
                                                   19 25 3 0 9 9 9 10 11 2 0 46
                                                   12 10 47 2 0 19 12 10 32 2 0
                                                   44 12 10 45)))))
           '|lookupComplete|)) 

(MAKEPROP '|ModularFactorization| 'NILADIC T) 
