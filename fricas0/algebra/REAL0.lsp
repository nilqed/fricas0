
(SDEFUN |REAL0;negate|
        ((|int| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         ($ |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|)))))
        (CONS (SPADCALL (QCDR |int|) (QREFELT $ 8))
              (SPADCALL (QCAR |int|) (QREFELT $ 8)))) 

(SDEFUN |REAL0;midpoint;RF;2|
        ((|i| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL 1 2 (QREFELT $ 12))
                  (SPADCALL (QCAR |i|) (QCDR |i|) (QREFELT $ 13))
                  (QREFELT $ 14))) 

(SDEFUN |REAL0;midpoints;LL;3|
        ((|li| |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|)))))
         ($ |List| (|Fraction| (|Integer|))))
        (SPROG ((#1=#:G714 NIL) (|x| NIL) (#2=#:G713 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|REAL0;midpoints;LL;3|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |li| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 16)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REAL0;makeSqfr| ((F |Pol|) ($ |Pol|))
        (SPROG
         ((#1=#:G726 NIL) (#2=#:G725 (|Pol|)) (#3=#:G727 (|Pol|))
          (#4=#:G730 NIL) (|s| NIL) (|sqfr| (|Factored| |Pol|)))
         (SEQ (LETT |sqfr| (SPADCALL F (QREFELT $ 21)) . #5=(|REAL0;makeSqfr|))
              (EXIT
               (LETT F
                     (PROGN
                      (LETT #1# NIL . #5#)
                      (SEQ (LETT |s| NIL . #5#)
                           (LETT #4# (SPADCALL |sqfr| (QREFELT $ 25)) . #5#)
                           G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |s| (CAR #4#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #3# (QCAR |s|) . #5#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #3# (QREFELT $ 26))
                                      . #5#))
                               ('T
                                (PROGN
                                 (LETT #2# #3# . #5#)
                                 (LETT #1# 'T . #5#)))))))
                           (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 9))))
                     . #5#))))) 

(SDEFUN |REAL0;realZeros;PolL;5|
        ((F |Pol|)
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (|REAL0;ReZeroSqfr| (|REAL0;makeSqfr| F $) $)) 

(SDEFUN |REAL0;realZeros;PolFL;6|
        ((F |Pol|) (|rn| |Fraction| (|Integer|))
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG ((#1=#:G736 NIL) (|int| NIL) (#2=#:G735 NIL))
               (SEQ
                (LETT F (|REAL0;makeSqfr| F $)
                      . #3=(|REAL0;realZeros;PolFL;6|))
                (EXIT
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |int| NIL . #3#)
                       (LETT #1# (|REAL0;ReZeroSqfr| F $) . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |int| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS (SPADCALL F |int| |rn| (QREFELT $ 28))
                                     #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |REAL0;realZeros;PolRL;7|
        ((F |Pol|)
         (|bounds| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG
         ((#1=#:G738 NIL)
          (|rint|
           (|Union|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))
            #2="failed"))
          (#3=#:G744 NIL) (|int| NIL) (#4=#:G743 NIL))
         (SEQ (LETT F (|REAL0;makeSqfr| F $) . #5=(|REAL0;realZeros;PolRL;7|))
              (EXIT
               (PROGN
                (LETT #4# NIL . #5#)
                (SEQ (LETT |int| NIL . #5#)
                     (LETT #3# (|REAL0;ReZeroSqfr| F $) . #5#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |int| (CAR #3#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR
                          (LETT |rint|
                                (SPADCALL F |int| |bounds| (QREFELT $ 31))
                                . #5#)
                          0)
                         (LETT #4#
                               (CONS
                                (PROG2 (LETT #1# |rint| . #5#)
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0)
                                                  (|Record|
                                                   (|:| |left|
                                                        (|Fraction|
                                                         (|Integer|)))
                                                   (|:| |right|
                                                        (|Fraction|
                                                         (|Integer|))))
                                                  (|Union|
                                                   (|Record|
                                                    (|:| |left|
                                                         (|Fraction|
                                                          (|Integer|)))
                                                    (|:| |right|
                                                         (|Fraction|
                                                          (|Integer|))))
                                                   #2#)
                                                  #1#))
                                #4#)
                               . #5#)))))
                     (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                     (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |REAL0;realZeros;PolRFL;8|
        ((F |Pol|)
         (|bounds| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         (|rn| |Fraction| (|Integer|))
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG ((#1=#:G749 NIL) (|int| NIL) (#2=#:G748 NIL))
               (SEQ
                (LETT F (|REAL0;makeSqfr| F $)
                      . #3=(|REAL0;realZeros;PolRFL;8|))
                (EXIT
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |int| NIL . #3#)
                       (LETT #1# (SPADCALL F |bounds| (QREFELT $ 32)) . #3#)
                       G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |int| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS (SPADCALL F |int| |rn| (QREFELT $ 28))
                                     #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |REAL0;ReZeroSqfr|
        ((F |Pol|)
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG
         ((K
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (J
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#1=#:G765 NIL) (|int| NIL) (#2=#:G764 NIL)
          (|tempF| (|Union| |Pol| "failed"))
          (L
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (|r| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL F (|spadConstant| $ 34) (QREFELT $ 36))
            (|error| "ReZeroSqfr: zero polynomial"))
           (#3='T
            (SEQ (LETT L NIL . #4=(|REAL0;ReZeroSqfr|))
                 (EXIT
                  (COND ((EQL (SPADCALL F (QREFELT $ 38)) 0) L)
                        (#3#
                         (SEQ
                          (SEQ (LETT |r| (SPADCALL F (QREFELT $ 39)) . #4#)
                               (EXIT
                                (COND
                                 ((SPADCALL |r| 0 (QREFELT $ 40))
                                  (SEQ
                                   (LETT L
                                         (LIST
                                          (CONS (|spadConstant| $ 41)
                                                (|spadConstant| $ 41)))
                                         . #4#)
                                   (LETT |tempF|
                                         (SPADCALL F
                                                   (SPADCALL 1 |r|
                                                             (QREFELT $ 42))
                                                   (QREFELT $ 44))
                                         . #4#)
                                   (EXIT
                                    (COND
                                     ((NULL (QEQCAR |tempF| 1))
                                      (LETT F (QCDR |tempF|) . #4#)))))))))
                          (LETT J
                                (PROGN
                                 (LETT #2# NIL . #4#)
                                 (SEQ (LETT |int| NIL . #4#)
                                      (LETT #1#
                                            (REVERSE
                                             (|REAL0;PosZero|
                                              (|REAL0;minus| F $) $))
                                            . #4#)
                                      G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |int| (CAR #1#) . #4#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS (|REAL0;negate| |int| $)
                                                    #2#)
                                              . #4#)))
                                      (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                . #4#)
                          (LETT K (|REAL0;PosZero| F $) . #4#)
                          (EXIT
                           (SPADCALL (SPADCALL J L (QREFELT $ 45)) K
                                     (QREFELT $ 45))))))))))))) 

(SDEFUN |REAL0;PosZero|
        ((F |Pol|)
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG
         ((L
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#1=#:G770 NIL) (|int| NIL) (#2=#:G769 NIL) (|b| (|Integer|)))
         (SEQ (LETT |b| (|REAL0;rootBound| F $) . #3=(|REAL0;PosZero|))
              (LETT F (|REAL0;transMult| |b| F $) . #3#)
              (LETT L (|REAL0;Zero1| F $) . #3#)
              (EXIT
               (LETT L
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |int| NIL . #3#) (LETT #1# L . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |int| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (CONS
                                     (SPADCALL |b| (QCAR |int|) (QREFELT $ 46))
                                     (SPADCALL |b| (QCDR |int|)
                                               (QREFELT $ 46)))
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     . #3#))))) 

(SDEFUN |REAL0;Zero1|
        ((F |Pol|)
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG
         ((K
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#1=#:G784 NIL) (|int| NIL) (#2=#:G783 NIL)
          (J
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#3=#:G782 NIL) (#4=#:G781 NIL) (G (|Pol|))
          (|tempG| #5=(|Union| |Pol| "failed")) (Q (|Pol|)) (H (|Pol|))
          (|tempH| #5#)
          (L
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (|v| (|Integer|)))
         (SEQ (LETT L NIL . #6=(|REAL0;Zero1|))
              (LETT |v|
                    (|REAL0;var| (|REAL0;transAdd1| (|REAL0;invert| F $) $) $)
                    . #6#)
              (EXIT
               (COND ((EQL |v| 0) NIL)
                     ((EQL |v| 1)
                      (LETT L
                            (LIST
                             (CONS (|spadConstant| $ 41)
                                   (|spadConstant| $ 10)))
                            . #6#))
                     ('T
                      (SEQ (LETT G (|REAL0;transMultInv| 2 F $) . #6#)
                           (LETT H (|REAL0;transAdd1| G $) . #6#)
                           (COND
                            ((SPADCALL (SPADCALL H (QREFELT $ 39)) 0
                                       (QREFELT $ 47))
                             (SEQ
                              (LETT L
                                    (LIST
                                     (CONS (SPADCALL 1 2 (QREFELT $ 12))
                                           (SPADCALL 1 2 (QREFELT $ 12))))
                                    . #6#)
                              (LETT Q (SPADCALL 1 1 (QREFELT $ 42)) . #6#)
                              (LETT |tempH| (SPADCALL H Q (QREFELT $ 44))
                                    . #6#)
                              (COND
                               ((NULL (QEQCAR |tempH| 1))
                                (LETT H (QCDR |tempH|) . #6#)))
                              (LETT Q
                                    (SPADCALL Q (SPADCALL -1 0 (QREFELT $ 42))
                                              (QREFELT $ 48))
                                    . #6#)
                              (LETT |tempG| (SPADCALL G Q (QREFELT $ 44))
                                    . #6#)
                              (EXIT
                               (COND
                                ((NULL (QEQCAR |tempG| 1))
                                 (LETT G (QCDR |tempG|) . #6#)))))))
                           (LETT J
                                 (PROGN
                                  (LETT #4# NIL . #6#)
                                  (SEQ (LETT |int| NIL . #6#)
                                       (LETT #3# (|REAL0;Zero1| H $) . #6#)
                                       G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN
                                              (LETT |int| (CAR #3#) . #6#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #4#
                                               (CONS
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL (QCAR |int|)
                                                            (|spadConstant| $
                                                                            10)
                                                            (QREFELT $ 13))
                                                  (SPADCALL 1 2 (QREFELT $ 12))
                                                  (QREFELT $ 14))
                                                 (SPADCALL
                                                  (SPADCALL (QCDR |int|)
                                                            (|spadConstant| $
                                                                            10)
                                                            (QREFELT $ 13))
                                                  (SPADCALL 1 2 (QREFELT $ 12))
                                                  (QREFELT $ 14)))
                                                #4#)
                                               . #6#)))
                                       (LETT #3# (CDR #3#) . #6#) (GO G190)
                                       G191 (EXIT (NREVERSE #4#))))
                                 . #6#)
                           (LETT K
                                 (PROGN
                                  (LETT #2# NIL . #6#)
                                  (SEQ (LETT |int| NIL . #6#)
                                       (LETT #1# (|REAL0;Zero1| G $) . #6#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |int| (CAR #1#) . #6#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (CONS
                                                 (SPADCALL (QCAR |int|)
                                                           (SPADCALL 1 2
                                                                     (QREFELT $
                                                                              12))
                                                           (QREFELT $ 14))
                                                 (SPADCALL (QCDR |int|)
                                                           (SPADCALL 1 2
                                                                     (QREFELT $
                                                                              12))
                                                           (QREFELT $ 14)))
                                                #2#)
                                               . #6#)))
                                       (LETT #1# (CDR #1#) . #6#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 . #6#)
                           (EXIT
                            (SPADCALL (SPADCALL J L (QREFELT $ 45)) K
                                      (QREFELT $ 45)))))))))) 

(SDEFUN |REAL0;rootBound| ((F |Pol|) ($ |Integer|))
        (SPROG
         ((|b| (|Integer|)) (|i| (|Integer|)) (|an| #1=(|Integer|))
          (|lcoef| #1#))
         (SEQ
          (COND
           ((< (SPADCALL F (QREFELT $ 49)) 0)
            (LETT F (SPADCALL F (QREFELT $ 50)) . #2=(|REAL0;rootBound|))))
          (LETT |lcoef| (SPADCALL F (QREFELT $ 49)) . #2#)
          (LETT F (SPADCALL F (QREFELT $ 51)) . #2#) (LETT |i| 0 . #2#)
          (SEQ G190
               (COND
                ((NULL
                  (NULL (SPADCALL F (|spadConstant| $ 34) (QREFELT $ 36))))
                 (GO G191)))
               (SEQ
                (SEQ (LETT |an| (SPADCALL F (QREFELT $ 49)) . #2#)
                     (EXIT (COND ((< |an| 0) (LETT |i| (- |i| |an|) . #2#)))))
                (EXIT (LETT F (SPADCALL F (QREFELT $ 51)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |b| 1 . #2#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL (* |b| |lcoef|) |i| (QREFELT $ 52)))
                 (GO G191)))
               (SEQ (EXIT (LETT |b| (SPADCALL 2 |b| (QREFELT $ 54)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |b|)))) 

(SDEFUN |REAL0;transMult| ((|c| |Integer|) (F |Pol|) ($ |Pol|))
        (SPROG ((G (|Pol|)) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT G (|spadConstant| $ 34) . #1=(|REAL0;transMult|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (NULL
                             (SPADCALL F (|spadConstant| $ 34)
                                       (QREFELT $ 36))))
                           (GO G191)))
                         (SEQ (LETT |n| (SPADCALL F (QREFELT $ 38)) . #1#)
                              (LETT G
                                    (SPADCALL G
                                              (SPADCALL
                                               (* (EXPT |c| |n|)
                                                  (SPADCALL F (QREFELT $ 49)))
                                               |n| (QREFELT $ 42))
                                              (QREFELT $ 48))
                                    . #1#)
                              (EXIT
                               (LETT F (SPADCALL F (QREFELT $ 51)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT G)))) 

(SDEFUN |REAL0;transMultInv| ((|c| |Integer|) (F |Pol|) ($ |Pol|))
        (SPROG
         ((|d| #1=(|NonNegativeInteger|)) (G (|Pol|)) (|cc| (|Integer|))
          (#2=#:G796 NIL) (|n| #1#))
         (SEQ
          (LETT |d| (SPADCALL F (QREFELT $ 38)) . #3=(|REAL0;transMultInv|))
          (LETT |cc| 1 . #3#)
          (LETT G (SPADCALL (SPADCALL F (QREFELT $ 49)) |d| (QREFELT $ 42))
                . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT F (SPADCALL F (QREFELT $ 51)) . #3#)
                            (|spadConstant| $ 34) (QREFELT $ 55)))
                 (GO G191)))
               (SEQ (LETT |n| (SPADCALL F (QREFELT $ 38)) . #3#)
                    (LETT |cc|
                          (* |cc|
                             (EXPT |c|
                                   (PROG1 (LETT #2# (- |d| |n|) . #3#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))))
                          . #3#)
                    (LETT G
                          (SPADCALL G
                                    (SPADCALL
                                     (* |cc| (SPADCALL F (QREFELT $ 49))) |n|
                                     (QREFELT $ 42))
                                    (QREFELT $ 48))
                          . #3#)
                    (EXIT (LETT |d| |n| . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT G)))) 

(SDEFUN |REAL0;transAdd1| ((F |Pol|) ($ |Pol|))
        (SPROG
         ((|ans| (|Pol|)) (#1=#:G809 NIL) (|i| NIL) (#2=#:G808 NIL) (|j| NIL)
          (#3=#:G807 NIL) (|v| (|Vector| (|Integer|)))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL F (QREFELT $ 38)) . #4=(|REAL0;transAdd1|))
              (LETT |v| (SPADCALL F (+ |n| 1) (QREFELT $ 57)) . #4#)
              (SEQ (LETT |i| 0 . #4#) (LETT #3# (- |n| 1) . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (- |n| |i|) . #4#) (LETT #2# |n| . #4#)
                          G190 (COND ((> |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF1O |v| |j|
                                        (+ (QAREF1O |v| |j| 1)
                                           (QAREF1O |v| (+ |j| 1) 1))
                                        1)))
                          (LETT |j| (+ |j| 1) . #4#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (|spadConstant| $ 34) . #4#)
              (SEQ (LETT |i| 0 . #4#) (LETT #1# |n| . #4#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |ans|
                           (SPADCALL |ans|
                                     (SPADCALL (QAREF1O |v| (+ |i| 1) 1) |i|
                                               (QREFELT $ 42))
                                     (QREFELT $ 48))
                           . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |REAL0;minus| ((F |Pol|) ($ |Pol|))
        (SPROG ((G (|Pol|)) (|coef| (|Integer|)) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT G (|spadConstant| $ 34) . #1=(|REAL0;minus|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (NULL
                             (SPADCALL F (|spadConstant| $ 34)
                                       (QREFELT $ 36))))
                           (GO G191)))
                         (SEQ (LETT |n| (SPADCALL F (QREFELT $ 38)) . #1#)
                              (LETT |coef| (SPADCALL F (QREFELT $ 49)) . #1#)
                              (EXIT
                               (COND
                                ((ODDP |n|)
                                 (SEQ
                                  (LETT G
                                        (SPADCALL G
                                                  (SPADCALL (- |coef|) |n|
                                                            (QREFELT $ 42))
                                                  (QREFELT $ 48))
                                        . #1#)
                                  (EXIT
                                   (LETT F (SPADCALL F (QREFELT $ 51))
                                         . #1#))))
                                ('T
                                 (SEQ
                                  (LETT G
                                        (SPADCALL G
                                                  (SPADCALL |coef| |n|
                                                            (QREFELT $ 42))
                                                  (QREFELT $ 48))
                                        . #1#)
                                  (EXIT
                                   (LETT F (SPADCALL F (QREFELT $ 51))
                                         . #1#)))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT G)))) 

(SDEFUN |REAL0;invert| ((F |Pol|) ($ |Pol|))
        (SPROG ((G (|Pol|)) (#1=#:G816 NIL) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT G (|spadConstant| $ 34) . #2=(|REAL0;invert|))
                    (LETT |n| (SPADCALL F (QREFELT $ 38)) . #2#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (NULL
                             (SPADCALL F (|spadConstant| $ 34)
                                       (QREFELT $ 36))))
                           (GO G191)))
                         (SEQ
                          (LETT G
                                (SPADCALL G
                                          (SPADCALL (SPADCALL F (QREFELT $ 49))
                                                    (PROG1
                                                        (LETT #1#
                                                              (- |n|
                                                                 (SPADCALL F
                                                                           (QREFELT
                                                                            $
                                                                            38)))
                                                              . #2#)
                                                      (|check_subtype2|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                                    (QREFELT $ 42))
                                          (QREFELT $ 48))
                                . #2#)
                          (EXIT (LETT F (SPADCALL F (QREFELT $ 51)) . #2#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT G)))) 

(SDEFUN |REAL0;var| ((F |Pol|) ($ |Integer|))
        (SPROG ((|LastCoef| #1=(|Boolean|)) (|i| (|Integer|)) (|next| #1#))
               (SEQ (LETT |i| 0 . #2=(|REAL0;var|))
                    (LETT |LastCoef| (< (SPADCALL F (QREFELT $ 49)) 0) . #2#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SEQ (LETT F (SPADCALL F (QREFELT $ 51)) . #2#)
                                 (EXIT
                                  (NULL
                                   (SPADCALL F (|spadConstant| $ 34)
                                             (QREFELT $ 36))))))
                           (GO G191)))
                         (SEQ
                          (LETT |next| (< (SPADCALL F (QREFELT $ 49)) 0) . #2#)
                          (COND
                           (|LastCoef|
                            (COND
                             ((NULL |next|)
                              (COND (|LastCoef| (LETT |i| (+ |i| 1) . #2#))))))
                           ((OR |next| |LastCoef|) (LETT |i| (+ |i| 1) . #2#)))
                          (EXIT (LETT |LastCoef| |next| . #2#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |i|)))) 

(SDEFUN |REAL0;refine;Pol2RU;19|
        ((F |Pol|)
         (|int| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         (|bounds| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         ($ |Union|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))
          "failed"))
        (SPROG
         ((|pt| (|Fraction| (|Integer|))) (|lseg| (|Fraction| (|Integer|))))
         (SEQ
          (LETT |lseg|
                (SPADCALL
                 (SPADCALL (QCDR |int|) (QCDR |bounds|) (QREFELT $ 58))
                 (SPADCALL (QCAR |int|) (QCAR |bounds|) (QREFELT $ 59))
                 (QREFELT $ 60))
                . #1=(|REAL0;refine;Pol2RU;19|))
          (EXIT
           (COND
            ((SPADCALL |lseg| (|spadConstant| $ 41) (QREFELT $ 61))
             (CONS 1 "failed"))
            ((SPADCALL |lseg| (|spadConstant| $ 41) (QREFELT $ 62))
             (SEQ
              (LETT |pt|
                    (COND
                     ((SPADCALL (QCAR |int|) (QCDR |bounds|) (QREFELT $ 62))
                      (QCAR |int|))
                     (#2='T (QCDR |int|)))
                    . #1#)
              (EXIT
               (COND
                ((EQL
                  (SPADCALL
                   (|REAL0;transMultInv| (SPADCALL |pt| (QREFELT $ 63)) F $)
                   (SPADCALL |pt| (QREFELT $ 64)) (QREFELT $ 65))
                  0)
                 (CONS 0 (CONS |pt| |pt|)))
                (#2# (CONS 1 "failed"))))))
            (#2#
             (COND
              ((SPADCALL |lseg|
                         (SPADCALL (QCDR |int|) (QCAR |int|) (QREFELT $ 60))
                         (QREFELT $ 62))
               (CONS 0 |int|))
              (#2#
               (SPADCALL F (SPADCALL F |int| |lseg| (QREFELT $ 28)) |bounds|
                         (QREFELT $ 31)))))))))) 

(SDEFUN |REAL0;refine;PolRFR;20|
        ((F |Pol|)
         (|int| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         (|eps| |Fraction| (|Integer|))
         ($ |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|)))))
        (SPROG
         ((|xfl| (|Boolean|)) (|ad| #1=(|Integer|)) (|an| #2=(|Integer|))
          (|b| (|Fraction| (|Integer|))) (|a| (|Fraction| (|Integer|)))
          (|bd| #1#) (|bn| #2#) (|v| #3=(|Integer|)) (|midd| #1#) (|midn| #2#)
          (|mid| (|Fraction| (|Integer|))) (|u| #3#) (#4=#:G835 NIL))
         (SEQ (LETT |a| (QCAR |int|) . #5=(|REAL0;refine;PolRFR;20|))
              (LETT |b| (QCDR |int|) . #5#)
              (EXIT
               (COND ((SPADCALL |a| |b| (QREFELT $ 62)) (CONS |a| |b|))
                     ('T
                      (SEQ (LETT |an| (SPADCALL |a| (QREFELT $ 64)) . #5#)
                           (LETT |ad| (SPADCALL |a| (QREFELT $ 63)) . #5#)
                           (LETT |bn| (SPADCALL |b| (QREFELT $ 64)) . #5#)
                           (LETT |bd| (SPADCALL |b| (QREFELT $ 63)) . #5#)
                           (LETT |xfl| NIL . #5#)
                           (SEQ
                            (LETT |u|
                                  (SPADCALL (|REAL0;transMultInv| |ad| F $)
                                            |an| (QREFELT $ 65))
                                  . #5#)
                            (EXIT
                             (COND
                              ((EQL |u| 0)
                               (SEQ
                                (LETT F
                                      (PROG2
                                          (LETT #4#
                                                (SPADCALL F
                                                          (SPADCALL
                                                           (SPADCALL |ad| 1
                                                                     (QREFELT $
                                                                              42))
                                                           (SPADCALL |an| 0
                                                                     (QREFELT $
                                                                              42))
                                                           (QREFELT $ 66))
                                                          (QREFELT $ 44))
                                                . #5#)
                                          (QCDR #4#)
                                        (|check_union2| (QEQCAR #4# 0)
                                                        (QREFELT $ 6)
                                                        (|Union| (QREFELT $ 6)
                                                                 #6="failed")
                                                        #4#))
                                      . #5#)
                                (EXIT
                                 (LETT |u|
                                       (SPADCALL
                                        (|REAL0;transMultInv| |ad| F $) |an|
                                        (QREFELT $ 65))
                                       . #5#)))))))
                           (SEQ
                            (LETT |v|
                                  (SPADCALL (|REAL0;transMultInv| |bd| F $)
                                            |bn| (QREFELT $ 65))
                                  . #5#)
                            (EXIT
                             (COND
                              ((EQL |v| 0)
                               (SEQ
                                (LETT F
                                      (PROG2
                                          (LETT #4#
                                                (SPADCALL F
                                                          (SPADCALL
                                                           (SPADCALL |bd| 1
                                                                     (QREFELT $
                                                                              42))
                                                           (SPADCALL |bn| 0
                                                                     (QREFELT $
                                                                              42))
                                                           (QREFELT $ 66))
                                                          (QREFELT $ 44))
                                                . #5#)
                                          (QCDR #4#)
                                        (|check_union2| (QEQCAR #4# 0)
                                                        (QREFELT $ 6)
                                                        (|Union| (QREFELT $ 6)
                                                                 #6#)
                                                        #4#))
                                      . #5#)
                                (LETT |v|
                                      (SPADCALL (|REAL0;transMultInv| |bd| F $)
                                                |bn| (QREFELT $ 65))
                                      . #5#)
                                (EXIT
                                 (LETT |u|
                                       (SPADCALL
                                        (|REAL0;transMultInv| |ad| F $) |an|
                                        (QREFELT $ 65))
                                       . #5#)))))))
                           (COND
                            ((SPADCALL |u| 0 (QREFELT $ 47))
                             (SEQ (LETT F (SPADCALL F (QREFELT $ 50)) . #5#)
                                  (EXIT (LETT |v| (- |v|) . #5#)))))
                           (COND
                            ((< |v| 0)
                             (|error|
                              (LIST '|mathprint|
                                    (LIST 'CONCAT
                                          (|coerceRe2E| |int|
                                                        (ELT
                                                         (|Record|
                                                          (|:| |left|
                                                               (|Fraction|
                                                                (|Integer|)))
                                                          (|:| |right|
                                                               (|Fraction|
                                                                (|Integer|))))
                                                         0))
                                          "is not a valid isolation interval for"
                                          (SPADCALL F (QREFELT $ 68)))))))
                           (COND
                            ((SPADCALL |eps| (|spadConstant| $ 41)
                                       (QREFELT $ 69))
                             (|error| "precision must be positive")))
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (SPADCALL (SPADCALL |b| |a| (QREFELT $ 60))
                                             |eps| (QREFELT $ 70)))
                                  (GO G191)))
                                (SEQ
                                 (LETT |mid|
                                       (SPADCALL
                                        (SPADCALL |b| |a| (QREFELT $ 13))
                                        (SPADCALL 1 2 (QREFELT $ 12))
                                        (QREFELT $ 14))
                                       . #5#)
                                 (LETT |midn| (SPADCALL |mid| (QREFELT $ 64))
                                       . #5#)
                                 (LETT |midd| (SPADCALL |mid| (QREFELT $ 63))
                                       . #5#)
                                 (LETT |v|
                                       (SPADCALL
                                        (|REAL0;transMultInv| |midd| F $)
                                        |midn| (QREFELT $ 65))
                                       . #5#)
                                 (EXIT
                                  (COND
                                   ((< |v| 0)
                                    (SEQ (LETT |a| |mid| . #5#)
                                         (LETT |an| |midn| . #5#)
                                         (EXIT (LETT |ad| |midd| . #5#))))
                                   ((SPADCALL |v| 0 (QREFELT $ 47))
                                    (SEQ (LETT |b| |mid| . #5#)
                                         (LETT |bn| |midn| . #5#)
                                         (EXIT (LETT |bd| |midd| . #5#))))
                                   ((EQL |v| 0)
                                    (SEQ (LETT |a| |mid| . #5#)
                                         (LETT |b| |mid| . #5#)
                                         (LETT |an| |midn| . #5#)
                                         (LETT |ad| |midd| . #5#)
                                         (EXIT (LETT |xfl| 'T . #5#)))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |a| |b|))))))))) 

(DECLAIM (NOTINLINE |RealZeroPackage;|)) 

(DEFUN |RealZeroPackage| (#1=#:G850)
  (SPROG NIL
         (PROG (#2=#:G851)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RealZeroPackage|)
                                               '|domainEqualList|)
                    . #3=(|RealZeroPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RealZeroPackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RealZeroPackage|)))))))))) 

(DEFUN |RealZeroPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RealZeroPackage|))
          (LETT |dv$| (LIST '|RealZeroPackage| DV$1) . #1#)
          (LETT $ (GETREFV 71) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RealZeroPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RealZeroPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Fraction| 11) (0 . -)
              (5 . |One|) (9 . |One|) (|Integer|) (13 . /) (19 . +) (25 . *)
              (|Record| (|:| |left| 7) (|:| |right| 7)) |REAL0;midpoint;RF;2|
              (|List| 7) (|List| 15) |REAL0;midpoints;LL;3| (|Factored| $)
              (31 . |squareFree|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 11)) (|List| 22)
              (|Factored| 6) (36 . |factors|) (41 . *) |REAL0;realZeros;PolL;5|
              |REAL0;refine;PolRFR;20| |REAL0;realZeros;PolFL;6|
              (|Union| 15 '"failed") |REAL0;refine;Pol2RU;19|
              |REAL0;realZeros;PolRL;7| |REAL0;realZeros;PolRFL;8|
              (47 . |Zero|) (|Boolean|) (51 . =) (|NonNegativeInteger|)
              (57 . |degree|) (62 . |minimumDegree|) (67 . >) (73 . |Zero|)
              (77 . |monomial|) (|Union| $ '"failed") (83 . |exquo|)
              (89 . |append|) (95 . *) (101 . >) (107 . +)
              (113 . |leadingCoefficient|) (118 . -) (123 . |reductum|)
              (128 . <=) (|PositiveInteger|) (134 . *) (140 . ~=) (|Vector| 11)
              (146 . |vectorise|) (152 . |min|) (158 . |max|) (164 . -)
              (170 . <) (176 . =) (182 . |denom|) (187 . |numer|) (192 . |elt|)
              (198 . -) (|OutputForm|) (204 . |coerce|) (209 . <=) (215 . >=))
           '#(|refine| 221 |realZeros| 235 |midpoints| 259 |midpoint| 264) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 70
                                                 '(1 7 0 0 8 0 6 0 9 0 7 0 10 2
                                                   7 0 11 11 12 2 7 0 0 0 13 2
                                                   7 0 0 0 14 1 6 20 0 21 1 24
                                                   23 0 25 2 6 0 0 0 26 0 6 0
                                                   34 2 6 35 0 0 36 1 6 37 0 38
                                                   1 6 37 0 39 2 37 35 0 0 40 0
                                                   7 0 41 2 6 0 11 37 42 2 6 43
                                                   0 0 44 2 18 0 0 0 45 2 7 0
                                                   11 0 46 2 11 35 0 0 47 2 6 0
                                                   0 0 48 1 6 11 0 49 1 6 0 0
                                                   50 1 6 0 0 51 2 11 35 0 0 52
                                                   2 11 0 53 0 54 2 6 35 0 0 55
                                                   2 6 56 0 37 57 2 7 0 0 0 58
                                                   2 7 0 0 0 59 2 7 0 0 0 60 2
                                                   7 35 0 0 61 2 7 35 0 0 62 1
                                                   7 11 0 63 1 7 11 0 64 2 6 11
                                                   0 11 65 2 6 0 0 0 66 1 6 67
                                                   0 68 2 7 35 0 0 69 2 7 35 0
                                                   0 70 3 0 30 6 15 15 31 3 0
                                                   15 6 15 7 28 2 0 18 6 15 32
                                                   1 0 18 6 27 3 0 18 6 15 7 33
                                                   2 0 18 6 7 29 1 0 17 18 19 1
                                                   0 7 15 16)))))
           '|lookupComplete|)) 
