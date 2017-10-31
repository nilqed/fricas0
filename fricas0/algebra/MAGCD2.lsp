
(SDEFUN |MAGCD2;algebraicGcd1a|
        ((|x| MP) (|y| MP) (|mu| MD) (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         ($ |Union| MPT "failed"))
        (SPROG
         ((|yu| (MPT)) (|xu| (MPT)) (#1=#:G735 NIL) (|w1| (MPT))
          (|yuu| #2=(|Union| MPT "failed")) (|xuu| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |xuu| (SPADCALL |x| |vx| |lvz| |mu| (QREFELT $ 15))
                  . #3=(|MAGCD2;algebraicGcd1a|))
            (EXIT
             (COND ((QEQCAR |xuu| 1) (CONS 1 "failed"))
                   (#4='T
                    (SEQ (LETT |xu| (QCDR |xuu|) . #3#)
                         (LETT |yuu|
                               (SPADCALL |y| |vx| |lvz| |mu| (QREFELT $ 15))
                               . #3#)
                         (EXIT
                          (COND ((QEQCAR |yuu| 1) (CONS 1 "failed"))
                                (#4#
                                 (SEQ (LETT |yu| (QCDR |yuu|) . #3#)
                                      (EXIT
                                       (SEQ G190 NIL
                                            (SEQ
                                             (LETT |w1|
                                                   (SPADCALL |xu| |yu| |mu|
                                                             (QREFELT $ 16))
                                                   . #3#)
                                             (EXIT
                                              (COND
                                               ((SPADCALL |w1| (QREFELT $ 18))
                                                (PROGN
                                                 (LETT #1#
                                                       (SPADCALL |yu| |mu|
                                                                 (QREFELT $
                                                                          19))
                                                       . #3#)
                                                 (GO #5=#:G734)))
                                               ('T
                                                (SEQ (LETT |xu| |yu| . #3#)
                                                     (EXIT
                                                      (LETT |yu| |w1|
                                                            . #3#)))))))
                                            NIL (GO G190) G191
                                            (EXIT NIL)))))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |MAGCD2;compare_coeff1|
        ((|nv| |Integer|) (|exps| |SortedExponentVector|)
         (|nexps| |SortedExponentVector|) ($ |Integer|))
        (SPROG
         ((#1=#:G744 NIL) (#2=#:G745 NIL) (#3=#:G746 NIL) (|i| NIL)
          (|nn| #4=(|Integer|)) (|ne| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ne| (- (QV_LEN_U32 |exps|) |nv|)
                  . #5=(|MAGCD2;compare_coeff1|))
            (LETT |nn| (- (QV_LEN_U32 |nexps|) |nv|) . #5#)
            (SEQ (LETT |i| 0 . #5#) (LETT #3# (- |nv| 1) . #5#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((< (ELT_U32 |nexps| (+ |nn| |i|))
                        (ELT_U32 |exps| (+ |ne| |i|)))
                     (PROGN (LETT #2# -1 . #5#) (GO #6=#:G743)))
                    ('T
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (ELT_U32 |nexps| (+ |nn| |i|))
                                   (ELT_U32 |exps| (+ |ne| |i|))
                                   (QREFELT $ 21))
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# 1 . #5#) (GO #6#)) . #5#)
                          (GO #7=#:G739)))))
                      #7# (EXIT #1#))))))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #6# (EXIT #2#)))) 

(SDEFUN |MAGCD2;algebraicGcd1|
        ((|x| MP) (|y| MP) (|lm| |List| MP)
         (|pss| |Record| (|:| |degx| (|Integer|)) (|:| |degy| (|Integer|))
          (|:| |degg| (|Integer|)) (|:| |sizem| #1=(|Integer|))
          (|:| |sldeg| (|List| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))
          (|:| |coeffdata| (|U32Vector|)) (|:| |svx| #2=(|Symbol|))
          (|:| |svz| #3=(|List| (|Symbol|)))
          (|:| |offsetdata| #4=(|Vector| (|Integer|)))
          (|:| |pss1|
               (|Record| (|:| |prime| #5=(|Integer|))
                         (|:| |eval1coeffbuf| (|U32Vector|))
                         (|:| |eval1expbuf| (|SortedExponentVector|)))))
         ($ |Union|
          (|Record| (|:| |nvars| (|Integer|))
                    (|:| |offsetdata| (|Vector| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|U32Vector|)))
          "failed"))
        (SPROG
         ((|offsets| #4#) (|nsize| (|NonNegativeInteger|)) (|msize| #1#)
          (|dg| (|Integer|)) (|res1| (MPT)) (|pres| (|Union| MPT "failed"))
          (|mu| (MD)) (|mdp| (|Union| MD "failed")) (|lvz| #3#) (|vx| #2#)
          (|p| #5#))
         (SEQ
          (LETT |p| (QVELT (QVELT |pss| 10) 0) . #6=(|MAGCD2;algebraicGcd1|))
          (LETT |vx| (QVELT |pss| 7) . #6#) (LETT |lvz| (QVELT |pss| 8) . #6#)
          (LETT |mdp| (SPADCALL |lm| |lvz| |p| (QREFELT $ 24)) . #6#)
          (EXIT
           (COND ((QEQCAR |mdp| 1) (CONS 1 "failed"))
                 (#7='T
                  (SEQ (LETT |mu| (QCDR |mdp|) . #6#)
                       (LETT |pres|
                             (|MAGCD2;algebraicGcd1a| |x| |y| |mu| |vx| |lvz|
                              $)
                             . #6#)
                       (EXIT
                        (COND ((QEQCAR |pres| 1) (CONS 1 "failed"))
                              (#7#
                               (SEQ (LETT |res1| (QCDR |pres|) . #6#)
                                    (LETT |dg| (SPADCALL |res1| (QREFELT $ 25))
                                          . #6#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |dg| (QVELT |pss| 2)
                                                 (QREFELT $ 21))
                                       (CONS 1 "failed"))
                                      (#7#
                                       (SEQ
                                        (LETT |msize| (QVELT |pss| 3) . #6#)
                                        (COND
                                         ((< |dg| (QVELT |pss| 2))
                                          (SEQ (QSETVELT |pss| 2 |dg|)
                                               (LETT |nsize|
                                                     (* (+ |dg| 1) |msize|)
                                                     . #6#)
                                               (QSETVELT |pss| 5
                                                         (SPADCALL |dg| |msize|
                                                                   |mu|
                                                                   (QREFELT $
                                                                            27)))
                                               (EXIT
                                                (QSETVELT |pss| 6
                                                          (GETREFV_U32 |nsize|
                                                                       0))))))
                                        (SPADCALL |res1| (QVELT |pss| 6) |dg|
                                                  |mu| (QREFELT $ 30))
                                        (LETT |offsets| (QVELT |pss| 9) . #6#)
                                        (EXIT
                                         (CONS 0
                                               (VECTOR 1 |offsets|
                                                       (QVELT |pss| 5)
                                                       (QVELT |pss|
                                                              6))))))))))))))))))) 

(SDEFUN |MAGCD2;algebraicGcd2|
        ((|x| MP) (|y| MP) (|lm| |List| MP) (|lv| |List| (|Symbol|))
         (|pss| |Record| (|:| |degx| #1=(|Integer|))
          (|:| |degy| #2=(|Integer|)) (|:| |degg| #3=(|Integer|))
          (|:| |sizem| (|Integer|)) (|:| |sldeg| (|List| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))
          (|:| |coeffdata| (|U32Vector|)) (|:| |svx| #4=(|Symbol|))
          (|:| |svz| (|List| (|Symbol|)))
          (|:| |offsetdata| #5=(|Vector| (|Integer|)))
          (|:| |pss1|
               #6=(|Record| (|:| |prime| #7=(|Integer|))
                            (|:| |eval1coeffbuf| (|U32Vector|))
                            (|:| |eval1expbuf| (|SortedExponentVector|)))))
         ($
          . #8=(|Union|
                (|Record| (|:| |nvars| (|Integer|))
                          (|:| |offsetdata| (|Vector| (|Integer|)))
                          (|:| |expdata| (|SortedExponentVector|))
                          (|:| |coeffdata| (|U32Vector|)))
                "failed")))
        (SPROG
         ((#9=#:G816 NIL)
          (|pp|
           (|Union|
            (|Record| (|:| |nvars| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed"))
          (|good_cnt| (|Integer|)) (|coeffs| (|U32Vector|)) (|i| (|Integer|))
          (|jl| (|Integer|)) (|ndl| #10=(|List| (|Integer|))) (#11=#:G822 NIL)
          (|j| NIL) (|ncoeffs| (|U32Vector|)) (|n1| (|NonNegativeInteger|))
          (|nn| (|NonNegativeInteger|)) (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorModularReconstructor|))
          (|ncc| (|NonNegativeInteger|)) (|exps| (|SortedExponentVector|))
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #10#) (|dl| (|List| (|List| (|Integer|))))
          (|bad_cnt| (|Integer|)) (|cc| (|Integer|)) (|dg| #3#)
          (|nexps| (|SortedExponentVector|))
          (|gtf|
           (|Record| (|:| |nvars| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (#12=#:G813 NIL) (|gtfp| #8#) (#13=#:G814 NIL) (|lcbad| (|Boolean|))
          (#14=#:G819 NIL) (|m| NIL) (#15=#:G820 NIL) (|deg| NIL)
          (#16=#:G821 NIL) (|z| NIL) (|lmt| (|List| MP)) (#17=#:G818 NIL)
          (#18=#:G817 NIL) (|yt| (MP)) (|xt| (MP)) (|lt| (|List| (|Integer|)))
          (|t| (|Integer|)) (|nbv| #19=(|NonNegativeInteger|))
          (|nlv| (|List| (|Symbol|))) (|vt| (|Symbol|)) (|dy| #2#) (|dx| #1#)
          (|offsets| #5#) (|vx| #4#) (|p| #7#) (|pss1| #6#) (|nv| #19#))
         (SEQ
          (EXIT
           (SEQ (LETT |nv| (LENGTH |lv|) . #20=(|MAGCD2;algebraicGcd2|))
                (EXIT
                 (COND
                  ((EQL |nv| 0) (|MAGCD2;algebraicGcd1| |x| |y| |lm| |pss| $))
                  ('T
                   (SEQ (LETT |pss1| (QVELT |pss| 10) . #20#)
                        (LETT |p| (QVELT |pss1| 0) . #20#)
                        (LETT |vx| (QVELT |pss| 7) . #20#)
                        (LETT |offsets| (QVELT |pss| 9) . #20#)
                        (LETT |lt| NIL . #20#)
                        (LETT |exps| (GETREFV_U32 0 0) . #20#)
                        (LETT |dx| (QVELT |pss| 0) . #20#)
                        (LETT |dy| (QVELT |pss| 1) . #20#)
                        (LETT |dg| (QVELT |pss| 2) . #20#)
                        (LETT |vt| (|SPADfirst| |lv|) . #20#)
                        (LETT |nlv| (CDR |lv|) . #20#)
                        (LETT |nbv| (LENGTH (QVELT |pss| 8)) . #20#)
                        (LETT |good_cnt| 0 . #20#) (LETT |bad_cnt| 0 . #20#)
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ (LETT |t| (RANDOM |p|) . #20#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |t| |lt| (QREFELT $ 32))
                                      "iterate")
                                     ('T
                                      (SEQ (LETT |lt| (CONS |t| |lt|) . #20#)
                                           (LETT |xt|
                                                 (SPADCALL |x| |vt| |t| |pss1|
                                                           (QREFELT $ 34))
                                                 . #20#)
                                           (LETT |yt|
                                                 (SPADCALL |y| |vt| |t| |pss1|
                                                           (QREFELT $ 34))
                                                 . #20#)
                                           (LETT |lmt|
                                                 (PROGN
                                                  (LETT #18# NIL . #20#)
                                                  (SEQ (LETT |m| NIL . #20#)
                                                       (LETT #17# |lm| . #20#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #17#)
                                                             (PROGN
                                                              (LETT |m|
                                                                    (CAR #17#)
                                                                    . #20#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #18#
                                                               (CONS
                                                                (SPADCALL |m|
                                                                          |vt|
                                                                          |t|
                                                                          |pss1|
                                                                          (QREFELT
                                                                           $
                                                                           34))
                                                                #18#)
                                                               . #20#)))
                                                       (LETT #17# (CDR #17#)
                                                             . #20#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #18#))))
                                                 . #20#)
                                           (LETT |lcbad| NIL . #20#)
                                           (SEQ (LETT |z| NIL . #20#)
                                                (LETT #16# (QVELT |pss| 8)
                                                      . #20#)
                                                (LETT |deg| NIL . #20#)
                                                (LETT #15# (QVELT |pss| 4)
                                                      . #20#)
                                                (LETT |m| NIL . #20#)
                                                (LETT #14# |lmt| . #20#) G190
                                                (COND
                                                 ((OR (ATOM #14#)
                                                      (PROGN
                                                       (LETT |m| (CAR #14#)
                                                             . #20#)
                                                       NIL)
                                                      (ATOM #15#)
                                                      (PROGN
                                                       (LETT |deg| (CAR #15#)
                                                             . #20#)
                                                       NIL)
                                                      (ATOM #16#)
                                                      (PROGN
                                                       (LETT |z| (CAR #16#)
                                                             . #20#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (COND
                                                   ((<
                                                     (SPADCALL |m| |z|
                                                               (QREFELT $ 36))
                                                     |deg|)
                                                    (LETT |lcbad| 'T
                                                          . #20#)))))
                                                (LETT #14#
                                                      (PROG1 (CDR #14#)
                                                        (LETT #15#
                                                              (PROG1 (CDR #15#)
                                                                (LETT #16#
                                                                      (CDR
                                                                       #16#)
                                                                      . #20#))
                                                              . #20#))
                                                      . #20#)
                                                (GO G190) G191 (EXIT NIL))
                                           (COND
                                            ((OR |lcbad|
                                                 (<
                                                  (SPADCALL |xt| |vx|
                                                            (QREFELT $ 36))
                                                  |dx|))
                                             (EXIT
                                              (SEQ
                                               (EXIT
                                                (SEQ
                                                 (LETT |bad_cnt|
                                                       (+ |bad_cnt| 1) . #20#)
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |bad_cnt|
                                                              (+ |good_cnt| 2)
                                                              (QREFELT $ 21))
                                                    (PROGN
                                                     (LETT #13#
                                                           (PROGN
                                                            (LETT #9#
                                                                  (CONS 1
                                                                        #21="failed")
                                                                  . #20#)
                                                            (GO #22=#:G812))
                                                           . #20#)
                                                     (GO #23=#:G775)))))))
                                               #23# (EXIT #13#))))
                                            ((<
                                              (SPADCALL |yt| |vx|
                                                        (QREFELT $ 36))
                                              |dy|)
                                             (EXIT
                                              (SEQ
                                               (LETT |bad_cnt| (+ |bad_cnt| 1)
                                                     . #20#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |bad_cnt|
                                                            (+ |good_cnt| 2)
                                                            (QREFELT $ 21))
                                                  (PROGN
                                                   (LETT #9# (CONS 1 #21#)
                                                         . #20#)
                                                   (GO #22#)))))))))
                                           (LETT |gtfp|
                                                 (|MAGCD2;algebraicGcd2| |xt|
                                                  |yt| |lmt| |nlv| |pss| $)
                                                 . #20#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |gtfp| 1)
                                              (SEQ
                                               (EXIT
                                                (SEQ
                                                 (LETT |bad_cnt|
                                                       (+ |bad_cnt| 1) . #20#)
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |bad_cnt|
                                                              (+ |good_cnt| 2)
                                                              (QREFELT $ 21))
                                                    (PROGN
                                                     (LETT #12#
                                                           (PROGN
                                                            (LETT #9#
                                                                  (CONS 1
                                                                        "failed")
                                                                  . #20#)
                                                            (GO #22#))
                                                           . #20#)
                                                     (GO #24=#:G780)))))))
                                               #24# (EXIT #12#)))
                                             ('T
                                              (SEQ
                                               (LETT |gtf| (QCDR |gtfp|)
                                                     . #20#)
                                               (LETT |nexps| (QVELT |gtf| 2)
                                                     . #20#)
                                               (LETT |coeffs| (QVELT |gtf| 3)
                                                     . #20#)
                                               (EXIT
                                                (COND
                                                 ((EQL (QVELT |pss| 2) 0)
                                                  (PROGN
                                                   (LETT #9#
                                                         (CONS 0
                                                               (VECTOR
                                                                (+
                                                                 (+ |nv| |nbv|)
                                                                 1)
                                                                (MAKEARR1 1 0)
                                                                (GETREFV_U32
                                                                 (+
                                                                  (+ |nv|
                                                                     |nbv|)
                                                                  1)
                                                                 0)
                                                                (GETREFV_U32 1
                                                                             1)))
                                                         . #20#)
                                                   (GO #22#)))
                                                 ('T
                                                  (SEQ
                                                   (COND
                                                    ((OR
                                                      (< (QVELT |pss| 2) |dg|)
                                                      (SPADCALL |exps|
                                                                (QREFELT $
                                                                         39)))
                                                     (SEQ
                                                      (LETT |exps| |nexps|
                                                            . #20#)
                                                      (LETT |rstate|
                                                            (SPADCALL
                                                             (QV_LEN_U32
                                                              |coeffs|)
                                                             (QVELT |pss1| 0)
                                                             (QREFELT $ 38))
                                                            . #20#)
                                                      (LETT |bad_cnt| 0 . #20#)
                                                      (EXIT
                                                       (LETT |good_cnt| 0
                                                             . #20#)))))
                                                   (COND
                                                    ((< (QVELT |pss| 2) |dg|)
                                                     (LETT |dg| (QVELT |pss| 2)
                                                           . #20#)))
                                                   (LETT |cc|
                                                         (|MAGCD2;compare_coeff1|
                                                          (+ |nv| |nbv|) |exps|
                                                          |nexps| $)
                                                         . #20#)
                                                   (EXIT
                                                    (COND
                                                     ((< |cc| 0)
                                                      (SEQ
                                                       (LETT |bad_cnt|
                                                             (+ |bad_cnt| 1)
                                                             . #20#)
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL |bad_cnt|
                                                                    (+
                                                                     |good_cnt|
                                                                     2)
                                                                    (QREFELT $
                                                                             21))
                                                          (PROGN
                                                           (LETT #9#
                                                                 (CONS 1
                                                                       "failed")
                                                                 . #20#)
                                                           (GO #22#)))))))
                                                     ('T
                                                      (SEQ
                                                       (LETT |dl|
                                                             (SPADCALL
                                                              (+ |nv| |nbv|)
                                                              |offsets| |exps|
                                                              |offsets| |nexps|
                                                              (QREFELT $ 43))
                                                             . #20#)
                                                       (LETT |odl|
                                                             (SPADCALL |dl| 1
                                                                       (QREFELT
                                                                        $ 44))
                                                             . #20#)
                                                       (LETT |ndl|
                                                             (SPADCALL |dl| 2
                                                                       (QREFELT
                                                                        $ 44))
                                                             . #20#)
                                                       (COND
                                                        ((SPADCALL |odl| NIL
                                                                   (QREFELT $
                                                                            45))
                                                         (SEQ
                                                          (LETT |oer|
                                                                (SPADCALL
                                                                 (+ |nv| |nbv|)
                                                                 |odl| |ndl|
                                                                 |offsets|
                                                                 |exps|
                                                                 |offsets|
                                                                 |nexps|
                                                                 (QREFELT $
                                                                          47))
                                                                . #20#)
                                                          (LETT |exps|
                                                                (QCDR |oer|)
                                                                . #20#)
                                                          (LETT |ncc|
                                                                (QUOTIENT2
                                                                 (QV_LEN_U32
                                                                  |exps|)
                                                                 (+ |nv|
                                                                    |nbv|))
                                                                . #20#)
                                                          (LETT |rstate|
                                                                (SPADCALL |ncc|
                                                                          |p|
                                                                          (QREFELT
                                                                           $
                                                                           38))
                                                                . #20#)
                                                          (EXIT
                                                           (LETT |good_cnt| 0
                                                                 . #20#)))))
                                                       (COND
                                                        ((SPADCALL |ndl| NIL
                                                                   (QREFELT $
                                                                            45))
                                                         (SEQ
                                                          (LETT |n0|
                                                                (QV_LEN_U32
                                                                 |coeffs|)
                                                                . #20#)
                                                          (LETT |nn|
                                                                (LENGTH |ndl|)
                                                                . #20#)
                                                          (LETT |n1|
                                                                (+ |n0| |nn|)
                                                                . #20#)
                                                          (LETT |ncoeffs|
                                                                (GETREFV_U32
                                                                 |n1| 0)
                                                                . #20#)
                                                          (LETT |i| 0 . #20#)
                                                          (LETT |jl|
                                                                (|SPADfirst|
                                                                 |ndl|)
                                                                . #20#)
                                                          (SEQ
                                                           (LETT |j| 0 . #20#)
                                                           (LETT #11#
                                                                 (- |n1| 1)
                                                                 . #20#)
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
                                                                      . #20#)
                                                                (EXIT
                                                                 (LETT |jl|
                                                                       (COND
                                                                        ((NULL
                                                                          |ndl|)
                                                                         |n1|)
                                                                        ('T
                                                                         (|SPADfirst|
                                                                          |ndl|)))
                                                                       . #20#))))
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
                                                                       . #20#)))))))
                                                           (LETT |j|
                                                                 (|inc_SI| |j|)
                                                                 . #20#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                          (EXIT
                                                           (LETT |coeffs|
                                                                 |ncoeffs|
                                                                 . #20#)))))
                                                       (SPADCALL |coeffs| |t|
                                                                 |rstate|
                                                                 (QREFELT $
                                                                          48))
                                                       (LETT |good_cnt|
                                                             (+ |good_cnt| 1)
                                                             . #20#)
                                                       (LETT |pp|
                                                             (SPADCALL |rstate|
                                                                       (+ |nv|
                                                                          |nbv|)
                                                                       |offsets|
                                                                       |offsets|
                                                                       |exps|
                                                                       (QREFELT
                                                                        $ 51))
                                                             . #20#)
                                                       (EXIT
                                                        (COND
                                                         ((QEQCAR |pp| 1)
                                                          "iterate")
                                                         ('T
                                                          (PROGN
                                                           (LETT #9#
                                                                 (CONS 0
                                                                       (QCDR
                                                                        |pp|))
                                                                 . #20#)
                                                           (GO
                                                            #22#))))))))))))))))))))))
                              NIL (GO G190) G191 (EXIT NIL)))))))))
          #22# (EXIT #9#)))) 

(SDEFUN |MAGCD2;reconstruct3|
        ((|lv| |List| (|Symbol|)) (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         (|exps| |SortedExponentVector|) (|pp| |PrimitiveArray| (|Integer|))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|pres| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|nlv| (|List| (|Symbol|))))
         (SEQ
          (LETT |nlv| (SPADCALL |lv| (REVERSE |lvz|) (QREFELT $ 55))
                . #1=(|MAGCD2;reconstruct3|))
          (LETT |pres|
                (SPADCALL |nlv| |exps| |pp| 0 (- (QVSIZE |pp|) 1)
                          (QREFELT $ 61))
                . #1#)
          (EXIT (SPADCALL |pres| |vx| (QREFELT $ 63)))))) 

(SDEFUN |MAGCD2;algebraicGcd3a|
        ((|x| MP) (|y| MP) (|lm| |List| MP) (|lv| |List| (|Symbol|))
         (|pss| |Record| (|:| |degx| #1=(|Integer|))
          (|:| |degy| #2=(|Integer|)) (|:| |degg| #3=(|Integer|))
          (|:| |sizem| (|Integer|)) (|:| |sldeg| (|List| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))
          (|:| |coeffdata| (|U32Vector|)) (|:| |svx| #4=(|Symbol|))
          (|:| |svz| #5=(|List| (|Symbol|)))
          (|:| |offsetdata| #6=(|Vector| (|Integer|)))
          (|:| |pss1|
               #7=(|Record| (|:| |prime| (|Integer|))
                            (|:| |eval1coeffbuf| (|U32Vector|))
                            (|:| |eval1expbuf| (|SortedExponentVector|)))))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((#8=#:G870 NIL) (|res| (|Polynomial| (|Integer|)))
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (|coeffs| (|U32Vector|)) (|i| (|Integer|)) (|jl| (|Integer|))
          (|ndl| #9=(|List| (|Integer|))) (#10=#:G876 NIL) (|j| NIL)
          (|ncoeffs| (|U32Vector|)) (|n1| (|NonNegativeInteger|))
          (|nn| (|NonNegativeInteger|)) (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorIntegerReconstructor|)) (#11=#:G849 NIL)
          (|ncc| (|Integer|)) (|exps| (|SortedExponentVector|)) (|offsets| #6#)
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #9#) (|dl| (|List| (|List| (|Integer|)))) (|dg| #3#)
          (|nexps| (|SortedExponentVector|))
          (|gtp|
           (|Record| (|:| |nvars| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (|gtpp|
           (|Union|
            (|Record| (|:| |nvars| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed"))
          (|lcbad| (|Boolean|)) (#12=#:G873 NIL) (|m| NIL) (#13=#:G874 NIL)
          (|deg| NIL) (#14=#:G875 NIL) (|z| NIL) (|lmp| (|List| MP))
          (#15=#:G872 NIL) (#16=#:G871 NIL) (|yp| (MP)) (|xp| (MP))
          (|lp| (|List| (|Integer|))) (|p| (|Integer|))
          (|nv| (|NonNegativeInteger|)) (|nbv| (|Integer|)) (|lvz| #5#)
          (|pss1| #7#) (|vx| #4#) (|dy| #2#) (|dx| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #17=(|MAGCD2;algebraicGcd3a|))
                (LETT |dx| (QVELT |pss| 0) . #17#)
                (LETT |dy| (QVELT |pss| 1) . #17#)
                (LETT |dg| (QVELT |pss| 2) . #17#)
                (LETT |vx| (QVELT |pss| 7) . #17#)
                (LETT |pss1| (QVELT |pss| 10) . #17#)
                (LETT |lvz| (QVELT |pss| 8) . #17#)
                (LETT |nbv| (+ (LENGTH |lvz|) 1) . #17#)
                (LETT |nv| (LENGTH |lv|) . #17#)
                (LETT |offsets| (QVELT |pss| 9) . #17#)
                (LETT |exps| (GETREFV_U32 0 0) . #17#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |p|
                             (SPADCALL (+ (RANDOM 1000000) 500000)
                                       (QREFELT $ 65))
                             . #17#)
                       (EXIT
                        (COND ((SPADCALL |p| |lp| (QREFELT $ 32)) 0)
                              ('T
                               (SEQ (LETT |lp| (CONS |p| |lp|) . #17#)
                                    (QSETVELT |pss1| 0 |p|)
                                    (LETT |xp|
                                          (SPADCALL |x| |p| (QREFELT $ 66))
                                          . #17#)
                                    (LETT |yp|
                                          (SPADCALL |y| |p| (QREFELT $ 66))
                                          . #17#)
                                    (COND
                                     ((< (SPADCALL |xp| |vx| (QREFELT $ 36))
                                         |dx|)
                                      (COND
                                       ((< (SPADCALL |yp| |vx| (QREFELT $ 36))
                                           |dy|)
                                        (EXIT "iterate")))))
                                    (LETT |lmp|
                                          (PROGN
                                           (LETT #16# NIL . #17#)
                                           (SEQ (LETT |m| NIL . #17#)
                                                (LETT #15# |lm| . #17#) G190
                                                (COND
                                                 ((OR (ATOM #15#)
                                                      (PROGN
                                                       (LETT |m| (CAR #15#)
                                                             . #17#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #16#
                                                        (CONS
                                                         (SPADCALL |m| |p|
                                                                   (QREFELT $
                                                                            66))
                                                         #16#)
                                                        . #17#)))
                                                (LETT #15# (CDR #15#) . #17#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #16#))))
                                          . #17#)
                                    (LETT |lcbad| NIL . #17#)
                                    (SEQ (LETT |z| NIL . #17#)
                                         (LETT #14# |lvz| . #17#)
                                         (LETT |deg| NIL . #17#)
                                         (LETT #13# (QVELT |pss| 4) . #17#)
                                         (LETT |m| NIL . #17#)
                                         (LETT #12# |lmp| . #17#) G190
                                         (COND
                                          ((OR (ATOM #12#)
                                               (PROGN
                                                (LETT |m| (CAR #12#) . #17#)
                                                NIL)
                                               (ATOM #13#)
                                               (PROGN
                                                (LETT |deg| (CAR #13#) . #17#)
                                                NIL)
                                               (ATOM #14#)
                                               (PROGN
                                                (LETT |z| (CAR #14#) . #17#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((<
                                              (SPADCALL |m| |z| (QREFELT $ 36))
                                              |deg|)
                                             (LETT |lcbad| 'T . #17#)))))
                                         (LETT #12#
                                               (PROG1 (CDR #12#)
                                                 (LETT #13#
                                                       (PROG1 (CDR #13#)
                                                         (LETT #14# (CDR #14#)
                                                               . #17#))
                                                       . #17#))
                                               . #17#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND (|lcbad| "iterate")
                                           ('T
                                            (SEQ
                                             (LETT |gtpp|
                                                   (|MAGCD2;algebraicGcd2| |xp|
                                                    |yp| |lmp| |lv| |pss| $)
                                                   . #17#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |gtpp| 1) "iterate")
                                               ('T
                                                (SEQ
                                                 (LETT |gtp| (QCDR |gtpp|)
                                                       . #17#)
                                                 (LETT |nexps| (QVELT |gtp| 2)
                                                       . #17#)
                                                 (LETT |coeffs| (QVELT |gtp| 3)
                                                       . #17#)
                                                 (COND
                                                  ((OR (< (QVELT |pss| 2) |dg|)
                                                       (SPADCALL |exps|
                                                                 (QREFELT $
                                                                          39)))
                                                   (SEQ
                                                    (LETT |exps| |nexps|
                                                          . #17#)
                                                    (EXIT
                                                     (LETT |rstate|
                                                           (SPADCALL
                                                            (QV_LEN_U32
                                                             |coeffs|)
                                                            (QREFELT $ 68))
                                                           . #17#)))))
                                                 (COND
                                                  ((< (QVELT |pss| 2) |dg|)
                                                   (LETT |dg| (QVELT |pss| 2)
                                                         . #17#)))
                                                 (LETT |dl|
                                                       (SPADCALL (+ |nv| |nbv|)
                                                                 |offsets|
                                                                 |exps|
                                                                 |offsets|
                                                                 |nexps|
                                                                 (QREFELT $
                                                                          43))
                                                       . #17#)
                                                 (LETT |odl|
                                                       (SPADCALL |dl| 1
                                                                 (QREFELT $
                                                                          44))
                                                       . #17#)
                                                 (LETT |ndl|
                                                       (SPADCALL |dl| 2
                                                                 (QREFELT $
                                                                          44))
                                                       . #17#)
                                                 (COND
                                                  ((SPADCALL |odl| NIL
                                                             (QREFELT $ 45))
                                                   (SEQ
                                                    (LETT |oer|
                                                          (SPADCALL
                                                           (+ |nv| |nbv|) |odl|
                                                           |ndl| |offsets|
                                                           |exps| |offsets|
                                                           |nexps|
                                                           (QREFELT $ 47))
                                                          . #17#)
                                                    (LETT |offsets|
                                                          (QCAR |oer|) . #17#)
                                                    (LETT |exps| (QCDR |oer|)
                                                          . #17#)
                                                    (LETT |ncc|
                                                          (QUOTIENT2
                                                           (QV_LEN_U32 |exps|)
                                                           (+ |nv| |nbv|))
                                                          . #17#)
                                                    (EXIT
                                                     (LETT |rstate|
                                                           (SPADCALL
                                                            (PROG1
                                                                (LETT #11#
                                                                      |ncc|
                                                                      . #17#)
                                                              (|check_subtype2|
                                                               (>= #11# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #11#))
                                                            (QREFELT $ 68))
                                                           . #17#)))))
                                                 (COND
                                                  ((SPADCALL |ndl| NIL
                                                             (QREFELT $ 45))
                                                   (SEQ
                                                    (LETT |n0|
                                                          (QV_LEN_U32 |coeffs|)
                                                          . #17#)
                                                    (LETT |nn| (LENGTH |ndl|)
                                                          . #17#)
                                                    (LETT |n1| (+ |n0| |nn|)
                                                          . #17#)
                                                    (LETT |ncoeffs|
                                                          (GETREFV_U32 |n1| 0)
                                                          . #17#)
                                                    (LETT |i| 0 . #17#)
                                                    (LETT |jl|
                                                          (|SPADfirst| |ndl|)
                                                          . #17#)
                                                    (SEQ (LETT |j| 0 . #17#)
                                                         (LETT #10# (- |n1| 1)
                                                               . #17#)
                                                         G190
                                                         (COND
                                                          ((|greater_SI| |j|
                                                                         #10#)
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (COND
                                                            ((EQL |j| |jl|)
                                                             (SEQ
                                                              (SETELT_U32
                                                               |ncoeffs| |j| 0)
                                                              (LETT |ndl|
                                                                    (CDR |ndl|)
                                                                    . #17#)
                                                              (EXIT
                                                               (LETT |jl|
                                                                     (COND
                                                                      ((NULL
                                                                        |ndl|)
                                                                       |n1|)
                                                                      ('T
                                                                       (|SPADfirst|
                                                                        |ndl|)))
                                                                     . #17#))))
                                                            ('T
                                                             (SEQ
                                                              (SETELT_U32
                                                               |ncoeffs| |j|
                                                               (ELT_U32
                                                                |coeffs| |i|))
                                                              (EXIT
                                                               (LETT |i|
                                                                     (+ |i| 1)
                                                                     . #17#)))))))
                                                         (LETT |j|
                                                               (|inc_SI| |j|)
                                                               . #17#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                    (EXIT
                                                     (LETT |coeffs| |ncoeffs|
                                                           . #17#)))))
                                                 (SPADCALL |coeffs| |p|
                                                           |rstate|
                                                           (QREFELT $ 69))
                                                 (LETT |pp|
                                                       (SPADCALL |rstate|
                                                                 |offsets|
                                                                 (QREFELT $
                                                                          71))
                                                       . #17#)
                                                 (EXIT
                                                  (COND
                                                   ((QEQCAR |pp| 1) "iterate")
                                                   ('T
                                                    (SEQ
                                                     (LETT |res|
                                                           (|MAGCD2;reconstruct3|
                                                            |lv| |vx| |lvz|
                                                            |exps| (QCDR |pp|)
                                                            $)
                                                           . #17#)
                                                     (EXIT
                                                      (COND
                                                       ((SPADCALL |x| |res|
                                                                  |lm| |vx|
                                                                  |lvz|
                                                                  (QREFELT $
                                                                           72))
                                                        (COND
                                                         ((SPADCALL |y| |res|
                                                                    |lm| |vx|
                                                                    |lvz|
                                                                    (QREFELT $
                                                                             72))
                                                          (PROGN
                                                           (LETT #8# |res|
                                                                 . #17#)
                                                           (GO
                                                            #18=#:G869))))))))))))))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #18# (EXIT #8#)))) 

(SDEFUN |MAGCD2;algebraicGcd;2PTLLSLP;7|
        ((|x| PT) (|y| PT) (|lm| |List| PT) (|lv| |List| (|Symbol|))
         (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|sval| (|List| (|Polynomial| (|Integer|)))) (#1=#:G901 NIL)
          (|v| NIL) (#2=#:G900 NIL) (|ress| (|Polynomial| (|Integer|)))
          (|pss|
           (|Record| (|:| |degx| (|Integer|)) (|:| |degy| (|Integer|))
                     (|:| |degg| (|Integer|)) (|:| |sizem| (|Integer|))
                     (|:| |sldeg| (|List| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|)) (|:| |svx| (|Symbol|))
                     (|:| |svz| (|List| (|Symbol|)))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |pss1|
                          (|Record| (|:| |prime| (|Integer|))
                                    (|:| |eval1coeffbuf| (|U32Vector|))
                                    (|:| |eval1expbuf|
                                         (|SortedExponentVector|))))))
          (|msize| (|Integer|)) (|ldeg| (|List| (|Integer|))) (#3=#:G898 NIL)
          (|m| NIL) (#4=#:G899 NIL) (|vz| NIL) (#5=#:G897 NIL)
          (|nlm| (|List| MP)) (#6=#:G896 NIL) (#7=#:G895 NIL) (|ny| (MP))
          (|nx| (MP)) (|sv| (|List| (|Symbol|))) (|tv| (|List| (|Symbol|)))
          (|tvz| (|List| (|Symbol|))) (|tvx| (|Symbol|))
          (|tv0| (|List| (|Symbol|))) (|na| #8=(|NonNegativeInteger|))
          (|n| #8#))
         (SEQ (LETT |n| (LENGTH |lv|) . #9=(|MAGCD2;algebraicGcd;2PTLLSLP;7|))
              (LETT |na| (LENGTH |lvz|) . #9#)
              (EXIT
               (COND
                ((SPADCALL |n| 30 (QREFELT $ 73))
                 (|error| "Too many variables"))
                ('T
                 (SEQ
                  (LETT |tv0| (SPADCALL (QREFELT $ 54) |n| (QREFELT $ 74))
                        . #9#)
                  (LETT |tvx| (|SPADfirst| (QREFELT $ 52)) . #9#)
                  (LETT |tvz|
                        (REVERSE (SPADCALL (QREFELT $ 53) |na| (QREFELT $ 74)))
                        . #9#)
                  (LETT |tv| (SPADCALL |tvz| |tv0| (QREFELT $ 55)) . #9#)
                  (LETT |tv| (CONS |tvx| |tv|) . #9#)
                  (LETT |sv| (CONS |vx| (SPADCALL |lvz| |lv| (QREFELT $ 55)))
                        . #9#)
                  (LETT |nx| (SPADCALL |x| |sv| |tv| (QREFELT $ 75)) . #9#)
                  (LETT |ny| (SPADCALL |y| |sv| |tv| (QREFELT $ 75)) . #9#)
                  (LETT |nlm|
                        (PROGN
                         (LETT #7# NIL . #9#)
                         (SEQ (LETT |m| NIL . #9#) (LETT #6# |lm| . #9#) G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |m| (CAR #6#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #7#
                                      (CONS
                                       (SPADCALL |m| |sv| |tv| (QREFELT $ 75))
                                       #7#)
                                      . #9#)))
                              (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #7#))))
                        . #9#)
                  (LETT |ldeg|
                        (PROGN
                         (LETT #5# NIL . #9#)
                         (SEQ (LETT |vz| NIL . #9#) (LETT #4# |lvz| . #9#)
                              (LETT |m| NIL . #9#) (LETT #3# |lm| . #9#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |m| (CAR #3#) . #9#) NIL)
                                    (ATOM #4#)
                                    (PROGN (LETT |vz| (CAR #4#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #5#
                                      (CONS (SPADCALL |m| |vz| (QREFELT $ 76))
                                            #5#)
                                      . #9#)))
                              (LETT #3#
                                    (PROG1 (CDR #3#)
                                      (LETT #4# (CDR #4#) . #9#))
                                    . #9#)
                              (GO G190) G191 (EXIT (NREVERSE #5#))))
                        . #9#)
                  (LETT |msize| (SPADCALL (ELT $ 77) |ldeg| 1 (QREFELT $ 79))
                        . #9#)
                  (LETT |pss|
                        (VECTOR (SPADCALL |nx| |tvx| (QREFELT $ 36))
                                (SPADCALL |ny| |tvx| (QREFELT $ 36)) 0 |msize|
                                |ldeg| (GETREFV_U32 0 0) (GETREFV_U32 0 0)
                                |tvx| |tvz| (VECTOR 0)
                                (VECTOR 0 (GETREFV_U32 10 0)
                                        (GETREFV_U32 10 0)))
                        . #9#)
                  (QSETVELT |pss| 2
                            (+ (MIN (QVELT |pss| 0) (QVELT |pss| 1)) 1))
                  (LETT |ress|
                        (|MAGCD2;algebraicGcd3a| |nx| |ny| |nlm| |tv0| |pss| $)
                        . #9#)
                  (LETT |sval|
                        (PROGN
                         (LETT #2# NIL . #9#)
                         (SEQ (LETT |v| NIL . #9#) (LETT #1# |sv| . #9#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |v| (CAR #1#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL (|spadConstant| $ 80) |v| 1
                                                 (QREFELT $ 81))
                                       #2#)
                                      . #9#)))
                              (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #9#)
                  (EXIT (SPADCALL |ress| |tv| |sval| (QREFELT $ 83)))))))))) 

(DECLAIM (NOTINLINE |ModularAlgebraicGcd2;|)) 

(DEFUN |ModularAlgebraicGcd2| (&REST #1=#:G902)
  (SPROG NIL
         (PROG (#2=#:G903)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ModularAlgebraicGcd2|)
                                               '|domainEqualList|)
                    . #3=(|ModularAlgebraicGcd2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ModularAlgebraicGcd2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ModularAlgebraicGcd2|)))))))))) 

(DEFUN |ModularAlgebraicGcd2;| (|#1| |#2| |#3| |#4| |#5| |#6|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$6 NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|ModularAlgebraicGcd2|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT DV$6 (|devaluate| |#6|) . #1#)
    (LETT |dv$| (LIST '|ModularAlgebraicGcd2| DV$1 DV$2 DV$3 DV$4 DV$5 DV$6)
          . #1#)
    (LETT $ (GETREFV 86) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|ModularAlgebraicGcd2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (QSETREFV $ 11 |#6|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 52
              '(|u0| |u1| |u2| |u3| |u4| |u5| |u6| |u7| |u8| |u9| |v0| |v1|
                |v2| |v3| |v4| |v5| |v6| |v7| |v8| |v9| |w0| |w1| |w2| |w3|
                |w4| |w5| |w6| |w7| |w8| |w9|))
    (QSETREFV $ 53
              '(|p0| |p1| |p2| |p3| |p4| |p5| |p6| |p7| |p8| |p9| |q0| |q1|
                |q2| |q3| |q4| |q5| |q6| |q7| |q8| |q9| |r0| |r1| |r2| |r3|
                |r4| |r5| |r6| |r7| |r8| |r9|))
    (QSETREFV $ 54
              '(|a0| |a1| |a2| |a3| |a4| |a5| |a6| |a7| |a8| |a9| |b0| |b1|
                |b2| |b3| |b4| |b5| |b6| |b7| |b8| |b9| |c0| |c1| |c2| |c3|
                |c4| |c5| |c6| |c7| |c8| |c9|))
    $))) 

(MAKEPROP '|ModularAlgebraicGcd2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|Union| 8 '#1="failed") (|Symbol|) (|List| 13) (0 . |MPtoMPT|)
              (8 . |pseudoRem|) (|Boolean|) (15 . |zero?|)
              (20 . |canonicalIfCan|) (|Integer|) (26 . >) (|Union| 9 '#1#)
              (|List| 7) (32 . |pack_modulus|) (39 . |degree|)
              (|SortedExponentVector|) (44 . |pack_exps|) (|Void|)
              (|U32Vector|) (51 . |repack1|) (|List| 20) (59 . |member?|)
              (|Record| (|:| |prime| 20) (|:| |eval1coeffbuf| 29)
                        (|:| |eval1expbuf| 26))
              (65 . |eval1|) (|NonNegativeInteger|) (73 . |degree|)
              (|VectorModularReconstructor|) (79 . |empty|) (85 . |empty?|)
              (|List| 31) (|Vector| 20) (|InnerModularHermitePade|)
              (90 . |merge_exponents|) (99 . |elt|) (105 . ~=)
              (|Record| (|:| |offsetdata| 41) (|:| |expdata| 26))
              (111 . |merge2|) (122 . |chinese_update|)
              (|Record| (|:| |nvars| 20) (|:| |offsetdata| 41)
                        (|:| |expdata| 26) (|:| |coeffdata| 29))
              (|Union| 49 '"failed") (129 . |reconstruct|) '|base_vars|
              '|alg_vars| '|param_vars| (138 . |concat|) (|Polynomial| 20)
              (144 . |Zero|) (|SparseUnivariatePolynomial| 56)
              (|PrimitiveArray| 20) (|ModularHermitePade|)
              (148 . |unpack_poly|) (|SparseUnivariatePolynomial| $)
              (157 . |multivariate|) (|IntegerPrimesPackage| 20)
              (163 . |nextPrime|) (168 . |modpreduction|)
              (|VectorIntegerReconstructor|) (174 . |empty|)
              (179 . |chinese_update|) (|Union| 59 '"failed")
              (186 . |reconstruct|) (192 . |trial_division|) (201 . >)
              (207 . |first|) (213 . |subst_vars|) (220 . |ldegree|) (226 . *)
              (|Mapping| 20 20 20) (232 . |reduce|) (239 . |One|)
              (243 . |monomial|) (|List| $) (250 . |eval|) (|List| 6)
              |MAGCD2;algebraicGcd;2PTLLSLP;7|)
           '#(|algebraicGcd| 257) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 85
                                                 '(4 11 12 7 13 14 9 15 3 11 8
                                                   8 8 9 16 1 11 17 8 18 2 11
                                                   12 8 9 19 2 20 17 0 0 21 3
                                                   11 22 23 14 20 24 1 11 20 8
                                                   25 3 11 26 20 20 9 27 4 11
                                                   28 8 29 20 9 30 2 31 17 20 0
                                                   32 4 10 7 7 13 20 33 34 2 10
                                                   35 7 13 36 2 37 0 20 20 38 1
                                                   26 17 0 39 5 42 40 20 41 26
                                                   41 26 43 2 40 31 0 20 44 2
                                                   31 17 0 0 45 7 42 46 20 31
                                                   31 41 26 41 26 47 3 37 28 29
                                                   20 0 48 5 37 50 0 20 41 41
                                                   26 51 2 14 0 0 0 55 0 56 0
                                                   57 5 60 58 14 26 59 20 20 61
                                                   2 56 0 62 13 63 1 64 20 20
                                                   65 2 10 7 7 20 66 1 67 0 20
                                                   68 3 67 28 29 20 0 69 2 67
                                                   70 0 41 71 5 10 17 7 56 23
                                                   13 14 72 2 35 17 0 0 73 2 14
                                                   0 0 35 74 3 10 7 6 14 14 75
                                                   2 10 35 6 13 76 2 20 0 20 0
                                                   77 3 31 20 78 0 20 79 0 56 0
                                                   80 3 56 0 0 13 35 81 3 56 0
                                                   0 14 82 83 6 0 56 6 6 84 14
                                                   13 14 85)))))
           '|lookupComplete|)) 
