
(SDEFUN |MODHP;VSUPI_to_VPA;VIV;1|
        ((|vps| |Vector| (|SparseUnivariatePolynomial| (|Integer|)))
         (|p| |Integer|) ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G413 NIL) (|i| NIL) (|vpa| (|Vector| (|U32Vector|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |vps|))
              (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)))
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |vpa| |i|
                               (SPADCALL (SPADCALL |vps| |i| (QREFELT $ 9)) |p|
                                         (QREFELT $ 12))
                               (QREFELT $ 14))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |vpa|)))) 

(SDEFUN |MODHP;SUPPI_to_PA|
        ((|poli| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         (|vars| |List| (|Symbol|)) (|pts| |List| (|Integer|)) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((|nlc| (|Integer|)) (|m| #1=(|NonNegativeInteger|))
          (|pa| (|U32Vector|)) (|n| #1#))
         (SEQ (LETT |n| (SPADCALL |poli| (QREFELT $ 18)))
              (LETT |pa| (GETREFV_U32 (+ |n| 1) 0))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |poli| (QREFELT $ 20)))) (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |poli| (QREFELT $ 18)))
                        (LETT |nlc|
                              (SPADCALL (SPADCALL |poli| (QREFELT $ 22)) |vars|
                                        |pts| |p| (QREFELT $ 26)))
                        (SETELT_U32 |pa| |m| |nlc|)
                        (EXIT (LETT |poli| (SPADCALL |poli| (QREFELT $ 27)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |pa|)))) 

(SDEFUN |MODHP;VSUPPI_to_VPA;VLLIV;3|
        ((|vps| |Vector|
          (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
         (|vars| |List| (|Symbol|)) (|pts| |List| (|Integer|)) (|p| |Integer|)
         ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G422 NIL) (|i| NIL) (|vpa| (|Vector| (|U32Vector|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |vps|))
              (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)))
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |vpa| |i|
                               (|MODHP;SUPPI_to_PA|
                                (SPADCALL |vps| |i| (QREFELT $ 29)) |vars|
                                |pts| |p| $)
                               (QREFELT $ 14))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |vpa|)))) 

