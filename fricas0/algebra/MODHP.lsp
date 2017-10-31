
(SDEFUN |MODHP;VSUPI_to_VPA;VIV;1|
        ((|vps| |Vector| (|SparseUnivariatePolynomial| (|Integer|)))
         (|p| |Integer|) ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G729 NIL) (|i| NIL) (|vpa| (|Vector| (|U32Vector|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |vps|) . #2=(|MODHP;VSUPI_to_VPA;VIV;1|))
              (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# |m| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |vpa| |i|
                               (SPADCALL (SPADCALL |vps| |i| (QREFELT $ 9)) |p|
                                         (QREFELT $ 12))
                               (QREFELT $ 14))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |vpa|)))) 

(SDEFUN |MODHP;SUPPI_to_PA|
        ((|poli| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         (|vars| |List| (|Symbol|)) (|pts| |List| (|Integer|)) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((|nlc| (|Integer|)) (|m| #1=(|NonNegativeInteger|))
          (|pa| (|U32Vector|)) (|n| #1#))
         (SEQ
          (LETT |n| (SPADCALL |poli| (QREFELT $ 18))
                . #2=(|MODHP;SUPPI_to_PA|))
          (LETT |pa| (GETREFV_U32 (+ |n| 1) 0) . #2#)
          (SEQ G190
               (COND
                ((NULL (NULL (SPADCALL |poli| (QREFELT $ 20)))) (GO G191)))
               (SEQ (LETT |m| (SPADCALL |poli| (QREFELT $ 18)) . #2#)
                    (LETT |nlc|
                          (SPADCALL (SPADCALL |poli| (QREFELT $ 22)) |vars|
                                    |pts| |p| (QREFELT $ 26))
                          . #2#)
                    (SETELT_U32 |pa| |m| |nlc|)
                    (EXIT
                     (LETT |poli| (SPADCALL |poli| (QREFELT $ 27)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |pa|)))) 

(SDEFUN |MODHP;VSUPPI_to_VPA;VLLIV;3|
        ((|vps| |Vector|
          (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
         (|vars| |List| (|Symbol|)) (|pts| |List| (|Integer|)) (|p| |Integer|)
         ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G745 NIL) (|i| NIL) (|vpa| (|Vector| (|U32Vector|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |vps|) . #2=(|MODHP;VSUPPI_to_VPA;VLLIV;3|))
              (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# |m| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |vpa| |i|
                               (|MODHP;SUPPI_to_PA|
                                (SPADCALL |vps| |i| (QREFELT $ 29)) |vars|
                                |pts| |p| $)
                               (QREFELT $ 14))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |vpa|)))) 

(SDEFUN |MODHP;LLFI_to_LPA;L2IU;4|
        ((|llfi| |List| (|List| (|Fraction| (|Integer|)))) (|n| |Integer|)
         (|prime| |Integer|) ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPROG
         ((|resl| (|List| (|U32Vector|))) (|nlc| (|Integer|))
          (|dms| (|SingleInteger|)) (#1=#:G766 NIL) (|dm| #2=(|Integer|))
          (|nm| #2#) (#3=#:G768 NIL) (|j| NIL) (#4=#:G769 NIL) (|el| NIL)
          (|pa| (|U32Vector|)) (|nn| (|Integer|)) (#5=#:G767 NIL) (|lfi| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL . #6=(|MODHP;LLFI_to_LPA;L2IU;4|))
                (SEQ (LETT |lfi| NIL . #6#) (LETT #5# |llfi| . #6#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |lfi| (CAR #5#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |nn|
                            (COND ((SPADCALL |n| 0 (QREFELT $ 33)) |n|)
                                  ('T (LENGTH |lfi|)))
                            . #6#)
                      (LETT |pa| (GETREFV_U32 |nn| 0) . #6#)
                      (SEQ (LETT |el| NIL . #6#) (LETT #4# |lfi| . #6#)
                           (LETT |j| 0 . #6#) (LETT #3# (- |nn| 1) . #6#) G190
                           (COND
                            ((OR (|greater_SI| |j| #3#) (ATOM #4#)
                                 (PROGN (LETT |el| (CAR #4#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |nm|
                                  (SPADCALL (SPADCALL |el| (QREFELT $ 34))
                                            |prime| (QREFELT $ 35))
                                  . #6#)
                            (LETT |dm|
                                  (SPADCALL (SPADCALL |el| (QREFELT $ 36))
                                            |prime| (QREFELT $ 35))
                                  . #6#)
                            (EXIT
                             (COND
                              ((EQL |dm| 0)
                               (PROGN
                                (LETT #1# (CONS 1 "failed") . #6#)
                                (GO #7=#:G765)))
                              ('T
                               (SEQ (LETT |dms| |dm| . #6#)
                                    (LETT |nlc|
                                          (QSMULMOD32 |nm|
                                                      (SPADCALL |dms| |prime|
                                                                (QREFELT $ 38))
                                                      |prime|)
                                          . #6#)
                                    (EXIT (SETELT_U32 |pa| |j| |nlc|)))))))
                           (LETT |j|
                                 (PROG1 (|inc_SI| |j|)
                                   (LETT #4# (CDR #4#) . #6#))
                                 . #6#)
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (LETT |resl| (CONS |pa| |resl|) . #6#)))
                     (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #7# (EXIT #1#)))) 

(SDEFUN |MODHP;LLFPI_to_LPA;LILLIU;5|
        ((|llfi| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|n| |Integer|) (|vars| |List| (|Symbol|)) (|pts| |List| (|Integer|))
         (|prime| |Integer|) ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPROG
         ((|resl| (|List| (|U32Vector|))) (|nlc| (|Integer|))
          (|dms| (|SingleInteger|)) (#1=#:G780 NIL) (|dm| #2=(|Integer|))
          (|nm| #2#) (#3=#:G782 NIL) (|j| NIL) (#4=#:G783 NIL) (|el| NIL)
          (|pa| (|U32Vector|)) (#5=#:G781 NIL) (|lfi| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL . #6=(|MODHP;LLFPI_to_LPA;LILLIU;5|))
                (SEQ (LETT |lfi| NIL . #6#) (LETT #5# |llfi| . #6#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |lfi| (CAR #5#) . #6#) NIL))
                       (GO G191)))
                     (SEQ (LETT |pa| (GETREFV_U32 |n| 0) . #6#)
                          (SEQ (LETT |el| NIL . #6#) (LETT #4# |lfi| . #6#)
                               (LETT |j| 0 . #6#) (LETT #3# (- |n| 1) . #6#)
                               G190
                               (COND
                                ((OR (|greater_SI| |j| #3#) (ATOM #4#)
                                     (PROGN (LETT |el| (CAR #4#) . #6#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |nm|
                                      (SPADCALL (SPADCALL |el| (QREFELT $ 43))
                                                |vars| |pts| |prime|
                                                (QREFELT $ 26))
                                      . #6#)
                                (LETT |dm|
                                      (SPADCALL (SPADCALL |el| (QREFELT $ 44))
                                                |vars| |pts| |prime|
                                                (QREFELT $ 26))
                                      . #6#)
                                (EXIT
                                 (COND
                                  ((EQL |dm| 0)
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #6#)
                                    (GO #7=#:G779)))
                                  ('T
                                   (SEQ (LETT |dms| |dm| . #6#)
                                        (LETT |nlc|
                                              (QSMULMOD32 |nm|
                                                          (SPADCALL |dms|
                                                                    |prime|
                                                                    (QREFELT $
                                                                             38))
                                                          |prime|)
                                              . #6#)
                                        (EXIT (SETELT_U32 |pa| |j| |nlc|)))))))
                               (LETT |j|
                                     (PROG1 (|inc_SI| |j|)
                                       (LETT #4# (CDR #4#) . #6#))
                                     . #6#)
                               (GO G190) G191 (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |pa| |resl|) . #6#)))
                     (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #7# (EXIT #1#)))) 

(SDEFUN |MODHP;PPFtoPA|
        ((|pfi| |SparseUnivariatePolynomial| (|Integer|))
         (|sigma| |NonNegativeInteger|) (|psi| |SingleInteger|)
         ($ |Union| (|U32Vector|) "failed"))
        (SPROG
         ((|nc| (|Integer|)) (|nlcq| (|Integer|)) (|m| (|NonNegativeInteger|))
          (|prime| (|Integer|)) (|pa| (|U32Vector|)))
         (SEQ (LETT |pa| (GETREFV_U32 |sigma| 0) . #1=(|MODHP;PPFtoPA|))
              (LETT |prime| |psi| . #1#)
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |pfi| (QREFELT $ 47)))) (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |pfi| (QREFELT $ 48)) . #1#)
                        (COND
                         ((< |m| |sigma|)
                          (SEQ
                           (LETT |nlcq| (SPADCALL |pfi| (QREFELT $ 49)) . #1#)
                           (LETT |nc| (SPADCALL |nlcq| |prime| (QREFELT $ 35))
                                 . #1#)
                           (EXIT (SETELT_U32 |pa| |m| |nc|)))))
                        (EXIT
                         (LETT |pfi| (SPADCALL |pfi| (QREFELT $ 50)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 |pa|))))) 

(SDEFUN |MODHP;LPPFtoVPA|
        ((|lpi| |List| (|SparseUnivariatePolynomial| (|Integer|)))
         (|sigma| |NonNegativeInteger|) (|psi| |SingleInteger|)
         ($ |Union| (|Vector| (|U32Vector|)) "failed"))
        (SPROG
         ((#1=#:G800 NIL) (|vpp| (|Union| (|U32Vector|) "failed"))
          (#2=#:G801 NIL) (|i| NIL) (#3=#:G802 NIL) (|p| NIL)
          (|vpa| (|Vector| (|U32Vector|))) (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (LENGTH |lpi|) . #4=(|MODHP;LPPFtoVPA|))
                (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #4#)
                (SEQ (LETT |p| NIL . #4#) (LETT #3# |lpi| . #4#)
                     (LETT |i| 1 . #4#) (LETT #2# |m| . #4#) G190
                     (COND
                      ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                           (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |vpp| (|MODHP;PPFtoPA| |p| |sigma| |psi| $) . #4#)
                      (EXIT
                       (COND
                        ((QEQCAR |vpp| 1)
                         (PROGN
                          (LETT #1# (CONS 1 "failed") . #4#)
                          (GO #5=#:G799)))
                        ('T
                         (SPADCALL |vpa| |i| (QCDR |vpp|) (QREFELT $ 14))))))
                     (LETT |i|
                           (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #4#))
                           . #4#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |vpa|))))
          #5# (EXIT #1#)))) 

(SDEFUN |MODHP;intpoly_to_PFI|
        ((|p| |SparseUnivariatePolynomial| (|Integer|))
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (ELT $ 51) |p| (QREFELT $ 55))) 

(SDEFUN |MODHP;check_sol1a;VLM3IUv;9|
        ((|nres| |Vector| (|U32Vector|)) (|gv0| |List| (|U32Vector|))
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|sigma| |Integer|) (|qval| |Integer|) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((#1=#:G808 NIL) (|i| NIL) (|res| (|U32Vector|))
          (|gvp| (|Vector| (|U32Vector|))) (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |nres|) . #2=(|MODHP;check_sol1a;VLM3IUv;9|))
              (LETT |gvp| (SPADCALL |gv0| |p| |qval| |gen|) . #2#)
              (LETT |res| (GETREFV_U32 |sigma| 0) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# |m| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (SPADCALL |gvp| |i| (QREFELT $ 56))
                               (SPADCALL |nres| |i| (QREFELT $ 56)) |res|
                               (- |sigma| 1) |p| (QREFELT $ 59))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;HP_solve_I;LLSNniMMU;10|
        ((|list| |List| (|List| (|Fraction| (|Integer|))))
         (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| (|Integer|))))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
          (|Boolean|)))
        (SPROG
         ((#4=#:G907 NIL) (#5=#:G920 NIL) (|l| NIL) (#6=#:G919 NIL) (|i| NIL)
          (|mress| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#7=#:G882 NIL) (|ii| (|Integer|)) (#8=#:G905 NIL)
          (|sol_ok| #9=(|Boolean|)) (|sol_okp| (|Union| #1# #2# #3#))
          (|k| (|Integer|)) (|s| (|SparseUnivariatePolynomial| (|Integer|)))
          (#10=#:G918 NIL) (|mm| (|Integer|)) (#11=#:G917 NIL)
          (|j| (|Integer|))
          (|resvi| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
          (#12=#:G916 NIL)
          (|resv|
           (|Vector| (|Vector| (|SparseUnivariatePolynomial| (|Integer|)))))
          (#13=#:G869 NIL) (|ppr| (|PrimitiveArray| (|Integer|)))
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (|empty_offsets| #9#) (#14=#:G915 NIL)
          (|offsets| (|Vector| (|Integer|))) (#15=#:G861 NIL) (#16=#:G914 NIL)
          (|cp| (|U32Vector|)) (#17=#:G913 NIL) (#18=#:G912 NIL)
          (|rv| #19=(|U32Vector|)) (#20=#:G851 NIL)
          (|rstate| (|VectorIntegerReconstructor|))
          (|oldciv| #21=(|Vector| (|Integer|)))
          (|oldva| #22=(|Vector| (|Integer|))) (|nsols| (|Integer|))
          (#23=#:G906 NIL) (|is_bad| #9#) (|all_bad| (|Boolean|))
          (#24=#:G911 NIL) (|civ| #21#) (|va| #22#)
          (|bm| #25=(|TwoDimensionalArray| (|U32Vector|)))
          (|rblr|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|blr|
           (|Union|
            (|Record| (|:| |basis| #25#) (|:| |defects| #22#)
                      (|:| |cinds| #21#))
            "no_solution"))
          (|gv2| (|Vector| (|U32Vector|))) (|gv0| (|List| (|U32Vector|)))
          (|gv0p| (|Union| (|List| (|U32Vector|)) "failed"))
          (|psi| (|SingleInteger|)) (|nprimes| (|Integer|)) (|ok| #9#)
          (|lp| (|List| (|Integer|))) (|prime| (|Integer|))
          (|maxd| (|Integer|)) (|vi| (|Vector| (|List| (|Integer|))))
          (|pts| (|U32Vector|)) (#26=#:G904 NIL) (#27=#:G910 NIL) (|pts0| #19#)
          (|ve| (|Vector| (|Integer|))) (#28=#:G909 NIL) (|d| NIL)
          (#29=#:G908 NIL) (|degs_sum| (|NonNegativeInteger|))
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #30=(|MODHP;HP_solve_I;LLSNniMMU;10|))
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
                  (EXIT (CONS 1 'T))))
                (LETT |m| (LENGTH |degs|) . #30#)
                (LETT |degs_sum|
                      (+ (SPADCALL (ELT $ 63) |degs| (QREFELT $ 65)) |m|)
                      . #30#)
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #29# NIL . #30#)
                        (SEQ (LETT |d| NIL . #30#) (LETT #28# |degs| . #30#)
                             G190
                             (COND
                              ((OR (ATOM #28#)
                                   (PROGN (LETT |d| (CAR #28#) . #30#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #29# (CONS |d| #29#) . #30#)))
                             (LETT #28# (CDR #28#) . #30#) (GO G190) G191
                             (EXIT (NREVERSE #29#))))
                       (QREFELT $ 67))
                      . #30#)
                (LETT |pts|
                      (COND ((EQUAL |kind| '|diffHP|) (GETREFV_U32 0 0))
                            ('T
                             (SEQ
                              (EXIT
                               (COND
                                ((EQUAL |kind| '|shiftHP|)
                                 (PROGN
                                  (LETT #26#
                                        (SEQ
                                         (LETT |pts0| (GETREFV_U32 |sigma| 0)
                                               . #30#)
                                         (SEQ (LETT |i| 0 . #30#)
                                              (LETT #27# (- |sigma| 1) . #30#)
                                              G190
                                              (COND
                                               ((|greater_SI| |i| #27#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (SETELT_U32 |pts0| |i| |i|)))
                                              (LETT |i| (|inc_SI| |i|) . #30#)
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT |pts0|))
                                        . #30#)
                                  (GO #31=#:G828)))))
                              #31# (EXIT #26#))))
                      . #30#)
                (LETT |vi| (MAKEARR1 |m| NIL) . #30#) (LETT |nsols| -1 . #30#)
                (LETT |maxd| -1 . #30#) (LETT |nprimes| 0 . #30#)
                (LETT |nsols| (+ |m| 1) . #30#)
                (LETT |empty_offsets| 'T . #30#)
                (SEQ G190 NIL
                     (SEQ (LETT |ok| NIL . #30#)
                          (SEQ (LETT |k| 1 . #30#) G190
                               (COND
                                ((OR (|greater_SI| |k| 100) (NULL (NULL |ok|)))
                                 (GO G191)))
                               (SEQ
                                (LETT |prime|
                                      (SPADCALL (+ (RANDOM 2000000) 2000000)
                                                (QREFELT $ 70))
                                      . #30#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |prime| |lp| (QREFELT $ 71))
                                   "iterate")
                                  ('T
                                   (SEQ (LETT |lp| (CONS |prime| |lp|) . #30#)
                                        (EXIT (LETT |ok| 'T . #30#)))))))
                               (LETT |k| (|inc_SI| |k|) . #30#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            (|ok|
                             (SEQ (LETT |nprimes| (+ |nprimes| 1) . #30#)
                                  (LETT |psi| (SPADCALL |prime| (QREFELT $ 72))
                                        . #30#)
                                  (LETT |gv0p|
                                        (SPADCALL |list| 0 |psi|
                                                  (QREFELT $ 41))
                                        . #30#)
                                  (EXIT
                                   (COND ((QEQCAR |gv0p| 1) "iterate")
                                         ('T
                                          (SEQ
                                           (LETT |gv0| (QCDR |gv0p|) . #30#)
                                           (LETT |gv2|
                                                 (SPADCALL |gv0| |prime| 1
                                                           |gen|)
                                                 . #30#)
                                           (LETT |blr|
                                                 (SPADCALL |gv2| |ve| |sigma|
                                                           |pts| |prime| |kind|
                                                           (QREFELT $ 77))
                                                 . #30#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |blr| 1)
                                              (PROGN
                                               (LETT #4# (CONS 1 NIL) . #30#)
                                               (GO #32=#:G903)))
                                             ('T
                                              (SEQ
                                               (LETT |rblr| (QCDR |blr|)
                                                     . #30#)
                                               (LETT |bm| (QVELT |rblr| 0)
                                                     . #30#)
                                               (LETT |va| (QVELT |rblr| 1)
                                                     . #30#)
                                               (LETT |civ| (QVELT |rblr| 2)
                                                     . #30#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL (QVSIZE |va|)
                                                            |nsols|
                                                            (QREFELT $ 33))
                                                  "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |is_bad| NIL . #30#)
                                                   (LETT |all_bad|
                                                         (< (QVSIZE |va|)
                                                            |nsols|)
                                                         . #30#)
                                                   (COND
                                                    ((EQL (QVSIZE |va|)
                                                          |nsols|)
                                                     (SEQ
                                                      (EXIT
                                                       (SEQ (LETT |i| 1 . #30#)
                                                            (LETT #24# |nsols|
                                                                  . #30#)
                                                            G190
                                                            (COND
                                                             ((|greater_SI| |i|
                                                                            #24#)
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (COND
                                                               ((<
                                                                 (SPADCALL |va|
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            78))
                                                                 (SPADCALL
                                                                  |oldva| |i|
                                                                  (QREFELT $
                                                                           78)))
                                                                (SEQ
                                                                 (LETT
                                                                  |all_bad| 'T
                                                                  . #30#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #23#
                                                                         |$NoValue|
                                                                         . #30#)
                                                                   (GO
                                                                    #33=#:G848)))))
                                                               ((SPADCALL
                                                                 (SPADCALL |va|
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            78))
                                                                 (SPADCALL
                                                                  |oldva| |i|
                                                                  (QREFELT $
                                                                           78))
                                                                 (QREFELT $
                                                                          33))
                                                                (SEQ
                                                                 (LETT |is_bad|
                                                                       'T
                                                                       . #30#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #23#
                                                                         |$NoValue|
                                                                         . #30#)
                                                                   (GO
                                                                    #33#)))))
                                                               ((<
                                                                 (SPADCALL
                                                                  |civ| |i|
                                                                  (QREFELT $
                                                                           78))
                                                                 (SPADCALL
                                                                  |oldciv| |i|
                                                                  (QREFELT $
                                                                           78)))
                                                                (SEQ
                                                                 (LETT
                                                                  |all_bad| 'T
                                                                  . #30#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #23#
                                                                         |$NoValue|
                                                                         . #30#)
                                                                   (GO
                                                                    #33#)))))
                                                               ((SPADCALL
                                                                 (SPADCALL
                                                                  |civ| |i|
                                                                  (QREFELT $
                                                                           78))
                                                                 (SPADCALL
                                                                  |oldciv| |i|
                                                                  (QREFELT $
                                                                           78))
                                                                 (QREFELT $
                                                                          33))
                                                                (SEQ
                                                                 (LETT |is_bad|
                                                                       'T
                                                                       . #30#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #23#
                                                                         |$NoValue|
                                                                         . #30#)
                                                                   (GO
                                                                    #33#))))))))
                                                            (LETT |i|
                                                                  (|inc_SI|
                                                                   |i|)
                                                                  . #30#)
                                                            (GO G190) G191
                                                            (EXIT NIL)))
                                                      #33# (EXIT #23#))))
                                                   (EXIT
                                                    (COND (|is_bad| "iterate")
                                                          ('T
                                                           (SEQ
                                                            (COND
                                                             (|all_bad|
                                                              (SEQ
                                                               (LETT |nsols|
                                                                     (QVSIZE
                                                                      |va|)
                                                                     . #30#)
                                                               (LETT |oldva|
                                                                     |va|
                                                                     . #30#)
                                                               (LETT |oldciv|
                                                                     |civ|
                                                                     . #30#)
                                                               (LETT |rstate|
                                                                     (SPADCALL
                                                                      (*
                                                                       |nsols|
                                                                       |degs_sum|)
                                                                      (QREFELT
                                                                       $ 80))
                                                                     . #30#)
                                                               (LETT |rv|
                                                                     (GETREFV_U32
                                                                      (SPADCALL
                                                                       (PROG1
                                                                           (LETT
                                                                            #20#
                                                                            |nsols|
                                                                            . #30#)
                                                                         (|check_subtype2|
                                                                          (>
                                                                           #20#
                                                                           0)
                                                                          '(|PositiveInteger|)
                                                                          '(|Integer|)
                                                                          #20#))
                                                                       |degs_sum|
                                                                       (QREFELT
                                                                        $ 82))
                                                                      0)
                                                                     . #30#)
                                                               (EXIT
                                                                (LETT
                                                                 |empty_offsets|
                                                                 'T . #30#)))))
                                                            (LETT |k| 0 . #30#)
                                                            (COND
                                                             ((EQL
                                                               (SPADCALL
                                                                |nprimes| 100
                                                                (QREFELT $ 35))
                                                               0)
                                                              (SEQ
                                                               (SPADCALL
                                                                "number of primes"
                                                                (QREFELT $ 85))
                                                               (EXIT
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |nprimes|
                                                                  (QREFELT $
                                                                           86))
                                                                 (QREFELT $
                                                                          85))))))
                                                            (SEQ
                                                             (LETT |i| 1
                                                                   . #30#)
                                                             (LETT #18# |nsols|
                                                                   . #30#)
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |i| #18#)
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (SEQ
                                                                (LETT |j| 1
                                                                      . #30#)
                                                                (LETT #17# |m|
                                                                      . #30#)
                                                                G190
                                                                (COND
                                                                 ((|greater_SI|
                                                                   |j| #17#)
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (LETT |mm|
                                                                       (SPADCALL
                                                                        |ve|
                                                                        |j|
                                                                        (QREFELT
                                                                         $ 78))
                                                                       . #30#)
                                                                 (LETT |cp|
                                                                       (SPADCALL
                                                                        |bm|
                                                                        |i| |j|
                                                                        (QREFELT
                                                                         $ 88))
                                                                       . #30#)
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT |l| 0
                                                                         . #30#)
                                                                   (LETT #16#
                                                                         |mm|
                                                                         . #30#)
                                                                   G190
                                                                   (COND
                                                                    ((|greater_SI|
                                                                      |l| #16#)
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (SETELT_U32
                                                                     |rv| |k|
                                                                     (ELT_U32
                                                                      |cp|
                                                                      |l|))
                                                                    (EXIT
                                                                     (LETT |k|
                                                                           (+
                                                                            |k|
                                                                            1)
                                                                           . #30#)))
                                                                   (LETT |l|
                                                                         (|inc_SI|
                                                                          |l|)
                                                                         . #30#)
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT
                                                                    NIL))))
                                                                (LETT |j|
                                                                      (|inc_SI|
                                                                       |j|)
                                                                      . #30#)
                                                                (GO G190) G191
                                                                (EXIT NIL))))
                                                             (LETT |i|
                                                                   (|inc_SI|
                                                                    |i|)
                                                                   . #30#)
                                                             (GO G190) G191
                                                             (EXIT NIL))
                                                            (SPADCALL |rv|
                                                                      |prime|
                                                                      |rstate|
                                                                      (QREFELT
                                                                       $ 89))
                                                            (COND
                                                             (|empty_offsets|
                                                              (SEQ
                                                               (LETT |offsets|
                                                                     (MAKEARR1
                                                                      (PROG1
                                                                          (LETT
                                                                           #15#
                                                                           |nsols|
                                                                           . #30#)
                                                                        (|check_subtype2|
                                                                         (>=
                                                                          #15#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         '(|Integer|)
                                                                         #15#))
                                                                      0)
                                                                     . #30#)
                                                               (LETT |j| 0
                                                                     . #30#)
                                                               (SEQ
                                                                (LETT |i| 1
                                                                      . #30#)
                                                                (LETT #14#
                                                                      |nsols|
                                                                      . #30#)
                                                                G190
                                                                (COND
                                                                 ((|greater_SI|
                                                                   |i| #14#)
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (SPADCALL
                                                                  |offsets| |i|
                                                                  |j|
                                                                  (QREFELT $
                                                                           90))
                                                                 (EXIT
                                                                  (LETT |j|
                                                                        (+ |j|
                                                                           |degs_sum|)
                                                                        . #30#)))
                                                                (LETT |i|
                                                                      (|inc_SI|
                                                                       |i|)
                                                                      . #30#)
                                                                (GO G190) G191
                                                                (EXIT NIL))
                                                               (EXIT
                                                                (LETT
                                                                 |empty_offsets|
                                                                 NIL
                                                                 . #30#)))))
                                                            (LETT |pp|
                                                                  (SPADCALL
                                                                   |rstate|
                                                                   |offsets|
                                                                   (QREFELT $
                                                                            92))
                                                                  . #30#)
                                                            (EXIT
                                                             (COND
                                                              ((QEQCAR |pp| 1)
                                                               "iterate")
                                                              ('T
                                                               (SEQ
                                                                (LETT |ppr|
                                                                      (QCDR
                                                                       |pp|)
                                                                      . #30#)
                                                                (LETT |k| 0
                                                                      . #30#)
                                                                (LETT |resv|
                                                                      (MAKEARR1
                                                                       (PROG1
                                                                           (LETT
                                                                            #13#
                                                                            |nsols|
                                                                            . #30#)
                                                                         (|check_subtype2|
                                                                          (>=
                                                                           #13#
                                                                           0)
                                                                          '(|NonNegativeInteger|)
                                                                          '(|Integer|)
                                                                          #13#))
                                                                       (MAKE-ARRAY
                                                                        0))
                                                                      . #30#)
                                                                (LETT |ii| 1
                                                                      . #30#)
                                                                (LETT |sol_ok|
                                                                      'T
                                                                      . #30#)
                                                                (SEQ
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT |i| 1
                                                                         . #30#)
                                                                   (LETT #12#
                                                                         |nsols|
                                                                         . #30#)
                                                                   G190
                                                                   (COND
                                                                    ((|greater_SI|
                                                                      |i| #12#)
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (LETT
                                                                     |resvi|
                                                                     (MAKEARR1
                                                                      |m|
                                                                      (|spadConstant|
                                                                       $ 93))
                                                                     . #30#)
                                                                    (SEQ
                                                                     (LETT |j|
                                                                           1
                                                                           . #30#)
                                                                     (LETT #11#
                                                                           |m|
                                                                           . #30#)
                                                                     G190
                                                                     (COND
                                                                      ((|greater_SI|
                                                                        |j|
                                                                        #11#)
                                                                       (GO
                                                                        G191)))
                                                                     (SEQ
                                                                      (LETT
                                                                       |mm|
                                                                       (SPADCALL
                                                                        |ve|
                                                                        |j|
                                                                        (QREFELT
                                                                         $ 78))
                                                                       . #30#)
                                                                      (LETT |s|
                                                                            (|spadConstant|
                                                                             $
                                                                             93)
                                                                            . #30#)
                                                                      (SEQ
                                                                       (LETT
                                                                        |l| 0
                                                                        . #30#)
                                                                       (LETT
                                                                        #10#
                                                                        |mm|
                                                                        . #30#)
                                                                       G190
                                                                       (COND
                                                                        ((|greater_SI|
                                                                          |l|
                                                                          #10#)
                                                                         (GO
                                                                          G191)))
                                                                       (SEQ
                                                                        (LETT
                                                                         |s|
                                                                         (SPADCALL
                                                                          |s|
                                                                          (SPADCALL
                                                                           (QAREF1
                                                                            |ppr|
                                                                            |k|)
                                                                           |l|
                                                                           (QREFELT
                                                                            $
                                                                            94))
                                                                          (QREFELT
                                                                           $
                                                                           95))
                                                                         . #30#)
                                                                        (EXIT
                                                                         (LETT
                                                                          |k|
                                                                          (+
                                                                           |k|
                                                                           1)
                                                                          . #30#)))
                                                                       (LETT
                                                                        |l|
                                                                        (|inc_SI|
                                                                         |l|)
                                                                        . #30#)
                                                                       (GO
                                                                        G190)
                                                                       G191
                                                                       (EXIT
                                                                        NIL))
                                                                      (EXIT
                                                                       (SPADCALL
                                                                        |resvi|
                                                                        |j| |s|
                                                                        (QREFELT
                                                                         $
                                                                         96))))
                                                                     (LETT |j|
                                                                           (|inc_SI|
                                                                            |j|)
                                                                           . #30#)
                                                                     (GO G190)
                                                                     G191
                                                                     (EXIT
                                                                      NIL))
                                                                    (LETT
                                                                     |sol_okp|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |resvi|
                                                                       (QREFELT
                                                                        $ 98))
                                                                      |check|)
                                                                     . #30#)
                                                                    (EXIT
                                                                     (COND
                                                                      ((QEQCAR
                                                                        |sol_okp|
                                                                        1)
                                                                       "iterate")
                                                                      ((QEQCAR
                                                                        |sol_okp|
                                                                        2)
                                                                       (SEQ
                                                                        (LETT
                                                                         |sol_ok|
                                                                         NIL
                                                                         . #30#)
                                                                        (EXIT
                                                                         (PROGN
                                                                          (LETT
                                                                           #8#
                                                                           |$NoValue|
                                                                           . #30#)
                                                                          (GO
                                                                           #34=#:G881)))))
                                                                      ('T
                                                                       (SEQ
                                                                        (SPADCALL
                                                                         |resv|
                                                                         |ii|
                                                                         |resvi|
                                                                         (QREFELT
                                                                          $
                                                                          100))
                                                                        (EXIT
                                                                         (LETT
                                                                          |ii|
                                                                          (+
                                                                           |ii|
                                                                           1)
                                                                          . #30#)))))))
                                                                   (LETT |i|
                                                                         (|inc_SI|
                                                                          |i|)
                                                                         . #30#)
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL)))
                                                                 #34#
                                                                 (EXIT #8#))
                                                                (EXIT
                                                                 (COND
                                                                  (|sol_ok|
                                                                   (SEQ
                                                                    (LETT
                                                                     |mress|
                                                                     (MAKE_MATRIX1
                                                                      |m|
                                                                      (PROG1
                                                                          (LETT
                                                                           #7#
                                                                           (-
                                                                            |ii|
                                                                            1)
                                                                           . #30#)
                                                                        (|check_subtype2|
                                                                         (>=
                                                                          #7#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         '(|Integer|)
                                                                         #7#))
                                                                      (|spadConstant|
                                                                       $ 93))
                                                                     . #30#)
                                                                    (SEQ
                                                                     (LETT |i|
                                                                           1
                                                                           . #30#)
                                                                     (LETT #6#
                                                                           (-
                                                                            |ii|
                                                                            1)
                                                                           . #30#)
                                                                     G190
                                                                     (COND
                                                                      ((|greater_SI|
                                                                        |i|
                                                                        #6#)
                                                                       (GO
                                                                        G191)))
                                                                     (SEQ
                                                                      (EXIT
                                                                       (SEQ
                                                                        (LETT
                                                                         |l| 1
                                                                         . #30#)
                                                                        (LETT
                                                                         #5#
                                                                         |m|
                                                                         . #30#)
                                                                        G190
                                                                        (COND
                                                                         ((|greater_SI|
                                                                           |l|
                                                                           #5#)
                                                                          (GO
                                                                           G191)))
                                                                        (SEQ
                                                                         (EXIT
                                                                          (SPADCALL
                                                                           |mress|
                                                                           |l|
                                                                           |i|
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             |resv|
                                                                             |i|
                                                                             (QREFELT
                                                                              $
                                                                              101))
                                                                            |l|
                                                                            (QREFELT
                                                                             $
                                                                             9))
                                                                           (QREFELT
                                                                            $
                                                                            103))))
                                                                        (LETT
                                                                         |l|
                                                                         (|inc_SI|
                                                                          |l|)
                                                                         . #30#)
                                                                        (GO
                                                                         G190)
                                                                        G191
                                                                        (EXIT
                                                                         NIL))))
                                                                     (LETT |i|
                                                                           (|inc_SI|
                                                                            |i|)
                                                                           . #30#)
                                                                     (GO G190)
                                                                     G191
                                                                     (EXIT
                                                                      NIL))
                                                                    (EXIT
                                                                     (PROGN
                                                                      (LETT #4#
                                                                            (CONS
                                                                             0
                                                                             |mress|)
                                                                            . #30#)
                                                                      (GO
                                                                       #32#)))))))))))))))))))))))))))))
                            ('T (|error| "Run out of primes")))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (PROGN (LETT #4# (CONS 1 'T) . #30#) (GO #32#)))))
          #32# (EXIT #4#)))) 

(SDEFUN |MODHP;get_variables2|
        ((|llpi| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         ($ |List| (|Symbol|)))
        (SPROG
         ((|res| (|List| (|Symbol|))) (#1=#:G927 NIL) (|p| NIL) (#2=#:G926 NIL)
          (|lpi| NIL))
         (SEQ (LETT |res| NIL . #3=(|MODHP;get_variables2|))
              (SEQ (LETT |lpi| NIL . #3#) (LETT #2# |llpi| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |lpi| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL . #3#) (LETT #1# |lpi| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL
                                            (SPADCALL |p| (QREFELT $ 43))
                                            (QREFELT $ 108))
                                           (QREFELT $ 109))
                                 . #3#)
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL |p| (QREFELT $ 44))
                                             (QREFELT $ 108))
                                            (QREFELT $ 109))
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;unpack_poly;LSevPa2ISup;12|
        ((|vars| |List| (|Symbol|)) (|exps| |SortedExponentVector|)
         (|coeffs| |PrimitiveArray| (|Integer|)) (|lo| |Integer|)
         (|hi| |Integer|)
         ($ |SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (#1=#:G939 NIL) (|i| (|Integer|)) (|term| (|Polynomial| (|Integer|)))
          (|term1| (|Polynomial| (|Integer|))) (#2=#:G933 NIL) (#3=#:G943 NIL)
          (|k| NIL) (#4=#:G944 NIL) (|var| NIL) (|j| (|Integer|))
          (#5=#:G929 NIL) (|jj| (|Integer|)) (#6=#:G942 NIL) (|i0| NIL)
          (|nn| (|NonNegativeInteger|)) (|nvars| (|NonNegativeInteger|)))
         (SEQ
          (LETT |res| (|spadConstant| $ 110)
                . #7=(|MODHP;unpack_poly;LSevPa2ISup;12|))
          (LETT |nvars| (LENGTH |vars|) . #7#) (LETT |nn| (+ |nvars| 1) . #7#)
          (LETT |vars| (REVERSE |vars|) . #7#) (LETT |j| -1 . #7#)
          (LETT |i| (* |lo| |nn|) . #7#)
          (SEQ (LETT |i0| |lo| . #7#) (LETT #6# |hi| . #7#) G190
               (COND ((> |i0| #6#) (GO G191)))
               (SEQ (LETT |jj| (ELT_U32 |exps| |i|) . #7#)
                    (EXIT
                     (COND
                      ((< |jj| |j|)
                       (|error|
                        "Internal error: inconsistent exponent vector"))
                      ('T
                       (SEQ
                        (COND
                         ((SPADCALL |jj| |j| (QREFELT $ 33))
                          (SEQ
                           (COND
                            ((>= |j| 0)
                             (LETT |res|
                                   (SPADCALL |res|
                                             (SPADCALL |term|
                                                       (PROG1
                                                           (LETT #5# |j| . #7#)
                                                         (|check_subtype2|
                                                          (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #5#))
                                                       (QREFELT $ 111))
                                             (QREFELT $ 112))
                                   . #7#)))
                           (LETT |j| |jj| . #7#)
                           (EXIT (LETT |term| (|spadConstant| $ 113) . #7#)))))
                        (LETT |term1|
                              (SPADCALL (QAREF1 |coeffs| |i0|) (QREFELT $ 114))
                              . #7#)
                        (SEQ (LETT |var| NIL . #7#) (LETT #4# |vars| . #7#)
                             (LETT |k| 1 . #7#) (LETT #3# |nvars| . #7#) G190
                             (COND
                              ((OR (|greater_SI| |k| #3#) (ATOM #4#)
                                   (PROGN (LETT |var| (CAR #4#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |term1|
                                     (SPADCALL |term1|
                                               (SPADCALL (|spadConstant| $ 115)
                                                         |var|
                                                         (PROG1
                                                             (LETT #2#
                                                                   (ELT_U32
                                                                    |exps|
                                                                    (+ |i|
                                                                       |k|))
                                                                   . #7#)
                                                           (|check_subtype2|
                                                            (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#))
                                                         (QREFELT $ 116))
                                               (QREFELT $ 117))
                                     . #7#)))
                             (LETT |k|
                                   (PROG1 (|inc_SI| |k|)
                                     (LETT #4# (CDR #4#) . #7#))
                                   . #7#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |term| (SPADCALL |term1| |term| (QREFELT $ 118))
                              . #7#)
                        (EXIT (LETT |i| (+ |i| |nn|) . #7#)))))))
               (LETT |i0| (+ |i0| 1) . #7#) (GO G190) G191 (EXIT NIL))
          (COND
           ((>= |j| 0)
            (LETT |res|
                  (SPADCALL |res|
                            (SPADCALL |term|
                                      (PROG1 (LETT #1# |j| . #7#)
                                        (|check_subtype2| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #1#))
                                      (QREFELT $ 111))
                            (QREFELT $ 112))
                  . #7#)))
          (EXIT |res|)))) 

(SDEFUN |MODHP;intpoly_to_PFPI|
        ((|p| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|Polynomial| (|Integer|)))))
        (SPADCALL (ELT $ 122) |p| (QREFELT $ 126))) 

(SDEFUN |MODHP;PFPI_to_PFI|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|Polynomial| (|Integer|))))
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|iq| (|Fraction| (|Integer|)))
          (|q| (|Fraction| (|Polynomial| (|Integer|))))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |res| (|spadConstant| $ 68) . #1=(|MODHP;PFPI_to_PFI|))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |p| (QREFELT $ 127)))) (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |p| (QREFELT $ 128)) . #1#)
                        (LETT |q| (SPADCALL |p| (QREFELT $ 129)) . #1#)
                        (LETT |p| (SPADCALL |p| (QREFELT $ 130)) . #1#)
                        (LETT |iq| (SPADCALL |q| (QREFELT $ 131)) . #1#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |iq| |m| (QREFELT $ 132))
                                         |res| (QREFELT $ 133))
                               . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;PI_to_PPI|
        ((|p| |SparseUnivariatePolynomial| (|Integer|))
         ($ |SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|mq| (|Polynomial| (|Integer|))) (|q| (|Integer|))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |res| (|spadConstant| $ 110) . #1=(|MODHP;PI_to_PPI|))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |p| (QREFELT $ 47)))) (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |p| (QREFELT $ 48)) . #1#)
                        (LETT |q| (SPADCALL |p| (QREFELT $ 49)) . #1#)
                        (LETT |p| (SPADCALL |p| (QREFELT $ 50)) . #1#)
                        (LETT |mq| (SPADCALL |q| (QREFELT $ 114)) . #1#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |mq| |m| (QREFELT $ 111))
                                         |res| (QREFELT $ 112))
                               . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;LPI_to_LPPI|
        ((|lp| |List| (|SparseUnivariatePolynomial| (|Integer|)))
         ($ |List| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
        (SPROG ((#1=#:G959 NIL) (|p| NIL) (#2=#:G958 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MODHP;LPI_to_LPPI|))
                 (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|MODHP;PI_to_PPI| |p| $) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MODHP;trivial_poly_solve|
        ((|list| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
         ($ |Union|
          (|Matrix| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|Boolean|)))
        (SPROG
         ((#1=#:G989 NIL) (|j| NIL) (#2=#:G988 NIL) (|i| NIL)
          (|res|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|resi| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#3=#:G983 NIL)
          (|pres|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|nlist| (|List| (|List| (|Fraction| (|Integer|))))) (#4=#:G987 NIL)
          (|q| NIL) (#5=#:G986 NIL) (#6=#:G985 NIL) (|li| NIL) (#7=#:G984 NIL))
         (SEQ
          (EXIT
           (COND
            ((EQUAL |kind| '|qshiftHP|)
             (PROGN
              (LETT #3# (CONS 1 'T) . #8=(|MODHP;trivial_poly_solve|))
              (GO #9=#:G982)))
            (#10='T
             (SEQ
              (COND ((EQUAL |kind| '|qdiffHP|) (LETT |kind| '|diffHP| . #8#)))
              (LETT |nlist|
                    (PROGN
                     (LETT #7# NIL . #8#)
                     (SEQ (LETT |li| NIL . #8#) (LETT #6# |list| . #8#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |li| (CAR #6#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (PROGN
                                    (LETT #5# NIL . #8#)
                                    (SEQ (LETT |q| NIL . #8#)
                                         (LETT #4# |li| . #8#) G190
                                         (COND
                                          ((OR (ATOM #4#)
                                               (PROGN
                                                (LETT |q| (CAR #4#) . #8#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #5#
                                                 (CONS
                                                  (SPADCALL |q|
                                                            (QREFELT $ 131))
                                                  #5#)
                                                 . #8#)))
                                         (LETT #4# (CDR #4#) . #8#) (GO G190)
                                         G191 (EXIT (NREVERSE #5#))))
                                   #7#)
                                  . #8#)))
                          (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #8#)
              (LETT |pres|
                    (SPADCALL |nlist| |degs| |kind| |sigma| |gen|
                              (CONS #'|MODHP;trivial_poly_solve!0|
                                    (VECTOR |check| $))
                              (QREFELT $ 107))
                    . #8#)
              (EXIT
               (COND
                ((QEQCAR |pres| 1)
                 (PROGN (LETT #3# (CONS 1 (QCDR |pres|)) . #8#) (GO #9#)))
                (#10#
                 (SEQ (LETT |resi| (QCDR |pres|) . #8#)
                      (LETT |nr| (ANROWS |resi|) . #8#)
                      (LETT |nc| (ANCOLS |resi|) . #8#)
                      (LETT |res|
                            (MAKE_MATRIX1 |nr| |nc| (|spadConstant| $ 110))
                            . #8#)
                      (SEQ (LETT |i| 1 . #8#) (LETT #2# |nr| . #8#) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |j| 1 . #8#) (LETT #1# |nc| . #8#) G190
                                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |res| |i| |j|
                                              (|MODHP;PI_to_PPI|
                                               (SPADCALL |resi| |i| |j|
                                                         (QREFELT $ 135))
                                               $)
                                              (QREFELT $ 137))))
                                  (LETT |j| (|inc_SI| |j|) . #8#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (CONS 0 |res|))))))))))
          #9# (EXIT #3#)))) 

(SDEFUN |MODHP;trivial_poly_solve!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |check|)
          (LETT $ (QREFELT $$ 1) . #1=(|MODHP;trivial_poly_solve|))
          (LETT |check| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (|MODHP;LPI_to_LPPI| |x| $) |check|))))) 

(SDEFUN |MODHP;get_variables;L2SL;18|
        ((|list| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|kind| |Symbol|) (|qvar| |Symbol|) ($ |List| (|Symbol|)))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (SEQ
                (LETT |vars| (|MODHP;get_variables2| |list| $)
                      . #1=(|MODHP;get_variables;L2SL;18|))
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|)
                      (OR (EQUAL |kind| '|qshiftHP|) (EQUAL |kind| '|qmixed|)))
                  (LETT |vars|
                        (COND ((SPADCALL |qvar| |vars| (QREFELT $ 138)) |vars|)
                              ('T (CONS |qvar| |vars|)))
                        . #1#)))
                (EXIT (SPADCALL |vars| (QREFELT $ 139)))))) 

(SDEFUN |MODHP;HP_solve_P;LL2SNniMMU;19|
        ((|list| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|degs| |List| (|Integer|)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| #1=(|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
         ($ |Union|
          (|Matrix| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|Boolean|)))
        (SPROG
         ((#2=#:G1048 NIL) (#3=#:G1057 NIL) (|l| NIL) (#4=#:G1056 NIL)
          (|i| NIL)
          (|mress|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (#5=#:G1031 NIL) (|ii| (|Integer|)) (#6=#:G1047 NIL)
          (|ok| (|Boolean|)) (|sol_okp| #1#) (|hi| (|Integer|))
          (|ohi| #7=(|Integer|)) (|kk| (|Integer|)) (|lo| #7#) (#8=#:G1055 NIL)
          (|j| NIL)
          (|resvi|
           (|Vector|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (#9=#:G1054 NIL)
          (|resv|
           (|Vector|
            (|Vector|
             (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))))
          (|nsols| (|NonNegativeInteger|)) (|cc| (|NonNegativeInteger|))
          (|coeffs| #10=(|PrimitiveArray| (|Integer|)))
          (|exps| #11=(|SortedExponentVector|)) (|oc| (|NonNegativeInteger|))
          (|offsets| #12=(|Vector| (|Integer|)))
          (|ppr|
           (|Record| (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))
                     (|:| |rowlen| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|PrimitiveArray| (|Integer|)))))
          (|pp|
           (|Union|
            (|Record| (|:| |defects| (|Vector| (|Integer|)))
                      (|:| |cinds| (|Vector| (|Integer|)))
                      (|:| |rowlen| (|Integer|)) (|:| |offsetdata| #12#)
                      (|:| |expdata| #11#) (|:| |coeffdata| #10#))
            "no_solution"))
          (|gv0|
           (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|))))))
          (#13=#:G1053 NIL) (|li| NIL) (#14=#:G1052 NIL)
          (|vars| (|List| (|Symbol|))) (|pts| (|U32Vector|)) (#15=#:G1046 NIL)
          (#16=#:G1051 NIL) (|pts0| (|U32Vector|))
          (|ve| (|Vector| (|Integer|))) (#17=#:G1050 NIL) (|d| NIL)
          (#18=#:G1049 NIL) (|m| (|NonNegativeInteger|))
          (|lp| (|List| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #19=(|MODHP;HP_solve_P;LL2SNniMMU;19|))
                (LETT |m| (LENGTH |degs|) . #19#)
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #18# NIL . #19#)
                        (SEQ (LETT |d| NIL . #19#) (LETT #17# |degs| . #19#)
                             G190
                             (COND
                              ((OR (ATOM #17#)
                                   (PROGN (LETT |d| (CAR #17#) . #19#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #18# (CONS |d| #18#) . #19#)))
                             (LETT #17# (CDR #17#) . #19#) (GO G190) G191
                             (EXIT (NREVERSE #18#))))
                       (QREFELT $ 67))
                      . #19#)
                (LETT |pts|
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (EQUAL |kind| '|diffHP|)
                              (EQUAL |kind| '|qdiffHP|))
                          (GETREFV_U32 0 0))
                         ((OR (EQUAL |kind| '|shiftHP|)
                              (EQUAL |kind| '|qmixed|))
                          (SEQ (LETT |pts0| (GETREFV_U32 |sigma| 0) . #19#)
                               (SEQ (LETT |i| 0 . #19#)
                                    (LETT #16# (- |sigma| 1) . #19#) G190
                                    (COND ((|greater_SI| |i| #16#) (GO G191)))
                                    (SEQ (EXIT (SETELT_U32 |pts0| |i| |i|)))
                                    (LETT |i| (|inc_SI| |i|) . #19#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT |pts0|)))
                         ('T
                          (COND
                           ((EQUAL |kind| '|qshiftHP|)
                            (PROGN
                             (LETT #15# (GETREFV_U32 |sigma| 0) . #19#)
                             (GO #20=#:G1007)))))))
                       #20# (EXIT #15#))
                      . #19#)
                (LETT |vars| (SPADCALL |list| |kind| |qvar| (QREFELT $ 140))
                      . #19#)
                (EXIT
                 (COND
                  ((NULL |vars|)
                   (|MODHP;trivial_poly_solve| |list| |degs| |kind| |sigma|
                    |gen| |check| $))
                  ('T
                   (SEQ
                    (LETT |gv0|
                          (PROGN
                           (LETT #14# NIL . #19#)
                           (SEQ (LETT |li| NIL . #19#)
                                (LETT #13# |list| . #19#) G190
                                (COND
                                 ((OR (ATOM #13#)
                                      (PROGN
                                       (LETT |li| (CAR #13#) . #19#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #14#
                                        (CONS (SPADCALL |li| (QREFELT $ 144))
                                              #14#)
                                        . #19#)))
                                (LETT #13# (CDR #13#) . #19#) (GO G190) G191
                                (EXIT (NREVERSE #14#))))
                          . #19#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (LETT |pp|
                                 (SPADCALL |vars| |gv0| |ve| |sigma| |pts|
                                           |kind| |qvar| |gen| (QREFELT $ 148))
                                 . #19#)
                           (EXIT
                            (COND
                             ((QEQCAR |pp| 1)
                              (PROGN
                               (LETT #2# (CONS 1 NIL) . #19#)
                               (GO #21=#:G1045)))
                             ('T
                              (SEQ (LETT |ppr| (QCDR |pp|) . #19#)
                                   (LETT |offsets| (QVELT |ppr| 3) . #19#)
                                   (LETT |oc| (QVSIZE |offsets|) . #19#)
                                   (LETT |exps| (QVELT |ppr| 4) . #19#)
                                   (LETT |coeffs| (QVELT |ppr| 5) . #19#)
                                   (LETT |cc| (QVSIZE |coeffs|) . #19#)
                                   (LETT |nsols|
                                         (QUOTIENT2 (QVSIZE |offsets|) |m|)
                                         . #19#)
                                   (LETT |ok| 'T . #19#) (LETT |kk| 1 . #19#)
                                   (LETT |ohi|
                                         (SPADCALL |offsets| 1 (QREFELT $ 78))
                                         . #19#)
                                   (LETT |resv|
                                         (MAKEARR1 |nsols| (MAKE-ARRAY 0))
                                         . #19#)
                                   (LETT |ii| 1 . #19#)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |i| 1 . #19#)
                                          (LETT #9# |nsols| . #19#) G190
                                          (COND
                                           ((|greater_SI| |i| #9#) (GO G191)))
                                          (SEQ
                                           (LETT |resvi|
                                                 (MAKEARR1 |m|
                                                           (|spadConstant| $
                                                                           110))
                                                 . #19#)
                                           (SEQ (LETT |j| 1 . #19#)
                                                (LETT #8# |m| . #19#) G190
                                                (COND
                                                 ((|greater_SI| |j| #8#)
                                                  (GO G191)))
                                                (SEQ (LETT |lo| |ohi| . #19#)
                                                     (LETT |ohi|
                                                           (SEQ
                                                            (LETT |kk|
                                                                  (+ |kk| 1)
                                                                  . #19#)
                                                            (EXIT
                                                             (COND
                                                              ((SPADCALL |kk|
                                                                         |oc|
                                                                         (QREFELT
                                                                          $
                                                                          149))
                                                               (SPADCALL
                                                                |offsets| |kk|
                                                                (QREFELT $
                                                                         78)))
                                                              ('T |cc|))))
                                                           . #19#)
                                                     (LETT |hi| (- |ohi| 1)
                                                           . #19#)
                                                     (EXIT
                                                      (SPADCALL |resvi| |j|
                                                                (SPADCALL
                                                                 |vars| |exps|
                                                                 |coeffs| |lo|
                                                                 |hi|
                                                                 (QREFELT $
                                                                          121))
                                                                (QREFELT $
                                                                         150))))
                                                (LETT |j| (|inc_SI| |j|)
                                                      . #19#)
                                                (GO G190) G191 (EXIT NIL))
                                           (LETT |sol_okp|
                                                 (SPADCALL
                                                  (SPADCALL |resvi|
                                                            (QREFELT $ 152))
                                                  |check|)
                                                 . #19#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |sol_okp| 1) "iterate")
                                             ((QEQCAR |sol_okp| 2)
                                              (SEQ (LETT |ok| NIL . #19#)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #6# |$NoValue|
                                                           . #19#)
                                                     (GO #22=#:G1030)))))
                                             ('T
                                              (SEQ
                                               (SPADCALL |resv| |ii| |resvi|
                                                         (QREFELT $ 154))
                                               (EXIT
                                                (LETT |ii| (+ |ii| 1)
                                                      . #19#)))))))
                                          (LETT |i| (|inc_SI| |i|) . #19#)
                                          (GO G190) G191 (EXIT NIL)))
                                    #22# (EXIT #6#))
                                   (EXIT
                                    (COND
                                     (|ok|
                                      (SEQ
                                       (LETT |mress|
                                             (MAKE_MATRIX1 |m|
                                                           (PROG1
                                                               (LETT #5#
                                                                     (- |ii| 1)
                                                                     . #19#)
                                                             (|check_subtype2|
                                                              (>= #5# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #5#))
                                                           (|spadConstant| $
                                                                           110))
                                             . #19#)
                                       (SEQ (LETT |i| 1 . #19#)
                                            (LETT #4# (- |ii| 1) . #19#) G190
                                            (COND
                                             ((|greater_SI| |i| #4#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (SEQ (LETT |l| 1 . #19#)
                                                   (LETT #3# |m| . #19#) G190
                                                   (COND
                                                    ((|greater_SI| |l| #3#)
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (SPADCALL |mress| |l| |i|
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 |resv| |i|
                                                                 (QREFELT $
                                                                          155))
                                                                |l|
                                                                (QREFELT $ 29))
                                                               (QREFELT $
                                                                        137))))
                                                   (LETT |l| (|inc_SI| |l|)
                                                         . #19#)
                                                   (GO G190) G191 (EXIT NIL))))
                                            (LETT |i| (|inc_SI| |i|) . #19#)
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# (CONS 0 |mress|) . #19#)
                                         (GO #21#)))))
                                     ('T
                                      (SEQ
                                       (SPADCALL
                                        "check_sol_poly rejected solution"
                                        (QREFELT $ 85))
                                       (SPADCALL
                                        (SPADCALL |resvi| (QREFELT $ 156))
                                        (QREFELT $ 85))
                                       (EXIT (|error| "giving up")))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #21# (EXIT #2#)))) 

(SDEFUN |MODHP;HP_solve_M;LLSINniMMU;20|
        ((|list| |List| (|List| (|Integer|))) (|degs| |List| (|Integer|))
         (|kind| |Symbol|) (|prime| |Integer|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| #1=(|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| #2=(|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| (|Integer|))))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
          (|Boolean|)))
        (SPROG
         ((#3=#:G1090 NIL) (#4=#:G1100 NIL) (|l| NIL) (#5=#:G1099 NIL)
          (|i| NIL)
          (|mress| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#6=#:G1083 NIL) (|ii| (|Integer|)) (|sol_okp| #2#)
          (|s| (|SparseUnivariatePolynomial| (|Integer|))) (#7=#:G1098 NIL)
          (|bmij| (|U32Vector|)) (|mm| (|Integer|)) (#8=#:G1097 NIL) (|j| NIL)
          (|resvi| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
          (#9=#:G1096 NIL)
          (|resv|
           (|Vector| (|Vector| (|SparseUnivariatePolynomial| (|Integer|)))))
          (|nsols| (|NonNegativeInteger|)) (|va| #10=(|Vector| (|Integer|)))
          (|bm| #11=(|TwoDimensionalArray| (|U32Vector|)))
          (|rblr|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|blr|
           (|Union|
            (|Record| (|:| |basis| #11#) (|:| |defects| #10#)
                      (|:| |cinds| (|Vector| (|Integer|))))
            "no_solution"))
          (|gv| #1#) (|gv0| (|List| (|U32Vector|))) (#12=#:G1095 NIL)
          (|li| NIL) (#13=#:G1094 NIL) (|pts| (|U32Vector|)) (#14=#:G1089 NIL)
          (#15=#:G1093 NIL) (|pts0| (|U32Vector|))
          (|ve| (|Vector| (|Integer|))) (#16=#:G1092 NIL) (|d| NIL)
          (#17=#:G1091 NIL) (|m| (|NonNegativeInteger|))
          (|lp| (|List| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #18=(|MODHP;HP_solve_M;LLSINniMMU;20|))
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
                  (EXIT (CONS 1 'T))))
                (LETT |m| (LENGTH |degs|) . #18#)
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #17# NIL . #18#)
                        (SEQ (LETT |d| NIL . #18#) (LETT #16# |degs| . #18#)
                             G190
                             (COND
                              ((OR (ATOM #16#)
                                   (PROGN (LETT |d| (CAR #16#) . #18#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #17# (CONS |d| #17#) . #18#)))
                             (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                             (EXIT (NREVERSE #17#))))
                       (QREFELT $ 67))
                      . #18#)
                (LETT |pts|
                      (COND ((EQUAL |kind| '|diffHP|) (GETREFV_U32 0 0))
                            (#19='T
                             (SEQ
                              (EXIT
                               (COND
                                ((EQUAL |kind| '|shiftHP|)
                                 (PROGN
                                  (LETT #14#
                                        (SEQ
                                         (LETT |pts0| (GETREFV_U32 |sigma| 0)
                                               . #18#)
                                         (SEQ (LETT |i| 0 . #18#)
                                              (LETT #15# (- |sigma| 1) . #18#)
                                              G190
                                              (COND
                                               ((|greater_SI| |i| #15#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (SETELT_U32 |pts0| |i| |i|)))
                                              (LETT |i| (|inc_SI| |i|) . #18#)
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT |pts0|))
                                        . #18#)
                                  (GO #20=#:G1066)))))
                              #20# (EXIT #14#))))
                      . #18#)
                (LETT |gv0|
                      (PROGN
                       (LETT #13# NIL . #18#)
                       (SEQ (LETT |li| NIL . #18#) (LETT #12# |list| . #18#)
                            G190
                            (COND
                             ((OR (ATOM #12#)
                                  (PROGN (LETT |li| (CAR #12#) . #18#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #13#
                                    (CONS (SPADCALL |li| (QREFELT $ 160)) #13#)
                                    . #18#)))
                            (LETT #12# (CDR #12#) . #18#) (GO G190) G191
                            (EXIT (NREVERSE #13#))))
                      . #18#)
                (LETT |gv| (SPADCALL |gv0| |prime| 1 |gen|) . #18#)
                (LETT |blr|
                      (SPADCALL |gv| |ve| |sigma| |pts| |prime| |kind|
                                (QREFELT $ 77))
                      . #18#)
                (EXIT
                 (COND
                  ((QEQCAR |blr| 1)
                   (PROGN (LETT #3# (CONS 1 NIL) . #18#) (GO #21=#:G1088)))
                  (#19#
                   (SEQ (LETT |rblr| (QCDR |blr|) . #18#)
                        (LETT |bm| (QVELT |rblr| 0) . #18#)
                        (LETT |va| (QVELT |rblr| 1) . #18#)
                        (LETT |nsols| (QVSIZE |va|) . #18#)
                        (LETT |resv| (MAKEARR1 |nsols| (MAKE-ARRAY 0)) . #18#)
                        (LETT |ii| 1 . #18#)
                        (SEQ (LETT |i| 1 . #18#) (LETT #9# |nsols| . #18#) G190
                             (COND ((|greater_SI| |i| #9#) (GO G191)))
                             (SEQ
                              (LETT |resvi|
                                    (MAKEARR1 |m| (|spadConstant| $ 93))
                                    . #18#)
                              (SEQ (LETT |j| 1 . #18#) (LETT #8# |m| . #18#)
                                   G190
                                   (COND ((|greater_SI| |j| #8#) (GO G191)))
                                   (SEQ
                                    (LETT |mm|
                                          (SPADCALL |ve| |j| (QREFELT $ 78))
                                          . #18#)
                                    (LETT |bmij|
                                          (SPADCALL |bm| |i| |j|
                                                    (QREFELT $ 88))
                                          . #18#)
                                    (LETT |s| (|spadConstant| $ 93) . #18#)
                                    (SEQ (LETT |l| 0 . #18#)
                                         (LETT #7# |mm| . #18#) G190
                                         (COND
                                          ((|greater_SI| |l| #7#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |s|
                                                 (SPADCALL |s|
                                                           (SPADCALL
                                                            (ELT_U32 |bmij|
                                                                     |l|)
                                                            |l| (QREFELT $ 94))
                                                           (QREFELT $ 95))
                                                 . #18#)))
                                         (LETT |l| (|inc_SI| |l|) . #18#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (SPADCALL |resvi| |j| |s|
                                               (QREFELT $ 96))))
                                   (LETT |j| (|inc_SI| |j|) . #18#) (GO G190)
                                   G191 (EXIT NIL))
                              (LETT |sol_okp|
                                    (SPADCALL (SPADCALL |resvi| (QREFELT $ 98))
                                              |check|)
                                    . #18#)
                              (EXIT
                               (COND ((QEQCAR |sol_okp| 1) "iterate")
                                     ((QEQCAR |sol_okp| 2)
                                      (|error|
                                       "HP_solve_M: check should never return no_solution for finite fields"))
                                     ('T
                                      (SEQ
                                       (SPADCALL |resv| |ii| |resvi|
                                                 (QREFELT $ 100))
                                       (EXIT
                                        (LETT |ii| (+ |ii| 1) . #18#)))))))
                             (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |mress|
                              (MAKE_MATRIX1 |m|
                                            (PROG1 (LETT #6# (- |ii| 1) . #18#)
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))
                                            (|spadConstant| $ 93))
                              . #18#)
                        (SEQ (LETT |i| 1 . #18#) (LETT #5# (- |ii| 1) . #18#)
                             G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| 1 . #18#) (LETT #4# |m| . #18#)
                                    G190
                                    (COND ((|greater_SI| |l| #4#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |mress| |l| |i|
                                                (SPADCALL
                                                 (SPADCALL |resv| |i|
                                                           (QREFELT $ 101))
                                                 |l| (QREFELT $ 9))
                                                (QREFELT $ 103))))
                                    (LETT |l| (|inc_SI| |l|) . #18#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (PROGN
                          (LETT #3# (CONS 0 |mress|) . #18#)
                          (GO #21#)))))))))
          #21# (EXIT #3#)))) 

(SDEFUN |MODHP;HP_solve_A;LLSNniMMU;21|
        ((|list| |List| (|List| (|AlgebraicNumber|)))
         (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
         ($ |Union|
          (|Matrix| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHP;HP_solve_PA;LL2SNniMMU;22|
        ((|list| |List|
          (|List| (|Fraction| (|Polynomial| (|AlgebraicNumber|)))))
         (|degs| |List| (|Integer|)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List|
           (|SparseUnivariatePolynomial| (|Polynomial| (|AlgebraicNumber|)))))
         ($ |Union|
          (|Matrix|
           (|SparseUnivariatePolynomial| (|Polynomial| (|AlgebraicNumber|))))
          (|Boolean|)))
        (CONS 1 'T)) 

(DECLAIM (NOTINLINE |ModularHermitePade;|)) 

(DEFUN |ModularHermitePade| ()
  (SPROG NIL
         (PROG (#1=#:G1119)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ModularHermitePade|)
                    . #2=(|ModularHermitePade|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularHermitePade|
                             (LIST
                              (CONS NIL (CONS 1 (|ModularHermitePade;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ModularHermitePade|)))))))))) 

(DEFUN |ModularHermitePade;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularHermitePade|) . #1=(|ModularHermitePade|))
          (LETT $ (GETREFV 171) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ModularHermitePade| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ModularHermitePade| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 7)
              (|Integer|) (|Vector| 6) (0 . |elt|) (|U32Vector|)
              (|U32VectorPolynomialOperations|) (6 . |to_mod_pa|) (|Vector| 10)
              (12 . |setelt!|) |MODHP;VSUPI_to_VPA;VIV;1|
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 21)
              (19 . |degree|) (|Boolean|) (24 . |zero?|) (|Polynomial| 7)
              (29 . |leadingCoefficient|) (|List| 75) (|List| 7)
              (|PolynomialEvaluationUtilities|) (34 . |modpeval|)
              (42 . |reductum|) (|Vector| 17) (47 . |elt|)
              |MODHP;VSUPPI_to_VPA;VLLIV;3| (|Fraction| 7) (53 . |Zero|)
              (57 . >) (63 . |numer|) (68 . |positiveRemainder|) (74 . |denom|)
              (|SingleInteger|) (79 . |invmod|) (|Union| 60 '"failed")
              (|List| (|List| 31)) |MODHP;LLFI_to_LPA;L2IU;4| (|Fraction| 21)
              (85 . |numer|) (90 . |denom|) (|List| 142)
              |MODHP;LLFPI_to_LPA;LILLIU;5| (95 . |zero?|) (100 . |degree|)
              (105 . |leadingCoefficient|) (110 . |reductum|) (115 . |coerce|)
              (|SparseUnivariatePolynomial| 31) (|Mapping| 31 7)
              (|SparseUnivariatePolynomialFunctions2| 7 31) (120 . |map|)
              (126 . |elt|) (132 . |One|) (|Void|) (136 . |truncated_mul_add|)
              (|List| 10) (|Mapping| 13 60 7 7) |MODHP;check_sol1a;VLM3IUv;9|
              (145 . +) (|Mapping| 7 7 7) (151 . |reduce|) (|Vector| 7)
              (157 . |vector|) (162 . |Zero|) (|IntegerPrimesPackage| 7)
              (166 . |nextPrime|) (171 . |member?|) (177 . |coerce|)
              (|Record| (|:| |basis| 87) (|:| |defects| 66) (|:| |cinds| 66))
              (|Union| 73 '"no_solution") (|Symbol|)
              (|InnerModularHermitePade|) (182 . |do_modular_solve|)
              (192 . |elt|) (|VectorIntegerReconstructor|) (198 . |empty|)
              (|PositiveInteger|) (203 . *) (|OutputForm|) (|PrintPackage|)
              (209 . |print|) (214 . |coerce|) (|TwoDimensionalArray| 10)
              (219 . |elt|) (226 . |chinese_update|) (233 . |setelt!|)
              (|Union| 120 '"failed") (240 . |reconstruct|) (246 . |Zero|)
              (250 . |monomial|) (256 . +) (262 . |setelt!|) (|List| 6)
              (269 . |entries|) (|Vector| 8) (274 . |setelt!|) (281 . |elt|)
              (|Matrix| 6) (287 . |setelt!|) (|Union| 102 19)
              (|Union| '"good" '"reject" '"no_solution") (|Mapping| 105 97)
              |MODHP;HP_solve_I;LLSNniMMU;10| (295 . |variables|)
              (300 . |setUnion|) (306 . |Zero|) (310 . |monomial|) (316 . +)
              (322 . |Zero|) (326 . |coerce|) (331 . |One|) (335 . |monomial|)
              (342 . *) (348 . +) (|SortedExponentVector|) (|PrimitiveArray| 7)
              |MODHP;unpack_poly;LSevPa2ISup;12| (354 . |coerce|)
              (|SparseUnivariatePolynomial| 42) (|Mapping| 42 21)
              (|SparseUnivariatePolynomialFunctions2| 21 42) (359 . |map|)
              (365 . |zero?|) (370 . |degree|) (375 . |leadingCoefficient|)
              (380 . |reductum|) (385 . |retract|) (390 . |monomial|) (396 . +)
              (402 . |Zero|) (406 . |elt|) (|Matrix| 17) (413 . |setelt!|)
              (421 . |member?|) (427 . |sort|) |MODHP;get_variables;L2SL;18|
              (432 . |One|) (|List| 42) (|PrimitiveArray| 42)
              (436 . |construct|)
              (|Record| (|:| |defects| 66) (|:| |cinds| 66) (|:| |rowlen| 7)
                        (|:| |offsetdata| 66) (|:| |expdata| 119)
                        (|:| |coeffdata| 120))
              (|Union| 145 '"no_solution") (|List| 143)
              (441 . |do_poly_integer|) (453 . <=) (459 . |setelt!|)
              (|List| 17) (466 . |entries|) (|Vector| 28) (471 . |setelt!|)
              (478 . |elt|) (484 . |coerce|) (|Union| 136 19)
              (|Mapping| 105 151) |MODHP;HP_solve_P;LL2SNniMMU;19|
              (489 . |construct|) (|List| 24) |MODHP;HP_solve_M;LLSINniMMU;20|
              (|Union|
               (|Matrix| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
               19)
              (|List| (|List| (|AlgebraicNumber|)))
              (|Mapping| 105
                         (|List|
                          (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
              |MODHP;HP_solve_A;LLSNniMMU;21|
              (|Union|
               (|Matrix|
                (|SparseUnivariatePolynomial|
                 (|Polynomial| (|AlgebraicNumber|))))
               19)
              (|List| (|List| (|Fraction| (|Polynomial| (|AlgebraicNumber|)))))
              (|Mapping| 105
                         (|List|
                          (|SparseUnivariatePolynomial|
                           (|Polynomial| (|AlgebraicNumber|)))))
              |MODHP;HP_solve_PA;LL2SNniMMU;22|)
           '#(|unpack_poly| 494 |get_variables| 503 |check_sol1a| 510
              |VSUPPI_to_VPA| 520 |VSUPI_to_VPA| 528 |LLFPI_to_LPA| 534
              |LLFI_to_LPA| 543 |HP_solve_PA| 550 |HP_solve_P| 561 |HP_solve_M|
              572 |HP_solve_I| 583 |HP_solve_A| 593)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 170
                                                 '(2 8 6 0 7 9 2 11 10 6 7 12 3
                                                   13 10 0 7 10 14 1 17 16 0 18
                                                   1 17 19 0 20 1 17 21 0 22 4
                                                   25 7 21 23 24 7 26 1 17 0 0
                                                   27 2 28 17 0 7 29 0 31 0 32
                                                   2 7 19 0 0 33 1 31 7 0 34 2
                                                   7 0 0 0 35 1 31 7 0 36 2 37
                                                   0 0 0 38 1 42 21 0 43 1 42
                                                   21 0 44 1 6 19 0 47 1 6 16 0
                                                   48 1 6 7 0 49 1 6 0 0 50 1
                                                   31 0 7 51 2 54 52 53 6 55 2
                                                   13 10 0 7 56 0 52 0 57 5 11
                                                   58 10 10 10 7 7 59 2 7 0 0 0
                                                   63 2 24 7 64 0 65 1 66 0 24
                                                   67 0 52 0 68 1 69 7 7 70 2
                                                   24 19 7 0 71 1 37 0 7 72 6
                                                   76 74 13 66 16 10 7 75 77 2
                                                   66 7 0 7 78 1 79 0 7 80 2 16
                                                   0 81 0 82 1 84 58 83 85 1 7
                                                   83 0 86 3 87 10 0 7 7 88 3
                                                   79 58 10 7 0 89 3 66 7 0 7 7
                                                   90 2 79 91 0 66 92 0 6 0 93
                                                   2 6 0 7 16 94 2 6 0 0 0 95 3
                                                   8 6 0 7 6 96 1 8 97 0 98 3
                                                   99 8 0 7 8 100 2 99 8 0 7
                                                   101 4 102 6 0 7 7 6 103 1 21
                                                   23 0 108 2 23 0 0 0 109 0 17
                                                   0 110 2 17 0 21 16 111 2 17
                                                   0 0 0 112 0 21 0 113 1 21 0
                                                   7 114 0 21 0 115 3 21 0 0 75
                                                   16 116 2 21 0 0 0 117 2 21 0
                                                   0 0 118 1 42 0 21 122 2 125
                                                   123 124 17 126 1 123 19 0
                                                   127 1 123 16 0 128 1 123 42
                                                   0 129 1 123 0 0 130 1 42 31
                                                   0 131 2 52 0 31 16 132 2 52
                                                   0 0 0 133 0 123 0 134 3 102
                                                   6 0 7 7 135 4 136 17 0 7 7
                                                   17 137 2 23 19 75 0 138 1 23
                                                   0 0 139 0 123 0 141 1 143 0
                                                   142 144 8 76 146 23 147 66
                                                   16 10 75 75 61 148 2 7 19 0
                                                   0 149 3 28 17 0 7 17 150 1
                                                   28 151 0 152 3 153 28 0 7 28
                                                   154 2 153 28 0 7 155 1 28 83
                                                   0 156 1 10 0 24 160 5 0 17
                                                   23 119 120 7 7 121 3 0 23 45
                                                   75 75 140 6 0 10 13 60 61 7
                                                   7 7 62 4 0 13 28 23 24 7 30
                                                   2 0 13 8 7 15 5 0 39 45 7 23
                                                   24 7 46 3 0 39 40 7 7 41 7 0
                                                   167 168 24 75 75 16 61 169
                                                   170 7 0 157 45 24 75 75 16
                                                   61 158 159 7 0 104 161 24 75
                                                   7 16 61 106 162 6 0 104 40
                                                   24 75 16 61 106 107 6 0 163
                                                   164 24 75 16 61 165 166)))))
           '|lookupComplete|)) 

(MAKEPROP '|ModularHermitePade| 'NILADIC T) 
