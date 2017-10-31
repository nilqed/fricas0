
(SDEFUN |ODESYS;solve;MLMR;1|
        ((|mm| |Matrix| F) (|lv| |List| (|Vector| F))
         (|solf| |Mapping|
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| F)))
          LO (|List| F))
         ($ |Record|
          (|:| |particular|
               (|List|
                (|Record| (|:| |ratpart| (|Vector| F))
                          (|:| |coeffs| (|Vector| F)))))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPROG
         ((#1=#:G760 NIL) (|bvec| NIL) (#2=#:G759 NIL) (#3=#:G757 NIL)
          (|np| NIL) (#4=#:G758 NIL) (|bv| NIL) (#5=#:G756 NIL)
          (|base_vecs| (|List| (|Vector| F))) (|cb| (|List| (|Vector| F)))
          (|pl| (|List| (|Vector| F))) (|k| #6=(|NonNegativeInteger|))
          (#7=#:G755 NIL) (|l| NIL) (|g1| #8=(|Vector| F)) (#9=#:G752 NIL)
          (|be| NIL) (#10=#:G753 NIL) (#11=#:G754 NIL) (|npl| (|List| #8#))
          (#12=#:G751 NIL) (#13=#:G750 NIL) (#14=#:G749 NIL)
          (|base_vec| (|Vector| F)) (#15=#:G748 NIL) (|s| NIL)
          (|nn| (|NonNegativeInteger|)) (|ncb| (|List| #8#)) (#16=#:G747 NIL)
          (#17=#:G746 NIL)
          (|np1|
           #18=(|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|u| (|Record| (|:| |particular| #18#) (|:| |basis| (|List| F))))
          (|crh| (|List| F)) (#19=#:G745 NIL) (#20=#:G744 NIL) (#21=#:G743 NIL)
          (|e| NIL) (#22=#:G741 NIL) (|i| #6#) (#23=#:G742 NIL)
          (#24=#:G740 NIL) (|v| NIL) (#25=#:G739 NIL) (#26=#:G738 NIL)
          (#27=#:G737 NIL) (|n| (|NonNegativeInteger|)) (|mA| #28=(|Matrix| F))
          (|nv| (|NonNegativeInteger|))
          (|rec|
           (|Record| (|:| A #28#)
                     (|:| |eqs|
                          (|List|
                           (|Record| (|:| C (|Matrix| F))
                                     (|:| |lg| (|List| (|Vector| F)))
                                     (|:| |eq| LO) (|:| |lrh| (|List| F))))))))
         (SEQ
          (LETT |rec| (SPADCALL |mm| |lv| (QREFELT $ 14))
                . #29=(|ODESYS;solve;MLMR;1|))
          (LETT |nv| (LENGTH |lv|) . #29#) (LETT |mA| (QCAR |rec|) . #29#)
          (LETT |n| (ANCOLS |mA|) . #29#) (LETT |k| 0 . #29#)
          (LETT |i| 0 . #29#)
          (LETT |cb|
                (PROGN
                 (LETT #27# NIL . #29#)
                 (SEQ (LETT |v| NIL . #29#) (LETT #26# |lv| . #29#) G190
                      (COND
                       ((OR (ATOM #26#)
                            (PROGN (LETT |v| (CAR #26#) . #29#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #27#
                              (CONS (MAKEARR1 |nv| (|spadConstant| $ 15)) #27#)
                              . #29#)))
                      (LETT #26# (CDR #26#) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #27#))))
                . #29#)
          (LETT |pl|
                (PROGN
                 (LETT #25# NIL . #29#)
                 (SEQ (LETT |v| NIL . #29#) (LETT #24# |lv| . #29#) G190
                      (COND
                       ((OR (ATOM #24#)
                            (PROGN (LETT |v| (CAR #24#) . #29#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #25#
                              (CONS (MAKEARR1 |n| (|spadConstant| $ 15)) #25#)
                              . #29#)))
                      (LETT #24# (CDR #24#) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #25#))))
                . #29#)
          (LETT |base_vecs| NIL . #29#)
          (SEQ (LETT |bv| NIL . #29#) (LETT #23# |cb| . #29#)
               (LETT |i| 1 . #29#) (LETT #22# |nv| . #29#) G190
               (COND
                ((OR (|greater_SI| |i| #22#) (ATOM #23#)
                     (PROGN (LETT |bv| (CAR #23#) . #29#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |bv| |i| (|spadConstant| $ 17) (QREFELT $ 21))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #23# (CDR #23#) . #29#))
                     . #29#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |e| NIL . #29#) (LETT #21# (QCDR |rec|) . #29#) G190
               (COND
                ((OR (ATOM #21#) (PROGN (LETT |e| (CAR #21#) . #29#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |crh|
                      (PROGN
                       (LETT #20# NIL . #29#)
                       (SEQ (LETT |bv| NIL . #29#) (LETT #19# |cb| . #29#) G190
                            (COND
                             ((OR (ATOM #19#)
                                  (PROGN (LETT |bv| (CAR #19#) . #29#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #20#
                                    (CONS
                                     (SPADCALL |bv| (QVELT |e| 3)
                                               (QREFELT $ 24))
                                     #20#)
                                    . #29#)))
                            (LETT #19# (CDR #19#) . #29#) (GO G190) G191
                            (EXIT (NREVERSE #20#))))
                      . #29#)
                (LETT |u| (SPADCALL (QVELT |e| 2) |crh| |solf|) . #29#)
                (LETT |np1| (QCAR |u|) . #29#)
                (LETT |ncb|
                      (PROGN
                       (LETT #17# NIL . #29#)
                       (SEQ (LETT |be| NIL . #29#) (LETT #16# |np1| . #29#)
                            G190
                            (COND
                             ((OR (ATOM #16#)
                                  (PROGN (LETT |be| (CAR #16#) . #29#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #17#
                                    (CONS
                                     (SPADCALL (QCDR |be|) |cb| (QREFELT $ 25))
                                     #17#)
                                    . #29#)))
                            (LETT #16# (CDR #16#) . #29#) (GO G190) G191
                            (EXIT (NREVERSE #17#))))
                      . #29#)
                (LETT |nn| (ANROWS (QVELT |e| 0)) . #29#)
                (SEQ (LETT |s| NIL . #29#) (LETT #15# (QCDR |u|) . #29#) G190
                     (COND
                      ((OR (ATOM #15#)
                           (PROGN (LETT |s| (CAR #15#) . #29#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |base_vec| (MAKEARR1 |n| (|spadConstant| $ 15))
                            . #29#)
                      (SPADCALL |base_vec| (+ |k| 1) |s| (QREFELT $ 21))
                      (SEQ (LETT |l| 2 . #29#) (LETT #14# |nn| . #29#) G190
                           (COND ((|greater_SI| |l| #14#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |base_vec| (+ |k| |l|)
                                       (SPADCALL (QREFELT $ 9)
                                                 (SPADCALL |base_vec|
                                                           (- (+ |k| |l|) 1)
                                                           (QREFELT $ 26))
                                                 (QREFELT $ 27))
                                       (QREFELT $ 21))))
                           (LETT |l| (|inc_SI| |l|) . #29#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (LETT |base_vecs| (CONS |base_vec| |base_vecs|)
                             . #29#)))
                     (LETT #15# (CDR #15#) . #29#) (GO G190) G191 (EXIT NIL))
                (LETT |npl|
                      (PROGN
                       (LETT #13# NIL . #29#)
                       (SEQ (LETT |be| NIL . #29#) (LETT #12# |np1| . #29#)
                            G190
                            (COND
                             ((OR (ATOM #12#)
                                  (PROGN (LETT |be| (CAR #12#) . #29#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #13#
                                    (CONS
                                     (SPADCALL (QCDR |be|) |pl| (QREFELT $ 25))
                                     #13#)
                                    . #29#)))
                            (LETT #12# (CDR #12#) . #29#) (GO G190) G191
                            (EXIT (NREVERSE #13#))))
                      . #29#)
                (SEQ (LETT |bv| NIL . #29#) (LETT #11# |ncb| . #29#)
                     (LETT |np| NIL . #29#) (LETT #10# |npl| . #29#)
                     (LETT |be| NIL . #29#) (LETT #9# |np1| . #29#) G190
                     (COND
                      ((OR (ATOM #9#) (PROGN (LETT |be| (CAR #9#) . #29#) NIL)
                           (ATOM #10#)
                           (PROGN (LETT |np| (CAR #10#) . #29#) NIL)
                           (ATOM #11#)
                           (PROGN (LETT |bv| (CAR #11#) . #29#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |g1| (SPADCALL |bv| (QVELT |e| 1) (QREFELT $ 25))
                            . #29#)
                      (SPADCALL |np| (+ |k| 1) (QCAR |be|) (QREFELT $ 21))
                      (EXIT
                       (SEQ (LETT |l| 2 . #29#) (LETT #7# |nn| . #29#) G190
                            (COND ((|greater_SI| |l| #7#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |np| (+ |k| |l|)
                                        (SPADCALL
                                         (SPADCALL (QREFELT $ 9)
                                                   (SPADCALL |np|
                                                             (- (+ |k| |l|) 1)
                                                             (QREFELT $ 26))
                                                   (QREFELT $ 27))
                                         (SPADCALL |g1| (- |l| 1)
                                                   (QREFELT $ 26))
                                         (QREFELT $ 28))
                                        (QREFELT $ 21))))
                            (LETT |l| (|inc_SI| |l|) . #29#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #9#
                           (PROG1 (CDR #9#)
                             (LETT #10#
                                   (PROG1 (CDR #10#)
                                     (LETT #11# (CDR #11#) . #29#))
                                   . #29#))
                           . #29#)
                     (GO G190) G191 (EXIT NIL))
                (LETT |k| (+ |k| |nn|) . #29#) (LETT |pl| |npl| . #29#)
                (EXIT (LETT |cb| |ncb| . #29#)))
               (LETT #21# (CDR #21#) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |base_vecs| (NREVERSE |base_vecs|) . #29#)
          (EXIT
           (CONS
            (PROGN
             (LETT #5# NIL . #29#)
             (SEQ (LETT |bv| NIL . #29#) (LETT #4# |cb| . #29#)
                  (LETT |np| NIL . #29#) (LETT #3# |pl| . #29#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |np| (CAR #3#) . #29#) NIL)
                        (ATOM #4#) (PROGN (LETT |bv| (CAR #4#) . #29#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #5#
                          (CONS (CONS (SPADCALL |mA| |np| (QREFELT $ 29)) |bv|)
                                #5#)
                          . #29#)))
                  (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #29#))
                        . #29#)
                  (GO G190) G191 (EXIT (NREVERSE #5#))))
            (PROGN
             (LETT #2# NIL . #29#)
             (SEQ (LETT |bvec| NIL . #29#) (LETT #1# |base_vecs| . #29#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |bvec| (CAR #1#) . #29#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |mA| |bvec| (QREFELT $ 29)) #2#)
                          . #29#)))
                  (LETT #1# (CDR #1#) . #29#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |ODESYS;USL_to_FPL|
        ((|u| |Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
          "failed")
         ($ |Record|
          (|:| |particular|
               (|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|:| |basis| (|List| F))))
        (SPROG
         ((|us| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))))
         (SEQ
          (COND ((QEQCAR |u| 1) (CONS NIL NIL))
                ('T
                 (SEQ (LETT |us| (QCDR |u|) |ODESYS;USL_to_FPL|)
                      (EXIT
                       (CONS
                        (LIST
                         (CONS (QCAR |us|) (MAKEARR1 1 (|spadConstant| $ 17))))
                        (QCDR |us|))))))))) 

(SDEFUN |ODESYS;solve;MVMU;3|
        ((|mm| |Matrix| F) (|v| |Vector| F)
         (|solf| |Mapping|
          (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                   "failed")
          LO F)
         ($ |Union|
          (|Record| (|:| |particular| (|Vector| F)) (|:| |basis| (|Matrix| F)))
          "failed"))
        (SPROG
         ((|bm| (|Matrix| F)) (#1=#:G794 NIL) (|bv| NIL) (#2=#:G793 NIL)
          (|s1| (|Vector| F)) (|c1inv| (F))
          (|part1|
           (|Record| (|:| |ratpart| (|Vector| F)) (|:| |coeffs| (|Vector| F))))
          (|part|
           #3=(|List|
               (|Record| (|:| |ratpart| (|Vector| F))
                         (|:| |coeffs| (|Vector| F)))))
          (|res1|
           (|Record| (|:| |particular| #3#)
                     (|:| |basis| (|List| (|Vector| F))))))
         (SEQ
          (LETT |res1|
                (SPADCALL |mm| (LIST |v|)
                          (CONS #'|ODESYS;solve;MVMU;3!0| (VECTOR |solf| $))
                          (QREFELT $ 35))
                . #4=(|ODESYS;solve;MVMU;3|))
          (LETT |part| (QCAR |res1|) . #4#)
          (EXIT
           (COND ((NULL |part|) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |part1| (|SPADfirst| |part|) . #4#)
                       (LETT |c1inv|
                             (SPADCALL
                              (SPADCALL (QCDR |part1|) 1 (QREFELT $ 26))
                              (QREFELT $ 37))
                             . #4#)
                       (LETT |s1|
                             (SPADCALL |c1inv| (QCAR |part1|) (QREFELT $ 38))
                             . #4#)
                       (LETT |bm|
                             (SPADCALL
                              (PROGN
                               (LETT #2# NIL . #4#)
                               (SEQ (LETT |bv| NIL . #4#)
                                    (LETT #1# (QCDR |res1|) . #4#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |bv| (CAR #1#) . #4#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |bv| (QREFELT $ 39))
                                             #2#)
                                            . #4#)))
                                    (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 41))
                             . #4#)
                       (EXIT
                        (CONS 0
                              (CONS |s1|
                                    (SPADCALL |bm| (QREFELT $ 42)))))))))))) 

(SDEFUN |ODESYS;solve;MVMU;3!0| ((|lo| NIL) (|lf| NIL) ($$ NIL))
        (PROG ($ |solf|)
          (LETT $ (QREFELT $$ 1) . #1=(|ODESYS;solve;MVMU;3|))
          (LETT |solf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|ODESYS;USL_to_FPL|
             (SPADCALL |lo| (SPADCALL |lf| (QREFELT $ 36)) |solf|) $))))) 

(SDEFUN |ODESYS;triangulate;MLR;4|
        ((|m| |Matrix| F) (|lv| |List| (|Vector| F))
         ($ |Record| (|:| A (|Matrix| F))
          (|:| |eqs|
               (|List|
                (|Record| (|:| C (|Matrix| F)) (|:| |lg| (|List| (|Vector| F)))
                          (|:| |eq| LO) (|:| |lrh| (|List| F)))))))
        (SPROG
         ((|k| (|NonNegativeInteger|))
          (|ler|
           (|List|
            (|Record| (|:| C (|Matrix| F)) (|:| |lg| (|List| (|Vector| F)))
                      (|:| |eq| LO) (|:| |lrh| (|List| F)))))
          (|lh| (|List| F)) (|h0| (F)) (#1=#:G816 NIL) (|j| NIL)
          (#2=#:G815 NIL) (|sum| (|Vector| F)) (#3=#:G814 NIL) (|g| NIL)
          (|op| (LO)) (#4=#:G813 NIL) (|n| (|NonNegativeInteger|))
          (#5=#:G812 NIL) (|er| NIL)
          (|l|
           (|List|
            (|Record| (|:| C (|Matrix| F)) (|:| |lg| (|List| (|Vector| F))))))
          (#6=#:G811 NIL) (|v| NIL) (#7=#:G810 NIL)
          (|rat|
           (|Record| (|:| R (|Matrix| F)) (|:| A (|Matrix| F))
                     (|:| |Ainv| (|Matrix| F)))))
         (SEQ (LETT |k| 0 . #8=(|ODESYS;triangulate;MLR;4|))
              (LETT |rat|
                    (SPADCALL |m| (|spadConstant| $ 50)
                              (CONS #'|ODESYS;triangulate;MLR;4!0|
                                    (VECTOR $ (QREFELT $ 9)))
                              (QREFELT $ 55))
                    . #8#)
              (LETT |l|
                    (SPADCALL (QVELT |rat| 0)
                              (PROGN
                               (LETT #7# NIL . #8#)
                               (SEQ (LETT |v| NIL . #8#) (LETT #6# |lv| . #8#)
                                    G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN
                                           (LETT |v| (CAR #6#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #7#
                                            (CONS
                                             (SPADCALL (QVELT |rat| 2) |v|
                                                       (QREFELT $ 29))
                                             #7#)
                                            . #8#)))
                                    (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                                    (EXIT (NREVERSE #7#))))
                              (QREFELT $ 58))
                    . #8#)
              (LETT |ler| NIL . #8#)
              (SEQ (LETT |er| NIL . #8#) (LETT #5# |l| . #8#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |er| (CAR #5#) . #8#) NIL))
                     (GO G191)))
                   (SEQ (LETT |n| (ANROWS (QCAR |er|)) . #8#)
                        (LETT |op| (|spadConstant| $ 16) . #8#)
                        (SEQ (LETT |j| 0 . #8#) (LETT #4# (- |n| 1) . #8#) G190
                             (COND ((|greater_SI| |j| #4#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |op|
                                     (SPADCALL |op|
                                               (SPADCALL
                                                (SPADCALL (QCAR |er|) |n|
                                                          (+ |j| 1)
                                                          (QREFELT $ 59))
                                                |j| (QREFELT $ 61))
                                               (QREFELT $ 62))
                                     . #8#)))
                             (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |op|
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 17) |n|
                                         (QREFELT $ 61))
                               |op| (QREFELT $ 63))
                              . #8#)
                        (LETT |lh| NIL . #8#)
                        (SEQ (LETT |g| NIL . #8#) (LETT #3# (QCDR |er|) . #8#)
                             G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |g| (CAR #3#) . #8#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |sum| (MAKEARR1 |n| (|spadConstant| $ 15))
                                    . #8#)
                              (SEQ (LETT |j| 1 . #8#)
                                   (LETT #2# (- |n| 1) . #8#) G190
                                   (COND ((|greater_SI| |j| #2#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |sum| (+ |j| 1)
                                               (SPADCALL
                                                (SPADCALL (QREFELT $ 9)
                                                          (SPADCALL |sum| |j|
                                                                    (QREFELT $
                                                                             26))
                                                          (QREFELT $ 27))
                                                (SPADCALL |g| |j|
                                                          (QREFELT $ 26))
                                                (QREFELT $ 64))
                                               (QREFELT $ 21))))
                                   (LETT |j| (|inc_SI| |j|) . #8#) (GO G190)
                                   G191 (EXIT NIL))
                              (LETT |h0| (|spadConstant| $ 15) . #8#)
                              (SEQ (LETT |j| 1 . #8#) (LETT #1# |n| . #8#) G190
                                   (COND ((|greater_SI| |j| #1#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |h0|
                                           (SPADCALL |h0|
                                                     (SPADCALL
                                                      (SPADCALL (QCAR |er|) |n|
                                                                |j|
                                                                (QREFELT $ 59))
                                                      (SPADCALL |sum| |j|
                                                                (QREFELT $ 26))
                                                      (QREFELT $ 65))
                                                     (QREFELT $ 28))
                                           . #8#)))
                                   (LETT |j| (|inc_SI| |j|) . #8#) (GO G190)
                                   G191 (EXIT NIL))
                              (LETT |h0|
                                    (SPADCALL
                                     (SPADCALL |h0|
                                               (SPADCALL (QREFELT $ 9)
                                                         (SPADCALL |sum| |n|
                                                                   (QREFELT $
                                                                            26))
                                                         (QREFELT $ 27))
                                               (QREFELT $ 64))
                                     (SPADCALL |g| |n| (QREFELT $ 26))
                                     (QREFELT $ 64))
                                    . #8#)
                              (EXIT (LETT |lh| (CONS |h0| |lh|) . #8#)))
                             (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |lh| (NREVERSE |lh|) . #8#)
                        (LETT |ler|
                              (CONS (VECTOR (QCAR |er|) (QCDR |er|) |op| |lh|)
                                    |ler|)
                              . #8#)
                        (EXIT (LETT |k| (+ |k| |n|) . #8#)))
                   (LETT #5# (CDR #5#) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (QVELT |rat| 1) |ler|))))) 

(SDEFUN |ODESYS;triangulate;MLR;4!0| ((|f1| NIL) ($$ NIL))
        (PROG (|diff| $)
          (LETT |diff| (QREFELT $$ 1) . #1=(|ODESYS;triangulate;MLR;4|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |diff| |f1| (QREFELT $ 27)) (QREFELT $ 51)))))) 

(SDEFUN |ODESYS;triangulate;MVR;5|
        ((|m| |Matrix| F) (|v| |Vector| F)
         ($ |Record| (|:| A (|Matrix| F))
          (|:| |eqs|
               (|List|
                (|Record| (|:| C (|Matrix| F)) (|:| |g| (|Vector| F))
                          (|:| |eq| LO) (|:| |rh| F))))))
        (SPROG
         ((|ler|
           (|List|
            (|Record| (|:| C (|Matrix| F)) (|:| |g| (|Vector| F)) (|:| |eq| LO)
                      (|:| |rh| F))))
          (#1=#:G828 NIL) (|er2| NIL)
          (|res1|
           (|Record| (|:| A (|Matrix| F))
                     (|:| |eqs|
                          (|List|
                           (|Record| (|:| C (|Matrix| F))
                                     (|:| |lg| (|List| (|Vector| F)))
                                     (|:| |eq| LO) (|:| |lrh| (|List| F))))))))
         (SEQ
          (LETT |res1| (SPADCALL |m| (LIST |v|) (QREFELT $ 14))
                . #2=(|ODESYS;triangulate;MVR;5|))
          (LETT |ler| NIL . #2#)
          (SEQ (LETT |er2| NIL . #2#) (LETT #1# (QCDR |res1|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |er2| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ler|
                       (CONS
                        (VECTOR (QVELT |er2| 0) (|SPADfirst| (QVELT |er2| 1))
                                (QVELT |er2| 2) (|SPADfirst| (QVELT |er2| 3)))
                        |ler|)
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |ler| (NREVERSE |ler|) . #2#)
          (EXIT (CONS (QCAR |res1|) |ler|))))) 

(SDEFUN |ODESYS;solveInField;MLMR;6|
        ((|m| |Matrix| LO) (|lv| |List| (|Vector| F))
         (|solf| |Mapping|
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| F)))
          LO (|List| F))
         ($ |Record|
          (|:| |particular|
               (|List|
                (|Record| (|:| |ratpart| (|Vector| F))
                          (|:| |coeffs| (|Vector| F)))))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPROG
         ((|rec|
           (|Union|
            (|Record|
             (|:| |particular|
                  (|List|
                   (|Record| (|:| |ratpart| (|Vector| F))
                             (|:| |coeffs| (|Vector| F)))))
             (|:| |basis| (|List| (|Vector| F))))
            "failed"))
          (#1=#:G845 NIL) (|u| (|Union| (|Matrix| F) "failed")) (#2=#:G846 NIL)
          (#3=#:G848 NIL) (|i| NIL) (#4=#:G847 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((EQL (LETT |n| (ANROWS |m|) . #5=(|ODESYS;solveInField;MLMR;6|))
                   (ANCOLS |m|))
              (SEQ
               (LETT |u|
                     (|ODESYS;M2F|
                      (SPADCALL
                       (SPADCALL
                        (PROGN
                         (LETT #4# (GETREFV |n|) . #5#)
                         (SEQ (LETT |i| 1 . #5#) (LETT #3# |n| . #5#)
                              (LETT #2# 0 . #5#) G190
                              (COND ((|greater_SI| |i| #3#) (GO G191)))
                              (SEQ (EXIT (SETELT #4# #2# (QREFELT $ 9))))
                              (LETT #2#
                                    (PROG1 (|inc_SI| #2#)
                                      (LETT |i| (|inc_SI| |i|) . #5#))
                                    . #5#)
                              (GO G190) G191 (EXIT NIL))
                         #4#)
                        (QREFELT $ 71))
                       |m| (QREFELT $ 72))
                      $)
                     . #5#)
               (EXIT
                (COND
                 ((QEQCAR |u| 0)
                  (PROGN
                   (LETT #1# (SPADCALL (QCDR |u|) |lv| |solf| (QREFELT $ 35))
                         . #5#)
                   (GO #6=#:G843))))))))
            (LETT |rec|
                  (SPADCALL |m| (|spadConstant| $ 15) |lv| |solf|
                            (QREFELT $ 75))
                  . #5#)
            (EXIT
             (COND
              ((QEQCAR |rec| 1)
               (|error| "solveInField: system is underdeterminded"))
              ('T (QCDR |rec|))))))
          #6# (EXIT #1#)))) 

(SDEFUN |ODESYS;M2F| ((|m| |Matrix| LO) ($ |Union| (|Matrix| F) "failed"))
        (SPROG
         ((#1=#:G860 NIL) (|u| (|Union| F "failed")) (#2=#:G862 NIL) (|j| NIL)
          (#3=#:G861 NIL) (|i| NIL) (|mf| (|Matrix| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mf|
                  (MAKE_MATRIX1 (ANROWS |m|) (ANCOLS |m|)
                                (|spadConstant| $ 15))
                  . #4=(|ODESYS;M2F|))
            (SEQ (LETT |i| 1 . #4#)
                 (LETT #3# (SPADCALL |m| (QREFELT $ 77)) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1 . #4#)
                        (LETT #2# (SPADCALL |m| (QREFELT $ 78)) . #4#) G190
                        (COND ((|greater_SI| |j| #2#) (GO G191)))
                        (SEQ
                         (LETT |u|
                               (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 79))
                                         (QREFELT $ 81))
                               . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |u| 1)
                            (PROGN
                             (LETT #1# (CONS 1 "failed") . #4#)
                             (GO #5=#:G859)))
                           ('T
                            (SPADCALL |mf| |i| |j| (QCDR |u|)
                                      (QREFELT $ 82))))))
                        (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |mf|))))
          #5# (EXIT #1#)))) 

(SDEFUN |ODESYS;triangulate;MLR;8|
        ((|m| |Matrix| LO) (|lv| |List| (|Vector| F))
         ($ |Record| (|:| |mat| (|Matrix| LO))
          (|:| |vecs| (|List| (|Vector| F)))))
        (SPADCALL |m| (|spadConstant| $ 15) |lv| (QREFELT $ 84))) 

(SDEFUN |ODESYS;triangulate;MVR;9|
        ((|m| |Matrix| LO) (|v| |Vector| F)
         ($ |Record| (|:| |mat| (|Matrix| LO)) (|:| |vec| (|Vector| F))))
        (SPROG
         ((|res1|
           (|Record| (|:| |mat| (|Matrix| LO))
                     (|:| |vecs| (|List| (|Vector| F))))))
         (SEQ
          (LETT |res1| (SPADCALL |m| (LIST |v|) (QREFELT $ 85))
                |ODESYS;triangulate;MVR;9|)
          (EXIT (CONS (QCAR |res1|) (|SPADfirst| (QCDR |res1|))))))) 

(DECLAIM (NOTINLINE |SystemODESolver;|)) 

(DEFUN |SystemODESolver| (&REST #1=#:G876)
  (SPROG NIL
         (PROG (#2=#:G877)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SystemODESolver|)
                                               '|domainEqualList|)
                    . #3=(|SystemODESolver|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SystemODESolver;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SystemODESolver|)))))))))) 

(DEFUN |SystemODESolver;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SystemODESolver|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SystemODESolver| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 92) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SystemODESolver| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL (QREFELT $ 8)))
          $))) 

(MAKEPROP '|SystemODESolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . D)
              '|diff|
              (|Record| (|:| C 12) (|:| |lg| 13) (|:| |eq| 7) (|:| |lrh| 22))
              (|Record| (|:| A 12) (|:| |eqs| (|List| 10))) (|Matrix| 6)
              (|List| 20) |ODESYS;triangulate;MLR;4| (4 . |Zero|) (8 . |Zero|)
              (12 . |One|) (16 . |One|) (|Integer|) (|Vector| 6)
              (20 . |setelt!|) (|List| 6)
              (|LinearCombinationUtilities| 6 (|SparseUnivariatePolynomial| 6))
              (27 . |lin_comb|) (33 . |lin_comb|) (39 . |elt|) (45 . |elt|)
              (51 . -) (57 . *) (|Record| (|:| |ratpart| 20) (|:| |coeffs| 20))
              (|Record| (|:| |particular| (|List| 30)) (|:| |basis| 13))
              (|Record| (|:| |ratpart| 6) (|:| |coeffs| 20))
              (|Record| (|:| |particular| (|List| 32)) (|:| |basis| 22))
              (|Mapping| 33 7 22) |ODESYS;solve;MLMR;1| (63 . |first|)
              (68 . |inv|) (73 . *) (79 . |entries|) (|List| 22)
              (84 . |matrix|) (89 . |transpose|)
              (|Record| (|:| |particular| 20) (|:| |basis| 12))
              (|Union| 43 '"failed")
              (|Record| (|:| |particular| 6) (|:| |basis| 22))
              (|Union| 45 '"failed") (|Mapping| 46 7 6) |ODESYS;solve;MVMU;3|
              (|Automorphism| 6) (94 . |One|) (98 . -)
              (|Record| (|:| R 12) (|:| A 12) (|:| |Ainv| 12)) (|Mapping| 6 6)
              (|PseudoLinearNormalForm| 6) (103 . |normalForm|)
              (|Record| (|:| C 12) (|:| |lg| 13)) (|List| 56)
              (110 . |companionBlocks|) (116 . |elt|) (|NonNegativeInteger|)
              (123 . |monomial|) (129 . +) (135 . -) (141 . +) (147 . *)
              (|Record| (|:| C 12) (|:| |g| 20) (|:| |eq| 7) (|:| |rh| 6))
              (|Record| (|:| A 12) (|:| |eqs| (|List| 66)))
              |ODESYS;triangulate;MVR;5| (|Vector| 7) (|Matrix| 7)
              (153 . |diagonalMatrix|) (158 . -) (|Union| 31 '"failed")
              (|OrePolynomialMatrixOperations| 6 7) (164 . |solve|)
              |ODESYS;solveInField;MLMR;6| (172 . |maxRowIndex|)
              (177 . |maxColIndex|) (182 . |elt|) (|Union| 6 '"failed")
              (189 . |retractIfCan|) (194 . |setelt!|)
              (|Record| (|:| |mat| 70) (|:| |vecs| 13)) (202 . |rowEchelon|)
              |ODESYS;triangulate;MLR;8|
              (|Record| (|:| |mat| 70) (|:| |vec| 20))
              |ODESYS;triangulate;MVR;9| (|Union| 20 '"failed")
              (|Record| (|:| |particular| 88) (|:| |basis| 13))
              (|Record| (|:| |particular| 80) (|:| |basis| 22))
              (|Mapping| 90 7 6))
           '#(|triangulate| 209 |solveInField| 233 |solve| 247) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 91
                                                 '(0 7 0 8 0 6 0 15 0 7 0 16 0
                                                   6 0 17 0 7 0 18 3 20 6 0 19
                                                   6 21 2 23 6 20 22 24 2 23 20
                                                   20 13 25 2 20 6 0 19 26 2 7
                                                   6 0 6 27 2 6 0 0 0 28 2 12
                                                   20 0 20 29 1 22 6 0 36 1 6 0
                                                   0 37 2 20 0 6 0 38 1 20 22 0
                                                   39 1 12 0 40 41 1 12 0 0 42
                                                   0 49 0 50 1 6 0 0 51 3 54 52
                                                   12 49 53 55 2 54 57 12 13 58
                                                   3 12 6 0 19 19 59 2 7 0 6 60
                                                   61 2 7 0 0 0 62 2 7 0 0 0 63
                                                   2 6 0 0 0 64 2 6 0 0 0 65 1
                                                   70 0 69 71 2 70 0 0 0 72 4
                                                   74 73 70 6 13 34 75 1 70 19
                                                   0 77 1 70 19 0 78 3 70 7 0
                                                   19 19 79 1 7 80 0 81 4 12 6
                                                   0 19 19 6 82 3 74 83 70 6 13
                                                   84 2 0 11 12 13 14 2 0 67 12
                                                   20 68 2 0 83 70 13 85 2 0 86
                                                   70 20 87 3 0 31 70 13 34 76
                                                   3 0 89 70 20 91 1 3 0 31 12
                                                   13 34 35 3 0 44 12 20 47
                                                   48)))))
           '|lookupComplete|)) 