(SDEFUN |MODHP;LLFI_to_LPA;L2IU;4|
        ((|llfi| |List| (|List| (|Fraction| (|Integer|)))) (|n| |Integer|)
         (|prime| |Integer|) ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPROG
         ((|resl| (|List| (|U32Vector|))) (|nlc| (|Integer|))
          (|dms| (|SingleInteger|)) (#1=#:G436 NIL) (|dm| #2=(|Integer|))
          (|nm| #2#) (#3=#:G438 NIL) (|j| NIL) (#4=#:G439 NIL) (|el| NIL)
          (|pa| (|U32Vector|)) (|nn| (|Integer|)) (#5=#:G437 NIL) (|lfi| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL)
                (SEQ (LETT |lfi| NIL) (LETT #5# |llfi|) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |lfi| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |nn| (COND ((> |n| 0) |n|) ('T (LENGTH |lfi|))))
                      (LETT |pa| (GETREFV_U32 |nn| 0))
                      (SEQ (LETT |el| NIL) (LETT #4# |lfi|) (LETT |j| 0)
                           (LETT #3# (- |nn| 1)) G190
                           (COND
                            ((OR (|greater_SI| |j| #3#) (ATOM #4#)
                                 (PROGN (LETT |el| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |nm|
                                  (SPADCALL (SPADCALL |el| (QREFELT $ 33))
                                            |prime| (QREFELT $ 34)))
                            (LETT |dm|
                                  (SPADCALL (SPADCALL |el| (QREFELT $ 35))
                                            |prime| (QREFELT $ 34)))
                            (EXIT
                             (COND
                              ((EQL |dm| 0)
                               (PROGN
                                (LETT #1# (CONS 1 "failed"))
                                (GO #6=#:G435)))
                              ('T
                               (SEQ (LETT |dms| |dm|)
                                    (LETT |nlc|
                                          (QSMULMOD32 |nm|
                                                      (SPADCALL |dms| |prime|
                                                                (QREFELT $ 37))
                                                      |prime|))
                                    (EXIT (SETELT_U32 |pa| |j| |nlc|)))))))
                           (LETT |j|
                                 (PROG1 (|inc_SI| |j|) (LETT #4# (CDR #4#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (LETT |resl| (CONS |pa| |resl|))))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #6# (EXIT #1#)))) 

(SDEFUN |MODHP;LLFPI_to_LPA;LILLIU;5|
        ((|llfi| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|n| |Integer|) (|vars| |List| (|Symbol|)) (|pts| |List| (|Integer|))
         (|prime| |Integer|) ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPROG
         ((|resl| (|List| (|U32Vector|))) (|nlc| (|Integer|))
          (|dms| (|SingleInteger|)) (#1=#:G450 NIL) (|dm| #2=(|Integer|))
          (|nm| #2#) (#3=#:G452 NIL) (|j| NIL) (#4=#:G453 NIL) (|el| NIL)
          (|pa| (|U32Vector|)) (#5=#:G451 NIL) (|lfi| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL)
                (SEQ (LETT |lfi| NIL) (LETT #5# |llfi|) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |lfi| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |pa| (GETREFV_U32 |n| 0))
                          (SEQ (LETT |el| NIL) (LETT #4# |lfi|) (LETT |j| 0)
                               (LETT #3# (- |n| 1)) G190
                               (COND
                                ((OR (|greater_SI| |j| #3#) (ATOM #4#)
                                     (PROGN (LETT |el| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |nm|
                                      (SPADCALL (SPADCALL |el| (QREFELT $ 42))
                                                |vars| |pts| |prime|
                                                (QREFELT $ 26)))
                                (LETT |dm|
                                      (SPADCALL (SPADCALL |el| (QREFELT $ 43))
                                                |vars| |pts| |prime|
                                                (QREFELT $ 26)))
                                (EXIT
                                 (COND
                                  ((EQL |dm| 0)
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed"))
                                    (GO #6=#:G449)))
                                  ('T
                                   (SEQ (LETT |dms| |dm|)
                                        (LETT |nlc|
                                              (QSMULMOD32 |nm|
                                                          (SPADCALL |dms|
                                                                    |prime|
                                                                    (QREFELT $
                                                                             37))
                                                          |prime|))
                                        (EXIT (SETELT_U32 |pa| |j| |nlc|)))))))
                               (LETT |j|
                                     (PROG1 (|inc_SI| |j|)
                                       (LETT #4# (CDR #4#))))
                               (GO G190) G191 (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |pa| |resl|))))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #6# (EXIT #1#)))) 

(SDEFUN |MODHP;PPFtoPA|
        ((|pfi| |SparseUnivariatePolynomial| (|Integer|))
         (|sigma| |NonNegativeInteger|) (|psi| |SingleInteger|)
         ($ |Union| (|U32Vector|) "failed"))
        (SPROG
         ((|nc| (|Integer|)) (|nlcq| (|Integer|)) (|m| (|NonNegativeInteger|))
          (|prime| (|Integer|)) (|pa| (|U32Vector|)))
         (SEQ (LETT |pa| (GETREFV_U32 |sigma| 0)) (LETT |prime| |psi|)
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |pfi| (QREFELT $ 46)))) (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |pfi| (QREFELT $ 47)))
                        (COND
                         ((< |m| |sigma|)
                          (SEQ (LETT |nlcq| (SPADCALL |pfi| (QREFELT $ 48)))
                               (LETT |nc|
                                     (SPADCALL |nlcq| |prime| (QREFELT $ 34)))
                               (EXIT (SETELT_U32 |pa| |m| |nc|)))))
                        (EXIT (LETT |pfi| (SPADCALL |pfi| (QREFELT $ 49)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 |pa|))))) 

(SDEFUN |MODHP;LPPFtoVPA|
        ((|lpi| |List| (|SparseUnivariatePolynomial| (|Integer|)))
         (|sigma| |NonNegativeInteger|) (|psi| |SingleInteger|)
         ($ |Union| (|Vector| (|U32Vector|)) "failed"))
        (SPROG
         ((#1=#:G470 NIL) (|vpp| (|Union| (|U32Vector|) "failed"))
          (#2=#:G471 NIL) (|i| NIL) (#3=#:G472 NIL) (|p| NIL)
          (|vpa| (|Vector| (|U32Vector|))) (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (LENGTH |lpi|))
                (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)))
                (SEQ (LETT |p| NIL) (LETT #3# |lpi|) (LETT |i| 1)
                     (LETT #2# |m|) G190
                     (COND
                      ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                           (PROGN (LETT |p| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |vpp| (|MODHP;PPFtoPA| |p| |sigma| |psi| $))
                          (EXIT
                           (COND
                            ((QEQCAR |vpp| 1)
                             (PROGN
                              (LETT #1# (CONS 1 "failed"))
                              (GO #4=#:G469)))
                            ('T
                             (SPADCALL |vpa| |i| (QCDR |vpp|)
                                       (QREFELT $ 14))))))
                     (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |vpa|))))
          #4# (EXIT #1#)))) 

(SDEFUN |MODHP;intpoly_to_PFI|
        ((|p| |SparseUnivariatePolynomial| (|Integer|))
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (ELT $ 50) |p| (QREFELT $ 54))) 

(SDEFUN |MODHP;check_sol1a;VLM3IUv;9|
        ((|nres| |Vector| (|U32Vector|)) (|gv0| |List| (|U32Vector|))
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|sigma| |Integer|) (|qval| |Integer|) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((#1=#:G478 NIL) (|i| NIL) (|res| (|U32Vector|))
          (|gvp| (|Vector| (|U32Vector|))) (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |nres|))
              (LETT |gvp| (SPADCALL |gv0| |p| |qval| |gen|))
              (LETT |res| (GETREFV_U32 |sigma| 0))
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (SPADCALL |gvp| |i| (QREFELT $ 55))
                               (SPADCALL |nres| |i| (QREFELT $ 55)) |res|
                               (- |sigma| 1) |p| (QREFELT $ 58))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
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
         ((#4=#:G570 NIL) (#5=#:G583 NIL) (|l| NIL) (#6=#:G582 NIL) (|i| NIL)
          (|mress| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#7=#:G545 NIL) (|ii| (|Integer|)) (#8=#:G568 NIL)
          (|sol_ok| #9=(|Boolean|)) (|sol_okp| (|Union| #1# #2# #3#))
          (|k| (|Integer|)) (|s| (|SparseUnivariatePolynomial| (|Integer|)))
          (#10=#:G581 NIL) (|mm| (|Integer|)) (#11=#:G580 NIL)
          (|j| (|Integer|))
          (|resvi| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
          (#12=#:G579 NIL)
          (|resv|
           (|Vector| (|Vector| (|SparseUnivariatePolynomial| (|Integer|)))))
          (#13=#:G532 NIL) (|ppr| (|PrimitiveArray| (|Integer|)))
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (|empty_offsets| #9#) (#14=#:G578 NIL)
          (|offsets| (|Vector| (|Integer|))) (#15=#:G524 NIL) (#16=#:G577 NIL)
          (|cp| (|U32Vector|)) (#17=#:G576 NIL) (#18=#:G575 NIL)
          (|rv| #19=(|U32Vector|)) (#20=#:G514 NIL)
          (|rstate| (|VectorIntegerReconstructor|))
          (|oldciv| #21=(|Vector| (|Integer|)))
          (|oldva| #22=(|Vector| (|Integer|))) (|nsols| (|Integer|))
          (#23=#:G569 NIL) (|is_bad| #9#) (|all_bad| (|Boolean|))
          (#24=#:G574 NIL) (|civ| #21#) (|va| #22#)
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
          (|pts| (|U32Vector|)) (#26=#:G567 NIL) (#27=#:G573 NIL) (|pts0| #19#)
          (|ve| (|Vector| (|Integer|))) (#28=#:G572 NIL) (|d| NIL)
          (#29=#:G571 NIL) (|degs_sum| (|NonNegativeInteger|))
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL)
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
                  (EXIT (CONS 1 'T))))
                (LETT |m| (LENGTH |degs|))
                (LETT |degs_sum|
                      (+ (SPADCALL (ELT $ 62) |degs| (QREFELT $ 64)) |m|))
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #29# NIL)
                        (SEQ (LETT |d| NIL) (LETT #28# |degs|) G190
                             (COND
                              ((OR (ATOM #28#)
                                   (PROGN (LETT |d| (CAR #28#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #29# (CONS |d| #29#))))
                             (LETT #28# (CDR #28#)) (GO G190) G191
                             (EXIT (NREVERSE #29#))))
                       (QREFELT $ 66)))
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
                                         (LETT |pts0| (GETREFV_U32 |sigma| 0))
                                         (SEQ (LETT |i| 0)
                                              (LETT #27# (- |sigma| 1)) G190
                                              (COND
                                               ((|greater_SI| |i| #27#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (SETELT_U32 |pts0| |i| |i|)))
                                              (LETT |i| (|inc_SI| |i|))
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT |pts0|)))
                                  (GO #30=#:G491)))))
                              #30# (EXIT #26#)))))
                (LETT |vi| (MAKEARR1 |m| NIL)) (LETT |nsols| -1)
                (LETT |maxd| -1) (LETT |nprimes| 0) (LETT |nsols| (+ |m| 1))
                (LETT |empty_offsets| 'T)
                (SEQ G190 NIL
                     (SEQ (LETT |ok| NIL)
                          (SEQ (LETT |k| 1) G190
                               (COND
                                ((OR (|greater_SI| |k| 100) (NULL (NULL |ok|)))
                                 (GO G191)))
                               (SEQ
                                (LETT |prime|
                                      (SPADCALL (+ (RANDOM 2000000) 2000000)
                                                (QREFELT $ 69)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |prime| |lp| (QREFELT $ 70))
                                   "iterate")
                                  ('T
                                   (SEQ (LETT |lp| (CONS |prime| |lp|))
                                        (EXIT (LETT |ok| 'T)))))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            (|ok|
                             (SEQ (LETT |nprimes| (+ |nprimes| 1))
                                  (LETT |psi|
                                        (SPADCALL |prime| (QREFELT $ 71)))
                                  (LETT |gv0p|
                                        (SPADCALL |list| 0 |psi|
                                                  (QREFELT $ 40)))
                                  (EXIT
                                   (COND ((QEQCAR |gv0p| 1) "iterate")
                                         ('T
                                          (SEQ (LETT |gv0| (QCDR |gv0p|))
                                               (LETT |gv2|
                                                     (SPADCALL |gv0| |prime| 1
                                                               |gen|))
                                               (LETT |blr|
                                                     (SPADCALL |gv2| |ve|
                                                               |sigma| |pts|
                                                               |prime| |kind|
                                                               (QREFELT $ 76)))
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |blr| 1)
                                                  (PROGN
                                                   (LETT #4# (CONS 1 NIL))
                                                   (GO #31=#:G566)))
                                                 ('T
                                                  (SEQ
                                                   (LETT |rblr| (QCDR |blr|))
                                                   (LETT |bm| (QVELT |rblr| 0))
                                                   (LETT |va| (QVELT |rblr| 1))
                                                   (LETT |civ|
                                                         (QVELT |rblr| 2))
                                                   (EXIT
                                                    (COND
                                                     ((> (QVSIZE |va|) |nsols|)
                                                      "iterate")
                                                     ('T
                                                      (SEQ (LETT |is_bad| NIL)
                                                           (LETT |all_bad|
                                                                 (<
                                                                  (QVSIZE |va|)
                                                                  |nsols|))
                                                           (COND
                                                            ((EQL (QVSIZE |va|)
                                                                  |nsols|)
                                                             (SEQ
                                                              (EXIT
                                                               (SEQ
                                                                (LETT |i| 1)
                                                                (LETT #24#
                                                                      |nsols|)
                                                                G190
                                                                (COND
                                                                 ((|greater_SI|
                                                                   |i| #24#)
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (EXIT
                                                                  (COND
                                                                   ((<
                                                                     (SPADCALL
                                                                      |va| |i|
                                                                      (QREFELT
                                                                       $ 77))
                                                                     (SPADCALL
                                                                      |oldva|
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 77)))
                                                                    (SEQ
                                                                     (LETT
                                                                      |all_bad|
                                                                      'T)
                                                                     (EXIT
                                                                      (PROGN
                                                                       (LETT
                                                                        #23#
                                                                        |$NoValue|)
                                                                       (GO
                                                                        #32=#:G511)))))
                                                                   ((>
                                                                     (SPADCALL
                                                                      |va| |i|
                                                                      (QREFELT
                                                                       $ 77))
                                                                     (SPADCALL
                                                                      |oldva|
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 77)))
                                                                    (SEQ
                                                                     (LETT
                                                                      |is_bad|
                                                                      'T)
                                                                     (EXIT
                                                                      (PROGN
                                                                       (LETT
                                                                        #23#
                                                                        |$NoValue|)
                                                                       (GO
                                                                        #32#)))))
                                                                   ((<
                                                                     (SPADCALL
                                                                      |civ| |i|
                                                                      (QREFELT
                                                                       $ 77))
                                                                     (SPADCALL
                                                                      |oldciv|
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 77)))
                                                                    (SEQ
                                                                     (LETT
                                                                      |all_bad|
                                                                      'T)
                                                                     (EXIT
                                                                      (PROGN
                                                                       (LETT
                                                                        #23#
                                                                        |$NoValue|)
                                                                       (GO
                                                                        #32#)))))
                                                                   ((>
                                                                     (SPADCALL
                                                                      |civ| |i|
                                                                      (QREFELT
                                                                       $ 77))
                                                                     (SPADCALL
                                                                      |oldciv|
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 77)))
                                                                    (SEQ
                                                                     (LETT
                                                                      |is_bad|
                                                                      'T)
                                                                     (EXIT
                                                                      (PROGN
                                                                       (LETT
                                                                        #23#
                                                                        |$NoValue|)
                                                                       (GO
                                                                        #32#))))))))
                                                                (LETT |i|
                                                                      (|inc_SI|
                                                                       |i|))
                                                                (GO G190) G191
                                                                (EXIT NIL)))
                                                              #32#
                                                              (EXIT #23#))))
                                                           (EXIT
                                                            (COND
                                                             (|is_bad|
                                                              "iterate")
                                                             ('T
                                                              (SEQ
                                                               (COND
                                                                (|all_bad|
                                                                 (SEQ
                                                                  (LETT |nsols|
                                                                        (QVSIZE
                                                                         |va|))
                                                                  (LETT |oldva|
                                                                        |va|)
                                                                  (LETT
                                                                   |oldciv|
                                                                   |civ|)
                                                                  (LETT
                                                                   |rstate|
                                                                   (SPADCALL
                                                                    (* |nsols|
                                                                       |degs_sum|)
                                                                    (QREFELT $
                                                                             79)))
                                                                  (LETT |rv|
                                                                        (GETREFV_U32
                                                                         (*
                                                                          (PROG1
                                                                              (LETT
                                                                               #20#
                                                                               |nsols|)
                                                                            (|check_subtype2|
                                                                             (>
                                                                              #20#
                                                                              0)
                                                                             '(|PositiveInteger|)
                                                                             '(|Integer|)
                                                                             #20#))
                                                                          |degs_sum|)
                                                                         0))
                                                                  (EXIT
                                                                   (LETT
                                                                    |empty_offsets|
                                                                    'T)))))
                                                               (LETT |k| 0)
                                                               (COND
                                                                ((EQL
                                                                  (SPADCALL
                                                                   |nprimes|
                                                                   100
                                                                   (QREFELT $
                                                                            34))
                                                                  0)
                                                                 (SEQ
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    "number of primes"
                                                                    (QREFELT $
                                                                             82))
                                                                   (QREFELT $
                                                                            84))
                                                                  (EXIT
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |nprimes|
                                                                     (QREFELT $
                                                                              85))
                                                                    (QREFELT $
                                                                             84))))))
                                                               (SEQ
                                                                (LETT |i| 1)
                                                                (LETT #18#
                                                                      |nsols|)
                                                                G190
                                                                (COND
                                                                 ((|greater_SI|
                                                                   |i| #18#)
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT |j| 1)
                                                                   (LETT #17#
                                                                         |m|)
                                                                   G190
                                                                   (COND
                                                                    ((|greater_SI|
                                                                      |j| #17#)
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (LETT |mm|
                                                                          (SPADCALL
                                                                           |ve|
                                                                           |j|
                                                                           (QREFELT
                                                                            $
                                                                            77)))
                                                                    (LETT |cp|
                                                                          (SPADCALL
                                                                           |bm|
                                                                           |i|
                                                                           |j|
                                                                           (QREFELT
                                                                            $
                                                                            87)))
                                                                    (EXIT
                                                                     (SEQ
                                                                      (LETT |l|
                                                                            0)
                                                                      (LETT
                                                                       #16#
                                                                       |mm|)
                                                                      G190
                                                                      (COND
                                                                       ((|greater_SI|
                                                                         |l|
                                                                         #16#)
                                                                        (GO
                                                                         G191)))
                                                                      (SEQ
                                                                       (SETELT_U32
                                                                        |rv|
                                                                        |k|
                                                                        (ELT_U32
                                                                         |cp|
                                                                         |l|))
                                                                       (EXIT
                                                                        (LETT
                                                                         |k|
                                                                         (+ |k|
                                                                            1))))
                                                                      (LETT |l|
                                                                            (|inc_SI|
                                                                             |l|))
                                                                      (GO G190)
                                                                      G191
                                                                      (EXIT
                                                                       NIL))))
                                                                   (LETT |j|
                                                                         (|inc_SI|
                                                                          |j|))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT
                                                                    NIL))))
                                                                (LETT |i|
                                                                      (|inc_SI|
                                                                       |i|))
                                                                (GO G190) G191
                                                                (EXIT NIL))
                                                               (SPADCALL |rv|
                                                                         |prime|
                                                                         |rstate|
                                                                         (QREFELT
                                                                          $
                                                                          88))
                                                               (COND
                                                                (|empty_offsets|
                                                                 (SEQ
                                                                  (LETT
                                                                   |offsets|
                                                                   (MAKEARR1
                                                                    (PROG1
                                                                        (LETT
                                                                         #15#
                                                                         |nsols|)
                                                                      (|check_subtype2|
                                                                       (>= #15#
                                                                           0)
                                                                       '(|NonNegativeInteger|)
                                                                       '(|Integer|)
                                                                       #15#))
                                                                    0))
                                                                  (LETT |j| 0)
                                                                  (SEQ
                                                                   (LETT |i| 1)
                                                                   (LETT #14#
                                                                         |nsols|)
                                                                   G190
                                                                   (COND
                                                                    ((|greater_SI|
                                                                      |i| #14#)
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (SPADCALL
                                                                     |offsets|
                                                                     |i| |j|
                                                                     (QREFELT $
                                                                              89))
                                                                    (EXIT
                                                                     (LETT |j|
                                                                           (+
                                                                            |j|
                                                                            |degs_sum|))))
                                                                   (LETT |i|
                                                                         (|inc_SI|
                                                                          |i|))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                                  (EXIT
                                                                   (LETT
                                                                    |empty_offsets|
                                                                    NIL)))))
                                                               (LETT |pp|
                                                                     (SPADCALL
                                                                      |rstate|
                                                                      |offsets|
                                                                      (QREFELT
                                                                       $ 91)))
                                                               (EXIT
                                                                (COND
                                                                 ((QEQCAR |pp|
                                                                          1)
                                                                  "iterate")
                                                                 ('T
                                                                  (SEQ
                                                                   (LETT |ppr|
                                                                         (QCDR
                                                                          |pp|))
                                                                   (LETT |k| 0)
                                                                   (LETT |resv|
                                                                         (MAKEARR1
                                                                          (PROG1
                                                                              (LETT
                                                                               #13#
                                                                               |nsols|)
                                                                            (|check_subtype2|
                                                                             (>=
                                                                              #13#
                                                                              0)
                                                                             '(|NonNegativeInteger|)
                                                                             '(|Integer|)
                                                                             #13#))
                                                                          (MAKE-ARRAY
                                                                           0)))
                                                                   (LETT |ii|
                                                                         1)
                                                                   (LETT
                                                                    |sol_ok|
                                                                    'T)
                                                                   (SEQ
                                                                    (EXIT
                                                                     (SEQ
                                                                      (LETT |i|
                                                                            1)
                                                                      (LETT
                                                                       #12#
                                                                       |nsols|)
                                                                      G190
                                                                      (COND
                                                                       ((|greater_SI|
                                                                         |i|
                                                                         #12#)
                                                                        (GO
                                                                         G191)))
                                                                      (SEQ
                                                                       (LETT
                                                                        |resvi|
                                                                        (MAKEARR1
                                                                         |m|
                                                                         (|spadConstant|
                                                                          $
                                                                          92)))
                                                                       (SEQ
                                                                        (LETT
                                                                         |j| 1)
                                                                        (LETT
                                                                         #11#
                                                                         |m|)
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
                                                                            $
                                                                            77)))
                                                                         (LETT
                                                                          |s|
                                                                          (|spadConstant|
                                                                           $
                                                                           92))
                                                                         (SEQ
                                                                          (LETT
                                                                           |l|
                                                                           0)
                                                                          (LETT
                                                                           #10#
                                                                           |mm|)
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
                                                                               93))
                                                                             (QREFELT
                                                                              $
                                                                              94)))
                                                                           (EXIT
                                                                            (LETT
                                                                             |k|
                                                                             (+
                                                                              |k|
                                                                              1))))
                                                                          (LETT
                                                                           |l|
                                                                           (|inc_SI|
                                                                            |l|))
                                                                          (GO
                                                                           G190)
                                                                          G191
                                                                          (EXIT
                                                                           NIL))
                                                                         (EXIT
                                                                          (SPADCALL
                                                                           |resvi|
                                                                           |j|
                                                                           |s|
                                                                           (QREFELT
                                                                            $
                                                                            95))))
                                                                        (LETT
                                                                         |j|
                                                                         (|inc_SI|
                                                                          |j|))
                                                                        (GO
                                                                         G190)
                                                                        G191
                                                                        (EXIT
                                                                         NIL))
                                                                       (LETT
                                                                        |sol_okp|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          |resvi|
                                                                          (QREFELT
                                                                           $
                                                                           97))
                                                                         |check|))
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
                                                                            NIL)
                                                                           (EXIT
                                                                            (PROGN
                                                                             (LETT
                                                                              #8#
                                                                              |$NoValue|)
                                                                             (GO
                                                                              #33=#:G544)))))
                                                                         ('T
                                                                          (SEQ
                                                                           (SPADCALL
                                                                            |resv|
                                                                            |ii|
                                                                            |resvi|
                                                                            (QREFELT
                                                                             $
                                                                             99))
                                                                           (EXIT
                                                                            (LETT
                                                                             |ii|
                                                                             (+
                                                                              |ii|
                                                                              1))))))))
                                                                      (LETT |i|
                                                                            (|inc_SI|
                                                                             |i|))
                                                                      (GO G190)
                                                                      G191
                                                                      (EXIT
                                                                       NIL)))
                                                                    #33#
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
                                                                               1))
                                                                           (|check_subtype2|
                                                                            (>=
                                                                             #7#
                                                                             0)
                                                                            '(|NonNegativeInteger|)
                                                                            '(|Integer|)
                                                                            #7#))
                                                                         (|spadConstant|
                                                                          $
                                                                          92)))
                                                                       (SEQ
                                                                        (LETT
                                                                         |i| 1)
                                                                        (LETT
                                                                         #6#
                                                                         (-
                                                                          |ii|
                                                                          1))
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
                                                                            |l|
                                                                            1)
                                                                           (LETT
                                                                            #5#
                                                                            |m|)
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
                                                                                 100))
                                                                               |l|
                                                                               (QREFELT
                                                                                $
                                                                                9))
                                                                              (QREFELT
                                                                               $
                                                                               102))))
                                                                           (LETT
                                                                            |l|
                                                                            (|inc_SI|
                                                                             |l|))
                                                                           (GO
                                                                            G190)
                                                                           G191
                                                                           (EXIT
                                                                            NIL))))
                                                                        (LETT
                                                                         |i|
                                                                         (|inc_SI|
                                                                          |i|))
                                                                        (GO
                                                                         G190)
                                                                        G191
                                                                        (EXIT
                                                                         NIL))
                                                                       (EXIT
                                                                        (PROGN
                                                                         (LETT
                                                                          #4#
                                                                          (CONS
                                                                           0
                                                                           |mress|))
                                                                         (GO
                                                                          #31#)))))))))))))))))))))))))))))
                            ('T (|error| "Run out of primes")))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (PROGN (LETT #4# (CONS 1 'T)) (GO #31#)))))
          #31# (EXIT #4#)))) 

(SDEFUN |MODHP;get_variables2|
        ((|llpi| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         ($ |List| (|Symbol|)))
        (SPROG
         ((|res| (|List| (|Symbol|))) (#1=#:G590 NIL) (|p| NIL) (#2=#:G589 NIL)
          (|lpi| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |lpi| NIL) (LETT #2# |llpi|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |lpi| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL) (LETT #1# |lpi|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL
                                            (SPADCALL |p| (QREFELT $ 42))
                                            (QREFELT $ 107))
                                           (QREFELT $ 108)))
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL |p| (QREFELT $ 43))
                                             (QREFELT $ 107))
                                            (QREFELT $ 108)))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;unpack_poly;LSevPa2ISup;12|
        ((|vars| |List| (|Symbol|)) (|exps| |SortedExponentVector|)
         (|coeffs| |PrimitiveArray| (|Integer|)) (|lo| |Integer|)
         (|hi| |Integer|)
         ($ |SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (#1=#:G602 NIL) (|i| (|Integer|)) (|term| (|Polynomial| (|Integer|)))
          (|term1| (|Polynomial| (|Integer|))) (#2=#:G596 NIL) (#3=#:G606 NIL)
          (|k| NIL) (#4=#:G607 NIL) (|var| NIL) (|j| (|Integer|))
          (#5=#:G592 NIL) (|jj| (|Integer|)) (#6=#:G605 NIL) (|i0| NIL)
          (|nn| (|NonNegativeInteger|)) (|nvars| (|NonNegativeInteger|)))
         (SEQ (LETT |res| (|spadConstant| $ 109))
              (LETT |nvars| (LENGTH |vars|)) (LETT |nn| (+ |nvars| 1))
              (LETT |vars| (REVERSE |vars|)) (LETT |j| -1)
              (LETT |i| (* |lo| |nn|))
              (SEQ (LETT |i0| |lo|) (LETT #6# |hi|) G190
                   (COND ((> |i0| #6#) (GO G191)))
                   (SEQ (LETT |jj| (ELT_U32 |exps| |i|))
                        (EXIT
                         (COND
                          ((< |jj| |j|)
                           (|error|
                            "Internal error: inconsistent exponent vector"))
                          ('T
                           (SEQ
                            (COND
                             ((> |jj| |j|)
                              (SEQ
                               (COND
                                ((>= |j| 0)
                                 (LETT |res|
                                       (SPADCALL |res|
                                                 (SPADCALL |term|
                                                           (PROG1
                                                               (LETT #5# |j|)
                                                             (|check_subtype2|
                                                              (>= #5# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #5#))
                                                           (QREFELT $ 110))
                                                 (QREFELT $ 111)))))
                               (LETT |j| |jj|)
                               (EXIT (LETT |term| (|spadConstant| $ 112))))))
                            (LETT |term1|
                                  (SPADCALL (QAREF1 |coeffs| |i0|)
                                            (QREFELT $ 113)))
                            (SEQ (LETT |var| NIL) (LETT #4# |vars|)
                                 (LETT |k| 1) (LETT #3# |nvars|) G190
                                 (COND
                                  ((OR (|greater_SI| |k| #3#) (ATOM #4#)
                                       (PROGN (LETT |var| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |term1|
                                         (SPADCALL |term1|
                                                   (SPADCALL
                                                    (|spadConstant| $ 114)
                                                    |var|
                                                    (PROG1
                                                        (LETT #2#
                                                              (ELT_U32 |exps|
                                                                       (+ |i|
                                                                          |k|)))
                                                      (|check_subtype2|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                                    (QREFELT $ 115))
                                                   (QREFELT $ 116)))))
                                 (LETT |k|
                                       (PROG1 (|inc_SI| |k|)
                                         (LETT #4# (CDR #4#))))
                                 (GO G190) G191 (EXIT NIL))
                            (LETT |term|
                                  (SPADCALL |term1| |term| (QREFELT $ 117)))
                            (EXIT (LETT |i| (+ |i| |nn|))))))))
                   (LETT |i0| (+ |i0| 1)) (GO G190) G191 (EXIT NIL))
              (COND
               ((>= |j| 0)
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |term|
                                          (PROG1 (LETT #1# |j|)
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))
                                          (QREFELT $ 110))
                                (QREFELT $ 111)))))
              (EXIT |res|)))) 

(SDEFUN |MODHP;intpoly_to_PFPI|
        ((|p| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|Polynomial| (|Integer|)))))
        (SPADCALL (ELT $ 121) |p| (QREFELT $ 125))) 

(SDEFUN |MODHP;PFPI_to_PFI|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|Polynomial| (|Integer|))))
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|iq| (|Fraction| (|Integer|)))
          (|q| (|Fraction| (|Polynomial| (|Integer|))))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |res| (|spadConstant| $ 67))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |p| (QREFELT $ 126)))) (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |p| (QREFELT $ 127)))
                        (LETT |q| (SPADCALL |p| (QREFELT $ 128)))
                        (LETT |p| (SPADCALL |p| (QREFELT $ 129)))
                        (LETT |iq| (SPADCALL |q| (QREFELT $ 130)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |iq| |m| (QREFELT $ 131))
                                         |res| (QREFELT $ 132)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;PI_to_PPI|
        ((|p| |SparseUnivariatePolynomial| (|Integer|))
         ($ |SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|mq| (|Polynomial| (|Integer|))) (|q| (|Integer|))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |res| (|spadConstant| $ 109))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |p| (QREFELT $ 46)))) (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |p| (QREFELT $ 47)))
                        (LETT |q| (SPADCALL |p| (QREFELT $ 48)))
                        (LETT |p| (SPADCALL |p| (QREFELT $ 49)))
                        (LETT |mq| (SPADCALL |q| (QREFELT $ 113)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |mq| |m| (QREFELT $ 110))
                                         |res| (QREFELT $ 111)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;LPI_to_LPPI|
        ((|lp| |List| (|SparseUnivariatePolynomial| (|Integer|)))
         ($ |List| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
        (SPROG ((#1=#:G622 NIL) (|p| NIL) (#2=#:G621 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #2# (CONS (|MODHP;PI_to_PPI| |p| $) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
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
         ((#1=#:G652 NIL) (|j| NIL) (#2=#:G651 NIL) (|i| NIL)
          (|res|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|resi| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#3=#:G646 NIL)
          (|pres|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|nlist| (|List| (|List| (|Fraction| (|Integer|))))) (#4=#:G650 NIL)
          (|q| NIL) (#5=#:G649 NIL) (#6=#:G648 NIL) (|li| NIL) (#7=#:G647 NIL))
         (SEQ
          (EXIT
           (COND
            ((EQUAL |kind| '|qshiftHP|)
             (PROGN (LETT #3# (CONS 1 'T)) (GO #8=#:G645)))
            (#9='T
             (SEQ (COND ((EQUAL |kind| '|qdiffHP|) (LETT |kind| '|diffHP|)))
                  (LETT |nlist|
                        (PROGN
                         (LETT #7# NIL)
                         (SEQ (LETT |li| NIL) (LETT #6# |list|) G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |li| (CAR #6#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #7#
                                      (CONS
                                       (PROGN
                                        (LETT #5# NIL)
                                        (SEQ (LETT |q| NIL) (LETT #4# |li|)
                                             G190
                                             (COND
                                              ((OR (ATOM #4#)
                                                   (PROGN
                                                    (LETT |q| (CAR #4#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #5#
                                                     (CONS
                                                      (SPADCALL |q|
                                                                (QREFELT $
                                                                         130))
                                                      #5#))))
                                             (LETT #4# (CDR #4#)) (GO G190)
                                             G191 (EXIT (NREVERSE #5#))))
                                       #7#))))
                              (LETT #6# (CDR #6#)) (GO G190) G191
                              (EXIT (NREVERSE #7#)))))
                  (LETT |pres|
                        (SPADCALL |nlist| |degs| |kind| |sigma| |gen|
                                  (CONS #'|MODHP;trivial_poly_solve!0|
                                        (VECTOR |check| $))
                                  (QREFELT $ 106)))
                  (EXIT
                   (COND
                    ((QEQCAR |pres| 1)
                     (PROGN (LETT #3# (CONS 1 (QCDR |pres|))) (GO #8#)))
                    (#9#
                     (SEQ (LETT |resi| (QCDR |pres|))
                          (LETT |nr| (ANROWS |resi|))
                          (LETT |nc| (ANCOLS |resi|))
                          (LETT |res|
                                (MAKE_MATRIX1 |nr| |nc|
                                              (|spadConstant| $ 109)))
                          (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                               (COND ((|greater_SI| |i| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |j| 1) (LETT #1# |nc|) G190
                                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |res| |i| |j|
                                                  (|MODHP;PI_to_PPI|
                                                   (SPADCALL |resi| |i| |j|
                                                             (QREFELT $ 134))
                                                   $)
                                                  (QREFELT $ 136))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (CONS 0 |res|))))))))))
          #8# (EXIT #3#)))) 

(SDEFUN |MODHP;trivial_poly_solve!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |check|)
          (LETT $ (QREFELT $$ 1))
          (LETT |check| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (|MODHP;LPI_to_LPPI| |x| $) |check|))))) 

(SDEFUN |MODHP;get_variables;L2SL;18|
        ((|list| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|kind| |Symbol|) (|qvar| |Symbol|) ($ |List| (|Symbol|)))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (SEQ (LETT |vars| (|MODHP;get_variables2| |list| $))
                    (COND
                     ((OR (EQUAL |kind| '|qdiffHP|)
                          (OR (EQUAL |kind| '|qshiftHP|)
                              (EQUAL |kind| '|qmixed|)))
                      (LETT |vars|
                            (COND
                             ((SPADCALL |qvar| |vars| (QREFELT $ 137)) |vars|)
                             ('T (CONS |qvar| |vars|))))))
                    (EXIT (SPADCALL |vars| (QREFELT $ 138)))))) 

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
         ((#2=#:G711 NIL) (#3=#:G720 NIL) (|l| NIL) (#4=#:G719 NIL) (|i| NIL)
          (|mress|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (#5=#:G694 NIL) (|ii| (|Integer|)) (#6=#:G710 NIL) (|ok| (|Boolean|))
          (|sol_okp| #1#) (|hi| (|Integer|)) (|ohi| #7=(|Integer|))
          (|kk| (|Integer|)) (|lo| #7#) (#8=#:G718 NIL) (|j| NIL)
          (|resvi|
           (|Vector|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (#9=#:G717 NIL)
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
          (#13=#:G716 NIL) (|li| NIL) (#14=#:G715 NIL)
          (|vars| (|List| (|Symbol|))) (|pts| (|U32Vector|)) (#15=#:G709 NIL)
          (#16=#:G714 NIL) (|pts0| (|U32Vector|)) (|ve| (|Vector| (|Integer|)))
          (#17=#:G713 NIL) (|d| NIL) (#18=#:G712 NIL)
          (|m| (|NonNegativeInteger|)) (|lp| (|List| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL) (LETT |m| (LENGTH |degs|))
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #18# NIL)
                        (SEQ (LETT |d| NIL) (LETT #17# |degs|) G190
                             (COND
                              ((OR (ATOM #17#)
                                   (PROGN (LETT |d| (CAR #17#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #18# (CONS |d| #18#))))
                             (LETT #17# (CDR #17#)) (GO G190) G191
                             (EXIT (NREVERSE #18#))))
                       (QREFELT $ 66)))
                (LETT |pts|
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (EQUAL |kind| '|diffHP|)
                              (EQUAL |kind| '|qdiffHP|))
                          (GETREFV_U32 0 0))
                         ((OR (EQUAL |kind| '|shiftHP|)
                              (EQUAL |kind| '|qmixed|))
                          (SEQ (LETT |pts0| (GETREFV_U32 |sigma| 0))
                               (SEQ (LETT |i| 0) (LETT #16# (- |sigma| 1)) G190
                                    (COND ((|greater_SI| |i| #16#) (GO G191)))
                                    (SEQ (EXIT (SETELT_U32 |pts0| |i| |i|)))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT |pts0|)))
                         ('T
                          (COND
                           ((EQUAL |kind| '|qshiftHP|)
                            (PROGN
                             (LETT #15# (GETREFV_U32 |sigma| 0))
                             (GO #19=#:G670)))))))
                       #19# (EXIT #15#)))
                (LETT |vars| (SPADCALL |list| |kind| |qvar| (QREFELT $ 139)))
                (EXIT
                 (COND
                  ((NULL |vars|)
                   (|MODHP;trivial_poly_solve| |list| |degs| |kind| |sigma|
                    |gen| |check| $))
                  ('T
                   (SEQ
                    (LETT |gv0|
                          (PROGN
                           (LETT #14# NIL)
                           (SEQ (LETT |li| NIL) (LETT #13# |list|) G190
                                (COND
                                 ((OR (ATOM #13#)
                                      (PROGN (LETT |li| (CAR #13#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #14#
                                        (CONS (SPADCALL |li| (QREFELT $ 143))
                                              #14#))))
                                (LETT #13# (CDR #13#)) (GO G190) G191
                                (EXIT (NREVERSE #14#)))))
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (LETT |pp|
                                 (SPADCALL |vars| |gv0| |ve| |sigma| |pts|
                                           |kind| |qvar| |gen|
                                           (QREFELT $ 147)))
                           (EXIT
                            (COND
                             ((QEQCAR |pp| 1)
                              (PROGN (LETT #2# (CONS 1 NIL)) (GO #20=#:G708)))
                             ('T
                              (SEQ (LETT |ppr| (QCDR |pp|))
                                   (LETT |offsets| (QVELT |ppr| 3))
                                   (LETT |oc| (QVSIZE |offsets|))
                                   (LETT |exps| (QVELT |ppr| 4))
                                   (LETT |coeffs| (QVELT |ppr| 5))
                                   (LETT |cc| (QVSIZE |coeffs|))
                                   (LETT |nsols|
                                         (QUOTIENT2 (QVSIZE |offsets|) |m|))
                                   (LETT |ok| 'T) (LETT |kk| 1)
                                   (LETT |ohi|
                                         (SPADCALL |offsets| 1 (QREFELT $ 77)))
                                   (LETT |resv|
                                         (MAKEARR1 |nsols| (MAKE-ARRAY 0)))
                                   (LETT |ii| 1)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |i| 1) (LETT #9# |nsols|) G190
                                          (COND
                                           ((|greater_SI| |i| #9#) (GO G191)))
                                          (SEQ
                                           (LETT |resvi|
                                                 (MAKEARR1 |m|
                                                           (|spadConstant| $
                                                                           109)))
                                           (SEQ (LETT |j| 1) (LETT #8# |m|)
                                                G190
                                                (COND
                                                 ((|greater_SI| |j| #8#)
                                                  (GO G191)))
                                                (SEQ (LETT |lo| |ohi|)
                                                     (LETT |ohi|
                                                           (SEQ
                                                            (LETT |kk|
                                                                  (+ |kk| 1))
                                                            (EXIT
                                                             (COND
                                                              ((<= |kk| |oc|)
                                                               (SPADCALL
                                                                |offsets| |kk|
                                                                (QREFELT $
                                                                         77)))
                                                              ('T |cc|)))))
                                                     (LETT |hi| (- |ohi| 1))
                                                     (EXIT
                                                      (SPADCALL |resvi| |j|
                                                                (SPADCALL
                                                                 |vars| |exps|
                                                                 |coeffs| |lo|
                                                                 |hi|
                                                                 (QREFELT $
                                                                          120))
                                                                (QREFELT $
                                                                         148))))
                                                (LETT |j| (|inc_SI| |j|))
                                                (GO G190) G191 (EXIT NIL))
                                           (LETT |sol_okp|
                                                 (SPADCALL
                                                  (SPADCALL |resvi|
                                                            (QREFELT $ 150))
                                                  |check|))
                                           (EXIT
                                            (COND
                                             ((QEQCAR |sol_okp| 1) "iterate")
                                             ((QEQCAR |sol_okp| 2)
                                              (SEQ (LETT |ok| NIL)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #6# |$NoValue|)
                                                     (GO #21=#:G693)))))
                                             ('T
                                              (SEQ
                                               (SPADCALL |resv| |ii| |resvi|
                                                         (QREFELT $ 152))
                                               (EXIT
                                                (LETT |ii| (+ |ii| 1))))))))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL)))
                                    #21# (EXIT #6#))
                                   (EXIT
                                    (COND
                                     (|ok|
                                      (SEQ
                                       (LETT |mress|
                                             (MAKE_MATRIX1 |m|
                                                           (PROG1
                                                               (LETT #5#
                                                                     (- |ii|
                                                                        1))
                                                             (|check_subtype2|
                                                              (>= #5# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #5#))
                                                           (|spadConstant| $
                                                                           109)))
                                       (SEQ (LETT |i| 1) (LETT #4# (- |ii| 1))
                                            G190
                                            (COND
                                             ((|greater_SI| |i| #4#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (SEQ (LETT |l| 1) (LETT #3# |m|)
                                                   G190
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
                                                                          153))
                                                                |l|
                                                                (QREFELT $ 29))
                                                               (QREFELT $
                                                                        136))))
                                                   (LETT |l| (|inc_SI| |l|))
                                                   (GO G190) G191 (EXIT NIL))))
                                            (LETT |i| (|inc_SI| |i|)) (GO G190)
                                            G191 (EXIT NIL))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# (CONS 0 |mress|))
                                         (GO #20#)))))
                                     ('T
                                      (SEQ
                                       (SPADCALL
                                        (SPADCALL
                                         "check_sol_poly rejected solution"
                                         (QREFELT $ 82))
                                        (QREFELT $ 84))
                                       (SPADCALL
                                        (SPADCALL |resvi| (QREFELT $ 154))
                                        (QREFELT $ 84))
                                       (EXIT (|error| "giving up")))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #20# (EXIT #2#)))) 

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
         ((#3=#:G753 NIL) (#4=#:G763 NIL) (|l| NIL) (#5=#:G762 NIL) (|i| NIL)
          (|mress| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#6=#:G746 NIL) (|ii| (|Integer|)) (|sol_okp| #2#)
          (|s| (|SparseUnivariatePolynomial| (|Integer|))) (#7=#:G761 NIL)
          (|bmij| (|U32Vector|)) (|mm| (|Integer|)) (#8=#:G760 NIL) (|j| NIL)
          (|resvi| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
          (#9=#:G759 NIL)
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
          (|gv| #1#) (|gv0| (|List| (|U32Vector|))) (#12=#:G758 NIL) (|li| NIL)
          (#13=#:G757 NIL) (|pts| (|U32Vector|)) (#14=#:G752 NIL)
          (#15=#:G756 NIL) (|pts0| (|U32Vector|)) (|ve| (|Vector| (|Integer|)))
          (#16=#:G755 NIL) (|d| NIL) (#17=#:G754 NIL)
          (|m| (|NonNegativeInteger|)) (|lp| (|List| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL)
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
                  (EXIT (CONS 1 'T))))
                (LETT |m| (LENGTH |degs|))
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #17# NIL)
                        (SEQ (LETT |d| NIL) (LETT #16# |degs|) G190
                             (COND
                              ((OR (ATOM #16#)
                                   (PROGN (LETT |d| (CAR #16#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #17# (CONS |d| #17#))))
                             (LETT #16# (CDR #16#)) (GO G190) G191
                             (EXIT (NREVERSE #17#))))
                       (QREFELT $ 66)))
                (LETT |pts|
                      (COND ((EQUAL |kind| '|diffHP|) (GETREFV_U32 0 0))
                            (#18='T
                             (SEQ
                              (EXIT
                               (COND
                                ((EQUAL |kind| '|shiftHP|)
                                 (PROGN
                                  (LETT #14#
                                        (SEQ
                                         (LETT |pts0| (GETREFV_U32 |sigma| 0))
                                         (SEQ (LETT |i| 0)
                                              (LETT #15# (- |sigma| 1)) G190
                                              (COND
                                               ((|greater_SI| |i| #15#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (SETELT_U32 |pts0| |i| |i|)))
                                              (LETT |i| (|inc_SI| |i|))
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT |pts0|)))
                                  (GO #19=#:G729)))))
                              #19# (EXIT #14#)))))
                (LETT |gv0|
                      (PROGN
                       (LETT #13# NIL)
                       (SEQ (LETT |li| NIL) (LETT #12# |list|) G190
                            (COND
                             ((OR (ATOM #12#)
                                  (PROGN (LETT |li| (CAR #12#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #13#
                                    (CONS (SPADCALL |li| (QREFELT $ 158))
                                          #13#))))
                            (LETT #12# (CDR #12#)) (GO G190) G191
                            (EXIT (NREVERSE #13#)))))
                (LETT |gv| (SPADCALL |gv0| |prime| 1 |gen|))
                (LETT |blr|
                      (SPADCALL |gv| |ve| |sigma| |pts| |prime| |kind|
                                (QREFELT $ 76)))
                (EXIT
                 (COND
                  ((QEQCAR |blr| 1)
                   (PROGN (LETT #3# (CONS 1 NIL)) (GO #20=#:G751)))
                  (#18#
                   (SEQ (LETT |rblr| (QCDR |blr|)) (LETT |bm| (QVELT |rblr| 0))
                        (LETT |va| (QVELT |rblr| 1))
                        (LETT |nsols| (QVSIZE |va|))
                        (LETT |resv| (MAKEARR1 |nsols| (MAKE-ARRAY 0)))
                        (LETT |ii| 1)
                        (SEQ (LETT |i| 1) (LETT #9# |nsols|) G190
                             (COND ((|greater_SI| |i| #9#) (GO G191)))
                             (SEQ
                              (LETT |resvi|
                                    (MAKEARR1 |m| (|spadConstant| $ 92)))
                              (SEQ (LETT |j| 1) (LETT #8# |m|) G190
                                   (COND ((|greater_SI| |j| #8#) (GO G191)))
                                   (SEQ
                                    (LETT |mm|
                                          (SPADCALL |ve| |j| (QREFELT $ 77)))
                                    (LETT |bmij|
                                          (SPADCALL |bm| |i| |j|
                                                    (QREFELT $ 87)))
                                    (LETT |s| (|spadConstant| $ 92))
                                    (SEQ (LETT |l| 0) (LETT #7# |mm|) G190
                                         (COND
                                          ((|greater_SI| |l| #7#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |s|
                                                 (SPADCALL |s|
                                                           (SPADCALL
                                                            (ELT_U32 |bmij|
                                                                     |l|)
                                                            |l| (QREFELT $ 93))
                                                           (QREFELT $ 94)))))
                                         (LETT |l| (|inc_SI| |l|)) (GO G190)
                                         G191 (EXIT NIL))
                                    (EXIT
                                     (SPADCALL |resvi| |j| |s|
                                               (QREFELT $ 95))))
                                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |sol_okp|
                                    (SPADCALL (SPADCALL |resvi| (QREFELT $ 97))
                                              |check|))
                              (EXIT
                               (COND ((QEQCAR |sol_okp| 1) "iterate")
                                     ((QEQCAR |sol_okp| 2)
                                      (|error|
                                       "HP_solve_M: check should never return no_solution for finite fields"))
                                     ('T
                                      (SEQ
                                       (SPADCALL |resv| |ii| |resvi|
                                                 (QREFELT $ 99))
                                       (EXIT (LETT |ii| (+ |ii| 1))))))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (LETT |mress|
                              (MAKE_MATRIX1 |m|
                                            (PROG1 (LETT #6# (- |ii| 1))
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))
                                            (|spadConstant| $ 92)))
                        (SEQ (LETT |i| 1) (LETT #5# (- |ii| 1)) G190
                             (COND ((|greater_SI| |i| #5#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| 1) (LETT #4# |m|) G190
                                    (COND ((|greater_SI| |l| #4#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |mress| |l| |i|
                                                (SPADCALL
                                                 (SPADCALL |resv| |i|
                                                           (QREFELT $ 100))
                                                 |l| (QREFELT $ 9))
                                                (QREFELT $ 102))))
                                    (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (PROGN (LETT #3# (CONS 0 |mress|)) (GO #20#)))))))))
          #20# (EXIT #3#)))) 

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
         (PROG (#1=#:G781)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ModularHermitePade|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularHermitePade|
                             (LIST
                              (CONS NIL (CONS 1 (|ModularHermitePade;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ModularHermitePade|)))))))))) 

(DEFUN |ModularHermitePade;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularHermitePade|))
          (LETT $ (GETREFV 169))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (29 . |leadingCoefficient|) (|List| 74) (|List| 7)
              (|PolynomialEvaluationUtilities|) (34 . |modpeval|)
              (42 . |reductum|) (|Vector| 17) (47 . |elt|)
              |MODHP;VSUPPI_to_VPA;VLLIV;3| (|Fraction| 7) (53 . |Zero|)
              (57 . |numer|) (62 . |positiveRemainder|) (68 . |denom|)
              (|SingleInteger|) (73 . |invmod|) (|Union| 59 '"failed")
              (|List| (|List| 31)) |MODHP;LLFI_to_LPA;L2IU;4| (|Fraction| 21)
              (79 . |numer|) (84 . |denom|) (|List| 141)
              |MODHP;LLFPI_to_LPA;LILLIU;5| (89 . |zero?|) (94 . |degree|)
              (99 . |leadingCoefficient|) (104 . |reductum|) (109 . |coerce|)
              (|SparseUnivariatePolynomial| 31) (|Mapping| 31 7)
              (|SparseUnivariatePolynomialFunctions2| 7 31) (114 . |map|)
              (120 . |elt|) (126 . |One|) (|Void|) (130 . |truncated_mul_add|)
              (|List| 10) (|Mapping| 13 59 7 7) |MODHP;check_sol1a;VLM3IUv;9|
              (139 . +) (|Mapping| 7 7 7) (145 . |reduce|) (|Vector| 7)
              (151 . |vector|) (156 . |Zero|) (|IntegerPrimesPackage| 7)
              (160 . |nextPrime|) (165 . |member?|) (171 . |coerce|)
              (|Record| (|:| |basis| 86) (|:| |defects| 65) (|:| |cinds| 65))
              (|Union| 72 '"no_solution") (|Symbol|)
              (|InnerModularHermitePade|) (176 . |do_modular_solve|)
              (186 . |elt|) (|VectorIntegerReconstructor|) (192 . |empty|)
              (|String|) (|OutputForm|) (197 . |message|) (|PrintPackage|)
              (202 . |print|) (207 . |coerce|) (|TwoDimensionalArray| 10)
              (212 . |elt|) (219 . |chinese_update|) (226 . |setelt!|)
              (|Union| 119 '"failed") (233 . |reconstruct|) (239 . |Zero|)
              (243 . |monomial|) (249 . +) (255 . |setelt!|) (|List| 6)
              (262 . |entries|) (|Vector| 8) (267 . |setelt!|) (274 . |elt|)
              (|Matrix| 6) (280 . |setelt!|) (|Union| 101 19)
              (|Union| '#1="good" '#2="reject" '#3="no_solution")
              (|Mapping| 104 96) |MODHP;HP_solve_I;LLSNniMMU;10|
              (288 . |variables|) (293 . |setUnion|) (299 . |Zero|)
              (303 . |monomial|) (309 . +) (315 . |Zero|) (319 . |coerce|)
              (324 . |One|) (328 . |monomial|) (335 . *) (341 . +)
              (|SortedExponentVector|) (|PrimitiveArray| 7)
              |MODHP;unpack_poly;LSevPa2ISup;12| (347 . |coerce|)
              (|SparseUnivariatePolynomial| 41) (|Mapping| 41 21)
              (|SparseUnivariatePolynomialFunctions2| 21 41) (352 . |map|)
              (358 . |zero?|) (363 . |degree|) (368 . |leadingCoefficient|)
              (373 . |reductum|) (378 . |retract|) (383 . |monomial|) (389 . +)
              (395 . |Zero|) (399 . |elt|) (|Matrix| 17) (406 . |setelt!|)
              (414 . |member?|) (420 . |sort|) |MODHP;get_variables;L2SL;18|
              (425 . |One|) (|List| 41) (|PrimitiveArray| 41)
              (429 . |construct|)
              (|Record| (|:| |defects| 65) (|:| |cinds| 65) (|:| |rowlen| 7)
                        (|:| |offsetdata| 65) (|:| |expdata| 118)
                        (|:| |coeffdata| 119))
              (|Union| 144 '"no_solution") (|List| 142)
              (434 . |do_poly_integer|) (446 . |setelt!|) (|List| 17)
              (453 . |entries|) (|Vector| 28) (458 . |setelt!|) (465 . |elt|)
              (471 . |coerce|) (|Union| 135 19) (|Mapping| 104 149)
              |MODHP;HP_solve_P;LL2SNniMMU;19| (476 . |construct|) (|List| 24)
              |MODHP;HP_solve_M;LLSINniMMU;20|
              (|Union|
               (|Matrix| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
               19)
              (|List| (|List| (|AlgebraicNumber|)))
              (|Mapping| 104
                         (|List|
                          (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
              |MODHP;HP_solve_A;LLSNniMMU;21|
              (|Union|
               (|Matrix|
                (|SparseUnivariatePolynomial|
                 (|Polynomial| (|AlgebraicNumber|))))
               19)
              (|List| (|List| (|Fraction| (|Polynomial| (|AlgebraicNumber|)))))
              (|Mapping| 104
                         (|List|
                          (|SparseUnivariatePolynomial|
                           (|Polynomial| (|AlgebraicNumber|)))))
              |MODHP;HP_solve_PA;LL2SNniMMU;22|)
           '#(|unpack_poly| 481 |get_variables| 490 |check_sol1a| 497
              |VSUPPI_to_VPA| 507 |VSUPI_to_VPA| 515 |LLFPI_to_LPA| 521
              |LLFI_to_LPA| 530 |HP_solve_PA| 537 |HP_solve_P| 548 |HP_solve_M|
              559 |HP_solve_I| 570 |HP_solve_A| 580)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|HP_solve_I|
                                 ((|Union|
                                   (|Matrix|
                                    (|SparseUnivariatePolynomial| (|Integer|)))
                                   (|Boolean|))
                                  (|List| (|List| (|Fraction| (|Integer|))))
                                  (|List| (|Integer|)) (|Symbol|)
                                  (|NonNegativeInteger|)
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Union| #1# #2# #3#)
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (|Integer|))))))
                                T)
                              '((|HP_solve_A|
                                 ((|Union|
                                   (|Matrix|
                                    (|SparseUnivariatePolynomial|
                                     (|AlgebraicNumber|)))
                                   (|Boolean|))
                                  (|List| (|List| (|AlgebraicNumber|)))
                                  (|List| (|Integer|)) (|Symbol|)
                                  (|NonNegativeInteger|)
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Union| #1# #2# #3#)
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (|AlgebraicNumber|))))))
                                T)
                              '((|HP_solve_P|
                                 ((|Union|
                                   (|Matrix|
                                    (|SparseUnivariatePolynomial|
                                     (|Polynomial| (|Integer|))))
                                   (|Boolean|))
                                  (|List|
                                   (|List|
                                    (|Fraction| (|Polynomial| (|Integer|)))))
                                  (|List| (|Integer|)) (|Symbol|) (|Symbol|)
                                  (|NonNegativeInteger|)
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Union| #1# #2# #3#)
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (|Polynomial| (|Integer|)))))))
                                T)
                              '((|HP_solve_PA|
                                 ((|Union|
                                   (|Matrix|
                                    (|SparseUnivariatePolynomial|
                                     (|Polynomial| (|AlgebraicNumber|))))
                                   (|Boolean|))
                                  (|List|
                                   (|List|
                                    (|Fraction|
                                     (|Polynomial| (|AlgebraicNumber|)))))
                                  (|List| (|Integer|)) (|Symbol|) (|Symbol|)
                                  (|NonNegativeInteger|)
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Union| #1# #2# #3#)
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (|Polynomial|
                                                (|AlgebraicNumber|)))))))
                                T)
                              '((|HP_solve_M|
                                 ((|Union|
                                   (|Matrix|
                                    (|SparseUnivariatePolynomial| (|Integer|)))
                                   (|Boolean|))
                                  (|List| (|List| (|Integer|)))
                                  (|List| (|Integer|)) (|Symbol|) (|Integer|)
                                  (|NonNegativeInteger|)
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Union| #1# #2# #3#)
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (|Integer|))))))
                                T)
                              '((|check_sol1a|
                                 ((|U32Vector|) (|Vector| (|U32Vector|))
                                  (|List| (|U32Vector|))
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Integer|) (|Integer|) (|Integer|)))
                                T)
                              '((|VSUPI_to_VPA|
                                 ((|Vector| (|U32Vector|))
                                  (|Vector|
                                   (|SparseUnivariatePolynomial| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|VSUPPI_to_VPA|
                                 ((|Vector| (|U32Vector|))
                                  (|Vector|
                                   (|SparseUnivariatePolynomial|
                                    (|Polynomial| (|Integer|))))
                                  (|List| (|Symbol|)) (|List| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|LLFI_to_LPA|
                                 ((|Union| (|List| (|U32Vector|)) "failed")
                                  (|List| (|List| (|Fraction| (|Integer|))))
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|LLFPI_to_LPA|
                                 ((|Union| (|List| (|U32Vector|)) "failed")
                                  (|List|
                                   (|List|
                                    (|Fraction| (|Polynomial| (|Integer|)))))
                                  (|Integer|) (|List| (|Symbol|))
                                  (|List| (|Integer|)) (|Integer|)))
                                T)
                              '((|get_variables|
                                 ((|List| (|Symbol|))
                                  (|List|
                                   (|List|
                                    (|Fraction| (|Polynomial| (|Integer|)))))
                                  (|Symbol|) (|Symbol|)))
                                T)
                              '((|unpack_poly|
                                 ((|SparseUnivariatePolynomial|
                                   (|Polynomial| (|Integer|)))
                                  (|List| (|Symbol|)) (|SortedExponentVector|)
                                  (|PrimitiveArray| (|Integer|)) (|Integer|)
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 168
                                            '(2 8 6 0 7 9 2 11 10 6 7 12 3 13
                                              10 0 7 10 14 1 17 16 0 18 1 17 19
                                              0 20 1 17 21 0 22 4 25 7 21 23 24
                                              7 26 1 17 0 0 27 2 28 17 0 7 29 0
                                              31 0 32 1 31 7 0 33 2 7 0 0 0 34
                                              1 31 7 0 35 2 36 0 0 0 37 1 41 21
                                              0 42 1 41 21 0 43 1 6 19 0 46 1 6
                                              16 0 47 1 6 7 0 48 1 6 0 0 49 1
                                              31 0 7 50 2 53 51 52 6 54 2 13 10
                                              0 7 55 0 51 0 56 5 11 57 10 10 10
                                              7 7 58 2 7 0 0 0 62 2 24 7 63 0
                                              64 1 65 0 24 66 0 51 0 67 1 68 7
                                              7 69 2 24 19 7 0 70 1 36 0 7 71 6
                                              75 73 13 65 16 10 7 74 76 2 65 7
                                              0 7 77 1 78 0 7 79 1 81 0 80 82 1
                                              83 57 81 84 1 7 81 0 85 3 86 10 0
                                              7 7 87 3 78 57 10 7 0 88 3 65 7 0
                                              7 7 89 2 78 90 0 65 91 0 6 0 92 2
                                              6 0 7 16 93 2 6 0 0 0 94 3 8 6 0
                                              7 6 95 1 8 96 0 97 3 98 8 0 7 8
                                              99 2 98 8 0 7 100 4 101 6 0 7 7 6
                                              102 1 21 23 0 107 2 23 0 0 0 108
                                              0 17 0 109 2 17 0 21 16 110 2 17
                                              0 0 0 111 0 21 0 112 1 21 0 7 113
                                              0 21 0 114 3 21 0 0 74 16 115 2
                                              21 0 0 0 116 2 21 0 0 0 117 1 41
                                              0 21 121 2 124 122 123 17 125 1
                                              122 19 0 126 1 122 16 0 127 1 122
                                              41 0 128 1 122 0 0 129 1 41 31 0
                                              130 2 51 0 31 16 131 2 51 0 0 0
                                              132 0 122 0 133 3 101 6 0 7 7 134
                                              4 135 17 0 7 7 17 136 2 23 19 74
                                              0 137 1 23 0 0 138 0 122 0 140 1
                                              142 0 141 143 8 75 145 23 146 65
                                              16 10 74 74 60 147 3 28 17 0 7 17
                                              148 1 28 149 0 150 3 151 28 0 7
                                              28 152 2 151 28 0 7 153 1 28 81 0
                                              154 1 10 0 24 158 5 0 17 23 118
                                              119 7 7 120 3 0 23 44 74 74 139 6
                                              0 10 13 59 60 7 7 7 61 4 0 13 28
                                              23 24 7 30 2 0 13 8 7 15 5 0 38
                                              44 7 23 24 7 45 3 0 38 39 7 7 40
                                              7 0 165 166 24 74 74 16 60 167
                                              168 7 0 155 44 24 74 74 16 60 156
                                              157 7 0 103 159 24 74 7 16 60 105
                                              160 6 0 103 39 24 74 16 60 105
                                              106 6 0 161 162 24 74 16 60 163
                                              164)))))
           '|lookupComplete|)) 

(MAKEPROP '|ModularHermitePade| 'NILADIC T) 
