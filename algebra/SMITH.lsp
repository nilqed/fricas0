
(SDEFUN |SMITH;test1|
        ((|sm| M) (|b| |Col|) (|m1| . #1=(|Integer|))
         ($ |Union| (|Integer|) "failed"))
        (SPROG ((|km| #1#) (#2=#:G395 NIL) (|m0| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ (LETT |m0| (SPADCALL |sm| (QREFELT $ 11)))
                      (LETT |km| |m1|)
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((< |km| |m0|) NIL)
                                    ('T
                                     (SPADCALL
                                      (SPADCALL |sm| |km| |km| (QREFELT $ 12))
                                      (QREFELT $ 14)))))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |b| |km| (QREFELT $ 15))
                                         (QREFELT $ 14)))
                              (PROGN
                               (LETT #2# (CONS 1 "failed"))
                               (GO #3=#:G394))))
                            (EXIT (LETT |km| (- |km| 1))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS 0 |km|))))
                #3# (EXIT #2#)))) 

(SDEFUN |SMITH;test2|
        ((|sm| M) (|b| |Col|) (|n1| |NonNegativeInteger|) (|dk| |Integer|)
         ($ |Union| |Col| "failed"))
        (SPROG
         ((|sol| (|List| R)) (#1=#:G410 NIL) (|k| NIL) (#2=#:G408 NIL)
          (|c| (|Union| R "failed")) (#3=#:G409 NIL) (|m0| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |sol| NIL) (LETT |m0| (SPADCALL |sm| (QREFELT $ 11)))
                (SEQ (LETT |k| |m0|) (LETT #3# |dk|) G190
                     (COND ((> |k| #3#) (GO G191)))
                     (SEQ
                      (SEQ
                       (LETT |c|
                             (SPADCALL (SPADCALL |b| |k| (QREFELT $ 15))
                                       (SPADCALL |sm| |k| |k| (QREFELT $ 12))
                                       (QREFELT $ 18)))
                       (EXIT
                        (COND
                         ((QEQCAR |c| 1)
                          (PROGN
                           (LETT #2# (CONS 1 "failed"))
                           (GO #4=#:G407))))))
                      (EXIT (LETT |sol| (CONS (QCDR |c|) |sol|))))
                     (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |k| (+ (- |dk| |m0|) 2)) (LETT #1# |n1|) G190
                     (COND ((> |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT (LETT |sol| (CONS (|spadConstant| $ 19) |sol|))))
                     (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL (NREVERSE |sol|) (QREFELT $ 21))))))
          #4# (EXIT #2#)))) 

(SDEFUN |SMITH;isDiagonal?| ((|m| M) ($ |Boolean|))
        (SPROG
         ((#1=#:G416 NIL) (#2=#:G418 NIL) (|j| NIL) (#3=#:G417 NIL) (|i| NIL)
          (|n1| (|NonNegativeInteger|)) (|m1| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |m1| (SPADCALL |m| (QREFELT $ 23)))
                (LETT |n1| (SPADCALL |m| (QREFELT $ 24)))
                (SEQ (LETT |i| 1) (LETT #3# |m1|) G190
                     (COND ((|greater_SI| |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #2# |n1|) G190
                            (COND ((|greater_SI| |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |j| |i| (QREFELT $ 25))
                                (COND
                                 ((NULL
                                   (SPADCALL
                                    (SPADCALL |m| |i| |j| (QREFELT $ 12))
                                    (QREFELT $ 14)))
                                  (PROGN (LETT #1# NIL) (GO #4=#:G415))))))))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |SMITH;elRow1| ((|m| M) (|i| |Integer|) (|j| |Integer|) ($ M))
        (SPROG ((|vec| (|Row|)))
               (SEQ (LETT |vec| (SPADCALL |m| |i| (QREFELT $ 26)))
                    (SPADCALL |m| |i| (SPADCALL |m| |j| (QREFELT $ 26))
                              (QREFELT $ 27))
                    (SPADCALL |m| |j| |vec| (QREFELT $ 27)) (EXIT |m|)))) 

(SDEFUN |SMITH;elRow2| ((|m| M) (|a| R) (|i| |Integer|) (|j| |Integer|) ($ M))
        (SPROG ((|vec| (|Row|)))
               (SEQ
                (LETT |vec|
                      (SPADCALL (CONS #'|SMITH;elRow2!0| (VECTOR $ |a|))
                                (SPADCALL |m| |j| (QREFELT $ 26))
                                (QREFELT $ 30)))
                (LETT |vec|
                      (SPADCALL (ELT $ 31) (SPADCALL |m| |i| (QREFELT $ 26))
                                |vec| (QREFELT $ 33)))
                (SPADCALL |m| |i| |vec| (QREFELT $ 27)) (EXIT |m|)))) 

(SDEFUN |SMITH;elRow2!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a| |x| (QREFELT $ 28)))))) 

(SDEFUN |SMITH;elColumn2|
        ((|m| M) (|a| R) (|i| |Integer|) (|j| |Integer|) ($ M))
        (SPROG ((|vec| (|Col|)))
               (SEQ
                (LETT |vec|
                      (SPADCALL (CONS #'|SMITH;elColumn2!0| (VECTOR $ |a|))
                                (SPADCALL |m| |j| (QREFELT $ 34))
                                (QREFELT $ 35)))
                (LETT |vec|
                      (SPADCALL (ELT $ 31) (SPADCALL |m| |i| (QREFELT $ 34))
                                |vec| (QREFELT $ 36)))
                (SPADCALL |m| |i| |vec| (QREFELT $ 37)) (EXIT |m|)))) 

(SDEFUN |SMITH;elColumn2!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a| |x| (QREFELT $ 28)))))) 

(SDEFUN |SMITH;ijDivide|
        ((|sf| |Record| (|:| |Smith| M) (|:| |leftEqMat| M)
          (|:| |rightEqMat| M))
         (|i| |Integer|) (|j| |Integer|)
         ($ |Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
        (SPROG
         ((|rMat| (M)) (|lMat| (M)) (|mjj| (R)) (#1=#:G435 NIL) (|mii| (R))
          (|d| (R))
          (|extGcd|
           (|Record| (|:| |coef1| R) (|:| |coef2| R) (|:| |generator| R)))
          (|m| (M)))
         (SEQ (LETT |m| (QVELT |sf| 0))
              (LETT |mii| (SPADCALL |m| |i| |i| (QREFELT $ 12)))
              (LETT |mjj| (SPADCALL |m| |j| |j| (QREFELT $ 12)))
              (LETT |extGcd| (SPADCALL |mii| |mjj| (QREFELT $ 39)))
              (LETT |d| (QVELT |extGcd| 2))
              (LETT |mii|
                    (PROG2 (LETT #1# (SPADCALL |mii| |d| (QREFELT $ 18)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                      (|Union| (QREFELT $ 6) #2="failed")
                                      #1#)))
              (LETT |mjj|
                    (PROG2 (LETT #1# (SPADCALL |mjj| |d| (QREFELT $ 18)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                      (|Union| (QREFELT $ 6) #2#) #1#)))
              (LETT |lMat|
                    (|SMITH;elRow2| (QVELT |sf| 1) (QVELT |extGcd| 0) |j| |i|
                     $))
              (LETT |lMat| (|SMITH;elRow1| |lMat| |i| |j| $))
              (LETT |lMat|
                    (|SMITH;elRow2| |lMat| (SPADCALL |mii| (QREFELT $ 40)) |j|
                     |i| $))
              (SPADCALL |m| |j| |j|
                        (SPADCALL (SPADCALL |m| |i| |i| (QREFELT $ 12)) |mjj|
                                  (QREFELT $ 28))
                        (QREFELT $ 41))
              (SPADCALL |m| |i| |i| |d| (QREFELT $ 41))
              (LETT |rMat|
                    (|SMITH;elColumn2| (QVELT |sf| 2) (QVELT |extGcd| 1) |i|
                     |j| $))
              (LETT |rMat|
                    (|SMITH;elColumn2| |rMat| (SPADCALL |mjj| (QREFELT $ 40))
                     |j| |i| $))
              (SPADCALL |rMat| |j|
                        (SPADCALL (CONS #'|SMITH;ijDivide!0| $)
                                  (SPADCALL |rMat| |j| (QREFELT $ 34))
                                  (QREFELT $ 35))
                        (QREFELT $ 37))
              (EXIT (VECTOR |m| |lMat| |rMat|))))) 

(SDEFUN |SMITH;ijDivide!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL (|spadConstant| $ 43) |x| (QREFELT $ 44))
                  (QREFELT $ 40))) 

(SDEFUN |SMITH;lastStep|
        ((|sf| |Record| (|:| |Smith| M) (|:| |leftEqMat| M)
          (|:| |rightEqMat| M))
         ($ |Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
        (SPROG
         ((#1=#:G448 NIL) (#2=#:G450 NIL) (|j| NIL) (|mii| (R)) (#3=#:G449 NIL)
          (|i| NIL) (|m1| (|Integer|)) (|m| (M)))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (QVELT |sf| 0))
                (LETT |m1|
                      (MIN (SPADCALL |m| (QREFELT $ 23))
                           (SPADCALL |m| (QREFELT $ 24))))
                (SEQ (LETT |i| 1) (LETT #3# |m1|) G190
                     (COND
                      ((OR (|greater_SI| |i| #3#)
                           (NULL
                            (SPADCALL
                             (LETT |mii| (SPADCALL |m| |i| |i| (QREFELT $ 12)))
                             (|spadConstant| $ 19) (QREFELT $ 45))))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (+ |i| 1)) (LETT #2# |m1|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((QEQCAR
                                 (SPADCALL
                                  (SPADCALL |m| |j| |j| (QREFELT $ 12)) |mii|
                                  (QREFELT $ 18))
                                 1)
                                (PROGN
                                 (LETT #1#
                                       (|SMITH;lastStep|
                                        (|SMITH;ijDivide| |sf| |i| |j| $) $))
                                 (GO #4=#:G447))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |sf|)))
          #4# (EXIT #1#)))) 

(SDEFUN |SMITH;findEqMat|
        ((|m| M) (|t| M) ($ |Record| (|:| |Hermite| M) (|:| |eqMat| M)))
        (SPROG
         ((#1=#:G481 NIL) (|u1| (|Matrix| (|Fraction| R))) (#2=#:G463 NIL)
          (#3=#:G473 NIL) (#4=#:G472 (R)) (#5=#:G474 (R)) (#6=#:G492 NIL)
          (|k| NIL) (|j0| (|NonNegativeInteger|)) (|tjj| (R)) (#7=#:G491 NIL)
          (|j| (|NonNegativeInteger|)) (#8=#:G490 NIL) (|i| NIL) (|t11| (R))
          (|mm| (M)) (|t1| (M)) (|u| (M)) (|mmh| (M)) (#9=#:G487 NIL)
          (#10=#:G456 NIL) (#11=#:G455 #12=(|Boolean|)) (#13=#:G457 #12#)
          (#14=#:G489 NIL) (#15=#:G453 NIL) (#16=#:G452 #12#) (#17=#:G454 #12#)
          (#18=#:G488 NIL) (|n1| (|NonNegativeInteger|))
          (|m1| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |m1| (SPADCALL |m| (QREFELT $ 23)))
                (LETT |n1| (SPADCALL |m| (QREFELT $ 24)))
                (EXIT
                 (COND ((EQL |m1| 0) (CONS |m| (SPADCALL 0 0 (QREFELT $ 46))))
                       ((PROGN
                         (LETT #15# NIL)
                         (SEQ (LETT |j| 1) (LETT #18# |n1|) G190
                              (COND ((|greater_SI| |j| #18#) (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #17#
                                       (SPADCALL
                                        (SPADCALL |t| |m1| |j| (QREFELT $ 12))
                                        (QREFELT $ 14)))
                                 (COND
                                  (#15#
                                   (LETT #16# (COND (#16# #17#) ('T NIL))))
                                  ('T
                                   (PROGN (LETT #16# #17#) (LETT #15# 'T)))))))
                              (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                              (EXIT NIL))
                         (COND (#15# #16#) (#19='T 'T)))
                        (SEQ
                         (COND
                          ((PROGN
                            (LETT #10# NIL)
                            (SEQ (LETT |j| 1) (LETT #14# |n1|) G190
                                 (COND ((|greater_SI| |j| #14#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #13#
                                          (SPADCALL
                                           (SPADCALL |t| 1 |j| (QREFELT $ 12))
                                           (QREFELT $ 14)))
                                    (COND
                                     (#10#
                                      (LETT #11# (COND (#11# #13#) ('T NIL))))
                                     ('T
                                      (PROGN
                                       (LETT #11# #13#)
                                       (LETT #10# 'T)))))))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#10# #11#) (#19# 'T)))
                           (PROGN
                            (LETT #9#
                                  (CONS |m|
                                        (SPADCALL |m1| (|spadConstant| $ 16)
                                                  (QREFELT $ 47))))
                            (GO #20=#:G486))))
                         (LETT |mm|
                               (SPADCALL |m|
                                         (SPADCALL |m1| (|spadConstant| $ 16)
                                                   (QREFELT $ 47))
                                         (QREFELT $ 48)))
                         (LETT |mmh| (SPADCALL |mm| (QREFELT $ 49)))
                         (EXIT
                          (CONS (SPADCALL |mmh| 1 |m1| 1 |n1| (QREFELT $ 50))
                                (SPADCALL |mmh| 1 |m1| (+ |n1| 1) (+ |n1| |m1|)
                                          (QREFELT $ 50))))))
                       (#19#
                        (SEQ (LETT |u| (SPADCALL |m1| |m1| (QREFELT $ 46)))
                             (LETT |j| 1)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (SPADCALL
                                      (SPADCALL |t| 1 |j| (QREFELT $ 12))
                                      (|spadConstant| $ 19) (QREFELT $ 51)))
                                    (GO G191)))
                                  (SEQ (EXIT (LETT |j| (+ |j| 1)))) NIL
                                  (GO G190) G191 (EXIT NIL))
                             (LETT |t1| (SPADCALL |t| (QREFELT $ 52)))
                             (LETT |mm| (SPADCALL |m| (QREFELT $ 52)))
                             (COND
                              ((> |j| 1)
                               (SEQ
                                (LETT |t1|
                                      (SPADCALL |t| 1 |m1| |j| |n1|
                                                (QREFELT $ 50)))
                                (EXIT
                                 (LETT |mm|
                                       (SPADCALL |m| 1 |m1| |j| |n1|
                                                 (QREFELT $ 50)))))))
                             (LETT |t11| (SPADCALL |t1| 1 1 (QREFELT $ 12)))
                             (SEQ (LETT |i| 1) (LETT #8# |m1|) G190
                                  (COND ((|greater_SI| |i| #8#) (GO G191)))
                                  (SEQ
                                   (SPADCALL |u| |i| 1
                                             (PROG2
                                                 (LETT #2#
                                                       (SPADCALL
                                                        (SPADCALL |mm| |i| 1
                                                                  (QREFELT $
                                                                           12))
                                                        |t11| (QREFELT $ 18)))
                                                 (QCDR #2#)
                                               (|check_union2| (QEQCAR #2# 0)
                                                               (QREFELT $ 6)
                                                               (|Union|
                                                                (QREFELT $ 6)
                                                                #21="failed")
                                                               #2#))
                                             (QREFELT $ 41))
                                   (EXIT
                                    (SEQ (LETT |j| 2) (LETT #7# |m1|) G190
                                         (COND
                                          ((|greater_SI| |j| #7#) (GO G191)))
                                         (SEQ (LETT |j0| |j|)
                                              (SEQ G190
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL
                                                       (LETT |tjj|
                                                             (SPADCALL |t1| |j|
                                                                       |j0|
                                                                       (QREFELT
                                                                        $ 12)))
                                                       (QREFELT $ 14)))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT |j0| (+ |j0| 1))))
                                                   NIL (GO G190) G191
                                                   (EXIT NIL))
                                              (EXIT
                                               (SPADCALL |u| |i| |j|
                                                         (PROG2
                                                             (LETT #2#
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |mm| |i|
                                                                      |j0|
                                                                      (QREFELT
                                                                       $ 12))
                                                                     (PROGN
                                                                      (LETT #3#
                                                                            NIL)
                                                                      (SEQ
                                                                       (LETT
                                                                        |k| 1)
                                                                       (LETT
                                                                        #6#
                                                                        (- |j|
                                                                           1))
                                                                       G190
                                                                       (COND
                                                                        ((|greater_SI|
                                                                          |k|
                                                                          #6#)
                                                                         (GO
                                                                          G191)))
                                                                       (SEQ
                                                                        (EXIT
                                                                         (PROGN
                                                                          (LETT
                                                                           #5#
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             |u|
                                                                             |i|
                                                                             |k|
                                                                             (QREFELT
                                                                              $
                                                                              12))
                                                                            (SPADCALL
                                                                             |t1|
                                                                             |k|
                                                                             |j0|
                                                                             (QREFELT
                                                                              $
                                                                              12))
                                                                            (QREFELT
                                                                             $
                                                                             28)))
                                                                          (COND
                                                                           (#3#
                                                                            (LETT
                                                                             #4#
                                                                             (SPADCALL
                                                                              #4#
                                                                              #5#
                                                                              (QREFELT
                                                                               $
                                                                               31))))
                                                                           ('T
                                                                            (PROGN
                                                                             (LETT
                                                                              #4#
                                                                              #5#)
                                                                             (LETT
                                                                              #3#
                                                                              'T)))))))
                                                                       (LETT
                                                                        |k|
                                                                        (|inc_SI|
                                                                         |k|))
                                                                       (GO
                                                                        G190)
                                                                       G191
                                                                       (EXIT
                                                                        NIL))
                                                                      (COND
                                                                       (#3#
                                                                        #4#)
                                                                       ('T
                                                                        (|spadConstant|
                                                                         $
                                                                         19))))
                                                                     (QREFELT $
                                                                              53))
                                                                    |tjj|
                                                                    (QREFELT $
                                                                             18)))
                                                             (QCDR #2#)
                                                           (|check_union2|
                                                            (QEQCAR #2# 0)
                                                            (QREFELT $ 6)
                                                            (|Union|
                                                             (QREFELT $ 6)
                                                             #21#)
                                                            #2#))
                                                         (QREFELT $ 41))))
                                         (LETT |j| (|inc_SI| |j|)) (GO G190)
                                         G191 (EXIT NIL))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |u1|
                                   (SPADCALL (ELT $ 55) |u| (QREFELT $ 59)))
                             (EXIT
                              (CONS |t|
                                    (SPADCALL (ELT $ 60)
                                              (PROG2
                                                  (LETT #1#
                                                        (SPADCALL |u1|
                                                                  (QREFELT $
                                                                           61)))
                                                  (QCDR #1#)
                                                (|check_union2| (QEQCAR #1# 0)
                                                                (|Matrix|
                                                                 (|Fraction|
                                                                  (QREFELT $
                                                                           6)))
                                                                (|Union|
                                                                 (|Matrix|
                                                                  (|Fraction|
                                                                   (QREFELT $
                                                                            6)))
                                                                 "failed")
                                                                #1#))
                                              (QREFELT $ 64))))))))))
          #20# (EXIT #9#)))) 

(SDEFUN |SMITH;hermite;2M;10| ((|m| M) ($ M)) (SPADCALL |m| (QREFELT $ 49))) 

(SDEFUN |SMITH;completeHermite;MR;11|
        ((|m| M) ($ |Record| (|:| |Hermite| M) (|:| |eqMat| M)))
        (|SMITH;findEqMat| |m| (SPADCALL |m| (QREFELT $ 49)) $)) 

(SDEFUN |SMITH;smith0| ((|m| M) ($ M)) (QVELT (|SMITH;completeSmith0| |m| $) 0)) 

(SDEFUN |SMITH;smith;2M;13| ((|m| M) ($ M))
        (SPADCALL |m| (CONS (|function| |SMITH;smith0|) $) (QREFELT $ 71))) 

(SDEFUN |SMITH;completeSmith;MR;14|
        ((|m| M)
         ($ |Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
        (SPADCALL |m| (CONS (|function| |SMITH;completeSmith0|) $)
                  (QREFELT $ 75))) 

(SDEFUN |SMITH;smith;2M;15| ((|m| M) ($ M)) (|SMITH;smith0| |m| $)) 

(SDEFUN |SMITH;completeSmith;MR;16|
        ((|m| M)
         ($ |Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
        (|SMITH;completeSmith0| |m| $)) 

(SDEFUN |SMITH;completeSmith0|
        ((|m| M)
         ($ |Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
        (SPROG
         ((|cm2|
           (|Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
          (|m1| (M)) (|rightm| (M))
          (|cm1| (|Record| (|:| |Hermite| M) (|:| |eqMat| M)))
          (|nr| (|NonNegativeInteger|)) (|leftm| (M)))
         (SEQ (LETT |cm1| (SPADCALL |m| (QREFELT $ 67)))
              (LETT |leftm| (QCDR |cm1|)) (LETT |m1| (QCAR |cm1|))
              (EXIT
               (COND
                ((|SMITH;isDiagonal?| |m1| $)
                 (|SMITH;lastStep|
                  (VECTOR |m1| |leftm|
                          (SPADCALL (SPADCALL |m| (QREFELT $ 24))
                                    (|spadConstant| $ 16) (QREFELT $ 47)))
                  $))
                (#1='T
                 (SEQ (LETT |nr| (SPADCALL |m| (QREFELT $ 23)))
                      (LETT |cm1|
                            (SPADCALL (SPADCALL |m1| (QREFELT $ 78))
                                      (QREFELT $ 67)))
                      (LETT |rightm| (SPADCALL (QCDR |cm1|) (QREFELT $ 78)))
                      (LETT |m1| (QCAR |cm1|))
                      (EXIT
                       (COND
                        ((|SMITH;isDiagonal?| |m1| $)
                         (SEQ
                          (LETT |cm2|
                                (|SMITH;lastStep|
                                 (VECTOR |m1| |leftm| |rightm|) $))
                          (EXIT
                           (COND
                            ((EQL
                              (SPADCALL (LETT |m| (QVELT |cm2| 0))
                                        (QREFELT $ 23))
                              |nr|)
                             |cm2|)
                            (#1#
                             (VECTOR (SPADCALL |m| (QREFELT $ 78))
                                     (QVELT |cm2| 1) (QVELT |cm2| 2)))))))
                        (#1#
                         (SEQ (LETT |cm2| (SPADCALL |m1| (QREFELT $ 77)))
                              (LETT |cm2|
                                    (|SMITH;lastStep|
                                     (VECTOR (QVELT |cm2| 0)
                                             (SPADCALL
                                              (SPADCALL (QVELT |cm2| 2)
                                                        (QREFELT $ 78))
                                              |leftm| (QREFELT $ 79))
                                             (SPADCALL |rightm|
                                                       (SPADCALL
                                                        (QVELT |cm2| 1)
                                                        (QREFELT $ 78))
                                                       (QREFELT $ 79)))
                                     $))
                              (EXIT
                               (COND
                                ((EQL
                                  (SPADCALL (LETT |m| (QVELT |cm2| 0))
                                            (QREFELT $ 23))
                                  |nr|)
                                 |cm2|)
                                (#1#
                                 (VECTOR (SPADCALL |m| (QREFELT $ 78))
                                         (QVELT |cm2| 1)
                                         (QVELT |cm2| 2)))))))))))))))) 

(SDEFUN |SMITH;diophantineSystem;MColR;18|
        ((|m| M) (|b| |Col|)
         ($ |Record| (|:| |particular| (|Union| |Col| "failed"))
          (|:| |basis| (|List| |Col|))))
        (SPROG
         ((|lsol| (|List| |Col|)) (#1=#:G521 NIL) (|i| NIL) (#2=#:G520 NIL)
          (|sol| (|Col|)) (|rm| (M)) (|t2| (|Union| |Col| "failed"))
          (|n1| (|NonNegativeInteger|)) (|dk| (|Integer|))
          (|t1| (|Union| (|Integer|) "failed")) (|b1| (|Col|)) (|lm| (M))
          (|m1| (|NonNegativeInteger|)) (|sm| (M))
          (|sf|
           (|Record| (|:| |Smith| M) (|:| |leftEqMat| M)
                     (|:| |rightEqMat| M))))
         (SEQ (LETT |sf| (SPADCALL |m| (QREFELT $ 77)))
              (LETT |sm| (QVELT |sf| 0))
              (LETT |m1| (SPADCALL |sm| (QREFELT $ 23)))
              (LETT |lm| (QVELT |sf| 1))
              (LETT |b1| (SPADCALL |lm| |b| (QREFELT $ 80)))
              (LETT |t1| (|SMITH;test1| |sm| |b1| |m1| $))
              (EXIT
               (COND ((QEQCAR |t1| 1) (CONS (CONS 1 "failed") NIL))
                     (#3='T
                      (SEQ (LETT |dk| (QCDR |t1|))
                           (LETT |n1| (SPADCALL |sm| (QREFELT $ 24)))
                           (LETT |t2| (|SMITH;test2| |sm| |b1| |n1| |dk| $))
                           (EXIT
                            (COND
                             ((QEQCAR |t2| 1) (CONS (CONS 1 "failed") NIL))
                             (#3#
                              (SEQ (LETT |rm| (QVELT |sf| 2))
                                   (LETT |sol|
                                         (SPADCALL |rm| (QCDR |t2|)
                                                   (QREFELT $ 80)))
                                   (LETT |lsol|
                                         (PROGN
                                          (LETT #2# NIL)
                                          (SEQ (LETT |i| (+ |dk| 1))
                                               (LETT #1# |n1|) G190
                                               (COND ((> |i| #1#) (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (SPADCALL |rm| |i|
                                                                  (QREFELT $
                                                                           34))
                                                        #2#))))
                                               (LETT |i| (+ |i| 1)) (GO G190)
                                               G191 (EXIT (NREVERSE #2#)))))
                                   (EXIT
                                    (CONS (CONS 0 |sol|) |lsol|))))))))))))) 

(DECLAIM (NOTINLINE |SmithNormalForm;|)) 

(DEFUN |SmithNormalForm| (&REST #1=#:G522)
  (SPROG NIL
         (PROG (#2=#:G523)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SmithNormalForm|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SmithNormalForm;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SmithNormalForm|)))))))))) 

(DEFUN |SmithNormalForm;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|SmithNormalForm| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 84))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|SmithNormalForm|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|domainEqual| |#4| (|Matrix| (|Integer|)))
      (PROGN
       (QSETREFV $ 72 (CONS (|dispatchFunction| |SMITH;smith;2M;13|) $))
       (QSETREFV $ 77
                 (CONS (|dispatchFunction| |SMITH;completeSmith;MR;14|) $))))
     ('T
      (PROGN
       (QSETREFV $ 72 (CONS (|dispatchFunction| |SMITH;smith;2M;15|) $))
       (QSETREFV $ 77
                 (CONS (|dispatchFunction| |SMITH;completeSmith;MR;16|) $)))))
    $))) 

(MAKEPROP '|SmithNormalForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minColIndex|)
              (5 . |elt|) (|Boolean|) (12 . |zero?|) (17 . |elt|) (23 . |One|)
              (|Union| $ '"failed") (27 . |exquo|) (33 . |Zero|) (|List| 6)
              (37 . |construct|) (|NonNegativeInteger|) (42 . |nrows|)
              (47 . |ncols|) (52 . ~=) (58 . |row|) (64 . |setRow!|) (71 . *)
              (|Mapping| 6 6) (77 . |map|) (83 . +) (|Mapping| 6 6 6)
              (89 . |map|) (96 . |column|) (102 . |map|) (108 . |map|)
              (115 . |setColumn!|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (122 . |extendedEuclidean|) (128 . -) (133 . |setelt!|)
              (|PositiveInteger|) (141 . |One|) (145 . *) (151 . ~=)
              (157 . |zero|) (163 . |scalarMatrix|) (169 . |horizConcat|)
              (175 . |rowEchelon|) (180 . |subMatrix|) (189 . =) (195 . |copy|)
              (200 . -) (|Fraction| 6) (206 . |coerce|) (|Matrix| 54)
              (|Mapping| 54 6)
              (|MatrixCategoryFunctions2| 6 7 8 9 54 (|Vector| 54)
                                          (|Vector| 54) 56)
              (211 . |map|) (217 . |retract|) (222 . |inverse|)
              (|Mapping| 6 54)
              (|MatrixCategoryFunctions2| 54 (|Vector| 54) (|Vector| 54) 56 6 7
                                          8 9)
              (227 . |map|) |SMITH;hermite;2M;10|
              (|Record| (|:| |Hermite| 9) (|:| |eqMat| 9))
              |SMITH;completeHermite;MR;11| (|Matrix| 10) (|Mapping| 68 68)
              (|IntegerSmithNormalForm|) (233 . |smith|) (239 . |smith|)
              (|Record| (|:| |Smith| 68) (|:| |leftEqMat| 68)
                        (|:| |rightEqMat| 68))
              (|Mapping| 73 68) (244 . |completeSmith|)
              (|Record| (|:| |Smith| 9) (|:| |leftEqMat| 9)
                        (|:| |rightEqMat| 9))
              (250 . |completeSmith|) (255 . |transpose|) (260 . *) (266 . *)
              (|Union| 8 '#1="failed")
              (|Record| (|:| |particular| 81) (|:| |basis| (|List| 8)))
              |SMITH;diophantineSystem;MColR;18|)
           '#(|smith| 272 |hermite| 277 |diophantineSystem| 282 |completeSmith|
              288 |completeHermite| 293)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|hermite| (|#4| |#4|)) T)
                                   '((|completeHermite|
                                      ((|Record| (|:| |Hermite| |#4|)
                                                 (|:| |eqMat| |#4|))
                                       |#4|))
                                     T)
                                   '((|smith| (|#4| |#4|)) T)
                                   '((|completeSmith|
                                      ((|Record| (|:| |Smith| |#4|)
                                                 (|:| |leftEqMat| |#4|)
                                                 (|:| |rightEqMat| |#4|))
                                       |#4|))
                                     T)
                                   '((|diophantineSystem|
                                      ((|Record|
                                        (|:| |particular| (|Union| |#3| #1#))
                                        (|:| |basis| (|List| |#3|)))
                                       |#4| |#3|))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 83
                                            '(1 9 10 0 11 3 9 6 0 10 10 12 1 6
                                              13 0 14 2 8 6 0 10 15 0 6 0 16 2
                                              6 17 0 0 18 0 6 0 19 1 8 0 20 21
                                              1 9 22 0 23 1 9 22 0 24 2 22 13 0
                                              0 25 2 9 7 0 10 26 3 9 0 0 10 7
                                              27 2 6 0 0 0 28 2 7 0 29 0 30 2 6
                                              0 0 0 31 3 7 0 32 0 0 33 2 9 8 0
                                              10 34 2 8 0 29 0 35 3 8 0 32 0 0
                                              36 3 9 0 0 10 8 37 2 6 38 0 0 39
                                              1 6 0 0 40 4 9 6 0 10 10 6 41 0
                                              42 0 43 2 6 0 42 0 44 2 6 13 0 0
                                              45 2 9 0 22 22 46 2 9 0 22 6 47 2
                                              9 0 0 0 48 1 9 0 0 49 5 9 0 0 10
                                              10 10 10 50 2 6 13 0 0 51 1 9 0 0
                                              52 2 6 0 0 0 53 1 54 0 6 55 2 58
                                              56 57 9 59 1 54 6 0 60 1 56 17 0
                                              61 2 63 9 62 56 64 2 70 68 68 69
                                              71 1 0 9 9 72 2 70 73 68 74 75 1
                                              0 76 9 77 1 9 0 0 78 2 9 0 0 0 79
                                              2 9 8 0 8 80 1 0 9 9 72 1 0 9 9
                                              65 2 0 82 9 8 83 1 0 76 9 77 1 0
                                              66 9 67)))))
           '|lookupComplete|)) 
