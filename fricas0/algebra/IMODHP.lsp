
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
          (|dms| (|SingleInteger|)) (#2=#:G755 NIL) (|dm| #3=(|Integer|))
          (|nm| #3#)
          (|nlcq|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|)))))
          (#4=#:G757 NIL) (|j| NIL) (|ress| (|U32Vector|))
          (|n| (|NonNegativeInteger|)) (#5=#:G756 NIL) (|gv0| NIL) (|p| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (QVELT |pss| 0) . #6=(|IMODHP;eval1s|))
                (LETT |resl| NIL . #6#)
                (SEQ (LETT |gv0| NIL . #6#) (LETT #5# |gvl| . #6#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |gv0| (CAR #5#) . #6#) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| (QVSIZE |gv0|) . #6#)
                          (LETT |ress| (GETREFV_U32 |n| 0) . #6#)
                          (SEQ (LETT |j| 0 . #6#) (LETT #4# (- |n| 1) . #6#)
                               G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
                               (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|) . #6#)
                                    (LETT |nm|
                                          (SPADCALL (QCAR |nlcq|) |pt| |pss|
                                                    (QREFELT $ 10))
                                          . #6#)
                                    (LETT |dm|
                                          (SPADCALL (QCDR |nlcq|) |pt| |pss|
                                                    (QREFELT $ 10))
                                          . #6#)
                                    (EXIT
                                     (COND
                                      ((EQL |dm| 0)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed") . #6#)
                                        (GO #7=#:G754)))
                                      ('T
                                       (SEQ (LETT |dms| |dm| . #6#)
                                            (LETT |nlc|
                                                  (QSMULMOD32 |nm|
                                                              (SPADCALL |dms|
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 12))
                                                              |p|)
                                                  . #6#)
                                            (EXIT
                                             (SETELT_U32 |ress| |j|
                                                         |nlc|)))))))
                               (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |ress| |resl|) . #6#)))
                     (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #7# (EXIT #2#)))) 

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
          (#1=#:G776 NIL)
          (|res1|
           (|Union|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))
            "failed"))
          (|nlcq|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|)))))
          (#2=#:G778 NIL) (|j| NIL)
          (|ress|
           (|PrimitiveArray|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))))
          (|n| (|NonNegativeInteger|)) (#3=#:G777 NIL) (|gv0| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL . #4=(|IMODHP;eval2s|))
                (SEQ (LETT |gv0| NIL . #4#) (LETT #3# |gvl| . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |gv0| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| (QVSIZE |gv0|) . #4#)
                          (LETT |ress|
                                (MAKEARR1 |n|
                                          (CONS (|spadConstant| $ 13)
                                                (|spadConstant| $ 14)))
                                . #4#)
                          (SEQ (LETT |j| 0 . #4#) (LETT #2# (- |n| 1) . #4#)
                               G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                               (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|) . #4#)
                                    (LETT |res1|
                                          (SPADCALL |nlcq| |var| |pt| |pss|
                                                    (QREFELT $ 18))
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |res1| 1)
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed") . #4#)
                                        (GO #5=#:G775)))
                                      ('T
                                       (QSETAREF1 |ress| |j| (QCDR |res1|))))))
                               (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |ress| |resl|) . #4#)))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #5# (EXIT #1#)))) 

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
          (#1=#:G794 NIL)
          (|res1|
           (|Union|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))
            "failed"))
          (|nlcq| (|Fraction| (|Polynomial| (|Integer|)))) (#2=#:G796 NIL)
          (|j| NIL)
          (|ress|
           (|PrimitiveArray|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))))
          (|n| (|NonNegativeInteger|)) (#3=#:G795 NIL) (|gv0| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL . #4=(|IMODHP;eval3s|))
                (SEQ (LETT |gv0| NIL . #4#) (LETT #3# |gvl| . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |gv0| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| (QVSIZE |gv0|) . #4#)
                          (LETT |ress|
                                (MAKEARR1 |n|
                                          (CONS (|spadConstant| $ 13)
                                                (|spadConstant| $ 14)))
                                . #4#)
                          (SEQ (LETT |j| 0 . #4#) (LETT #2# (- |n| 1) . #4#)
                               G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                               (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|) . #4#)
                                    (LETT |res1|
                                          (SPADCALL |nlcq| |p| (QREFELT $ 20))
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |res1| 1)
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed") . #4#)
                                        (GO #5=#:G793)))
                                      ('T
                                       (QSETAREF1 |ress| |j| (QCDR |res1|))))))
                               (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |ress| |resl|) . #4#)))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #5# (EXIT #1#)))) 

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
         ((#2=#:G848 NIL) (|j| (|Integer|)) (#3=#:G847 NIL) (#4=#:G855 NIL)
          (|i| NIL) (|cindk| (|Integer|)) (#5=#:G854 NIL) (|k| NIL)
          (#6=#:G853 NIL) (#7=#:G852 NIL)
          (|nbas| (|TwoDimensionalArray| (|U32Vector|)))
          (|nr| (|NonNegativeInteger|)) (|bas| #1#)
          (|res|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|bm| (|Vector| (|U32Vector|))) (|dbm| #8=(|Any|)) (|ok| (|Boolean|))
          (#9=#:G851 NIL) (|m2| #10=(|NonNegativeInteger|))
          (|va| (|Vector| (|Integer|))) (|dva| #8#) (|blr| (|List| (|Any|)))
          (|nve| (|Vector| (|Integer|))) (|ngv| (|Vector| (|U32Vector|)))
          (#11=#:G850 NIL) (|m1| (|NonNegativeInteger|)) (#12=#:G849 NIL)
          (|m0| #10#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |m0| (QVSIZE |ve|)
                  . #13=(|IMODHP;do_modular_solve;VVNniUvISU;5|))
            (LETT |m1| 0 . #13#)
            (SEQ (LETT |i| 1 . #13#) (LETT #12# |m0| . #13#) G190
                 (COND ((|greater_SI| |i| #12#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((>= (SPADCALL |ve| |i| (QREFELT $ 29)) 0)
                     (LETT |m1| (+ |m1| 1) . #13#)))))
                 (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191 (EXIT NIL))
            (COND
             ((< |m1| |m0|)
              (SEQ (LETT |ngv| (MAKEARR1 |m1| (GETREFV_U32 0 0)) . #13#)
                   (LETT |nve| (MAKEARR1 |m1| 0) . #13#) (LETT |j| 1 . #13#)
                   (EXIT
                    (SEQ (LETT |i| 1 . #13#) (LETT #11# |m0| . #13#) G190
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
                              (EXIT (LETT |j| (+ |j| 1) . #13#)))))))
                         (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                         (EXIT NIL)))))
             (#14='T
              (SEQ (LETT |ngv| |gv| . #13#) (EXIT (LETT |nve| |ve| . #13#)))))
            (LETT |blr|
                  (|IMODHP;do_modular_solve0| |ngv| |nve| |sigma| |pts| |prime|
                   |kind| $)
                  . #13#)
            (LETT |dva| (SPADCALL |blr| 3 (QREFELT $ 34)) . #13#)
            (LETT |va| (SPADCALL |dva| (QREFELT $ 36)) . #13#)
            (LETT |ok| NIL . #13#) (LETT |m2| (QVSIZE |va|) . #13#)
            (SEQ (LETT |i| 1 . #13#) (LETT #9# |m2| . #13#) G190
                 (COND ((|greater_SI| |i| #9#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |ok|
                         (COND (|ok| 'T)
                               ('T (>= (SPADCALL |va| |i| (QREFELT $ 29)) 0)))
                         . #13#)))
                 (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              (|ok|
               (SEQ (LETT |dbm| (SPADCALL |blr| 1 (QREFELT $ 34)) . #13#)
                    (LETT |bm| (SPADCALL |dbm| (QREFELT $ 38)) . #13#)
                    (LETT |res|
                          (SPADCALL |bm| |nve| |va| |prime| (QREFELT $ 40))
                          . #13#)
                    (COND
                     ((< |m1| |m0|)
                      (SEQ (LETT |bas| (QVELT |res| 0) . #13#)
                           (LETT |nr| (ANROWS |bas|) . #13#)
                           (LETT |nbas|
                                 (MAKE_MATRIX1 |nr| |m0| (GETREFV_U32 0 0))
                                 . #13#)
                           (LETT |j| 1 . #13#)
                           (SEQ (LETT |i| 1 . #13#) (LETT #7# |m0| . #13#) G190
                                (COND ((|greater_SI| |i| #7#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((>= (SPADCALL |ve| |i| (QREFELT $ 29)) 0)
                                    (SEQ
                                     (SEQ (LETT |k| 1 . #13#)
                                          (LETT #6# |nr| . #13#) G190
                                          (COND
                                           ((|greater_SI| |k| #6#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (QSETAREF2O |nbas| |k| |i|
                                                        (QAREF2O |bas| |k| |j|
                                                                 1 1)
                                                        1 1)))
                                          (LETT |k| (|inc_SI| |k|) . #13#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT (LETT |j| (+ |j| 1) . #13#)))))))
                                (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                                (EXIT NIL))
                           (QSETVELT |res| 0 |nbas|)
                           (EXIT
                            (SEQ (LETT |k| 1 . #13#) (LETT #5# |nr| . #13#)
                                 G190 (COND ((|greater_SI| |k| #5#) (GO G191)))
                                 (SEQ
                                  (LETT |cindk|
                                        (SPADCALL (QVELT |res| 2) |k|
                                                  (QREFELT $ 29))
                                        . #13#)
                                  (LETT |j| 1 . #13#)
                                  (EXIT
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |i| 1 . #13#)
                                          (LETT #4# |m0| . #13#) G190
                                          (COND
                                           ((|greater_SI| |i| #4#) (GO G191)))
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
                                                  (SPADCALL (QVELT |res| 2) |k|
                                                            |i| (QREFELT $ 32))
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #3# |$NoValue|
                                                          . #13#)
                                                    (GO #15=#:G837))))))
                                               (EXIT
                                                (LETT |j| (+ |j| 1)
                                                      . #13#)))))))
                                          (LETT |i| (|inc_SI| |i|) . #13#)
                                          (GO G190) G191 (EXIT NIL)))
                                    #15# (EXIT #3#))))
                                 (LETT |k| (|inc_SI| |k|) . #13#) (GO G190)
                                 G191 (EXIT NIL))))))
                    (EXIT (CONS 0 |res|))))
              (#14#
               (PROGN
                (LETT #2# (CONS 1 "no_solution") . #13#)
                (GO #16=#:G846)))))))
          #16# (EXIT #2#)))) 

(SDEFUN |IMODHP;compute_blocks|
        ((|offsets| |Vector| (|Integer|)) (|rowlen| |Integer|)
         (|nsols| |Integer|) ($ |Vector| (|Integer|)))
        (SPROG
         ((#1=#:G859 NIL) (|i| NIL) (|block_offsets| (|Vector| (|Integer|))))
         (SEQ
          (LETT |block_offsets| (MAKEARR1 |nsols| 0)
                . #2=(|IMODHP;compute_blocks|))
          (SEQ (LETT |i| 1 . #2#) (LETT #1# |nsols| . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |block_offsets| |i|
                           (SPADCALL |offsets| (+ (* (- |i| 1) |rowlen|) 1)
                                     (QREFELT $ 29))
                           (QREFELT $ 32))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |block_offsets|)))) 

(SDEFUN |IMODHP;merge_exponents;IVSevVSevL;7|
        ((|nvars| |Integer|) (|offsets| |Vector| (|Integer|))
         (|exps| |SortedExponentVector|) (|noffsets| |Vector| (|Integer|))
         (|nexps| |SortedExponentVector|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|j0| (|Integer|)) (|i0| (|Integer|)) (|j| (|Integer|))
          (|i| (|Integer|)) (|ci| (|Integer|)) (#1=#:G885 NIL)
          (|j0i| (|Integer|)) (|ji| #2=(|Integer|)) (|jl| (|List| (|Integer|)))
          (|i0i| (|Integer|)) (|ii| #2#) (|il| (|List| (|Integer|)))
          (#3=#:G889 NIL) (|k| NIL) (|lj| (|Integer|)) (|li| (|Integer|))
          (#4=#:G886 NIL) (#5=#:G888 NIL) (|jj| NIL) (#6=#:G887 NIL)
          (|kk| (|Integer|)) (|nn| (|Integer|)) (|oc| (|NonNegativeInteger|))
          (|m| #7=(|Integer|)) (|n| #7#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (QUOTIENT2 (QV_LEN_U32 |exps|) |nvars|)
                  . #8=(|IMODHP;merge_exponents;IVSevVSevL;7|))
            (LETT |m| (QUOTIENT2 (QV_LEN_U32 |nexps|) |nvars|) . #8#)
            (LETT |oc| (QVSIZE |offsets|) . #8#) (LETT |i0| 0 . #8#)
            (LETT |j0| 0 . #8#) (LETT |ci| 0 . #8#) (LETT |i| 0 . #8#)
            (LETT |j| 0 . #8#) (LETT |li| 0 . #8#) (LETT |lj| 0 . #8#)
            (LETT |il| NIL . #8#) (LETT |jl| NIL . #8#) (LETT |kk| 1 . #8#)
            (LETT |nn| (- |nvars| 1) . #8#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |i0i| 1 . #8#) (LETT |j0i| 1 . #8#)
                       (LETT |ii| |nvars| . #8#) (LETT |ji| |nvars| . #8#)
                       (COND
                        ((OR (EQL |i0| |li|) (EQL |j0| |lj|))
                         (EXIT
                          (SEQ (LETT |kk| (+ |kk| 1) . #8#)
                               (COND
                                ((< |i0| |li|)
                                 (SEQ (LETT |jj| |i0| . #8#)
                                      (LETT #6# (- |li| 1) . #8#) G190
                                      (COND ((> |jj| #6#) (GO G191)))
                                      (SEQ (LETT |jl| (CONS |ci| |jl|) . #8#)
                                           (EXIT (LETT |ci| (+ |ci| 1) . #8#)))
                                      (LETT |jj| (+ |jj| 1) . #8#) (GO G190)
                                      G191 (EXIT NIL))))
                               (COND
                                ((< |j0| |lj|)
                                 (SEQ (LETT |jj| |j0| . #8#)
                                      (LETT #5# (- |lj| 1) . #8#) G190
                                      (COND ((> |jj| #5#) (GO G191)))
                                      (SEQ (LETT |il| (CONS |ci| |il|) . #8#)
                                           (EXIT (LETT |ci| (+ |ci| 1) . #8#)))
                                      (LETT |jj| (+ |jj| 1) . #8#) (GO G190)
                                      G191 (EXIT NIL))))
                               (EXIT
                                (COND
                                 ((EQL |li| |n|)
                                  (PROGN
                                   (LETT #4#
                                         (LIST (NREVERSE |il|) (NREVERSE |jl|))
                                         . #8#)
                                   (GO #9=#:G884)))
                                 ('T
                                  (SEQ (LETT |i0| |li| . #8#)
                                       (LETT |j0| |lj| . #8#)
                                       (LETT |i| (* |i0| |nvars|) . #8#)
                                       (LETT |j| (* |j0| |nvars|) . #8#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |kk| |oc| (QREFELT $ 44))
                                          (SEQ
                                           (LETT |li|
                                                 (SPADCALL |offsets| |kk|
                                                           (QREFELT $ 29))
                                                 . #8#)
                                           (EXIT
                                            (LETT |lj|
                                                  (SPADCALL |noffsets| |kk|
                                                            (QREFELT $ 29))
                                                  . #8#))))
                                         ('T
                                          (SEQ (LETT |li| |n| . #8#)
                                               (EXIT
                                                (LETT |lj| |m|
                                                      . #8#))))))))))))))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |k| 0 . #8#) (LETT #3# |nn| . #8#) G190
                              (COND ((|greater_SI| |k| #3#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (ELT_U32 |exps| (+ |i| |k|))
                                            (ELT_U32 |nexps| (+ |j| |k|))
                                            (QREFELT $ 45))
                                  (PROGN
                                   (LETT #1#
                                         (COND
                                          ((SPADCALL
                                            (ELT_U32 |exps| (+ |i| |k|))
                                            (ELT_U32 |nexps| (+ |j| |k|))
                                            (QREFELT $ 46))
                                           (SEQ
                                            (LETT |il| (CONS |ci| |il|) . #8#)
                                            (LETT |ii| 0 . #8#)
                                            (LETT |i0i| 0 . #8#)
                                            (EXIT
                                             (PROGN
                                              (LETT #1# |$NoValue| . #8#)
                                              (GO #10=#:G880)))))
                                          ('T
                                           (SEQ
                                            (LETT |jl| (CONS |ci| |jl|) . #8#)
                                            (LETT |ji| 0 . #8#)
                                            (LETT |j0i| 0 . #8#)
                                            (EXIT
                                             (PROGN
                                              (LETT #1# |$NoValue| . #8#)
                                              (GO #10#))))))
                                         . #8#)
                                   (GO #10#))))))
                              (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191
                              (EXIT NIL)))
                        #10# (EXIT #1#))
                       (LETT |ci| (+ |ci| 1) . #8#)
                       (LETT |i| (+ |i| |ii|) . #8#)
                       (LETT |j| (+ |j| |ji|) . #8#)
                       (LETT |i0| (+ |i0| |i0i|) . #8#)
                       (EXIT (LETT |j0| (+ |j0| |j0i|) . #8#)))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #9# (EXIT #4#)))) 

(SDEFUN |IMODHP;merge2;I2LVSevVSevR;8|
        ((|nvars| |Integer|) (|odl| |List| (|Integer|))
         (|ndl| |List| (|Integer|)) (|ov1| |Vector| (|Integer|))
         (|exps1| |SortedExponentVector|) (|ov2| |Vector| (|Integer|))
         (|exps2| |SortedExponentVector|)
         ($ |Record| (|:| |offsetdata| (|Vector| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))))
        (SPROG
         ((#1=#:G916 NIL) (|i| (|Integer|)) (|ci| (|Integer|))
          (|i00| (|Integer|)) (|i0| (|Integer|)) (|j0| (|Integer|))
          (|j| (|Integer|)) (#2=#:G915 NIL) (|k| NIL) (|j00| (|Integer|))
          (#3=#:G914 NIL) (|lj| #4=(|Integer|)) (|li| #4#) (|kk| (|Integer|))
          (#5=#:G913 NIL) (|ci0| (|Integer|)) (|nv1| (|Integer|))
          (|noffsets| (|Vector| (|Integer|))) (|m| (|NonNegativeInteger|))
          (|nexps| (|SortedExponentVector|)) (#6=#:G892 NIL)
          (|nn1| (|Integer|)) (|n1| (|Integer|)) (|nn| (|NonNegativeInteger|))
          (|n0| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n0| (QV_LEN_U32 |exps1|)
                . #7=(|IMODHP;merge2;I2LVSevVSevR;8|))
          (LETT |nn| (LENGTH |odl|) . #7#)
          (LETT |n1| (+ (QUOTIENT2 |n0| |nvars|) |nn|) . #7#)
          (LETT |nn1| (* |n1| |nvars|) . #7#)
          (LETT |nexps|
                (GETREFV_U32
                 (PROG1 (LETT #6# |nn1| . #7#)
                   (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #6#))
                 0)
                . #7#)
          (LETT |m| (QVSIZE |ov2|) . #7#)
          (LETT |noffsets| (MAKEARR1 |m| 0) . #7#)
          (LETT |nv1| (- |nvars| 1) . #7#) (LETT |i0| 0 . #7#)
          (LETT |j0| 0 . #7#) (LETT |ci0| 0 . #7#) (LETT |i| 0 . #7#)
          (LETT |j| 0 . #7#) (LETT |ci| 0 . #7#)
          (LETT |j00| (COND ((NULL |ndl|) |n1|) ('T (|SPADfirst| |ndl|)))
                . #7#)
          (LETT |i00| (|SPADfirst| |odl|) . #7#)
          (LETT |li| (SPADCALL |ov1| 1 (QREFELT $ 29)) . #7#)
          (LETT |lj| (SPADCALL |ov2| 1 (QREFELT $ 29)) . #7#)
          (LETT |kk| 1 . #7#)
          (SEQ (LETT |ci0| 0 . #7#) (LETT #5# (- |n1| 1) . #7#) G190
               (COND ((|greater_SI| |ci0| #5#) (GO G191)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL (COND ((EQL |i0| |li|) (EQL |j0| |lj|)) ('T NIL)))
                       (GO G191)))
                     (SEQ (SPADCALL |noffsets| |kk| |ci0| (QREFELT $ 32))
                          (LETT |kk| (+ |kk| 1) . #7#)
                          (EXIT
                           (COND
                            ((SPADCALL |kk| |m| (QREFELT $ 44))
                             (SEQ
                              (LETT |li| (SPADCALL |ov1| |kk| (QREFELT $ 29))
                                    . #7#)
                              (EXIT
                               (LETT |lj| (SPADCALL |ov2| |kk| (QREFELT $ 29))
                                     . #7#))))
                            ('T
                             (SEQ (LETT |li| |n1| . #7#)
                                  (EXIT (LETT |lj| |n1| . #7#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |ci0| |j00|)
                  (SEQ
                   (SEQ (LETT |k| 0 . #7#) (LETT #3# |nv1| . #7#) G190
                        (COND ((|greater_SI| |k| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT_U32 |nexps| (+ |ci| |k|)
                                      (ELT_U32 |exps1| (+ |i| |k|)))))
                        (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |ndl| (CDR |ndl|) . #7#)
                   (EXIT
                    (LETT |j00|
                          (COND ((NULL |ndl|) |n1|) ('T (|SPADfirst| |ndl|)))
                          . #7#))))
                 ('T
                  (SEQ
                   (SEQ (LETT |k| 0 . #7#) (LETT #2# |nv1| . #7#) G190
                        (COND ((|greater_SI| |k| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT_U32 |nexps| (+ |ci| |k|)
                                      (ELT_U32 |exps2| (+ |j| |k|)))))
                        (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |j| (+ |j| |nvars|) . #7#)
                   (EXIT (LETT |j0| (+ |j0| 1) . #7#)))))
                (COND
                 ((SPADCALL |ci0| |i00| (QREFELT $ 45))
                  (SEQ (LETT |i| (+ |i| |nvars|) . #7#)
                       (EXIT (LETT |i0| (+ |i0| 1) . #7#))))
                 ('T
                  (SEQ (LETT |odl| (CDR |odl|) . #7#)
                       (EXIT
                        (LETT |i00|
                              (COND ((NULL |odl|) |n1|)
                                    ('T (|SPADfirst| |odl|)))
                              . #7#)))))
                (EXIT (LETT |ci| (+ |ci| |nvars|) . #7#)))
               (LETT |ci0| (|inc_SI| |ci0|) . #7#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| |kk| . #7#) (LETT #1# |m| . #7#) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ (EXIT (SPADCALL |noffsets| |i| |n1| (QREFELT $ 32))))
               (LETT |i| (+ |i| 1) . #7#) (GO G190) G191 (EXIT NIL))
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
         ((#4=#:G936 NIL) (#5=#:G935 NIL) (|is_bad| (|Boolean|))
          (|all_bad| (|Boolean|)) (#6=#:G937 NIL) (|i| NIL) (|ociv| #2#)
          (|ova| #1#) (|nsols| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |nsols| (QVELT |pss| 9) . #7=(|IMODHP;check_defects|))
                (LETT |is_bad| (SPADCALL (QVSIZE |va|) |nsols| (QREFELT $ 46))
                      . #7#)
                (LETT |all_bad| (< (QVSIZE |va|) |nsols|) . #7#)
                (COND
                 ((EQL (QVSIZE |va|) |nsols|)
                  (SEQ (LETT |ova| (QVELT |pss| 6) . #7#)
                       (LETT |ociv| (QVELT |pss| 7) . #7#)
                       (EXIT
                        (SEQ
                         (EXIT
                          (SEQ (LETT |i| 1 . #7#) (LETT #6# |nsols| . #7#) G190
                               (COND ((|greater_SI| |i| #6#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((< (SPADCALL |va| |i| (QREFELT $ 29))
                                      (SPADCALL |ova| |i| (QREFELT $ 29)))
                                   (SEQ (LETT |all_bad| 'T . #7#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue| . #7#)
                                          (GO #8=#:G930)))))
                                  ((SPADCALL (SPADCALL |va| |i| (QREFELT $ 29))
                                             (SPADCALL |ova| |i|
                                                       (QREFELT $ 29))
                                             (QREFELT $ 46))
                                   (SEQ (LETT |is_bad| 'T . #7#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue| . #7#)
                                          (GO #8#)))))
                                  ((< (SPADCALL |civ| |i| (QREFELT $ 29))
                                      (SPADCALL |ociv| |i| (QREFELT $ 29)))
                                   (SEQ (LETT |all_bad| 'T . #7#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue| . #7#)
                                          (GO #8#)))))
                                  ((SPADCALL
                                    (SPADCALL |civ| |i| (QREFELT $ 29))
                                    (SPADCALL |ociv| |i| (QREFELT $ 29))
                                    (QREFELT $ 46))
                                   (SEQ (LETT |is_bad| 'T . #7#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue| . #7#)
                                          (GO #8#))))))))
                               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                               (EXIT NIL)))
                         #8# (EXIT #5#))))))
                (EXIT
                 (COND
                  (|is_bad|
                   (PROGN (LETT #4# (CONS 1 "failed") . #7#) (GO #9=#:G934)))
                  (|all_bad|
                   (PROGN (LETT #4# (CONS 2 "all_bad") . #7#) (GO #9#)))
                  ('T (PROGN (LETT #4# (CONS 0 "OK") . #7#) (GO #9#)))))))
          #9# (EXIT #4#)))) 

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
         ((#5=#:G976 NIL)
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
          (#6=#:G981 NIL) (|i| NIL) (|nev| #7=(|SortedExponentVector|))
          (#8=#:G963 NIL) (|ncv| #9=(|U32Vector|)) (#10=#:G961 NIL)
          (|k| (|Integer|)) (|cpl| (|Integer|)) (#11=#:G980 NIL) (|l| NIL)
          (|cp| (|U32Vector|)) (|mm| (|Integer|)) (|k1| (|Integer|))
          (#12=#:G979 NIL) (|j| NIL) (#13=#:G978 NIL)
          (|ov| (|Vector| (|Integer|))) (|ev| #7#) (#14=#:G953 NIL) (|cv| #9#)
          (#15=#:G951 NIL) (|r_cnt| (|Integer|)) (#16=#:G977 NIL)
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
           (SEQ (LETT |pss1| (QVELT |pss| 10) . #21=(|IMODHP;eval_and_solve|))
                (LETT |p| (QVELT |pss1| 0) . #21#)
                (LETT |nvars| (LENGTH |vars|) . #21#)
                (EXIT
                 (COND
                  ((EQL |nvars| 1)
                   (SEQ
                    (LETT |ngv10p|
                          (|IMODHP;eval1s| |gvl| |pt| (|SPADfirst| |vars|)
                           |pss1| $)
                          . #21#)
                    (EXIT
                     (COND
                      ((QEQCAR |ngv10p| 1)
                       (PROGN
                        (LETT #5# (CONS 1 "failed") . #21#)
                        (GO #22=#:G975)))
                      (#23='T
                       (SEQ (LETT |ngv10| (QCDR |ngv10p|) . #21#)
                            (LETT |ngv2|
                                  (SPADCALL |ngv10| |p| (QVELT |pss| 4) |gen|)
                                  . #21#)
                            (LETT |ve| (QVELT |pss| 0) . #21#)
                            (LETT |blr|
                                  (SPADCALL |ngv2| |ve| (QVELT |pss| 1)
                                            (QVELT |pss| 2) |p| (QVELT |pss| 5)
                                            (QREFELT $ 42))
                                  . #21#)
                            (EXIT
                             (COND
                              ((QEQCAR |blr| 1)
                               (PROGN
                                (LETT #5# (CONS 2 "no_solution") . #21#)
                                (GO #22#)))
                              (#23#
                               (SEQ (LETT |rblr| (QCDR |blr|) . #21#)
                                    (LETT |bm| (QVELT |rblr| 0) . #21#)
                                    (LETT |va| (QVELT |rblr| 1) . #21#)
                                    (LETT |civ| (QVELT |rblr| 2) . #21#)
                                    (LETT |nsols| (QVSIZE |va|) . #21#)
                                    (LETT |r_cnt| 0 . #21#)
                                    (LETT |m| (QVSIZE |ve|) . #21#)
                                    (SEQ (LETT |j| 1 . #21#)
                                         (LETT #16# |m| . #21#) G190
                                         (COND
                                          ((|greater_SI| |j| #16#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |r_cnt|
                                                 (+
                                                  (+ |r_cnt|
                                                     (SPADCALL |ve| |j|
                                                               (QREFELT $ 29)))
                                                  1)
                                                 . #21#)))
                                         (LETT |j| (|inc_SI| |j|) . #21#)
                                         (GO G190) G191 (EXIT NIL))
                                    (LETT |r_cnt| (* |r_cnt| |nsols|) . #21#)
                                    (LETT |cv|
                                          (GETREFV_U32
                                           (PROG1 (LETT #15# |r_cnt| . #21#)
                                             (|check_subtype2| (>= #15# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #15#))
                                           0)
                                          . #21#)
                                    (LETT |ev|
                                          (GETREFV_U32
                                           (PROG1 (LETT #14# |r_cnt| . #21#)
                                             (|check_subtype2| (>= #14# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #14#))
                                           0)
                                          . #21#)
                                    (LETT |ov| (MAKEARR1 (* |nsols| |m|) 0)
                                          . #21#)
                                    (LETT |k| 0 . #21#) (LETT |k1| 1 . #21#)
                                    (SEQ (LETT |i| 1 . #21#)
                                         (LETT #13# |nsols| . #21#) G190
                                         (COND
                                          ((|greater_SI| |i| #13#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ (LETT |j| 1 . #21#)
                                                (LETT #12# |m| . #21#) G190
                                                (COND
                                                 ((|greater_SI| |j| #12#)
                                                  (GO G191)))
                                                (SEQ
                                                 (SPADCALL |ov| |k1| |k|
                                                           (QREFELT $ 32))
                                                 (LETT |k1| (+ |k1| 1) . #21#)
                                                 (LETT |mm|
                                                       (SPADCALL |ve| |j|
                                                                 (QREFELT $
                                                                          29))
                                                       . #21#)
                                                 (LETT |cp|
                                                       (SPADCALL |bm| |i| |j|
                                                                 (QREFELT $
                                                                          54))
                                                       . #21#)
                                                 (EXIT
                                                  (SEQ (LETT |l| 0 . #21#)
                                                       (LETT #11# |mm| . #21#)
                                                       G190
                                                       (COND
                                                        ((|greater_SI| |l|
                                                                       #11#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |cpl|
                                                              (ELT_U32 |cp|
                                                                       |l|)
                                                              . #21#)
                                                        (EXIT
                                                         (COND
                                                          ((SPADCALL |cpl| 0
                                                                     (QREFELT $
                                                                              45))
                                                           (SEQ
                                                            (SETELT_U32 |cv|
                                                                        |k|
                                                                        |cpl|)
                                                            (SETELT_U32 |ev|
                                                                        |k|
                                                                        |l|)
                                                            (EXIT
                                                             (LETT |k|
                                                                   (+ |k| 1)
                                                                   . #21#)))))))
                                                       (LETT |l| (|inc_SI| |l|)
                                                             . #21#)
                                                       (GO G190) G191
                                                       (EXIT NIL))))
                                                (LETT |j| (|inc_SI| |j|)
                                                      . #21#)
                                                (GO G190) G191 (EXIT NIL))))
                                         (LETT |i| (|inc_SI| |i|) . #21#)
                                         (GO G190) G191 (EXIT NIL))
                                    (LETT |ncv|
                                          (GETREFV_U32
                                           (PROG1 (LETT #10# |k| . #21#)
                                             (|check_subtype2| (>= #10# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #10#))
                                           0)
                                          . #21#)
                                    (LETT |nev|
                                          (GETREFV_U32
                                           (PROG1 (LETT #8# |k| . #21#)
                                             (|check_subtype2| (>= #8# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #8#))
                                           0)
                                          . #21#)
                                    (SEQ (LETT |i| 0 . #21#)
                                         (LETT #6# (- |k| 1) . #21#) G190
                                         (COND
                                          ((|greater_SI| |i| #6#) (GO G191)))
                                         (SEQ
                                          (SETELT_U32 |ncv| |i|
                                                      (ELT_U32 |cv| |i|))
                                          (EXIT
                                           (SETELT_U32 |nev| |i|
                                                       (ELT_U32 |ev| |i|))))
                                         (LETT |i| (|inc_SI| |i|) . #21#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (PROGN
                                      (LETT #5#
                                            (CONS 0
                                                  (VECTOR |va| |civ| |m| |ov|
                                                          |nev| |ncv|))
                                            . #21#)
                                      (GO #22#)))))))))))))
                  (#23#
                   (SEQ
                    (LETT |ngv0p|
                          (|IMODHP;eval2s| |gvl| |pt| (|SPADfirst| |vars|)
                           |pss1| $)
                          . #21#)
                    (EXIT
                     (COND
                      ((QEQCAR |ngv0p| 1)
                       (PROGN (LETT #5# (CONS 1 "failed") . #21#) (GO #22#)))
                      (#23#
                       (SEQ (LETT |ngvl| (QCDR |ngv0p|) . #21#)
                            (EXIT
                             (PROGN
                              (LETT #5#
                                    (|IMODHP;do_poly_modular| (CDR |vars|)
                                     |ngvl| |pss| |gen| $)
                                    . #21#)
                              (GO #22#)))))))))))))
          #22# (EXIT #5#)))) 

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
         ((#4=#:G1033 NIL)
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
          (#5=#:G1037 NIL) (|j| NIL) (|hi| #6=(|Integer|)) (|lo| #6#)
          (|invc| (|Integer|)) (#7=#:G1032 NIL) (|ok| #8=(|Boolean|))
          (|nofi| #6#) (|ofi| #6#) (|ofin| #9=(|Integer|)) (|cnum| #6#)
          (#10=#:G1036 NIL) (|i| (|Integer|)) (|n1| (|NonNegativeInteger|))
          (|block_offsets| (|Vector| (|Integer|))) (|coeffs| (|U32Vector|))
          (|jl| (|Integer|)) (|ndl| #11=(|List| (|Integer|))) (#12=#:G1035 NIL)
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
          (|qn| (|Integer|)) (#14=#:G1034 NIL) (|k| NIL) (|pts| #1#)
          (|npt| (|Integer|)) (|lpt| (|List| (|Integer|))) (|pt| (|Integer|))
          (|nvars| (|NonNegativeInteger|)) (|m| #2#) (|p| #3#)
          (|update_qval| (|Boolean|)) (|update_points| #8#))
         (SEQ
          (EXIT
           (SEQ (LETT |lpt| NIL . #15=(|IMODHP;do_poly_modular|))
                (LETT |bad_cnt| 0 . #15#) (LETT |good_cnt| 0 . #15#)
                (LETT |exps| (GETREFV_U32 0 0) . #15#)
                (LETT |offsets| (MAKE-ARRAY 0) . #15#)
                (LETT |all_bad| 'T . #15#)
                (LETT |update_points|
                      (COND
                       ((EQUAL (QVELT |pss| 5) '|qshiftHP|)
                        (EQUAL (QVELT |pss| 3) (|SPADfirst| |vars|)))
                       ('T NIL))
                      . #15#)
                (LETT |update_qval|
                      (COND
                       ((OR (EQUAL (QVELT |pss| 5) '|qshiftHP|)
                            (OR (EQUAL (QVELT |pss| 5) '|qdiffHP|)
                                (EQUAL (QVELT |pss| 5) '|qmixed|)))
                        (EQUAL (QVELT |pss| 3) (|SPADfirst| |vars|)))
                       ('T NIL))
                      . #15#)
                (LETT |p| (QVELT (QVELT |pss| 10) 0) . #15#)
                (LETT |m| (QVELT |pss| 8) . #15#)
                (LETT |nvars| (LENGTH |vars|) . #15#)
                (LETT |nsols| (+ |m| 1) . #15#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ok| NIL . #15#)
                           (SEQ (LETT |k| 1 . #15#) G190
                                (COND
                                 ((OR (|greater_SI| |k| 100)
                                      (NULL (NULL |ok|)))
                                  (GO G191)))
                                (SEQ (LETT |pt| (RANDOM |p|) . #15#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |pt| |lpt| (QREFELT $ 55))
                                        "iterate")
                                       ('T
                                        (SEQ
                                         (LETT |lpt| (CONS |pt| |lpt|) . #15#)
                                         (EXIT (LETT |ok| 'T . #15#)))))))
                                (LETT |k| (|inc_SI| |k|) . #15#) (GO G190) G191
                                (EXIT NIL))
                           (COND
                            ((EQL
                              (SPADCALL (LETT |npt| (LENGTH |lpt|) . #15#) 100
                                        (QREFELT $ 56))
                              0)
                             (SEQ
                              (SPADCALL "Number of evaluation points"
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
                                 (SEQ (LETT |pts| (QVELT |pss| 2) . #15#)
                                      (LETT |qn| 1 . #15#)
                                      (EXIT
                                       (SEQ (LETT |k| 0 . #15#)
                                            (LETT #14# (- (QVELT |pss| 1) 1)
                                                  . #15#)
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
                                                                           56))
                                                        . #15#)))
                                            (LETT |k| (|inc_SI| |k|) . #15#)
                                            (GO G190) G191 (EXIT NIL))))))
                               (COND (|update_qval| (QSETVELT |pss| 4 |pt|)))
                               (LETT |pprp|
                                     (|IMODHP;eval_and_solve| |pt| |vars| |gvl|
                                      |pss| |gen| $)
                                     . #15#)
                               (EXIT
                                (COND
                                 ((QEQCAR |pprp| 2)
                                  (PROGN
                                   (LETT #4# (CONS 2 "no_solution") . #15#)
                                   (GO #16=#:G1031)))
                                 ((QEQCAR |pprp| 1)
                                  (SEQ (LETT |bad_cnt| (+ |bad_cnt| 1) . #15#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |bad_cnt| (+ |good_cnt| 2)
                                                    (QREFELT $ 46))
                                          (PROGN
                                           (LETT #4# (CONS 1 "failed") . #15#)
                                           (GO #16#)))
                                         ('T "iterate")))))
                                 ('T
                                  (SEQ (LETT |ppr| (QCDR |pprp|) . #15#)
                                       (LETT |va| (QVELT |ppr| 0) . #15#)
                                       (LETT |civ| (QVELT |ppr| 1) . #15#)
                                       (LETT |nexps| (QVELT |ppr| 4) . #15#)
                                       (LETT |noffsets| (QVELT |ppr| 3) . #15#)
                                       (LETT |coeffs| (QVELT |ppr| 5) . #15#)
                                       (LETT |chk_ress|
                                             (|IMODHP;check_defects| |va| |civ|
                                              |pss| $)
                                             . #15#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |chk_ress| 1)
                                          (SEQ
                                           (LETT |bad_cnt| (+ |bad_cnt| 1)
                                                 . #15#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |bad_cnt|
                                                        (+ |good_cnt| 2)
                                                        (QREFELT $ 46))
                                              (PROGN
                                               (LETT #4# (CONS 1 "failed")
                                                     . #15#)
                                               (GO #16#)))
                                             ('T "iterate")))))
                                         ('T
                                          (SEQ
                                           (COND
                                            ((QEQCAR |chk_ress| 2)
                                             (LETT |all_bad| 'T . #15#)))
                                           (COND
                                            (|all_bad|
                                             (SEQ
                                              (LETT |nsols| (QVSIZE |va|)
                                                    . #15#)
                                              (QSETVELT |pss| 9 |nsols|)
                                              (QSETVELT |pss| 6 |va|)
                                              (QSETVELT |pss| 7 |civ|)
                                              (LETT |exps| |nexps| . #15#)
                                              (LETT |offsets| |noffsets|
                                                    . #15#)
                                              (EXIT
                                               (LETT |rstate|
                                                     (SPADCALL
                                                      (QV_LEN_U32 |coeffs|) |p|
                                                      (QREFELT $ 62))
                                                     . #15#)))))
                                           (LETT |all_bad| NIL . #15#)
                                           (LETT |good_cnt| (+ |good_cnt| 1)
                                                 . #15#)
                                           (LETT |dl|
                                                 (SPADCALL |nvars| |offsets|
                                                           |exps| |noffsets|
                                                           |nexps|
                                                           (QREFELT $ 49))
                                                 . #15#)
                                           (LETT |odl|
                                                 (SPADCALL |dl| 1
                                                           (QREFELT $ 63))
                                                 . #15#)
                                           (LETT |ndl|
                                                 (SPADCALL |dl| 2
                                                           (QREFELT $ 63))
                                                 . #15#)
                                           (COND
                                            ((SPADCALL |odl| NIL
                                                       (QREFELT $ 64))
                                             (SEQ
                                              (LETT |oer|
                                                    (SPADCALL |nvars| |odl|
                                                              |ndl| |offsets|
                                                              |exps| |noffsets|
                                                              |nexps|
                                                              (QREFELT $ 52))
                                                    . #15#)
                                              (LETT |offsets| (QCAR |oer|)
                                                    . #15#)
                                              (LETT |exps| (QCDR |oer|) . #15#)
                                              (LETT |ncc|
                                                    (QUOTIENT2
                                                     (QV_LEN_U32 |exps|)
                                                     |nvars|)
                                                    . #15#)
                                              (EXIT
                                               (LETT |rstate|
                                                     (SPADCALL |ncc| |p|
                                                               (QREFELT $ 62))
                                                     . #15#)))))
                                           (COND
                                            ((SPADCALL |ndl| NIL
                                                       (QREFELT $ 64))
                                             (SEQ
                                              (LETT |n0| (QV_LEN_U32 |coeffs|)
                                                    . #15#)
                                              (LETT |nn| (LENGTH |ndl|) . #15#)
                                              (LETT |n1| (+ |n0| |nn|) . #15#)
                                              (LETT |ncoeffs|
                                                    (GETREFV_U32 |n1| 0)
                                                    . #15#)
                                              (LETT |i| 0 . #15#)
                                              (LETT |jl| (|SPADfirst| |ndl|)
                                                    . #15#)
                                              (SEQ (LETT |j| 0 . #15#)
                                                   (LETT #12# (- |n1| 1)
                                                         . #15#)
                                                   G190
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
                                                        (LETT |ndl| (CDR |ndl|)
                                                              . #15#)
                                                        (EXIT
                                                         (LETT |jl|
                                                               (COND
                                                                ((NULL |ndl|)
                                                                 |n1|)
                                                                ('T
                                                                 (|SPADfirst|
                                                                  |ndl|)))
                                                               . #15#))))
                                                      ('T
                                                       (SEQ
                                                        (SETELT_U32 |ncoeffs|
                                                                    |j|
                                                                    (ELT_U32
                                                                     |coeffs|
                                                                     |i|))
                                                        (EXIT
                                                         (LETT |i| (+ |i| 1)
                                                               . #15#)))))))
                                                   (LETT |j| (|inc_SI| |j|)
                                                         . #15#)
                                                   (GO G190) G191 (EXIT NIL))
                                              (EXIT
                                               (LETT |coeffs| |ncoeffs|
                                                     . #15#)))))
                                           (LETT |block_offsets|
                                                 (|IMODHP;compute_blocks|
                                                  |offsets| |m| |nsols| $)
                                                 . #15#)
                                           (LETT |n1| (QV_LEN_U32 |coeffs|)
                                                 . #15#)
                                           (LETT |ok| 'T . #15#)
                                           (SEQ
                                            (EXIT
                                             (SEQ (LETT |i| 1 . #15#)
                                                  (LETT #10# |nsols| . #15#)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |i| #10#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |cnum|
                                                         (SPADCALL |civ| |i|
                                                                   (QREFELT $
                                                                            29))
                                                         . #15#)
                                                   (LETT |ofin|
                                                         (+ (* |m| (- |i| 1))
                                                            |cnum|)
                                                         . #15#)
                                                   (LETT |ofi|
                                                         (SPADCALL |offsets|
                                                                   |ofin|
                                                                   (QREFELT $
                                                                            29))
                                                         . #15#)
                                                   (LETT |nofi|
                                                         (COND
                                                          ((OR (< |i| |nsols|)
                                                               (< |cnum| |m|))
                                                           (SPADCALL |offsets|
                                                                     (+ |ofin|
                                                                        1)
                                                                     (QREFELT $
                                                                              29)))
                                                          ('T |n1|))
                                                         . #15#)
                                                   (LETT |nofi| (- |nofi| 1)
                                                         . #15#)
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
                                                      (SEQ
                                                       (LETT |ok| NIL . #15#)
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #7# |$NoValue|
                                                               . #15#)
                                                         (GO #17=#:G1018)))))
                                                     ('T
                                                      (SEQ
                                                       (LETT |invc|
                                                             (SPADCALL
                                                              (ELT_U32 |coeffs|
                                                                       |nofi|)
                                                              |p|
                                                              (QREFELT $ 66))
                                                             . #15#)
                                                       (LETT |lo|
                                                             (SPADCALL
                                                              |block_offsets|
                                                              |i|
                                                              (QREFELT $ 29))
                                                             . #15#)
                                                       (LETT |hi|
                                                             (COND
                                                              ((< |i| |nsols|)
                                                               (SPADCALL
                                                                |block_offsets|
                                                                (+ |i| 1)
                                                                (QREFELT $
                                                                         29)))
                                                              ('T |n1|))
                                                             . #15#)
                                                       (EXIT
                                                        (SEQ
                                                         (LETT |j| |lo| . #15#)
                                                         (LETT #5# (- |hi| 1)
                                                               . #15#)
                                                         G190
                                                         (COND
                                                          ((> |j| #5#)
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (SETELT_U32 |coeffs|
                                                                       |j|
                                                                       (QSMULMOD32
                                                                        (ELT_U32
                                                                         |coeffs|
                                                                         |j|)
                                                                        |invc|
                                                                        |p|))))
                                                         (LETT |j| (+ |j| 1)
                                                               . #15#)
                                                         (GO G190) G191
                                                         (EXIT NIL))))))))
                                                  (LETT |i| (|inc_SI| |i|)
                                                        . #15#)
                                                  (GO G190) G191 (EXIT NIL)))
                                            #17# (EXIT #7#))
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
                                                               (QREFELT $ 70))
                                                     . #15#)
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |pp| 1) "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |rr| (QCDR |pp|)
                                                         . #15#)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #4#
                                                           (CONS 0
                                                                 (VECTOR |va|
                                                                         |civ|
                                                                         |m|
                                                                         (QVELT
                                                                          |rr|
                                                                          1)
                                                                         (QVELT
                                                                          |rr|
                                                                          2)
                                                                         (QVELT
                                                                          |rr|
                                                                          3)))
                                                           . #15#)
                                                     (GO #16#)))))))))
                                             ('T "iterate")))))))))))))
                             ('T (|error| "Run out of evaluation points")))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #16# (EXIT #4#)))) 

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
         ((#3=#:G1081 NIL)
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (#4=#:G1084 NIL) (|j| NIL) (|hi| #5=(|Integer|)) (|lo| #5#)
          (|invc| (|Integer|)) (#6=#:G1080 NIL) (|ok| #7=(|Boolean|))
          (|nofi| #5#) (|ofi| #5#) (|ofin| #8=(|Integer|)) (|cnum| #5#)
          (#9=#:G1083 NIL) (|i| (|Integer|)) (|n1| (|NonNegativeInteger|))
          (|block_offsets| (|Vector| (|Integer|))) (|coeffs| (|U32Vector|))
          (|jl| (|Integer|)) (|ndl| #10=(|List| (|Integer|))) (#11=#:G1082 NIL)
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
           (SEQ (LETT |lp| NIL . #12=(|IMODHP;do_poly_integer0|))
                (LETT |exps| (GETREFV_U32 0 0) . #12#)
                (LETT |offsets| (MAKE-ARRAY 0) . #12#)
                (LETT |all_bad| 'T . #12#)
                (LETT |pss1| (QVELT |pss| 10) . #12#) (LETT |p| 16 . #12#)
                (LETT |m| (QVELT |pss| 8) . #12#)
                (LETT |nvars| (LENGTH |vars|) . #12#)
                (LETT |nsols| (+ |m| 1) . #12#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ok| NIL . #12#)
                           (SEQ (LETT |k| 1 . #12#) G190
                                (COND
                                 ((OR (|greater_SI| |k| 100)
                                      (NULL (NULL |ok|)))
                                  (GO G191)))
                                (SEQ
                                 (LETT |p|
                                       (SPADCALL (+ (RANDOM 200000) 200000)
                                                 (QREFELT $ 72))
                                       . #12#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |p| |lp| (QREFELT $ 55))
                                    "iterate")
                                   ('T
                                    (SEQ (LETT |lp| (CONS |p| |lp|) . #12#)
                                         (EXIT (LETT |ok| 'T . #12#)))))))
                                (LETT |k| (|inc_SI| |k|) . #12#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (COND
                             (|ok|
                              (SEQ (QSETVELT |pss1| 0 |p|)
                                   (LETT |ngv0p| (|IMODHP;eval3s| |gvl| |p| $)
                                         . #12#)
                                   (EXIT
                                    (COND ((QEQCAR |ngv0p| 1) "iterate")
                                          ('T
                                           (SEQ
                                            (LETT |ngvl| (QCDR |ngv0p|) . #12#)
                                            (LETT |pprp|
                                                  (|IMODHP;do_poly_modular|
                                                   |vars| |ngvl| |pss| |gen| $)
                                                  . #12#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |pprp| 2)
                                               (PROGN
                                                (LETT #3#
                                                      (CONS 1 "no_solution")
                                                      . #12#)
                                                (GO #13=#:G1079)))
                                              ((QEQCAR |pprp| 1) "iterate")
                                              ('T
                                               (SEQ
                                                (LETT |ppr| (QCDR |pprp|)
                                                      . #12#)
                                                (LETT |va| (QVELT |ppr| 0)
                                                      . #12#)
                                                (LETT |civ| (QVELT |ppr| 1)
                                                      . #12#)
                                                (LETT |nexps| (QVELT |ppr| 4)
                                                      . #12#)
                                                (LETT |noffsets|
                                                      (QVELT |ppr| 3) . #12#)
                                                (LETT |coeffs| (QVELT |ppr| 5)
                                                      . #12#)
                                                (LETT |chk_ress|
                                                      (|IMODHP;check_defects|
                                                       |va| |civ| |pss| $)
                                                      . #12#)
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |chk_ress| 1)
                                                   "iterate")
                                                  ('T
                                                   (SEQ
                                                    (COND
                                                     ((QEQCAR |chk_ress| 2)
                                                      (LETT |all_bad| 'T
                                                            . #12#)))
                                                    (COND
                                                     (|all_bad|
                                                      (SEQ
                                                       (LETT |nsols|
                                                             (QVSIZE |va|)
                                                             . #12#)
                                                       (QSETVELT |pss| 9
                                                                 |nsols|)
                                                       (QSETVELT |pss| 6 |va|)
                                                       (QSETVELT |pss| 7 |civ|)
                                                       (LETT |exps| |nexps|
                                                             . #12#)
                                                       (LETT |offsets|
                                                             |noffsets| . #12#)
                                                       (EXIT
                                                        (LETT |rstate|
                                                              (SPADCALL
                                                               (QV_LEN_U32
                                                                |coeffs|)
                                                               (QREFELT $ 74))
                                                              . #12#)))))
                                                    (LETT |all_bad| NIL . #12#)
                                                    (LETT |dl|
                                                          (SPADCALL
                                                           (+ |nvars| 1)
                                                           |offsets| |exps|
                                                           |noffsets| |nexps|
                                                           (QREFELT $ 49))
                                                          . #12#)
                                                    (LETT |odl|
                                                          (SPADCALL |dl| 1
                                                                    (QREFELT $
                                                                             63))
                                                          . #12#)
                                                    (LETT |ndl|
                                                          (SPADCALL |dl| 2
                                                                    (QREFELT $
                                                                             63))
                                                          . #12#)
                                                    (COND
                                                     ((SPADCALL |odl| NIL
                                                                (QREFELT $ 64))
                                                      (SEQ
                                                       (LETT |oer|
                                                             (SPADCALL
                                                              (+ |nvars| 1)
                                                              |odl| |ndl|
                                                              |offsets| |exps|
                                                              |noffsets|
                                                              |nexps|
                                                              (QREFELT $ 52))
                                                             . #12#)
                                                       (LETT |offsets|
                                                             (QCAR |oer|)
                                                             . #12#)
                                                       (LETT |exps|
                                                             (QCDR |oer|)
                                                             . #12#)
                                                       (LETT |ncc|
                                                             (QUOTIENT2
                                                              (QV_LEN_U32
                                                               |exps|)
                                                              (+ |nvars| 1))
                                                             . #12#)
                                                       (EXIT
                                                        (LETT |rstate|
                                                              (SPADCALL |ncc|
                                                                        (QREFELT
                                                                         $ 74))
                                                              . #12#)))))
                                                    (COND
                                                     ((SPADCALL |ndl| NIL
                                                                (QREFELT $ 64))
                                                      (SEQ
                                                       (LETT |n0|
                                                             (QV_LEN_U32
                                                              |coeffs|)
                                                             . #12#)
                                                       (LETT |nn|
                                                             (LENGTH |ndl|)
                                                             . #12#)
                                                       (LETT |n1| (+ |n0| |nn|)
                                                             . #12#)
                                                       (LETT |ncoeffs|
                                                             (GETREFV_U32 |n1|
                                                                          0)
                                                             . #12#)
                                                       (LETT |i| 0 . #12#)
                                                       (LETT |jl|
                                                             (|SPADfirst|
                                                              |ndl|)
                                                             . #12#)
                                                       (SEQ (LETT |j| 0 . #12#)
                                                            (LETT #11#
                                                                  (- |n1| 1)
                                                                  . #12#)
                                                            G190
                                                            (COND
                                                             ((|greater_SI| |j|
                                                                            #11#)
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (COND
                                                               ((EQL |j| |jl|)
                                                                (SEQ
                                                                 (SETELT_U32
                                                                  |ncoeffs| |j|
                                                                  0)
                                                                 (LETT |ndl|
                                                                       (CDR
                                                                        |ndl|)
                                                                       . #12#)
                                                                 (EXIT
                                                                  (LETT |jl|
                                                                        (COND
                                                                         ((NULL
                                                                           |ndl|)
                                                                          |n1|)
                                                                         ('T
                                                                          (|SPADfirst|
                                                                           |ndl|)))
                                                                        . #12#))))
                                                               ('T
                                                                (SEQ
                                                                 (SETELT_U32
                                                                  |ncoeffs| |j|
                                                                  (ELT_U32
                                                                   |coeffs|
                                                                   |i|))
                                                                 (EXIT
                                                                  (LETT |i|
                                                                        (+ |i|
                                                                           1)
                                                                        . #12#)))))))
                                                            (LETT |j|
                                                                  (|inc_SI|
                                                                   |j|)
                                                                  . #12#)
                                                            (GO G190) G191
                                                            (EXIT NIL))
                                                       (EXIT
                                                        (LETT |coeffs|
                                                              |ncoeffs|
                                                              . #12#)))))
                                                    (LETT |block_offsets|
                                                          (|IMODHP;compute_blocks|
                                                           |offsets| |m|
                                                           |nsols| $)
                                                          . #12#)
                                                    (LETT |n1|
                                                          (QV_LEN_U32 |coeffs|)
                                                          . #12#)
                                                    (LETT |ok| 'T . #12#)
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |i| 1 . #12#)
                                                           (LETT #9# |nsols|
                                                                 . #12#)
                                                           G190
                                                           (COND
                                                            ((|greater_SI| |i|
                                                                           #9#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |cnum|
                                                                  (SPADCALL
                                                                   |civ| |i|
                                                                   (QREFELT $
                                                                            29))
                                                                  . #12#)
                                                            (LETT |ofin|
                                                                  (+
                                                                   (* |m|
                                                                      (- |i|
                                                                         1))
                                                                   |cnum|)
                                                                  . #12#)
                                                            (LETT |ofi|
                                                                  (SPADCALL
                                                                   |offsets|
                                                                   |ofin|
                                                                   (QREFELT $
                                                                            29))
                                                                  . #12#)
                                                            (LETT |nofi|
                                                                  (COND
                                                                   ((OR
                                                                     (< |i|
                                                                        |nsols|)
                                                                     (< |cnum|
                                                                        |m|))
                                                                    (SPADCALL
                                                                     |offsets|
                                                                     (+ |ofin|
                                                                        1)
                                                                     (QREFELT $
                                                                              29)))
                                                                   ('T |n1|))
                                                                  . #12#)
                                                            (LETT |nofi|
                                                                  (- |nofi| 1)
                                                                  . #12#)
                                                            (EXIT
                                                             (COND
                                                              ((< |nofi| |ofi|)
                                                               (SEQ
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |civ|
                                                                  (QREFELT $
                                                                           65))
                                                                 (QREFELT $
                                                                          59))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |offsets|
                                                                  (QREFELT $
                                                                           65))
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
                                                                (LETT |ok| NIL
                                                                      . #12#)
                                                                (EXIT
                                                                 (PROGN
                                                                  (LETT #6#
                                                                        |$NoValue|
                                                                        . #12#)
                                                                  (GO
                                                                   #14=#:G1067)))))
                                                              ('T
                                                               (SEQ
                                                                (LETT |invc|
                                                                      (SPADCALL
                                                                       (ELT_U32
                                                                        |coeffs|
                                                                        |nofi|)
                                                                       |p|
                                                                       (QREFELT
                                                                        $ 66))
                                                                      . #12#)
                                                                (LETT |lo|
                                                                      (SPADCALL
                                                                       |block_offsets|
                                                                       |i|
                                                                       (QREFELT
                                                                        $ 29))
                                                                      . #12#)
                                                                (LETT |hi|
                                                                      (COND
                                                                       ((< |i|
                                                                           |nsols|)
                                                                        (SPADCALL
                                                                         |block_offsets|
                                                                         (+ |i|
                                                                            1)
                                                                         (QREFELT
                                                                          $
                                                                          29)))
                                                                       ('T
                                                                        |n1|))
                                                                      . #12#)
                                                                (EXIT
                                                                 (SEQ
                                                                  (LETT |j|
                                                                        |lo|
                                                                        . #12#)
                                                                  (LETT #4#
                                                                        (- |hi|
                                                                           1)
                                                                        . #12#)
                                                                  G190
                                                                  (COND
                                                                   ((> |j| #4#)
                                                                    (GO G191)))
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
                                                                        (+ |j|
                                                                           1)
                                                                        . #12#)
                                                                  (GO G190)
                                                                  G191
                                                                  (EXIT
                                                                   NIL))))))))
                                                           (LETT |i|
                                                                 (|inc_SI| |i|)
                                                                 . #12#)
                                                           (GO G190) G191
                                                           (EXIT NIL)))
                                                     #14# (EXIT #6#))
                                                    (EXIT
                                                     (COND
                                                      (|ok|
                                                       (SEQ
                                                        (SPADCALL |coeffs| |p|
                                                                  |rstate|
                                                                  (QREFELT $
                                                                           75))
                                                        (LETT |pp|
                                                              (SPADCALL
                                                               |rstate|
                                                               |block_offsets|
                                                               (QREFELT $ 77))
                                                              . #12#)
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
                                                                          |pp|)))
                                                                  . #12#)
                                                            (GO #13#)))))))
                                                      ('T
                                                       "iterate")))))))))))))))))
                             ('T (|error| "Run out of primes")))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #13# (EXIT #3#)))) 

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
         ((#1=#:G1097 NIL)
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
           (SEQ
            (LETT |pss1| (VECTOR 0 (GETREFV_U32 10 0) (GETREFV_U32 10 0))
                  . #2=(|IMODHP;do_poly_integer;LLVNniUv2SMU;13|))
            (LETT |pss|
                  (VECTOR |ve| |sigma| |pts| |qvar| 0 |kind| (MAKE-ARRAY 0)
                          (MAKE-ARRAY 0) (QVSIZE |ve|) (+ (QVSIZE |ve|) 1)
                          |pss1|)
                  . #2#)
            (EXIT
             (PROGN
              (LETT #1# (|IMODHP;do_poly_integer0| |vars| |gvl| |pss| |gen| $)
                    . #2#)
              (GO #3=#:G1096)))))
          #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |InnerModularHermitePade;|)) 

(DEFUN |InnerModularHermitePade| ()
  (SPROG NIL
         (PROG (#1=#:G1099)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|InnerModularHermitePade|)
                    . #2=(|InnerModularHermitePade|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|InnerModularHermitePade|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|InnerModularHermitePade;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|InnerModularHermitePade|)))))))))) 

(DEFUN |InnerModularHermitePade;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|InnerModularHermitePade|)
                . #1=(|InnerModularHermitePade|))
          (LETT $ (GETREFV 84) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InnerModularHermitePade| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|InnerModularHermitePade| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Polynomial| 6)
              (|Record| (|:| |prime| 6) (|:| |eval1coeffbuf| 27)
                        (|:| |eval1expbuf| 48))
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
              (|Record| (|:| |basis| 53) (|:| |defects| 23) (|:| |cinds| 23))
              (93 . |reduceBasis|) (|Union| 39 '"no_solution")
              |IMODHP;do_modular_solve;VVNniUvISU;5| (|Boolean|) (101 . <=)
              (107 . ~=) (113 . >) (|List| 51) (|SortedExponentVector|)
              |IMODHP;merge_exponents;IVSevVSevL;7|
              (|Record| (|:| |offsetdata| 23) (|:| |expdata| 48)) (|List| 6)
              |IMODHP;merge2;I2LVSevVSevR;8| (|TwoDimensionalArray| 27)
              (119 . |elt|) (126 . |member?|) (132 . |positiveRemainder|)
              (|Void|) (|OutputForm|) (138 . |print|) (143 . |coerce|)
              (|VectorModularReconstructor|) (148 . |empty|) (154 . |elt|)
              (160 . ~=) (166 . |coerce|) (171 . |invmod|)
              (177 . |chinese_update|)
              (|Record| (|:| |nvars| 6) (|:| |offsetdata| 23)
                        (|:| |expdata| 48) (|:| |coeffdata| 27))
              (|Union| 68 '"failed") (184 . |reconstruct|)
              (|IntegerPrimesPackage| 6) (193 . |nextPrime|)
              (|VectorIntegerReconstructor|) (198 . |empty|)
              (203 . |chinese_update|) (|Union| (|PrimitiveArray| 6) '"failed")
              (210 . |reconstruct|)
              (|Record| (|:| |defects| 23) (|:| |cinds| 23) (|:| |rowlen| 6)
                        (|:| |offsetdata| 23) (|:| |expdata| 48)
                        (|:| |coeffdata| (|PrimitiveArray| 6)))
              (|Union| 78 '"no_solution") (|List| 17)
              (|List| (|PrimitiveArray| 19)) (|Mapping| 22 (|List| 27) 6 6)
              |IMODHP;do_poly_integer;LLVNniUv2SMU;13|)
           '#(|merge_exponents| 216 |merge2| 225 |do_poly_integer| 236
              |do_modular_solve| 248)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 83
                                                 '(3 9 6 7 6 8 10 2 11 0 0 0 12
                                                   0 7 0 13 0 7 0 14 4 9 16 15
                                                   17 6 8 18 2 9 16 19 6 20 4
                                                   25 21 22 23 24 6 26 4 25 21
                                                   22 23 27 6 28 2 23 6 0 6 29
                                                   2 22 27 0 6 30 3 22 27 0 6
                                                   27 31 3 23 6 0 6 6 32 2 21
                                                   33 0 6 34 1 35 23 33 36 1 37
                                                   22 33 38 4 25 39 22 23 23 6
                                                   40 2 6 43 0 0 44 2 6 43 0 0
                                                   45 2 6 43 0 0 46 3 53 27 0 6
                                                   6 54 2 51 43 6 0 55 2 6 0 0
                                                   0 56 1 58 57 0 59 1 6 58 0
                                                   60 2 61 0 6 6 62 2 47 51 0 6
                                                   63 2 51 43 0 0 64 1 23 58 0
                                                   65 2 6 0 0 0 66 3 61 57 27 6
                                                   0 67 5 61 69 0 6 23 23 48 70
                                                   1 71 6 6 72 1 73 0 6 74 3 73
                                                   57 27 6 0 75 2 73 76 0 23 77
                                                   5 0 47 6 23 48 23 48 49 7 0
                                                   50 6 51 51 23 48 23 48 52 8
                                                   0 79 80 81 23 24 27 17 17 82
                                                   83 6 0 41 22 23 24 27 6 17
                                                   42)))))
           '|lookupComplete|)) 

(MAKEPROP '|InnerModularHermitePade| 'NILADIC T) 
