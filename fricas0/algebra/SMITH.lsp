
(SDEFUN |SMITH;test1|
        ((|sm| M) (|b| |Col|) (|m1| . #1=(|Integer|))
         ($ |Union| (|Integer|) "failed"))
        (SPROG ((|km| #1#) (#2=#:G709 NIL) (|m0| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |m0| (SPADCALL |sm| (QREFELT $ 11))
                        . #3=(|SMITH;test1|))
                  (LETT |km| |m1| . #3#)
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
                           (LETT #2# (CONS 1 "failed") . #3#)
                           (GO #4=#:G708))))
                        (EXIT (LETT |km| (- |km| 1) . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 |km|))))
                #4# (EXIT #2#)))) 

(SDEFUN |SMITH;test2|
        ((|sm| M) (|b| |Col|) (|n1| |NonNegativeInteger|) (|dk| |Integer|)
         ($ |Union| |Col| "failed"))
        (SPROG
         ((|sol| (|List| R)) (#1=#:G733 NIL) (|k| NIL) (#2=#:G731 NIL)
          (|c| (|Union| R "failed")) (#3=#:G732 NIL) (|m0| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |sol| NIL . #4=(|SMITH;test2|))
                (LETT |m0| (SPADCALL |sm| (QREFELT $ 11)) . #4#)
                (SEQ (LETT |k| |m0| . #4#) (LETT #3# |dk| . #4#) G190
                     (COND ((> |k| #3#) (GO G191)))
                     (SEQ
                      (SEQ
                       (LETT |c|
                             (SPADCALL (SPADCALL |b| |k| (QREFELT $ 15))
                                       (SPADCALL |sm| |k| |k| (QREFELT $ 12))
                                       (QREFELT $ 18))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |c| 1)
                          (PROGN
                           (LETT #2# (CONS 1 "failed") . #4#)
                           (GO #5=#:G730))))))
                      (EXIT (LETT |sol| (CONS (QCDR |c|) |sol|) . #4#)))
                     (LETT |k| (+ |k| 1) . #4#) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |k| (+ (- |dk| |m0|) 2) . #4#) (LETT #1# |n1| . #4#)
                     G190 (COND ((> |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |sol| (CONS (|spadConstant| $ 19) |sol|) . #4#)))
                     (LETT |k| (+ |k| 1) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL (NREVERSE |sol|) (QREFELT $ 21))))))
          #5# (EXIT #2#)))) 

(SDEFUN |SMITH;isDiagonal?| ((|m| M) ($ |Boolean|))
        (SPROG
         ((#1=#:G739 NIL) (#2=#:G741 NIL) (|j| NIL) (#3=#:G740 NIL) (|i| NIL)
          (|n1| (|NonNegativeInteger|)) (|m1| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |m1| (SPADCALL |m| (QREFELT $ 23))
                  . #4=(|SMITH;isDiagonal?|))
            (LETT |n1| (SPADCALL |m| (QREFELT $ 24)) . #4#)
            (SEQ (LETT |i| 1 . #4#) (LETT #3# |m1| . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1 . #4#) (LETT #2# |n1| . #4#) G190
                        (COND ((|greater_SI| |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |j| |i| (QREFELT $ 25))
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 12))
                                         (QREFELT $ 14)))
                              (PROGN (LETT #1# NIL . #4#) (GO #5=#:G738))))))))
                        (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(SDEFUN |SMITH;elRow1| ((|m| M) (|i| |Integer|) (|j| |Integer|) ($ M))
        (SPROG ((|vec| (|Row|)))
               (SEQ
                (LETT |vec| (SPADCALL |m| |i| (QREFELT $ 26)) |SMITH;elRow1|)
                (SPADCALL |m| |i| (SPADCALL |m| |j| (QREFELT $ 26))
                          (QREFELT $ 27))
                (SPADCALL |m| |j| |vec| (QREFELT $ 27)) (EXIT |m|)))) 

(SDEFUN |SMITH;elRow2| ((|m| M) (|a| R) (|i| |Integer|) (|j| |Integer|) ($ M))
        (SPROG ((|vec| (|Row|)))
               (SEQ
                (LETT |vec|
                      (SPADCALL (CONS #'|SMITH;elRow2!0| (VECTOR $ |a|))
                                (SPADCALL |m| |j| (QREFELT $ 26))
                                (QREFELT $ 30))
                      . #1=(|SMITH;elRow2|))
                (LETT |vec|
                      (SPADCALL (ELT $ 31) (SPADCALL |m| |i| (QREFELT $ 26))
                                |vec| (QREFELT $ 33))
                      . #1#)
                (SPADCALL |m| |i| |vec| (QREFELT $ 27)) (EXIT |m|)))) 

(SDEFUN |SMITH;elRow2!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1) . #1=(|SMITH;elRow2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |a| |x| (QREFELT $ 28)))))) 

(SDEFUN |SMITH;elColumn2|
        ((|m| M) (|a| R) (|i| |Integer|) (|j| |Integer|) ($ M))
        (SPROG ((|vec| (|Col|)))
               (SEQ
                (LETT |vec|
                      (SPADCALL (CONS #'|SMITH;elColumn2!0| (VECTOR $ |a|))
                                (SPADCALL |m| |j| (QREFELT $ 34))
                                (QREFELT $ 35))
                      . #1=(|SMITH;elColumn2|))
                (LETT |vec|
                      (SPADCALL (ELT $ 31) (SPADCALL |m| |i| (QREFELT $ 34))
                                |vec| (QREFELT $ 36))
                      . #1#)
                (SPADCALL |m| |i| |vec| (QREFELT $ 37)) (EXIT |m|)))) 

(SDEFUN |SMITH;elColumn2!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1) . #1=(|SMITH;elColumn2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |a| |x| (QREFELT $ 28)))))) 

(SDEFUN |SMITH;ijDivide|
        ((|sf| |Record| (|:| |Smith| M) (|:| |leftEqMat| M)
          (|:| |rightEqMat| M))
         (|i| |Integer|) (|j| |Integer|)
         ($ |Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
        (SPROG
         ((|rMat| (M)) (|lMat| (M)) (|mjj| (R)) (#1=#:G758 NIL) (|mii| (R))
          (|d| (R))
          (|extGcd|
           (|Record| (|:| |coef1| R) (|:| |coef2| R) (|:| |generator| R)))
          (|m| (M)))
         (SEQ (LETT |m| (QVELT |sf| 0) . #2=(|SMITH;ijDivide|))
              (LETT |mii| (SPADCALL |m| |i| |i| (QREFELT $ 12)) . #2#)
              (LETT |mjj| (SPADCALL |m| |j| |j| (QREFELT $ 12)) . #2#)
              (LETT |extGcd| (SPADCALL |mii| |mjj| (QREFELT $ 39)) . #2#)
              (LETT |d| (QVELT |extGcd| 2) . #2#)
              (LETT |mii|
                    (PROG2 (LETT #1# (SPADCALL |mii| |d| (QREFELT $ 18)) . #2#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                      (|Union| (QREFELT $ 6) #3="failed") #1#))
                    . #2#)
              (LETT |mjj|
                    (PROG2 (LETT #1# (SPADCALL |mjj| |d| (QREFELT $ 18)) . #2#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                      (|Union| (QREFELT $ 6) #3#) #1#))
                    . #2#)
              (LETT |lMat|
                    (|SMITH;elRow2| (QVELT |sf| 1) (QVELT |extGcd| 0) |j| |i|
                     $)
                    . #2#)
              (LETT |lMat| (|SMITH;elRow1| |lMat| |i| |j| $) . #2#)
              (LETT |lMat|
                    (|SMITH;elRow2| |lMat| (SPADCALL |mii| (QREFELT $ 40)) |j|
                     |i| $)
                    . #2#)
              (SPADCALL |m| |j| |j|
                        (SPADCALL (SPADCALL |m| |i| |i| (QREFELT $ 12)) |mjj|
                                  (QREFELT $ 28))
                        (QREFELT $ 41))
              (SPADCALL |m| |i| |i| |d| (QREFELT $ 41))
              (LETT |rMat|
                    (|SMITH;elColumn2| (QVELT |sf| 2) (QVELT |extGcd| 1) |i|
                     |j| $)
                    . #2#)
              (LETT |rMat|
                    (|SMITH;elColumn2| |rMat| (SPADCALL |mjj| (QREFELT $ 40))
                     |j| |i| $)
                    . #2#)
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
         ((#1=#:G771 NIL) (#2=#:G773 NIL) (|j| NIL) (|mii| (R)) (#3=#:G772 NIL)
          (|i| NIL) (|m1| (|Integer|)) (|m| (M)))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (QVELT |sf| 0) . #4=(|SMITH;lastStep|))
                (LETT |m1|
                      (MIN (SPADCALL |m| (QREFELT $ 23))
                           (SPADCALL |m| (QREFELT $ 24)))
                      . #4#)
                (SEQ (LETT |i| 1 . #4#) (LETT #3# |m1| . #4#) G190
                     (COND
                      ((OR (|greater_SI| |i| #3#)
                           (NULL
                            (SPADCALL
                             (LETT |mii| (SPADCALL |m| |i| |i| (QREFELT $ 12))
                                   . #4#)
                             (|spadConstant| $ 19) (QREFELT $ 45))))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (+ |i| 1) . #4#) (LETT #2# |m1| . #4#)
                            G190 (COND ((> |j| #2#) (GO G191)))
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
                                        (|SMITH;ijDivide| |sf| |i| |j| $) $)
                                       . #4#)
                                 (GO #5=#:G770))))))
                            (LETT |j| (+ |j| 1) . #4#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT |sf|)))
          #5# (EXIT #1#)))) 

(SDEFUN |SMITH;findEqMat|
        ((|m| M) (|t| M) ($ |Record| (|:| |Hermite| M) (|:| |eqMat| M)))
        (SPROG
         ((#1=#:G808 NIL) (|u1| (|Matrix| (|Fraction| R))) (#2=#:G786 NIL)
          (#3=#:G796 NIL) (#4=#:G795 (R)) (#5=#:G797 (R)) (#6=#:G819 NIL)
          (|k| NIL) (|j0| (|NonNegativeInteger|)) (|tjj| (R)) (#7=#:G818 NIL)
          (|j| (|NonNegativeInteger|)) (#8=#:G817 NIL) (|i| NIL) (|t11| (R))
          (|mm| (M)) (|t1| (M)) (|u| (M)) (|mmh| (M)) (#9=#:G814 NIL)
          (#10=#:G779 NIL) (#11=#:G778 #12=(|Boolean|)) (#13=#:G780 #12#)
          (#14=#:G816 NIL) (#15=#:G776 NIL) (#16=#:G775 #12#) (#17=#:G777 #12#)
          (#18=#:G815 NIL) (|n1| (|NonNegativeInteger|))
          (|m1| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |m1| (SPADCALL |m| (QREFELT $ 23)) . #19=(|SMITH;findEqMat|))
            (LETT |n1| (SPADCALL |m| (QREFELT $ 24)) . #19#)
            (EXIT
             (COND ((EQL |m1| 0) (CONS |m| (SPADCALL 0 0 (QREFELT $ 46))))
                   ((PROGN
                     (LETT #15# NIL . #19#)
                     (SEQ (LETT |j| 1 . #19#) (LETT #18# |n1| . #19#) G190
                          (COND ((|greater_SI| |j| #18#) (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #17#
                                   (SPADCALL
                                    (SPADCALL |t| |m1| |j| (QREFELT $ 12))
                                    (QREFELT $ 14))
                                   . #19#)
                             (COND
                              (#15#
                               (LETT #16# (COND (#16# #17#) ('T NIL)) . #19#))
                              ('T
                               (PROGN
                                (LETT #16# #17# . #19#)
                                (LETT #15# 'T . #19#)))))))
                          (LETT |j| (|inc_SI| |j|) . #19#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#15# #16#) (#20='T 'T)))
                    (SEQ
                     (COND
                      ((PROGN
                        (LETT #10# NIL . #19#)
                        (SEQ (LETT |j| 1 . #19#) (LETT #14# |n1| . #19#) G190
                             (COND ((|greater_SI| |j| #14#) (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #13#
                                      (SPADCALL
                                       (SPADCALL |t| 1 |j| (QREFELT $ 12))
                                       (QREFELT $ 14))
                                      . #19#)
                                (COND
                                 (#10#
                                  (LETT #11# (COND (#11# #13#) ('T NIL))
                                        . #19#))
                                 ('T
                                  (PROGN
                                   (LETT #11# #13# . #19#)
                                   (LETT #10# 'T . #19#)))))))
                             (LETT |j| (|inc_SI| |j|) . #19#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#10# #11#) (#20# 'T)))
                       (PROGN
                        (LETT #9#
                              (CONS |m|
                                    (SPADCALL |m1| (|spadConstant| $ 16)
                                              (QREFELT $ 47)))
                              . #19#)
                        (GO #21=#:G813))))
                     (LETT |mm|
                           (SPADCALL |m|
                                     (SPADCALL |m1| (|spadConstant| $ 16)
                                               (QREFELT $ 47))
                                     (QREFELT $ 48))
                           . #19#)
                     (LETT |mmh| (SPADCALL |mm| (QREFELT $ 49)) . #19#)
                     (EXIT
                      (CONS (SPADCALL |mmh| 1 |m1| 1 |n1| (QREFELT $ 50))
                            (SPADCALL |mmh| 1 |m1| (+ |n1| 1) (+ |n1| |m1|)
                                      (QREFELT $ 50))))))
                   (#20#
                    (SEQ (LETT |u| (SPADCALL |m1| |m1| (QREFELT $ 46)) . #19#)
                         (LETT |j| 1 . #19#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL (SPADCALL |t| 1 |j| (QREFELT $ 12))
                                           (|spadConstant| $ 19)
                                           (QREFELT $ 51)))
                                (GO G191)))
                              (SEQ (EXIT (LETT |j| (+ |j| 1) . #19#))) NIL
                              (GO G190) G191 (EXIT NIL))
                         (LETT |t1| (SPADCALL |t| (QREFELT $ 52)) . #19#)
                         (LETT |mm| (SPADCALL |m| (QREFELT $ 52)) . #19#)
                         (COND
                          ((SPADCALL |j| 1 (QREFELT $ 53))
                           (SEQ
                            (LETT |t1|
                                  (SPADCALL |t| 1 |m1| |j| |n1| (QREFELT $ 50))
                                  . #19#)
                            (EXIT
                             (LETT |mm|
                                   (SPADCALL |m| 1 |m1| |j| |n1|
                                             (QREFELT $ 50))
                                   . #19#)))))
                         (LETT |t11| (SPADCALL |t1| 1 1 (QREFELT $ 12)) . #19#)
                         (SEQ (LETT |i| 1 . #19#) (LETT #8# |m1| . #19#) G190
                              (COND ((|greater_SI| |i| #8#) (GO G191)))
                              (SEQ
                               (SPADCALL |u| |i| 1
                                         (PROG2
                                             (LETT #2#
                                                   (SPADCALL
                                                    (SPADCALL |mm| |i| 1
                                                              (QREFELT $ 12))
                                                    |t11| (QREFELT $ 18))
                                                   . #19#)
                                             (QCDR #2#)
                                           (|check_union2| (QEQCAR #2# 0)
                                                           (QREFELT $ 6)
                                                           (|Union|
                                                            (QREFELT $ 6)
                                                            #22="failed")
                                                           #2#))
                                         (QREFELT $ 41))
                               (EXIT
                                (SEQ (LETT |j| 2 . #19#) (LETT #7# |m1| . #19#)
                                     G190
                                     (COND ((|greater_SI| |j| #7#) (GO G191)))
                                     (SEQ (LETT |j0| |j| . #19#)
                                          (SEQ G190
                                               (COND
                                                ((NULL
                                                  (SPADCALL
                                                   (LETT |tjj|
                                                         (SPADCALL |t1| |j|
                                                                   |j0|
                                                                   (QREFELT $
                                                                            12))
                                                         . #19#)
                                                   (QREFELT $ 14)))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT |j0| (+ |j0| 1)
                                                       . #19#)))
                                               NIL (GO G190) G191 (EXIT NIL))
                                          (EXIT
                                           (SPADCALL |u| |i| |j|
                                                     (PROG2
                                                         (LETT #2#
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL |mm|
                                                                           |i|
                                                                           |j0|
                                                                           (QREFELT
                                                                            $
                                                                            12))
                                                                 (PROGN
                                                                  (LETT #3# NIL
                                                                        . #19#)
                                                                  (SEQ
                                                                   (LETT |k| 1
                                                                         . #19#)
                                                                   (LETT #6#
                                                                         (- |j|
                                                                            1)
                                                                         . #19#)
                                                                   G190
                                                                   (COND
                                                                    ((|greater_SI|
                                                                      |k| #6#)
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (PROGN
                                                                      (LETT #5#
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
                                                                              28))
                                                                            . #19#)
                                                                      (COND
                                                                       (#3#
                                                                        (LETT
                                                                         #4#
                                                                         (SPADCALL
                                                                          #4#
                                                                          #5#
                                                                          (QREFELT
                                                                           $
                                                                           31))
                                                                         . #19#))
                                                                       ('T
                                                                        (PROGN
                                                                         (LETT
                                                                          #4#
                                                                          #5#
                                                                          . #19#)
                                                                         (LETT
                                                                          #3#
                                                                          'T
                                                                          . #19#)))))))
                                                                   (LETT |k|
                                                                         (|inc_SI|
                                                                          |k|)
                                                                         . #19#)
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                                  (COND
                                                                   (#3# #4#)
                                                                   ('T
                                                                    (|spadConstant|
                                                                     $ 19))))
                                                                 (QREFELT $
                                                                          54))
                                                                |tjj|
                                                                (QREFELT $ 18))
                                                               . #19#)
                                                         (QCDR #2#)
                                                       (|check_union2|
                                                        (QEQCAR #2# 0)
                                                        (QREFELT $ 6)
                                                        (|Union| (QREFELT $ 6)
                                                                 #22#)
                                                        #2#))
                                                     (QREFELT $ 41))))
                                     (LETT |j| (|inc_SI| |j|) . #19#) (GO G190)
                                     G191 (EXIT NIL))))
                              (LETT |i| (|inc_SI| |i|) . #19#) (GO G190) G191
                              (EXIT NIL))
                         (LETT |u1| (SPADCALL (ELT $ 56) |u| (QREFELT $ 60))
                               . #19#)
                         (EXIT
                          (CONS |t|
                                (SPADCALL (ELT $ 61)
                                          (PROG2
                                              (LETT #1#
                                                    (SPADCALL |u1|
                                                              (QREFELT $ 62))
                                                    . #19#)
                                              (QCDR #1#)
                                            (|check_union2| (QEQCAR #1# 0)
                                                            (|Matrix|
                                                             (|Fraction|
                                                              (QREFELT $ 6)))
                                                            (|Union|
                                                             (|Matrix|
                                                              (|Fraction|
                                                               (QREFELT $ 6)))
                                                             "failed")
                                                            #1#))
                                          (QREFELT $ 65))))))))))
          #21# (EXIT #9#)))) 

(SDEFUN |SMITH;hermite;2M;10| ((|m| M) ($ M)) (SPADCALL |m| (QREFELT $ 49))) 

(SDEFUN |SMITH;completeHermite;MR;11|
        ((|m| M) ($ |Record| (|:| |Hermite| M) (|:| |eqMat| M)))
        (|SMITH;findEqMat| |m| (SPADCALL |m| (QREFELT $ 49)) $)) 

(SDEFUN |SMITH;smith0| ((|m| M) ($ M)) (QVELT (|SMITH;completeSmith0| |m| $) 0)) 

(SDEFUN |SMITH;smith;2M;13| ((|m| M) ($ M))
        (SPADCALL |m| (CONS (|function| |SMITH;smith0|) $) (QREFELT $ 72))) 

(SDEFUN |SMITH;completeSmith;MR;14|
        ((|m| M)
         ($ |Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
        (SPADCALL |m| (CONS (|function| |SMITH;completeSmith0|) $)
                  (QREFELT $ 76))) 

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
         (SEQ
          (LETT |cm1| (SPADCALL |m| (QREFELT $ 68))
                . #1=(|SMITH;completeSmith0|))
          (LETT |leftm| (QCDR |cm1|) . #1#) (LETT |m1| (QCAR |cm1|) . #1#)
          (EXIT
           (COND
            ((|SMITH;isDiagonal?| |m1| $)
             (|SMITH;lastStep|
              (VECTOR |m1| |leftm|
                      (SPADCALL (SPADCALL |m| (QREFELT $ 24))
                                (|spadConstant| $ 16) (QREFELT $ 47)))
              $))
            (#2='T
             (SEQ (LETT |nr| (SPADCALL |m| (QREFELT $ 23)) . #1#)
                  (LETT |cm1|
                        (SPADCALL (SPADCALL |m1| (QREFELT $ 79))
                                  (QREFELT $ 68))
                        . #1#)
                  (LETT |rightm| (SPADCALL (QCDR |cm1|) (QREFELT $ 79)) . #1#)
                  (LETT |m1| (QCAR |cm1|) . #1#)
                  (EXIT
                   (COND
                    ((|SMITH;isDiagonal?| |m1| $)
                     (SEQ
                      (LETT |cm2|
                            (|SMITH;lastStep| (VECTOR |m1| |leftm| |rightm|) $)
                            . #1#)
                      (EXIT
                       (COND
                        ((EQL
                          (SPADCALL (LETT |m| (QVELT |cm2| 0) . #1#)
                                    (QREFELT $ 23))
                          |nr|)
                         |cm2|)
                        (#2#
                         (VECTOR (SPADCALL |m| (QREFELT $ 79)) (QVELT |cm2| 1)
                                 (QVELT |cm2| 2)))))))
                    (#2#
                     (SEQ (LETT |cm2| (SPADCALL |m1| (QREFELT $ 78)) . #1#)
                          (LETT |cm2|
                                (|SMITH;lastStep|
                                 (VECTOR (QVELT |cm2| 0)
                                         (SPADCALL
                                          (SPADCALL (QVELT |cm2| 2)
                                                    (QREFELT $ 79))
                                          |leftm| (QREFELT $ 80))
                                         (SPADCALL |rightm|
                                                   (SPADCALL (QVELT |cm2| 1)
                                                             (QREFELT $ 79))
                                                   (QREFELT $ 80)))
                                 $)
                                . #1#)
                          (EXIT
                           (COND
                            ((EQL
                              (SPADCALL (LETT |m| (QVELT |cm2| 0) . #1#)
                                        (QREFELT $ 23))
                              |nr|)
                             |cm2|)
                            (#2#
                             (VECTOR (SPADCALL |m| (QREFELT $ 79))
                                     (QVELT |cm2| 1)
                                     (QVELT |cm2| 2)))))))))))))))) 

(SDEFUN |SMITH;diophantineSystem;MColR;18|
        ((|m| M) (|b| |Col|)
         ($ |Record| (|:| |particular| (|Union| |Col| "failed"))
          (|:| |basis| (|List| |Col|))))
        (SPROG
         ((|lsol| (|List| |Col|)) (#1=#:G848 NIL) (|i| NIL) (#2=#:G847 NIL)
          (|sol| (|Col|)) (|rm| (M)) (|t2| (|Union| |Col| "failed"))
          (|n1| (|NonNegativeInteger|)) (|dk| (|Integer|))
          (|t1| (|Union| (|Integer|) "failed")) (|b1| (|Col|)) (|lm| (M))
          (|m1| (|NonNegativeInteger|)) (|sm| (M))
          (|sf|
           (|Record| (|:| |Smith| M) (|:| |leftEqMat| M)
                     (|:| |rightEqMat| M))))
         (SEQ
          (LETT |sf| (SPADCALL |m| (QREFELT $ 78))
                . #3=(|SMITH;diophantineSystem;MColR;18|))
          (LETT |sm| (QVELT |sf| 0) . #3#)
          (LETT |m1| (SPADCALL |sm| (QREFELT $ 23)) . #3#)
          (LETT |lm| (QVELT |sf| 1) . #3#)
          (LETT |b1| (SPADCALL |lm| |b| (QREFELT $ 81)) . #3#)
          (LETT |t1| (|SMITH;test1| |sm| |b1| |m1| $) . #3#)
          (EXIT
           (COND ((QEQCAR |t1| 1) (CONS (CONS 1 "failed") NIL))
                 (#4='T
                  (SEQ (LETT |dk| (QCDR |t1|) . #3#)
                       (LETT |n1| (SPADCALL |sm| (QREFELT $ 24)) . #3#)
                       (LETT |t2| (|SMITH;test2| |sm| |b1| |n1| |dk| $) . #3#)
                       (EXIT
                        (COND ((QEQCAR |t2| 1) (CONS (CONS 1 "failed") NIL))
                              (#4#
                               (SEQ (LETT |rm| (QVELT |sf| 2) . #3#)
                                    (LETT |sol|
                                          (SPADCALL |rm| (QCDR |t2|)
                                                    (QREFELT $ 81))
                                          . #3#)
                                    (LETT |lsol|
                                          (PROGN
                                           (LETT #2# NIL . #3#)
                                           (SEQ (LETT |i| (+ |dk| 1) . #3#)
                                                (LETT #1# |n1| . #3#) G190
                                                (COND ((> |i| #1#) (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #2#
                                                        (CONS
                                                         (SPADCALL |rm| |i|
                                                                   (QREFELT $
                                                                            34))
                                                         #2#)
                                                        . #3#)))
                                                (LETT |i| (+ |i| 1) . #3#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #2#))))
                                          . #3#)
                                    (EXIT
                                     (CONS (CONS 0 |sol|) |lsol|))))))))))))) 

(DECLAIM (NOTINLINE |SmithNormalForm;|)) 

(DEFUN |SmithNormalForm| (&REST #1=#:G849)
  (SPROG NIL
         (PROG (#2=#:G850)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SmithNormalForm|)
                                               '|domainEqualList|)
                    . #3=(|SmithNormalForm|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SmithNormalForm;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SmithNormalForm|)))))))))) 

(DEFUN |SmithNormalForm;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|SmithNormalForm|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|SmithNormalForm| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 85) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
       (QSETREFV $ 73 (CONS (|dispatchFunction| |SMITH;smith;2M;13|) $))
       (QSETREFV $ 78
                 (CONS (|dispatchFunction| |SMITH;completeSmith;MR;14|) $))))
     ('T
      (PROGN
       (QSETREFV $ 73 (CONS (|dispatchFunction| |SMITH;smith;2M;15|) $))
       (QSETREFV $ 78
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
              (200 . >) (206 . -) (|Fraction| 6) (212 . |coerce|) (|Matrix| 55)
              (|Mapping| 55 6)
              (|MatrixCategoryFunctions2| 6 7 8 9 55 (|Vector| 55)
                                          (|Vector| 55) 57)
              (217 . |map|) (223 . |retract|) (228 . |inverse|)
              (|Mapping| 6 55)
              (|MatrixCategoryFunctions2| 55 (|Vector| 55) (|Vector| 55) 57 6 7
                                          8 9)
              (233 . |map|) |SMITH;hermite;2M;10|
              (|Record| (|:| |Hermite| 9) (|:| |eqMat| 9))
              |SMITH;completeHermite;MR;11| (|Matrix| 10) (|Mapping| 69 69)
              (|IntegerSmithNormalForm|) (239 . |smith|) (245 . |smith|)
              (|Record| (|:| |Smith| 69) (|:| |leftEqMat| 69)
                        (|:| |rightEqMat| 69))
              (|Mapping| 74 69) (250 . |completeSmith|)
              (|Record| (|:| |Smith| 9) (|:| |leftEqMat| 9)
                        (|:| |rightEqMat| 9))
              (256 . |completeSmith|) (261 . |transpose|) (266 . *) (272 . *)
              (|Union| 8 '"failed")
              (|Record| (|:| |particular| 82) (|:| |basis| (|List| 8)))
              |SMITH;diophantineSystem;MColR;18|)
           '#(|smith| 278 |hermite| 283 |diophantineSystem| 288 |completeSmith|
              294 |completeHermite| 299)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 84
                                                 '(1 9 10 0 11 3 9 6 0 10 10 12
                                                   1 6 13 0 14 2 8 6 0 10 15 0
                                                   6 0 16 2 6 17 0 0 18 0 6 0
                                                   19 1 8 0 20 21 1 9 22 0 23 1
                                                   9 22 0 24 2 22 13 0 0 25 2 9
                                                   7 0 10 26 3 9 0 0 10 7 27 2
                                                   6 0 0 0 28 2 7 0 29 0 30 2 6
                                                   0 0 0 31 3 7 0 32 0 0 33 2 9
                                                   8 0 10 34 2 8 0 29 0 35 3 8
                                                   0 32 0 0 36 3 9 0 0 10 8 37
                                                   2 6 38 0 0 39 1 6 0 0 40 4 9
                                                   6 0 10 10 6 41 0 42 0 43 2 6
                                                   0 42 0 44 2 6 13 0 0 45 2 9
                                                   0 22 22 46 2 9 0 22 6 47 2 9
                                                   0 0 0 48 1 9 0 0 49 5 9 0 0
                                                   10 10 10 10 50 2 6 13 0 0 51
                                                   1 9 0 0 52 2 22 13 0 0 53 2
                                                   6 0 0 0 54 1 55 0 6 56 2 59
                                                   57 58 9 60 1 55 6 0 61 1 57
                                                   17 0 62 2 64 9 63 57 65 2 71
                                                   69 69 70 72 1 0 9 9 73 2 71
                                                   74 69 75 76 1 0 77 9 78 1 9
                                                   0 0 79 2 9 0 0 0 80 2 9 8 0
                                                   8 81 1 0 9 9 73 1 0 9 9 66 2
                                                   0 83 9 8 84 1 0 77 9 78 1 0
                                                   67 9 68)))))
           '|lookupComplete|)) 
