
(SDEFUN |IMODHP;eval1s|
        ((|gvl| |List|
          (|PrimitiveArray|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|))))))
         (|pt| |Integer|) (|var| |Symbol|)
         (|pss| |Record| (|:| |prime| #1=(|Integer|))
          (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPROG
         ((|resl| (|List| (|U32Vector|))) (|nlc| (|Integer|))
          (|dms| (|SingleInteger|)) (#2=#:G429 NIL) (|dm| #3=(|Integer|))
          (|nm| #3#)
          (|nlcq|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|)))))
          (#4=#:G431 NIL) (|j| NIL) (|ress| (|U32Vector|))
          (|n| (|NonNegativeInteger|)) (#5=#:G430 NIL) (|gv0| NIL) (|p| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (QVELT |pss| 0)) (LETT |resl| NIL)
                (SEQ (LETT |gv0| NIL) (LETT #5# |gvl|) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |gv0| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| (QVSIZE |gv0|))
                          (LETT |ress| (GETREFV_U32 |n| 0))
                          (SEQ (LETT |j| 0) (LETT #4# (- |n| 1)) G190
                               (COND ((|greater_SI| |j| #4#) (GO G191)))
                               (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|))
                                    (LETT |nm|
                                          (SPADCALL (QCAR |nlcq|) |pt| |pss|
                                                    (QREFELT $ 10)))
                                    (LETT |dm|
                                          (SPADCALL (QCDR |nlcq|) |pt| |pss|
                                                    (QREFELT $ 10)))
                                    (EXIT
                                     (COND
                                      ((EQL |dm| 0)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed"))
                                        (GO #6=#:G428)))
                                      ('T
                                       (SEQ (LETT |dms| |dm|)
                                            (LETT |nlc|
                                                  (QSMULMOD32 |nm|
                                                              (SPADCALL |dms|
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 12))
                                                              |p|))
                                            (EXIT
                                             (SETELT_U32 |ress| |j|
                                                         |nlc|)))))))
                               (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |ress| |resl|))))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #6# (EXIT #2#)))) 

(SDEFUN |IMODHP;eval2s|
        ((|gvl| |List|
          (|PrimitiveArray|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|))))))
         (|pt| |Integer|) (|var| |Symbol|)
         (|pss| |Record| (|:| |prime| (|Integer|))
          (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ |Union|
          (|List|
           (|PrimitiveArray|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))))
          "failed"))
        (SPROG
         ((|resl|
           (|List|
            (|PrimitiveArray|
             (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                       (|:| |denom| (|Polynomial| (|Integer|)))))))
          (#1=#:G450 NIL)
          (|res1|
           (|Union|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))
            "failed"))
          (|nlcq|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|)))))
          (#2=#:G452 NIL) (|j| NIL)
          (|ress|
           (|PrimitiveArray|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))))
          (|n| (|NonNegativeInteger|)) (#3=#:G451 NIL) (|gv0| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL)
                (SEQ (LETT |gv0| NIL) (LETT #3# |gvl|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |gv0| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| (QVSIZE |gv0|))
                          (LETT |ress|
                                (MAKEARR1 |n|
                                          (CONS (|spadConstant| $ 13)
                                                (|spadConstant| $ 14))))
                          (SEQ (LETT |j| 0) (LETT #2# (- |n| 1)) G190
                               (COND ((|greater_SI| |j| #2#) (GO G191)))
                               (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|))
                                    (LETT |res1|
                                          (SPADCALL |nlcq| |var| |pt| |pss|
                                                    (QREFELT $ 18)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |res1| 1)
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed"))
                                        (GO #4=#:G449)))
                                      ('T
                                       (QSETAREF1 |ress| |j| (QCDR |res1|))))))
                               (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |ress| |resl|))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #4# (EXIT #1#)))) 

(SDEFUN |IMODHP;eval3s|
        ((|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|p| |Integer|)
         ($ |Union|
          (|List|
           (|PrimitiveArray|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))))
          "failed"))
        (SPROG
         ((|resl|
           (|List|
            (|PrimitiveArray|
             (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                       (|:| |denom| (|Polynomial| (|Integer|)))))))
          (#1=#:G465 NIL)
          (|res1|
           (|Union|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))
            "failed"))
          (|nlcq| (|Fraction| (|Polynomial| (|Integer|)))) (#2=#:G467 NIL)
          (|j| NIL)
          (|ress|
           (|PrimitiveArray|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))))
          (|n| (|NonNegativeInteger|)) (#3=#:G466 NIL) (|gv0| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL)
                (SEQ (LETT |gv0| NIL) (LETT #3# |gvl|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |gv0| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| (QVSIZE |gv0|))
                          (LETT |ress|
                                (MAKEARR1 |n|
                                          (CONS (|spadConstant| $ 13)
                                                (|spadConstant| $ 14))))
                          (SEQ (LETT |j| 0) (LETT #2# (- |n| 1)) G190
                               (COND ((|greater_SI| |j| #2#) (GO G191)))
                               (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|))
                                    (LETT |res1|
                                          (SPADCALL |nlcq| |p| (QREFELT $ 20)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |res1| 1)
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed"))
                                        (GO #4=#:G464)))
                                      ('T
                                       (QSETAREF1 |ress| |j| (QCDR |res1|))))))
                               (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |ress| |resl|))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #4# (EXIT #1#)))) 

(SDEFUN |IMODHP;do_modular_solve0|
        ((|gv| |Vector| (|U32Vector|)) (|ve| |Vector| (|Integer|))
         (|sigma| |NonNegativeInteger|) (|pts| |U32Vector|) (|prime| |Integer|)
         (|kind| |Symbol|) ($ |List| (|Any|)))
        (COND
         ((OR (EQUAL |kind| '|diffHP|) (EQUAL |kind| '|qdiffHP|))
          (SPADCALL |gv| |ve| |sigma| |prime| (QREFELT $ 26)))
         ((OR (EQUAL |kind| '|shiftHP|)
              (OR (EQUAL |kind| '|qshiftHP|) (EQUAL |kind| '|qmixed|)))
          (SPADCALL |gv| |ve| |pts| |prime| (QREFELT $ 28)))
         ('T
          (|error|
           "kind must be diffHP, qdiffHP, shiftHP, qshiftHP or qmixed")))) 

(SDEFUN |IMODHP;do_modular_solve;VVNniUvISU;5|
        ((|gv| |Vector| (|U32Vector|)) (|ve| |Vector| (|Integer|))
         (|sigma| |NonNegativeInteger|) (|pts| |U32Vector|) (|prime| |Integer|)
         (|kind| |Symbol|)
         ($ |Union|
          (|Record| (|:| |basis| #1=(|TwoDimensionalArray| (|U32Vector|)))
                    (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|))))
          "no_solution"))
        (SPROG
         ((#2=#:G505 NIL) (|j| (|Integer|)) (#3=#:G504 NIL) (#4=#:G512 NIL)
          (|i| NIL) (|cindk| (|Integer|)) (#5=#:G511 NIL) (|k| NIL)
          (#6=#:G510 NIL) (#7=#:G509 NIL)
          (|nbas| (|TwoDimensionalArray| (|U32Vector|)))
          (|nr| (|NonNegativeInteger|)) (|bas| #1#)
          (|res|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|bm| (|Vector| (|U32Vector|))) (|dbm| #8=(|Any|)) (|ok| (|Boolean|))
          (#9=#:G508 NIL) (|m2| #10=(|NonNegativeInteger|))
          (|va| (|Vector| (|Integer|))) (|dva| #8#) (|blr| (|List| (|Any|)))
          (|nve| (|Vector| (|Integer|))) (|ngv| (|Vector| (|U32Vector|)))
          (#11=#:G507 NIL) (|m1| (|NonNegativeInteger|)) (#12=#:G506 NIL)
          (|m0| #10#))
         (SEQ
          (EXIT
           (SEQ (LETT |m0| (QVSIZE |ve|)) (LETT |m1| 0)
                (SEQ (LETT |i| 1) (LETT #12# |m0|) G190
                     (COND ((|greater_SI| |i| #12#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((>= (SPADCALL |ve| |i| (QREFELT $ 29)) 0)
                         (LETT |m1| (+ |m1| 1))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |m1| |m0|)
                  (SEQ (LETT |ngv| (MAKEARR1 |m1| (GETREFV_U32 0 0)))
                       (LETT |nve| (MAKEARR1 |m1| 0)) (LETT |j| 1)
                       (EXIT
                        (SEQ (LETT |i| 1) (LETT #11# |m0|) G190
                             (COND ((|greater_SI| |i| #11#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((>= (SPADCALL |ve| |i| (QREFELT $ 29)) 0)
                                 (SEQ
                                  (SPADCALL |ngv| |j|
                                            (SPADCALL |gv| |i| (QREFELT $ 30))
                                            (QREFELT $ 31))
                                  (SPADCALL |nve| |j|
                                            (SPADCALL |ve| |i| (QREFELT $ 29))
                                            (QREFELT $ 32))
                                  (EXIT (LETT |j| (+ |j| 1))))))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL)))))
                 (#13='T (SEQ (LETT |ngv| |gv|) (EXIT (LETT |nve| |ve|)))))
                (LETT |blr|
                      (|IMODHP;do_modular_solve0| |ngv| |nve| |sigma| |pts|
                       |prime| |kind| $))
                (LETT |dva| (SPADCALL |blr| 3 (QREFELT $ 34)))
                (LETT |va| (SPADCALL |dva| (QREFELT $ 36))) (LETT |ok| NIL)
                (LETT |m2| (QVSIZE |va|))
                (SEQ (LETT |i| 1) (LETT #9# |m2|) G190
                     (COND ((|greater_SI| |i| #9#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |ok|
                             (COND (|ok| 'T)
                                   ('T
                                    (>= (SPADCALL |va| |i| (QREFELT $ 29))
                                        0))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  (|ok|
                   (SEQ (LETT |dbm| (SPADCALL |blr| 1 (QREFELT $ 34)))
                        (LETT |bm| (SPADCALL |dbm| (QREFELT $ 38)))
                        (LETT |res|
                              (SPADCALL |bm| |nve| |va| |prime|
                                        (QREFELT $ 40)))
                        (COND
                         ((< |m1| |m0|)
                          (SEQ (LETT |bas| (QVELT |res| 0))
                               (LETT |nr| (ANROWS |bas|))
                               (LETT |nbas|
                                     (MAKE_MATRIX1 |nr| |m0|
                                                   (GETREFV_U32 0 0)))
                               (LETT |j| 1)
                               (SEQ (LETT |i| 1) (LETT #7# |m0|) G190
                                    (COND ((|greater_SI| |i| #7#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((>= (SPADCALL |ve| |i| (QREFELT $ 29))
                                            0)
                                        (SEQ
                                         (SEQ (LETT |k| 1) (LETT #6# |nr|) G190
                                              (COND
                                               ((|greater_SI| |k| #6#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (QSETAREF2O |nbas| |k| |i|
                                                            (QAREF2O |bas| |k|
                                                                     |j| 1 1)
                                                            1 1)))
                                              (LETT |k| (|inc_SI| |k|))
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT (LETT |j| (+ |j| 1))))))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT NIL))
                               (QSETVELT |res| 0 |nbas|)
                               (EXIT
                                (SEQ (LETT |k| 1) (LETT #5# |nr|) G190
                                     (COND ((|greater_SI| |k| #5#) (GO G191)))
                                     (SEQ
                                      (LETT |cindk|
                                            (SPADCALL (QVELT |res| 2) |k|
                                                      (QREFELT $ 29)))
                                      (LETT |j| 1)
                                      (EXIT
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |i| 1) (LETT #4# |m0|) G190
                                              (COND
                                               ((|greater_SI| |i| #4#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((>=
                                                   (SPADCALL |ve| |i|
                                                             (QREFELT $ 29))
                                                   0)
                                                  (SEQ
                                                   (COND
                                                    ((EQL |j| |cindk|)
                                                     (SEQ
                                                      (SPADCALL (QVELT |res| 2)
                                                                |k| |i|
                                                                (QREFELT $ 32))
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #3# |$NoValue|)
                                                        (GO #14=#:G494))))))
                                                   (EXIT
                                                    (LETT |j| (+ |j| 1))))))))
                                              (LETT |i| (|inc_SI| |i|))
                                              (GO G190) G191 (EXIT NIL)))
                                        #14# (EXIT #3#))))
                                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                     (EXIT NIL))))))
                        (EXIT (CONS 0 |res|))))
                  (#13#
                   (PROGN
                    (LETT #2# (CONS 1 "no_solution"))
                    (GO #15=#:G503)))))))
          #15# (EXIT #2#)))) 

(SDEFUN |IMODHP;compute_blocks|
        ((|offsets| |Vector| (|Integer|)) (|rowlen| |Integer|)
         (|nsols| |Integer|) ($ |Vector| (|Integer|)))
        (SPROG
         ((#1=#:G516 NIL) (|i| NIL) (|block_offsets| (|Vector| (|Integer|))))
         (SEQ (LETT |block_offsets| (MAKEARR1 |nsols| 0))
              (SEQ (LETT |i| 1) (LETT #1# |nsols|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |block_offsets| |i|
                               (SPADCALL |offsets| (+ (* (- |i| 1) |rowlen|) 1)
                                         (QREFELT $ 29))
                               (QREFELT $ 32))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |block_offsets|)))) 

(SDEFUN |IMODHP;merge_exponents;IVSevVSevL;7|
        ((|nvars| |Integer|) (|offsets| |Vector| (|Integer|))
         (|exps| |SortedExponentVector|) (|noffsets| |Vector| (|Integer|))
         (|nexps| |SortedExponentVector|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|j0| (|Integer|)) (|i0| (|Integer|)) (|j| (|Integer|))
          (|i| (|Integer|)) (|ci| (|Integer|)) (#1=#:G542 NIL)
          (|j0i| (|Integer|)) (|ji| #2=(|Integer|)) (|jl| (|List| (|Integer|)))
          (|i0i| (|Integer|)) (|ii| #2#) (|il| (|List| (|Integer|)))
          (#3=#:G546 NIL) (|k| NIL) (|lj| (|Integer|)) (|li| (|Integer|))
          (#4=#:G543 NIL) (#5=#:G545 NIL) (|jj| NIL) (#6=#:G544 NIL)
          (|kk| (|Integer|)) (|nn| (|Integer|)) (|oc| (|NonNegativeInteger|))
          (|m| #7=(|Integer|)) (|n| #7#))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QUOTIENT2 (QV_LEN_U32 |exps|) |nvars|))
                (LETT |m| (QUOTIENT2 (QV_LEN_U32 |nexps|) |nvars|))
                (LETT |oc| (QVSIZE |offsets|)) (LETT |i0| 0) (LETT |j0| 0)
                (LETT |ci| 0) (LETT |i| 0) (LETT |j| 0) (LETT |li| 0)
                (LETT |lj| 0) (LETT |il| NIL) (LETT |jl| NIL) (LETT |kk| 1)
                (LETT |nn| (- |nvars| 1))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |i0i| 1) (LETT |j0i| 1) (LETT |ii| |nvars|)
                           (LETT |ji| |nvars|)
                           (COND
                            ((OR (EQL |i0| |li|) (EQL |j0| |lj|))
                             (EXIT
                              (SEQ (LETT |kk| (+ |kk| 1))
                                   (COND
                                    ((< |i0| |li|)
                                     (SEQ (LETT |jj| |i0|)
                                          (LETT #6# (- |li| 1)) G190
                                          (COND ((> |jj| #6#) (GO G191)))
                                          (SEQ (LETT |jl| (CONS |ci| |jl|))
                                               (EXIT (LETT |ci| (+ |ci| 1))))
                                          (LETT |jj| (+ |jj| 1)) (GO G190) G191
                                          (EXIT NIL))))
                                   (COND
                                    ((< |j0| |lj|)
                                     (SEQ (LETT |jj| |j0|)
                                          (LETT #5# (- |lj| 1)) G190
                                          (COND ((> |jj| #5#) (GO G191)))
                                          (SEQ (LETT |il| (CONS |ci| |il|))
                                               (EXIT (LETT |ci| (+ |ci| 1))))
                                          (LETT |jj| (+ |jj| 1)) (GO G190) G191
                                          (EXIT NIL))))
                                   (EXIT
                                    (COND
                                     ((EQL |li| |n|)
                                      (PROGN
                                       (LETT #4#
                                             (LIST (NREVERSE |il|)
                                                   (NREVERSE |jl|)))
                                       (GO #8=#:G541)))
                                     ('T
                                      (SEQ (LETT |i0| |li|) (LETT |j0| |lj|)
                                           (LETT |i| (* |i0| |nvars|))
                                           (LETT |j| (* |j0| |nvars|))
                                           (EXIT
                                            (COND
                                             ((<= |kk| |oc|)
                                              (SEQ
                                               (LETT |li|
                                                     (SPADCALL |offsets| |kk|
                                                               (QREFELT $ 29)))
                                               (EXIT
                                                (LETT |lj|
                                                      (SPADCALL |noffsets| |kk|
                                                                (QREFELT $
                                                                         29))))))
                                             ('T
                                              (SEQ (LETT |li| |n|)
                                                   (EXIT
                                                    (LETT |lj|
                                                          |m|))))))))))))))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |k| 0) (LETT #3# |nn|) G190
                                  (COND ((|greater_SI| |k| #3#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL (ELT_U32 |exps| (+ |i| |k|))
                                                (ELT_U32 |nexps| (+ |j| |k|))
                                                (QREFELT $ 44))
                                      (PROGN
                                       (LETT #1#
                                             (COND
                                              ((> (ELT_U32 |exps| (+ |i| |k|))
                                                  (ELT_U32 |nexps|
                                                           (+ |j| |k|)))
                                               (SEQ
                                                (LETT |il| (CONS |ci| |il|))
                                                (LETT |ii| 0) (LETT |i0i| 0)
                                                (EXIT
                                                 (PROGN
                                                  (LETT #1# |$NoValue|)
                                                  (GO #9=#:G537)))))
                                              ('T
                                               (SEQ
                                                (LETT |jl| (CONS |ci| |jl|))
                                                (LETT |ji| 0) (LETT |j0i| 0)
                                                (EXIT
                                                 (PROGN
                                                  (LETT #1# |$NoValue|)
                                                  (GO #9#)))))))
                                       (GO #9#))))))
                                  (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                  (EXIT NIL)))
                            #9# (EXIT #1#))
                           (LETT |ci| (+ |ci| 1)) (LETT |i| (+ |i| |ii|))
                           (LETT |j| (+ |j| |ji|)) (LETT |i0| (+ |i0| |i0i|))
                           (EXIT (LETT |j0| (+ |j0| |j0i|))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #8# (EXIT #4#)))) 

(SDEFUN |IMODHP;merge2;I2LVSevVSevR;8|
        ((|nvars| |Integer|) (|odl| |List| (|Integer|))
         (|ndl| |List| (|Integer|)) (|ov1| |Vector| (|Integer|))
         (|exps1| |SortedExponentVector|) (|ov2| |Vector| (|Integer|))
         (|exps2| |SortedExponentVector|)
         ($ |Record| (|:| |offsetdata| (|Vector| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))))
        (SPROG
         ((#1=#:G573 NIL) (|i| (|Integer|)) (|ci| (|Integer|))
          (|i00| (|Integer|)) (|i0| (|Integer|)) (|j0| (|Integer|))
          (|j| (|Integer|)) (#2=#:G572 NIL) (|k| NIL) (|j00| (|Integer|))
          (#3=#:G571 NIL) (|lj| #4=(|Integer|)) (|li| #4#) (|kk| (|Integer|))
          (#5=#:G570 NIL) (|ci0| (|Integer|)) (|nv1| (|Integer|))
          (|noffsets| (|Vector| (|Integer|))) (|m| (|NonNegativeInteger|))
          (|nexps| (|SortedExponentVector|)) (#6=#:G549 NIL)
          (|nn1| (|Integer|)) (|n1| (|Integer|)) (|nn| (|NonNegativeInteger|))
          (|n0| (|NonNegativeInteger|)))
         (SEQ (LETT |n0| (QV_LEN_U32 |exps1|)) (LETT |nn| (LENGTH |odl|))
              (LETT |n1| (+ (QUOTIENT2 |n0| |nvars|) |nn|))
              (LETT |nn1| (* |n1| |nvars|))
              (LETT |nexps|
                    (GETREFV_U32
                     (PROG1 (LETT #6# |nn1|)
                       (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #6#))
                     0))
              (LETT |m| (QVSIZE |ov2|)) (LETT |noffsets| (MAKEARR1 |m| 0))
              (LETT |nv1| (- |nvars| 1)) (LETT |i0| 0) (LETT |j0| 0)
              (LETT |ci0| 0) (LETT |i| 0) (LETT |j| 0) (LETT |ci| 0)
              (LETT |j00| (COND ((NULL |ndl|) |n1|) ('T (|SPADfirst| |ndl|))))
              (LETT |i00| (|SPADfirst| |odl|))
              (LETT |li| (SPADCALL |ov1| 1 (QREFELT $ 29)))
              (LETT |lj| (SPADCALL |ov2| 1 (QREFELT $ 29))) (LETT |kk| 1)
              (SEQ (LETT |ci0| 0) (LETT #5# (- |n1| 1)) G190
                   (COND ((|greater_SI| |ci0| #5#) (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((EQL |i0| |li|) (EQL |j0| |lj|)) ('T NIL)))
                           (GO G191)))
                         (SEQ (SPADCALL |noffsets| |kk| |ci0| (QREFELT $ 32))
                              (LETT |kk| (+ |kk| 1))
                              (EXIT
                               (COND
                                ((<= |kk| |m|)
                                 (SEQ
                                  (LETT |li|
                                        (SPADCALL |ov1| |kk| (QREFELT $ 29)))
                                  (EXIT
                                   (LETT |lj|
                                         (SPADCALL |ov2| |kk|
                                                   (QREFELT $ 29))))))
                                ('T
                                 (SEQ (LETT |li| |n1|)
                                      (EXIT (LETT |lj| |n1|)))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND
                     ((EQL |ci0| |j00|)
                      (SEQ
                       (SEQ (LETT |k| 0) (LETT #3# |nv1|) G190
                            (COND ((|greater_SI| |k| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SETELT_U32 |nexps| (+ |ci| |k|)
                                          (ELT_U32 |exps1| (+ |i| |k|)))))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))
                       (LETT |ndl| (CDR |ndl|))
                       (EXIT
                        (LETT |j00|
                              (COND ((NULL |ndl|) |n1|)
                                    ('T (|SPADfirst| |ndl|)))))))
                     ('T
                      (SEQ
                       (SEQ (LETT |k| 0) (LETT #2# |nv1|) G190
                            (COND ((|greater_SI| |k| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SETELT_U32 |nexps| (+ |ci| |k|)
                                          (ELT_U32 |exps2| (+ |j| |k|)))))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))
                       (LETT |j| (+ |j| |nvars|))
                       (EXIT (LETT |j0| (+ |j0| 1))))))
                    (COND
                     ((SPADCALL |ci0| |i00| (QREFELT $ 44))
                      (SEQ (LETT |i| (+ |i| |nvars|))
                           (EXIT (LETT |i0| (+ |i0| 1)))))
                     ('T
                      (SEQ (LETT |odl| (CDR |odl|))
                           (EXIT
                            (LETT |i00|
                                  (COND ((NULL |odl|) |n1|)
                                        ('T (|SPADfirst| |odl|))))))))
                    (EXIT (LETT |ci| (+ |ci| |nvars|))))
                   (LETT |ci0| (|inc_SI| |ci0|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| |kk|) (LETT #1# |m|) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ (EXIT (SPADCALL |noffsets| |i| |n1| (QREFELT $ 32))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |noffsets| |nexps|))))) 

(SDEFUN |IMODHP;check_defects|
        ((|va| |Vector| (|Integer|)) (|civ| |Vector| (|Integer|))
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |pss_kind| (|Symbol|)) (|:| |oldva| #1=(|Vector| (|Integer|)))
          (|:| |oldciv| #2=(|Vector| (|Integer|))) (|:| |pss_m| (|Integer|))
          (|:| |sol_cnt| #3=(|Integer|))
          (|:| |pss1|
               (|Record| (|:| |prime| (|Integer|))
                         (|:| |eval1coeffbuf| (|U32Vector|))
                         (|:| |eval1expbuf| (|SortedExponentVector|)))))
         ($ |Union| "OK" "failed" "all_bad"))
        (SPROG
         ((#4=#:G593 NIL) (#5=#:G592 NIL) (|is_bad| (|Boolean|))
          (|all_bad| (|Boolean|)) (#6=#:G594 NIL) (|i| NIL) (|ociv| #2#)
          (|ova| #1#) (|nsols| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |nsols| (QVELT |pss| 9))
                (LETT |is_bad| (> (QVSIZE |va|) |nsols|))
                (LETT |all_bad| (< (QVSIZE |va|) |nsols|))
                (COND
                 ((EQL (QVSIZE |va|) |nsols|)
                  (SEQ (LETT |ova| (QVELT |pss| 6))
                       (LETT |ociv| (QVELT |pss| 7))
                       (EXIT
                        (SEQ
                         (EXIT
                          (SEQ (LETT |i| 1) (LETT #6# |nsols|) G190
                               (COND ((|greater_SI| |i| #6#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((< (SPADCALL |va| |i| (QREFELT $ 29))
                                      (SPADCALL |ova| |i| (QREFELT $ 29)))
                                   (SEQ (LETT |all_bad| 'T)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue|)
                                          (GO #7=#:G587)))))
                                  ((> (SPADCALL |va| |i| (QREFELT $ 29))
                                      (SPADCALL |ova| |i| (QREFELT $ 29)))
                                   (SEQ (LETT |is_bad| 'T)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue|)
                                          (GO #7#)))))
                                  ((< (SPADCALL |civ| |i| (QREFELT $ 29))
                                      (SPADCALL |ociv| |i| (QREFELT $ 29)))
                                   (SEQ (LETT |all_bad| 'T)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue|)
                                          (GO #7#)))))
                                  ((> (SPADCALL |civ| |i| (QREFELT $ 29))
                                      (SPADCALL |ociv| |i| (QREFELT $ 29)))
                                   (SEQ (LETT |is_bad| 'T)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue|)
                                          (GO #7#))))))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL)))
                         #7# (EXIT #5#))))))
                (EXIT
                 (COND
                  (|is_bad|
                   (PROGN (LETT #4# (CONS 1 "failed")) (GO #8=#:G591)))
                  (|all_bad| (PROGN (LETT #4# (CONS 2 "all_bad")) (GO #8#)))
                  ('T (PROGN (LETT #4# (CONS 0 "OK")) (GO #8#)))))))
          #8# (EXIT #4#)))) 

(SDEFUN |IMODHP;eval_and_solve|
        ((|pt| |Integer|) (|vars| |List| (|Symbol|))
         (|gvl| |List|
          (|PrimitiveArray|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|))))))
         (|pss| |Record| (|:| |degree_bounds| #1=(|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |pss_kind| (|Symbol|)) (|:| |oldva| (|Vector| (|Integer|)))
          (|:| |oldciv| (|Vector| (|Integer|))) (|:| |pss_m| (|Integer|))
          (|:| |sol_cnt| (|Integer|))
          (|:| |pss1|
               #2=(|Record| (|:| |prime| #3=(|Integer|))
                            (|:| |eval1coeffbuf| (|U32Vector|))
                            (|:| |eval1expbuf| (|SortedExponentVector|)))))
         (|gen| |Mapping| #4=(|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Union|
          (|Record| (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|)))
                    (|:| |rowlen| (|Integer|))
                    (|:| |offsetdata| (|Vector| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|U32Vector|)))
          "failed" "no_solution"))
        (SPROG
         ((#5=#:G633 NIL)
          (|ngvl|
           (|List|
            (|PrimitiveArray|
             (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                       (|:| |denom| (|Polynomial| (|Integer|)))))))
          (|ngv0p|
           (|Union|
            (|List|
             (|PrimitiveArray|
              (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                        (|:| |denom| (|Polynomial| (|Integer|))))))
            "failed"))
          (#6=#:G638 NIL) (|i| NIL) (|nev| #7=(|SortedExponentVector|))
          (#8=#:G620 NIL) (|ncv| #9=(|U32Vector|)) (#10=#:G618 NIL)
          (|k| (|Integer|)) (|cpl| (|Integer|)) (#11=#:G637 NIL) (|l| NIL)
          (|cp| (|U32Vector|)) (|mm| (|Integer|)) (|k1| (|Integer|))
          (#12=#:G636 NIL) (|j| NIL) (#13=#:G635 NIL)
          (|ov| (|Vector| (|Integer|))) (|ev| #7#) (#14=#:G610 NIL) (|cv| #9#)
          (#15=#:G608 NIL) (|r_cnt| (|Integer|)) (#16=#:G634 NIL)
          (|m| #17=(|NonNegativeInteger|)) (|nsols| #17#)
          (|civ| #18=(|Vector| (|Integer|))) (|va| #19=(|Vector| (|Integer|)))
          (|bm| #20=(|TwoDimensionalArray| (|U32Vector|)))
          (|rblr|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|blr|
           (|Union|
            (|Record| (|:| |basis| #20#) (|:| |defects| #19#)
                      (|:| |cinds| #18#))
            "no_solution"))
          (|ve| #1#) (|ngv2| #4#) (|ngv10| (|List| (|U32Vector|)))
          (|ngv10p| (|Union| (|List| (|U32Vector|)) "failed"))
          (|nvars| (|NonNegativeInteger|)) (|p| #3#) (|pss1| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |pss1| (QVELT |pss| 10)) (LETT |p| (QVELT |pss1| 0))
                (LETT |nvars| (LENGTH |vars|))
                (EXIT
                 (COND
                  ((EQL |nvars| 1)
                   (SEQ
                    (LETT |ngv10p|
                          (|IMODHP;eval1s| |gvl| |pt| (|SPADfirst| |vars|)
                           |pss1| $))
                    (EXIT
                     (COND
                      ((QEQCAR |ngv10p| 1)
                       (PROGN (LETT #5# (CONS 1 "failed")) (GO #21=#:G632)))
                      (#22='T
                       (SEQ (LETT |ngv10| (QCDR |ngv10p|))
                            (LETT |ngv2|
                                  (SPADCALL |ngv10| |p| (QVELT |pss| 4) |gen|))
                            (LETT |ve| (QVELT |pss| 0))
                            (LETT |blr|
                                  (SPADCALL |ngv2| |ve| (QVELT |pss| 1)
                                            (QVELT |pss| 2) |p| (QVELT |pss| 5)
                                            (QREFELT $ 42)))
                            (EXIT
                             (COND
                              ((QEQCAR |blr| 1)
                               (PROGN
                                (LETT #5# (CONS 2 "no_solution"))
                                (GO #21#)))
                              (#22#
                               (SEQ (LETT |rblr| (QCDR |blr|))
                                    (LETT |bm| (QVELT |rblr| 0))
                                    (LETT |va| (QVELT |rblr| 1))
                                    (LETT |civ| (QVELT |rblr| 2))
                                    (LETT |nsols| (QVSIZE |va|))
                                    (LETT |r_cnt| 0) (LETT |m| (QVSIZE |ve|))
                                    (SEQ (LETT |j| 1) (LETT #16# |m|) G190
                                         (COND
                                          ((|greater_SI| |j| #16#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |r_cnt|
                                                 (+
                                                  (+ |r_cnt|
                                                     (SPADCALL |ve| |j|
                                                               (QREFELT $ 29)))
                                                  1))))
                                         (LETT |j| (|inc_SI| |j|)) (GO G190)
                                         G191 (EXIT NIL))
                                    (LETT |r_cnt| (* |r_cnt| |nsols|))
                                    (LETT |cv|
                                          (GETREFV_U32
                                           (PROG1 (LETT #15# |r_cnt|)
                                             (|check_subtype2| (>= #15# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #15#))
                                           0))
                                    (LETT |ev|
                                          (GETREFV_U32
                                           (PROG1 (LETT #14# |r_cnt|)
                                             (|check_subtype2| (>= #14# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #14#))
                                           0))
                                    (LETT |ov| (MAKEARR1 (* |nsols| |m|) 0))
                                    (LETT |k| 0) (LETT |k1| 1)
                                    (SEQ (LETT |i| 1) (LETT #13# |nsols|) G190
                                         (COND
                                          ((|greater_SI| |i| #13#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ (LETT |j| 1) (LETT #12# |m|)
                                                G190
                                                (COND
                                                 ((|greater_SI| |j| #12#)
                                                  (GO G191)))
                                                (SEQ
                                                 (SPADCALL |ov| |k1| |k|
                                                           (QREFELT $ 32))
                                                 (LETT |k1| (+ |k1| 1))
                                                 (LETT |mm|
                                                       (SPADCALL |ve| |j|
                                                                 (QREFELT $
                                                                          29)))
                                                 (LETT |cp|
                                                       (SPADCALL |bm| |i| |j|
                                                                 (QREFELT $
                                                                          52)))
                                                 (EXIT
                                                  (SEQ (LETT |l| 0)
                                                       (LETT #11# |mm|) G190
                                                       (COND
                                                        ((|greater_SI| |l|
                                                                       #11#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |cpl|
                                                              (ELT_U32 |cp|
                                                                       |l|))
                                                        (EXIT
                                                         (COND
                                                          ((SPADCALL |cpl| 0
                                                                     (QREFELT $
                                                                              44))
                                                           (SEQ
                                                            (SETELT_U32 |cv|
                                                                        |k|
                                                                        |cpl|)
                                                            (SETELT_U32 |ev|
                                                                        |k|
                                                                        |l|)
                                                            (EXIT
                                                             (LETT |k|
                                                                   (+ |k|
                                                                      1))))))))
                                                       (LETT |l|
                                                             (|inc_SI| |l|))
                                                       (GO G190) G191
                                                       (EXIT NIL))))
                                                (LETT |j| (|inc_SI| |j|))
                                                (GO G190) G191 (EXIT NIL))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT NIL))
                                    (LETT |ncv|
                                          (GETREFV_U32
                                           (PROG1 (LETT #10# |k|)
                                             (|check_subtype2| (>= #10# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #10#))
                                           0))
                                    (LETT |nev|
                                          (GETREFV_U32
                                           (PROG1 (LETT #8# |k|)
                                             (|check_subtype2| (>= #8# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #8#))
                                           0))
                                    (SEQ (LETT |i| 0) (LETT #6# (- |k| 1)) G190
                                         (COND
                                          ((|greater_SI| |i| #6#) (GO G191)))
                                         (SEQ
                                          (SETELT_U32 |ncv| |i|
                                                      (ELT_U32 |cv| |i|))
                                          (EXIT
                                           (SETELT_U32 |nev| |i|
                                                       (ELT_U32 |ev| |i|))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT NIL))
                                    (EXIT
                                     (PROGN
                                      (LETT #5#
                                            (CONS 0
                                                  (VECTOR |va| |civ| |m| |ov|
                                                          |nev| |ncv|)))
                                      (GO #21#)))))))))))))
                  (#22#
                   (SEQ
                    (LETT |ngv0p|
                          (|IMODHP;eval2s| |gvl| |pt| (|SPADfirst| |vars|)
                           |pss1| $))
                    (EXIT
                     (COND
                      ((QEQCAR |ngv0p| 1)
                       (PROGN (LETT #5# (CONS 1 "failed")) (GO #21#)))
                      (#22#
                       (SEQ (LETT |ngvl| (QCDR |ngv0p|))
                            (EXIT
                             (PROGN
                              (LETT #5#
                                    (|IMODHP;do_poly_modular| (CDR |vars|)
                                     |ngvl| |pss| |gen| $))
                              (GO #21#)))))))))))))
          #21# (EXIT #5#)))) 

(SDEFUN |IMODHP;do_poly_modular|
        ((|vars| |List| (|Symbol|))
         (|gvl| |List|
          (|PrimitiveArray|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|))))))
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|))
          (|:| |points| #1=(|U32Vector|)) (|:| |pss_qvar| (|Symbol|))
          (|:| |pss_qval| (|Integer|)) (|:| |pss_kind| (|Symbol|))
          (|:| |oldva| (|Vector| (|Integer|)))
          (|:| |oldciv| (|Vector| (|Integer|))) (|:| |pss_m| #2=(|Integer|))
          (|:| |sol_cnt| (|Integer|))
          (|:| |pss1|
               (|Record| (|:| |prime| #3=(|Integer|))
                         (|:| |eval1coeffbuf| (|U32Vector|))
                         (|:| |eval1expbuf| (|SortedExponentVector|)))))
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Union|
          (|Record| (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|)))
                    (|:| |rowlen| (|Integer|))
                    (|:| |offsetdata| (|Vector| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|U32Vector|)))
          "failed" "no_solution"))
        (SPROG
         ((#4=#:G690 NIL)
          (|rr|
           (|Record| (|:| |nvars| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (|pp|
           (|Union|
            (|Record| (|:| |nvars| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed"))
          (#5=#:G694 NIL) (|j| NIL) (|hi| #6=(|Integer|)) (|lo| #6#)
          (|invc| (|Integer|)) (#7=#:G689 NIL) (|ok| #8=(|Boolean|))
          (|nofi| #6#) (|ofi| #6#) (|ofin| #9=(|Integer|)) (|cnum| #6#)
          (#10=#:G693 NIL) (|i| (|Integer|)) (|n1| (|NonNegativeInteger|))
          (|block_offsets| (|Vector| (|Integer|))) (|coeffs| (|U32Vector|))
          (|jl| (|Integer|)) (|ndl| #11=(|List| (|Integer|))) (#12=#:G692 NIL)
          (|ncoeffs| (|U32Vector|)) (|nn| (|NonNegativeInteger|))
          (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorModularReconstructor|))
          (|ncc| (|NonNegativeInteger|)) (|exps| (|SortedExponentVector|))
          (|offsets| (|Vector| (|Integer|)))
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #11#) (|dl| (|List| (|List| (|Integer|))))
          (|good_cnt| #13=(|Integer|)) (|all_bad| #8#) (|nsols| #9#)
          (|bad_cnt| #13#) (|chk_ress| (|Union| "OK" "failed" "all_bad"))
          (|noffsets| (|Vector| (|Integer|)))
          (|nexps| (|SortedExponentVector|)) (|civ| (|Vector| (|Integer|)))
          (|va| (|Vector| (|Integer|)))
          (|ppr|
           (|Record| (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))
                     (|:| |rowlen| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (|pprp|
           (|Union|
            (|Record| (|:| |defects| (|Vector| (|Integer|)))
                      (|:| |cinds| (|Vector| (|Integer|)))
                      (|:| |rowlen| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed" "no_solution"))
          (|qn| (|Integer|)) (#14=#:G691 NIL) (|k| NIL) (|pts| #1#)
          (|npt| (|Integer|)) (|lpt| (|List| (|Integer|))) (|pt| (|Integer|))
          (|nvars| (|NonNegativeInteger|)) (|m| #2#) (|p| #3#)
          (|update_qval| (|Boolean|)) (|update_points| #8#))
         (SEQ
          (EXIT
           (SEQ (LETT |lpt| NIL) (LETT |bad_cnt| 0) (LETT |good_cnt| 0)
                (LETT |exps| (GETREFV_U32 0 0)) (LETT |offsets| (MAKE-ARRAY 0))
                (LETT |all_bad| 'T)
                (LETT |update_points|
                      (COND
                       ((EQUAL (QVELT |pss| 5) '|qshiftHP|)
                        (EQUAL (QVELT |pss| 3) (|SPADfirst| |vars|)))
                       ('T NIL)))
                (LETT |update_qval|
                      (COND
                       ((OR (EQUAL (QVELT |pss| 5) '|qshiftHP|)
                            (OR (EQUAL (QVELT |pss| 5) '|qdiffHP|)
                                (EQUAL (QVELT |pss| 5) '|qmixed|)))
                        (EQUAL (QVELT |pss| 3) (|SPADfirst| |vars|)))
                       ('T NIL)))
                (LETT |p| (QVELT (QVELT |pss| 10) 0))
                (LETT |m| (QVELT |pss| 8)) (LETT |nvars| (LENGTH |vars|))
                (LETT |nsols| (+ |m| 1))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ok| NIL)
                           (SEQ (LETT |k| 1) G190
                                (COND
                                 ((OR (|greater_SI| |k| 100)
                                      (NULL (NULL |ok|)))
                                  (GO G191)))
                                (SEQ (LETT |pt| (RANDOM |p|))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |pt| |lpt| (QREFELT $ 53))
                                        "iterate")
                                       ('T
                                        (SEQ (LETT |lpt| (CONS |pt| |lpt|))
                                             (EXIT (LETT |ok| 'T)))))))
                                (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                (EXIT NIL))
                           (COND
                            ((EQL
                              (SPADCALL (LETT |npt| (LENGTH |lpt|)) 100
                                        (QREFELT $ 54))
                              0)
                             (SEQ
                              (SPADCALL
                               (SPADCALL "Number of evaluation points"
                                         (QREFELT $ 57))
                               (QREFELT $ 59))
                              (EXIT
                               (SPADCALL (SPADCALL |npt| (QREFELT $ 60))
                                         (QREFELT $ 59))))))
                           (EXIT
                            (COND
                             (|ok|
                              (SEQ
                               (COND
                                (|update_points|
                                 (SEQ (LETT |pts| (QVELT |pss| 2))
                                      (LETT |qn| 1)
                                      (EXIT
                                       (SEQ (LETT |k| 0)
                                            (LETT #14# (- (QVELT |pss| 1) 1))
                                            G190
                                            (COND
                                             ((|greater_SI| |k| #14#)
                                              (GO G191)))
                                            (SEQ (SETELT_U32 |pts| |k| |qn|)
                                                 (EXIT
                                                  (LETT |qn|
                                                        (SPADCALL (* |pt| |qn|)
                                                                  |p|
                                                                  (QREFELT $
                                                                           54)))))
                                            (LETT |k| (|inc_SI| |k|)) (GO G190)
                                            G191 (EXIT NIL))))))
                               (COND (|update_qval| (QSETVELT |pss| 4 |pt|)))
                               (LETT |pprp|
                                     (|IMODHP;eval_and_solve| |pt| |vars| |gvl|
                                      |pss| |gen| $))
                               (EXIT
                                (COND
                                 ((QEQCAR |pprp| 2)
                                  (PROGN
                                   (LETT #4# (CONS 2 "no_solution"))
                                   (GO #15=#:G688)))
                                 ((QEQCAR |pprp| 1)
                                  (SEQ (LETT |bad_cnt| (+ |bad_cnt| 1))
                                       (EXIT
                                        (COND
                                         ((> |bad_cnt| (+ |good_cnt| 2))
                                          (PROGN
                                           (LETT #4# (CONS 1 "failed"))
                                           (GO #15#)))
                                         ('T "iterate")))))
                                 ('T
                                  (SEQ (LETT |ppr| (QCDR |pprp|))
                                       (LETT |va| (QVELT |ppr| 0))
                                       (LETT |civ| (QVELT |ppr| 1))
                                       (LETT |nexps| (QVELT |ppr| 4))
                                       (LETT |noffsets| (QVELT |ppr| 3))
                                       (LETT |coeffs| (QVELT |ppr| 5))
                                       (LETT |chk_ress|
                                             (|IMODHP;check_defects| |va| |civ|
                                              |pss| $))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |chk_ress| 1)
                                          (SEQ (LETT |bad_cnt| (+ |bad_cnt| 1))
                                               (EXIT
                                                (COND
                                                 ((> |bad_cnt|
                                                     (+ |good_cnt| 2))
                                                  (PROGN
                                                   (LETT #4# (CONS 1 "failed"))
                                                   (GO #15#)))
                                                 ('T "iterate")))))
                                         ('T
                                          (SEQ
                                           (COND
                                            ((QEQCAR |chk_ress| 2)
                                             (LETT |all_bad| 'T)))
                                           (COND
                                            (|all_bad|
                                             (SEQ (LETT |nsols| (QVSIZE |va|))
                                                  (QSETVELT |pss| 9 |nsols|)
                                                  (QSETVELT |pss| 6 |va|)
                                                  (QSETVELT |pss| 7 |civ|)
                                                  (LETT |exps| |nexps|)
                                                  (LETT |offsets| |noffsets|)
                                                  (EXIT
                                                   (LETT |rstate|
                                                         (SPADCALL
                                                          (QV_LEN_U32 |coeffs|)
                                                          |p|
                                                          (QREFELT $ 62)))))))
                                           (LETT |all_bad| NIL)
                                           (LETT |good_cnt| (+ |good_cnt| 1))
                                           (LETT |dl|
                                                 (SPADCALL |nvars| |offsets|
                                                           |exps| |noffsets|
                                                           |nexps|
                                                           (QREFELT $ 47)))
                                           (LETT |odl|
                                                 (SPADCALL |dl| 1
                                                           (QREFELT $ 63)))
                                           (LETT |ndl|
                                                 (SPADCALL |dl| 2
                                                           (QREFELT $ 63)))
                                           (COND
                                            ((SPADCALL |odl| NIL
                                                       (QREFELT $ 64))
                                             (SEQ
                                              (LETT |oer|
                                                    (SPADCALL |nvars| |odl|
                                                              |ndl| |offsets|
                                                              |exps| |noffsets|
                                                              |nexps|
                                                              (QREFELT $ 50)))
                                              (LETT |offsets| (QCAR |oer|))
                                              (LETT |exps| (QCDR |oer|))
                                              (LETT |ncc|
                                                    (QUOTIENT2
                                                     (QV_LEN_U32 |exps|)
                                                     |nvars|))
                                              (EXIT
                                               (LETT |rstate|
                                                     (SPADCALL |ncc| |p|
                                                               (QREFELT $
                                                                        62)))))))
                                           (COND
                                            ((SPADCALL |ndl| NIL
                                                       (QREFELT $ 64))
                                             (SEQ
                                              (LETT |n0| (QV_LEN_U32 |coeffs|))
                                              (LETT |nn| (LENGTH |ndl|))
                                              (LETT |n1| (+ |n0| |nn|))
                                              (LETT |ncoeffs|
                                                    (GETREFV_U32 |n1| 0))
                                              (LETT |i| 0)
                                              (LETT |jl| (|SPADfirst| |ndl|))
                                              (SEQ (LETT |j| 0)
                                                   (LETT #12# (- |n1| 1)) G190
                                                   (COND
                                                    ((|greater_SI| |j| #12#)
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (COND
                                                      ((EQL |j| |jl|)
                                                       (SEQ
                                                        (SETELT_U32 |ncoeffs|
                                                                    |j| 0)
                                                        (LETT |ndl|
                                                              (CDR |ndl|))
                                                        (EXIT
                                                         (LETT |jl|
                                                               (COND
                                                                ((NULL |ndl|)
                                                                 |n1|)
                                                                ('T
                                                                 (|SPADfirst|
                                                                  |ndl|)))))))
                                                      ('T
                                                       (SEQ
                                                        (SETELT_U32 |ncoeffs|
                                                                    |j|
                                                                    (ELT_U32
                                                                     |coeffs|
                                                                     |i|))
                                                        (EXIT
                                                         (LETT |i|
                                                               (+ |i| 1))))))))
                                                   (LETT |j| (|inc_SI| |j|))
                                                   (GO G190) G191 (EXIT NIL))
                                              (EXIT
                                               (LETT |coeffs| |ncoeffs|)))))
                                           (LETT |block_offsets|
                                                 (|IMODHP;compute_blocks|
                                                  |offsets| |m| |nsols| $))
                                           (LETT |n1| (QV_LEN_U32 |coeffs|))
                                           (LETT |ok| 'T)
                                           (SEQ
                                            (EXIT
                                             (SEQ (LETT |i| 1)
                                                  (LETT #10# |nsols|) G190
                                                  (COND
                                                   ((|greater_SI| |i| #10#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |cnum|
                                                         (SPADCALL |civ| |i|
                                                                   (QREFELT $
                                                                            29)))
                                                   (LETT |ofin|
                                                         (+ (* |m| (- |i| 1))
                                                            |cnum|))
                                                   (LETT |ofi|
                                                         (SPADCALL |offsets|
                                                                   |ofin|
                                                                   (QREFELT $
                                                                            29)))
                                                   (LETT |nofi|
                                                         (COND
                                                          ((OR (< |i| |nsols|)
                                                               (< |cnum| |m|))
                                                           (SPADCALL |offsets|
                                                                     (+ |ofin|
                                                                        1)
                                                                     (QREFELT $
                                                                              29)))
                                                          ('T |n1|)))
                                                   (LETT |nofi| (- |nofi| 1))
                                                   (EXIT
                                                    (COND
                                                     ((< |nofi| |ofi|)
                                                      (SEQ
                                                       (SPADCALL
                                                        (SPADCALL |civ|
                                                                  (QREFELT $
                                                                           65))
                                                        (QREFELT $ 59))
                                                       (SPADCALL
                                                        (SPADCALL |offsets|
                                                                  (QREFELT $
                                                                           65))
                                                        (QREFELT $ 59))
                                                       (EXIT
                                                        (|error|
                                                         "Internal error: corrupted offsets 1"))))
                                                     ((EQL
                                                       (ELT_U32 |coeffs|
                                                                |nofi|)
                                                       0)
                                                      (SEQ (LETT |ok| NIL)
                                                           (EXIT
                                                            (PROGN
                                                             (LETT #7#
                                                                   |$NoValue|)
                                                             (GO
                                                              #16=#:G675)))))
                                                     ('T
                                                      (SEQ
                                                       (LETT |invc|
                                                             (SPADCALL
                                                              (ELT_U32 |coeffs|
                                                                       |nofi|)
                                                              |p|
                                                              (QREFELT $ 66)))
                                                       (LETT |lo|
                                                             (SPADCALL
                                                              |block_offsets|
                                                              |i|
                                                              (QREFELT $ 29)))
                                                       (LETT |hi|
                                                             (COND
                                                              ((< |i| |nsols|)
                                                               (SPADCALL
                                                                |block_offsets|
                                                                (+ |i| 1)
                                                                (QREFELT $
                                                                         29)))
                                                              ('T |n1|)))
                                                       (EXIT
                                                        (SEQ (LETT |j| |lo|)
                                                             (LETT #5#
                                                                   (- |hi| 1))
                                                             G190
                                                             (COND
                                                              ((> |j| #5#)
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (SETELT_U32
                                                                |coeffs| |j|
                                                                (QSMULMOD32
                                                                 (ELT_U32
                                                                  |coeffs| |j|)
                                                                 |invc| |p|))))
                                                             (LETT |j|
                                                                   (+ |j| 1))
                                                             (GO G190) G191
                                                             (EXIT NIL))))))))
                                                  (LETT |i| (|inc_SI| |i|))
                                                  (GO G190) G191 (EXIT NIL)))
                                            #16# (EXIT #7#))
                                           (EXIT
                                            (COND
                                             (|ok|
                                              (SEQ
                                               (SPADCALL |coeffs| |pt| |rstate|
                                                         (QREFELT $ 67))
                                               (LETT |pp|
                                                     (SPADCALL |rstate| |nvars|
                                                               |block_offsets|
                                                               |offsets| |exps|
                                                               (QREFELT $ 70)))
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |pp| 1) "iterate")
                                                 ('T
                                                  (SEQ (LETT |rr| (QCDR |pp|))
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #4#
                                                               (CONS 0
                                                                     (VECTOR
                                                                      |va|
                                                                      |civ| |m|
                                                                      (QVELT
                                                                       |rr| 1)
                                                                      (QVELT
                                                                       |rr| 2)
                                                                      (QVELT
                                                                       |rr|
                                                                       3))))
                                                         (GO #15#)))))))))
                                             ('T "iterate")))))))))))))
                             ('T (|error| "Run out of evaluation points")))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #15# (EXIT #4#)))) 

(SDEFUN |IMODHP;do_poly_integer0|
        ((|vars| |List| (|Symbol|))
         (|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |pss_kind| (|Symbol|)) (|:| |oldva| (|Vector| (|Integer|)))
          (|:| |oldciv| (|Vector| (|Integer|))) (|:| |pss_m| #1=(|Integer|))
          (|:| |sol_cnt| (|Integer|))
          (|:| |pss1|
               #2=(|Record| (|:| |prime| (|Integer|))
                            (|:| |eval1coeffbuf| (|U32Vector|))
                            (|:| |eval1expbuf| (|SortedExponentVector|)))))
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Union|
          (|Record| (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|)))
                    (|:| |rowlen| (|Integer|))
                    (|:| |offsetdata| (|Vector| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|PrimitiveArray| (|Integer|))))
          "no_solution"))
        (SPROG
         ((#3=#:G738 NIL)
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (#4=#:G741 NIL) (|j| NIL) (|hi| #5=(|Integer|)) (|lo| #5#)
          (|invc| (|Integer|)) (#6=#:G737 NIL) (|ok| #7=(|Boolean|))
          (|nofi| #5#) (|ofi| #5#) (|ofin| #8=(|Integer|)) (|cnum| #5#)
          (#9=#:G740 NIL) (|i| (|Integer|)) (|n1| (|NonNegativeInteger|))
          (|block_offsets| (|Vector| (|Integer|))) (|coeffs| (|U32Vector|))
          (|jl| (|Integer|)) (|ndl| #10=(|List| (|Integer|))) (#11=#:G739 NIL)
          (|ncoeffs| (|U32Vector|)) (|nn| (|NonNegativeInteger|))
          (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorIntegerReconstructor|))
          (|ncc| (|NonNegativeInteger|)) (|exps| (|SortedExponentVector|))
          (|offsets| (|Vector| (|Integer|)))
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #10#) (|dl| (|List| (|List| (|Integer|)))) (|all_bad| #7#)
          (|nsols| #8#) (|chk_ress| (|Union| "OK" "failed" "all_bad"))
          (|noffsets| (|Vector| (|Integer|)))
          (|nexps| (|SortedExponentVector|)) (|civ| (|Vector| (|Integer|)))
          (|va| (|Vector| (|Integer|)))
          (|ppr|
           (|Record| (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))
                     (|:| |rowlen| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (|pprp|
           (|Union|
            (|Record| (|:| |defects| (|Vector| (|Integer|)))
                      (|:| |cinds| (|Vector| (|Integer|)))
                      (|:| |rowlen| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed" "no_solution"))
          (|ngvl|
           (|List|
            (|PrimitiveArray|
             (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                       (|:| |denom| (|Polynomial| (|Integer|)))))))
          (|ngv0p|
           (|Union|
            (|List|
             (|PrimitiveArray|
              (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                        (|:| |denom| (|Polynomial| (|Integer|))))))
            "failed"))
          (|lp| (|List| (|Integer|))) (|p| (|Integer|)) (|k| NIL)
          (|nvars| (|NonNegativeInteger|)) (|m| #1#) (|pss1| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL) (LETT |exps| (GETREFV_U32 0 0))
                (LETT |offsets| (MAKE-ARRAY 0)) (LETT |all_bad| 'T)
                (LETT |pss1| (QVELT |pss| 10)) (LETT |p| 16)
                (LETT |m| (QVELT |pss| 8)) (LETT |nvars| (LENGTH |vars|))
                (LETT |nsols| (+ |m| 1))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ok| NIL)
                           (SEQ (LETT |k| 1) G190
                                (COND
                                 ((OR (|greater_SI| |k| 100)
                                      (NULL (NULL |ok|)))
                                  (GO G191)))
                                (SEQ
                                 (LETT |p|
                                       (SPADCALL (+ (RANDOM 200000) 200000)
                                                 (QREFELT $ 72)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |p| |lp| (QREFELT $ 53))
                                    "iterate")
                                   ('T
                                    (SEQ (LETT |lp| (CONS |p| |lp|))
                                         (EXIT (LETT |ok| 'T)))))))
                                (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (COND
                             (|ok|
                              (SEQ (QSETVELT |pss1| 0 |p|)
                                   (LETT |ngv0p| (|IMODHP;eval3s| |gvl| |p| $))
                                   (EXIT
                                    (COND ((QEQCAR |ngv0p| 1) "iterate")
                                          ('T
                                           (SEQ (LETT |ngvl| (QCDR |ngv0p|))
                                                (LETT |pprp|
                                                      (|IMODHP;do_poly_modular|
                                                       |vars| |ngvl| |pss|
                                                       |gen| $))
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |pprp| 2)
                                                   (PROGN
                                                    (LETT #3#
                                                          (CONS 1
                                                                "no_solution"))
                                                    (GO #12=#:G736)))
                                                  ((QEQCAR |pprp| 1) "iterate")
                                                  ('T
                                                   (SEQ
                                                    (LETT |ppr| (QCDR |pprp|))
                                                    (LETT |va| (QVELT |ppr| 0))
                                                    (LETT |civ|
                                                          (QVELT |ppr| 1))
                                                    (LETT |nexps|
                                                          (QVELT |ppr| 4))
                                                    (LETT |noffsets|
                                                          (QVELT |ppr| 3))
                                                    (LETT |coeffs|
                                                          (QVELT |ppr| 5))
                                                    (LETT |chk_ress|
                                                          (|IMODHP;check_defects|
                                                           |va| |civ| |pss| $))
                                                    (EXIT
                                                     (COND
                                                      ((QEQCAR |chk_ress| 1)
                                                       "iterate")
                                                      ('T
                                                       (SEQ
                                                        (COND
                                                         ((QEQCAR |chk_ress| 2)
                                                          (LETT |all_bad| 'T)))
                                                        (COND
                                                         (|all_bad|
                                                          (SEQ
                                                           (LETT |nsols|
                                                                 (QVSIZE |va|))
                                                           (QSETVELT |pss| 9
                                                                     |nsols|)
                                                           (QSETVELT |pss| 6
                                                                     |va|)
                                                           (QSETVELT |pss| 7
                                                                     |civ|)
                                                           (LETT |exps|
                                                                 |nexps|)
                                                           (LETT |offsets|
                                                                 |noffsets|)
                                                           (EXIT
                                                            (LETT |rstate|
                                                                  (SPADCALL
                                                                   (QV_LEN_U32
                                                                    |coeffs|)
                                                                   (QREFELT $
                                                                            74)))))))
                                                        (LETT |all_bad| NIL)
                                                        (LETT |dl|
                                                              (SPADCALL
                                                               (+ |nvars| 1)
                                                               |offsets| |exps|
                                                               |noffsets|
                                                               |nexps|
                                                               (QREFELT $ 47)))
                                                        (LETT |odl|
                                                              (SPADCALL |dl| 1
                                                                        (QREFELT
                                                                         $
                                                                         63)))
                                                        (LETT |ndl|
                                                              (SPADCALL |dl| 2
                                                                        (QREFELT
                                                                         $
                                                                         63)))
                                                        (COND
                                                         ((SPADCALL |odl| NIL
                                                                    (QREFELT $
                                                                             64))
                                                          (SEQ
                                                           (LETT |oer|
                                                                 (SPADCALL
                                                                  (+ |nvars| 1)
                                                                  |odl| |ndl|
                                                                  |offsets|
                                                                  |exps|
                                                                  |noffsets|
                                                                  |nexps|
                                                                  (QREFELT $
                                                                           50)))
                                                           (LETT |offsets|
                                                                 (QCAR |oer|))
                                                           (LETT |exps|
                                                                 (QCDR |oer|))
                                                           (LETT |ncc|
                                                                 (QUOTIENT2
                                                                  (QV_LEN_U32
                                                                   |exps|)
                                                                  (+ |nvars|
                                                                     1)))
                                                           (EXIT
                                                            (LETT |rstate|
                                                                  (SPADCALL
                                                                   |ncc|
                                                                   (QREFELT $
                                                                            74)))))))
                                                        (COND
                                                         ((SPADCALL |ndl| NIL
                                                                    (QREFELT $
                                                                             64))
                                                          (SEQ
                                                           (LETT |n0|
                                                                 (QV_LEN_U32
                                                                  |coeffs|))
                                                           (LETT |nn|
                                                                 (LENGTH
                                                                  |ndl|))
                                                           (LETT |n1|
                                                                 (+ |n0| |nn|))
                                                           (LETT |ncoeffs|
                                                                 (GETREFV_U32
                                                                  |n1| 0))
                                                           (LETT |i| 0)
                                                           (LETT |jl|
                                                                 (|SPADfirst|
                                                                  |ndl|))
                                                           (SEQ (LETT |j| 0)
                                                                (LETT #11#
                                                                      (- |n1|
                                                                         1))
                                                                G190
                                                                (COND
                                                                 ((|greater_SI|
                                                                   |j| #11#)
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (EXIT
                                                                  (COND
                                                                   ((EQL |j|
                                                                         |jl|)
                                                                    (SEQ
                                                                     (SETELT_U32
                                                                      |ncoeffs|
                                                                      |j| 0)
                                                                     (LETT
                                                                      |ndl|
                                                                      (CDR
                                                                       |ndl|))
                                                                     (EXIT
                                                                      (LETT
                                                                       |jl|
                                                                       (COND
                                                                        ((NULL
                                                                          |ndl|)
                                                                         |n1|)
                                                                        ('T
                                                                         (|SPADfirst|
                                                                          |ndl|)))))))
                                                                   ('T
                                                                    (SEQ
                                                                     (SETELT_U32
                                                                      |ncoeffs|
                                                                      |j|
                                                                      (ELT_U32
                                                                       |coeffs|
                                                                       |i|))
                                                                     (EXIT
                                                                      (LETT |i|
                                                                            (+
                                                                             |i|
                                                                             1))))))))
                                                                (LETT |j|
                                                                      (|inc_SI|
                                                                       |j|))
                                                                (GO G190) G191
                                                                (EXIT NIL))
                                                           (EXIT
                                                            (LETT |coeffs|
                                                                  |ncoeffs|)))))
                                                        (LETT |block_offsets|
                                                              (|IMODHP;compute_blocks|
                                                               |offsets| |m|
                                                               |nsols| $))
                                                        (LETT |n1|
                                                              (QV_LEN_U32
                                                               |coeffs|))
                                                        (LETT |ok| 'T)
                                                        (SEQ
                                                         (EXIT
                                                          (SEQ (LETT |i| 1)
                                                               (LETT #9#
                                                                     |nsols|)
                                                               G190
                                                               (COND
                                                                ((|greater_SI|
                                                                  |i| #9#)
                                                                 (GO G191)))
                                                               (SEQ
                                                                (LETT |cnum|
                                                                      (SPADCALL
                                                                       |civ|
                                                                       |i|
                                                                       (QREFELT
                                                                        $ 29)))
                                                                (LETT |ofin|
                                                                      (+
                                                                       (* |m|
                                                                          (-
                                                                           |i|
                                                                           1))
                                                                       |cnum|))
                                                                (LETT |ofi|
                                                                      (SPADCALL
                                                                       |offsets|
                                                                       |ofin|
                                                                       (QREFELT
                                                                        $ 29)))
                                                                (LETT |nofi|
                                                                      (COND
                                                                       ((OR
                                                                         (< |i|
                                                                            |nsols|)
                                                                         (<
                                                                          |cnum|
                                                                          |m|))
                                                                        (SPADCALL
                                                                         |offsets|
                                                                         (+
                                                                          |ofin|
                                                                          1)
                                                                         (QREFELT
                                                                          $
                                                                          29)))
                                                                       ('T
                                                                        |n1|)))
                                                                (LETT |nofi|
                                                                      (- |nofi|
                                                                         1))
                                                                (EXIT
                                                                 (COND
                                                                  ((< |nofi|
                                                                      |ofi|)
                                                                   (SEQ
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |civ|
                                                                      (QREFELT
                                                                       $ 65))
                                                                     (QREFELT $
                                                                              59))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |offsets|
                                                                      (QREFELT
                                                                       $ 65))
                                                                     (QREFELT $
                                                                              59))
                                                                    (EXIT
                                                                     (|error|
                                                                      "Internal error: corrupted offsets"))))
                                                                  ((EQL
                                                                    (ELT_U32
                                                                     |coeffs|
                                                                     |nofi|)
                                                                    0)
                                                                   (SEQ
                                                                    (LETT |ok|
                                                                          NIL)
                                                                    (EXIT
                                                                     (PROGN
                                                                      (LETT #6#
                                                                            |$NoValue|)
                                                                      (GO
                                                                       #13=#:G724)))))
                                                                  ('T
                                                                   (SEQ
                                                                    (LETT
                                                                     |invc|
                                                                     (SPADCALL
                                                                      (ELT_U32
                                                                       |coeffs|
                                                                       |nofi|)
                                                                      |p|
                                                                      (QREFELT
                                                                       $ 66)))
                                                                    (LETT |lo|
                                                                          (SPADCALL
                                                                           |block_offsets|
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            29)))
                                                                    (LETT |hi|
                                                                          (COND
                                                                           ((<
                                                                             |i|
                                                                             |nsols|)
                                                                            (SPADCALL
                                                                             |block_offsets|
                                                                             (+
                                                                              |i|
                                                                              1)
                                                                             (QREFELT
                                                                              $
                                                                              29)))
                                                                           ('T
                                                                            |n1|)))
                                                                    (EXIT
                                                                     (SEQ
                                                                      (LETT |j|
                                                                            |lo|)
                                                                      (LETT #4#
                                                                            (-
                                                                             |hi|
                                                                             1))
                                                                      G190
                                                                      (COND
                                                                       ((> |j|
                                                                           #4#)
                                                                        (GO
                                                                         G191)))
                                                                      (SEQ
                                                                       (EXIT
                                                                        (SETELT_U32
                                                                         |coeffs|
                                                                         |j|
                                                                         (QSMULMOD32
                                                                          (ELT_U32
                                                                           |coeffs|
                                                                           |j|)
                                                                          |invc|
                                                                          |p|))))
                                                                      (LETT |j|
                                                                            (+
                                                                             |j|
                                                                             1))
                                                                      (GO G190)
                                                                      G191
                                                                      (EXIT
                                                                       NIL))))))))
                                                               (LETT |i|
                                                                     (|inc_SI|
                                                                      |i|))
                                                               (GO G190) G191
                                                               (EXIT NIL)))
                                                         #13# (EXIT #6#))
                                                        (EXIT
                                                         (COND
                                                          (|ok|
                                                           (SEQ
                                                            (SPADCALL |coeffs|
                                                                      |p|
                                                                      |rstate|
                                                                      (QREFELT
                                                                       $ 75))
                                                            (LETT |pp|
                                                                  (SPADCALL
                                                                   |rstate|
                                                                   |block_offsets|
                                                                   (QREFELT $
                                                                            77)))
                                                            (EXIT
                                                             (COND
                                                              ((QEQCAR |pp| 1)
                                                               "iterate")
                                                              ('T
                                                               (PROGN
                                                                (LETT #3#
                                                                      (CONS 0
                                                                            (VECTOR
                                                                             |va|
                                                                             |civ|
                                                                             |m|
                                                                             |offsets|
                                                                             |exps|
                                                                             (QCDR
                                                                              |pp|))))
                                                                (GO #12#)))))))
                                                          ('T
                                                           "iterate")))))))))))))))))
                             ('T (|error| "Run out of primes")))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #12# (EXIT #3#)))) 

(SDEFUN |IMODHP;do_poly_integer;LLVNniUv2SMU;13|
        ((|vars| |List| (|Symbol|))
         (|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|ve| |Vector| (|Integer|)) (|sigma| |NonNegativeInteger|)
         (|pts| |U32Vector|) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Union|
          (|Record| (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|)))
                    (|:| |rowlen| (|Integer|))
                    (|:| |offsetdata| (|Vector| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|PrimitiveArray| (|Integer|))))
          "no_solution"))
        (SPROG
         ((#1=#:G754 NIL)
          (|pss|
           (|Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
                     (|:| |pss_sigma| (|NonNegativeInteger|))
                     (|:| |points| (|U32Vector|)) (|:| |pss_qvar| (|Symbol|))
                     (|:| |pss_qval| (|Integer|)) (|:| |pss_kind| (|Symbol|))
                     (|:| |oldva| (|Vector| (|Integer|)))
                     (|:| |oldciv| (|Vector| (|Integer|)))
                     (|:| |pss_m| (|Integer|)) (|:| |sol_cnt| (|Integer|))
                     (|:| |pss1|
                          (|Record| (|:| |prime| (|Integer|))
                                    (|:| |eval1coeffbuf| (|U32Vector|))
                                    (|:| |eval1expbuf|
                                         (|SortedExponentVector|))))))
          (|pss1|
           (|Record| (|:| |prime| (|Integer|))
                     (|:| |eval1coeffbuf| (|U32Vector|))
                     (|:| |eval1expbuf| (|SortedExponentVector|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |pss1| (VECTOR 0 (GETREFV_U32 10 0) (GETREFV_U32 10 0)))
                (LETT |pss|
                      (VECTOR |ve| |sigma| |pts| |qvar| 0 |kind| (MAKE-ARRAY 0)
                              (MAKE-ARRAY 0) (QVSIZE |ve|) (+ (QVSIZE |ve|) 1)
                              |pss1|))
                (EXIT
                 (PROGN
                  (LETT #1#
                        (|IMODHP;do_poly_integer0| |vars| |gvl| |pss| |gen| $))
                  (GO #2=#:G753)))))
          #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |InnerModularHermitePade;|)) 

(DEFUN |InnerModularHermitePade| ()
  (SPROG NIL
         (PROG (#1=#:G756)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|InnerModularHermitePade|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|InnerModularHermitePade|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|InnerModularHermitePade;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|InnerModularHermitePade|)))))))))) 

(DEFUN |InnerModularHermitePade;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|InnerModularHermitePade|))
          (LETT $ (GETREFV 84))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|InnerModularHermitePade| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|InnerModularHermitePade| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Polynomial| 6)
              (|Record| (|:| |prime| 6) (|:| |eval1coeffbuf| 27)
                        (|:| |eval1expbuf| 46))
              (|PolynomialEvaluationUtilities|) (0 . |eval1a|)
              (|SingleInteger|) (7 . |invmod|) (13 . |Zero|) (17 . |One|)
              (|Record| (|:| |numer| 7) (|:| |denom| 7)) (|Union| 15 '"failed")
              (|Symbol|) (21 . |eval1|) (|Fraction| 7) (29 . |modpreduction|)
              (|List| 33) (|Vector| 27) (|Vector| 6) (|NonNegativeInteger|)
              (|NaiveBeckermannLabahnModular|) (35 . |naiveBeckermannLabahn|)
              (|U32Vector|) (43 . |naiveBeckermannLabahnMultipoint|)
              (51 . |elt|) (57 . |elt|) (63 . |setelt!|) (70 . |setelt!|)
              (|Any|) (77 . |elt|) (|AnyFunctions1| 23) (83 . |retract|)
              (|AnyFunctions1| 22) (88 . |retract|)
              (|Record| (|:| |basis| 51) (|:| |defects| 23) (|:| |cinds| 23))
              (93 . |reduceBasis|) (|Union| 39 '"no_solution")
              |IMODHP;do_modular_solve;VVNniUvISU;5| (|Boolean|) (101 . ~=)
              (|List| 49) (|SortedExponentVector|)
              |IMODHP;merge_exponents;IVSevVSevL;7|
              (|Record| (|:| |offsetdata| 23) (|:| |expdata| 46)) (|List| 6)
              |IMODHP;merge2;I2LVSevVSevR;8| (|TwoDimensionalArray| 27)
              (107 . |elt|) (114 . |member?|) (120 . |positiveRemainder|)
              (|String|) (|OutputForm|) (126 . |message|) (|Void|)
              (131 . |print|) (136 . |coerce|) (|VectorModularReconstructor|)
              (141 . |empty|) (147 . |elt|) (153 . ~=) (159 . |coerce|)
              (164 . |invmod|) (170 . |chinese_update|)
              (|Record| (|:| |nvars| 6) (|:| |offsetdata| 23)
                        (|:| |expdata| 46) (|:| |coeffdata| 27))
              (|Union| 68 '"failed") (177 . |reconstruct|)
              (|IntegerPrimesPackage| 6) (186 . |nextPrime|)
              (|VectorIntegerReconstructor|) (191 . |empty|)
              (196 . |chinese_update|) (|Union| (|PrimitiveArray| 6) '"failed")
              (203 . |reconstruct|)
              (|Record| (|:| |defects| 23) (|:| |cinds| 23) (|:| |rowlen| 6)
                        (|:| |offsetdata| 23) (|:| |expdata| 46)
                        (|:| |coeffdata| (|PrimitiveArray| 6)))
              (|Union| 78 '"no_solution") (|List| 17)
              (|List| (|PrimitiveArray| 19)) (|Mapping| 22 (|List| 27) 6 6)
              |IMODHP;do_poly_integer;LLVNniUv2SMU;13|)
           '#(|merge_exponents| 209 |merge2| 218 |do_poly_integer| 229
              |do_modular_solve| 241)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|do_modular_solve|
                                 ((|Union|
                                   (|Record|
                                    (|:| |basis|
                                         (|TwoDimensionalArray| (|U32Vector|)))
                                    (|:| |defects| (|Vector| (|Integer|)))
                                    (|:| |cinds| (|Vector| (|Integer|))))
                                   "no_solution")
                                  (|Vector| (|U32Vector|))
                                  (|Vector| (|Integer|)) (|NonNegativeInteger|)
                                  (|U32Vector|) (|Integer|) (|Symbol|)))
                                T)
                              '((|do_poly_integer|
                                 ((|Union|
                                   (|Record|
                                    (|:| |defects| (|Vector| (|Integer|)))
                                    (|:| |cinds| (|Vector| (|Integer|)))
                                    (|:| |rowlen| (|Integer|))
                                    (|:| |offsetdata| (|Vector| (|Integer|)))
                                    (|:| |expdata| (|SortedExponentVector|))
                                    (|:| |coeffdata|
                                         (|PrimitiveArray| (|Integer|))))
                                   "no_solution")
                                  (|List| (|Symbol|))
                                  (|List|
                                   (|PrimitiveArray|
                                    (|Fraction| (|Polynomial| (|Integer|)))))
                                  (|Vector| (|Integer|)) (|NonNegativeInteger|)
                                  (|U32Vector|) (|Symbol|) (|Symbol|)
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))))
                                T)
                              '((|merge_exponents|
                                 ((|List| (|List| (|Integer|))) (|Integer|)
                                  (|Vector| (|Integer|))
                                  (|SortedExponentVector|)
                                  (|Vector| (|Integer|))
                                  (|SortedExponentVector|)))
                                T)
                              '((|merge2|
                                 ((|Record|
                                   (|:| |offsetdata| (|Vector| (|Integer|)))
                                   (|:| |expdata| (|SortedExponentVector|)))
                                  (|Integer|) (|List| (|Integer|))
                                  (|List| (|Integer|)) (|Vector| (|Integer|))
                                  (|SortedExponentVector|)
                                  (|Vector| (|Integer|))
                                  (|SortedExponentVector|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 83
                                            '(3 9 6 7 6 8 10 2 11 0 0 0 12 0 7
                                              0 13 0 7 0 14 4 9 16 15 17 6 8 18
                                              2 9 16 19 6 20 4 25 21 22 23 24 6
                                              26 4 25 21 22 23 27 6 28 2 23 6 0
                                              6 29 2 22 27 0 6 30 3 22 27 0 6
                                              27 31 3 23 6 0 6 6 32 2 21 33 0 6
                                              34 1 35 23 33 36 1 37 22 33 38 4
                                              25 39 22 23 23 6 40 2 6 43 0 0 44
                                              3 51 27 0 6 6 52 2 49 43 6 0 53 2
                                              6 0 0 0 54 1 56 0 55 57 1 56 58 0
                                              59 1 6 56 0 60 2 61 0 6 6 62 2 45
                                              49 0 6 63 2 49 43 0 0 64 1 23 56
                                              0 65 2 6 0 0 0 66 3 61 58 27 6 0
                                              67 5 61 69 0 6 23 23 46 70 1 71 6
                                              6 72 1 73 0 6 74 3 73 58 27 6 0
                                              75 2 73 76 0 23 77 5 0 45 6 23 46
                                              23 46 47 7 0 48 6 49 49 23 46 23
                                              46 50 8 0 79 80 81 23 24 27 17 17
                                              82 83 6 0 41 22 23 24 27 6 17
                                              42)))))
           '|lookupComplete|)) 

(MAKEPROP '|InnerModularHermitePade| 'NILADIC T) 
