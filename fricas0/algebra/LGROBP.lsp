
(SDEFUN |LGROBP;reduceRow|
        ((M |Matrix| F) (|v| |Vector| F) (|lastRow| |Integer|)
         (|pivots| |Vector| (|Integer|)) ($ |Vector| F))
        (SPROG
         ((|a1| (F)) (#1=#:G709 NIL) (#2=#:G719 NIL) (|kk| NIL) (#3=#:G718 NIL)
          (|vk| (F)) (|b| (F)) (|k| (|Integer|)) (|mj| (|Vector| F))
          (#4=#:G717 NIL) (|j| NIL) (|dim| (|NonNegativeInteger|)))
         (SEQ (LETT |a1| (|spadConstant| $ 13) . #5=(|LGROBP;reduceRow|))
              (LETT |b| (|spadConstant| $ 14) . #5#)
              (LETT |dim| (QVSIZE |v|) . #5#)
              (SEQ (LETT |j| 1 . #5#) (LETT #4# |lastRow| . #5#) G190
                   (COND ((|greater_SI| |j| #4#) (GO G191)))
                   (SEQ (LETT |mj| (SPADCALL M |j| (QREFELT $ 18)) . #5#)
                        (LETT |k| (SPADCALL |pivots| |j| (QREFELT $ 20)) . #5#)
                        (LETT |b| (SPADCALL |mj| |k| (QREFELT $ 21)) . #5#)
                        (LETT |vk| (SPADCALL |v| |k| (QREFELT $ 21)) . #5#)
                        (SEQ (LETT |kk| 1 . #5#) (LETT #3# (- |k| 1) . #5#)
                             G190 (COND ((|greater_SI| |kk| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |v| |kk|
                                         (PROG2
                                             (LETT #1#
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |b|
                                                               (SPADCALL |v|
                                                                         |kk|
                                                                         (QREFELT
                                                                          $
                                                                          21))
                                                               (QREFELT $ 22))
                                                     (QREFELT $ 23))
                                                    |a1| (QREFELT $ 24))
                                                   . #5#)
                                             (QCDR #1#)
                                           (|check_union2| (QEQCAR #1# 0)
                                                           (QREFELT $ 7)
                                                           (|Union|
                                                            (QREFELT $ 7)
                                                            #6="failed")
                                                           #1#))
                                         (QREFELT $ 25))))
                             (LETT |kk| (|inc_SI| |kk|) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (SEQ (LETT |kk| |k| . #5#) (LETT #2# |dim| . #5#) G190
                             (COND ((> |kk| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |v| |kk|
                                         (PROG2
                                             (LETT #1#
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |vk|
                                                               (SPADCALL |mj|
                                                                         |kk|
                                                                         (QREFELT
                                                                          $
                                                                          21))
                                                               (QREFELT $ 22))
                                                     (SPADCALL |b|
                                                               (SPADCALL |v|
                                                                         |kk|
                                                                         (QREFELT
                                                                          $
                                                                          21))
                                                               (QREFELT $ 22))
                                                     (QREFELT $ 26))
                                                    |a1| (QREFELT $ 24))
                                                   . #5#)
                                             (QCDR #1#)
                                           (|check_union2| (QEQCAR #1# 0)
                                                           (QREFELT $ 7)
                                                           (|Union|
                                                            (QREFELT $ 7) #6#)
                                                           #1#))
                                         (QREFELT $ 25))))
                             (LETT |kk| (+ |kk| 1) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |a1| |b| . #5#)))
                   (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |v|)))) 

(SDEFUN |LGROBP;rRedPol|
        ((|f| |HomogeneousDistributedMultivariatePolynomial| |lv| F)
         (B |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         ($
          . #1=(|Record|
                (|:| |poly|
                     (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
                (|:| |mult| F))))
        (SPROG
         ((|ggm| #1#)
          (|gg| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (|gm|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F))))
         (SEQ
          (LETT |gm| (SPADCALL |f| B (QREFELT $ 31)) . #2=(|LGROBP;rRedPol|))
          (EXIT
           (COND
            ((SPADCALL (QCAR |gm|) (|spadConstant| $ 32) (QREFELT $ 34)) |gm|)
            ('T
             (SEQ (LETT |gg| (SPADCALL (QCAR |gm|) (QREFELT $ 35)) . #2#)
                  (LETT |ggm| (|LGROBP;rRedPol| |gg| B $) . #2#)
                  (EXIT
                   (CONS
                    (SPADCALL
                     (SPADCALL (QCDR |ggm|)
                               (SPADCALL (QCAR |gm|) |gg| (QREFELT $ 36))
                               (QREFELT $ 37))
                     (QCAR |ggm|) (QREFELT $ 38))
                    (SPADCALL (QCDR |ggm|) (QCDR |gm|) (QREFELT $ 22))))))))))) 

(SDEFUN |LGROBP;totolex;LL;3|
        ((B |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         ($ |List| (|DistributedMultivariatePolynomial| |lv| F)))
        (SPROG
         ((|nBasis| (|List| #1=(|DistributedMultivariatePolynomial| |lv| F)))
          (|i| (|NonNegativeInteger|))
          (|ltresult| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|result| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|antc| #2=(|DistributedMultivariatePolynomial| |lv| F))
          (#3=#:G752 NIL) (#4=#:G751 #2#) (#5=#:G753 #2#) (#6=#:G763 NIL)
          (|c| NIL) (#7=#:G764 NIL) (|b| NIL) (|cordlist| (|List| F))
          (#8=#:G762 NIL) (|k| NIL) (#9=#:G761 NIL)
          (|j| #10=(|NonNegativeInteger|)) (|lm| (|Vector| F)) (#11=#:G760 NIL)
          (|orecfmon|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F)))
          (|ofirstmon| #1#) (|veccoef| (|Vector| F)) (#12=#:G744 NIL)
          (#13=#:G741 NIL) (|cc| (F))
          (|recfmon|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F)))
          (|v| (|Union| (|DistributedMultivariatePolynomial| |lv| F) "failed"))
          (|firstmon| #1#) (|pivots| (|Vector| (|Integer|)))
          (|linmat| (|Matrix| F)) (|ndim1| #10#) (|ndim| (|PositiveInteger|))
          (#14=#:G734 NIL)
          (|vBasis|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
         (SEQ (LETT |result| NIL . #15=(|LGROBP;totolex;LL;3|))
              (LETT |ltresult| NIL . #15#)
              (LETT |vBasis| (SPADCALL B (QREFELT $ 39)) . #15#)
              (LETT |nBasis| (LIST (|spadConstant| $ 41)) . #15#)
              (LETT |ndim|
                    (PROG1 (LETT #14# (LENGTH |vBasis|) . #15#)
                      (|check_subtype2| (> #14# 0) '(|PositiveInteger|)
                                        '(|NonNegativeInteger|) #14#))
                    . #15#)
              (LETT |ndim1| (+ |ndim| 1) . #15#)
              (LETT |linmat|
                    (SPADCALL |ndim| (+ (* 2 |ndim|) 1) (QREFELT $ 44)) . #15#)
              (SPADCALL |linmat| 1 1 (|spadConstant| $ 13) (QREFELT $ 45))
              (SPADCALL |linmat| 1 |ndim1| (|spadConstant| $ 13)
                        (QREFELT $ 45))
              (LETT |pivots| (MAKEARR1 |ndim| 0) . #15#)
              (SPADCALL |pivots| 1 1 (QREFELT $ 46))
              (LETT |firstmon| (|spadConstant| $ 41) . #15#)
              (LETT |ofirstmon| (|spadConstant| $ 41) . #15#)
              (LETT |orecfmon|
                    (CONS (|spadConstant| $ 42) (|spadConstant| $ 13)) . #15#)
              (LETT |i| 2 . #15#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL
                       (LETT |firstmon|
                             (SPADCALL |firstmon| |ltresult| (QREFELT $ 48))
                             . #15#)
                       (|spadConstant| $ 41) (QREFELT $ 49)))
                     (GO G191)))
                   (SEQ
                    (SEQ
                     (LETT |v| (SPADCALL |firstmon| |ofirstmon| (QREFELT $ 50))
                           . #15#)
                     (EXIT
                      (COND
                       ((QEQCAR |v| 1)
                        (LETT |recfmon|
                              (|LGROBP;rRedPol|
                               (SPADCALL |firstmon| (QREFELT $ 51)) B $)
                              . #15#))
                       ('T
                        (SEQ
                         (LETT |recfmon|
                               (|LGROBP;rRedPol|
                                (SPADCALL (SPADCALL (QCDR |v|) (QREFELT $ 51))
                                          (QCAR |orecfmon|) (QREFELT $ 52))
                                B $)
                               . #15#)
                         (EXIT
                          (PROGN
                           (RPLACD |recfmon|
                                   (SPADCALL (QCDR |recfmon|) (QCDR |orecfmon|)
                                             (QREFELT $ 22)))
                           (QCDR |recfmon|))))))))
                    (LETT |cc|
                          (SPADCALL (SPADCALL (QCAR |recfmon|) (QREFELT $ 53))
                                    (QCDR |recfmon|) (QREFELT $ 54))
                          . #15#)
                    (PROGN
                     (RPLACA |recfmon|
                             (PROG2
                                 (LETT #13#
                                       (SPADCALL (QCAR |recfmon|) |cc|
                                                 (QREFELT $ 55))
                                       . #15#)
                                 (QCDR #13#)
                               (|check_union2| (QEQCAR #13# 0)
                                               (|HomogeneousDistributedMultivariatePolynomial|
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|Union|
                                                (|HomogeneousDistributedMultivariatePolynomial|
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                "failed")
                                               #13#)))
                     (QCAR |recfmon|))
                    (PROGN
                     (RPLACD |recfmon|
                             (PROG2
                                 (LETT #12#
                                       (SPADCALL (QCDR |recfmon|) |cc|
                                                 (QREFELT $ 24))
                                       . #15#)
                                 (QCDR #12#)
                               (|check_union2| (QEQCAR #12# 0) (QREFELT $ 7)
                                               (|Union| (QREFELT $ 7) "failed")
                                               #12#)))
                     (QCDR |recfmon|))
                    (LETT |veccoef|
                          (SPADCALL (QCAR |recfmon|) |vBasis| (QREFELT $ 56))
                          . #15#)
                    (LETT |ofirstmon| |firstmon| . #15#)
                    (LETT |orecfmon| |recfmon| . #15#)
                    (LETT |lm| (SPADCALL (+ (* 2 |ndim|) 1) (QREFELT $ 57))
                          . #15#)
                    (SEQ (LETT |j| 1 . #15#) (LETT #11# |ndim| . #15#) G190
                         (COND ((|greater_SI| |j| #11#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |lm| |j|
                                     (SPADCALL |veccoef| |j| (QREFELT $ 21))
                                     (QREFELT $ 25))))
                         (LETT |j| (|inc_SI| |j|) . #15#) (GO G190) G191
                         (EXIT NIL))
                    (SPADCALL |lm| (+ |ndim| |i|) (QCDR |recfmon|)
                              (QREFELT $ 25))
                    (LETT |lm|
                          (|LGROBP;reduceRow| |linmat| |lm| (- |i| 1) |pivots|
                           $)
                          . #15#)
                    (COND ((EQL |i| |ndim1|) (LETT |j| |ndim1| . #15#))
                          ('T
                           (SEQ (LETT |j| 1 . #15#)
                                (EXIT
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL |lm| |j| (QREFELT $ 21))
                                            (|spadConstant| $ 14)
                                            (QREFELT $ 58))
                                           (< |j| |ndim1|))
                                          ('T NIL)))
                                        (GO G191)))
                                      (SEQ (EXIT (LETT |j| (+ |j| 1) . #15#)))
                                      NIL (GO G190) G191 (EXIT NIL))))))
                    (EXIT
                     (COND
                      ((EQL |j| |ndim1|)
                       (SEQ
                        (LETT |cordlist|
                              (PROGN
                               (LETT #9# NIL . #15#)
                               (SEQ (LETT |k| |ndim1| . #15#)
                                    (LETT #8# (+ |ndim1| (LENGTH |nBasis|))
                                          . #15#)
                                    G190 (COND ((> |k| #8#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #9#
                                            (CONS
                                             (SPADCALL |lm| |k| (QREFELT $ 21))
                                             #9#)
                                            . #15#)))
                                    (LETT |k| (+ |k| 1) . #15#) (GO G190) G191
                                    (EXIT (NREVERSE #9#))))
                              . #15#)
                        (LETT |antc|
                              (PROGN
                               (LETT #3# NIL . #15#)
                               (SEQ (LETT |b| NIL . #15#)
                                    (LETT #7# (CONS |firstmon| |nBasis|)
                                          . #15#)
                                    (LETT |c| NIL . #15#)
                                    (LETT #6# (REVERSE |cordlist|) . #15#) G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN
                                           (LETT |c| (CAR #6#) . #15#)
                                           NIL)
                                          (ATOM #7#)
                                          (PROGN
                                           (LETT |b| (CAR #7#) . #15#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #5#
                                             (SPADCALL |c| |b| (QREFELT $ 59))
                                             . #15#)
                                       (COND
                                        (#3#
                                         (LETT #4#
                                               (SPADCALL #4# #5#
                                                         (QREFELT $ 60))
                                               . #15#))
                                        ('T
                                         (PROGN
                                          (LETT #4# #5# . #15#)
                                          (LETT #3# 'T . #15#)))))))
                                    (LETT #6#
                                          (PROG1 (CDR #6#)
                                            (LETT #7# (CDR #7#) . #15#))
                                          . #15#)
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#3# #4#) ('T (|spadConstant| $ 61))))
                              . #15#)
                        (LETT |antc| (SPADCALL |antc| (QREFELT $ 62)) . #15#)
                        (LETT |result| (CONS |antc| |result|) . #15#)
                        (EXIT
                         (LETT |ltresult|
                               (CONS
                                (SPADCALL |antc|
                                          (SPADCALL |antc| (QREFELT $ 63))
                                          (QREFELT $ 64))
                                |ltresult|)
                               . #15#))))
                      ('T
                       (SEQ (SPADCALL |pivots| |i| |j| (QREFELT $ 46))
                            (SPADCALL |linmat| |i| |lm| (QREFELT $ 65))
                            (LETT |i| (+ |i| 1) . #15#)
                            (EXIT
                             (LETT |nBasis| (CONS |firstmon| |nBasis|)
                                   . #15#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |result|)))) 

(SDEFUN |LGROBP;minPol;LOvlHdmp;4|
        ((|oldBasis| |List|
          (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (|x| |OrderedVariableList| |lv|)
         ($ |HomogeneousDistributedMultivariatePolynomial| |lv| F))
        (SPROG
         ((|algBasis|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
         (SEQ
          (LETT |algBasis| (SPADCALL |oldBasis| (QREFELT $ 39))
                |LGROBP;minPol;LOvlHdmp;4|)
          (EXIT (SPADCALL |oldBasis| |algBasis| |x| (QREFELT $ 67)))))) 

(SDEFUN |LGROBP;minPol;2LOvlHdmp;5|
        ((|oldBasis| |List|
          (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (|algBasis| |List|
          (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (|x| |OrderedVariableList| |lv|)
         ($ |HomogeneousDistributedMultivariatePolynomial| |lv| F))
        (SPROG
         ((#1=#:G784 NIL)
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#2=#:G777 NIL) (#3=#:G787 NIL) (|k| NIL)
          (|j| (|NonNegativeInteger|)) (|lm| (|Vector| F)) (#4=#:G786 NIL)
          (|veccoef| (|Vector| F)) (|omult| (F)) (#5=#:G772 NIL)
          (|f| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#6=#:G769 NIL) (|cc| (F))
          (|recf|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F)))
          (#7=#:G785 NIL) (|i| NIL) (|pivots| (|Vector| (|Integer|)))
          (|linmat| (|Matrix| F)) (|ndim1| (|NonNegativeInteger|))
          (|ndim| (|PositiveInteger|)) (#8=#:G767 NIL)
          (|nvp| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |nvp| (SPADCALL |x| (QREFELT $ 69))
                  . #9=(|LGROBP;minPol;2LOvlHdmp;5|))
            (LETT |f| (|spadConstant| $ 42) . #9#)
            (LETT |omult| (|spadConstant| $ 13) . #9#)
            (LETT |ndim|
                  (PROG1 (LETT #8# (LENGTH |algBasis|) . #9#)
                    (|check_subtype2| (> #8# 0) '(|PositiveInteger|)
                                      '(|NonNegativeInteger|) #8#))
                  . #9#)
            (LETT |ndim1| (+ |ndim| 1) . #9#)
            (LETT |linmat| (SPADCALL |ndim| (+ (* 2 |ndim|) 1) (QREFELT $ 44))
                  . #9#)
            (SPADCALL |linmat| 1 1 (|spadConstant| $ 13) (QREFELT $ 45))
            (SPADCALL |linmat| 1 |ndim1| (|spadConstant| $ 13) (QREFELT $ 45))
            (LETT |pivots| (MAKEARR1 |ndim| 0) . #9#)
            (SPADCALL |pivots| 1 1 (QREFELT $ 46))
            (EXIT
             (SEQ (LETT |i| 2 . #9#) (LETT #7# |ndim1| . #9#) G190
                  (COND ((|greater_SI| |i| #7#) (GO G191)))
                  (SEQ
                   (LETT |recf|
                         (|LGROBP;rRedPol| (SPADCALL |f| |nvp| (QREFELT $ 52))
                          |oldBasis| $)
                         . #9#)
                   (LETT |omult|
                         (SPADCALL (QCDR |recf|) |omult| (QREFELT $ 22)) . #9#)
                   (LETT |f| (QCAR |recf|) . #9#)
                   (LETT |cc|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 53)) |omult|
                                   (QREFELT $ 54))
                         . #9#)
                   (LETT |f|
                         (PROG2
                             (LETT #6# (SPADCALL |f| |cc| (QREFELT $ 55))
                                   . #9#)
                             (QCDR #6#)
                           (|check_union2| (QEQCAR #6# 0)
                                           (|HomogeneousDistributedMultivariatePolynomial|
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|Union|
                                            (|HomogeneousDistributedMultivariatePolynomial|
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            "failed")
                                           #6#))
                         . #9#)
                   (LETT |omult|
                         (PROG2
                             (LETT #5# (SPADCALL |omult| |cc| (QREFELT $ 24))
                                   . #9#)
                             (QCDR #5#)
                           (|check_union2| (QEQCAR #5# 0) (QREFELT $ 7)
                                           (|Union| (QREFELT $ 7) "failed")
                                           #5#))
                         . #9#)
                   (LETT |veccoef| (SPADCALL |f| |algBasis| (QREFELT $ 56))
                         . #9#)
                   (LETT |lm| (SPADCALL (+ (* 2 |ndim|) 1) (QREFELT $ 57))
                         . #9#)
                   (SEQ (LETT |j| 1 . #9#) (LETT #4# |ndim| . #9#) G190
                        (COND ((|greater_SI| |j| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |lm| |j|
                                    (SPADCALL |veccoef| |j| (QREFELT $ 21))
                                    (QREFELT $ 25))))
                        (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                        (EXIT NIL))
                   (SPADCALL |lm| (+ |ndim| |i|) |omult| (QREFELT $ 25))
                   (LETT |lm|
                         (|LGROBP;reduceRow| |linmat| |lm| (- |i| 1) |pivots|
                          $)
                         . #9#)
                   (LETT |j| 1 . #9#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND
                            ((SPADCALL (SPADCALL |lm| |j| (QREFELT $ 21))
                                       (|spadConstant| $ 14) (QREFELT $ 58))
                             (< |j| |ndim1|))
                            ('T NIL)))
                          (GO G191)))
                        (SEQ (EXIT (LETT |j| (+ |j| 1) . #9#))) NIL (GO G190)
                        G191 (EXIT NIL))
                   (COND
                    ((EQL |j| |ndim1|)
                     (PROGN
                      (LETT #1#
                            (SEQ (LETT |g| (|spadConstant| $ 32) . #9#)
                                 (SEQ (LETT |k| |ndim1| . #9#)
                                      (LETT #3# (+ (* 2 |ndim|) 1) . #9#) G190
                                      (COND ((> |k| #3#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |g|
                                              (SPADCALL |g|
                                                        (SPADCALL
                                                         (SPADCALL |lm| |k|
                                                                   (QREFELT $
                                                                            21))
                                                         (SPADCALL |nvp|
                                                                   (PROG1
                                                                       (LETT
                                                                        #2#
                                                                        (- |k|
                                                                           |ndim1|)
                                                                        . #9#)
                                                                     (|check_subtype2|
                                                                      (>= #2#
                                                                          0)
                                                                      '(|NonNegativeInteger|)
                                                                      '(|Integer|)
                                                                      #2#))
                                                                   (QREFELT $
                                                                            70))
                                                         (QREFELT $ 37))
                                                        (QREFELT $ 38))
                                              . #9#)))
                                      (LETT |k| (+ |k| 1) . #9#) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (SPADCALL |g| (QREFELT $ 71))))
                            . #9#)
                      (GO #10=#:G783))))
                   (SPADCALL |pivots| |i| |j| (QREFELT $ 46))
                   (EXIT (SPADCALL |linmat| |i| |lm| (QREFELT $ 65))))
                  (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL)))))
          #10# (EXIT #1#)))) 

(SDEFUN |LGROBP;transform;DmpHdmp;6|
        ((|dpol| |DistributedMultivariatePolynomial| |lv| F)
         ($ |HomogeneousDistributedMultivariatePolynomial| |lv| F))
        (COND
         ((SPADCALL |dpol| (|spadConstant| $ 61) (QREFELT $ 72))
          (|spadConstant| $ 32))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |dpol| (QREFELT $ 73))
                     (SPADCALL
                      (SPADCALL (SPADCALL |dpol| (QREFELT $ 75))
                                (QREFELT $ 77))
                      (QREFELT $ 79))
                     (QREFELT $ 80))
           (SPADCALL (SPADCALL |dpol| (QREFELT $ 63)) (QREFELT $ 51))
           (QREFELT $ 38))))) 

(SDEFUN |LGROBP;computeBasis;2L;7|
        ((B |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         ($ |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
        (SPROG
         ((|result|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|part|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#1=#:G805 NIL) (|var| NIL)
          (|mB|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#2=#:G804 NIL) (|f| NIL) (#3=#:G803 NIL))
         (SEQ
          (LETT |mB|
                (PROGN
                 (LETT #3# NIL . #4=(|LGROBP;computeBasis;2L;7|))
                 (SEQ (LETT |f| NIL . #4#) (LETT #2# B . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL (|spadConstant| $ 13)
                                         (SPADCALL |f| (QREFELT $ 81))
                                         (QREFELT $ 80))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (LETT |result| (LIST (|spadConstant| $ 42)) . #4#)
          (SEQ (LETT |var| NIL . #4#) (LETT #1# (QREFELT $ 12) . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |var| (CAR #1#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |part| (SPADCALL |var| |result| |mB| (QREFELT $ 82))
                      . #4#)
                (EXIT
                 (LETT |result| (SPADCALL |result| |part| (QREFELT $ 83))
                       . #4#)))
               (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |result|)))) 

(SDEFUN |LGROBP;intcompBasis;Ovl3L;8|
        ((|x| |OrderedVariableList| |lv|)
         (|lr| |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (|mB| |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         ($ |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
        (SPROG
         ((|part|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#1=#:G810 NIL) (|f| NIL))
         (SEQ
          (COND ((SPADCALL |lr| NIL (QREFELT $ 84)) |lr|)
                ('T
                 (SEQ (LETT |part| NIL . #2=(|LGROBP;intcompBasis;Ovl3L;8|))
                      (SEQ (LETT |f| NIL . #2#) (LETT #1# |lr| . #2#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |g|
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 69)) |f|
                                            (QREFELT $ 52))
                                  . #2#)
                            (EXIT
                             (COND
                              ((SPADCALL
                                (QCAR (SPADCALL |g| |mB| (QREFELT $ 31)))
                                (|spadConstant| $ 32) (QREFELT $ 85))
                               (LETT |part| (CONS |g| |part|) . #2#)))))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (SPADCALL |part|
                                 (SPADCALL |x| |part| |mB| (QREFELT $ 82))
                                 (QREFELT $ 83))))))))) 

(SDEFUN |LGROBP;coord;HdmpLV;9|
        ((|f| |HomogeneousDistributedMultivariatePolynomial| |lv| F)
         (B |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         ($ |Vector| F))
        (SPROG
         ((|i| (|Integer|)) (|lcf| (F))
          (|lf| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (|rf| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (|vv| (|Vector| F)) (|ndim| (|NonNegativeInteger|)))
         (SEQ (LETT |ndim| (LENGTH B) . #1=(|LGROBP;coord;HdmpLV;9|))
              (LETT |vv| (MAKEARR1 |ndim| (|spadConstant| $ 14)) . #1#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |f| (|spadConstant| $ 32) (QREFELT $ 85)))
                     (GO G191)))
                   (SEQ (LETT |rf| (SPADCALL |f| (QREFELT $ 35)) . #1#)
                        (LETT |lf| (SPADCALL |f| |rf| (QREFELT $ 36)) . #1#)
                        (LETT |lcf| (SPADCALL |f| (QREFELT $ 86)) . #1#)
                        (LETT |i|
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 13)
                                         (SPADCALL |lf| (QREFELT $ 81))
                                         (QREFELT $ 80))
                               B (QREFELT $ 87))
                              . #1#)
                        (SPADCALL |vv| |i| |lcf| (QREFELT $ 25))
                        (EXIT (LETT |f| |rf| . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |vv|)))) 

(SDEFUN |LGROBP;anticoord;LDmpLDmp;10|
        ((|vv| |List| F) (|mf| |DistributedMultivariatePolynomial| |lv| F)
         (B |List| (|DistributedMultivariatePolynomial| |lv| F))
         ($ |DistributedMultivariatePolynomial| |lv| F))
        (SPROG ((#1=#:G822 NIL) (|f| NIL) (#2=#:G823 NIL) (|c| NIL))
               (SEQ
                (SEQ (LETT |c| NIL . #3=(|LGROBP;anticoord;LDmpLDmp;10|))
                     (LETT #2# |vv| . #3#) (LETT |f| NIL . #3#)
                     (LETT #1# B . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL)
                           (ATOM #2#) (PROGN (LETT |c| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |mf|
                             (SPADCALL |mf| (SPADCALL |c| |f| (QREFELT $ 59))
                                       (QREFELT $ 64))
                             . #3#)))
                     (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                           . #3#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |mf|)))) 

(SDEFUN |LGROBP;choosemon;DmpLDmp;11|
        ((|mf| |DistributedMultivariatePolynomial| |lv| F)
         (|nB| |List| (|DistributedMultivariatePolynomial| |lv| F))
         ($ |DistributedMultivariatePolynomial| |lv| F))
        (SPROG
         ((#1=#:G829 NIL) (|dx| (|NonNegativeInteger|)) (#2=#:G835 NIL)
          (|xx| (|DistributedMultivariatePolynomial| |lv| F)) (#3=#:G836 NIL)
          (|x| NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |nB| NIL (QREFELT $ 90))
             (SPADCALL
              (SPADCALL (SPADCALL (QREFELT $ 12) '|last| (QREFELT $ 93))
                        (QREFELT $ 94))
              |mf| (QREFELT $ 95)))
            ('T
             (SEQ
              (SEQ (LETT |x| NIL . #4=(|LGROBP;choosemon;DmpLDmp;11|))
                   (LETT #3# (REVERSE (QREFELT $ 12)) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |xx| (SPADCALL |x| (QREFELT $ 94)) . #4#)
                        (LETT |mf| (SPADCALL |xx| |mf| (QREFELT $ 95)) . #4#)
                        (COND
                         ((SPADCALL (QCAR (SPADCALL |mf| |nB| (QREFELT $ 98)))
                                    (|spadConstant| $ 61) (QREFELT $ 49))
                          (PROGN (LETT #2# |mf| . #4#) (GO #5=#:G834))))
                        (LETT |dx| (SPADCALL |mf| |x| (QREFELT $ 99)) . #4#)
                        (EXIT
                         (LETT |mf|
                               (PROG2
                                   (LETT #1#
                                         (SPADCALL |mf|
                                                   (SPADCALL |xx| |dx|
                                                             (QREFELT $ 100))
                                                   (QREFELT $ 50))
                                         . #4#)
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0)
                                                 (|DistributedMultivariatePolynomial|
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|Union|
                                                  (|DistributedMultivariatePolynomial|
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  "failed")
                                                 #1#))
                               . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |mf|)))))
          #5# (EXIT #2#)))) 

(SDEFUN |LGROBP;linGenPos;LR;12|
        ((B |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         ($ |Record|
          (|:| |gblist| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|:| |gvlist| (|List| (|Integer|)))))
        (SPROG
         ((|nBasis| (|List| #1=(|DistributedMultivariatePolynomial| |lv| F)))
          (|i| (|NonNegativeInteger|))
          (|ltresult| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|result| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|antc| #2=(|DistributedMultivariatePolynomial| |lv| F))
          (#3=#:G861 NIL) (#4=#:G860 #2#) (#5=#:G862 #2#) (#6=#:G876 NIL)
          (|c| (|Integer|)) (#7=#:G877 NIL) (|b| NIL) (|cordlist| (|List| F))
          (#8=#:G875 NIL) (|j| (|NonNegativeInteger|)) (#9=#:G874 NIL)
          (|lm| (|Vector| F)) (#10=#:G873 NIL)
          (|orecfmon|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F)))
          (|ofirstmon| #1#) (|veccoef| (|Vector| F)) (#11=#:G854 NIL)
          (#12=#:G851 NIL) (|cc| (F))
          (|recfmon|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F)))
          (|v| (|Union| (|DistributedMultivariatePolynomial| |lv| F) "failed"))
          (|firstmon| #1#) (|lx| (|OrderedVariableList| |lv|))
          (|nval| (|DistributedMultivariatePolynomial| |lv| F))
          (#13=#:G843 NIL)
          (#14=#:G842 #15=(|DistributedMultivariatePolynomial| |lv| F))
          (#16=#:G844 #15#) (#17=#:G871 NIL) (|r| NIL) (#18=#:G872 NIL)
          (|vv| NIL) (|rval| (|List| (|Integer|))) (#19=#:G870 NIL) (|ii| NIL)
          (|pivots| (|Vector| (|Integer|))) (|linmat| (|Matrix| F))
          (|ndim1| (|NonNegativeInteger|)) (|ndim| (|PositiveInteger|))
          (#20=#:G838 NIL)
          (|vBasis|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
         (SEQ (LETT |result| NIL . #21=(|LGROBP;linGenPos;LR;12|))
              (LETT |ltresult| NIL . #21#)
              (LETT |vBasis| (SPADCALL B (QREFELT $ 39)) . #21#)
              (LETT |nBasis| (LIST (|spadConstant| $ 41)) . #21#)
              (LETT |ndim|
                    (PROG1 (LETT #20# (LENGTH |vBasis|) . #21#)
                      (|check_subtype2| (> #20# 0) '(|PositiveInteger|)
                                        '(|NonNegativeInteger|) #20#))
                    . #21#)
              (LETT |ndim1| (+ |ndim| 1) . #21#)
              (LETT |linmat|
                    (SPADCALL |ndim| (+ (* 2 |ndim|) 1) (QREFELT $ 44)) . #21#)
              (SPADCALL |linmat| 1 1 (|spadConstant| $ 13) (QREFELT $ 45))
              (SPADCALL |linmat| 1 |ndim1| (|spadConstant| $ 13)
                        (QREFELT $ 45))
              (LETT |pivots| (MAKEARR1 |ndim| 0) . #21#)
              (SPADCALL |pivots| 1 1 (QREFELT $ 46)) (LETT |i| 2 . #21#)
              (LETT |rval| NIL . #21#)
              (SEQ (LETT |ii| 1 . #21#)
                   (LETT #19# (- (LENGTH (QREFELT $ 12)) 1) . #21#) G190
                   (COND ((|greater_SI| |ii| #19#) (GO G191)))
                   (SEQ (LETT |c| 0 . #21#)
                        (SEQ G190 (COND ((NULL (EQL |c| 0)) (GO G191)))
                             (SEQ (EXIT (LETT |c| (RANDOM 11) . #21#))) NIL
                             (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |rval| (CONS |c| |rval|) . #21#)))
                   (LETT |ii| (|inc_SI| |ii|) . #21#) (GO G190) G191
                   (EXIT NIL))
              (LETT |nval|
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 101))
                               (QREFELT $ 94))
                     (PROGN
                      (LETT #13# NIL . #21#)
                      (SEQ (LETT |vv| NIL . #21#)
                           (LETT #18# (QREFELT $ 12) . #21#)
                           (LETT |r| NIL . #21#) (LETT #17# |rval| . #21#) G190
                           (COND
                            ((OR (ATOM #17#)
                                 (PROGN (LETT |r| (CAR #17#) . #21#) NIL)
                                 (ATOM #18#)
                                 (PROGN (LETT |vv| (CAR #18#) . #21#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #16#
                                    (SPADCALL |r|
                                              (SPADCALL |vv| (QREFELT $ 94))
                                              (QREFELT $ 102))
                                    . #21#)
                              (COND
                               (#13#
                                (LETT #14# (SPADCALL #14# #16# (QREFELT $ 60))
                                      . #21#))
                               ('T
                                (PROGN
                                 (LETT #14# #16# . #21#)
                                 (LETT #13# 'T . #21#)))))))
                           (LETT #17#
                                 (PROG1 (CDR #17#)
                                   (LETT #18# (CDR #18#) . #21#))
                                 . #21#)
                           (GO G190) G191 (EXIT NIL))
                      (COND (#13# #14#) ('T (|spadConstant| $ 61))))
                     (QREFELT $ 64))
                    . #21#)
              (LETT |firstmon| (|spadConstant| $ 41) . #21#)
              (LETT |ofirstmon| (|spadConstant| $ 41) . #21#)
              (LETT |orecfmon|
                    (CONS (|spadConstant| $ 42) (|spadConstant| $ 13)) . #21#)
              (LETT |lx| (SPADCALL (QREFELT $ 12) '|last| (QREFELT $ 93))
                    . #21#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL
                       (LETT |firstmon|
                             (SPADCALL |firstmon| |ltresult| (QREFELT $ 48))
                             . #21#)
                       (|spadConstant| $ 41) (QREFELT $ 49)))
                     (GO G191)))
                   (SEQ
                    (SEQ
                     (LETT |v| (SPADCALL |firstmon| |ofirstmon| (QREFELT $ 50))
                           . #21#)
                     (EXIT
                      (COND
                       ((QEQCAR |v| 1)
                        (LETT |recfmon|
                              (|LGROBP;rRedPol|
                               (SPADCALL
                                (SPADCALL |firstmon| |lx| |nval|
                                          (QREFELT $ 103))
                                (QREFELT $ 51))
                               B $)
                              . #21#))
                       ('T
                        (SEQ
                         (LETT |recfmon|
                               (|LGROBP;rRedPol|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (QCDR |v|) |lx| |nval|
                                            (QREFELT $ 103))
                                  (QREFELT $ 51))
                                 (QCAR |orecfmon|) (QREFELT $ 52))
                                B $)
                               . #21#)
                         (EXIT
                          (PROGN
                           (RPLACD |recfmon|
                                   (SPADCALL (QCDR |recfmon|) (QCDR |orecfmon|)
                                             (QREFELT $ 22)))
                           (QCDR |recfmon|))))))))
                    (LETT |cc|
                          (SPADCALL (SPADCALL (QCAR |recfmon|) (QREFELT $ 53))
                                    (QCDR |recfmon|) (QREFELT $ 54))
                          . #21#)
                    (PROGN
                     (RPLACA |recfmon|
                             (PROG2
                                 (LETT #12#
                                       (SPADCALL (QCAR |recfmon|) |cc|
                                                 (QREFELT $ 55))
                                       . #21#)
                                 (QCDR #12#)
                               (|check_union2| (QEQCAR #12# 0)
                                               (|HomogeneousDistributedMultivariatePolynomial|
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|Union|
                                                (|HomogeneousDistributedMultivariatePolynomial|
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                "failed")
                                               #12#)))
                     (QCAR |recfmon|))
                    (PROGN
                     (RPLACD |recfmon|
                             (PROG2
                                 (LETT #11#
                                       (SPADCALL (QCDR |recfmon|) |cc|
                                                 (QREFELT $ 24))
                                       . #21#)
                                 (QCDR #11#)
                               (|check_union2| (QEQCAR #11# 0) (QREFELT $ 7)
                                               (|Union| (QREFELT $ 7) "failed")
                                               #11#)))
                     (QCDR |recfmon|))
                    (LETT |veccoef|
                          (SPADCALL (QCAR |recfmon|) |vBasis| (QREFELT $ 56))
                          . #21#)
                    (LETT |ofirstmon| |firstmon| . #21#)
                    (LETT |orecfmon| |recfmon| . #21#)
                    (LETT |lm| (SPADCALL (+ (* 2 |ndim|) 1) (QREFELT $ 57))
                          . #21#)
                    (SEQ (LETT |j| 1 . #21#) (LETT #10# |ndim| . #21#) G190
                         (COND ((|greater_SI| |j| #10#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |lm| |j|
                                     (SPADCALL |veccoef| |j| (QREFELT $ 21))
                                     (QREFELT $ 25))))
                         (LETT |j| (|inc_SI| |j|) . #21#) (GO G190) G191
                         (EXIT NIL))
                    (SPADCALL |lm| (+ |ndim| |i|) (QCDR |recfmon|)
                              (QREFELT $ 25))
                    (LETT |lm|
                          (|LGROBP;reduceRow| |linmat| |lm| (- |i| 1) |pivots|
                           $)
                          . #21#)
                    (LETT |j| 1 . #21#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((SPADCALL (SPADCALL |lm| |j| (QREFELT $ 21))
                                        (|spadConstant| $ 14) (QREFELT $ 58))
                              (< |j| |ndim1|))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |j| (+ |j| 1) . #21#))) NIL (GO G190)
                         G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((EQL |j| |ndim1|)
                       (SEQ
                        (LETT |cordlist|
                              (PROGN
                               (LETT #9# NIL . #21#)
                               (SEQ (LETT |j| |ndim1| . #21#)
                                    (LETT #8# (+ |ndim1| (LENGTH |nBasis|))
                                          . #21#)
                                    G190 (COND ((> |j| #8#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #9#
                                            (CONS
                                             (SPADCALL |lm| |j| (QREFELT $ 21))
                                             #9#)
                                            . #21#)))
                                    (LETT |j| (+ |j| 1) . #21#) (GO G190) G191
                                    (EXIT (NREVERSE #9#))))
                              . #21#)
                        (LETT |antc|
                              (PROGN
                               (LETT #3# NIL . #21#)
                               (SEQ (LETT |b| NIL . #21#)
                                    (LETT #7# (CONS |firstmon| |nBasis|)
                                          . #21#)
                                    (LETT |c| NIL . #21#)
                                    (LETT #6# (REVERSE |cordlist|) . #21#) G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN
                                           (LETT |c| (CAR #6#) . #21#)
                                           NIL)
                                          (ATOM #7#)
                                          (PROGN
                                           (LETT |b| (CAR #7#) . #21#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #5#
                                             (SPADCALL |c| |b| (QREFELT $ 59))
                                             . #21#)
                                       (COND
                                        (#3#
                                         (LETT #4#
                                               (SPADCALL #4# #5#
                                                         (QREFELT $ 60))
                                               . #21#))
                                        ('T
                                         (PROGN
                                          (LETT #4# #5# . #21#)
                                          (LETT #3# 'T . #21#)))))))
                                    (LETT #6#
                                          (PROG1 (CDR #6#)
                                            (LETT #7# (CDR #7#) . #21#))
                                          . #21#)
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#3# #4#) ('T (|spadConstant| $ 61))))
                              . #21#)
                        (LETT |result|
                              (CONS (SPADCALL |antc| (QREFELT $ 62)) |result|)
                              . #21#)
                        (EXIT
                         (LETT |ltresult|
                               (CONS
                                (SPADCALL |antc|
                                          (SPADCALL |antc| (QREFELT $ 63))
                                          (QREFELT $ 64))
                                |ltresult|)
                               . #21#))))
                      ('T
                       (SEQ (SPADCALL |pivots| |i| |j| (QREFELT $ 46))
                            (SPADCALL |linmat| |i| |lm| (QREFELT $ 65))
                            (LETT |i| (+ |i| 1) . #21#)
                            (EXIT
                             (LETT |nBasis| (CONS |firstmon| |nBasis|)
                                   . #21#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |result| |rval|))))) 

(SDEFUN |LGROBP;groebgen;LR;13|
        ((L |List| (|DistributedMultivariatePolynomial| |lv| F))
         ($ |Record|
          (|:| |glbase| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|:| |glval| (|List| (|Integer|)))))
        (SPROG
         ((LL (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (#1=#:G893 NIL) (|f| NIL) (#2=#:G892 NIL)
          (|val| (|DistributedMultivariatePolynomial| |lv| F)) (#3=#:G882 NIL)
          (#4=#:G881 #5=(|DistributedMultivariatePolynomial| |lv| F))
          (#6=#:G883 #5#) (#7=#:G891 NIL) (|i| NIL) (|ll| (|List| (|Integer|)))
          (#8=#:G890 NIL) (#9=#:G889 NIL) (|nvar1| (|NonNegativeInteger|))
          (#10=#:G879 NIL) (|xn| (|OrderedVariableList| |lv|)))
         (SEQ
          (LETT |xn| (SPADCALL (QREFELT $ 12) '|last| (QREFELT $ 93))
                . #11=(|LGROBP;groebgen;LR;13|))
          (LETT |val| (SPADCALL |xn| (QREFELT $ 94)) . #11#)
          (LETT |nvar1|
                (PROG1 (LETT #10# (- (LENGTH (QREFELT $ 12)) 1) . #11#)
                  (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #10#))
                . #11#)
          (LETT |ll|
                (PROGN
                 (LETT #9# NIL . #11#)
                 (SEQ (LETT |i| 1 . #11#) (LETT #8# |nvar1| . #11#) G190
                      (COND ((|greater_SI| |i| #8#) (GO G191)))
                      (SEQ (EXIT (LETT #9# (CONS (RANDOM 11) #9#) . #11#)))
                      (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #11#)
          (LETT |val|
                (SPADCALL |val|
                          (PROGN
                           (LETT #3# NIL . #11#)
                           (SEQ (LETT |i| 1 . #11#) (LETT #7# |nvar1| . #11#)
                                G190 (COND ((|greater_SI| |i| #7#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #6#
                                         (SPADCALL
                                          (SPADCALL |ll| |i| (QREFELT $ 107))
                                          (SPADCALL
                                           (SPADCALL (QREFELT $ 12) |i|
                                                     (QREFELT $ 108))
                                           (QREFELT $ 94))
                                          (QREFELT $ 102))
                                         . #11#)
                                   (COND
                                    (#3#
                                     (LETT #4#
                                           (SPADCALL #4# #6# (QREFELT $ 60))
                                           . #11#))
                                    ('T
                                     (PROGN
                                      (LETT #4# #6# . #11#)
                                      (LETT #3# 'T . #11#)))))))
                                (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#3# #4#) ('T (|spadConstant| $ 61))))
                          (QREFELT $ 60))
                . #11#)
          (LETT LL
                (PROGN
                 (LETT #2# NIL . #11#)
                 (SEQ (LETT |f| NIL . #11#) (LETT #1# L . #11#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |f| |xn| (QREFELT $ 110))
                                         |val| (QREFELT $ 112))
                               #2#)
                              . #11#)))
                      (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #11#)
          (LETT LL (SPADCALL LL (QREFELT $ 114)) . #11#)
          (EXIT (CONS LL |ll|))))) 

(DECLAIM (NOTINLINE |LinGroebnerPackage;|)) 

(DEFUN |LinGroebnerPackage| (&REST #1=#:G896)
  (SPROG NIL
         (PROG (#2=#:G897)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinGroebnerPackage|)
                                               '|domainEqualList|)
                    . #3=(|LinGroebnerPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LinGroebnerPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LinGroebnerPackage|)))))))))) 

(DEFUN |LinGroebnerPackage;| (|#1| |#2|)
  (SPROG
   ((#1=#:G701 NIL) (#2=#:G895 NIL) (|yx| NIL) (#3=#:G894 NIL) (|pv$| NIL)
    ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #4=(|LinGroebnerPackage|))
     (LETT DV$2 (|devaluate| |#2|) . #4#)
     (LETT |dv$| (LIST '|LinGroebnerPackage| DV$1 DV$2) . #4#)
     (LETT $ (GETREFV 117) . #4#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #4#))
     (|haddProp| |$ConstructorCache| '|LinGroebnerPackage| (LIST DV$1 DV$2)
                 (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 12
               (PROGN
                (LETT #3# NIL . #4#)
                (SEQ (LETT |yx| NIL . #4#) (LETT #2# |#1| . #4#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |yx| (CAR #2#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #3#
                             (CONS
                              (PROG2
                                  (LETT #1# (SPADCALL |yx| (QREFELT $ 11))
                                        . #4#)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0)
                                                (|OrderedVariableList|
                                                 (SPADCALL |yx|
                                                           (QREFELT $ 11)))
                                                (|Union|
                                                 (|OrderedVariableList|
                                                  (SPADCALL |yx|
                                                            (QREFELT $ 11)))
                                                 "failed")
                                                #1#))
                              #3#)
                             . #4#)))
                     (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                     (EXIT (NREVERSE #3#)))))
     $)))) 

(MAKEPROP '|LinGroebnerPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| $ '"failed") (|Symbol|) (|OrderedVariableList| 6)
              (0 . |variable|) '|lvar| (5 . |One|) (9 . |Zero|) (|Vector| 7)
              (|Integer|) (|Matrix| 7) (13 . |row|) (|Vector| 16) (19 . |elt|)
              (25 . |elt|) (31 . *) (37 . -) (42 . |exquo|) (48 . |setelt!|)
              (55 . -) (|Record| (|:| |poly| 28) (|:| |mult| 7))
              (|HomogeneousDistributedMultivariatePolynomial| 6 7) (|List| 28)
              (|GroebnerInternalPackage| 7 78 10 28) (61 . |redPo|)
              (67 . |Zero|) (|Boolean|) (71 . =) (77 . |reductum|) (82 . -)
              (88 . *) (94 . +) |LGROBP;computeBasis;2L;7|
              (|DistributedMultivariatePolynomial| 6 7) (100 . |One|)
              (104 . |One|) (|NonNegativeInteger|) (108 . |zero|)
              (114 . |setelt!|) (122 . |setelt!|) (|List| 40)
              |LGROBP;choosemon;DmpLDmp;11| (129 . ~=) (135 . |exquo|)
              |LGROBP;transform;DmpHdmp;6| (141 . *) (147 . |content|)
              (152 . |gcd|) (158 . |exquo|) |LGROBP;coord;HdmpLV;9|
              (164 . |zero|) (169 . =) (175 . *) (181 . +) (187 . |Zero|)
              (191 . |primitivePart|) (196 . |reductum|) (201 . -)
              (207 . |setRow!|) |LGROBP;totolex;LL;3|
              |LGROBP;minPol;2LOvlHdmp;5| |LGROBP;minPol;LOvlHdmp;4|
              (214 . |coerce|) (219 . ^) (225 . |primitivePart|) (230 . =)
              (236 . |leadingCoefficient|)
              (|DirectProduct| (NRTEVAL (LENGTH (QREFELT $ 6))) 43)
              (241 . |degree|) (|Vector| 43) (246 . |coerce|)
              (|HomogeneousDirectProduct| (NRTEVAL (LENGTH (QREFELT $ 6))) 43)
              (251 . |directProduct|) (256 . |monomial|) (262 . |degree|)
              |LGROBP;intcompBasis;Ovl3L;8| (267 . |concat|) (273 . =)
              (279 . ~=) (285 . |leadingCoefficient|) (290 . |position|)
              (|List| 7) |LGROBP;anticoord;LDmpLDmp;10| (296 . =) '"last"
              (|List| 10) (302 . |elt|) (308 . |coerce|) (313 . *)
              (|Record| (|:| |poly| 40) (|:| |mult| 7))
              (|GroebnerInternalPackage| 7 74 10 40) (319 . |redPo|)
              (325 . |degree|) (331 . ^) (337 . |last|) (342 . *)
              (348 . |eval|) (|Record| (|:| |gblist| 47) (|:| |gvlist| 106))
              |LGROBP;linGenPos;LR;12| (|List| 16) (355 . |elt|) (361 . |elt|)
              (|SparseUnivariatePolynomial| $) (367 . |univariate|)
              (|SparseUnivariatePolynomial| 40) (373 . |elt|)
              (|GroebnerPackage| 7 74 10 40) (379 . |groebner|)
              (|Record| (|:| |glbase| 47) (|:| |glval| 106))
              |LGROBP;groebgen;LR;13|)
           '#(|transform| 384 |totolex| 389 |minPol| 394 |linGenPos| 407
              |intcompBasis| 412 |groebgen| 419 |coord| 424 |computeBasis| 430
              |choosemon| 435 |anticoord| 441)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 116
                                                 '(1 10 8 9 11 0 7 0 13 0 7 0
                                                   14 2 17 15 0 16 18 2 19 16 0
                                                   16 20 2 15 7 0 16 21 2 7 0 0
                                                   0 22 1 7 0 0 23 2 7 8 0 0 24
                                                   3 15 7 0 16 7 25 2 7 0 0 0
                                                   26 2 30 27 28 29 31 0 28 0
                                                   32 2 28 33 0 0 34 1 28 0 0
                                                   35 2 28 0 0 0 36 2 28 0 7 0
                                                   37 2 28 0 0 0 38 0 40 0 41 0
                                                   28 0 42 2 17 0 43 43 44 4 17
                                                   7 0 16 16 7 45 3 19 16 0 16
                                                   16 46 2 40 33 0 0 49 2 40 8
                                                   0 0 50 2 28 0 0 0 52 1 28 7
                                                   0 53 2 7 0 0 0 54 2 28 8 0 7
                                                   55 1 15 0 43 57 2 7 33 0 0
                                                   58 2 40 0 7 0 59 2 40 0 0 0
                                                   60 0 40 0 61 1 40 0 0 62 1
                                                   40 0 0 63 2 40 0 0 0 64 3 17
                                                   0 0 16 15 65 1 28 0 10 69 2
                                                   28 0 0 43 70 1 28 0 0 71 2
                                                   40 33 0 0 72 1 40 7 0 73 1
                                                   40 74 0 75 1 74 76 0 77 1 78
                                                   0 76 79 2 28 0 7 78 80 1 28
                                                   78 0 81 2 29 0 0 0 83 2 29
                                                   33 0 0 84 2 28 33 0 0 85 1
                                                   28 7 0 86 2 29 16 28 0 87 2
                                                   47 33 0 0 90 2 92 10 0 91 93
                                                   1 40 0 10 94 2 40 0 0 0 95 2
                                                   97 96 40 47 98 2 40 43 0 10
                                                   99 2 40 0 0 43 100 1 92 10 0
                                                   101 2 40 0 16 0 102 3 40 0 0
                                                   10 0 103 2 106 16 0 16 107 2
                                                   92 10 0 16 108 2 40 109 0 10
                                                   110 2 111 40 0 40 112 1 113
                                                   47 47 114 1 0 28 40 51 1 0
                                                   47 29 66 2 0 28 29 10 68 3 0
                                                   28 29 29 10 67 1 0 104 29
                                                   105 3 0 29 10 29 29 82 1 0
                                                   115 47 116 2 0 15 28 29 56 1
                                                   0 29 29 39 2 0 40 40 47 48 3
                                                   0 40 88 40 47 89)))))
           '|lookupComplete|)) 
